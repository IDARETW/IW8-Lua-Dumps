Lobby = Lobby or {}
Lobby.AllMembersPath = "alwaysLoaded.activeParty.members"
Lobby.SquadMembersPath = "alwaysLoaded.activeParty.squadMembers"
Lobby.LFPPlayerSession = {}
Lobby.LFPEvents = {
	DISCONNECT = "disconnect",
	STOPPED = "stopped_search",
	SUCCESS = "success",
	QUIT = "quit",
	KICK = "kick",
	LEAVE = "leave_party"
}
Lobby.BRTutorialMatchRules = {
	{
		"gametype",
		"br"
	},
	{
		"commonOption",
		"codcasterEnabled",
		false
	},
	{
		"commonOption",
		"timeLimit",
		0
	},
	{
		"commonOption",
		"teamSize",
		1
	},
	{
		"commonOption",
		"teamCount",
		50
	}
}
Lobby.BRTutorialLobbyData = {
	{
		mission = "LUA_MENU/WZ_ORIENTATION",
		leavingToBRMainMenuRequiresCompletion = true,
		canAutoLoad = true,
		rewardId = 0,
		mapName = Dvar.DHEEJCCJBH("wz_tutorial_map") or "mp_br_tut2",
		lootId = Dvar.CFHDGABACF("LPKRQLLLNQ") or 30080,
		cfgFile = Dvar.DHEEJCCJBH("wz_tutorial_cfg") or "br_tutorial2.cfg",
		onboardingTutorialInitiationType = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED,
		onboardingTutorialCompletionType = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_COMPLETED
	},
	{
		mission = "LUA_MENU/WZ_PRACTICE",
		cfgFile = "br_practice_tutorial.cfg",
		canAutoLoad = false,
		mapName = "mp_br_quarry",
		rewardId = 2,
		animationSequence = "Practice",
		lootId = Dvar.CFHDGABACF("NOMPNRSPRL") or 128,
		onboardingTutorialCompletionType = Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED,
		extraMatchRules = {
			{
				"brData",
				"gulag",
				true
			}
		}
	},
	{
		mission = "LUA_MENU/BM_ORIENTATION",
		cfgFile = "bm_tutorial.cfg",
		canAutoLoad = false,
		mapName = "mp_bm_tut",
		rewardId = 3,
		animationSequence = "BloodMoney",
		lootId = Dvar.CFHDGABACF("LNKPLSSRQ") or 170696,
		onboardingTutorialCompletionType = Onboarding.PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED,
		extraMatchRules = {
			{
				"commonOption",
				"teamSize",
				2
			},
			{
				"commonOption",
				"scoreLimit",
				0
			}
		}
	}
}
Lobby.LOCAL_PLAYER_CONVERT_STRING = "lp"
Lobby.FRIENDS_CONVERT_STRING = "fr"
Lobby.UNKNOWN_PLAYERS_CONVERT_STRING = "unkp"
Lobby.NEW_JOINED_UNKOWN_PLAYERS_CONVERT_STRING = "njunkp"
Lobby.INITIAL_LIST = "il"
Lobby.LFPUtils = {}

function Lobby.LFPUtils.SplitString(arg_1_0, arg_1_1)
	local var_1_0 = {}
	local var_1_1 = arg_1_1 or " "
	local var_1_2 = string.format("([^%s]+)", var_1_1)

	string.gsub(arg_1_0, var_1_2, function(arg_2_0)
		var_1_0[#var_1_0 + 1] = arg_2_0
	end)

	return var_1_0
end

function Lobby.LFPUtils.ArrayHasValue(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0) do
		if iter_3_1 == arg_3_1 then
			return true
		end
	end

	return false
end

function Lobby.LFPUtils.ConvertLobbyPlayerTableToString(arg_4_0)
	local var_4_0 = "" .. Lobby.LOCAL_PLAYER_CONVERT_STRING .. ":" .. arg_4_0.localPlayer .. ";"
	local var_4_1 = arg_4_0.friends
	local var_4_2 = var_4_0 .. Lobby.FRIENDS_CONVERT_STRING .. ":"

	for iter_4_0 = 1, #var_4_1 do
		if iter_4_0 ~= #var_4_1 then
			var_4_2 = var_4_2 .. var_4_1[iter_4_0] .. ","
		else
			var_4_2 = var_4_2 .. var_4_1[iter_4_0]
		end
	end

	local var_4_3 = var_4_2 .. ";"
	local var_4_4 = arg_4_0.unknownPlayers
	local var_4_5 = var_4_3 .. Lobby.UNKNOWN_PLAYERS_CONVERT_STRING .. ":"

	for iter_4_1 = 1, #var_4_4 do
		if iter_4_1 ~= #var_4_4 then
			var_4_5 = var_4_5 .. var_4_4[iter_4_1] .. ","
		else
			var_4_5 = var_4_5 .. var_4_4[iter_4_1]
		end
	end

	local var_4_6 = var_4_5 .. ";"
	local var_4_7 = arg_4_0.newJoinedUnknownPlayers
	local var_4_8 = var_4_6 .. Lobby.NEW_JOINED_UNKOWN_PLAYERS_CONVERT_STRING .. ":"

	for iter_4_2 = 1, #var_4_7 do
		if iter_4_2 ~= #var_4_7 then
			var_4_8 = var_4_8 .. var_4_7[iter_4_2] .. ","
		else
			var_4_8 = var_4_8 .. var_4_7[iter_4_2]
		end
	end

	local var_4_9 = var_4_8 .. ";"
	local var_4_10 = arg_4_0.initialPlayers
	local var_4_11 = var_4_9 .. Lobby.INITIAL_LIST .. ":"

	for iter_4_3 = 1, #var_4_10 do
		if iter_4_3 ~= #var_4_10 then
			var_4_11 = var_4_11 .. var_4_10[iter_4_3] .. ","
		else
			var_4_11 = var_4_11 .. var_4_10[iter_4_3]
		end
	end

	return var_4_11
end

function Lobby.LFPUtils.ConvertLobbyPlayerStringToTable(arg_5_0)
	assert(arg_5_0, "The string passed SHOULD NEVER BE NIL")

	local var_5_0 = {}
	local var_5_1 = Lobby.LFPUtils.SplitString(arg_5_0, ";")

	assert(var_5_1[1], "First Table Split SHOULD NEVER BE NIL. This means the function is being called without any local player")

	var_5_0.localPlayer = Lobby.LFPUtils.SplitString(var_5_1[1], ":")[2]

	local var_5_2 = Lobby.LFPUtils.SplitString(var_5_1[2], ":")[2]
	local var_5_3 = {}

	if var_5_2 then
		local var_5_4 = Lobby.LFPUtils.SplitString(var_5_2, ",")

		for iter_5_0, iter_5_1 in pairs(var_5_4) do
			table.insert(var_5_3, iter_5_1)
		end
	end

	var_5_0.friends = var_5_3

	local var_5_5 = Lobby.LFPUtils.SplitString(var_5_1[3], ":")[2]
	local var_5_6 = {}

	if var_5_5 then
		local var_5_7 = Lobby.LFPUtils.SplitString(var_5_5, ",")

		for iter_5_2, iter_5_3 in pairs(var_5_7) do
			table.insert(var_5_6, iter_5_3)
		end
	end

	var_5_0.unknownPlayers = var_5_6

	local var_5_8 = Lobby.LFPUtils.SplitString(var_5_1[4], ":")[2]
	local var_5_9 = {}

	if var_5_8 then
		local var_5_10 = Lobby.LFPUtils.SplitString(var_5_8, ",")

		for iter_5_4, iter_5_5 in pairs(var_5_10) do
			table.insert(var_5_9, iter_5_5)
		end
	end

	var_5_0.newJoinedUnknownPlayers = var_5_9

	local var_5_11 = Lobby.LFPUtils.SplitString(var_5_1[5], ":")[2]
	local var_5_12 = {}

	if var_5_11 then
		local var_5_13 = Lobby.LFPUtils.SplitString(var_5_11, ",")

		for iter_5_6, iter_5_7 in pairs(var_5_13) do
			table.insert(var_5_12, iter_5_7)
		end
	end

	var_5_0.initialPlayers = var_5_12

	return var_5_0
end

function Lobby.LFPUtils.GetLobbyPlayersTable(arg_6_0, arg_6_1, arg_6_2)
	local function var_6_0(arg_7_0)
		local var_7_0 = Friends.BIAJAECICH(arg_6_0, arg_7_0)
		local var_7_1 = Friends.DIIAFCGBDA(arg_6_0, arg_7_0, "0")

		return var_7_0 or var_7_1
	end

	local var_6_1 = Engine.EAGGAEGHHA(arg_6_0)
	local var_6_2 = {
		localPlayer = var_6_1,
		friends = {},
		unknownPlayers = {},
		newJoinedUnknownPlayers = {},
		initialPlayers = {}
	}
	local var_6_3 = Friends.BJDEIGDDCD(true)

	for iter_6_0 = 1, #var_6_3 do
		local var_6_4 = var_6_3[iter_6_0].xuidString

		if var_6_0(var_6_4) then
			table.insert(var_6_2.friends, var_6_4)
		elseif not arg_6_1 then
			table.insert(var_6_2.unknownPlayers, var_6_4)
		else
			local var_6_5 = arg_6_2.unknownPlayers

			if Lobby.LFPUtils.ArrayHasValue(var_6_5, var_6_4) then
				table.insert(var_6_2.unknownPlayers, var_6_4)
			else
				table.insert(var_6_2.newJoinedUnknownPlayers, var_6_4)
			end
		end

		table.insert(var_6_2.initialPlayers, var_6_4)
	end

	return var_6_2
end

function Lobby.LFPUtils.UnknownPlayersChanged(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_2._compareIntialList then
		local var_8_0 = arg_8_0.initialPlayers

		for iter_8_0 = 1, #var_8_0 do
			local var_8_1 = var_8_0[iter_8_0]
			local var_8_2 = true

			if Lobby.LFPUtils.ArrayHasValue(arg_8_1.initialPlayers, var_8_1) then
				var_8_2 = false
			end

			if var_8_2 then
				return true
			end
		end
	else
		if arg_8_2._compareUnknownPlayers then
			local var_8_3 = arg_8_0.unknownPlayers
			local var_8_4 = arg_8_1.unknownPlayers

			if #var_8_3 ~= #var_8_4 then
				return true
			else
				for iter_8_1 = 1, #var_8_3 do
					if not Lobby.LFPUtils.ArrayHasValue(var_8_4, var_8_3[iter_8_1]) then
						return true
					end
				end
			end
		end

		if arg_8_2._compareNewJoinedUnknownPlayers then
			local var_8_5 = arg_8_0.newJoinedUnknownPlayers
			local var_8_6 = arg_8_1.newJoinedUnknownPlayers

			if #var_8_5 ~= #var_8_6 then
				return true
			else
				for iter_8_2 = 1, #var_8_5 do
					if not Lobby.LFPUtils.ArrayHasValue(var_8_6, var_8_5[iter_8_2]) then
						return true
					end
				end
			end
		end
	end

	return false
end

function Lobby.LFPUtils.GetCurrentPartySize()
	return #Friends.BJDEIGDDCD(false)
end

function Lobby.ResetLFPPartyCreationSuccess(arg_10_0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.PARTY_CREATED, false)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.PARTY_START_TIME, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.STARTING_PLAYERS_IN_PARTY, "")
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.TOTAL_FRONT_END_TIME, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.FRONT_END_START_TIME, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.TOTAL_GAME_TIME, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.GAME_START_TIME, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.TOTAL_MATCHES_PLAYED, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_10_0, METRICS.LFPVariables.MATCH_IDS, "")
end

function Lobby.ReportLFPPartyCreationSuccess(arg_11_0, arg_11_1)
	local var_11_0 = tonumber(Engine.DEIDGHDBHD())

	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.PARTY_CREATED, true)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.PARTY_START_TIME, var_11_0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.LFP_SESSION_ID, arg_11_1)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.PARTY_END_REASON, nil)

	local var_11_1 = Lobby.LFPUtils.GetLobbyPlayersTable(arg_11_0, false, nil)
	local var_11_2 = Lobby.LFPUtils.ConvertLobbyPlayerTableToString(var_11_1)

	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.STARTING_PLAYERS_IN_PARTY, var_11_2)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.TOTAL_FRONT_END_TIME, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.FRONT_END_START_TIME, var_11_0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.TOTAL_GAME_TIME, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.GAME_START_TIME, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.TOTAL_MATCHES_PLAYED, 0)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_11_0, METRICS.LFPVariables.MATCH_IDS, "")
end

function Lobby.ForceEndPlayerLFPSession(arg_12_0)
	local var_12_0 = Engine.IJEBHJIJF()

	if not DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.PARTY_CREATED) then
		return
	end

	local var_12_1 = tonumber(Engine.DEIDGHDBHD())
	local var_12_2 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.PARTY_START_TIME)
	local var_12_3 = var_12_1
	local var_12_4 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.TOTAL_MATCHES_PLAYED)
	local var_12_5 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.TOTAL_GAME_TIME) * 1000
	local var_12_6 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.FRONT_END_START_TIME)

	if var_12_6 ~= 0 then
		local var_12_7 = var_12_1 - var_12_6
		local var_12_8 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.TOTAL_FRONT_END_TIME)

		if arg_12_0.resetAllData then
			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(var_12_0, METRICS.LFPVariables.TOTAL_FRONT_END_TIME, var_12_8 + var_12_7)
			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(var_12_0, METRICS.LFPVariables.FRONT_END_START_TIME, 0)
		end
	end

	local var_12_9 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.MATCH_IDS)
	local var_12_10 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.LFP_SESSION_ID)
	local var_12_11 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(var_12_0, METRICS.LFPVariables.TOTAL_FRONT_END_TIME) * 1000

	METRICS.LFPPartySessionDLogEvent(var_12_0, var_12_2, var_12_3, arg_12_0.eventName, var_12_4, var_12_5, var_12_11, var_12_9, var_12_10)

	if arg_12_0.resetAllData then
		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(var_12_0, METRICS.LFPVariables.PARTY_CREATED, false)
		Lobby.ResetLFPPartyCreationSuccess(var_12_0)
	end
end

function Lobby.CheckAndGeneratePlayerLFPSession(arg_13_0, arg_13_1)
	if not DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_13_0, METRICS.LFPVariables.SEARCH_STARTED) then
		return
	end

	local var_13_0 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_13_0, METRICS.LFPVariables.IS_IN_PARIVATE_PARTY)
	local var_13_1 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_13_0, METRICS.LFPVariables.PREVIOUS_PARTY_ID)
	local var_13_2 = Lobby.LOOK_FOR_PARTY_EXEC_STRING
	local var_13_3 = tonumber(Engine.DEIDGHDBHD())
	local var_13_4 = tostring(var_13_3)
	local var_13_5 = var_13_3 - DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_13_0, METRICS.LFPVariables.SEARCH_START_TIME)
	local var_13_6 = DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue(arg_13_0, METRICS.LFPVariables.STARTING_PLAYERS_IN_PARTY)
	local var_13_7 = Lobby.LFPUtils.ConvertLobbyPlayerStringToTable(var_13_6)
	local var_13_8 = Lobby.LFPUtils.GetLobbyPlayersTable(arg_13_0, true, var_13_7)
	local var_13_9 = Lobby.LFPUtils.UnknownPlayersChanged(var_13_7, var_13_8, {
		_compareNewJoinedUnknownPlayers = true
	})
	local var_13_10 = Lobby.LFPUtils.GetCurrentPartySize()

	if (arg_13_1 == Lobby.LFPEvents.LEAVE or arg_13_1 == Lobby.LFPEvents.STOPPED) and var_13_9 and var_13_10 ~= 1 then
		arg_13_1 = Lobby.LFPEvents.SUCCESS
	end

	METRICS.LFPPlayerSessionDLogEvent(arg_13_0, var_13_0, var_13_1, var_13_2, arg_13_1, var_13_5 * 1000, var_13_4)
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_13_0, METRICS.LFPVariables.SEARCH_STARTED, false)

	if arg_13_1 == Lobby.LFPEvents.SUCCESS then
		Lobby.ReportLFPPartyCreationSuccess(arg_13_0, var_13_4)
	end
end

function Lobby.RegisterInitialLFPInstrumentData(arg_14_0)
	if Lobby.BGIADHIHAG() then
		local var_14_0 = tonumber(Engine.DEIDGHDBHD())

		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_14_0, METRICS.LFPVariables.SEARCH_STARTED, true)
		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_14_0, METRICS.LFPVariables.SEARCH_START_TIME, var_14_0)
		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_14_0, METRICS.LFPVariables.PREVIOUS_PARTY_ID, Engine.CDAIIADEJC())
		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_14_0, METRICS.LFPVariables.IS_IN_PARIVATE_PARTY, Lobby.IsNotAloneInPrivateParty())

		local var_14_1 = Lobby.LFPUtils.GetLobbyPlayersTable(arg_14_0, false, nil)
		local var_14_2 = Lobby.LFPUtils.ConvertLobbyPlayerTableToString(var_14_1)

		DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_14_0, METRICS.LFPVariables.STARTING_PLAYERS_IN_PARTY, var_14_2)
	end
end

