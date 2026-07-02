module(..., package.seeall)

function RefreshAnimation(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		RefreshAnimation(arg_3_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		RefreshAnimation(arg_4_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_5_0, arg_5_1)
		RefreshAnimation(arg_5_0, "Disabled")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, "Disabled")
	end)
end

function GenericButtonBlurBackground(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_7_0.id = "GenericButtonBlurBackground"
	var_7_0._animationSets = {}
	var_7_0._sequences = {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIBlur.new()

	var_7_4.id = "BlurBackground"

	var_7_4:SetRGBFromInt(15132390, 0)
	var_7_4:setImage(RegisterMaterial("ui_default_white"), 0)
	var_7_4:SetBlurStrength(2.75, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.BlurBackground = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Gradient"

	var_7_6:SetRGBFromInt(0, 0)
	var_7_6:SetAlpha(0.2, 0)
	var_7_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_7_0:addElement(var_7_6)

	var_7_0.Gradient = var_7_6

	local function var_7_7()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_7

	local var_7_8 = {
		{
			value = 6710886,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOver", var_7_8)

	local var_7_9 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.85,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOver", var_7_9)

	local function var_7_10()
		var_7_4:AnimateSequence("ButtonOver")
		var_7_6:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_10

	local var_7_11 = {
		{
			value = 15132390,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 2.75,
			duration = 200,
			property = TWEEN_PROPERTY.Blur_Strength
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUp", var_7_11)

	local var_7_12 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUp", var_7_12)

	local function var_7_13()
		var_7_4:AnimateSequence("ButtonUp")
		var_7_6:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_13

	local var_7_14 = {
		{
			value = 5066061,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Disabled", var_7_14)

	local var_7_15 = {
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_6:RegisterAnimationSequence("Disabled", var_7_15)

	local function var_7_16()
		var_7_4:AnimateSequence("Disabled")
		var_7_6:AnimateSequence("Disabled")
	end

	var_7_0._sequences.Disabled = var_7_16

	PostLoadFunc(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("GenericButtonBlurBackground", GenericButtonBlurBackground)
LockTable(_M)
