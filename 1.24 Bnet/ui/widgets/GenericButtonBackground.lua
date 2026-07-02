module(..., package.seeall)

function RefreshAnimation(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		if arg_1_2 then
			assert(arg_1_0._sequences and arg_1_0._sequences[arg_1_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
		end
	end
end

local function var_0_0(arg_2_0, arg_2_1)
	if not arg_2_0._textureLayerSet then
		if arg_2_1 == LUI.Alignment.Left or arg_2_1 == LUI.Alignment.Right then
			arg_2_0._gradientMaterial = "button_gradient"
		else
			arg_2_0._gradientMaterial = "widg_gradient_center_out"
		end

		arg_2_0.TextureLayer:setImage(RegisterMaterial(arg_2_0._gradientMaterial))

		arg_2_0._textureLayerSet = true
	end
end

function SetupButton(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = 80

	if arg_3_3 == LUI.Alignment.Left then
		arg_3_0.TextGlow:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -20, _1080p * 250, _1080p * -18, _1080p * 18)
	elseif arg_3_3 == LUI.Alignment.Right then
		arg_3_0.TextGlow:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -250, _1080p * 20, _1080p * -18, _1080p * 18)
	else
		arg_3_0.TextGlow:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -64, _1080p * 64, _1080p * -18, _1080p * 18)
	end

	var_0_0(arg_3_0, arg_3_3)

	if not arg_3_1.GetAutoScrollStyle or arg_3_1:GetAutoScrollStyle() ~= LUI.UIStyledText.AutoScrollStyle.ScrollH then
		LAYOUT.SetTextBoxSize(arg_3_1, arg_3_0.TextGlow, arg_3_2, var_3_0, nil, arg_3_3, 0, LUI.EASING.outQuadratic)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupButton = SetupButton
	arg_4_0._textureLayerSet = false
	arg_4_0._controllerIndex = arg_4_1

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		RefreshAnimation(arg_5_0, arg_4_0._wzTheme and "WZButtonOver" or "ButtonOver")
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, arg_4_0._wzTheme and "WZButtonUp" or "ButtonUp", arg_6_1.snap)
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonUpDisabled", arg_7_1.snap)
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		RefreshAnimation(arg_8_0, "ButtonOverDisabled")
	end)
	arg_4_0:addEventHandler("button_active", function(arg_9_0, arg_9_1)
		RefreshAnimation(arg_9_0, "ButtonUpActive")
	end)
	arg_4_0:addEventHandler("active", function(arg_10_0, arg_10_1)
		RefreshAnimation(arg_10_0, "Active")
	end)
	arg_4_0:addEventHandler("button_over_active", function(arg_11_0, arg_11_1)
		if LUI.IsLastInputMouseNavigation(arg_11_0._controllerIndex) then
			RefreshAnimation(arg_11_0, arg_4_0._wzTheme and "WZButtonOverActive" or "ButtonOverActive")
		else
			RefreshAnimation(arg_11_0, arg_4_0._wzTheme and "WZButtonOver" or "ButtonOver")
		end
	end)
	arg_4_0:addEventHandler("disable_active", function(arg_12_0, arg_12_1)
		RefreshAnimation(arg_12_0, "DisabledActive")
	end)
	arg_4_0:addEventHandler("button_disable_active", function(arg_13_0, arg_13_1)
		RefreshAnimation(arg_13_0, "ButtonUpDisabledActive")
	end)
	arg_4_0:addEventHandler("button_over_disable_active", function(arg_14_0, arg_14_1)
		if LUI.IsLastInputMouseNavigation(arg_14_0._controllerIndex) then
			RefreshAnimation(arg_14_0, "ButtonOverDisabledActive")
		else
			RefreshAnimation(arg_14_0, "ButtonOverDisabled")
		end
	end)
	arg_4_0:addEventHandler("binding", function(arg_15_0, arg_15_1)
		RefreshAnimation(arg_15_0, "Binding")
	end)

	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		arg_4_0:SetZRotation(180)
	end
end

