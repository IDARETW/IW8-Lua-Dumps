module(..., package.seeall)

FenceMLGData = LUI.Class(LUI.Fence)

function FenceMLGData.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

local function var_0_0(arg_2_0, arg_2_1)
	local var_2_0 = GAMEBATTLES.GetFirstActiveMatch(arg_2_1)

	if var_2_0 then
		MLG.BBBHAJHHEJ(arg_2_1, var_2_0.matchId)
	end
end

function FenceMLGData.Start(arg_3_0)
	local var_3_0 = Engine.IJEBHJIJF()

	var_0_0(arg_3_0, var_3_0)
end

function FenceMLGData.Stop(arg_4_0)
	local var_4_0 = Engine.IJEBHJIJF()
	local var_4_1 = GAMEBATTLES.GetFirstActiveMatch(var_4_0)
	local var_4_2

	if var_4_1 then
		var_4_2 = var_4_1.matchId
	end

	if not var_4_1 or MLG.BIHFEHBCFB(var_4_0) == var_4_2 then
		Engine.DBFFAEEFGJ():dispatchEventToRoot({
			name = "gamebattles_schedule_data_refreshed",
			controller = var_4_0
		})
	end

	LUI.FlowManager.RequestLeaveMenuByName("popup_getting_mlg_data", true)

	arg_4_0._openedWaitPopup = false
end

function FenceMLGData.OpenPopup(arg_5_0)
	local var_5_0 = arg_5_0
	local var_5_1 = {
		onCancel = function(arg_6_0, arg_6_1)
			var_5_0._state = LUI.Fence.STATE.fail
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_mlg_data", false, nil, false, var_5_1, nil, true, true)

	arg_5_0._openedWaitPopup = true
end

function FenceMLGData.PostFail(arg_7_0)
	local var_7_0 = Engine.IJEBHJIJF()

	if arg_7_0._state == LUI.Fence.STATE.fail and arg_7_0._errorCode == GAMEBATTLES.MLG_ERR_CODE.MATCH_HISTORY_RETRIEVAL_ERROR then
		LUI.FlowManager.RequestPopupMenu(arg_7_0, "MLGGameBattlesMatchHistoryFailPopup", false, var_7_0, false, {
			controllerIndex = var_7_0
		})
	end
end

function FenceMLGData.UpdateState(arg_8_0)
	assert(arg_8_0._state ~= LUI.Fence.STATE.fail)

	arg_8_0._state = LUI.Fence.STATE.pass

	local var_8_0 = Engine.IJEBHJIJF()
	local var_8_1 = MLG.DJHDFDDCAD(var_8_0, MLG.BIHFEHBCFB(var_8_0))

	if var_8_1 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.RETRIEVING then
		arg_8_0._state = LUI.Fence.STATE.block
	elseif var_8_1 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.RETRIEVAL_ERROR then
		arg_8_0._state = LUI.Fence.STATE.fail
		arg_8_0._errorCode = GAMEBATTLES.MLG_ERR_CODE.MATCH_HISTORY_RETRIEVAL_ERROR

		MLG.ResetGameBattleMatchId(var_8_0)
	elseif var_8_1 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.UNAVAILABLE then
		local var_8_2 = GAMEBATTLES.GetFirstActiveMatch(var_8_0)

		if var_8_2 then
			MLG.BBBHAJHHEJ(var_8_0, var_8_2.matchId)

			arg_8_0._state = LUI.Fence.STATE.block
		end
	end

	if arg_8_0._state == LUI.Fence.STATE.block and not arg_8_0._openedWaitPopup then
		arg_8_0:OpenPopup()
	end
end

function PopupGettingData(arg_9_0, arg_9_1)
	assert(arg_9_1 and arg_9_1.onCancel)

	local var_9_0 = {
		message = Engine.CBBHFCGDIC("MENU/POPUP_MLGDATA"),
		cancel_func = arg_9_1.onCancel
	}
	local var_9_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_9_0)

	var_9_1.id = "popup_getting_mlg_data"

	return var_9_1
end

MenuBuilder.registerType("popup_getting_mlg_data", PopupGettingData)
LUI.Fence.Register("mlgData", FenceMLGData)
LockTable(_M)
