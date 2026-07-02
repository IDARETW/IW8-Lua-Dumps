module(..., package.seeall)

function CPPlaylistList(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 442 * _1080p, 0, 690 * _1080p)

	var_1_0.id = "CPPlaylistList"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Scrollbar"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 426, _1080p * 442, 0, _1080p * 690)
	var_1_0:addElement(var_1_4)

	var_1_0.Scrollbar = var_1_4

	local var_1_5
	local var_1_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 14,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_1_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PlaylistButton", {
				controllerIndex = var_1_1
			})
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_7 = LUI.UIDataSourceGrid.new(var_1_6)

	var_1_7.id = "PlaylistButtons"

	var_1_7:setUseStencil(true)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 690)
	var_1_0:addElement(var_1_7)

	var_1_0.PlaylistButtons = var_1_7

	local var_1_8
	local var_1_9 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_1_1
	})

	var_1_9.id = "ArrowUp"

	var_1_9:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -100, _1080p * -68, _1080p * 14, _1080p * 46)
	var_1_0:addElement(var_1_9)

	var_1_0.ArrowUp = var_1_9

	local var_1_10
	local var_1_11 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_1_1
	})

	var_1_11.id = "ArrowDown"

	var_1_11.Arrow:SetZRotation(180, 0)
	var_1_11:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 68, _1080p * 100, _1080p * 14, _1080p * 46)
	var_1_0:addElement(var_1_11)

	var_1_0.ArrowDown = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIText.new()

	var_1_13.id = "ListCount"

	var_1_13:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_1_13:setText("", 0)
	var_1_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_13:SetAlignment(LUI.Alignment.Center)
	var_1_13:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_13:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -68, _1080p * 68, _1080p * 20, _1080p * 40)
	var_1_0:addElement(var_1_13)

	var_1_0.ListCount = var_1_13

	local var_1_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_1_4,
		startCap = var_1_4.startCap,
		endCap = var_1_4.endCap,
		sliderArea = var_1_4.sliderArea,
		slider = var_1_4.sliderArea and var_1_4.sliderArea.slider,
		fixedSizeSlider = var_1_4.sliderArea and var_1_4.sliderArea.fixedSizeSlider
	})

	var_1_7:AddScrollbar(var_1_14)
	var_1_7:AddArrow(var_1_9)
	var_1_7:AddArrow(var_1_11)
	var_1_7:AddItemNumbers(var_1_13)

	return var_1_0
end

MenuBuilder.registerType("CPPlaylistList", CPPlaylistList)
LockTable(_M)
