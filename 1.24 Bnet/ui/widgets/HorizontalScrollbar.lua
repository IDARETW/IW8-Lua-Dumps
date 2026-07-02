module(..., package.seeall)

function HorizontalScrollbar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 10 * _1080p)

	var_1_0.id = "HorizontalScrollbar"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("HorizontalScrollbarSliderArea", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "sliderArea"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.sliderArea = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Show", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("Show")
	end

	var_1_0._sequences.Show = var_1_7

	local var_1_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Hide", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("Hide")
	end

	var_1_0._sequences.Hide = var_1_9

	var_1_0:addEventHandler("scrollbar_all_visible", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Hide")
	end)
	var_1_0:addEventHandler("scrollbar_not_all_visible", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Show")
	end)

	return var_1_0
end

MenuBuilder.registerType("HorizontalScrollbar", HorizontalScrollbar)
LockTable(_M)
