module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.MoreInfoButton then
		if arg_1_0:IsDisabled() or LUI.IsLastInputGamepad(arg_1_1) then
			arg_1_0.MoreInfoButton:SetAlpha(0)
		else
			arg_1_0.MoreInfoButton:SetAlpha(1)
		end
	end
end

local function var_0_1(arg_2_0)
	assert(arg_2_0.EditBox)
	ACTIONS.AnimateSequence(arg_2_0.EditBox, "NoLeftLine")
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.ArrowLeft:SetHandleMouse(false)
	arg_3_0.ArrowRight:SetHandleMouse(false)

	local function var_3_0(arg_4_0, arg_4_1)
		if arg_4_0._lastState ~= arg_4_1 then
			arg_4_0._lastState = arg_4_1

			ACTIONS.AnimateSequence(arg_4_0, arg_4_1)
		end
	end

	arg_3_0:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if LUI.IsLastInputKeyboardMouse(arg_5_1.controller) then
			return true
		end
	end)
	arg_3_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		var_3_0(arg_6_0, "ButtonOver")
	end)
	arg_3_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		var_3_0(arg_7_0, "ButtonUp")

		if arg_7_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_7_0.MoreInfoButton, "ButtonUp")
		end
	end)
	arg_3_0:addEventHandler("active", function(arg_8_0, arg_8_1)
		var_3_0(arg_8_0, "Active")
	end)
	arg_3_0:addEventHandler("enable", function(arg_9_0, arg_9_1)
		var_0_0(arg_9_0, arg_3_1)
	end)
	arg_3_0:addEventHandler("disable", function(arg_10_0, arg_10_1)
		var_0_0(arg_10_0, arg_3_1)
	end)
	arg_3_0:addEventHandler("button_over_active", function(arg_11_0, arg_11_1)
		var_3_0(arg_11_0, "ButtonOverActive")

		if arg_11_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_11_0.MoreInfoButton, "ButtonOver")
		end
	end)
	arg_3_0:addEventHandler("button_active", function(arg_12_0, arg_12_1)
		var_3_0(arg_12_0, "ButtonUpActive")

		if arg_12_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_12_0.MoreInfoButton, "ButtonUp")
		end
	end)
	arg_3_0:addEventHandler("disable_active", function(arg_13_0, arg_13_1)
		var_3_0(arg_13_0, "DisabledActive")
	end)
	arg_3_0:addEventHandler("button_over_disable_active", function(arg_14_0, arg_14_1)
		var_3_0(arg_14_0, "ButtonOverDisabledActive")
	end)
	arg_3_0:addEventHandler("button_disable_active", function(arg_15_0, arg_15_1)
		var_3_0(arg_15_0, "ButtonUpDisabledActive")
	end)
	arg_3_0:addEventHandler("disabled", function(arg_16_0, arg_16_1)
		var_3_0(arg_16_0, "Disabled")
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_17_0, arg_17_1)
		var_3_0(arg_17_0, "ButtonOverDisabled")
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_18_0, arg_18_1)
		var_3_0(arg_18_0, "ButtonUpDisabled")
	end)

	local function var_3_1(arg_19_0, arg_19_1)
		if LUI.IsLastInputGamepad(arg_19_1.controllerIndex) then
			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_19_0, "GamepadAR")
			else
				ACTIONS.AnimateSequence(arg_19_0, "Gamepad")
			end
		elseif IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_19_0, "AR")
		else
			ACTIONS.AnimateSequence(arg_19_0, "KBM")
		end
	end

	arg_3_0:addEventHandler("gamepad_button", function(arg_20_0, arg_20_1)
		if not arg_20_1.down then
			if arg_20_1.button == "right" then
				ACTIONS.AnimateSequence(arg_20_0.ArrowRight, "Up")
			elseif arg_20_1.button == "left" then
				ACTIONS.AnimateSequence(arg_20_0.ArrowLeft, "Up")
			end
		elseif arg_20_1.button == "right" then
			ACTIONS.AnimateSequence(arg_20_0.ArrowRight, "Down")
		elseif arg_20_1.button == "left" then
			ACTIONS.AnimateSequence(arg_20_0.ArrowLeft, "Down")
		end
	end)

	if arg_3_0.MoreInfoButton then
		arg_3_0.MoreInfoButton:addEventHandler("leftmouseup", function(arg_21_0, arg_21_1)
			if arg_21_1.inside and arg_21_0:isInFocus() and not arg_3_0:IsDisabled() then
				arg_3_0:customPreviewButtonAction(arg_21_1.controller)
			end
		end)
		arg_3_0:addEventHandler("update_input_type", function(arg_22_0, arg_22_1)
			var_0_0(arg_22_0, arg_22_1.controllerIndex)
		end)
	end

	arg_3_0:addAndCallEventHandler("update_input_type", var_3_1, {
		controllerIndex = arg_3_1
	})

	arg_3_0.HideLeftLine = var_0_1
