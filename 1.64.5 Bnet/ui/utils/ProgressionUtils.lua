PROGRESSION = PROGRESSION or {}
PROGRESSION.PROGRESSION_TRACKER_ID_START = 100000
PROGRESSION.PROGRESSION_TRACKER_ID_END = 109999
PROGRESSION.NUM_RANKS_PER_PRESTIGE_LEVEL = 50
PROGRESSION.NUM_INDICATOR_FOR_VALID_BACKEND_PRESTIGE_LEVEL = 110
PROGRESSION.FIRST_VALID_PRESTIGE_LEVEL = 1
PROGRESSION.FIRST_VALID_RANK = 0
PROGRESSION.T9_SEASON_RANK_MAX = 1000
PROGRESSION.SEASONAL_PROGRESSION_COLOR = SWATCHES.CH2.CH2RankSeason
PROGRESSION.CORE_MILITARY_PROGRESSION_COLOR = SWATCHES.CH2.CH2RankCareer
PROGRESSION.PRESTIGE_MASTER_COLOR = SWATCHES.CH2.CH2SeasonMaster
PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR = SWATCHES.AAR.Default
PROGRESSION.NUM_RANKS_PER_PRESTIGE_MASTER_LEVEL = 200
PROGRESSION.MAX_CHALLENGE_TIERS_COUNT = 5
PROGRESSION.RANK_TYPES = {
	SEASONAL = 2,
	MILITARY = 1
}
PROGRESSION.Title = {
	T9 = 1,
	CORTEZ = 3,
	MAX_NUM = 3,
	MIN_NUM = 0,
	IW8_WZ = 0,
	S4 = 2
}
PROGRESSION.MASTER_LEVEL = {
	LAST = 6,
	FIRST = 1,
	INVALID_LEVEL = 0
}

local function var_0_0()
	return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.GetFile(), 0, "maxrank", 1))
end

local function var_0_1(arg_2_0)
	assert(tonumber(arg_2_0) >= 0 and tonumber(arg_2_0) <= var_0_0())

	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.MPRank.GetFile(), CSV.MPRank.cols.index, tostring(arg_2_0), CSV.MPRank.cols.name))
end

local function var_0_2(arg_3_0)
	arg_3_0 = tonumber(arg_3_0)
	arg_3_0 = arg_3_0 or PROGRESSION.FIRST_VALID_RANK

	return arg_3_0 + 1
end

local function var_0_3(arg_4_0, arg_4_1)
	assert(arg_4_1, "You must pass an options param to CheckFixValOverMaxRank")
	assert(arg_4_1.rankType, "options.rankType is nil and expected to be a valid type from PROGRESSION.RANK_TYPES")

	local var_4_0 = arg_4_1.rankType == PROGRESSION.RANK_TYPES.SEASONAL and PROGRESSION.GetSeasonMaxRank() or var_0_0()

	if var_4_0 < arg_4_0 then
		arg_4_0 = var_4_0
	end

	return arg_4_0
end

local function var_0_4(arg_5_0)
	arg_5_0 = PROGRESSION.ValidatePrestigeLevel(arg_5_0)

	return Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_VALUE", arg_5_0)
end

local function var_0_5(arg_6_0, arg_6_1)
	return PROGRESSION.GetPlayerPrestigeMasterLevelForSeason(arg_6_0, arg_6_1) - PROGRESSION.GetPlayerPrestigeMasterLevelForSeason(arg_6_0, arg_6_1 - 1)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_1 < arg_7_2)

	local var_7_0 = 0

	if arg_7_1 < arg_7_2 then
		var_7_0 = (arg_7_0 - arg_7_1) / (arg_7_2 - arg_7_1)
	end

	return LUI.clamp(var_7_0, 0, 1)
end

local function var_0_7(arg_8_0)
	if Engine.BHICADFIHA() then
		local var_8_0 = Dvar.CFHDGABACF("ui_debug_override_xp_season_" .. tostring(arg_8_0))

		if var_8_0 ~= nil and var_8_0 > 0 then
			return PROGRESSION.GetSeasonRankByXP(var_8_0)
		end

		local var_8_1 = Dvar.CFHDGABACF("ui_debug_override_rank_season_" .. tostring(arg_8_0))

		if var_8_1 ~= nil and var_8_1 > 0 then
			return var_8_1
		end
	end
end

local function var_0_8()
	if Engine.BHICADFIHA() then
		if var_0_7(SEASON.GetCurrentSeasonDataNum()) ~= nil then
			return PROGRESSION.GetMaxMilitaryRankXP()
		end

		local var_9_0 = Dvar.CFHDGABACF("ui_debug_override_xp")

		if var_9_0 ~= nil and var_9_0 > 0 then
			return var_9_0
		end

		local var_9_1 = Dvar.CFHDGABACF("ui_debug_override_rank")

		if var_9_1 ~= nil and var_9_1 > 0 then
			return PROGRESSION.GetMilitaryRankMinXP(var_9_1) + 1200
		end
	end
end

local function var_0_9()
	if Engine.BHICADFIHA() then
		if var_0_7(SEASON.GetCurrentSeasonDataNum()) ~= nil then
			return var_0_0()
		end

		local var_10_0 = Dvar.CFHDGABACF("ui_debug_override_xp")

		if var_10_0 ~= nil and var_10_0 > 0 then
			return PROGRESSION.GetMilitaryRankByXP(var_10_0)
		end

		local var_10_1 = Dvar.CFHDGABACF("ui_debug_override_rank")

		if var_10_1 ~= nil and var_10_1 > 0 then
			return var_10_1
		end
	end
end

local function var_0_10(arg_11_0)
	if Engine.BHICADFIHA() then
		local var_11_0 = Dvar.CFHDGABACF("ui_debug_override_xp_season_" .. tostring(arg_11_0))

		if var_11_0 ~= nil and var_11_0 > 0 then
			return var_11_0
		end

		local var_11_1 = Dvar.CFHDGABACF("ui_debug_override_rank_season_" .. tostring(arg_11_0))

		if var_11_1 ~= nil and var_11_1 > 0 then
			return PROGRESSION.GetSeasonRankMinXP(var_11_1) + 1000
		end
	end
end

local function var_0_11(arg_12_0)
	if Engine.BHICADFIHA() then
		local var_12_0 = 0
		local var_12_1 = Dvar.CFHDGABACF("ui_debug_prestige_level_season_" .. tostring(arg_12_0))

		if var_12_1 ~= nil and var_12_1 > 0 then
			local var_12_2 = var_12_1

			return PROGRESSION.ValidatePrestigeLevel(var_12_2, {
				_seasonNum = arg_12_0
			})
		else
			local var_12_3 = var_0_7(arg_12_0)

			if var_12_3 ~= nil and var_12_3 > 0 then
				local var_12_4 = math.floor(var_12_3 / PROGRESSION.NUM_RANKS_PER_PRESTIGE_LEVEL)

				return PROGRESSION.ValidatePrestigeLevel(var_12_4, {
					_seasonNum = arg_12_0
				})
			end
		end
	end
end

local function var_0_12(arg_13_0)
	if Engine.BHICADFIHA() then
		local var_13_0 = 0
		local var_13_1 = Dvar.CFHDGABACF("ui_debug_prestige_master_level_season_" .. tostring(arg_13_0))

		if var_13_1 ~= nil and var_13_1 >= 0 then
			return var_13_1
		else
			local var_13_2 = var_0_7(arg_13_0)

			if var_13_2 ~= nil and var_13_2 > 0 then
				local var_13_3 = math.floor(var_13_2 / PROGRESSION.NUM_RANKS_PER_PRESTIGE_LEVEL)

				return PROGRESSION.ValidatePrestigeLevel(var_13_3, {
					_seasonNum = arg_13_0
				})
			end
		end
	end
end

