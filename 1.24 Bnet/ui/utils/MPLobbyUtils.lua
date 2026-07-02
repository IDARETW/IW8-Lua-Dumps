Lobby = Lobby or {}
Lobby.AllMembersPath = "alwaysLoaded.activeParty.members"
Lobby.SquadMembersPath = "alwaysLoaded.activeParty.squadMembers"
Lobby.MaxPlayerCountForSplitscreen = 12
Lobby.PlaylistLockState = {
	LOCKED_MAXPARTY = 3,
	UNLOCKED = 0
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
	SuperSurvivor = "superSurvivor",
	DropTime = "dropTime",
	WeaponInitialPrimary = "weaponInitialPrimary",
	Spectate3rdAllowed = "spectate3rdAllowed",
	ScorePerTick = "scorePerTick",
	MidfieldScore = "midfieldScore",
	HardcoreModeOn = "hardcoreModeOn",
	PlantTime = "plantTime",
	BankCaptureTime = "bankCaptureTime",
	LethalInfected = "lethalInfect",
	CaptureDurationCenter = "captureDurationCenter",
	EnablePing = "enablePing",
	GoalMoveTimer = "goalMoveTimer",
	ZoneSelectionDelay = "zoneSelectionDelay",
	AllowSupers = "allowSupers",
	ArenaBlastShieldClamp = "blastShieldClamp",
	JuggSpawnBehavior = "juggSpawnBehavior",
	InputSwapEnabled = "inputSwapEnabled",
	EquipmentMSProtect = "equipmentMSProtect",
	PracticeMode = "practiceMode",
	PointsPerFlag = "pointsPerFlag",
	WeaponTier6 = "weaponTier6",
	LoadoutChangeRound = "loadoutChangeRound",
	ZoneCaptureTime = "zoneCaptureTime",
	DefuseTime = "defuseTime",
	FriendlyBaseScore = "friendlyBaseScore",
	ScoreCarry = "scoreCarry",
	AllowPerks = "allowPerks",
	DeathRetainStreaks = "deathRetainStreaks",
	SuicideSpawnDelay = "suicideSpawnDelay",
	ScoreLimit = "scoreLimit",
	SpawnDelay = "spawnDelay",
	ZoneTimeout = "zoneTimeout",
	LadderIndex = "ladderIndex",
	WinByTwoMaxRounds = "winByTwoMaxRounds",
	CaptureDuration = "captureDuration",
	PostRoundExtraTimer = "postRoundExtraTimer",
	EnableVariantDZ = "enableVariantDZ",
	EnemyBaseScore = "enemyBaseScore",
	AdditiveScoring = "additiveScoring",
	WinByTwoEnabled = "winByTwoEnabled",
	RoundRetainStreakProg = "roundRetainStreakProg",
	FlagNeutralization = "flagNeutralization",
	WeaponInfectSecondary = "weaponInfectSecondary",
	BankRate = "bankRate",
	SurvivorScoreTime = "survivorScoreTime",
	SurvivorScorePerTick = "survivorScorePerTick",
	TacticalSurvivor = "tacticalSurvivor",
	SpawnProtectionTimer = "spawnProtectionTimer",
	TargetPlayerCycle = "targetPlayerCycle",
	WeaponSurvivorPrimary = "weaponSurvivorPrimary",
	ScoringTime = "scoringTime",
	RoundRetainStreaks = "roundRetainStreaks",
	GiveTKOnTISpawn = "giveTKOnTISpawn",
	Setback = "setback",
	PointsPerKSKill = "pointsPerKSKill",
	KillsPerWeapon = "killsPerWeapon",
	PauseTime = "pauseTime",
	ArenaAttachments = "arenaAttachments",
	CaptureType = "captureType",
	DelayPlayer = "delayPlayer",
	SuperPointsMod = "superPointsMod",
	SuperInfect = "superInfect",
	InGameLoot = "inGameLoot",
	PossessionResetCondition = "possessionResetCondition",
	PossessionResetTime = "possessionResetTime",
	ZoneLifetime = "zoneLifetime",
	ShowEnemyCarrier = "showEnemyCarrier",
	LethalSurvivor = "lethalSurvivor",
	BountyTimer = "bountyTimer",
	HeadshotsOnly = "headshotsOnly",
	RespawnDelay = "respawnDelay",
	TeamAssignmentAllowed = "teamAssignmentAllowed",
	TacticalInfected = "tacticalInfect",
	NumLives = "numLives",
	ObjScalar = "objScalar",
	SwitchSpawns = "switchSpawns",
	InfilConvoy = "infilConvoy",
	CrankedBombTimer = "crankedBombTimer",
	WeaponTier1 = "weaponTier1",
	WeaponTier2 = "weaponTier2",
	WeaponTier8 = "weaponTier8",
	WeaponTier5 = "weaponTier5",
	RoundStartTime = "roundStartTime",
	PointsPerDeny = "pointsPerDeny",
	FriendlyFire = "friendlyFire",
	HealthRegen = "healthRegen",
	WeaponInfectedPrimary = "weaponInfectPrimary",
	ZoneSwitchTime = "zoneSwitchTime",
	ArenaObjModifier = "objModifier",
	NumFlagsScoreOnKill = "numFlagsScoreOnKill",
	ResetProgress = "resetProgress",
	IdleResetTime = "idleResetTime",
	InfectStreakBonus = "infectStreakBonus",
	JuggSwitchTime = "juggSwitchTime",
	LastStandTimer = "lastStandTimer",
	LastStandReviveTimer = "lastStandReviveTimer",
	FlagCaptureTime = "flagCaptureTime",
	LastStandSuicideTimer = "lastStandSuicideTimer",
	CaptureDecay = "captureDecay",
	OvertimeLimit = "overtimeLimit",
	WeaponSurvivorSecondary = "weaponSurvivorSecondary",
	MultiBomb = "multiBomb",
	Vampirism = "vampirism",
	TacticalModeOn = "tacticalMode",
	ScoreThrow = "scoreThrow",
	StartWeapon = "startWeapon",
	BankDisableTime = "bankDisableTime",
	ExtraTime = "extraTime",
	WeaponTier4 = "weaponTier4",
	RecipeName = "recipeName",
	LastStandHealth = "lastStandHealth",
	InfilHeli = "infilHeli",
	RadarPingTime = "radarPingTime",
	PersBombTimer = "persBombTimer",
	NumRevives = "numRevives",
	RoundLimit = "roundLimit",
	SatelliteCount = "satelliteCount",
	DetonateScore = "detonateScore",
	SilentPlant = "silentPlant",
	EnemyDeathLoc = "enemyDeathLoc",
	MegaBankBonusKS = "megaBankBonusKS",
	BankTime = "bankTime",
	ActivationDelayCenter = "activationDelayCenter",
	WaveRespawnDelay = "waveRespawnDelay",
	SuperFastChargeRate = "superFastChargeRate",
	MatchStartTime = "matchStartTime",
	ShowKillcam = "showKillcam",
	WeaponInitialSecondary = "weaponInitialSecondary",
	HoldDurationCenter = "holdDurationCenter",
	ArenaTacticalTimeMod = "tacticalTimeMod",
	ReturnTime = "returnTime",
	CaptureDurationHalf = "captureDurationHalf",
	ActivationDelayBase = "activationDelayBase",
	MegaBankBonus = "megaBankBonus",
	CaptureDurationBase = "captureDurationBase",
	RushTimer = "rushTimer",
	TeamTimer = "teamTimer",
	HoldDurationBase = "holdDurationBase",
	PickupTime = "pickupTime",
	PPKTeamWithFlag = "ppkTeamWithFlag",
	AONRules = "aonRules",
	PPKFlagCarrier = "ppkFlagCarrier",
	DraftRigTimer = "draftRigTimer",
	EnemyBaseKillReveal = "enemyBaseKillReveal",
	ShowTargetTime = "showTargetTime",
	LastStandReviveHealth = "lastStandReviveHealth",
	CrateDropTimer = "crateDropTimer",
	SpectateModeAllowed = "spectateModeAllowed",
	InfilSkip = "infilSkip",
	UseHPRules = "useHPRules",
	BankDisableTags = "bankDisableTags",
	LethalDelay = "equipmentDelay",
	MegaBankLimit = "megaBankLimit",
	CaptureCondition = "captureCondition",
	ActivationDelayHalf = "activationDelayHalf",
	DraftLoadoutTimer = "draftLoadoutTimer",
	TeamSize = "teamSize",
	MagCount = "magCount",
	KillRewardAmmoCount = "killRewardAmmoCount",
	RadarEndGame = "radarEndGame",
	CapZone = "capZone",
	OneShotKill = "oneShotKill",
	EmpSpawn = "empSpawn",
	JuggTimeout = "juggTimeout",
	GoalType = "goalType",
	HelperMax = "helperMax",
	CompassHideEnemy = "compassHideEnemy",
	ZoneActivationDelay = "zoneActivationDelay",
	PreCapPoints = "preCapPoints",
	ReviveUseWeapon = "reviveUseWeapon",
	TimeLimit = "timeLimit",
	JuggTimeoutOn = "juggTimeoutOn",
	RadarHideShots = "radarHideShots",
	LastStand = "lastStand",
	PointsPerKillAsJugg = "ppkAsJugg",
	RoundStartReadyUp = "roundStartReadyUp",
	NumEndGame = "numEndGame",
	ArenaBlastShieldMod = "blastShieldMod",
	HoldDurationHalf = "holdDurationHalf",
	PPKTeamNoFlag = "ppkTeamNoFlag",
	EnableBrLoot = "enableBrLoot",
	FFPunishLimit = "ffPunishLimit",
	EnableInfectedTracker = "enableInfectedTracker",
	DraftWeaponTimer = "draftWeaponTimer",
	FlagActivationDelay = "flagActivationDelay",
	WinRule = "winRule",
	MaxHealth = "maxHealth",
	PointsPerJuggKill = "ppkOnJugg",
	ExtraTimeBonus = "extraTimeBonus",
	AllowCustomClasses = "allowCustomClasses",
	CODCastingEnabled = "codcasterEnabled",
	DisableSuperSprint = "disableSuperSprint",
	CasualScoreStreaks = "casualScoreStreaks",
	BombTimer = "bombTimer",
	NumInitialInfected = "numInitialInfected",
	SuperInfectTwo = "superInfectTwo",
	RecipeDescription = "recipeDescription",
	FlagsRequiredToScore = "flagsRequiredToScore",
	SuperSurvivorTwo = "superSurvivorTwo",
	GoalEnableTimer = "goalEnableTimer",
	WinLimit = "winLimit",
	CircleStartSize = "circleStartSize",
	DisableMount = "disableMount",
	InfilC130 = "infilC130",
	CompassHidePings = "compassHidePings",
	ArenaSpawnFlag = "spawnFlag",
	PointsPerConfirm = "pointsPerConfirm",
	GoalProtection = "goalProtection",
	SurvivorAliveScore = "survivorAliveScore",
	AllowKillstreaks = "allowKillstreaks",
	WeaponTier3 = "weaponTier3",
	ActivationDelay = "activationDelay",
	FirstZoneActivationDelay = "firstZoneActivationDelay",
	Gulag = "gulag",
	ArenaWinCondition = "winCondition",
	ForceRespawn = "forceRespawn",
	CarrierBonusScore = "carrierBonusScore",
	SharedRushTimer = "sharedRushTimer",
	CircleDamageMultiplier = "circleDamageMultiplier",
	StartingWeapon = "startingWeapon",
	CapRate = "capRate",
	JuggHealth = "juggHealth",
	UseHQRules = "useHQRules",
	HVTCaptureValue = "hvtCaptureValue",
	HVTTargetCount = "hvtMaxTargets",
	PracticeRound = "practiceRound",
	DisableSpawnCamera = "disableSpawnCamera",
	DisableBattleChatter = "disableBattleChatter",
	RushTimerAmount = "rushTimerAmount",
	DisableAnnouncer = "disableAnnouncer",
	BountyBonusScore = "bountyBonusScore",
	SetbackStreak = "setbackStreak",
	DogTags = "dogTags",
	CarrierBonusTime = "carrierBonusTime",
	PointsHeadshotBonus = "pointsHeadshotBonus",
	CDLTuning = "cdltuning",
	EnableMiniMap = "enableMinimap",
	JuggTeamSpeed = "juggTeamSpeed",
	PointsPerDeath = "pointsPerDeath",
	InitialAmmoCount = "initialAmmoCount",
	KillcamType = "killcamType",
	RandomLocationOrder = "randomLocationOrder",
	RadarAlwaysOn = "radarAlwaysOn",
	EscapeTimer = "escapeTimer",
	Weapon = "weapon",
	PointsPerKill = "pointsPerKill",
	PointsPerJuggOnJuggKill = "ppkJuggOnJugg",
	BankDisable = "bankDisable",
	RoundSwitch = "roundSwitch",
	CmdRules = "cmdRules",
	WeaponTier7 = "weaponTier7",
	ScoreOnTargetPlayer = "scoreOnTargetPlayer",
	JuggSpeed = "juggSpeed",
	ArenaLoadouts = "arenaLoadouts"
}
Lobby.BRTutorialLobbyType = {
	BLOODMONEY = 3,
	PRACTICE = 2,
	TUTORIAL = 1
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
	LARGE = "Large",
	CWL = "Cwl",
	STANDARD = "Standard",
	ALTERNATE = "Alternate"
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
Lobby.DEFAULT_WARZONE = {
	gameType = "private_br",
	teamSize = 1,
	recipe = "br.recipe",
	maps = {
		"mp_don3"
	}
}

function Lobby.GetStatusString(arg_1_0)
	if IsPublicMatch() then
		local var_1_0, var_1_1 = Lobby.DBJHBACBBE()

		if var_1_0 == Lobby.MatchmakerState.IDLE then
			return "", false, "idle"
		elseif var_1_0 == Lobby.MatchmakerState.JOINED_LOBBY then
			-- block empty
		elseif var_1_0 == Lobby.MatchmakerState.QOSING then
			assert(var_1_1.numQoSPlayers)

			return Engine.CBBHFCGDIC("MPUI/MMING_QOSING", var_1_1.numQoSPlayers), true, "qosing"
		elseif Lobby.BGIADHIHAG() then
			if var_1_0 == Lobby.MatchmakerState.INITIALIZING then
				return Engine.CBBHFCGDIC("MPUI/MMING_INITIALIZING"), true, "initializing"
			elseif var_1_0 == Lobby.MatchmakerState.SEARCHING then
				if Dvar.IBEGCHEFE("MPTLKKKQNT") and var_1_1.maxPing > 0 then
					assert(var_1_1.maxPing)

					return Engine.CBBHFCGDIC("MPUI/MMING_SEARCHING_PING", var_1_1.maxPing), true, "searching"
				else
					return Engine.CBBHFCGDIC("MPUI/MMING_SEARCHING"), true, "searching"
				end
			elseif var_1_0 == Lobby.MatchmakerState.ERRORING then
				return Engine.CBBHFCGDIC("MPUI/MMING_ERRORING"), true, "erroring"
			end
		else
			return Engine.CBBHFCGDIC("MPUI/MMING_HOST_DOES_IT"), true, "host_searching"
		end
	end

	local var_1_2, var_1_3 = Lobby.BGIBDIBHH()

	if MLG.JIHGCIJCG() then
		local var_1_4 = GAMEBATTLES.GetCurrentMatch(arg_1_0)

		if var_1_4 then
			if var_1_2 == Lobby.PartyState.INTERMISSION then
				local var_1_5 = math.ceil(var_1_3.timeRemaining / 1000)
				local var_1_6, var_1_7 = GAMEBATTLES.GetMatchProgressInfo(var_1_4)

				if not var_1_7 then
					local var_1_8 = GAMEBATTLES.GetNoshowTime()

					if var_1_6 or var_1_5 < var_1_8 then
						return Engine.CBBHFCGDIC("MLG_GAMEBATTLES/STATUS_NOSHOW", Engine.JCBDICCAH(Engine.GEGAFIFFC(var_1_5))), false, "gamebattle_noshow"
					else
						local var_1_9 = var_1_5 - var_1_8

						return Engine.CBBHFCGDIC("MLG_GAMEBATTLES/STATUS_PREMATCH", Engine.JCBDICCAH(Engine.GEGAFIFFC(var_1_9))), false, "gamebattle_prematch"
					end
				end
			else
				local var_1_10 = LUI.DataSourceInGlobalModel.new("frontEnd.mlg.matchJoinState"):GetValue(arg_1_0)

				if var_1_10 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.IDLE or var_1_10 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.TRY_CREATE then
					return "", false, "gamebattle_not joined"
				end
			end
		end
	end

	if var_1_2 == Lobby.PartyState.INTERMISSION then
		assert(var_1_3.timeRemaining)

		local var_1_11 = math.ceil(var_1_3.timeRemaining / 1000)

		return Engine.CBBHFCGDIC("MENU/INTERMISSION", var_1_11), false, "intermission"
	elseif var_1_2 == Lobby.PartyState.STARTING_SOON then
		return Engine.CBBHFCGDIC("MENU/MATCH_WILL_BEGIN"), false, "starting_soon"
	elseif var_1_2 == Lobby.PartyState.STARTING then
		assert(var_1_3.timeRemaining)

		if var_1_3.timeRemaining < 0 then
			return Engine.CBBHFCGDIC("MENU/GAME_BEGINNING"), false, "starting_no_time"
		else
			return Engine.CBBHFCGDIC("MENU/MATCH_BEGINNING_IN", math.ceil(var_1_3.timeRemaining / 1000)), false, "starting"
		end
	elseif var_1_2 == Lobby.PartyState.WAITING_FOR_FASTFILES_STARTED then
		return Engine.CBBHFCGDIC("MENU/WAITING_FOR_FASTFILES_STARTED"), true, "ff_started"
	elseif var_1_2 == Lobby.PartyState.WAITING_FOR_FASTFILES then
		return Engine.CBBHFCGDIC("MENU/WAITING_FOR_FASTFILES"), true, "ff"
	elseif var_1_2 == Lobby.PartyState.WAITING_FOR_HOST then
		return Engine.CBBHFCGDIC("MENU/WAITING_FOR_HOST"), false, "waiting_for_host"
	elseif var_1_2 == Lobby.PartyState.WAITING_FOR_READY then
		return Engine.CBBHFCGDIC("LUA_MENU/STATUS_NEED_TO_READY_UP"), false, "waiting_for_ready"
	elseif var_1_2 == Lobby.PartyState.WAITING_FOR_OTHER_PLAYERS then
		return Engine.CBBHFCGDIC("LUA_MENU/STATUS_WAITING_FOR_OTHER_PLAYERS"), false, "waiting_for_other_players"
	elseif var_1_2 == Lobby.PartyState.WAITING_FOR_DEDICATED_SERVER then
		return Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/WAITING_FOR_DEDICATED_SERVER"), true, "waiting_for_dedicated_server"
	else
		if IsPublicMatch() then
			local var_1_12 = Dvar.CFHDGABACF("LLNLRTQRPO")
			local var_1_13 = Lobby.DGHJAEEIHA()

			if var_1_13 < var_1_12 then
				if var_1_12 - var_1_13 == 1 then
					return Engine.CBBHFCGDIC("MENU/WAITING_FOR_ONE_MORE_PLAYER"), true, "waiting_for_players"
				else
					return Engine.CBBHFCGDIC("MENU/WAITING_FOR_MORE_PLAYERS", var_1_12 - var_1_13), true, "waiting_for_players"
				end
			end
		end

		return Engine.CBBHFCGDIC("MENU/WAITING"), false, "waiting"
	end
end

function Lobby.IsNotAloneInPrivateParty()
	return Lobby.GFFECBCCF() and not Lobby.CECBCJDIAG()
end

function Lobby.createNVidiaGroup(arg_3_0)
	if Engine.CGABICJHAI() and arg_3_0 and Dvar.IBEGCHEFE("LNQTQQPLRO") then
		Engine.EGIICJGCF(arg_3_0)
	end
end

function Lobby.endNVidiaGroup(arg_4_0)
	if Engine.CGABICJHAI() and arg_4_0 and Dvar.IBEGCHEFE("LNQTQQPLRO") then
		Engine.EFCHBAIF(arg_4_0)
	end
end

function Lobby.DisplayNvidiaHighlightsButton(arg_5_0, arg_5_1)
	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LNQTQQPLRO") and Engine.CFJEBEJCFC() then
		Lobby.createNVidiaGroup(arg_5_1)
		arg_5_0:registerEventHandler("nvidia_highlights_count", function(arg_6_0, arg_6_1)
			if arg_6_1.group_count > 0 then
				arg_5_0:AddButtonHelperText({
					side = "left",
					button_ref = "button_right_stick",
					priority = 6,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/NVIDIA_SUMMARY")
				})
				arg_5_0.bindButton:registerEventHandler("button_right_stick", function(arg_7_0, arg_7_1)
					Engine.BJFJDCFDID(arg_5_1)

					return true
				end)
			end

			return true
		end)
		Engine.EBEJAAJGDG(arg_5_1)
	end
end

function Lobby.LeavePublicLobby()
	local var_8_0 = Lobby.IsOurPrivatePartyHostInLobby()

	Engine.DAGFFDGFII("xstoplobbybackout Lobby.LeavePublicLobby")

	if var_8_0 then
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
		Engine.DAGFFDGFII("xstartprivateparty")
	end

	Lobby.endNVidiaGroup("MW_Highlights")
end

function Lobby.LeaveCustomGameLobby()
	local var_9_0 = Lobby.IsOurPrivatePartyHostInLobby()

	Engine.DAGFFDGFII("xstoplobbybackout Lobby.LeaveCustomGameLobby")

	if var_9_0 then
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
		Engine.DAGFFDGFII("xstartprivateparty")
	end

	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Lobby.endNVidiaGroup("MW_Highlights")
end

function Lobby.LeaveCommonMPMainMenu(arg_10_0, arg_10_1)
	assert(arg_10_0)
	assert(arg_10_1)

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		if Lobby.IsNotAloneInPrivateParty() and not Lobby.BGIADHIHAG() then
			Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_10_1)
		end
	else
		Engine.DAGFFDGFII("xstopprivateparty 0", arg_10_1)
		Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
		Dvar.DHEGHJJJHI("splitscreen", false)
	end

	LUI.FlowManager.RequestLeaveMenu(arg_10_0, true)
