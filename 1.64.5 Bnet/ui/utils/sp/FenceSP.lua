module(..., package.seeall)

FenceSP = LUI.Class(LUI.Fence)

function FenceSP.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceSP.ContentEnumerationDone(arg_2_0)
	arg_2_0._missingDLCMessage = CoD.CheckForMissingSPDataPacks()

	if CONDITIONS.ShouldCheckDLC() and arg_2_0._missingDLCMessage then
		arg_2_0._state = LUI.Fence.STATE.fail
	elseif Dvar.IBEGCHEFE("RLSPOOTTT") and Engine.CGABICJHAI() then
		if not Engine.BAJIGJADFI(CoD.PlayMode.SP) then
			arg_2_0._errorCode = CoD.FenceErrorCodes.Ownership
			arg_2_0._state = LUI.Fence.STATE.fail
		elseif not Engine.EDHEFGEJA(CoD.PlayMode.SP) then
			arg_2_0._errorCode = CoD.FenceErrorCodes.Installation
			arg_2_0._state = LUI.Fence.STATE.fail
		else
			Engine.CDIHEFEJB()
		end
	else
		Engine.CDIHEFEJB()
	end
end

function FenceSP.Start(arg_3_0)
	if not Fences.BIDGFFEBCD() then
		arg_3_0._state = LUI.Fence.STATE.block
		arg_3_0._enumeratingContent = true
	else
		FenceSP.ContentEnumerationDone(arg_3_0)
	end
end

function FenceSP.Stop(arg_4_0)
	LUI.FlowManager.RequestLeaveMenuByName("ModeFencePopup", true)

	arg_4_0._openedWaitPopup = false

	Challenge.UpdateDailyPopupEnabled()
end

function FenceSP.OnBackOut(arg_5_0)
	Engine.BIGIHAGAAA()
end

function FenceSP.PostFail(arg_6_0)
	if arg_6_0._state == LUI.Fence.STATE.fail and (arg_6_0._errorCode or arg_6_0._missingDLCMessage) then
		local var_6_0 = Engine.IJEBHJIJF()

		if Engine.CFHBIHABCB(var_6_0) then
			if CONDITIONS.IsBattleNetModifyInstallEnabled() then
				LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, var_6_0, false)
			else
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, var_6_0, false, nil, true)
			end
		end

		LUI.FlowManager.RequestPopupMenu(nil, "PopupFenceGameModeError", false, nil, false, {
			errorCode = arg_6_0._errorCode,
			missingDLCMessage = arg_6_0._missingDLCMessage
		}, nil, false, true)
	end
end

function FenceSP.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.block

	if arg_7_0._enumeratingContent and Fences.BIDGFFEBCD() then
		FenceSP.ContentEnumerationDone(arg_7_0)

		arg_7_0._enumeratingContent = false
	end

	if Engine.CAADCDEEIA() and CoD.GetCurrentGameMode() == CoD.PlayMode.SP and not Engine.CBGGJIBJBH() then
		arg_7_0._state = LUI.Fence.STATE.pass
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedWaitPopup then
		LUI.FlowManager.RequestPopupMenu(nil, "ModeFencePopup", false, nil, false, {}, nil, true, true)

		arg_7_0._openedWaitPopup = true
	end
end

LUI.Fence.Register("sp", FenceSP)
LockTable(_M)