function PROGRESSION.ValidatePrestigeLevel(arg_14_0, arg_14_1)
	local var_14_0 = tonumber(arg_14_0)

	if not var_14_0 or var_14_0 <= 0 then
		return PROGRESSION.FIRST_VALID_PRESTIGE_LEVEL
	end

	if arg_14_1 and arg_14_1._isBackendPrestigeLevel then
		var_14_0 = arg_14_0 - PROGRESSION.NUM_INDICATOR_FOR_VALID_BACKEND_PRESTIGE_LEVEL

		if var_14_0 <= 0 then
			return PROGRESSION.FIRST_VALID_PRESTIGE_LEVEL
		end
	end

	local var_14_1 = arg_14_1 and arg_14_1._seasonNum and arg_14_1._seasonNum >= 0 and PROGRESSION.GetMaxPrestigeLevelForSeason(arg_14_1._seasonNum) or PROGRESSION.GetMaxPlayerPrestigeLevel()

	var_14_0 = var_14_1 <= var_14_0 and var_14_1 or var_14_0

	return var_14_0
end

function PROGRESSION.GetPlayerMilitaryXP(arg_15_0)
	local var_15_0 = var_0_8()

	if var_15_0 ~= nil then
		return var_15_0
	end

	return OnlineProgression.CBJHJGIGDA(arg_15_0)
end

function PROGRESSION.GetPlayerMilitaryRank(arg_16_0, arg_16_1)
	local var_16_0 = var_0_9()

	if var_16_0 ~= nil then
		return var_16_0
	end

	local var_16_1 = OnlineProgression.BDHJABHDDC(arg_16_0)

	var_16_1 = var_16_1 and var_0_3(var_16_1, {
		rankType = PROGRESSION.RANK_TYPES.MILITARY
	})

	return var_16_1
end

function PROGRESSION.GetPlayerMilitaryRankPercentage(arg_17_0)
	local var_17_0 = PROGRESSION.GetPlayerMilitaryXP(arg_17_0)
	local var_17_1 = PROGRESSION.GetPlayerMilitaryRank(arg_17_0)
	local var_17_2 = PROGRESSION.GetMilitaryRankMinXP(var_17_1)
	local var_17_3 = PROGRESSION.GetMilitaryRankMaxXP(var_17_1)

	return var_0_6(var_17_0, var_17_2, var_17_3)
end

function PROGRESSION.GetPlayerSeasonXP(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1 or SEASON.GetCurrentSeasonDataNum()
	local var_18_1 = var_0_10(var_18_0)

	if var_18_1 ~= nil then
		return var_18_1
	end

	return OnlineProgression.DFDGDCIAHI(arg_18_0, var_18_0)
end

function PROGRESSION.GetPlayerSeasonRank(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1 or SEASON.GetCurrentSeasonDataNum()
	local var_19_1 = var_0_7(var_19_0)
	local var_19_2

	if var_19_1 ~= nil then
		return var_19_1
	end

	local var_19_3 = OnlineProgression.CFEDCBACGI(arg_19_0, var_19_0)

	return var_0_3(var_19_3, {
		rankType = PROGRESSION.RANK_TYPES.SEASONAL
	})
end

function PROGRESSION.GetPlayerSeasonRankPercentage(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1 or SEASON.GetCurrentSeasonDataNum()
	local var_20_1 = PROGRESSION.GetPlayerSeasonXP(arg_20_0, var_20_0)
	local var_20_2 = PROGRESSION.GetPlayerSeasonRank(arg_20_0, var_20_0)
	local var_20_3 = PROGRESSION.GetSeasonRankMinXP(var_20_2)
	local var_20_4 = PROGRESSION.GetSeasonRankMaxXP(var_20_2)

	return var_0_6(var_20_1, var_20_3, var_20_4)
end

function PROGRESSION.GetSeasonMaxRank()
	return PROGRESSION.T9_SEASON_RANK_MAX
end

function PROGRESSION.GetPlayerIsInSeasonalProgression(arg_22_0)
	return PROGRESSION.GetPlayerMilitaryXP(arg_22_0) >= PROGRESSION.GetMaxMilitaryRankXP()
end

function PROGRESSION.GetPlayerProgressionData(arg_23_0)
	assert(arg_23_0 and type(arg_23_0) == "table", "PROGRESSION.GetPlayerProgressionData() -> options table is nil/unspecified, but expected to always be a valid table")

	local var_23_0 = arg_23_0._rankNumOverride
	local var_23_1 = arg_23_0._controllerIndex
	local var_23_2 = arg_23_0._combinedRankNum
	local var_23_3 = arg_23_0._rankTypeOverride
	local var_23_4 = var_23_2 ~= nil
	local var_23_5 = var_23_0 ~= nil
	local var_23_6 = var_23_3 == PROGRESSION.RANK_TYPES.MILITARY or var_23_3 == PROGRESSION.RANK_TYPES.SEASONAL

	if var_23_5 then
		var_23_0 = tonumber(var_23_0)

		assert(var_23_0, "PROGRESSION.GetPlayerProgressionData() -> rankNumOverride expected to be non-nil")
	elseif var_23_4 then
		var_23_2 = tonumber(var_23_2)

		assert(var_23_2, "PROGRESSION.GetPlayerProgressionData() -> combinedRankNum expected to be non-nil")
	else
		assert(var_23_1, "PROGRESSION.GetPlayerProgressionData() -> none of the 3 primary ways ( i.e. either utilizing _rankNumOverride, _combinedRankNum, or _controllerIndex ) of using this function are passing valid params. Please verify which way of using this function is desired and the validity of params being used in the instance of this function that's failing.")
	end

	local var_23_7 = var_0_2(var_0_0())
	local var_23_8 = arg_23_0._seasonNumOverride or SEASON.GetCurrentSeasonDataNum()
	local var_23_9
	local var_23_10

	if var_23_5 then
		assert(var_23_6, "PROGRESSION.GetPlayerProgressionData() -> using _rankNumOverride, without also specifying a _rankTypeOverride is unsupported")

		var_23_9 = var_23_0
		var_23_10 = var_23_0
	else
		var_23_9 = var_23_4 and var_23_2 - var_23_7 or PROGRESSION.GetPlayerSeasonRank(var_23_1, var_23_8)
		var_23_10 = var_23_4 and var_23_2 or PROGRESSION.GetPlayerMilitaryRank(var_23_1)
	end

	local var_23_11

	if var_23_6 then
		var_23_11 = var_23_3 == PROGRESSION.RANK_TYPES.SEASONAL
	elseif var_23_4 then
		var_23_11 = var_23_9 >= 0
	elseif var_23_1 then
		var_23_11 = PROGRESSION.GetPlayerIsInSeasonalProgression(var_23_1)
	end

	assert(var_23_11 ~= nil, "PROGRESSION.GetPlayerProgressionData() -> isUsingSeasonalRank was not able to be validly set to a value and is instead nil")

	local var_23_12 = var_23_11 and var_23_9 or var_23_10
	local var_23_13 = var_23_11 and PROGRESSION.GetSeasonMaxRank() or var_0_0()

	assert(var_23_12, "PROGRESSION.GetPlayerProgressionData(): rank is expected to be non-nil")
	assert(var_23_13, "PROGRESSION.GetPlayerProgressionData(): rankMax is expected to be non-nil")

	local var_23_14 = var_0_3(var_23_12, {
		rankType = var_23_11 and PROGRESSION.RANK_TYPES.SEASONAL or PROGRESSION.RANK_TYPES.MILITARY
	})
	local var_23_15 = arg_23_0._prestigeLevel

	if not var_23_4 and not var_23_5 then
		assert(var_23_1, "PROGRESSION.GetPlayerProgressionData() -> trying to grab prestige from a nil controllerIndex")

		var_23_15 = PROGRESSION.GetPlayerPrestigeLevelAtSeason(var_23_1, var_23_8)
	end

	local var_23_16 = PROGRESSION.ValidatePrestigeLevel(var_23_15, {
		_seasonNum = var_23_8
	})
	local var_23_17
	local var_23_18
	local var_23_19
	local var_23_20
	local var_23_21
	local var_23_22
	local var_23_23
	local var_23_24
	local var_23_25 = SWATCHES.AAR.Default
	local var_23_26 = var_23_11 and PROGRESSION.GetPrestigeIcon(var_23_16, var_23_8) or PROGRESSION.GetMilitaryRankIcon(var_23_14)
	local var_23_27 = var_23_11 and var_0_4(var_23_16) or var_0_1(var_23_14)

	assert(var_23_26, "PROGRESSION.GetPlayerProgressionData(): rankIcon is expected to be non-nil")
	assert(var_23_27, "PROGRESSION.GetPlayerProgressionData(): rankName is expected to be non-nil")

	if var_23_1 then
		assert(not var_23_4 and not var_23_5, "PROGRESSION.GetPlayerProgressionData() -> attempt to grab data that's currently only supported for grabbing via local player")

		var_23_23 = PROGRESSION.GetPlayerPrestigeMasterLevelForSeason(var_23_1, var_23_8)
		var_23_24 = PROGRESSION.GetPrestigeMasterRibbon(var_23_23)
		var_23_25 = var_0_5(var_23_1, var_23_8) > 0 and PROGRESSION.PRESTIGE_MASTER_COLOR or PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR

		local var_23_28 = PROGRESSION.GetPlayerXP(var_23_1)

		var_23_19 = PROGRESSION.GetPlayerRankMinXP(var_23_1, var_23_8)
		var_23_20 = PROGRESSION.GetPlayerRankMaxXP(var_23_1, var_23_8)
		var_23_18 = var_23_28 - var_23_19
		var_23_17 = PROGRESSION.GetPlayerRankXPToNext(var_23_1)
		var_23_22 = var_23_28 >= (var_23_11 and PROGRESSION.GetSeasonMaxRankXP() or PROGRESSION.GetMaxMilitaryRankXP())
		var_23_21 = var_23_11 and PROGRESSION.GetPlayerSeasonRankPercentage(var_23_1, var_23_8) or PROGRESSION.GetPlayerMilitaryRankPercentage(var_23_1)
	else
		var_23_25 = var_23_11 and PROGRESSION.GetAchievedPrestigeMasterForSeasonalRank(var_23_9) and PROGRESSION.PRESTIGE_MASTER_COLOR or PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR
		var_23_19 = var_23_11 and PROGRESSION.GetSeasonRankMinXP(var_23_14) or PROGRESSION.GetMilitaryRankMinXP(var_23_14)
		var_23_20 = var_23_11 and PROGRESSION.GetSeasonRankMaxXP(var_23_14) or PROGRESSION.GetMilitaryRankMaxXP(var_23_14)
	end

	return {
		_isUsingSeasonalRank = var_23_11,
		_progressionColor = var_23_11 and PROGRESSION.SEASONAL_PROGRESSION_COLOR or PROGRESSION.CORE_MILITARY_PROGRESSION_COLOR,
		_rank = var_23_14,
		_rankDisplay = var_0_2(var_23_14),
		_rankMax = var_23_13,
		_rankMaxDisplay = var_0_2(var_23_13),
		_rankIcon = var_23_26,
		_rankName = var_23_27,
		_rankPercentage = var_23_21,
		_prestige = var_23_16,
		_prestigeMasterLevel = var_23_23,
		_prestigeMasterRibbon = var_23_24,
		_prestigeMasterColor = var_23_25,
		_xpForCurrentRank = var_23_18,
		_xpTillNextRank = var_23_17,
		_minXPForCurrentRank = var_23_19,
		_maxXPForCurrentRank = var_23_20,
		_isXpProgressionComplete = var_23_22
	}
end

function PROGRESSION.GetNonPlayerProgressionData(arg_24_0)
	assert(arg_24_0 and type(arg_24_0) == "table", "PROGRESSION.GetNonPlayerProgressionData() -> options table is nil/unspecified, but expected to always be a valid table")

	return {
		_levelDisplay = var_0_2(arg_24_0._level)
	}
end

function PROGRESSION.GetPlayerRank(arg_25_0, arg_25_1)
	arg_25_1 = arg_25_1 or SEASON.GetCurrentSeasonDataNum()

	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_25_0) then
		return PROGRESSION.GetPlayerSeasonRank(arg_25_0, arg_25_1)
	end

	return PROGRESSION.GetPlayerMilitaryRank(arg_25_0)
end

function PROGRESSION.GetPlayerRankPercentage(arg_26_0)
	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_26_0) then
		return PROGRESSION.GetPlayerSeasonRankPercentage(arg_26_0)
	end

	return PROGRESSION.GetPlayerMilitaryRankPercentage(arg_26_0)
end

function PROGRESSION.GetPlayerXP(arg_27_0, arg_27_1)
	arg_27_1 = arg_27_1 or SEASON.GetCurrentSeasonDataNum()

	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_27_0) then
		return PROGRESSION.GetPlayerSeasonXP(arg_27_0, arg_27_1)
	end

	return PROGRESSION.GetPlayerMilitaryXP(arg_27_0)
