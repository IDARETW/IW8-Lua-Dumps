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
FenceOnlineServices.REGISTRATION_STATE = {
	OTP_THROTTLED = 4,
	UPGRADING = 5,
	IDLE = 0,
	PENDING = 1,
	REGISTERING = 2,
	OTP_NEEDED = 3
}
FenceOnlineServices.AUTO_REGISTRATION_STATE = {
	SUCCESS = 2,
	IN_PROGRESS = 1,
	IDLE = 0,
	FAIL = 3
}
FenceOnlineServices.ERROR_CODES = {
	MPNotAllowed = 3,
	AccountIsInMaintenance = 15,
	onlineServices = 7,
	LoginQueueClosed = 12,
	PlatformXboxLivePrivilegeDenied = 17,
	max = 21,
	BattlenetConnected = 10,
	COPPAUserActionRequired = 20,
	PlatformXboxLivePrivilegeCheckFailed = 18,
	fetchingNPData = 8,
	signedOutOfLive = 1,
	PSPlusRequired = 9,
	networkConnection = 5,
	AccountIsBanned = 13,
	guestWithoutSponsor = 2,
	AccountIsTempBanned = 14,
	none = 0,
	TURequired = 6,
	COPPADateOfBirthRequired = 19,
	AccountIsMPOrCPBanned = 16,
	WeGameOffline = 11,
	signedOutOfSteamOnline = 4
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
	arg_1_0._registrationState = AccountRegistration.BDAJEJBGF()
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

function FenceOnlineServices.OpenOTPPopup(arg_4_0)
	if not arg_4_0._openedOTPPopup then
		local var_4_0 = {
			controllerIndex = arg_4_0._registeringController,
			onSuccess = function()
				arg_4_0._openedOTPPopup = false
			end,
			onCancel = function()
				arg_4_0._openedOTPPopup = false
			end,
			onError = function()
				arg_4_0._openedOTPPopup = false
			end
		}

		if CODACCOUNT.AccountRegistrationEnabled() then
			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountAuthentication", true, arg_4_0._registeringController, false, var_4_0, nil, true, true)

			arg_4_0._openedOTPPopup = true
		end
	end
end

function FenceOnlineServices.OpenRegisteringPopup(arg_8_0, arg_8_1)
	if not arg_8_0._openedRegisteringPopup then
		local var_8_0 = {
			controllerIndex = arg_8_0._registeringController,
			isAnonymousAccount = arg_8_1,
			onSuccess = function()
				arg_8_0._openedRegisteringPopup = false
				arg_8_0._registeringController = nil

				if arg_8_1 then
					arg_8_0._hasSeenGreeting = true
				else
					arg_8_0._openedWaitPopup = nil
				end
			end,
			onCancelRegister = function()
				arg_8_0._openedRegisteringPopup = false
			end,
			onCancelFence = function()
				arg_8_0._registrationCancelled = true
				arg_8_0._registeringController = nil
				arg_8_0._openedRegisteringPopup = false
			end
		}

		if CODACCOUNT.AccountRegistrationEnabled() and not CONDITIONS.IsQABotSkipActive() then
			if not LUI.FlowManager.IsInStack("CODAccountRegisterPopup") then
				LUI.FlowManager.RequestPopupMenu(nil, "CODAccountFencePopup", true, arg_8_0._registeringController, true, var_8_0, nil, true, true)

				arg_8_0._openedRegisteringPopup = true
			end
		else
			if not arg_8_1 then
				AccountRegistration.BAIIEEHFHA(arg_8_0._registeringController)
			end

			var_8_0.onSuccess()
		end
	end
end

function FenceOnlineServices.OpenSummaryPopup(arg_12_0)
	if not arg_12_0._openedSummary and not LUI.FlowManager.IsInStack("CODAccountRestartingPopup") then
		arg_12_0._openedSummary = true

		local var_12_0 = {
			controllerIndex = arg_12_0._summaryController,
			okButtonHandler = function(arg_13_0, arg_13_1)
				LUI.FlowManager.RequestLeaveMenuByName("CODAccountSummary", true, true)

				local var_13_0 = true

				if arg_12_0._summaryController then
					arg_12_0:SetHasSeenCODAccount(arg_12_0._summaryController)

					if Engine.BECCFCBIAA("hasEverSeen_CODAccountOTP", arg_12_0._summaryController) ~= 1 then
						if not Dvar.IBEGCHEFE("MPNNSLPPNP") and CODACCOUNT.AccountRegistrationEnabled() and not Engine.DBAEJAHFGJ(arg_12_0._summaryController) and not TwoFactorAuth.BDAFCCAEDG(arg_12_0._summaryController) then
							var_13_0 = false

							LUI.FlowManager.RequestPopupMenu(nil, "CODAccountAuthenticationAdv", true, arg_12_0._summaryController, false, {
								state = arg_12_0
							}, nil, true, true)
						else
							arg_12_0:SetHasSeenCODAccountOTP(arg_12_0._summaryController)
						end
					end
				end

				if var_13_0 then
					arg_12_0:SetHasSeenSummary()
				end
			end
		}

		if CODACCOUNT.AccountRegistrationEnabled() and not Engine.DBAEJAHFGJ(arg_12_0._summaryController) and not CONDITIONS.IsQABotSkipActive() then
			local var_12_1 = Engine.BAGAFBABEE(arg_12_0._summaryController)
			local var_12_2 = var_12_1 and Engine.DCGHGJCHIB(arg_12_0._summaryController, var_12_1)

			if CONDITIONS.IsLaze() and (var_12_2 or Dvar.IBEGCHEFE("NRPRRQQSPR")) then
				local var_12_3 = {
					controller = arg_12_0._summaryController,
					confirmAction = function(arg_14_0, arg_14_1)
						if AccountRegistration.BDBAJHGFE(arg_14_0, arg_14_1) then
							Engine.BHIJFFCAEB("")
						end
					end
				}

				LUI.FlowManager.RequestPopupMenu(nil, "CODAccountForceRenamePopup", true, arg_12_0._summaryController, false, var_12_3, nil, true, true)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "CODAccountSummary", true, arg_12_0._summaryController, false, var_12_0, nil, true, true)
			end
		else
			var_12_0.okButtonHandler()
		end
	end
