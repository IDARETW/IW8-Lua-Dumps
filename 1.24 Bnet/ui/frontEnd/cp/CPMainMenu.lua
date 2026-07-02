module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CPMainMenu", {
	"premium",
	"onlineServiceSubscription",
	"cp",
	"cpOnlineData",
	"shaderUpload",
	"fenceSpinner",
	"playlists"
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

	if BATTLEPASS.VIPGiftAvailable(var_2_0) then
		if Engine.BHICADFIHA() and LUI.FlowManager.IsInStack("BattlePassVIPGiftUpsell") then
			return
		end

		LUI.FlowManager.RequestPopupMenu(arg_2_0, "BattlePassVIPGiftIntro", true, var_2_0, false, {})

		return
	end

	if BATTLEPASS.ShouldShowFreeTierUpsell(var_2_0) then
		LUI.FlowManager.RequestPopupMenu(arg_2_0, "BattlePassFreeTierUpsell", true, var_2_0, false, {
			sourceMenu = arg_2_0
		})

		return
	end

	DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_2_0, var_2_0)
	CRM.OpenCRMWindows(arg_2_0)
end

local function var_0_2()
	MP_COMMON.RefreshDataForFirstController()
	Dvar.DHEGHJJJHI("QTQRQPLNK", false)
	WipeGlobalModelsAtPath("menu.spltscreenDisplay.controllerIndex")
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	Engine.DFJDIFJEGA("initialGameMode", MAIN_MENU.BladeKeys.CP, arg_4_1)
	Engine.DFJDIFJEGA("isCPNew", 0, arg_4_1)
	Engine.EBIDFIDHIE("updategamerprofile")
	arg_4_0:SetAlpha(0, 0)
	arg_4_0:SetAlpha(1, 400, LUI.EASING.outQuadratic)
	MP_COMMON.SetupStreaming(arg_4_0, arg_4_1)

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_4_0) then
		arg_4_0.MPTabsMenu:registerEventHandler("focus_tab_changed", function(arg_5_0, arg_5_1)
			local var_5_0 = arg_5_1.tabName
			local var_5_1 = false

			if var_5_0 == "CPPlayMenu" then
				var_5_1 = true

				ACTIONS.AnimateSequence(arg_4_0.IGRXPBonusTip, "RankXPBonus")
			elseif var_5_0 == "MPWeaponMenu" then
				var_5_1 = true

				ACTIONS.AnimateSequence(arg_4_0.IGRXPBonusTip, "WeaponXPBonus")
			elseif var_5_0 == "BattlePassMenu" then
				var_5_1 = true

				ACTIONS.AnimateSequence(arg_4_0.IGRXPBonusTip, "BattlePassXPBonus")
			end

			arg_4_0.IGRXPBonusTip:SetAlpha(var_5_1 and 1 or 0, 0)
		end)
	end

	arg_4_0:addEventHandler("menu_create", var_0_1)
	MP_COMMON.SetupOnline()
	var_0_0(arg_4_0, arg_4_1)
	assert(arg_4_0.bindButton)
	arg_4_0.MPTabsMenu:SetupBackButtonHandler(function(arg_6_0, arg_6_1)
		MP_COMMON.TriggerLeaveMainGamemodeMenu(arg_4_0, arg_6_1)
	end)
	arg_4_0.MPTabsMenu:SetupTabs(arg_4_1, {
		firstTabWidget = "CPPlayMenu"
	})

	local var_4_0 = LUI.FlowManager.GetScopedData(arg_4_0)

	if CONDITIONS.IsTrialLicense() and not var_4_0.trialPopupShown then
		var_4_0.trialPopupShown = true

		LUI.FlowManager.RequestPopupMenu(arg_4_0, "TrialFullWindow", true, arg_4_1, false)
	end

	CP.CheckpointRefreshTimer(arg_4_0, arg_4_1)
	SURVEY.OpenPostGameSurveyIfRequired(arg_4_1, true)
end

function CPMainMenu(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIHorizontalNavigator.new()

	var_7_0.id = "CPMainMenu"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	var_7_0.soundSet = "cpMainMenuDefault"
	var_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})
	var_7_0.HelperBar.id = "HelperBar"

	var_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_7_0.HelperBar:setPriority(10)
	var_7_0:addElement(var_7_0.HelperBar)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "MPTabsMenu"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.MPTabsMenu = var_7_4

	local var_7_5

	if CONDITIONS.IsInKoreanIGRPaidSession(var_7_0) then
		local var_7_6 = MenuBuilder.BuildRegisteredType("IGRXPBonusTip", {
			controllerIndex = var_7_1
		})

		var_7_6.id = "IGRXPBonusTip"

		var_7_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -224, _1080p * 430, _1080p * -70, 0)
		var_7_0:addElement(var_7_6)

		var_7_0.IGRXPBonusTip = var_7_6
	end

	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_7_7 = LUI.UIBindButton.new()

	var_7_7.id = "selfBindButton"

	var_7_0:addElement(var_7_7)

	var_7_0.bindButton = var_7_7

	var_7_0.bindButton:addEventHandler("button_start", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.controller or var_7_1

		ACTIONS.OpenOptionsMenu(var_8_0, "")
	end)
	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("CPMainMenu", CPMainMenu)
LUI.FlowManager.RegisterStackPushBehaviour("CPMainMenu", var_0_2)
LockTable(_M)
