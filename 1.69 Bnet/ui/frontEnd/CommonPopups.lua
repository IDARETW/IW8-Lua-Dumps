module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

function ReadingSaveDevice(arg_1_0, arg_1_1)
	return (MenuBuilder.BuildRegisteredType("FenceDialogPopup", {
		controllerIndex = 0,
		displayWZWipSetup = true,
		message = Engine.CBBHFCGDIC("PLATFORM/READING_SAVE_DEVICE")
	}))
end

function error_popmenu(arg_2_0, arg_2_1)
	local var_2_0 = {
		title = Dvar.DHEEJCCJBH("NSNNTPQPNT"),
		message = Dvar.DHEEJCCJBH("OMSSQKRMLQ")
	}
	local var_2_1 = Engine.CIHDHDCIBE()

	if string.len(var_2_1) > 0 then
		var_2_0.statusMessage = Engine.CBBHFCGDIC("MENU/COM_ERROR_STRING_WITH_ERROR_CODE", Engine.JCBDICCAH(var_2_1))
	end

	Engine.DHCGHHBHCH()

	var_2_0.controllerIndex = arg_2_1.controllerIndex

	function var_2_0.action()
		Engine.IBCDJDCJC()
	end

	local var_2_2 = MenuBuilder.BuildRegisteredType("PopupOK", var_2_0)

	var_2_2.id = "error_popmenu"

	return var_2_2
end

local function var_0_0(arg_4_0, arg_4_1)
	DebugPrint("QUIT GAME NOW")
	Engine.DJEDDFJEIG()
end

function quit_popmenu()
	local var_5_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/QUITDESKTOP_TITLE"),
		message_text = Engine.CBBHFCGDIC("MENU/QUIT_WARNING_DESKTOP"),
		yes_action = var_0_0
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_5_0)

	var_5_1.id = "quit_popmenu"

	if Engine.DDHFCGHJEA() and Engine.DDJFBBJAIG() then
		local var_5_2 = LUI.FlowManager.GetScopedData(var_5_1).controllerIndex
		local var_5_3 = MenuBuilder.BuildRegisteredType("KoreanRatingsContainer", {
			controllerIndex = var_5_2
		})

		var_5_3.id = "koreanRatingsContainer"

		var_5_3:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -589, _1080p * 68, _1080p * -9, _1080p * 243)
		var_5_3:SetScale(-0.5, 0)
		var_5_1:addElement(var_5_3)
	end

	return var_5_1
end

function restart_popmenu()
	local var_6_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/RESTARTNEEDED_TITLE"),
		message_text = Engine.CBBHFCGDIC("MENU/RESTARTNEEDED_DESC"),
		yes_action = var_0_0
	}
	local var_6_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_6_0)

	var_6_1.id = "restart_popmenu"

	if Engine.DDHFCGHJEA() and Engine.DDJFBBJAIG() then
		local var_6_2 = LUI.FlowManager.GetScopedData(var_6_1).controllerIndex
		local var_6_3 = MenuBuilder.BuildRegisteredType("KoreanRatingsContainer", {
			controllerIndex = var_6_2
		})

		var_6_3.id = "koreanRatingsContainer"

		var_6_3:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -589, _1080p * 68, _1080p * -9, _1080p * 243)
		var_6_3:SetScale(-0.5, 0)
		var_6_1:addElement(var_6_3)
	end

	return var_6_1
end

function restart_upsell_popmenu(arg_7_0, arg_7_1)
	local var_7_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU/TITLE_UPDATE_AVAILABLE"),
		title = Engine.CBBHFCGDIC("MENU/RESTARTNEEDED_TITLE"),
		buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
				action = var_0_0
			}
		}
	}

	var_7_0.defaultFocusIndex = 1
	var_7_0.cancelClosesPopup = false
	var_7_0.buttonsClosePopup = false
	var_7_0.controllerIndex = arg_7_1.controllerIndex

	local var_7_1 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_7_0)

	var_7_1.id = "restart_upsell_popmenu"

	if Engine.DDHFCGHJEA() and Engine.DDJFBBJAIG() then
		local var_7_2 = MenuBuilder.BuildRegisteredType("KoreanRatingsContainer", {
			controllerIndex = arg_7_1.controllerIndex
		})

		var_7_2.id = "koreanRatingsContainer"

		var_7_2:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -589, _1080p * 68, _1080p * -9, _1080p * 243)
		var_7_2:SetScale(-0.5, 0)
		var_7_1:addElement(var_7_2)
	end

	return var_7_1
end

local function var_0_1(arg_8_0, arg_8_1)
	DebugPrint("REBOOT GAME NOW")
	Dvar.DHEGHJJJHI("MKKNSMLKPR", true)
end

function reboot_popup()
	local var_9_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/REBOOT_POPUP_TITLE"),
		message_text = Engine.CBBHFCGDIC("MENU/REBOOT_POPUP_DESC"),
		yes_action = var_0_1
	}
	local var_9_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_9_0)

	var_9_1.id = "reboot_popup"

	if Engine.DDHFCGHJEA() and Engine.DDJFBBJAIG() then
		local var_9_2 = LUI.FlowManager.GetScopedData(var_9_1).controllerIndex
		local var_9_3 = MenuBuilder.BuildRegisteredType("KoreanRatingsContainer", {
			controllerIndex = var_9_2
		})

		var_9_3.id = "koreanRatingsContainer"

		var_9_3:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -589, _1080p * 68, _1080p * -9, _1080p * 243)
		var_9_3:SetScale(-0.5, 0)
		var_9_1:addElement(var_9_3)
	end

	return var_9_1
end

function coppa_restart_popmenu()
	local var_10_0 = {
		popup_title = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_RESTART_CONFIRM_TITLE"),
		message_text = Engine.CBBHFCGDIC("LUA_COPPA/COPPA_RESTART_CONFIRM_DESC"),
		yes_action = var_0_1
	}
	local var_10_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_10_0)

	var_10_1.id = "coppa_restart_popmenu"

	if Engine.DDHFCGHJEA() and Engine.DDJFBBJAIG() then
		local var_10_2 = LUI.FlowManager.GetScopedData(var_10_1).controllerIndex
		local var_10_3 = MenuBuilder.BuildRegisteredType("KoreanRatingsContainer", {
			controllerIndex = var_10_2
		})

		var_10_3.id = "koreanRatingsContainer"

		var_10_3:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -589, _1080p * 68, _1080p * -9, _1080p * 243)
		var_10_3:SetScale(-0.5, 0)
		var_10_1:addElement(var_10_3)
	end

	return var_10_1
end

local function var_0_2(arg_11_0, arg_11_1)
	Engine.BFFHIDFJFG(arg_11_1.controller)
end

local function var_0_3(arg_12_0, arg_12_1)
	Engine.DFBAEGIJIE(arg_12_1.controller)
end

function savedata_failed_popmenu()
	local var_13_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/SAVEDATA_FAILED_TITLE"),
		message_text = Engine.CBBHFCGDIC("MENU/SAVEDATA_FAILED_MESSAGE"),
		yes_action = var_0_2,
		no_action = var_0_3
	}
	local var_13_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_13_0)

	var_13_1.id = "savedata_failed_popmenu"

	return var_13_1
end

