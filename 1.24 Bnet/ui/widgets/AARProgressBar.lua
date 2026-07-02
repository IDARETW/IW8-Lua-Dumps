module(..., package.seeall)

local var_0_0 = 100
local var_0_1 = 240

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.NextRank)
	assert(arg_1_0.CurrentRank)

	arg_1_2 = LUI.clamp(arg_1_2, 0, 1)

	arg_1_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - arg_1_2, 0)
	arg_1_0.Playhead:SetRightAnchor(1 - arg_1_2, 0)

	arg_1_0.curFillRate = arg_1_2
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(arg_2_0.NextRank)
	assert(arg_2_0.CurrentRank)

	local var_2_0 = PROGRESSION.GetRankDisplay(arg_2_2)
	local var_2_1 = PROGRESSION.GetRankDisplay(arg_2_3)

	if arg_2_3 then
		local var_2_2 = PROGRESSION.GetRankIcon(arg_2_3)

		if var_2_2 and #var_2_2 > 0 then
			arg_2_0.NextRank.Icon:setImage(RegisterMaterial(var_2_2))
		end

		arg_2_0.NextRank:UpdateRank(var_2_1)
	end

	if arg_2_2 then
		local var_2_3 = PROGRESSION.GetRankIcon(arg_2_2)

		if var_2_3 and #var_2_3 > 0 then
			arg_2_0.CurrentRank.Icon:setImage(RegisterMaterial(var_2_3))
		end

		arg_2_0.CurrentRank:UpdateRank(var_2_0)
	end
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = AAR.GetDebugMatchInfoPackageString(arg_3_1)
	local var_3_1 = arg_3_0.curFillRate == nil and "current fill rate is nil" or "pass-in fill rate " .. arg_3_2 .. " is smaller than current fill rate " .. arg_3_0.curFillRate
	local var_3_2 = arg_3_0:getParent()
	local var_3_3 = "------------- AAR Parade Menu Info:" .. " \n currentRank " .. tostring(var_3_2.currentRank) .. " \n currentXP " .. tostring(var_3_2.currentXP) .. " \n currentRank " .. tostring(var_3_2.currentRank) .. " \n currentDisplayType " .. tostring(var_3_2.currentDisplayType) .. " \n finalXP " .. tostring(var_3_2.finalXP) .. " \n finalSeasonXP " .. tostring(var_3_2.finalSeasonXP) .. " \n earnedTotalXP " .. tostring(var_3_2.earnedTotalXP) .. " \n earnedSeasonXP " .. tostring(var_3_2.earnedSeasonXP) .. " \n earnedTypeXP " .. tostring(var_3_2.earnedTypeXP) .. " \n nextXP " .. tostring(var_3_2.currentXP + var_3_2.earnedTypeXP) .. " \n rankMinXP " .. tostring(PROGRESSION.GetRankMinXP(var_3_2.currentRank)) .. " \n rankMaxXP " .. tostring(PROGRESSION.GetRankMaxXP(var_3_2.currentRank))

	assert(false, var_3_1 .. "\n" .. var_3_0 .. "\n" .. var_3_3)
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.NextRank)
	assert(arg_4_0.CurrentRank)

	local var_4_0 = arg_4_2.type
	local var_4_1 = arg_4_2.fillRate
	local var_4_2 = arg_4_2.earnedXP
	local var_4_3 = arg_4_2.curRank
	local var_4_4 = arg_4_2.nextRank
	local var_4_5 = arg_4_2.hideIndicator
	local var_4_6 = arg_4_2.reachMaxRank
	local var_4_7 = PROGRESSION.GetRankDisplay(var_4_3)
	local var_4_8 = PROGRESSION.GetRankDisplay(var_4_4)

	if var_4_6 then
		arg_4_0.NextRank.Icon:SetAlpha(0)
		arg_4_0.NextRank.NextText:setText("")
		arg_4_0.NextRank.CurrentText:setText("")
		arg_4_0.NextRank.NextText:SetAlpha(0)
		arg_4_0.NextRank.CurrentText:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_4_0.NextRank, "UpdateRank")

		if var_4_3 then
			local var_4_9 = PROGRESSION.GetRankIcon(var_4_3)

			if var_4_9 and #var_4_9 > 0 then
				arg_4_0.CurrentRank.Icon:setImage(RegisterMaterial(var_4_9))
			end

			arg_4_0.CurrentRank.NextText:setText(var_4_7)
			ACTIONS.AnimateSequence(arg_4_0.CurrentRank, "UpdateRank")
		end

		var_4_1 = 1

		arg_4_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - var_4_1, 0)
		arg_4_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - var_4_1, 0)
		arg_4_0.Playhead:SetRightAnchor(1 - var_4_1, 0)
		arg_4_0.Playhead:SetRightAnchor(1 - var_4_1, 0)

		return
	end

	local var_4_10 = LUI.clamp(var_4_1, 0, 1)

	if arg_4_0.curFillRate == nil or var_4_10 < arg_4_0.curFillRate then
		var_0_4(arg_4_0, arg_4_1, var_4_10)

		return var_0_1
	end

	local var_4_11 = (var_4_10 - arg_4_0.curFillRate) * 10 * var_0_0

	if var_4_11 == 0 then
		var_4_11 = 1
	end

	if var_4_4 then
		local var_4_12 = PROGRESSION.GetRankIcon(var_4_4)

		if var_4_12 and #var_4_12 > 0 then
			arg_4_0.NextRank.Icon:setImage(RegisterMaterial(var_4_12))
		end

		arg_4_0.NextRank:UpdateRank(var_4_8)
	end

	if var_4_3 then
		local var_4_13 = PROGRESSION.GetRankIcon(var_4_3)

		if var_4_13 and #var_4_13 > 0 then
			arg_4_0.CurrentRank.Icon:setImage(RegisterMaterial(var_4_13))
		end

		arg_4_0.CurrentRank:UpdateRank(var_4_7)
	end

	arg_4_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - arg_4_0.curFillRate, 0)
	arg_4_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - var_4_10, var_4_11, LUI.EASING.inOutQuartic)
	arg_4_0.Playhead:SetRightAnchor(1 - arg_4_0.curFillRate, 0)
	arg_4_0.Playhead:SetRightAnchor(1 - var_4_10, var_4_11, LUI.EASING.inOutQuartic)

	if var_4_11 > 1 then
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressBar)

		local var_4_14 = 0.1

		arg_4_0:Wait(var_4_11 - var_4_11 * 0.1).onComplete = function()
			Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressStop)

			if var_4_10 == 1 then
				ACTIONS.AnimateSequence(arg_4_0, "Complete")
			end
		end
	end

	arg_4_0.curFillRate = var_4_10

	return var_4_11 + var_0_1
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.ToNextRankXP:SetAlpha(arg_6_2 and 0 or 1)
end

