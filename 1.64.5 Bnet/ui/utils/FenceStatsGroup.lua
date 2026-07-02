module(..., package.seeall)

FenceStatsGroup = LUI.Class(LUI.Fence)

function FenceStatsGroup.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceStatsGroup.Start(arg_2_0)
	DebugPrint("FenceStatsGroup.Start")

	arg_2_0._statsGroup = LOADOUT.GetLoadoutStatsGroup()
	arg_2_0._usingMLGRules = Lobby.DFHGBJJAGC()
	arg_2_0._mlgRulesChanged = false
end

function FenceStatsGroup.Stop(arg_3_0)
	DebugPrint("FenceStatsGroup.Stop")
end

function FenceStatsGroup.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail and arg_4_0._mlgRulesChanged == true then
		local var_4_0 = Engine.IJEBHJIJF()

		LUI.FlowManager.RequestPopupMenu(nil, "RestrictionsChangedPopup", true, var_4_0, false, nil)

		arg_4_0._mlgRulesChanged = false
	end
end

function FenceStatsGroup.UpdateState(arg_5_0)
	assert(arg_5_0._state ~= LUI.Fence.STATE.fail)

	arg_5_0._state = LUI.Fence.STATE.pass

	if arg_5_0._statsGroup ~= LOADOUT.GetLoadoutStatsGroup() then
		arg_5_0._state = LUI.Fence.STATE.fail
	elseif arg_5_0._usingMLGRules ~= Lobby.DFHGBJJAGC() then
		if not MLG.IsHost() then
			arg_5_0._state = LUI.Fence.STATE.fail
			arg_5_0._mlgRulesChanged = true
		end

		arg_5_0._usingMLGRules = Lobby.DFHGBJJAGC()
	end
end

LUI.Fence.Register("StatsGroup", FenceStatsGroup)
LockTable(_M)