function CancelAcceptingInvite(arg_14_0, arg_14_1)
	DebugPrint("CancelAcceptingInvite triggered")
	Engine.EBIDFIDHIE("xcancelinvitejoin", arg_14_1)
	LUI.FlowManager.RequestLeaveMenu(arg_14_0)
end

function AcceptingInvite(arg_15_0, arg_15_1)
	local var_15_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_ACCEPTINVITE"),
		controllerIndex = arg_15_1.controllerIndex,
		onCancel = CancelAcceptingInvite
	}
	local var_15_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_15_0)

	var_15_1.id = "AcceptingInvite"

	return var_15_1
end

function AcceptingInviteWithoutCancel(arg_16_0, arg_16_1)
	local var_16_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_ACCEPTINVITE"),
		controllerIndex = arg_16_1.controllerIndex,
		onCancel = CancelAcceptingInvite
	}
	local var_16_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_16_0)

	var_16_1.id = "AcceptingInviteWithoutCancel"

	return var_16_1
end

function CrosslaunchingJoiningSession(arg_17_0, arg_17_1)
	local var_17_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_ACCEPTINVITE"),
		controllerIndex = arg_17_1.controllerIndex,
		onCancel = CancelAcceptingInvite,
		displayWZWipSetup = arg_17_1.displayWZWipSetup
	}
	local var_17_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_17_0)

	var_17_1.id = "CrosslaunchingJoiningSession"

	return var_17_1
end

local function var_0_4()
	return Engine.DDICCGJBEA()
end

function CrosslaunchingWaitingForPartyMembers(arg_19_0, arg_19_1)
	local var_19_0 = {
		message = Engine.CBBHFCGDIC("MENU/WAITING_FOR_PARTY_MEMBERS_TO_JOIN", var_0_4()),
		controllerIndex = arg_19_1.controllerIndex,
		onCancel = CancelAcceptingInvite,
		timerData = {
			frequency = 500,
			getNumPartyMembersWaitingToJoinThroughCrosslaunchCallback = var_0_4
		},
		displayWZWipSetup = arg_19_1.displayWZWipSetup
	}
	local var_19_1 = MenuBuilder.BuildRegisteredType("WaitingForPartyMembersForCrosslaunchPopup", var_19_0)

	var_19_1.id = "CrosslaunchingWaitingForPartyMembers"

	return var_19_1
end

function HostCrossLaunchTimeRemaining(arg_20_0)
	return arg_20_0.endTime - Engine.DEIDGHDBHD()
end

HOST_CROSS_LAUNCH_TIME_IN_SECONDS = 5

function host_crosslaunching(arg_21_0, arg_21_1)
	arg_21_1.title = Engine.CBBHFCGDIC("MENU/NOTICE")
	arg_21_1.message = CrossLaunchUtils.GetCountdownPopupMessage(arg_21_1.game, false)
	arg_21_1.gameId = arg_21_1.game
	arg_21_1.onCancel = CrossLaunchUtils.PartyCrosslaunchDecline
	arg_21_1.shouldAlwaysBeCancellable = true
	arg_21_1.timerData = {
		frequency = 500,
		getTimeRemainingCallback = HostCrossLaunchTimeRemaining,
		onCountdownCompleteCallback = CrossLaunchUtils.HostCrossLaunchOnComplete,
		time = HOST_CROSS_LAUNCH_TIME_IN_SECONDS
	}

	local var_21_0 = MenuBuilder.BuildRegisteredType("CrosslaunchingCoutdownPopup", arg_21_1)

	var_21_0.id = "host_crosslaunching"
	var_21_0.XUID = arg_21_1.XUID
	var_21_0.isPresenceJoin = arg_21_1.isPresenceJoin

	return var_21_0
end

function UpdateTextDots(arg_22_0, arg_22_1)
	assert(arg_22_0.properties.numDots)
	assert(arg_22_0.properties.message)

	local var_22_0 = arg_22_0.properties.numDots
	local var_22_1 = arg_22_0.properties.message
	local var_22_2 = (var_22_0 + 1) % 4

	for iter_22_0 = 1, var_22_2 do
		var_22_1 = var_22_1 .. ". "
	end

	arg_22_0:setText(var_22_1)

	arg_22_0.properties.numDots = var_22_2
end

function CancelShaderUploadConfirmationPopup(arg_23_0, arg_23_1)
	return MenuBuilder.BuildRegisteredType("CancelShadersPopup", arg_23_1)
end

function FenceDialogPopup(arg_24_0, arg_24_1)
	assert(arg_24_1.controllerIndex)
	assert(arg_24_1.message)

	return MenuBuilder.BuildRegisteredType("FenceDialog", arg_24_1)
end

function FenceDialogPopupWithProgress(arg_25_0, arg_25_1)
	arg_25_1 = arg_25_1 or {}
	arg_25_1.useProgress = true

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_25_1)
end

function RegimentsFenceDialogPopup(arg_26_0, arg_26_1)
	assert(arg_26_1)
	assert(arg_26_1.controllerIndex)
	assert(arg_26_1.message)

	arg_26_1.disableIntro = true

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_26_1)
end

function FenceSigninQueueDialogPopup(arg_27_0, arg_27_1)
	arg_27_1 = arg_27_1 or {}

	local var_27_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_27_1)

	if not arg_27_1.controllerIndex then
		local var_27_1 = Engine.IJEBHJIJF()
	end

	var_27_0.Description:setText(arg_27_1.description)
	var_27_0.WaitTime:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", 0, 0, 0))
	var_27_0.WaitPosition:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CURRENT_POSITION", 0))
	var_27_0.WaitPosition:SetAlpha(1)
	WZWIP.AnimateThemeElement(var_27_0, "SetQueueDisplay")

	local var_27_2

	local function var_27_3()
		local var_28_0 = Engine.CJCEEHHIJE()
		local var_28_1 = math.floor(var_28_0 / 3600)
		local var_28_2 = var_28_0 - var_28_1 * 3600
		local var_28_3 = math.floor(var_28_2 / 60)
		local var_28_4 = var_28_2 - var_28_3 * 60
		local var_28_5 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", var_28_1, var_28_3, var_28_4)

		var_27_0.WaitTime:setText(var_28_5)

		var_27_0.WaitTime:Wait(1000).onComplete = var_27_3
	end

	var_27_3()

	local var_27_4

	local function var_27_5()
		local var_29_0 = Engine.BFBHHIHIJD()
		local var_29_1 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CURRENT_POSITION", var_29_0)

		var_27_0.WaitPosition:setText(var_29_1)

		var_27_0.WaitPosition:Wait(1000).onComplete = var_27_5
	end

	var_27_5()

	return var_27_0
end

function FenceOnlineQueueDialogPopupWithDescription(arg_30_0, arg_30_1)
	arg_30_1 = arg_30_1 or {}

	local var_30_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_30_1)
	local var_30_1 = arg_30_1.controllerIndex or Engine.IJEBHJIJF()

	var_30_0.Description:setText(arg_30_1.description)
	var_30_0.WaitTime:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", 0, 0, 0))
	WZWIP.AnimateThemeElement(var_30_0, "SetQueueDisplay")

	local var_30_2

	local function var_30_3()
		local var_31_0 = Engine.BAFIABHBHG(var_30_1)

		DebugPrint(" wait time: " .. var_31_0)

		local var_31_1 = math.floor(var_31_0 / 3600)
		local var_31_2 = var_31_0 - var_31_1 * 3600
		local var_31_3 = math.floor(var_31_2 / 60)
		local var_31_4 = var_31_2 - var_31_3 * 60
		local var_31_5 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", var_31_1, var_31_3, var_31_4)

		var_30_0.WaitPosition:setText(var_31_5)

		var_30_0.WaitTime:Wait(1000).onComplete = var_30_3
	end

	var_30_3()

	return var_30_0
