module(..., package.seeall)

local var_0_0 = "frontEnd.MP.warzonePrivateLobby.buttons"

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0.widgetModelPath = var_0_0

	local var_1_0 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".disableButton")
	local var_1_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_1_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.everyoneHasMap")
	local var_1_3 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isHostWaitingOnMembers")
	local var_1_4 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.partyClientsUpToDate")
	local var_1_5 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isGameStartRequested")
	local var_1_6 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isMatchmaking")

	local function var_1_7(arg_2_0)
		local var_2_0 = var_1_1:GetValue(arg_2_0)
		local var_2_1 = var_1_5:GetValue(arg_2_0)
		local var_2_2 = var_1_6:GetValue(arg_2_0)

		return not var_2_0 or var_2_1 or var_2_2
	end

	local var_1_8 = LUI.AggregateDataSource.new(var_1_0, {
		var_1_1,
		var_1_5,
		var_1_6
	}, "gameSetupDisabled", var_1_7)

	local function var_1_9()
		local var_3_0 = var_1_8:GetValue(arg_1_1)

		if arg_1_0.WarzonePrivateMatchSetupButton then
			arg_1_0.WarzonePrivateMatchSetupButton:SetButtonDisabled(var_3_0)
		end
	end

	arg_1_0:SubscribeToModel(var_1_8:GetModel(arg_1_1), var_1_9)

	local function var_1_10(arg_4_0)
		local var_4_0 = var_1_1:GetValue(arg_4_0)
		local var_4_1 = var_1_2:GetValue(arg_4_0)
		local var_4_2 = var_1_3:GetValue(arg_4_0)
		local var_4_3 = var_1_4:GetValue(arg_4_0)
		local var_4_4 = var_1_5:GetValue(arg_4_0)
		local var_4_5 = var_1_6:GetValue(arg_4_0)

		DebugPrint("areWeGameHost " .. tostring(var_4_0) .. "\n everyoneHasMap " .. tostring(var_4_1) .. "\n isHostWaitingOnMembers " .. tostring(var_4_2) .. "\n partyClientsUpToDate " .. tostring(var_4_3) .. "\n isGameStartRequested " .. tostring(var_4_4) .. "\n isMatchmaking " .. tostring(var_4_5))

		local var_4_6 = not var_4_0 or not var_4_1 or var_4_2 or not var_4_3 or var_4_4 or var_4_5

		if var_4_0 then
			local var_4_7 = PRIVATE_MATCH.GetLobbyMinPlayerCount()
			local var_4_8 = PRIVATE_MATCH.GetLobbyCurrentPlayerCount()

			if var_4_8 < var_4_7 then
				var_4_6 = true

				local var_4_9 = var_4_7 - var_4_8

				if var_4_9 == 1 then
					arg_1_0.WarzonePrivateMatchStartButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOCKED_REQUIRE_PLAYER", var_4_9))
				else
					arg_1_0.WarzonePrivateMatchStartButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOCKED_REQUIRE_PLAYERS", var_4_9))
				end
			end
		end

		return var_4_6
	end

	local var_1_11 = LUI.AggregateDataSource.new(var_1_0, {
		var_1_1,
		var_1_2,
		var_1_3,
		var_1_4,
		var_1_5,
		var_1_6
	}, "startButtonDisabled", var_1_10)

	local function var_1_12()
		local var_5_0 = arg_1_0._disableStartForCrossplay or var_1_11:GetValue(arg_1_1)

		arg_1_0._wzStartMatchDataSourceDisabledValue = var_5_0
		arg_1_0._wzStartMatchDisabledValue = arg_1_0._wzStartMatchDataSourceDisabledValue or Lobby.GetTotalNumBots() > 0 or arg_1_0.WarzonePrivateMatchStartButton:GetLockState()

		arg_1_0.WarzonePrivateMatchStartButton:SetButtonDisabled(arg_1_0._wzStartMatchDisabledValue)
	end

	arg_1_0:SubscribeToModel(var_1_11:GetModel(arg_1_1), var_1_12)
	arg_1_0:registerEventHandler("wz_lobby_player_count_update", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_1_0._disableStartForCrossplay or var_1_10(arg_1_1)

		arg_1_0._wzStartMatchDataSourceDisabledValue = var_6_0
		arg_1_0._wzStartMatchDisabledValue = arg_1_0._wzStartMatchDataSourceDisabledValue or Lobby.GetTotalNumBots() > 0 or arg_1_0.WarzonePrivateMatchStartButton:GetLockState()

		arg_1_0.WarzonePrivateMatchStartButton:SetButtonDisabled(arg_1_0._wzStartMatchDisabledValue)
	end)
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = not PRIVATE_MATCH.IsWZSoloGameModeLobby(arg_7_0, arg_7_1, arg_7_2)

	if var_7_0 and arg_7_0.WarzonePrivateMatchSquadButton == nil then
		assert(arg_7_0.WarzonePrivateMatchPlayerListButton)

		arg_7_0.WarzonePrivateMatchSquadButton = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchButton", {
			controllerIndex = arg_7_1
		})
		arg_7_0.WarzonePrivateMatchSquadButton.id = "WarzonePrivateMatchSquadButton"

		arg_7_0.WarzonePrivateMatchSquadButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
		arg_7_0.WarzonePrivateMatchSquadButton:addElementBefore(arg_7_0.WarzonePrivateMatchPlayerListButton)
		arg_7_0.WarzonePrivateMatchSquadButton:SetupButtonAction(arg_7_1, PRIVATE_MATCH.WarzoneButtonType.SQUAD_SELECT)
		arg_7_0.WarzonePrivateMatchSquadButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/CHANGE_SQUAD_TITLE")), 0)
		arg_7_0.WarzonePrivateMatchSquadButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CHANGE_SQUAD_DESC"), 0)
		arg_7_0.WarzonePrivateMatchSquadButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	elseif not var_7_0 and arg_7_0.WarzonePrivateMatchSquadButton then
		arg_7_0.WarzonePrivateMatchSquadButton:closeTree()

		arg_7_0.WarzonePrivateMatchSquadButton = nil
	end
