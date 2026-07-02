module(..., package.seeall)

local var_0_0 = "frontEnd.MP.privateLobby.buttons"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_2.PlayMenuButton then
		arg_1_2 = arg_1_2.PlayMenuButton
	end

	if arg_1_3 == true then
		local var_1_0 = arg_1_2.Description:getText() .. "\n\n^3" .. arg_1_2.DisabledText:getText() .. "^7"

		arg_1_2:AddTooltipData(arg_1_1, {
			tooltipDescription = var_1_0
		})
	else
		arg_1_2:AddTooltipData(arg_1_1, {
			tooltipDescription = arg_1_2.Description:getText()
		})
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.StartMatch then
		var_0_1(arg_2_0, arg_2_1, arg_2_0.StartMatch, arg_2_2)
	end

	if arg_2_0.StartMatchDS then
		var_0_1(arg_2_0, arg_2_1, arg_2_0.StartMatchDS, arg_2_2)
	end

	if arg_2_0.GameSetup then
		var_0_1(arg_2_0, arg_2_1, arg_2_0.GameSetup, arg_2_2)
	end

	if arg_2_0.CPMapsButton then
		var_0_1(arg_2_0, arg_2_1, arg_2_0.CPMapsButton, arg_2_2)
	end

	if arg_2_0.CPModesButton then
		var_0_1(arg_2_0, arg_2_1, arg_2_0.CPModesButton, arg_2_2)
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	if not PRIVATE_MATCH.ValidateGameSetup() then
		return
	end

	local function var_3_0()
		if CONDITIONS.IsArenaGameType() then
			local var_4_0 = Engine.CGEFDFCIJA()
			local var_4_1 = Lobby.MaxPlayerLimitForGunfight
			local var_4_2 = Lobby.BEAJCIDDGF(Lobby.BotTeams.Friendly) + Lobby.BEAJCIDDGF(Lobby.BotTeams.Enemy)
			local var_4_3 = Lobby.GetMaxBotLimit()

			if var_4_3 < var_4_2 then
				local var_4_4 = math.floor(var_4_3 / 2)

				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, var_4_4)
				Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, var_4_4 + 1)
			end

			if var_4_1 < var_4_0 then
				LUI.FlowManager.RequestPopupMenu(arg_3_0, "EnteringGameModeWithHighPrivatePartyMemberCountWarning", true, event.controller, false, {
					currentCount = var_4_0,
					maxCount = var_4_1
				})
			end
		end

		if Lobby.DoesCurrentGameTypeSupportCrossplay() or not Engine.BEAJHICIEF() then
			if Lobby.CAEJIEEEDF() == 0 then
				Lobby.CJBHJEAFGH(2)
			end

			Engine.EBIDFIDHIE("xpartygo")

			if not LUI.FlowManager.GetScopedData(arg_3_0).isTournament then
				CODCASTER.SetCODCastingEnabled(MP_COMMON.IsMatchRulesCODCastingEnabled(true))
			end
		end
	end

	if LOADOUT.MATCHRULES.ShouldShowLoadoutRestrictedPopup(arg_3_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "CDLInvalidLoadout", true, arg_3_1, false, {
			confirmAction = var_3_0
		})
	else
		var_3_0()
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_1 and arg_5_1.DisabledText then
		if arg_5_0._disableStartForCrossplay then
			arg_5_1.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/MODE_DISABLED_CROSSPLAY"))
			arg_5_1.DisabledText:SetAnimMoveTime(8000)
		else
			arg_5_1.DisabledText:setText(arg_5_2)
			arg_5_1.DisabledText:SetAnimMoveTime(2000)
		end
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_6_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isHostWaitingOnMembers")
	local var_6_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.partyClientsUpToDate")
	local var_6_3 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isGameStartRequested")
	local var_6_4 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isMatchmaking")

	arg_6_0.widgetModelPath = var_0_0

	if CONDITIONS.IsThirdGameMode then
		local function var_6_5()
			if arg_6_0.CPMapsButton then
				local var_7_0 = Lobby.GetCurrentGameType()

				arg_6_0.CPMapsButton.PlayMenuButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(var_7_0 == "cp_specops" and "LUA_MENU/CP_SO_MISSION" or "LUA_MENU/MAP_CAPS")))
				arg_6_0.CPMapsButton.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC(var_7_0 == "cp_specops" and "LUA_MENU/DESC_MISSION" or "LUA_MENU/DESC_MAP"))
				arg_6_0.CPMapsButton.DynamicText:setText(ToUpperCase(Lobby.ECIFCJJJIA()))
			end

			if arg_6_0.CPModesButton then
				arg_6_0.CPModesButton.DynamicText:setText(ToUpperCase(Lobby.GetCurrentGameTypeName()))
			end
		end

		var_6_5()
		arg_6_0:addEventHandler("menu_create", var_6_5)
	end

	if arg_6_0.GameSetup then
		arg_6_0.GameSetup:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			if not PRIVATE_MATCH.ValidateGameSetup() then
				return
			end

			if CONDITIONS.IsCoreMultiplayer(arg_6_0) then
				local var_8_0 = LUI.FlowManager.GetScopedData(arg_6_0)

				LUI.FlowManager.RequestAddMenu("GameSetup", true, arg_8_1.controller, false, {
					isSoloMode = false,
					isTournament = var_8_0.isTournament,
					matchmakerSettings = var_8_0.matchmakerSettings
				})
			elseif CONDITIONS.IsThirdGameMode(arg_6_0) then
				LUI.FlowManager.RequestAddMenu("CPGameSetup", true, arg_8_1.controller, false, {
					isSoloMode = false
				})
			end
		end)
	end

	if arg_6_0.StartMatchDS and not arg_6_0.StartMatch then
		arg_6_0.StartMatchDS.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_START_MATCH"), 0)
	end

	if arg_6_0.StartMatch then
		arg_6_0.StartMatch:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			var_0_3(arg_6_0, arg_6_1)
		end)
	end

	if arg_6_0.StartMatchDS then
		arg_6_0.StartMatchDS:addEventHandler("button_action", function(arg_10_0, arg_10_1)
			if CONDITIONS.PrivateDsAllowed(arg_6_0) and (Lobby.GetTotalNumBots() == 0 or not arg_6_0.StartMatch) then
				if Lobby.GetTotalNumBots() ~= 0 and Lobby.CAEJIEEEDF() == 0 then
					Lobby.CJBHJEAFGH(2)
				end

				Lobby.StartPrivateMatchDS(arg_6_1)
			end
		end)
	end

	if arg_6_0.StartMatchDS and arg_6_0.StartMatch then
		local var_6_6 = arg_6_0.StartMatchDS.Description:getText() .. "\n"
		local var_6_7
		local var_6_8 = Lobby.GetTotalNumBots() > 0
		local var_6_9 = var_6_8 and "LUA_MENU_MP/PRIVATE_MATCH_DEDI_DISABLED" or "LUA_MENU_MP/PRIVATE_MATCH_DEDI_ENABLED"

		arg_6_0.StartMatchDS:SetButtonDisabled(var_6_8)
		arg_6_0.StartMatchDS.Description:setText(var_6_6 .. Engine.CBBHFCGDIC(var_6_9))
	end

	local var_6_10 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".disableButton")

	local function var_6_11(arg_11_0)
		local var_11_0 = var_6_0:GetValue(arg_11_0)
		local var_11_1 = var_6_3:GetValue(arg_11_0)
		local var_11_2 = CONDITIONS.PrivateDsAllowed(arg_6_0) and var_6_4:GetValue(arg_11_0)

		return not var_11_0 or var_11_1 or var_11_2
	end

	local var_6_12 = LUI.AggregateDataSource.new(var_6_10, {
		var_6_0,
		var_6_3,
		var_6_4
	}, "gameSetupDisabled", var_6_11)

	local function var_6_13()
		local var_12_0 = var_6_12:GetValue(arg_6_1)

		if arg_6_0.GameSetup then
			arg_6_0.GameSetup:SetButtonDisabled(var_12_0)
		end

		if arg_6_0.CPMapsButton then
			arg_6_0.CPMapsButton:SetButtonDisabled(var_12_0)
		end

		if arg_6_0.CPModesButton then
			arg_6_0.CPModesButton:SetButtonDisabled(var_12_0)
		end
	end

	arg_6_0:SubscribeToModel(var_6_12:GetModel(arg_6_1), var_6_13)

	local function var_6_14(arg_13_0)
		local var_13_0 = var_6_0:GetValue(arg_13_0)
		local var_13_1 = var_6_1:GetValue(arg_13_0)
		local var_13_2 = var_6_2:GetValue(arg_13_0)
		local var_13_3 = var_6_3:GetValue(arg_13_0)
		local var_13_4 = CONDITIONS.PrivateDsAllowed(arg_6_0) and var_6_4:GetValue(arg_13_0)

		return not var_13_0 or var_13_1 or not var_13_2 or var_13_3 or var_13_4
	end

	local var_6_15 = LUI.AggregateDataSource.new(var_6_10, {
		var_6_0,
		var_6_1,
		var_6_2,
		var_6_3,
		var_6_4
	}, "startButtonDisabled", var_6_14)

	local function var_6_16()
		local var_14_0 = arg_6_0._disableStartForCrossplay or var_6_15:GetValue(arg_6_1)

		if arg_6_0.StartMatch then
			arg_6_0.StartMatch:SetButtonDisabled(var_14_0)
		end

		if arg_6_0.StartMatchDS then
			local var_14_1 = var_14_0 or Lobby.GetTotalNumBots() > 0 and arg_6_0.StartMatch

			arg_6_0.StartMatchDS:SetButtonDisabled(var_14_1)
		end
	end

	arg_6_0:SubscribeToModel(var_6_15:GetModel(arg_6_1), var_6_16)

	local function var_6_17(arg_15_0)
		local var_15_0 = Engine.CBBHFCGDIC("MENU/LOCKED")

		if not var_6_0:GetValue(arg_15_0) then
			var_15_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST")
		end

		var_0_4(arg_6_0, arg_6_0.StartMatch, var_15_0)
		var_0_4(arg_6_0, arg_6_0.StartMatchDS, var_15_0)

		if arg_6_0.GameSetup then
			arg_6_0.GameSetup.DisabledText:setText(var_15_0)
		end

		if arg_6_0.CPMapsButton then
			arg_6_0.CPMapsButton.PlayMenuButton.DisabledText:setText(var_15_0)
		end

		if arg_6_0.CPModesButton then
			arg_6_0.CPModesButton.PlayMenuButton.DisabledText:setText(var_15_0)
		end
	end

	arg_6_0:SubscribeToModel(var_6_0:GetModel(arg_6_1), var_6_17)

	if Engine.CIEGIACHAE() then
		local function var_6_18(arg_16_0)
			local var_16_0 = not Lobby.DoesCurrentGameTypeSupportCrossplay() and Engine.BEAJHICIEF()

			if arg_16_0._disableStartForCrossplay ~= var_16_0 then
				arg_16_0._disableStartForCrossplay = var_16_0

				var_6_16()
				var_6_17(arg_6_1)
			end
		end

		local var_6_19 = LUI.UITimer.new({
			interval = 500,
			event = "check_party"
		})

		var_6_19.id = "checkPartyTimer"

		var_6_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)
		arg_6_0:addElement(var_6_19)
		arg_6_0:registerEventHandler("check_party", function(arg_17_0, arg_17_1)
			var_6_18(arg_6_0)
		end)
	end

	local function var_6_20(arg_18_0)
		local var_18_0 = var_6_3:GetValue(arg_18_0)
		local var_18_1 = var_6_0:GetValue(arg_18_0)
		local var_18_2 = var_6_4:GetValue(arg_18_0)

		if var_18_0 then
			if arg_6_0.StartMatch then
				arg_6_0.StartMatch.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/STARTING_GAME_CAPS"))
			end

			var_0_2(arg_6_0, arg_18_0, true)
		elseif var_18_2 and arg_6_0.StartMatchDS then
			arg_6_0.StartMatchDS.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/STARTING_GAME_CAPS"))
			var_0_2(arg_6_0, arg_18_0, true)
		elseif var_18_1 then
			if arg_6_0.StartMatch then
				arg_6_0.StartMatch.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/START_GAME_CAPS"))
			end

			if arg_6_0.StartMatchDS then
				if not arg_6_0.StartMatch then
					arg_6_0.StartMatchDS.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/START_GAME_CAPS"))
				else
					arg_6_0.StartMatchDS.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/START_PRIVATE_DS_CAPS"))
				end
			end

			var_0_2(arg_6_0, arg_18_0, false)
		else
			if arg_6_0.StartMatch then
				arg_6_0.StartMatch.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_HOST_CAPS"))
			end

			if arg_6_0.StartMatchDS then
				arg_6_0.StartMatchDS.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_HOST_CAPS"))
			end

			var_0_2(arg_6_0, arg_18_0, true)
		end
	end

	arg_6_0:SubscribeToModel(var_6_0:GetModel(arg_6_1), var_6_20)
	arg_6_0:SubscribeToModel(var_6_3:GetModel(arg_6_1), var_6_20)
	arg_6_0:SubscribeToModel(var_6_4:GetModel(arg_6_1), var_6_20)

	local var_6_21 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isCodCastingEnabled")

	arg_6_0:SubscribeToModel(var_6_21:GetModel(arg_6_1), function()
		local var_19_0 = var_6_21:GetValue(arg_6_1) and CODCASTER.CanCODCast()
		local var_19_1 = LUI.FlowManager.GetScopedData(arg_6_0)

		if var_19_0 and not var_19_1.isTournament then
			CODCASTER.CreateCODCasterSettingsButton(arg_6_0, arg_6_1)
		else
			CODCASTER.DestroyCODCasterSettingsButton(arg_6_0, arg_6_1)
		end
	end, true)
