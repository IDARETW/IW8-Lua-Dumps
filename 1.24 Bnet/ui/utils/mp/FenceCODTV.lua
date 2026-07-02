module(..., package.seeall)

FenceCODTV = LUI.Class(LUI.Fence)

function FenceCODTV.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceCODTV.Start(arg_2_0)
	DebugPrint("FenceCODTV.Start")
end

function FenceCODTV.Stop(arg_3_0)
	DebugPrint("FenceCODTV.Stop")

	if arg_3_0._openedWaitPopup then
		LUI.FlowManager.RequestLeaveMenuByName(arg_3_0._openedWaitPopup, true)
	end
end

function FenceCODTV.PostFail(arg_4_0)
	return
end

function FenceCODTV.OnBackOut(arg_5_0)
	return
end

function FenceCODTV.OpenPopup(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0
	local var_6_1 = {
		onCancel = function(arg_7_0, arg_7_1)
			var_6_0._state = LUI.Fence.STATE.fail
		end,
		callingFence = var_6_0
	}

	if arg_6_0._openedWaitPopup then
		LUI.FlowManager.RequestLeaveMenuByName(arg_6_0._openedWaitPopup, true)
	end

	LUI.FlowManager.RequestPopupMenu(nil, arg_6_1, false, nil, false, var_6_1, nil, true, true)

	arg_6_0._openedWaitPopup = arg_6_1
end

function FenceCODTV.UpdateState(arg_8_0)
	assert(arg_8_0._state ~= LUI.Fence.STATE.fail)

	arg_8_0._state = LUI.Fence.STATE.pass
end

LUI.Fence.Register("codtv", FenceCODTV)
LockTable(_M)
