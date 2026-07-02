module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

function ReadingSaveDevice(arg_1_0, arg_1_1)
	return (MenuBuilder.BuildRegisteredType("FenceDialogPopup", {
		controllerIndex = 0,
		disableIntro = true,
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

function UpdateTextDots(arg_16_0, arg_16_1)
	assert(arg_16_0.properties.numDots)
	assert(arg_16_0.properties.message)

	local var_16_0 = arg_16_0.properties.numDots
	local var_16_1 = arg_16_0.properties.message
	local var_16_2 = (var_16_0 + 1) % 4

	for iter_16_0 = 1, var_16_2 do
		var_16_1 = var_16_1 .. ". "
	end

	arg_16_0:setText(var_16_1)

	arg_16_0.properties.numDots = var_16_2
end

function CancelShaderUploadConfirmationPopup(arg_17_0, arg_17_1)
	return MenuBuilder.BuildRegisteredType("CancelShadersPopup", arg_17_1)
end

function FenceDialogPopup(arg_18_0, arg_18_1)
	assert(arg_18_1.controllerIndex)
	assert(arg_18_1.message)

	return MenuBuilder.BuildRegisteredType("FenceDialog", arg_18_1)
end

function FenceDialogPopupWithProgress(arg_19_0, arg_19_1)
	arg_19_1 = arg_19_1 or {}
	arg_19_1.useProgress = true

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_19_1)
end

function RegimentsFenceDialogPopup(arg_20_0, arg_20_1)
	assert(arg_20_1)
	assert(arg_20_1.controllerIndex)
	assert(arg_20_1.message)

	arg_20_1.disableIntro = true

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_20_1)
end

function FenceSigninQueueDialogPopup(arg_21_0, arg_21_1)
	arg_21_1 = arg_21_1 or {}

	local var_21_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_21_1)

	if not arg_21_1.controllerIndex then
		local var_21_1 = Engine.IJEBHJIJF()
	end

	local var_21_2
	local var_21_3
	local var_21_4
	local var_21_5 = LUI.UIText.new()

	var_21_5.id = "Description"

	var_21_5:SetRGBFromInt(16777215)
	var_21_5:SetAlpha(1)
	var_21_5:setText(arg_21_1.description)
	var_21_5:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_5:SetAlignment(LUI.Alignment.Center)
	var_21_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -776, _1080p * 776, _1080p * 19, _1080p * 44)
	var_21_0:addElement(var_21_5)

	var_21_0.Description = var_21_5

	local var_21_6 = LUI.UIText.new()

	var_21_6.id = "WaitTime"

	var_21_6:SetRGBFromInt(16777215)
	var_21_6:SetAlpha(1)
	var_21_6:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", 0, 0, 0))
	var_21_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_6:SetAlignment(LUI.Alignment.Center)
	var_21_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 60, _1080p * 82)
	var_21_0:addElement(var_21_6)

	var_21_0.WaitTime = var_21_6

	local var_21_7 = LUI.UIText.new()

	var_21_7.id = "WaitPosition"

	var_21_7:SetRGBFromInt(16777215)
	var_21_7:SetAlpha(1)
	var_21_7:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CURRENT_POSITION", 0))
	var_21_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_7:SetAlignment(LUI.Alignment.Center)
	var_21_7:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 82, _1080p * 104)
	var_21_0:addElement(var_21_7)

	var_21_0.WaitPosition = var_21_7

	local var_21_8

	local function var_21_9()
		local var_22_0 = Engine.CJCEEHHIJE()
		local var_22_1 = math.floor(var_22_0 / 3600)
		local var_22_2 = var_22_0 - var_22_1 * 3600
		local var_22_3 = math.floor(var_22_2 / 60)
		local var_22_4 = var_22_2 - var_22_3 * 60
		local var_22_5 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", var_22_1, var_22_3, var_22_4)

		var_21_6:setText(var_22_5)

		var_21_6:Wait(1000).onComplete = var_21_9
	end

	var_21_9()

	local var_21_10

	local function var_21_11()
		local var_23_0 = Engine.BFBHHIHIJD()
		local var_23_1 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CURRENT_POSITION", var_23_0)

		var_21_7:setText(var_23_1)

		var_21_7:Wait(1000).onComplete = var_21_11
	end

	var_21_11()

	return var_21_0
end

