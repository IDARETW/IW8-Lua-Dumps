module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetHandleMouseMove(true)
	arg_1_0:addEventHandler("mouseenter", function(arg_2_0, arg_2_1)
		if arg_2_0.sliderArea:IsPositionInside(arg_2_1.x, arg_2_1.y) then
			arg_2_0.sliderArea:processEvent({
				name = "expand",
				controller = arg_2_1.controller,
				focusType = FocusType.MouseOver
			})

			local var_2_0, var_2_1, var_2_2, var_2_3 = arg_2_0.sliderArea.fixedSizeSlider:getRect()

			if var_2_1 < arg_2_1.y and var_2_3 > arg_2_1.y then
				arg_2_0.sliderArea.fixedSizeSlider:processEvent(arg_2_1)
			end
		end
	end)
	arg_1_0:addEventHandler("mouseleave", function(arg_3_0, arg_3_1)
		if not arg_3_0.sliderArea.fixedSizeSlider.mouseWheelTarget:IsPositionInside(arg_3_1.x, arg_3_1.y) then
			arg_3_0.sliderArea:processEvent({
				name = "shrink",
				controller = arg_3_1.controller,
				focusType = FocusType.MouseOver
			})
		end
	end)
end

function VerticalMinimalScrollbar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 11 * _1080p, 0, 400 * _1080p)

	var_4_0.id = "VerticalMinimalScrollbar"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbarSliderArea", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "sliderArea"

	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -5.5, _1080p * 5.5, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.sliderArea = var_4_4

	local function var_4_5()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_5

	local var_4_6 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Show", var_4_6)

	local function var_4_7()
		var_4_4:AnimateSequence("Show")
	end

	var_4_0._sequences.Show = var_4_7

	local var_4_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Hide", var_4_8)

	local function var_4_9()
		var_4_4:AnimateSequence("Hide")
	end

	var_4_0._sequences.Hide = var_4_9

	var_4_0:addEventHandler("scrollbar_all_visible", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Hide")
	end)
	var_4_0:addEventHandler("scrollbar_not_all_visible", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Show")
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("VerticalMinimalScrollbar", VerticalMinimalScrollbar)
LockTable(_M)
