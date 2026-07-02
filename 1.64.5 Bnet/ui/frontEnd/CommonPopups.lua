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

local function var_0_2(arg_10_0, arg_10_1)
	Engine.BFFHIDFJFG(arg_10_1.controller)
end

local function var_0_3(arg_11_0, arg_11_1)
	Engine.DFBAEGIJIE(arg_11_1.controller)
end

function savedata_failed_popmenu()
	local var_12_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/SAVEDATA_FAILED_TITLE"),
		message_text = Engine.CBBHFCGDIC("MENU/SAVEDATA_FAILED_MESSAGE"),
		yes_action = var_0_2,
		no_action = var_0_3
	}
	local var_12_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_12_0)

	var_12_1.id = "savedata_failed_popmenu"

	return var_12_1
end

function CancelAcceptingInvite(arg_13_0, arg_13_1)
	DebugPrint("CancelAcceptingInvite triggered")
	Engine.EBIDFIDHIE("xcancelinvitejoin", arg_13_1)
	LUI.FlowManager.RequestLeaveMenu(arg_13_0)
end

function AcceptingInvite(arg_14_0, arg_14_1)
	local var_14_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_ACCEPTINVITE"),
		controllerIndex = arg_14_1.controllerIndex,
		onCancel = CancelAcceptingInvite
	}
	local var_14_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_14_0)

	var_14_1.id = "AcceptingInvite"

	return var_14_1
end

function AcceptingInviteWithoutCancel(arg_15_0, arg_15_1)
	local var_15_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_ACCEPTINVITE"),
		controllerIndex = arg_15_1.controllerIndex,
		onCancel = CancelAcceptingInvite
	}
	local var_15_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_15_0)

	var_15_1.id = "AcceptingInviteWithoutCancel"

	return var_15_1
end

function CrosslaunchingJoiningSession(arg_16_0, arg_16_1)
	local var_16_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_ACCEPTINVITE"),
		controllerIndex = arg_16_1.controllerIndex,
		onCancel = CancelAcceptingInvite,
		displayWZWipSetup = arg_16_1.displayWZWipSetup
	}
	local var_16_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_16_0)

	var_16_1.id = "CrosslaunchingJoiningSession"

	return var_16_1
end

local function var_0_4()
	return Engine.DDICCGJBEA()
end

function CrosslaunchingWaitingForPartyMembers(arg_18_0, arg_18_1)
	local var_18_0 = {
		message = Engine.CBBHFCGDIC("MENU/WAITING_FOR_PARTY_MEMBERS_TO_JOIN", var_0_4()),
		controllerIndex = arg_18_1.controllerIndex,
		onCancel = CancelAcceptingInvite,
		timerData = {
			frequency = 500,
			getNumPartyMembersWaitingToJoinThroughCrosslaunchCallback = var_0_4
		},
		displayWZWipSetup = arg_18_1.displayWZWipSetup
	}
	local var_18_1 = MenuBuilder.BuildRegisteredType("WaitingForPartyMembersForCrosslaunchPopup", var_18_0)

	var_18_1.id = "CrosslaunchingWaitingForPartyMembers"

	return var_18_1
end

function HostCrossLaunchTimeRemaining(arg_19_0)
	return arg_19_0.endTime - Engine.DEIDGHDBHD()
end

HOST_CROSS_LAUNCH_TIME_IN_SECONDS = 5

function host_crosslaunching(arg_20_0, arg_20_1)
	arg_20_1.title = Engine.CBBHFCGDIC("MENU/NOTICE")
	arg_20_1.message = CrossLaunchUtils.GetCountdownPopupMessage(arg_20_1.game, false)
	arg_20_1.gameId = arg_20_1.game
	arg_20_1.onCancel = CrossLaunchUtils.PartyCrosslaunchDecline
	arg_20_1.shouldAlwaysBeCancellable = true
	arg_20_1.timerData = {
		frequency = 500,
		getTimeRemainingCallback = HostCrossLaunchTimeRemaining,
		onCountdownCompleteCallback = CrossLaunchUtils.HostCrossLaunchOnComplete,
		time = HOST_CROSS_LAUNCH_TIME_IN_SECONDS
	}

	local var_20_0 = MenuBuilder.BuildRegisteredType("CrosslaunchingCoutdownPopup", arg_20_1)

	var_20_0.id = "host_crosslaunching"
	var_20_0.XUID = arg_20_1.XUID
	var_20_0.isPresenceJoin = arg_20_1.isPresenceJoin

	return var_20_0
end

function UpdateTextDots(arg_21_0, arg_21_1)
	assert(arg_21_0.properties.numDots)
	assert(arg_21_0.properties.message)

	local var_21_0 = arg_21_0.properties.numDots
	local var_21_1 = arg_21_0.properties.message
	local var_21_2 = (var_21_0 + 1) % 4

	for iter_21_0 = 1, var_21_2 do
		var_21_1 = var_21_1 .. ". "
	end

	arg_21_0:setText(var_21_1)

	arg_21_0.properties.numDots = var_21_2
end

function CancelShaderUploadConfirmationPopup(arg_22_0, arg_22_1)
	return MenuBuilder.BuildRegisteredType("CancelShadersPopup", arg_22_1)
end

function FenceDialogPopup(arg_23_0, arg_23_1)
	assert(arg_23_1.controllerIndex)
	assert(arg_23_1.message)

	return MenuBuilder.BuildRegisteredType("FenceDialog", arg_23_1)
end

function FenceDialogPopupWithProgress(arg_24_0, arg_24_1)
	arg_24_1 = arg_24_1 or {}
	arg_24_1.useProgress = true

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_24_1)
end

