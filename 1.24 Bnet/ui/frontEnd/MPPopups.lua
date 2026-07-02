module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

local function var_0_0(arg_1_0, arg_1_1)
	Engine.DAGFFDGFII("xstopprivateparty 0", arg_1_1)
	Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	Dvar.DHEGHJJJHI("splitscreen", false)
	Engine.BGIDADECDJ()
	Engine.EBIDFIDHIE("xstopparty")
	Engine.BIGIHAGAAA()

	if not LUI.FlowManager.IsMenuOnTop("MainMenu") then
		LUI.FlowManager.RequestRestoreMenu("MainMenu", true, arg_1_1, true)
	end
end

function TURequiredWarning()
	local var_2_0 = {
		title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED"),
		action = var_0_0
	}
	local var_2_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_2_0)

	var_2_1.id = "TURequiredWarning"

	return var_2_1
end

local function var_0_1(arg_3_0, arg_3_1)
	Dvar.DHEGHJJJHI("MKKNSMLKPR", true)
	Dvar.BDEHAEGHAF("LQSPQSNQSN", "MPUI/NEW_PATCH_RESTART")
end

function newPatchManifestRestart()
	local var_4_0 = {
		confirmation_action = var_0_1,
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("MPUI/NEW_PATCH_AVAILABLE"),
		button_text = Engine.CBBHFCGDIC("MENU/OK")
	}
	local var_4_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_4_0)

	var_4_1.id = "newPatchManifestRestart"

	return var_4_1
end

function error_popmenu_lobby()
	local var_5_0 = {
		title = Dvar.DHEEJCCJBH("NSNNTPQPNT"),
		message = Dvar.DHEEJCCJBH("OMSSQKRMLQ"),
		action = function()
			Engine.IBCDJDCJC()
		end
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_5_0)

	var_5_1.id = "error_popmenu_lobby"

	return var_5_1
end

function leave_public_mp_lobby_action()
	Lobby.LeavePublicLobby()

	if LUI.FlowManager.IsInStack("MPPublicLobby") then
		LUI.FlowManager.RequestLeaveMenuByName("MPPublicLobby", true, true)
	elseif LUI.FlowManager.IsInStack("BRPublicLobby") then
		LUI.FlowManager.RequestLeaveMenuByName("BRPublicLobby", true, true)
	end

	LUI.FlowManager.LeaveQuickMenus()
end

function leave_public_mp_lobby()
	local var_8_0 = {
		title = Engine.CBBHFCGDIC("XBOXLIVE/LEAVELOBBY"),
		message = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_LOBBY")
	}
	local var_8_1 = "PopupYesNo"

	local function var_8_2()
		if Lobby.AreWePrivatePartyHost() and Lobby.IsNotAloneInPrivateParty() then
			Engine.DAGFFDGFII("xstopprivateparty 1 1")
			Engine.DAGFFDGFII("xstartprivateparty")
		end

		leave_public_mp_lobby_action()
	end

	var_8_0.yesAction = leave_public_mp_lobby_action

	if Lobby.GFFECBCCF() and Lobby.IsNotAloneInPrivateParty() then
		var_8_0.yesLabel = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_LOBBY_AND_PARTY")

		if Lobby.BGIADHIHAG() then
			var_8_1 = "PopupYesNoCancel"
			var_8_0.yesAction = leave_public_mp_lobby_action
			var_8_0.yesLabel = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_WITH_PARTY")
			var_8_0.noAction = var_8_2
			var_8_0.noLabel = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_WITHOUT_PARTY")
		end
	end

	if Engine.BAHIIBFDDG() then
		var_8_0.rateLimitIntervalMS = 5000
		var_8_0.rateLimitAttempts = 3
	end

	local var_8_3 = MenuBuilder.BuildRegisteredType(var_8_1, var_8_0)

	var_8_3.id = "leave_public_mp_lobby"

	return var_8_3
end

function leave_private_mp_lobby_yes()
	if Lobby.CAEJIEEEDF() > 0 then
		Lobby.CJBHJEAFGH(0)
	end

	Lobby.LeaveCustomGameLobby()
	CODCASTER.SetCODCastingEnabled(false)
	MLG.SetUsingMLGRules(false)

	if LUI.FlowManager.IsInStack("PrivateMatchLobby") then
		LUI.FlowManager.RequestLeaveMenuByName("PrivateMatchLobby", true, true)
	end

	LUI.FlowManager.LeaveQuickMenus()
end

