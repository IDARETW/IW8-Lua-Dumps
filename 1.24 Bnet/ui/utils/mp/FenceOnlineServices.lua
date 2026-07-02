module(..., package.seeall)

FenceOnlineServices = LUI.Class(LUI.Fence)
FenceOnlineServices.CODE_STATE = {
	queued_retry = 7,
	downloading = 2,
	registering = 6,
	inactive = 0,
	success = 3,
	queued = 5,
	requested = 1,
	failure = 4
}
FenceOnlineServices.AUTO_REGISTRATION_STATE = {
	SUCCESS = 2,
	IN_PROGRESS = 1,
	IDLE = 0,
	FAIL = 3
}
FenceOnlineServices.ERROR_CODES = {
	MPNotAllowed = 3,
	AccountIsInMaintenance = 17,
	onlineServices = 9,
	LoginQueueClosed = 14,
	max = 19,
	BattlenetConnected = 12,
	timeout = 8,
	fetchingNPData = 10,
	signedOutOfLive = 1,
	PSPlusRequired = 11,
	networkConnection = 6,
	connecting = 4,
	AccountIsBanned = 15,
	guestWithoutSponsor = 2,
	AccountIsTempBanned = 16,
	none = 0,
	TURequired = 7,
	AccountIsMPOrCPBanned = 18,
	WeGameOffline = 13,
	signedOutOfSteamOnline = 5
}
FenceOnlineServices.UPSELL_STATE = {
	done = 3,
	selling = 2,
	inactive = 1
}
FenceOnlineServices.CONTROLLER_FENCE_STATE = {
	pass = 2,
	block = 3,
	fail = 4,
	inactive = 1
}

function FenceOnlineServices.init(arg_1_0, arg_1_1)
	LUI.Fence.init(arg_1_0)

	arg_1_0._perController = {}
	arg_1_0._noPremium = arg_1_1
	arg_1_0._autoRegistrationEnabled = CODACCOUNT.AccountRegistrationEnabled() and AccountRegistration.BAADBIECDG()
	arg_1_0._autoRegistrationState = FenceOnlineServices.AUTO_REGISTRATION_STATE.IDLE

	for iter_1_0 = 0, Engine.DCJGJDDEHE() - 1 do
		arg_1_0._perController[iter_1_0] = {
			isCancelling = false,
			onlineUpsell = FenceOnlineServices.UPSELL_STATE.inactive,
			fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.inactive
		}

		Fences.BHICCDHGCG(iter_1_0)
	end

	if arg_1_1 then
		DebugPrint("FenceOnlineServices.Init with No Premium")
	else
		DebugPrint("FenceOnlineServices.Init with Premium")
	end
end

function FenceOnlineServices.Start(arg_2_0)
	DebugPrint("FenceOnlineServices.Start")
end

function FenceOnlineServices.Stop(arg_3_0)
	DebugPrint("FenceOnlineServices.Stop")

	if arg_3_0._openedWaitPopup then
		DebugPrint("FenceOnlineServices.Stop closing: " .. arg_3_0._openedWaitPopup)
		LUI.FlowManager.RequestLeaveMenuByName(arg_3_0._openedWaitPopup, true)

		arg_3_0._openedWaitPopup = nil
	end
end

function FenceOnlineServices.OpenRegisteringPopup(arg_4_0, arg_4_1)
	if not arg_4_0._openedRegisteringPopup then
		local var_4_0 = {
			controllerIndex = arg_4_0._registeringController,
			isAnonymousAccount = arg_4_1,
			onSuccess = function()
				arg_4_0._openedRegisteringPopup = false
				arg_4_0._registeringController = nil

				if arg_4_1 then
					arg_4_0._hasSeenGreeting = true
				else
					arg_4_0._openedWaitPopup = nil
				end
			end,
			onCancelRegister = function()
				arg_4_0._openedRegisteringPopup = false
			end,
			onCancelFence = function()
				arg_4_0._registrationCancelled = true
				arg_4_0._registeringController = nil
				arg_4_0._openedRegisteringPopup = false
			end
		}

		if CODACCOUNT.AccountRegistrationEnabled() then
			if not LUI.FlowManager.IsInStack("CODAccountRegisterPopup") then
				LUI.FlowManager.RequestPopupMenu(nil, "CODAccountFencePopup", true, arg_4_0._registeringController, true, var_4_0, nil, true, true)

				arg_4_0._openedRegisteringPopup = true
			end
		else
			if not arg_4_1 then
				AccountRegistration.BAIIEEHFHA(arg_4_0._registeringController)
			end

			var_4_0.onSuccess()
		end
	end
