module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if #arg_1_2 >= 2 then
		ACTIONS.AnimateSequence(arg_1_0, "DoubleItem")
		arg_1_0.Item1:UpdateUnlockData(arg_1_1, tonumber(arg_1_2[1]))
		arg_1_0.Item2:UpdateUnlockData(arg_1_1, tonumber(arg_1_2[2]))
	else
		ACTIONS.AnimateSequence(arg_1_0, "SingleItem")
		arg_1_0.Item1:UpdateUnlockData(arg_1_1, tonumber(arg_1_2[1]))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateUnlockData = var_0_0
end

function UnlocksLootPanel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1270 * _1080p, 0, 445 * _1080p)

	var_3_0.id = "UnlocksLootPanel"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("UnlocksLootItem", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Item1"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 111, _1080p * 635, _1080p * 34, _1080p * 410)
	var_3_0:addElement(var_3_6)

	var_3_0.Item1 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("UnlocksLootItem", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Item2"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 635, _1080p * 1159, _1080p * 34, _1080p * 410)
	var_3_0:addElement(var_3_8)

	var_3_0.Item2 = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 897
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 373
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("SingleItem", var_3_10)

	local var_3_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("SingleItem", var_3_11)

	local function var_3_12()
		var_3_6:AnimateSequence("SingleItem")
		var_3_8:AnimateSequence("SingleItem")
	end

	var_3_0._sequences.SingleItem = var_3_12

	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 635
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 111
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("DoubleItem", var_3_13)

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1159
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 635
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("DoubleItem", var_3_14)

	local function var_3_15()
		var_3_6:AnimateSequence("DoubleItem")
		var_3_8:AnimateSequence("DoubleItem")
	end

	var_3_0._sequences.DoubleItem = var_3_15

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("UnlocksLootPanel", UnlocksLootPanel)
LockTable(_M)
