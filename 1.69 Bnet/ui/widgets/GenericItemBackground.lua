module(..., package.seeall)

function GenericItemBackground(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p)

	var_1_0.id = "GenericItemBackground"
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

	var_1_4.id = "Image"

	var_1_4:SetRGBFromInt(1710618, 0)
	var_1_4:SetAlpha(0.5, 0)
	var_1_4:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Image = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_bottom_to_top_opaque_dark")
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1710618,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_7

	local var_1_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1710618,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_9

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_disabled")
		},
		{
			value = 13421772,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOverDisabled", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_11

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_disabled")
		},
		{
			value = 13421772,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUpDisabled", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_13

	var_1_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOverDisabled")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUpDisabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("GenericItemBackground", GenericItemBackground)
LockTable(_M)
