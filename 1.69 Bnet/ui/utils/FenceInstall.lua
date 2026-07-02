module(..., package.seeall)

FenceInstall = LUI.Class(LUI.Fence)

function FenceInstall.init(arg_1_0, arg_1_1)
	assert(type(arg_1_1) == "string")
	FenceInstall.super.init(arg_1_0)

	arg_1_0._packageName = arg_1_1
end

function FenceInstall.Start(arg_2_0)
	assert(arg_2_0._packageName)
	DebugPrint("FenceInstall.Start")
end

function FenceInstall.Stop(arg_3_0)
	DebugPrint("FenceInstall.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("FenceStreamingInstall", true)

	arg_3_0._openedPopup = false
end

function FenceInstall.UpdateState(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.pass then
		return
	end

	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	arg_4_0._state = LUI.Fence.STATE.block

	local var_4_0, var_4_1 = Engine.BJCCIACEHG()

	if var_4_0 == 1 and var_4_1 == 0 then
		arg_4_0._state = LUI.Fence.STATE.pass
	elseif not arg_4_0._openedPopup then
		local var_4_2 = arg_4_0
		local var_4_3 = {
			onCancel = function()
				var_4_2._state = LUI.Fence.STATE.fail
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "FenceStreamingInstall", false, nil, false, var_4_3, nil, true, true)

		arg_4_0._openedPopup = true
	end
end

function FenceStreamingInstall(arg_6_0, arg_6_1)
	assert(arg_6_1)

	arg_6_1.message = Engine.CBBHFCGDIC("MENU/STREAMING_INSTALL_IN_PROGRESS")

	local var_6_0 = MenuBuilder.BuildRegisteredType("FenceDialogPopupWithProgress", arg_6_1)
	local var_6_1 = LUI.UITimer.new({
		interval = 200,
		event = "update_streaming_bar"
	})

	var_6_1.id = "timer"

	var_6_0:addElement(var_6_1)
	assert(var_6_0.SetProgress)
	var_6_1:registerEventHandler("update_streaming_bar", function(arg_7_0, arg_7_1)
		local var_7_0, var_7_1 = Engine.BJCCIACEHG()

		var_6_0:SetProgress(var_7_0)
	end)

	return var_6_0
end

MenuBuilder.registerType("FenceStreamingInstall", FenceStreamingInstall)

FenceMPInstall = LUI.Class(FenceInstall)

function FenceMPInstall.init(arg_8_0)
	FenceMPInstall.super.init(arg_8_0, "mp")
end

LUI.Fence.Register("mpInstall", FenceMPInstall)

FenceSPInstall = LUI.Class(FenceInstall)

function FenceSPInstall.init(arg_9_0)
	FenceSPInstall.super.init(arg_9_0, "sp")
end

LUI.Fence.Register("spInstall", FenceSPInstall)
LockTable(_M)
