module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = PROGRESSION.GetPlayerRank(arg_1_1, arg_1_2)
	local var_1_1 = PROGRESSION.GetRankBigIcon(var_1_0, 0, arg_1_2)
	local var_1_2 = PROGRESSION.GetRankName(var_1_0, arg_1_2)

	arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_1))
	arg_1_0.RankName:setText(var_1_2)
	arg_1_0.RankNum:setText(PROGRESSION.GetRankDisplay(var_1_0))
	ACTIONS.AnimateSequence(arg_1_0, PROGRESSION.IsElderRank(tonumber(var_1_0)) and "ElderRank" or "StandardRank")

	if PROGRESSION.GetPlayerSeasonXP(arg_1_1, seasonToUse) > 0 then
		arg_1_0.Progress:SetProgressInC(tonumber(PROGRESSION.GetSeasonRankPercentage(arg_1_1, arg_1_2)), 0, 0)
	else
		arg_1_0.Progress:SetProgressInC(tonumber(PROGRESSION.GetRankPercentage(arg_1_1)), 0, 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.RankNum)
	assert(arg_2_0.RankName)
	assert(arg_2_0.RankIcon)

	arg_2_0.UpdateRankDisplay = var_0_0

	var_0_0(arg_2_0, arg_2_1, SEASON.GetCurrentSeason())
end

function RadialRankProgressBar(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 240 * _1080p, 0, 240 * _1080p)

	var_3_0.id = "RadialRankProgressBar"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.barEmpty, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_4:setImage(RegisterMaterial("ui_prog_radial_whole"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = {
		segmentMaterial = "challenges_progress_circle_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "dpad_circle_mask",
		segmentCount = 2,
		controllerIndex = var_3_1
	}
	local var_3_7 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_3_6)

	var_3_7.id = "Progress"

	var_3_7:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_7:setImage(RegisterMaterial("ui_prog_radial_segment"), 0)
	var_3_7:SetProgress(0.9)
	var_3_0:addElement(var_3_7)

	var_3_0.Progress = var_3_7

	local var_3_8
	local var_3_9 = LUI.UIImage.new()

	var_3_9.id = "RankIcon"

	var_3_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -51, _1080p * 51, _1080p * 29, _1080p * 132)
	var_3_0:addElement(var_3_9)

	var_3_0.RankIcon = var_3_9

	local var_3_10
	local var_3_11 = LUI.UIText.new()

	var_3_11.id = "RankName"

	var_3_11:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_11:setText("", 0)
	var_3_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_11:SetAlignment(LUI.Alignment.Center)
	var_3_11:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 25, _1080p * -25, _1080p * 17, _1080p * 41)
	var_3_0:addElement(var_3_11)

	var_3_0.RankName = var_3_11

	local var_3_12
	local var_3_13 = LUI.UIText.new()

	var_3_13.id = "RankNum"

	var_3_13:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_13:setText("999", 0)
	var_3_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_13:SetAlignment(LUI.Alignment.Center)
	var_3_13:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 83, _1080p * -83, _1080p * -52, _1080p * -24)
	var_3_0:addElement(var_3_13)

	var_3_0.RankNum = var_3_13

	local function var_3_14()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_14

	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_3_13:RegisterAnimationSequence("StandardRank", var_3_15)

	local function var_3_16()
		var_3_13:AnimateSequence("StandardRank")
	end

	var_3_0._sequences.StandardRank = var_3_16

	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_3_13:RegisterAnimationSequence("ElderRank", var_3_17)

	local function var_3_18()
		var_3_13:AnimateSequence("ElderRank")
	end

	var_3_0._sequences.ElderRank = var_3_18

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RadialRankProgressBar", RadialRankProgressBar)
LockTable(_M)