function RegimentsFenceDialogPopup(arg_25_0, arg_25_1)
	assert(arg_25_1)
	assert(arg_25_1.controllerIndex)
	assert(arg_25_1.message)

	arg_25_1.disableIntro = true

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_25_1)
end

function FenceSigninQueueDialogPopup(arg_26_0, arg_26_1)
	arg_26_1 = arg_26_1 or {}

	local var_26_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_26_1)

	if not arg_26_1.controllerIndex then
		local var_26_1 = Engine.IJEBHJIJF()
	end

	var_26_0.Description:setText(arg_26_1.description)
	var_26_0.WaitTime:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", 0, 0, 0))
	var_26_0.WaitPosition:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CURRENT_POSITION", 0))
	var_26_0.WaitPosition:SetAlpha(1)
	WZWIP.AnimateThemeElement(var_26_0, "SetQueueDisplay")

	local var_26_2

	local function var_26_3()
		local var_27_0 = Engine.CJCEEHHIJE()
		local var_27_1 = math.floor(var_27_0 / 3600)
		local var_27_2 = var_27_0 - var_27_1 * 3600
		local var_27_3 = math.floor(var_27_2 / 60)
		local var_27_4 = var_27_2 - var_27_3 * 60
		local var_27_5 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", var_27_1, var_27_3, var_27_4)

		var_26_0.WaitTime:setText(var_27_5)

		var_26_0.WaitTime:Wait(1000).onComplete = var_26_3
	end

	var_26_3()

	local var_26_4

	local function var_26_5()
		local var_28_0 = Engine.BFBHHIHIJD()
		local var_28_1 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CURRENT_POSITION", var_28_0)

		var_26_0.WaitPosition:setText(var_28_1)

		var_26_0.WaitPosition:Wait(1000).onComplete = var_26_5
	end

	var_26_5()

	return var_26_0
end

function FenceOnlineQueueDialogPopupWithDescription(arg_29_0, arg_29_1)
	arg_29_1 = arg_29_1 or {}

	local var_29_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_29_1)
	local var_29_1 = arg_29_1.controllerIndex or Engine.IJEBHJIJF()

	var_29_0.Description:setText(arg_29_1.description)
	var_29_0.WaitTime:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", 0, 0, 0))
	WZWIP.AnimateThemeElement(var_29_0, "SetQueueDisplay")

	local var_29_2

	local function var_29_3()
		local var_30_0 = Engine.BAFIABHBHG(var_29_1)

		DebugPrint(" wait time: " .. var_30_0)

		local var_30_1 = math.floor(var_30_0 / 3600)
		local var_30_2 = var_30_0 - var_30_1 * 3600
		local var_30_3 = math.floor(var_30_2 / 60)
		local var_30_4 = var_30_2 - var_30_3 * 60
		local var_30_5 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", var_30_1, var_30_3, var_30_4)

		var_29_0.WaitPosition:setText(var_30_5)

		var_29_0.WaitTime:Wait(1000).onComplete = var_29_3
	end

	var_29_3()

	return var_29_0
end

function live_dialog_text_box_with_cancel(arg_31_0, arg_31_1)
	arg_31_1 = arg_31_1 or {}

	local var_31_0 = {
		message = arg_31_1.message or "",
		controllerIndex = arg_31_1.controllerIndex or Engine.IJEBHJIJF(),
		onCancel = arg_31_1.cancel_func,
		disableIntro = arg_31_1.disableIntro,
		showExit = arg_31_1.showExit,
		displayWZWipSetup = arg_31_1.displayWZWipSetup
	}

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_31_0)
end

function live_dialog_text_box(arg_32_0, arg_32_1)
	arg_32_1 = arg_32_1 or {}

	local var_32_0 = {
		message = arg_32_1.message or "",
		controllerIndex = arg_32_1.controllerIndex or Engine.IJEBHJIJF(),
		disableIntro = arg_32_1.disableIntro,
		displayWZWipSetup = arg_32_1.displayWZWipSetup
	}

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_32_0)
end

function menu_online_ended()
	local var_33_0 = {
		title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
		message = Dvar.DHEEJCCJBH("online_end_reason")
	}
	local var_33_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_33_0)

	var_33_1.id = "menu_online_ended"

	return var_33_1
end

local function var_0_5(arg_34_0, arg_34_1)
	Engine.EBIDFIDHIE("disconnect")
end

function campaign_mode_savedata_error_popup(arg_35_0, arg_35_1)
	local var_35_0 = {
		title = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_TITLE"),
		message = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_CAMPAIGN"),
		controllerIndex = arg_35_1.controllerIndex,
		action = function(arg_36_0)
			HUDUtils.CorruptSaveDataRepairForSP(arg_35_1.controllerIndex)
			Engine.DIDFHBFDFG(PauseReason.SAVE_DATA_ERROR)
		end
	}
	local var_35_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_35_0)

	var_35_1.id = "campaign_mode_savedata_error_popup"

	return var_35_1
end

local function var_0_6(arg_37_0)
	return Engine.JCBDICCAH(string.format("%02d", arg_37_0))
end

local function var_0_7(arg_38_0, arg_38_1)
	Engine.CIGGHDDHGJ(arg_38_1.controller, not Engine.BECCFCBIAA("gpadEnabled", arg_38_1.controller))
	Engine.DAGFFDGFII("updategamerprofile " .. arg_38_1.controller)
	Engine.DBFFAEEFGJ():TryAddMouseCursor()
end

