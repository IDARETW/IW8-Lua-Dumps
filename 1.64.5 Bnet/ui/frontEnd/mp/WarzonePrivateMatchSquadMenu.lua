module(..., package.seeall)

local function var_0_0(arg_1_0)
	self._isSquadActionLocked = arg_1_0
end

local function var_0_1(arg_2_0)
	return arg_2_0._requestResultReceived
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._requestResultReceived = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0._requestSquadData = arg_4_1
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = SQUAD.GetAllSquadCount()

	assert(var_5_0 > 0, "squad count needs to be greater than 0")
	arg_5_0._squadList:SetNumChildren(var_5_0)
	arg_5_0._squadList:SetRefreshChild(function(arg_6_0, arg_6_1, arg_6_2)
		if MatchRules.EAIEFBHGJ() then
			local var_6_0 = arg_5_0._squadList:GetContentIndex(arg_6_1, arg_6_2, {
				relativePosition = false
			})
			local var_6_1 = SQUAD.GetAllSquadList(arg_5_0._matchmakerSettings)
			local var_6_2 = var_6_1[var_6_0 + 1]

			arg_6_0:SetupSquadTeam(arg_5_1, var_6_2)

			local var_6_3
			local var_6_4 = "LUA_MENU_MP/ASSIGNED_TO_SQUAD_NUM"

			if var_6_1.availableSquadCount <= 1 then
				var_6_3 = Engine.CBBHFCGDIC("LUA_MENU_MP/AVAILABLE_SQUAD_COUNT_SINGLE", tostring(var_6_1.availableSquadCount))
			else
				var_6_3 = Engine.CBBHFCGDIC("LUA_MENU_MP/AVAILABLE_SQUAD_COUNT", tostring(var_6_1.availableSquadCount))
			end

			if SQUAD.GetPlayerSquadIndex() == -1 then
				arg_5_0.SquadCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NOT_ASSIGNED_SQUAD_DETAILS", var_6_3))
			else
				arg_5_0.SquadCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/ASSIGNED_TO_SQUAD_NUM", var_6_3, SQUAD.GetPlayerSquadIndex()))
			end

			local var_6_5 = PRIVATE_MATCH.GetLobbyMaxPlayerCount()
			local var_6_6 = PRIVATE_MATCH.GetLobbyCurrentPlayerCount()

			arg_5_0.LobbyPlayerCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOBBY_COUNT", var_6_6, var_6_5))
		end
	end)

	local var_5_1 = SQUAD.GetPlayerSquadIndex()

	if var_5_1 == -1 then
		arg_5_0._squadList:SetDefaultFocus({
			x = 0,
			y = 0
		})
	else
		arg_5_0._squadList:SetDefaultFocus({
			x = (var_5_1 - 1) % 3,
			y = (var_5_1 - 1) / 3
		})
	end

	arg_5_0._squadList:processEvent({
		name = "gain_focus",
		controller = arg_5_1
	})
	arg_5_0._squadList:RefreshContent()
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_RANDOM_SQUAD")
	})
	arg_7_0.bindButton:addEventHandler("button_alt2", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_0:getParent()

		if var_8_0 then
			SQUAD.ProcessJoinRandomSquadAction(arg_7_1, {
				matchmakerSettings = var_8_0._matchmakerSettings,
				menu = var_8_0
			})
		end
	end)

	if arg_7_2 then
		arg_7_0:registerEventHandler("menu_create", function(arg_9_0, arg_9_1)
			SQUAD.ProcessJoinRandomSquadAction(arg_7_1, {
				matchmakerSettings = arg_7_0._matchmakerSettings,
				menu = arg_7_0
			})
		end)
	end
end

local function var_0_6(arg_10_0, arg_10_1)
	arg_10_0.leaveSquadButtonEnabled = SQUAD.GetPlayerSquadIndex() >= 0

	if arg_10_0.leaveSquadButtonEnabled then
		arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/LEAVE_SQUAD")
		})
	end

	arg_10_0.bindButton:addEventHandler("button_alt1", function(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_0:getParent()

		if var_11_0 and var_11_0.leaveSquadButtonEnabled then
			SQUAD.ProcessLeaveSquadAction(arg_10_1, {
				matchmakerSettings = var_11_0._matchmakerSettings,
				menu = var_11_0
			})
		end
	end)
end

local function var_0_7(arg_12_0, arg_12_1)
	arg_12_0.leaveSquadButtonEnabled = true

	arg_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/LEAVE_SQUAD")
	})
