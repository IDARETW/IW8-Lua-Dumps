MP = MP or {}
MP.SplitScreenRotModifier = CONDITIONS.IsSplitscreen() and 0 or 1
MP.LOBBY_PLAYER_COUNT = {
	small = 12,
	medium = 24
}
MP.CTFFlagStatus = {
	Home = -2,
	Away = -1
}
MP.PLAYLIST_FILTER_MODE = {
	hardcore = 1,
	CDLRules = 2,
	normal = 0
}
MP.DRIVER_SEAT_NUM = 0
MP.GAME_TYPE_MODIFIERS = {
	tactical = 3,
	hardcore = 2,
	cdl = 4,
	normal = 1
}
MP.DefaultFactions = {
	[Teams.free] = "FREE",
	[Teams.team1] = "RUSF",
	[Teams.team2] = "USMC",
	[Teams.team3] = "SABF",
	[Teams.team4] = "SAS",
	[Teams.team5] = "FIVE",
	[Teams.team6] = "SIX"
}
MP.TournamentParticipationStatus = {
	ACTIVE = 1,
	VICTORIOUS = 3,
	ELIMINATED = 2,
	NOT_PARTICIPATING = 0
}
MP.MatchRulesSaveHeaderLookup = {
	GAMETYPE_RAW = 1,
	NAME = 3,
	ERROR_CODE = 6,
	DESCRIPTION = 4,
	COUNT = 5,
	INVALID = 7,
	GAMETYPE_FULL = 2,
	TIMESTAMP = 0
}
MP.MatchRulesErrorCodeMessage = {
	[-1] = {
		message = "MENU/CUSTOM_MODE_DATA_ERROR_MESSAGE",
		title = "MENU/ERROR"
	},
	[-2] = {
		message = "MENU/CUSTOM_MODE_DATA_INVALID_SAVE_MESSAGE",
		title = "MENU/SELECT_SAVE_DEVICE"
	},
	[-3] = {
		message = "MENU/CUSTOM_MODE_DATA_CORRUPT_MESSAGE",
		title = "MENU/CORRUPT_SAVEDATA_TITLE"
	}
}
MP.MatchRulesSaveLocation = {
	COUNT = 2,
	PLAYERHISTORY = 1,
	PLAYERSAVED = 0
}
MP.Vehicles = {
	HOOPTYTRUCK = 12,
	HOOPTY = 9,
	PICKUP = 7,
	DRIVERHUD = 0,
	BRADLEY = 1,
	MEDTRANSPORT = 11,
	ATV = 4,
	CARGOTRUCK = 8,
	LGTRANSPORT = 5,
	COPCAR = 6,
	VAN = 13,
	APC = 14,
	TACROVER = 3,
	JEEP = 10,
	APCRUS = 15,
	LITTLEBIRD = 2
}
MP.BRTeamMaxSize = 4

function MP.BRIsSquadMemberEliminated(arg_1_0, arg_1_1)
	local var_1_0 = DataSources.inGame.player.BRData.mySquadEliminatedFlags:GetValue(arg_1_0)
	local var_1_1 = BitwiseOperators.rshift(var_1_0, arg_1_1 - 1)

	return BitwiseOperators.band(var_1_1, 1) > 0
end

function MP.BRGetDecodedMatchStats(arg_2_0)
	local var_2_0 = DataSources.inGame.player.BRData.matchStats:GetValue(arg_2_0)
	local var_2_1 = 8
	local var_2_2 = MP.ExtractBitsFromBitPositionInValue(var_2_0, var_2_1, 1)
	local var_2_3 = MP.ExtractBitsFromBitPositionInValue(var_2_0, var_2_1, var_2_1 + 1)

	return var_2_2, var_2_3
end

