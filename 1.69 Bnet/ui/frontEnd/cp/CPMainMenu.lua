module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CPMainMenu", {
	"premium",
	"mpPrivilegePremium",
	"crossPlayPrivilege",
	"ugcPrivilege",
	"onlineCommunicationsPrivilege",
	"onlineServiceSubscription",
	"cp",
	"cpOnlineData",
	"shaderUpload",
	"fenceSpinner",
	"playlists",
	"catalog"
})
LUI.FlowManager.RequestSetStack("CPMainMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	}
})

local function var_0_0(arg_1_0, arg_1_1)
	MP_COMMON.SetupParty()
	Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY)
	Engine.DAGFFDGFII("uploadstats", arg_1_1)

	if not Engine.DAFGFCFHJI() then
		Lobby.BHDJFHEDJG(arg_1_1)
	end

	Lobby.EAHFJBBBBD(PartyUIRoot.CP_MAIN_MENU)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.controller or Engine.IJEBHJIJF()

	Engine.DAGFFDGFII(CPConfig.default_aliens, var_2_0)
	CP.InitGameTypeToSurvival()
	CP.ClearWaveLoadout(var_2_0)
	CP.ClearAllPickupMunitions(var_2_0)

	local var_2_1 = true

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.DAFGFCFHJI() then
		var_2_1 = false
	end

	if var_2_1 then
		Lobby.BHDJFHEDJG(var_2_0)
	end

	if CONDITIONS.IsSeasonalEventActive() then
		local var_2_2 = SEASONAL_EVENT.GetCurrentSeasonalEventOnboadingData()

		if var_2_2 and not var_2_2.WasCompleted(arg_2_0, var_2_0) then
			if LUI.FlowManager.IsInStack("SeasonalEventIntroPopup") or LUI.FlowManager.IsInStack("SeasonalEventDetailsPopup") or LUI.FlowManager.IsInStack("SeasonalEventSpecialPopup") then
				return
			end

			local var_2_3 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

			if var_2_3.onboardingBink == nil or var_2_3.onboardingBink.isKorea15Unsafe and Engine.FABABBDBA() then
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "SeasonalEventDetailsPopup", true, var_2_0, false, {})
			else
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "SeasonalEventIntroPopup", true, var_2_0, false, {})
			end

			return
		end
	end

	if not LUI.DataSourceInControllerModel.new("alwaysLoaded.openedSeasonalFlow"):GetValue(var_2_0) then
		if BATTLEPASS.VIPGiftAvailable(var_2_0) then
			if LUI.FlowManager.IsInStack("BattlePassVIPGiftUpsell") then
				arg_2_0._canOpenDailyPopup = true

				return
			end

			LUI.FlowManager.RequestPopupMenu(arg_2_0, "BattlePassVIPGiftIntro", true, var_2_0, false, {})

			arg_2_0._canOpenDailyPopup = true

			return
		end

		if BATTLEPASS.ShouldShowFreeTierUpsell(var_2_0) then
			LUI.FlowManager.RequestPopupMenu(arg_2_0, "BattlePassFreeTierUpsell", true, var_2_0, false, {
				sourceMenu = arg_2_0
			})

			return
		end

		DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_2_0, var_2_0)

		if not LUI.WebViewManager.MotdEnabled() then
			CRM.OpenCRMWindows(arg_2_0)
		end

		arg_2_0._canOpenDailyPopup = true
	end
end