function leave_private_mp_lobby()
	local var_11_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVELOBBY"),
		yesAction = leave_private_mp_lobby_yes,
		noAction = function()
			return
		end
	}
	local var_11_1
	local var_11_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_11_0)

	var_11_2.id = "leave_private_mp_lobby"

	return var_11_2
end

function youarehost()
	local var_13_0 = {
		title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("@MPUI/YOUAREHOST")
	}
	local var_13_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_13_0)

	var_13_1.id = "youarehost"

	return var_13_1
end

function LootItemError()
	local var_14_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CRAFTING_ERROR")
	}
	local var_14_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_14_0)

	var_14_1.id = "LootItemError"

	return var_14_1
end

function makehostfailed()
	local var_15_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC(Dvar.DHEEJCCJBH("OLQPNSLPRP"))
	}
	local var_15_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_15_0)

	var_15_1.id = "makehostfailed"

	return var_15_1
end

function AcceptInviteWarningConfirm(arg_16_0, arg_16_1)
	LUI.FlowManager.RequestLeaveMenu(arg_16_0, nil)
	Engine.DAGFFDGFII("xstopprivateparty")
	Engine.DAGFFDGFII("xstartprivateparty")
	Engine.DAGFFDGFII("confirmInvite")
end

function AcceptInviteWarningCancel(arg_17_0, arg_17_1)
	LUI.FlowManager.RequestLeaveMenu(arg_17_0, nil)
	Engine.DAGFFDGFII("cancelInvite")
end

function acceptinvite_warning_for_leaving_party()
	local var_18_0 = {
		message_text = Engine.CBBHFCGDIC("MENU/LEAVEPARTYWARNING"),
		popup_title = Engine.CBBHFCGDIC("MENU/ACCEPTINVITETITLE"),
		yes_text = Engine.CBBHFCGDIC("MENU/CONFIRMINVITE"),
		no_text = Engine.CBBHFCGDIC("MENU/RESUMEGAME"),
		yes_action = AcceptInviteWarningConfirm,
		no_action = AcceptInviteWarningCancel
	}
	local var_18_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_18_0)

	var_18_1.id = "acceptinvite_warning_for_leaving_party"

	return var_18_1
end

function acceptinvite_warning_invitable_privilege_missing()
	local var_19_0 = {
		message_text = Engine.CBBHFCGDIC("ONLINE/INVITE_PRIVILEGE_MISSING_WARNING"),
		popup_title = Engine.CBBHFCGDIC("MENU/ACCEPTINVITETITLE"),
		yes_text = Engine.CBBHFCGDIC("MENU/TRY_AGAIN"),
		no_text = Engine.CBBHFCGDIC("MENU/RESUMEGAME"),
		yes_action = AcceptInviteWarningConfirm,
		no_action = AcceptInviteWarningCancel
	}
	local var_19_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_19_0)

	var_19_1.id = "acceptinvite_warning_invitable_privilege_missing"

	return var_19_1
end

function CancelJoinInProgressWithPassword(arg_20_0, arg_20_1)
	Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	Engine.EBIDFIDHIE("stopListening")
	Engine.EBIDFIDHIE("xstopparty PASSWORD_POPUP_CANCELED_ACTION")
	Engine.EBIDFIDHIE("xstopprivateparty")
	Engine.EBIDFIDHIE("xcancelconnectingdialog")
	Engine.EBIDFIDHIE("resetautoconnect")
	LUI.FlowManager.RequestLeaveMenu(arg_20_0)
end

function jip_with_password()
	local var_21_0 = LUI.UIElement.new()

	var_21_0.id = "jip_with_password_id"

	var_21_0:registerEventHandler("menu_create", function(arg_22_0, arg_22_1)
		Dvar.BDEHAEGHAF("MQSMMPSKQT", "")
		OSK.CBJGJDGFC(0, Engine.CBBHFCGDIC("MENU/PASSWORD"), "", Lobby.PasswordLength, false, false, false, function(arg_23_0, arg_23_1, arg_23_2)
			if not arg_23_1 then
				CancelJoinInProgressWithPassword(arg_22_0, nil)
			else
				Dvar.BDEHAEGHAF("MQSMMPSKQT", arg_23_1)
				Engine.EBIDFIDHIE("xjoinpasswordparty")
				LUI.FlowManager.RequestLeaveMenu(arg_22_0)
			end
		end, CoD.KeyboardInputTypes.Password, true)
	end)

	return var_21_0
end