end

local function var_0_3(arg_8_0, arg_8_1)
	if arg_8_0.lobbyStateTimer == nil then
		arg_8_0.lobbyStateTimer = LUI.UITimer.new({
			interval = 100,
			event = "update_lobby_state"
		})
		arg_8_0.lobbyStateTimer.id = "SquadCountTimer"

		arg_8_0:addElement(arg_8_0.lobbyStateTimer)
		arg_8_0:addEventHandler("update_lobby_state", function(arg_9_0, arg_9_1)
			local var_9_0 = MatchRules.EAIEFBHGJ()
			local var_9_1 = Lobby.BJFFDBJHDD()

			if arg_8_0.WarzonePrivateMatchSquadButton then
				local var_9_2 = not var_9_0 or var_9_1 or not Lobby.BGIADHIHAG()

				arg_8_0.WarzonePrivateMatchSquadButton:SetButtonDisabled(var_9_2)

				if not var_9_0 then
					arg_8_0.WarzonePrivateMatchSquadButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/WAIT_FOR_GAME_MODE_LOCKED"))
				elseif var_9_1 then
					arg_8_0.WarzonePrivateMatchSquadButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CHANGE_SQUAD_LOCKED"))
				else
					arg_8_0.WarzonePrivateMatchSquadButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
				end
			end

			arg_8_0._wzStartMatchDisabledValue = arg_8_0._wzStartMatchDataSourceDisabledValue or not var_9_0 or Lobby.GetTotalNumBots() > 0 or arg_8_0.WarzonePrivateMatchStartButton:GetLockState()

			arg_8_0.WarzonePrivateMatchStartButton:SetButtonDisabled(arg_8_0._wzStartMatchDisabledValue)
			PRIVATE_MATCH.CheckMatchRuleGameModeData(arg_8_0, arg_8_1)
			var_0_2(arg_8_0, arg_8_1, arg_8_0._areWeGameHost)
		end)
	end
end

local function var_0_4(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._areWeGameHost = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost"):GetValue(arg_10_1)

	PRIVATE_MATCH.CheckMatchRuleGameModeData(arg_10_0, arg_10_1)
	var_0_2(arg_10_0, arg_10_1, arg_10_0._areWeGameHost)
	var_0_3(arg_10_0, arg_10_1)
	arg_10_0.WarzonePrivateMatchStartButton:SetupButtonAction(arg_10_1, PRIVATE_MATCH.WarzoneButtonType.START_MATCH)
	arg_10_0.WarzonePrivateMatchPlayerListButton:SetupButtonAction(arg_10_1, PRIVATE_MATCH.WarzoneButtonType.PLAYER_LIST)
	arg_10_0.WarzonePrivateMatchStartButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/START_GAME_CAPS")))
	arg_10_0.WarzonePrivateMatchStartButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/START_WARZONE_PRIVATE_MATCH_DESC"))
	arg_10_0.WarzonePrivateMatchStartButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
	arg_10_0.WarzonePrivateMatchPlayerListButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/VIEW_PLAYERS")))
	arg_10_0.WarzonePrivateMatchPlayerListButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/VIEW_PLAYERS_DESC"))
	arg_10_0.WarzonePrivateMatchPlayerListButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))

	if arg_10_0.WarzonePrivateMatchSetupButton then
		arg_10_0.WarzonePrivateMatchSetupButton:SetupButtonAction(arg_10_1, PRIVATE_MATCH.WarzoneButtonType.SETUP)
		arg_10_0.WarzonePrivateMatchSetupButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/SETUP_WARZONE_PRIVATE_MATCH")))
		arg_10_0.WarzonePrivateMatchSetupButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SETUP_WARZONE_PRIVATE_MATCH_DESC"))
		arg_10_0.WarzonePrivateMatchSetupButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
	end

	var_0_1(arg_10_0, arg_10_1)
	arg_10_0:registerEventHandler("cancel_wz_private_match", function(arg_11_0, arg_11_1)
		arg_10_0.WarzonePrivateMatchStartButton:SetLockState(false)
	end)
end

function WarzonePrivateMatchPlayMenuButtons(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIVerticalList.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 450 * _1080p)

	var_12_0.id = "WarzonePrivateMatchPlayMenuButtons"

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0

	var_12_0:SetSpacing(10 * _1080p)

	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchButton", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "WarzonePrivateMatchStartButton"

	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_12_0:addElement(var_12_4)

	var_12_0.WarzonePrivateMatchStartButton = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchButton", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "WarzonePrivateMatchPlayerListButton"

	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
	var_12_0:addElement(var_12_6)

	var_12_0.WarzonePrivateMatchPlayerListButton = var_12_6

	var_0_4(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("WarzonePrivateMatchPlayMenuButtons", WarzonePrivateMatchPlayMenuButtons)
LockTable(_M)
