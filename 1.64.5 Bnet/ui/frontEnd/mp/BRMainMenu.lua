module(..., package.seeall)

local function var_0_0()
	MP_COMMON.RefreshDataForFirstController()
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("QTQRQPLNK", true)
	WipeGlobalModelsAtPath("menu.spltscreenDisplay.controllerIndex")
end

local var_0_1

local function var_0_2(arg_2_0, arg_2_1)
	return var_0_1(arg_2_0, arg_2_1)
end

MenuBuilder.registerType("BRMainMenuStore", var_0_2)
LUI.FlowManager.RegisterStackPushBehaviour("BRMainMenuStore", var_0_0)
LUI.FlowManager.RegisterFenceGroup("BRMainMenuStore", {
	"mpPrivilegeF2P",
	"br",
	"mpOnlineData",
	"shaderUpload",
	"fnf",
	"contracts",
	"fenceSpinner",
	"playlists",
	"catalog",
	"frontendAssets"
})
LUI.FlowManager.RequestSetStack("BRMainMenuStore", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	}
})
LUI.FlowManager.RegisterFenceGroup("BRMainMenu", {
	"mpPrivilegeF2P",
	"br",
	"mpOnlineData",
	"shaderUpload",
	"fnf",
	"contracts",
	"fenceSpinner",
	"playlists",
	"catalog",
	"frontendAssets"
})
LUI.FlowManager.RequestSetStack("BRMainMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	}
})

local function var_0_3(arg_3_0, arg_3_1)
	MP_COMMON.SetupParty()
	Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY_WZ)
	MissionUtils.SetFlowState(MissionUtils.FlowState.PRE_INIT)

	if Dvar.IBEGCHEFE("NPTKMLRPLQ") then
		Dvar.DHEGHJJJHI("NPTKMLRPLQ", false)
		arg_3_0:processEvent({
			eventID = "lobby_welcome",
			name = "show_commander_message"
		})
	end

	Dvar.DHEGHJJJHI("MQNNLTKNTS", false)

	if Dvar.CFHDGABACF("NQKRRQQNQR") > 2 then
		Dvar.DFIJDJFIFD("NQKRRQQNQR", 0)
		arg_3_0:processEvent({
			eventID = "lobby_leave",
			name = "show_commander_message"
		})
	end

	if Dvar.IBEGCHEFE("NTOQQKTRPL") then
		arg_3_0:processEvent({
			eventID = "mt_join_up",
			name = "show_commander_message"
		})
		Dvar.DHEGHJJJHI("NTOQQKTRPL", false)
	elseif Dvar.IBEGCHEFE("LLRTNMKLTL") then
		arg_3_0:processEvent({
			eventID = "mt_welcome_back",
			name = "show_commander_message"
		})
		Dvar.DHEGHJJJHI("LLRTNMKLTL", false)
	end

	if not Engine.DAFGFCFHJI() then
		Lobby.BHDJFHEDJG(arg_3_1)
	end

	Lobby.EAHFJBBBBD(PartyUIRoot.BR_MAIN_MENU)
end

