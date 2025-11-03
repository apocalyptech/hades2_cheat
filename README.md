Hades II Cheat Injector
-----------------------

This is a little cheat injector I made for myself, for the excellent
game [Hades II, from Supergiant Games](https://www.supergiantgames.com/games/hades-ii/).
This is a fork of my [Hades Cheat Injector](https://github.com/apocalyptech/hades_cheat),
which as you can probably tell does the same thing for the original
game.

As with my Hades I cheat injector script, this is kind of a weird app.  If
you've arrived at this page looking for ways to mod Hades II, you almost
certainly want to use some more user-friendly options, since this is only
going to include the modifications that I specifically want, and is only
meant to be a commandline app.  It looks like Hades II modding is probably
centralized around a site called [Thunderstore](https://thunderstore.io/c/hades-ii/).
So you may want to check that out instead.

As for this script, though: All of the game's balancing and functionality
is exposed via text files in the game's directories, and these can be
edited at will.  They're a mix of [LUA scripts](https://www.lua.org/) and
[Simplified JSON](http://bitsquid.blogspot.com/2009/10/simplified-json-notation.html).
This script takes a collection of "templates," which are just copies of the
stock game files with a custom macro specification added in.  The script
loops through the file looking for those macro tags, making changes where
appropriate, and writes out the updated version to the game's directory.
The actual tweaks are all specified in code, so you'll have to edit the
script to make any changes you want.  It should be pretty trivial to add
in any new tweaks as well: add in whatever macro tags you feel are
appropriate, and then add them to the `changes` dictionary near the bottom
of the script.

Some changes which speed up resource acquisition for a variety of things in
the game:

- The odds of spawning resource-gathering POIs during runs has been buffed
  up, and more are allowed to spawn (should the RNG be smiling on you) than
  are usually allowed in a single biome.  Specifically this is talking about:
  - Harvesting plants
  - Fishing
  - Digging up seeds (with the shovel)
  - Mining ores/rocks (with the pickaxe)
  - Compelling/Exorcisng shades for Psyche
- Makes fishing slightly easier: out in the world there will be zero fake
  dunks, and while gifting lures at the Crossroads, there will be exactly
  two fake dunks.  The catch window has been extended slightly too, though
  it was already much easier in Hades II than it was in the original.
- Doubles the amount of boss/guardian drops (cinder, tears, etc), including
  the gem drops from Grave Thirst.
- Halves the processing time for a few things in the game:
  - Keepsake advancement
  - Growing plants in the garden
  - Brewing alchemy in the cauldron

And then some stuff that's very much just outright cheating:

- Buffed God Mode.  Starts at 30% damage reduction and goes to 10%,
  over the course of 20 deaths instead of 30.
- Increased weapon damage by 50%

Game Compatibility
------------------

The files in the `templates` dir are up to date as of game version
v1.132940, which is [Post-Launch Patch 1](https://store.steampowered.com/news/app/1145350/view/499462068471074277),
released on October 31, 2025.  If the game's been updated since then, it's
entirely possible that some of those files may have been updated.  In that
case, the changes would need to be merged back in to the templates for the
script to remain compatible.

Likewise, if you have any ["real" Hades II mods](https://thunderstore.io/c/hades-ii/)
installed, those mods may have overwritten some of the files that we edit, so
this wouldn't be compatible with those unless the mod changes were merged into
these templates.

Installation
------------

This script requires Python 3.10+, and has only actually been tested on Python
3.13.  There's no real installation -- just check it out from git, make sure
you have Python 3.10+ installed, make sure the `chardet` Python library is
installed, and then run it from the commandline.

The script was developed/tested on Linux, but should probably work
just fine on any platform which can run Python.

### Dependencies

The project makes use of the following:
 - `chardet`: https://pypi.org/project/chardet/

Either use `pip install chardet` to install it, or
`pip install -r requirements.txt`.  (It might also be available in your
distro's package manager, on Linux systems.)

Usage
-----

Running the script with `-h` or `--help` will show you the syntax:

    usage: hades2_cheat.py [-h] [-t TEMPLATE_DIR] [-d DEST_DIR] [-l] [--defaults]

    Hades II Cheat Injector

    options:
      -h, --help            show this help message and exit
      -t TEMPLATE_DIR, --template-dir TEMPLATE_DIR
                            Directory in which to find templates (default:
                            templates)
      -d DEST_DIR, --dest-dir DEST_DIR
                            Directory in which to write our modified files
                            (default: /games/Steam/steamapps/common/Hades II/Content)
      -l, --list-changes    Instead of processing, show the macro changes we'd
                            apply (default: False)
      --defaults            Use game defaults instead of applying cheats (default:
                            False)

The default `templates` dir for the templates is included in this
repo; you'll almost certainly have to specify the game's `Content` directory
location yourself, though.  Running it on my system yields the following:

    $ ./hades2_cheat.py
    Processing: Scripts/RoomDataQ.lua
    Processing: Scripts/HarvestData.lua
    Processing: Scripts/RoomDataI.lua
    Processing: Scripts/RoomDataF.lua
    Processing: Scripts/RoomDataO.lua
    Processing: Scripts/RoomDataP.lua
    Processing: Scripts/RoomDataH.lua
    Processing: Scripts/RoomDataG.lua
    Processing: Scripts/RoomDataN.lua
    Processing: Scripts/RoomDataChaos.lua

Using `-l` or `--list-changes` will have the script output the changes that
it will make, listing out the macro tag and then the action that gets
applied.  Here's the default set:

    $ ./hades2_cheat.py -l
         weapon_damage_scale: Scale by 1.5
          boss_drop_quantity: Hardcoded to: 2
              gem_drop_scale: Scale by 2
              fishing_chance: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
            fishing_distance: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
          fishing_other_lock: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
         fishing_biome_limit: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
               shovel_chance: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
             shovel_distance: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
           shovel_other_lock: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
          shovel_biome_limit: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
              pickaxe_chance: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
            pickaxe_distance: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
          pickaxe_other_lock: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
         pickaxe_biome_limit: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
              harvest_chance: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
            harvest_distance: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
          harvest_other_lock: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
         harvest_biome_limit: Resource-gathering chance of 0.6 (room distance: 1, limit per biome: 3)
             exorcism_chance: Resource-gathering chance of 0.5 (room distance: 3, limit per biome: 2)
           exorcism_distance: Resource-gathering chance of 0.5 (room distance: 3, limit per biome: 2)
         exorcism_other_lock: Resource-gathering chance of 0.5 (room distance: 3, limit per biome: 2)
        exorcism_biome_limit: Resource-gathering chance of 0.5 (room distance: 3, limit per biome: 2)
           fishing_max_fakes: Hardcoded to: 0
      fishing_gift_max_fakes: Hardcoded to: 2
    fishing_success_interval: Hardcoded to: 1
       fishing_late_interval: Hardcoded to: 2
           godmode_start_pct: God Mode from 70% -> 10%, with 20 steps
           godmode_per_death: God Mode from 70% -> 10%, with 20 steps
           godmode_death_cap: God Mode from 70% -> 10%, with 20 steps
       keepsake_evolve_scale: Scale by 0.5
           garden_grow_scale: Scale by 0.5
         cauldron_cook_scale: Scale by 0.5


The `--defaults` option can be used to revert the scripts back to their
original, default configuration, in case you'd like a quick way to disable
all the cheats.

There are also a couple of shell scripts in the directory which can kick
off some diffs, just for an easy spot-check of what the util did.  These are
just intended for Linux systems, but can probably be run in
[WSL](https://docs.microsoft.com/en-us/windows/wsl/install) or on OSX, too.
The scripts require having copied the game's stock `Content` directory contents
into a `Content-orig` directory, though you can of course edit the scripts to
change that.  The scripts also have a hardcoded path to the game's live `Content`
directory, so that will almost certainly need changing on your system as well.

`diff-templates.sh` shows what's changed between the stock game files and the
templates.  `diff-live.sh` shows what's changed between the stock game files
and the edited files generated by the script.

Templates / Macros
------------------

The macro syntax used in the templates is an entirely custom format, but it's
easy enough.  For instance, around line 851 in `Scripts/HarvestData.lua`,
there's some definitions for how fishing works:

    Difficulty =
    {
        Default =
        {
            NumFakeDunks = { Min = 0, Max = @fishing_max_fakes|3@ },
            FakeDunkInterval = { Min = 1, Max = 3 },
            WarnInterval = { Min = 1, Max = 2 },
            SuccessInterval = @fishing_success_interval|0.68@,
            WayLateInterval = @fishing_late_interval|1@,
            GiveUpInterval = 3,
        },

        Gifting =
        {
            NumFakeDunks = { Min = 2, Max = @fishing_gift_max_fakes|6@ },
            FakeDunkInterval = { Min = 1, Max = 5 },
            WarnInterval = { Min = 1, Max = 3 },
            SuccessInterval = @fishing_success_interval|0.68@,
            WayLateInterval = @fishing_late_interval|1@,
            GiveUpInterval = 3,
        },
    },

As you can see, the macros are enclosed by `@` symbols, with a pipe (`|`)
inbetween the macro name and the original (default) value.  Inside the
`changes` dict in the script itself, you'll see some lines which look like
this:

    'fishing_max_fakes': ActionHardcode(0),
    'fishing_gift_max_fakes': ActionHardcode(2),
    'fishing_success_interval': ActionHardcode(1),
    'fishing_late_interval': ActionHardcode(2),

These are the simplest form of replacement that the injector can handle.
`ActionHardcode` merely hardcodes the specified value in place of the
default one.  So once the injector has been run, it's this stanza which
ends up in the game data:

    Difficulty =
    {
        Default =
        {
            NumFakeDunks = { Min = 0, Max = 0 },
            FakeDunkInterval = { Min = 1, Max = 3 },
            WarnInterval = { Min = 1, Max = 2 },
            SuccessInterval = 1,
            WayLateInterval = 2,
            GiveUpInterval = 3,
        },

        Gifting =
        {
            NumFakeDunks = { Min = 2, Max = 2 },
            FakeDunkInterval = { Min = 1, Max = 5 },
            WarnInterval = { Min = 1, Max = 3 },
            SuccessInterval = 1,
            WayLateInterval = 2,
            GiveUpInterval = 3,
        },
    },

There are other actions which can scale the default values rather
than hardcoding, or enforce a minimum/maximum on the value, or some
more complex actions to handle things like the resource-gathering
conditions.  As always, see the source for more details.  My original
Hades Cheat Injector has some more working examples as well; the
mechanism is identical.

LICENSE
-------

Hades II Cheat Injector code is licensed under the
[New/Modified (3-Clause) BSD License](https://opensource.org/licenses/BSD-3-Clause).
A copy is also found in [COPYING.txt](COPYING.txt).

The templates found in the `templates` directory have been copied from the
Hades game data itself, and AFAIK would be copyright by
[Supergiant Games](https://www.supergiantgames.com/).  Those are *not*
covered under the same license as my code, and honestly I'm not even
sure what their redistribution terms are like.  I assume since Hades II
mods are tolerated in general, Supergiant doesn't mind this sort of
redistribution -- perhaps it's covered by Fair Use?

Changelog
---------

**2025-11-02**:
 - Added speedups to the following:
   - Keepsake advancement
   - Growing plants in the garden
   - Brewing alchemy in the cauldron
 - Added God Mode buffs
 - Added weapon damage buffs

**2025-11-01**:
 - Buffed up boss drop quantities (cinder, tears, etc)

**2025-10-31**:
 - Updated to Hades II v1.132940 data ([Post-Launch Patch 1](https://store.steampowered.com/news/app/1145350/view/499462068471074277))

**2025-10-28**:
 - Added tweaks to fishing

**2025-10-27**:
 - Forked from my [Hades Cheat Injector](https://github.com/apocalyptech/hades_cheat)
 - Initial version just supports buffing resource-gathering POI spawnrates
 - Other code improvements from the original
   - Can match more than one macro on the same line 
   - Added a "minimum" and "maximum" action for macro replacement, though
     by the time I committed the repo, they weren't actually being used
     by anything.

