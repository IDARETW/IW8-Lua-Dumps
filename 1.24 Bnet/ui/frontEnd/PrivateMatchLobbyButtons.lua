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

local function var_0_3(arg_3_0)
	return Lobby.BEAJCIDDGF(Lobby.BotTeams.Friendly) + Lobby.BEAJCIDDGF(Lobby.BotTeams.Enemy)
end

local function var_0_4(arg_4_0, arg_4_1)
	if not PRIVATE_MATCH.ValidateGameSetup() then
		return
	end

	if CONDITIONS.IsWaveGameType() and Engine.BAJHDFAJJF(CoD.CP_MAP_PACK_3_INDEX) == false then
		if Engine.CFHBIHABCB(arg_4_1) then
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_4_1, false)
		end

		return
	end

	local function var_4_0()
		if CONDITIONS.IsArenaGameType() then
			local var_5_0 = Engine.CGEFDFCIJA()
			local var_5_1 = Lobby.MaxPlayerLimitForGunfight
			local var_5_2 = Lobby.BEAJCIDDGF(Lobby.BotTeams.Friendly) + Lobby.BEAJCIDDGF(Lobby.BotTeams.Enemy)
			local var_5_3 = Lobby.GetMaxBotLimit()

			if var_5_3 < var_5_2 then
				local var_5_4 = math.floor(var_5_3 / 2)

				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, var_5_4)
				Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, var_5_4 + 1)
			end

			if var_5_1 < var_5_0 then
				LUI.FlowManager.RequestPopupMenu(arg_4_0, "EnteringGameModeWithHighPrivatePartyMemberCountWarning", true, event.controller, false, {
					currentCount = var_5_0,
					maxCount = var_5_1
				})
			end
		end

		if Lobby.DoesCurrentGameTypeSupportCrossplay() or not Engine.BEAJHICIEF() then
			if Lobby.CAEJIEEEDF() == 0 then
				Lobby.CJBHJEAFGH(2)
			end

			Engine.EBIDFIDHIE("xpartygo")

			if not LUI.FlowManager.GetScopedData(arg_4_0).isTournament then
				CODCASTER.SetCODCastingEnabled(MP_COMMON.IsMatchRulesCODCastingEnabled(true))
			end
		end
	end

	if LOADOUT.MATCHRULES.ShouldShowLoadoutRestrictedPopup(arg_4_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "CDLInvalidLoadout", true, arg_4_1, false, {
			confirmAction = var_4_0
		})
	else
		var_4_0()
	end
end

