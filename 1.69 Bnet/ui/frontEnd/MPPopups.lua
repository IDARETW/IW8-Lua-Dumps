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
	local var_19_0 = {}

	if Engine.EAABDHIDFJ() then
		var_19_0.message_text = Engine.CBBHFCGDIC("MSSTORE_PLATFORM/INVITE_PRIVILEGE_MISSING_WARNING")
	else
		var_19_0.message_text = Engine.CBBHFCGDIC("ONLINE/INVITE_PRIVILEGE_MISSING_WARNING")
	end

	var_19_0.popup_title = Engine.CBBHFCGDIC("MENU/ACCEPTINVITETITLE")
	var_19_0.yes_text = Engine.CBBHFCGDIC("MENU/TRY_AGAIN")
	var_19_0.no_text = Engine.CBBHFCGDIC("MENU/RESUMEGAME")
	var_19_0.yes_action = AcceptInviteWarningConfirm
	var_19_0.no_action = AcceptInviteWarningCancel

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

function TextureDownloadCacheVersionChange()
	local var_38_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/TEXTURE_DOWNLOADCACHE_VERSION_BUMP"),
		confirmation_action = function()
			Engine.BHIJFFCAEB("")
		end
	}
	local var_38_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_38_0)

	var_38_1.id = "TextureDownloadCacheVersionChange"

	return var_38_1
end

function TextureDownloadCacheAllocError()
	local var_40_0 = StreamHTTP.DECHFDIAFC()
	local var_40_1 = "PLATFORM/TEXTURE_CACHE_ALLOC_ERROR"

	if Engine.CIEGIACHAE() then
		var_40_1 = Engine.CBBHFCGDIC(var_40_1, var_40_0)
	else
		var_40_1 = Engine.CBBHFCGDIC(var_40_1)
	end

	local var_40_2 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = var_40_1,
		confirmation_action = function()
			return
		end
	}
	local var_40_3 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_40_2)

	var_40_3.id = "TextureDownloadCacheAllocError"

	return var_40_3
end

function ChooseLocalPlay(arg_42_0, arg_42_1)
	assert(arg_42_1.dvarResetFunction)

	local var_42_0 = {
		title = Engine.CBBHFCGDIC("@MENU/CHOOSE_GAME_MODE_CAP")
	}

	var_42_0.message = ""
	var_42_0.defaultFocusIndex = 0
	var_42_0.buttons = {
		{
			label = ToUpperCase(Engine.CBBHFCGDIC("@MENU/MULTIPLAYER")),
			action = function(arg_43_0, arg_43_1)
				arg_42_1.dvarResetFunction()
				Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

				local var_43_0 = LUI.FlowManager.FlowMenus[PartyUIRoot.MP_SYSTEM_LINK]

				Engine.CDGCBCBAJ("Opening " .. var_43_0, arg_43_1)
				LUI.FlowManager.RequestAddMenu(var_43_0, true, arg_43_1, false)
			end
		},
		{
			label = Engine.CBBHFCGDIC("@LUA_MENU/COOP_CAPS"),
			action = function(arg_44_0, arg_44_1)
				arg_42_1.dvarResetFunction()
				Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

				local var_44_0 = LUI.FlowManager.FlowMenus[PartyUIRoot.CP_SYSTEM_LINK]

				Engine.CDGCBCBAJ("Opening " .. var_44_0, arg_44_1)
				LUI.FlowManager.RequestAddMenu(var_44_0, true, arg_44_1, false)
			end
		}
	}

	local var_42_1 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_42_0)

	var_42_1.id = "ChooseLocalPlay"

	return var_42_1
end

function ConfirmShouldBreakupPrivatePartyAndSplitscreenWarning(arg_45_0, arg_45_1)
	assert(arg_45_1.yesAction)

	local var_45_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/CONFIRM_BREAK_PARTY_WITH_SPLITSCREEN_WARNING"),
		yesAction = arg_45_1.yesAction
	}
	local var_45_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_45_0)

	var_45_1.id = "ConfirmShouldBreakupPrivatePartyAndSplitscreenWarning"

	return var_45_1
end

function ConfirmShouldBreakupPrivateParty(arg_46_0, arg_46_1)
	assert(arg_46_1.yesAction)

	local var_46_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/CONFIRM_BREAK_PARTY"),
		yesAction = arg_46_1.yesAction
	}
	local var_46_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_46_0)

	var_46_1.id = "ConfirmShouldBreakupPrivateParty"

	return var_46_1
