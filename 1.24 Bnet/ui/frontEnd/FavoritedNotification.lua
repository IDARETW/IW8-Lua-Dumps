module(..., package.seeall)

function FavoritedNotification(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_1_0.id = "FavoritedNotification"
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

	var_1_4.id = "Icon"

	var_1_4:SetAlpha(0, 0)
	var_1_4:setImage(RegisterMaterial("favorite"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("On", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("On")
	end

	var_1_0._sequences.On = var_1_7

	local var_1_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Off", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("Off")
	end

	var_1_0._sequences.Off = var_1_9

	return var_1_0
end

MenuBuilder.registerType("FavoritedNotification", FavoritedNotification)
LockTable(_M)
