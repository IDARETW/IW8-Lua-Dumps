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

LUI.FlowManager.RegisterFenceGroup("MPMainMenu", {
	"premium",
	"onlineServiceSubscription",
	"mp",
	"mpInstall",
	"mpOnlineData",
	"shaderUpload",
	"fnf",
	"contracts",
	"fenceSpinner",
	"playlists"
})
LUI.FlowManager.RequestSetStack("MPMainMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	}
})

local function var_0_2(arg_3_0, arg_3_1)
	MP_COMMON.SetupParty()
	Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY)
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

	Lobby.EAHFJBBBBD(PartyUIRoot.MP_MAIN_MENU)
end

local function var_0_3(arg_4_0, arg_4_1)
	Dvar.BDEHAEGHAF("ui_version_show", "0")
	Dvar.DHEGHJJJHI("MTSTMKPMRM", false)

	local var_4_0 = arg_4_1.controller or Engine.IJEBHJIJF()

	Lobby.CheckTURequirement(arg_4_0, var_4_0)
	Engine.DAGFFDGFII(CoD.GetMPOnlineCfg(), var_4_0)
	arg_4_0:registerEventHandler("not_below_blocking_fence", function(arg_5_0, arg_5_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)

		if not MLG.JIHGCIJCG() then
			local var_5_0 = true

			if CONDITIONS.ArePartiesEnabledInMainMenu() and Engine.DAFGFCFHJI() then
				var_5_0 = false
			end

			if var_5_0 then
				DebugPrint("MPMainMenu::OnMenuCreate")
				Lobby.BHDJFHEDJG(var_4_0)
			end
		end
	end)
	DYN_ATTACHMENT.ReloadLoadoutWeaponStreamedImages(arg_4_0, var_4_0)

	if BATTLEPASS.VIPGiftAvailable(var_4_0) then
		if Engine.BHICADFIHA() and LUI.FlowManager.IsInStack("BattlePassVIPGiftUpsell") then
			return
		end

		LUI.FlowManager.RequestPopupMenu(arg_4_0, "BattlePassVIPGiftIntro", true, var_4_0, false, {})

		return
	end

	if BATTLEPASS.ShouldShowFreeTierUpsell(var_4_0) then
		LUI.FlowManager.RequestPopupMenu(arg_4_0, "BattlePassFreeTierUpsell", true, var_4_0, false, {
			sourceMenu = arg_4_0
		})

		return
	end

	CRM.OpenCRMWindows(arg_4_0)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") and MLG.BIHFEHBCFB(arg_6_1) ~= GAMEBATTLES.INVALID_MATCH_ID then
		GAMEBATTLES.RemoveSubscriptions(arg_6_1)
		MLG.ResetGameBattleMatchId(arg_6_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
	end

	PROGRESSION.PrestreamGamemodeIcons(arg_6_0)
	MLG.ArbitrarilySetCDLRuleset(arg_6_1)
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	if Engine.CGABICJHAI() and OnlineABTesting.DEFDBJBAJ(arg_7_1) and Dvar.IBEGCHEFE("MNNMPMRSLT") and not Dvar.IBEGCHEFE("NPMRNRNPPT") then
		Engine.BGHCDBAGFB(arg_7_1)
		Dvar.DHEGHJJJHI("NPMRNRNPPT", true)
	end

	if OnlineABTesting.DEFDBJBAJ(arg_7_1) then
		local var_7_0 = Engine.BECCFCBIAA("hasPlayerChangedAimAssistSetting", arg_7_1)
		local var_7_1 = Engine.BECCFCBIAA("hasEnrolledInAimAssistExperiment", arg_7_1)

		if not var_7_0 and not var_7_1 then
			local var_7_2 = DataModel.DJJHBDCEAB(arg_7_1)
			local var_7_3 = DataModel.DGADFJACCI(var_7_2, "abtesting.aimassist.value")

			if var_7_3 then
				local var_7_4 = DataModel.JJEHAEBDF(var_7_3)

				if var_7_4 then
					Engine.DFJDIFJEGA("aimAssistType", var_7_4, arg_7_1)
					Engine.DFJDIFJEGA("hasEnrolledInAimAssistExperiment", 1, arg_7_1)
				end
			end
		end
	end

	Engine.DFJDIFJEGA("initialGameMode", MAIN_MENU.BladeKeys.MP, arg_7_1)
	Engine.DFJDIFJEGA("isMPNew", 0, arg_7_1)
	Engine.EBIDFIDHIE("updategamerprofile")

	arg_7_0.isSignInMenu = true
	arg_7_0.signoutSplitscreen = true

	arg_7_0:SetAlpha(0, 0)
	arg_7_0:SetAlpha(1, 400, LUI.EASING.outQuadratic)
	MP_COMMON.SetupStreaming(arg_7_0, arg_7_1)
	Engine.BBEEIGHJBA("music_mainmenu_mp")

	if CONDITIONS.IsInKoreanIGRPaidSession(arg_7_0) then
		arg_7_0.MPTabsMenu:registerEventHandler("focus_tab_changed", function(arg_8_0, arg_8_1)
			local var_8_0 = arg_8_1.tabName
			local var_8_1 = false

			if var_8_0 == "MPPlayMenu" then
				var_8_1 = true

				ACTIONS.AnimateSequence(arg_7_0.IGRXPBonusTip, "RankXPBonus")
			elseif var_8_0 == "MPWeaponMenu" then
				var_8_1 = true

				ACTIONS.AnimateSequence(arg_7_0.IGRXPBonusTip, "WeaponXPBonus")
			elseif var_8_0 == "BattlePassMenu" then
				var_8_1 = true

				ACTIONS.AnimateSequence(arg_7_0.IGRXPBonusTip, "BattlePassXPBonus")
			end

			arg_7_0.IGRXPBonusTip:SetAlpha(var_8_1 and 1 or 0, 0)
		end)
	end

	MP_COMMON.SetupOnline()
	var_0_2(arg_7_0, arg_7_1)
	arg_7_0:addEventHandler("menu_create", var_0_3)
	assert(arg_7_0.bindButton)
	arg_7_0.MPTabsMenu:SetupBackButtonHandler(function(arg_9_0, arg_9_1)
		MP_COMMON.TriggerLeaveMainGamemodeMenu(arg_7_0, arg_9_1)
	end)

	if arg_7_2 and arg_7_2.isBR then
		Dvar.BDEHAEGHAF("MOLPOSLOMO", "br")
	end

	arg_7_0.MPTabsMenu:SetupTabs(arg_7_1)

	local var_7_5 = LUI.FlowManager.GetScopedData(arg_7_0)

	if CONDITIONS.IsTrialLicense() and not var_7_5.trialPopupShown then
		var_7_5.trialPopupShown = true

		LUI.FlowManager.RequestPopupMenu(arg_7_0, "TrialFullWindow", true, arg_7_1, false)
	end

	SURVEY.OpenPostGameSurveyIfRequired(arg_7_1, true)

	local var_7_6 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areMLGRulesEnabled")

	arg_7_0:SubscribeToModel(var_7_6:GetModel(arg_7_1), function()
		if not MLG.IsHost() and not Lobby.BBDICGHE() then
			if Lobby.DFHGBJJAGC() then
				MatchRules.DJEIAJCAD()
			else
				MLG.ResetMatchRulesData()
			end

			arg_7_0:dispatchEventToChildren({
				name = "matchrules_updated",
				controllerIndex = arg_7_1
			})
		end
	end)
end

function MPMainMenu(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "MPMainMenu"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)
	var_0_4(var_11_0, var_11_1, arg_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "MPTabsMenu"

	var_11_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.MPTabsMenu = var_11_4

	local var_11_5

	if CONDITIONS.IsInKoreanIGRPaidSession(var_11_0) then
		local var_11_6 = MenuBuilder.BuildRegisteredType("IGRXPBonusTip", {
			controllerIndex = var_11_1
		})

		var_11_6.id = "IGRXPBonusTip"

		var_11_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -224, _1080p * 576, _1080p * -70, 0)
		var_11_0:addElement(var_11_6)

		var_11_0.IGRXPBonusTip = var_11_6
	end

	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_11_7 = LUI.UIBindButton.new()

	var_11_7.id = "selfBindButton"

	var_11_0:addElement(var_11_7)

	var_11_0.bindButton = var_11_7

	var_11_0.bindButton:addEventHandler("button_start", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.controller or var_11_1

		ACTIONS.OpenOptionsMenu(var_12_0, "")
	end)
	var_0_5(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("MPMainMenu", MPMainMenu)
LUI.FlowManager.RegisterStackPushBehaviour("MPMainMenu", var_0_1)
LUI.FlowManager.RegisterStackPopBehaviour("MPMainMenu", var_0_0)
LockTable(_M)
