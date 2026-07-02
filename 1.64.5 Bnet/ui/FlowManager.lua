LUI.FlowManager = LUI.Class(LUI.UIElement)
PushAndPopsTable = {}
DisableLetterbox = {}
DisableMousePointer = {}
FenceGroups = {}
SavedMenuStates = {}
AlwaysVisible = {}
PresetStacks = {}
IgnoreFollowHostCallbacks = {}
PartyUIRoot = {
	GAMEMODE_SP_MENUS_START = 4,
	BR_TRIALS = 14,
	BR_MAIN_MENU = 22,
	GAMEMODE_MP_MENUS_START = 7,
	TOURNAMENT_LOADING = 17,
	MP_PRIVATE_TOURNAMENT_LOBBY = 16,
	MP_MAIN_MENU = 8,
	GAMEMODE_CP_MENUS_END = 33,
	TOURNAMENT_MATCHMAKING = 18,
	GAMEMODE_NONE_MENUS_START = 1,
	GAME_BATTLES_MATCH = 15,
	CP_SYSTEM_LINK_LOBBY = 32,
	GAMEMODE_CP_MENUS_START = 27,
	GAMEMODE_WZ_MENUS_START = 34,
	SP_MAIN_MENU = 5,
	MP_SYSTEM_LINK_LOBBY = 12,
	WZ_TOURNAMENT_MATCHMAKING = 36,
	WZ_TOURNAMENT_BRACKET = 37,
	LAST = 43,
	CP_PRIVATE_MATCH = 29,
	WZ_LFP_LOBBY = 39,
	MP_SYSTEM_LINK = 11,
	MP_TRIALS = 13,
	LOADOUT_SELECT_MENU = 20,
	MP_TRIAL_EVENT = 41,
	CP_PUBLIC_MATCH_LOBBY = 30,
	GAMEMODE_NONE_MENUS_END = 3,
	BATTLE_ROYALE_MENU_TUTORIAL = 24,
	GAMEMODE_SP_MENUS_END = 6,
	MP_PUBLIC_MATCH_LOBBY = 10,
	FREE = 0,
	MP_PRIVATE_MATCH = 9,
	BATTLE_ROYALE_MENU_PUBLIC_LOBBY = 23,
	TOURNAMENT_BRACKET = 19,
	GAMEMODE_MP_MENUS_END = 26,
	GAMEMODE_WZ_MENUS_END = 40,
	WZ_PRIVATE_MATCH_LOBBY = 38,
	MAIN_MENU = 2,
	WZ_TOURNAMENT_LOADING = 35,
	BR_TRIAL_EVENT = 42,
	CP_MAIN_MENU = 28,
	CP_SYSTEM_LINK = 31,
	BATTLE_ROYALE_MENU = 21,
	PAYBACK_ONBOARDING_LOBBY = 25
}
BR_MENUS_START = PartyUIRoot.BATTLE_ROYALE_MENU
BR_MENUS_END = PartyUIRoot.PAYBACK_ONBOARDING_LOBBY
LUI.FlowManager.FlowMenus = {
	[PartyUIRoot.MAIN_MENU] = "MainMenu",
	[PartyUIRoot.SP_MAIN_MENU] = "CampaignMenu",
	[PartyUIRoot.MP_MAIN_MENU] = "MPMainMenu",
	[PartyUIRoot.MP_PRIVATE_MATCH] = "PrivateMatchLobby",
	[PartyUIRoot.MP_PUBLIC_MATCH_LOBBY] = "MPPublicLobby",
	[PartyUIRoot.MP_SYSTEM_LINK] = "MPSystemLinkMenu",
	[PartyUIRoot.MP_SYSTEM_LINK_LOBBY] = "MPSystemLinkLobby",
	[PartyUIRoot.MP_TRIALS] = "TrialsMP",
	[PartyUIRoot.BR_TRIALS] = "TrialsBR",
	[PartyUIRoot.GAME_BATTLES_MATCH] = "GameBattlesMatchLobby",
	[PartyUIRoot.MP_PRIVATE_TOURNAMENT_LOBBY] = "PrivateTournamentLobby",
	[PartyUIRoot.TOURNAMENT_LOADING] = "TournamentLoadingScreen",
	[PartyUIRoot.TOURNAMENT_MATCHMAKING] = "TournamentMatchmaking",
	[PartyUIRoot.TOURNAMENT_BRACKET] = "ArenaTournament",
	[PartyUIRoot.LOADOUT_SELECT_MENU] = "<disabled>",
	[PartyUIRoot.BATTLE_ROYALE_MENU] = "BattleRoyale",
	[PartyUIRoot.BR_MAIN_MENU] = "BRMainMenu",
	[PartyUIRoot.BATTLE_ROYALE_MENU_PUBLIC_LOBBY] = "BRPublicLobby",
	[PartyUIRoot.BATTLE_ROYALE_MENU_TUTORIAL] = "LobbyWarzoneTutorial",
	[PartyUIRoot.CP_MAIN_MENU] = "CPMainMenu",
	[PartyUIRoot.CP_PRIVATE_MATCH] = "CPPrivateMatchLobby",
	[PartyUIRoot.CP_PUBLIC_MATCH_LOBBY] = "CPPublicMatchMenu",
	[PartyUIRoot.CP_SYSTEM_LINK] = "CPSystemLinkMenu",
	[PartyUIRoot.CP_SYSTEM_LINK_LOBBY] = "CPSystemLinkLobby",
	[PartyUIRoot.PAYBACK_ONBOARDING_LOBBY] = "PayBackOnBoardingLobby",
	[PartyUIRoot.WZ_TOURNAMENT_LOADING] = "WZTournamentLoadingScreen",
	[PartyUIRoot.WZ_TOURNAMENT_MATCHMAKING] = "WZTournamentMatchmaking",
	[PartyUIRoot.WZ_TOURNAMENT_BRACKET] = "WZArenaTournament",
	[PartyUIRoot.WZ_PRIVATE_MATCH_LOBBY] = "WarzonePrivateMatchLobby",
	[PartyUIRoot.MP_TRIAL_EVENT] = "TrialEventMP",
	[PartyUIRoot.BR_TRIAL_EVENT] = "TrialEventBR"
}
LUI.FlowManager.IgnoreFollowHostMenus = {
	OperatorShowcase = true,
	LoadoutSelect = true,
	Gunsmith = true,
	BundleLockerMenu = true,
	LeaderboardMenu = true,
	SeasonalEventChallengeTabsMenu = true,
	PCAchievementsMenu = true,
	EmblemSelectMenu = true,
	PlayerCardFrameSelect = true,
	OptionsMenuNewLayout = true,
	PlayerCardSelect = true,
	BarracksRecords = true,
	BarracksChallengesDailyContainer = true,
	ProgressionMenu = true,
	VehicleSelect = true,
	AttachmentSelect = true,
	StoreBundlePreview = true,
	SeasonalProgressionMenu = true,
	BRMainMenu = true,
	FieldUpgrades = true,
	WatchSelect = true,
	WeaponLocker = true,
	RadialCustomizationMenu = true,
	WeaponPreview = true,
	WeaponPreviewFilm = true,
	BarracksCustomize = true,
	WeaponSelect = true,
	WZBarracksChallengesSelectionMenu = true,
	MasterChallengesMenu = true,
	PlayerTitleSelect = true,
	OperatorCustomization = true
}

function LUI.FlowManager.RegisterStackPushBehaviour(arg_1_0, arg_1_1)
	assert(arg_1_1)

	PushAndPopsTable[arg_1_0] = PushAndPopsTable[arg_1_0] or {}

	local var_1_0 = PushAndPopsTable[arg_1_0]

	var_1_0.pushFuncs = var_1_0.pushFuncs or {}

	table.insert(var_1_0.pushFuncs, arg_1_1)
end

function LUI.FlowManager.RegisterStackPopBehaviour(arg_2_0, arg_2_1)
	assert(arg_2_1)

	PushAndPopsTable[arg_2_0] = PushAndPopsTable[arg_2_0] or {}

	local var_2_0 = PushAndPopsTable[arg_2_0]

	var_2_0.popFuncs = var_2_0.popFuncs or {}

	table.insert(var_2_0.popFuncs, arg_2_1)
end

function LUI.FlowManager.RegisterFenceGroup(arg_3_0, arg_3_1)
	assert(not FenceGroups[arg_3_0])

	FenceGroups[arg_3_0] = arg_3_1
end

function LUI.FlowManager.DisableLetterboxForMenu(arg_4_0)
	DisableLetterbox[arg_4_0] = true
end

function LUI.FlowManager.AlwaysVisibleForMenu(arg_5_0)
	AlwaysVisible[arg_5_0] = true
end

function LUI.FlowManager.RequestSetStack(arg_6_0, arg_6_1)
	assert(type(arg_6_0) == "string")
	assert(type(arg_6_1) == "table")

	PresetStacks[arg_6_0] = arg_6_1
end

function LUI.FlowManager.DisableMousePointerForMenu(arg_7_0)
	DisableMousePointer[arg_7_0] = true
end

function LUI.FlowManager.GetPerControllerPersistentData(arg_8_0)
	if not LUI.FlowManager._persistentData then
		LUI.FlowManager._persistentData = {}
	end

	if not LUI.FlowManager._persistentData[arg_8_0] then
		LUI.FlowManager._persistentData[arg_8_0] = {}
	end

	return LUI.FlowManager._persistentData[arg_8_0]
end

function LUI.FlowManager.GetScopedData(arg_9_0)
	local var_9_0 = type(arg_9_0)

	assert(var_9_0 == "string" or var_9_0 == "userdata")

	local var_9_1 = Engine.DBFFAEEFGJ()

	assert(var_9_1 and var_9_1.flowManager)

	local var_9_2 = var_9_1.flowManager

	if var_9_0 == "string" then
		return var_9_2:GetScopedDataFromMenuName(arg_9_0)
	end

	if var_9_0 == "userdata" then
		return var_9_2:GetScopedDataFromElement(arg_9_0)
	end
