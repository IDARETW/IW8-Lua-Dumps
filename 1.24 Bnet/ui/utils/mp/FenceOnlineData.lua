module(..., package.seeall)

FenceOnlineData = LUI.Class(LUI.Fence)
FenceOnlineData.CODE_STATE = {
	downloading = 2,
	inactive = 0,
	success = 3,
	requested = 1,
	failure = 4
}
FenceOnlineData.CONTROLLER_FENCE_STATE = {
	pass = 2,
	block = 3,
	fail = 4,
	inactive = 1
}
FenceOnlineData.GAMEMODE_TYPE = {
	sp = 1,
	mp = 2,
	cp = 3,
	none = 0
}

function FenceOnlineData.init(arg_1_0, arg_1_1)
	LUI.Fence.init(arg_1_0)

	arg_1_0._perController = {}
	arg_1_0._gameMode = arg_1_1

	for iter_1_0 = 0, Engine.DCJGJDDEHE() - 1 do
		Fences.CFIIIAEBDD(iter_1_0, arg_1_0._gameMode)

		arg_1_0._perController[iter_1_0] = {
			isCancelling = false,
			fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.inactive
		}
	end
end

function FenceOnlineData.Start(arg_2_0)
	DebugPrint("FenceOnlineData.Start")
end

function FenceOnlineData.Stop(arg_3_0)
	DebugPrint("FenceOnlineData.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("popup_getting_data", true)

	arg_3_0._openedWaitPopup = false
end

function FenceOnlineData.OpenPopup(arg_4_0)
	local var_4_0 = arg_4_0
	local var_4_1 = {
		onCancel = function(arg_5_0, arg_5_1)
			DebugPrint("Cancelling FenceOnlineData")

			var_4_0._perController[arg_5_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data", false, nil, false, var_4_1, nil, true, true)

	arg_4_0._openedWaitPopup = true
end

function FenceOnlineData.OnBackOut(arg_6_0)
	for iter_6_0 = 0, Engine.DCJGJDDEHE() - 1 do
		Fences.CFIIIAEBDD(iter_6_0, arg_6_0._gameMode)
	end
end

function FenceOnlineData.PostFail(arg_7_0)
	if arg_7_0._state == LUI.Fence.STATE.fail then
		local var_7_0 = Engine.IJEBHJIJF()

		if not Engine.CGABICJHAI() and not CONDITIONS.ForceOnlineMenus() then
			LUI.FlowManager.RequestAddMenu("MainMenuOffline", true, var_7_0)
		end

		if arg_7_0._errorCode then
			Fences.IABFCACDD(var_7_0)

			if Dvar.IBEGCHEFE("NNLMOPLQQO") then
				LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error_with_fence_status", false, var_7_0, false, {
					errorCode = arg_7_0._errorCode,
					gameMode = arg_7_0._gameMode
				}, nil, false, false)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error", false, var_7_0, false, {
					errorCode = arg_7_0._errorCode
				}, nil, false, false)
			end
		else
			LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_cancelled", false, var_7_0, false, {}, nil, false, false)
		end
	end
end