end

function Lobby.LeavePrivateParty(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_0)
	assert(arg_11_1)
	assert(not Engine.DAFGFCFHJI())

	if arg_11_2 == nil or arg_11_2 == true then
		Engine.DAGFFDGFII("xstopprivateparty 1 1")
	else
		Engine.DAGFFDGFII("xstopprivateparty 0 1")
	end

	Engine.DAGFFDGFII("xstartprivateparty")
	Lobby.endNVidiaGroup("MW_Highlights")
end

function Lobby.GetWalkAnimationForIndex(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = Lobby.InferOperatorRefFromModel(arg_12_0, arg_12_1)

	if var_12_0 and #var_12_0 > 0 then
		local var_12_1 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, var_12_0, CSV.operators.cols.gender)

		if not var_12_1 or #var_12_1 <= 0 then
			DebugPrint("Warning, gender is nil for operator : " .. var_12_0 .. " defaulting to male ( 0 ). Please check operators.csv for a missing operator ref or missing gender ")

			var_12_1 = OPERATOR.Gender.MALE
		end

		local var_12_2 = tonumber(var_12_1)
		local var_12_3 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, var_12_0, CSV.operators.cols.factionRef) == "SEVEN"
		local var_12_4 = arg_12_0 == "body_mp_eastern_milsim_shadow_company_1_1_lod1"
		local var_12_5 = 0

		if var_12_3 or var_12_4 then
			var_12_5 = 2
		end

		if arg_12_3 then
			local var_12_6 = "+"
			local var_12_7 = LUI.Split(arg_12_3, var_12_6)[1]

			if var_12_7 == "iw8_me_riotshield_mp" or var_12_7 == "iw8_me_riotshield_mp_frontend_sorting" or var_12_7 == "iw8_me_riotshield_mpv2" or var_12_7 == "iw8_me_riotshield_mpv2_frontend_sorting" or var_12_7 == "iw8_me_riotshield_mpv4" or var_12_7 == "iw8_me_riotshield_mpv4_frontend_sorting" then
				if var_12_3 or var_12_4 then
					return var_12_2 == OPERATOR.Gender.MALE and "chr_menu_mp_squad_male_05_shadow" or "chr_menu_mp_squad_female_05_shadow"
				else
					return var_12_2 == OPERATOR.Gender.MALE and "chr_menu_mp_squad_male_05" or "chr_menu_mp_squad_female_05"
				end
			end
		end

		return Lobby.OperatorWalkAnimations[arg_12_2][var_12_2 + 1 + var_12_5]
	else
		return "chr_menu_male_idle_01_AR"
	end
end

function Lobby.UpdateLocalClientCharacter(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5, arg_13_6, arg_13_7, arg_13_8, arg_13_9, arg_13_10)
	local var_13_0 = Lobby.GetWalkAnimationForIndex(arg_13_2, arg_13_3, arg_13_4, arg_13_6)

	ClientCharacter.DDHJHDEHFG(arg_13_1, 0, 0, 0)
	OPERATOR.UpdateClientCharacter(arg_13_1, arg_13_0, arg_13_2, arg_13_3, var_13_0, arg_13_5, arg_13_6, arg_13_7, true, arg_13_8)

	arg_13_10 = arg_13_10 or Lobby.GetPetIndexForCharacter(arg_13_1)

	if arg_13_10 then
		OPERATOR.UpdatePet(arg_13_0, arg_13_10, {
			executionPet = arg_13_9,
			element = arg_13_5
		})
	end
