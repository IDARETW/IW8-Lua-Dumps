module(..., package.seeall)

function GenericInnerButtonBackground(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 57 * _1080p, 0, 36 * _1080p)

	var_1_0.id = "GenericInnerButtonBackground"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:setImage(RegisterMaterial("inner_button_background"), 0)
	var_1_4:Setup9SliceImage(_1080p * 8, _1080p * 8, 0.33, 0.33)
	var_1_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_4:RegisterAnimationSequence("DefaultSequence", var_1_5)

	local function var_1_6()
		var_1_4:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_6

	local var_1_7 = {
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

	var_1_4:RegisterAnimationSequence("GainFocus", var_1_7)

	local function var_1_8()
		var_1_4:AnimateSequence("GainFocus")
	end

	var_1_0._sequences.GainFocus = var_1_8

	local var_1_9 = {
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

	var_1_4:RegisterAnimationSequence("LoseFocus", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("LoseFocus")
	end

	var_1_0._sequences.LoseFocus = var_1_10

	local var_1_11 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_1_4:RegisterAnimationSequence("Binding", var_1_11)

	local function var_1_12()
		var_1_4:AnimateSequence("Binding")
	end

	var_1_0._sequences.Binding = var_1_12

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("GenericInnerButtonBackground", GenericInnerButtonBackground)
LockTable(_M)