end

function ConfirmShouldRemoveSplitscreenPlayerWarning(arg_47_0, arg_47_1)
	local var_47_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/CONFIRM_REMOVE_SPLITSCREEN_PLAYER_WARNING"),
		yesAction = arg_47_1.yesAction
	}
	local var_47_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_47_0)

	var_47_1.id = "ConfirmShouldRemoveSplitscreenPlayerWarning"

	return var_47_1
end

function OpeningMenuWithSplitscreenWarning(arg_48_0, arg_48_1)
	local var_48_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_NOTALLOWED_WARNING"),
		yesAction = arg_48_1.yesAction
	}
	local var_48_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_48_0)

	var_48_1.id = "OpeningMenuWithSplitscreenWarning"

	return var_48_1
end

function OpeningMenuWithSplitscreenPartyMemberWarning(arg_49_0, arg_49_1)
	local var_49_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_PARTY_NOTALLOWED_WARNING")
	}
	local var_49_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_49_0)

	var_49_1.id = "OpeningMenuWithSplitscreenPartyMemberWarning"

	return var_49_1
end

function OpeningMenuWithHighPrivatePartyMemberCountWarning(arg_50_0, arg_50_1)
	local var_50_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/HIGH_PARTY_MEMBER_COUNT_WARNING", arg_50_1.currentCount, arg_50_1.maxCount)
	}
	local var_50_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_50_0)

	var_50_1.id = "OpeningMenuWithHighPrivatePartyMemberCountWarning"

	return var_50_1
end

function EnteringGameModeWithHighPrivatePartyMemberCountWarning(arg_51_0, arg_51_1)
	local var_51_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU_MP/GAME_MODE_HIGH_PARTY_MEMBER_COUNT_WARNING", arg_51_1.currentCount, arg_51_1.maxCount)
	}
	local var_51_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_51_0)

	var_51_1.id = "EnteringGameModeWithHighPrivatePartyMemberCountWarning"

	return var_51_1
end

function code_redemption_success()
	local var_52_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/REDEEMED"),
		message_text = Engine.CBBHFCGDIC("MENU/BUNDLE_ADDED_TO_INVENTORY"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_52_0))
end

function code_already_redeemed_popup()
	local var_53_0 = {
		popup_title = Engine.CBBHFCGDIC("@GAME/WARNING"),
		message_text = Engine.CBBHFCGDIC("MENU/REDEMPTION_ALREADY_REDEEMED"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_53_0))
end

function code_expired_popup()
	local var_54_0 = {
		popup_title = Engine.CBBHFCGDIC("@GAME/WARNING"),
		message_text = Engine.CBBHFCGDIC("MENU/REDEMPTION_CODE_EXPIRED"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_54_0))
end

function code_redemption_failed_popup()
	local var_55_0 = {
		popup_title = Engine.CBBHFCGDIC("@GAME/WARNING"),
		message_text = Engine.CBBHFCGDIC("MENU/REDEMPTION_REDEMPTION_FAILED"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_55_0))
end

function RedeemingPopup(arg_56_0, arg_56_1)
	local var_56_0 = {
		message = Engine.CBBHFCGDIC("MENU/REDEMPTION_REDEEMING_PLEASE_WAIT")
	}
	local var_56_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_56_0)

	var_56_1.id = "RedeemingPopup"

	var_56_1:registerEventHandler("redemption_success", function(arg_57_0, arg_57_1)
		LUI.FlowManager.RequestLeaveMenu(arg_57_0)
	end)
	var_56_1:registerEventHandler("redemption_failed", function(arg_58_0, arg_58_1)
		LUI.FlowManager.RequestLeaveMenu(arg_58_0)
		DebugPrint("Code redeeming failed")

		if arg_58_1.errorAlreadyRedeemed then
			LUI.FlowManager.RequestPopupMenu(nil, "code_already_redeemed_popup")
		elseif arg_58_1.errorCodeExpired then
			LUI.FlowManager.RequestPopupMenu(nil, "code_expired_popup")
		else
			LUI.FlowManager.RequestPopupMenu(nil, "code_redemption_failed_popup")
		end
	end)

	return var_56_1
end