function MP.ExtractBitsFromBitPositionInValue(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = BitwiseOperators.lshift(1, arg_3_1) - 1
	local var_3_1 = BitwiseOperators.rshift(arg_3_0, arg_3_2 - 1)

	return (BitwiseOperators.band(var_3_0, var_3_1))
end

function MP.GetTeamName(arg_4_0)
	assert(arg_4_0)

	if arg_4_0 == Teams.allies then
		return Engine.CBBHFCGDIC("LUA_MENU/THE_WEST")
	else
		return Engine.CBBHFCGDIC("LUA_MENU/THE_EAST")
	end
end

function MP.GetTeamLogo(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_0 == arg_5_1 and CSV.FactionTable.cols.iconSuperFactionFriendlySmall or CSV.FactionTable.cols.iconSuperFactionEnemySmall

	if arg_5_3 then
		var_5_0 = arg_5_0 == arg_5_1 and CSV.FactionTable.cols.iconSuperFactionFriendlyLarge or CSV.FactionTable.cols.iconSuperFactionEnemyLarge
	end

	local var_5_1 = StringTable.DIFCHIGDFB(CSV.FactionTable.file, CSV.FactionTable.cols.ref, arg_5_2, var_5_0)

	assert(#var_5_1 > 0)

	return var_5_1
end

function MP.GetFactionReference(arg_6_0)
	local var_6_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
	local var_6_1 = "team" .. tostring(arg_6_0) .. "Faction"
	local var_6_2 = CSV.mpMapTable.cols[var_6_1]
	local var_6_3

	if not var_6_2 then
		var_6_3 = MP.DefaultFactions[Teams.allies]
	else
		var_6_3 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_6_0, var_6_2)

		if not var_6_3 or #var_6_3 == 0 then
			var_6_3 = MP.DefaultFactions[arg_6_0]
		end
	end

	return var_6_3
end

function MP.IsCurrentMapBigMap()
	local var_7_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
	local var_7_1 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_7_0, CSV.mpMapTable.cols.bigMapMinimap)

	return tonumber(var_7_1) == 1
end

function MP.GetTeamInfo(arg_8_0, arg_8_1)
	local var_8_0 = {}

	if not arg_8_1 then
		if not Engine.DDJFBBJAIG() and not Engine.CHJEEHIFIC() then
			arg_8_1 = Game.DHEDEIHGF()
		else
			arg_8_1 = Teams.axis
		end
	end

	local var_8_1 = MP.GetFactionReference(arg_8_0)
	local var_8_2 = StringTable.DIFCHIGDFB(CSV.FactionTable.file, CSV.FactionTable.cols.ref, var_8_1, CSV.FactionTable.cols.superFactionName)
	local var_8_3 = MP.GetTeamLogo(arg_8_0, arg_8_1, var_8_1, false)
	local var_8_4 = MP.GetTeamLogo(arg_8_0, arg_8_1, var_8_1, true)
	local var_8_5 = StringTable.DIFCHIGDFB(CSV.FactionTable.file, CSV.FactionTable.cols.ref, var_8_1, CSV.FactionTable.cols.color)
	local var_8_6

	var_8_0.name, var_8_6 = Engine.CBBHFCGDIC(var_8_2), COLORS[var_8_5]
	var_8_0.logo = var_8_3
	var_8_0.largeLogo = var_8_4
	var_8_0.color = var_8_6
	var_8_0.watermark = "icon_faction_watermark_"

	return var_8_0
end

function MP.GetMapName(arg_9_0)
	local var_9_0 = ""
	local var_9_1 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_9_0, CSV.mpMapTable.cols.name)

	if var_9_1 and #var_9_1 > 0 then
		var_9_0 = Engine.CBBHFCGDIC(var_9_1)
	end

	return var_9_0
end

function MP.GetMapImage(arg_10_0, arg_10_1)
	local var_10_0 = "loading_mp_generic_bg"
	local var_10_1 = arg_10_1 and CSV.mpMapTable.cols.cpMissionName or CSV.mpMapTable.cols.ref
	local var_10_2 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, var_10_1, arg_10_0, CSV.mpMapTable.cols.loadingImage)

	if var_10_2 and #var_10_2 > 0 then
		var_10_0 = var_10_2
	end

	return var_10_0
end

function MP.GetGameTypeImage(arg_11_0)
	local var_11_0 = "icon_mp_mode_tdm"
	local var_11_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_11_0, CSV.gameTypesTable.cols.image)

	if var_11_1 and #var_11_1 > 0 then
		var_11_0 = var_11_1
	end

	return var_11_0
end

function MP.GetMapIsNight(arg_12_0)
	local var_12_0 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_12_0, CSV.mpMapTable.cols.isNightMap)

	return #var_12_0 > 0 and var_12_0 == "1"
end

