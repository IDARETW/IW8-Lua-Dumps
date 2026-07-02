module(..., package.seeall)

local var_0_0 = 28 * _1080p
local var_0_1 = 14 * _1080p
local var_0_2 = 12 * _1080p
local var_0_3 = 8.5 * _1080p

local function var_0_4(arg_1_0)
	assert(arg_1_0.KeyString)

	if Engine.CDFDBHEFGA(arg_1_0.KeyString:getText()) then
		local var_1_0 = arg_1_0.KeyString:GetCurrentAnchorsAndPositions()

		arg_1_0.KeyString:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_1_0.left, var_1_0.right, -var_0_2, var_0_2)

		local var_1_1 = arg_1_0:GetCurrentAnchorsAndPositions()
		local var_1_2 = math.max(LAYOUT.GetTextWidth(arg_1_0.KeyString, arg_1_0._controllerIndex) + var_0_3, var_0_0)
		local var_1_3 = var_1_2 - math.abs(var_1_1.right - var_1_1.left)
		local var_1_4 = var_1_1.left - var_1_3 * var_1_1.leftAnchor
		local var_1_5 = var_1_1.right + var_1_3 * var_1_1.rightAnchor

		arg_1_0:SetAnchorsAndPosition(var_1_1.leftAnchor, var_1_1.rightAnchor, 0.5, 0.5, var_1_4, var_1_5, -var_0_1, var_0_1, 0.1)

		if arg_1_0._notifyOnResize then
			arg_1_0:dispatchEventToParent({
				name = "resized_kbm_prompt",
				controllerIndex = arg_1_0._controllerIndex,
				width = var_1_2
			})
		end
	end
end

local function var_0_5(arg_2_0, arg_2_1)
	assert(arg_2_0.KeyString)

	if arg_2_1 ~= arg_2_0.KeyString:getText() then
		if Engine.ECDECFCHJA(arg_2_1, arg_2_0._controllerIndex) then
			ACTIONS.AnimateSequence(arg_2_0, "KBMUnbound")
		else
			ACTIONS.AnimateSequence(arg_2_0, "KBMBound")
		end

		arg_2_0:ShowForeground(Engine.CDFDBHEFGA(arg_2_1))
		arg_2_0.KeyString:setText(arg_2_1)
		arg_2_0:FitWidgetToContent()
	end
end

local function var_0_6(arg_3_0, arg_3_1)
	assert(arg_3_0.ProgressBarCenter)
	assert(arg_3_0.ProgressBarLeft)
	assert(arg_3_0.ProgressBarRight)

	if arg_3_1 <= 0 then
		arg_3_0.ProgressBarCenter:SetProgress(0)
		arg_3_0.ProgressBarLeft:SetProgress(0)
		arg_3_0.ProgressBarRight:SetProgress(0)

		return
	end

	local var_3_0 = arg_3_0:getWidth() / 2
	local var_3_1 = arg_3_0:getHeight() / 2
	local var_3_2 = arg_3_1 % 0.25
	local var_3_3 = math.floor(arg_3_1 / 0.25)
	local var_3_4 = var_3_3 % 2 ~= 0 and var_3_1 or var_3_0
	local var_3_5 = var_3_3 % 2 ~= 0 and var_3_0 or var_3_1
	local var_3_6 = var_3_4 + var_3_5
	local var_3_7 = var_3_2 * (4 * var_3_6)
	local var_3_8

	if var_3_4 < var_3_7 then
		var_3_8 = 90 - math.deg(math.atan2(var_3_6 - var_3_7, var_3_4))
	else
		var_3_8 = math.deg(math.atan2(var_3_7, var_3_5))
	end

	local var_3_9 = var_3_8 / 360 + var_3_3 * 0.25

	arg_3_0.ProgressBarCenter:SetProgress(var_3_9)
	arg_3_0.ProgressBarLeft:SetProgress(var_3_9)
	arg_3_0.ProgressBarRight:SetProgress(var_3_9)
end

local function var_0_7(arg_4_0, arg_4_1)
	if arg_4_1 then
		arg_4_0.Foreground:SetAlpha(1, 0)
	else
		arg_4_0.Foreground:SetAlpha(0, 0)
	end
end

local function var_0_8(arg_5_0)
	if Engine.CDFDBHEFGA(arg_5_0.KeyString:getText()) then
		ACTIONS.AnimateSequence(arg_5_0, "PressAndHold")
	else
		ACTIONS.AnimateSequence(arg_5_0, "MousePressAndHold")
	end