Lobby.MaxPlayerCountForSplitscreen = 12
Lobby.PlaylistLockState = {
	LOCKED_MAXPARTY = 3,
	UNLOCKED = 0,
	LOCKED_FORCE_LOCKED = 8
}
Lobby.MemberListStates = {
	Lobby = 2,
	Teams = 3
}
Lobby.BRMatchType = {
	QUAD = 4,
	TRIO = 3,
	SOLO = 1,
	DUO = 2
}
Lobby.FillToggleOptions = {
	DONT_FILL = 2,
	FILL = 1
}
Lobby.BRLobbyPlaylistTitle = {
	[Lobby.BRMatchType.SOLO] = "LUA_MENU_MP/RULES_TEAM_SIZE_1",
	[Lobby.BRMatchType.DUO] = "LUA_MENU_MP/RULES_TEAM_SIZE_2",
	[Lobby.BRMatchType.TRIO] = "LUA_MENU_MP/RULES_TEAM_SIZE_3",
	[Lobby.BRMatchType.QUAD] = "LUA_MENU_MP/RULES_TEAM_SIZE_4"
}
Lobby.BRLobbyPlaylistDesc = {
	[Lobby.BRMatchType.SOLO] = "LUA_MENU/BR_SOLO_DESC",
	[Lobby.BRMatchType.DUO] = "LUA_MENU/BR_DUO_DESC",
	[Lobby.BRMatchType.TRIO] = "LUA_MENU/BR_TRIO_DESC",
	[Lobby.BRMatchType.QUAD] = "LUA_MENU/BR_QUAD_DESC"
}
Lobby.MaxMemberListSlots = 18
Lobby.MemberListRefreshTime = 1000
Lobby.TransitionTime = 750
Lobby.MemberListMemberHeight = 26
Lobby.MemberListSquadMemberHeight = 25
Lobby.PasswordLength = 24
Lobby.DLC1_MAP_PACK_INDEX = 1
Lobby.DLC2_MAP_PACK_INDEX = 2
Lobby.DefaultMapImage = "image_mp_map_templogo"
Lobby.MAX_SQUAD_COUNT = 4
Lobby.MatchmakerState = {
	QOSING = 3,
	JOINED_LOBBY = 4,
	IDLE = 0,
	ERRORING = 5,
	INITIALIZING = 1,
	SEARCHING = 2
}
Lobby.PartyState = {
	WAITING_FOR_READY = 11,
	WAITING_FOR_DEDICATED_SERVER = 13,
	WAITING_FOR_OTHER_PLAYERS = 12,
	WAITING = 14,
	WAITING_FOR_HOST = 9,
	HOST_CHANGING_SETTINGS = 16,
	INTERMISSION = 15,
	WAITING_FOR_HOST_AWAY = 8,
	SEARCHING_FOR_OPPONENTS = 17,
	MAKING_TEAMS = 18,
	JOININGLOBBY = 1,
	STARTING_SOON = 19,
	STARTING = 20,
	UNKNOWN = 21,
	MAKEHOSTACTIVE = 4,
	WAITING_FOR_FASTFILES_STARTED = 5,
	MERGINGLOBBIES = 2,
	WAITING_FOR_FASTFILES = 6,
	MIGRATINGHOSTS = 3,
	WAITING_FOR_MATCH = 10,
	WAITING_FOR_MEMBERS = 7,
	NONE = 0
}
Lobby.MatchRulesClasses = {
	HQData = "hqData",
	CTFData = "ctfData",
	ArenaData = "arenaData",
	CarryData = "carryData",
	RugbyData = "rugbyData",
	DomData = "domData",
	BallCommonData = "ballCommonData",
	EscData = "escData",
	CMDData = "cmdData",
	GrndData = "grndData",
	InfectData = "infectData",
	GunData = "gunData",
	TjuggData = "tjuggData",
	DmData = "dmData",
	GrindData = "grindData",
	FrontData = "frontData",
	HVTData = "hvtData",
	BrData = "brData",
	ConfData = "confData",
	RushData = "rushData",
	OICData = "oicData",
	CommonOption = "commonOption",
	CaptureData = "captureData",
	BombData = "bombData",
	SiegeData = "siegeData",
	BallData = "ballData",
	TdefData = "tdefData",
	BtmData = "btmData",
	KOTHData = "kothData",
	DemData = "demData",
	SdData = "sdData",
	BlitzData = "blitzData",
	CyberData = "cyberData"
}
Lobby.MatchRulesMembers = {
	InfectExtraTimePerKill = "infectExtraTimePerKill",
	KillsPerWeapon = "killsPerWeapon",
	DropTime = "dropTime",
	CasualScoreStreaks = "casualScoreStreaks",
	Spectate3rdAllowed = "spectate3rdAllowed",
	PointsPerJuggOnJuggKill = "ppkJuggOnJugg",
	JuggTeamSpeed = "juggTeamSpeed",
	RadarEndGame = "radarEndGame",
	SurvivorScoreTime = "survivorScoreTime",
	ActivationDelayBase = "activationDelayBase",
	WeaponInitialSecondary = "weaponInitialSecondary",
	EnableBrLoot = "enableBrLoot",
	EnablePing = "enablePing",
	SuperFastChargeRate = "superFastChargeRate",
	WaveRespawnDelay = "waveRespawnDelay",
	AllowSupers = "allowSupers",
	ArenaBlastShieldClamp = "blastShieldClamp",
	JuggSpawnBehavior = "juggSpawnBehavior",
	RadarPingTime = "radarPingTime",
	EquipmentMSProtect = "equipmentMSProtect",
	OvertimeLimit = "overtimeLimit",
	PointsPerFlag = "pointsPerFlag",
	LastStand = "lastStand",
	LoadoutChangeRound = "loadoutChangeRound",
	WeaponTier5 = "weaponTier5",
	ArenaObjModifier = "objModifier",
	ArenaSpawnFlag = "spawnFlag",
	ScoreCarry = "scoreCarry",
	SwitchSpawns = "switchSpawns",
	PointsPerDeny = "pointsPerDeny",
	Setback = "setback",
	ScoreLimit = "scoreLimit",
	SuperInfect = "superInfect",
	HelperMax = "helperMax",
	LadderIndex = "ladderIndex",
	ArenaAttachments = "arenaAttachments",
	CaptureDuration = "captureDuration",
	ZoneSelectionDelay = "zoneSelectionDelay",
	JuggTimeout = "juggTimeout",
	EnableInfectedTracker = "enableInfectedTracker",
	SurvivorScorePerTick = "survivorScorePerTick",
	GoalProtection = "goalProtection",
	ScoringTime = "scoringTime",
	FlagNeutralization = "flagNeutralization",
	WeaponInfectSecondary = "weaponInfectSecondary",
	MagCount = "magCount",
	BankRate = "bankRate",
	TacticalSurvivor = "tacticalSurvivor",
	DisableSuperSprint = "disableSuperSprint",
	SuperPointsMod = "superPointsMod",
	TargetPlayerCycle = "targetPlayerCycle",
	HeadshotsOnly = "headshotsOnly",
	ShowKillcam = "showKillcam",
	EnableVariantDZ = "enableVariantDZ",
	PointsPerKSKill = "pointsPerKSKill",
	NumLives = "numLives",
	CaptureDecay = "captureDecay",
	ZoneTimeout = "zoneTimeout",
	PauseTime = "pauseTime",
	AONRules = "aonRules",
	CaptureType = "captureType",
	DelayPlayer = "delayPlayer",
	SpawnDelay = "spawnDelay",
	HardcoreModeOn = "hardcoreModeOn",
	InGameLoot = "inGameLoot",
	DeathRetainStreaks = "deathRetainStreaks",
	RoundStartTime = "roundStartTime",
	FriendlyBaseScore = "friendlyBaseScore",
	ZoneCaptureTime = "zoneCaptureTime",
	PracticeMode = "practiceMode",
	GiveTKOnTISpawn = "giveTKOnTISpawn",
	LastStandTimer = "lastStandTimer",
	RespawnDelay = "respawnDelay",
	TeamAssignmentAllowed = "teamAssignmentAllowed",
	TacticalInfected = "tacticalInfect",
	LastStandSuicideTimer = "lastStandSuicideTimer",
	ResetProgress = "resetProgress",
	PersBombTimer = "persBombTimer",
	MegaBankBonusKS = "megaBankBonusKS",
	GoalMoveTimer = "goalMoveTimer",
	MatchStartTime = "matchStartTime",
	LethalInfected = "lethalInfect",
	RoundRetainStreaks = "roundRetainStreaks",
	MidfieldScore = "midfieldScore",
	HoldDurationBase = "holdDurationBase",
	AllowPerks = "allowPerks",
	ScoreOnTargetPlayer = "scoreOnTargetPlayer",
	CaptureDurationBase = "captureDurationBase",
	WeaponInfectedPrimary = "weaponInfectPrimary",
	ZoneSwitchTime = "zoneSwitchTime",
	CODCastingEnabled = "codcasterEnabled",
	EnemyBaseScore = "enemyBaseScore",
	SuperSurvivorTwo = "superSurvivorTwo",
	DisableAnnouncer = "disableAnnouncer",
	ExecConfig = "execConfig",
	JuggSwitchTime = "juggSwitchTime",
	FlagCaptureTime = "flagCaptureTime",
	CircleDamageMultiplier = "circleDamageMultiplier",
	WeaponSurvivorSecondary = "weaponSurvivorSecondary",
	DisableBattleChatter = "disableBattleChatter",
	CDLTuning = "cdltuning",
	BankDisableTime = "bankDisableTime",
	ExtraTime = "extraTime",
	RecipeName = "recipeName",
	LastStandHealth = "lastStandHealth",
	InfilHeli = "infilHeli",
	RoundRetainStreakProg = "roundRetainStreakProg",
	BankTime = "bankTime",
	CaptureDurationHalf = "captureDurationHalf",
	ActivationDelayCenter = "activationDelayCenter",
	ArenaTacticalTimeMod = "tacticalTimeMod",
	ReturnTime = "returnTime",
	MegaBankBonus = "megaBankBonus",
	RushTimer = "rushTimer",
	TeamTimer = "teamTimer",
	PPKTeamWithFlag = "ppkTeamWithFlag",
	EnemyBaseKillReveal = "enemyBaseKillReveal",
	UseHPRules = "useHPRules",
	CircleStartSize = "circleStartSize",
	LastStandReviveTimer = "lastStandReviveTimer",
	CaptureCondition = "captureCondition",
	EscapeTimer = "escapeTimer",
	DraftLoadoutTimer = "draftLoadoutTimer",
	KillRewardAmmoCount = "killRewardAmmoCount",
	PointsPerKillAsJugg = "ppkAsJugg",
	OneShotKill = "oneShotKill",
	GoalType = "goalType",
	WrapKillstreaks = "wrapKillstreaks",
	ZoneActivationDelay = "zoneActivationDelay",
	TimeLimit = "timeLimit",
	DetonateScore = "detonateScore",
	ArenaBlastShieldMod = "blastShieldMod",
	HoldDurationHalf = "holdDurationHalf",
	PPKTeamNoFlag = "ppkTeamNoFlag",
	WinRule = "winRule",
	BombTimer = "bombTimer",
	NumInitialInfected = "numInitialInfected",
	PossessionResetTime = "possessionResetTime",
	Gulag = "gulag",
	WinLimit = "winLimit",
	SpectateModeAllowed = "spectateModeAllowed",
	PointsPerConfirm = "pointsPerConfirm",
	ExtraTimeBonus = "extraTimeBonus",
	ActivationDelay = "activationDelay",
	FirstZoneActivationDelay = "firstZoneActivationDelay",
	HVTCaptureValue = "hvtCaptureValue",
	CarrierBonusScore = "carrierBonusScore",
	SharedRushTimer = "sharedRushTimer",
	CapRate = "capRate",
	UseHQRules = "useHQRules",
	RushTimerAmount = "rushTimerAmount",
	InitialAmmoCount = "initialAmmoCount",
	WeaponTier2 = "weaponTier2",
	KillcamType = "killcamType",
	RandomLocationOrder = "randomLocationOrder",
	RadarAlwaysOn = "radarAlwaysOn",
	HoldDurationCenter = "holdDurationCenter",
	ShowEnemyCarrier = "showEnemyCarrier",
	JuggSpeed = "juggSpeed",
	WeaponInitialPrimary = "weaponInitialPrimary",
	PostRoundExtraTimer = "postRoundExtraTimer",
	PlantTime = "plantTime",
	WeaponTier4 = "weaponTier4",
	CaptureDurationCenter = "captureDurationCenter",
	PracticeRound = "practiceRound",
	Weapon = "weapon",
	KillstreakConfirmed = "killstreakConfirmed",
	WeaponTier6 = "weaponTier6",
	RecipeDescription = "recipeDescription",
	DefuseTime = "defuseTime",
	SuicideSpawnDelay = "suicideSpawnDelay",
	WinByTwoMaxRounds = "winByTwoMaxRounds",
	WinByTwoEnabled = "winByTwoEnabled",
	ScoreThrow = "scoreThrow",
	ShowTargetTime = "showTargetTime",
	SpawnProtectionTimer = "spawnProtectionTimer",
	WeaponSurvivorPrimary = "weaponSurvivorPrimary",
	PickupTime = "pickupTime",
	ScorePerTick = "scorePerTick",
	ZoneLifetime = "zoneLifetime",
	BountyTimer = "bountyTimer",
	MegaBankLimit = "megaBankLimit",
	InfilConvoy = "infilConvoy",
	WeaponTier8 = "weaponTier8",
	ObjScalar = "objScalar",
	FriendlyFire = "friendlyFire",
	HealthRegen = "healthRegen",
	AdditiveScoring = "additiveScoring",
	NumRevives = "numRevives",
	NumFlagsScoreOnKill = "numFlagsScoreOnKill",
	IdleResetTime = "idleResetTime",
	InfectStreakBonus = "infectStreakBonus",
	CmdRules = "cmdRules",
	MultiBomb = "multiBomb",
	Vampirism = "vampirism",
	TacticalModeOn = "tacticalMode",
	StartWeapon = "startWeapon",
	RoundLimit = "roundLimit",
	SatelliteCount = "satelliteCount",
	SilentPlant = "silentPlant",
	CrankedBombTimer = "crankedBombTimer",
	SuperSurvivor = "superSurvivor",
	ArenaSuper = "arenaSuper",
	BankCaptureTime = "bankCaptureTime",
	DisableSpawnCamera = "disableSpawnCamera",
	InfilSkip = "infilSkip",
	PossessionResetCondition = "possessionResetCondition",
	PPKFlagCarrier = "ppkFlagCarrier",
	DraftRigTimer = "draftRigTimer",
	LastStandReviveHealth = "lastStandReviveHealth",
	CrateDropTimer = "crateDropTimer",
	BankDisableTags = "bankDisableTags",
	LethalDelay = "equipmentDelay",
	CapZone = "capZone",
	ActivationDelayHalf = "activationDelayHalf",
	TeamSize = "teamSize",
	EmpSpawn = "empSpawn",
	CompassHideEnemy = "compassHideEnemy",
	PreCapPoints = "preCapPoints",
	ReviveUseWeapon = "reviveUseWeapon",
	InputSwapEnabled = "inputSwapEnabled",
	RadarHideShots = "radarHideShots",
	RoundStartReadyUp = "roundStartReadyUp",
	NumEndGame = "numEndGame",
	EnemyDeathLoc = "enemyDeathLoc",
	FFPunishLimit = "ffPunishLimit",
	FlagActivationDelay = "flagActivationDelay",
	MaxHealth = "maxHealth",
	PointsPerJuggKill = "ppkOnJugg",
	AllowCustomClasses = "allowCustomClasses",
	HVTTargetCount = "hvtMaxTargets",
	DraftWeaponTimer = "draftWeaponTimer",
	JuggCaptureTime = "juggCaptureTime",
	SuperInfectTwo = "superInfectTwo",
	FlagsRequiredToScore = "flagsRequiredToScore",
	WeaponTier1 = "weaponTier1",
	GoalEnableTimer = "goalEnableTimer",
	DisableMount = "disableMount",
	CompassHidePings = "compassHidePings",
	SurvivorAliveScore = "survivorAliveScore",
	AllowKillstreaks = "allowKillstreaks",
	WeaponTier3 = "weaponTier3",
	ArenaWinCondition = "winCondition",
	ForceRespawn = "forceRespawn",
	GunGameWeapons = "gunGameWeapons",
	InfilC130 = "infilC130",
	JuggHealth = "juggHealth",
	LethalSurvivor = "lethalSurvivor",
	BountyBonusScore = "bountyBonusScore",
	SetbackStreak = "setbackStreak",
	DogTags = "dogTags",
	CarrierBonusTime = "carrierBonusTime",
	PointsHeadshotBonus = "pointsHeadshotBonus",
	EnableMiniMap = "enableMinimap",
	PointsPerDeath = "pointsPerDeath",
	StartingWeapon = "startingWeapon",
	PointsPerKill = "pointsPerKill",
	BankDisable = "bankDisable",
	RoundSwitch = "roundSwitch",
	WeaponTier7 = "weaponTier7",
	ArenaLoadouts = "arenaLoadouts"
}
Lobby.BRTutorialLobbyType = {
	BLOODMONEY = 3,
	PRACTICE = 2,
	TUTORIAL = 1
}
Lobby.MatchmakingGameType = {
	GAME_TYPE_BM = 5,
	GAME_TYPE_COMPETITIVE_MULTIPLAYER = 11,
	GAME_TYPE_MULTIPLAYER = 1,
	GAME_TYPE_GROUND_WAR = 3,
	GAME_TYPE_CAMPAIGN = 2,
	GAME_TYPE_BR = 4,
	GAME_TYPE_COOP = 0
}
Lobby.Teams = {
	Bad = 0,
	Free = 0,
	Allies = 2,
	Axis = 1
}
Lobby.BotTeams = {
	FFA = 2,
	Friendly = 0,
	Enemy = 1
}
Lobby.BotLimit = 12
Lobby.BotLimitForSplitScreen = 12
Lobby.MaxPlayerLimitForGunfight = 20
Lobby.BotDifficulties = {
	Hardened = 2,
	Regular = 1,
	Veteran = 3,
	Recruit = 0,
	Mixed = 4
}
Lobby.CustomizationTypes = {
	Head = 0,
	Body = 1,
	ViewHands = 2
}
Lobby.PrivacySettings = {
	Min = 0,
	Max = 2,
	Texts = {
		[0] = "PATCH_MENU/OPEN",
		"PATCH_MENU/FRIENDS_ONLY",
		"PATCH_MENU/CLOSED"
	}
}
Lobby.gameModeCategories = {
	PRIVATE_TOURNAMENT = "PrivateTournament",
	PLUNDER = "Plunder",
	BATTLE_ROYALE = "BattleRoyale",
	WARZONE_ALTERNATE = "WarzoneAlternate",
	MYMODES = "MyModes",
	VANGUARD = "Vanguard",
	LARGE = "Large",
	CWL = "Cwl",
	STANDARD = "Standard",
	ALTERNATE = "Alternate",
	REBIRTH = "Rebirth",
	FORTUNE = "Fortune"
}
MapVoting = {
	MapA = {
		voteIndex = 1,
		refNum = 0
	},
	MapB = {
		voteIndex = 2,
		refNum = 1
	},
	MapC = {
		voteIndex = 3,
		refNum = 2
	}
}
Lobby.OperatorWalkAnimations = {
	{
		"chr_menu_mp_squad_male_01",
		"chr_menu_mp_squad_female_01",
		"chr_menu_mp_squad_male_01_shadow",
		"chr_menu_mp_squad_female_01_shadow"
	},
	{
		"chr_menu_mp_squad_male_02",
		"chr_menu_mp_squad_female_02",
		"chr_menu_mp_squad_male_02_shadow",
		"chr_menu_mp_squad_female_02_shadow"
	},
	{
		"chr_menu_mp_squad_male_04",
		"chr_menu_mp_squad_female_04",
		"chr_menu_mp_squad_male_04_shadow",
		"chr_menu_mp_squad_female_04_shadow"
	},
	{
		"chr_menu_mp_squad_male_05",
		"chr_menu_mp_squad_female_05",
		"chr_menu_mp_squad_male_05_shadow",
		"chr_menu_mp_squad_female_05_shadow"
	},
	{
		"chr_menu_mp_squad_male_05",
		"chr_menu_mp_squad_female_05",
		"chr_menu_mp_squad_male_05_shadow",
		"chr_menu_mp_squad_female_05_shadow"
	},
	{
		"chr_menu_mp_squad_male_03",
		"chr_menu_mp_squad_female_03",
		"chr_menu_mp_squad_male_03_shadow",
		"chr_menu_mp_squad_female_03_shadow"
	},
	{
		"chr_menu_mp_squad_male_06",
		"chr_menu_mp_squad_female_06",
		"chr_menu_mp_squad_male_06_shadow",
		"chr_menu_mp_squad_female_06_shadow"
	},
	{
		"chr_menu_mp_squad_male_05",
		"chr_menu_mp_squad_female_05",
		"chr_menu_mp_squad_male_05_shadow",
		"chr_menu_mp_squad_female_05_shadow"
	},
	{
		"chr_menu_mp_squad_male_01",
		"chr_menu_mp_squad_female_01",
		"chr_menu_mp_squad_male_01_shadow",
		"chr_menu_mp_squad_female_01_shadow"
	},
	{
		"chr_menu_mp_squad_male_02",
		"chr_menu_mp_squad_female_02",
		"chr_menu_mp_squad_male_02_shadow",
		"chr_menu_mp_squad_female_02_shadow"
	},
	{
		"chr_menu_mp_squad_male_04",
		"chr_menu_mp_squad_female_04",
		"chr_menu_mp_squad_male_04_shadow",
		"chr_menu_mp_squad_female_04_shadow"
	},
	{
		"chr_menu_mp_squad_male_05",
		"chr_menu_mp_squad_female_05",
		"chr_menu_mp_squad_male_05_shadow",
		"chr_menu_mp_squad_female_05_shadow"
	}
}
Lobby.CharacterDetailsWidgetOffsets = {
	{
		x = -2,
		y = 10
	},
	{
		x = -2,
		y = 10
	},
	{
		x = -2,
		y = 10
	},
	{
		x = -2,
		y = 10
	},
	{
		x = 0,
		y = 10
	},
	{
		x = 0,
		y = 10
	},
	{
		x = 0,
		y = 10
	},
	{
		x = 0,
		y = 10
	},
	{
		x = 0,
		y = 10
	},
	{
		x = 0,
		y = 10
	},
	{
		x = 0,
		y = 10
	},
	{
		x = 0,
		y = 10
	}
}
Lobby.RANDOM_MAP = "random"
Lobby.DEFAULT_PRIVATE_TOURNAMENT = {
	gameType = "private_arena",
	teamSize = 2,
	recipe = "arena.recipe",
	maps = {
		Lobby.RANDOM_MAP,
		Lobby.RANDOM_MAP,
		Lobby.RANDOM_MAP,
		Lobby.RANDOM_MAP
	}
}
Lobby.DEFAULT_WARZONE_PRIVATE_MATCH = {
	gameType = "pr_br_quads",
	teamSize = 4,
	recipe = "pr_br_quads",
	maps = {
		"mp_don3"
	}
}
Lobby.EMPTY_WARZONE_PRIVATE_MATCH = {
	gameType = "",
	recipe = "",
	maps = {
		""
	}
}
Lobby.LOOK_FOR_PARTY_METADATA = {
	CATEGORY_DATA_REF = "categoryDataRef",
	HEADER_TEXT_REF = "headerText",
	MAX_PARTY_SIZE_REF = "maxPartySize",
	BUTTON_DATA_REF = "buttonData",
	EXEC_CAT_CODE_REF = "execCatCode",
	DESC_STRING_REF = "descriptionStringRef",
	BUTTON_TEXT_REF = "buttonText",
	ICON_REF = "icon",
	MISC_PARTY_DATA_REF = "misc_party_data",
	GAME_MODE_DATA_REF = "game_mode_data",
	EXEC_CODE_REF = "execCode",
	SUB_HEADER_TEXT_REF = "subHeaderText"
}
Lobby.LOOK_FOR_PARTY_OPTIONS = nil
Lobby.LOOK_FOR_PARTY_EXEC_STRING = nil
Lobby.LOOK_FOR_PARTY_STOP_SEARCHING_STRING = "lfg_stop_search"
Lobby.LOOK_FOR_PARTY_MAX_PARTY_SIZES = {}
Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE = nil
Lobby.LOOK_FOR_PARTY_HOST_SEARCH_SETTINGS_STRING = nil
Lobby.LOOK_FOR_PARTY_PREV_IS_SEARCHING_FOR_GROUP = nil
Lobby.LOOK_FOR_PARTY_PREV_CURRENT_PLAYER_COUNT = nil
Lobby.LOOK_FOR_PARTY_PREV_REQUIRED_PLAYER_COUNT = nil
Lobby.LOOK_FOR_PARTY_PREV_HOST_STRING = nil
Lobby.LOOK_FOR_PARTY_BINARY_DATA = nil
Lobby.LOOK_FOR_PARTY_BINARY_RESET = nil
Lobby.LOOK_FOR_PARTY_DEFAULT_BINARY_DATA = nil
Lobby.MAX_POSSIBLE_GAMEMODES = 6
Lobby.LOOK_FOR_PARTY_FLYOUT_DATA = nil
Lobby.LOOK_FOR_PARTY_EXEC_CODES = {}
Lobby.LOOK_FOR_PARTY_EXEC_INTERACTED = false
Lobby.lfpPlaylistBtnCount = nil
Lobby.lfpSideOptionsBtnCount = nil
Lobby.LOOK_FOR_PARTY_FULL_TOAST_SHOWABLE = true