MP.GameMode = {
	RugbyGameType = "rugby",
	HVTGameType = "hvt",
	HQGameType = "hq",
	BRGameType = "br",
	ConfGameType = "conf",
	FrontGameType = "front",
	BallGameType = "ball",
	CMDGameType = "cmd",
	InfectGameType = "infect",
	SiegeGameType = "siege",
	DefconGameType = "defcon",
	BRTDMGameType = "brtdm",
	TrialGameType = "trial",
	PlunderGameType = "dmz",
	RushGameType = "rush",
	GunGameType = "gun",
	AliensGameType = "aliens",
	DemoGameType = "dd",
	HardpointGameType = "koth",
	TDMGameType = "war",
	ArenaGameType = "arena",
	GrndGameType = "grnd",
	SDGameType = "sd",
	TJuggGameType = "tjugg",
	OICGameType = "oic",
	PayloadGameType = "payload",
	ArmsRaceGameType = "arm",
	TDefGameType = "tdef",
	VIPGameType = "vip",
	FFAGameType = "dm",
	MPZombiesGameType = "mp_zomb",
	BlitzGameType = "blitz",
	CyberGameType = "cyber",
	BTMGameType = "btm",
	CTFGameType = "ctf",
	SRGameType = "sr",
	DomGameType = "dom",
	GrindGameType = "grind"
}
MP.RoundEndTitleStrings = {
	"MP/DRAW",
	"MP/ROUND_DRAW",
	"MP/ROUND_WIN",
	"MP/ROUND_LOSS",
	"MP/VICTORY",
	"MP/DEFEAT",
	"MP/HALFTIME",
	"MP/OVERTIME",
	"MP/ROUNDEND",
	"MP/INTERMISSION",
	"MP/SWITCHING_SIDES",
	"MP/MATCH_BONUS_IS",
	"MP/MATCH_TIE",
	"CODCASTER/END_RESULT_WIN",
	"MP/FINAL_ROUND",
	"MP/MATCH_POINT"
}
MP.RoundEndTitleTypes = {
	ROUNDEND = 9,
	HALFTIME = 7,
	MATCH_TIE = 13,
	ROUND_LOSS = 4,
	MATCH_BONUS_IS = 12,
	DEFEAT = 6,
	INTERMISSION = 10,
	OVERTIME = 8,
	ROUND_WIN = 3,
	ROUND_DRAW = 2,
	SWITCHING_SIDES = 11,
	SPECTATOR = 14,
	MATCH_POINT = 16,
	FINAL_ROUND = 15,
	DRAW = 1,
	VICTORY = 5
}
MP.RoundEndReasonStrings = {
	"MP/SCORE_LIMIT_REACHED",
	"MP/TIME_LIMIT_REACHED",
	"MP/PLAYERS_FORFEITED",
	"MP/TARGET_DESTROYED",
	"MP/BOMB_DEFUSED",
	"MP/FACTION_ONE_ELIMINATED",
	"MP/FACTION_TWO_ELIMINATED",
	"MP/FACTION_THREE_ELIMINATED",
	"MP/FACTION_FOUR_ELIMINATED",
	"MP/FACTION_FIVE_ELIMINATED",
	"MP/FACTION_SIX_ELIMINATED",
	"MP/FACTION_ONE_FORFEITED",
	"MP/FACTION_TWO_FORFEITED",
	"MP/FACTION_THREE_FORFEITED",
	"MP/FACTION_FOUR_FORFEITED",
	"MP/FACTION_FIVE_FORFEITED",
	"MP/FACTION_SIX_FORFEITED",
	"MP/ENEMIES_ELIMINATED",
	"MP/MATCH_TIE",
	"GAME/OBJECTIVECOMPLETED",
	"GAME/OBJECTIVEFAILED",
	"MP/SWITCHING_SIDES",
	"MP/ROUND_LIMIT_REACHED",
	"MP/ENDED_GAME",
	"MP/HOST_ENDED_GAME",
	"LUA_MENU_MP/LOSS_STAT_PREVENTED",
	"MP/TIME_TO_BEAT_CTF_WIN",
	"MP/TIME_TO_BEAT_CTF_LOSS",
	"MP/TIME_TO_BEAT_UPLINK_WIN",
	"MP/TIME_TO_BEAT_UPLINK_LOSS",
	"MP/NUKE_END",
	"MP/FACTION_ENEMIES_FORFEITED",
	"MP/ARENA_TIME_HEALTH_WIN",
	"MP/ARENA_TIME_HEALTH_LOSS",
	"MP/ARENA_TIME_LIVES_WIN",
	"MP/ARENA_TIME_LIVES_LOSS",
	"MP/ARENA_OVERTIME_WIN",
	"MP/ARENA_OVERTIME_LOSS",
	"MP/OUTPOST_DEFENDED",
	"MP/PRACTICE_ROUND_OVER",
	"MP/BR_ELIMINATED",
	"MP/CYBER_TIE",
	"MP/MERCY_WIN",
	"MP/MERCY_LOSS",
	"SPLASHES/BLANK",
	"CODCASTER/TIME_TO_BEAT_CTF_ENDED_GAME",
	"CODCASTER/TIME_TO_BEAT_UPLINK_ENDED_GAME",
	"CODCASTER/ARENA_TIME_LIVES_ENDED_GAME",
	"CODCASTER/ARENA_TIME_HEALTH_ENDED_GAME",
	"CODCASTER/FACTION_ELIMINATED",
	"CODCASTER/FACTION_FORFEITED",
	"MP/SIEGE_ALL_FLAGS_WIN",
	"MP/SIEGE_ALL_FLAGS_LOSS",
	"MP/SIEGE_TIME_FLAG_WIN",
	"MP/SIEGE_TIME_FLAG_LOSS",
	"MP/ARENA_TOURNAMENT_TIE_WIN",
	"MP/ARENA_TOURNAMENT_TIE_LOSS",
	"MP/DMZ_PLUNDER_LOSS",
	"MP/DMZ_PLUNDER_WIN",
	"MP/ENEMY_FORFEIT",
	"MP/SURVIVORS_ELMIMINATED"
}
MP.RoundEndReasons = {
	SWITCHING_SIDES = 22,
	FACTION_TWO_FORFEITED = 13,
	DMZ_PLUNDER_WIN = 59,
	ENDED_GAME = 24,
	ENEMY_FORFEIT = 60,
	FACTION_THREE_ELIMINATED = 8,
	CYBER_TIE = 42,
	FACTION_ONE_FORFEITED = 12,
	TIME_TO_BEAT_UPLINK_LOSS = 30,
	OBJECTIVE_COMPLETED = 20,
	MERCY_WIN = 43,
	ARENA_TIME_LIVES_LOSS = 36,
	ENEMIES_ELIMINATED = 18,
	SCORE_LIMIT_REACHED = 1,
	CODCASTER_TIME_LIVES_ENDED_GAME = 48,
	FACTION_SIX_ELIMINATED = 11,
	TIME_TO_BEAT_CTF_LOSS = 28,
	HOST_ENDED_GAME = 25,
	FACTION_FOUR_ELIMINATED = 9,
	OUTPOST_DEFENDED = 39,
	ARENA_TIME_HEALTH_WIN = 33,
	PRACTICE_ROUND_OVER = 40,
	FACTION_TWO_ELIMINATED = 7,
	ARENA_TIME_HEALTH_LOSS = 34,
	NUKE_END = 31,
	CODCASTER_ELIMINATED_TEAM = 50,
	CODCASTER_FORFEITED_TEAM = 51,
	TIME_TO_BEAT_CTF_WIN = 27,
	MERCY_LOSS = 44,
	BLANK = 45,
	ENEMIES_FORFEITED = 32,
	FACTION_FIVE_ELIMINATED = 10,
	CODCASTER_BEAT_UPLINK_ENDED_GAME = 47,
	ARENA_OVERTIME_LOSS = 38,
	MATCH_TIE = 19,
	CODCASTER_TIME_HEALTH_ENDED_GAME = 49,
	TARGET_DESTROYED = 4,
	BOMB_DEFUSED = 5,
	PLAYERS_FORFEITED = 3,
	BR_ELIMINATED = 41,
	FACTION_THREE_FORFEITED = 14,
	ARENA_TIME_LIVES_WIN = 35,
	SURVIVORS_ELMIMINATED = 61,
	SIEGE_ALL_FLAGS_LOSS = 53,
	SIEGE_TIME_FLAG_WIN = 54,
	CODCASTER_BEAT_CTF_ENDED_GAME = 46,
	OBJECTIVE_FAILED = 21,
	ARENA_TOURNAMENT_TIE_WIN = 56,
	SIEGE_TIME_FLAG_LOSS = 55,
	ARENA_TOURNAMENT_TIE_LOSS = 57,
	FACTION_FIVE_FORFEITED = 16,
	LOSS_STAT_PREVENTED = 26,
	FACTION_FOUR_FORFEITED = 15,
	ROUND_LIMIT_REACHED = 23,
	FACTION_ONE_ELIMINATED = 6,
	ARENA_OVERTIME_WIN = 37,
	SIEGE_ALL_FLAGS_WIN = 52,
	TIME_LIMIT_REACHED = 2,
	TIME_TO_BEAT_UPLINK_WIN = 29,
	FACTION_SIX_FORFEITED = 17,
	DMZ_PLUNDER_LOSS = 58
}
MP.RoundEndExtraMessageStrings = {
	"MP/INTERMISSION",
	"MP/SWITCHING_SIDES",
	"MP/MATCH_POINT"
}