end

function live_dialog_text_box_with_cancel(arg_32_0, arg_32_1)
	arg_32_1 = arg_32_1 or {}

	local var_32_0 = {
		message = arg_32_1.message or "",
		controllerIndex = arg_32_1.controllerIndex or Engine.IJEBHJIJF(),
		onCancel = arg_32_1.cancel_func,
		disableIntro = arg_32_1.disableIntro,
		showExit = arg_32_1.showExit,
		displayWZWipSetup = arg_32_1.displayWZWipSetup
	}

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_32_0)
end

function live_dialog_text_box(arg_33_0, arg_33_1)
	arg_33_1 = arg_33_1 or {}

	local var_33_0 = {
		message = arg_33_1.message or "",
		controllerIndex = arg_33_1.controllerIndex or Engine.IJEBHJIJF(),
		disableIntro = arg_33_1.disableIntro,
		displayWZWipSetup = arg_33_1.displayWZWipSetup
	}

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_33_0)
end

function menu_online_ended()
	local var_34_0 = {
		title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
		message = Dvar.DHEEJCCJBH("online_end_reason")
	}
	local var_34_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_34_0)

	var_34_1.id = "menu_online_ended"

	return var_34_1
end

local function var_0_5(arg_35_0, arg_35_1)
	Engine.EBIDFIDHIE("disconnect")
end

function campaign_mode_savedata_error_popup(arg_36_0, arg_36_1)
	local var_36_0 = {
		title = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_TITLE"),
		message = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_CAMPAIGN"),
		controllerIndex = arg_36_1.controllerIndex,
		action = function(arg_37_0)
			HUDUtils.CorruptSaveDataRepairForSP(arg_36_1.controllerIndex)
			Engine.DIDFHBFDFG(PauseReason.SAVE_DATA_ERROR)
		end
	}
	local var_36_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_36_0)

	var_36_1.id = "campaign_mode_savedata_error_popup"

	return var_36_1
end

local function var_0_6(arg_38_0)
	return Engine.JCBDICCAH(string.format("%02d", arg_38_0))
end

local function var_0_7(arg_39_0, arg_39_1)
	Engine.CIGGHDDHGJ(arg_39_1.controller, not Engine.BECCFCBIAA("gpadEnabled", arg_39_1.controller))
	Engine.DAGFFDGFII("updategamerprofile " .. arg_39_1.controller)
	Engine.DBFFAEEFGJ():TryAddMouseCursor()
end

local function var_0_8(arg_40_0, arg_40_1)
	if not Engine.DDJFBBJAIG() then
		if LUI.FlowManager.IsInStack("popup_leave_game") then
			LUI.FlowManager.RequestLeaveMenuByName("popup_leave_game", true, true)
		end

		LUI.FlowManager.RequestPopupMenu(nil, "popup_leave_game", true, arg_40_1.controller, true)
	elseif Lobby.BBDICGHE() then
		if IsPrivateMatch() then
			LUI.FlowManager.RequestPopupMenu(nil, "leave_private_mp_lobby", true, arg_40_1.controller, true)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "leave_public_mp_lobby", true, arg_40_1.controller, true)
		end
	elseif CONDITIONS.IsInGameBattlesMatch() then
		arg_40_0:dispatchEventToRoot({
			name = "gamebattles_input_leave_lobby",
			controller = arg_40_1.controller
		})
	end
end

if Engine.HDGDBCJFG() then
	function ControllerRemovedPopup(arg_41_0, arg_41_1)
		local var_41_0 = {
			message = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED"),
			controllerIndex = arg_41_1.controllerIndex
		}

		var_41_0.isGeneric = true

		return (MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_41_0))
	end
else
	function ControllerRemovedPopup()
		local var_42_0 = {
			popup_title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
			message_text = Engine.CBBHFCGDIC("@PLATFORM/CONTROLLER_DISCONNECTED"),
			button_text = Engine.CBBHFCGDIC("@MENU/SWITCH_TO_MOUSE"),
			confirmation_action = var_0_7
		}

		return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_42_0))
	end
end

function WaitingForTransientsPopMenu()
	local var_43_0 = {
		message = Engine.CBBHFCGDIC("@MENU_SP/LOADING_TRANSIENTS")
	}

	var_43_0.controllerIndex = 0

	local var_43_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_43_0)
	local var_43_2 = LUI.UIElement.new()

	var_43_2:SetBlurStrength(2)
	var_43_2:setupWorldBlur()

	var_43_2.id = "blur"

	var_43_1:addElement(var_43_2)

	local var_43_3 = LUI.UIBindButton.new()

	var_43_3:registerEventHandler("button_start", LUI.HUD.OpenPauseMenu)
	var_43_1:addElement(var_43_3)

	return var_43_1
end

function ConfirmProfileChange(arg_44_0, arg_44_1)
	DebugPrint("Confirm profile change")
	Engine.EBIDFIDHIE("confirmProfileChange", arg_44_1.controller)
	LUI.FlowManager.RequestLeaveMenu(arg_44_0)
end

function IgnoreProfileChange(arg_45_0, arg_45_1)
	DebugPrint("Ignore profile change")
	Engine.DGFBJCEDCG(arg_45_1.controller)
	LUI.FlowManager.RequestLeaveMenu(arg_45_0)
end

function user_changed_confirm_mp()
	local var_46_0 = {
		message_text = Engine.CBBHFCGDIC("PLATFORM/PROFILE_PAIRING_CONFIRM"),
		popup_title = Engine.CBBHFCGDIC("MENU/WARNING"),
		yes_text = Engine.CBBHFCGDIC("MENU/YES"),
		no_text = Engine.CBBHFCGDIC("MENU/NO"),
		yes_action = IgnoreProfileChange,
		no_action = ConfirmProfileChange
	}

	var_46_0.defaultFocusIndex = 1

	local var_46_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_46_0)

	var_46_1.id = "user_changed_confirm_mp"

	return var_46_1
end

function controller_changed_confirm_mp()
	local var_47_0 = {
		message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_PAIRING_CONFIRM"),
		popup_title = Engine.CBBHFCGDIC("MENU/WARNING")
	}
	local var_47_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_47_0)

	var_47_1.id = "controller_changed_confirm_mp"

	return var_47_1
end

function PopupFenceGameModeError(arg_48_0, arg_48_1)
	assert(arg_48_1 and (arg_48_1.errorCode or arg_48_1.missingDLCMessage))

	local var_48_0 = arg_48_1.errorCode
	local var_48_1 = ""
	local var_48_2 = arg_48_1.missingDLCMessage or ""

	if #var_48_2 > 0 then
		var_48_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
	elseif var_48_0 == CoD.FenceErrorCodes.Ownership then
		var_48_1 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_NEEDED")
		var_48_2 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_NEEDED_MESSAGE")
	elseif var_48_0 == CoD.FenceErrorCodes.Installation then
		var_48_1 = Engine.CBBHFCGDIC("LUA_MENU/INSTALLATION_NEEDED")
		var_48_2 = Engine.CBBHFCGDIC("LUA_MENU/INSTALLATION_NEEDED_MESSAGE")
	end

	local var_48_3 = {
		popup_title = var_48_1,
		message_text = var_48_2
	}
	local var_48_4 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_48_3)

	var_48_4.id = "popup_getting_data_error"

	return var_48_4
