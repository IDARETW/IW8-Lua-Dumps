module(..., package.seeall)

local var_0_0 = {
	PHASE_PRE_SEARCH = {
		StartLookingButton = "LUA_MENU_MP/START_LOOKING_FOR_PARTY"
	},
	PHASE_SEARCHING_AND_NO_JOINED = {
		StartLookingButton = "MENU/STOP_SEARCHING_FOR_PARTY"
	},
	PHASE_SEARCHING_AND_NOT_FULL = {
		HOST = {
			StartLookingButton = "MENU/STOP_SEARCHING_FOR_PARTY"
		},
		MEMBER = {
			StartLookingButton = "MENU/STOP_SEARCHING_FOR_PARTY"
		}
	},
	PHASE_SEARCHING_AND_FULL = {
		StartLookingButton = "MENU/PLAYERMATCH_PLAYLISTS"
	}
}

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0:registerEventHandler("button_action", arg_1_1)
end

local function var_0_2(arg_2_0)
	local var_2_0 = 1
	local var_2_1 = FRIENDS.GetRefreshPlayerChildFunc(arg_2_0, arg_2_0._tabID, var_2_0)

	arg_2_0.PlayersGrid:SetRefreshChild(var_2_1)
end

local function var_0_3(arg_3_0, arg_3_1)
	LUI.FlowManager.RequestLeaveMenuByName("BRLookForParty", true, true)

	return true
end

local function var_0_4(arg_4_0, arg_4_1)
	if arg_4_0.disabled ~= arg_4_1 then
		ACTIONS.AnimateSequence(arg_4_0, arg_4_1 and "WZWipDisabled" or "WZWipEnabled")

		arg_4_0.disabled = arg_4_1

		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = Engine.IJEBHJIJF()

	Lobby.CheckAndGeneratePlayerLFPSession(var_5_0, Lobby.LFPEvents.STOPPED)
	Engine.EBIDFIDHIE(Lobby.LOOK_FOR_PARTY_STOP_SEARCHING_STRING)
	var_0_4(arg_5_0, true)
end

local function var_0_6(arg_6_0, arg_6_1)
	local var_6_0 = Engine.IJEBHJIJF()

	Engine.EBIDFIDHIE(Lobby.LOOK_FOR_PARTY_EXEC_STRING)
	Lobby.SetLookForPartyBinaryData(var_6_0)
	Lobby.RegisterInitialLFPInstrumentData(var_6_0)
	var_0_4(arg_6_0, true)
end