end

function PROGRESSION.GetPlayerRankMinXP(arg_28_0, arg_28_1)
	arg_28_1 = arg_28_1 or SEASON.GetCurrentSeasonDataNum()

	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_28_0) then
		local var_28_0 = PROGRESSION.GetPlayerSeasonRank(arg_28_0, arg_28_1)

		return PROGRESSION.GetSeasonRankMinXP(var_28_0)
	end

	local var_28_1 = PROGRESSION.GetPlayerMilitaryRank(arg_28_0)

	return PROGRESSION.GetMilitaryRankMinXP(var_28_1)
end

function PROGRESSION.GetPlayerRankMaxXP(arg_29_0, arg_29_1)
	arg_29_1 = arg_29_1 or SEASON.GetCurrentSeasonDataNum()

	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_29_0) then
		local var_29_0 = PROGRESSION.GetPlayerSeasonRank(arg_29_0, arg_29_1)

		return PROGRESSION.GetSeasonRankMaxXP(var_29_0)
	end

	local var_29_1 = PROGRESSION.GetPlayerMilitaryRank(arg_29_0)

	return PROGRESSION.GetMilitaryRankMaxXP(var_29_1)
end

function PROGRESSION.GetPlayerRankXPToNext(arg_30_0, arg_30_1)
	arg_30_1 = arg_30_1 or SEASON.GetCurrentSeasonDataNum()

	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_30_0) then
		local var_30_0 = PROGRESSION.GetPlayerSeasonRank(arg_30_0, arg_30_1)

		return PROGRESSION.GetSeasonRankXPToNext(var_30_0)
	end

	local var_30_1 = PROGRESSION.GetPlayerMilitaryRank(arg_30_0)

	return PROGRESSION.GetMilitaryRankXPToNext(var_30_1)
end

function PROGRESSION.GetPlayerRankIcon(arg_31_0)
	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_31_0) then
		local var_31_0 = PROGRESSION.GetPlayerPrestigeLevel(arg_31_0)

		return PROGRESSION.GetPrestigeIcon(var_31_0)
	end

	local var_31_1 = PROGRESSION.GetPlayerMilitaryRank(arg_31_0)

	DebugPrint("GetPlayerRankIcon for rank=" .. var_31_1 .. ".")

	return PROGRESSION.GetMilitaryRankIcon(var_31_1)
end

function PROGRESSION.GetPlayerRankName(arg_32_0)
	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_32_0) then
		local var_32_0 = PROGRESSION.GetPlayerPrestigeLevel(arg_32_0)

		return var_0_4(var_32_0)
	end

	local var_32_1 = PROGRESSION.GetPlayerMilitaryRank(arg_32_0)

	return var_0_1(var_32_1)
