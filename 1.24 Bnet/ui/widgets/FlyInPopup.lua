module(..., package.seeall)

local function var_0_0(arg_1_0)
	ACTIONS.LeaveMenu(arg_1_0)
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2.flyInRight then
		arg_2_0._flyOutState = "FlyOutRight"
		arg_2_0._flyInState = "FlyInRight"
	elseif arg_2_2.flyInLeftNarrow then
		arg_2_0._flyOutState = "FlyOutLeftNarrow"
		arg_2_0._flyInState = "FlyInLeftNarrow"
	else
		arg_2_0._flyOutState = "FlyOutLeft"
		arg_2_0._flyInState = "FlyInLeft"
	end

	function arg_2_0.exitAnimation(arg_3_0)
		arg_3_0:registerEventHandler("gamepad_button", function()
			return true
		end)
		ACTIONS.AnimateSequence(arg_3_0, arg_3_0._flyOutState)
	end

	local var_2_0 = false

	assert(arg_2_2.widget)

	arg_2_0.widget = arg_2_2.widget

	arg_2_0.Container:addElement(arg_2_2.widget)
	LUI.TextChat.SetupMenuForNoChat(arg_2_0)

	local var_2_1 = arg_2_2.primaryButtonText or "LUA_MENU/SELECT"

	local function var_2_2(arg_5_0, arg_5_1)
		arg_5_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
		arg_5_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC(var_2_1)
		})
	end

	arg_2_0:addEventHandler("menu_create", var_2_2)
	ACTIONS.AnimateSequence(arg_2_0, arg_2_0._flyInState)

	arg_2_0.isQuickAccessShortcutsDisabled = arg_2_2.disableQuickAccessShortcuts == nil or arg_2_2.disableQuickAccessShortcuts

	arg_2_0:registerEventHandler("opening_quick_access_menu", function(arg_6_0, arg_6_1)
		ACTIONS.LeaveMenu(arg_6_0)
	end)

	local var_2_3 = LUI.UIBindButton.new()

	var_2_3.id = "selfBindButton"

	arg_2_0:addElement(var_2_3)

	arg_2_0.bindButton = var_2_3

	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if arg_2_2.backButtonOverride then
			arg_2_2.backButtonOverride(arg_7_0, arg_7_1)
		elseif arg_2_0.widget.backButtonOverride then
			arg_2_0.widget.backButtonOverride(arg_7_0, arg_7_1)
		end

		if not var_2_0 then
			if not arg_7_1.controller then
				local var_7_0 = arg_2_1
			end

			arg_2_0:exitAnimation(arg_2_0, arg_2_2)

			var_2_0 = true
		end
	end)
	arg_2_0.MouseTrapBacking:SetHandleMouse(true)
	arg_2_0.MouseTrapBacking:addEventHandler("leftmouseup", function(arg_8_0, arg_8_1)
		if arg_2_2.closePopupOverride then
			arg_2_2.closePopupOverride(arg_8_0, arg_8_1)
		end

		arg_2_0:exitAnimation(arg_2_0, arg_2_2)
		arg_2_0.MouseTrapBacking:SetHandleMouse(false)
	end)

	if arg_2_2.quickCloseEvent then
		arg_2_0:addEventHandler(arg_2_2.quickCloseEvent, function(arg_9_0, arg_9_1)
			arg_9_0:exitAnimation(arg_9_0, arg_2_2)
		end)
	end

	arg_2_0.BG:SetHandleMouse(true)
	assert(arg_2_0.Gradient)
	assert(arg_2_0.Darken)
	ACTIONS.ScaleFullscreen(arg_2_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.Gradient)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.PanelGradient)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
end

