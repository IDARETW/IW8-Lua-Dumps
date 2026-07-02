module(..., package.seeall)

FenceCrossPlayPrivilege = LUI.Class(LUI.Fence)

function FenceCrossPlayPrivilege.UpdateState(arg_1_0)
	assert(arg_1_0._state ~= LUI.Fence.STATE.fail)

	arg_1_0._state = LUI.Fence.STATE.pass

	if not Engine.EAABDHIDFJ() then
		return
	end

	arg_1_0._state = FencePrivilegeUtils.ProcessPrivilegeState(arg_1_0, MP_COMMON.LivePrivileges.LIVE_PRIVILEGE_INDEX_CROSSPLAY, false)
end

LUI.Fence.Register("crossPlayPrivilege", FenceCrossPlayPrivilege)
LockTable(_M)
