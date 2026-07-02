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
	max = 19,
	BattlenetConnected = 10,
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
			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountSummary", true, arg_12_0._summaryController, false, var_12_0, nil, true, true)
		else
			var_12_0.okButtonHandler()
		end
	end
end

function FenceOnlineServices.OpenConnectingPopup(arg_14_0)
	local var_14_0 = arg_14_0
	local var_14_1 = {
		displayWZWipSetup = true,
		disableIntro = false,
		onCancel = function(arg_15_0, arg_15_1)
			DebugPrint("Cancelling FenceOnlineServices")

			var_14_0._perController[arg_15_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting", false, nil, false, var_14_1, nil, true, true)

	arg_14_0._openedWaitPopup = "popup_connecting"
end

function FenceOnlineServices.OpenQueuedPopup(arg_16_0)
	local var_16_0 = arg_16_0
	local var_16_1 = {
		onCancel = function(arg_17_0, arg_17_1)
			var_16_0._perController[arg_17_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_online_queue", false, nil, false, var_16_1, nil, true, true)

	arg_16_0._openedWaitPopup = "popup_online_queue"
end

function FenceOnlineServices.OpenQueuedRetryPopup(arg_18_0)
	local var_18_0 = arg_18_0
	local var_18_1 = {
		onCancel = function(arg_19_0, arg_19_1)
			var_18_0._perController[arg_19_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_online_queue_retry", false, nil, false, var_18_1, nil, true, true)

	arg_18_0._openedWaitPopup = "popup_online_queue_retry"
end

function FenceOnlineServices.OnBackOut(arg_20_0)
	DebugPrint("FenceOnlineServices.OnBackOut")

	for iter_20_0 = 0, Engine.DCJGJDDEHE() - 1 do
		Fences.BHICCDHGCG(iter_20_0)
	end

	if not arg_20_0._noPremium then
		Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
		Engine.BGIDADECDJ()
		Engine.DAGFFDGFII("xstopparty 0")
		Engine.DAGFFDGFII("xstopprivateparty 0")
	end
end

function FenceOnlineServices.GetErrorString(arg_21_0, arg_21_1)
	local var_21_0 = Fences.GetStatusOnFailure(arg_21_0, FenceOnlineServices.CODE_FENCE)

	if var_21_0 then
		return var_21_0
	end

	if arg_21_1 == FenceOnlineServices.ERROR_CODES.networkConnection then
		var_21_0 = "XBOXLIVE/NETCONNECTION"
	elseif arg_21_1 == FenceOnlineServices.ERROR_CODES.signedOutOfSteamOnline then
		var_21_0 = "PLATFORM/STEAM_OFFLINE"
	elseif arg_21_1 == FenceOnlineServices.ERROR_CODES.BattlenetConnected then
		var_21_0 = "XBOXLIVE/BATTLENET_CONNECTION_FAILED"
	elseif arg_21_1 == FenceOnlineServices.ERROR_CODES.LoginQueueClosed then
		var_21_0 = "ONLINE/LOGIN_QUEUE_CLOSED"
	elseif arg_21_1 == FenceOnlineServices.ERROR_CODES.AccountIsBanned then
		var_21_0 = "EXE/ONLINE_PERM_BAN_PLAYER_NO_NAME"
	elseif arg_21_1 == FenceOnlineServices.ERROR_CODES.AccountIsTempBanned then
		var_21_0 = "EXE/ONLINE_TEMP_BAN_PLAYER_NO_NAME"
	elseif arg_21_1 == FenceOnlineServices.ERROR_CODES.AccountIsInMaintenance then
		var_21_0 = "ONLINE/ONLINE_SERVICES_ERROR"
	elseif arg_21_1 == FenceOnlineServices.ERROR_CODES.AccountIsMPOrCPBanned then
		local var_21_1 = Engine.JGAEIIIGD(arg_21_0, 1)

		var_21_0 = Engine.CBBHFCGDIC("EXE/COD_ONLINE_TEMP_BAN_PLAYER", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_21_0)))
		var_21_0 = var_21_0 .. "\n\n" .. var_21_1
	end

	assert(var_21_0)

	return Engine.CBBHFCGDIC(var_21_0)
end

function FenceOnlineServices.PostFail(arg_22_0)
	if arg_22_0._state == LUI.Fence.STATE.fail then
		local var_22_0 = Engine.IJEBHJIJF()
		local var_22_1 = {
			controllerIndex = var_22_0,
			noPremium = arg_22_0._noPremium
		}

		if arg_22_0._errorCode then
			var_22_1.errorCode = arg_22_0._errorCode

			LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_error", false, var_22_0, false, var_22_1, nil, false, false)
			Fences.IABFCACDD(var_22_0)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_cancelled", false, var_22_0, false, var_22_1, nil, false, false)
		end
	end
end

function FenceOnlineServices.ShouldPS4FenceAllowUnderage(arg_23_0, arg_23_1)
	if arg_23_0._noPremium and Engine.CIEGIACHAE() and arg_23_1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed then
		return true
	else
		return false
	end
end

function FenceOnlineServices.ShouldBlockForRegistration(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0._registeringController ~= nil
	local var_24_1 = AccountRegistration.GGBDJFJD() == arg_24_1

	if var_24_0 or var_24_1 then
		if arg_24_0._registeringController == nil and not arg_24_0._registrationCancelled then
			arg_24_0._registeringController = arg_24_1
		end

		return true
	end

	return false
end

function FenceOnlineServices.ShouldAbortRegistration(arg_25_0, arg_25_1)
	local var_25_0 = false
	local var_25_1

	if Engine.DBFCJBDJEC() then
		var_25_0 = Engine.BCCGADID() == BattleNetAuthState.ERROR or arg_25_0._registrationCancelled
		var_25_1 = FenceOnlineServices.ERROR_CODES.BattlenetConnected
	else
		var_25_0 = not Engine.BACCCIHGDG() or arg_25_0._registrationCancelled
		var_25_1 = FenceOnlineServices.ERROR_CODES.networkConnection
	end

	if var_25_0 then
		AccountRegistration.DEEHFICICB(arg_25_1)

		if arg_25_0._registrationCancelled then
			arg_25_0._registrationCancelled = false
		else
			arg_25_0._perController[arg_25_1].errorCode = var_25_1
		end
	end

	return var_25_0
end

function FenceOnlineServices.ShouldBlockforSummary(arg_26_0, arg_26_1)
	if not Engine.BECCFCBIAA("hasEverSeen_CODAccount", arg_26_1) and not Dvar.IBEGCHEFE("unattended") then
		arg_26_0._summaryController = arg_26_1

		if arg_26_0._summaryController == arg_26_0._registeringController then
			arg_26_0._registeringController = nil
		end

		return true
	end

	if Engine.BECCFCBIAA("hasEverSeen_CODAccountOTP", arg_26_1) == 0 and not Dvar.IBEGCHEFE("unattended") then
		arg_26_0._summaryController = arg_26_1

		if arg_26_0._summaryController == arg_26_0._registeringController then
			arg_26_0._registeringController = nil
		end

		return true
	end

	return false
end

function FenceOnlineServices.SetHasSeenCODAccount(arg_27_0, arg_27_1)
	Engine.DFJDIFJEGA("hasEverSeen_CODAccount", 1, arg_27_1)
	Engine.DAGFFDGFII("updategamerprofile " .. arg_27_1)
end

function FenceOnlineServices.SetHasSeenCODAccountOTP(arg_28_0, arg_28_1)
	Engine.DFJDIFJEGA("hasEverSeen_CODAccountOTP", 1, arg_28_1)
	Engine.DAGFFDGFII("updategamerprofile " .. arg_28_1)
end

function FenceOnlineServices.SetHasSeenSummary(arg_29_0)
	arg_29_0._openedSummary = false
	arg_29_0._summaryController = nil
end

function FenceOnlineServices.UpdateState(arg_30_0)
	assert(arg_30_0._state ~= LUI.Fence.STATE.fail)

	local var_30_0
	local var_30_1

	arg_30_0._queued = false
	arg_30_0._queued_retry = false

	if arg_30_0._autoRegistrationEnabled and arg_30_0._autoRegistrationState <= FenceOnlineServices.AUTO_REGISTRATION_STATE.IN_PROGRESS then
		arg_30_0._autoRegistrationState = AccountRegistration.BEJFHBHICG()
	end

	for iter_30_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_30_0) then
			local var_30_2 = arg_30_0._perController[iter_30_0].onlineUpsell == FenceOnlineServices.UPSELL_STATE.selling

			if Engine.EBCDFHECAC() then
				arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block

				break
			elseif var_30_2 then
				Fences.BHICCDHGCG(iter_30_0)

				arg_30_0._perController[iter_30_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.done
			end

			local var_30_3, var_30_4 = Fences.CCFEHFAFH(iter_30_0)

			if var_30_3 == FenceOnlineServices.CODE_STATE.inactive then
				Fences.BCIHDFJDEJ(iter_30_0)

				var_30_3, var_30_4 = Fences.CCFEHFAFH(iter_30_0)
			end

			if var_30_3 == FenceOnlineServices.CODE_STATE.failure then
				arg_30_0._perController[iter_30_0].errorCode = var_30_4

				local var_30_5 = (Engine.BAHIIBFDDG() or Engine.DEHJIFFID()) and var_30_4 == FenceOnlineServices.ERROR_CODES.MPNotAllowed
				local var_30_6 = false
				local var_30_7 = Engine.BEFACAIFDD() and var_30_4 == FenceOnlineServices.ERROR_CODES.MPNotAllowed
				local var_30_8 = arg_30_0._perController[iter_30_0].onlineUpsell == FenceOnlineServices.UPSELL_STATE.inactive

				if (var_30_5 or var_30_6 or var_30_7) and var_30_8 then
					if arg_30_0._noPremium then
						arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
					else
						arg_30_0._perController[iter_30_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.selling
						arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block

						Engine.DBHBIHJDEC(iter_30_0)

						break
					end
				elseif FenceOnlineServices.ShouldPS4FenceAllowUnderage(arg_30_0, var_30_4) then
					arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
				else
					arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
				end
			elseif var_30_3 == FenceOnlineServices.CODE_STATE.queued then
				arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
				arg_30_0._queued = true
			elseif var_30_3 == FenceOnlineServices.CODE_STATE.queued_retry then
				arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
				arg_30_0._queued_retry = true
			elseif var_30_3 == FenceOnlineServices.CODE_STATE.registering then
				arg_30_0._registrationState = AccountRegistration.BDAJEJBGF()

				if FenceOnlineServices.ShouldBlockForRegistration(arg_30_0, iter_30_0) then
					if FenceOnlineServices.ShouldAbortRegistration(arg_30_0, iter_30_0) then
						arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
					else
						arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
					end
				else
					arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
				end
			elseif var_30_3 ~= FenceOnlineServices.CODE_STATE.success then
				arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
			elseif FenceOnlineServices.ShouldBlockforSummary(arg_30_0, iter_30_0) then
				arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
			else
				arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
			end

			if arg_30_0._perController[iter_30_0].isCancelling then
				arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
				arg_30_0._perController[iter_30_0].errorCode = nil
			end
		else
			arg_30_0._perController[iter_30_0].onlineUpsell = FenceOnlineServices.UPSELL_STATE.inactive
			arg_30_0._perController[iter_30_0].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.inactive
			arg_30_0._perController[iter_30_0].isCancelling = false
			arg_30_0._perController[iter_30_0].errorCode = nil
		end
	end

	local var_30_9 = 0
	local var_30_10 = 0
	local var_30_11 = 0

	for iter_30_1 = 0, Engine.DCJGJDDEHE() - 1 do
		if arg_30_0._perController[iter_30_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.pass then
			var_30_9 = var_30_9 + 1
		end

		if arg_30_0._perController[iter_30_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.block then
			var_30_10 = var_30_10 + 1
		end

		if arg_30_0._perController[iter_30_1].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.fail then
			var_30_11 = var_30_11 + 1
		end
	end

	assert(var_30_11 + var_30_10 + var_30_9 > 0, "No active local clients")

	if var_30_11 > 0 then
		for iter_30_2 = 0, Engine.DCJGJDDEHE() - 1 do
			if arg_30_0._perController[iter_30_2].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.fail then
				local var_30_12 = arg_30_0._perController[iter_30_2].errorCode

				if var_30_9 > 0 and not Lobby.BJBBDIDHDA(iter_30_2) then
					DebugPrint("Controller #" .. tostring(iter_30_2) .. " does not meet requirements for online play. Making client inactive.")

					arg_30_0._state = LUI.Fence.STATE.block

					Engine.CIHFHAIIHC(iter_30_2)

					if var_30_12 then
						assert(type(var_30_12) == "number")
						assert(var_30_12 > 0 and var_30_12 <= FenceOnlineServices.ERROR_CODES.max)

						local var_30_13 = {
							errorCode = var_30_12,
							controllerIndex = iter_30_2
						}

						LUI.FlowManager.RequestPopupMenu(nil, "popup_connecting_error", false, iter_30_2, false, var_30_13, nil, false, true)
						Fences.IABFCACDD(iter_30_2)
					end

					break
				end

				arg_30_0._errorCode = var_30_12
				arg_30_0._state = LUI.Fence.STATE.fail

				break
			end
		end
	elseif var_30_10 > 0 then
		arg_30_0._state = LUI.Fence.STATE.block
	elseif var_30_9 > 0 then
		arg_30_0._state = LUI.Fence.STATE.pass
	else
		arg_30_0._state = LUI.Fence.STATE.block
	end

	if arg_30_0._state == LUI.Fence.STATE.block then
		local function var_30_14(arg_31_0)
			if arg_30_0._openedWaitPopup ~= nil and arg_30_0._openedWaitPopup ~= arg_31_0 then
				LUI.FlowManager.RequestLeaveMenuByName(arg_30_0._openedWaitPopup, true)

				arg_30_0._openedWaitPopup = nil

				return true
			elseif arg_30_0._openedWaitPopup == nil then
				return true
			end

			return false
		end

		if arg_30_0._queued then
			if var_30_14("popup_online_queue") then
				arg_30_0:OpenQueuedPopup()
			end
		elseif arg_30_0._queued_retry then
			if var_30_14("popup_online_queue_retry") then
				arg_30_0:OpenQueuedRetryPopup()
			end
		elseif var_30_14("popup_connecting") then
			arg_30_0:OpenConnectingPopup()
		end

		if arg_30_0._registeringController ~= nil then
			if not arg_30_0._autoRegistrationEnabled or arg_30_0._autoRegistrationState == FenceOnlineServices.AUTO_REGISTRATION_STATE.FAIL then
				if not arg_30_0._openedRegisteringPopup then
					arg_30_0:OpenRegisteringPopup()
				end

				local var_30_15 = CONDITIONS.IsMenuInStack("CODAccountLogin")

				if (arg_30_0._registrationState == FenceOnlineServices.REGISTRATION_STATE.OTP_NEEDED or arg_30_0._registrationState == FenceOnlineServices.REGISTRATION_STATE.OTP_THROTTLED) and var_30_15 and not arg_30_0._openedOTPPopup then
					arg_30_0:OpenOTPPopup()
					arg_30_0:SetHasSeenCODAccountOTP(arg_30_0._registeringController)
				end

				if arg_30_0._registrationState == FenceOnlineServices.REGISTRATION_STATE.REGISTERING and var_30_15 then
					if not arg_30_0._openedLoggingInPopup then
						LUI.FlowManager.RequestPopupMenu(unused, "CODAccountLoggingInPopup", true, arg_30_0._registeringController, false, {
							controllerIndex = arg_30_0._registeringController
						}, nil, true, true)

						arg_30_0._openedLoggingInPopup = true
					end
				elseif arg_30_0._openedLoggingInPopup then
					LUI.FlowManager.RequestLeaveMenuByName("CODAccountLoggingInPopup", true, true)

					arg_30_0._openedLoggingInPopup = false
				end
			end
		elseif arg_30_0._summaryController ~= nil then
			local var_30_16 = AccountRegistration ~= nil and not AccountRegistration.CEDFJJCJJD(arg_30_0._summaryController) and not Engine.DBAEJAHFGJ(arg_30_0._summaryController)

			if var_30_16 and not arg_30_0._hasSeenGreeting then
				arg_30_0._registeringController = arg_30_0._summaryController

				arg_30_0:OpenRegisteringPopup(var_30_16)

				return
			end

			arg_30_0:OpenSummaryPopup()
		end
	end
end

function PopupConnecting(arg_32_0, arg_32_1)
	assert(arg_32_1 and arg_32_1.onCancel)

	local var_32_0 = {
		message = Engine.CBBHFCGDIC("XBOXLIVE/POPUP_CONNECTION"),
		cancel_func = arg_32_1.onCancel,
		displayWZWipSetup = arg_32_1.displayWZWipSetup
	}

	if Engine.CJJAFGIFAC(arg_32_1.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_32_1.controllerIndex) then
			var_32_0.imageOverride = "logo_wz_shadow"
		end
	else
		var_32_0.imageOverride = "logo_cod_warzone_mw_shadow"
	end

	local var_32_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_32_0)

	var_32_1.id = "popup_connecting"

	return var_32_1
end

function PopupQueuedRetry(arg_33_0, arg_33_1)
	assert(arg_33_1 and arg_33_1.onCancel)

	local var_33_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/LOGIN_QUEUE_RETRY"),
		cancel_func = arg_33_1.onCancel
	}
	local var_33_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_33_0)

	var_33_1.id = "popup_connecting"

	return var_33_1
end

function GetFullErrorMessage(arg_34_0, arg_34_1)
	if arg_34_1 then
		return Engine.CBBHFCGDIC(arg_34_0)
	else
		return arg_34_0
	end
end

function PopupConnectingError(arg_35_0, arg_35_1)
	assert(arg_35_1 and arg_35_1.errorCode)

	local var_35_0
	local var_35_1 = arg_35_1.errorCode
	local var_35_2 = true

	if var_35_1 == FenceOnlineServices.ERROR_CODES.signedOutOfLive then
		var_35_0 = "XBOXLIVE/SIGNEDOUTOFLIVE"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.guestWithoutSponsor then
		var_35_0 = "MPUI/GUEST_SPONSOR_ERROR"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed then
		var_35_0 = "XBOXLIVE/MPNOTALLOWED"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.connecting then
		assert(false, "Unexpected error code")
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.signedOutOfSteamOnline then
		var_35_0 = "PLATFORM/STEAM_OFFLINE"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.networkConnection then
		var_35_0 = "XBOXLIVE/NETCONNECTION"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
		var_35_0 = "PLATFORM/PSPLUS_REQUIRED"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.TURequired then
		var_35_0 = "PLATFORM/TU_REQUIRED"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.timeout then
		var_35_0 = "PLATFORM/ONLINE_TIMEOUT"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.onlineServices then
		var_35_0 = "ONLINE/ONLINE_SERVICES_ERROR"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.BattlenetConnected then
		var_35_0 = "XBOXLIVE/BATTLENET_CONNECTION_FAILED"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.LoginQueueClosed then
		var_35_0 = "ONLINE/LOGIN_QUEUE_CLOSED"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.AccountIsBanned then
		var_35_0 = "EXE/ONLINE_PERM_BAN_PLAYER_NO_NAME"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.AccountIsTempBanned then
		var_35_0 = "EXE/ONLINE_TEMP_BAN_PLAYER_NO_NAME"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.AccountIsInMaintenance then
		var_35_0 = "ONLINE/ONLINE_SERVICES_ERROR"
	elseif var_35_1 == FenceOnlineServices.ERROR_CODES.AccountIsMPOrCPBanned then
		local var_35_3 = Engine.JGAEIIIGD(arg_35_1.controllerIndex, 1)

		var_35_0 = Engine.CBBHFCGDIC("EXE/COD_ONLINE_TEMP_BAN_PLAYER", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_35_1.controllerIndex)))
		var_35_0 = var_35_0 .. "\n\n" .. var_35_3
		var_35_2 = false
	end

	assert(var_35_0)

	local var_35_4 = {
		darkenerAlpha = 1,
		controllerIndex = arg_35_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/CONNECTION_FAILED"),
		message = GetFullErrorMessage(var_35_0, var_35_2)
	}
	local var_35_5 = not Engine.BFDACIJIAD(arg_35_1.controllerIndex)

	if var_35_5 then
		var_35_4.message = Engine.CBBHFCGDIC("LUA_MENU/N_NEWLINE_M", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_35_1.controllerIndex)), var_35_4.message)
	end

	if var_35_5 or arg_35_1.noPremium then
		var_35_4.buttons = BOOT.GetOkayPopupButtons()
	else
		var_35_4.buttons = BOOT.GetRetryPopupButtons(arg_35_1.controllerIndex)
	end

	if Engine.CJJAFGIFAC(arg_35_1.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_35_1.controllerIndex) then
			var_35_4.imageOverride = "logo_wz_shadow"
		end
	else
		var_35_4.imageOverride = "logo_cod_warzone_mw_shadow"
	end

	local var_35_6 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_35_4)

	var_35_6.id = "popup_connecting_error"

	return var_35_6
