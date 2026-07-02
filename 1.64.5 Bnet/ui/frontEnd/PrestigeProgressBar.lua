module(..., package.seeall)

local var_0_0 = 5
local var_0_1 = 50
local var_0_2 = 200
local var_0_3 = 4

local function var_0_4(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1._checkpointIncrement
	local var_1_1 = arg_1_1._useLockedStateWhenMaxxedCheckpointLevel ~= nil and true or false
	local var_1_2 = arg_1_1._useLockedStateStartingCheckpointAsMaxCheckpoint ~= nil and true or false

	assert(arg_1_1._checkpoints ~= nil)
	assert(arg_1_1._progressBars ~= nil)
	assert(var_1_0 >= 1)
	assert(arg_1_1._maxCheckpointLevel >= arg_1_1._startCheckpointLevel)
	assert(arg_1_1._seasonNum >= 1)
	assert(arg_1_1._seasonDataNum >= 0)
	assert(arg_1_1.GetCheckpointTitleTextFunc ~= nil)
	assert(arg_1_1.GetCheckpointImageNameFunc ~= nil)

	local var_1_3 = #arg_1_1._checkpoints

	assert(var_1_3 > 0)

	local var_1_4 = arg_1_1._startCheckpointLevel
	local var_1_5 = arg_1_1._maxCheckpointLevel
	local var_1_6 = PROGRESSION.GetPlayerSeasonRank(arg_1_1._controllerIndex, arg_1_1._seasonDataNum) + 1
	local var_1_7 = arg_1_1._maxCheckpointLevel - var_1_4
	local var_1_8 = var_1_7 * var_1_0
	local var_1_9 = (var_1_3 - 1) * var_1_0
	local var_1_10 = arg_1_1._forceStartCountingAtOne and var_1_4 == 0 and 1 or 0
	local var_1_11 = false
	local var_1_12 = 0

	if var_1_9 <= var_1_6 then
		if arg_1_1._shiftCheckpointsForRank then
			if var_1_6 < PROGRESSION.T9_SEASON_RANK_MAX then
				var_1_12 = math.floor(var_1_6 / var_1_0) * var_1_0
				var_1_8 = PROGRESSION.T9_SEASON_RANK_MAX - var_1_12
			else
				var_1_12 = PROGRESSION.T9_SEASON_RANK_MAX
			end
		else
			var_1_11 = true
		end
	end

	for iter_1_0, iter_1_1 in pairs(arg_1_1._progressBars) do
		local var_1_13

		if var_1_8 > 0 then
			var_1_13 = (var_1_6 - (var_1_12 + var_1_0 * iter_1_0 - var_1_0)) / var_1_0
		else
			var_1_13 = 1
		end

		iter_1_1:SetImmediateProgress(var_1_13)
	end

	for iter_1_2, iter_1_3 in pairs(arg_1_1._checkpoints) do
		local var_1_14 = var_1_10 + iter_1_2 + (var_1_4 - 1)
		local var_1_15 = var_1_8 > 0 and var_1_12 + var_1_0 * (iter_1_2 - 1) or var_1_12
		local var_1_16 = math.max(var_1_15, 1)
		local var_1_17 = var_1_16 <= var_1_6
		local var_1_18 = iter_1_2 == var_1_3
		local var_1_19 = Engine.CBBHFCGDIC("MENU/NUMBER", var_1_16)

		if var_1_18 and var_1_1 and var_1_4 == var_1_5 then
			ACTIONS.AnimateSequence(iter_1_3, "LockedMaxLevel")

			if var_1_2 then
				var_1_14 = var_1_14 - iter_1_2 + 1
			end
		elseif var_1_11 and var_1_18 then
			var_1_19 = var_1_19 .. "+"

			ACTIONS.AnimateSequence(iter_1_3, "EarnedMaxLevel")
		elseif var_1_7 == 0 and var_1_18 then
			ACTIONS.AnimateSequence(iter_1_3, "EarnedMaxLevel")
		else
			ACTIONS.AnimateSequence(iter_1_3, var_1_17 and "Earned" or "Unearned")
		end

		iter_1_3.Rank:setText(Engine.CBBHFCGDIC("MENU/NUMBER", var_1_19))

		local var_1_20 = arg_1_1.GetCheckpointTitleTextFunc(var_1_14)

		iter_1_3.Title:setText(var_1_20)

		local var_1_21 = arg_1_1.GetCheckpointImageNameFunc(var_1_14)

		iter_1_3.Icon:setImage(RegisterMaterial(var_1_21))
	end
end

local function var_0_5(arg_2_0)
	return Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_VALUE", arg_2_0))
end

local function var_0_6(arg_3_0)
	return PROGRESSION.GetPrestigeIcon(arg_3_0)
end

local function var_0_7(arg_4_0, arg_4_1)
	local var_4_0 = PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_4_0, arg_4_1)
	local var_4_1 = PROGRESSION.GetPlayerSeasonRank(arg_4_0, arg_4_1) + 1

	return var_4_0 - math.min(PROGRESSION.GetNumPrestigeLevelUpsFromNumSeasonalRanks(var_4_1), var_0_3)
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = SEASON.GetSeasonDataNumFromDisplayNum(arg_5_2)
	local var_5_1 = var_0_7(arg_5_1, var_5_0)
	local var_5_2 = math.min(PROGRESSION.GetMaxPrestigeLevelForSeason(var_5_0), var_5_1 + var_0_3)
	local var_5_3 = {
		_shiftCheckpointsForRank = false,
		_forceStartCountingAtOne = true,
		_checkpoints = arg_5_0._checkpoints,
		_progressBars = arg_5_0._progressBars,
		_controllerIndex = arg_5_1,
		_checkpointIncrement = var_0_1,
		_seasonNum = arg_5_2,
		_seasonDataNum = var_5_0,
		_startCheckpointLevel = var_5_1,
		_maxCheckpointLevel = var_5_2,
		GetCheckpointTitleTextFunc = var_0_5,
		GetCheckpointImageNameFunc = var_0_6
	}

	var_0_4(arg_5_0, var_5_3)

	local var_5_4 = SEASON.GetCurrentSeasonDisplayNum() == arg_5_2

	ACTIONS.AnimateSequence(arg_5_0, var_5_4 and "CurrentSeasonLayout" or "PastSeasonLayout")
