module(..., package.seeall)

FenceBanned = LUI.Class(LUI.Fence)

function FenceBanned.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceBanned.Start(arg_2_0)
	arg_2_0._state = LUI.Fence.STATE.pass
end

function FenceBanned.Stop(arg_3_0)
	return
end

function FenceBanned.OnBackOut(arg_4_0)
	return
end

function FenceBanned.PostFail(arg_5_0)
	return
end

function FenceBanned.GetBannedController(arg_6_0)
	for iter_6_0 = 0, Engine.DCJGJDDEHE() - 1 do
		local var_6_0 = Engine.BBHAECABBD(iter_6_0)
		local var_6_1 = Fences.CHIHIIABIG(iter_6_0)

		if var_6_0 and var_6_1 ~= 0 then
			return iter_6_0
		end
	end

	return -1
end

function FenceBanned.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.pass
end

function PopupFenceBannedError(arg_8_0, arg_8_1)
	local var_8_0 = FenceBanned.GetBannedController()

	assert(var_8_0 ~= -1)
	Fences.DAGCHFFCBC()

	local var_8_1 = {
		controllerIndex = var_8_0,
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = Engine.CBBHFCGDIC("EXE/ONLINE_PERM_BAN_PLAYER_NO_NAME"),
		buttons = BOOT.GetRetryPopupButtons(var_8_0)
	}
	local var_8_2 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_8_1)

	var_8_2.id = "popup_banned_error"

	return var_8_2
end

LUI.Fence.Register("mpBanned", FenceBanned)
LockTable(_M)