end

function controllerremoved_inputswap_popup(arg_49_0, arg_49_1)
	local var_49_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE")
	}

	if OPTIONS.IsInputSwapEnabled() then
		var_49_0.message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED_INGAME")
		var_49_0.button_text = Engine.CBBHFCGDIC("MENU/SWITCH_TO_MOUSE")
		var_49_0.confirmation_action = var_0_7
	else
		var_49_0.message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED_INGAME_NOSWAP")
		var_49_0.button_text = CONDITIONS.IsInGameBattlesMatch() and Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEAVE_MATCH") or Engine.CBBHFCGDIC("MENU/TO_THE_MAIN_MENU")
		var_49_0.confirmation_action = var_0_8
	end

	local var_49_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_49_0)

	var_49_1.id = "controllerremoved_inputswap_popup"

	return var_49_1
end

function keyboardremoved_inputswap_popup(arg_50_0, arg_50_1)
	local var_50_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE")
	}

	if OPTIONS.IsInputSwapEnabled() then
		var_50_0.message_text = Engine.CBBHFCGDIC("PLATFORM/KBM_DISCONNECTED_INGAME")
		var_50_0.button_text = Engine.CBBHFCGDIC("PLATFORM/SWITCH_TO_CONTROLLER")
		var_50_0.confirmation_action = var_0_7
	else
		var_50_0.message_text = Engine.CBBHFCGDIC("PLATFORM/KBM_DISCONNECTED_INGAME_NOSWAP")
		var_50_0.button_text = CONDITIONS.IsInGameBattlesMatch() and Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEAVE_MATCH") or Engine.CBBHFCGDIC("MENU/TO_THE_MAIN_MENU")
		var_50_0.confirmation_action = var_0_8
	end

	local var_50_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_50_0)

	var_50_1.id = "keyboardremoved_inputswap_popup"

	return var_50_1
end

function generic_error_popup(arg_51_0, arg_51_1)
	local var_51_0 = {
		popup_title = arg_51_1.title or Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = arg_51_1.message
	}
	local var_51_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_51_0)

	var_51_1.id = "generic_error_popup"

	return var_51_1
end

function spinner_inprogress_popup(arg_52_0, arg_52_1)
	local var_52_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_52_1.message,
		cancel_func = arg_52_1.onCancel
	}
	local var_52_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_52_0)

	var_52_1.id = "spinner_inprogress_popup"

	return var_52_1
end

function spinner_confirmation_popup(arg_53_0, arg_53_1)
	local var_53_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = arg_53_1.message .. " " .. Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_SUCCESSFUL")
	}
	local var_53_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_53_0)

	var_53_1.id = "spinner_confirmation_popup"

	return var_53_1
end

function store_inprogress_popup(arg_54_0, arg_54_1)
	local var_54_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_54_1.message,
		cancel_func = arg_54_1.onCancel,
		displayWZWipSetup = arg_54_1.displayWZWipSetup
	}
	local var_54_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_54_0)

	var_54_1.id = "store_inprogress_popup"

	return var_54_1
end

function tournament_inprogress_popup(arg_55_0, arg_55_1)
	local var_55_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_55_1.message,
		cancel_func = arg_55_1.onCancel
	}
	local var_55_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_55_0)

	var_55_1.id = "tournament_inprogress_popup"

	return var_55_1
end

function ReportPlayer(arg_56_0, arg_56_1)
	assert(arg_56_1.xuid)

	local var_56_0 = {
		title = Engine.CBBHFCGDIC("MENU/REPORT_PLAYER")
	}

	var_56_0.message = ""
	var_56_0.buttons = {}

	local var_56_1 = {
		{
			confirmationString = "MENU/REPORT_TEXT_CHAT_SUBMIT",
			text = "MENU/REPORT_TEXT_CHAT",
			offense = FRIENDS.Constants.reportOffensiveTextChat
		},
		{
			confirmationString = "MENU/REPORT_EXPLOITING_SUBMIT",
			text = "MENU/REPORT_EXPLOITING",
			offense = FRIENDS.Constants.reportExploitingLobbyPlayer
		},
		{
			confirmationString = "MENU/REPORT_CHEATING_SUBMIT",
			text = "MENU/REPORT_CHEATING",
			offense = FRIENDS.Constants.reportCheatingLobbyPlayer
		},
		{
			confirmationString = "MENU/REPORT_BOOSTING_SUBMIT",
			text = "MENU/REPORT_BOOSTING",
			offense = FRIENDS.Constants.reportBoostingLobbyPlayer
		},
		{
			confirmationString = "MENU/REPORT_USERNAME_SUBMIT",
			text = "MENU/REPORT_USERNAME",
			offense = FRIENDS.Constants.reportOffensiveUsername
		},
		{
			confirmationString = "MENU/REPORT_CLAN_TAG_SUBMIT",
			text = "MENU/REPORT_CLAN_TAG",
			offense = FRIENDS.Constants.reportOffensiveClanTag
		}
	}

	for iter_56_0, iter_56_1 in ipairs(var_56_1) do
		table.insert(var_56_0.buttons, {
			label = Engine.CBBHFCGDIC(iter_56_1.text),
			action = function(arg_57_0, arg_57_1)
				Lobby.BIHAGFBBAG(arg_57_1, arg_56_1.xuid, iter_56_1.offense)
				LUI.FlowManager.RequestPopupMenu(arg_57_0, "PopupOK", true, arg_57_1, false, {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = Engine.CBBHFCGDIC(iter_56_1.confirmationString)
				})
			end
		})
	end

	local var_56_2 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_56_0)

	var_56_2.id = "ReportPlayer"

	return var_56_2
end

function LeaveCommonMPMainMenuPopup(arg_58_0, arg_58_1)
	assert(arg_58_1.menu)

	local var_58_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_59_0, arg_59_1)
			Lobby.LeaveCommonMPMainMenu(arg_58_1.menu, arg_59_1)
		end,
		noAction = function()
			return
		end
	}
	local var_58_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_58_0)

	var_58_1.id = "LeaveMissionLobby"

	return var_58_1
end

function LeavePrivatePartyConfirmPopup(arg_61_0, arg_61_1)
	assert(arg_61_1.menu)

	local var_61_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_62_0, arg_62_1)
			Lobby.LeavePrivateParty(arg_61_1.menu, arg_62_1, arg_61_1.moveUI)
		end,
		noAction = function()
			return
		end
	}
	local var_61_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_61_0)

	var_61_1.id = "LeavePrivatePartyConfirmPopup"

	return var_61_1
end