end

function Lobby.GetPetIndexForCharacter(arg_14_0)
	if arg_14_0 <= FrontEndScene.ClientCharacters.Lobby3 then
		return FrontEndScene.ClientCharacters.LobbyPet1 + arg_14_0
	end
end

function Lobby.GetMaxLobbyMembers(arg_15_0)
	return DataSources.frontEnd.lobby.memberMaxCount:GetValue(arg_15_0)
end

function Lobby.GetCurrentNumLobbyMembers(arg_16_0)
	return DataSources.frontEnd.lobby.memberCount:GetValue(arg_16_0)
end

function Lobby.GetCurrentNumFriendlies(arg_17_0)
	return DataSources.frontEnd.lobby.friendlyTeamCount:GetValue(arg_17_0)
end

function Lobby.GetLocalPlayerSubPartyIndex(arg_18_0)
	return DataSources.frontEnd.lobby.friendlySubPartyIndex:GetValue(arg_18_0)
end

function Lobby.GetLocalClientTeam(arg_19_0)
	return DataSources.frontEnd.lobby.friendlyTeamIndex:GetValue(arg_19_0)
end

function Lobby.GetLocalClientSquadIndex(arg_20_0)
	return DataSources.frontEnd.lobby.friendlySquadIndex:GetValue(arg_20_0)
end

function Lobby.GetPetFromPlayerCard(arg_21_0, arg_21_1)
	local var_21_0

	if arg_21_1 == OPERATOR.SuperFaction.WEST then
		var_21_0 = arg_21_0.execWest
	else
		var_21_0 = arg_21_0.execEast
	end

	if var_21_0 then
		local var_21_1 = OPERATOR.GetExecutionPet(var_21_0)

		if #var_21_1 > 0 then
			return var_21_1
		end
	end
end

function Lobby.GetModelDetailsFromPlayerCard(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0
	local var_22_1

	if arg_22_1 == OPERATOR.SuperFaction.WEST then
		var_22_0 = arg_22_0.headWest
		var_22_1 = arg_22_0.bodyWest
	else
		var_22_0 = arg_22_0.headEast
		var_22_1 = arg_22_0.bodyEast
	end

	local var_22_2
	local var_22_3 = arg_22_0.weapons[WEAPON.PrimarySlot + 1]

	if var_22_3 then
		local var_22_4 = var_22_3.lootID

		if var_22_4 and var_22_4 ~= LOOT.emptyID then
			var_22_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_22_4, CSV.weaponIDs.cols.baseRef)
		end
	end

	return Lobby.GetHeadAndBodyModelsToUse(var_22_1, var_22_0, arg_22_2, arg_22_3, var_22_2)
end

function Lobby.GetHeadAndBodyModelsToUse(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	if arg_23_1 <= 0 then
		arg_23_1 = 1
	end

	if arg_23_0 <= 0 then
		arg_23_0 = 1
	end

	local var_23_0 = StringTable.DIFCHIGDFB(CSV.heads.file, CSV.heads.cols.index, arg_23_1, CSV.heads.cols.model)
	local var_23_1 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.index, arg_23_0, CSV.bodies.cols.model)
	local var_23_2 = Lobby.InferOperatorRefFromModel(var_23_1, var_23_0)

	if OPERATOR.HasWeaponClassOverridesForSkin(var_23_2, var_23_1, var_23_0) then
		local var_23_3, var_23_4 = OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_23_2, var_23_2, arg_23_4)

		var_23_1 = #var_23_4 > 0 and var_23_4 or var_23_1
		var_23_0 = #var_23_3 > 0 and var_23_3 or var_23_0
	end

	if arg_23_3 then
		local var_23_5 = OPERATOR.GetSkinsCSVFile(var_23_2)
		local var_23_6 = StringTable.DIFCHIGDFB(var_23_5.file, var_23_5.cols.headModel, var_23_0, var_23_5.cols.headModelHighRes)
		local var_23_7 = StringTable.DIFCHIGDFB(var_23_5.file, var_23_5.cols.bodyModel, var_23_1, var_23_5.cols.bodyModelHighRes)

		var_23_1 = #var_23_7 > 0 and var_23_7 or var_23_1
		var_23_0 = #var_23_6 > 0 and var_23_6 or var_23_0
	end

	return var_23_1, var_23_0
end

function Lobby.PreloadViewHandsForLocalPlayer(arg_24_0)
	local var_24_0, var_24_1 = OPERATOR.GetEquippedOperatorSkin(arg_24_0, OPERATOR.SuperFaction.WEST)
	local var_24_2, var_24_3 = OPERATOR.GetEquippedOperatorSkin(arg_24_0, OPERATOR.SuperFaction.EAST)
	local var_24_4 = OPERATOR.GetViewHandsForOperator(var_24_0)
	local var_24_5 = OPERATOR.GetViewHandsForOperator(var_24_2)
	local var_24_6 = {}

	if #var_24_4 > 0 then
		table.insert(var_24_6, var_24_4)
	end

	if #var_24_5 > 0 then
		table.insert(var_24_6, var_24_5)
	end

	if not Streaming.EBHBADIBFB(var_24_6, arg_24_0) then
		Streaming.CDEFABDIBG(var_24_6, arg_24_0)
	end
end

function Lobby.GetDefaultLoadoutWeaponName(arg_25_0, arg_25_1)
	local var_25_0 = LOADOUT.GetFavoriteLoadoutWeapons(arg_25_1)
	local var_25_1 = WEAPON.DefaultPrimary

	if arg_25_0 == 2 then
		return var_25_0.secondaryWeaponModel
	end

	return var_25_0.primaryWeaponModel
end

function Lobby.GetWeaponLoadoutDetailsFromPlayerCard(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.weapons[arg_26_1]
	local var_26_1
	local var_26_2 = {}
	local var_26_3 = true

	if var_26_0 then
		local var_26_4 = var_26_0.lootID

		if not var_26_4 or var_26_4 == LOOT.emptyID then
			return Lobby.GetDefaultLoadoutWeaponName(arg_26_1, arg_26_2)
		end

		local var_26_5 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_26_4, CSV.weaponIDs.cols.baseRef)

		var_26_2.lootID = var_26_4

		local var_26_6 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_26_4, CSV.weaponIDs.cols.variantRef)
		local var_26_7 = WEAPON.GetVariantFile(var_26_5)

		var_26_2.variantID = StringTable.DIFCHIGDFB(var_26_7, CSV.weaponVariants.cols.ref, var_26_6, CSV.weaponVariants.cols.variantID)

		local var_26_8 = var_26_0.cosmeticAttachment

		if var_26_8 and #var_26_8 > 0 then
			var_26_2.cosmeticAttachment = var_26_8
		end

		var_26_2.attachments = {}

		for iter_26_0 = 1, #var_26_0.attachments do
			local var_26_9 = var_26_0.attachments[iter_26_0].attachment

			if var_26_9 ~= nil and #var_26_9 > 0 then
				local var_26_10 = var_26_0.attachments[iter_26_0].variantID

				table.insert(var_26_2.attachments, {
					ref = var_26_9,
					variantID = var_26_10
				})
			end
		end

		if var_26_0.camo and #var_26_0.camo > 0 then
			var_26_2.camo = var_26_0.camo
		else
			var_26_2.camo = WEAPON.CamoNoneValue
		end

		var_26_2.stickers = {}

		for iter_26_1 = 1, #var_26_0.stickers do
			local var_26_11 = var_26_0.stickers[iter_26_1]

			if var_26_11 and #var_26_11 > 0 then
				table.insert(var_26_2.stickers, var_26_11)
			else
				table.insert(var_26_2.stickers, WEAPON.StickerNoneValue)
			end
		end

		var_26_1 = WEAPON.GetWeaponModelName(var_26_5, var_26_2, {
			includeStickers = true,
			useOperatorOverride = true,
			includeCamos = true,
			includeAttachments = var_26_3,
			controllerIndex = arg_26_2
		})
	end

	return var_26_1
end

function Lobby.InferOperatorRefFromModel(arg_27_0, arg_27_1)
	local var_27_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.headModel, arg_27_1, CSV.operatorSkins.cols.operatorRef)

	if not var_27_0 or #var_27_0 <= 0 then
		var_27_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.bodyModel, arg_27_0, CSV.operatorSkins.cols.operatorRef)
	end

	if not var_27_0 or #var_27_0 <= 0 then
		var_27_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.bodyModelHighRes, arg_27_0, CSV.operatorSkins.cols.operatorRef)
	end

	if not var_27_0 or #var_27_0 <= 0 then
		var_27_0 = StringTable.DIFCHIGDFB(CSV.defaultOperatorSkins.file, CSV.defaultOperatorSkins.cols.bodyModel, arg_27_0, CSV.defaultOperatorSkins.cols.operatorRef)
	end

	if not var_27_0 or #var_27_0 <= 0 then
		var_27_0 = StringTable.DIFCHIGDFB(CSV.defaultOperatorSkins.file, CSV.defaultOperatorSkins.cols.headModel, arg_27_1, CSV.defaultOperatorSkins.cols.operatorRef)
	end

	return var_27_0
end

