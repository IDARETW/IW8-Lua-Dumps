module(..., package.seeall)

function StickLayoutButtons(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalStackedLayout.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 459 * _1080p, 0, 400 * _1080p)

	var_1_0.id = "StickLayoutButtons"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(10 * _1080p)

	local var_1_3
	local var_1_4 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 7,
		buildArrowsLabel = false,
		wrapX = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_1_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("StickLayoutButton", {
				controllerIndex = var_1_1
			})
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_5 = LUI.UIDataSourceGrid.new(var_1_4)

	var_1_5.id = "StickLayouts"

	var_1_5:setUseStencil(false)
	var_1_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 296)
	var_1_0:addElement(var_1_5)

	var_1_0.StickLayouts = var_1_5

	local var_1_6
	local var_1_7 = LUI.UIImage.new()

	var_1_7.id = "Spacer"

	var_1_7:SetAlpha(0, 0)
	var_1_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 306, _1080p * 356)
	var_1_0:addElement(var_1_7)

	var_1_0.Spacer = var_1_7

	local var_1_8
	local var_1_9 = LUI.UIStyledText.new()

	var_1_9.id = "HelperText"

	var_1_9:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_9:setText(Engine.CBBHFCGDIC("MENU/COLOR_INDICATOR_DESC"), 0)
	var_1_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_9:SetAlignment(LUI.Alignment.Left)
	var_1_9:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, _1080p * 366, _1080p * 388)
	var_1_0:addElement(var_1_9)

	var_1_0.HelperText = var_1_9

	local function var_1_10()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_10

	local var_1_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 152.21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 652.21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 519
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

	var_1_9:RegisterAnimationSequence("Splitscreen", var_1_11)

	local function var_1_12()
		var_1_9:AnimateSequence("Splitscreen")
	end

	var_1_0._sequences.Splitscreen = var_1_12

	return var_1_0
end

MenuBuilder.registerType("StickLayoutButtons", StickLayoutButtons)
LockTable(_M)
