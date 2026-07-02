module(..., package.seeall)

local var_0_0 = {
	EXPANDED = 1,
	COLLAPSED = 0
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._displayStates = var_0_0.COLLAPSED

	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = CONDITIONS.IsWZWipDvarEnabled() and arg_2_0.WZWipHalo or arg_2_0.Halo

		if not var_2_0._baseHeight then
			var_2_0._baseHeight = var_2_0:getHeight()
		end

		arg_1_0:applyElementTransform()

		local var_2_1, var_2_2 = ProjectRootCoordinate(arg_2_1.rootName, arg_2_1.x, arg_2_1.y)

		if arg_2_0:IsPositionInside(var_2_1, var_2_2) and not arg_2_0.fixedSizeSlider:IsPositionInside(var_2_1, var_2_2) then
			var_2_0:SetAlpha(1)

			local var_2_3, var_2_4 = Engine.DBFFAEEFGJ():PixelsToUnits(var_2_1, var_2_2)
			local var_2_5, var_2_6, var_2_7, var_2_8 = arg_2_0:getCurrentGlobalRect()
			local var_2_9 = var_2_4 - var_2_6
			local var_2_10 = var_2_9 - var_2_0._baseHeight / 2
			local var_2_11 = var_2_9 + var_2_0._baseHeight / 2

			var_2_0:SetTop(var_2_10)
			var_2_0:SetBottom(var_2_11)
		else
			var_2_0:SetAlpha(0)
		end

		arg_1_0:undoElementTransform()
	end

	arg_1_0:addEventHandler("mousemove", var_1_0)
	arg_1_0:addEventHandler("expand", function(arg_3_0, arg_3_1)
		if arg_3_0._displayStates == var_0_0.COLLAPSED then
			ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")

			arg_3_0._displayStates = var_0_0.EXPANDED
		end
	end)
	arg_1_0:addEventHandler("shrink", function(arg_4_0, arg_4_1)
		if arg_4_0._displayStates == var_0_0.EXPANDED then
			ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")

			arg_4_0._displayStates = var_0_0.COLLAPSED
		end
	end)
end

function VerticalMinimalScrollbarSliderArea(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 11 * _1080p, 0, 400 * _1080p)

	var_5_0.id = "VerticalMinimalScrollbarSliderArea"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

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
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -2.5, _1080p * 2.5, 0, 0)
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
	var_5_6:setImage(RegisterMaterial("scrollbar_gradient"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, _1080p * 148, _1080p * 226)
	var_5_0:addElement(var_5_6)

	var_5_0.Halo = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "WZWipHalo"

	var_5_8:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:setImage(RegisterMaterial("ui_gradient_center_out_vertical"), 0)
	var_5_8:SetUMin(100, 0)
	var_5_8:Setup3SliceVerticalImage(_1080p * 10, 0.1)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, _1080p * 148, _1080p * 226)
	var_5_0:addElement(var_5_8)

	var_5_0.WZWipHalo = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbarSlider", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "fixedSizeSlider"

	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -3, _1080p * 70, _1080p * 170)
	var_5_0:addElement(var_5_10)

	var_5_0.fixedSizeSlider = var_5_10

	local function var_5_11()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_11

	local var_5_12
	local var_5_13 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5.5
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_13)

	local var_5_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_14)

	local var_5_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_15)

	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_16)

	local function var_5_17()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_6:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
		var_5_10:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_17

	local var_5_18
	local var_5_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5.5
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2.5
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_19)

	local var_5_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_20)

	local function var_5_21()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_21

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("VerticalMinimalScrollbarSliderArea", VerticalMinimalScrollbarSliderArea)
LockTable(_M)