function mlg_error_no_rules_available_offline()
	local var_24_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/MLG_NO_RULES_AVAILABLE_OFFLINE")
	}
	local var_24_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_24_0)

	var_24_1.id = "mlg_error_no_rules_available_offline"

	return var_24_1
end

function mlg_error_no_rules_available()
	local var_25_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/MLG_NO_RULES_AVAILABLE")
	}
	local var_25_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_25_0)

	var_25_1.id = "mlg_error_no_rules_available"

	return var_25_1
end

function mp_no_guest_popup()
	local var_26_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("MENU/NO_GUEST")
	}
	local var_26_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_26_0)

	var_26_1.id = "mp_no_guest_popup"

	return var_26_1
end

function strict_nat_warning()
	local var_27_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/STRICTPARTYWARNING")
	}
	local var_27_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_27_0)

	var_27_1.id = "strict_nat_warning"

	return var_27_1
end

function dc_qos_failed_warning()
	local var_28_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("NETWORK/DCQOSFAILEDWARNING")
	}
	local var_28_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_28_0)

	var_28_1.id = "dc_qos_failed_warning"

	return var_28_1
end

function mm_invalid_player_info_popup()
	local var_29_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("ONLINE/MM_INVALID_PLAYER_INFO")
	}

	leave_public_mp_lobby_action()

	local var_29_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_29_0)

	var_29_1.id = "mm_invalid_player_info_popup"

	return var_29_1
end

function mp_panic_buttons_popup()
	local var_30_0 = {}

	var_30_0.popup_title = "Something went wrong!"
	var_30_0.message_text = "It sounds like something went wrong. Please backout to the boot screen and re-enter matchmaking. If that doesn't work reboot the game and try again."

	local var_30_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_30_0)

	var_30_1.id = "mp_panic_buttons_popup"

	return var_30_1
end

function popup_handle_lootcrate(arg_31_0, arg_31_1)
	assert(arg_31_1)
	assert(arg_31_1.cratePopupType)

	local var_31_0 = {
		message = STORE.CratePopupInfo[arg_31_1.cratePopupType].message,
		title = STORE.CratePopupInfo[arg_31_1.cratePopupType].title
	}
	local var_31_1

	if arg_31_1.cratePopupType == STORE.CratePopupType.OPEN or arg_31_1.cratePopupType == STORE.CratePopupType.PURCHASE then
		var_31_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_31_0)
	else
		var_31_0.showExit = true

		function var_31_0.cancel_func()
			LUI.FlowManager.RequestLeaveMenu()
		end

		var_31_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_31_0)
	end

	var_31_1.id = "popup_handle_lootcrate"

	return var_31_1
end

function ItemExchangeFencePopup(arg_33_0, arg_33_1)
	assert(arg_33_1)
	assert(arg_33_1.controllerIndex)

	local var_33_0 = {
		controllerIndex = arg_33_1.controllerIndex,
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASING_DLC")
	}
	local var_33_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_33_0)
	local var_33_2 = LUI.UITimer.new({
		interval = 500,
		event = {
			name = "refresh_fence_dialog"
		}
	})

	var_33_1:addElement(var_33_2)

	var_33_1._timeCount = 20000
	var_33_1._startTimer = false

	var_33_1:addEventHandler("ingamestore_purchased_product", function(arg_34_0, arg_34_1)
		var_33_1._startTimer = true
	end)
	var_33_1:addEventHandler("refresh_fence_dialog", function(arg_35_0, arg_35_1)
		if var_33_1._startTimer then
			var_33_1._timeCount = var_33_1._timeCount - 500

			if var_33_1._timeCount <= 0 then
				LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
			end
		end
	end)

	return var_33_1
end

function ItemExchangeFailedPopup()
	local var_36_0 = {
		showExit = true,
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/ITEM_EXCHANGE_FAILED"),
		title = STORE.CratePopupInfo[STORE.CratePopupType.PURCHASE_FAIL].title,
		cancel_func = function()
			LUI.FlowManager.RequestLeaveMenu()
		end
	}
	local var_36_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_36_0)

	var_36_1.id = "ItemExchangeFailedPopup"

	return var_36_1
end

