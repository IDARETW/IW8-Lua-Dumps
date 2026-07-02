module(..., package.seeall)

FencePlaylists = LUI.Class(LUI.Fence)
FencePlaylists.state = {
	UP_TO_DATE = 2,
	NEED_UPDATE = 0,
	UPDATING = 1
}

function FencePlaylists.init(arg_1_0)
	FencePlaylists.super.init(arg_1_0)
end

function FencePlaylists.Start(arg_2_0)
	DebugPrint("FencePlaylists.Start")

	arg_2_0._userCancelled = false
end

function FencePlaylists.Stop(arg_3_0)
	DebugPrint("FencePlaylists.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("UpdatingPlaylists", true)
	LUI.FlowManager.RequestLeaveMenuByName("OutdatedPlaylists", true)
end

function FencePlaylists.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail and not arg_4_0._userCancelled then
		local var_4_0 = Engine.IJEBHJIJF()

		if CONDITIONS.IsInGameBattlesMatch() then
			GAMEBATTLES.LeaveGameBattlesMenu(var_4_0)
		end

		LUI.FlowManager.RequestAddMenu("MainMenu", true, var_4_0)
		Matchmaking.BGCIDACCCJ()
		Tournament.DCEADJJC()
		Engine.DAGFFDGFII("xstopparty 0")
		LUI.FlowManager.RequestPopupMenu(nil, "OutdatedPlaylists", false, nil, false, {}, nil, false, false)
	end
end

function FencePlaylists.OpenUpdatingPopup(arg_5_0)
	arg_5_0._openedPopup = true

	local var_5_0 = arg_5_0
	local var_5_1 = {
		onCancel = function(arg_6_0, arg_6_1)
			DebugPrint("Cancelling FencePlaylists")

			var_5_0._state = LUI.Fence.STATE.fail
			var_5_0._userCancelled = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "UpdatingPlaylists", false, nil, false, var_5_1, nil, true, true)
end

function FencePlaylists.UpdateState(arg_7_0)
	assert(arg_7_0._state ~= LUI.Fence.STATE.fail)

	local var_7_0 = Fences.CDGIDCIBID()

	if var_7_0 == FencePlaylists.state.NEED_UPDATE then
		if not arg_7_0._passed then
			arg_7_0._state = LUI.Fence.STATE.block
		else
			arg_7_0._state = LUI.Fence.STATE.fail
		end
	elseif var_7_0 == FencePlaylists.state.UPDATING then
		arg_7_0._state = LUI.Fence.STATE.block
	elseif var_7_0 == FencePlaylists.state.UP_TO_DATE then
		arg_7_0._state = LUI.Fence.STATE.pass
		arg_7_0._passed = true
	else
		arg_7_0._state = LUI.Fence.STATE.fail

		assert(false, "Unexpected state for playlists fence")
	end

	if arg_7_0._state == LUI.Fence.STATE.block and not arg_7_0._openedPopup then
		arg_7_0:OpenUpdatingPopup()
	end
end

local function var_0_0(arg_8_0, arg_8_1)
	assert(arg_8_1 and arg_8_1.onCancel)

	local var_8_0 = {
		message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/UPDATING_PLAYLISTS"),
		cancel_func = arg_8_1.onCancel
	}
	local var_8_1 = "live_dialog_text_box"

	if Dvar.IBEGCHEFE("LRMTMPNPRK") then
		var_8_1 = "live_dialog_text_box_with_cancel"
	end

	local var_8_2 = MenuBuilder.BuildRegisteredType(var_8_1, var_8_0)

	var_8_2.id = "UpdatingPlaylists"

	return var_8_2
end

local function var_0_1()
	local var_9_0 = {
		message = Engine.CBBHFCGDIC("MPUI/DOWNLOADPLAYLIST")
	}
	local var_9_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_9_0)

	var_9_1.id = "OutdatedPlaylists"

	return var_9_1
end

MenuBuilder.registerType("UpdatingPlaylists", var_0_0)
MenuBuilder.registerType("OutdatedPlaylists", var_0_1)
LUI.Fence.Register("playlists", FencePlaylists)
LockTable(_M)
