module(..., package.seeall)

FenceMLGAccount = LUI.Class(LUI.Fence)

function FenceMLGAccount.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceMLGAccount.Start(arg_2_0)
	local var_2_0 = Engine.IJEBHJIJF()

	if MLG.BIHFEHBCFB(var_2_0) == GAMEBATTLES.INVALID_MATCH_ID then
		MLG.DEEAEDDFCA(var_2_0)
	end
end

function FenceMLGAccount.Stop(arg_3_0)
	LUI.FlowManager.RequestLeaveMenuByName("popup_getting_mlg_account", true)

	arg_3_0._openedWaitPopup = false
end

function FenceMLGAccount.OpenPopup(arg_4_0)
	local var_4_0 = arg_4_0
	local var_4_1 = {
		onCancel = function(arg_5_0, arg_5_1)
			var_4_0._state = LUI.Fence.STATE.fail
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_getting_mlg_account", false, nil, false, var_4_1, nil, true, true)

	arg_4_0._openedWaitPopup = true
end

function FenceMLGAccount.PostFail(arg_6_0)
	local var_6_0 = Engine.IJEBHJIJF()

	if arg_6_0._state == LUI.Fence.STATE.fail then
		if arg_6_0._errorCode == GAMEBATTLES.MLG_ERR_CODE.CANNOT_CONNECT then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "MLGGamebattlesCannotConnectPopup", false, var_6_0, false, {
				controllerIndex = var_6_0
			})
		elseif arg_6_0._errorCode == GAMEBATTLES.MLG_ERR_CODE.NO_SOCIAL_PRIVILEGES then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "MLGGamebattlesNoSocialNetworkPrivilegesPopup", false, var_6_0, false, {
				controllerIndex = var_6_0
			})
		elseif arg_6_0._errorCode == GAMEBATTLES.MLG_ERR_CODE.USER_NOT_REGISTERED then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "MLGGamebattlesUnregisteredPopup", false, var_6_0, false, {
				controllerIndex = var_6_0
			})
		elseif arg_6_0._errorCode == GAMEBATTLES.MLG_ERR_CODE.FIRST_TIME_ENTRY then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "MLGGamebattlesFirstTimePopup", false, var_6_0, false, {
				controllerIndex = var_6_0
			})
		end
	end
end

function FenceMLGAccount.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	arg_7_0._state = LUI.Fence.STATE.pass

	local var_7_0 = Engine.IJEBHJIJF()
	local var_7_1 = MLG.CGJCACCIDH(var_7_0)

	if Engine.BAHIIBFDDG() and not Engine.CDCBBGFHJA(var_7_0) then
		arg_7_0._state = LUI.Fence.STATE.fail
		arg_7_0._errorCode = GAMEBATTLES.MLG_ERR_CODE.NO_SOCIAL_PRIVILEGES
	elseif var_7_1 == GAMEBATTLES.MLG_ACCOUNT_STATE.RETRIEVING then
		arg_7_0._state = LUI.Fence.STATE.block
	elseif var_7_1 == GAMEBATTLES.MLG_ACCOUNT_STATE.UNAVAILABLE then
		arg_7_0._state = LUI.Fence.STATE.block

		MLG.DEEAEDDFCA(var_7_0)
	elseif var_7_1 == GAMEBATTLES.MLG_ACCOUNT_STATE.NO_ACCOUNT then
		arg_7_0._state = LUI.Fence.STATE.fail
		arg_7_0._errorCode = GAMEBATTLES.MLG_ERR_CODE.USER_NOT_REGISTERED
	elseif var_7_1 == GAMEBATTLES.MLG_ACCOUNT_STATE.ACCOUNT_ERROR then
		arg_7_0._state = LUI.Fence.STATE.fail
		arg_7_0._errorCode = GAMEBATTLES.MLG_ERR_CODE.CANNOT_CONNECT
	elseif var_7_1 == GAMEBATTLES.MLG_ACCOUNT_STATE.HAS_ACCOUNT and not PlayerData.BFFBGAJGD(var_7_0, CoD.StatsGroup.Common).registeredToGamebattles:get() then
		arg_7_0._state = LUI.Fence.STATE.fail
		arg_7_0._errorCode = GAMEBATTLES.MLG_ERR_CODE.FIRST_TIME_ENTRY
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedWaitPopup then
		arg_7_0:OpenPopup()
	end
end

function PopupGettingMLGAccount(arg_8_0, arg_8_1)
	assert(arg_8_1 and arg_8_1.onCancel)

	local var_8_0 = {
		message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/FENCE_MLGACCOUNT"),
		cancel_func = arg_8_1.onCancel
	}
	local var_8_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box_with_cancel", var_8_0)

	var_8_1.id = "popup_getting_mlg_account"

	return var_8_1
end

MenuBuilder.registerType("popup_getting_mlg_account", PopupGettingMLGAccount)
LUI.Fence.Register("mlgAccount", FenceMLGAccount)
LockTable(_M)
