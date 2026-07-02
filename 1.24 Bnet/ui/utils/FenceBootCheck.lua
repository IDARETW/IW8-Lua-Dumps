module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

FenceBootCheck = LUI.Class(LUI.Fence)

function FenceBootCheck.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceBootCheck.Start(arg_2_0)
	DebugPrint("FenceBootCheck.Start")
	Engine.FFJCFAJCC()
end

function FenceBootCheck.Stop(arg_3_0)
	DebugPrint("FenceBootCheck.Stop")
end

function FenceBootCheck.UpdateState(arg_4_0)
	arg_4_0._state = LUI.Fence.STATE.block

	if Engine.CECJFAEEEI() then
		if Engine.CJFJFEJIJD() then
			if Dvar.IBEGCHEFE("unattended") then
				Engine.BBHEAJBCHF()
			elseif not LUI.FlowManager.IsInStack("bootcheck_corrupt_savedata_error_popup") then
				LUI.FlowManager.RequestPopupMenu(nil, "bootcheck_corrupt_savedata_error_popup", false, nil, false, {}, nil, true, true)
			end
		end
	else
		arg_4_0._state = LUI.Fence.STATE.pass
	end
end

function bootcheck_corrupt_savedata_error_popup()
	local var_5_0 = {
		title = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_TITLE"),
		message = Engine.CBBHFCGDIC("MENU/CORRUPT_SAVEDATA_MESSAGE"),
		action = function()
			Engine.BBHEAJBCHF()
		end
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_5_0)

	var_5_1.id = "bootcheck_corrupt_savedata_error_popup"

	return var_5_1
end

MenuBuilder.registerType("bootcheck_corrupt_savedata_error_popup", bootcheck_corrupt_savedata_error_popup)
LUI.Fence.Register("bootCheck", FenceBootCheck)
LockTable(_M)