function Lobby.InitLookForPartyFlyoutData(arg_15_0)
	local var_15_0 = CSV.WZLookForPartyData
	local var_15_1 = CSV.WZLookForPartyParams
	local var_15_2 = {}
	local var_15_3 = {}
	local var_15_4 = {}
	local var_15_5 = Lobby.LOOK_FOR_PARTY_METADATA

	for iter_15_0 = 0, StringTable.BFHCAIIDA(var_15_0.file) - 1 do
		local var_15_6 = CSV.ReadRow(var_15_0, iter_15_0)
		local var_15_7 = "playlists"
		local var_15_8 = {}
		local var_15_9

		if var_15_6.ref == var_15_7 then
			var_15_8[var_15_5.EXEC_CAT_CODE_REF] = var_15_6.ref
			var_15_8[var_15_5.HEADER_TEXT_REF] = var_15_6.header
			var_15_8[var_15_5.BUTTON_DATA_REF] = {}

			local var_15_10 = PlaylistUtils.GetPublicPlaylistDatasources()
			local var_15_11 = var_15_10:GetCountValue(arg_15_0) - 1

			for iter_15_1 = 0, var_15_11 do
				local var_15_12 = var_15_10:GetDataSourceAtIndex(iter_15_1)
				local var_15_13 = var_15_12.type:GetValue(arg_15_0)

				if var_15_13 == PlaylistUtils.CategoryClass.MAGMA or var_15_13 == PlaylistUtils.CategoryClass.ALL then
					local var_15_14 = var_15_12.index:GetValue(arg_15_0)

					if Playlist.CFECCDIFGE(var_15_14) then
						local var_15_15 = var_15_12.playlists:GetCountValue(arg_15_0) - 1

						for iter_15_2 = 0, var_15_15 do
							local var_15_16 = var_15_12.playlists:GetDataSourceAtIndex(iter_15_2)
							local var_15_17 = var_15_16.maxPartySize:GetValue(arg_15_0)

							if var_15_17 > 1 then
								local var_15_18 = {
									[var_15_5.EXEC_CODE_REF] = var_15_16.ID:GetValue(arg_15_0),
									[var_15_5.BUTTON_TEXT_REF] = var_15_16.name:GetValue(arg_15_0),
									[var_15_5.ICON_REF] = var_15_16.image:GetValue(arg_15_0),
									[var_15_5.MAX_PARTY_SIZE_REF] = var_15_17,
									[var_15_5.CATEGORY_DATA_REF] = var_15_8,
									[var_15_5.DESC_STRING_REF] = var_15_16.desc:GetValue(arg_15_0)
								}

								table.insert(var_15_8[var_15_5.BUTTON_DATA_REF], var_15_18)
							end
						end
					end
				end
			end

			table.insert(var_15_3, var_15_8)
		else
			local var_15_19 = {
				[var_15_5.EXEC_CAT_CODE_REF] = var_15_6.ref,
				[var_15_5.HEADER_TEXT_REF] = var_15_6.header,
				[var_15_5.BUTTON_DATA_REF] = {}
			}
			local var_15_20 = 1
			local var_15_21 = var_15_6["param" .. var_15_20 .. "Ref"]

			while var_15_21 ~= nil and var_15_21 ~= "" do
				local var_15_22 = {
					[var_15_5.BUTTON_TEXT_REF] = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_15_1.file, var_15_1.cols.ref, var_15_21, var_15_1.cols.buttonText)),
					[var_15_5.EXEC_CODE_REF] = StringTable.DIFCHIGDFB(var_15_1.file, var_15_1.cols.ref, var_15_21, var_15_1.cols.execCode),
					[var_15_5.ICON_REF] = StringTable.DIFCHIGDFB(var_15_1.file, var_15_1.cols.ref, var_15_21, var_15_1.cols.icon),
					[var_15_5.DESC_STRING_REF] = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_15_1.file, var_15_1.cols.ref, var_15_21, var_15_1.cols.desc)),
					[var_15_5.CATEGORY_DATA_REF] = var_15_19
				}

				table.insert(var_15_19[var_15_5.BUTTON_DATA_REF], var_15_22)

				var_15_20 = var_15_20 + 1
				var_15_21 = var_15_6["param" .. var_15_20 .. "Ref"]
			end

			table.insert(var_15_4, var_15_19)
		end
	end

	var_15_2[var_15_5.GAME_MODE_DATA_REF] = var_15_3
	var_15_2[var_15_5.MISC_PARTY_DATA_REF] = var_15_4
	Lobby.LOOK_FOR_PARTY_FLYOUT_DATA = var_15_2
end

function Lobby.LookForPartySetMaxParty(arg_16_0, arg_16_1, arg_16_2)
	arg_16_1 = tonumber(arg_16_1)

	if arg_16_0 ~= nil and arg_16_0 ~= "" and arg_16_1 ~= nil and arg_16_1 ~= "" then
		if arg_16_2 and arg_16_2.delete then
			Lobby.LOOK_FOR_PARTY_MAX_PARTY_SIZES[arg_16_0] = nil
		else
			Lobby.LOOK_FOR_PARTY_MAX_PARTY_SIZES[arg_16_0] = arg_16_1
		end
	end
end

function Lobby.PrepLookForPartyPanelData(arg_17_0)
	local var_17_0 = Lobby.LOOK_FOR_PARTY_METADATA

	return {
		categoryString = arg_17_0[var_17_0.CATEGORY_DATA_REF][var_17_0.HEADER_TEXT_REF],
		selectedString = arg_17_0[var_17_0.BUTTON_TEXT_REF],
		icon = arg_17_0[var_17_0.ICON_REF],
		desc = arg_17_0[var_17_0.DESC_STRING_REF]
	}
end

function Lobby.GET_CURRENT_LANGUAGE_NAME_LOCALIZATION_MARK_REMOVED()
	local var_18_0 = Engine.DGAIDIEIAC()
	local var_18_1 = GetLanguageDisplayName(var_18_0)

	return (string.gsub(var_18_1, "\x1F", ""))
end

function Lobby.AffectLocalLookForPartyBinaryData(arg_19_0, arg_19_1)
	if arg_19_1 == 0 then
		Lobby.LOOK_FOR_PARTY_BINARY_DATA = Lobby.LOOK_FOR_PARTY_BINARY_DATA - 2^(arg_19_0 - 1)
	elseif arg_19_1 == 1 then
		Lobby.LOOK_FOR_PARTY_BINARY_DATA = Lobby.LOOK_FOR_PARTY_BINARY_DATA + 2^(arg_19_0 - 1)
	end
end

function Lobby.SetLookForPartyBinaryData(arg_20_0)
	Engine.BFJHDDEJJG(arg_20_0, Lobby.LOOK_FOR_PARTY_BINARY_DATA)
end

function Lobby.BuildLookForPartyExecString(arg_21_0)
	local var_21_0 = "lfg_start_search"

	for iter_21_0, iter_21_1 in pairs(arg_21_0) do
		var_21_0 = var_21_0 .. " " .. iter_21_0 .. ":"

		local var_21_1 = true

		for iter_21_2, iter_21_3 in pairs(iter_21_1) do
			if iter_21_2 ~= "count" then
				if var_21_1 then
					var_21_1 = false
				else
					var_21_0 = var_21_0 .. ","
				end

				var_21_0 = var_21_0 .. iter_21_3
			end
		end
	end

	local var_21_2 = 2
	local var_21_3, var_21_4 = 4, var_21_2

	for iter_21_4, iter_21_5 in pairs(Lobby.LOOK_FOR_PARTY_MAX_PARTY_SIZES) do
		if var_21_4 < iter_21_5 then
			var_21_4 = iter_21_5
		end

		if iter_21_5 < var_21_3 then
			var_21_3 = iter_21_5
		end
	end

	Dvar.DFIJDJFIFD("LSLKTTRKPQ", var_21_3)
	Dvar.DFIJDJFIFD("MLSNOOMMNO", var_21_4)

	local var_21_5 = var_21_0 .. " languages:" .. Lobby.GET_CURRENT_LANGUAGE_NAME_LOCALIZATION_MARK_REMOVED()

	Lobby.LOOK_FOR_PARTY_EXEC_STRING = var_21_5
end

function Lobby.BuildLookForPartyStatusWidgetDataFromHostSettingsString(arg_22_0)
	local var_22_0 = CSV.WZLookForPartyData
	local var_22_1 = CSV.WZLookForPartyParams

	Lobby.LOOK_FOR_PARTY_HOST_STATUS_PANEL_DATA = {}
	Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE = nil

	local function var_22_2(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
		arg_23_0.selectionData[arg_23_1] = {}
		arg_23_0.selectionData[arg_23_1].string = arg_23_3 and Engine.CBBHFCGDIC(arg_23_1) or arg_23_1
		arg_23_0.selectionData[arg_23_1].icon = arg_23_2
	end

	local function var_22_3(arg_24_0, arg_24_1)
		local var_24_0 = PlaylistUtils.GetPublicPlaylistDatasources()
		local var_24_1 = var_24_0:GetCountValue(arg_22_0) - 1

		for iter_24_0 = 0, var_24_1 do
			local var_24_2 = var_24_0:GetDataSourceAtIndex(iter_24_0)
			local var_24_3 = var_24_2.type:GetValue(arg_22_0)

			if var_24_3 == PlaylistUtils.CategoryClass.MAGMA or var_24_3 == PlaylistUtils.CategoryClass.ALL then
				local var_24_4 = var_24_2.index:GetValue(arg_22_0)

				if Playlist.CFECCDIFGE(var_24_4) then
					local var_24_5 = var_24_2.playlists:GetCountValue(arg_22_0) - 1

					for iter_24_1 = 0, var_24_5 do
						local var_24_6 = var_24_2.playlists:GetDataSourceAtIndex(iter_24_1)
						local var_24_7 = var_24_6.maxPartySize:GetValue(arg_22_0)

						if var_24_7 > 1 then
							local var_24_8 = var_24_6.ID:GetValue(arg_22_0)

							if tostring(var_24_8) == arg_24_0 then
								local var_24_9 = var_24_6.name:GetValue(arg_22_0)

								var_22_2(arg_24_1, var_24_9, var_24_6.image:GetValue(arg_22_0))

								if Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE == nil or var_24_7 < Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE then
									Lobby.LOOK_FOR_PARTY_HOST_MAX_PARTY_SIZE = var_24_7
								end
							end
						end
					end
				end
			end
		end
	end

	local function var_22_4(arg_25_0, arg_25_1, arg_25_2)
		local var_25_0 = StringTable.DIFCHIGDFB(var_22_1.file, var_22_1.cols.ref, arg_25_2 .. "_" .. arg_25_0, var_22_1.cols.buttonText)
		local var_25_1 = StringTable.DIFCHIGDFB(var_22_1.file, var_22_1.cols.ref, arg_25_2 .. "_" .. arg_25_0, var_22_1.cols.icon)

		var_22_2(arg_25_1, var_25_0, var_25_1, true)
	end

	if Lobby.LOOK_FOR_PARTY_HOST_SEARCH_SETTINGS_STRING == nil then
		return
	end

	local var_22_5 = LUI.Split(Lobby.LOOK_FOR_PARTY_HOST_SEARCH_SETTINGS_STRING, " ")

	for iter_22_0, iter_22_1 in pairs(var_22_5) do
		if iter_22_1 ~= nil then
			local var_22_6 = LUI.Split(iter_22_1, ":")
			local var_22_7 = var_22_6[1]

			if var_22_7 ~= "languages" then
				local var_22_8 = var_22_6[2]

				if var_22_8 ~= nil then
					local var_22_9 = LUI.Split(var_22_8, ",")
					local var_22_10 = StringTable.DIFCHIGDFB(var_22_0.file, var_22_0.cols.ref, var_22_7, var_22_0.cols.header)

					Lobby.LOOK_FOR_PARTY_HOST_STATUS_PANEL_DATA[var_22_10] = {
						selectionData = {}
					}

					local var_22_11 = Lobby.LOOK_FOR_PARTY_HOST_STATUS_PANEL_DATA[var_22_10]

					for iter_22_2, iter_22_3 in pairs(var_22_9) do
						if var_22_7 == "playlists" then
							var_22_3(iter_22_3, var_22_11)
						else
							var_22_4(iter_22_3, var_22_11, var_22_7)
						end
					end
				end
			end
		end
	end
end

Lobby.LOOK_FOR_PARTY_HOST_STATUS_PANEL_DATA = nil
Lobby.LOOK_FOR_PARTY_STATUS_PANEL_DATA = {}

function Lobby.SetLookForPartyStatusPanelData(arg_26_0, arg_26_1)
	if arg_26_0 == nil or arg_26_0.categoryString == nil then
		return
	end

	local var_26_0 = arg_26_0.categoryString
	local var_26_1 = Lobby.LOOK_FOR_PARTY_STATUS_PANEL_DATA[var_26_0]

	if not var_26_1 then
		var_26_1 = {}
		Lobby.LOOK_FOR_PARTY_STATUS_PANEL_DATA[arg_26_0.categoryString] = var_26_1
		var_26_1.selectionData = {}
		var_26_1.selectionData.string = ""
		var_26_1.selectionData.icon = ""
	end

	local var_26_2 = var_26_1.selectionData[arg_26_0.selectedString]

	if arg_26_1 then
		if not var_26_2 then
			var_26_1.selectionData[arg_26_0.selectedString] = {}
			var_26_2 = var_26_1.selectionData[arg_26_0.selectedString]
		end

		var_26_2.string = arg_26_0.selectedString
		var_26_2.icon = arg_26_0.icon
	elseif var_26_2 then
		var_26_1.selectionData[arg_26_0.selectedString] = nil
	end
end

function Lobby.GetLookForPartyStatusPanelData()
	if Lobby.BGIADHIHAG() == true or Lobby.GFFECBCCF() ~= true or Lobby.LOOK_FOR_PARTY_HOST_STATUS_PANEL_DATA == nil or Lobby.LOOK_FOR_PARTY_HOST_STATUS_PANEL_DATA == "" then
		return Lobby.LOOK_FOR_PARTY_STATUS_PANEL_DATA
	else
		return Lobby.LOOK_FOR_PARTY_HOST_STATUS_PANEL_DATA
	end
end

function Lobby.SetUpLookForPartyDefaultBinaryData()
	Lobby.LOOK_FOR_PARTY_DEFAULT_BINARY_DATA = 1
	Lobby.LOOK_FOR_PARTY_DEFAULT_BINARY_DATA = Lobby.LOOK_FOR_PARTY_DEFAULT_BINARY_DATA + 2^Lobby.lfpPlaylistBtnCount
	Lobby.LOOK_FOR_PARTY_DEFAULT_BINARY_DATA = Lobby.LOOK_FOR_PARTY_DEFAULT_BINARY_DATA + 2^(Lobby.lfpPlaylistBtnCount + 2)
end

function Lobby.GetStatusString(arg_29_0)
	if IsPublicMatch() then
		local var_29_0, var_29_1 = Lobby.DBJHBACBBE()

		if var_29_0 == Lobby.MatchmakerState.IDLE then
			return "", false, "idle"
		elseif var_29_0 == Lobby.MatchmakerState.JOINED_LOBBY then
			-- block empty
		elseif var_29_0 == Lobby.MatchmakerState.QOSING then
			assert(var_29_1.numQoSPlayers)

			return Engine.CBBHFCGDIC("MPUI/MMING_QOSING", var_29_1.numQoSPlayers), true, "qosing"
		elseif Lobby.BGIADHIHAG() then
			if var_29_0 == Lobby.MatchmakerState.INITIALIZING then
				return Engine.CBBHFCGDIC("MPUI/MMING_INITIALIZING"), true, "initializing"
			elseif var_29_0 == Lobby.MatchmakerState.SEARCHING then
				if Dvar.IBEGCHEFE("MPTLKKKQNT") and var_29_1.maxPing > 0 then
					assert(var_29_1.maxPing)

					return Engine.CBBHFCGDIC("MPUI/MMING_SEARCHING_PING", var_29_1.maxPing), true, "searching"
				else
					return Engine.CBBHFCGDIC("MPUI/MMING_SEARCHING"), true, "searching"
				end
			elseif var_29_0 == Lobby.MatchmakerState.ERRORING then
				return Engine.CBBHFCGDIC("MPUI/MMING_ERRORING"), true, "erroring"
			end
		else
			return Engine.CBBHFCGDIC("MPUI/MMING_HOST_DOES_IT"), true, "host_searching"
		end
	end

	local var_29_2, var_29_3 = Lobby.BGIBDIBHH()

	if MLG.JIHGCIJCG() then
		local var_29_4 = GAMEBATTLES.GetCurrentMatch(arg_29_0)

		if var_29_4 then
			if var_29_2 == Lobby.PartyState.INTERMISSION then
				local var_29_5 = math.ceil(var_29_3.timeRemaining / 1000)
				local var_29_6, var_29_7 = GAMEBATTLES.GetMatchProgressInfo(var_29_4)

				if not var_29_7 then
					local var_29_8 = GAMEBATTLES.GetNoshowTime()

					if var_29_6 or var_29_5 < var_29_8 then
						return Engine.CBBHFCGDIC("MLG_GAMEBATTLES/STATUS_NOSHOW", Engine.JCBDICCAH(Engine.GEGAFIFFC(var_29_5))), false, "gamebattle_noshow"
					else
						local var_29_9 = var_29_5 - var_29_8

						return Engine.CBBHFCGDIC("MLG_GAMEBATTLES/STATUS_PREMATCH", Engine.JCBDICCAH(Engine.GEGAFIFFC(var_29_9))), false, "gamebattle_prematch"
					end
				end
			else
				local var_29_10 = LUI.DataSourceInGlobalModel.new("frontEnd.mlg.matchJoinState"):GetValue(arg_29_0)

				if var_29_10 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.IDLE or var_29_10 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.TRY_CREATE then
					return "", false, "gamebattle_not joined"
				end
			end
		end
	end

	if var_29_2 == Lobby.PartyState.INTERMISSION then
		assert(var_29_3.timeRemaining)

		if not LUI.FlowManager.IsInStack("PrivateMatchLobby") then
			local var_29_11 = math.ceil(var_29_3.timeRemaining / 1000)

			return Engine.CBBHFCGDIC("MENU/INTERMISSION", var_29_11), false, "intermission"
		end
	elseif var_29_2 == Lobby.PartyState.STARTING_SOON then
		return Engine.CBBHFCGDIC("MENU/MATCH_WILL_BEGIN"), false, "starting_soon"
	elseif var_29_2 == Lobby.PartyState.STARTING then
		assert(var_29_3.timeRemaining)

		if var_29_3.timeRemaining < 0 then
			return Engine.CBBHFCGDIC("MENU/GAME_BEGINNING"), false, "starting_no_time"
		else
			return Engine.CBBHFCGDIC("MENU/MATCH_BEGINNING_IN", math.ceil(var_29_3.timeRemaining / 1000)), false, "starting"
		end
	elseif var_29_2 == Lobby.PartyState.WAITING_FOR_FASTFILES_STARTED then
		return Engine.CBBHFCGDIC("MENU/WAITING_FOR_FASTFILES_STARTED"), true, "ff_started"
	elseif var_29_2 == Lobby.PartyState.WAITING_FOR_FASTFILES then
		return Engine.CBBHFCGDIC("MENU/WAITING_FOR_FASTFILES"), true, "ff"
	elseif var_29_2 == Lobby.PartyState.WAITING_FOR_HOST then
		return Engine.CBBHFCGDIC("MENU/WAITING_FOR_HOST"), false, "waiting_for_host"
	elseif var_29_2 == Lobby.PartyState.WAITING_FOR_READY then
		return Engine.CBBHFCGDIC("LUA_MENU/STATUS_NEED_TO_READY_UP"), false, "waiting_for_ready"
	elseif var_29_2 == Lobby.PartyState.WAITING_FOR_OTHER_PLAYERS then
		return Engine.CBBHFCGDIC("LUA_MENU/STATUS_WAITING_FOR_OTHER_PLAYERS"), false, "waiting_for_other_players"
	elseif var_29_2 == Lobby.PartyState.WAITING_FOR_DEDICATED_SERVER then
		return Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/WAITING_FOR_DEDICATED_SERVER"), true, "waiting_for_dedicated_server"
	else
		if IsPublicMatch() then
			local var_29_12 = Dvar.CFHDGABACF("LLNLRTQRPO")
			local var_29_13 = Lobby.DGHJAEEIHA()

			if var_29_13 < var_29_12 then
				if var_29_12 - var_29_13 == 1 then
					return Engine.CBBHFCGDIC("MENU/WAITING_FOR_ONE_MORE_PLAYER"), true, "waiting_for_players"
				else
					return Engine.CBBHFCGDIC("MENU/WAITING_FOR_MORE_PLAYERS", var_29_12 - var_29_13), true, "waiting_for_players"
				end
			end
		end

		return Engine.CBBHFCGDIC("MENU/WAITING"), false, "waiting"
	end
end

function Lobby.IsNotAloneInPrivateParty()
	return Lobby.GFFECBCCF() and not Lobby.CECBCJDIAG()
end

function Lobby.createNVidiaGroup(arg_31_0)
	if Engine.CGABICJHAI() and arg_31_0 and Dvar.IBEGCHEFE("LNQTQQPLRO") then
		Engine.EGIICJGCF(arg_31_0)
	end
end

function Lobby.endNVidiaGroup(arg_32_0)
	if Engine.CGABICJHAI() and arg_32_0 and Dvar.IBEGCHEFE("LNQTQQPLRO") then
		Engine.EFCHBAIF(arg_32_0)
	end
end

function Lobby.DisplayNvidiaHighlightsButton(arg_33_0, arg_33_1)
	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LNQTQQPLRO") and Engine.CFJEBEJCFC() then
		Lobby.createNVidiaGroup(arg_33_1)
		arg_33_0:registerEventHandler("nvidia_highlights_count", function(arg_34_0, arg_34_1)
			if arg_34_1.group_count > 0 then
				arg_33_0:AddButtonHelperText({
					kbm_only = true,
					priority = 6,
					ignoreTooltip = true,
					ignoreTooltipPrompt = true,
					side = "left",
					button_ref = "button_ins",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/NVIDIA_SUMMARY")
				})
				arg_33_0:AddButtonHelperText({
					side = "left",
					priority = 7,
					ignoreTooltip = true,
					ignoreTooltipPrompt = true,
					gamepad_only = true,
					button_ref = "button_home",
					always_use_alt_PC_icon = true,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/NVIDIA_HIGHLIGHTS")
				})

				local function var_34_0(arg_35_0, arg_35_1)
					if not arg_35_1.down then
						return false
					end

					if arg_35_1.button == "ins" and arg_35_1.qualifier ~= "keyboard" then
						Engine.BJFJDCFDID("MW_Highlights")

						return true
					end

					return false
				end

				arg_33_0:addEventHandler("gamepad_button", var_34_0)
			end

			return true
		end)
		Engine.EBEJAAJGDG(arg_33_1)
	end
end

function Lobby.LeavePublicLobby()
	local var_36_0 = Lobby.IsOurPrivatePartyHostInLobby()

	Engine.DAGFFDGFII("xstoplobbybackout Lobby.LeavePublicLobby")

	if var_36_0 then
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
		Engine.DAGFFDGFII("xstartprivateparty")
	end

	Lobby.endNVidiaGroup("MW_Highlights")
end

function Lobby.LeaveCustomGameLobby()
	local var_37_0 = Lobby.IsOurPrivatePartyHostInLobby()

	Engine.DAGFFDGFII("xstoplobbybackout Lobby.LeaveCustomGameLobby")

	if var_37_0 then
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
		Engine.DAGFFDGFII("xstartprivateparty")
	end

	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Lobby.endNVidiaGroup("MW_Highlights")
end

function Lobby.LeaveCommonMPMainMenu(arg_38_0, arg_38_1)
	assert(arg_38_0)
	assert(arg_38_1)

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		if Lobby.IsNotAloneInPrivateParty() and not Lobby.BGIADHIHAG() then
			Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_38_1)
		end
	else
		Engine.DAGFFDGFII("xstopprivateparty 0", arg_38_1)
		Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
		Dvar.DHEGHJJJHI("splitscreen", false)
	end

	LUI.FlowManager.RequestLeaveMenu(arg_38_0, true)
