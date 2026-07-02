module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.value
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.value ~= arg_2_1 then
		if arg_2_1 == true then
			ACTIONS.AnimateSequence(arg_2_0, (not arg_2_0._widgetInitialized or arg_2_2) and "Enabled" or "Check")
		else
			ACTIONS.AnimateSequence(arg_2_0, (not arg_2_0._widgetInitialized or arg_2_2) and "Disabled" or "UnCheck")
		end

		arg_2_0.value = arg_2_1
	end

	if arg_2_0.callbackFunc then
		arg_2_0.callbackFunc(arg_2_0.value)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.GetValue = var_0_0
	arg_3_0.SetValue = var_0_1

	if arg_3_2.defaultValue then
		var_0_1(arg_3_0, arg_3_2.defaultValue)
	else
		var_0_1(arg_3_0, false)
	end

	arg_3_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "Up", {
			doSnapToState = arg_4_1.snap
		})
	end)
	arg_3_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "Over")
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end

	arg_3_0._widgetInitialized = true

	SEASONAL_EVENT.RegisterElementToModAnimEvent(arg_3_0)
end

function GenericCheckBox(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p)

	var_6_0.id = "GenericCheckBox"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3

	if CONDITIONS.IsWZWipDvarDisabled() then
		var_6_3 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
			controllerIndex = var_6_1
		})
		var_6_3.id = "TextGlow"

		var_6_3:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
		var_6_3:SetAlpha(0, 0)
		var_6_3:SetPixelGridEnabled(true)
		var_6_3:SetPixelGridContrast(0.5, 0)
		var_6_3:SetPixelGridBlockWidth(2, 0)
		var_6_3:SetPixelGridBlockHeight(2, 0)
		var_6_3:SetPixelGridGutterWidth(1, 0)
		var_6_3:SetPixelGridGutterHeight(1, 0)
		var_6_3.Glow:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
		var_6_3:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -18, _1080p * 18, _1080p * -3, _1080p * 3)
		var_6_0:addElement(var_6_3)

		var_6_0.TextGlow = var_6_3
	end

	local var_6_4

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_6_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
			controllerIndex = var_6_1
		})
		var_6_4.id = "WZWipTextGlow"

		var_6_4:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_6_4:SetAlpha(0, 0)
		var_6_4:SetPixelGridEnabled(true)
		var_6_4:SetPixelGridContrast(0.5, 0)
		var_6_4:SetPixelGridBlockWidth(2, 0)
		var_6_4:SetPixelGridBlockHeight(2, 0)
		var_6_4:SetPixelGridGutterWidth(1, 0)
		var_6_4:SetPixelGridGutterHeight(1, 0)
		var_6_4.Glow:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -18, _1080p * 18, _1080p * -3, _1080p * 3)
		var_6_0:addElement(var_6_4)

		var_6_0.WZWipTextGlow = var_6_4
	end

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Backer"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_6_6:SetAlpha(0.5, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.Backer = var_6_6

	local var_6_7

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_6_7 = LUI.UIImage.new()
		var_6_7.id = "TextureLayer"

		var_6_7:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
		var_6_7:SetAlpha(0.1, 0)
		var_6_7:SetPixelGridEnabled(true)
		var_6_7:SetPixelGridContrast(0.8, 0)
		var_6_7:SetPixelGridBlockWidth(2, 0)
		var_6_7:SetPixelGridBlockHeight(2, 0)
		var_6_7:SetPixelGridGutterWidth(1, 0)
		var_6_7:SetPixelGridGutterHeight(1, 0)
		var_6_7:setImage(RegisterMaterial("ui_default_white"), 0)
		var_6_0:addElement(var_6_7)

		var_6_0.TextureLayer = var_6_7
	end

	local var_6_8
	local var_6_9 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_10 = LUI.UIBorder.new(var_6_9)

	var_6_10.id = "Frame"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_0:addElement(var_6_10)

	var_6_0.Frame = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "Fill"

	var_6_12:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_12:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_6_12:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -1, _1080p * -1)
	var_6_0:addElement(var_6_12)

	var_6_0.Fill = var_6_12

	local var_6_13

	if CONDITIONS.IsWZWipDvarDisabled() then
		var_6_13 = LUI.UIImage.new()
		var_6_13.id = "Glow"

		var_6_13:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
		var_6_13:SetAlpha(0, 0)
		var_6_13:SetPixelGridEnabled(true)
		var_6_13:SetPixelGridContrast(0.5, 0)
		var_6_13:SetPixelGridBlockWidth(2, 0)
		var_6_13:SetPixelGridBlockHeight(2, 0)
		var_6_13:SetPixelGridGutterWidth(1, 0)
		var_6_13:SetPixelGridGutterHeight(1, 0)
		var_6_13:setImage(RegisterMaterial("button_glow"), 0)
		var_6_13:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
		var_6_13:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
		var_6_0:addElement(var_6_13)

		var_6_0.Glow = var_6_13
	end

	local var_6_14

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_6_14 = LUI.UIImage.new()
		var_6_14.id = "WZWipGlow"

		var_6_14:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_6_14:SetAlpha(0, 0)
		var_6_14:setImage(RegisterMaterial("button_glow"), 0)
		var_6_14:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
		var_6_14:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
		var_6_0:addElement(var_6_14)

		var_6_0.WZWipGlow = var_6_14
	end

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "Lock"

	var_6_16:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_6_16:SetAlpha(0, 0)
	var_6_16:setImage(RegisterMaterial("battlepass_lock"), 0)
	var_6_0:addElement(var_6_16)

	var_6_0.Lock = var_6_16

	local function var_6_17()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_17

	local var_6_18
	local var_6_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Enabled", var_6_19)

	local function var_6_20()
		var_6_12:AnimateSequence("Enabled")
	end

	var_6_0._sequences.Enabled = var_6_20

	local var_6_21
	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Disabled", var_6_22)

	local function var_6_23()
		var_6_12:AnimateSequence("Disabled")
	end

	var_6_0._sequences.Disabled = var_6_23

	local var_6_24

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_6_25 = {
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_3:RegisterAnimationSequence("Over", var_6_25)
	end

	local var_6_26 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Over", var_6_26)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_27 = {
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

		var_6_7:RegisterAnimationSequence("Over", var_6_27)
	end

	local var_6_28 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_10:RegisterAnimationSequence("Over", var_6_28)

	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_12:RegisterAnimationSequence("Over", var_6_29)

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_6_30 = {
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_13:RegisterAnimationSequence("Over", var_6_30)
	end

	local function var_6_31()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_6_3:AnimateSequence("Over")
		end

		var_6_6:AnimateSequence("Over")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_6_7:AnimateSequence("Over")
		end

		var_6_10:AnimateSequence("Over")
		var_6_12:AnimateSequence("Over")

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_6_13:AnimateSequence("Over")
		end
	end

	var_6_0._sequences.Over = var_6_31

	local var_6_32

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_6_33 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_3:RegisterAnimationSequence("Up", var_6_33)
	end

	local var_6_34 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Up", var_6_34)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_35 = {
			{
				value = 0.1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDefault
			}
		}

		var_6_7:RegisterAnimationSequence("Up", var_6_35)
	end

	local var_6_36 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_10:RegisterAnimationSequence("Up", var_6_36)

	local var_6_37 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_12:RegisterAnimationSequence("Up", var_6_37)

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_6_38 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_13:RegisterAnimationSequence("Up", var_6_38)
	end

	local function var_6_39()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_6_3:AnimateSequence("Up")
		end

		var_6_6:AnimateSequence("Up")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_6_7:AnimateSequence("Up")
		end

		var_6_10:AnimateSequence("Up")
		var_6_12:AnimateSequence("Up")

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_6_13:AnimateSequence("Up")
		end
	end

	var_6_0._sequences.Up = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 140,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_6_12:RegisterAnimationSequence("Check", var_6_41)

	local function var_6_42()
		var_6_12:AnimateSequence("Check")
	end

	var_6_0._sequences.Check = var_6_42

	local var_6_43
	local var_6_44 = {
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.4,
			duration = 40,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_6_12:RegisterAnimationSequence("UnCheck", var_6_44)

	local function var_6_45()
		var_6_12:AnimateSequence("UnCheck")
	end

	var_6_0._sequences.UnCheck = var_6_45

	local var_6_46

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_6_47 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_3:RegisterAnimationSequence("UpSnap", var_6_47)
	end

	local var_6_48 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("UpSnap", var_6_48)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_49 = {
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDefault
			}
		}

		var_6_7:RegisterAnimationSequence("UpSnap", var_6_49)
	end

	local var_6_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_10:RegisterAnimationSequence("UpSnap", var_6_50)

	local var_6_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_12:RegisterAnimationSequence("UpSnap", var_6_51)

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_6_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_13:RegisterAnimationSequence("UpSnap", var_6_52)
	end

	local function var_6_53()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_6_3:AnimateSequence("UpSnap")
		end

		var_6_6:AnimateSequence("UpSnap")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_6_7:AnimateSequence("UpSnap")
		end

		var_6_10:AnimateSequence("UpSnap")
		var_6_12:AnimateSequence("UpSnap")

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_6_13:AnimateSequence("UpSnap")
		end
	end

	var_6_0._sequences.UpSnap = var_6_53

	local var_6_54
	local var_6_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("CheckInstant", var_6_55)

	local var_6_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("CheckInstant", var_6_56)

	local function var_6_57()
		var_6_12:AnimateSequence("CheckInstant")
		var_6_16:AnimateSequence("CheckInstant")
	end

	var_6_0._sequences.CheckInstant = var_6_57

	local var_6_58
	local var_6_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("UnCheckInstant", var_6_59)

	local var_6_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("UnCheckInstant", var_6_60)

	local function var_6_61()
		var_6_12:AnimateSequence("UnCheckInstant")
		var_6_16:AnimateSequence("UnCheckInstant")
	end

	var_6_0._sequences.UnCheckInstant = var_6_61

	local var_6_62

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_6_63 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText,
				child = var_6_0.TextGlow.Glow
			}
		}

		var_6_3:RegisterAnimationSequence("WZWipSetup", var_6_63)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_64 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_4:RegisterAnimationSequence("WZWipSetup", var_6_64)
	end

	local var_6_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipSetup", var_6_65)

	local var_6_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_6_12:RegisterAnimationSequence("WZWipSetup", var_6_66)

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_6_67 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZGenericText
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_13:RegisterAnimationSequence("WZWipSetup", var_6_67)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_68 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_14:RegisterAnimationSequence("WZWipSetup", var_6_68)
	end

	local function var_6_69()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_6_3:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_6_4:AnimateSequence("WZWipSetup")
		end

		var_6_10:AnimateSequence("WZWipSetup")
		var_6_12:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_6_13:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_6_14:AnimateSequence("WZWipSetup")
		end
	end

	var_6_0._sequences.WZWipSetup = var_6_69

	local var_6_70

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_71 = {
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_4:RegisterAnimationSequence("WZWipOver", var_6_71)
	end

	local var_6_72 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipOver", var_6_72)

	local var_6_73 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipOver", var_6_73)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_74 = {
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_14:RegisterAnimationSequence("WZWipOver", var_6_74)
	end

	local function var_6_75()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_6_4:AnimateSequence("WZWipOver")
		end

		var_6_6:AnimateSequence("WZWipOver")
		var_6_10:AnimateSequence("WZWipOver")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_6_14:AnimateSequence("WZWipOver")
		end
	end

	var_6_0._sequences.WZWipOver = var_6_75

	local var_6_76

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_77 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_4:RegisterAnimationSequence("WZWipUp", var_6_77)
	end

	local var_6_78 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipUp", var_6_78)

	local var_6_79 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipUp", var_6_79)

	local var_6_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_6_12:RegisterAnimationSequence("WZWipUp", var_6_80)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_81 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_14:RegisterAnimationSequence("WZWipUp", var_6_81)
	end

	local function var_6_82()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_6_4:AnimateSequence("WZWipUp")
		end

		var_6_6:AnimateSequence("WZWipUp")
		var_6_10:AnimateSequence("WZWipUp")
		var_6_12:AnimateSequence("WZWipUp")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_6_14:AnimateSequence("WZWipUp")
		end
	end

	var_6_0._sequences.WZWipUp = var_6_82

	local var_6_83

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_84 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_4:RegisterAnimationSequence("WZWipUpSnap", var_6_84)
	end

	local var_6_85 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipUpSnap", var_6_85)

	local var_6_86 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipUpSnap", var_6_86)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_6_87 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_14:RegisterAnimationSequence("WZWipUpSnap", var_6_87)
	end

	local function var_6_88()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_6_4:AnimateSequence("WZWipUpSnap")
		end

		var_6_6:AnimateSequence("WZWipUpSnap")
		var_6_10:AnimateSequence("WZWipUpSnap")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_6_14:AnimateSequence("WZWipUpSnap")
		end
	end

	var_6_0._sequences.WZWipUpSnap = var_6_88

	local var_6_89
	local var_6_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_6_10:RegisterAnimationSequence("ModCW", var_6_90)

	local var_6_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_6_12:RegisterAnimationSequence("ModCW", var_6_91)

	local function var_6_92()
		var_6_10:AnimateSequence("ModCW")
		var_6_12:AnimateSequence("ModCW")
	end

	var_6_0._sequences.ModCW = var_6_92

	local var_6_93
	local var_6_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_6_10:RegisterAnimationSequence("ModWZ", var_6_94)

	local var_6_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_6_12:RegisterAnimationSequence("ModWZ", var_6_95)

	local function var_6_96()
		var_6_10:AnimateSequence("ModWZ")
		var_6_12:AnimateSequence("ModWZ")
	end

	var_6_0._sequences.ModWZ = var_6_96

	local var_6_97
	local var_6_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_6_10:RegisterAnimationSequence("ModVA", var_6_98)

	local var_6_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_6_12:RegisterAnimationSequence("ModVA", var_6_99)

	local function var_6_100()
		var_6_10:AnimateSequence("ModVA")
		var_6_12:AnimateSequence("ModVA")
	end

	var_6_0._sequences.ModVA = var_6_100

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GenericCheckBox", GenericCheckBox)
LockTable(_M)