end

function LUI.FlowManager.RequestAddMenu(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	assert(type(arg_10_0) == "string")

	local var_10_0 = {}

	var_10_0.name = "addmenu"
	var_10_0.menu = arg_10_0
	var_10_0.exclusiveController = arg_10_1
	var_10_0.controller = arg_10_2
	var_10_0.replaceTop = arg_10_3
	var_10_0.immediate = arg_10_5
	var_10_0.data = arg_10_4

	local var_10_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_10_1, true, "RequestAddMenu " .. arg_10_0)
	LUI.UIRoot.ProcessEvent(var_10_1, var_10_0)
end

function LUI.FlowManager.RequestSocialPopup(arg_11_0)
	local var_11_0 = Friends.BJDEIGDDCD()
	local var_11_1 = FRIENDS.AreWeHost(var_11_0)
	local var_11_2 = {
		disableQuickAccessShortcuts = false,
		controllerIndex = controllerIndex,
		areWeHost = var_11_1,
		defaultTabFocus = FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS,
		menuTitle = Engine.CBBHFCGDIC("LUA_MENU/SOCIAL_TITLE"),
		inviteTabTitle = Engine.CBBHFCGDIC("LUA_MENU/INVITE_TO_GAME"),
		hasUsedShortcut = arg_11_0
	}

	LUI.FlowManager.RequestPopupMenu(nil, "ManagePartyPopup", true, controllerIndex, false, var_11_2)
end

function LUI.FlowManager.RequestPopupMenu(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5, arg_12_6, arg_12_7, arg_12_8)
	assert(arg_12_1)

	local var_12_0 = {}

	var_12_0.name = "popupmenu"
	var_12_0.menu = arg_12_1

	if (arg_12_1 == "onboardingpopup" or arg_12_1 == "BattlePassOnboardingPopup") and CONDITIONS.IsQABotSkipActive() then
		return
	end

	var_12_0.isModal = arg_12_7
	var_12_0.exclusiveController = arg_12_2
	var_12_0.controller = arg_12_3
	var_12_0.replaceTop = arg_12_4
	var_12_0.data = arg_12_5

	if arg_12_8 ~= nil then
		var_12_0.immediate = arg_12_8
	else
		var_12_0.immediate = true
	end

	local var_12_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_12_1, true, "RequestPopupMenu " .. arg_12_1)
	LUI.UIRoot.ProcessEvent(var_12_1, var_12_0)
end

function LUI.FlowManager.RequestErrorPopup(arg_13_0, arg_13_1)
	if not LUI.FlowManager.IsInStack("generic_error_popup") then
		local var_13_0 = Engine.DBFFAEEFGJ()

		assert(var_13_0 and var_13_0.flowManager)

		local var_13_1 = var_13_0.flowManager._controllerIndex or Engine.IJEBHJIJF()
		local var_13_2 = {
			controllerIndex = var_13_1,
			title = Engine.CBBHFCGDIC(arg_13_0),
			message = Engine.CBBHFCGDIC(arg_13_1)
		}

		LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", true, var_13_1, false, var_13_2)
	end
end

function LUI.FlowManager.RequestDevErrorPopup(arg_14_0, arg_14_1)
	if CONDITIONS.IsDevelopmentBuild() and not LUI.FlowManager.IsInStack("generic_error_popup") then
		local var_14_0 = Engine.DBFFAEEFGJ()

		assert(var_14_0 and var_14_0.flowManager)

		local var_14_1 = var_14_0.flowManager._controllerIndex or Engine.IJEBHJIJF()
		local var_14_2 = {
			controllerIndex = var_14_1,
			title = arg_14_0,
			message = arg_14_1
		}

		LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", true, var_14_1, false, var_14_2)
	end
end

function LUI.FlowManager.RequestLeaveMenu(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {}

	var_15_0.name = "leavemenu"
	var_15_0.element = arg_15_0
	var_15_0.immediate = arg_15_1
	var_15_0.blockSound = arg_15_2

	local var_15_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_15_1, true, "RequestLeaveMenu")
	LUI.UIRoot.ProcessEvent(var_15_1, var_15_0)
end

function LUI.FlowManager.RequestLeaveMenuByName(arg_16_0, arg_16_1, arg_16_2)
	assert(arg_16_0)

	local var_16_0 = {}

	var_16_0.name = "leavemenu"
	var_16_0.menu = arg_16_0
	var_16_0.immediate = arg_16_1
	var_16_0.blockSound = arg_16_2

	LUI.UIRoot.BlockButtonInput(Engine.DBFFAEEFGJ(), true, "RequestLeaveMenuByName " .. arg_16_0)
	Engine.DBFFAEEFGJ():processEvent(var_16_0)
end