end

function Lobby.LeavePrivateParty(arg_39_0, arg_39_1, arg_39_2)
	assert(arg_39_0)
	assert(arg_39_1)
	assert(not Engine.DAFGFCFHJI())

	if arg_39_2 == nil or arg_39_2 == true then
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
	else
		Engine.DAGFFDGFII("xstopprivateparty 0 1")
	end

	Engine.DAGFFDGFII("xstartprivateparty")
	Lobby.endNVidiaGroup("MW_Highlights")
end

function Lobby.GetWalkAnimationForIndex(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	local var_40_0 = Lobby.InferOperatorRefFromModel(arg_40_0, arg_40_1)

	if var_40_0 and #var_40_0 > 0 then
		local var_40_1 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, var_40_0, CSV.operators.cols.gender)

		if not var_40_1 or #var_40_1 <= 0 then
			DebugPrint("Warning, gender is nil for operator : " .. var_40_0 .. " defaulting to male ( 0 ). Please check operators.csv for a missing operator ref or missing gender ")

			var_40_1 = OPERATOR.Gender.MALE
		end

		local var_40_2 = tonumber(var_40_1)

		arg_40_0 = MP.StripPlatformSuffix(arg_40_0)

		local var_40_3 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, var_40_0, CSV.operators.cols.factionRef) == "SEVEN"
		local var_40_4 = arg_40_0 == "body_mp_eastern_milsim_shadow_company_1_1_lod1" or arg_40_0 == "body_mp_eastern_milsim_shadow_company_2_1_lod1" or arg_40_0 == "body_mp_eastern_milsim_shadow_company_3_1_lod1"
		local var_40_5 = 0

		if var_40_3 or var_40_4 then
			var_40_5 = 2
		end

		if arg_40_3 then
			local var_40_6 = "+"
			local var_40_7 = LUI.Split(arg_40_3, var_40_6)[1]

			if var_40_7 == "iw8_me_riotshield_mp" or var_40_7 == "iw8_me_riotshield_mp_frontend_sorting" or var_40_7 == "iw8_me_riotshield_mpv2" or var_40_7 == "iw8_me_riotshield_mpv2_frontend_sorting" or var_40_7 == "iw8_me_riotshield_mpv3" or var_40_7 == "iw8_me_riotshield_mpv3_frontend_sorting" or var_40_7 == "iw8_me_riotshield_mpv4" or var_40_7 == "iw8_me_riotshield_mpv4_frontend_sorting" or var_40_7 == "iw8_me_riotshield_mpv5" or var_40_7 == "iw8_me_riotshield_mpv5_frontend_sorting" or var_40_7 == "iw8_me_riotshield_mpv6" or var_40_7 == "iw8_me_riotshield_mpv6_frontend_sorting" or var_40_7 == "iw8_me_riotshield_mpv7" or var_40_7 == "iw8_me_riotshield_mpv7_frontend_sorting" then
				if var_40_3 or var_40_4 then
					return var_40_2 == OPERATOR.Gender.MALE and "chr_menu_mp_squad_male_05_shadow" or "chr_menu_mp_squad_female_05_shadow"
				else
					return var_40_2 == OPERATOR.Gender.MALE and "chr_menu_mp_squad_male_05" or "chr_menu_mp_squad_female_05"
				end
			end
		end

		return Lobby.OperatorWalkAnimations[arg_40_2][var_40_2 + 1 + var_40_5]
	else
		return "chr_menu_male_idle_01_AR"
	end
end

function Lobby.UpdateLocalClientCharacter(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4, arg_41_5, arg_41_6, arg_41_7, arg_41_8, arg_41_9, arg_41_10)
	local var_41_0 = Lobby.GetWalkAnimationForIndex(arg_41_2, arg_41_3, arg_41_4, arg_41_6)

	ClientCharacter.DDHJHDEHFG(arg_41_1, 0, 0, 0)

	local var_41_1 = {
		showCharacter = true,
		operatorPose = var_41_0,
		element = arg_41_5,
		weaponModel = arg_41_6,
		secondaryModel = arg_41_7,
		accessoryModel = arg_41_8
	}

	OPERATOR.UpdateClientCharacter(arg_41_1, arg_41_2, arg_41_3, var_41_1)

	arg_41_10 = arg_41_10 or Lobby.GetPetIndexForCharacter(arg_41_1)

	if arg_41_10 then
		OPERATOR.UpdatePet(arg_41_0, arg_41_10, {
			executionPet = arg_41_9,
			element = arg_41_5
		})
	end
end

function Lobby.GetPetIndexForCharacter(arg_42_0)
	if arg_42_0 <= FrontEndScene.ClientCharacters.Lobby3 then
		return FrontEndScene.ClientCharacters.LobbyPet1 + arg_42_0
	end
end

function Lobby.GetMaxLobbyMembers(arg_43_0)
	return DataSources.frontEnd.lobby.memberMaxCount:GetValue(arg_43_0)
end

function Lobby.GetCurrentNumLobbyMembers(arg_44_0)
	return DataSources.frontEnd.lobby.memberCount:GetValue(arg_44_0)
end

function Lobby.GetCurrentNumFriendlies(arg_45_0)
	return DataSources.frontEnd.lobby.friendlyTeamCount:GetValue(arg_45_0)
end

function Lobby.GetLocalPlayerSubPartyIndex(arg_46_0)
	return DataSources.frontEnd.lobby.friendlySubPartyIndex:GetValue(arg_46_0)
end

function Lobby.GetLocalClientTeam(arg_47_0)
	return DataSources.frontEnd.lobby.friendlyTeamIndex:GetValue(arg_47_0)
end

function Lobby.GetLocalClientSquadIndex(arg_48_0)
	return DataSources.frontEnd.lobby.friendlySquadIndex:GetValue(arg_48_0)
end

function Lobby.GetPetFromPlayerCard(arg_49_0, arg_49_1)
	local var_49_0

	if arg_49_1 == OPERATOR.SuperFaction.WEST then
		var_49_0 = arg_49_0.execWest
	else
		var_49_0 = arg_49_0.execEast
	end

	if var_49_0 then
		local var_49_1 = OPERATOR.GetExecutionPet(var_49_0)

		if #var_49_1 > 0 then
			return var_49_1
		end
	end
end

function Lobby.GetModelDetailsFromPlayerCard(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	local var_50_0
	local var_50_1

	if arg_50_1 == OPERATOR.SuperFaction.WEST then
		var_50_0 = arg_50_0.headWest
		var_50_1 = arg_50_0.bodyWest
	else
		var_50_0 = arg_50_0.headEast
		var_50_1 = arg_50_0.bodyEast
	end

	local var_50_2
	local var_50_3 = arg_50_0.weapons[WEAPON.PrimarySlot + 1]

	if var_50_3 then
		local var_50_4 = var_50_3.lootID

		if var_50_4 and var_50_4 ~= LOOT.emptyID then
			var_50_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_50_4, CSV.weaponIDs.cols.baseRef)
		end
	end

	return Lobby.GetHeadAndBodyModelsToUse(var_50_1, var_50_0, arg_50_2, arg_50_3, var_50_2)
end

function Lobby.GetHeadAndBodyModelsToUse(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4)
	if arg_51_1 <= 0 then
		arg_51_1 = 1
	end

	if arg_51_0 <= 0 then
		arg_51_0 = 1
	end

	local var_51_0 = StringTable.DIFCHIGDFB(CSV.heads.file, CSV.heads.cols.index, arg_51_1, CSV.heads.cols.model)
	local var_51_1 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.index, arg_51_0, CSV.bodies.cols.model)
	local var_51_2 = Lobby.InferOperatorRefFromModel(var_51_1, var_51_0)

	if OPERATOR.HasWeaponClassOverridesForSkin(var_51_2, var_51_1, var_51_0) then
		local var_51_3, var_51_4 = OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_51_2, var_51_2, arg_51_4)

		var_51_1 = #var_51_4 > 0 and var_51_4 or var_51_1
		var_51_0 = #var_51_3 > 0 and var_51_3 or var_51_0
	end

	if arg_51_3 then
		local var_51_5 = OPERATOR.GetSkinsCSVFile(var_51_2)
		local var_51_6 = StringTable.DIFCHIGDFB(var_51_5.file, var_51_5.cols.headModel, var_51_0, var_51_5.cols.headModelHighRes)
		local var_51_7 = StringTable.DIFCHIGDFB(var_51_5.file, var_51_5.cols.bodyModel, var_51_1, var_51_5.cols.bodyModelHighRes)

		var_51_1 = #var_51_7 > 0 and var_51_7 or var_51_1
		var_51_0 = #var_51_6 > 0 and var_51_6 or var_51_0
	end

	return var_51_1, var_51_0
end

function Lobby.PreloadViewHandsForLocalPlayer(arg_52_0)
	local var_52_0, var_52_1 = OPERATOR.GetEquippedOperatorSkin(arg_52_0, OPERATOR.SuperFaction.WEST)
	local var_52_2, var_52_3 = OPERATOR.GetEquippedOperatorSkin(arg_52_0, OPERATOR.SuperFaction.EAST)
	local var_52_4 = OPERATOR.GetViewHandsForOperator(var_52_0)
	local var_52_5 = OPERATOR.GetViewHandsForOperator(var_52_2)
	local var_52_6 = {}

	if #var_52_4 > 0 then
		table.insert(var_52_6, var_52_4)
	end

	if #var_52_5 > 0 then
		table.insert(var_52_6, var_52_5)
	end

	if not Streaming.EBHBADIBFB(var_52_6, arg_52_0) then
		Streaming.CDEFABDIBG(var_52_6, arg_52_0)
	end
end

function Lobby.GetDefaultLoadoutWeaponName(arg_53_0, arg_53_1)
	local var_53_0 = LOADOUT.GetFavoriteLoadoutWeapons(arg_53_1)
	local var_53_1 = WEAPON.DefaultPrimary

	if arg_53_0 == 2 then
		return var_53_0.secondaryWeaponModel
	end

	return var_53_0.primaryWeaponModel
end

function Lobby.GetWeaponLoadoutDetailsFromPlayerCard(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = arg_54_0.weapons[arg_54_1]
	local var_54_1
	local var_54_2 = {}
	local var_54_3 = true

	if var_54_0 then
		local var_54_4 = var_54_0.lootID

		if not var_54_4 or var_54_4 == LOOT.emptyID then
			return Lobby.GetDefaultLoadoutWeaponName(arg_54_1, arg_54_2)
		end

		local var_54_5 = StringTable.BJJBBCJGEJ(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_54_4)
		local var_54_6 = StringTable.CBGJCDIHCE(CSV.weaponIDs.file, var_54_5, CSV.weaponIDs.cols.baseRef)

		var_54_2.lootID = var_54_4

		local var_54_7 = StringTable.CBGJCDIHCE(CSV.weaponIDs.file, var_54_5, CSV.weaponIDs.cols.variantRef)
		local var_54_8 = WEAPON.GetVariantFile(var_54_6)

		var_54_2.variantID = StringTable.DIFCHIGDFB(var_54_8, CSV.weaponVariants.cols.ref, var_54_7, CSV.weaponVariants.cols.variantID)

		local var_54_9 = var_54_0.cosmeticAttachment

		if var_54_9 and #var_54_9 > 0 then
			var_54_2.cosmeticAttachment = var_54_9
		end

		var_54_2.attachments = {}

		for iter_54_0 = 1, #var_54_0.attachments do
			local var_54_10 = var_54_0.attachments[iter_54_0].attachment

			if var_54_10 ~= nil and #var_54_10 > 0 then
				local var_54_11 = var_54_0.attachments[iter_54_0].variantID

				table.insert(var_54_2.attachments, {
					ref = var_54_10,
					variantID = var_54_11
				})
			end
		end

		if var_54_0.camo and #var_54_0.camo > 0 then
			var_54_2.camo = var_54_0.camo
		else
			var_54_2.camo = WEAPON.CamoNoneValue
		end

		var_54_2.stickers = {}

		for iter_54_1 = 1, #var_54_0.stickers do
			local var_54_12 = var_54_0.stickers[iter_54_1]

			if var_54_12 and #var_54_12 > 0 then
				table.insert(var_54_2.stickers, var_54_12)
			else
				table.insert(var_54_2.stickers, WEAPON.StickerNoneValue)
			end
		end

		var_54_1 = WEAPON.GetWeaponModelName(var_54_6, var_54_2, {
			includeStickers = true,
			useOperatorOverride = true,
			includeCamos = true,
			includeAttachments = var_54_3,
			controllerIndex = arg_54_2
		})
	end

	return var_54_1
end

function Lobby.InferOperatorRefFromModel(arg_55_0, arg_55_1)
	local var_55_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.headModel, arg_55_1, CSV.operatorSkins.cols.operatorRef)

	if not var_55_0 or #var_55_0 <= 0 then
		var_55_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.bodyModel, arg_55_0, CSV.operatorSkins.cols.operatorRef)
	end

	if not var_55_0 or #var_55_0 <= 0 then
		var_55_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.bodyModelHighRes, arg_55_0, CSV.operatorSkins.cols.operatorRef)
	end

	if not var_55_0 or #var_55_0 <= 0 then
		var_55_0 = StringTable.DIFCHIGDFB(CSV.defaultOperatorSkins.file, CSV.defaultOperatorSkins.cols.bodyModel, arg_55_0, CSV.defaultOperatorSkins.cols.operatorRef)
	end

	if not var_55_0 or #var_55_0 <= 0 then
		var_55_0 = StringTable.DIFCHIGDFB(CSV.defaultOperatorSkins.file, CSV.defaultOperatorSkins.cols.headModel, arg_55_1, CSV.defaultOperatorSkins.cols.operatorRef)
	end

	return var_55_0