end

function PROGRESSION.GetPlayerAtMaxRank(arg_33_0)
	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_33_0) then
		return PROGRESSION.GetPlayerSeasonRank(arg_33_0) >= PROGRESSION.GetSeasonMaxRank()
	end

	return false
end

function PROGRESSION.GetUnlockText(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = LOOT.GetItemID(arg_34_1, arg_34_2)
	local var_34_1 = PROGRESSION.GetUnlockRank(var_34_0)

	if var_34_1 <= 0 then
		if Engine.BHICADFIHA() then
			return "DEV ONLY MSG: Item " .. var_34_0 .. " not found in progressionitems.csv or item is rank 1 and isn't in your inventory."
		else
			return Engine.CBBHFCGDIC("LUA_MENU/LOCKED")
		end
	end

	return PROGRESSION.GetUnlockTextWithRank(var_34_1, arg_34_1)
end

function PROGRESSION.GetUnlockTextWithRank(arg_35_0, arg_35_1)
	local var_35_0 = var_0_2(arg_35_0)
	local var_35_1 = "CAS/ITEM_UNLOCK"

	if arg_35_1 == LOOT.itemTypes.FEATURE then
		var_35_1 = "LUA_MENU_MP/UNLOCK_LEVEL"
	end

	return Engine.CBBHFCGDIC(var_35_1, var_35_0)
end

function PROGRESSION.GetUnlockRank(arg_36_0)
	if arg_36_0 == nil or tonumber(arg_36_0) == nil then
		return -1
	end

	local var_36_0 = StringTable.BFHCAIIDA(CSV.progressionItems.GetFile())

	for iter_36_0 = 0, var_36_0 do
		if CONDITIONS.ShouldUseCrossTitleIds() then
			local var_36_1 = CSV.progressionItems.cols.firstItem
			local var_36_2 = StringTable.CBGJCDIHCE(CSV.progressionItems.GetFile(), iter_36_0, var_36_1)

			while var_36_2 and var_36_2 ~= "" do
				if arg_36_0 == tonumber(var_36_2) then
					return iter_36_0
				end

				var_36_1 = var_36_1 + 1
				var_36_2 = StringTable.CBGJCDIHCE(CSV.progressionItems.GetFile(), iter_36_0, var_36_1)
			end
		else
			local var_36_3 = CSV.ReadRowWithFile(CSV.progressionItems, CSV.progressionItems.GetFile(), iter_36_0)
			local var_36_4 = CSV.progressionItems.cols.lastItem

			if iter_36_0 == 0 then
				var_36_4 = CSV.progressionItems.cols.lastItemFirstRank
			end

			for iter_36_1 = CSV.progressionItems.cols.firstItem, var_36_4 do
				local var_36_5 = StringTable.CBGJCDIHCE(CSV.progressionItems.GetFile(), iter_36_0, iter_36_1)

				if arg_36_0 == tonumber(var_36_5) then
					return iter_36_0
				end
			end
		end
	end

	if not CONDITIONS.ShouldUseCrossTitleIds() then
		for iter_36_2 = CSV.progressionItems.cols.firstItem, CSV.progressionItems.cols.lastItem do
			local var_36_6 = StringTable.DIFCHIGDFB(CSV.progressionItems.GetFile(), iter_36_2, arg_36_0, CSV.progressionItems.cols.rank)

			if #var_36_6 > 0 then
				return tonumber(var_36_6)
			end
		end
	end

	DebugPrint("ItemID " .. tostring(arg_36_0) .. " has been looked up in PROGRESSION.GetUnlockRank and is not listed in any unlock progression table.")

	return -1
end

function PROGRESSION.IsProgressionUnlockItem(arg_37_0)
	return PROGRESSION.GetUnlockRank(arg_37_0) > -1
end

function PROGRESSION.GetRankUnlocks(arg_38_0)
	local var_38_0 = {}

	if tonumber(arg_38_0) <= var_0_0() then
		if CONDITIONS.ShouldUseCrossTitleIds() then
			local var_38_1 = CSV.progressionItems.cols.firstItem
			local var_38_2 = StringTable.CBGJCDIHCE(CSV.progressionItems.GetFile(), arg_38_0, var_38_1)

			while var_38_2 and var_38_2 ~= "" do
				table.insert(var_38_0, var_38_2)

				var_38_1 = var_38_1 + 1
				var_38_2 = StringTable.CBGJCDIHCE(CSV.progressionItems.GetFile(), arg_38_0, var_38_1)
			end
		else
			for iter_38_0 = CSV.progressionItems.cols.firstItem, CSV.progressionItems.cols.lastItem do
				local var_38_3 = StringTable.CBGJCDIHCE(CSV.progressionItems.GetFile(), arg_38_0, iter_38_0)

				if var_38_3 and var_38_3 ~= "" then
					table.insert(var_38_0, var_38_3)
				end
			end
		end
	end

	return var_38_0
end

function PROGRESSION.IsUnlocked(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = LOOT.GetItemID(arg_39_1, arg_39_2)

	if var_39_0 then
		return PROGRESSION.IsUnlockedWithID(arg_39_0, var_39_0)
	else
		DebugPrint("Attempt to check unlock state for item " .. arg_39_2 .. " which is not included in loot csvs.")

		return true
	end
end

function PROGRESSION.IsSpecialistPerkUnlocked(arg_40_0)
	return PROGRESSION.IsUnlocked(arg_40_0, LOOT.itemTypes.FEATURE, LOOT.perkSpecialistRef) or CONDITIONS.IsDevelopmentBuild()
end

function PROGRESSION.ShouldUnlockAll()
	return IsSystemLink() or not CONDITIONS.IsThirdGameMode() and IsPrivateMatch() or CONDITIONS.AreRestrictionsActive(Engine.IJEBHJIJF()) or not Engine.HEEFCICJE() and IsMlgGameBattlesMatch()
end

function PROGRESSION.ShouldUnlockReleased(arg_42_0)
	return false
end

function PROGRESSION.IsUnlockedWithID(arg_43_0, arg_43_1)
	return PROGRESSION.ShouldUnlockAll() or PROGRESSION.ShouldUnlockReleased(arg_43_1) or Loot.DEBEIFJEEG(arg_43_0, tonumber(arg_43_1)) > 0
end

function PROGRESSION.GetSeasonalProgressionRewardsForNextPrestigeLevelBracket(arg_44_0, arg_44_1)
	local var_44_0 = {}
	local var_44_1 = PROGRESSION.GetNextPrestigeLevelForSeasonIfValid(arg_44_0, arg_44_1)

	if not var_44_1 then
		return var_44_0
	end

	local var_44_2 = CSV.SeasonalProgressionTable
	local var_44_3 = CSV.SeasonalProgressionTable.GetFile()

	var_44_0.stickerID = StringTable.DIFCHIGDFB(var_44_3, var_44_2.cols.prestigeLevel, var_44_1, var_44_2.cols.stickerID)
	var_44_0.emblemID = StringTable.DIFCHIGDFB(var_44_3, var_44_2.cols.prestigeLevel, var_44_1, var_44_2.cols.emblemID)
	var_44_0.markerID = StringTable.DIFCHIGDFB(var_44_3, var_44_2.cols.prestigeLevel, var_44_1, var_44_2.cols.markerID)
	var_44_0.tierSkips = tonumber(StringTable.DIFCHIGDFB(var_44_3, var_44_2.cols.prestigeLevel, var_44_1, var_44_2.cols.tierSkips))
	var_44_0.prestigeKey = tonumber(StringTable.DIFCHIGDFB(var_44_3, var_44_2.cols.prestigeLevel, var_44_1, var_44_2.cols.prestigeKeys))

	return var_44_0
end

function PROGRESSION.GetBlueprintRewardInfoBySeason(arg_45_0, arg_45_1)
	local var_45_0 = CSV.seasonalProgressionBlueprintRewards
	local var_45_1 = {
		_seasonDispNum = StringTable.DIFCHIGDFB(var_45_0.file, var_45_0.cols.seasonDispNum, arg_45_1, var_45_0.cols.seasonDispNum)
	}
	local var_45_2 = StringTable.DIFCHIGDFB(var_45_0.file, var_45_0.cols.seasonDispNum, arg_45_1, var_45_0.cols.seasonRank)

	var_45_1._seasonRank = tonumber(var_45_2)

	local var_45_3 = StringTable.DIFCHIGDFB(var_45_0.file, var_45_0.cols.seasonDispNum, arg_45_1, var_45_0.cols.blueprintID)
	local var_45_4 = SEASON.GetSeasonDataNumFromDisplayNum(arg_45_1)
	local var_45_5 = PROGRESSION.GetNextProgressionRewardBracket(arg_45_0, var_45_4)

	if var_45_3 ~= "" and var_45_1._seasonRank == var_45_5 then
		var_45_1._blueprintID = tonumber(var_45_3)

		return var_45_1
	end
end

function PROGRESSION.GetNextProgressionRewardBracket(arg_46_0, arg_46_1)
	local var_46_0 = PROGRESSION.GetPlayerSeasonRank(arg_46_0, arg_46_1)

	return math.floor(var_46_0 / PROGRESSION.NUM_RANKS_PER_PRESTIGE_LEVEL) * PROGRESSION.NUM_RANKS_PER_PRESTIGE_LEVEL + PROGRESSION.NUM_RANKS_PER_PRESTIGE_LEVEL
end

function PROGRESSION.GetSeasonalChallengeData(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = CSV.seasonalProgressionChallenges
	local var_47_1 = {
		{
			col = var_47_0.cols.seasonNum,
			key = arg_47_1
		},
		{
			col = var_47_0.cols.seasonChallengeIndex,
			key = arg_47_2
		}
	}
	local var_47_2 = StringTable.BABCABFJEJ(var_47_0.file, var_47_1)
	local var_47_3 = SEASON.GetSeasonDataNumFromDisplayNum(arg_47_1)
	local var_47_4 = PROGRESSION.GetPlayerSeasonRank(arg_47_0, var_47_3) + 1
	local var_47_5 = CSV.ReadRowWithFileAndColumns(var_47_0.file, var_47_2, var_47_0.cols)
	local var_47_6 = tonumber(var_47_5.levelGate) or -1

	var_47_5.challengeSeasonRankMin = var_47_6
	var_47_5.isLocked = var_47_4 < var_47_6 and not CONDITIONS.IsPostSeason()
	var_47_5.progress = OnlineProgression.BHFJJDBEHG(arg_47_0, var_47_5.challengeID)

	return var_47_5
end

function PROGRESSION.GetSeasonMaxRankXP()
	return PROGRESSION.T9_SEASON_RANK_MAX * Dvar.CFHDGABACF("ONRNRMQSO")
end

function PROGRESSION.GetSeasonRankXPToNext(arg_49_0)
	return Dvar.CFHDGABACF("ONRNRMQSO")
end

function PROGRESSION.GetSeasonRankMinXP(arg_50_0, arg_50_1)
	return arg_50_0 * Dvar.CFHDGABACF("ONRNRMQSO")
end

function PROGRESSION.GetSeasonRankMaxXP(arg_51_0, arg_51_1)
	return (arg_51_0 + 1) * Dvar.CFHDGABACF("ONRNRMQSO")
end

function PROGRESSION.GetSeasonRankByXP(arg_52_0)
	arg_52_0 = tonumber(arg_52_0)

	return math.floor(arg_52_0 / Dvar.CFHDGABACF("ONRNRMQSO"))
end

function PROGRESSION.GetMaxMilitaryRankXP()
	return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.GetFile(), CSV.MPRank.cols.index, tostring(var_0_0()), CSV.MPRank.cols.maxXP))
end

function PROGRESSION.GetMilitaryRankXPToNext(arg_54_0)
	assert(tonumber(arg_54_0) >= 0 and tonumber(arg_54_0) <= var_0_0())

	return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.GetFile(), CSV.MPRank.cols.index, tostring(arg_54_0), CSV.MPRank.cols.XPToNext))
