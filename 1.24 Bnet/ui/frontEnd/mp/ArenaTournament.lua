module(..., package.seeall)

local var_0_0 = {
	"TOURNAMENT/1V1",
	"TOURNAMENT/2V2",
	"TOURNAMENT/3V3",
	"TOURNAMENT/4V4"
}

LUI.FlowManager.RegisterFenceGroup("ArenaTournament", {
	"tournament"
})
LUI.FlowManager.RequestSetStack("ArenaTournament", {
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
LUI.FlowManager.RegisterFenceGroup("WZArenaTournament", {
	"tournament"
})
MenuBuilder.registerType("WZArenaTournament", function(...)
	return ArenaTournament(...)
end)
LUI.FlowManager.RequestSetStack("WZArenaTournament", {
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

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.MPTabsMenu)
	Streaming.BDDBGGIC(true)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("character_tournaments")
	LUI.ToastManager.GetInstance():CloseToastOfType(LUI.ToastManager.NotificationType.Tournament)

	local var_2_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = false,
		controllerIndex = arg_2_1
	})

	arg_2_0:addElement(var_2_0)
	arg_2_0.MPTabsMenu:SetupBackButtonHandler(function(arg_3_0, arg_3_1)
		if Tournament.BEFJGJJBEI() == TOURNAMENT.ParticipationStatus.ACTIVE then
			LUI.FlowManager.RequestPopupMenu(nil, "LeaveTournamentHoldingPen", true, arg_2_1, false, {
				menu = arg_2_0
			})
		else
			TOURNAMENT.ClearCurrentTournament(arg_2_1)
			Tournament.DCEADJJC()
			Lobby.LeavePublicLobby()
			Lobby.LeaveCommonMPMainMenu(arg_2_0, arg_2_1)
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)
		end

		return true
	end)
	arg_2_0.MPTabsMenu:SetupTabs(arg_2_1, {
		isTournament = true,
		firstTabWidget = "TournamentLobbyFlow",
		menu = arg_2_0
	})
	arg_2_0.MPTabsMenu.MenuTitle:closeTree()

	arg_2_0.MPTabsMenu.MenuTitle = nil

	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("TOURNAMENT/TITLE"))

	if not Lobby.GFFECBCCF() then
		Engine.DAGFFDGFII("xstartprivateparty", arg_2_1)
	end

	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)
	Lobby.EAHFJBBBBD(TOURNAMENT.GetUIRoot("arena"))

	if not arg_2_0.bindButton then
		arg_2_0.bindButton = LUI.UIBindButton.new()
		arg_2_0.bindButton.id = "selfBindButton"

		arg_2_0:addElement(arg_2_0.bindButton)
	end

	arg_2_0.bindButton:addEventHandler("button_right_trigger", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_2_0.MPTabsMenu.activeTabWidget

		if var_4_0 and var_4_0.RightTriggerOverride then
			return var_4_0.RightTriggerOverride(arg_4_0, arg_4_1)
		end

		return false
	end)
	TOURNAMENT.RecordCurrentTournament(arg_2_1)
	Lobby.PreloadViewHandsForLocalPlayer(arg_2_1)
end

function ArenaTournament(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "ArenaTournament"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "MPTabsMenu"

	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -960, _1080p * 960, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.MPTabsMenu = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "MenuTitle"

	var_5_6.MenuTitle:setText("", 0)
	var_5_6.Line:SetLeft(0, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_6)

	var_5_0.MenuTitle = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "LobbyStatus"

	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_5_0:addElement(var_5_8)

	var_5_0.LobbyStatus = var_5_8

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -1,
		helper_text = Engine.CBBHFCGDIC("TOURNAMENT/LEAVE_LOBBY")
	})
	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_5_9 = LUI.UIBindButton.new()

	var_5_9.id = "selfBindButton"

	var_5_0:addElement(var_5_9)

	var_5_0.bindButton = var_5_9

	var_5_0.bindButton:addEventHandler("button_start", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_1.controller or var_5_1

		ACTIONS.OpenOptionsMenu(var_6_0, "")
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ArenaTournament", ArenaTournament)
LockTable(_M)
