module(..., package.seeall)

FenceOffline = LUI.Class(LUI.Fence)

function FenceOffline.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceOffline.Start(arg_2_0)
	DebugPrint("FenceOffline.Start")
end

function FenceOffline.Stop(arg_3_0)
	DebugPrint("FenceOffline.Stop")
end

function FenceOffline.UpdateState(arg_4_0)
	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	arg_4_0._state = LUI.Fence.STATE.pass

	for iter_4_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_4_0) and not Fences.BGCHCGICDB(iter_4_0) then
			arg_4_0._state = LUI.Fence.STATE.block
		end
	end
end

LUI.Fence.Register("offlineData", FenceOffline)
LockTable(_M)