local function var_0_8(arg_39_0, arg_39_1)
	if not Engine.DDJFBBJAIG() then
		if LUI.FlowManager.IsInStack("popup_leave_game") then
			LUI.FlowManager.RequestLeaveMenuByName("popup_leave_game", true, true)
		end

		LUI.FlowManager.RequestPopupMenu(nil, "popup_leave_game", true, arg_39_1.controller, true)
	elseif Lobby.BBDICGHE() then
		if IsPrivateMatch() then
			LUI.FlowManager.RequestPopupMenu(nil, "leave_private_mp_lobby", true, arg_39_1.controller, true)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "leave_public_mp_lobby", true, arg_39_1.controller, true)
		end
	elseif CONDITIONS.IsInGameBattlesMatch() then
		arg_39_0:dispatchEventToRoot({
			name = "gamebattles_input_leave_lobby",
			controller = arg_39_1.controller
		})
	end
end

if Engine.HDGDBCJFG() then
	function ControllerRemovedPopup(arg_40_0, arg_40_1)
		local var_40_0 = {
			message = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED"),
			controllerIndex = arg_40_1.controllerIndex
		}

		var_40_0.isGeneric = true

		return (MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_40_0))
	end
else
	function ControllerRemovedPopup()
		local var_41_0 = {
			popup_title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
			message_text = Engine.CBBHFCGDIC("@PLATFORM/CONTROLLER_DISCONNECTED"),
			button_text = Engine.CBBHFCGDIC("@MENU/SWITCH_TO_MOUSE"),
			confirmation_action = var_0_7
		}

		return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_41_0))
	end
end

function WaitingForTransientsPopMenu()
	local var_42_0 = {
		message = Engine.CBBHFCGDIC("@MENU_SP/LOADING_TRANSIENTS")
	}

	var_42_0.controllerIndex = 0

	local var_42_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_42_0)
	local var_42_2 = LUI.UIElement.new()

	var_42_2:SetBlurStrength(2)
	var_42_2:setupWorldBlur()

	var_42_2.id = "blur"

	var_42_1:addElement(var_42_2)

	local var_42_3 = LUI.UIBindButton.new()

	var_42_3:registerEventHandler("button_start", LUI.HUD.OpenPauseMenu)
	var_42_1:addElement(var_42_3)

	return var_42_1
end

function ConfirmProfileChange(arg_43_0, arg_43_1)
	DebugPrint("Confirm profile change")
	Engine.EBIDFIDHIE("confirmProfileChange", arg_43_1.controller)
	LUI.FlowManager.RequestLeaveMenu(arg_43_0)
end

function IgnoreProfileChange(arg_44_0, arg_44_1)
	DebugPrint("Ignore profile change")
	Engine.DGFBJCEDCG(arg_44_1.controller)
	LUI.FlowManager.RequestLeaveMenu(arg_44_0)
end

function user_changed_confirm_mp()
	local var_45_0 = {
		message_text = Engine.CBBHFCGDIC("PLATFORM/PROFILE_PAIRING_CONFIRM"),
		popup_title = Engine.CBBHFCGDIC("MENU/WARNING"),
		yes_text = Engine.CBBHFCGDIC("MENU/YES"),
		no_text = Engine.CBBHFCGDIC("MENU/NO"),
		yes_action = IgnoreProfileChange,
		no_action = ConfirmProfileChange
	}

	var_45_0.defaultFocusIndex = 1

	local var_45_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_45_0)

	var_45_1.id = "user_changed_confirm_mp"

	return var_45_1
end

function controller_changed_confirm_mp()
	local var_46_0 = {
		message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_PAIRING_CONFIRM"),
		popup_title = Engine.CBBHFCGDIC("MENU/WARNING")
	}
	local var_46_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_46_0)

	var_46_1.id = "controller_changed_confirm_mp"

	return var_46_1
end

function PopupFenceGameModeError(arg_47_0, arg_47_1)
	assert(arg_47_1 and (arg_47_1.errorCode or arg_47_1.missingDLCMessage))

	local var_47_0 = arg_47_1.errorCode
	local var_47_1 = ""
	local var_47_2 = arg_47_1.missingDLCMessage or ""

	if #var_47_2 > 0 then
		var_47_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
	elseif var_47_0 == CoD.FenceErrorCodes.Ownership then
		var_47_1 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_NEEDED")
		var_47_2 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_NEEDED_MESSAGE")
	elseif var_47_0 == CoD.FenceErrorCodes.Installation then
		var_47_1 = Engine.CBBHFCGDIC("LUA_MENU/INSTALLATION_NEEDED")
		var_47_2 = Engine.CBBHFCGDIC("LUA_MENU/INSTALLATION_NEEDED_MESSAGE")
	end

	local var_47_3 = {
		popup_title = var_47_1,
		message_text = var_47_2
	}
	local var_47_4 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_47_3)

	var_47_4.id = "popup_getting_data_error"

	return var_47_4
end

function controllerremoved_inputswap_popup(arg_48_0, arg_48_1)
	local var_48_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE")
	}

	if OPTIONS.IsInputSwapEnabled() then
		var_48_0.message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED_INGAME")
		var_48_0.button_text = Engine.CBBHFCGDIC("MENU/SWITCH_TO_MOUSE")
		var_48_0.confirmation_action = var_0_7
	else
		var_48_0.message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED_INGAME_NOSWAP")
		var_48_0.button_text = CONDITIONS.IsInGameBattlesMatch() and Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEAVE_MATCH") or Engine.CBBHFCGDIC("MENU/TO_THE_MAIN_MENU")
		var_48_0.confirmation_action = var_0_8
	end

	local var_48_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_48_0)

	var_48_1.id = "controllerremoved_inputswap_popup"

	return var_48_1