end

function PROGRESSION.GetMilitaryRankMinXP(arg_55_0)
	assert(tonumber(arg_55_0) >= 0 and tonumber(arg_55_0) <= var_0_0())

	return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.GetFile(), CSV.MPRank.cols.index, tostring(arg_55_0), CSV.MPRank.cols.minXP))
end

function PROGRESSION.GetMilitaryRankMaxXP(arg_56_0)
	assert(tonumber(arg_56_0) >= 0 and tonumber(arg_56_0) <= var_0_0())

	return tonumber(StringTable.DIFCHIGDFB(CSV.MPRank.GetFile(), CSV.MPRank.cols.index, tostring(arg_56_0), CSV.MPRank.cols.maxXP))
end

function PROGRESSION.GetMilitaryRankIcon(arg_57_0)
	assert(tonumber(arg_57_0) >= 0 and tonumber(arg_57_0) <= var_0_0())

	return StringTable.DIFCHIGDFB(CSV.MPRankIcons.GetFile(), CSV.MPRankIcons.cols.index, tostring(arg_57_0), CSV.MPRankIcons.cols.standard)
end

function PROGRESSION.GetMilitaryRankByXP(arg_58_0)
	local var_58_0 = 0
	local var_58_1 = var_0_0()

	while var_58_1 > var_58_0 + 1 do
		local var_58_2 = math.floor((var_58_1 - var_58_0) / 2) + var_58_0
		local var_58_3 = StringTable.BJJBBCJGEJ(CSV.MPRank.GetFile(), CSV.MPRank.cols.index, tostring(var_58_2))
		local var_58_4 = CSV.ReadRow(CSV.MPRank, var_58_3)
		local var_58_5 = tonumber(var_58_4.minXP)
		local var_58_6 = tonumber(var_58_4.maxXP)

		if var_58_5 <= arg_58_0 and arg_58_0 < var_58_6 then
			return var_58_2
		elseif var_58_6 <= arg_58_0 then
			var_58_0 = var_58_2
		else
			var_58_1 = var_58_2
		end
	end

	local var_58_7 = StringTable.BJJBBCJGEJ(CSV.MPRank.GetFile(), CSV.MPRank.cols.index, var_58_0)
	local var_58_8 = CSV.ReadRow(CSV.MPRank, var_58_7)

	if arg_58_0 >= tonumber(var_58_8.minXP) and arg_58_0 < tonumber(var_58_8.maxXP) then
		return var_58_0
	end

	return var_58_1
end

function PROGRESSION.GetPlayerPrestigeLevelTotal(arg_59_0, arg_59_1)
	local var_59_0 = OnlineProgression.CIBFIFIGIG(arg_59_0, arg_59_1)

	if var_59_0 > 0 then
		return var_59_0
	else
		local var_59_1 = SEASON.GetStartingSeasonDataNumForChapter(SEASON.GetChapterNumFromSeasonDataNum(arg_59_1))
		local var_59_2 = 0

		for iter_59_0 = var_59_1, arg_59_1 do
			local var_59_3 = OnlineProgression.CIBFIFIGIG(arg_59_0, iter_59_0)

			if var_59_2 < var_59_3 then
				var_59_2 = var_59_3
			end
		end

		return var_59_2
	end
end

function PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = var_0_11(arg_60_1)
	local var_60_1

	if var_60_0 ~= nil then
		var_60_1 = var_60_0
	else
		var_60_1 = PROGRESSION.GetPlayerPrestigeLevelTotal(arg_60_0, arg_60_1)
	end

	if arg_60_2 ~= nil and arg_60_2 == true then
		return var_60_1
	end

	return PROGRESSION.ValidatePrestigeLevel(var_60_1, {
		_seasonNum = arg_60_1
	})
