module(..., package.seeall)

FenceStatsReset = LUI.Class(LUI.Fence)
FenceStatsReset.CODE_STATE = {
	RESET_STATS_REASON_GUEST = 3,
	RESET_STATS_NO_RESET = 0,
	RESET_STATS_REASON_NOT_FOUND = 1,
	RESET_STATS_REASON_ONLINE_STATS_RESET = 7,
	RESET_STATS_REASON_PIPELINE = 2,
	RESET_STATS_REASON_BAD_FILE_VERSION = 5,
	RESET_STATS_REASON_BAD_PLAYERDATA_VERSION = 6,
	RESET_STATS_REASON_CORRUPT = 4
}

function FenceStatsReset.init(arg_1_0)
	FenceStatsReset.super.init(arg_1_0)
end

function FenceStatsReset.Start(arg_2_0)
	DebugPrint("FenceStatsReset.Start")
end

function FenceStatsReset.Stop(arg_3_0)
	DebugPrint("FenceStatsReset.Stop")
end

function FenceStatsReset.UpdateState(arg_4_0)
	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	arg_4_0._state = LUI.Fence.STATE.pass

	assert(arg_4_0._statsSource)

	for iter_4_0 = 0, Engine.DCJGJDDEHE() - 1 do
		local var_4_0 = Engine.BBHAECABBD(iter_4_0)
		local var_4_1 = var_4_0 and Engine.DBAEJAHFGJ(iter_4_0)

		if var_4_0 and not var_4_1 then
			local var_4_2 = Fences.CEEDFDDICC(iter_4_0, arg_4_0._statsSource)

			if var_4_2 > 0 then
				if arg_4_0._declined then
					arg_4_0._state = LUI.Fence.STATE.fail
				else
					arg_4_0._state = LUI.Fence.STATE.block

					if not arg_4_0._warningOpen then
						arg_4_0._warningOpen = true

						local var_4_3 = {
							errorCode = var_4_2
						}
						local var_4_4 = var_4_3.errorCode == FenceStatsReset.CODE_STATE.RESET_STATS_REASON_ONLINE_STATS_RESET or Dvar.IBEGCHEFE("MPTMQQNLNT")

						if Engine.BHICADFIHA() then
							var_4_4 = var_4_4 or var_4_3.errorCode == FenceStatsReset.CODE_STATE.RESET_STATS_REASON_BAD_FILE_VERSION
						end

						if arg_4_0._statsSource == CoD.StatsSource.OFFLINE then
							var_4_4 = true
						end

						if var_4_4 then
							function var_4_3.onAccept()
								arg_4_0._warningOpen = false

								Fences.EBIGGFFHD(iter_4_0, arg_4_0._statsSource)
							end

							function var_4_3.onDecline()
								arg_4_0._warningOpen = false
								arg_4_0._declined = true
							end

							LUI.FlowManager.RequestPopupMenu(unused, "StatsResetPopup", true, iter_4_0, false, var_4_3, nil, true, true)
						else
							var_4_3.controllerIndex = iter_4_0

							function var_4_3.action()
								arg_4_0._warningOpen = false
								arg_4_0._declined = true
							end

							LUI.FlowManager.RequestPopupMenu(unused, "StatsFailurePopup", true, iter_4_0, false, var_4_3, nil, true, true)
						end
					end
				end
			end
		end
	end
end

FenceOnlineStatsReset = LUI.Class(FenceStatsReset)

function FenceOnlineStatsReset.init(arg_8_0)
	FenceOnlineStatsReset.super.init(arg_8_0)

	arg_8_0._statsSource = CoD.StatsSource.ONLINE
end

LUI.Fence.Register("onlineStatsReset", FenceOnlineStatsReset)

FenceOfflineStatsReset = LUI.Class(FenceStatsReset)

function FenceOfflineStatsReset.init(arg_9_0)
	FenceOfflineStatsReset.super.init(arg_9_0)

	arg_9_0._statsSource = CoD.StatsSource.OFFLINE
end

LUI.Fence.Register("offlineStatsReset", FenceOfflineStatsReset)

function StatsFailurePopup(arg_10_0, arg_10_1)
	assert(arg_10_1.errorCode)
	assert(arg_10_1.controllerIndex)
	Engine.CEJJDJJHIJ(arg_10_1.controllerIndex, "dlog_event_stats_failure_need_support", {
		error_code = arg_10_1.errorCode or FenceStatsReset.CODE_STATE.RESET_STATS_NO_RESET
	})

	local var_10_0 = "MENU/STATS_FAILURE_CONTACT_SUPPORT"
	local var_10_1

	var_10_1 = arg_10_1.errorCode == FenceStatsReset.CODE_STATE.RESET_STATS_REASON_CORRUPT

	local var_10_2 = arg_10_1.errorCode == FenceStatsReset.CODE_STATE.RESET_STATS_REASON_BAD_FILE_VERSION
	local var_10_3 = arg_10_1.errorCode == FenceStatsReset.CODE_STATE.RESET_STATS_REASON_BAD_PLAYERDATA_VERSION

	if var_10_2 or var_10_3 then
		var_10_0 = "MENU/STATS_VERSION_FAILURE_CONTACT_SUPPORT"
	end

	local var_10_4 = {
		message = Engine.CBBHFCGDIC(var_10_0),
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		action = arg_10_1.action
	}
	local var_10_5 = MenuBuilder.BuildRegisteredType("PopupOK", var_10_4)

	var_10_5.id = "StatsFailurePopup"

	return var_10_5
end

function StatsResetPopup(arg_11_0, arg_11_1)
	assert(arg_11_1.errorCode)
	assert(arg_11_1.onAccept)
	assert(arg_11_1.onDecline)

	local var_11_0 = "MENU/CORRUPT_STATS_WARNING_ONLINE"
	local var_11_1 = arg_11_1.errorCode == FenceStatsReset.CODE_STATE.RESET_STATS_REASON_BAD_FILE_VERSION
	local var_11_2 = arg_11_1.errorCode == FenceStatsReset.CODE_STATE.RESET_STATS_REASON_BAD_PLAYERDATA_VERSION

	if var_11_1 or var_11_2 then
		var_11_0 = "MENU/STATS_WRONG_VERSION_WARNING"
	elseif arg_11_1.errorCode == FenceStatsReset.CODE_STATE.RESET_STATS_REASON_ONLINE_STATS_RESET then
		var_11_0 = "MENU/ONLINE_STATS_RESET"
	end

	local var_11_3 = {
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = Engine.CBBHFCGDIC(var_11_0),
		yesAction = arg_11_1.onAccept,
		noAction = arg_11_1.onDecline
	}
	local var_11_4 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_11_3)

	var_11_4.id = "StatsResetPopup"

	return var_11_4
end

MenuBuilder.registerType("StatsResetPopup", StatsResetPopup)
MenuBuilder.registerType("StatsFailurePopup", StatsFailurePopup)
LockTable(_M)
