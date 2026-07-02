module(..., package.seeall)

FenceUGCPrivilege = LUI.Class(LUI.Fence)

function FenceUGCPrivilege.UpdateState(arg_1_0)
	assert(arg_1_0._state ~= LUI.Fence.STATE.fail)

	arg_1_0._state = LUI.Fence.STATE.pass

	if not Engine.EAABDHIDFJ() then
		return
	end

	arg_1_0._state = FencePrivilegeUtils.ProcessPrivilegeState(arg_1_0, MP_COMMON.LivePrivileges.LIVE_PRIVILEGE_INDEX_USERGENERATEDCONTENT, false)
end

LUI.Fence.Register("ugcPrivilege", FenceUGCPrivilege)
LockTable(_M)
