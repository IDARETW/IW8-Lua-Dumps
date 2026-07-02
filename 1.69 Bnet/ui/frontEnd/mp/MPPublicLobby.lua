module(..., package.seeall)
LUI.FlowManager.RequestSetStack("MPPublicLobby", {
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
MenuBuilder.registerType("BRPublicLobby", function(...)
	return MPPublicLobby(...)
end)
LUI.FlowManager.RequestSetStack("BRPublicLobby", {
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

local function var_0_0()
	if Dvar.CFHDGABACF("MKOTKLQOLM") == 1 then
		Dvar.DHEGHJJJHI("NOPSSNSOMP", false)
	end
end

local function var_0_1()
	return
end

LUI.FlowManager.RegisterStackPushBehaviour("BRPublicLobby", var_0_1)

local function var_0_2(arg_4_0)
	local var_4_0 = Engine.BFJBEHGGCH()
	local var_4_1 = arg_4_0.MPTabsMenu.Nat

	if var_4_0 and var_4_1 then
		var_4_1:SetRGBFromTable(COLORS.white)
	end
end

local function var_0_3(arg_5_0)
	if arg_5_0._challengesPromptInWidget and arg_5_0:GetCurrentMenu() then
		arg_5_0:GetCurrentMenu():AddButtonHelperText({
			button_ref = "button_alt1",
			helper_text = "",
			container = arg_5_0._challengesPrompt
		})

		arg_5_0._challengesPromptInWidget = false

		return true
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0 and arg_6_0:GetCurrentMenu() then
		arg_6_2 = arg_6_2 and arg_6_0.GetPartyCount()

		if arg_6_2 and arg_6_2 > 1 then
			var_0_3(arg_6_0)
		else
			arg_6_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt1",
				helper_text = ""
			})
			arg_6_0:AddButtonHelperText({
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT"),
				container = arg_6_0._challengesPrompt
			})

			arg_6_0._challengesPromptInWidget = true
		end

		return true
	end
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	if Dvar.IBEGCHEFE("MSSMLKNMRT") then
		if arg_7_2.onBoarding and arg_7_2.onBoarding.type and arg_7_2.onBoarding.data then
			local var_7_0 = arg_7_2.onBoarding.type
			local var_7_1 = arg_7_2.onBoarding.data

			if not var_7_0.WasCompleted(arg_7_0, arg_7_1) then
				LUI.FlowManager.RequestPopupMenu(arg_7_0, "LobbyPlunderIntroPopup", true, arg_7_1, false, var_7_1)
				var_7_0.MarkCompleted(arg_7_0, arg_7_1)
			end
		else
			local var_7_2 = Playlist.CDGBFEJJGE(Dvar.CFHDGABACF("playlist"))

			if var_7_2 and PlaylistUtils.DoesPlaylistIDContainGameType(arg_7_1, var_7_2, MP.GameMode.PlunderGameType) then
				local var_7_3 = Onboarding.GetOnboardingForGametype(MP.GameMode.PlunderGameType)

				if var_7_3 and not var_7_3.type.WasCompleted(arg_7_0, arg_7_1) then
					LUI.FlowManager.RequestPopupMenu(arg_7_0, "LobbyPlunderIntroPopup", true, arg_7_1, false, var_7_3.data)
					var_7_3.type.MarkCompleted(arg_7_0, arg_7_1)
				end
			end
		end
	end
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = CONDITIONS.IsBRGameType()

	Dvar.DHEGHJJJHI("MLQNQTRRTK", var_8_0)

	if not var_8_0 then
		MLG.ArbitrarilySetCDLRuleset(arg_8_1, true)
	end

	local var_8_1 = LUI.FlowManager.GetScopedData(arg_8_0)

	if CONDITIONS.IsMagmaGameMode() then
		var_8_1.rolled = RANDOM.IsEnabled(arg_8_1, LOOT.itemTypes.OPERATOR, {
			operatorFaction = OPERATOR.WZ_OPERATOR_INDEX
		})
	end

	if not var_8_1.rolled and Dvar.IBEGCHEFE("TQRNTTMSL") then
		RANDOM.RollForAll()

		var_8_1.rolled = true
	end
end

local function var_0_7(arg_9_0, arg_9_1)
	arg_9_0._checkUserLobbyRestrictionsTimer = LUI.UITimer.new({
		interval = 1000,
		event = "check_user_lobby_restrictions"
	})
	arg_9_0._checkUserLobbyRestrictionsTimer.id = "checkUserLobbyRestrictionsTimer"

	arg_9_0:addElement(arg_9_0._checkUserLobbyRestrictionsTimer)
	DebugPrint("PlaylistRestriction: leave lobby timer setup for user")
	arg_9_0:addAndCallEventHandler("check_user_lobby_restrictions", function(arg_10_0, arg_10_1)
		if PlaylistUtils.IsLobbyRestrictedForUser(arg_9_1) then
			DebugPrint("PlaylistRestriction: leave lobby triggered for user")
			Lobby.LeavePublicLobby()
			ACTIONS.LeaveMenu()
			LUI.FlowManager.RequestPopupMenu(nil, "PlaylistRestrictionPopupRemovedFromParty", true, arg_9_1, false, nil, nil, nil, false)

			if arg_10_0._checkUserLobbyRestrictionsTimer then
				arg_10_0._checkUserLobbyRestrictionsTimer:closeTree()

				arg_10_0._checkUserLobbyRestrictionsTimer = nil

				DebugPrint("PlaylistRestriction: leave lobby timer killed for user")
			end
		end
	end)
end

local function var_0_8(arg_11_0)
	if AAR.IsMatchClientDataAvailable() then
		local var_11_0 = LUI.UIBindButton.new()

		var_11_0.id = "bindButton"

		arg_11_0:addElement(var_11_0)

		arg_11_0.bindButton = var_11_0

		arg_11_0.bindButton:registerEventHandler("button_left_trigger", function(arg_12_0, arg_12_1)
			Lobby.OpenAfterActionReport(arg_12_1.controller, true, false)
		end)
	end
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_0.MPTabsMenu)
	assert(arg_13_0.MPTabsMenu.Nat)
	Dvar.DFIJDJFIFD("match_running", 0)
	Streaming.BDDBGGIC(true)

	arg_13_0.SetDedi = var_0_2
	arg_13_0.TryRemoveChallengesPromptFromWidget = var_0_3
	arg_13_0.UpdateChallengePrompt = var_0_4

	if CONDITIONS.IsMagmaGameMode(arg_13_0) then
		Engine.BBEEIGHJBA(CoD.Music.MainWZLobbyMusic)
	else
		Engine.BBEEIGHJBA(CoD.Music.MainMPMusic)
	end

	arg_13_0.MPTabsMenu:SetupBackButtonHandler(function(arg_14_0, arg_14_1)
		LUI.FlowManager.RequestPopupMenu(nil, "leave_public_mp_lobby", true, arg_14_1.controller, false)

		return true
	end)

	if LUI.DataSourceInGlobalModel.new("alwaysLoaded.completedVanguardEvent"):GetValue(arg_13_1) then
		Lobby.LeavePublicLobby()
		ACTIONS.LeaveMenu()

		return true
	else
		arg_13_0.MPTabsMenu:SetupTabs(arg_13_1, {
			firstTabWidget = "LobbyFlowWidget"
		})
	end

	arg_13_0:addEventHandler("searching_for_lobby", function(arg_15_0, arg_15_1)
		arg_13_0.LobbyStatus:SetAlpha(arg_15_1.isSearching and 0 or 1)

		return true
	end)
	assert(arg_13_0.bindButton)
	arg_13_0.bindButton:addEventHandler("button_start", function(arg_16_0, arg_16_1)
		ACTIONS.OpenOptionsMenu(arg_16_1.controller)
	end)
	arg_13_0.bindButton:addEventHandler("button_left_trigger", function(arg_17_0, arg_17_1)
		local var_17_0 = arg_13_0.MPTabsMenu.activeTabWidget

		if var_17_0 and var_17_0.LeftTriggerOverride then
			return var_17_0.LeftTriggerOverride(arg_17_0, arg_17_1)
		end

		return false
	end)
	SURVEY.OpenPostGameSurveyIfRequired(arg_13_1, false)

	local var_13_0 = true

	if Dvar.IBEGCHEFE("LLOKOONSQK") == true and not Engine.DAFGFCFHJI() then
		var_13_0 = false

		if Dvar.IBEGCHEFE("LSNOPORRSS") == true then
			Engine.DDCJCCJCBA()
		end
	end

	if var_13_0 then
		Lobby.DDDCGDHHJF(arg_13_1)
	end

	local var_13_1 = CoD.PresenceContext.LOBBY

	if CONDITIONS.IsMagmaGameMode() then
		arg_13_0.MPTabsMenu.MenuTitle:SetWarzoneTitle()
		Lobby.EAHFJBBBBD(PartyUIRoot.BATTLE_ROYALE_MENU_PUBLIC_LOBBY)

		var_13_1 = CoD.PresenceContext.LOBBY_WZ
	else
		arg_13_0.MPTabsMenu.MenuTitle:SetMWTitle()
		Lobby.EAHFJBBBBD(PartyUIRoot.MP_PUBLIC_MATCH_LOBBY)
	end

	Lobby.CheckTURequirement(arg_13_0, arg_13_1)
	Engine.EAIBAGFDCD(var_13_1)

	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		PostGameFanfare:start()
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	elseif BATTLEPASS.ShouldShowFreeTierUpsell(arg_13_1) then
		LUI.FlowManager.RequestPopupMenu(arg_13_0, "BattlePassFreeTierUpsell", true, arg_13_1, false, {
			sourceMenu = arg_13_0
		})
	end

	var_0_8(arg_13_0)
	WEAPON.StreamAllWeapons(arg_13_1)
	Lobby.DisplayNvidiaHighlightsButton(arg_13_0, "MW_Highlights")

	if Engine.CIEGIACHAE() then
		local var_13_2 = LUI.FlowManager.GetScopedData(arg_13_0)

		if not var_13_2.matchmakingStartTime then
			var_13_2.matchmakingStartTime = Engine.BFBIDEGDFB()
		end
	end

	Lobby.PreloadViewHandsForLocalPlayer(arg_13_1)
	var_0_5(arg_13_0, arg_13_1, arg_13_2)

	local var_13_3 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
	local var_13_4 = Playlist.CDGBFEJJGE(Dvar.CFHDGABACF("playlist"))

	if var_13_3 == "brtdm" or var_13_4 and PlaylistUtils.DoesPlaylistIDContainGameType(arg_13_1, var_13_4, MP.GameMode.BRTDM) and not CONDITIONS.IsLaze() then
		Lobby.UpdatePreloadStreamer(arg_13_1)
	end

	if CONDITIONS.AreWZPlaylistRestrictionsEnabled() then
		var_0_7(arg_13_0, arg_13_1)
	end

	if Dvar.IBEGCHEFE("MNMTKTRPPP") then
		Lobby.LeavePublicLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_13_0:GetCurrentMenu())
	end

	arg_13_0:addEventHandler("OverwolfDetectedEvent", function(arg_18_0, arg_18_1)
		Lobby.LeavePublicLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_13_0:GetCurrentMenu())
	end)
	LOADING.StreamLoadscreenImages(arg_13_0, arg_13_1)
end

function MPPublicLobby(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "MPPublicLobby"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)
	var_0_6(var_19_0, var_19_1, arg_19_1)

	var_19_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_19_1
	})
	var_19_0.HelperBar.id = "HelperBar"

	var_19_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_19_0.HelperBar:setPriority(10)
	var_19_0:addElement(var_19_0.HelperBar)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "MPTabsMenu"

	var_19_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_19_0:addElement(var_19_4)

	var_19_0.MPTabsMenu = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "LobbyStatus"

	var_19_6:SetAlpha(0, 0)
	var_19_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_19_0:addElement(var_19_6)

	var_19_0.LobbyStatus = var_19_6

	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_19_7 = LUI.UIBindButton.new()

	var_19_7.id = "selfBindButton"

	var_19_0:addElement(var_19_7)

	var_19_0.bindButton = var_19_7

	var_0_9(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("MPPublicLobby", MPPublicLobby)
LUI.FlowManager.RegisterStackPushBehaviour("MPPublicLobby", var_0_0)
LockTable(_M)