function FenceOnlineQueueDialogPopupWithDescription(arg_24_0, arg_24_1)
	arg_24_1 = arg_24_1 or {}

	local var_24_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_24_1)
	local var_24_1 = arg_24_1.controllerIndex or Engine.IJEBHJIJF()
	local var_24_2
	local var_24_3
	local var_24_4 = LUI.UIText.new()

	var_24_4.id = "Description"

	var_24_4:SetRGBFromInt(16777215)
	var_24_4:SetAlpha(1)
	var_24_4:setText(arg_24_1.description)
	var_24_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_24_4:SetAlignment(LUI.Alignment.Center)
	var_24_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -776, _1080p * 776, _1080p * 19, _1080p * 44)
	var_24_0:addElement(var_24_4)

	var_24_0.Description = var_24_4

	local var_24_5 = LUI.UIText.new()

	var_24_5.id = "WaitTime"

	var_24_5:SetRGBFromInt(16777215)
	var_24_5:SetAlpha(1)
	var_24_5:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", 0, 0, 0))
	var_24_5:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_24_5:SetAlignment(LUI.Alignment.Center)
	var_24_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 80, _1080p * 102)
	var_24_0:addElement(var_24_5)

	var_24_0.WaitTime = var_24_5

	local var_24_6

	local function var_24_7()
		local var_25_0 = Engine.BAFIABHBHG(var_24_1)

		DebugPrint(" wait time: " .. var_25_0)

		local var_25_1 = math.floor(var_25_0 / 3600)
		local var_25_2 = var_25_0 - var_25_1 * 3600
		local var_25_3 = math.floor(var_25_2 / 60)
		local var_25_4 = var_25_2 - var_25_3 * 60
		local var_25_5 = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/ESTIMATED_WAIT", var_25_1, var_25_3, var_25_4)

		var_24_5:setText(var_25_5)

		var_24_5:Wait(1000).onComplete = var_24_7
	end

	var_24_7()

	return var_24_0
end

function live_dialog_text_box_with_cancel(arg_26_0, arg_26_1)
	arg_26_1 = arg_26_1 or {}

	local var_26_0 = {
		message = arg_26_1.message or "",
		controllerIndex = arg_26_1.controllerIndex or Engine.IJEBHJIJF(),
		onCancel = arg_26_1.cancel_func,
		disableIntro = arg_26_1.disableIntro,
		showExit = arg_26_1.showExit
	}

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_26_0)
end

function live_dialog_text_box(arg_27_0, arg_27_1)
	arg_27_1 = arg_27_1 or {}

	local var_27_0 = {
		message = arg_27_1.message or "",
		controllerIndex = arg_27_1.controllerIndex or Engine.IJEBHJIJF(),
		disableIntro = arg_27_1.disableIntro
	}

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_27_0)
end

function menu_online_ended()
	local var_28_0 = {
		title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
		message = Dvar.DHEEJCCJBH("online_end_reason")
	}
	local var_28_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_28_0)

	var_28_1.id = "menu_online_ended"

	return var_28_1
end

local function var_0_4(arg_29_0, arg_29_1)
	Engine.EBIDFIDHIE("disconnect")
end

function campaign_mode_savedata_error_popup(arg_30_0, arg_30_1)
	local var_30_0 = {
		title = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_TITLE"),
		message = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_CAMPAIGN"),
		controllerIndex = arg_30_1.controllerIndex,
		action = function(arg_31_0)
			HUDUtils.CorruptSaveDataRepairForSP(arg_30_1.controllerIndex)
			Engine.DIDFHBFDFG(PauseReason.SAVE_DATA_ERROR)
		end
	}
	local var_30_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_30_0)

	var_30_1.id = "campaign_mode_savedata_error_popup"

	return var_30_1
end

local function var_0_5(arg_32_0)
	return Engine.JCBDICCAH(string.format("%02d", arg_32_0))
end

local function var_0_6(arg_33_0, arg_33_1)
	Engine.CIGGHDDHGJ(arg_33_1.controller, not Engine.BECCFCBIAA("gpadEnabled", arg_33_1.controller))
	Engine.DAGFFDGFII("updategamerprofile " .. arg_33_1.controller)
	Engine.DBFFAEEFGJ():TryAddMouseCursor()
end

local function var_0_7(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_1.controller
	local var_34_1 = Engine.DCFICDHCII()

	Engine.CIACGBJGJ(var_34_0, var_34_1)

	if var_34_0 and not Engine.DDJFBBJAIG() then
		LUI.FlowManager.RequestLeaveMenuByNameWithController("controllerremoved_popmenu", var_34_0, true)
	else
		LUI.FlowManager.RequestLeaveMenuByName("controllerremoved_popmenu", true)
	end
end

local function var_0_8(arg_35_0, arg_35_1)
	if not Engine.DDJFBBJAIG() then
		if LUI.FlowManager.IsInStack("popup_leave_game") then
			LUI.FlowManager.RequestLeaveMenuByName("popup_leave_game", true, true)
		end

		LUI.FlowManager.RequestPopupMenu(nil, "popup_leave_game", true, arg_35_1.controller, true)
	elseif Lobby.BBDICGHE() then
		if IsPrivateMatch() then
			LUI.FlowManager.RequestPopupMenu(nil, "leave_private_mp_lobby", true, arg_35_1.controller, true)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "leave_public_mp_lobby", true, arg_35_1.controller, true)
		end
	elseif CONDITIONS.IsInGameBattlesMatch() then
		arg_35_0:dispatchEventToRoot({
			name = "gamebattles_input_leave_lobby",
			controller = arg_35_1.controller
		})
	end
end

