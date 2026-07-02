module(..., package.seeall)

function MissionInfoTab(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p)

	var_1_0.id = "MissionInfoTab"
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

	var_1_4.id = "Fill"

	var_1_4:SetAlpha(0.3, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Fill = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_1_4:RegisterAnimationSequence("Focused", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("Focused")
	end

	var_1_0._sequences.Focused = var_1_7

	local var_1_8 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_4:RegisterAnimationSequence("Unfocused", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("Unfocused")
	end

	var_1_0._sequences.Unfocused = var_1_9

	local var_1_10 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_4:RegisterAnimationSequence("Highlighted", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Highlighted")
	end

	var_1_0._sequences.Highlighted = var_1_11

	var_1_0:addEventHandler("scrollbar_pip_highlighted", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Focused")
	end)
	var_1_0:addEventHandler("scrollbar_pip_not_highlighted", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Unfocused")
	end)
	var_1_0:addEventHandler("scrollbar_pip_mouse_over", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Highlighted")
	end)
	var_1_0:addEventHandler("scrollbar_pip_is_not_default", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Unfocused")
	end)

	return var_1_0
end

MenuBuilder.registerType("MissionInfoTab", MissionInfoTab)
LockTable(_M)
