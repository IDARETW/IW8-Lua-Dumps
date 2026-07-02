module(..., package.seeall)

function ButtonLayoutLines(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 350 * _1080p)

	var_1_0.id = "ButtonLayoutLines"
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

	var_1_4.id = "Line01"

	var_1_4:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 44)
	var_1_0:addElement(var_1_4)

	var_1_0.Line01 = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Line02"

	var_1_6:SetAlpha(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 282, _1080p * 327)
	var_1_0:addElement(var_1_6)

	var_1_0.Line02 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Line03"

	var_1_8:SetAlpha(0, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 93, _1080p * 138)
	var_1_0:addElement(var_1_8)

	var_1_0.Line03 = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Line04"

	var_1_10:SetAlpha(0, 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 188, _1080p * 233)
	var_1_0:addElement(var_1_10)

	var_1_0.Line04 = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonLayout", var_1_12)

	local var_1_13 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonLayout", var_1_13)

	local var_1_14 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonLayout", var_1_14)

	local var_1_15 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonLayout", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("ButtonLayout")
		var_1_6:AnimateSequence("ButtonLayout")
		var_1_8:AnimateSequence("ButtonLayout")
		var_1_10:AnimateSequence("ButtonLayout")
	end

	var_1_0._sequences.ButtonLayout = var_1_16

	local var_1_17 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("StickLayout", var_1_17)

	local var_1_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("StickLayout", var_1_18)

	local var_1_19 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("StickLayout", var_1_19)

	local var_1_20 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("StickLayout", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("StickLayout")
		var_1_6:AnimateSequence("StickLayout")
		var_1_8:AnimateSequence("StickLayout")
		var_1_10:AnimateSequence("StickLayout")
	end

	var_1_0._sequences.StickLayout = var_1_21

	return var_1_0
end

MenuBuilder.registerType("ButtonLayoutLines", ButtonLayoutLines)
LockTable(_M)