end

function Lobby.GetSelectedClientCharacterIndexInMemberList(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:GetDataSource()

	if var_56_0 and arg_56_1 then
		local var_56_1 = var_56_0.xuid:GetValue(controllerIndex)

		if var_56_1 then
			for iter_56_0 = 1, #arg_56_1 do
				local var_56_2 = arg_56_1[iter_56_0]

				if var_56_2 and var_56_2.XUID and var_56_2.XUID == var_56_1 then
					return var_56_2.characterIndex
				end
			end
		end
	end
end

function Lobby.BuildCharacterDetailWidgets(arg_57_0, arg_57_1, arg_57_2)
	if not Dvar.IBEGCHEFE("NRNLOOTRN") then
		arg_57_0 = 1
	end

	local var_57_0 = {}

	for iter_57_0 = 1, arg_57_0 do
		local var_57_1 = MenuBuilder.BuildRegisteredType("LobbyCharacterDetails", {
			controllerIndex = arg_57_2
		})

		var_57_1:SetAlpha(0)
		var_57_1:SetupAnchoredElement({
			maxScale = 1,
			roundScreenPosition = true,
			minScale = 1
		})
		table.insert(var_57_0, var_57_1)
		arg_57_1:addElement(var_57_1)
	end

	return var_57_0
end

function Lobby.BuildFocusArrowWidget(arg_58_0, arg_58_1)
	local var_58_0 = MenuBuilder.BuildRegisteredType("LobbyFocusArrow", {
		controllerIndex = arg_58_1
	})

	var_58_0.id = "focusArrow"

	var_58_0:SetAlpha(0)
	var_58_0:SetupAnchoredElement({
		maxScale = 1,
		roundScreenPosition = true,
		minScale = 1
	})
	arg_58_0:addElement(var_58_0)

	return var_58_0
end

function Lobby.UpdateCharacterDetailsWidgets(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = 1

	while var_59_0 <= #arg_59_0 do
		local var_59_1 = arg_59_0[var_59_0].dataSource
		local var_59_2 = arg_59_0[var_59_0].characterIndex
		local var_59_3 = arg_59_1[var_59_0]

		if var_59_3 and var_59_2 and ClientCharacter.IJFGGGBAB(var_59_2) and ClientCharacter.EBDDCJHAHD(var_59_2) and Engine.DHEEHAJFEA() then
			local var_59_4 = var_59_1.controllerIndex:GetValue(arg_59_2)
			local var_59_5 = var_59_4 and Engine.BFDACIJIAD(var_59_4)

			if Dvar.IBEGCHEFE("NRNLOOTRN") or var_59_5 then
				local var_59_6 = ClientCharacter.DBDJAAEGDH(var_59_2)
				local var_59_7 = var_59_1.fullName:GetValue(var_59_4)
				local var_59_8 = var_59_1.microphoneAlpha:GetValue(var_59_4)
				local var_59_9 = var_59_1.microphoneIcon:GetValue(var_59_4)
				local var_59_10 = var_59_1.presencePlatform:GetValue(var_59_4)
				local var_59_11 = var_59_1.isMyPlayer:GetValue(var_59_4)
				local var_59_12 = var_59_1.isPrivatePartyHost:GetValue(var_59_4)
				local var_59_13 = var_59_1.displayRank:GetValue(var_59_4)
				local var_59_14 = var_59_1.rankIcon:GetValue(var_59_4)
				local var_59_15 = var_59_1.squad:GetValue(var_59_4)
				local var_59_16 = var_59_1.usingGamepad:GetValue(var_59_4)
				local var_59_17 = tonumber(var_59_1.prestige:GetValue(var_59_4))
				local var_59_18

				var_59_18 = var_59_17 and PROGRESSION.ValidatePrestigeLevel(var_59_17, {
					_isBackendPrestigeLevel = true
				}) or 0

				local var_59_19 = tonumber(var_59_1.rank:GetValue(var_59_4))

				var_59_3:Setup({
					fullName = var_59_7,
					micAlpha = var_59_8,
					micIcon = var_59_9,
					presencePlatform = var_59_10,
					isMyPlayer = var_59_11,
					isPrivatePartyHost = var_59_12,
					displayRank = var_59_13,
					rankIcon = var_59_14,
					usingGamepad = var_59_16,
					prestige = var_59_18,
					rank = var_59_19
				})
				var_59_3:SetEntityNum(var_59_6)
				var_59_3:SetEntityTag("j_head")
				var_59_3:SetAlpha(1)

				local var_59_20 = {
					x = 0,
					y = 0
				}
				local var_59_21 = var_59_2 + 1

				if var_59_21 <= #Lobby.CharacterDetailsWidgetOffsets then
					local var_59_22 = Lobby.CharacterDetailsWidgetOffsets[var_59_21]

					var_59_3:SetWorldSpacePosition(var_59_22.x, 0, var_59_22.y)
				end
			end
		end

		var_59_0 = var_59_0 + 1
	end

	while var_59_0 <= #arg_59_1 do
		arg_59_1[var_59_0]:SetAlpha(0)

		var_59_0 = var_59_0 + 1
	end
end

function Lobby.UpdateFocusArrow(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	assert(arg_60_1)

	if not arg_60_3 then
		return
	end

	if not arg_60_0 then
		return
	end

	local var_60_0 = Lobby.GetSelectedClientCharacterIndexInMemberList(arg_60_0, arg_60_3)

	if not var_60_0 then
		return
	end

	if arg_60_0._selectedCharacterIndex ~= var_60_0 then
		arg_60_0._selectedCharacterIndex = var_60_0

		if ClientCharacter.IJFGGGBAB(var_60_0) and ClientCharacter.EBDDCJHAHD(var_60_0) and Engine.DHEEHAJFEA() then
			arg_60_1:SetAlpha(0, 100)

			arg_60_0:Wait(100).onComplete = function()
				if ClientCharacter.IJFGGGBAB(var_60_0) and ClientCharacter.EBDDCJHAHD(var_60_0) and Engine.DHEEHAJFEA() then
					local var_61_0 = ClientCharacter.DBDJAAEGDH(var_60_0)

					arg_60_1:SetEntityNum(var_61_0)
					arg_60_1:SetEntityTag("j_head")
					arg_60_1:SetAlpha(1, 200)

					local var_61_1 = var_60_0 + 1

					if var_61_1 <= #Lobby.CharacterDetailsWidgetOffsets then
						local var_61_2 = Lobby.CharacterDetailsWidgetOffsets[var_61_1]

						arg_60_1:SetWorldSpacePosition(var_61_2.x, 0, var_61_2.y)
					end
				end
			end
		else
			arg_60_1:SetAlpha(0)
		end
	end
end

function Lobby.UpdateSquadLobbyScene(arg_62_0)
	Engine.DHFCHIIJCA("squad_lobby")
end

function Lobby.DebugUpdateClientCharacters(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0, var_63_1 = OPERATOR.GetEquippedOperatorSkin(arg_63_0, OPERATOR.GetSelectedOperatorIndex(arg_63_0))
	local var_63_2 = StringTable.BFHCAIIDA(CSV.operatorSkinsDebug.file)
	local var_63_3 = {}
	local var_63_4 = {}
	local var_63_5 = {}
	local var_63_6 = {}

	for iter_63_0 = 0, var_63_2 - 1 do
		local var_63_7 = CSV.ReadRow(CSV.operatorSkinsDebug, iter_63_0)

		table.insert(var_63_3, var_63_7.bodyModel)
		table.insert(var_63_4, var_63_7.headModel)
		table.insert(var_63_5, var_63_7.petRef)
		table.insert(var_63_6, var_63_7.weaponModel)
	end

	local var_63_8 = math.min(#var_63_5, FrontEndScene.MaxPets)

	for iter_63_1 = 0, var_63_8 - 1 do
		local var_63_9 = StringTable.BJJBBCJGEJ(CSV.pets.file, CSV.pets.cols.ref, var_63_5[iter_63_1 + 1])
		local var_63_10 = CSV.ReadRow(CSV.pets, var_63_9)

		table.insert(var_63_3, var_63_10.body)
		ClientCharacter.DFHIIAGHDG(FrontEndScene.ClientCharacters.LobbyPet1 + iter_63_1, var_63_10.body)

		local var_63_11 = OPERATOR.GetPetWalk(arg_63_0, var_63_9, FrontEndScene.ClientCharacters.LobbyPet1 + iter_63_1)

		ClientCharacter.CAECDIHFCF(FrontEndScene.ClientCharacters.LobbyPet1 + iter_63_1, var_63_11)
		FrontEndScene.SetCharacterVisible(FrontEndScene.ClientCharacters.LobbyPet1 + iter_63_1, true)
	end

	FrontEndScene.RequestBodyModels(var_63_3)
	FrontEndScene.RequestHeadModels(var_63_4)
	FrontEndScene.RequestWeaponWorldModels(var_63_6)

	if arg_63_1 then
		Lobby.UpdateLocalClientCharacter(arg_63_0, FrontEndScene.ClientCharacters.ArenaLeft1, var_63_3[1], var_63_4[1], 1)
		Lobby.UpdateLocalClientCharacter(arg_63_0, FrontEndScene.ClientCharacters.ArenaLeft2, var_63_3[2], var_63_4[2], 2)
		Lobby.UpdateLocalClientCharacter(arg_63_0, FrontEndScene.ClientCharacters.ArenaRight1, var_63_3[3], var_63_4[3], 3)
		Lobby.UpdateLocalClientCharacter(arg_63_0, FrontEndScene.ClientCharacters.ArenaRight2, var_63_3[4], var_63_4[4], 4)
	else
		local var_63_12 = math.min(#var_63_4, FrontEndScene.MaxLobbyCharacters)

		for iter_63_2 = 1, var_63_12 do
			local var_63_13 = FrontEndScene.LobbyCharacters[iter_63_2]

			if var_63_13 then
				local var_63_14 = Lobby.GetWalkAnimationForIndex(var_63_3[iter_63_2], var_63_4[iter_63_2], iter_63_2, var_63_6[iter_63_2])
				local var_63_15 = {
					showCharacter = true,
					operatorPose = var_63_14,
					weaponModel = var_63_6[iter_63_2]
				}

				OPERATOR.UpdateClientCharacter(var_63_13, var_63_3[iter_63_2], var_63_4[iter_63_2], var_63_15)
			end
		end
	end
end

function Lobby.GetPlayerCardDataForPartyMember(arg_64_0, arg_64_1)
	local var_64_0 = {
		bodyWest = arg_64_1.bodyWest:GetValue(arg_64_0),
		bodyEast = arg_64_1.bodyEast:GetValue(arg_64_0),
		headWest = arg_64_1.headWest:GetValue(arg_64_0),
		headEast = arg_64_1.headEast:GetValue(arg_64_0),
		execWest = arg_64_1.execWest:GetValue(arg_64_0),
		execEast = arg_64_1.execEast:GetValue(arg_64_0),
		weapons = {}
	}

	for iter_64_0 = 0, WEAPON.maxLoadoutWeapons - 1 do
		local var_64_1 = arg_64_1.weapons:GetDataSourceAtIndex(iter_64_0, arg_64_0)
		local var_64_2 = {
			lootID = var_64_1.weaponLootID:GetValue(arg_64_0),
			cosmeticAttachment = var_64_1.cosmeticAttachment:GetValue(arg_64_0),
			camo = var_64_1.weaponCamo:GetValue(arg_64_0)
		}
		local var_64_3 = {}

		for iter_64_1 = 0, WEAPON.maxStickersPerWeapon - 1 do
			local var_64_4 = var_64_1.stickers:GetDataSourceAtIndex(iter_64_1, arg_64_0).stickerID:GetValue(arg_64_0)

			table.insert(var_64_3, var_64_4)
		end

		var_64_2.stickers = var_64_3

		local var_64_5 = {}

		for iter_64_2 = 0, WEAPON.maxAttachmentsPerWeapon - 1 do
			local var_64_6 = var_64_1.attachments:GetDataSourceAtIndex(iter_64_2, arg_64_0)
			local var_64_7 = {
				variantID = var_64_6.variantID:GetValue(arg_64_0),
				attachment = var_64_6.attachment:GetValue(arg_64_0)
			}

			table.insert(var_64_5, var_64_7)
		end

		var_64_2.attachments = var_64_5

		table.insert(var_64_0.weapons, var_64_2)
	end

	return var_64_0
end

function Lobby.TrySwapWeapons(arg_65_0, arg_65_1)
	if arg_65_0 == "none" or arg_65_1 == "none" then
		return arg_65_0, seconday
	end

	local var_65_0 = WEAPON.GetWeaponDetailsFromModel(arg_65_0)
	local var_65_1 = WEAPON.GetWeaponDetailsFromModel(arg_65_1)
	local var_65_2 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, var_65_0.weaponAsset, CSV.MPWeapons.cols.lobbyShouldSwapWithSecondary)
	local var_65_3 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, var_65_1.weaponAsset, CSV.MPWeapons.cols.lobbyShouldSwapWithPrimary)
	local var_65_4 = false

	if #var_65_2 > 0 and #var_65_3 > 0 and tonumber(var_65_2) == 1 and tonumber(var_65_3) == 1 then
		arg_65_0, arg_65_1 = arg_65_1, arg_65_0
		var_65_4 = true
	end

	local var_65_5 = var_65_4 and var_65_0.weaponClass or var_65_1.weaponClass

	if OPERATOR.ShouldStripAttachments(var_65_5) then
		local var_65_6 = var_65_4 and var_65_0.weaponRef or var_65_1.weaponRef

		arg_65_1 = WEAPON.GetWeaponModelNameFromRef(var_65_6)
	end

	return arg_65_0, arg_65_1
end

function Lobby.GetSuperFactionIndexFromTeam(arg_66_0)
	assert(arg_66_0)

	local var_66_0 = OPERATOR.SuperFaction.WEST

	if arg_66_0 == Teams.axis then
		var_66_0 = OPERATOR.SuperFaction.EAST
	end

	return var_66_0
end

function Lobby.CreateClientCharacterContainer(arg_67_0)
	if arg_67_0.clientCharacterContainer then
		return
	end

	arg_67_0.clientCharacterContainer = {}

	for iter_67_0 = 1, FrontEndScene.MaxLobbyCharacters do
		local var_67_0 = LUI.UIElement.new()

		arg_67_0:addElement(var_67_0)
		table.insert(arg_67_0.clientCharacterContainer, var_67_0)
	end
end

function Lobby.DumpStreamingRequests(arg_68_0, arg_68_1)
	assert(#arg_68_0 == #arg_68_1)
	DebugPrint("")
	DebugPrint("Streaming Request Start...................................")

	for iter_68_0 = 1, #arg_68_0 do
		DebugPrint("Body: " .. arg_68_0[iter_68_0] .. ", " .. "Head: " .. arg_68_1[iter_68_0])
	end

	DebugPrint("Streaming Request End...................................")
	DebugPrint("")
end

function Lobby.UpdateClientCharacters(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_1.localClientCharacterIndex or FrontEndScene.ClientCharacters.LocalSquadMember
	local var_69_1 = arg_69_1.maxCharactersToShow or FrontEndScene.MaxLobbyCharacters
	local var_69_2 = arg_69_1.widget
	local var_69_3 = arg_69_1.dataSourcePath or Lobby.AllMembersPath
	local var_69_4 = arg_69_1.teamFilter
	local var_69_5 = arg_69_1.forceSuperfactionBasedOnTeam or false
	local var_69_6 = {}
	local var_69_7 = {}
	local var_69_8 = {}
	local var_69_9 = {}
	local var_69_10 = {}
	local var_69_11 = {}
	local var_69_12 = {}

	Lobby.CreateClientCharacterContainer(var_69_2)

	local var_69_13 = LUI.DataSourceInGlobalModel.new(var_69_3 .. ".count")
	local var_69_14 = LUI.DataSourceFromList.new(var_69_13)

	var_69_14.MakeDataSourceAtIndex = Lobby.GetLobbyMemberDataSourceAtIndex(var_69_3)

	local var_69_15 = var_69_13:GetValue(arg_69_0)

	var_69_15 = var_69_15 == nil and 0 or var_69_15

	local var_69_16 = math.min(var_69_15 - 1, FrontEndScene.MaxLobbyCharacters)

	if var_69_1 then
		var_69_16 = math.min(var_69_16, var_69_1 - 1)
	end

	local var_69_17 = 2

	if var_69_4 then
		var_69_17 = Lobby.GetLocalClientTeam() == var_69_4 and 2 or 1
	end

	local var_69_18 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_69_0)

	local function var_69_19()
		for iter_70_0 = 0, var_69_16 do
			var_69_9[iter_70_0 + 1] = var_69_9[iter_70_0 + 1] or {}

			local var_70_0 = var_69_9[iter_70_0 + 1]
			local var_70_1 = var_69_14:GetDataSourceAtIndex(iter_70_0, arg_69_0)

			var_70_0.playerCardData = Lobby.GetPlayerCardDataForPartyMember(arg_69_0, var_70_1, 2)

			local var_70_2 = var_70_1.selectedOperatorIndex:GetValue(arg_69_0)

			if var_69_5 then
				local var_70_3 = var_70_1.team:GetValue(arg_69_0)

				if var_70_3 ~= Teams.free and var_70_3 ~= Teams.spectator then
					var_70_2 = 0

					if var_70_3 == Teams.axis then
						var_70_2 = 1
					end
				end
			end

			var_70_0.superfactionIndex = var_70_2

			local var_70_4 = true

			if var_69_4 then
				var_70_4 = var_70_1.team:GetValue(arg_69_0) == var_69_4
			end

			var_70_0.shouldUpdate = var_70_4
			var_70_0.isMyPlayer = var_70_1.isMyPlayer:GetValue(arg_69_0)
			var_70_0.XUID = var_70_1.xuid:GetValue(arg_69_0)
			var_70_0.dataSource = var_70_1
		end
	end

	local function var_69_20()
		local var_71_0
		local var_71_1

		for iter_71_0 = 0, var_69_16 do
			local var_71_2 = var_69_9[iter_71_0 + 1]
			local var_71_3 = var_71_2.playerCardData

			if var_71_2.isMyPlayer then
				var_71_0, var_71_1 = Lobby.GetModelDetailsFromPlayerCard(var_71_3, var_71_2.superfactionIndex, arg_69_0, false)
			end

			if var_71_2.shouldUpdate then
				local var_71_4, var_71_5 = Lobby.GetModelDetailsFromPlayerCard(var_71_3, var_71_2.superfactionIndex, arg_69_0, var_71_2.isMyPlayer)
				local var_71_6 = Lobby.GetWeaponLoadoutDetailsFromPlayerCard(var_71_3, 1, arg_69_0)
				local var_71_7 = Lobby.GetWeaponLoadoutDetailsFromPlayerCard(var_71_3, 2, arg_69_0)
				local var_71_8, var_71_9 = Lobby.TrySwapWeapons(var_71_6, var_71_7)

				if var_71_2.isMyPlayer then
					var_69_18 = OPERATOR.ValidateAccessoryModel(var_69_18, var_71_4)

					table.insert(var_69_8, var_69_18)
					table.insert(var_69_11, var_71_5)
					table.insert(var_69_10, var_71_4)
					table.insert(var_69_12, var_71_8)
					table.insert(var_69_12, var_71_9)
				else
					table.insert(var_69_6, var_71_5)
					table.insert(var_69_7, var_71_4)
					table.insert(var_69_8, var_71_8)
					table.insert(var_69_8, var_71_9)
				end

				var_71_2.head = var_71_5
				var_71_2.body = var_71_4
				var_71_2.primary = var_71_8
				var_71_2.secondary = var_71_9
				var_71_2.pet = Lobby.GetPetFromPlayerCard(var_71_3, var_71_2.superfactionIndex)

				if var_71_2.pet then
					table.insert(var_69_7, OPERATOR.GetPetModel(var_71_2.pet))
				end
			end
		end

		if OPERATOR.ShouldShowGhostTeaser(arg_69_0) then
			table.insert(var_69_6, "head_mp_western_ghost_1_1")
			table.insert(var_69_7, "body_mp_western_ghost_1_1_fe")
			table.insert(var_69_8, "iw8_ar_scharlie_mpv2+rec_scharlie|1+back_scharlie|1+mag_scharlie|1+selectsemi+barlong_scharlie_v2|3+ammomod_wound+pistolgrip02_scharlie_v2|1+vzscope_mike14_ar")
			table.insert(var_69_8, "iw8_pi_cpapa_mp+rec_cpapa+front_cpapa+ammo_cpapa+backno_cpapa+ironsdefault_cpapa")
		end

		table.insert(var_69_6, var_71_1)
		table.insert(var_69_7, var_71_0)

		for iter_71_1 = #var_69_10, 1, -1 do
			table.insert(var_69_7, var_69_10[iter_71_1])
		end

		for iter_71_2 = #var_69_11, 1, -1 do
			table.insert(var_69_6, var_69_11[iter_71_2])
		end

		for iter_71_3 = #var_69_12, 1, -1 do
			table.insert(var_69_8, var_69_12[iter_71_3])
		end
	end

	local function var_69_21()
		FrontEndScene.RequestBodyModels(var_69_7)
		FrontEndScene.RequestHeadModels(var_69_6)
		FrontEndScene.RequestWeaponWorldModels(var_69_8)

		if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("lui_show_operator_streaming_requests") then
			Lobby.DumpStreamingRequests(var_69_7, var_69_6)
		end
	end

	local function var_69_22()
		local var_73_0 = false

		for iter_73_0 = 0, var_69_16 do
			local var_73_1 = var_69_2.clientCharacterContainer[iter_73_0 + 1]
			local var_73_2 = var_69_9[iter_73_0 + 1]

			if var_73_2.shouldUpdate then
				if var_73_2.isMyPlayer and not var_73_0 then
					var_73_2.characterIndex = var_69_0

					Lobby.UpdateLocalClientCharacter(arg_69_0, var_69_0, var_73_2.body, var_73_2.head, iter_73_0 + 1, var_73_1, var_73_2.primary, var_73_2.secondary, var_69_18, var_73_2.pet)

					var_73_0 = true
				else
					local var_73_3 = FrontEndScene.LobbyCharacters[var_69_17]

					if var_73_3 then
						var_73_2.characterIndex = var_73_3

						Lobby.UpdateLocalClientCharacter(arg_69_0, var_73_3, var_73_2.body, var_73_2.head, iter_73_0 + 1, var_73_1, var_73_2.primary, var_73_2.secondary, nil, var_73_2.pet)
					end

					var_69_17 = var_69_17 + 1
				end
			end
		end

		FrontEndScene.HideAllLobbyCharactersPastIndex(var_69_17)
	end

	if arg_69_1.delayWidget then
		local var_69_23 = arg_69_1.delayWidget
		local var_69_24 = arg_69_1.delayCompleteFunc
		local var_69_25 = 1
		local var_69_26 = {
			var_69_19,
			var_69_20,
			var_69_21,
			var_69_22
		}
		local var_69_27

		local function var_69_28()
			local var_74_0 = var_69_26[var_69_25]

			if var_74_0 then
				var_74_0()

				var_69_25 = var_69_25 + 1
				var_69_23:Wait(50).onComplete = var_69_28
			elseif var_69_24 then
				var_69_24(var_69_9)
			end
		end

		var_69_28()
	else
		var_69_19()
		var_69_20()
		var_69_21()
		var_69_22()
	end

	return var_69_9
end

function Lobby.UpdateClientCharactersDelayed(arg_75_0, arg_75_1, arg_75_2, arg_75_3)
	arg_75_2.delayWidget = arg_75_0
	arg_75_2.delayCompleteFunc = arg_75_3

	Lobby.UpdateClientCharacters(arg_75_1, arg_75_2)

	arg_75_2.delayWidget = nil
	arg_75_2.delayCompleteFunc = nil
end

function Lobby.CheckTURequirement(arg_76_0, arg_76_1)
	if Engine.BHFDJFGJHD() then
		LUI.FlowManager.RequestPopupMenu(arg_76_0, "TURequiredWarning", false, arg_76_1, false)
	end
end

function Lobby.ClearMatchData()
	Engine.CFHFFAIEAF()
end

function Lobby.AreWePrivatePartyHost()
	return Lobby.GFFECBCCF() and Lobby.BGIADHIHAG()
end

function Lobby.IsOurPrivatePartyHostInLobby()
	local var_79_0 = Lobby.GFFECBCCF()
	local var_79_1 = Lobby.BGIADHIHAG()
	local var_79_2 = Lobby.DFCFDHBBHH()

	DebugPrint("Lobby.IsOurPrivatePartyHostInLobby is called. inPrivateParty " .. tostring(var_79_0) .. " isPrivateParyHost " .. tostring(var_79_1) .. " isHostInLobby " .. tostring(var_79_2) .. "\n")

	return var_79_0 and not var_79_1 and var_79_2
end

function Lobby.IsSplitScreenEnabled()
	local var_80_0 = Engine.JEDFGECDJ() > 1
	local var_80_1 = Engine.BJIBIJHDFJ()

	return var_80_0 or var_80_1
end

function Lobby.IsVotingFinished()
	local var_81_0 = Lobby.BFFJAJFBDH()
	local var_81_1 = Dvar.IBEGCHEFE("MPKKNQPOQO") and Dvar.IBEGCHEFE("party_teamBased")
	local var_81_2 = Lobby.GAHGHDBIA(MapVoting.MapA.refNum)
	local var_81_3 = Lobby.GAHGHDBIA(MapVoting.MapB.refNum)
	local var_81_4 = Lobby.GAHGHDBIA(MapVoting.MapC.refNum)
	local var_81_5 = Lobby.CGAFFFJBCD(MapVoting.MapA.refNum)
	local var_81_6 = Lobby.CGAFFFJBCD(MapVoting.MapB.refNum)
	local var_81_7 = Lobby.CGAFFFJBCD(MapVoting.MapC.refNum)
	local var_81_8 = var_81_2 == var_81_3 == var_81_4 and var_81_5 == var_81_6 == var_81_7

	return var_81_0 or var_81_1 or var_81_8
end

function Lobby.VoteForMap(arg_82_0, arg_82_1, arg_82_2)
	assert(arg_82_2 == MapVoting.MapA.voteIndex or arg_82_2 == MapVoting.MapB.voteIndex or arg_82_2 == MapVoting.MapC.voteIndex)

	if Engine.BFBIDEGDFB then
		local var_82_0 = LUI.FlowManager.GetScopedData(arg_82_0)
		local var_82_1 = Engine.BFBIDEGDFB()

		if var_82_0.voteDelayEndTime and var_82_1 < var_82_0.voteDelayEndTime then
			local var_82_2 = var_82_0.voteCount or 1

			arg_82_0:dispatchEventToRoot({
				name = "set_button_info_text",
				text = Engine.CBBHFCGDIC("@PATCH_MENU/WAIT_TO_VOTE", var_82_2)
			})

			return
		end

		if not var_82_0.voteCount then
			var_82_0.voteCount = 1
		elseif var_82_0.voteCount < 6 then
			var_82_0.voteCount = var_82_0.voteCount + 1
		end

		var_82_0.voteDelayEndTime = Engine.BFBIDEGDFB() + 1000 * var_82_0.voteCount
	end

	local var_82_3 = "xpartyvote " .. arg_82_2

	Engine.EBIDFIDHIE(var_82_3, arg_82_1)
end

function Lobby.OpenAfterActionReport(arg_83_0, arg_83_1, arg_83_2, arg_83_3, arg_83_4)
	if Engine.DBAEJAHFGJ(arg_83_0) then
		arg_83_1 = true
	end

	local var_83_0 = AAR.IsMatchClientDataAvailable()
	local var_83_1 = IsPrivateMatch() and not CONDITIONS.IsTrialGameType()

	if arg_83_4 then
		var_83_0 = true
	end

	if var_83_0 and (var_83_1 or IsSystemLink()) then
		InitAARDataSources(arg_83_0)

		var_83_0 = AAR.IsScoreboardDataValid(arg_83_0)
	end

	if var_83_0 then
		local var_83_2 = LUI.FlowManager.GetVisibleMenu()

		if var_83_2 and var_83_2.id == "AARContainer" then
			var_83_2:AARSetUp(arg_83_0, {
				controller = arg_83_0,
				onlyLeaderboard = arg_83_1,
				fromMatch = arg_83_2,
				isCPPoints = arg_83_3
			})
		else
			LUI.FlowManager.RequestAddMenu("AARContainer", true, arg_83_0, false, {
				controller = arg_83_0,
				onlyLeaderboard = arg_83_1,
				fromMatch = arg_83_2,
				isCPPoints = arg_83_3
			})
		end
	else
		DebugPrint("AAR failed to show, data is unavailable")
	end
end

function Lobby.SetupReopenAAR(arg_84_0, arg_84_1, arg_84_2)
	local var_84_0 = arg_84_2 and AAR.IsMatchClientDataAvailable()

	if var_84_0 and (IsPrivateMatch() or IsSystemLink()) then
		InitAARDataSources(arg_84_1)

		var_84_0 = AAR.IsScoreboardDataValid(arg_84_1)
	end

	if var_84_0 then
		local var_84_1 = "LUA_MENU/GAME_SUMMARY"

		if CONDITIONS.IsThirdGameMode() and IsSystemLink() then
			var_84_1 = "AAR/SCOREBOARD"
		elseif CONDITIONS.IsCoreMultiplayer() and (IsPrivateMatch() or IsSystemLink()) then
			var_84_1 = "AAR/SCOREBOARD"
		end

		arg_84_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			side = "left",
			priority = 4,
			button_ref = "button_left_trigger",
			helper_text = Engine.CBBHFCGDIC(var_84_1)
		})
		arg_84_0.bindButton:registerEventHandler("button_left_trigger", function(arg_85_0, arg_85_1)
			Lobby.OpenAfterActionReport(arg_85_1.controller, true, false)
		end)

		arg_84_0._buttonSelectAdded = true
	elseif arg_84_0._buttonSelectAdded then
		arg_84_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_left_trigger"
		})
		arg_84_0.bindButton:registerEventHandler("button_left_trigger", nil)

		arg_84_0._buttonSelectAdded = false
	end
end

function Lobby.GetMaxBotLimit()
	local var_86_0 = Lobby.BotLimit

	if Dvar.IBEGCHEFE("splitscreen") then
		var_86_0 = math.max(Lobby.BotLimitForSplitScreen - Engine.JEDFGECDJ(), 0)
	end

	if Dvar.IBEGCHEFE("LSTLQTSSRM") == true or Dvar.IBEGCHEFE("LPSPMQSNPQ") == true then
		var_86_0 = math.min(var_86_0, Dvar.CFHDGABACF("OOTQKOTRM"))
		var_86_0 = math.max(var_86_0 - Lobby.BHHDDECHII(Lobby.MemberListStates.Lobby), 0)
	end

	return var_86_0
end

function Lobby.ClearAllBots()
	Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 0)
	Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 0)
	Lobby.DGDIGJDHH(Lobby.BotTeams.FFA, 0)
