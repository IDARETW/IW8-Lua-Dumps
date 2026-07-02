RECORDS = RECORDS or {}
RECORDS.Types = {
	LETHAL = 1,
	TACTICAL = 2,
	MODE = 4,
	WEAPON = 0,
	STREAK = 3,
	COUNT = 6,
	SUPER = 5
}
RECORDS.MAX_GAME_MODES = 32

local function var_0_0(arg_1_0)
	return StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, arg_1_0, CSV.gameStats.cols.name)
end

local function var_0_1(arg_2_0)
	return StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, arg_2_0, CSV.gameStats.cols.icon)
end

function RECORDS.GetTopData(arg_3_0, arg_3_1)
	assert(arg_3_1 ~= nil, "RECORDS.GetTopData requires parameter 'type', but none was supplied")
	assert(arg_3_1 >= 0 and arg_3_1 < RECORDS.Types.COUNT, "Attempt to retrieve data for unknown type: " .. arg_3_1)

	if arg_3_1 == RECORDS.Types.WEAPON then
		local var_3_0 = WEAPON.GetStatsTable(arg_3_0)

		table.sort(var_3_0, function(arg_4_0, arg_4_1)
			return arg_4_0.kills > arg_4_1.kills
		end)

		return RECORDS.FormatWeaponData(var_3_0[1])
	elseif arg_3_1 == RECORDS.Types.LETHAL then
		local var_3_1 = EQUIPMENT.GetLethalStats(arg_3_0)

		table.sort(var_3_1, function(arg_5_0, arg_5_1)
			return arg_5_0.kills > arg_5_1.kills
		end)

		return RECORDS.FormatLethalData(var_3_1[1])
	elseif arg_3_1 == RECORDS.Types.TACTICAL then
		local var_3_2 = EQUIPMENT.GetTacticalStats(arg_3_0)

		table.sort(var_3_2, function(arg_6_0, arg_6_1)
			return arg_6_0.uses > arg_6_1.uses
		end)

		return RECORDS.FormatTacticalData(var_3_2[1])
	elseif arg_3_1 == RECORDS.Types.STREAK then
		local var_3_3 = STREAK.GetStatsTable(arg_3_0)

		table.sort(var_3_3, function(arg_7_0, arg_7_1)
			return arg_7_0.uses > arg_7_1.uses
		end)

		return RECORDS.FormatStreakData(var_3_3[1])
	elseif arg_3_1 == RECORDS.Types.MODE then
		local var_3_4 = MP.GetGameModeStats(arg_3_0, false)
		local var_3_5 = table.getn(var_3_4)
		local var_3_6 = MP.GetGameModeStats(arg_3_0, true)

		for iter_3_0, iter_3_1 in pairs(var_3_6) do
			var_3_4[iter_3_0 + var_3_5] = iter_3_1
		end

		table.sort(var_3_4, function(arg_8_0, arg_8_1)
			return arg_8_0.spm > arg_8_1.spm
		end)

		return RECORDS.FormatGameModeData(var_3_4[1])
	elseif arg_3_1 == RECORDS.Types.SUPER then
		local var_3_7 = SUPER.GetStatsTable(arg_3_0)

		table.sort(var_3_7, function(arg_9_0, arg_9_1)
			return arg_9_0.uses > arg_9_1.uses
		end)

		return RECORDS.FormatSuperData(var_3_7[1])
	end
end

function RECORDS.FormatWeaponData(arg_10_0)
	local var_10_0 = {
		item = arg_10_0.name,
		image = arg_10_0.image
	}

	var_10_0.category = "LUA_MENU_MP/MOST_KILLS"

	local var_10_1 = {
		name = var_0_0("kills"),
		icon = var_0_1("kills"),
		value = arg_10_0.kills
	}
	local var_10_2 = {
		name = var_0_0("deaths"),
		icon = var_0_1("deaths"),
		value = arg_10_0.deaths
	}
	local var_10_3 = {
		name = var_0_0("kdRatio"),
		icon = var_0_1("kdRatio"),
		value = string.format("%.2f", arg_10_0.kdr)
	}
	local var_10_4 = {
		name = var_0_0("headShots"),
		icon = var_0_1("headShots"),
		value = arg_10_0.headShots
	}
	local var_10_5 = {
		name = var_0_0("accuracy"),
		icon = var_0_1("accuracy"),
		value = string.format("%.2f", arg_10_0.accuracy)
	}

	var_10_0.stats = {
		var_10_1,
		var_10_3,
		var_10_5,
		var_10_2,
		var_10_4
	}

	return var_10_0
