module(..., package.seeall)
MenuBuilder.registerType("MPSystemLinkLobby", function(...)
	return SystemLinkLobby(...)
end)
LUI.FlowManager.RequestSetStack("MPSystemLinkLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenuOffline"
	},
	{
		exclusiveController = true,
		name = "MPSystemLinkMenu"
	}
})
MenuBuilder.registerType("CPSystemLinkLobby", function(...)
	return SystemLinkLobby(...)
end)
LUI.FlowManager.RequestSetStack("CPSystemLinkLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenuOffline"
	},
	{
		exclusiveController = true,
		name = "CPSystemLinkMenu"
	}
})

local var_0_0 = "frontEnd.systemLinkLobby"

local function var_0_1()
	local var_3_0 = MP_COMMON.IsMatchRulesCODCastingEnabled(false)

	CODCASTER.SetCODCastingEnabled(var_3_0)
	Lobby.IEEDICEJE(var_3_0)
end

local function var_0_2()
	if CONDITIONS.IsCoreMultiplayer() then
		var_0_1()
	elseif CONDITIONS.IsThirdGameMode() then
		Dvar.BDEHAEGHAF("PTNOLQOOP", "none")
	end
end

local function var_0_3()
	Dvar.DHEGHJJJHI("LLPNKKORPT", false)
	WipeGlobalModelsAtPath(var_0_0)

	if CONDITIONS.IsCoreMultiplayer() then
		Lobby.IEEDICEJE(false)
		CODCASTER.SetCODCastingEnabled(false)
	end
end

LUI.FlowManager.RegisterStackPushBehaviour("MPSystemLinkLobby", var_0_2)
LUI.FlowManager.RegisterStackPopBehaviour("MPSystemLinkLobby", var_0_3)
LUI.FlowManager.RegisterStackPushBehaviour("CPSystemLinkLobby", var_0_2)
LUI.FlowManager.RegisterStackPopBehaviour("CPSystemLinkLobby", var_0_3)

local function var_0_4(arg_6_0)
	return function(arg_7_0, arg_7_1)
		if Lobby.CAEJIEEEDF() > 0 then
			Lobby.CJBHJEAFGH(0)
		end

		Engine.DAGFFDGFII("xstopprivateparty 0", arg_7_1)

		if not arg_6_0.isLocalPlayMenuSkipped then
			LUI.FlowManager.RequestLeaveMenu(arg_6_0.menu)
		elseif Engine.HABIAFADE() and not CONDITIONS.IsLaunchChunk() then
			Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)

			local var_7_0 = CONDITIONS.IsCoreMultiplayer() and "MPMainMenu" or "CPMainMenu"

			LUI.FlowManager.RequestAddMenu(var_7_0, false, arg_7_1)
		else
			LUI.FlowManager.RequestRestoreMenu("MainMenuOffline", false, arg_7_1)
		end

		if CONDITIONS.IsCoreMultiplayer() then
			CODCASTER.SetCODCastingEnabled(false)
			Lobby.IEEDICEJE(false)
			MLG.SetUsingMLGRules(false)
		end

		Lobby.endNVidiaGroup("MW_Highlights")
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	local var_8_0 = {
		message = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVELOBBY"),
		yesAction = var_0_4(arg_8_1)
	}
	local var_8_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_8_0)

	var_8_1.id = "LeaveSystemLinkLobbyPopup"

	return var_8_1
end

MenuBuilder.registerType("LeaveSystemLinkLobbyPopup", var_0_5)

function LeaveSystemLinkLobby(arg_9_0, arg_9_1)
	if Dvar.IBEGCHEFE("LLPNKKORPT") and Lobby.BCIDJGIGEA() then
		Lobby.DEHBAFGJCC()

		return
	end

	local var_9_0 = arg_9_0._isLocalPlayMenuSkipped

	if CONDITIONS.IsLaunchChunk() then
		var_9_0 = true

		var_0_4({
			isLocalPlayMenuSkipped = var_9_0,
			menu = arg_9_0
		})(nil, arg_9_1.controller)

		return
	end

	LUI.FlowManager.RequestPopupMenu(arg_9_0, "LeaveSystemLinkLobbyPopup", true, arg_9_1.controller, false, {
		isLocalPlayMenuSkipped = var_9_0,
		menu = arg_9_0
	})