end

local function var_0_3(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0._needMoreInfoInnerButton = arg_23_2.needMoreInfoInnerButton
end

function GenericSliderWithEditBox(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIButton.new()

	var_24_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_24_0.id = "GenericSliderWithEditBox"
	var_24_0._animationSets = var_24_0._animationSets or {}
	var_24_0._sequences = var_24_0._sequences or {}

	local var_24_1 = arg_24_1 and arg_24_1.controllerIndex

	if not var_24_1 and not Engine.DDJFBBJAIG() then
		var_24_1 = var_24_0:getRootController()
	end

	assert(var_24_1)
	var_0_3(var_24_0, var_24_1, arg_24_1)

	local var_24_2 = var_24_0
	local var_24_3
	local var_24_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_24_1
	})

	var_24_4.id = "GenericOptionButtonBase"

	var_24_4.Title:SetLeft(_1080p * 20, 0)
	var_24_4.Title:SetRight(_1080p * -375, 0)
	var_24_4.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_24_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_24_0:addElement(var_24_4)

	var_24_0.GenericOptionButtonBase = var_24_4

	local var_24_5
	local var_24_6 = MenuBuilder.BuildRegisteredType("GenericInnerButton", {
		controllerIndex = var_24_1
	})

	var_24_6.id = "EditBox"

	var_24_6.Text:SetLeft(_1080p * 10, 0)
	var_24_6.Text:SetRight(_1080p * -4, 0)
	var_24_6.Text:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_24_6.Text:SetAlignment(LUI.Alignment.Left)
	var_24_6.Pip:SetAlpha(0, 0)
	var_24_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -357, _1080p * -275, 0, 0)
	var_24_0:addElement(var_24_6)

	var_24_0.EditBox = var_24_6

	local var_24_7
	local var_24_8 = MenuBuilder.BuildRegisteredType("GenericSliderBar", {
		controllerIndex = var_24_1
	})

	var_24_8.id = "GenericFillBar"

	var_24_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -269, _1080p * -82, 0, 0)
	var_24_0:addElement(var_24_8)

	var_24_0.GenericFillBar = var_24_8

	local var_24_9
	local var_24_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_24_11 = LUI.UIBorder.new(var_24_10)

	var_24_11.id = "ArrowLeftDefault"

	var_24_11:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_24_11:SetAlpha(0.7, 0)
	var_24_11:SetZRotation(-45, 0)
	var_24_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_24_11:SetBorderThicknessTop(_1080p * 0, 0)
	var_24_11:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -57, _1080p * -47, _1080p * -5, _1080p * 5)
	var_24_0:addElement(var_24_11)

	var_24_0.ArrowLeftDefault = var_24_11

	local var_24_12
	local var_24_13 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_24_14 = LUI.UIBorder.new(var_24_13)

	var_24_14.id = "ArrowRightDefault"

	var_24_14:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_24_14:SetAlpha(0.7, 0)
	var_24_14:SetZRotation(-45, 0)
	var_24_14:SetBorderThicknessLeft(_1080p * 0, 0)
	var_24_14:SetBorderThicknessBottom(_1080p * 0, 0)
	var_24_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -32, _1080p * -22, _1080p * -5, _1080p * 5)
	var_24_0:addElement(var_24_14)

	var_24_0.ArrowRightDefault = var_24_14

	local var_24_15
	local var_24_16 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_24_1
	})

	var_24_16.id = "ArrowRight"

	var_24_16.Icon:SetZRotation(180, 0)
	var_24_16.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_24_16:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -38, _1080p * -10, 0, 0)
	var_24_0:addElement(var_24_16)

	var_24_0.ArrowRight = var_24_16

	local var_24_17
	local var_24_18 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_24_1
	})

	var_24_18.id = "ArrowLeft"

	var_24_18.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_24_18:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -69, _1080p * -41, 0, 0)
	var_24_0:addElement(var_24_18)

	var_24_0.ArrowLeft = var_24_18

	local var_24_19

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_24_0) then
		var_24_19 = MenuBuilder.BuildRegisteredType("MoreInfoInnerButton", {
			controllerIndex = var_24_1
		})
		var_24_19.id = "MoreInfoButton"

		var_24_19:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -405, _1080p * -369, 0, 0)
		var_24_0:addElement(var_24_19)

		var_24_0.MoreInfoButton = var_24_19
	end

	local var_24_20
	local var_24_21 = LUI.UIImage.new()

	var_24_21.id = "Lock"

	var_24_21:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_24_21:SetAlpha(0, 0)
	var_24_21:setImage(RegisterMaterial("icon_lock"), 0)
	var_24_21:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -52, _1080p * -26, _1080p * -13, _1080p * 13)
	var_24_0:addElement(var_24_21)

	var_24_0.Lock = var_24_21

	local var_24_22
	local var_24_23 = LUI.UIImage.new()

	var_24_23.id = "LeftLine"

	var_24_23:SetAlpha(0.2, 0)
	var_24_23:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -356, _1080p * -10, _1080p * 10)
	var_24_0:addElement(var_24_23)

	var_24_0.LeftLine = var_24_23

	local var_24_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_21:RegisterAnimationSequence("DefaultSequence", var_24_24)

	local function var_24_25()
		var_24_21:AnimateSequence("DefaultSequence")
	end

	var_24_0._sequences.DefaultSequence = var_24_25

	local var_24_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -27
		}
	}

	var_24_21:RegisterAnimationSequence("Locked", var_24_26)

	local function var_24_27()
		var_24_21:AnimateSequence("Locked")
	end

	var_24_0._sequences.Locked = var_24_27

	local function var_24_28()
		return
	end

	var_24_0._sequences.NewNotification = var_24_28

	local var_24_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("AR", var_24_29)

	local var_24_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left,
			child = var_24_0.EditBox.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			child = var_24_0.EditBox.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10,
			child = var_24_0.EditBox.Text
		}
	}

	var_24_6:RegisterAnimationSequence("AR", var_24_30)

	local var_24_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 284
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_24_8:RegisterAnimationSequence("AR", var_24_31)

	local var_24_32 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_11:RegisterAnimationSequence("AR", var_24_32)

	local var_24_33 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("AR", var_24_33)

	local var_24_34 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("AR", var_24_34)

	local var_24_35 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("AR", var_24_35)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_24_0) then
		local var_24_36 = {
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
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 366
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 402
			}
		}

		var_24_19:RegisterAnimationSequence("AR", var_24_36)
	end

	local var_24_37 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 36
		}
	}

	var_24_21:RegisterAnimationSequence("AR", var_24_37)

	local var_24_38 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 357
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 356
		}
	}

	var_24_23:RegisterAnimationSequence("AR", var_24_38)

	local function var_24_39()
		var_24_4:AnimateSequence("AR")
		var_24_6:AnimateSequence("AR")
		var_24_8:AnimateSequence("AR")
		var_24_11:AnimateSequence("AR")
		var_24_14:AnimateSequence("AR")
		var_24_16:AnimateSequence("AR")
		var_24_18:AnimateSequence("AR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_24_0) then
			var_24_19:AnimateSequence("AR")
		end

		var_24_21:AnimateSequence("AR")
		var_24_23:AnimateSequence("AR")
	end

	var_24_0._sequences.AR = var_24_39

	local function var_24_40()
		return
	end

	var_24_0._sequences.ButtonOver = var_24_40

	local var_24_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Pixel_Grid_Contrast
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_24_4:RegisterAnimationSequence("ButtonUp", var_24_41)

	local var_24_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_6:RegisterAnimationSequence("ButtonUp", var_24_42)

	local var_24_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_8:RegisterAnimationSequence("ButtonUp", var_24_43)

	local var_24_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_21:RegisterAnimationSequence("ButtonUp", var_24_44)

	local function var_24_45()
		var_24_4:AnimateSequence("ButtonUp")
		var_24_6:AnimateSequence("ButtonUp")
		var_24_8:AnimateSequence("ButtonUp")
		var_24_21:AnimateSequence("ButtonUp")
	end

	var_24_0._sequences.ButtonUp = var_24_45

	local var_24_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_21:RegisterAnimationSequence("Active", var_24_46)

	local function var_24_47()
		var_24_21:AnimateSequence("Active")
	end

	var_24_0._sequences.Active = var_24_47

	local var_24_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_21:RegisterAnimationSequence("ButtonOverActive", var_24_48)

	local function var_24_49()
		var_24_21:AnimateSequence("ButtonOverActive")
	end

	var_24_0._sequences.ButtonOverActive = var_24_49

	local var_24_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_21:RegisterAnimationSequence("ButtonUpActive", var_24_50)

	local function var_24_51()
		var_24_21:AnimateSequence("ButtonUpActive")
	end

	var_24_0._sequences.ButtonUpActive = var_24_51

	local var_24_52 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_6:RegisterAnimationSequence("Disabled", var_24_52)

	local var_24_53 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_8:RegisterAnimationSequence("Disabled", var_24_53)

	local var_24_54 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_24_21:RegisterAnimationSequence("Disabled", var_24_54)

	local function var_24_55()
		var_24_6:AnimateSequence("Disabled")
		var_24_8:AnimateSequence("Disabled")
		var_24_21:AnimateSequence("Disabled")
	end

	var_24_0._sequences.Disabled = var_24_55

	local var_24_56 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -359
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -391
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_24_21:RegisterAnimationSequence("ButtonOverDisabled", var_24_56)

	local function var_24_57()
		var_24_21:AnimateSequence("ButtonOverDisabled")
	end

	var_24_0._sequences.ButtonOverDisabled = var_24_57

	local var_24_58 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_6:RegisterAnimationSequence("ButtonUpDisabled", var_24_58)

	local var_24_59 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_8:RegisterAnimationSequence("ButtonUpDisabled", var_24_59)

	local var_24_60 = {
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_24_21:RegisterAnimationSequence("ButtonUpDisabled", var_24_60)

	local function var_24_61()
		var_24_6:AnimateSequence("ButtonUpDisabled")
		var_24_8:AnimateSequence("ButtonUpDisabled")
		var_24_21:AnimateSequence("ButtonUpDisabled")
	end

	var_24_0._sequences.ButtonUpDisabled = var_24_61

	local var_24_62 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_6:RegisterAnimationSequence("DisabledActive", var_24_62)

	local var_24_63 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_8:RegisterAnimationSequence("DisabledActive", var_24_63)

	local var_24_64 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_24_21:RegisterAnimationSequence("DisabledActive", var_24_64)

	local function var_24_65()
		var_24_6:AnimateSequence("DisabledActive")
		var_24_8:AnimateSequence("DisabledActive")
		var_24_21:AnimateSequence("DisabledActive")
	end

	var_24_0._sequences.DisabledActive = var_24_65

	local var_24_66 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -391
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -359
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_21:RegisterAnimationSequence("ButtonOverDisabledActive", var_24_66)

	local function var_24_67()
		var_24_21:AnimateSequence("ButtonOverDisabledActive")
	end

	var_24_0._sequences.ButtonOverDisabledActive = var_24_67

	local var_24_68 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_6:RegisterAnimationSequence("ButtonUpDisabledActive", var_24_68)

	local var_24_69 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_8:RegisterAnimationSequence("ButtonUpDisabledActive", var_24_69)

	local var_24_70 = {
		{
			value = 0.8,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_24_21:RegisterAnimationSequence("ButtonUpDisabledActive", var_24_70)

	local function var_24_71()
		var_24_6:AnimateSequence("ButtonUpDisabledActive")
		var_24_8:AnimateSequence("ButtonUpDisabledActive")
		var_24_21:AnimateSequence("ButtonUpDisabledActive")
	end

	var_24_0._sequences.ButtonUpDisabledActive = var_24_71

	local var_24_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_24_8:RegisterAnimationSequence("KBM", var_24_72)

	local var_24_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_11:RegisterAnimationSequence("KBM", var_24_73)

	local var_24_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("KBM", var_24_74)

	local var_24_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("KBM", var_24_75)

	local var_24_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("KBM", var_24_76)

	local function var_24_77()
		var_24_8:AnimateSequence("KBM")
		var_24_11:AnimateSequence("KBM")
		var_24_14:AnimateSequence("KBM")
		var_24_16:AnimateSequence("KBM")
		var_24_18:AnimateSequence("KBM")
	end

	var_24_0._sequences.KBM = var_24_77

	local var_24_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -82
		}
	}

	var_24_8:RegisterAnimationSequence("Gamepad", var_24_78)

	local var_24_79 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_11:RegisterAnimationSequence("Gamepad", var_24_79)

	local var_24_80 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("Gamepad", var_24_80)

	local var_24_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("Gamepad", var_24_81)

	local var_24_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("Gamepad", var_24_82)

	local function var_24_83()
		var_24_8:AnimateSequence("Gamepad")
		var_24_11:AnimateSequence("Gamepad")
		var_24_14:AnimateSequence("Gamepad")
		var_24_16:AnimateSequence("Gamepad")
		var_24_18:AnimateSequence("Gamepad")
	end

	var_24_0._sequences.Gamepad = var_24_83

	local var_24_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -412,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("ShorterTitle", var_24_84)

	local function var_24_85()
		var_24_4:AnimateSequence("ShorterTitle")
	end

	var_24_0._sequences.ShorterTitle = var_24_85

	local var_24_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("ShorterTitleAR", var_24_86)

	local function var_24_87()
		var_24_4:AnimateSequence("ShorterTitleAR")
	end

	var_24_0._sequences.ShorterTitleAR = var_24_87

	local var_24_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("GamepadAR", var_24_88)

	local var_24_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left,
			child = var_24_0.EditBox.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			child = var_24_0.EditBox.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10,
			child = var_24_0.EditBox.Text
		}
	}

	var_24_6:RegisterAnimationSequence("GamepadAR", var_24_89)

	local var_24_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 283
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_24_8:RegisterAnimationSequence("GamepadAR", var_24_90)

	local var_24_91 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_11:RegisterAnimationSequence("GamepadAR", var_24_91)

	local var_24_92 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_14:RegisterAnimationSequence("GamepadAR", var_24_92)

	local var_24_93 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("GamepadAR", var_24_93)

	local var_24_94 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_18:RegisterAnimationSequence("GamepadAR", var_24_94)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_24_0) then
		local var_24_95 = {
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
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 366
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 402
			}
		}

		var_24_19:RegisterAnimationSequence("GamepadAR", var_24_95)
	end

	local var_24_96 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 36
		}
	}

	var_24_21:RegisterAnimationSequence("GamepadAR", var_24_96)

	local var_24_97 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 357
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 356
		}
	}

	var_24_23:RegisterAnimationSequence("GamepadAR", var_24_97)

	local function var_24_98()
		var_24_4:AnimateSequence("GamepadAR")
		var_24_6:AnimateSequence("GamepadAR")
		var_24_8:AnimateSequence("GamepadAR")
		var_24_11:AnimateSequence("GamepadAR")
		var_24_14:AnimateSequence("GamepadAR")
		var_24_16:AnimateSequence("GamepadAR")
		var_24_18:AnimateSequence("GamepadAR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_24_0) then
			var_24_19:AnimateSequence("GamepadAR")
		end

		var_24_21:AnimateSequence("GamepadAR")
		var_24_23:AnimateSequence("GamepadAR")
	end

	var_24_0._sequences.GamepadAR = var_24_98

	var_24_0:addEventHandler("button_over", function(arg_45_0, arg_45_1)
		if not arg_45_1.controller then
			local var_45_0 = var_24_1
		end

		ACTIONS.AnimateSequence(var_24_0, "ButtonOver")
		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.EditBox",
			sequenceName = "ButtonOver",
			elementName = "EditBox"
		})
	end)
	var_24_0:addEventHandler("button_up", function(arg_46_0, arg_46_1)
		if not arg_46_1.controller then
			local var_46_0 = var_24_1
		end

		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.EditBox",
			sequenceName = "ButtonUp",
			elementName = "EditBox"
		})
		ACTIONS.AnimateSequence(var_24_0, "ButtonUp")
		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.GenericFillBar",
			sequenceName = "ButtonUp",
			elementName = "GenericFillBar"
		})
		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.ArrowRight",
			sequenceName = "ButtonUp",
			elementName = "ArrowRight"
		})
		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.ArrowLeft",
			sequenceName = "ButtonUp",
			elementName = "ArrowLeft"
		})
	end)
	var_24_0:addEventHandler("button_over_disable", function(arg_47_0, arg_47_1)
		if not arg_47_1.controller then
			local var_47_0 = var_24_1
		end

		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.GenericFillBar",
			sequenceName = "ButtonOverDisabled",
			elementName = "GenericFillBar"
		})
	end)
	var_24_0:addEventHandler("button_disable", function(arg_48_0, arg_48_1)
		if not arg_48_1.controller then
			local var_48_0 = var_24_1
		end

		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.GenericFillBar",
			sequenceName = "ButtonUpDisabled",
			elementName = "GenericFillBar"
		})
	end)
	var_24_0:addEventHandler("button_active", function(arg_49_0, arg_49_1)
		if not arg_49_1.controller then
			local var_49_0 = var_24_1
		end

		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.EditBox",
			sequenceName = "ButtonUpActive",
			elementName = "EditBox"
		})
	end)
	var_24_0:addEventHandler("button_over_active", function(arg_50_0, arg_50_1)
		if not arg_50_1.controller then
			local var_50_0 = var_24_1
		end

		ACTIONS.AnimateSequenceByElement(var_24_0, {
			elementPath = "self.EditBox",
			sequenceName = "ButtonOverActive",
			elementName = "EditBox"
		})
	end)
	var_0_2(var_24_0, var_24_1, arg_24_1)
	ACTIONS.AnimateSequence(var_24_0, "DefaultSequence")

	return var_24_0
end

MenuBuilder.registerType("GenericSliderWithEditBox", GenericSliderWithEditBox)
LockTable(_M)