function ExchangeFailed()
	local var_59_0 = {
		popup_title = Engine.CBBHFCGDIC("@GAME/WARNING"),
		message_text = CONDITIONS.AreCODPointsEnabled() and Engine.CBBHFCGDIC("@EXE/EXCHANGE_ERROR") or Engine.CBBHFCGDIC("EXE/EXCHANGE_ERROR_NO_COD_POINTS"),
		confirmation_action = MBh.LeaveMenu()
	}

	return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_59_0))
end

function MPFullScreenVideoOverlay(arg_60_0, arg_60_1)
	arg_60_1 = arg_60_1 or {}

	assert(arg_60_1.videoRef)

	local var_60_0 = 1
	local var_60_1 = 2
	local var_60_2 = 3
	local var_60_3 = 4
	local var_60_4 = arg_60_1.doIntroFadeOut ~= false
	local var_60_5 = arg_60_1.doIntroFadeIn ~= false
	local var_60_6 = arg_60_1.doOutroFadeOut ~= false
	local var_60_7 = arg_60_1.doOutroFadeIn ~= false
	local var_60_8 = arg_60_1.fadeColor or COLORS.black
	local var_60_9 = 600
	local var_60_10 = arg_60_1.onCompletePlayback or nil
	local var_60_11 = LUI.UIElement.new()

	var_60_11.id = "MPFullScreenVideoOverlay"

	local var_60_12 = LUI.UIImage.new()

	var_60_12:setPriority(var_60_1)

	var_60_12.id = "fade"

	var_60_12:SetRGBFromTable(var_60_8)
	var_60_12:SetAlpha(0)
	var_60_11:addElement(var_60_12)

	local var_60_13
	local var_60_14
	local var_60_15
	local var_60_16
	local var_60_17

	local function var_60_18()
		var_60_17 = LUI.Cinematic.new()
		var_60_17.id = "bink"

		var_60_11:addElement(var_60_17)
		Engine.BEFHEEBHIA()
		Engine.DFCGFCGBFD(arg_60_1.videoRef)

		if var_60_5 then
			var_60_12:SetAlpha(1)

			var_60_12:Wait(150).onComplete = function()
				var_60_12:SetAlpha(0, var_60_9).onComplete = var_60_14
			end
		else
			var_60_14()
		end

		local var_61_0 = LUI.UITimer.new({
			interval = 100,
			event = {
				name = "check_exit_video"
			}
		})

		var_61_0.id = "checkExitTimer"

		var_60_11:addElement(var_61_0)
		var_61_0:registerEventHandler("check_exit_video", function()
			if Engine.BCJJBCDGAC() then
				var_60_11:exitMenu()
			end
		end)
	end

	function var_60_14()
		var_60_12:SetAlpha(0)

		var_60_11._binkStarted = true
	end

	local function var_60_19()
		Engine.EBCGADABJ()

		if var_60_7 then
			var_60_12:SetAlpha(1)
			var_60_17:SetAlpha(0)

			var_60_12:Wait(150).onComplete = function()
				var_60_12:SetAlpha(0, var_60_9).onComplete = var_60_16
			end
		else
			var_60_16()
		end
	end

	function var_60_16()
		LUI.FlowManager.RequestLeaveMenu(var_60_11, true)

		if var_60_10 ~= nil then
			var_60_10()
		end
	end

	function var_60_11.exitMenu(arg_68_0)
		if arg_68_0._exiting then
			return
		end

		arg_68_0._exiting = true

		if var_60_6 then
			var_60_12:SetAlpha(0)

			var_60_12:SetAlpha(1, var_60_9).onComplete = var_60_19
		else
			var_60_19()
		end
	end

	if var_60_4 then
		var_60_12:SetAlpha(1, var_60_9).onComplete = var_60_18
	else
		var_60_18()
	end

	if arg_60_1.allowSkip then
		local var_60_20 = MenuBuilder.BuildRegisteredType("BinkSkipPrompt", {
			onSkipInput = function()
				var_60_11:exitMenu()
			end
		})

		var_60_20:setPriority(var_60_2)
		var_60_11:addElement(var_60_20)
	end

	local var_60_21 = LUI.UIElement.new()

	var_60_21:setPriority(var_60_3)
	var_60_21:SetupCinematicSubtitles()

	var_60_21.id = "subtitles"

	var_60_11:addElement(var_60_21)

	return var_60_11
