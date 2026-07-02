module(..., package.seeall)

local var_0_0 = {
	EXPANDED = 1,
	COLLAPSED = 0
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._displayStates = var_0_0.COLLAPSED

	local function var_1_0(arg_2_0, arg_2_1)
		if not arg_2_0.Halo._baseWidth then
			arg_2_0.Halo._baseWidth = arg_2_0.Halo:getWidth()
		end

		arg_1_0:applyElementTransform()

		local var_2_0, var_2_1 = ProjectRootCoordinate(arg_2_1.rootName, arg_2_1.x, arg_2_1.y)

		if arg_2_0:IsPositionInside(var_2_0, var_2_1) and not arg_2_0.fixedSizeSlider:IsPositionInside(var_2_0, var_2_1) then
			arg_2_0.Halo:SetAlpha(1)

			local var_2_2, var_2_3 = Engine.DBFFAEEFGJ():PixelsToUnits(var_2_0, var_2_1)
			local var_2_4, var_2_5, var_2_6, var_2_7 = arg_2_0:getCurrentGlobalRect()
			local var_2_8 = var_2_2 - var_2_4
			local var_2_9 = var_2_8 - arg_2_0.Halo._baseWidth / 2
			local var_2_10 = var_2_8 + arg_2_0.Halo._baseWidth / 2

			arg_2_0.Halo:SetLeft(var_2_9)
			arg_2_0.Halo:SetRight(var_2_10)
		else
			arg_2_0.Halo:SetAlpha(0)
		end

		arg_1_0:undoElementTransform()
	end

	arg_1_0:addEventHandler("mousemove", var_1_0)
	arg_1_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		if arg_3_0._displayStates == var_0_0.COLLAPSED then
			ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")

			arg_3_0._displayStates = var_0_0.EXPANDED
		end
	end)
	arg_1_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if arg_4_0._displayStates == var_0_0.EXPANDED then
			ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")

			arg_4_0._displayStates = var_0_0.COLLAPSED
		end
	end)
end

function HorizontalMinimalScrollbarSliderArea(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 11 * _1080p)

	var_5_0.id = "HorizontalMinimalScrollbarSliderArea"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "background"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.scrollbarBackground, 0)
	var_5_4:SetAlpha(0.2, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -2.5, _1080p * 2.5)
	var_5_0:addElement(var_5_4)

	var_5_0.background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Halo"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_6:SetAlpha(0, 0)
	var_5_6:SetPixelGridEnabled(true)
	var_5_6:SetPixelGridContrast(0.5, 0)
	var_5_6:SetPixelGridBlockWidth(2, 0)
	var_5_6:SetPixelGridBlockHeight(2, 0)
	var_5_6:SetPixelGridGutterWidth(1, 0)
	var_5_6:SetPixelGridGutterHeight(1, 0)
	var_5_6:setImage(RegisterMaterial("horizontal_scrollbar_gradient"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 148, _1080p * 226, _1080p * 11, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Halo = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbarSlider", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "fixedSizeSlider"

	var_5_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 70, _1080p * 170, _1080p * 3, _1080p * -3)
	var_5_0:addElement(var_5_8)

	var_5_0.fixedSizeSlider = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2.5
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5.5
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_10)

	local var_5_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_11)

	local var_5_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_12)

	local function var_5_13()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_6:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_13

	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5.5
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2.5
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_14)

	local var_5_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_15)

	local function var_5_16()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_16

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("HorizontalMinimalScrollbarSliderArea", HorizontalMinimalScrollbarSliderArea)
LockTable(_M)