function ChooseLocalPlay(arg_38_0, arg_38_1)
	assert(arg_38_1.dvarResetFunction)

	local var_38_0 = {
		title = Engine.CBBHFCGDIC("@MENU/CHOOSE_GAME_MODE_CAP")
	}

	var_38_0.message = ""
	var_38_0.defaultFocusIndex = 0
	var_38_0.buttons = {
		{
			label = ToUpperCase(Engine.CBBHFCGDIC("@MENU/MULTIPLAYER")),
			action = function(arg_39_0, arg_39_1)
				arg_38_1.dvarResetFunction()
				Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

				local var_39_0 = LUI.FlowManager.FlowMenus[PartyUIRoot.MP_SYSTEM_LINK]

				Engine.CDGCBCBAJ("Opening " .. var_39_0, arg_39_1)
				LUI.FlowManager.RequestAddMenu(var_39_0, true, arg_39_1, false)
			end
		},
		{
			label = Engine.CBBHFCGDIC("@LUA_MENU/COOP_CAPS"),
			action = function(arg_40_0, arg_40_1)
				arg_38_1.dvarResetFunction()
				Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

				local var_40_0 = LUI.FlowManager.FlowMenus[PartyUIRoot.CP_SYSTEM_LINK]

				Engine.CDGCBCBAJ("Opening " .. var_40_0, arg_40_1)
				LUI.FlowManager.RequestAddMenu(var_40_0, true, arg_40_1, false)
			end
		}
	}

	local var_38_1 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_38_0)

	var_38_1.id = "ChooseLocalPlay"

	return var_38_1
end

function ConfirmShouldBreakupPrivatePartyAndSplitscreenWarning(arg_41_0, arg_41_1)
	assert(arg_41_1.yesAction)

	local var_41_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/CONFIRM_BREAK_PARTY_WITH_SPLITSCREEN_WARNING"),
		yesAction = arg_41_1.yesAction
	}
	local var_41_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_41_0)

	var_41_1.id = "ConfirmShouldBreakupPrivatePartyAndSplitscreenWarning"

	return var_41_1
end

function ConfirmShouldBreakupPrivateParty(arg_42_0, arg_42_1)
	assert(arg_42_1.yesAction)

	local var_42_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/CONFIRM_BREAK_PARTY"),
		yesAction = arg_42_1.yesAction
	}
	local var_42_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_42_0)

	var_42_1.id = "ConfirmShouldBreakupPrivateParty"

	return var_42_1
end

function ConfirmShouldRemoveSplitscreenPlayerWarning(arg_43_0, arg_43_1)
	local var_43_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/CONFIRM_REMOVE_SPLITSCREEN_PLAYER_WARNING"),
		yesAction = arg_43_1.yesAction
	}
	local var_43_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_43_0)

	var_43_1.id = "ConfirmShouldRemoveSplitscreenPlayerWarning"

	return var_43_1
end

function OpeningMenuWithSplitscreenWarning(arg_44_0, arg_44_1)
	local var_44_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_NOTALLOWED_WARNING"),
		yesAction = arg_44_1.yesAction
	}
	local var_44_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_44_0)

	var_44_1.id = "OpeningMenuWithSplitscreenWarning"

	return var_44_1
end

function OpeningMenuWithSplitscreenPartyMemberWarning(arg_45_0, arg_45_1)
	local var_45_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_PARTY_NOTALLOWED_WARNING")
	}
	local var_45_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_45_0)

	var_45_1.id = "OpeningMenuWithSplitscreenPartyMemberWarning"

	return var_45_1
end

function OpeningMenuWithHighPrivatePartyMemberCountWarning(arg_46_0, arg_46_1)
	local var_46_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/HIGH_PARTY_MEMBER_COUNT_WARNING", arg_46_1.currentCount, arg_46_1.maxCount)
	}
	local var_46_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_46_0)

	var_46_1.id = "OpeningMenuWithHighPrivatePartyMemberCountWarning"

	return var_46_1
end

function EnteringGameModeWithHighPrivatePartyMemberCountWarning(arg_47_0, arg_47_1)
	local var_47_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU_MP/GAME_MODE_HIGH_PARTY_MEMBER_COUNT_WARNING", arg_47_1.currentCount, arg_47_1.maxCount)
	}
	local var_47_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_47_0)

	var_47_1.id = "EnteringGameModeWithHighPrivatePartyMemberCountWarning"

	return var_47_1
end

function code_redemption_success()
	local var_48_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/REDEEMED"),
		message_text = Engine.CBBHFCGDIC("MENU/BUNDLE_ADDED_TO_INVENTORY"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_48_0))
end

function code_already_redeemed_popup()
	local var_49_0 = {
		popup_title = Engine.CBBHFCGDIC("@GAME/WARNING"),
		message_text = Engine.CBBHFCGDIC("MENU/REDEMPTION_ALREADY_REDEEMED"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_49_0))
