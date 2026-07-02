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

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_1, "AARProgressBar->InitRankWidget(): rankWidget with id of " .. tostring(arg_2_1.id) .. " is nil but expected never to be")

	arg_2_2 = tonumber(arg_2_2)

	if arg_2_2 then
		local var_2_0 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = arg_2_2
		})
		local var_2_1 = var_2_0._rankIcon

		if var_2_1 and var_2_1 ~= "" then
			arg_2_1.Icon:setImage(RegisterMaterial(var_2_1))
		end

		arg_2_1:UpdateRank(var_2_0._rankDisplay)
	end
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	var_0_3(arg_3_1, arg_3_0.CurrentRank, arg_3_2)
	var_0_3(arg_3_1, arg_3_0.NextRank, arg_3_3)
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = AAR.GetDebugMatchInfoPackageString(arg_4_1)
	local var_4_1 = arg_4_0.curFillRate == nil and "current fill rate is nil" or "pass-in fill rate " .. arg_4_2 .. " is smaller than current fill rate " .. arg_4_0.curFillRate
	local var_4_2 = arg_4_0:getParent()
	local var_4_3 = "------------- AAR Parade Menu Info:" .. " \n currentRank " .. tostring(currentRank) .. " \n currentXP " .. tostring(var_4_2.currentXP) .. " \n currentDisplayType " .. tostring(var_4_2.currentDisplayType) .. " \n finalXP " .. tostring(var_4_2.finalXP) .. " \n finalSeasonXP " .. tostring(var_4_2.finalSeasonXP) .. " \n earnedTotalXP " .. tostring(var_4_2.earnedTotalXP) .. " \n earnedSeasonXP " .. tostring(var_4_2.earnedSeasonXP) .. " \n earnedTypeXP " .. tostring(var_4_2.earnedTypeXP) .. " \n nextXP " .. tostring(var_4_2.currentXP + var_4_2.earnedTypeXP) .. " \n rankMinXP " .. tostring(PROGRESSION.GetMilitaryRankMinXP(var_4_2.currentRank)) .. " \n rankMaxXP " .. tostring(PROGRESSION.GetMilitaryRankMaxXP(var_4_2.currentRank))

	assert(false, var_4_1 .. "\n" .. var_4_0 .. "\n" .. var_4_3)
end

local function var_0_6(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.NextRank)
	assert(arg_5_0.CurrentRank)

	local var_5_0 = arg_5_2.type
	local var_5_1 = arg_5_2.fillRate
	local var_5_2 = arg_5_2.earnedXP
	local var_5_3 = arg_5_2.curRank
	local var_5_4 = arg_5_2.nextRank
	local var_5_5 = arg_5_2.hideIndicator
	local var_5_6 = arg_5_2.reachMaxRank
	local var_5_7 = PROGRESSION.GetPlayerProgressionData({
		_combinedRankNum = var_5_3
	})

	if var_5_6 then
		arg_5_0.NextRank.Icon:SetAlpha(0)
		arg_5_0.NextRank.NextText:setText("")
		arg_5_0.NextRank.CurrentText:setText("")
		arg_5_0.NextRank.NextText:SetAlpha(0)
		arg_5_0.NextRank.CurrentText:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_5_0.NextRank, "UpdateRank")

		if var_5_3 then
			local var_5_8 = var_5_7._rankIcon

			if var_5_8 and var_5_8 ~= "" then
				arg_5_0.CurrentRank.Icon:setImage(RegisterMaterial(var_5_8))
			end

			arg_5_0.CurrentRank.NextText:setText(var_5_7._rankDisplay)
			ACTIONS.AnimateSequence(arg_5_0.CurrentRank, "UpdateRank")
		end

		var_5_1 = 1

		arg_5_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - var_5_1, 0)
		arg_5_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - var_5_1, 0)
		arg_5_0.Playhead:SetRightAnchor(1 - var_5_1, 0)
		arg_5_0.Playhead:SetRightAnchor(1 - var_5_1, 0)

		return
	end

	local var_5_9 = LUI.clamp(var_5_1, 0, 1)

	if arg_5_0.curFillRate == nil or var_5_9 < arg_5_0.curFillRate then
		var_0_5(arg_5_0, arg_5_1, var_5_9)

		return var_0_1
	end

	local var_5_10 = (var_5_9 - arg_5_0.curFillRate) * 10 * var_0_0

	if var_5_10 == 0 then
		var_5_10 = 1
	end

	arg_5_0:InitProgressBarRank(arg_5_1, var_5_3, var_5_4)
	arg_5_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - arg_5_0.curFillRate, 0)
	arg_5_0.MatchXPProgressBar.Mask:SetRightAnchor(1 - var_5_9, var_5_10, LUI.EASING.inOutQuartic)
	arg_5_0.Playhead:SetRightAnchor(1 - arg_5_0.curFillRate, 0)
	arg_5_0.Playhead:SetRightAnchor(1 - var_5_9, var_5_10, LUI.EASING.inOutQuartic)

	if var_5_10 > 1 then
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressBar)

		local var_5_11 = 0.1
		local var_5_12 = var_5_10 - var_5_10 * 0.1

		var_5_12 = var_5_12 <= 0 and 1 or var_5_12
		arg_5_0:Wait(var_5_12).onComplete = function()
			Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.progressStop)

			if var_5_9 == 1 then
				ACTIONS.AnimateSequence(arg_5_0, "Complete")
			end
		end
	end

	arg_5_0.curFillRate = var_5_9

	return var_5_10 + var_0_1
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.ToNextRankXP:SetAlpha(arg_7_2 and 0 or 1)
end

