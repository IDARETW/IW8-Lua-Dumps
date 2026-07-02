module(..., package.seeall)

FenceTournament = LUI.Class(LUI.Fence)

function FenceTournament.init(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.super.init(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0._controllerIndex = arg_1_2

	assert(arg_1_0._controllerIndex)
end

function FenceTournament.Start(arg_2_0)
	DebugPrint("FenceTournament.Start")
end

function FenceTournament.Stop(arg_3_0)
	DebugPrint("FenceTournament.Stop")
	LUI.FlowManager.RequestLeaveMenuByName("tournament_inprogress_popup", true)

	arg_3_0._openedPopup = false
end

function FenceTournament.UpdateState(arg_4_0)
	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	local var_4_0 = Dvar.IBEGCHEFE("dev_banned_tournaments")

	if Tournament.EBIIIFGCD(arg_4_0._controllerIndex) or var_4_0 then
		if not arg_4_0._openedPopup then
			arg_4_0:ShowBannedPopup()
		end

		return
	end

	if Tournament.CJGIDBHHED() then
		arg_4_0._state = LUI.Fence.STATE.pass
	elseif not Tournament.BAEACBHFGF() then
		arg_4_0._state = LUI.Fence.STATE.fail
	else
		arg_4_0._state = LUI.Fence.STATE.block

		Engine.DHCGHHBHCH()
	end

	if arg_4_0._state == LUI.Fence.STATE.block and not arg_4_0._openedPopup then
		arg_4_0:ShowInProgressPopup()
	end
end

function FenceTournament.PostFail(arg_5_0)
	if arg_5_0._state == LUI.Fence.STATE.fail then
		Tournament.DCEADJJC()
		Lobby.LeavePublicLobby()
		Engine.DHCGHHBHCH()
	end
end

function FenceTournament.ShowBannedPopup(arg_6_0)
	local var_6_0 = {
		onAccept = function(arg_7_0, arg_7_1)
			arg_6_0._state = LUI.Fence.STATE.fail
		end,
		duration = Tournament.BJCAJFJJCA(controllerIndex)
	}

	LUI.FlowManager.RequestPopupMenu(nil, "TournamentBannedPopup", false, nil, false, var_6_0)

	arg_6_0._openedPopup = true
end

function FenceTournament.ShowInProgressPopup(arg_8_0)
	local var_8_0 = {
		message = Engine.CBBHFCGDIC("MENU/FETCHING_TOURNAMENT_BRACKET"),
		onCancel = function(arg_9_0, arg_9_1)
			arg_8_0._state = LUI.Fence.STATE.fail
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "tournament_inprogress_popup", false, nil, false, var_8_0, nil, true, true)

	arg_8_0._openedPopup = true
end

LUI.Fence.Register("tournament", FenceTournament)
LockTable(_M)
