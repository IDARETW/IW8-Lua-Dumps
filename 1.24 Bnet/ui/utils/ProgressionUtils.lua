PROGRESSION = PROGRESSION or {}
PROGRESSION.PROGRESSION_TRACKER_ID_START = 100000
PROGRESSION.PROGRESSION_TRACKER_ID_END = 109999

function PROGRESSION.GetMaxRank()
	return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.file, 0, "maxrank", 1))
end

function PROGRESSION.GetMaxRankXP()
	local var_2_0 = PROGRESSION.GetMaxRank()

	return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.file, CSV.MPRank.cols.index, var_2_0, CSV.MPRank.cols.maxXP))
end

function PROGRESSION.GetMaxElderRank()
	return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.file, 0, "maxelder", 1))
end

function PROGRESSION.GetCurrentSeasonProgressionFile(arg_4_0)
	local var_4_0 = arg_4_0 or SEASON.GetCurrentSeason()

	return CSV.elderProgressionTable.GetFile(var_4_0)
end

function PROGRESSION.GetUnlockText(arg_5_0, arg_5_1, arg_5_2)
	if PROGRESSION.GetPlayerPrestige(arg_5_0) > 0 then
		return Engine.CBBHFCGDIC("CAS/RANDOM_UNLOCK")
	else
		local var_5_0 = LOOT.GetItemID(arg_5_1, arg_5_2)
		local var_5_1 = PROGRESSION.GetUnlockRank(var_5_0)

		if var_5_1 <= 0 then
			if Engine.BHICADFIHA() then
				return "DEV ONLY MSG: Item " .. var_5_0 .. " not found in progressionitems.csv or item is rank 1 and isn't in your inventory."
			else
				return Engine.CBBHFCGDIC("LUA_MENU/LOCKED")
			end
		end

		return PROGRESSION.GetUnlockTextWithRank(var_5_1, arg_5_1)
	end
end

function PROGRESSION.GetUnlockTextWithRank(arg_6_0, arg_6_1)
	local var_6_0 = PROGRESSION.GetRankDisplay(arg_6_0)
	local var_6_1 = "CAS/ITEM_UNLOCK"

	if arg_6_1 == LOOT.itemTypes.FEATURE then
		var_6_1 = "LUA_MENU_MP/UNLOCK_LEVEL"
	end

	return Engine.CBBHFCGDIC(var_6_1, var_6_0)
end

function PROGRESSION.GetUnlockRank(arg_7_0)
	if arg_7_0 == nil or tonumber(arg_7_0) == nil then
		return -1
	end

	local var_7_0 = StringTable.BFHCAIIDA(CSV.progressionItems.file)

	for iter_7_0 = 0, var_7_0 do
		local var_7_1 = CSV.ReadRowWithFile(CSV.progressionItems, CSV.progressionItems.file, iter_7_0)
		local var_7_2 = CSV.progressionItems.cols.lastItem

		if iter_7_0 == 0 then
			var_7_2 = CSV.progressionItems.cols.lastItemFirstRank
		end

		for iter_7_1 = CSV.progressionItems.cols.firstItem, var_7_2 do
			local var_7_3 = StringTable.CBGJCDIHCE(CSV.progressionItems.file, iter_7_0, iter_7_1)

			if arg_7_0 == tonumber(var_7_3) then
				return iter_7_0
			end
		end
	end

	for iter_7_2 = CSV.progressionItems.cols.firstItem, CSV.progressionItems.cols.lastItem do
		local var_7_4 = StringTable.DIFCHIGDFB(CSV.progressionItems.file, iter_7_2, arg_7_0, CSV.progressionItems.cols.rank)

		if #var_7_4 > 0 then
			return tonumber(var_7_4)
		end
	end

	local var_7_5 = PROGRESSION.GetCurrentSeasonProgressionFile()
	local var_7_6 = StringTable.DIFCHIGDFB(var_7_5, CSV.elderProgressionTable.cols.lootID, arg_7_0, CSV.elderProgressionTable.cols.rank)

	if #var_7_6 > 0 then
		return tonumber(var_7_6) + PROGRESSION.GetMaxRank()
	end

	return -1