end

function keyboardremoved_inputswap_popup(arg_49_0, arg_49_1)
	local var_49_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE")
	}

	if OPTIONS.IsInputSwapEnabled() then
		var_49_0.message_text = Engine.CBBHFCGDIC("PLATFORM/KBM_DISCONNECTED_INGAME")
		var_49_0.button_text = Engine.CBBHFCGDIC("PLATFORM/SWITCH_TO_CONTROLLER")
		var_49_0.confirmation_action = var_0_7
	else
		var_49_0.message_text = Engine.CBBHFCGDIC("PLATFORM/KBM_DISCONNECTED_INGAME_NOSWAP")
		var_49_0.button_text = CONDITIONS.IsInGameBattlesMatch() and Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEAVE_MATCH") or Engine.CBBHFCGDIC("MENU/TO_THE_MAIN_MENU")
		var_49_0.confirmation_action = var_0_8
	end

	local var_49_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_49_0)

	var_49_1.id = "keyboardremoved_inputswap_popup"

	return var_49_1
end

function generic_error_popup(arg_50_0, arg_50_1)
	local var_50_0 = {
		popup_title = arg_50_1.title or Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = arg_50_1.message
	}
	local var_50_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_50_0)

	var_50_1.id = "generic_error_popup"

	return var_50_1
end

function spinner_inprogress_popup(arg_51_0, arg_51_1)
	local var_51_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_51_1.message,
		cancel_func = arg_51_1.onCancel
	}
	local var_51_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_51_0)

	var_51_1.id = "spinner_inprogress_popup"

	return var_51_1
end

function spinner_confirmation_popup(arg_52_0, arg_52_1)
	local var_52_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = arg_52_1.message .. " " .. Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_SUCCESSFUL")
	}
	local var_52_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_52_0)

	var_52_1.id = "spinner_confirmation_popup"

	return var_52_1
end

function store_inprogress_popup(arg_53_0, arg_53_1)
	local var_53_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_53_1.message,
		cancel_func = arg_53_1.onCancel,
		displayWZWipSetup = arg_53_1.displayWZWipSetup
	}
	local var_53_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_53_0)

	var_53_1.id = "store_inprogress_popup"

	return var_53_1
end

function tournament_inprogress_popup(arg_54_0, arg_54_1)
	local var_54_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_54_1.message,
		cancel_func = arg_54_1.onCancel
	}
	local var_54_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_54_0)

	var_54_1.id = "tournament_inprogress_popup"

	return var_54_1
end

function ReportPlayer(arg_55_0, arg_55_1)
	assert(arg_55_1.xuid)

	local var_55_0 = {
		title = Engine.CBBHFCGDIC("MENU/REPORT_PLAYER")
	}

	var_55_0.message = ""
	var_55_0.buttons = {}

	local var_55_1 = {
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

	for iter_55_0, iter_55_1 in ipairs(var_55_1) do
		table.insert(var_55_0.buttons, {
			label = Engine.CBBHFCGDIC(iter_55_1.text),
			action = function(arg_56_0, arg_56_1)
				Lobby.BIHAGFBBAG(arg_56_1, arg_55_1.xuid, iter_55_1.offense)
				LUI.FlowManager.RequestPopupMenu(arg_56_0, "PopupOK", true, arg_56_1, false, {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = Engine.CBBHFCGDIC(iter_55_1.confirmationString)
				})
			end
		})
	end

	local var_55_2 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_55_0)

	var_55_2.id = "ReportPlayer"

	return var_55_2
end

function LeaveCommonMPMainMenuPopup(arg_57_0, arg_57_1)
	assert(arg_57_1.menu)

	local var_57_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_58_0, arg_58_1)
			Lobby.LeaveCommonMPMainMenu(arg_57_1.menu, arg_58_1)
		end,
		noAction = function()
			return
		end
	}
	local var_57_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_57_0)

	var_57_1.id = "LeaveMissionLobby"

	return var_57_1
end

function LeavePrivatePartyConfirmPopup(arg_60_0, arg_60_1)
	assert(arg_60_1.menu)

	local var_60_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_61_0, arg_61_1)
			Lobby.LeavePrivateParty(arg_60_1.menu, arg_61_1, arg_60_1.moveUI)
		end,
		noAction = function()
			return
		end
	}
	local var_60_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_60_0)

	var_60_1.id = "LeavePrivatePartyConfirmPopup"

	return var_60_1
end

function LeaveLookForPartySearchQueue(arg_63_0, arg_63_1)
	assert(arg_63_1.menu)

	local var_63_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/STOPSEARCHING"),
		yesAction = function(arg_64_0, arg_64_1)
			Lobby.CheckAndGeneratePlayerLFPSession(arg_64_1, Lobby.LFPEvents.STOPPED)
			Engine.EBIDFIDHIE(Lobby.LOOK_FOR_PARTY_STOP_SEARCHING_STRING)
			LUI.FlowManager.RequestLeaveMenu(popElement)
		end,
		noAction = function()
			return
		end
	}
	local var_63_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_63_0)

	var_63_1.id = "LeaveLookForPartySearchQueue"

	return var_63_1
end

function RateLimitedLeaveCommonMPMainMenuPopup(arg_66_0, arg_66_1)
	assert(arg_66_1.menu)

	local var_66_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_67_0, arg_67_1)
			Lobby.LeaveCommonMPMainMenu(arg_66_1.menu, arg_67_1)
		end,
		noAction = function()
			return
		end,
		rateLimited = arg_66_1.rateLimited,
		rateLimitIntervalMS = arg_66_1.rateLimitIntervalMS,
		rateLimitAttempts = arg_66_1.rateLimitAttempts
	}
	local var_66_1 = MenuBuilder.BuildRegisteredType("RateLimitedPopupYesNo", var_66_0)

	var_66_1.id = "LeaveMissionLobby"

	return var_66_1
