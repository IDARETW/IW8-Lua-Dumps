FencePrivilegeUtils = {}
FencePrivilegeUtils.privilegeStates = {
	state_resolution_in_progress = 1,
	state_denied = 4,
	state_uninitialized = 0,
	state_granted = 3,
	state_resolution_needed = 2
}

function FencePrivilegeUtils.ProcessPrivilegeState(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_0._privilegeResult then
		arg_1_0._privilegeResult = {}

		for iter_1_0 = 0, Engine.DCJGJDDEHE() - 1 do
			arg_1_0._privilegeResult[iter_1_0] = FencePrivilegeUtils.privilegeStates.state_uninitialized
		end
	end

	local var_1_0 = arg_1_0._state
	local var_1_1 = 0
	local var_1_2 = 0
	local var_1_3 = 0

	for iter_1_1 = 0, Engine.DCJGJDDEHE() - 1 do
		local var_1_4 = Engine.BBHAECABBD(iter_1_1)
		local var_1_5 = Engine.CDCCDDJAJJ(iter_1_1)

		if var_1_4 and var_1_5 then
			var_1_1 = var_1_1 + 1

			if arg_1_0._privilegeResult[iter_1_1] == FencePrivilegeUtils.privilegeStates.state_granted then
				var_1_2 = var_1_2 + 1
				var_1_3 = var_1_3 + 1
			elseif arg_1_0._privilegeResult[iter_1_1] == FencePrivilegeUtils.privilegeStates.state_resolution_needed then
				if Engine.JDFCAABHC(iter_1_1, arg_1_1) then
					arg_1_0._privilegeResult[iter_1_1] = FencePrivilegeUtils.privilegeStates.state_resolution_in_progress
				end
			elseif not Engine.CCHDIJBABB(iter_1_1, arg_1_1) then
				if Engine.DEEJHHBAIC(iter_1_1, arg_1_1) then
					arg_1_0._privilegeResult[iter_1_1] = FencePrivilegeUtils.privilegeStates.state_granted
					var_1_2 = var_1_2 + 1
					var_1_3 = var_1_3 + 1
				elseif arg_1_0._privilegeResult[iter_1_1] == FencePrivilegeUtils.privilegeStates.state_uninitialized then
					arg_1_0._privilegeResult[iter_1_1] = FencePrivilegeUtils.privilegeStates.state_resolution_needed
				else
					arg_1_0._privilegeResult[iter_1_1] = FencePrivilegeUtils.privilegeStates.state_denied
					var_1_2 = var_1_2 + 1
				end
			end
		else
			arg_1_0._privilegeResult[iter_1_1] = FencePrivilegeUtils.privilegeStates.state_uninitialized
		end
	end

	if var_1_1 > 0 then
		if var_1_1 ~= var_1_2 then
			var_1_0 = LUI.Fence.STATE.block
		elseif var_1_1 ~= var_1_3 and arg_1_2 then
			var_1_0 = LUI.Fence.STATE.fail
		end
	end

	return var_1_0
end