end

function MPFullScreenVideoOverlayPop()
	Engine.EBCGADABJ()
	Engine.BBEEIGHJBA(CoD.Music.MainMPMusic)
end

function ClassicWeaponAlreadyUnlockedPopup(arg_71_0, arg_71_1)
	local var_71_0 = {
		popup_title = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_UNLOCK_TITLE"),
		message_text = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_ALREADY_UNLOCKED", arg_71_1.itemName)
	}
	local var_71_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_71_0)

	var_71_1.id = "ClassicWeaponAlreadyUnlockedPopup"

	return var_71_1
end

function ClassicWeaponNotEnoughTokensPopup(arg_72_0, arg_72_1)
	local var_72_0 = {
		popup_title = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_UNLOCK_TITLE"),
		message_text = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_UNLOCK_FAILURE")
	}
	local var_72_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_72_0)

	var_72_1.id = "ClassicWeaponNotEnoughTokensPopup"

	return var_72_1
end

function ClassicWeaponsYesNoPopup(arg_73_0, arg_73_1)
	local var_73_0 = {
		popup_title = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CLASSIC_WEAPON_UNLOCK_TITLE"),
		message_text = Engine.CBBHFCGDIC("PRESTIGE/CLASSIC_WEAPON_UNLOCKS_CONFIRM", arg_73_1.itemName),
		yes_text = Engine.CBBHFCGDIC("LUA_MENU/YES"),
		yes_action = arg_73_1.confirmAction,
		no_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")
	}
	local var_73_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_73_0)

	var_73_1.id = "ClassicWeaponsYesNoPopup"

	return var_73_1
end

local function var_0_2(arg_74_0, arg_74_1)
	local var_74_0 = {
		message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/DRAFT_FAILED")
	}
	local var_74_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_74_0)

	var_74_1.id = "DraftFailed"

	return var_74_1
end

local function var_0_3(arg_75_0, arg_75_1)
	assert(arg_75_1)
	assert(arg_75_1.refreshFunction)

	local var_75_0 = {
		message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/DRAFTING"),
		controllerIndex = arg_75_1.controllerIndex
	}
	local var_75_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_75_0)
	local var_75_2 = LUI.UITimer.new({
		interval = 500,
		event = {
			name = "refresh_fence_dialog"
		}
	})

	var_75_1:addElement(var_75_2)
	var_75_1:addEventHandler("refresh_fence_dialog", function(arg_76_0, arg_76_1)
		arg_75_1.refreshFunction()
	end)

	return var_75_1
end

local function var_0_4(arg_77_0, arg_77_1)
	assert(arg_77_1)
	assert(arg_77_1.controllerIndex)
	assert(arg_77_1.draftPhaseText)
	assert(arg_77_1.baseCountdownTime)

	local var_77_0 = Engine.CBBHFCGDIC(arg_77_1.draftPhaseText, LoadoutDrafting.CGCGHIJDFF() - arg_77_1.baseCountdownTime)
	local var_77_1 = {
		message = var_77_0,
		controllerIndex = arg_77_1.controllerIndex
	}
	local var_77_2 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_77_1)
	local var_77_3 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "refresh_fence_dialog"
		}
	})

	var_77_2:addElement(var_77_3)
	var_77_2:addEventHandler("refresh_fence_dialog", function(arg_78_0, arg_78_1)
		local var_78_0 = Engine.CBBHFCGDIC(arg_77_1.draftPhaseText, LoadoutDrafting.CGCGHIJDFF() - arg_77_1.baseCountdownTime)

		var_77_2:SetText(var_78_0)

		if IsMlgGameBattlesMatch() then
			LUI.FlowManager.RequestLeaveMenuByName("PreDraftCountdownPopup")
		end
	end)

	return var_77_2
end

local function var_0_5(arg_79_0, arg_79_1)
	local var_79_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_VOICE"),
		width = _1080p * 700
	}

	var_79_0.defaultFocusIndex = 0
	var_79_0.cancelClosesPopup = false

	local var_79_1 = {
		controllerIndex = arg_79_1.controllerIndex
	}
	local var_79_2 = MenuBuilder.BuildRegisteredType("AnnouncerVoiceSelectWidget", var_79_1)

	var_79_2.id = "AnnouncerVoiceSelectWidget"
	var_79_0.listContent = {}

	table.insert(var_79_0.listContent, var_79_2)

	local var_79_3 = MenuBuilder.BuildRegisteredType("PopupList", var_79_0)

	var_79_3.id = "AnnouncerVoiceSelectPopup"

	return var_79_3
