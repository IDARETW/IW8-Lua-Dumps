module(..., package.seeall)

local function var_0_0(arg_1_0)
	ACTIONS.LeaveMenu(arg_1_0)
end

local function var_0_1(arg_2_0)
	arg_2_0:registerEventHandler("gamepad_button", function()
		return true
	end)
	ACTIONS.AnimateSequence(arg_2_0, arg_2_0._flyOutState)
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2.flyInRight then
		arg_4_0._flyOutState = "FlyOutRight"
		arg_4_0._flyInState = "FlyInRight"
	elseif arg_4_2.flyInLeftNarrow then
		arg_4_0._flyOutState = "FlyOutLeftNarrow"
		arg_4_0._flyInState = "FlyInLeftNarrow"
	else
		arg_4_0._flyOutState = "FlyOutLeft"
		arg_4_0._flyInState = "FlyInLeft"
	end

	arg_4_0.exitAnimation = var_0_1

	local var_4_0 = false

	assert(arg_4_2.widget)

	arg_4_0.widget = arg_4_2.widget

	arg_4_0.Container:addElement(arg_4_0.widget)
	LUI.TextChat.SetupMenuForNoChat(arg_4_0)

	local var_4_1 = arg_4_2.primaryButtonText or "LUA_MENU/SELECT"
	local var_4_2 = arg_4_2.altOneButtonText

	local function var_4_3(arg_5_0, arg_5_1)
		arg_5_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})

		if var_4_2 then
			arg_5_0:AddButtonHelperText({
				button_ref = "button_alt1",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC(var_4_2),
				side = arg_4_2.isAltOneButtonRightSide and "right" or "left"
			})
		end

		arg_5_0:AddButtonHelperText({
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC(var_4_1),
			side = arg_4_2.isPrimaryButtonRightSide and "right" or "left"
		})

		if arg_5_0.widget and arg_5_0.widget.moreInfoAction then
			arg_5_0:AddButtonHelperText({
				button_ref = "button_alt2",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("MENU/MORE_INFO"),
				side = arg_4_2.isPrimaryButtonRightSide and "right" or "left"
			})
		end

		if arg_5_0.widget and arg_5_0.widget.SetupButtonHelperBar then
			arg_5_0.widget:SetupButtonHelperBar(arg_5_0.ButtonHelperBar)
		end
	end

	arg_4_0:addEventHandler("menu_create", var_4_3)
	ACTIONS.AnimateSequence(arg_4_0, arg_4_0._flyInState)

	arg_4_0.isQuickAccessShortcutsDisabled = arg_4_2.disableQuickAccessShortcuts == nil or arg_4_2.disableQuickAccessShortcuts

	arg_4_0:registerEventHandler("opening_quick_access_menu", function(arg_6_0, arg_6_1)
		ACTIONS.LeaveMenu(arg_6_0)
	end)

	local var_4_4 = LUI.UIBindButton.new()

	var_4_4.id = "selfBindButton"

	arg_4_0:addElement(var_4_4)

	arg_4_0.bindButton = var_4_4

	arg_4_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if arg_4_2.backButtonOverride then
			arg_4_2.backButtonOverride(arg_7_0, arg_7_1)
		elseif arg_4_0.widget.backButtonOverride then
			arg_4_0.widget.backButtonOverride(arg_7_0, arg_7_1)
		end

		if not var_4_0 then
			var_0_1(arg_4_0)

			var_4_0 = true
		end
	end)

	if arg_4_0.widget.AltOneButtonOverride then
		arg_4_0.bindButton:addEventHandler("button_alt1", function(arg_8_0, arg_8_1)
			arg_4_0.widget:AltOneButtonOverride(arg_4_0, arg_8_1)
		end)
	end

	arg_4_0.MouseTrapBacking:SetHandleMouse(true)
	arg_4_0.MouseTrapBacking:addEventHandler("leftmouseup", function(arg_9_0, arg_9_1)
		if arg_4_2.closePopupOverride then
			arg_4_2.closePopupOverride(arg_9_0, arg_9_1)
		elseif arg_4_0.widget.closePopupOverride then
			arg_4_0.widget.closePopupOverride(arg_9_0, arg_9_1)
		end

		var_0_1(arg_4_0)
		arg_4_0.MouseTrapBacking:SetHandleMouse(false)
	end)

	if arg_4_2.quickCloseEvent then
		arg_4_0:addEventHandler(arg_4_2.quickCloseEvent, function(arg_10_0, arg_10_1)
			arg_10_0:exitAnimation(arg_10_0)
		end)
	end

	if arg_4_0.widget.moreInfoAction then
		arg_4_0.bindButton:addEventHandler("button_alt2", function(arg_11_0, arg_11_1)
			arg_4_0.widget.moreInfoAction(arg_4_0, arg_4_1)
		end)
	end

	arg_4_0.BG:SetHandleMouse(true)
	assert(arg_4_0.Gradient)
	assert(arg_4_0.Darken)
	ACTIONS.ScaleFullscreen(arg_4_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_4_0.Gradient)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_4_0.PanelGradient)
	LAYOUT.AddAspectRatioFadeFrame(arg_4_0, arg_4_1)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