end

function FenceOnlineServices.OpenConnectingPopup(arg_15_0)
	local var_15_0 = arg_15_0
	local var_15_1 = {
		displayWZWipSetup = true,
		disableIntro = false,
		onCancel = function(arg_16_0, arg_16_1)
			DebugPrint("Cancelling FenceOnlineServices")

			var_15_0._perController[arg_16_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting", false, nil, false, var_15_1, nil, true, true)

	arg_15_0._openedWaitPopup = "popup_connecting"
end

function FenceOnlineServices.OpenQueuedPopup(arg_17_0)
	local var_17_0 = arg_17_0
	local var_17_1 = {
		onCancel = function(arg_18_0, arg_18_1)
			var_17_0._perController[arg_18_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_online_queue", false, nil, false, var_17_1, nil, true, true)

	arg_17_0._openedWaitPopup = "popup_online_queue"
end

function FenceOnlineServices.OpenQueuedRetryPopup(arg_19_0)
	local var_19_0 = arg_19_0
	local var_19_1 = {
		onCancel = function(arg_20_0, arg_20_1)
			var_19_0._perController[arg_20_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_online_queue_retry", false, nil, false, var_19_1, nil, true, true)

	arg_19_0._openedWaitPopup = "popup_online_queue_retry"
end

function FenceOnlineServices.OnBackOut(arg_21_0)
	DebugPrint("FenceOnlineServices.OnBackOut")

	for iter_21_0 = 0, Engine.DCJGJDDEHE() - 1 do
		Fences.BHICCDHGCG(iter_21_0)
	end

	if not arg_21_0._noPremium then
		Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
		Engine.BGIDADECDJ()
		Engine.DAGFFDGFII("xstopparty 0")
		Engine.DAGFFDGFII("xstopprivateparty 0")
	end
end

function FenceOnlineServices.GetErrorString(arg_22_0, arg_22_1)
	local var_22_0 = Fences.GetStatusOnFailure(arg_22_0, FenceOnlineServices.CODE_FENCE)

	if var_22_0 then
		return var_22_0
	end

	if arg_22_1 == FenceOnlineServices.ERROR_CODES.networkConnection then
		var_22_0 = Engine.EAABDHIDFJ() and "MSSTORE_PLATFORM/NETCONNECTION" or "XBOXLIVE/NETCONNECTION"
	elseif arg_22_1 == FenceOnlineServices.ERROR_CODES.signedOutOfSteamOnline then
		var_22_0 = "PLATFORM/STEAM_OFFLINE"
	elseif arg_22_1 == FenceOnlineServices.ERROR_CODES.BattlenetConnected then
		var_22_0 = "XBOXLIVE/BATTLENET_CONNECTION_FAILED"
	elseif arg_22_1 == FenceOnlineServices.ERROR_CODES.LoginQueueClosed then
		var_22_0 = "ONLINE/LOGIN_QUEUE_CLOSED"
	elseif arg_22_1 == FenceOnlineServices.ERROR_CODES.AccountIsBanned then
		var_22_0 = "EXE/ONLINE_PERM_BAN_PLAYER_NO_NAME"
	elseif arg_22_1 == FenceOnlineServices.ERROR_CODES.AccountIsTempBanned then
		var_22_0 = "EXE/ONLINE_TEMP_BAN_PLAYER_NO_NAME"
	elseif arg_22_1 == FenceOnlineServices.ERROR_CODES.AccountIsInMaintenance then
		var_22_0 = "ONLINE/ONLINE_SERVICES_ERROR"
	elseif arg_22_1 == FenceOnlineServices.ERROR_CODES.AccountIsMPOrCPBanned then
		local var_22_1 = Engine.JGAEIIIGD(arg_22_0, 1)

		var_22_0 = Engine.CBBHFCGDIC("EXE/COD_ONLINE_TEMP_BAN_PLAYER", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_22_0)))
		var_22_0 = var_22_0 .. "\n\n" .. var_22_1
	end

	assert(var_22_0)

	return Engine.CBBHFCGDIC(var_22_0)
end

function FenceOnlineServices.PostFail(arg_23_0)
	if arg_23_0._state == LUI.Fence.STATE.fail then
		local var_23_0 = Engine.IJEBHJIJF()
		local var_23_1 = {
			controllerIndex = var_23_0,
			noPremium = arg_23_0._noPremium
		}

		if arg_23_0._errorCode then
			var_23_1.errorCode = arg_23_0._errorCode

			if Dvar.IBEGCHEFE("LQSTPOPKRO") and (arg_23_0._errorCode == LUI.FENCE_ONLINE_SERVICES_ERROR_CODES.COPPADateOfBirthRequired or arg_23_0._errorCode == LUI.FENCE_ONLINE_SERVICES_ERROR_CODES.COPPAUserActionRequired) then
				var_23_1.requiredUserAction = Fences.DADGIHEJBI(var_23_0)

				LUI.FlowManager.RequestPopupMenu(nil, "COPPAMenu", false, nil, false, var_23_1, nil, false, true)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_error", false, var_23_0, false, var_23_1, nil, false, false)
				Fences.IABFCACDD(var_23_0)
			end
		else
			LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_cancelled", false, var_23_0, false, var_23_1, nil, false, false)
		end
	end
end

function FenceOnlineServices.ShouldPS4FenceAllowUnderage(arg_24_0, arg_24_1)
	if arg_24_0._noPremium and Engine.CIEGIACHAE() and arg_24_1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed then
		return true
	else
		return false
	end
end

function FenceOnlineServices.ShouldBlockForRegistration(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0._registeringController ~= nil
	local var_25_1 = AccountRegistration.GGBDJFJD() == arg_25_1

	if var_25_0 or var_25_1 then
		if arg_25_0._registeringController == nil and not arg_25_0._registrationCancelled then
			arg_25_0._registeringController = arg_25_1
		end

		return true
	end

	return false
end

function FenceOnlineServices.ShouldAbortRegistration(arg_26_0, arg_26_1)
	local var_26_0 = false
	local var_26_1

	if Engine.DBFCJBDJEC() then
		var_26_0 = Engine.BCCGADID() == BattleNetAuthState.ERROR or arg_26_0._registrationCancelled
		var_26_1 = FenceOnlineServices.ERROR_CODES.BattlenetConnected
	else
		var_26_0 = not Engine.BACCCIHGDG() or arg_26_0._registrationCancelled
		var_26_1 = FenceOnlineServices.ERROR_CODES.networkConnection
	end

	if var_26_0 then
		AccountRegistration.DEEHFICICB(arg_26_1)

		if arg_26_0._registrationCancelled then
			arg_26_0._registrationCancelled = false
		else
			arg_26_0._perController[arg_26_1].errorCode = var_26_1
		end
	end

	return var_26_0
end

function FenceOnlineServices.ShouldBlockforSummary(arg_27_0, arg_27_1)
	if not Engine.BECCFCBIAA("hasEverSeen_CODAccount", arg_27_1) and not Dvar.IBEGCHEFE("unattended") then
		arg_27_0._summaryController = arg_27_1

		if arg_27_0._summaryController == arg_27_0._registeringController then
			arg_27_0._registeringController = nil
		end

		return true
	end

	if Engine.BECCFCBIAA("hasEverSeen_CODAccountOTP", arg_27_1) == 0 and not Dvar.IBEGCHEFE("unattended") then
		arg_27_0._summaryController = arg_27_1

		if arg_27_0._summaryController == arg_27_0._registeringController then
			arg_27_0._registeringController = nil
		end

		return true
	end

	return false
end

function FenceOnlineServices.SetHasSeenCODAccount(arg_28_0, arg_28_1)
	Engine.DFJDIFJEGA("hasEverSeen_CODAccount", 1, arg_28_1)
	Engine.DAGFFDGFII("updategamerprofile " .. arg_28_1)
end

function FenceOnlineServices.SetHasSeenCODAccountOTP(arg_29_0, arg_29_1)
	Engine.DFJDIFJEGA("hasEverSeen_CODAccountOTP", 1, arg_29_1)
	Engine.DAGFFDGFII("updategamerprofile " .. arg_29_1)
end

function FenceOnlineServices.SetHasSeenSummary(arg_30_0)
	arg_30_0._openedSummary = false
	arg_30_0._summaryController = nil
end

function FenceOnlineServices.UpdateState(arg_31_0)
	assert(arg_31_0._state ~= LUI.Fence.STATE.fail)

	local var_31_0
	local var_31_1

	arg_31_0._queued = false
	arg_31_0._queued_retry = false

	if arg_31_0._autoRegistrationEnabled and arg_31_0._autoRegistrationState <= FenceOnlineServices.AUTO_REGISTRATION_STATE.IN_PROGRESS then
		arg_31_0._autoRegistrationState = AccountRegistration.BEJFHBHICG()
	end

	for iter_31_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_31_0) then
			local var_31_2 = arg_31_0._perController[iter_31_0].onlineUpsell == FenceOnlineServices.UPSELL_STATE.selling

			if Engine.EBCDFHECAC() then
				arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block

				break
			elseif var_31_2 then
				Fences.BHICCDHGCG(iter_31_0)

				arg_31_0._perController[iter_31_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.done
			end

			local var_31_3, var_31_4 = Fences.CCFEHFAFH(iter_31_0)

			if var_31_3 == FenceOnlineServices.CODE_STATE.inactive then
				Fences.BCIHDFJDEJ(iter_31_0)

				var_31_3, var_31_4 = Fences.CCFEHFAFH(iter_31_0)
			end

			if var_31_3 == FenceOnlineServices.CODE_STATE.failure then
				arg_31_0._perController[iter_31_0].errorCode = var_31_4

				local var_31_5 = (Engine.BAHIIBFDDG() or Engine.DEHJIFFID()) and var_31_4 == FenceOnlineServices.ERROR_CODES.MPNotAllowed
				local var_31_6 = false
				local var_31_7 = Engine.BEFACAIFDD() and var_31_4 == FenceOnlineServices.ERROR_CODES.MPNotAllowed
				local var_31_8 = arg_31_0._perController[iter_31_0].onlineUpsell == FenceOnlineServices.UPSELL_STATE.inactive

				if (var_31_5 or var_31_6 or var_31_7) and var_31_8 then
					if arg_31_0._noPremium then
						arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
					else
						arg_31_0._perController[iter_31_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.selling
						arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block

						Engine.DBHBIHJDEC(iter_31_0)

						break
					end
				elseif FenceOnlineServices.ShouldPS4FenceAllowUnderage(arg_31_0, var_31_4) then
					arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
				else
					arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
				end
			elseif var_31_3 == FenceOnlineServices.CODE_STATE.queued then
				arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
				arg_31_0._queued = true
			elseif var_31_3 == FenceOnlineServices.CODE_STATE.queued_retry then
				arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
				arg_31_0._queued_retry = true
			elseif var_31_3 == FenceOnlineServices.CODE_STATE.registering then
				arg_31_0._registrationState = AccountRegistration.BDAJEJBGF()

				if FenceOnlineServices.ShouldBlockForRegistration(arg_31_0, iter_31_0) then
					if FenceOnlineServices.ShouldAbortRegistration(arg_31_0, iter_31_0) then
						arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
					else
						arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
					end
				else
					arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
				end
			elseif var_31_3 ~= FenceOnlineServices.CODE_STATE.success then
				arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
			elseif FenceOnlineServices.ShouldBlockforSummary(arg_31_0, iter_31_0) then
				arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
			else
				arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
			end

			if arg_31_0._perController[iter_31_0].isCancelling then
				arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
				arg_31_0._perController[iter_31_0].errorCode = nil
			end
		else
			arg_31_0._perController[iter_31_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.inactive
			arg_31_0._perController[iter_31_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.inactive
			arg_31_0._perController[iter_31_0].isCancelling = false
			arg_31_0._perController[iter_31_0].errorCode = nil
		end
	end

	local var_31_9 = 0
	local var_31_10 = 0
	local var_31_11 = 0

	for iter_31_1 = 0, Engine.DCJGJDDEHE() - 1 do
		if arg_31_0._perController[iter_31_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.pass then
			var_31_9 = var_31_9 + 1
		end

		if arg_31_0._perController[iter_31_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.block then
			var_31_10 = var_31_10 + 1
		end

		if arg_31_0._perController[iter_31_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.fail then
			var_31_11 = var_31_11 + 1
		end
	end

	assert(var_31_11 + var_31_10 + var_31_9 > 0, "No active local clients")

	if var_31_11 > 0 then
		for iter_31_2 = 0, Engine.DCJGJDDEHE() - 1 do
			if arg_31_0._perController[iter_31_2].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.fail then
				local var_31_12 = arg_31_0._perController[iter_31_2].errorCode

				if var_31_9 > 0 and not Lobby.BJBBDIDHDA(iter_31_2) then
					DebugPrint("Controller #" .. tostring(iter_31_2) .. " does not meet requirements for online play. Making client inactive.")

					arg_31_0._state = LUI.Fence.STATE.block

					Engine.CIHFHAIIHC(iter_31_2)

					if var_31_12 then
						assert(type(var_31_12) == "number")
						assert(var_31_12 > 0 and var_31_12 <= FenceOnlineServices.ERROR_CODES.max)

						local var_31_13 = {
							errorCode = var_31_12,
							controllerIndex = iter_31_2
						}

						LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_error", false, iter_31_2, false, var_31_13, nil, false, true)
						Fences.IABFCACDD(iter_31_2)
					end

					break
				end

				arg_31_0._errorCode = var_31_12
				arg_31_0._state = LUI.Fence.STATE.fail

				break
			end
		end
	elseif var_31_10 > 0 then
		arg_31_0._state = LUI.Fence.STATE.block
	elseif var_31_9 > 0 then
		arg_31_0._state = LUI.Fence.STATE.pass
	else
		arg_31_0._state = LUI.Fence.STATE.block
	end

	if arg_31_0._state == LUI.Fence.STATE.block then
		local function var_31_14(arg_32_0)
			if arg_31_0._openedWaitPopup ~= nil and arg_31_0._openedWaitPopup ~= arg_32_0 then
				LUI.FlowManager.RequestLeaveMenuByName(arg_31_0._openedWaitPopup, true)

				arg_31_0._openedWaitPopup = nil

				return true
			elseif arg_31_0._openedWaitPopup == nil then
				return true
			end

			return false
		end

		if arg_31_0._queued then
			if var_31_14("popup_online_queue") then
				arg_31_0:OpenQueuedPopup()
			end
		elseif arg_31_0._queued_retry then
			if var_31_14("popup_online_queue_retry") then
				arg_31_0:OpenQueuedRetryPopup()
			end
		elseif var_31_14("popup_connecting") then
			arg_31_0:OpenConnectingPopup()
		end

		if (Engine.CHBHFFFIGH() or Engine.EAABDHIDFJ()) and not Engine.DFHAHCAEJG() then
			return
		end

		if arg_31_0._registeringController ~= nil then
			if not arg_31_0._autoRegistrationEnabled or arg_31_0._autoRegistrationState == FenceOnlineServices.AUTO_REGISTRATION_STATE.FAIL then
				if not arg_31_0._openedRegisteringPopup then
					arg_31_0:OpenRegisteringPopup()
				end

				local var_31_15 = CONDITIONS.IsMenuInStack("CODAccountLogin")

				if (arg_31_0._registrationState == FenceOnlineServices.REGISTRATION_STATE.OTP_NEEDED or arg_31_0._registrationState == FenceOnlineServices.REGISTRATION_STATE.OTP_THROTTLED) and var_31_15 and not arg_31_0._openedOTPPopup then
					arg_31_0:OpenOTPPopup()
					arg_31_0:SetHasSeenCODAccountOTP(arg_31_0._registeringController)
				end

				if arg_31_0._registrationState == FenceOnlineServices.REGISTRATION_STATE.REGISTERING and var_31_15 then
					if not arg_31_0._openedLoggingInPopup then
						LUI.FlowManager.RequestPopupMenu(unused, "CODAccountLoggingInPopup", true, arg_31_0._registeringController, false, {
							controllerIndex = arg_31_0._registeringController
						}, nil, true, true)

						arg_31_0._openedLoggingInPopup = true
					end
				elseif arg_31_0._openedLoggingInPopup then
					LUI.FlowManager.RequestLeaveMenuByName("CODAccountLoggingInPopup", true, true)

					arg_31_0._openedLoggingInPopup = false
				end
			end
		elseif arg_31_0._summaryController ~= nil then
			local var_31_16 = AccountRegistration ~= nil and not AccountRegistration.CEDFJJCJJD(arg_31_0._summaryController) and not Engine.DBAEJAHFGJ(arg_31_0._summaryController)

			if var_31_16 and not arg_31_0._hasSeenGreeting then
				arg_31_0._registeringController = arg_31_0._summaryController

				arg_31_0:OpenRegisteringPopup(var_31_16)

				return
			end

			arg_31_0:OpenSummaryPopup()
		end
	end
end

function PopupConnecting(arg_33_0, arg_33_1)
	assert(arg_33_1 and arg_33_1.onCancel)

	local var_33_0 = {
		controllerIndex = arg_33_1.controllerIndex,
		message = Engine.CBBHFCGDIC("XBOXLIVE/POPUP_CONNECTION"),
		cancel_func = arg_33_1.onCancel,
		displayWZWipSetup = arg_33_1.displayWZWipSetup
	}

	MenuUtils.SelectPopupImage(var_33_0)

	local var_33_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_33_0)

	var_33_1.id = "popup_connecting"

	return var_33_1
end

function PopupQueuedRetry(arg_34_0, arg_34_1)
	assert(arg_34_1 and arg_34_1.onCancel)

	local var_34_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/LOGIN_QUEUE_RETRY"),
		cancel_func = arg_34_1.onCancel
	}
	local var_34_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_34_0)

	var_34_1.id = "popup_connecting"

	return var_34_1
end

function GetFullErrorMessage(arg_35_0, arg_35_1)
	if arg_35_1 then
		return Engine.CBBHFCGDIC(arg_35_0)
	else
		return arg_35_0
	end
end

function PopupConnectingError(arg_36_0, arg_36_1)
	assert(arg_36_1 and arg_36_1.errorCode)

	local var_36_0
	local var_36_1 = arg_36_1.errorCode
	local var_36_2 = true

	if var_36_1 == FenceOnlineServices.ERROR_CODES.signedOutOfLive then
		local var_36_3 = Engine.EAABDHIDFJ() and "MSSTORE_PLATFORM/SIGNEDOUTOFLIVE_PCMS" or "XBOXLIVE/SIGNEDOUTOFLIVE"

		var_36_0 = CONDITIONS.IsLaze() and "ONLINE/ONLINE_SERVICES_ERROR" or var_36_3
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.guestWithoutSponsor then
		var_36_0 = "MPUI/GUEST_SPONSOR_ERROR"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed then
		var_36_0 = Engine.EAABDHIDFJ() and "MSSTORE_PLATFORM/MPNOTALLOWED" or "XBOXLIVE/MPNOTALLOWED"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.connecting then
		assert(false, "Unexpected error code")
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.signedOutOfSteamOnline then
		var_36_0 = "PLATFORM/STEAM_OFFLINE"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.networkConnection then
		var_36_0 = Engine.EAABDHIDFJ() and "MSSTORE_PLATFORM/NETCONNECTION" or "XBOXLIVE/NETCONNECTION"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
		var_36_0 = "PLATFORM/PSPLUS_REQUIRED"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.TURequired then
		var_36_0 = "PLATFORM/TU_REQUIRED"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.timeout then
		var_36_0 = "PLATFORM/ONLINE_TIMEOUT"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.onlineServices then
		var_36_0 = "ONLINE/ONLINE_SERVICES_ERROR"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.BattlenetConnected then
		var_36_0 = "XBOXLIVE/BATTLENET_CONNECTION_FAILED"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.LoginQueueClosed then
		var_36_0 = "ONLINE/LOGIN_QUEUE_CLOSED"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.AccountIsBanned then
		var_36_0 = "EXE/ONLINE_PERM_BAN_PLAYER_NO_NAME"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.AccountIsTempBanned then
		var_36_0 = "EXE/ONLINE_TEMP_BAN_PLAYER_NO_NAME"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.AccountIsInMaintenance then
		var_36_0 = "ONLINE/ONLINE_SERVICES_ERROR"
	elseif var_36_1 == FenceOnlineServices.ERROR_CODES.AccountIsMPOrCPBanned then
		local var_36_4 = Engine.JGAEIIIGD(arg_36_1.controllerIndex, 1)

		var_36_0 = Engine.CBBHFCGDIC("EXE/COD_ONLINE_TEMP_BAN_PLAYER", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_36_1.controllerIndex)))
		var_36_0 = var_36_0 .. "\n\n" .. var_36_4
		var_36_2 = false
	end

	assert(var_36_0)

	local var_36_5 = {
		darkenerAlpha = 1,
		controllerIndex = arg_36_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/CONNECTION_FAILED"),
		message = GetFullErrorMessage(var_36_0, var_36_2)
	}
	local var_36_6 = not Engine.BFDACIJIAD(arg_36_1.controllerIndex)

	if var_36_6 then
		var_36_5.message = Engine.CBBHFCGDIC("LUA_MENU/N_NEWLINE_M", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_36_1.controllerIndex)), var_36_5.message)
	end

	if var_36_6 or arg_36_1.noPremium then
		var_36_5.buttons = BOOT.GetOkayPopupButtons()
	else
		var_36_5.buttons = BOOT.GetRetryPopupButtons(arg_36_1.controllerIndex)
	end

	MenuUtils.SelectPopupImage(var_36_5)
	Engine.IBCDJDCJC()

	local var_36_7 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_36_5)

	var_36_7.id = "popup_connecting_error"

	return var_36_7
end

function PopupConnectingCancelled(arg_37_0, arg_37_1)
	local var_37_0 = {
		controllerIndex = arg_37_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/CONNECTION_FAILED"),
		message = Engine.CBBHFCGDIC("MENU/CONNECTION_CANCELLED"),
		buttons = BOOT.GetRetryPopupButtons(arg_37_1.controllerIndex)
	}

	MenuUtils.SelectPopupImage(var_37_0)

	local var_37_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_37_0)

	var_37_1.id = "popup_connecting_cancelled"

	return var_37_1
end

function PopupOnlineQueue(arg_38_0, arg_38_1)
	assert(arg_38_1)

	local var_38_0 = {
		message = Dvar.IBEGCHEFE("NKRLKLQLR") and Engine.CBBHFCGDIC("LUA_MENU_EAGLE/PACIFIC_MAP_BANNER_TITLE") or Engine.CBBHFCGDIC("LUA_MENU_MP/SERVER_QUEUE"),
		description = Dvar.IBEGCHEFE("NKRLKLQLR") and Engine.CBBHFCGDIC("LUA_MENU_EAGLE/PACIFIC_MAP_BANNER_DESC") or Engine.CBBHFCGDIC("LUA_MENU_MP/SERVER_QUEUE_MSG"),
		controllerIndex = arg_38_1.controllerIndex or Engine.IJEBHJIJF()
	}

	if Engine.CGABICJHAI() then
		var_38_0.buttons = {
			label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
			alignment = LUI.Alignment.Center,
			action = function()
				Engine.DJEDDFJEIG()
			end
		}
	end

	local var_38_1 = MenuBuilder.BuildRegisteredType("FenceOnlineQueueDialogPopupWithDescription", var_38_0)

	var_38_1.id = "popup_online_queue"

	return var_38_1
end

MenuBuilder.registerType("popup_online_queue", PopupOnlineQueue)
MenuBuilder.registerType("popup_online_queue_retry", PopupQueuedRetry)
MenuBuilder.registerType("popup_connecting", PopupConnecting)
MenuBuilder.registerType("popup_connecting_error", PopupConnectingError)
MenuBuilder.registerType("popup_connecting_cancelled", PopupConnectingCancelled)

FenceOnlineServicesPremium = LUI.Class(FenceOnlineServices)

function FenceOnlineServicesPremium.init(arg_40_0)
	FenceOnlineServicesPremium.super.init(arg_40_0, false)
end

LUI.Fence.Register("onlineServices", FenceOnlineServicesPremium)

FenceOnlineServicesNoPremium = LUI.Class(FenceOnlineServices)

function FenceOnlineServicesNoPremium.init(arg_41_0)
	FenceOnlineServicesNoPremium.super.init(arg_41_0, true)
end

LUI.Fence.Register("onlineServicesNoPremium", FenceOnlineServicesNoPremium)
LockTable(_M)