end

local function var_0_6(arg_80_0, arg_80_1)
	local var_80_0 = {
		popup_title = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_VOICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_PURCHASE_CONFIRM", arg_80_1.name),
		yes_text = Engine.CBBHFCGDIC("LUA_MENU/YES"),
		yes_action = arg_80_1.confirmAction,
		no_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")
	}
	local var_80_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_80_0)

	var_80_1.id = "AnnouncerStoreYesNoPopup"

	return var_80_1
end

local function var_0_7(arg_81_0, arg_81_1)
	local var_81_0 = {
		popup_title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_DLC_CP", arg_81_1.cost),
		yes_text = Engine.CBBHFCGDIC("LUA_MENU/YES"),
		no_text = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		yes_action = function()
			Loot.HAJHHFGJJ(arg_81_1.controllerIndex, arg_81_1.itemID)
			LUI.FlowManager.RequestPopupMenu(element, "live_dialog_text_box", true, arg_81_1.controllerIndex, true, {
				message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASING_DLC")
			})
		end
	}
	local var_81_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_81_0)

	var_81_1.id = "DLCStoreYesNoPopup"

	return var_81_1
end

function CrossPlayDisabledPrivatePartyBackoutMessage(arg_83_0, arg_83_1)
	local var_83_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("ONLINE/EXIT_PARTY_CROSSPLAY_DISABLED", arg_83_1.currentCount, arg_83_1.maxCount)
	}
	local var_83_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_83_0)

	var_83_1.id = "CrossPlayDisabledPrivatePartyBackoutMessage"

	return var_83_1
end

function CodcasterTeamNameArabicPopup()
	local var_84_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("MENU/CODCASTER_ARABIC_NAME")
	}
	local var_84_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_84_0)

	var_84_1.id = "CodcasterTeamNameArabicPopup"

	return var_84_1
end

function RemoveSelfSplitscreenPlayerPopup(arg_85_0, arg_85_1)
	local var_85_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU/EXIT_TO_MAIN_MENU"),
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		action = function()
			LUI.FlowManager.RequestRestoreMenu("MainMenu", nil, nil)
		end
	}
	local var_85_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_85_0)

	var_85_1.id = "remove_self_splitscreen_popup"

	return var_85_1
end

function JoinRandomSquadPopup(arg_87_0, arg_87_1)
	local var_87_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_RANDOM_SQUAD"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_RANDOM_SQUAD_DESC"),
		buttons = {}
	}
	local var_87_1 = MenuBuilder.BuildRegisteredType("PopupReadOnly", var_87_0)

	var_87_1.id = "join_random_squad_popup"

	if arg_87_1 and arg_87_1.autoCloseTime then
		var_87_1:Wait(arg_87_1.autoCloseTime).onComplete = function()
			LUI.FlowManager.RequestLeaveMenuByName("JoinRandomSquadPopup", true, true)
		end
	end

	return var_87_1
end

function JoinSquadPopup(arg_89_0, arg_89_1)
	local var_89_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_SQUAD"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_SQUAD_DESC"),
		buttons = {}
	}
	local var_89_1 = MenuBuilder.BuildRegisteredType("PopupReadOnly", var_89_0)

	var_89_1.id = "join_squad_popup"

	if arg_89_1 and arg_89_1.autoCloseTime then
		var_89_1:Wait(arg_89_1.autoCloseTime).onComplete = function()
			LUI.FlowManager.RequestLeaveMenuByName("JoinSquadPopup", true, true)
		end
	end

	return var_89_1
end

function LeaveSquadPopup(arg_91_0, arg_91_1)
	local var_91_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/LEAVE_SQUAD"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/LEAVE_SQUAD_DESC"),
		buttons = {}
	}
	local var_91_1 = MenuBuilder.BuildRegisteredType("PopupReadOnly", var_91_0)

	var_91_1.id = "leave_squad_popup"

	if arg_91_1 and arg_91_1.autoCloseTime then
		var_91_1:Wait(arg_91_1.autoCloseTime).onComplete = function()
			LUI.FlowManager.RequestLeaveMenuByName("LeaveSquadPopup", true, true)
		end
	end

	return var_91_1