end

function PROGRESSION.GetPlayerPrestigeLevel(arg_61_0)
	local var_61_0 = SEASON.GetCurrentSeasonDataNum()

	return PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_61_0, var_61_0)
end

function PROGRESSION.GetPlayerCareerPrestigeLevel(arg_62_0)
	local var_62_0 = SEASON.GetCurrentSeasonDataNum()
	local var_62_1 = PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_62_0, var_62_0)

	for iter_62_0 = SEASON.GetChapterNumFromSeasonDataNum(var_62_0) - 1, 1, -1 do
		local var_62_2 = iter_62_0 * SEASON.NUM_SEASONS_PER_PREMIUM_PRODUCT

		var_62_1 = var_62_1 + PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_62_0, var_62_2, true)
	end

	return var_62_1
end

function PROGRESSION.GetMaxPrestigeLevelForSeason(arg_63_0)
	local var_63_0 = SEASON.GetCurrentSeasonDisplayNum({
		seasonDataNumToUse = arg_63_0
	})
	local var_63_1 = CSV.seasonalProgressionStats
	local var_63_2 = StringTable.DIFCHIGDFB(var_63_1.file, var_63_1.cols.seasonID, var_63_0, var_63_1.cols.maxPrestigeLevel)

	return tonumber(var_63_2) or -1
end

function PROGRESSION.GetNextPrestigeLevelForSeasonIfValid(arg_64_0, arg_64_1)
	local var_64_0 = PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_64_0, arg_64_1) + 1
	local var_64_1 = SEASON.GetCurrentSeasonDisplayNum({
		seasonDataNumToUse = arg_64_1
	})
	local var_64_2 = PROGRESSION.GetMaxPrestigeLevelForSeason(arg_64_1)

	assert(var_64_2 > -1, "Warning: [GetNextPrestigeLevelForSeason] could not retrieve a valid max prestige level for prestige: " .. var_64_0 .. " in season " .. arg_64_1 .. ", max level data could be missing from CSV.seasonalProgressionStats")

	if var_64_0 <= var_64_2 then
		return var_64_0
	end

	return nil
end

function PROGRESSION.GetMaxPlayerPrestigeLevel()
	local var_65_0 = SEASON.GetCurrentSeasonDisplayNum()
	local var_65_1 = SEASON.GetSeasonDataNumFromDisplayNum(var_65_0)

	return PROGRESSION.GetMaxPrestigeLevelForSeason(var_65_1)
end

function PROGRESSION.GetNumPrestigeLevelUpsFromNumSeasonalRanks(arg_66_0)
	assert(arg_66_0, "PROGRESSION.GetNumPrestigeLevelUpsFromNumSeasonalRanks() -> numSeasonalRanks is nil and expected never to be")

	return math.floor(arg_66_0 / PROGRESSION.NUM_RANKS_PER_PRESTIGE_LEVEL)
end

function PROGRESSION.GetCanPrestigeLevelUpForSeasonalRank(arg_67_0)
	assert(arg_67_0, "PROGRESSION.GetCanPrestigeLevelUpForSeasonalRank() -> seasonalRank is nil and expected never to be")

	arg_67_0 = var_0_2(arg_67_0)

	return arg_67_0 % PROGRESSION.NUM_RANKS_PER_PRESTIGE_LEVEL == 0
end

function PROGRESSION.GetLocalPlayerCanPrestigeLevelUpForSeasonalRank(arg_68_0, arg_68_1)
	assert(arg_68_0, "PROGRESSION.GetLocalPlayerCanPrestigeLevelUpForSeasonalRank() -> controllerIndex is nil and expected never to be")
	assert(arg_68_1, "PROGRESSION.GetLocalPlayerCanPrestigeLevelUpForSeasonalRank() -> seasonalRank is nil and expected never to be")

	return PROGRESSION.GetPlayerPrestigeLevel(arg_68_0) + 1 <= PROGRESSION.GetMaxPlayerPrestigeLevel() and GetCanPrestigeLevelUpForSeasonalRank(arg_68_1)
end

function PROGRESSION.GetPrestigeIcon(arg_69_0, arg_69_1)
	arg_69_0 = PROGRESSION.ValidatePrestigeLevel(arg_69_0, {
		_seasonNum = arg_69_1
	})

	local var_69_0 = arg_69_1 ~= nil and SEASON.GetChapterNumFromSeasonDataNum(arg_69_1) or SEASON.GetCurrentChapterNum()
	local var_69_1

	if var_69_0 == SEASON.CHAPTER_NUM_T9 then
		var_69_1 = "ui_icon_t9_rank_prestige_" .. string.format("%02d", arg_69_0)
	elseif var_69_0 == SEASON.CHAPTER_NUM_VG then
		var_69_1 = "v_ui_icon_ranks_prestige_" .. string.format("%02d", arg_69_0)
	else
		DebugPrint("PROGRESSION.GetPrestigeIcon() -> Failed to find prestige icon for prestige: " .. tostring(arg_69_0)(" for seasonDataNum: ") .. tostring(arg_69_1))
	end

	return var_69_1
end

function PROGRESSION.GetAchievedPrestigeMasterForSeasonalRank(arg_70_0)
	if not arg_70_0 then
		assert(false, "PROGRESSION.GetAchievedPrestigeMasterForSeasonalRank() -> seasonalRank is nil and expected never to be")
	end

	arg_70_0 = var_0_2(arg_70_0)

	return arg_70_0 >= PROGRESSION.NUM_RANKS_PER_PRESTIGE_MASTER_LEVEL
end

function PROGRESSION.GetPrestigeMasterRibbonAwardedAtSeasonalRank(arg_71_0)
	if not arg_71_0 then
		assert(false, "PROGRESSION.GetAchievedPrestigeMasterForSeasonalRank() -> seasonalRank is nil and expected never to be")
	end

	arg_71_0 = var_0_2(arg_71_0)

	local var_71_0 = arg_71_0 / PROGRESSION.NUM_RANKS_PER_PRESTIGE_MASTER_LEVEL
	local var_71_1 = arg_71_0 % PROGRESSION.NUM_RANKS_PER_PRESTIGE_MASTER_LEVEL

	return var_71_0 > 0 and var_71_1 == 0
end

function PROGRESSION.GetPrestigeMasterRibbon(arg_72_0)
	local var_72_0 = 1

	if arg_72_0 < var_72_0 then
		arg_72_0 = var_72_0
	end

	return "ui_icon_prestige_master_" .. string.format("%02d", arg_72_0)
end

function PROGRESSION.GetPlayerPrestigeMasterLevelForSeason(arg_73_0, arg_73_1)
	if not arg_73_0 or type(arg_73_0) ~= "number" then
		assert(false, "GetPlayerPrestigeMasterLevelForSeason() : Expecting 'controllerIndex' param to be a number")
	end

	if not arg_73_1 or type(arg_73_1) ~= "number" then
		assert(false, "GetPlayerPrestigeMasterLevelForSeason() : Expecting 'seasonDataNum' param to be a number")
	end

	local var_73_0 = var_0_12(arg_73_1)
	local var_73_1

	if var_73_0 ~= nil then
		var_73_1 = var_73_0
	else
		var_73_1 = OnlineProgression.DECIEJAABC(arg_73_0, arg_73_1)
	end

	return var_73_1
end

function PROGRESSION.GetMaxPrestigeMasterLevelAtSeason(arg_74_0, arg_74_1)
	if CONDITIONS.IsSeasonRightBeforePostSeason() then
		return arg_74_1 - SEASON.SEASON_PRESTIGE_MASTER_STARTS + 2
	else
		return arg_74_1 - SEASON.SEASON_PRESTIGE_MASTER_STARTS + 1
	end
end