end

local function var_0_6(arg_10_0, arg_10_1)
	Lobby.BHDJFHEDJG(arg_10_1)
	Lobby.EAHFJBBBBD(arg_10_0._isCoreMultiplayer and PartyUIRoot.MP_SYSTEM_LINK_LOBBY or PartyUIRoot.CP_SYSTEM_LINK_LOBBY)
	Lobby.RefreshMLGRules(arg_10_0, arg_10_1)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)

	if arg_10_0._isCoreMultiplayer then
		Lobby.DIHECGCADG(MP_COMMON.IsMatchRulesTeamAssignmentEnabled())
	else
		Lobby.DIHECGCADG(true)
	end

	Dvar.DHEGHJJJHI("NQORMNOQQM", Lobby.DCGBEGCEHA())
end

local function var_0_7(arg_11_0, arg_11_1)
	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	end
end

local function var_0_8(arg_12_0, arg_12_1)
	arg_12_0.bindButton = LUI.UIBindButton.new()
	arg_12_0.bindButton.id = "selfBindButton"

	arg_12_0:addElement(arg_12_0.bindButton)
	arg_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_12_0.bindButton:addEventHandler("button_start", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_1.controller or arg_12_1

		ACTIONS.OpenOptionsMenu(var_13_0)
		ACTIONS.PlaySoundSetSound(arg_12_0, "selectAlt", false)
	end)
end

local function var_0_9(arg_14_0, arg_14_1, arg_14_2)
	if CONDITIONS.IsThirdGameMode() then
		Dvar.DFIJDJFIFD("OOTQKOTRM", 4)
	elseif CONDITIONS.IsCoreMultiplayer() then
		local var_14_0 = Dvar.CFHDGABACF("ROMTTTNL")

		Dvar.DFIJDJFIFD("OOTQKOTRM", var_14_0)
	end
end

local function var_0_10(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.controller or Engine.IJEBHJIJF()

	PRIVATE_MATCH.SetupPrivateMatchTabs(arg_15_0, var_15_0, {
		firstTabName = "LUA_MENU/PLAY",
		firstTabWidget = "SystemLinkLobbyPlayMenu",
		leaveMenuFunction = function(arg_16_0, arg_16_1)
			LeaveSystemLinkLobby(arg_15_0, arg_16_1)
		end,
		callbackFunc = function(arg_17_0)
			local var_17_0 = arg_17_0 == 0

			if var_17_0 and arg_15_0._isCoreMultiplayer and not CONDITIONS.IsLaunchChunk() then
				arg_15_0.HelperBar:AddButtonHelperTextToElement(arg_15_0, {
					kbm_only = true,
					priority = 3,
					side = "left",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("MPUI/CHANGE_TEAM")
				})
			else
				arg_15_0.HelperBar:RemoveButtonHelperTextFromElement(arg_15_0, "button_alt1", "left")
			end

			Lobby.SetupReopenAAR(arg_15_0, var_15_0, var_17_0)
		end
	})

	if CONDITIONS.IsLaunchChunk() then
		for iter_15_0 = 2, 4 do
			arg_15_0.Tabs:GetTabAtIndex(iter_15_0):Disable()
		end

		arg_15_0.Tabs:SetAlpha(0)
	else
		PRIVATE_MATCH.SetDefaultMatchRules()

		if CONDITIONS.IsThirdGameMode() then
			CP.ClearWaveLoadout(var_15_0)
			CP.ClearAllPickupMunitions(var_15_0)
		end
	end
end

local function var_0_11(arg_18_0, arg_18_1, arg_18_2)
	assert(arg_18_0.MenuTitle)
	assert(arg_18_0.Tabs)
	assert(arg_18_0.HelperBar)

	arg_18_0._isCoreMultiplayer = CONDITIONS.IsCoreMultiplayer()

	if arg_18_0._isCoreMultiplayer then
		arg_18_0.isSignInMenu = true
	end

	if CONDITIONS.IsThirdGameMode() then
		CP.ClearAllPickupMunitions(arg_18_1)
	end

	arg_18_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/LOBBY"))

	arg_18_0._isLocalPlayMenuSkipped = arg_18_2.isLocalPlayMenuSkipped

	Engine.EBIDFIDHIE(MPConfig.default_dvars, arg_18_1)
	var_0_6(arg_18_0, arg_18_1)
	PRIVATE_MATCH.SetupPrivateMatchLobbyScene(arg_18_0, arg_18_1)
	var_0_8(arg_18_0, arg_18_1)
	var_0_7(arg_18_0, arg_18_1)
	arg_18_0:addEventHandler("menu_create", var_0_10)

	if CONDITIONS.IsLaunchChunk() then
		arg_18_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/LC_LOBBY_TITLE"))
		Dvar.DHEGHJJJHI("LLPNKKORPT", true)
		MatchRules.CJGCIGEBB(1)

		local var_18_0 = "arena"
		local var_18_1 = "mp_lc_speedball"
		local var_18_2 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_18_1, CSV.mpMapTable.cols.name)

		DataSources.frontEnd.lobby.mapName:SetValue(arg_18_1, var_18_2)
		DataSources.frontEnd.lobby.mapImage:SetValue(arg_18_1, MP.GetMapImage(var_18_1))
		Dvar.DFIJDJFIFD("NPSTLPMPSS", -1)

		if MatchRules.BIJEDCBCBH("gametype") then
			Lobby.FixTeamLimitsAndDifficultiesIfNecessary(MatchRules.BIJEDCBCBH("gametype"), var_18_0)
		end

		MatchRules.CIGFFEAEFD("gametype", var_18_0)
		MatchRules.BCECADEHDA()
		Engine.DAGFFDGFII(CoD.GetMPSystemLinkCfg(), arg_18_1)
		LoadoutDrafting.EABHFICBCE(false)
		MLG.SetUsingMLGRules(false)
		MatchRules.BCECADEHDA()
		Engine.DAGFFDGFII("xupdatepartystate")
		Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 1)
		Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 1)
	end

	local function var_18_3(arg_19_0, arg_19_1)
		if CoD.GetAspectRatioScaleAdjust(0.2) == 0 then
			arg_19_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
		else
			arg_19_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
		end
	end

	arg_18_0:addAndCallEventHandler("onVideoChange", var_18_3)
	LAYOUT.AddAspectRatioFadeFrame(arg_18_0, arg_18_1)
	Lobby.PreloadViewHandsForLocalPlayer(arg_18_1)
