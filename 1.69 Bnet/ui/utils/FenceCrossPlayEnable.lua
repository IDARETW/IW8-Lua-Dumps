module(..., package.seeall)

FenceCrossPlayEnable = LUI.Class(LUI.Fence)

function FenceCrossPlayEnable.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceCrossPlayEnable.Start(arg_2_0)
	DebugPrint("FenceCrossplayEnable.Start")
end

function FenceCrossPlayEnable.Stop(arg_3_0)
	DebugPrint("FenceCrossplayEnable.Stop")
end

function FenceCrossPlayEnable.UpdateState(arg_4_0)
	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	if arg_4_0._state == LUI.Fence.STATE.pass then
		return
	end

	local var_4_0

	for iter_4_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_4_0) and Engine.BFDACIJIAD(iter_4_0) then
			var_4_0 = iter_4_0
		end
	end

	if var_4_0 then
		Engine.CEEFAFFHIE(var_4_0)
	end

	arg_4_0._state = LUI.Fence.STATE.pass
end

LUI.Fence.Register("crossPlayEnable", FenceCrossPlayEnable)
LockTable(_M)
