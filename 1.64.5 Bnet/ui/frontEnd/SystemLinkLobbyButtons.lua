module(..., package.seeall)

local var_0_0 = "frontEnd.systemLinkLobby.buttons"

local function var_0_1(arg_1_0, arg_1_1)
	if Lobby.CAEJIEEEDF() == 0 then
		Lobby.CJBHJEAFGH(2)
	end

	LUI.FlowManager.GetScopedData(arg_1_0).startingController = arg_1_1

	arg_1_0:dispatchEventToRoot({
		name = "start_transition_to_game",
		skipCountdown = false,
		immediate = true
	})
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.controller or controllerIndex

	local function var_2_1()
		if LOADOUT.MATCHRULES.ShouldShowLoadoutRestrictedPopup(var_2_0) then
			LUI.FlowManager.RequestPopupMenu(nil, "CDLInvalidLoadout", true, var_2_0, false, {
				confirmAction = function()
					var_0_1(arg_2_0, var_2_0)
				end
			})
		else
			var_0_1(arg_2_0, var_2_0)
		end
	end

	if CONDITIONS.IsLaunchChunk() then
		var_2_1()
	else
		if not PRIVATE_MATCH.ValidateGameSetup() then
			return
		end

		if CONDITIONS.IsArenaGameType() then
			local var_2_2 = Engine.CGEFDFCIJA()
			local var_2_3 = Lobby.MaxPlayerLimitForGunfight

			if var_2_3 < var_2_2 then
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "EnteringGameModeWithHighPrivatePartyMemberCountWarning", true, var_2_0, false, {
					currentCount = var_2_2,
					maxCount = var_2_3
				})
			end
		end

		if Lobby.DoesCurrentGameTypeSupportCrossplay() or not Engine.CIIBCJJCIB() then
			var_2_1()
		end
	end
end

