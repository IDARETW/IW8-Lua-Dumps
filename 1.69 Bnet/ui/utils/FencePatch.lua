module(..., package.seeall)

FencePatch = LUI.Class(LUI.Fence)
FencePatch.CODE_STATE = {
	success_restart = 2,
	update_needed = 4,
	disabled = 5,
	success = 1,
	active = 0,
	failure = 3
}

function FencePatch.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
	Fences.BDCICIIGD()
end

function FencePatch.Start(arg_2_0)
	DebugPrint("FencePatch.Start")
end

function FencePatch.Stop(arg_3_0)
	DebugPrint("FencePatch.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("PopupPatching", true)

	arg_3_0._openedWaitPopup = false
end

function FencePatch.OpenPopup(arg_4_0)
	local var_4_0 = arg_4_0
	local var_4_1 = {
		displayWZWipSetup = true,
		onCancel = function(arg_5_0, arg_5_1)
			var_4_0._state = LUI.Fence.STATE.fail
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupPatching", false, nil, false, var_4_1, nil, true, true)

	arg_4_0._openedWaitPopup = true
end

function FencePatch.PostFail(arg_6_0)
	local var_6_0, var_6_1 = Fences.IBEEFACJG()

	if arg_6_0._state == LUI.Fence.STATE.fail then
		local var_6_2 = {
			controllerIndex = Engine.IJEBHJIJF()
		}

		if var_6_0 == FencePatch.CODE_STATE.update_needed then
			LUI.FlowManager.RequestPopupMenu(nil, "newPatchManifestRestart", false, var_6_2.controllerIndex, false, {}, nil, true, true)
		elseif var_6_0 == FencePatch.CODE_STATE.success_restart then
			if LUI.ShaderPreloadLayer then
				Dvar.DHEGHJJJHI("NRSSTQQSKK", false)
				LUI.ShaderPreloadLayer.ForceHideLayer()
			end

			LUI.FlowManager.RequestLeaveMenuByName("PopupPatching", true)
			LUI.FlowManager.RequestPopupMenu(nil, "PopupPatchingRestart", false, nil, false, {}, nil, true, true)
		elseif arg_6_0._errorCode then
			var_6_2.errorCode = arg_6_0._errorCode

			LUI.FlowManager.RequestPopupMenu(nil, "PopupPatchingError", false, nil, false, var_6_2, nil, false, false)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "PopupPatchingCancelled", false, nil, false, var_6_2, nil, false, false)
		end
	end
end

function FencePatch.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.pass

	local var_7_0, var_7_1 = Fences.IBEEFACJG()

	if var_7_0 == FencePatch.CODE_STATE.failure then
		arg_7_0._errorCode = var_7_1
		arg_7_0._state = LUI.Fence.STATE.fail
	elseif var_7_0 == FencePatch.CODE_STATE.success_restart then
		arg_7_0._state = LUI.Fence.STATE.fail
	elseif var_7_0 == FencePatch.CODE_STATE.active then
		arg_7_0._state = LUI.Fence.STATE.block
	elseif var_7_0 == FencePatch.CODE_STATE.update_needed then
		arg_7_0._state = LUI.Fence.STATE.fail
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedWaitPopup then
		arg_7_0:OpenPopup()
	end
end

function PopupPatching(arg_8_0, arg_8_1)
	assert(arg_8_1)

	arg_8_1.message = Engine.CBBHFCGDIC("LUA_MENU/PATCH_DOWNLOADING")

	local var_8_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopupWithProgress", arg_8_1)
	local var_8_1 = LUI.UITimer.new({
		interval = 200,
		event = "update_bar"
	})

	var_8_1.id = "timer"

	var_8_0:addElement(var_8_1)
	assert(var_8_0.SetProgress)
	var_8_1:registerEventHandler("update_bar", function(arg_9_0, arg_9_1)
		local var_9_0 = Fences.BDFABHEGGA()

		var_8_0:SetProgress(var_9_0)
	end)

	return var_8_0
end

function PopupPatchingError(arg_10_0, arg_10_1)
	assert(arg_10_1)
	assert(type(arg_10_1.errorCode) == "number")

	local var_10_0 = Engine.CIHDHDCIBE()

	if string.len(var_10_0) == 0 then
		var_10_0 = tostring(arg_10_1.errorCode)
	end

	Engine.DHCGHHBHCH()

	local var_10_1 = {
		controllerIndex = arg_10_1.controllerIndex,
		title = Engine.CBBHFCGDIC("LUA_MENU/PATCH_FAILED"),
		message = Engine.CBBHFCGDIC("LUA_MENU/PATCH_FAILED_DESC", var_10_0),
		buttons = BOOT.GetRetryPopupButtons(arg_10_1.controllerIndex)
	}
	local var_10_2 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_10_1)

	var_10_2.id = "PopupPatchingError"

	return var_10_2
end

function PopupPatchingCancelled(arg_11_0, arg_11_1)
	local var_11_0 = {
		controllerIndex = arg_11_1.controllerIndex,
		title = Engine.CBBHFCGDIC("LUA_MENU/PATCH_CANCELLED"),
		message = Engine.CBBHFCGDIC("LUA_MENU/PATCH_CANCELLED_DESC"),
		buttons = BOOT.GetRetryPopupButtons(arg_11_1.controllerIndex)
	}
	local var_11_1 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_11_0)

	var_11_1.id = "PopupPatchingCancelled"

	return var_11_1
end

function PopupPatchingRestart(arg_12_0, arg_12_1)
	assert(arg_12_1)

	local var_12_0 = 5
	local var_12_1 = Dvar.IBEGCHEFE("NONQSSLSSP")
	local var_12_2 = {
		noBackButton = true,
		cancel_will_close = false,
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = var_12_1 and Engine.CBBHFCGDIC("LUA_MENU/PATCH_UPDATE_RESTART_AUTO", var_12_0) or Engine.CBBHFCGDIC("LUA_MENU/PATCH_UPDATE_RESTART"),
		confirmation_action = function()
			Dvar.DHEGHJJJHI("MKKNSMLKPR", true)
			Dvar.BDEHAEGHAF("LQSPQSNQSN", "LUA_MENU/PATCH_UPDATE_SUCCESS")
			Engine.EBCGADABJ()
		end,
		countdownEvent = var_12_1,
		countdownStartTime = var_12_0,
		button_text = Engine.CBBHFCGDIC("LUA_MENU/RESTART_NOW")
	}
	local var_12_3 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_12_2)

	var_12_3.id = "PopupPatchingRestart"

	return var_12_3
end

MenuBuilder.registerType("PopupPatching", PopupPatching)
MenuBuilder.registerType("PopupPatchingError", PopupPatchingError)
MenuBuilder.registerType("PopupPatchingRestart", PopupPatchingRestart)
MenuBuilder.registerType("PopupPatchingCancelled", PopupPatchingCancelled)
LUI.Fence.Register("patch", FencePatch)
LockTable(_M)
