RoomSetData.N =
{
	BaseN =
	{
		DebugOnly = true,
		RichPresence = "#RichPresence_N",
		Icon = "GUI\\Screens\\BountyBoard\\Biome_Ephyra",
		ResultText = "RunHistoryScreenResult_Ephyra",
		IgnoreForRewardStoreCount = true,
		
		HarvestPointBase = "DrownedChambersHarvestPointBase01",
		
		ValidateSecretData = true,
		HasHarvestPoint = true,
		HasShovelPoint = true,
		HasPickaxePoint = true,
		HasFishingPoint = false,
		HasExorcismPoint = true,

		LocationAnimName = "InfoBannerEphyraIn",
		LocationAnimOutName = "InfoBannerEphyraOut",

		HarvestPointRequirements =
		{
			{
				SumPrevRooms = @harvest_distance|12@,
				Path = { "NumHarvestPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "PlantNMoss" },
						Comparison = "<",
						Value = 8,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		ShovelPointRequirements =
		{
			{
				Path = { "GameState", "CompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
			},
			{
				SumPrevRooms = @shovel_distance|12@,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = @shovel_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = @shovel_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = @shovel_other_lock|0@,
			},

			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "PlantNGarlicSeed" },
						Comparison = "<",
						Value = 12,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 5,
						Path = { "NumPickaxePoints" },
						Comparison = "<=",
						Value = @shovel_other_lock|0@,
					},
				},
			},
		},
		PickaxePointRequirements =
		{
			{
				Path = { "GameState", "CompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
			},
			{
				SumPrevRooms = @pickaxe_distance|12@,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = @pickaxe_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = @pickaxe_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = @pickaxe_other_lock|0@,
			},

			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "OreNBronze" },
						Comparison = "<",
						Value = 30,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 5,
						Path = { "NumShovelPoints" },
						Comparison = "<=",
						Value = @pickaxe_other_lock|0@,
					},
				},
			},
		},
		ExorcismPointRequirements =
		{
			{
				Path = { "GameState", "CompletedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				Path = { "CurrentRun", "BiomeDepthCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
			},
			{
				SumPrevRooms = @exorcism_distance|16@,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = @exorcism_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = @exorcism_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = @exorcism_other_lock|0@,
			},

			OrRequirements =
			{
				-- collection
				{
					OrRequirements =
					{
						{
							{
								Path = { "GameState", "LifetimeResourcesGained", "MemPointsCommon" },
								Comparison = "<=",
								Value = 1500,
							},
						},
						{
							{
								Path = { "GameState", "ExorcisedNames", "ShadeEphyraIdle" },
								Comparison = "<",
								Value = 2,
							},
						},
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 5,
						Path = { "NumFishingPoints" },
						Comparison = "<=",
						Value = @exorcism_other_lock|0@,
					},
				},
			},
		},
		FishingPointRequirements =
		{
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
			},
			{
				SumPrevRooms = @fishing_distance|14@,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = @fishing_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = @fishing_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = @fishing_other_lock|0@,
			},

			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", },
						NotHasAll = { "FishNCommon", "FishNRare", "FishNLegendary" },
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 5,
						Path = { "NumExorcismPoints" },
						Comparison = "<=",
						Value = @fishing_other_lock|0@,
					},
				},
			},
		},

		SecretSpawnChance = 0.0,
		SecretDoorRequirements =
		{
			--[[
			{
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "ChaosAboutSurface02" },
			},
			{
				SumPrevRuns = 5,
				Path = { "WorldUpgradesAdded", "WorldUpgradeSurfacePenaltyCure" },
				CountPathTrue = true,
				Comparison = "<=",
				Value = 0,
			},
			]]--
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeSurfacePenaltyCure" },
			},
			{
				PathTrue = { "GameState", "UseRecord", "HeraUpgrade" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "O_Intro" }
			},
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "N_Opening01" },
			},
			NamedRequirements = { "ChaosUnlocked", "NoRecentChaosEncounter" },
		},

		SaveProfileLocationText = "BiomeN_Short",

		LegalEncounters = EncounterSets.NEncountersDefault,
		DevotionEncounters = {"DevotionTestN"},
		FlipHorizontalChance = 0.0,

		TimeChallengeSwitchRequirements =
		{
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeChallengeSwitchesSurface1" },
			},
		},
		TimeChallengeEncounterOptions = { "TimeChallengeN" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeN" },
		EliteChallengeEncounterOptions = { "EliteChallengeN" },

		Ambience = "/Ambience/EphyraCityAmbienceOutdoor",
		ReverbValue = 1.5,
		GlobalEcho = 0.0,
		StopSecretMusic = true,
		ShopSecretMusic = "/Music/CharonShopTheme",

		FootstepAnimationR = "MudFootstepR-Spawner",
		FootstepAnimationL = "MudFootstepL-Spawner",

		BreakableValueOptions = { MaxHighValueBreakables = 3 },

		NarrativeContextArt = "DialogueBackground_Ephyra",
		NarrativeContextArtFlippable = false,

		ForcedRewardStore = "RunProgress",

		CloseDoorsOnUse = true,

		StrictLeftRight = true,

		SwapAnimations =
		{
			["OlympusSnowExplosionDecal"] = "ExplosionScorchDecal",
		},

		StartThreadedEvents =
		{
			{ FunctionName = "CheckBiomeStateStart" },
			{ FunctionName = "ShadeMercManager", GameStateRequirements = { ChanceToPlay = 0.1 }, Args = { StartingCountMin = 0, StartingCountMax = 5, ObjectNames = { "ShadeMerc" }, MaxActive = 5, RequireForExit = false } },
		},

		StartUnthreadedEvents =
		{
			{ FunctionName = "SpawnSoulPylon", GameStateRequirements = { ChanceToPlay = 1.0 }, Args = { SpawnName = "SoulPylon" } }
		},

		ThreadedEvents =
		{
			{
				FunctionName = "DisplayInfoBanner",
				Args = RoomEventData.BountyInfoBannerArgs,
				GameStateRequirements =
				{
					NamedRequirements = { "ShouldShowBountyInfoBanner" },
				},
			},
		},
		PostCombatReloadThreadedEvents =
		{
			{
				FunctionName = "DisplayInfoBanner",
				Args = RoomEventData.BountyInfoBannerArgs,
				GameStateRequirements =
				{
					NamedRequirements = { "ShouldShowBountyInfoBanner" },
				},
			},
		},

		ZoomFraction = 0.825,
	},

	N_Opening01 =
	{
		InheritFrom = { "BaseN", "BiomeStartRoom" },
		SaveProfileLocationText = "Location_SurfaceMisc_Short",
		Starting = true,
		HasFishingPoint = true,
		SecretSpawnChance = 0.09,
		MaxAppearancesThisBiome = 1,

		LegalEncounters = { "OpeningEmpty", "OpeningGeneratedN" },
		NextRoomSet = { "N" },
		LinkedRoom = "N_PreHub01",
		Ambience = "/Ambience/EphyraOutsideAmbience",

		SpawnRewardOnId = 40055,
		ZoomFraction = 0.85,
		ZoomStartFraction = 0.80,

		DisableRewardMagnetisim = true,
		TeleportCatFamiliarOnEncounterStart = true,
		
		EntranceFunctionName = "RoomEntranceMaterialize",
		EntranceFunctionArgs = { HeroGoalAngle = 35 },

		MusicStartDelay = 5,

		HarvestPointChances = { @harvest_chance|0.02@, },
		ShovelPointChance = @shovel_chance|0.02@,
		PickaxePointChance = @pickaxe_chance|0.02@,
		--ExorcismPointChance = 0.02,
		FishingPointChance = @fishing_chance|0.27@,

		HarvestPointForceRequirements = 
		{ 
			{
				Path = { "GameState", "LifetimeResourcesGained", "PlantNMoss" },
				Comparison = "<=",
				Value = 3,
			},
		},

		ThreadedEvents =
		{
			Threaded = true,
			-- Biome banner plays in N_Hub
			{
				FunctionName = "DisplayInfoBanner",
				Args = RoomEventData.BountyInfoBannerArgs,
				GameStateRequirements =
				{
					NamedRequirements = { "ShouldShowBountyInfoBanner" },
				},
			},
			{
				FunctionName = "CheckObjectiveSetSource",
				Args =
				{
					ObjectiveSetName = "BountyAdvancedTooltip",
				},
			},
		},

		DistanceTriggersPostCombatReload = true,
		DistanceTriggers =
		{
			-- Overlook
			{
				GameStateRequirements =
				{
					{
						PathEmpty = { "RequiredKillEnemies" },
					},
				},
				TriggerGroup = "OverlookOut", WithinDistance = 200, FunctionName = "BiomeOverlook", Repeat = true, Args = { PanTargetId = 645947, ZoomFraction = 0.68, Duration = 5.45, EaseIn = 0, EaseOut = 1 },
			},
			{
				GameStateRequirements =
				{
					{
						PathEmpty = { "RequiredKillEnemies" },
					},
				},
				TriggerGroup = "OverlookIn", WithinDistance = 150, FunctionName = "BiomeBackToRoom", Repeat = true,
			},
		},

		OverlookData =
		{
			StartDelay = 1.0,
			CameraClamps = { 561020, 561021, },
			CameraStartId = 561021,
			ReturnPositionId = 561018,

			CameraStartPanId = 561085,
			CameraStartPanDuration = 3.0,
			
			ZoomFraction = 0.6 ,

			FlourishId = 561066,
			FlourishAnimation = "MelinoeCauldronIncantationComplete",
			-- FlourishSound = "/VO/Melinoe_0339",

			ObstacleChanges =
			{
				{
					CameraPanId = 561019,
					CameraPanDuration = 20.0,
				},
				{
					ObstacleIds = { 561061, 561078, 561059, },
					--ChangeColor = { 74, 0, 0, 255 },
					--ChangeHSV = { 149, -31, 100 },
					ChangeAlpha = 0.0,
					--Movement = { Angle = 45, Distance = 1600 },
					Duration = 3
					--Delay = 4,
				},
				--[[
				{
					PlaySound = "/VO/Melinoe_0339",
					Delay = 2.0,
				},
				]]--
				{
					UnzeroMouseTether = true,
					Delay = 13.0,
				},
			},
		},

		ObstacleData =
		{
		},

		IneligibleRewards = RewardSets.OpeningRoomBans,
		ForcedRewards =
		{
			{
				Name = "Boon",
				LootName = "HeraUpgrade",
				GameStateRequirements =
				{
					NamedRequirements = { "HeraUnlocked" },
				},
			},
			{
				Name = "Boon",
				LootName = "ZeusUpgrade",
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "TextLinesRecord", "ZeusAboutSurfaceNoCure01" },
					},
					{
						PathFalse = { "GameState", "WorldUpgradesAdded", "WorldUpgradeSurfacePenaltyCure" },
					},
				},
			},
			{
				Name = "SpellDrop",
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "TextLinesRecord", "SeleneAboutSurfaceCurse01" },
					},
					{
						PathFalse = { "GameState", "WorldUpgradesAdded", "WorldUpgradeSurfacePenaltyCure" },
					},
				}
			},
			{
				Name = "Boon",
				LootName = "AresUpgrade",
				GameStateRequirements =
				{
					NamedRequirements = { "AresUnlocked" },
				},
			},
			{
				Name = "Boon",
				LootName = "PoseidonUpgrade",
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "TextLinesRecord", "PoseidonDevotionIntro01" },
					},
					NamedRequirements = { "DevotionTestUnlocked" },
				}
			},
			-- special case if you reach Q but not the final confrontation; also in RoomDataF
			{
				Name = "Boon",
				LootName = "PoseidonUpgrade",
				GameStateRequirements =
				{
					{
						Path = { "PrevRun", "RoomsEntered" },
						HasAny = { "Q_Intro" },
					},
					{
						Path = { "PrevRun", "RoomsEntered" },
						HasNone = { "Q_MiniBoss03" },
					},
					{
						PathFalse = { "GameState", "RoomsEntered", "Q_Boss01" }
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "PoseidonAboutSurfaceThreat01" }
					},
				},
			},
			{
				Name = "Boon",
				LootName = "HermesUpgrade",
				GameStateRequirements =
				{
					{
						Path = { "PrevRun", "RoomsEntered" },
						HasAny = { "Q_MiniBoss03" },
					},
					{
						Path = { "GameState", "RoomsEntered" },
						HasNone = { "Q_Boss01" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "HermesAboutTyphonReveal01" }
					}
				},
			},
			{
				Name = "Boon",
				LootName = "ZeusUpgrade",
				GameStateRequirements =
				{
					{
						Path = { "GameState", "TextLinesRecord" },
						HasNone = { "ZeusPostTrueEnding01", "ZeusPalacePostTrueEnding01" },
					},
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
			},
			{
				Name = "Boon",
				LootName = "HermesUpgrade",
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "TextLinesRecord", "HermesPostEpilogue01" },
					},
					NamedRequirements = { "ReachedEpilogue" },
				},
			},
			-- special case for Hermes & Apollo Keepsake; also in RoomDataF
			{
				Name = "Boon",
				LootName = "HermesUpgrade",
				GameStateRequirements =
				{
					{
						PathFalse = { "CurrentRun", "ActiveBounty" },
					},
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "ForceApolloBoonKeepsake" },
					},
					{
						Path = { "GameState", "TraitUses", "ForceApolloKeepsake" },
						Comparison = ">=",
						Value = 4,
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "HermesAboutApolloKeepsake01" }
					},
				},
			},
		},

		StartUnthreadedEvents =
		{
			--[[
			{
				 FunctionName = "MusicPlayerEvent",
				Args = { TrackName = "/Music/IrisMusicFilthyArp_MC", },
			},
			]]--
		},

		EnterVoiceLines =
		{
			{
				PlayOnce = true,
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 2.35,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeSurfacePenaltyCure" },
					},
				},
				{ Cue = "/VO/Melinoe_0568", Text = "My curse... I feel... all right..." },
			},
		},

		RewardSpawnVoiceLines =
		{
			-- packaged bounties
			[1] = { GlobalVoiceLines = "StartPackagedBountyRunVoiceLines" },
			-- other general cases
			[2] = { GlobalVoiceLines = "TaskBegunVoiceLines" },
			-- biome state changes
			[3] = { GlobalVoiceLines = "BiomeStateChangeStartVoiceLines" },
		},

		ExitVoiceLines =
		{
			{ GlobalVoiceLines = "StorytellerRunStartVoiceLines" },
		},

		InspectPoints =
		{
			[645941] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathFalse = { "CurrentRun", "ActiveBounty" },
					},
					{
						PathFalse = { "GameState", "WorldUpgradesAdded", "WorldUpgradeSurfacePenaltyCure" },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Opening01_01 =
					{
						{ Cue = "/VO/Storyteller_0150",
							Text = "{#Emph}As the ill-fated princess feels her life-force fade with every breath of surface air, her sole recourse is to return whence she came." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							{ Cue = "/VO/MelinoeField_0479", Text = "...What, I... {#Emph}ungh..." },
						},
					},
				},
			},
			[560953] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathFalse = { "CurrentRun", "ActiveBounty" },
					},
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeSurfacePenaltyCure" },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Opening01_02 =
					{
						{ Cue = "/VO/Storyteller_0023",
							Text = "{#Emph}Few entrances into the Underworld exist, and one of them is through the Acheron, whose accursed waters bear the weight of all the woes of mortalkind." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							{ Cue = "/VO/Melinoe_0858", Text = "If our foes can use this as an exit, so can I." },
						},
					},
				},
			},
			[557914] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathFalse = { "CurrentRun", "ActiveBounty" },
					},
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Opening01_03 =
					{
						{ Cue = "/VO/Storyteller_0010",
							Text = "{#Emph}The light of the Moon is all that now illuminates the surface, where the dead have risen, and Olympus teeters on the brink of doom." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							{ Cue = "/VO/Melinoe_0035_B", Text = "Damn you, Chronos..." },
						},
					},
				},
			},

		},

	},

	N_PreHub01 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		SaveProfileLocationText = "Location_SurfaceMisc_Short",
		LegalEncounters = { "PreHubGeneratedN" },
		SecretSpawnChance = 0.09,
		
		HideRewardPreview = false,
		LinkedRoom = "N_Hub",
		Ambience = "/Ambience/EphyraOutsideAmbience",

		ForcedRewardStore = "RunProgress",
		IneligibleRewards = RewardSets.OpeningRoomBans,

		StartUnthreadedEvents = {},

		StartThreadedEvents =
		{
			{ FunctionName = "ShadeMercManager", GameStateRequirements = { ChanceToPlay = 0.5 }, Args = { StartingCountMin = 0, StartingCountMax = 5, ObjectNames = { "ShadeMerc" }, MaxActive = 5, RequireForExit = false } },
		},

		PickaxePointForceRequirements = 
		{ 
			{
				Path = { "GameState", "LifetimeResourcesGained", "OreNBronze" },
				Comparison = "<",
				Value = 1,
			},
			{
				PathFalse = { "CurrentRun", "ActiveBounty" },
			},
		},

		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 50065,
				NextHeroEndPoint = 50059,
			}
		},

		InspectPoints =
		{
			[658900] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeSurfacePenaltyCure" },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_PreHub01_01 =
					{
						{ Cue = "/VO/Storyteller_0151",
							Text = "{#Emph}The city of Ephyra, which once stood in solemn tribute to the fear-inducing Underworld King and Queen, now barely stands at all." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 2,

							{ Cue = "/VO/MelinoeField_0480", Text = "...Yet it stands in my way." },
						},
					},
				},
			},
		},

		ExitVoiceLines =
		{
			UsePlayerSource = true,
			RandomRemaining = true,
			SuccessiveChanceToPlay = 0.5,
			SuccessiveChanceToPlayAll = 0.2,
			PreLineWait = 0.35,
			ThreadName = "RoomThread",
			GameStateRequirements =
			{
				{
					Path = { "CurrentRun", "Hero", "TraitDictionary" },
					HasNone = { "SurfacePenalty" },
				},
			},
			Cooldowns =
			{
				{ Name = "MelinoeAnyQuipSpeech" },
			},

			{ Cue = "/VO/MelinoeField_0362", Text = "Gap in the wall...", PlayFirst = true },
			{ Cue = "/VO/MelinoeField_0363", Text = "Just, squeeze on through..." },
			{ Cue = "/VO/MelinoeField_0364", Text = "Heading in." },
			{ Cue = "/VO/MelinoeField_0365", Text = "Into Ephyra." },
		},
	},

	N_Hub =
	{
		InheritFrom = { "BaseN" },
		LegalEncounters = { "Empty" },

		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasFishingPoint = false,
		HasExorcismPoint = false,

		NoReward = true,
		HideRewardPreview = true,
		NoReroll = true,
		SkipLastKillPresentation = true,
		CloseDoorsOnUse = true,
		ReverbValue = 2.0,
		GlobalEcho = 0.35,
		RandomStemMixerTimesVisitedLimit = 99,
		RandomStemMixerValues =
		{
			{
				SetSoundCueValues =
				{
					{
						Name = "Drums",
						Value = 0.0,
						Duration = 1.0,
					},
					{
						Name = "Guitar",
						Value = 1.0,
						Duration = 2.5,
					},
					{
						Name = "Bass",
						Value = 1.0,
						Duration = 2.5,
					},
				},
			},
			{
				SetSoundCueValues =
				{
					{
						Name = "Drums",
						Value = 0.0,
						Duration = 1.0,
					},
					{
						Name = "Guitar",
						Value = 1.0,
						Duration = 2.5,
					},
					{
						Name = "Bass",
						Value = 0.0,
						Duration = 2.5,
					},
				},
			},
			{
				SetSoundCueValues =
				{
					{
						Name = "Drums",
						Value = 0.0,
						Duration = 1.0,
					},
					{
						Name = "Guitar",
						Value = 0.0,
						Duration = 2.5,
					},
					{
						Name = "Bass",
						Value = 1.0,
						Duration = 2.5,
					},
				},
			},
		},

		RushMaxRangeOverride = 475,

		--IntroSequenceDuration = 1.0,
		ZoomFraction = 0.55,
		ZoomFractionSwitch = 0.55,
		CameraZoomWeights =
		{
			[660496] = 1.00, -- start point of entrance hallway
			[660493] = 1.00, -- exit door
			[660489] = 1.75, -- west / bot-low
			[662609] = 1.65, -- west / bot-high
			[662592] = 1.40, -- west / mid
			[660491] = 1.55, -- west / top
			[660490] = 1.20, -- fountain
			[660494] = 1.50, -- east / top
			[660495] = 1.70, -- east / mid
			[660492] = 1.80, -- east / bot
		},

		HeroStartPoint = 50065,
		HeroEndPoint = 50059,

		PersistentExitDoorRewards = true,
		SaveWhitelist =
		{
			ObjectStates = true,
			DoorsChosen = true,
		},
		BlockCameraReattach = true,

		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
		HoundFamiliarIgnoreUnitsForPathfinding = true,

		StartRoomPresentationOnReload = true,
		EncounterCompleteWait = 0.02,
		UnlockExitsWait = 0.02,

		NarrativeContextArt = "DialogueBackground_Ephyra",
		NarrativeContextArtFlippable = false,

		GameStateRequirements =
		{
			-- None
		},

		PreObstacleSetupEvents =
		{
			{
				FunctionName = "ChooseAvailableN_HubDoors",
				Args = { CountMin = 9, CountMax = 10, Types = { "EphyraExitDoor" } },
			},
		},

		StartUnthreadedEvents =
		{
			{
				FunctionName = "HandleNHubWingDimmers",
				Args =
				{
					Dimmer_01 = { 561418, 561424, 616992, },
					Dimmer_02 = { 617012, 617043, 617024, },
					Dimmer_03 = { 617144, 561403, 617162, 561449, 560776, 560707, },
					Dimmer_04 = { 560708, 561337, 561395, 560699, 617138, },
					Dimmer_05 = { 560848, 561389, 560889, 561368, 617113, },
					Dimmer_06 = { 561354, 561374, 560705, 561380, },
				},
			},
			{
				FunctionName = "CheckPriorityConversations",
				GameStateRequirements =
				{
					-- None
				},
				Args =
				{
					Conversations =
					{
						"HeraclesFirstMeeting",
					},
				},
			},
		},

		StartThreadedEvents =
		{
		},

		ThreadedEvents =
		{
			{
				FunctionName = "DisplayInfoBanner",
				Args =
				{
					Text = "Location_BiomeN",
					AnimationName = "InfoBannerEphyraIn",
					AnimationOutName = "InfoBannerEphyraOut",
					Delay = 2.0,
				},
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "RoomCountCache", "N_Hub", },
						Comparison = "<=",
						Value = 1,
					},
					{
						FunctionName = "RequiredAlive",
						FunctionArgs = { Ids = { 566363 }, Alive = false },
					},
				},
			},
			{
				FunctionName = "HandlePylonObjective",
				Args = { Delay = 6.0 },
			},
		},

		UnthreadedEvents =
		{
			{
				FunctionName = "BossIntro",
				GameStateRequirements =
				{
					-- requirements on the narrative events
				},
				Args =
				{
					ProcessTextLinesIds = { 566363 },
					PreTextLinesWaitTime = 3.0,
					SkipBossMusic = true,
					PanTargetIds = { 566363, 50059 },
					SkipAngleTowardTarget = true,
					DurationIn = 3.5,
					DurationOut = 3.5,
					UsePanSound = true,
				},
			},
		},

		LeaveEvents = 
		{
			{ FunctionName = "UpdateHubRewardLookup" }
		},

		PostCombatReloadEvents =
		{
			{
				FunctionName = "CheckReloadEncounters",
				Args =
				{
					LegalEncounters =
					{
						"HubReturnZombieFountain01", "Empty", "Empty",
						"HubReturnZombieStatue01", "Empty", "Empty",
						"HubReturnZombieBarrier01", "Empty", "Empty",
						"HubReturnZombieIsolated01", "Empty", "Empty",
						"HubReturnZombieIsolated02", "Empty", "Empty",
						"HubReturnZombieIsolated03", "Empty", "Empty",
						"HubReturnZombieCorpses01", "Empty", "Empty",
						"HubReturnCarrionEating01", "Empty", "Empty",
						--"HubReturnAssassin01", "Empty", "Empty",
						--"HubReturnMudman01", "Empty", "Empty",
						--"HubReturnMudman02", "Empty", "Empty",
						"HubReturnSpawners01", "Empty", "Empty",
						"HubReturnSpawners02", "Empty", "Empty",
					},
				},
			},
			{
				FunctionName = "HandleNHubWingDimmers",
				Args =
				{
					Dimmer_01 = { 561418, 561424, 616992, },
					Dimmer_02 = { 617012, 617043, 617024, },
					Dimmer_03 = { 617144, 561403, 617162, 561449, 560776, 560707, },
					Dimmer_04 = { 560708, 561337, 561395, 560699, 617138, },
					Dimmer_05 = { 560848, 561389, 560889, 561368, 617113, },
					Dimmer_06 = { 561354, 561374, 560705, 561380, },
				},
			},
			{
				FunctionName = "FirstPylonHubReturnPresentation",
				Args = {},
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EnemyKills", "SoulPylon" },
						Comparison = ">=",
						Value = 1,
					},
					{
						PathFalse = { "GameState", "SpeechRecord", "/VO/MelinoeField_0619" },
					},
				}
			},

		},

		PostCombatReloadThreadedEvents =
		{
			{
				FunctionName = "LockEphyraExits",
				Args = { LockAtSoulPylonCount = 6, Types = { "EphyraExitDoor" } },
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = ">=",
						Value = 6,
					}
				},
			},
			{
				FunctionName = "DestroyEphyraBarrier",
				Args = { Groups = { "HubBarrier_VFX" } },
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = ">=",
						Value = 6,
					}
				},
			},
			{
				FunctionName = "HandlePylonObjective",
				Args = {  },
			},
		},

		OnFamiliarSpawnEvents =
		{
			{
				FunctionName = "AdjustFamiliarPathfinding",
				Args =
				{
					NodeDistance = 16,
					NodeSuccessDistance = 8,
					Points =
					{
						{ X = 0, Y = 17 },
						{ X = -34, Y = 0 },
						{ X = 0, Y = -17 },
						{ X = 34, Y = 0 },
					},
				},
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EquippedFamiliar" },
						IsAny = { "HoundFamiliar", "PolecatFamiliar" },
					},
				},
			},
		},

		PredeterminedDoorRooms =
		{
			[617113] = "N_Combat01", -- SE Lower
			[560725] = "N_Combat02", -- SW
			[560702] = "N_Combat03", -- NW
			[560707] = "N_Combat04", -- NW
			[561337] = "N_Combat05", -- SW
			[560708] = "N_Combat06", -- SE FLIPPED TO SW
			[617138] = "N_Combat07", -- NE Lower
			[560699] = "N_Combat08", -- SE
			[617012] = "N_Combat09", -- NE
			[617151] = "N_Combat10", -- SE Upper
			[561449] = "N_Combat11", -- SE Upper FLIPPED TO SW
			[561389] = "N_Combat12", -- NE FLIPPED TO NW
			[616992] = "N_Combat13", -- NE
			[561403] = "N_Combat14", -- SE
			[560705] = "N_Combat15", -- NE
			[561354] = "N_Combat16", -- NE
			[561424] = "N_Combat17", -- NW
			[561374] = "N_Combat18", -- NE
			[560620] = "N_Combat19", -- NE
			[561418] = "N_Combat20", -- NW Upper
			[560713] = "N_Combat21", -- NE
			[560776] = "N_Combat22", -- NW
			[561368] = "N_Combat23", -- NE
			[617043] = "N_MiniBoss01", -- NE
			[560889] = "N_MiniBoss02", -- SE lower
			[560848] = "N_Story01", -- SE
			--[561395] = "N_Shop01", -- SW

			--[[ Unassigned
			[617024] = NW Upper
			[561380] = NW upper
			[617144] = NE lower
			[617162] = SW
			]]

		},

		IntroPanDuration = 2.0,
		HeroStartPointEndPointLinkIds =
		{
			[50065] = 50059,
		},
		HeroStartPointCameraLinkIds =
		{
			[50065] = 50064,
		},

		HeroEndPointCameraLinkIds =
		{
			[50059] = 50063,
		},

		EnterVoiceLines =
		{
			Cooldowns =
			{
				{ Name = "MelinoeBriefQuipSpeech", Time = 1 },
			},
			-- main entrance, cursed
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 2.65,
				SuccessiveChanceToPlayAll = 0.2,
				PlayOnceFromTableThisRun = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "Hero", "TraitDictionary" },
						HasAny = { "SurfacePenalty" },
					},
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = "<=",
						Value = 0,
					},
				},
				{ Cue = "/VO/MelinoeField_1366", Text = "How... can... I...?" },
				{ Cue = "/VO/MelinoeField_1367", Text = "This... isn't... working..." },
			},
			-- main entrance, heracles
			{
				BreakIfPlayed = true,
				PreLineWait = 1.35,
				ObjectType = "NPC_Heracles_01",
				{ Cue = "/VO/Heracles_0043", Text = "You." },
			},
			-- main entrance
			{
				PlayOnce = true,
				PlayOnceContext = "LeavingErebusHecateMissingVO",
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.15,
				SkipCooldownCheckIfNonePlayed = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},

				{ Cue = "/VO/MelinoeField_4578", Text = "Through Ephyra as before..." },
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.35,
				SuccessiveChanceToPlay = 0.5,
				SuccessiveChanceToPlayAll = 0.1,
				PlayOnceFromTableThisRun = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = "<=",
						Value = 0,
					},
					{
						FunctionName = "RequiredAlive",
						FunctionArgs = { Ids = { 566363 }, Alive = false },
					},
				},
				Cooldowns =
				{
					{ Name = "MelinoeAnyQuipSpeech", Time = 6 },
				},

				-- { Cue = "/VO/MelinoeField_0366", Text = "Wow..." },
				{ Cue = "/VO/MelinoeField_0368", Text = "Best have a look around..." },
				{ Cue = "/VO/MelinoeField_0369", Text = "The main square..." },
				{ Cue = "/VO/Melinoe_1370", Text = "Ephyra's main square...", PlayFirst = true },
				{ Cue = "/VO/MelinoeField_4578", Text = "Through Ephyra as before...",
					GameStateRequirements =
					{
						{
							PathTrue = { "GameState", "ReachedTrueEnding" },
						},
						{
							SumPrevRuns = 8,
							Path = { "SpeechRecord", "/VO/MelinoeField_4578" },
							CountPathTrue = true,
							Comparison = "<=",
							Value = 0,
						},
					},
				},
				{ Cue = "/VO/MelinoeField_0367", Text = "Something's different this time...", PlayFirst = true, PlayOnce = true,
					GameStateRequirements =
					{
						{
							PathTrue = { "GameState", "SpeechRecord", "/VO/Melinoe_1370" }
						},
					},
				},
				{ Cue = "/VO/Melinoe_1371", Text = "Back to the main square." },
				{ Cue = "/VO/Melinoe_1372", Text = "The city square." },
				{ Cue = "/VO/Melinoe_1373", Text = "That barricade's back up...",
					GameStateRequirements =
					{
						{
							Path = { "GameState", "RoomCountCache", "N_Boss01" },
							Comparison = ">=",
							Value = 1,
						},
					},
				},
				{ Cue = "/VO/Melinoe_1374", Text = "Time to break through again.",
					GameStateRequirements =
					{
						{
							Path = { "GameState", "RoomCountCache", "N_Boss01" },
							Comparison = ">=",
							Value = 1,
						},
					},
				},
			},
			-- returning from combat rooms
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.35,
				SuccessiveChanceToPlay = 0.15,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HeraclesFirstMeeting" },
					},
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = ">=",
						Value = 1,
					},
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = "<",
						Value = 6,
					},
					{
						PathTrue = { "GameState", "SpeechRecord", "/VO/MelinoeField_0619" },
					},
					{
						Path = { "GameState", "RoomsEntered", "N_PostBoss01" },
						Comparison = "<=",
						Value = 50,
					},
				},
				{ Cue = "/VO/MelinoeField_0618", Text = "Something's changed...", PlayFirst = true },				
				{ Cue = "/VO/MelinoeField_0374", Text = "They're trying to slow me down..." },
				{ Cue = "/VO/MelinoeField_0375", Text = "So many different streets..." },
				{ Cue = "/VO/MelinoeField_0511", Text = "What next..." },
				{ Cue = "/VO/MelinoeField_0512", Text = "Now what..." },
				{ Cue = "/VO/MelinoeField_0513", Text = "Where next..." },
				{ Cue = "/VO/MelinoeField_0514", Text = "Where else." },
				{ Cue = "/VO/MelinoeField_0515", Text = "Where to from here..." },
				{ Cue = "/VO/MelinoeField_0516", Text = "Next up..." },
				{ Cue = "/VO/MelinoeField_0517", Text = "Getting somewhere." },
				{ Cue = "/VO/MelinoeField_0518", Text = "The air feels different now..." },
				{ Cue = "/VO/MelinoeField_0519", Text = "More Pylons are nearby..." },
				{ Cue = "/VO/MelinoeField_0520", Text = "Next Pylon, then." },
				{ Cue = "/VO/MelinoeField_0376", Text = "Where to this time..." },
				{ Cue = "/VO/MelinoeField_0417", Text = "Few more Pylons left.",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
							Comparison = ">=",
							Value = 3,
						},
						{
							Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
							Comparison = "<",
							Value = 5,
						},
					},
				},
				{ Cue = "/VO/MelinoeField_0418", Text = "Just a few Pylons to go.",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
							Comparison = ">=",
							Value = 3,
						},
						{
							Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
							Comparison = "<",
							Value = 5,
						},
					},
				},
			},
			-- exit open
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.35,
				SuccessiveChanceToPlay = 0.75,
				SuccessiveChanceToPlayAll = 0.25,
				PlayOnceFromTableThisRun = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = ">=",
						Value = 6,
					},
				},
				Cooldowns =
				{
					{ Name = "MelinoeAnyQuipSpeech", Time = 6 },
					{ Name = "BarrierDownVoiceLines", Time = 12 },
				},

				{ Cue = "/VO/MelinoeField_0620", Text = "Now to get out of here." },
				{ Cue = "/VO/MelinoeField_0621", Text = "I'll show myself out..." },
				{ Cue = "/VO/MelinoeField_0622", Text = "Nowhere to go but out.", PlayFirst = true },
				{ Cue = "/VO/MelinoeField_0623", Text = "Time to go." },
				{ Cue = "/VO/MelinoeField_0624", Text = "Finished here." },
				{ Cue = "/VO/MelinoeField_0625", Text = "Should be able to get out." },
			},
		},

		MaxAppearancesThisBiome = 1,
		FlipHorizontalChance = 0.0,

		ObstacleData =
		{
			[664734] =
			{
				Template = "HealthFountainN",
				RecordObjectState = true,
			},
			[645848] =
			{
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "EphyraHubExitPylonEmpty",
							StopAmbientSound = true,
						},
						GameStateRequirements =
						{
							{
								Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
								Comparison = ">=",
								Value = 2,
							}
						},
					},
				},
			},
			[645846] =
			{
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "EphyraHubExitPylonEmpty",
							StopAmbientSound = true,
						},
						GameStateRequirements =
						{
							{
								Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
								Comparison = ">=",
								Value = 4,
							}
						},
					},
				},
			},
			[645851] =
			{
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "EphyraHubExitPylonEmpty",
							StopAmbientSound = true,
						},
						GameStateRequirements =
						{
							{
								Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
								Comparison = ">=",
								Value = 6,
							}
						},
					},
				},
			},
			[645850] =
			{
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "EphyraHubExitPylonEmpty",
							StopAmbientSound = true,
						},
						GameStateRequirements =
						{
							{
								Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
								Comparison = ">=",
								Value = 5,
							}
						},
					},
				},
			},
			[645849] =
			{
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "EphyraHubExitPylonEmpty",
							StopAmbientSound = true,
						},
						GameStateRequirements =
						{
							{
								Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
								Comparison = ">=",
								Value = 3,
							}
						},
					},
				},
			},
			[645847] =
			{
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "EphyraHubExitPylonEmpty",
							StopAmbientSound = true,
						},
						GameStateRequirements =
						{
							{
								Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
								Comparison = ">=",
								Value = 1,
							}
						},
					},
				},
			},
			-- exit barrier / pylon gate
			[664746] =
			{
				Name = "PylonGate",
				SetupGameStateRequirements =
				{
				},
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "EphyraTerrainPylonGate02",
						},
						GameStateRequirements =
						{
							{
								Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
								Comparison = ">=",
								Value = 6,
							}
						},
					},
				},
			},

		},

		InspectPoints =
		{
			[566468] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = "<=",
						Value = 5,
					},
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
				},
				InteractTextLineSets =
				{
					Inspect_N_Hub_01 =
					{
						{ Cue = "/VO/Storyteller_0117",
							Text = "{#Emph}The pathway to the docks is sealed shut by a phantasmal force that neither mortal nor immortal strength can budge." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							{ Cue = "/VO/MelinoeField_0481", Text = "It's drawing strength from Shades..." },
						},
					},
				},
			},
			[566469] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						Path = { "CurrentRun", "SpawnRecord", "SoulPylon" },
						Comparison = "<=",
						Value = 5,
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "Inspect_N_Hub_01" },
					},
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					{
						FunctionName = "RequireRunsSinceTextLines",
						FunctionArgs = { TextLines = { "Inspect_N_Hub_01" }, Min = 1 },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Hub_02 =
					{
						{ Cue = "/VO/Storyteller_0118",
							Text = "{#Emph}A barricade bars passage to the docks beyond the city square, leaving the denizens of the city of Ephyra confined to their ruinous environs." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							{ Cue = "/VO/Melinoe_1434", Text = "We'll get through. Even if it takes every Shade in this city." },
						},
					},
				},
			},
			[662611] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "Inspect_N_Hub_04" },
					},
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					{
						FunctionName = "RequireRunsSinceTextLines",
						FunctionArgs = { TextLines = { "Inspect_N_Hub_04" }, Min = 1 },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Hub_03 =
					{
						{ Cue = "/VO/Storyteller_0152",
							Text = "{#Emph}The barely-held-together city is a labyrinth of streets, some barricaded still, yet others not, each horror-filled, night after endless night." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							{ Cue = "/VO/MelinoeField_0482", Text = "So many mortals lived and died in such a place..." },
						},
					},
				},
			},
			[664917] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "Inspect_N_Hub_02" },
					},
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					{
						FunctionName = "RequireRunsSinceTextLines",
						FunctionArgs = { TextLines = { "Inspect_N_Hub_02", "Inspect_N_Hub_05" }, Min = 1 },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Hub_04 =
					{
						{ Cue = "/VO/Storyteller_0167",
							Text = "{#Emph}A mortal-made stone likeness of the grim lord of the dead stands in the center of the city, looking on at the devastation sown as if in stunned silence." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								BreakIfPlayed = true,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								GameStateRequirements =
								{
									{
										PathFalse = { "GameState", "SpeechRecord", "/VO/MelinoeField_0639" },
									}
								},
								{ Cue = "/VO/MelinoeField_0639", Text = "This is my... Father...", PlayFirst = true },
							},
							{
								PreLineWait = 0.4,
								BreakIfPlayed = true,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								GameStateRequirements =
								{
									{
										PathTrue = { "GameState", "SpeechRecord", "/VO/MelinoeField_0639" },
									},
									{
										Path = { "GameState", "TextLinesRecord" },
										HasNone = { "HadesAboutUltimateProgress01", "ZagreusPastMeeting05" },
									},
								},
								{ Cue = "/VO/Melinoe_0347", Text = "Vengeance for my father." },
							},
						},
					},
				},
			},
			[691487] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "Inspect_N_Hub_02" },
					},
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					{
						FunctionName = "RequireRunsSinceTextLines",
						FunctionArgs = { TextLines = { "Inspect_N_Hub_02", "Inspect_N_Hub_04" }, Min = 1 },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Hub_05 =
					{
						{ Cue = "/VO/Storyteller_0168",
							Text = "{#Emph}Amid the stench of death lies a rejuvenating spring, etched from a block of stone into the likeness of the verdure-goddess and the Underworld's rightful queen." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								BreakIfPlayed = true,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_0814", Text = "This fountain... Mother..." },
							},
						},
					},
				},
			},


		},
	},

	N_Shop01 =
	{	
		InheritFrom = { "N_CombatData", "BaseN" },
		HasFishingPoint = true,
		FishingPointChance = @fishing_chance|0.8@,
		LegalEncounters = { "Shop" },
		ForcedReward = "Shop",
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = EncounterSets.ShopRoomEvents_N,
		NoReroll = true,
		ZoomFraction = 0.875,
		Ambience = "/Ambience/EphyraCityAmbience",
		
		SurfaceShopSpawnChance = 0.25,

		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure", },
			},
			{
				Path = { "CurrentRun", "RoomCountCache", },
				HasAny = { "N_PreHub01", "Chaos_01", "Chaos_02", "Chaos_03", "Chaos_04", "Chaos_05", "Chaos_06" },
			},
		},

		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 561398,
				NextHeroEndPoint = 561401,
			}
		},

		EntranceDirection = "Left",
		FlipHorizontalChance = 0.0,

		-- Ambience = "/Leftovers/Object Ambiences/ShipwreckAmbience",
		SpawnRewardGlobalVoiceLines = "FoundShopVoiceLines",
	},

	N_PreBoss01 =
	{
		InheritFrom = { "BaseN" },
		HasFishingPoint = true,
		Ambience = "/Ambience/EphyraOutsideAmbience",

		LinkedRooms = { "N_Boss01", "N_Boss02" },

		GameStateRequirements =
		{
			{
				PathTrue = { "CurrentRun", "RoomCountCache", "N_Hub" },
			},
		},
		
		ZagContractRewardDestinationId = 776338,
		
		SecretSpawnChance = 0.0,

		FishingPointChance = @fishing_chance|0.4@,

		SurfaceShopSpawnChance = 0.0,
		ChallengeSpawnChance = 0.0,

		SkipLastKillPresentation = true,
		LegalEncounters = { "Shop" },
		ForcedFirstReward = "Shop",
		StartUnthreadedEvents = EncounterSets.ShopRoomEvents,
		--ForcedRewardStore = "RunProgress",
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		SpawnRewardOnId = 561335,

		DisableRewardMagnetisim = true,

		ResetBinksOnExit = true,

		FlipHorizontalChance = 0.0,

		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,

		ObstacleData =
		{
		},

		IgnoreStemMixer = true,
		MusicMutedStems = { "Drums", "Bass", "Guitar", },

		InspectPoints =
		{
			[646285] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "RoomCountCache", "N_Boss01" },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_PreBoss01_01 =
					{
						{ Cue = "/VO/Storyteller_0155",
							Text = "{#Emph}Doomed city at her back, the Princess of the Dead heads toward a dismal pasture, where she senses she is not exactly being watched." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_1363", Text = "Polyphemus must already know I'm here..." },
							},
						},
					},
				},
			},

			[691528] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_PreBoss01_02 =
					{
						{ Cue = "/VO/Storyteller_0269",
							Text = "{#Emph}A lonesome, dusty path from the necropolis exhibits much of the decay within, yet provides comfort of a sort to all the many simple Shades nearby with nowhere left to go." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_1954", Text = "We'll find you a new home." },
							},
						},
					},
				},
			},

			[756311] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						FunctionName = "RequiredAlive",
						FunctionArgs = { Units = { "NPC_Charon_01", }, Alive = true },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_PreBoss01_03 =
					{
						{ Cue = "/VO/Storyteller_0154",
							Text = "{#Emph}Across the River Acheron, the Underworld Boatman travels between realms, through hidden borders, unseen as a shadow in the dark." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_0484", Text = "Is there anywhere Lord Charon cannot row?" },
							},
							{
								PreLineWait = 0.5,
								ObjectType = "NPC_Charon_01",

								{ Cue = "/VO/Charon_0051", Text = "{#Emph}Nrrgghhh..." },
							},
						},
					},
				},
			},

		},

	},

	N_Boss01 =
	{
		InheritFrom = { "BaseN" },
		GameStateRequirements =
		{
			{
				FunctionName = "RequiredShrineLevel",
				FunctionArgs =
				{
					ShrineUpgradeName = "BossDifficultyShrineUpgrade",
					Comparison = "<",
					Value = 1,
				},
			},
		},

		FlipHorizontal = false,
		FlipHorizontalChance = 0,

		RequiresLinked = true,
		LinkedRoom = "N_PostBoss01",
		ExitPreviewAnim = "ExitAheadPreview",
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		Ambience = "/Ambience/EphyraOutsideAmbience",
		ReverbValue = 0.75,
		GlobalEcho = 0.5,
		SpeakerName = "Polyphemus",

		ResetBinksOnEnter = true,
		ResetBinksOnExit = true,
		LegalEncounters = { "BossPolyphemus01", },
		ForcedReward = "MixerNBossDrop",
		NoReroll = true,

		BackupCauseOfDeath = "Polyphemus",

		EntranceFunctionName = "RoomEntranceBoss",
		EntranceFunctionArgs = { AngleTowardsIdOnEnd = 558039 },
		IntroSequenceDuration = 2.7,
		BlockCameraReattach = true,
		ZoomFraction = 0.7,

		SheepExitId = 658446,

		StartUnthreadedEvents = {},
		
		UnthreadedEvents =
		{
			{
				FunctionName = "BossIntro",
				Args =
				{
					ProcessTextLinesIds = { 558039 },
					SetupBossIds = { 558039 },
					DelayedStart = true,
				},
			},
		},

		InspectPoints =
		{
			[737758] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Boss01_01 =
					{
						{ Cue = "/VO/Storyteller_0270",
							Text = "{#Emph}There is an old adage which goes, one would be wise never to strike a sleeping Cyclops, and instead carefully walk by; but at times, exceptions must be made." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_1955", Text = "I might make one of those exceptions now..." },
							},
						},
					},
				},
			},
			[737760] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Boss01_02 =
					{
						{ Cue = "/VO/Storyteller_0271",
							Text = "{#Emph}If once this was a pasture in which livestock grazed and roamed, now little evidence of this remains; only the mud, and half-burnt vestiges of a more-peaceful time." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_1956", Text = "Polyphemus should be tending to this place..." },
							},
						},
					},
				},
			},
		},

		EnterVoiceLines =
		{
			{ GlobalVoiceLines = "PolyphemusGreetingLines" },
		},
	},

	N_Boss02 =
	{
		InheritFrom = { "BaseN" },
		GameStateRequirements =
		{
			{
				FunctionName = "RequiredShrineLevel",
				FunctionArgs =
				{
					ShrineUpgradeName = "BossDifficultyShrineUpgrade",
					Comparison = ">=",
					Value = 1,
				},
			},
		},

		FlipHorizontal = false,
		FlipHorizontalChance = 0,

		RequiresLinked = true,
		LinkedRoom = "N_PostBoss01",
		ExitPreviewAnim = "ExitAheadPreview",
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		Ambience = "/Ambience/EphyraOutsideAmbience",
		ReverbValue = 0.75,
		GlobalEcho = 0.5,
		SpeakerName = { "Polyphemus", "Selene" },

		ResetBinksOnEnter = true,
		ResetBinksOnExit = true,
		LegalEncounters = { "BossPolyphemus02", },
		ForcedReward = "MixerNBossDrop",
		NoReroll = true,

		BackupCauseOfDeath = "Polyphemus",
		
		SheepExitId = 737999,

		EntranceFunctionName = "RoomEntranceBoss",
		EntranceFunctionArgs = { AngleTowardsIdOnEnd = 675068 },
		IntroSequenceDuration = 2.7,
		BlockCameraReattach = true,
		ZoomFraction = 0.7,

		StartUnthreadedEvents = {},

		UnthreadedEvents =
		{
			{
				FunctionName = "BossIntro",
				Args =
				{
					ProcessTextLinesIds = { 675068, },
					SetupBossIds = { 675068, },
					SetupUnitIdAIs = { 737907 },
					DelayedStart = true,
				},
			},
		},

		StartThreadedEvents =
		{
			{
				FunctionName = "ChooseMedeaIntroPresentation",
				Args =
				{
					MedeaId = 737907,
					Delay = 1.0,
					Angle = 242,
					ProcessTextLinesIds = { 675068, },
					AlreadyPresentRequirements =
					{
						{
							PathFromSource = true,
							Path = { "QueuedBossIntroTextLines", "Name" },
							IsAny = {
								"PolyphemusAboutAltFight02",
								"PolyphemusAboutAltFight06",
								"PolyphemusAboutAltFight08",
								"PolyphemusAboutAltFight09",
								"PolyphemusAboutAltFight10",
								"MedeaMiscStart22",
							},
						},
					}
				},
			},
		},
		InspectPoints =
		{
			[793949] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Boss02_01 =
					{
						{ Cue = "/VO/Storyteller_0423",
							Text = "{#Emph}The noxious, death-strewn field beyond the city of Ephyra now lies still once more, although a sense of rising Fear yet lingers with the many restless souls that there reside." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,

							{ Cue = "/VO/MelinoeField_3616", Text = "Lady Medea certainly transformed this place." },
						},
					},
				},
			},
			[794211] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Boss02_02 =
					{
						{ Cue = "/VO/Storyteller_0458",
							Text = "{#Emph}On such particularly fearsome nights, the Witch of Shadows is believed to haunt this awfully putrescent field, whilst conducting her profane experiments upon the dead." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							{ Cue = "/VO/MelinoeField_3656", Text = "Still feel a little nauseous after that..." },
						},
					},
				},
			},
		},

		EnterVoiceLines =
		{
			{ GlobalVoiceLines = "PolyphemusGreetingLines" },
		},		
	},

	N_PostBoss01 =
	{
		InheritFrom = { "BaseN" },
		RichPresence = "#RichPresence_PostBossSurface",
		LegalEncounters = { "Empty" },

		UnthreadedEvents = EncounterSets.EncounterEventsNonCombat,

		GameStateRequirements =
		{
			-- None
		},

		RequiresLinked = true,
		NextRoomSet = { "O", },
		ExitPreviewAnim = "ExitAheadPreview",
		IgnoreMusic = true,
		BlockRunProgressUI = true,
		Ambience = "/Ambience/EphyraSmallInteriorAmbience",
		EntranceDirection = "Right",
		NoReward = true,
		NoReroll = true,
		ZoomFraction = 0.75,
		ReverbValue = 1.0,
		GlobalEcho = 0.0,

		FlipHorizontalChance = 0.0,
		IntroSequenceDuration = 0.7,

		ExitPath = { 558947 },

		SkipLastKillPresentation = true,
		ChallengeSpawnChance = 0.0,
		SurfaceShopSpawnChance = 1.0,
		ForceSurfaceShop = true,
		 
		WellShopSpawnChance = 0.0,
		ForceWellShop = false,
		SecretSpawnChance = 0.0,
		SellTraitShrineUpgrade = true,

		StartUnthreadedEvents = {},

		SurfaceShopRequirements =
		{
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossSurfaceShops" },
			},
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfaceShops" },
			},
			{
				Path = { "CurrentRun", "BiomeDepthCache" },
				Comparison = ">=",
				Value = 3,
			},
			{
				SumPrevRooms = 3,
				Path = { "SurfaceShop" },
				CountPathTrue = true,
				Comparison = "<=",
				Value = 0,
			},
		},

		ObstacleData =
		{
			[560870] =
			{
				Template = "HealthFountainN",
				Activate = true,
				SetupGameStateRequirements =
				{
					-- None
				},
				BlockExitUntilUsed = true,
			},

			[616857] =
			{
				Template = "GiftRack",
				Activate = true,
				ActivateIds = { 616859, 616858, 616860, 616861, },
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossGiftRack", },
					},
				},
			},
			[616862] =
			{
				Template = "ChallengeSwitchBase",
				Activate = true,
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossSurfaceShops" },
					},
				},
			},
		},

		LeavePostPresentationEvents =
		{
			{
				FunctionName = "BiomeMapPresentation",
				Args =
				{
					HeroStartOffsetX = 620,
					HeroStartOffsetY = -585,

					FamiliarStartOffsetX = 710,
					FamiliarStartOffsetY = -535,

					HeroMoveOffsetX = -580,
					HeroMoveOffsetY = -300,
					HeroMoveDuration = 1.4,

					FamiliarMoveOffsetX = -580,
					FamiliarMoveOffsetY = -300,
					FamiliarMoveDuration = 1.4,

					MoveEaseIn = 0.5,
					MoveEaseOut = 1.0,

					BiomeStart = "BiomeN",
					BiomeEnd = "BiomeO",
					PreviousBiomes = { },

					AdditionalFirstTimeWait = 1.15,

					--CrossroadsStart = true,
					
				},
				GameStateRequirements =
				{
					-- None
				}
			},
		},

		InspectPoints =
		{
			[560869] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						--
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_PostBoss01_01 =
					{
						{ Cue = "/VO/Storyteller_0272",
							Text = "{#Emph}Across a foul-smelling hovel crudely furnished with assorted fixtures of exaggerated proportion, and strewn with remains both fresh and long-decayed, comes a waft of sea-borne air..." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_1957", Text = "I smell mostly the decay..." },
							},
						},
					},
				},
			},

			[723001] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "Inspect_N_PostBoss01_01" },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_PostBoss01_02 =
					{
						{ Cue = "/VO/Storyteller_0273",
							Text = "{#Emph}Unfortunate livestock residing with the ravenous Cyclops seem to be unaware of the conditions under which they graze about and wander, not exactly lost; at least, not yet." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_1958", Text = "The one they have to guide them is asleep..." },
							},
						},
					},
				},

			},

		},

		EnterVoiceLines =
		{
			Cooldowns =
			{
				{ Name = "MelinoeAnyQuipSpeech" },
			},
			{
				PreLineWait = 3.2,
				RandomRemaining = true,
				BreakIfPlayed = true,
				SuccessiveChanceToPlay = 0.33,
				SuccessiveChanceToPlayAll = 0.1,

				{ Cue = "/VO/MelinoeField_1729", Text = "Must be where Polyphemus lives... {#Emph}eugh...", PlayFirst = true, PlayOnce = true },
				{ Cue = "/VO/MelinoeField_1730", Text = "Will not be staying long..." },
				{ Cue = "/VO/MelinoeField_2056", Text = "Filthy here as ever..." },
				{ Cue = "/VO/MelinoeField_2057", Text = "How does he live like this?" },
				{ Cue = "/VO/MelinoeField_2058", Text = "That {#Emph}smell..." },
				{ Cue = "/VO/Melinoe_1721", Text = "Such a mess." },
			},
		},
		--[[
		ExitVoiceLines =
		{
			PreLineWait = 0.5,
			RandomRemaining = true,
			BreakIfPlayed = true,
			GameStateRequirements =
			{
				{
				},
			},


		},
		]]--
		
	},

	N_CombatData =
	{
		DebugOnly = true,

		PersistentExitDoorRewards = true,
		PersistentRoomForDoors = true,
		SaveWhitelist =
		{
			ObjectStates = true,
		},

		PickaxePointRequirements =
		{
			{
				Path = { "GameState", "CompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				SumPrevRooms = @pickaxe_distance|12@,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = @pickaxe_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = @pickaxe_other_lock|0@,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = @pickaxe_other_lock|0@,
			},

			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "OreNBronze" },
						Comparison = "<",
						Value = 30,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 5,
						Path = { "NumShovelPoints" },
						Comparison = "<=",
						Value = @pickaxe_other_lock|0@,
					},
				},
			},
		},
		
		CheckObjectStatesOnStartRoom = true,

		ForcedRewardStore = "HubRewards",

		ArtemisUseHeroStart = true,

		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "RoomCountCache", },
				HasAny = { "N_PreHub01", "Chaos_01", "Chaos_02", "Chaos_03", "Chaos_04", "Chaos_05", "Chaos_06" },
			}
		},

		LeaveEvents =
		{
			--{ FunctionName = "CollectRemainingMercenaries", },
		},

		StartThreadedEvents =
		{
			{
				FunctionName = "HandlePylonObjective",
			},
			{
				FunctionName = "ShadeMercManager", GameStateRequirements = { ChanceToPlay = 0.1 }, Args = { StartingCountMin = 1, StartingCountMax = 5, ObjectNames = { "ShadeMerc" }, MaxActive = 5, RequireForExit = false } }, -- turned to zero since they are 'trapped' in the Pylons
			{
				FunctionName = "PolyphemusBoulderManager", GameStateRequirements = { ChanceToPlay = 0.25 },
				Args =
				{ 
					IntervalMin = 2.5, IntervalMax = 10.0, TotalCountMin = 1, TotalCountMax = 3, StartingCountMin = 0, StartingCountMax = 2,
					ReticleAnimation = "PolyphemusBoulderWarningDecal", Fuse = 5.0, ProjectileName = "PolyphemusBoulderSky"
				},
			},
			{
				FunctionName = "ActivatePrePlaced",
				GameStateRequirements =
				{
					ChanceToPlay = 0.5,
					{
						PathTrue = { "GameState", "EncountersOccurredCache", "BossPolyphemus01" },
					},
				},
				Args =
				{
					Types =
					{
						"BattleStandard",
					},
				},
			},

		},

		PostCombatReloadThreadedEvents =
		{
			{
				FunctionName = "HandlePylonObjective",
				Args = {  },
			},
		},

		EnterVoiceLines =
		{
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.85,
				SuccessiveChanceToPlay = 0.15,
				PlayOnceFromTableThisRun = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeSurfacePenaltyCure" },
					},
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsNone = { "N_Hub", "N_PreHub01" },
					},
					{
						Path = { "CurrentRun", "CurrentRoom", "Encounter", "Name" },
						IsNone = { "HeraclesCombatN" },
					},
				},

				--
			},
		},
	},

	N_BaseMiniBoss =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		DebugOnly = true,

		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",

		ForcedRewardStore = "RunProgress",
		EligibleRewards = { "Boon" },
		BoonRaritiesOverride = { Legendary = 0.05, Epic = 0.10, Rare = 0.90 },

		MaxCreationsThisRun = 1,
		MaxAppearancesThisBiome = 1,
		FlipHorizontalChance = 0.0,

		CombatResolvedVoiceLines =
		{
			{ GlobalVoiceLines = "MiniBossEncounterEndVoiceLines" },
		},
		
		MusicSection = 2,
		MusicActiveStems = { "Guitar", "Bass", "Drums", },
		EndMusicOnCombatOver = 20,
	},

	N_MiniBoss01 =
	{
		InheritFrom = { "N_BaseMiniBoss" },
		
		Ambience = "/Ambience/EphyraCityAmbience",

		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 617042,
				NextHeroEndPoint = 617038,
			}
		},

		LegalEncounters = { "MiniBossSatyrCrossbow" },

		EntranceDirection = "Left",
		ZoomFraction = 0.85,
	},

	N_MiniBoss02 =
	{
		InheritFrom = { "N_BaseMiniBoss" },
		
		Ambience = "/Ambience/EphyraCityAmbienceOutdoorNoFire",

		IntroSequenceDuration = 1.0,

		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 560889,
				NextHeroEndPoint = 561166,
			}
		},

		EntranceFunctionName = "RoomEntranceBoss",
		EntranceFunctionArgs =
		{
			AngleTowardsIdOnEnd = 50059,
			BossType = "Boar",
			DelayedStart = true,
			BossIntroSound = "/SFX/Enemy Sounds/ZombieBoarMiniboss/BoarSqueal",
			BossIntroAnimation = "Enemy_Boar_Roar",
			--BossIntroDelay = 2.0,
			EnterWait = 0.75,
			BossIntroShake = true,
			BossIntroShakeDuration = 1.8,
		},

		UnthreadedEvents =
		{
			{
				FunctionName = "BossIntro",
				Args =
				{
					UnlockDelay = 2.0,
					SetupBossTypes = { "Boar", "Boar_Shadow" },
				},
			},
		},

		LegalEncounters = { "MiniBossBoar" },

		EntranceDirection = "Right",
		ZoomFraction = 0.85,

		ThreadEnterVoiceLines = true,
		EnterVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.65,
			SuccessiveChanceToPlayAll = 0.33,
			GameStateRequirements =
			{
				{
					Path = { "CurrentRun", "CurrentRoom", "Encounter", "Name" },
					IsAny = { "MiniBossBoar" },
				},
			},

			{ Cue = "/VO/MelinoeField_3707", Text = "The Boar of Erymanthus...", PlayFirst = true },
			{ Cue = "/VO/MelinoeField_3708", Text = "That rotting boar again." },
			{ Cue = "/VO/MelinoeField_3710", Text = "You don't remember me, do you?" },
			{ Cue = "/VO/MelinoeField_3711", Text = "Pure instinct and rage..." },
			{ Cue = "/VO/MelinoeField_3709", Text = "You don't like staying down for long.",
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EnemyKills", "Boar" },
						Comparison = ">=",
						Value = 2,
					},
				},
			},
		},

		InspectPoints =
		{
			[800454] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_MiniBoss02_01 =
					{
						{ Cue = "/VO/Storyteller_0462",
							Text = "{#Emph}Too many hunters failed to tame the massive raging Boar of Erymanthus whilst it lived and breathed; and not even Death has been able to still its mighty hooves and tusks." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_3660", Text = "I did, though! For now." },
							},
						},
					},
				},
			},
		},
	},

	N_Combat01 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		LegalEncounters = EncounterSets.NEncountersBigger,

		ZoomFraction = 0.78,

		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 617114,
				NextHeroEndPoint = 617112,
			}
		},
	},

	N_Combat02 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		ReverbValue = 1.0,

		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 561161,
				NextHeroEndPoint = 561164,
			}
		},

		PredeterminedDoorRooms =
		{
			[558353] = "N_Sub01",
			[558352] = "N_Sub03",
		}
	},

	N_Combat03 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561415,
				NextHeroEndPoint = 561144,
			}
		},
		
		PredeterminedDoorRooms =
		{
			[558353] = "N_Sub04",
		}
	},

	N_Combat04 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		ReverbValue = 1.0,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561153,
				NextHeroEndPoint = 660483,
			}
		},
		
		PredeterminedDoorRooms =
		{
			[558834] = "N_Sub02",
			[558410] = "N_Sub06",
		}
	},

	N_Combat05 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 561341,
				NextHeroEndPoint = 561338,
			}
		},
		
		PredeterminedDoorRooms =
		{
			[558354] = "N_Sub02",
			[558378] = "N_Sub07",
			[558379] = "N_Sub03",
		}
	},

	N_Combat06 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		FlipHorizontalChance = 1.0,

		ZoomFraction = 0.78,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 561178,
				NextHeroEndPoint = 561175,
			}
		},
		
		PredeterminedDoorRooms =
		{
			[558378] = "N_Sub10",
			[560794] = "N_Sub05",
		}
	},

	N_Combat07 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 617140,
				NextHeroEndPoint = 617136,
			}
		},
	},

	N_Combat08 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		HasExorcismPoint = false,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 561189,
				NextHeroEndPoint = 561185,
			}
		},
	},

	N_Combat09 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		LegalEncounters = EncounterSets.NEncountersBigger,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561141,
				NextHeroEndPoint = 617007,
			}
		},
		
		PredeterminedDoorRooms =
		{
			[566392] = "N_Sub11",
			[566536] = "N_Sub08",
			[566394] = "N_Sub14",
		}
	},

	N_Combat10 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		LegalEncounters = EncounterSets.NEncountersBigger,

		ZoomFraction = 0.8,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 617155,
				NextHeroEndPoint = 617153,
			}
		},
		
		PredeterminedDoorRooms =
		{
			[558352] = "N_Sub05",
			[567015] = "N_Sub09",
		}
	},

	N_Combat11 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		LegalEncounters = EncounterSets.NEncountersBigger,

		FlipHorizontalChance = 1.0,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 561448,
				NextHeroEndPoint = 561450,
			}
		},
		PredeterminedDoorRooms =
		{
			[558352] = "N_Sub01",
		},
	},

	N_Combat12 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		FlipHorizontalChance = 1.0,

		ReverbValue = 1.0,

		ZoomFraction = 0.850,

		LegalEncounters = EncounterSets.NEncountersSmaller,
		IneligibleRewards = RewardSets.HubCombatRoomEasyBans,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561392,
				NextHeroEndPoint = 561393,
			}
		},
		PredeterminedDoorRooms =
		{
			[558352] = "N_Sub09",
			[566544] = "N_Sub10",
			[566545] = "N_Sub07",
		},
	},

	N_Combat13 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		LegalEncounters = EncounterSets.NEncountersBigger,

		ZoomFraction = 0.785,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 616997,
				NextHeroEndPoint = 616993,
			}
		},
	},

	N_Combat14 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		Ambience = "/Ambience/EphyraCityAmbience",
		ReverbValue = 0.8,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 561406,
				NextHeroEndPoint = 561399,
			}
		},
	},

	N_Combat15 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		ZoomFraction = 0.785,

		LegalEncounters = EncounterSets.NEncountersBigger,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561174,
				NextHeroEndPoint = 561171,
			}
		},
		PredeterminedDoorRooms =
		{
			[657623] = "N_Sub03",
		},
	},

	N_Combat16 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		HasFishingPoint = true,
		FishingPointChance = @fishing_chance|0.8@,

		LegalEncounters = EncounterSets.NEncountersBigger,

		ZoomFraction = 0.795,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561352,
				NextHeroEndPoint = 561349,
			}
		},
		PredeterminedDoorRooms =
		{
			[558352] = "N_Sub04",
		},
	},

	N_Combat17 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },

		ZoomFraction = 0.825,

		ReverbValue = 1.7,

		LegalEncounters = EncounterSets.NEncountersSmaller,
		IneligibleRewards = RewardSets.HubCombatRoomEasyBans,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561421,
				NextHeroEndPoint = 561422,
			}
		},
		PredeterminedDoorRooms =
		{
			[558352] = "N_Sub11",
		},
	},

	N_Combat18 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		ZoomFraction = 0.765,

		LegalEncounters = EncounterSets.NEncountersBigger,

		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561377,
				NextHeroEndPoint = 561366,
			}
		},
		PredeterminedDoorRooms =
		{
			[658853] = "N_Sub12",
		},
	},

	N_Combat19 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		ZoomFraction = 0.72,
		Ambience = "/Ambience/EphyraCityAmbience",

		LegalEncounters = EncounterSets.NEncountersBigger,

		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561149,
				NextHeroEndPoint = 561154,
			}
		},
	},

	N_Combat20 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		ZoomFraction = 0.75,
		HasHarvestPoint = false,
		ReverbValue = 1.7,

		LegalEncounters = EncounterSets.NEncountersBigger,

		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 617011,
				NextHeroEndPoint = 660485,
			}
		},
		PredeterminedDoorRooms =
		{
			[659508] = "N_Sub06",
		},
	},

	N_Combat21 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		ZoomFraction = 0.70,

		LegalEncounters = EncounterSets.NEncountersBigger,
		
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561135,
				NextHeroEndPoint = 561138,
			}
		},
	},

	N_Combat22 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		ZoomFraction = 0.785,
		ReverbValue = 1.0,
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561158,
				NextHeroEndPoint = 561159,
			}
		},
		PredeterminedDoorRooms =
		{
			[558352] = "N_Sub14",
			[661338] = "N_Sub02",
		},
	},

	N_Combat23 =
	{
		InheritFrom = { "N_CombatData", "BaseN" },
		ZoomFraction = 0.785,
		ReverbValue = 1.0,
		OnUseSetRunData =
		{
			EphyraExitDoorReturn =
			{
				NextHeroStartPoint = 561383,
				NextHeroEndPoint = 561378,
			}
		},
		PredeterminedDoorRooms =
		{
			[755971] = "N_Sub12",
			[755184] = "N_Sub13",
			[755185] = "N_Sub15",
		},
	},

	-- NPC room layout 1
	N_Story01 =
	{
		InheritFrom = { "BaseN" },
		HasFishingPoint = true,
		ForcedReward = "Story",
		NoReroll = true,
		MaxCreationsThisRun = 1,
		ForceIfUnseenForRuns = 3,
		ReverbValue = 0.5,

		FishingPointChance = @fishing_chance|0.40@,

		HarvestPointRequirements =
		{
			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "PlantNMoss" },
						Comparison = "<",
						Value = 8,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		ShovelPointRequirements =
		{
			{
				Path = { "GameState", "CompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},

			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "PlantNGarlicSeed" },
						Comparison = "<",
						Value = 6,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		PickaxePointRequirements =
		{
			{
				Path = { "GameState", "CompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},

			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "OreNBronze" },
						Comparison = "<",
						Value = 18,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},

		IgnoreHarvestBiomeSpawnLimit = true,

		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,

		OnUseSetRunData =
		{
			EphyraExitDoorReturnNE =
			{
				NextHeroStartPoint = 561184,
				NextHeroEndPoint = 561180,
			}
		},
		PersistentExitDoorRewards = true,
		PersistentRoomForDoors = true,
		SaveWhitelist =
		{
			ObjectStates = true,
		},
		LinkedRoom = "N_Hub",

		ZoomFraction = 0.875,
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "HeraclesFirstMeeting" },
			},
			{
				Path = { "CurrentRun", "RoomCountCache", },
				HasAny = { "N_PreHub01", "Chaos_01", "Chaos_02", "Chaos_03", "Chaos_04", "Chaos_05", "Chaos_06" },
			},
			NamedRequirementsFalse = { "StandardPackageBountyActive" },
		},

		SecretMusic = "/Music/IrisMusicMedeaTheme_MC",
		TimerBlock = "StoryRoom",

		FlipHorizontalChance = 0.0,
		LegalEncounters = { "Story_Medea_01" },

		InspectPoints =
		{
			[557999] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "UseRecord", "NPC_Medea_01" },
					},
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_N_Story_01_01 =
					{
						{ Cue = "/VO/Storyteller_0153",
							Text = "{#Emph}In one forgotten recess of the fallen city, a solitary seeker of profane mysteries conducts her undertakings beneath a pale, distant Moon." },
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								UsePlayerSource = true,
								RequiredMinElapsedTime = 3,
								{ Cue = "/VO/MelinoeField_0483", Text = "I've learned a curse or two from this one..." },
							},
							{
								PreLineWait = 0.4,
								ObjectType = "NPC_Medea_01",

								{ Cue = "/VO/Medea_0116", Text = "A pox upon our enemies." },
							}
						},
					},
				},
			},
		},

		ThreadedEvents =
		{
			{ FunctionName = "MedeaMusicManager" },
			{
				FunctionName = "CheckObjectiveSetSource",
				Args =
				{
					ObjectiveSetName = "GiftMedeaPoints",
				},
			},
		},
	},	

}
AddTableKeysCheckDupes( RoomData, RoomSetData.N )

