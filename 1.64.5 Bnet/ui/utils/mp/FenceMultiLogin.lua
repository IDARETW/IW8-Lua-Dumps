module(..., package.seeall)

FenceMultiLogin = LUI.Class(LUI.Fence)

function FenceMultiLogin.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceMultiLogin.Start(arg_2_0)
	arg_2_0._state = LUI.Fence.STATE.pass
end

function FenceMultiLogin.Stop(arg_3_0)
	return
end

function FenceMultiLogin.OnBackOut(arg_4_0)
	return
end

function FenceMultiLogin.PostFail(arg_5_0)
	if arg_5_0._state == LUI.Fence.STATE.fail then
		LUI.FlowManager.RequestPopupMenu(nil, "popup_multi_login_error", false, nil, false, nil, nil, true, true)
	end
end

function FenceMultiLogin.UpdateState(arg_6_0)
	assert(arg_6_0._state ~= LUI.Fence.STATE.fail)

	arg_6_0._state = LUI.Fence.STATE.pass

	if Engine.EAAHGICFBD() and Fences.DAGCJDHEGH() then
		arg_6_0._state = LUI.Fence.STATE.fail
	end
end

function PopupFenceMultiLoginError(arg_7_0, arg_7_1)
	local var_7_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message_text = Engine.CBBHFCGDIC("EXE/DEMONWARE_MULTIPLE_LOGINS_GENERIC")
	}

	if Engine.CGABICJHAI() then
		var_7_0.button_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP")

		function var_7_0.confirmation_action(arg_8_0, arg_8_1)
			Engine.DJEDDFJEIG()
		end
	end

	local var_7_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_7_0)

	var_7_1.id = "popup_multi_login_error"

	return var_7_1
end

MenuBuilder.registerType("popup_multi_login_error", PopupFenceMultiLoginError)
LUI.Fence.Register("multiLogin", FenceMultiLogin)
LockTable(_M)
