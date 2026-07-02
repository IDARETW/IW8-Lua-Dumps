module(..., package.seeall)

local var_0_0 = 5

function SetTierCount(arg_1_0, arg_1_1)
	assert(arg_1_1 > 0 and arg_1_1 <= var_0_0)

	arg_1_0._tierCount = arg_1_1

	ACTIONS.AnimateSequence(arg_1_0, "Show" .. arg_1_1)
end

function SetActiveTier(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in pairs(arg_2_0.tierOrder) do
		local var_2_0 = "Hide"

		if iter_2_0 <= arg_2_0._tierCount then
			var_2_0 = iter_2_0 < arg_2_1 and "Completed" or iter_2_0 == arg_2_1 and "Active" or "Pending"
		end

		ACTIONS.AnimateSequence(iter_2_1, var_2_0)
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetTierCount = SetTierCount
	arg_3_0.SetActiveTier = SetActiveTier
	arg_3_0.tierOrder = {}

	for iter_3_0 = 1, var_0_0 do
		arg_3_0.tierOrder[iter_3_0] = arg_3_0["Roman" .. tostring(iter_3_0)]

		arg_3_0.tierOrder[iter_3_0].Numeral:setImage(RegisterMaterial("ui_t9_menu_frontend_RomanNumeral_" .. tostring(iter_3_0)))
	end
end

function ProgressionTierMeter(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 156 * _1080p, 0, 32 * _1080p)

	var_4_0.id = "ProgressionTierMeter"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("ProgressionNumeral", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Roman1"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 31, _1080p * 1, _1080p * 31)
	var_4_0:addElement(var_4_4)

	var_4_0.Roman1 = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("ProgressionNumeral", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "Roman2"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 62, _1080p * 1, _1080p * 31)
	var_4_0:addElement(var_4_6)

	var_4_0.Roman2 = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("ProgressionNumeral", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Roman3"

	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 63, _1080p * 93, _1080p * 1, _1080p * 31)
	var_4_0:addElement(var_4_8)

	var_4_0.Roman3 = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("ProgressionNumeral", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Roman4"

	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 94, _1080p * 124, _1080p * 1, _1080p * 31)
	var_4_0:addElement(var_4_10)

	var_4_0.Roman4 = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("ProgressionNumeral", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "Roman5"

	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 125, _1080p * 155, _1080p * 1, _1080p * 31)
	var_4_0:addElement(var_4_12)

	var_4_0.Roman5 = var_4_12

	local function var_4_13()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_13

	local var_4_14
	local var_4_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Show1", var_4_15)

	local var_4_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Show1", var_4_16)

	local var_4_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Show1", var_4_17)

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Show1", var_4_18)

	local var_4_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Show1", var_4_19)

	local function var_4_20()
		var_4_4:AnimateSequence("Show1")
		var_4_6:AnimateSequence("Show1")
		var_4_8:AnimateSequence("Show1")
		var_4_10:AnimateSequence("Show1")
		var_4_12:AnimateSequence("Show1")
	end

	var_4_0._sequences.Show1 = var_4_20

	local var_4_21
	local var_4_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Show2", var_4_22)

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Show2", var_4_23)

	local var_4_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Show2", var_4_24)

	local var_4_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Show2", var_4_25)

	local var_4_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Show2", var_4_26)

	local function var_4_27()
		var_4_4:AnimateSequence("Show2")
		var_4_6:AnimateSequence("Show2")
		var_4_8:AnimateSequence("Show2")
		var_4_10:AnimateSequence("Show2")
		var_4_12:AnimateSequence("Show2")
	end

	var_4_0._sequences.Show2 = var_4_27

	local var_4_28
	local var_4_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Show3", var_4_29)

	local var_4_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Show3", var_4_30)

	local var_4_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Show3", var_4_31)

	local var_4_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Show3", var_4_32)

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Show3", var_4_33)

	local function var_4_34()
		var_4_4:AnimateSequence("Show3")
		var_4_6:AnimateSequence("Show3")
		var_4_8:AnimateSequence("Show3")
		var_4_10:AnimateSequence("Show3")
		var_4_12:AnimateSequence("Show3")
	end

	var_4_0._sequences.Show3 = var_4_34

	local var_4_35
	local var_4_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Show4", var_4_36)

	local var_4_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Show4", var_4_37)

	local var_4_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Show4", var_4_38)

	local var_4_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Show4", var_4_39)

	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Show4", var_4_40)

	local function var_4_41()
		var_4_4:AnimateSequence("Show4")
		var_4_6:AnimateSequence("Show4")
		var_4_8:AnimateSequence("Show4")
		var_4_10:AnimateSequence("Show4")
		var_4_12:AnimateSequence("Show4")
	end

	var_4_0._sequences.Show4 = var_4_41

	local var_4_42
	local var_4_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Show5", var_4_43)

	local var_4_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Show5", var_4_44)

	local var_4_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Show5", var_4_45)

	local var_4_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Show5", var_4_46)

	local var_4_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Show5", var_4_47)

	local function var_4_48()
		var_4_4:AnimateSequence("Show5")
		var_4_6:AnimateSequence("Show5")
		var_4_8:AnimateSequence("Show5")
		var_4_10:AnimateSequence("Show5")
		var_4_12:AnimateSequence("Show5")
	end

	var_4_0._sequences.Show5 = var_4_48

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ProgressionTierMeter", ProgressionTierMeter)
LockTable(_M)