function MP.IsVictory(arg_13_0)
	return arg_13_0 == "MP/ROUND_WIN" or arg_13_0 == "MP/VICTORY"
end

function MP.IsDefeat(arg_14_0)
	return arg_14_0 == "MP/ROUND_LOSS" or arg_14_0 == "MP/DEFEAT"
end

function MP.IsStrategicInfilGameType(arg_15_0)
	return arg_15_0 == MP.GameMode.IsStrategicInfilGameType
end

function MP.IsBRGameType(arg_16_0)
	return arg_16_0 == MP.GameMode.BRGameType
end

function MP.IsLimitedHealthGameType(arg_17_0)
	return arg_17_0 == MP.GameMode.IsLimitedHealthGameType
end

function MP.IsArmsRaceGameType(arg_18_0)
	return arg_18_0 == MP.GameMode.ArmsRaceGameType
end

function MP.IsDefconGameType(arg_19_0)
	return arg_19_0 == MP.GameMode.DefconGameType
end

function MP.IsTimeLimitGameType(arg_20_0)
	return arg_20_0 == MP.GameMode.FFAGameType or arg_20_0 == MP.GameMode.TDMGameType or arg_20_0 == MP.GameMode.HVTGameType or arg_20_0 == MP.GameMode.ConfGameType or arg_20_0 == MP.GameMode.AliensGameType or arg_20_0 == MP.GameMode.GrindGameType or arg_20_0 == MP.GameMode.GunGameType or arg_20_0 == MP.GameMode.GrndGameType or arg_20_0 == MP.GameMode.HardpointGameType or arg_20_0 == MP.GameMode.MPZombiesGameType or arg_20_0 == MP.GameMode.TDefGameType or arg_20_0 == MP.GameMode.InfectGameType or arg_20_0 == MP.GameMode.BRGameType or arg_20_0 == MP.GameMode.CMDGameType or arg_20_0 == MP.GameMode.RushGameType or arg_20_0 == MP.GameMode.EscapeGameType or arg_20_0 == MP.GameMode.BTMGameType or arg_20_0 == MP.GameMode.RugbyGameType or arg_20_0 == MP.GameMode.TJuggGameType or arg_20_0 == MP.GameMode.ArmsRaceGameType or arg_20_0 == MP.GameMode.HQGameType or arg_20_0 == MP.GameMode.OICGameType