end

function RECORDS.FormatLethalData(arg_11_0)
	local var_11_0 = {
		item = arg_11_0.nameRef,
		image = arg_11_0.progressionImage
	}

	var_11_0.category = "LUA_MENU_MP/MOST_KILLS"

	local var_11_1 = {
		name = var_0_0("kills"),
		icon = var_0_1("kills"),
		value = arg_11_0.kills
	}
	local var_11_2 = {
		name = var_0_0("uses"),
		icon = var_0_1("uses"),
		value = arg_11_0.uses
	}

	var_11_0.stats = {
		var_11_1,
		var_11_2
	}

	return var_11_0
end

function RECORDS.FormatTacticalData(arg_12_0)
	local var_12_0 = {
		item = arg_12_0.nameRef,
		image = arg_12_0.progressionImage
	}

	var_12_0.category = "LUA_MENU_MP/MOST_USED"

	local var_12_1 = {
		name = var_0_0("uses"),
		icon = var_0_1("uses"),
		value = arg_12_0.uses
	}

	var_12_0.stats = {}

	table.insert(var_12_0.stats, var_12_1)

	if arg_12_0.extraRecordType ~= nil and arg_12_0.extraRecordType ~= "" then
		local var_12_2 = {
			name = var_0_0(arg_12_0.extraRecordType),
			icon = var_0_1(arg_12_0.extraRecordType),
			value = arg_12_0.extraStat1
		}

		table.insert(var_12_0.stats, var_12_2)
	end

	return var_12_0
end

function RECORDS.FormatStreakData(arg_13_0)
	local var_13_0 = {
		item = arg_13_0.name,
		image = arg_13_0.image
	}

	var_13_0.category = "LUA_MENU_MP/MOST_USED"

	local var_13_1 = {
		name = var_0_0("uses"),
		icon = var_0_1("uses"),
		value = arg_13_0.uses
	}

	var_13_0.stats = {}

	table.insert(var_13_0.stats, var_13_1)

	if arg_13_0.extraRecordType ~= nil and arg_13_0.extraRecordType ~= "" then
		local var_13_2 = {
			name = var_0_0(arg_13_0.extraRecordType),
			icon = var_0_1(arg_13_0.extraRecordType),
			value = arg_13_0.extraStat1
		}

		table.insert(var_13_0.stats, var_13_2)
	elseif arg_13_0.streakType == STREAK.Types.LETHAL then
		local var_13_3 = {
			name = var_0_0("kills"),
			icon = var_0_1("kills"),
			value = arg_13_0.extraStat1
		}

		table.insert(var_13_0.stats, var_13_3)
	end

	return var_13_0
end

function RECORDS.FormatGameModeData(arg_14_0)
	local var_14_0 = {
		image = arg_14_0.image
	}

	var_14_0.category = "LUA_MENU_MP/MOST_SUCCESSFUL"
	var_14_0.isHardcore = arg_14_0.isHardcore

	if var_14_0.isHardcore then
		var_14_0.item = Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", arg_14_0.name)
	else
		var_14_0.item = arg_14_0.name
	end

	local var_14_1 = {
		name = var_0_0("kills"),
		icon = var_0_1("kills"),
		value = arg_14_0.kills
	}
	local var_14_2 = {
		name = var_0_0("deaths"),
		icon = var_0_1("deaths"),
		value = arg_14_0.deaths
	}
	local var_14_3 = {
		name = var_0_0("scorePerMinute"),
		icon = var_0_1("scorePerMinute"),
		value = string.format("%.2f", arg_14_0.spm)
	}
	local var_14_4 = {
		name = var_0_0("kdRatio"),
		icon = var_0_1("kdRatio"),
		value = string.format("%.2f", arg_14_0.kdr)
	}

	var_14_0.stats = {
		var_14_3,
		var_14_1,
		var_14_4,
		var_14_2
	}

	if arg_14_0.extraStat1 then
		local var_14_5 = {
			name = var_0_0(arg_14_0.extraStat1Name),
			icon = var_0_1(arg_14_0.extraStat1Name),
			value = arg_14_0.extraStat1
		}

		table.insert(var_14_0.stats, 3, var_14_5)
	end

	if arg_14_0.extraStat2 then
		local var_14_6 = {
			name = var_0_0(arg_14_0.extraStat2Name),
			icon = var_0_1(arg_14_0.extraStat2Name),
			value = arg_14_0.extraStat2
		}

		if #var_14_0.stats > 4 then
			table.insert(var_14_0.stats, var_14_6)
		else
			table.insert(var_14_0.stats, 3, var_14_6)
		end
	end

	return var_14_0
