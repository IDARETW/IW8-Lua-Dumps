module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	function arg_1_0.Enable(arg_2_0)
		arg_2_0._disabled = false
	end

	function arg_1_0.Disable(arg_3_0)
		arg_3_0._disabled = true
	end

	function arg_1_0.IsEnabled(arg_4_0)
		return not arg_4_0._disabled
	end

	arg_1_0:registerEventHandler("focus_tab", function(arg_5_0, arg_5_1)
		if arg_5_1.index == arg_5_0.index then
			ACTIONS.AnimateSequence(arg_5_0, "Highlighted")

			arg_5_0.focused = true
		else
			ACTIONS.AnimateSequence(arg_5_0, "NotHighlighted")

			if arg_5_0.focused then
				arg_5_0.focused = false
			end
		end
	end)
end

function Pip(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 15 * _1080p, 0, 4 * _1080p)

	var_6_0.id = "Pip"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "FillImage"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.FillImage = var_6_4

	local function var_6_5()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_5

	local var_6_6 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_4:RegisterAnimationSequence("Highlighted", var_6_6)

	local function var_6_7()
		var_6_4:AnimateSequence("Highlighted")
	end

	var_6_0._sequences.Highlighted = var_6_7

	local var_6_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy
		}
	}

	var_6_4:RegisterAnimationSequence("NotHighlighted", var_6_8)

	local function var_6_9()
		var_6_4:AnimateSequence("NotHighlighted")
	end

	var_6_0._sequences.NotHighlighted = var_6_9

	local var_6_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Default", var_6_10)

	local function var_6_11()
		var_6_4:AnimateSequence("Default")
	end

	var_6_0._sequences.Default = var_6_11

	local var_6_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy
		}
	}

	var_6_4:RegisterAnimationSequence("NotDefault", var_6_12)

	local function var_6_13()
		var_6_4:AnimateSequence("NotDefault")
	end

	var_6_0._sequences.NotDefault = var_6_13

	var_6_0:addEventHandler("scrollbar_pip_highlighted", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Highlighted")
	end)
	var_6_0:addEventHandler("scrollbar_pip_not_highlighted", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "NotHighlighted")
	end)
	var_6_0:addEventHandler("scrollbar_pip_is_default", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Default")
	end)
	var_6_0:addEventHandler("scrollbar_pip_is_not_default", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "NotDefault")
	end)
	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("Pip", Pip)
LockTable(_M)