end

function code_expired_popup()
	local var_50_0 = {
		popup_title = Engine.CBBHFCGDIC("@GAME/WARNING"),
		message_text = Engine.CBBHFCGDIC("MENU/REDEMPTION_CODE_EXPIRED"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_50_0))
end

function code_redemption_failed_popup()
	local var_51_0 = {
		popup_title = Engine.CBBHFCGDIC("@GAME/WARNING"),
		message_text = Engine.CBBHFCGDIC("MENU/REDEMPTION_REDEMPTION_FAILED"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_51_0))
end

function RedeemingPopup(arg_52_0, arg_52_1)
	local var_52_0 = {
		message = Engine.CBBHFCGDIC("MENU/REDEMPTION_REDEEMING_PLEASE_WAIT")
	}
	local var_52_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_52_0)

	var_52_1.id = "RedeemingPopup"

	var_52_1:registerEventHandler("redemption_success", function(arg_53_0, arg_53_1)
		LUI.FlowManager.RequestLeaveMenu(arg_53_0)
	end)
	var_52_1:registerEventHandler("redemption_failed", function(arg_54_0, arg_54_1)
		LUI.FlowManager.RequestLeaveMenu(arg_54_0)
		DebugPrint("Code redeeming failed")

		if arg_54_1.errorAlreadyRedeemed then
			LUI.FlowManager.RequestPopupMenu(nil, "code_already_redeemed_popup")
		elseif arg_54_1.errorCodeExpired then
			LUI.FlowManager.RequestPopupMenu(nil, "code_expired_popup")
		else
			LUI.FlowManager.RequestPopupMenu(nil, "code_redemption_failed_popup")
		end
	end)

	return var_52_1
end

function ExchangeFailed()
	local var_55_0 = {
		popup_title = Engine.CBBHFCGDIC("@GAME/WARNING"),
		message_text = CONDITIONS.AreCODPointsEnabled() and Engine.CBBHFCGDIC("@EXE/EXCHANGE_ERROR") or Engine.CBBHFCGDIC("EXE/EXCHANGE_ERROR_NO_COD_POINTS"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_55_0))
end

function MPFullScreenVideoOverlay(arg_56_0, arg_56_1)
	arg_56_1 = arg_56_1 or {}

	assert(arg_56_1.videoRef)

	local var_56_0 = 1
	local var_56_1 = 2
	local var_56_2 = 3
	local var_56_3 = 4
	local var_56_4 = arg_56_1.doIntroFadeOut ~= false
	local var_56_5 = arg_56_1.doIntroFadeIn ~= false
	local var_56_6 = arg_56_1.doOutroFadeOut ~= false
	local var_56_7 = arg_56_1.doOutroFadeIn ~= false
	local var_56_8 = arg_56_1.fadeColor or COLORS.black
	local var_56_9 = 600
	local var_56_10 = arg_56_1.onCompletePlayback or nil
	local var_56_11 = LUI.UIElement.new()

	var_56_11.id = "MPFullScreenVideoOverlay"

	local var_56_12 = LUI.UIImage.new()

	var_56_12:setPriority(var_56_1)

	var_56_12.id = "fade"

	var_56_12:SetRGBFromTable(var_56_8)
	var_56_12:SetAlpha(0)
	var_56_11:addElement(var_56_12)

	local var_56_13
	local var_56_14
	local var_56_15
	local var_56_16
	local var_56_17

	local function var_56_18()
		var_56_17 = LUI.Cinematic.new()
		var_56_17.id = "bink"

		var_56_11:addElement(var_56_17)
		Engine.BEFHEEBHIA()
		Engine.DFCGFCGBFD(arg_56_1.videoRef)

		if var_56_5 then
			var_56_12:SetAlpha(1)

			var_56_12:Wait(150).onComplete = function()
				var_56_12:SetAlpha(0, var_56_9).onComplete = var_56_14
			end
		else
			var_56_14()
		end

		local var_57_0 = LUI.UITimer.new({
			interval = 100,
			event = {
				name = "check_exit_video"
			}
		})

		var_57_0.id = "checkExitTimer"

		var_56_11:addElement(var_57_0)
		var_57_0:registerEventHandler("check_exit_video", function()
			if Engine.BCJJBCDGAC() then
				var_56_11:exitMenu()
			end
		end)
	end

	function var_56_14()
		var_56_12:SetAlpha(0)

		var_56_11._binkStarted = true
	end

	local function var_56_19()
		Engine.EBCGADABJ()

		if var_56_7 then
			var_56_12:SetAlpha(1)
			var_56_17:SetAlpha(0)

			var_56_12:Wait(150).onComplete = function()
				var_56_12:SetAlpha(0, var_56_9).onComplete = var_56_16
			end
		else
			var_56_16()
		end
	end

	function var_56_16()
		LUI.FlowManager.RequestLeaveMenu(var_56_11, true)

		if var_56_10 ~= nil then
			var_56_10()
		end
	end

	function var_56_11.exitMenu(arg_64_0)
		if arg_64_0._exiting then
			return
		end

		arg_64_0._exiting = true

		if var_56_6 then
			var_56_12:SetAlpha(0)

			var_56_12:SetAlpha(1, var_56_9).onComplete = var_56_19
		else
			var_56_19()
		end
	end

	if var_56_4 then
		var_56_12:SetAlpha(1, var_56_9).onComplete = var_56_18
	else
		var_56_18()
	end

	if arg_56_1.allowSkip then
		local var_56_20 = MenuBuilder.BuildRegisteredType("BinkSkipPrompt", {
			onSkipInput = function()
				var_56_11:exitMenu()
			end
		})

		var_56_20:setPriority(var_56_2)
		var_56_11:addElement(var_56_20)
	end

	local var_56_21 = LUI.UIElement.new()

	var_56_21:setPriority(var_56_3)
	var_56_21:SetupCinematicSubtitles()

	var_56_21.id = "subtitles"

	var_56_11:addElement(var_56_21)

	return var_56_11