end

function RECORDS.FormatSuperData(arg_15_0)
	local var_15_0 = {
		item = arg_15_0.name,
		image = arg_15_0.image
	}

	var_15_0.category = "LUA_MENU_MP/MOST_USED"

	local var_15_1 = {
		name = var_0_0("uses"),
		icon = var_0_1("uses"),
		value = arg_15_0.uses
	}

	var_15_0.stats = {}

	table.insert(var_15_0.stats, var_15_1)

	if arg_15_0.tracksKills then
		local var_15_2 = {
			name = var_0_0("kills"),
			icon = var_0_1("kills"),
			value = arg_15_0.kills
		}

		table.insert(var_15_0.stats, var_15_2)
	end

	if arg_15_0.misc1name ~= nil and arg_15_0.misc1name ~= "" then
		local var_15_3 = {
			name = arg_15_0.misc1name,
			value = arg_15_0.misc1data
		}

		table.insert(var_15_0.stats, var_15_3)
	end

	return var_15_0
end

function RECORDS.GetMatchData(arg_16_0, arg_16_1)
	local var_16_0 = {}
	local var_16_1 = RECORDS.GetStatsTable(arg_16_0)[arg_16_1]

	if var_16_1 then
		var_16_0.image = MP.GetMapImage(var_16_1.mapName)
		var_16_0.mapName = var_16_1.mapName
		var_16_0.mode = var_16_1.modeName
		var_16_0.kills = var_16_1.kills
		var_16_0.deaths = var_16_1.deaths
		var_16_0.kdr = var_16_1.kd
		var_16_0.headShots = var_16_1.headShots
		var_16_0.accuracy = var_16_1.accuracy
		var_16_0.damage = var_16_1.damage

		return RECORDS.FormatMatchData(var_16_0)
	end
end

