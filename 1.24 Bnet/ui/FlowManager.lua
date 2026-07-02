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
	CP_SYSTEM_LINK_LOBBY = 29,
	BR_TRIALS = 11,
	MP_SYSTEM_LINK = 8,
	GAMEMODE_MP_MENUS_START = 4,
	MP_PRIVATE_TOURNAMENT_LOBBY = 13,
	TOURNAMENT_LOADING = 14,
	MP_MAIN_MENU = 5,
	GAMEMODE_CP_MENUS_END = 30,
	GAME_BATTLES_MATCH = 12,
	GAMEMODE_NONE_MENUS_START = 1,
	TOURNAMENT_MATCHMAKING = 15,
	WZ_TOURNAMENT_MATCHMAKING = 33,
	GAMEMODE_CP_MENUS_START = 24,
	GAMEMODE_WZ_MENUS_START = 31,
	WZ_TOURNAMENT_BRACKET = 34,
	MP_SYSTEM_LINK_LOBBY = 9,
	LAST = 39,
	CP_PRIVATE_MATCH = 26,
	BR_MAIN_MENU = 19,
	MP_TRIALS = 10,
	LOADOUT_SELECT_MENU = 17,
	MP_TRIAL_EVENT = 37,
	CP_PUBLIC_MATCH_LOBBY = 27,
	GAMEMODE_NONE_MENUS_END = 3,
	BATTLE_ROYALE_MENU_TUTORIAL = 21,
	MP_PUBLIC_MATCH_LOBBY = 7,
	FREE = 0,
	MP_PRIVATE_MATCH = 6,
	BATTLE_ROYALE_MENU_PUBLIC_LOBBY = 20,
	TOURNAMENT_BRACKET = 16,
	GAMEMODE_MP_MENUS_END = 23,
	GAMEMODE_WZ_MENUS_END = 36,
	WZ_PRIVATE_MATCH_LOBBY = 35,
	MAIN_MENU = 2,
	WZ_TOURNAMENT_LOADING = 32,
	BR_TRIAL_EVENT = 38,
	CP_MAIN_MENU = 25,
	CP_SYSTEM_LINK = 28,
	BATTLE_ROYALE_MENU = 18,
	PAYBACK_ONBOARDING_LOBBY = 22
}
BR_MENUS_START = PartyUIRoot.BATTLE_ROYALE_MENU
BR_MENUS_END = PartyUIRoot.PAYBACK_ONBOARDING_LOBBY
LUI.FlowManager.FlowMenus = {
	[PartyUIRoot.MAIN_MENU] = "MainMenu",
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
LUI.FlowManager.PremiumMenus = {
	"CampaignMenu",
	"CampaignMenuOffline",
	"MPMainMenu",
	"MPSystemLinkMenu",
	"MPSystemLinkLobby",
	"CPMainMenu",
	"CPSystemLinkMenu"
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

function LUI.FlowManager.RegisterIgnoreFollowHostCallback(arg_4_0, arg_4_1)
	IgnoreFollowHostCallbacks[arg_4_0] = arg_4_1
end

function LUI.FlowManager.DisableLetterboxForMenu(arg_5_0)
	DisableLetterbox[arg_5_0] = true
end

function LUI.FlowManager.AlwaysVisibleForMenu(arg_6_0)
	AlwaysVisible[arg_6_0] = true
end

function LUI.FlowManager.RequestSetStack(arg_7_0, arg_7_1)
	assert(type(arg_7_0) == "string")
	assert(type(arg_7_1) == "table")

	PresetStacks[arg_7_0] = arg_7_1
end

function LUI.FlowManager.DisableMousePointerForMenu(arg_8_0)
	DisableMousePointer[arg_8_0] = true
end

function LUI.FlowManager.GetPerControllerPersistentData(arg_9_0)
	if not LUI.FlowManager._persistentData then
		LUI.FlowManager._persistentData = {}
	end

	if not LUI.FlowManager._persistentData[arg_9_0] then
		LUI.FlowManager._persistentData[arg_9_0] = {}
	end

	return LUI.FlowManager._persistentData[arg_9_0]
end

function LUI.FlowManager.GetScopedData(arg_10_0)
	local var_10_0 = type(arg_10_0)

	assert(var_10_0 == "string" or var_10_0 == "userdata")

	local var_10_1 = Engine.DBFFAEEFGJ()

	assert(var_10_1 and var_10_1.flowManager)

	local var_10_2 = var_10_1.flowManager

	if var_10_0 == "string" then
		return var_10_2:GetScopedDataFromMenuName(arg_10_0)
	end

	if var_10_0 == "userdata" then
		return var_10_2:GetScopedDataFromElement(arg_10_0)
	end
end

function LUI.FlowManager.RequestAddMenu(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
	assert(type(arg_11_0) == "string")

	local var_11_0 = {}

	var_11_0.name = "addmenu"
	var_11_0.menu = arg_11_0
	var_11_0.exclusiveController = arg_11_1
	var_11_0.controller = arg_11_2
	var_11_0.replaceTop = arg_11_3
	var_11_0.immediate = arg_11_5
	var_11_0.data = arg_11_4

	local var_11_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_11_1, true, "RequestAddMenu " .. arg_11_0)
	LUI.UIRoot.ProcessEvent(var_11_1, var_11_0)
end

function LUI.FlowManager.RequestSocialPopup(arg_12_0)
	local var_12_0 = Friends.BJDEIGDDCD()
	local var_12_1 = FRIENDS.AreWeHost(var_12_0)
	local var_12_2 = {
		disableQuickAccessShortcuts = false,
		controllerIndex = controllerIndex,
		areWeHost = var_12_1,
		defaultTabFocus = FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS,
		menuTitle = Engine.CBBHFCGDIC("LUA_MENU/SOCIAL_TITLE"),
		inviteTabTitle = Engine.CBBHFCGDIC("LUA_MENU/INVITE_TO_GAME"),
		hasUsedShortcut = arg_12_0
	}

	LUI.FlowManager.RequestPopupMenu(nil, "ManagePartyPopup", true, controllerIndex, false, var_12_2)
end

function LUI.FlowManager.RequestPopupMenu(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5, arg_13_6, arg_13_7, arg_13_8)
	assert(arg_13_1)

	local var_13_0 = {}

	var_13_0.name = "popupmenu"
	var_13_0.menu = arg_13_1
	var_13_0.isModal = arg_13_7
	var_13_0.exclusiveController = arg_13_2
	var_13_0.controller = arg_13_3
	var_13_0.replaceTop = arg_13_4
	var_13_0.data = arg_13_5

	if arg_13_8 ~= nil then
		var_13_0.immediate = arg_13_8
	else
		var_13_0.immediate = true
	end

	local var_13_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_13_1, true, "RequestPopupMenu " .. arg_13_1)
	LUI.UIRoot.ProcessEvent(var_13_1, var_13_0)
end

function LUI.FlowManager.RequestLeaveMenu(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = {}

	var_14_0.name = "leavemenu"
	var_14_0.element = arg_14_0
	var_14_0.immediate = arg_14_1
	var_14_0.blockSound = arg_14_2

	local var_14_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_14_1, true, "RequestLeaveMenu")
	LUI.UIRoot.ProcessEvent(var_14_1, var_14_0)
end

function LUI.FlowManager.RequestLeaveMenuByName(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_0)

	local var_15_0 = {}

	var_15_0.name = "leavemenu"
	var_15_0.menu = arg_15_0
	var_15_0.immediate = arg_15_1
	var_15_0.blockSound = arg_15_2

	LUI.UIRoot.BlockButtonInput(Engine.DBFFAEEFGJ(), true, "RequestLeaveMenuByName " .. arg_15_0)
	Engine.DBFFAEEFGJ():processEvent(var_15_0)
end

function LUI.FlowManager.RequestLeaveMenuByNameWithController(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	assert(arg_16_0)

	local var_16_0 = {}

	var_16_0.name = "leavemenu"
	var_16_0.menu = arg_16_0
	var_16_0.immediate = arg_16_2
	var_16_0.blockSound = arg_16_3
	var_16_0.managerControllerIndex = arg_16_1

	LUI.UIRoot.BlockButtonInput(Engine.DBFFAEEFGJ(), true, "RequestLeaveMenuByName " .. arg_16_0)
	Engine.DBFFAEEFGJ():processEvent(var_16_0)
end

function LUI.FlowManager.RequestRestoreMenu(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}

	var_17_0.name = "restoreMenu"
	var_17_0.menu = arg_17_0
	var_17_0.immediate = true
	var_17_0.exclusiveController = arg_17_1
	var_17_0.controller = arg_17_2

	local var_17_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.BlockButtonInput(var_17_1, true, "RequestRestoreMenu")
	LUI.UIRoot.ProcessEvent(var_17_1, var_17_0)
end

function LUI.FlowManager.RequestCloseAllMenus(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {}

	var_18_0.name = "closeallmenus"

	local var_18_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.ProcessEvent(var_18_1, var_18_0)

	if arg_18_0 then
		METRICS.RecordInGameDismissMenuUsage(arg_18_2, arg_18_0, arg_18_1)
	end
end

function LUI.FlowManager.IsInStack(arg_19_0)
	local var_19_0 = Engine.DBFFAEEFGJ()

	assert(var_19_0 and var_19_0.flowManager)

	return var_19_0.flowManager:StackContains(arg_19_0)
end

function LUI.FlowManager.IsAnyInStack(arg_20_0)
	local var_20_0 = Engine.DBFFAEEFGJ()

	assert(var_20_0 and var_20_0.flowManager)

	return var_20_0.flowManager:StackContainsAny(arg_20_0)
end

local function var_0_0(arg_21_0)
	if SavedMenuStates[arg_21_0] == nil then
		SavedMenuStates[arg_21_0] = {}
	end

	return SavedMenuStates[arg_21_0]
end

function LUI.FlowManager.ClearSavedMenuStatesByControllerIndex(arg_22_0, arg_22_1)
	local var_22_0 = var_0_0(arg_22_0)

	if arg_22_1 then
		var_22_0[arg_22_1] = nil
	end
end

function LUI.FlowManager.IsTopMenuModal()
	local var_23_0 = Engine.DBFFAEEFGJ()

	assert(var_23_0 and var_23_0.flowManager)

	local var_23_1 = var_23_0.flowManager.menuInfoStack
	local var_23_2 = var_23_1[#var_23_1]

	return var_23_2 and var_23_2.isModal
end

function LUI.FlowManager.IsMenuOnTop(arg_24_0)
	local var_24_0 = Engine.DBFFAEEFGJ()

	assert(var_24_0 and var_24_0.flowManager)

	local var_24_1 = var_24_0.flowManager:GetStackTop()

	return var_24_1 and var_24_1.name == arg_24_0
end

function LUI.FlowManager.GetCurrentMenu(arg_25_0)
	local var_25_0 = Engine.DBFFAEEFGJ()

	assert(var_25_0 and var_25_0.flowManager)

	local var_25_1 = arg_25_0
	local var_25_2 = var_25_1:getParent()

	while var_25_2 do
		if var_25_2 == var_25_0.flowManager then
			return var_25_1
		end

		var_25_1 = var_25_2
		var_25_2 = var_25_2:getParent()
	end

	assert("Error getting current menu. Most likely, the element has not been added to a menu yet.")
end

function LUI.FlowManager.GetVisibleMenu()
	local var_26_0 = Engine.DBFFAEEFGJ()

	assert(var_26_0)

	local var_26_1 = var_26_0.flowManager

	if var_26_1 and var_26_1.menuInfoStack then
		local var_26_2 = var_26_1.menuInfoStack[#var_26_1.menuInfoStack]

		if var_26_2 and var_26_2.menu then
			return var_26_2.menu
		end
	end
end

function LUI.FlowManager.GetMenuNameAtIndex(arg_27_0)
	local var_27_0 = Engine.DBFFAEEFGJ()

	assert(var_27_0)

	local var_27_1 = var_27_0.flowManager
	local var_27_2 = var_27_1.menuInfoStack

	if arg_27_0 < 0 then
		arg_27_0 = #var_27_2 + arg_27_0
	end

	assert(var_27_1.menuInfoStack[arg_27_0])

	return var_27_1.menuInfoStack[arg_27_0].name
end

function LUI.FlowManager.GetAllMenuNames()
	local var_28_0 = Engine.DBFFAEEFGJ()

	assert(var_28_0)

	local var_28_1 = var_28_0.flowManager
	local var_28_2

	if var_28_1 and var_28_1.menuInfoStack then
		for iter_28_0 = #var_28_1.menuInfoStack, 1, -1 do
			local var_28_3 = var_28_1.menuInfoStack[iter_28_0].name

			if var_28_3 and var_28_3 ~= "" then
				var_28_2 = iter_28_0 == #var_28_1.menuInfoStack and var_28_3 or var_28_2 .. ";" .. var_28_3
			end
		end
	end

	return var_28_2
end

function LUI.FlowManager.GetMenuByName(arg_29_0)
	local var_29_0 = Engine.DBFFAEEFGJ()

	assert(var_29_0)

	local var_29_1 = var_29_0.flowManager

	if var_29_1 and var_29_1.menuInfoStack then
		for iter_29_0 = #var_29_1.menuInfoStack, 1, -1 do
			local var_29_2 = var_29_1.menuInfoStack[iter_29_0]

			if arg_29_0 == var_29_2.name then
				return var_29_2
			end
		end
	end
end

function SaveMenuStack(arg_30_0)
	assert(arg_30_0)
	assert(arg_30_0.flowManager)

	local var_30_0 = {}

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.flowManager.menuInfoStack) do
		table.insert(var_30_0, CreateMenuInfoSaveData(iter_30_1))
	end

	return (mobdebug.dump(var_30_0, {
		sparse = false
	}))
end

function RestoreMenuStack(arg_31_0, arg_31_1)
	assert(arg_31_0)
	assert(arg_31_0.flowManager)
	assert(arg_31_1)

	local var_31_0 = arg_31_0.flowManager

	var_31_0:closeAllMenus()

	local var_31_1, var_31_2 = loadstring(arg_31_1)

	if var_31_1 then
		local var_31_3, var_31_4 = pcall(var_31_1)

		for iter_31_0, iter_31_1 in ipairs(var_31_4) do
			local var_31_5 = iter_31_1.name

			assert(var_31_5)

			if FenceGroups[var_31_5] then
				iter_31_1.fenceGroup = LUI.FenceGroup.new(FenceGroups[var_31_5])
			end

			iter_31_1.scopedData = MakeScopedDataForMenuInfo(iter_31_1)

			var_31_0:PushMenuInfo(iter_31_1)
		end
	end

	arg_31_0:TryAddMouseCursor()
end

function IsMenuInStack(arg_32_0, arg_32_1)
	assert(arg_32_0)

	local var_32_0 = arg_32_0.flowManager

	if not var_32_0 then
		return false
	end

	return var_32_0:StackContains(arg_32_1)
end

function IsMenuOpenAndVisible(arg_33_0, arg_33_1)
	assert(arg_33_0)

	local var_33_0 = arg_33_0.flowManager

	if not var_33_0 then
		return false
	end

	if var_33_0.menuInfoStack then
		for iter_33_0, iter_33_1 in ipairs(var_33_0.menuInfoStack) do
			if iter_33_1.name == arg_33_1 and iter_33_1.menu ~= nil then
				return true
			end
		end
	end

	return false
end

function AnyActiveMenusInStack(arg_34_0)
	assert(arg_34_0)

	local var_34_0 = arg_34_0.flowManager

	if not var_34_0 then
		return false
	end

	if var_34_0.menuInfoStack then
		for iter_34_0, iter_34_1 in ipairs(var_34_0.menuInfoStack) do
			if iter_34_1.menu then
				return true
			end
		end
	end

	return false
end

function GetVisibleMenu(arg_35_0)
	assert(arg_35_0)

	local var_35_0 = arg_35_0.flowManager

	if not var_35_0 then
		return ""
	end

	if var_35_0.menuInfoStack then
		local var_35_1 = var_35_0.menuInfoStack[#var_35_0.menuInfoStack]

		if var_35_1 and var_35_1.menu then
			if var_35_1.menu.id then
				return var_35_1.menu.id
			end

			if var_35_1.menu.name then
				return var_35_1.menu.name
			end
		end
	end

	return ""
end

function GetAllMenuNames()
	local var_36_0 = Engine.DBFFAEEFGJ()

	assert(var_36_0)

	local var_36_1 = var_36_0.flowManager
	local var_36_2

	if var_36_1 and var_36_1.menuInfoStack then
		for iter_36_0 = #var_36_1.menuInfoStack, 1, -1 do
			local var_36_3 = var_36_1.menuInfoStack[iter_36_0].name

			if var_36_3 and var_36_3 ~= "" then
				var_36_2 = iter_36_0 == #var_36_1.menuInfoStack and var_36_3 or var_36_2 .. ";" .. var_36_3
			end
		end
	end

	return var_36_2
end

function GetLuiStreamerInfo(arg_37_0, arg_37_1)
	if arg_37_0 then
		local var_37_0 = arg_37_0:getFirstChild()

		while var_37_0 do
			local var_37_1 = var_37_0:getNextSibling()

			if var_37_0.isStreamer then
				arg_37_1.value = (var_37_0.id and #var_37_0.id > 0 and var_37_0.id or "") .. " " .. arg_37_1.value
			end

			GetLuiStreamerInfo(var_37_0, arg_37_1, ID)

			var_37_0 = var_37_1
		end
	end
end

function GetLuiImageStreamersInfo()
	local var_38_0 = Engine.DBFFAEEFGJ()

	assert(var_38_0)

	local var_38_1 = {
		value = ""
	}
	local var_38_2 = var_38_0.flowManager

	if var_38_2 and var_38_2.menuInfoStack then
		for iter_38_0 = #var_38_2.menuInfoStack, 1, -1 do
			local var_38_3 = var_38_2.menuInfoStack[iter_38_0]

			GetLuiStreamerInfo(var_38_3.menu, var_38_1)

			var_38_1.value = ";" .. var_38_3.name .. ": " .. var_38_1.value .. ";"
		end
	end

	return var_38_1.value
end

function PrintLuiStreamedImageInfo(arg_39_0, arg_39_1)
	if arg_39_0 then
		local var_39_0 = arg_39_0:getFirstChild()

		while var_39_0 do
			local var_39_1 = var_39_0:getNextSibling()

			if var_39_0.isStreamer then
				local var_39_2 = var_39_0.id and #var_39_0.id > 0 and var_39_0.id or ""

				if arg_39_1 == nil or arg_39_1 and var_39_2 == arg_39_1 then
					var_39_0:PrintStreamedImage()
				end
			end

			PrintLuiStreamedImageInfo(var_39_0, arg_39_1)

			var_39_0 = var_39_1
		end
	end
end

function GetLuiStreamedImageList(arg_40_0)
	local var_40_0 = Engine.DBFFAEEFGJ()

	assert(var_40_0)

	local var_40_1 = var_40_0:getFirstChild()

	while var_40_1 do
		var_40_1 = var_40_1:getNextSibling(), PrintLuiStreamedImageInfo(var_40_1, arg_40_0)
	end
end

function GetAttachmentsReference(arg_41_0)
	if CONDITIONS.InGame() then
		local var_41_0 = ""
		local var_41_1 = Game.EBGCIIBJHA(arg_41_0, true)

		if var_41_1 and #var_41_1 > 0 then
			for iter_41_0 = 1, #var_41_1 do
				if var_41_1[iter_41_0].ref then
					local var_41_2 = var_41_1[iter_41_0].ref
					local var_41_3 = var_41_1[iter_41_0].variantID

					if var_41_3 and var_41_3 > 0 then
						var_41_2 = var_41_2 .. "|" .. var_41_3
					end

					var_41_0 = var_41_0 ~= "" and var_41_0 .. ";" .. var_41_2 or var_41_2
				end
			end

			return var_41_0
		end
	end

	return ""
end

function GetFrontsceneWeaponModelName(arg_42_0)
	if Engine.DDJFBBJAIG() then
		local var_42_0 = arg_42_0.flowManager

		if var_42_0 and var_42_0.menuInfoStack then
			local var_42_1 = var_42_0.menuInfoStack[#var_42_0.menuInfoStack]

			if var_42_1 and var_42_1.menu and var_42_1.menu.id == "AttachmentSelect" then
				local var_42_2 = LUI.FlowManager.GetScopedData(var_42_1.menu)

				if var_42_2.loadoutIndex then
					local var_42_3 = ""
					local var_42_4 = PlayerData.BFFBGAJGD(Engine.IJEBHJIJF(), LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_42_2.loadoutIndex].weaponSetups[var_42_2.weaponSlot]
					local var_42_5 = WEAPON.GenerateWeaponTable(var_42_4)

					return (WEAPON.GetWeaponModelName(var_42_4.weapon:get(), var_42_5, {
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

function IsTopSignInMenu(arg_43_0)
	assert(arg_43_0)

	if not CONDITIONS.IsSplitScreenEnabled() then
		return false
	end

	local var_43_0 = arg_43_0.flowManager

	if not var_43_0 then
		return false
	end

	local var_43_1 = false

	if not LUI.UIRoot.IsButtonInputBlocked(arg_43_0) and var_43_0.menuInfoStack then
		local var_43_2 = var_43_0.menuInfoStack[#var_43_0.menuInfoStack]

		if var_43_2 and var_43_2.menu and var_43_2.menu.isSignInMenu then
			local var_43_3 = LUI.FlowManager.GetScopedData(var_43_2.menu)

			if var_43_3 and var_43_3.focusedPage and var_43_3.focusedPage > 2 then
				-- block empty
			else
				var_43_1 = true
			end
		end
	end

	return var_43_1
end

function CanSignoutSplitscreenPlayer(arg_44_0)
	assert(arg_44_0)

	local var_44_0 = arg_44_0.flowManager
	local var_44_1 = false

	if not LUI.UIRoot.IsButtonInputBlocked(arg_44_0) and var_44_0.menuInfoStack then
		local var_44_2 = var_44_0.menuInfoStack[#var_44_0.menuInfoStack]

		if var_44_2 and var_44_2.menu and var_44_2.menu.signoutSplitscreen ~= false then
			var_44_1 = true
		end
	end

	return var_44_1
end

function IsTopLocalSignInMenu(arg_45_0)
	return false
end

function LUI.FlowManager.closeAllMenusHandler(arg_46_0, arg_46_1)
	arg_46_0:closeAllMenus()
end

function LUI.FlowManager.restoreMenuHandler(arg_47_0, arg_47_1)
	arg_47_0:restoreMenu(arg_47_1)
	LUI.UIRoot.BlockButtonInput(arg_47_0.root, false, "RestoreMenuHandler")
end

function LUI.FlowManager.addMenuHandler(arg_48_0, arg_48_1)
	arg_48_0:addMenu(arg_48_1)
	LUI.UIRoot.BlockButtonInput(arg_48_0.root, false, "AddMenuHandler")
end

function LUI.FlowManager.popupMenuHandler(arg_49_0, arg_49_1)
	arg_49_1.isPopup = true

	arg_49_0:addMenuHandler(arg_49_1)
end

function LUI.FlowManager.leaveMenuHandler(arg_50_0, arg_50_1)
	arg_50_0:leaveMenu(arg_50_1)
	LUI.UIRoot.BlockButtonInput(arg_50_0.root, false, "leaveMenu")
end

function LUI.FlowManager.closeAllMenus(arg_51_0)
	for iter_51_0 = #arg_51_0.menuInfoStack, 1, -1 do
		local var_51_0 = arg_51_0.menuInfoStack[iter_51_0]

		if not AlwaysVisible[var_51_0.name] then
			arg_51_0:CloseMenuInfo(var_51_0, true, false)
			arg_51_0:RemoveMenuInfo(var_51_0)
		end
	end
end

function LUI.FlowManager.restoreMenu(arg_52_0, arg_52_1)
	local var_52_0

	if arg_52_1.menuId ~= nil then
		arg_52_1.menu = LUI.FlowManager.FlowMenus[arg_52_1.menuId]
	end

	if not arg_52_0.IsInStack(arg_52_1.menu) then
		arg_52_0:addMenu(arg_52_1)

		return
	end

	local var_52_1 = arg_52_0:GetStackTop()

	if var_52_1 and var_52_1.name == arg_52_1.menu then
		return
	end

	local var_52_2

	for iter_52_0 = #arg_52_0.menuInfoStack, 1, -1 do
		local var_52_3 = arg_52_0.menuInfoStack[iter_52_0]

		if not var_52_3.isModal then
			if var_52_3.name ~= arg_52_1.menu then
				arg_52_0:CloseMenuInfo(var_52_3, false, false)
				arg_52_0:RemoveMenuInfo(var_52_3)
			else
				break
			end
		end
	end

	arg_52_0:RefreshStack()
end

function LUI.FlowManager.addMenu(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.menu

	if arg_53_0:StackContains(var_53_0) then
		return
	end

	local var_53_1 = arg_53_0.menuInfoStack[#arg_53_0.menuInfoStack]

	if var_53_1 and arg_53_1.replaceTop then
		arg_53_0:CloseMenuInfo(var_53_1, false, false)
		arg_53_0:RemoveMenuInfo(var_53_1)
	end

	local var_53_2 = arg_53_0:CreateMenuInfo(var_53_0, arg_53_1.data, arg_53_1.exclusiveController, arg_53_1.controller)

	var_53_2.isPopup = arg_53_1.isPopup or arg_53_1.isModal
	var_53_2.isModal = arg_53_1.isModal

	arg_53_0:PushMenuInfo(var_53_2)
	arg_53_0:RefreshStack()
end

function LUI.FlowManager.leaveMenu(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0._controllerIndex or Engine.IJEBHJIJF()

	if arg_54_1.managerControllerIndex and var_54_0 ~= arg_54_1.managerControllerIndex then
		return
	end

	local var_54_1

	if arg_54_1.menuId ~= nil then
		arg_54_1.menu = LUI.FlowManager.FlowMenus[arg_54_1.menuId]
	end

	if arg_54_1.element or arg_54_1.menu then
		for iter_54_0 = #arg_54_0.menuInfoStack, 1, -1 do
			local var_54_2 = arg_54_0.menuInfoStack[iter_54_0]
			local var_54_3 = arg_54_1.element and arg_54_1.element:isDescendentOf(var_54_2.menu)
			local var_54_4 = arg_54_1.menu and var_54_2.name == arg_54_1.menu

			if var_54_3 or var_54_4 then
				var_54_1 = var_54_2

				break
			end
		end
	else
		var_54_1 = arg_54_0:GetStackTop()
	end

	if not var_54_1 then
		return
	end

	arg_54_0:CloseMenuInfo(var_54_1, false, false)
	arg_54_0:RemoveMenuInfo(var_54_1)

	if not var_54_1.isModal and not arg_54_1.blockSound then
		Engine.BJDBIAGIDA(CoD.SFX.SelectBack)
	end

	arg_54_0:RefreshStack()
end

function LUI.FlowManager.GetScopedDataFromElement(arg_55_0, arg_55_1)
	if arg_55_1._scoped then
		return arg_55_1._scoped
	end

	local var_55_0 = arg_55_1:getParent()

	if not var_55_0 then
		DebugPrint("Could not find scoped data for supplied LUI element, attempting to get scoped data from visible menu.")

		local var_55_1 = LUI.FlowManager.GetVisibleMenu()

		if var_55_1 then
			return arg_55_0:GetScopedDataFromElement(var_55_1)
		else
			assert(false, "Could not find scoped data for supplied LUI element and there is no visible menu.")
		end
	else
		return arg_55_0:GetScopedDataFromElement(var_55_0)
	end
end

function LUI.FlowManager.GetScopedDataFromMenuName(arg_56_0, arg_56_1)
	for iter_56_0 = #arg_56_0.menuInfoStack, 1, -1 do
		local var_56_0 = arg_56_0.menuInfoStack[iter_56_0]

		if var_56_0.name == arg_56_1 then
			return var_56_0.scopedData
		end
	end

	assert(false, "Could not find scoped data for menu named " .. arg_56_1 .. ".")
end

function CreateMenuInfoSaveData(arg_57_0)
	local var_57_0 = {}

	for iter_57_0, iter_57_1 in pairs(arg_57_0) do
		if iter_57_0 == "fenceGroup" or iter_57_0 == "scopedData" or iter_57_0 == "menu" then
			-- block empty
		else
			if iter_57_0 == "buildData" then
				for iter_57_2, iter_57_3 in pairs(iter_57_1) do
					if type(iter_57_3) == "table" and iter_57_3.__serializable == false then
						DebugPrint("WARNING: Not saving buildData field \"" .. tostring(iter_57_2) .. "\" for LUI Reload of menu \"" .. tostring(arg_57_0.name) .. "\"")

						iter_57_1[iter_57_2] = nil
					end
				end
			end

			var_57_0[iter_57_0] = iter_57_1
		end
	end

	return var_57_0
end

function MakeScopedDataForMenuInfo(arg_58_0)
	local var_58_0 = {
		menuName = arg_58_0.name
	}

	for iter_58_0, iter_58_1 in pairs(arg_58_0.buildData) do
		var_58_0[iter_58_0] = iter_58_1
	end

	if arg_58_0.controller then
		var_58_0.controllerIndex = arg_58_0.controller
		var_58_0.exclusiveController = arg_58_0.controller
		var_58_0.exclusiveControllerIndex = arg_58_0.controller
		var_58_0.isControllerExclusive = arg_58_0.isControllerExclusive
	end

	return var_58_0
end

function LUI.FlowManager.CreateMenuInfo(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4)
	local var_59_0 = arg_59_0
	local var_59_1 = {
		name = arg_59_1,
		buildData = arg_59_2 or {},
		controller = arg_59_4
	}

	if not Engine.DDJFBBJAIG() then
		var_59_1.controller = arg_59_0:getRootController()
	elseif not arg_59_4 then
		DebugPrint("Warning: opening menu \"" .. arg_59_1 .. "\" for unspecified controllerIndex, defaulting to 0")

		var_59_1.controller = 0
	end

	var_59_1.isControllerExclusive = arg_59_4 ~= nil and arg_59_3 == true
	var_59_1.scopedData = MakeScopedDataForMenuInfo(var_59_1)

	if FenceGroups[arg_59_1] then
		var_59_1.fenceGroup = LUI.FenceGroup.new(FenceGroups[arg_59_1], var_59_1.controller, var_59_1.buildData)

		function var_59_1.fenceGroup.OnPass(arg_60_0)
			return
		end

		function var_59_1.fenceGroup.OnBlock(arg_61_0)
			return
		end

		function var_59_1.fenceGroup.OnFail(arg_62_0)
			DebugPrint("Fencegroup failed for " .. arg_59_1)

			if var_59_0:StackContains(arg_59_1) then
				for iter_62_0 = #var_59_0.menuInfoStack, 1, -1 do
					local var_62_0 = var_59_0.menuInfoStack[iter_62_0]

					var_59_0:CloseMenuInfo(var_62_0, true, false)
					var_59_0:RemoveMenuInfo(var_62_0)

					if var_62_0.name == arg_59_1 then
						break
					end
				end
			else
				DebugPrint("WARNING: Attempted to fail fencegroup for " .. arg_59_1 .. " but " .. arg_59_1 .. " is not in the stack.")
			end
		end
	end

	return var_59_1
end

function LUI.FlowManager.OpenMenuInfo(arg_63_0, arg_63_1)
	if arg_63_1.opening then
		return
	end

	local var_63_0 = Engine.CFCAICIAJC()

	if Engine.DDJFBBJAIG() then
		PlayerData.DHIICCFFFD()
	end

	assert(not arg_63_1.menu)

	LUI.ActiveScoped = arg_63_1.scopedData
	arg_63_1.opening = true
	arg_63_1.menu = MenuBuilder.buildMenu(arg_63_1.name, arg_63_1.scopedData)
	arg_63_1.opening = false

	for iter_63_0, iter_63_1 in ipairs(arg_63_0.menuInfoStack) do
		if iter_63_1.menu then
			iter_63_1.menu:setPriority(iter_63_0)
		end
	end

	arg_63_0:addElement(arg_63_1.menu)
	arg_63_1.menu:processEvent({
		dispatchChildren = true,
		name = "menu_create",
		controller = arg_63_1.controller
	})
	assert(arg_63_1.menu)

	if not Engine.CGABICJHAI() and not Engine.BFIHBCBIHJ() and not DisableLetterbox[arg_63_1.name] then
		arg_63_1.menu:setupLetterboxElement()
	end

	LUI.ActiveScoped = nil

	local var_63_1 = Engine.CFCAICIAJC()

	if not Engine.CEJJDJJHIJ(0, "lua_menu_info", {
		completed_menu = true,
		menu_name = arg_63_1.name,
		memory_delta_bytes = var_63_1 - var_63_0,
		init_free_bytes = var_63_0,
		post_free_bytes = var_63_1,
		in_game = Engine.DDJFBBJAIG()
	}) then
		DebugPrint("Failed to write to blackbox")
	end

	arg_63_0:LogMenuChangeTo(arg_63_1.controller, arg_63_1.name)
end

function LUI.FlowManager.CloseMenuInfo(arg_64_0, arg_64_1, arg_64_2, arg_64_3)
	local var_64_0 = arg_64_0._controllerIndex or Engine.IJEBHJIJF()
	local var_64_1 = var_0_0(var_64_0)

	if not arg_64_3 then
		var_64_1[arg_64_1.name] = nil
	end

	if arg_64_1.menu then
		if arg_64_3 and not var_64_1[arg_64_1.name] then
			var_64_1[arg_64_1.name] = arg_64_1.menu:saveState()
		end

		if not arg_64_2 then
			arg_64_1.menu:processEvent({
				name = "lose_focus"
			})
			arg_64_1.menu:processEvent({
				dispatchChildren = true,
				name = "menu_close",
				controller = arg_64_1.controller
			})
		else
			arg_64_1.menu:processEvent({
				dispatchChildren = true,
				name = "menu_close_all",
				controller = arg_64_1.controller
			})
		end

		arg_64_1.menu:closeTree()

		arg_64_1.menu = nil
	end
end

function LUI.FlowManager.GetStackVersion(arg_65_0)
	assert(arg_65_0.stackVersion)

	return arg_65_0.stackVersion
end

function LUI.FlowManager.InsertMenuInfo(arg_66_0, arg_66_1, arg_66_2)
	assert(arg_66_2)

	arg_66_0.stackVersion = arg_66_0.stackVersion + 1

	table.insert(arg_66_0.menuInfoStack, arg_66_1, arg_66_2)

	if PushAndPopsTable[arg_66_2.name] and PushAndPopsTable[arg_66_2.name].pushFuncs and #PushAndPopsTable[arg_66_2.name].pushFuncs > 0 then
		for iter_66_0, iter_66_1 in ipairs(PushAndPopsTable[arg_66_2.name].pushFuncs) do
			iter_66_1()
		end
	end

	Engine.DHFEGHHHFH(true)

	if #arg_66_0.menuInfoStack == 1 then
		arg_66_0.root:processEvent({
			name = "non_empty_menu_stack",
			controllerIndex = arg_66_0._controllerIndex
		})
	end

	if Engine.BHICADFIHA() then
		arg_66_0:PrintStack()
	end
end

function LUI.FlowManager.RemoveMenuInfo(arg_67_0, arg_67_1)
	assert(arg_67_1)

	local var_67_0
	local var_67_1 = #arg_67_0.menuInfoStack

	while var_67_1 >= 1 and arg_67_0.menuInfoStack[var_67_1] ~= arg_67_1 do
		var_67_1 = var_67_1 - 1
	end

	if var_67_1 >= 1 then
		if arg_67_1.fenceGroup then
			arg_67_1.fenceGroup:Abort()
		end

		if PushAndPopsTable[arg_67_1.name] and PushAndPopsTable[arg_67_1.name].popFuncs and #PushAndPopsTable[arg_67_1.name].popFuncs > 0 then
			for iter_67_0, iter_67_1 in ipairs(PushAndPopsTable[arg_67_1.name].popFuncs) do
				iter_67_1()
			end
		end

		arg_67_0.stackVersion = arg_67_0.stackVersion + 1

		table.remove(arg_67_0.menuInfoStack, var_67_1)
	end

	if #arg_67_0.menuInfoStack == 0 then
		if Engine.CAADCDEEIA() and not Engine.DDJFBBJAIG() then
			ACTIONS.ResumeGame(arg_67_0)
		end

		arg_67_0.root:processEvent({
			name = "empty_menu_stack",
			controllerIndex = arg_67_0._controllerIndex
		})
		arg_67_0.root:RemoveMouseCursor()
	end

	if Engine.BHICADFIHA() then
		arg_67_0:PrintStack()
	end

	Engine.DHFEGHHHFH(#arg_67_0.menuInfoStack > 0)
end

function LUI.FlowManager.PushMenuInfo(arg_68_0, arg_68_1)
	arg_68_0:SetStack(arg_68_1)

	if arg_68_1.isModal then
		arg_68_0:InsertMenuInfo(#arg_68_0.menuInfoStack + 1, arg_68_1)
	else
		local var_68_0 = #arg_68_0.menuInfoStack + 1

		while var_68_0 > 1 and arg_68_0.menuInfoStack[var_68_0 - 1].isModal do
			var_68_0 = var_68_0 - 1
		end

		arg_68_0:InsertMenuInfo(var_68_0, arg_68_1)
	end
end

function LUI.FlowManager.SetStack(arg_69_0, arg_69_1)
	assert(arg_69_1.name)

	local var_69_0 = PresetStacks[arg_69_1.name]

	if not var_69_0 then
		return
	end

	local var_69_1 = arg_69_1.controller

	DebugPrint("FlowManager: Rewriting menu stack for " .. arg_69_1.name)

	if Engine.BHICADFIHA() then
		local var_69_2 = ""

		for iter_69_0, iter_69_1 in ipairs(arg_69_0.menuInfoStack) do
			var_69_2 = var_69_2 .. (iter_69_0 > 1 and " > " or "") .. iter_69_1.name
		end

		DebugPrint("    Current stack: " .. var_69_2)

		local var_69_3 = ""

		for iter_69_2, iter_69_3 in ipairs(var_69_0) do
			var_69_3 = var_69_3 .. (iter_69_2 > 1 and " > " or "") .. iter_69_3.name
		end

		DebugPrint("    Requesting: " .. var_69_3 .. " > " .. arg_69_1.name)
	end

	for iter_69_4, iter_69_5 in ipairs(arg_69_0.menuInfoStack) do
		if iter_69_4 > #var_69_0 or iter_69_5.name ~= var_69_0[iter_69_4].name then
			for iter_69_6 = #arg_69_0.menuInfoStack, iter_69_4, -1 do
				local var_69_4 = arg_69_0.menuInfoStack[iter_69_6]

				if not var_69_4.isModal then
					arg_69_0:CloseMenuInfo(var_69_4)
					arg_69_0:RemoveMenuInfo(var_69_4)
				end
			end
		end
	end

	for iter_69_7, iter_69_8 in ipairs(var_69_0) do
		if iter_69_7 > #arg_69_0.menuInfoStack or iter_69_8.name ~= arg_69_0.menuInfoStack[iter_69_7].name then
			local var_69_5 = arg_69_0:CreateMenuInfo(iter_69_8.name, nil, iter_69_8.exclusiveController, var_69_1)

			arg_69_0:PushMenuInfo(var_69_5)
		end
	end

	DebugPrint("Set stack complete")
end

function LUI.FlowManager.PrintStack(arg_70_0)
	DebugPrint("----MENU STACK TOP----")

	for iter_70_0 = #arg_70_0.menuInfoStack, 1, -1 do
		local var_70_0 = arg_70_0.menuInfoStack[iter_70_0]
		local var_70_1 = var_70_0.menu and "Opened" or "Closed"

		DebugPrint(iter_70_0 .. ") " .. var_70_0.name .. " (" .. var_70_1 .. ")")
	end

	DebugPrint("---MENU STACK BOTTOM---")
end

function LUI.FlowManager.StackContains(arg_71_0, arg_71_1)
	for iter_71_0, iter_71_1 in ipairs(arg_71_0.menuInfoStack) do
		if iter_71_1.name == arg_71_1 then
			return true
		end
	end

	return false
end

function LUI.FlowManager.StackContainsAny(arg_72_0, arg_72_1)
	for iter_72_0, iter_72_1 in ipairs(arg_72_0.menuInfoStack) do
		for iter_72_2, iter_72_3 in pairs(arg_72_1) do
			if iter_72_1.name == iter_72_3 then
				return true
			end
		end
	end

	return false
end

function LUI.FlowManager.GetStackTop(arg_73_0, arg_73_1)
	local var_73_0 = #arg_73_0.menuInfoStack

	if not arg_73_1 then
		while var_73_0 >= 1 and arg_73_0.menuInfoStack[var_73_0].isModal do
			var_73_0 = var_73_0 - 1
		end
	end

	if var_73_0 >= 1 then
		return arg_73_0.menuInfoStack[var_73_0]
	end

	return nil
end

function LUI.FlowManager.GetTopMostOpenMenuInfo(arg_74_0)
	local var_74_0 = #arg_74_0.menuInfoStack

	while var_74_0 >= 1 and not arg_74_0.menuInfoStack[var_74_0].menu do
		var_74_0 = var_74_0 - 1
	end

	if var_74_0 >= 1 then
		return arg_74_0.menuInfoStack[var_74_0]
	end

	return nil
end

function LUI.FlowManager.IsStackEmpty(arg_75_0)
	return #arg_75_0.menuInfoStack == 0
end

function LUI.FlowManager.AreMainMenuFencedOut(arg_76_0)
	for iter_76_0, iter_76_1 in ipairs(arg_76_0.menuInfoStack) do
		if (iter_76_1.name == "MainMenuOffline" or iter_76_1.name == "MainMenu") and iter_76_1.fenced then
			return true
		end
	end

	return false
end

local function var_0_1(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = false

	while not var_77_0 do
		local var_77_1 = arg_77_0:GetStackTop(true)

		if var_77_1 then
			local var_77_2 = var_77_1.name

			var_77_0 = var_77_2 == arg_77_2

			LUI.FlowManager.RequestLeaveMenuByName(var_77_2, true, true)
		else
			break
		end
	end
end

local function var_0_2(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_0:GetStackTop(true)

	return var_78_0 and var_78_0.name == arg_78_1
end

local function var_0_3(arg_79_0, arg_79_1)
	local var_79_0 = Engine.DBFFAEEFGJ()

	assert(var_79_0)

	if IsMenuInStack(var_79_0, "OptionsMenuNewLayout") then
		arg_79_0:dispatchEventToRoot({
			name = "closing_quick_access_menu",
			controllerIndex = arg_79_1.controller
		})

		if not var_0_2(arg_79_0, "OptionsMenuNewLayout") then
			var_0_1(arg_79_0, arg_79_1, "OptionsMenuNewLayout")
		end
	elseif not OSK.FCIEJBIHA() then
		arg_79_0:dispatchEventToRoot({
			immediate = true,
			name = "opening_quick_access_menu"
		})

		if IsMenuInStack(var_79_0, "SocialMenu") then
			var_0_1(arg_79_0, arg_79_1, "SocialMenu")
		end

		ACTIONS.OpenOptionsMenu(arg_79_1.controller, nil, true)

		if Engine.CAADCDEEIA() and CONDITIONS.InGame() then
			GAME.PauseGame()
		end
	end

	return true
end

local function var_0_4(arg_80_0, arg_80_1)
	local var_80_0 = Engine.DBFFAEEFGJ()

	assert(var_80_0)

	if Engine.CDCCDDJAJJ(arg_80_1.controller) then
		if CONDITIONS.InGame() then
			if IsMenuInStack(var_80_0, "ManagePartyPopup") then
				arg_80_0:dispatchEventToRoot({
					name = "closing_quick_access_menu"
				})
			else
				local var_80_1 = arg_80_1.qualifier == "keyboard"

				LUI.FlowManager.RequestSocialPopup(var_80_1)
			end
		elseif CONDITIONS.IsSocialEnabledInMainMenu(arg_80_0) then
			if IsMenuInStack(var_80_0, "SocialMenu") then
				arg_80_0:dispatchEventToRoot({
					name = "closing_quick_access_menu",
					controllerIndex = arg_80_1.controller
				})
				var_0_1(arg_80_0, arg_80_1, "SocialMenu")
			elseif not OSK.FCIEJBIHA() then
				arg_80_0:dispatchEventToRoot({
					immediate = true,
					name = "opening_quick_access_menu"
				})

				if IsMenuInStack(var_80_0, "OptionsMenuNewLayout") then
					var_0_1(arg_80_0, arg_80_1, "OptionsMenuNewLayout")
				end

				local var_80_2 = true

				FRIENDS.OpenFriendsList(arg_80_1.controller, var_80_2)
			end
		end

		return true
	else
		return false
	end
end

local function var_0_5(arg_81_0, arg_81_1)
	local var_81_0 = Dvar.IBEGCHEFE("LMSLNRLNOT")

	Dvar.DHEGHJJJHI("LMSLNRLNOT", not var_81_0)

	return true
end

local function var_0_6(arg_82_0, arg_82_1)
	local var_82_0 = Dvar.IBEGCHEFE("LOOTLTLRNN")

	Dvar.DHEGHJJJHI("LOOTLTLRNN", not var_82_0)

	return true
end

local function var_0_7(arg_83_0, arg_83_1)
	if arg_83_1 == "quick_social" or arg_83_1 == "quick_options" then
		local var_83_0 = arg_83_0:GetTopMostOpenMenuInfo()

		if var_83_0 and var_83_0.menu and var_83_0.menu.isQuickAccessShortcutsDisabled then
			return false
		end
	end

	if arg_83_1 == "quick_social" and (LUI.FlowManager.IsInStack("MainMenuOffline") or CONDITIONS.IsLaunchChunk() or Engine.CAADCDEEIA()) then
		return false
	end

	return true
end

local function var_0_8(arg_84_0, arg_84_1)
	if arg_84_1.down and var_0_7(arg_84_0, arg_84_1.button) then
		if arg_84_1.button == "mute_sound" then
			return var_0_5(arg_84_0, arg_84_1)
		elseif arg_84_1.button == "mute_voicechat" then
			return var_0_6(arg_84_0, arg_84_1)
		elseif arg_84_1.button == "accept_notification" then
			arg_84_0:dispatchEventToRoot({
				answer = true,
				name = "kbm_notification_prompt_answer"
			})
		elseif arg_84_1.button == "decline_notification" then
			arg_84_0:dispatchEventToRoot({
				answer = false,
				name = "kbm_notification_prompt_answer"
			})
		elseif arg_84_1.button == "quick_options" then
			return var_0_3(arg_84_0, arg_84_1)
		elseif arg_84_1.button == "quick_social" then
			return var_0_4(arg_84_0, arg_84_1)
		end
	end

	return false
end

function LUI.FlowManager.LeaveQuickMenus()
	local var_85_0 = Engine.DBFFAEEFGJ()

	var_85_0:dispatchEventToRoot({
		name = "closing_quick_access_menu"
	})

	if LUI.FlowManager.IsInStack("SocialMenu") then
		var_0_1(var_85_0.flowManager, nil, "SocialMenu")
	end

	if LUI.FlowManager.IsInStack("OptionsMenuNewLayout") then
		var_0_1(var_85_0.flowManager, nil, "OptionsMenuNewLayout")
	end
end

function LUI.FlowManager.init(arg_86_0, arg_86_1, arg_86_2)
	LUI.UIElement.init(arg_86_0)

	arg_86_0.id = "flowManager"
	arg_86_0.root = arg_86_1
	arg_86_0._controllerIndex = arg_86_2
	arg_86_0.menuInfoStack = {}
	arg_86_0.stackVersion = 0
	arg_86_0.stackChangeTime = Engine.BFBIDEGDFB()
	arg_86_0.stackChangeMenu = 0
	arg_86_0.isPartyUIRootDirty = false

	arg_86_0:registerEventHandler("gamepad_button", function(arg_87_0, arg_87_1)
		if var_0_8(arg_87_0, arg_87_1) then
			return true
		end

		local var_87_0 = arg_86_0:GetTopMostOpenMenuInfo()

		if var_87_0 and (not var_87_0.controller or not arg_87_1.controller or var_87_0.controller == arg_87_1.controller or not var_87_0.isControllerExclusive) then
			return arg_87_0:ForwardEventToTopMostOpenMenu(arg_87_1)
		end

		return false
	end)

	if Engine.EABCCIBFIG() then
		arg_86_0:registerEventHandler("mousemove", arg_86_0.ForwardMouseEventToTopMostOpenMenu)
		arg_86_0:registerEventHandler("mousedown", arg_86_0.ForwardMouseEventToTopMostOpenMenu)
		arg_86_0:registerEventHandler("mouseup", arg_86_0.ForwardMouseEventToTopMostOpenMenu)
	end

	arg_86_0:registerEventHandler("addmenu", arg_86_0.addMenuHandler)
	arg_86_0:registerEventHandler("popupmenu", arg_86_0.popupMenuHandler)
	arg_86_0:registerEventHandler("leavemenu", arg_86_0.leaveMenuHandler)
	arg_86_0:registerEventHandler("restoreMenu", arg_86_0.restoreMenuHandler)
	arg_86_0:registerEventHandler("closeallmenus", arg_86_0.closeAllMenusHandler)

	if Engine.EAAHGICFBD() and not Engine.DDJFBBJAIG() then
		arg_86_0:registerOmnvarHandler("ui_options_menu", function(arg_88_0, arg_88_1)
			arg_88_0:OpenMenuByScriptRequest(arg_88_1.value)
		end)
		arg_86_0:OpenMenuByScriptRequest(Game.BFEEGCHICA(arg_86_2, "ui_options_menu"))
	end
end

function LUI.FlowManager.GetGamemodeForUIRoot(arg_89_0)
	if arg_89_0 > PartyUIRoot.GAMEMODE_NONE_MENUS_START and arg_89_0 < PartyUIRoot.GAMEMODE_NONE_MENUS_END then
		return CoD.PlayMode.None
	elseif arg_89_0 > PartyUIRoot.GAMEMODE_MP_MENUS_START and arg_89_0 < PartyUIRoot.GAMEMODE_MP_MENUS_END then
		return CoD.PlayMode.Core
	elseif arg_89_0 > PartyUIRoot.GAMEMODE_CP_MENUS_START and arg_89_0 < PartyUIRoot.GAMEMODE_CP_MENUS_END then
		return CoD.PlayMode.Aliens
	elseif arg_89_0 > PartyUIRoot.GAMEMODE_WZ_MENUS_START and arg_89_0 < PartyUIRoot.GAMEMODE_WZ_MENUS_END then
		return CoD.PlayMode.Core
	else
		assert("LUI.FlowManager.GetGamemodeForUIRoot invalid ui root " .. tostring(arg_89_0))
	end
end

function LUI.FlowManager.IsUIRootBRGamemode(arg_90_0)
	return arg_90_0 >= BR_MENUS_START and arg_90_0 <= BR_MENUS_END or arg_90_0 > PartyUIRoot.GAMEMODE_WZ_MENUS_START and arg_90_0 < PartyUIRoot.GAMEMODE_WZ_MENUS_END
end

function LUI.FlowManager.AutomaticNavigationFrame(arg_91_0)
	local var_91_0 = PartyUIRoot.FREE
	local var_91_1 = false
	local var_91_2 = false
	local var_91_3 = false
	local var_91_4 = false
	local var_91_5 = arg_91_0._controllerIndex or Engine.IJEBHJIJF()

	if arg_91_0.isPartyUIRootDirty then
		var_91_0 = Lobby.CGEIEECJJH()
	else
		local var_91_6 = Tournament.DEHIAGCHBD()
		local var_91_7 = MLG.DEHIAGCHBD()

		if var_91_6 ~= PartyUIRoot.FREE then
			var_91_0 = var_91_6
			var_91_1 = true
			var_91_3 = true
			var_91_4 = true
		elseif var_91_7 ~= PartyUIRoot.FREE then
			var_91_0 = var_91_7
			var_91_2 = true
			var_91_3 = true
			var_91_4 = false
		end
	end

	if var_91_0 ~= PartyUIRoot.FREE then
		if Friends.GHGFJIJBI() or not Engine.CFHBIHABCB(var_91_5) or not Engine.CGJEJFBEAG(var_91_5) or CONDITIONS.IsMagmaGameMode() then
			if var_91_0 == PartyUIRoot.MP_PUBLIC_MATCH_LOBBY then
				var_91_0 = PartyUIRoot.BATTLE_ROYALE_MENU_PUBLIC_LOBBY
			elseif var_91_0 == PartyUIRoot.MP_MAIN_MENU then
				var_91_0 = PartyUIRoot.BR_MAIN_MENU
			elseif var_91_0 == PartyUIRoot.TOURNAMENT_LOADING or var_91_0 == PartyUIRoot.TOURNAMENT_MATCHMAKING or var_91_0 == PartyUIRoot.TOURNAMENT_BRACKET then
				var_91_0 = TOURNAMENT.GetUIRootForF2PFromPremiumIfF2PAllowed(var_91_0)
			end
		end

		local var_91_8 = arg_91_0:DoAutomaticNavigation(var_91_0, var_91_3, var_91_4)

		if var_91_8 and var_91_1 then
			Tournament.CJAJGICGJB()
		elseif var_91_8 and var_91_2 then
			MLG.CJAJGICGJB()

			if Dvar.IBEGCHEFE("LPQQSRQSMO") then
				GAMEBATTLES.ShowFenceToRefreshSchedule()
			end
		elseif not var_91_8 then
			LUI.MouseCursorContextualMenuLayer.ForceCloseContextualMenu()
		end
	end
end

function LUI.FlowManager.DoAutomaticNavigation(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	if Engine.DHEJECBEE() then
		END_GAME.StopServerAndLeave(arg_92_0)

		return false
	end

	if not Engine.DDJFBBJAIG() then
		return false
	end

	if Lobby.BJEABAEHDE() then
		return false
	end

	if arg_92_2 and Lobby.BBDICGHE() then
		if IsPrivateMatch() then
			Lobby.LeaveCustomGameLobby()
		elseif IsPublicMatch() then
			Lobby.LeavePublicLobby()
		end

		return false
	end

	local var_92_0 = Engine.IJEBHJIJF()

	if arg_92_2 and IsSystemLink() then
		Engine.DAGFFDGFII("xstopprivateparty 0", var_92_0)
		Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)

		return false
	end

	if arg_92_3 and not Lobby.GFFECBCCF() then
		Engine.EBIDFIDHIE("xstartprivateparty")

		return false
	end

	local var_92_1 = Engine.DGEFGAJIB()
	local var_92_2 = LUI.FlowManager.GetGamemodeForUIRoot(arg_92_1)
	local var_92_3 = CONDITIONS.IsMagmaGameMode() ~= LUI.FlowManager.IsUIRootBRGamemode(arg_92_1)

	if (var_92_1 ~= var_92_2 or var_92_3) and var_92_1 ~= CoD.PlayMode.None then
		local var_92_4 = Engine.IJEBHJIJF()

		arg_92_0:closeAllMenus()
		arg_92_0:addMenu({
			menu = LUI.FlowManager.FlowMenus[PartyUIRoot.MAIN_MENU],
			controller = var_92_4
		})

		return false
	end

	local var_92_5 = LUI.FlowManager.FlowMenus[arg_92_1]

	if not var_92_5 then
		return true
	end

	for iter_92_0, iter_92_1 in pairs(IgnoreFollowHostCallbacks) do
		if arg_92_0:StackContains(iter_92_0) and iter_92_1(var_92_5) then
			return true
		end
	end

	local var_92_6 = arg_92_0:StackContains(var_92_5)
	local var_92_7 = false

	for iter_92_2 = arg_92_1 + 1, PartyUIRoot.LAST do
		local var_92_8 = LUI.FlowManager.FlowMenus[iter_92_2]

		if arg_92_0:StackContains(var_92_8) then
			var_92_7 = true

			break
		end
	end

	if var_92_6 and not var_92_7 then
		arg_92_0.isPartyUIRootDirty = false

		return true
	end

	DebugPrint("LUI.FlowManager.FollowPartyHost to " .. var_92_5)
	arg_92_0:closeAllMenus()
	arg_92_0:addMenu({
		menu = var_92_5,
		controller = var_92_0
	})

	return false
end

function LUI.FlowManager.OpenMenuByScriptRequest(arg_93_0, arg_93_1)
	assert(Engine.EAAHGICFBD())

	if not Game.HJHDJDCBF() then
		return
	end

	local var_93_0

	local function var_93_1(arg_94_0)
		arg_93_0:Wait(16).onComplete = function()
			if arg_93_0.root.loadingScreenManager and arg_93_0.root.loadingScreenManager:ShouldBeVisible() then
				var_93_1(arg_94_0)
			else
				arg_94_0()
			end
		end
	end

	local var_93_2 = ({
		"TeamSelectMenu",
		"LoadoutSelect",
		"LaunchChunkNewPhasePopup"
	})[arg_93_1]

	if var_93_2 then
		local var_93_3 = arg_93_0.root:GetControllerIndex()

		var_93_1(function()
			LUI.FlowManager.RequestAddMenu(var_93_2, true, var_93_3, false, {
				openedFromScriptRequest = true
			}, true)

			if var_93_2 ~= "LaunchChunkNewPhasePopup" then
				if CONDITIONS.IsMagmaGameMode() then
					LUI.FlowManager.RequestSetStack(var_93_2, {
						{
							name = "BrPauseMenu"
						}
					})
				else
					LUI.FlowManager.RequestSetStack(var_93_2, {
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

function LUI.FlowManager.ShouldBeVisible(arg_97_0)
	return Engine.DDJFBBJAIG() or Game.HJHDJDCBF()
end

function LUI.FlowManager.LogMenuChangeTo(arg_98_0, arg_98_1, arg_98_2)
	if arg_98_0.stackChangeMenu ~= arg_98_2 then
		local var_98_0 = Engine.BFBIDEGDFB()
		local var_98_1 = var_98_0 - arg_98_0.stackChangeTime

		if arg_98_0.stackChangeMenu ~= 0 then
			Engine.BHCDIBBGGB(arg_98_1, arg_98_0.stackChangeMenu, arg_98_2, var_98_1)
		end

		arg_98_0.stackChangeMenu = arg_98_2
		arg_98_0.stackChangeTime = var_98_0
	end
end

function LUI.FlowManager.Frame(arg_99_0)
	arg_99_0:RefreshStack()
	arg_99_0:AutomaticNavigationFrame()
end

function LUI.FlowManager.InitLayer(arg_100_0)
	if Engine.DDJFBBJAIG() and not arg_100_0._partyRootSubscription then
		local var_100_0 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.partyUIRoot"):GetModel(0)

		arg_100_0._partyRootSubscription = arg_100_0:SubscribeToModel(var_100_0, function(arg_101_0)
			if Lobby.CGEIEECJJH() > PartyUIRoot.FREE then
				arg_100_0.isPartyUIRootDirty = true
			end
		end)
	end
end

function LUI.FlowManager.ClearLayer(arg_102_0)
	arg_102_0:closeAllMenus()

	if arg_102_0._partyRootSubscription then
		arg_102_0:UnsubscribeFromModel(arg_102_0._partyRootSubscription)

		arg_102_0._partyRootSubscription = nil
	end
end

function LUI.FlowManager.RefreshStack(arg_103_0)
	if #arg_103_0.menuInfoStack == 0 then
		return
	end

	for iter_103_0, iter_103_1 in ipairs(arg_103_0.menuInfoStack) do
		if iter_103_1.fenceGroup then
			iter_103_1.fenceGroup:Frame()
		end

		iter_103_1.fenced = iter_103_1.fenceGroup and not iter_103_1.fenceGroup:Passes()

		if iter_103_1.fenced then
			for iter_103_2 = iter_103_0 + 1, #arg_103_0.menuInfoStack do
				local var_103_0 = arg_103_0.menuInfoStack[iter_103_2]

				if var_103_0 then
					local var_103_1 = var_103_0.fenceGroup

					if var_103_1 then
						var_103_1:Reset()
					end
				end
			end

			break
		end
	end

	local var_103_2 = #arg_103_0.menuInfoStack

	for iter_103_3, iter_103_4 in ipairs(arg_103_0.menuInfoStack) do
		if iter_103_4.fenced then
			var_103_2 = iter_103_3 - 1

			break
		end
	end

	local var_103_3 = 1

	for iter_103_5, iter_103_6 in ipairs(arg_103_0.menuInfoStack) do
		if not iter_103_6.isPopup and (iter_103_6.menu or iter_103_5 <= var_103_2) then
			assert(iter_103_6.menu or not iter_103_6.fenced)

			var_103_3 = iter_103_5
		end
	end

	local var_103_4 = arg_103_0:GetStackVersion()

	for iter_103_7, iter_103_8 in ipairs(arg_103_0.menuInfoStack) do
		if var_103_4 ~= arg_103_0:GetStackVersion() then
			return arg_103_0:RefreshStack()
		end

		if iter_103_7 < var_103_3 then
			if iter_103_8.menu and not AlwaysVisible[iter_103_8.name] then
				arg_103_0:CloseMenuInfo(iter_103_8, false, true)
			end
		elseif not iter_103_8.menu and (iter_103_7 <= var_103_2 or iter_103_8.isModal) then
			assert(not iter_103_8.fenced)
			Engine.BHFFIBEFFH("(FlowManager OpenMenuInfo) " .. iter_103_8.name, "widget")
			arg_103_0:OpenMenuInfo(iter_103_8)
			Engine.DCHDDCJCEG("(FlowManager OpenMenuInfo) " .. iter_103_8.name, "widget")
		end
	end

	local var_103_5 = arg_103_0._controllerIndex or Engine.IJEBHJIJF()
	local var_103_6 = var_0_0(var_103_5)

	for iter_103_9, iter_103_10 in ipairs(arg_103_0.menuInfoStack) do
		local var_103_7 = iter_103_10.onTop == true

		iter_103_10.onTop = iter_103_10.menu and iter_103_9 == #arg_103_0.menuInfoStack

		local var_103_8 = iter_103_9 <= var_103_2 and var_103_2 < #arg_103_0.menuInfoStack

		if iter_103_10.menu then
			if iter_103_10.onTop then
				if iter_103_10.menu.popupActive then
					iter_103_10.menu:processEvent({
						dispatchChildren = true,
						name = "popup_inactive"
					})

					iter_103_10.menu.popupActive = nil
				end

				if not var_103_7 then
					if DisableMousePointer[iter_103_10.name] then
						arg_103_0.root:RemoveMouseCursor()
					else
						arg_103_0.root:TryAddMouseCursor()
					end

					local var_103_9 = var_103_6[iter_103_10.name]
					local var_103_10, var_103_11 = iter_103_10.menu:restoreState(var_103_9, iter_103_10.controller)

					if not LUI.IsLastInputMouseNavigation(iter_103_10.controller) then
						if not var_103_10 or var_103_11 == 0 then
							Engine.BHFFIBEFFH("(FlowManager gain_focus) " .. iter_103_10.name, "widget")
							iter_103_10.menu:processEvent({
								name = "gain_focus",
								controller = iter_103_10.controller,
								focusType = FocusType.MenuFlow
							})
							Engine.DCHDDCJCEG("(FlowManager gain_focus) " .. iter_103_10.name, "widget")
						end
					else
						Engine.HJJJIGAC(iter_103_10.controller)
						LUI.MouseCursorTooltipLayer.ForceCloseTooltip(iter_103_10.controller)
					end

					LUI.MouseCursorContextualMenuLayer.ForceCloseContextualMenu()

					var_103_6[iter_103_10.name] = nil
				end
			else
				if var_103_7 then
					var_103_6[iter_103_10.name] = iter_103_10.menu:saveState()

					iter_103_10.menu:processEvent({
						name = "lose_focus"
					})
					iter_103_10.menu:processEvent({
						dispatchChildren = true,
						name = "popup_active"
					})
				end

				iter_103_10.menu.popupActive = true
			end

			if iter_103_10.menu.isBelowBlockingFence ~= var_103_8 then
				iter_103_10.menu.isBelowBlockingFence = var_103_8

				if var_103_8 then
					iter_103_10.menu:processEvent({
						name = "below_blocking_fence"
					})
				else
					iter_103_10.menu:processEvent({
						name = "not_below_blocking_fence"
					})
				end
			end
		end
	end
end

function LUI.FlowManager.processEvent(arg_104_0, arg_104_1)
	local var_104_0
	local var_104_1 = arg_104_0.m_eventHandlers[arg_104_1.name]

	if var_104_1 then
		var_104_0 = var_104_1(arg_104_0, arg_104_1)
	else
		var_104_0 = LUI.UIElement.processEvent(arg_104_0, arg_104_1)
	end

	if not var_104_0 and arg_104_0.IsNavigationEvent(arg_104_1) then
		arg_104_0:EnsureFocus()
	end

	return var_104_0
end

function LUI.FlowManager.EnsureFocus(arg_105_0)
	local var_105_0 = arg_105_0.menuInfoStack[#arg_105_0.menuInfoStack]

	if var_105_0 and var_105_0.menu and not var_105_0.menu:getFirstInFocus() then
		DebugPrint("FlowManager: No child in focus, trying to restore focus.  This should probably only happen when using a mouse")

		local var_105_1 = LUI.FlowManager.GetScopedData(var_105_0.menu).controllerIndex

		var_105_0.menu:processEvent({
			name = "gain_focus",
			controller = var_105_1
		})
		DebugPrint("CheckRestoreFocus to " .. var_105_0.name)
	end
end

function LUI.FlowManager.ForwardEventToTopMostOpenMenu(arg_106_0, arg_106_1)
	local var_106_0 = arg_106_0:GetTopMostOpenMenuInfo()

	if var_106_0 then
		return var_106_0.menu:processEvent(arg_106_1)
	end

	return false
end

function LUI.FlowManager.ForwardMouseEventToTopMostOpenMenu(arg_107_0, arg_107_1)
	arg_107_0:applyElementTransform()

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.StartFocusChain(arg_107_0)
	end

	local var_107_0 = arg_107_0:ForwardEventToTopMostOpenMenu(arg_107_1)

	arg_107_0:undoElementTransform()

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.EndFocusChain(arg_107_0)
	end

	if arg_107_1.name == "mousemove" then
		return true
	else
		return var_107_0
	end
end

function LUI.FlowManager.IsNavigationEvent(arg_108_0)
	if arg_108_0.name == "gamepad_button" and arg_108_0.down and arg_108_0.qualifier ~= "mousewheel" and (arg_108_0.button == "up" or arg_108_0.button == "down" or arg_108_0.button == "left" or arg_108_0.button == "right") then
		return true
	end

	return false
end