if Engine.HDGDBCJFG() then
	if Engine.BAHIIBFDDG() then
		function controllerremoved_popmenu(arg_36_0, arg_36_1)
			local var_36_0 = {
				popup_title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
				message_text = Engine.CBBHFCGDIC("@PLATFORM/CONTROLLER_DISCONNECTED"),
				confirmation_action = var_0_7
			}

			if Engine.DDJFBBJAIG() then
				var_36_0.controllerIndex = 0
			else
				var_36_0.controllerIndex = arg_36_1.missingControllerIndex
			end

			return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_36_0))
		end
	else
		function controllerremoved_popmenu(arg_37_0, arg_37_1)
			local var_37_0 = {
				message = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED")
			}

			if Engine.DDJFBBJAIG() then
				var_37_0.controllerIndex = 0
			else
				var_37_0.controllerIndex = arg_37_1.missingControllerIndex
			end

			var_37_0.isGeneric = true

			return (MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_37_0))
		end
	end
else
	function controllerremoved_popmenu()
		local var_38_0 = {
			popup_title = Engine.CBBHFCGDIC("@MENU/NOTICE"),
			message_text = Engine.CBBHFCGDIC("@PLATFORM/CONTROLLER_DISCONNECTED"),
			button_text = Engine.CBBHFCGDIC("@MENU/SWITCH_TO_MOUSE"),
			confirmation_action = var_0_6
		}

		return (MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_38_0))
	end
end

function WaitingForTransientsPopMenu()
	local var_39_0 = {
		message = Engine.CBBHFCGDIC("@MENU_SP/LOADING_TRANSIENTS")
	}

	var_39_0.controllerIndex = 0

	local var_39_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_39_0)
	local var_39_2 = LUI.UIElement.new()

	var_39_2:SetBlurStrength(2)
	var_39_2:setupWorldBlur()

	var_39_2.id = "blur"

	var_39_1:addElement(var_39_2)

	local var_39_3 = LUI.UIBindButton.new()

	var_39_3:registerEventHandler("button_start", LUI.HUD.OpenPauseMenu)
	var_39_1:addElement(var_39_3)

	return var_39_1
end

function ConfirmProfileChange(arg_40_0, arg_40_1)
	DebugPrint("Confirm profile change")
	Engine.EBIDFIDHIE("confirmProfileChange", arg_40_1.controller)
	LUI.FlowManager.RequestLeaveMenu(arg_40_0)
end

function IgnoreProfileChange(arg_41_0, arg_41_1)
	DebugPrint("Ignore profile change")
	Engine.DGFBJCEDCG(arg_41_1.controller)
	LUI.FlowManager.RequestLeaveMenu(arg_41_0)
end

function user_changed_confirm_mp()
	local var_42_0 = {
		message_text = Engine.CBBHFCGDIC("PLATFORM/PROFILE_PAIRING_CONFIRM"),
		popup_title = Engine.CBBHFCGDIC("MENU/WARNING"),
		yes_text = Engine.CBBHFCGDIC("MENU/YES"),
		no_text = Engine.CBBHFCGDIC("MENU/NO"),
		yes_action = IgnoreProfileChange,
		no_action = ConfirmProfileChange
	}

	var_42_0.defaultFocusIndex = 1

	local var_42_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_42_0)

	var_42_1.id = "user_changed_confirm_mp"

	return var_42_1
end

function controller_changed_confirm_mp()
	local var_43_0 = {
		message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_PAIRING_CONFIRM"),
		popup_title = Engine.CBBHFCGDIC("MENU/WARNING")
	}
	local var_43_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_43_0)

	var_43_1.id = "controller_changed_confirm_mp"

	return var_43_1
end

function PopupFenceGameModeError(arg_44_0, arg_44_1)
	assert(arg_44_1 and arg_44_1.errorCode)

	local var_44_0 = arg_44_1.errorCode
	local var_44_1 = ""
	local var_44_2 = ""

	if var_44_0 == CoD.FenceErrorCodes.Ownership then
		var_44_1 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_NEEDED")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_NEEDED_MESSAGE")
	elseif var_44_0 == CoD.FenceErrorCodes.Installation then
		var_44_1 = Engine.CBBHFCGDIC("LUA_MENU/INSTALLATION_NEEDED")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/INSTALLATION_NEEDED_MESSAGE")
	elseif var_44_0 == CoD.FenceErrorCodes.Ownership_SP then
		var_44_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_SP")
	elseif var_44_0 == CoD.FenceErrorCodes.Ownership_MP then
		var_44_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP")
	elseif var_44_0 == CoD.FenceErrorCodes.Ownership_CP then
		var_44_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_CP")
	elseif var_44_0 == CoD.FenceErrorCodes.Ownership_CP_1 then
		var_44_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_CP1")
	elseif var_44_0 == CoD.FenceErrorCodes.Ownership_CP_2 then
		var_44_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_CP2")
	elseif var_44_0 == CoD.FenceErrorCodes.Installation_PS4 then
		var_44_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/INSTALLATION_NEEDED_PS4")
	elseif var_44_0 == CoD.FenceErrorCodes.Ownership_MP3_DLC then
		var_44_1 = Engine.CBBHFCGDIC("MENU/NOTICE")
		var_44_2 = Engine.CBBHFCGDIC("LUA_MENU/MISSING_DLC_MP3")
	end

	local var_44_3 = {
		popup_title = var_44_1,
		message_text = var_44_2
	}
	local var_44_4 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_44_3)

	var_44_4.id = "popup_getting_data_error"

	return var_44_4
