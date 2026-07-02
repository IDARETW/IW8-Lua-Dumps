module(..., package.seeall)

function WatchPetStreakCounter(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 16 * _1080p)

	var_1_0.id = "WatchPetStreakCounter"
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

	var_1_4.id = "Streak"

	var_1_4:setImage(RegisterMaterial("watch_riley_streak_0"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 16)
	var_1_0:addElement(var_1_4)

	var_1_0.Streak = var_1_4

	local var_1_5 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_riley_streak_0")
		}
	}

	var_1_4:RegisterAnimationSequence("DefaultSequence", var_1_5)

	local function var_1_6()
		var_1_4:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_6

	local var_1_7 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_riley_streak_1")
		}
	}

	var_1_4:RegisterAnimationSequence("Counter1", var_1_7)

	local function var_1_8()
		var_1_4:AnimateSequence("Counter1")
	end

	var_1_0._sequences.Counter1 = var_1_8

	local var_1_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_riley_streak_2")
		}
	}

	var_1_4:RegisterAnimationSequence("Counter2", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("Counter2")
	end

	var_1_0._sequences.Counter2 = var_1_10

	local var_1_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_riley_streak_3")
		}
	}

	var_1_4:RegisterAnimationSequence("Counter3", var_1_11)

	local function var_1_12()
		var_1_4:AnimateSequence("Counter3")
	end

	var_1_0._sequences.Counter3 = var_1_12

	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_riley_streak_4")
		}
	}

	var_1_4:RegisterAnimationSequence("Counter4", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("Counter4")
	end

	var_1_0._sequences.Counter4 = var_1_14

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("WatchPetStreakCounter", WatchPetStreakCounter)
LockTable(_M)