function FenceOnlineData.UpdateState(arg_8_0)
	assert(arg_8_0._state ~= LUI.Fence.STATE.fail)

	for iter_8_0 = 0, Engine.DCJGJDDEHE() - 1 do
		local var_8_0 = Engine.BBHAECABBD(iter_8_0)
		local var_8_1 = var_8_0 and Engine.DBAEJAHFGJ(iter_8_0)

		if var_8_0 and not var_8_1 then
			local var_8_2, var_8_3 = Fences.CIHFIEHIDE(iter_8_0, arg_8_0._gameMode)

			if var_8_2 == FenceOnlineData.CODE_STATE.inactive then
				Fences.CFFIJIBGA(iter_8_0, arg_8_0._gameMode, true)

				var_8_2, var_8_3 = Fences.CIHFIEHIDE(iter_8_0, arg_8_0._gameMode)
			end

			if var_8_2 == FenceOnlineData.CODE_STATE.failure then
				arg_8_0._perController[iter_8_0].errorCode = var_8_3
				arg_8_0._perController[iter_8_0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.fail
			elseif var_8_2 ~= FenceOnlineData.CODE_STATE.success then
				arg_8_0._perController[iter_8_0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.block
			else
				arg_8_0._perController[iter_8_0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.pass
			end

			if arg_8_0._perController[iter_8_0].isCancelling then
				arg_8_0._perController[iter_8_0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.fail
				arg_8_0._perController[iter_8_0].errorCode = nil
			end
		else
			arg_8_0._perController[iter_8_0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.inactive
			arg_8_0._perController[iter_8_0].isCancelling = false
			arg_8_0._perController[iter_8_0].errorCode = nil
		end
	end

	local var_8_4 = 0
	local var_8_5 = 0
	local var_8_6 = 0

	for iter_8_1 = 0, Engine.DCJGJDDEHE() - 1 do
		if arg_8_0._perController[iter_8_1].fenceState == FenceOnlineData.CONTROLLER_FENCE_STATE.pass then
			var_8_4 = var_8_4 + 1
		end

		if arg_8_0._perController[iter_8_1].fenceState == FenceOnlineData.CONTROLLER_FENCE_STATE.block then
			var_8_5 = var_8_5 + 1
		end

		if arg_8_0._perController[iter_8_1].fenceState == FenceOnlineData.CONTROLLER_FENCE_STATE.fail then
			var_8_6 = var_8_6 + 1
		end
	end

	assert(var_8_6 + var_8_5 + var_8_4 > 0, "No active local clients")

	if var_8_6 > 0 then
		for iter_8_2 = 0, Engine.DCJGJDDEHE() - 1 do
			if arg_8_0._perController[iter_8_2].fenceState == FenceOnlineData.CONTROLLER_FENCE_STATE.fail then
				local var_8_7 = arg_8_0._perController[iter_8_2].errorCode

				if var_8_4 > 0 and not Lobby.BJBBDIDHDA(iter_8_2) then
					DebugPrint("Controller #" .. tostring(iter_8_2) .. " does not have online data. Making client inactive.")

					arg_8_0._state = LUI.Fence.STATE.block

					Engine.CIHFHAIIHC(iter_8_2)

					if var_8_7 then
						assert(type(var_8_7) == "number")
						Fences.IABFCACDD(iter_8_2)

						if Dvar.IBEGCHEFE("NNLMOPLQQO") then
							LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error_with_fence_status", false, iter_8_2, false, {
								errorCode = arg_8_0._errorCode,
								gameMode = arg_8_0._gameMode
							}, nil, false, false)

							break
						end

						LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_data_error", false, iter_8_2, false, {
							errorCode = var_8_7
						}, nil, false, true)
					end

					break
				end

				arg_8_0._errorCode = var_8_7
				arg_8_0._state = LUI.Fence.STATE.fail

				break
			end
		end
	elseif var_8_5 > 0 then
		arg_8_0._state = LUI.Fence.STATE.block
	elseif var_8_4 > 0 then
		arg_8_0._state = LUI.Fence.STATE.pass
	else
		assert(false, "Unexpected state")

		arg_8_0._state = LUI.Fence.STATE.block
	end

	if arg_8_0._state == LUI.Fence.STATE.pass and Engine.EAIICIFIFA() then
		InitCPRankedDataSources()
	end

	if arg_8_0._state == LUI.Fence.STATE.block and not arg_8_0._openedWaitPopup then
		arg_8_0:OpenPopup()
	end
end

function PopupGettingData(arg_9_0, arg_9_1)
	assert(arg_9_1 and arg_9_1.onCancel)

	local var_9_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_ONLINEDATA"),
		cancel_func = arg_9_1.onCancel
	}
	local var_9_1

	if Engine.CGABICJHAI() then
		var_9_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_9_0)
	else
		var_9_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_9_0)
	end

	var_9_1.id = "popup_getting_data"

	return var_9_1
end

function PopupGettingDataError(arg_10_0, arg_10_1)
	assert(arg_10_1 and arg_10_1.errorCode)

	local var_10_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message_text = Engine.CBBHFCGDIC("EXE/ERR_ONLINE_DATA", arg_10_1.errorCode)
	}

	if Engine.CGABICJHAI() then
		var_10_0.button_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP")

		function var_10_0.confirmation_action(arg_11_0, arg_11_1)
			Engine.DJEDDFJEIG()
		end
	end

	local var_10_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_10_0)

	var_10_1.id = "popup_getting_data_error"

	return var_10_1
end

function PopupGettingDataCancelled(arg_12_0, arg_12_1)
	local var_12_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("MENU/POPUP_ONLINEDATA_CANCELLED"),
		label = Engine.CBBHFCGDIC("MENU/OK")
	}
	local var_12_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_12_0)

	var_12_1.id = "popup_getting_data_cancelled"

	return var_12_1
end