function LeaveLookForPartySearchQueue(arg_64_0, arg_64_1)
	assert(arg_64_1.menu)

	local var_64_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/STOPSEARCHING"),
		yesAction = function(arg_65_0, arg_65_1)
			Lobby.CheckAndGeneratePlayerLFPSession(arg_65_1, Lobby.LFPEvents.STOPPED)
			Engine.EBIDFIDHIE(Lobby.LOOK_FOR_PARTY_STOP_SEARCHING_STRING)
			LUI.FlowManager.RequestLeaveMenu(popElement)
		end,
		noAction = function()
			return
		end
	}
	local var_64_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_64_0)

	var_64_1.id = "LeaveLookForPartySearchQueue"

	return var_64_1
end

function RateLimitedLeaveCommonMPMainMenuPopup(arg_67_0, arg_67_1)
	assert(arg_67_1.menu)

	local var_67_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_68_0, arg_68_1)
			Lobby.LeaveCommonMPMainMenu(arg_67_1.menu, arg_68_1)
		end,
		noAction = function()
			return
		end,
		rateLimited = arg_67_1.rateLimited,
		rateLimitIntervalMS = arg_67_1.rateLimitIntervalMS,
		rateLimitAttempts = arg_67_1.rateLimitAttempts
	}
	local var_67_1 = MenuBuilder.BuildRegisteredType("RateLimitedPopupYesNo", var_67_0)

	var_67_1.id = "LeaveMissionLobby"

	return var_67_1
end

function ShowUpsellDialogPopup(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_1.controllerIndex

	assert(var_70_0)
	Dvar.DHEGHJJJHI("showUpsellDialog", false)
	Engine.IBCDJDCJC()

	local var_70_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/TRIAL_EXPIRED"),
		message = Engine.CBBHFCGDIC("LUA_MENU/TRIAL_EXPIRED_MSG")
	}

	var_70_1.buttonsClosePopup = true
	var_70_1.cancelClosesPopup = true
	var_70_1.buttons = {}

	local var_70_2 = {
		label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW")),
		action = function(arg_71_0, arg_71_1)
			if CONDITIONS.IsPS4() then
				Commerce.DAGIHHFJIJ(arg_71_1)
			elseif CONDITIONS.IsXboxOne() then
				LUI.FlowManager.RequestPopupMenu(nil, "ShowUpsellXboxStore", false, nil, false, {}, nil, false, true)
			end
		end
	}

	table.insert(var_70_1.buttons, var_70_2)

	local var_70_3 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_72_0, arg_72_1)
			return
		end
	}

	table.insert(var_70_1.buttons, var_70_3)

	local var_70_4 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_70_1)

	var_70_4.id = "ShowUpsellDialogPopup"

	return var_70_4
end

function ShowPreorderBetaAccessDialogPopup(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_1.controllerIndex

	assert(var_73_0)

	local var_73_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/BETA_GO_TO_STORE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/BETA_GO_TO_STORE_DESC")
	}

	var_73_1.buttonsClosePopup = true
	var_73_1.cancelClosesPopup = true
	var_73_1.buttons = {}

	local var_73_2 = {
		label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE")),
		action = function(arg_74_0, arg_74_1)
			Lobby.AttemptOpenBRMenu(arg_74_1, {
				useStandaloneStore = true,
				activeTabIndex = TAB.GetIndex(TAB.MP.STORE)
			})
		end
	}

	table.insert(var_73_1.buttons, var_73_2)

	local var_73_3 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_75_0, arg_75_1)
			return
		end
	}

	table.insert(var_73_1.buttons, var_73_3)

	local var_73_4 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_73_1)

	var_73_4.id = "ShowPreorderBetaAccessDialogPopup"

	return var_73_4
end

function DisbandPartyEnterGameBattlesLobbyPopup(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_1.controllerIndex

	assert(var_76_0)

	local var_76_1 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/DISBAND_PARTY"),
		yesAction = function(arg_77_0, arg_77_1)
			Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_77_1)
			Lobby.OpenGameBattlesLobby(arg_77_1)
		end
	}
	local var_76_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_76_1)

	var_76_2.id = "DisbandPartyEnterGameBattlesLobbyPopup"

	return var_76_2
end

function RateLimitedPopupYesNo(arg_78_0, arg_78_1)
	arg_78_1.rateLimited = true
	arg_78_1.rateLimitIntervalMS = arg_78_1.rateLimitIntervalMS or 5000
	arg_78_1.rateLimitAttempts = arg_78_1.rateLimitAttempts or 3

	return (MenuBuilder.BuildRegisteredType("PopupYesNo", arg_78_1))
end

function ShowUpsellXboxStore(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_1.controllerIndex

	assert(var_79_0)

	local var_79_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS")
	}

	var_79_1.message = ""
	var_79_1.buttonsClosePopup = true
	var_79_1.cancelClosesPopup = true
	var_79_1.buttons = {}

	local var_79_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_DELUXE"),
		action = function(arg_80_0, arg_80_1)
			Commerce.DAGIHHFJIJ(arg_80_1, "c5da3bf3-3459-4202-a7eb-6eb8f41fabe5")
		end
	}

	table.insert(var_79_1.buttons, var_79_2)

	local var_79_3 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_LEGACY"),
		action = function(arg_81_0, arg_81_1)
			Commerce.DAGIHHFJIJ(arg_81_1, "559cf838-c5c4-498a-a5e3-351fa4b37d7c")
		end
	}

	table.insert(var_79_1.buttons, var_79_3)

	local var_79_4 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_BASE"),
		action = function(arg_82_0, arg_82_1)
			Commerce.DAGIHHFJIJ(arg_82_1, "b34bce6e-11b7-45ae-bb93-aad737c1b457")
		end
	}

	table.insert(var_79_1.buttons, var_79_4)

	local var_79_5 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_83_0, arg_83_1)
			return
		end
	}

	table.insert(var_79_1.buttons, var_79_5)

	local var_79_6 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_79_1)

	var_79_6.id = "ShowUpsellXboxStore"

	return var_79_6
end

function ShowCWUpsellXboxStore(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_1.controllerIndex

	assert(var_84_0)

	local var_84_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS")
	}

	var_84_1.message = ""
	var_84_1.buttonsClosePopup = true
	var_84_1.cancelClosesPopup = true
	var_84_1.buttons = {}

	local var_84_2 = {
		label = Engine.CBBHFCGDIC("MENU/BUNDLE_NAME_BOCW_STANDARD"),
		action = function(arg_85_0, arg_85_1)
			Commerce.DAGIHHFJIJ(arg_85_1, "44324e39-514d-3042-c04e-395243342d00")
		end
	}

	table.insert(var_84_1.buttons, var_84_2)

	local var_84_3 = {
		label = Engine.CBBHFCGDIC("MENU/BUNDLE_NAME_BOCW_ULTIMATE"),
		action = function(arg_86_0, arg_86_1)
			Commerce.DAGIHHFJIJ(arg_86_1, "36334e39-4d4d-3051-c04d-58544c587800")
		end
	}

	table.insert(var_84_1.buttons, var_84_3)

	local var_84_4 = {
		label = Engine.CBBHFCGDIC("MENU/BUNDLE_NAME_BOCW_NEXT_GEN_STANDARD"),
		action = function(arg_87_0, arg_87_1)
			Commerce.DAGIHHFJIJ(arg_87_1, "36384e39-5733-304c-c053-485a47565d00")
		end
	}

	table.insert(var_84_1.buttons, var_84_4)

	local var_84_5 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_88_0, arg_88_1)
			return
		end
	}

	table.insert(var_84_1.buttons, var_84_5)

	local var_84_6 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_84_1)

	var_84_6.id = "ShowCWUpsellXboxStore"

	return var_84_6
