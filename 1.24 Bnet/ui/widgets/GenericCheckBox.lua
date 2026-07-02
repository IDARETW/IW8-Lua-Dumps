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
		if not arg_4_1.controller then
			local var_4_0 = arg_3_1
		end

		if arg_4_1.snap then
			ACTIONS.AnimateSequence(arg_3_0, "UpSnap")
		else
			ACTIONS.AnimateSequence(arg_3_0, "Up")
		end
	end)

	arg_3_0._widgetInitialized = true
end

function GenericCheckBox(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p)

	var_5_0.id = "GenericCheckBox"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "TextGlow"

	var_5_4:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
	var_5_4:SetAlpha(0, 0)
	var_5_4:SetPixelGridEnabled(true)
	var_5_4:SetPixelGridContrast(0.5, 0)
	var_5_4:SetPixelGridBlockWidth(2, 0)
	var_5_4:SetPixelGridBlockHeight(2, 0)
	var_5_4:SetPixelGridGutterWidth(1, 0)
	var_5_4:SetPixelGridGutterHeight(1, 0)
	var_5_4.Glow:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -18, _1080p * 18, _1080p * -3, _1080p * 3)
	var_5_0:addElement(var_5_4)

	var_5_0.TextGlow = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Backer"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Backer = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "TextureLayer"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_8:SetAlpha(0.1, 0)
	var_5_8:SetPixelGridEnabled(true)
	var_5_8:SetPixelGridContrast(0.8, 0)
	var_5_8:SetPixelGridBlockWidth(2, 0)
	var_5_8:SetPixelGridBlockHeight(2, 0)
	var_5_8:SetPixelGridGutterWidth(1, 0)
	var_5_8:SetPixelGridGutterHeight(1, 0)
	var_5_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_5_0:addElement(var_5_8)

	var_5_0.TextureLayer = var_5_8

	local var_5_9
	local var_5_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_5_11 = LUI.UIBorder.new(var_5_10)

	var_5_11.id = "Frame"

	var_5_11:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_0:addElement(var_5_11)

	var_5_0.Frame = var_5_11

	local var_5_12
	local var_5_13 = LUI.UIImage.new()

	var_5_13.id = "Fill"

	var_5_13:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_13:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_5_0:addElement(var_5_13)

	var_5_0.Fill = var_5_13

	local var_5_14
	local var_5_15 = LUI.UIImage.new()

	var_5_15.id = "Glow"

	var_5_15:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_5_15:SetAlpha(0, 0)
	var_5_15:SetPixelGridEnabled(true)
	var_5_15:SetPixelGridContrast(0.5, 0)
	var_5_15:SetPixelGridBlockWidth(2, 0)
	var_5_15:SetPixelGridBlockHeight(2, 0)
	var_5_15:SetPixelGridGutterWidth(1, 0)
	var_5_15:SetPixelGridGutterHeight(1, 0)
	var_5_15:setImage(RegisterMaterial("button_glow"), 0)
	var_5_15:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_5_15:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_5_0:addElement(var_5_15)

	var_5_0.Glow = var_5_15

	local function var_5_16()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_16

	local var_5_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_13:RegisterAnimationSequence("Enabled", var_5_17)

	local function var_5_18()
		var_5_13:AnimateSequence("Enabled")
	end

	var_5_0._sequences.Enabled = var_5_18

	local var_5_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_13:RegisterAnimationSequence("Disabled", var_5_19)

	local function var_5_20()
		var_5_13:AnimateSequence("Disabled")
	end

	var_5_0._sequences.Disabled = var_5_20

	local var_5_21 = {
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Over", var_5_21)

	local var_5_22 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Over", var_5_22)

	local var_5_23 = {
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

	var_5_8:RegisterAnimationSequence("Over", var_5_23)

	local var_5_24 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_11:RegisterAnimationSequence("Over", var_5_24)

	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_13:RegisterAnimationSequence("Over", var_5_25)

	local var_5_26 = {
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_15:RegisterAnimationSequence("Over", var_5_26)

	local function var_5_27()
		var_5_4:AnimateSequence("Over")
		var_5_6:AnimateSequence("Over")
		var_5_8:AnimateSequence("Over")
		var_5_11:AnimateSequence("Over")
		var_5_13:AnimateSequence("Over")
		var_5_15:AnimateSequence("Over")
	end

	var_5_0._sequences.Over = var_5_27

	local var_5_28 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Up", var_5_28)

	local var_5_29 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Up", var_5_29)

	local var_5_30 = {
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

	var_5_8:RegisterAnimationSequence("Up", var_5_30)

	local var_5_31 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_11:RegisterAnimationSequence("Up", var_5_31)

	local var_5_32 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_13:RegisterAnimationSequence("Up", var_5_32)

	local var_5_33 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_15:RegisterAnimationSequence("Up", var_5_33)

	local function var_5_34()
		var_5_4:AnimateSequence("Up")
		var_5_6:AnimateSequence("Up")
		var_5_8:AnimateSequence("Up")
		var_5_11:AnimateSequence("Up")
		var_5_13:AnimateSequence("Up")
		var_5_15:AnimateSequence("Up")
	end

	var_5_0._sequences.Up = var_5_34

	local var_5_35 = {
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

	var_5_13:RegisterAnimationSequence("Check", var_5_35)

	local function var_5_36()
		var_5_13:AnimateSequence("Check")
	end

	var_5_0._sequences.Check = var_5_36

	local var_5_37 = {
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

	var_5_13:RegisterAnimationSequence("UnCheck", var_5_37)

	local function var_5_38()
		var_5_13:AnimateSequence("UnCheck")
	end

	var_5_0._sequences.UnCheck = var_5_38

	local var_5_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("UpSnap", var_5_39)

	local var_5_40 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("UpSnap", var_5_40)

	local var_5_41 = {
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

	var_5_8:RegisterAnimationSequence("UpSnap", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_11:RegisterAnimationSequence("UpSnap", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_13:RegisterAnimationSequence("UpSnap", var_5_43)

	local var_5_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_15:RegisterAnimationSequence("UpSnap", var_5_44)

	local function var_5_45()
		var_5_4:AnimateSequence("UpSnap")
		var_5_6:AnimateSequence("UpSnap")
		var_5_8:AnimateSequence("UpSnap")
		var_5_11:AnimateSequence("UpSnap")
		var_5_13:AnimateSequence("UpSnap")
		var_5_15:AnimateSequence("UpSnap")
	end

	var_5_0._sequences.UpSnap = var_5_45

	var_5_0:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "Over")
	end)
	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("GenericCheckBox", GenericCheckBox)
LockTable(_M)
