module(..., package.seeall)

FenceOwnershipStatus = LUI.Class(LUI.Fence)

function FenceOwnershipStatus.init(arg_1_0)
	LUI.Fence.init(arg_1_0)

	arg_1_0._isShowingBlockingPopup = false
	arg_1_0._shouldBlockWhileCheckingOwnershipStatus = true
end

function FenceOwnershipStatus.Start(arg_2_0)
	DebugPrint("FenceOwnershipStatus.Start")

	if arg_2_0._isShowingBlockingPopup then
		LUI.FlowManager.RequestLeaveMenuByName("popup_checking_ownership_status", true)

		arg_2_0._isShowingBlockingPopup = false
	end

	arg_2_0._shouldBlockWhileCheckingOwnershipStatus = true

	Fences.CDHAHDBJGB()
end

function FenceOwnershipStatus.Stop(arg_3_0)
	DebugPrint("FenceOwnershipStatus.Stop")

	if arg_3_0._isShowingBlockingPopup then
		DebugPrint("FenceOwnershipStatus.Stop closing blocking popup ")
		LUI.FlowManager.RequestLeaveMenuByName("popup_checking_ownership_status", true)

		arg_3_0._isShowingBlockingPopup = false
	end
end

function FenceOwnershipStatus.UpdateState(arg_4_0)
	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	arg_4_0._state = LUI.Fence.STATE.pass

	local var_4_0 = Engine.IJEBHJIJF()

	if arg_4_0._shouldBlockWhileCheckingOwnershipStatus then
		if Fences.DICBGGDGBA() then
			arg_4_0._shouldBlockWhileCheckingOwnershipStatus = false
		elseif not Engine.ECFHDAEIDA(var_4_0) then
			arg_4_0._state = LUI.Fence.STATE.block

			if not arg_4_0._isShowingBlockingPopup then
				arg_4_0:OpenCheckingOwnershipPopup()
			end
		end
	end
end

function FenceOwnershipStatus.OpenCheckingOwnershipPopup(arg_5_0)
	local var_5_0 = arg_5_0
	local var_5_1 = {
		onCancel = function(arg_6_0, arg_6_1)
			DebugPrint("Cancelling FenceOwnershipStatus")

			var_5_0._shouldBlockWhileCheckingOwnershipStatus = false
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_checking_ownership_status", false, nil, false, var_5_1, nil, true, true)

	arg_5_0._isShowingBlockingPopup = true
end

function PopupCheckingOwnershipStatus(arg_7_0, arg_7_1)
	assert(arg_7_1 and arg_7_1.onCancel)

	local var_7_0 = {
		message = Engine.CBBHFCGDIC("MENU/WAITING_FOR_OWNERSHIP_STATUS"),
		cancel_func = arg_7_1.onCancel
	}

	var_7_0.imageOverride = "logo_wz_shadow"

	local var_7_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_7_0)

	var_7_1.id = "popup_checking_ownership_status"

	return var_7_1
end

MenuBuilder.registerType("popup_checking_ownership_status", PopupCheckingOwnershipStatus)
LUI.Fence.Register("ownershipStatus", FenceOwnershipStatus)
LockTable(_M)
