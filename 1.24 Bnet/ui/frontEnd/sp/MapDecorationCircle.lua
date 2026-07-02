module(..., package.seeall)

local function var_0_0(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "Appear")

	arg_1_0:Wait(arg_1_0._transitionDuration).onComplete = function()
		ACTIONS.AnimateSequence(arg_1_0, "Pulse")
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.PlayAnim = var_0_0
	arg_3_0._transitionDuration = 500
	arg_3_0._isAnimating = false

	ACTIONS.AnimateSequence(arg_3_0, "Rotate")
end

function MapDecorationCircle(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_4_0.id = "MapDecorationCircle"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Circle"

	var_4_4:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_4:setImage(RegisterMaterial("campaign_decoration_circle"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32)
	var_4_0:addElement(var_4_4)

	var_4_0.Circle = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Square"

	var_4_6:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_6:setImage(RegisterMaterial("campaign_decoration_square_02"), 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16)
	var_4_0:addElement(var_4_6)

	var_4_0.Square = var_4_6

	local var_4_7 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_7)

	local var_4_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_8)

	local function var_4_9()
		var_4_4:AnimateSequence("DefaultSequence")
		var_4_6:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 360,
			duration = 16000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_4_4:RegisterAnimationSequence("Rotate", var_4_10)

	local function var_4_11()
		var_4_4:AnimateLoop("Rotate")
	end

	var_4_0._sequences.Rotate = var_4_11

	local var_4_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Pulse", var_4_12)

	local function var_4_13()
		var_4_6:AnimateSequence("Pulse")
	end

	var_4_0._sequences.Pulse = var_4_13

	local var_4_14 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -32,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_4:RegisterAnimationSequence("Appear", var_4_14)

	local var_4_15 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_6:RegisterAnimationSequence("Appear", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("Appear")
		var_4_6:AnimateSequence("Appear")
	end

	var_4_0._sequences.Appear = var_4_16

	local var_4_17 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		}
	}

	var_4_4:RegisterAnimationSequence("Hide", var_4_17)

	local var_4_18 = {
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		}
	}

	var_4_6:RegisterAnimationSequence("Hide", var_4_18)

	local function var_4_19()
		var_4_4:AnimateSequence("Hide")
		var_4_6:AnimateSequence("Hide")
	end

	var_4_0._sequences.Hide = var_4_19

	var_0_1(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("MapDecorationCircle", MapDecorationCircle)
LockTable(_M)