local function var_0_7(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.StartLookingButton
	local var_7_1 = arg_7_0.LeavePartyButton
	local var_7_2 = arg_7_0.SearchSettingsButton
	local var_7_3
	local var_7_4

	;({}).controller = arg_7_1

	if not Lobby.LOOK_FOR_PARTY_OPTIONS._isSearchingForGroup then
		if Lobby.LOOK_FOR_PARTY_OPTIONS._requiredPlayerCount <= 0 and Lobby.LOOK_FOR_PARTY_OPTIONS._currentPlayerCount > 1 then
			var_7_3 = var_0_0.PHASE_SEARCHING_AND_FULL.StartLookingButton

			if Lobby.LOOK_FOR_PARTY_OPTIONS._isHost then
				var_0_4(var_7_0, false)
				var_0_1(var_7_0, var_0_3)
			else
				var_0_4(var_7_0, true)
			end
		else
			if Lobby.LOOK_FOR_PARTY_OPTIONS._isHost then
				var_0_4(var_7_0, false)
				var_0_1(var_7_0, var_0_6)
			else
				var_0_4(var_7_0, true)
			end

			var_7_3 = var_0_0.PHASE_PRE_SEARCH.StartLookingButton
		end
	elseif not Lobby.LOOK_FOR_PARTY_OPTIONS._isInParty or Lobby.LOOK_FOR_PARTY_OPTIONS._currentPlayerCount <= 1 then
		var_0_1(var_7_0, var_0_5)
		var_0_4(var_7_0, false)

		var_7_3 = var_0_0.PHASE_SEARCHING_AND_NO_JOINED.StartLookingButton
	elseif Lobby.LOOK_FOR_PARTY_OPTIONS._requiredPlayerCount > 0 then
		var_0_1(var_7_0, var_0_5)

		if Lobby.LOOK_FOR_PARTY_OPTIONS._isHost then
			var_7_3 = var_0_0.PHASE_SEARCHING_AND_NOT_FULL.HOST.StartLookingButton

			var_0_4(var_7_0, false)
		else
			var_7_3 = var_0_0.PHASE_SEARCHING_AND_NOT_FULL.MEMBER.StartLookingButton

			var_0_4(var_7_0, true)
		end
	else
		var_0_1(var_7_0, var_0_3)

		var_7_3 = var_0_0.PHASE_SEARCHING_AND_FULL.StartLookingButton

		if Lobby.LOOK_FOR_PARTY_OPTIONS._isHost then
			var_0_4(var_7_0, false)
		else
			var_0_4(var_7_0, true)
		end
	end

	if Lobby.LOOK_FOR_PARTY_OPTIONS._currentPlayerCount <= 1 then
		if not arg_7_0.IsLeaveButtonHidden then
			var_7_4 = "HideLeaveButton"
			arg_7_0.IsLeaveButtonHidden = true
		end

		var_0_4(var_7_1, true)

		var_7_0.navigation.down = var_7_2
		var_7_2.navigation.up = var_7_0
	else
		if arg_7_0.IsLeaveButtonHidden then
			var_7_4 = "ShowLeaveButton"
			arg_7_0.IsLeaveButtonHidden = false
		end

		var_0_4(var_7_1, false)

		var_7_0.navigation.down = var_7_1
		var_7_1.navigation.up = var_7_0
		var_7_1.navigation.down = var_7_2
		var_7_2.navigation.up = var_7_1
	end

	local var_7_5 = PRIVATE_MATCH.GetLobbyCurrentPlayerCount()
	local var_7_6 = Dvar.CFHDGABACF("MLSNOOMMNO") - var_7_5

	if Lobby.LOOK_FOR_PARTY_OPTIONS ~= nil then
		if not Lobby.LOOK_FOR_PARTY_OPTIONS._isSearchingForGroup then
			Lobby.CheckAndGeneratePlayerLFPSession(arg_7_1, Lobby.LFPEvents.LEAVE)
		elseif var_7_6 == 0 then
			Lobby.CheckAndGeneratePlayerLFPSession(arg_7_1, Lobby.LFPEvents.SUCCESS)
		end
	end

	if var_7_4 ~= nil then
		ACTIONS.AnimateSequence(arg_7_0, var_7_4)
	end

	var_7_0.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(var_7_3)))
end

local function var_0_8(arg_8_0, arg_8_1)
	local var_8_0 = Lobby.GFFECBCCF()
	local var_8_1 = Lobby.BGIADHIHAG()
	local var_8_2 = Lobby.DGDCDCHFGD()
	local var_8_3 = Lobby.BEGGHJIBDC()
	local var_8_4 = PRIVATE_MATCH.GetLobbyCurrentPlayerCount()
	local var_8_5 = var_8_1 == false and Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE ~= nil and Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE or Dvar.CFHDGABACF("MLSNOOMMNO")
	local var_8_6 = PRIVATE_MATCH.GetLobbyMinPlayerCount()
	local var_8_7 = var_8_6 - var_8_4
	local var_8_8 = LUI.clamp(var_8_7, 0, var_8_6)

	if var_8_8 <= 0 then
		Engine.EBIDFIDHIE(Lobby.LOOK_FOR_PARTY_STOP_SEARCHING_STRING)
	end

	Lobby.LOOK_FOR_PARTY_OPTIONS = {
		_isSearchingForGroup = var_8_2,
		_isInParty = var_8_0,
		_isHost = var_8_1,
		_currentPlayerCount = var_8_4,
		_maxPlayerCount = var_8_5,
		_minPlayerCount = var_8_6,
		_requiredPlayerCount = var_8_8
	}

	var_0_7(arg_8_0, arg_8_1)
	arg_8_0.StatusPanel:UpdateStatusHeaderAndDesc()

	Lobby.LOOK_FOR_PARTY_HOST_SEARCH_SETTINGS_STRING = var_8_3

	if Lobby.LOOK_FOR_PARTY_HOST_SEARCH_SETTINGS_STRING ~= nil and Lobby.LOOK_FOR_PARTY_HOST_SEARCH_SETTINGS_STRING ~= "" then
		Lobby.BuildLookForPartyStatusWidgetDataFromHostSettingsString(arg_8_1)
	end