function StartTheGameHandler(arg_5_0, arg_5_1)
	local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)
	local var_5_1 = arg_5_1.skipCountdown == true

	Lobby.DCJFBFGGHG(var_5_0.startingController, var_5_1)

	local var_5_2 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_5_2, false, "MenuTransition")
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if arg_6_2.PlayMenuButton then
		arg_6_2 = arg_6_2.PlayMenuButton
	end

	if arg_6_3 == true then
		local var_6_0 = arg_6_2.Description:getText() .. "\n\n^3" .. arg_6_2.DisabledText:getText() .. "^7"

		arg_6_2:AddTooltipData(arg_6_1, {
			tooltipDescription = var_6_0
		})
	else
		arg_6_2:AddTooltipData(arg_6_1, {
			tooltipDescription = arg_6_2.Description:getText()
		})
	end
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.StartMatchButton)

	arg_7_0.widgetModelPath = var_0_0

	arg_7_0.StartMatchButton:addEventHandler("button_action", var_0_2)
	arg_7_0:addEventHandler("start_transition_to_game", StartTheGameHandler)

	if CONDITIONS.IsThirdGameMode then
		local function var_7_0()
			if arg_7_0.CPMapsButton then
				arg_7_0.CPMapsButton.DynamicText:setText(ToUpperCase(Lobby.ECIFCJJJIA()))
			end

			if arg_7_0.CPModesButton then
				arg_7_0.CPModesButton.DynamicText:setText(ToUpperCase(Lobby.GetCurrentGameTypeName()))
			end
		end

		var_7_0()
		CP.ClearAllPickupMunitions(arg_7_1)
		arg_7_0:addEventHandler("menu_create", var_7_0)
	end

	local var_7_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isPrivatePartyHost")
	local var_7_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isGameStartRequested")
	local var_7_3 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".disableButton")

	local function var_7_4(arg_9_0)
		local var_9_0 = var_7_1:GetValue(arg_9_0)
		local var_9_1 = var_7_2:GetValue(arg_9_0)

		return not var_9_0 or var_9_1
	end

	local var_7_5 = LUI.AggregateDataSource.new(var_7_3, {
		var_7_1,
		var_7_2
	}, "disabled", var_7_4)

	local function var_7_6()
		local var_10_0 = var_7_5:GetValue(arg_7_1)
		local var_10_1 = Engine.CBBHFCGDIC("MENU/LOCKED")

		if not var_7_1:GetValue(arg_7_1) then
			var_10_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST")
		end

		if arg_7_0.StartMatchButton then
			if arg_7_0._disableStartForCrossplay then
				arg_7_0.StartMatchButton:SetButtonDisabled(true)
				arg_7_0.StartMatchButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/MODE_DISABLED_CROSSPLAY"))
				arg_7_0.StartMatchButton.DisabledText:SetAnimMoveTime(8000)
				var_0_3(arg_7_0, arg_7_1, arg_7_0.StartMatchButton, true)
			else
				arg_7_0.StartMatchButton:SetButtonDisabled(var_10_0)
				arg_7_0.StartMatchButton.DisabledText:setText(var_10_1)
				arg_7_0.StartMatchButton.DisabledText:SetAnimMoveTime(2000)
				var_0_3(arg_7_0, arg_7_1, arg_7_0.StartMatchButton, var_10_0)
			end
		end

		if arg_7_0.GameSetupButton then
			arg_7_0.GameSetupButton:SetButtonDisabled(var_10_0)
			arg_7_0.GameSetupButton.DisabledText:setText(var_10_1)
			var_0_3(arg_7_0, arg_7_1, arg_7_0.GameSetupButton, var_10_0)
		end

		if arg_7_0.CPMapsButton then
			arg_7_0.CPMapsButton:SetButtonDisabled(var_10_0)
			arg_7_0.CPMapsButton.PlayMenuButton.DisabledText:setText(var_10_1)
			var_0_3(arg_7_0, arg_7_1, arg_7_0.CPMapsButton, var_10_0)
		end

		if arg_7_0.CPModesButton then
			arg_7_0.CPModesButton:SetButtonDisabled(var_10_0)
			arg_7_0.CPModesButton.PlayMenuButton.DisabledText:setText(var_10_1)
			var_0_3(arg_7_0, arg_7_1, arg_7_0.CPModesButton, var_10_0)
		end
	end

	arg_7_0:SubscribeToModel(var_7_5:GetModel(arg_7_1), var_7_6)

	if Engine.CIEGIACHAE() then
		local function var_7_7(arg_11_0)
			local var_11_0 = not Lobby.DoesCurrentGameTypeSupportCrossplay() and Engine.CIIBCJJCIB()

			if arg_11_0._disableStartForCrossplay ~= var_11_0 then
				arg_11_0._disableStartForCrossplay = var_11_0

				var_7_6()
			end
		end

		local var_7_8 = LUI.UITimer.new({
			interval = 500,
			event = "check_party"
		})

		var_7_8.id = "checkPartyTimer"

		var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)
		arg_7_0:addElement(var_7_8)
		arg_7_0:registerEventHandler("check_party", function(arg_12_0, arg_12_1)
			var_7_7(arg_7_0)
		end)
	end

	if arg_7_0.StartMatchButton then
		arg_7_0.StartMatchButton:addEventHandler("button_over", function(arg_13_0, arg_13_1)
			if not LUI.IsLastInputMouseNavigation(arg_7_1) then
				arg_13_0:Expand()
				ACTIONS.AnimateSequence(arg_13_0, "ButtonOver")
			else
				arg_13_0:Contract()
				ACTIONS.AnimateSequence(arg_13_0, "ButtonOverKBM")
			end
		end)
	end

	if arg_7_0.CPMapsButton then
		arg_7_0.CPMapsButton:addEventHandler("button_over", function(arg_14_0, arg_14_1)
			if not LUI.IsLastInputMouseNavigation(arg_7_1) then
				arg_14_0.PlayMenuButton:Expand()
				ACTIONS.AnimateSequence(arg_14_0, "ButtonOver")
			else
				arg_14_0.PlayMenuButton:Contract()
				ACTIONS.AnimateSequence(arg_14_0, "ButtonOverKBM")
			end
		end)
	end

	if arg_7_0.CPModesButton then
		arg_7_0.CPModesButton:addEventHandler("button_over", function(arg_15_0, arg_15_1)
			if not LUI.IsLastInputMouseNavigation(arg_7_1) then
				arg_15_0.PlayMenuButton:Expand()
				ACTIONS.AnimateSequence(arg_15_0, "ButtonOver")
			else
				arg_15_0.PlayMenuButton:Contract()
				ACTIONS.AnimateSequence(arg_15_0, "ButtonOverKBM")
			end
		end)
	end

	if arg_7_0.GameSetupButton then
		arg_7_0.GameSetupButton:addEventHandler("button_over", function(arg_16_0, arg_16_1)
			if not LUI.IsLastInputMouseNavigation(arg_7_1) then
				arg_16_0:Expand()
				ACTIONS.AnimateSequence(arg_16_0, "ButtonOver")
			else
				arg_16_0:Contract()
				ACTIONS.AnimateSequence(arg_16_0, "ButtonOverKBM")
			end
		end)
		arg_7_0.GameSetupButton:addEventHandler("button_action", function(arg_17_0, arg_17_1)
			if not PRIVATE_MATCH.ValidateGameSetup() then
				return
			end

			local var_17_0 = arg_17_1.controller or arg_7_1

			if CONDITIONS.IsCoreMultiplayer(arg_7_0) then
				ACTIONS.OpenMenu("GameSetup", true, var_17_0)
			end

			if CONDITIONS.IsThirdGameMode(arg_7_0) then
				ACTIONS.OpenMenu("CPGameSetup", true, var_17_0)
			end
		end)
	end

	if CONDITIONS.IsLaunchChunk() then
		if arg_7_0.GameSetupButton then
			arg_7_0:RemoveElement(arg_7_0.GameSetupButton)
		end

		arg_7_0.StartMatchButton.Description:setText("")
		arg_7_0.StartMatchButton:registerEventHandler("button_over", function(arg_18_0, arg_18_1)
			ACTIONS.AnimateSequence(arg_18_0, "ButtonOverKBM")
			arg_18_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		end)
		arg_7_0.StartMatchButton:registerEventHandler("button_up", function(arg_19_0, arg_19_1)
			ACTIONS.AnimateSequence(arg_19_0, "ButtonUp")
		end)
		arg_7_0.StartMatchButton:registerEventHandler("button_over_disable", function(arg_20_0, arg_20_1)
			ACTIONS.AnimateSequence(arg_20_0, "ButtonOverDisabledKBM")
		end)
		arg_7_0.StartMatchButton:registerEventHandler("button_disable", function(arg_21_0, arg_21_1)
			ACTIONS.AnimateSequence(arg_21_0, "ButtonUpDisabled")
		end)
	end
