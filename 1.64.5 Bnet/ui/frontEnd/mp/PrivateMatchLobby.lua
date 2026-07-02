module(..., package.seeall)

local var_0_0 = {
	NonLoadoutTypes = {
		LOOT.itemTypes.CHARM,
		LOOT.itemTypes.STICKER,
		LOOT.itemTypes.WATCH,
		LOOT.itemTypes.VEHICLE_CAMO,
		LOOT.itemTypes.VEHICLE_HORN,
		LOOT.itemTypes.VEHICLE_TRACK
	},
	OperatorTypes = {
		LOOT.itemTypes.OPERATOR,
		LOOT.itemTypes.OPERATOR_SKIN,
		LOOT.itemTypes.OPERATOR_TAUNT,
		LOOT.itemTypes.OPERATOR_EXECUTION
	},
	BarracksTypes = {
		LOOT.itemTypes.PLAYERCARD,
		LOOT.itemTypes.EMBLEM,
		LOOT.itemTypes.SPRAYS,
		LOOT.itemTypes.GESTURES,
		LOOT.itemTypes.FRAME,
		LOOT.itemTypes.TITLE
	}
}
local var_0_1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4

local function var_0_5(arg_1_0, arg_1_1)
	return var_0_1(arg_1_0, arg_1_1)
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
MenuBuilder.registerType("CPPrivateMatchLobby", var_0_5)
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

local function var_0_6(arg_2_0, arg_2_1)
	arg_2_1.isTournament = true

	return var_0_1(arg_2_0, arg_2_1)
end

MenuBuilder.registerType("PrivateTournamentLobby", var_0_6)
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

local var_0_7 = "frontEnd.MP.privateLobby"

local function var_0_8()
	local var_3_0 = MP_COMMON.IsMatchRulesCODCastingEnabled(true)

	CODCASTER.SetCODCastingEnabled(var_3_0)
	Lobby.IEEDICEJE(var_3_0)
end

local function var_0_9()
	if CONDITIONS.IsCoreMultiplayer() then
		var_0_8()
	elseif CONDITIONS.IsThirdGameMode() then
		Dvar.BDEHAEGHAF("PTNOLQOOP", "none")
	end
end

LUI.FlowManager.RegisterStackPushBehaviour("PrivateMatchLobby", var_0_9)
LUI.FlowManager.RegisterStackPushBehaviour("CPPrivateMatchLobby", var_0_9)

local function var_0_10()
	WipeGlobalModelsAtPath(var_0_7)
	Lobby.IEEDICEJE(false)
	CODCASTER.SetCODCastingEnabled(false)
end

LUI.FlowManager.RegisterStackPopBehaviour("PrivateMatchLobby", var_0_10)

local function var_0_11(arg_6_0, arg_6_1)
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

local function var_0_12(arg_8_0, arg_8_1)
	Lobby.RefreshMLGRules(arg_8_0, arg_8_1)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)

	if LUI.FlowManager.GetScopedData(arg_8_0).isTournament then
		Lobby.DIHECGCADG(false)
	elseif arg_8_0._isCoreMultiplayer then
		Lobby.DIHECGCADG(MP_COMMON.IsMatchRulesTeamAssignmentEnabled())

		local var_8_0 = MP_COMMON.IsMatchRulesCODCastingEnabled(false)

		CODCASTER.SetCODCastingEnabled(var_8_0)
		Lobby.IEEDICEJE(var_8_0)
	else
		Lobby.DIHECGCADG(true)
	end

	Dvar.DHEGHJJJHI("NQORMNOQQM", Lobby.DCGBEGCEHA())
end

local function var_0_13(arg_9_0, arg_9_1)
	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_9_1)
	Lobby.EAHFJBBBBD(arg_9_0._isCoreMultiplayer and PartyUIRoot.MP_PRIVATE_MATCH or PartyUIRoot.CP_PRIVATE_MATCH)
	var_0_12(arg_9_0, arg_9_1)
end

local function var_0_14(arg_10_0, arg_10_1)
	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		if isAliensSolo() then
			PostGameFanfare:start()
		else
			Lobby.OpenAfterActionReport(arg_10_1, false, Engine.EAIICIFIFA())
		end

		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	end
end

local function var_0_15(arg_11_0, arg_11_1)
	arg_11_0.bindButton = LUI.UIBindButton.new()
	arg_11_0.bindButton.id = "selfBindButton"

	arg_11_0:addElement(arg_11_0.bindButton)
	arg_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 1,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_11_0.HelperBar:AddButtonHelperTextToElement(arg_11_0, {
		kbm_only = true,
		priority = 3,
		side = "left",
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("MPUI/CHANGE_TEAM")
	})
	arg_11_0.bindButton:addEventHandler("button_start", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.controller or arg_11_1

		ACTIONS.OpenOptionsMenu(var_12_0)
		ACTIONS.PlaySoundSetSound(arg_11_0, "selectAlt", false)
	end)
	arg_11_0.bindButton:addEventHandler("button_alt2", function(arg_13_0, arg_13_1)
		FRIENDS.OpenFriendsList(arg_13_1.controller)
	end)
