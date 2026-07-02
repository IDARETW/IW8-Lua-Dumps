module(..., package.seeall)

function FavoritedNotification(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_1_0.id = "FavoritedNotification"
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

	var_1_4.id = "Icon"

	var_1_4:SetAlpha(0, 0)
	var_1_4:setImage(RegisterMaterial("favorite"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6
	local var_1_7 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("On", var_1_7)

	local function var_1_8()
		var_1_4:AnimateSequence("On")
	end

	var_1_0._sequences.On = var_1_8

	local var_1_9
	local var_1_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Off", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Off")
	end

	var_1_0._sequences.Off = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("favorite_cw")
		}
	}

	var_1_4:RegisterAnimationSequence("CW", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("CW")
	end

	var_1_0._sequences.CW = var_1_14

	local var_1_15
	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("favorite")
		}
	}

	var_1_4:RegisterAnimationSequence("MW", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("MW")
	end

	var_1_0._sequences.MW = var_1_17

	local var_1_18
	local var_1_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("favorite_vg")
		}
	}

	var_1_4:RegisterAnimationSequence("VG", var_1_19)

	local function var_1_20()
		var_1_4:AnimateSequence("VG")
	end

	var_1_0._sequences.VG = var_1_20

	return var_1_0
end

MenuBuilder.registerType("FavoritedNotification", FavoritedNotification)
LockTable(_M)