end

local function var_0_9(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = SEASON.GetSeasonDataNumFromDisplayNum(arg_6_2)
	local var_6_1 = 0

	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_6_1) then
		var_6_1 = PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_6_1, var_6_0)
	end

	local var_6_2 = PROGRESSION.GetMaxPrestigeLevelForSeason(var_6_0)
	local var_6_3 = {
		arg_6_0._checkpoints[1],
		arg_6_0._checkpoints[#arg_6_0._checkpoints]
	}
	local var_6_4 = {
		_shiftCheckpointsForRank = true,
		_useLockedStateWhenMaxxedCheckpointLevel = true,
		_forceStartCountingAtOne = false,
		_useLockedStateStartingCheckpointAsMaxCheckpoint = true,
		_checkpoints = var_6_3,
		_progressBars = {
			arg_6_0.ProgressBarNextLevel
		},
		_controllerIndex = arg_6_1,
		_checkpointIncrement = var_0_1,
		_seasonNum = arg_6_2,
		_seasonDataNum = var_6_0,
		_startCheckpointLevel = var_6_1,
		_maxCheckpointLevel = var_6_2,
		GetCheckpointTitleTextFunc = var_0_5,
		GetCheckpointImageNameFunc = var_0_6
	}

	ACTIONS.AnimateSequence(arg_6_0, "NextLevelPrestige")
	var_0_4(arg_6_0, var_6_4)

	if var_6_1 > 0 then
		local var_6_5 = var_6_1 - var_0_7(arg_6_1, var_6_0)

		for iter_6_0, iter_6_1 in pairs(var_6_3) do
			local var_6_6 = var_6_5 + (iter_6_0 - 1) >= var_0_3 and "ShowPrestigeMaster" or "HidePrestigeMaster"

			ACTIONS.AnimateSequence(iter_6_1, var_6_6)
		end
	end

	if var_6_1 == 0 then
		ACTIONS.AnimateSequence(var_6_4._checkpoints[1], "UnearnedLevelZero")
	end
end

local function var_0_10(arg_7_0)
	return Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MASTER_ITEM_TITLE", arg_7_0))
end

local function var_0_11(arg_8_0)
	return PROGRESSION.GetPrestigeMasterRibbon(arg_8_0)
end

local function var_0_12(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = SEASON.GetSeasonDataNumFromDisplayNum(arg_9_2)
	local var_9_1 = PROGRESSION.GetPlayerSeasonRank(arg_9_1, var_9_0) + 1
	local var_9_2 = PROGRESSION.GetPlayerPrestigeMasterLevelForSeason(arg_9_1, var_9_0)
	local var_9_3 = var_9_1 < PROGRESSION.GetSeasonMaxRank() and PROGRESSION.GetMaxPrestigeMasterLevelAtSeason(arg_9_1, var_9_0) or var_9_2
	local var_9_4 = {
		_shiftCheckpointsForRank = true,
		_useLockedStateWhenMaxxedCheckpointLevel = true,
		_forceStartCountingAtOne = false,
		_useLockedStateStartingCheckpointAsMaxCheckpoint = true,
		_checkpoints = {
			arg_9_0.Checkpoint1PrestigeMaster,
			arg_9_0.Checkpoint5PrestigeMaster
		},
		_progressBars = {
			arg_9_0.ProgressBarNextLevel
		},
		_controllerIndex = arg_9_1,
		_checkpointIncrement = var_0_2,
		_seasonNum = arg_9_2,
		_seasonDataNum = var_9_0,
		_startCheckpointLevel = var_9_2,
		_maxCheckpointLevel = var_9_3,
		GetCheckpointTitleTextFunc = var_0_10,
		GetCheckpointImageNameFunc = var_0_11
	}

	var_0_4(arg_9_0, var_9_4)
	ACTIONS.AnimateSequence(arg_9_0, "NextLevelPrestigeMaster")

	if var_9_2 == 0 then
		ACTIONS.AnimateSequence(var_9_4._checkpoints[1], "UnearnedLevelZero")
	end
end

local function var_0_13(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.UpdateContentForSeason = var_0_8
	arg_10_0.GetSeasonMasterDataForSeason = GetSeasonMasterDataForSeason
	arg_10_0._checkpoints = {}

	for iter_10_0 = 1, var_0_0 do
		arg_10_0._checkpoints[iter_10_0] = arg_10_0["Checkpoint" .. tostring(iter_10_0)]
	end

	arg_10_0._progressBars = {}

	for iter_10_1 = 1, var_0_0 - 1 do
		arg_10_0._progressBars[iter_10_1] = arg_10_0["ProgressBar" .. tostring(iter_10_1)]
	end

	arg_10_0.UpdateContentForNextLevelPrestige = var_0_9
	arg_10_0.UpdateContentForNextLevelPrestigeMaster = var_0_12
end

function PrestigeProgressBar(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1091 * _1080p, 0, 112 * _1080p)

	var_11_0.id = "PrestigeProgressBar"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "ProgressBarBackground"

	var_11_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_11_4:SetAlpha(0.8, 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 1091, _1080p * -17, _1080p * -7)
	var_11_0:addElement(var_11_4)

	var_11_0.ProgressBarBackground = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "ProgressBar1"

	var_11_6:SetAlpha(0.8, 0)
	var_11_6.DialogueBackground:SetAlpha(0, 0)
	var_11_6.Fill:SetRGBFromTable(SWATCHES.CH2.CH2RankSeason, 0)
	var_11_6.Frame:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_6.Frame:SetAlpha(0.25, 0)
	var_11_6.Cap:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_6.Cap:SetAlpha(0, 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 49, _1080p * 261, _1080p * -18, _1080p * -6)
	var_11_0:addElement(var_11_6)

	var_11_0.ProgressBar1 = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "ProgressBar2"

	var_11_8:SetAlpha(0.98, 0)
	var_11_8.DialogueBackground:SetAlpha(0, 0)
	var_11_8.Fill:SetRGBFromTable(SWATCHES.CH2.CH2RankSeason, 0)
	var_11_8.Frame:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_8.Frame:SetAlpha(0.25, 0)
	var_11_8.Cap:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_8.Cap:SetAlpha(0, 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 309, _1080p * 537, _1080p * -18, _1080p * -6)
	var_11_0:addElement(var_11_8)

	var_11_0.ProgressBar2 = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "ProgressBar3"

	var_11_10:SetAlpha(0.97, 0)
	var_11_10.DialogueBackground:SetAlpha(0, 0)
	var_11_10.Fill:SetRGBFromTable(SWATCHES.CH2.CH2RankSeason, 0)
	var_11_10.Frame:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_10.Frame:SetAlpha(0.25, 0)
	var_11_10.Cap:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_10.Cap:SetAlpha(0, 0)
	var_11_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 584, _1080p * 810, _1080p * -18, _1080p * -6)
	var_11_0:addElement(var_11_10)

	var_11_0.ProgressBar3 = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "ProgressBar4"

	var_11_12.DialogueBackground:SetAlpha(0, 0)
	var_11_12.Fill:SetRGBFromTable(SWATCHES.CH2.CH2RankSeason, 0)
	var_11_12.Frame:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_12.Frame:SetAlpha(0.25, 0)
	var_11_12.Cap:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_12.Cap:SetAlpha(0, 0)
	var_11_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 858, _1080p * 1042, _1080p * -18, _1080p * -6)
	var_11_0:addElement(var_11_12)

	var_11_0.ProgressBar4 = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "ProgressBarNextLevel"

	var_11_14:SetAlpha(0, 0)
	var_11_14.DialogueBackground:SetAlpha(0, 0)
	var_11_14.Fill:SetRGBFromTable(SWATCHES.CH2.CH2RankSeason, 0)
	var_11_14.Frame:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_14.Frame:SetAlpha(0.25, 0)
	var_11_14.Cap:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_11_14.Cap:SetAlpha(0, 0)
	var_11_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 49, _1080p * 1042, _1080p * -18, _1080p * -6)
	var_11_0:addElement(var_11_14)

	var_11_0.ProgressBarNextLevel = var_11_14

	local var_11_15
	local var_11_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_11_17 = LUI.UIBorder.new(var_11_16)

	var_11_17.id = "BarBorder"

	var_11_17:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_11_17:SetAlpha(0.5, 0)
	var_11_17:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -18, _1080p * -6)
	var_11_0:addElement(var_11_17)

	var_11_0.BarBorder = var_11_17

	local var_11_18
	local var_11_19 = MenuBuilder.BuildRegisteredType("PrestigeCheckpoint", {
		controllerIndex = var_11_1
	})

	var_11_19.id = "Checkpoint1"

	var_11_19.BorderBase:SetAlpha(0, 0)
	var_11_19.Rank:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_11_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -27, _1080p * 77, _1080p * -115, 0)
	var_11_0:addElement(var_11_19)

	var_11_0.Checkpoint1 = var_11_19

	local var_11_20
	local var_11_21 = MenuBuilder.BuildRegisteredType("PrestigeCheckpoint", {
		controllerIndex = var_11_1
	})

	var_11_21.id = "Checkpoint2"

	var_11_21.BorderBase:SetAlpha(0, 0)
	var_11_21.Rank:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_11_21:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 234, _1080p * 338, _1080p * -115, 0)
	var_11_0:addElement(var_11_21)

	var_11_0.Checkpoint2 = var_11_21

	local var_11_22
	local var_11_23 = MenuBuilder.BuildRegisteredType("PrestigeCheckpoint", {
		controllerIndex = var_11_1
	})

	var_11_23.id = "Checkpoint3"

	var_11_23.BorderBase:SetAlpha(0, 0)
	var_11_23.Rank:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_11_23:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 508, _1080p * 612, _1080p * -115, 0)
	var_11_0:addElement(var_11_23)

	var_11_0.Checkpoint3 = var_11_23

	local var_11_24
	local var_11_25 = MenuBuilder.BuildRegisteredType("PrestigeCheckpoint", {
		controllerIndex = var_11_1
	})

	var_11_25.id = "Checkpoint4"

	var_11_25.BorderBase:SetAlpha(0, 0)
	var_11_25.Rank:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_11_25:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 782, _1080p * 886, _1080p * -115, 0)
	var_11_0:addElement(var_11_25)

	var_11_0.Checkpoint4 = var_11_25

	local var_11_26
	local var_11_27 = MenuBuilder.BuildRegisteredType("PrestigeCheckpoint", {
		controllerIndex = var_11_1
	})

	var_11_27.id = "Checkpoint5"

	var_11_27.BorderBase:SetAlpha(0, 0)
	var_11_27.Rank:SetRGBFromTable(SWATCHES.CH2.CH2SeasonMaster, 0)
	var_11_27.PrestigeMasterLabel:SetAlpha(0.9, 0)
	var_11_27:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1014, _1080p * 1118, _1080p * -115, 0)
	var_11_0:addElement(var_11_27)

	var_11_0.Checkpoint5 = var_11_27

	local var_11_28
	local var_11_29 = MenuBuilder.BuildRegisteredType("PrestigeMasterCheckpoint", {
		controllerIndex = var_11_1
	})

	var_11_29.id = "Checkpoint1PrestigeMaster"

	var_11_29:SetAlpha(0, 0)
	var_11_29.Rank:SetRGBFromTable(SWATCHES.CH2.CH2SeasonMaster, 0)
	var_11_29:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -13, _1080p * 63, _1080p * -117, _1080p * 8)
	var_11_0:addElement(var_11_29)

	var_11_0.Checkpoint1PrestigeMaster = var_11_29

	local var_11_30
	local var_11_31 = MenuBuilder.BuildRegisteredType("PrestigeMasterCheckpoint", {
		controllerIndex = var_11_1
	})

	var_11_31.id = "Checkpoint5PrestigeMaster"

	var_11_31:SetAlpha(0, 0)
	var_11_31.Rank:SetRGBFromTable(SWATCHES.CH2.CH2SeasonMaster, 0)
	var_11_31:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1028, _1080p * 1104, _1080p * -115, _1080p * 11)
	var_11_0:addElement(var_11_31)

	var_11_0.Checkpoint5PrestigeMaster = var_11_31

	local function var_11_32()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_32

	local var_11_33
	local var_11_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("PastSeasonLayout", var_11_34)

	local var_11_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("PastSeasonLayout", var_11_35)

	local var_11_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("PastSeasonLayout", var_11_36)

	local var_11_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("PastSeasonLayout", var_11_37)

	local var_11_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("PastSeasonLayout", var_11_38)

	local function var_11_39()
		var_11_4:AnimateSequence("PastSeasonLayout")
		var_11_6:AnimateSequence("PastSeasonLayout")
		var_11_8:AnimateSequence("PastSeasonLayout")
		var_11_10:AnimateSequence("PastSeasonLayout")
		var_11_12:AnimateSequence("PastSeasonLayout")
	end

	var_11_0._sequences.PastSeasonLayout = var_11_39

	local var_11_40
	local var_11_41 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("CurrentSeasonLayout", var_11_41)

	local var_11_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("CurrentSeasonLayout", var_11_42)

	local var_11_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("CurrentSeasonLayout", var_11_43)

	local var_11_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("CurrentSeasonLayout", var_11_44)

	local var_11_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("CurrentSeasonLayout", var_11_45)

	local function var_11_46()
		var_11_4:AnimateSequence("CurrentSeasonLayout")
		var_11_6:AnimateSequence("CurrentSeasonLayout")
		var_11_8:AnimateSequence("CurrentSeasonLayout")
		var_11_10:AnimateSequence("CurrentSeasonLayout")
		var_11_12:AnimateSequence("CurrentSeasonLayout")
	end

	var_11_0._sequences.CurrentSeasonLayout = var_11_46

	local var_11_47
	local var_11_48 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 972
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 33
		}
	}

	var_11_4:RegisterAnimationSequence("NextLevelPrestige", var_11_48)

	local var_11_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("NextLevelPrestige", var_11_49)

	local var_11_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("NextLevelPrestige", var_11_50)

	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("NextLevelPrestige", var_11_51)

	local var_11_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("NextLevelPrestige", var_11_52)

	local var_11_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 972
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		}
	}

	var_11_14:RegisterAnimationSequence("NextLevelPrestige", var_11_53)

	local var_11_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -84
		}
	}

	var_11_17:RegisterAnimationSequence("NextLevelPrestige", var_11_54)

	local var_11_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 78
		}
	}

	var_11_19:RegisterAnimationSequence("NextLevelPrestige", var_11_55)

	local var_11_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("NextLevelPrestige", var_11_56)

	local var_11_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_23:RegisterAnimationSequence("NextLevelPrestige", var_11_57)

	local var_11_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_25:RegisterAnimationSequence("NextLevelPrestige", var_11_58)

	local var_11_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 941
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1045
		}
	}

	var_11_27:RegisterAnimationSequence("NextLevelPrestige", var_11_59)

	local function var_11_60()
		var_11_4:AnimateSequence("NextLevelPrestige")
		var_11_6:AnimateSequence("NextLevelPrestige")
		var_11_8:AnimateSequence("NextLevelPrestige")
		var_11_10:AnimateSequence("NextLevelPrestige")
		var_11_12:AnimateSequence("NextLevelPrestige")
		var_11_14:AnimateSequence("NextLevelPrestige")
		var_11_17:AnimateSequence("NextLevelPrestige")
		var_11_19:AnimateSequence("NextLevelPrestige")
		var_11_21:AnimateSequence("NextLevelPrestige")
		var_11_23:AnimateSequence("NextLevelPrestige")
		var_11_25:AnimateSequence("NextLevelPrestige")
		var_11_27:AnimateSequence("NextLevelPrestige")
	end

	var_11_0._sequences.NextLevelPrestige = var_11_60

	local var_11_61
	local var_11_62 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1054
		}
	}

	var_11_4:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_62)

	local var_11_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_63)

	local var_11_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_64)

	local var_11_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_65)

	local var_11_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_66)

	local var_11_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonMaster,
			child = var_11_0.ProgressBarNextLevel.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1007
		}
	}

	var_11_14:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_67)

	local var_11_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -37
		}
	}

	var_11_17:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_68)

	local var_11_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_19:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_69)

	local var_11_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_70)

	local var_11_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_23:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_71)

	local var_11_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_25:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_72)

	local var_11_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_27:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_73)

	local var_11_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
		}
	}

	var_11_29:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_74)

	local var_11_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 991
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1067
		}
	}

	var_11_31:RegisterAnimationSequence("NextLevelPrestigeMaster", var_11_75)

	local function var_11_76()
		var_11_4:AnimateSequence("NextLevelPrestigeMaster")
		var_11_6:AnimateSequence("NextLevelPrestigeMaster")
		var_11_8:AnimateSequence("NextLevelPrestigeMaster")
		var_11_10:AnimateSequence("NextLevelPrestigeMaster")
		var_11_12:AnimateSequence("NextLevelPrestigeMaster")
		var_11_14:AnimateSequence("NextLevelPrestigeMaster")
		var_11_17:AnimateSequence("NextLevelPrestigeMaster")
		var_11_19:AnimateSequence("NextLevelPrestigeMaster")
		var_11_21:AnimateSequence("NextLevelPrestigeMaster")
		var_11_23:AnimateSequence("NextLevelPrestigeMaster")
		var_11_25:AnimateSequence("NextLevelPrestigeMaster")
		var_11_27:AnimateSequence("NextLevelPrestigeMaster")
		var_11_29:AnimateSequence("NextLevelPrestigeMaster")
		var_11_31:AnimateSequence("NextLevelPrestigeMaster")
	end

	var_11_0._sequences.NextLevelPrestigeMaster = var_11_76

	var_0_13(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("PrestigeProgressBar", PrestigeProgressBar)
LockTable(_M)