end

local function var_0_16(arg_14_0, arg_14_1, arg_14_2)
	Dvar.DHEGHJJJHI("MLQNQTRRTK", false)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)

	local var_14_0 = CONDITIONS.IsThirdGameMode() and Lobby.MatchmakingGameType.GAME_TYPE_COOP or Lobby.MatchmakingGameType.GAME_TYPE_MULTIPLAYER

	PRIVATE_MATCH.SetupPrivateMatchGameType(var_14_0)

	if CONDITIONS.IsThirdGameMode() then
		Dvar.DFIJDJFIFD("OOTQKOTRM", 4)
	elseif CONDITIONS.IsCoreMultiplayer() then
		Engine.BJEAFDBHHJ()

		local var_14_1 = Dvar.CFHDGABACF("ROMTTTNL")

		Dvar.DFIJDJFIFD("OOTQKOTRM", var_14_1)
	end

	local var_14_2 = LUI.FlowManager.GetScopedData(arg_14_0)

	if arg_14_2.isTournament then
		var_14_2.isTournament = true
	end

	if not var_14_2.rolled and Dvar.IBEGCHEFE("TQRNTTMSL") then
		RANDOM.RollForAll()

		var_14_2.rolled = true
	end
end

local function var_0_17(arg_15_0, arg_15_1)
	local var_15_0 = false

	for iter_15_0, iter_15_1 in pairs(arg_15_1) do
		if LOOT.IsCategoryNew(arg_15_0, iter_15_1) then
			var_15_0 = true

			break
		end
	end

	return var_15_0
end

local function var_0_18(arg_16_0, arg_16_1)
	if not Dvar.IBEGCHEFE("scr_allow_custom_loadouts") then
		local var_16_0
		local var_16_1 = 2
		local var_16_2 = 3
	end

	if var_0_2 then
		local var_16_3 = var_0_17(arg_16_1, var_0_0.NonLoadoutTypes)
		local var_16_4 = #WEAPON.GetNewWeaponIDs(arg_16_1, {
			getBaseWeapon = false
		}) > 0

		arg_16_0.isWeaponTabNew = var_16_3 or var_16_4

		arg_16_0.Tabs:GetTabAtIndex(var_0_2):SetBreadcrumb(arg_16_0.isWeaponTabNew)
	end

	arg_16_0.isOperatorTypeNew = var_0_17(arg_16_1, var_0_0.OperatorTypes)

	arg_16_0.Tabs:GetTabAtIndex(var_0_3):SetBreadcrumb(arg_16_0.isOperatorTypeNew)

	arg_16_0.isBarracksNew = var_0_17(arg_16_1, var_0_0.BarracksTypes)

	arg_16_0.Tabs:GetTabAtIndex(var_0_4):SetBreadcrumb(arg_16_0.isBarracksNew)
end

