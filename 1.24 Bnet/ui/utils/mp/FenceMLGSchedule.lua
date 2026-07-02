module(..., package.seeall)

FenceMLGSchedule = LUI.Class(LUI.Fence)

function FenceMLGSchedule.init(arg_1_0)
	LUI.Fence.init(arg_1_0)

	arg_1_0._historyRetrievalId = GAMEBATTLES.INVALID_MATCH_ID
end

function FenceMLGSchedule.Start(arg_2_0)
	arg_2_0.scheduleMaxRefreshAttempts = Dvar.CFHDGABACF("MTSPMLTTQR")
	arg_2_0.matchHistoryMaxRefreshAttempts = Dvar.CFHDGABACF("NSNOTQQLQO")
	arg_2_0.matchExpiredCheckInterval = 1000 * Dvar.CFHDGABACF("MSSQORPMRQ")
	arg_2_0.matchExpiredCheckMaxAttempts = 2

	local var_2_0 = Engine.IJEBHJIJF()

	arg_2_0._isEnteringFromMenu = false
	arg_2_0._refreshAttemptsForNoMatch = 0
	arg_2_0._refreshAttemptsForMatchHistoryFail = 0
	arg_2_0._matchExpiredCheckAttempts = 0
	arg_2_0._canCheckExpiredStatus = false

	if MLG.CCHJBFADHF(var_2_0) ~= 0 then
		arg_2_0._mustRefreshSchedule = true
	end

	if MLG.BIHFEHBCFB(var_2_0) == GAMEBATTLES.INVALID_MATCH_ID then
		arg_2_0._isEnteringFromMenu = true
	else
		local var_2_1 = GAMEBATTLES.GetFirstActiveMatch(var_2_0)

		if var_2_1 then
			MLG.DJHDFDDCAD(var_2_0, var_2_1.matchId)
		end
	end
end

function FenceMLGSchedule.Stop(arg_3_0)
	local var_3_0 = Engine.IJEBHJIJF()

	arg_3_0._historyRetrievalId = GAMEBATTLES.INVALID_MATCH_ID

	Engine.DBFFAEEFGJ():dispatchEventToRoot({
		name = "gamebattles_schedule_data_refreshed",
		controller = var_3_0
	})
	LUI.FlowManager.RequestLeaveMenuByName("popup_getting_mlg_schedule", true)

	arg_3_0._openedWaitPopup = false
end