end

function FenceOnlineServices.OpenSummaryPopup(arg_8_0)
	if not arg_8_0._openedSummary and not LUI.FlowManager.IsInStack("CODAccountRestartingPopup") then
		arg_8_0._openedSummary = true

		local var_8_0 = {
			controllerIndex = arg_8_0._summaryController,
			okButtonHandler = function(arg_9_0, arg_9_1)
				LUI.FlowManager.RequestLeaveMenuByName("CODAccountSummary", true, true)

				arg_8_0._openedSummary = false

				if arg_8_0._summaryController then
					Engine.DAGFFDGFII("profile_SetHasEverSeen_CODAccount " .. arg_8_0._summaryController)
					Engine.DAGFFDGFII("updategamerprofile " .. arg_8_0._summaryController)
				end

				arg_8_0._summaryController = nil
			end
		}

		if CODACCOUNT.AccountRegistrationEnabled() and not Engine.DBAEJAHFGJ(arg_8_0._summaryController) then
			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountSummary", true, arg_8_0._summaryController, false, var_8_0, nil, true, true)
		else
			var_8_0.okButtonHandler()
		end
	end
end

function FenceOnlineServices.OpenConnectingPopup(arg_10_0)
	local var_10_0 = arg_10_0
	local var_10_1 = {
		onCancel = function(arg_11_0, arg_11_1)
			DebugPrint("Cancelling FenceOnlineServices")

			var_10_0._perController[arg_11_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting", false, nil, false, var_10_1, nil, true, true)

	arg_10_0._openedWaitPopup = "popup_connecting"
end

function FenceOnlineServices.OpenQueuedPopup(arg_12_0)
	local var_12_0 = arg_12_0
	local var_12_1 = {
		onCancel = function(arg_13_0, arg_13_1)
			var_12_0._perController[arg_13_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_online_queue", false, nil, false, var_12_1, nil, true, true)

	arg_12_0._openedWaitPopup = "popup_online_queue"
end

function FenceOnlineServices.OpenQueuedRetryPopup(arg_14_0)
	local var_14_0 = arg_14_0
	local var_14_1 = {
		onCancel = function(arg_15_0, arg_15_1)
			var_14_0._perController[arg_15_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_online_queue_retry", false, nil, false, var_14_1, nil, true, true)

	arg_14_0._openedWaitPopup = "popup_online_queue_retry"
end

function FenceOnlineServices.OnBackOut(arg_16_0)
	DebugPrint("FenceOnlineServices.OnBackOut")

	for iter_16_0 = 0, Engine.DCJGJDDEHE() - 1 do
		Fences.BHICCDHGCG(iter_16_0)
	end

	if not arg_16_0._noPremium then
		Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
		Engine.BGIDADECDJ()
		Engine.DAGFFDGFII("xstopparty 0")
		Engine.DAGFFDGFII("xstopprivateparty 0")
	end
end

function FenceOnlineServices.PostFail(arg_17_0)
	if arg_17_0._state == LUI.Fence.STATE.fail then
		local var_17_0 = Engine.IJEBHJIJF()
		local var_17_1 = {
			controllerIndex = var_17_0,
			noPremium = arg_17_0._noPremium
		}

		if arg_17_0._errorCode then
			var_17_1.errorCode = arg_17_0._errorCode

			LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_error", false, var_17_0, false, var_17_1, nil, false, false)
			Fences.IABFCACDD(var_17_0)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_cancelled", false, var_17_0, false, var_17_1, nil, false, false)
		end
	end
end

function FenceOnlineServices.ShouldPS4FenceAllowUnderage(arg_18_0, arg_18_1)
	if arg_18_0._noPremium and Engine.CIEGIACHAE() and arg_18_1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed then
		return true
	else
		return false
	end
end

function FenceOnlineServices.ShouldBlockForRegistration(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0._registeringController ~= nil
	local var_19_1 = AccountRegistration.GGBDJFJD() == arg_19_1

	if var_19_0 or var_19_1 then
		if arg_19_0._registeringController == nil and not arg_19_0._registrationCancelled then
			arg_19_0._registeringController = arg_19_1
		end

		return true
	end

	return false
end

function FenceOnlineServices.ShouldAbortRegistration(arg_20_0, arg_20_1)
	local var_20_0 = false
	local var_20_1

	if Engine.DBFCJBDJEC() then
		var_20_0 = Engine.BCCGADID() == BattleNetAuthState.ERROR or arg_20_0._registrationCancelled
		var_20_1 = FenceOnlineServices.ERROR_CODES.BattlenetConnected
	else
		var_20_0 = not Engine.BACCCIHGDG() or arg_20_0._registrationCancelled
		var_20_1 = FenceOnlineServices.ERROR_CODES.networkConnection
	end

	if var_20_0 then
		AccountRegistration.DEEHFICICB(arg_20_1)

		if arg_20_0._registrationCancelled then
			arg_20_0._registrationCancelled = false
		else
			arg_20_0._perController[arg_20_1].errorCode = var_20_1
		end
	end

	return var_20_0
end

function FenceOnlineServices.ShouldBlockforSummary(arg_21_0, arg_21_1)
	if not Engine.BECCFCBIAA("hasEverSeen_CODAccount", arg_21_1) and not Dvar.IBEGCHEFE("unattended") then
		arg_21_0._summaryController = arg_21_1

		if arg_21_0._summaryController == arg_21_0._registeringController then
			arg_21_0._registeringController = nil
		end

		return true
	end

	return false
end

function FenceOnlineServices.UpdateState(arg_22_0)
	assert(arg_22_0._state ~= LUI.Fence.STATE.fail)

	local var_22_0
	local var_22_1

	arg_22_0._queued = false
	arg_22_0._queued_retry = false

	if arg_22_0._autoRegistrationEnabled and arg_22_0._autoRegistrationState <= FenceOnlineServices.AUTO_REGISTRATION_STATE.IN_PROGRESS then
		arg_22_0._autoRegistrationState = AccountRegistration.BEJFHBHICG()
	end

	for iter_22_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_22_0) then
			local var_22_2 = arg_22_0._perController[iter_22_0].onlineUpsell == FenceOnlineServices.UPSELL_STATE.selling

			if Engine.EBCDFHECAC() then
				arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block

				break
			elseif var_22_2 then
				Fences.BHICCDHGCG(iter_22_0)

				arg_22_0._perController[iter_22_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.done
			end

			local var_22_3, var_22_4 = Fences.CCFEHFAFH(iter_22_0)

			if var_22_3 == FenceOnlineServices.CODE_STATE.inactive then
				Fences.BCIHDFJDEJ(iter_22_0)

				var_22_3, var_22_4 = Fences.CCFEHFAFH(iter_22_0)
			end

			if var_22_3 == FenceOnlineServices.CODE_STATE.failure then
				arg_22_0._perController[iter_22_0].errorCode = var_22_4

				local var_22_5 = Engine.BAHIIBFDDG() and var_22_4 == FenceOnlineServices.ERROR_CODES.MPNotAllowed
				local var_22_6 = false
				local var_22_7 = Engine.BEFACAIFDD() and var_22_4 == FenceOnlineServices.ERROR_CODES.MPNotAllowed
				local var_22_8 = arg_22_0._perController[iter_22_0].onlineUpsell == FenceOnlineServices.UPSELL_STATE.inactive

				if (var_22_5 or var_22_6 or var_22_7) and var_22_8 then
					if arg_22_0._noPremium then
						arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
					else
						arg_22_0._perController[iter_22_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.selling
						arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block

						Engine.DBHBIHJDEC(iter_22_0)

						break
					end
				elseif FenceOnlineServices.ShouldPS4FenceAllowUnderage(arg_22_0, var_22_4) then
					arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
				else
					arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
				end
			elseif var_22_3 == FenceOnlineServices.CODE_STATE.queued then
				arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
				arg_22_0._queued = true
			elseif var_22_3 == FenceOnlineServices.CODE_STATE.queued_retry then
				arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
				arg_22_0._queued_retry = true
			elseif var_22_3 == FenceOnlineServices.CODE_STATE.registering then
				if FenceOnlineServices.ShouldBlockForRegistration(arg_22_0, iter_22_0) then
					if FenceOnlineServices.ShouldAbortRegistration(arg_22_0, iter_22_0) then
						arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
					else
						arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
					end
				else
					arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
				end
			elseif var_22_3 ~= FenceOnlineServices.CODE_STATE.success then
				arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
			elseif FenceOnlineServices.ShouldBlockforSummary(arg_22_0, iter_22_0) then
				arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
			else
				arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
			end

			if arg_22_0._perController[iter_22_0].isCancelling then
				arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
				arg_22_0._perController[iter_22_0].errorCode = nil
			end
		else
			arg_22_0._perController[iter_22_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.inactive
			arg_22_0._perController[iter_22_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.inactive
			arg_22_0._perController[iter_22_0].isCancelling = false
			arg_22_0._perController[iter_22_0].errorCode = nil
		end
	end

	local var_22_9 = 0
	local var_22_10 = 0
	local var_22_11 = 0

	for iter_22_1 = 0, Engine.DCJGJDDEHE() - 1 do
		if arg_22_0._perController[iter_22_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.pass then
			var_22_9 = var_22_9 + 1
		end

		if arg_22_0._perController[iter_22_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.block then
			var_22_10 = var_22_10 + 1
		end

		if arg_22_0._perController[iter_22_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.fail then
			var_22_11 = var_22_11 + 1
		end
	end

	assert(var_22_11 + var_22_10 + var_22_9 > 0, "No active local clients")

	if var_22_11 > 0 then
		for iter_22_2 = 0, Engine.DCJGJDDEHE() - 1 do
			if arg_22_0._perController[iter_22_2].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.fail then
				local var_22_12 = arg_22_0._perController[iter_22_2].errorCode

				if var_22_9 > 0 and not Lobby.BJBBDIDHDA(iter_22_2) then
					DebugPrint("Controller #" .. tostring(iter_22_2) .. " does not meet requirements for online play. Making client inactive.")

					arg_22_0._state = LUI.Fence.STATE.block

					Engine.CIHFHAIIHC(iter_22_2)

					if var_22_12 then
						assert(type(var_22_12) == "number")
						assert(var_22_12 > 0 and var_22_12 <= FenceOnlineServices.ERROR_CODES.max)

						local var_22_13 = {
							errorCode = var_22_12,
							controllerIndex = iter_22_2
						}

						LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_error", false, iter_22_2, false, var_22_13, nil, false, true)
						Fences.IABFCACDD(iter_22_2)
					end

					break
				end

				arg_22_0._errorCode = var_22_12
				arg_22_0._state = LUI.Fence.STATE.fail

				break
			end
		end
	elseif var_22_10 > 0 then
		arg_22_0._state = LUI.Fence.STATE.block
	elseif var_22_9 > 0 then
		arg_22_0._state = LUI.Fence.STATE.pass
	else
		arg_22_0._state = LUI.Fence.STATE.block
	end

	if arg_22_0._state == LUI.Fence.STATE.block then
		local function var_22_14(arg_23_0)
			if arg_22_0._openedWaitPopup ~= nil and arg_22_0._openedWaitPopup ~= arg_23_0 then
				LUI.FlowManager.RequestLeaveMenuByName(arg_22_0._openedWaitPopup, true)

				arg_22_0._openedWaitPopup = nil

				return true
			elseif arg_22_0._openedWaitPopup == nil then
				return true
			end

			return false
		end

		if arg_22_0._queued then
			if var_22_14("popup_online_queue") then
				arg_22_0:OpenQueuedPopup()
			end
		elseif arg_22_0._queued_retry then
			if var_22_14("popup_online_queue_retry") then
				arg_22_0:OpenQueuedRetryPopup()
			end
		elseif var_22_14("popup_connecting") then
			arg_22_0:OpenConnectingPopup()
		end

		if arg_22_0._registeringController ~= nil then
			if not arg_22_0._autoRegistrationEnabled or arg_22_0._autoRegistrationState == FenceOnlineServices.AUTO_REGISTRATION_STATE.FAIL then
				arg_22_0:OpenRegisteringPopup()
			end
		elseif arg_22_0._summaryController ~= nil then
			local var_22_15 = AccountRegistration ~= nil and not AccountRegistration.CEDFJJCJJD(arg_22_0._summaryController) and not Engine.DBAEJAHFGJ(arg_22_0._summaryController)

			if var_22_15 and not arg_22_0._hasSeenGreeting then
				arg_22_0._registeringController = arg_22_0._summaryController

				arg_22_0:OpenRegisteringPopup(var_22_15)

				return
			end

			arg_22_0:OpenSummaryPopup()
		end
	end
end

function PopupConnecting(arg_24_0, arg_24_1)
	assert(arg_24_1 and arg_24_1.onCancel)

	local var_24_0 = {
		message = Engine.CBBHFCGDIC("XBOXLIVE/POPUP_CONNECTION"),
		cancel_func = arg_24_1.onCancel
	}

	if Engine.CJJAFGIFAC(arg_24_1.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_24_1.controllerIndex) then
			var_24_0.imageOverride = "logo_wz_shadow"
		end
	else
		var_24_0.imageOverride = "logo_cod_warzone_mw_shadow"
	end

	local var_24_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_24_0)

	var_24_1.id = "popup_connecting"

	return var_24_1
end

function PopupQueuedRetry(arg_25_0, arg_25_1)
	assert(arg_25_1 and arg_25_1.onCancel)

	local var_25_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/LOGIN_QUEUE_RETRY"),
		cancel_func = arg_25_1.onCancel
	}
	local var_25_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_25_0)

	var_25_1.id = "popup_connecting"

	return var_25_1
end

function GetFullErrorMessage(arg_26_0, arg_26_1)
	if arg_26_1 then
		return Engine.CBBHFCGDIC(arg_26_0)
	else
		return arg_26_0
	end
end

function PopupConnectingError(arg_27_0, arg_27_1)
	assert(arg_27_1 and arg_27_1.errorCode)

	local var_27_0
	local var_27_1 = arg_27_1.errorCode
	local var_27_2 = true

	if var_27_1 == FenceOnlineServices.ERROR_CODES.signedOutOfLive then
		var_27_0 = "XBOXLIVE/SIGNEDOUTOFLIVE"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.guestWithoutSponsor then
		var_27_0 = "MPUI/GUEST_SPONSOR_ERROR"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed then
		var_27_0 = "XBOXLIVE/MPNOTALLOWED"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.connecting then
		assert(false, "Unexpected error code")
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.signedOutOfSteamOnline then
		var_27_0 = "PLATFORM/STEAM_OFFLINE"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.networkConnection then
		var_27_0 = "XBOXLIVE/NETCONNECTION"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
		var_27_0 = "PLATFORM/PSPLUS_REQUIRED"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.TURequired then
		var_27_0 = "PLATFORM/TU_REQUIRED"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.timeout then
		var_27_0 = "PLATFORM/ONLINE_TIMEOUT"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.onlineServices then
		var_27_0 = "ONLINE/ONLINE_SERVICES_ERROR"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.BattlenetConnected then
		var_27_0 = "XBOXLIVE/BATTLENET_CONNECTION_FAILED"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.LoginQueueClosed then
		var_27_0 = "ONLINE/LOGIN_QUEUE_CLOSED"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.AccountIsBanned then
		var_27_0 = "EXE/ONLINE_PERM_BAN_PLAYER_NO_NAME"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.AccountIsTempBanned then
		var_27_0 = "EXE/ONLINE_TEMP_BAN_PLAYER_NO_NAME"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.AccountIsInMaintenance then
		var_27_0 = "ONLINE/ONLINE_SERVICES_ERROR"
	elseif var_27_1 == FenceOnlineServices.ERROR_CODES.AccountIsMPOrCPBanned then
		local var_27_3 = Engine.JGAEIIIGD(arg_27_1.controllerIndex, 1)

		var_27_0 = Engine.CBBHFCGDIC("EXE/COD_ONLINE_TEMP_BAN_PLAYER", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_27_1.controllerIndex)))
		var_27_0 = var_27_0 .. "\n\n" .. var_27_3
		var_27_2 = false
	end

	assert(var_27_0)

	local var_27_4 = {
		darkenerAlpha = 1,
		controllerIndex = arg_27_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/CONNECTION_FAILED"),
		message = GetFullErrorMessage(var_27_0, var_27_2)
	}
	local var_27_5 = not Engine.BFDACIJIAD(arg_27_1.controllerIndex)

	if var_27_5 then
		var_27_4.message = Engine.CBBHFCGDIC("LUA_MENU/N_NEWLINE_M", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_27_1.controllerIndex)), var_27_4.message)
	end

	if var_27_5 or arg_27_1.noPremium then
		var_27_4.buttons = BOOT.GetOkayPopupButtons()
	else
		var_27_4.buttons = BOOT.GetRetryPopupButtons(arg_27_1.controllerIndex)
	end

	if Engine.CJJAFGIFAC(arg_27_1.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_27_1.controllerIndex) then
			var_27_4.imageOverride = "logo_wz_shadow"
		end
	else
		var_27_4.imageOverride = "logo_cod_warzone_mw_shadow"
	end

	local var_27_6 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_27_4)

	var_27_6.id = "popup_connecting_error"

	return var_27_6
end

function PopupConnectingCancelled(arg_28_0, arg_28_1)
	local var_28_0 = {
		controllerIndex = arg_28_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/CONNECTION_FAILED"),
		message = Engine.CBBHFCGDIC("MENU/CONNECTION_CANCELLED"),
		buttons = BOOT.GetRetryPopupButtons(arg_28_1.controllerIndex)
	}

	if Engine.CJJAFGIFAC(arg_28_1.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_28_1.controllerIndex) then
			var_28_0.imageOverride = "logo_wz_shadow"
		end
	else
		var_28_0.imageOverride = "logo_cod_warzone_mw_shadow"
	end

	local var_28_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_28_0)

	var_28_1.id = "popup_connecting_cancelled"

	return var_28_1
end

function PopupOnlineQueue(arg_29_0, arg_29_1)
	assert(arg_29_1)

	local var_29_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/SERVER_QUEUE"),
		description = Engine.CBBHFCGDIC("LUA_MENU_MP/SERVER_QUEUE_MSG"),
		controllerIndex = arg_29_1.controllerIndex or Engine.IJEBHJIJF()
	}

	if Engine.CGABICJHAI() then
		var_29_0.buttons = {
			label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
			alignment = LUI.Alignment.Center,
			action = function()
				Engine.DJEDDFJEIG()
			end
		}
	end

	local var_29_1 = MenuBuilder.BuildRegisteredType("FenceOnlineQueueDialogPopupWithDescription", var_29_0)

	var_29_1.id = "popup_online_queue"

	return var_29_1
end

MenuBuilder.registerType("popup_online_queue", PopupOnlineQueue)
MenuBuilder.registerType("popup_online_queue_retry", PopupQueuedRetry)
MenuBuilder.registerType("popup_connecting", PopupConnecting)
MenuBuilder.registerType("popup_connecting_error", PopupConnectingError)
MenuBuilder.registerType("popup_connecting_cancelled", PopupConnectingCancelled)

FenceOnlineServicesPremium = LUI.Class(FenceOnlineServices)

function FenceOnlineServicesPremium.init(arg_31_0)
	FenceOnlineServicesPremium.super.init(arg_31_0, false)
end

LUI.Fence.Register("onlineServices", FenceOnlineServicesPremium)

FenceOnlineServicesNoPremium = LUI.Class(FenceOnlineServices)

function FenceOnlineServicesNoPremium.init(arg_32_0)
	FenceOnlineServicesNoPremium.super.init(arg_32_0, true)
end

LUI.Fence.Register("onlineServicesNoPremium", FenceOnlineServicesNoPremium)
LockTable(_M)