end

function PROGRESSION.GetRankUnlocks(arg_8_0)
	local var_8_0 = {}

	if tonumber(arg_8_0) <= PROGRESSION.GetMaxRank() then
		for iter_8_0 = CSV.progressionItems.cols.firstItem, CSV.progressionItems.cols.lastItem do
			local var_8_1 = StringTable.CBGJCDIHCE(CSV.progressionItems.file, arg_8_0, iter_8_0)

			table.insert(var_8_0, var_8_1)
		end
	else
		local var_8_2 = arg_8_0 - PROGRESSION.GetMaxRank()
		local var_8_3 = PROGRESSION.GetCurrentSeasonProgressionFile()
		local var_8_4 = StringTable.DIFCHIGDFB(var_8_3, CSV.elderProgressionTable.cols.rank, var_8_2, CSV.elderProgressionTable.cols.lootID)

		table.insert(var_8_0, var_8_4)
	end

	return var_8_0
end

function PROGRESSION.IsUnlocked(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = LOOT.GetItemID(arg_9_1, arg_9_2)

	if var_9_0 then
		return PROGRESSION.IsUnlockedWithID(arg_9_0, var_9_0)
	else
		DebugPrint("Attempt to check unlock state for item " .. arg_9_2 .. " which is not included in loot csvs.")

		return true
	end
end

function PROGRESSION.IsSpecialistPerkUnlocked(arg_10_0)
	return PROGRESSION.IsUnlocked(arg_10_0, LOOT.itemTypes.FEATURE, LOOT.perkSpecialistRef) or CONDITIONS.IsDevelopmentBuild()
end

function PROGRESSION.ShouldUnlockAll()
	return IsSystemLink() or not CONDITIONS.IsThirdGameMode() and IsPrivateMatch() or Dvar.IBEGCHEFE("OLKMKMTKRO") or CONDITIONS.AreRestrictionsActive(Engine.IJEBHJIJF()) or IsMlgGameBattlesMatch()
end

function PROGRESSION.IsUnlockedWithID(arg_12_0, arg_12_1)
	return PROGRESSION.ShouldUnlockAll() or Loot.DEBEIFJEEG(arg_12_0, tonumber(arg_12_1)) > 0
end

function PROGRESSION.GetPlayerXP(arg_13_0)
	return OnlineProgression.CBJHJGIGDA(arg_13_0)
end

function PROGRESSION.GetPlayerSeasonXP(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1 or SEASON.GetCurrentSeason()

	return OnlineProgression.DFDGDCIAHI(arg_14_0, var_14_0)
end

function PROGRESSION.GetPlayerRankIcon(arg_15_0)
	local var_15_0 = PROGRESSION.GetPlayerRank(arg_15_0)
	local var_15_1 = PROGRESSION.GetPlayerPrestige(arg_15_0)

	return PROGRESSION.GetRankIcon(var_15_0, var_15_1)
end

function PROGRESSION.GetSeasonRankIcon(arg_16_0)
	local var_16_0 = PROGRESSION.GetCurrentSeasonProgressionFile()
	local var_16_1 = LUI.clamp(arg_16_0, 1, 100)

	return StringTable.DIFCHIGDFB(var_16_0, CSV.elderProgressionTable.cols.rank, var_16_1, CSV.elderProgressionTable.cols.rankIcon)
end

function PROGRESSION.GetSeasonBigRankIcon(arg_17_0)
	local var_17_0 = PROGRESSION.GetCurrentSeasonProgressionFile()
	local var_17_1 = LUI.clamp(arg_17_0, 1, 100)

	return StringTable.DIFCHIGDFB(var_17_0, CSV.elderProgressionTable.cols.rank, var_17_1, CSV.elderProgressionTable.cols.rankBigIcon)
end

function PROGRESSION.GetRankIcon(arg_18_0)
	if tonumber(arg_18_0) <= PROGRESSION.GetMaxRank() then
		return StringTable.DIFCHIGDFB(CSV.MPRankIcons.file, CSV.MPRankIcons.cols.index, arg_18_0, CSV.MPRankIcons.cols.standard)
	else
		return PROGRESSION.GetSeasonRankIcon(PROGRESSION.LifeTimeRankToElderRank(arg_18_0))
	end
end

function PROGRESSION.GetSeasonRankBigIcon(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1 or SEASON.GetCurrentSeason()
	local var_19_1 = PROGRESSION.GetCurrentSeasonProgressionFile(var_19_0)
	local var_19_2 = LUI.clamp(arg_19_0, 1, 100)

	return StringTable.DIFCHIGDFB(var_19_1, CSV.elderProgressionTable.cols.rank, var_19_2, CSV.elderProgressionTable.cols.rankBigIcon)
end

function PROGRESSION.GetRankBigIcon(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1 or SEASON.GetCurrentSeason()

	if tonumber(arg_20_0) <= PROGRESSION.GetMaxRank() then
		return StringTable.DIFCHIGDFB(CSV.MPRankBigIcons.file, CSV.MPRankBigIcons.cols.index, arg_20_0, CSV.MPRankBigIcons.cols.standard)
	else
		return PROGRESSION.GetSeasonRankBigIcon(PROGRESSION.LifeTimeRankToElderRank(arg_20_0), var_20_0)
	end
end

function PROGRESSION.GetRankFromXP(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	local var_21_0 = 0
	local var_21_1 = arg_21_2

	while var_21_1 > var_21_0 + 1 do
		local var_21_2 = math.floor((var_21_1 - var_21_0) / 2) + var_21_0
		local var_21_3
		local var_21_4

		if arg_21_3 then
			local var_21_5 = StringTable.BJJBBCJGEJ(arg_21_4, CSV.elderProgressionTable.cols.rank, tostring(var_21_2))

			var_21_4 = CSV.ReadRowWithFileAndColumns(arg_21_4, var_21_5, CSV.elderProgressionTable.cols)
		else
			local var_21_6 = StringTable.BJJBBCJGEJ(arg_21_1.file, arg_21_1.cols.index, tostring(var_21_2))

			var_21_4 = CSV.ReadRow(arg_21_1, var_21_6)
		end

		local var_21_7 = tonumber(var_21_4.minXP)
		local var_21_8 = tonumber(var_21_4.maxXP)

		if var_21_7 <= arg_21_0 and arg_21_0 < var_21_8 then
			return var_21_2
		elseif var_21_8 <= arg_21_0 then
			var_21_0 = var_21_2
		else
			var_21_1 = var_21_2
		end
	end

	local var_21_9
	local var_21_10

	if arg_21_3 then
		local var_21_11 = StringTable.BJJBBCJGEJ(arg_21_4, CSV.elderProgressionTable.cols.rank, var_21_0)

		var_21_10 = CSV.ReadRowWithFileAndColumns(arg_21_4, var_21_11, CSV.elderProgressionTable.cols)
	else
		local var_21_12 = StringTable.BJJBBCJGEJ(arg_21_1.file, arg_21_1.cols.index, var_21_0)

		var_21_10 = CSV.ReadRow(arg_21_1, var_21_12)
	end

	if arg_21_0 >= tonumber(var_21_10.minXP) and arg_21_0 < tonumber(var_21_10.maxXP) then
		return var_21_0
	end

	return var_21_1
end

function PROGRESSION.GetSeasonRankXPToNext(arg_22_0)
	local var_22_0 = PROGRESSION.GetCurrentSeasonProgressionFile()
	local var_22_1 = LUI.clamp(arg_22_0, 1, 100)

	return tonumber(StringTable.DIFCHIGDFB(var_22_0, CSV.elderProgressionTable.cols.rank, var_22_1, CSV.elderProgressionTable.cols.XPToNext))
end

function PROGRESSION.GetRankXPToNext(arg_23_0)
	if tonumber(arg_23_0) <= PROGRESSION.GetMaxRank() then
		return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.file, CSV.MPRank.cols.index, arg_23_0, CSV.MPRank.cols.XPToNext))
	else
		return PROGRESSION.GetSeasonRankXPToNext(PROGRESSION.LifeTimeRankToElderRank(arg_23_0))
	end
end

function PROGRESSION.GetSeasonRankName(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1 or SEASON.GetCurrentSeason()
	local var_24_1 = PROGRESSION.GetCurrentSeasonProgressionFile(var_24_0)
	local var_24_2 = LUI.clamp(arg_24_0, 1, 100)

	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_24_1, CSV.elderProgressionTable.cols.rank, var_24_2, CSV.elderProgressionTable.cols.rankName))
end

function PROGRESSION.GetRankName(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1 or SEASON.GetCurrentSeason()

	if tonumber(arg_25_0) <= PROGRESSION.GetMaxRank() then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.MPRank.file, CSV.MPRank.cols.index, arg_25_0, CSV.MPRank.cols.name))
	else
		return PROGRESSION.GetSeasonRankName(PROGRESSION.LifeTimeRankToElderRank(arg_25_0), var_25_0)
	end
end

function PROGRESSION.GetRankDisplay(arg_26_0)
	if tonumber(arg_26_0) <= PROGRESSION.GetMaxRank() then
		return StringTable.DIFCHIGDFB(CSV.MPRank.file, CSV.MPRank.cols.index, arg_26_0, CSV.MPRank.cols.displayLevel)
	else
		return tonumber(arg_26_0) + 1
	end
end

function PROGRESSION.GetSeasonRankDisplay(arg_27_0)
	assert(arg_27_0 > PROGRESSION.GetMaxRank())

	return tonumber(arg_27_0) - PROGRESSION.GetMaxRank()
end

function PROGRESSION.GetSeasonRankMinXP(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1 or SEASON.GetCurrentSeason()
	local var_28_1 = PROGRESSION.GetCurrentSeasonProgressionFile(var_28_0)
	local var_28_2 = LUI.clamp(arg_28_0, 1, 100)

	return tonumber(StringTable.DIFCHIGDFB(var_28_1, CSV.elderProgressionTable.cols.rank, var_28_2, CSV.elderProgressionTable.cols.minXP))
end

function PROGRESSION.GetRankMinXP(arg_29_0)
	if tonumber(arg_29_0) <= PROGRESSION.GetMaxRank() then
		return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.file, CSV.MPRank.cols.index, arg_29_0, CSV.MPRank.cols.minXP))
	else
		return PROGRESSION.GetSeasonRankMinXP(PROGRESSION.LifeTimeRankToElderRank(arg_29_0))
	end
