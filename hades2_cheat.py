#!/usr/bin/env python3
# vim: set expandtab tabstop=4 shiftwidth=4:

# Hades II Cheat Injector
# Copyright (C) 2025 CJ Kucera 
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the development team nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL CJ KUCERA BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import os
import re
import io
import sys
import math
import codecs
import chardet
import argparse


# We use the `match` statement introduced in 3.10
if sys.version_info < (3, 10):
    raise RuntimeError('This utility requires at least Python 3.10')


class Action:
    """
    Base Action class to process our templates; unusuable on
    its own.
    """

    def __init__(self, use_default=False):
        """
        Setting `use_default = True` will cause the action to
        always just use the default -- this could be useful if
        you want to stop modifying some attributes but retain the
        config in the file here.
        """
        self.use_default = use_default

    def desc(self):
        if self.use_default:
            return '{} (disabled, using defaults)'.format(self._desc())
        else:
            return self._desc()

    def _desc(self):
        raise NotImplementedError('Implement this!')

    def _process(self, name, default):
        raise NotImplementedError('Implement this!')

    def process(self, name, default, use_default=False):
        if use_default or self.use_default:
            return default
        else:
            return self._process(name, default)


class ActionDefault(Action):
    """
    An Action which always returns the default value
    """

    def __init__(self):
        super().__init__(True)

    def desc(self):
        """
        Overriding the default behavior here
        """
        return 'Always use default'

    def _process(self, name, default):
        """
        A bit silly to implement this, but I suppose this way it'll
        still default even if someone sets `use_default = True`
        """
        return default


class ActionScaleInt(Action):
    """
    An action which scales by the specified factor and always returns
    an integer (rounding if needed: >=x.5 will round up, <x.5 will
    round down).
    """

    def __init__(self, scale, inverse=False, use_default=False):
        """
        Specify `inverse = True` to scale down by the given factor
        rather than up.
        """
        super().__init__(use_default)
        self.inverse = inverse
        if inverse:
            self.scale = 1/scale
        else:
            self.scale = scale

    def _desc(self):
        return f'Scale by {self.scale}'

    def _process(self, name, default):
        new_val = float(default) * self.scale
        # I like this better than the `round()` builtin because it handles .5
        # how I'd like.
        return math.floor(new_val + 0.5)


class ActionScaleFloat(ActionScaleInt):
    """
    An action which scales by the specified factor and returns a
    float.
    """

    def __init__(self, scale, inverse=False, precision=6, use_default=False):
        """
        `inverse` is the same as in ActionScaleInt.  Specify `precision` to
        determine how many decimal places to round to.
        """
        super().__init__(scale, inverse=inverse, use_default=use_default)
        self.precision = precision

    def _desc(self):
        fstring = f'Scale by {{:0.{self.precision}f}} as a float'
        return fstring.format(self.scale)

    def _process(self, name, default):
        new_val = float(default) * self.scale
        return round(new_val, self.precision)


class ActionHardcode(Action):
    """
    An action which hardcodes to the specified value
    """

    def __init__(self, val, use_default=False):
        """
        Pass in `val` for the value to hardcode.
        """
        super().__init__(use_default)
        self.val = val

    def _desc(self):
        return f'Hardcoded to: {self.val}'

    def _process(self, name, default):
        return self.val


class ActionMaximum(Action):
    """
    An action which uses the maximum value seen (either the default or
    the one specified here)
    """

    def __init__(self, val, use_default=False):
        """
        """
        super().__init__(use_default)
        self.val = val

    def _desc(self):
        return f'Maximum of either default or {self.val}'

    def _process(self, name, default):
        return max(float(default), self.val)


class ActionMinimum(Action):
    """
    An action which uses the minimum value seen (either the default or
    the one specified here)
    """

    def __init__(self, val, use_default=False):
        """
        """
        super().__init__(use_default)
        self.val = val

    def _desc(self):
        return f'Minimum of either default or {self.val}'

    def _process(self, name, default):
        return min(float(default), self.val)


