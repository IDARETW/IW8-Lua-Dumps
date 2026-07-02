module(..., package.seeall)

FenceContracts = LUI.Class(LUI.Fence)

function FenceContracts.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceContracts.Start(arg_2_0)
	DebugPrint("FenceContracts.Start")
end

function FenceContracts.Stop(arg_3_0)
	DebugPrint("FenceContracts.Stop")
end

function FenceContracts.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail and arg_4_0._errorCode then
		local var_4_0 = Engine.IJEBHJIJF()

		LUI.FlowManager.RequestAddMenu("MainMenuOffline", true, var_4_0)
		LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error", false, nil, false, {
			errorCode = arg_4_0._errorCode
		}, nil, false, true)
	end
end

function FenceContracts.UpdateState(arg_5_0)
	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.pass
end

LUI.Fence.Register("contracts", FenceContracts)
LockTable(_M)
