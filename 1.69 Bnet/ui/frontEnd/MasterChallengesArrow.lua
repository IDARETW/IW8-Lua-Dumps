module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
	end)
end

function MasterChallengesArrow(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 38 * _1080p, 0, 90 * _1080p)

	var_4_0.id = "MasterChallengesArrow"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromInt(3815994, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 38, 0, _1080p * 90)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Arrow"

	var_4_6:SetAlpha(0.5, 0)
	var_4_6:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 44, _1080p * -6, _1080p * 20, _1080p * 70)
	var_4_0:addElement(var_4_6)

	var_4_0.Arrow = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8
	local var_4_9 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_9)

	local var_4_10 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_10)

	local function var_4_11()
		var_4_4:AnimateSequence("ButtonOver")
		var_4_6:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_13)

	local var_4_14 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_14)

	local function var_4_15()
		var_4_4:AnimateSequence("ButtonUp")
		var_4_6:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_15

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MasterChallengesArrow", MasterChallengesArrow)
LockTable(_M)