class ActionGathering(Action):
    """
    Action to control how often we see "gathering" opportunities in locations.
    Specifically:
        - Harvesting plants
        - Fishing
        - Digging up seeds (with the shovel)
        - Mining ores/rocks (with the pickaxe)
        - Compelling/Exorcisng shades for Psyche

    There's a variety of components to this, and I actually don't have a
    perfect handle on it.

      1. First, most simply, there's the raw chance of getting a
         point-of-interest.

      2. Next there's a minimum "room distance" between instances of the
         same type of gathering.

      3. There's *also* generally a minimum room distance between *other*
         types of gathering.  In the vanilla game, for instance, you won't
         have a fishing spot in one room and then a digging area in the
         next.  Generally there's just a 1-room distance, but this class
         removes that buffer by default.

      4. Next, there's generally also a limit of gathering type per biome,
         which is generally set to 1.  There's occasional room types which
         are set to ignore this limit, but we bump it to 3 by default.

      5. Finally (and this is the main thing I don't yet understand), there's
         also a `ChanceToPlay` percentage which seems to be involved in
         the logic.  No clue yet what this does.  I *think* it's generally
         used to lower the possibility of these spawns once the player has
         already collected a certain amount of materials (across the whole
         playthrough).

    So, this action supports various macro names.  It matches on suffixes
    rather than full names, specifically:

        *_chance - The raw chance to spawn a POI
        *_distance - The room distance between same-POI instances
        *_biome_limit - The total number of this POI type shown in a biome
        *_other_lock - A bit of a weird one; used to alter the value that
            the other-POI-distance-check compares against.  This is always
            0 in the vanilla files; when this action is set to *not* limit
            distance in this way (the default), the value 999 is substituted
            instead.

    This option will not make the configuration any *worse* than the vanilla
    game.  If you set a really low spawn chance, for instance, any vanilla
    value that's higher will be kept.
    """

    def __init__(self,
            chance,
            room_distance=1,
            limit_others=False,
            biome_limit=3,
            use_default=False,
            ):
        """
        `chance` is the raw chance
        `room_distance` is the min room distance inbetween instances
        `limit_others` can be set to True to enforce room distance inbetween
            instances of *other* gathering types
        `biome_limit` can set the total number of instances in a biome for
            this type
        """
        super().__init__(use_default)
        self.chance = chance
        self.room_distance = room_distance
        self.limit_others = limit_others
        self.biome_limit = biome_limit

    def _desc(self):
        extras = []
        extras.append(f'room distance: {self.room_distance}')
        if self.limit_others:
            extras.append(f'spacing out from other POIs')
        extras.append(f'limit per biome: {self.biome_limit}')
        return 'Resource-gathering chance of {} ({})'.format(
                self.chance,
                ', '.join(extras),
                )

    def _process(self, name, default):
        if name.endswith('_chance'):
            return max(float(default), self.chance)
        elif name.endswith('_distance'):
            return min(float(default), self.room_distance)
        elif name.endswith('_biome_limit'):
            return max(float(default), self.biome_limit)
        elif name.endswith('_other_lock'):
            if self.limit_others:
                return default
            else:
                return 999
        else:
            raise RuntimeError(f'Unknown ActionGathering macro name: {name}')


class ActionGodMode(Action):
    """
    Action to handle our God Mode config.  Create one instance of
    this and bind it to multiple macro names.  Handles the following:
        godmode_base_scale
        godmode_per_death
        godmode_death_cap
    """

    def __init__(self, start_pct, end_pct, steps=30, use_default=False):
        """
        `start_pct` is the base damage scaling, and `end_pct` is the
        final damage scaling after dying `steps` times.  The effective
        defaults are 0.8 for `start_pct` and 0.2 for `end_pct`, though
        `end_pct` doesn't actually show up in the game's scripts at all.
        """
        super().__init__(use_default)
        self.start_pct = start_pct
        self.end_pct = end_pct
        self.steps = steps
        self.step = (self.end_pct-self.start_pct)/self.steps

    def _desc(self):
        return 'God Mode from {}% -> {}%, with {} steps'.format(
                int(self.start_pct*100),
                int(self.end_pct*100),
                self.steps,
                )

    def _process(self, name, default):
        match name:
            case 'godmode_base_scale':
                return self.start_pct
            case 'godmode_per_death':
                return round(self.step, 6)
            case 'godmode_death_cap':
                return self.steps
            case _:
                raise RuntimeError(f'Unknown GodMode macro name: {name}')


