Leaderboards.FilterCategory = {
	Platform = 2,
	Player = 1,
	Playlist = 3
}
Leaderboards.Filters = {
	None = {
		Value = 0,
		Title = "LUA_MENU/LB_FILTER_GROUP_ALL"
	},
	Friends = {
		Value = 1,
		Title = "LUA_MENU/LB_FILTER_GROUP_FRIENDS"
	}
}
Leaderboards.PlatformFilters = {
	None = {
		Value = 0,
		Title = "LUA_MENU/LB_FILTER_GROUP_ACTIVISION"
	},
	PS = {
		Value = 1,
		Title = "PLATFORM/PS4",
		IsLocalClientPlatform = function(arg_1_0)
			return arg_1_0 == ClientPlatform.PS4
		end
	},
	XBOX = {
		Value = 2,
		Title = "PLATFORM/XBOX",
		IsLocalClientPlatform = function(arg_2_0)
			return arg_2_0 == ClientPlatform.XBOX_ONE
		end
	},
	PC = {
		Value = 3,
		Title = "PLATFORM/PC",
		IsLocalClientPlatform = function(arg_3_0)
			return arg_3_0 == ClientPlatform.BNET or arg_3_0 == ClientPlatform.STEAM
		end
	}
}
Leaderboards.FilterCategoryData = {
	[Leaderboards.FilterCategory.Player] = {
		ddlName = "playerFilter",
		values = Leaderboards.Filters
	},
	[Leaderboards.FilterCategory.Platform] = {
		ddlName = "platformFilter",
		values = Leaderboards.PlatformFilters
	}
}
Leaderboards.PlaylistFilters = {
	Hardcore = {
		Value = 1,
		Title = "PLAYLIST/HARDCORE_NAME"
	},
	Standard = {
		Value = 0,
		Title = "PLAYLIST/STANDARD_NAME"
	}
}
Leaderboards.BoardReferences = {
	MP = {
		"TeamDeathmatch",
		"FreeForAll",
		"Domination",
		"CyberAttack",
		"SearchAndDestroy",
		"CaptureTheFlag",
		"KillConfirmed",
		"Gunfight",
		"Headquarters",
		"Hardpoint",
		"GroundWar"
	},
	CP = {
		SurvivalSolo = {
			"SurvivalPicadillySolo",
			"SurvivalAniyahSolo",
			"SurvivalRaidSolo",
			"SurvivalPetrogradSolo",
			"SurvivalCavePmSolo",
			"SurvivalSpeedSolo",
			"SurvivalBigStoreSolo",
			"SurvivalBacklotSolo",
			"SurvivalCrashSolo",
			"SurvivalVillage2Solo"
		},
		SurvivalDuos = {
			"SurvivalPicadillyTwoPlayers",
			"SurvivalAniyahTwoPlayers",
			"SurvivalRaidTwoPlayers",
			"SurvivalPetrogradTwoPlayers",
			"SurvivalCavePmTwoPlayers",
			"SurvivalSpeedTwoPlayers",
			"SurvivalBigStoreTwoPlayers",
			"SurvivalBacklotTwoPlayers",
			"SurvivalCrashTwoPlayers",
			"SurvivalVillage2TwoPlayers"
		},
		SurvivalTrios = {
			"SurvivalPicadillyThreePlayers",
			"SurvivalAniyahThreePlayers",
			"SurvivalRaidThreePlayers",
			"SurvivalPetrogradThreePlayers",
			"SurvivalCavePmThreePlayers",
			"SurvivalSpeedThreePlayers",
			"SurvivalBigStoreThreePlayers",
			"SurvivalBacklotThreePlayers",
			"SurvivalCrashThreePlayers",
			"SurvivalVillage2ThreePlayers"
		},
		SurvivalQuads = {
			"SurvivalPicadillyFourPlayers",
			"SurvivalAniyahFourPlayers",
			"SurvivalRaidFourPlayers",
			"SurvivalPetrogradFourPlayers",
			"SurvivalCavePmFourPlayers",
			"SurvivalSpeedFourPlayers",
			"SurvivalBigStoreFourPlayers",
			"SurvivalBacklotFourPlayers",
			"SurvivalCrashFourPlayers",
			"SurvivalVillage2FourPlayers"
		}
	},
	MAGMA = {
		Placement = {
			"MagmaPlacementTrios",
			"MagmaPlacementDuos",
			"MagmaPlacementSolo"
		},
		Playlist = {
			"MagmaPlaylistTrios",
			"MagmaPlaylistDuos",
			"MagmaPlaylistSolo"
		}
	}
}
Leaderboards.HeaderNames = {
	Deaths = "LUA_MENU/DEATHS",
	Misses = "MENU/MISSES",
	Combo = "LUA_MENU_MP/COMBO_CAPS",
	Accuracy = "MENU/ACCURACY",
	Wave = "LUA_MENU/WAVE_CAPS",
	AvgScore = "MENU/SCORE_PER_GAME",
	Kills = "LUA_MENU/LEADERBOARD_KILLS",
	Crates = "LUA_MENU/CRATES",
	DoorsOpened = "LUA_MENU_ZM/DOORS_OPENED",
	InfectedKills = "LUA_MENU/INFECTED_KILLS_CAPS",
	Ratio = "MENU/RATIO",
	Returns = "MENU/RETURNS",
	TopTen = "LUA_MENU/TOP_TEN",
	Setbacks = "LUA_MENU_MP/SETBACKS",
	TopFive = "LUA_MENU/TOP_FIVE",
	SurvivorKills = "LUA_MENU/SURVIVOR_KILLS_CAPS",
	Time = "LUA_MENU/TIME",
	Captures = "LUA_MENU/CAPTURES",
	Damage = "LUA_MENU_MP/DAMAGE",
	Streak = "MENU/STREAK",
	AvgChains = "LUA_MENU/AVG_CHAINS_CAPS",
	Defends = "MENU/DEFENDS",
	AvgCaptures = "LUA_MENU/AVG_CAPTURES_CAPS",
	Rounds = "LUA_MENU_ZM/ROUNDS",
	Waves = "MENU/WAVES",
	Wins = "LUA_MENU/WINS",
	SPM = "LUA_MENU_MP/SPM",
	Score = "LUA_MENU/SCORE",
	TopTwentyFive = "LUA_MENU/TOP_TWENTY_FIVE",
	TotalPlunder = "LUA_MENU/TOTAL_PLUNDER",
	Revives = "LUA_MENU/REVIVES",
	Points = "LUA_MENU_MP/POINTS_CAPS",
	Stabs = "LUA_MENU_MP/STABS_CAPS",
	ShotsFired = "LUA_EOG_CP/EOG_TRACK_TOTAL_SHOTS",
	Downs = "LUA_MENU_CP/DOWNS",
	Infected = "LUA_MENU/INFECTED_SCOREBOARD",
	Headshots = "LUA_MENU/WEAPPERF_HEADSHOTS",
	ExplosiveKills = "LUA_MENU_ZM/EXPLOSIVE_KILLS",
	Confirms = "LUA_MENU/CONFIRMS",
	Losses = "MENU/LOSSES",
	Downed = "LUA_MENU/DOWNED_CAPS",
	PerGame = "LUA_MENU/PER_GAME_CAPS",
	PerksUsed = "LUA_MENU_ZM/PERKS_USED",
	Banks = "LUA_MENU_MP/BANKS_CAPS",
	Rescues = "LUA_MENU/RESCUES",
	Melees = "LUA_MENU_MP/MELEES",
	AvgKills = "MENU/KILLS_PER_GAME",
	MaxWeaponLevel = "LUA_MENU/MAX_WEAPON_LEVEL_CAPS",
	ShotsOnTarget = "LUA_EOG_CP/EOG_TRACK_SHOTS_HIT",
	Defuses = "MENU/DEFUSES",
	Carries = "LUA_MENU_MP/CARRIES",
	TimePlayed = "LUA_MENU/TIME_PLAYED",
	Games = "MENU/GAMES_PLAYED",
	Denies = "LUA_MENU/DENIES",
	Plants = "MENU/PLANTS",
	KillChains = "LUA_MENU/KILL_CHAINS_CAPS",
	MaxWave = "LUA_MENU/MAX_WAVE_CAPS",
	Hits = "MENU/HITS",
	Assists = "LUA_MENU/ASSISTS"
}
Leaderboards.Boards = {
	Score = {
		Title = "LUA_MENU/SCORE",
		isVirtual = true,
		Ref = "Score",
		file = "LB_VR_TOTALXP",
		Desc = "LUA_MENU/CHECK_HOW_YOUR_SCORE",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.Score
			},
			{
				key = "Time Played",
				title = Leaderboards.HeaderNames.TimePlayed
			},
			{
				key = "Games Played",
				title = Leaderboards.HeaderNames.Games
			},
			{
				key = "Avg Score",
				title = Leaderboards.HeaderNames.AvgScore
			}
		}
	},
	Wins = {
		Title = "LUA_MENU/WINS",
		isVirtual = true,
		Ref = "Wins",
		file = "LB_VR_WINS",
		Desc = "LUA_MENU/DESC_LEADERBOARD_WINS",
		extraColumns = {
			{
				key = "Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Losses",
				title = Leaderboards.HeaderNames.Losses
			},
			{
				key = "Win/Loose Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Win Streak",
				title = Leaderboards.HeaderNames.Streak
			}
		}
	},
	Kills = {
		Title = "LUA_MENU/KILLS",
		isVirtual = true,
		Ref = "Kills",
		file = "LB_VR_KILLS",
		Desc = "LUA_MENU/DESC_LEADERBOARD_KILLS",
		extraColumns = {
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Kill Streak",
				title = Leaderboards.HeaderNames.Streak
			},
			{
				key = "Avg Kills",
				title = Leaderboards.HeaderNames.AvgKills
			}
		}
	},
	Accuracy = {
		Desc = "LUA_MENU/DESC_LEADERBOARD_ACCURACY",
		isVirtual = true,
		file = "LB_VR_ACCURACY",
		Title = "LUA_MENU/ACCURACY",
		extraColumns = {
			{
				key = "Accuracy",
				title = Leaderboards.HeaderNames.Accuracy
			},
			{
				key = "Hits",
				title = Leaderboards.HeaderNames.Hits
			},
			{
				key = "Misses",
				title = Leaderboards.HeaderNames.Misses
			}
		}
	},
	FreeForAll = {
		file = "LB_GM_DM",
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_DM",
		Title = "LUA_MENU_MP/DEATHMATCH",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Streak",
				title = Leaderboards.HeaderNames.Streak
			}
		}
	},
	TeamDeathmatch = {
		file = "LB_GM_WAR",
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_WAR",
		Ref = "TeamDeathmatch",
		hasHardcoreMode = true,
		Title = "LUA_MENU_MP/WAR",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Assists",
				title = Leaderboards.HeaderNames.Assists
			}
		}
	},
	CyberAttack = {
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_CYBER",
		file = "LB_GM_CYBER",
		hasHardcoreMode = true,
		Title = "LUA_MENU_MP/CYBER",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "Plants",
				title = Leaderboards.HeaderNames.Plants
			}
		}
	},
	Gunfight = {
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_ARENA",
		file = "LB_GM_ARENA",
		hasHardcoreMode = true,
		Title = "LUA_MENU_MP/ARENA",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Damage",
				title = Leaderboards.HeaderNames.Damage
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Assists",
				title = Leaderboards.HeaderNames.Assists
			}
		}
	},
	GunGame = {
		file = "LB_GM_GUN",
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_GUN",
		Title = "LUA_MENU_MP/GUN",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Melees",
				title = Leaderboards.HeaderNames.Melees
			},
			{
				key = "Setbacks",
				title = Leaderboards.HeaderNames.Setbacks
			}
		}
	},
	SearchAndDestroy = {
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_SD",
		file = "LB_GM_SD",
		hasHardcoreMode = true,
		Title = "LUA_MENU_MP/SD",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Plants",
				title = Leaderboards.HeaderNames.Plants
			},
			{
				key = "Defuses",
				title = Leaderboards.HeaderNames.Defuses
			}
		}
	},
	Demolition = {
		file = "LB_GM_DD",
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_DEMOLITION",
		Title = "LUA_MENU_MP/DEMOLITION",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Plants",
				title = Leaderboards.HeaderNames.Plants
			},
			{
				key = "Defuses",
				title = Leaderboards.HeaderNames.Defuses
			}
		}
	},
	Domination = {
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_DOM",
		file = "LB_GM_DOM",
		hasHardcoreMode = true,
		Title = "LUA_MENU_MP/DOMINATION",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Captures",
				title = Leaderboards.HeaderNames.Captures
			},
			{
				key = "Defends",
				title = Leaderboards.HeaderNames.Defends
			}
		}
	},
	GroundWar = {
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_ARMSRACE",
		file = "LB_GM_ARM",
		hasHardcoreMode = true,
		Title = "LUA_MENU_MP/ARMSRACE",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Captures",
				title = Leaderboards.HeaderNames.Captures
			},
			{
				key = "Defends",
				title = Leaderboards.HeaderNames.Defends
			}
		}
	},
	KillConfirmed = {
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_CONF",
		file = "LB_GM_CONF",
		hasHardcoreMode = true,
		Title = "LUA_MENU_MP/CONF",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Confirms",
				title = Leaderboards.HeaderNames.Confirms
			},
			{
				key = "Denies",
				title = Leaderboards.HeaderNames.Denies
			}
		}
	},
	Headquarters = {
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_HQ",
		file = "LB_GM_HQ",
		hasHardcoreMode = true,
		Title = "LUA_MENU_MP/HQ",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Captures",
				title = Leaderboards.HeaderNames.Captures
			},
			{
				key = "Defends",
				title = Leaderboards.HeaderNames.Defends
			}
		}
	},
	Hardpoint = {
		file = "LB_GM_KOTH",
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_HARDPOINT",
		Title = "LUA_MENU_MP/HARDPOINT",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Time",
				title = Leaderboards.HeaderNames.Time
			},
			{
				key = "Defends",
				title = Leaderboards.HeaderNames.Defends
			}
		}
	},
	CaptureTheFlag = {
		file = "LB_GM_CTF",
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_CTF",
		Title = "LUA_MENU_MP/CTF",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Captures",
				title = Leaderboards.HeaderNames.Captures
			},
			{
				key = "Returns",
				title = Leaderboards.HeaderNames.Returns
			}
		}
	},
	SurvivalPicadillySolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/PICCADILLY_SOLO_DESC",
		isVirtual = true,
		Ref = "SurvivalPicadillySolo",
		file = "LB_VR_ZM_M1_P1",
		Title = "LUA_MENU_MP/PICCADILLY_SOLO",
		extraColumns = {
			{
				key = "M1 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M1 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M1 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M1 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalPicadillyTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/PICCADILLY_TWO_PLAYERS_DESC",
		isVirtual = true,
		Ref = "SurvivalPicadillyTwoPlayers",
		file = "LB_VR_ZM_M1_P2",
		Title = "LUA_MENU_MP/PICCADILLY_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M1 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M1 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M1 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M1 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalPicadillyThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/PICCADILLY_THREE_PLAYERS_DESC",
		isVirtual = true,
		Ref = "SurvivalPicadillyThreePlayers",
		file = "LB_VR_ZM_M1_P3",
		Title = "LUA_MENU_MP/PICCADILLY_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M1 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M1 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M1 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M1 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalPicadillyFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/PICCADILLY_FOUR_PLAYERS_DESC",
		isVirtual = true,
		Ref = "SurvivalPicadillyFourPlayers",
		file = "LB_VR_ZM_M1_P4",
		Title = "LUA_MENU_MP/PICCADILLY_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M1 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M1 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M1 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M1 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalAniyahSolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/ANIYAH_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M2_P1",
		Title = "LUA_MENU_MP/ANIYAH_SOLO",
		extraColumns = {
			{
				key = "M2 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M2 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M2 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M2 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalAniyahTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/ANIYAH_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M2_P2",
		Title = "LUA_MENU_MP/ANIYAH_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M2 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M2 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M2 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M2 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalAniyahThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/ANIYAH_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M2_P3",
		Title = "LUA_MENU_MP/ANIYAH_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M2 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M2 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M2 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M2 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalAniyahFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/ANIYAH_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M2_P4",
		Title = "LUA_MENU_MP/ANIYAH_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M2 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M2 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M2 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M2 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalRaidSolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/RAID_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M3_P1",
		Title = "LUA_MENU_MP/RAID_SOLO",
		extraColumns = {
			{
				key = "M3 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M3 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M3 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M3 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalRaidTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/RAID_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M3_P2",
		Title = "LUA_MENU_MP/RAID_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M3 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M3 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M3 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M3 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalRaidThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/RAID_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M3_P3",
		Title = "LUA_MENU_MP/RAID_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M3 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M3 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M3 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M3 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalRaidFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/RAID_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M3_P4",
		Title = "LUA_MENU_MP/RAID_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M3 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M3 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M3 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M3 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalPetrogradSolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/PETROGRAD_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M4_P1",
		Title = "LUA_MENU_MP/PETROGRAD_SOLO",
		extraColumns = {
			{
				key = "M4 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M4 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M4 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M4 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalPetrogradTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/PETROGRAD_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M4_P2",
		Title = "LUA_MENU_MP/PETROGRAD_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M4 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M4 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M4 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M4 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalPetrogradThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/PETROGRAD_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M4_P3",
		Title = "LUA_MENU_MP/PETROGRAD_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M4 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M4 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M4 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M4 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalPetrogradFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/PETROGRAD_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M4_P4",
		Title = "LUA_MENU_MP/PETROGRAD_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M4 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M4 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M4 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M4 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalCavePmSolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/AZHIR_CAVE_NIGHT_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M5_P1",
		Title = "LUA_MENU_MP/AZHIR_CAVE_NIGHT_SOLO",
		extraColumns = {
			{
				key = "M5 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M5 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M5 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M5 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalCavePmTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/AZHIR_CAVE_NIGHT_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M5_P2",
		Title = "LUA_MENU_MP/AZHIR_CAVE_NIGHT_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M5 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M5 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M5 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M5 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalCavePmThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/AZHIR_CAVE_NIGHT_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M5_P3",
		Title = "LUA_MENU_MP/AZHIR_CAVE_NIGHT_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M5 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M5 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M5 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M5 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalCavePmFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/AZHIR_CAVE_NIGHT_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M5_P4",
		Title = "LUA_MENU_MP/AZHIR_CAVE_NIGHT_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M5 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M5 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M5 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M5 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalSpeedSolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/SHOOT_HOUSE_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M6_P1",
		Title = "LUA_MENU_MP/SHOOT_HOUSE_SOLO",
		extraColumns = {
			{
				key = "M6 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M6 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M6 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M6 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalSpeedTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/SHOOT_HOUSE_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M6_P2",
		Title = "LUA_MENU_MP/SHOOT_HOUSE_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M6 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M6 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M6 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M6 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalSpeedThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/SHOOT_HOUSE_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M6_P3",
		Title = "LUA_MENU_MP/SHOOT_HOUSE_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M6 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M6 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M6 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M6 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalSpeedFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/SHOOT_HOUSE_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M6_P4",
		Title = "LUA_MENU_MP/SHOOT_HOUSE_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M6 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M6 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M6 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M6 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalBigStoreSolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/BIG_STORE_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M7_P1",
		Title = "LUA_MENU_MP/BIG_STORE_SOLO",
		extraColumns = {
			{
				key = "M7 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M7 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M7 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M7 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalBigStoreTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/BIG_STORE_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M7_P2",
		Title = "LUA_MENU_MP/BIG_STORE_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M7 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M7 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M7 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M7 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalBigStoreThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/BIG_STORE_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M7_P3",
		Title = "LUA_MENU_MP/BIG_STORE_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M7 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M7 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M7 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M7 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalBigStoreFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/BIG_STORE_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M7_P4",
		Title = "LUA_MENU_MP/BIG_STORE_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M7 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M7 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M7 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M7 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalBacklotSolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/BACKLOT_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M8_P1",
		Title = "LUA_MENU_MP/BACKLOT_SOLO",
		extraColumns = {
			{
				key = "M8 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M8 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M8 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M8 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalBacklotTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/BACKLOT_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M8_P2",
		Title = "LUA_MENU_MP/BACKLOT_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M8 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M8 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M8 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M8 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalBacklotThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/BACKLOT_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M8_P3",
		Title = "LUA_MENU_MP/BACKLOT_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M8 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M8 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M8 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M8 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalBacklotFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/BACKLOT_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M8_P4",
		Title = "LUA_MENU_MP/BACKLOT_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M8 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M8 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M8 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M8 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalCrashSolo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/CRASH_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M9_P1",
		Title = "LUA_MENU_MP/CRASH_SOLO",
		extraColumns = {
			{
				key = "M9 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M9 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M9 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M9 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalCrashTwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/CRASH_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M9_P2",
		Title = "LUA_MENU_MP/CRASH_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M9 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M9 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M9 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M9 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalCrashThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/CRASH_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M9_P3",
		Title = "LUA_MENU_MP/CRASH_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M9 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M9 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M9 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M9 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalCrashFourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/CRASH_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M9_P4",
		Title = "LUA_MENU_MP/CRASH_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M9 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M9 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M9 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M9 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalVillage2Solo = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/HOVEC_SAWMILL_SOLO_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M10_P1",
		Title = "LUA_MENU_MP/HOVEC_SAWMILL_SOLO",
		extraColumns = {
			{
				key = "M10 P1 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M10 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M10 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M10 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalVillage2TwoPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/HOVEC_SAWMILL_TWO_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M10_P2",
		Title = "LUA_MENU_MP/HOVEC_SAWMILL_TWO_PLAYERS",
		extraColumns = {
			{
				key = "M10 P2 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M10 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M10 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M10 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalVillage2ThreePlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/HOVEC_SAWMILL_THREE_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M10_P3",
		Title = "LUA_MENU_MP/HOVEC_SAWMILL_THREE_PLAYERS",
		extraColumns = {
			{
				key = "M10 P3 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M10 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M10 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M10 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	SurvivalVillage2FourPlayers = {
		isAlienCoop = true,
		Desc = "LUA_MENU_MP/HOVEC_SAWMILL_FOUR_PLAYERS_DESC",
		isVirtual = true,
		file = "LB_VR_ZM_M10_P4",
		Title = "LUA_MENU_MP/HOVEC_SAWMILL_FOUR_PLAYERS",
		extraColumns = {
			{
				key = "M10 P4 Rounds",
				title = Leaderboards.HeaderNames.MaxWave
			},
			{
				key = "M10 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M10 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M10 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	MagmaScore = {
		Title = "LUA_MENU/SCORE",
		file = "LB_VR_MAGMA_TOTALXP",
		Ref = "MagmaScore",
		Desc = "LUA_MENU/CHECK_HOW_YOUR_SCORE",
		isVirtual = true,
		extraColumns = {
			{
				key = "Magma Score",
				title = Leaderboards.HeaderNames.Score
			},
			{
				key = "Magma Time Played",
				title = Leaderboards.HeaderNames.TimePlayed
			},
			{
				key = "Magma Games Played",
				title = Leaderboards.HeaderNames.Games
			},
			{
				key = "Magma Avg Score",
				title = Leaderboards.HeaderNames.AvgScore
			}
		}
	},
	MagmaKills = {
		Title = "LUA_MENU/KILLS",
		file = "LB_VR_MAGMA_KILLS",
		Ref = "MagmaKills",
		Desc = "LUA_MENU/DESC_LEADERBOARD_KILLS",
		isVirtual = true,
		extraColumns = {
			{
				key = "Magma Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Magma Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Magma Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Magma Avg Kills",
				title = Leaderboards.HeaderNames.AvgKills
			}
		}
	},
	MagmaWins = {
		Title = "LUA_MENU/WINS",
		file = "LB_VR_MAGMA_WINS",
		Ref = "MagmaWins",
		Desc = "LUA_MENU/DESC_LEADERBOARD_WINS",
		isVirtual = true,
		extraColumns = {
			{
				key = "Magma Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Magma TopTen",
				title = Leaderboards.HeaderNames.TopTen
			},
			{
				key = "Magma Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Magma Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	MagmaPlacementTrios = {
		Title = "LUA_MENU/TRIOS",
		file = "LB_GM_MAGMA_PCMT_TRIOS",
		Ref = "MagmaPlacementTrios",
		Desc = "LUA_MENU/DESC_LEADERBOARD_TRIOS_PLACEMENT",
		extraColumns = {
			{
				key = "Magma Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Magma Top Ten",
				title = Leaderboards.HeaderNames.TopTen
			},
			{
				key = "Magma Top TwentyFive",
				title = Leaderboards.HeaderNames.TopTwentyFive
			},
			{
				key = "Magma Games Played",
				title = Leaderboards.HeaderNames.Games
			}
		}
	},
	MagmaPlacementDuos = {
		Title = "LUA_MENU/DUOS_PLACEMENT",
		file = "LB_GM_MAGMA_PCMT_DUOS",
		Ref = "MagmaPlacementDuos",
		Desc = "LUA_MENU/DESC_LEADERBOARD_DUOS_PLACEMENT",
		extraColumns = {
			{
				key = "Magma Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Magma Top Ten",
				title = Leaderboards.HeaderNames.TopTen
			},
			{
				key = "Magma Top TwentyFive",
				title = Leaderboards.HeaderNames.TopTwentyFive
			},
			{
				key = "Magma Games Played",
				title = Leaderboards.HeaderNames.Games
			}
		}
	},
	MagmaPlacementSolo = {
		Title = "LUA_MENU/SOLO_PLACEMENT",
		file = "LB_GM_MAGMA_PCMT_SOLO",
		Ref = "MagmaPlacementSolo",
		Desc = "LUA_MENU/DESC_LEADERBOARD_SOLO_PLACEMENT",
		extraColumns = {
			{
				key = "Magma Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Magma Top Ten",
				title = Leaderboards.HeaderNames.TopTen
			},
			{
				key = "Magma Top TwentyFive",
				title = Leaderboards.HeaderNames.TopTwentyFive
			},
			{
				key = "Magma Games Played",
				title = Leaderboards.HeaderNames.Games
			}
		}
	},
	MagmaPlaylistTrios = {
		Title = "LUA_MENU/TRIOS",
		file = "LB_GM_MAGMA_TRIOS",
		Ref = "MagmaPlaylistTrios",
		Desc = "LUA_MENU/DESC_LEADERBOARD_TRIOS",
		extraColumns = {
			{
				key = "Magma Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Magma Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Magma Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Magma Downs",
				title = Leaderboards.HeaderNames.Downs
			},
			{
				key = "Magma Revives",
				title = Leaderboards.HeaderNames.Revives
			}
		}
	},
	MagmaPlaylistDuos = {
		Title = "LUA_MENU/DUOS",
		file = "LB_GM_MAGMA_DUOS",
		Ref = "MagmaPlaylistDuos",
		Desc = "LUA_MENU/DESC_LEADERBOARD_DUOS",
		extraColumns = {
			{
				key = "Magma Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Magma Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Magma Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Magma Downs",
				title = Leaderboards.HeaderNames.Downs
			},
			{
				key = "Magma Revives",
				title = Leaderboards.HeaderNames.Revives
			}
		}
	},
	MagmaPlaylistSolo = {
		Title = "LUA_MENU/SOLO",
		file = "LB_GM_MAGMA_SOLO",
		Ref = "MagmaPlaylistSolo",
		Desc = "LUA_MENU/DESC_LEADERBOARD_SOLO",
		extraColumns = {
			{
				key = "Magma Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Magma Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Magma Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Magma Downs",
				title = Leaderboards.HeaderNames.Downs
			},
			{
				key = "Magma Revives",
				title = Leaderboards.HeaderNames.Revives
			}
		}
	},
	MagmaBloodMoney = {
		Title = "LUA_MENU_MP/PAYBACK",
		file = "LB_VR_MAGMA_BLOOD_MONEY",
		Ref = "MagmaBloodMoney",
		Desc = "LUA_MENUMP/DESC_LEADERBOARD_PAYBACK",
		isVirtual = true,
		extraColumns = {
			{
				key = "BMoney Cash",
				title = Leaderboards.HeaderNames.TotalPlunder
			},
			{
				key = "BMoney Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "BMoney Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "BMoney Revives",
				title = Leaderboards.HeaderNames.Revives
			}
		}
	},
	MagmaMiniRoyale = {
		Title = "LUA_MENU_MP/BRMINI",
		file = "LB_VR_MAGMA_BRMINI",
		Ref = "MagmaMiniRoyale",
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_BRMINI",
		isVirtual = true,
		extraColumns = {
			{
				key = "BRMini Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "BRMini Score",
				title = Leaderboards.HeaderNames.Score
			},
			{
				key = "BRMini Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "BRMini Downs",
				title = Leaderboards.HeaderNames.Downs
			},
			{
				key = "BRMini Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "BRMini Games Played",
				title = Leaderboards.HeaderNames.Games
			}
		}
	},
	MagmaRebirth = {
		Title = "LUA_MENU_MP/REBIRTH_NAME",
		file = "LB_VR_MAGMA_BRREBIRTH",
		Ref = "MagmaRebirth",
		Desc = "LUA_MENU_MP/DESC_LEADERBOARD_BRREBIRTH",
		isVirtual = true,
		extraColumns = {
			{
				key = "BRRebirth Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "BRRebirth TopFive",
				title = Leaderboards.HeaderNames.TopFive
			},
			{
				key = "BRRebirth Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "BRRebirth Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			}
		}
	},
	MagmaPayload = {
		Title = "LUA_MENU_ACTOR/PAYLOAD",
		file = "LB_VR_MAGMA_BRPAYLOAD",
		Ref = "MagmaPayload",
		Desc = "LUA_MENU_ACTOR/PAYLOAD_DESC",
		isVirtual = true,
		extraColumns = {
			{
				key = "BRPayload Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "BRPayload Time",
				title = Leaderboards.HeaderNames.Time
			},
			{
				key = "BRPayload Kills",
				title = Leaderboards.HeaderNames.Kills
			}
		}
	}
}

local function var_0_0(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {}
	local var_4_1 = {}
	local var_4_2 = 1
	local var_4_3 = 1

	for iter_4_0, iter_4_1 in pairs(Leaderboards.Filters) do
		table.insert(var_4_0, Engine.CBBHFCGDIC(iter_4_1.OptionText))
		table.insert(var_4_1, iter_4_1)

		if arg_4_2 == iter_4_1 then
			var_4_2 = var_4_3
			arg_4_0.filterType = iter_4_1
		end

		var_4_3 = var_4_3 + 1
	end

	return {
		wrapAround = true,
		labels = var_4_0,
		action = function(arg_5_0)
			arg_4_0.filterType = var_4_1[arg_5_0]
		end,
		defaultValue = var_4_2
	}
end

local function var_0_1(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {
		Engine.CBBHFCGDIC("MENU/LB_FILTER_HARDCORE_OFF"),
		Engine.CBBHFCGDIC("MENU/LB_FILTER_HARDCORE_ON")
	}

	arg_6_0.isHardcore = arg_6_2

	return {
		wrapAround = true,
		labels = var_6_0,
		action = function(arg_7_0)
			if arg_7_0 == 2 then
				arg_6_0.isHardcore = true
			else
				arg_6_0.isHardcore = false
			end
		end,
		defaultValue = arg_6_2 and 2 or 1
	}
end

Leaderboards.FilterButtonFeeders = {
	Group = {
		title = "LUA_MENU/GROUP_CAPS",
		feeder = var_0_0
	},
	Hardcore = {
		title = "LUA_MENU/HARDCORE_CAPS",
		feeder = var_0_1
	}
}

local function var_0_2(arg_8_0)
	if Dvar.IBEGCHEFE("LTSNLQNRKO") then
		local var_8_0 = PlayerData.BFFBGAJGD(arg_8_0, CoD.StatsGroup.Ranked)

		if var_8_0 then
			return var_8_0.leaderboardFilters
		end
	end
end

function Leaderboards.SetSelectedFilters(arg_9_0, arg_9_1)
	local var_9_0 = var_0_2(arg_9_0)

	if var_9_0 then
		for iter_9_0, iter_9_1 in pairs(Leaderboards.FilterCategory) do
			local var_9_1 = Leaderboards.FilterCategoryData[iter_9_1]

			if var_9_1 and arg_9_1[iter_9_1] then
				local var_9_2 = arg_9_1[iter_9_1].Value
				local var_9_3 = var_9_0[var_9_1.ddlName]

				if var_9_3 and var_9_2 then
					var_9_3:set(var_9_2)
				end
			end
		end

		ACTIONS.UploadStats(nil, arg_9_0)
	end
end

function Leaderboards.GetSelectedFilters(arg_10_0)
	local var_10_0 = var_0_2(arg_10_0)
	local var_10_1

	if var_10_0 then
		var_10_1 = {}

		for iter_10_0, iter_10_1 in pairs(Leaderboards.FilterCategory) do
			local var_10_2 = Leaderboards.FilterCategoryData[iter_10_1]

			if var_10_2 then
				local var_10_3 = var_10_0[var_10_2.ddlName]:get()

				for iter_10_2, iter_10_3 in pairs(var_10_2.values) do
					if iter_10_3.Value == var_10_3 then
						var_10_1[iter_10_1] = iter_10_3

						break
					end
				end
			end
		end
	end

	return var_10_1
end

function Leaderboards.OpenLeaderboard(arg_11_0, arg_11_1)
	local var_11_0 = Leaderboards.GetLeaderboardFile(arg_11_0, arg_11_1)
	local var_11_1 = Leaderboards.Boards[arg_11_0].isVirtual or false

	Leaderboards.ECGBDGBHBJ(var_11_0, "TRK_ALLTIME", var_11_1)
end

function Leaderboards.ConvertToClientPlatform(arg_12_0)
	if CONDITIONS.IsWeGame() then
		return ClientPlatform.WEGAME
	end

	if arg_12_0 == Leaderboards.PlatformFilters.PS.Value then
		return ClientPlatform.PS4
	elseif arg_12_0 == Leaderboards.PlatformFilters.XBOX.Value then
		return ClientPlatform.XBOX_ONE
	else
		return ClientPlatform.BNET
	end
end

function Leaderboards.GetLeaderboardDisabled(arg_13_0)
	return Leaderboards.Boards[arg_13_0].disabled
end

function Leaderboards.GetLeaderboardTitle(arg_14_0)
	return Leaderboards.Boards[arg_14_0].Title
end

function Leaderboards.GetLeaderboardNumColumns(arg_15_0)
	return Leaderboards.Boards[arg_15_0].NumColumns
end

function Leaderboards.GetLeaderboardHasHardcoreMode(arg_16_0)
	return Leaderboards.Boards[arg_16_0].hasHardcoreMode
end

function Leaderboards.GetLeaderboardColumnWidth(arg_17_0, arg_17_1)
	return Leaderboards.Boards[arg_17_0].ColumnWidths[arg_17_1]
end

function Leaderboards.GetLeaderboardFile(arg_18_0, arg_18_1)
	local var_18_0 = Leaderboards.Boards[arg_18_0].file

	if arg_18_1 then
		var_18_0 = var_18_0 .. "_HC"
	end

	return var_18_0
end

function Leaderboards.GetLeaderboardFilterOptionText(arg_19_0)
	return Leaderboards.Filters[arg_19_0].OptionText
end

function Leaderboards.GetLeaderboardFilterValue(arg_20_0)
	return Leaderboards.Filters[arg_20_0].Value
end
