module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if not arg_1_0._isEnabled then
		return
	end

	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._isEnabled = true

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		var_0_0(arg_2_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		var_0_0(arg_2_0, "Enabled")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		var_0_0(arg_2_0, "ButtonOverDisabled")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		var_0_0(arg_2_0, "Disabled")

		arg_2_0._isEnabled = false
	end)
	arg_2_0:addEventHandler("button_enable", function(arg_7_0, arg_7_1)
		var_0_0(arg_2_0, "Enabled")

		arg_2_0._isEnabled = true
	end)
end

function WZOperatorFilterSelectImageButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 140 * _1080p, 0, 140 * _1080p)

	var_8_0.id = "WZOperatorFilterSelectImageButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Image"

	var_8_4:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_8_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64)
	var_8_0:addElement(var_8_4)

	var_8_0.Image = var_8_4

	local function var_8_5()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_5

	local var_8_6
	local var_8_7 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOver", var_8_7)

	local function var_8_8()
		var_8_4:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_8

	local var_8_9
	local var_8_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Enabled", var_8_10)

	local function var_8_11()
		var_8_4:AnimateSequence("Enabled")
	end

	var_8_0._sequences.Enabled = var_8_11

	local var_8_12
	local var_8_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("Disabled", var_8_13)

	local function var_8_14()
		var_8_4:AnimateSequence("Disabled")
	end

	var_8_0._sequences.Disabled = var_8_14

	local var_8_15
	local var_8_16 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOverDisabled", var_8_16)

	local function var_8_17()
		var_8_4:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_17

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WZOperatorFilterSelectImageButton", WZOperatorFilterSelectImageButton)
LockTable(_M)
