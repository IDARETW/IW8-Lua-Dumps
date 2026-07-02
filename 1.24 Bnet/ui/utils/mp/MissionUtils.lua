MissionUtils = {}
MissionUtils.missionsPlaylistCategory = 2
MissionUtils.missionsPlaylistIndex = 0
MissionUtils.MPMissionID = 0
MissionUtils.ZombiesMissionID = 1
MissionUtils.FlowState = {
	MISSION_ACTIVE = 1,
	MISSION_OVER = 2,
	PRE_INIT = 0
}

function MissionUtils.SetCurrentPlaylist(arg_1_0, arg_1_1)
	MissionUtils.missionsPlaylistCategory = arg_1_0
	MissionUtils.missionsPlaylistIndex = arg_1_1
end

function MissionUtils.FillWithBotsAndStartMission(arg_2_0)
	Dvar.DHEGHJJJHI("NOPSSNSOMP", true)
	Playlist.CDBBECIGIG(MissionUtils.missionsPlaylistCategory, MissionUtils.missionsPlaylistIndex)
end

function MissionUtils.GetFlowState()
	return Dvar.CFHDGABACF("LLMQRSOKNO")
end

function MissionUtils.SetFlowState(arg_4_0)
	Dvar.DFIJDJFIFD("LLMQRSOKNO", arg_4_0)
end

function MissionUtils.GetMissionName(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.missionIDs.file, CSV.missionIDs.cols.ref, arg_5_0, CSV.missionIDs.cols.missionName)
end

function MissionUtils.GetMissionImage(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.missionIDs.file, CSV.missionIDs.cols.ref, arg_6_0, CSV.missionIDs.cols.missionImage)
end