end

function SystemLinkLobby(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIHorizontalNavigator.new()

	var_20_0.id = "SystemLinkLobby"

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)
	var_0_9(var_20_0, var_20_1, arg_20_1)

	var_20_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_20_1
	})
	var_20_0.HelperBar.id = "HelperBar"

	var_20_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_20_0.HelperBar:setPriority(10)
	var_20_0:addElement(var_20_0.HelperBar)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_20_1
	})

	var_20_4.id = "TabBacker"

	var_20_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_20_0:addElement(var_20_4)

	var_20_0.TabBacker = var_20_4

	local var_20_5
	local var_20_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_20_1
	})

	var_20_6.id = "MenuTitle"

	var_20_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/LOBBY")), 0)
	var_20_6.Line:SetLeft(0, 0)
	var_20_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_20_0:addElement(var_20_6)

	var_20_0.MenuTitle = var_20_6

	local var_20_7
	local var_20_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_20_1
			})
		end,
		controllerIndex = var_20_1
	}
	local var_20_9 = LUI.TabManager.new(var_20_8)

	var_20_9.id = "Tabs"

	var_20_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 994, _1080p * 108, _1080p * 160)
	var_20_0:addElement(var_20_9)

	var_20_0.Tabs = var_20_9

	local var_20_10
	local var_20_11 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_20_1
	})

	var_20_11.id = "LobbyMembersFooter"

	var_20_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_20_0:addElement(var_20_11)

	var_20_0.LobbyMembersFooter = var_20_11

	local var_20_12

	if CONDITIONS.IsUserSignedInDemonware(var_20_1) then
		local var_20_13 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_20_1
		})

		var_20_13.id = "MPPlayerDetails"

		var_20_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_20_0:addElement(var_20_13)

		var_20_0.MPPlayerDetails = var_20_13
	end

	var_0_11(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("SystemLinkLobby", SystemLinkLobby)
LUI.FlowManager.RegisterStackPushBehaviour("SystemLinkLobby", var_0_2)
LUI.FlowManager.RegisterStackPopBehaviour("SystemLinkLobby", var_0_3)
LockTable(_M)
