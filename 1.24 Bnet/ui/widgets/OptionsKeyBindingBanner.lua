module(..., package.seeall)

function OptionsKeyBindingBanner(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 60 * _1080p)

	var_1_0.id = "OptionsKeyBindingBanner"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "KeyBindingMessageBackground"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.KeyBindingMessageBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Text"

	var_1_6:SetAlpha(0, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("MENU/BINDING_SUCCESS"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -10, _1080p * 10)
	var_1_0:addElement(var_1_6)

	var_1_0.Text = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "TextCopy0"

	var_1_8:SetAlpha(0, 0)
	var_1_8:setText(Engine.CBBHFCGDIC("MENU/BINDING_SUCCESS"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -10, _1080p * 10)
	var_1_0:addElement(var_1_8)

	var_1_0.TextCopy0 = var_1_8

	local var_1_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.border
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("DefaultSequence", var_1_9)

	local var_1_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("DefaultSequence", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("DefaultSequence")
		var_1_6:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingBG
		},
		{
			value = 0.65,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.5,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Binding", var_1_12)

	local var_1_13 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Binding", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("Binding")
		var_1_6:AnimateSequence("Binding")
	end

	var_1_0._sequences.Binding = var_1_14

	local var_1_15 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingSuccessBG
		},
		{
			value = 0.65,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.5,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Success", var_1_15)

	local var_1_16 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Success", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("Success")
		var_1_6:AnimateSequence("Success")
	end

	var_1_0._sequences.Success = var_1_17

	local var_1_18 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingWarningBG
		},
		{
			value = 0.65,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.5,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Warning", var_1_18)

	local var_1_19 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Warning", var_1_19)

	local function var_1_20()
		var_1_4:AnimateSequence("Warning")
		var_1_6:AnimateSequence("Warning")
	end

	var_1_0._sequences.Warning = var_1_20

	local var_1_21 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingErrorBG
		},
		{
			value = 0.65,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.5,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.65,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Error", var_1_21)

	local var_1_22 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Error", var_1_22)

	local function var_1_23()
		var_1_4:AnimateLoop("Error")
		var_1_6:AnimateLoop("Error")
	end

	var_1_0._sequences.Error = var_1_23

	local var_1_24 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.border
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("BackToDefault", var_1_24)

	local var_1_25 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("BackToDefault", var_1_25)

	local function var_1_26()
		var_1_4:AnimateSequence("BackToDefault")
		var_1_6:AnimateSequence("BackToDefault")
	end

	var_1_0._sequences.BackToDefault = var_1_26

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("OptionsKeyBindingBanner", OptionsKeyBindingBanner)
LockTable(_M)