end

function MP.IsShortTimeLimitGameType(arg_21_0)
	return arg_21_0 == MP.GameMode.ArenaGameType
end

function MP.IsHighRoundTimeLimitGameType(arg_22_0)
	return arg_22_0 == MP.GameMode.SDGameType or arg_22_0 == MP.GameMode.SRGameType or arg_22_0 == MP.GameMode.SiegeGameType or arg_22_0 == MP.GameMode.CyberGameType
end

function MP.IsLowRoundTimeLimitGameType(arg_23_0)
	return arg_23_0 == MP.GameMode.BallGameType or arg_23_0 == MP.GameMode.DomGameType or arg_23_0 == MP.GameMode.CTFGameType or arg_23_0 == MP.GameMode.BlitzGameType or arg_23_0 == MP.GameMode.FrontGameType or arg_23_0 == MP.GameMode.PayloadGameType or arg_23_0 == MP.GameMode.VIPGameType or arg_23_0 == MP.GameMode.DemoGameType
end

function MP.IsExfilSupportedGameType(arg_24_0)
	return arg_24_0 == MP.GameMode.TDMGameType or arg_24_0 == MP.GameMode.DomGameType or arg_24_0 == MP.GameMode.ConfGameType or arg_24_0 == MP.GameMode.CyberGameType or arg_24_0 == MP.GameMode.SDGameType or arg_24_0 == MP.GameMode.CMDGameType or arg_24_0 == MP.GameMode.VIPGameType or arg_24_0 == MP.GameMode.ArmsRaceGameType
end

function MP.IsRoundBasedGameType(arg_25_0)
	return arg_25_0 == MP.GameMode.SRGameType or arg_25_0 == MP.GameMode.DomGameType or arg_25_0 == MP.GameMode.BallGameType or arg_25_0 == MP.GameMode.CyberGameType or arg_25_0 == MP.GameMode.SDGameType or arg_25_0 == MP.GameMode.SiegeGameType or arg_25_0 == MP.GameMode.CTFGameType or arg_25_0 == MP.GameMode.DemoGameType or arg_25_0 == MP.GameMode.ArenaGameType or arg_25_0 == MP.GameMode.CyberGameType or arg_25_0 == MP.GameMode.RushGameType or arg_25_0 == MP.GameMode.RugbyGameType or arg_25_0 == MP.GameMode.BlitzGameType
end

function MP.IsPointsPerKillGameType(arg_26_0)
	return arg_26_0 == MP.GameMode.TDMGameType or arg_26_0 == MP.GameMode.HVTGameType or arg_26_0 == MP.GameMode.GrindGameType or arg_26_0 == MP.GameMode.GrndGameType or arg_26_0 == MP.GameMode.HardpointGameType or arg_26_0 == MP.GameMode.BTMGameType or arg_26_0 == MP.GameMode.TJuggGameType or arg_26_0 == MP.GameMode.ArmsRaceGameType or arg_26_0 == MP.GameMode.HQGameType or arg_26_0 == MP.GameMode.DomGameType
end

function MP.IsNormalDogtagGameType(arg_27_0)
	return false
end

function MP.IsKillstreakSupportedGameType(arg_28_0)
	return arg_28_0 ~= MP.GameMode.ArenaGameType and arg_28_0 ~= MP.GameMode.GunGameType and arg_28_0 ~= MP.GameMode.InfectGameType and arg_28_0 ~= MP.GameMode.OICGameType
end

function MP.IsBRLootSupportedGameType(arg_29_0)
	return arg_29_0 == MP.GameMode.BRGameType
end

function MP.RoundEndTitleFilterFunction(arg_30_0, arg_30_1)
	if arg_30_0 > 0 then
		return MP.RoundEndTitleStrings[arg_30_0]
	else
		return ""
	end
end

function MP.RoundEndReasonFilterFunction(arg_31_0, arg_31_1)
	if arg_31_0 > 0 then
		return MP.RoundEndReasonStrings[arg_31_0]
	else
		return ""
	end
end

function MP.RoundEndExtraMessageFilterFunction(arg_32_0, arg_32_1)
	if arg_32_0 > 0 then
		return MP.RoundEndExtraMessageStrings[arg_32_0]
	else
		return ""
	end
end

function MP.IsRoundEndTitleEndOfMatch(arg_33_0)
	return arg_33_0 == 1 or arg_33_0 == 5 or arg_33_0 == 6 or arg_33_0 == 13
end

function MP.RoundEndFFAPlayerScoreFunction(arg_34_0)
	local var_34_0 = Game.DHEDEIHGF()
	local var_34_1 = Game.EHGJIIFEJ(var_34_0, arg_34_0)

	if var_34_1 then
		return var_34_1.name
	end
end

