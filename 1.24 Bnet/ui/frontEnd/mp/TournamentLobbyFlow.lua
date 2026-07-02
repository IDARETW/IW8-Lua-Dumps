module(..., package.seeall)

local var_0_0 = {
	versus = 2,
	waitingForMatchmaking = 1
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.currentLobbyWidget and arg_1_0.currentLobbyWidget:getParent() == arg_1_0 then
		arg_1_0:RemoveElement(arg_1_0.currentLobbyWidget)
	end

	arg_1_0.currentLobbyWidget = MenuBuilder.BuildRegisteredType(arg_1_1, {
		controllerIndex = arg_1_2
	})

	arg_1_0:addElement(arg_1_0.currentLobbyWidget)
end

local function var_0_2(arg_2_0, arg_2_1)
	if arg_2_0:GetCurrentMenu() then
		if Tournament.CFBFHBBI() and arg_2_0._state ~= var_0_0.versus then
			arg_2_0:dispatchEventToCurrentMenu({
				button_ref = "button_alt1",
				name = "add_button_helper_text",
				helper_text = "",
				side = "left"
			})
		end

		arg_2_0:dispatchEventToCurrentMenu({
			button_ref = "button_r3",
			name = "add_button_helper_text",
			side = "left",
			helper_text = TOURNAMENT.CanShowResults() and Engine.CBBHFCGDIC("TOURNAMENT/RESULTS") or ""
		})
		arg_2_0:dispatchEventToCurrentMenu({
			button_ref = "button_right_trigger",
			name = "add_button_helper_text",
			side = "left",
			helper_text = not TOURNAMENT.CanShowResults() and Engine.CBBHFCGDIC("TOURNAMENT/DETAILS") or ""
		})
	else
		arg_2_0:addEventHandler("menu_create", function(arg_3_0, arg_3_1)
			if Tournament.CFBFHBBI() and arg_2_0._state ~= var_0_0.versus then
				arg_2_0:dispatchEventToCurrentMenu({
					button_ref = "button_alt1",
					name = "add_button_helper_text",
					helper_text = "",
					side = "left"
				})
			end

			arg_2_0:dispatchEventToCurrentMenu({
				button_ref = "button_r3",
				name = "add_button_helper_text",
				side = "left",
				helper_text = TOURNAMENT.CanShowResults() and Engine.CBBHFCGDIC("TOURNAMENT/RESULTS") or ""
			})
			arg_2_0:dispatchEventToCurrentMenu({
				button_ref = "button_right_trigger",
				name = "add_button_helper_text",
				side = "left",
				helper_text = not TOURNAMENT.CanShowResults() and Engine.CBBHFCGDIC("TOURNAMENT/DETAILS") or ""
			})
		end)
	end

	if Tournament.CFBFHBBI() and arg_2_0._state ~= var_0_0.versus then
		arg_2_0._state = var_0_0.versus

		var_0_1(arg_2_0, "TournamentVersus", arg_2_1)
	end

	if not Tournament.CFBFHBBI() and arg_2_0._state ~= var_0_0.waitingForMatchmaking then
		var_0_1(arg_2_0, "TournamentBracketContainer", arg_2_1)

		arg_2_0._state = var_0_0.waitingForMatchmaking
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._state = var_0_0.waitingForMatchmaking

	var_0_1(arg_4_0, "TournamentBracketContainer", arg_4_1)

	arg_4_0.lobbyStatusTimer = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_status"
	})
	arg_4_0.lobbyStatusTimer.id = "lobbyStatusTimer"

	arg_4_0:addElement(arg_4_0.lobbyStatusTimer)
	arg_4_0:registerEventHandler("update_lobby_status", function(arg_5_0, arg_5_1)
		var_0_2(arg_5_0, arg_4_1)
	end)
	var_0_2(arg_4_0, arg_4_1)

	local var_4_0 = LUI.UIBindButton.new()

	arg_4_0:addElement(var_4_0)
	var_4_0:addEventHandler("button_right_stick", function(arg_6_0, arg_6_1)
		if TOURNAMENT.CanShowResults() then
			LUI.FlowManager.RequestPopupMenu(arg_4_0, "TournamentResultsPopup", true, arg_4_1)
		end
	end)
	var_4_0:addEventHandler("button_right_trigger", function(arg_7_0, arg_7_1)
		if not TOURNAMENT.CanShowResults() then
			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			LUI.FlowManager.RequestPopupMenu(arg_4_0, "TournamentSignUpAlpha", true, arg_4_1, false, {
				inBracket = true
			})
		end
	end)
end

function TournamentLobbyFlow(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "TournamentLobbyFlow"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("TournamentLobbyFlow", TournamentLobbyFlow)
LockTable(_M)