local function var_0_5(arg_6_0)
	if CONDITIONS.IsWaveGameType() and Engine.BAJHDFAJJF(CoD.CP_MAP_PACK_3_INDEX) == false then
		if Engine.CFHBIHABCB(arg_6_0) then
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_6_0, false)
		end

		return
	end

	if CONDITIONS.IsArenaGameType() then
		local var_6_0 = Engine.CGEFDFCIJA()
		local var_6_1 = Lobby.MaxPlayerLimitForGunfight

		if var_6_1 < var_6_0 then
			LUI.FlowManager.RequestPopupMenu(self, "EnteringGameModeWithHighPrivatePartyMemberCountWarning", true, event.controller, false, {
				currentCount = var_6_0,
				maxCount = var_6_1
			})
		end
	end

	if Lobby.DoesCurrentGameTypeSupportCrossplay() or not Engine.BEAJHICIEF() then
		Lobby.FHHCDABDD(arg_6_0)
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 and arg_7_1.DisabledText then
		if arg_7_0._disableStartForCrossplay then
			arg_7_1.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/MODE_DISABLED_CROSSPLAY"))
			arg_7_1.DisabledText:SetAnimMoveTime(4000)
		else
			arg_7_1.DisabledText:setText(arg_7_2)
			arg_7_1.DisabledText:SetAnimMoveTime(2000)
		end
	end
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.StartMatch)
	assert(arg_8_0.StartMatch.Text)

	local var_8_0 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_8_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.everyoneHasMap")
	local var_8_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isHostWaitingOnMembers")
	local var_8_3 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.partyClientsUpToDate")
	local var_8_4 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isGameStartRequested")
	local var_8_5 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isMatchmaking")

	arg_8_0.widgetModelPath = var_0_0

	if CONDITIONS.IsThirdGameMode then
		local function var_8_6()
			if arg_8_0.CPMapsButton then
				local var_9_0 = Lobby.GetCurrentGameType()

				arg_8_0.CPMapsButton.PlayMenuButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(var_9_0 == "cp_specops" and "LUA_MENU/CP_SO_MISSION" or "LUA_MENU/MAP_CAPS")))
				arg_8_0.CPMapsButton.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC(var_9_0 == "cp_specops" and "LUA_MENU/DESC_MISSION" or "LUA_MENU/DESC_MAP"))
				arg_8_0.CPMapsButton.DynamicText:setText(ToUpperCase(Lobby.ECIFCJJJIA()))
			end

			if arg_8_0.CPModesButton then
				arg_8_0.CPModesButton.DynamicText:setText(ToUpperCase(Lobby.GetCurrentGameTypeName()))
			end
		end

		var_8_6()
		arg_8_0:addEventHandler("menu_create", var_8_6)
	end

	if arg_8_0.GameSetup then
		arg_8_0.GameSetup:addEventHandler("button_action", function(arg_10_0, arg_10_1)
			if not PRIVATE_MATCH.ValidateGameSetup() then
				return
			end

			if CONDITIONS.IsCoreMultiplayer(arg_8_0) then
				local var_10_0 = LUI.FlowManager.GetScopedData(arg_8_0)

				LUI.FlowManager.RequestAddMenu("GameSetup", true, arg_10_1.controller, false, {
					isSoloMode = false,
					isTournament = var_10_0.isTournament,
					matchmakerSettings = var_10_0.matchmakerSettings
				})
			elseif CONDITIONS.IsThirdGameMode(arg_8_0) then
				LUI.FlowManager.RequestAddMenu("CPGameSetup", true, arg_10_1.controller, false, {
					isSoloMode = false
				})
			end
		end)
	end

	arg_8_0.StartMatch:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		var_0_4(arg_8_0, arg_8_1)
	end)

	if arg_8_0.StartMatchDS then
		arg_8_0.StartMatchDS:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			if CONDITIONS.PrivateDsAllowed(arg_8_0) and var_0_3() == 0 then
				var_0_5(arg_8_1)
			end
		end)
	end

	if arg_8_0.StartMatchDS then
		local var_8_7 = arg_8_0.StartMatchDS.Description:getText() .. "\n"
		local var_8_8
		local var_8_9 = var_0_3() > 0
		local var_8_10 = var_8_9 and "LUA_MENU_MP/PRIVATE_MATCH_DEDI_DISABLED" or "LUA_MENU_MP/PRIVATE_MATCH_DEDI_ENABLED"

		arg_8_0.StartMatchDS:SetButtonDisabled(var_8_9)
		arg_8_0.StartMatchDS.Description:setText(var_8_7 .. Engine.CBBHFCGDIC(var_8_10))
	end

	local var_8_11 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".disableButton")

	local function var_8_12(arg_13_0)
		local var_13_0 = var_8_0:GetValue(arg_13_0)
		local var_13_1 = var_8_4:GetValue(arg_13_0)
		local var_13_2 = CONDITIONS.PrivateDsAllowed(arg_8_0) and var_8_5:GetValue(arg_13_0)

		return not var_13_0 or var_13_1 or var_13_2
	end

	local var_8_13 = LUI.AggregateDataSource.new(var_8_11, {
		var_8_0,
		var_8_4,
		var_8_5
	}, "gameSetupDisabled", var_8_12)

	local function var_8_14()
		local var_14_0 = var_8_13:GetValue(arg_8_1)

		if arg_8_0.GameSetup then
			arg_8_0.GameSetup:SetButtonDisabled(var_14_0)
		end

		if arg_8_0.CPMapsButton then
			arg_8_0.CPMapsButton:SetButtonDisabled(var_14_0)
		end

		if arg_8_0.CPModesButton then
			arg_8_0.CPModesButton:SetButtonDisabled(var_14_0)
		end
	end

	arg_8_0:SubscribeToModel(var_8_13:GetModel(arg_8_1), var_8_14)

	local function var_8_15(arg_15_0)
		local var_15_0 = var_8_0:GetValue(arg_15_0)
		local var_15_1 = var_8_1:GetValue(arg_15_0)
		local var_15_2 = var_8_2:GetValue(arg_15_0)
		local var_15_3 = var_8_3:GetValue(arg_15_0)
		local var_15_4 = var_8_4:GetValue(arg_15_0)
		local var_15_5 = CONDITIONS.PrivateDsAllowed(arg_8_0) and var_8_5:GetValue(arg_15_0)

		return not var_15_0 or not var_15_1 or var_15_2 or not var_15_3 or var_15_4 or var_15_5
	end

	local var_8_16 = LUI.AggregateDataSource.new(var_8_11, {
		var_8_0,
		var_8_1,
		var_8_2,
		var_8_3,
		var_8_4,
		var_8_5
	}, "startButtonDisabled", var_8_15)

	local function var_8_17()
		local var_16_0 = arg_8_0._disableStartForCrossplay or var_8_16:GetValue(arg_8_1)

		if arg_8_0.StartMatch then
			arg_8_0.StartMatch:SetButtonDisabled(var_16_0)
		end

		if arg_8_0.StartMatchDS then
			local var_16_1 = var_16_0 or var_0_3() > 0

			arg_8_0.StartMatchDS:SetButtonDisabled(var_16_1)
		end
	end

	arg_8_0:SubscribeToModel(var_8_16:GetModel(arg_8_1), var_8_17)

	local function var_8_18(arg_17_0)
		local var_17_0 = Engine.CBBHFCGDIC("MENU/LOCKED")

		if not var_8_0:GetValue(arg_17_0) then
			var_17_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST")
		end

		var_0_6(arg_8_0, arg_8_0.StartMatch, var_17_0)
		var_0_6(arg_8_0, arg_8_0.StartMatchDS, var_17_0)

		if arg_8_0.GameSetup then
			arg_8_0.GameSetup.DisabledText:setText(var_17_0)
		end

		if arg_8_0.CPMapsButton then
			arg_8_0.CPMapsButton.PlayMenuButton.DisabledText:setText(var_17_0)
		end

		if arg_8_0.CPModesButton then
			arg_8_0.CPModesButton.PlayMenuButton.DisabledText:setText(var_17_0)
		end
	end

	arg_8_0:SubscribeToModel(var_8_0:GetModel(arg_8_1), var_8_18)

	if Engine.CIEGIACHAE() then
		local function var_8_19(arg_18_0)
			local var_18_0 = not Lobby.DoesCurrentGameTypeSupportCrossplay() and Engine.BEAJHICIEF()

			if arg_18_0._disableStartForCrossplay ~= var_18_0 then
				arg_18_0._disableStartForCrossplay = var_18_0

				var_8_17()
				var_8_18(arg_8_1)
			end
		end

		local var_8_20 = LUI.UITimer.new({
			interval = 500,
			event = "check_party"
		})

		var_8_20.id = "checkPartyTimer"

		var_8_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)
		arg_8_0:addElement(var_8_20)
		arg_8_0:registerEventHandler("check_party", function(arg_19_0, arg_19_1)
			var_8_19(arg_8_0)
		end)
	end

	local function var_8_21(arg_20_0)
		local var_20_0 = var_8_4:GetValue(arg_20_0)
		local var_20_1 = var_8_0:GetValue(arg_20_0)
		local var_20_2 = var_8_5:GetValue(arg_20_0)

		if var_20_0 then
			arg_8_0.StartMatch.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/STARTING_GAME_CAPS"))
			var_0_2(arg_8_0, arg_20_0, true)
		elseif var_20_2 and arg_8_0.StartMatchDS then
			arg_8_0.StartMatchDS.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/STARTING_GAME_CAPS"))
			var_0_2(arg_8_0, arg_20_0, true)
		elseif var_20_1 then
			arg_8_0.StartMatch.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/START_GAME_CAPS"))

			if arg_8_0.StartMatchDS then
				arg_8_0.StartMatchDS.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/START_PRIVATE_DS_CAPS"))
			end

			var_0_2(arg_8_0, arg_20_0, false)
		else
			arg_8_0.StartMatch.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_HOST_CAPS"))

			if arg_8_0.StartMatchDS then
				arg_8_0.StartMatchDS.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_HOST_CAPS"))
			end

			var_0_2(arg_8_0, arg_20_0, true)
		end
	end

	arg_8_0:SubscribeToModel(var_8_0:GetModel(arg_8_1), var_8_21)
	arg_8_0:SubscribeToModel(var_8_4:GetModel(arg_8_1), var_8_21)
	arg_8_0:SubscribeToModel(var_8_5:GetModel(arg_8_1), var_8_21)

	local var_8_22 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isCodCastingEnabled")

	arg_8_0:SubscribeToModel(var_8_22:GetModel(arg_8_1), function()
		local var_21_0 = var_8_22:GetValue(arg_8_1) and CODCASTER.CanCODCast()
		local var_21_1 = LUI.FlowManager.GetScopedData(arg_8_0)

		if var_21_0 and not var_21_1.isTournament then
			CODCASTER.CreateCODCasterSettingsButton(arg_8_0, arg_8_1)
		else
			CODCASTER.DestroyCODCasterSettingsButton(arg_8_0, arg_8_1)
		end
	end, true)