function MP.RoundEndFFAFirstPlayerScoreFunction(arg_35_0, arg_35_1)
	return MP.RoundEndFFAPlayerScoreFunction(1)
end

function MP.RoundEndFFASecondPlayerScoreFunction(arg_36_0, arg_36_1)
	return MP.RoundEndFFAPlayerScoreFunction(2)
end

function MP.RoundEndFFAThirdPlayerScoreFunction(arg_37_0, arg_37_1)
	return MP.RoundEndFFAPlayerScoreFunction(3)
end

function MP.StartEMPGlitch(arg_38_0)
	arg_38_0:SetGlitchAmount(0.95)
end

function MP.StopEMPGlitch(arg_39_0)
	arg_39_0:SetGlitchAmount(0)
end

MP.LoadoutSelectAttempts = {
	0,
	0,
	0
}

function MP.GetGameModeMaterialStreamer()
	local var_40_0 = {}
	local var_40_1 = StringTable.BFHCAIIDA(CSV.gameTypesTable.file)

	for iter_40_0 = 0, var_40_1 - 1 do
		local var_40_2 = StringTable.CBGJCDIHCE(CSV.gameTypesTable.file, iter_40_0, CSV.gameTypesTable.cols.image)

		if #var_40_2 > 0 then
			local var_40_3 = RegisterMaterial(var_40_2)

			table.insert(var_40_0, var_40_3)
		end
	end

	local var_40_4 = LUI.UIElement.new()

	var_40_4.id = "GameModeMaterialStreamer"

	var_40_4:SetupImageTableStreamer(var_40_0)

	return var_40_4
end

function MP.ValidateAllPlayersPrivateSquadMembers()
	return
end

MP.extraStats = {
	INFECTED = "infected",
	THROWS = "throws",
	GAMESPLAYED = "gamesPlayed",
	PLANTS = "plants",
	TIME = "time",
	STREAK = "streak",
	STABS = "stabs",
	REVIVES = "revives",
	SET_BACKS = "setBacks",
	DENIES = "denies",
	DAMAGE = "damage",
	DOWNS = "downs",
	DEFENDS = "defends",
	CONTRACTS = "contracts",
	TOPTEN = "topTen",
	DEFUSES = "defuses",
	KD_RATIO = "kdRatio",
	OBJ_TIME = "objTime",
	BANKS = "banks",
	RETURNS = "returns",
	CAPTURES = "captures",
	RESCUES = "rescues",
	ASSISTS = "assists",
	CARRIES = "carries",
	CONFIRMS = "confirms",
	WINS = "wins"
}
MP.combatRecordGameTypeStats = {
	war = {
		MP.extraStats.KD_RATIO,
		MP.extraStats.ASSISTS
	},
	dd = {
		MP.extraStats.PLANTS,
		MP.extraStats.DEFUSES
	},
	hc_war = {
		MP.extraStats.KD_RATIO,
		MP.extraStats.ASSISTS
	},
	cyber = {
		MP.extraStats.PLANTS,
		MP.extraStats.REVIVES
	},
	hc_cyber = {
		MP.extraStats.PLANTS,
		MP.extraStats.REVIVES
	},
	dom = {
		MP.extraStats.CAPTURES,
		MP.extraStats.DEFENDS
	},
	hc_dom = {
		MP.extraStats.CAPTURES,
		MP.extraStats.DEFENDS
	},
	hq = {
		MP.extraStats.CAPTURES,
		MP.extraStats.DEFENDS
	},
	hc_hq = {
		MP.extraStats.CAPTURES,
		MP.extraStats.DEFENDS
	},
	arm = {
		MP.extraStats.CAPTURES,
		MP.extraStats.DEFENDS
	},
	sd = {
		MP.extraStats.PLANTS,
		MP.extraStats.DEFUSES
	},
	hc_sd = {
		MP.extraStats.PLANTS,
		MP.extraStats.DEFUSES
	},
	dm = {
		MP.extraStats.KD_RATIO,
		MP.extraStats.STREAK
	},
	hc_dm = {
		MP.extraStats.KD_RATIO,
		MP.extraStats.STREAK
	},
	arena = {
		MP.extraStats.DAMAGE,
		MP.extraStats.ASSISTS
	},
	hc_arena = {
		MP.extraStats.DAMAGE,
		MP.extraStats.ASSISTS
	},
	conf = {
		MP.extraStats.CONFIRMS,
		MP.extraStats.DENIES
	},
	hc_conf = {
		MP.extraStats.CONFIRMS,
		MP.extraStats.DENIES
	},
	koth = {
		MP.extraStats.OBJ_TIME,
		MP.extraStats.DEFENDS
	},
	ctf = {
		MP.extraStats.CAPTURES,
		MP.extraStats.RETURNS
	},
	infect = {
		MP.extraStats.TIME,
		MP.extraStats.INFECTED
	},
	gun = {
		MP.extraStats.STABS,
		MP.extraStats.SET_BACKS
	},
	siege = {
		MP.extraStats.CAPTURES,
		MP.extraStats.REVIVES
	},
	grind = {
		MP.extraStats.BANKS,
		MP.extraStats.DENIES
	},
	grnd = {
		MP.extraStats.OBJ_TIME,
		MP.extraStats.DEFENDS
	},
	br = {
		MP.extraStats.WINS,
		MP.extraStats.TOPTEN
	},
	br_dmz = {
		MP.extraStats.DOWNS,
		MP.extraStats.CONTRACTS
	}
}
MP.f2pModes = {
	"br",
	"br_dmz"
}