end

local function var_0_9(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_1.controllerIndex

	assert(var_89_0)
	assert(arg_89_1.labels)
	assert(arg_89_1.keys)
	assert(arg_89_1.callback)

	local var_89_1 = {
		title = Engine.CBBHFCGDIC("MENU/FILTER_OPTIONS_CAPS"),
		width = _1080p * 500
	}

	var_89_1.defaultFocusIndex = 1
	var_89_1.cancelClosesPopup = true
	var_89_1.listContent = {}

	local var_89_2
	local var_89_3 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_89_0
	})

	var_89_3.id = "TypeButton"

	var_89_3.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FILTER")), 0)
	var_89_3:SetAnchors(0, 1, 1, 0, 0)
	var_89_3:SetLeft(_1080p * 0, 0)
	var_89_3:SetRight(_1080p * 500, 0)
	var_89_3:SetTop(_1080p * 0, 0)
	var_89_3:SetBottom(_1080p * 35, 0)

	var_89_3.filterType = arg_89_1.keys[var_89_1.defaultFocusIndex]

	LUI.AddUIArrowTextButtonLogic(var_89_3, var_89_0, {
		wrapAround = true,
		defaultValue = 1,
		labels = arg_89_1.labels,
		action = function(arg_90_0)
			var_89_3.filterType = arg_89_1.keys[arg_90_0]
		end
	})
	table.insert(var_89_1.listContent, var_89_3)

	local var_89_4
	local var_89_5 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_89_0
	})

	var_89_5.id = "AcceptButton"

	var_89_5.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT")), 0)
	var_89_5:SetAnchors(0, 1, 1, 0, 0)
	var_89_5:SetLeft(_1080p * 0, 0)
	var_89_5:SetRight(_1080p * 500, 0)
	var_89_5:SetTop(_1080p * 120, 0)
	var_89_5:SetBottom(_1080p * 155, 0)
	var_89_5:addEventHandler("button_action", function(arg_91_0, arg_91_1)
		ACTIONS.LeaveMenu(arg_91_0)
		arg_89_1.callback(var_89_3.filterType)
	end)
	table.insert(var_89_1.listContent, var_89_5)

	local var_89_6
	local var_89_7 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_89_0
	})

	var_89_7.id = "ButtonHelperBar"

	var_89_7:SetAnchors(0, 1, 1, 0, 0)
	var_89_7:SetLeft(_1080p * 0, 0)
	var_89_7:SetRight(_1080p * 500, 0)
	var_89_7:SetTop(_1080p * -50, 0)
	var_89_7:SetBottom(_1080p * 0, 0)
	table.insert(var_89_1.listContent, var_89_7)

	local var_89_8 = MenuBuilder.BuildRegisteredType("PopupList", var_89_1)

	var_89_8.id = "FilterPopup"

	var_89_8:AddButtonHelperTextToElement(var_89_7, {
		clickable = true,
		priority = 1,
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("@MENU/CANCEL")
	})

	return var_89_8
end

local function var_0_10(arg_92_0, arg_92_1)
	arg_92_1.chatOptOut = arg_92_1.chatOptOut or true
	arg_92_1.title = arg_92_1.title or Engine.CBBHFCGDIC("LUA_MENU/EULA_ACCEPT")
	arg_92_1.message = arg_92_1.message or Engine.CBBHFCGDIC("LUA_MENU/EULA_MESSAGE")
	arg_92_1.buttons = arg_92_1.buttons or {
		{
			label = Engine.CBBHFCGDIC("MENU/OK")
		}
	}

	local var_92_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_92_1)

	var_92_0.id = "EULADeclinePopup"

	return var_92_0
end

local function var_0_11(arg_93_0, arg_93_1)
	assert(arg_93_1.controllerIndex)
	assert(arg_93_1.onAccept)

	arg_93_1.title = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_TITLE")

	if arg_93_1.crossplayRecommended then
		arg_93_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_CROSSPLAY_RECOMMENDED_MESSAGE")
	elseif arg_93_1.crossplayRecommendedReminder then
		arg_93_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_CROSSPLAY_RECOMMENDED_REMINDER_MESSAGE")
	else
		arg_93_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_MESSAGE")
	end

	arg_93_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_BUTTON"),
			action = function(arg_94_0, arg_94_1)
				OPTIONS_DATA.optionsDataList.CrossPlay.action(nil, arg_93_1.controllerIndex, OPTIONS.disableButtonOptions.ENABLED)
				arg_93_1.onAccept(arg_93_1.button)
				LUI.FlowManager.RequestLeaveMenu(arg_94_0)
			end
		}
	}

	local var_93_0 = {}

	if arg_93_1.crossplayRecommended then
		var_93_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU_MP/NO"),
			action = function(arg_95_0, arg_95_1)
				LUI.FlowManager.RequestLeaveMenu(arg_95_0)
				arg_93_1.onAccept(arg_93_1.button)
			end
		}
	elseif arg_93_1.crossplayRecommendedReminder then
		var_93_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU_MP/NO"),
			action = function(arg_96_0, arg_96_1)
				LUI.FlowManager.RequestLeaveMenu(arg_96_0)
			end
		}
	else
		var_93_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = function(arg_97_0, arg_97_1)
				LUI.FlowManager.RequestLeaveMenu(arg_97_0)
			end
		}
	end

	table.insert(arg_93_1.buttons, var_93_0)

	local var_93_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_93_1)

	var_93_1.id = "LPCEnableCrossplayPopup"

	return var_93_1
end

local function var_0_12(arg_98_0, arg_98_1)
	assert(arg_98_1.onAccept)
	assert(arg_98_1.onDecline)
	assert(arg_98_1.activeMissionName)
	assert(arg_98_1.newMissionName)

	local function var_98_0(arg_99_0, arg_99_1)
		arg_98_1.onDecline()
		LUI.FlowManager.RequestLeaveMenu(arg_99_0)
	end

	arg_98_1.title = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION")
	arg_98_1.message = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION_WARNING", arg_98_1.newMissionName, arg_98_1.activeMissionName)
	arg_98_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION"),
			action = function(arg_100_0, arg_100_1)
				arg_98_1.onAccept()
				LUI.FlowManager.RequestLeaveMenu(arg_100_0)
			end
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = var_98_0
		}
	}

	MenuUtils.SelectPopupImage(arg_98_1)

	local var_98_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_98_1)

	var_98_1.id = "ActivateMissionPopup"

	local var_98_2 = LUI.UIBindButton.new()

	var_98_2.id = "bindButton"

	var_98_1:addElement(var_98_2)

	var_98_1.bindButton = var_98_2

	var_98_1.bindButton:addEventHandler("button_secondary", var_98_0)

	return var_98_1
end

local function var_0_13(arg_101_0, arg_101_1)
	assert(arg_101_1.onAccept)
	assert(arg_101_1.onDecline)
	assert(arg_101_1.activeMissionName)

	arg_101_1.title = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION")
	arg_101_1.message = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION_WARNING", arg_101_1.activeMissionName)
	arg_101_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION"),
			action = function(arg_102_0, arg_102_1)
				arg_101_1.onAccept()
				LUI.FlowManager.RequestLeaveMenu(arg_102_0)
			end
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = function(arg_103_0, arg_103_1)
				arg_101_1.onDecline()
				LUI.FlowManager.RequestLeaveMenu(arg_103_0)
			end
		}
	}

	local var_101_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_101_1)

	var_101_0.id = "DeactivateMissionPopup"

	return var_101_0