function Lobby.GetSelectedClientCharacterIndexInMemberList(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0:GetDataSource()

	if var_28_0 and arg_28_1 then
		local var_28_1 = var_28_0.xuid:GetValue(controllerIndex)

		if var_28_1 then
			for iter_28_0 = 1, #arg_28_1 do
				local var_28_2 = arg_28_1[iter_28_0]

				if var_28_2 and var_28_2.XUID and var_28_2.XUID == var_28_1 then
					return var_28_2.characterIndex
				end
			end
		end
	end
end

function Lobby.BuildCharacterDetailWidgets(arg_29_0, arg_29_1, arg_29_2)
	if not Dvar.IBEGCHEFE("NRNLOOTRN") then
		arg_29_0 = 1
	end

	local var_29_0 = {}

	for iter_29_0 = 1, arg_29_0 do
		local var_29_1 = MenuBuilder.BuildRegisteredType("LobbyCharacterDetails", {
			controllerIndex = arg_29_2
		})

		var_29_1:SetAlpha(0)
		var_29_1:SetupAnchoredElement({
			maxScale = 1,
			roundScreenPosition = true,
			minScale = 1
		})
		table.insert(var_29_0, var_29_1)
		arg_29_1:addElement(var_29_1)
	end

	return var_29_0
end

function Lobby.BuildFocusArrowWidget(arg_30_0, arg_30_1)
	local var_30_0 = MenuBuilder.BuildRegisteredType("LobbyFocusArrow", {
		controllerIndex = arg_30_1
	})

	var_30_0.id = "focusArrow"

	var_30_0:SetAlpha(0)
	var_30_0:SetupAnchoredElement({
		maxScale = 1,
		roundScreenPosition = true,
		minScale = 1
	})
	arg_30_0:addElement(var_30_0)

	return var_30_0
end

function Lobby.UpdateCharacterDetailsWidgets(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = 1

	while var_31_0 <= #arg_31_0 do
		local var_31_1 = arg_31_0[var_31_0].dataSource
		local var_31_2 = arg_31_0[var_31_0].characterIndex
		local var_31_3 = arg_31_1[var_31_0]

		if var_31_3 and var_31_2 and ClientCharacter.IJFGGGBAB(var_31_2) and ClientCharacter.EBDDCJHAHD(var_31_2) and Engine.DHEEHAJFEA() then
			local var_31_4 = var_31_1.controllerIndex:GetValue(arg_31_2)
			local var_31_5 = var_31_4 and Engine.BFDACIJIAD(var_31_4)

			if Dvar.IBEGCHEFE("NRNLOOTRN") or var_31_5 then
				local var_31_6 = ClientCharacter.DBDJAAEGDH(var_31_2)
				local var_31_7 = var_31_1.gamertag:GetValue(var_31_4)
				local var_31_8 = var_31_1.microphoneAlpha:GetValue(var_31_4)
				local var_31_9 = var_31_1.microphoneIcon:GetValue(var_31_4)
				local var_31_10 = var_31_1.presencePlatform:GetValue(var_31_4)
				local var_31_11 = var_31_1.isMyPlayer:GetValue(var_31_4)
				local var_31_12 = var_31_1.isPrivatePartyHost:GetValue(var_31_4)
				local var_31_13 = var_31_1.displayRank:GetValue(var_31_4)
				local var_31_14 = var_31_1.rankIcon:GetValue(var_31_4)
				local var_31_15 = var_31_1.squad:GetValue(var_31_4)
				local var_31_16 = var_31_1.usingGamepad:GetValue(var_31_4)

				var_31_3:Setup({
					gamerTag = var_31_7,
					micAlpha = var_31_8,
					micIcon = var_31_9,
					presencePlatform = var_31_10,
					isMyPlayer = var_31_11,
					isPrivatePartyHost = var_31_12,
					displayRank = var_31_13,
					rankIcon = var_31_14,
					usingGamepad = var_31_16
				})
				var_31_3:SetEntityNum(var_31_6)
				var_31_3:SetEntityTag("j_head")
				var_31_3:SetAlpha(1)

				local var_31_17 = {
					x = 0,
					y = 0
				}
				local var_31_18 = var_31_2 + 1

				if var_31_18 <= #Lobby.CharacterDetailsWidgetOffsets then
					local var_31_19 = Lobby.CharacterDetailsWidgetOffsets[var_31_18]

					var_31_3:SetWorldSpacePosition(var_31_19.x, 0, var_31_19.y)
				end
			end
		end

		var_31_0 = var_31_0 + 1
	end

	while var_31_0 <= #arg_31_1 do
		arg_31_1[var_31_0]:SetAlpha(0)

		var_31_0 = var_31_0 + 1
	end
end

function Lobby.UpdateFocusArrow(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	assert(arg_32_1)

	if not arg_32_3 then
		return
	end

	if not arg_32_0 then
		return
	end

	local var_32_0 = Lobby.GetSelectedClientCharacterIndexInMemberList(arg_32_0, arg_32_3)

	if not var_32_0 then
		return
	end

	if arg_32_0._selectedCharacterIndex ~= var_32_0 then
		arg_32_0._selectedCharacterIndex = var_32_0

		if ClientCharacter.IJFGGGBAB(var_32_0) and ClientCharacter.EBDDCJHAHD(var_32_0) and Engine.DHEEHAJFEA() then
			arg_32_1:SetAlpha(0, 100)

			arg_32_0:Wait(100).onComplete = function()
				if ClientCharacter.IJFGGGBAB(var_32_0) and ClientCharacter.EBDDCJHAHD(var_32_0) and Engine.DHEEHAJFEA() then
					local var_33_0 = ClientCharacter.DBDJAAEGDH(var_32_0)

					arg_32_1:SetEntityNum(var_33_0)
					arg_32_1:SetEntityTag("j_head")
					arg_32_1:SetAlpha(1, 200)

					local var_33_1 = var_32_0 + 1

					if var_33_1 <= #Lobby.CharacterDetailsWidgetOffsets then
						local var_33_2 = Lobby.CharacterDetailsWidgetOffsets[var_33_1]

						arg_32_1:SetWorldSpacePosition(var_33_2.x, 0, var_33_2.y)
					end
				end
			end
		else
			arg_32_1:SetAlpha(0)
		end
	end
end

function Lobby.UpdateSquadLobbyScene(arg_34_0)
	Engine.DHFCHIIJCA("squad_lobby")
end

function Lobby.DebugUpdateClientCharacters(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0, var_35_1 = OPERATOR.GetEquippedOperatorSkin(arg_35_0, OPERATOR.GetSelectedOperatorIndex(arg_35_0))
	local var_35_2 = StringTable.BFHCAIIDA(CSV.operatorSkinsDebug.file)
	local var_35_3 = {}
	local var_35_4 = {}
	local var_35_5 = {}
	local var_35_6 = {}

	for iter_35_0 = 0, var_35_2 - 1 do
		local var_35_7 = CSV.ReadRow(CSV.operatorSkinsDebug, iter_35_0)

		table.insert(var_35_3, var_35_7.bodyModel)
		table.insert(var_35_4, var_35_7.headModel)
		table.insert(var_35_5, var_35_7.petRef)
		table.insert(var_35_6, var_35_7.weaponModel)
	end

	local var_35_8 = math.min(#var_35_5, FrontEndScene.MaxPets)

	for iter_35_1 = 0, var_35_8 - 1 do
		local var_35_9 = StringTable.BJJBBCJGEJ(CSV.pets.file, CSV.pets.cols.ref, var_35_5[iter_35_1 + 1])
		local var_35_10 = CSV.ReadRow(CSV.pets, var_35_9)

		table.insert(var_35_3, var_35_10.body)
		ClientCharacter.DFHIIAGHDG(FrontEndScene.ClientCharacters.LobbyPet1 + iter_35_1, var_35_10.body)

		local var_35_11 = OPERATOR.GetPetWalk(arg_35_0, var_35_9, FrontEndScene.ClientCharacters.LobbyPet1 + iter_35_1)

		ClientCharacter.CAECDIHFCF(FrontEndScene.ClientCharacters.LobbyPet1 + iter_35_1, var_35_11)
		FrontEndScene.SetCharacterVisible(FrontEndScene.ClientCharacters.LobbyPet1 + iter_35_1, true)
	end

	FrontEndScene.RequestBodyModels(var_35_3)
	FrontEndScene.RequestHeadModels(var_35_4)
	FrontEndScene.RequestWeaponWorldModels(var_35_6)

	if arg_35_1 then
		Lobby.UpdateLocalClientCharacter(arg_35_0, FrontEndScene.ClientCharacters.ArenaLeft1, var_35_3[1], var_35_4[1], 1)
		Lobby.UpdateLocalClientCharacter(arg_35_0, FrontEndScene.ClientCharacters.ArenaLeft2, var_35_3[2], var_35_4[2], 2)
		Lobby.UpdateLocalClientCharacter(arg_35_0, FrontEndScene.ClientCharacters.ArenaRight1, var_35_3[3], var_35_4[3], 3)
		Lobby.UpdateLocalClientCharacter(arg_35_0, FrontEndScene.ClientCharacters.ArenaRight2, var_35_3[4], var_35_4[4], 4)
	else
		local var_35_12 = math.min(#var_35_4, FrontEndScene.MaxLobbyCharacters)

		for iter_35_2 = 1, var_35_12 do
			local var_35_13 = FrontEndScene.LobbyCharacters[iter_35_2]

			if var_35_13 then
				local var_35_14 = Lobby.GetWalkAnimationForIndex(var_35_3[iter_35_2], var_35_4[iter_35_2], iter_35_2, var_35_6[iter_35_2])

				OPERATOR.UpdateClientCharacter(var_35_13, arg_35_0, var_35_3[iter_35_2], var_35_4[iter_35_2], var_35_14, nil, var_35_6[iter_35_2], nil, true)
			end
		end
	end
end

function Lobby.GetPlayerCardDataForPartyMember(arg_36_0, arg_36_1)
	local var_36_0 = {
		bodyWest = arg_36_1.bodyWest:GetValue(arg_36_0),
		bodyEast = arg_36_1.bodyEast:GetValue(arg_36_0),
		headWest = arg_36_1.headWest:GetValue(arg_36_0),
		headEast = arg_36_1.headEast:GetValue(arg_36_0),
		execWest = arg_36_1.execWest:GetValue(arg_36_0),
		execEast = arg_36_1.execEast:GetValue(arg_36_0),
		weapons = {}
	}

	for iter_36_0 = 0, WEAPON.maxLoadoutWeapons - 1 do
		local var_36_1 = arg_36_1.weapons:GetDataSourceAtIndex(iter_36_0, arg_36_0)
		local var_36_2 = {
			lootID = var_36_1.weaponLootID:GetValue(arg_36_0),
			cosmeticAttachment = var_36_1.cosmeticAttachment:GetValue(arg_36_0),
			camo = var_36_1.weaponCamo:GetValue(arg_36_0)
		}
		local var_36_3 = {}

		for iter_36_1 = 0, WEAPON.maxStickersPerWeapon - 1 do
			local var_36_4 = var_36_1.stickers:GetDataSourceAtIndex(iter_36_1, arg_36_0).stickerID:GetValue(arg_36_0)

			table.insert(var_36_3, var_36_4)
		end

		var_36_2.stickers = var_36_3

		local var_36_5 = {}

		for iter_36_2 = 0, WEAPON.maxAttachmentsPerWeapon - 1 do
			local var_36_6 = var_36_1.attachments:GetDataSourceAtIndex(iter_36_2, arg_36_0)
			local var_36_7 = {
				variantID = var_36_6.variantID:GetValue(arg_36_0),
				attachment = var_36_6.attachment:GetValue(arg_36_0)
			}

			table.insert(var_36_5, var_36_7)
		end

		var_36_2.attachments = var_36_5

		table.insert(var_36_0.weapons, var_36_2)
	end

	return var_36_0
end

function Lobby.TrySwapWeapons(arg_37_0, arg_37_1)
	local var_37_0 = WEAPON.GetWeaponDetailsFromModel(arg_37_0)
	local var_37_1 = WEAPON.GetWeaponDetailsFromModel(arg_37_1)
	local var_37_2 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, var_37_0.weaponAsset, CSV.MPWeapons.cols.lobbyShouldSwapWithSecondary)
	local var_37_3 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, var_37_1.weaponAsset, CSV.MPWeapons.cols.lobbyShouldSwapWithPrimary)
	local var_37_4 = false

	if #var_37_2 > 0 and #var_37_3 > 0 and tonumber(var_37_2) == 1 and tonumber(var_37_3) == 1 then
		arg_37_0, arg_37_1 = arg_37_1, arg_37_0
		var_37_4 = true
	end

	local var_37_5 = var_37_4 and var_37_0.weaponClass or var_37_1.weaponClass

	if OPERATOR.ShouldStripAttachments(var_37_5) then
		local var_37_6 = var_37_4 and var_37_0.weaponRef or var_37_1.weaponRef

		arg_37_1 = WEAPON.GetWeaponModelNameFromRef(var_37_6)
	end

	return arg_37_0, arg_37_1
end

function Lobby.GetSuperFactionIndexFromTeam(arg_38_0)
	assert(arg_38_0)

	local var_38_0 = OPERATOR.SuperFaction.WEST

	if arg_38_0 == Teams.axis then
		var_38_0 = OPERATOR.SuperFaction.EAST
	end

	return var_38_0
end

function Lobby.CreateClientCharacterContainer(arg_39_0)
	if arg_39_0.clientCharacterContainer then
		return
	end

	arg_39_0.clientCharacterContainer = {}

	for iter_39_0 = 1, FrontEndScene.MaxLobbyCharacters do
		local var_39_0 = LUI.UIElement.new()

		arg_39_0:addElement(var_39_0)
		table.insert(arg_39_0.clientCharacterContainer, var_39_0)
	end
end

function Lobby.DumpStreamingRequests(arg_40_0, arg_40_1)
	assert(#arg_40_0 == #arg_40_1)
	DebugPrint("")
	DebugPrint("Streaming Request Start...................................")

	for iter_40_0 = 1, #arg_40_0 do
		DebugPrint("Body: " .. arg_40_0[iter_40_0] .. ", " .. "Head: " .. arg_40_1[iter_40_0])
	end

	DebugPrint("Streaming Request End...................................")
	DebugPrint("")
end

function Lobby.UpdateClientCharacters(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1.localClientCharacterIndex or FrontEndScene.ClientCharacters.LocalSquadMember
	local var_41_1 = arg_41_1.maxCharactersToShow or FrontEndScene.MaxLobbyCharacters
	local var_41_2 = arg_41_1.widget
	local var_41_3 = arg_41_1.dataSourcePath or Lobby.AllMembersPath
	local var_41_4 = arg_41_1.teamFilter
	local var_41_5 = arg_41_1.forceSuperfactionBasedOnTeam or false
	local var_41_6 = {}
	local var_41_7 = {}
	local var_41_8 = {}
	local var_41_9 = {}
	local var_41_10 = {}
	local var_41_11 = {}
	local var_41_12 = {}

	Lobby.CreateClientCharacterContainer(var_41_2)

	local var_41_13 = LUI.DataSourceInGlobalModel.new(var_41_3 .. ".count")
	local var_41_14 = LUI.DataSourceFromList.new(var_41_13)

	var_41_14.MakeDataSourceAtIndex = Lobby.GetLobbyMemberDataSourceAtIndex(var_41_3)

	local var_41_15 = var_41_13:GetValue(arg_41_0)

	var_41_15 = var_41_15 == nil and 0 or var_41_15

	local var_41_16 = math.min(var_41_15 - 1, FrontEndScene.MaxLobbyCharacters)

	if var_41_1 then
		var_41_16 = math.min(var_41_16, var_41_1 - 1)
	end

	local var_41_17 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_41_0)
	local var_41_18
	local var_41_19

	for iter_41_0 = 0, var_41_16 do
		var_41_9[iter_41_0 + 1] = var_41_9[iter_41_0 + 1] or {}

		local var_41_20 = var_41_9[iter_41_0 + 1]
		local var_41_21 = var_41_14:GetDataSourceAtIndex(iter_41_0, arg_41_0)
		local var_41_22 = Lobby.GetPlayerCardDataForPartyMember(arg_41_0, var_41_21)
		local var_41_23 = var_41_21.selectedOperatorIndex:GetValue(arg_41_0)
		local var_41_24 = true

		if var_41_5 then
			local var_41_25 = var_41_21.team:GetValue(arg_41_0)

			if var_41_25 ~= Teams.free and var_41_25 ~= Teams.spectator then
				var_41_23 = 0

				if var_41_25 == Teams.axis then
					var_41_23 = 1
				end
			end
		end

		if var_41_4 then
			var_41_24 = var_41_21.team:GetValue(arg_41_0) == var_41_4
		end

		local var_41_26 = var_41_21.isMyPlayer:GetValue(arg_41_0)

		if var_41_26 then
			var_41_18, var_41_19 = Lobby.GetModelDetailsFromPlayerCard(var_41_22, var_41_23, arg_41_0, false)
		end

		if var_41_24 then
			local var_41_27, var_41_28 = Lobby.GetModelDetailsFromPlayerCard(var_41_22, var_41_23, arg_41_0, var_41_26)
			local var_41_29 = Lobby.GetWeaponLoadoutDetailsFromPlayerCard(var_41_22, 1, arg_41_0)
			local var_41_30 = Lobby.GetWeaponLoadoutDetailsFromPlayerCard(var_41_22, 2, arg_41_0)
			local var_41_31, var_41_32 = Lobby.TrySwapWeapons(var_41_29, var_41_30)

			if var_41_26 then
				var_41_17 = OPERATOR.ValidateAccessoryModel(var_41_17, var_41_27)

				table.insert(var_41_8, var_41_17)
				table.insert(var_41_11, var_41_28)
				table.insert(var_41_10, var_41_27)
				table.insert(var_41_12, var_41_31)
				table.insert(var_41_12, var_41_32)
			else
				table.insert(var_41_6, var_41_28)
				table.insert(var_41_7, var_41_27)
				table.insert(var_41_8, var_41_31)
				table.insert(var_41_8, var_41_32)
			end

			var_41_20.head = var_41_28
			var_41_20.body = var_41_27
			var_41_20.primary = var_41_31
			var_41_20.secondary = var_41_32
			var_41_20.pet = Lobby.GetPetFromPlayerCard(var_41_22, var_41_23)
			var_41_20.dataSource = var_41_21
			var_41_20.XUID = var_41_21.xuid:GetValue(arg_41_0)

			if var_41_20.pet then
				table.insert(var_41_7, OPERATOR.GetPetModel(var_41_20.pet))
			end
		end
	end

	if OPERATOR.ShouldShowGhostTeaser(arg_41_0) then
		table.insert(var_41_6, "head_mp_western_ghost_1_1")
		table.insert(var_41_7, "body_mp_western_ghost_1_1_fe")
		table.insert(var_41_8, "iw8_ar_scharlie_mpv2+rec_scharlie|1+back_scharlie|1+mag_scharlie|1+selectsemi+barlong_scharlie_v2|3+ammomod_wound+pistolgrip02_scharlie_v2|1+vzscope_mike14_ar")
		table.insert(var_41_8, "iw8_pi_cpapa_mp+rec_cpapa+front_cpapa+ammo_cpapa+backno_cpapa+ironsdefault_cpapa")
	end

	table.insert(var_41_6, var_41_19)
	table.insert(var_41_7, var_41_18)

	for iter_41_1 = #var_41_10, 1, -1 do
		table.insert(var_41_7, var_41_10[iter_41_1])
	end

	for iter_41_2 = #var_41_11, 1, -1 do
		table.insert(var_41_6, var_41_11[iter_41_2])
	end

	for iter_41_3 = #var_41_12, 1, -1 do
		table.insert(var_41_8, var_41_12[iter_41_3])
	end

	FrontEndScene.RequestBodyModels(var_41_7)
	FrontEndScene.RequestHeadModels(var_41_6)
	FrontEndScene.RequestWeaponWorldModels(var_41_8)

	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("lui_show_operator_streaming_requests") then
		Lobby.DumpStreamingRequests(var_41_7, var_41_6)
	end

	local var_41_33 = 2

	if var_41_4 then
		var_41_33 = Lobby.GetLocalClientTeam() == var_41_4 and 2 or 1
	end

	local var_41_34 = false

	for iter_41_4 = 0, var_41_16 do
		local var_41_35 = var_41_14:GetDataSourceAtIndex(iter_41_4, arg_41_0)
		local var_41_36 = var_41_35.isMyPlayer:GetValue(arg_41_0)
		local var_41_37 = var_41_2.clientCharacterContainer[iter_41_4 + 1]
		local var_41_38 = var_41_9[iter_41_4 + 1]
		local var_41_39 = true

		if var_41_4 then
			var_41_39 = var_41_35.team:GetValue(arg_41_0) == var_41_4
		end

		if var_41_39 then
			if var_41_36 and not var_41_34 then
				var_41_38.characterIndex = var_41_0

				Lobby.UpdateLocalClientCharacter(arg_41_0, var_41_0, var_41_38.body, var_41_38.head, iter_41_4 + 1, var_41_37, var_41_38.primary, var_41_38.secondary, var_41_17, var_41_38.pet)

				var_41_34 = true
			else
				local var_41_40 = FrontEndScene.LobbyCharacters[var_41_33]

				if var_41_40 then
					var_41_38.characterIndex = var_41_40

					Lobby.UpdateLocalClientCharacter(arg_41_0, var_41_40, var_41_38.body, var_41_38.head, iter_41_4 + 1, var_41_37, var_41_38.primary, var_41_38.secondary, nil, var_41_38.pet)
				end

				var_41_33 = var_41_33 + 1
			end
		end
	end

	FrontEndScene.HideAllLobbyCharactersPastIndex(var_41_33)

	return var_41_9
end

function Lobby.CheckTURequirement(arg_42_0, arg_42_1)
	if Engine.BHFDJFGJHD() then
		LUI.FlowManager.RequestPopupMenu(arg_42_0, "TURequiredWarning", false, arg_42_1, false)
	end
end

function Lobby.ClearMatchData()
	Engine.CFHFFAIEAF()
end

function Lobby.AreWePrivatePartyHost()
	return Lobby.GFFECBCCF() and Lobby.BGIADHIHAG()
end

function Lobby.IsOurPrivatePartyHostInLobby()
	local var_45_0 = Lobby.GFFECBCCF()
	local var_45_1 = Lobby.BGIADHIHAG()
	local var_45_2 = Lobby.DFCFDHBBHH()

	return var_45_0 and not var_45_1 and var_45_2
end

function Lobby.IsSplitScreenEnabled()
	local var_46_0 = Engine.JEDFGECDJ() > 1
	local var_46_1 = Engine.BJIBIJHDFJ()

	return var_46_0 or var_46_1
end

function Lobby.IsVotingFinished()
	local var_47_0 = Lobby.BFFJAJFBDH()
	local var_47_1 = Dvar.IBEGCHEFE("MPKKNQPOQO") and Dvar.IBEGCHEFE("party_teamBased")
	local var_47_2 = Lobby.GAHGHDBIA(MapVoting.MapA.refNum)
	local var_47_3 = Lobby.GAHGHDBIA(MapVoting.MapB.refNum)
	local var_47_4 = Lobby.GAHGHDBIA(MapVoting.MapC.refNum)
	local var_47_5 = Lobby.CGAFFFJBCD(MapVoting.MapA.refNum)
	local var_47_6 = Lobby.CGAFFFJBCD(MapVoting.MapB.refNum)
	local var_47_7 = Lobby.CGAFFFJBCD(MapVoting.MapC.refNum)
	local var_47_8 = var_47_2 == var_47_3 == var_47_4 and var_47_5 == var_47_6 == var_47_7

	return var_47_0 or var_47_1 or var_47_8
end

function Lobby.VoteForMap(arg_48_0, arg_48_1, arg_48_2)
	assert(arg_48_2 == MapVoting.MapA.voteIndex or arg_48_2 == MapVoting.MapB.voteIndex or arg_48_2 == MapVoting.MapC.voteIndex)

	if Engine.BFBIDEGDFB then
		local var_48_0 = LUI.FlowManager.GetScopedData(arg_48_0)
		local var_48_1 = Engine.BFBIDEGDFB()

		if var_48_0.voteDelayEndTime and var_48_1 < var_48_0.voteDelayEndTime then
			local var_48_2 = var_48_0.voteCount or 1

			arg_48_0:dispatchEventToRoot({
				name = "set_button_info_text",
				text = Engine.CBBHFCGDIC("@PATCH_MENU/WAIT_TO_VOTE", var_48_2)
			})

			return
		end

		if not var_48_0.voteCount then
			var_48_0.voteCount = 1
		elseif var_48_0.voteCount < 6 then
			var_48_0.voteCount = var_48_0.voteCount + 1
		end

		var_48_0.voteDelayEndTime = Engine.BFBIDEGDFB() + 1000 * var_48_0.voteCount
	end

	local var_48_3 = "xpartyvote " .. arg_48_2

	Engine.EBIDFIDHIE(var_48_3, arg_48_1)
end

function Lobby.OpenAfterActionReport(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	if Engine.DBAEJAHFGJ(arg_49_0) then
		arg_49_1 = true
	end

	local var_49_0 = AAR.IsMatchClientDataAvailable()
	local var_49_1 = IsPrivateMatch() and not CONDITIONS.IsTrialGameType()

	if arg_49_4 then
		var_49_0 = true
	end

	if var_49_0 and (var_49_1 or IsSystemLink()) then
		InitAARDataSources(arg_49_0)

		var_49_0 = AAR.IsScoreboardDataValid(arg_49_0)
	end

	if var_49_0 then
		local var_49_2 = LUI.FlowManager.GetVisibleMenu()

		if var_49_2 and var_49_2.id == "AARContainer" then
			var_49_2:AARSetUp(arg_49_0, {
				controller = arg_49_0,
				onlyLeaderboard = arg_49_1,
				fromMatch = arg_49_2,
				isCPPoints = arg_49_3
			})
		else
			LUI.FlowManager.RequestAddMenu("AARContainer", true, arg_49_0, false, {
				controller = arg_49_0,
				onlyLeaderboard = arg_49_1,
				fromMatch = arg_49_2,
				isCPPoints = arg_49_3
			})
		end
	end
end

function Lobby.SetupReopenAAR(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_2 and AAR.IsMatchClientDataAvailable()

	if var_50_0 and (IsPrivateMatch() or IsSystemLink()) then
		InitAARDataSources(arg_50_1)

		var_50_0 = AAR.IsScoreboardDataValid(arg_50_1)
	end

	if var_50_0 then
		local var_50_1 = "LUA_MENU/GAME_SUMMARY"

		if CONDITIONS.IsThirdGameMode() and IsSystemLink() then
			var_50_1 = "AAR/SCOREBOARD"
		elseif CONDITIONS.IsCoreMultiplayer() and (IsPrivateMatch() or IsSystemLink()) then
			var_50_1 = "AAR/SCOREBOARD"
		end

		arg_50_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			side = "left",
			priority = 4,
			button_ref = "button_left_trigger",
			helper_text = Engine.CBBHFCGDIC(var_50_1)
		})
		arg_50_0.bindButton:registerEventHandler("button_left_trigger", function(arg_51_0, arg_51_1)
			Lobby.OpenAfterActionReport(arg_51_1.controller, true, false)
		end)

		arg_50_0._buttonSelectAdded = true
	elseif arg_50_0._buttonSelectAdded then
		arg_50_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_left_trigger"
		})
		arg_50_0.bindButton:registerEventHandler("button_left_trigger", nil)

		arg_50_0._buttonSelectAdded = false
	end
end

function Lobby.GetMaxBotLimit()
	local var_52_0 = Lobby.BotLimit

	if Dvar.IBEGCHEFE("splitscreen") then
		var_52_0 = math.max(Lobby.BotLimitForSplitScreen - Engine.JEDFGECDJ(), 0)

		return var_52_0
	end

	if Dvar.IBEGCHEFE("LSTLQTSSRM") == true or Dvar.IBEGCHEFE("LPSPMQSNPQ") == true then
		var_52_0 = math.min(Lobby.BotLimit, Dvar.CFHDGABACF("OOTQKOTRM"))
		var_52_0 = math.max(var_52_0 - Lobby.BHHDDECHII(Lobby.MemberListStates.Lobby), 0)
	end

	return var_52_0
end

function Lobby.ClearAllBots()
	Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 0)
	Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 0)
	Lobby.DGDIGJDHH(Lobby.BotTeams.FFA, 0)
end

function Lobby.FixTeamLimitsAndDifficultiesIfNecessary(arg_54_0, arg_54_1)
	local var_54_0 = tonumber(StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_54_0, CSV.gameTypesTable.cols.teamBased))
	local var_54_1 = tonumber(StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_54_1, CSV.gameTypesTable.cols.teamBased))

	if var_54_0 == 1 and var_54_1 == 0 then
		if Lobby.DGDIGJDHH and Lobby.BEAJCIDDGF then
			local var_54_2 = Lobby.BEAJCIDDGF(Lobby.BotTeams.Friendly)
			local var_54_3 = Lobby.BEAJCIDDGF(Lobby.BotTeams.Enemy)

			if var_54_2 + var_54_3 > Lobby.GetMaxBotLimit() then
				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 0)
				Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 0)
				Lobby.DGDIGJDHH(Lobby.BotTeams.FFA, Lobby.GetMaxBotLimit())
			else
				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 0)
				Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 0)
				Lobby.DGDIGJDHH(Lobby.BotTeams.FFA, var_54_2 + var_54_3)
			end
		end

		if Lobby.BGJCGDFHGA and Lobby.DHBAICDCJC then
			local var_54_4 = Lobby.DHBAICDCJC(Lobby.BotTeams.Enemy)

			Lobby.BGJCGDFHGA(Lobby.BotTeams.FFA, var_54_4)
		end
	end

	if var_54_0 == 0 and var_54_1 == 1 then
		if Lobby.DGDIGJDHH and Lobby.BEAJCIDDGF then
			local var_54_5 = Lobby.GetMaxBotLimit()
			local var_54_6 = Lobby.BEAJCIDDGF(Lobby.BotTeams.FFA)

			if var_54_5 < var_54_6 then
				var_54_6 = var_54_5
			end

			Lobby.DGDIGJDHH(Lobby.BotTeams.FFA, 0)

			if CONDITIONS.IsArenaGameType() then
				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 2)
				Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 2)
			else
				local var_54_7 = math.floor(var_54_6 / 2)

				Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, var_54_7)

				if var_54_6 % 2 == 1 then
					Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, var_54_7 + 1)
				else
					Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, var_54_7)
				end
			end
		end

		if Lobby.BGJCGDFHGA and Lobby.DHBAICDCJC then
			local var_54_8 = Lobby.DHBAICDCJC(Lobby.BotTeams.FFA)

			Lobby.BGJCGDFHGA(Lobby.BotTeams.Friendly, var_54_8)
			Lobby.BGJCGDFHGA(Lobby.BotTeams.Enemy, var_54_8)
		end
	end