end

local function var_0_9(arg_6_0)
	ACTIONS.AnimateSequence(arg_6_0, "PressOnly")
end

local function var_0_10(arg_7_0, arg_7_1)
	if Engine.ECDECFCHJA(arg_7_1:getText(), arg_7_0._controllerIndex) then
		ACTIONS.AnimateSequence(arg_7_0, "KBMUnbound")
	else
		ACTIONS.AnimateSequence(arg_7_0, "KBMBound")
	end

	arg_7_0:ShowForeground(Engine.CDFDBHEFGA(arg_7_1:getText()))
	arg_7_0:FitWidgetToContent()
end

local function var_0_11(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.SetPromptText = var_0_5
	arg_8_0.SetProgress = var_0_6
	arg_8_0.FitWidgetToContent = var_0_4
	arg_8_0.ResizeKeyString = ResizeKeyString
	arg_8_0.ShowForeground = var_0_7
	arg_8_0.SetHoldAnimation = var_0_8
	arg_8_0.SetPressAnimation = var_0_9
	arg_8_0.DirectiveInvalidated = var_0_10
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0._notifyOnResize = false

	if not (arg_8_2 and arg_8_2.finalPromptText and not Engine.CDFDBHEFGA(arg_8_2.finalPromptText)) then
		arg_8_0:Wait(1).onComplete = function()
			arg_8_0:FitWidgetToContent()
		end
	end

	arg_8_0.KeyString:SetIgnoreKeybindBacking(true)

	function arg_8_0.KeyString.onDirectiveInvalidated(arg_10_0)
		arg_8_0:DirectiveInvalidated(arg_10_0)
	end

	arg_8_0.ProgressBarCenter:SetAlpha(1, 0)
	arg_8_0.ProgressBarLeft:SetAlpha(1, 0)
	arg_8_0.ProgressBarRight:SetAlpha(1, 0)
	arg_8_0.ProgressBarCenter:SetMask(arg_8_0.MaskCenter)
	arg_8_0.ProgressBarLeft:SetMask(arg_8_0.MaskLeft)
	arg_8_0.ProgressBarRight:SetMask(arg_8_0.MaskRight)
end

function KBMButtonWithProgress(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 28 * _1080p, 0, 28 * _1080p)

	var_11_0.id = "KBMButtonWithProgress"
	var_11_0._animationSets = {}
	var_11_0._sequences = {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Background2"

	var_11_4:setImage(RegisterMaterial("ui_keybind_backing"), 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3)
	var_11_0:addElement(var_11_4)

	var_11_0.Background2 = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Background"

	var_11_6:SetRGBFromInt(0, 0)
	var_11_6:setImage(RegisterMaterial("ui_keybind_backing"), 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1)
	var_11_0:addElement(var_11_6)

	var_11_0.Background = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "MaskRight"

	var_11_8:SetZRotation(180, 0)
	var_11_8:setImage(RegisterMaterial("ui_keybind_hold_mask_side"), 0)
	var_11_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1)
	var_11_0:addElement(var_11_8)

	var_11_0.MaskRight = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "MaskLeft"

	var_11_10:setImage(RegisterMaterial("ui_keybind_hold_mask_side"), 0)
	var_11_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, 0, _1080p * -1, _1080p * 1)
	var_11_0:addElement(var_11_10)

	var_11_0.MaskLeft = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIImage.new()

	var_11_12.id = "MaskCenter"

	var_11_12:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_11_12:setImage(RegisterMaterial("ui_keybind_hold_mask_center"), 0)
	var_11_12:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -1, _1080p * 1)
	var_11_0:addElement(var_11_12)

	var_11_0.MaskCenter = var_11_12

	local var_11_13
	local var_11_14 = {
		segmentMaterial = "ui_keybind_hold_radial",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "ui_keybind_hold_mask_radial",
		segmentCount = 2,
		controllerIndex = var_11_1
	}
	local var_11_15 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_11_14)

	var_11_15.id = "ProgressBarRight"

	var_11_15:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_11_15:SetAlpha(0, 0)
	var_11_15:setImage(RegisterMaterial("ui_keybind_hold_radial"), 0)
	var_11_15:SetUMin(-7.450581e-09, 0)
	var_11_15:SetProgress(0)
	var_11_15:SetAnchorsAndPosition(0, 0.5, 0.5, 0.5, _1080p * -180, _1080p * 200, _1080p * -199, _1080p * 201)
	var_11_0:addElement(var_11_15)

	var_11_0.ProgressBarRight = var_11_15

	local var_11_16
	local var_11_17 = {
		segmentMaterial = "ui_keybind_hold_radial",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "ui_keybind_hold_mask_radial",
		segmentCount = 2,
		controllerIndex = var_11_1
	}
	local var_11_18 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_11_17)

	var_11_18.id = "ProgressBarLeft"

	var_11_18:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_11_18:SetAlpha(0, 0)
	var_11_18:setImage(RegisterMaterial("ui_keybind_hold_radial"), 0)
	var_11_18:SetUMin(-7.450581e-09, 0)
	var_11_18:SetProgress(0)
	var_11_18:SetAnchorsAndPosition(0, 0.5, 0.5, 0.5, _1080p * -180, _1080p * 200, _1080p * -199, _1080p * 201)
	var_11_0:addElement(var_11_18)

	var_11_0.ProgressBarLeft = var_11_18

	local var_11_19
	local var_11_20 = {
		segmentMaterial = "ui_keybind_hold_radial",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "ui_keybind_hold_mask_radial",
		segmentCount = 2,
		controllerIndex = var_11_1
	}
	local var_11_21 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_11_20)

	var_11_21.id = "ProgressBarCenter"

	var_11_21:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_11_21:SetAlpha(0, 0)
	var_11_21:setImage(RegisterMaterial("ui_keybind_hold_radial"), 0)
	var_11_21:SetUMin(-7.450581e-09, 0)
	var_11_21:SetProgress(0)
	var_11_21:SetAnchorsAndPosition(0, 0.5, 0.5, 0.5, _1080p * -180, _1080p * 200, _1080p * -200, _1080p * 200)
	var_11_0:addElement(var_11_21)

	var_11_0.ProgressBarCenter = var_11_21

	local var_11_22
	local var_11_23 = LUI.UIImage.new()

	var_11_23.id = "Foreground"

	var_11_23:setImage(RegisterMaterial("ui_keybind_backing"), 0)
	var_11_23:Setup9SliceImage(_1080p * 10, _1080p * 10, 0.3, 0.3)
	var_11_23:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 2, _1080p * -2)
	var_11_0:addElement(var_11_23)

	var_11_0.Foreground = var_11_23

	local var_11_24
	local var_11_25 = LUI.UIText.new()

	var_11_25.id = "KeyString"

	var_11_25:SetRGBFromTable(SWATCHES.genericButton.backgroundDisabled, 0)
	var_11_25:setText("F2", 0)
	var_11_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_25:SetWordWrap(false)
	var_11_25:SetAlignment(LUI.Alignment.Center)
	var_11_25:SetVerticalAlignment(LUI.Alignment.Center)
	var_11_25:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 5, _1080p * -5, _1080p * 5, _1080p * -5)
	var_11_0:addElement(var_11_25)

	var_11_0.KeyString = var_11_25

	local function var_11_26()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_26

	local var_11_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing")
		}
	}

	var_11_4:RegisterAnimationSequence("PressAndHold", var_11_27)

	local var_11_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_6:RegisterAnimationSequence("PressAndHold", var_11_28)

	local var_11_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_hold_mask_side")
		}
	}

	var_11_8:RegisterAnimationSequence("PressAndHold", var_11_29)

	local var_11_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_hold_mask_side")
		}
	}

	var_11_10:RegisterAnimationSequence("PressAndHold", var_11_30)

	local var_11_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_hold_mask_center")
		}
	}

	var_11_12:RegisterAnimationSequence("PressAndHold", var_11_31)

	local var_11_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_15:RegisterAnimationSequence("PressAndHold", var_11_32)

	local var_11_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("PressAndHold", var_11_33)

	local var_11_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("PressAndHold", var_11_34)

	local function var_11_35()
		var_11_4:AnimateSequence("PressAndHold")
		var_11_6:AnimateSequence("PressAndHold")
		var_11_8:AnimateSequence("PressAndHold")
		var_11_10:AnimateSequence("PressAndHold")
		var_11_12:AnimateSequence("PressAndHold")
		var_11_15:AnimateSequence("PressAndHold")
		var_11_18:AnimateSequence("PressAndHold")
		var_11_21:AnimateSequence("PressAndHold")
	end

	var_11_0._sequences.PressAndHold = var_11_35

	local var_11_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("PressOnly", var_11_36)

	local var_11_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("PressOnly", var_11_37)

	local var_11_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("PressOnly", var_11_38)

	local var_11_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("PressOnly", var_11_39)

	local var_11_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("PressOnly", var_11_40)

	local var_11_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_15:RegisterAnimationSequence("PressOnly", var_11_41)

	local var_11_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("PressOnly", var_11_42)

	local var_11_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("PressOnly", var_11_43)

	local function var_11_44()
		var_11_4:AnimateSequence("PressOnly")
		var_11_6:AnimateSequence("PressOnly")
		var_11_8:AnimateSequence("PressOnly")
		var_11_10:AnimateSequence("PressOnly")
		var_11_12:AnimateSequence("PressOnly")
		var_11_15:AnimateSequence("PressOnly")
		var_11_18:AnimateSequence("PressOnly")
		var_11_21:AnimateSequence("PressOnly")
	end

	var_11_0._sequences.PressOnly = var_11_44

	local var_11_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("hud_objective_circle_backing")
		}
	}

	var_11_4:RegisterAnimationSequence("MousePressAndHold", var_11_45)

	local var_11_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("hud_objective_circle_backing")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.disabled
		}
	}

	var_11_6:RegisterAnimationSequence("MousePressAndHold", var_11_46)

	local var_11_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_hold_mask_radial")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("MousePressAndHold", var_11_47)

	local var_11_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_hold_mask_radial")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("MousePressAndHold", var_11_48)

	local var_11_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_hold_mask_circle")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("MousePressAndHold", var_11_49)

	local var_11_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_15:RegisterAnimationSequence("MousePressAndHold", var_11_50)

	local var_11_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("MousePressAndHold", var_11_51)

	local var_11_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("MousePressAndHold", var_11_52)

	local var_11_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_23:RegisterAnimationSequence("MousePressAndHold", var_11_53)

	local var_11_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_11_25:RegisterAnimationSequence("MousePressAndHold", var_11_54)

	local function var_11_55()
		var_11_4:AnimateSequence("MousePressAndHold")
		var_11_6:AnimateSequence("MousePressAndHold")
		var_11_8:AnimateSequence("MousePressAndHold")
		var_11_10:AnimateSequence("MousePressAndHold")
		var_11_12:AnimateSequence("MousePressAndHold")
		var_11_15:AnimateSequence("MousePressAndHold")
		var_11_18:AnimateSequence("MousePressAndHold")
		var_11_21:AnimateSequence("MousePressAndHold")
		var_11_23:AnimateSequence("MousePressAndHold")
		var_11_25:AnimateSequence("MousePressAndHold")
	end

	var_11_0._sequences.MousePressAndHold = var_11_55

	local var_11_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing_unbound")
		}
	}

	var_11_4:RegisterAnimationSequence("KBMUnbound", var_11_56)

	local var_11_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing_unbound")
		}
	}

	var_11_6:RegisterAnimationSequence("KBMUnbound", var_11_57)

	local var_11_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing_unbound")
		}
	}

	var_11_23:RegisterAnimationSequence("KBMUnbound", var_11_58)

	local var_11_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_11_25:RegisterAnimationSequence("KBMUnbound", var_11_59)

	local function var_11_60()
		var_11_4:AnimateSequence("KBMUnbound")
		var_11_6:AnimateSequence("KBMUnbound")
		var_11_23:AnimateSequence("KBMUnbound")
		var_11_25:AnimateSequence("KBMUnbound")
	end

	var_11_0._sequences.KBMUnbound = var_11_60

	local var_11_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing")
		}
	}

	var_11_4:RegisterAnimationSequence("KBMBound", var_11_61)

	local var_11_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing")
		}
	}

	var_11_6:RegisterAnimationSequence("KBMBound", var_11_62)

	local var_11_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_keybind_backing")
		}
	}

	var_11_23:RegisterAnimationSequence("KBMBound", var_11_63)

	local var_11_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_11_25:RegisterAnimationSequence("KBMBound", var_11_64)

	local function var_11_65()
		var_11_4:AnimateSequence("KBMBound")
		var_11_6:AnimateSequence("KBMBound")
		var_11_23:AnimateSequence("KBMBound")
		var_11_25:AnimateSequence("KBMBound")
	end

	var_11_0._sequences.KBMBound = var_11_65

	var_0_11(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("KBMButtonWithProgress", KBMButtonWithProgress)
LockTable(_M)