end

local function var_0_14(arg_104_0, arg_104_1)
	assert(arg_104_1.controllerIndex)
	assert(arg_104_1.message)

	arg_104_1.disableIntro = true

	local var_104_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_104_1)

	var_104_0.id = "MissionActivationSpinner"

	return var_104_0
end

local function var_0_15()
	local var_105_0 = {
		message_text = Engine.CDFHFJGICJ(),
		popup_title = Engine.CBBHFCGDIC("MENU/ANTI_ADDICTION_TIPS_TITLE"),
		button_text = Engine.CBBHFCGDIC("MENU/OK"),
		confirmation_action = Engine.OnAntiAddictionTipsConfirmed
	}
	local var_105_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_105_0)

	var_105_1.id = "AntiAddictionTipsPopup"

	return var_105_1
end

local function var_0_16(arg_106_0, arg_106_1)
	arg_106_1.title = WORLD_MAP.GetOperationName()
	arg_106_1.tabWidgets = {
		"OperationRewards",
		"OperationBriefing"
	}
	arg_106_1.tabNames = {
		"LUA_MENU/REWARD_PLURAL",
		"LUA_MENU/BRIEFING"
	}

	return MenuBuilder.BuildRegisteredType("FullModalTabPopup", arg_106_1)
end

local function var_0_17(arg_107_0, arg_107_1)
	assert(arg_107_1)

	local var_107_0 = {
		disableIntro = true,
		message = Engine.CBBHFCGDIC("LUA_MENU/MODE_FENCE_MESSAGE")
	}
	local var_107_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_107_0)

	var_107_1.id = "ModeFencePopup"

	local var_107_2 = 10000

	var_107_1:Wait(var_107_2).onComplete = function()
		local function var_108_0()
			local var_109_0 = var_107_1._controllerIndex and var_107_1._controllerIndex or arg_107_1.controllerIndex

			return ACTIONS.RestoreMenu("MainMenu", true, var_109_0)
		end

		var_107_1:SetupCancelButton(var_108_0)
	end

	return var_107_1
end

local function var_0_18(arg_110_0, arg_110_1)
	assert(arg_110_1)
	assert(arg_110_1.warningMessage)
	assert(arg_110_1.yesAction)

	local var_110_0 = {
		title = Engine.CBBHFCGDIC("MENU/CONFIRMATION_POPUP_TITLE"),
		message = Engine.CBBHFCGDIC(arg_110_1.warningMessage),
		yesAction = arg_110_1.yesAction
	}

	if arg_110_1.noAction then
		var_110_0.noAction = arg_110_1.noAction
	else
		function var_110_0.noAction(arg_111_0)
			return
		end
	end

	local var_110_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_110_0)

	var_110_1.id = "ModularWarningPopup"

	return var_110_1
end

function leaveLobbyBlockedPlayerWarningYesAction(arg_112_0, arg_112_1)
	if Lobby.AreWePrivatePartyHost() then
		Engine.EBIDFIDHIE("xstoplobbybackout leavelobbyblockedplayerwarning", arg_112_1.controller)
	else
		Engine.EBIDFIDHIE("xstopparty leavelobbyblockedplayerwarning", arg_112_1.controller)
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
		Engine.DAGFFDGFII("xstartprivateparty")
	end

	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)

	if Lobby.CAEJIEEEDF() > 0 then
		Lobby.CJBHJEAFGH(0)
	end

	if MLG.AreMLGRulesEnabled() then
		MLG.Toggle(arg_112_0, arg_112_1)
	end
end

function leavelobbyblockedplayerwarning()
	local var_113_0 = {
		message_text = Engine.CBBHFCGDIC("XBOXLIVE/LEAVELOBBYBLOCKEDPLAYER"),
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		yes_action = leaveLobbyBlockedPlayerWarningYesAction
	}
	local var_113_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_113_0)

	var_113_1.id = "leavelobbyblockedplayerwarning"

	return var_113_1
end

local function var_0_19(arg_114_0, arg_114_1)
	local var_114_0 = arg_114_1.controllerIndex
	local var_114_1 = {
		title = Engine.CBBHFCGDIC("CODCASTER/CODCASTER_PAUSED_GAME_TITLE")
	}

	var_114_1.message = ""
	var_114_1.cancelClosesPopup = false
	var_114_1.buttons = {}
	var_114_1.controllerIndex = arg_114_1.controllerIndex

	local var_114_2 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_114_1)

	var_114_2.id = "ClientGamePausedByCodcasterPopup"

	return var_114_2
end

function EnableCCPAWarning(arg_115_0, arg_115_1)
	assert(arg_115_1.controllerIndex)
	assert(arg_115_1.yesAction)

	local var_115_0 = {}

	var_115_0.message = ""

	if arg_115_1 and arg_115_1.message then
		var_115_0.message = arg_115_1.message
	else
		Engine.CBBHFCGDIC("MENU/CCPA_DESC")
	end

	var_115_0.title = Engine.CBBHFCGDIC("MENU/CCPA_NAME")

	local var_115_1 = -275
	local var_115_2 = 275

	var_115_0.buttons = {
		{
			label = Engine.CBBHFCGDIC("MENU/DO_NOT_SELL_MY_DATA"),
			action = arg_115_1.yesAction,
			left = var_115_1,
			right = var_115_2
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = arg_115_1.noAction,
			left = var_115_1,
			right = var_115_2
		}
	}
	var_115_0.defaultFocusIndex = 2

	if IsLanguageArabic() then
		var_115_0.useMessageContainer = true
		var_115_0.messageContainerHeight = 220
	elseif IsLanguageRussian() then
		var_115_0.useMessageContainer = true
		var_115_0.messageContainerHeight = 120
	end

	local var_115_3 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_115_0)

	var_115_3.id = "EnableCCPAWarning"

	return var_115_3
end

function ProductNoLongerAvailableErrorPopup()
	local var_116_0 = {
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = Engine.CBBHFCGDIC("LUA_MENU/PRODUCT_NOT_AVAILABLE")
	}
	local var_116_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_116_0)

	var_116_1.id = "ProductNoLongerAvailableErrorPopup"

	return var_116_1
end

function BlockPlayerAndRemoveFromFriendsPopup(arg_117_0, arg_117_1)
	local var_117_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER"),
		message = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_BNET_FRIEND"),
		yesLabel = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER"),
		noLabel = Engine.CBBHFCGDIC("MENU/CANCEL")
	}

	var_117_0.defaultFocusIndex = 2
	var_117_0.controllerIndex = arg_117_1.controllerIndex
	var_117_0.cancelClosesPopup = false

	function var_117_0.cancelAction()
		return
	end

	var_117_0.noBackButton = true
	var_117_0.yesAction = arg_117_1.yesAction

	local var_117_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_117_0)

	var_117_1.id = "BlockPlayerAndRemoveFromFriendsPopup"

	return var_117_1
end

