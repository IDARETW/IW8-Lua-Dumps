module(..., package.seeall)

FenceNetworking = LUI.Class(LUI.Fence)

function FenceNetworking.init(arg_1_0)
	LUI.Fence.init(arg_1_0)

	arg_1_0._isShowingBlockingPopup = false
end

function FenceNetworking.Start(arg_2_0)
	DebugPrint("FenceNetworking.Start")

	if arg_2_0._isShowingBlockingPopup then
		LUI.FlowManager.RequestLeaveMenuByName("popup_offline_connecting", true)

		arg_2_0._isShowingBlockingPopup = false
	end
end

function FenceNetworking.Stop(arg_3_0)
	DebugPrint("FenceNetworking.Stop")

	if arg_3_0._isShowingBlockingPopup then
		DebugPrint("FenceNetworking.Stop closing blocking popup ")
		LUI.FlowManager.RequestLeaveMenuByName("popup_offline_connecting", true)

		arg_3_0._isShowingBlockingPopup = false
	end
end

function FenceNetworking.UpdateState(arg_4_0)
	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	arg_4_0._state = LUI.Fence.STATE.pass

	if not Fences.DEDGHGJAJC() then
		arg_4_0._state = LUI.Fence.STATE.block

		if not arg_4_0._isShowingBlockingPopup then
			arg_4_0._isShowingBlockingPopup = true

			LUI.FlowManager.RequestPopupMenu(nil, "popup_offline_connecting", false, nil, false, nil, nil, true, true)
		end
	end
end

function PopupOfflineConnecting(arg_5_0)
	local var_5_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_CONNECTING_OFFLINE")
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_5_0)

	var_5_1.id = "popup_offline_connecting"

	return var_5_1
end

MenuBuilder.registerType("popup_offline_connecting", PopupOfflineConnecting)
LUI.Fence.Register("networking", FenceNetworking)
LockTable(_M)
