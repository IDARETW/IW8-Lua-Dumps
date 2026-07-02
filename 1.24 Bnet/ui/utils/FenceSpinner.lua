module(..., package.seeall)

LUI.FenceSpinner = LUI.Class(LUI.Fence)
LUI.FenceSpinner.CODE_STATE = {
	inProgress = 1,
	success = 2,
	idle = 0,
	failure = 3
}
LUI.FenceSpinner.FAILURE_ACTION = {
	fence = 1,
	none = 0
}

function LUI.FenceSpinner.init(arg_1_0)
	LUI.Fence.init(arg_1_0)

	arg_1_0.fenceChannel = CoD.FenceChannel.Default
end

function LUI.FenceSpinner.Start(arg_2_0)
	arg_2_0:ShowInProgressPopup()
end

function LUI.FenceSpinner.Stop(arg_3_0)
	local var_3_0, var_3_1 = Fences.DIDICIBJAC(arg_3_0.fenceChannel)

	LUI.FlowManager.RequestLeaveMenuByName("spinner_inprogress_popup", true)

	if var_3_0 ~= LUI.FenceSpinner.CODE_STATE.idle then
		if var_3_0 == LUI.FenceSpinner.CODE_STATE.success then
			if Fences.ECCCADFEDB(arg_3_0.fenceChannel) == true then
				arg_3_0:ShowSuccessPopup()
			end

			Fences.CABJICFBDA(arg_3_0.fenceChannel)
		elseif var_3_0 == LUI.FenceSpinner.CODE_STATE.failure and Fences.CEDAAIBBCB(arg_3_0.fenceChannel) == LUI.FenceSpinner.FAILURE_ACTION.none then
			arg_3_0:ShowFailurePopup()
			Fences.CABJICFBDA(arg_3_0.fenceChannel)
		end
	end
end

function LUI.FenceSpinner.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail then
		arg_4_0:ShowFailurePopup()
		Fences.CABJICFBDA(arg_4_0.fenceChannel)
	end
end

function LUI.FenceSpinner.ShowInProgressPopup(arg_5_0)
	local var_5_0, var_5_1 = Fences.DIDICIBJAC(arg_5_0.fenceChannel)
	local var_5_2 = {
		message = var_5_1
	}

	LUI.FlowManager.RequestPopupMenu(nil, "spinner_inprogress_popup", false, nil, false, var_5_2, nil, true, true)
end

function LUI.FenceSpinner.ShowSuccessPopup(arg_6_0)
	local var_6_0, var_6_1 = Fences.DIDICIBJAC(arg_6_0.fenceChannel)
	local var_6_2 = {
		message = var_6_1
	}

	LUI.FlowManager.RequestPopupMenu(nil, "spinner_confirmation_popup", false, nil, false, var_6_2, nil, true, true)
end

function LUI.FenceSpinner.ShowFailurePopup(arg_7_0)
	local var_7_0, var_7_1 = Fences.DIDICIBJAC(arg_7_0.fenceChannel)
	local var_7_2 = {
		message = var_7_1
	}

	LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_7_2, nil, true, true)
end

function LUI.FenceSpinner.UpdateState(arg_8_0)
	assert(arg_8_0._state ~= LUI.Fence.STATE.fail)

	local var_8_0, var_8_1 = Fences.DIDICIBJAC(arg_8_0.fenceChannel)

	if var_8_0 == LUI.FenceSpinner.CODE_STATE.idle then
		if arg_8_0._state == LUI.Fence.STATE.block then
			arg_8_0._state = LUI.Fence.STATE.pass
		end
	elseif var_8_0 == LUI.FenceSpinner.CODE_STATE.inProgress then
		if arg_8_0._state == LUI.Fence.STATE.pass then
			arg_8_0._state = LUI.Fence.STATE.block
		end
	elseif var_8_0 == LUI.FenceSpinner.CODE_STATE.success then
		if arg_8_0._state ~= LUI.Fence.STATE.pass then
			arg_8_0._state = LUI.Fence.STATE.pass
		else
			arg_8_0._state = LUI.Fence.STATE.block
		end
	elseif var_8_0 == LUI.FenceSpinner.CODE_STATE.failure then
		if Fences.CEDAAIBBCB(arg_8_0.fenceChannel) == LUI.FenceSpinner.FAILURE_ACTION.fence then
			arg_8_0._state = LUI.Fence.STATE.fail
		elseif arg_8_0._state ~= LUI.Fence.STATE.pass then
			arg_8_0._state = LUI.Fence.STATE.pass
		else
			arg_8_0._state = LUI.Fence.STATE.block
		end
	end
end

LUI.Fence.Register("fenceSpinner", LUI.FenceSpinner)
LockTable(_M)