function FlyInPopup(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0.id = "FlyInPopup"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Darken"

	var_12_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_12_4:SetAlpha(0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Darken = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "Gradient"

	var_12_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus, 0)
	var_12_6:SetAlpha(0, 0)
	var_12_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_12_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 515, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.Gradient = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIImage.new()

	var_12_8.id = "MouseTrapBacking"

	var_12_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus, 0)
	var_12_8:SetAlpha(0, 0)
	var_12_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_12_0:addElement(var_12_8)

	var_12_0.MouseTrapBacking = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "BG"

	var_12_10:SetRGBFromInt(0, 0)
	var_12_10:SetAlpha(0.9, 0)
	var_12_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -825, 0, 0, 0)
	var_12_0:addElement(var_12_10)

	var_12_0.BG = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIImage.new()

	var_12_12.id = "PanelGradient"

	var_12_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus, 0)
	var_12_12:SetAlpha(0.5, 0)
	var_12_12:setImage(RegisterMaterial("panel_gradient"), 0)
	var_12_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -32, 0, 0, 0)
	var_12_0:addElement(var_12_12)

	var_12_0.PanelGradient = var_12_12

	local var_12_13
	local var_12_14 = MenuBuilder.BuildRegisteredType("FlyInPopupContainer", {
		controllerIndex = var_12_1
	})

	var_12_14.id = "Container"

	var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -825, 0, 0, _1080p * 1080)
	var_12_0:addElement(var_12_14)

	var_12_0.Container = var_12_14

	local var_12_15
	local var_12_16 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})

	var_12_16.id = "ButtonHelperBar"

	var_12_16.Background:SetAlpha(0, 0)
	var_12_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -825, 0, _1080p * -60, 0)
	var_12_0:addElement(var_12_16)

	var_12_0.ButtonHelperBar = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIImage.new()

	var_12_18.id = "Backer"

	var_12_18:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_12_18:SetAlpha(0.9, 0)
	var_12_18:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2203, _1080p * 1041, _1080p * 463, _1080p * -168)
	var_12_0:addElement(var_12_18)

	var_12_0.Backer = var_12_18

	local var_12_19
	local var_12_20 = LUI.UIImage.new()

	var_12_20.id = "TextureLayer"

	var_12_20:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_12_20:SetAlpha(0.1, 0)
	var_12_20:SetPixelGridEnabled(true)
	var_12_20:SetPixelGridContrast(0.8, 0)
	var_12_20:SetPixelGridBlockWidth(2, 0)
	var_12_20:SetPixelGridBlockHeight(2, 0)
	var_12_20:SetPixelGridGutterWidth(1, 0)
	var_12_20:SetPixelGridGutterHeight(1, 0)
	var_12_20:setImage(RegisterMaterial("ui_default_white"), 0)
	var_12_20:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2203, _1080p * 1041, _1080p * 463, _1080p * -168)
	var_12_0:addElement(var_12_20)

	var_12_0.TextureLayer = var_12_20

	local function var_12_21()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_21

	local var_12_22
	local var_12_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("FlyInLeft", var_12_23)

	local var_12_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("FlyInLeft", var_12_24)

	local var_12_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -669
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 205
		},
		{
			duration = 260,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 825,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 260,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_10:RegisterAnimationSequence("FlyInLeft", var_12_25)

	local var_12_26 = {
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
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 793,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 825,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_12:RegisterAnimationSequence("FlyInLeft", var_12_26)

	local var_12_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -620
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 205
		},
		{
			duration = 260,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 825,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_14:RegisterAnimationSequence("FlyInLeft", var_12_27)

	local var_12_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 825,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_16:RegisterAnimationSequence("FlyInLeft", var_12_28)

	local function var_12_29()
		var_12_4:AnimateSequence("FlyInLeft")
		var_12_6:AnimateSequence("FlyInLeft")
		var_12_10:AnimateSequence("FlyInLeft")
		var_12_12:AnimateSequence("FlyInLeft")
		var_12_14:AnimateSequence("FlyInLeft")
		var_12_16:AnimateSequence("FlyInLeft")
	end

	var_12_0._sequences.FlyInLeft = var_12_29

	local var_12_30
	local var_12_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("FlyInRight", var_12_31)

	local var_12_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("FlyInRight", var_12_32)

	local var_12_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1920
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2745
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1095,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_10:RegisterAnimationSequence("FlyInRight", var_12_33)

	local var_12_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1952
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1127,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1095,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_12:RegisterAnimationSequence("FlyInRight", var_12_34)

	local var_12_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1920
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2745
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1095,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_14:RegisterAnimationSequence("FlyInRight", var_12_35)

	local var_12_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1920
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2745
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1095,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_16:RegisterAnimationSequence("FlyInRight", var_12_36)

	local function var_12_37()
		var_12_4:AnimateSequence("FlyInRight")
		var_12_6:AnimateSequence("FlyInRight")
		var_12_10:AnimateSequence("FlyInRight")
		var_12_12:AnimateSequence("FlyInRight")
		var_12_14:AnimateSequence("FlyInRight")
		var_12_16:AnimateSequence("FlyInRight")
	end

	var_12_0._sequences.FlyInRight = var_12_37

	local var_12_38
	local var_12_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("FlyInLeftNarrow", var_12_39)

	local var_12_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("FlyInLeftNarrow", var_12_40)

	local var_12_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 625,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_10:RegisterAnimationSequence("FlyInLeftNarrow", var_12_41)

	local var_12_42 = {
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
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 593,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 625,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_12:RegisterAnimationSequence("FlyInLeftNarrow", var_12_42)

	local var_12_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 625,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_14:RegisterAnimationSequence("FlyInLeftNarrow", var_12_43)

	local var_12_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 625,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_16:RegisterAnimationSequence("FlyInLeftNarrow", var_12_44)

	local function var_12_45()
		var_12_4:AnimateSequence("FlyInLeftNarrow")
		var_12_6:AnimateSequence("FlyInLeftNarrow")
		var_12_10:AnimateSequence("FlyInLeftNarrow")
		var_12_12:AnimateSequence("FlyInLeftNarrow")
		var_12_14:AnimateSequence("FlyInLeftNarrow")
		var_12_16:AnimateSequence("FlyInLeftNarrow")
	end

	var_12_0._sequences.FlyInLeftNarrow = var_12_45

	local var_12_46
	local var_12_47 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("FlyOutLeft", var_12_47)

	local var_12_48 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("FlyOutLeft", var_12_48)

	local var_12_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 825,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -164,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_12_10:RegisterAnimationSequence("FlyOutLeft", var_12_49)

	local var_12_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 793
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 825
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -32,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_12_12:RegisterAnimationSequence("FlyOutLeft", var_12_50)

	local var_12_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 825,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825,
			easing = LUI.EASING.inQuadratic,
			onComplete = OnCloseComplete
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_12_14:RegisterAnimationSequence("FlyOutLeft", var_12_51)

	local var_12_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 825,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825,
			onComplete = var_0_0
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_12_16:RegisterAnimationSequence("FlyOutLeft", var_12_52)

	local function var_12_53()
		var_12_4:AnimateSequence("FlyOutLeft")
		var_12_6:AnimateSequence("FlyOutLeft")
		var_12_10:AnimateSequence("FlyOutLeft")
		var_12_12:AnimateSequence("FlyOutLeft")
		var_12_14:AnimateSequence("FlyOutLeft")
		var_12_16:AnimateSequence("FlyOutLeft")
	end

	var_12_0._sequences.FlyOutLeft = var_12_53

	local var_12_54
	local var_12_55 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("FlyOutRight", var_12_55)

	local var_12_56 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("FlyOutRight", var_12_56)

	local var_12_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1095,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1920,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2745,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_12_10:RegisterAnimationSequence("FlyOutRight", var_12_57)

	local var_12_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1095
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1952,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_12_12:RegisterAnimationSequence("FlyOutRight", var_12_58)

	local var_12_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1095,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1920,
			onComplete = OnCloseComplete
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2745
		}
	}

	var_12_14:RegisterAnimationSequence("FlyOutRight", var_12_59)

	local var_12_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1095,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1920,
			onComplete = var_0_0
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2745
		}
	}

	var_12_16:RegisterAnimationSequence("FlyOutRight", var_12_60)

	local function var_12_61()
		var_12_4:AnimateSequence("FlyOutRight")
		var_12_6:AnimateSequence("FlyOutRight")
		var_12_10:AnimateSequence("FlyOutRight")
		var_12_12:AnimateSequence("FlyOutRight")
		var_12_14:AnimateSequence("FlyOutRight")
		var_12_16:AnimateSequence("FlyOutRight")
	end

	var_12_0._sequences.FlyOutRight = var_12_61

	local var_12_62
	local var_12_63 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("FlyOutLeftNarrow", var_12_63)

	local var_12_64 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("FlyOutLeftNarrow", var_12_64)

	local var_12_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 625,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_12_10:RegisterAnimationSequence("FlyOutLeftNarrow", var_12_65)

	local var_12_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 593
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 625
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -32,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_12_12:RegisterAnimationSequence("FlyOutLeftNarrow", var_12_66)

	local var_12_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 625,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825,
			onComplete = OnCloseComplete
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_12_14:RegisterAnimationSequence("FlyOutLeftNarrow", var_12_67)

	local var_12_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 625,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -825,
			onComplete = var_0_0
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_12_16:RegisterAnimationSequence("FlyOutLeftNarrow", var_12_68)

	local function var_12_69()
		var_12_4:AnimateSequence("FlyOutLeftNarrow")
		var_12_6:AnimateSequence("FlyOutLeftNarrow")
		var_12_10:AnimateSequence("FlyOutLeftNarrow")
		var_12_12:AnimateSequence("FlyOutLeftNarrow")
		var_12_14:AnimateSequence("FlyOutLeftNarrow")
		var_12_16:AnimateSequence("FlyOutLeftNarrow")
	end

	var_12_0._sequences.FlyOutLeftNarrow = var_12_69

	local var_12_70
	local var_12_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2Brown
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipSetup", var_12_71)

	local function var_12_72()
		var_12_12:AnimateSequence("WZWipSetup")
	end

	var_12_0._sequences.WZWipSetup = var_12_72

	PostLoadFunc(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("FlyInPopup", FlyInPopup)
LockTable(_M)