end

local function var_0_9(arg_9_0, arg_9_1)
	local var_9_0

	assert(arg_9_1 and arg_9_1[1] and arg_9_1[1].buttonData, "Game Mode UI data for the Look For Party Feature must exist, have an entry at position 1, and that entry must have a buttonData member.")

	for iter_9_0 = 1, #arg_9_1[1].buttonData do
		if BitwiseOperators.band(arg_9_0, 1) == 1 then
			return true
		end

		arg_9_0 = BitwiseOperators.rshift(arg_9_0, 1)
	end

	return false
end

local function var_0_10(arg_10_0)
	Lobby.LOOK_FOR_PARTY_BINARY_RESET = false
	Lobby.LOOK_FOR_PARTY_BINARY_DATA = Lobby.LOOK_FOR_PARTY_DEFAULT_BINARY_DATA

	Lobby.SetLookForPartyBinaryData(arg_10_0)
end

local function var_0_11(arg_11_0, arg_11_1)
	local var_11_0 = Lobby.LOOK_FOR_PARTY_METADATA

	Lobby.LOOK_FOR_PARTY_BINARY_DATA = Engine.CDJEFFHGJG(arg_11_1)

	if Lobby.LOOK_FOR_PARTY_BINARY_DATA == 0 or Lobby.LOOK_FOR_PARTY_BINARY_DATA == nil or Lobby.LOOK_FOR_PARTY_BINARY_RESET == true then
		var_0_10(arg_11_1)
	end

	local var_11_1 = Lobby.LOOK_FOR_PARTY_BINARY_DATA
	local var_11_2 = Lobby.LOOK_FOR_PARTY_FLYOUT_DATA[Lobby.LOOK_FOR_PARTY_METADATA.GAME_MODE_DATA_REF]
	local var_11_3 = Lobby.LOOK_FOR_PARTY_FLYOUT_DATA[Lobby.LOOK_FOR_PARTY_METADATA.MISC_PARTY_DATA_REF]

	if var_0_9(var_11_1, var_11_2) == false then
		var_0_10(arg_11_1)
	end

	local var_11_4

	local function var_11_5(arg_12_0, arg_12_1)
		local var_12_0
		local var_12_1
		local var_12_2 = 0

		for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
			local var_12_3 = iter_12_1[var_11_0.EXEC_CAT_CODE_REF]

			if Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_12_3] == nil then
				Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_12_3] = {}
			end

			for iter_12_2, iter_12_3 in ipairs(iter_12_1[var_11_0.BUTTON_DATA_REF]) do
				if BitwiseOperators.band(arg_12_0, 1) == 1 then
					local var_12_4 = iter_12_3[Lobby.LOOK_FOR_PARTY_METADATA.MAX_PARTY_SIZE_REF]
					local var_12_5 = iter_12_3[Lobby.LOOK_FOR_PARTY_METADATA.EXEC_CODE_REF]

					if not Lobby.LOOK_FOR_PARTY_EXEC_INTERACTED then
						Lobby.LOOK_FOR_PARTY_EXEC_CODES[var_12_3][var_12_5] = var_12_5

						Lobby.LookForPartySetMaxParty(var_12_5, var_12_4)

						local var_12_6 = Lobby.PrepLookForPartyPanelData(iter_12_3)

						Lobby.SetLookForPartyStatusPanelData(var_12_6, true)
					end
				end

				arg_12_0 = BitwiseOperators.rshift(arg_12_0, 1)
				var_12_2 = var_12_2 + 1
			end
		end

		return arg_12_0, var_12_2
	end

	local var_11_6 = Lobby.LOOK_FOR_PARTY_BINARY_DATA
	local var_11_7, var_11_8 = var_11_5(var_11_6, var_11_2)
	local var_11_9 = Lobby.MAX_POSSIBLE_GAMEMODES - var_11_8

	if var_11_9 > 1 then
		var_11_7 = BitwiseOperators.rshift(var_11_7, var_11_9)
	end

	var_11_5(var_11_7, var_11_3)
	arg_11_0:dispatchEventToRoot({
		immediate = true,
		name = "update_lfp_status_panel"
	})
	Lobby.BuildLookForPartyExecString(Lobby.LOOK_FOR_PARTY_EXEC_CODES)
