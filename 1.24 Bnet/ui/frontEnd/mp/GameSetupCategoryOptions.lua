module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LUI.UIGrid.new({
		maxVisibleColumns = 1,
		maxVisibleRows = 12,
		wrapY = true,
		maxRows = 100,
		mouseWheelScrollingOffsetPx = 32,
		spacingY = 5 * _1080p,
		controllerIndex = arg_1_1
	})

	var_1_0.id = "optionsGrid"

	var_1_0:setUseStencil(true)
	arg_1_0:addElement(var_1_0)

	arg_1_0.optionsGrid = var_1_0

	local var_1_1 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_1_0.VerticalScrollbar,
		startCap = arg_1_0.VerticalScrollbar.startCap,
		endCap = arg_1_0.VerticalScrollbar.endCap,
		sliderArea = arg_1_0.VerticalScrollbar.sliderArea,
		slider = arg_1_0.VerticalScrollbar.sliderArea and arg_1_0.VerticalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_1_0.VerticalScrollbar.sliderArea and arg_1_0.VerticalScrollbar.sliderArea.fixedSizeSlider
	})

	var_1_1:SetKBMStyle(true)
	arg_1_0.optionsGrid:AddScrollbar(var_1_1)
end

function GameSetupCategoryOptions(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 650 * _1080p, 0, 540 * _1080p)

	var_2_0.id = "GameSetupCategoryOptions"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "VerticalScrollbar"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 650, _1080p * 12, 0, _1080p * 540)
	var_2_0:addElement(var_2_4)

	var_2_0.VerticalScrollbar = var_2_4

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GameSetupCategoryOptions", GameSetupCategoryOptions)
LockTable(_M)