end

local function var_0_8(arg_13_0, arg_13_1)
	arg_13_0.leaveSquadButtonEnabled = false

	arg_13_0.HelperBar.ButtonHelperText:PopButtonPrompt({
		side = "left",
		button_ref = "button_alt1"
	})
end

local function var_0_9(arg_14_0, arg_14_1)
	arg_14_0.lobbyTimer = LUI.UITimer.new({
		interval = 2000,
		event = "update_squad_list"
	})
	arg_14_0.lobbyTimer.id = "SquadListTimer"

	arg_14_0:addElement(arg_14_0.lobbyTimer)
	arg_14_0:addEventHandler("update_squad_list", function(arg_15_0, arg_15_1)
		arg_14_0._squadList:RefreshContent()
	end)
end

local function var_0_10(arg_16_0, arg_16_1)
	local var_16_0 = LUI.FlowManager.GetScopedData("WarzonePrivateMatchLobby")

	if var_16_0.isWarzone then
		arg_16_0._matchmakerSettings = var_16_0.matchmakerSettings
	end
end

local function var_0_11(arg_17_0, arg_17_1)
	arg_17_0:registerEventHandler("squad_request_success", function(arg_18_0, arg_18_1)
		if not arg_18_0:GetSquadRequestResult() then
			DebugPrint("squad_request_success event has been received. \n")

			arg_17_0._isSquadActionLocked = false

			arg_18_0:SetSquadRequestResult(true)

			arg_18_0:Wait(2000).onComplete = function()
				if arg_18_0._requestSquadData then
					local var_19_0 = arg_18_0._requestSquadData.squadIndex
					local var_19_1 = ""

					if var_19_0 == -1 then
						var_0_8(arg_17_0, arg_17_1)

						var_19_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/LEFT_SQUAD_INDEX")
					else
						arg_18_0._squadList:RefreshContent()
						arg_18_0._squadList:SetFocusedPosition({
							x = (var_19_0 - 1) % 3,
							y = (var_19_0 - 1) / 3
						}, true)
						var_0_7(arg_17_0, arg_17_1)

						var_19_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/JOINED_SQUAD_INDEX", var_19_0)
					end

					if arg_18_0._joinedSquadType == SQUAD.JoinedSquadType.RANDOM then
						SQUAD.ProcessJoinRandomSquadSuccessAction(arg_18_0, arg_17_1, var_19_1)
					elseif arg_18_0._joinedSquadType == SQUAD.JoinedSquadType.LEAVE then
						SQUAD.ProcessLeaveSquadSuccessAction(arg_18_0, arg_17_1, var_19_1)
					else
						SQUAD.ProcessJoinSquadSuccessAction(arg_18_0, arg_17_1, var_19_1)
					end
				end
			end
		end
	end)
	arg_17_0:registerEventHandler("squad_request_failure", function(arg_20_0, arg_20_1)
		if not arg_20_0:GetSquadRequestResult() then
			DebugPrint("squad_request_failure event has been received. \n")

			arg_20_0._joinedSquadType = arg_20_1.joinedSquadType

			arg_20_0:SetSquadRequestResult(true)

			arg_20_0:Wait(2000).onComplete = function()
				if arg_20_0._joinedSquadType == SQUAD.JoinedSquadType.RANDOM then
					SQUAD.ProcessJoinRandomSquadFailureAction(arg_20_0, arg_17_1)
				elseif arg_20_0._joinedSquadType == SQUAD.JoinedSquadType.LEAVE then
					SQUAD.ProcessLeaveSquadFailureAction(arg_20_0, arg_17_1)
				else
					SQUAD.ProcessJoinSquadFailureAction(arg_20_0, arg_17_1)
				end
			end
		end
	end)
	arg_17_0:registerEventHandler("request_squad_sent", function(arg_22_0, arg_22_1)
		DebugPrint("request_squad_sent event has been received. \n")

		arg_17_0._isSquadActionLocked = true

		arg_22_0:SetSquadRequestData(arg_22_1.requestSquadData)
		arg_22_0:SetSquadRequestResult(arg_22_1.requestResultReceived)

		arg_22_0._joinedSquadType = arg_22_1.joinedSquadType
	end)
end