function RECORDS.GetAggregateData(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = RECORDS.GetStatsTable(arg_17_0)
	local var_17_2 = {
		title = "LUA_MENU/SCORE_FIVE_GAMES",
		score = var_17_1.totalScore
	}

	table.insert(var_17_0, var_17_2)

	local var_17_3 = {
		title = "LUA_MENU/DAMAGE_FIVE_GAMES",
		score = var_17_1.totalDamage
	}

	table.insert(var_17_0, var_17_3)

	local var_17_4 = {
		title = "LUA_MENU/KILLS_CAPS",
		score = var_17_1.totalEnemiesKilled
	}

	table.insert(var_17_0, var_17_4)

	local var_17_5 = {
		title = "LUA_MENU/DEATHS_CAPS",
		score = var_17_1.totalDeaths
	}

	table.insert(var_17_0, var_17_5)

	local var_17_6 = {
		title = "LUA_MENU/RATIO_CAPS",
		score = string.format("%.2f", var_17_1.totalkd)
	}

	table.insert(var_17_0, var_17_6)

	return var_17_0
end

function RECORDS.GetStatsTable(arg_18_0)
	local var_18_0 = {}
	local var_18_1 = 0
	local var_18_2 = 0
	local var_18_3 = 0
	local var_18_4 = 0
	local var_18_5
	local var_18_6 = 0

	for iter_18_0 = 4, 0, -1 do
		local var_18_7 = {
			kills = PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).kdHistoryK[iter_18_0]:get()
		}

		var_18_2 = var_18_2 + var_18_7.kills
		var_18_7.deaths = PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).kdHistoryD[iter_18_0]:get()
		var_18_4 = var_18_4 + var_18_7.deaths
		var_18_7.damage = PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).damageHistory[iter_18_0]:get()
		var_18_3 = var_18_3 + var_18_7.damage
		var_18_7.headShots = PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).headshotHistory[iter_18_0]:get()
		var_18_7.accuracy = PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).accuracyHistory[iter_18_0]:get() / 100
		var_18_7.mapName = PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).mapsPlayed[4 - iter_18_0]:get()
		var_18_7.modeName = PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).gameModeHistory[iter_18_0]:get()

		for iter_18_1 = 0, RECORDS.MAX_GAME_MODES - 1 do
			if PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).gameModeScoreHistory[iter_18_1].gameMode:get() == var_18_7.modeName then
				if var_18_5 ~= nil and var_18_5 == var_18_7.modeName then
					var_18_6 = var_18_6 + 1
				else
					var_18_6 = 0
				end

				var_18_7.score = PlayerData.BFFBGAJGD(arg_18_0, CoD.StatsGroup.Ranked).gameModeScoreHistory[iter_18_1].actualScores[var_18_6]:get()
				var_18_1 = var_18_1 + var_18_7.score

				if var_18_5 == nil or var_18_5 ~= var_18_7.modeName then
					var_18_5 = var_18_7.modeName
				end

				break
			end
		end

		if var_18_7.deaths <= 0 then
			var_18_7.kd = var_18_7.kills
		else
			var_18_7.kd = var_18_7.kills / var_18_7.deaths
		end

		table.insert(var_18_0, var_18_7)
	end

	var_18_0.totalScore = var_18_1
	var_18_0.totalEnemiesKilled = var_18_2
	var_18_0.totalDeaths = var_18_4
	var_18_0.totalkd = var_18_2 / (var_18_4 > 0 and var_18_4 or 1)
	var_18_0.totalDamage = var_18_3

	return var_18_0
end

function RECORDS.GetPreviousMatchesKD(arg_19_0)
	local var_19_0 = {}
	local var_19_1 = RECORDS.GetStatsTable(arg_19_0)

	for iter_19_0 = 1, 5 do
		table.insert(var_19_0, var_19_1[iter_19_0].kd)
	end

	return var_19_0
end

function RECORDS.GetNumberOfPlayerMatches(arg_20_0)
	return (PlayerData.BFFBGAJGD(arg_20_0, CoD.StatsGroup.Ranked).playerStats.matchStats.gamesPlayed:get())
end

function RECORDS.FormatMatchData(arg_21_0)
	local var_21_0 = {
		mapImage = arg_21_0.image,
		mapName = arg_21_0.mapName,
		mode = arg_21_0.mode
	}
	local var_21_1 = {
		name = var_0_0("kills"),
		icon = var_0_1("kills"),
		value = arg_21_0.kills
	}
	local var_21_2 = {
		name = var_0_0("deaths"),
		icon = var_0_1("deaths"),
		value = arg_21_0.deaths
	}
	local var_21_3 = {
		name = var_0_0("kdRatio"),
		icon = var_0_1("kdRatio"),
		value = string.format("%.2f", arg_21_0.kdr)
	}
	local var_21_4 = {
		name = var_0_0("headShots"),
		icon = var_0_1("headShots"),
		value = arg_21_0.headShots
	}
	local var_21_5 = {
		name = var_0_0("accuracy"),
		icon = var_0_1("accuracy"),
		value = string.format("%.2f", arg_21_0.accuracy)
	}
	local var_21_6 = {
		name = var_0_0("damage"),
		icon = var_0_1("damage"),
		value = arg_21_0.damage
	}

	var_21_0.stats = {
		var_21_1,
		var_21_2,
		var_21_3,
		var_21_5,
		var_21_4,
		var_21_6
	}

	return var_21_0
end
