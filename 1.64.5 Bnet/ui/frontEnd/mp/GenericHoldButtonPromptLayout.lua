module(..., package.seeall)

local var_0_0 = {
	TRACKING = 0,
	SPACING = 6
}
local var_0_1 = {
	RIGHT = "RightAligned",
	LEFT = "LeftAligned",
	CENTER_KBM = "CenterAlignedKBM"
}
local var_0_2 = {
	COMPLETE = "CompleteHold",
	PROGRESS = "ProgressHold",
	CANCEL = "CancelHold"
}

local function var_0_3(arg_1_0)
	return {
		gamepadOnly = true,
		onProgress = SOUND_SETS.storefront.selectionHoldProgess,
		onCancel = SOUND_SETS.default.deny
	}
end

local function var_0_4(arg_2_0)
	return {
		gamepadOnly = true,
		target = arg_2_0,
		onProgress = var_0_2.PROGRESS,
		onConfirm = var_0_2.COMPLETE,
		onCancel = var_0_2.CANCEL
	}
end

local function var_0_5(arg_3_0)
	local var_3_0 = 0
	local var_3_1 = _1080p * LAYOUT.GetRawTextWidth(arg_3_0.Label, var_0_0.TRACKING, arg_3_0._controllerIndex)

	if var_3_1 < LAYOUT.GetElementWidth(arg_3_0.Label) then
		var_3_0 = (math.ceil(LAYOUT.GetElementWidth(arg_3_0)) - (math.ceil(LAYOUT.GetElementWidth(arg_3_0.Radial)) + var_0_0.SPACING + var_3_1)) / 2
	end

	return var_3_0
end

local function var_0_6(arg_4_0, arg_4_1)
	arg_4_1.fill = arg_4_0.Radial.Progress

	if arg_4_1.soundFX == nil then
		arg_4_1.soundFX = var_0_3(arg_4_0)
	end

	if arg_4_1.animations == nil then
		arg_4_1.animations = var_0_4(arg_4_0)
	end

	if arg_4_1.progressColor then
		arg_4_0.Radial.Progress.ProgressColor = arg_4_1.progressColor
	end

	LUI.AddUIHoldButtonLogic(arg_4_0.Radial, arg_4_0._controllerIndex, arg_4_1)
end

local function var_0_7(arg_5_0)
	local var_5_0 = arg_5_0._isGamepadInput and arg_5_0._buttonRef and #arg_5_0._buttonRef > 0

	if var_5_0 then
		local var_5_1 = CoD.GetIconForButton(arg_5_0._buttonRef)

		arg_5_0.Icon:setText(Engine.JCBDICCAH(var_5_1))
	end

	arg_5_0.Icon:SetAlpha(var_5_0 and 1 or 0)
end

local function var_0_8(arg_6_0, arg_6_1)
	arg_6_0.Label:setText(Engine.CBBHFCGDIC(arg_6_1))
end

local function var_0_9(arg_7_0, arg_7_1)
	local var_7_0 = CoD.GetTextForButton(arg_7_0._buttonRef)

	arg_7_0.Label:setText(Engine.CBBHFCGDIC(arg_7_1, Engine.JCBDICCAH(var_7_0)))
end

local function var_0_10(arg_8_0)
	local var_8_0 = arg_8_0._isGamepadInput and arg_8_0._label or arg_8_0._labelKBM
	local var_8_1 = var_8_0 and #var_8_0 > 0

	if var_8_1 then
		if arg_8_0._isGamepadInput then
			var_0_8(arg_8_0, var_8_0)
		else
			var_0_9(arg_8_0, var_8_0)
		end
	end

	arg_8_0.Label:SetAlpha(var_8_1 and 1 or 0)
end

local function var_0_11(arg_9_0)
	local var_9_0

	if not arg_9_0._isGamepadInput and not LUI.IsLastInputGamepad(arg_9_0._controllerIndex) and arg_9_0._isCentered then
		var_9_0 = var_0_1.CENTER_KBM
	else
		var_9_0 = arg_9_0._isRightAligned and var_0_1.RIGHT or var_0_1.LEFT
	end

	ACTIONS.AnimateSequence(arg_9_0, var_9_0)
end

local function var_0_12(arg_10_0, arg_10_1)
	arg_10_0._isGamepadInput = arg_10_1

	var_0_11(arg_10_0)
	var_0_7(arg_10_0)
	var_0_10(arg_10_0)
	arg_10_0.Radial:SetAlpha(arg_10_1 and 1 or 0)
end

local function var_0_13(arg_11_0, arg_11_1)
	assert(arg_11_1, "Invalid Button Options!")

	arg_11_0._buttonRef = arg_11_1.buttonRef or nil
	arg_11_0._label = arg_11_1.label or nil
	arg_11_0._labelKBM = arg_11_1.labelKBM or nil
	arg_11_0._isRightAligned = arg_11_1.isRightAligned or false
	arg_11_0._isCentered = arg_11_1.isCentered or false
	arg_11_0.UpdateInputType = var_0_12
	arg_11_0.SetAlignment = var_0_11

	var_0_6(arg_11_0, arg_11_1)
	var_0_11(arg_11_0)
