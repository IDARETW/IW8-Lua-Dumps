module(..., package.seeall)

function HorizontalScrollbarSliderArea(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 10 * _1080p)

	var_1_0.id = "HorizontalScrollbarSliderArea"
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

	var_1_4.id = "background"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.scrollbarBackground, 0)
	var_1_4:SetAlpha(0.2, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.background = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("VerticalScrollbarSlider", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "slider"

	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 40, _1080p * 80, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.slider = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_9

	local var_1_10 = {
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_11

	var_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
		ACTIONS.AnimateSequenceByElement(var_1_0, {
			elementPath = "self.slider",
			sequenceName = "ButtonUp",
			elementName = "slider"
		})
	end)

	return var_1_0
end

MenuBuilder.registerType("HorizontalScrollbarSliderArea", HorizontalScrollbarSliderArea)
LockTable(_M)