end

function LeaveSquadMenuPopup(arg_93_0, arg_93_1)
	local var_93_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/EXIT_SQUAD_MENU"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/EXIT_SQUAD_MENU_DESC"),
		buttons = {}
	}
	local var_93_1 = MenuBuilder.BuildRegisteredType("PopupReadOnly", var_93_0)

	var_93_1.id = "leave_squad_menu_popup"

	if arg_93_1 and arg_93_1.autoCloseTime then
		var_93_1:Wait(arg_93_1.autoCloseTime).onComplete = function()
			LUI.FlowManager.RequestLeaveMenuByName("LeaveSquadMenuPopup", true, true)
		end
	end

	return var_93_1
end

function LeaveSquadFailurePopup(arg_95_0, arg_95_1)
	local var_95_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/LEAVE_SQUAD_FAILURE"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/LEAVE_SQUAD_FAILURE_DESC"),
		buttons = {}
	}
	local var_95_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_95_0)

	var_95_1.id = "leave_squad_failure_popup"

	return var_95_1
end

function JoinRandomSquadFailurePopup(arg_96_0, arg_96_1)
	local var_96_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_RANDOM_SQUAD_FAILURE"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_RANDOM_SQUAD_FAILURE_DESC")
	}
	local var_96_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_96_0)

	var_96_1.id = "join_random_squad_failure_popup"

	return var_96_1
end

function party_crosslaunching_cannot_follow(arg_97_0, arg_97_1)
	DebugPrint("---CROSSLAUNCH--- Non-host and CrossLaunch was initiated by host. Crosslaunch follow disabled by dvar - crosslaunch_allow_follow_host")

	arg_97_1.title = Engine.CBBHFCGDIC("@MENU/NOTICE")

	local var_97_0, var_97_1 = CrossLaunchUtils.GetPartyCrosslaunchDestination(self, controllerIndex)

	arg_97_1.message = CrossLaunchUtils.GetPartyMessageForHostCrosslaunchNoFollow(var_97_0, var_97_1)

	local var_97_2 = MenuBuilder.BuildRegisteredType("PopupOK", arg_97_1)

	var_97_2.id = "party_crosslaunching_cannot_follow"

	return var_97_2
end

function party_crosslaunch_confirmation(arg_98_0, arg_98_1)
	DebugPrint("---CROSSLAUNCH--- Non-host and about to show popup to follow host or leave party")

	arg_98_1.title = Engine.CBBHFCGDIC("@MENU/NOTICE")

	local var_98_0, var_98_1 = CrossLaunchUtils.GetPartyCrosslaunchDestination(self, controllerIndex)

	arg_98_1.gameId = var_98_0
	arg_98_1.gameMode = var_98_1
	arg_98_1.confirmScreen = true
	arg_98_1.message = CrossLaunchUtils.GetCountdownPopupMessage(var_98_0, true)
	arg_98_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("MPUI/FOLLOW_HOST"),
			action = party_crosslaunching_deeplink
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_PARTY"),
			action = CrossLaunchUtils.PartyCrosslaunchCancel
		}
	}
	arg_98_1.onCancel = CrossLaunchUtils.PartyCrosslaunchCancel
	arg_98_1.shouldAlwaysBeCancellable = false
	arg_98_1.timerData = {
		frequency = 500,
		getTimeRemainingCallback = CrossLaunchUtils.PartyCrossLaunchTimeRemaining,
		noDecisionMadeInTimeCallback = CrossLaunchUtils.PartyCrosslaunchCancel
	}

	local var_98_2 = MenuBuilder.BuildRegisteredType("CrosslaunchingCoutdownPopup", arg_98_1)

	var_98_2.id = "party_crosslaunch_confirmation"

	return var_98_2
end

