module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.Grid:SetMask(arg_1_0.GridMask)
	ACTIONS.AnimateSequence(arg_1_0, "ShowGridMask")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupAARGridMask = var_0_0

	ACTIONS.AnimateSequence(arg_2_0, "HideGridMask")
end

function BattlePassGridContainer(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1400 * _1080p, 0, 390 * _1080p)

	var_3_0.id = "BattlePassGridContainer"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:setUseStencil(true)

	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "GridMask"

	var_3_4:setImage(RegisterMaterial("gradient_center_out"), 0)
	var_3_4:SetUMin(0.25, 0)
	var_3_4:SetUMax(0.75, 0)
	var_3_4:SetVMin(0.1, 0)
	var_3_4:SetVMax(1.03, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -46, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.GridMask = var_3_4

	local var_3_5
	local var_3_6 = {
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
		controllerIndex = var_3_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BattlePassItem", {
				controllerIndex = var_3_1
			})
		end,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
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
	local var_3_7 = LUI.UIGrid.new(var_3_6)

	var_3_7.id = "Grid"

	var_3_7:setUseStencil(false)
	var_3_7:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -700, _1080p * 700, _1080p * -272, _1080p * -34)
	var_3_0:addElement(var_3_7)

	var_3_0.Grid = var_3_7

	local var_3_8
	local var_3_9 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
		controllerIndex = var_3_1
	})

	var_3_9.id = "HorizontalScrollbar"

	var_3_9:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 1400, _1080p * -12, 0)
	var_3_0:addElement(var_3_9)

	var_3_0.HorizontalScrollbar = var_3_9

	local function var_3_10()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_10

	local var_3_11
	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("HideGridMask", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("HideGridMask")
	end

	var_3_0._sequences.HideGridMask = var_3_13

	local var_3_14
	local var_3_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ShowGridMask", var_3_15)

	local function var_3_16()
		var_3_4:AnimateSequence("ShowGridMask")
	end

	var_3_0._sequences.ShowGridMask = var_3_16

	local var_3_17 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.horizontal,
		eventListener = var_3_9,
		startCap = var_3_9.startCap,
		endCap = var_3_9.endCap,
		sliderArea = var_3_9.sliderArea,
		slider = var_3_9.sliderArea and var_3_9.sliderArea.slider,
		fixedSizeSlider = var_3_9.sliderArea and var_3_9.sliderArea.fixedSizeSlider
	})

	var_3_7:AddScrollbar(var_3_17)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BattlePassGridContainer", BattlePassGridContainer)
LockTable(_M)