end

function controllerremoved_inputswap_popup(arg_45_0, arg_45_1)
	local var_45_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE")
	}

	if OPTIONS.IsInputSwapEnabled() then
		var_45_0.message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED_INGAME")
		var_45_0.button_text = Engine.CBBHFCGDIC("MENU/SWITCH_TO_MOUSE")
		var_45_0.confirmation_action = var_0_6
	else
		var_45_0.message_text = Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_DISCONNECTED_INGAME_NOSWAP")
		var_45_0.button_text = CONDITIONS.IsInGameBattlesMatch() and Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEAVE_MATCH") or Engine.CBBHFCGDIC("MENU/TO_THE_MAIN_MENU")
		var_45_0.confirmation_action = var_0_8
	end

	local var_45_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_45_0)

	var_45_1.id = "controllerremoved_inputswap_popup"

	return var_45_1
end

function keyboardremoved_inputswap_popup(arg_46_0, arg_46_1)
	local var_46_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE")
	}

	if OPTIONS.IsInputSwapEnabled() then
		var_46_0.message_text = Engine.CBBHFCGDIC("PLATFORM/KBM_DISCONNECTED_INGAME")
		var_46_0.button_text = Engine.CBBHFCGDIC("PLATFORM/SWITCH_TO_CONTROLLER")
		var_46_0.confirmation_action = var_0_6
	else
		var_46_0.message_text = Engine.CBBHFCGDIC("PLATFORM/KBM_DISCONNECTED_INGAME_NOSWAP")
		var_46_0.button_text = CONDITIONS.IsInGameBattlesMatch() and Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEAVE_MATCH") or Engine.CBBHFCGDIC("MENU/TO_THE_MAIN_MENU")
		var_46_0.confirmation_action = var_0_8
	end

	local var_46_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_46_0)

	var_46_1.id = "keyboardremoved_inputswap_popup"

	return var_46_1
end

function generic_error_popup(arg_47_0, arg_47_1)
	local var_47_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = arg_47_1.message
	}
	local var_47_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_47_0)

	var_47_1.id = "generic_error_popup"

	return var_47_1
end

function spinner_inprogress_popup(arg_48_0, arg_48_1)
	local var_48_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_48_1.message,
		cancel_func = arg_48_1.onCancel
	}
	local var_48_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_48_0)

	var_48_1.id = "spinner_inprogress_popup"

	return var_48_1
end

function spinner_confirmation_popup(arg_49_0, arg_49_1)
	local var_49_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = arg_49_1.message .. " " .. Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_SUCCESSFUL")
	}
	local var_49_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_49_0)

	var_49_1.id = "spinner_confirmation_popup"

	return var_49_1
end

function store_inprogress_popup(arg_50_0, arg_50_1)
	local var_50_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_50_1.message,
		cancel_func = arg_50_1.onCancel
	}
	local var_50_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_50_0)

	var_50_1.id = "store_inprogress_popup"

	return var_50_1
end

function tournament_inprogress_popup(arg_51_0, arg_51_1)
	local var_51_0 = {
		message = Engine.CBBHFCGDIC("MENU/FENCE_SPINNER_IN_PROGRESS") .. " : " .. arg_51_1.message,
		cancel_func = arg_51_1.onCancel
	}
	local var_51_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_51_0)

	var_51_1.id = "tournament_inprogress_popup"

	return var_51_1
end

function ReportPlayer(arg_52_0, arg_52_1)
	assert(arg_52_1.xuid)

	local var_52_0 = {
		title = Engine.CBBHFCGDIC("MENU/REPORT_PLAYER")
	}

	var_52_0.message = ""
	var_52_0.buttons = {}

	local var_52_1 = {
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

	for iter_52_0, iter_52_1 in ipairs(var_52_1) do
		table.insert(var_52_0.buttons, {
			label = Engine.CBBHFCGDIC(iter_52_1.text),
			action = function(arg_53_0, arg_53_1)
				Lobby.BIHAGFBBAG(arg_53_1, arg_52_1.xuid, iter_52_1.offense)
				LUI.FlowManager.RequestPopupMenu(arg_53_0, "PopupOK", true, arg_53_1, false, {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = Engine.CBBHFCGDIC(iter_52_1.confirmationString)
				})
			end
		})
	end

	local var_52_2 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_52_0)

	var_52_2.id = "ReportPlayer"

	return var_52_2
end

function LeaveCommonMPMainMenuPopup(arg_54_0, arg_54_1)
	assert(arg_54_1.menu)

	local var_54_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_55_0, arg_55_1)
			Lobby.LeaveCommonMPMainMenu(arg_54_1.menu, arg_55_1)
		end,
		noAction = function()
			return
		end
	}
	local var_54_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_54_0)

	var_54_1.id = "LeaveMissionLobby"

	return var_54_1
end