function party_host_crosslaunching_deeplink(arg_99_0, arg_99_1)
	DebugPrint("---CROSSLAUNCH--- Host about to show popup with countdown till crosslaunch")

	if not CONDITIONS.IsCrosslaunchFollowHostAllowed() and Engine.CGEFDFCIJA() > 1 then
		arg_99_1.title = Engine.CBBHFCGDIC("@LUA_MENU_EAGLE/LEAVING_PARTY_NOTICE")
	else
		arg_99_1.title = Engine.CBBHFCGDIC("@MENU/NOTICE")
	end

	local var_99_0, var_99_1 = CrossLaunchUtils.GetPartyCrosslaunchDestination(self, controllerIndex)

	arg_99_1.gameId = var_99_0
	arg_99_1.gameMode = var_99_1
	arg_99_1.message = CrossLaunchUtils.GetCountdownPopupMessage(var_99_0, false)
	arg_99_1.onCancel = CrossLaunchUtils.PartyCrosslaunchCancel
	arg_99_1.shouldAlwaysBeCancellable = false

	if Engine.CGEFDFCIJA() == 1 or not CONDITIONS.IsCrosslaunchFollowHostAllowed() then
		arg_99_1.shouldAlwaysBeCancellable = true
	end

	arg_99_1.timerData = {
		frequency = 500,
		getTimeRemainingCallback = CrossLaunchUtils.PartyCrossLaunchTimeRemaining,
		onCountdownCompleteCallback = CrossLaunchUtils.HostCrossLaunchExecute
	}

	local var_99_2 = MenuBuilder.BuildRegisteredType("CrosslaunchingCoutdownPopup", arg_99_1)

	var_99_2.id = "party_host_crosslaunching_deeplink"

	return var_99_2
end

function party_crosslaunching_deeplink(arg_100_0, arg_100_1)
	DebugPrint("---CROSSLAUNCH--- Non-host and about to show popup with countdown till crosslaunch after confirmation")
	CrossLaunchUtils.PartyCrosslaunchConfirm()

	arg_100_1.title = Engine.CBBHFCGDIC("@MENU/NOTICE")

	local var_100_0, var_100_1 = CrossLaunchUtils.GetPartyCrosslaunchDestination(self, controllerIndex)

	arg_100_1.gameId = var_100_0
	arg_100_1.gameMode = var_100_1
	arg_100_1.message = CrossLaunchUtils.GetCountdownPopupMessage(var_100_0, false)
	arg_100_1.onCancel = CrossLaunchUtils.PartyCrosslaunchCancel
	arg_100_1.shouldAlwaysBeCancellable = false

	if Engine.CGEFDFCIJA() == 1 then
		arg_100_1.shouldAlwaysBeCancellable = true
	end

	arg_100_1.timerData = {
		frequency = 500,
		getTimeRemainingCallback = CrossLaunchUtils.PartyCrossLaunchTimeRemaining,
		onCountdownCompleteCallback = CrossLaunchUtils.PartyCrossLaunchExecute
	}

	LUI.FlowManager.RequestPopupMenu(self, "CrosslaunchingCoutdownPopup", true, controllerIndex, true, arg_100_1, nil, true, true)
end

function JoinSquadFailurePopup(arg_101_0, arg_101_1)
	local var_101_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_SQUAD_FAILURE"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_SQUAD_FAILURE_DESC")
	}
	local var_101_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_101_0)

	var_101_1.id = "join_squad_failure_popup"

	return var_101_1
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
MenuBuilder.registerType("TextureDownloadCacheVersionChange", TextureDownloadCacheVersionChange)
MenuBuilder.registerType("TextureDownloadCacheAllocError", TextureDownloadCacheAllocError)
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
MenuBuilder.registerType("JoinRandomSquadPopup", JoinRandomSquadPopup)
MenuBuilder.registerType("JoinRandomSquadFailurePopup", JoinRandomSquadFailurePopup)
MenuBuilder.registerType("JoinSquadFailurePopup", JoinSquadFailurePopup)
MenuBuilder.registerType("JoinSquadPopup", JoinSquadPopup)
MenuBuilder.registerType("LeaveSquadPopup", LeaveSquadPopup)
MenuBuilder.registerType("LeaveSquadMenuPopup", LeaveSquadMenuPopup)
MenuBuilder.registerType("LeaveSquadFailurePopup", LeaveSquadFailurePopup)
MenuBuilder.registerType("party_crosslaunch_confirmation", party_crosslaunch_confirmation)
MenuBuilder.registerType("party_crosslaunching", party_crosslaunching_deeplink)
MenuBuilder.registerType("party_host_crosslaunching_deeplink", party_host_crosslaunching_deeplink)
MenuBuilder.registerType("party_crosslaunching_cannot_follow", party_crosslaunching_cannot_follow)
LockTable(_M)
