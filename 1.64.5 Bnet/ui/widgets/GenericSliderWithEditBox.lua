module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.MoreInfoButton then
		if arg_1_0:IsDisabled() then
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

	local var_3_0 = WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver", CONDITIONS.IsWZWipDvarEnabled())
	local var_3_1 = WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp", CONDITIONS.IsWZWipDvarEnabled())
	local var_3_2 = WZWIP.CheckForApplyPrependWZWipPrefix("Up", CONDITIONS.IsWZWipDvarEnabled())
	local var_3_3 = WZWIP.CheckForApplyPrependWZWipPrefix("Down", CONDITIONS.IsWZWipDvarEnabled())

	local function var_3_4(arg_4_0, arg_4_1)
		if arg_4_0._lastState ~= arg_4_1 then
			arg_4_0._lastState = arg_4_1

			WZWIP.AnimateThemeElement(arg_4_0, arg_4_1)
		end
	end

	arg_3_0:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if LUI.IsLastInputKeyboardMouse(arg_5_1.controller) then
			return true
		end
	end)
	arg_3_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		var_3_4(arg_6_0, "ButtonOver")
		ACTIONS.AnimateSequenceByElement(arg_6_0, {
			elementPath = "self.EditBox",
			elementName = "EditBox",
			sequenceName = var_3_0
		})
	end)
	arg_3_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		var_3_4(arg_7_0, "ButtonUp")

		if arg_7_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_7_0.MoreInfoButton, var_3_1)
		end

		ACTIONS.AnimateSequenceByElement(arg_7_0, {
			elementPath = "self.EditBox",
			elementName = "EditBox",
			sequenceName = var_3_1
		})
		ACTIONS.AnimateSequenceByElement(arg_7_0, {
			elementPath = "self.GenericFillBar",
			elementName = "GenericFillBar",
			sequenceName = var_3_1
		})
		ACTIONS.AnimateSequenceByElement(arg_7_0, {
			elementPath = "self.ArrowRight",
			elementName = "ArrowRight",
			sequenceName = var_3_1
		})
		ACTIONS.AnimateSequenceByElement(arg_7_0, {
			elementPath = "self.ArrowLeft",
			elementName = "ArrowLeft",
			sequenceName = var_3_1
		})
	end)
	arg_3_0:addEventHandler("active", function(arg_8_0, arg_8_1)
		var_3_4(arg_8_0, "Active")
	end)
	arg_3_0:addEventHandler("enable", function(arg_9_0, arg_9_1)
		var_0_0(arg_9_0, arg_3_1)
	end)
	arg_3_0:addEventHandler("disable", function(arg_10_0, arg_10_1)
		var_0_0(arg_10_0, arg_3_1)
	end)
	arg_3_0:addEventHandler("button_over_active", function(arg_11_0, arg_11_1)
		var_3_4(arg_11_0, "ButtonOverActive")

		if arg_11_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_11_0.MoreInfoButton, var_3_0)
		end
	end)
	arg_3_0:addEventHandler("button_active", function(arg_12_0, arg_12_1)
		var_3_4(arg_12_0, "ButtonUpActive")

		if arg_12_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_12_0.MoreInfoButton, var_3_1)
		end
	end)
	arg_3_0:addEventHandler("disable_active", function(arg_13_0, arg_13_1)
		var_3_4(arg_13_0, "DisabledActive")
	end)
	arg_3_0:addEventHandler("button_over_disable_active", function(arg_14_0, arg_14_1)
		var_3_4(arg_14_0, "ButtonOverDisabledActive")
	end)
	arg_3_0:addEventHandler("button_disable_active", function(arg_15_0, arg_15_1)
		var_3_4(arg_15_0, "ButtonUpDisabledActive")
	end)
	arg_3_0:addEventHandler("disabled", function(arg_16_0, arg_16_1)
		var_3_4(arg_16_0, "Disabled")
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_17_0, arg_17_1)
		var_3_4(arg_17_0, "ButtonOverDisabled")
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_18_0, arg_18_1)
		var_3_4(arg_18_0, "ButtonUpDisabled")
	end)

	local function var_3_5(arg_19_0, arg_19_1)
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
				ACTIONS.AnimateSequence(arg_20_0.ArrowRight, var_3_2)
			elseif arg_20_1.button == "left" then
				ACTIONS.AnimateSequence(arg_20_0.ArrowLeft, var_3_2)
			end
		elseif arg_20_1.button == "right" then
			ACTIONS.AnimateSequence(arg_20_0.ArrowRight, var_3_3)
		elseif arg_20_1.button == "left" then
			ACTIONS.AnimateSequence(arg_20_0.ArrowLeft, var_3_3)
		end
	end)

	if arg_3_0.MoreInfoButton then
		arg_3_0.MoreInfoButton:addEventHandler("leftmouseup", function(arg_21_0, arg_21_1)
			if arg_21_1.inside and arg_21_0:isInFocus() and not arg_3_0:IsDisabled() then
				arg_3_0:customPreviewButtonAction(arg_21_1.controller)
			end
		end)
	end

	arg_3_0:addAndCallEventHandler("update_input_type", var_3_5, {
		controllerIndex = arg_3_1
	})

	arg_3_0.HideLeftLine = var_0_1

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end
end

