module(..., package.seeall)

FenceFrontendAssets = LUI.Class(LUI.Fence)

function FenceFrontendAssets.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceFrontendAssets.Start(arg_2_0)
	return
end

function FenceFrontendAssets.Stop(arg_3_0)
	LUI.FlowManager.RequestLeaveMenuByName("ModeFencePopup", true)

	arg_3_0._openedWaitPopup = false
end

function FenceFrontendAssets.OnBackOut(arg_4_0)
	return
end

function FenceFrontendAssets.UpdateState(arg_5_0)
	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.block

	if Engine.JBAACDFEJ() then
		arg_5_0._state = LUI.Fence.STATE.pass
	end

	if arg_5_0._state == LUI.Fence.STATE.block and not arg_5_0._openedWaitPopup then
		LUI.FlowManager.RequestPopupMenu(nil, "ModeFencePopup", false, nil, false, {}, nil, true, true)

		arg_5_0._openedWaitPopup = true
	end
end

LUI.Fence.Register("frontendAssets", FenceFrontendAssets)
LockTable(_M)
