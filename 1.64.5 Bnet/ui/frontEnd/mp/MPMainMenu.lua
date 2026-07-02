module(..., package.seeall)

local function var_0_0()
	if MLG.IsHost() then
		MLG.ResetMatchRulesData()
	end
end

local function var_0_1()
	MP_COMMON.RefreshDataForFirstController()
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("QTQRQPLNK", false)
	WipeGlobalModelsAtPath("menu.spltscreenDisplay.controllerIndex")
end

local function var_0_2(arg_3_0)
	if AAR.IsMatchClientDataAvailable() then
		local var_3_0 = LUI.UIBindButton.new()

		var_3_0.id = "bindButton"

		arg_3_0:addElement(var_3_0)

		arg_3_0.bindButton = var_3_0

		arg_3_0.bindButton:registerEventHandler("button_left_trigger", function(arg_4_0, arg_4_1)
			Lobby.OpenAfterActionReport(arg_4_1.controller, true, false)
		end)
	end
end

LUI.FlowManager.RegisterFenceGroup("MPMainMenu", {
	"premium",
	"mpPrivilegePremium",
	"onlineServiceSubscription",
	"mp",
	"mpInstall",
	"mpOnlineData",
	"shaderUpload",
	"fnf",
	"contracts",
	"fenceSpinner",
	"playlists",
	"catalog",
	"frontendAssets"
})
LUI.FlowManager.RequestSetStack("MPMainMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	}
})

local function var_0_3(arg_5_0, arg_5_1)
	MP_COMMON.SetupParty()
	Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY)
	MissionUtils.SetFlowState(MissionUtils.FlowState.PRE_INIT)

	if Dvar.IBEGCHEFE("NPTKMLRPLQ") then
		Dvar.DHEGHJJJHI("NPTKMLRPLQ", false)
		arg_5_0:processEvent({
			eventID = "lobby_welcome",
			name = "show_commander_message"
		})
	end

	Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	var_0_2(arg_5_0)

	if Dvar.CFHDGABACF("NQKRRQQNQR") > 2 then
		Dvar.DFIJDJFIFD("NQKRRQQNQR", 0)
		arg_5_0:processEvent({
			eventID = "lobby_leave",
			name = "show_commander_message"
		})
	end

	if Dvar.IBEGCHEFE("NTOQQKTRPL") then
		arg_5_0:processEvent({
			eventID = "mt_join_up",
			name = "show_commander_message"
		})
		Dvar.DHEGHJJJHI("NTOQQKTRPL", false)
	elseif Dvar.IBEGCHEFE("LLRTNMKLTL") then
		arg_5_0:processEvent({
			eventID = "mt_welcome_back",
			name = "show_commander_message"
		})
		Dvar.DHEGHJJJHI("LLRTNMKLTL", false)
	end

	if not Engine.DAFGFCFHJI() then
		Lobby.BHDJFHEDJG(arg_5_1)
	end

	Lobby.EAHFJBBBBD(PartyUIRoot.MP_MAIN_MENU)
end

