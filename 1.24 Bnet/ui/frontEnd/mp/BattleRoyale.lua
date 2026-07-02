module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("BattleRoyale", {
	"mp",
	"mpInstall",
	"mpOnlineData",
	"fnf",
	"contracts"
})
LUI.FlowManager.RequestSetStack("BattleRoyale", {
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
LUI.FlowManager.RequestSetStack("BattleRoyalePublicLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "MPMainMenu"
	},
	{
		name = "BattleRoyale"
	}
})

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = not CONDITIONS.ArePartiesEnabledInMainMenu() or not Lobby.BGIADHIHAG()

	if Lobby.IsNotAloneInPrivateParty() and var_1_0 then
		if Engine.BAHIIBFDDG() then
			local var_1_1 = {
				rateLimitIntervalMS = 5000,
				rateLimitAttempts = 3,
				menu = arg_1_0
			}

			LUI.FlowManager.RequestPopupMenu(arg_1_0, "RateLimitedLeaveCommonMPMainMenuPopup", true, arg_1_1.controller, false, var_1_1)
		else
			LUI.FlowManager.RequestPopupMenu(arg_1_0, "LeaveCommonMPMainMenuPopup", true, arg_1_1.controller, false, {
				menu = arg_1_0
			})
		end
	else
		Lobby.LeaveCommonMPMainMenu(arg_1_0, arg_1_1.controller)
	end

	return true
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_1.isPublicBRLobby = true

	return BattleRoyale(arg_2_0, arg_2_1)
end

MenuBuilder.registerType("BattleRoyalePublicLobby", var_0_1)

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.controller or Engine.IJEBHJIJF()

	Lobby.CheckTURequirement(arg_3_0, var_3_0)

	if not Lobby.GFFECBCCF() then
		Engine.DAGFFDGFII("xstartprivateparty", arg_3_1.controller)
	end

	arg_3_0:registerEventHandler("not_below_blocking_fence", function(arg_4_0, arg_4_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)

		if not MLG.JIHGCIJCG() then
			local var_4_0 = true

			if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.DAFGFCFHJI() then
				var_4_0 = false
			end

			if var_4_0 then
				Lobby.BHDJFHEDJG(var_3_0)
			end
		end
	end)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.MPTabsMenu)

	arg_5_0._isPublicBRLobby = arg_5_2.isPublicBRLobby

	if arg_5_2.isPublicBRLobby then
		arg_5_0.MPTabsMenu:SetupBackButtonHandler(function(arg_6_0, arg_6_1)
			LUI.FlowManager.RequestPopupMenu(nil, "LeaveMPPublicLobby", true, arg_6_1.controllerIndex, false, {
				MultiplayerPublicLobby = arg_5_0
			})

			return true
		end)
		arg_5_0:addEventHandler("menu_create", var_0_2)
		Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)
		Lobby.DDDCGDHHJF(arg_5_1)
		Lobby.EAHFJBBBBD(PartyUIRoot.BATTLE_ROYALE_MENU_PUBLIC_LOBBY)
	else
		arg_5_0.MPTabsMenu:SetupBackButtonHandler(function(arg_7_0, arg_7_1)
			var_0_0(arg_5_0, arg_7_1)
		end)
		Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY)
		Lobby.BHDJFHEDJG(arg_5_1)
		Lobby.EAHFJBBBBD(PartyUIRoot.BATTLE_ROYALE_MENU)
	end

	arg_5_0.MPTabsMenu:SetupTabs(arg_5_1, {
		firstTabWidget = "LobbyBattleRoyale"
	})
	arg_5_0.bindButton:addEventHandler("button_right_trigger", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_5_0.MPTabsMenu.activeTabWidget

		if var_8_0 and var_8_0.RightTriggerOverride then
			return var_8_0.RightTriggerOverride(arg_8_0, arg_8_1)
		end

		return false
	end)
end

function BattleRoyale(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0.id = "BattleRoyale"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	var_9_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_9_1
	})
	var_9_0.HelperBar.id = "HelperBar"

	var_9_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_9_0.HelperBar:setPriority(10)
	var_9_0:addElement(var_9_0.HelperBar)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "MPTabsMenu"

	var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_9_0:addElement(var_9_4)

	var_9_0.MPTabsMenu = var_9_4

	var_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
	})
	var_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_9_5 = LUI.UIBindButton.new()

	var_9_5.id = "selfBindButton"

	var_9_0:addElement(var_9_5)

	var_9_0.bindButton = var_9_5

	var_9_0.bindButton:addEventHandler("button_start", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1.controller or var_9_1

		ACTIONS.OpenOptionsMenu(var_10_0, "")
	end)
	var_0_3(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("BattleRoyale", BattleRoyale)
LockTable(_M)
