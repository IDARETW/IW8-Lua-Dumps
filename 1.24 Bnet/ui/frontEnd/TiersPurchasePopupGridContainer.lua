module(..., package.seeall)

function TiersPurchasePopupGridContainer(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 952 * _1080p, 0, 357 * _1080p)

	var_1_0.id = "TiersPurchasePopupGridContainer"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:setUseStencil(true)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "LeftArrow"

	var_1_4.Arrow:SetZRotation(90, 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -88, _1080p * -56, _1080p * -32, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.LeftArrow = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "RightArrow"

	var_1_6.Arrow:SetZRotation(-90, 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 56, _1080p * 88, _1080p * -32, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.RightArrow = var_1_6

	local var_1_7
	local var_1_8 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 6,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_1_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BattlePassTierItem", {
				controllerIndex = var_1_1
			})
		end,
		refreshChild = function(arg_3_0, arg_3_1, arg_3_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 160,
		rowHeight = _1080p * 238,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_9 = LUI.UIGrid.new(var_1_8)

	var_1_9.id = "Grid"

	var_1_9:setUseStencil(false)
	var_1_9:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -476, _1080p * 476, _1080p * -357, _1080p * -52)
	var_1_0:addElement(var_1_9)

	var_1_0.Grid = var_1_9

	local var_1_10
	local var_1_11 = LUI.UIStyledText.new()

	var_1_11.id = "IndexLabel"

	var_1_11:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_11:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y"), 0)
	var_1_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_1_11:SetWordWrap(false)
	var_1_11:SetAlignment(LUI.Alignment.Center)
	var_1_11:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_11:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -36, _1080p * 36, _1080p * -27, _1080p * -5)
	var_1_0:addElement(var_1_11)

	var_1_0.IndexLabel = var_1_11

	local var_1_12
	local var_1_13 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
		controllerIndex = var_1_1
	})

	var_1_13.id = "HorizontalScrollbar"

	var_1_13:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -476, _1080p * 476, _1080p * -48, _1080p * -36)
	var_1_0:addElement(var_1_13)

	var_1_0.HorizontalScrollbar = var_1_13

	local var_1_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.horizontal,
		eventListener = var_1_13,
		startCap = var_1_13.startCap,
		endCap = var_1_13.endCap,
		sliderArea = var_1_13.sliderArea,
		slider = var_1_13.sliderArea and var_1_13.sliderArea.slider,
		fixedSizeSlider = var_1_13.sliderArea and var_1_13.sliderArea.fixedSizeSlider
	})

	var_1_9:AddScrollbar(var_1_14)
	var_1_9:AddArrow(var_1_4)
	var_1_9:AddArrow(var_1_6)
	var_1_9:AddItemNumbers(var_1_11)

	return var_1_0
end

MenuBuilder.registerType("TiersPurchasePopupGridContainer", TiersPurchasePopupGridContainer)
LockTable(_M)