function MP.IsModeF2P(arg_42_0)
	for iter_42_0, iter_42_1 in ipairs(MP.f2pModes) do
		if arg_42_0 == iter_42_1 then
			return true
		end
	end

	return false
end

function MP.GetGameModeStats(arg_43_0, arg_43_1)
	local var_43_0 = {}

	for iter_43_0 = 0, StringTable.BFHCAIIDA(CSV.gameTypesTable.file) do
		local var_43_1 = CSV.ReadRow(CSV.gameTypesTable, iter_43_0)

		if var_43_1 ~= nil and var_43_1.ref ~= "" then
			if arg_43_1 then
				var_43_0["hc_" .. var_43_1.ref] = {
					isHardcore = true,
					name = var_43_1.name,
					image = var_43_1.hardcoreImage ~= "" and var_43_1.hardcoreImage or var_43_1.image,
					desc = var_43_1.desc
				}
			else
				var_43_0[var_43_1.ref] = {
					name = var_43_1.name,
					image = var_43_1.image,
					desc = var_43_1.desc
				}
			end
		end
	end

	local var_43_2 = {}
	local var_43_3 = {}
	local var_43_4 = not Engine.CFHBIHABCB(arg_43_0)

	for iter_43_1, iter_43_2 in pairs(MP.combatRecordGameTypeStats) do
		local var_43_5 = PlayerData.BFFBGAJGD(arg_43_0, CoD.StatsGroup.Ranked).playerStats.modeStats[iter_43_1]
		local var_43_6 = var_43_5.timePlayed:get()

		if var_43_0[iter_43_1] then
			local var_43_7 = {
				name = var_43_0[iter_43_1].name,
				image = var_43_0[iter_43_1].image,
				desc = var_43_0[iter_43_1].desc,
				isHardcore = var_43_0[iter_43_1].isHardcore,
				gametype = iter_43_1,
				score = var_43_5.score:get(),
				timePlayed = Engine.BJCFFHAIFA(var_43_6),
				kills = var_43_5.kills:get(),
				deaths = var_43_5.deaths:get(),
				extraStat1 = var_43_5[iter_43_2[1]]:get(),
				extraStat1Name = iter_43_2[1],
				extraStat2 = var_43_5[iter_43_2[2]]:get(),
				extraStat2Name = iter_43_2[2]
			}

			if var_43_7.extraStat1Name == MP.extraStats.KD_RATIO then
				var_43_7.extraStat1 = nil
			end

			if var_43_7.extraStat2Name == MP.extraStats.KD_RATIO then
				var_43_7.extraStat2 = nil
			end

			local var_43_8 = var_43_6 / 60

			var_43_7.spm = var_43_7.score / (var_43_8 ~= 0 and var_43_8 or 1)
			var_43_7.kdr = var_43_7.kills / (var_43_7.deaths ~= 0 and var_43_7.deaths or 1)

			if MP.IsModeF2P(iter_43_1) then
				if CONDITIONS.IsMagmaEnabled() then
					if var_43_4 then
						var_43_3[iter_43_1] = var_43_7
					else
						table.insert(var_43_2, var_43_7)
					end
				end
			else
				table.insert(var_43_2, var_43_7)
			end
		end
	end

	if var_43_4 then
		for iter_43_3, iter_43_4 in ipairs(MP.f2pModes) do
			if var_43_3[iter_43_4] then
				table.insert(var_43_2, iter_43_3, var_43_3[iter_43_4])
			end
		end
	end

	return var_43_2
end

function MP.IsOffline()
	return LUI.FlowManager.IsInStack("MainMenuOffline")
end