end

function ShowUpsellDialogPopup(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_1.controllerIndex

	assert(var_69_0)
	Dvar.DHEGHJJJHI("showUpsellDialog", false)
	Engine.IBCDJDCJC()

	local var_69_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/TRIAL_EXPIRED"),
		message = Engine.CBBHFCGDIC("LUA_MENU/TRIAL_EXPIRED_MSG")
	}

	var_69_1.buttonsClosePopup = true
	var_69_1.cancelClosesPopup = true
	var_69_1.buttons = {}

	local var_69_2 = {
		label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW")),
		action = function(arg_70_0, arg_70_1)
			if CONDITIONS.IsPS4() then
				Commerce.DAGIHHFJIJ(arg_70_1)
			elseif CONDITIONS.IsXboxOne() then
				LUI.FlowManager.RequestPopupMenu(nil, "ShowUpsellXboxStore", false, nil, false, {}, nil, false, true)
			end
		end
	}

	table.insert(var_69_1.buttons, var_69_2)

	local var_69_3 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_71_0, arg_71_1)
			return
		end
	}

	table.insert(var_69_1.buttons, var_69_3)

	local var_69_4 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_69_1)

	var_69_4.id = "ShowUpsellDialogPopup"

	return var_69_4
end

function ShowPreorderBetaAccessDialogPopup(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_1.controllerIndex

	assert(var_72_0)

	local var_72_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/BETA_GO_TO_STORE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/BETA_GO_TO_STORE_DESC")
	}

	var_72_1.buttonsClosePopup = true
	var_72_1.cancelClosesPopup = true
	var_72_1.buttons = {}

	local var_72_2 = {
		label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GO_TO_STORE")),
		action = function(arg_73_0, arg_73_1)
			Lobby.AttemptOpenBRMenu(arg_73_1, {
				useStandaloneStore = true,
				activeTabIndex = TAB.GetIndex(TAB.MP.STORE)
			})
		end
	}

	table.insert(var_72_1.buttons, var_72_2)

	local var_72_3 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_74_0, arg_74_1)
			return
		end
	}

	table.insert(var_72_1.buttons, var_72_3)

	local var_72_4 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_72_1)

	var_72_4.id = "ShowPreorderBetaAccessDialogPopup"

	return var_72_4
end

function DisbandPartyEnterGameBattlesLobbyPopup(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_1.controllerIndex

	assert(var_75_0)

	local var_75_1 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/DISBAND_PARTY"),
		yesAction = function(arg_76_0, arg_76_1)
			Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_76_1)
			Lobby.OpenGameBattlesLobby(arg_76_1)
		end
	}
	local var_75_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_75_1)

	var_75_2.id = "DisbandPartyEnterGameBattlesLobbyPopup"

	return var_75_2
end

function RateLimitedPopupYesNo(arg_77_0, arg_77_1)
	arg_77_1.rateLimited = true
	arg_77_1.rateLimitIntervalMS = arg_77_1.rateLimitIntervalMS or 5000
	arg_77_1.rateLimitAttempts = arg_77_1.rateLimitAttempts or 3

	return (MenuBuilder.BuildRegisteredType("PopupYesNo", arg_77_1))
end

function ShowUpsellXboxStore(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_1.controllerIndex

	assert(var_78_0)

	local var_78_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS")
	}

	var_78_1.message = ""
	var_78_1.buttonsClosePopup = true
	var_78_1.cancelClosesPopup = true
	var_78_1.buttons = {}

	local var_78_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_DELUXE"),
		action = function(arg_79_0, arg_79_1)
			Commerce.DAGIHHFJIJ(arg_79_1, "c5da3bf3-3459-4202-a7eb-6eb8f41fabe5")
		end
	}

	table.insert(var_78_1.buttons, var_78_2)

	local var_78_3 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_LEGACY"),
		action = function(arg_80_0, arg_80_1)
			Commerce.DAGIHHFJIJ(arg_80_1, "559cf838-c5c4-498a-a5e3-351fa4b37d7c")
		end
	}

	table.insert(var_78_1.buttons, var_78_3)

	local var_78_4 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_BASE"),
		action = function(arg_81_0, arg_81_1)
			Commerce.DAGIHHFJIJ(arg_81_1, "b34bce6e-11b7-45ae-bb93-aad737c1b457")
		end
	}

	table.insert(var_78_1.buttons, var_78_4)

	local var_78_5 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_82_0, arg_82_1)
			return
		end
	}

	table.insert(var_78_1.buttons, var_78_5)

	local var_78_6 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_78_1)

	var_78_6.id = "ShowUpsellXboxStore"

	return var_78_6
end

