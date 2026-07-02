LUI.Fence = LUI.Class()
LUI.Fence.fenceTypes = {}
LUI.Fence.STATE = {
	block = 1,
	pass = 0,
	fail = 2
}

function LUI.Fence.Register(arg_1_0, arg_1_1)
	assert(type(arg_1_1.UpdateState) == "function")
	assert(not LUI.Fence.fenceTypes[arg_1_0])

	LUI.Fence.fenceTypes[arg_1_0] = arg_1_1
end

function LUI.Fence.Instantiate(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = LUI.Fence.fenceTypes[arg_2_0]

	assert(var_2_0)

	return (var_2_0.new(arg_2_1, arg_2_2, arg_2_3))
end

function LUI.Fence.init(arg_3_0)
	arg_3_0._state = LUI.Fence.STATE.block
end

function LUI.Fence.Start(arg_4_0)
	return
end

function LUI.Fence.Frame(arg_5_0)
	return
end

function LUI.Fence.Stop(arg_6_0)
	return
end

function LUI.Fence.State(arg_7_0)
	assert(arg_7_0._state)

	return arg_7_0._state
end

LUI.FenceGroup = LUI.Class()
LUI.FenceGroup.STATE = {
	block = 1,
	pass = 0,
	fail = 2,
	abort = 3
}

function LUI.FenceGroup.init(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	assert(#arg_8_1 > 0)

	arg_8_0._fences = {}
	arg_8_0._state = nil

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		local var_8_0 = LUI.Fence.Instantiate(iter_8_1, arg_8_0, arg_8_2, arg_8_3)

		table.insert(arg_8_0._fences, var_8_0)
	end

	arg_8_0._activeFenceIndex = 0
end

function LUI.FenceGroup.Reset(arg_9_0)
	local var_9_0 = arg_9_0._fences[arg_9_0._activeFenceIndex]

	if var_9_0 then
		var_9_0:Stop()
	end

	arg_9_0._state = nil
	arg_9_0._activeFenceIndex = 0
end

function LUI.FenceGroup.Frame(arg_10_0)
	if arg_10_0._busy then
		return
	end

	arg_10_0._busy = true

	assert(arg_10_0._state ~= LUI.FenceGroup.STATE.fail)
	assert(arg_10_0._state ~= LUI.FenceGroup.STATE.abort)
	assert(arg_10_0._activeFenceIndex)

	if arg_10_0._activeFenceIndex < 1 then
		arg_10_0._activeFenceIndex = 1

		arg_10_0._fences[arg_10_0._activeFenceIndex]:Start()
	end

	local var_10_0 = arg_10_0._state
	local var_10_1 = LUI.FenceGroup.STATE.pass

	for iter_10_0, iter_10_1 in ipairs(arg_10_0._fences) do
		if iter_10_1:State() == LUI.Fence.STATE.fail then
			var_10_1 = LUI.FenceGroup.STATE.fail

			break
		end

		if iter_10_0 >= arg_10_0._activeFenceIndex then
			break
		end
	end

	if var_10_1 ~= LUI.FenceGroup.STATE.fail then
		for iter_10_2, iter_10_3 in ipairs(arg_10_0._fences) do
			assert(iter_10_2 <= arg_10_0._activeFenceIndex)

			local var_10_2 = iter_10_3:State()

			if var_10_2 ~= LUI.Fence.STATE.fail then
				iter_10_3:UpdateState()
				iter_10_3:Frame()

				var_10_2 = iter_10_3:State()
			end

			if var_10_2 == LUI.Fence.STATE.pass then
				if iter_10_2 == arg_10_0._activeFenceIndex then
					arg_10_0._fences[arg_10_0._activeFenceIndex]:Stop()

					arg_10_0._activeFenceIndex = arg_10_0._activeFenceIndex + 1

					if arg_10_0._activeFenceIndex <= #arg_10_0._fences then
						arg_10_0._fences[arg_10_0._activeFenceIndex]:Start()
					end
				end
			elseif var_10_2 == LUI.Fence.STATE.block then
				var_10_1 = LUI.FenceGroup.STATE.block

				if iter_10_2 < arg_10_0._activeFenceIndex then
					if arg_10_0._activeFenceIndex <= #arg_10_0._fences then
						arg_10_0._fences[arg_10_0._activeFenceIndex]:Stop()
					end

					arg_10_0._activeFenceIndex = iter_10_2

					arg_10_0._fences[arg_10_0._activeFenceIndex]:Start()
				end

				break
			elseif var_10_2 == LUI.Fence.STATE.fail then
				if iter_10_2 == arg_10_0._activeFenceIndex then
					arg_10_0._fences[arg_10_0._activeFenceIndex]:Stop()

					arg_10_0._activeFenceIndex = nil
				end

				var_10_1 = LUI.FenceGroup.STATE.fail

				break
			else
				assert(false, "Unexpected fence state")
			end
		end
	end

	assert(arg_10_0._state == var_10_0)

	if var_10_1 ~= arg_10_0._state then
		arg_10_0._state = var_10_1

		if arg_10_0._state == LUI.FenceGroup.STATE.pass then
			arg_10_0:OnPass()
		elseif arg_10_0._state == LUI.FenceGroup.STATE.block then
			arg_10_0:OnBlock()
		elseif arg_10_0._state == LUI.FenceGroup.STATE.fail then
			arg_10_0:BackOut()
			arg_10_0:Fail()
		end
	end

	arg_10_0._busy = false
end

function LUI.FenceGroup.Abort(arg_11_0)
	if arg_11_0._fences[arg_11_0._activeFenceIndex] then
		arg_11_0._fences[arg_11_0._activeFenceIndex]:Stop()
	end

	arg_11_0._state = LUI.FenceGroup.STATE.abort
	arg_11_0._activeFenceIndex = nil
end

function LUI.FenceGroup.BackOut(arg_12_0)
	for iter_12_0 = #arg_12_0._fences, 1, -1 do
		local var_12_0 = arg_12_0._fences[iter_12_0]

		if var_12_0.OnBackOut then
			var_12_0:OnBackOut()
		end
	end
end

function LUI.FenceGroup.Fail(arg_13_0)
	arg_13_0:OnFail()

	for iter_13_0 = 1, #arg_13_0._fences do
		local var_13_0 = arg_13_0._fences[#arg_13_0._fences - iter_13_0 + 1]

		if var_13_0.PostFail then
			var_13_0:PostFail()
		end
	end
end

function LUI.FenceGroup.OnPass(arg_14_0)
	DebugPrint("Fence passes")
end

function LUI.FenceGroup.OnBlock(arg_15_0)
	DebugPrint("Fence blocks")
end

function LUI.FenceGroup.OnFail(arg_16_0)
	DebugPrint("Fence failed")
end

function LUI.FenceGroup.Passes(arg_17_0)
	return arg_17_0._state == LUI.FenceGroup.STATE.pass
end
