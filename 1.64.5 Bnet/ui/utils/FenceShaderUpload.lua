module(..., package.seeall)

FenceShaderUpload = LUI.Class(LUI.Fence)

function FenceShaderUpload.init(arg_1_0)
	FenceShaderUpload.super.init(arg_1_0)
end

function FenceShaderUpload.Start(arg_2_0)
	DebugPrint("FenceShaderUpload.Start")
	Dvar.DHEGHJJJHI("NSORSLLORM", false)
end

function FenceShaderUpload.Stop(arg_3_0)
	DebugPrint("FenceShaderUpload.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("ShaderUploadDialog", true)
	LUI.FlowManager.RequestLeaveMenuByName("CancelShaderUploadDialog", true)
end

function FenceShaderUpload.UpdateState(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.pass and Dvar.IBEGCHEFE("NSORSLLORM") then
		return
	end

	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	if ShaderUpload and ShaderUpload.CEIBACCEAF() then
		local var_4_0 = #Friends.BJDEIGDDCD() > 1
		local var_4_1 = Tournament.BEAIBEGFFB() or LUI.FlowManager.IsInStack(TOURNAMENT.GetMenuName("loading"))
		local var_4_2 = Lobby.BBDICGHE() or IsPrivateMatch() or var_4_1

		if not ShaderUpload.DDBFFCFJJJ() and not var_4_0 and not var_4_2 then
			ShaderUpload.BCJGJJJCGB()
		elseif ShaderUpload.DDBFFCFJJJ() and (var_4_0 or var_4_2) then
			ShaderUpload.DAFAIFDGCH()
		end
	else
		Dvar.DHEGHJJJHI("NSORSLLORM", true)
	end

	arg_4_0._state = LUI.Fence.STATE.pass
end

function ShaderUploadDialog(arg_5_0, arg_5_1)
	assert(arg_5_1)
	assert(arg_5_1.onCancelUpload)

	local var_5_0 = {
		controllerIndex = arg_5_1.controllerIndex,
		message = Engine.CBBHFCGDIC("PLATFORM_UI/SHADER_FRONTEND_PRELOAD_WAIT"),
		onCancel = function()
			local var_6_0 = {
				onCancelUpload = arg_5_1.onCancelUpload
			}

			LUI.FlowManager.RequestPopupMenu(nil, "CancelShaderUploadDialog", false, nil, false, var_6_0, nil, true, true)
		end
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopupWithProgress", var_5_0)
	local var_5_2 = LUI.UITimer.new({
		interval = 200,
		event = "update_bar"
	})

	var_5_2.id = "timer"

	var_5_1:addElement(var_5_2)
	assert(var_5_1.SetProgress)
	var_5_2:registerEventHandler("update_bar", function(arg_7_0, arg_7_1)
		local var_7_0 = ShaderUpload.EAACFJBCIB()

		var_5_1:SetProgress(var_7_0)
	end)

	return var_5_1
end

MenuBuilder.registerType("ShaderUploadDialog", ShaderUploadDialog)

function CancelShaderUploadDialog(arg_8_0, arg_8_1)
	assert(arg_8_1)
	assert(arg_8_1.onCancelUpload)

	local var_8_0 = {
		controllerIndex = arg_8_1.controllerIndex,
		yesAction = function(arg_9_0, arg_9_1)
			LUI.FlowManager.RequestLeaveMenuByName("CancelShaderUploadDialog", true)
			Dvar.DHEGHJJJHI("NSORSLLORM", false)
			ShaderUpload.DAFAIFDGCH()
			arg_8_1.onCancelUpload(arg_8_1.controllerIndex, arg_8_1.shouldLaunchTutorialWithoutPopup)
		end
	}
	local var_8_1 = MenuBuilder.BuildRegisteredType("CancelShaderUploadConfirmationPopup", var_8_0)

	var_8_1.id = "CancelShaderUploadDialog"

	return var_8_1
end

MenuBuilder.registerType("CancelShaderUploadDialog", CancelShaderUploadDialog)
LUI.Fence.Register("shaderUpload", FenceShaderUpload)
LockTable(_M)