end

function Lobby.GetMapIndexByRef(arg_55_0)
	if not arg_55_0 or #arg_55_0 == 0 then
		return
	end

	for iter_55_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		if arg_55_0 == Lobby.CJEHDHDGBH(iter_55_0) then
			return iter_55_0
		end
	end
end

function Lobby.GetGameTypesTableForMapIndex(arg_56_0)
	if not arg_56_0 then
		return
	end

	local var_56_0 = Lobby.DIIFDCEJJ(arg_56_0)
	local var_56_1 = string.gsub(var_56_0, ",", "")

	return (LUI.KeyValueSplit(var_56_1, " "))
end

function Lobby.GetCurrentGameType()
	local var_57_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")

	if MatchRules.EAIEFBHGJ() then
		var_57_0 = MatchRules.BIJEDCBCBH("gametype")
	end

	return var_57_0
end

function Lobby.GetCurrentGameTypeName()
	local var_58_0 = Lobby.GetCurrentGameType()
	local var_58_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_58_0, CSV.gameTypesTable.cols.name)

	return Engine.CBBHFCGDIC(var_58_1)
end

function Lobby.DoesCurrentGameTypeSupportCrossplay()
	return Lobby.GetCurrentGameType() ~= CP.WAVE_SURVIVAL
end

function Lobby.IsCurrentGameTypeteamBased()
	local var_60_0 = Lobby.GetCurrentGameType()
	local var_60_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_60_0, CSV.gameTypesTable.cols.teamBased)

	if #var_60_1 > 0 then
		return tonumber(var_60_1) > 0
	end

	return 0