function LeavePrivatePartyConfirmPopup(arg_57_0, arg_57_1)
	assert(arg_57_1.menu)

	local var_57_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_58_0, arg_58_1)
			Lobby.LeavePrivateParty(arg_57_1.menu, arg_58_1, arg_57_1.moveUI)
		end,
		noAction = function()
			return
		end
	}
	local var_57_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_57_0)

	var_57_1.id = "LeavePrivatePartyConfirmPopup"

	return var_57_1
end

function RateLimitedLeaveCommonMPMainMenuPopup(arg_60_0, arg_60_1)
	assert(arg_60_1.menu)

	local var_60_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY"),
		yesAction = function(arg_61_0, arg_61_1)
			Lobby.LeaveCommonMPMainMenu(arg_60_1.menu, arg_61_1)
		end,
		noAction = function()
			return
		end,
		rateLimited = arg_60_1.rateLimited,
		rateLimitIntervalMS = arg_60_1.rateLimitIntervalMS,
		rateLimitAttempts = arg_60_1.rateLimitAttempts
	}
	local var_60_1 = MenuBuilder.BuildRegisteredType("RateLimitedPopupYesNo", var_60_0)

	var_60_1.id = "LeaveMissionLobby"

	return var_60_1
end

function ShowUpsellDialogPopup(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_1.controllerIndex

	assert(var_63_0)
	Dvar.DHEGHJJJHI("showUpsellDialog", false)
	Engine.IBCDJDCJC()

	local var_63_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/TRIAL_EXPIRED"),
		message = Engine.CBBHFCGDIC("LUA_MENU/TRIAL_EXPIRED_MSG")
	}

	var_63_1.buttonsClosePopup = true
	var_63_1.cancelClosesPopup = true
	var_63_1.buttons = {}

	local var_63_2 = {
		label = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW")),
		action = function(arg_64_0, arg_64_1)
			if CONDITIONS.IsPS4() then
				Commerce.DAGIHHFJIJ(arg_64_1)
			elseif CONDITIONS.IsXboxOne() then
				LUI.FlowManager.RequestPopupMenu(nil, "ShowUpsellXboxStore", false, nil, false, {}, nil, false, true)
			end
		end
	}

	table.insert(var_63_1.buttons, var_63_2)

	local var_63_3 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_65_0, arg_65_1)
			return
		end
	}

	table.insert(var_63_1.buttons, var_63_3)

	local var_63_4 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_63_1)

	var_63_4.id = "ShowUpsellDialogPopup"

	return var_63_4
end

function DisbandPartyEnterGameBattlesLobbyPopup(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_1.controllerIndex

	assert(var_66_0)

	local var_66_1 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/DISBAND_PARTY"),
		yesAction = function(arg_67_0, arg_67_1)
			Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_67_1)
			Lobby.OpenGameBattlesLobby(arg_67_1)
		end
	}
	local var_66_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_66_1)

	var_66_2.id = "DisbandPartyEnterGameBattlesLobbyPopup"

	return var_66_2
end

function RateLimitedPopupYesNo(arg_68_0, arg_68_1)
	arg_68_1.rateLimited = true
	arg_68_1.rateLimitIntervalMS = arg_68_1.rateLimitIntervalMS or 5000
	arg_68_1.rateLimitAttempts = arg_68_1.rateLimitAttempts or 3

	return (MenuBuilder.BuildRegisteredType("PopupYesNo", arg_68_1))
end

function ShowUpsellXboxStore(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_1.controllerIndex

	assert(var_69_0)

	local var_69_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS")
	}

	var_69_1.message = ""
	var_69_1.buttonsClosePopup = true
	var_69_1.cancelClosesPopup = true
	var_69_1.buttons = {}

	local var_69_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_DELUXE"),
		action = function(arg_70_0, arg_70_1)
			Commerce.DAGIHHFJIJ(arg_70_1, "c5da3bf3-3459-4202-a7eb-6eb8f41fabe5")
		end
	}

	table.insert(var_69_1.buttons, var_69_2)

	local var_69_3 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_LEGACY"),
		action = function(arg_71_0, arg_71_1)
			Commerce.DAGIHHFJIJ(arg_71_1, "559cf838-c5c4-498a-a5e3-351fa4b37d7c")
		end
	}

	table.insert(var_69_1.buttons, var_69_3)

	local var_69_4 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DIGITAL_BASE"),
		action = function(arg_72_0, arg_72_1)
			Commerce.DAGIHHFJIJ(arg_72_1, "b34bce6e-11b7-45ae-bb93-aad737c1b457")
		end
	}

	table.insert(var_69_1.buttons, var_69_4)

	local var_69_5 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
		action = function(arg_73_0, arg_73_1)
			return
		end
	}

	table.insert(var_69_1.buttons, var_69_5)

	local var_69_6 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_69_1)

	var_69_6.id = "ShowUpsellXboxStore"

	return var_69_6
end

