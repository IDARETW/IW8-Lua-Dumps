module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.boardsToUse
	local var_1_1 = {}

	if arg_1_0._isHardcore then
		for iter_1_0 = 1, #var_1_0 do
			local var_1_2 = var_1_0[iter_1_0]

			if Leaderboards.GetLeaderboardHasHardcoreMode(var_1_2) then
				table.insert(var_1_1, var_1_2)
			end
		end

		var_1_0 = var_1_1
	end

	arg_1_0.GameModeGrid:SetNumChildren(#var_1_0)
	arg_1_0.GameModeGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_2 + arg_2_1 * arg_1_0.GameModeGrid:GetNumRows() + 1
		local var_2_1 = var_1_0[var_2_0]
		local var_2_2 = Engine.CBBHFCGDIC(Leaderboards.GetLeaderboardTitle(var_2_1))

		arg_2_0:SetFiltered(var_2_1 == arg_1_0._currentBoard and true or false)
		arg_2_0.Text:setText(var_2_2)

		arg_2_0._board = var_2_1
	end)
	arg_1_0.GameModeGrid:AddItemNumbers(arg_1_0.GridCountArrows.ListCount)
	arg_1_0.GameModeGrid:AddArrow(arg_1_0.GridCountArrows.ArrowUp)
	arg_1_0.GameModeGrid:AddArrow(arg_1_0.GridCountArrows.ArrowDown)
	arg_1_0.GridCountArrows.ArrowUp:SetupArrow(LUI.BEARING.up)
	arg_1_0.GridCountArrows.ArrowDown:SetupArrow(LUI.BEARING.down)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2.changeLeaderboard(arg_3_1._board)
	LUI.FlowManager.RequestLeaveMenu(arg_3_0)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._currentBoard = arg_4_2.leaderboard
	arg_4_0._isHardcore = arg_4_2.isHardcore

	assert(arg_4_0.MenuTitle)
	arg_4_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SELECT"))
	var_0_0(arg_4_0, arg_4_2)
	arg_4_0:addEventHandler("leaderboard_on_filter_changed", function(arg_5_0, arg_5_1)
		var_0_1(arg_5_0, arg_5_1.child, arg_4_2)

		return true
	end)
end

function LeaderboardGamemodeSelectFlyout(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "LeaderboardGamemodeSelectFlyout"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:setUseStencil(true)

	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "MenuTitle"

	var_6_4.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SELECT"), 0)
	var_6_4.Line:SetLeft(0, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 700, 0, _1080p * 100)
	var_6_0:addElement(var_6_4)

	var_6_0.MenuTitle = var_6_4

	local var_6_5
	local var_6_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 10,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LeaderboardFilterButton", {
				controllerIndex = var_6_1
			})
		end,
		refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 21,
		spacingY = _1080p * 21,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_6_7 = LUI.UIGrid.new(var_6_6)

	var_6_7.id = "GameModeGrid"

	var_6_7:setUseStencil(true)
	var_6_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 600, _1080p * 159, _1080p * 848)
	var_6_0:addElement(var_6_7)

	var_6_0.GameModeGrid = var_6_7

	local var_6_8
	local var_6_9 = MenuBuilder.BuildRegisteredType("GridCountArrows", {
		controllerIndex = var_6_1
	})

	var_6_9.id = "GridCountArrows"

	var_6_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 250, _1080p * 450, _1080p * 889, _1080p * 920)
	var_6_0:addElement(var_6_9)

	var_6_0.GridCountArrows = var_6_9

	local var_6_10
	local var_6_11 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_6_1
	})

	var_6_11.id = "Scrollbar"

	var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 620, _1080p * 631, _1080p * 159, _1080p * 848)
	var_6_0:addElement(var_6_11)

	var_6_0.Scrollbar = var_6_11

	local var_6_12 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_6_11,
		startCap = var_6_11.startCap,
		endCap = var_6_11.endCap,
		sliderArea = var_6_11.sliderArea,
		slider = var_6_11.sliderArea and var_6_11.sliderArea.slider,
		fixedSizeSlider = var_6_11.sliderArea and var_6_11.sliderArea.fixedSizeSlider
	})

	var_6_7:AddScrollbar(var_6_12)
	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("LeaderboardGamemodeSelectFlyout", LeaderboardGamemodeSelectFlyout)
LockTable(_M)
