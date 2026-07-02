module(..., package.seeall)

function WatchKaleidoPiece(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p)

	var_1_0.id = "WatchKaleidoPiece"
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

	var_1_4.id = "Image"

	var_1_4:SetAlpha(0.8, 0)
	var_1_4:setImage(RegisterMaterial("icon_watch_kaleido_piece"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256)
	var_1_0:addElement(var_1_4)

	var_1_0.Image = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6
	local var_1_7 = {
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256,
			easing = LUI.EASING.inOutBack
		}
	}

	var_1_4:RegisterAnimationSequence("Movement1", var_1_7)

	local function var_1_8()
		var_1_4:AnimateSequence("Movement1")
	end

	var_1_0._sequences.Movement1 = var_1_8

	local var_1_9
	local var_1_10 = {
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 384,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -128,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 384,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Movement2", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Movement2")
	end

	var_1_0._sequences.Movement2 = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -384,
			easing = LUI.EASING.inOutQuartic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128,
			easing = LUI.EASING.inOutQuartic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -128,
			easing = LUI.EASING.inOutQuartic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 384,
			easing = LUI.EASING.inOutQuartic
		}
	}

	var_1_4:RegisterAnimationSequence("Movement3", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("Movement3")
	end

	var_1_0._sequences.Movement3 = var_1_14

	local var_1_15
	local var_1_16 = {
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -384,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -384,
			easing = LUI.EASING.inOutBack
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 128,
			easing = LUI.EASING.inOutBack
		}
	}

	var_1_4:RegisterAnimationSequence("Movement4", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("Movement4")
	end

	var_1_0._sequences.Movement4 = var_1_17

	local var_1_18
	local var_1_19 = {
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 384,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -384,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 128,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Movement5", var_1_19)

	local function var_1_20()
		var_1_4:AnimateSequence("Movement5")
	end

	var_1_0._sequences.Movement5 = var_1_20

	local var_1_21
	local var_1_22 = {
		{
			value = 16777215,
			duration = 400,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_4:RegisterAnimationSequence("White", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("White")
	end

	var_1_0._sequences.White = var_1_23

	local var_1_24
	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		}
	}

	var_1_4:RegisterAnimationSequence("Alpha", var_1_25)

	local function var_1_26()
		var_1_4:AnimateSequence("Alpha")
	end

	var_1_0._sequences.Alpha = var_1_26

	local var_1_27
	local var_1_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		}
	}

	var_1_4:RegisterAnimationSequence("Blend", var_1_28)

	local function var_1_29()
		var_1_4:AnimateSequence("Blend")
	end

	var_1_0._sequences.Blend = var_1_29

	return var_1_0
end

MenuBuilder.registerType("WatchKaleidoPiece", WatchKaleidoPiece)
LockTable(_M)
