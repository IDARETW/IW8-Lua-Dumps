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
	Dvar.DHEGHJJJHI("MLQNQTRRTK", false)
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.bindButton)
	assert(arg_8_0.HelperBar)
	var_0_5(arg_8_0, arg_8_1)

	local var_8_0 = true

	if Dvar.IBEGCHEFE("LLOKOONSQK") == true and not Engine.DAFGFCFHJI() then
		var_8_0 = false

		if Dvar.IBEGCHEFE("LSNOPORRSS") == true then
			Engine.DDCJCCJCBA()
		end
	end

	if var_8_0 then
		Lobby.DDDCGDHHJF(arg_8_1)
	end

	Lobby.EAHFJBBBBD(PartyUIRoot.CP_PUBLIC_MATCH_LOBBY)
	CP.ClearWaveLoadout(arg_8_1)
	CP.ClearAllPickupMunitions(arg_8_1)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)
	arg_8_0.MPTabsMenu:SetupBackButtonHandler(function(arg_9_0, arg_9_1)
		var_0_4(arg_8_0, arg_9_1)

		return true
	end)
	arg_8_0.MPTabsMenu:SetupTabs(arg_8_1, {
		firstTabWidget = "CPPublicLobbyPlayMenu"
	})
	arg_8_0.bindButton:addEventHandler("button_start", function(arg_10_0, arg_10_1)
		ACTIONS.OpenOptionsMenu(arg_10_1.controller)
	end)
	arg_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		clickable = true,
		priority = 1,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_8_0.bindButton:addEventHandler("button_left_trigger", function(arg_11_0, arg_11_1)
		local var_11_0 = arg_8_0.MPTabsMenu.activeTabWidget

		if var_11_0 and var_11_0.LeftTriggerOverride then
			return var_11_0.LeftTriggerOverride(arg_11_0, arg_11_1)
		end

		return false
	end)

	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		PostGameFanfare:start()
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	elseif BATTLEPASS.ShouldShowFreeTierUpsell(arg_8_1) then
		LUI.FlowManager.RequestPopupMenu(arg_8_0, "BattlePassFreeTierUpsell", true, arg_8_1, false, {
			sourceMenu = arg_8_0
		})
	end

	SURVEY.OpenPostGameSurveyIfRequired(arg_8_1, false)

	if CONDITIONS.IsMatchSimToolEnabled(arg_8_0) then
		assert(arg_8_0.StartSim)
		arg_8_0.StartSim:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			MatchSimulator.ShowGameOverScreen()
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_8_0, arg_8_1)

	local var_8_1 = LUI.FlowManager.GetScopedData(arg_8_0)

	if not var_8_1.rolled and Dvar.IBEGCHEFE("TQRNTTMSL") then
		RANDOM.RollForAll()

		var_8_1.rolled = true
	end

	if Dvar.IBEGCHEFE("MNMTKTRPPP") then
		Lobby.LeavePublicLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_8_0:GetCurrentMenu())
	end

	arg_8_0:addEventHandler("OverwolfDetectedEvent", function(arg_13_0, arg_13_1)
		Lobby.LeavePublicLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_8_0:GetCurrentMenu())
	end)
end

function CPPublicMatchMenu(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIHorizontalNavigator.new()

	var_14_0.id = "CPPublicMatchMenu"

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)
	var_0_6(var_14_0, var_14_1, arg_14_1)

	var_14_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_14_1
	})
	var_14_0.HelperBar.id = "HelperBar"

	var_14_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_14_0.HelperBar:setPriority(10)
	var_14_0:addElement(var_14_0.HelperBar)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "MPTabsMenu"

	var_14_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_14_0:addElement(var_14_4)

	var_14_0.MPTabsMenu = var_14_4

	local var_14_5
	local var_14_6 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_14_1
	})

	var_14_6.id = "LobbyStatus"

	var_14_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 1921, 0, _1080p * 150)
	var_14_0:addElement(var_14_6)

	var_14_0.LobbyStatus = var_14_6

	local var_14_7

	if CONDITIONS.IsMatchSimToolEnabled() then
		local var_14_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_14_1
		})

		var_14_8.id = "StartSim"

		if CONDITIONS.IsMatchSimToolEnabled() then
			-- block empty
		end

		var_14_8.Text:SetLeft(_1080p * 20, 0)
		var_14_8.Text:setText("BEGIN SIMULATION  ", 0)
		var_14_8.Text:SetAlignment(LUI.Alignment.Right)
		var_14_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1574, _1080p * -96, _1080p * 707, _1080p * 787)
		var_14_0:addElement(var_14_8)

		var_14_0.StartSim = var_14_8
	end

	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 3,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
	})

	local var_14_9 = LUI.UIBindButton.new()

	var_14_9.id = "selfBindButton"

	var_14_0:addElement(var_14_9)

	var_14_0.bindButton = var_14_9

	var_0_7(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("CPPublicMatchMenu", CPPublicMatchMenu)
LUI.FlowManager.RegisterStackPushBehaviour("CPPublicMatchMenu", var_0_1)
LUI.FlowManager.RegisterStackPopBehaviour("CPPublicMatchMenu", var_0_2)
LockTable(_M)