function PostLoadFunc(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.InitProgressBar = var_0_2
	arg_8_0.InitProgressBarRank = var_0_4
	arg_8_0.UpdateFill = var_0_6
	arg_8_0.InitProgressBarWidgetVisibility = var_0_7
end

function AARProgressBar(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalNavigator.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1500 * _1080p, 0, 76 * _1080p)

	var_9_0.id = "AARProgressBar"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("AARProgressBarFrame", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "Frame"

	var_9_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -5, _1080p * 5, 0, _1080p * 60)
	var_9_0:addElement(var_9_4)

	var_9_0.Frame = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("AARProgressRank", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "CurrentRank"

	var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -84, _1080p * -20, _1080p * -24, _1080p * 100)
	var_9_0:addElement(var_9_6)

	var_9_0.CurrentRank = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("AARProgressRank", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "NextRank"

	var_9_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 20, _1080p * 84, _1080p * -24, _1080p * 100)
	var_9_0:addElement(var_9_8)

	var_9_0.NextRank = var_9_8

	local var_9_9
	local var_9_10 = MenuBuilder.BuildRegisteredType("AARProgressBarFillAlt", {
		controllerIndex = var_9_1
	})

	var_9_10.id = "MatchXPProgressBar"

	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1500, _1080p * 21, _1080p * 51)
	var_9_0:addElement(var_9_10)

	var_9_0.MatchXPProgressBar = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIText.new()

	var_9_12.id = "ToNextRankXP"

	var_9_12:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_9_12:setText("", 0)
	var_9_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_12:SetWordWrap(false)
	var_9_12:SetAlignment(LUI.Alignment.Right)
	var_9_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -200, 0, _1080p * -24, _1080p * -6)
	var_9_0:addElement(var_9_12)

	var_9_0.ToNextRankXP = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("AARPlayhead", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "Playhead"

	var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, _1080p * 76)
	var_9_0:addElement(var_9_14)

	var_9_0.Playhead = var_9_14

	local var_9_15
	local var_9_16 = LUI.UIImage.new()

	var_9_16.id = "Lightning"

	var_9_16:SetAlpha(0, 0)
	var_9_16:setImage(RegisterMaterial("aar_lightning"), 0)
	var_9_16:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_9_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -6, _1080p * 5, _1080p * 16, _1080p * 56)
	var_9_0:addElement(var_9_16)

	var_9_0.Lightning = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIImage.new()

	var_9_18.id = "EllipseGlow"

	var_9_18:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_9_18:SetAlpha(0, 0)
	var_9_18:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_9_18:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_9_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -10, _1080p * 9, _1080p * -34, _1080p * 106)
	var_9_0:addElement(var_9_18)

	var_9_0.EllipseGlow = var_9_18

	local var_9_19
	local var_9_20 = LUI.UIImage.new()

	var_9_20.id = "BarGlow"

	var_9_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_9_20:SetAlpha(0, 0)
	var_9_20:setImage(RegisterMaterial("ui_generic_glow_square"), 0)
	var_9_20:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_9_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -6, _1080p * 5, _1080p * 14, _1080p * 58)
	var_9_0:addElement(var_9_20)

	var_9_0.BarGlow = var_9_20

	local function var_9_21()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_21

	local var_9_22 = {
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

	var_9_16:RegisterAnimationSequence("Complete", var_9_22)

	local var_9_23 = {
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

	var_9_18:RegisterAnimationSequence("Complete", var_9_23)

	local var_9_24 = {
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

	var_9_20:RegisterAnimationSequence("Complete", var_9_24)

	local function var_9_25()
		var_9_16:AnimateSequence("Complete")
		var_9_18:AnimateSequence("Complete")
		var_9_20:AnimateSequence("Complete")
	end

	var_9_0._sequences.Complete = var_9_25

	PostLoadFunc(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("AARProgressBar", AARProgressBar)
LockTable(_M)