class TextProcessor:
    """
    ><

    So I want to recreate files as identically as possible.  This is a
    bit stupid of me given the various problems here -- Hades the game
    doesn't seem to actually care about a lot of this.  But I want my
    diffs to be as trivial as possible, so eh.  The problems:

        1. Newlines.  This should be easy, given Python's `newline`
           arg to `open()` but in practice I keep finding edge cases
           which result in messy diffs.  So I'm just handling it
           with a binary output file.  Fuck it.  (This was, at least,
           true in Hades I.  I have not actually checked to see if this
           is the case in Hades II, but whatever.)
        2. BOM.  The UTF-8-encoded files include a BOM.  `chardet`
           will detect it as such, but we can't just take its `encoding`
           value and encode each string, because each line would
           have a BOM marker.  Also it turns out that the first
           string read from the file (even in text mode!) includes
           the BOM, so we could end up with a double-BOM.  wtf.
        3. UTF-8 *without* BOM.  Seems Hades II now does this (Hades
           I does not).  The string "Melinoë" seems to generally be
           the culprit.
        4. End-of-file newlines.  Mostly they're not present, but
           sometimes they are, and reading the files in text mode
           seems to obfuscate it.  Whatever, we're just not putting
           any in.  Currently this results in just one 'messy' diff.
           (This was, at least, true in Hades 1.  I have not actually
           checked to see if this is the case in Hades II, but
           whatever.)

    So whatever, we're being stupid about all this.  Use `chardet` to
    detect the encoding, and then only support a hardcoded few, handling
    the encoding and newline stuff sort-of manually.  We only support the
    two file encodings I've seen in the Hades data so far.  Meh.
    """

    def __init__(self, filename_orig, filename_new):
        self.filename_orig = filename_orig
        self.filename_new = filename_new
        self.written_line = False

        # Grab encoding
        detected_ascii_melinoe = False
        with open(self.filename_orig, 'rb') as df:
            results = chardet.detect(df.read(1024))
            if results['confidence'] < 0.9:
                raise RuntimeError(f'Character detection not confident enough for {self.filename_orig}: {results}')
            self.orig_encoding = results['encoding']

            # bahhhh.  Turns out we have some UTF-8 files in Hades II *without*
            # BOM, and which chardet doesn't seem to recognize even if we give
            # it the entire file.  In the files we care about, the string
            # "Melinoë" is generally the culprit, so I'm just hardcoding that.
            if self.orig_encoding == 'ascii':
                df.seek(0)
                if 'Melinoë'.encode('utf-8') in df.read():
                    self.orig_encoding = 'utf-8'
                    detected_ascii_melinoe = True

        # Process encoding
        if detected_ascii_melinoe:
            self.encoding = 'utf-8'
            self.bom = None
        else:
            match self.orig_encoding:
                case 'UTF-8-SIG':
                    self.encoding = 'utf-8'
                    self.bom = codecs.BOM_UTF8
                case 'ascii':
                    self.encoding = 'ascii'
                    self.bom = None
                case _:
                    raise RuntimeError(f'Unknown encoding in {self.filename_orig}: {self.orig_encoding}')

        # Read in the file data.  Inefficient!
        with open(self.filename_orig) as df:
            # Note that the universal-newline handling means that our line ending will
            # always be the single \n char.
            df.readline()
            if df.newlines is None:
                raise RuntimeError(f'Unknown line endings for {self.filename_orig}')
            self.newline = df.newlines.encode(self.encoding)
            df.seek(0)
            self.data = []
            first = True
            for line in df:
                if first:
                    first = False
                    if self.bom is not None:
                        self.data.append(line[len(self.bom.decode(self.encoding)):-1])
                    else:
                        self.data.append(line[:-1])
                else:
                    self.data.append(line[:-1])
        self.odf = None

    def __enter__(self):
        """
        Support/require opening in a `with` clause
        """
        self.odf = open(self.filename_new, 'wb')
        if self.bom is not None:
            self.odf.write(self.bom)
        return self

    def __exit__(self, exit_type, value, traceback):
        """
        Exiting from a `with` clause
        """
        self.odf.close()

    def __iter__(self):
        """
        Iterate over the original file lines
        """
        return iter(self.data)

    def write(self, text):
        """
        Write out a single line of text
        """
        if self.written_line:
            self.odf.write(self.newline)
        encoded = text.encode(self.encoding)
        self.odf.write(text.encode(self.encoding))
        self.written_line = True