local function var_0_19(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1.controller or Engine.IJEBHJIJF()

	PRIVATE_MATCH.SetupPrivateMatchTabs(arg_17_0, var_17_0, {
		firstTabName = "LUA_MENU/PLAY",
		firstTabWidget = "PrivateMatchLobbyPlayMenu",
		leaveMenuFunction = function(arg_18_0, arg_18_1)
			if Lobby.DFFFFJHCEH() and Lobby.BCIDJGIGEA() then
				Lobby.DEHBAFGJCC()

				return
			end

			if Lobby.EBFDFHJDJG(var_17_0) then
				Lobby.BEDBHJJHDC(var_17_0)

				return
			end

			local var_18_0

			if Lobby.IsOurPrivatePartyHostInLobby() then
				var_18_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVEPARTYANDLOBBY")
			else
				var_18_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVELOBBY")
			end

			LUI.FlowManager.RequestPopupMenu(arg_17_0, "PopupYesNo", true, arg_18_1.controller, false, {
				yesAction = var_0_11(arg_17_0, var_17_0),
				message = var_18_0,
				actionSFX = SOUND_SETS.popups.privateSelect,
				popupSFX = SOUND_SETS.popups.privatePopup
			})

			return true
		end,
		callbackFunc = function(arg_19_0)
			local var_19_0 = arg_19_0 == 0

			if var_19_0 and arg_17_0._isCoreMultiplayer then
				arg_17_0.HelperBar:AddButtonHelperTextToElement(arg_17_0, {
					kbm_only = true,
					priority = 3,
					side = "left",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("MPUI/CHANGE_TEAM")
				})
			else
				arg_17_0.HelperBar:RemoveButtonHelperTextFromElement(arg_17_0, "button_alt1", "left")
			end

			Lobby.SetupReopenAAR(arg_17_0, var_17_0, var_19_0)
		end
	})

	if Dvar.IBEGCHEFE("NQTLNRKLNQ") then
		var_0_18(arg_17_0, var_17_0)
	end

	local var_17_1 = LUI.FlowManager.GetScopedData(arg_17_0)

	PRIVATE_MATCH.SetDefaultMatchRules({
		isTournament = var_17_1.isTournament
	})

	if CONDITIONS.IsThirdGameMode() then
		CP.ClearWaveLoadout(var_17_0)
		CP.ClearAllPickupMunitions(var_17_0)
	end
end

local function var_0_20(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1.controller or Engine.IJEBHJIJF()

	var_0_12(arg_20_0, var_20_0)
end

local function var_0_21(arg_21_0, arg_21_1, arg_21_2)
	assert(arg_21_0.MenuTitle)
	assert(arg_21_0.Tabs)
	assert(arg_21_0.HelperBar)

	arg_21_0._isCoreMultiplayer = CONDITIONS.IsCoreMultiplayer()

	arg_21_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_GAME_CAPS"), Dvar.IBEGCHEFE("MQNNLTKNTS"))
	var_0_13(arg_21_0, arg_21_1)
	PRIVATE_MATCH.SetupPrivateMatchLobbyScene(arg_21_0, arg_21_1)
	var_0_15(arg_21_0, arg_21_1)
	var_0_14(arg_21_0, arg_21_1)
	arg_21_0:addEventHandler("menu_create", var_0_19)
	arg_21_0:addEventHandler("private_ds_to_lobby_host", var_0_20)

	if arg_21_2.isTournament then
		local var_21_0 = LUI.FlowManager.GetScopedData(arg_21_0)

		if not var_21_0.matchmakerSettings then
			var_21_0.matchmakerSettings = LUI.DeepCopy(Lobby.DEFAULT_PRIVATE_TOURNAMENT)
		end
	end

	assert(arg_21_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_21_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_21_0, arg_21_1)
	Lobby.PreloadViewHandsForLocalPlayer(arg_21_1)

	if Dvar.IBEGCHEFE("MNMTKTRPPP") then
		Lobby.LeaveCustomGameLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_21_0:GetCurrentMenu())
	end

	arg_21_0:addEventHandler("OverwolfDetectedEvent", function(arg_22_0, arg_22_1)
		Lobby.LeaveCustomGameLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_21_0:GetCurrentMenu())
	end)
end

function var_0_1(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIHorizontalNavigator.new()

	var_23_0.id = "PrivateMatchLobby"

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)
	var_0_16(var_23_0, var_23_1, arg_23_1)

	var_23_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_23_1
	})
	var_23_0.HelperBar.id = "HelperBar"

	var_23_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_23_0.HelperBar:setPriority(10)
	var_23_0:addElement(var_23_0.HelperBar)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_23_1
	})

	var_23_4.id = "TabBacker"

	var_23_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_23_0:addElement(var_23_4)

	var_23_0.TabBacker = var_23_4

	local var_23_5
	local var_23_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_23_1
	})

	var_23_6.id = "MenuTitle"

	var_23_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_GAME_CAPS"), 0)
	var_23_6.Line:SetLeft(0, 0)
	var_23_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_23_0:addElement(var_23_6)

	var_23_0.MenuTitle = var_23_6

	local var_23_7
	local var_23_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_23_1
			})
		end,
		controllerIndex = var_23_1
	}
	local var_23_9 = LUI.TabManager.new(var_23_8)

	var_23_9.id = "Tabs"

	var_23_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_23_0:addElement(var_23_9)

	var_23_0.Tabs = var_23_9

	local var_23_10
	local var_23_11 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_23_1
	})

	var_23_11.id = "PartyWidget"

	var_23_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_23_0:addElement(var_23_11)

	var_23_0.PartyWidget = var_23_11

	local var_23_12
	local var_23_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_23_1
	})

	var_23_13.id = "LobbyMembersFooter"

	var_23_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_23_0:addElement(var_23_13)

	var_23_0.LobbyMembersFooter = var_23_13

	local var_23_14

	if CONDITIONS.IsUserSignedInDemonware(var_23_1) then
		local var_23_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_23_1
		})

		var_23_15.id = "MPPlayerDetails"

		var_23_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_23_0:addElement(var_23_15)

		var_23_0.MPPlayerDetails = var_23_15
	end

	local var_23_16

	if CONDITIONS.IsCpRaidMode(var_23_0) then
		local var_23_17 = MenuBuilder.BuildRegisteredType("CPCheckpointWidget", {
			controllerIndex = var_23_1
		})

		var_23_17.id = "CPCheckpointWidget"

		var_23_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 543, _1080p * 943, _1080p * 826, _1080p * 1026)
		var_23_0:addElement(var_23_17)

		var_23_0.CPCheckpointWidget = var_23_17
	end

	var_0_21(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("PrivateMatchLobby", var_0_1)
LockTable(_M)
