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

local function var_0_1(arg_3_0)
	local var_3_0 = Engine.BFJBEHGGCH()
	local var_3_1 = arg_3_0.MPTabsMenu.Nat

	if var_3_0 and var_3_1 then
		var_3_1:SetRGBFromTable(COLORS.white)
	end
end

local function var_0_2(arg_4_0)
	if arg_4_0._challengesPromptInWidget and arg_4_0:GetCurrentMenu() then
		arg_4_0:GetCurrentMenu():AddButtonHelperText({
			button_ref = "button_alt1",
			helper_text = "",
			container = arg_4_0._challengesPrompt
		})

		arg_4_0._challengesPromptInWidget = false

		return true
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0 and arg_5_0:GetCurrentMenu() then
		arg_5_2 = arg_5_2 and arg_5_0.GetPartyCount()

		if arg_5_2 and arg_5_2 > 1 then
			var_0_2(arg_5_0)
		else
			arg_5_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_alt1",
				helper_text = ""
			})
			arg_5_0:AddButtonHelperText({
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT"),
				container = arg_5_0._challengesPrompt
			})

			arg_5_0._challengesPromptInWidget = true
		end

		return true
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	if Dvar.IBEGCHEFE("MSSMLKNMRT") then
		if arg_6_2.onBoarding and arg_6_2.onBoarding.type and arg_6_2.onBoarding.data then
			local var_6_0 = arg_6_2.onBoarding.type
			local var_6_1 = arg_6_2.onBoarding.data

			if not var_6_0.WasCompleted(arg_6_0, arg_6_1) then
				LUI.FlowManager.RequestPopupMenu(arg_6_0, "LobbyPlunderIntroPopup", true, arg_6_1, false, var_6_1)
				var_6_0.MarkCompleted(arg_6_0, arg_6_1)
			end
		else
			local var_6_2 = Playlist.CDGBFEJJGE(Dvar.CFHDGABACF("playlist"))

			if var_6_2 and PlaylistUtils.DoesPlaylistIDContainGameType(arg_6_1, var_6_2, MP.GameMode.PlunderGameType) then
				local var_6_3 = Onboarding.GetOnboardingForGametype(MP.GameMode.PlunderGameType)

				if var_6_3 and not var_6_3.type.WasCompleted(arg_6_0, arg_6_1) then
					LUI.FlowManager.RequestPopupMenu(arg_6_0, "LobbyPlunderIntroPopup", true, arg_6_1, false, var_6_3.data)
					var_6_3.type.MarkCompleted(arg_6_0, arg_6_1)
				end
			end
		end
	end
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	if not CONDITIONS.IsBRGameType(arg_7_0) then
		MLG.ArbitrarilySetCDLRuleset(arg_7_1, true)
	end
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.MPTabsMenu)
	assert(arg_8_0.MPTabsMenu.Nat)
	Dvar.DFIJDJFIFD("match_running", 0)
	Streaming.BDDBGGIC(true)

	arg_8_0.SetDedi = var_0_1
	arg_8_0.TryRemoveChallengesPromptFromWidget = var_0_2
	arg_8_0.UpdateChallengePrompt = var_0_3

	Engine.BBEEIGHJBA(CoD.Music.MainMPMusic)
	arg_8_0.MPTabsMenu:SetupBackButtonHandler(function(arg_9_0, arg_9_1)
		LUI.FlowManager.RequestPopupMenu(nil, "leave_public_mp_lobby", true, arg_9_1.controller, false)

		return true
	end)
	arg_8_0.MPTabsMenu:SetupTabs(arg_8_1, {
		firstTabWidget = "LobbyFlowWidget"
	})
	arg_8_0:addEventHandler("searching_for_lobby", function(arg_10_0, arg_10_1)
		arg_8_0.LobbyStatus:SetAlpha(arg_10_1.isSearching and 0 or 1)

		return true
	end)
	assert(arg_8_0.bindButton)
	arg_8_0.bindButton:addEventHandler("button_start", function(arg_11_0, arg_11_1)
		ACTIONS.OpenOptionsMenu(arg_11_1.controller)
	end)
	arg_8_0.bindButton:addEventHandler("button_left_trigger", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_8_0.MPTabsMenu.activeTabWidget

		if var_12_0 and var_12_0.LeftTriggerOverride then
			return var_12_0.LeftTriggerOverride(arg_12_0, arg_12_1)
		end

		return false
	end)
	SURVEY.OpenPostGameSurveyIfRequired(arg_8_1, false)

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

	if CONDITIONS.IsMagmaGameMode() then
		arg_8_0.MPTabsMenu.MenuTitle:SetWarzoneTitle()
		Lobby.EAHFJBBBBD(PartyUIRoot.BATTLE_ROYALE_MENU_PUBLIC_LOBBY)
	else
		arg_8_0.MPTabsMenu.MenuTitle:SetMWTitle()
		Lobby.EAHFJBBBBD(PartyUIRoot.MP_PUBLIC_MATCH_LOBBY)
	end

	Lobby.CheckTURequirement(arg_8_0, arg_8_1)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)

	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		PostGameFanfare:start()
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	elseif BATTLEPASS.ShouldShowFreeTierUpsell(arg_8_1) then
		LUI.FlowManager.RequestPopupMenu(arg_8_0, "BattlePassFreeTierUpsell", true, arg_8_1, false, {
			sourceMenu = arg_8_0
		})
	end

	WEAPON.StreamAllWeapons(arg_8_1)
	Lobby.DisplayNvidiaHighlightsButton(arg_8_0, "MW_Highlights")

	if Engine.CIEGIACHAE() then
		local var_8_1 = LUI.FlowManager.GetScopedData(arg_8_0)

		if not var_8_1.matchmakingStartTime then
			var_8_1.matchmakingStartTime = Engine.BFBIDEGDFB()
		end
	end

	Lobby.PreloadViewHandsForLocalPlayer(arg_8_1)
	var_0_4(arg_8_0, arg_8_1, arg_8_2)

	if not CONDITIONS.IsBRGameType(arg_8_0) then
		local function var_8_2(arg_13_0)
			arg_8_0.CDLRestrictionTag:UpdateVisibility(arg_13_0)
		end

		var_8_2(arg_8_1)

		local var_8_3 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areMLGRulesEnabled")

		arg_8_0:SubscribeToModel(var_8_3:GetModel(arg_8_1), function()
			if not MLG.IsHost() and not Lobby.BBDICGHE() then
				if Lobby.DFHGBJJAGC() then
					MatchRules.DJEIAJCAD()
				else
					MLG.ResetMatchRulesData()
				end

				arg_8_0:dispatchEventToChildren({
					name = "matchrules_updated",
					controllerIndex = arg_8_1
				})
				var_8_2(arg_8_1)
			end
		end)
	end

	local var_8_4 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
	local var_8_5 = Playlist.CDGBFEJJGE(Dvar.CFHDGABACF("playlist"))

	if var_8_4 == "brtdm" or var_8_5 and PlaylistUtils.DoesPlaylistIDContainGameType(arg_8_1, var_8_5, MP.GameMode.BRTDM) then
		Lobby.UpdatePreloadStreamer(arg_8_1)
	end
