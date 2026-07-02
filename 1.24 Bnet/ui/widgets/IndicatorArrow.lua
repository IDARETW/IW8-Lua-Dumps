module(..., package.seeall)

function IndicatorArrow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 20 * _1080p, 0, 15 * _1080p)

	var_1_0.id = "IndicatorArrow"
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

	var_1_4.id = "ArrowImage"

	var_1_4:SetZRotation(-90, 0)
	var_1_4:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6.25, _1080p * -6.25, 0, _1080p * -1)
	var_1_0:addElement(var_1_4)

	var_1_0.ArrowImage = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			value = -90,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_1_4:RegisterAnimationSequence("IndicatorDown", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("IndicatorDown")
	end

	var_1_0._sequences.IndicatorDown = var_1_7

	local var_1_8 = {
		{
			value = 90,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_1_4:RegisterAnimationSequence("IndicatorUp", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("IndicatorUp")
	end

	var_1_0._sequences.IndicatorUp = var_1_9

	local var_1_10 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_1_4:RegisterAnimationSequence("IndicatorLeft", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("IndicatorLeft")
	end

	var_1_0._sequences.IndicatorLeft = var_1_11

	local var_1_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_1_4:RegisterAnimationSequence("IndicatorRight", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("IndicatorRight")
	end

	var_1_0._sequences.IndicatorRight = var_1_13

	return var_1_0
end

MenuBuilder.registerType("IndicatorArrow", IndicatorArrow)
LockTable(_M)