function PostLoadFunc(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.InitProgressBar = var_0_2
	arg_7_0.InitProgressBarRank = var_0_3
	arg_7_0.UpdateFill = var_0_5
	arg_7_0.InitProgressBarWidgetVisibility = var_0_6
end

function AARProgressBar(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1500 * _1080p, 0, 76 * _1080p)

	var_8_0.id = "AARProgressBar"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("AARProgressBarFrame", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "Frame"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -5, _1080p * 5, 0, _1080p * 60)
	var_8_0:addElement(var_8_4)

	var_8_0.Frame = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("AARProgressRank", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "CurrentRank"

	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -84, _1080p * -20, _1080p * -24, _1080p * 100)
	var_8_0:addElement(var_8_6)

	var_8_0.CurrentRank = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("AARProgressRank", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "NextRank"

	var_8_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 20, _1080p * 84, _1080p * -24, _1080p * 100)
	var_8_0:addElement(var_8_8)

	var_8_0.NextRank = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("AARProgressBarFillAlt", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "MatchXPProgressBar"

	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1500, _1080p * 21, _1080p * 51)
	var_8_0:addElement(var_8_10)

	var_8_0.MatchXPProgressBar = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "ToNextRankXP"

	var_8_12:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetWordWrap(false)
	var_8_12:SetAlignment(LUI.Alignment.Right)
	var_8_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -200, 0, _1080p * -24, _1080p * -6)
	var_8_0:addElement(var_8_12)

	var_8_0.ToNextRankXP = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("AARPlayhead", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "Playhead"

	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, _1080p * 76)
	var_8_0:addElement(var_8_14)

	var_8_0.Playhead = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIImage.new()

	var_8_16.id = "Lightning"

	var_8_16:SetAlpha(0, 0)
	var_8_16:setImage(RegisterMaterial("aar_lightning"), 0)
	var_8_16:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_8_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -6, _1080p * 5, _1080p * 16, _1080p * 56)
	var_8_0:addElement(var_8_16)

	var_8_0.Lightning = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIImage.new()

	var_8_18.id = "EllipseGlow"

	var_8_18:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_18:SetAlpha(0, 0)
	var_8_18:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_8_18:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_8_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -10, _1080p * 9, _1080p * -34, _1080p * 106)
	var_8_0:addElement(var_8_18)

	var_8_0.EllipseGlow = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIImage.new()

	var_8_20.id = "BarGlow"

	var_8_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_20:SetAlpha(0, 0)
	var_8_20:setImage(RegisterMaterial("ui_generic_glow_square"), 0)
	var_8_20:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_8_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -6, _1080p * 5, _1080p * 14, _1080p * 58)
	var_8_0:addElement(var_8_20)

	var_8_0.BarGlow = var_8_20

	local function var_8_21()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_21

	local var_8_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 17,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 17,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 17,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			duration = 67,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -270,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 33,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		}
	}

	var_8_16:RegisterAnimationSequence("Complete", var_8_22)

	local var_8_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		},
		{
			duration = 17,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 17,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 17,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -54,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 17,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0.5,
			duration = 33,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 33,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 33,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		},
		{
			value = 0,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 67,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -80,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 67,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 152,
			easing = LUI.EASING.inCubic
		}
	}

	var_8_18:RegisterAnimationSequence("Complete", var_8_23)

	local var_8_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -15
		},
		{
			value = 0.75,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -355
		},
		{
			value = 0,
			duration = 183,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 183,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1039,
			easing = LUI.EASING.outCubic
		}
	}

	var_8_20:RegisterAnimationSequence("Complete", var_8_24)

	local function var_8_25()
		var_8_16:AnimateSequence("Complete")
		var_8_18:AnimateSequence("Complete")
		var_8_20:AnimateSequence("Complete")
	end

	var_8_0._sequences.Complete = var_8_25

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("AARProgressBar", AARProgressBar)
LockTable(_M)