function FlyInPopup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "FlyInPopup"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Darken"

	var_10_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_10_4:SetAlpha(0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Darken = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "Gradient"

	var_10_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_10_6:SetAlpha(0, 0)
	var_10_6:SetPixelGridEnabled(true)
	var_10_6:SetPixelGridContrast(0.2, 0)
	var_10_6:SetPixelGridBlockWidth(2, 0)
	var_10_6:SetPixelGridBlockHeight(2, 0)
	var_10_6:SetPixelGridGutterWidth(1, 0)
	var_10_6:SetPixelGridGutterHeight(1, 0)
	var_10_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_10_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 515, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.Gradient = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "MouseTrapBacking"

	var_10_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_10_8:SetAlpha(0, 0)
	var_10_8:SetPixelGridEnabled(true)
	var_10_8:SetPixelGridContrast(0.2, 0)
	var_10_8:SetPixelGridBlockWidth(2, 0)
	var_10_8:SetPixelGridBlockHeight(2, 0)
	var_10_8:SetPixelGridGutterWidth(1, 0)
	var_10_8:SetPixelGridGutterHeight(1, 0)
	var_10_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_10_0:addElement(var_10_8)

	var_10_0.MouseTrapBacking = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "BG"

	var_10_10:SetRGBFromInt(0, 0)
	var_10_10:SetAlpha(0.9, 0)
	var_10_10:SetPixelGridEnabled(true)
	var_10_10:SetPixelGridContrast(0.2, 0)
	var_10_10:SetPixelGridBlockWidth(2, 0)
	var_10_10:SetPixelGridBlockHeight(2, 0)
	var_10_10:SetPixelGridGutterWidth(1, 0)
	var_10_10:SetPixelGridGutterHeight(1, 0)
	var_10_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -825, 0, 0, 0)
	var_10_0:addElement(var_10_10)

	var_10_0.BG = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "PanelGradient"

	var_10_12:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_10_12:SetAlpha(0.5, 0)
	var_10_12:setImage(RegisterMaterial("panel_gradient"), 0)
	var_10_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -32, 0, 0, 0)
	var_10_0:addElement(var_10_12)

	var_10_0.PanelGradient = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("FlyInPopupContainer", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "Container"

	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -825, 0, 0, _1080p * 1080)
	var_10_0:addElement(var_10_14)

	var_10_0.Container = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "ButtonHelperBar"

	var_10_16.Background:SetAlpha(0, 0)
	var_10_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -825, 0, _1080p * -60, 0)
	var_10_0:addElement(var_10_16)

	var_10_0.ButtonHelperBar = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIImage.new()

	var_10_18.id = "Backer"

	var_10_18:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_10_18:SetAlpha(0.9, 0)
	var_10_18:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2203, _1080p * 1041, _1080p * 463, _1080p * -168)
	var_10_0:addElement(var_10_18)

	var_10_0.Backer = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIImage.new()

	var_10_20.id = "TextureLayer"

	var_10_20:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_10_20:SetAlpha(0.1, 0)
	var_10_20:SetPixelGridEnabled(true)
	var_10_20:SetPixelGridContrast(0.8, 0)
	var_10_20:SetPixelGridBlockWidth(2, 0)
	var_10_20:SetPixelGridBlockHeight(2, 0)
	var_10_20:SetPixelGridGutterWidth(1, 0)
	var_10_20:SetPixelGridGutterHeight(1, 0)
	var_10_20:setImage(RegisterMaterial("ui_default_white"), 0)
	var_10_20:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2203, _1080p * 1041, _1080p * 463, _1080p * -168)
	var_10_0:addElement(var_10_20)

	var_10_0.TextureLayer = var_10_20

	local function var_10_21()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_21

	local var_10_22
	local var_10_23 = {
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

	var_10_4:RegisterAnimationSequence("FlyInLeft", var_10_23)

	local var_10_24 = {
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

	var_10_6:RegisterAnimationSequence("FlyInLeft", var_10_24)

	local var_10_25 = {
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

	var_10_10:RegisterAnimationSequence("FlyInLeft", var_10_25)

	local var_10_26 = {
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

	var_10_12:RegisterAnimationSequence("FlyInLeft", var_10_26)

	local var_10_27 = {
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

	var_10_14:RegisterAnimationSequence("FlyInLeft", var_10_27)

	local var_10_28 = {
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

	var_10_16:RegisterAnimationSequence("FlyInLeft", var_10_28)

	local function var_10_29()
		var_10_4:AnimateSequence("FlyInLeft")
		var_10_6:AnimateSequence("FlyInLeft")
		var_10_10:AnimateSequence("FlyInLeft")
		var_10_12:AnimateSequence("FlyInLeft")
		var_10_14:AnimateSequence("FlyInLeft")
		var_10_16:AnimateSequence("FlyInLeft")
	end

	var_10_0._sequences.FlyInLeft = var_10_29

	local var_10_30
	local var_10_31 = {
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

	var_10_4:RegisterAnimationSequence("FlyInRight", var_10_31)

	local var_10_32 = {
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

	var_10_6:RegisterAnimationSequence("FlyInRight", var_10_32)

	local var_10_33 = {
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

	var_10_10:RegisterAnimationSequence("FlyInRight", var_10_33)

	local var_10_34 = {
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

	var_10_12:RegisterAnimationSequence("FlyInRight", var_10_34)

	local var_10_35 = {
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

	var_10_14:RegisterAnimationSequence("FlyInRight", var_10_35)

	local var_10_36 = {
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

	var_10_16:RegisterAnimationSequence("FlyInRight", var_10_36)

	local function var_10_37()
		var_10_4:AnimateSequence("FlyInRight")
		var_10_6:AnimateSequence("FlyInRight")
		var_10_10:AnimateSequence("FlyInRight")
		var_10_12:AnimateSequence("FlyInRight")
		var_10_14:AnimateSequence("FlyInRight")
		var_10_16:AnimateSequence("FlyInRight")
	end

	var_10_0._sequences.FlyInRight = var_10_37

	local var_10_38
	local var_10_39 = {
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

	var_10_4:RegisterAnimationSequence("FlyInLeftNarrow", var_10_39)

	local var_10_40 = {
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

	var_10_6:RegisterAnimationSequence("FlyInLeftNarrow", var_10_40)

	local var_10_41 = {
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

	var_10_10:RegisterAnimationSequence("FlyInLeftNarrow", var_10_41)

	local var_10_42 = {
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

	var_10_12:RegisterAnimationSequence("FlyInLeftNarrow", var_10_42)

	local var_10_43 = {
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

	var_10_14:RegisterAnimationSequence("FlyInLeftNarrow", var_10_43)

	local var_10_44 = {
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

	var_10_16:RegisterAnimationSequence("FlyInLeftNarrow", var_10_44)

	local function var_10_45()
		var_10_4:AnimateSequence("FlyInLeftNarrow")
		var_10_6:AnimateSequence("FlyInLeftNarrow")
		var_10_10:AnimateSequence("FlyInLeftNarrow")
		var_10_12:AnimateSequence("FlyInLeftNarrow")
		var_10_14:AnimateSequence("FlyInLeftNarrow")
		var_10_16:AnimateSequence("FlyInLeftNarrow")
	end

	var_10_0._sequences.FlyInLeftNarrow = var_10_45

	local var_10_46
	local var_10_47 = {
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

	var_10_4:RegisterAnimationSequence("FlyOutLeft", var_10_47)

	local var_10_48 = {
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

	var_10_6:RegisterAnimationSequence("FlyOutLeft", var_10_48)

	local var_10_49 = {
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

	var_10_10:RegisterAnimationSequence("FlyOutLeft", var_10_49)

	local var_10_50 = {
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

	var_10_12:RegisterAnimationSequence("FlyOutLeft", var_10_50)

	local var_10_51 = {
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

	var_10_14:RegisterAnimationSequence("FlyOutLeft", var_10_51)

	local var_10_52 = {
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

	var_10_16:RegisterAnimationSequence("FlyOutLeft", var_10_52)

	local function var_10_53()
		var_10_4:AnimateSequence("FlyOutLeft")
		var_10_6:AnimateSequence("FlyOutLeft")
		var_10_10:AnimateSequence("FlyOutLeft")
		var_10_12:AnimateSequence("FlyOutLeft")
		var_10_14:AnimateSequence("FlyOutLeft")
		var_10_16:AnimateSequence("FlyOutLeft")
	end

	var_10_0._sequences.FlyOutLeft = var_10_53

	local var_10_54
	local var_10_55 = {
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

	var_10_4:RegisterAnimationSequence("FlyOutRight", var_10_55)

	local var_10_56 = {
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

	var_10_6:RegisterAnimationSequence("FlyOutRight", var_10_56)

	local var_10_57 = {
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

	var_10_10:RegisterAnimationSequence("FlyOutRight", var_10_57)

	local var_10_58 = {
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

	var_10_12:RegisterAnimationSequence("FlyOutRight", var_10_58)

	local var_10_59 = {
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

	var_10_14:RegisterAnimationSequence("FlyOutRight", var_10_59)

	local var_10_60 = {
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

	var_10_16:RegisterAnimationSequence("FlyOutRight", var_10_60)

	local function var_10_61()
		var_10_4:AnimateSequence("FlyOutRight")
		var_10_6:AnimateSequence("FlyOutRight")
		var_10_10:AnimateSequence("FlyOutRight")
		var_10_12:AnimateSequence("FlyOutRight")
		var_10_14:AnimateSequence("FlyOutRight")
		var_10_16:AnimateSequence("FlyOutRight")
	end

	var_10_0._sequences.FlyOutRight = var_10_61

	local var_10_62
	local var_10_63 = {
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

	var_10_4:RegisterAnimationSequence("FlyOutLeftNarrow", var_10_63)

	local var_10_64 = {
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

	var_10_6:RegisterAnimationSequence("FlyOutLeftNarrow", var_10_64)

	local var_10_65 = {
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

	var_10_10:RegisterAnimationSequence("FlyOutLeftNarrow", var_10_65)

	local var_10_66 = {
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

	var_10_12:RegisterAnimationSequence("FlyOutLeftNarrow", var_10_66)

	local var_10_67 = {
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

	var_10_14:RegisterAnimationSequence("FlyOutLeftNarrow", var_10_67)

	local var_10_68 = {
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

	var_10_16:RegisterAnimationSequence("FlyOutLeftNarrow", var_10_68)

	local function var_10_69()
		var_10_4:AnimateSequence("FlyOutLeftNarrow")
		var_10_6:AnimateSequence("FlyOutLeftNarrow")
		var_10_10:AnimateSequence("FlyOutLeftNarrow")
		var_10_12:AnimateSequence("FlyOutLeftNarrow")
		var_10_14:AnimateSequence("FlyOutLeftNarrow")
		var_10_16:AnimateSequence("FlyOutLeftNarrow")
	end

	var_10_0._sequences.FlyOutLeftNarrow = var_10_69

	PostLoadFunc(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("FlyInPopup", FlyInPopup)
LockTable(_M)