function MP.SetupEmblem(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = Game.BBCDHAEBHD(arg_45_2)
	local var_45_1 = var_45_0 and #var_45_0 > 0 and not Engine.EBCDCFCBE(var_45_0)
	local var_45_2 = Dvar.IBEGCHEFE("MNNLTTPSN") == true
	local var_45_3 = var_45_1 and not var_45_2 and Engine.DAGCEEFBBI(arg_45_0._controllerIndex, var_45_0)
	local var_45_4 = var_45_3 and Game.DFIJAJICCC(arg_45_2)

	if var_45_3 and var_45_4 then
		arg_45_1:SetupUserEmblem({
			xuid = var_45_0
		})
	else
		arg_45_1:setupUIImage()

		local var_45_5 = Game.BDEDHJGEGI(arg_45_2)

		if var_45_5 == nil or #var_45_5 == 0 then
			var_45_5 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
		end

		arg_45_1:setImage(RegisterMaterial(var_45_5))
	end
end

function MP.ParseCommaStringDvar(arg_46_0)
	local var_46_0 = Dvar.DHEEJCCJBH(arg_46_0)

	if var_46_0 and var_46_0 ~= "" then
		local var_46_1 = LUI.Split(var_46_0, ",")

		if var_46_1 and #var_46_1 > 0 then
			for iter_46_0, iter_46_1 in pairs(var_46_1) do
				var_46_1[iter_46_0] = string.gsub(iter_46_1, "%s+", "")
			end

			return var_46_1
		end
	end

	return nil
end

function MP.HandleSharedNVidiaHighlights(arg_47_0)
	if arg_47_0 == nVidiaHighlights.FURY_KILL then
		Engine.DIHBAJHIGG("MW_Highlights", "Fury Kill", -12000, 3000)
	elseif arg_47_0 == nVidiaHighlights.COLLATERAL then
		Engine.DIHBAJHIGG("MW_Highlights", "Collateral", -5000, 5000)
	elseif arg_47_0 == nVidiaHighlights.POPCORN then
		Engine.DIHBAJHIGG("MW_Highlights", "Popcorn", -5000, 3000)
	elseif arg_47_0 == nVidiaHighlights.STICK then
		Engine.DIHBAJHIGG("MW_Highlights", "Stick", -5000, 3000)
	elseif arg_47_0 == nVidiaHighlights.BONK then
		Engine.DIHBAJHIGG("MW_Highlights", "Bonk", -5000, 3000)
	end
end

MP.WarzonePracticePopupStatus = {
	EXIT_TUTORIAL = 0,
	GO_TO_BLOODMONEY_LOBBY = 5,
	POPUP_OPENED = 4,
	GO_TO_WARZONE_LOBBY = 1,
	GO_TO_BR_MAIN_MENU = 7,
	RETRY_TUTORIAL = 3,
	GO_TO_BLOODMONEY_TUTORIAL_LOBBY = 6,
	GO_TO_PRACTICE_LOBBY = 2
}

function MP.GetLastQuickplayFilter(arg_48_0)
	local var_48_0 = PlayerData.BFFBGAJGD(arg_48_0, CoD.StatsGroup.NonGame).quickplayFilter:get()

	for iter_48_0, iter_48_1 in pairs(MP.PLAYLIST_FILTER_MODE) do
		if iter_48_1 == var_48_0 then
			return var_48_0
		end
	end

	return MP.PLAYLIST_FILTER_MODE.normal
end

function MP.SetLastQuickplayFilter(arg_49_0, arg_49_1)
	PlayerData.BFFBGAJGD(arg_49_0, CoD.StatsGroup.NonGame).quickplayFilter:set(arg_49_1)
end

function MP.GetCurrentGameTypeModifier(arg_50_0)
	if Dvar.IBEGCHEFE("OMKTLMMNPT") then
		return MP.GAME_TYPE_MODIFIERS.tactical
	elseif Dvar.IBEGCHEFE("MSQTTNSTNO") then
		return MP.GAME_TYPE_MODIFIERS.hardcore
	end

	return MP.GAME_TYPE_MODIFIERS.normal
end

MP.BRTDMMapData = {
	{
		image = "loading_wz_verdansk_br_bg",
		name = "lumber",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_LUMBER"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "frozen_pond",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_CRASH_SITE"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "port_trenches",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_OUTSKIRTS"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "downtown_park",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_PARK"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "hospital_hill",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_HOSPITAL_HILLS"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "east_promenade",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_SHOPPING_DISTRICT_EAST"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "hills",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_HILLS"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "storage",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_TERMINAL_APPROACH"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "storage_shipment",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_STORAGETOWN"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "dam",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_DAM"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "mil_base",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_AIRFIELD"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "karst_bridge",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_BRIDGE_KARST"
	},
	{
		image = "loading_wz_verdansk_br_bg",
		name = "stadium",
		localizedString = "LUA_MENU/MAPNAME_DONETSK_STADIUM"
	}
}

function MP.GetBRTDMLocaleData(arg_51_0)
	local var_51_0 = {
		image = "placeholder_x",
		name = ""
	}

	for iter_51_0 = 1, #MP.BRTDMMapData do
		if MP.BRTDMMapData[iter_51_0].name == arg_51_0 then
			var_51_0.image = MP.BRTDMMapData[iter_51_0].image
			var_51_0.name = MP.BRTDMMapData[iter_51_0].localizedString

			break
		end
	end

	return var_51_0
end

function MP.GetLobbyMapName(arg_52_0, arg_52_1)
	if arg_52_0 == Lobby.RANDOM_MAP then
		return Engine.CBBHFCGDIC("TOURNAMENT/RANDOM_MAP")
	else
		return MP.GetMapName(arg_52_0, arg_52_1)
	end
end

function MP.GetLobbyMapImage(arg_53_0)
	if arg_53_0 == Lobby.RANDOM_MAP then
		return "preview_mp_m_king_lobby"
	else
		return MP.GetMapImage(arg_53_0)
	end
end