function GenericButtonBackground(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 46 * _1080p)

	var_16_0.id = "GenericButtonBackground"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "TextGlow"

	var_16_4:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
	var_16_4:SetAlpha(0, 0)
	var_16_4:SetPixelGridEnabled(true)
	var_16_4:SetPixelGridContrast(0.5, 0)
	var_16_4:SetPixelGridBlockWidth(2, 0)
	var_16_4:SetPixelGridBlockHeight(2, 0)
	var_16_4:SetPixelGridGutterWidth(1, 0)
	var_16_4:SetPixelGridGutterHeight(1, 0)
	var_16_4:setImage(RegisterMaterial("button_glow_circle"), 0)
	var_16_4:Setup3SliceHorizontalImage(_1080p * 12, 0.1)
	var_16_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 97, _1080p * -2, _1080p * -16, _1080p * 16)
	var_16_0:addElement(var_16_4)

	var_16_0.TextGlow = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "Backer"

	var_16_6:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_16_6:SetAlpha(0.3, 0)
	var_16_0:addElement(var_16_6)

	var_16_0.Backer = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIImage.new()

	var_16_8.id = "TextureLayer"

	var_16_8:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_16_8:SetAlpha(0.1, 0)
	var_16_8:SetPixelGridEnabled(true)
	var_16_8:SetPixelGridContrast(0.8, 0)
	var_16_8:SetPixelGridBlockWidth(2, 0)
	var_16_8:SetPixelGridBlockHeight(2, 0)
	var_16_8:SetPixelGridGutterWidth(1, 0)
	var_16_8:SetPixelGridGutterHeight(1, 0)
	var_16_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_16_0:addElement(var_16_8)

	var_16_0.TextureLayer = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIImage.new()

	var_16_10.id = "Glow"

	var_16_10:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_16_10:SetAlpha(0, 0)
	var_16_10:SetPixelGridEnabled(true)
	var_16_10:SetPixelGridContrast(0.5, 0)
	var_16_10:SetPixelGridBlockWidth(2, 0)
	var_16_10:SetPixelGridBlockHeight(2, 0)
	var_16_10:SetPixelGridGutterWidth(1, 0)
	var_16_10:SetPixelGridGutterHeight(1, 0)
	var_16_10:setImage(RegisterMaterial("button_glow"), 0)
	var_16_10:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_16_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_16_0:addElement(var_16_10)

	var_16_0.Glow = var_16_10

	local var_16_11
	local var_16_12 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 0
	}
	local var_16_13 = LUI.UIBorder.new(var_16_12)

	var_16_13.id = "Border"

	var_16_13:SetBorderThicknessLeft(_1080p * 0, 0)
	var_16_13:SetBorderThicknessRight(_1080p * 0, 0)
	var_16_13:SetBorderThicknessTop(_1080p * 0, 0)
	var_16_13:SetBorderThicknessBottom(_1080p * 0, 0)
	var_16_0:addElement(var_16_13)

	var_16_0.Border = var_16_13

	local var_16_14
	local var_16_15 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		}
	}

	var_16_8:RegisterAnimationSequence("DefaultSequence", var_16_15)

	local function var_16_16()
		var_16_8:AnimateSequence("DefaultSequence")
	end

	var_16_0._sequences.DefaultSequence = var_16_16

	local var_16_17
	local var_16_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_16_4:RegisterAnimationSequence("ButtonOver", var_16_18)

	local var_16_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOver", var_16_19)

	local var_16_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOver", var_16_20)

	local var_16_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOver", var_16_21)

	local var_16_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonOver", var_16_22)

	local function var_16_23()
		var_16_4:AnimateSequence("ButtonOver")
		var_16_6:AnimateSequence("ButtonOver")
		var_16_8:AnimateSequence("ButtonOver")
		var_16_10:AnimateSequence("ButtonOver")
		var_16_13:AnimateSequence("ButtonOver")
	end

	var_16_0._sequences.ButtonOver = var_16_23

	local var_16_24
	local var_16_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("ButtonUp", var_16_25)

	local var_16_26 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUp", var_16_26)

	local var_16_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUp", var_16_27)

	local var_16_28 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUp", var_16_28)

	local var_16_29 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonUp", var_16_29)

	local function var_16_30()
		var_16_4:AnimateSequence("ButtonUp")
		var_16_6:AnimateSequence("ButtonUp")
		var_16_8:AnimateSequence("ButtonUp")
		var_16_10:AnimateSequence("ButtonUp")
		var_16_13:AnimateSequence("ButtonUp")
	end

	var_16_0._sequences.ButtonUp = var_16_30

	local function var_16_31()
		return
	end

	var_16_0._sequences.Locked = var_16_31

	local var_16_32
	local var_16_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		}
	}

	var_16_4:RegisterAnimationSequence("ButtonOverDisabled", var_16_33)

	local var_16_34 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverDisabled", var_16_34)

	local var_16_35 = {
		{
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOverDisabled", var_16_35)

	local var_16_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOverDisabled", var_16_36)

	local var_16_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonOverDisabled", var_16_37)

	local function var_16_38()
		var_16_4:AnimateSequence("ButtonOverDisabled")
		var_16_6:AnimateSequence("ButtonOverDisabled")
		var_16_8:AnimateSequence("ButtonOverDisabled")
		var_16_10:AnimateSequence("ButtonOverDisabled")
		var_16_13:AnimateSequence("ButtonOverDisabled")
	end

	var_16_0._sequences.ButtonOverDisabled = var_16_38

	local var_16_39
	local var_16_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		}
	}

	var_16_4:RegisterAnimationSequence("ButtonUpDisabled", var_16_40)

	local var_16_41 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpDisabled", var_16_41)

	local var_16_42 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabled", var_16_42)

	local var_16_43 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUpDisabled", var_16_43)

	local var_16_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonUpDisabled", var_16_44)

	local function var_16_45()
		var_16_4:AnimateSequence("ButtonUpDisabled")
		var_16_6:AnimateSequence("ButtonUpDisabled")
		var_16_8:AnimateSequence("ButtonUpDisabled")
		var_16_10:AnimateSequence("ButtonUpDisabled")
		var_16_13:AnimateSequence("ButtonUpDisabled")
	end

	var_16_0._sequences.ButtonUpDisabled = var_16_45

	local var_16_46
	local var_16_47 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_16_47)

	local var_16_48 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_16_48)

	local var_16_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUpDisabledSnap", var_16_49)

	local var_16_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonUpDisabledSnap", var_16_50)

	local function var_16_51()
		var_16_6:AnimateSequence("ButtonUpDisabledSnap")
		var_16_8:AnimateSequence("ButtonUpDisabledSnap")
		var_16_10:AnimateSequence("ButtonUpDisabledSnap")
		var_16_13:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_16_0._sequences.ButtonUpDisabledSnap = var_16_51

	local var_16_52
	local var_16_53 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.98,
			duration = 230,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.85,
			duration = 850,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuintic
		},
		{
			value = 0.78,
			duration = 1200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuartic
		},
		{
			value = 0.8,
			duration = 610,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuartic
		}
	}

	var_16_4:RegisterAnimationSequence("GlowAnim", var_16_53)

	local function var_16_54()
		var_16_4:AnimateLoop("GlowAnim")
	end

	var_16_0._sequences.GlowAnim = var_16_54

	local var_16_55
	local var_16_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("GlowStop", var_16_56)

	local function var_16_57()
		var_16_4:AnimateSequence("GlowStop")
	end

	var_16_0._sequences.GlowStop = var_16_57

	local var_16_58
	local var_16_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_16_4:RegisterAnimationSequence("Active", var_16_59)

	local var_16_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("Active", var_16_60)

	local var_16_61 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_8:RegisterAnimationSequence("Active", var_16_61)

	local var_16_62 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("Active", var_16_62)

	local var_16_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_13:RegisterAnimationSequence("Active", var_16_63)

	local function var_16_64()
		var_16_4:AnimateSequence("Active")
		var_16_6:AnimateSequence("Active")
		var_16_8:AnimateSequence("Active")
		var_16_10:AnimateSequence("Active")
		var_16_13:AnimateSequence("Active")
	end

	var_16_0._sequences.Active = var_16_64

	local var_16_65
	local var_16_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		},
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_16_4:RegisterAnimationSequence("ButtonOverActive", var_16_66)

	local var_16_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverActive", var_16_67)

	local var_16_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOverActive", var_16_68)

	local var_16_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOverActive", var_16_69)

	local function var_16_70()
		var_16_4:AnimateSequence("ButtonOverActive")
		var_16_6:AnimateSequence("ButtonOverActive")
		var_16_8:AnimateSequence("ButtonOverActive")
		var_16_10:AnimateSequence("ButtonOverActive")
	end

	var_16_0._sequences.ButtonOverActive = var_16_70

	local var_16_71
	local var_16_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("DisabledActive", var_16_72)

	local var_16_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("DisabledActive", var_16_73)

	local function var_16_74()
		var_16_10:AnimateSequence("DisabledActive")
		var_16_13:AnimateSequence("DisabledActive")
	end

	var_16_0._sequences.DisabledActive = var_16_74

	local var_16_75
	local var_16_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		}
	}

	var_16_4:RegisterAnimationSequence("ButtonOverDisabledActive", var_16_76)

	local var_16_77 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverDisabledActive", var_16_77)

	local var_16_78 = {
		{
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOverDisabledActive", var_16_78)

	local var_16_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		},
		{
			value = 0.75,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOverDisabledActive", var_16_79)

	local var_16_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonOverDisabledActive", var_16_80)

	local function var_16_81()
		var_16_4:AnimateSequence("ButtonOverDisabledActive")
		var_16_6:AnimateSequence("ButtonOverDisabledActive")
		var_16_8:AnimateSequence("ButtonOverDisabledActive")
		var_16_10:AnimateSequence("ButtonOverDisabledActive")
		var_16_13:AnimateSequence("ButtonOverDisabledActive")
	end

	var_16_0._sequences.ButtonOverDisabledActive = var_16_81

	local var_16_82
	local var_16_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabledActive", var_16_83)

	local var_16_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUpDisabledActive", var_16_84)

	local var_16_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.locked
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonUpDisabledActive", var_16_85)

	local function var_16_86()
		var_16_8:AnimateSequence("ButtonUpDisabledActive")
		var_16_10:AnimateSequence("ButtonUpDisabledActive")
		var_16_13:AnimateSequence("ButtonUpDisabledActive")
	end

	var_16_0._sequences.ButtonUpDisabledActive = var_16_86

	local var_16_87
	local var_16_88 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_16_4:RegisterAnimationSequence("Binding", var_16_88)

	local var_16_89 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_16_8:RegisterAnimationSequence("Binding", var_16_89)

	local var_16_90 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_16_10:RegisterAnimationSequence("Binding", var_16_90)

	local var_16_91 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("Binding", var_16_91)

	local function var_16_92()
		var_16_4:AnimateSequence("Binding")
		var_16_8:AnimateSequence("Binding")
		var_16_10:AnimateSequence("Binding")
		var_16_13:AnimateSequence("Binding")
	end

	var_16_0._sequences.Binding = var_16_92

	local var_16_93
	local var_16_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("ButtonUpSnap", var_16_94)

	local var_16_95 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpSnap", var_16_95)

	local var_16_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpSnap", var_16_96)

	local var_16_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUpSnap", var_16_97)

	local var_16_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonUpSnap", var_16_98)

	local function var_16_99()
		var_16_4:AnimateSequence("ButtonUpSnap")
		var_16_6:AnimateSequence("ButtonUpSnap")
		var_16_8:AnimateSequence("ButtonUpSnap")
		var_16_10:AnimateSequence("ButtonUpSnap")
		var_16_13:AnimateSequence("ButtonUpSnap")
	end

	var_16_0._sequences.ButtonUpSnap = var_16_99

	local var_16_100
	local var_16_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_16_4:RegisterAnimationSequence("ButtonUpActive", var_16_101)

	local var_16_102 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpActive", var_16_102)

	local var_16_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpActive", var_16_103)

	local var_16_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUpActive", var_16_104)

	local var_16_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_13:RegisterAnimationSequence("ButtonUpActive", var_16_105)

	local function var_16_106()
		var_16_4:AnimateSequence("ButtonUpActive")
		var_16_6:AnimateSequence("ButtonUpActive")
		var_16_8:AnimateSequence("ButtonUpActive")
		var_16_10:AnimateSequence("ButtonUpActive")
		var_16_13:AnimateSequence("ButtonUpActive")
	end

	var_16_0._sequences.ButtonUpActive = var_16_106

	local var_16_107
	local var_16_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_16_4:RegisterAnimationSequence("WZButtonOver", var_16_108)

	local var_16_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("WZButtonOver", var_16_109)

	local var_16_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow2
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZButtonOver", var_16_110)

	local var_16_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("WZButtonOver", var_16_111)

	local var_16_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow2
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneBackground
		}
	}

	var_16_13:RegisterAnimationSequence("WZButtonOver", var_16_112)

	local function var_16_113()
		var_16_4:AnimateSequence("WZButtonOver")
		var_16_6:AnimateSequence("WZButtonOver")
		var_16_8:AnimateSequence("WZButtonOver")
		var_16_10:AnimateSequence("WZButtonOver")
		var_16_13:AnimateSequence("WZButtonOver")
	end

	var_16_0._sequences.WZButtonOver = var_16_113

	local var_16_114
	local var_16_115 = {
		{
			duration = 140,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_16_4:RegisterAnimationSequence("WZButtonOverActive", var_16_115)

	local var_16_116 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("WZButtonOverActive", var_16_116)

	local var_16_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow2
		},
		{
			value = 0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_16_8:RegisterAnimationSequence("WZButtonOverActive", var_16_117)

	local var_16_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("WZButtonOverActive", var_16_118)

	local function var_16_119()
		var_16_4:AnimateSequence("WZButtonOverActive")
		var_16_6:AnimateSequence("WZButtonOverActive")
		var_16_8:AnimateSequence("WZButtonOverActive")
		var_16_10:AnimateSequence("WZButtonOverActive")
	end

	var_16_0._sequences.WZButtonOverActive = var_16_119

	local var_16_120
	local var_16_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("WZButtonUp", var_16_121)

	local var_16_122 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_16_6:RegisterAnimationSequence("WZButtonUp", var_16_122)

	local var_16_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_gradient")
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_16_8:RegisterAnimationSequence("WZButtonUp", var_16_123)

	local var_16_124 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("WZButtonUp", var_16_124)

	local var_16_125 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_16_13:RegisterAnimationSequence("WZButtonUp", var_16_125)

	local function var_16_126()
		var_16_4:AnimateSequence("WZButtonUp")
		var_16_6:AnimateSequence("WZButtonUp")
		var_16_8:AnimateSequence("WZButtonUp")
		var_16_10:AnimateSequence("WZButtonUp")
		var_16_13:AnimateSequence("WZButtonUp")
	end

	var_16_0._sequences.WZButtonUp = var_16_126

	var_16_0:addEventHandler("button_over", function(arg_37_0, arg_37_1)
		if not arg_37_1.controller then
			local var_37_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "GlowAnim")
	end)
	var_16_0:addEventHandler("button_up", function(arg_38_0, arg_38_1)
		if not arg_38_1.controller then
			local var_38_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "GlowStop")
	end)
	var_16_0:addEventHandler("button_over_disable", function(arg_39_0, arg_39_1)
		if not arg_39_1.controller then
			local var_39_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "GlowStop")
		ACTIONS.AnimateSequence(var_16_0, "ButtonOverDisabled")
	end)
	var_16_0:addEventHandler("button_disable", function(arg_40_0, arg_40_1)
		if not arg_40_1.controller then
			local var_40_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "GlowStop")
		ACTIONS.AnimateSequence(var_16_0, "ButtonUpDisabled")
	end)
	PostLoadFunc(var_16_0, var_16_1, arg_16_1)
	ACTIONS.AnimateSequence(var_16_0, "DefaultSequence")

	return var_16_0
end

MenuBuilder.registerType("GenericButtonBackground", GenericButtonBackground)
LockTable(_M)