function LUI.FlowManager.RequestLeaveMenuByNameWithController(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	assert(arg_17_0)

	local var_17_0 = {}

	var_17_0.name = "leavemenu"
	var_17_0.menu = arg_17_0
	var_17_0.immediate = arg_17_2
	var_17_0.blockSound = arg_17_3
	var_17_0.managerControllerIndex = arg_17_1

	LUI.UIRoot.BlockButtonInput(Engine.DBFFAEEFGJ(), true, "RequestLeaveMenuByName " .. arg_17_0)
	Engine.DBFFAEEFGJ():processEvent(var_17_0)
end

function LUI.FlowManager.RequestRestoreMenu(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {}

	var_18_0.name = "restoreMenu"
	var_18_0.menu = arg_18_0
	var_18_0.immediate = true
	var_18_0.exclusiveController = arg_18_1
	var_18_0.controller = arg_18_2

	local var_18_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_18_1, true, "RequestRestoreMenu")
	LUI.UIRoot.ProcessEvent(var_18_1, var_18_0)
end

function LUI.FlowManager.RequestCloseAllMenus(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = {}

	var_19_0.name = "closeallmenus"

	local var_19_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.ProcessEvent(var_19_1, var_19_0)

	if arg_19_0 then
		METRICS.RecordInGameDismissMenuUsage(arg_19_2, arg_19_0, arg_19_1)
	end
end

function LUI.FlowManager.RequestResumeMovement(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = {}

	var_20_0.name = "resumemovement"

	local var_20_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.ProcessEvent(var_20_1, var_20_0)
end

function LUI.FlowManager.IsInStack(arg_21_0)
	local var_21_0 = Engine.DBFFAEEFGJ()

	assert(var_21_0 and var_21_0.flowManager)

	return var_21_0.flowManager:StackContains(arg_21_0)
end

function LUI.FlowManager.IsAnyInStack(arg_22_0)
	local var_22_0 = Engine.DBFFAEEFGJ()

	assert(var_22_0 and var_22_0.flowManager)

	return var_22_0.flowManager:StackContainsAny(arg_22_0)
end

local function var_0_0(arg_23_0)
	if SavedMenuStates[arg_23_0] == nil then
		SavedMenuStates[arg_23_0] = {}
	end

	return SavedMenuStates[arg_23_0]
end

function LUI.FlowManager.ClearSavedMenuStatesByControllerIndex(arg_24_0, arg_24_1)
	local var_24_0 = var_0_0(arg_24_0)

	if arg_24_1 then
		var_24_0[arg_24_1] = nil
	end
end

function LUI.FlowManager.IsTopMenuModal()
	local var_25_0 = Engine.DBFFAEEFGJ()

	assert(var_25_0 and var_25_0.flowManager)

	local var_25_1 = var_25_0.flowManager.menuInfoStack
	local var_25_2 = var_25_1[#var_25_1]

	return var_25_2 and var_25_2.isModal
end

function LUI.FlowManager.IsMenuOnTop(arg_26_0)
	local var_26_0 = Engine.DBFFAEEFGJ()

	assert(var_26_0 and var_26_0.flowManager)

	local var_26_1 = var_26_0.flowManager:GetStackTop()

	return var_26_1 and var_26_1.name == arg_26_0
end

function LUI.FlowManager.GetCurrentMenu(arg_27_0)
	local var_27_0 = Engine.DBFFAEEFGJ()

	assert(var_27_0 and var_27_0.flowManager)

	local var_27_1 = arg_27_0
	local var_27_2 = var_27_1:getParent()

	while var_27_2 do
		if var_27_2 == var_27_0.flowManager then
			return var_27_1
		end

		var_27_1 = var_27_2
		var_27_2 = var_27_2:getParent()
	end

	assert("Error getting current menu. Most likely, the element has not been added to a menu yet.")
end

function LUI.FlowManager.GetVisibleMenu()
	local var_28_0 = Engine.DBFFAEEFGJ()

	assert(var_28_0)

	local var_28_1 = var_28_0.flowManager

	if var_28_1 and var_28_1.menuInfoStack then
		local var_28_2 = var_28_1.menuInfoStack[#var_28_1.menuInfoStack]

		if var_28_2 and var_28_2.menu then
			return var_28_2.menu
		end
	end
end

function LUI.FlowManager.GetMenuNameAtIndex(arg_29_0)
	local var_29_0 = Engine.DBFFAEEFGJ()

	assert(var_29_0)

	local var_29_1 = var_29_0.flowManager
	local var_29_2 = var_29_1.menuInfoStack

	if arg_29_0 < 0 then
		arg_29_0 = #var_29_2 + arg_29_0
	end

	assert(var_29_1.menuInfoStack[arg_29_0])

	return var_29_1.menuInfoStack[arg_29_0].name
end

function LUI.FlowManager.GetAllMenuNames()
	local var_30_0 = Engine.DBFFAEEFGJ()

	assert(var_30_0)

	local var_30_1 = var_30_0.flowManager
	local var_30_2

	if var_30_1 and var_30_1.menuInfoStack then
		for iter_30_0 = #var_30_1.menuInfoStack, 1, -1 do
			local var_30_3 = var_30_1.menuInfoStack[iter_30_0].name

			if var_30_3 and var_30_3 ~= "" then
				var_30_2 = iter_30_0 == #var_30_1.menuInfoStack and var_30_3 or var_30_2 .. ";" .. var_30_3
			end
		end
	end

	return var_30_2
end

function LUI.FlowManager.GetMenuByName(arg_31_0)
	local var_31_0 = Engine.DBFFAEEFGJ()

	assert(var_31_0)

	local var_31_1 = var_31_0.flowManager

	if var_31_1 and var_31_1.menuInfoStack then
		for iter_31_0 = #var_31_1.menuInfoStack, 1, -1 do
			local var_31_2 = var_31_1.menuInfoStack[iter_31_0]

			if arg_31_0 == var_31_2.name then
				return var_31_2
			end
		end
	end
end

function SaveMenuStack(arg_32_0)
	assert(arg_32_0)
	assert(arg_32_0.flowManager)

	local var_32_0 = {}

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.flowManager.menuInfoStack) do
		table.insert(var_32_0, CreateMenuInfoSaveData(iter_32_1))
	end

	return (mobdebug.dump(var_32_0, {
		sparse = false
	}))
end

function RestoreMenuStack(arg_33_0, arg_33_1)
	assert(arg_33_0)
	assert(arg_33_0.flowManager)
	assert(arg_33_1)

	local var_33_0 = arg_33_0.flowManager

	var_33_0:closeAllMenus()

	local var_33_1, var_33_2 = loadstring(arg_33_1)

	if var_33_1 then
		local var_33_3, var_33_4 = pcall(var_33_1)

		for iter_33_0, iter_33_1 in ipairs(var_33_4) do
			local var_33_5 = iter_33_1.name

			assert(var_33_5)

			if FenceGroups[var_33_5] then
				iter_33_1.fenceGroup = LUI.FenceGroup.new(FenceGroups[var_33_5], iter_33_1.controller, iter_33_1.buildData)
			end

			iter_33_1.scopedData = MakeScopedDataForMenuInfo(iter_33_1)

			var_33_0:PushMenuInfo(iter_33_1)
		end
	end

	arg_33_0:TryAddMouseCursor()
end

function IsMenuInStack(arg_34_0, arg_34_1)
	assert(arg_34_0)

	local var_34_0 = arg_34_0.flowManager

	if not var_34_0 then
		return false
	end

	return var_34_0:StackContains(arg_34_1)
end

function IsMenuOpenAndVisible(arg_35_0, arg_35_1)
	assert(arg_35_0)

	local var_35_0 = arg_35_0.flowManager

	if not var_35_0 then
		return false
	end

	if var_35_0.menuInfoStack then
		for iter_35_0, iter_35_1 in ipairs(var_35_0.menuInfoStack) do
			if iter_35_1.name == arg_35_1 and iter_35_1.menu ~= nil then
				return true
			end
		end
	end

	return false
end

function AnyActiveMenusInStack(arg_36_0)
	assert(arg_36_0)

	local var_36_0 = arg_36_0.flowManager

	if not var_36_0 then
		return false
	end

	if var_36_0.menuInfoStack then
		for iter_36_0, iter_36_1 in ipairs(var_36_0.menuInfoStack) do
			if iter_36_1.menu then
				return true
			end
		end
	end

	return false
end

function GetVisibleMenu(arg_37_0)
	assert(arg_37_0)

	local var_37_0 = arg_37_0.flowManager

	if not var_37_0 then
		return ""
	end

	if var_37_0.menuInfoStack then
		local var_37_1 = var_37_0.menuInfoStack[#var_37_0.menuInfoStack]

		if var_37_1 and var_37_1.menu then
			if var_37_1.menu.id then
				return var_37_1.menu.id
			end

			if var_37_1.menu.name then
				return var_37_1.menu.name
			end
		end
	end

	return ""
end

function GetAllMenuNames()
	local var_38_0 = Engine.DBFFAEEFGJ()

	assert(var_38_0)

	local var_38_1 = var_38_0.flowManager
	local var_38_2

	if var_38_1 and var_38_1.menuInfoStack then
		for iter_38_0 = #var_38_1.menuInfoStack, 1, -1 do
			local var_38_3 = var_38_1.menuInfoStack[iter_38_0].name

			if var_38_3 and var_38_3 ~= "" then
				var_38_2 = iter_38_0 == #var_38_1.menuInfoStack and var_38_3 or var_38_2 .. ";" .. var_38_3
			end
		end
	end

	return var_38_2
end

function GetLuiStreamerInfo(arg_39_0, arg_39_1)
	if arg_39_0 then
		local var_39_0 = arg_39_0:getFirstChild()

		while var_39_0 do
			local var_39_1 = var_39_0:getNextSibling()

			if var_39_0.isStreamer then
				arg_39_1.value = (var_39_0.id and #var_39_0.id > 0 and var_39_0.id or "") .. " " .. arg_39_1.value
			end

			GetLuiStreamerInfo(var_39_0, arg_39_1, ID)

			var_39_0 = var_39_1
		end
	end
end

function GetLuiImageStreamersInfo()
	local var_40_0 = Engine.DBFFAEEFGJ()

	assert(var_40_0)

	local var_40_1 = {
		value = ""
	}
	local var_40_2 = var_40_0.flowManager

	if var_40_2 and var_40_2.menuInfoStack then
		for iter_40_0 = #var_40_2.menuInfoStack, 1, -1 do
			local var_40_3 = var_40_2.menuInfoStack[iter_40_0]

			GetLuiStreamerInfo(var_40_3.menu, var_40_1)

			var_40_1.value = ";" .. var_40_3.name .. ": " .. var_40_1.value .. ";"
		end
	end

	return var_40_1.value
end

function PrintLuiStreamedImageInfo(arg_41_0, arg_41_1)
	if arg_41_0 then
		local var_41_0 = arg_41_0:getFirstChild()

		while var_41_0 do
			local var_41_1 = var_41_0:getNextSibling()

			if var_41_0.isStreamer then
				local var_41_2 = var_41_0.id and #var_41_0.id > 0 and var_41_0.id or ""

				if arg_41_1 == nil or arg_41_1 and var_41_2 == arg_41_1 then
					var_41_0:PrintStreamedImage()
				end
			end

			PrintLuiStreamedImageInfo(var_41_0, arg_41_1)

			var_41_0 = var_41_1
		end
	end
end

function GetLuiStreamedImageList(arg_42_0)
	local var_42_0 = Engine.DBFFAEEFGJ()

	assert(var_42_0)

	local var_42_1 = var_42_0:getFirstChild()

	while var_42_1 do
		var_42_1 = var_42_1:getNextSibling(), PrintLuiStreamedImageInfo(var_42_1, arg_42_0)
	end
end

function GetAttachmentsReference(arg_43_0)
	if CONDITIONS.InGame() then
		local var_43_0 = ""
		local var_43_1 = Game.EBGCIIBJHA(arg_43_0, true)

		if var_43_1 and #var_43_1 > 0 then
			for iter_43_0 = 1, #var_43_1 do
				if var_43_1[iter_43_0].ref then
					local var_43_2 = var_43_1[iter_43_0].ref
					local var_43_3 = var_43_1[iter_43_0].variantID

					if var_43_3 and var_43_3 > 0 then
						var_43_2 = var_43_2 .. "|" .. var_43_3
					end

					var_43_0 = var_43_0 ~= "" and var_43_0 .. ";" .. var_43_2 or var_43_2
				end
			end

			return var_43_0
		end
	end

	return ""
end

function GetFrontsceneWeaponModelName(arg_44_0)
	if Engine.DDJFBBJAIG() then
		local var_44_0 = arg_44_0.flowManager

		if var_44_0 and var_44_0.menuInfoStack then
			local var_44_1 = var_44_0.menuInfoStack[#var_44_0.menuInfoStack]

			if var_44_1 and var_44_1.menu and var_44_1.menu.id == "AttachmentSelect" then
				local var_44_2 = LUI.FlowManager.GetScopedData(var_44_1.menu)

				if var_44_2.loadoutIndex then
					local var_44_3 = ""
					local var_44_4 = PlayerData.BFFBGAJGD(Engine.IJEBHJIJF(), LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_44_2.loadoutIndex].weaponSetups[var_44_2.weaponSlot]
					local var_44_5 = WEAPON.GenerateWeaponTable(var_44_4)

					return (WEAPON.GetWeaponModelName(var_44_4.weapon:get(), var_44_5, {
						includeStickers = true,
						includeCamos = true,
						includeAttachments = true
					}))
				end
			end
		end
	end

	return ""
end

function IsTopSignInMenu(arg_45_0)
	assert(arg_45_0)

	if not CONDITIONS.IsSplitScreenEnabled() then
		return false
	end

	local var_45_0 = arg_45_0.flowManager

	if not var_45_0 then
		return false
	end

	local var_45_1 = false

	if not LUI.UIRoot.IsButtonInputBlocked(arg_45_0) and var_45_0.menuInfoStack then
		local var_45_2 = var_45_0.menuInfoStack[#var_45_0.menuInfoStack]

		if var_45_2 and var_45_2.menu and var_45_2.menu.isSignInMenu then
			local var_45_3 = LUI.FlowManager.GetScopedData(var_45_2.menu)

			if var_45_3 and var_45_3.focusedPage and var_45_3.focusedPage > 2 then
				-- block empty
			else
				var_45_1 = true
			end
		end
	end

	return var_45_1
end

function CanSignoutSplitscreenPlayer(arg_46_0)
	assert(arg_46_0)

	local var_46_0 = arg_46_0.flowManager
	local var_46_1 = false

	if not LUI.UIRoot.IsButtonInputBlocked(arg_46_0) and var_46_0.menuInfoStack then
		local var_46_2 = var_46_0.menuInfoStack[#var_46_0.menuInfoStack]

		if var_46_2 and var_46_2.menu and var_46_2.menu.signoutSplitscreen ~= false then
			var_46_1 = true
		end
	end

	return var_46_1
end

function IsTopLocalSignInMenu(arg_47_0)
	return false
end

function LUI.FlowManager.closeAllMenusHandler(arg_48_0, arg_48_1)
	arg_48_0:closeAllMenus()
end

function LUI.FlowManager.restoreMenuHandler(arg_49_0, arg_49_1)
	arg_49_0:restoreMenu(arg_49_1)
	LUI.UIRoot.BlockButtonInput(arg_49_0.root, false, "RestoreMenuHandler")
end

function LUI.FlowManager.addMenuHandler(arg_50_0, arg_50_1)
	arg_50_0:addMenu(arg_50_1)
	LUI.UIRoot.BlockButtonInput(arg_50_0.root, false, "AddMenuHandler")
end

function LUI.FlowManager.popupMenuHandler(arg_51_0, arg_51_1)
	arg_51_1.isPopup = true

	arg_51_0:addMenuHandler(arg_51_1)
end

function LUI.FlowManager.leaveMenuHandler(arg_52_0, arg_52_1)
	arg_52_0:leaveMenu(arg_52_1)
	LUI.UIRoot.BlockButtonInput(arg_52_0.root, false, "leaveMenu")
end

function LUI.FlowManager.resumeMovementHandler(arg_53_0, arg_53_1)
	arg_53_0:resumeMovement()
end

function LUI.FlowManager.closeAllMenus(arg_54_0)
	for iter_54_0 = #arg_54_0.menuInfoStack, 1, -1 do
		local var_54_0 = arg_54_0.menuInfoStack[iter_54_0]

		if not AlwaysVisible[var_54_0.name] then
			arg_54_0:CloseMenuInfo(var_54_0, true, false)
			arg_54_0:RemoveMenuInfo(var_54_0)
		end
	end
end

function LUI.FlowManager.restoreMenu(arg_55_0, arg_55_1)
	local var_55_0

	if arg_55_1.menuId ~= nil then
		arg_55_1.menu = LUI.FlowManager.FlowMenus[arg_55_1.menuId]
	end

	if not arg_55_0.IsInStack(arg_55_1.menu) then
		arg_55_0:addMenu(arg_55_1)

		return
	end

	local var_55_1 = arg_55_0:GetStackTop()

	if var_55_1 and var_55_1.name == arg_55_1.menu then
		return
	end

	local var_55_2

	for iter_55_0 = #arg_55_0.menuInfoStack, 1, -1 do
		local var_55_3 = arg_55_0.menuInfoStack[iter_55_0]

		if not var_55_3.isModal then
			if var_55_3.name ~= arg_55_1.menu then
				arg_55_0:CloseMenuInfo(var_55_3, false, false)
				arg_55_0:RemoveMenuInfo(var_55_3)
			else
				break
			end
		end
	end

	arg_55_0:RefreshStack()
end

function LUI.FlowManager.addMenu(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_1.menu
	local var_56_1 = arg_56_1.data and arg_56_1.data.bypassDuplicateMenuCheck

	if arg_56_0:StackContains(var_56_0) and not var_56_1 then
		return
	end

	local var_56_2 = arg_56_0.menuInfoStack[#arg_56_0.menuInfoStack]

	if var_56_2 and arg_56_1.replaceTop then
		arg_56_0:CloseMenuInfo(var_56_2, false, false)
		arg_56_0:RemoveMenuInfo(var_56_2)
	end

	local var_56_3 = arg_56_0:CreateMenuInfo(var_56_0, arg_56_1.data, arg_56_1.exclusiveController, arg_56_1.controller)

	var_56_3.isPopup = arg_56_1.isPopup or arg_56_1.isModal
	var_56_3.isModal = arg_56_1.isModal

	arg_56_0:PushMenuInfo(var_56_3)
	arg_56_0:RefreshStack()
end

function LUI.FlowManager.leaveMenu(arg_57_0, arg_57_1)
	local var_57_0

	if arg_57_1.menuId ~= nil then
		arg_57_1.menu = LUI.FlowManager.FlowMenus[arg_57_1.menuId]
	end

	if arg_57_1.element or arg_57_1.menu then
		for iter_57_0 = #arg_57_0.menuInfoStack, 1, -1 do
			local var_57_1 = arg_57_0.menuInfoStack[iter_57_0]
			local var_57_2 = arg_57_1.element and arg_57_1.element:isDescendentOf(var_57_1.menu)
			local var_57_3 = arg_57_1.menu and var_57_1.name == arg_57_1.menu

			if var_57_2 or var_57_3 then
				var_57_0 = var_57_1

				break
			end
		end
	else
		var_57_0 = arg_57_0:GetStackTop()
	end

	if not var_57_0 then
		return
	end

	arg_57_0:CloseMenuInfo(var_57_0, false, false)
	arg_57_0:RemoveMenuInfo(var_57_0)

	if not var_57_0.isModal and not arg_57_1.blockSound then
		Engine.BJDBIAGIDA(CoD.SFX.SelectBack)
	end

	arg_57_0:RefreshStack()
end

function LUI.FlowManager.resumeMovement(arg_58_0)
	Engine.BGHJAGAJAB()
end

function LUI.FlowManager.swapPartyUIRoot(arg_59_0, arg_59_1, arg_59_2)
	for iter_59_0, iter_59_1 in ipairs(arg_59_0.menuInfoStack) do
		for iter_59_2 = PartyUIRoot.GAMEMODE_MP_MENUS_START, PartyUIRoot.LAST do
			if LUI.FlowManager.FlowMenus[iter_59_2] == iter_59_1.name then
				arg_59_0:InsertMenuInfo(iter_59_0, arg_59_1)

				if iter_59_1 == arg_59_0:GetTopMostOpenMenuInfo() then
					table.insert(arg_59_1.scopedData, "activeTabIndex")

					local var_59_0 = iter_59_1.menu.MPTabsMenu.Tabs:GetCurrentTabIndex()

					arg_59_1.scopedData.activeTabIndex = var_59_0

					arg_59_0:OpenMenuInfo(arg_59_1)
				end

				arg_59_0:CloseMenuInfo(iter_59_1)
				arg_59_0:RemoveMenuInfo(iter_59_1)

				return
			end
		end
	end
end

function LUI.FlowManager.GetScopedDataFromElement(arg_60_0, arg_60_1)
	if arg_60_1._scoped then
		return arg_60_1._scoped
	end

	local var_60_0 = arg_60_1:getParent()

	if not var_60_0 then
		DebugPrint("Could not find scoped data for supplied LUI element, attempting to get scoped data from visible menu.")

		local var_60_1 = LUI.FlowManager.GetVisibleMenu()

		if var_60_1 then
			return arg_60_0:GetScopedDataFromElement(var_60_1)
		else
			assert(false, "Could not find scoped data for supplied LUI element and there is no visible menu.")
		end
	else
		return arg_60_0:GetScopedDataFromElement(var_60_0)
	end
end

function LUI.FlowManager.GetScopedDataFromMenuName(arg_61_0, arg_61_1)
	for iter_61_0 = #arg_61_0.menuInfoStack, 1, -1 do
		local var_61_0 = arg_61_0.menuInfoStack[iter_61_0]

		if var_61_0.name == arg_61_1 then
			return var_61_0.scopedData
		end
	end

	assert(false, "Could not find scoped data for menu named " .. arg_61_1 .. ".")
end

function CreateMenuInfoSaveData(arg_62_0)
	local var_62_0 = {}

	for iter_62_0, iter_62_1 in pairs(arg_62_0) do
		if iter_62_0 == "fenceGroup" or iter_62_0 == "scopedData" or iter_62_0 == "menu" then
			-- block empty
		else
			if iter_62_0 == "buildData" then
				for iter_62_2, iter_62_3 in pairs(iter_62_1) do
					if type(iter_62_3) == "table" and iter_62_3.__serializable == false then
						DebugPrint("WARNING: Not saving buildData field \"" .. tostring(iter_62_2) .. "\" for LUI Reload of menu \"" .. tostring(arg_62_0.name) .. "\"")

						iter_62_1[iter_62_2] = nil
					end
				end
			end

			var_62_0[iter_62_0] = iter_62_1
		end
	end

	return var_62_0
end

function MakeScopedDataForMenuInfo(arg_63_0)
	local var_63_0 = {
		menuName = arg_63_0.name
	}

	for iter_63_0, iter_63_1 in pairs(arg_63_0.buildData) do
		var_63_0[iter_63_0] = iter_63_1
	end

	if arg_63_0.controller then
		var_63_0.controllerIndex = arg_63_0.controller
		var_63_0.exclusiveController = arg_63_0.controller
		var_63_0.exclusiveControllerIndex = arg_63_0.controller
		var_63_0.isControllerExclusive = arg_63_0.isControllerExclusive
	end

	return var_63_0
end

function LUI.FlowManager.CreateMenuInfo(arg_64_0, arg_64_1, arg_64_2, arg_64_3, arg_64_4)
	local var_64_0 = arg_64_0
	local var_64_1 = {
		name = arg_64_1,
		buildData = arg_64_2 or {},
		controller = arg_64_4
	}

	if not Engine.DDJFBBJAIG() then
		var_64_1.controller = arg_64_0:getRootController()
	elseif not arg_64_4 then
		DebugPrint("Warning: opening menu \"" .. arg_64_1 .. "\" for unspecified controllerIndex, defaulting to 0")

		var_64_1.controller = 0
	end

	var_64_1.isControllerExclusive = arg_64_4 ~= nil and arg_64_3 == true
	var_64_1.scopedData = MakeScopedDataForMenuInfo(var_64_1)

	if FenceGroups[arg_64_1] then
		var_64_1.fenceGroup = LUI.FenceGroup.new(FenceGroups[arg_64_1], var_64_1.controller, var_64_1.buildData)

		function var_64_1.fenceGroup.OnPass(arg_65_0)
			return
		end

		function var_64_1.fenceGroup.OnBlock(arg_66_0)
			return
		end

		function var_64_1.fenceGroup.OnFail(arg_67_0)
			DebugPrint("Fencegroup failed for " .. arg_64_1)

			if var_64_0:StackContains(arg_64_1) then
				for iter_67_0 = #var_64_0.menuInfoStack, 1, -1 do
					local var_67_0 = var_64_0.menuInfoStack[iter_67_0]

					var_64_0:CloseMenuInfo(var_67_0, true, false)
					var_64_0:RemoveMenuInfo(var_67_0)

					if var_67_0.name == arg_64_1 then
						break
					end
				end
			else
				DebugPrint("WARNING: Attempted to fail fencegroup for " .. arg_64_1 .. " but " .. arg_64_1 .. " is not in the stack.")
			end
		end
	end

	return var_64_1
end

function LUI.FlowManager.OpenMenuInfo(arg_68_0, arg_68_1)
	if arg_68_1.opening then
		return
	end

	local var_68_0 = Engine.CFCAICIAJC()

	if Engine.DDJFBBJAIG() then
		PlayerData.DHIICCFFFD()
	end

	assert(not arg_68_1.menu)

	LUI.ActiveScoped = arg_68_1.scopedData
	arg_68_1.opening = true
	arg_68_1.menu = MenuBuilder.buildMenu(arg_68_1.name, arg_68_1.scopedData)
	arg_68_1.opening = false

	for iter_68_0, iter_68_1 in ipairs(arg_68_0.menuInfoStack) do
		if iter_68_1.menu then
			iter_68_1.menu:setPriority(iter_68_0)
		end
	end

	arg_68_0:addElement(arg_68_1.menu)
	arg_68_1.menu:processEvent({
		dispatchChildren = true,
		name = "menu_create",
		controller = arg_68_1.controller
	})
	assert(arg_68_1.menu)

	if not Engine.CGABICJHAI() and not Engine.BFIHBCBIHJ() and not DisableLetterbox[arg_68_1.name] then
		arg_68_1.menu:setupLetterboxElement()
	end

	LUI.ActiveScoped = nil

	local var_68_1 = Engine.CFCAICIAJC()

	if not Engine.CEJJDJJHIJ(0, "lua_menu_info", {
		completed_menu = true,
		menu_name = arg_68_1.name,
		memory_delta_bytes = var_68_1 - var_68_0,
		init_free_bytes = var_68_0,
		post_free_bytes = var_68_1,
		in_game = Engine.DDJFBBJAIG()
	}) then
		DebugPrint("Failed to write to blackbox")
	end

	arg_68_0:LogMenuChangeTo(arg_68_1.controller, arg_68_1.name)
end

function LUI.FlowManager.CloseMenuInfo(arg_69_0, arg_69_1, arg_69_2, arg_69_3)
	local var_69_0 = arg_69_0._controllerIndex or Engine.IJEBHJIJF()
	local var_69_1 = var_0_0(var_69_0)

	if not arg_69_3 then
		var_69_1[arg_69_1.name] = nil
	end

	if arg_69_1.menu then
		if arg_69_3 and not var_69_1[arg_69_1.name] then
			var_69_1[arg_69_1.name] = arg_69_1.menu:saveState()
		end

		if not arg_69_2 then
			arg_69_1.menu:processEvent({
				name = "lose_focus"
			})
			arg_69_1.menu:processEvent({
				dispatchChildren = true,
				name = "menu_close",
				controller = arg_69_1.controller
			})
		else
			arg_69_1.menu:processEvent({
				dispatchChildren = true,
				name = "menu_close_all",
				controller = arg_69_1.controller
			})
		end

		arg_69_1.menu:closeTree()

		arg_69_1.menu = nil
	end
end

function LUI.FlowManager.GetStackVersion(arg_70_0)
	assert(arg_70_0.stackVersion)

	return arg_70_0.stackVersion
end

function LUI.FlowManager.InsertMenuInfo(arg_71_0, arg_71_1, arg_71_2)
	assert(arg_71_2)

	arg_71_0.stackVersion = arg_71_0.stackVersion + 1

	table.insert(arg_71_0.menuInfoStack, arg_71_1, arg_71_2)

	if PushAndPopsTable[arg_71_2.name] and PushAndPopsTable[arg_71_2.name].pushFuncs and #PushAndPopsTable[arg_71_2.name].pushFuncs > 0 then
		for iter_71_0, iter_71_1 in ipairs(PushAndPopsTable[arg_71_2.name].pushFuncs) do
			iter_71_1()
		end
	end

	Engine.DHFEGHHHFH(true)

	if #arg_71_0.menuInfoStack == 1 then
		arg_71_0.root:processEvent({
			name = "non_empty_menu_stack",
			controllerIndex = arg_71_0._controllerIndex
		})
	end

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
		arg_71_0:PrintStack()
	end
end

function LUI.FlowManager.RemoveMenuInfo(arg_72_0, arg_72_1)
	assert(arg_72_1)

	local var_72_0
	local var_72_1 = #arg_72_0.menuInfoStack

	while var_72_1 >= 1 and arg_72_0.menuInfoStack[var_72_1] ~= arg_72_1 do
		var_72_1 = var_72_1 - 1
	end

	if var_72_1 >= 1 then
		if arg_72_1.fenceGroup then
			arg_72_1.fenceGroup:Abort()
		end

		if PushAndPopsTable[arg_72_1.name] and PushAndPopsTable[arg_72_1.name].popFuncs and #PushAndPopsTable[arg_72_1.name].popFuncs > 0 then
			for iter_72_0, iter_72_1 in ipairs(PushAndPopsTable[arg_72_1.name].popFuncs) do
				iter_72_1()
			end
		end

		arg_72_0.stackVersion = arg_72_0.stackVersion + 1

		table.remove(arg_72_0.menuInfoStack, var_72_1)
	end

	if #arg_72_0.menuInfoStack == 0 then
		if Engine.CAADCDEEIA() and not Engine.DDJFBBJAIG() then
			ACTIONS.ResumeGame(arg_72_0)
		end

		arg_72_0.root:processEvent({
			name = "empty_menu_stack",
			controllerIndex = arg_72_0._controllerIndex
		})
		arg_72_0.root:RemoveMouseCursor()
	end

	if Engine.BHICADFIHA() then
		arg_72_0:PrintStack()
	end

	Engine.DHFEGHHHFH(#arg_72_0.menuInfoStack > 0)
end

function LUI.FlowManager.PushMenuInfo(arg_73_0, arg_73_1)
	arg_73_0:SetStack(arg_73_1)

	if arg_73_1.isModal then
		arg_73_0:InsertMenuInfo(#arg_73_0.menuInfoStack + 1, arg_73_1)
	else
		local var_73_0 = #arg_73_0.menuInfoStack + 1

		while var_73_0 > 1 and arg_73_0.menuInfoStack[var_73_0 - 1].isModal do
			var_73_0 = var_73_0 - 1
		end

		arg_73_0:InsertMenuInfo(var_73_0, arg_73_1)
	end
end

function LUI.FlowManager.SetStack(arg_74_0, arg_74_1)
	assert(arg_74_1.name)

	local var_74_0 = PresetStacks[arg_74_1.name]

	if not var_74_0 then
		return
	end

	local var_74_1 = arg_74_1.controller

	DebugPrint("FlowManager: Rewriting menu stack for " .. arg_74_1.name)

	if Engine.BHICADFIHA() then
		local var_74_2 = ""

		for iter_74_0, iter_74_1 in ipairs(arg_74_0.menuInfoStack) do
			var_74_2 = var_74_2 .. (iter_74_0 > 1 and " > " or "") .. iter_74_1.name
		end

		DebugPrint("    Current stack: " .. var_74_2)

		local var_74_3 = ""

		for iter_74_2, iter_74_3 in ipairs(var_74_0) do
			var_74_3 = var_74_3 .. (iter_74_2 > 1 and " > " or "") .. iter_74_3.name
		end

		DebugPrint("    Requesting: " .. var_74_3 .. " > " .. arg_74_1.name)
	end

	for iter_74_4, iter_74_5 in ipairs(arg_74_0.menuInfoStack) do
		if iter_74_4 > #var_74_0 or iter_74_5.name ~= var_74_0[iter_74_4].name then
			for iter_74_6 = #arg_74_0.menuInfoStack, iter_74_4, -1 do
				local var_74_4 = arg_74_0.menuInfoStack[iter_74_6]

				if not var_74_4.isModal then
					arg_74_0:CloseMenuInfo(var_74_4)
					arg_74_0:RemoveMenuInfo(var_74_4)
				end
			end
		end
	end

	for iter_74_7, iter_74_8 in ipairs(var_74_0) do
		if iter_74_7 > #arg_74_0.menuInfoStack or iter_74_8.name ~= arg_74_0.menuInfoStack[iter_74_7].name then
			local var_74_5 = arg_74_0:CreateMenuInfo(iter_74_8.name, nil, iter_74_8.exclusiveController, var_74_1)

			arg_74_0:PushMenuInfo(var_74_5)
		end
	end

	DebugPrint("Set stack complete")
end

function LUI.FlowManager.PrintStack(arg_75_0)
	local var_75_0 = "----MENU STACK TOP----" .. "\n"

	for iter_75_0 = #arg_75_0.menuInfoStack, 1, -1 do
		local var_75_1 = arg_75_0.menuInfoStack[iter_75_0]
		local var_75_2 = var_75_1.menu and "Opened" or "Closed"

		var_75_0 = var_75_0 .. (iter_75_0 .. ") " .. var_75_1.name .. " (" .. var_75_2 .. ")") .. "\n"
	end

	DebugPrint(var_75_0 .. "---MENU STACK BOTTOM---" .. "\n")
end

function LUI.FlowManager.StackContains(arg_76_0, arg_76_1)
	for iter_76_0, iter_76_1 in ipairs(arg_76_0.menuInfoStack) do
		if iter_76_1.name == arg_76_1 then
			return true
		end
	end

	return false
end

function LUI.FlowManager.StackContainsAny(arg_77_0, arg_77_1)
	for iter_77_0, iter_77_1 in ipairs(arg_77_0.menuInfoStack) do
		for iter_77_2, iter_77_3 in pairs(arg_77_1) do
			if iter_77_1.name == iter_77_3 then
				return true
			end
		end
	end

	return false
end

function LUI.FlowManager.GetStackTop(arg_78_0, arg_78_1)
	local var_78_0 = #arg_78_0.menuInfoStack

	if not arg_78_1 then
		while var_78_0 >= 1 and arg_78_0.menuInfoStack[var_78_0].isModal do
			var_78_0 = var_78_0 - 1
		end
	end

	if var_78_0 >= 1 then
		return arg_78_0.menuInfoStack[var_78_0]
	end

	return nil
end

function LUI.FlowManager.GetTopMostOpenMenuInfo(arg_79_0)
	local var_79_0 = #arg_79_0.menuInfoStack

	while var_79_0 >= 1 and not arg_79_0.menuInfoStack[var_79_0].menu do
		var_79_0 = var_79_0 - 1
	end

	if var_79_0 >= 1 then
		return arg_79_0.menuInfoStack[var_79_0]
	end

	return nil
end

function LUI.FlowManager.IsStackEmpty(arg_80_0)
	return #arg_80_0.menuInfoStack == 0
end

function LUI.FlowManager.AreMainMenuFencedOut(arg_81_0)
	for iter_81_0, iter_81_1 in ipairs(arg_81_0.menuInfoStack) do
		if (iter_81_1.name == "MainMenuOffline" or iter_81_1.name == "MainMenu") and iter_81_1.fenced then
			return true
		end
	end

	return false
end

local function var_0_1(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = false

	while not var_82_0 do
		local var_82_1 = arg_82_0:GetStackTop(true)

		if var_82_1 then
			local var_82_2 = var_82_1.name

			var_82_0 = var_82_2 == arg_82_2

			LUI.FlowManager.RequestLeaveMenuByName(var_82_2, true, true)
		else
			break
		end
	end
end

local function var_0_2(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_0:GetStackTop(true)

	return var_83_0 and var_83_0.name == arg_83_1
end

local function var_0_3(arg_84_0, arg_84_1)
	local var_84_0 = Engine.DBFFAEEFGJ()

	assert(var_84_0)

	if IsMenuInStack(var_84_0, "OptionsMenuNewLayout") then
		arg_84_0:dispatchEventToRoot({
			name = "closing_quick_access_menu",
			controllerIndex = arg_84_1.controller
		})

		if not var_0_2(arg_84_0, "OptionsMenuNewLayout") then
			var_0_1(arg_84_0, arg_84_1, "OptionsMenuNewLayout")
		end
	elseif not OSK.FCIEJBIHA() then
		arg_84_0:dispatchEventToRoot({
			immediate = true,
			name = "opening_quick_access_menu"
		})

		if IsMenuInStack(var_84_0, "SocialMenu") then
			var_0_1(arg_84_0, arg_84_1, "SocialMenu")
		end

		ACTIONS.OpenOptionsMenu(arg_84_1.controller, nil, true)

		if Engine.CAADCDEEIA() and CONDITIONS.InGame() then
			GAME.PauseGame()
		end
	end

	return true
end

local function var_0_4(arg_85_0, arg_85_1)
	local var_85_0 = Engine.DBFFAEEFGJ()

	assert(var_85_0)

	if Engine.CDCCDDJAJJ(arg_85_1.controller) then
		if CONDITIONS.InGame() then
			if IsMenuInStack(var_85_0, "ManagePartyPopup") then
				arg_85_0:dispatchEventToRoot({
					name = "closing_quick_access_menu"
				})
			else
				local var_85_1 = arg_85_1.qualifier == "keyboard"

				LUI.FlowManager.RequestSocialPopup(var_85_1)
			end
		elseif CONDITIONS.IsSocialEnabledInMainMenu(arg_85_0) then
			if IsMenuInStack(var_85_0, "SocialMenu") then
				arg_85_0:dispatchEventToRoot({
					name = "closing_quick_access_menu",
					controllerIndex = arg_85_1.controller
				})
				var_0_1(arg_85_0, arg_85_1, "SocialMenu")
			elseif not OSK.FCIEJBIHA() then
				arg_85_0:dispatchEventToRoot({
					immediate = true,
					name = "opening_quick_access_menu"
				})

				if IsMenuInStack(var_85_0, "OptionsMenuNewLayout") then
					var_0_1(arg_85_0, arg_85_1, "OptionsMenuNewLayout")
				end

				local var_85_2 = {
					hasUsedShortcut = true
				}

				LUI.FlowManager.RequestAddMenu("SocialMenu", true, arg_85_1.controller, false, var_85_2, true)

				if Engine.CAADCDEEIA() and CONDITIONS.InGame() then
					GAME.PauseGame()
				end
			end
		end

		return true
	else
		return false
	end
end

local function var_0_5(arg_86_0, arg_86_1)
	local var_86_0 = Dvar.IBEGCHEFE("LMSLNRLNOT")

	Dvar.DHEGHJJJHI("LMSLNRLNOT", not var_86_0)

	return true
end

local function var_0_6(arg_87_0, arg_87_1)
	local var_87_0 = Dvar.IBEGCHEFE("LOOTLTLRNN")

	Dvar.DHEGHJJJHI("LOOTLTLRNN", not var_87_0)

	return true
end

local function var_0_7(arg_88_0, arg_88_1)
	if arg_88_1 == "quick_social" or arg_88_1 == "quick_options" then
		local var_88_0 = arg_88_0:GetTopMostOpenMenuInfo()

		if var_88_0 and var_88_0.menu and var_88_0.menu.isQuickAccessShortcutsDisabled then
			return false
		end
	end

	if arg_88_1 == "quick_social" and (LUI.FlowManager.IsInStack("MainMenuOffline") or CONDITIONS.IsLaunchChunk() or Engine.CAADCDEEIA()) then
		return false
	end

	return true
end

local function var_0_8(arg_89_0, arg_89_1)
	if arg_89_1.down and var_0_7(arg_89_0, arg_89_1.button) then
		if arg_89_1.button == "mute_sound" then
			return var_0_5(arg_89_0, arg_89_1)
		elseif arg_89_1.button == "mute_voicechat" then
			return var_0_6(arg_89_0, arg_89_1)
		elseif arg_89_1.button == "accept_notification" then
			arg_89_0:dispatchEventToRoot({
				answer = true,
				name = "kbm_notification_prompt_answer"
			})
		elseif arg_89_1.button == "decline_notification" then
			arg_89_0:dispatchEventToRoot({
				answer = false,
				name = "kbm_notification_prompt_answer"
			})
		elseif arg_89_1.button == "quick_options" then
			return var_0_3(arg_89_0, arg_89_1)
		elseif arg_89_1.button == "quick_social" then
			return var_0_4(arg_89_0, arg_89_1)
		end
	end

	return false
end

local function var_0_9(arg_90_0)
	return arg_90_0 == PartyUIRoot.MP_PRIVATE_MATCH or arg_90_0 == PartyUIRoot.CP_PRIVATE_MATCH
end

local function var_0_10(arg_91_0)
	return arg_91_0 == PartyUIRoot.MP_MAIN_MENU or arg_91_0 == PartyUIRoot.CP_MAIN_MENU
end

function LUI.FlowManager.LeaveQuickMenus()
	local var_92_0 = Engine.DBFFAEEFGJ()

	var_92_0:dispatchEventToRoot({
		name = "closing_quick_access_menu"
	})

	if LUI.FlowManager.IsInStack("SocialMenu") then
		var_0_1(var_92_0.flowManager, nil, "SocialMenu")
	end

	if LUI.FlowManager.IsInStack("OptionsMenuNewLayout") then
		var_0_1(var_92_0.flowManager, nil, "OptionsMenuNewLayout")
	end
end

function LUI.FlowManager.init(arg_93_0, arg_93_1, arg_93_2)
	LUI.UIElement.init(arg_93_0)

	arg_93_0.id = "flowManager"
	arg_93_0.root = arg_93_1
	arg_93_0._controllerIndex = arg_93_2
	arg_93_0.menuInfoStack = {}
	arg_93_0.stackVersion = 0
	arg_93_0.stackChangeTime = Engine.BFBIDEGDFB()
	arg_93_0.stackChangeMenu = 0
	arg_93_0.isPartyUIRootDirty = false

	arg_93_0:registerEventHandler("gamepad_button", function(arg_94_0, arg_94_1)
		if var_0_8(arg_94_0, arg_94_1) then
			return true
		end

		local var_94_0 = arg_93_0:GetTopMostOpenMenuInfo()

		if var_94_0 and (not var_94_0.controller or not arg_94_1.controller or var_94_0.controller == arg_94_1.controller or not var_94_0.isControllerExclusive) then
			return arg_94_0:ForwardEventToTopMostOpenMenu(arg_94_1)
		end

		return false
	end)

	if Engine.EABCCIBFIG() then
		arg_93_0:registerEventHandler("mousemove", arg_93_0.ForwardMouseEventToTopMostOpenMenu)
		arg_93_0:registerEventHandler("mousedown", arg_93_0.ForwardMouseEventToTopMostOpenMenu)
		arg_93_0:registerEventHandler("mouseup", arg_93_0.ForwardMouseEventToTopMostOpenMenu)
	end

	arg_93_0:registerEventHandler("addmenu", arg_93_0.addMenuHandler)
	arg_93_0:registerEventHandler("popupmenu", arg_93_0.popupMenuHandler)
	arg_93_0:registerEventHandler("leavemenu", arg_93_0.leaveMenuHandler)
	arg_93_0:registerEventHandler("restoreMenu", arg_93_0.restoreMenuHandler)
	arg_93_0:registerEventHandler("closeallmenus", arg_93_0.closeAllMenusHandler)
	arg_93_0:registerEventHandler("resumemovement", arg_93_0.resumeMovementHandler)

	if Engine.EAAHGICFBD() and not Engine.DDJFBBJAIG() then
		arg_93_0:registerOmnvarHandler("ui_options_menu", function(arg_95_0, arg_95_1)
			arg_95_0:OpenMenuByScriptRequest(arg_95_1.value)
		end)
		arg_93_0:OpenMenuByScriptRequest(Game.BFEEGCHICA(arg_93_2, "ui_options_menu"))
	end
end

function LUI.FlowManager.GetGamemodeForUIRoot(arg_96_0)
	if arg_96_0 > PartyUIRoot.GAMEMODE_NONE_MENUS_START and arg_96_0 < PartyUIRoot.GAMEMODE_NONE_MENUS_END then
		return CoD.PlayMode.None
	elseif arg_96_0 > PartyUIRoot.GAMEMODE_MP_MENUS_START and arg_96_0 < PartyUIRoot.GAMEMODE_MP_MENUS_END then
		return CoD.PlayMode.Core
	elseif arg_96_0 > PartyUIRoot.GAMEMODE_CP_MENUS_START and arg_96_0 < PartyUIRoot.GAMEMODE_CP_MENUS_END then
		return CoD.PlayMode.Aliens
	elseif arg_96_0 > PartyUIRoot.GAMEMODE_SP_MENUS_START and arg_96_0 < PartyUIRoot.GAMEMODE_SP_MENUS_END then
		return CoD.PlayMode.SP
	elseif arg_96_0 > PartyUIRoot.GAMEMODE_WZ_MENUS_START and arg_96_0 < PartyUIRoot.GAMEMODE_WZ_MENUS_END then
		return CoD.PlayMode.Core
	else
		assert("LUI.FlowManager.GetGamemodeForUIRoot invalid ui root " .. tostring(arg_96_0))
	end
end

function LUI.FlowManager.IsUIRootBRGamemode(arg_97_0)
	return arg_97_0 >= BR_MENUS_START and arg_97_0 <= BR_MENUS_END or arg_97_0 > PartyUIRoot.GAMEMODE_WZ_MENUS_START and arg_97_0 < PartyUIRoot.GAMEMODE_WZ_MENUS_END
end

function LUI.FlowManager.AutomaticNavigationFrame(arg_98_0)
	local var_98_0 = PartyUIRoot.FREE
	local var_98_1 = false
	local var_98_2 = false
	local var_98_3 = false
	local var_98_4 = false
	local var_98_5 = arg_98_0._controllerIndex or Engine.IJEBHJIJF()

	if arg_98_0.isPartyUIRootDirty then
		var_98_0 = Lobby.CGEIEECJJH()
	else
		local var_98_6 = Tournament.DEHIAGCHBD()
		local var_98_7 = MLG.DEHIAGCHBD()

		if var_98_6 ~= PartyUIRoot.FREE then
			var_98_0 = var_98_6
			var_98_1 = true
			var_98_3 = true
			var_98_4 = true
		elseif var_98_7 ~= PartyUIRoot.FREE then
			var_98_0 = var_98_7
			var_98_2 = true
			var_98_3 = true
			var_98_4 = false
		end
	end

	if var_98_0 ~= PartyUIRoot.FREE then
		if Friends.GHGFJIJBI() or not Engine.CFHBIHABCB(var_98_5) or not Engine.CGJEJFBEAG(var_98_5) and Dvar.IBEGCHEFE("LSLLMKMTSL") then
			if var_98_0 == PartyUIRoot.MP_PUBLIC_MATCH_LOBBY then
				var_98_0 = PartyUIRoot.BATTLE_ROYALE_MENU_PUBLIC_LOBBY
			elseif var_98_0 == PartyUIRoot.MP_MAIN_MENU then
				var_98_0 = PartyUIRoot.BR_MAIN_MENU
			elseif var_98_0 == PartyUIRoot.TOURNAMENT_LOADING or var_98_0 == PartyUIRoot.TOURNAMENT_MATCHMAKING or var_98_0 == PartyUIRoot.TOURNAMENT_BRACKET then
				var_98_0 = TOURNAMENT.GetUIRootForF2PFromPremiumIfF2PAllowed(var_98_0)
			end
		end

		if CONDITIONS.IsMagmaGameMode() and (var_98_0 == PartyUIRoot.TOURNAMENT_LOADING or var_98_0 == PartyUIRoot.TOURNAMENT_MATCHMAKING or var_98_0 == PartyUIRoot.TOURNAMENT_BRACKET) then
			var_98_0 = TOURNAMENT.GetUIRootForF2PFromPremiumIfF2PAllowed(var_98_0)
		end

		local var_98_8 = arg_98_0:DoAutomaticNavigation(var_98_0, var_98_3, var_98_4)

		if var_98_8 and var_98_1 then
			Tournament.CJAJGICGJB()
		elseif var_98_8 and var_98_2 then
			MLG.CJAJGICGJB()

			if Dvar.IBEGCHEFE("LPQQSRQSMO") then
				GAMEBATTLES.ShowFenceToRefreshSchedule()
			end
		elseif not var_98_8 then
			LUI.MouseCursorContextualMenuLayer.ForceCloseContextualMenu()
		end
	end
end

function LUI.FlowManager.DoAutomaticNavigation(arg_99_0, arg_99_1, arg_99_2, arg_99_3)
	if Engine.DHEJECBEE() then
		END_GAME.StopServerAndLeave(arg_99_0)

		return false
	end

	if not Engine.DDJFBBJAIG() then
		return false
	end

	if Lobby.BJEABAEHDE() then
		return false
	end

	if arg_99_2 and Lobby.BBDICGHE() then
		if IsPrivateMatch() then
			Lobby.LeaveCustomGameLobby()
		elseif IsPublicMatch() then
			Lobby.LeavePublicLobby()
		end

		return false
	end

	local var_99_0 = Engine.IJEBHJIJF()

	if arg_99_2 and IsSystemLink() then
		Engine.DAGFFDGFII("xstopprivateparty 0", var_99_0)
		Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)

		return false
	end

	if arg_99_3 and not Lobby.GFFECBCCF() then
		Engine.EBIDFIDHIE("xstartprivateparty")

		return false
	end

	local var_99_1 = Engine.DGEFGAJIB()
	local var_99_2 = LUI.FlowManager.GetGamemodeForUIRoot(arg_99_1)
	local var_99_3 = CONDITIONS.IsMagmaGameMode() ~= LUI.FlowManager.IsUIRootBRGamemode(arg_99_1) and not var_0_9(arg_99_1) and not var_0_10(arg_99_1)

	if (var_99_1 ~= var_99_2 or var_99_3) and var_99_1 ~= CoD.PlayMode.None then
		local var_99_4 = Engine.IJEBHJIJF()

		arg_99_0:closeAllMenus()
		arg_99_0:addMenu({
			menu = LUI.FlowManager.FlowMenus[PartyUIRoot.MAIN_MENU],
			controller = var_99_4
		})

		return false
	end

	local var_99_5 = LUI.FlowManager.FlowMenus[arg_99_1]

	if not var_99_5 then
		return true
	end

	if Dvar.IBEGCHEFE("MMQLNQRRLO") then
		local var_99_6 = arg_99_0:GetStackTop().name

		if LUI.FlowManager.IgnoreFollowHostMenus[var_99_6] then
			local var_99_7 = arg_99_0:CreateMenuInfo(var_99_5, nil, true, var_99_0)

			arg_99_0:swapPartyUIRoot(var_99_7, var_99_0)

			arg_99_0.isPartyUIRootDirty = false

			return true
		end
	end

	local var_99_8 = arg_99_0:StackContains(var_99_5)
	local var_99_9 = false

	for iter_99_0 = arg_99_1 + 1, PartyUIRoot.LAST do
		local var_99_10 = LUI.FlowManager.FlowMenus[iter_99_0]

		if arg_99_0:StackContains(var_99_10) then
			var_99_9 = true

			break
		end
	end

	if var_99_8 and not var_99_9 then
		arg_99_0.isPartyUIRootDirty = false

		return true
	end

	DebugPrint("LUI.FlowManager.FollowPartyHost to " .. var_99_5)
	arg_99_0:closeAllMenus()
	arg_99_0:addMenu({
		menu = var_99_5,
		controller = var_99_0
	})

	return false
end

function LUI.FlowManager.OpenMenuByScriptRequest(arg_100_0, arg_100_1)
	assert(Engine.EAAHGICFBD())

	if not Game.HJHDJDCBF() then
		return
	end

	local var_100_0

	local function var_100_1(arg_101_0)
		arg_100_0:Wait(16).onComplete = function()
			if arg_100_0.root.loadingScreenManager and arg_100_0.root.loadingScreenManager:ShouldBeVisible() then
				var_100_1(arg_101_0)
			else
				arg_101_0()
			end
		end
	end

	local var_100_2 = ({
		"TeamSelectMenu",
		"LoadoutSelect",
		"LaunchChunkNewPhasePopup"
	})[arg_100_1]

	if var_100_2 then
		local var_100_3 = arg_100_0.root:GetControllerIndex()

		var_100_1(function()
			LUI.FlowManager.RequestAddMenu(var_100_2, true, var_100_3, false, {
				openedFromScriptRequest = true
			}, true)

			if var_100_2 ~= "LaunchChunkNewPhasePopup" then
				if CONDITIONS.IsMagmaGameMode() then
					LUI.FlowManager.RequestSetStack(var_100_2, {
						{
							name = "BrPauseMenu"
						}
					})
				else
					LUI.FlowManager.RequestSetStack(var_100_2, {
						{
							name = "MPPauseMenu"
						}
					})
				end
			end
		end)
	else
		LUI.FlowManager.RequestCloseAllMenus()
	end
end

function LUI.FlowManager.ShouldBeVisible(arg_104_0)
	return Engine.DDJFBBJAIG() or Game.HJHDJDCBF()
end

function LUI.FlowManager.LogMenuChangeTo(arg_105_0, arg_105_1, arg_105_2)
	if arg_105_0.stackChangeMenu ~= arg_105_2 then
		local var_105_0 = Engine.BFBIDEGDFB()
		local var_105_1 = var_105_0 - arg_105_0.stackChangeTime

		if arg_105_0.stackChangeMenu ~= 0 then
			Engine.BHCDIBBGGB(arg_105_1, arg_105_0.stackChangeMenu, arg_105_2, var_105_1)
		end

		arg_105_0.stackChangeMenu = arg_105_2
		arg_105_0.stackChangeTime = var_105_0
	end
end

function LUI.FlowManager.Frame(arg_106_0)
	arg_106_0:RefreshStack()
	arg_106_0:AutomaticNavigationFrame()
end

function LUI.FlowManager.InitLayer(arg_107_0)
	if Engine.DDJFBBJAIG() and not arg_107_0._partyRootSubscription then
		local var_107_0 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.partyUIRoot"):GetModel(0)

		arg_107_0._partyRootSubscription = arg_107_0:SubscribeToModel(var_107_0, function(arg_108_0)
			local var_108_0 = Lobby.CGEIEECJJH()

			if var_108_0 > PartyUIRoot.FREE then
				DebugPrint("Set isPartyUIRootDirty to true. The current partyUIRoot is " .. tostring(var_108_0) .. "\n")

				arg_107_0.isPartyUIRootDirty = true
			end
		end)
	end
end

function LUI.FlowManager.ClearLayer(arg_109_0)
	arg_109_0:closeAllMenus()

	if arg_109_0._partyRootSubscription then
		arg_109_0:UnsubscribeFromModel(arg_109_0._partyRootSubscription)

		arg_109_0._partyRootSubscription = nil
	end
end

function LUI.FlowManager.RefreshStack(arg_110_0)
	if #arg_110_0.menuInfoStack == 0 then
		return
	end

	for iter_110_0, iter_110_1 in ipairs(arg_110_0.menuInfoStack) do
		if iter_110_1.fenceGroup then
			iter_110_1.fenceGroup:Frame()
		end

		iter_110_1.fenced = iter_110_1.fenceGroup and not iter_110_1.fenceGroup:Passes()

		if iter_110_1.fenced then
			for iter_110_2 = iter_110_0 + 1, #arg_110_0.menuInfoStack do
				local var_110_0 = arg_110_0.menuInfoStack[iter_110_2]

				if var_110_0 then
					local var_110_1 = var_110_0.fenceGroup

					if var_110_1 then
						var_110_1:Reset()
					end
				end
			end

			break
		end
	end

	local var_110_2 = #arg_110_0.menuInfoStack

	for iter_110_3, iter_110_4 in ipairs(arg_110_0.menuInfoStack) do
		if iter_110_4.fenced then
			var_110_2 = iter_110_3 - 1

			break
		end
	end

	local var_110_3 = 1

	for iter_110_5, iter_110_6 in ipairs(arg_110_0.menuInfoStack) do
		if not iter_110_6.isPopup and (iter_110_6.menu or iter_110_5 <= var_110_2) then
			assert(iter_110_6.menu or not iter_110_6.fenced)

			var_110_3 = iter_110_5
		end
	end

	local var_110_4 = arg_110_0:GetStackVersion()

	for iter_110_7, iter_110_8 in ipairs(arg_110_0.menuInfoStack) do
		if var_110_4 ~= arg_110_0:GetStackVersion() then
			return arg_110_0:RefreshStack()
		end

		if iter_110_7 < var_110_3 then
			if iter_110_8.menu and not AlwaysVisible[iter_110_8.name] then
				arg_110_0:CloseMenuInfo(iter_110_8, false, true)
			end
		elseif not iter_110_8.menu and (iter_110_7 <= var_110_2 or iter_110_8.isModal) then
			assert(not iter_110_8.fenced)
			Engine.BHFFIBEFFH("(FlowManager OpenMenuInfo) " .. iter_110_8.name, "widget")
			arg_110_0:OpenMenuInfo(iter_110_8)
			Engine.DCHDDCJCEG("(FlowManager OpenMenuInfo) " .. iter_110_8.name, "widget")
		end
	end

	local var_110_5 = arg_110_0._controllerIndex or Engine.IJEBHJIJF()
	local var_110_6 = var_0_0(var_110_5)

	for iter_110_9, iter_110_10 in ipairs(arg_110_0.menuInfoStack) do
		local var_110_7 = iter_110_10.onTop == true

		iter_110_10.onTop = iter_110_10.menu and iter_110_9 == #arg_110_0.menuInfoStack

		local var_110_8 = iter_110_9 <= var_110_2 and var_110_2 < #arg_110_0.menuInfoStack

		if iter_110_10.menu then
			if iter_110_10.onTop then
				if iter_110_10.menu.popupActive then
					iter_110_10.menu:processEvent({
						dispatchChildren = true,
						name = "popup_inactive"
					})

					iter_110_10.menu.popupActive = nil
				end

				if not var_110_7 then
					if DisableMousePointer[iter_110_10.name] then
						arg_110_0.root:RemoveMouseCursor()
					else
						arg_110_0.root:TryAddMouseCursor()
					end

					local var_110_9 = var_110_6[iter_110_10.name]
					local var_110_10, var_110_11 = iter_110_10.menu:restoreState(var_110_9, iter_110_10.controller)

					if not LUI.IsLastInputMouseNavigation(iter_110_10.controller) then
						if not var_110_10 or var_110_11 == 0 then
							Engine.BHFFIBEFFH("(FlowManager gain_focus) " .. iter_110_10.name, "widget")
							iter_110_10.menu:processEvent({
								name = "gain_focus",
								controller = iter_110_10.controller,
								focusType = FocusType.MenuFlow
							})
							Engine.DCHDDCJCEG("(FlowManager gain_focus) " .. iter_110_10.name, "widget")
						end
					else
						Engine.HJJJIGAC(iter_110_10.controller)
						LUI.MouseCursorTooltipLayer.ForceCloseTooltip(iter_110_10.controller)

						if iter_110_10.menu.MovedToStackTop then
							iter_110_10.menu:MovedToStackTop(iter_110_10.controller)

							if iter_110_10 == nil or iter_110_10.menu == nil then
								return
							end
						end
					end

					LUI.MouseCursorContextualMenuLayer.ForceCloseContextualMenu()

					var_110_6[iter_110_10.name] = nil
				end
			else
				if var_110_7 then
					var_110_6[iter_110_10.name] = iter_110_10.menu:saveState()

					iter_110_10.menu:processEvent({
						name = "lose_focus"
					})
					iter_110_10.menu:processEvent({
						dispatchChildren = true,
						name = "popup_active"
					})
				end

				iter_110_10.menu.popupActive = true
			end

			if iter_110_10.menu.isBelowBlockingFence ~= var_110_8 then
				iter_110_10.menu.isBelowBlockingFence = var_110_8

				if var_110_8 then
					iter_110_10.menu:processEvent({
						name = "below_blocking_fence"
					})
				else
					iter_110_10.menu:processEvent({
						name = "not_below_blocking_fence"
					})
				end
			end
		end
	end
end

function LUI.FlowManager.processEvent(arg_111_0, arg_111_1)
	local var_111_0
	local var_111_1 = arg_111_0.m_eventHandlers[arg_111_1.name]

	if var_111_1 then
		var_111_0 = var_111_1(arg_111_0, arg_111_1)
	else
		var_111_0 = LUI.UIElement.processEvent(arg_111_0, arg_111_1)
	end

	if not var_111_0 and arg_111_0.IsNavigationEvent(arg_111_1) then
		arg_111_0:EnsureFocus()
	end

	return var_111_0
end

function LUI.FlowManager.EnsureFocus(arg_112_0)
	local var_112_0 = arg_112_0.menuInfoStack[#arg_112_0.menuInfoStack]

	if var_112_0 and var_112_0.menu and not var_112_0.menu:getFirstInFocus() then
		DebugPrint("FlowManager: No child in focus, trying to restore focus.  This should probably only happen when using a mouse")

		local var_112_1 = LUI.FlowManager.GetScopedData(var_112_0.menu).controllerIndex

		var_112_0.menu:processEvent({
			name = "gain_focus",
			controller = var_112_1
		})
		DebugPrint("CheckRestoreFocus to " .. var_112_0.name)
	end
end

function LUI.FlowManager.ForwardEventToTopMostOpenMenu(arg_113_0, arg_113_1)
	local var_113_0 = arg_113_0:GetTopMostOpenMenuInfo()

	if var_113_0 then
		return var_113_0.menu:processEvent(arg_113_1)
	end

	return false
end

function LUI.FlowManager.ForwardMouseEventToTopMostOpenMenu(arg_114_0, arg_114_1)
	arg_114_0:applyElementTransform()

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.StartFocusChain(arg_114_0)
	end

	local var_114_0 = arg_114_0:ForwardEventToTopMostOpenMenu(arg_114_1)

	arg_114_0:undoElementTransform()

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.EndFocusChain(arg_114_0)
	end

	if arg_114_1.name == "mousemove" then
		return true
	else
		return var_114_0
	end
end

function LUI.FlowManager.IsNavigationEvent(arg_115_0)
	if arg_115_0.name == "gamepad_button" and arg_115_0.down and arg_115_0.qualifier ~= "mousewheel" and (arg_115_0.button == "up" or arg_115_0.button == "down" or arg_115_0.button == "left" or arg_115_0.button == "right") then
		return true
	end

	return false
end