local function var_0_9(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_1.controllerIndex

	assert(var_74_0)
	assert(arg_74_1.labels)
	assert(arg_74_1.keys)
	assert(arg_74_1.callback)

	local var_74_1 = {
		title = Engine.CBBHFCGDIC("MENU/FILTER_OPTIONS_CAPS"),
		width = _1080p * 500
	}

	var_74_1.defaultFocusIndex = 1
	var_74_1.cancelClosesPopup = true
	var_74_1.listContent = {}

	local var_74_2
	local var_74_3 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_74_0
	})

	var_74_3.id = "TypeButton"

	var_74_3.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FILTER")), 0)
	var_74_3:SetAnchors(0, 1, 1, 0, 0)
	var_74_3:SetLeft(_1080p * 0, 0)
	var_74_3:SetRight(_1080p * 500, 0)
	var_74_3:SetTop(_1080p * 0, 0)
	var_74_3:SetBottom(_1080p * 35, 0)

	var_74_3.filterType = arg_74_1.keys[var_74_1.defaultFocusIndex]

	LUI.AddUIArrowTextButtonLogic(var_74_3, var_74_0, {
		wrapAround = true,
		defaultValue = 1,
		labels = arg_74_1.labels,
		action = function(arg_75_0)
			var_74_3.filterType = arg_74_1.keys[arg_75_0]
		end
	})
	table.insert(var_74_1.listContent, var_74_3)

	local var_74_4
	local var_74_5 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_74_0
	})

	var_74_5.id = "AcceptButton"

	var_74_5.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT")), 0)
	var_74_5:SetAnchors(0, 1, 1, 0, 0)
	var_74_5:SetLeft(_1080p * 0, 0)
	var_74_5:SetRight(_1080p * 500, 0)
	var_74_5:SetTop(_1080p * 120, 0)
	var_74_5:SetBottom(_1080p * 155, 0)
	var_74_5:addEventHandler("button_action", function(arg_76_0, arg_76_1)
		ACTIONS.LeaveMenu(arg_76_0)
		arg_74_1.callback(var_74_3.filterType)
	end)
	table.insert(var_74_1.listContent, var_74_5)

	local var_74_6
	local var_74_7 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_74_0
	})

	var_74_7.id = "ButtonHelperBar"

	var_74_7:SetAnchors(0, 1, 1, 0, 0)
	var_74_7:SetLeft(_1080p * 0, 0)
	var_74_7:SetRight(_1080p * 500, 0)
	var_74_7:SetTop(_1080p * -50, 0)
	var_74_7:SetBottom(_1080p * 0, 0)
	table.insert(var_74_1.listContent, var_74_7)

	local var_74_8 = MenuBuilder.BuildRegisteredType("PopupList", var_74_1)

	var_74_8.id = "FilterPopup"

	var_74_8:AddButtonHelperTextToElement(var_74_7, {
		clickable = true,
		priority = 1,
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("@MENU/CANCEL")
	})

	return var_74_8
end

local function var_0_10(arg_77_0, arg_77_1)
	arg_77_1.chatOptOut = arg_77_1.chatOptOut or true
	arg_77_1.title = arg_77_1.title or Engine.CBBHFCGDIC("LUA_MENU/EULA_ACCEPT")
	arg_77_1.message = arg_77_1.message or Engine.CBBHFCGDIC("LUA_MENU/EULA_MESSAGE")
	arg_77_1.buttons = arg_77_1.buttons or {
		{
			label = Engine.CBBHFCGDIC("MENU/OK")
		}
	}

	local var_77_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_77_1)

	var_77_0.id = "EULADeclinePopup"

	return var_77_0
end

local function var_0_11(arg_78_0, arg_78_1)
	assert(arg_78_1.controllerIndex)
	assert(arg_78_1.onAccept)

	arg_78_1.title = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_TITLE")

	if arg_78_1.crossplayRecommended then
		arg_78_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_CROSSPLAY_RECOMMENDED_MESSAGE")
	elseif arg_78_1.crossplayRecommendedReminder then
		arg_78_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_CROSSPLAY_RECOMMENDED_REMINDER_MESSAGE")
	else
		arg_78_1.message = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_MESSAGE")
	end

	arg_78_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/LPC_ENABLE_CROSSPLAY_BUTTON"),
			action = function(arg_79_0, arg_79_1)
				OPTIONS_DATA.optionsDataList.CrossPlay.action(nil, arg_78_1.controllerIndex, OPTIONS.disableButtonOptions.ENABLED)
				arg_78_1.onAccept(arg_78_1.button)
				LUI.FlowManager.RequestLeaveMenu(arg_79_0)
			end
		}
	}

	local var_78_0 = {}

	if arg_78_1.crossplayRecommended then
		var_78_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU_MP/NO"),
			action = function(arg_80_0, arg_80_1)
				LUI.FlowManager.RequestLeaveMenu(arg_80_0)
				arg_78_1.onAccept(arg_78_1.button)
			end
		}
	elseif arg_78_1.crossplayRecommendedReminder then
		var_78_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU_MP/NO"),
			action = function(arg_81_0, arg_81_1)
				LUI.FlowManager.RequestLeaveMenu(arg_81_0)
			end
		}
	else
		var_78_0 = {
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = function(arg_82_0, arg_82_1)
				LUI.FlowManager.RequestLeaveMenu(arg_82_0)
			end
		}
	end

	table.insert(arg_78_1.buttons, var_78_0)

	local var_78_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_78_1)

	var_78_1.id = "LPCEnableCrossplayPopup"

	return var_78_1
