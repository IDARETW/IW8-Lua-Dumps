Cac = Cac or {}
STREAK = STREAK or {}
Cac.FirstStreakIndex = 0
Cac.LastStreakIndex = 2
Cac.MaxStreaks = 3
Cac.MaxStreakScore = 1500
STREAK.none = "none"
STREAK.AC130_WEAPON_25MM_ID = 1
STREAK.AC130_WEAPON_40MM_ID = 2
STREAK.AC130_WEAPON_105MM_ID = 3
STREAK.AC130_WEAPON_25MM_AMMO_MAX = 30
STREAK.AC130_WEAPON_40MM_AMMO_MAX = 5
STREAK.AC130_WEAPON_105MM_AMMO_MAX = 1
STREAK.Types = {
	LETHAL = "LETHAL",
	SUPPORT = "SUPPORT"
}
STREAK.Juggernaut = {
	Executing = -1,
	Active = 1,
	Inactive = 0
}

function STREAK.GetImage(arg_1_0)
	local var_1_0 = StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_1_0, CSV.streaks.cols.icon)

	return var_1_0 == "" and "white" or var_1_0
end

function STREAK.GetProgressionImage(arg_2_0)
	local var_2_0 = StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_2_0, CSV.streaks.cols.progressionImage)

	return var_2_0 == "" and "white" or var_2_0
end

function STREAK.GetTutorialVideo(arg_3_0)
	return tostring(StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_3_0, CSV.streaks.cols.tutorialVideo))
end

function STREAK.AreAllSlotsFilled(arg_4_0)
	for iter_4_0, iter_4_1 in ddlpairs(arg_4_0) do
		if iter_4_1.killstreak:get() == STREAK.none then
			return false
		end
	end

	return true
end

function STREAK.GetUnlockTokens(arg_5_0)
	return PlayerData.BFFBGAJGD(arg_5_0, CoD.StatsGroup.Common).killstreakUnlockTokens:get()
end

function Cac.GetStreakFullImage(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_6_0, CSV.streaks.cols.fullImage)
end

function Cac.GetSmallImage(arg_7_0)
	return StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_7_0, CSV.streaks.cols.smallImage)
end

function STREAK.GetScore(arg_8_0)
	return StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_8_0, CSV.streaks.cols.score)
end

function STREAK.GetKills(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_9_0, CSV.streaks.cols.kills)
end

function STREAK.SortPlayerData(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in ddlpairs(arg_10_0) do
		local var_10_1 = iter_10_1.killstreak:get()

		table.insert(var_10_0, {
			ref = var_10_1,
			kills = tonumber(STREAK.GetKills(var_10_1)) or 0
		})
	end

	table.sort(var_10_0, function(arg_11_0, arg_11_1)
		if arg_11_0.ref == STREAK.none and arg_11_1.ref ~= STREAK.none then
			return false
		elseif arg_11_1.ref == STREAK.none and arg_11_0.ref ~= STREAK.none then
			return true
		end

		return arg_11_0.kills < arg_11_1.kills
	end)

	for iter_10_2, iter_10_3 in ddlpairs(arg_10_0) do
		local var_10_2 = var_10_0[iter_10_2 + 1].ref

		iter_10_3.killstreak:set(var_10_2)
	end
end

function STREAK.GetSupportCost(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_12_0, CSV.streaks.cols.supportCost)
end

function STREAK.GetKills(arg_13_0)
	return StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_13_0, CSV.streaks.cols.kills)
end

function STREAK.GetName(arg_14_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_14_0, CSV.streaks.cols.name))
end

function Cac.GetStreakDesc(arg_15_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.ref, arg_15_0, CSV.streaks.cols.desc))
end

function Cac.IsStreakInUse(arg_16_0)
	return arg_16_0 ~= "none" and arg_16_0 ~= ""
end

function Cac.GetEquippedStreakCount(arg_17_0, arg_17_1)
	local var_17_0 = 0

	for iter_17_0 = Cac.FirstStreakIndex, Cac.LastStreakIndex do
		if arg_17_0.killstreakSetups[iter_17_0].killstreak:GetValue(arg_17_1) ~= "none" then
			var_17_0 = var_17_0 + 1
		end
	end

	return var_17_0
end

function STREAK.IsUnlocked(arg_18_0, arg_18_1)
	local var_18_0 = false

	if Engine.BHICADFIHA() then
		var_18_0 = Dvar.IBEGCHEFE("OLKMKMTKRO") or Dvar.IBEGCHEFE("NQRLNKMTSL")
	end

	return var_18_0 or PlayerData.BFFBGAJGD(arg_18_1, CoD.StatsGroup.Common).killstreakUnlocked[arg_18_0]:get() == 1
end

function STREAK.Unlock(arg_19_0, arg_19_1)
	local var_19_0 = PlayerData.BFFBGAJGD(arg_19_0, CoD.StatsGroup.Common)
	local var_19_1 = var_19_0.killstreakUnlockTokens:get()

	assert(var_19_1 > 0)
	var_19_0.killstreakUnlockTokens:set(var_19_1 - 1)
	var_19_0.killstreakUnlocked[arg_19_1]:set(1)
