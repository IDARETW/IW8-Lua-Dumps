module(..., package.seeall)

FenceFreeToPlayPrivilege = LUI.Class(LUI.Fence)

function GetErrorMessageButtons(arg_1_0)
	local var_1_0 = {
		label = Engine.CBBHFCGDIC("MENU/GO_OFFLINE"),
		action = function(arg_2_0, arg_2_1)
			Engine.CDGCBCBAJ("Going Offline", arg_1_0)
			LUI.FlowManager.RequestLeaveMenu(arg_2_0:GetCurrentMenu(), true)
			LUI.FlowManager.RequestAddMenu("MainMenuOffline", false, arg_1_0)
		end
	}
	local var_1_1 = {
		label = Engine.CBBHFCGDIC("MENU/RETRY"),
		action = function(arg_3_0, arg_3_1)
			Engine.CDGCBCBAJ("Retry accessing MainMenu", arg_1_0)
			LUI.FlowManager.RequestLeaveMenu(arg_3_0:GetCurrentMenu(), true)
			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_1_0)
		end
	}
	local var_1_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
		action = function(arg_4_0, arg_4_1)
			Engine.DJEDDFJEIG()
		end
	}

	if CONDITIONS.IsPC() then
		return {
			var_1_0,
			var_1_1
		}
	else
		return {
			var_1_0,
			var_1_1
		}
	end
end

function popup_missing_online_privilege(arg_5_0, arg_5_1)
	local var_5_0 = {
		cancelClosesPopup = false,
		buttonsClosePopup = false,
		controllerIndex = arg_5_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.EAABDHIDFJ() and Engine.CBBHFCGDIC("MSSTORE_PLATFORM/MPNOTALLOWED") or Engine.CBBHFCGDIC("XBOXLIVE/MPNOTALLOWED"),
		buttons = GetErrorMessageButtons(arg_5_1.controllerIndex)
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_5_0)

	var_5_1.id = "popup_missing_online_privilege"

	return var_5_1
end

function FenceFreeToPlayPrivilege.PostFail(arg_6_0)
	if arg_6_0._state == LUI.Fence.STATE.fail then
		LUI.FlowManager.RequestPopupMenu(nil, "popup_missing_online_privilege", false, nil, false, nil, nil, false, true)
	end
end

function FenceFreeToPlayPrivilege.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.pass

	if not Engine.EAABDHIDFJ() then
		return
	end

	arg_7_0._state = FencePrivilegeUtils.ProcessPrivilegeState(arg_7_0, MP_COMMON.LivePrivileges.LIVE_PRIVILEGE_INDEX_SESSIONS, true)
end

MenuBuilder.registerType("popup_missing_online_privilege", popup_missing_online_privilege)
LUI.Fence.Register("freeToPlayPrivilege", FenceFreeToPlayPrivilege)
LockTable(_M)
