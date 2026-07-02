module(..., package.seeall)

FenceCP = LUI.Class(LUI.Fence)

function FenceCP.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceCP.ContentEnumerationDone(arg_2_0)
	local var_2_0 = false

	if not CONDITIONS.IsPC(arg_2_0) then
		var_2_0 = Dvar.IBEGCHEFE("LKSTRMKTML")
	end

	if var_2_0 and (Engine.BAJHDFAJJF(CoD.CP_MAP_PACK_1_INDEX) == false or Engine.BAJHDFAJJF(CoD.CP_MAP_PACK_2_INDEX) == false or Engine.BAJHDFAJJF(CoD.MP_MAP_PACK_3_INDEX) == false) then
		if Engine.BAJHDFAJJF(CoD.MP_MAP_PACK_3_INDEX) then
			if Engine.BAJHDFAJJF(CoD.CP_MAP_PACK_1_INDEX) then
				arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership_CP_2
			elseif Engine.BAJHDFAJJF(CoD.CP_MAP_PACK_2_INDEX) then
				arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership_CP_1
			else
				arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership_CP
			end
		else
			arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership_MP3_DLC
		end

		arg_2_0._state = LUI.Fence.STATE.fail
	elseif Dvar.IBEGCHEFE("RLSPOOTTT") and Engine.CGABICJHAI() then
		if not Engine.BAJIGJADFI(CoD.PlayMode.Aliens) then
			arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership
			arg_2_0._state = LUI.Fence.STATE.fail
		elseif not Engine.EDHEFGEJA(CoD.PlayMode.Aliens) then
			arg_2_0._errorCode = CoD.FenceErrorCodes.Installation
			arg_2_0._state = LUI.Fence.STATE.fail
		else
			Engine.JIGEGGGJB()
		end
	else
		Engine.JIGEGGGJB()
	end
end

function FenceCP.Start(arg_3_0)
	if not Fences.BIDGFFEBCD() then
		arg_3_0._state = LUI.Fence.STATE.block
		arg_3_0._enumeratingContent = true
	else
		FenceCP.ContentEnumerationDone(arg_3_0)
	end
end

function FenceCP.Stop(arg_4_0)
	LUI.FlowManager.RequestLeaveMenuByName("ModeFencePopup", true)

	arg_4_0._openedWaitPopup = false

	Challenge.UpdateDailyPopupEnabled()
end

function FenceCP.OnBackOut(arg_5_0)
	Engine.BIGIHAGAAA()
end

function FenceCP.PostFail(arg_6_0)
	if arg_6_0._state == LUI.Fence.STATE.fail and arg_6_0._errorCode then
		if arg_6_0._errorCode == CoD.FenceErrorCodes.Ownership_CP or arg_6_0._errorCode == CoD.FenceErrorCodes.Ownership_CP_2 or arg_6_0._errorCode == CoD.FenceErrorCodes.Ownership_CP_1 or arg_6_0._errorCode == CoD.FenceErrorCodes.Ownership_MP3_DLC then
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

function FenceCP.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.block

	if arg_7_0._enumeratingContent and Fences.BIDGFFEBCD() then
		FenceCP.ContentEnumerationDone(arg_7_0)

		arg_7_0._enumeratingContent = false
	end

	if Engine.EAIICIFIFA() and CoD.GetCurrentGameMode() == CoD.PlayMode.Aliens and not Engine.CBGGJIBJBH() then
		arg_7_0._state = LUI.Fence.STATE.pass
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedWaitPopup then
		LUI.FlowManager.RequestPopupMenu(nil, "ModeFencePopup", false, nil, false, {}, nil, true, true)

		arg_7_0._openedWaitPopup = true
	end
end

LUI.Fence.Register("cp", FenceCP)
LockTable(_M)
