module(..., package.seeall)

function BillboardArrow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 359 * _1080p, 0, 580 * _1080p)

	var_1_0.id = "BillboardArrow"
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

	var_1_4.id = "Gradient"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.5, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -3, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Gradient = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "CircularGradient"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_6:SetAlpha(0, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.5, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_6:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -206, _1080p * 206, _1080p * -42, _1080p * 42)
	var_1_0:addElement(var_1_6)

	var_1_0.CircularGradient = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Arrow"

	var_1_8:SetAlpha(0, 0)
	var_1_8:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -10, _1080p * 106, _1080p * -58, _1080p * 58)
	var_1_0:addElement(var_1_8)

	var_1_0.Arrow = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10 = {
		{
			value = 1329516,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("GainFocus", var_1_10)

	local var_1_11 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("GainFocus", var_1_11)

	local var_1_12 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 110
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0.9,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("GainFocus", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("GainFocus")
		var_1_6:AnimateSequence("GainFocus")
		var_1_8:AnimateSequence("GainFocus")
	end

	var_1_0._sequences.GainFocus = var_1_13

	local var_1_14 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("LoseFocus", var_1_14)

	local var_1_15 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("LoseFocus", var_1_15)

	local var_1_16 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 116
		}
	}

	var_1_8:RegisterAnimationSequence("LoseFocus", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("LoseFocus")
		var_1_6:AnimateSequence("LoseFocus")
		var_1_8:AnimateSequence("LoseFocus")
	end

	var_1_0._sequences.LoseFocus = var_1_17

	local var_1_18 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_18)

	local var_1_19 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 116
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_19)

	local function var_1_20()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_8:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_20

	local var_1_21 = {
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_21)

	local var_1_22 = {
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 116
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 106
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -10
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_8:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_23

	var_1_0:addEventHandler("gain_focus", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "GainFocus")
	end)
	var_1_0:addEventHandler("lose_focus", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "LoseFocus")
	end)
	var_1_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)

	return var_1_0
end

MenuBuilder.registerType("BillboardArrow", BillboardArrow)
LockTable(_M)