end

function MPPublicLobby(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0.id = "MPPublicLobby"

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)
	var_0_5(var_15_0, var_15_1, arg_15_1)

	var_15_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_15_1
	})
	var_15_0.HelperBar.id = "HelperBar"

	var_15_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_15_0.HelperBar:setPriority(10)
	var_15_0:addElement(var_15_0.HelperBar)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "MPTabsMenu"

	var_15_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.MPTabsMenu = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "LobbyStatus"

	var_15_6:SetAlpha(0, 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_15_0:addElement(var_15_6)

	var_15_0.LobbyStatus = var_15_6

	local var_15_7
	local var_15_8 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
		controllerIndex = var_15_1
	})

	var_15_8.id = "CDLRestrictionTag"

	var_15_8:SetAlpha(0, 0)
	var_15_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 446, _1080p * 173, _1080p * 203)
	var_15_0:addElement(var_15_8)

	var_15_0.CDLRestrictionTag = var_15_8

	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_15_9 = LUI.UIBindButton.new()

	var_15_9.id = "selfBindButton"

	var_15_0:addElement(var_15_9)

	var_15_0.bindButton = var_15_9

	var_0_6(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("MPPublicLobby", MPPublicLobby)
LUI.FlowManager.RegisterStackPushBehaviour("MPPublicLobby", var_0_0)
LockTable(_M)
