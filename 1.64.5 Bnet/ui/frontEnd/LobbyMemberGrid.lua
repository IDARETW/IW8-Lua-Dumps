module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.modelPath
	local var_1_1 = arg_1_2.numCols or 1
	local var_1_2 = arg_1_2.numRows or 11
	local var_1_3 = arg_1_2.left or 130
	local var_1_4 = arg_1_2.right or 1120
	local var_1_5 = arg_1_2.top or 248
	local var_1_6 = arg_1_2.bottom or 800
	local var_1_7 = true

	if arg_1_2.useStencil ~= nil then
		var_1_7 = arg_1_2.useStencil
	end

	local var_1_8 = {
		scrollingThresholdX = 1,
		maxVelocity = 8000,
		adjustSizeToContent = false,
		alwaysSnap = true,
		scrollingThresholdY = 1,
		maxCols = 1,
		wrapX = false,
		wrapY = true,
		springCoefficient = 989,
		maxVisibleColumns = var_1_1,
		maxVisibleRows = var_1_2,
		controllerIndex = arg_1_1,
		buildChild = function()
			local var_2_0 = MenuBuilder.BuildRegisteredType("LobbyPlayer", {
				controllerIndex = arg_1_1
			})

			var_2_0:SetGridChildDynamicSize(true, LUI.DIRECTION.vertical)
			var_2_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)

			if LUI.IsLastInputMouseNavigation(arg_1_1) then
				var_2_0.LobbyGamertagPlayer:SetHandleMouse(false)
				var_2_0:SetHandleMouse(false)

				var_2_0.actionSFX = nil
			end

			return var_2_0
		end,
		columnWidth = _1080p * 989,
		rowHeight = _1080p * 40,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		primaryAxis = LUI.DIRECTION.vertical,
		maxRows = MP.LOBBY_PLAYER_COUNT.medium
	}
	local var_1_9 = LUI.UIDataSourceGrid.new(var_1_8)

	var_1_9.id = "PlayerList"

	var_1_9:setUseStencil(var_1_7)
	var_1_9:AddItemNumbers(arg_1_0.ListCount)
	var_1_9:AddArrow(arg_1_0.ArrowUp)
	arg_1_0.ArrowUp:SetupArrow(LUI.BEARING.up)
	var_1_9:AddArrow(arg_1_0.ArrowDown)
	arg_1_0.ArrowDown:SetupArrow(LUI.BEARING.down)
	var_1_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_1_3, _1080p * var_1_4, _1080p * var_1_5, _1080p * var_1_6)
	var_1_9:SetMeasureRowFunction(function(arg_3_0)
		if var_1_9:GetFocusPosition(LUI.DIRECTION.vertical) == arg_3_0 and not LUI.IsLastInputMouseNavigation(arg_1_1) then
			return 130 * _1080p
		else
			return 40 * _1080p
		end
	end)

	local var_1_10 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_1_0.VerticalMinimalScrollbar,
		startCap = arg_1_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_1_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_1_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_1_0.VerticalMinimalScrollbar.sliderArea and arg_1_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_1_0.VerticalMinimalScrollbar.sliderArea and arg_1_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	var_1_9:AddScrollbar(var_1_10)

	local var_1_11 = LUI.DataSourceInGlobalModel.new(var_1_0 .. ".count")
	local var_1_12 = LUI.DataSourceFromList.new(var_1_11)

	var_1_12.MakeDataSourceAtIndex = Lobby.GetLobbyMemberDataSourceAtIndex(var_1_0)

	var_1_9:SetGridDataSource(var_1_12)

	local function var_1_13(arg_4_0)
		local var_4_0 = arg_4_0:GetCurrentAnchorsAndPositions()
		local var_4_1 = (var_1_3 - 130) * _1080p
		local var_4_2 = (var_1_5 - 248) * _1080p

		arg_4_0:SetLeft(var_4_0.left + var_4_1)
		arg_4_0:SetRight(var_4_0.right + var_4_1)
		arg_4_0:SetTop(var_4_0.top + var_4_2)
		arg_4_0:SetBottom(var_4_0.bottom + var_4_2)
	end

	var_1_13(arg_1_0.PlayerCount)
	var_1_13(arg_1_0.Line)
	var_1_13(arg_1_0.VerticalMinimalScrollbar)
	var_1_13(arg_1_0.ListCount)
	var_1_13(arg_1_0.ArrowDown)
	var_1_13(arg_1_0.ArrowUp)
	arg_1_0:registerEventHandler("lobby_mute_event", function(arg_5_0, arg_5_1)
		var_1_9:RefreshContent()
	end)

	return var_1_9