end

local function var_0_12(arg_83_0, arg_83_1)
	assert(arg_83_1.onAccept)
	assert(arg_83_1.onDecline)
	assert(arg_83_1.activeMissionName)
	assert(arg_83_1.newMissionName)

	local function var_83_0(arg_84_0, arg_84_1)
		arg_83_1.onDecline()
		LUI.FlowManager.RequestLeaveMenu(arg_84_0)
	end

	arg_83_1.title = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION")
	arg_83_1.message = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION_WARNING", arg_83_1.newMissionName, arg_83_1.activeMissionName)
	arg_83_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION"),
			action = function(arg_85_0, arg_85_1)
				arg_83_1.onAccept()
				LUI.FlowManager.RequestLeaveMenu(arg_85_0)
			end
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = var_83_0
		}
	}

	if Engine.CJJAFGIFAC(arg_83_1.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_83_1.controllerIndex) then
			arg_83_1.imageOverride = "logo_wz_shadow"
		end
	else
		arg_83_1.imageOverride = "logo_cod_warzone_mw_shadow"
	end

	local var_83_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_83_1)

	var_83_1.id = "ActivateMissionPopup"

	local var_83_2 = LUI.UIBindButton.new()

	var_83_2.id = "bindButton"

	var_83_1:addElement(var_83_2)

	var_83_1.bindButton = var_83_2

	var_83_1.bindButton:addEventHandler("button_secondary", var_83_0)

	return var_83_1
end

local function var_0_13(arg_86_0, arg_86_1)
	assert(arg_86_1.onAccept)
	assert(arg_86_1.onDecline)
	assert(arg_86_1.activeMissionName)

	arg_86_1.title = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION")
	arg_86_1.message = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION_WARNING", arg_86_1.activeMissionName)
	arg_86_1.buttons = {
		{
			label = Engine.CBBHFCGDIC("CHALLENGE/DEACTIVATE_MISSION"),
			action = function(arg_87_0, arg_87_1)
				arg_86_1.onAccept()
				LUI.FlowManager.RequestLeaveMenu(arg_87_0)
			end
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = function(arg_88_0, arg_88_1)
				arg_86_1.onDecline()
				LUI.FlowManager.RequestLeaveMenu(arg_88_0)
			end
		}
	}

	local var_86_0 = MenuBuilder.BuildRegisteredType("GenericImagePopup", arg_86_1)

	var_86_0.id = "DeactivateMissionPopup"

	return var_86_0
end

local function var_0_14(arg_89_0, arg_89_1)
	assert(arg_89_1.controllerIndex)
	assert(arg_89_1.message)

	arg_89_1.disableIntro = true

	local var_89_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", arg_89_1)

	var_89_0.id = "MissionActivationSpinner"

	return var_89_0
end

local function var_0_15()
	local var_90_0 = {
		message_text = Engine.CDFHFJGICJ(),
		popup_title = Engine.CBBHFCGDIC("MENU/ANTI_ADDICTION_TIPS_TITLE"),
		button_text = Engine.CBBHFCGDIC("MENU/OK"),
		confirmation_action = Engine.OnAntiAddictionTipsConfirmed
	}
	local var_90_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_90_0)

	var_90_1.id = "AntiAddictionTipsPopup"

	return var_90_1
end

local function var_0_16(arg_91_0, arg_91_1)
	arg_91_1.title = WORLD_MAP.GetOperationName()
	arg_91_1.tabWidgets = {
		"OperationRewards",
		"OperationBriefing"
	}
	arg_91_1.tabNames = {
		"LUA_MENU/REWARD_PLURAL",
		"LUA_MENU/BRIEFING"
	}

	return MenuBuilder.BuildRegisteredType("FullModalTabPopup", arg_91_1)
end

local function var_0_17(arg_92_0, arg_92_1)
	assert(arg_92_1)

	local var_92_0 = {
		disableIntro = true,
		message = Engine.CBBHFCGDIC("LUA_MENU/MODE_FENCE_MESSAGE")
	}
	local var_92_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_92_0)

	var_92_1.id = "ModeFencePopup"

	local var_92_2 = 10000

	var_92_1:Wait(var_92_2).onComplete = function()
		local function var_93_0()
			local var_94_0 = var_92_1._controllerIndex and var_92_1._controllerIndex or arg_92_1.controllerIndex

			return ACTIONS.RestoreMenu("MainMenu", true, var_94_0)
		end

		var_92_1:SetupCancelButton(var_93_0)
	end

	return var_92_1
end