class App:
    """
    Given a collection of templates, a "live" directory to write to, and a
    set of changes, process them!
    """

    macro_re = re.compile(r"""
            @
            (?P<name>[a-z_]+)
            \|
            (?P<default>.*?)
            @
            """, re.X)

    def __init__(self, template_dir, live_dir, changes):
        self.template_dir = template_dir
        self.live_dir = live_dir
        self.changes = changes
        self.default_action = ActionDefault()

    def process_files(self, use_defaults=False):
        """
        Process all files in our template dir
        """
        for dirpath, _, filenames in os.walk(self.template_dir):
            for filename in filenames:
                self.process_file(os.path.join(dirpath, filename)[len(self.template_dir)+1:], use_defaults)

    def process_file(self, filename, use_defaults=False):
        """
        Process the specified file -- should be the "base" path+filename
        which can be appended to either the template dir or the "live"
        dir.
        """

        print(f'Processing: {filename}')

        # Figure out paths and make sure we can write to the live dir.
        filename_template = os.path.join(self.template_dir, filename)
        filename_live = os.path.join(self.live_dir, filename)
        dirname_live = os.path.dirname(filename_live)
        if not os.path.exists(dirname_live):
            os.makedirs(dirname_live, exist_ok=True)

        # Loop through and look for our macros
        with TextProcessor(filename_template, filename_live) as tp:
            for line in tp:
                line = self.macro_re.sub(lambda m: self._process_macro(m, use_defaults), line)
                tp.write(line)

    def _process_macro(self, matchobj, use_defaults=False):
        """
        Processed a macro that's been matched by our regex.  We've split this out
        so that we can handle multiple matches on the same line; HarvestPointChances
        lines in RoomData definitions are sometimes written with multiple items
        on the same line, and I'd like to alter as little as possible about the
        data files.  (Plus this is better than how we did it on the Hades I app
        anyway.)
        """
        name = matchobj.group('name')
        default = matchobj.group('default')
        if name in self.changes:
            action = self.changes[name]
        else:
            print(f' - WARNING: Change key not found, using default: {name}')
            action = self.default_action
        return str(action.process(name, default, use_default=use_defaults))


