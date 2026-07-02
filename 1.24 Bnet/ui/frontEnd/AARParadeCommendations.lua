module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = math.min(#arg_1_0._commendationWidgets, #arg_1_1)

	for iter_1_0 = 1, var_1_0 do
		local var_1_1 = arg_1_1[iter_1_0]
		local var_1_2 = arg_1_0._commendationWidgets[iter_1_0]

		if var_1_1 and var_1_2 then
			var_1_2:SetupCommendation(var_1_1)
		end
	end

	ACTIONS.AnimateSequence(arg_1_0, "ShowItem" .. var_1_0)
	Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.commendationParade)
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._commendationWidgets = {
		arg_2_0.AARParadeCommendationItem1,
		arg_2_0.AARParadeCommendationItem2,
		arg_2_0.AARParadeCommendationItem3
	}
	arg_2_0.SetupCommendations = var_0_0
end

function AARParadeCommendations(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "AARParadeCommendations"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("AARParadeCommendationItem", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "AARParadeCommendationItem1"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 423, _1080p * 687, _1080p * 429, _1080p * 693)
	var_3_0:addElement(var_3_4)

	var_3_0.AARParadeCommendationItem1 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("AARParadeCommendationItem", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "AARParadeCommendationItem2"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 828, _1080p * 1092, _1080p * 429, _1080p * 693)
	var_3_0:addElement(var_3_6)

	var_3_0.AARParadeCommendationItem2 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("AARParadeCommendationItem", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "AARParadeCommendationItem3"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1245, _1080p * 1509, _1080p * 429, _1080p * 693)
	var_3_0:addElement(var_3_8)

	var_3_0.AARParadeCommendationItem3 = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 828
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1092
		}
	}

	var_3_4:RegisterAnimationSequence("ShowItem1", var_3_10)

	local var_3_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowItem1", var_3_11)

	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowItem1", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("ShowItem1")
		var_3_6:AnimateSequence("ShowItem1")
		var_3_8:AnimateSequence("ShowItem1")
	end

	var_3_0._sequences.ShowItem1 = var_3_13

	local var_3_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 862
		}
	}

	var_3_4:RegisterAnimationSequence("ShowItem2", var_3_14)

	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1377
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowItem2", var_3_15)

	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowItem2", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("ShowItem2")
		var_3_6:AnimateSequence("ShowItem2")
		var_3_8:AnimateSequence("ShowItem2")
	end

	var_3_0._sequences.ShowItem2 = var_3_17

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 416
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 680
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ShowItem3", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 828
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1092
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowItem3", var_3_19)

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1245
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1509
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowItem3", var_3_20)

	local function var_3_21()
		var_3_4:AnimateSequence("ShowItem3")
		var_3_6:AnimateSequence("ShowItem3")
		var_3_8:AnimateSequence("ShowItem3")
	end

	var_3_0._sequences.ShowItem3 = var_3_21

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARParadeCommendations", AARParadeCommendations)
LockTable(_M)