function ShowCWUpsellXboxStore(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_1.controllerIndex

	assert(var_83_0)

	local var_83_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS")
	}

	var_83_1.message = ""
	var_83_1.buttonsClosePopup = true
	var_83_1.cancelClosesPopup = true
	var_83_1.buttons = {}

	local var_83_2 = {
		label = Engine.CBBHFCGDIC("MENU/BUNDLE_NAME_BOCW_STANDARD"),
		action = function(arg_84_0, arg_84_1)
			Commerce.DAGIHHFJIJ(arg_84_1, "44324e39-514d-3042-c04e-395243342d00")
		end
	}

	table.insert(var_83_1.buttons, var_83_2)

	local var_83_3 = {
		label = Engine.CBBHFCGDIC("MENU/BUNDLE_NAME_BOCW_ULTIMATE"),
		action = function(arg_85_0, arg_85_1)
			Commerce.DAGIHHFJIJ(arg_85_1, "36334e39-4d4d-3051-c04d-58544c587800")
		end
	}

	table.insert(var_83_1.buttons, var_83_3)

	local var_83_4 = {
		label = Engine.CBBHFCGDIC("MENU/BUNDLE_NAME_BOCW_NEXT_GEN_STANDARD"),
		action = function(arg_86_0, arg_86_1)
			Commerce.DAGIHHFJIJ(arg_86_1, "36384e39-5733-304c-c053-485a47565d00")
		end
	}

	table.insert(var_83_1.buttons, var_83_4)

	local var_83_5 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_87_0, arg_87_1)
			return
		end
	}

	table.insert(var_83_1.buttons, var_83_5)

	local var_83_6 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_83_1)

	var_83_6.id = "ShowCWUpsellXboxStore"

	return var_83_6
end

local function var_0_9(arg_88_0, arg_88_1)
	local var_88_0 = arg_88_1.controllerIndex

	assert(var_88_0)
	assert(arg_88_1.labels)
	assert(arg_88_1.keys)
	assert(arg_88_1.callback)

	local var_88_1 = {
		title = Engine.CBBHFCGDIC("MENU/FILTER_OPTIONS_CAPS"),
		width = _1080p * 500
	}

	var_88_1.defaultFocusIndex = 1
	var_88_1.cancelClosesPopup = true
	var_88_1.listContent = {}

	local var_88_2
	local var_88_3 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_88_0
	})

	var_88_3.id = "TypeButton"

	var_88_3.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FILTER")), 0)
	var_88_3:SetAnchors(0, 1, 1, 0, 0)
	var_88_3:SetLeft(_1080p * 0, 0)
	var_88_3:SetRight(_1080p * 500, 0)
	var_88_3:SetTop(_1080p * 0, 0)
	var_88_3:SetBottom(_1080p * 35, 0)

	var_88_3.filterType = arg_88_1.keys[var_88_1.defaultFocusIndex]

	LUI.AddUIArrowTextButtonLogic(var_88_3, var_88_0, {
		wrapAround = true,
		defaultValue = 1,
		labels = arg_88_1.labels,
		action = function(arg_89_0)
			var_88_3.filterType = arg_88_1.keys[arg_89_0]
		end
	})
	table.insert(var_88_1.listContent, var_88_3)

	local var_88_4
	local var_88_5 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_88_0
	})

	var_88_5.id = "AcceptButton"

	var_88_5.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT")), 0)
	var_88_5:SetAnchors(0, 1, 1, 0, 0)
	var_88_5:SetLeft(_1080p * 0, 0)
	var_88_5:SetRight(_1080p * 500, 0)
	var_88_5:SetTop(_1080p * 120, 0)
	var_88_5:SetBottom(_1080p * 155, 0)
	var_88_5:addEventHandler("button_action", function(arg_90_0, arg_90_1)
		ACTIONS.LeaveMenu(arg_90_0)
		arg_88_1.callback(var_88_3.filterType)
	end)
	table.insert(var_88_1.listContent, var_88_5)

	local var_88_6
	local var_88_7 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_88_0
	})

	var_88_7.id = "ButtonHelperBar"

	var_88_7:SetAnchors(0, 1, 1, 0, 0)
	var_88_7:SetLeft(_1080p * 0, 0)
	var_88_7:SetRight(_1080p * 500, 0)
	var_88_7:SetTop(_1080p * -50, 0)
	var_88_7:SetBottom(_1080p * 0, 0)
	table.insert(var_88_1.listContent, var_88_7)

	local var_88_8 = MenuBuilder.BuildRegisteredType("PopupList", var_88_1)

	var_88_8.id = "FilterPopup"

	var_88_8:AddButtonHelperTextToElement(var_88_7, {
		clickable = true,
		priority = 1,
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("@MENU/CANCEL")
	})

	return var_88_8
end

local function var_0_10(arg_91_0, arg_91_1)
	arg_91_1.chatOptOut = arg_91_1.chatOptOut or true
	arg_91_1.title = arg_91_1.title or Engine.CBBHFCGDIC("LUA_MENU/EULA_ACCEPT")
	arg_91_1.message = arg_91_1.message or Engine.CBBHFCGDIC("LUA_MENU/EULA_MESSAGE")
	arg_91_1.buttons = arg_91_1.buttons or {
		{
			label = Engine.CBBHFCGDIC("MENU/OK")
		}
	}

	local var_91_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_91_1)

	var_91_0.id = "EULADeclinePopup"

	return var_91_0
end