end

function Lobby.FixTeamLimitsAndDifficultiesIfNecessary(arg_88_0, arg_88_1)
	local var_88_0 = tonumber(StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_88_0, CSV.gameTypesTable.cols.teamBased))
	local var_88_1 = tonumber(StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_88_1, CSV.gameTypesTable.cols.teamBased))

	if var_88_0 == 1 and var_88_1 == 0 then
		if Lobby.DGDIGJDHH and Lobby.BEAJCIDDGF then
			local var_88_2 = Lobby.BEAJCIDDGF(Lobby.BotTeams.Friendly)
			local var_88_3 = Lobby.BEAJCIDDGF(Lobby.BotTeams.Enemy)

			if var_88_2 + var_88_3 > Lobby.GetMaxBotLimit() then
				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 0)
				Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 0)
				Lobby.DGDIGJDHH(Lobby.BotTeams.FFA, Lobby.GetMaxBotLimit())
			else
				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 0)
				Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 0)
				Lobby.DGDIGJDHH(Lobby.BotTeams.FFA, var_88_2 + var_88_3)
			end
		end

		if Lobby.BGJCGDFHGA and Lobby.DHBAICDCJC then
			local var_88_4 = Lobby.DHBAICDCJC(Lobby.BotTeams.Enemy)

			Lobby.BGJCGDFHGA(Lobby.BotTeams.FFA, var_88_4)
		end
	end

	if var_88_0 == 0 and var_88_1 == 1 then
		if Lobby.DGDIGJDHH and Lobby.BEAJCIDDGF then
			local var_88_5 = Lobby.GetMaxBotLimit()
			local var_88_6 = Lobby.BEAJCIDDGF(Lobby.BotTeams.FFA)

			if var_88_5 < var_88_6 then
				var_88_6 = var_88_5
			end

			Lobby.DGDIGJDHH(Lobby.BotTeams.FFA, 0)

			if CONDITIONS.IsArenaGameType() then
				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 2)
				Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 2)
			else
				local var_88_7 = math.floor(var_88_6 / 2)

				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, var_88_7)

				if var_88_6 % 2 == 1 then
					Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, var_88_7 + 1)
				else
					Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, var_88_7)
				end
			end
		end

		if Lobby.BGJCGDFHGA and Lobby.DHBAICDCJC then
			local var_88_8 = Lobby.DHBAICDCJC(Lobby.BotTeams.FFA)

			Lobby.BGJCGDFHGA(Lobby.BotTeams.Friendly, var_88_8)
			Lobby.BGJCGDFHGA(Lobby.BotTeams.Enemy, var_88_8)
		end
	end
end

function Lobby.GetMapIndexByRef(arg_89_0)
	if not arg_89_0 or #arg_89_0 == 0 then
		return
	end

	for iter_89_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		if arg_89_0 == Lobby.CJEHDHDGBH(iter_89_0) then
			return iter_89_0
		end
	end
end

function Lobby.GetGameTypesTableForMapIndex(arg_90_0)
	if not arg_90_0 then
		return
	end

	local var_90_0 = Lobby.DIIFDCEJJ(arg_90_0)
	local var_90_1 = string.gsub(var_90_0, ",", "")

	return (LUI.KeyValueSplit(var_90_1, " "))
end

function Lobby.GetCurrentGameType()
	local var_91_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

	if MatchRules.EAIEFBHGJ() then
		var_91_0 = MatchRules.BIJEDCBCBH("gametype")
	end

	return var_91_0
end

function Lobby.IsWaveGameType()
	return Lobby.GetCurrentGameType() == CP.WAVE_SURVIVAL
end

function Lobby.GetCurrentGameTypeName()
	local var_93_0 = Lobby.GetCurrentGameType()
	local var_93_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_93_0, CSV.gameTypesTable.cols.name)

	return Engine.CBBHFCGDIC(var_93_1)
end

function Lobby.DoesCurrentGameTypeSupportCrossplay()
	return Lobby.GetCurrentGameType() ~= nil
end

function Lobby.IsCurrentGameTypeteamBased()
	local var_95_0 = Lobby.GetCurrentGameType()
	local var_95_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_95_0, CSV.gameTypesTable.cols.teamBased)

	if #var_95_1 > 0 then
		return tonumber(var_95_1) > 0
	end

	return 0
end

function Lobby.IsCurrentGameTypeRoundBased()
	local var_96_0 = Lobby.GetCurrentGameType()
	local var_96_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_96_0, CSV.gameTypesTable.cols.isRoundBased)

	if #var_96_1 > 0 then
		return tonumber(var_96_1) > 0
	end

	return 0
end

function Lobby.RefreshMLGRules(arg_97_0, arg_97_1)
	local var_97_0 = MatchRules.BIJEDCBCBH("cwlRulesEnabled")

	if var_97_0 ~= nil and var_97_0 then
		MLG.SetUsingMLGRules(true)
	end
end

function Lobby.OpenWarzonePrivateMatchLobby(arg_98_0)
	LUI.FlowManager.RequestAddMenu("WarzonePrivateMatchLobby", false, arg_98_0.controllerIndex, false, {})
	Lobby.createNVidiaGroup("MW_Highlights")
end

function Lobby.OpenPrivateMatchLobby(arg_99_0)
	Engine.DAGFFDGFII(CoD.GetMPOnlineCfg(), arg_99_0.controller)

	if Engine.ECHCFGDDDF() then
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
		LUI.FlowManager.RequestAddMenu("PrivateMatchLobby", false, arg_99_0.controller, false, {})
	else
		Engine.EBIDFIDHIE(CPConfig.default_aliens, arg_99_0.controller)
		LUI.FlowManager.RequestAddMenu("CPPrivateMatchLobby", false, arg_99_0.controller, false, {})
	end

	Lobby.createNVidiaGroup("MW_Highlights")
end

function Lobby.OpenGameBattlesLobby(arg_100_0)
	Engine.DAGFFDGFII(MPConfig.default_online, arg_100_0)
	LUI.FlowManager.RequestAddMenu("GameBattlesMatchLobby", false, arg_100_0, false, {})
	Lobby.createNVidiaGroup("MW_Highlights")
end

