module(..., package.seeall)
LUI.FlowManager.RequestSetStack("CPPublicMatchMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "CPMainMenu"
	}
})

local var_0_0 = "frontEnd.cp.CPPublicMatchMenu"

local function var_0_1()
	if Engine.EAIICIFIFA() then
		Lobby.HGIGJIAIJ()
	end
end

local function var_0_2()
	WipeGlobalModelsAtPath(var_0_0)
end

local function var_0_3(arg_3_0)
	return function(arg_4_0, arg_4_1)
		if Lobby.CAEJIEEEDF() > 0 then
			Lobby.CJBHJEAFGH(0)
		end

		Lobby.LeavePublicLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_3_0, true, true)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0

	if Lobby.IsOurPrivatePartyHostInLobby() then
		var_5_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVEPARTYANDLOBBY")
	else
		var_5_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVELOBBY")
	end

	if Engine.BAHIIBFDDG() then
		local var_5_1 = {
			rateLimitIntervalMS = 5000,
			rateLimitAttempts = 3,
			yesAction = var_0_3(arg_5_0),
			message = var_5_0
		}

		LUI.FlowManager.RequestPopupMenu(arg_5_0, "RateLimitedPopupYesNo", true, arg_5_1.controller, false, var_5_1)
	else
		LUI.FlowManager.RequestPopupMenu(arg_5_0, "PopupYesNo", true, arg_5_1.controller, false, {
			yesAction = var_0_3(arg_5_0),
			message = var_5_0
		})
	end

	return true
end

local function var_0_5(arg_6_0, arg_6_1)
	if Engine.ECHCFGDDDF() then
		Engine.DAGFFDGFII("eliteclan_refresh", arg_6_1)
	end

	CP.PlayFrontendMusic()
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.bindButton)
	assert(arg_7_0.HelperBar)
	var_0_5(arg_7_0, arg_7_1)

	local var_7_0 = true

	if Dvar.IBEGCHEFE("LLOKOONSQK") == true and not Engine.DAFGFCFHJI() then
		var_7_0 = false

		if Dvar.IBEGCHEFE("LSNOPORRSS") == true then
			Engine.DDCJCCJCBA()
		end
	end

	if var_7_0 then
		Lobby.DDDCGDHHJF(arg_7_1)
	end

	Lobby.EAHFJBBBBD(PartyUIRoot.CP_PUBLIC_MATCH_LOBBY)
	CP.ClearWaveLoadout(arg_7_1)
	CP.ClearAllPickupMunitions(arg_7_1)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)
	arg_7_0.MPTabsMenu:SetupBackButtonHandler(function(arg_8_0, arg_8_1)
		var_0_4(arg_7_0, arg_8_1)

		return true
	end)
	arg_7_0.MPTabsMenu:SetupTabs(arg_7_1, {
		firstTabWidget = "CPPublicLobbyPlayMenu"
	})
	arg_7_0.bindButton:addEventHandler("button_start", function(arg_9_0, arg_9_1)
		ACTIONS.OpenOptionsMenu(arg_9_1.controller)
	end)
	arg_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		clickable = true,
		priority = 1,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_7_0.bindButton:addEventHandler("button_left_trigger", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_7_0.MPTabsMenu.activeTabWidget

		if var_10_0 and var_10_0.LeftTriggerOverride then
			return var_10_0.LeftTriggerOverride(arg_10_0, arg_10_1)
		end

		return false
	end)

	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		PostGameFanfare:start()
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	elseif BATTLEPASS.ShouldShowFreeTierUpsell(arg_7_1) then
		LUI.FlowManager.RequestPopupMenu(arg_7_0, "BattlePassFreeTierUpsell", true, arg_7_1, false, {
			sourceMenu = arg_7_0
		})
	end

	SURVEY.OpenPostGameSurveyIfRequired(arg_7_1, false)

	if CONDITIONS.IsMatchSimToolEnabled(arg_7_0) then
		assert(arg_7_0.StartSim)
		arg_7_0.StartSim:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			MatchSimulator.ShowGameOverScreen()
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_7_0, arg_7_1)
end

function CPPublicMatchMenu(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIHorizontalNavigator.new()

	var_12_0.id = "CPPublicMatchMenu"

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	var_12_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})
	var_12_0.HelperBar.id = "HelperBar"

	var_12_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_12_0.HelperBar:setPriority(10)
	var_12_0:addElement(var_12_0.HelperBar)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "MPTabsMenu"

	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_12_0:addElement(var_12_4)

	var_12_0.MPTabsMenu = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "LobbyStatus"

	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 1921, 0, _1080p * 150)
	var_12_0:addElement(var_12_6)

	var_12_0.LobbyStatus = var_12_6

	local var_12_7

	if CONDITIONS.IsMatchSimToolEnabled(var_12_0) then
		local var_12_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_12_1
		})

		var_12_8.id = "StartSim"

		if CONDITIONS.IsMatchSimToolEnabled(var_12_0) then
			-- block empty
		end

		var_12_8.Text:SetLeft(_1080p * 20, 0)
		var_12_8.Text:setText("BEGIN SIMULATION  ", 0)
		var_12_8.Text:SetAlignment(LUI.Alignment.Right)
		var_12_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1574, _1080p * -96, _1080p * 707, _1080p * 787)
		var_12_0:addElement(var_12_8)

		var_12_0.StartSim = var_12_8
	end

	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 3,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
	})

	local var_12_9 = LUI.UIBindButton.new()

	var_12_9.id = "selfBindButton"

	var_12_0:addElement(var_12_9)

	var_12_0.bindButton = var_12_9

	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("CPPublicMatchMenu", CPPublicMatchMenu)
LUI.FlowManager.RegisterStackPushBehaviour("CPPublicMatchMenu", var_0_1)
LUI.FlowManager.RegisterStackPopBehaviour("CPPublicMatchMenu", var_0_2)
LockTable(_M)