local function var_0_12(arg_23_0, arg_23_1)
	if arg_23_0.lobbyStateTimer == nil then
		arg_23_0.lobbyStateTimer = LUI.UITimer.new({
			interval = 100,
			event = "update_squad_menu_lobby_state"
		})
		arg_23_0.lobbyStateTimer.id = "SquadCountTimer"

		arg_23_0:addElement(arg_23_0.lobbyStateTimer)
		arg_23_0:addEventHandler("update_squad_menu_lobby_state", function(arg_24_0, arg_24_1)
			if Lobby.BJFFDBJHDD() and not arg_23_0._isSquadActionLocked then
				ACTIONS.LeaveMenu(arg_23_0)
				LUI.FlowManager.RequestPopupMenu(menu, "LeaveSquadMenuPopup", false, arg_23_1, false, {
					autoCloseTime = 3000
				})
			end
		end)
	end
end

local function var_0_13(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.bindButton = LUI.UIBindButton.new()
	arg_25_0.bindButton.id = "selfBindButton"

	arg_25_0:addElement(arg_25_0.bindButton)
	var_0_11(arg_25_0, arg_25_1)
	var_0_6(arg_25_0, arg_25_1)
	var_0_5(arg_25_0, arg_25_1, arg_25_2.requestRandomSquadNow)
end

local function var_0_14(arg_26_0, arg_26_1, arg_26_2)
	var_0_10(arg_26_0, arg_26_1)
end

local function var_0_15(arg_27_0, arg_27_1, arg_27_2)
	assert(arg_27_0._matchmakerSettings)

	arg_27_0.SetSquadRequestResult = var_0_2
	arg_27_0.GetSquadRequestResult = var_0_1
	arg_27_0.SetSquadRequestData = var_0_3
	arg_27_0.SetSquadActionLockState = var_0_0
	arg_27_0._squadList = arg_27_0.SquadList

	ACTIONS.AnimateSequence(arg_27_0, "SquadScroll")
	var_0_9(arg_27_0, arg_27_1)
	var_0_12(arg_27_0, arg_27_1)
	var_0_4(arg_27_0, arg_27_1)
	var_0_13(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_MP/CHANGE_SQUAD_TITLE"))
	LAYOUT.AddAspectRatioFadeFrame(arg_27_0, arg_27_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_27_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_27_0.Darken)
end

function WarzonePrivateMatchSquadMenu(arg_28_0, arg_28_1)
	local var_28_0 = LUI.UIElement.new()

	var_28_0.id = "WarzonePrivateMatchSquadMenu"
	var_28_0._animationSets = var_28_0._animationSets or {}
	var_28_0._sequences = var_28_0._sequences or {}

	local var_28_1 = arg_28_1 and arg_28_1.controllerIndex

	if not var_28_1 and not Engine.DDJFBBJAIG() then
		var_28_1 = var_28_0:getRootController()
	end

	assert(var_28_1)
	var_0_14(var_28_0, var_28_1, arg_28_1)

	var_28_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_28_1
	})
	var_28_0.HelperBar.id = "HelperBar"

	var_28_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_28_0.HelperBar:setPriority(10)
	var_28_0:addElement(var_28_0.HelperBar)

	local var_28_2 = var_28_0
	local var_28_3
	local var_28_4 = {
		worldBlur = 3,
		controllerIndex = var_28_1
	}
	local var_28_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_28_4)

	var_28_5.id = "WorldBlur"

	var_28_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -57, _1080p * 76, _1080p * 54, 0)
	var_28_0:addElement(var_28_5)

	var_28_0.WorldBlur = var_28_5

	local var_28_6
	local var_28_7 = LUI.UIImage.new()

	var_28_7.id = "Darken"

	var_28_7:SetRGBFromInt(0, 0)
	var_28_7:SetAlpha(0.5, 0)
	var_28_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -59, _1080p * 76, 0, 0)
	var_28_0:addElement(var_28_7)

	var_28_0.Darken = var_28_7

	local var_28_8
	local var_28_9 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_28_1
	})

	var_28_9.id = "Cinematic"

	var_28_9:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -59, _1080p * 76, 0, 0)
	var_28_0:addElement(var_28_9)

	var_28_0.Cinematic = var_28_9

	local var_28_10

	if CONDITIONS.AlwaysFalse(var_28_0) then
		local var_28_11 = {
			scrollingThresholdX = 0,
			buildArrowsLabel = false,
			maxVelocity = 5000,
			adjustSizeToContent = false,
			scrollingThresholdY = 1,
			wrapX = true,
			maxVisibleColumns = 4,
			maxVisibleRows = 10,
			wrapY = true,
			arrowsVerticalOffset = 0,
			springCoefficient = 400,
			controllerIndex = var_28_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("WarzonePrivateMatchSquadSoloTeam", {
					controllerIndex = var_28_1
				})
			end,
			refreshChild = function(arg_30_0, arg_30_1, arg_30_2)
				return
			end,
			spacingX = _1080p * 12,
			spacingY = _1080p * 12,
			columnWidth = _1080p * 380,
			rowHeight = _1080p * 50,
			horizontalAlignment = LUI.Alignment.Center,
			verticalAlignment = LUI.Alignment.Top
		}

		var_28_10 = LUI.UIGrid.new(var_28_11)
		var_28_10.id = "SquadSoloList"

		var_28_10:setUseStencil(true)
		var_28_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -778, _1080p * 778, _1080p * 272, _1080p * 880)
		var_28_0:addElement(var_28_10)

		var_28_0.SquadSoloList = var_28_10
	end

	local var_28_12
	local var_28_13 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		maxVisibleRows = 2,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_28_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WarzonePrivateMatchSquadTeam", {
				controllerIndex = var_28_1
			})
		end,
		refreshChild = function(arg_32_0, arg_32_1, arg_32_2)
			return
		end,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 450,
		rowHeight = _1080p * 280,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_28_14 = LUI.UIGrid.new(var_28_13)

	var_28_14.id = "SquadList"

	var_28_14:setUseStencil(true)
	var_28_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -778, _1080p * 778, _1080p * 272, _1080p * 844)
	var_28_0:addElement(var_28_14)

	var_28_0.SquadList = var_28_14

	local var_28_15
	local var_28_16 = LUI.UIText.new()

	var_28_16.id = "SquadCount"

	var_28_16:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_28_16:setText("", 0)
	var_28_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_28_16:SetAlignment(LUI.Alignment.Left)
	var_28_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_28_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 599, _1080p * 1647, _1080p * 233, _1080p * 251)
	var_28_0:addElement(var_28_16)

	var_28_0.SquadCount = var_28_16

	local var_28_17
	local var_28_18 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_28_1
	})

	var_28_18.id = "VerticalMinimalScrollbar"

	var_28_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1647, _1080p * 1658, _1080p * 272, _1080p * 844)
	var_28_0:addElement(var_28_18)

	var_28_0.VerticalMinimalScrollbar = var_28_18

	local var_28_19
	local var_28_20 = LUI.UIText.new()

	var_28_20.id = "LobbyPlayerCount"

	var_28_20:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_28_20:setText("", 0)
	var_28_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_28_20:SetAlignment(LUI.Alignment.Left)
	var_28_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_28_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 303, _1080p * 569, _1080p * 233, _1080p * 251)
	var_28_0:addElement(var_28_20)

	var_28_0.LobbyPlayerCount = var_28_20

	local var_28_21
	local var_28_22 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_28_1
	})

	var_28_22.id = "TabBacker"

	var_28_22:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -59, _1080p * 76, 0, _1080p * 160)
	var_28_0:addElement(var_28_22)

	var_28_0.TabBacker = var_28_22

	local var_28_23
	local var_28_24 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_28_1
	})

	var_28_24.id = "MenuTitle"

	var_28_24.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CHANGE_SQUAD_TITLE"), 0)
	var_28_24.Line:SetLeft(0, 0)
	var_28_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -60, _1080p * 960, 0, _1080p * 100)
	var_28_0:addElement(var_28_24)

	var_28_0.MenuTitle = var_28_24

	local var_28_25
	local var_28_26 = LUI.UIImage.new()

	var_28_26.id = "SquadCountIcon"

	var_28_26:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_28_26:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_28_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 569, _1080p * 593, _1080p * 231, _1080p * 255)
	var_28_0:addElement(var_28_26)

	var_28_0.SquadCountIcon = var_28_26

	local var_28_27
	local var_28_28 = LUI.UIImage.new()

	var_28_28.id = "DividerLine"

	var_28_28:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_28_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -687, _1080p * 687, _1080p * 260, _1080p * 261)
	var_28_0:addElement(var_28_28)

	var_28_0.DividerLine = var_28_28

	local var_28_29
	local var_28_30 = LUI.UIImage.new()

	var_28_30.id = "LobbyCountIcon"

	var_28_30:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_28_30:setImage(RegisterMaterial("icon_playlist_players"), 0)
	var_28_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 273, _1080p * 297, _1080p * 231, _1080p * 255)
	var_28_0:addElement(var_28_30)

	var_28_0.LobbyCountIcon = var_28_30

	local var_28_31
	local var_28_32 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_28_1
	})

	var_28_32.id = "ArrowUp"

	var_28_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * -68, _1080p * 358, _1080p * 390)
	var_28_0:addElement(var_28_32)

	var_28_0.ArrowUp = var_28_32

	local var_28_33
	local var_28_34 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_28_1
	})

	var_28_34.id = "ArrowDown"

	var_28_34.Arrow:SetZRotation(180, 0)
	var_28_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 68, _1080p * 100, _1080p * 358, _1080p * 390)
	var_28_0:addElement(var_28_34)

	var_28_0.ArrowDown = var_28_34

	local var_28_35
	local var_28_36 = LUI.UIText.new()

	var_28_36.id = "ListCount"

	var_28_36:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_28_36:setText("", 0)
	var_28_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_28_36:SetAlignment(LUI.Alignment.Center)
	var_28_36:SetVerticalAlignment(LUI.Alignment.Center)
	var_28_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -68, _1080p * 68, _1080p * 364, _1080p * 384)
	var_28_0:addElement(var_28_36)

	var_28_0.ListCount = var_28_36

	local function var_28_37()
		return
	end

	var_28_0._sequences.DefaultSequence = var_28_37

	local var_28_38
	local var_28_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 844
		}
	}

	var_28_18:RegisterAnimationSequence("SquadScroll", var_28_39)

	local function var_28_40()
		var_28_18:AnimateSequence("SquadScroll")
	end

	var_28_0._sequences.SquadScroll = var_28_40

	local var_28_41
	local var_28_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 880
		}
	}

	var_28_18:RegisterAnimationSequence("SoloScroll", var_28_42)

	local function var_28_43()
		var_28_18:AnimateSequence("SoloScroll")
	end

	var_28_0._sequences.SoloScroll = var_28_43

	if CONDITIONS.AlwaysFalse(var_28_0) then
		local var_28_44 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_28_18,
			startCap = var_28_18.startCap,
			endCap = var_28_18.endCap,
			sliderArea = var_28_18.sliderArea,
			slider = var_28_18.sliderArea and var_28_18.sliderArea.slider,
			fixedSizeSlider = var_28_18.sliderArea and var_28_18.sliderArea.fixedSizeSlider
		})

		var_28_10:AddScrollbar(var_28_44)
	end

	if CONDITIONS.AlwaysFalse(var_28_0) then
		var_28_10:AddArrow(var_28_32)
		var_28_10:AddArrow(var_28_34)
	end

	if CONDITIONS.AlwaysFalse(var_28_0) then
		var_28_10:AddItemNumbers(var_28_36)
	end

	local var_28_45 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_28_18,
		startCap = var_28_18.startCap,
		endCap = var_28_18.endCap,
		sliderArea = var_28_18.sliderArea,
		slider = var_28_18.sliderArea and var_28_18.sliderArea.slider,
		fixedSizeSlider = var_28_18.sliderArea and var_28_18.sliderArea.fixedSizeSlider
	})

	var_28_14:AddScrollbar(var_28_45)
	var_28_14:AddArrow(var_28_32)
	var_28_14:AddArrow(var_28_34)
	var_28_14:AddItemNumbers(var_28_36)
	var_28_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_28_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_28_46 = LUI.UIBindButton.new()

	var_28_46.id = "selfBindButton"

	var_28_0:addElement(var_28_46)

	var_28_0.bindButton = var_28_46

	var_28_0.bindButton:addEventHandler("button_secondary", function(arg_36_0, arg_36_1)
		if not arg_36_1.controller then
			local var_36_0 = var_28_1
		end

		ACTIONS.LeaveMenu(var_28_0)
	end)
	var_28_0.bindButton:addEventHandler("button_start", function(arg_37_0, arg_37_1)
		local var_37_0 = arg_37_1.controller or var_28_1

		ACTIONS.OpenOptionsMenu(var_37_0, "0", "")
		ACTIONS.PlaySoundSetSound(var_28_0, "selectAlt", false)
	end)
	var_0_15(var_28_0, var_28_1, arg_28_1)

	return var_28_0
end

MenuBuilder.registerType("WarzonePrivateMatchSquadMenu", WarzonePrivateMatchSquadMenu)
LockTable(_M)