function RestrictionsChangedPopup(arg_119_0, arg_119_1)
	local var_119_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/RESTRICTIONS_CHANGED_BACK_MENU"),
		button_text = Engine.CBBHFCGDIC("MENU/OK")
	}
	local var_119_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_119_0)

	var_119_1.id = "RestrictionsChangedPopup"

	return var_119_1
end

function ModifyBattlenetInstallPopup(arg_120_0, arg_120_1)
	assert(arg_120_1)
	assert(arg_120_1.controllerIndex)

	local var_120_0 = {
		title = Engine.CBBHFCGDIC("MENU/CONFIRMATION_POPUP_TITLE"),
		message = arg_120_1.message and arg_120_1.message or Engine.CBBHFCGDIC("LUA_MENU/BATTLENET_MODIFY_INSTALL"),
		yesLabel = Engine.CBBHFCGDIC("LUA_MENU/BATTLENET_GOTO"),
		noLabel = Engine.CBBHFCGDIC("MENU/CANCEL"),
		yesAction = function(arg_121_0)
			Engine.BHDGBCBHJD()
			Engine.DJEDDFJEIG()
		end
	}
	local var_120_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_120_0)

	var_120_1.id = "ModifyBattlenetInstallPopup"

	return var_120_1
end

MenuBuilder.registerType("CancelShaderUploadConfirmationPopup", CancelShaderUploadConfirmationPopup)
MenuBuilder.registerType("FenceDialogPopup", FenceDialogPopup)
MenuBuilder.registerType("FenceDialogPopupWithProgress", FenceDialogPopupWithProgress)
MenuBuilder.registerType("RegimentsFenceDialogPopup", RegimentsFenceDialogPopup)
MenuBuilder.registerType("FenceOnlineQueueDialogPopupWithDescription", FenceOnlineQueueDialogPopupWithDescription)
MenuBuilder.registerType("FenceSigninQueueDialogPopup", FenceSigninQueueDialogPopup)
MenuBuilder.registerType("live_dialog_text_box_with_cancel", live_dialog_text_box_with_cancel)
MenuBuilder.registerType("live_dialog_text_box", live_dialog_text_box)
MenuBuilder.registerType("AcceptingInvite", AcceptingInvite)
MenuBuilder.registerType("AcceptingInviteWithoutCancel", AcceptingInviteWithoutCancel)
MenuBuilder.registerType("ReadingSaveDevice", ReadingSaveDevice)
MenuBuilder.registerType("savedata_failed_popmenu", savedata_failed_popmenu)
MenuBuilder.registerType("error_popmenu", error_popmenu)
MenuBuilder.registerType("quit_popmenu", quit_popmenu)
MenuBuilder.registerType("restart_popmenu", restart_popmenu)
MenuBuilder.registerType("coppa_restart_popmenu", coppa_restart_popmenu)
MenuBuilder.registerType("restart_upsell_popmenu", restart_upsell_popmenu)
MenuBuilder.registerType("reboot_popup", reboot_popup)
MenuBuilder.registerType("campaign_mode_savedata_error_popup", campaign_mode_savedata_error_popup)
MenuBuilder.registerType("menu_online_ended", menu_online_ended)
MenuBuilder.registerType("user_changed_confirm_mp", user_changed_confirm_mp)
MenuBuilder.registerType("controller_changed_confirm_mp", controller_changed_confirm_mp)
MenuBuilder.registerType("PopupFenceGameModeError", PopupFenceGameModeError)
MenuBuilder.registerType("ControllerRemovedPopup", ControllerRemovedPopup)
MenuBuilder.registerType("controllerremoved_inputswap_popup", controllerremoved_inputswap_popup)
MenuBuilder.registerType("keyboardremoved_inputswap_popup", keyboardremoved_inputswap_popup)
MenuBuilder.registerType("WaitingForTransientsPopMenu", WaitingForTransientsPopMenu)
MenuBuilder.registerType("generic_error_popup", generic_error_popup)
MenuBuilder.registerType("spinner_inprogress_popup", spinner_inprogress_popup)
MenuBuilder.registerType("spinner_confirmation_popup", spinner_confirmation_popup)
MenuBuilder.registerType("store_inprogress_popup", store_inprogress_popup)
MenuBuilder.registerType("tournament_inprogress_popup", tournament_inprogress_popup)
MenuBuilder.registerType("ReportPlayer", ReportPlayer)
MenuBuilder.registerType("LeaveCommonMPMainMenuPopup", LeaveCommonMPMainMenuPopup)
MenuBuilder.registerType("RateLimitedLeaveCommonMPMainMenuPopup", RateLimitedLeaveCommonMPMainMenuPopup)
MenuBuilder.registerType("DisbandPartyEnterGameBattlesLobbyPopup", DisbandPartyEnterGameBattlesLobbyPopup)
MenuBuilder.registerType("ShowUpsellDialogPopup", ShowUpsellDialogPopup)
MenuBuilder.registerType("ShowPreorderBetaAccessDialogPopup", ShowPreorderBetaAccessDialogPopup)
MenuBuilder.registerType("RateLimitedPopupYesNo", RateLimitedPopupYesNo)
MenuBuilder.registerType("ShowUpsellXboxStore", ShowUpsellXboxStore)
MenuBuilder.registerType("ShowCWUpsellXboxStore", ShowCWUpsellXboxStore)
MenuBuilder.registerType("FilterPopup", var_0_9)
MenuBuilder.registerType("LeavePrivatePartyConfirmPopup", LeavePrivatePartyConfirmPopup)
MenuBuilder.registerType("LeaveLookForPartySearchQueue", LeaveLookForPartySearchQueue)
MenuBuilder.registerType("EULADeclinePopup", var_0_10)
MenuBuilder.registerType("LPCEnableCrossplayPopup", var_0_11)
MenuBuilder.registerType("ActivateMissionPopup", var_0_12)
MenuBuilder.registerType("DeactivateMissionPopup", var_0_13)
MenuBuilder.registerType("MissionActivationSpinner", var_0_14)
MenuBuilder.registerType("OperationDetailsPopup", var_0_16)
MenuBuilder.registerType("AntiAddictionTipsPopup", var_0_15)
MenuBuilder.registerType("ModeFencePopup", var_0_17)
MenuBuilder.registerType("ModularWarningPopup", var_0_18)
MenuBuilder.registerType("leavelobbyblockedplayerwarning", leavelobbyblockedplayerwarning)
MenuBuilder.registerType("ClientGamePausedByCodcasterPopup", var_0_19)
MenuBuilder.registerType("EnableCCPAWarning", EnableCCPAWarning)
MenuBuilder.registerType("ProductNoLongerAvailableErrorPopup", ProductNoLongerAvailableErrorPopup)
MenuBuilder.registerType("BlockPlayerAndRemoveFromFriendsPopup", BlockPlayerAndRemoveFromFriendsPopup)
MenuBuilder.registerType("RestrictionsChangedPopup", RestrictionsChangedPopup)
MenuBuilder.registerType("CrosslaunchingJoiningSession", CrosslaunchingJoiningSession)
MenuBuilder.registerType("CrosslaunchingWaitingForPartyMembers", CrosslaunchingWaitingForPartyMembers)
MenuBuilder.registerType("host_crosslaunching", host_crosslaunching)
MenuBuilder.registerType("ModifyBattlenetInstallPopup", ModifyBattlenetInstallPopup)
LockTable(_M)