end

function MPFullScreenVideoOverlayPop()
	Engine.EBCGADABJ()
	Engine.BBEEIGHJBA("music_mainmenu_mp")
end

function ClassicWeaponAlreadyUnlockedPopup(arg_67_0, arg_67_1)
	local var_67_0 = {
		popup_title = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_UNLOCK_TITLE"),
		message_text = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_ALREADY_UNLOCKED", arg_67_1.itemName)
	}
	local var_67_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_67_0)

	var_67_1.id = "ClassicWeaponAlreadyUnlockedPopup"

	return var_67_1
end

function ClassicWeaponNotEnoughTokensPopup(arg_68_0, arg_68_1)
	local var_68_0 = {
		popup_title = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_UNLOCK_TITLE"),
		message_text = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_UNLOCK_FAILURE")
	}
	local var_68_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_68_0)

	var_68_1.id = "ClassicWeaponNotEnoughTokensPopup"

	return var_68_1
end

function ClassicWeaponsYesNoPopup(arg_69_0, arg_69_1)
	local var_69_0 = {
		popup_title = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_UNLOCK_TITLE"),
		message_text = Engine.CBBHFCGDIC("PRESTIGE/CLASSIC_WEAPON_UNLOCKS_CONFIRM", arg_69_1.itemName),
		yes_text = Engine.CBBHFCGDIC("LUA_MENU/YES"),
		yes_action = arg_69_1.confirmAction,
		no_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")
	}
	local var_69_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_69_0)

	var_69_1.id = "ClassicWeaponsYesNoPopup"

	return var_69_1
end

local function var_0_2(arg_70_0, arg_70_1)
	local var_70_0 = {
		message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/DRAFT_FAILED")
	}
	local var_70_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_70_0)

	var_70_1.id = "DraftFailed"

	return var_70_1
end

local function var_0_3(arg_71_0, arg_71_1)
	assert(arg_71_1)
	assert(arg_71_1.refreshFunction)

	local var_71_0 = {
		message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/DRAFTING"),
		controllerIndex = arg_71_1.controllerIndex
	}
	local var_71_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_71_0)
	local var_71_2 = LUI.UITimer.new({
		interval = 500,
		event = {
			name = "refresh_fence_dialog"
		}
	})

	var_71_1:addElement(var_71_2)
	var_71_1:addEventHandler("refresh_fence_dialog", function(arg_72_0, arg_72_1)
		arg_71_1.refreshFunction()
	end)

	return var_71_1
end

