module(..., package.seeall)

FenceExchange = LUI.Class(LUI.Fence)

function FenceExchange.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceExchange.Start(arg_2_0)
	DebugPrint("FenceExchange.Start")
end

function FenceExchange.Stop(arg_3_0)
	DebugPrint("FenceExchange.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("popup_exchanging", true)

	arg_3_0._openedWaitPopup = false
end

function FenceExchange.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail and arg_4_0._errorCode then
		local var_4_0 = Engine.IJEBHJIJF()

		LUI.FlowManager.RequestAddMenu("MainMenuOffline", true, var_4_0)
		LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error", false, nil, false, {
			errorCode = arg_4_0._errorCode
		}, nil, false, true)
	end
end

function FenceExchange.OnBackOut(arg_5_0)
	return
end

function FenceExchange.OpenPopup(arg_6_0)
	local var_6_0 = arg_6_0
	local var_6_1 = {}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_exchanging", false, nil, false, var_6_1, nil, true, true)

	arg_6_0._openedWaitPopup = true
end

function FenceExchange.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.pass

	for iter_7_0 = 0, Engine.DCJGJDDEHE() - 1 do
		local var_7_0 = Engine.BBHAECABBD(iter_7_0)
		local var_7_1 = var_7_0 and Engine.DBAEJAHFGJ(iter_7_0)

		if var_7_0 and not var_7_1 then
			if Commerce.CIIJICHHF(iter_7_0) == 3 then
				Commerce.DBFDIGCEID(iter_7_0, 4)
			end

			if Commerce.CIIJICHHF(iter_7_0) <= 1 then
				arg_7_0._state = LUI.Fence.STATE.block

				break
			end
		end
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedWaitPopup then
		arg_7_0:OpenPopup()
	end
end

function PopupExchanging(arg_8_0, arg_8_1)
	assert(arg_8_1)

	local var_8_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/EXCHANGING")
	}
	local var_8_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_8_0)

	var_8_1.id = "popup_exchanging"

	return var_8_1
end

MenuBuilder.registerType("popup_exchanging", PopupExchanging)
LUI.Fence.Register("exchange", FenceExchange)
LockTable(_M)