function Lobby.GetLobbyMemberDataSourceAtIndex(arg_101_0)
	local function var_101_0(arg_102_0)
		return StringTable.CBGJCDIHCE(CSV.zombieConsumableItems.File, arg_102_0, CSV.zombieConsumableItems.Cols.Icon)
	end

	local function var_101_1(arg_103_0)
		return StringTable.CBGJCDIHCE(CSV.cpFieldUpgrades.file, arg_103_0, CSV.cpFieldUpgrades.cols.ref)
	end

	local function var_101_2(arg_104_0)
		local var_104_0 = StringTable.CBGJCDIHCE(CSV.zombieConsumableItems.file, arg_104_0, CSV.zombieConsumableItems.cols.ref)

		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.ref, var_104_0, CSV.munitions.cols.name))
	end

	local function var_101_3(arg_105_0)
		local var_105_0 = StringTable.CBGJCDIHCE(CSV.zombieConsumableItems.file, arg_105_0, CSV.zombieConsumableItems.cols.ref)

		return StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.ref, var_105_0, CSV.munitions.cols.icon)
	end

	return function(arg_106_0, arg_106_1, arg_106_2)
		local var_106_0 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".rank")
		local var_106_1 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".prestige")
		local var_106_2 = Rank.MakeRankIconAggregateFunction(var_106_0, var_106_1)
		local var_106_3 = LUI.AggregateDataSource.new(var_106_0, {
			var_106_0,
			var_106_1
		}, "rankIcon", var_106_2)
		local var_106_4 = Rank.MakeRankDisplayAggregateFunction(var_106_0, var_106_1, true)
		local var_106_5 = LUI.AggregateDataSource.new(var_106_0, {
			var_106_0,
			var_106_1
		}, "display", var_106_4)
		local var_106_6 = var_106_1:Filter("isMasterPrestige", Rank.IsMasterPrestige)
		local var_106_7 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".microphoneState")
		local var_106_8 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".usingGamepad")
		local var_106_9 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".clanTag")
		local var_106_10 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".gamertag")
		local var_106_11 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".gamertagWithHash")
		local var_106_12 = LUI.AggregateDataSource.new(var_106_9, {
			var_106_9,
			var_106_10
		}, "fullName", function(arg_107_0)
			return var_106_9:GetValue(arg_107_0) .. " " .. var_106_10:GetValue(arg_107_0)
		end)
		local var_106_13 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".presencePlatform")
		local var_106_14 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".customEmblemEquipped")
		local var_106_15 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".emblemIndex")
		local var_106_16 = LUI.FilteredDataSource.new(var_106_15, "emblem", function(arg_108_0, arg_108_1)
			return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, arg_108_0, CSV.emblems.cols.image)
		end)
		local var_106_17 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".backgroundIndex")
		local var_106_18
		local var_106_19

		if Engine.EAIICIFIFA() then
			local var_106_20 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".zombiesConsumables.slot0Index")
			local var_106_21 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".zombiesConsumables.slot1Index")
			local var_106_22 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".zombiesConsumables.slot2Index")
			local var_106_23 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".zombiesConsumables.slot3Index")
			local var_106_24 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".zombiesConsumables.slot4Index")

			var_106_18 = {
				cardSlot1Icon = var_106_20:Filter("cardSlot1Icon", var_101_3),
				cardSlot2Icon = var_106_21:Filter("cardSlot2Icon", var_101_3),
				cardSlot3Icon = var_106_22:Filter("cardSlot3Icon", var_101_3),
				cardSlot4Icon = var_106_23:Filter("cardSlot4Icon", var_101_3),
				cardSlot5Icon = var_106_24:Filter("cardSlot5Icon", var_101_3)
			}
			var_106_19 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".cpFieldUpgradeRowNum"):Filter("cpFieldUpgrade", var_101_1)
		end

		local var_106_25 = arg_101_0 .. "." .. arg_106_1 .. ".weaponSetup."
		local var_106_26 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. ".weaponCount")
		local var_106_27 = LUI.DataSourceFromList.new(var_106_26)

		function var_106_27.MakeDataSourceAtIndex(arg_109_0, arg_109_1)
			local var_109_0 = LUI.DataSourceInGlobalModel.new(var_106_25 .. arg_109_1 .. ".stickerCount")
			local var_109_1 = LUI.DataSourceFromList.new(var_109_0)

			function var_109_1.MakeDataSourceAtIndex(arg_110_0, arg_110_1)
				return {
					stickerID = LUI.DataSourceInGlobalModel.new(var_106_25 .. arg_109_1 .. ".sticker." .. arg_110_1)
				}
			end

			local var_109_2 = LUI.DataSourceInGlobalModel.new(var_106_25 .. ".attachmentCount")
			local var_109_3 = LUI.DataSourceFromList.new(var_109_2)

			function var_109_3.MakeDataSourceAtIndex(arg_111_0, arg_111_1)
				return {
					variantID = LUI.DataSourceInGlobalModel.new(var_106_25 .. arg_109_1 .. ".attachment." .. arg_111_1 .. ".variant"),
					attachment = LUI.DataSourceInGlobalModel.new(var_106_25 .. arg_109_1 .. ".attachment." .. arg_111_1 .. ".attachment")
				}
			end

			return {
				weaponLootID = LUI.DataSourceInGlobalModel.new(var_106_25 .. arg_109_1 .. ".weaponLootID"),
				cosmeticAttachment = LUI.DataSourceInGlobalModel.new(var_106_25 .. arg_109_1 .. ".cosmeticAttachment"),
				weaponCamo = LUI.DataSourceInGlobalModel.new(var_106_25 .. arg_109_1 .. ".weaponCamo"),
				stickers = var_109_1,
				attachments = var_109_3
			}
		end

		local var_106_28 = {}
		local var_106_29 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".followersCount")
		local var_106_30 = var_106_29:GetValue(arg_106_2)

		for iter_106_0 = 0, var_106_30 - 1 do
			local var_106_31 = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".followers." .. iter_106_0)

			table.insert(var_106_28, iter_106_0, var_106_31)
		end

		return {
			memberIndex = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".memberIndex"),
			controllerIndex = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".controllerIndex"),
			isMyPlayer = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".isMyPlayer"),
			xuid = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".xuid"),
			platformId = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".platformId"),
			isLobbyHost = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".isLobbyHost"),
			isSearchingForParty = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".isSearchingForParty"),
			isVisible = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".isVisible"),
			team = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".team"),
			squad = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".squad"),
			desiredTeam = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".desiredTeam"),
			selectedOperatorIndex = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".selectedOperatorIndex"),
			bodyWest = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".bodyWest"),
			bodyEast = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".bodyEast"),
			headWest = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".headWest"),
			headEast = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".headEast"),
			execWest = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".execWest"),
			execEast = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".execEast"),
			weapons = var_106_27,
			rank = var_106_0,
			prestige = var_106_1,
			usingGamepad = var_106_8,
			gamertag = var_106_10,
			gamertagWithHash = var_106_11,
			missingGamertag = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".missingGamertag"),
			clanTag = var_106_9,
			fullName = var_106_12,
			displayRank = var_106_5,
			rankIcon = var_106_3,
			isMasterPrestige = var_106_6,
			microphoneState = var_106_7,
			microphoneIcon = var_106_7:Filter("icon", Mic.GetIcon),
			microphoneAlpha = var_106_7:Filter("alpha", Mic.GetIconAlpha),
			subparty = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".subparty"),
			isPrivatePartyHost = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".isPrivatePartyHost"),
			presencePlatform = var_106_13,
			customEmblemEquipped = var_106_14,
			emblemIndex = var_106_15,
			emblem = var_106_16,
			backgroundIndex = var_106_17,
			background = var_106_17:Filter("background", CallingCardUtils.GetCardTexture),
			zombiesConsumables = var_106_18,
			cpFieldUpgrade = var_106_19,
			commitReady = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".commitReady"),
			followersCount = var_106_29,
			followers = var_106_28,
			followerIndex = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".followerIndex"),
			isCrossplayPlayer = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".isCrossplayPlayer"),
			isPlaceHolderPlayer = LUI.DataSourceInGlobalModel.new(arg_101_0 .. "." .. arg_106_1 .. ".isPlaceHolderPlayer")
		}
	end
end

function Lobby.AddToggleJoinableButtonHelper(arg_112_0, arg_112_1, arg_112_2)
	local var_112_0 = Lobby.DJJCFGDGGC(arg_112_1)

	if var_112_0 ~= arg_112_0._isInviteOnly or arg_112_0._isInviteOnly == nil then
		arg_112_0._isInviteOnly = var_112_0

		if var_112_0 then
			arg_112_0:AddButtonHelperText({
				clickable = true,
				priority = 1000,
				side = "left",
				ignoreTooltipPrompt = true,
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/LOBBY_ALLOW_JOIN")
			})
		else
			arg_112_0:AddButtonHelperText({
				clickable = true,
				priority = 1000,
				side = "left",
				ignoreTooltipPrompt = true,
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/LOBBY_BLOCK_JOIN")
			})
		end

		if LUI.IsLastInputMouseNavigation(arg_112_1) then
			arg_112_0:Wait(1).onComplete = function()
				Engine.HJJJIGAC(arg_112_1)
			end
		end
	end

	if arg_112_2 then
		arg_112_0:Wait(1000).onComplete = function()
			return Lobby.AddToggleJoinableButtonHelper(arg_112_0, arg_112_1, true)
		end
	end
end

function Lobby.CreateToggleJoinableBindButton(arg_115_0, arg_115_1)
	local var_115_0 = LUI.UIBindButton.new()

	var_115_0.id = "toggleJoinableBindButton"

	var_115_0:registerEventHandler("button_alt1", function(arg_116_0, arg_116_1)
		if arg_116_1.qualifier == "keyboard" then
			return
		end

		Lobby.ToggleJoinOnInviteOnly(arg_116_1.controller)
		Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY)

		arg_115_0:Wait(1).onComplete = function()
			return Lobby.AddToggleJoinableButtonHelper(arg_115_0, arg_116_1.controller, false)
		end

		ACTIONS.PlaySoundSetSound(arg_115_0, "selectAlt", false)
	end)
	Lobby.AddToggleJoinableButtonHelper(arg_115_0, arg_115_1, true)
	arg_115_0:addElement(var_115_0)
end

function Lobby.GetMPMapMaterialStreamer()
	local var_118_0 = {}

	for iter_118_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		table.insert(var_118_0, RegisterMaterial(Lobby.EAJBIDDDGF(iter_118_0)))
	end

	local var_118_1 = LUI.UIElement.new()

	var_118_1.id = "MPMapMaterialStreamer"

	var_118_1:SetupImageTableStreamer(var_118_0)

	return var_118_1
end

function Lobby.GetMPMapPreloadStreamer(arg_119_0)
	local var_119_0 = LUI.UIElement.new()

	var_119_0.id = "GetMPMapPreloadStreamer"

	local var_119_1 = LUI.UITimer.new({
		interval = 100,
		event = "update_preload_streamer"
	})

	var_119_1.id = "lobbyTimer"

	var_119_0:addElement(var_119_1)
	var_119_0:registerEventHandler("update_preload_streamer", function(arg_120_0, arg_120_1)
		Lobby.UpdatePreloadStreamer(arg_119_0)
	end)

	return var_119_0
end

function Lobby.SetupSystemLinkDvars(arg_121_0)
	Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)
end

function Lobby.OpenSystemLinkMenu(arg_122_0, arg_122_1)
	if arg_122_1 == nil then
		arg_122_1 = Engine.ECHCFGDDDF()
	end

	Dvar.DHEGHJJJHI("splitscreen", false)
	Lobby.SetupSystemLinkDvars()
	Engine.CDGCBCBAJ("Opening MPSystemLinkMenu", arg_122_0)
	Engine.DAGFFDGFII("xstartprivateparty", arg_122_0)

	local var_122_0 = arg_122_1 and "MPSystemLinkMenu" or "CPSystemLinkMenu"

	LUI.FlowManager.RequestAddMenu(var_122_0, false, arg_122_0, false, {})
end

function Lobby.OpenSystemLinkLobby(arg_123_0, arg_123_1, arg_123_2)
	Lobby.SetupSystemLinkDvars()

	local var_123_0 = arg_123_1 and "MPSystemLinkLobby" or "CPSystemLinkLobby"

	Engine.DAGFFDGFII("xstartprivateparty", arg_123_0)
	MP.ValidateAllPlayersPrivateSquadMembers()
	Dvar.DHEGHJJJHI("LLPNKKORPT", true)
	Engine.CCHAIADBGH()
	LUI.FlowManager.RequestAddMenu(var_123_0, false, arg_123_0, false, {
		isLocalPlayMenuSkipped = arg_123_2
	})
	Lobby.createNVidiaGroup("MW_Highlights")
end

Lobby.numMembersDataSource = nil
Lobby.members = nil
Lobby.numTotalMembersDataSource = nil

function Lobby.GetMembersListDataSource()
	if not Lobby.numMembersDataSource or not Lobby.members then
		Lobby.numMembersDataSource = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count")
		Lobby.numTotalMembersDataSource = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.memberCount")
		Lobby.members = LUI.DataSourceFromList.new(Lobby.numMembersDataSource)
		Lobby.members.MakeDataSourceAtIndex = Lobby.GetLobbyMemberDataSourceAtIndex("alwaysLoaded.activeParty.members")
	end

	return Lobby.numMembersDataSource, Lobby.members, Lobby.numTotalMembersDataSource
end

function Lobby.GetLocalPlayerDataSource(arg_125_0, arg_125_1)
	local var_125_0, var_125_1, var_125_2 = Lobby.GetMembersListDataSource()

	local function var_125_3(arg_126_0, arg_126_1)
		local var_126_0 = var_125_1:GetDataSourceAtIndex(arg_126_1)

		if var_126_0.isMyPlayer:GetValue(arg_126_0) then
			local var_126_1 = var_126_0.controllerIndex:GetValue(arg_126_0)

			if var_126_1 and var_126_1 == arg_126_0 then
				return var_126_0
			end
		end
	end

	local var_125_4 = var_125_2:GetValue(arg_125_0)

	if arg_125_1 and #arg_125_1 > 0 then
		for iter_125_0 = 0, var_125_4 - 1 do
			local var_125_5 = var_125_1:GetDataSourceAtIndex(iter_125_0)

			if var_125_5 and var_125_5.xuid:GetValue(arg_125_0) == arg_125_1 then
				return var_125_5
			end
		end
	else
		for iter_125_1 = 0, var_125_4 - 1 do
			local var_125_6 = var_125_3(arg_125_0, iter_125_1)

			if var_125_6 then
				return var_125_6
			end
		end
	end

	return nil
end

function Lobby.GetPreviousFollowablePlayerNum(arg_127_0)
	local var_127_0, var_127_1 = Lobby.GetMembersListDataSource()

	for iter_127_0 = arg_127_0 - 1, 0, -1 do
		local var_127_2 = var_127_1:GetDataSourceAtIndex(iter_127_0)

		if var_127_2.team:GetValue() ~= Teams.follower then
			return var_127_2.memberIndex:GetValue()
		end
	end
end

function Lobby.GetNextFollowablePlayerNum(arg_128_0)
	local var_128_0, var_128_1, var_128_2 = Lobby.GetMembersListDataSource()
	local var_128_3 = var_128_2:GetValue()

	for iter_128_0 = arg_128_0 + 1, var_128_3 - 1 do
		local var_128_4 = var_128_1:GetDataSourceAtIndex(iter_128_0)

		if var_128_4.team:GetValue() ~= Teams.follower then
			return var_128_4.memberIndex:GetValue()
		end
	end
end

function Lobby.GetFirstFollowablePlayerNum(arg_129_0)
	return Lobby.GetPreviousFollowablePlayerNum(arg_129_0) or Lobby.GetNextFollowablePlayerNum(arg_129_0)
end

function Lobby.ShouldIncludeGameMode(arg_130_0)
	local var_130_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_130_0, CSV.gameTypesTable.cols.privateExclusiveMode)

	if var_130_0 == "cp" and not CONDITIONS.IsThirdGameMode() then
		return false
	elseif var_130_0 == "magma" and not CONDITIONS.IsMagmaGameMode() then
		return false
	end

	return true
end

function Lobby.ShouldIncludeWZPrivateMatchGameMode(arg_131_0, arg_131_1)
	local var_131_0 = PRIVATE_MATCH.WarzoneGameTypeSetupTable[arg_131_0]
	local var_131_1

	if var_131_0 then
		var_131_1 = var_131_0.BitmapFilterDvar
	else
		var_131_1 = PRIVATE_MATCH.WarzoneGameTypeSetupTable.DefaultBitmapFilterDvar
	end

	if var_131_1 then
		local var_131_2 = Dvar.CFHDGABACF(var_131_1)

		return BitwiseOperators.band(arg_131_1, var_131_2) > 0
	end

	return false
end

function Lobby.GetModesForCategory(arg_132_0, arg_132_1)
	local var_132_0 = {}

	if arg_132_0 == Lobby.gameModeCategories.MYMODES then
		local var_132_1 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.COUNT)

		if var_132_1 == nil then
			local var_132_2 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.ERROR_CODE) or -1

			if var_132_2 ~= -1 then
				LUI.FlowManager.RequestPopupMenu(self, "CustomModeDataErrorPopup", false, controllerIndex, false, MP.MatchRulesErrorCodeMessage[var_132_2])
			end

			var_132_1 = 0
		end

		if var_132_1 >= 0 then
			for iter_132_0 = 0, var_132_1 - 1 do
				local var_132_3 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_132_0, MP.MatchRulesSaveHeaderLookup.GAMETYPE_RAW)

				if var_132_3 ~= "" then
					local var_132_4 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_132_3, CSV.gameTypesTable.cols.hideInUI) == "1"

					if Lobby.ShouldIncludeGameMode(var_132_3) and (not var_132_4 or CONDITIONS.AreDevFeaturesEnabled()) then
						local var_132_5 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_132_3, CSV.gameTypesTable.cols.image)
						local var_132_6 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_132_3, CSV.gameTypesTable.cols.CDLImage)
						local var_132_7 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_132_0, MP.MatchRulesSaveHeaderLookup.GAMETYPE_FULL))
						local var_132_8 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_132_0, MP.MatchRulesSaveHeaderLookup.NAME)
						local var_132_9 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_132_0, MP.MatchRulesSaveHeaderLookup.DESCRIPTION))
						local var_132_10 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_132_0, MP.MatchRulesSaveHeaderLookup.TIMESTAMP))
						local var_132_11 = {
							ref = var_132_3,
							category = Lobby.gameModeCategories.MYMODES,
							name = var_132_8,
							desc = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_DESCRIPTION", var_132_9, var_132_7, var_132_10),
							image = RegisterMaterial(var_132_5),
							CDLImage = RegisterMaterial(var_132_6)
						}

						var_132_11.isMLGMode = false

						table.insert(var_132_0, var_132_11)
					end
				else
					local var_132_12 = {
						category = Lobby.gameModeCategories.MYMODES,
						name = Engine.CBBHFCGDIC("LUA_MENU/CORRUPTED_MODE"),
						desc = Engine.CBBHFCGDIC("LUA_MENU/ERROR_GETTING_DATA")
					}

					table.insert(var_132_0, var_132_12)
				end
			end
		end
	else
		local var_132_13 = false

		for iter_132_1 = 0, StringTable.BFHCAIIDA(CSV.gameTypesTable.file) - 1 do
			local var_132_14 = CSV.ReadRow(CSV.gameTypesTable, iter_132_1)
			local var_132_15
			local var_132_16 = arg_132_1 and arg_132_1.menu and CONDITIONS.IsWZPrivateMatch(arg_132_1.menu)

			if var_132_16 and var_132_14.wzPrivateFilterBit and #var_132_14.wzPrivateFilterBit > 0 then
				var_132_15 = Lobby.ShouldIncludeWZPrivateMatchGameMode(var_132_14.ref, tonumber(var_132_14.wzPrivateFilterBit)) and (var_132_14.hideInUI ~= "1" or CONDITIONS.AreDevFeaturesEnabled())
			else
				var_132_15 = Lobby.ShouldIncludeGameMode(var_132_14.ref) and (var_132_14.hideInUI ~= "1" or CONDITIONS.AreDevFeaturesEnabled())
			end

			if var_132_15 then
				var_132_14.name = Engine.CBBHFCGDIC(var_132_14.name)
				var_132_14.desc = Engine.CBBHFCGDIC(var_132_14.desc)
				var_132_14.image = RegisterMaterial(var_132_14.image)
				var_132_14.CDLImage = RegisterMaterial(var_132_14.CDLImage)
				var_132_14.csvIndex = iter_132_1
				var_132_14.priority = 0

				if var_132_16 then
					var_132_14.priority = Dvar.CFHDGABACF("lui_" .. var_132_14.ref .. "_private_match_menu_priority") or 0
					var_132_13 = var_132_13 or var_132_14.priority > 0
				end

				if CONDITIONS.IsWeGameGovBanned() then
					if tonumber(var_132_14.wegame) == 1 then
						var_132_14.isMLGMode = false

						table.insert(var_132_0, var_132_14)
					end
				elseif tonumber(var_132_14.MLG) == 1 and arg_132_0 == Lobby.gameModeCategories.CWL then
					var_132_14.isMLGMode = true

					table.insert(var_132_0, var_132_14)
				elseif var_132_14.category == arg_132_0 then
					var_132_14.isMLGMode = false

					table.insert(var_132_0, var_132_14)
				end
			end
		end

		if var_132_13 then
			table.sort(var_132_0, function(arg_133_0, arg_133_1)
				return arg_133_0.priority > arg_133_1.priority or arg_133_0.priority == arg_133_1.priority and arg_133_0.csvIndex < arg_133_1.csvIndex
			end)
		end
	end

	return var_132_0