end

local function var_0_12(arg_13_0, arg_13_1, arg_13_2)
	Engine.DHFCHIIJCA("squad_lobby")

	arg_13_0.SetNotificationDataSource = SetNotificationDataSource
	arg_13_0.SwitchEventHandler = var_0_1
	arg_13_0.StartLookingFunction = var_0_6
	arg_13_0.StopSearchingFunction = var_0_5
	arg_13_0.FindMatchFunction = var_0_3
	arg_13_0.SetRefreshChildFunction = var_0_2
	arg_13_0.ButtonHandler = ButtonHandler
	arg_13_0.IsLeaveButtonHidden = true

	arg_13_0.LeavePartyButton:SetAlpha(0)
	arg_13_0.PlayersGrid:SetNumChildren(0)

	arg_13_0.StartLookingButton.navigation = {}
	arg_13_0.LeavePartyButton.navigation = {}
	arg_13_0.SearchSettingsButton.navigation = {}
	arg_13_0.PlayersGrid.navigation = {}
	arg_13_0.StartLookingButton.navigation.up = arg_13_0.PlayersGrid
	arg_13_0.StartLookingButton.navigation.down = arg_13_0.LeavePartyButton
	arg_13_0.LeavePartyButton.navigation.up = arg_13_0.StartLookingButton
	arg_13_0.LeavePartyButton.navigation.down = arg_13_0.SearchSettingsButton
	arg_13_0.SearchSettingsButton.navigation.up = arg_13_0.LeavePartyButton
	arg_13_0.SearchSettingsButton.navigation.down = arg_13_0.PlayersGrid
	arg_13_0.PlayersGrid.navigation.up = arg_13_0.SearchSettingsButton
	arg_13_0.PlayersGrid.navigation.down = arg_13_0.StartLookingButton

	local var_13_0 = LUI.UITimer.new({
		interval = 500,
		event = "update_lfg_lobby_status"
	})

	var_13_0.id = "lobbyStatusTimer"

	arg_13_0:addElement(var_13_0)
	arg_13_0:registerEventHandler("update_lfg_lobby_status", function(arg_14_0, arg_14_1)
		var_0_8(arg_13_0, arg_13_1)
	end)

	arg_13_0._tabID = FRIENDS.TabIDs.PRIVATE_PARTY

	Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.matchSearch)
	arg_13_0.SearchSettingsButton:setActionSFX(SOUND_SETS.default.action)
	arg_13_0.StartLookingButton:setActionSFX(SOUND_SETS.default.action)

	local var_13_1 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

	local function var_13_2()
		local var_15_0 = var_13_1:GetValue(arg_13_1) or 0
		local var_15_1 = isHost == false and Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE ~= nil and Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE or Dvar.CFHDGABACF("MLSNOOMMNO")

		FRIENDS.SetPlayerGridHeader(arg_13_0, Engine.CBBHFCGDIC("LUA_MENU/PARTY_COUNT_WITH_ICON", var_15_0, var_15_1), nil, true)
	end

	arg_13_0:SubscribeToModel(var_13_1:GetModel(arg_13_1), var_13_2)

	local function var_13_3()
		var_13_2()
		var_0_8(arg_13_0, arg_13_1)

		if Lobby.DGDCDCHFGD() then
			Engine.EBIDFIDHIE(Lobby.LOOK_FOR_PARTY_STOP_SEARCHING_STRING)
			Engine.EBIDFIDHIE(Lobby.LOOK_FOR_PARTY_EXEC_STRING)
			Lobby.SetLookForPartyBinaryData(arg_13_1)
			Lobby.RegisterInitialLFPInstrumentData(arg_13_1)
		end
	end

	arg_13_0.SearchSettingsButton:registerEventHandler("button_action", function(arg_17_0, arg_17_1)
		local var_17_0 = MenuBuilder.BuildRegisteredType("BRLookForPartySettingsInput", {
			controllerIndex = arg_13_1
		})

		LUI.FlowManager.RegisterStackPopBehaviour("FlyInPopup", var_13_3)
		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_13_1, false, {
			flyInLeftNarrow = true,
			disableQuickAccessShortcuts = false,
			widget = var_17_0
		})
	end)
	arg_13_0.StartLookingButton:registerEventHandler("button_action", var_0_6)

	local function var_13_4(arg_18_0, arg_18_1)
		local var_18_0 = LUI.FlowManager.GetMenuByName("BRLookForParty").menu

		LUI.FlowManager.RequestPopupMenu(arg_13_0, "LeavePrivatePartyConfirmPopup", true, arg_18_1.controller, false, {
			moveUI = false,
			menu = var_18_0
		})
	end

	arg_13_0.LeavePartyButton:registerEventHandler("button_action", var_13_4)
	arg_13_0:SetRefreshChildFunction()

	local function var_13_5()
		local var_19_0 = CoD.GetAspectRatioScaleAdjust(0.5)

		arg_13_0.Vignette:SetScale(var_19_0)
		arg_13_0.GradientRight:SetScale(var_19_0)
	end

	arg_13_0:addAndCallEventHandler("onVideoChange", var_13_5)

	arg_13_0._maxLobbyCharactersInPlayMenu = FrontEndScene.MaxClientCharactersMPMainMenu
	arg_13_0.characterDetailsWidgets = Lobby.BuildCharacterDetailWidgets(arg_13_0._maxLobbyCharactersInPlayMenu, arg_13_0, arg_13_1)

	if not arg_13_0.characterTimer then
		arg_13_0.characterTimer = LUI.UITimer.new({
			interval = 1000,
			event = "update_client_characters"
		})
		arg_13_0.characterTimer.id = "lobbyTimer"

		arg_13_0:addElement(arg_13_0.characterTimer)
	end

	local function var_13_6()
		local var_20_0 = {
			maxCharactersToShow = arg_13_0._maxLobbyCharactersInPlayMenu,
			widget = arg_13_0,
			dataSourcePath = Lobby.SquadMembersPath
		}

		Lobby.UpdateClientCharactersDelayed(arg_13_0, arg_13_1, var_20_0, function(arg_21_0)
			arg_13_0._clientCharacterMap = arg_21_0

			Lobby.UpdateCharacterDetailsWidgets(arg_13_0._clientCharacterMap, arg_13_0.characterDetailsWidgets, arg_13_1)
		end)

		local var_20_1 = arg_13_0.PlayersGrid

		var_20_1.playersData = Friends.BJDEIGDDCD()

		local var_20_2 = #var_20_1.playersData

		var_20_1:SetNumChildren(var_20_2)
		arg_13_0.PlayersGrid:RefreshContent()
	end

	arg_13_0:registerEventHandler("update_client_characters", function(arg_22_0, arg_22_1)
		var_13_6()
	end)
	var_13_6()

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_13_0, "Arabic")
	end

	Lobby.InitLookForPartyFlyoutData(arg_13_1)
	var_0_11(arg_13_0, arg_13_1)