local function var_0_4(arg_73_0, arg_73_1)
	assert(arg_73_1)
	assert(arg_73_1.controllerIndex)
	assert(arg_73_1.draftPhaseText)
	assert(arg_73_1.baseCountdownTime)

	local var_73_0 = Engine.CBBHFCGDIC(arg_73_1.draftPhaseText, LoadoutDrafting.CGCGHIJDFF() - arg_73_1.baseCountdownTime)
	local var_73_1 = {
		message = var_73_0,
		controllerIndex = arg_73_1.controllerIndex
	}
	local var_73_2 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_73_1)
	local var_73_3 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "refresh_fence_dialog"
		}
	})

	var_73_2:addElement(var_73_3)
	var_73_2:addEventHandler("refresh_fence_dialog", function(arg_74_0, arg_74_1)
		local var_74_0 = Engine.CBBHFCGDIC(arg_73_1.draftPhaseText, LoadoutDrafting.CGCGHIJDFF() - arg_73_1.baseCountdownTime)

		var_73_2:SetText(var_74_0)

		if IsMlgGameBattlesMatch() then
			LUI.FlowManager.RequestLeaveMenuByName("PreDraftCountdownPopup")
		end
	end)

	return var_73_2
end

local function var_0_5(arg_75_0, arg_75_1)
	local var_75_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_VOICE"),
		width = _1080p * 700
	}

	var_75_0.defaultFocusIndex = 0
	var_75_0.cancelClosesPopup = false

	local var_75_1 = {
		controllerIndex = arg_75_1.controllerIndex
	}
	local var_75_2 = MenuBuilder.BuildRegisteredType("AnnouncerVoiceSelectWidget", var_75_1)

	var_75_2.id = "AnnouncerVoiceSelectWidget"
	var_75_0.listContent = {}

	table.insert(var_75_0.listContent, var_75_2)

	local var_75_3 = MenuBuilder.BuildRegisteredType("PopupList", var_75_0)

	var_75_3.id = "AnnouncerVoiceSelectPopup"

	return var_75_3
end

local function var_0_6(arg_76_0, arg_76_1)
	local var_76_0 = {
		popup_title = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_VOICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_PURCHASE_CONFIRM", arg_76_1.name),
		yes_text = Engine.CBBHFCGDIC("LUA_MENU/YES"),
		yes_action = arg_76_1.confirmAction,
		no_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")
	}
	local var_76_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_76_0)

	var_76_1.id = "AnnouncerStoreYesNoPopup"

	return var_76_1
end

local function var_0_7(arg_77_0, arg_77_1)
	local var_77_0 = {
		popup_title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_DLC_CP", arg_77_1.cost),
		yes_text = Engine.CBBHFCGDIC("LUA_MENU/YES"),
		no_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		yes_action = function()
			Loot.HAJHHFGJJ(arg_77_1.controllerIndex, arg_77_1.itemID, true)
			LUI.FlowManager.RequestPopupMenu(element, "live_dialog_text_box", true, arg_77_1.controllerIndex, true, {
				message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASING_DLC")
			})
		end
	}
	local var_77_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_77_0)

	var_77_1.id = "DLCStoreYesNoPopup"

	return var_77_1
end

function CrossPlayDisabledPrivatePartyBackoutMessage(arg_79_0, arg_79_1)
	local var_79_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("ONLINE/EXIT_PARTY_CROSSPLAY_DISABLED", arg_79_1.currentCount, arg_79_1.maxCount)
	}
	local var_79_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_79_0)

	var_79_1.id = "CrossPlayDisabledPrivatePartyBackoutMessage"

	return var_79_1
end

function CodcasterTeamNameArabicPopup()
	local var_80_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("MENU/CODCASTER_ARABIC_NAME")
	}
	local var_80_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_80_0)

	var_80_1.id = "CodcasterTeamNameArabicPopup"

	return var_80_1
end

function RemoveSelfSplitscreenPlayerPopup(arg_81_0, arg_81_1)
	local var_81_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU/EXIT_TO_MAIN_MENU"),
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		action = function()
			LUI.FlowManager.RequestRestoreMenu("MainMenu", nil, nil)
		end
	}
	local var_81_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_81_0)

	var_81_1.id = "remove_self_splitscreen_popup"

	return var_81_1
end

