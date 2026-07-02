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

local function var_0_1()
	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		RANDOM.RollForAll()
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.MPTabsMenu)
	Streaming.BDDBGGIC(true)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("character_tournaments")
	LUI.ToastManager.GetInstance():CloseToastOfType(LUI.ToastManager.NotificationType.Tournament)

	local var_3_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = false,
		controllerIndex = arg_3_1
	})

	arg_3_0:addElement(var_3_0)
	arg_3_0.MPTabsMenu:SetupBackButtonHandler(function(arg_4_0, arg_4_1)
		if Tournament.BEFJGJJBEI() == TOURNAMENT.ParticipationStatus.ACTIVE then
			LUI.FlowManager.RequestPopupMenu(nil, "LeaveTournamentHoldingPen", true, arg_3_1, false, {
				menu = arg_3_0
			})
		else
			TOURNAMENT.ClearCurrentTournament(arg_3_1)
			Tournament.DCEADJJC()
			Lobby.LeavePublicLobby()
			Lobby.LeaveCommonMPMainMenu(arg_3_0, arg_3_1)
			LUI.FlowManager.RequestLeaveMenu(arg_3_0, true, true)
		end

		return true
	end)
	arg_3_0.MPTabsMenu:SetupTabs(arg_3_1, {
		isTournament = true,
		firstTabWidget = "TournamentLobbyFlow",
		menu = arg_3_0
	})
	arg_3_0.MPTabsMenu.MenuTitle:closeTree()

	arg_3_0.MPTabsMenu.MenuTitle = nil

	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("TOURNAMENT/TITLE"))

	if not Lobby.GFFECBCCF() then
		Engine.DAGFFDGFII("xstartprivateparty", arg_3_1)
	end

	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)
	Lobby.EAHFJBBBBD(TOURNAMENT.GetUIRoot("arena"))

	if not arg_3_0.bindButton then
		arg_3_0.bindButton = LUI.UIBindButton.new()
		arg_3_0.bindButton.id = "selfBindButton"

		arg_3_0:addElement(arg_3_0.bindButton)
	end

	arg_3_0.bindButton:addEventHandler("button_right_trigger", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_3_0.MPTabsMenu.activeTabWidget

		if var_5_0 and var_5_0.RightTriggerOverride then
			return var_5_0.RightTriggerOverride(arg_5_0, arg_5_1)
		end

		return false
	end)
	TOURNAMENT.RecordCurrentTournament(arg_3_1)
	Lobby.PreloadViewHandsForLocalPlayer(arg_3_1)
end

function ArenaTournament(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "ArenaTournament"

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

	var_6_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -960, _1080p * 960, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.MPTabsMenu = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "MenuTitle"

	var_6_6.MenuTitle:setText("", 0)
	var_6_6.Line:SetLeft(0, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_6)

	var_6_0.MenuTitle = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "LobbyStatus"

	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_6_0:addElement(var_6_8)

	var_6_0.LobbyStatus = var_6_8

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -1,
		helper_text = Engine.CBBHFCGDIC("TOURNAMENT/LEAVE_LOBBY")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_6_9 = LUI.UIBindButton.new()

	var_6_9.id = "selfBindButton"

	var_6_0:addElement(var_6_9)

	var_6_0.bindButton = var_6_9

	var_6_0.bindButton:addEventHandler("button_start", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.controller or var_6_1

		ACTIONS.OpenOptionsMenu(var_7_0, "", "")
	end)
	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ArenaTournament", ArenaTournament)
LUI.FlowManager.RegisterStackPushBehaviour("ArenaTournament", var_0_1)
LockTable(_M)
