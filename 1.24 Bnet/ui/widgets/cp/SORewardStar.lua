module(..., package.seeall)

function SORewardStar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 72 * _1080p, 0, 72 * _1080p)

	var_1_0.id = "SORewardStar"
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

	var_1_4.id = "StarBorder"

	var_1_4:SetAlpha(0.6, 0)
	var_1_4:SetColorOp(COLOR_OP.saturation, 0)
	var_1_4:setImage(RegisterMaterial("star_on"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.StarBorder = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "StarOff"

	var_1_6:setImage(RegisterMaterial("star_off"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 4, _1080p * -4)
	var_1_0:addElement(var_1_6)

	var_1_0.StarOff = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "StarOn"

	var_1_8:SetAlpha(0, 0)
	var_1_8:setImage(RegisterMaterial("star_on"), 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 4, _1080p * -4)
	var_1_0:addElement(var_1_8)

	var_1_0.StarOn = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 350,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("AnimStarOn", var_1_10)

	local var_1_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 350,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 350,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 350,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			duration = 350,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 350,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuintic
		}
	}

	var_1_8:RegisterAnimationSequence("AnimStarOn", var_1_11)

	local function var_1_12()
		var_1_4:AnimateSequence("AnimStarOn")
		var_1_8:AnimateSequence("AnimStarOn")
	end

	var_1_0._sequences.AnimStarOn = var_1_12

	local var_1_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("On", var_1_13)

	local var_1_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_1_8:RegisterAnimationSequence("On", var_1_14)

	local function var_1_15()
		var_1_4:AnimateSequence("On")
		var_1_8:AnimateSequence("On")
	end

	var_1_0._sequences.On = var_1_15

	local var_1_16 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Off", var_1_16)

	local var_1_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Off", var_1_17)

	local function var_1_18()
		var_1_4:AnimateSequence("Off")
		var_1_8:AnimateSequence("Off")
	end

	var_1_0._sequences.Off = var_1_18

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Neutral", var_1_19)

	local var_1_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_1_8:RegisterAnimationSequence("Neutral", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("Neutral")
		var_1_8:AnimateSequence("Neutral")
	end

	var_1_0._sequences.Neutral = var_1_21

	return var_1_0
end

MenuBuilder.registerType("SORewardStar", SORewardStar)
LockTable(_M)