MenuBuilder.registerType("PreDraftCountdownPopup", var_0_4)
MenuBuilder.registerType("RequestDraftPopup", var_0_3)
MenuBuilder.registerType("DraftFailed", var_0_2)
MenuBuilder.registerType("newPatchManifestRestart", newPatchManifestRestart)
MenuBuilder.registerType("TURequiredWarning", TURequiredWarning)
MenuBuilder.registerType("error_popmenu_lobby", error_popmenu_lobby)
MenuBuilder.registerType("leave_public_mp_lobby", leave_public_mp_lobby)
MenuBuilder.registerType("leave_private_mp_lobby", leave_private_mp_lobby)
MenuBuilder.registerType("youarehost", youarehost)
MenuBuilder.registerType("makehostfailed", makehostfailed)
MenuBuilder.registerType("acceptinvite_warning_for_leaving_party", acceptinvite_warning_for_leaving_party)
MenuBuilder.registerType("acceptinvite_warning_invitable_privilege_missing", acceptinvite_warning_invitable_privilege_missing)
MenuBuilder.registerType("mlg_error_no_rules_available_offline", mlg_error_no_rules_available_offline)
MenuBuilder.registerType("mlg_error_no_rules_available", mlg_error_no_rules_available)
MenuBuilder.registerType("mp_no_guest_popup", mp_no_guest_popup)
MenuBuilder.registerType("strict_nat_warning", strict_nat_warning)
MenuBuilder.registerType("dc_qos_failed_warning", dc_qos_failed_warning)
MenuBuilder.registerType("mm_invalid_player_info_popup", mm_invalid_player_info_popup)
MenuBuilder.registerType("mp_panic_buttons_popup", mp_panic_buttons_popup)
MenuBuilder.registerType("jip_with_password", jip_with_password)
MenuBuilder.registerType("popup_handle_lootcrate", popup_handle_lootcrate)
MenuBuilder.registerType("ItemExchangeFailedPopup", ItemExchangeFailedPopup)
MenuBuilder.registerType("ItemExchangeFencePopup", ItemExchangeFencePopup)
MenuBuilder.registerType("ChooseLocalPlay", ChooseLocalPlay)
MenuBuilder.registerType("ConfirmShouldBreakupPrivatePartyAndSplitscreenWarning", ConfirmShouldBreakupPrivatePartyAndSplitscreenWarning)
MenuBuilder.registerType("ConfirmShouldBreakupPrivateParty", ConfirmShouldBreakupPrivateParty)
MenuBuilder.registerType("ConfirmShouldRemoveSplitscreenPlayerWarning", ConfirmShouldRemoveSplitscreenPlayerWarning)
MenuBuilder.registerType("OpeningMenuWithSplitscreenWarning", OpeningMenuWithSplitscreenWarning)
MenuBuilder.registerType("OpeningMenuWithSplitscreenPartyMemberWarning", OpeningMenuWithSplitscreenPartyMemberWarning)
MenuBuilder.registerType("OpeningMenuWithHighPrivatePartyMemberCountWarning", OpeningMenuWithHighPrivatePartyMemberCountWarning)
MenuBuilder.registerType("EnteringGameModeWithHighPrivatePartyMemberCountWarning", EnteringGameModeWithHighPrivatePartyMemberCountWarning)
MenuBuilder.registerType("code_redemption_success", code_redemption_success)
MenuBuilder.registerType("code_already_redeemed_popup", code_already_redeemed_popup)
MenuBuilder.registerType("code_expired_popup", code_expired_popup)
MenuBuilder.registerType("code_redemption_failed_popup", code_redemption_failed_popup)
MenuBuilder.registerType("RedeemingPopup", RedeemingPopup)
MenuBuilder.registerType("LootItemError", LootItemError)
MenuBuilder.registerType("ExchangeFailed", ExchangeFailed)
MenuBuilder.registerType("MPFullScreenVideoOverlay", MPFullScreenVideoOverlay)
LUI.FlowManager.RegisterStackPopBehaviour("MPFullScreenVideoOverlay", MPFullScreenVideoOverlayPop)
MenuBuilder.registerType("ClassicWeaponAlreadyUnlockedPopup", ClassicWeaponAlreadyUnlockedPopup)
MenuBuilder.registerType("ClassicWeaponNotEnoughTokensPopup", ClassicWeaponNotEnoughTokensPopup)
MenuBuilder.registerType("ClassicWeaponsYesNoPopup", ClassicWeaponsYesNoPopup)
MenuBuilder.registerType("AnnouncerVoiceSelectPopup", var_0_5)
MenuBuilder.registerType("AnnouncerStoreYesNoPopup", var_0_6)
MenuBuilder.registerType("DLCStoreYesNoPopup", var_0_7)
MenuBuilder.registerType("CrossPlayDisabledPrivatePartyBackoutMessage", CrossPlayDisabledPrivatePartyBackoutMessage)
MenuBuilder.registerType("CodcasterTeamNameArabicPopup", CodcasterTeamNameArabicPopup)
MenuBuilder.registerType("RemoveSelfSplitscreenPlayerPopup", RemoveSelfSplitscreenPlayerPopup)
LockTable(_M)
