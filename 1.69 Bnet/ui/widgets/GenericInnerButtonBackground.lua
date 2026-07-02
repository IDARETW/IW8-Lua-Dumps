module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericInnerButtonBackground(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 57 * _1080p, 0, 36 * _1080p)

	var_2_0.id = "GenericInnerButtonBackground"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_2_4:SetAlpha(0, 0)
	var_2_4:setImage(RegisterMaterial("inner_button_background"), 0)
	var_2_4:Setup9SliceImage(_1080p * 8, _1080p * 8, 0.33, 0.33)
	var_2_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local function var_2_5()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_5

	local var_2_6
	local var_2_7 = {
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
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_2_4:RegisterAnimationSequence("GainFocus", var_2_7)

	local function var_2_8()
		var_2_4:AnimateSequence("GainFocus")
	end

	var_2_0._sequences.GainFocus = var_2_8

	local var_2_9
	local var_2_10 = {
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_2_4:RegisterAnimationSequence("LoseFocus", var_2_10)

	local function var_2_11()
		var_2_4:AnimateSequence("LoseFocus")
	end

	var_2_0._sequences.LoseFocus = var_2_11

	local var_2_12
	local var_2_13 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_2_4:RegisterAnimationSequence("Binding", var_2_13)

	local function var_2_14()
		var_2_4:AnimateSequence("Binding")
	end

	var_2_0._sequences.Binding = var_2_14

	local var_2_15
	local var_2_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipSetup", var_2_16)

	local function var_2_17()
		var_2_4:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_17

	local var_2_18
	local var_2_19 = {
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
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipGainFocus", var_2_19)

	local function var_2_20()
		var_2_4:AnimateSequence("WZWipGainFocus")
	end

	var_2_0._sequences.WZWipGainFocus = var_2_20

	local var_2_21
	local var_2_22 = {
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipLoseFocus", var_2_22)

	local function var_2_23()
		var_2_4:AnimateSequence("WZWipLoseFocus")
	end

	var_2_0._sequences.WZWipLoseFocus = var_2_23

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GenericInnerButtonBackground", GenericInnerButtonBackground)
LockTable(_M)
