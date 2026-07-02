module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function ButtonLayoutButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 600 * _1080p)

	var_2_0.id = "ButtonLayoutButtons"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		wrapX = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 3,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		maxVisibleRows = SubtractForSplitscreen(13, 6),
		controllerIndex = var_2_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ButtonLayoutButton", {
				controllerIndex = var_2_1
			})
		end,
		spacingX = _1080p * 11,
		spacingY = _1080p * 11,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_2_5 = LUI.UIDataSourceGrid.new(var_2_4)

	var_2_5.id = "ButtonLayouts"

	var_2_5:setUseStencil(false)
	var_2_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 652)
	var_2_0:addElement(var_2_5)

	var_2_0.ButtonLayouts = var_2_5

	local var_2_6
	local var_2_7 = LUI.UIImage.new()

	var_2_7.id = "Spacer"

	var_2_7:SetAlpha(0, 0)
	var_2_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 662, _1080p * 712)
	var_2_0:addElement(var_2_7)

	var_2_0.Spacer = var_2_7

	local var_2_8
	local var_2_9 = LUI.UIStyledText.new()

	var_2_9.id = "HelperText"

	var_2_9:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_9:setText(Engine.CBBHFCGDIC("MENU/COLOR_INDICATOR_DESC"), 0)
	var_2_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_9:SetAlignment(LUI.Alignment.Left)
	var_2_9:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 363, _1080p * 722, _1080p * 742)
	var_2_0:addElement(var_2_9)

	var_2_0.HelperText = var_2_9

	local var_2_10
	local var_2_11 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_2_1
	})

	var_2_11.id = "Scrollbar"

	var_2_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 605, _1080p * 617, 0, _1080p * 600)
	var_2_0:addElement(var_2_11)

	var_2_0.Scrollbar = var_2_11

	local function var_2_12()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_12

	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 152.21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 585.21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 529
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_2_9:RegisterAnimationSequence("Splitscreen", var_2_13)

	local var_2_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 349
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_2_11:RegisterAnimationSequence("Splitscreen", var_2_14)

	local function var_2_15()
		var_2_9:AnimateSequence("Splitscreen")
		var_2_11:AnimateSequence("Splitscreen")
	end

	var_2_0._sequences.Splitscreen = var_2_15

	local var_2_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 600
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 723
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 758
		}
	}

	var_2_9:RegisterAnimationSequence("AR", var_2_16)

	local function var_2_17()
		var_2_9:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_17

	local var_2_18 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_2_11,
		startCap = var_2_11.startCap,
		endCap = var_2_11.endCap,
		sliderArea = var_2_11.sliderArea,
		slider = var_2_11.sliderArea and var_2_11.sliderArea.slider,
		fixedSizeSlider = var_2_11.sliderArea and var_2_11.sliderArea.fixedSizeSlider
	})

	var_2_5:AddScrollbar(var_2_18)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ButtonLayoutButtons", ButtonLayoutButtons)
LockTable(_M)
