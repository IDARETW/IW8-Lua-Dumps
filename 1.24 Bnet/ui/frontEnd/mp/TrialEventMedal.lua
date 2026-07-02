module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.earned and arg_1_0._earnedAnimations[arg_1_1.medalType] or "NotEarned"

	if not arg_1_1.earned then
		arg_1_0.Medal:setImage(RegisterMaterial("trial_medal_slot_sm"))
	end

	ACTIONS.AnimateSequence(arg_1_0, var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetMedal = var_0_0
	arg_2_0._earnedAnimations = {
		"EarnedBronze",
		"EarnedSilver",
		"EarnedGold"
	}
end

function TrialEventMedal(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "TrialEventMedal"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Medal"

	var_3_0:addElement(var_3_4)

	var_3_0.Medal = var_3_4

	local function var_3_5()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_5

	local var_3_6
	local var_3_7 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("trial_medal_gold")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_4:RegisterAnimationSequence("EarnedGold", var_3_7)

	local function var_3_8()
		var_3_4:AnimateSequence("EarnedGold")
	end

	var_3_0._sequences.EarnedGold = var_3_8

	local var_3_9
	local var_3_10 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.objectiveActive
		}
	}

	var_3_4:RegisterAnimationSequence("NotEarned", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("NotEarned")
	end

	var_3_0._sequences.NotEarned = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("trial_medal_silver")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_4:RegisterAnimationSequence("EarnedSilver", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("EarnedSilver")
	end

	var_3_0._sequences.EarnedSilver = var_3_14

	local var_3_15
	local var_3_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("trial_medal_bronze")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_4:RegisterAnimationSequence("EarnedBronze", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("EarnedBronze")
	end

	var_3_0._sequences.EarnedBronze = var_3_17

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TrialEventMedal", TrialEventMedal)
LockTable(_M)
