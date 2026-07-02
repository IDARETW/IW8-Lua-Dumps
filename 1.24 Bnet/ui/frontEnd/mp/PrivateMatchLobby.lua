module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0, arg_1_1)
	return var_0_0(arg_1_0, arg_1_1)
end

LUI.FlowManager.RequestSetStack("PrivateMatchLobby", {
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
MenuBuilder.registerType("CPPrivateMatchLobby", var_0_1)
LUI.FlowManager.RequestSetStack("CPPrivateMatchLobby", {
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

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_1.isTournament = true

	return var_0_0(arg_2_0, arg_2_1)
end

MenuBuilder.registerType("PrivateTournamentLobby", var_0_2)
LUI.FlowManager.RequestSetStack("PrivateTournamentLobby", {
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

local var_0_3 = "frontEnd.MP.privateLobby"

local function var_0_4()
	local var_3_0 = MP_COMMON.IsMatchRulesCODCastingEnabled(true)

	CODCASTER.SetCODCastingEnabled(var_3_0)
	Lobby.IEEDICEJE(var_3_0)
end

local function var_0_5()
	if CONDITIONS.IsCoreMultiplayer() then
		var_0_4()
	elseif CONDITIONS.IsThirdGameMode() then
		Dvar.BDEHAEGHAF("PTNOLQOOP", "none")
	end
end

LUI.FlowManager.RegisterStackPushBehaviour("PrivateMatchLobby", var_0_5)
LUI.FlowManager.RegisterStackPushBehaviour("CPPrivateMatchLobby", var_0_5)

local function var_0_6()
	WipeGlobalModelsAtPath(var_0_3)
	Lobby.IEEDICEJE(false)
	CODCASTER.SetCODCastingEnabled(false)
end

LUI.FlowManager.RegisterStackPopBehaviour("PrivateMatchLobby", var_0_6)

local function var_0_7(arg_6_0, arg_6_1)
	return function(arg_7_0, arg_7_1)
		if Lobby.CAEJIEEEDF() > 0 then
			Lobby.CJBHJEAFGH(0)
		end

		Lobby.LeaveCustomGameLobby()

		if not LUI.FlowManager.GetScopedData(arg_6_0).isTournament then
			CODCASTER.SetCODCastingEnabled(false)
			MLG.SetUsingMLGRules(false)
		end

		LUI.FlowManager.RequestLeaveMenu(arg_6_0, true, true)
	end
end

local function var_0_8(arg_8_0, arg_8_1)
	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_8_1)
	Lobby.EAHFJBBBBD(arg_8_0._isCoreMultiplayer and PartyUIRoot.MP_PRIVATE_MATCH or PartyUIRoot.CP_PRIVATE_MATCH)
	Lobby.RefreshMLGRules(arg_8_0, arg_8_1)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)

	if LUI.FlowManager.GetScopedData(arg_8_0).isTournament then
		Lobby.DIHECGCADG(false)
	elseif arg_8_0._isCoreMultiplayer then
		Lobby.DIHECGCADG(MP_COMMON.IsMatchRulesTeamAssignmentEnabled())
		CODCASTER.SetCODCastingEnabled(MP_COMMON.IsMatchRulesCODCastingEnabled(false))
	else
		Lobby.DIHECGCADG(true)
	end

	Dvar.DHEGHJJJHI("NQORMNOQQM", Lobby.DCGBEGCEHA())
end

local function var_0_9(arg_9_0, arg_9_1)
	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		if isAliensSolo() then
			PostGameFanfare:start()
		else
			Lobby.OpenAfterActionReport(arg_9_1, false, Engine.EAIICIFIFA())
		end

		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	end
end

local function var_0_10(arg_10_0, arg_10_1)
	arg_10_0.bindButton = LUI.UIBindButton.new()
	arg_10_0.bindButton.id = "selfBindButton"

	arg_10_0:addElement(arg_10_0.bindButton)
	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 1,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_10_0.HelperBar:AddButtonHelperTextToElement(arg_10_0, {
		kbm_only = true,
		priority = 3,
		side = "left",
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("MPUI/CHANGE_TEAM")
	})
	arg_10_0.bindButton:addEventHandler("button_start", function(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_1.controller or arg_10_1

		ACTIONS.OpenOptionsMenu(var_11_0)
		ACTIONS.PlaySoundSetSound(arg_10_0, "selectAlt", false)
	end)
	arg_10_0.bindButton:addEventHandler("button_alt2", function(arg_12_0, arg_12_1)
		FRIENDS.OpenFriendsList(arg_12_1.controller)
	end)
end

local function var_0_11(arg_13_0, arg_13_1, arg_13_2)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)

	if CONDITIONS.IsThirdGameMode() then
		Dvar.DFIJDJFIFD("OOTQKOTRM", 4)
	elseif CONDITIONS.IsCoreMultiplayer() then
		Engine.BJEAFDBHHJ()

		local var_13_0 = Dvar.CFHDGABACF("ROMTTTNL")

		Dvar.DFIJDJFIFD("OOTQKOTRM", var_13_0)
	end

	local var_13_1 = LUI.FlowManager.GetScopedData(arg_13_0)

	if arg_13_2.isTournament then
		var_13_1.isTournament = true
	end
end

local function var_0_12(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.controller or Engine.IJEBHJIJF()

	PRIVATE_MATCH.SetupPrivateMatchTabs(arg_14_0, var_14_0, {
		firstTabName = "LUA_MENU/PLAY",
		firstTabWidget = "PrivateMatchLobbyPlayMenu",
		leaveMenuFunction = function(arg_15_0, arg_15_1)
			if Lobby.DFFFFJHCEH() and Lobby.BCIDJGIGEA() then
				Lobby.DEHBAFGJCC()

				return
			end

			if Lobby.EBFDFHJDJG(var_14_0) then
				Lobby.BEDBHJJHDC(var_14_0)

				return
			end

			local var_15_0

			if Lobby.IsOurPrivatePartyHostInLobby() then
				var_15_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVEPARTYANDLOBBY")
			else
				var_15_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVELOBBY")
			end

			LUI.FlowManager.RequestPopupMenu(arg_14_0, "PopupYesNo", true, arg_15_1.controller, false, {
				yesAction = var_0_7(arg_14_0, var_14_0),
				message = var_15_0,
				actionSFX = SOUND_SETS.popups.privateSelect,
				popupSFX = SOUND_SETS.popups.privatePopup
			})

			return true
		end,
		callbackFunc = function(arg_16_0)
			local var_16_0 = arg_16_0 == 0

			if var_16_0 and arg_14_0._isCoreMultiplayer then
				arg_14_0.HelperBar:AddButtonHelperTextToElement(arg_14_0, {
					kbm_only = true,
					priority = 3,
					side = "left",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("MPUI/CHANGE_TEAM")
				})
			else
				arg_14_0.HelperBar:RemoveButtonHelperTextFromElement(arg_14_0, "button_alt1", "left")
			end

			Lobby.SetupReopenAAR(arg_14_0, var_14_0, var_16_0)
		end
	})

	local var_14_1 = LUI.FlowManager.GetScopedData(arg_14_0)

	PRIVATE_MATCH.SetDefaultMatchRules({
		isTournament = var_14_1.isTournament
	})

	if CONDITIONS.IsThirdGameMode() then
		CP.ClearWaveLoadout(var_14_0)
		CP.ClearAllPickupMunitions(var_14_0)
	end
end

local function var_0_13(arg_17_0, arg_17_1, arg_17_2)
	assert(arg_17_0.MenuTitle)
	assert(arg_17_0.Tabs)
	assert(arg_17_0.HelperBar)

	arg_17_0._isCoreMultiplayer = CONDITIONS.IsCoreMultiplayer()

	arg_17_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_GAME_CAPS"), Dvar.IBEGCHEFE("MQNNLTKNTS"))
	var_0_8(arg_17_0, arg_17_1)
	PRIVATE_MATCH.SetupPrivateMatchLobbyScene(arg_17_0, arg_17_1)
	var_0_10(arg_17_0, arg_17_1)
	var_0_9(arg_17_0, arg_17_1)
	arg_17_0:addEventHandler("menu_create", var_0_12)

	if arg_17_2.isTournament then
		local var_17_0 = LUI.FlowManager.GetScopedData(arg_17_0)

		if not var_17_0.matchmakerSettings then
			var_17_0.matchmakerSettings = LUI.DeepCopy(Lobby.DEFAULT_PRIVATE_TOURNAMENT)
		end
	end

	assert(arg_17_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_17_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_17_0, arg_17_1)
	Lobby.PreloadViewHandsForLocalPlayer(arg_17_1)
end

function var_0_0(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIHorizontalNavigator.new()

	var_18_0.id = "PrivateMatchLobby"

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)
	var_0_11(var_18_0, var_18_1, arg_18_1)

	var_18_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_18_1
	})
	var_18_0.HelperBar.id = "HelperBar"

	var_18_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_18_0.HelperBar:setPriority(10)
	var_18_0:addElement(var_18_0.HelperBar)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "TabBacker"

	var_18_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_18_0:addElement(var_18_4)

	var_18_0.TabBacker = var_18_4

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "MenuTitle"

	var_18_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_GAME_CAPS"), 0)
	var_18_6.Line:SetLeft(0, 0)
	var_18_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_18_0:addElement(var_18_6)

	var_18_0.MenuTitle = var_18_6

	local var_18_7
	local var_18_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_18_1
			})
		end,
		controllerIndex = var_18_1
	}
	local var_18_9 = LUI.TabManager.new(var_18_8)

	var_18_9.id = "Tabs"

	var_18_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_18_0:addElement(var_18_9)

	var_18_0.Tabs = var_18_9

	local var_18_10
	local var_18_11 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_18_1
	})

	var_18_11.id = "PartyWidget"

	var_18_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_18_0:addElement(var_18_11)

	var_18_0.PartyWidget = var_18_11

	local var_18_12
	local var_18_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_18_1
	})

	var_18_13.id = "LobbyMembersFooter"

	var_18_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_18_0:addElement(var_18_13)

	var_18_0.LobbyMembersFooter = var_18_13

	local var_18_14

	if CONDITIONS.IsUserSignedInDemonware(var_18_1) then
		local var_18_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_18_1
		})

		var_18_15.id = "MPPlayerDetails"

		var_18_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_18_0:addElement(var_18_15)

		var_18_0.MPPlayerDetails = var_18_15
	end

	local var_18_16

	if CONDITIONS.IsCpRaidMode(var_18_0) then
		local var_18_17 = MenuBuilder.BuildRegisteredType("CPCheckpointWidget", {
			controllerIndex = var_18_1
		})

		var_18_17.id = "CPCheckpointWidget"

		var_18_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 543, _1080p * 943, _1080p * 826, _1080p * 1026)
		var_18_0:addElement(var_18_17)

		var_18_0.CPCheckpointWidget = var_18_17
	end

	var_0_13(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("PrivateMatchLobby", var_0_0)
LockTable(_M)
