module(..., package.seeall)

FenceHost = LUI.Class(LUI.Fence)

function FenceHost.init(arg_1_0)
	arg_1_0.areWeGameHostDataSource = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")

	LUI.Fence.init(arg_1_0)
end

function FenceHost.Start(arg_2_0)
	DebugPrint("FenceHost.Start")
end

function FenceHost.Stop(arg_3_0)
	DebugPrint("FenceHost.Stop")
end

function FenceHost.PostFail(arg_4_0)
	return
end

function FenceHost.UpdateState(arg_5_0)
	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.pass

	local var_5_0 = Engine.IJEBHJIJF()
	local var_5_1 = arg_5_0.areWeGameHostDataSource:GetValue(var_5_0)

	if var_5_1 ~= nil and not var_5_1 then
		arg_5_0._state = LUI.Fence.STATE.fail
	elseif not Lobby.AreWePrivatePartyHost() then
		arg_5_0._state = LUI.Fence.STATE.fail
	end
end

LUI.Fence.Register("host", FenceHost)
LockTable(_M)