end

function PROGRESSION.GetSeasonRankMaxXP(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1 or SEASON.GetCurrentSeason()
	local var_30_1 = PROGRESSION.GetCurrentSeasonProgressionFile(var_30_0)
	local var_30_2 = LUI.clamp(arg_30_0, 1, 100)

	return tonumber(StringTable.DIFCHIGDFB(var_30_1, CSV.elderProgressionTable.cols.rank, var_30_2, CSV.elderProgressionTable.cols.maxXP))
end

function PROGRESSION.GetRankMaxXP(arg_31_0)
	if tonumber(arg_31_0) <= PROGRESSION.GetMaxRank() then
		return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.file, CSV.MPRank.cols.index, arg_31_0, CSV.MPRank.cols.maxXP))
	else
		return PROGRESSION.GetSeasonRankMaxXP(PROGRESSION.LifeTimeRankToElderRank(arg_31_0))
	end
end

function PROGRESSION.GetRankByXP(arg_32_0)
	arg_32_0 = tonumber(arg_32_0)

	return PROGRESSION.GetRankFromXP(arg_32_0, CSV.MPRank, PROGRESSION.GetMaxRank())
end

function PROGRESSION.GetElderRankByXP(arg_33_0)
	arg_33_0 = tonumber(arg_33_0)

	local var_33_0 = PROGRESSION.GetCurrentSeasonProgressionFile()

	return PROGRESSION.GetRankFromXP(arg_33_0, nil, PROGRESSION.GetMaxElderRank(), true, var_33_0)
