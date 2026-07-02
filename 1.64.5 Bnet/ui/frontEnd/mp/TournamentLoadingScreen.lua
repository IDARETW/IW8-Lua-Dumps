module(..., package.seeall)
LUI.FlowManager.RequestSetStack("TournamentLoadingScreen", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "MPMainMenu"
	}
})
MenuBuilder.registerType("WZTournamentLoadingScreen", function(...)
	return TournamentLoadingScreen(...)
end)
LUI.FlowManager.RequestSetStack("WZTournamentLoadingScreen", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "BRMainMenu"
	}
})

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.MPTabsMenu)
	LUI.ToastManager.GetInstance():CloseToastOfType(LUI.ToastManager.NotificationType.Tournament)
	Lobby.EAHFJBBBBD(TOURNAMENT.GetUIRoot("loading"))
	arg_2_0.MPTabsMenu:SetupBackButtonHandler(function(arg_3_0, arg_3_1)
		local var_3_0 = Tournament.CAGAHEBBJB()
		local var_3_1 = Dvar.CFHDGABACF("LMMRSLRPNS")
		local var_3_2 = Dvar.IBEGCHEFE("MOQMSLQMQS")
		local var_3_3 = Lobby.GFFECBCCF()
		local var_3_4 = Lobby.BGIADHIHAG()
		local var_3_5 = var_3_3 and var_3_4

		if var_3_0 < var_3_1 or not var_3_2 then
			if var_3_5 then
				LUI.FlowManager.RequestPopupMenu(nil, "CancelTournamentSignUp", true, arg_2_1, false, {
					menu = arg_2_0
				})
			else
				LUI.FlowManager.RequestPopupMenu(nil, "LeavePartyAndCancelTournamentRegistration", true, arg_2_1, false, {
					menu = arg_2_0
				})
			end
		else
			LUI.FlowManager.RequestLeaveMenu(arg_2_2.menu, true, true)
		end

		return true
	end)
	arg_2_0.MPTabsMenu:SetupTabs(arg_2_1, {
		isTournament = true,
		firstTabWidget = "TournamentLoading",
		menu = arg_2_0
	})
	arg_2_0.bindButton:addEventHandler("button_right_trigger", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_2_0.MPTabsMenu.activeTabWidget

		if var_4_0 and var_4_0.RightTriggerOverride then
			return var_4_0.RightTriggerOverride(arg_4_0, arg_4_1)
		end

		return false
	end)

	local function var_2_0()
		if Tournament.BEAIBEGFFB() then
			LUI.FlowManager.RequestAddMenu(TOURNAMENT.GetMenuName("arena"), false, arg_2_1, true, {})
		elseif Tournament.BAEACBHFGF() and Lobby.BGIADHIHAG() then
			LUI.FlowManager.RequestAddMenu(TOURNAMENT.GetMenuName("matchmaking"), false, arg_2_1, true, {})
		end
	end

	local var_2_1 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_status"
	})

	var_2_1.id = "lobbyStatusTimer"

	arg_2_0:addElement(var_2_1)
	arg_2_0:registerEventHandler("update_lobby_status", var_2_0)
	var_2_0()
end

function TournamentLoadingScreen(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "TournamentLoadingScreen"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "MPTabsMenu"

	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_6_0:addElement(var_6_4)

	var_6_0.MPTabsMenu = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "LobbyStatus"

	var_6_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_6_0:addElement(var_6_6)

	var_6_0.LobbyStatus = var_6_6

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_6_7 = LUI.UIBindButton.new()

	var_6_7.id = "selfBindButton"

	var_6_0:addElement(var_6_7)

	var_6_0.bindButton = var_6_7

	var_6_0.bindButton:addEventHandler("button_start", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.controller or var_6_1

		ACTIONS.OpenOptionsMenu(var_7_0, "")
	end)
	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("TournamentLoadingScreen", TournamentLoadingScreen)
LockTable(_M)
