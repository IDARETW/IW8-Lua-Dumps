module(..., package.seeall)

local var_0_0 = 4

local function var_0_1(arg_1_0)
	local var_1_0
	local var_1_1 = MLG.AreMLGRulesEnabled() and "PATCH_MENU/CDL_RULES" or MatchRules.DGFBAJFJBE() and "PATCH_MENU/MATCHRULES_DEFAULT" or "PATCH_MENU/MATCHRULES_CUSTOM"

	if arg_1_0.OptionsButton then
		arg_1_0.OptionsButton.DynamicText:setText(Engine.CBBHFCGDIC(var_1_1))
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	assert(arg_2_0.ModesButton.PlayMenuButton.Description)

	local var_2_0 = LUI.FlowManager.GetScopedData(arg_2_0)

	if arg_2_0.MapsButton then
		assert(arg_2_0.MapsButton.PlayMenuButton.Description)

		if CONDITIONS.IsMapSelectEnabled() then
			arg_2_0.MapsButton:AddTooltipData(arg_2_1, {
				tooltipDescription = arg_2_0.MapsButton.PlayMenuButton.Description:getText()
			})
		else
			local var_2_1 = arg_2_0.MapsButton.PlayMenuButton.Description:getText() .. "\n\n^3" .. arg_2_0.MapsButton.PlayMenuButton.DisabledText:getText() .. "^7"

			arg_2_0.MapsButton:AddTooltipData(arg_2_1, {
				tooltipDescription = var_2_1
			})
		end
	elseif var_2_0.isTournament then
		for iter_2_0 = 1, var_0_0 do
			local var_2_2 = arg_2_0["MapRound" .. iter_2_0]

			assert(var_2_2)
			var_2_2:AddTooltipData(arg_2_1, {
				tooltipDescription = var_2_2.PlayMenuButton.Description:getText()
			})
		end
	end

	if CONDITIONS.IsGameModeSelectEnabled() then
		arg_2_0.ModesButton:AddTooltipData(arg_2_1, {
			tooltipDescription = arg_2_0.ModesButton.PlayMenuButton.Description:getText()
		})
	else
		local var_2_3 = arg_2_0.ModesButton.PlayMenuButton.Description:getText() .. "\n\n^3" .. arg_2_0.ModesButton.PlayMenuButton.DisabledText:getText() .. "^7"

		arg_2_0.ModesButton:AddTooltipData(arg_2_1, {
			tooltipDescription = var_2_3
		})
	end

	if arg_2_0.OptionsButton then
		assert(arg_2_0.OptionsButton.PlayMenuButton.Description)

		if CONDITIONS.AreCustomGameRulesEnabled() then
			arg_2_0.OptionsButton:AddTooltipData(arg_2_1, {
				tooltipDescription = arg_2_0.OptionsButton.PlayMenuButton.Description:getText()
			})
		else
			local var_2_4 = arg_2_0.OptionsButton.PlayMenuButton.Description:getText() .. "\n\n^3" .. arg_2_0.OptionsButton.PlayMenuButton.DisabledText:getText() .. "^7"

			arg_2_0.OptionsButton:AddTooltipData(arg_2_1, {
				tooltipDescription = var_2_4
			})
		end
	end

	if arg_2_0.BotSetup then
		if not MLG.AreMLGRulesEnabled() and CONDITIONS.IsBotSetupEnabled() then
			arg_2_0.BotSetup:AddTooltipData(arg_2_1, {
				tooltipDescription = arg_2_0.BotSetup.Description:getText()
			})
		else
			local var_2_5 = arg_2_0.BotSetup.Description:getText() .. "\n\n^3" .. arg_2_0.BotSetup.DisabledText:getText() .. "^7"

			arg_2_0.BotSetup:AddTooltipData(arg_2_1, {
				tooltipDescription = var_2_5
			})
		end
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.ModesButton)
	assert(arg_3_0.ModesButton.DynamicText)

	local var_3_0 = LUI.FlowManager.GetScopedData(arg_3_0)

	if CONDITIONS.IsThirdGameMode() then
		assert(arg_3_0.MissionButton)
	else
		if arg_3_0.MapsButton then
			arg_3_0.MapsButton:SetButtonDisabled(not CONDITIONS.IsMapSelectEnabled())
		end

		arg_3_0.ModesButton:SetButtonDisabled(not CONDITIONS.IsGameModeSelectEnabled())

		if arg_3_0.OptionsButton then
			assert(arg_3_0.OptionsButton.DynamicText)
			arg_3_0.OptionsButton:SetButtonDisabled(not CONDITIONS.AreCustomGameRulesEnabled())
		end

		if arg_3_0.BotSetup then
			arg_3_0.BotSetup:SetButtonDisabled(MLG.AreMLGRulesEnabled() or not CONDITIONS.IsBotSetupEnabled())
		end
	end

	local function var_3_1()
		local var_4_0 = LUI.FlowManager.GetScopedData(arg_3_0)

		if var_4_0.isTournament then
			local var_4_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_4_0.matchmakerSettings.gameType, CSV.gameTypesTable.cols.name)

			arg_3_0.ModesButton.DynamicText:setText(ToUpperCase(Engine.CBBHFCGDIC(var_4_1)))
		else
			local var_4_2 = DataSources.frontEnd.lobby.gameTypeNameWithModifier:GetValue(arg_3_1)

			if var_4_2 ~= nil then
				arg_3_0.ModesButton.DynamicText:setText(ToUpperCase(var_4_2))
			end
		end
	end

	local var_3_2 = DataSources.frontEnd.lobby.gameTypeNameWithModifier

	arg_3_0.ModesButton:SubscribeToModel(var_3_2:GetModel(arg_3_1), var_3_1)
	var_3_1()

	if arg_3_0.MapsButton then
		arg_3_0.MapsButton.DynamicText:setText(ToUpperCase(Lobby.ECIFCJJJIA()))
	end

	if var_3_0.isTournament then
		for iter_3_0 = 1, var_0_0 do
			local var_3_3 = arg_3_0["MapRound" .. iter_3_0]
			local var_3_4 = var_3_0.matchmakerSettings.maps[iter_3_0]

			assert(var_3_3)
			assert(var_3_4)
			var_3_3.DynamicText:setText(ToUpperCase(MP.GetLobbyMapName(var_3_4)))
			var_3_3:registerEventHandler("button_action", function(arg_5_0, arg_5_1)
				LUI.FlowManager.RequestAddMenu("Maps", true, arg_5_1.controller, false, {
					isTournament = var_3_0.isTournament,
					matchmakerSettings = var_3_0.matchmakerSettings,
					roundIndex = iter_3_0
				}, true)
			end)
		end
	end

	if CONDITIONS.IsCoreMultiplayer(arg_3_0) then
		var_0_1(arg_3_0)
	end

	var_0_2(arg_3_0, arg_3_1)
	arg_3_0.ModesButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		local var_6_0 = LUI.FlowManager.GetScopedData(arg_6_0)

		LUI.FlowManager.RequestAddMenu("GameModes", true, arg_6_1.controller, false, {
			isTournament = var_6_0.isTournament,
			matchmakerSettings = var_6_0.matchmakerSettings
		}, true)
	end)