local function var_0_4(arg_6_0, arg_6_1)
	Dvar.BDEHAEGHAF("ui_version_show", "0")
	Dvar.DHEGHJJJHI("MTSTMKPMRM", false)

	local var_6_0 = arg_6_1.controller or Engine.IJEBHJIJF()

	Lobby.CheckTURequirement(arg_6_0, var_6_0)
	Engine.DAGFFDGFII(CoD.GetMPOnlineCfg(), var_6_0)
	DebugPrint("In MP MainMenu on menu create function")
	arg_6_0:registerEventHandler("not_below_blocking_fence", function(arg_7_0, arg_7_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)

		if not MLG.JIHGCIJCG() then
			local var_7_0 = true

			if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.DAFGFCFHJI() then
				var_7_0 = false
			end

			if var_7_0 then
				DebugPrint("MPMainMenu::OnMenuCreate")
				Lobby.BHDJFHEDJG(var_6_0)
			end
		end
	end)
	DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_6_0, var_6_0)

	if CONDITIONS.AreWZLoadoutsEnabled() and not Onboarding.MWBootCrossProgression.WasCompleted(arg_6_0, var_6_0) then
		LUI.FlowManager.RequestPopupMenu(arg_6_0, "onboardingpopup", false, var_6_0, false, ONBOARDING_DATA.GetOnboardingCH2BootMWCrossProgressionData())
		Onboarding.MWBootCrossProgression.MarkCompleted(arg_6_0, var_6_0)
	end

	if CONDITIONS.IsSeasonalEventActive() then
		local var_6_1 = SEASONAL_EVENT.GetCurrentSeasonalEventOnboadingData()

		if var_6_1 and not var_6_1.WasCompleted(arg_6_0, var_6_0) then
			if LUI.FlowManager.IsInStack("SeasonalEventIntroPopup") or LUI.FlowManager.IsInStack("SeasonalEventDetailsPopup") or LUI.FlowManager.IsInStack("SeasonalEventSpecialPopup") then
				return
			end

			local var_6_2 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

			if var_6_2.onboardingBink == nil or var_6_2.onboardingBink.isKorea15Unsafe and Engine.FABABBDBA() then
				LUI.FlowManager.RequestPopupMenu(arg_6_0, "SeasonalEventDetailsPopup", true, var_6_0, false, {})
			else
				LUI.FlowManager.RequestPopupMenu(arg_6_0, "SeasonalEventIntroPopup", true, var_6_0, false, {})
			end

			return
		end
	end

	if not LUI.DataSourceInControllerModel.new("alwaysLoaded.openedSeasonalFlow"):GetValue(var_6_0) then
		if BATTLEPASS.VIPGiftAvailable(var_6_0) then
			if LUI.FlowManager.IsInStack("BattlePassVIPGiftUpsell") then
				arg_6_0._canOpenDailyPopup = true

				return
			end

			arg_6_0._canOpenDailyPopup = true

			LUI.FlowManager.RequestPopupMenu(arg_6_0, "BattlePassVIPGiftIntro", true, var_6_0, false, {})

			return
		end

		if BATTLEPASS.ShouldShowFreeTierUpsell(var_6_0) then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "BattlePassFreeTierUpsell", true, var_6_0, false, {
				sourceMenu = arg_6_0
			})

			return
		end

		if not LUI.WebViewManager.MotdEnabled() then
			CRM.OpenCRMWindows(arg_6_0)
		end

		arg_6_0._canOpenDailyPopup = true
	end
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") and MLG.BIHFEHBCFB(arg_8_1) ~= GAMEBATTLES.INVALID_MATCH_ID then
		GAMEBATTLES.RemoveSubscriptions(arg_8_1)
		MLG.ResetGameBattleMatchId(arg_8_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
	end

	Dvar.DHEGHJJJHI("MLQNQTRRTK", false)
	PROGRESSION.PrestreamGamemodeIcons(arg_8_0)
	MLG.ArbitrarilySetCDLRuleset(arg_8_1)
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	if Engine.CGABICJHAI() and OnlineABTesting.DEFDBJBAJ(arg_9_1) and Dvar.IBEGCHEFE("MNNMPMRSLT") and not Dvar.IBEGCHEFE("NPMRNRNPPT") then
		Engine.BGHCDBAGFB(arg_9_1)
		Dvar.DHEGHJJJHI("NPMRNRNPPT", true)
	end

	if OnlineABTesting.DEFDBJBAJ(arg_9_1) then
		local var_9_0 = Engine.BECCFCBIAA("hasPlayerChangedAimAssistSetting", arg_9_1)
		local var_9_1 = Engine.BECCFCBIAA("hasEnrolledInAimAssistExperiment", arg_9_1)

		if not var_9_0 and not var_9_1 then
			local var_9_2 = DataModel.DJJHBDCEAB(arg_9_1)
			local var_9_3 = DataModel.DGADFJACCI(var_9_2, "abtesting.aimassist.value")

			if var_9_3 then
				local var_9_4 = DataModel.JJEHAEBDF(var_9_3)

				if var_9_4 then
					Engine.DFJDIFJEGA("aimAssistType", var_9_4, arg_9_1)
					Engine.DFJDIFJEGA("hasEnrolledInAimAssistExperiment", 1, arg_9_1)
				end
			end
		end
	end

	Engine.DFJDIFJEGA("initialGameMode", MAIN_MENU.BladeKeys.MP, arg_9_1)
	Engine.DFJDIFJEGA("isMPNew", 0, arg_9_1)
	Engine.EBIDFIDHIE("updategamerprofile")

	arg_9_0.isSignInMenu = true
	arg_9_0.signoutSplitscreen = true

	arg_9_0:SetAlpha(0, 0)
	arg_9_0:SetAlpha(1, 400, LUI.EASING.outQuadratic)
	MP_COMMON.SetupStreaming(arg_9_0, arg_9_1)

	local var_9_5 = CoD.Music.MainMPMusic

	Engine.BBEEIGHJBA(var_9_5)
	DataSources.frontEnd.lobby.lobbyMusic:SetValue(arg_9_1, var_9_5)

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_9_0) then
		arg_9_0.MPTabsMenu:registerEventHandler("focus_tab_changed", function(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1.tabName
			local var_10_1 = false

			if var_10_0 == "MPPlayMenu" then
				var_10_1 = true

				ACTIONS.AnimateSequence(arg_9_0.IGRXPBonusTip, "RankXPBonus")
			elseif var_10_0 == "MPWeaponMenu" then
				var_10_1 = true

				ACTIONS.AnimateSequence(arg_9_0.IGRXPBonusTip, "WeaponXPBonus")
			elseif var_10_0 == "BattlePassMenu" then
				var_10_1 = true

				ACTIONS.AnimateSequence(arg_9_0.IGRXPBonusTip, "BattlePassXPBonus")
			end

			arg_9_0.IGRXPBonusTip:SetAlpha(var_10_1 and 1 or 0, 0)
		end)
	end

	MP_COMMON.SetupOnline()
	var_0_3(arg_9_0, arg_9_1)
	arg_9_0:addEventHandler("menu_create", var_0_4)
	arg_9_0:addEventHandler("restore_focus", function(arg_11_0, arg_11_1)
		if arg_9_0._canOpenDailyPopup and not arg_9_0.openedDailyPopup and arg_9_0.nextLocation == nil then
			Challenge.OpenDailyPopup(arg_11_0, arg_11_1.controller)
		end
	end)
	assert(arg_9_0.bindButton)
	arg_9_0.MPTabsMenu:SetupBackButtonHandler(function(arg_12_0, arg_12_1)
		if Lobby.IsNotAloneInPrivateParty() and MP_COMMON.ShouldShowLeaveMenuConfirmPopupIfHost() then
			MP_COMMON.LeavePartyAndStayInMenu(arg_9_0, arg_12_1)
		else
			MP_COMMON.TriggerLeaveMainGamemodeMenu(arg_9_0, arg_12_1)
		end
	end)

	if arg_9_2 and arg_9_2.isBR then
		Dvar.BDEHAEGHAF("MOLPOSLOMO", "br")
	end

	arg_9_0.MPTabsMenu:SetupTabs(arg_9_1)

	local var_9_6 = LUI.FlowManager.GetScopedData(arg_9_0)

	if CONDITIONS.IsTrialLicense() and not var_9_6.trialPopupShown then
		var_9_6.trialPopupShown = true

		LUI.FlowManager.RequestPopupMenu(arg_9_0, "TrialFullWindow", true, arg_9_1, false)
	end

	SURVEY.OpenPostGameSurveyIfRequired(arg_9_1, true)

	local var_9_7 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areMLGRulesEnabled")

	arg_9_0:SubscribeToModel(var_9_7:GetModel(arg_9_1), function()
		if not MLG.IsHost() and not Lobby.BBDICGHE() then
			if Lobby.DFHGBJJAGC() then
				MatchRules.DJEIAJCAD()
			else
				MLG.ResetMatchRulesData()
			end

			arg_9_0:dispatchEventToChildren({
				name = "matchrules_updated",
				controllerIndex = arg_9_1
			})
		end
	end)
	TRIALS.FixUpLoot(arg_9_1)

	if Dvar.IBEGCHEFE("MNMTKTRPPP") then
		LUI.FlowManager.RequestPopupMenu(nil, "ProgramDetectedErrorPopup", true, arg_9_1, false, {}, nil, true, true)
	end

	arg_9_0:addEventHandler("OverwolfDetectedEvent", function(arg_14_0, arg_14_1)
		LUI.FlowManager.RequestPopupMenu(nil, "ProgramDetectedErrorPopup", true, arg_9_1, false, {}, nil, true, true)
	end)
	arg_9_0:addEventHandler("gift_queue_process", function(arg_15_0, arg_15_1)
		local var_15_0 = Gifting.DBCIFGGCEG(arg_9_1)

		if var_15_0 and #var_15_0 > 0 then
			GIFT.WaitForTransitionAndProcessGift(arg_9_0, arg_9_1, "MPMainMenu")
		end
	end)

	if CONDITIONS.IsUserSignedInDemonware(arg_9_1) then
		LOOT.CheckCustomizationsShouldBeEquipped(arg_9_1)
		WEAPON.CheckWeaponsShouldBeEquipped(arg_9_1)
		OPERATOR.CheckCustomizationsShouldBeEquipped(arg_9_1)
	end
end

function MPMainMenu(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0.id = "MPMainMenu"

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)
	var_0_5(var_16_0, var_16_1, arg_16_1)

	var_16_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_16_1
	})
	var_16_0.HelperBar.id = "HelperBar"

	var_16_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_16_0.HelperBar:setPriority(10)
	var_16_0:addElement(var_16_0.HelperBar)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "MPTabsMenu"

	var_16_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.MPTabsMenu = var_16_4

	local var_16_5

	if CONDITIONS.IsInKoreanIGRPaidSession(var_16_0) then
		local var_16_6 = MenuBuilder.BuildRegisteredType("IGRXPBonusTip", {
			controllerIndex = var_16_1
		})

		var_16_6.id = "IGRXPBonusTip"

		var_16_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -224, _1080p * 576, _1080p * -70, 0)
		var_16_0:addElement(var_16_6)

		var_16_0.IGRXPBonusTip = var_16_6
	end

	var_16_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_16_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_16_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 3,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_16_7 = LUI.UIBindButton.new()

	var_16_7.id = "selfBindButton"

	var_16_0:addElement(var_16_7)

	var_16_0.bindButton = var_16_7

	var_16_0.bindButton:addEventHandler("button_start", function(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_1.controller or var_16_1

		ACTIONS.OpenOptionsMenu(var_17_0, "", "")
	end)
	var_0_6(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("MPMainMenu", MPMainMenu)
LUI.FlowManager.RegisterStackPushBehaviour("MPMainMenu", var_0_1)
LUI.FlowManager.RegisterStackPopBehaviour("MPMainMenu", var_0_0)
LockTable(_M)