end

function PROGRESSION.GetRankPercentage(arg_34_0)
	local var_34_0 = PROGRESSION.GetPlayerXP(arg_34_0)

	return PROGRESSION.GetRankPercentageFromXP(var_34_0)
end

function PROGRESSION.GetRankPercentageFromXP(arg_35_0)
	local var_35_0 = PROGRESSION.GetRankByXP(arg_35_0)
	local var_35_1 = PROGRESSION.GetRankMinXP(var_35_0)
	local var_35_2 = PROGRESSION.GetRankMaxXP(var_35_0)
	local var_35_3 = 0

	if var_35_2 - var_35_1 ~= 0 then
		var_35_3 = (arg_35_0 - var_35_1) / (var_35_2 - var_35_1)
	end

	return LUI.clamp(var_35_3, 0, 1)
end

function PROGRESSION.GetSeasonRankPercentage(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_1 or SEASON.GetCurrentSeason()
	local var_36_1 = PROGRESSION.GetPlayerSeasonXP(arg_36_0, var_36_0)

	return PROGRESSION.GetSeasonRankPercentageFromXP(var_36_1, arg_36_0, var_36_0)
end

function PROGRESSION.GetSeasonRankPercentageFromXP(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_2 or SEASON.GetCurrentSeason()
	local var_37_1 = PROGRESSION.GetPlayerSeasonRank(arg_37_1, var_37_0)
	local var_37_2 = PROGRESSION.GetSeasonRankMinXP(var_37_1, var_37_0)
	local var_37_3 = PROGRESSION.GetSeasonRankMaxXP(var_37_1, var_37_0)
	local var_37_4 = 0

	if var_37_3 == nil or var_37_2 == nil then
		DebugPrint("PROGRESSION.GetSeasonRankPercentageFromXP recieved nil for min or max xp for seasonRank " .. var_37_1)

		var_37_4 = 0
	elseif var_37_3 - var_37_2 ~= 0 then
		var_37_4 = (arg_37_0 - var_37_2) / (var_37_3 - var_37_2)
	end

	return LUI.clamp(var_37_4, 0, 1)
end

function PROGRESSION.GetPlayerPrestige(arg_38_0)
	return 0
end

function PROGRESSION.GetWeaponLevel(arg_39_0, arg_39_1)
	return Gunsmith.BEDFIJHAB(arg_39_0, arg_39_1).rank + 1
end

function PROGRESSION.GetMaxWeaponLevel(arg_40_0)
	local var_40_0 = CSV.gunsmithProgressionTable:GetFile(arg_40_0)
	local var_40_1 = 0

	for iter_40_0 = 0, StringTable.BFHCAIIDA(var_40_0) do
		local var_40_2 = StringTable.CBGJCDIHCE(var_40_0, iter_40_0, CSV.gunsmithProgressionTable.cols.level)

		if var_40_2 and #var_40_2 > 0 then
			local var_40_3 = tonumber(var_40_2)

			if var_40_1 < var_40_3 then
				var_40_1 = var_40_3
			end
		end
	end

	return var_40_1 + 1
end

function PROGRESSION.IsWeaponMaxLevel(arg_41_0, arg_41_1)
	return PROGRESSION.GetWeaponLevel(arg_41_0, arg_41_1) >= PROGRESSION.GetMaxWeaponLevel(arg_41_1)
end

function PROGRESSION.GetWeaponXPPercent(arg_42_0, arg_42_1)
	local var_42_0 = PROGRESSION.GetWeaponXP(arg_42_0, arg_42_1)
	local var_42_1 = PROGRESSION.GetWeaponCurrentLevelXP(arg_42_0, arg_42_1)
	local var_42_2 = PROGRESSION.GetWeaponNextLevelXP(arg_42_0, arg_42_1)

	if PROGRESSION.IsWeaponMaxLevel(arg_42_0, arg_42_1) then
		return 1
	end

	return LUI.clamp((var_42_0 - var_42_1) / (var_42_2 - var_42_1), 0, 1)
end

function PROGRESSION.GetWeaponXP(arg_43_0, arg_43_1)
	return Gunsmith.BEDFIJHAB(arg_43_0, arg_43_1).xp
end

function PROGRESSION.GetWeaponNextLevelXP(arg_44_0, arg_44_1)
	local var_44_0 = PROGRESSION.GetWeaponLevel(arg_44_0, arg_44_1)

	return tonumber(StringTable.DIFCHIGDFB(CSV.weaponRankTable.file, CSV.weaponRankTable.cols.index, var_44_0, CSV.weaponRankTable.cols.minXP))
end

function PROGRESSION.GetWeaponCurrentLevelXP(arg_45_0, arg_45_1)
	local var_45_0 = PROGRESSION.GetWeaponLevel(arg_45_0, arg_45_1)

	return tonumber(StringTable.DIFCHIGDFB(CSV.weaponRankTable.file, CSV.weaponRankTable.cols.index, var_45_0 - 1, CSV.weaponRankTable.cols.minXP))
end

function PROGRESSION.IsProgressionTracker(arg_46_0)
	return tonumber(arg_46_0) >= PROGRESSION.PROGRESSION_TRACKER_ID_START and tonumber(arg_46_0) <= PROGRESSION.PROGRESSION_TRACKER_ID_END
end

function PROGRESSION.GetLootUnlockWeaponLevel(arg_47_0, arg_47_1)
	local var_47_0 = CSV.gunsmithProgressionTable
	local var_47_1 = var_47_0:GetFile(arg_47_0)

	for iter_47_0 = 0, StringTable.BFHCAIIDA(var_47_1) do
		local var_47_2 = 0
		local var_47_3 = CSV.ReadRowWithFile(var_47_0, var_47_1, iter_47_0)
		local var_47_4 = var_47_3.level

		while var_47_3.lootID and #var_47_3.lootID > 0 do
			if arg_47_1 == tonumber(var_47_3.lootID) then
				return tonumber(var_47_4) + 1
			end

			var_47_2 = var_47_2 + 1

			local var_47_5 = var_47_0.colOffset * var_47_2
			local var_47_6 = {
				lootID = var_47_0.cols.lootID + var_47_5
			}

			var_47_3 = CSV.ReadRowWithFileAndColumns(var_47_1, iter_47_0, var_47_6)
		end
	end

	return 0
end

function PROGRESSION.IsElder(arg_48_0, arg_48_1)
	local var_48_0 = false

	if PROGRESSION.GetPlayerXP(arg_48_0) >= PROGRESSION.GetMaxRankXP() then
		var_48_0 = true
	end

	if arg_48_1 then
		return var_48_0 or PROGRESSION.GetPlayerSeasonXP(arg_48_0) > 0 and PROGRESSION.GetPlayerLifeTimeRank(arg_48_0) > PROGRESSION.GetMaxRank()
	end

	return var_48_0 or PROGRESSION.GetPlayerLifeTimeRank(arg_48_0) > PROGRESSION.GetMaxRank()
end

function PROGRESSION.IsGettingElderXP(arg_49_0)
	return PROGRESSION.GetPlayerSeasonXP(arg_49_0) > 0
end

function PROGRESSION.GetElderChallengeDescription(arg_50_0)
	return StringTable.DIFCHIGDFB(CSV.elderChallenges.file, CSV.elderChallenges.cols.id, arg_50_0, CSV.elderChallenges.cols.desc)
end

function PROGRESSION.GetElderChallengeAmount(arg_51_0)
	return StringTable.DIFCHIGDFB(CSV.elderChallenges.file, CSV.elderChallenges.cols.id, arg_51_0, CSV.elderChallenges.cols.amount)
end

function PROGRESSION.GetElderChallengeName(arg_52_0)
	return StringTable.DIFCHIGDFB(CSV.elderChallenges.file, CSV.elderChallenges.cols.id, arg_52_0, CSV.elderChallenges.cols.name)
end

function PROGRESSION.GetElderChallengeXPReward(arg_53_0)
	return StringTable.DIFCHIGDFB(CSV.elderChallenges.file, CSV.elderChallenges.cols.id, arg_53_0, CSV.elderChallenges.cols.xp)
end

function PROGRESSION.GetPlayerLifeTimeRank(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_1 or SEASON.GetCurrentSeason()

	return OnlineProgression.BDHJABHDDC(arg_54_0) + PROGRESSION.GetPlayerSeasonRank(arg_54_0, var_54_0)
end

function PROGRESSION.GetPlayerLifeTimeDisplayRank(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_1 or SEASON.GetCurrentSeason()

	return PROGRESSION.GetPlayerLifeTimeRank(arg_55_0, var_55_0) + 1
end

function PROGRESSION.GetPlayerLevel(arg_56_0)
	if PROGRESSION.IsElder(arg_56_0) then
		local var_56_0 = OnlineProgression.DABCDDIHDG(arg_56_0)
		local var_56_1 = LUI.clamp(PROGRESSION.GetPlayerSeasonRank(arg_56_0, 0), 0, 99)
		local var_56_2 = PROGRESSION.GetMaxRank() + 1

		return var_56_0 + var_56_1 + var_56_2
	end

	return OnlineProgression.BDHJABHDDC(arg_56_0)
end

function PROGRESSION.GetPlayerDisplayLevel(arg_57_0)
	return PROGRESSION.GetPlayerLevel(arg_57_0) + 1
end

function PROGRESSION.GetPlayerRank(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_1 or SEASON.GetCurrentSeason()

	if not PROGRESSION.IsElder(arg_58_0) then
		return PROGRESSION.GetPlayerLifeTimeRank(arg_58_0, var_58_0)
	end

	local var_58_1 = PROGRESSION.GetPlayerSeasonRank(arg_58_0, var_58_0)

	return PROGRESSION.GetMaxRank() + var_58_1
end

function PROGRESSION.GetPlayerSeasonRank(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_1 or SEASON.GetCurrentSeason()

	if PROGRESSION.GetPlayerSeasonXP(arg_59_0, var_59_0) > 0 then
		local var_59_1 = OnlineProgression.CFEDCBACGI(arg_59_0, var_59_0) + 1

		return math.min(var_59_1, PROGRESSION.GetMaxElderRank())
	end

	return 0
end

function PROGRESSION.GetPlayerLifeTimeMaxRank()
	return PROGRESSION.GetMaxRank() + PROGRESSION.GetMaxElderRank()
end

function PROGRESSION.GetPlayerLifeTimeMaxXP()
	local var_61_0 = PROGRESSION.GetMaxElderRank()

	return PROGRESSION.GetSeasonRankMaxXP(var_61_0)
end

function PROGRESSION.IsPlayerLifeTimeRankMax(arg_62_0)
	return PROGRESSION.GetPlayerRank(arg_62_0) == PROGRESSION.GetPlayerLifeTimeMaxRank()
end

function PROGRESSION.IsPlayerLifeTimeXPMax(arg_63_0)
	return PROGRESSION.GetPlayerSeasonXP(arg_63_0) >= PROGRESSION.GetPlayerLifeTimeMaxXP()
end

function PROGRESSION.GetPlayerLifeTimeMaxRankLootID(arg_64_0)
	local var_64_0 = PROGRESSION.GetCurrentSeasonProgressionFile()
	local var_64_1 = StringTable.DIFCHIGDFB(var_64_0, 0, "maxrank", 1)

	return StringTable.DIFCHIGDFB(var_64_0, CSV.elderProgressionTable.cols.rank, var_64_1, CSV.elderProgressionTable.cols.lootID)
end

function PROGRESSION.ElderRankToLifeTimeRank(arg_65_0)
	return arg_65_0 + PROGRESSION.GetMaxRank()
end

function PROGRESSION.IsElderRank(arg_66_0)
	return arg_66_0 > PROGRESSION.GetMaxRank()
end

function PROGRESSION.LifeTimeRankToElderRank(arg_67_0)
	return arg_67_0 - PROGRESSION.GetMaxRank()
end

function PROGRESSION.PrestreamRankUnlocksIcons(arg_68_0, arg_68_1)
	local var_68_0 = StringTable.BFHCAIIDA(CSV.progressionItems.file)
	local var_68_1 = {}
	local var_68_2
	local var_68_3
	local var_68_4
	local var_68_5
	local var_68_6
	local var_68_7

	for iter_68_0 = 0, var_68_0 - 1 do
		local var_68_8 = {}
		local var_68_9 = PROGRESSION.GetRankUnlocks(iter_68_0)

		for iter_68_1 = 1, #var_68_9 do
			if var_68_9[iter_68_1] and #var_68_9[iter_68_1] > 0 then
				table.insert(var_68_8, var_68_9[iter_68_1])
			end
		end

		for iter_68_2 = 1, #var_68_8 do
			if var_68_8[iter_68_2] then
				local var_68_10 = tonumber(var_68_8[iter_68_2])
				local var_68_11 = LOOT.GetTypeForID(var_68_10)
				local var_68_12 = LOOT.GetItemRef(var_68_11, var_68_10)
				local var_68_13 = LOOT.GetItemProgressionImage(var_68_11, var_68_12)

				table.insert(var_68_1, RegisterMaterial(var_68_13))
			end
		end
	end

	arg_68_0.streamer = LUI.UIElement.new()
	arg_68_0.streamer.id = "rank_progression_streamer"

	arg_68_0:addElement(arg_68_0.streamer)
	arg_68_0.streamer:SetupImageTableStreamer(var_68_1, false)
end

function PROGRESSION.PrestreamGamemodeIcons(arg_69_0)
	local var_69_0 = StringTable.BFHCAIIDA(CSV.gameTypesTable.file)
	local var_69_1 = {}

	for iter_69_0 = 0, var_69_0 - 1 do
		local var_69_2 = StringTable.CBGJCDIHCE(CSV.gameTypesTable.file, iter_69_0, CSV.gameTypesTable.cols.image)

		if var_69_2 and #var_69_2 > 0 then
			table.insert(var_69_1, RegisterMaterial(var_69_2))
		end
	end

	arg_69_0.streamer = LUI.UIElement.new()
	arg_69_0.streamer.id = "gamemode_icons_streamer"

	arg_69_0:addElement(arg_69_0.streamer)
	arg_69_0.streamer:SetupImageTableStreamer(var_69_1, false)
end

function PROGRESSION.GetGlobalDoubleXPEventsEndTime()
	return Dvar.CFHDGABACF("MSTMLNKSSO"), Dvar.CFHDGABACF("MOMQQONMMT"), Dvar.CFHDGABACF("OKPMLPMNM"), Dvar.CFHDGABACF("RTQLQLKKR")
end