end

function Lobby.IsCurrentGameTypeRoundBased()
	local var_61_0 = Lobby.GetCurrentGameType()
	local var_61_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_61_0, CSV.gameTypesTable.cols.isRoundBased)

	if #var_61_1 > 0 then
		return tonumber(var_61_1) > 0
	end

	return 0
end

function Lobby.RefreshMLGRules(arg_62_0, arg_62_1)
	local var_62_0 = MatchRules.BIJEDCBCBH("cwlRulesEnabled")

	if var_62_0 ~= nil and var_62_0 then
		MLG.SetUsingMLGRules(true)
	end
end

function Lobby.OpenWarzonePrivateMatchLobby(arg_63_0)
	LUI.FlowManager.RequestAddMenu("WarzonePrivateMatchLobby", false, arg_63_0.controllerIndex, false, {})
	Lobby.createNVidiaGroup("MW_Highlights")
end

function Lobby.OpenPrivateMatchLobby(arg_64_0)
	Engine.DAGFFDGFII(CoD.GetMPOnlineCfg(), arg_64_0.controller)

	if Engine.ECHCFGDDDF() then
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
		LUI.FlowManager.RequestAddMenu("PrivateMatchLobby", false, arg_64_0.controller, false, {})
	else
		Engine.EBIDFIDHIE(CPConfig.default_aliens, arg_64_0.controller)
		LUI.FlowManager.RequestAddMenu("CPPrivateMatchLobby", false, arg_64_0.controller, false, {})
	end

	Lobby.createNVidiaGroup("MW_Highlights")
end

function Lobby.OpenGameBattlesLobby(arg_65_0)
	Engine.DAGFFDGFII(MPConfig.default_online, arg_65_0)
	LUI.FlowManager.RequestAddMenu("GameBattlesMatchLobby", false, arg_65_0, false, {})
	Lobby.createNVidiaGroup("MW_Highlights")
end

function Lobby.GetLobbyMemberDataSourceAtIndex(arg_66_0)
	local function var_66_0(arg_67_0)
		return StringTable.CBGJCDIHCE(CSV.zombieConsumableItems.File, arg_67_0, CSV.zombieConsumableItems.Cols.Icon)
	end

	local function var_66_1(arg_68_0)
		return StringTable.CBGJCDIHCE(CSV.cpFieldUpgrades.file, arg_68_0, CSV.cpFieldUpgrades.cols.ref)
	end

	local function var_66_2(arg_69_0)
		local var_69_0 = StringTable.CBGJCDIHCE(CSV.zombieConsumableItems.file, arg_69_0, CSV.zombieConsumableItems.cols.ref)

		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.ref, var_69_0, CSV.munitions.cols.name))
	end

	local function var_66_3(arg_70_0)
		local var_70_0 = StringTable.CBGJCDIHCE(CSV.zombieConsumableItems.file, arg_70_0, CSV.zombieConsumableItems.cols.ref)

		return StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.ref, var_70_0, CSV.munitions.cols.icon)
	end

	return function(arg_71_0, arg_71_1, arg_71_2)
		local var_71_0 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".rank")
		local var_71_1 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".prestige")
		local var_71_2 = Rank.MakeRankIconAggregateFunction(var_71_0, var_71_1)
		local var_71_3 = LUI.AggregateDataSource.new(var_71_0, {
			var_71_0,
			var_71_1
		}, "rankIcon", var_71_2)
		local var_71_4 = Rank.MakeRankDisplayAggregateFunction(var_71_0, var_71_1, true)
		local var_71_5 = LUI.AggregateDataSource.new(var_71_0, {
			var_71_0,
			var_71_1
		}, "display", var_71_4)
		local var_71_6 = var_71_1:Filter("isMasterPrestige", Rank.IsMasterPrestige)
		local var_71_7 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".microphoneState")
		local var_71_8 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".usingGamepad")
		local var_71_9 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".clanTag")
		local var_71_10 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".gamertag")
		local var_71_11 = LUI.AggregateDataSource.new(var_71_9, {
			var_71_9,
			var_71_10
		}, "fullName", function(arg_72_0)
			return var_71_9:GetValue(arg_72_0) .. " " .. var_71_10:GetValue(arg_72_0)
		end)
		local var_71_12 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".presencePlatform")
		local var_71_13 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".customEmblemEquipped")
		local var_71_14 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".emblemIndex")
		local var_71_15 = LUI.FilteredDataSource.new(var_71_14, "emblem", function(arg_73_0, arg_73_1)
			return StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.index, arg_73_0, CSV.emblems.cols.image)
		end)
		local var_71_16 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".backgroundIndex")
		local var_71_17
		local var_71_18

		if Engine.EAIICIFIFA() then
			local var_71_19 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".zombiesConsumables.slot0Index")
			local var_71_20 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".zombiesConsumables.slot1Index")
			local var_71_21 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".zombiesConsumables.slot2Index")
			local var_71_22 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".zombiesConsumables.slot3Index")
			local var_71_23 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".zombiesConsumables.slot4Index")

			var_71_17 = {
				cardSlot1Icon = var_71_19:Filter("cardSlot1Icon", var_66_3),
				cardSlot2Icon = var_71_20:Filter("cardSlot2Icon", var_66_3),
				cardSlot3Icon = var_71_21:Filter("cardSlot3Icon", var_66_3),
				cardSlot4Icon = var_71_22:Filter("cardSlot4Icon", var_66_3),
				cardSlot5Icon = var_71_23:Filter("cardSlot5Icon", var_66_3)
			}
			var_71_18 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".cpFieldUpgradeRowNum"):Filter("cpFieldUpgrade", var_66_1)
		end

		local var_71_24 = arg_66_0 .. "." .. arg_71_1 .. ".weaponSetup."
		local var_71_25 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. ".weaponCount")
		local var_71_26 = LUI.DataSourceFromList.new(var_71_25)

		function var_71_26.MakeDataSourceAtIndex(arg_74_0, arg_74_1)
			local var_74_0 = LUI.DataSourceInGlobalModel.new(var_71_24 .. arg_74_1 .. ".stickerCount")
			local var_74_1 = LUI.DataSourceFromList.new(var_74_0)

			function var_74_1.MakeDataSourceAtIndex(arg_75_0, arg_75_1)
				return {
					stickerID = LUI.DataSourceInGlobalModel.new(var_71_24 .. arg_74_1 .. ".sticker." .. arg_75_1)
				}
			end

			local var_74_2 = LUI.DataSourceInGlobalModel.new(var_71_24 .. ".attachmentCount")
			local var_74_3 = LUI.DataSourceFromList.new(var_74_2)

			function var_74_3.MakeDataSourceAtIndex(arg_76_0, arg_76_1)
				return {
					variantID = LUI.DataSourceInGlobalModel.new(var_71_24 .. arg_74_1 .. ".attachment." .. arg_76_1 .. ".variant"),
					attachment = LUI.DataSourceInGlobalModel.new(var_71_24 .. arg_74_1 .. ".attachment." .. arg_76_1 .. ".attachment")
				}
			end

			return {
				weaponLootID = LUI.DataSourceInGlobalModel.new(var_71_24 .. arg_74_1 .. ".weaponLootID"),
				cosmeticAttachment = LUI.DataSourceInGlobalModel.new(var_71_24 .. arg_74_1 .. ".cosmeticAttachment"),
				weaponCamo = LUI.DataSourceInGlobalModel.new(var_71_24 .. arg_74_1 .. ".weaponCamo"),
				stickers = var_74_1,
				attachments = var_74_3
			}
		end

		local var_71_27 = {}
		local var_71_28 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".followersCount")
		local var_71_29 = var_71_28:GetValue(arg_71_2)

		for iter_71_0 = 0, var_71_29 - 1 do
			local var_71_30 = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".followers." .. iter_71_0)

			table.insert(var_71_27, iter_71_0, var_71_30)
		end

		return {
			memberIndex = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".memberIndex"),
			controllerIndex = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".controllerIndex"),
			isMyPlayer = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".isMyPlayer"),
			xuid = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".xuid"),
			platformId = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".platformId"),
			isLobbyHost = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".isLobbyHost"),
			isVisible = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".isVisible"),
			team = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".team"),
			squad = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".squad"),
			desiredTeam = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".desiredTeam"),
			selectedOperatorIndex = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".selectedOperatorIndex"),
			bodyWest = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".bodyWest"),
			bodyEast = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".bodyEast"),
			headWest = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".headWest"),
			headEast = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".headEast"),
			execWest = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".execWest"),
			execEast = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".execEast"),
			weapons = var_71_26,
			rank = var_71_0,
			prestige = var_71_1,
			usingGamepad = var_71_8,
			gamertag = var_71_10,
			missingGamertag = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".missingGamertag"),
			clanTag = var_71_9,
			fullName = var_71_11,
			displayRank = var_71_5,
			rankIcon = var_71_3,
			isMasterPrestige = var_71_6,
			microphoneState = var_71_7,
			microphoneIcon = var_71_7:Filter("icon", Mic.GetIcon),
			microphoneAlpha = var_71_7:Filter("alpha", Mic.GetIconAlpha),
			subparty = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".subparty"),
			isPrivatePartyHost = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".isPrivatePartyHost"),
			presencePlatform = var_71_12,
			customEmblemEquipped = var_71_13,
			emblemIndex = var_71_14,
			emblem = var_71_15,
			backgroundIndex = var_71_16,
			background = var_71_16:Filter("background", CallingCardUtils.GetCardTexture),
			zombiesConsumables = var_71_17,
			cpFieldUpgrade = var_71_18,
			commitReady = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".commitReady"),
			followersCount = var_71_28,
			followers = var_71_27,
			followerIndex = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".followerIndex"),
			isCrossplayPlayer = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".isCrossplayPlayer"),
			isPlaceHolderPlayer = LUI.DataSourceInGlobalModel.new(arg_66_0 .. "." .. arg_71_1 .. ".isPlaceHolderPlayer")
		}
	end