local function var_0_18(arg_95_0, arg_95_1)
	assert(arg_95_1)
	assert(arg_95_1.warningMessage)
	assert(arg_95_1.yesAction)

	local var_95_0 = {
		title = Engine.CBBHFCGDIC("MENU/CONFIRMATION_POPUP_TITLE"),
		message = Engine.CBBHFCGDIC(arg_95_1.warningMessage),
		yesAction = arg_95_1.yesAction
	}

	if arg_95_1.noAction then
		var_95_0.noAction = arg_95_1.noAction
	else
		function var_95_0.noAction(arg_96_0)
			return
		end
	end

	local var_95_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_95_0)

	var_95_1.id = "ModularWarningPopup"

	return var_95_1
end

function leaveLobbyBlockedPlayerWarningYesAction(arg_97_0, arg_97_1)
	if Lobby.AreWePrivatePartyHost() then
		Engine.EBIDFIDHIE("xstoplobbybackout leavelobbyblockedplayerwarning", arg_97_1.controller)
	else
		Engine.EBIDFIDHIE("xstopparty leavelobbyblockedplayerwarning", arg_97_1.controller)
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
		Engine.DAGFFDGFII("xstartprivateparty")
	end

	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)

	if Lobby.CAEJIEEEDF() > 0 then
		Lobby.CJBHJEAFGH(0)
	end

	if MLG.AreMLGRulesEnabled() then
		MLG.Toggle(arg_97_0, arg_97_1)
	end
end

function leavelobbyblockedplayerwarning()
	local var_98_0 = {
		message_text = Engine.CBBHFCGDIC("XBOXLIVE/LEAVELOBBYBLOCKEDPLAYER"),
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		yes_action = leaveLobbyBlockedPlayerWarningYesAction
	}
	local var_98_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_98_0)

	var_98_1.id = "leavelobbyblockedplayerwarning"

	return var_98_1
end

local function var_0_19(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1.controllerIndex
	local var_99_1 = {
		title = Engine.CBBHFCGDIC("CODCASTER/CODCASTER_PAUSED_GAME_TITLE")
	}

	var_99_1.message = ""
	var_99_1.cancelClosesPopup = false
	var_99_1.buttons = {}
	var_99_1.controllerIndex = arg_99_1.controllerIndex

	local var_99_2 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_99_1)

	var_99_2.id = "ClientGamePausedByCodcasterPopup"

	return var_99_2
end

function EnableCCPAWarning(arg_100_0, arg_100_1)
	assert(arg_100_1.controllerIndex)
	assert(arg_100_1.yesAction)

	local var_100_0 = {
		message = Engine.CBBHFCGDIC("MENU/CCPA_DESC"),
		title = Engine.CBBHFCGDIC("MENU/CCPA_NAME"),
		buttons = {
			{
				label = Engine.CBBHFCGDIC("MENU/CCPA_NAME"),
				action = arg_100_1.yesAction
			},
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
				action = arg_100_1.noAction
			}
		}
	}

	var_100_0.defaultFocusIndex = 2

	if IsLanguageArabic() then
		var_100_0.useMessageContainer = true
		var_100_0.messageContainerHeight = 220
	elseif IsLanguageRussian() then
		var_100_0.useMessageContainer = true
		var_100_0.messageContainerHeight = 120
	end

	local var_100_1 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_100_0)

	var_100_1.id = "EnableCCPAWarning"

	return var_100_1
end

function ProductNoLongerAvailableErrorPopup()
	local var_101_0 = {
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = Engine.CBBHFCGDIC("LUA_MENU/PRODUCT_NOT_AVAILABLE")
	}
	local var_101_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_101_0)

	var_101_1.id = "ProductNoLongerAvailableErrorPopup"

	return var_101_1
end

function BlockPlayerAndRemoveFromFriendsPopup(arg_102_0, arg_102_1)
	local var_102_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER"),
		message = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_BNET_FRIEND"),
		yesLabel = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER"),
		noLabel = Engine.CBBHFCGDIC("MENU/CANCEL")
	}

	var_102_0.defaultFocusIndex = 2
	var_102_0.controllerIndex = arg_102_1.controllerIndex
	var_102_0.cancelClosesPopup = false

	function var_102_0.cancelAction()
		return
	end

	var_102_0.noBackButton = true
	var_102_0.yesAction = arg_102_1.yesAction

	local var_102_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_102_0)

	var_102_1.id = "BlockPlayerAndRemoveFromFriendsPopup"

	return var_102_1
end

function RestrictionsChangedPopup(arg_104_0, arg_104_1)
	local var_104_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("LUA_MENU/RESTRICTIONS_CHANGED_BACK_MENU"),
		button_text = Engine.CBBHFCGDIC("MENU/OK")
	}
	local var_104_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_104_0)

	var_104_1.id = "RestrictionsChangedPopup"

	return var_104_1
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
MenuBuilder.registerType("controllerremoved_popmenu", controllerremoved_popmenu)
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
MenuBuilder.registerType("RateLimitedPopupYesNo", RateLimitedPopupYesNo)
MenuBuilder.registerType("ShowUpsellXboxStore", ShowUpsellXboxStore)
MenuBuilder.registerType("FilterPopup", var_0_9)
MenuBuilder.registerType("LeavePrivatePartyConfirmPopup", LeavePrivatePartyConfirmPopup)
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
LockTable(_M)
