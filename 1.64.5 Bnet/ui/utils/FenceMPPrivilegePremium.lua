module(..., package.seeall)

FenceMPPrivilegePremium = LUI.Class(LUI.Fence)

function FenceMPPrivilegePremium.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceMPPrivilegePremium.Start(arg_2_0)
	DebugPrint("FenceMPPrivilegePremium.Start")

	arg_2_0._hasActiveClient = {}
	arg_2_0._privilegeData = {}
	arg_2_0._hasStartPrivilegeDeniedResolve = false
	arg_2_0._hasStartPrivilegeCheckFailedResolve = false

	for iter_2_0 = 0, Engine.DCJGJDDEHE() - 1 do
		arg_2_0._hasActiveClient[iter_2_0] = Engine.BBHAECABBD(iter_2_0)

		if arg_2_0._hasActiveClient[iter_2_0] then
			local var_2_0, var_2_1 = Engine.EBAAEFCBJA(iter_2_0, true)

			arg_2_0._privilegeData[iter_2_0] = {
				hasMPPrivilege = var_2_0,
				errorCode = var_2_1
			}
		end
	end
end

function FenceMPPrivilegePremium.Stop(arg_3_0)
	DebugPrint("FenceMPPrivilegePremium.Stop")

	arg_3_0._hasStartPrivilegeDeniedResolve = false
	arg_3_0._hasStartPrivilegeCheckFailedResolve = false
end

function FenceMPPrivilegePremium.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail then
		local var_4_0 = Engine.IJEBHJIJF()
		local var_4_1 = {
			controllerIndex = var_4_0
		}

		LUI.FlowManager.RequestPopupMenu(nil, "PopupMPPrivilegePremiumError", false, var_4_0, false, var_4_1, nil, false, true)
	end
end

function FenceMPPrivilegePremium.OnBackOut(arg_5_0)
	DebugPrint("FenceMPPrivilegePremium.OnBackOut")

	local var_5_0 = Engine.IJEBHJIJF()

	Engine.EBIDFIDHIE("xcancelinvitejoin", var_5_0)

	if Engine.DAFGFCFHJI and not Lobby.DFFFFJHCEH() then
		Engine.DAGFFDGFII("xstopparty")
	end

	if Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG() then
		Engine.DAGFFDGFII("xstopprivateparty")
		Engine.DAGFFDGFII("xstartprivateparty")
	end
end

function FenceMPPrivilegePremium.UpdateState(arg_6_0)
	assert(arg_6_0._state ~= LUI.Fence.STATE.fail)

	arg_6_0._state = LUI.Fence.STATE.pass

	for iter_6_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if arg_6_0._hasActiveClient[iter_6_0] and arg_6_0._privilegeData[iter_6_0] and arg_6_0._privilegeData[iter_6_0].hasMPPrivilege == false then
			arg_6_0._state = LUI.Fence.STATE.block

			if arg_6_0._privilegeData[iter_6_0].errorCode == LUI.FENCE_ONLINE_SERVICES_ERROR_CODES.PlatformXboxLivePrivilegeDenied then
				if not arg_6_0._hasStartPrivilegeDeniedResolve then
					arg_6_0._hasStartPrivilegeDeniedResolve = true

					DebugPrint("FenceMPPrivilegePremium.UpdateState - Trying to reolve privilege issue")
					Engine.IAHJEFHBI(iter_6_0, LUI.XBOX_PRIVILEGES.Multiplayer254)
				end

				if not Engine.DJDBGJAHDJ(iter_6_0, LUI.XBOX_PRIVILEGES.Multiplayer254) then
					local var_6_0, var_6_1 = Engine.EBAAEFCBJA(iter_6_0, false)

					arg_6_0._privilegeData[iter_6_0] = {
						hasMPPrivilege = var_6_0,
						errorCode = var_6_1
					}

					if arg_6_0._privilegeData[iter_6_0].hasMPPrivilege then
						arg_6_0._state = LUI.Fence.STATE.pass
					else
						arg_6_0._state = LUI.Fence.STATE.fail
					end
				else
					arg_6_0._state = LUI.Fence.STATE.block
				end
			elseif arg_6_0._privilegeData[iter_6_0].errorCode == LUI.FENCE_ONLINE_SERVICES_ERROR_CODES.PlatformXboxLivePrivilegeCheckFailed then
				if not arg_6_0._hasStartPrivilegeCheckFailedResolve then
					arg_6_0._hasStartPrivilegeCheckFailedResolve = true

					DebugPrint("FenceMPPrivilegeF2P.UpdateState - Trying to reolve privilege check failed issue")
					Engine.LUI_CoD_LuaCall_SystemUIForPrivilegeCheckFailedXboxStart(iter_6_0)
				end

				if not Engine.LUI_CoD_LuaCall_SystemUIForPrivilegeCheckFailedXboxIsPending(iter_6_0) then
					local var_6_2, var_6_3 = Engine.CFHECDBFGF(iter_6_0, true)

					arg_6_0._privilegeData[iter_6_0] = {
						hasMPPrivilege = var_6_2,
						errorCode = var_6_3
					}

					if arg_6_0._privilegeData[iter_6_0].hasMPPrivilege then
						arg_6_0._state = LUI.Fence.STATE.pass
					else
						arg_6_0._state = LUI.Fence.STATE.fail
					end
				else
					arg_6_0._state = LUI.Fence.STATE.block
				end
			end
		end
	end
end

function GetErrorMessageButtons(arg_7_0)
	local var_7_0 = {
		label = Engine.CBBHFCGDIC("MENU/OK"),
		action = function(arg_8_0, arg_8_1)
			LUI.FlowManager.RequestLeaveMenu(arg_8_0:GetCurrentMenu(), true)
		end
	}
	local var_7_1 = {
		label = Engine.CBBHFCGDIC("MENU/GO_OFFLINE"),
		action = function(arg_9_0, arg_9_1)
			Dvar.DHEGHJJJHI("splitscreen", false)
			Engine.CDGCBCBAJ("Going Offline", arg_7_0)
			Engine.DAGFFDGFII("xstopprivateparty")
			Engine.DAGFFDGFII("xstartprivateparty")
			LUI.FlowManager.RequestLeaveMenu(arg_9_0:GetCurrentMenu(), true)
			LUI.FlowManager.RequestAddMenu("MainMenuOffline", false, arg_7_0)
		end
	}

	return {
		var_7_0,
		var_7_1
	}
end

function PopupMPPrivilegePremiumError(arg_10_0, arg_10_1)
	assert(arg_10_1)

	local var_10_0 = {
		controllerIndex = arg_10_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/CONNECTION_FAILED"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/MPNOTALLOWED"),
		buttons = GetErrorMessageButtons(arg_10_1.controllerIndex)
	}
	local var_10_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_10_0)

	var_10_1.id = "PopupMPPrivilegePremiumError"

	return var_10_1
end

MenuBuilder.registerType("PopupMPPrivilegePremiumError", PopupMPPrivilegePremiumError)
LUI.Fence.Register("mpPrivilegePremium", FenceMPPrivilegePremium)
LockTable(_M)
