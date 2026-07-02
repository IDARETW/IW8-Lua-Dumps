module(..., package.seeall)

function XpModifiers(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 210 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "XpModifiers"
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

	var_1_4.id = "DoubleWeaponXP"

	var_1_4:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 100, 0, _1080p * 100)
	var_1_0:addElement(var_1_4)

	var_1_0.DoubleWeaponXP = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "DoubleXP"

	var_1_6:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 110, _1080p * 210, 0, _1080p * 100)
	var_1_0:addElement(var_1_6)

	var_1_0.DoubleXP = var_1_6

	local var_1_7 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("DefaultSequence", var_1_7)

	local var_1_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("DefaultSequence", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("DefaultSequence")
		var_1_6:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("DoubleXpON", var_1_10)

	local var_1_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		}
	}

	var_1_6:RegisterAnimationSequence("DoubleXpON", var_1_11)

	local function var_1_12()
		var_1_4:AnimateSequence("DoubleXpON")
		var_1_6:AnimateSequence("DoubleXpON")
	end

	var_1_0._sequences.DoubleXpON = var_1_12

	local var_1_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("DoubleWeaponXpON", var_1_13)

	local var_1_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("DoubleWeaponXpON", var_1_14)

	local function var_1_15()
		var_1_4:AnimateSequence("DoubleWeaponXpON")
		var_1_6:AnimateSequence("DoubleWeaponXpON")
	end

	var_1_0._sequences.DoubleWeaponXpON = var_1_15

	local var_1_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("BothON", var_1_16)

	local var_1_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("BothON", var_1_17)

	local function var_1_18()
		var_1_4:AnimateSequence("BothON")
		var_1_6:AnimateSequence("BothON")
	end

	var_1_0._sequences.BothON = var_1_18

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("XpModifiers", XpModifiers)
LockTable(_M)
