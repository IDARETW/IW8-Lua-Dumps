module(..., package.seeall)

FenceCanCreateEmblem = LUI.Class(LUI.Fence)

function FenceCanCreateEmblem.init(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._controllerIndex = arg_1_2
	arg_1_0._openingAction = arg_1_3.openingAction

	FenceCanCreateEmblem.super.init(arg_1_0)
end

function FenceCanCreateEmblem.Start(arg_2_0)
	DebugPrint("FenceCanCreateEmblem.Start")
end

function FenceCanCreateEmblem.Stop(arg_3_0)
	DebugPrint("FenceCanCreateEmblem.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("FenceDownloadingEmblems")

	arg_3_0._openedPopup = false
end

function FenceCanCreateEmblem.PostFail(arg_4_0)
	LUI.FlowManager.RequestPopupMenu(nil, "EmblemSlotLimitReachedPopup", true, arg_4_0._controllerIndex, false)
end

function FenceCanCreateEmblem.UpdateState(arg_5_0)
	local var_5_0 = EmblemEditor.CEBIJCHJFE()

	if var_5_0 and arg_5_0._openingAction == "edit" then
		arg_5_0._state = LUI.Fence.STATE.pass
	end

	if arg_5_0._state == LUI.Fence.STATE.pass then
		return
	end

	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.block

	local var_5_1 = "frontEnd.MP.conquest.emblemEditor.custom."
	local var_5_2 = LUI.DataSourceInControllerModel.new(var_5_1 .. "downloadFinished"):GetValue(arg_5_0._controllerIndex)

	if var_5_0 and var_5_2 then
		local var_5_3 = LUI.DataSourceInControllerModel.new(var_5_1 .. "count")
		local var_5_4 = LUI.DataSourceInControllerModel.new(var_5_1 .. "totalSlots")
		local var_5_5 = var_5_3:GetValue(arg_5_0._controllerIndex)

		if var_5_4:GetValue(arg_5_0._controllerIndex) > var_5_5 - 1 then
			arg_5_0._state = LUI.Fence.STATE.pass
		else
			arg_5_0._state = LUI.Fence.STATE.fail
		end
	elseif not arg_5_0._openedPopup then
		local var_5_6 = arg_5_0
		local var_5_7 = {
			controllerIndex = arg_5_0._controllerIndex
		}

		LUI.FlowManager.RequestPopupMenu(nil, "FenceDownloadingEmblems", false, nil, false, var_5_7, nil, true, true)

		arg_5_0._openedPopup = true
	end
end

function FenceDownloadingEmblems(arg_6_0, arg_6_1)
	arg_6_1 = arg_6_1 or {}

	local var_6_0 = {
		message = arg_6_1.message or Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/DOWNLOADING_EMBLEMS"),
		controllerIndex = arg_6_1.controllerIndex or Engine.IJEBHJIJF()
	}

	return MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_6_0)
end

MenuBuilder.registerType("FenceDownloadingEmblems", FenceDownloadingEmblems)
LUI.Fence.Register("canCreateEmblem", FenceCanCreateEmblem)
LockTable(_M)