end

function Lobby.AddToggleJoinableButtonHelper(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = Lobby.DJJCFGDGGC(arg_77_1)

	if var_77_0 ~= arg_77_0._isInviteOnly or arg_77_0._isInviteOnly == nil then
		arg_77_0._isInviteOnly = var_77_0

		if var_77_0 then
			arg_77_0:AddButtonHelperText({
				clickable = true,
				priority = 1000,
				side = "left",
				ignoreTooltipPrompt = true,
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/LOBBY_ALLOW_JOIN")
			})
		else
			arg_77_0:AddButtonHelperText({
				clickable = true,
				priority = 1000,
				side = "left",
				ignoreTooltipPrompt = true,
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/LOBBY_BLOCK_JOIN")
			})
		end

		if LUI.IsLastInputMouseNavigation(arg_77_1) then
			arg_77_0:Wait(1).onComplete = function()
				Engine.HJJJIGAC(arg_77_1)
			end
		end
	end

	if arg_77_2 then
		arg_77_0:Wait(1000).onComplete = function()
			return Lobby.AddToggleJoinableButtonHelper(arg_77_0, arg_77_1, true)
		end
	end
end

function Lobby.CreateToggleJoinableBindButton(arg_80_0, arg_80_1)
	local var_80_0 = LUI.UIBindButton.new()

	var_80_0.id = "toggleJoinableBindButton"

	var_80_0:registerEventHandler("button_alt1", function(arg_81_0, arg_81_1)
		if arg_81_1.qualifier == "keyboard" then
			return
		end

		Lobby.ToggleJoinOnInviteOnly(arg_81_1.controller)
		Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY)

		arg_80_0:Wait(1).onComplete = function()
			return Lobby.AddToggleJoinableButtonHelper(arg_80_0, arg_81_1.controller, false)
		end

		ACTIONS.PlaySoundSetSound(arg_80_0, "selectAlt", false)
	end)
	Lobby.AddToggleJoinableButtonHelper(arg_80_0, arg_80_1, true)
	arg_80_0:addElement(var_80_0)
end

function Lobby.GetMPMapMaterialStreamer()
	local var_83_0 = {}

	for iter_83_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		table.insert(var_83_0, RegisterMaterial(Lobby.EAJBIDDDGF(iter_83_0)))
	end

	local var_83_1 = LUI.UIElement.new()

	var_83_1.id = "MPMapMaterialStreamer"

	var_83_1:SetupImageTableStreamer(var_83_0)

	return var_83_1
end

function Lobby.GetMPMapPreloadStreamer(arg_84_0)
	local var_84_0 = LUI.UIElement.new()

	var_84_0.id = "GetMPMapPreloadStreamer"

	local var_84_1 = LUI.UITimer.new({
		interval = 100,
		event = "update_preload_streamer"
	})

	var_84_1.id = "lobbyTimer"

	var_84_0:addElement(var_84_1)
	var_84_0:registerEventHandler("update_preload_streamer", function(arg_85_0, arg_85_1)
		Lobby.UpdatePreloadStreamer(arg_84_0)
	end)

	return var_84_0
end

function Lobby.SetupSystemLinkDvars(arg_86_0)
	Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)
end

function Lobby.OpenSystemLinkMenu(arg_87_0, arg_87_1)
	if arg_87_1 == nil then
		arg_87_1 = Engine.ECHCFGDDDF()
	end

	Dvar.DHEGHJJJHI("splitscreen", false)
	Lobby.SetupSystemLinkDvars()
	Engine.CDGCBCBAJ("Opening MPSystemLinkMenu", arg_87_0)
	Engine.DAGFFDGFII("xstartprivateparty", arg_87_0)

	local var_87_0 = arg_87_1 and "MPSystemLinkMenu" or "CPSystemLinkMenu"

	LUI.FlowManager.RequestAddMenu(var_87_0, false, arg_87_0, false, {})
end

function Lobby.OpenSystemLinkLobby(arg_88_0, arg_88_1, arg_88_2)
	Lobby.SetupSystemLinkDvars()

	local var_88_0 = arg_88_1 and "MPSystemLinkLobby" or "CPSystemLinkLobby"

	Engine.DAGFFDGFII("xstartprivateparty", arg_88_0)
	MP.ValidateAllPlayersPrivateSquadMembers()
	Dvar.DHEGHJJJHI("LLPNKKORPT", true)
	Engine.CCHAIADBGH()
	LUI.FlowManager.RequestAddMenu(var_88_0, false, arg_88_0, false, {
		isLocalPlayMenuSkipped = arg_88_2
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

function Lobby.GetLocalPlayerDataSource(arg_90_0, arg_90_1)
	local var_90_0, var_90_1, var_90_2 = Lobby.GetMembersListDataSource()

	local function var_90_3(arg_91_0, arg_91_1)
		local var_91_0 = var_90_1:GetDataSourceAtIndex(arg_91_1)

		if var_91_0.isMyPlayer:GetValue(arg_91_0) then
			local var_91_1 = var_91_0.controllerIndex:GetValue(arg_91_0)

			if var_91_1 and var_91_1 == arg_91_0 then
				return var_91_0
			end
		end
	end

	local var_90_4 = var_90_2:GetValue(arg_90_0)

	if arg_90_1 and #arg_90_1 > 0 then
		for iter_90_0 = 0, var_90_4 - 1 do
			local var_90_5 = var_90_1:GetDataSourceAtIndex(iter_90_0)

			if var_90_5 and var_90_5.xuid:GetValue(arg_90_0) == arg_90_1 then
				return var_90_5
			end
		end
	else
		for iter_90_1 = 0, var_90_4 - 1 do
			local var_90_6 = var_90_3(arg_90_0, iter_90_1)

			if var_90_6 then
				return var_90_6
			end
		end
	end

	return nil
end

function Lobby.GetPreviousFollowablePlayerNum(arg_92_0)
	local var_92_0, var_92_1 = Lobby.GetMembersListDataSource()

	for iter_92_0 = arg_92_0 - 1, 0, -1 do
		local var_92_2 = var_92_1:GetDataSourceAtIndex(iter_92_0)

		if var_92_2.team:GetValue() ~= Teams.follower then
			return var_92_2.memberIndex:GetValue()
		end
	end
end

function Lobby.GetNextFollowablePlayerNum(arg_93_0)
	local var_93_0, var_93_1, var_93_2 = Lobby.GetMembersListDataSource()
	local var_93_3 = var_93_2:GetValue()

	for iter_93_0 = arg_93_0 + 1, var_93_3 - 1 do
		local var_93_4 = var_93_1:GetDataSourceAtIndex(iter_93_0)

		if var_93_4.team:GetValue() ~= Teams.follower then
			return var_93_4.memberIndex:GetValue()
		end
	end
end

function Lobby.GetFirstFollowablePlayerNum(arg_94_0)
	return Lobby.GetPreviousFollowablePlayerNum(arg_94_0) or Lobby.GetNextFollowablePlayerNum(arg_94_0)
end

function Lobby.GetModesForCategory(arg_95_0)
	local var_95_0 = {}

	if arg_95_0 == Lobby.gameModeCategories.MYMODES then
		local var_95_1 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.COUNT)

		if var_95_1 == nil then
			local var_95_2 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.ERROR_CODE) or -1

			if var_95_2 ~= -1 then
				LUI.FlowManager.RequestPopupMenu(self, "CustomModeDataErrorPopup", false, controllerIndex, false, MP.MatchRulesErrorCodeMessage[var_95_2])
			end

			var_95_1 = 0
		end

		if var_95_1 >= 0 then
			for iter_95_0 = 0, var_95_1 - 1 do
				local var_95_3 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_95_0, MP.MatchRulesSaveHeaderLookup.GAMETYPE_RAW)

				if var_95_3 ~= "" then
					if not (StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_95_3, CSV.gameTypesTable.cols.hideInUI) == "1") or CONDITIONS.AreDevFeaturesEnabled() then
						local var_95_4 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_95_3, CSV.gameTypesTable.cols.image)
						local var_95_5 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_95_3, CSV.gameTypesTable.cols.CDLImage)
						local var_95_6 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_95_0, MP.MatchRulesSaveHeaderLookup.GAMETYPE_FULL))
						local var_95_7 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_95_0, MP.MatchRulesSaveHeaderLookup.NAME)
						local var_95_8 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_95_0, MP.MatchRulesSaveHeaderLookup.DESCRIPTION))
						local var_95_9 = Engine.JCBDICCAH(MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, iter_95_0, MP.MatchRulesSaveHeaderLookup.TIMESTAMP))
						local var_95_10 = {
							ref = var_95_3,
							category = Lobby.gameModeCategories.MYMODES,
							name = var_95_7,
							desc = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_DESCRIPTION", var_95_8, var_95_6, var_95_9),
							image = RegisterMaterial(var_95_4),
							CDLImage = RegisterMaterial(var_95_5)
						}

						var_95_10.isMLGMode = false

						table.insert(var_95_0, var_95_10)
					end
				else
					local var_95_11 = {
						category = Lobby.gameModeCategories.MYMODES,
						name = Engine.CBBHFCGDIC("LUA_MENU/CORRUPTED_MODE"),
						desc = Engine.CBBHFCGDIC("LUA_MENU/ERROR_GETTING_DATA")
					}

					table.insert(var_95_0, var_95_11)
				end
			end
		end
	else
		for iter_95_1 = 0, StringTable.BFHCAIIDA(CSV.gameTypesTable.file) - 1 do
			local var_95_12 = CSV.ReadRow(CSV.gameTypesTable, iter_95_1)

			if var_95_12.hideInUI ~= "1" or CONDITIONS.AreDevFeaturesEnabled() then
				var_95_12.name = Engine.CBBHFCGDIC(var_95_12.name)
				var_95_12.desc = Engine.CBBHFCGDIC(var_95_12.desc)
				var_95_12.image = RegisterMaterial(var_95_12.image)
				var_95_12.CDLImage = RegisterMaterial(var_95_12.CDLImage)

				if CONDITIONS.IsWeGameGovBanned() then
					if tonumber(var_95_12.wegame) == 1 then
						var_95_12.isMLGMode = false

						table.insert(var_95_0, var_95_12)
					end
				elseif tonumber(var_95_12.MLG) == 1 and arg_95_0 == Lobby.gameModeCategories.CWL then
					var_95_12.isMLGMode = true

					table.insert(var_95_0, var_95_12)
				elseif var_95_12.category == arg_95_0 then
					var_95_12.isMLGMode = false

					table.insert(var_95_0, var_95_12)
				end
			end
		end
	end

	return var_95_0
end

function Lobby.GetAcceptableTeams(arg_96_0, arg_96_1)
	local var_96_0 = {
		Teams.free
	}

	if CONDITIONS.IsTeamBasedGameType() then
		if MP_COMMON.IsMatchRulesTeamAssignmentEnabled() then
			table.insert(var_96_0, Teams.allies)
			table.insert(var_96_0, Teams.axis)
		end

		if CODCASTER.CanCODCast() then
			local var_96_1 = Lobby.GetCurrentGameType()
			local var_96_2 = Lobby.GetModesForCategory(Lobby.gameModeCategories.STANDARD)

			for iter_96_0, iter_96_1 in ipairs(var_96_2) do
				if iter_96_1.ref == var_96_1 then
					if MLG.DBIBHEAEGD() and not Dvar.IBEGCHEFE("lui_cdl_all_roles_enabled") then
						var_96_0 = {
							Teams.spectator
						}
					else
						table.insert(var_96_0, Teams.spectator)
					end

					if Dvar.IBEGCHEFE("LQNKRLQTLM") and not Lobby.DFFFFJHCEH() then
						local var_96_3 = Lobby.GetFirstFollowablePlayerNum(0)

						if CODCASTER.CanFollow() and arg_96_0 == 0 and (arg_96_1 == Teams.follower or var_96_3) then
							table.insert(var_96_0, Teams.follower)
						end
					end

					break
				end
			end
		end
	end

	return var_96_0