local function var_0_11(arg_92_0, arg_92_1)
	assert(arg_92_1.controllerIndex)
	assert(arg_92_1.onAccept)

	arg_92_1.title = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_TITLE")

	if arg_92_1.crossplayRecommended then
		arg_92_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_CROSSPLAY_RECOMMENDED_MESSAGE")
	elseif arg_92_1.crossplayRecommendedReminder then
		arg_92_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_CROSSPLAY_RECOMMENDED_REMINDER_MESSAGE")
	else
		arg_92_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_MESSAGE")
	end

	arg_92_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_BUTTON"),
			action = function(arg_93_0, arg_93_1)
				OPTIONS_DATA.optionsDataList.CrossPlay.action(nil, arg_92_1.controllerIndex, OPTIONS.disableButtonOptions.ENABLED)
				arg_92_1.onAccept(arg_92_1.button)
				LUI.FlowManager.RequestLeaveMenu(arg_93_0)
			end
		}
	}

	local var_92_0 = {}

	if arg_92_1.crossplayRecommended then
		var_92_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU_MP/NO"),
			action = function(arg_94_0, arg_94_1)
				LUI.FlowManager.RequestLeaveMenu(arg_94_0)
				arg_92_1.onAccept(arg_92_1.button)
			end
		}
	elseif arg_92_1.crossplayRecommendedReminder then
		var_92_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU_MP/NO"),
			action = function(arg_95_0, arg_95_1)
				LUI.FlowManager.RequestLeaveMenu(arg_95_0)
			end
		}
	else
		var_92_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = function(arg_96_0, arg_96_1)
				LUI.FlowManager.RequestLeaveMenu(arg_96_0)
			end
		}
	end

	table.insert(arg_92_1.buttons, var_92_0)

	local var_92_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_92_1)

	var_92_1.id = "LPCEnableCrossplayPopup"

	return var_92_1
end

local function var_0_12(arg_97_0, arg_97_1)
	assert(arg_97_1.onAccept)
	assert(arg_97_1.onDecline)
	assert(arg_97_1.activeMissionName)
	assert(arg_97_1.newMissionName)

	local function var_97_0(arg_98_0, arg_98_1)
		arg_97_1.onDecline()
		LUI.FlowManager.RequestLeaveMenu(arg_98_0)
	end

	arg_97_1.title = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION")
	arg_97_1.message = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION_WARNING", arg_97_1.newMissionName, arg_97_1.activeMissionName)
	arg_97_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION"),
			action = function(arg_99_0, arg_99_1)
				arg_97_1.onAccept()
				LUI.FlowManager.RequestLeaveMenu(arg_99_0)
			end
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = var_97_0
		}
	}

	if Engine.CJJAFGIFAC(arg_97_1.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_97_1.controllerIndex) then
			arg_97_1.imageOverride = "logo_wz_shadow"
		end
	else
		arg_97_1.imageOverride = "logo_cod_warzone_mw_shadow"
	end

	local var_97_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_97_1)

	var_97_1.id = "ActivateMissionPopup"

	local var_97_2 = LUI.UIBindButton.new()

	var_97_2.id = "bindButton"

	var_97_1:addElement(var_97_2)

	var_97_1.bindButton = var_97_2

	var_97_1.bindButton:addEventHandler("button_secondary", var_97_0)

	return var_97_1
end

local function var_0_13(arg_100_0, arg_100_1)
	assert(arg_100_1.onAccept)
	assert(arg_100_1.onDecline)
	assert(arg_100_1.activeMissionName)

	arg_100_1.title = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION")
	arg_100_1.message = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION_WARNING", arg_100_1.activeMissionName)
	arg_100_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION"),
			action = function(arg_101_0, arg_101_1)
				arg_100_1.onAccept()
				LUI.FlowManager.RequestLeaveMenu(arg_101_0)
			end
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = function(arg_102_0, arg_102_1)
				arg_100_1.onDecline()
				LUI.FlowManager.RequestLeaveMenu(arg_102_0)
			end
		}
	}

	local var_100_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_100_1)

	var_100_0.id = "DeactivateMissionPopup"

	return var_100_0
end

local function var_0_14(arg_103_0, arg_103_1)
	assert(arg_103_1.controllerIndex)
	assert(arg_103_1.message)

	arg_103_1.disableIntro = true

	local var_103_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_103_1)

	var_103_0.id = "MissionActivationSpinner"

	return var_103_0
end

local function var_0_15()
	local var_104_0 = {
		message_text = Engine.CDFHFJGICJ(),
		popup_title = Engine.CBBHFCGDIC("MENU/ANTI_ADDICTION_TIPS_TITLE"),
		button_text = Engine.CBBHFCGDIC("MENU/OK"),
		confirmation_action = Engine.OnAntiAddictionTipsConfirmed
	}
	local var_104_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_104_0)

	var_104_1.id = "AntiAddictionTipsPopup"

	return var_104_1
end

local function var_0_16(arg_105_0, arg_105_1)
	arg_105_1.title = WORLD_MAP.GetOperationName()
	arg_105_1.tabWidgets = {
		"OperationRewards",
		"OperationBriefing"
	}
	arg_105_1.tabNames = {
		"LUA_MENU/REWARD_PLURAL",
		"LUA_MENU/BRIEFING"
	}

	return MenuBuilder.BuildRegisteredType("FullModalTabPopup", arg_105_1)
end

local function var_0_17(arg_106_0, arg_106_1)
	assert(arg_106_1)

	local var_106_0 = {
		disableIntro = true,
		message = Engine.CBBHFCGDIC("LUA_MENU/MODE_FENCE_MESSAGE")
	}
	local var_106_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_106_0)

	var_106_1.id = "ModeFencePopup"

	local var_106_2 = 10000

	var_106_1:Wait(var_106_2).onComplete = function()
		local function var_107_0()
			local var_108_0 = var_106_1._controllerIndex and var_106_1._controllerIndex or arg_106_1.controllerIndex

			return ACTIONS.RestoreMenu("MainMenu", true, var_108_0)
		end

		var_106_1:SetupCancelButton(var_107_0)
	end

	return var_106_1
end