function PROGRESSION.GetWeaponLevel(arg_75_0, arg_75_1)
	local var_75_0 = Gunsmith.BEDFIJHAB(arg_75_0, arg_75_1)
	local var_75_1 = LOOT.IsT9Item({
		type = LOOT.itemTypes.WEAPON,
		ref = arg_75_1
	})
	local var_75_2 = LOOT.IsS4Item({
		type = LOOT.itemTypes.WEAPON,
		ref = arg_75_1
	})

	if var_75_1 or var_75_2 then
		local var_75_3 = var_75_1 and CSV.weaponRankTable.t9File or CSV.weaponRankTable.s4File
		local var_75_4 = StringTable.BFHCAIIDA(var_75_3)
		local var_75_5 = tonumber(StringTable.CBGJCDIHCE(var_75_3, var_75_4 - 1, CSV.weaponRankTable.cols.index))
		local var_75_6 = tonumber(StringTable.CBGJCDIHCE(var_75_3, var_75_4 - 1, CSV.weaponRankTable.cols.maxXP))

		if var_75_0.rank == var_75_5 and var_75_6 <= var_75_0.xp then
			return var_75_1 and 55 or 70
		end
	end

	return var_75_0.rank + 1
end

function PROGRESSION.GetMaxWeaponLevel(arg_76_0)
	local var_76_0 = CSV.gunsmithProgressionTable:GetFile(arg_76_0)
	local var_76_1 = 0

	for iter_76_0 = 0, StringTable.BFHCAIIDA(var_76_0) do
		local var_76_2 = StringTable.CBGJCDIHCE(var_76_0, iter_76_0, CSV.gunsmithProgressionTable.cols.level)

		if var_76_2 and #var_76_2 > 0 then
			local var_76_3 = tonumber(var_76_2)

			if var_76_1 < var_76_3 then
				var_76_1 = var_76_3
			end
		end
	end

	return var_76_1 + 1
end

function PROGRESSION.IsWeaponMaxLevel(arg_77_0, arg_77_1)
	return PROGRESSION.GetWeaponLevel(arg_77_0, arg_77_1) >= PROGRESSION.GetMaxWeaponLevel(arg_77_1)
end

function PROGRESSION.GetWeaponXPPercent(arg_78_0, arg_78_1)
	local var_78_0 = PROGRESSION.GetWeaponXP(arg_78_0, arg_78_1)
	local var_78_1 = PROGRESSION.GetWeaponCurrentLevelXP(arg_78_0, arg_78_1)
	local var_78_2 = PROGRESSION.GetWeaponNextLevelXP(arg_78_0, arg_78_1)

	if PROGRESSION.IsWeaponMaxLevel(arg_78_0, arg_78_1) then
		return 1
	end

	return LUI.clamp((var_78_0 - var_78_1) / (var_78_2 - var_78_1), 0, 1)
end

function PROGRESSION.GetWeaponXP(arg_79_0, arg_79_1)
	return Gunsmith.BEDFIJHAB(arg_79_0, arg_79_1).xp
end

function PROGRESSION.GetWeaponNextLevelXP(arg_80_0, arg_80_1)
	local var_80_0 = PROGRESSION.GetWeaponLevel(arg_80_0, arg_80_1)
	local var_80_1 = LOOT.IsT9Item({
		type = LOOT.itemTypes.WEAPON,
		ref = arg_80_1
	})
	local var_80_2 = LOOT.IsS4Item({
		type = LOOT.itemTypes.WEAPON,
		ref = arg_80_1
	})
	local var_80_3
	local var_80_4

	if var_80_1 or var_80_2 then
		var_80_3 = var_80_1 and CSV.weaponRankTable.t9File or CSV.weaponRankTable.s4File

		if var_80_0 == PROGRESSION.IsWeaponMaxLevel(arg_80_0, arg_80_1) then
			var_80_0 = var_80_0 - 2
		else
			var_80_0 = var_80_0 - 1
		end

		var_80_4 = CSV.weaponRankTable.cols.maxXP
	else
		var_80_3 = CSV.weaponRankTable.file
		var_80_4 = CSV.weaponRankTable.cols.minXP
	end

	return tonumber(StringTable.DIFCHIGDFB(var_80_3, CSV.weaponRankTable.cols.index, var_80_0, var_80_4))
end

function PROGRESSION.GetWeaponCurrentLevelXP(arg_81_0, arg_81_1)
	local var_81_0 = PROGRESSION.GetWeaponLevel(arg_81_0, arg_81_1)
	local var_81_1 = LOOT.IsT9Item({
		type = LOOT.itemTypes.WEAPON,
		ref = arg_81_1
	})
	local var_81_2 = LOOT.IsS4Item({
		type = LOOT.itemTypes.WEAPON,
		ref = arg_81_1
	})
	local var_81_3

	if var_81_1 then
		var_81_3 = CSV.weaponRankTable.t9File
	elseif var_81_2 then
		var_81_3 = CSV.weaponRankTable.s4File
	else
		var_81_3 = CSV.weaponRankTable.file
	end

	return tonumber(StringTable.DIFCHIGDFB(var_81_3, CSV.weaponRankTable.cols.index, var_81_0 - 1, CSV.weaponRankTable.cols.minXP))
end

function PROGRESSION.IsProgressionTracker(arg_82_0)
	return tonumber(arg_82_0) >= PROGRESSION.PROGRESSION_TRACKER_ID_START and tonumber(arg_82_0) <= PROGRESSION.PROGRESSION_TRACKER_ID_END
end

function PROGRESSION.GetLootUnlockWeaponLevel(arg_83_0, arg_83_1)
	local var_83_0 = CSV.gunsmithProgressionTable
	local var_83_1 = var_83_0:GetFile(arg_83_0)

	for iter_83_0 = 0, StringTable.BFHCAIIDA(var_83_1) do
		local var_83_2 = 0
		local var_83_3 = CSV.ReadRowWithFile(var_83_0, var_83_1, iter_83_0)
		local var_83_4 = var_83_3.level

		while var_83_3.lootID and #var_83_3.lootID > 0 do
			if arg_83_1 == var_83_3.lootID then
				return tonumber(var_83_4) + 1
			end

			var_83_2 = var_83_2 + 1

			local var_83_5 = var_83_0.colOffset * var_83_2
			local var_83_6 = {
				lootID = var_83_0.cols.lootID + var_83_5
			}

			var_83_3 = CSV.ReadRowWithFileAndColumns(var_83_1, iter_83_0, var_83_6)
		end
	end

	return 0
end

function PROGRESSION.PrestreamRankUnlocksIcons(arg_84_0, arg_84_1)
	local var_84_0 = StringTable.BFHCAIIDA(CSV.progressionItems.GetFile())
	local var_84_1 = {}
	local var_84_2
	local var_84_3
	local var_84_4
	local var_84_5
	local var_84_6
	local var_84_7

	for iter_84_0 = 0, var_84_0 - 1 do
		local var_84_8 = {}
		local var_84_9 = PROGRESSION.GetRankUnlocks(iter_84_0)

		for iter_84_1 = 1, #var_84_9 do
			if var_84_9[iter_84_1] and #var_84_9[iter_84_1] > 0 then
				table.insert(var_84_8, var_84_9[iter_84_1])
			end
		end

		for iter_84_2 = 1, #var_84_8 do
			if var_84_8[iter_84_2] then
				local var_84_10 = tonumber(var_84_8[iter_84_2])
				local var_84_11 = LOOT.GetTypeForID(var_84_10)
				local var_84_12 = LOOT.GetItemRef(var_84_11, var_84_10)
				local var_84_13 = LOOT.GetItemProgressionImage(var_84_11, var_84_12)

				if var_84_13 and #var_84_13 > 0 then
					table.insert(var_84_1, RegisterMaterial(var_84_13))
				else
					DebugPrint("PROGRESSION.PrestreamRankUnlocksIcons: Invalid lootIcon for itemID: " .. var_84_10 .. "in rank: " .. iter_84_0)
				end
			end
		end
	end

	if next(var_84_1) ~= nil then
		return
	end

	arg_84_0.streamer = LUI.UIElement.new()
	arg_84_0.streamer.id = "rank_progression_streamer"

	arg_84_0:addElement(arg_84_0.streamer)
	arg_84_0.streamer:SetupImageTableStreamer(var_84_1, false)
