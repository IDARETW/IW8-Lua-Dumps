module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetHandleMouseMove(true)
	arg_1_0:addEventHandler("mouseenter", function(arg_2_0, arg_2_1)
		arg_2_0.sliderArea:processEvent({
			name = "expand",
			controller = arg_2_1.controller,
			focusType = FocusType.MouseOver
		})
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

function HorizontalMinimalScrollbar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 11 * _1080p)

	var_4_0.id = "HorizontalMinimalScrollbar"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "guide"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.greenLight, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 5)
	var_4_0:addElement(var_4_4)

	var_4_0.guide = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbarSliderArea", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "sliderArea"

	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -5.5, _1080p * 5.5)
	var_4_0:addElement(var_4_6)

	var_4_0.sliderArea = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Show", var_4_8)

	local var_4_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Show", var_4_9)

	local function var_4_10()
		var_4_4:AnimateSequence("Show")
		var_4_6:AnimateSequence("Show")
	end

	var_4_0._sequences.Show = var_4_10

	local var_4_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Hide", var_4_11)

	local var_4_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Hide", var_4_12)

	local function var_4_13()
		var_4_4:AnimateSequence("Hide")
		var_4_6:AnimateSequence("Hide")
	end

	var_4_0._sequences.Hide = var_4_13

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

MenuBuilder.registerType("HorizontalMinimalScrollbar", HorizontalMinimalScrollbar)
LockTable(_M)
