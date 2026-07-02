module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Grid:SetMask(arg_1_0.GridMask)
end

function BattlePassGridContainer(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1400 * _1080p, 0, 390 * _1080p)

	var_2_0.id = "BattlePassGridContainer"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:setUseStencil(true)

	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "GridMask"

	var_2_4:setImage(RegisterMaterial("gradient_center_out"), 0)
	var_2_4:SetUMin(0.25, 0)
	var_2_4:SetUMax(0.75, 0)
	var_2_4:SetVMin(0.1, 0)
	var_2_4:SetVMax(1.03, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -46, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.GridMask = var_2_4

	local var_2_5
	local var_2_6 = {
		scrollingThresholdX = 4,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 9,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_2_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BattlePassItem", {
				controllerIndex = var_2_1
			})
		end,
		refreshChild = function(arg_4_0, arg_4_1, arg_4_2)
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
	local var_2_7 = LUI.UIGrid.new(var_2_6)

	var_2_7.id = "Grid"

	var_2_7:setUseStencil(false)
	var_2_7:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -700, _1080p * 700, _1080p * -272, _1080p * -34)
	var_2_0:addElement(var_2_7)

	var_2_0.Grid = var_2_7

	local var_2_8
	local var_2_9 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
		controllerIndex = var_2_1
	})

	var_2_9.id = "HorizontalScrollbar"

	var_2_9:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 1400, _1080p * -12, 0)
	var_2_0:addElement(var_2_9)

	var_2_0.HorizontalScrollbar = var_2_9

	local var_2_10 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.horizontal,
		eventListener = var_2_9,
		startCap = var_2_9.startCap,
		endCap = var_2_9.endCap,
		sliderArea = var_2_9.sliderArea,
		slider = var_2_9.sliderArea and var_2_9.sliderArea.slider,
		fixedSizeSlider = var_2_9.sliderArea and var_2_9.sliderArea.fixedSizeSlider
	})

	var_2_7:AddScrollbar(var_2_10)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BattlePassGridContainer", BattlePassGridContainer)
LockTable(_M)