end

function BRLookForPartyWidgetsContainer(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIVerticalNavigator.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_23_0.id = "BRLookForPartyWidgetsContainer"
	var_23_0._animationSets = var_23_0._animationSets or {}
	var_23_0._sequences = var_23_0._sequences or {}

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = LUI.UIImage.new()

	var_23_4.id = "Vignette"

	var_23_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_23_4:SetAlpha(0.5, 0)
	var_23_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_23_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_23_0:addElement(var_23_4)

	var_23_0.Vignette = var_23_4

	local var_23_5
	local var_23_6 = LUI.UIImage.new()

	var_23_6.id = "GradientRight"

	var_23_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_23_6:SetAlpha(0.5, 0)
	var_23_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_23_6:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_23_0:addElement(var_23_6)

	var_23_0.GradientRight = var_23_6

	local var_23_7
	local var_23_8 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_23_1
	})

	var_23_8.id = "VerticalScrollbar"

	var_23_8:SetAlpha(0, 0)
	var_23_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 618, _1080p * 630, _1080p * 257, _1080p * 502)
	var_23_0:addElement(var_23_8)

	var_23_0.VerticalScrollbar = var_23_8

	local var_23_9
	local var_23_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_23_1
	})

	var_23_10.id = "StartLookingButton"

	var_23_10.Text:SetLeft(_1080p * 20, 0)
	var_23_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/START_LOOKING_FOR_PARTY")), 0)
	var_23_10.Text:SetAlignment(LUI.Alignment.Left)
	var_23_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 608, _1080p * -227, _1080p * -167)
	var_23_0:addElement(var_23_10)

	var_23_0.StartLookingButton = var_23_10

	local var_23_11
	local var_23_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_23_1
	})

	var_23_12.id = "LeavePartyButton"

	var_23_12.Text:SetLeft(_1080p * 20, 0)
	var_23_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/LEAVE_THIS_PARTY")), 0)
	var_23_12.Text:SetAlignment(LUI.Alignment.Left)
	var_23_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 608, _1080p * -162, _1080p * -124)
	var_23_0:addElement(var_23_12)

	var_23_0.LeavePartyButton = var_23_12

	local var_23_13
	local var_23_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_23_1
	})

	var_23_14.id = "SearchSettingsButton"
	var_23_14.buttonDescription = Engine.CBBHFCGDIC("MENU/MY_PARTY_SETTINGS")

	var_23_14.Text:SetLeft(_1080p * 20, 0)
	var_23_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/MY_PARTY_SETTINGS")), 0)
	var_23_14.Text:SetAlignment(LUI.Alignment.Left)
	var_23_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 608, _1080p * -162, _1080p * -102)
	var_23_0:addElement(var_23_14)

	var_23_0.SearchSettingsButton = var_23_14

	local var_23_15
	local var_23_16 = {
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 5,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = true,
		springCoefficient = 400,
		maxVisibleRows = SubtractForSplitscreen(4, 6),
		controllerIndex = var_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_23_1
			})
		end,
		refreshChild = function(arg_25_0, arg_25_1, arg_25_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_23_17 = LUI.UIGrid.new(var_23_16)

	var_23_17.id = "PlayersGrid"

	var_23_17:setUseStencil(false)
	var_23_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 602, _1080p * 263, _1080p * 604)
	var_23_0:addElement(var_23_17)

	var_23_0.PlayersGrid = var_23_17

	local var_23_18
	local var_23_19 = LUI.UIStyledText.new()

	var_23_19.id = "HeadText"

	var_23_19:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_23_19:SetAlpha(0, 0)
	var_23_19:setText(Engine.CBBHFCGDIC("LUA_MENU/RECEIVED_REQUESTS"), 0)
	var_23_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_19:SetWordWrap(false)
	var_23_19:SetAlignment(LUI.Alignment.Left)
	var_23_19:SetOptOutRightToLeftAlignmentFlip(true)
	var_23_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_23_19:SetStartupDelay(2000)
	var_23_19:SetLineHoldTime(400)
	var_23_19:SetAnimMoveTime(2000)
	var_23_19:SetAnimMoveSpeed(150)
	var_23_19:SetEndDelay(2000)
	var_23_19:SetCrossfadeTime(400)
	var_23_19:SetFadeInTime(300)
	var_23_19:SetFadeOutTime(300)
	var_23_19:SetMaxVisibleLines(2)
	var_23_19:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -803, _1080p * 225, _1080p * 249)
	var_23_0:addElement(var_23_19)

	var_23_0.HeadText = var_23_19

	local var_23_20
	local var_23_21 = LUI.UIImage.new()

	var_23_21.id = "HeadLine"

	var_23_21:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_23_21:SetAlpha(0, 0)
	var_23_21:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_23_21:Setup3SliceHorizontalImage(_1080p * 10, 0.3)
	var_23_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 1123, _1080p * 250, _1080p * 251)
	var_23_0:addElement(var_23_21)

	var_23_0.HeadLine = var_23_21

	local var_23_22
	local var_23_23 = LUI.UIText.new()

	var_23_23.id = "PlayerNumText"

	var_23_23:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_23_23:SetAlpha(0, 0)
	var_23_23:setText("LUA_MENU/RECEIVED_REQUES", 0)
	var_23_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_23_23:SetAlignment(LUI.Alignment.Right)
	var_23_23:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 422, _1080p * -1312, _1080p * 225, _1080p * 249)
	var_23_0:addElement(var_23_23)

	var_23_0.PlayerNumText = var_23_23

	local var_23_24
	local var_23_25 = MenuBuilder.BuildRegisteredType("WZLookForPartyStatusPanel", {
		controllerIndex = var_23_1
	})

	var_23_25.id = "StatusPanel"

	var_23_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -610, _1080p * -130, _1080p * 257, _1080p * 808)
	var_23_0:addElement(var_23_25)

	var_23_0.StatusPanel = var_23_25

	local function var_23_26()
		return
	end

	var_23_0._sequences.DefaultSequence = var_23_26

	local var_23_27
	local var_23_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("HideLeaveButton", var_23_28)

	local var_23_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 771
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 831
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 711
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 771
		}
	}

	var_23_14:RegisterAnimationSequence("HideLeaveButton", var_23_29)

	local function var_23_30()
		var_23_12:AnimateSequence("HideLeaveButton")
		var_23_14:AnimateSequence("HideLeaveButton")
	end

	var_23_0._sequences.HideLeaveButton = var_23_30

	local var_23_31
	local var_23_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_12:RegisterAnimationSequence("ShowLeaveButton", var_23_32)

	local var_23_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 715
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 775
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 773
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 833
		}
	}

	var_23_14:RegisterAnimationSequence("ShowLeaveButton", var_23_33)

	local function var_23_34()
		var_23_12:AnimateSequence("ShowLeaveButton")
		var_23_14:AnimateSequence("ShowLeaveButton")
	end

	var_23_0._sequences.ShowLeaveButton = var_23_34

	local var_23_35 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_23_8,
		startCap = var_23_8.startCap,
		endCap = var_23_8.endCap,
		sliderArea = var_23_8.sliderArea,
		slider = var_23_8.sliderArea and var_23_8.sliderArea.slider,
		fixedSizeSlider = var_23_8.sliderArea and var_23_8.sliderArea.fixedSizeSlider
	})

	var_23_17:AddScrollbar(var_23_35)
	var_0_12(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("BRLookForPartyWidgetsContainer", BRLookForPartyWidgetsContainer)
LockTable(_M)