end

function SystemLinkLobbyButtons(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIVerticalList.new()

	var_22_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 480 * _1080p)

	var_22_0.id = "SystemLinkLobbyButtons"

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

	var_22_4.id = "StartMatchButton"

	var_22_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/START_MATCH")), 0)
	var_22_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_START_MATCH"), 0)
	var_22_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_22_4.DisabledText:SetAnimMoveTime(2000)
	var_22_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_22_0:addElement(var_22_4)

	var_22_0.StartMatchButton = var_22_4

	local var_22_5

	if CONDITIONS.IsThirdGameMode(var_22_0) then
		var_22_5 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_22_1
		})
		var_22_5.id = "CPMapsButton"

		var_22_5.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MAP_CAPS"), 0)
		var_22_5.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_MAP"), 0)
		var_22_5.DynamicText:setText("", 0)
		var_22_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
		var_22_0:addElement(var_22_5)

		var_22_0.CPMapsButton = var_22_5
	end

	local var_22_6

	if CONDITIONS.IsThirdGameModeAndSurvivalModeAllowed(var_22_0) then
		var_22_6 = MenuBuilder.BuildRegisteredType("DualMenuButton", {
			controllerIndex = var_22_1
		})
		var_22_6.id = "CPModesButton"

		var_22_6.PlayMenuButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MODE_CAPS"), 0)
		var_22_6.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_GAMEMODE"), 0)
		var_22_6.DynamicText:setText("", 0)
		var_22_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
		var_22_0:addElement(var_22_6)

		var_22_0.CPModesButton = var_22_6
	end

	local var_22_7

	if CONDITIONS.IsGameSetupEnabledAndCPDevMode(var_22_0) then
		local var_22_8 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_22_1
		})

		var_22_8.id = "GameSetupButton"

		var_22_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GAME_SETUP_CAPS")), 0)
		var_22_8.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/DESC_GAME_SETUP"), 0)
		var_22_8.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_22_8.DisabledText:SetAnimMoveTime(2000)
		var_22_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
		var_22_0:addElement(var_22_8)

		var_22_0.GameSetupButton = var_22_8
	end

	if CONDITIONS.IsThirdGameMode(var_22_0) then
		var_22_5:addEventHandler("button_action", function(arg_23_0, arg_23_1)
			local var_23_0 = arg_23_1.controller or var_22_1

			ACTIONS.OpenMenu("CPMaps", true, var_23_0)
		end)
	end

	if CONDITIONS.IsThirdGameModeAndSurvivalModeAllowed(var_22_0) then
		var_22_6:addEventHandler("button_action", function(arg_24_0, arg_24_1)
			local var_24_0 = arg_24_1.controller or var_22_1

			ACTIONS.OpenMenu("CPGameModes", true, var_24_0)
		end)
	end

	var_0_4(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("SystemLinkLobbyButtons", SystemLinkLobbyButtons)
LockTable(_M)