end

function PrivateMatchLobbyButtons(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIVerticalList.new()

	var_22_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_22_0.id = "PrivateMatchLobbyButtons"

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	local var_22_2 = var_22_0

	var_22_0:SetSpacing(10 * _1080p)

	local var_22_3
	local var_22_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_22_1
	})

	var_22_4.id = "StartMatch"

	var_22_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/START_MATCH")), 0)
	var_22_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_START_MATCH"), 0)
	var_22_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_22_4.DisabledText:SetAnimMoveTime(2000)
	var_22_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_22_0:addElement(var_22_4)

	var_22_0.StartMatch = var_22_4

	local var_22_5

	if CONDITIONS.PrivateDsAllowed(var_22_0) then
		local var_22_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_22_1
		})

		var_22_6.id = "StartMatchDS"

		var_22_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/START_PRIVATE_DS_CAPS"), 0)
		var_22_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_START_PRIVATE_DS"), 0)
		var_22_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_22_6.DisabledText:SetAnimMoveTime(2000)
		var_22_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
		var_22_0:addElement(var_22_6)

		var_22_0.StartMatchDS = var_22_6
	end

	local var_22_7

	if CONDITIONS.IsThirdGameMode(var_22_0) then
		var_22_7 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_22_1
		})
		var_22_7.id = "CPMapsButton"

		var_22_7.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MAP_CAPS"), 0)
		var_22_7.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_MAP"), 0)
		var_22_7.DynamicText:setText("", 0)
		var_22_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
		var_22_0:addElement(var_22_7)

		var_22_0.CPMapsButton = var_22_7
	end

	local var_22_8

	if CONDITIONS.IsThirdGameModeAndSurvivalModeAllowed(var_22_0) then
		var_22_8 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_22_1
		})
		var_22_8.id = "CPModesButton"

		var_22_8.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MODE_CAPS"), 0)
		var_22_8.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_GAMEMODE"), 0)
		var_22_8.DynamicText:setText("", 0)
		var_22_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
		var_22_0:addElement(var_22_8)

		var_22_0.CPModesButton = var_22_8
	end

	local var_22_9

	if CONDITIONS.IsGameSetupEnabledAndCPDevMode(var_22_0) then
		local var_22_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_22_1
		})

		var_22_10.id = "GameSetup"

		var_22_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GAME_SETUP_CAPS")), 0)
		var_22_10.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_GAME_SETUP"), 0)
		var_22_10.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_22_10.DisabledText:SetAnimMoveTime(2000)
		var_22_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 240, _1080p * 290)
		var_22_0:addElement(var_22_10)

		var_22_0.GameSetup = var_22_10
	end

	if CONDITIONS.IsThirdGameMode(var_22_0) then
		var_22_7:addEventHandler("button_action", function(arg_23_0, arg_23_1)
			local var_23_0 = arg_23_1.controller or var_22_1

			ACTIONS.OpenMenu("CPMaps", true, var_23_0)
		end)
	end

	if CONDITIONS.IsThirdGameModeAndSurvivalModeAllowed(var_22_0) then
		var_22_8:addEventHandler("button_action", function(arg_24_0, arg_24_1)
			local var_24_0 = arg_24_1.controller or var_22_1

			ACTIONS.OpenMenu("CPGameModes", true, var_24_0)
		end)
	end

	var_0_7(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("PrivateMatchLobbyButtons", PrivateMatchLobbyButtons)
LockTable(_M)
