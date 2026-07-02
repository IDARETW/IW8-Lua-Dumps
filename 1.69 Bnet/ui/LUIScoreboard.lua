LUI.Scoreboard = LUI.Class(LUI.UIElement)

function LUI.Scoreboard.init(arg_1_0, arg_1_1, arg_1_2)
	LUI.Scoreboard.super.init(arg_1_0, arg_1_1)
	assert(arg_1_1)

	arg_1_0._controllerIndex = arg_1_1.controllerIndex

	if not arg_1_1.grid then
		local var_1_0 = LUI.UIGrid.new(arg_1_2)

		var_1_0.id = "ScoreboardGrid"

		var_1_0:setUseStencil(false)
		var_1_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

		arg_1_0._grid = var_1_0

		arg_1_0:addElement(var_1_0)
	else
		arg_1_0._grid = arg_1_1.grid
	end

	arg_1_0._numPlayers = 0
	arg_1_0._arrowIndicator = arg_1_1.arrowIndicator
	arg_1_0._direction = arg_1_1.direction or LUI.DIRECTION.vertical
	arg_1_0._numPlayersFunc = arg_1_1.numPlayersFunction
	arg_1_0._postRefreshFunc = arg_1_1.postRefreshFunction
	arg_1_0._refreshInterval = arg_1_1.refreshInterval or 1000

	if arg_1_1.scrollbar then
		arg_1_0._scrollbar = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = arg_1_1.scrollbar,
			startCap = arg_1_1.scrollbar.startCap,
			endCap = arg_1_1.scrollbar.endCap,
			sliderArea = arg_1_1.scrollbar.sliderArea,
			slider = arg_1_1.scrollbar.sliderArea and arg_1_1.scrollbar.sliderArea.slider,
			fixedSizeSlider = arg_1_1.scrollbar.sliderArea and arg_1_1.scrollbar.sliderArea.fixedSizeSlider,
			mouseWheelTarget = arg_1_0._grid
		})

		arg_1_0._grid:AddScrollbar(arg_1_0._scrollbar)
	end

	arg_1_0:SetNumberOfPlayersFunction(arg_1_0._numPlayersFunc)

	local var_1_1 = LUI.UITimer.new({
		interval = arg_1_0._refreshInterval,
		event = {
			name = "refreshScores"
		}
	})

	var_1_1.id = "TeamScoresTimer"

	arg_1_0:addElement(var_1_1)

	local function var_1_2(arg_2_0, arg_2_1)
		arg_2_0:RefreshGrid()
		arg_2_0:UpdateScrollIndicatorArrow(arg_2_0:GetCurrentNumberOfPlayers(), SCOREBOARD.maxVisibleTeamSize)

		local var_2_0 = arg_2_0:GetCurrentNumberOfPlayers({
			returnFriendTeamRealNum = true
		})

		arg_2_0:UpdateTeamCount(var_2_0)
	end

	arg_1_0:registerEventHandler("open_scoreboard", var_1_2)
	arg_1_0:registerEventHandler("refreshScores", var_1_2)
end

function LUI.Scoreboard.SetPostRefreshFunc(arg_3_0, arg_3_1)
	arg_3_0._postRefreshFunc = arg_3_1
end

function LUI.Scoreboard.GetGrid(arg_4_0)
	return arg_4_0._grid
end

function LUI.Scoreboard.GetTeamIndex(arg_5_0)
	return arg_5_0._teamIndex
end

function LUI.Scoreboard.SetTeamIndex(arg_6_0, arg_6_1)
	arg_6_0._teamIndex = arg_6_1
end

function LUI.Scoreboard.GetCurrentNumberOfPlayers(arg_7_0, arg_7_1)
	if not arg_7_0._teamIndex then
		return 0
	end

	if arg_7_0._numPlayersFunc and not Engine.DDJFBBJAIG() then
		arg_7_0._numPlayers = arg_7_0._numPlayersFunc(arg_7_0, arg_7_1)
	elseif Engine.DDJFBBJAIG() then
		arg_7_0._numPlayers = SCOREBOARD.GetCurrentNumberPlayersAAR(arg_7_0._controllerIndex, arg_7_0._teamIndex)
	end

	return arg_7_0._numPlayers
end