end

function PrivateMatchLobbyButtons(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIVerticalList.new()

	var_20_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_20_0.id = "PrivateMatchLobbyButtons"

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	local var_20_2 = var_20_0

	var_20_0:SetSpacing(10 * _1080p)

	local var_20_3

	if CONDITIONS.PrivateListenAllowed(var_20_0) then
		local var_20_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_20_1
		})

		var_20_4.id = "StartMatch"

		var_20_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/START_MATCH")), 0)
		var_20_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_START_MATCH"), 0)
		var_20_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_20_4.DisabledText:SetAnimMoveTime(2000)
		var_20_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
		var_20_0:addElement(var_20_4)

		var_20_0.StartMatch = var_20_4
	end

	local var_20_5

	if CONDITIONS.PrivateDsAllowed(var_20_0) then
		local var_20_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_20_1
		})

		var_20_6.id = "StartMatchDS"

		var_20_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/START_PRIVATE_DS_CAPS"), 0)
		var_20_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_START_PRIVATE_DS"), 0)
		var_20_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_20_6.DisabledText:SetAnimMoveTime(2000)
		var_20_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
		var_20_0:addElement(var_20_6)

		var_20_0.StartMatchDS = var_20_6
	end

	local var_20_7

	if CONDITIONS.IsThirdGameMode(var_20_0) then
		var_20_7 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_20_1
		})
		var_20_7.id = "CPMapsButton"

		var_20_7.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MAP_CAPS"), 0)
		var_20_7.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_MAP"), 0)
		var_20_7.DynamicText:setText("", 0)
		var_20_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
		var_20_0:addElement(var_20_7)

		var_20_0.CPMapsButton = var_20_7
	end

	local var_20_8

	if CONDITIONS.IsThirdGameModeAndSurvivalModeAllowed(var_20_0) then
		var_20_8 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_20_1
		})
		var_20_8.id = "CPModesButton"

		var_20_8.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MODE_CAPS"), 0)
		var_20_8.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_GAMEMODE"), 0)
		var_20_8.DynamicText:setText("", 0)
		var_20_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
		var_20_0:addElement(var_20_8)

		var_20_0.CPModesButton = var_20_8
	end

	local var_20_9

	if CONDITIONS.IsGameSetupEnabledAndCPDevMode(var_20_0) then
		local var_20_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_20_1
		})

		var_20_10.id = "GameSetup"

		var_20_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GAME_SETUP_CAPS")), 0)
		var_20_10.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_GAME_SETUP"), 0)
		var_20_10.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_20_10.DisabledText:SetAnimMoveTime(2000)
		var_20_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 240, _1080p * 290)
		var_20_0:addElement(var_20_10)

		var_20_0.GameSetup = var_20_10
	end

	if CONDITIONS.IsThirdGameMode(var_20_0) then
		var_20_7:addEventHandler("button_action", function(arg_21_0, arg_21_1)
			local var_21_0 = arg_21_1.controller or var_20_1

			ACTIONS.OpenMenu("CPMaps", true, var_21_0)
		end)
	end

	if CONDITIONS.IsThirdGameModeAndSurvivalModeAllowed(var_20_0) then
		var_20_8:addEventHandler("button_action", function(arg_22_0, arg_22_1)
			local var_22_0 = arg_22_1.controller or var_20_1

			ACTIONS.OpenMenu("CPGameModes", true, var_22_0)
		end)
	end

	var_0_5(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("PrivateMatchLobbyButtons", PrivateMatchLobbyButtons)
LockTable(_M)