end

function GameSetupButtons(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalList.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_7_0.id = "GameSetupButtons"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(10 * _1080p)

	local var_7_3

	if not CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_3 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_3.id = "MapsButton"

		var_7_3.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MAP_CAPS"), 0)
		var_7_3.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_MAP"), 0)
		var_7_3.DynamicText:setText("", 0)
		var_7_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
		var_7_0:addElement(var_7_3)

		var_7_0.MapsButton = var_7_3
	end

	local var_7_4

	if CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_4 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_4.id = "MapRound1"

		var_7_4.PlayMenuButton.Text:setText(ToUpperCase(LocalizeIntoString("1", "TOURNAMENT/MAP_ROUND")), 0)
		var_7_4.PlayMenuButton.Description:setText(LocalizeIntoString("1", "TOURNAMENT/MAP_ROUND_DESC"), 0)
		var_7_4.DynamicText:setText("", 0)
		var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
		var_7_0:addElement(var_7_4)

		var_7_0.MapRound1 = var_7_4
	end

	local var_7_5

	if CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_5 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_5.id = "MapRound2"

		var_7_5.PlayMenuButton.Text:setText(ToUpperCase(LocalizeIntoString("2", "TOURNAMENT/MAP_ROUND")), 0)
		var_7_5.PlayMenuButton.Description:setText(LocalizeIntoString("2", "TOURNAMENT/MAP_ROUND_DESC"), 0)
		var_7_5.DynamicText:setText("", 0)
		var_7_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
		var_7_0:addElement(var_7_5)

		var_7_0.MapRound2 = var_7_5
	end

	local var_7_6

	if CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_6 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_6.id = "MapRound3"

		var_7_6.PlayMenuButton.Text:setText(ToUpperCase(LocalizeIntoString("3", "TOURNAMENT/MAP_ROUND")), 0)
		var_7_6.PlayMenuButton.Description:setText(LocalizeIntoString("3", "TOURNAMENT/MAP_ROUND_DESC"), 0)
		var_7_6.DynamicText:setText("", 0)
		var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
		var_7_0:addElement(var_7_6)

		var_7_0.MapRound3 = var_7_6
	end

	local var_7_7

	if CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_7 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_7.id = "MapRound4"

		var_7_7.PlayMenuButton.Text:setText(ToUpperCase(LocalizeIntoString("4", "TOURNAMENT/MAP_ROUND")), 0)
		var_7_7.PlayMenuButton.Description:setText(LocalizeIntoString("4", "TOURNAMENT/MAP_ROUND_DESC"), 0)
		var_7_7.DynamicText:setText("", 0)
		var_7_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 240, _1080p * 290)
		var_7_0:addElement(var_7_7)

		var_7_0.MapRound4 = var_7_7
	end

	local var_7_8
	local var_7_9 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
		controllerIndex = var_7_1
	})

	var_7_9.id = "ModesButton"

	var_7_9.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MODE_CAPS"), 0)
	var_7_9.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_GAMEMODE"), 0)
	var_7_9.DynamicText:setText("", 0)
	var_7_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 300, _1080p * 350)
	var_7_0:addElement(var_7_9)

	var_7_0.ModesButton = var_7_9

	local var_7_10

	if not CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_10 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_10.id = "OptionsButton"

		var_7_10.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("MENU/CHANGE_GAME_RULES_CAPS"), 0)
		var_7_10.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_OPTIONS"), 0)
		var_7_10.DynamicText:setText("", 0)
		var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 360, _1080p * 410)
		var_7_0:addElement(var_7_10)

		var_7_0.OptionsButton = var_7_10
	end

	local var_7_11

	if not CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_11 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_11.id = "BotSetup"

		var_7_11.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BOT_SETUP_CAPS")), 0)
		var_7_11.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_BOTS"), 0)
		var_7_11.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_7_11.DisabledText:SetAnimMoveTime(2000)
		var_7_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 420, _1080p * 470)
		var_7_0:addElement(var_7_11)

		var_7_0.BotSetup = var_7_11
	end

	local var_7_12

	if CONDITIONS.IsThirdGameMode(var_7_0) then
		var_7_12 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_12.id = "MissionButton"

		var_7_12.PlayMenuButton.Text:setText("Mission(Debug)", 0)
		var_7_12.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_OPTIONS"), 0)
		var_7_12.DynamicText:setText("", 0)
		var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 480, _1080p * 530)
		var_7_0:addElement(var_7_12)

		var_7_0.MissionButton = var_7_12
	end

	if not CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_3:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			local var_8_0 = arg_8_1.controller or var_7_1

			ACTIONS.OpenMenu("Maps", true, var_8_0)
		end)
	end

	if CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_4:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			local var_9_0 = arg_9_1.controller or var_7_1

			ACTIONS.OpenMenu("Maps", true, var_9_0)
		end)
	end

	if CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_5:addEventHandler("button_action", function(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1.controller or var_7_1

			ACTIONS.OpenMenu("Maps", true, var_10_0)
		end)
	end

	if CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_6:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			local var_11_0 = arg_11_1.controller or var_7_1

			ACTIONS.OpenMenu("Maps", true, var_11_0)
		end)
	end

	if CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_7:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			local var_12_0 = arg_12_1.controller or var_7_1

			ACTIONS.OpenMenu("Maps", true, var_12_0)
		end)
	end

	if not CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_10:addEventHandler("button_action", function(arg_13_0, arg_13_1)
			local var_13_0 = arg_13_1.controller or var_7_1

			ACTIONS.OpenMenu("GameSetupOptionsMenu", true, var_13_0)
		end)
	end

	if not CONDITIONS.IsPrivateMatchTournament(var_7_0) then
		var_7_11:addEventHandler("button_action", function(arg_14_0, arg_14_1)
			local var_14_0 = arg_14_1.controller or var_7_1

			ACTIONS.OpenMenu("GameSetupBots", true, var_14_0)
		end)
	end

	if CONDITIONS.IsThirdGameMode(var_7_0) then
		var_7_12:addEventHandler("button_action", function(arg_15_0, arg_15_1)
			local var_15_0 = arg_15_1.controller or var_7_1

			ACTIONS.OpenMenu("MissionSelectDebug", true, var_15_0)
		end)
	end

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("GameSetupButtons", GameSetupButtons)
LockTable(_M)