local function var_0_3(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0._needMoreInfoInnerButton = arg_22_2.needMoreInfoInnerButton
end

function GenericSliderWithEditBox(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIButton.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_23_0.id = "GenericSliderWithEditBox"
	var_23_0._animationSets = var_23_0._animationSets or {}
	var_23_0._sequences = var_23_0._sequences or {}

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)
	var_0_3(var_23_0, var_23_1, arg_23_1)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_23_1
	})

	var_23_4.id = "GenericOptionButtonBase"

	var_23_4.Title:SetLeft(_1080p * 20, 0)
	var_23_4.Title:SetRight(_1080p * -375, 0)
	var_23_4.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_23_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_23_0:addElement(var_23_4)

	var_23_0.GenericOptionButtonBase = var_23_4

	local var_23_5
	local var_23_6 = MenuBuilder.BuildRegisteredType("GenericInnerButton", {
		controllerIndex = var_23_1
	})

	var_23_6.id = "EditBox"

	var_23_6.Text:SetLeft(_1080p * 10, 0)
	var_23_6.Text:SetRight(_1080p * -4, 0)
	var_23_6.Text:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_23_6.Text:SetAlignment(LUI.Alignment.Left)
	var_23_6.Pip:SetAlpha(0, 0)
	var_23_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -357, _1080p * -275, 0, 0)
	var_23_0:addElement(var_23_6)

	var_23_0.EditBox = var_23_6

	local var_23_7
	local var_23_8 = MenuBuilder.BuildRegisteredType("GenericSliderBar", {
		controllerIndex = var_23_1
	})

	var_23_8.id = "GenericFillBar"

	var_23_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -269, _1080p * -82, 0, 0)
	var_23_0:addElement(var_23_8)

	var_23_0.GenericFillBar = var_23_8

	local var_23_9
	local var_23_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_23_11 = LUI.UIBorder.new(var_23_10)

	var_23_11.id = "ArrowLeftDefault"

	var_23_11:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_23_11:SetAlpha(0.7, 0)
	var_23_11:SetZRotation(-45, 0)
	var_23_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_23_11:SetBorderThicknessTop(_1080p * 0, 0)
	var_23_11:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -57, _1080p * -47, _1080p * -5, _1080p * 5)
	var_23_0:addElement(var_23_11)

	var_23_0.ArrowLeftDefault = var_23_11

	local var_23_12
	local var_23_13 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_23_14 = LUI.UIBorder.new(var_23_13)

	var_23_14.id = "ArrowRightDefault"

	var_23_14:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_23_14:SetAlpha(0.7, 0)
	var_23_14:SetZRotation(-45, 0)
	var_23_14:SetBorderThicknessLeft(_1080p * 0, 0)
	var_23_14:SetBorderThicknessBottom(_1080p * 0, 0)
	var_23_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -32, _1080p * -22, _1080p * -5, _1080p * 5)
	var_23_0:addElement(var_23_14)

	var_23_0.ArrowRightDefault = var_23_14

	local var_23_15
	local var_23_16 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_23_1
	})

	var_23_16.id = "ArrowRight"

	var_23_16.Icon:SetZRotation(180, 0)
	var_23_16.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_23_16:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -38, _1080p * -10, 0, 0)
	var_23_0:addElement(var_23_16)

	var_23_0.ArrowRight = var_23_16

	local var_23_17
	local var_23_18 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_23_1
	})

	var_23_18.id = "ArrowLeft"

	var_23_18.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_23_18:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -69, _1080p * -41, 0, 0)
	var_23_0:addElement(var_23_18)

	var_23_0.ArrowLeft = var_23_18

	local var_23_19

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_23_0) then
		var_23_19 = MenuBuilder.BuildRegisteredType("MoreInfoInnerButton", {
			controllerIndex = var_23_1
		})
		var_23_19.id = "MoreInfoButton"

		var_23_19:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -405, _1080p * -369, 0, 0)
		var_23_0:addElement(var_23_19)

		var_23_0.MoreInfoButton = var_23_19
	end

	local var_23_20
	local var_23_21 = LUI.UIImage.new()

	var_23_21.id = "Lock"

	var_23_21:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_23_21:SetAlpha(0, 0)
	var_23_21:setImage(RegisterMaterial("icon_lock"), 0)
	var_23_21:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -52, _1080p * -26, _1080p * -13, _1080p * 13)
	var_23_0:addElement(var_23_21)

	var_23_0.Lock = var_23_21

	local var_23_22
	local var_23_23 = LUI.UIImage.new()

	var_23_23.id = "LeftLine"

	var_23_23:SetAlpha(0.2, 0)
	var_23_23:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -356, _1080p * -10, _1080p * 10)
	var_23_0:addElement(var_23_23)

	var_23_0.LeftLine = var_23_23

	local var_23_24
	local var_23_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("DefaultSequence", var_23_25)

	local function var_23_26()
		var_23_21:AnimateSequence("DefaultSequence")
	end

	var_23_0._sequences.DefaultSequence = var_23_26

	local var_23_27
	local var_23_28 = {
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

	var_23_21:RegisterAnimationSequence("Locked", var_23_28)

	local function var_23_29()
		var_23_21:AnimateSequence("Locked")
	end

	var_23_0._sequences.Locked = var_23_29

	local function var_23_30()
		return
	end

	var_23_0._sequences.NewNotification = var_23_30

	local var_23_31
	local var_23_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("AR", var_23_32)

	local var_23_33 = {
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
			child = var_23_0.EditBox.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			child = var_23_0.EditBox.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10,
			child = var_23_0.EditBox.Text
		}
	}

	var_23_6:RegisterAnimationSequence("AR", var_23_33)

	local var_23_34 = {
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

	var_23_8:RegisterAnimationSequence("AR", var_23_34)

	local var_23_35 = {
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

	var_23_11:RegisterAnimationSequence("AR", var_23_35)

	local var_23_36 = {
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

	var_23_14:RegisterAnimationSequence("AR", var_23_36)

	local var_23_37 = {
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

	var_23_16:RegisterAnimationSequence("AR", var_23_37)

	local var_23_38 = {
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

	var_23_18:RegisterAnimationSequence("AR", var_23_38)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_23_0) then
		local var_23_39 = {
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

		var_23_19:RegisterAnimationSequence("AR", var_23_39)
	end

	local var_23_40 = {
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

	var_23_21:RegisterAnimationSequence("AR", var_23_40)

	local var_23_41 = {
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

	var_23_23:RegisterAnimationSequence("AR", var_23_41)

	local function var_23_42()
		var_23_4:AnimateSequence("AR")
		var_23_6:AnimateSequence("AR")
		var_23_8:AnimateSequence("AR")
		var_23_11:AnimateSequence("AR")
		var_23_14:AnimateSequence("AR")
		var_23_16:AnimateSequence("AR")
		var_23_18:AnimateSequence("AR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_23_0) then
			var_23_19:AnimateSequence("AR")
		end

		var_23_21:AnimateSequence("AR")
		var_23_23:AnimateSequence("AR")
	end

	var_23_0._sequences.AR = var_23_42

	local function var_23_43()
		return
	end

	var_23_0._sequences.ButtonOver = var_23_43

	local var_23_44
	local var_23_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_23_0.GenericOptionButtonBase.Title
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

	var_23_4:RegisterAnimationSequence("ButtonUp", var_23_45)

	local var_23_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonUp", var_23_46)

	local var_23_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonUp", var_23_47)

	local var_23_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("ButtonUp", var_23_48)

	local function var_23_49()
		var_23_4:AnimateSequence("ButtonUp")
		var_23_6:AnimateSequence("ButtonUp")
		var_23_8:AnimateSequence("ButtonUp")
		var_23_21:AnimateSequence("ButtonUp")
	end

	var_23_0._sequences.ButtonUp = var_23_49

	local var_23_50
	local var_23_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("Active", var_23_51)

	local function var_23_52()
		var_23_21:AnimateSequence("Active")
	end

	var_23_0._sequences.Active = var_23_52

	local var_23_53
	local var_23_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("ButtonOverActive", var_23_54)

	local function var_23_55()
		var_23_21:AnimateSequence("ButtonOverActive")
	end

	var_23_0._sequences.ButtonOverActive = var_23_55

	local var_23_56
	local var_23_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("ButtonUpActive", var_23_57)

	local function var_23_58()
		var_23_21:AnimateSequence("ButtonUpActive")
	end

	var_23_0._sequences.ButtonUpActive = var_23_58

	local var_23_59
	local var_23_60 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("Disabled", var_23_60)

	local var_23_61 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("Disabled", var_23_61)

	local var_23_62 = {
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

	var_23_21:RegisterAnimationSequence("Disabled", var_23_62)

	local function var_23_63()
		var_23_6:AnimateSequence("Disabled")
		var_23_8:AnimateSequence("Disabled")
		var_23_21:AnimateSequence("Disabled")
	end

	var_23_0._sequences.Disabled = var_23_63

	local var_23_64
	local var_23_65 = {
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

	var_23_21:RegisterAnimationSequence("ButtonOverDisabled", var_23_65)

	local function var_23_66()
		var_23_21:AnimateSequence("ButtonOverDisabled")
	end

	var_23_0._sequences.ButtonOverDisabled = var_23_66

	local var_23_67
	local var_23_68 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonUpDisabled", var_23_68)

	local var_23_69 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonUpDisabled", var_23_69)

	local var_23_70 = {
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

	var_23_21:RegisterAnimationSequence("ButtonUpDisabled", var_23_70)

	local function var_23_71()
		var_23_6:AnimateSequence("ButtonUpDisabled")
		var_23_8:AnimateSequence("ButtonUpDisabled")
		var_23_21:AnimateSequence("ButtonUpDisabled")
	end

	var_23_0._sequences.ButtonUpDisabled = var_23_71

	local var_23_72
	local var_23_73 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("DisabledActive", var_23_73)

	local var_23_74 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("DisabledActive", var_23_74)

	local var_23_75 = {
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

	var_23_21:RegisterAnimationSequence("DisabledActive", var_23_75)

	local function var_23_76()
		var_23_6:AnimateSequence("DisabledActive")
		var_23_8:AnimateSequence("DisabledActive")
		var_23_21:AnimateSequence("DisabledActive")
	end

	var_23_0._sequences.DisabledActive = var_23_76

	local var_23_77
	local var_23_78 = {
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

	var_23_21:RegisterAnimationSequence("ButtonOverDisabledActive", var_23_78)

	local function var_23_79()
		var_23_21:AnimateSequence("ButtonOverDisabledActive")
	end

	var_23_0._sequences.ButtonOverDisabledActive = var_23_79

	local var_23_80
	local var_23_81 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonUpDisabledActive", var_23_81)

	local var_23_82 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("ButtonUpDisabledActive", var_23_82)

	local var_23_83 = {
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

	var_23_21:RegisterAnimationSequence("ButtonUpDisabledActive", var_23_83)

	local function var_23_84()
		var_23_6:AnimateSequence("ButtonUpDisabledActive")
		var_23_8:AnimateSequence("ButtonUpDisabledActive")
		var_23_21:AnimateSequence("ButtonUpDisabledActive")
	end

	var_23_0._sequences.ButtonUpDisabledActive = var_23_84

	local var_23_85
	local var_23_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_23_8:RegisterAnimationSequence("KBM", var_23_86)

	local var_23_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_11:RegisterAnimationSequence("KBM", var_23_87)

	local var_23_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("KBM", var_23_88)

	local var_23_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("KBM", var_23_89)

	local var_23_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_18:RegisterAnimationSequence("KBM", var_23_90)

	local function var_23_91()
		var_23_8:AnimateSequence("KBM")
		var_23_11:AnimateSequence("KBM")
		var_23_14:AnimateSequence("KBM")
		var_23_16:AnimateSequence("KBM")
		var_23_18:AnimateSequence("KBM")
	end

	var_23_0._sequences.KBM = var_23_91

	local var_23_92
	local var_23_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -82
		}
	}

	var_23_8:RegisterAnimationSequence("Gamepad", var_23_93)

	local var_23_94 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_11:RegisterAnimationSequence("Gamepad", var_23_94)

	local var_23_95 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_14:RegisterAnimationSequence("Gamepad", var_23_95)

	local var_23_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("Gamepad", var_23_96)

	local var_23_97 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_18:RegisterAnimationSequence("Gamepad", var_23_97)

	local function var_23_98()
		var_23_8:AnimateSequence("Gamepad")
		var_23_11:AnimateSequence("Gamepad")
		var_23_14:AnimateSequence("Gamepad")
		var_23_16:AnimateSequence("Gamepad")
		var_23_18:AnimateSequence("Gamepad")
	end

	var_23_0._sequences.Gamepad = var_23_98

	local var_23_99
	local var_23_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -412,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("ShorterTitle", var_23_100)

	local function var_23_101()
		var_23_4:AnimateSequence("ShorterTitle")
	end

	var_23_0._sequences.ShorterTitle = var_23_101

	local var_23_102
	local var_23_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("ShorterTitleAR", var_23_103)

	local function var_23_104()
		var_23_4:AnimateSequence("ShorterTitleAR")
	end

	var_23_0._sequences.ShorterTitleAR = var_23_104

	local var_23_105
	local var_23_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("GamepadAR", var_23_106)

	local var_23_107 = {
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
			child = var_23_0.EditBox.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			child = var_23_0.EditBox.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10,
			child = var_23_0.EditBox.Text
		}
	}

	var_23_6:RegisterAnimationSequence("GamepadAR", var_23_107)

	local var_23_108 = {
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

	var_23_8:RegisterAnimationSequence("GamepadAR", var_23_108)

	local var_23_109 = {
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

	var_23_11:RegisterAnimationSequence("GamepadAR", var_23_109)

	local var_23_110 = {
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

	var_23_14:RegisterAnimationSequence("GamepadAR", var_23_110)

	local var_23_111 = {
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

	var_23_16:RegisterAnimationSequence("GamepadAR", var_23_111)

	local var_23_112 = {
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

	var_23_18:RegisterAnimationSequence("GamepadAR", var_23_112)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_23_0) then
		local var_23_113 = {
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

		var_23_19:RegisterAnimationSequence("GamepadAR", var_23_113)
	end

	local var_23_114 = {
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

	var_23_21:RegisterAnimationSequence("GamepadAR", var_23_114)

	local var_23_115 = {
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

	var_23_23:RegisterAnimationSequence("GamepadAR", var_23_115)

	local function var_23_116()
		var_23_4:AnimateSequence("GamepadAR")
		var_23_6:AnimateSequence("GamepadAR")
		var_23_8:AnimateSequence("GamepadAR")
		var_23_11:AnimateSequence("GamepadAR")
		var_23_14:AnimateSequence("GamepadAR")
		var_23_16:AnimateSequence("GamepadAR")
		var_23_18:AnimateSequence("GamepadAR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_23_0) then
			var_23_19:AnimateSequence("GamepadAR")
		end

		var_23_21:AnimateSequence("GamepadAR")
		var_23_23:AnimateSequence("GamepadAR")
	end

	var_23_0._sequences.GamepadAR = var_23_116

	local var_23_117
	local var_23_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("WZWipSetup", var_23_118)

	local var_23_119 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.EditBox.Text
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipSetup", var_23_119)

	local var_23_120 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipSetup", var_23_120)

	local var_23_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_23_21:RegisterAnimationSequence("WZWipSetup", var_23_121)

	local function var_23_122()
		var_23_4:AnimateSequence("WZWipSetup")
		var_23_6:AnimateSequence("WZWipSetup")
		var_23_8:AnimateSequence("WZWipSetup")
		var_23_21:AnimateSequence("WZWipSetup")
	end

	var_23_0._sequences.WZWipSetup = var_23_122

	local var_23_123
	local var_23_124 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_23_0.GenericOptionButtonBase.Title
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
		}
	}

	var_23_4:RegisterAnimationSequence("WZWipButtonUp", var_23_124)

	local var_23_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipButtonUp", var_23_125)

	local var_23_126 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipButtonUp", var_23_126)

	local var_23_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("WZWipButtonUp", var_23_127)

	local function var_23_128()
		var_23_4:AnimateSequence("WZWipButtonUp")
		var_23_6:AnimateSequence("WZWipButtonUp")
		var_23_8:AnimateSequence("WZWipButtonUp")
		var_23_21:AnimateSequence("WZWipButtonUp")
	end

	var_23_0._sequences.WZWipButtonUp = var_23_128

	local var_23_129
	local var_23_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("WZWipButtonOver", var_23_130)

	local var_23_131 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.EditBox.Text
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipButtonOver", var_23_131)

	local var_23_132 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipButtonOver", var_23_132)

	local var_23_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("WZWipButtonOver", var_23_133)

	local function var_23_134()
		var_23_4:AnimateSequence("WZWipButtonOver")
		var_23_6:AnimateSequence("WZWipButtonOver")
		var_23_8:AnimateSequence("WZWipButtonOver")
		var_23_21:AnimateSequence("WZWipButtonOver")
	end

	var_23_0._sequences.WZWipButtonOver = var_23_134

	local var_23_135
	local var_23_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("WZWipButtonOverActive", var_23_136)

	local function var_23_137()
		var_23_21:AnimateSequence("WZWipButtonOverActive")
	end

	var_23_0._sequences.WZWipButtonOverActive = var_23_137

	local var_23_138
	local var_23_139 = {
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

	var_23_21:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_139)

	local function var_23_140()
		var_23_21:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_23_0._sequences.WZWipButtonOverDisabled = var_23_140

	local var_23_141
	local var_23_142 = {
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

	var_23_21:RegisterAnimationSequence("WZWipButtonOverDisabledActive", var_23_142)

	local function var_23_143()
		var_23_21:AnimateSequence("WZWipButtonOverDisabledActive")
	end

	var_23_0._sequences.WZWipButtonOverDisabledActive = var_23_143

	local var_23_144
	local var_23_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_21:RegisterAnimationSequence("WZWipButtonUpActive", var_23_145)

	local function var_23_146()
		var_23_21:AnimateSequence("WZWipButtonUpActive")
	end

	var_23_0._sequences.WZWipButtonUpActive = var_23_146

	local var_23_147
	local var_23_148 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_23_148)

	local var_23_149 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_23_149)

	local var_23_150 = {
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

	var_23_21:RegisterAnimationSequence("WZWipButtonUpDisabled", var_23_150)

	local function var_23_151()
		var_23_6:AnimateSequence("WZWipButtonUpDisabled")
		var_23_8:AnimateSequence("WZWipButtonUpDisabled")
		var_23_21:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_23_0._sequences.WZWipButtonUpDisabled = var_23_151

	local var_23_152
	local var_23_153 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_23_153)

	local var_23_154 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_8:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_23_154)

	local var_23_155 = {
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

	var_23_21:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_23_155)

	local function var_23_156()
		var_23_6:AnimateSequence("WZWipButtonUpDisabledActive")
		var_23_8:AnimateSequence("WZWipButtonUpDisabledActive")
		var_23_21:AnimateSequence("WZWipButtonUpDisabledActive")
	end

	var_23_0._sequences.WZWipButtonUpDisabledActive = var_23_156

	var_0_2(var_23_0, var_23_1, arg_23_1)
	ACTIONS.AnimateSequence(var_23_0, "DefaultSequence")

	return var_23_0
end

MenuBuilder.registerType("GenericSliderWithEditBox", GenericSliderWithEditBox)
LockTable(_M)