end

function PopupConnectingCancelled(arg_36_0, arg_36_1)
	local var_36_0 = {
		controllerIndex = arg_36_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/CONNECTION_FAILED"),
		message = Engine.CBBHFCGDIC("MENU/CONNECTION_CANCELLED"),
		buttons = BOOT.GetRetryPopupButtons(arg_36_1.controllerIndex)
	}

	if Engine.CJJAFGIFAC(arg_36_1.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_36_1.controllerIndex) then
			var_36_0.imageOverride = "logo_wz_shadow"
		end
	else
		var_36_0.imageOverride = "logo_cod_warzone_mw_shadow"
	end

	local var_36_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_36_0)

	var_36_1.id = "popup_connecting_cancelled"

	return var_36_1
end

function PopupOnlineQueue(arg_37_0, arg_37_1)
	assert(arg_37_1)

	local var_37_0 = {
		message = Dvar.IBEGCHEFE("NKRLKLQLR") and Engine.CBBHFCGDIC("LUA_MENU_EAGLE/PACIFIC_MAP_BANNER_TITLE") or Engine.CBBHFCGDIC("LUA_MENU_MP/SERVER_QUEUE"),
		description = Dvar.IBEGCHEFE("NKRLKLQLR") and Engine.CBBHFCGDIC("LUA_MENU_EAGLE/PACIFIC_MAP_BANNER_DESC") or Engine.CBBHFCGDIC("LUA_MENU_MP/SERVER_QUEUE_MSG"),
		controllerIndex = arg_37_1.controllerIndex or Engine.IJEBHJIJF()
	}

	if Engine.CGABICJHAI() then
		var_37_0.buttons = {
			label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
			alignment = LUI.Alignment.Center,
			action = function()
				Engine.DJEDDFJEIG()
			end
		}
	end

	local var_37_1 = MenuBuilder.BuildRegisteredType("FenceOnlineQueueDialogPopupWithDescription", var_37_0)

	var_37_1.id = "popup_online_queue"

	return var_37_1
end

MenuBuilder.registerType("popup_online_queue", PopupOnlineQueue)
MenuBuilder.registerType("popup_online_queue_retry", PopupQueuedRetry)
MenuBuilder.registerType("popup_connecting", PopupConnecting)
MenuBuilder.registerType("popup_connecting_error", PopupConnectingError)
MenuBuilder.registerType("popup_connecting_cancelled", PopupConnectingCancelled)

FenceOnlineServicesPremium = LUI.Class(FenceOnlineServices)

function FenceOnlineServicesPremium.init(arg_39_0)
	FenceOnlineServicesPremium.super.init(arg_39_0, false)
end

LUI.Fence.Register("onlineServices", FenceOnlineServicesPremium)

FenceOnlineServicesNoPremium = LUI.Class(FenceOnlineServices)

function FenceOnlineServicesNoPremium.init(arg_40_0)
	FenceOnlineServicesNoPremium.super.init(arg_40_0, true)
end

LUI.Fence.Register("onlineServicesNoPremium", FenceOnlineServicesNoPremium)
LockTable(_M)