end

function STREAK.GetUnlockText(arg_20_0, arg_20_1)
	return PROGRESSION.GetUnlockText(arg_20_0, CSV.streakUnlockTable, arg_20_1)
end

function STREAK.IsNukeStreak(arg_21_0)
	return StringTable.DIFCHIGDFB(CSV.streaks.file, CSV.streaks.cols.index, arg_21_0, CSV.streaks.cols.ref) == "nuke"
end

function Cac.GetStreakUnlockRank(arg_22_0)
	return StringTable.DIFCHIGDFB(CSV.streakUnlockTable.file, CSV.streakUnlockTable.cols.ref, arg_22_0, CSV.streakUnlockTable.cols.unlockRank)
end

function Cac.GetLethalStreakStats(arg_23_0)
	local var_23_0 = {}

	for iter_23_0 = 0, StringTable.BFHCAIIDA(CSV.streaks.file) do
		local var_23_1 = CSV.ReadRow(CSV.streaks, iter_23_0)

		if var_23_1 ~= nil and var_23_1.streakType == STREAK.Types.LETHAL then
			local var_23_2 = PlayerData.BFFBGAJGD(arg_23_0, CoD.StatsGroup.Ranked).lethalScorestreakStats[var_23_1.ref]
			local var_23_3 = {
				ref = var_23_1.ref,
				name = Engine.CBBHFCGDIC(var_23_1.name),
				desc = var_23_1.desc,
				image = var_23_1.smallImage,
				uses = var_23_2.uses:get(),
				extraStat1 = var_23_2.extraStat1:get()
			}

			var_23_3.killsPerUse = var_23_3.extraStat1 / (var_23_3.uses ~= 0 and var_23_3.uses or 1)

			table.insert(var_23_0, var_23_3)
		end
	end

	table.sort(var_23_0, function(arg_24_0, arg_24_1)
		return arg_24_0.extraStat1 > arg_24_1.extraStat1
	end)

	return var_23_0
end

function Cac.GetSupportStreakStats(arg_25_0)
	local var_25_0 = {}

	for iter_25_0 = 0, StringTable.BFHCAIIDA(CSV.streaks.file) do
		local var_25_1 = CSV.ReadRow(CSV.streaks, iter_25_0)

		if var_25_1 ~= nil and var_25_1.streakType == STREAK.Types.SUPPORT then
			local var_25_2 = var_25_1.extraRecordType
			local var_25_3 = PlayerData.BFFBGAJGD(arg_25_0, CoD.StatsGroup.Ranked).supportScorestreakStats[var_25_1.ref]
			local var_25_4 = {
				ref = var_25_1.ref,
				name = Engine.CBBHFCGDIC(var_25_1.name),
				desc = Engine.CBBHFCGDIC(var_25_1.desc),
				image = var_25_1.smallImage,
				extraRecordType = #var_25_2 > 0 and Engine.CBBHFCGDIC(var_25_2) or var_25_2,
				uses = var_25_3.uses:get(),
				extraStat1 = var_25_3.extraStat1:get()
			}

			table.insert(var_25_0, var_25_4)
		end
	end

	table.sort(var_25_0, function(arg_26_0, arg_26_1)
		return arg_26_0.uses > arg_26_1.uses
	end)

	return var_25_0
end

function STREAK.GetStatsTable(arg_27_0)
	local var_27_0 = {}

	for iter_27_0 = 0, StringTable.BFHCAIIDA(CSV.streaks.file) do
		local var_27_1 = CSV.ReadRow(CSV.streaks, iter_27_0)

		if var_27_1 ~= nil and var_27_1.streakType ~= "" and tonumber(var_27_1.showInMenus) > 0 then
			local var_27_2
			local var_27_3

			if var_27_1.streakType == STREAK.Types.LETHAL then
				var_27_2 = PlayerData.BFFBGAJGD(arg_27_0, CoD.StatsGroup.Ranked).playerStats.lethalScorestreakStats[var_27_1.ref]
			elseif var_27_1.streakType == STREAK.Types.SUPPORT then
				var_27_2 = PlayerData.BFFBGAJGD(arg_27_0, CoD.StatsGroup.Ranked).playerStats.supportScorestreakStats[var_27_1.ref]
				var_27_3 = var_27_1.extraRecordType
			end

			if var_27_2 == nil then
				DebugPrint(var_27_1.ref .. " streak not found in playerStats")
			else
				local var_27_4 = {
					ref = var_27_1.ref,
					name = var_27_1.name,
					image = STREAK.GetProgressionImage(var_27_1.ref),
					uses = var_27_2.uses:get(),
					extraStat1 = var_27_2.extraStat1:get(),
					streakType = var_27_1.streakType,
					extraRecordType = var_27_3
				}

				table.insert(var_27_0, var_27_4)
			end
		end
	end

	return var_27_0
end
