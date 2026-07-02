module(..., package.seeall)

FenceDailyReward = LUI.Class(LUI.Fence)

function FenceDailyReward.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceDailyReward.Start(arg_2_0)
	DebugPrint("FenceDailyReward.Start")
end

function FenceDailyReward.Stop(arg_3_0)
	DebugPrint("FenceDailyReward.Stop")
end

function FenceDailyReward.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail and arg_4_0._errorCode then
		local var_4_0 = Engine.IJEBHJIJF()

		LUI.FlowManager.RequestAddMenu("MainMenuOffline", true, var_4_0)
		LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error", false, nil, false, {
			errorCode = arg_4_0._errorCode
		}, nil, false, true)
	end
end

function FenceDailyReward.UpdateState(arg_5_0)
	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.pass

	for iter_5_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_5_0) then
			DLB.OpenDLBWindowIfRequired(iter_5_0)
		end
	end
end

LUI.Fence.Register("dailyReward", FenceDailyReward)
LockTable(_M)