end

local function var_0_1(arg_6_0)
	arg_6_0._clanQueueTimer = LUI.UITimer.new({
		interval = 1100,
		event = "clan_queue_refresh_timer"
	})
	arg_6_0._clanQueueTimer.id = "ClanQueueRefreshTimer"

	arg_6_0:addElement(arg_6_0._clanQueueTimer)
	arg_6_0:addAndCallEventHandler("clan_queue_refresh_timer", function(arg_7_0, arg_7_1)
		CLANS.CLAN_DATA.CheckAndRefireProcessArray()
	end)
end

local function var_0_2(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0.PlayerList = var_0_0(arg_8_0, arg_8_1, arg_8_2)

	arg_8_0.PlayerList:RefreshContent()
	arg_8_0:addElement(arg_8_0.PlayerList)
	assert(arg_8_0.PlayerCount)

	local var_8_0 = LUI.DataSourceInGlobalModel.new(arg_8_2.modelPath .. ".memberCount")
	local var_8_1 = DataSources.frontEnd.lobby.memberMaxCount

	local function var_8_2()
		local var_9_0 = var_8_0:GetValue(arg_8_1)
		local var_9_1 = var_8_1:GetValue(arg_8_1)

		if var_9_0 ~= nil and var_9_1 ~= nil then
			arg_8_0.PlayerCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PLAYER_COUNT_PUBLIC", var_9_0, var_9_1))
		end
	end

	arg_8_0:SubscribeToModel(var_8_0:GetModel(arg_8_1), var_8_2)
	arg_8_0:SubscribeToModel(var_8_1:GetModel(arg_8_1), var_8_2)

	if CONDITIONS.IsClanUIEnabled() then
		arg_8_0:registerEventHandler(CLANS.CLAN_EVENTS.CLAN_DATA_RESOLVED, function(arg_10_0, arg_10_1)
			CLANS.CLAN_DATA.SetAndUpdateElementData(arg_10_1 and arg_10_1.clanDetails and arg_10_1.clanDetails[1], arg_8_0._controllerIndex)
		end)
		var_0_1(arg_8_0)
	end
end

function LobbyMemberGrid(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "LobbyMemberGrid"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIText.new()

	var_11_4.id = "PlayerCount"

	var_11_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PLAYER_COUNT_PUBLIC"), 0)
	var_11_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_11_4:SetAlignment(LUI.Alignment.Left)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 238)
	var_11_0:addElement(var_11_4)

	var_11_0.PlayerCount = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Line"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_6:SetAlpha(0.4, 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 596, _1080p * 240, _1080p * 241)
	var_11_0:addElement(var_11_6)

	var_11_0.Line = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "VerticalMinimalScrollbar"

	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 107, _1080p * 240, _1080p * 798)
	var_11_0:addElement(var_11_8)

	var_11_0.VerticalMinimalScrollbar = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "ArrowUp"

	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -697, _1080p * -665, _1080p * 803, _1080p * 835)
	var_11_0:addElement(var_11_10)

	var_11_0.ArrowUp = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "ArrowDown"

	var_11_12.Arrow:SetZRotation(180, 0)
	var_11_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -529, _1080p * -497, _1080p * 803, _1080p * 835)
	var_11_0:addElement(var_11_12)

	var_11_0.ArrowDown = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIText.new()

	var_11_14.id = "ListCount"

	var_11_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_14:setText("", 0)
	var_11_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_14:SetAlignment(LUI.Alignment.Center)
	var_11_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_11_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -665, _1080p * -529, _1080p * 810, _1080p * 830)
	var_11_0:addElement(var_11_14)

	var_11_0.ListCount = var_11_14

	var_0_2(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("LobbyMemberGrid", LobbyMemberGrid)
LockTable(_M)
