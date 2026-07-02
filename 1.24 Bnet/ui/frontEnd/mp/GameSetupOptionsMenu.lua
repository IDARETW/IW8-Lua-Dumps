module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("GameSetupOptionsMenu", {
	"host"
})

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0._currentTabIndex

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.tabNamesAndIDs) do
		arg_1_0._currentTabIndex = iter_1_0

		arg_1_0.CategoryOptionsUpdate(arg_1_0.tabNamesAndIDs[iter_1_0].id, true)
	end

	arg_1_0._currentTabIndex = var_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.gameOptionsMenu
	local var_2_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/SET_DEFAULT_CONTROLS"),
		message = Engine.CBBHFCGDIC("PATCH_MENU/RESET_OPTIONS"),
		yesAction = function()
			MatchRules.BCECADEHDA()
			var_2_0.GameSetupCategoryOptions:processEvent({
				name = "refresh_button_values"
			})

			for iter_3_0 = 1, #var_2_0.tabNamesAndIDs do
				ACTIONS.AnimateSequence(var_2_0.Tabs:GetTabAtIndex(iter_3_0), "NotChanged")
			end
		end
	}

	return (MenuBuilder.BuildRegisteredType("PopupYesNo", var_2_1))
end

MenuBuilder.registerType("PopupResetGameOptions", var_0_1)

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.gameOptionsMenu
	local var_4_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_GAME_RULES"),
		message = Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_GAME_RULES_MSG"),
		yesAction = function()
			MLG.SetUsingMLGRules(false)
			MatchRules.CIGFFEAEFD("cwlRulesEnabled", false)
			var_4_0.GameSetupCategoryOptions:processEvent({
				name = "unlock_disabled_buttons"
			})
			var_4_0:RemoveButtonHelperTextFromElement(var_4_0.HelperBar, "button_alt1", "left")
			var_4_0:AddButtonHelperTextToElement(var_4_0.HelperBar, {
				clickable = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SET_DEFAULT_CONTROLS")
			})
		end
	}

	return (MenuBuilder.BuildRegisteredType("PopupYesNo", var_4_1))
end

MenuBuilder.registerType("PopupUnlockGameOptions", var_0_2)

local var_0_3 = {
	Game = 1,
	Player = 2,
	ModeAdvanced = 0,
	Gameplay = 4,
	Team = 3,
	Draft = 5
}

local function var_0_4(arg_6_0, arg_6_1)
	return MatchRules.DBAJHJAHCA(arg_6_0, arg_6_1) ~= MatchRules.BIJEDCBCBH(arg_6_0, arg_6_1)
end

local var_0_5 = {
	LuaMenuMPRulesWeaponTier4 = "LUA_MENU_MP/RULES_WEAPONTIER4",
	LuaMenuMPRulesExtraTimeBonus = "LUA_MENU_MP/RULES_TIME_EXTENSION",
	LuaMenuMPRulesLastStandHealth = "LUA_MENU_MP/RULES_LAST_STAND_HEALTH",
	LuaMenuMPRulesShowEnemyCarrier = "LUA_MENU_MP/RULES_SHOW_ENEMY_CARRIER",
	LuaMenuMPRulesPointsPerKill = "LUA_MENU_MP/RULES_POINTS_PER_KILL",
	LuaMenuMPRulesRushTimerAmount = "LUA_MENU_MP/RULES_RUSH_TIMER_AMOUNT",
	LuaMenuMPRulesRoundRetainStreaks = "LUA_MENU_MP/RULES_ROUND_RETAIN_STREAKS",
	LuaMenuMPRulesGoalProtection = "LUA_MENU_MP/RULES_GOAL_PROTECTION",
	LuaMenuMPRulesCaptureType = "LUA_MENU_MP/RULES_CAPTURE_TYPE",
	LuaMenuMPRulesHoldDurationCenter = "LUA_MENU_MP/RULES_HOLD_DURATION_CENTER",
	LuaMenuMPRulesRoundSwitch = "LUA_MENU_MP/RULES_ROUND_SWITCH",
	LuaMenuMPRulesArenaAttachments = "LUA_MENU_MP/RULES_ARENA_ATTACHMENTS",
	LuaMenuMPRulesWeaponTier2 = "LUA_MENU_MP/RULES_WEAPONTIER2",
	LuaMenuMPRulesInfilSkip = "LUA_MENU_MP/RULES_INFIL_SKIP",
	LuaMenuMPRulesZoneCaptureTime = "LUA_MENU_MP/RULES_ZONE_CAPTURE_TIME",
	LuaMenuMPRules3rdSpectating = "LUA_MENU_MP/RULES_3RDPERSON_SPECTATING",
	LuaMenuMPRulesNumEndGame = "LUA_MENU_MP/RULES_NUM_END_GAME",
	LuaMenuMPRulesTeamAssignmentAllowed = "LUA_MENU_MP/RULES_TEAM_ASSIGNMENT",
	LuaMenuMPRulesWeaponTier6 = "LUA_MENU_MP/RULES_WEAPONTIER6",
	LuaMenuMPRulesBombTimer = "LUA_MENU_MP/RULES_BOMB_TIMER",
	LuaMenuMPRulesWeaponTier5 = "LUA_MENU_MP/RULES_WEAPONTIER5",
	LuaMenuMPRulesPossessionResetCondition = "LUA_MENU_MP/RULES_POSSESSION_RESET_CONDITION",
	LuaMenuMPRulesFlagsRequiredToScore = "LUA_MENU_MP/RULES_FLAGS_REQUIRED_TO_SCORE",
	LuaMenuMPRulesLoadoutChangeRound = "LUA_MENU_MP/RULES_ARENA_LOADOUT_CHANGE_ROUND",
	LuaMenuMPRulesSetback = "LUA_MENU_MP/RULES_SETBACKS",
	LuaMenuMPRulesOneShotKill = "LUA_MENU_MP/RULES_OIC_OSK",
	LuaMenuMPRulesTacticalMode = "LUA_MENU_MP/RULES_TACTICAL_MODE",
	LuaMenuMPRulesRadarAlwaysOn = "LUA_MENU_MP/RULES_RADAR_ALWAYS_ON",
	LuaMenuMPRulesPlantTime = "LUA_MENU_MP/RULES_PLANT_TIME",
	LuaMenuMPRulesAON = "LUA_MENU_MP/RULES_AON",
	LuaMenuMPRulesBountyTimer = "LUA_MENU_MP/RULES_BOUNTY_TIMER",
	LuaMenuMPRulesGiveTKOnTISpawn = "LUA_MENU_MP/RULES_INFECT_GIVE_LETHAL_ON_TI",
	LuaMenuMPRulesEnablePing = "LUA_MENU_MP/RULES_ENABLE_PING",
	LuaMenuMPRulesGoalMoveTimer = "LUA_MENU_MP/RULES_GOAL_MOVE_TIMER",
	LuaMenuMPRulesBankDisable = "LUA_MENU_MP/RULES_BANK_DISABLE",
	LuaMenuMPRulesDefuseTime = "LUA_MENU_MP/RULES_DEFUSE_TIME",
	LuaMenuMPRulesBankTime = "LUA_MENU_MP/RULES_BANK_TIME",
	LuaMenuMPRulesSurvivorPrimaryWeapon = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_PRIMARY_WEAPON",
	LuaMenuMPRulesSurvivorScorePerTick = "LUA_MENU_MP/RULES_SURVIVOR_SCORE_PER_TICK",
	LuaMenuMPRulesFFPunishLimit = "LUA_MENU_MP/RULES_FF_PUNISH_LIMIT",
	LuaMenuMPRulesPPKFlagCarrier = "LUA_MENU_MP/RULES_TDEF_PPK_FLAG_CARRIER",
	LuaMenuMPRulesInfectedPrimaryWeapon = "LUA_MENU_MP/RULES_INFECT_INFECTED_PRIMARY_WEAPON",
	LuaMenuMPRulesPointsPerDeny = "LUA_MENU_MP/RULES_POINTS_PER_DENY",
	LuaMenuMPRulesScoringTime = "LUA_MENU_MP/RULES_SCORE_TIME",
	LuaMenuMPRulesWinLimit = "LUA_MENU_MP/RULES_WIN_LIMIT",
	LuaMenuMPRulesSurvivorSuperTwo = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SUPER_TWO",
	LuaMenuMPRulesEnableInfectedTracker = "LUA_MENU_MP/RULES_ENABLE_TRACKER",
	LuaMenuMPRulesSharedRushTimer = "LUA_MENU_MP/RULES_SHARED_RUSH_TIMER",
	LuaMenuMPRulesLadderIndex = "LUA_MENU_MP/RULES_LADDER",
	LuaMenuMPRulesSpectating = "LUA_MENU_MP/RULES_SPECTATING",
	LuaMenuMPRulesTeamSize = "LUA_MENU_MP/RULES_TEAM_SIZE",
	LuaMenuMPRulesPostGameExfilWeapon = "LUA_MENU_MP/RULES_POST_GAME_EXFIL_WEAPON",
	LuaMenuMPRulesWeaponTier8 = "LUA_MENU_MP/RULES_WEAPONTIER8",
	LuaMenuMPRulesRadarPingTime = "LUA_MENU_MP/RULES_RADAR_PING_TIME",
	LuaMenuMPRulesZoneLifetime = "LUA_MENU_MP/RULES_ZONE_LIFETIME",
	LuaMenuMPRulesCasualScoreStreaks = "LUA_MENU_MP/RULES_CASUAL_SCORE_STREAKS",
	LuaMenuMPRulesRushTimer = "LUA_MENU_MP/RULES_RUSH_TIMER",
	LuaMenuMPRulesDisableMount = "LUA_MENU_MP/RULES_DISABLE_MOUNT",
	LuaMenuMPRulesInfectStreakBonus = "LUA_MENU_MP/RULES_INFECT_STREAK_BONUS",
	LuaMenuMPRulesHQCaptureTime = "LUA_MENU_MP/RULES_HQ_CAPTURE_TIME",
	LuaMenuMPRulesJuggSpeed = "LUA_MENU_MP/RULES_JUGG_SPEED",
	LuaMenuMPRulesWinByTwoEnabled = "LUA_MENU_MP/RULES_WIN_BY_TWO",
	LuaMenuMPRulesRespawnDelay = "LUA_MENU_MP/RULES_RESPAWN_DELAY",
	LuaMenuMPRulesSpawnProtectionTimer = "LUA_MENU_MP/RULES_SPAWN_PROTECTION_TIMER",
	LuaMenuMPRulesSatelliteCount = "LUA_MENU_MP/RULES_SATELLITE_COUNT",
	LuaMenuMPRulesMaxHealth = "LUA_MENU_MP/RULES_MAX_HEALTH",
	LuaMenuMPRulesBrInfilC130 = "LUA_MENU_MP/RULES_BR_INFIL_C130",
	LuaMenuMPRulesLastStandTimer = "LUA_MENU_MP/RULES_LAST_STAND_BLEEDOUT_TIMER",
	LuaMenuMPRulesVampirism = "LUA_MENU_MP/RULES_VAMPIRISM",
	LuaMenuMPRulesInitialAmmoCount = "LUA_MENU_MP/RULES_OIC_INITIAL_AMMO",
	LuaMenuMPRulesRoundScoreLimit = "LUA_MENU_MP/RULES_ROUND_SCORE_LIMIT",
	LuaMenuMPRulesDelayPlayer = "LUA_MENU_MP/RULES_DELAY_PLAYER",
	LuaMenuMPRulesScoreLimit = "LUA_MENU_MP/RULES_SCORE_LIMIT",
	LuaMenuMPRulesInfectedSecondaryWeapon = "LUA_MENU_MP/RULES_INFECT_INFECTED_SECONDARY_WEAPON",
	LuaMenuMPRulesDropTime = "LUA_MENU_MP/RULES_DROP_TIME",
	LuaMenuMPRulesCarrierBonusScore = "LUA_MENU_MP/RULES_CARRIER_BONUS_SCORE",
	LuaMenuMPRulesRoundStartTime = "LUA_MENU_MP/RULES_MATCH_START_TIME_ROUND",
	LuaMenuMPRulesRadarHideShots = "LUA_MENU_MP/RULES_RADAR_HIDE_SHOTS",
	LuaMenuMPRulesEnableMiniMap = "LUA_MENU_MP/RULES_ENABLE_MINIMAP",
	LuaMenuMPRulesRoundStartReadyUp = "LUA_MENU_MP/RULES_ROUND_START_READY_UP",
	LuaMenuMPRulesEnableVariantDZ = "LUA_MENU_MP/RULES_ENABLE_VARIANT_DZ",
	LuaMenuMPRulesZoneTime = "LUA_MENU_MP/RULES_ZONE_TIME",
	LuaMenuMPRulesEscapeTimer = "LUA_MENU_MP/RULES_ESCAPE_TIMER",
	LuaMenuMPRulesPauseTime = "LUA_MENU_MP/RULES_PAUSE_TIME",
	LuaMenuMPRulesHQAdditiveScoring = "LUA_MENU_MP/RULES_HQ_ADDITIVE_SCORING",
	LuaMenuMPRulesCaptureDelayPlayer = "LUA_MENU_MP/RULES_CAPTURE_DELAY_PLAYER",
	LuaMenuMPRulesEquipmentMSProtect = "LUA_MENU_MP/RULES_MATCH_START_LETHAL_PROTECT",
	LuaMenuMPRulesRandomLocationOrder = "LUA_MENU_MP/RULES_RANDOM_LOCATION_ORDER",
	LuaMenuMPRulesSilentPlant = "LUA_MENU_MP/RULES_SILENT_PLANT",
	LuaMenuMPRulesScoreCarry = "LUA_MENU_MP/RULES_SCORE_CARRY",
	LuaMenuMPRulesExtraTime = "LUA_MENU_MP/RULES_EXTRA_TIME",
	LuaMenuMPRulesReviveUseWeapon = "LUA_MENU_MP/RULES_REVIVE_USE_WEAPON",
	LuaMenuMPRulesBankDisableTags = "LUA_MENU_MP/RULES_BANK_DISABLE_TAGS",
	LuaMenuMPRulesOICWeapon = "LUA_MENU_MP/RULES_OIC_WEAPON",
	LuaMenuMPRulesJuggHealth = "LUA_MENU_MP/RULES_JUGG_HEALTH",
	LuaMenuMPRulesWinByTwoMaxRounds = "LUA_MENU_MP/RULES_WIN_BY_TWO_MAX_ROUNDS",
	LuaMenuMPRulesHeadshotsOnly = "LUA_MENU_MP/RULES_HEADSHOTS_ONLY",
	LuaMenuMPRulesCrankedTimer = "LUA_MENU_MP/RULES_CRANKED_TIMER",
	LuaMenuMPRulesStartWeapon = "LUA_MENU_MP/RULES_START_WEAPON",
	LuaMenuMPRulesNumInitialInfected = "LUA_MENU_MP/RULES_INFECT_NUM_INITIAL",
	LuaMenuMPRulesSurvivorTactical = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_TACTICAL",
	LuaMenuMPRulesMatchStartTime = "LUA_MENU_MP/RULES_MATCH_START_TIME_FIRST",
	LuaMenuMPRulesBrInfilConvoy = "LUA_MENU_MP/RULES_BR_INFIL_CONVOY",
	LuaMenuMPRulesWinRule = "LUA_MENU_MP/RULES_WIN_RULE",
	LuaMenuMPRulesPickupTime = "LUA_MENU_MP/RULES_PICKUP_TIME",
	LuaMenuMPRulesObjScalar = "LUA_MENU_MP/RULES_OBJ_SCALAR",
	LuaMenuMPRulesActivationDelayBase = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_BASE",
	LuaMenuMPRulesExfilActiveTimer = "LUA_MENU_MP/RULES_EXFIL_ACTIVE_TIMER",
	LuaMenuMPRulesFlagActivationDelay = "LUA_MENU_MP/RULES_FLAG_ACTIVATION_DELAY",
	LuaMenuMPRulesResetProgress = "LUA_MENU_MP/RULES_RESET_PROGRESS",
	LuaMenuMPRulesHardcore = "LUA_MENU_MP/RULES_HARDCORE",
	LuaMenuMPRulesPracticeRound = "LUA_MENU_MP/RULES_PRACTICE_ROUND",
	LuaMenuMPRulesAllowInputSwap = "LUA_MENU_MP/RULES_ALLOW_INPUT_SWAP",
	LuaMenuMPRulesDisableBattleChatter = "LUA_MENU_MP/RULES_DISABLE_BATTLECHATTER",
	LuaMenuMPRulesDisableAnnouncer = "LUA_MENU_MP/RULES_DISABLE_ANNOUNCER",
	LuaMenuMPRulesAllowSupers = "LUA_MENU_MP/RULES_ALLOW_SUPER",
	LuaMenuMPRulesActivationDelayHalf = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_HALF",
	LuaMenuMPRulesCaptureDurationHalf = "LUA_MENU_MP/RULES_CAPTURE_DURATION_HALF",
	LuaMenuMPRulesSimultaneousDeath = "LUA_MENU_MP/RULES_SIMUL_DEATH",
	LuaMenuMPRulesPointsPerFlag = "LUA_MENU_MP/RULES_POINTS_PER_FLAG",
	LuaMenuMPRulesKillRewardAmmoCount = "LUA_MENU_MP/RULES_OIC_KILL_AMMO",
	LuaMenuMPRulesSpawnDelay = "LUA_MENU_MP/RULES_SPAWN_DELAY",
	LuaMenuMPRulesInfectedSuperTwo = "LUA_MENU_MP/RULES_INFECT_INFECTED_SUPER_TWO",
	LuaMenuMPRulesTeamTimer = "LUA_MENU_MP/RULES_TEAM_TIMER",
	LuaMenuMPRulesPPKTeamNoFlag = "LUA_MENU_MP/RULES_TDEF_PPK_NO_FLAG",
	LuaMenuMPRulesArenaBlastShieldMod = "LUA_MENU_MP/RULES_ARENA_BS_MOD",
	LuaMenuMPRulesInfectedSuper = "LUA_MENU_MP/RULES_INFECT_INFECTED_SUPER",
	LuaMenuMPRulesCaptureDuration = "LUA_MENU_MP/RULES_CAPTURE_DURATION",
	LuaMenuMPRulesArenaLoadouts = "LUA_MENU_MP/RULES_ARENA_LOADOUTS",
	LuaMenuMPRulesJuggLifetime = "LUA_MENU_MP/RULES_JUGG_LIFETIME",
	LuaMenuMPRulesBankDisableTime = "LUA_MENU_MP/RULES_BANK_DISABLE_TIME",
	LuaMenuMPRulesPossessionResetTime = "LUA_MENU_MP/RULES_POSSESSION_RESET_TIME",
	LuaMenuMPRulesScorePerTick = "LUA_MENU_MP/RULES_SCORE_PER_TICK",
	LuaMenuMPRulesEnemyBaseScore = "MP_FRONTEND_ONLY/RULES_ENEMY_BASE_SCORE",
	LuaMenuMPRulesDraftRigTimer = "LUA_MENU_MP/RULES_DRAFT_RIG_TIMER",
	LuaMenuMPRulesWeaponTier7 = "LUA_MENU_MP/RULES_WEAPONTIER7",
	LuaMenuMPRulesBRStartingWeapon = "LUA_MENU_MP/RULES_BR_STARTING_WEAPON",
	LuaMenuMPRulesArenaTacticalTimeMod = "LUA_MENU_MP/RULES_ARENA_TAC_TIME_MOD",
	LuaMenuMPRulesFriendlyFire = "LUA_MENU_MP/RULES_FRIENDLY_FIRE",
	LuaMenuMPRulesHQRandomLocationOrder = "LUA_MENU_MP/RULES_HQ_RANDOM_LOCATION_ORDER",
	LuaMenuMPRulesJuggSwitchTime = "LUA_MENU_MP/RULES_JUGG_SWITCH_TIME",
	LuaMenuMPRulesCDLTuning = "LUA_MENU_MP/CDL_TUNING",
	LuaMenuMPRulesJuggHelper = "LUA_MENU_MP/RULES_JUGG_HELPER",
	LuaMenuMPRulesWaveDelay = "LUA_MENU_MP/RULES_WAVE_DELAY",
	LuaMenuMPRulesBrCircleDamageMultiplier = "LUA_MENU_MP/RULES_BR_CIRCLE_DAMAGE_MULT",
	LuaMenuMPRulesCODCastingEnabled = "CODCASTER/CAPS",
	LuaMenuMPRulesBrInfilHeli = "LUA_MENU_MP/RULES_BR_INFIL_HELI",
	LuaMenuMPRulesIdleResetTime = "LUA_MENU_MP/RULES_IDLE_RESET_TIME",
	LuaMenuMPRulesArenaBlastShieldClamp = "LUA_MENU_MP/RULES_ARENA_BS_CLAMP",
	LuaMenuMPRulesTargetPlayerCycle = "LUA_MENU_MP/RULES_TARGET_PLAYER_CYCLE",
	LuaMenuMPRulesRoundTimeLimit = "LUA_MENU_MP/RULES_ROUND_TIME_LIMIT",
	LuaMenuMPRulesGoalEnableTimer = "LUA_MENU_MP/RULES_GOAL_ENABLE_TIMER",
	LuaMenuMPRulesHQActivationDelay = "LUA_MENU_MP/RULES_HQ_ACTIVATION_DELAY",
	LuaMenuMPRulesKillcamType = "LUA_MENU_MP/RULES_KILLCAM_TYPE",
	LuaMenuMPRulesSurvivorAliveScore = "LUA_MENU_MP/RULES_SURVIVOR_ALIVE_SCORE",
	LuaMenuMPRulesRoundLimit = "LUA_MENU_MP/RULES_ROUND_LIMIT",
	LuaMenuMPRulesOvertimeLimit = "LUA_MENU_MP/RULES_OVERTIME_LIMIT",
	LuaMenuMPRulesBrCircleStartSize = "LUA_MENU_MP/RULES_BR_CIRCLE_START_SIZE",
	LuaMenuMPRulesSetbackStreak = "LUA_MENU_MP/RULES_SETBACK_STREAK",
	LuaMenuMPRulesBankCapture = "LUA_MENU_MP/RULES_BANK_CAPTURE",
	LuaMenuMPRulesAdditiveScoring = "LUA_MENU_MP/RULES_ADDITIVE_SCORING",
	LuaMenuMPRulesPointsHeadshotBonus = "LUA_MENU_MP/RULES_POINTS_HEADSHOT_BONUS",
	LuaMenuMPRulesFriendlyBaseScore = "MP_FRONTEND_ONLY/RULES_FRIENDLY_BASE_SCORE",
	LuaMenuMPRulesBountyBonusScore = "LUA_MENU_MP/RULES_BOUNTY_BONUS_SCORE",
	LuaMenuMPRulesMegaBankBonusKS = "LUA_MENU_MP/RULES_MEGA_BANK_BONUS_KS",
	LuaMenuMPRulesJuggHelperSpeed = "LUA_MENU_MP/JUGG_HELPER_SPEED",
	LuaMenuMPRulesActivationDelayCenter = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_CENTER",
	LuaMenuMPRulesMagCount = "LUA_MENU_MP/RULES_MAG_COUNT",
	LuaMenuMPRulesEnableBrLoot = "LUA_MENU_MP/RULES_ENABLE_BR_LOOT",
	LuaMenuMPRulesPostRoundExtraTimer = "LUA_MENU_MP/RULES_POST_ROUND_EXTRA_TIMER",
	LuaMenuMPRulesHVTTargetCount = "LUA_MENU_MP/RULES_HVT_TARGET_COUNT",
	LuaMenuMPRulesScoreOnTargetPlayer = "LUA_MENU_MP/RULES_SCORE_ON_TARGET_PLAYER",
	LuaMenuMPRulesWeaponTier3 = "LUA_MENU_MP/RULES_WEAPONTIER3",
	LuaMenuMPRulesCMDHVT = "LUA_MENU_MP/RULES_CMD_HVT",
	LuaMenuMPRulesEnemyBaseKillReveal = "LUA_MENU_MP/RULES_ENEMY_BASE_KILL_REVEAL",
	LuaMenuMPRulesPointsPerKillAsJugg = "LUA_MENU_MP/RULES_PPK_AS_JUGG",
	LuaMenuMPRulesHQCaptureDelayPlayer = "LUA_MENU_MP/RULES_HQ_CAPTURE_DELAY_PLAYER",
	LuaMenuMPRulesMultiBomb = "LUA_MENU_MP/RULES_MULTI_BOMB",
	LuaMenuMPRulesWeaponTier1 = "LUA_MENU_MP/RULES_WEAPONTIER1",
	LuaMenuMPRulesCompassHideShots = "LUA_MENU_MP/RULES_COMPASS_HIDE_SHOTS",
	LuaMenuMPRulesCompassHideEnemy = "LUA_MENU_MP/RULES_ENEMY_ON_COMPASS",
	LuaMenuMPRulesLethalDelay = "LUA_MENU_MP/RULES_LETHAL_DELAY",
	LuaMenuMPRulesKillsPerWeapon = "LUA_MENU_MP/RULES_KILLS_PER_WEAPON",
	LuaMenuMPRulesCapRate = "LUA_MENU_MP/RULES_CAP_RATE",
	LuaMenuMPRulesDraftWeaponTimer = "LUA_MENU_MP/RULES_DRAFT_WEAPON_TIMER",
	LuaMenuMPRulesForceRespawn = "LUA_MENU_MP/RULES_FORCE_RESPAWN",
	LuaMenuMPRulesMegaBankLimit = "LUA_MENU_MP/RULES_MEGA_BANK_LIMIT",
	LuaMenuMPRulesCapZone = "LUA_MENU_MP/RULES_ESCAPE_CAP_ZONE",
	LuaMenuMPRulesSurvivorLethal = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_LETHAL",
	LuaMenuMPRulesCrateDropTimer = "LUA_MENU_MP/RULES_CRATE_DROP_TIMER",
	LuaMenuMPRulesSuperPointsMod = "LUA_MENU_MP/RULES_SUPER_POINTS_MOD",
	LuaMenuMPRulesLastStandReviveHealth = "LUA_MENU_MP/RULES_LAST_STAND_REVIVE_HEALTH",
	LuaMenuMPRulesRadarEndGame = "LUA_MENU_MP/RULES_RADAR_END_GAME",
	LuaMenuMPRulesInfectedInitialSecondaryWeapon = "LUA_MENU_MP/RULES_INFECT_INITIAL_SECONDARY_WEAPON",
	LuaMenuMPRulesFlagCaptureTime = "LUA_MENU_MP/RULES_FLAG_CAPTURE_TIME",
	LuaMenuMPRulesHQTimeout = "LUA_MENU_MP/RULES_HQ_TIMEOUT",
	LuaMenuMPRulesHQPauseTime = "LUA_MENU_MP/RULES_HQ_PAUSE_TIME",
	LuaMenuMPRulesRefreshTeamTimerOnReset = "LUA_MENU_MP_RULES_REFRESH_TEAM_TIMER",
	LuaMenuMPRulesInfectedInitialPrimaryWeapon = "LUA_MENU_MP/RULES_INFECT_INITIAL_PRIMARY_WEAPON",
	LuaMenuMPRulesSurvivorScoreTime = "LUA_MENU_MP/RULES_SURVIVOR_SCORE_TIME",
	LuaMenuMPRulesInfectedLethal = "LUA_MENU_MP/RULES_INFECT_INFECTED_LETHAL",
	LuaMenuMPRulesSuicideSpawnDelay = "LUA_MENU_MP/RULES_SUICIDE_SPAWN_DELAY",
	LuaMenuMPRulesHQSelectionDelay = "LUA_MENU_MP/RULES_HQ_SELECTION_DELAY",
	LuaMenuMPRulesPerks = "LUA_MENU_MP/RULES_PERKS",
	LuaMenuMPRulesInfectExtraTimePerKill = "LUA_MENU_MP/RULES_INFECT_EXTRA_TIME_PER_KILL",
	LuaMenuMPRulesArenaObjModifier = "LUA_MENU_MP/RULES_OBJ_MODIFIER",
	LuaMenuMPRulesReturnTime = "LUA_MENU_MP/RULES_RETURN_TIME",
	LuaMenuMPRulesHQLifetime = "LUA_MENU_MP/RULES_HQ_LIFETIME",
	LuaMenuMPRulesArenaSwitchSpawns = "LUA_MENU_MP/RULES_ARENA_SWITCH_SPAWNS",
	LuaMenuMPRulesTimeLimit = "LUA_MENU_MP/RULES_TIME_LIMIT",
	LuaMenuMPRulesSurvivorSuper = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SUPER",
	LuaMenuMPRulesPointsPerJuggOnJuggKill = "LUA_MENU_MP/RULES_PPK_J_ON_J",
	LuaMenuMPRulesBrGulag = "LUA_MENU_MP/RULES_BR_GULAG",
	LuaMenuMPRulesNumberOfLives = "LUA_MENU_MP/RULES_NUMBER_OF_LIVES",
	LuaMenuMPRulesPreCap = "LUA_MENU_MP/RULES_PRE_CAP",
	LuaMenuMPRulesHVTCaptureValue = "LUA_MENU_MP/RULES_HVT_CAPTURE_VALUE",
	LuaMenuMPRulesSurvivorSecondaryWeapon = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SECONDARY_WEAPON",
	LuaMenuMPRulesCaptureDurationBase = "LUA_MENU_MP/RULES_CAPTURE_DURATION_BASE",
	LuaMenuMPRulesArenaWinCondition = "LUA_MENU_MP/RULES_ARENA_WIN_CONDITION",
	LuaMenuMPRulesHoldDurationHalf = "LUA_MENU_MP/RULES_HOLD_DURATION_HALF",
	LuaMenuMPRulesSuperFastChargeRate = "LUA_MENU_MP/RULES_SUPER_FAST_CHARGE_RATE",
	LuaMenuMPRulesPointsPerKSKill = "LUA_MENU_MP/RULES_POINTS_PER_KS_KILL",
	LuaMenuMPRulesMidfieldScore = "MP_FRONTEND_ONLY/RULES_MIDFIELD_SCORE",
	LuaMenuMPRulesNumFlagsScoreOnKill = "LUA_MENU_MP/RULES_NUM_FLAGS_SCORE_KILL",
	LuaMenuMPRulesHoldDurationBase = "LUA_MENU_MP/RULES_HOLD_DURATION_BASE",
	LuaMenuMPRulesEmpSpawn = "LUA_MENU_MP/RULES_EMP_SPAWN",
	LuaMenuMPRulesEnemyDeathLoc = "LUA_MENU_MP/RULES_ENEMY_DEATH_LOCATION",
	LuaMenuMPRulesDetonateScore = "LUA_MENU_MP/RULES_DETONATE_SCORE",
	LuaMenuMPRulesRoundRetainStreakProg = "LUA_MENU_MP/RULES_ROUND_RETAIN_STREAK_PROGRESS",
	LuaMenuMPRulesNumRevives = "LUA_MENU_MP/RULES_NUM_REVIVES",
	LuaMenuMPRulesPostGameExfil = "LUA_MENU_MP/RULES_POST_GAME_EXFIL",
	LuaMenuMPRulesJuggLifetimeEnabled = "LUA_MENU_MP/RULES_JUGG_LIFETIME_ENABLED",
	LuaMenuMPRulesArenaDogTags = "LUA_MENU_MP/RULES_ARENA_DOG_TAGS",
	LuaMenuMPRulesJuggSpawnBehavior = "LUA_MENU_MP/RULES_JUGG_SPAWN_BEHAVIOR",
	LuaMenuMPRulesPersBombTimer = "LUA_MENU_MP/RULES_PERS_BOMB_TIMER",
	LuaMenuMPRulesCMDRules = "LUA_MENU_MP/RULES_CMD_RULES",
	LuaMenuMPRulesCaptureCondition = "LUA_MENU_MP/RULES_CAPTURE_CONDITION",
	LuaMenuMPRulesKillcam = "LUA_MENU_MP/RULES_KILLCAM",
	LuaMenuMPRulesBankRate = "LUA_MENU_MP/RULES_BANK_RATE",
	LuaMenuMPRulesMegaBankBonus = "LUA_MENU_MP/RULES_MEGA_BANK_BONUS",
	LuaMenuMPRulesExfilExtractTimer = "LUA_MENU_MP/RULES_EXFIL_EXTRACT_TIMER",
	LuaMenuMPRulesFlagNeutralization = "LUA_MENU_MP/RULES_FLAG_NEUTRALIZATION",
	LuaMenuMPRulesDraftLoadoutTimer = "LUA_MENU_MP/RULES_DRAFT_LOADOUT_TIMER",
	LuaMenuMPRulesLastStand = "LUA_MENU_MP/RULES_LAST_STAND",
	LuaMenuMPRulesScoreThrow = "LUA_MENU_MP/RULES_SCORE_THROW",
	LuaMenuMPRulesCaptureDurationCenter = "LUA_MENU_MP/RULES_CAPTURE_DURATION_CENTER",
	LuaMenuMPRulesZoneActivationDelay = "LUA_MENU_MP/RULES_ZONE_ACTIVATION_DELAY",
	LuaMenuMPRulesLastStandSuicideTimer = "LUA_MENU_MP/RULES_LAST_STAND_SUICIDE_TIMER",
	LuaMenuMPRulesCarrierBonusTime = "LUA_MENU_MP/RULES_CARRIER_BONUS_TIME",
	LuaMenuMPRulesShowTargetTime = "LUA_MENU_MP/RULES_SHOW_TARGET_TIME",
	LuaMenuMPRulesKillstreaks = "LUA_MENU_MP/RULES_KILLSTREAKS",
	LuaMenuMPRulesFirstZoneActivationDelay = "LUA_MENU_MP/RULES_FIRST_ZONE_ACTIVATION_DELAY",
	LuaMenuMPPrematchCountdown = "LUA_MENU_MP/PREMATCH_COUNTDOWN",
	LuaMenuMPRulesLastStandReviveTimer = "LUA_MENU_MP/RULES_LAST_STAND_REVIVE_TIMER",
	LuaMenuMPRulesDisableSpawnCamera = "LUA_MENU_MP/RULES_DISABLE_SPAWN_CAMERA",
	LuaMenuMPRulesDogTags = "LUA_MENU_MP/RULES_DOG_TAGS",
	LuaMenuMPRulesArenaSpawnFlag = "LUA_MENU_MP/RULES_ARENA_SPAWN_FLAG",
	LuaMenuMPRulesHealthRegen = "LUA_MENU_MP/RULES_HEALTH_REGEN",
	LuaMenuMPRulesActivationDelay = "LUA_MENU_MP/RULES_ACTIVATION_DELAY",
	LuaMenuMPRulesDisableSuperSprint = "LUA_MENU_MP/RULES_DISABLE_SUPER_SPRINT",
	LuaMenuMPRulesBrFightClub = "LUA_MENU_MP/RULES_BR_GULAG",
	LuaMenuMPRulesPointsPerJuggKill = "LUA_MENU_MP/RULES_PPK_KILL_JUGG",
	LuaMenuMPRulesDeathRetainStreaks = "LUA_MENU_MP/RULES_DEATH_RETAIN_STREAKS",
	LuaMenuMPRulesCaptureDecay = "LUA_MENU_MP/RULES_CAPTURE_DECAY",
	LuaMenuMPRulesPointsPerConfirm = "LUA_MENU_MP/RULES_POINTS_PER_CONFIRM",
	LuaMenuMPRulesPPKTeamWithFlag = "LUA_MENU_MP/RULES_TDEF_PPK_TEAM_WITH_FLAG",
	LuaMenuMPRulesGoalType = "LUA_MENU_MP/RULES_GOAL_TYPE",
	LuaMenuMPRulesFirstHQActivationDelay = "LUA_MENU_MP/RULES_FIRST_HQ_ACTIVATION_DELAY",
	LuaMenuMPRulesPracticeMode = "LUA_MENU_MP/RULES_PRACTICE_MODE",
	LuaMenuMPRulesInfectedTactical = "LUA_MENU_MP/RULES_INFECT_INFECTED_TACTICAL",
	LuaMenuMPRulesPointsPerDeath = "LUA_MENU_MP/RULES_POINTS_PER_DEATH"
}
local var_0_6 = {
	LuaMenuMPRulesBRStartingWeaponDesc = "LUA_MENU_MP/RULES_BR_STARTING_WEAPON_DESC",
	LuaMenuMPRulesShowTargetTimeDesc = "LUA_MENU_MP/RULES_SHOW_TARGET_TIME_DESC",
	LuaMenuMPRulesInfilSkipDesc = "LUA_MENU_MP/RULES_INFIL_SKIP_DESC",
	LuaMenuMPRulesKillsPerWeaponDesc = "LUA_MENU_MP/RULES_KILLS_PER_WEAPON_DESC",
	LuaMenuMPRulesCapZoneDesc = "LUA_MENU_MP/RULES_ESCAPE_CAP_ZONE_DESC",
	LuaMenuMPRulesPossessionResetTimeDesc = "LUA_MENU_MP/RULES_POSSESSION_RESET_TIME_DESC",
	LuaMenuMPRulesExtraTimeBonusDesc = "LUA_MENU_MP/RULES_TIME_EXTENSION_DESC",
	LuaMenuMPRulesSetbackDesc = "LUA_MENU_MP/RULES_SETBACKS_DESC",
	LuaMenuMPRulesJuggLifetimeEnabledDesc = "LUA_MENU_MP/RULES_JUGG_LIFETIME_ENABLED_DESC",
	LuaMenuMPRulesEnemyDeathLocDesc = "LUA_MENU_MP/RULES_ENEMY_DEATH_LOCATION_DESC",
	LuaMenuMPRulesBrInfilHeliDesc = "LUA_MENU_MP/RULES_BR_INFIL_HELI_DESC",
	LuaMenuMPRulesHoldDurationBaseDesc = "LUA_MENU_MP/RULES_HOLD_DURATION_BASE_DESC",
	LuaMenuMPRulesCaptureDurationBaseDesc = "LUA_MENU_MP/RULES_CAPTURE_DURATION_BASE_DESC",
	LuaMenuMPRulesActivationDelayHalfDesc = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_HALF_DESC",
	LuaMenuMPRulesJuggHealthDesc = "LUA_MENU_MP/RULES_JUGG_HEALTH_DESC",
	LuaMenuMPRulesZoneLifetimeDesc = "LUA_MENU_MP/RULES_ZONE_LIFETIME_DESC",
	LuaMenuMPRulesBrInfilConvoyDesc = "LUA_MENU_MP/RULES_BR_INFIL_CONVOY_DESC",
	LuaMenuMPRulesRadarEndGameDesc = "LUA_MENU_MP/RULES_RADAR_END_GAME_DESC",
	LuaMenuMPRulesGoalTypeDesc = "LUA_MENU_MP/RULES_GOAL_TYPE_DESC",
	LuaMenuMPRulesGoalEnableTimerDesc = "LUA_MENU_MP/RULES_GOAL_ENABLE_TIMER_DESC",
	LuaMenuMPRulesNumEndGameDesc = "LUA_MENU_MP/RULES_NUM_END_GAME_DESC",
	LuaMenuMPRulesMegaBankLimitDesc = "LUA_MENU_MP/RULES_MEGA_BANK_LIMIT_DESC",
	LuaMenuMPRulesGiveTKOnTISpawnDesc = "LUA_MENU_MP/RULES_INFECT_GIVE_LETHAL_ON_TI_DESC",
	LuaMenuMPRulesLastStandWeaponDesc = "LUA_MENU_MP/RULES_LAST_STAND_WEAPON_DESC",
	LuaMenuMPRulesKillcamDesc = "LUA_MENU_MP/RULES_KILLCAM_DESC",
	LuaMenuMPRulesLastStandTimerDesc = "LUA_MENU_MP/RULES_LAST_STAND_BLEEDOUT_TIMER_DESC",
	LuaMenuMPRulesGoalMoveTimerDesc = "LUA_MENU_MP/RULES_GOAL_MOVE_TIMER_DESC",
	LuaMenuMPRulesWeaponTier7Desc = "LUA_MENU_MP/RULES_WEAPONTIER7_DESC",
	LuaMenuMPRulesWeaponTier6Desc = "LUA_MENU_MP/RULES_WEAPONTIER6_DESC",
	LuaMenuMPRulesPreCapDesc = "LUA_MENU_MP/RULES_PRE_CAP_DESC",
	LuaMenuMPRulesWeaponTier5Desc = "LUA_MENU_MP/RULES_WEAPONTIER5_DESC",
	LuaMenuMPRulesKillstreaksDesc = "LUA_MENU_MP/RULES_KILLSTREAKS_DESC",
	LuaMenuMPRulesLastStandSuicideTimerDesc = "LUA_MENU_MP/RULES_LAST_STAND_SUICIDE_TIMER_DESC",
	LuaMenuMPRulesWeaponTier3Desc = "LUA_MENU_MP/RULES_WEAPONTIER3_DESC",
	LuaMenuMPRulesWeaponTier2Desc = "LUA_MENU_MP/RULES_WEAPONTIER2_DESC",
	LuaMenuMPRulesWinRuleDesc = "LUA_MENU_MP/RULES_WIN_RULE_DESC",
	LuaMenuMPRulesHQPauseTimeDesc = "LUA_MENU_MP/RULES_HQ_PAUSE_TIME_DESC",
	LuaMenuMPRulesCrankedTimerDesc = "LUA_MENU_MP/RULES_CRANKED_TIMER_DESC",
	LuaMenuMPRulesArenaDogTagsDesc = "LUA_MENU_MP/RULES_ARENA_DOG_TAGS_DESC",
	LuaMenuMPRulesTacticalModeDesc = "LUA_MENU_MP/RULES_TACTICAL_MODE_DESC",
	LuaMenuMPRulesEnemyBaseKillRevealDesc = "LUA_MENU_MP/RULES_ENEMY_BASE_KILL_REVEAL_DESC",
	LuaMenuMPRulesEnemyBaseScoreDesc = "MP_FRONTEND_ONLY/RULES_ENEMY_BASE_SCORE_DESC",
	LuaMenuMPRulesLoadoutChangeRoundDesc = "LUA_MENU_MP/RULES_ARENA_LOADOUT_CHANGE_ROUND_DESC",
	LuaMenuMPRulesTimeLimitDesc = "LUA_MENU_MP/RULES_TIME_LIMIT_DESC",
	LuaMenuMPRulesInfectAllowSupersDesc = "LUA_MENU_MP/RULES_INFECT_ALLOW_SUPER_DESC",
	LuaMenuMPRulesBankDisableTimeDesc = "LUA_MENU_MP/RULES_BANK_DISABLE_TIME_DESC",
	LuaMenuMPRulesCODCastingEnabledDesc = "LUA_MENU_MP/RULES_CODCASTER_DESC",
	LuaMenuMPRulesSetbackStreakDesc = "LUA_MENU_MP/RULES_SETBACK_STREAK_DESC",
	LuaMenuMPRulesAONDesc = "LUA_MENU_MP/RULES_AON_DESC",
	LuaMenuMPRulesWeaponTier1Desc = "LUA_MENU_MP/RULES_WEAPONTIER1_DESC",
	LuaMenuMPRulesDraftRigTimerDesc = "LUA_MENU_MP/RULES_DRAFT_RIG_TIMER_DESC",
	LuaMenuMPRulesArenaWinConditionDesc = "LUA_MENU_MP/RULES_ARENA_WIN_CONDITION_DESC",
	LuaMenuMPRulesSurvivorAliveScoreDesc = "LUA_MENU_MP/RULES_SURVIVOR_ALIVE_SCORE_DESC",
	LuaMenuMPRulesBrInfilC130Desc = "LUA_MENU_MP/RULES_BR_INFIL_C130_DESC",
	LuaMenuMPRulesArenaLoadoutsDesc = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_DESC",
	LuaMenuMPRulesAdditiveScoringDesc = "LUA_MENU_MP/RULES_ADDITIVE_SCORING_DESC",
	LuaMenuMPRulesSurvivorSuperTwoDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SUPER_TWO_DESC",
	LuaMenuMPRulesBankDisableTagsDesc = "LUA_MENU_MP/RULES_BANK_DISABLE_TAGS_DESC",
	LuaMenuMPRulesPickupTimeDesc = "LUA_MENU_MP/RULES_PICKUP_TIME_DESC",
	LuaMenuMPRulesInfectedTacticalDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_TACTICAL_DESC",
	LuaMenuMPRulesWinByTwoMaxRoundsDesc = "LUA_MENU_MP/RULES_WIN_BY_TWO_MAX_ROUNDS_DESC",
	LuaMenuMPRulesActivationDelayCenterDesc = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_CENTER_DESC",
	LuaMenuMPRulesEnableInfectedTrackerDesc = "LUA_MENU_MP/RULES_ENABLE_TRACKER_DESC",
	LuaMenuMPRulesFriendlyFireDesc = "LUA_MENU_MP/RULES_FRIENDLY_FIRE_DESC",
	LuaMenuMPRulesArenaSwitchSpawnsDesc = "LUA_MENU_MP/RULES_ARENA_SWITCH_SPAWNS_DESC",
	LuaMenuMPRulesSurvivorScorePerTickDesc = "LUA_MENU_MP_RULES_SURVIVOR_SCORE_PER_TICK_DESC",
	LuaMenuMPRulesBountyBonusScoreDesc = "LUA_MENU_MP/RULES_BOUNTY_BONUS_SCORE_DESC",
	LuaMenuMPRulesForceRespawnDesc = "LUA_MENU_MP/RULES_FORCE_RESPAWN_DESC",
	LuaMenuMPRulesRoundTimeLimitDesc = "LUA_MENU_MP/RULES_ROUND_TIME_LIMIT_DESC",
	LuaMenuMPRulesBrFightClubDesc = "LUA_MENU_MP/RULES_BR_GULAG_DESC",
	LuaMenuMPRulesDefuseTimeDesc = "LUA_MENU_MP/RULES_DEFUSE_TIME_DESC",
	LuaMenuMPRulesNumInitialInfectedDesc = "LUA_MENU_MP/RULES_INFECT_NUM_INITIAL_DESC",
	LuaMenuMPRulesCapRateDesc = "LUA_MENU_MP/RULES_FLAG_CAPTURE_TIME_DESC",
	LuaMenuMPRulesWeaponTier4Desc = "LUA_MENU_MP/RULES_WEAPONTIER4_DESC",
	LuaMenuMPRulesPPKTeamWithFlagDesc = "LUA_MENU_MP/RULES_TDEF_PPK_TEAM_WITH_FLAG_DESC",
	LuaMenuMPRulesCaptureDurationDesc = "LUA_MENU_MP/RULES_CAPTURE_DURATION_DESC",
	LuaMenuMPRulesRandomLocationOrderDesc = "LUA_MENU_MP/RULES_RANDOM_LOCATION_ORDER_DESC",
	LuaMenuMPRulesCaptureConditionDesc = "LUA_MENU_MP/RULES_CAPTURE_CONDITION_DESC",
	LuaMenuMPRulesDraftLoadoutTimerDesc = "LUA_MENU_MP/RULES_DRAFT_LOADOUT_TIMER_DESC",
	LuaMenuMPRulesNumberOfLivesDesc = "LUA_MENU_MP/RULES_NUMBER_OF_LIVES_DESC",
	LuaMenuMPRulesHQLifetimeDesc = "LUA_MENU_MP/RULES_HQ_LIFETIME_DESC",
	LuaMenuMPRulesCompassHideShotsDesc = "LUA_MENU_MP/RULES_COMPASS_HIDE_SHOTS_DESC",
	LuaMenuMPRulesArenaAttachmentsDesc = "LUA_MENU_MP/RULES_ARENA_ATTACHMENTS_DESC",
	LuaMenuMPRulesArenaObjModifierDesc = "LUA_MENU_MP/RULES_OBJ_MODIFIER_DESC",
	LuaMenuMPRulesBankRateDesc = "LUA_MENU_MP/RULES_BANK_RATE_DESC",
	LuaMenuMPRulesRushTimerDesc = "LUA_MENU_MP/RULES_RUSH_TIMER_DESC",
	LuaMenuMPPrematchCountdownDesc = "LUA_MENU_MP/PREMATCH_COUNTDOWN_DESC",
	LuaMenuMPRulesNumFlagsScoreOnKillDesc = "LUA_MENU_MP/RULES_NUM_FLAGS_SCORE_KILL_DESC",
	LuaMenuMPRulesRadarAlwaysOnDesc = "LUA_MENU_MP/RULES_RADAR_ALWAYS_ON_DESC",
	LuaMenuMPRulesPointsPerKillDesc = "LUA_MENU_MP/RULES_POINTS_PER_KILL_DESC",
	LuaMenuMPRulesPointsHeadshotBonusDesc = "LUA_MENU_MP/RULES_POINTS_HEADSHOT_BONUS_DESC",
	LuaMenuMPRulesRoundStartReadyUpDesc = "LUA_MENU_MP/RULES_ROUND_START_READY_UP_DESC",
	LuaMenuMPRulesPointsPerDeathDesc = "LUA_MENU_MP/RULES_POINTS_PER_DEATH_DESC",
	LuaMenuMPRules3rdSpectatingDesc = "LUA_MENU_MP/RULES_3RDPERSON_SPECTATING_DESC",
	LuaMenuMPRulesRoundScoreLimitDesc = "LUA_MENU_MP/RULES_ROUND_SCORE_LIMIT_DESC",
	LuaMenuMPRulesSpawnDelayDesc = "LUA_MENU_MP/RULES_SPAWN_DELAY_DESC",
	LuaMenuMPRulesKillcamTypeDesc = "LUA_MENU_MP/RULES_KILLCAM_TYPE_DESC",
	LuaMenuMPRulesWeaponTier8Desc = "LUA_MENU_MP/RULES_WEAPONTIER8_DESC",
	LuaMenuMPRulesPostGameExfilDesc = "LUA_MENU_MP/RULES_POST_GAME_EXFIL_DESC",
	LuaMenuMPRulesEnableMiniMapDesc = "LUA_MENU_MP/RULES_ENABLE_MINIMAP_DESC",
	LuaMenuMPRulesReturnTimeDesc = "LUA_MENU_MP/RULES_RETURN_TIME_DESC",
	LuaMenuMPRulesPointsPerFlagDesc = "LUA_MENU_MP/RULES_POINTS_PER_FLAG_DESC",
	LuaMenuMPRulesRoundLimitDesc = "LUA_MENU_MP/RULES_ROUND_LIMIT_DESC",
	LuaMenuMPRulesSilentPlantDesc = "LUA_MENU_MP/RULES_SILENT_PLANT_DESC",
	LuaMenuMPRulesMegaBankBonusDesc = "LUA_MENU_MP/RULES_MEGA_BANK_BONUS_DESC",
	LuaMenuMPRulesPauseTimeDesc = "LUA_MENU_MP/RULES_PAUSE_TIME_DESC",
	LuaMenuMPRulesSurvivorScoreTimeDesc = "LUA_MENU_MP_RULES_SURVIVOR_SCORE_TIME_DESC",
	LuaMenuMPRulesPointsPerDenyDesc = "LUA_MENU_MP/RULES_POINTS_PER_DENY_DESC",
	LuaMenuMPRulesScoreCarryDesc = "LUA_MENU_MP/RULES_SCORE_CARRY_DESC",
	LuaMenuMPRulesScoreThrowDesc = "LUA_MENU_MP/RULES_SCORE_THROW_DESC",
	LuaMenuMPRulesCompassHideEnemyDesc = "LUA_MENU_MP/RULES_ENEMY_ON_COMPASS_DESC",
	LuaMenuMPRulesEmpSpawnDesc = "LUA_MENU_MP/RULES_EMP_SPAWN_DESC",
	LuaMenuMPRulesBountyTimerDesc = "LUA_MENU_MP/RULES_BOUNTY_TIMER_DESC",
	LuaMenuMPRulesRefreshTeamTimerOnResetDesc = "LUA_MENU_MP_RULES_REFRESH_TEAM_TIMER_DESC",
	LuaMenuMPRulesAllowInputSwapDesc = "LUA_MENU_MP/RULES_ALLOW_INPUT_SWAP_DESC",
	LuaMenuMPRulesArenaBlastShieldModDesc = "LUA_MENU_MP/RULES_ARENA_BS_MOD_DESC",
	LuaMenuMPRulesWaveDelayDesc = "LUA_MENU_MP/RULES_WAVE_DELAY_DESC",
	LuaMenuMPRulesSurvivorPrimaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_PRIMARY_WEAPON_DESC",
	LuaMenuMPRulesVampirismDesc = "LUA_MENU_MP/RULES_VAMPIRISM_DESC",
	LuaMenuMPRulesInfectedSecondaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_SECONDARY_WEAPON_DESC",
	LuaMenuMPRulesBankDisableDesc = "LUA_MENU_MP/RULES_BANK_DISABLE_DESC",
	LuaMenuMPRulesMaxHealthDesc = "LUA_MENU_MP/RULES_MAX_HEALTH_DESC",
	LuaMenuMPRulesHVTCaptureValueDesc = "LUA_MENU_MP/RULES_HVT_CAPTURE_VALUE_DESC",
	LuaMenuMPRulesFlagsRequiredToScoreDesc = "LUA_MENU_MP/RULES_FLAGS_REQUIRED_TO_SCORE_DESC",
	LuaMenuMPRulesPracticeRoundDesc = "LUA_MENU_MP/RULES_PRACTICE_ROUND_DESC",
	LuaMenuMPRulesBankTimeDesc = "LUA_MENU_MP/RULES_BANK_TIME_DESC",
	LuaMenuMPRulesDisableSpawnCameraDesc = "LUA_MENU_MP/RULES_DISABLE_SPAWN_CAMERA_DESC",
	LuaMenuMPRulesInitialAmmoCountDesc = "LUA_MENU_MP/RULES_OIC_INITIAL_AMMO_DESC",
	LuaMenuMPRulesSuperPointsModDesc = "LUA_MENU_MP/RULES_SUPER_POINTS_MOD_DESC",
	LuaMenuMPRulesJuggSpeedDesc = "LUA_MENU_MP/RULES_JUGG_SPEED_DESC",
	LuaMenuMPRulesMatchStartTimeDesc = "LUA_MENU_MP/RULES_MATCH_START_TIME_FIRST_DESC",
	LuaMenuMPRulesInfectedLethalDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_LETHAL_DESC",
	LuaMenuMPRulesKillRewardAmmoCountDesc = "LUA_MENU_MP/RULES_OIC_KILL_AMMO_DESC",
	LuaMenuMPRulesOICWeaponDesc = "LUA_MENU_MP/RULES_OIC_WEAPON_DESC",
	LuaMenuMPRulesSuperFastChargeRateDesc = "LUA_MENU_MP/RULES_SUPER_FAST_CHARGE_RATE_DESC",
	LuaMenuMPRulesBrGulagDesc = "LUA_MENU_MP/RULES_BR_GULAG_DESC",
	LuaMenuMPRulesInfectedPrimaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_PRIMARY_WEAPON_DESC",
	LuaMenuMPRulesRoundStartTimeDesc = "LUA_MENU_MP/RULES_MATCH_START_TIME_ROUND_DESC",
	LuaMenuMPRulesSurvivorTacticalDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_TACTICAL_DESC",
	LuaMenuMPRulesBrCircleDamageMultiplierDesc = "LUA_MENU_MP/RULES_BR_CIRCLE_DAMAGE_MULT_DESC",
	LuaMenuMPRulesPerksDesc = "LUA_MENU_MP/RULES_PERKS_DESC",
	LuaMenuMPRulesNumRevivesDesc = "LUA_MENU_MP/RULES_NUM_REVIVES_DESC",
	LuaMenuMPRulesRushTimerAmountDesc = "LUA_MENU_MP/RULES_RUSH_TIMER_AMOUNT_DESC",
	LuaMenuMPRulesWinByTwoEnabledDesc = "LUA_MENU_MP/RULES_WIN_BY_TWO_DESC",
	LuaMenuMPRulesArenaBlastShieldClampDesc = "LUA_MENU_MP/RULES_ARENA_BS_CLAMP_DESC",
	LuaMenuMPRulesHQActivationDelayDesc = "LUA_MENU_MP/RULES_HQ_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesDisableAnnouncerDesc = "LUA_MENU_MP/RULES_DISABLE_ANNOUNCER_DESC",
	LuaMenuMPRulesFlagActivationDelayDesc = "LUA_MENU_MP/RULES_FLAG_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesPointsPerKSKillDesc = "LUA_MENU_MP/RULES_POINTS_PER_KS_KILL_DESC",
	LuaMenuMPRulesBombTimerDesc = "LUA_MENU_MP/RULES_BOMB_TIMER_DESC",
	LuaMenuMPRulesInfectedInitialSecondaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_INITIAL_SECONDARY_WEAPON_DESC",
	LuaMenuMPRulesLastStandHealthDesc = "LUA_MENU_MP/RULES_LAST_STAND_HEALTH_DESC",
	LuaMenuMPRulesEquipmentMSProtectDesc = "LUA_MENU_MP/RULES_MATCH_START_LETHAL_PROTECT_DESC",
	LuaMenuMPRulesJuggHelperDesc = "LUA_MENU_MP/RULES_JUGG_HELPER_DESC",
	LuaMenuMPRulesEnablePingDesc = "LUA_MENU_MP/RULES_ENABLE_PING_DESC",
	LuaMenuMPRulesArenaSpawnFlagDesc = "LUA_MENU_MP/RULES_ARENA_SPAWN_FLAG_DESC",
	LuaMenuMPRulesDisableBattleChatterDesc = "LUA_MENU_MP/RULES_DISABLE_BATTLECHATTER_DESC",
	LuaMenuMPRulesExfilExtractTimerDesc = "LUA_MENU_MP/RULES_EXFIL_EXTRACT_TIMER_DESC",
	LuaMenuMPRulesPPKTeamNoFlagDesc = "LUA_MENU_MP/RULES_TDEF_PPK_NO_FLAG_DESC",
	LuaMenuMPRulesPointsPerConfirmDesc = "LUA_MENU_MP/RULES_POINTS_PER_CONFIRM_DESC",
	LuaMenuMPRulesHVTTargetCountDesc = "LUA_MENU_MP/RULES_HVT_TARGET_COUNT_DESC",
	LuaMenuMPRulesSurvivorSecondaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SECONDARY_WEAPON_DESC",
	LuaMenuMPRulesExfilActiveTimerDesc = "LUA_MENU_MP/RULES_EXFIL_ACTIVE_TIMER_DESC",
	LuaMenuMPRulesCaptureDelayPlayerDesc = "LUA_MENU_MP/RULES_CAPTURE_DELAY_PLAYER_DESC",
	LuaMenuMPRulesPostGameExfilWeaponDesc = "LUA_MENU_MP/RULES_POST_GAME_EXFIL_WEAPON_DESC",
	LuaMenuMPRulesSurvivorLethalDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_LETHAL_DESC",
	LuaMenuMPRulesPointsPerJuggKillDesc = "LUA_MENU_MP/RULES_PPK_KILL_JUGG_DESC",
	LuaMenuMPRulesGoalProtectionDesc = "LUA_MENU_MP/RULES_GOAL_PROTECTION_DESC",
	LuaMenuMPRulesDogTagsDesc = "LUA_MENU_MP/RULES_DOG_TAGS_DESC",
	LuaMenuMPRulesHQRandomLocationOrderDesc = "LUA_MENU_MP/RULES_HQ_RANDOM_LOCATION_ORDER_DESC",
	LuaMenuMPRulesCaptureDurationHalfDesc = "LUA_MENU_MP/RULES_CAPTURE_DURATION_HALF_DESC",
	LuaMenuMPRulesExtraTimeDesc = "LUA_MENU_MP/RULES_EXTRA_TIME_DESC",
	LuaMenuMPRulesPostRoundExtraTimerDesc = "LUA_MENU_MP/RULES_POST_ROUND_EXTRA_TIMER_DESC",
	LuaMenuMPRulesHealthRegenDesc = "LUA_MENU_MP/RULES_HEALTH_REGEN_DESC",
	LuaMenuMPRulesDisableSuperSprintDesc = "LUA_MENU_MP/RULES_DISABLE_SUPER_SPRINT_DESC",
	LuaMenuMPRulesTeamTimerDesc = "LUA_MENU_MP/RULES_TEAM_TIMER_DESC",
	LuaMenuMPRulesTeamSizeDesc = "LUA_MENU_MP/RULES_TEAM_SIZE_DESC",
	LuaMenuMPRulesSuicideSpawnDelayDesc = "LUA_MENU_MP/RULES_SUICIDE_SPAWN_DELAY_DESC",
	LuaMenuMPRulesMidfieldScoreDesc = "MP_FRONTEND_ONLY/RULES_MIDFIELD_SCORE_DESC",
	LuaMenuMPRulesObjScalarDesc = "LUA_MENU_MP/RULES_OBJ_SCALAR_DESC",
	LuaMenuMPRulesPPKFlagCarrierDesc = "LUA_MENU_MP/RULES_TDEF_PPK_FLAG_CARRIER_DESC",
	LuaMenuMPRulesFirstZoneActivationDelayDesc = "LUA_MENU_MP/RULES_FIRST_ZONE_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesSpectatingDesc = "LUA_MENU_MP/RULES_SPECTATING_DESC",
	LuaMenuMPRulesSatelliteCountDesc = "LUA_MENU_MP/RULES_SATELLITE_COUNT_DESC",
	LuaMenuMPRulesScorePerTickDesc = "LUA_MENU_MP/RULES_SCORE_PER_TICK_DESC",
	LuaMenuMPRulesSharedRushTimerDesc = "LUA_MENU_MP/RULES_SHARED_RUSH_TIMER_DESC",
	LuaMenuMPRulesDelayPlayerDesc = "LUA_MENU_MP/RULES_DELAY_PLAYER_DESC",
	LuaMenuMPRulesJuggSwitchTimeDesc = "LUA_MENU_MP/RULES_JUGG_SWITCH_TIME_DESC",
	LuaMenuMPRulesMultiBombDesc = "LUA_MENU_MP/RULES_MULTI_BOMB_DESC",
	LuaMenuMPRulesTeamAssignmentAllowedDesc = "LUA_MENU_MP/RULES_TEAM_ASSIGNMENT_DESC",
	LuaMenuMPRulesMagCountDesc = "LUA_MENU_MP/RULES_MAG_COUNT_DESC",
	LuaMenuMPRulesFFPunishLimitDesc = "LUA_MENU_MP/RULES_FF_PUNISH_LIMIT_DESC",
	LuaMenuMPRulesLastStandDesc = "LUA_MENU_MP/RULES_LAST_STAND_DESC",
	LuaMenuMPRulesEnableBrLootDesc = "LUA_MENU_MP/RULES_ENABLE_BR_LOOT_DESC",
	LuaMenuMPRulesJuggHelperSpeedDesc = "LUA_MENU_MP/JUGG_HELPER_SPEED_DESC",
	LuaMenuMPRulesAllowSupersDesc = "LUA_MENU_MP/RULES_ALLOW_SUPER_DESC",
	LuaMenuMPRulesArenaTacticalTimeModDesc = "LUA_MENU_MP/RULES_ARENA_TAC_TIME_MOD_DESC",
	LuaMenuMPRulesInfectExtraTimePerKillDesc = "LUA_MENU_MP/RULES_INFECT_EXTRA_TIME_PER_KILL_DESC",
	LuaMenuMPRulesPointsPerJuggOnJuggKillDesc = "LUA_MENU_MP/RULES_PPK_J_ON_J_DESC",
	LuaMenuMPRulesPointsPerKillAsJuggDesc = "LUA_MENU_MP/RULES_PPK_AS_JUGG_DESC",
	LuaMenuMPRulesRadarPingTimeDesc = "LUA_MENU_MP/RULES_RADAR_PING_TIME_DESC",
	LuaMenuMPRulesReviveUseWeaponDesc = "LUA_MENU_MP/RULES_REVIVE_USE_WEAPON_DESC",
	LuaMenuMPRulesRadarHideShotsDesc = "LUA_MENU_MP/RULES_RADAR_HIDE_SHOTS_DESC",
	LuaMenuMPRulesLethalDelayDesc = "LUA_MENU_MP/RULES_LETHAL_DELAY_DESC",
	LuaMenuMPRulesBrCircleStartSizeDesc = "LUA_MENU_MP/RULES_BR_CIRCLE_START_SIZE_DESC",
	LuaMenuMPRulesShowEnemyCarrierDesc = "LUA_MENU_MP/RULES_SHOW_ENEMY_CARRIER_DESC",
	LuaMenuMPRulesHQAdditiveScoringDesc = "LUA_MENU_MP/RULES_HQ_ADDITIVE_SCORING_DESC",
	LuaMenuMPRulesZoneTimeDesc = "LUA_MENU_MP_RULES_ZONE_TIME_DESC",
	LuaMenuMPRulesWinLimitDesc = "LUA_MENU_MP/RULES_WIN_LIMIT_DESC",
	LuaMenuMPRulesCaptureDurationCenterDesc = "LUA_MENU_MP/RULES_CAPTURE_DURATION_CENTER_DESC",
	LuaMenuMPRulesDraftWeaponTimerDesc = "LUA_MENU_MP/RULES_DRAFT_WEAPON_TIMER_DESC",
	LuaMenuMPRulesHoldDurationCenterDesc = "LUA_MENU_MP/RULES_HOLD_DURATION_CENTER_DESC",
	LuaMenuMPRulesCaptureTypeDesc = "LUA_MENU_MP/RULES_CAPTURE_TYPE_DESC",
	LuaMenuMPRulesPlantTimeDesc = "LUA_MENU_MP/RULES_PLANT_TIME_DESC",
	LuaMenuMPRulesLadderIndexDesc = "LUA_MENU_MP/RULES_LADDER_DESC",
	LuaMenuMPRulesFirstHQActivationDelayDesc = "LUA_MENU_MP/RULES_FIRST_HQ_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesSimultaneousDeathDesc = "LUA_MENU_MP/RULES_SIMUL_DEATH_DESC",
	LuaMenuMPRulesDeathRetainStreaksDesc = "LUA_MENU_MP/RULES_DEATH_RETAIN_STREAKS_DESC",
	LuaMenuMPRulesHardcoreDesc = "LUA_MENU_MP/RULES_HARDCORE_DESC",
	LuaMenuMPRulesDropTimeDesc = "LUA_MENU_MP/RULES_DROP_TIME_DESC",
	LuaMenuMPRulesStartWeaponDesc = "LUA_MENU_MP/RULES_START_WEAPON_DESC",
	LuaMenuMPRulesHQTimeoutDesc = "LUA_MENU_MP/RULES_HQ_TIMEOUT_DESC",
	LuaMenuMPRulesLastStandReviveTimerDesc = "LUA_MENU_MP/RULES_LAST_STAND_REVIVE_TIMER_DESC",
	LuaMenuMPRulesHQSelectionDelayDesc = "LUA_MENU_MP/RULES_HQ_SELECTION_DELAY_DESC",
	LuaMenuMPRulesInfectedSuperDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_SUPER_DESC",
	LuaMenuMPRulesScoreOnTargetPlayerDesc = "LUA_MENU_MP/RULES_SCORE_ON_TARGET_PLAYER_DESC",
	LuaMenuMPRulesScoreLimitDesc = "LUA_MENU_MP/RULES_SCORE_LIMIT_DESC",
	LuaMenuMPRulesSurvivorSuperDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SUPER_DESC",
	LuaMenuMPRulesLastStandReviveHealthDesc = "LUA_MENU_MP/RULES_LAST_STAND_REVIVE_HEALTH_DESC",
	LuaMenuMPRulesCasualScoreStreaksDesc = "LUA_MENU_MP/RULES_CASUAL_SCORE_STREAKS_DESC",
	LuaMenuMPRulesDisableMountDesc = "LUA_MENU_MP/RULES_DISABLE_MOUNT_DESC",
	LuaMenuMPRulesCMDHVTDesc = "LUA_MENU_MP/RULES_CMD_HVT_DESC",
	LuaMenuMPRulesScoringTimeDesc = "LUA_MENU_MP/RULES_SCORE_TIME_DESC",
	LuaMenuMPRulesResetProgressDesc = "LUA_MENU_MP/RULES_RESET_PROGRESS_DESC",
	LuaMenuMPRulesHQCaptureDelayPlayerDesc = "LUA_MENU_MP/RULES_HQ_CAPTURE_DELAY_PLAYER_DESC",
	LuaMenuMPRulesCrateDropTimerDesc = "LUA_MENU_MP/RULES_CRATE_DROP_TIMER_DESC",
	LuaMenuMPRulesRespawnDelayDesc = "LUA_MENU_MP/RULES_RESPAWN_DELAY_DESC",
	LuaMenuMPRulesCaptureDecayDesc = "LUA_MENU_MP/RULES_CAPTURE_DECAY_DESC",
	LuaMenuMPRulesCDLTuningDesc = "LUA_MENU_MP/CDL_TUNING_DESC",
	LuaMenuMPRulesActivationDelayBaseDesc = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_BASE_DESC",
	LuaMenuMPRulesCMDRulesDesc = "LUA_MENU_MP/RULES_CMD_RULES_DESC",
	LuaMenuMPRulesRoundRetainStreaksDesc = "LUA_MENU_MP/RULES_ROUND_RETAIN_STREAKS_DESC",
	LuaMenuMPRulesEscapeTimerDesc = "LUA_MENU_MP/RULES_ESCAPE_TIMER_DESC",
	LuaMenuMPRulesActivationDelayDesc = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesHeadshotsOnlyDesc = "LUA_MENU_MP/RULES_HEADSHOTS_ONLY_DESC",
	LuaMenuMPRulesEnableVariantDZDesc = "LUA_MENU_MP/RULES_ENABLE_VARIANT_DZ_DESC",
	LuaMenuMPRulesDetonateScoreDesc = "LUA_MENU_MP/RULES_DETONATE_SCORE_DESC",
	LuaMenuMPRulesPracticeModeDesc = "LUA_MENU_MP/RULES_PRACTICE_MODE_DESC",
	LuaMenuMPRulesTargetPlayerCycleDesc = "LUA_MENU_MP/RULES_TARGET_PLAYER_CYCLE_DESC",
	LuaMenuMPRulesFlagNeutralizationDesc = "LUA_MENU_MP/RULES_FLAG_NEUTRALIZATION_DESC",
	LuaMenuMPRulesJuggSpawnBehaviorDesc = "LUA_MENU_MP/RULES_JUGG_SPAWN_BEHAVIOR_DESC",
	LuaMenuMPRulesPossessionResetConditionDesc = "LUA_MENU_MP/RULES_POSSESSION_RESET_CONDITION_DESC",
	LuaMenuMPRulesPersBombTimerDesc = "LUA_MENU_MP/RULES_PERS_BOMB_TIMER_DESC",
	LuaMenuMPRulesInfectStreakBonusDesc = "LUA_MENU_MP/RULES_INFECT_STREAK_BONUS_DESC",
	LuaMenuMPRulesIdleResetTimeDesc = "LUA_MENU_MP/RULES_IDLE_RESET_TIME_DESC",
	LuaMenuMPRulesSpawnProtectionTimerDesc = "LUA_MENU_MP/RULES_SPAWN_PROTECTION_TIMER_DESC",
	LuaMenuMPRulesOvertimeLimitDesc = "LUA_MENU_MP/RULES_OVERTIME_LIMIT_DESC",
	LuaMenuMPRulesCarrierBonusTimeDesc = "LUA_MENU_MP/RULES_CARRIER_BONUS_TIME_DESC",
	LuaMenuMPRulesJuggLifetimeDesc = "LUA_MENU_MP/RULES_JUGG_LIFETIME_DESC",
	LuaMenuMPRulesRoundRetainStreakProgDesc = "LUA_MENU_MP/RULES_ROUND_RETAIN_STREAK_PROGRESS_DESC",
	LuaMenuMPRulesInfectedInitialPrimaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_INITIAL_PRIMARY_WEAPON_DESC",
	LuaMenuMPRulesOneShotKillDesc = "LUA_MENU_MP/RULES_OIC_OSK_DESC",
	LuaMenuMPRulesMegaBankBonusKSDesc = "LUA_MENU_MP/RULES_MEGA_BANK_BONUS_KS_DESC",
	LuaMenuMPRulesFriendlyBaseScoreDesc = "MP_FRONTEND_ONLY/RULES_FRIENDLY_BASE_SCORE_DESC",
	LuaMenuMPRulesHoldDurationHalfDesc = "LUA_MENU_MP/RULES_HOLD_DURATION_HALF_DESC",
	LuaMenuMPRulesInfectedSuperTwoDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_SUPER_TWO_DESC",
	LuaMenuMPRulesCarrierBonusScoreDesc = "LUA_MENU_MP/RULES_CARRIER_BONUS_SCORE_DESC",
	LuaMenuMPRulesBankCaptureDesc = "LUA_MENU_MP/RULES_BANK_CAPTURE_DESC",
	LuaMenuMPRulesZoneActivationDelayDesc = "LUA_MENU_MP/RULES_ZONE_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesRoundSwitchDesc = "LUA_MENU_MP/RULES_ROUND_SWITCH_DESC",
	LuaMenuMPRulesHQCaptureTimeDesc = "LUA_MENU_MP/RULES_HQ_CAPTURE_TIME_DESC"
}
local var_0_7 = Lobby.IsCurrentGameTypeteamBased() and "LUA_MENU/RULES_TEAM_ONLY" or "LUA_MENU/RULES_PLAYERS_ONLY"
local var_0_8 = {
	LuaMenuMPRulesNormalCMD = {
		text = "LUA_MENU_MP/RULES_CMD_NORMAL",
		value = 1
	},
	LuaMenuMPRulesBreakThroughCMD = {
		text = "LUA_MENU_MP/RULES_CMD_BREAK",
		value = 2
	},
	LuaMenuRulesNever = {
		text = "LUA_MENU/RULES_NEVER",
		value = 0
	},
	LuaMenuRulesNone = {
		text = "LUA_MENU/RULES_NONE",
		value = 0
	},
	LuaMenuRulesUnlimited = {
		text = "LUA_MENU/RULES_UNLIMITED",
		value = 0
	},
	LuaMenuMPRulesSpectating = {
		value = 1,
		text = var_0_7
	},
	LuaMenuRulesFree = {
		text = "LUA_MENU/RULES_FREE",
		value = 2
	},
	LuaMenuMPRulesMinutes15Sec = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 15
	},
	LuaMenuMPRulesMinutes20Sec = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 20
	},
	LuaMenuMPRulesMinutes25Sec = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 25
	},
	LuaMenuMPRulesMinutesHalf = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 30
	},
	LuaMenuMPRulesMinutes35Sec = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 35
	},
	LuaMenuMPRulesMinutes40Sec = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 40
	},
	LuaMenuMPRulesMinutes45Sec = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 45
	},
	LuaMenuMPRulesMinutes50Sec = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 50
	},
	LuaMenuMPRulesMinutes55Sec = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 55
	},
	LuaMenuMPRulesMinutes1 = {
		text = "LUA_MENU_MP/RULES_MINUTES_1",
		value = 60
	},
	LuaMenuMPRulesMinutes1Min15Sec = {
		value = 75,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 1,
		displayValueTwo = 15
	},
	LuaMenuMPRulesMinutes1Half = {
		value = 90,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 1,
		displayValueTwo = 30
	},
	LuaMenuMPRulesMinutes1Min35Sec = {
		value = 95,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 1,
		displayValueTwo = 35
	},
	LuaMenuMPRulesMinutes1Min40Sec = {
		value = 100,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 1,
		displayValueTwo = 40
	},
	LuaMenuMPRulesMinutes1Min45Sec = {
		value = 105,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 1,
		displayValueTwo = 45
	},
	LuaMenuMPRulesMinutes1Min50Sec = {
		value = 110,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 1,
		displayValueTwo = 50
	},
	LuaMenuMPRulesMinutes1Min55Sec = {
		value = 115,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 1,
		displayValueTwo = 55
	},
	LuaMenuMPRulesMinutes2 = {
		value = 120,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 2
	},
	LuaMenuMPRulesMinutes2Min15Sec = {
		value = 135,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 2,
		displayValueTwo = 15
	},
	LuaMenuMPRulesMinutes2Half = {
		value = 150,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 2,
		displayValueTwo = 30
	},
	LuaMenuMPRulesMinutes2Min45Sec = {
		value = 165,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 2,
		displayValueTwo = 45
	},
	LuaMenuMPRulesMinutes3 = {
		value = 180,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 3
	},
	LuaMenuMPRulesMinutes3Half = {
		value = 210,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 3,
		displayValueTwo = 30
	},
	LuaMenuMPRulesMinutes4 = {
		value = 240,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 4
	},
	LuaMenuMPRulesMinutes4Half = {
		value = 270,
		text = "LUA_MENU_MP/RULES_MIN_AND_SECONDS",
		displayValue = 4,
		displayValueTwo = 30
	},
	LuaMenuMPRulesMinutes5 = {
		value = 300,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 5
	},
	LuaMenuMPRulesMinutes6 = {
		value = 360,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 6
	},
	LuaMenuMPRulesMinutes7 = {
		value = 420,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 7
	},
	LuaMenuMPRulesMinutes8 = {
		value = 480,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 8
	},
	LuaMenuMPRulesMinutes9 = {
		value = 540,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 9
	},
	LuaMenuMPRulesMinutes10 = {
		value = 600,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 10
	},
	LuaMenuMPRulesMinutes11 = {
		value = 660,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 11
	},
	LuaMenuMPRulesMinutes12 = {
		value = 720,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 12
	},
	LuaMenuMPRulesMinutes13 = {
		value = 780,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 13
	},
	LuaMenuMPRulesMinutes14 = {
		value = 840,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 14
	},
	LuaMenuMPRulesMinutes15 = {
		value = 900,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 15
	},
	LuaMenuMPRulesMinutes20 = {
		value = 1200,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 20
	},
	LuaMenuMPRulesMinutes30 = {
		value = 1800,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 30
	},
	LuaMenuMPRulesMinutes45 = {
		value = 2700,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 45
	},
	LuaMenuMPRulesNum0 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 0
	},
	LuaMenuMPRulesNum1 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 1
	},
	LuaMenuMPRulesNum2 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 2
	},
	LuaMenuMPRulesNum3 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 3
	},
	LuaMenuMPRulesNum4 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 4
	},
	LuaMenuMPRulesNum5 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 5
	},
	LuaMenuMPRulesNum6 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 6
	},
	LuaMenuMPRulesNum7 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 7
	},
	LuaMenuMPRulesNum8 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 8
	},
	LuaMenuMPRulesNum9 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 9
	},
	LuaMenuMPRulesNum10 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 10
	},
	LuaMenuMPRulesNum15 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 15
	},
	LuaMenuMPRulesNum1000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 1000
	},
	LuaMenuMPRulesNum1250 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 1250
	},
	LuaMenuMPRulesNum1500 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 1500
	},
	LuaMenuMPRulesNum1750 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 1750
	},
	LuaMenuMPRulesNum2000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 2000
	},
	LuaMenuMPRulesNum2250 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 2250
	},
	LuaMenuMPRulesNum2500 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 2500
	},
	LuaMenuMPRulesNum2750 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 2750
	},
	LuaMenuMPRulesNum3000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 3000
	},
	LuaMenuMPRulesNum4000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 4000
	},
	LuaMenuMPRulesNum4500 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 4500
	},
	LuaMenuMPRulesNum5000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 5000
	},
	LuaMenuMPRulesNum6000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 6000
	},
	LuaMenuMPRulesNum7000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 7000
	},
	LuaMenuMPRulesNum7500 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 7500
	},
	LuaMenuMPRulesNum8000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 8000
	},
	LuaMenuMPRulesNum9000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 9000
	},
	LuaMenuMPRulesNum10000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 10000
	},
	LuaMenuMPRulesNum10500 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 10500
	},
	LuaMenuMPRulesNum15000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 15000
	},
	LuaMenuMPRulesNum20000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 20000
	},
	LuaMenuMPRulesNum50000 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 50000
	},
	LuaMenuRulesMiniscule = {
		text = "LUA_MENU/RULES_MINISCULE",
		value = 30
	},
	LuaMenuRulesHalf = {
		text = "LUA_MENU/RULES_HALF",
		value = 50
	},
	LuaMenuRulesTactical = {
		text = "LUA_MENU_MP/RULES_TACTICAL_HEALTH",
		value = 70
	},
	LuaMenuRulesNormal = {
		text = "LUA_MENU_MP/RULES_HEALTH_NORMAL",
		value = 100
	},
	LuaMenuRules130 = {
		text = "LUA_MENU_MP/RULES_1_3_HEALTH",
		value = 130
	},
	LuaMenuRules150 = {
		text = "LUA_MENU_MP/RULES_1_5_HEALTH",
		value = 150
	},
	LuaMenuRulesDouble = {
		text = "LUA_MENU/RULES_DOUBLE",
		value = 200
	},
	LuaMenuRulesRegenVerySlow = {
		text = "LUA_MENU_MP/RULES_REGEN_VERY_SLOW",
		value = 20
	},
	LuaMenuRulesRegenSlow = {
		text = "LUA_MENU/RULES_SLOW",
		value = 10
	},
	LuaMenuRulesRegenNormal = {
		text = "LUA_MENU_MP/RULES_NORMAL",
		value = 5
	},
	LuaMenuRulesRegenFast = {
		text = "LUA_MENU/RULES_FAST",
		value = 2
	},
	LuaMenuRulesEveryRound = {
		text = "LUA_MENU_MP/RULES_EVERY_ROUND",
		value = 1
	},
	LuaMenuRulesEvery2Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 2
	},
	LuaMenuRulesEvery3Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 3
	},
	LuaMenuRulesEvery4Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 4
	},
	LuaMenuRulesEvery5Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 5
	},
	LuaMenuRulesEvery6Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 6
	},
	LuaMenuRulesEvery7Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 7
	},
	LuaMenuRulesEvery8Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 8
	},
	LuaMenuRulesEvery9Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 9
	},
	LuaMenuRulesEvery10Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 10
	},
	LuaMenuRulesEvery11Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 11
	},
	LuaMenuRulesEvery12Rounds = {
		text = "LUA_MENU_MP/RULES_EVERY_N_ROUNDS",
		value = 12
	},
	LuaMPMenuNo = {
		text = "LUA_MENU_MP/NO",
		value = false
	},
	LuaMenuMPYes = {
		text = "LUA_MENU_MP/YES",
		value = true
	},
	LuaMenuMPDisabledNumValue = {
		text = "LUA_MENU_MP/DISABLED",
		value = 0
	},
	LuaMenuMPDisabled = {
		text = "LUA_MENU_MP/DISABLED",
		value = false
	},
	LuaMenuMPEnabledNumValue = {
		text = "LUA_MENU_MP/ENABLED",
		value = 1
	},
	LuaMenuMPEnabled = {
		text = "LUA_MENU_MP/ENABLED",
		value = true
	},
	LuaMenuMPDisabledValueTrue = {
		text = "LUA_MENU_MP/DISABLED",
		value = true
	},
	LuaMenuMPEabledValueFalse = {
		text = "LUA_MENU_MP/ENABLED",
		value = false
	},
	LuaMenuMPConstantNumValue = {
		text = "LUA_MENU_MP/RULES_PING_CONSTANT",
		value = 1
	},
	LuaMenuMPRulesPingSeconds1 = {
		value = 2,
		text = "LUA_MENU_MP/RULES_SECONDS_1",
		displayValue = 1
	},
	LuaMenuMPRulesPingSeconds1Half = {
		value = 3,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 1.5
	},
	LuaMenuMPRulesPingSeconds2 = {
		value = 4,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 2
	},
	LuaMenuMPRulesPingSeconds3 = {
		value = 5,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 3
	},
	LuaMenuMPRulesPingSeconds4 = {
		value = 6,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 4
	},
	LuaMenuMPRulesPoints0 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 0
	},
	LuaMenuMPRulesPoints1 = {
		text = "LUA_MENU_MP/RULES_POINTS_1",
		value = 1
	},
	LuaMenuMPRulesPoints2 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 2
	},
	LuaMenuMPRulesPoints3 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 3
	},
	LuaMenuMPRulesPoints4 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 4
	},
	LuaMenuMPRulesPoints5 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 5
	},
	LuaMenuMPRulesPoints6 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 6
	},
	LuaMenuMPRulesPoints7 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 7
	},
	LuaMenuMPRulesPoints8 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 8
	},
	LuaMenuMPRulesPoints9 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 9
	},
	LuaMenuMPRulesPoints10 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 10
	},
	LuaMenuMPRulesPoints15 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 15
	},
	LuaMenuMPRulesPoints20 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 20
	},
	LuaMenuMPRulesPoints25 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 25
	},
	LuaMenuMPRulesPoints30 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 30
	},
	LuaMenuMPRulesPoints35 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 35
	},
	LuaMenuMPRulesPoints40 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 40
	},
	LuaMenuMPRulesPoints45 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 45
	},
	LuaMenuMPRulesPoints50 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 50
	},
	LuaMenuMPRulesPoints55 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 55
	},
	LuaMenuMPRulesPoints60 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 60
	},
	LuaMenuMPRulesPoints65 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 65
	},
	LuaMenuMPRulesPoints70 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 70
	},
	LuaMenuMPRulesPoints75 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 75
	},
	LuaMenuMPRulesPoints80 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 80
	},
	LuaMenuMPRulesPoints85 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 85
	},
	LuaMenuMPRulesPoints90 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 90
	},
	LuaMenuMPRulesPoints95 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 95
	},
	LuaMenuMPRulesPoints100 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 100
	},
	LuaMenuMPRulesPoints150 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 150
	},
	LuaMenuMPRulesPoints200 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 200
	},
	LuaMenuMPRulesPoints250 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 250
	},
	LuaMenuMPRulesPoints300 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 300
	},
	LuaMenuMPRulesPoints350 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 350
	},
	LuaMenuMPRulesPoints400 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 400
	},
	LuaMenuMPRulesPoints450 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 450
	},
	LuaMenuMPRulesPoints500 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 500
	},
	LuaMenuMPRulesPoints550 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 550
	},
	LuaMenuMPRulesPoints600 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 600
	},
	LuaMenuMPRulesPoints650 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 650
	},
	LuaMenuMPRulesPoints700 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 700
	},
	LuaMenuMPRulesPoints750 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 750
	},
	LuaMenuMPRulesPoints800 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 800
	},
	LuaMenuMPRulesPoints850 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 850
	},
	LuaMenuMPRulesPoints900 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 900
	},
	LuaMenuMPRulesPoints950 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 950
	},
	LuaMenuMPRulesPoints1000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 1000
	},
	LuaMenuMPRulesPoints1500 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 1500
	},
	LuaMenuMPRulesPoints2000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 2000
	},
	LuaMenuMPRulesPoints2500 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 2500
	},
	LuaMenuMPRulesPoints3000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 3000
	},
	LuaMenuMPRulesPoints4000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 4000
	},
	LuaMenuMPRulesPoints5000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 5000
	},
	LuaMenuMPRulesPoints6000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 6000
	},
	LuaMenuMPRulesPoints7000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 7000
	},
	LuaMenuMPRulesPoints7500 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 7500
	},
	LuaMenuMPRulesPoints8000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 8000
	},
	LuaMenuMPRulesPoints9000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 9000
	},
	LuaMenuMPRulesPoints10000 = {
		text = "LUA_MENU_MP/RULES_POINTS",
		value = 10000
	},
	LuaMenuMPRulesLives0 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 0
	},
	LuaMenuMPRulesLives1 = {
		text = "LUA_MENU_MP/RULES_LIVES_1",
		value = 1
	},
	LuaMenuMPRulesLives2 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 2
	},
	LuaMenuMPRulesLives3 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 3
	},
	LuaMenuMPRulesLives4 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 4
	},
	LuaMenuMPRulesLives5 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 5
	},
	LuaMenuMPRulesLives10 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 10
	},
	LuaMenuMPRulesLives15 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 15
	},
	LuaMenuMPRulesLives20 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 20
	},
	LuaMenuMPRulesLives25 = {
		text = "LUA_MENU_MP/RULES_LIVES",
		value = 25
	},
	LuaMenuMPRulesRevives1 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 1
	},
	LuaMenuMPRulesRevives2 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 2
	},
	LuaMenuMPRulesRevives3 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 3
	},
	LuaMenuMPRulesRevives4 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 4
	},
	LuaMenuMPRulesRevives5 = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 5
	},
	LuaMenuMPRulesRounds1 = {
		text = "LUA_MENU_MP/RULES_ROUNDS_1",
		value = 1
	},
	LuaMenuMPRulesRounds2 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 2
	},
	LuaMenuMPRulesRounds3 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 3
	},
	LuaMenuMPRulesRounds4 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 4
	},
	LuaMenuMPRulesRounds5 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 5
	},
	LuaMenuMPRulesRounds6 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 6
	},
	LuaMenuMPRulesRounds7 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 7
	},
	LuaMenuMPRulesRounds8 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 8
	},
	LuaMenuMPRulesRounds9 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 9
	},
	LuaMenuMPRulesRounds10 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 10
	},
	LuaMenuMPRulesRounds12 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 12
	},
	LuaMenuMPRulesRounds14 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 14
	},
	LuaMenuMPRulesRounds16 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 16
	},
	LuaMenuMPRulesRounds18 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 18
	},
	LuaMenuMPRulesRounds20 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 20
	},
	LuaMenuMPRulesRounds24 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 24
	},
	LuaMenuMPRulesRounds48 = {
		text = "LUA_MENU_MP/RULES_ROUNDS",
		value = 48
	},
	LuaMenuMPRulesDisabledNeg = {
		text = "LUA_MENU_MP/DISABLED",
		value = -1
	},
	LuaMenuMPRulesInstant = {
		text = "LUA_MENU_MP/RULES_INSTANT",
		value = 0
	},
	LuaMenuMPRulesNearInstant = {
		text = "LUA_MENU_MP/RULES_INSTANT",
		value = 0.05
	},
	LuaMenuMPRulesSeconds0Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 0.5
	},
	LuaMenuMPRulesSeconds1 = {
		text = "LUA_MENU_MP/RULES_SECONDS_1",
		value = 1
	},
	LuaMenuMPRulesSeconds1Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 1.5
	},
	LuaMenuMPRulesSeconds2 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 2
	},
	LuaMenuMPRulesSeconds2Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 2.5
	},
	LuaMenuMPRulesSeconds3 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 3
	},
	LuaMenuMPRulesSeconds3Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 3.5
	},
	LuaMenuMPRulesSeconds4 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 4
	},
	LuaMenuMPRulesSeconds4Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 4.5
	},
	LuaMenuMPRulesSeconds5 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 5
	},
	LuaMenuMPRulesSeconds5Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 5.5
	},
	LuaMenuMPRulesSeconds6 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 6
	},
	LuaMenuMPRulesSeconds6Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 6.5
	},
	LuaMenuMPRulesSeconds7 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 7
	},
	LuaMenuMPRulesSeconds7Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 7.5
	},
	LuaMenuMPRulesSeconds8 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 8
	},
	LuaMenuMPRulesSeconds8Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 8.5
	},
	LuaMenuMPRulesSeconds9 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 9
	},
	LuaMenuMPRulesSeconds9Half = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 9.5
	},
	LuaMenuMPRulesSeconds10 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 10
	},
	LuaMenuMPRulesSeconds11 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 11
	},
	LuaMenuMPRulesSeconds12 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 12
	},
	LuaMenuMPRulesSeconds13 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 13
	},
	LuaMenuMPRulesSeconds14 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 14
	},
	LuaMenuMPRulesSeconds15 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 15
	},
	LuaMenuMPRulesSeconds20 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 20
	},
	LuaMenuMPRulesSeconds25 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 25
	},
	LuaMenuMPRulesSeconds30 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 30
	},
	LuaMenuMPRulesSeconds35 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 35
	},
	LuaMenuMPRulesSeconds40 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 40
	},
	LuaMenuMPRulesSeconds45 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 45
	},
	LuaMenuMPRulesSeconds50 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 50
	},
	LuaMenuMPRulesSeconds55 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 55
	},
	LuaMenuMPRulesSeconds60real = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 60
	},
	LuaMenuMPRulesSeconds65 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 65
	},
	LuaMenuMPRulesSeconds70 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 70
	},
	LuaMenuMPRulesSeconds75 = {
		text = "LUA_MENU_MP/RULES_SECONDS",
		value = 75
	},
	LuaMenuMPRulesSeconds60 = {
		value = 60,
		text = "LUA_MENU_MP/RULES_MINUTES_1",
		displayValue = 1
	},
	LuaMenuMPRulesSeconds90 = {
		value = 90,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 1.5
	},
	LuaMenuMPRulesSeconds120 = {
		value = 120,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 2
	},
	LuaMenuMPRulesSeconds150 = {
		value = 150,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 2.5
	},
	LuaMenuMPRulesSeconds180 = {
		value = 180,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 3
	},
	LuaMenuMPRulesSeconds210 = {
		value = 210,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 3.5
	},
	LuaMenuMPRulesSeconds240 = {
		value = 240,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 4
	},
	LuaMenuMPRulesSeconds270 = {
		value = 270,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 4.5
	},
	LuaMenuMPRulesSeconds300 = {
		value = 300,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 5
	},
	LuaMenuMPRulesUnlimited = {
		text = "LUA_MENU_MP/RULES_UNLIMITED",
		value = 0
	},
	LuaMenuMPRulesFlags1 = {
		text = "LUA_MENU_MP/RULES_FLAGS_1",
		value = 1
	},
	LuaMenuMPRulesFlags2 = {
		text = "LUA_MENU_MP/RULES_FLAGS",
		value = 2
	},
	LuaMenuMPRulesFlags3 = {
		text = "LUA_MENU_MP/RULES_FLAGS",
		value = 3
	},
	LuaMenuMPRulesFlags5 = {
		text = "LUA_MENU_MP/RULES_FLAGS",
		value = 5
	},
	LuaMenuMPRulesFlags10 = {
		text = "LUA_MENU_MP/RULES_FLAGS",
		value = 10
	},
	LuaMenuMPRulesFlags15 = {
		text = "LUA_MENU_MP/RULES_FLAGS",
		value = 15
	},
	LuaMenuMPRulesFlags30 = {
		text = "LUA_MENU_MP/RULES_FLAGS",
		value = 30
	},
	LuaMenuMPRulesZones1 = {
		text = "LUA_MENU_MP/RULES_ZONES_1",
		value = 1
	},
	LuaMenuMPRulesZones2 = {
		text = "LUA_MENU_MP/RULES_ZONES",
		value = 2
	},
	LuaMenuMPRulesZones3 = {
		text = "LUA_MENU_MP/RULES_ZONES",
		value = 3
	},
	LuaMenuMPRulesLocationOrderLinear = {
		text = "LUA_MENU_MP/RULES_LOCATION_ORDER_LINEAR",
		value = false
	},
	LuaMenuMPRulesLocationOrderRandom = {
		text = "LUA_MENU_MP/RULES_LOCATION_ORDER_RANDOM",
		value = true
	},
	LuaMenuMPRulesScoringConstant = {
		text = "LUA_MENU_MP/RULES_SCORING_CONSTANT",
		value = false
	},
	LuaMenuMPRulesScoringAdditive = {
		text = "LUA_MENU_MP/RULES_SCORING_ADDITIVE",
		value = true
	},
	LuaMenuMPRulesHalfMod = {
		text = "LUA_MENU_MP/HALF_MOD",
		value = 0.5
	},
	LuaMenuMPRulesNormalMod = {
		text = "LUA_MENU_MP/NORMAL_MOD",
		value = 1
	},
	LuaMenuMPRulesDoubleMod = {
		text = "LUA_MENU_MP/DOUBLE_MOD",
		value = 2
	},
	LuaMenuMPRulesDelayed = {
		text = "LUA_MENU_MP/DELAYED",
		value = 2
	},
	LuaMenuMPRulesSatellites1 = {
		text = "LUA_MENU_MP/RULES_SATELLITES_1",
		value = 1
	},
	LuaMenuMPRulesSatellites2 = {
		text = "LUA_MENU_MP/RULES_SATELLITES",
		value = 2
	},
	LuaMenuMPRulesSatellites3 = {
		text = "LUA_MENU_MP/RULES_SATELLITES",
		value = 3
	},
	LuaMenuMPRulesSatellites4 = {
		text = "LUA_MENU_MP/RULES_SATELLITES",
		value = 4
	},
	LuaMenuMPRulesSatellites5 = {
		text = "LUA_MENU_MP/RULES_SATELLITES",
		value = 5
	},
	LuaMenuMPRulesRoundWins = {
		text = "LUA_MENU_MP/ROUND_WINS",
		value = 0
	},
	LuaMenuMPRulesTotalFlagCaptures = {
		text = "LUA_MENU_MP/TOTAL_FLAG_CAPTURES",
		value = 1
	},
	LuaMenuMPRulesFlagAtBase = {
		text = "LUA_MENU_MP/FLAG_AT_BASE",
		value = 0
	},
	LuaMenuMPRulesFlagAnywhere = {
		text = "LUA_MENU_MP/FLAG_ANYWHERE",
		value = 1
	},
	LuaMenuMPRulesMultiplierQuarter = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 0.25
	},
	LuaMenuMPRulesMultiplierHalf = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 0.5
	},
	LuaMenuMPRulesMultiplierThreeQuarter = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 0.75
	},
	LuaMenuMPRulesMultiplier1 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1
	},
	LuaMenuMPRulesMultiplier1Point1 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.1
	},
	LuaMenuMPRulesMultiplier1Point2 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.2
	},
	LuaMenuMPRulesMultiplier1Quarter = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.25
	},
	LuaMenuMPRulesMultiplier1Point3 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.3
	},
	LuaMenuMPRulesMultiplier1Point4 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.4
	},
	LuaMenuMPRulesMultiplier1Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.5
	},
	LuaMenuMPRulesMultiplier1Point6 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.6
	},
	LuaMenuMPRulesMultiplier1Point7 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.7
	},
	LuaMenuMPRulesMultiplier1ThreeQuarter = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.75
	},
	LuaMenuMPRulesMultiplier1Point8 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.8
	},
	LuaMenuMPRulesMultiplier1Point9 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 1.9
	},
	LuaMenuMPRulesMultiplier2 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 2
	},
	LuaMenuMPRulesMultiplier2Quarter = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 2.25
	},
	LuaMenuMPRulesMultiplier2Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 2.5
	},
	LuaMenuMPRulesMultiplier3 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 3
	},
	LuaMenuMPRulesMultiplier3Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 3.5
	},
	LuaMenuMPRulesMultiplier4 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 4
	},
	LuaMenuMPRulesMultiplier4Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 4.5
	},
	LuaMenuMPRulesMultiplier5 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 5
	},
	LuaMenuMPRulesMultiplier5Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 5.5
	},
	LuaMenuMPRulesMultiplier6 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 6
	},
	LuaMenuMPRulesMultiplier6Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 6.5
	},
	LuaMenuMPRulesMultiplier7 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 7
	},
	LuaMenuMPRulesMultiplier7Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 7.5
	},
	LuaMenuMPRulesMultiplier8 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 8
	},
	LuaMenuMPRulesMultiplier8Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 8.5
	},
	LuaMenuMPRulesMultiplier9 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 9
	},
	LuaMenuMPRulesMultiplier9Half = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 9.5
	},
	LuaMenuMPRulesMultiplier10 = {
		text = "LUA_MENU_MP/RULES_MULTIPLIER",
		value = 10
	},
	LuaMenuMPRulesTagsHalf = {
		text = "LUA_MENU_MP/HALF_MOD",
		value = 0
	},
	LuaMenuMPRulesTags1 = {
		text = "LUA_MENU_MP/RULES_TAGS_1",
		value = 1
	},
	LuaMenuMPRulesTags2 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 2
	},
	LuaMenuMPRulesTags3 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 3
	},
	LuaMenuMPRulesTags4 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 4
	},
	LuaMenuMPRulesTags5 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 5
	},
	LuaMenuMPRulesTags6 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 6
	},
	LuaMenuMPRulesTags7 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 7
	},
	LuaMenuMPRulesTags8 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 8
	},
	LuaMenuMPRulesTags9 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 9
	},
	LuaMenuMPRulesTags10 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 10
	},
	LuaMenuMPRulesTags11 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 11
	},
	LuaMenuMPRulesTags12 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 12
	},
	LuaMenuMPRulesTags13 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 13
	},
	LuaMenuMPRulesTags14 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 14
	},
	LuaMenuMPRulesTags15 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 15
	},
	LuaMenuMPRulesTags20 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 20
	},
	LuaMenuMPRulesTags25 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 25
	},
	LuaMenuMPRulesTags30 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 30
	},
	LuaMenuMPRulesTags35 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 35
	},
	LuaMenuMPRulesTags40 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 40
	},
	LuaMenuMPRulesTags45 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 45
	},
	LuaMenuMPRulesTags50 = {
		text = "LUA_MENU_MP/RULES_TAGS",
		value = 50
	},
	LuaMenuMPRulesPercent5 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 5
	},
	LuaMenuMPRulesPercent10 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 10
	},
	LuaMenuMPRulesPercent15 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 15
	},
	LuaMenuMPRulesPercent20 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 20
	},
	LuaMenuMPRulesPercent25 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 25
	},
	LuaMenuMPRulesPercent30 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 30
	},
	LuaMenuMPRulesPercent35 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 35
	},
	LuaMenuMPRulesPercent40 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 40
	},
	LuaMenuMPRulesPercent45 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 45
	},
	LuaMenuMPRulesPercent50 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 50
	},
	LuaMenuMPRulesPercent55 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 55
	},
	LuaMenuMPRulesPercent60 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 60
	},
	LuaMenuMPRulesPercent65 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 65
	},
	LuaMenuMPRulesPercent70 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 70
	},
	LuaMenuMPRulesPercent75 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 75
	},
	LuaMenuMPRulesPercent80 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 80
	},
	LuaMenuMPRulesPercent85 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 85
	},
	LuaMenuMPRulesPercent90 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 90
	},
	LuaMenuMPRulesPercent95 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 95
	},
	LuaMenuMPRulesPercent100 = {
		text = "LUA_MENU_MP/RULES_PERCENT",
		value = 100
	},
	LuaMenuMPRulesRadarHidePings0 = {
		text = "LUA_MENU_MP/ENABLED",
		value = 0
	},
	LuaMenuMPRulesRadarHidePings1 = {
		text = "LUA_MENU_MP/DISABLED",
		value = 1
	},
	LuaMenuMPRulesRadarHidePings2 = {
		text = "LUA_MENU_MP/WEAPON_PING_UAV_ONLY",
		value = 2
	},
	LuaMenuMPRulesCompassHidePings0 = {
		text = "LUA_MENU_MP/ENABLED",
		value = 0
	},
	LuaMenuMPRulesCompassHidePings1 = {
		text = "LUA_MENU_MP/DISABLED",
		value = 1
	},
	LuaMenuMPRulesCompassHidePings2 = {
		text = "LUA_MENU_MP/WEAPON_PING_UAV_ONLY",
		value = 2
	},
	LuaMenuMPRulesPoints80Normal = {
		text = "LUA_MENU_MP/RULES_BS_CLAMP_NORMAL",
		value = 80
	},
	LuaMenuMPRulesAKILO47 = {
		text = "WEAPON/AR_AKILO47",
		value = "iw8_ar_akilo47_mp"
	},
	LuaMenuMPRulesMIKE4 = {
		text = "WEAPON/AR_MIKE4",
		value = "iw8_ar_mike4_mp"
	},
	LuaMenuMPRulesFALIMA = {
		text = "WEAPON/AR_FALIMA",
		value = "iw8_ar_falima_mp"
	},
	LuaMenuMPRulesFAPLHA = {
		text = "WEAPON/AR_FALPHA",
		value = "iw8_ar_falpha_mp"
	},
	LuaMenuMPRulesMCHARLIE = {
		text = "WEAPON/AR_MCHARLIE",
		value = "iw8_ar_mcharlie_mp"
	},
	LuaMenuMPRulesSCHARLIE = {
		text = "WEAPON/AR_SCHARLIE",
		value = "iw8_ar_scharlie_mp"
	},
	LuaMenuMPRulesASIERRA12 = {
		text = "WEAPON/AR_ASIERRA12",
		value = "iw8_ar_asierra12_mp"
	},
	LuaMenuMPRulesKILO433 = {
		text = "WEAPON/AR_KILO433",
		value = "iw8_ar_kilo433_mp"
	},
	LuaMenuMPRulesTANGO21 = {
		text = "WEAPON/AR_TANGO21",
		value = "iw8_ar_tango21_mp"
	},
	LuaMenuMPRulesSIERRA552 = {
		text = "WEAPON/AR_SIERRA552",
		value = "iw8_ar_sierra552_mp"
	},
	LuaMenuMPRulesGALIMA = {
		text = "WEAPON/AR_GALIMA",
		value = "iw8_ar_galima_mp"
	},
	LuaMenuMPRulesANOVEMBER94 = {
		text = "WEAPON/AR_ANOVEMBER94",
		value = "iw8_ar_anovember94_mp"
	},
	LuaMenuMPRulesMPAPA7 = {
		text = "WEAPON/SM_MPAPA7",
		value = "iw8_sm_mpapa7_mp"
	},
	LuaMenuMPRulesAUGOLF = {
		text = "WEAPON/SM_AUGOLF",
		value = "iw8_sm_augolf_mp"
	},
	LuaMenuMPRulesPAPA90 = {
		text = "WEAPON/SM_PAPA90",
		value = "iw8_sm_papa90_mp"
	},
	LuaMenuMPRulesMPAPA5 = {
		text = "WEAPON/SM_MPAPA5",
		value = "iw8_sm_mpapa5_mp"
	},
	LuaMenuMPRulesBETA = {
		text = "WEAPON/SM_BETA",
		value = "iw8_sm_beta_mp"
	},
	LuaMenuMPRulesUZULU = {
		text = "WEAPON/SM_UZULU",
		value = "iw8_sm_uzulu_mp"
	},
	LuaMenuMPRulesSMGOLF45 = {
		text = "WEAPON/SM_SMGOLF45",
		value = "iw8_sm_smgolf45_mp"
	},
	LuaMenuMPRulesVICTOR = {
		text = "WEAPON/SM_VICTOR",
		value = "iw8_sm_victor_mp"
	},
	LuaMenuMPRulesCHARLIE9 = {
		text = "WEAPON/SM_CHARLIE9",
		value = "iw8_sm_charlie9_mp"
	},
	LuaMenuMPRulesPKILO = {
		text = "WEAPON/LM_PKILO",
		value = "iw8_lm_pkilo_mp"
	},
	LuaMenuMPRulesKILO121 = {
		text = "WEAPON/LM_KILO121",
		value = "iw8_lm_kilo121_mp"
	},
	LuaMenuMPRulesLIMA86 = {
		text = "WEAPON/LM_LIMA86",
		value = "iw8_lm_lima86_mp"
	},
	LuaMenuMPRulesMGOLF34 = {
		text = "WEAPON/LM_MGOLF34",
		value = "iw8_lm_mgolf34_mp"
	},
	LuaMenuMPRulesMGOLF36 = {
		text = "WEAPON/LM_MGOLF36",
		value = "iw8_lm_mgolf36_mp"
	},
	LuaMenuMPRulesMKILO3 = {
		text = "WEAPON/LM_MKILO3",
		value = "iw8_lm_mkilo3_mp"
	},
	LuaMenuMPRulesSBETA = {
		text = "WEAPON/SN_SBETA",
		value = "iw8_sn_sbeta_mp"
	},
	LuaMenuMPRulesMIKE14 = {
		text = "WEAPON/SN_MIKE14",
		value = "iw8_sn_mike14_mp"
	},
	LuaMenuMPRulesKILO98 = {
		text = "WEAPON/SN_KILO98",
		value = "iw8_sn_kilo98_mp"
	},
	LuaMenuMPRulesCROSSBOW = {
		text = "WEAPON/SN_CROSSBOW",
		value = "iw8_sn_crossbow_mp"
	},
	LuaMenuMPRulesSKSIERRA = {
		text = "WEAPON/SN_SKSIERRA",
		value = "iw8_sn_sksierra_mp"
	},
	LuaMenuMPRulesALPHA50 = {
		text = "WEAPON/SN_ALPHA50",
		value = "iw8_sn_alpha50_mp"
	},
	LuaMenuMPRulesDELTA = {
		text = "WEAPON/SN_DELTA",
		value = "iw8_sn_delta_mp"
	},
	LuaMenuMPRulesHDR = {
		text = "WEAPON/SN_HDROMEO",
		value = "iw8_sn_hdromeo_mp"
	},
	LuaMenuMPRulesXMIKE109 = {
		text = "WEAPON/SN_XMIKE109",
		value = "iw8_sn_xmike109_mp"
	},
	LuaMenuMPRulesROMEO870 = {
		text = "WEAPON/SH_ROMEO870",
		value = "iw8_sh_romeo870_mp"
	},
	LuaMenuMPRulesDPAPA12 = {
		text = "WEAPON/SH_DPAPA12",
		value = "iw8_sh_dpapa12_mp"
	},
	LuaMenuMPRulesCHARLIE725 = {
		text = "WEAPON/SH_CHARLIE725",
		value = "iw8_sh_charlie725_mp"
	},
	LuaMenuMPRulesOSCAR12 = {
		text = "WEAPON/SH_OSCAR12",
		value = "iw8_sh_oscar12_mp"
	},
	LuaMenuMPRulesMIKE26 = {
		text = "WEAPON/SH_MIKE26",
		value = "iw8_sh_mike26_mp"
	},
	LuaMenuMPRulesP320 = {
		text = "WEAPON/PI_PAPA320",
		value = "iw8_pi_papa320_mp"
	},
	LuaMenuMPRulesDECHO = {
		text = "WEAPON/PI_DECHO",
		value = "iw8_pi_decho_mp"
	},
	LuaMenuMPRulesCPAPA = {
		text = "WEAPON/PI_CPAPA",
		value = "iw8_pi_cpapa_mp"
	},
	LuaMenuMPRulesGOLF21 = {
		text = "WEAPON/PI_GOLF21",
		value = "iw8_pi_golf21_mp"
	},
	LuaMenuMPRulesMIKE1911 = {
		text = "WEAPON/PI_MIKE1911",
		value = "iw8_pi_mike1911_mp"
	},
	LuaMenuMPRulesMIKE9 = {
		text = "WEAPON/PI_MIKE9",
		value = "iw8_pi_mike9_mp"
	},
	LuaMenuMPRulesRPAPA7 = {
		text = "WEAPON/LA_RPAPA7",
		value = "iw8_la_rpapa7_mp"
	},
	LuaMenuMPRulesJULIET = {
		text = "WEAPON/LA_JULIET",
		value = "iw8_la_juliet_mp"
	},
	LuaMenuMPRulesGROMEO = {
		text = "WEAPON/LA_GROMEO",
		value = "iw8_la_gromeo_mp"
	},
	LuaMenuMPRulesKGOLF = {
		text = "WEAPON/LA_KGOLF",
		value = "iw8_la_kgolf_mp"
	},
	LuaMenuMPRulesKnife = {
		text = "WEAPON/KNIFE_ONLY",
		value = "iw8_knife_mp"
	},
	LuaMenuMPRulesFists = {
		text = "WEAPON/FISTS",
		value = "iw8_fists_mp"
	},
	LuaMenuMPRulesRiotShield = {
		text = "WEAPON/ME_RIOTSHIELD",
		value = "iw8_me_riotshield_mp"
	},
	LuaMenuMPRulesKaliSticks = {
		text = "WEAPON/AKIMBO_BLUNT",
		value = "iw8_me_akimboblunt_mp"
	},
	LuaMenuMPRulesLSFists = {
		text = "WEAPON/FISTS",
		value = "iw8_fists_mp_ls"
	},
	LuaMenuMPRulesG21 = {
		text = "WEAPON/PI_MIKE1911",
		value = "iw8_pi_mike1911_mp"
	},
	LuaMenuMPRulesExfilKeepWeapons = {
		text = "LUA_MENU_MP/RULES_EXFIL_KEEP_WEAPONS",
		value = "iw8_pi_golf21_mp"
	},
	LuaMenuMPRulesFragGrenade = {
		text = "EQUIPMENT/FRAG",
		value = "equip_frag"
	},
	LuaMenuMPRulesSemtexGrenade = {
		text = "EQUIPMENT/SEMTEX",
		value = "equip_semtex"
	},
	LuaMenuMPRulesC4 = {
		text = "EQUIPMENT/C4",
		value = "equip_c4"
	},
	LuaMenuMPRulesClaymore = {
		text = "EQUIPMENT/CLAYMORE",
		value = "equip_claymore"
	},
	LuaMenuMPRulesATMine = {
		text = "EQUIPMENT/AT_MINE",
		value = "equip_at_mine"
	},
	LuaMenuMPRulesThrowingKnife = {
		text = "EQUIPMENT/THROWING_KNIFE",
		value = "equip_throwing_knife"
	},
	LuaMenuMPRulesThrowingKnifeFire = {
		text = "EQUIPMENT/THROWING_KNIFE_FIRE",
		value = "equip_throwing_knife_fire"
	},
	LuaMenuMPRulesMolotov = {
		text = "EQUIPMENT/MOLOTOV",
		value = "equip_molotov"
	},
	LuaMenuMPRulesThermite = {
		text = "EQUIPMENT/THERMITE",
		value = "equip_thermite"
	},
	LuaMenuMPRulesFlash = {
		text = "EQUIPMENT/FLASH",
		value = "equip_flash"
	},
	LuaMenuMPRulesSnapshotGrenade = {
		text = "EQUIPMENT/SNAPSHOT_GRENADE",
		value = "equip_snapshot_grenade"
	},
	LuaMenuMPRulesSmokeGrenade = {
		text = "EQUIPMENT/SMOKE",
		value = "equip_smoke"
	},
	LuaMenuMPRulesConcussionGrenade = {
		text = "EQUIPMENT/CONCUSSION",
		value = "equip_concussion"
	},
	LuaMenuMPRulesTrophySystem = {
		text = "EQUIPMENT/TROPHY",
		value = "equip_trophy"
	},
	LuaMenuMPRulesTacInsert = {
		text = "WEAPON/FLARE",
		value = "equip_tac_insert"
	},
	LuaMenuMPRulesDecoyGrenade = {
		text = "EQUIPMENT/DECOY",
		value = "equip_decoy"
	},
	LuaMenuMPRulesStimShot = {
		text = "EQUIPMENT/ADRENALINE",
		value = "equip_adrenaline"
	},
	LuaMenuMPRulesWeaponNone = {
		text = "LUA_MENU_MP/RULES_WEAPON_NONE",
		value = "none"
	},
	LuaMenuMPRulesWeaponRandom = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM",
		value = "random"
	},
	LuaMenuMPRulesWeaponRandomPrimary = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_PRIMARY",
		value = "rand_primary"
	},
	LuaMenuMPRulesWeaponRandomWeapon = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_WEAPON",
		value = "rand_weapon"
	},
	LuaMenuMPRulesWeaponRandomHandgun = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_PISTOL",
		value = "rand_pistol"
	},
	LuaMenuMPRulesWeaponRandomSMG = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_SMG",
		value = "rand_smg"
	},
	LuaMenuMPRulesWeaponRandomShotgun = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_SHOTGUN",
		value = "rand_shotgun"
	},
	LuaMenuMPRulesWeaponRandomAR = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_AR",
		value = "rand_assault"
	},
	LuaMenuMPRulesWeaponRandomLMG = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_LMG",
		value = "rand_lmg"
	},
	LuaMenuMPRulesWeaponRandomLauncher = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_LAUNCHER",
		value = "rand_launcher"
	},
	LuaMenuMPRulesWeaponRandomSniper = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_SNIPER",
		value = "rand_sniper"
	},
	LuaMenuMPRulesWeaponRandomDMR = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_DMR",
		value = "rand_dmr"
	},
	LuaMenuMPRulesWeaponRandomSniperDMR = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_SNIPERDMR",
		value = "rand_sniperdmr"
	},
	LuaMenuMPRulesWeaponRandomLethal = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_LETHAL",
		value = "rand_lethal"
	},
	LuaMenuMPRulesWeaponRandomTactical = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_TACTICAL",
		value = "rand_tactical"
	},
	LuaMenuMPRulesSetbacks1 = {
		text = "LUA_MENU_MP/RULES_SETBACKS_WEAPONS_1",
		value = 1
	},
	LuaMenuMPRulesSetbacks2 = {
		text = "LUA_MENU_MP/RULES_SETBACKS_WEAPONS",
		value = 2
	},
	LuaMenuMPRulesSetbacks3 = {
		text = "LUA_MENU_MP/RULES_SETBACKS_WEAPONS",
		value = 3
	},
	LuaMenuMPRulesSetbacks4 = {
		text = "LUA_MENU_MP/RULES_SETBACKS_WEAPONS",
		value = 4
	},
	LuaMenuMPRulesSetbacks5 = {
		text = "LUA_MENU_MP/RULES_SETBACKS_WEAPONS",
		value = 5
	},
	LuaMenuMPRulesLadder1 = {
		text = "LUA_MENU_MP/RULES_LADDER_1",
		value = 1
	},
	LuaMenuMPRulesLadder2 = {
		text = "LUA_MENU_MP/RULES_LADDER_2",
		value = 2
	},
	LuaMenuMPRulesLadder3 = {
		text = "LUA_MENU_MP/RULES_LADDER_3",
		value = 3
	},
	LuaMenuMPRulesLadder4 = {
		text = "LUA_MENU_MP/RULES_LADDER_4",
		value = 4
	},
	LuaMenuMPRulesDeaths1 = {
		text = "LUA_MENU_MP/RULES_DEATHS_1",
		value = 1
	},
	LuaMenuMPRulesDeaths2 = {
		text = "LUA_MENU_MP/RULES_DEATHS",
		value = 2
	},
	LuaMenuMPRulesDeaths3 = {
		text = "LUA_MENU_MP/RULES_DEATHS",
		value = 3
	},
	LuaMenuMPRulesDeaths4 = {
		text = "LUA_MENU_MP/RULES_DEATHS",
		value = 4
	},
	LuaMenuMPRulesDeaths5 = {
		text = "LUA_MENU_MP/RULES_DEATHS",
		value = 5
	},
	LuaMenuMPRulesKills1 = {
		text = "LUA_MENU_MP/RULES_KILLS_1",
		value = 1
	},
	LuaMenuMPRulesKills2 = {
		text = "LUA_MENU_MP/RULES_KILLS",
		value = 2
	},
	LuaMenuMPRulesKills3 = {
		text = "LUA_MENU_MP/RULES_KILLS",
		value = 3
	},
	LuaMenuMPRulesKills4 = {
		text = "LUA_MENU_MP/RULES_KILLS",
		value = 4
	},
	LuaMenuMPRulesKills5 = {
		text = "LUA_MENU_MP/RULES_KILLS",
		value = 5
	},
	LuaMenuMPRulesFFReflect = {
		text = "LUA_MENU_MP/FF_REFLECT",
		value = 2
	},
	LuaMenuMPRulesFFShare = {
		text = "LUA_MENU_MP/FF_SHARE",
		value = 3
	},
	LuaMenuMPRulesFFPunish = {
		text = "LUA_MENU_MP/FF_PUNISH",
		value = 4
	},
	LuaMenuMPRulesSuperAmmoBox = {
		text = "EQUIPMENT/AMMO_DROP",
		value = "super_ammo_drop"
	},
	LuaMenuMPRulesSuperReconDrone = {
		text = "SUPER_MP/RECON_DRONE",
		value = "super_recon_drone"
	},
	LuaMenuMPRulesSuperDeadSilence = {
		text = "SUPER_MP/DEADSILENCE",
		value = "super_deadsilence"
	},
	LuaMenuMPRulesSuperStoppingPower = {
		text = "EQUIPMENT/SUPPORT_BOX",
		value = "super_support_box"
	},
	LuaMenuMPRulesSuperTrophy = {
		text = "EQUIPMENT/TROPHY",
		value = "super_trophy"
	},
	LuaMenuMPRulesSuperTacCover = {
		text = "EQUIPMENT/TACTICAL_COVER",
		value = "super_tac_cover"
	},
	LuaMenuMPRulesSuperTacInsert = {
		text = "SUPER_MP/TAC_INSERT",
		value = "super_tac_insert"
	},
	LuaMenuMPRulesSuperEmpDrone = {
		text = "SUPER_MP/EMPDRONE",
		value = "super_emp_drone"
	},
	LuaMenuMPRulesSuperWeaponDrop = {
		text = "SUPER_MP/WEAPON_DROP",
		value = "super_weapon_drop"
	},
	LuaMenuMPRulesAONFTL = {
		text = "LUA_MENU_MP/RULES_AONFTL",
		value = 2
	},
	LuaMenuMPRulesTargetPlayerCycleFixed = {
		text = "LUA_MENU_MP/RULES_TARGET_PLAYER_CYCLE_FIXED",
		value = true
	},
	LuaMenuMPRulesTargetPlayerCycleRandom = {
		text = "LUA_MENU_MP/RULES_TARGET_PLAYER_CYCLE_RANDOM",
		value = false
	},
	LuaMenuMPValuePossessionResetNever = {
		text = "LUA_MENU_MP/RULES_VALUE_NEVER",
		value = 0
	},
	LuaMenuMPValuePossessionResetFirstTouch = {
		text = "LUA_MENU_MP/RULES_VALUE_FIRST_TOUCH",
		value = 1
	},
	LuaMenuMPValuePossessionResetIndividualTouch = {
		text = "LUA_MENU_MP/RULES_VALUE_INDIVIDUAL_TOUCH",
		value = 2
	},
	LuaMenuMPRulesArenaLoadoutsNormal = {
		text = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_NORMAL",
		value = 1
	},
	LuaMenuMPRulesArenaLoadoutsRandom = {
		text = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_RANDOM",
		value = 2
	},
	LuaMenuMPRulesArenaLoadoutsNone = {
		text = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_NONE",
		value = 3
	},
	LuaMenuMPRulesArenaLoadoutsBlueprint = {
		text = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_BLUEPRINT",
		value = 13
	},
	LuaMenuMPRulesArenaLoadoutsPickupBlueprint = {
		text = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_PICKUP_BLUEPRINT",
		value = 14
	},
	LuaMenuMPRulesArenaLoadoutsBlueprintCustom = {
		text = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_BLUEPRINT_CUSTOM",
		value = 15
	},
	LuaMenuMPRulesArenaAttachmentsSniperScopes = {
		text = "LUA_MENU_MP/RULES_ARENA_ATT_SN_SCOPES",
		value = 1
	},
	LuaMenuMPRulesArenaWinConditionLives = {
		text = "LUA_MENU_MP/RULES_ARENA_WIN_CONDITION_LIVES",
		value = 1
	},
	LuaMenuMPRulesArenaWinConditionHealth = {
		text = "LUA_MENU_MP/RULES_ARENA_WIN_CONDITION_HEALTH",
		value = 2
	},
	LuaMenuMPArenaEndzone = {
		text = "LUA_MENU_MP/RULES_ARENA_ENDZONE",
		value = 1
	},
	LuaMenuMPRulesJuggSpawnAttackers = {
		text = "LUA_MENU_MP/RULES_JUGG_SPAWN_ATTACKERS",
		value = 1
	},
	LuaMenuMPRulesJuggSpawnDefenders = {
		text = "LUA_MENU_MP/RULES_JUGG_SPAWN_DEFENDERS",
		value = 2
	},
	LuaMenuMPRulesJuggSpawnBoth = {
		text = "LUA_MENU_MP/RULES_JUGG_SPAWN_BOTH",
		value = 3
	},
	LuaMenuMPRulesCMDHVTDisabled = {
		text = "LUA_MENU_MP/RULES_CMD_HVT_DISABLED",
		value = 2
	},
	LuaMenuMPRulesCMDHVTSchool = {
		text = "LUA_MENU_MP/RULES_CMD_HVT_SCHOOL",
		value = 1
	},
	LuaMenuMPRulesCMDHVTEmbassy = {
		text = "LUA_MENU_MP/RULES_CMD_HVT_EMBASSY",
		value = 0
	},
	LuaMenuMPRulesCaptureTypeNormal = {
		text = "LUA_MENU_MP/RULES_NORMAL",
		value = 1
	},
	LuaMenuMPRulesCaptureTypeReclaim = {
		text = "LUA_MENU_MP/RULES_CAP_RECLAIM",
		value = 2
	},
	LuaMenuMPRulesCaptureTypePersistent = {
		text = "LUA_MENU_MP/RULES_CAP_PERSISTENT",
		value = 3
	},
	LuaMenuMPRulesCyberEMPSpawnRandom = {
		text = "LUA_MENU_MP/RULES_CYBER_EMPSPAWN_RANDOM",
		value = 3
	},
	LuaMenuMPRulesCyberEMPSpawnLinear = {
		text = "LUA_MENU_MP/RULES_LOCATION_ORDER_LINEAR",
		value = 4
	},
	LuaMenuMPRulesCyberEMPSpawnOne = {
		text = "LUA_MENU_MP/RULES_CYBER_EMPSPAWN_ONE",
		value = 0
	},
	LuaMenuMPRulesCyberEMPSpawnTwo = {
		text = "LUA_MENU_MP/RULES_CYBER_EMPSPAWN_TWO",
		value = 1
	},
	LuaMenuMPRulesCyberEMPSpawnThree = {
		text = "LUA_MENU_MP/RULES_CYBER_EMPSPAWN_THREE",
		value = 2
	},
	LuaMenuMPDisabledStaticTimer = {
		text = "LUA_MENU_MP/RULES_TIMER_RESETS",
		value = false
	},
	LuaMenuMPEnabledPersTimer = {
		text = "LUA_MENU_MP/RULES_PERS_TIMER",
		value = true
	},
	LuaMenuMPRulesEMPPingSeconds0Half = {
		value = 500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 0.5
	},
	LuaMenuMPRulesEMPPingSeconds1 = {
		value = 1000,
		text = "LUA_MENU_MP/RULES_SECONDS_1",
		displayValue = 1
	},
	LuaMenuMPRulesEMPPingSeconds1Half = {
		value = 1500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 1.5
	},
	LuaMenuMPRulesEMPPingSeconds2 = {
		value = 2000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 2
	},
	LuaMenuMPRulesEMPPingSeconds2Half = {
		value = 2500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 2.5
	},
	LuaMenuMPRulesEMPPingSeconds3 = {
		value = 3000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 3
	},
	LuaMenuMPRulesEMPPingSeconds3Half = {
		value = 3500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 3.5
	},
	LuaMenuMPRulesEMPPingSeconds4 = {
		value = 4000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 4
	},
	LuaMenuMPRulesEMPPingSeconds4Half = {
		value = 4500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 4.5
	},
	LuaMenuMPRulesEMPPingSeconds5 = {
		value = 5000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 5
	},
	LuaMenuMPRulesEMPPingSeconds5Half = {
		value = 5500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 5.5
	},
	LuaMenuMPRulesEMPPingSeconds6 = {
		value = 6000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 6
	},
	LuaMenuMPRulesEMPPingSeconds6Half = {
		value = 6500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 6.5
	},
	LuaMenuMPRulesEMPPingSeconds7 = {
		value = 7000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 7
	},
	LuaMenuMPRulesEMPPingSeconds7Half = {
		value = 7500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 7.5
	},
	LuaMenuMPRulesEMPPingSeconds8 = {
		value = 8000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 8
	},
	LuaMenuMPRulesEMPPingSeconds8Half = {
		value = 8500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 8.5
	},
	LuaMenuMPRulesEMPPingSeconds9 = {
		value = 9000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 9
	},
	LuaMenuMPRulesEMPPingSeconds9Half = {
		value = 9500,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 9.5
	},
	LuaMenuMPRulesEMPPingSeconds10 = {
		value = 10000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 10
	},
	LuaMenuMPRulesEMPPingSeconds11 = {
		value = 11000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 11
	},
	LuaMenuMPRulesEMPPingSeconds12 = {
		value = 12000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 12
	},
	LuaMenuMPRulesEMPPingSeconds13 = {
		value = 13000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 13
	},
	LuaMenuMPRulesEMPPingSeconds14 = {
		value = 14000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 14
	},
	LuaMenuMPRulesEMPPingSeconds15 = {
		value = 15000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 15
	},
	LuaMenuMPRulesEMPPingSeconds20 = {
		value = 20000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 20
	},
	LuaMenuMPRulesEMPPingSeconds25 = {
		value = 25000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 25
	},
	LuaMenuMPRulesEMPPingSeconds30 = {
		value = 30000,
		text = "LUA_MENU_MP/RULES_SECONDS",
		displayValue = 30
	},
	LuaMenuMPRulesLastStandNormal = {
		text = "LUA_MENU_MP/RULES_LAST_STAND_NORMAL",
		value = 1
	},
	LuaMenuMPRulesLastStandAllowRevive = {
		text = "LUA_MENU_MP/RULES_LAST_STAND_REVIVES",
		value = 2
	},
	LuaMenuMPRulesTeamCount0 = {
		text = "LUA_MENU_MP/RULES_TEAMS_0",
		value = 0
	},
	LuaMenuMPRulesTeamCount2 = {
		text = "LUA_MENU_MP/RULES_TEAMS_2",
		value = 2
	},
	LuaMenuMPRulesTeamCount3 = {
		text = "LUA_MENU_MP/RULES_TEAMS_3",
		value = 3
	},
	LuaMenuMPRulesTeamCount4 = {
		text = "LUA_MENU_MP/RULES_TEAMS_4",
		value = 4
	},
	LuaMenuMPRulesTeamCount5 = {
		text = "LUA_MENU_MP/RULES_TEAMS_5",
		value = 5
	},
	LuaMenuMPRulesTeamCount6 = {
		text = "LUA_MENU_MP/RULES_TEAMS_6",
		value = 6
	},
	LuaMenuMPRulesTeamCountMax = {
		text = "LUA_MENU_MP/RULES_TEAMS_MAX",
		value = 50
	},
	LuaMenuMPRulesTeamSize0 = {
		text = "LUA_MENU_MP/RULES_TEAM_SIZE_0",
		value = 0
	},
	LuaMenuMPRulesTeamSize1 = {
		text = "LUA_MENU_MP/RULES_TEAM_SIZE_1",
		value = 1
	},
	LuaMenuMPRulesTeamSize2 = {
		text = "LUA_MENU_MP/RULES_TEAM_SIZE_2",
		value = 2
	},
	LuaMenuMPRulesTeamSize3 = {
		text = "LUA_MENU_MP/RULES_TEAM_SIZE_3",
		value = 3
	},
	LuaMenuMPRulesTeamSize4 = {
		text = "LUA_MENU_MP/RULES_TEAM_SIZE_4",
		value = 4
	},
	LuaMenuMPRulesRadarConstantOn = {
		text = "LUA_MENU_MP/RULES_RADAR_CONSTANT_ON",
		value = 1
	},
	LuaMenuMPRulesRadarNormalSweep = {
		text = "LUA_MENU_MP/RULES_RADAR_NORMAL_SWEEP",
		value = 3
	},
	LuaMenuMPRulesRadarFastSweep = {
		text = "LUA_MENU_MP/RULES_RADAR_FAST_SWEEP",
		value = 5
	},
	LuaMenuMPRulesRadarDirectional = {
		text = "LUA_MENU_MP/RULES_RADAR_DIRECTIONAL",
		value = 6
	},
	LuaMenuMPRulesMagCountNone = {
		text = "LUA_MENU/RULES_NONE",
		value = 0
	},
	LuaMenuMPRulesMagCountOneMag = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 1
	},
	LuaMenuMPRulesMagCountTwoMags = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 2
	},
	LuaMenuMPRulesMagCountNormal = {
		text = "LUA_MENU_MP/RULES_MAG_COUNT_NORMAL",
		value = 3
	},
	LuaMenuMPRulesMagCountFourMags = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 4
	},
	LuaMenuMPRulesMagCountFiveMags = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 5
	},
	LuaMenuMPRulesMagCountSixMags = {
		text = "LUA_MENU_MP/RULES_NUM",
		value = 6
	},
	LuaMenuMPRulesMagCountMax = {
		text = "LUA_MENU_MP/RULES_MAG_COUNT_MAX",
		value = 7
	},
	LuaMenuMPRulesJuggSpeedDefault = {
		text = "LUA_MENU_MP/RULES_DEFAULT",
		value = 0
	},
	LuaMenuMPRulesJuggSpeedSlower = {
		text = "LUA_MENU_MP/RULES_SLOWER",
		value = -1
	},
	LuaMenuMPRulesJuggSpeedSlowest = {
		text = "LUA_MENU_MP/RULES_SLOWEST",
		value = -2
	},
	LuaMenuMPRulesJuggSpeedFaster = {
		text = "LUA_MENU_MP/RULES_FASTER",
		value = 1
	},
	LuaMenuMPRulesJuggSpeedFastest = {
		text = "LUA_MENU_MP/RULES_FASTEST",
		value = 2
	},
	LuaMenuMPRulesJuggTeamSpeedOff = {
		text = "LUA_MENU_MP/DISABLED",
		value = 0
	},
	LuaMenuMPRulesJuggTeamSpeedDefault = {
		text = "LUA_MENU_MP/RULES_DEFAULT",
		value = 1
	},
	LuaMenuMPRulesJuggTeamSpeedSlower = {
		text = "LUA_MENU_MP/RULES_SLOWER",
		value = -1
	},
	LuaMenuMPRulesJuggTeamSpeedSlowest = {
		text = "LUA_MENU_MP/RULES_SLOWEST",
		value = -2
	},
	LuaMenuMPRulesJuggTeamSpeedFaster = {
		text = "LUA_MENU_MP/RULES_FASTER",
		value = 2
	},
	LuaMenuMPRulesJuggTeamSpeedFastest = {
		text = "LUA_MENU_MP/RULES_FASTEST",
		value = 3
	},
	LuaMenuMPRulesFinalKillFK = {
		text = "LUA_MENU_MP/RULES_FINAL_KILL_FK",
		value = 0
	},
	LuaMenuMPRulesFinalKillPotG = {
		text = "LUA_MENU_MP/RULES_FINAL_KILL_POTG",
		value = 1
	},
	LuaMenuMPRulesFinalKillDisabled = {
		text = "LUA_MENU_MP/DISABLED",
		value = 2
	},
	LuaMenuMPRulesLocale0 = {
		text = "LUA_MENU_MP/RULES_LOCALE_0",
		value = 0
	},
	LuaMenuMPRulesLocale1 = {
		text = "LUA_MENU_MP/RULES_LOCALE_1",
		value = 1
	},
	LuaMenuMPRulesLocale2 = {
		text = "LUA_MENU_MP/RULES_LOCALE_2",
		value = 2
	},
	LuaMenuMPRulesLocale3 = {
		text = "LUA_MENU_MP/RULES_LOCALE_3",
		value = 3
	},
	LuaMenuMPRulesLocale4 = {
		text = "LUA_MENU_MP/RULES_LOCALE_4",
		value = 4
	},
	LuaMenuMPRulesLocale5 = {
		text = "LUA_MENU_MP/RULES_LOCALE_5",
		value = 5
	},
	LuaMenuMPRulesLocale6 = {
		text = "LUA_MENU_MP/RULES_LOCALE_6",
		value = 6
	},
	LuaMenuMPRulesBRStartWeapon0 = {
		text = "LUA_MENU_MP/RULES_BR_START_WEAPON_0",
		value = 0
	},
	LuaMenuMPRulesBRStartWeapon1 = {
		text = "LUA_MENU_MP/RULES_BR_START_WEAPON_1",
		value = 1
	},
	LuaMenuMPRulesBRStartWeapon2 = {
		text = "LUA_MENU_MP/RULES_BR_START_WEAPON_2",
		value = 2
	},
	LuaMenuMPRulesBRStartWeapon3 = {
		text = "LUA_MENU_MP/RULES_BR_START_WEAPON_3",
		value = 3
	},
	LuaMenuMPRulesBRStartWeapon4 = {
		text = "LUA_MENU_MP/RULES_BR_START_WEAPON_4",
		value = 4
	}
}

local function var_0_9()
	return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HardcoreModeOn)
end

local function var_0_10()
	return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.LastStand) == 2
end

local function var_0_11()
	return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.TacticalModeOn) == true
end

local function var_0_12()
	return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.InfilSkip)
end

local function var_0_13()
	return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MatchStartTime) == 15
end

local var_0_14 = 12
local var_0_15 = 45
local var_0_16 = 216
local var_0_17 = 952

local function var_0_18(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5, arg_12_6, arg_12_7, arg_12_8)
	local function var_12_0()
		local var_13_0 = MatchRules.BIJEDCBCBH(arg_12_2, arg_12_3)

		for iter_13_0, iter_13_1 in pairs(arg_12_6) do
			if iter_13_1.value == var_13_0 then
				return iter_13_0
			end
		end

		return 1
	end

	local var_12_1 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_12_1
	})

	var_12_1.id = "option_" .. arg_12_2 .. "_" .. arg_12_3

	var_12_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 675, 0, _1080p * 40)
	var_12_1.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_12_4)))

	var_12_1._defaultValue = MatchRules.DBAJHJAHCA(arg_12_2, arg_12_3)

	local function var_12_2(arg_14_0)
		if MatchRules.BIJEDCBCBH(arg_12_2, arg_12_3) ~= var_12_1._defaultValue then
			ACTIONS.AnimateSequence(var_12_1, "Changed")

			var_12_1._isDefault = false
		else
			ACTIONS.AnimateSequence(var_12_1, "NotChanged")

			var_12_1._isDefault = true
		end

		if not arg_14_0 then
			local var_14_0 = false

			if arg_12_0.currentOptionButtons and #arg_12_0.currentOptionButtons > 0 then
				for iter_14_0, iter_14_1 in pairs(arg_12_0.currentOptionButtons) do
					if not iter_14_1._isDefault then
						var_14_0 = true

						break
					end
				end
			end

			if var_14_0 then
				ACTIONS.AnimateSequence(arg_12_0.Tabs:GetTabAtIndex(arg_12_0._currentTabIndex), "Changed")
			else
				ACTIONS.AnimateSequence(arg_12_0.Tabs:GetTabAtIndex(arg_12_0._currentTabIndex), "NotChanged")
			end
		end
	end

	arg_12_8 = arg_12_8 or {}

	for iter_12_0, iter_12_1 in pairs(arg_12_8) do
		var_12_1:addEventHandler(iter_12_1.eventName, function(arg_15_0, arg_15_1)
			iter_12_1.eventFunction(arg_15_0, arg_15_1)
			var_12_2(false)
			arg_12_0.RefreshButtonEnableState()
		end)
	end

	var_12_1:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		assert(arg_12_0.ModeDetails)
		arg_12_0.ModeDetails.GenericItemInfo.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_12_4)))
		arg_12_0.ModeDetails.GenericItemInfo.BodyText:setText(Engine.CBBHFCGDIC(arg_12_5))
	end)
	var_12_1:addEventHandler("button_over_disable", function(arg_17_0, arg_17_1)
		assert(arg_12_0.ModeDetails)
		arg_12_0.ModeDetails.GenericItemInfo.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_12_4)))
		arg_12_0.ModeDetails.GenericItemInfo.BodyText:setText(Engine.CBBHFCGDIC(arg_12_5))
	end)

	local var_12_3 = ""

	var_12_1:addEventHandler("refresh_button_values", function(arg_18_0, arg_18_1)
		var_12_3 = arg_18_1.button and arg_18_1.button.id or ""

		if arg_18_0 ~= arg_18_1.button then
			local var_18_0 = var_12_0()

			if var_18_0 ~= arg_18_0.currentValue then
				arg_18_0:SetCurrentValue(var_18_0)
				var_12_2(false)
			end
		end
	end)

	local var_12_4
	local var_12_5
	local var_12_6 = {}

	for iter_12_2, iter_12_3 in pairs(arg_12_6) do
		if iter_12_3.displayValue ~= nil then
			local var_12_7 = iter_12_3.displayValue

			if iter_12_3.displayValueTwo ~= nil then
				local var_12_8 = iter_12_3.displayValueTwo

				table.insert(var_12_6, Engine.CBBHFCGDIC(iter_12_3.text, var_12_7, var_12_8))
			else
				table.insert(var_12_6, Engine.CBBHFCGDIC(iter_12_3.text, var_12_7))
			end
		else
			local var_12_9 = iter_12_3.value

			if type(var_12_9) == "string" then
				table.insert(var_12_6, Engine.CBBHFCGDIC(iter_12_3.text))
			else
				table.insert(var_12_6, Engine.CBBHFCGDIC(iter_12_3.text, var_12_9))
			end
		end
	end

	local function var_12_10(arg_19_0)
		MatchRules.CIGFFEAEFD(arg_12_2, arg_12_3, arg_12_6[arg_19_0].value)
		arg_12_0.GameSetupCategoryOptions:processEvent({
			immediate = true,
			name = "rule_changed_" .. arg_12_2 .. "_" .. arg_12_3,
			value = arg_12_6[arg_19_0].value,
			refreshOriginButtonID = var_12_3
		})
		var_12_2(false)
	end

	local var_12_11 = {
		labels = var_12_6,
		action = var_12_10,
		defaultValue = var_12_0()
	}

	LUI.AddUIArrowTextButtonLogic(var_12_1, arg_12_1, var_12_11)

	local function var_12_12()
		if MLG.AreMLGRulesEnabled() then
			return true
		elseif arg_12_7 then
			return arg_12_7()
		end

		return false
	end

	if var_12_12() then
		var_12_1:SetButtonDisabled(true)
	end

	local function var_12_13(arg_21_0, arg_21_1)
		if var_12_12() then
			var_12_1:SetButtonDisabled(true)
		else
			var_12_1:SetButtonDisabled(false)
		end
	end

	var_12_1.DisableButton = var_12_13

	var_12_1:registerEventHandler("unlock_disabled_buttons", var_12_13(element, event))
	var_12_2(true)

	return var_12_1
end

local function var_0_19(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = {}
	local var_22_1 = Lobby.GetCurrentGameType()
	local var_22_2
	local var_22_3

	if MP.IsNormalDogtagGameType(var_22_1) then
		local var_22_4 = Lobby.MatchRulesClasses.CommonOption
		local var_22_5 = Lobby.MatchRulesMembers.DogTags

		if arg_22_2 then
			if var_0_4(var_22_4, var_22_5) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_4, var_22_5, var_0_5.LuaMenuMPRulesDogTags, var_0_6.LuaMenuMPRulesDogTagsDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}, var_0_10, {
				{
					eventName = "rule_changed_commonOption_lastStand",
					eventFunction = function(arg_23_0, arg_23_1)
						if var_0_10() then
							arg_23_0:SetButtonDisabled(true)
						else
							arg_23_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end
	end

	if MP.IsPointsPerKillGameType(var_22_1) then
		local var_22_6 = Lobby.MatchRulesClasses.CommonOption
		local var_22_7 = Lobby.MatchRulesMembers.PointsPerKill

		if arg_22_2 then
			if var_0_4(var_22_6, var_22_7) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_6, var_22_7, var_0_5.LuaMenuMPRulesPointsPerKill, var_0_6.LuaMenuMPRulesPointsPerKillDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end

		local var_22_8 = Lobby.MatchRulesClasses.CommonOption
		local var_22_9 = Lobby.MatchRulesMembers.PointsPerDeath

		if arg_22_2 then
			if var_0_4(var_22_8, var_22_9) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_8, var_22_9, var_0_5.LuaMenuMPRulesPointsPerDeath, var_0_6.LuaMenuMPRulesPointsPerDeathDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end

		local var_22_10 = Lobby.MatchRulesClasses.CommonOption
		local var_22_11 = Lobby.MatchRulesMembers.PointsHeadshotBonus

		if arg_22_2 then
			if var_0_4(var_22_10, var_22_11) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_10, var_22_11, var_0_5.LuaMenuMPRulesPointsHeadshotBonus, var_0_6.LuaMenuMPRulesPointsHeadshotBonusDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end

		local var_22_12 = Lobby.MatchRulesClasses.CommonOption
		local var_22_13 = Lobby.MatchRulesMembers.PointsPerKSKill

		if arg_22_2 then
			if var_0_4(var_22_12, var_22_13) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_12, var_22_13, var_0_5.LuaMenuMPRulesPointsPerKSKill, var_0_6.LuaMenuMPRulesPointsPerKSKillDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end
	end

	if var_22_1 == MP.GameMode.FrontGameType then
		local var_22_14 = Lobby.MatchRulesClasses.FrontData
		local var_22_15 = Lobby.MatchRulesMembers.FriendlyBaseScore

		if arg_22_2 then
			if var_0_4(var_22_14, var_22_15) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_14, var_22_15, var_0_5.LuaMenuMPRulesFriendlyBaseScore, var_0_6.LuaMenuMPRulesFriendlyBaseScoreDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints6,
				var_0_8.LuaMenuMPRulesPoints7,
				var_0_8.LuaMenuMPRulesPoints8,
				var_0_8.LuaMenuMPRulesPoints9,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end

		local var_22_16 = Lobby.MatchRulesClasses.FrontData
		local var_22_17 = Lobby.MatchRulesMembers.MidfieldScore

		if arg_22_2 then
			if var_0_4(var_22_16, var_22_17) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_16, var_22_17, var_0_5.LuaMenuMPRulesMidfieldScore, var_0_6.LuaMenuMPRulesMidfieldScoreDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints6,
				var_0_8.LuaMenuMPRulesPoints7,
				var_0_8.LuaMenuMPRulesPoints8,
				var_0_8.LuaMenuMPRulesPoints9,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end

		local var_22_18 = Lobby.MatchRulesClasses.FrontData
		local var_22_19 = Lobby.MatchRulesMembers.EnemyBaseScore

		if arg_22_2 then
			if var_0_4(var_22_18, var_22_19) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_18, var_22_19, var_0_5.LuaMenuMPRulesEnemyBaseScore, var_0_6.LuaMenuMPRulesEnemyBaseScoreDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints6,
				var_0_8.LuaMenuMPRulesPoints7,
				var_0_8.LuaMenuMPRulesPoints8,
				var_0_8.LuaMenuMPRulesPoints9,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end
	end

	if var_22_1 == MP.GameMode.BallGameType then
		local var_22_20 = Lobby.MatchRulesClasses.BallData
		local var_22_21 = Lobby.MatchRulesMembers.ScoreCarry

		if arg_22_2 then
			if var_0_4(var_22_20, var_22_21) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_20, var_22_21, var_0_5.LuaMenuMPRulesScoreCarry, var_0_6.LuaMenuMPRulesScoreCarryDesc, {
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints6,
				var_0_8.LuaMenuMPRulesPoints7,
				var_0_8.LuaMenuMPRulesPoints8,
				var_0_8.LuaMenuMPRulesPoints9
			}))
		end

		local var_22_22 = Lobby.MatchRulesClasses.BallData
		local var_22_23 = Lobby.MatchRulesMembers.ScoreThrow

		if arg_22_2 then
			if var_0_4(var_22_22, var_22_23) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_22, var_22_23, var_0_5.LuaMenuMPRulesScoreThrow, var_0_6.LuaMenuMPRulesScoreThrowDesc, {
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints6,
				var_0_8.LuaMenuMPRulesPoints7,
				var_0_8.LuaMenuMPRulesPoints8,
				var_0_8.LuaMenuMPRulesPoints9
			}))
		end

		local function var_22_24()
			return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.BallData, Lobby.MatchRulesMembers.SatelliteCount) > 1
		end

		local var_22_25 = Lobby.MatchRulesClasses.BallData
		local var_22_26 = Lobby.MatchRulesMembers.SatelliteCount

		if arg_22_2 then
			if var_0_4(var_22_25, var_22_26) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_25, var_22_26, var_0_5.LuaMenuMPRulesSatelliteCount, var_0_6.LuaMenuMPRulesSatelliteCountDesc, {
				var_0_8.LuaMenuMPRulesSatellites1,
				var_0_8.LuaMenuMPRulesSatellites2,
				var_0_8.LuaMenuMPRulesSatellites3,
				var_0_8.LuaMenuMPRulesSatellites4,
				var_0_8.LuaMenuMPRulesSatellites5
			}, nil, {
				{
					eventName = "rule_changed_ballData_satelliteCount",
					eventFunction = function(arg_25_0, arg_25_1)
						if var_22_24() then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.BallCommonData, Lobby.MatchRulesMembers.PossessionResetCondition, 0)
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.BallCommonData, Lobby.MatchRulesMembers.PossessionResetTime, 0)
							var_0_0(arg_22_0)

							if arg_25_1.refreshOriginButtonID and arg_25_1.refreshOriginButtonID == "" then
								arg_22_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_25_0
								})
							end
						end
					end
				}
			}))
		end

		local var_22_27 = Lobby.MatchRulesClasses.BallData
		local var_22_28 = Lobby.MatchRulesMembers.PracticeMode

		if arg_22_2 then
			if var_0_4(var_22_27, var_22_28) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_27, var_22_28, var_0_5.LuaMenuMPRulesPracticeMode, var_0_6.LuaMenuMPRulesPracticeModeDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local function var_22_29()
			return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.BallCommonData, Lobby.MatchRulesMembers.PossessionResetCondition) == 0
		end

		local var_22_30 = Lobby.MatchRulesClasses.BallCommonData
		local var_22_31 = Lobby.MatchRulesMembers.PossessionResetCondition

		if arg_22_2 then
			if var_0_4(var_22_30, var_22_31) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_30, var_22_31, var_0_5.LuaMenuMPRulesPossessionResetCondition, var_0_6.LuaMenuMPRulesPossessionResetConditionDesc, {
				var_0_8.LuaMenuMPValuePossessionResetNever,
				var_0_8.LuaMenuMPValuePossessionResetFirstTouch,
				var_0_8.LuaMenuMPValuePossessionResetIndividualTouch
			}, var_22_24, {
				{
					eventName = "rule_changed_ballData_satelliteCount",
					eventFunction = function(arg_27_0, arg_27_1)
						if var_22_24() then
							arg_27_0:SetButtonDisabled(true)
						else
							arg_27_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_32 = Lobby.MatchRulesClasses.BallCommonData
		local var_22_33 = Lobby.MatchRulesMembers.PossessionResetTime

		if arg_22_2 then
			if var_0_4(var_22_32, var_22_33) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_32, var_22_33, var_0_5.LuaMenuMPRulesPossessionResetTime, var_0_6.LuaMenuMPRulesPossessionResetTimeDesc, {
				var_0_8.LuaMenuMPRulesUnlimited,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPRulesSeconds150
			}, var_22_29, {
				{
					eventName = "rule_changed_ballCommonData_possessionResetCondition",
					eventFunction = function(arg_28_0, arg_28_1)
						if var_22_29() then
							arg_28_0:SetButtonDisabled(true)
						else
							arg_28_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end
	end

	if var_22_1 == MP.GameMode.BlitzGameType then
		local var_22_34 = Lobby.MatchRulesClasses.BlitzData
		local var_22_35 = Lobby.MatchRulesMembers.WinRule

		if arg_22_2 then
			if var_0_4(var_22_34, var_22_35) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_34, var_22_35, var_0_5.LuaMenuMPRulesWinRule, var_0_6.LuaMenuMPRulesWinRuleDesc, {
				var_0_8.LuaMenuMPRulesRoundWins,
				var_0_8.LuaMenuMPRulesTotalFlagCaptures
			}))
		end

		local var_22_36 = Lobby.MatchRulesClasses.BlitzData
		local var_22_37 = Lobby.MatchRulesMembers.CaptureCondition

		if arg_22_2 then
			if var_0_4(var_22_36, var_22_37) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_36, var_22_37, var_0_5.LuaMenuMPRulesCaptureCondition, var_0_6.LuaMenuMPRulesCaptureConditionDesc, {
				var_0_8.LuaMenuMPRulesFlagAtBase,
				var_0_8.LuaMenuMPRulesFlagAnywhere
			}))
		end

		local var_22_38 = Lobby.MatchRulesClasses.BlitzData
		local var_22_39 = Lobby.MatchRulesMembers.ReturnTime

		if arg_22_2 then
			if var_0_4(var_22_38, var_22_39) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_38, var_22_39, var_0_5.LuaMenuMPRulesReturnTime, var_0_6.LuaMenuMPRulesReturnTimeDesc, {
				var_0_8.LuaMenuMPRulesDisabledNeg,
				var_0_8.LuaMenuMPRulesInstant,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end
	end

	if var_22_1 == MP.GameMode.CTFGameType then
		local var_22_40 = Lobby.MatchRulesClasses.CTFData
		local var_22_41 = Lobby.MatchRulesMembers.WinRule

		if arg_22_2 then
			if var_0_4(var_22_40, var_22_41) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_40, var_22_41, var_0_5.LuaMenuMPRulesWinRule, var_0_6.LuaMenuMPRulesWinRuleDesc, {
				var_0_8.LuaMenuMPRulesRoundWins,
				var_0_8.LuaMenuMPRulesTotalFlagCaptures
			}))
		end

		local var_22_42 = Lobby.MatchRulesClasses.CTFData
		local var_22_43 = Lobby.MatchRulesMembers.CaptureCondition

		if arg_22_2 then
			if var_0_4(var_22_42, var_22_43) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_42, var_22_43, var_0_5.LuaMenuMPRulesCaptureCondition, var_0_6.LuaMenuMPRulesCaptureConditionDesc, {
				var_0_8.LuaMenuMPRulesFlagAtBase,
				var_0_8.LuaMenuMPRulesFlagAnywhere
			}))
		end

		local var_22_44 = Lobby.MatchRulesClasses.CTFData
		local var_22_45 = Lobby.MatchRulesMembers.ReturnTime

		if arg_22_2 then
			if var_0_4(var_22_44, var_22_45) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_44, var_22_45, var_0_5.LuaMenuMPRulesReturnTime, var_0_6.LuaMenuMPRulesReturnTimeDesc, {
				var_0_8.LuaMenuMPRulesDisabledNeg,
				var_0_8.LuaMenuMPRulesInstant,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end
	end

	if var_22_1 == MP.GameMode.GrndGameType then
		local var_22_46 = Lobby.MatchRulesClasses.GrndData
		local var_22_47 = Lobby.MatchRulesMembers.DropTime

		if arg_22_2 then
			if var_0_4(var_22_46, var_22_47) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_46, var_22_47, var_0_5.LuaMenuMPRulesDropTime, var_0_6.LuaMenuMPRulesDropTimeDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end
	end

	if var_22_1 == MP.GameMode.DemoGameType then
		local var_22_48 = Lobby.MatchRulesClasses.DemData
		local var_22_49 = Lobby.MatchRulesMembers.ExtraTime

		if arg_22_2 then
			if var_0_4(var_22_48, var_22_49) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_48, var_22_49, var_0_5.LuaMenuMPRulesExtraTime, var_0_6.LuaMenuMPRulesExtraTimeDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesMinutesHalf,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes1Half,
				var_0_8.LuaMenuMPRulesMinutes2,
				var_0_8.LuaMenuMPRulesMinutes2Half,
				var_0_8.LuaMenuMPRulesMinutes3,
				var_0_8.LuaMenuMPRulesMinutes3Half,
				var_0_8.LuaMenuMPRulesMinutes4,
				var_0_8.LuaMenuMPRulesMinutes4Half,
				var_0_8.LuaMenuMPRulesMinutes5
			}))
		end

		local var_22_50 = Lobby.MatchRulesClasses.DemData
		local var_22_51 = Lobby.MatchRulesMembers.OvertimeLimit

		if arg_22_2 then
			if var_0_4(var_22_50, var_22_51) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_50, var_22_51, var_0_5.LuaMenuMPRulesOvertimeLimit, var_0_6.LuaMenuMPRulesOvertimeLimitDesc, {
				var_0_8.LuaMenuMPRulesUnlimited,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes1Half,
				var_0_8.LuaMenuMPRulesMinutes2,
				var_0_8.LuaMenuMPRulesMinutes2Half,
				var_0_8.LuaMenuMPRulesMinutes3,
				var_0_8.LuaMenuMPRulesMinutes3Half,
				var_0_8.LuaMenuMPRulesMinutes4,
				var_0_8.LuaMenuMPRulesMinutes4Half,
				var_0_8.LuaMenuMPRulesMinutes5
			}))
		end
	end

	if var_22_1 == MP.GameMode.SDGameType or var_22_1 == MP.GameMode.SRGameType or var_22_1 == MP.GameMode.DemoGameType or var_22_1 == MP.GameMode.CyberGameType then
		local var_22_52 = Lobby.MatchRulesClasses.BombData
		local var_22_53 = Lobby.MatchRulesMembers.BombTimer

		if arg_22_2 then
			if var_0_4(var_22_52, var_22_53) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_52, var_22_53, var_0_5.LuaMenuMPRulesBombTimer, var_0_6.LuaMenuMPRulesBombTimerDesc, {
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end
	end

	if var_22_1 == MP.GameMode.SDGameType or var_22_1 == MP.GameMode.SRGameType or var_22_1 == MP.GameMode.DemoGameType or var_22_1 == MP.GameMode.CyberGameType then
		local var_22_54 = Lobby.MatchRulesClasses.BombData
		local var_22_55 = Lobby.MatchRulesMembers.PlantTime

		if arg_22_2 then
			if var_0_4(var_22_54, var_22_55) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_54, var_22_55, var_0_5.LuaMenuMPRulesPlantTime, var_0_6.LuaMenuMPRulesPlantTimeDesc, {
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds8Half,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds9Half,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end
	end

	if var_22_1 == MP.GameMode.SDGameType or var_22_1 == MP.GameMode.SRGameType or var_22_1 == MP.GameMode.DemoGameType or var_22_1 == MP.GameMode.CyberGameType then
		local var_22_56 = Lobby.MatchRulesClasses.BombData
		local var_22_57 = Lobby.MatchRulesMembers.DefuseTime

		if arg_22_2 then
			if var_0_4(var_22_56, var_22_57) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_56, var_22_57, var_0_5.LuaMenuMPRulesDefuseTime, var_0_6.LuaMenuMPRulesDefuseTimeDesc, {
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds8Half,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds9Half,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end
	end

	if var_22_1 == MP.GameMode.SDGameType or var_22_1 == MP.GameMode.SRGameType then
		local var_22_58 = Lobby.MatchRulesClasses.BombData
		local var_22_59 = Lobby.MatchRulesMembers.MultiBomb

		if arg_22_2 then
			if var_0_4(var_22_58, var_22_59) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_58, var_22_59, var_0_5.LuaMenuMPRulesMultiBomb, var_0_6.LuaMenuMPRulesMultiBombDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_22_1 == MP.GameMode.SDGameType or var_22_1 == MP.GameMode.SRGameType or var_22_1 == MP.GameMode.DemoGameType then
		local var_22_60 = Lobby.MatchRulesClasses.BombData
		local var_22_61 = Lobby.MatchRulesMembers.SilentPlant

		if arg_22_2 then
			if var_0_4(var_22_60, var_22_61) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_60, var_22_61, var_0_5.LuaMenuMPRulesSilentPlant, var_0_6.LuaMenuMPRulesSilentPlantDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_22_1 == MP.GameMode.SDGameType or var_22_1 == MP.GameMode.SRGameType or var_22_1 == MP.GameMode.DemoGameType then
		local var_22_62 = Lobby.MatchRulesClasses.BombData
		local var_22_63 = Lobby.MatchRulesMembers.ResetProgress

		if arg_22_2 then
			if var_0_4(var_22_62, var_22_63) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_62, var_22_63, var_0_5.LuaMenuMPRulesResetProgress, var_0_6.LuaMenuMPRulesResetProgressDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end
	end

	if var_22_1 == MP.GameMode.BallGameType or var_22_1 == MP.GameMode.CTFGameType or var_22_1 == MP.GameMode.TDefGameType or var_22_1 == MP.GameMode.CyberGameType or var_22_1 == MP.GameMode.BlitzGameType then
		local var_22_64 = Lobby.MatchRulesClasses.CarryData
		local var_22_65 = Lobby.MatchRulesMembers.ShowEnemyCarrier

		if arg_22_2 then
			if var_0_4(var_22_64, var_22_65) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_64, var_22_65, var_0_5.LuaMenuMPRulesShowEnemyCarrier, var_0_6.LuaMenuMPRulesShowEnemyCarrierDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPConstantNumValue,
				var_0_8.LuaMenuMPRulesPingSeconds1,
				var_0_8.LuaMenuMPRulesPingSeconds1Half,
				var_0_8.LuaMenuMPRulesPingSeconds2,
				var_0_8.LuaMenuMPRulesPingSeconds3,
				var_0_8.LuaMenuMPRulesPingSeconds4
			}))
		end
	end

	if var_22_1 == MP.GameMode.BallGameType or var_22_1 == MP.GameMode.CTFGameType or var_22_1 == MP.GameMode.TDefGameType or var_22_1 == MP.GameMode.CyberGameType or var_22_1 == MP.GameMode.BlitzGameType then
		local var_22_66 = Lobby.MatchRulesClasses.CarryData
		local var_22_67 = Lobby.MatchRulesMembers.IdleResetTime

		if arg_22_2 then
			if var_0_4(var_22_66, var_22_67) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_66, var_22_67, var_0_5.LuaMenuMPRulesIdleResetTime, var_0_6.LuaMenuMPRulesIdleResetTimeDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end
	end

	if var_22_1 == MP.GameMode.CTFGameType or var_22_1 == MP.GameMode.BlitzGameType then
		local var_22_68 = Lobby.MatchRulesClasses.CarryData
		local var_22_69 = Lobby.MatchRulesMembers.PickupTime

		if arg_22_2 then
			if var_0_4(var_22_68, var_22_69) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_68, var_22_69, var_0_5.LuaMenuMPRulesPickupTime, var_0_6.LuaMenuMPRulesPickupTimeDesc, {
				var_0_8.LuaMenuMPRulesInstant,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end
	end

	if var_22_1 == MP.GameMode.TDefGameType then
		local var_22_70 = Lobby.MatchRulesClasses.TdefData
		local var_22_71 = Lobby.MatchRulesMembers.PPKTeamNoFlag

		if arg_22_2 then
			if var_0_4(var_22_70, var_22_71) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_70, var_22_71, var_0_5.LuaMenuMPRulesPPKTeamNoFlag, var_0_6.LuaMenuMPRulesPPKTeamNoFlagDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints55,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints65,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints85,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints95,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints150,
				var_0_8.LuaMenuMPRulesPoints200,
				var_0_8.LuaMenuMPRulesPoints250
			}))
		end

		local var_22_72 = Lobby.MatchRulesClasses.TdefData
		local var_22_73 = Lobby.MatchRulesMembers.PPKTeamWithFlag

		if arg_22_2 then
			if var_0_4(var_22_72, var_22_73) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_72, var_22_73, var_0_5.LuaMenuMPRulesPPKTeamWithFlag, var_0_6.LuaMenuMPRulesPPKTeamWithFlagDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints55,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints65,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints85,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints95,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints150,
				var_0_8.LuaMenuMPRulesPoints200,
				var_0_8.LuaMenuMPRulesPoints250
			}))
		end

		local var_22_74 = Lobby.MatchRulesClasses.TdefData
		local var_22_75 = Lobby.MatchRulesMembers.PPKFlagCarrier

		if arg_22_2 then
			if var_0_4(var_22_74, var_22_75) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_74, var_22_75, var_0_5.LuaMenuMPRulesPPKFlagCarrier, var_0_6.LuaMenuMPRulesPPKFlagCarrierDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints55,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints65,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints85,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints95,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints150,
				var_0_8.LuaMenuMPRulesPoints200,
				var_0_8.LuaMenuMPRulesPoints250
			}))
		end

		local function var_22_76()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.TdefData, Lobby.MatchRulesMembers.DelayPlayer)
		end

		local var_22_77 = Lobby.MatchRulesClasses.TdefData
		local var_22_78 = Lobby.MatchRulesMembers.DelayPlayer

		if arg_22_2 then
			if var_0_4(var_22_77, var_22_78) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_77, var_22_78, var_0_5.LuaMenuMPRulesDelayPlayer, var_0_6.LuaMenuMPRulesDelayPlayerDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end

		local var_22_79 = Lobby.MatchRulesClasses.TdefData
		local var_22_80 = Lobby.MatchRulesMembers.SpawnDelay

		if arg_22_2 then
			if var_0_4(var_22_79, var_22_80) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_79, var_22_80, var_0_5.LuaMenuMPRulesSpawnDelay, var_0_6.LuaMenuMPRulesSpawnDelayDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds10
			}, var_22_76, {
				{
					eventName = "rule_changed_tdefData_delayPlayer",
					eventFunction = function(arg_30_0, arg_30_1)
						if var_22_76() then
							arg_30_0:SetButtonDisabled(true)
						else
							arg_30_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_81 = Lobby.MatchRulesClasses.TdefData
		local var_22_82 = Lobby.MatchRulesMembers.FlagActivationDelay

		if arg_22_2 then
			if var_0_4(var_22_81, var_22_82) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_81, var_22_82, var_0_5.LuaMenuMPRulesFlagActivationDelay, var_0_6.LuaMenuMPRulesFlagActivationDelayDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end
	end

	if var_22_1 == MP.GameMode.DomGameType or var_22_1 == MP.GameMode.ArenaGameType then
		local var_22_83 = Lobby.MatchRulesClasses.DomData
		local var_22_84 = Lobby.MatchRulesMembers.FlagCaptureTime

		if arg_22_2 then
			if var_0_4(var_22_83, var_22_84) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_83, var_22_84, var_0_5.LuaMenuMPRulesFlagCaptureTime, var_0_6.LuaMenuMPRulesCapRateDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds8Half,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds9Half,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end
	end

	if var_22_1 == MP.GameMode.DomGameType then
		local var_22_85 = Lobby.MatchRulesClasses.DomData
		local var_22_86 = Lobby.MatchRulesMembers.FlagsRequiredToScore

		if arg_22_2 then
			if var_0_4(var_22_85, var_22_86) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_85, var_22_86, var_0_5.LuaMenuMPRulesFlagsRequiredToScore, var_0_6.LuaMenuMPRulesFlagsRequiredToScoreDesc, {
				var_0_8.LuaMenuMPRulesZones1,
				var_0_8.LuaMenuMPRulesZones2,
				var_0_8.LuaMenuMPRulesZones3
			}))
		end

		local var_22_87 = Lobby.MatchRulesClasses.DomData
		local var_22_88 = Lobby.MatchRulesMembers.PointsPerFlag

		if arg_22_2 then
			if var_0_4(var_22_87, var_22_88) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_87, var_22_88, var_0_5.LuaMenuMPRulesPointsPerFlag, var_0_6.LuaMenuMPRulesPointsPerFlagDesc, {
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50
			}))
		end

		local var_22_89 = Lobby.MatchRulesClasses.DomData
		local var_22_90 = Lobby.MatchRulesMembers.FlagNeutralization

		if arg_22_2 then
			if var_0_4(var_22_89, var_22_90) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_89, var_22_90, var_0_5.LuaMenuMPRulesFlagNeutralization, var_0_6.LuaMenuMPRulesFlagNeutralizationDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_91 = Lobby.MatchRulesClasses.DomData
		local var_22_92 = Lobby.MatchRulesMembers.ObjScalar

		if arg_22_2 then
			if var_0_4(var_22_91, var_22_92) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_91, var_22_92, var_0_5.LuaMenuMPRulesObjScalar, var_0_6.LuaMenuMPRulesObjScalarDesc, {
				var_0_8.LuaMenuMPRulesMultiplier4,
				var_0_8.LuaMenuMPRulesMultiplier4Half,
				var_0_8.LuaMenuMPRulesMultiplier5,
				var_0_8.LuaMenuMPRulesMultiplier5Half,
				var_0_8.LuaMenuMPRulesMultiplier6,
				var_0_8.LuaMenuMPRulesNormalMod,
				var_0_8.LuaMenuMPRulesMultiplier1Point1,
				var_0_8.LuaMenuMPRulesMultiplier1Point2,
				var_0_8.LuaMenuMPRulesMultiplier1Point3,
				var_0_8.LuaMenuMPRulesMultiplier1Point4,
				var_0_8.LuaMenuMPRulesMultiplier1Half,
				var_0_8.LuaMenuMPRulesMultiplier1Point6,
				var_0_8.LuaMenuMPRulesMultiplier1Point7,
				var_0_8.LuaMenuMPRulesMultiplier1Point8,
				var_0_8.LuaMenuMPRulesMultiplier1Point9,
				var_0_8.LuaMenuMPRulesMultiplier2,
				var_0_8.LuaMenuMPRulesMultiplier2Quarter,
				var_0_8.LuaMenuMPRulesMultiplier2Half,
				var_0_8.LuaMenuMPRulesMultiplier3,
				var_0_8.LuaMenuMPRulesMultiplier3Half
			}))
		end

		local var_22_93 = Lobby.MatchRulesClasses.DomData
		local var_22_94 = Lobby.MatchRulesMembers.NumFlagsScoreOnKill

		if arg_22_2 then
			if var_0_4(var_22_93, var_22_94) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_93, var_22_94, var_0_5.LuaMenuMPRulesNumFlagsScoreOnKill, var_0_6.LuaMenuMPRulesNumFlagsScoreOnKillDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesZones1,
				var_0_8.LuaMenuMPRulesZones2,
				var_0_8.LuaMenuMPRulesZones3
			}))
		end

		local var_22_95 = Lobby.MatchRulesClasses.SiegeData
		local var_22_96 = Lobby.MatchRulesMembers.PreCapPoints

		if arg_22_2 then
			if var_0_4(var_22_95, var_22_96) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_95, var_22_96, var_0_5.LuaMenuMPRulesPreCap, var_0_6.LuaMenuMPRulesPreCapDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_22_1 == MP.GameMode.HQGameType then
		local var_22_97 = Lobby.MatchRulesClasses.HQData
		local var_22_98 = Lobby.MatchRulesMembers.ZoneCaptureTime

		if arg_22_2 then
			if var_0_4(var_22_97, var_22_98) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_97, var_22_98, var_0_5.LuaMenuMPRulesHQCaptureTime, var_0_6.LuaMenuMPRulesHQCaptureTimeDesc, {
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesInstant,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14
			}))
		end

		local var_22_99 = Lobby.MatchRulesClasses.HQData
		local var_22_100 = Lobby.MatchRulesMembers.ZoneTimeout

		if arg_22_2 then
			if var_0_4(var_22_99, var_22_100) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_99, var_22_100, var_0_5.LuaMenuMPRulesHQTimeout, var_0_6.LuaMenuMPRulesHQTimeoutDesc, {
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPRulesSeconds150,
				var_0_8.LuaMenuMPRulesSeconds180,
				var_0_8.LuaMenuMPRulesSeconds210,
				var_0_8.LuaMenuMPRulesSeconds240,
				var_0_8.LuaMenuMPRulesSeconds270,
				var_0_8.LuaMenuMPRulesSeconds300,
				var_0_8.LuaMenuMPRulesUnlimited,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_22_101 = Lobby.MatchRulesClasses.HQData
		local var_22_102 = Lobby.MatchRulesMembers.ZoneLifetime

		if arg_22_2 then
			if var_0_4(var_22_101, var_22_102) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_101, var_22_102, var_0_5.LuaMenuMPRulesHQLifetime, var_0_6.LuaMenuMPRulesHQLifetimeDesc, {
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPRulesSeconds150,
				var_0_8.LuaMenuMPRulesSeconds180,
				var_0_8.LuaMenuMPRulesSeconds210,
				var_0_8.LuaMenuMPRulesSeconds240,
				var_0_8.LuaMenuMPRulesSeconds270,
				var_0_8.LuaMenuMPRulesSeconds300,
				var_0_8.LuaMenuMPRulesUnlimited,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45
			}))
		end

		local var_22_103 = Lobby.MatchRulesClasses.HQData
		local var_22_104 = Lobby.MatchRulesMembers.FirstZoneActivationDelay

		if arg_22_2 then
			if var_0_4(var_22_103, var_22_104) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_103, var_22_104, var_0_5.LuaMenuMPRulesFirstHQActivationDelay, var_0_6.LuaMenuMPRulesFirstHQActivationDelayDesc, {
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25
			}))
		end

		local var_22_105 = Lobby.MatchRulesClasses.HQData
		local var_22_106 = Lobby.MatchRulesMembers.ZoneActivationDelay

		if arg_22_2 then
			if var_0_4(var_22_105, var_22_106) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_105, var_22_106, var_0_5.LuaMenuMPRulesHQActivationDelay, var_0_6.LuaMenuMPRulesHQActivationDelayDesc, {
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25
			}))
		end

		local var_22_107 = Lobby.MatchRulesClasses.HQData
		local var_22_108 = Lobby.MatchRulesMembers.ZoneSelectionDelay

		if arg_22_2 then
			if var_0_4(var_22_107, var_22_108) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_107, var_22_108, var_0_5.LuaMenuMPRulesHQSelectionDelay, var_0_6.LuaMenuMPRulesHQSelectionDelayDesc, {
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25
			}))
		end

		local var_22_109 = Lobby.MatchRulesClasses.HQData
		local var_22_110 = Lobby.MatchRulesMembers.RandomLocationOrder

		if arg_22_2 then
			if var_0_4(var_22_109, var_22_110) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_109, var_22_110, var_0_5.LuaMenuMPRulesHQRandomLocationOrder, var_0_6.LuaMenuMPRulesHQRandomLocationOrderDesc, {
				var_0_8.LuaMenuMPRulesLocationOrderLinear,
				var_0_8.LuaMenuMPRulesLocationOrderRandom
			}))
		end

		local var_22_111 = Lobby.MatchRulesClasses.HQData
		local var_22_112 = Lobby.MatchRulesMembers.AdditiveScoring

		if arg_22_2 then
			if var_0_4(var_22_111, var_22_112) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_111, var_22_112, var_0_5.LuaMenuMPRulesHQAdditiveScoring, var_0_6.LuaMenuMPRulesHQAdditiveScoringDesc, {
				var_0_8.LuaMenuMPRulesScoringConstant,
				var_0_8.LuaMenuMPRulesScoringAdditive
			}))
		end

		local var_22_113 = Lobby.MatchRulesClasses.HQData
		local var_22_114 = Lobby.MatchRulesMembers.PauseTime

		if arg_22_2 then
			if var_0_4(var_22_113, var_22_114) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_113, var_22_114, var_0_5.LuaMenuMPRulesHQPauseTime, var_0_6.LuaMenuMPRulesHQPauseTimeDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end

		local var_22_115 = Lobby.MatchRulesClasses.HQData
		local var_22_116 = Lobby.MatchRulesMembers.DelayPlayer

		if arg_22_2 then
			if var_0_4(var_22_115, var_22_116) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_115, var_22_116, var_0_5.LuaMenuMPRulesHQCaptureDelayPlayer, var_0_6.LuaMenuMPRulesHQCaptureDelayPlayerDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end
	end

	if var_22_1 == MP.GameMode.HardpointGameType or var_22_1 == MP.GameMode.GrndGameType then
		local var_22_117 = Lobby.MatchRulesClasses.KOTHData
		local var_22_118 = Lobby.MatchRulesMembers.ZoneCaptureTime

		if arg_22_2 then
			if var_0_4(var_22_117, var_22_118) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_117, var_22_118, var_0_5.LuaMenuMPRulesZoneCaptureTime, var_0_6.LuaMenuMPRulesCapRateDesc, {
				var_0_8.LuaMenuMPRulesInstant,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_22_119 = Lobby.MatchRulesClasses.KOTHData
		local var_22_120 = Lobby.MatchRulesMembers.ZoneLifetime

		if arg_22_2 then
			if var_0_4(var_22_119, var_22_120) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_119, var_22_120, var_0_5.LuaMenuMPRulesZoneLifetime, var_0_6.LuaMenuMPRulesZoneLifetimeDesc, {
				var_0_8.LuaMenuMPRulesUnlimited,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPRulesSeconds150,
				var_0_8.LuaMenuMPRulesSeconds180,
				var_0_8.LuaMenuMPRulesSeconds210,
				var_0_8.LuaMenuMPRulesSeconds240,
				var_0_8.LuaMenuMPRulesSeconds270,
				var_0_8.LuaMenuMPRulesSeconds300
			}))
		end

		local var_22_121 = Lobby.MatchRulesClasses.KOTHData
		local var_22_122 = Lobby.MatchRulesMembers.FirstZoneActivationDelay

		if arg_22_2 then
			if var_0_4(var_22_121, var_22_122) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_121, var_22_122, var_0_5.LuaMenuMPRulesFirstZoneActivationDelay, var_0_6.LuaMenuMPRulesFirstZoneActivationDelayDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_22_123 = Lobby.MatchRulesClasses.KOTHData
		local var_22_124 = Lobby.MatchRulesMembers.ZoneActivationDelay

		if arg_22_2 then
			if var_0_4(var_22_123, var_22_124) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_123, var_22_124, var_0_5.LuaMenuMPRulesZoneActivationDelay, var_0_6.LuaMenuMPRulesZoneActivationDelayDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_22_125 = Lobby.MatchRulesClasses.KOTHData
		local var_22_126 = Lobby.MatchRulesMembers.RandomLocationOrder

		if arg_22_2 then
			if var_0_4(var_22_125, var_22_126) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_125, var_22_126, var_0_5.LuaMenuMPRulesRandomLocationOrder, var_0_6.LuaMenuMPRulesRandomLocationOrderDesc, {
				var_0_8.LuaMenuMPRulesLocationOrderLinear,
				var_0_8.LuaMenuMPRulesLocationOrderRandom
			}))
		end

		local var_22_127 = Lobby.MatchRulesClasses.KOTHData
		local var_22_128 = Lobby.MatchRulesMembers.AdditiveScoring

		if arg_22_2 then
			if var_0_4(var_22_127, var_22_128) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_127, var_22_128, var_0_5.LuaMenuMPRulesAdditiveScoring, var_0_6.LuaMenuMPRulesAdditiveScoringDesc, {
				var_0_8.LuaMenuMPRulesScoringConstant,
				var_0_8.LuaMenuMPRulesScoringAdditive
			}))
		end

		local var_22_129 = Lobby.MatchRulesClasses.KOTHData
		local var_22_130 = Lobby.MatchRulesMembers.PauseTime

		if arg_22_2 then
			if var_0_4(var_22_129, var_22_130) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_129, var_22_130, var_0_5.LuaMenuMPRulesPauseTime, var_0_6.LuaMenuMPRulesPauseTimeDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local function var_22_131()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.KOTHData, Lobby.MatchRulesMembers.DelayPlayer)
		end

		local var_22_132 = Lobby.MatchRulesClasses.KOTHData
		local var_22_133 = Lobby.MatchRulesMembers.DelayPlayer

		if arg_22_2 then
			if var_0_4(var_22_132, var_22_133) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_132, var_22_133, var_0_5.LuaMenuMPRulesDelayPlayer, var_0_6.LuaMenuMPRulesDelayPlayerDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end

		local var_22_134 = Lobby.MatchRulesClasses.KOTHData
		local var_22_135 = Lobby.MatchRulesMembers.SpawnDelay

		if arg_22_2 then
			if var_0_4(var_22_134, var_22_135) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_134, var_22_135, var_0_5.LuaMenuMPRulesSpawnDelay, var_0_6.LuaMenuMPRulesSpawnDelayDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds10
			}, var_22_131, {
				{
					eventName = "rule_changed_kothData_delayPlayer",
					eventFunction = function(arg_32_0, arg_32_1)
						if var_22_131() then
							arg_32_0:SetButtonDisabled(true)
						else
							arg_32_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end
	end

	if var_22_1 == MP.GameMode.ConfGameType then
		local var_22_136 = Lobby.MatchRulesClasses.ConfData
		local var_22_137 = Lobby.MatchRulesMembers.PointsPerConfirm

		if arg_22_2 then
			if var_0_4(var_22_136, var_22_137) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_136, var_22_137, var_0_5.LuaMenuMPRulesPointsPerConfirm, var_0_6.LuaMenuMPRulesPointsPerConfirmDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end

		local var_22_138 = Lobby.MatchRulesClasses.ConfData
		local var_22_139 = Lobby.MatchRulesMembers.PointsPerDeny

		if arg_22_2 then
			if var_0_4(var_22_138, var_22_139) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_138, var_22_139, var_0_5.LuaMenuMPRulesPointsPerDeny, var_0_6.LuaMenuMPRulesPointsPerDenyDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end

		local var_22_140 = Lobby.MatchRulesClasses.CommonOption
		local var_22_141 = Lobby.MatchRulesMembers.PointsPerKill

		if arg_22_2 then
			if var_0_4(var_22_140, var_22_141) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_140, var_22_141, var_0_5.LuaMenuMPRulesPointsPerKill, var_0_6.LuaMenuMPRulesPointsPerKillDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end

		local var_22_142 = Lobby.MatchRulesClasses.CommonOption
		local var_22_143 = Lobby.MatchRulesMembers.PointsPerDeath

		if arg_22_2 then
			if var_0_4(var_22_142, var_22_143) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_142, var_22_143, var_0_5.LuaMenuMPRulesPointsPerDeath, var_0_6.LuaMenuMPRulesPointsPerDeathDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25
			}))
		end
	end

	if var_22_1 == MP.GameMode.GrindGameType then
		local function var_22_144()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.GrindData, Lobby.MatchRulesMembers.BankDisable)
		end

		local var_22_145 = Lobby.MatchRulesClasses.GrindData
		local var_22_146 = Lobby.MatchRulesMembers.BankTime

		if arg_22_2 then
			if var_0_4(var_22_145, var_22_146) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_145, var_22_146, var_0_5.LuaMenuMPRulesBankTime, var_0_6.LuaMenuMPRulesBankTimeDesc, {
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds8Half,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds9Half,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end

		local var_22_147 = Lobby.MatchRulesClasses.GrindData
		local var_22_148 = Lobby.MatchRulesMembers.BankRate

		if arg_22_2 then
			if var_0_4(var_22_147, var_22_148) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_147, var_22_148, var_0_5.LuaMenuMPRulesBankRate, var_0_6.LuaMenuMPRulesBankRateDesc, {
				var_0_8.LuaMenuMPRulesTags1,
				var_0_8.LuaMenuMPRulesTags2,
				var_0_8.LuaMenuMPRulesTags3,
				var_0_8.LuaMenuMPRulesTags4,
				var_0_8.LuaMenuMPRulesTags5,
				var_0_8.LuaMenuMPRulesTags6,
				var_0_8.LuaMenuMPRulesTags7,
				var_0_8.LuaMenuMPRulesTags8,
				var_0_8.LuaMenuMPRulesTags9,
				var_0_8.LuaMenuMPRulesTags10
			}))
		end

		local var_22_149 = Lobby.MatchRulesClasses.GrindData
		local var_22_150 = Lobby.MatchRulesMembers.BankCaptureTime

		if arg_22_2 then
			if var_0_4(var_22_149, var_22_150) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_149, var_22_150, var_0_5.LuaMenuMPRulesBankCapture, var_0_6.LuaMenuMPRulesBankCaptureDesc, {
				var_0_8.LuaMenuMPRulesInstant,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end

		local var_22_151 = Lobby.MatchRulesClasses.GrindData
		local var_22_152 = Lobby.MatchRulesMembers.BankDisable

		if arg_22_2 then
			if var_0_4(var_22_151, var_22_152) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_151, var_22_152, var_0_5.LuaMenuMPRulesBankDisable, var_0_6.LuaMenuMPRulesBankDisableDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_153 = Lobby.MatchRulesClasses.GrindData
		local var_22_154 = Lobby.MatchRulesMembers.BankDisableTags

		if arg_22_2 then
			if var_0_4(var_22_153, var_22_154) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_153, var_22_154, var_0_5.LuaMenuMPRulesBankDisableTags, var_0_6.LuaMenuMPRulesBankDisableTagsDesc, {
				var_0_8.LuaMenuMPRulesTagsHalf,
				var_0_8.LuaMenuMPRulesTags1,
				var_0_8.LuaMenuMPRulesTags2,
				var_0_8.LuaMenuMPRulesTags3,
				var_0_8.LuaMenuMPRulesTags4,
				var_0_8.LuaMenuMPRulesTags5,
				var_0_8.LuaMenuMPRulesTags6,
				var_0_8.LuaMenuMPRulesTags7,
				var_0_8.LuaMenuMPRulesTags8,
				var_0_8.LuaMenuMPRulesTags9,
				var_0_8.LuaMenuMPRulesTags10,
				var_0_8.LuaMenuMPRulesTags11,
				var_0_8.LuaMenuMPRulesTags12,
				var_0_8.LuaMenuMPRulesTags13,
				var_0_8.LuaMenuMPRulesTags14,
				var_0_8.LuaMenuMPRulesTags15,
				var_0_8.LuaMenuMPRulesTags20,
				var_0_8.LuaMenuMPRulesTags25,
				var_0_8.LuaMenuMPRulesTags30,
				var_0_8.LuaMenuMPRulesTags35,
				var_0_8.LuaMenuMPRulesTags40,
				var_0_8.LuaMenuMPRulesTags45,
				var_0_8.LuaMenuMPRulesTags50
			}, var_22_144, {
				{
					eventName = "rule_changed_grindData_bankDisable",
					eventFunction = function(arg_34_0, arg_34_1)
						if var_22_144() then
							arg_34_0:SetButtonDisabled(true)
						else
							arg_34_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_155 = Lobby.MatchRulesClasses.GrindData
		local var_22_156 = Lobby.MatchRulesMembers.BankDisableTime

		if arg_22_2 then
			if var_0_4(var_22_155, var_22_156) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_155, var_22_156, var_0_5.LuaMenuMPRulesBankDisableTime, var_0_6.LuaMenuMPRulesBankDisableTimeDesc, {
				var_0_8.LuaMenuMPRulesUnlimited,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120
			}, var_22_144, {
				{
					eventName = "rule_changed_grindData_bankDisable",
					eventFunction = function(arg_35_0, arg_35_1)
						if var_22_144() then
							arg_35_0:SetButtonDisabled(true)
						else
							arg_35_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_157 = Lobby.MatchRulesClasses.GrindData
		local var_22_158 = Lobby.MatchRulesMembers.MegaBankLimit

		if arg_22_2 then
			if var_0_4(var_22_157, var_22_158) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_157, var_22_158, var_0_5.LuaMenuMPRulesMegaBankLimit, var_0_6.LuaMenuMPRulesMegaBankLimitDesc, {
				var_0_8.LuaMenuMPRulesTags5,
				var_0_8.LuaMenuMPRulesTags6,
				var_0_8.LuaMenuMPRulesTags7,
				var_0_8.LuaMenuMPRulesTags8,
				var_0_8.LuaMenuMPRulesTags9,
				var_0_8.LuaMenuMPRulesTags10,
				var_0_8.LuaMenuMPRulesTags11,
				var_0_8.LuaMenuMPRulesTags12,
				var_0_8.LuaMenuMPRulesTags13,
				var_0_8.LuaMenuMPRulesTags14,
				var_0_8.LuaMenuMPRulesTags15
			}))
		end

		local var_22_159 = Lobby.MatchRulesClasses.GrindData
		local var_22_160 = Lobby.MatchRulesMembers.MegaBankBonusKS

		if arg_22_2 then
			if var_0_4(var_22_159, var_22_160) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_159, var_22_160, var_0_5.LuaMenuMPRulesMegaBankBonusKS, var_0_6.LuaMenuMPRulesMegaBankBonusKSDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints6,
				var_0_8.LuaMenuMPRulesPoints7,
				var_0_8.LuaMenuMPRulesPoints8,
				var_0_8.LuaMenuMPRulesPoints9,
				var_0_8.LuaMenuMPRulesPoints10
			}))
		end

		local var_22_161 = Lobby.MatchRulesClasses.GrindData
		local var_22_162 = Lobby.MatchRulesMembers.MegaBankBonus

		if arg_22_2 then
			if var_0_4(var_22_161, var_22_162) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_161, var_22_162, var_0_5.LuaMenuMPRulesMegaBankBonus, var_0_6.LuaMenuMPRulesMegaBankBonusDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints150,
				var_0_8.LuaMenuMPRulesPoints200,
				var_0_8.LuaMenuMPRulesPoints250,
				var_0_8.LuaMenuMPRulesPoints300,
				var_0_8.LuaMenuMPRulesPoints350,
				var_0_8.LuaMenuMPRulesPoints400,
				var_0_8.LuaMenuMPRulesPoints450,
				var_0_8.LuaMenuMPRulesPoints500,
				var_0_8.LuaMenuMPRulesPoints550,
				var_0_8.LuaMenuMPRulesPoints600,
				var_0_8.LuaMenuMPRulesPoints650,
				var_0_8.LuaMenuMPRulesPoints700,
				var_0_8.LuaMenuMPRulesPoints750
			}))
		end
	end

	if var_22_1 == MP.GameMode.SiegeGameType then
		local function var_22_163()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.SiegeData, Lobby.MatchRulesMembers.RushTimer)
		end

		local var_22_164 = Lobby.MatchRulesClasses.SiegeData
		local var_22_165 = Lobby.MatchRulesMembers.RushTimer

		if arg_22_2 then
			if var_0_4(var_22_164, var_22_165) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_164, var_22_165, var_0_5.LuaMenuMPRulesRushTimer, var_0_6.LuaMenuMPRulesRushTimerDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_166 = Lobby.MatchRulesClasses.SiegeData
		local var_22_167 = Lobby.MatchRulesMembers.RushTimerAmount

		if arg_22_2 then
			if var_0_4(var_22_166, var_22_167) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_166, var_22_167, var_0_5.LuaMenuMPRulesRushTimerAmount, var_0_6.LuaMenuMPRulesRushTimerAmountDesc, {
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120
			}, var_22_163, {
				{
					eventName = "rule_changed_siegeData_rushTimer",
					eventFunction = function(arg_37_0, arg_37_1)
						if var_22_163() then
							arg_37_0:SetButtonDisabled(true)
						else
							arg_37_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_168 = Lobby.MatchRulesClasses.SiegeData
		local var_22_169 = Lobby.MatchRulesMembers.SharedRushTimer

		if arg_22_2 then
			if var_0_4(var_22_168, var_22_169) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_168, var_22_169, var_0_5.LuaMenuMPRulesSharedRushTimer, var_0_6.LuaMenuMPRulesSharedRushTimerDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}, var_22_163, {
				{
					eventName = "rule_changed_siegeData_rushTimer",
					eventFunction = function(arg_38_0, arg_38_1)
						if var_22_163() then
							arg_38_0:SetButtonDisabled(true)
						else
							arg_38_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_170 = Lobby.MatchRulesClasses.SiegeData
		local var_22_171 = Lobby.MatchRulesMembers.CapRate

		if arg_22_2 then
			if var_0_4(var_22_170, var_22_171) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_170, var_22_171, var_0_5.LuaMenuMPRulesCapRate, var_0_6.LuaMenuMPRulesCapRateDesc, {
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds8Half,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds9Half,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end

		local var_22_172 = Lobby.MatchRulesClasses.SiegeData
		local var_22_173 = Lobby.MatchRulesMembers.PreCapPoints

		if arg_22_2 then
			if var_0_4(var_22_172, var_22_173) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_172, var_22_173, var_0_5.LuaMenuMPRulesPreCap, var_0_6.LuaMenuMPRulesPreCapDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_22_1 == MP.GameMode.InfectGameType then
		local var_22_174 = Lobby.MatchRulesClasses.InfectData
		local var_22_175 = Lobby.MatchRulesMembers.NumInitialInfected

		if arg_22_2 then
			if var_0_4(var_22_174, var_22_175) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_174, var_22_175, var_0_5.LuaMenuMPRulesNumInitialInfected, var_0_6.LuaMenuMPRulesNumInitialInfectedDesc, {
				var_0_8.LuaMenuMPRulesNum1,
				var_0_8.LuaMenuMPRulesNum2,
				var_0_8.LuaMenuMPRulesNum3,
				var_0_8.LuaMenuMPRulesNum4,
				var_0_8.LuaMenuMPRulesNum5,
				var_0_8.LuaMenuMPRulesNum6
			}))
		end

		local var_22_176 = Lobby.MatchRulesClasses.InfectData
		local var_22_177 = Lobby.MatchRulesMembers.WeaponSurvivorPrimary

		if arg_22_2 then
			if var_0_4(var_22_176, var_22_177) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_176, var_22_177, var_0_5.LuaMenuMPRulesSurvivorPrimaryWeapon, var_0_6.LuaMenuMPRulesSurvivorPrimaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_178 = Lobby.MatchRulesClasses.InfectData
		local var_22_179 = Lobby.MatchRulesMembers.WeaponSurvivorSecondary

		if arg_22_2 then
			if var_0_4(var_22_178, var_22_179) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_178, var_22_179, var_0_5.LuaMenuMPRulesSurvivorSecondaryWeapon, var_0_6.LuaMenuMPRulesSurvivorSecondaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_180 = Lobby.MatchRulesClasses.InfectData
		local var_22_181 = Lobby.MatchRulesMembers.LethalSurvivor

		if arg_22_2 then
			if var_0_4(var_22_180, var_22_181) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_180, var_22_181, var_0_5.LuaMenuMPRulesSurvivorLethal, var_0_6.LuaMenuMPRulesSurvivorLethalDesc, {
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_182 = Lobby.MatchRulesClasses.InfectData
		local var_22_183 = Lobby.MatchRulesMembers.TacticalSurvivor

		if arg_22_2 then
			if var_0_4(var_22_182, var_22_183) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_182, var_22_183, var_0_5.LuaMenuMPRulesSurvivorTactical, var_0_6.LuaMenuMPRulesSurvivorTacticalDesc, {
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_184 = Lobby.MatchRulesClasses.InfectData
		local var_22_185 = Lobby.MatchRulesMembers.SuperSurvivor

		if arg_22_2 then
			if var_0_4(var_22_184, var_22_185) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_184, var_22_185, var_0_5.LuaMenuMPRulesSurvivorSuper, var_0_6.LuaMenuMPRulesSurvivorSuperDesc, {
				var_0_8.LuaMenuMPRulesSuperAmmoBox,
				var_0_8.LuaMenuMPRulesSuperReconDrone,
				var_0_8.LuaMenuMPRulesSuperDeadSilence,
				var_0_8.LuaMenuMPRulesSuperStoppingPower,
				var_0_8.LuaMenuMPRulesSuperTrophy,
				var_0_8.LuaMenuMPRulesSuperTacCover,
				var_0_8.LuaMenuMPRulesSuperTacInsert,
				var_0_8.LuaMenuMPRulesSuperEmpDrone,
				var_0_8.LuaMenuMPRulesSuperWeaponDrop,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_186 = Lobby.MatchRulesClasses.InfectData
		local var_22_187 = Lobby.MatchRulesMembers.SuperSurvivorTwo

		if arg_22_2 then
			if var_0_4(var_22_186, var_22_187) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_186, var_22_187, var_0_5.LuaMenuMPRulesSurvivorSuperTwo, var_0_6.LuaMenuMPRulesSurvivorSuperTwoDesc, {
				var_0_8.LuaMenuMPRulesSuperAmmoBox,
				var_0_8.LuaMenuMPRulesSuperReconDrone,
				var_0_8.LuaMenuMPRulesSuperDeadSilence,
				var_0_8.LuaMenuMPRulesSuperStoppingPower,
				var_0_8.LuaMenuMPRulesSuperTrophy,
				var_0_8.LuaMenuMPRulesSuperTacCover,
				var_0_8.LuaMenuMPRulesSuperTacInsert,
				var_0_8.LuaMenuMPRulesSuperEmpDrone,
				var_0_8.LuaMenuMPRulesSuperWeaponDrop,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_188 = Lobby.MatchRulesClasses.InfectData
		local var_22_189 = Lobby.MatchRulesMembers.WeaponInfectedPrimary

		if arg_22_2 then
			if var_0_4(var_22_188, var_22_189) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_188, var_22_189, var_0_5.LuaMenuMPRulesInfectedPrimaryWeapon, var_0_6.LuaMenuMPRulesInfectedPrimaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_190 = Lobby.MatchRulesClasses.InfectData
		local var_22_191 = Lobby.MatchRulesMembers.WeaponInfectSecondary

		if arg_22_2 then
			if var_0_4(var_22_190, var_22_191) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_190, var_22_191, var_0_5.LuaMenuMPRulesInfectedSecondaryWeapon, var_0_6.LuaMenuMPRulesInfectedSecondaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesFists,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesKnife
			}))
		end

		local var_22_192 = Lobby.MatchRulesClasses.InfectData
		local var_22_193 = Lobby.MatchRulesMembers.LethalInfected

		if arg_22_2 then
			if var_0_4(var_22_192, var_22_193) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_192, var_22_193, var_0_5.LuaMenuMPRulesInfectedLethal, var_0_6.LuaMenuMPRulesInfectedLethalDesc, {
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_194 = Lobby.MatchRulesClasses.InfectData
		local var_22_195 = Lobby.MatchRulesMembers.TacticalInfected

		if arg_22_2 then
			if var_0_4(var_22_194, var_22_195) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_194, var_22_195, var_0_5.LuaMenuMPRulesInfectedTactical, var_0_6.LuaMenuMPRulesInfectedTacticalDesc, {
				var_0_8.LuaMenuMPRulesTacInsert,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_196 = Lobby.MatchRulesClasses.InfectData
		local var_22_197 = Lobby.MatchRulesMembers.SuperInfect

		if arg_22_2 then
			if var_0_4(var_22_196, var_22_197) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_196, var_22_197, var_0_5.LuaMenuMPRulesInfectedSuper, var_0_6.LuaMenuMPRulesInfectedSuperDesc, {
				var_0_8.LuaMenuMPRulesSuperAmmoBox,
				var_0_8.LuaMenuMPRulesSuperReconDrone,
				var_0_8.LuaMenuMPRulesSuperDeadSilence,
				var_0_8.LuaMenuMPRulesSuperStoppingPower,
				var_0_8.LuaMenuMPRulesSuperTrophy,
				var_0_8.LuaMenuMPRulesSuperTacCover,
				var_0_8.LuaMenuMPRulesSuperTacInsert,
				var_0_8.LuaMenuMPRulesSuperEmpDrone,
				var_0_8.LuaMenuMPRulesSuperWeaponDrop,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_198 = Lobby.MatchRulesClasses.InfectData
		local var_22_199 = Lobby.MatchRulesMembers.SuperInfectTwo

		if arg_22_2 then
			if var_0_4(var_22_198, var_22_199) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_198, var_22_199, var_0_5.LuaMenuMPRulesInfectedSuperTwo, var_0_6.LuaMenuMPRulesInfectedSuperTwoDesc, {
				var_0_8.LuaMenuMPRulesSuperAmmoBox,
				var_0_8.LuaMenuMPRulesSuperReconDrone,
				var_0_8.LuaMenuMPRulesSuperDeadSilence,
				var_0_8.LuaMenuMPRulesSuperStoppingPower,
				var_0_8.LuaMenuMPRulesSuperTrophy,
				var_0_8.LuaMenuMPRulesSuperTacCover,
				var_0_8.LuaMenuMPRulesSuperTacInsert,
				var_0_8.LuaMenuMPRulesSuperEmpDrone,
				var_0_8.LuaMenuMPRulesSuperWeaponDrop,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_200 = Lobby.MatchRulesClasses.InfectData
		local var_22_201 = Lobby.MatchRulesMembers.WeaponInitialPrimary

		if arg_22_2 then
			if var_0_4(var_22_200, var_22_201) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_200, var_22_201, var_0_5.LuaMenuMPRulesInfectedInitialPrimaryWeapon, var_0_6.LuaMenuMPRulesInfectedInitialPrimaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_202 = Lobby.MatchRulesClasses.InfectData
		local var_22_203 = Lobby.MatchRulesMembers.WeaponInitialSecondary

		if arg_22_2 then
			if var_0_4(var_22_202, var_22_203) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_202, var_22_203, var_0_5.LuaMenuMPRulesInfectedInitialSecondaryWeapon, var_0_6.LuaMenuMPRulesInfectedInitialSecondaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesFists,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_22_204 = Lobby.MatchRulesClasses.InfectData
		local var_22_205 = Lobby.MatchRulesMembers.InfectExtraTimePerKill

		if arg_22_2 then
			if var_0_4(var_22_204, var_22_205) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_204, var_22_205, var_0_5.LuaMenuMPRulesInfectExtraTimePerKill, var_0_6.LuaMenuMPRulesInfectExtraTimePerKillDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_22_206 = Lobby.MatchRulesClasses.InfectData
		local var_22_207 = Lobby.MatchRulesMembers.SurvivorAliveScore

		if arg_22_2 then
			if var_0_4(var_22_206, var_22_207) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_206, var_22_207, var_0_5.LuaMenuMPRulesSurvivorAliveScore, var_0_6.LuaMenuMPRulesSurvivorAliveScoreDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints100
			}))
		end

		local var_22_208 = Lobby.MatchRulesClasses.InfectData
		local var_22_209 = Lobby.MatchRulesMembers.InfectStreakBonus

		if arg_22_2 then
			if var_0_4(var_22_208, var_22_209) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_208, var_22_209, var_0_5.LuaMenuMPRulesInfectStreakBonus, var_0_6.LuaMenuMPRulesInfectStreakBonusDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints100
			}))
		end

		local var_22_210 = Lobby.MatchRulesClasses.InfectData
		local var_22_211 = Lobby.MatchRulesMembers.GiveTKOnTISpawn

		if arg_22_2 then
			if var_0_4(var_22_210, var_22_211) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_210, var_22_211, var_0_5.LuaMenuMPRulesGiveTKOnTISpawn, var_0_6.LuaMenuMPRulesGiveTKOnTISpawnDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_22_1 == MP.GameMode.RugbyGameType then
		local var_22_212 = Lobby.MatchRulesClasses.RugbyData
		local var_22_213 = Lobby.MatchRulesMembers.JuggHealth

		if arg_22_2 then
			if var_0_4(var_22_212, var_22_213) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_212, var_22_213, var_0_5.LuaMenuMPRulesJuggHealth, var_0_6.LuaMenuMPRulesJuggHealthDesc, {
				var_0_8.LuaMenuMPRulesNum1000,
				var_0_8.LuaMenuMPRulesNum1250,
				var_0_8.LuaMenuMPRulesNum1500,
				var_0_8.LuaMenuMPRulesNum1750,
				var_0_8.LuaMenuMPRulesNum2000,
				var_0_8.LuaMenuMPRulesNum2250,
				var_0_8.LuaMenuMPRulesNum2500,
				var_0_8.LuaMenuMPRulesNum2750,
				var_0_8.LuaMenuMPRulesNum3000,
				var_0_8.LuaMenuMPRulesNum4000,
				var_0_8.LuaMenuMPRulesNum5000,
				var_0_8.LuaMenuMPRulesNum10000
			}))
		end

		local var_22_214 = Lobby.MatchRulesClasses.RugbyData
		local var_22_215 = Lobby.MatchRulesMembers.JuggSpeed

		if arg_22_2 then
			if var_0_4(var_22_214, var_22_215) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_214, var_22_215, var_0_5.LuaMenuMPRulesJuggSpeed, var_0_6.LuaMenuMPRulesJuggSpeedDesc, {
				var_0_8.LuaMenuMPRulesJuggSpeedSlowest,
				var_0_8.LuaMenuMPRulesJuggSpeedSlower,
				var_0_8.LuaMenuMPRulesJuggSpeedDefault,
				var_0_8.LuaMenuMPRulesJuggSpeedFaster,
				var_0_8.LuaMenuMPRulesJuggSpeedFastest
			}))
		end

		local var_22_216 = Lobby.MatchRulesClasses.RugbyData
		local var_22_217 = Lobby.MatchRulesMembers.JuggTeamSpeed

		if arg_22_2 then
			if var_0_4(var_22_216, var_22_217) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_216, var_22_217, var_0_5.LuaMenuMPRulesJuggHelperSpeed, var_0_6.LuaMenuMPRulesJuggHelperSpeedDesc, {
				var_0_8.LuaMenuMPRulesJuggTeamSpeedOff,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedSlowest,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedSlower,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedDefault,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedFaster,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedFastest
			}))
		end

		local var_22_218 = Lobby.MatchRulesClasses.RugbyData
		local var_22_219 = Lobby.MatchRulesMembers.HelperMax

		if arg_22_2 then
			if var_0_4(var_22_218, var_22_219) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_218, var_22_219, var_0_5.LuaMenuMPRulesJuggHelper, var_0_6.LuaMenuMPRulesJuggHelperDesc, {
				var_0_8.LuaMenuMPRulesNum0,
				var_0_8.LuaMenuMPRulesNum1,
				var_0_8.LuaMenuMPRulesNum2,
				var_0_8.LuaMenuMPRulesNum3,
				var_0_8.LuaMenuMPRulesNum4,
				var_0_8.LuaMenuMPRulesNum5,
				var_0_8.LuaMenuMPRulesNum6,
				var_0_8.LuaMenuMPRulesNum7,
				var_0_8.LuaMenuMPRulesNum8,
				var_0_8.LuaMenuMPRulesNum9,
				var_0_8.LuaMenuMPRulesNum10
			}))
		end

		local var_22_220 = Lobby.MatchRulesClasses.RugbyData
		local var_22_221 = Lobby.MatchRulesMembers.JuggTimeoutOn

		if arg_22_2 then
			if var_0_4(var_22_220, var_22_221) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_220, var_22_221, var_0_5.LuaMenuMPRulesJuggLifetimeEnabled, var_0_6.LuaMenuMPRulesJuggLifetimeEnabledDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_222 = Lobby.MatchRulesClasses.RugbyData
		local var_22_223 = Lobby.MatchRulesMembers.JuggTimeout

		if arg_22_2 then
			if var_0_4(var_22_222, var_22_223) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_222, var_22_223, var_0_5.LuaMenuMPRulesJuggLifetime, var_0_6.LuaMenuMPRulesJuggLifetimeDesc, {
				var_0_8.LuaMenuMPRulesMinutes15Sec,
				var_0_8.LuaMenuMPRulesMinutesHalf,
				var_0_8.LuaMenuMPRulesMinutes45Sec,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes2,
				var_0_8.LuaMenuMPRulesMinutes5
			}))
		end
	end

	local function var_22_224()
		return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.DmData, Lobby.MatchRulesMembers.AONRules) == 1
	end

	if var_22_1 == MP.GameMode.FFAGameType then
		local var_22_225 = Lobby.MatchRulesClasses.DmData
		local var_22_226 = Lobby.MatchRulesMembers.AONRules

		if arg_22_2 then
			if var_0_4(var_22_225, var_22_226) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_225, var_22_226, var_0_5.LuaMenuMPRulesAON, var_0_6.LuaMenuMPRulesAONDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPEnabledNumValue
			}, nil, {
				{
					eventName = "rule_changed_dmData_aonRules",
					eventFunction = function(arg_40_0, arg_40_1)
						if var_22_224() then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MagCount, 0)
							var_0_0(arg_22_0)

							if arg_40_1.refreshOriginButtonID == "" or arg_40_1.refreshOriginButtonID == "option_commonOption_magCount" then
								arg_22_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_40_0
								})
							end
						else
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MagCount, 3)
							var_0_0(arg_22_0)

							if arg_40_1.refreshOriginButtonID == "" or arg_40_1.refreshOriginButtonID == "option_commonOption_magCount" then
								arg_22_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_40_0
								})
							end
						end
					end
				}
			}))
		end
	end

	if var_22_1 == MP.GameMode.TDMGameType or var_22_1 == MP.GameMode.FrontGameType then
		local var_22_227 = Lobby.MatchRulesClasses.CommonOption
		local var_22_228 = Lobby.MatchRulesMembers.SpawnProtectionTimer

		if arg_22_2 then
			if var_0_4(var_22_227, var_22_228) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_227, var_22_228, var_0_5.LuaMenuMPRulesSpawnProtectionTimer, var_0_6.LuaMenuMPRulesSpawnProtectionTimerDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end
	end

	if var_22_1 == MP.GameMode.GunGameType then
		local var_22_229 = Lobby.MatchRulesClasses.GunData
		local var_22_230 = Lobby.MatchRulesMembers.Setback

		if arg_22_2 then
			if var_0_4(var_22_229, var_22_230) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_229, var_22_230, var_0_5.LuaMenuMPRulesSetback, var_0_6.LuaMenuMPRulesSetbackDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSetbacks1,
				var_0_8.LuaMenuMPRulesSetbacks2,
				var_0_8.LuaMenuMPRulesSetbacks3,
				var_0_8.LuaMenuMPRulesSetbacks4,
				var_0_8.LuaMenuMPRulesSetbacks5
			}))
		end

		local var_22_231 = Lobby.MatchRulesClasses.GunData
		local var_22_232 = Lobby.MatchRulesMembers.SetbackStreak

		if arg_22_2 then
			if var_0_4(var_22_231, var_22_232) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_231, var_22_232, var_0_5.LuaMenuMPRulesSetbackStreak, var_0_6.LuaMenuMPRulesSetbackStreakDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesDeaths1,
				var_0_8.LuaMenuMPRulesDeaths2,
				var_0_8.LuaMenuMPRulesDeaths3,
				var_0_8.LuaMenuMPRulesDeaths4,
				var_0_8.LuaMenuMPRulesDeaths5
			}))
		end

		local var_22_233 = Lobby.MatchRulesClasses.GunData
		local var_22_234 = Lobby.MatchRulesMembers.KillsPerWeapon

		if arg_22_2 then
			if var_0_4(var_22_233, var_22_234) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_233, var_22_234, var_0_5.LuaMenuMPRulesKillsPerWeapon, var_0_6.LuaMenuMPRulesKillsPerWeaponDesc, {
				var_0_8.LuaMenuMPRulesKills1,
				var_0_8.LuaMenuMPRulesKills2,
				var_0_8.LuaMenuMPRulesKills3,
				var_0_8.LuaMenuMPRulesKills4,
				var_0_8.LuaMenuMPRulesKills5
			}))
		end

		local var_22_235 = Lobby.MatchRulesClasses.GunData
		local var_22_236 = Lobby.MatchRulesMembers.LadderIndex

		if arg_22_2 then
			if var_0_4(var_22_235, var_22_236) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_235, var_22_236, var_0_5.LuaMenuMPRulesLadderIndex, var_0_6.LuaMenuMPRulesLadderIndexDesc, {
				var_0_8.LuaMenuMPRulesLadder1,
				var_0_8.LuaMenuMPRulesLadder2,
				var_0_8.LuaMenuMPRulesLadder3,
				var_0_8.LuaMenuMPRulesLadder4
			}))
		end
	end

	if var_22_1 == MP.GameMode.OICGameType then
		local var_22_237 = Lobby.MatchRulesClasses.OICData
		local var_22_238 = Lobby.MatchRulesMembers.Weapon

		if arg_22_2 then
			if var_0_4(var_22_237, var_22_238) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_237, var_22_238, var_0_5.LuaMenuMPRulesOICWeapon, var_0_6.LuaMenuMPRulesOICWeaponDesc, {
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW
			}))
		end

		local var_22_239 = Lobby.MatchRulesClasses.OICData
		local var_22_240 = Lobby.MatchRulesMembers.OneShotKill

		if arg_22_2 then
			if var_0_4(var_22_239, var_22_240) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_239, var_22_240, var_0_5.LuaMenuMPRulesOneShotKill, var_0_6.LuaMenuMPRulesOneShotKillDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end

		local var_22_241 = Lobby.MatchRulesClasses.OICData
		local var_22_242 = Lobby.MatchRulesMembers.InitialAmmoCount

		if arg_22_2 then
			if var_0_4(var_22_241, var_22_242) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_241, var_22_242, var_0_5.LuaMenuMPRulesInitialAmmoCount, var_0_6.LuaMenuMPRulesInitialAmmoCountDesc, {
				var_0_8.LuaMenuMPRulesNum1,
				var_0_8.LuaMenuMPRulesNum2,
				var_0_8.LuaMenuMPRulesNum3,
				var_0_8.LuaMenuMPRulesNum4,
				var_0_8.LuaMenuMPRulesNum5,
				var_0_8.LuaMenuMPRulesNum6,
				var_0_8.LuaMenuMPRulesNum7,
				var_0_8.LuaMenuMPRulesNum8,
				var_0_8.LuaMenuMPRulesNum9,
				var_0_8.LuaMenuMPRulesNum10,
				var_0_8.LuaMenuMPRulesNum15
			}))
		end

		local var_22_243 = Lobby.MatchRulesClasses.OICData
		local var_22_244 = Lobby.MatchRulesMembers.KillRewardAmmoCount

		if arg_22_2 then
			if var_0_4(var_22_243, var_22_244) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_243, var_22_244, var_0_5.LuaMenuMPRulesKillRewardAmmoCount, var_0_6.LuaMenuMPRulesKillRewardAmmoCountDesc, {
				var_0_8.LuaMenuMPRulesNum1,
				var_0_8.LuaMenuMPRulesNum2,
				var_0_8.LuaMenuMPRulesNum3,
				var_0_8.LuaMenuMPRulesNum4,
				var_0_8.LuaMenuMPRulesNum5,
				var_0_8.LuaMenuMPRulesNum6,
				var_0_8.LuaMenuMPRulesNum7,
				var_0_8.LuaMenuMPRulesNum8,
				var_0_8.LuaMenuMPRulesNum9,
				var_0_8.LuaMenuMPRulesNum10,
				var_0_8.LuaMenuMPRulesNum15
			}))
		end
	end

	if var_22_1 == MP.GameMode.ArenaGameType then
		local var_22_245 = Lobby.MatchRulesClasses.ArenaData
		local var_22_246 = Lobby.MatchRulesMembers.ArenaSpawnFlag

		if arg_22_2 then
			if var_0_4(var_22_245, var_22_246) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_245, var_22_246, var_0_5.LuaMenuMPRulesArenaSpawnFlag, var_0_6.LuaMenuMPRulesArenaSpawnFlagDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_247 = Lobby.MatchRulesClasses.ArenaData
		local var_22_248 = Lobby.MatchRulesMembers.ArenaObjModifier

		if arg_22_2 then
			if var_0_4(var_22_247, var_22_248) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_247, var_22_248, var_0_5.LuaMenuMPRulesArenaObjModifier, var_0_6.LuaMenuMPRulesArenaObjModifierDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPArenaEndzone
			}))
		end

		local var_22_249 = Lobby.MatchRulesClasses.CommonOption
		local var_22_250 = Lobby.MatchRulesMembers.DogTags

		if arg_22_2 then
			if var_0_4(var_22_249, var_22_250) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_249, var_22_250, var_0_5.LuaMenuMPRulesArenaDogTags, var_0_6.LuaMenuMPRulesArenaDogTagsDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_251 = Lobby.MatchRulesClasses.ArenaData
		local var_22_252 = Lobby.MatchRulesMembers.ArenaWinCondition

		if arg_22_2 then
			if var_0_4(var_22_251, var_22_252) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_251, var_22_252, var_0_5.LuaMenuMPRulesArenaWinCondition, var_0_6.LuaMenuMPRulesArenaWinConditionDesc, {
				var_0_8.LuaMenuMPRulesArenaWinConditionLives,
				var_0_8.LuaMenuMPRulesArenaWinConditionHealth
			}))
		end

		local var_22_253 = Lobby.MatchRulesClasses.ArenaData
		local var_22_254 = Lobby.MatchRulesMembers.SwitchSpawns

		if arg_22_2 then
			if var_0_4(var_22_253, var_22_254) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_253, var_22_254, var_0_5.LuaMenuMPRulesArenaSwitchSpawns, var_0_6.LuaMenuMPRulesArenaSwitchSpawnsDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_255 = Lobby.MatchRulesClasses.ArenaData
		local var_22_256 = Lobby.MatchRulesMembers.ArenaBlastShieldMod

		if arg_22_2 then
			if var_0_4(var_22_255, var_22_256) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_255, var_22_256, var_0_5.LuaMenuMPRulesArenaBlastShieldMod, var_0_6.LuaMenuMPRulesArenaBlastShieldModDesc, {
				var_0_8.LuaMenuMPRulesPercent65,
				var_0_8.LuaMenuMPRulesPercent70,
				var_0_8.LuaMenuMPRulesPercent75,
				var_0_8.LuaMenuMPRulesPercent80,
				var_0_8.LuaMenuMPRulesPercent85,
				var_0_8.LuaMenuMPRulesPercent90,
				var_0_8.LuaMenuMPRulesPercent95,
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesPercent5,
				var_0_8.LuaMenuMPRulesPercent10,
				var_0_8.LuaMenuMPRulesPercent15,
				var_0_8.LuaMenuMPRulesPercent20,
				var_0_8.LuaMenuMPRulesPercent25,
				var_0_8.LuaMenuMPRulesPercent30,
				var_0_8.LuaMenuMPRulesPercent35,
				var_0_8.LuaMenuMPRulesPercent40,
				var_0_8.LuaMenuMPRulesPercent45,
				var_0_8.LuaMenuMPRulesPercent50,
				var_0_8.LuaMenuMPRulesPercent55,
				var_0_8.LuaMenuMPRulesPercent60
			}))
		end

		local var_22_257 = Lobby.MatchRulesClasses.ArenaData
		local var_22_258 = Lobby.MatchRulesMembers.ArenaBlastShieldClamp

		if arg_22_2 then
			if var_0_4(var_22_257, var_22_258) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_257, var_22_258, var_0_5.LuaMenuMPRulesArenaBlastShieldClamp, var_0_6.LuaMenuMPRulesArenaBlastShieldClampDesc, {
				var_0_8.LuaMenuMPRulesPoints80Normal,
				var_0_8.LuaMenuMPRulesPoints85,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints95,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints55,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints65,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints75
			}))
		end

		local var_22_259 = Lobby.MatchRulesClasses.ArenaData
		local var_22_260 = Lobby.MatchRulesMembers.ArenaTacticalTimeMod

		if arg_22_2 then
			if var_0_4(var_22_259, var_22_260) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_259, var_22_260, var_0_5.LuaMenuMPRulesArenaTacticalTimeMod, var_0_6.LuaMenuMPRulesArenaTacticalTimeModDesc, {
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2
			}))
		end

		local function var_22_261()
			return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.ArenaData, Lobby.MatchRulesMembers.ArenaLoadouts) ~= 3 and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.ArenaData, Lobby.MatchRulesMembers.ArenaLoadouts) ~= 14
		end

		local var_22_262 = Lobby.MatchRulesClasses.ArenaData
		local var_22_263 = Lobby.MatchRulesMembers.ArenaLoadouts

		if arg_22_2 then
			if var_0_4(var_22_262, var_22_263) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_262, var_22_263, var_0_5.LuaMenuMPRulesArenaLoadouts, var_0_6.LuaMenuMPRulesArenaLoadoutsDesc, {
				var_0_8.LuaMenuMPRulesArenaLoadoutsNormal,
				var_0_8.LuaMenuMPRulesArenaLoadoutsRandom,
				var_0_8.LuaMenuMPRulesArenaLoadoutsBlueprint,
				var_0_8.LuaMenuMPRulesArenaLoadoutsBlueprintCustom,
				var_0_8.LuaMenuMPRulesArenaLoadoutsNone,
				var_0_8.LuaMenuMPRulesArenaLoadoutsPickupBlueprint
			}, nil, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_42_0, arg_42_1)
						if var_22_261() then
							ACTIONS.AnimateSequence(arg_22_0, "HideMiniMap")
							var_0_0(arg_22_0)

							if arg_42_1.refreshOriginButtonID and arg_42_1.refreshOriginButtonID == "" or arg_42_1.refreshOriginButtonID == "option_arenaData_arenaLoadouts" then
								arg_22_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_42_0
								})
							end
						else
							local var_42_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
							local var_42_1 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_42_0, CSV.mpMapTable.cols.arenaMenuMinimap)

							if var_42_1 ~= "" then
								arg_22_0.ArenaPickupMinimap.MiniMap:setImage(RegisterMaterial(var_42_1))
								ACTIONS.AnimateSequence(arg_22_0, "ShowMiniMap")
							end

							var_0_0(arg_22_0)

							if arg_42_1.refreshOriginButtonID and arg_42_1.refreshOriginButtonID == "" or arg_42_1.refreshOriginButtonID == "option_arenaData_arenaLoadouts" then
								arg_22_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_42_0
								})
							end
						end
					end
				}
			}))
		end

		local var_22_264 = Lobby.MatchRulesClasses.ArenaData
		local var_22_265 = Lobby.MatchRulesMembers.LoadoutChangeRound

		if arg_22_2 then
			if var_0_4(var_22_264, var_22_265) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_264, var_22_265, var_0_5.LuaMenuMPRulesLoadoutChangeRound, var_0_6.LuaMenuMPRulesLoadoutChangeRoundDesc, {
				var_0_8.LuaMenuRulesEvery3Rounds,
				var_0_8.LuaMenuRulesEvery4Rounds,
				var_0_8.LuaMenuRulesEvery5Rounds,
				var_0_8.LuaMenuRulesNever,
				var_0_8.LuaMenuRulesEveryRound,
				var_0_8.LuaMenuRulesEvery2Rounds
			}))
		end

		local var_22_266 = Lobby.MatchRulesClasses.ArenaData
		local var_22_267 = Lobby.MatchRulesMembers.StartWeapon

		if arg_22_2 then
			if var_0_4(var_22_266, var_22_267) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_266, var_22_267, var_0_5.LuaMenuMPRulesStartWeapon, var_0_6.LuaMenuMPRulesStartWeaponDesc, {
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_43_0, arg_43_1)
						if var_22_261() then
							arg_43_0:SetButtonDisabled(true)
						else
							arg_43_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_268 = Lobby.MatchRulesClasses.ArenaData
		local var_22_269 = Lobby.MatchRulesMembers.WeaponTier1

		if arg_22_2 then
			if var_0_4(var_22_268, var_22_269) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_268, var_22_269, var_0_5.LuaMenuMPRulesWeaponTier1, var_0_6.LuaMenuMPRulesWeaponTier1Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_44_0, arg_44_1)
						if var_22_261() then
							arg_44_0:SetButtonDisabled(true)
						else
							arg_44_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_270 = Lobby.MatchRulesClasses.ArenaData
		local var_22_271 = Lobby.MatchRulesMembers.WeaponTier2

		if arg_22_2 then
			if var_0_4(var_22_270, var_22_271) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_270, var_22_271, var_0_5.LuaMenuMPRulesWeaponTier2, var_0_6.LuaMenuMPRulesWeaponTier2Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_45_0, arg_45_1)
						if var_22_261() then
							arg_45_0:SetButtonDisabled(true)
						else
							arg_45_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_272 = Lobby.MatchRulesClasses.ArenaData
		local var_22_273 = Lobby.MatchRulesMembers.WeaponTier3

		if arg_22_2 then
			if var_0_4(var_22_272, var_22_273) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_272, var_22_273, var_0_5.LuaMenuMPRulesWeaponTier3, var_0_6.LuaMenuMPRulesWeaponTier3Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_46_0, arg_46_1)
						if var_22_261() then
							arg_46_0:SetButtonDisabled(true)
						else
							arg_46_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_274 = Lobby.MatchRulesClasses.ArenaData
		local var_22_275 = Lobby.MatchRulesMembers.WeaponTier4

		if arg_22_2 then
			if var_0_4(var_22_274, var_22_275) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_274, var_22_275, var_0_5.LuaMenuMPRulesWeaponTier4, var_0_6.LuaMenuMPRulesWeaponTier4Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_47_0, arg_47_1)
						if var_22_261() then
							arg_47_0:SetButtonDisabled(true)
						else
							arg_47_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_276 = Lobby.MatchRulesClasses.ArenaData
		local var_22_277 = Lobby.MatchRulesMembers.WeaponTier5

		if arg_22_2 then
			if var_0_4(var_22_276, var_22_277) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_276, var_22_277, var_0_5.LuaMenuMPRulesWeaponTier5, var_0_6.LuaMenuMPRulesWeaponTier5Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_48_0, arg_48_1)
						if var_22_261() then
							arg_48_0:SetButtonDisabled(true)
						else
							arg_48_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_278 = Lobby.MatchRulesClasses.ArenaData
		local var_22_279 = Lobby.MatchRulesMembers.WeaponTier6

		if arg_22_2 then
			if var_0_4(var_22_278, var_22_279) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_278, var_22_279, var_0_5.LuaMenuMPRulesWeaponTier6, var_0_6.LuaMenuMPRulesWeaponTier6Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_49_0, arg_49_1)
						if var_22_261() then
							arg_49_0:SetButtonDisabled(true)
						else
							arg_49_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_280 = Lobby.MatchRulesClasses.ArenaData
		local var_22_281 = Lobby.MatchRulesMembers.WeaponTier7

		if arg_22_2 then
			if var_0_4(var_22_280, var_22_281) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_280, var_22_281, var_0_5.LuaMenuMPRulesWeaponTier7, var_0_6.LuaMenuMPRulesWeaponTier7Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_50_0, arg_50_1)
						if var_22_261() then
							arg_50_0:SetButtonDisabled(true)
						else
							arg_50_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_282 = Lobby.MatchRulesClasses.ArenaData
		local var_22_283 = Lobby.MatchRulesMembers.WeaponTier8

		if arg_22_2 then
			if var_0_4(var_22_282, var_22_283) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_282, var_22_283, var_0_5.LuaMenuMPRulesWeaponTier8, var_0_6.LuaMenuMPRulesWeaponTier8Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAKILO47,
				var_0_8.LuaMenuMPRulesMIKE4,
				var_0_8.LuaMenuMPRulesFALIMA,
				var_0_8.LuaMenuMPRulesFAPLHA,
				var_0_8.LuaMenuMPRulesMCHARLIE,
				var_0_8.LuaMenuMPRulesSCHARLIE,
				var_0_8.LuaMenuMPRulesASIERRA12,
				var_0_8.LuaMenuMPRulesKILO433,
				var_0_8.LuaMenuMPRulesTANGO21,
				var_0_8.LuaMenuMPRulesSIERRA552,
				var_0_8.LuaMenuMPRulesGALIMA,
				var_0_8.LuaMenuMPRulesANOVEMBER94,
				var_0_8.LuaMenuMPRulesMPAPA7,
				var_0_8.LuaMenuMPRulesAUGOLF,
				var_0_8.LuaMenuMPRulesPAPA90,
				var_0_8.LuaMenuMPRulesMPAPA5,
				var_0_8.LuaMenuMPRulesBETA,
				var_0_8.LuaMenuMPRulesUZULU,
				var_0_8.LuaMenuMPRulesSMGOLF45,
				var_0_8.LuaMenuMPRulesVICTOR,
				var_0_8.LuaMenuMPRulesCHARLIE9,
				var_0_8.LuaMenuMPRulesPKILO,
				var_0_8.LuaMenuMPRulesKILO121,
				var_0_8.LuaMenuMPRulesLIMA86,
				var_0_8.LuaMenuMPRulesMGOLF34,
				var_0_8.LuaMenuMPRulesMGOLF36,
				var_0_8.LuaMenuMPRulesMKILO3,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesRiotShield,
				var_0_8.LuaMenuMPRulesP320,
				var_0_8.LuaMenuMPRulesGOLF21,
				var_0_8.LuaMenuMPRulesMIKE1911,
				var_0_8.LuaMenuMPRulesMIKE9,
				var_0_8.LuaMenuMPRulesCPAPA,
				var_0_8.LuaMenuMPRulesDECHO,
				var_0_8.LuaMenuMPRulesRPAPA7,
				var_0_8.LuaMenuMPRulesGROMEO,
				var_0_8.LuaMenuMPRulesKGOLF,
				var_0_8.LuaMenuMPRulesJULIET,
				var_0_8.LuaMenuMPRulesFragGrenade,
				var_0_8.LuaMenuMPRulesSemtexGrenade,
				var_0_8.LuaMenuMPRulesC4,
				var_0_8.LuaMenuMPRulesMolotov,
				var_0_8.LuaMenuMPRulesThermite,
				var_0_8.LuaMenuMPRulesThrowingKnife,
				var_0_8.LuaMenuMPRulesThrowingKnifeFire,
				var_0_8.LuaMenuMPRulesClaymore,
				var_0_8.LuaMenuMPRulesATMine,
				var_0_8.LuaMenuMPRulesSnapshotGrenade,
				var_0_8.LuaMenuMPRulesSmokeGrenade,
				var_0_8.LuaMenuMPRulesFlash,
				var_0_8.LuaMenuMPRulesConcussionGrenade,
				var_0_8.LuaMenuMPRulesTrophySystem,
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_51_0, arg_51_1)
						if var_22_261() then
							arg_51_0:SetButtonDisabled(true)
						else
							arg_51_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_22_284 = Lobby.MatchRulesClasses.ArenaData
		local var_22_285 = Lobby.MatchRulesMembers.ArenaAttachments

		if arg_22_2 then
			if var_0_4(var_22_284, var_22_285) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_284, var_22_285, var_0_5.LuaMenuMPRulesArenaAttachments, var_0_6.LuaMenuMPRulesArenaAttachmentsDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesArenaAttachmentsSniperScopes
			}, var_22_261, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_52_0, arg_52_1)
						if var_22_261() then
							arg_52_0:SetButtonDisabled(true)
						else
							arg_52_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end
	end

	if var_22_1 == MP.GameMode.CMDGameType then
		local var_22_286 = Lobby.MatchRulesClasses.CMDData
		local var_22_287 = Lobby.MatchRulesMembers.CmdRules

		if arg_22_2 then
			if var_0_4(var_22_286, var_22_287) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_286, var_22_287, var_0_5.LuaMenuMPRulesCMDRules, var_0_6.LuaMenuMPRulesCMDRulesDesc, {
				var_0_8.LuaMenuMPRulesNormalCMD,
				var_0_8.LuaMenuMPRulesBreakThroughCMD
			}))
		end

		local var_22_288 = Lobby.MatchRulesClasses.CMDData
		local var_22_289 = Lobby.MatchRulesMembers.ActivationDelayCenter

		if arg_22_2 then
			if var_0_4(var_22_288, var_22_289) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_288, var_22_289, var_0_5.LuaMenuMPRulesActivationDelayCenter, var_0_6.LuaMenuMPRulesActivationDelayCenterDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_22_290 = Lobby.MatchRulesClasses.CMDData
		local var_22_291 = Lobby.MatchRulesMembers.CaptureDurationCenter

		if arg_22_2 then
			if var_0_4(var_22_290, var_22_291) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_290, var_22_291, var_0_5.LuaMenuMPRulesCaptureDurationCenter, var_0_6.LuaMenuMPRulesCaptureDurationCenterDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_22_292 = Lobby.MatchRulesClasses.CMDData
		local var_22_293 = Lobby.MatchRulesMembers.HoldDurationCenter

		if arg_22_2 then
			if var_0_4(var_22_292, var_22_293) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_292, var_22_293, var_0_5.LuaMenuMPRulesHoldDurationCenter, var_0_6.LuaMenuMPRulesHoldDurationCenterDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_22_294 = Lobby.MatchRulesClasses.CMDData
		local var_22_295 = Lobby.MatchRulesMembers.ActivationDelayHalf

		if arg_22_2 then
			if var_0_4(var_22_294, var_22_295) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_294, var_22_295, var_0_5.LuaMenuMPRulesActivationDelayHalf, var_0_6.LuaMenuMPRulesActivationDelayHalfDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_22_296 = Lobby.MatchRulesClasses.CMDData
		local var_22_297 = Lobby.MatchRulesMembers.CaptureDurationHalf

		if arg_22_2 then
			if var_0_4(var_22_296, var_22_297) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_296, var_22_297, var_0_5.LuaMenuMPRulesCaptureDurationHalf, var_0_6.LuaMenuMPRulesCaptureDurationHalfDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_22_298 = Lobby.MatchRulesClasses.CMDData
		local var_22_299 = Lobby.MatchRulesMembers.HoldDurationHalf

		if arg_22_2 then
			if var_0_4(var_22_298, var_22_299) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_298, var_22_299, var_0_5.LuaMenuMPRulesHoldDurationHalf, var_0_6.LuaMenuMPRulesHoldDurationHalfDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_22_300 = Lobby.MatchRulesClasses.CMDData
		local var_22_301 = Lobby.MatchRulesMembers.ActivationDelayBase

		if arg_22_2 then
			if var_0_4(var_22_300, var_22_301) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_300, var_22_301, var_0_5.LuaMenuMPRulesActivationDelayBase, var_0_6.LuaMenuMPRulesActivationDelayBaseDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_22_302 = Lobby.MatchRulesClasses.CMDData
		local var_22_303 = Lobby.MatchRulesMembers.CaptureDurationBase

		if arg_22_2 then
			if var_0_4(var_22_302, var_22_303) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_302, var_22_303, var_0_5.LuaMenuMPRulesCaptureDurationBase, var_0_6.LuaMenuMPRulesCaptureDurationBaseDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_22_304 = Lobby.MatchRulesClasses.CMDData
		local var_22_305 = Lobby.MatchRulesMembers.HoldDurationBase

		if arg_22_2 then
			if var_0_4(var_22_304, var_22_305) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_304, var_22_305, var_0_5.LuaMenuMPRulesHoldDurationBase, var_0_6.LuaMenuMPRulesHoldDurationBaseDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_22_306 = Lobby.MatchRulesClasses.CMDData
		local var_22_307 = Lobby.MatchRulesMembers.JuggSpawnBehavior

		if arg_22_2 then
			if var_0_4(var_22_306, var_22_307) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_306, var_22_307, var_0_5.LuaMenuMPRulesJuggSpawnBehavior, var_0_6.LuaMenuMPRulesJuggSpawnBehaviorDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesJuggSpawnAttackers,
				var_0_8.LuaMenuMPRulesJuggSpawnDefenders,
				var_0_8.LuaMenuMPRulesJuggSpawnBoth
			}))
		end

		local var_22_308 = Lobby.MatchRulesClasses.CTFData
		local var_22_309 = Lobby.MatchRulesMembers.CaptureCondition

		if arg_22_2 then
			if var_0_4(var_22_308, var_22_309) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_308, var_22_309, var_0_5.LuaMenuMPRulesCMDHVT, var_0_6.LuaMenuMPRulesCMDHVTDesc, {
				var_0_8.LuaMenuMPRulesCMDHVTDisabled,
				var_0_8.LuaMenuMPRulesCMDHVTSchool,
				var_0_8.LuaMenuMPRulesCMDHVTEmbassy
			}))
		end
	end

	if var_22_1 == MP.GameMode.HVTGameType then
		local var_22_310 = Lobby.MatchRulesClasses.HVTData
		local var_22_311 = Lobby.MatchRulesMembers.HVTCaptureValue

		if arg_22_2 then
			if var_0_4(var_22_310, var_22_311) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_310, var_22_311, var_0_5.LuaMenuMPRulesHVTCaptureValue, var_0_6.LuaMenuMPRulesHVTCaptureValueDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints6,
				var_0_8.LuaMenuMPRulesPoints7,
				var_0_8.LuaMenuMPRulesPoints8,
				var_0_8.LuaMenuMPRulesPoints9,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints50
			}))
		end
	end

	if var_22_1 == MP.GameMode.HVTGameType then
		local var_22_312 = Lobby.MatchRulesClasses.HVTData
		local var_22_313 = Lobby.MatchRulesMembers.HVTTargetCount

		if arg_22_2 then
			if var_0_4(var_22_312, var_22_313) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_312, var_22_313, var_0_5.LuaMenuMPRulesHVTTargetCount, var_0_6.LuaMenuMPRulesHVTTargetCountDesc, {
				var_0_8.LuaMenuMPRulesNum0,
				var_0_8.LuaMenuMPRulesNum1,
				var_0_8.LuaMenuMPRulesNum2,
				var_0_8.LuaMenuMPRulesNum3,
				var_0_8.LuaMenuMPRulesNum4,
				var_0_8.LuaMenuMPRulesNum5,
				var_0_8.LuaMenuMPRulesNum6,
				var_0_8.LuaMenuMPRulesNum7,
				var_0_8.LuaMenuMPRulesNum8,
				var_0_8.LuaMenuMPRulesNum9,
				var_0_8.LuaMenuMPRulesNum10
			}))
		end
	end

	if MP.IsBRGameType(var_22_1) then
		local var_22_314 = Lobby.MatchRulesClasses.BrData
		local var_22_315 = Lobby.MatchRulesMembers.StartingWeapon

		if arg_22_2 then
			if var_0_4(var_22_314, var_22_315) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_314, var_22_315, var_0_5.LuaMenuMPRulesBRStartingWeapon, var_0_6.LuaMenuMPRulesBRStartingWeaponDesc, {
				var_0_8.LuaMenuMPRulesBRStartWeapon0,
				var_0_8.LuaMenuMPRulesBRStartWeapon1,
				var_0_8.LuaMenuMPRulesBRStartWeapon2,
				var_0_8.LuaMenuMPRulesBRStartWeapon3,
				var_0_8.LuaMenuMPRulesBRStartWeapon4
			}))
		end

		local var_22_316 = Lobby.MatchRulesClasses.BrData
		local var_22_317 = Lobby.MatchRulesMembers.Gulag

		if arg_22_2 then
			if var_0_4(var_22_316, var_22_317) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_316, var_22_317, var_0_5.LuaMenuMPRulesBrGulag, var_0_6.LuaMenuMPRulesBrGulagDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_318 = Lobby.MatchRulesClasses.BrData
		local var_22_319 = Lobby.MatchRulesMembers.CircleDamageMultiplier

		if arg_22_2 then
			if var_0_4(var_22_318, var_22_319) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_318, var_22_319, var_0_5.LuaMenuMPRulesBrCircleDamageMultiplier, var_0_6.LuaMenuMPRulesBrCircleDamageMultiplierDesc, {
				var_0_8.LuaMenuMPRulesMultiplierHalf,
				var_0_8.LuaMenuMPRulesMultiplierThreeQuarter,
				var_0_8.LuaMenuMPRulesMultiplier1,
				var_0_8.LuaMenuMPRulesMultiplier1Quarter,
				var_0_8.LuaMenuMPRulesMultiplier1Half,
				var_0_8.LuaMenuMPRulesMultiplier1ThreeQuarter,
				var_0_8.LuaMenuMPRulesMultiplier2,
				var_0_8.LuaMenuMPRulesMultiplier3,
				var_0_8.LuaMenuMPRulesMultiplier4
			}))
		end

		local var_22_320 = Lobby.MatchRulesClasses.BrData
		local var_22_321 = Lobby.MatchRulesMembers.InfilC130

		if arg_22_2 then
			if var_0_4(var_22_320, var_22_321) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_320, var_22_321, var_0_5.LuaMenuMPRulesBrInfilC130, var_0_6.LuaMenuMPRulesBrInfilC130Desc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_322 = Lobby.MatchRulesClasses.BrData
		local var_22_323 = Lobby.MatchRulesMembers.InfilConvoy

		if arg_22_2 then
			if var_0_4(var_22_322, var_22_323) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_322, var_22_323, var_0_5.LuaMenuMPRulesBrInfilConvoy, var_0_6.LuaMenuMPRulesBrInfilConvoyDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_324 = Lobby.MatchRulesClasses.BrData
		local var_22_325 = Lobby.MatchRulesMembers.InfilHeli

		if arg_22_2 then
			if var_0_4(var_22_324, var_22_325) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_324, var_22_325, var_0_5.LuaMenuMPRulesBrInfilHeli, var_0_6.LuaMenuMPRulesBrInfilHeliDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_22_326 = Lobby.MatchRulesClasses.BrData
		local var_22_327 = Lobby.MatchRulesMembers.CrateDropTimer

		if arg_22_2 then
			if var_0_4(var_22_326, var_22_327) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_326, var_22_327, var_0_5.LuaMenuMPRulesCrateDropTimer, var_0_6.LuaMenuMPRulesCrateDropTimerDesc, {
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds60real,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPRulesSeconds150,
				var_0_8.LuaMenuMPRulesSeconds180,
				var_0_8.LuaMenuMPRulesSeconds210,
				var_0_8.LuaMenuMPRulesSeconds240,
				var_0_8.LuaMenuMPRulesSeconds270,
				var_0_8.LuaMenuMPRulesSeconds300
			}))
		end
	end

	if MP.IsBRLootSupportedGameType(var_22_1) then
		if MP.IsBRGameType(var_22_1) then
			Dvar.BDEHAEGHAF("RKMMNSQKO", "mp/loot_item_defs.csv")
		end

		local function var_22_328()
			return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.EnableBrLoot) == true
		end

		local var_22_329 = Lobby.MatchRulesClasses.CommonOption
		local var_22_330 = Lobby.MatchRulesMembers.EnableBrLoot

		if arg_22_2 then
			if var_0_4(var_22_329, var_22_330) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_329, var_22_330, var_0_5.LuaMenuMPRulesEnableBrLoot, var_0_6.LuaMenuMPRulesEnableBrLootDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}, nil, {
				{
					eventName = "rule_changed_commonOption_enableBrLoot",
					eventFunction = function(arg_54_0, arg_54_1)
						if var_22_328() then
							if MP.IsBRGameType(var_22_1) then
								Dvar.BDEHAEGHAF("RKMMNSQKO", "mp/loot_item_defs.csv")
							end
						else
							Dvar.BDEHAEGHAF("RKMMNSQKO", "")
						end
					end
				}
			}))
		end
	end

	if var_22_1 == MP.GameMode.CyberGameType then
		local var_22_331 = Lobby.MatchRulesClasses.CyberData
		local var_22_332 = Lobby.MatchRulesMembers.EmpSpawn

		if arg_22_2 then
			if var_0_4(var_22_331, var_22_332) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_331, var_22_332, var_0_5.LuaMenuMPRulesEmpSpawn, var_0_6.LuaMenuMPRulesEmpSpawnDesc, {
				var_0_8.LuaMenuMPRulesCyberEMPSpawnRandom,
				var_0_8.LuaMenuMPRulesCyberEMPSpawnLinear,
				var_0_8.LuaMenuMPRulesCyberEMPSpawnOne,
				var_0_8.LuaMenuMPRulesCyberEMPSpawnTwo,
				var_0_8.LuaMenuMPRulesCyberEMPSpawnThree
			}))
		end

		local var_22_333 = Lobby.MatchRulesClasses.CyberData
		local var_22_334 = Lobby.MatchRulesMembers.RadarPingTime

		if arg_22_2 then
			if var_0_4(var_22_333, var_22_334) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_333, var_22_334, var_0_5.LuaMenuMPRulesRadarPingTime, var_0_6.LuaMenuMPRulesRadarPingTimeDesc, {
				var_0_8.LuaMenuMPRulesEMPPingSeconds3,
				var_0_8.LuaMenuMPRulesEMPPingSeconds3Half,
				var_0_8.LuaMenuMPRulesEMPPingSeconds4,
				var_0_8.LuaMenuMPRulesEMPPingSeconds4Half,
				var_0_8.LuaMenuMPRulesEMPPingSeconds5,
				var_0_8.LuaMenuMPRulesEMPPingSeconds5Half,
				var_0_8.LuaMenuMPRulesEMPPingSeconds6,
				var_0_8.LuaMenuMPRulesEMPPingSeconds6Half,
				var_0_8.LuaMenuMPRulesEMPPingSeconds7,
				var_0_8.LuaMenuMPRulesEMPPingSeconds7Half,
				var_0_8.LuaMenuMPRulesEMPPingSeconds8,
				var_0_8.LuaMenuMPRulesEMPPingSeconds8Half,
				var_0_8.LuaMenuMPRulesEMPPingSeconds9,
				var_0_8.LuaMenuMPRulesEMPPingSeconds9Half,
				var_0_8.LuaMenuMPRulesEMPPingSeconds10,
				var_0_8.LuaMenuMPRulesEMPPingSeconds11,
				var_0_8.LuaMenuMPRulesEMPPingSeconds12,
				var_0_8.LuaMenuMPRulesEMPPingSeconds13,
				var_0_8.LuaMenuMPRulesEMPPingSeconds14,
				var_0_8.LuaMenuMPRulesEMPPingSeconds15,
				var_0_8.LuaMenuMPRulesEMPPingSeconds20,
				var_0_8.LuaMenuMPRulesEMPPingSeconds25,
				var_0_8.LuaMenuMPRulesEMPPingSeconds30,
				var_0_8.LuaMenuMPRulesEMPPingSeconds1,
				var_0_8.LuaMenuMPRulesEMPPingSeconds1Half,
				var_0_8.LuaMenuMPRulesEMPPingSeconds2,
				var_0_8.LuaMenuMPRulesEMPPingSeconds2Half
			}, nil, {
				{
					eventName = "rule_changed_cyberData_radarPingTime",
					eventFunction = function(arg_55_0, arg_55_1)
						local var_55_0 = MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CyberData, Lobby.MatchRulesMembers.RadarPingTime)

						Dvar.DFIJDJFIFD("NMPRQQMSNN", var_55_0)
					end
				}
			}))
		end

		local var_22_335 = Lobby.MatchRulesClasses.CyberData
		local var_22_336 = Lobby.MatchRulesMembers.PersBombTimer

		if arg_22_2 then
			if var_0_4(var_22_335, var_22_336) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_335, var_22_336, var_0_5.LuaMenuMPRulesPersBombTimer, var_0_6.LuaMenuMPRulesPersBombTimerDesc, {
				var_0_8.LuaMenuMPDisabledStaticTimer,
				var_0_8.LuaMenuMPEnabledPersTimer
			}))
		end

		local var_22_337 = Lobby.MatchRulesClasses.CyberData
		local var_22_338 = Lobby.MatchRulesMembers.DetonateScore

		if arg_22_2 then
			if var_0_4(var_22_337, var_22_338) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_337, var_22_338, var_0_5.LuaMenuMPRulesDetonateScore, var_0_6.LuaMenuMPRulesDetonateScoreDesc, {
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5
			}))
		end
	end

	if var_22_1 == MP.GameMode.TJuggGameType then
		local var_22_339 = Lobby.MatchRulesClasses.TjuggData
		local var_22_340 = Lobby.MatchRulesMembers.JuggSwitchTime

		if arg_22_2 then
			if var_0_4(var_22_339, var_22_340) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_339, var_22_340, var_0_5.LuaMenuMPRulesJuggSwitchTime, var_0_6.LuaMenuMPRulesJuggSwitchTimeDesc, {
				var_0_8.LuaMenuMPRulesSeconds60real,
				var_0_8.LuaMenuMPRulesSeconds65,
				var_0_8.LuaMenuMPRulesSeconds70,
				var_0_8.LuaMenuMPRulesSeconds75,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPRulesSeconds150,
				var_0_8.LuaMenuMPRulesSeconds180,
				var_0_8.LuaMenuRulesNever,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds11,
				var_0_8.LuaMenuMPRulesSeconds12,
				var_0_8.LuaMenuMPRulesSeconds13,
				var_0_8.LuaMenuMPRulesSeconds14,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55
			}))
		end

		local var_22_341 = Lobby.MatchRulesClasses.TjuggData
		local var_22_342 = Lobby.MatchRulesMembers.PointsPerKillAsJugg

		if arg_22_2 then
			if var_0_4(var_22_341, var_22_342) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_341, var_22_342, var_0_5.LuaMenuMPRulesPointsPerKillAsJugg, var_0_6.LuaMenuMPRulesPointsPerKillAsJuggDesc, {
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1
			}))
		end

		local var_22_343 = Lobby.MatchRulesClasses.TjuggData
		local var_22_344 = Lobby.MatchRulesMembers.PointsPerJuggKill

		if arg_22_2 then
			if var_0_4(var_22_343, var_22_344) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_343, var_22_344, var_0_5.LuaMenuMPRulesPointsPerJuggKill, var_0_6.LuaMenuMPRulesPointsPerJuggKillDesc, {
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4
			}))
		end

		local var_22_345 = Lobby.MatchRulesClasses.TjuggData
		local var_22_346 = Lobby.MatchRulesMembers.PointsPerJuggOnJuggKill

		if arg_22_2 then
			if var_0_4(var_22_345, var_22_346) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_345, var_22_346, var_0_5.LuaMenuMPRulesPointsPerJuggOnJuggKill, var_0_6.LuaMenuMPRulesPointsPerJuggOnJuggKillDesc, {
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5
			}))
		end
	end

	if var_22_1 == MP.GameMode.BTMGameType then
		local var_22_347 = Lobby.MatchRulesClasses.BtmData
		local var_22_348 = Lobby.MatchRulesMembers.PointsPerKillAsJugg

		if arg_22_2 then
			if var_0_4(var_22_347, var_22_348) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_347, var_22_348, var_0_5.LuaMenuMPRulesPointsPerKillAsJugg, var_0_6.LuaMenuMPRulesPointsPerKillAsJuggDesc, {
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1
			}))
		end

		local var_22_349 = Lobby.MatchRulesClasses.BtmData
		local var_22_350 = Lobby.MatchRulesMembers.PointsPerJuggKill

		if arg_22_2 then
			if var_0_4(var_22_349, var_22_350) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_349, var_22_350, var_0_5.LuaMenuMPRulesPointsPerJuggKill, var_0_6.LuaMenuMPRulesPointsPerJuggKillDesc, {
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4
			}))
		end

		local var_22_351 = Lobby.MatchRulesClasses.BtmData
		local var_22_352 = Lobby.MatchRulesMembers.PointsPerJuggOnJuggKill

		if arg_22_2 then
			if var_0_4(var_22_351, var_22_352) then
				return true
			end
		else
			table.insert(var_22_0, var_0_18(arg_22_0, arg_22_1, var_22_351, var_22_352, var_0_5.LuaMenuMPRulesPointsPerJuggOnJuggKill, var_0_6.LuaMenuMPRulesPointsPerJuggOnJuggKillDesc, {
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5
			}))
		end
	end

	if arg_22_2 then
		return false
	else
		return var_22_0
	end
end

local function var_0_20(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = {}
	local var_56_1 = Lobby.GetCurrentGameType()

	local function var_56_2()
		return not MLG.AreMLGRulesEnabled()
	end

	local var_56_3 = Lobby.MatchRulesClasses.CommonOption
	local var_56_4 = Lobby.MatchRulesMembers.DraftLoadoutTimer

	if arg_56_2 then
		if var_0_4(var_56_3, var_56_4) then
			return true
		end
	else
		table.insert(var_56_0, var_0_18(arg_56_0, arg_56_1, var_56_3, var_56_4, var_0_5.LuaMenuMPRulesDraftLoadoutTimer, var_0_6.LuaMenuMPRulesDraftLoadoutTimerDesc, {
			var_0_8.LuaMenuMPRulesSeconds1,
			var_0_8.LuaMenuMPRulesSeconds2,
			var_0_8.LuaMenuMPRulesSeconds3,
			var_0_8.LuaMenuMPRulesSeconds4,
			var_0_8.LuaMenuMPRulesSeconds5,
			var_0_8.LuaMenuMPRulesSeconds10,
			var_0_8.LuaMenuMPRulesSeconds15,
			var_0_8.LuaMenuMPRulesSeconds20,
			var_0_8.LuaMenuMPRulesSeconds25,
			var_0_8.LuaMenuMPRulesSeconds30,
			var_0_8.LuaMenuMPRulesSeconds35,
			var_0_8.LuaMenuMPRulesSeconds40,
			var_0_8.LuaMenuMPRulesSeconds45,
			var_0_8.LuaMenuMPRulesSeconds50,
			var_0_8.LuaMenuMPRulesSeconds55,
			var_0_8.LuaMenuMPRulesSeconds60real,
			var_0_8.LuaMenuMPRulesSeconds65,
			var_0_8.LuaMenuMPRulesSeconds70,
			var_0_8.LuaMenuMPRulesSeconds75
		}, var_56_2))
	end

	if arg_56_2 then
		return false
	else
		return var_56_0
	end
end

local function var_0_21(arg_58_0, arg_58_1, arg_58_2)
	local var_58_0 = {}
	local var_58_1 = Lobby.GetCurrentGameType()
	local var_58_2
	local var_58_3

	if var_58_1 == MP.GameMode.BRGameType then
		local var_58_4 = Lobby.MatchRulesClasses.CommonOption
		local var_58_5 = Lobby.MatchRulesMembers.TeamSize

		if arg_58_2 then
			if var_0_4(var_58_4, var_58_5) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_4, var_58_5, var_0_5.LuaMenuMPRulesTeamSize, var_0_6.LuaMenuMPRulesTeamSizeDesc, {
				var_0_8.LuaMenuMPRulesTeamSize1,
				var_0_8.LuaMenuMPRulesTeamSize2,
				var_0_8.LuaMenuMPRulesTeamSize3,
				var_0_8.LuaMenuMPRulesTeamSize4
			}))
		end
	end

	if var_58_1 == MP.GameMode.DomGameType then
		local var_58_6 = Lobby.MatchRulesClasses.CommonOption
		local var_58_7 = Lobby.MatchRulesMembers.RoundLimit

		if arg_58_2 then
			if var_0_4(var_58_6, var_58_7) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_6, var_58_7, var_0_5.LuaMenuMPRulesRoundLimit, var_0_6.LuaMenuMPRulesRoundLimitDesc, {
				var_0_8.LuaMenuMPRulesRounds1,
				var_0_8.LuaMenuMPRulesRounds2
			}))
		end
	end

	if var_58_1 == MP.GameMode.DomGameType then
		local var_58_8 = Lobby.MatchRulesClasses.CommonOption
		local var_58_9 = Lobby.MatchRulesMembers.RoundSwitch

		if arg_58_2 then
			if var_0_4(var_58_8, var_58_9) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_8, var_58_9, var_0_5.LuaMenuMPRulesRoundSwitch, var_0_6.LuaMenuMPRulesRoundSwitchDesc, {
				var_0_8.LuaMenuRulesNever,
				var_0_8.LuaMenuRulesEveryRound
			}))
		end
	end

	if MP.IsTimeLimitGameType(var_58_1) and var_58_1 ~= MP.GameMode.BRGameType then
		local var_58_10 = Lobby.MatchRulesClasses.CommonOption
		local var_58_11 = Lobby.MatchRulesMembers.TimeLimit

		if arg_58_2 then
			if var_0_4(var_58_10, var_58_11) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_10, var_58_11, var_0_5.LuaMenuMPRulesTimeLimit, var_0_6.LuaMenuMPRulesTimeLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes1Min15Sec,
				var_0_8.LuaMenuMPRulesMinutes1Half,
				var_0_8.LuaMenuMPRulesMinutes1Min45Sec,
				var_0_8.LuaMenuMPRulesMinutes2,
				var_0_8.LuaMenuMPRulesMinutes2Half,
				var_0_8.LuaMenuMPRulesMinutes3,
				var_0_8.LuaMenuMPRulesMinutes4,
				var_0_8.LuaMenuMPRulesMinutes5,
				var_0_8.LuaMenuMPRulesMinutes6,
				var_0_8.LuaMenuMPRulesMinutes7,
				var_0_8.LuaMenuMPRulesMinutes8,
				var_0_8.LuaMenuMPRulesMinutes9,
				var_0_8.LuaMenuMPRulesMinutes10,
				var_0_8.LuaMenuMPRulesMinutes11,
				var_0_8.LuaMenuMPRulesMinutes12,
				var_0_8.LuaMenuMPRulesMinutes13,
				var_0_8.LuaMenuMPRulesMinutes14,
				var_0_8.LuaMenuMPRulesMinutes15,
				var_0_8.LuaMenuMPRulesMinutes20,
				var_0_8.LuaMenuMPRulesMinutes30,
				var_0_8.LuaMenuMPRulesMinutes45
			}))
		end
	end

	if MP.IsShortTimeLimitGameType(var_58_1) then
		local var_58_12 = Lobby.MatchRulesClasses.CommonOption
		local var_58_13 = Lobby.MatchRulesMembers.TimeLimit

		if arg_58_2 then
			if var_0_4(var_58_12, var_58_13) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_12, var_58_13, var_0_5.LuaMenuMPRulesTimeLimit, var_0_6.LuaMenuMPRulesTimeLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesMinutes15Sec,
				var_0_8.LuaMenuMPRulesMinutes20Sec,
				var_0_8.LuaMenuMPRulesMinutes25Sec,
				var_0_8.LuaMenuMPRulesMinutesHalf,
				var_0_8.LuaMenuMPRulesMinutes35Sec,
				var_0_8.LuaMenuMPRulesMinutes40Sec,
				var_0_8.LuaMenuMPRulesMinutes45Sec,
				var_0_8.LuaMenuMPRulesMinutes50Sec,
				var_0_8.LuaMenuMPRulesMinutes55Sec,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes1Min15Sec,
				var_0_8.LuaMenuMPRulesMinutes1Half,
				var_0_8.LuaMenuMPRulesMinutes1Min45Sec,
				var_0_8.LuaMenuMPRulesMinutes2
			}))
		end
	end

	if MP.IsHighRoundTimeLimitGameType(var_58_1) then
		local var_58_14 = Lobby.MatchRulesClasses.CommonOption
		local var_58_15 = Lobby.MatchRulesMembers.TimeLimit

		if arg_58_2 then
			if var_0_4(var_58_14, var_58_15) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_14, var_58_15, var_0_5.LuaMenuMPRulesRoundTimeLimit, var_0_6.LuaMenuMPRulesRoundTimeLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesMinutesHalf,
				var_0_8.LuaMenuMPRulesMinutes35Sec,
				var_0_8.LuaMenuMPRulesMinutes40Sec,
				var_0_8.LuaMenuMPRulesMinutes45Sec,
				var_0_8.LuaMenuMPRulesMinutes50Sec,
				var_0_8.LuaMenuMPRulesMinutes55Sec,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes1Min15Sec,
				var_0_8.LuaMenuMPRulesMinutes1Half,
				var_0_8.LuaMenuMPRulesMinutes1Min35Sec,
				var_0_8.LuaMenuMPRulesMinutes1Min40Sec,
				var_0_8.LuaMenuMPRulesMinutes1Min45Sec,
				var_0_8.LuaMenuMPRulesMinutes1Min50Sec,
				var_0_8.LuaMenuMPRulesMinutes1Min55Sec,
				var_0_8.LuaMenuMPRulesMinutes2,
				var_0_8.LuaMenuMPRulesMinutes2Min15Sec,
				var_0_8.LuaMenuMPRulesMinutes2Half,
				var_0_8.LuaMenuMPRulesMinutes2Min45Sec,
				var_0_8.LuaMenuMPRulesMinutes3,
				var_0_8.LuaMenuMPRulesMinutes4,
				var_0_8.LuaMenuMPRulesMinutes5
			}))
		end
	end

	if var_58_1 == MP.GameMode.RushGameType then
		local var_58_16 = Lobby.MatchRulesClasses.RushData
		local var_58_17 = Lobby.MatchRulesMembers.ActivationDelay

		if arg_58_2 then
			if var_0_4(var_58_16, var_58_17) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_16, var_58_17, var_0_5.LuaMenuMPRulesActivationDelay, var_0_6.LuaMenuMPRulesActivationDelayDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_58_18 = Lobby.MatchRulesClasses.RushData
		local var_58_19 = Lobby.MatchRulesMembers.CaptureDuration

		if arg_58_2 then
			if var_0_4(var_58_18, var_58_19) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_18, var_58_19, var_0_5.LuaMenuMPRulesCaptureDuration, var_0_6.LuaMenuMPRulesCaptureDurationDesc, {
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60
			}))
		end

		local var_58_20 = Lobby.MatchRulesClasses.RushData
		local var_58_21 = Lobby.MatchRulesMembers.ExtraTimeBonus

		if arg_58_2 then
			if var_0_4(var_58_20, var_58_21) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_20, var_58_21, var_0_5.LuaMenuMPRulesExtraTimeBonus, var_0_6.LuaMenuMPRulesExtraTimeBonusDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesMinutesHalf,
				var_0_8.LuaMenuMPRulesMinutes45Sec,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes1Min15Sec,
				var_0_8.LuaMenuMPRulesMinutes1Half,
				var_0_8.LuaMenuMPRulesMinutes2,
				var_0_8.LuaMenuMPRulesMinutes2Half,
				var_0_8.LuaMenuMPRulesMinutes3,
				var_0_8.LuaMenuMPRulesMinutes3Half,
				var_0_8.LuaMenuMPRulesMinutes4,
				var_0_8.LuaMenuMPRulesMinutes4Half,
				var_0_8.LuaMenuMPRulesMinutes5
			}))
		end
	end

	if MP.IsLowRoundTimeLimitGameType(var_58_1) then
		local var_58_22 = Lobby.MatchRulesClasses.CommonOption
		local var_58_23 = Lobby.MatchRulesMembers.TimeLimit

		if arg_58_2 then
			if var_0_4(var_58_22, var_58_23) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_22, var_58_23, var_0_5.LuaMenuMPRulesRoundTimeLimit, var_0_6.LuaMenuMPRulesRoundTimeLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes1Half,
				var_0_8.LuaMenuMPRulesMinutes2,
				var_0_8.LuaMenuMPRulesMinutes2Half,
				var_0_8.LuaMenuMPRulesMinutes3,
				var_0_8.LuaMenuMPRulesMinutes4,
				var_0_8.LuaMenuMPRulesMinutes5,
				var_0_8.LuaMenuMPRulesMinutes6,
				var_0_8.LuaMenuMPRulesMinutes7,
				var_0_8.LuaMenuMPRulesMinutes8,
				var_0_8.LuaMenuMPRulesMinutes9,
				var_0_8.LuaMenuMPRulesMinutes10,
				var_0_8.LuaMenuMPRulesMinutes11,
				var_0_8.LuaMenuMPRulesMinutes12,
				var_0_8.LuaMenuMPRulesMinutes13,
				var_0_8.LuaMenuMPRulesMinutes14,
				var_0_8.LuaMenuMPRulesMinutes15,
				var_0_8.LuaMenuMPRulesMinutes20,
				var_0_8.LuaMenuMPRulesMinutes30
			}))
		end
	end

	if var_58_1 == MP.GameMode.FrontGameType or var_58_1 == MP.GameMode.DomGameType or var_58_1 == MP.GameMode.BallGameType or var_58_1 == MP.GameMode.ArmsRaceGameType or var_58_1 == MP.GameMode.TDefGameType then
		local var_58_24 = Lobby.MatchRulesClasses.CommonOption
		local var_58_25 = Lobby.MatchRulesMembers.ScoreLimit

		if arg_58_2 then
			if var_0_4(var_58_24, var_58_25) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_24, var_58_25, var_0_5.LuaMenuMPRulesRoundScoreLimit, var_0_6.LuaMenuMPRulesRoundScoreLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints55,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints65,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints85,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints95,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints150,
				var_0_8.LuaMenuMPRulesPoints200,
				var_0_8.LuaMenuMPRulesPoints250,
				var_0_8.LuaMenuMPRulesPoints300,
				var_0_8.LuaMenuMPRulesPoints350,
				var_0_8.LuaMenuMPRulesPoints400,
				var_0_8.LuaMenuMPRulesPoints450,
				var_0_8.LuaMenuMPRulesPoints500,
				var_0_8.LuaMenuMPRulesPoints550,
				var_0_8.LuaMenuMPRulesPoints600,
				var_0_8.LuaMenuMPRulesPoints650,
				var_0_8.LuaMenuMPRulesPoints700,
				var_0_8.LuaMenuMPRulesPoints750,
				var_0_8.LuaMenuMPRulesPoints800,
				var_0_8.LuaMenuMPRulesPoints850,
				var_0_8.LuaMenuMPRulesPoints900,
				var_0_8.LuaMenuMPRulesPoints950,
				var_0_8.LuaMenuMPRulesPoints1000,
				var_0_8.LuaMenuMPRulesPoints1500,
				var_0_8.LuaMenuMPRulesPoints2000,
				var_0_8.LuaMenuMPRulesPoints2500,
				var_0_8.LuaMenuMPRulesPoints3000,
				var_0_8.LuaMenuMPRulesPoints4000,
				var_0_8.LuaMenuMPRulesPoints5000,
				var_0_8.LuaMenuMPRulesPoints6000,
				var_0_8.LuaMenuMPRulesPoints7000,
				var_0_8.LuaMenuMPRulesPoints7500,
				var_0_8.LuaMenuMPRulesPoints8000,
				var_0_8.LuaMenuMPRulesPoints9000,
				var_0_8.LuaMenuMPRulesPoints10000
			}))
		end
	end

	if var_58_1 == MP.GameMode.TDMGameType or var_58_1 == MP.GameMode.MPZombiesGameType or var_58_1 == MP.GameMode.HardpointGameType or var_58_1 == MP.GameMode.HQGameType or var_58_1 == MP.GameMode.GrndGameType or var_58_1 == MP.GameMode.FFAGameType or var_58_1 == MP.GameMode.ConfGameType or var_58_1 == MP.GameMode.GrindGameType or var_58_1 == MP.GameMode.EscapeGameType or var_58_1 == MP.GameMode.HVTGameType or var_58_1 == MP.GameMode.TJuggGameType then
		local var_58_26 = Lobby.MatchRulesClasses.CommonOption
		local var_58_27 = Lobby.MatchRulesMembers.ScoreLimit

		if arg_58_2 then
			if var_0_4(var_58_26, var_58_27) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_26, var_58_27, var_0_5.LuaMenuMPRulesScoreLimit, var_0_6.LuaMenuMPRulesScoreLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints30,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints55,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints65,
				var_0_8.LuaMenuMPRulesPoints70,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints85,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints95,
				var_0_8.LuaMenuMPRulesPoints100,
				var_0_8.LuaMenuMPRulesPoints150,
				var_0_8.LuaMenuMPRulesPoints200,
				var_0_8.LuaMenuMPRulesPoints250,
				var_0_8.LuaMenuMPRulesPoints300,
				var_0_8.LuaMenuMPRulesPoints350,
				var_0_8.LuaMenuMPRulesPoints400,
				var_0_8.LuaMenuMPRulesPoints450,
				var_0_8.LuaMenuMPRulesPoints500,
				var_0_8.LuaMenuMPRulesPoints550,
				var_0_8.LuaMenuMPRulesPoints600,
				var_0_8.LuaMenuMPRulesPoints650,
				var_0_8.LuaMenuMPRulesPoints700,
				var_0_8.LuaMenuMPRulesPoints750,
				var_0_8.LuaMenuMPRulesPoints800,
				var_0_8.LuaMenuMPRulesPoints850,
				var_0_8.LuaMenuMPRulesPoints900,
				var_0_8.LuaMenuMPRulesPoints950,
				var_0_8.LuaMenuMPRulesPoints1000
			}))
		end
	end

	if var_58_1 == MP.GameMode.CTFGameType or var_58_1 == MP.GameMode.BlitzGameType then
		local var_58_28 = Lobby.MatchRulesClasses.CommonOption
		local var_58_29 = Lobby.MatchRulesMembers.ScoreLimit

		if arg_58_2 then
			if var_0_4(var_58_28, var_58_29) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_28, var_58_29, var_0_5.LuaMenuMPRulesRoundScoreLimit, var_0_6.LuaMenuMPRulesRoundScoreLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesFlags1,
				var_0_8.LuaMenuMPRulesFlags3,
				var_0_8.LuaMenuMPRulesFlags5,
				var_0_8.LuaMenuMPRulesFlags10,
				var_0_8.LuaMenuMPRulesFlags15,
				var_0_8.LuaMenuMPRulesFlags30
			}))
		end
	end

	if var_58_1 == MP.GameMode.AliensGameType then
		local var_58_30 = Lobby.MatchRulesClasses.CommonOption
		local var_58_31 = Lobby.MatchRulesMembers.ScoreLimit

		if arg_58_2 then
			if var_0_4(var_58_30, var_58_31) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_30, var_58_31, var_0_5.LuaMenuMPRulesScoreLimit, var_0_6.LuaMenuMPRulesScoreLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesPoints1000
			}))
		end
	end

	if var_58_1 == MP.GameMode.SDGameType or var_58_1 == MP.GameMode.SRGameType or var_58_1 == MP.GameMode.SiegeGameType or var_58_1 == MP.GameMode.ArenaGameType or var_58_1 == MP.GameMode.CyberGameType then
		local var_58_32 = Lobby.MatchRulesClasses.CommonOption
		local var_58_33 = Lobby.MatchRulesMembers.WinLimit

		if arg_58_2 then
			if var_0_4(var_58_32, var_58_33) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_32, var_58_33, var_0_5.LuaMenuMPRulesWinLimit, var_0_6.LuaMenuMPRulesWinLimitDesc, {
				var_0_8.LuaMenuMPRulesRounds1,
				var_0_8.LuaMenuMPRulesRounds2,
				var_0_8.LuaMenuMPRulesRounds3,
				var_0_8.LuaMenuMPRulesRounds4,
				var_0_8.LuaMenuMPRulesRounds5,
				var_0_8.LuaMenuMPRulesRounds6,
				var_0_8.LuaMenuMPRulesRounds7,
				var_0_8.LuaMenuMPRulesRounds8,
				var_0_8.LuaMenuMPRulesRounds9,
				var_0_8.LuaMenuMPRulesRounds10,
				var_0_8.LuaMenuMPRulesRounds12,
				var_0_8.LuaMenuMPRulesRounds24
			}))
		end
	end

	if var_58_1 == MP.GameMode.SDGameType or var_58_1 == MP.GameMode.SRGameType or var_58_1 == MP.GameMode.SiegeGameType or var_58_1 == MP.GameMode.ArenaGameType then
		local var_58_34 = Lobby.MatchRulesClasses.CommonOption
		local var_58_35 = Lobby.MatchRulesMembers.WinByTwoEnabled

		if arg_58_2 then
			if var_0_4(var_58_34, var_58_35) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_34, var_58_35, var_0_5.LuaMenuMPRulesWinByTwoEnabled, var_0_6.LuaMenuMPRulesWinByTwoEnabledDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_58_36 = Lobby.MatchRulesClasses.CommonOption
		local var_58_37 = Lobby.MatchRulesMembers.WinByTwoMaxRounds

		if arg_58_2 then
			if var_0_4(var_58_36, var_58_37) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_36, var_58_37, var_0_5.LuaMenuMPRulesWinByTwoMaxRounds, var_0_6.LuaMenuMPRulesWinByTwoMaxRoundsDesc, {
				var_0_8.LuaMenuMPRulesRounds1,
				var_0_8.LuaMenuMPRulesRounds2,
				var_0_8.LuaMenuMPRulesRounds3,
				var_0_8.LuaMenuMPRulesRounds4,
				var_0_8.LuaMenuMPRulesRounds5,
				var_0_8.LuaMenuMPRulesRounds6,
				var_0_8.LuaMenuMPRulesRounds7,
				var_0_8.LuaMenuMPRulesRounds8,
				var_0_8.LuaMenuMPRulesRounds9,
				var_0_8.LuaMenuMPRulesRounds10,
				var_0_8.LuaMenuMPRulesRounds12,
				var_0_8.LuaMenuMPRulesRounds14,
				var_0_8.LuaMenuMPRulesRounds16,
				var_0_8.LuaMenuMPRulesRounds18,
				var_0_8.LuaMenuMPRulesRounds20,
				var_0_8.LuaMenuMPRulesRounds24,
				var_0_8.LuaMenuMPRulesRounds48
			}))
		end
	end

	if var_58_1 == MP.GameMode.SDGameType or var_58_1 == MP.GameMode.SRGameType or var_58_1 == MP.GameMode.SiegeGameType or var_58_1 == MP.GameMode.ArenaGameType or var_58_1 == MP.GameMode.CyberGameType then
		local var_58_38 = Lobby.MatchRulesClasses.CommonOption
		local var_58_39 = Lobby.MatchRulesMembers.RoundSwitch

		if arg_58_2 then
			if var_0_4(var_58_38, var_58_39) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_38, var_58_39, var_0_5.LuaMenuMPRulesRoundSwitch, var_0_6.LuaMenuMPRulesRoundSwitchDesc, {
				var_0_8.LuaMenuRulesNever,
				var_0_8.LuaMenuRulesEveryRound,
				var_0_8.LuaMenuRulesEvery2Rounds,
				var_0_8.LuaMenuRulesEvery3Rounds,
				var_0_8.LuaMenuRulesEvery4Rounds,
				var_0_8.LuaMenuRulesEvery5Rounds,
				var_0_8.LuaMenuRulesEvery6Rounds,
				var_0_8.LuaMenuRulesEvery7Rounds,
				var_0_8.LuaMenuRulesEvery8Rounds,
				var_0_8.LuaMenuRulesEvery9Rounds,
				var_0_8.LuaMenuRulesEvery10Rounds,
				var_0_8.LuaMenuRulesEvery11Rounds,
				var_0_8.LuaMenuRulesEvery12Rounds
			}))
		end
	end

	if var_58_1 ~= MP.GameMode.BRGameType then
		local var_58_40 = Lobby.MatchRulesClasses.CommonOption
		local var_58_41 = Lobby.MatchRulesMembers.MatchStartTime

		if arg_58_2 then
			if var_0_4(var_58_40, var_58_41) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_40, var_58_41, var_0_5.LuaMenuMPRulesMatchStartTime, var_0_6.LuaMenuMPRulesMatchStartTimeDesc, {
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60real,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10
			}, nil, {
				{
					eventName = "rule_changed_commonOption_matchStartTime",
					eventFunction = function(arg_59_0, arg_59_1)
						if not var_0_13() then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.InfilSkip, true)
							var_0_0(arg_58_0)

							if arg_59_1.refreshOriginButtonID == "" or arg_59_1.refreshOriginButtonID == "option_commonOption_infilSkip" then
								arg_58_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_59_0
								})
							end
						end
					end
				}
			}))
		end
	end

	if MP.IsRoundBasedGameType(var_58_1) then
		local var_58_42 = Lobby.MatchRulesClasses.CommonOption
		local var_58_43 = Lobby.MatchRulesMembers.RoundStartTime

		if arg_58_2 then
			if var_0_4(var_58_42, var_58_43) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_42, var_58_43, var_0_5.LuaMenuMPRulesRoundStartTime, var_0_6.LuaMenuMPRulesRoundStartTimeDesc, {
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60real
			}))
		end
	end

	local var_58_44 = Lobby.MatchRulesClasses.CommonOption
	local var_58_45 = Lobby.MatchRulesMembers.InfilSkip

	if arg_58_2 then
		if var_0_4(var_58_44, var_58_45) then
			return true
		end
	else
		table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_44, var_58_45, var_0_5.LuaMenuMPRulesInfilSkip, var_0_6.LuaMenuMPRulesInfilSkipDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}, nil, {
			{
				eventName = "rule_changed_commonOption_infilSkip",
				eventFunction = function(arg_60_0, arg_60_1)
					if not var_0_12() then
						if MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MatchStartTime) ~= 15 then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MatchStartTime, 15)
						end

						var_0_0(arg_58_0)

						if arg_60_1.refreshOriginButtonID == "" or arg_60_1.refreshOriginButtonID == "option_commonOption_matchStartTime" then
							arg_58_0.GameSetupCategoryOptions:processEvent({
								name = "refresh_button_values",
								button = arg_60_0
							})
						end
					end
				end
			}
		}))
	end

	if var_58_1 == MP.GameMode.SDGameType or var_58_1 == MP.GameMode.CyberGameType or var_58_1 == MP.GameMode.ArenaGameType or var_58_1 == MP.GameMode.SiegeGameType then
		local var_58_46 = Lobby.MatchRulesClasses.CommonOption
		local var_58_47 = Lobby.MatchRulesMembers.PracticeRound

		if arg_58_2 then
			if var_0_4(var_58_46, var_58_47) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_46, var_58_47, var_0_5.LuaMenuMPRulesPracticeRound, var_0_6.LuaMenuMPRulesPracticeRoundDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end
	end

	local var_58_48 = Lobby.MatchRulesClasses.CommonOption
	local var_58_49 = Lobby.MatchRulesMembers.InputSwapEnabled

	if arg_58_2 then
		if var_0_4(var_58_48, var_58_49) then
			return true
		end
	else
		table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_48, var_58_49, var_0_5.LuaMenuMPRulesAllowInputSwap, var_0_6.LuaMenuMPRulesAllowInputSwapDesc, {
			var_0_8.LuaMenuMPEnabled,
			var_0_8.LuaMenuMPDisabled
		}, nil, {
			{
				eventName = "rule_changed_commonOption_inputSwapEnabled",
				eventFunction = function(arg_61_0, arg_61_1)
					Dvar.DHEGHJJJHI("NNPMRQSQN", arg_61_1.value)
				end
			}
		}))
	end

	local var_58_50 = Lobby.MatchRulesClasses.CommonOption
	local var_58_51 = Lobby.MatchRulesMembers.CDLTuning

	if arg_58_2 then
		if var_0_4(var_58_50, var_58_51) then
			return true
		end
	else
		table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_50, var_58_51, var_0_5.LuaMenuMPRulesCDLTuning, var_0_6.LuaMenuMPRulesCDLTuningDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}))
	end

	if Dvar.IBEGCHEFE("NRMMRSMNPS") then
		local var_58_52 = Lobby.MatchRulesClasses.CommonOption
		local var_58_53 = Lobby.MatchRulesMembers.CODCastingEnabled

		if arg_58_2 then
			if var_0_4(var_58_52, var_58_53) then
				return true
			end
		else
			table.insert(var_58_0, var_0_18(arg_58_0, arg_58_1, var_58_52, var_58_53, var_0_5.LuaMenuMPRulesCODCastingEnabled, var_0_6.LuaMenuMPRulesCODCastingEnabledDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}, nil, {
				{
					eventName = "rule_changed_commonOption_codcasterEnabled",
					eventFunction = function(arg_62_0, arg_62_1)
						CODCASTER.SetCODCastingEnabled(arg_62_1.value)
					end
				}
			}))
		end
	end

	if arg_58_2 then
		return false
	else
		return var_58_0
	end
end

local function var_0_22(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = {}
	local var_63_1 = Lobby.GetCurrentGameType()

	local function var_63_2()
		return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.NumLives) == 1
	end

	local var_63_3 = Lobby.MatchRulesClasses.CommonOption
	local var_63_4 = Lobby.MatchRulesMembers.NumLives

	if var_63_1 ~= MP.GameMode.InfectGameType and var_63_1 ~= MP.GameMode.DemoGameType then
		if arg_63_2 then
			if var_0_4(var_63_3, var_63_4) then
				return true
			end
		else
			table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_3, var_63_4, var_0_5.LuaMenuMPRulesNumberOfLives, var_0_6.LuaMenuMPRulesNumberOfLivesDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesLives1,
				var_0_8.LuaMenuMPRulesLives2,
				var_0_8.LuaMenuMPRulesLives3,
				var_0_8.LuaMenuMPRulesLives4,
				var_0_8.LuaMenuMPRulesLives5,
				var_0_8.LuaMenuMPRulesLives10,
				var_0_8.LuaMenuMPRulesLives15,
				var_0_8.LuaMenuMPRulesLives20,
				var_0_8.LuaMenuMPRulesLives25
			}, nil, {
				{
					eventName = "rule_changed_commonOption_numLives",
					eventFunction = function(arg_65_0, arg_65_1)
						if not var_63_2() then
							if MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.LastStand) == 2 then
								MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.LastStand, 1)
								var_0_0(arg_63_0)
							end

							if arg_65_1.refreshOriginButtonID and (arg_65_1.refreshOriginButtonID == "" or arg_65_1.refreshOriginButtonID == "option_commonOption_lastStand") then
								arg_63_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_65_0
								})
							end
						end
					end
				}
			}))
		end
	end

	local var_63_5 = Lobby.MatchRulesClasses.CommonOption
	local var_63_6 = Lobby.MatchRulesMembers.MaxHealth

	if arg_63_2 then
		if var_0_4(var_63_5, var_63_6) then
			return true
		end
	else
		table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_5, var_63_6, var_0_5.LuaMenuMPRulesMaxHealth, var_0_6.LuaMenuMPRulesMaxHealthDesc, {
			var_0_8.LuaMenuMPRulesNum1,
			var_0_8.LuaMenuMPRulesPoints5,
			var_0_8.LuaMenuMPRulesPoints10,
			var_0_8.LuaMenuMPRulesPoints15,
			var_0_8.LuaMenuMPRulesPoints20,
			var_0_8.LuaMenuMPRulesPoints25,
			var_0_8.LuaMenuRulesMiniscule,
			var_0_8.LuaMenuMPRulesPoints35,
			var_0_8.LuaMenuMPRulesPoints40,
			var_0_8.LuaMenuMPRulesPoints45,
			var_0_8.LuaMenuRulesHalf,
			var_0_8.LuaMenuMPRulesPoints55,
			var_0_8.LuaMenuMPRulesPoints60,
			var_0_8.LuaMenuMPRulesPoints65,
			var_0_8.LuaMenuRulesTactical,
			var_0_8.LuaMenuMPRulesPoints75,
			var_0_8.LuaMenuMPRulesPoints80,
			var_0_8.LuaMenuMPRulesPoints85,
			var_0_8.LuaMenuMPRulesPoints90,
			var_0_8.LuaMenuMPRulesPoints95,
			var_0_8.LuaMenuRulesNormal,
			var_0_8.LuaMenuRules130,
			var_0_8.LuaMenuMPRulesPoints150,
			var_0_8.LuaMenuMPRulesPoints200,
			var_0_8.LuaMenuMPRulesPoints250,
			var_0_8.LuaMenuMPRulesPoints300
		}))
	end

	local var_63_7 = Lobby.MatchRulesClasses.CommonOption
	local var_63_8 = Lobby.MatchRulesMembers.HealthRegen

	if arg_63_2 then
		if var_0_4(var_63_7, var_63_8) then
			return true
		end
	else
		table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_7, var_63_8, var_0_5.LuaMenuMPRulesHealthRegen, var_0_6.LuaMenuMPRulesHealthRegenDesc, {
			var_0_8.LuaMenuRulesNone,
			var_0_8.LuaMenuRulesRegenVerySlow,
			var_0_8.LuaMenuRulesRegenSlow,
			var_0_8.LuaMenuRulesRegenNormal,
			var_0_8.LuaMenuRulesRegenFast
		}))
	end

	local var_63_9 = Lobby.MatchRulesClasses.CommonOption
	local var_63_10 = Lobby.MatchRulesMembers.DisableSuperSprint

	if arg_63_2 then
		if var_0_4(var_63_9, var_63_10) then
			return true
		end
	else
		table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_9, var_63_10, var_0_5.LuaMenuMPRulesDisableSuperSprint, var_0_6.LuaMenuMPRulesDisableSuperSprintDesc, {
			var_0_8.LuaMenuMPEabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	local var_63_11 = Lobby.MatchRulesClasses.CommonOption
	local var_63_12 = Lobby.MatchRulesMembers.DisableMount

	if arg_63_2 then
		if var_0_4(var_63_11, var_63_12) then
			return true
		end
	else
		table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_11, var_63_12, var_0_5.LuaMenuMPRulesDisableMount, var_0_6.LuaMenuMPRulesDisableMountDesc, {
			var_0_8.LuaMenuMPEabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	if var_63_1 ~= MP.GameMode.FFAGameType and var_63_1 ~= MP.GameMode.InfectGameType and var_63_1 ~= MP.GameMode.GunGameType and var_63_1 ~= MP.GameMode.OICGameType then
		local var_63_13 = Lobby.MatchRulesClasses.CommonOption
		local var_63_14 = Lobby.MatchRulesMembers.LastStand

		if arg_63_2 then
			if var_0_4(var_63_13, var_63_14) then
				return true
			end
		else
			table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_13, var_63_14, var_0_5.LuaMenuMPRulesLastStand, var_0_6.LuaMenuMPRulesLastStandDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesLastStandNormal,
				var_0_8.LuaMenuMPRulesLastStandAllowRevive
			}, nil, {
				{
					eventName = "rule_changed_commonOption_lastStand",
					eventFunction = function(arg_66_0, arg_66_1)
						if var_0_10() then
							if MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.NumLives) ~= 1 then
								MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.NumLives, 1)
							end

							var_0_0(arg_63_0)

							if arg_66_1.refreshOriginButtonID and (arg_66_1.refreshOriginButtonID == "" or arg_66_1.refreshOriginButtonID == "option_commonOption_numLives") then
								arg_63_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_66_0
								})
							end
						end
					end
				}
			}))
		end

		local var_63_15 = Lobby.MatchRulesClasses.CommonOption
		local var_63_16 = Lobby.MatchRulesMembers.EnemyDeathLoc

		if arg_63_2 then
			if var_0_4(var_63_15, var_63_16) then
				return true
			end
		else
			table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_15, var_63_16, var_0_5.LuaMenuMPRulesEnemyDeathLoc, var_0_6.LuaMenuMPRulesEnemyDeathLocDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_63_17 = Lobby.MatchRulesClasses.CommonOption
		local var_63_18 = Lobby.MatchRulesMembers.LastStandHealth

		if arg_63_2 then
			if var_0_4(var_63_17, var_63_18) then
				return true
			end
		else
			table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_17, var_63_18, var_0_5.LuaMenuMPRulesLastStandHealth, var_0_6.LuaMenuMPRulesLastStandHealthDesc, {
				var_0_8.LuaMenuMPRulesNum1,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuRulesMiniscule,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuRulesHalf,
				var_0_8.LuaMenuMPRulesPoints55,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints65,
				var_0_8.LuaMenuRulesTactical,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints85,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints95,
				var_0_8.LuaMenuRulesNormal,
				var_0_8.LuaMenuRules130,
				var_0_8.LuaMenuMPRulesPoints150,
				var_0_8.LuaMenuMPRulesPoints200,
				var_0_8.LuaMenuMPRulesPoints250,
				var_0_8.LuaMenuMPRulesPoints300
			}))
		end

		local var_63_19 = Lobby.MatchRulesClasses.CommonOption
		local var_63_20 = Lobby.MatchRulesMembers.LastStandReviveHealth

		if arg_63_2 then
			if var_0_4(var_63_19, var_63_20) then
				return true
			end
		else
			table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_19, var_63_20, var_0_5.LuaMenuMPRulesLastStandReviveHealth, var_0_6.LuaMenuMPRulesLastStandReviveHealthDesc, {
				var_0_8.LuaMenuMPRulesNum1,
				var_0_8.LuaMenuMPRulesPoints5,
				var_0_8.LuaMenuMPRulesPoints10,
				var_0_8.LuaMenuMPRulesPoints15,
				var_0_8.LuaMenuMPRulesPoints20,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuRulesMiniscule,
				var_0_8.LuaMenuMPRulesPoints35,
				var_0_8.LuaMenuMPRulesPoints40,
				var_0_8.LuaMenuMPRulesPoints45,
				var_0_8.LuaMenuRulesHalf,
				var_0_8.LuaMenuMPRulesPoints55,
				var_0_8.LuaMenuMPRulesPoints60,
				var_0_8.LuaMenuMPRulesPoints65,
				var_0_8.LuaMenuRulesTactical,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints80,
				var_0_8.LuaMenuMPRulesPoints85,
				var_0_8.LuaMenuMPRulesPoints90,
				var_0_8.LuaMenuMPRulesPoints95,
				var_0_8.LuaMenuRulesNormal,
				var_0_8.LuaMenuRules130,
				var_0_8.LuaMenuMPRulesPoints150,
				var_0_8.LuaMenuMPRulesPoints200,
				var_0_8.LuaMenuMPRulesPoints250,
				var_0_8.LuaMenuMPRulesPoints300
			}))
		end

		local var_63_21 = Lobby.MatchRulesClasses.CommonOption
		local var_63_22 = Lobby.MatchRulesMembers.LastStandTimer

		if arg_63_2 then
			if var_0_4(var_63_21, var_63_22) then
				return true
			end
		else
			table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_21, var_63_22, var_0_5.LuaMenuMPRulesLastStandTimer, var_0_6.LuaMenuMPRulesLastStandTimerDesc, {
				var_0_8.LuaMenuMPRulesUnlimited,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds35,
				var_0_8.LuaMenuMPRulesSeconds40,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds50,
				var_0_8.LuaMenuMPRulesSeconds55,
				var_0_8.LuaMenuMPRulesSeconds60real,
				var_0_8.LuaMenuMPRulesSeconds65,
				var_0_8.LuaMenuMPRulesSeconds70,
				var_0_8.LuaMenuMPRulesSeconds75,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPRulesSeconds150,
				var_0_8.LuaMenuMPRulesSeconds180
			}))
		end

		local var_63_23 = Lobby.MatchRulesClasses.CommonOption
		local var_63_24 = Lobby.MatchRulesMembers.LastStandReviveTimer

		if arg_63_2 then
			if var_0_4(var_63_23, var_63_24) then
				return true
			end
		else
			table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_23, var_63_24, var_0_5.LuaMenuMPRulesLastStandReviveTimer, var_0_6.LuaMenuMPRulesLastStandReviveTimerDesc, {
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds8Half,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds9Half,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end

		local var_63_25 = Lobby.MatchRulesClasses.CommonOption
		local var_63_26 = Lobby.MatchRulesMembers.LastStandSuicideTimer

		if arg_63_2 then
			if var_0_4(var_63_25, var_63_26) then
				return true
			end
		else
			table.insert(var_63_0, var_0_18(arg_63_0, arg_63_1, var_63_25, var_63_26, var_0_5.LuaMenuMPRulesLastStandSuicideTimer, var_0_6.LuaMenuMPRulesLastStandSuicideTimerDesc, {
				var_0_8.LuaMenuMPRulesUnlimited,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds8,
				var_0_8.LuaMenuMPRulesSeconds8Half,
				var_0_8.LuaMenuMPRulesSeconds9,
				var_0_8.LuaMenuMPRulesSeconds9Half,
				var_0_8.LuaMenuMPRulesSeconds10
			}))
		end
	end

	if arg_63_2 then
		return false
	else
		return var_63_0
	end
end

local function var_0_23(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = {}
	local var_67_1 = Lobby.GetCurrentGameType()
	local var_67_2 = Lobby.MatchRulesClasses.CommonOption
	local var_67_3 = Lobby.MatchRulesMembers.SpectateModeAllowed

	if arg_67_2 then
		if var_0_4(var_67_2, var_67_3) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_2, var_67_3, var_0_5.LuaMenuMPRulesSpectating, var_0_6.LuaMenuMPRulesSpectatingDesc, {
			var_0_8.LuaMenuMPDisabledNumValue,
			var_0_8.LuaMenuMPRulesSpectating,
			var_0_8.LuaMenuRulesFree
		}))
	end

	local var_67_4 = Lobby.MatchRulesClasses.CommonOption
	local var_67_5 = Lobby.MatchRulesMembers.Spectate3rdAllowed

	if arg_67_2 then
		if var_0_4(var_67_4, var_67_5) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_4, var_67_5, var_0_5.LuaMenuMPRules3rdSpectating, var_0_6.LuaMenuMPRules3rdSpectatingDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}))
	end

	local var_67_6 = Lobby.MatchRulesClasses.CommonOption
	local var_67_7 = Lobby.MatchRulesMembers.ShowKillcam

	if arg_67_2 then
		if var_0_4(var_67_6, var_67_7) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_6, var_67_7, var_0_5.LuaMenuMPRulesKillcam, var_0_6.LuaMenuMPRulesKillcamDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}))
	end

	local var_67_8 = Lobby.MatchRulesClasses.CommonOption
	local var_67_9 = Lobby.MatchRulesMembers.KillcamType

	if arg_67_2 then
		if var_0_4(var_67_8, var_67_9) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_8, var_67_9, var_0_5.LuaMenuMPRulesKillcamType, var_0_6.LuaMenuMPRulesKillcamTypeDesc, {
			var_0_8.LuaMenuMPRulesFinalKillPotG,
			var_0_8.LuaMenuMPRulesFinalKillFK,
			var_0_8.LuaMenuMPRulesFinalKillDisabled
		}))
	end

	local var_67_10 = Lobby.MatchRulesClasses.CommonOption
	local var_67_11 = Lobby.MatchRulesMembers.EnableMiniMap

	if arg_67_2 then
		if var_0_4(var_67_10, var_67_11) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_10, var_67_11, var_0_5.LuaMenuMPRulesEnableMiniMap, var_0_6.LuaMenuMPRulesEnableMiniMapDesc, {
			var_0_8.LuaMPMenuNo,
			var_0_8.LuaMenuMPYes
		}))
	end

	local var_67_12 = Lobby.MatchRulesClasses.CommonOption
	local var_67_13 = Lobby.MatchRulesMembers.RadarAlwaysOn

	if arg_67_2 then
		if var_0_4(var_67_12, var_67_13) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_12, var_67_13, var_0_5.LuaMenuMPRulesRadarAlwaysOn, var_0_6.LuaMenuMPRulesRadarAlwaysOnDesc, {
			var_0_8.LuaMenuMPDisabledNumValue,
			var_0_8.LuaMenuMPRulesRadarNormalSweep,
			var_0_8.LuaMenuMPRulesRadarFastSweep,
			var_0_8.LuaMenuMPRulesRadarConstantOn,
			var_0_8.LuaMenuMPRulesRadarDirectional
		}))
	end

	local var_67_14 = Lobby.MatchRulesClasses.CommonOption
	local var_67_15 = Lobby.MatchRulesMembers.RadarHideShots

	if arg_67_2 then
		if var_0_4(var_67_14, var_67_15) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_14, var_67_15, var_0_5.LuaMenuMPRulesRadarHideShots, var_0_6.LuaMenuMPRulesRadarHideShotsDesc, {
			var_0_8.LuaMenuMPRulesRadarHidePings0,
			var_0_8.LuaMenuMPRulesRadarHidePings1,
			var_0_8.LuaMenuMPRulesRadarHidePings2
		}))
	end

	local var_67_16 = Lobby.MatchRulesClasses.CommonOption
	local var_67_17 = Lobby.MatchRulesMembers.CompassHidePings

	if arg_67_2 then
		if var_0_4(var_67_16, var_67_17) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_16, var_67_17, var_0_5.LuaMenuMPRulesCompassHideShots, var_0_6.LuaMenuMPRulesCompassHideShotsDesc, {
			var_0_8.LuaMenuMPRulesCompassHidePings0,
			var_0_8.LuaMenuMPRulesCompassHidePings1,
			var_0_8.LuaMenuMPRulesCompassHidePings2
		}))
	end

	local var_67_18 = Lobby.MatchRulesClasses.CommonOption
	local var_67_19 = Lobby.MatchRulesMembers.CompassHideEnemy

	if arg_67_2 then
		if var_0_4(var_67_18, var_67_19) then
			return true
		end
	else
		table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_18, var_67_19, var_0_5.LuaMenuMPRulesCompassHideEnemy, var_0_6.LuaMenuMPRulesCompassHideEnemyDesc, {
			var_0_8.LuaMenuMPDisabledValueTrue,
			var_0_8.LuaMenuMPEabledValueFalse
		}))
	end

	if var_67_1 ~= MP.GameMode.InfectGameType and var_67_1 ~= MP.GameMode.GunGameType then
		local var_67_20 = Lobby.MatchRulesClasses.CommonOption
		local var_67_21 = Lobby.MatchRulesMembers.RespawnDelay

		if arg_67_2 then
			if var_0_4(var_67_20, var_67_21) then
				return true
			end
		else
			table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_20, var_67_21, var_0_5.LuaMenuMPRulesRespawnDelay, var_0_6.LuaMenuMPRulesRespawnDelayDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_67_22 = Lobby.MatchRulesClasses.CommonOption
		local var_67_23 = Lobby.MatchRulesMembers.WaveRespawnDelay

		if arg_67_2 then
			if var_0_4(var_67_22, var_67_23) then
				return true
			end
		else
			table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_22, var_67_23, var_0_5.LuaMenuMPRulesWaveDelay, var_0_6.LuaMenuMPRulesWaveDelayDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_67_24 = Lobby.MatchRulesClasses.CommonOption
		local var_67_25 = Lobby.MatchRulesMembers.SuicideSpawnDelay

		if arg_67_2 then
			if var_0_4(var_67_24, var_67_25) then
				return true
			end
		else
			table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_24, var_67_25, var_0_5.LuaMenuMPRulesSuicideSpawnDelay, var_0_6.LuaMenuMPRulesSuicideSpawnDelayDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesSeconds0Half,
				var_0_8.LuaMenuMPRulesSeconds1,
				var_0_8.LuaMenuMPRulesSeconds1Half,
				var_0_8.LuaMenuMPRulesSeconds2,
				var_0_8.LuaMenuMPRulesSeconds2Half,
				var_0_8.LuaMenuMPRulesSeconds3,
				var_0_8.LuaMenuMPRulesSeconds3Half,
				var_0_8.LuaMenuMPRulesSeconds4,
				var_0_8.LuaMenuMPRulesSeconds4Half,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds5Half,
				var_0_8.LuaMenuMPRulesSeconds6,
				var_0_8.LuaMenuMPRulesSeconds6Half,
				var_0_8.LuaMenuMPRulesSeconds7,
				var_0_8.LuaMenuMPRulesSeconds7Half,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_67_26 = Lobby.MatchRulesClasses.CommonOption
		local var_67_27 = Lobby.MatchRulesMembers.ForceRespawn

		if arg_67_2 then
			if var_0_4(var_67_26, var_67_27) then
				return true
			end
		else
			table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_26, var_67_27, var_0_5.LuaMenuMPRulesForceRespawn, var_0_6.LuaMenuMPRulesForceRespawnDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		if Lobby.IsCurrentGameTypeteamBased() then
			local var_67_28 = Lobby.MatchRulesClasses.CommonOption
			local var_67_29 = Lobby.MatchRulesMembers.TeamAssignmentAllowed

			if arg_67_2 then
				if var_0_4(var_67_28, var_67_29) then
					return true
				end
			else
				table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_28, var_67_29, var_0_5.LuaMenuMPRulesTeamAssignmentAllowed, var_0_6.LuaMenuMPRulesTeamAssignmentAllowedDesc, {
					var_0_8.LuaMenuMPDisabled,
					var_0_8.LuaMenuMPEnabled
				}, nil, {
					{
						eventName = "rule_changed_commonOption_teamAssignmentAllowed",
						eventFunction = function(arg_68_0, arg_68_1)
							Dvar.DHEGHJJJHI("NQORMNOQQM", arg_68_1.value)
							Lobby.DIHECGCADG(arg_68_1.value)
						end
					}
				}))
			end

			if not Engine.ECAJCAJJGF() then
				local var_67_30 = Lobby.MatchRulesClasses.CommonOption
				local var_67_31 = Lobby.MatchRulesMembers.FriendlyFire

				if arg_67_2 then
					if var_0_4(var_67_30, var_67_31) then
						return true
					end
				else
					table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_30, var_67_31, var_0_5.LuaMenuMPRulesFriendlyFire, var_0_6.LuaMenuMPRulesFriendlyFireDesc, {
						var_0_8.LuaMenuMPDisabledNumValue,
						var_0_8.LuaMenuMPEnabledNumValue,
						var_0_8.LuaMenuMPRulesFFReflect,
						var_0_8.LuaMenuMPRulesFFShare,
						var_0_8.LuaMenuMPRulesFFPunish
					}))
				end

				local var_67_32 = Lobby.MatchRulesClasses.CommonOption
				local var_67_33 = Lobby.MatchRulesMembers.FFPunishLimit

				if arg_67_2 then
					if var_0_4(var_67_32, var_67_33) then
						return true
					end
				else
					table.insert(var_67_0, var_0_18(arg_67_0, arg_67_1, var_67_32, var_67_33, var_0_5.LuaMenuMPRulesFFPunishLimit, var_0_6.LuaMenuMPRulesFFPunishLimitDesc, {
						var_0_8.LuaMenuMPRulesDisabledNeg,
						var_0_8.LuaMenuMPRulesKills1,
						var_0_8.LuaMenuMPRulesKills2,
						var_0_8.LuaMenuMPRulesKills3,
						var_0_8.LuaMenuMPRulesKills4,
						var_0_8.LuaMenuMPRulesKills5
					}))
				end
			end
		end
	end

	if arg_67_2 then
		return false
	else
		return var_67_0
	end
end

local function var_0_24(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = {}
	local var_69_1 = Lobby.GetCurrentGameType()
	local var_69_2 = Lobby.MatchRulesClasses.CommonOption
	local var_69_3 = Lobby.MatchRulesMembers.DisableSpawnCamera

	if arg_69_2 then
		if var_0_4(var_69_2, var_69_3) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_2, var_69_3, var_0_5.LuaMenuMPRulesDisableSpawnCamera, var_0_6.LuaMenuMPRulesDisableSpawnCameraDesc, {
			var_0_8.LuaMenuMPEabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	local var_69_4 = Lobby.MatchRulesClasses.CommonOption
	local var_69_5 = Lobby.MatchRulesMembers.HardcoreModeOn

	if arg_69_2 then
		if var_0_4(var_69_4, var_69_5) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_4, var_69_5, var_0_5.LuaMenuMPRulesHardcore, var_0_6.LuaMenuMPRulesHardcoreDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}, nil, {
			{
				eventName = "rule_changed_commonOption_hardcoreModeOn",
				eventFunction = function(arg_70_0, arg_70_1)
					if var_0_9() then
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.FriendlyFire, 4)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MaxHealth, 30)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HealthRegen, 0)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.ShowKillcam, false)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.RadarAlwaysOn, 0)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.ForceRespawn, true)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.Spectate3rdAllowed, false)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.TacticalModeOn, false)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.EnableMiniMap, false)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.RadarHideShots, 2)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.CompassHidePings, 2)
						var_0_0(arg_69_0)

						if arg_70_1.refreshOriginButtonID == "" or arg_70_1.refreshOriginButtonID == "option_commonOption_tacticalMode" or arg_70_1.refreshOriginButtonID == "option_commonOption_hardcoreModeOn" then
							arg_69_0.GameSetupCategoryOptions:processEvent({
								name = "refresh_button_values",
								button = arg_70_0
							})
						end
					end

					if not var_0_9() then
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.FriendlyFire, 0)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MaxHealth, 100)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HealthRegen, 5)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.ShowKillcam, true)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.RadarAlwaysOn, 0)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.ForceRespawn, true)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.Spectate3rdAllowed, true)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.RadarHideShots, 0)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.CompassHidePings, 0)
						var_0_0(arg_69_0)

						if arg_70_1.refreshOriginButtonID == "" or arg_70_1.refreshOriginButtonID == "option_commonOption_tacticalMode" or arg_70_1.refreshOriginButtonID == "option_commonOption_hardcoreModeOn" then
							arg_69_0.GameSetupCategoryOptions:processEvent({
								name = "refresh_button_values",
								button = arg_70_0
							})
						end
					end
				end
			}
		}))
	end

	local var_69_6 = Lobby.MatchRulesClasses.CommonOption
	local var_69_7 = Lobby.MatchRulesMembers.TacticalModeOn

	if arg_69_2 then
		if var_0_4(var_69_6, var_69_7) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_6, var_69_7, var_0_5.LuaMenuMPRulesTacticalMode, var_0_6.LuaMenuMPRulesTacticalModeDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}, nil, {
			{
				eventName = "rule_changed_commonOption_tacticalMode",
				eventFunction = function(arg_71_0, arg_71_1)
					if var_0_11() then
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HardcoreModeOn, false)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.EnableMiniMap, false)
						MatchRules.CIGFFEAEFD("commonOption", "nameplateSetting", 1)
					else
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.EnableMiniMap, true)
						MatchRules.CIGFFEAEFD("commonOption", "nameplateSetting", 0)
					end

					var_0_0(arg_69_0)

					if arg_71_1.refreshOriginButtonID == "" or arg_71_1.refreshOriginButtonID == "option_commonOption_hardcoreModeOn" or arg_71_1.refreshOriginButtonID == "option_commonOption_tacticalMode" then
						arg_69_0.GameSetupCategoryOptions:processEvent({
							name = "refresh_button_values",
							button = arg_71_0
						})
					end
				end
			}
		}))
	end

	local var_69_8 = Lobby.MatchRulesClasses.CommonOption
	local var_69_9 = Lobby.MatchRulesMembers.MagCount

	if arg_69_2 then
		if var_0_4(var_69_8, var_69_9) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_8, var_69_9, var_0_5.LuaMenuMPRulesMagCount, var_0_6.LuaMenuMPRulesMagCountDesc, {
			var_0_8.LuaMenuMPRulesMagCountNone,
			var_0_8.LuaMenuMPRulesMagCountOneMag,
			var_0_8.LuaMenuMPRulesMagCountTwoMags,
			var_0_8.LuaMenuMPRulesMagCountNormal,
			var_0_8.LuaMenuMPRulesMagCountFourMags,
			var_0_8.LuaMenuMPRulesMagCountFiveMags,
			var_0_8.LuaMenuMPRulesMagCountSixMags,
			var_0_8.LuaMenuMPRulesMagCountMax
		}))
	end

	local var_69_10 = Lobby.MatchRulesClasses.CommonOption
	local var_69_11 = Lobby.MatchRulesMembers.HeadshotsOnly

	if arg_69_2 then
		if var_0_4(var_69_10, var_69_11) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_10, var_69_11, var_0_5.LuaMenuMPRulesHeadshotsOnly, var_0_6.LuaMenuMPRulesHeadshotsOnlyDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}))
	end

	if not Engine.ECAJCAJJGF() then
		local var_69_12 = Lobby.MatchRulesClasses.CommonOption
		local var_69_13 = Lobby.MatchRulesMembers.Vampirism

		if arg_69_2 then
			if var_0_4(var_69_12, var_69_13) then
				return true
			end
		else
			table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_12, var_69_13, var_0_5.LuaMenuMPRulesVampirism, var_0_6.LuaMenuMPRulesVampirismDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	local var_69_14 = Lobby.MatchRulesClasses.CommonOption
	local var_69_15 = Lobby.MatchRulesMembers.CrankedBombTimer

	if arg_69_2 then
		if var_0_4(var_69_14, var_69_15) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_14, var_69_15, var_0_5.LuaMenuMPRulesCrankedTimer, var_0_6.LuaMenuMPRulesCrankedTimerDesc, {
			var_0_8.LuaMenuMPDisabledNumValue,
			var_0_8.LuaMenuMPRulesSeconds10,
			var_0_8.LuaMenuMPRulesSeconds11,
			var_0_8.LuaMenuMPRulesSeconds12,
			var_0_8.LuaMenuMPRulesSeconds13,
			var_0_8.LuaMenuMPRulesSeconds14,
			var_0_8.LuaMenuMPRulesSeconds15,
			var_0_8.LuaMenuMPRulesSeconds20,
			var_0_8.LuaMenuMPRulesSeconds25,
			var_0_8.LuaMenuMPRulesSeconds30,
			var_0_8.LuaMenuMPRulesSeconds35,
			var_0_8.LuaMenuMPRulesSeconds40,
			var_0_8.LuaMenuMPRulesSeconds45,
			var_0_8.LuaMenuMPRulesSeconds50,
			var_0_8.LuaMenuMPRulesSeconds55,
			var_0_8.LuaMenuMPRulesSeconds60real
		}))
	end

	if var_69_1 ~= MP.GameMode.GunGameType then
		local var_69_16 = Lobby.MatchRulesClasses.CommonOption
		local var_69_17 = Lobby.MatchRulesMembers.AllowSupers

		if arg_69_2 then
			if var_0_4(var_69_16, var_69_17) then
				return true
			end
		else
			table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_16, var_69_17, var_0_5.LuaMenuMPRulesAllowSupers, var_0_6.LuaMenuMPRulesAllowSupersDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_69_18 = Lobby.MatchRulesClasses.CommonOption
		local var_69_19 = Lobby.MatchRulesMembers.SuperFastChargeRate

		if arg_69_2 then
			if var_0_4(var_69_18, var_69_19) then
				return true
			end
		else
			table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_18, var_69_19, var_0_5.LuaMenuMPRulesSuperFastChargeRate, var_0_6.LuaMenuMPRulesSuperFastChargeRateDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesNormalMod,
				var_0_8.LuaMenuMPRulesMultiplier2,
				var_0_8.LuaMenuMPRulesMultiplier3,
				var_0_8.LuaMenuMPRulesMultiplier4,
				var_0_8.LuaMenuMPRulesMultiplier5,
				var_0_8.LuaMenuMPRulesMultiplier6,
				var_0_8.LuaMenuMPRulesMultiplier7,
				var_0_8.LuaMenuMPRulesMultiplier8,
				var_0_8.LuaMenuMPRulesMultiplier9,
				var_0_8.LuaMenuMPRulesMultiplier10
			}))
		end

		local var_69_20 = Lobby.MatchRulesClasses.CommonOption
		local var_69_21 = Lobby.MatchRulesMembers.SuperPointsMod

		if arg_69_2 then
			if var_0_4(var_69_20, var_69_21) then
				return true
			end
		else
			table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_20, var_69_21, var_0_5.LuaMenuMPRulesSuperPointsMod, var_0_6.LuaMenuMPRulesSuperPointsModDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesMultiplierQuarter,
				var_0_8.LuaMenuMPRulesMultiplierHalf,
				var_0_8.LuaMenuMPRulesMultiplierThreeQuarter,
				var_0_8.LuaMenuMPRulesNormalMod,
				var_0_8.LuaMenuMPRulesMultiplier1Quarter,
				var_0_8.LuaMenuMPRulesMultiplier1Half,
				var_0_8.LuaMenuMPRulesMultiplier1ThreeQuarter,
				var_0_8.LuaMenuMPRulesMultiplier2,
				var_0_8.LuaMenuMPRulesMultiplier2Quarter,
				var_0_8.LuaMenuMPRulesMultiplier2Half,
				var_0_8.LuaMenuMPRulesMultiplier3,
				var_0_8.LuaMenuMPRulesMultiplier3Half,
				var_0_8.LuaMenuMPRulesMultiplier4,
				var_0_8.LuaMenuMPRulesMultiplier4Half,
				var_0_8.LuaMenuMPRulesMultiplier5,
				var_0_8.LuaMenuMPRulesMultiplier5Half,
				var_0_8.LuaMenuMPRulesMultiplier6,
				var_0_8.LuaMenuMPRulesMultiplier6Half,
				var_0_8.LuaMenuMPRulesMultiplier7,
				var_0_8.LuaMenuMPRulesMultiplier7Half,
				var_0_8.LuaMenuMPRulesMultiplier8,
				var_0_8.LuaMenuMPRulesMultiplier8Half,
				var_0_8.LuaMenuMPRulesMultiplier9,
				var_0_8.LuaMenuMPRulesMultiplier9Half,
				var_0_8.LuaMenuMPRulesMultiplier10
			}))
		end
	end

	if var_69_1 ~= MP.GameMode.InfectGameType and var_69_1 ~= MP.GameMode.GunGameType then
		local var_69_22 = Lobby.MatchRulesClasses.CommonOption
		local var_69_23 = Lobby.MatchRulesMembers.AllowPerks

		if arg_69_2 then
			if var_0_4(var_69_22, var_69_23) then
				return true
			end
		else
			table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_22, var_69_23, var_0_5.LuaMenuMPRulesPerks, var_0_6.LuaMenuMPRulesPerksDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local function var_69_24()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.AllowKillstreaks)
		end

		if MP.IsKillstreakSupportedGameType(var_69_1) then
			local var_69_25 = Lobby.MatchRulesClasses.CommonOption
			local var_69_26 = Lobby.MatchRulesMembers.AllowKillstreaks

			if arg_69_2 then
				if var_0_4(var_69_25, var_69_26) then
					return true
				end
			else
				table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_25, var_69_26, var_0_5.LuaMenuMPRulesKillstreaks, var_0_6.LuaMenuMPRulesKillstreaksDesc, {
					var_0_8.LuaMenuMPDisabled,
					var_0_8.LuaMenuMPEnabled
				}, nil, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function(arg_73_0, arg_73_1)
							if var_69_24() then
								MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.RoundRetainStreaks, false)
								MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.DeathRetainStreaks, false)
								var_0_0(arg_69_0)
							end

							arg_69_0.GameSetupCategoryOptions:processEvent({
								name = "refresh_button_values",
								button = arg_73_0
							})
						end
					}
				}))
			end

			local var_69_27 = Lobby.MatchRulesClasses.CommonOption
			local var_69_28 = Lobby.MatchRulesMembers.RoundRetainStreaks

			if arg_69_2 then
				if var_0_4(var_69_27, var_69_28) then
					return true
				end
			else
				table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_27, var_69_28, var_0_5.LuaMenuMPRulesRoundRetainStreaks, var_0_6.LuaMenuMPRulesRoundRetainStreaksDesc, {
					var_0_8.LuaMenuMPDisabled,
					var_0_8.LuaMenuMPEnabled
				}, var_69_24, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function(arg_74_0, arg_74_1)
							if var_69_24() then
								arg_74_0:SetButtonDisabled(true)
							else
								arg_74_0:SetButtonDisabled(false)
							end
						end
					}
				}))
			end

			local var_69_29 = Lobby.MatchRulesClasses.CommonOption
			local var_69_30 = Lobby.MatchRulesMembers.DeathRetainStreaks

			if arg_69_2 then
				if var_0_4(var_69_29, var_69_30) then
					return true
				end
			else
				table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_29, var_69_30, var_0_5.LuaMenuMPRulesDeathRetainStreaks, var_0_6.LuaMenuMPRulesDeathRetainStreaksDesc, {
					var_0_8.LuaMenuMPEnabled,
					var_0_8.LuaMenuMPDisabled
				}, var_69_24, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function(arg_75_0, arg_75_1)
							if var_69_24() then
								arg_75_0:SetButtonDisabled(true)
							else
								arg_75_0:SetButtonDisabled(false)
							end
						end
					}
				}))
			end
		end
	end

	local var_69_31 = Lobby.MatchRulesClasses.CommonOption
	local var_69_32 = Lobby.MatchRulesMembers.LethalDelay

	if arg_69_2 then
		if var_0_4(var_69_31, var_69_32) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_31, var_69_32, var_0_5.LuaMenuMPRulesLethalDelay, var_0_6.LuaMenuMPRulesLethalDelayDesc, {
			var_0_8.LuaMenuMPDisabledNumValue,
			var_0_8.LuaMenuMPRulesSeconds1,
			var_0_8.LuaMenuMPRulesSeconds1Half,
			var_0_8.LuaMenuMPRulesSeconds2,
			var_0_8.LuaMenuMPRulesSeconds2Half,
			var_0_8.LuaMenuMPRulesSeconds3,
			var_0_8.LuaMenuMPRulesSeconds3Half,
			var_0_8.LuaMenuMPRulesSeconds4,
			var_0_8.LuaMenuMPRulesSeconds4Half,
			var_0_8.LuaMenuMPRulesSeconds5,
			var_0_8.LuaMenuMPRulesSeconds5Half,
			var_0_8.LuaMenuMPRulesSeconds6,
			var_0_8.LuaMenuMPRulesSeconds6Half,
			var_0_8.LuaMenuMPRulesSeconds7,
			var_0_8.LuaMenuMPRulesSeconds7Half,
			var_0_8.LuaMenuMPRulesSeconds8,
			var_0_8.LuaMenuMPRulesSeconds8Half,
			var_0_8.LuaMenuMPRulesSeconds9,
			var_0_8.LuaMenuMPRulesSeconds9Half,
			var_0_8.LuaMenuMPRulesSeconds10
		}))
	end

	local var_69_33 = Lobby.MatchRulesClasses.CommonOption
	local var_69_34 = Lobby.MatchRulesMembers.EquipmentMSProtect

	if arg_69_2 then
		if var_0_4(var_69_33, var_69_34) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_33, var_69_34, var_0_5.LuaMenuMPRulesEquipmentMSProtect, var_0_6.LuaMenuMPRulesEquipmentMSProtectDesc, {
			var_0_8.LuaMenuMPDisabledNumValue,
			var_0_8.LuaMenuMPRulesSeconds1,
			var_0_8.LuaMenuMPRulesSeconds1Half,
			var_0_8.LuaMenuMPRulesSeconds2,
			var_0_8.LuaMenuMPRulesSeconds2Half,
			var_0_8.LuaMenuMPRulesSeconds3,
			var_0_8.LuaMenuMPRulesSeconds3Half,
			var_0_8.LuaMenuMPRulesSeconds4,
			var_0_8.LuaMenuMPRulesSeconds4Half,
			var_0_8.LuaMenuMPRulesSeconds5,
			var_0_8.LuaMenuMPRulesSeconds5Half,
			var_0_8.LuaMenuMPRulesSeconds6,
			var_0_8.LuaMenuMPRulesSeconds6Half,
			var_0_8.LuaMenuMPRulesSeconds7,
			var_0_8.LuaMenuMPRulesSeconds7Half,
			var_0_8.LuaMenuMPRulesSeconds8,
			var_0_8.LuaMenuMPRulesSeconds8Half,
			var_0_8.LuaMenuMPRulesSeconds9,
			var_0_8.LuaMenuMPRulesSeconds9Half,
			var_0_8.LuaMenuMPRulesSeconds10
		}))
	end

	local var_69_35 = Lobby.MatchRulesClasses.CommonOption
	local var_69_36 = Lobby.MatchRulesMembers.DisableBattleChatter

	if arg_69_2 then
		if var_0_4(var_69_35, var_69_36) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_35, var_69_36, var_0_5.LuaMenuMPRulesDisableBattleChatter, var_0_6.LuaMenuMPRulesDisableBattleChatterDesc, {
			var_0_8.LuaMenuMPEabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	local var_69_37 = Lobby.MatchRulesClasses.CommonOption
	local var_69_38 = Lobby.MatchRulesMembers.DisableAnnouncer

	if arg_69_2 then
		if var_0_4(var_69_37, var_69_38) then
			return true
		end
	else
		table.insert(var_69_0, var_0_18(arg_69_0, arg_69_1, var_69_37, var_69_38, var_0_5.LuaMenuMPRulesDisableAnnouncer, var_0_6.LuaMenuMPRulesDisableAnnouncerDesc, {
			var_0_8.LuaMenuMPEabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	if arg_69_2 then
		return false
	else
		return var_69_0
	end
end

local var_0_25 = {
	[var_0_3.Gameplay] = {
		categoryTitle = "LUA_MENU/RULES_GAMEPLAY_OPTIONS",
		tabName = "LUA_MENU/RULES_GAMEPLAY_OPTIONS",
		optionsFeeder = var_0_24
	},
	[var_0_3.Team] = {
		categoryTitle = "LUA_MENU/RULES_TEAM_OPTIONS",
		tabName = "LUA_MENU/RULES_TEAM_OPTIONS",
		optionsFeeder = var_0_23
	},
	[var_0_3.Player] = {
		categoryTitle = "LUA_MENU/RULES_PLAYER_OPTIONS",
		tabName = "LUA_MENU/RULES_PLAYER_OPTIONS",
		optionsFeeder = var_0_22
	},
	[var_0_3.Game] = {
		categoryTitle = "LUA_MENU_MP/RULES_GAME_OPTIONS",
		tabName = "LUA_MENU/GAME_RULES",
		optionsFeeder = var_0_21
	},
	[var_0_3.ModeAdvanced] = {
		categoryTitle = "LUA_MENU_MP/RULES_MODE_ADVANCED_OPTIONS",
		tabName = "LUA_MENU_MP/RULES_MODE_ADVANCED_OPTIONS",
		optionsFeeder = var_0_19
	},
	[var_0_3.Draft] = {
		categoryTitle = "LUA_MENU_MP/RULES_DRAFT_OPTIONS",
		tabName = "LUA_MENU_MP/RULES_DRAFT_OPTIONS",
		optionsFeeder = var_0_20
	}
}

local function var_0_26()
	if var_0_25 then
		for iter_76_0 = 0, #var_0_25 do
			local var_76_0 = var_0_25[iter_76_0].options

			if var_76_0 then
				for iter_76_1 = 1, #var_76_0 do
					local var_76_1 = var_76_0[iter_76_1]

					if var_76_1 then
						var_76_1:DisableButton()
					end
				end
			end
		end
	end
end

local function var_0_27(arg_77_0, arg_77_1, arg_77_2)
	return #var_0_25[arg_77_2].optionsFeeder(arg_77_0, arg_77_1) > 0
end

local function var_0_28(arg_78_0, arg_78_1)
	return function(arg_79_0, arg_79_1)
		if arg_79_1 then
			if var_0_25[arg_79_0].optionsFeeder(arg_78_0, arg_78_1, arg_79_1) then
				ACTIONS.AnimateSequence(arg_78_0.Tabs:GetTabAtIndex(arg_78_0._currentTabIndex), "Changed")
			else
				ACTIONS.AnimateSequence(arg_78_0.Tabs:GetTabAtIndex(arg_78_0._currentTabIndex), "NotChanged")
			end
		else
			local var_79_0 = var_0_25[arg_79_0].optionsFeeder(arg_78_0, arg_78_1, arg_79_1)

			var_0_25[arg_79_0].options = var_79_0

			if arg_78_0.currentOptionButtons and #arg_78_0.currentOptionButtons > 0 then
				for iter_79_0, iter_79_1 in pairs(arg_78_0.currentOptionButtons) do
					arg_78_0.GameSetupCategoryOptions.optionsGrid:RemoveElement(iter_79_1)
				end
			end

			arg_78_0.currentOptionButtons = {}

			local var_79_1 = false

			for iter_79_2, iter_79_3 in pairs(var_79_0) do
				iter_79_3.optionIndex = iter_79_2

				table.insert(arg_78_0.currentOptionButtons, iter_79_3)
				arg_78_0.GameSetupCategoryOptions.optionsGrid:AddElement(iter_79_3)

				var_79_1 = var_79_1 or not iter_79_3._isDefault
			end

			if var_79_1 then
				ACTIONS.AnimateSequence(arg_78_0.Tabs:GetTabAtIndex(arg_78_0._currentTabIndex), "Changed")
			else
				ACTIONS.AnimateSequence(arg_78_0.Tabs:GetTabAtIndex(arg_78_0._currentTabIndex), "NotChanged")
			end

			ACTIONS.GainFocus(arg_78_0, "GameSetupCategoryOptions", arg_78_1)
		end
	end
end

function PostLoadFunc(arg_80_0, arg_80_1, arg_80_2)
	assert(arg_80_0.GameSetupCategoryOptions)
	assert(arg_80_0.MenuTitle)
	assert(arg_80_0.Tabs)
	assert(arg_80_0.bindButton)
	assert(arg_80_0.ModeDetails)

	arg_80_0.GameOptionsCategories = var_0_3
	arg_80_0.CategoryOptionsUpdate = var_0_28(arg_80_0, arg_80_1)
	arg_80_0.RefreshButtonEnableState = var_0_26

	local var_80_0 = Engine.JCBDICCAH(DataSources.frontEnd.lobby.gameTypeName:GetValue())

	arg_80_0.MenuTitle:SetMaxRightEdge(765 * _1080p)
	arg_80_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/GAME_RULES_TITLE", var_80_0))
	arg_80_0.ModeDetails:ShowIcon(false)

	if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "arena" then
		local var_80_1 = MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.ArenaData, Lobby.MatchRulesMembers.ArenaLoadouts)

		if var_80_1 == 3 or var_80_1 == 14 then
			local var_80_2 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
			local var_80_3 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_80_2, CSV.mpMapTable.cols.arenaMenuMinimap)

			if var_80_3 ~= "" then
				arg_80_0.ArenaPickupMinimap.MiniMap:setImage(RegisterMaterial(var_80_3))
				ACTIONS.AnimateSequence(arg_80_0, "ShowMiniMap")
			end
		end
	end

	local var_80_4 = {}
	local var_80_5 = {
		var_0_3.Game,
		var_0_3.ModeAdvanced,
		var_0_3.Player,
		var_0_3.Team,
		var_0_3.Gameplay
	}

	for iter_80_0, iter_80_1 in ipairs(var_80_5) do
		if var_0_27(arg_80_0, arg_80_1, iter_80_1) then
			table.insert(var_80_4, {
				name = Engine.CBBHFCGDIC(var_0_25[iter_80_1].tabName),
				id = iter_80_1
			})
		end
	end

	arg_80_0.tabNamesAndIDs = var_80_4

	local var_80_6 = {}

	for iter_80_2, iter_80_3 in ipairs(var_80_4) do
		table.insert(var_80_6, {
			name = iter_80_3.name,
			focusFunction = function(arg_81_0, arg_81_1, arg_81_2)
				arg_80_0._currentTabIndex = arg_81_2 + 1

				arg_80_0.CategoryOptionsUpdate(var_80_4[arg_81_2 + 1].id, false)
			end
		})
	end

	arg_80_0.Tabs:SetTabs(var_80_6)

	for iter_80_4, iter_80_5 in ipairs(var_80_4) do
		arg_80_0._currentTabIndex = iter_80_4

		arg_80_0.CategoryOptionsUpdate(var_80_4[iter_80_4].id, true)
	end

	arg_80_0._currentTabIndex = 1

	if not Engine.HDGDBCJFG() then
		arg_80_0.CategoryOptionsUpdate(var_0_3.Game, false)
	end

	arg_80_0.bindButton:addEventHandler("button_alt1", function(arg_82_0, arg_82_1)
		if MLG.AreMLGRulesEnabled() then
			LUI.FlowManager.RequestPopupMenu(nil, "PopupUnlockGameOptions", true, arg_80_1, false, {
				gameOptionsMenu = arg_80_0
			})
		else
			LUI.FlowManager.RequestPopupMenu(nil, "PopupResetGameOptions", true, arg_80_1, false, {
				gameOptionsMenu = arg_80_0
			})
		end
	end)
	arg_80_0.bindButton:addEventHandler("button_start", function(arg_83_0, arg_83_1)
		if not MLG.AreMLGRulesEnabled() then
			local function var_83_0()
				local var_84_0 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.COUNT)
				local var_84_1 = MatchRules.EABFIDADDB()
				local var_84_2

				if var_84_0 == nil then
					var_84_2 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.ERROR_CODE) or -1
					var_84_0 = 0
				end

				if var_84_0 < var_84_1 then
					LUI.FlowManager.RequestPopupMenu(nil, "RecipeCreatePopup", true, arg_80_1, false, {
						saveSlot = var_84_0
					})

					if var_84_2 ~= nil and var_84_2 ~= -1 then
						LUI.FlowManager.RequestPopupMenu(arg_80_0, "CustomModeDataErrorPopup", true, arg_80_1, false, MP.MatchRulesErrorCodeMessage[var_84_2])
					end
				else
					LUI.FlowManager.RequestAddMenu("RecipeDeleteMenu", true, arg_80_1, false)
				end
			end

			local var_83_1 = Dvar.CFHDGABACF("NPSTLPMPSS")

			if var_83_1 == -1 then
				var_83_0()
			else
				local function var_83_2()
					MatchRules.JJFCFBDAA(var_83_1)
				end

				local var_83_3 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, var_83_1, MP.MatchRulesSaveHeaderLookup.NAME)

				LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_80_1, false, {
					yesAction = var_83_2,
					noAction = var_83_0,
					message = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_OVERWRITE", Engine.JCBDICCAH(var_83_3))
				})
			end
		end
	end)

	if MLG.AreMLGRulesEnabled() then
		arg_80_0:AddButtonHelperTextToElement(arg_80_0.HelperBar, {
			clickable = true,
			priority = 2,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_GAME_RULES")
		})
	else
		arg_80_0:AddButtonHelperTextToElement(arg_80_0.HelperBar, {
			clickable = true,
			priority = 2,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SET_DEFAULT_CONTROLS")
		})
		arg_80_0:AddButtonHelperTextToElement(arg_80_0.HelperBar, {
			clickable = true,
			priority = 3,
			side = "left",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/CREATE_CUSTOM_MODE")
		})
	end

	if not IsSystemLink() then
		local var_80_7 = LUI.UITimer.new({
			interval = 500,
			event = "update_lobby"
		})

		var_80_7.id = "lobbyTimer"

		arg_80_0:addElement(var_80_7)
		arg_80_0:registerEventHandler("update_lobby", function(arg_86_0, arg_86_1)
			local var_86_0 = {
				forceSuperfactionBasedOnTeam = true,
				widget = arg_80_0
			}

			Lobby.UpdateClientCharacters(arg_80_1, var_86_0)
		end)
	end

	assert(arg_80_0.TabBacker)

	local function var_80_8()
		arg_80_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 160)
	end

	arg_80_0:addAndCallEventHandler("onVideoChange", var_80_8)
	LAYOUT.AddAspectRatioFadeFrame(arg_80_0, arg_80_1)
	assert(arg_80_0.Darken)
	ACTIONS.ScaleFullscreen(arg_80_0.Darken)
end

function GameSetupOptionsMenu(arg_88_0, arg_88_1)
	local var_88_0 = LUI.UIElement.new()

	var_88_0.id = "GameSetupOptionsMenu"
	var_88_0._animationSets = var_88_0._animationSets or {}
	var_88_0._sequences = var_88_0._sequences or {}

	local var_88_1 = arg_88_1 and arg_88_1.controllerIndex

	if not var_88_1 and not Engine.DDJFBBJAIG() then
		var_88_1 = var_88_0:getRootController()
	end

	assert(var_88_1)

	var_88_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_88_1
	})
	var_88_0.HelperBar.id = "HelperBar"

	var_88_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_88_0.HelperBar:setPriority(10)
	var_88_0:addElement(var_88_0.HelperBar)

	local var_88_2 = var_88_0
	local var_88_3
	local var_88_4 = {
		worldBlur = 1,
		controllerIndex = var_88_1
	}
	local var_88_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_88_4)

	var_88_5.id = "WorldBlur"

	var_88_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_88_0:addElement(var_88_5)

	var_88_0.WorldBlur = var_88_5

	local var_88_6
	local var_88_7 = LUI.UIImage.new()

	var_88_7.id = "Darken"

	var_88_7:SetRGBFromInt(0, 0)
	var_88_7:SetAlpha(0.5, 0)
	var_88_0:addElement(var_88_7)

	var_88_0.Darken = var_88_7

	local var_88_8
	local var_88_9 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_88_1
	})

	var_88_9.id = "Cinematic"

	var_88_0:addElement(var_88_9)

	var_88_0.Cinematic = var_88_9

	local var_88_10
	local var_88_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_88_1
	})

	var_88_11.id = "TabBacker"

	var_88_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_88_0:addElement(var_88_11)

	var_88_0.TabBacker = var_88_11

	local var_88_12
	local var_88_13 = MenuBuilder.BuildRegisteredType("GameSetupCategoryOptions", {
		controllerIndex = var_88_1
	})

	var_88_13.id = "GameSetupCategoryOptions"

	var_88_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 753, _1080p * 216, _1080p * 756)
	var_88_0:addElement(var_88_13)

	var_88_0.GameSetupCategoryOptions = var_88_13

	local var_88_14
	local var_88_15 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_88_1
	})

	var_88_15.id = "MenuTitle"

	var_88_15.MenuTitle:setText(ToUpperCase(""), 0)
	var_88_15.Line:SetLeft(0, 0)
	var_88_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_88_0:addElement(var_88_15)

	var_88_0.MenuTitle = var_88_15

	local var_88_16

	if CONDITIONS.InFrontendPublicMP(var_88_0) then
		local var_88_17 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_88_1
		})

		var_88_17.id = "MPPlayerDetails"

		var_88_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_88_0:addElement(var_88_17)

		var_88_0.MPPlayerDetails = var_88_17
	end

	local var_88_18
	local var_88_19 = MenuBuilder.BuildRegisteredType("ModeDetails", {
		controllerIndex = var_88_1
	})

	var_88_19.id = "ModeDetails"

	var_88_19.GenericItemInfo.BodyText:setText("", 0)
	var_88_19.GenericItemInfo.HeaderText:setText(ToUpperCase(""), 0)
	var_88_19.Icon:setImage(RegisterMaterial("icon_mp_mode_tdm"), 0)
	var_88_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 815, _1080p * 1635, _1080p * 216, _1080p * 416)
	var_88_0:addElement(var_88_19)

	var_88_0.ModeDetails = var_88_19

	local var_88_20
	local var_88_21 = MenuBuilder.BuildRegisteredType("ArenaPickupMiniMap", {
		controllerIndex = var_88_1
	})

	var_88_21.id = "ArenaPickupMinimap"

	var_88_21:SetAlpha(0, 0)
	var_88_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 662, _1080p * 1888, _1080p * 77, _1080p * 1309)
	var_88_0:addElement(var_88_21)

	var_88_0.ArenaPickupMinimap = var_88_21

	local var_88_22
	local var_88_23 = LUI.UIStyledText.new()

	var_88_23.id = "PickupLabel"

	var_88_23:SetAlpha(0, 0)
	var_88_23:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/ARENA_PICKUP_LABEL"), 0)
	var_88_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_88_23:SetAlignment(LUI.Alignment.Left)
	var_88_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_88_23:SetShadowMinDistance(-0.2, 0)
	var_88_23:SetShadowMaxDistance(0.2, 0)
	var_88_23:SetShadowUOffset(-0.001, 0)
	var_88_23:SetShadowVOffset(-0.001, 0)
	var_88_23:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_88_23:SetDecodeUseSystemTime(false)
	var_88_23:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 883, _1080p * -497, _1080p * 425, _1080p * 443)
	var_88_0:addElement(var_88_23)

	var_88_0.PickupLabel = var_88_23

	local var_88_24
	local var_88_25 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_88_1
			})
		end,
		controllerIndex = var_88_1
	}
	local var_88_26 = LUI.TabManager.new(var_88_25)

	var_88_26.id = "Tabs"

	var_88_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 91, _1080p * 991, _1080p * 108, _1080p * 160)
	var_88_0:addElement(var_88_26)

	var_88_0.Tabs = var_88_26

	local var_88_27
	local var_88_28 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_88_1
	})

	var_88_28.id = "LobbyMembersFooter"

	var_88_28:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_88_0:addElement(var_88_28)

	var_88_0.LobbyMembersFooter = var_88_28

	local function var_88_29()
		return
	end

	var_88_0._sequences.DefaultSequence = var_88_29

	local function var_88_30()
		return
	end

	var_88_0._sequences.Update = var_88_30

	local var_88_31
	local var_88_32 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 164
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 364
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 815
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1635
		}
	}

	var_88_19:RegisterAnimationSequence("ShowMiniMap", var_88_32)

	local var_88_33 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 815
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1724
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 228
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1129
		},
		{
			value = 0.85,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Glitch_Amount
		}
	}

	var_88_21:RegisterAnimationSequence("ShowMiniMap", var_88_33)

	local var_88_34 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 849
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -210
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 374
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 400
		}
	}

	var_88_23:RegisterAnimationSequence("ShowMiniMap", var_88_34)

	local function var_88_35()
		var_88_19:AnimateSequence("ShowMiniMap")
		var_88_21:AnimateSequence("ShowMiniMap")
		var_88_23:AnimateSequence("ShowMiniMap")
	end

	var_88_0._sequences.ShowMiniMap = var_88_35

	local var_88_36
	local var_88_37 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 216
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 416
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 815
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1635
		}
	}

	var_88_19:RegisterAnimationSequence("HideMiniMap", var_88_37)

	local var_88_38 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Glitch_Amount
		}
	}

	var_88_21:RegisterAnimationSequence("HideMiniMap", var_88_38)

	local var_88_39 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_88_23:RegisterAnimationSequence("HideMiniMap", var_88_39)

	local function var_88_40()
		var_88_19:AnimateSequence("HideMiniMap")
		var_88_21:AnimateSequence("HideMiniMap")
		var_88_23:AnimateSequence("HideMiniMap")
	end

	var_88_0._sequences.HideMiniMap = var_88_40

	var_88_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_88_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_88_41 = LUI.UIBindButton.new()

	var_88_41.id = "selfBindButton"

	var_88_0:addElement(var_88_41)

	var_88_0.bindButton = var_88_41

	var_88_0.bindButton:addEventHandler("button_secondary", function(arg_94_0, arg_94_1)
		if not arg_94_1.controller then
			local var_94_0 = var_88_1
		end

		ACTIONS.LeaveMenu(var_88_0)
	end)
	PostLoadFunc(var_88_0, var_88_1, arg_88_1)

	return var_88_0
end

MenuBuilder.registerType("GameSetupOptionsMenu", GameSetupOptionsMenu)
LockTable(_M)