end

local function var_0_14(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0._controllerIndex = arg_12_1
	arg_12_0.SetupPrompt = var_0_13
	arg_12_0.GetCenterOffset = var_0_5
end

function GenericHoldButtonPromptLayout(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 288 * _1080p, 0, 32 * _1080p)

	var_13_0.id = "GenericHoldButtonPromptLayout"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3

	if CONDITIONS.AlwaysFalse() then
		local var_13_4 = LUI.UIImage.new()

		var_13_4.id = "DebugBackground"

		var_13_4:SetRGBFromInt(65329, 0)
		var_13_0:addElement(var_13_4)

		var_13_0.DebugBackground = var_13_4
	end

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("GenericRadialProgressBar", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "Radial"

	var_13_6.Backer:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_13_6.Progress:SetRGBFromTable(SWATCHES.WZCH3.WZCH3SeasonalEventAltColor, 0)
	var_13_6.Progress:setImage(RegisterMaterial("dpad_circle_segment"), 0)
	var_13_6.Percent:SetAlpha(0, 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16)
	var_13_0:addElement(var_13_6)

	var_13_0.Radial = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIImage.new()

	var_13_8.id = "Pulse"

	var_13_8:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_13_8:SetAlpha(0, 0)
	var_13_8:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_13_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16)
	var_13_0:addElement(var_13_8)

	var_13_0.Pulse = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIStyledText.new()

	var_13_10.id = "Icon"

	var_13_10:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_13_10:setText("", 0)
	var_13_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_10:SetWordWrap(false)
	var_13_10:SetAlignment(LUI.Alignment.Center)
	var_13_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_13_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 28, _1080p * -12, _1080p * 12)
	var_13_0:addElement(var_13_10)

	var_13_0.Icon = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIStyledText.new()

	var_13_12.id = "Label"

	var_13_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_12:setText("", 0)
	var_13_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_12:SetWordWrap(false)
	var_13_12:SetAlignment(LUI.Alignment.Left)
	var_13_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_12:SetStartupDelay(1000)
	var_13_12:SetLineHoldTime(400)
	var_13_12:SetAnimMoveTime(150)
	var_13_12:SetAnimMoveSpeed(50)
	var_13_12:SetEndDelay(1000)
	var_13_12:SetCrossfadeTime(400)
	var_13_12:SetFadeInTime(300)
	var_13_12:SetFadeOutTime(300)
	var_13_12:SetMaxVisibleLines(1)
	var_13_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 38, _1080p * 288, _1080p * -12, _1080p * 12)
	var_13_0:addElement(var_13_12)

	var_13_0.Label = var_13_12

	local function var_13_13()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_13

	local var_13_14
	local var_13_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_13_6:RegisterAnimationSequence("LeftAligned", var_13_15)

	local var_13_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("LeftAligned", var_13_16)

	local var_13_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		}
	}

	var_13_10:RegisterAnimationSequence("LeftAligned", var_13_17)

	local var_13_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_13_12:RegisterAnimationSequence("LeftAligned", var_13_18)

	local function var_13_19()
		var_13_6:AnimateSequence("LeftAligned")
		var_13_8:AnimateSequence("LeftAligned")
		var_13_10:AnimateSequence("LeftAligned")
		var_13_12:AnimateSequence("LeftAligned")
	end

	var_13_0._sequences.LeftAligned = var_13_19

	local var_13_20
	local var_13_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		}
	}

	var_13_6:RegisterAnimationSequence("RightAligned", var_13_21)

	local var_13_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("RightAligned", var_13_22)

	local var_13_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_13_10:RegisterAnimationSequence("RightAligned", var_13_23)

	local var_13_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_13_12:RegisterAnimationSequence("RightAligned", var_13_24)

	local function var_13_25()
		var_13_6:AnimateSequence("RightAligned")
		var_13_8:AnimateSequence("RightAligned")
		var_13_10:AnimateSequence("RightAligned")
		var_13_12:AnimateSequence("RightAligned")
	end

	var_13_0._sequences.RightAligned = var_13_25

	local var_13_26
	local var_13_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("CompleteHold", var_13_27)

	local var_13_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("CompleteHold", var_13_28)

	local var_13_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 83,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("CompleteHold", var_13_29)

	local function var_13_30()
		var_13_8:AnimateSequence("CompleteHold")
		var_13_10:AnimateSequence("CompleteHold")
		var_13_12:AnimateSequence("CompleteHold")
	end

	var_13_0._sequences.CompleteHold = var_13_30

	local function var_13_31()
		return
	end

	var_13_0._sequences.ProgressHold = var_13_31

	local function var_13_32()
		return
	end

	var_13_0._sequences.CancelHold = var_13_32

	local var_13_33
	local var_13_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_13_12:RegisterAnimationSequence("CenterAlignedKBM", var_13_34)

	local function var_13_35()
		var_13_12:AnimateSequence("CenterAlignedKBM")
	end

	var_13_0._sequences.CenterAlignedKBM = var_13_35

	var_0_14(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("GenericHoldButtonPromptLayout", GenericHoldButtonPromptLayout)
LockTable(_M)