RoomSetData.N_SubRooms =
{
	BaseN_SubRooms =
	{
		DebugOnly = true,
		ResultText = "RunHistoryScreenResult_Ephyra",

		IndividualRewardStore = "SubRoomRewards",
		IgnoreForRewardStoreCount = true,

		SaveProfileLocationText = "BiomeN_Short",
		MaintainSpellCharge = true,
		IgnoreEncounterUses = true,
		SkipRoomsPerUpgrade = true,
		SkipGamePhaseTick = true,

		HasHarvestPoint = true,
		HasShovelPoint = true,
		HasPickaxePoint = true,
		HasFishingPoint = false,
		HasExorcismPoint = true,

		HarvestPointRequirements = RoomData.BaseN.HarvestPointRequirements,
		ShovelPointRequirements = RoomData.BaseN.ShovelPointRequirements,
		PickaxePointRequirements = RoomData.BaseN.PickaxePointRequirements,
		FishingPointRequirements = RoomData.BaseN.FishingPointRequirements,
		ExorcismPointRequirements = RoomData.BaseN.ExorcismPointRequirements,

		LegalEncounters = EncounterSets.NEncountersSubRoom,
		TimeChallengeEncounterOptions = { "TimeChallengeN" },

		MaxAppearancesThisBiome = 999,

		BreakableValueOptions = { MaxHighValueBreakables = 1 },
		BreakableHighValueChanceMultiplier = 2.0,

		Ambience = "/Ambience/EphyraSmallInteriorAmbience",
		StopSecretMusic = true,
		ReverbValue = 0.1,

		SecretSpawnChance = 0,
		ChallengeSpawnChance = 0.0,
		PerfectClearSwitchSpawnChance = 0.0,
		EliteSwitchSpawnChance = 0.0,
		SurfaceShopSpawnChance = 0.08,
		CheckObjectStatesOnStartRoom = true,
		AllowReroll = false,
		NoReroll = true,

		BlockAthenaEncounterKeepsake = true,

		StartThreadedEvents =
		{
			{
				FunctionName = "HandlePylonObjective",
			},
			{
				FunctionName = "ShadeMercManager",
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeShadeMercs" },
					},
					ChanceToPlay = 0.5,
				},
				Args = { StartingCountMin = 0, StartingCountMax = 3, ObjectNames = { "ShadeMerc" }, MaxActive = 3, RequireForExit = false }
			},
			{
				FunctionName = "PolyphemusBoulderManager", GameStateRequirements = { ChanceToPlay = 1.0 },
				Args =
				{ 
					IntervalMin = 2.5, IntervalMax = 10.0, TotalCountMin = 1, TotalCountMax = 3, StartingCountMin = 0, StartingCountMax = 2,
					ReticleAnimation = "PolyphemusBoulderWarningDecal", Fuse = 5.0, ProjectileName = "PolyphemusBoulderSky"
				}
			},

		},

		PostCombatReloadThreadedEvents =
		{
			{
				FunctionName = "HandlePylonObjective",
				Args = {  },
			},
		},
	},

	N_Sub01 =
	{
		InheritFrom = { "BaseN_SubRooms" },

		EntranceDirection = "Left",
	},

	N_Sub02 =
	{
		InheritFrom = { "BaseN_SubRooms" },

		EntranceDirection = "Right",

		LegalEncounters = EncounterSets.NEncountersSubRoomLight,
	},

	N_Sub03 =
	{
		InheritFrom = { "BaseN_SubRooms" },

		EntranceDirection = "Left",
		ZoomFraction = 0.85,
	},

	N_Sub04 =
	{
		InheritFrom = { "BaseN_SubRooms" },

		EntranceDirection = "Left",
	},

	N_Sub05 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		ReverbValue = 1.0,
		Ambience = "/Ambience/EphyraCityAmbienceOutdoor",

		EntranceDirection = "Left",
	},

	N_Sub06 =
	{
		InheritFrom = { "BaseN_SubRooms" },

		ZoomFraction = 0.85,
		EntranceDirection = "Left",
	},

	N_Sub07 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		Ambience = "/Ambience/EphyraCityAmbienceOutdoor",
		
		RushMaxRangeOverride = 475,

		EntranceDirection = "Right",
	},

	N_Sub08 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		ZoomFraction = 0.85,

		EntranceDirection = "Left",
	},

	N_Sub09 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		ZoomFraction = 0.85,

		EntranceDirection = "Right",

		LegalEncounters = EncounterSets.NEncountersSubRoomHeavy,
		IndividualRewardStore = "SubRoomRewardsHard",
	},

	N_Sub10 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		ZoomFraction = 0.85,

		EntranceDirection = "Left",

		LegalEncounters = EncounterSets.NEncountersSubRoomHeavy,
		IndividualRewardStore = "SubRoomRewardsHard",
	},

	N_Sub11 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		ZoomFraction = 0.85,
		Ambience = "/Ambience/EphyraCityAmbience",

		EntranceDirection = "Right",

		LegalEncounters = EncounterSets.NEncountersSubRoomHeavy,
		IndividualRewardStore = "SubRoomRewardsHard",
	},

	N_Sub12 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		ZoomFraction = 0.85,
		EntranceDirection = "Right",
	},

	N_Sub13 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		ZoomFraction = 0.85,
		EntranceDirection = "Right",
	},

	N_Sub14 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		ReverbValue = 1.0,
		Ambience = "/Ambience/EphyraCityAmbienceOutdoorNoFire",
		ZoomFraction = 0.85,

		EntranceDirection = "Left",

		LegalEncounters = EncounterSets.NEncountersSubRoomHeavy,
		IndividualRewardStore = "SubRoomRewardsHard",
	},

	N_Sub15 =
	{
		InheritFrom = { "BaseN_SubRooms" },
		Ambience = "/Ambience/EphyraCityAmbienceOutdoorNoFire",
		ZoomFraction = 0.85,
		EntranceDirection = "Right",
	},
}

AddTableKeysCheckDupes( RoomData, RoomSetData.N_SubRooms )