local function var_0_4(arg_4_0, arg_4_1)
	Dvar.BDEHAEGHAF("ui_version_show", "0")
	Dvar.DHEGHJJJHI("MTSTMKPMRM", false)

	local var_4_0 = arg_4_1.controller or Engine.IJEBHJIJF()

	Lobby.CheckTURequirement(arg_4_0, var_4_0)
	Engine.DAGFFDGFII(MPConfig.default_online, var_4_0)
	Dvar.BDEHAEGHAF("MOLPOSLOMO", "br")
	Dvar.BDEHAEGHAF("NSQLTTMRMP", BR.DEFAULT_MAP)
	arg_4_0:registerEventHandler("not_below_blocking_fence", function(arg_5_0, arg_5_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)

		if not MLG.JIHGCIJCG() then
			local var_5_0 = true

			if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.DAFGFCFHJI() then
				var_5_0 = false
			end

			if var_5_0 then
				DebugPrint("BRMainMenu::OnMenuCreate")
				Lobby.BHDJFHEDJG(var_4_0)
			end
		end
	end)
	DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_4_0, var_4_0)

	if arg_4_0._useStandaloneStore then
		return
	end

	if LUI.FlowManager.GetScopedData("MainMenu").brRewardPending then
		return
	end

	if CONDITIONS.IsSeasonalEventActive() then
		local var_4_1 = SEASONAL_EVENT.GetCurrentSeasonalEventOnboadingData()

		if var_4_1 and not var_4_1.WasCompleted(arg_4_0, var_4_0) then
			if LUI.FlowManager.IsInStack("SeasonalEventIntroPopup") or LUI.FlowManager.IsInStack("SeasonalEventDetailsPopup") or LUI.FlowManager.IsInStack("SeasonalEventSpecialPopup") then
				return
			end

			local var_4_2 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

			if not CONDITIONS.SeasonalEventDisablesFTUE() then
				if var_4_2.onboardingBink == nil or var_4_2.onboardingBink.isKorea15Unsafe and Engine.FABABBDBA() then
					LUI.FlowManager.RequestPopupMenu(arg_4_0, "SeasonalEventDetailsPopup", true, var_4_0, false, {})
				else
					LUI.FlowManager.RequestPopupMenu(arg_4_0, "SeasonalEventIntroPopup", true, var_4_0, false, {})
				end
			end

			return
		end
	end

	if not LUI.DataSourceInControllerModel.new("alwaysLoaded.openedSeasonalFlow"):GetValue(var_4_0) then
		if CONDITIONS.AreWZLoadoutsEnabled() and not Onboarding.WZBootCrossProgression.WasCompleted(arg_4_0, var_4_0) then
			LUI.FlowManager.RequestPopupMenu(arg_4_0, "onboardingpopup", false, var_4_0, false, ONBOARDING_DATA.GetOnboardingCH2BootWZCrossProgressionData())
			Onboarding.WZBootCrossProgression.MarkCompleted(arg_4_0, var_4_0)
		end

		if BATTLEPASS.VIPGiftAvailable(var_4_0) then
			if LUI.FlowManager.IsInStack("BattlePassVIPGiftUpsell") then
				arg_4_0._canOpenDailyPopup = true

				return
			end

			LUI.FlowManager.RequestPopupMenu(arg_4_0, "BattlePassVIPGiftIntro", true, var_4_0, false, {})

			arg_4_0._canOpenDailyPopup = true

			return
		end

		if BATTLEPASS.ShouldShowFreeTierUpsell(var_4_0) then
			LUI.FlowManager.RequestPopupMenu(arg_4_0, "BattlePassFreeTierUpsell", true, var_4_0, false, {
				sourceMenu = arg_4_0
			})

			return
		end

		if not LUI.WebViewManager.MotdEnabled() then
			CRM.OpenCRMWindows(arg_4_0)
		end

		arg_4_0._canOpenDailyPopup = true
	end

	Gifting.BFCHGDDGFJ(var_4_0, true)
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	Dvar.DHEGHJJJHI("MLQNQTRRTK", true)

	if MLG.BIHFEHBCFB(arg_6_1) == GAMEBATTLES.INVALID_MATCH_ID then
		Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	end

	PROGRESSION.PrestreamGamemodeIcons(arg_6_0)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = Dvar.DHEEJCCJBH("LTLKORRQOM")

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() and var_7_0 ~= nil and var_7_0 ~= "" then
		if arg_7_0.bundleReportTimer == nil then
			arg_7_0.bundleReportTimer = LUI.UITimer.new({
				interval = 60000,
				event = "bundle_report"
			})
			arg_7_0.bundleReportTimer.id = "bundleReportTimer"

			arg_7_0:addElement(arg_7_0.bundleReportTimer)
			arg_7_0:addEventHandler("bundle_report", function(arg_8_0, arg_8_1)
				Engine.EBIDFIDHIE("onlineStoreWriteBundleReport " .. var_7_0)
			end)
		end

		arg_7_2.useStandaloneStore = true
	end

	local var_7_1 = Dvar.DHEEJCCJBH("MMPQRLOPPN")

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() and var_7_1 ~= nil and var_7_1 ~= "" then
		if arg_7_0.battlepassReportTimer == nil then
			arg_7_0.battlepassReportTimer = LUI.UITimer.new({
				interval = 60000,
				event = "battlepass_report"
			})
			arg_7_0.battlepassReportTimer.id = "battlepassReportTimer"

			arg_7_0:addElement(arg_7_0.battlepassReportTimer)
			arg_7_0:addEventHandler("battlepass_report", function(arg_9_0, arg_9_1)
				Engine.EBIDFIDHIE("onlineBattlepassWriteReport " .. var_7_1)
			end)
		end

		arg_7_2.useStandaloneStore = true
	end

	arg_7_0._useStandaloneStore = arg_7_2.useStandaloneStore

	if Engine.CGABICJHAI() and OnlineABTesting.DEFDBJBAJ(arg_7_1) and Dvar.IBEGCHEFE("MNNMPMRSLT") and not Dvar.IBEGCHEFE("NPMRNRNPPT") then
		Engine.BGHCDBAGFB(arg_7_1)
		Dvar.DHEGHJJJHI("NPMRNRNPPT", true)
	end

	if OnlineABTesting.DEFDBJBAJ(arg_7_1) then
		local var_7_2 = Engine.BECCFCBIAA("hasPlayerChangedAimAssistSetting", arg_7_1)
		local var_7_3 = Engine.BECCFCBIAA("hasEnrolledInAimAssistExperiment", arg_7_1)

		if not var_7_2 and not var_7_3 then
			local var_7_4 = DataModel.DJJHBDCEAB(arg_7_1)
			local var_7_5 = DataModel.DGADFJACCI(var_7_4, "abtesting.aimassist.value")

			if var_7_5 then
				local var_7_6 = DataModel.JJEHAEBDF(var_7_5)

				if var_7_6 then
					Engine.DFJDIFJEGA("aimAssistType", var_7_6, arg_7_1)
					Engine.DFJDIFJEGA("hasEnrolledInAimAssistExperiment", 1, arg_7_1)
				end
			end
		end
	end

	Engine.DFJDIFJEGA("initialGameMode", MAIN_MENU.BladeKeys.BR, arg_7_1)
	Engine.DFJDIFJEGA("isBRNotNew", 1, arg_7_1)
	Engine.EBIDFIDHIE("updategamerprofile")

	arg_7_0.isSignInMenu = true
	arg_7_0.signoutSplitscreen = not arg_7_0._useStandaloneStore

	arg_7_0:SetAlpha(0, 0)
	arg_7_0:SetAlpha(1, 400, LUI.EASING.outQuadratic)
	MP_COMMON.SetupStreaming(arg_7_0, arg_7_1)
	Engine.BBEEIGHJBA(CoD.Music.MainWZMusic)

	if not arg_7_0._useStandaloneStore then
		MP_COMMON.SetupOnline()
		var_0_3(arg_7_0, arg_7_1)
	end

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_7_0) then
		arg_7_0.MPTabsMenu:registerEventHandler("focus_tab_changed", function(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1.tabName
			local var_10_1 = false

			if var_10_0 == "BRPlayMenu" then
				var_10_1 = true

				ACTIONS.AnimateSequence(arg_7_0.IGRXPBonusTip, "RankXPBonus")
			elseif var_10_0 == "MPWeaponMenu" then
				var_10_1 = true

				ACTIONS.AnimateSequence(arg_7_0.IGRXPBonusTip, "WeaponXPBonus")
			elseif var_10_0 == "BattlePassMenu" then
				var_10_1 = true

				ACTIONS.AnimateSequence(arg_7_0.IGRXPBonusTip, "BattlePassXPBonus")
			end

			arg_7_0.IGRXPBonusTip:SetAlpha(var_10_1 and 1 or 0, 0)
		end)
	end

	arg_7_0:addEventHandler("menu_create", function(arg_11_0, arg_11_1)
		if Engine.CGABICJHAI() and CONDITIONS.ShowWZSeasonalOpeningScreenPC(arg_7_1) then
			LUI.FlowManager.RequestPopupMenu(nil, "WZSeasonalOpeningScreenPC", true, arg_7_1, false, {})
			arg_7_0:addEventHandler("open_next_popup", var_0_4)
		else
			var_0_4(arg_11_0, arg_11_1)
		end
	end)
	arg_7_0:addEventHandler("menu_close", function(arg_12_0, arg_12_1)
		LUI.UIMouseCursor.ForceCursorVisibility(false)
	end)
	arg_7_0:addEventHandler("restore_focus", function(arg_13_0, arg_13_1)
		if arg_7_0._canOpenDailyPopup and not arg_7_0.openedDailyPopup and arg_7_0.nextLocation == nil and Challenge.OpenDailyPopup(arg_13_0, arg_13_1.controller) then
			return
		end

		local var_13_0 = LUI.FlowManager.GetScopedData(arg_13_0)
		local var_13_1 = var_13_0.isEventMenuShown
		local var_13_2 = not SEASONAL_EVENT.AreAllSeasonalEventsCompleted(arg_13_1.controller) or not SEASONAL_EVENT.IsSeasonalEventCompleteBinkSeen(arg_13_1.controller)

		var_13_2 = var_13_2 and not arg_13_0._brRewardFlowInit

		if CONDITIONS.IsSeasonalEventTabActive() and var_13_2 and not var_13_1 and not arg_7_0._useStandaloneStore and arg_13_0 and arg_13_0.MPTabsMenu then
			local var_13_3 = arg_13_0.MPTabsMenu:GetTabIndexByWidgetName("SeasonalEventMenu")

			if var_13_3 and var_13_3 > 0 then
				local var_13_4 = var_13_3
				local var_13_5 = LUI.FlowManager.GetScopedData("MainMenu")

				if var_13_5 and var_13_5.onRestoreFocusOptions and var_13_5.onRestoreFocusOptions.overrideTabToFocus then
					var_13_4 = arg_13_0.MPTabsMenu:GetTabIndexByWidgetName(var_13_5.onRestoreFocusOptions.overrideTabToFocus)
					var_13_5.onRestoreFocusOptions = nil
				end

				arg_13_0.MPTabsMenu.Tabs:FocusTab(arg_7_1, var_13_4 - 1)

				var_13_0.isEventMenuShown = var_13_3 == var_13_4

				return true
			end
		end
	end)

	arg_7_0.bindButton = LUI.UIBindButton.new()
	arg_7_0.bindButton.id = "BindButton"

	arg_7_0:addElement(arg_7_0.bindButton)

	local var_7_7 = {
		menu = arg_7_0
	}
	local var_7_8 = {
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	}
	local var_7_9 = {
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	}

	arg_7_0:AddButtonPrompt(var_7_8, var_7_7)
	arg_7_0:AddButtonPrompt(var_7_9, var_7_7)

	if not arg_7_0._useStandaloneStore then
		arg_7_0.bindButton:addEventHandler("button_start", function(arg_14_0, arg_14_1)
			local var_14_0 = arg_14_1.controller or arg_7_1

			ACTIONS.OpenOptionsMenu(var_14_0, "")
		end)
		arg_7_0.bindButton:addEventHandler("button_quick_options", function(arg_15_0, arg_15_1)
			local var_15_0 = arg_15_1.controller or arg_7_1

			if LUI.IsLastInputKeyboardMouse(var_15_0) then
				ACTIONS.OpenOptionsMenu(var_15_0, "")
			end
		end)

		local var_7_10 = {
			side = "left",
			priority = 3,
			gamepad_only = true,
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
		}
		local var_7_11 = {
			kbm_only = true,
			priority = 3,
			side = "left",
			button_ref = "button_quick_options",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
		}

		arg_7_0:AddButtonPrompt(var_7_10, var_7_7)
		arg_7_0:AddButtonPrompt(var_7_11, var_7_7)
	end

	arg_7_0.MPTabsMenu:SetupBackButtonHandler(function(arg_16_0, arg_16_1)
		if arg_7_0._useStandaloneStore then
			LUI.FlowManager.RequestLeaveMenu(arg_16_0)
		elseif Lobby.DGDCDCHFGD() and Lobby.BGIADHIHAG() then
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "LeaveLookForPartySearchQueue", true, arg_16_1.controller, false, {
				menu = arg_7_0,
				popElement = arg_16_0
			})
		elseif Lobby.IsNotAloneInPrivateParty() and MP_COMMON.ShouldShowLeaveMenuConfirmPopupIfHost() then
			MP_COMMON.LeavePartyAndStayInMenu(arg_7_0, arg_16_1)
		else
			MP_COMMON.TriggerLeaveMainGamemodeMenu(arg_7_0, arg_16_1)
		end
	end)

	if not arg_7_0._useStandaloneStore and Dvar.CFHDGABACF("NMPNSQNNRQ") == AAR.MagmaSummaryState.BR_PARADE_READY and CONDITIONS.IsMagmaGameMode() and not CONDITIONS.IsBloodMoney() and not CONDITIONS.IsRiskGametype() and not CONDITIONS.IsWZRatRace() and BATTLEPASS.BRRewardAvailable(arg_7_1) then
		local var_7_12 = TAB.GetIndex(TAB.MP.BATTLE_PASS)

		if var_7_12 then
			LUI.FlowManager.GetScopedData("MainMenu").brRewardPending = true
			LUI.FlowManager.GetScopedData(arg_7_0).activeTabIndex = var_7_12
			arg_7_0._brRewardFlowInit = true
		end
	end

	arg_7_0.MPTabsMenu:SetupTabs(arg_7_1)

	if arg_7_0._useStandaloneStore then
		return
	end

	local var_7_13 = LUI.FlowManager.GetScopedData(arg_7_0)

	if CONDITIONS.IsTrialLicense() and not var_7_13.trialPopupShown then
		var_7_13.trialPopupShown = true

		LUI.FlowManager.RequestPopupMenu(arg_7_0, "TrialFullWindow", true, arg_7_1, false)
	end

	if Dvar.CFHDGABACF("NMPNSQNNRQ") == AAR.MagmaSummaryState.BR_PARADE_READY then
		Dvar.DFIJDJFIFD("NMPNSQNNRQ", AAR.MagmaSummaryState.BR_SUMMARY_READY)
		Lobby.OpenAfterActionReport(arg_7_1, false, true)
	end

	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LNQTQQPLRO") and Engine.CFJEBEJCFC() and Engine.JCFIBGGJB() and Dvar.IBEGCHEFE("NROLSNKS") then
		Engine.BJFJDCFDID("MW_Highlights")
		Dvar.DHEGHJJJHI("NROLSNKS", false)
	end

	SURVEY.OpenPostGameSurveyIfRequired(arg_7_1, true)

	local var_7_14 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.completedVanguardEvent")

	if var_7_14:GetValue(arg_7_1) then
		var_7_14:SetValue(arg_7_1, false)
		LUI.FlowManager.RequestPopupMenu(arg_7_0, "VGPreOrderUpsellPopup", true, arg_7_1, false, {
			mainMenuRef = arg_7_0
		})
	end

	EventRewards.CheckAndProcessRewards(arg_7_0, arg_7_1)
	TRIALS.FixUpLoot(arg_7_1)

	if Dvar.IBEGCHEFE("MNMTKTRPPP") then
		LUI.FlowManager.RequestPopupMenu(nil, "ProgramDetectedErrorPopup", true, arg_7_1, false, {}, nil, true, true)
	end

	arg_7_0:addEventHandler("OverwolfDetectedEvent", function(arg_17_0, arg_17_1)
		LUI.FlowManager.RequestPopupMenu(nil, "ProgramDetectedErrorPopup", true, arg_7_1, false, {}, nil, true, true)
	end)
	arg_7_0:addEventHandler("gift_queue_process", function(arg_18_0, arg_18_1)
		local var_18_0 = Gifting.DBCIFGGCEG(arg_7_1)

		if var_18_0 and #var_18_0 > 0 then
			GIFT.WaitForTransitionAndProcessGift(arg_7_0, arg_7_1, "BRMainMenu")
		end
	end)

	if CONDITIONS.IsUserSignedInDemonware(arg_7_1) then
		LOOT.CheckCustomizationsShouldBeEquipped(arg_7_1)
		WEAPON.CheckWeaponsShouldBeEquipped(arg_7_1)
		OPERATOR.CheckCustomizationsShouldBeEquipped(arg_7_1)
	end
end

function var_0_1(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "BRMainMenu"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)
	var_0_5(var_19_0, var_19_1, arg_19_1)

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

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_19_6 = MenuBuilder.BuildRegisteredType("IGRXPBonusTip", {
			controllerIndex = var_19_1
		})

		var_19_6.id = "IGRXPBonusTip"

		var_19_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -224, _1080p * 576, _1080p * -70, 0)
		var_19_0:addElement(var_19_6)

		var_19_0.IGRXPBonusTip = var_19_6
	end

	var_0_6(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("BRMainMenu", var_0_1)
LUI.FlowManager.RegisterStackPushBehaviour("BRMainMenu", var_0_0)
LockTable(_M)
