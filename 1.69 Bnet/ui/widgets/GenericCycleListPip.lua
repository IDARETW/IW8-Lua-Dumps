module(..., package.seeall)

function GenericCycleListPip(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 4 * _1080p)

	var_1_0.id = "GenericCycleListPip"
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

	var_1_4.id = "FillImage"

	var_1_0:addElement(var_1_4)

	var_1_0.FillImage = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.node
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Highlighted", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("Highlighted")
	end

	var_1_0._sequences.Highlighted = var_1_7

	local var_1_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.node
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("NotHighlighted", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("NotHighlighted")
	end

	var_1_0._sequences.NotHighlighted = var_1_9

	local var_1_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.streakSelected
		}
	}

	var_1_4:RegisterAnimationSequence("Default", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Default")
	end

	var_1_0._sequences.Default = var_1_11

	local var_1_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.node
		}
	}

	var_1_4:RegisterAnimationSequence("NotDefault", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("NotDefault")
	end

	var_1_0._sequences.NotDefault = var_1_13

	var_1_0:addEventHandler("scrollbar_pip_highlighted", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Highlighted")
	end)
	var_1_0:addEventHandler("scrollbar_pip_not_highlighted", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "NotHighlighted")
	end)
	var_1_0:addEventHandler("scrollbar_pip_is_default", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Default")
	end)
	var_1_0:addEventHandler("scrollbar_pip_is_not_default", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "NotDefault")
	end)

	return var_1_0
end

MenuBuilder.registerType("GenericCycleListPip", GenericCycleListPip)
LockTable(_M)
