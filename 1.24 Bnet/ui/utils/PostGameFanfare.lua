PostGameFanfare = {}
PostGameFanfare.states = {
	AAR_SUMMARY = 0,
	AAR_CP_POINTS = 1,
	AAR_START = -1
}

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._state = arg_1_1

	if arg_1_0._state == PostGameFanfare.states.AAR_SUMMARY then
		Lobby.OpenAfterActionReport(arg_1_0._controllerIndex, false, true, nil, arg_1_0._forceOpenAAR)
	end

	if arg_1_0._state == PostGameFanfare.states.AAR_CP_POINTS then
		Lobby.OpenAfterActionReport(arg_1_0._controllerIndex, false, false, true)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._state == arg_2_1 then
		LUI.FlowManager.RequestLeaveMenuByName("AARContainer", true)
	end

	arg_2_0._state = nil
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1 == nil then
		var_0_1(arg_3_0, arg_3_0._state)
	end

	var_0_0(arg_3_0, arg_3_1)
end

function PostGameFanfare.start(arg_4_0)
	arg_4_0._forceOpenAAR = false

	var_0_2(arg_4_0, PostGameFanfare.states.AAR_START)

	arg_4_0._controllerIndex = Engine.IJEBHJIJF()

	InitAARDataSources(arg_4_0._controllerIndex)
	arg_4_0:advance()
end

function PostGameFanfare.debugStart(arg_5_0)
	arg_5_0._forceOpenAAR = true

	var_0_2(arg_5_0, PostGameFanfare.states.AAR_START)

	arg_5_0._controllerIndex = Engine.IJEBHJIJF()

	InitAARDataSources(arg_5_0._controllerIndex)
	arg_5_0:advance()
end

function PostGameFanfare.advance(arg_6_0)
	if arg_6_0._state == nil then
		LUI.FlowManager.RequestLeaveMenuByName("AARContainer", true)

		return
	end

	assert(arg_6_0._controllerIndex)

	local var_6_0

	var_6_0 = arg_6_0._controllerIndex == Engine.IJEBHJIJF()

	if arg_6_0._state < PostGameFanfare.states.AAR_SUMMARY then
		var_0_2(arg_6_0, PostGameFanfare.states.AAR_SUMMARY)

		return
	end

	if arg_6_0._state < PostGameFanfare.states.AAR_CP_POINTS and Dvar.DHEEJCCJBH("MOLPOSLOMO") == CP.SPEC_OPS and Dvar.IBEGCHEFE("NMSNLMKKQS") then
		var_0_2(arg_6_0, PostGameFanfare.states.AAR_CP_POINTS)

		return
	end

	local var_6_1 = arg_6_0._controllerIndex
	local var_6_2 = Engine.DCJGJDDEHE() - 1

	for iter_6_0 = arg_6_0._controllerIndex + 1, var_6_2 do
		if Engine.BBHAECABBD(iter_6_0) then
			arg_6_0._controllerIndex = iter_6_0

			break
		end
	end

	var_0_2(arg_6_0, nil)

	if arg_6_0._controllerIndex ~= var_6_1 then
		arg_6_0._state = PostGameFanfare.states.AAR_START

		return arg_6_0:advance()
	else
		local var_6_3 = Engine.IJEBHJIJF()
		local var_6_4 = Engine.CFHBIHABCB(var_6_3)

		if Engine.HEEFCICJE() and not var_6_4 and CONDITIONS.IsMagmaEnabled() then
			local var_6_5 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

			if Dvar.IBEGCHEFE("MKKKSTPNQL") and var_6_5 ~= "br" then
				local var_6_6 = PlayerData.BFFBGAJGD(var_6_3, CoD.StatsGroup.Ranked)

				if var_6_6.pulsedPlaylistActive and var_6_6.pulsedPlaylistActive:get() == 1 and var_6_6.pulsedMatchesPlayed then
					local var_6_7 = var_6_6.pulsedMatchesPlayed:get() + 1
					local var_6_8 = Dvar.CFHDGABACF("QNPTOQOPL")

					if var_6_8 and var_6_8 == var_6_7 then
						LUI.FlowManager.RequestPopupMenu(arg_6_0, "MagmaUpsellPopup", true, var_6_3, false, nil)
					end

					var_6_6.pulsedMatchesPlayed:set(var_6_7)
					ACTIONS.UploadStats(arg_6_0, var_6_3)
				end
			end
		end
	end
end