function LUI.Scoreboard.SetNumberOfPlayersFunction(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		return Game.DJABDGEIID(arg_9_0._teamIndex)
	end

	arg_8_0._numPlayersFunc = arg_8_1 or var_8_0
end

function LUI.Scoreboard.SetDefaultFocusFunction(arg_10_0, arg_10_1)
	assert(type(arg_10_1) == "function")
	arg_10_0._grid:SetDefaultFocus(arg_10_1)
end

function LUI.Scoreboard.SetSFX(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:GetCurrentNumberOfPlayers()

	for iter_11_0 = 0, var_11_0 - 1 do
		local var_11_1 = arg_11_0:GetGridChild(iter_11_0)

		if var_11_1 and var_11_1.setGainFocusSFX then
			var_11_1:setGainFocusSFX(tostring(arg_11_1))
		end
	end
end

function LUI.Scoreboard.GetIndex(arg_12_0)
	local var_12_0 = arg_12_0:GetCurrentNumberOfPlayers()

	for iter_12_0 = 0, var_12_0 - 1 do
		local var_12_1 = arg_12_0:GetGridChild(iter_12_0)

		if var_12_1 and var_12_1:IsMyRow() then
			return iter_12_0
		end
	end
end

function LUI.Scoreboard.GetRelativeIndex(arg_13_0)
	local var_13_0 = arg_13_0:GetCurrentNumberOfPlayers()
	local var_13_1 = 0

	for iter_13_0 = 0, var_13_0 - 1 do
		local var_13_2 = arg_13_0:GetGridChild(iter_13_0)

		if var_13_2 then
			var_13_1 = var_13_1 + 1

			if var_13_2:IsMyRow() then
				return var_13_1
			end
		end
	end
end

function LUI.Scoreboard.GetGridChild(arg_14_0, arg_14_1)
	if arg_14_0._direction == LUI.DIRECTION.vertical then
		return arg_14_0._grid:GetElementAtPosition(0, arg_14_1)
	else
		return arg_14_0._grid:GetElementAtPosition(arg_14_1, 0)
	end
end

function LUI.Scoreboard.UpdateIndicatorArrowAlignment(arg_15_0)
	local var_15_0 = arg_15_0._arrowIndicator

	if not var_15_0 then
		return
	end

	local var_15_1, var_15_2 = arg_15_0._grid:GetRowBoundaries()

	if var_15_2 ~= nil and var_15_2 >= arg_15_0:GetCurrentNumberOfPlayers() - 1 then
		ACTIONS.AnimateSequence(var_15_0, "IndicatorUp")
	else
		ACTIONS.AnimateSequence(var_15_0, "IndicatorDown")
	end
end

function LUI.Scoreboard.UpdateScrollIndicatorArrow(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0._arrowIndicator

	if not var_16_0 then
		return
	end

	arg_16_0:UpdateIndicatorArrowAlignment()

	if arg_16_2 < arg_16_1 then
		var_16_0:SetAlpha(1)
	else
		var_16_0:SetAlpha(0)
	end
end

function LUI.Scoreboard.UpdateTeamCount(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.teamCount

	if not var_17_0 then
		return
	end

	local var_17_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.maxClientCount"):GetValue(controllerIndex)

	var_17_1 = Dvar.DHEEJCCJBH("MOLPOSLOMO") == "infect" and var_17_1 or var_17_1 / 2

	if MLG.DBIBHEAEGD() then
		var_17_0:SetAlpha(0)
	else
		var_17_0:SetAlpha(1)
		var_17_0:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", tostring(arg_17_1), tostring(var_17_1)))
	end
end

function LUI.Scoreboard.RefreshGrid(arg_18_0)
	local var_18_0 = arg_18_0._grid
	local var_18_1 = arg_18_0:GetCurrentNumberOfPlayers()

	if (arg_18_0._direction == LUI.DIRECTION.vertical and var_18_0:GetNumRows() or var_18_0:GetNumColumns()) ~= var_18_1 then
		if arg_18_0._direction == LUI.DIRECTION.vertical then
			var_18_0:SetNumRows(var_18_1)
			var_18_0:SetNumColumns(1)
		else
			var_18_0:SetNumRows(1)
			var_18_0:SetNumColumns(var_18_1)
		end
	end

	if Engine.EAIICIFIFA() then
		var_18_0:SetTargetRowToDefault()
	end

	var_18_0:RefreshContent()

	var_18_0.refreshOnScroll = true

	if arg_18_0._postRefreshFunc then
		arg_18_0._postRefreshFunc()
	end
end