end

function PROGRESSION.PrestreamGamemodeIcons(arg_85_0)
	local var_85_0 = StringTable.BFHCAIIDA(CSV.gameTypesTable.file)
	local var_85_1 = {}

	for iter_85_0 = 0, var_85_0 - 1 do
		local var_85_2 = StringTable.CBGJCDIHCE(CSV.gameTypesTable.file, iter_85_0, CSV.gameTypesTable.cols.image)

		if var_85_2 and #var_85_2 > 0 then
			table.insert(var_85_1, RegisterMaterial(var_85_2))
		end
	end

	arg_85_0.streamer = LUI.UIElement.new()
	arg_85_0.streamer.id = "gamemode_icons_streamer"

	arg_85_0:addElement(arg_85_0.streamer)
	arg_85_0.streamer:SetupImageTableStreamer(var_85_1, false)
end

function PROGRESSION.GetGlobalDoubleXPEventsEndTime()
	return Dvar.CFHDGABACF("MSTMLNKSSO"), Dvar.CFHDGABACF("MOMQQONMMT"), Dvar.CFHDGABACF("OKPMLPMNM"), Dvar.CFHDGABACF("RTQLQLKKR"), Dvar.CFHDGABACF("LQSKTTTKSK")
end

function PROGRESSION.AreCustomLoadoutsUnlocked(arg_87_0)
	return PROGRESSION.IsUnlocked(arg_87_0, LOOT.itemTypes.FEATURE, LOOT.createAClassRef) or Dvar.IBEGCHEFE("NNOTOOSNQR") or Engine.BHICADFIHA()
end

function PROGRESSION.GetCurrentUpsellTitleIDNum()
	return Dvar.CFHDGABACF("current_upsell_title_progression_id_num") or PROGRESSION.Title.T9
end

function PROGRESSION.GetTokenTitle()
	return PROGRESSION.Title.S4
end

function PROGRESSION.GetSecondaryTokenTitle()
	return PROGRESSION.Title.T9
end

function PROGRESSION.GetMaxClanRank()
	local var_91_0 = StringTable.DIFCHIGDFB(CSV.ClanRank.file, 0, "maxrank", 1)

	return var_91_0 ~= nil and var_91_0 ~= "" and tonumber(var_91_0) or 1
end

function PROGRESSION.GetClanRank(arg_92_0)
	return OnlineProgression.EBACAHFJDB(arg_92_0)
end

function PROGRESSION.GetClanDisplayRank(arg_93_0)
	return PROGRESSION.GetClanRank(arg_93_0) + 1
end

function PROGRESSION.GetClanRankBigIcon(arg_94_0)
	return StringTable.DIFCHIGDFB(CSV.ClanRankBigIcons.file, CSV.ClanRankBigIcons.cols.index, arg_94_0, CSV.ClanRankBigIcons.cols.standard)
end

function PROGRESSION.GetClanRankName(arg_95_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.ClanRank.file, CSV.ClanRank.cols.index, arg_95_0, CSV.ClanRank.cols.name))
end

function PROGRESSION.GetClanXP(arg_96_0)
	return OnlineProgression.JCAABEDD(arg_96_0)
end

function PROGRESSION.GetClanRankMinXP(arg_97_0)
	local var_97_0 = StringTable.DIFCHIGDFB(CSV.ClanRank.file, CSV.ClanRank.cols.index, arg_97_0, CSV.ClanRank.cols.minXP)

	return (var_97_0 ~= nil or var_97_0 ~= "") and tonumber(var_97_0) or 0
end

function PROGRESSION.GetClanRankMaxXP(arg_98_0)
	local var_98_0 = StringTable.DIFCHIGDFB(CSV.ClanRank.file, CSV.ClanRank.cols.index, arg_98_0, CSV.ClanRank.cols.maxXP)

	return (var_98_0 ~= nil or var_98_0 ~= "") and tonumber(var_98_0) or 0
end

function PROGRESSION.GetClanRankPercentageFromXPValues(arg_99_0, arg_99_1, arg_99_2)
	local var_99_0 = 0

	if arg_99_2 == nil or arg_99_1 == nil then
		DebugPrint("PROGRESSION.GetClanRankPercentageFromXP recieved nil for min or max xp.")

		var_99_0 = 0
	elseif arg_99_2 - arg_99_1 ~= 0 then
		var_99_0 = (arg_99_0 - arg_99_1) / (arg_99_2 - arg_99_1)
	end

	return LUI.clamp(var_99_0, 0, 1)
end

function PROGRESSION.GetClanRankPercentageFromXP(arg_100_0, arg_100_1)
	local var_100_0 = PROGRESSION.GetClanRank(arg_100_1)
	local var_100_1 = PROGRESSION.GetClanRankMinXP(var_100_0)
	local var_100_2 = PROGRESSION.GetClanRankMaxXP(var_100_0)

	return PROGRESSION.GetClanRankPercentageFromXPValues(arg_100_0, var_100_1, var_100_2)
end

function PROGRESSION.GetClanRankPercentage(arg_101_0)
	local var_101_0 = PROGRESSION.GetClanXP(arg_101_0)

	return PROGRESSION.GetClanRankPercentageFromXP(var_101_0, arg_101_0)
end

function PROGRESSION.GetClanRankUnlocks(arg_102_0)
	local var_102_0 = {}

	if tonumber(arg_102_0) <= PROGRESSION.GetMaxClanRank() then
		local var_102_1 = StringTable.DIFCHIGDFB(CSV.ClanProgressionItems.file, CSV.ClanProgressionItems.cols.rank, arg_102_0, CSV.ClanProgressionItems.cols.playerItem)

		table.insert(var_102_0, var_102_1)

		local var_102_2 = StringTable.DIFCHIGDFB(CSV.ClanProgressionItems.file, CSV.ClanProgressionItems.cols.rank, arg_102_0, CSV.ClanProgressionItems.cols.clanItem)

		table.insert(var_102_0, var_102_2)
	end

	return var_102_0
end

function PROGRESSION.GetClanNextRankUnlocks(arg_103_0, arg_103_1, arg_103_2)
	local var_103_0 = {}
	local var_103_1 = PROGRESSION.GetMaxClanRank()

	if var_103_1 <= arg_103_0 then
		return var_103_0
	end

	local var_103_2 = 0
	local var_103_3 = arg_103_2 and var_103_1 or arg_103_0 + arg_103_1

	for iter_103_0 = arg_103_0, var_103_3 do
		local var_103_4 = PROGRESSION.GetClanRankUnlocks(iter_103_0)
		local var_103_5 = {}

		for iter_103_1, iter_103_2 in ipairs(var_103_4) do
			if #iter_103_2 > 0 then
				local var_103_6 = LOOT.GetTypeForID(iter_103_2)

				if var_103_6 ~= LOOT.itemTypes.INVALID and var_103_6 ~= nil then
					local var_103_7 = {
						level = iter_103_0,
						lootID = tonumber(iter_103_2),
						lootType = var_103_6,
						lootRef = LOOT.GetItemRef(var_103_6, iter_103_2)
					}

					table.insert(var_103_5, var_103_7)
				end
			end
		end

		local var_103_8 = #var_103_5

		if not arg_103_2 and arg_103_1 < var_103_2 + var_103_8 then
			return var_103_0
		end

		var_103_0[iter_103_0] = var_103_5
		var_103_2 = var_103_2 + var_103_8
	end

	return var_103_0
end
