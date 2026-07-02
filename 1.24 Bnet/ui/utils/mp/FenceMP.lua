module(..., package.seeall)

FenceMP = LUI.Class(LUI.Fence)

function FenceMP.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceMP.ContentEnumerationDone(arg_2_0)
	local var_2_0 = false

	if not CONDITIONS.IsPC(arg_2_0) and not CONDITIONS.IsLaunchChunk() then
		var_2_0 = Dvar.IBEGCHEFE("LKSTRMKTML")
	end

	if var_2_0 and (not Engine.BAJHDFAJJF(CoD.MP_MAP_PACK_1_INDEX) or not Engine.BAJHDFAJJF(CoD.MP_MAP_PACK_2_INDEX) or not Engine.BAJHDFAJJF(CoD.MP_MAP_PACK_3_INDEX) or not Engine.BAJHDFAJJF(CoD.MP_MAP_PACK_4_INDEX)) then
		if Engine.BAJHDFAJJF(CoD.MP_MAP_PACK_3_INDEX) then
			arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership_MP
		else
			arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership_MP3_DLC
		end

		arg_2_0._state = LUI.Fence.STATE.fail
	elseif Dvar.IBEGCHEFE("RLSPOOTTT") and Engine.CGABICJHAI() then
		if not Engine.BAJIGJADFI(CoD.PlayMode.Core) then
			arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership
			arg_2_0._state = LUI.Fence.STATE.fail
		elseif not Engine.EDHEFGEJA(CoD.PlayMode.Core) then
			arg_2_0._errorCode = CoD.FenceErrorCodes.Installation
			arg_2_0._state = LUI.Fence.STATE.fail
		else
			Engine.DIDCHDDFBH()
		end
	else
		Engine.DIDCHDDFBH()
	end
end

function FenceMP.Start(arg_3_0)
	if not Fences.BIDGFFEBCD() then
		arg_3_0._state = LUI.Fence.STATE.block
		arg_3_0._enumeratingContent = true
	else
		FenceMP.ContentEnumerationDone(arg_3_0)
	end
end

function FenceMP.Stop(arg_4_0)
	LUI.FlowManager.RequestLeaveMenuByName("ModeFencePopup", true)

	arg_4_0._openedWaitPopup = false

	Challenge.UpdateDailyPopupEnabled()
end

function FenceMP.OnBackOut(arg_5_0)
	Engine.BIGIHAGAAA()
end

function FenceMP.PostFail(arg_6_0)
	if arg_6_0._state == LUI.Fence.STATE.fail and arg_6_0._errorCode then
		if arg_6_0._errorCode == CoD.FenceErrorCodes.Ownership_MP or arg_6_0._errorCode == CoD.FenceErrorCodes.Ownership_MP3_DLC then
			Engine.DAGFFDGFII("xstopparty 0")
			Engine.DAGFFDGFII("xstopprivateparty 0")
		end

		local var_6_0 = Engine.IJEBHJIJF()

		if Engine.CFHBIHABCB(var_6_0) then
			LUI.FlowManager.RequestAddMenu("GameInstallManager", true, var_6_0, false, nil, true)
		end

		LUI.FlowManager.RequestPopupMenu(nil, "PopupFenceGameModeError", false, nil, false, {
			errorCode = arg_6_0._errorCode
		}, nil, false, true)
	end
end

function FenceMP.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.block

	if arg_7_0._enumeratingContent and Fences.BIDGFFEBCD() then
		FenceMP.ContentEnumerationDone(arg_7_0)

		arg_7_0._enumeratingContent = false
	end

	if Engine.EAAHGICFBD() and CoD.GetCurrentGameMode() == CoD.PlayMode.Core and not Engine.CBGGJIBJBH() then
		arg_7_0._state = LUI.Fence.STATE.pass
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedWaitPopup then
		LUI.FlowManager.RequestPopupMenu(nil, "ModeFencePopup", false, nil, false, {}, nil, true, true)

		arg_7_0._openedWaitPopup = true
	end
end

LUI.Fence.Register("mp", FenceMP)
LockTable(_M)
