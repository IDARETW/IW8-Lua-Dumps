module(..., package.seeall)

FenceStore = LUI.Class(LUI.Fence)

function FenceStore.init(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.super.init(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0._controllerIndex = arg_1_2

	assert(arg_1_0._controllerIndex)
end

function FenceStore.Start(arg_2_0)
	DebugPrint("FenceStore.Start")
end

function FenceStore.Stop(arg_3_0)
	DebugPrint("FenceStore.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("store_inprogress_popup", true)

	arg_3_0._openedPopup = false
end

function FenceStore.UpdateState(arg_4_0)
	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	if arg_4_0._state == LUI.Fence.STATE.pass then
		return
	end

	local var_4_0 = InGameStore.GetCatalogStatus(arg_4_0._controllerIndex)

	if var_4_0 == InGameStoreCatalogStatus.FETCHING then
		arg_4_0._state = LUI.Fence.STATE.block

		Engine.DHCGHHBHCH()
	elseif var_4_0 == InGameStoreCatalogStatus.READY then
		arg_4_0._state = LUI.Fence.STATE.pass
	else
		arg_4_0._state = LUI.Fence.STATE.fail
	end

	if arg_4_0._state == LUI.Fence.STATE.block and not arg_4_0._openedPopup then
		arg_4_0:ShowInProgressPopup()
	end
end

function FenceStore.PostFail(arg_5_0)
	if arg_5_0._state == LUI.Fence.STATE.fail and not (Engine.CIEGIACHAE() and Commerce.CCIEAECGHB()) then
		local var_5_0 = {}

		if Engine.DBFCJBDJEC() then
			local var_5_1 = Engine.BIAFEJHHDD()

			if var_5_1 ~= nil then
				local var_5_2 = Engine.JCBDICCAH(var_5_1)

				var_5_0.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_5_2)

				Engine.DCFIDJGACA()
			else
				var_5_0.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
			end
		else
			local var_5_3 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

			var_5_0.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_5_3)
		end

		LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_5_0, nil, false, true)
	end

	Engine.DHCGHHBHCH()
end

function FenceStore.ShowInProgressPopup(arg_6_0)
	local var_6_0 = {
		message = Engine.CBBHFCGDIC("MENU/FETCHING_STORE_INFO")
	}

	LUI.FlowManager.RequestPopupMenu(nil, "store_inprogress_popup", false, nil, false, var_6_0, nil, true, true)

	arg_6_0._openedPopup = true
end

LUI.Fence.Register("store", FenceStore)
LockTable(_M)