def main():

    ###
    ### The commented stuff in here is just leftovers from Hades I,
    ### in case I feel like making similar changes in Hades II.
    ###

    # Defaults: 0.8, 0.6
    # (not doing anything with this yet, but it's identical to Hades I)
    #godmode = ActionGodMode(0.05, 0)

    # The defaults vary wildly
    fishing = ActionGathering(0.6)
    shovel = ActionGathering(0.6)
    pickaxe = ActionGathering(0.6)
    harvest = ActionGathering(0.6)
    exorcism = ActionGathering(0.5,
            room_distance=3,
            biome_limit=2,
            )

    # Change dict
    changes = {

            ###
            ### Direct Buffs
            ###

            # Scale up various weapon damage
            #'damage_scale': ActionScaleInt(20),
            #'damage_scale_float': ActionScaleFloat(20),

            # Health - default: 50
            #'base_health': ActionHardcode(100, use_default=True),

            ###
            ### Commerce scaling!
            ###

            # Darkness/Gem cost at Well of Charon; prices are per-item and quantity is randomized
            #'well_darkness_scale': ActionScaleInt(4, use_default=True),
            #'well_darkness_cost_scale': ActionScaleFloat(4, inverse=True, use_default=True),
            #'well_gem_scale': ActionScaleInt(6, use_default=True),
            #'well_gem_cost_scale': ActionScaleFloat(6, inverse=True, use_default=True),

            # Shop cost ("super" is Diamonds and Titan Blood)
            #'shop_cost_scale': ActionScaleInt(0.5),
            #'super_shop_cost_scale': ActionScaleInt(0.25),

            ###
            ### Quantity overrides (tends to affect both shops + drops)
            ###

            # Health - default: 10
            #'health_qty': ActionHardcode(40),
            # Max Health - default: 25
            #'maxhealth_qty': ActionHardcode(30),

            # Money Drops - default: (various)
            #'money_qty': ActionHardcode(400),
            # Minor Money Drops - default: 30
            #'money_minor_qty': ActionHardcode(80),
            # Extra money with gems drops (depending on upgrades) - default: 20
            #'gems_extra_money_qty': ActionHardcode(60),

            # Darkness (room reward) - default: 10
            #'darkness_reward_qty': ActionHardcode(2000, use_default=True),
            # Darkness (Charon's Shop) - default: 25
            #'shop_darkness_qty': ActionHardcode(1000, use_default=True),
            # Darkness - Boss reward scale - defaults: 50, 100, 150, 250
            #'boss_darkness_scale': ActionScaleInt(30, use_default=True),

            # Gems (various sources) - default: 20 (Charon's shop), 5 (room rewards)
            #'various_gems_qty': ActionHardcode(200, use_default=True),

            # Nectar - default: 1
            #'nectar_qty': ActionHardcode(10, use_default=True),
            # Ambrosia - default: 1
            #'ambrosia_qty': ActionHardcode(20, use_default=True),
            # Keys - default: 1
            #'keys_qty': ActionHardcode(10, use_default=True),
            # Diamonds - default: 1
            #'diamonds_qty': ActionHardcode(20, use_default=True),
            # Titan Blood - default: 1
            #'titan_blood_qty': ActionHardcode(20, use_default=True),

            ###
            ### Resource Collection (pickaxe, shovel, fishing, harvesting, exorcisms)
            ###

            'fishing_chance': fishing,
            'fishing_distance': fishing,
            'fishing_other_lock': fishing,
            'fishing_biome_limit': fishing,

            'shovel_chance': shovel,
            'shovel_distance': shovel,
            'shovel_other_lock': shovel,
            'shovel_biome_limit': shovel,

            'pickaxe_chance': pickaxe,
            'pickaxe_distance': pickaxe,
            'pickaxe_other_lock': pickaxe,
            'pickaxe_biome_limit': pickaxe,

            'harvest_chance': harvest,
            'harvest_distance': harvest,
            'harvest_other_lock': harvest,
            'harvest_biome_limit': harvest,

            'exorcism_chance': exorcism,
            'exorcism_distance': exorcism,
            'exorcism_other_lock': exorcism,
            'exorcism_biome_limit': exorcism,

            ###
            ### Tweaks to fishing itself
            ###

            # Default: 3
            'fishing_max_fakes': ActionHardcode(0),
            # Default: 6 (minimum is 2; there's often some dialogue at the start so I
            # don't want to end up cutting that off)
            'fishing_gift_max_fakes': ActionHardcode(2),
            # Default: 0.68
            'fishing_success_interval': ActionHardcode(1),
            # Default: 1
            'fishing_late_interval': ActionHardcode(2),
            # "Give up" interval is 3; leave that.

            ###
            ### God Mode
            ### (not doing anything with this yet, but it's identical to Hades I)
            ###

            # Defaults noted above
            #'godmode_base_scale': godmode,
            #'godmode_per_death': godmode,
            #'godmode_death_cap': godmode,

            ###
            ### Keepsakes
            ### (a bit hokey; our regex doesn't support more than one value per line)
            ###

            # Default: '25, 50'
            #'keepsake_activations': ActionHardcode('2, 2'),

            ###
            ### Charon shoplift opportunity chance
            ###

            # Default: 0.22
            #'charon_shoplift_chance': ActionHardcode(1),

            ###
            ### Erebus / Infernal Gate
            ###

            # Defaults: 5/10/15
            #'infernal_gate_cost_tartarus': ActionHardcode(4),
            #'infernal_gate_cost_asphodel': ActionHardcode(8),
            #'infernal_gate_cost_elysium': ActionHardcode(12),

            # Default: 0.15
            #'infernal_gate_chance': ActionHardcode(0.5),

            # Default: 8
            #'infernal_gate_room_space': ActionHardcode(2),

            }

    # Eh, fine, support some args.
    parser = argparse.ArgumentParser(
            description='Hades II Cheat Injector',
            formatter_class=argparse.ArgumentDefaultsHelpFormatter,
            )

    parser.add_argument('-t', '--template-dir',
            type=str,
            default='templates',
            help='Directory in which to find templates',
            )

    parser.add_argument('-d', '--dest-dir',
            type=str,
            default='/games/Steam/steamapps/common/Hades II/Content',
            help='Directory in which to write our modified files',
            )

    parser.add_argument('-l', '--list-changes',
            action='store_true',
            help="Instead of processing, show the macro changes we'd apply",
            )

    parser.add_argument('--defaults',
            action='store_true',
            help="Use game defaults instead of applying cheats",
            )

    args = parser.parse_args()

    # Run!
    if args.list_changes:
        label_max = max([len(k) for k in changes.keys()])
        fstring = f'{{:>{label_max}}}: {{}}'
        for label, change in changes.items():
            print(fstring.format(label, change.desc()))
    else:
        app = App(
                template_dir=args.template_dir,
                live_dir=args.dest_dir,
                changes=changes,
                )
        app.process_files(args.defaults)


if __name__ == '__main__':
    main()

