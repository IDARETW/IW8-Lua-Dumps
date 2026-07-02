module(..., package.seeall)

FenceCatalog = LUI.Class(LUI.Fence)

function FenceCatalog.init(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.super.init(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0._controllerIndex = arg_1_2

	assert(arg_1_0._controllerIndex)
end

function FenceCatalog.Start(arg_2_0)
	DebugPrint("FenceCatalog.Start")

	if Dvar.IBEGCHEFE("NNOLSNMLPQ") then
		arg_2_0._timeoutSeconds = Dvar.CFHDGABACF("NLLTLPKNTP") / 1000
		arg_2_0._startTime = tostring(Engine.DEIDGHDBHD())

		InGameStore.FetchCatalog(arg_2_0._controllerIndex, false, true)
	else
		arg_2_0._state = LUI.Fence.STATE.pass
	end
end

function FenceCatalog.Stop(arg_3_0)
	DebugPrint("FenceCatalog.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("store_inprogress_popup", true)

	arg_3_0._openedPopup = false
end

function FenceCatalog.UpdateState(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.pass then
		return
	end

	local var_4_0 = math.abs(Engine.CCEJJCCDEG(arg_4_0._startTime))

	if arg_4_0._startTime and var_4_0 >= arg_4_0._timeoutSeconds then
		DebugPrint("FenceCatalog: timed out")

		arg_4_0._state = LUI.Fence.STATE.pass

		return
	end

	local var_4_1 = InGameStore.GetCatalogStatus(arg_4_0._controllerIndex)

	if var_4_1 == InGameStoreCatalogStatus.FETCHING then
		arg_4_0._state = LUI.Fence.STATE.block
	elseif var_4_1 == InGameStoreCatalogStatus.READY then
		STORE.DLogRecordInstalledDLCs(arg_4_0._controllerIndex)

		arg_4_0._state = LUI.Fence.STATE.pass
	else
		DebugPrint("FenceCatalog: an error occured")

		arg_4_0._state = LUI.Fence.STATE.pass
	end

	if arg_4_0._state == LUI.Fence.STATE.block and not arg_4_0._openedPopup then
		arg_4_0:ShowInProgressPopup()
	end
end

function FenceCatalog.ShowInProgressPopup(arg_5_0)
	local var_5_0 = {
		message = Engine.CBBHFCGDIC("MENU/FETCHING_STORE_INFO")
	}

	var_5_0.displayWZWipSetup = true

	LUI.FlowManager.RequestPopupMenu(nil, "store_inprogress_popup", false, arg_5_0._controllerIndex, false, var_5_0, nil, true, true)

	arg_5_0._openedPopup = true
end

LUI.Fence.Register("catalog", FenceCatalog)
LockTable(_M)
