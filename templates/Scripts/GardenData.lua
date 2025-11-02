GardenData =
{
	JustPlantedAnimation = "GardenPlotJustPlanted",
	PlotOrder =
	{
		583640, -- top-left
		583641, -- top-right
		558335, -- middle-left
		583642, -- middle-right
		558337, -- bottom-left
		583643, -- bottom-right
	},

	Seeds =
	{
		SeedMystery =
		{
			GrowTimeMin = @garden_grow_scale|11@,
			GrowTimeMax = @garden_grow_scale|11@,
			RandomOutcomes =
			{
				{
					Weight = 4,
					AddResources =
					{
						PlantFNightshade = 1,
					},
					SproutedAnimation = "PlantFNightshadeSprouted",
					ReadyToHarvestAnimation = "PlantFNightshadeReadyToHarvest",
					BonusSeedName = "PlantFNightshadeSeed",
				},
				{
					GameStateRequirements =
					{
						{
							Path = { "GameState", "LifetimeResourcesGained", "PlantGCattailSeed" },
							Comparison = ">=",
							Value = 1,
						},
					},
					Weight = 3,
					AddResources =
					{
						PlantGCattail = 1,
					},
					SproutedAnimation = "PlantGCattailSprouted",
					ReadyToHarvestAnimation = "PlantGCattailReadyToHarvest",
					BonusSeedName = "PlantGCattailSeed",
				},
				{
					GameStateRequirements =
					{
						{
							Path = { "GameState", "LifetimeResourcesGained", "PlantHWheatSeed" },
							Comparison = ">=",
							Value = 1,
						},
					},
					Weight = 2,
					AddResources =
					{
						PlantHWheat = 1,
					},
					SproutedAnimation = "PlantHWheatSprouted",
					ReadyToHarvestAnimation = "PlantHWheatReadyToHarvest",
					BonusSeedName = "PlantHWheatSeed",
				},
				{
					GameStateRequirements =
					{
						{
							Path = { "GameState", "LifetimeResourcesGained", "PlantIPoppySeed" },
							Comparison = ">=",
							Value = 1,
						},
					},
					Weight = 1,
					AddResources =
					{
						PlantIPoppy = 1,
					},
					SproutedAnimation = "PlantIPoppySprouted",
					ReadyToHarvestAnimation = "PlantIPoppyReadyToHarvest",
					BonusSeedName = "PlantIPoppySeed",
				},
				{
					GameStateRequirements =
					{
						{
							Path = { "GameState", "LifetimeResourcesGained", "PlantNGarlicSeed" },
							Comparison = ">=",
							Value = 1,
						},
					},
					Weight = 4,
					AddResources =
					{
						PlantNGarlic = 1,
					},
					SproutedAnimation = "PlantNGarlicSprouted",
					ReadyToHarvestAnimation = "PlantNGarlicReadyToHarvest",
					BonusSeedName = "PlantNGarlicSeed",
				},
				{
					GameStateRequirements =
					{
						{
							Path = { "GameState", "LifetimeResourcesGained", "PlantOMandrakeSeed" },
							Comparison = ">=",
							Value = 1,
						},
					},
					Weight = 3,
					AddResources =
					{
						PlantOMandrake = 1,
					},
					SproutedAnimation = "PlantOMandrakeSprouted",
					ReadyToHarvestAnimation = "PlantOMandrakeReadyToHarvest",
					BonusSeedName = "PlantOMandrakeSeed",
				},
				{
					GameStateRequirements =
					{
						{
							Path = { "GameState", "LifetimeResourcesGained", "PlantPOliveSeed" },
							Comparison = ">=",
							Value = 1,
						},
					},
					Weight = 2,
					AddResources =
					{
						PlantPOlive = 1,
					},
					SproutedAnimation = "PlantPOliveSprouted",
					ReadyToHarvestAnimation = "PlantPOliveReadyToHarvest",
					BonusSeedName = "PlantPOliveSeed",
				},
				{
					GameStateRequirements =
					{
						{
							Path = { "GameState", "LifetimeResourcesGained", "PlantQSnakereedSeed" },
							Comparison = ">=",
							Value = 1,
						},
					},
					Weight = 1,
					AddResources =
					{
						PlantQSnakereed = 1,
					},
					SproutedAnimation = "PlantQSnakereedSprouted",
					ReadyToHarvestAnimation = "PlantQSnakereedReadyToHarvest",
					BonusSeedName = "PlantQSnakereedSeed",
				},
			}
		},

		PlantFNightshadeSeed =
		{
			GrowTimeMin = @garden_grow_scale|5@,
			GrowTimeMax = @garden_grow_scale|5@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantFNightshade = 1,
					},
					SproutedAnimation = "PlantFNightshadeSprouted",
					ReadyToHarvestAnimation = "PlantFNightshadeReadyToHarvest",
				},
			},
		},

		PlantGCattailSeed =
		{
			GrowTimeMin = @garden_grow_scale|9@,
			GrowTimeMax = @garden_grow_scale|9@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantGCattail = 1,
					},
					SproutedAnimation = "PlantGCattailSprouted",
					ReadyToHarvestAnimation = "PlantGCattailReadyToHarvest",
				},
			},
		},
		
		PlantHWheatSeed =
		{
			GrowTimeMin = @garden_grow_scale|13@,
			GrowTimeMax = @garden_grow_scale|13@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantHWheat = 1,
					},
					SproutedAnimation = "PlantHWheatSprouted",
					ReadyToHarvestAnimation = "PlantHWheatReadyToHarvest",
				},
			},
		},

		PlantIPoppySeed =
		{
			GrowTimeMin = @garden_grow_scale|41@,
			GrowTimeMax = @garden_grow_scale|41@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantIPoppy = 1,
					},
					SproutedAnimation = "PlantIPoppySprouted",
					ReadyToHarvestAnimation = "PlantIPoppyReadyToHarvest",
				},
			},
		},
		PlantNGarlicSeed =
		{
			GrowTimeMin = @garden_grow_scale|5@,
			GrowTimeMax = @garden_grow_scale|5@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantNGarlic = 1,
					},
					SproutedAnimation = "PlantNGarlicSprouted",
					ReadyToHarvestAnimation = "PlantNGarlicReadyToHarvest",
				},
			},
		},

		PlantOMandrakeSeed =
		{
			GrowTimeMin = @garden_grow_scale|19@,
			GrowTimeMax = @garden_grow_scale|19@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantOMandrake = 1,
					},
					SproutedAnimation = "PlantOMandrakeSprouted",
					ReadyToHarvestAnimation = "PlantOMandrakeReadyToHarvest",
				},
			},
		},

		PlantPOliveSeed =
		{
			GrowTimeMin = @garden_grow_scale|53@,
			GrowTimeMax = @garden_grow_scale|53@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantPOlive = 1,
					},
					SproutedAnimation = "PlantPOliveSprouted",
					ReadyToHarvestAnimation = "PlantPOliveReadyToHarvest",
				},
			},
		},

		PlantQSnakereedSeed =
		{
			GrowTimeMin = @garden_grow_scale|77@,
			GrowTimeMax = @garden_grow_scale|77@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantQSnakereed = 1,
					},
					SproutedAnimation = "PlantQSnakereedSprouted",
					ReadyToHarvestAnimation = "PlantQSnakereedReadyToHarvest",
				},
			},
		},
		
		PlantChaosThalamusSeed =
		{
			GrowTimeMin = @garden_grow_scale|7@,
			GrowTimeMax = @garden_grow_scale|7@,
			RandomOutcomes =
			{
				{
					Weight = 1,
					AddResources =
					{
						PlantChaosThalamus = 2,
					},
					SproutedAnimation = "PlantChaosThalamusSprouted",
					ReadyToHarvestAnimation = "PlantChaosThalamusReadyToHarvest",
				},
			},
		},
	},
}
