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
	LUI.FlowManager.RequestLeaveMenuByName("BadDisplayDriverPopup", true)
	LUI.FlowManager.RequestLeaveMenuByName("BadDisplayDriverConfirmationPopup", true)
end

function FenceShaderUpload.UpdateState(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.pass and Dvar.IBEGCHEFE("NSORSLLORM") then
		return
	end

	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	if Engine.CJHIJHGAAE and not Engine.CJHIJHGAAE() and not Dvar.IBEGCHEFE("LMONTKNNTT") then
		arg_4_0._state = LUI.Fence.STATE.block

		if not LUI.FlowManager.IsInStack("BadDisplayDriverPopup") then
			LUI.FlowManager.RequestPopupMenu(nil, "BadDisplayDriverPopup", false, nil, false, {}, nil, true, true)
		end

		return
	end

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
			arg_8_1.onCancelUpload()
		end
	}
	local var_8_1 = MenuBuilder.BuildRegisteredType("CancelShaderUploadConfirmationPopup", var_8_0)

	var_8_1.id = "CancelShaderUploadDialog"

	return var_8_1
end

MenuBuilder.registerType("CancelShaderUploadDialog", CancelShaderUploadDialog)

function BadDisplayDriverPopup()
	local var_10_0 = {}

	var_10_0.cancelClosesPopup = false
	var_10_0.buttonsClosePopup = false
	var_10_0.title = Engine.CBBHFCGDIC("PLATFORM_UI/DISPLAY_DRIVER_UPDATE_TITLE")

	if Dvar.IBEGCHEFE("LOKPQTOPSM") then
		local var_10_1 = Dvar.DHEEJCCJBH("MORLKTLOSS")

		var_10_0.message = Engine.CBBHFCGDIC("PLATFORM_UI/DISPLAY_DRIVER_UPDATE_MESSAGE_AMD", var_10_1)
	else
		local var_10_2 = Dvar.DHEEJCCJBH("LTKKLTRKLT")

		var_10_0.message = Engine.CBBHFCGDIC("PLATFORM_UI/DISPLAY_DRIVER_UPDATE_MESSAGE_NVIDIA", var_10_2)
	end

	var_10_0.buttons = {}

	table.insert(var_10_0.buttons, {
		label = Engine.CBBHFCGDIC("LUA_MENU/EXIT_GAME"),
		action = function()
			Engine.DJEDDFJEIG()
		end
	})
	table.insert(var_10_0.buttons, {
		label = Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"),
		action = function()
			LUI.FlowManager.RequestPopupMenu(nil, "BadDisplayDriverConfirmationPopup", false, nil, false, {}, nil, true, true)
		end
	})

	local var_10_3 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_10_0)

	var_10_3.id = "BadDisplayDriverPopup"

	return var_10_3
end

MenuBuilder.registerType("BadDisplayDriverPopup", BadDisplayDriverPopup)

function BadDisplayDriverConfirmationPopup()
	local var_13_0 = {}

	var_13_0.cancelClosesPopup = false
	var_13_0.title = Engine.CBBHFCGDIC("MENU/WARNING")
	var_13_0.message = Engine.CBBHFCGDIC("PLATFORM_UI/DISPLAY_DRIVER_UPDATE_MESSAGE_WARNING")

	function var_13_0.yesAction()
		Dvar.DHEGHJJJHI("LMONTKNNTT", true)
		LUI.FlowManager.RequestLeaveMenuByName("BadDisplayDriverConfirmationPopup", true)
		LUI.FlowManager.RequestLeaveMenuByName("BadDisplayDriverPopup", true)
	end

	local var_13_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_13_0)

	var_13_1.id = "BadDisplayDriverConfirmationPopup"

	return var_13_1
end

MenuBuilder.registerType("BadDisplayDriverConfirmationPopup", BadDisplayDriverConfirmationPopup)
LUI.Fence.Register("shaderUpload", FenceShaderUpload)
LockTable(_M)
