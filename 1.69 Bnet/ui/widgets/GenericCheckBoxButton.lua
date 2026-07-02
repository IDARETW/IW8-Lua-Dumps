module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.value
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 == true then
		ACTIONS.AnimateSequence(arg_2_0, "Enabled")
	else
		ACTIONS.AnimateSequence(arg_2_0, "Disabled")
	end

	arg_2_0.value = arg_2_1

	if arg_2_0.callbackFunc then
		arg_2_0.callbackFunc(arg_2_0.value)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.GetValue = var_0_0
	arg_3_0.SetValue = var_0_1

	if arg_3_2.defaultValue then
		var_0_1(arg_3_0, arg_3_2.defaultValue)
	else
		var_0_1(arg_3_0, false)
	end

	arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		var_0_1(arg_3_0, not arg_3_0.value)
	end)
end

function GenericCheckBoxButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_5_0.id = "GenericCheckBoxButton"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_5_5 = LUI.UIBorder.new(var_5_4)

	var_5_5.id = "Frame"

	var_5_0:addElement(var_5_5)

	var_5_0.Frame = var_5_5

	local var_5_6
	local var_5_7 = LUI.UIImage.new()

	var_5_7.id = "Fill"

	var_5_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_5_0:addElement(var_5_7)

	var_5_0.Fill = var_5_7

	local function var_5_8()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_8

	local var_5_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_7:RegisterAnimationSequence("Enabled", var_5_9)

	local function var_5_10()
		var_5_7:AnimateSequence("Enabled")
	end

	var_5_0._sequences.Enabled = var_5_10

	local var_5_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_7:RegisterAnimationSequence("Disabled", var_5_11)

	local function var_5_12()
		var_5_7:AnimateSequence("Disabled")
	end

	var_5_0._sequences.Disabled = var_5_12

	local var_5_13 = {
		{
			value = 13288704,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_5:RegisterAnimationSequence("Over", var_5_13)

	local function var_5_14()
		var_5_5:AnimateSequence("Over")
	end

	var_5_0._sequences.Over = var_5_14

	local var_5_15 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_5:RegisterAnimationSequence("Up", var_5_15)

	local function var_5_16()
		var_5_5:AnimateSequence("Up")
	end

	var_5_0._sequences.Up = var_5_16

	var_5_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "Over")
	end)
	var_5_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "Up")
	end)
	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("GenericCheckBoxButton", GenericCheckBoxButton)
LockTable(_M)
