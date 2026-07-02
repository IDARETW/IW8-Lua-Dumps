module(..., package.seeall)

FenceBR = LUI.Class(LUI.Fence)

function FenceBR.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceBR.Start(arg_2_0)
	Engine.DIDCHDDFBH()
end

function FenceBR.Stop(arg_3_0)
	LUI.FlowManager.RequestLeaveMenuByName("ModeFencePopup", true)

	arg_3_0._openedWaitPopup = false
end

function FenceBR.OnBackOut(arg_4_0)
	Engine.BIGIHAGAAA()
end

function FenceBR.UpdateState(arg_5_0)
	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.block

	if Engine.EAAHGICFBD() and CoD.GetCurrentGameMode() == CoD.PlayMode.Core and not Engine.CBGGJIBJBH() then
		arg_5_0._state = LUI.Fence.STATE.pass
	end

	if not CONDITIONS.IsMagmaEnabled() then
		arg_5_0._state = LUI.Fence.STATE.fail
	end

	if arg_5_0._state == LUI.Fence.STATE.block and not arg_5_0._openedWaitPopup then
		LUI.FlowManager.RequestPopupMenu(nil, "ModeFencePopup", false, nil, false, {}, nil, true, true)

		arg_5_0._openedWaitPopup = true
	end
end

LUI.Fence.Register("br", FenceBR)
LockTable(_M)