function PopupGettingDataErrorWithFenceStatusString(arg_13_0, arg_13_1)
	assert(arg_13_1 and arg_13_1.errorCode and arg_13_1.gameMode)

	local var_13_0 = ""

	if Dvar.IBEGCHEFE("NSPMLKQLOS") then
		var_13_0 = Fences.GADAACFC(arg_13_1.controllerIndex, arg_13_1.gameMode)
	end

	local var_13_1 = Engine.CBBHFCGDIC("MENU/OK")
	local var_13_2

	if Engine.CGABICJHAI() then
		var_13_1 = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP")

		function var_13_2(arg_14_0, arg_14_1)
			Engine.DJEDDFJEIG()
		end
	end

	local var_13_3 = arg_13_1.controllerIndex

	if not var_13_3 then
		DebugPrint("Warning: opening popup for unspecified controllerIndex")

		var_13_3 = 0
	end

	local var_13_4 = {
		controllerIndex = var_13_3,
		title = Engine.CBBHFCGDIC("MENU/ERROR")
	}

	var_13_4.noBackButton = true
	var_13_4.cancelClosesPopup = false
	var_13_4.listContent = {}

	local var_13_5 = Engine.CBBHFCGDIC("EXE/ERR_ONLINE_DATA", arg_13_1.errorCode) .. " " .. var_13_0
	local var_13_6 = 24

	if IsLanguageArabic() then
		var_13_6 = 36
	end

	local var_13_7 = LUI.UIText.new()

	var_13_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_13_6 * _1080p)
	var_13_7:SetAlignment(LUI.Alignment.Center)
	var_13_7:SetRGBFromTable(SWATCHES.genericButton.description, 0)

	if Engine.CGABICJHAI() then
		var_13_7:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	else
		var_13_7:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	end

	var_13_7.id = "message"

	var_13_7:setText(var_13_5)
	table.insert(var_13_4.listContent, var_13_7)

	local var_13_8 = MenuBuilder.BuildRegisteredType("PopupButton", {
		controllerIndex = var_13_3
	})

	var_13_8:SetLeftAnchor(0.5)
	var_13_8:SetRightAnchor(0.5)
	var_13_8:SetLeft(-200)
	var_13_8:SetRight(200)

	var_13_8.id = "ok_button"
	var_13_8.action = var_13_2

	var_13_8:SetText(var_13_1)
	var_13_8:addEventHandler("button_action", function(arg_15_0, arg_15_1)
		assert(arg_15_1.controller)

		if var_13_8.action then
			var_13_8.action(arg_15_0, arg_15_1.controller)
		end

		LUI.FlowManager.RequestLeaveMenu(arg_15_0, true, false)
	end)
	table.insert(var_13_4.listContent, var_13_8)

	local var_13_9 = "\n" .. Fences.CHBEJGEFFG(arg_13_1.controllerIndex) .. "\n"
	local var_13_10
	local var_13_11 = LUI.UIStyledText.new()

	var_13_11.id = "FenceErrorStatus"

	var_13_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 25, 40)
	var_13_11:SetAlignment(LUI.Alignment.Center)
	var_13_11:SetRGBFromTable(SWATCHES.Popups.highlight, 0)
	var_13_11:setText(var_13_9, 0)
	var_13_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_11:SetWordWrap(true)
	table.insert(var_13_4.listContent, var_13_11)

	local var_13_12 = MenuBuilder.BuildRegisteredType("PopupList", var_13_4)

	var_13_12.id = "popup_getting_data_error_with_fence_status"

	Engine.BJDBIAGIDA(SOUND_SETS.default.popup)

	return var_13_12
end

MenuBuilder.registerType("popup_getting_data", PopupGettingData)
MenuBuilder.registerType("popup_getting_data_error", PopupGettingDataError)
MenuBuilder.registerType("popup_getting_data_error_with_fence_status", PopupGettingDataErrorWithFenceStatusString)
MenuBuilder.registerType("popup_getting_data_cancelled", PopupGettingDataCancelled)
LUI.Fence.Register("onlineData", FenceOnlineData)

FenceMainOnlineData = LUI.Class(FenceOnlineData)

function FenceMainOnlineData.init(arg_16_0)
	FenceMainOnlineData.super.init(arg_16_0, FenceOnlineData.GAMEMODE_TYPE.none)
end

LUI.Fence.Register("mainOnlineData", FenceMainOnlineData)

FenceSPOnlineData = LUI.Class(FenceOnlineData)

function FenceSPOnlineData.init(arg_17_0)
	FenceSPOnlineData.super.init(arg_17_0, FenceOnlineData.GAMEMODE_TYPE.sp)
end

LUI.Fence.Register("spOnlineData", FenceSPOnlineData)

FenceMPOnlineData = LUI.Class(FenceOnlineData)

function FenceMPOnlineData.init(arg_18_0)
	FenceMPOnlineData.super.init(arg_18_0, FenceOnlineData.GAMEMODE_TYPE.mp)
end

LUI.Fence.Register("mpOnlineData", FenceMPOnlineData)

FenceCPOnlineData = LUI.Class(FenceOnlineData)

function FenceCPOnlineData.init(arg_19_0)
	FenceCPOnlineData.super.init(arg_19_0, FenceOnlineData.GAMEMODE_TYPE.cp)
end

LUI.Fence.Register("cpOnlineData", FenceCPOnlineData)
LockTable(_M)