end

function Lobby.GetAcceptableTeams(arg_134_0, arg_134_1)
	local var_134_0 = {
		Teams.free
	}

	if CONDITIONS.IsTeamBasedGameType() then
		if MP_COMMON.IsMatchRulesTeamAssignmentEnabled() then
			table.insert(var_134_0, Teams.allies)
			table.insert(var_134_0, Teams.axis)
		end

		if CODCASTER.CanCODCast() then
			local var_134_1 = Lobby.GetCurrentGameType()
			local var_134_2 = Lobby.GetModesForCategory(Lobby.gameModeCategories.STANDARD)

			for iter_134_0, iter_134_1 in ipairs(var_134_2) do
				if iter_134_1.ref == var_134_1 then
					if MLG.DBIBHEAEGD() and not Dvar.IBEGCHEFE("lui_cdl_all_roles_enabled") then
						var_134_0 = {
							Teams.spectator
						}
					else
						table.insert(var_134_0, Teams.spectator)
					end

					if Dvar.IBEGCHEFE("LQNKRLQTLM") and not Lobby.DFFFFJHCEH() then
						local var_134_3 = Lobby.GetFirstFollowablePlayerNum(0)

						if CODCASTER.CanFollow() and arg_134_0 == 0 and (arg_134_1 == Teams.follower or var_134_3) then
							table.insert(var_134_0, Teams.follower)
						end
					end

					break
				end
			end
		end
	end

	return var_134_0
end

function Lobby.TryNavigateToLobby(arg_135_0, arg_135_1, arg_135_2)
	if not Engine.CGABICJHAI() or not ShaderUpload.DDBFFCFJJJ() or not ShaderUpload.CEIBACCEAF() or Engine.DIEEIEFCFF() and Dvar.IBEGCHEFE("MRTNMPRLKR") then
		arg_135_0(arg_135_1, arg_135_2)
	else
		LUI.FlowManager.RequestPopupMenu(nil, "CancelShaderUploadDialog", false, nil, false, {
			onCancelUpload = arg_135_0,
			shouldLaunchTutorialWithoutPopup = arg_135_2
		}, nil, true, true)
	end
end

function Lobby.SplitScreenChecksPassed(arg_136_0, arg_136_1, arg_136_2)
	local function var_136_0()
		if Engine.JEDFGECDJ() > 1 then
			arg_136_1 = Lobby.KickSplitScreenPlayerAndGetActiveController(arg_136_1)
		end

		if Engine.BJIBIJHDFJ() then
			LUI.FlowManager.RequestPopupMenu(arg_136_0, "OpeningMenuWithSplitscreenPartyMemberWarning", true, arg_136_1, false)
		else
			arg_136_2()
		end
	end

	if Engine.JEDFGECDJ() > 1 then
		LUI.FlowManager.RequestPopupMenu(arg_136_0, "OpeningMenuWithSplitscreenWarning", true, arg_136_1, false, {
			yesAction = var_136_0
		})

		return false
	else
		LUI.FlowManager.RequestPopupMenu(arg_136_0, "OpeningMenuWithSplitscreenPartyMemberWarning", true, arg_136_1, false)

		return false
	end

	return true
end

local function var_0_0()
	local var_138_0 = Engine.IJEBHJIJF()
	local var_138_1 = false

	if Lobby.IsSplitScreenEnabled() then
		var_138_1 = Engine.BGDHBAFGCG()

		if var_138_1 then
			local var_138_2 = Engine.IJEBHJIJF()

			Engine.CDGCBCBAJ("Kicked splitscreen player", var_138_2)
		end
	end

	return var_138_1
end

function Lobby.KickSplitScreenPlayerAndGetActiveController(arg_139_0)
	local var_139_0 = Lobby.IsSplitScreenEnabled()
	local var_139_1 = -1
	local var_139_2 = false

	if var_139_0 then
		var_139_1 = Engine.CAGFAECIIG(1)
		var_139_2 = var_0_0()
	end

	local var_139_3 = Engine.IJEBHJIJF()

	if var_139_0 and var_139_2 and arg_139_0 == var_139_1 then
		Engine.DAGFFDGFII("xstartprivateparty")
		LUI.FlowManager.RequestPopupMenu(self, "RemoveSelfSplitscreenPlayerPopup", false, var_139_3, false, nil, nil, nil, true)

		return -1
	end

	return var_139_3
end

function Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_140_0, arg_140_1)
	local var_140_0 = Lobby.IsSplitScreenEnabled()
	local var_140_1 = Engine.IJEBHJIJF()

	if var_140_0 then
		var_140_1 = Lobby.KickSplitScreenPlayerAndGetActiveController(arg_140_0)
	end

	local var_140_2 = "xstopprivateparty" .. " " .. (arg_140_1 and "1" or "0") .. " " .. "1"

	Engine.DAGFFDGFII(var_140_2)
	Engine.DEIBHJAFDG()
	Engine.DAGFFDGFII("xstartprivateparty")

	return var_140_1
end

function Lobby.UpdatePreloadStreamer(arg_141_0)
	local var_141_0 = string.lower(Lobby.GetCurrentGameType())
	local var_141_1 = CONDITIONS.IsThirdGameMode() and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "" and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "none" and Dvar.DHEEJCCJBH("PTNOLQOOP") or Dvar.DHEEJCCJBH("NSQLTTMRMP")
	local var_141_2 = {
		0,
		0,
		20000
	}

	if var_141_0 == "brtdm" then
		local var_141_3 = Dvar.GDDCIAIIG("scr_brtdm_circle_center")

		if var_141_3 ~= nil then
			var_141_2 = var_141_3
		else
			var_141_2 = {
				0,
				0,
				20000
			}
		end
	elseif var_141_1 == "mp_quarry2" then
		var_141_2 = {
			28912,
			41612,
			2500
		}
	elseif var_141_1 == "mp_farms2_gw" then
		var_141_2 = {
			48031,
			-13331,
			2500
		}
	elseif var_141_1 == "mp_port2_gw" then
		var_141_2 = {
			34946,
			-26957,
			2500
		}
	elseif var_141_1 == "mp_downtown_gw" then
		var_141_2 = {
			22818,
			-33766,
			2500
		}
	elseif var_141_1 == "mp_layover_gw" then
		var_141_2 = {
			-24579,
			23071,
			2500
		}
	elseif var_141_1 == "mp_boneyard_gw" then
		var_141_2 = {
			-27276,
			-13058,
			2500
		}
	elseif var_141_1 == "cp_arms_dealer" then
		var_141_2 = {
			-18361,
			1476,
			-90
		}
	elseif var_141_1 == "cp_armsdealer_2" then
		var_141_2 = {
			-18889,
			8375,
			-214
		}
	elseif var_141_1 == "cp_landlord" then
		var_141_2 = {
			-16359,
			-4457,
			1674
		}
	elseif var_141_1 == "cp_landlord_2" then
		var_141_2 = {
			4144,
			61394,
			825
		}
	elseif var_141_1 == "cp_dwn_twn_2" then
		var_141_2 = {
			19472,
			-21569,
			42
		}
	elseif var_141_1 == "hvt_launderer_2" then
		var_141_2 = {
			30019,
			-7362,
			-358
		}
	elseif var_141_1 == "cp_smuggler" then
		var_141_2 = {
			-3864,
			33463,
			264
		}
	elseif var_141_1 == "mp_br_quarry" then
		var_141_2 = {
			28241,
			31030,
			20000
		}
	elseif string.match(var_141_1, "^mp_donetsk[0-9]*") or string.match(var_141_1, "^mp_don[0-9]+") or string.match(var_141_1, "^mp_kstenod[0-9]*") then
		var_141_2 = {
			0,
			0,
			20000
		}
	end

	Engine.BCHFJIJGJD(var_141_2)
end

function Lobby.GetDefaultMapForGameType(arg_142_0)
	return StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_142_0, CSV.gameTypesTable.cols.defaultMap)
end

function Lobby.AttemptOpenBRMenu(arg_143_0, arg_143_1)
	local function var_143_0()
		Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
		Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	end

	local function var_143_1()
		if not CONDITIONS.ArePartiesEnabledInMainMenu() then
			Dvar.DHEGHJJJHI("splitscreen", false)
			Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
		end

		var_143_0()
	end

	local function var_143_2(arg_146_0)
		assert(arg_146_0)
		Engine.CDGCBCBAJ("Pressed a Main Menu button", arg_146_0)
	end

	local function var_143_3(arg_147_0)
		local var_147_0 = Engine.IJEBHJIJF()

		var_143_1()

		if not CONDITIONS.ArePartiesEnabledInMainMenu() then
			var_143_2(var_147_0)
		end

		if not (Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(self, var_147_0) or Onboarding.WARZONE_INTRODUCTION.WasCompleted(self, var_147_0)) then
			local var_147_1 = {
				isMainMenu = false,
				brMainMenuOptions = arg_147_0
			}

			LUI.FlowManager.RequestPopupMenu(nil, "LobbyWarzoneIntroPopup", true, var_147_0, false, var_147_1)
		else
			LUI.FlowManager.RequestAddMenu("BRMainMenu", false, var_147_0, false, arg_147_0)
		end
	end

	if arg_143_1.useStandaloneStore then
		if not Engine.DBAEJAHFGJ(arg_143_0) then
			LUI.FlowManager.RequestAddMenu("BRMainMenuStore", true, arg_143_0, false, arg_143_1)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_143_0, false)
		end
	else
		local var_143_4 = Engine.CGEFDFCIJA()
		local var_143_5 = Engine.CBCEBADAJ(CoD.PlayMode.Core)

		if Dvar.IBEGCHEFE("NPNQOLKSLP") == true then
			local var_143_6 = {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
			}

			LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_143_6, nil, false, true)

			return
		end

		if var_143_5 < var_143_4 then
			LUI.FlowManager.RequestPopupMenu(self, "OpeningMenuWithHighPrivatePartyMemberCountWarning", true, arg_143_0, false, {
				currentCount = var_143_4,
				maxCount = var_143_5
			})
		else
			var_143_3(arg_143_1)
		end
	end
end

function Lobby.AttemptOpenBRTutorial(arg_148_0, arg_148_1, arg_148_2, arg_148_3)
	local var_148_0 = false

	local function var_148_1(arg_149_0, arg_149_1)
		if arg_149_1 then
			Lobby.StartBRTutorial(arg_149_0, arg_148_1)
		else
			LUI.FlowManager.RequestAddMenu("LobbyWarzoneTutorial", true, arg_149_0, false, {
				forceLoad = arg_148_2,
				tutorialType = arg_148_1
			}, true)
		end
	end

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() then
		if Engine.JEDFGECDJ() > 1 then
			var_148_0 = true

			LUI.FlowManager.RequestPopupMenu(self, "OpeningMenuWithSplitscreenWarning", true, arg_148_0, false, {
				yesAction = function()
					local var_150_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_148_0, true)

					if var_150_0 >= 0 then
						Lobby.TryNavigateToLobby(var_148_1, var_150_0)
					end
				end
			})
		elseif Lobby.IsNotAloneInPrivateParty() then
			var_148_0 = true

			LUI.FlowManager.RequestPopupMenu(self, "ConfirmShouldBreakupPrivateParty", true, arg_148_0, false, {
				yesAction = function()
					Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_148_0)
					Lobby.TryNavigateToLobby(var_148_1, arg_148_0)
				end
			})
		end
	end

	if not var_148_0 then
		Lobby.TryNavigateToLobby(var_148_1, arg_148_0, arg_148_3)
	end
end

function Lobby.UpdateFillStatus(arg_152_0, arg_152_1)
	local var_152_0 = DataSources.frontEnd.lobby.battleRoyale.fillType:GetValue(arg_152_0)
	local var_152_1 = Lobby.CJHICGEEFD()

	if var_152_0 == nil then
		var_152_0 = var_152_1

		DataSources.frontEnd.lobby.battleRoyale.fillType:SetValue(arg_152_0, var_152_0)
	end

	if var_152_0 ~= var_152_1 then
		Lobby.DAFCJHFFAF(arg_152_0, var_152_0)
	end

	arg_152_1:SetCurrentValue(var_152_0 and Lobby.FillToggleOptions.FILL or Lobby.FillToggleOptions.DONT_FILL)
end

function Lobby.ToggleFill(arg_153_0, arg_153_1, arg_153_2)
	local var_153_0 = DataSources.frontEnd.lobby.battleRoyale.fillType:GetValue(arg_153_0)
	local var_153_1 = arg_153_2 == 1

	if var_153_0 ~= nil and (var_153_0 and not var_153_1 or not var_153_0 and var_153_1) then
		local var_153_2 = not var_153_0

		DataSources.frontEnd.lobby.battleRoyale.fillType:SetValue(arg_153_0, var_153_2)
		Lobby.UpdateFillStatus(arg_153_0, arg_153_1)
	end
end

function Lobby.ForceEnableFill(arg_154_0, arg_154_1)
	if not DataSources.frontEnd.lobby.battleRoyale.fillType:GetValue(arg_154_1) then
		local var_154_0 = {
			displayTime = 2000,
			iconScale = -0.3,
			icon = "hud_info_alert",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/SQUAD_FILL_ENABLED"),
			controllerIndex = arg_154_1
		}

		arg_154_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_154_0
		})
		DataSources.frontEnd.lobby.battleRoyale.fillType:SetValue(arg_154_1, true)
		Lobby.DAFCJHFFAF(arg_154_1, true)
	end
end

function Lobby.CreateFillToggleButton(arg_155_0, arg_155_1)
	local var_155_0 = MenuBuilder.BuildRegisteredType("GenericCycleList", {
		wzTheme = true,
		shouldOffsetLockPosition = true,
		controllerIndex = arg_155_1
	})

	var_155_0.id = "FillToggleButton" .. arg_155_0.id

	var_155_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 52, _1080p * 106)
	var_155_0.GenericOptionButtonBase.Title:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_FILL"))
	var_155_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/FILL"))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(var_155_0, "LongerTitleAR")
	else
		ACTIONS.AnimateSequence(var_155_0, "LongerTitle")
	end

	var_155_0:UpdatePip(1, 2)

	local var_155_1 = {
		wrapAround = true,
		defaultValue = 1,
		labels = {
			Engine.CBBHFCGDIC("LUA_MENU/FILL"),
			Engine.CBBHFCGDIC("LUA_MENU/DONT_FILL")
		},
		action = function(arg_156_0)
			Lobby.ToggleFill(arg_155_1, var_155_0, arg_156_0)
		end
	}

	LUI.AddUIArrowTextButtonLogic(var_155_0, arg_155_1, var_155_1)

	local var_155_2 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	var_155_0:SetButtonDisabled(var_155_2)
	Lobby.UpdateFillStatus(arg_155_1, var_155_0)

	return var_155_0
end

function Lobby.CreateLookForPartyButton(arg_157_0, arg_157_1)
	local var_157_0
	local var_157_1 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = arg_157_1
	})

	var_157_1.id = "LookForPartyButton" .. arg_157_0.id

	var_157_1.Text:SetLeft(_1080p * 20, 0)
	var_157_1.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/LOOK_FOR_PARTY")), 0)
	var_157_1.Text:SetAlignment(LUI.Alignment.Left)
	var_157_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 52, _1080p * 106)

	return var_157_1
end

function Lobby.StartPrivateMatchDS(arg_158_0)
	DebugPrint("LUA: StartPrivateMatchDS is called. \n")

	if CONDITIONS.IsArenaGameType() then
		local var_158_0 = Engine.CGEFDFCIJA()
		local var_158_1 = Lobby.MaxPlayerLimitForGunfight

		if var_158_1 < var_158_0 then
			DebugPrint("LUA: StartPrivateMatchDS is called. Popup menu EnteringGameModeWithHighPrivatePartyMemberCountWarning is called. \n")
			LUI.FlowManager.RequestPopupMenu(self, "EnteringGameModeWithHighPrivatePartyMemberCountWarning", true, event.controller, false, {
				currentCount = var_158_0,
				maxCount = var_158_1
			})
		end
	end

	if Lobby.DoesCurrentGameTypeSupportCrossplay() or not Engine.BEAJHICIEF() then
		DebugPrint("LUA: StartPrivateMatchDS is called. StartPrivateDS is called. \n")
		Lobby.FHHCDABDD(arg_158_0)
	end
end

function Lobby.GetTotalNumBots()
	return Lobby.BEAJCIDDGF(Lobby.BotTeams.Friendly) + Lobby.BEAJCIDDGF(Lobby.BotTeams.Enemy)
end

function Lobby.DoAllOtherPartyMembersHaveMapPack(arg_160_0)
	local var_160_0 = Engine.CGEFDFCIJA()

	if var_160_0 > 1 then
		for iter_160_0 = 0, var_160_0 - 1 do
			if not Engine.FHEGBGHEC(iter_160_0, arg_160_0) then
				return false
			end
		end
	end

	return true
end

function Lobby.ActivateBRTutorialInit(arg_161_0)
	local var_161_0 = Lobby.BRTutorialLobbyData[arg_161_0]

	assert(var_161_0)

	if var_161_0 == nil then
		var_161_0 = {
			mapName = "mp_bm_tut"
		}
	end

	Dvar.DFIJDJFIFD("OOTQKOTRM", 24)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", true)
	Dvar.BDEHAEGHAF("NSQLTTMRMP", var_161_0.mapName)
	Dvar.BDEHAEGHAF("OKPMLLKRP", var_161_0.mapName)
	Dvar.BDEHAEGHAF("NSMSQOMSLO", "")
end

function Lobby.DeactivateBRTutorialInit()
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", false)
	MatchRules.BCECADEHDA("war")
end

function Lobby.StartBRTutorial(arg_163_0, arg_163_1)
	local var_163_0 = Lobby.BRTutorialLobbyData[arg_163_1]

	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_163_0)
	Lobby.EAHFJBBBBD(PartyUIRoot.BATTLE_ROYALE_MENU)
	MatchRules.BCECADEHDA()

	if var_163_0.cfgFile then
		Engine.DAGFFDGFII("exec " .. var_163_0.cfgFile)
	end

	local function var_163_1(arg_164_0)
		if arg_164_0 then
			for iter_164_0, iter_164_1 in ipairs(arg_164_0) do
				MatchRules.CIGFFEAEFD(unpack(iter_164_1))
			end
		end
	end

	var_163_1(Lobby.BRTutorialMatchRules)
	var_163_1(var_163_0.extraMatchRules)
	Dvar.DHEGHJJJHI("NNPMRQSQN", false)
	Engine.DAGFFDGFII("xpartygo 1")
end
