module(..., package.seeall)

function PlaylistList(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalStackedLayout.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 580 * _1080p)

	var_1_0.id = "PlaylistList"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(18 * _1080p)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Scrollbar"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 16, 0, _1080p * 590)
	var_1_0:addElement(var_1_4)

	var_1_0.Scrollbar = var_1_4

	local var_1_5
	local var_1_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 12,
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
		columnWidth = _1080p * 450,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_7 = LUI.UIDataSourceGrid.new(var_1_6)

	var_1_7.id = "PlaylistButtons"

	var_1_7:setUseStencil(true)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 454, 0, _1080p * 590)
	var_1_0:addElement(var_1_7)

	var_1_0.PlaylistButtons = var_1_7

	local var_1_8 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_1_4,
		startCap = var_1_4.startCap,
		endCap = var_1_4.endCap,
		sliderArea = var_1_4.sliderArea,
		slider = var_1_4.sliderArea and var_1_4.sliderArea.slider,
		fixedSizeSlider = var_1_4.sliderArea and var_1_4.sliderArea.fixedSizeSlider
	})

	var_1_7:AddScrollbar(var_1_8)

	return var_1_0
end

MenuBuilder.registerType("PlaylistList", PlaylistList)
LockTable(_M)
