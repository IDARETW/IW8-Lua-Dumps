SPSharedUtils = SPSharedUtils or {}
SPSharedUtils.Difficulties = {
	"MENU/RECRUIT",
	"MENU/REGULAR",
	"MENU/HARDENED",
	"MENU/VETERAN",
	"MENU/REALISM"
}

function SPSharedUtils.ShaderPreloadWrap(arg_1_0)
	if Dvar.IBEGCHEFE("killswitch_sp_shader_loading_block") or Dvar.IBEGCHEFE("MQQOKSOPL") then
		if Dvar.CFHDGABACF("MPMOPMKPKN") == 1 then
			Lobby.TryNavigateToLobby(arg_1_0)
		else
			arg_1_0()
		end
	else
		arg_1_0()
	end
end

function SPSharedUtils.GetHighestDifficultyForLevel(arg_2_0, arg_2_1)
	assert(arg_2_1)

	local var_2_0 = StringTable.DIFCHIGDFB(CSV.levels.file, CSV.levels.cols.name, arg_2_0, CSV.levels.cols.ref)
	local var_2_1 = Engine.EAIJDCADAJ(var_2_0, arg_2_1)
	local var_2_2 = SPSharedUtils.Difficulties[var_2_1]

	if var_2_2 and var_2_2 ~= "" then
		return var_2_2
	end

	return ""
end

function SPSharedUtils.GetHighestCollateralRankForLevel(arg_3_0, arg_3_1)
	assert(arg_3_1)

	local var_3_0 = PlayerData.BFFBGAJGD(arg_3_1, 0).spData.civiliansKilledGradeBest
	local var_3_1 = var_3_0[arg_3_0] and var_3_0[arg_3_0]:get()
	local var_3_2 = {
		"MENU_SP/RANK_F",
		"MENU_SP/RANK_D",
		"MENU_SP/RANK_C",
		"MENU_SP/RANK_B",
		"MENU_SP/RANK_A"
	}

	if var_3_1 and var_3_1 >= 0 and var_3_1 < #var_3_2 then
		return var_3_2[var_3_1 + 1]
	end

	return ""
end

function SPSharedUtils.GetMissionStateForLevel(arg_4_0, arg_4_1)
	local var_4_0 = PlayerData.BFFBGAJGD(arg_4_1, CoD.ProgressionBlob.Gold).spData.missionStateData

	return var_4_0[arg_4_0] and var_4_0[arg_4_0]:get()
end

function SPSharedUtils.OpenAntiCheatWarningPopup(arg_5_0)
	local var_5_0 = 0
	local var_5_1 = StringTable.BFHCAIIDA(CSV.levels.file) - 1

	for iter_5_0 = 0, var_5_1 do
		local var_5_2 = StringTable.CBGJCDIHCE(CSV.levels.file, iter_5_0, CSV.levels.cols.name)

		if SPSharedUtils.GetMissionStateForLevel(var_5_2, arg_5_0) == "locked" then
			break
		end

		var_5_0 = iter_5_0
	end

	local var_5_3 = StringTable.CBGJCDIHCE(CSV.levels.file, var_5_0, CSV.levels.cols.string)

	if not Dvar.IBEGCHEFE("unattended") then
		Engine.CFIECCHFCA(PauseReason.SAVE_DATA_ERROR)
		LUI.FlowManager.RequestPopupMenu(nil, "campaign_mode_anticheat_warning_popup", true, arg_5_0, false, {
			lastUnlockedMission = var_5_3
		})
	end
end

function SPSharedUtils.UnlockAllMissions(arg_6_0)
	if CONDITIONS.IsDevelopmentBuild() then
		return true
	end

	return SPSharedUtils.IsMissionCheatEnabled(arg_6_0)
end

function SPSharedUtils.IsMissionCheatEnabled(arg_7_0)
	return LUI.DataSourceInGlobalModel.new("frontend.sp.missionsCheat"):GetValue(arg_7_0)
end