local function var_0_2()
	MP_COMMON.RefreshDataForFirstController()
	Dvar.DHEGHJJJHI("QTQRQPLNK", false)
	WipeGlobalModelsAtPath("menu.spltscreenDisplay.controllerIndex")
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	Dvar.DHEGHJJJHI("MLQNQTRRTK", false)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	Engine.DFJDIFJEGA("initialGameMode", MAIN_MENU.BladeKeys.CP, arg_5_1)
	Engine.DFJDIFJEGA("isCPNew", 0, arg_5_1)
	Engine.EBIDFIDHIE("updategamerprofile")
	arg_5_0:SetAlpha(0, 0)
	arg_5_0:SetAlpha(1, 400, LUI.EASING.outQuadratic)
	MP_COMMON.SetupStreaming(arg_5_0, arg_5_1)

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_5_0) then
		arg_5_0.MPTabsMenu:registerEventHandler("focus_tab_changed", function(arg_6_0, arg_6_1)
			local var_6_0 = arg_6_1.tabName
			local var_6_1 = false

			if var_6_0 == "CPPlayMenu" then
				var_6_1 = true

				ACTIONS.AnimateSequence(arg_5_0.IGRXPBonusTip, "RankXPBonus")
			elseif var_6_0 == "MPWeaponMenu" then
				var_6_1 = true

				ACTIONS.AnimateSequence(arg_5_0.IGRXPBonusTip, "WeaponXPBonus")
			elseif var_6_0 == "BattlePassMenu" then
				var_6_1 = true

				ACTIONS.AnimateSequence(arg_5_0.IGRXPBonusTip, "BattlePassXPBonus")
			end

			arg_5_0.IGRXPBonusTip:SetAlpha(var_6_1 and 1 or 0, 0)
		end)
	end

	arg_5_0:addEventHandler("menu_create", var_0_1)
	arg_5_0:addEventHandler("restore_focus", function(arg_7_0, arg_7_1)
		if arg_5_0._canOpenDailyPopup and not arg_5_0.openedDailyPopup and arg_5_0.nextLocation == nil then
			Challenge.OpenDailyPopup(arg_7_0, arg_7_1.controller)
		end
	end)
	MP_COMMON.SetupOnline()
	var_0_0(arg_5_0, arg_5_1)
	assert(arg_5_0.bindButton)
	arg_5_0.MPTabsMenu:SetupBackButtonHandler(function(arg_8_0, arg_8_1)
		if Lobby.IsNotAloneInPrivateParty() and MP_COMMON.ShouldShowLeaveMenuConfirmPopupIfHost() then
			MP_COMMON.LeavePartyAndStayInMenu(arg_5_0, arg_8_1)
		else
			MP_COMMON.TriggerLeaveMainGamemodeMenu(arg_5_0, arg_8_1)
		end
	end)
	arg_5_0.MPTabsMenu:SetupTabs(arg_5_1, {
		firstTabWidget = "CPPlayMenu"
	})

	local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)

	if CONDITIONS.IsTrialLicense() and not var_5_0.trialPopupShown then
		var_5_0.trialPopupShown = true

		LUI.FlowManager.RequestPopupMenu(arg_5_0, "TrialFullWindow", true, arg_5_1, false)
	end

	CP.CheckpointRefreshTimer(arg_5_0, arg_5_1)
	SURVEY.OpenPostGameSurveyIfRequired(arg_5_1, true)

	if Dvar.IBEGCHEFE("MNMTKTRPPP") then
		LUI.FlowManager.RequestPopupMenu(nil, "ProgramDetectedErrorPopup", true, arg_5_1, false, {}, nil, true, true)
	end

	arg_5_0:addEventHandler("OverwolfDetectedEvent", function(arg_9_0, arg_9_1)
		LUI.FlowManager.RequestPopupMenu(nil, "ProgramDetectedErrorPopup", true, arg_5_1, false, {}, nil, true, true)
	end)

	if CONDITIONS.IsUserSignedInDemonware(arg_5_1) then
		LOOT.CheckCustomizationsShouldBeEquipped(arg_5_1)
		WEAPON.CheckWeaponsShouldBeEquipped(arg_5_1)
		OPERATOR.CheckCustomizationsShouldBeEquipped(arg_5_1)
	end
end

function CPMainMenu(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIHorizontalNavigator.new()

	var_10_0.id = "CPMainMenu"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)
	var_0_3(var_10_0, var_10_1, arg_10_1)

	var_10_0.soundSet = "cpMainMenuDefault"
	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "MPTabsMenu"

	var_10_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.MPTabsMenu = var_10_4

	local var_10_5

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_10_6 = MenuBuilder.BuildRegisteredType("IGRXPBonusTip", {
			controllerIndex = var_10_1
		})

		var_10_6.id = "IGRXPBonusTip"

		var_10_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -224, _1080p * 430, _1080p * -70, 0)
		var_10_0:addElement(var_10_6)

		var_10_0.IGRXPBonusTip = var_10_6
	end

	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_10_7 = LUI.UIBindButton.new()

	var_10_7.id = "selfBindButton"

	var_10_0:addElement(var_10_7)

	var_10_0.bindButton = var_10_7

	var_10_0.bindButton:addEventHandler("button_start", function(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_1.controller or var_10_1

		ACTIONS.OpenOptionsMenu(var_11_0, "", "", "")
	end)
	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("CPMainMenu", CPMainMenu)
LUI.FlowManager.RegisterStackPushBehaviour("CPMainMenu", var_0_2)
LockTable(_M)
