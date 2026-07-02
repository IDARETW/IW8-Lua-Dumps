module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._isExpanded = false

	local function var_1_0(arg_2_0, arg_2_1)
		if arg_2_1.rootName == nil then
			return
		end

		if not arg_2_0.Halo._baseHeight then
			arg_2_0.Halo._baseHeight = arg_2_0.Halo:getHeight()
		end

		arg_1_0:applyElementTransform()

		local var_2_0, var_2_1 = ProjectRootCoordinate(arg_2_1.rootName, arg_2_1.x, arg_2_1.y)

		if arg_2_0:IsPositionInside(var_2_0, var_2_1) and not arg_2_0.slider:IsPositionInside(var_2_0, var_2_1) then
			arg_2_0.Halo:SetAlpha(1)

			local var_2_2, var_2_3 = Engine.DBFFAEEFGJ():PixelsToUnits(var_2_0, var_2_1)
			local var_2_4, var_2_5, var_2_6, var_2_7 = arg_2_0:getCurrentGlobalRect()
			local var_2_8 = var_2_3 - var_2_5
			local var_2_9 = var_2_8 - arg_2_0.Halo._baseHeight / 2
			local var_2_10 = var_2_8 + arg_2_0.Halo._baseHeight / 2

			arg_2_0.Halo:SetTop(var_2_9)
			arg_2_0.Halo:SetBottom(var_2_10)
		else
			arg_2_0.Halo:SetAlpha(0)
		end

		arg_1_0:undoElementTransform()
	end

	arg_1_0:addEventHandler("expand", function(arg_3_0, arg_3_1)
		if not arg_3_0._isExpanded then
			if not arg_3_1.controller then
				local var_3_0 = arg_1_1
			end

			ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")

			arg_3_0._isExpanded = true

			var_1_0(arg_3_0, arg_3_1)
		end
	end)
	arg_1_0:addEventHandler("shrink", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
		ACTIONS.AnimateSequenceByElement(arg_4_0, {
			elementPath = "self.slider",
			sequenceName = "ButtonUp",
			elementName = "slider"
		})

		arg_4_0._isExpanded = false
	end)
	arg_1_0:addEventHandler("mousemove", var_1_0)
end

function VerticalScrollbarSliderArea(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 11 * _1080p, 0, 300 * _1080p)

	var_5_0.id = "VerticalScrollbarSliderArea"
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
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, _1080p * 112, _1080p * 190)
	var_5_0:addElement(var_5_6)

	var_5_0.Halo = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("VerticalScrollbarSlider", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "slider"

	var_5_8:SetAlpha(0.8, 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -2.5, _1080p * 2.5, _1080p * 40, _1080p * 90)
	var_5_0:addElement(var_5_8)

	var_5_0.slider = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2.5
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5.5
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_10)

	local var_5_11 = {
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
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_11)

	local function var_5_12()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_12

	local var_5_13 = {
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
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2.5
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2.5
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_13)

	local var_5_14 = {
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
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_14)

	local function var_5_15()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_15

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("VerticalScrollbarSliderArea", VerticalScrollbarSliderArea)
LockTable(_M)