function FenceMLGSchedule.OpenPopup(arg_4_0)
	local var_4_0 = arg_4_0
	local var_4_1 = {
		onCancel = function(arg_5_0, arg_5_1)
			var_4_0._state = LUI.Fence.STATE.fail
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_mlg_schedule", false, nil, false, var_4_1, nil, true, true)

	arg_4_0._openedWaitPopup = true
end

function FenceMLGSchedule.PostFail(arg_6_0)
	local var_6_0 = Engine.IJEBHJIJF()

	if arg_6_0._state == LUI.Fence.STATE.fail and arg_6_0._errorCode == GAMEBATTLES.MLG_ERR_CODE.MATCH_HISTORY_RETRIEVAL_ERROR then
		LUI.FlowManager.RequestPopupMenu(arg_6_0, "MLGGameBattlesMatchHistoryFailPopup", false, var_6_0, false, {
			controllerIndex = var_6_0
		})
	end
end

function FenceMLGSchedule.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.pass

	local var_7_0 = Engine.IJEBHJIJF()
	local var_7_1 = MLG.DEFJAJGIJH(var_7_0)

	if var_7_1 == GAMEBATTLES.MLG_SCHEDULE_STATE.RETRIEVING then
		arg_7_0._state = LUI.Fence.STATE.block
	elseif var_7_1 == GAMEBATTLES.MLG_SCHEDULE_STATE.UNAVAILABLE or GAMEBATTLES.shouldShowFenceToRefreshSchedule or arg_7_0._mustRefreshSchedule or arg_7_0._mustRefreshForNoMatch then
		if Dvar.IBEGCHEFE("NOLRNRPKTN") and GAMEBATTLES.HasJoinedMatch(var_7_0) and (GAMEBATTLES.shouldShowFenceToRefreshSchedule or arg_7_0._isEnteringFromMenu) then
			GAMEBATTLES.LeaveGameBattleMatchLobby(var_7_0)
		end

		if MLG.CCHJBFADHF(var_7_0) == 0 then
			GAMEBATTLES.shouldShowFenceToRefreshSchedule = false
			arg_7_0._mustRefreshSchedule = false

			if arg_7_0._mustRefreshForNoMatch then
				arg_7_0._refreshAttemptsForNoMatch = arg_7_0._refreshAttemptsForNoMatch + 1
				arg_7_0._mustRefreshForNoMatch = false
			end
		end

		arg_7_0._state = LUI.Fence.STATE.block
	elseif var_7_1 == GAMEBATTLES.MLG_SCHEDULE_STATE.RETRIEVAL_ERROR then
		arg_7_0._state = LUI.Fence.STATE.fail
	elseif var_7_1 == GAMEBATTLES.MLG_SCHEDULE_STATE.AVAILABLE then
		local var_7_2 = GAMEBATTLES.GetFirstActiveMatch(var_7_0)

		if var_7_2 then
			arg_7_0._mustRefreshForNoMatch = false

			local var_7_3 = var_7_2.matchId
			local var_7_4 = MLG.DJHDFDDCAD(var_7_0, var_7_3)

			if var_7_4 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.RETRIEVING then
				arg_7_0._state = LUI.Fence.STATE.block
			elseif var_7_4 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.RETRIEVAL_ERROR then
				if arg_7_0._refreshAttemptsForMatchHistoryFail <= arg_7_0.matchHistoryMaxRefreshAttempts then
					arg_7_0._state = LUI.Fence.STATE.block
					arg_7_0._mustRefreshMatchHistory = true
				else
					arg_7_0._state = LUI.Fence.STATE.fail
					arg_7_0._errorCode = GAMEBATTLES.MLG_ERR_CODE.MATCH_HISTORY_RETRIEVAL_ERROR

					MLG.ResetGameBattleMatchId(var_7_0)
				end
			elseif var_7_4 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.UNAVAILABLE and arg_7_0._historyRetrievalId ~= var_7_3 or arg_7_0._mustRefreshMatchHistory then
				if MLG.BBBHAJHHEJ(var_7_0, var_7_3) == 0 then
					arg_7_0._historyRetrievalId = var_7_3

					if arg_7_0._mustRefreshMatchHistory then
						arg_7_0._mustRefreshMatchHistory = false
						arg_7_0._refreshAttemptsForMatchHistoryFail = arg_7_0._refreshAttemptsForMatchHistoryFail + 1
					end
				end

				arg_7_0._state = LUI.Fence.STATE.block
			elseif var_7_4 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.AVAILABLE and MLG.BIHFEHBCFB(var_7_0) ~= var_7_3 then
				MLG.DEHBFHFDFJ(var_7_3)

				arg_7_0._state = LUI.Fence.STATE.block
			end
		elseif not arg_7_0._isEnteringFromMenu and arg_7_0._refreshAttemptsForNoMatch <= arg_7_0.scheduleMaxRefreshAttempts then
			arg_7_0._state = LUI.Fence.STATE.block
			arg_7_0._mustRefreshForNoMatch = true
		end

		if Dvar.IBEGCHEFE("OLTPPRMMKT") then
			local var_7_5 = next(GAMEBATTLES.expiredMatchesToConfirm)

			if var_7_5 then
				local var_7_6 = Engine.DBFFAEEFGJ()

				if not GAMEBATTLES.ExecutionCooldown(var_7_6, "matchExpiredCheckCooldown", arg_7_0.matchExpiredCheckInterval, function()
					MLG.IBGIEADG(var_7_0, var_7_5)

					arg_7_0._matchExpiredCheckAttempts = arg_7_0._matchExpiredCheckAttempts + 1
					arg_7_0._canCheckExpiredStatus = true
				end) and arg_7_0._canCheckExpiredStatus then
					local var_7_7 = MLG.EBEAGADAFA(var_7_0)

					if var_7_7 == GAMEBATTLES.MLG_MATCH_CHECK_STATE.FAILED or arg_7_0._matchExpiredCheckAttempts > arg_7_0.matchExpiredCheckMaxAttempts then
						GAMEBATTLES.confirmedExpiredMatches[var_7_5] = true
						GAMEBATTLES.expiredMatchesToConfirm[var_7_5] = nil
						arg_7_0._canCheckExpiredStatus = false
						arg_7_0._matchExpiredCheckAttempts = 0
					elseif var_7_7 ~= GAMEBATTLES.MLG_MATCH_CHECK_STATE.CHECK_IN_PROGRESS then
						GAMEBATTLES.confirmedExpiredMatches[var_7_5] = var_7_7 == GAMEBATTLES.MLG_MATCH_CHECK_STATE.MATCH_EXPIRED
						GAMEBATTLES.expiredMatchesToConfirm[var_7_5] = nil
						arg_7_0._canCheckExpiredStatus = false
					end
				end

				arg_7_0._state = LUI.Fence.STATE.block
			end
		end
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedWaitPopup then
		arg_7_0:OpenPopup()
	end
end

function PopupGettingMLGSchedule(arg_9_0, arg_9_1)
	assert(arg_9_1 and arg_9_1.onCancel)

	local var_9_0 = {
		message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/FENCE_MLGSCHEDULE"),
		cancel_func = arg_9_1.onCancel
	}
	local var_9_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_9_0)

	var_9_1.id = "popup_getting_mlg_data"

	return var_9_1
end

MenuBuilder.registerType("popup_getting_mlg_schedule", PopupGettingMLGSchedule)
LUI.Fence.Register("mlgSchedule", FenceMLGSchedule)
LockTable(_M)
