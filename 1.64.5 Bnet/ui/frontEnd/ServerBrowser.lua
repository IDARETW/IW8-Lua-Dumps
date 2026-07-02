module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.ServerList:AddArrow(arg_1_0.GridCountArrows.ArrowUp)
	arg_1_0.ServerList:AddArrow(arg_1_0.GridCountArrows.ArrowDown)
	arg_1_0.ServerList:AddItemNumbers(arg_1_0.GridCountArrows.ListCount)
end

function ServerBrowser(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1150 * _1080p, 0, 696 * _1080p)

	var_2_0.id = "ServerBrowser"
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
		maxVisibleRows = 16,
		buildArrowsLabel = false,
		wrapX = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_2_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SystemLinkJoinMenuRow", {
				controllerIndex = var_2_1
			})
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 1150,
		rowHeight = _1080p * 37,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_2_5 = LUI.UIDataSourceGrid.new(var_2_4)

	var_2_5.id = "ServerList"

	var_2_5:setUseStencil(true)
	var_2_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1150, _1080p * 44, _1080p * 696)
	var_2_0:addElement(var_2_5)

	var_2_0.ServerList = var_2_5

	local var_2_6
	local var_2_7 = MenuBuilder.BuildRegisteredType("SystemLinkJoinMenuTitleRow", {
		controllerIndex = var_2_1
	})

	var_2_7.id = "TitleRow"

	var_2_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1150, 0, _1080p * 44)
	var_2_0:addElement(var_2_7)

	var_2_0.TitleRow = var_2_7

	local var_2_8
	local var_2_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_2_1
	})

	var_2_9.id = "Scrollbar"

	var_2_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1159, _1080p * 1170, _1080p * 44, _1080p * 696)
	var_2_0:addElement(var_2_9)

	var_2_0.Scrollbar = var_2_9

	local var_2_10
	local var_2_11 = MenuBuilder.BuildRegisteredType("GridCountArrows", {
		controllerIndex = var_2_1
	})

	var_2_11.id = "GridCountArrows"

	var_2_11:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -100, _1080p * 100, _1080p * 12, _1080p * 43)
	var_2_0:addElement(var_2_11)

	var_2_0.GridCountArrows = var_2_11

	local function var_2_12()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_12

	local var_2_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_5:RegisterAnimationSequence("HideScoreboard", var_2_13)

	local var_2_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_9:RegisterAnimationSequence("HideScoreboard", var_2_14)

	local var_2_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_11:RegisterAnimationSequence("HideScoreboard", var_2_15)

	local function var_2_16()
		var_2_5:AnimateSequence("HideScoreboard")
		var_2_9:AnimateSequence("HideScoreboard")
		var_2_11:AnimateSequence("HideScoreboard")
	end

	var_2_0._sequences.HideScoreboard = var_2_16

	local var_2_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_5:RegisterAnimationSequence("ShowScoreboard", var_2_17)

	local var_2_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_9:RegisterAnimationSequence("ShowScoreboard", var_2_18)

	local var_2_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_11:RegisterAnimationSequence("ShowScoreboard", var_2_19)

	local function var_2_20()
		var_2_5:AnimateSequence("ShowScoreboard")
		var_2_9:AnimateSequence("ShowScoreboard")
		var_2_11:AnimateSequence("ShowScoreboard")
	end

	var_2_0._sequences.ShowScoreboard = var_2_20

	local var_2_21 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_2_9,
		startCap = var_2_9.startCap,
		endCap = var_2_9.endCap,
		sliderArea = var_2_9.sliderArea,
		slider = var_2_9.sliderArea and var_2_9.sliderArea.slider,
		fixedSizeSlider = var_2_9.sliderArea and var_2_9.sliderArea.fixedSizeSlider
	})

	var_2_5:AddScrollbar(var_2_21)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ServerBrowser", ServerBrowser)
LockTable(_M)
