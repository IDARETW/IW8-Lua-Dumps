module(..., package.seeall)

FencePlatformServices = LUI.Class(LUI.Fence)
FencePlatformServices.BattleNetFenceState = {
	pass = 1,
	block = 0,
	fail = 2
}

function FencePlatformServices.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FencePlatformServices.Start(arg_2_0)
	DebugPrint("FencePlatformServices.Start")
end

function FencePlatformServices.Stop(arg_3_0)
	DebugPrint("FencePlatformServices.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("popup_waiting_for_platform_services", true)

	arg_3_0._openedWaitPopup = false
end

function FencePlatformServices.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail and arg_4_0._errorCode then
		local var_4_0 = Engine.IJEBHJIJF()

		LUI.FlowManager.RequestAddMenu("MainMenuOffline", true, var_4_0)
		LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error", false, nil, false, {
			errorCode = arg_4_0._errorCode
		}, nil, false, true)
	end
end

function FencePlatformServices.OpenWaitPopup(arg_5_0)
	local var_5_0 = {
		onCancel = function(arg_6_0, arg_6_1)
			arg_6_0._state = LUI.Fence.STATE.fail
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_waiting_for_platform_services", false, nil, false, var_5_0, nil, true, true)

	arg_5_0._openedWaitPopup = true
end

function FencePlatformServices.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.pass

	if Engine.DBFCJBDJEC() then
		local var_7_0 = 0
		local var_7_1 = Engine.BAAABFICDA(0)

		if var_7_1 == FencePlatformServices.BattleNetFenceState.block then
			arg_7_0._state = LUI.Fence.STATE.block
		elseif var_7_1 == FencePlatformServices.BattleNetFenceState.pass then
			arg_7_0._state = LUI.Fence.STATE.pass
		else
			arg_7_0._state = LUI.Fence.STATE.fail
			arg_7_0._errorCode = 0
		end
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedWaitPopup then
		arg_7_0:OpenWaitPopup()
	end
end

function PopupWaitingForPlatformServices(arg_8_0, arg_8_1)
	assert(arg_8_1 and arg_8_1.onCancel)

	local var_8_0 = {
		cancel_func = arg_8_1.onCancel
	}

	if Engine.DBFCJBDJEC() then
		var_8_0.message = Engine.CBBHFCGDIC("XBOXLIVE/CONNECTING_TO_BATTLENET")
	elseif Engine.EAABDHIDFJ() then
		var_8_0.message = Engine.CBBHFCGDIC("MSSTORE_PLATFORM/POPUP_CONNECTION")
	else
		var_8_0.message = Engine.CBBHFCGDIC("XBOXLIVE/POPUP_CONNECTION")
	end

	local var_8_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_8_0)

	var_8_1.id = "popup_waiting_for_platform_services"

	return var_8_1
end

MenuBuilder.registerType("popup_waiting_for_platform_services", PopupWaitingForPlatformServices)
LUI.Fence.Register("platformServices", FencePlatformServices)
LockTable(_M)