end

function Lobby.TryNavigateToLobby(arg_97_0, arg_97_1)
	if not Engine.CGABICJHAI() or not ShaderUpload.DDBFFCFJJJ() or not ShaderUpload.CEIBACCEAF() or Engine.DIEEIEFCFF() and Dvar.IBEGCHEFE("MRTNMPRLKR") then
		arg_97_0(arg_97_1)
	else
		LUI.FlowManager.RequestPopupMenu(nil, "CancelShaderUploadDialog", false, nil, false, {
			onCancelUpload = arg_97_0
		}, nil, true, true)
	end
end

function Lobby.SplitScreenChecksPassed(arg_98_0, arg_98_1, arg_98_2)
	local function var_98_0()
		if Engine.JEDFGECDJ() > 1 then
			arg_98_1 = Lobby.KickSplitScreenPlayerAndGetActiveController(arg_98_1)
		end

		if Engine.BJIBIJHDFJ() then
			LUI.FlowManager.RequestPopupMenu(arg_98_0, "OpeningMenuWithSplitscreenPartyMemberWarning", true, arg_98_1, false)
		else
			arg_98_2()
		end
	end

	if Engine.JEDFGECDJ() > 1 then
		LUI.FlowManager.RequestPopupMenu(arg_98_0, "OpeningMenuWithSplitscreenWarning", true, arg_98_1, false, {
			yesAction = var_98_0
		})

		return false
	else
		LUI.FlowManager.RequestPopupMenu(arg_98_0, "OpeningMenuWithSplitscreenPartyMemberWarning", true, arg_98_1, false)

		return false
	end

	return true
end

local function var_0_0()
	local var_100_0 = Engine.IJEBHJIJF()
	local var_100_1 = false

	if Lobby.IsSplitScreenEnabled() then
		var_100_1 = Engine.BGDHBAFGCG()

		if var_100_1 then
			local var_100_2 = Engine.IJEBHJIJF()

			Engine.CDGCBCBAJ("Kicked splitscreen player", var_100_2)
		end
	end

	return var_100_1
end

function Lobby.KickSplitScreenPlayerAndGetActiveController(arg_101_0)
	local var_101_0 = Lobby.IsSplitScreenEnabled()
	local var_101_1 = -1
	local var_101_2 = false

	if var_101_0 then
		var_101_1 = Engine.CAGFAECIIG(1)
		var_101_2 = var_0_0()
	end

	local var_101_3 = Engine.IJEBHJIJF()

	if var_101_0 and var_101_2 and arg_101_0 == var_101_1 then
		Engine.DAGFFDGFII("xstartprivateparty")
		LUI.FlowManager.RequestPopupMenu(self, "RemoveSelfSplitscreenPlayerPopup", false, var_101_3, false, nil, nil, nil, true)

		return -1
	end

	return var_101_3
end

function Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_102_0, arg_102_1)
	local var_102_0 = Lobby.IsSplitScreenEnabled()
	local var_102_1 = Engine.IJEBHJIJF()

	if var_102_0 then
		var_102_1 = Lobby.KickSplitScreenPlayerAndGetActiveController(arg_102_0)
	end

	local var_102_2 = "xstopprivateparty" .. " " .. (arg_102_1 and "1" or "0") .. " " .. "1"

	Engine.DAGFFDGFII(var_102_2)
	Engine.DAGFFDGFII("xstartprivateparty")

	return var_102_1
end

function Lobby.UpdatePreloadStreamer(arg_103_0)
	local var_103_0 = string.lower(Lobby.GetCurrentGameType())
	local var_103_1 = CONDITIONS.IsThirdGameMode() and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "" and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "none" and Dvar.DHEEJCCJBH("PTNOLQOOP") or Dvar.DHEEJCCJBH("NSQLTTMRMP")
	local var_103_2 = {
		0,
		0,
		20000
	}

	if var_103_0 == "brtdm" then
		local var_103_3 = Dvar.GDDCIAIIG("scr_brtdm_circle_center")

		if var_103_3 ~= nil then
			var_103_2 = var_103_3
		else
			var_103_2 = {
				0,
				0,
				20000
			}
		end
	elseif var_103_1 == "mp_quarry2" then
		var_103_2 = {
			28912,
			41612,
			2500
		}
	elseif var_103_1 == "mp_farms2_gw" then
		var_103_2 = {
			48031,
			-13331,
			2500
		}
	elseif var_103_1 == "mp_port2_gw" then
		var_103_2 = {
			34946,
			-26957,
			2500
		}
	elseif var_103_1 == "mp_downtown_gw" then
		var_103_2 = {
			22818,
			-33766,
			2500
		}
	elseif var_103_1 == "mp_layover_gw" then
		var_103_2 = {
			-24579,
			23071,
			2500
		}
	elseif var_103_1 == "mp_boneyard_gw" then
		var_103_2 = {
			-27276,
			-13058,
			2500
		}
	elseif var_103_1 == "cp_arms_dealer" then
		var_103_2 = {
			-18361,
			1476,
			-90
		}
	elseif var_103_1 == "cp_armsdealer_2" then
		var_103_2 = {
			-18889,
			8375,
			-214
		}
	elseif var_103_1 == "cp_landlord" then
		var_103_2 = {
			-16359,
			-4457,
			1674
		}
	elseif var_103_1 == "cp_landlord_2" then
		var_103_2 = {
			4144,
			61394,
			825
		}
	elseif var_103_1 == "cp_dwn_twn_2" then
		var_103_2 = {
			19472,
			-21569,
			42
		}
	elseif var_103_1 == "hvt_launderer_2" then
		var_103_2 = {
			30019,
			-7362,
			-358
		}
	elseif var_103_1 == "cp_smuggler" then
		var_103_2 = {
			-3864,
			33463,
			264
		}
	elseif var_103_1 == "mp_br_quarry" then
		var_103_2 = {
			28241,
			31030,
			20000
		}
	elseif string.match(var_103_1, "^mp_donetsk[0-9]*") or string.match(var_103_1, "^mp_don[0-9]+") then
		var_103_2 = {
			0,
			0,
			20000
		}
	end

	Engine.BCHFJIJGJD(var_103_2)
end

function Lobby.GetDefaultMapForGameType(arg_104_0)
	return StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_104_0, CSV.gameTypesTable.cols.defaultMap)
end

function Lobby.AttemptOpenBRMenu(arg_105_0, arg_105_1)
	local function var_105_0()
		Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
		Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	end

	local function var_105_1()
		if not CONDITIONS.ArePartiesEnabledInMainMenu() then
			Dvar.DHEGHJJJHI("splitscreen", false)
			Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
		end

		var_105_0()
	end

	local function var_105_2(arg_108_0)
		assert(arg_108_0)
		Engine.CDGCBCBAJ("Pressed a Main Menu button", arg_108_0)
	end

	local function var_105_3(arg_109_0)
		local var_109_0 = Engine.IJEBHJIJF()

		var_105_1()

		if not CONDITIONS.ArePartiesEnabledInMainMenu() then
			var_105_2(var_109_0)
		end

		if not Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(self, var_109_0) then
			local var_109_1 = {
				isMainMenu = false,
				brMainMenuOptions = arg_109_0
			}

			LUI.FlowManager.RequestPopupMenu(nil, "LobbyWarzoneIntroPopup", true, var_109_0, false, var_109_1)
		else
			LUI.FlowManager.RequestAddMenu("BRMainMenu", false, var_109_0, false, arg_109_0)
		end
	end

	if arg_105_1.useStandaloneStore then
		if not Engine.DBAEJAHFGJ(arg_105_0) then
			LUI.FlowManager.RequestAddMenu("BRMainMenuStore", true, arg_105_0, false, arg_105_1)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_105_0, false)
		end
	else
		local var_105_4 = Engine.CGEFDFCIJA()
		local var_105_5 = Engine.CBCEBADAJ(CoD.PlayMode.Core)

		if Dvar.IBEGCHEFE("NPNQOLKSLP") == true then
			local var_105_6 = {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
			}

			LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_105_6, nil, false, true)

			return
		end

		if var_105_5 < var_105_4 then
			LUI.FlowManager.RequestPopupMenu(self, "OpeningMenuWithHighPrivatePartyMemberCountWarning", true, arg_105_0, false, {
				currentCount = var_105_4,
				maxCount = var_105_5
			})
		else
			var_105_3(arg_105_1)
		end
	end
end

function Lobby.AttemptOpenBRTutorial(arg_110_0, arg_110_1, arg_110_2)
	local var_110_0 = false

	local function var_110_1(arg_111_0)
		LUI.FlowManager.RequestAddMenu("LobbyWarzoneTutorial", true, arg_111_0, false, {
			forceLoad = arg_110_2,
			tutorialType = arg_110_1
		}, true)
	end

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() then
		if Engine.JEDFGECDJ() > 1 then
			var_110_0 = true

			LUI.FlowManager.RequestPopupMenu(self, "OpeningMenuWithSplitscreenWarning", true, arg_110_0, false, {
				yesAction = function()
					local var_112_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_110_0, true)

					if var_112_0 >= 0 then
						Lobby.TryNavigateToLobby(var_110_1, var_112_0)
					end
				end
			})
		elseif Lobby.IsNotAloneInPrivateParty() then
			var_110_0 = true

			LUI.FlowManager.RequestPopupMenu(self, "ConfirmShouldBreakupPrivateParty", true, arg_110_0, false, {
				yesAction = function()
					Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_110_0)
					Lobby.TryNavigateToLobby(var_110_1)
				end
			})
		end
	end

	if not var_110_0 then
		Lobby.TryNavigateToLobby(var_110_1)
	end
end

function Lobby.UpdateFillStatus(arg_114_0, arg_114_1)
	local var_114_0 = DataSources.frontEnd.lobby.battleRoyale.fillType:GetValue(arg_114_0)
	local var_114_1 = Lobby.CJHICGEEFD()

	if var_114_0 == nil then
		var_114_0 = var_114_1

		DataSources.frontEnd.lobby.battleRoyale.fillType:SetValue(arg_114_0, var_114_0)
	end

	if var_114_0 ~= var_114_1 then
		Lobby.DAFCJHFFAF(arg_114_0, var_114_0)
	end

	arg_114_1:SetCurrentValue(var_114_0 and Lobby.FillToggleOptions.FILL or Lobby.FillToggleOptions.DONT_FILL)
end

function Lobby.ToggleFill(arg_115_0, arg_115_1, arg_115_2)
	local var_115_0 = DataSources.frontEnd.lobby.battleRoyale.fillType:GetValue(arg_115_0)
	local var_115_1 = arg_115_2 == 1

	if var_115_0 ~= nil and (var_115_0 and not var_115_1 or not var_115_0 and var_115_1) then
		local var_115_2 = not var_115_0

		DataSources.frontEnd.lobby.battleRoyale.fillType:SetValue(arg_115_0, var_115_2)
		Lobby.UpdateFillStatus(arg_115_0, arg_115_1)
	end
end

function Lobby.CreateFillToggleButton(arg_116_0, arg_116_1)
	local var_116_0 = MenuBuilder.BuildRegisteredType("GenericCycleList", {
		wzTheme = true,
		controllerIndex = arg_116_1
	})

	var_116_0.id = "FillToggleButton" .. arg_116_0.id

	var_116_0.GenericOptionButtonBase.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_116_0.Text:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_116_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 52, _1080p * 106)
	var_116_0.GenericOptionButtonBase.Title:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_FILL"))
	var_116_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/FILL"))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(var_116_0, "LongerTitleAR")
	else
		ACTIONS.AnimateSequence(var_116_0, "LongerTitle")
	end

	var_116_0:UpdatePip(1, 2)

	local var_116_1 = {
		wrapAround = true,
		defaultValue = 1,
		labels = {
			Engine.CBBHFCGDIC("LUA_MENU/FILL"),
			Engine.CBBHFCGDIC("LUA_MENU/DONT_FILL")
		},
		action = function(arg_117_0)
			Lobby.ToggleFill(arg_116_1, var_116_0, arg_117_0)
		end
	}

	LUI.AddUIArrowTextButtonLogic(var_116_0, arg_116_1, var_116_1)

	local var_116_2 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	var_116_0:SetButtonDisabled(var_116_2)
	Lobby.UpdateFillStatus(arg_116_1, var_116_0)

	return var_116_0
end