local function var_0_18(arg_109_0, arg_109_1)
	assert(arg_109_1)
	assert(arg_109_1.warningMessage)
	assert(arg_109_1.yesAction)

	local var_109_0 = {
		title = Engine.CBBHFCGDIC("MENU/CONFIRMATION_POPUP_TITLE"),
		message = Engine.CBBHFCGDIC(arg_109_1.warningMessage),
		yesAction = arg_109_1.yesAction
	}

	if arg_109_1.noAction then
		var_109_0.noAction = arg_109_1.noAction
	else
		function var_109_0.noAction(arg_110_0)
			return
		end
	end

	local var_109_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_109_0)

	var_109_1.id = "ModularWarningPopup"

	return var_109_1
end

function leaveLobbyBlockedPlayerWarningYesAction(arg_111_0, arg_111_1)
	if Lobby.AreWePrivatePartyHost() then
		Engine.EBIDFIDHIE("xstoplobbybackout leavelobbyblockedplayerwarning", arg_111_1.controller)
	else
		Engine.EBIDFIDHIE("xstopparty leavelobbyblockedplayerwarning", arg_111_1.controller)
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
		Engine.DAGFFDGFII("xstartprivateparty")
	end

	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)

	if Lobby.CAEJIEEEDF() > 0 then
		Lobby.CJBHJEAFGH(0)
	end

	if MLG.AreMLGRulesEnabled() then
		MLG.Toggle(arg_111_0, arg_111_1)
	end
end

function leavelobbyblockedplayerwarning()
	local var_112_0 = {
		message_text = Engine.CBBHFCGDIC("XBOXLIVE/LEAVELOBBYBLOCKEDPLAYER"),
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		yes_action = leaveLobbyBlockedPlayerWarningYesAction
	}
	local var_112_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_112_0)

	var_112_1.id = "leavelobbyblockedplayerwarning"

	return var_112_1
end

local function var_0_19(arg_113_0, arg_113_1)
	local var_113_0 = arg_113_1.controllerIndex
	local var_113_1 = {
		title = Engine.CBBHFCGDIC("CODCASTER/CODCASTER_PAUSED_GAME_TITLE")
	}

	var_113_1.message = ""
	var_113_1.cancelClosesPopup = false
	var_113_1.buttons = {}
	var_113_1.controllerIndex = arg_113_1.controllerIndex

	local var_113_2 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_113_1)

	var_113_2.id = "ClientGamePausedByCodcasterPopup"

	return var_113_2
end

function EnableCCPAWarning(arg_114_0, arg_114_1)
	assert(arg_114_1.controllerIndex)
	assert(arg_114_1.yesAction)

	local var_114_0 = {
		message = Engine.CBBHFCGDIC("MENU/CCPA_DESC"),
		title = Engine.CBBHFCGDIC("MENU/CCPA_NAME"),
		buttons = {
			{
				label = Engine.CBBHFCGDIC("MENU/CCPA_NAME"),
				action = arg_114_1.yesAction
			},
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
				action = arg_114_1.noAction
			}
		}
	}

	var_114_0.defaultFocusIndex = 2

	if IsLanguageArabic() then
		var_114_0.useMessageContainer = true
		var_114_0.messageContainerHeight = 220
	elseif IsLanguageRussian() then
		var_114_0.useMessageContainer = true
		var_114_0.messageContainerHeight = 120
	end

	local var_114_1 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_114_0)

	var_114_1.id = "EnableCCPAWarning"

	return var_114_1
end

function ProductNoLongerAvailableErrorPopup()
	local var_115_0 = {
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = Engine.CBBHFCGDIC("LUA_MENU/PRODUCT_NOT_AVAILABLE")
	}
	local var_115_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_115_0)

	var_115_1.id = "ProductNoLongerAvailableErrorPopup"

	return var_115_1
end

function BlockPlayerAndRemoveFromFriendsPopup(arg_116_0, arg_116_1)
	local var_116_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER"),
		message = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_BNET_FRIEND"),
		yesLabel = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER"),
		noLabel = Engine.CBBHFCGDIC("MENU/CANCEL")
	}

	var_116_0.defaultFocusIndex = 2
	var_116_0.controllerIndex = arg_116_1.controllerIndex
	var_116_0.cancelClosesPopup = false

	function var_116_0.cancelAction()
		return
	end

	var_116_0.noBackButton = true
	var_116_0.yesAction = arg_116_1.yesAction

	local var_116_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_116_0)

	var_116_1.id = "BlockPlayerAndRemoveFromFriendsPopup"

	return var_116_1
end

function RestrictionsChangedPopup(arg_118_0, arg_118_1)
	local var_118_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/RESTRICTIONS_CHANGED_BACK_MENU"),
		button_text = Engine.CBBHFCGDIC("MENU/OK")
	}
	local var_118_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_118_0)

	var_118_1.id = "RestrictionsChangedPopup"

	return var_118_1
end

function ModifyBattlenetInstallPopup(arg_119_0, arg_119_1)
	assert(arg_119_1)
	assert(arg_119_1.controllerIndex)

	local var_119_0 = {
		title = Engine.CBBHFCGDIC("MENU/CONFIRMATION_POPUP_TITLE"),
		message = arg_119_1.message and arg_119_1.message or Engine.CBBHFCGDIC("LUA_MENU/BATTLENET_MODIFY_INSTALL"),
		yesLabel = Engine.CBBHFCGDIC("LUA_MENU/BATTLENET_GOTO"),
		noLabel = Engine.CBBHFCGDIC("MENU/CANCEL"),
		yesAction = function(arg_120_0)
			Engine.BHDGBCBHJD()
			Engine.DJEDDFJEIG()
		end
	}
	local var_119_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_119_0)

	var_119_1.id = "ModifyBattlenetInstallPopup"

	return var_119_1
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
