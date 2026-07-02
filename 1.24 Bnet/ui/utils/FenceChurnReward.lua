module(..., package.seeall)

FenceChurnReward = LUI.Class(LUI.Fence)

function FenceChurnReward.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceChurnReward.Start(arg_2_0)
	DebugPrint("FenceChurnReward.Start")
end

function FenceChurnReward.Stop(arg_3_0)
	DebugPrint("FenceChurnReward.Stop")
end

function FenceChurnReward.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail and arg_4_0._errorCode then
		local var_4_0 = Engine.IJEBHJIJF()

		LUI.FlowManager.RequestAddMenu("MainMenuOffline", true, var_4_0)
		LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error", false, nil, false, {
			errorCode = arg_4_0._errorCode
		}, nil, false, true)
	end
end

function FenceChurnReward.UpdateState(arg_5_0)
	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.pass

	for iter_5_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_5_0) then
			DCR.OpenDCRWindowIfRequired(iter_5_0)
		end
	end
end

LUI.Fence.Register("churnReward", FenceChurnReward)
LockTable(_M)
