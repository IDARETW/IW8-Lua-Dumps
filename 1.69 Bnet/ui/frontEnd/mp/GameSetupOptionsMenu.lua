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
	LuaMenuMPRulesExfilActiveTimer = "LUA_MENU_MP/RULES_EXFIL_ACTIVE_TIMER",
	LuaMenuMPRulesLastStandHealth = "LUA_MENU_MP/RULES_LAST_STAND_HEALTH",
	LuaMenuMPRulesShowEnemyCarrier = "LUA_MENU_MP/RULES_SHOW_ENEMY_CARRIER",
	LuaMenuMPRulesActivationDelayBase = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_BASE",
	LuaMenuMPRulesRushTimerAmount = "LUA_MENU_MP/RULES_RUSH_TIMER_AMOUNT",
	LuaMenuMPRulesRoundRetainStreaks = "LUA_MENU_MP/RULES_ROUND_RETAIN_STREAKS",
	LuaMenuMPRulesPersBombTimer = "LUA_MENU_MP/RULES_PERS_BOMB_TIMER",
	LuaMenuMPRulesScoreLimit = "LUA_MENU_MP/RULES_SCORE_LIMIT",
	LuaMenuMPRulesHoldDurationCenter = "LUA_MENU_MP/RULES_HOLD_DURATION_CENTER",
	LuaMenuMPRulesRoundSwitch = "LUA_MENU_MP/RULES_ROUND_SWITCH",
	LuaMenuMPRulesGoalProtection = "LUA_MENU_MP/RULES_GOAL_PROTECTION",
	LuaMenuMPRulesWeaponTier2 = "LUA_MENU_MP/RULES_WEAPONTIER2",
	LuaMenuMPRulesInfilSkip = "LUA_MENU_MP/RULES_INFIL_SKIP",
	LuaMenuMPRulesZoneCaptureTime = "LUA_MENU_MP/RULES_ZONE_CAPTURE_TIME",
	LuaMenuMPRulesArenaAttachments = "LUA_MENU_MP/RULES_ARENA_ATTACHMENTS",
	LuaMenuMPRulesNumEndGame = "LUA_MENU_MP/RULES_NUM_END_GAME",
	LuaMenuMPRulesTeamAssignmentAllowed = "LUA_MENU_MP/RULES_TEAM_ASSIGNMENT",
	LuaMenuMPRulesScoreCarry = "LUA_MENU_MP/RULES_SCORE_CARRY",
	LuaMenuMPRules3rdSpectating = "LUA_MENU_MP/RULES_3RDPERSON_SPECTATING",
	LuaMenuMPRulesWeaponTier6 = "LUA_MENU_MP/RULES_WEAPONTIER6",
	LuaMenuMPRulesWeaponTier5 = "LUA_MENU_MP/RULES_WEAPONTIER5",
	LuaMenuMPRulesFlagsRequiredToScore = "LUA_MENU_MP/RULES_FLAGS_REQUIRED_TO_SCORE",
	LuaMenuMPRulesCaptureType = "LUA_MENU_MP/RULES_CAPTURE_TYPE",
	LuaMenuMPRulesSetback = "LUA_MENU_MP/RULES_SETBACKS",
	LuaMenuMPRulesOneShotKill = "LUA_MENU_MP/RULES_OIC_OSK",
	LuaMenuMPRulesEnableVariantDZ = "LUA_MENU_MP/RULES_ENABLE_VARIANT_DZ",
	LuaMenuMPRulesTacticalMode = "LUA_MENU_MP/RULES_TACTICAL_MODE",
	LuaMenuMPRulesCODCastingEnabled = "CODCASTER/CAPS",
	LuaMenuMPRulesPossessionResetCondition = "LUA_MENU_MP/RULES_POSSESSION_RESET_CONDITION",
	LuaMenuMPRulesPointsPerDeny = "LUA_MENU_MP/RULES_POINTS_PER_DENY",
	LuaMenuMPRulesBankDisableTags = "LUA_MENU_MP/RULES_BANK_DISABLE_TAGS",
	LuaMenuMPRulesAON = "LUA_MENU_MP/RULES_AON",
	LuaMenuMPRulesGoalMoveTimer = "LUA_MENU_MP/RULES_GOAL_MOVE_TIMER",
	LuaMenuMPRulesPointsPerKill = "LUA_MENU_MP/RULES_POINTS_PER_KILL",
	LuaMenuMPRulesBountyTimer = "LUA_MENU_MP/RULES_BOUNTY_TIMER",
	LuaMenuMPRulesEnablePing = "LUA_MENU_MP/RULES_ENABLE_PING",
	LuaMenuMPRulesSurvivorPrimaryWeapon = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_PRIMARY_WEAPON",
	LuaMenuMPRulesSurvivorScorePerTick = "LUA_MENU_MP/RULES_SURVIVOR_SCORE_PER_TICK",
	LuaMenuMPRulesBankTime = "LUA_MENU_MP/RULES_BANK_TIME",
	LuaMenuMPRulesPPKFlagCarrier = "LUA_MENU_MP/RULES_TDEF_PPK_FLAG_CARRIER",
	LuaMenuMPRulesFFPunishLimit = "LUA_MENU_MP/RULES_FF_PUNISH_LIMIT",
	LuaMenuMPRulesInfectedPrimaryWeapon = "LUA_MENU_MP/RULES_INFECT_INFECTED_PRIMARY_WEAPON",
	LuaMenuMPRulesWinRule = "LUA_MENU_MP/RULES_WIN_RULE",
	LuaMenuMPRulesSurvivorTactical = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_TACTICAL",
	LuaMenuMPRulesSurvivorSuperTwo = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SUPER_TWO",
	LuaMenuMPRulesEnableInfectedTracker = "LUA_MENU_MP/RULES_ENABLE_TRACKER",
	LuaMenuMPRulesSharedRushTimer = "LUA_MENU_MP/RULES_SHARED_RUSH_TIMER",
	LuaMenuMPRulesLadderIndex = "LUA_MENU_MP/RULES_LADDER",
	LuaMenuMPRulesKillcamType = "LUA_MENU_MP/RULES_KILLCAM_TYPE",
	LuaMenuMPRulesTeamSize = "LUA_MENU_MP/RULES_TEAM_SIZE",
	LuaMenuMPRulesPostGameExfilWeapon = "LUA_MENU_MP/RULES_POST_GAME_EXFIL_WEAPON",
	LuaMenuMPRulesDisableMount = "LUA_MENU_MP/RULES_DISABLE_MOUNT",
	LuaMenuMPRulesRadarPingTime = "LUA_MENU_MP/RULES_RADAR_PING_TIME",
	LuaMenuMPRulesSpectating = "LUA_MENU_MP/RULES_SPECTATING",
	LuaMenuMPRulesBombTimer = "LUA_MENU_MP/RULES_BOMB_TIMER",
	LuaMenuMPRulesZoneLifetime = "LUA_MENU_MP/RULES_ZONE_LIFETIME",
	LuaMenuMPRulesHeadshotsOnly = "LUA_MENU_MP/RULES_HEADSHOTS_ONLY",
	LuaMenuMPRulesRushTimer = "LUA_MENU_MP/RULES_RUSH_TIMER",
	LuaMenuMPRulesHQCaptureTime = "LUA_MENU_MP/RULES_HQ_CAPTURE_TIME",
	LuaMenuMPRulesJuggSpeed = "LUA_MENU_MP/RULES_JUGG_SPEED",
	LuaMenuMPRulesWinByTwoEnabled = "LUA_MENU_MP/RULES_WIN_BY_TWO",
	LuaMenuMPRulesRadarAlwaysOn = "LUA_MENU_MP/RULES_RADAR_ALWAYS_ON",
	LuaMenuMPRulesReturnTime = "LUA_MENU_MP/RULES_RETURN_TIME",
	LuaMenuMPRulesSatelliteCount = "LUA_MENU_MP/RULES_SATELLITE_COUNT",
	LuaMenuMPRulesMaxHealth = "LUA_MENU_MP/RULES_MAX_HEALTH",
	LuaMenuMPRulesBrInfilC130 = "LUA_MENU_MP/RULES_BR_INFIL_C130",
	LuaMenuMPRulesLastStandTimer = "LUA_MENU_MP/RULES_LAST_STAND_BLEEDOUT_TIMER",
	LuaMenuMPRulesRespawnDelay = "LUA_MENU_MP/RULES_RESPAWN_DELAY",
	LuaMenuMPRulesInitialAmmoCount = "LUA_MENU_MP/RULES_OIC_INITIAL_AMMO",
	LuaMenuMPRulesVampirism = "LUA_MENU_MP/RULES_VAMPIRISM",
	LuaMenuMPRulesPointsPerFlag = "LUA_MENU_MP/RULES_POINTS_PER_FLAG",
	LuaMenuMPRulesInfectedSuper = "LUA_MENU_MP/RULES_INFECT_INFECTED_SUPER",
	LuaMenuMPRulesInfectedSecondaryWeapon = "LUA_MENU_MP/RULES_INFECT_INFECTED_SECONDARY_WEAPON",
	LuaMenuMPRulesSimultaneousDeath = "LUA_MENU_MP/RULES_SIMUL_DEATH",
	LuaMenuMPRulesRoundStartTime = "LUA_MENU_MP/RULES_MATCH_START_TIME_ROUND",
	LuaMenuMPRulesEnableMiniMap = "LUA_MENU_MP/RULES_ENABLE_MINIMAP",
	LuaMenuMPRulesBankDisable = "LUA_MENU_MP/RULES_BANK_DISABLE",
	LuaMenuMPRulesCarrierBonusScore = "LUA_MENU_MP/RULES_CARRIER_BONUS_SCORE",
	LuaMenuMPRulesRoundStartReadyUp = "LUA_MENU_MP/RULES_ROUND_START_READY_UP",
	LuaMenuMPRulesDelayPlayer = "LUA_MENU_MP/RULES_DELAY_PLAYER",
	LuaMenuMPRulesRadarHideShots = "LUA_MENU_MP/RULES_RADAR_HIDE_SHOTS",
	LuaMenuMPRulesEscapeTimer = "LUA_MENU_MP/RULES_ESCAPE_TIMER",
	LuaMenuMPRulesInfectedSuperTwo = "LUA_MENU_MP/RULES_INFECT_INFECTED_SUPER_TWO",
	LuaMenuMPRulesHQAdditiveScoring = "LUA_MENU_MP/RULES_HQ_ADDITIVE_SCORING",
	LuaMenuMPRulesZoneTime = "LUA_MENU_MP/RULES_ZONE_TIME",
	LuaMenuMPRulesPauseTime = "LUA_MENU_MP/RULES_PAUSE_TIME",
	LuaMenuMPRulesCaptureDelayPlayer = "LUA_MENU_MP/RULES_CAPTURE_DELAY_PLAYER",
	LuaMenuMPRulesEquipmentMSProtect = "LUA_MENU_MP/RULES_MATCH_START_LETHAL_PROTECT",
	LuaMenuMPRulesRandomLocationOrder = "LUA_MENU_MP/RULES_RANDOM_LOCATION_ORDER",
	LuaMenuMPRulesPlantTime = "LUA_MENU_MP/RULES_PLANT_TIME",
	LuaMenuMPRulesReviveUseWeapon = "LUA_MENU_MP/RULES_REVIVE_USE_WEAPON",
	LuaMenuMPRulesJuggCaptureTime = "LUA_MENU_MP/RULES_JUGG_CAP_TIME",
	LuaMenuMPRulesOICWeapon = "LUA_MENU_MP/RULES_OIC_WEAPON",
	LuaMenuMPRulesJuggHealth = "LUA_MENU_MP/RULES_JUGG_HEALTH",
	LuaMenuMPRulesCasualScoreStreaks = "LUA_MENU_MP/RULES_CASUAL_SCORE_STREAKS",
	LuaMenuMPRulesSpawnDelay = "LUA_MENU_MP/RULES_SPAWN_DELAY",
	LuaMenuMPRulesCrankedTimer = "LUA_MENU_MP/RULES_CRANKED_TIMER",
	LuaMenuMPRulesStartWeapon = "LUA_MENU_MP/RULES_START_WEAPON",
	LuaMenuMPRulesNumInitialInfected = "LUA_MENU_MP/RULES_INFECT_NUM_INITIAL",
	LuaMenuMPRulesWinByTwoMaxRounds = "LUA_MENU_MP/RULES_WIN_BY_TWO_MAX_ROUNDS",
	LuaMenuMPRulesExtraTime = "LUA_MENU_MP/RULES_EXTRA_TIME",
	LuaMenuMPRulesBrInfilConvoy = "LUA_MENU_MP/RULES_BR_INFIL_CONVOY",
	LuaMenuMPRulesRoundScoreLimit = "LUA_MENU_MP/RULES_ROUND_SCORE_LIMIT",
	LuaMenuMPRulesMatchStartTime = "LUA_MENU_MP/RULES_MATCH_START_TIME_FIRST",
	LuaMenuMPRulesDropTime = "LUA_MENU_MP/RULES_DROP_TIME",
	LuaMenuMPRulesDefuseTime = "LUA_MENU_MP/RULES_DEFUSE_TIME",
	LuaMenuMPRulesObjScalar = "LUA_MENU_MP/RULES_OBJ_SCALAR",
	LuaMenuMPRulesFlagActivationDelay = "LUA_MENU_MP/RULES_FLAG_ACTIVATION_DELAY",
	LuaMenuMPRulesCaptureDurationBase = "LUA_MENU_MP/RULES_CAPTURE_DURATION_BASE",
	LuaMenuMPRulesHardcore = "LUA_MENU_MP/RULES_HARDCORE",
	LuaMenuMPRulesCMDRules = "LUA_MENU_MP/RULES_CMD_RULES",
	LuaMenuMPRulesResetProgress = "LUA_MENU_MP/RULES_RESET_PROGRESS",
	LuaMenuMPRulesPracticeRound = "LUA_MENU_MP/RULES_PRACTICE_ROUND",
	LuaMenuMPRulesAllowInputSwap = "LUA_MENU_MP/RULES_ALLOW_INPUT_SWAP",
	LuaMenuMPRulesAllowSupers = "LUA_MENU_MP/RULES_ALLOW_SUPER",
	LuaMenuMPRulesActivationDelayHalf = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_HALF",
	LuaMenuMPRulesCaptureDurationHalf = "LUA_MENU_MP/RULES_CAPTURE_DURATION_HALF",
	LuaMenuMPRulesDisableBattleChatter = "LUA_MENU_MP/RULES_DISABLE_BATTLECHATTER",
	LuaMenuMPRulesDisableAnnouncer = "LUA_MENU_MP/RULES_DISABLE_ANNOUNCER",
	LuaMenuMPRulesLoadoutChangeRound = "LUA_MENU_MP/RULES_ARENA_LOADOUT_CHANGE_ROUND",
	LuaMenuMPRulesSpawnProtectionTimer = "LUA_MENU_MP/RULES_SPAWN_PROTECTION_TIMER",
	LuaMenuMPRulesInfectStreakBonus = "LUA_MENU_MP/RULES_INFECT_STREAK_BONUS",
	LuaMenuMPRulesTeamTimer = "LUA_MENU_MP/RULES_TEAM_TIMER",
	LuaMenuMPRulesKillRewardAmmoCount = "LUA_MENU_MP/RULES_OIC_KILL_AMMO",
	LuaMenuMPRulesArenaBlastShieldMod = "LUA_MENU_MP/RULES_ARENA_BS_MOD",
	LuaMenuMPRulesHQPauseTime = "LUA_MENU_MP/RULES_HQ_PAUSE_TIME",
	LuaMenuMPRulesPPKTeamNoFlag = "LUA_MENU_MP/RULES_TDEF_PPK_NO_FLAG",
	LuaMenuMPRulesCaptureDuration = "LUA_MENU_MP/RULES_CAPTURE_DURATION",
	LuaMenuMPRulesKillstreakConfirmed = "LUA_MENU_MP/RULES_KILLSTREAK_CONFIRMED",
	LuaMenuMPRulesArenaLoadouts = "LUA_MENU_MP/RULES_ARENA_LOADOUTS",
	LuaMenuMPRulesJuggLifetime = "LUA_MENU_MP/RULES_JUGG_LIFETIME",
	LuaMenuMPRulesGunGameWeapons = "LUA_MENU_MP/RULES_GUN_GAME_WEAPONS",
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
	LuaMenuMPRulesGiveTKOnTISpawn = "LUA_MENU_MP/RULES_INFECT_GIVE_LETHAL_ON_TI",
	LuaMenuMPRulesBrInfilHeli = "LUA_MENU_MP/RULES_BR_INFIL_HELI",
	LuaMenuMPRulesIdleResetTime = "LUA_MENU_MP/RULES_IDLE_RESET_TIME",
	LuaMenuMPRulesArenaBlastShieldClamp = "LUA_MENU_MP/RULES_ARENA_BS_CLAMP",
	LuaMenuMPRulesTargetPlayerCycle = "LUA_MENU_MP/RULES_TARGET_PLAYER_CYCLE",
	LuaMenuMPRulesRoundTimeLimit = "LUA_MENU_MP/RULES_ROUND_TIME_LIMIT",
	LuaMenuMPRulesGoalEnableTimer = "LUA_MENU_MP/RULES_GOAL_ENABLE_TIMER",
	LuaMenuMPRulesHQActivationDelay = "LUA_MENU_MP/RULES_HQ_ACTIVATION_DELAY",
	LuaMenuMPRulesSilentPlant = "LUA_MENU_MP/RULES_SILENT_PLANT",
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
	LuaMenuMPRulesScoringTime = "LUA_MENU_MP/RULES_SCORE_TIME",
	LuaMenuMPRulesRefreshTeamTimerOnReset = "LUA_MENU_MP_RULES_REFRESH_TEAM_TIMER",
	LuaMenuMPRulesInfectedInitialPrimaryWeapon = "LUA_MENU_MP/RULES_INFECT_INITIAL_PRIMARY_WEAPON",
	LuaMenuMPRulesSurvivorScoreTime = "LUA_MENU_MP/RULES_SURVIVOR_SCORE_TIME",
	LuaMenuMPRulesInfectedLethal = "LUA_MENU_MP/RULES_INFECT_INFECTED_LETHAL",
	LuaMenuMPRulesSuicideSpawnDelay = "LUA_MENU_MP/RULES_SUICIDE_SPAWN_DELAY",
	LuaMenuMPRulesHQSelectionDelay = "LUA_MENU_MP/RULES_HQ_SELECTION_DELAY",
	LuaMenuMPRulesPerks = "LUA_MENU_MP/RULES_PERKS",
	LuaMenuMPRulesInfectExtraTimePerKill = "LUA_MENU_MP/RULES_INFECT_EXTRA_TIME_PER_KILL",
	LuaMenuMPRulesArenaObjModifier = "LUA_MENU_MP/RULES_OBJ_MODIFIER",
	LuaMenuMPRulesPickupTime = "LUA_MENU_MP/RULES_PICKUP_TIME",
	LuaMenuMPRulesHQLifetime = "LUA_MENU_MP/RULES_HQ_LIFETIME",
	LuaMenuMPRulesArenaSwitchSpawns = "LUA_MENU_MP/RULES_ARENA_SWITCH_SPAWNS",
	LuaMenuMPRulesWrapKillstreaks = "LUA_MENU_MP/RULES_WRAP_KILLSTREAKS",
	LuaMenuMPRulesTimeLimit = "LUA_MENU_MP/RULES_TIME_LIMIT",
	LuaMenuMPRulesSurvivorSuper = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SUPER",
	LuaMenuMPRulesPointsPerJuggOnJuggKill = "LUA_MENU_MP/RULES_PPK_J_ON_J",
	LuaMenuMPRulesArenaSuper = "LUA_MENU_MP/RULES_ARENA_SUPER",
	LuaMenuMPRulesBrGulag = "LUA_MENU_MP/RULES_BR_GULAG",
	LuaMenuMPRulesNumberOfLives = "LUA_MENU_MP/RULES_NUMBER_OF_LIVES",
	LuaMenuMPRulesPreCap = "LUA_MENU_MP/RULES_PRE_CAP",
	LuaMenuMPRulesHVTCaptureValue = "LUA_MENU_MP/RULES_HVT_CAPTURE_VALUE",
	LuaMenuMPRulesSurvivorSecondaryWeapon = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SECONDARY_WEAPON",
	LuaMenuMPRulesExtraTimeBonus = "LUA_MENU_MP/RULES_TIME_EXTENSION",
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
	LuaMenuMPRulesWeaponTier8 = "LUA_MENU_MP/RULES_WEAPONTIER8",
	LuaMenuMPRulesWinLimit = "LUA_MENU_MP/RULES_WIN_LIMIT",
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
	LuaMenuMPRulesJuggCaptureTimeDesc = "LUA_MENU_MP/RULES_JUGG_CAP_TIME_DESC",
	LuaMenuMPRulesShowTargetTimeDesc = "LUA_MENU_MP/RULES_SHOW_TARGET_TIME_DESC",
	LuaMenuMPRulesDogTagsDesc = "LUA_MENU_MP/RULES_DOG_TAGS_DESC",
	LuaMenuMPRulesKillsPerWeaponDesc = "LUA_MENU_MP/RULES_KILLS_PER_WEAPON_DESC",
	LuaMenuMPRulesJuggSpawnBehaviorDesc = "LUA_MENU_MP/RULES_JUGG_SPAWN_BEHAVIOR_DESC",
	LuaMenuMPRulesCompassHideShotsDesc = "LUA_MENU_MP/RULES_COMPASS_HIDE_SHOTS_DESC",
	LuaMenuMPRulesInfilSkipDesc = "LUA_MENU_MP/RULES_INFIL_SKIP_DESC",
	LuaMenuMPRulesHoldDurationBaseDesc = "LUA_MENU_MP/RULES_HOLD_DURATION_BASE_DESC",
	LuaMenuMPRulesJuggLifetimeEnabledDesc = "LUA_MENU_MP/RULES_JUGG_LIFETIME_ENABLED_DESC",
	LuaMenuMPRulesCaptureDurationHalfDesc = "LUA_MENU_MP/RULES_CAPTURE_DURATION_HALF_DESC",
	LuaMenuMPRulesActivationDelayHalfDesc = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_HALF_DESC",
	LuaMenuMPRulesEnemyDeathLocDesc = "LUA_MENU_MP/RULES_ENEMY_DEATH_LOCATION_DESC",
	LuaMenuMPRulesJuggHealthDesc = "LUA_MENU_MP/RULES_JUGG_HEALTH_DESC",
	LuaMenuMPRulesRadarEndGameDesc = "LUA_MENU_MP/RULES_RADAR_END_GAME_DESC",
	LuaMenuMPRulesPointsPerFlagDesc = "LUA_MENU_MP/RULES_POINTS_PER_FLAG_DESC",
	LuaMenuMPRulesGoalEnableTimerDesc = "LUA_MENU_MP/RULES_GOAL_ENABLE_TIMER_DESC",
	LuaMenuMPRulesBrInfilConvoyDesc = "LUA_MENU_MP/RULES_BR_INFIL_CONVOY_DESC",
	LuaMenuMPRulesNumEndGameDesc = "LUA_MENU_MP/RULES_NUM_END_GAME_DESC",
	LuaMenuMPRulesEnemyBaseKillRevealDesc = "LUA_MENU_MP/RULES_ENEMY_BASE_KILL_REVEAL_DESC",
	LuaMenuMPRulesGiveTKOnTISpawnDesc = "LUA_MENU_MP/RULES_INFECT_GIVE_LETHAL_ON_TI_DESC",
	LuaMenuMPRulesLastStandWeaponDesc = "LUA_MENU_MP/RULES_LAST_STAND_WEAPON_DESC",
	LuaMenuMPRulesMegaBankLimitDesc = "LUA_MENU_MP/RULES_MEGA_BANK_LIMIT_DESC",
	LuaMenuMPRulesRoundStartTimeDesc = "LUA_MENU_MP/RULES_MATCH_START_TIME_ROUND_DESC",
	LuaMenuMPRulesLastStandTimerDesc = "LUA_MENU_MP/RULES_LAST_STAND_BLEEDOUT_TIMER_DESC",
	LuaMenuMPRulesLethalDelayDesc = "LUA_MENU_MP/RULES_LETHAL_DELAY_DESC",
	LuaMenuMPRulesWeaponTier8Desc = "LUA_MENU_MP/RULES_WEAPONTIER8_DESC",
	LuaMenuMPRulesGoalMoveTimerDesc = "LUA_MENU_MP/RULES_GOAL_MOVE_TIMER_DESC",
	LuaMenuMPRulesWeaponTier5Desc = "LUA_MENU_MP/RULES_WEAPONTIER5_DESC",
	LuaMenuMPRulesWeaponTier4Desc = "LUA_MENU_MP/RULES_WEAPONTIER4_DESC",
	LuaMenuMPRulesWeaponTier3Desc = "LUA_MENU_MP/RULES_WEAPONTIER3_DESC",
	LuaMenuMPRulesPreCapDesc = "LUA_MENU_MP/RULES_PRE_CAP_DESC",
	LuaMenuMPRulesRoundStartReadyUpDesc = "LUA_MENU_MP/RULES_ROUND_START_READY_UP_DESC",
	LuaMenuMPRulesLastStandSuicideTimerDesc = "LUA_MENU_MP/RULES_LAST_STAND_SUICIDE_TIMER_DESC",
	LuaMenuMPRulesWinRuleDesc = "LUA_MENU_MP/RULES_WIN_RULE_DESC",
	LuaMenuMPRulesBankTimeDesc = "LUA_MENU_MP/RULES_BANK_TIME_DESC",
	LuaMenuMPRulesArenaObjModifierDesc = "LUA_MENU_MP/RULES_OBJ_MODIFIER_DESC",
	LuaMenuMPRulesHQPauseTimeDesc = "LUA_MENU_MP/RULES_HQ_PAUSE_TIME_DESC",
	LuaMenuMPRulesCrankedTimerDesc = "LUA_MENU_MP/RULES_CRANKED_TIMER_DESC",
	LuaMenuMPRulesArenaDogTagsDesc = "LUA_MENU_MP/RULES_ARENA_DOG_TAGS_DESC",
	LuaMenuMPRulesTacticalModeDesc = "LUA_MENU_MP/RULES_TACTICAL_MODE_DESC",
	LuaMenuMPRulesDraftLoadoutTimerDesc = "LUA_MENU_MP/RULES_DRAFT_LOADOUT_TIMER_DESC",
	LuaMenuMPRulesEnemyBaseScoreDesc = "MP_FRONTEND_ONLY/RULES_ENEMY_BASE_SCORE_DESC",
	LuaMenuMPRulesLoadoutChangeRoundDesc = "LUA_MENU_MP/RULES_ARENA_LOADOUT_CHANGE_ROUND_DESC",
	LuaMenuMPRulesInfectAllowSupersDesc = "LUA_MENU_MP/RULES_INFECT_ALLOW_SUPER_DESC",
	LuaMenuMPRulesSetbackStreakDesc = "LUA_MENU_MP/RULES_SETBACK_STREAK_DESC",
	LuaMenuMPRulesBankDisableTimeDesc = "LUA_MENU_MP/RULES_BANK_DISABLE_TIME_DESC",
	LuaMenuMPRulesCODCastingEnabledDesc = "LUA_MENU_MP/RULES_CODCASTER_DESC",
	LuaMenuMPRulesWaveDelayDesc = "LUA_MENU_MP/RULES_WAVE_DELAY_DESC",
	LuaMenuMPRulesAONDesc = "LUA_MENU_MP/RULES_AON_DESC",
	LuaMenuMPRulesSurvivorScorePerTickDesc = "LUA_MENU_MP_RULES_SURVIVOR_SCORE_PER_TICK_DESC",
	LuaMenuMPRulesDraftRigTimerDesc = "LUA_MENU_MP/RULES_DRAFT_RIG_TIMER_DESC",
	LuaMenuMPRulesArenaWinConditionDesc = "LUA_MENU_MP/RULES_ARENA_WIN_CONDITION_DESC",
	LuaMenuMPRulesSetbackDesc = "LUA_MENU_MP/RULES_SETBACKS_DESC",
	LuaMenuMPRulesInfectedSuperTwoDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_SUPER_TWO_DESC",
	LuaMenuMPRulesArenaLoadoutsDesc = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_DESC",
	LuaMenuMPRulesAdditiveScoringDesc = "LUA_MENU_MP/RULES_ADDITIVE_SCORING_DESC",
	LuaMenuMPRulesInfectedSecondaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_SECONDARY_WEAPON_DESC",
	LuaMenuMPRulesSuperPointsModDesc = "LUA_MENU_MP/RULES_SUPER_POINTS_MOD_DESC",
	LuaMenuMPRulesPickupTimeDesc = "LUA_MENU_MP/RULES_PICKUP_TIME_DESC",
	LuaMenuMPRulesTimeLimitDesc = "LUA_MENU_MP/RULES_TIME_LIMIT_DESC",
	LuaMenuMPRulesEnableMiniMapDesc = "LUA_MENU_MP/RULES_ENABLE_MINIMAP_DESC",
	LuaMenuMPRulesActivationDelayCenterDesc = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_CENTER_DESC",
	LuaMenuMPRulesEnableInfectedTrackerDesc = "LUA_MENU_MP/RULES_ENABLE_TRACKER_DESC",
	LuaMenuMPRules3rdSpectatingDesc = "LUA_MENU_MP/RULES_3RDPERSON_SPECTATING_DESC",
	LuaMenuMPRulesWinByTwoMaxRoundsDesc = "LUA_MENU_MP/RULES_WIN_BY_TWO_MAX_ROUNDS_DESC",
	LuaMenuMPRulesKillcamDesc = "LUA_MENU_MP/RULES_KILLCAM_DESC",
	LuaMenuMPRulesBountyBonusScoreDesc = "LUA_MENU_MP/RULES_BOUNTY_BONUS_SCORE_DESC",
	LuaMenuMPRulesForceRespawnDesc = "LUA_MENU_MP/RULES_FORCE_RESPAWN_DESC",
	LuaMenuMPRulesArenaSwitchSpawnsDesc = "LUA_MENU_MP/RULES_ARENA_SWITCH_SPAWNS_DESC",
	LuaMenuMPRulesBrInfilC130Desc = "LUA_MENU_MP/RULES_BR_INFIL_C130_DESC",
	LuaMenuMPRulesWeaponTier1Desc = "LUA_MENU_MP/RULES_WEAPONTIER1_DESC",
	LuaMenuMPRulesCapRateDesc = "LUA_MENU_MP/RULES_FLAG_CAPTURE_TIME_DESC",
	LuaMenuMPRulesDefuseTimeDesc = "LUA_MENU_MP/RULES_DEFUSE_TIME_DESC",
	LuaMenuMPRulesWeaponTier6Desc = "LUA_MENU_MP/RULES_WEAPONTIER6_DESC",
	LuaMenuMPRulesPPKTeamWithFlagDesc = "LUA_MENU_MP/RULES_TDEF_PPK_TEAM_WITH_FLAG_DESC",
	LuaMenuMPRulesCaptureDurationDesc = "LUA_MENU_MP/RULES_CAPTURE_DURATION_DESC",
	LuaMenuMPRulesSuperFastChargeRateDesc = "LUA_MENU_MP/RULES_SUPER_FAST_CHARGE_RATE_DESC",
	LuaMenuMPRulesCaptureConditionDesc = "LUA_MENU_MP/RULES_CAPTURE_CONDITION_DESC",
	LuaMenuMPRulesRoundScoreLimitDesc = "LUA_MENU_MP/RULES_ROUND_SCORE_LIMIT_DESC",
	LuaMenuMPRulesSurvivorTacticalDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_TACTICAL_DESC",
	LuaMenuMPRulesHQLifetimeDesc = "LUA_MENU_MP/RULES_HQ_LIFETIME_DESC",
	LuaMenuMPRulesWeaponTier2Desc = "LUA_MENU_MP/RULES_WEAPONTIER2_DESC",
	LuaMenuMPRulesSimultaneousDeathDesc = "LUA_MENU_MP/RULES_SIMUL_DEATH_DESC",
	LuaMenuMPRulesArenaAttachmentsDesc = "LUA_MENU_MP/RULES_ARENA_ATTACHMENTS_DESC",
	LuaMenuMPRulesEnableVariantDZDesc = "LUA_MENU_MP/RULES_ENABLE_VARIANT_DZ_DESC",
	LuaMenuMPRulesRushTimerDesc = "LUA_MENU_MP/RULES_RUSH_TIMER_DESC",
	LuaMenuMPRulesNumberOfLivesDesc = "LUA_MENU_MP/RULES_NUMBER_OF_LIVES_DESC",
	LuaMenuMPRulesNumFlagsScoreOnKillDesc = "LUA_MENU_MP/RULES_NUM_FLAGS_SCORE_KILL_DESC",
	LuaMenuMPRulesPointsPerKillDesc = "LUA_MENU_MP/RULES_POINTS_PER_KILL_DESC",
	LuaMenuMPRulesRadarAlwaysOnDesc = "LUA_MENU_MP/RULES_RADAR_ALWAYS_ON_DESC",
	LuaMenuMPRulesPointsPerDeathDesc = "LUA_MENU_MP/RULES_POINTS_PER_DEATH_DESC",
	LuaMenuMPRulesPointsHeadshotBonusDesc = "LUA_MENU_MP/RULES_POINTS_HEADSHOT_BONUS_DESC",
	LuaMenuMPRulesKillstreaksDesc = "LUA_MENU_MP/RULES_KILLSTREAKS_DESC",
	LuaMenuMPRulesSpawnDelayDesc = "LUA_MENU_MP/RULES_SPAWN_DELAY_DESC",
	LuaMenuMPRulesBountyTimerDesc = "LUA_MENU_MP/RULES_BOUNTY_TIMER_DESC",
	LuaMenuMPRulesKillcamTypeDesc = "LUA_MENU_MP/RULES_KILLCAM_TYPE_DESC",
	LuaMenuMPRulesWeaponTier7Desc = "LUA_MENU_MP/RULES_WEAPONTIER7_DESC",
	LuaMenuMPRulesPointsPerDenyDesc = "LUA_MENU_MP/RULES_POINTS_PER_DENY_DESC",
	LuaMenuMPRulesPostGameExfilDesc = "LUA_MENU_MP/RULES_POST_GAME_EXFIL_DESC",
	LuaMenuMPRulesRoundLimitDesc = "LUA_MENU_MP/RULES_ROUND_LIMIT_DESC",
	LuaMenuMPRulesReturnTimeDesc = "LUA_MENU_MP/RULES_RETURN_TIME_DESC",
	LuaMenuMPRulesMegaBankBonusDesc = "LUA_MENU_MP/RULES_MEGA_BANK_BONUS_DESC",
	LuaMenuMPRulesPauseTimeDesc = "LUA_MENU_MP/RULES_PAUSE_TIME_DESC",
	LuaMenuMPRulesSilentPlantDesc = "LUA_MENU_MP/RULES_SILENT_PLANT_DESC",
	LuaMenuMPRulesPointsPerConfirmDesc = "LUA_MENU_MP/RULES_POINTS_PER_CONFIRM_DESC",
	LuaMenuMPRulesScoreCarryDesc = "LUA_MENU_MP/RULES_SCORE_CARRY_DESC",
	LuaMenuMPRulesSurvivorScoreTimeDesc = "LUA_MENU_MP_RULES_SURVIVOR_SCORE_TIME_DESC",
	LuaMenuMPRulesScoreThrowDesc = "LUA_MENU_MP/RULES_SCORE_THROW_DESC",
	LuaMenuMPRulesCompassHideEnemyDesc = "LUA_MENU_MP/RULES_ENEMY_ON_COMPASS_DESC",
	LuaMenuMPRulesEmpSpawnDesc = "LUA_MENU_MP/RULES_EMP_SPAWN_DESC",
	LuaMenuMPRulesHQRandomLocationOrderDesc = "LUA_MENU_MP/RULES_HQ_RANDOM_LOCATION_ORDER_DESC",
	LuaMenuMPRulesArenaSuperDesc = "LUA_MENU_MP/RULES_ARENA_SUPER_DESC",
	LuaMenuMPRulesRefreshTeamTimerOnResetDesc = "LUA_MENU_MP_RULES_REFRESH_TEAM_TIMER_DESC",
	LuaMenuMPRulesPlantTimeDesc = "LUA_MENU_MP/RULES_PLANT_TIME_DESC",
	LuaMenuMPRulesAllowInputSwapDesc = "LUA_MENU_MP/RULES_ALLOW_INPUT_SWAP_DESC",
	LuaMenuMPRulesBankRateDesc = "LUA_MENU_MP/RULES_BANK_RATE_DESC",
	LuaMenuMPRulesSurvivorPrimaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_PRIMARY_WEAPON_DESC",
	LuaMenuMPRulesBankDisableTagsDesc = "LUA_MENU_MP/RULES_BANK_DISABLE_TAGS_DESC",
	LuaMenuMPRulesVampirismDesc = "LUA_MENU_MP/RULES_VAMPIRISM_DESC",
	LuaMenuMPRulesPossessionResetTimeDesc = "LUA_MENU_MP/RULES_POSSESSION_RESET_TIME_DESC",
	LuaMenuMPRulesBankDisableDesc = "LUA_MENU_MP/RULES_BANK_DISABLE_DESC",
	LuaMenuMPRulesMaxHealthDesc = "LUA_MENU_MP/RULES_MAX_HEALTH_DESC",
	LuaMenuMPRulesBrInfilHeliDesc = "LUA_MENU_MP/RULES_BR_INFIL_HELI_DESC",
	LuaMenuMPRulesFlagsRequiredToScoreDesc = "LUA_MENU_MP/RULES_FLAGS_REQUIRED_TO_SCORE_DESC",
	LuaMenuMPRulesBrFightClubDesc = "LUA_MENU_MP/RULES_BR_GULAG_DESC",
	LuaMenuMPRulesBRStartingWeaponDesc = "LUA_MENU_MP/RULES_BR_STARTING_WEAPON_DESC",
	LuaMenuMPRulesHVTCaptureValueDesc = "LUA_MENU_MP/RULES_HVT_CAPTURE_VALUE_DESC",
	LuaMenuMPRulesPracticeRoundDesc = "LUA_MENU_MP/RULES_PRACTICE_ROUND_DESC",
	LuaMenuMPPrematchCountdownDesc = "LUA_MENU_MP/PREMATCH_COUNTDOWN_DESC",
	LuaMenuMPRulesJuggSpeedDesc = "LUA_MENU_MP/RULES_JUGG_SPEED_DESC",
	LuaMenuMPRulesMatchStartTimeDesc = "LUA_MENU_MP/RULES_MATCH_START_TIME_FIRST_DESC",
	LuaMenuMPRulesInfectedLethalDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_LETHAL_DESC",
	LuaMenuMPRulesArenaBlastShieldModDesc = "LUA_MENU_MP/RULES_ARENA_BS_MOD_DESC",
	LuaMenuMPRulesDisableSpawnCameraDesc = "LUA_MENU_MP/RULES_DISABLE_SPAWN_CAMERA_DESC",
	LuaMenuMPRulesInitialAmmoCountDesc = "LUA_MENU_MP/RULES_OIC_INITIAL_AMMO_DESC",
	LuaMenuMPRulesKillRewardAmmoCountDesc = "LUA_MENU_MP/RULES_OIC_KILL_AMMO_DESC",
	LuaMenuMPRulesOICWeaponDesc = "LUA_MENU_MP/RULES_OIC_WEAPON_DESC",
	LuaMenuMPRulesNumInitialInfectedDesc = "LUA_MENU_MP/RULES_INFECT_NUM_INITIAL_DESC",
	LuaMenuMPRulesBrGulagDesc = "LUA_MENU_MP/RULES_BR_GULAG_DESC",
	LuaMenuMPRulesInfectedPrimaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_PRIMARY_WEAPON_DESC",
	LuaMenuMPRulesRoundTimeLimitDesc = "LUA_MENU_MP/RULES_ROUND_TIME_LIMIT_DESC",
	LuaMenuMPRulesSurvivorSuperTwoDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SUPER_TWO_DESC",
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
	LuaMenuMPRulesWrapKillstreaksDesc = "LUA_MENU_MP/RULES_WRAP_KILLSTREAKS_DESC",
	LuaMenuMPRulesHVTTargetCountDesc = "LUA_MENU_MP/RULES_HVT_TARGET_COUNT_DESC",
	LuaMenuMPRulesSurvivorSecondaryWeaponDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_SECONDARY_WEAPON_DESC",
	LuaMenuMPRulesExfilActiveTimerDesc = "LUA_MENU_MP/RULES_EXFIL_ACTIVE_TIMER_DESC",
	LuaMenuMPRulesCaptureDelayPlayerDesc = "LUA_MENU_MP/RULES_CAPTURE_DELAY_PLAYER_DESC",
	LuaMenuMPRulesPostGameExfilWeaponDesc = "LUA_MENU_MP/RULES_POST_GAME_EXFIL_WEAPON_DESC",
	LuaMenuMPRulesSurvivorLethalDesc = "LUA_MENU_MP/RULES_INFECT_SURVIVOR_LETHAL_DESC",
	LuaMenuMPRulesPointsPerJuggKillDesc = "LUA_MENU_MP/RULES_PPK_KILL_JUGG_DESC",
	LuaMenuMPRulesGoalProtectionDesc = "LUA_MENU_MP/RULES_GOAL_PROTECTION_DESC",
	LuaMenuMPRulesCapZoneDesc = "LUA_MENU_MP/RULES_ESCAPE_CAP_ZONE_DESC",
	LuaMenuMPRulesFriendlyFireDesc = "LUA_MENU_MP/RULES_FRIENDLY_FIRE_DESC",
	LuaMenuMPRulesCaptureDurationBaseDesc = "LUA_MENU_MP/RULES_CAPTURE_DURATION_BASE_DESC",
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
	LuaMenuMPRulesExtraTimeBonusDesc = "LUA_MENU_MP/RULES_TIME_EXTENSION_DESC",
	LuaMenuMPRulesBrCircleStartSizeDesc = "LUA_MENU_MP/RULES_BR_CIRCLE_START_SIZE_DESC",
	LuaMenuMPRulesShowEnemyCarrierDesc = "LUA_MENU_MP/RULES_SHOW_ENEMY_CARRIER_DESC",
	LuaMenuMPRulesHQAdditiveScoringDesc = "LUA_MENU_MP/RULES_HQ_ADDITIVE_SCORING_DESC",
	LuaMenuMPRulesZoneTimeDesc = "LUA_MENU_MP_RULES_ZONE_TIME_DESC",
	LuaMenuMPRulesWinLimitDesc = "LUA_MENU_MP/RULES_WIN_LIMIT_DESC",
	LuaMenuMPRulesCaptureDurationCenterDesc = "LUA_MENU_MP/RULES_CAPTURE_DURATION_CENTER_DESC",
	LuaMenuMPRulesDraftWeaponTimerDesc = "LUA_MENU_MP/RULES_DRAFT_WEAPON_TIMER_DESC",
	LuaMenuMPRulesHoldDurationCenterDesc = "LUA_MENU_MP/RULES_HOLD_DURATION_CENTER_DESC",
	LuaMenuMPRulesCaptureTypeDesc = "LUA_MENU_MP/RULES_CAPTURE_TYPE_DESC",
	LuaMenuMPRulesRandomLocationOrderDesc = "LUA_MENU_MP/RULES_RANDOM_LOCATION_ORDER_DESC",
	LuaMenuMPRulesLadderIndexDesc = "LUA_MENU_MP/RULES_LADDER_DESC",
	LuaMenuMPRulesFirstHQActivationDelayDesc = "LUA_MENU_MP/RULES_FIRST_HQ_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesSurvivorAliveScoreDesc = "LUA_MENU_MP/RULES_SURVIVOR_ALIVE_SCORE_DESC",
	LuaMenuMPRulesDeathRetainStreaksDesc = "LUA_MENU_MP/RULES_DEATH_RETAIN_STREAKS_DESC",
	LuaMenuMPRulesHardcoreDesc = "LUA_MENU_MP/RULES_HARDCORE_DESC",
	LuaMenuMPRulesDropTimeDesc = "LUA_MENU_MP/RULES_DROP_TIME_DESC",
	LuaMenuMPRulesStartWeaponDesc = "LUA_MENU_MP/RULES_START_WEAPON_DESC",
	LuaMenuMPRulesHQTimeoutDesc = "LUA_MENU_MP/RULES_HQ_TIMEOUT_DESC",
	LuaMenuMPRulesKillstreakConfirmedDesc = "LUA_MENU_MP/RULES_KILLSTREAK_CONFIRMED_DESC",
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
	LuaMenuMPRulesGunGameWeaponsDesc = "LUA_MENU_MP/RULES_GUN_GAME_WEAPONS_DESC",
	LuaMenuMPRulesRespawnDelayDesc = "LUA_MENU_MP/RULES_RESPAWN_DELAY_DESC",
	LuaMenuMPRulesCaptureDecayDesc = "LUA_MENU_MP/RULES_CAPTURE_DECAY_DESC",
	LuaMenuMPRulesCDLTuningDesc = "LUA_MENU_MP/CDL_TUNING_DESC",
	LuaMenuMPRulesActivationDelayBaseDesc = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_BASE_DESC",
	LuaMenuMPRulesCMDRulesDesc = "LUA_MENU_MP/RULES_CMD_RULES_DESC",
	LuaMenuMPRulesRoundRetainStreaksDesc = "LUA_MENU_MP/RULES_ROUND_RETAIN_STREAKS_DESC",
	LuaMenuMPRulesEscapeTimerDesc = "LUA_MENU_MP/RULES_ESCAPE_TIMER_DESC",
	LuaMenuMPRulesActivationDelayDesc = "LUA_MENU_MP/RULES_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesHeadshotsOnlyDesc = "LUA_MENU_MP/RULES_HEADSHOTS_ONLY_DESC",
	LuaMenuMPRulesZoneLifetimeDesc = "LUA_MENU_MP/RULES_ZONE_LIFETIME_DESC",
	LuaMenuMPRulesDetonateScoreDesc = "LUA_MENU_MP/RULES_DETONATE_SCORE_DESC",
	LuaMenuMPRulesPracticeModeDesc = "LUA_MENU_MP/RULES_PRACTICE_MODE_DESC",
	LuaMenuMPRulesTargetPlayerCycleDesc = "LUA_MENU_MP/RULES_TARGET_PLAYER_CYCLE_DESC",
	LuaMenuMPRulesFlagNeutralizationDesc = "LUA_MENU_MP/RULES_FLAG_NEUTRALIZATION_DESC",
	LuaMenuMPRulesGoalTypeDesc = "LUA_MENU_MP/RULES_GOAL_TYPE_DESC",
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
	LuaMenuMPRulesInfectedTacticalDesc = "LUA_MENU_MP/RULES_INFECT_INFECTED_TACTICAL_DESC",
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
	LuaMenuMPEnabledValueFalse = {
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
	LuaMenuMPRulesSeconds600 = {
		value = 600,
		text = "LUA_MENU_MP/RULES_MINUTES",
		displayValue = 10
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
	LuaMenuMPRulesVALPHA = {
		text = "WEAPON/AR_VALPHA",
		value = "iw8_ar_valpha_mp"
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
	LuaMenuMPRulesSIERRAX = {
		text = "WEAPON/LM_SIERRAX",
		value = "iw8_lm_sierrax_mp"
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
	LuaMenuMPRulesROMEO700 = {
		text = "WEAPON/SN_ROMEO700",
		value = "iw8_sn_romeo700_mp"
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
	LuaMenuMPRulesAALPHA12 = {
		text = "WEAPON/SH_AALPHA12",
		value = "iw8_sh_aalpha12_mp"
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
	LuaMenuMPRulesKodachis = {
		text = "WEAPON/AKIMBO_BLADES",
		value = "iw8_me_akimboblades_mp"
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
	LuaMenuMPRulesWeaponRandomMelee = {
		text = "LUA_MENU_MP/RULES_WEAPON_RANDOM_MELEE",
		value = "rand_melee"
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
	LuaMenuMPRulesLadder7 = {
		text = "LUA_MENU_MP/RULES_LADDER_7",
		value = 7
	},
	LuaMenuMPRulesLadder8 = {
		text = "LUA_MENU_MP/RULES_LADDER_8",
		value = 8
	},
	LuaMenuMPRulesLadder9 = {
		text = "LUA_MENU_MP/RULES_LADDER_9",
		value = 9
	},
	LuaMenuMPRulesLadder10 = {
		text = "LUA_MENU_MP/RULES_LADDER_10",
		value = 10
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
	LuaMenuMPGGWeaponsOnKill = {
		text = "LUA_MENU_MP/RULES_GGW_SWITCH_ON_KILL",
		value = 1
	},
	LuaMenuMPGGWeaponsOnDeath = {
		text = "LUA_MENU_MP/RULES_GGW_SWITCH_ON_DEATH",
		value = 2
	},
	LuaMenuMPGGWeaponsOnKillAndDeath = {
		text = "LUA_MENU_MP/RULES_GGW_SWITCH_ON_BOTH",
		value = 3
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
	LuaMenuMPAONRulesKnife = {
		text = "LUA_MENU_MP/RULES_AON_KNIFE",
		value = 1
	},
	LuaMenuMPAONRulesAkimboBlades = {
		text = "LUA_MENU_MP/RULES_AON_BLADES",
		value = 2
	},
	LuaMenuMPAONRulesAkimboBlunt = {
		text = "LUA_MENU_MP/RULES_AON_BLUNT",
		value = 3
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
	LuaMenuMPRulesArenaLoadoutsRandomNoAttachments = {
		text = "LUA_MENU_MP/RULES_ARENA_LOADOUTS_RAND_NO_ATT",
		value = 16
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
	LuaMenuMPArenaSoccerBall = {
		text = "LUA_MENU_MP/RULES_ARENA_SOCCER",
		value = 2
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

local function var_0_14()
	return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.WinLimit) == 1
end

local var_0_15 = 12
local var_0_16 = 45
local var_0_17 = 216
local var_0_18 = 952

local function var_0_19(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5, arg_13_6, arg_13_7, arg_13_8)
	local function var_13_0()
		local var_14_0 = MatchRules.BIJEDCBCBH(arg_13_2, arg_13_3)

		for iter_14_0, iter_14_1 in pairs(arg_13_6) do
			if iter_14_1.value == var_14_0 then
				return iter_14_0
			end
		end

		return 1
	end

	local var_13_1 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = arg_13_1
	})

	var_13_1.id = "option_" .. arg_13_2 .. "_" .. arg_13_3

	var_13_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 675, 0, _1080p * 40)
	var_13_1.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_13_4)))

	var_13_1._defaultValue = MatchRules.DBAJHJAHCA(arg_13_2, arg_13_3)

	local function var_13_2(arg_15_0)
		if MatchRules.BIJEDCBCBH(arg_13_2, arg_13_3) ~= var_13_1._defaultValue then
			WZWIP.AnimateThemeElement(var_13_1, "Changed")

			var_13_1._isDefault = false
		else
			WZWIP.AnimateThemeElement(var_13_1, "NotChanged")

			var_13_1._isDefault = true
		end

		if not arg_15_0 then
			local var_15_0 = false

			if arg_13_0.currentOptionButtons and #arg_13_0.currentOptionButtons > 0 then
				for iter_15_0, iter_15_1 in pairs(arg_13_0.currentOptionButtons) do
					if not iter_15_1._isDefault then
						var_15_0 = true

						break
					end
				end
			end

			if var_15_0 then
				ACTIONS.AnimateSequence(arg_13_0.Tabs:GetTabAtIndex(arg_13_0._currentTabIndex), "Changed")
			else
				ACTIONS.AnimateSequence(arg_13_0.Tabs:GetTabAtIndex(arg_13_0._currentTabIndex), "NotChanged")
			end
		end
	end

	arg_13_8 = arg_13_8 or {}

	for iter_13_0, iter_13_1 in pairs(arg_13_8) do
		var_13_1:addEventHandler(iter_13_1.eventName, function(arg_16_0, arg_16_1)
			iter_13_1.eventFunction(arg_16_0, arg_16_1)
			var_13_2(false)
			arg_13_0.RefreshButtonEnableState()
		end)
	end

	var_13_1:addEventHandler("button_over", function(arg_17_0, arg_17_1)
		assert(arg_13_0.ModeDetails)
		arg_13_0.ModeDetails.GenericItemInfo.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_13_4)))
		arg_13_0.ModeDetails.GenericItemInfo.BodyText:setText(Engine.CBBHFCGDIC(arg_13_5))
	end)
	var_13_1:addEventHandler("button_over_disable", function(arg_18_0, arg_18_1)
		assert(arg_13_0.ModeDetails)
		arg_13_0.ModeDetails.GenericItemInfo.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_13_4)))
		arg_13_0.ModeDetails.GenericItemInfo.BodyText:setText(Engine.CBBHFCGDIC(arg_13_5))
	end)

	local var_13_3 = ""

	var_13_1:addEventHandler("refresh_button_values", function(arg_19_0, arg_19_1)
		var_13_3 = arg_19_1.button and arg_19_1.button.id or ""

		if arg_19_0 ~= arg_19_1.button then
			local var_19_0 = var_13_0()

			if var_19_0 ~= arg_19_0.currentValue then
				arg_19_0:SetCurrentValue(var_19_0)
				var_13_2(false)
			end
		end
	end)

	local var_13_4
	local var_13_5
	local var_13_6 = {}

	for iter_13_2, iter_13_3 in pairs(arg_13_6) do
		if iter_13_3.displayValue ~= nil then
			local var_13_7 = iter_13_3.displayValue

			if iter_13_3.displayValueTwo ~= nil then
				local var_13_8 = iter_13_3.displayValueTwo

				table.insert(var_13_6, Engine.CBBHFCGDIC(iter_13_3.text, var_13_7, var_13_8))
			else
				table.insert(var_13_6, Engine.CBBHFCGDIC(iter_13_3.text, var_13_7))
			end
		else
			local var_13_9 = iter_13_3.value

			if type(var_13_9) == "string" then
				table.insert(var_13_6, Engine.CBBHFCGDIC(iter_13_3.text))
			else
				table.insert(var_13_6, Engine.CBBHFCGDIC(iter_13_3.text, var_13_9))
			end
		end
	end

	local function var_13_10(arg_20_0)
		MatchRules.CIGFFEAEFD(arg_13_2, arg_13_3, arg_13_6[arg_20_0].value)
		arg_13_0.GameSetupCategoryOptions:processEvent({
			immediate = true,
			name = "rule_changed_" .. arg_13_2 .. "_" .. arg_13_3,
			value = arg_13_6[arg_20_0].value,
			refreshOriginButtonID = var_13_3
		})
		var_13_2(false)
	end

	local var_13_11 = {
		labels = var_13_6,
		action = var_13_10,
		defaultValue = var_13_0()
	}

	LUI.AddUIArrowTextButtonLogic(var_13_1, arg_13_1, var_13_11)

	local function var_13_12()
		if MLG.AreMLGRulesEnabled() then
			return true
		elseif arg_13_7 then
			return arg_13_7()
		end

		return false
	end

	if var_13_12() then
		var_13_1:SetButtonDisabled(true)
	end

	local function var_13_13(arg_22_0, arg_22_1)
		if var_13_12() then
			var_13_1:SetButtonDisabled(true)
		else
			var_13_1:SetButtonDisabled(false)
		end
	end

	var_13_1.DisableButton = var_13_13

	var_13_1:registerEventHandler("unlock_disabled_buttons", var_13_13(element, event))
	var_13_2(true)

	return var_13_1
end

local function var_0_20(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = {}
	local var_23_1 = Lobby.GetCurrentGameType()
	local var_23_2
	local var_23_3

	if MP.IsNormalDogtagGameType(var_23_1) then
		local var_23_4 = Lobby.MatchRulesClasses.CommonOption
		local var_23_5 = Lobby.MatchRulesMembers.DogTags

		if arg_23_2 then
			if var_0_4(var_23_4, var_23_5) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_4, var_23_5, var_0_5.LuaMenuMPRulesDogTags, var_0_6.LuaMenuMPRulesDogTagsDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}, var_0_10, {
				{
					eventName = "rule_changed_commonOption_lastStand",
					eventFunction = function(arg_24_0, arg_24_1)
						if var_0_10() then
							arg_24_0:SetButtonDisabled(true)
						else
							arg_24_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end
	end

	if MP.IsPointsPerKillGameType(var_23_1) then
		local var_23_6 = Lobby.MatchRulesClasses.CommonOption
		local var_23_7 = Lobby.MatchRulesMembers.PointsPerKill

		if arg_23_2 then
			if var_0_4(var_23_6, var_23_7) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_6, var_23_7, var_0_5.LuaMenuMPRulesPointsPerKill, var_0_6.LuaMenuMPRulesPointsPerKillDesc, {
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

		local var_23_8 = Lobby.MatchRulesClasses.CommonOption
		local var_23_9 = Lobby.MatchRulesMembers.PointsPerDeath

		if arg_23_2 then
			if var_0_4(var_23_8, var_23_9) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_8, var_23_9, var_0_5.LuaMenuMPRulesPointsPerDeath, var_0_6.LuaMenuMPRulesPointsPerDeathDesc, {
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

		local var_23_10 = Lobby.MatchRulesClasses.CommonOption
		local var_23_11 = Lobby.MatchRulesMembers.PointsHeadshotBonus

		if arg_23_2 then
			if var_0_4(var_23_10, var_23_11) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_10, var_23_11, var_0_5.LuaMenuMPRulesPointsHeadshotBonus, var_0_6.LuaMenuMPRulesPointsHeadshotBonusDesc, {
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

		local var_23_12 = Lobby.MatchRulesClasses.CommonOption
		local var_23_13 = Lobby.MatchRulesMembers.PointsPerKSKill

		if arg_23_2 then
			if var_0_4(var_23_12, var_23_13) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_12, var_23_13, var_0_5.LuaMenuMPRulesPointsPerKSKill, var_0_6.LuaMenuMPRulesPointsPerKSKillDesc, {
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

	if var_23_1 == MP.GameMode.FrontGameType then
		local var_23_14 = Lobby.MatchRulesClasses.FrontData
		local var_23_15 = Lobby.MatchRulesMembers.FriendlyBaseScore

		if arg_23_2 then
			if var_0_4(var_23_14, var_23_15) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_14, var_23_15, var_0_5.LuaMenuMPRulesFriendlyBaseScore, var_0_6.LuaMenuMPRulesFriendlyBaseScoreDesc, {
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

		local var_23_16 = Lobby.MatchRulesClasses.FrontData
		local var_23_17 = Lobby.MatchRulesMembers.MidfieldScore

		if arg_23_2 then
			if var_0_4(var_23_16, var_23_17) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_16, var_23_17, var_0_5.LuaMenuMPRulesMidfieldScore, var_0_6.LuaMenuMPRulesMidfieldScoreDesc, {
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

		local var_23_18 = Lobby.MatchRulesClasses.FrontData
		local var_23_19 = Lobby.MatchRulesMembers.EnemyBaseScore

		if arg_23_2 then
			if var_0_4(var_23_18, var_23_19) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_18, var_23_19, var_0_5.LuaMenuMPRulesEnemyBaseScore, var_0_6.LuaMenuMPRulesEnemyBaseScoreDesc, {
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

	if var_23_1 == MP.GameMode.BallGameType then
		local var_23_20 = Lobby.MatchRulesClasses.BallData
		local var_23_21 = Lobby.MatchRulesMembers.ScoreCarry

		if arg_23_2 then
			if var_0_4(var_23_20, var_23_21) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_20, var_23_21, var_0_5.LuaMenuMPRulesScoreCarry, var_0_6.LuaMenuMPRulesScoreCarryDesc, {
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

		local var_23_22 = Lobby.MatchRulesClasses.BallData
		local var_23_23 = Lobby.MatchRulesMembers.ScoreThrow

		if arg_23_2 then
			if var_0_4(var_23_22, var_23_23) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_22, var_23_23, var_0_5.LuaMenuMPRulesScoreThrow, var_0_6.LuaMenuMPRulesScoreThrowDesc, {
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

		local function var_23_24()
			return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.BallData, Lobby.MatchRulesMembers.SatelliteCount) > 1
		end

		local var_23_25 = Lobby.MatchRulesClasses.BallData
		local var_23_26 = Lobby.MatchRulesMembers.SatelliteCount

		if arg_23_2 then
			if var_0_4(var_23_25, var_23_26) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_25, var_23_26, var_0_5.LuaMenuMPRulesSatelliteCount, var_0_6.LuaMenuMPRulesSatelliteCountDesc, {
				var_0_8.LuaMenuMPRulesSatellites1,
				var_0_8.LuaMenuMPRulesSatellites2,
				var_0_8.LuaMenuMPRulesSatellites3,
				var_0_8.LuaMenuMPRulesSatellites4,
				var_0_8.LuaMenuMPRulesSatellites5
			}, nil, {
				{
					eventName = "rule_changed_ballData_satelliteCount",
					eventFunction = function(arg_26_0, arg_26_1)
						if var_23_24() then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.BallCommonData, Lobby.MatchRulesMembers.PossessionResetCondition, 0)
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.BallCommonData, Lobby.MatchRulesMembers.PossessionResetTime, 0)
							var_0_0(arg_23_0)

							if arg_26_1.refreshOriginButtonID and arg_26_1.refreshOriginButtonID == "" then
								arg_23_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_26_0
								})
							end
						end
					end
				}
			}))
		end

		local var_23_27 = Lobby.MatchRulesClasses.BallData
		local var_23_28 = Lobby.MatchRulesMembers.PracticeMode

		if arg_23_2 then
			if var_0_4(var_23_27, var_23_28) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_27, var_23_28, var_0_5.LuaMenuMPRulesPracticeMode, var_0_6.LuaMenuMPRulesPracticeModeDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local function var_23_29()
			return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.BallCommonData, Lobby.MatchRulesMembers.PossessionResetCondition) == 0
		end

		local var_23_30 = Lobby.MatchRulesClasses.BallCommonData
		local var_23_31 = Lobby.MatchRulesMembers.PossessionResetCondition

		if arg_23_2 then
			if var_0_4(var_23_30, var_23_31) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_30, var_23_31, var_0_5.LuaMenuMPRulesPossessionResetCondition, var_0_6.LuaMenuMPRulesPossessionResetConditionDesc, {
				var_0_8.LuaMenuMPValuePossessionResetNever,
				var_0_8.LuaMenuMPValuePossessionResetFirstTouch,
				var_0_8.LuaMenuMPValuePossessionResetIndividualTouch
			}, var_23_24, {
				{
					eventName = "rule_changed_ballData_satelliteCount",
					eventFunction = function(arg_28_0, arg_28_1)
						if var_23_24() then
							arg_28_0:SetButtonDisabled(true)
						else
							arg_28_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_32 = Lobby.MatchRulesClasses.BallCommonData
		local var_23_33 = Lobby.MatchRulesMembers.PossessionResetTime

		if arg_23_2 then
			if var_0_4(var_23_32, var_23_33) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_32, var_23_33, var_0_5.LuaMenuMPRulesPossessionResetTime, var_0_6.LuaMenuMPRulesPossessionResetTimeDesc, {
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
			}, var_23_29, {
				{
					eventName = "rule_changed_ballCommonData_possessionResetCondition",
					eventFunction = function(arg_29_0, arg_29_1)
						if var_23_29() then
							arg_29_0:SetButtonDisabled(true)
						else
							arg_29_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end
	end

	if var_23_1 == MP.GameMode.BlitzGameType then
		local var_23_34 = Lobby.MatchRulesClasses.BlitzData
		local var_23_35 = Lobby.MatchRulesMembers.WinRule

		if arg_23_2 then
			if var_0_4(var_23_34, var_23_35) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_34, var_23_35, var_0_5.LuaMenuMPRulesWinRule, var_0_6.LuaMenuMPRulesWinRuleDesc, {
				var_0_8.LuaMenuMPRulesRoundWins,
				var_0_8.LuaMenuMPRulesTotalFlagCaptures
			}))
		end

		local var_23_36 = Lobby.MatchRulesClasses.BlitzData
		local var_23_37 = Lobby.MatchRulesMembers.CaptureCondition

		if arg_23_2 then
			if var_0_4(var_23_36, var_23_37) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_36, var_23_37, var_0_5.LuaMenuMPRulesCaptureCondition, var_0_6.LuaMenuMPRulesCaptureConditionDesc, {
				var_0_8.LuaMenuMPRulesFlagAtBase,
				var_0_8.LuaMenuMPRulesFlagAnywhere
			}))
		end

		local var_23_38 = Lobby.MatchRulesClasses.BlitzData
		local var_23_39 = Lobby.MatchRulesMembers.ReturnTime

		if arg_23_2 then
			if var_0_4(var_23_38, var_23_39) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_38, var_23_39, var_0_5.LuaMenuMPRulesReturnTime, var_0_6.LuaMenuMPRulesReturnTimeDesc, {
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

	if var_23_1 == MP.GameMode.CTFGameType then
		local var_23_40 = Lobby.MatchRulesClasses.CTFData
		local var_23_41 = Lobby.MatchRulesMembers.WinRule

		if arg_23_2 then
			if var_0_4(var_23_40, var_23_41) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_40, var_23_41, var_0_5.LuaMenuMPRulesWinRule, var_0_6.LuaMenuMPRulesWinRuleDesc, {
				var_0_8.LuaMenuMPRulesRoundWins,
				var_0_8.LuaMenuMPRulesTotalFlagCaptures
			}))
		end

		local var_23_42 = Lobby.MatchRulesClasses.CTFData
		local var_23_43 = Lobby.MatchRulesMembers.CaptureCondition

		if arg_23_2 then
			if var_0_4(var_23_42, var_23_43) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_42, var_23_43, var_0_5.LuaMenuMPRulesCaptureCondition, var_0_6.LuaMenuMPRulesCaptureConditionDesc, {
				var_0_8.LuaMenuMPRulesFlagAtBase,
				var_0_8.LuaMenuMPRulesFlagAnywhere
			}))
		end

		local var_23_44 = Lobby.MatchRulesClasses.CTFData
		local var_23_45 = Lobby.MatchRulesMembers.ReturnTime

		if arg_23_2 and var_0_4(var_23_44, var_23_45) then
			return true
		end
	end

	if var_23_1 == MP.GameMode.GrndGameType then
		local var_23_46 = Lobby.MatchRulesClasses.GrndData
		local var_23_47 = Lobby.MatchRulesMembers.DropTime

		if arg_23_2 then
			if var_0_4(var_23_46, var_23_47) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_46, var_23_47, var_0_5.LuaMenuMPRulesDropTime, var_0_6.LuaMenuMPRulesDropTimeDesc, {
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

	if var_23_1 == MP.GameMode.DemoGameType then
		local var_23_48 = Lobby.MatchRulesClasses.DemData
		local var_23_49 = Lobby.MatchRulesMembers.ExtraTime

		if arg_23_2 then
			if var_0_4(var_23_48, var_23_49) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_48, var_23_49, var_0_5.LuaMenuMPRulesExtraTime, var_0_6.LuaMenuMPRulesExtraTimeDesc, {
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

		local var_23_50 = Lobby.MatchRulesClasses.DemData
		local var_23_51 = Lobby.MatchRulesMembers.OvertimeLimit

		if arg_23_2 then
			if var_0_4(var_23_50, var_23_51) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_50, var_23_51, var_0_5.LuaMenuMPRulesOvertimeLimit, var_0_6.LuaMenuMPRulesOvertimeLimitDesc, {
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

	if var_23_1 == MP.GameMode.SDGameType or var_23_1 == MP.GameMode.SRGameType or var_23_1 == MP.GameMode.DemoGameType or var_23_1 == MP.GameMode.CyberGameType then
		local var_23_52 = Lobby.MatchRulesClasses.BombData
		local var_23_53 = Lobby.MatchRulesMembers.BombTimer

		if arg_23_2 then
			if var_0_4(var_23_52, var_23_53) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_52, var_23_53, var_0_5.LuaMenuMPRulesBombTimer, var_0_6.LuaMenuMPRulesBombTimerDesc, {
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
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds65,
				var_0_8.LuaMenuMPRulesSeconds70,
				var_0_8.LuaMenuMPRulesSeconds75,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120,
				var_0_8.LuaMenuMPRulesSeconds150,
				var_0_8.LuaMenuMPRulesSeconds180,
				var_0_8.LuaMenuMPRulesSeconds210,
				var_0_8.LuaMenuMPRulesSeconds240
			}))
		end
	end

	if var_23_1 == MP.GameMode.SDGameType or var_23_1 == MP.GameMode.SRGameType or var_23_1 == MP.GameMode.DemoGameType or var_23_1 == MP.GameMode.CyberGameType then
		local var_23_54 = Lobby.MatchRulesClasses.BombData
		local var_23_55 = Lobby.MatchRulesMembers.PlantTime

		if arg_23_2 then
			if var_0_4(var_23_54, var_23_55) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_54, var_23_55, var_0_5.LuaMenuMPRulesPlantTime, var_0_6.LuaMenuMPRulesPlantTimeDesc, {
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

	if var_23_1 == MP.GameMode.SDGameType or var_23_1 == MP.GameMode.SRGameType or var_23_1 == MP.GameMode.DemoGameType or var_23_1 == MP.GameMode.CyberGameType then
		local var_23_56 = Lobby.MatchRulesClasses.BombData
		local var_23_57 = Lobby.MatchRulesMembers.DefuseTime

		if arg_23_2 then
			if var_0_4(var_23_56, var_23_57) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_56, var_23_57, var_0_5.LuaMenuMPRulesDefuseTime, var_0_6.LuaMenuMPRulesDefuseTimeDesc, {
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

	if var_23_1 == MP.GameMode.SDGameType or var_23_1 == MP.GameMode.SRGameType then
		local var_23_58 = Lobby.MatchRulesClasses.BombData
		local var_23_59 = Lobby.MatchRulesMembers.MultiBomb

		if arg_23_2 then
			if var_0_4(var_23_58, var_23_59) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_58, var_23_59, var_0_5.LuaMenuMPRulesMultiBomb, var_0_6.LuaMenuMPRulesMultiBombDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_23_1 == MP.GameMode.SDGameType or var_23_1 == MP.GameMode.SRGameType or var_23_1 == MP.GameMode.DemoGameType then
		local var_23_60 = Lobby.MatchRulesClasses.BombData
		local var_23_61 = Lobby.MatchRulesMembers.SilentPlant

		if arg_23_2 then
			if var_0_4(var_23_60, var_23_61) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_60, var_23_61, var_0_5.LuaMenuMPRulesSilentPlant, var_0_6.LuaMenuMPRulesSilentPlantDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_23_1 == MP.GameMode.SDGameType or var_23_1 == MP.GameMode.SRGameType or var_23_1 == MP.GameMode.DemoGameType then
		local var_23_62 = Lobby.MatchRulesClasses.BombData
		local var_23_63 = Lobby.MatchRulesMembers.ResetProgress

		if arg_23_2 then
			if var_0_4(var_23_62, var_23_63) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_62, var_23_63, var_0_5.LuaMenuMPRulesResetProgress, var_0_6.LuaMenuMPRulesResetProgressDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end
	end

	if var_23_1 == MP.GameMode.BallGameType or var_23_1 == MP.GameMode.CTFGameType or var_23_1 == MP.GameMode.TDefGameType or var_23_1 == MP.GameMode.CyberGameType or var_23_1 == MP.GameMode.BlitzGameType then
		local var_23_64 = Lobby.MatchRulesClasses.CarryData
		local var_23_65 = Lobby.MatchRulesMembers.ShowEnemyCarrier

		if arg_23_2 then
			if var_0_4(var_23_64, var_23_65) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_64, var_23_65, var_0_5.LuaMenuMPRulesShowEnemyCarrier, var_0_6.LuaMenuMPRulesShowEnemyCarrierDesc, {
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

	if var_23_1 == MP.GameMode.BallGameType or var_23_1 == MP.GameMode.CTFGameType or var_23_1 == MP.GameMode.TDefGameType or var_23_1 == MP.GameMode.CyberGameType or var_23_1 == MP.GameMode.BlitzGameType then
		local var_23_66 = Lobby.MatchRulesClasses.CarryData
		local var_23_67 = Lobby.MatchRulesMembers.IdleResetTime

		if arg_23_2 then
			if var_0_4(var_23_66, var_23_67) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_66, var_23_67, var_0_5.LuaMenuMPRulesIdleResetTime, var_0_6.LuaMenuMPRulesIdleResetTimeDesc, {
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

	if var_23_1 == MP.GameMode.TDefGameType then
		local var_23_68 = Lobby.MatchRulesClasses.TdefData
		local var_23_69 = Lobby.MatchRulesMembers.PPKTeamNoFlag

		if arg_23_2 then
			if var_0_4(var_23_68, var_23_69) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_68, var_23_69, var_0_5.LuaMenuMPRulesPPKTeamNoFlag, var_0_6.LuaMenuMPRulesPPKTeamNoFlagDesc, {
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

		local var_23_70 = Lobby.MatchRulesClasses.TdefData
		local var_23_71 = Lobby.MatchRulesMembers.PPKTeamWithFlag

		if arg_23_2 then
			if var_0_4(var_23_70, var_23_71) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_70, var_23_71, var_0_5.LuaMenuMPRulesPPKTeamWithFlag, var_0_6.LuaMenuMPRulesPPKTeamWithFlagDesc, {
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

		local var_23_72 = Lobby.MatchRulesClasses.TdefData
		local var_23_73 = Lobby.MatchRulesMembers.PPKFlagCarrier

		if arg_23_2 then
			if var_0_4(var_23_72, var_23_73) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_72, var_23_73, var_0_5.LuaMenuMPRulesPPKFlagCarrier, var_0_6.LuaMenuMPRulesPPKFlagCarrierDesc, {
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

		local function var_23_74()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.TdefData, Lobby.MatchRulesMembers.DelayPlayer)
		end

		local var_23_75 = Lobby.MatchRulesClasses.TdefData
		local var_23_76 = Lobby.MatchRulesMembers.DelayPlayer

		if arg_23_2 then
			if var_0_4(var_23_75, var_23_76) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_75, var_23_76, var_0_5.LuaMenuMPRulesDelayPlayer, var_0_6.LuaMenuMPRulesDelayPlayerDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end

		local var_23_77 = Lobby.MatchRulesClasses.TdefData
		local var_23_78 = Lobby.MatchRulesMembers.SpawnDelay

		if arg_23_2 then
			if var_0_4(var_23_77, var_23_78) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_77, var_23_78, var_0_5.LuaMenuMPRulesSpawnDelay, var_0_6.LuaMenuMPRulesSpawnDelayDesc, {
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
			}, var_23_74, {
				{
					eventName = "rule_changed_tdefData_delayPlayer",
					eventFunction = function(arg_31_0, arg_31_1)
						if var_23_74() then
							arg_31_0:SetButtonDisabled(true)
						else
							arg_31_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_79 = Lobby.MatchRulesClasses.TdefData
		local var_23_80 = Lobby.MatchRulesMembers.FlagActivationDelay

		if arg_23_2 then
			if var_0_4(var_23_79, var_23_80) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_79, var_23_80, var_0_5.LuaMenuMPRulesFlagActivationDelay, var_0_6.LuaMenuMPRulesFlagActivationDelayDesc, {
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

	if var_23_1 == MP.GameMode.DomGameType or var_23_1 == MP.GameMode.ArenaGameType then
		local var_23_81 = Lobby.MatchRulesClasses.DomData
		local var_23_82 = Lobby.MatchRulesMembers.FlagCaptureTime

		if arg_23_2 then
			if var_0_4(var_23_81, var_23_82) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_81, var_23_82, var_0_5.LuaMenuMPRulesFlagCaptureTime, var_0_6.LuaMenuMPRulesCapRateDesc, {
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

	if var_23_1 == MP.GameMode.DomGameType then
		local var_23_83 = Lobby.MatchRulesClasses.DomData
		local var_23_84 = Lobby.MatchRulesMembers.FlagsRequiredToScore

		if arg_23_2 then
			if var_0_4(var_23_83, var_23_84) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_83, var_23_84, var_0_5.LuaMenuMPRulesFlagsRequiredToScore, var_0_6.LuaMenuMPRulesFlagsRequiredToScoreDesc, {
				var_0_8.LuaMenuMPRulesZones1,
				var_0_8.LuaMenuMPRulesZones2,
				var_0_8.LuaMenuMPRulesZones3
			}))
		end

		local var_23_85 = Lobby.MatchRulesClasses.DomData
		local var_23_86 = Lobby.MatchRulesMembers.PointsPerFlag

		if arg_23_2 then
			if var_0_4(var_23_85, var_23_86) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_85, var_23_86, var_0_5.LuaMenuMPRulesPointsPerFlag, var_0_6.LuaMenuMPRulesPointsPerFlagDesc, {
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

		local var_23_87 = Lobby.MatchRulesClasses.DomData
		local var_23_88 = Lobby.MatchRulesMembers.FlagNeutralization

		if arg_23_2 then
			if var_0_4(var_23_87, var_23_88) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_87, var_23_88, var_0_5.LuaMenuMPRulesFlagNeutralization, var_0_6.LuaMenuMPRulesFlagNeutralizationDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_89 = Lobby.MatchRulesClasses.DomData
		local var_23_90 = Lobby.MatchRulesMembers.ObjScalar

		if arg_23_2 then
			if var_0_4(var_23_89, var_23_90) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_89, var_23_90, var_0_5.LuaMenuMPRulesObjScalar, var_0_6.LuaMenuMPRulesObjScalarDesc, {
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

		local var_23_91 = Lobby.MatchRulesClasses.DomData
		local var_23_92 = Lobby.MatchRulesMembers.NumFlagsScoreOnKill

		if arg_23_2 then
			if var_0_4(var_23_91, var_23_92) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_91, var_23_92, var_0_5.LuaMenuMPRulesNumFlagsScoreOnKill, var_0_6.LuaMenuMPRulesNumFlagsScoreOnKillDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesZones1,
				var_0_8.LuaMenuMPRulesZones2,
				var_0_8.LuaMenuMPRulesZones3
			}))
		end

		local var_23_93 = Lobby.MatchRulesClasses.SiegeData
		local var_23_94 = Lobby.MatchRulesMembers.PreCapPoints

		if arg_23_2 then
			if var_0_4(var_23_93, var_23_94) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_93, var_23_94, var_0_5.LuaMenuMPRulesPreCap, var_0_6.LuaMenuMPRulesPreCapDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_23_1 == MP.GameMode.HQGameType then
		local var_23_95 = Lobby.MatchRulesClasses.HQData
		local var_23_96 = Lobby.MatchRulesMembers.ZoneCaptureTime

		if arg_23_2 then
			if var_0_4(var_23_95, var_23_96) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_95, var_23_96, var_0_5.LuaMenuMPRulesHQCaptureTime, var_0_6.LuaMenuMPRulesHQCaptureTimeDesc, {
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

		local var_23_97 = Lobby.MatchRulesClasses.HQData
		local var_23_98 = Lobby.MatchRulesMembers.ZoneTimeout

		if arg_23_2 then
			if var_0_4(var_23_97, var_23_98) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_97, var_23_98, var_0_5.LuaMenuMPRulesHQTimeout, var_0_6.LuaMenuMPRulesHQTimeoutDesc, {
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

		local var_23_99 = Lobby.MatchRulesClasses.HQData
		local var_23_100 = Lobby.MatchRulesMembers.ZoneLifetime

		if arg_23_2 then
			if var_0_4(var_23_99, var_23_100) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_99, var_23_100, var_0_5.LuaMenuMPRulesHQLifetime, var_0_6.LuaMenuMPRulesHQLifetimeDesc, {
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

		local var_23_101 = Lobby.MatchRulesClasses.HQData
		local var_23_102 = Lobby.MatchRulesMembers.FirstZoneActivationDelay

		if arg_23_2 then
			if var_0_4(var_23_101, var_23_102) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_101, var_23_102, var_0_5.LuaMenuMPRulesFirstHQActivationDelay, var_0_6.LuaMenuMPRulesFirstHQActivationDelayDesc, {
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

		local var_23_103 = Lobby.MatchRulesClasses.HQData
		local var_23_104 = Lobby.MatchRulesMembers.ZoneActivationDelay

		if arg_23_2 then
			if var_0_4(var_23_103, var_23_104) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_103, var_23_104, var_0_5.LuaMenuMPRulesHQActivationDelay, var_0_6.LuaMenuMPRulesHQActivationDelayDesc, {
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

		local var_23_105 = Lobby.MatchRulesClasses.HQData
		local var_23_106 = Lobby.MatchRulesMembers.ZoneSelectionDelay

		if arg_23_2 then
			if var_0_4(var_23_105, var_23_106) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_105, var_23_106, var_0_5.LuaMenuMPRulesHQSelectionDelay, var_0_6.LuaMenuMPRulesHQSelectionDelayDesc, {
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

		local var_23_107 = Lobby.MatchRulesClasses.HQData
		local var_23_108 = Lobby.MatchRulesMembers.RandomLocationOrder

		if arg_23_2 then
			if var_0_4(var_23_107, var_23_108) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_107, var_23_108, var_0_5.LuaMenuMPRulesHQRandomLocationOrder, var_0_6.LuaMenuMPRulesHQRandomLocationOrderDesc, {
				var_0_8.LuaMenuMPRulesLocationOrderLinear,
				var_0_8.LuaMenuMPRulesLocationOrderRandom
			}))
		end

		local var_23_109 = Lobby.MatchRulesClasses.HQData
		local var_23_110 = Lobby.MatchRulesMembers.AdditiveScoring

		if arg_23_2 then
			if var_0_4(var_23_109, var_23_110) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_109, var_23_110, var_0_5.LuaMenuMPRulesHQAdditiveScoring, var_0_6.LuaMenuMPRulesHQAdditiveScoringDesc, {
				var_0_8.LuaMenuMPRulesScoringConstant,
				var_0_8.LuaMenuMPRulesScoringAdditive
			}))
		end

		local var_23_111 = Lobby.MatchRulesClasses.HQData
		local var_23_112 = Lobby.MatchRulesMembers.PauseTime

		if arg_23_2 then
			if var_0_4(var_23_111, var_23_112) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_111, var_23_112, var_0_5.LuaMenuMPRulesHQPauseTime, var_0_6.LuaMenuMPRulesHQPauseTimeDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end

		local var_23_113 = Lobby.MatchRulesClasses.HQData
		local var_23_114 = Lobby.MatchRulesMembers.DelayPlayer

		if arg_23_2 then
			if var_0_4(var_23_113, var_23_114) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_113, var_23_114, var_0_5.LuaMenuMPRulesHQCaptureDelayPlayer, var_0_6.LuaMenuMPRulesHQCaptureDelayPlayerDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end
	end

	if var_23_1 == MP.GameMode.HardpointGameType or var_23_1 == MP.GameMode.GrndGameType then
		local var_23_115 = Lobby.MatchRulesClasses.KOTHData
		local var_23_116 = Lobby.MatchRulesMembers.ZoneCaptureTime

		if arg_23_2 then
			if var_0_4(var_23_115, var_23_116) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_115, var_23_116, var_0_5.LuaMenuMPRulesZoneCaptureTime, var_0_6.LuaMenuMPRulesCapRateDesc, {
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

		local var_23_117 = Lobby.MatchRulesClasses.KOTHData
		local var_23_118 = Lobby.MatchRulesMembers.ZoneLifetime

		if arg_23_2 then
			if var_0_4(var_23_117, var_23_118) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_117, var_23_118, var_0_5.LuaMenuMPRulesZoneLifetime, var_0_6.LuaMenuMPRulesZoneLifetimeDesc, {
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

		local var_23_119 = Lobby.MatchRulesClasses.KOTHData
		local var_23_120 = Lobby.MatchRulesMembers.FirstZoneActivationDelay

		if arg_23_2 then
			if var_0_4(var_23_119, var_23_120) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_119, var_23_120, var_0_5.LuaMenuMPRulesFirstZoneActivationDelay, var_0_6.LuaMenuMPRulesFirstZoneActivationDelayDesc, {
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

		local var_23_121 = Lobby.MatchRulesClasses.KOTHData
		local var_23_122 = Lobby.MatchRulesMembers.ZoneActivationDelay

		if arg_23_2 then
			if var_0_4(var_23_121, var_23_122) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_121, var_23_122, var_0_5.LuaMenuMPRulesZoneActivationDelay, var_0_6.LuaMenuMPRulesZoneActivationDelayDesc, {
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

		local var_23_123 = Lobby.MatchRulesClasses.KOTHData
		local var_23_124 = Lobby.MatchRulesMembers.RandomLocationOrder

		if arg_23_2 then
			if var_0_4(var_23_123, var_23_124) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_123, var_23_124, var_0_5.LuaMenuMPRulesRandomLocationOrder, var_0_6.LuaMenuMPRulesRandomLocationOrderDesc, {
				var_0_8.LuaMenuMPRulesLocationOrderLinear,
				var_0_8.LuaMenuMPRulesLocationOrderRandom
			}))
		end

		local var_23_125 = Lobby.MatchRulesClasses.KOTHData
		local var_23_126 = Lobby.MatchRulesMembers.AdditiveScoring

		if arg_23_2 then
			if var_0_4(var_23_125, var_23_126) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_125, var_23_126, var_0_5.LuaMenuMPRulesAdditiveScoring, var_0_6.LuaMenuMPRulesAdditiveScoringDesc, {
				var_0_8.LuaMenuMPRulesScoringConstant,
				var_0_8.LuaMenuMPRulesScoringAdditive
			}))
		end

		local var_23_127 = Lobby.MatchRulesClasses.KOTHData
		local var_23_128 = Lobby.MatchRulesMembers.PauseTime

		if arg_23_2 then
			if var_0_4(var_23_127, var_23_128) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_127, var_23_128, var_0_5.LuaMenuMPRulesPauseTime, var_0_6.LuaMenuMPRulesPauseTimeDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local function var_23_129()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.KOTHData, Lobby.MatchRulesMembers.DelayPlayer)
		end

		local var_23_130 = Lobby.MatchRulesClasses.KOTHData
		local var_23_131 = Lobby.MatchRulesMembers.DelayPlayer

		if arg_23_2 then
			if var_0_4(var_23_130, var_23_131) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_130, var_23_131, var_0_5.LuaMenuMPRulesDelayPlayer, var_0_6.LuaMenuMPRulesDelayPlayerDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end

		local var_23_132 = Lobby.MatchRulesClasses.KOTHData
		local var_23_133 = Lobby.MatchRulesMembers.SpawnDelay

		if arg_23_2 then
			if var_0_4(var_23_132, var_23_133) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_132, var_23_133, var_0_5.LuaMenuMPRulesSpawnDelay, var_0_6.LuaMenuMPRulesSpawnDelayDesc, {
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
			}, var_23_129, {
				{
					eventName = "rule_changed_kothData_delayPlayer",
					eventFunction = function(arg_33_0, arg_33_1)
						if var_23_129() then
							arg_33_0:SetButtonDisabled(true)
						else
							arg_33_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end
	end

	if var_23_1 == MP.GameMode.ConfGameType then
		local var_23_134 = Lobby.MatchRulesClasses.ConfData
		local var_23_135 = Lobby.MatchRulesMembers.PointsPerConfirm

		if arg_23_2 then
			if var_0_4(var_23_134, var_23_135) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_134, var_23_135, var_0_5.LuaMenuMPRulesPointsPerConfirm, var_0_6.LuaMenuMPRulesPointsPerConfirmDesc, {
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

		local var_23_136 = Lobby.MatchRulesClasses.ConfData
		local var_23_137 = Lobby.MatchRulesMembers.PointsPerDeny

		if arg_23_2 then
			if var_0_4(var_23_136, var_23_137) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_136, var_23_137, var_0_5.LuaMenuMPRulesPointsPerDeny, var_0_6.LuaMenuMPRulesPointsPerDenyDesc, {
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

		local var_23_138 = Lobby.MatchRulesClasses.CommonOption
		local var_23_139 = Lobby.MatchRulesMembers.PointsPerKill

		if arg_23_2 then
			if var_0_4(var_23_138, var_23_139) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_138, var_23_139, var_0_5.LuaMenuMPRulesPointsPerKill, var_0_6.LuaMenuMPRulesPointsPerKillDesc, {
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

		local var_23_140 = Lobby.MatchRulesClasses.CommonOption
		local var_23_141 = Lobby.MatchRulesMembers.PointsPerDeath

		if arg_23_2 then
			if var_0_4(var_23_140, var_23_141) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_140, var_23_141, var_0_5.LuaMenuMPRulesPointsPerDeath, var_0_6.LuaMenuMPRulesPointsPerDeathDesc, {
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

		local var_23_142 = Lobby.MatchRulesClasses.ConfData
		local var_23_143 = Lobby.MatchRulesMembers.KillstreakConfirmed

		if arg_23_2 then
			if var_0_4(var_23_142, var_23_143) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_142, var_23_143, var_0_5.LuaMenuMPRulesKillstreakConfirmed, var_0_6.LuaMenuMPRulesKillstreakConfirmedDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_23_1 == MP.GameMode.GrindGameType then
		local function var_23_144()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.GrindData, Lobby.MatchRulesMembers.BankDisable)
		end

		local var_23_145 = Lobby.MatchRulesClasses.GrindData
		local var_23_146 = Lobby.MatchRulesMembers.BankTime

		if arg_23_2 then
			if var_0_4(var_23_145, var_23_146) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_145, var_23_146, var_0_5.LuaMenuMPRulesBankTime, var_0_6.LuaMenuMPRulesBankTimeDesc, {
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

		local var_23_147 = Lobby.MatchRulesClasses.GrindData
		local var_23_148 = Lobby.MatchRulesMembers.BankRate

		if arg_23_2 then
			if var_0_4(var_23_147, var_23_148) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_147, var_23_148, var_0_5.LuaMenuMPRulesBankRate, var_0_6.LuaMenuMPRulesBankRateDesc, {
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

		local var_23_149 = Lobby.MatchRulesClasses.GrindData
		local var_23_150 = Lobby.MatchRulesMembers.BankCaptureTime

		if arg_23_2 then
			if var_0_4(var_23_149, var_23_150) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_149, var_23_150, var_0_5.LuaMenuMPRulesBankCapture, var_0_6.LuaMenuMPRulesBankCaptureDesc, {
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

		local var_23_151 = Lobby.MatchRulesClasses.GrindData
		local var_23_152 = Lobby.MatchRulesMembers.BankDisable

		if arg_23_2 then
			if var_0_4(var_23_151, var_23_152) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_151, var_23_152, var_0_5.LuaMenuMPRulesBankDisable, var_0_6.LuaMenuMPRulesBankDisableDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_153 = Lobby.MatchRulesClasses.GrindData
		local var_23_154 = Lobby.MatchRulesMembers.BankDisableTags

		if arg_23_2 then
			if var_0_4(var_23_153, var_23_154) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_153, var_23_154, var_0_5.LuaMenuMPRulesBankDisableTags, var_0_6.LuaMenuMPRulesBankDisableTagsDesc, {
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
			}, var_23_144, {
				{
					eventName = "rule_changed_grindData_bankDisable",
					eventFunction = function(arg_35_0, arg_35_1)
						if var_23_144() then
							arg_35_0:SetButtonDisabled(true)
						else
							arg_35_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_155 = Lobby.MatchRulesClasses.GrindData
		local var_23_156 = Lobby.MatchRulesMembers.BankDisableTime

		if arg_23_2 then
			if var_0_4(var_23_155, var_23_156) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_155, var_23_156, var_0_5.LuaMenuMPRulesBankDisableTime, var_0_6.LuaMenuMPRulesBankDisableTimeDesc, {
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
			}, var_23_144, {
				{
					eventName = "rule_changed_grindData_bankDisable",
					eventFunction = function(arg_36_0, arg_36_1)
						if var_23_144() then
							arg_36_0:SetButtonDisabled(true)
						else
							arg_36_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_157 = Lobby.MatchRulesClasses.GrindData
		local var_23_158 = Lobby.MatchRulesMembers.MegaBankLimit

		if arg_23_2 then
			if var_0_4(var_23_157, var_23_158) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_157, var_23_158, var_0_5.LuaMenuMPRulesMegaBankLimit, var_0_6.LuaMenuMPRulesMegaBankLimitDesc, {
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

		local var_23_159 = Lobby.MatchRulesClasses.GrindData
		local var_23_160 = Lobby.MatchRulesMembers.MegaBankBonusKS

		if arg_23_2 then
			if var_0_4(var_23_159, var_23_160) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_159, var_23_160, var_0_5.LuaMenuMPRulesMegaBankBonusKS, var_0_6.LuaMenuMPRulesMegaBankBonusKSDesc, {
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

		local var_23_161 = Lobby.MatchRulesClasses.GrindData
		local var_23_162 = Lobby.MatchRulesMembers.MegaBankBonus

		if arg_23_2 then
			if var_0_4(var_23_161, var_23_162) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_161, var_23_162, var_0_5.LuaMenuMPRulesMegaBankBonus, var_0_6.LuaMenuMPRulesMegaBankBonusDesc, {
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

	if var_23_1 == MP.GameMode.SiegeGameType then
		local function var_23_163()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.SiegeData, Lobby.MatchRulesMembers.RushTimer)
		end

		local var_23_164 = Lobby.MatchRulesClasses.SiegeData
		local var_23_165 = Lobby.MatchRulesMembers.RushTimer

		if arg_23_2 then
			if var_0_4(var_23_164, var_23_165) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_164, var_23_165, var_0_5.LuaMenuMPRulesRushTimer, var_0_6.LuaMenuMPRulesRushTimerDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_166 = Lobby.MatchRulesClasses.SiegeData
		local var_23_167 = Lobby.MatchRulesMembers.RushTimerAmount

		if arg_23_2 then
			if var_0_4(var_23_166, var_23_167) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_166, var_23_167, var_0_5.LuaMenuMPRulesRushTimerAmount, var_0_6.LuaMenuMPRulesRushTimerAmountDesc, {
				var_0_8.LuaMenuMPRulesSeconds30,
				var_0_8.LuaMenuMPRulesSeconds45,
				var_0_8.LuaMenuMPRulesSeconds60,
				var_0_8.LuaMenuMPRulesSeconds90,
				var_0_8.LuaMenuMPRulesSeconds120
			}, var_23_163, {
				{
					eventName = "rule_changed_siegeData_rushTimer",
					eventFunction = function(arg_38_0, arg_38_1)
						if var_23_163() then
							arg_38_0:SetButtonDisabled(true)
						else
							arg_38_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_168 = Lobby.MatchRulesClasses.SiegeData
		local var_23_169 = Lobby.MatchRulesMembers.SharedRushTimer

		if arg_23_2 then
			if var_0_4(var_23_168, var_23_169) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_168, var_23_169, var_0_5.LuaMenuMPRulesSharedRushTimer, var_0_6.LuaMenuMPRulesSharedRushTimerDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}, var_23_163, {
				{
					eventName = "rule_changed_siegeData_rushTimer",
					eventFunction = function(arg_39_0, arg_39_1)
						if var_23_163() then
							arg_39_0:SetButtonDisabled(true)
						else
							arg_39_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_170 = Lobby.MatchRulesClasses.SiegeData
		local var_23_171 = Lobby.MatchRulesMembers.CapRate

		if arg_23_2 then
			if var_0_4(var_23_170, var_23_171) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_170, var_23_171, var_0_5.LuaMenuMPRulesCapRate, var_0_6.LuaMenuMPRulesCapRateDesc, {
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

		local var_23_172 = Lobby.MatchRulesClasses.SiegeData
		local var_23_173 = Lobby.MatchRulesMembers.PreCapPoints

		if arg_23_2 then
			if var_0_4(var_23_172, var_23_173) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_172, var_23_173, var_0_5.LuaMenuMPRulesPreCap, var_0_6.LuaMenuMPRulesPreCapDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_174 = Lobby.MatchRulesClasses.SiegeData
		local var_23_175 = Lobby.MatchRulesMembers.ObjScalar

		if arg_23_2 then
			if var_0_4(var_23_174, var_23_175) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_174, var_23_175, var_0_5.LuaMenuMPRulesObjScalar, var_0_6.LuaMenuMPRulesObjScalarDesc, {
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
	end

	if var_23_1 == MP.GameMode.InfectGameType then
		local var_23_176 = Lobby.MatchRulesClasses.InfectData
		local var_23_177 = Lobby.MatchRulesMembers.NumInitialInfected

		if arg_23_2 then
			if var_0_4(var_23_176, var_23_177) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_176, var_23_177, var_0_5.LuaMenuMPRulesNumInitialInfected, var_0_6.LuaMenuMPRulesNumInitialInfectedDesc, {
				var_0_8.LuaMenuMPRulesNum1,
				var_0_8.LuaMenuMPRulesNum2,
				var_0_8.LuaMenuMPRulesNum3,
				var_0_8.LuaMenuMPRulesNum4,
				var_0_8.LuaMenuMPRulesNum5,
				var_0_8.LuaMenuMPRulesNum6
			}))
		end

		local var_23_178 = Lobby.MatchRulesClasses.InfectData
		local var_23_179 = Lobby.MatchRulesMembers.WeaponSurvivorPrimary

		if arg_23_2 then
			if var_0_4(var_23_178, var_23_179) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_178, var_23_179, var_0_5.LuaMenuMPRulesSurvivorPrimaryWeapon, var_0_6.LuaMenuMPRulesSurvivorPrimaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_23_180 = Lobby.MatchRulesClasses.InfectData
		local var_23_181 = Lobby.MatchRulesMembers.WeaponSurvivorSecondary

		if arg_23_2 then
			if var_0_4(var_23_180, var_23_181) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_180, var_23_181, var_0_5.LuaMenuMPRulesSurvivorSecondaryWeapon, var_0_6.LuaMenuMPRulesSurvivorSecondaryWeaponDesc, {
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
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_23_182 = Lobby.MatchRulesClasses.InfectData
		local var_23_183 = Lobby.MatchRulesMembers.LethalSurvivor

		if arg_23_2 then
			if var_0_4(var_23_182, var_23_183) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_182, var_23_183, var_0_5.LuaMenuMPRulesSurvivorLethal, var_0_6.LuaMenuMPRulesSurvivorLethalDesc, {
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

		local var_23_184 = Lobby.MatchRulesClasses.InfectData
		local var_23_185 = Lobby.MatchRulesMembers.TacticalSurvivor

		if arg_23_2 then
			if var_0_4(var_23_184, var_23_185) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_184, var_23_185, var_0_5.LuaMenuMPRulesSurvivorTactical, var_0_6.LuaMenuMPRulesSurvivorTacticalDesc, {
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

		local var_23_186 = Lobby.MatchRulesClasses.InfectData
		local var_23_187 = Lobby.MatchRulesMembers.SuperSurvivor

		if arg_23_2 then
			if var_0_4(var_23_186, var_23_187) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_186, var_23_187, var_0_5.LuaMenuMPRulesSurvivorSuper, var_0_6.LuaMenuMPRulesSurvivorSuperDesc, {
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

		local var_23_188 = Lobby.MatchRulesClasses.InfectData
		local var_23_189 = Lobby.MatchRulesMembers.SuperSurvivorTwo

		if arg_23_2 then
			if var_0_4(var_23_188, var_23_189) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_188, var_23_189, var_0_5.LuaMenuMPRulesSurvivorSuperTwo, var_0_6.LuaMenuMPRulesSurvivorSuperTwoDesc, {
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

		local var_23_190 = Lobby.MatchRulesClasses.InfectData
		local var_23_191 = Lobby.MatchRulesMembers.WeaponInfectedPrimary

		if arg_23_2 then
			if var_0_4(var_23_190, var_23_191) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_190, var_23_191, var_0_5.LuaMenuMPRulesInfectedPrimaryWeapon, var_0_6.LuaMenuMPRulesInfectedPrimaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_23_192 = Lobby.MatchRulesClasses.InfectData
		local var_23_193 = Lobby.MatchRulesMembers.WeaponInfectSecondary

		if arg_23_2 then
			if var_0_4(var_23_192, var_23_193) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_192, var_23_193, var_0_5.LuaMenuMPRulesInfectedSecondaryWeapon, var_0_6.LuaMenuMPRulesInfectedSecondaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesFists,
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
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis
			}))
		end

		local var_23_194 = Lobby.MatchRulesClasses.InfectData
		local var_23_195 = Lobby.MatchRulesMembers.LethalInfected

		if arg_23_2 then
			if var_0_4(var_23_194, var_23_195) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_194, var_23_195, var_0_5.LuaMenuMPRulesInfectedLethal, var_0_6.LuaMenuMPRulesInfectedLethalDesc, {
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

		local var_23_196 = Lobby.MatchRulesClasses.InfectData
		local var_23_197 = Lobby.MatchRulesMembers.TacticalInfected

		if arg_23_2 then
			if var_0_4(var_23_196, var_23_197) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_196, var_23_197, var_0_5.LuaMenuMPRulesInfectedTactical, var_0_6.LuaMenuMPRulesInfectedTacticalDesc, {
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

		local var_23_198 = Lobby.MatchRulesClasses.InfectData
		local var_23_199 = Lobby.MatchRulesMembers.SuperInfect

		if arg_23_2 then
			if var_0_4(var_23_198, var_23_199) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_198, var_23_199, var_0_5.LuaMenuMPRulesInfectedSuper, var_0_6.LuaMenuMPRulesInfectedSuperDesc, {
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

		local var_23_200 = Lobby.MatchRulesClasses.InfectData
		local var_23_201 = Lobby.MatchRulesMembers.SuperInfectTwo

		if arg_23_2 then
			if var_0_4(var_23_200, var_23_201) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_200, var_23_201, var_0_5.LuaMenuMPRulesInfectedSuperTwo, var_0_6.LuaMenuMPRulesInfectedSuperTwoDesc, {
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

		local var_23_202 = Lobby.MatchRulesClasses.InfectData
		local var_23_203 = Lobby.MatchRulesMembers.WeaponInitialPrimary

		if arg_23_2 then
			if var_0_4(var_23_202, var_23_203) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_202, var_23_203, var_0_5.LuaMenuMPRulesInfectedInitialPrimaryWeapon, var_0_6.LuaMenuMPRulesInfectedInitialPrimaryWeaponDesc, {
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_23_204 = Lobby.MatchRulesClasses.InfectData
		local var_23_205 = Lobby.MatchRulesMembers.WeaponInitialSecondary

		if arg_23_2 then
			if var_0_4(var_23_204, var_23_205) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_204, var_23_205, var_0_5.LuaMenuMPRulesInfectedInitialSecondaryWeapon, var_0_6.LuaMenuMPRulesInfectedInitialSecondaryWeaponDesc, {
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
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
				var_0_8.LuaMenuMPRulesFists,
				var_0_8.LuaMenuMPRulesWeaponNone
			}))
		end

		local var_23_206 = Lobby.MatchRulesClasses.InfectData
		local var_23_207 = Lobby.MatchRulesMembers.InfectExtraTimePerKill

		if arg_23_2 then
			if var_0_4(var_23_206, var_23_207) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_206, var_23_207, var_0_5.LuaMenuMPRulesInfectExtraTimePerKill, var_0_6.LuaMenuMPRulesInfectExtraTimePerKillDesc, {
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

		local var_23_208 = Lobby.MatchRulesClasses.InfectData
		local var_23_209 = Lobby.MatchRulesMembers.SurvivorAliveScore

		if arg_23_2 then
			if var_0_4(var_23_208, var_23_209) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_208, var_23_209, var_0_5.LuaMenuMPRulesSurvivorAliveScore, var_0_6.LuaMenuMPRulesSurvivorAliveScoreDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints100
			}))
		end

		local var_23_210 = Lobby.MatchRulesClasses.InfectData
		local var_23_211 = Lobby.MatchRulesMembers.InfectStreakBonus

		if arg_23_2 then
			if var_0_4(var_23_210, var_23_211) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_210, var_23_211, var_0_5.LuaMenuMPRulesInfectStreakBonus, var_0_6.LuaMenuMPRulesInfectStreakBonusDesc, {
				var_0_8.LuaMenuMPRulesPoints0,
				var_0_8.LuaMenuMPRulesPoints25,
				var_0_8.LuaMenuMPRulesPoints50,
				var_0_8.LuaMenuMPRulesPoints75,
				var_0_8.LuaMenuMPRulesPoints100
			}))
		end

		local var_23_212 = Lobby.MatchRulesClasses.InfectData
		local var_23_213 = Lobby.MatchRulesMembers.GiveTKOnTISpawn

		if arg_23_2 then
			if var_0_4(var_23_212, var_23_213) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_212, var_23_213, var_0_5.LuaMenuMPRulesGiveTKOnTISpawn, var_0_6.LuaMenuMPRulesGiveTKOnTISpawnDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	if var_23_1 == MP.GameMode.RugbyGameType then
		local var_23_214 = Lobby.MatchRulesClasses.RugbyData
		local var_23_215 = Lobby.MatchRulesMembers.JuggCaptureTime

		if arg_23_2 then
			if var_0_4(var_23_214, var_23_215) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_214, var_23_215, var_0_5.LuaMenuMPRulesJuggCaptureTime, var_0_6.LuaMenuMPRulesJuggCaptureTimeDesc, {
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
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_23_216 = Lobby.MatchRulesClasses.RugbyData
		local var_23_217 = Lobby.MatchRulesMembers.JuggHealth

		if arg_23_2 then
			if var_0_4(var_23_216, var_23_217) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_216, var_23_217, var_0_5.LuaMenuMPRulesJuggHealth, var_0_6.LuaMenuMPRulesJuggHealthDesc, {
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

		local var_23_218 = Lobby.MatchRulesClasses.RugbyData
		local var_23_219 = Lobby.MatchRulesMembers.JuggSpeed

		if arg_23_2 then
			if var_0_4(var_23_218, var_23_219) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_218, var_23_219, var_0_5.LuaMenuMPRulesJuggSpeed, var_0_6.LuaMenuMPRulesJuggSpeedDesc, {
				var_0_8.LuaMenuMPRulesJuggSpeedSlowest,
				var_0_8.LuaMenuMPRulesJuggSpeedSlower,
				var_0_8.LuaMenuMPRulesJuggSpeedDefault,
				var_0_8.LuaMenuMPRulesJuggSpeedFaster,
				var_0_8.LuaMenuMPRulesJuggSpeedFastest
			}))
		end

		local var_23_220 = Lobby.MatchRulesClasses.RugbyData
		local var_23_221 = Lobby.MatchRulesMembers.JuggTeamSpeed

		if arg_23_2 then
			if var_0_4(var_23_220, var_23_221) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_220, var_23_221, var_0_5.LuaMenuMPRulesJuggHelperSpeed, var_0_6.LuaMenuMPRulesJuggHelperSpeedDesc, {
				var_0_8.LuaMenuMPRulesJuggTeamSpeedOff,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedSlowest,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedSlower,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedDefault,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedFaster,
				var_0_8.LuaMenuMPRulesJuggTeamSpeedFastest
			}))
		end

		local var_23_222 = Lobby.MatchRulesClasses.RugbyData
		local var_23_223 = Lobby.MatchRulesMembers.HelperMax

		if arg_23_2 then
			if var_0_4(var_23_222, var_23_223) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_222, var_23_223, var_0_5.LuaMenuMPRulesJuggHelper, var_0_6.LuaMenuMPRulesJuggHelperDesc, {
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

		local var_23_224 = Lobby.MatchRulesClasses.RugbyData
		local var_23_225 = Lobby.MatchRulesMembers.JuggTimeout

		if arg_23_2 then
			if var_0_4(var_23_224, var_23_225) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_224, var_23_225, var_0_5.LuaMenuMPRulesJuggLifetime, var_0_6.LuaMenuMPRulesJuggLifetimeDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesMinutes15Sec,
				var_0_8.LuaMenuMPRulesMinutesHalf,
				var_0_8.LuaMenuMPRulesMinutes45Sec,
				var_0_8.LuaMenuMPRulesMinutes1,
				var_0_8.LuaMenuMPRulesMinutes1Half,
				var_0_8.LuaMenuMPRulesMinutes2,
				var_0_8.LuaMenuMPRulesMinutes2Half,
				var_0_8.LuaMenuMPRulesMinutes3,
				var_0_8.LuaMenuMPRulesMinutes3Half,
				var_0_8.LuaMenuMPRulesMinutes4,
				var_0_8.LuaMenuMPRulesMinutes4Half,
				var_0_8.LuaMenuMPRulesMinutes5,
				var_0_8.LuaMenuMPRulesMinutes6,
				var_0_8.LuaMenuMPRulesMinutes7,
				var_0_8.LuaMenuMPRulesMinutes8,
				var_0_8.LuaMenuMPRulesMinutes9,
				var_0_8.LuaMenuMPRulesMinutes10
			}))
		end
	end

	local function var_23_226()
		return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.DmData, Lobby.MatchRulesMembers.AONRules) > 0
	end

	if var_23_1 == MP.GameMode.FFAGameType then
		local var_23_227 = Lobby.MatchRulesClasses.DmData
		local var_23_228 = Lobby.MatchRulesMembers.AONRules

		if arg_23_2 then
			if var_0_4(var_23_227, var_23_228) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_227, var_23_228, var_0_5.LuaMenuMPRulesAON, var_0_6.LuaMenuMPRulesAONDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPAONRulesKnife,
				var_0_8.LuaMenuMPAONRulesAkimboBlades,
				var_0_8.LuaMenuMPAONRulesAkimboBlunt
			}, nil, {
				{
					eventName = "rule_changed_dmData_aonRules",
					eventFunction = function(arg_41_0, arg_41_1)
						if var_23_226() then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MagCount, 0)
							var_0_0(arg_23_0)

							if arg_41_1.refreshOriginButtonID == "" or arg_41_1.refreshOriginButtonID == "option_commonOption_magCount" then
								arg_23_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_41_0
								})
							end
						else
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MagCount, 3)
							var_0_0(arg_23_0)

							if arg_41_1.refreshOriginButtonID == "" or arg_41_1.refreshOriginButtonID == "option_commonOption_magCount" then
								arg_23_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_41_0
								})
							end
						end
					end
				}
			}))
		end
	end

	if var_23_1 == MP.GameMode.TDMGameType or var_23_1 == MP.GameMode.FrontGameType then
		local var_23_229 = Lobby.MatchRulesClasses.CommonOption
		local var_23_230 = Lobby.MatchRulesMembers.SpawnProtectionTimer

		if arg_23_2 then
			if var_0_4(var_23_229, var_23_230) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_229, var_23_230, var_0_5.LuaMenuMPRulesSpawnProtectionTimer, var_0_6.LuaMenuMPRulesSpawnProtectionTimerDesc, {
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

	if var_23_1 == MP.GameMode.GunGameType then
		local var_23_231 = Lobby.MatchRulesClasses.GunData
		local var_23_232 = Lobby.MatchRulesMembers.Setback

		if arg_23_2 then
			if var_0_4(var_23_231, var_23_232) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_231, var_23_232, var_0_5.LuaMenuMPRulesSetback, var_0_6.LuaMenuMPRulesSetbackDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesSetbacks1,
				var_0_8.LuaMenuMPRulesSetbacks2,
				var_0_8.LuaMenuMPRulesSetbacks3,
				var_0_8.LuaMenuMPRulesSetbacks4,
				var_0_8.LuaMenuMPRulesSetbacks5
			}))
		end

		local var_23_233 = Lobby.MatchRulesClasses.GunData
		local var_23_234 = Lobby.MatchRulesMembers.SetbackStreak

		if arg_23_2 then
			if var_0_4(var_23_233, var_23_234) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_233, var_23_234, var_0_5.LuaMenuMPRulesSetbackStreak, var_0_6.LuaMenuMPRulesSetbackStreakDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesDeaths1,
				var_0_8.LuaMenuMPRulesDeaths2,
				var_0_8.LuaMenuMPRulesDeaths3,
				var_0_8.LuaMenuMPRulesDeaths4,
				var_0_8.LuaMenuMPRulesDeaths5
			}))
		end

		local var_23_235 = Lobby.MatchRulesClasses.GunData
		local var_23_236 = Lobby.MatchRulesMembers.KillsPerWeapon

		if arg_23_2 then
			if var_0_4(var_23_235, var_23_236) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_235, var_23_236, var_0_5.LuaMenuMPRulesKillsPerWeapon, var_0_6.LuaMenuMPRulesKillsPerWeaponDesc, {
				var_0_8.LuaMenuMPRulesKills1,
				var_0_8.LuaMenuMPRulesKills2,
				var_0_8.LuaMenuMPRulesKills3,
				var_0_8.LuaMenuMPRulesKills4,
				var_0_8.LuaMenuMPRulesKills5
			}))
		end

		local var_23_237 = Lobby.MatchRulesClasses.GunData
		local var_23_238 = Lobby.MatchRulesMembers.LadderIndex

		if arg_23_2 then
			if var_0_4(var_23_237, var_23_238) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_237, var_23_238, var_0_5.LuaMenuMPRulesLadderIndex, var_0_6.LuaMenuMPRulesLadderIndexDesc, {
				var_0_8.LuaMenuMPRulesLadder1,
				var_0_8.LuaMenuMPRulesLadder2,
				var_0_8.LuaMenuMPRulesLadder3,
				var_0_8.LuaMenuMPRulesLadder4
			}))
		end
	end

	if var_23_1 == MP.GameMode.OICGameType then
		local var_23_239 = Lobby.MatchRulesClasses.OICData
		local var_23_240 = Lobby.MatchRulesMembers.Weapon

		if arg_23_2 then
			if var_0_4(var_23_239, var_23_240) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_239, var_23_240, var_0_5.LuaMenuMPRulesOICWeapon, var_0_6.LuaMenuMPRulesOICWeaponDesc, {
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
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109
			}))
		end

		local var_23_241 = Lobby.MatchRulesClasses.OICData
		local var_23_242 = Lobby.MatchRulesMembers.OneShotKill

		if arg_23_2 then
			if var_0_4(var_23_241, var_23_242) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_241, var_23_242, var_0_5.LuaMenuMPRulesOneShotKill, var_0_6.LuaMenuMPRulesOneShotKillDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end

		local var_23_243 = Lobby.MatchRulesClasses.OICData
		local var_23_244 = Lobby.MatchRulesMembers.InitialAmmoCount

		if arg_23_2 then
			if var_0_4(var_23_243, var_23_244) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_243, var_23_244, var_0_5.LuaMenuMPRulesInitialAmmoCount, var_0_6.LuaMenuMPRulesInitialAmmoCountDesc, {
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

		local var_23_245 = Lobby.MatchRulesClasses.OICData
		local var_23_246 = Lobby.MatchRulesMembers.KillRewardAmmoCount

		if arg_23_2 then
			if var_0_4(var_23_245, var_23_246) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_245, var_23_246, var_0_5.LuaMenuMPRulesKillRewardAmmoCount, var_0_6.LuaMenuMPRulesKillRewardAmmoCountDesc, {
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

	if var_23_1 == MP.GameMode.ArenaGameType then
		local var_23_247 = Lobby.MatchRulesClasses.ArenaData
		local var_23_248 = Lobby.MatchRulesMembers.ArenaSpawnFlag

		if arg_23_2 then
			if var_0_4(var_23_247, var_23_248) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_247, var_23_248, var_0_5.LuaMenuMPRulesArenaSpawnFlag, var_0_6.LuaMenuMPRulesArenaSpawnFlagDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_249 = Lobby.MatchRulesClasses.ArenaData
		local var_23_250 = Lobby.MatchRulesMembers.ArenaObjModifier

		if arg_23_2 then
			if var_0_4(var_23_249, var_23_250) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_249, var_23_250, var_0_5.LuaMenuMPRulesArenaObjModifier, var_0_6.LuaMenuMPRulesArenaObjModifierDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPArenaEndzone
			}))
		end

		local var_23_251 = Lobby.MatchRulesClasses.CommonOption
		local var_23_252 = Lobby.MatchRulesMembers.DogTags

		if arg_23_2 then
			if var_0_4(var_23_251, var_23_252) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_251, var_23_252, var_0_5.LuaMenuMPRulesArenaDogTags, var_0_6.LuaMenuMPRulesArenaDogTagsDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_253 = Lobby.MatchRulesClasses.ArenaData
		local var_23_254 = Lobby.MatchRulesMembers.ArenaWinCondition

		if arg_23_2 then
			if var_0_4(var_23_253, var_23_254) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_253, var_23_254, var_0_5.LuaMenuMPRulesArenaWinCondition, var_0_6.LuaMenuMPRulesArenaWinConditionDesc, {
				var_0_8.LuaMenuMPRulesArenaWinConditionLives,
				var_0_8.LuaMenuMPRulesArenaWinConditionHealth
			}))
		end

		local var_23_255 = Lobby.MatchRulesClasses.ArenaData
		local var_23_256 = Lobby.MatchRulesMembers.SwitchSpawns

		if arg_23_2 then
			if var_0_4(var_23_255, var_23_256) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_255, var_23_256, var_0_5.LuaMenuMPRulesArenaSwitchSpawns, var_0_6.LuaMenuMPRulesArenaSwitchSpawnsDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_257 = Lobby.MatchRulesClasses.ArenaData
		local var_23_258 = Lobby.MatchRulesMembers.ArenaBlastShieldMod

		if arg_23_2 then
			if var_0_4(var_23_257, var_23_258) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_257, var_23_258, var_0_5.LuaMenuMPRulesArenaBlastShieldMod, var_0_6.LuaMenuMPRulesArenaBlastShieldModDesc, {
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

		local var_23_259 = Lobby.MatchRulesClasses.ArenaData
		local var_23_260 = Lobby.MatchRulesMembers.ArenaBlastShieldClamp

		if arg_23_2 then
			if var_0_4(var_23_259, var_23_260) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_259, var_23_260, var_0_5.LuaMenuMPRulesArenaBlastShieldClamp, var_0_6.LuaMenuMPRulesArenaBlastShieldClampDesc, {
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

		local var_23_261 = Lobby.MatchRulesClasses.ArenaData
		local var_23_262 = Lobby.MatchRulesMembers.ArenaTacticalTimeMod

		if arg_23_2 then
			if var_0_4(var_23_261, var_23_262) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_261, var_23_262, var_0_5.LuaMenuMPRulesArenaTacticalTimeMod, var_0_6.LuaMenuMPRulesArenaTacticalTimeModDesc, {
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

		local var_23_263 = Lobby.MatchRulesClasses.ArenaData
		local var_23_264 = Lobby.MatchRulesMembers.ArenaSuper

		if arg_23_2 then
			if var_0_4(var_23_263, var_23_264) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_263, var_23_264, var_0_5.LuaMenuMPRulesArenaSuper, var_0_6.LuaMenuMPRulesArenaSuperDesc, {
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesSuperAmmoBox,
				var_0_8.LuaMenuMPRulesSuperReconDrone,
				var_0_8.LuaMenuMPRulesSuperDeadSilence,
				var_0_8.LuaMenuMPRulesSuperStoppingPower,
				var_0_8.LuaMenuMPRulesSuperTrophy,
				var_0_8.LuaMenuMPRulesSuperTacCover,
				var_0_8.LuaMenuMPRulesSuperTacInsert,
				var_0_8.LuaMenuMPRulesSuperEmpDrone,
				var_0_8.LuaMenuMPRulesSuperWeaponDrop
			}))
		end

		local function var_23_265()
			return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.ArenaData, Lobby.MatchRulesMembers.ArenaLoadouts) ~= 3 and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.ArenaData, Lobby.MatchRulesMembers.ArenaLoadouts) ~= 14
		end

		local var_23_266 = Lobby.MatchRulesClasses.ArenaData
		local var_23_267 = Lobby.MatchRulesMembers.ArenaLoadouts

		if arg_23_2 then
			if var_0_4(var_23_266, var_23_267) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_266, var_23_267, var_0_5.LuaMenuMPRulesArenaLoadouts, var_0_6.LuaMenuMPRulesArenaLoadoutsDesc, {
				var_0_8.LuaMenuMPRulesArenaLoadoutsNormal,
				var_0_8.LuaMenuMPRulesArenaLoadoutsRandom,
				var_0_8.LuaMenuMPRulesArenaLoadoutsBlueprint,
				var_0_8.LuaMenuMPRulesArenaLoadoutsBlueprintCustom,
				var_0_8.LuaMenuMPRulesArenaLoadoutsRandomNoAttachments,
				var_0_8.LuaMenuMPRulesArenaLoadoutsNone,
				var_0_8.LuaMenuMPRulesArenaLoadoutsPickupBlueprint
			}, nil, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_43_0, arg_43_1)
						if var_23_265() then
							ACTIONS.AnimateSequence(arg_23_0, "HideMiniMap")
							var_0_0(arg_23_0)

							if arg_43_1.refreshOriginButtonID and arg_43_1.refreshOriginButtonID == "" or arg_43_1.refreshOriginButtonID == "option_arenaData_arenaLoadouts" then
								arg_23_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_43_0
								})
							end
						else
							local var_43_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
							local var_43_1 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_43_0, CSV.mpMapTable.cols.arenaMenuMinimap)

							if var_43_1 ~= "" then
								arg_23_0.ArenaPickupMinimap.MiniMap:setImage(RegisterMaterial(var_43_1))
								ACTIONS.AnimateSequence(arg_23_0, "ShowMiniMap")
							end

							var_0_0(arg_23_0)

							if arg_43_1.refreshOriginButtonID and arg_43_1.refreshOriginButtonID == "" or arg_43_1.refreshOriginButtonID == "option_arenaData_arenaLoadouts" then
								arg_23_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_43_0
								})
							end
						end
					end
				}
			}))
		end

		local var_23_268 = Lobby.MatchRulesClasses.ArenaData
		local var_23_269 = Lobby.MatchRulesMembers.LoadoutChangeRound

		if arg_23_2 then
			if var_0_4(var_23_268, var_23_269) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_268, var_23_269, var_0_5.LuaMenuMPRulesLoadoutChangeRound, var_0_6.LuaMenuMPRulesLoadoutChangeRoundDesc, {
				var_0_8.LuaMenuRulesEvery3Rounds,
				var_0_8.LuaMenuRulesEvery4Rounds,
				var_0_8.LuaMenuRulesEvery5Rounds,
				var_0_8.LuaMenuRulesNever,
				var_0_8.LuaMenuRulesEveryRound,
				var_0_8.LuaMenuRulesEvery2Rounds
			}))
		end

		local var_23_270 = Lobby.MatchRulesClasses.ArenaData
		local var_23_271 = Lobby.MatchRulesMembers.StartWeapon

		if arg_23_2 then
			if var_0_4(var_23_270, var_23_271) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_270, var_23_271, var_0_5.LuaMenuMPRulesStartWeapon, var_0_6.LuaMenuMPRulesStartWeaponDesc, {
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
				var_0_8.LuaMenuMPRulesWeaponRandomMelee,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_44_0, arg_44_1)
						if var_23_265() then
							arg_44_0:SetButtonDisabled(true)
						else
							arg_44_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_272 = Lobby.MatchRulesClasses.ArenaData
		local var_23_273 = Lobby.MatchRulesMembers.WeaponTier1

		if arg_23_2 then
			if var_0_4(var_23_272, var_23_273) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_272, var_23_273, var_0_5.LuaMenuMPRulesWeaponTier1, var_0_6.LuaMenuMPRulesWeaponTier1Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomMelee,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_45_0, arg_45_1)
						if var_23_265() then
							arg_45_0:SetButtonDisabled(true)
						else
							arg_45_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_274 = Lobby.MatchRulesClasses.ArenaData
		local var_23_275 = Lobby.MatchRulesMembers.WeaponTier2

		if arg_23_2 then
			if var_0_4(var_23_274, var_23_275) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_274, var_23_275, var_0_5.LuaMenuMPRulesWeaponTier2, var_0_6.LuaMenuMPRulesWeaponTier2Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomMelee,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_46_0, arg_46_1)
						if var_23_265() then
							arg_46_0:SetButtonDisabled(true)
						else
							arg_46_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_276 = Lobby.MatchRulesClasses.ArenaData
		local var_23_277 = Lobby.MatchRulesMembers.WeaponTier3

		if arg_23_2 then
			if var_0_4(var_23_276, var_23_277) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_276, var_23_277, var_0_5.LuaMenuMPRulesWeaponTier3, var_0_6.LuaMenuMPRulesWeaponTier3Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun,
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomMelee,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_47_0, arg_47_1)
						if var_23_265() then
							arg_47_0:SetButtonDisabled(true)
						else
							arg_47_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_278 = Lobby.MatchRulesClasses.ArenaData
		local var_23_279 = Lobby.MatchRulesMembers.WeaponTier4

		if arg_23_2 then
			if var_0_4(var_23_278, var_23_279) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_278, var_23_279, var_0_5.LuaMenuMPRulesWeaponTier4, var_0_6.LuaMenuMPRulesWeaponTier4Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomAR,
				var_0_8.LuaMenuMPRulesWeaponRandomLMG,
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomMelee,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
				var_0_8.LuaMenuMPRulesDecoyGrenade,
				var_0_8.LuaMenuMPRulesStimShot,
				var_0_8.LuaMenuMPRulesWeaponNone,
				var_0_8.LuaMenuMPRulesWeaponRandom,
				var_0_8.LuaMenuMPRulesWeaponRandomWeapon,
				var_0_8.LuaMenuMPRulesWeaponRandomPrimary,
				var_0_8.LuaMenuMPRulesWeaponRandomHandgun,
				var_0_8.LuaMenuMPRulesWeaponRandomSMG,
				var_0_8.LuaMenuMPRulesWeaponRandomShotgun
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_48_0, arg_48_1)
						if var_23_265() then
							arg_48_0:SetButtonDisabled(true)
						else
							arg_48_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_280 = Lobby.MatchRulesClasses.ArenaData
		local var_23_281 = Lobby.MatchRulesMembers.WeaponTier5

		if arg_23_2 then
			if var_0_4(var_23_280, var_23_281) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_280, var_23_281, var_0_5.LuaMenuMPRulesWeaponTier5, var_0_6.LuaMenuMPRulesWeaponTier5Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomSniper,
				var_0_8.LuaMenuMPRulesWeaponRandomDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomSniperDMR,
				var_0_8.LuaMenuMPRulesWeaponRandomMelee,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_49_0, arg_49_1)
						if var_23_265() then
							arg_49_0:SetButtonDisabled(true)
						else
							arg_49_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_282 = Lobby.MatchRulesClasses.ArenaData
		local var_23_283 = Lobby.MatchRulesMembers.WeaponTier6

		if arg_23_2 then
			if var_0_4(var_23_282, var_23_283) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_282, var_23_283, var_0_5.LuaMenuMPRulesWeaponTier6, var_0_6.LuaMenuMPRulesWeaponTier6Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
				var_0_8.LuaMenuMPRulesWeaponRandomMelee
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_50_0, arg_50_1)
						if var_23_265() then
							arg_50_0:SetButtonDisabled(true)
						else
							arg_50_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_284 = Lobby.MatchRulesClasses.ArenaData
		local var_23_285 = Lobby.MatchRulesMembers.WeaponTier7

		if arg_23_2 then
			if var_0_4(var_23_284, var_23_285) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_284, var_23_285, var_0_5.LuaMenuMPRulesWeaponTier7, var_0_6.LuaMenuMPRulesWeaponTier7Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
				var_0_8.LuaMenuMPRulesWeaponRandomMelee,
				var_0_8.LuaMenuMPRulesWeaponRandomLethal
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_51_0, arg_51_1)
						if var_23_265() then
							arg_51_0:SetButtonDisabled(true)
						else
							arg_51_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_286 = Lobby.MatchRulesClasses.ArenaData
		local var_23_287 = Lobby.MatchRulesMembers.WeaponTier8

		if arg_23_2 then
			if var_0_4(var_23_286, var_23_287) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_286, var_23_287, var_0_5.LuaMenuMPRulesWeaponTier8, var_0_6.LuaMenuMPRulesWeaponTier8Desc, {
				var_0_8.LuaMenuMPRulesWeaponRandomLethal,
				var_0_8.LuaMenuMPRulesWeaponRandomTactical,
				var_0_8.LuaMenuMPRulesWeaponRandomLauncher,
				var_0_8.LuaMenuMPRulesROMEO870,
				var_0_8.LuaMenuMPRulesDPAPA12,
				var_0_8.LuaMenuMPRulesCHARLIE725,
				var_0_8.LuaMenuMPRulesOSCAR12,
				var_0_8.LuaMenuMPRulesMIKE26,
				var_0_8.LuaMenuMPRulesAALPHA12,
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
				var_0_8.LuaMenuMPRulesVALPHA,
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
				var_0_8.LuaMenuMPRulesSIERRAX,
				var_0_8.LuaMenuMPRulesSBETA,
				var_0_8.LuaMenuMPRulesMIKE14,
				var_0_8.LuaMenuMPRulesKILO98,
				var_0_8.LuaMenuMPRulesSKSIERRA,
				var_0_8.LuaMenuMPRulesCROSSBOW,
				var_0_8.LuaMenuMPRulesROMEO700,
				var_0_8.LuaMenuMPRulesALPHA50,
				var_0_8.LuaMenuMPRulesDELTA,
				var_0_8.LuaMenuMPRulesHDR,
				var_0_8.LuaMenuMPRulesXMIKE109,
				var_0_8.LuaMenuMPRulesKnife,
				var_0_8.LuaMenuMPRulesKaliSticks,
				var_0_8.LuaMenuMPRulesKodachis,
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
				var_0_8.LuaMenuMPRulesWeaponRandomMelee
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_52_0, arg_52_1)
						if var_23_265() then
							arg_52_0:SetButtonDisabled(true)
						else
							arg_52_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_23_288 = Lobby.MatchRulesClasses.ArenaData
		local var_23_289 = Lobby.MatchRulesMembers.ArenaAttachments

		if arg_23_2 then
			if var_0_4(var_23_288, var_23_289) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_288, var_23_289, var_0_5.LuaMenuMPRulesArenaAttachments, var_0_6.LuaMenuMPRulesArenaAttachmentsDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesArenaAttachmentsSniperScopes
			}, var_23_265, {
				{
					eventName = "rule_changed_arenaData_arenaLoadouts",
					eventFunction = function(arg_53_0, arg_53_1)
						if var_23_265() then
							arg_53_0:SetButtonDisabled(true)
						else
							arg_53_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end
	end

	if var_23_1 == MP.GameMode.CMDGameType then
		local var_23_290 = Lobby.MatchRulesClasses.CMDData
		local var_23_291 = Lobby.MatchRulesMembers.CmdRules

		if arg_23_2 then
			if var_0_4(var_23_290, var_23_291) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_290, var_23_291, var_0_5.LuaMenuMPRulesCMDRules, var_0_6.LuaMenuMPRulesCMDRulesDesc, {
				var_0_8.LuaMenuMPRulesNormalCMD,
				var_0_8.LuaMenuMPRulesBreakThroughCMD
			}))
		end

		local var_23_292 = Lobby.MatchRulesClasses.CMDData
		local var_23_293 = Lobby.MatchRulesMembers.ActivationDelayCenter

		if arg_23_2 then
			if var_0_4(var_23_292, var_23_293) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_292, var_23_293, var_0_5.LuaMenuMPRulesActivationDelayCenter, var_0_6.LuaMenuMPRulesActivationDelayCenterDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_23_294 = Lobby.MatchRulesClasses.CMDData
		local var_23_295 = Lobby.MatchRulesMembers.CaptureDurationCenter

		if arg_23_2 then
			if var_0_4(var_23_294, var_23_295) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_294, var_23_295, var_0_5.LuaMenuMPRulesCaptureDurationCenter, var_0_6.LuaMenuMPRulesCaptureDurationCenterDesc, {
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

		local var_23_296 = Lobby.MatchRulesClasses.CMDData
		local var_23_297 = Lobby.MatchRulesMembers.HoldDurationCenter

		if arg_23_2 then
			if var_0_4(var_23_296, var_23_297) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_296, var_23_297, var_0_5.LuaMenuMPRulesHoldDurationCenter, var_0_6.LuaMenuMPRulesHoldDurationCenterDesc, {
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

		local var_23_298 = Lobby.MatchRulesClasses.CMDData
		local var_23_299 = Lobby.MatchRulesMembers.ActivationDelayHalf

		if arg_23_2 then
			if var_0_4(var_23_298, var_23_299) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_298, var_23_299, var_0_5.LuaMenuMPRulesActivationDelayHalf, var_0_6.LuaMenuMPRulesActivationDelayHalfDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_23_300 = Lobby.MatchRulesClasses.CMDData
		local var_23_301 = Lobby.MatchRulesMembers.CaptureDurationHalf

		if arg_23_2 then
			if var_0_4(var_23_300, var_23_301) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_300, var_23_301, var_0_5.LuaMenuMPRulesCaptureDurationHalf, var_0_6.LuaMenuMPRulesCaptureDurationHalfDesc, {
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

		local var_23_302 = Lobby.MatchRulesClasses.CMDData
		local var_23_303 = Lobby.MatchRulesMembers.HoldDurationHalf

		if arg_23_2 then
			if var_0_4(var_23_302, var_23_303) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_302, var_23_303, var_0_5.LuaMenuMPRulesHoldDurationHalf, var_0_6.LuaMenuMPRulesHoldDurationHalfDesc, {
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

		local var_23_304 = Lobby.MatchRulesClasses.CMDData
		local var_23_305 = Lobby.MatchRulesMembers.ActivationDelayBase

		if arg_23_2 then
			if var_0_4(var_23_304, var_23_305) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_304, var_23_305, var_0_5.LuaMenuMPRulesActivationDelayBase, var_0_6.LuaMenuMPRulesActivationDelayBaseDesc, {
				var_0_8.LuaMenuMPRulesNearInstant,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds20,
				var_0_8.LuaMenuMPRulesSeconds25,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_23_306 = Lobby.MatchRulesClasses.CMDData
		local var_23_307 = Lobby.MatchRulesMembers.CaptureDurationBase

		if arg_23_2 then
			if var_0_4(var_23_306, var_23_307) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_306, var_23_307, var_0_5.LuaMenuMPRulesCaptureDurationBase, var_0_6.LuaMenuMPRulesCaptureDurationBaseDesc, {
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

		local var_23_308 = Lobby.MatchRulesClasses.CMDData
		local var_23_309 = Lobby.MatchRulesMembers.HoldDurationBase

		if arg_23_2 then
			if var_0_4(var_23_308, var_23_309) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_308, var_23_309, var_0_5.LuaMenuMPRulesHoldDurationBase, var_0_6.LuaMenuMPRulesHoldDurationBaseDesc, {
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

		local var_23_310 = Lobby.MatchRulesClasses.CMDData
		local var_23_311 = Lobby.MatchRulesMembers.JuggSpawnBehavior

		if arg_23_2 then
			if var_0_4(var_23_310, var_23_311) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_310, var_23_311, var_0_5.LuaMenuMPRulesJuggSpawnBehavior, var_0_6.LuaMenuMPRulesJuggSpawnBehaviorDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesJuggSpawnAttackers,
				var_0_8.LuaMenuMPRulesJuggSpawnDefenders,
				var_0_8.LuaMenuMPRulesJuggSpawnBoth
			}))
		end

		local var_23_312 = Lobby.MatchRulesClasses.CTFData
		local var_23_313 = Lobby.MatchRulesMembers.CaptureCondition

		if arg_23_2 then
			if var_0_4(var_23_312, var_23_313) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_312, var_23_313, var_0_5.LuaMenuMPRulesCMDHVT, var_0_6.LuaMenuMPRulesCMDHVTDesc, {
				var_0_8.LuaMenuMPRulesCMDHVTDisabled,
				var_0_8.LuaMenuMPRulesCMDHVTSchool,
				var_0_8.LuaMenuMPRulesCMDHVTEmbassy
			}))
		end
	end

	if var_23_1 == MP.GameMode.HVTGameType then
		local var_23_314 = Lobby.MatchRulesClasses.HVTData
		local var_23_315 = Lobby.MatchRulesMembers.HVTCaptureValue

		if arg_23_2 then
			if var_0_4(var_23_314, var_23_315) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_314, var_23_315, var_0_5.LuaMenuMPRulesHVTCaptureValue, var_0_6.LuaMenuMPRulesHVTCaptureValueDesc, {
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

	if var_23_1 == MP.GameMode.HVTGameType then
		local var_23_316 = Lobby.MatchRulesClasses.HVTData
		local var_23_317 = Lobby.MatchRulesMembers.HVTTargetCount

		if arg_23_2 then
			if var_0_4(var_23_316, var_23_317) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_316, var_23_317, var_0_5.LuaMenuMPRulesHVTTargetCount, var_0_6.LuaMenuMPRulesHVTTargetCountDesc, {
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

	if MP.IsBRGameType(var_23_1) then
		local var_23_318 = Lobby.MatchRulesClasses.BrData
		local var_23_319 = Lobby.MatchRulesMembers.StartingWeapon

		if arg_23_2 then
			if var_0_4(var_23_318, var_23_319) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_318, var_23_319, var_0_5.LuaMenuMPRulesBRStartingWeapon, var_0_6.LuaMenuMPRulesBRStartingWeaponDesc, {
				var_0_8.LuaMenuMPRulesBRStartWeapon0,
				var_0_8.LuaMenuMPRulesBRStartWeapon1,
				var_0_8.LuaMenuMPRulesBRStartWeapon2,
				var_0_8.LuaMenuMPRulesBRStartWeapon3,
				var_0_8.LuaMenuMPRulesBRStartWeapon4
			}))
		end

		local var_23_320 = Lobby.MatchRulesClasses.BrData
		local var_23_321 = Lobby.MatchRulesMembers.Gulag

		if arg_23_2 then
			if var_0_4(var_23_320, var_23_321) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_320, var_23_321, var_0_5.LuaMenuMPRulesBrGulag, var_0_6.LuaMenuMPRulesBrGulagDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_322 = Lobby.MatchRulesClasses.BrData
		local var_23_323 = Lobby.MatchRulesMembers.CircleDamageMultiplier

		if arg_23_2 then
			if var_0_4(var_23_322, var_23_323) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_322, var_23_323, var_0_5.LuaMenuMPRulesBrCircleDamageMultiplier, var_0_6.LuaMenuMPRulesBrCircleDamageMultiplierDesc, {
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

		local var_23_324 = Lobby.MatchRulesClasses.BrData
		local var_23_325 = Lobby.MatchRulesMembers.InfilC130

		if arg_23_2 then
			if var_0_4(var_23_324, var_23_325) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_324, var_23_325, var_0_5.LuaMenuMPRulesBrInfilC130, var_0_6.LuaMenuMPRulesBrInfilC130Desc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_326 = Lobby.MatchRulesClasses.BrData
		local var_23_327 = Lobby.MatchRulesMembers.InfilConvoy

		if arg_23_2 then
			if var_0_4(var_23_326, var_23_327) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_326, var_23_327, var_0_5.LuaMenuMPRulesBrInfilConvoy, var_0_6.LuaMenuMPRulesBrInfilConvoyDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_328 = Lobby.MatchRulesClasses.BrData
		local var_23_329 = Lobby.MatchRulesMembers.InfilHeli

		if arg_23_2 then
			if var_0_4(var_23_328, var_23_329) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_328, var_23_329, var_0_5.LuaMenuMPRulesBrInfilHeli, var_0_6.LuaMenuMPRulesBrInfilHeliDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_23_330 = Lobby.MatchRulesClasses.BrData
		local var_23_331 = Lobby.MatchRulesMembers.CrateDropTimer

		if arg_23_2 then
			if var_0_4(var_23_330, var_23_331) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_330, var_23_331, var_0_5.LuaMenuMPRulesCrateDropTimer, var_0_6.LuaMenuMPRulesCrateDropTimerDesc, {
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

	if MP.IsBRLootSupportedGameType(var_23_1) then
		if MP.IsBRGameType(var_23_1) then
			Dvar.BDEHAEGHAF("RKMMNSQKO", "mp/loot_item_defs.csv")
		end

		local function var_23_332()
			return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.EnableBrLoot) == true
		end

		local var_23_333 = Lobby.MatchRulesClasses.CommonOption
		local var_23_334 = Lobby.MatchRulesMembers.EnableBrLoot

		if arg_23_2 then
			if var_0_4(var_23_333, var_23_334) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_333, var_23_334, var_0_5.LuaMenuMPRulesEnableBrLoot, var_0_6.LuaMenuMPRulesEnableBrLootDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}, nil, {
				{
					eventName = "rule_changed_commonOption_enableBrLoot",
					eventFunction = function(arg_55_0, arg_55_1)
						if var_23_332() then
							if MP.IsBRGameType(var_23_1) then
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

	if var_23_1 == MP.GameMode.CyberGameType then
		local var_23_335 = Lobby.MatchRulesClasses.CyberData
		local var_23_336 = Lobby.MatchRulesMembers.EmpSpawn

		if arg_23_2 then
			if var_0_4(var_23_335, var_23_336) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_335, var_23_336, var_0_5.LuaMenuMPRulesEmpSpawn, var_0_6.LuaMenuMPRulesEmpSpawnDesc, {
				var_0_8.LuaMenuMPRulesCyberEMPSpawnRandom,
				var_0_8.LuaMenuMPRulesCyberEMPSpawnLinear,
				var_0_8.LuaMenuMPRulesCyberEMPSpawnOne,
				var_0_8.LuaMenuMPRulesCyberEMPSpawnTwo,
				var_0_8.LuaMenuMPRulesCyberEMPSpawnThree
			}))
		end

		local var_23_337 = Lobby.MatchRulesClasses.CyberData
		local var_23_338 = Lobby.MatchRulesMembers.RadarPingTime

		if arg_23_2 then
			if var_0_4(var_23_337, var_23_338) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_337, var_23_338, var_0_5.LuaMenuMPRulesRadarPingTime, var_0_6.LuaMenuMPRulesRadarPingTimeDesc, {
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
					eventFunction = function(arg_56_0, arg_56_1)
						local var_56_0 = MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CyberData, Lobby.MatchRulesMembers.RadarPingTime)

						Dvar.DFIJDJFIFD("NMPRQQMSNN", var_56_0)
					end
				}
			}))
		end

		local var_23_339 = Lobby.MatchRulesClasses.CyberData
		local var_23_340 = Lobby.MatchRulesMembers.PersBombTimer

		if arg_23_2 then
			if var_0_4(var_23_339, var_23_340) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_339, var_23_340, var_0_5.LuaMenuMPRulesPersBombTimer, var_0_6.LuaMenuMPRulesPersBombTimerDesc, {
				var_0_8.LuaMenuMPDisabledStaticTimer,
				var_0_8.LuaMenuMPEnabledPersTimer
			}))
		end

		local var_23_341 = Lobby.MatchRulesClasses.CyberData
		local var_23_342 = Lobby.MatchRulesMembers.DetonateScore

		if arg_23_2 then
			if var_0_4(var_23_341, var_23_342) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_341, var_23_342, var_0_5.LuaMenuMPRulesDetonateScore, var_0_6.LuaMenuMPRulesDetonateScoreDesc, {
				var_0_8.LuaMenuMPRulesPoints1,
				var_0_8.LuaMenuMPRulesPoints2,
				var_0_8.LuaMenuMPRulesPoints3,
				var_0_8.LuaMenuMPRulesPoints4,
				var_0_8.LuaMenuMPRulesPoints5
			}))
		end
	end

	if var_23_1 == MP.GameMode.TJuggGameType then
		local var_23_343 = Lobby.MatchRulesClasses.TjuggData
		local var_23_344 = Lobby.MatchRulesMembers.JuggSwitchTime

		if arg_23_2 then
			if var_0_4(var_23_343, var_23_344) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_343, var_23_344, var_0_5.LuaMenuMPRulesJuggSwitchTime, var_0_6.LuaMenuMPRulesJuggSwitchTimeDesc, {
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

		local var_23_345 = Lobby.MatchRulesClasses.TjuggData
		local var_23_346 = Lobby.MatchRulesMembers.PointsPerKillAsJugg

		if arg_23_2 then
			if var_0_4(var_23_345, var_23_346) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_345, var_23_346, var_0_5.LuaMenuMPRulesPointsPerKillAsJugg, var_0_6.LuaMenuMPRulesPointsPerKillAsJuggDesc, {
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

		local var_23_347 = Lobby.MatchRulesClasses.TjuggData
		local var_23_348 = Lobby.MatchRulesMembers.PointsPerJuggKill

		if arg_23_2 then
			if var_0_4(var_23_347, var_23_348) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_347, var_23_348, var_0_5.LuaMenuMPRulesPointsPerJuggKill, var_0_6.LuaMenuMPRulesPointsPerJuggKillDesc, {
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

		local var_23_349 = Lobby.MatchRulesClasses.TjuggData
		local var_23_350 = Lobby.MatchRulesMembers.PointsPerJuggOnJuggKill

		if arg_23_2 then
			if var_0_4(var_23_349, var_23_350) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_349, var_23_350, var_0_5.LuaMenuMPRulesPointsPerJuggOnJuggKill, var_0_6.LuaMenuMPRulesPointsPerJuggOnJuggKillDesc, {
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

	if var_23_1 == MP.GameMode.BTMGameType then
		local var_23_351 = Lobby.MatchRulesClasses.BtmData
		local var_23_352 = Lobby.MatchRulesMembers.PointsPerKillAsJugg

		if arg_23_2 then
			if var_0_4(var_23_351, var_23_352) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_351, var_23_352, var_0_5.LuaMenuMPRulesPointsPerKillAsJugg, var_0_6.LuaMenuMPRulesPointsPerKillAsJuggDesc, {
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

		local var_23_353 = Lobby.MatchRulesClasses.BtmData
		local var_23_354 = Lobby.MatchRulesMembers.PointsPerJuggKill

		if arg_23_2 then
			if var_0_4(var_23_353, var_23_354) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_353, var_23_354, var_0_5.LuaMenuMPRulesPointsPerJuggKill, var_0_6.LuaMenuMPRulesPointsPerJuggKillDesc, {
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

		local var_23_355 = Lobby.MatchRulesClasses.BtmData
		local var_23_356 = Lobby.MatchRulesMembers.PointsPerJuggOnJuggKill

		if arg_23_2 then
			if var_0_4(var_23_355, var_23_356) then
				return true
			end
		else
			table.insert(var_23_0, var_0_19(arg_23_0, arg_23_1, var_23_355, var_23_356, var_0_5.LuaMenuMPRulesPointsPerJuggOnJuggKill, var_0_6.LuaMenuMPRulesPointsPerJuggOnJuggKillDesc, {
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

	if arg_23_2 then
		return false
	else
		return var_23_0
	end
end

local function var_0_21(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = {}
	local var_57_1 = Lobby.GetCurrentGameType()

	local function var_57_2()
		return not MLG.AreMLGRulesEnabled()
	end

	local var_57_3 = Lobby.MatchRulesClasses.CommonOption
	local var_57_4 = Lobby.MatchRulesMembers.DraftLoadoutTimer

	if arg_57_2 then
		if var_0_4(var_57_3, var_57_4) then
			return true
		end
	else
		table.insert(var_57_0, var_0_19(arg_57_0, arg_57_1, var_57_3, var_57_4, var_0_5.LuaMenuMPRulesDraftLoadoutTimer, var_0_6.LuaMenuMPRulesDraftLoadoutTimerDesc, {
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
		}, var_57_2))
	end

	if arg_57_2 then
		return false
	else
		return var_57_0
	end
end

local function var_0_22(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = {}
	local var_59_1 = Lobby.GetCurrentGameType()
	local var_59_2
	local var_59_3

	if var_59_1 == MP.GameMode.BRGameType then
		local var_59_4 = Lobby.MatchRulesClasses.CommonOption
		local var_59_5 = Lobby.MatchRulesMembers.TeamSize

		if arg_59_2 then
			if var_0_4(var_59_4, var_59_5) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_4, var_59_5, var_0_5.LuaMenuMPRulesTeamSize, var_0_6.LuaMenuMPRulesTeamSizeDesc, {
				var_0_8.LuaMenuMPRulesTeamSize1,
				var_0_8.LuaMenuMPRulesTeamSize2,
				var_0_8.LuaMenuMPRulesTeamSize3,
				var_0_8.LuaMenuMPRulesTeamSize4
			}))
		end
	end

	if var_59_1 == MP.GameMode.DomGameType then
		local var_59_6 = Lobby.MatchRulesClasses.CommonOption
		local var_59_7 = Lobby.MatchRulesMembers.RoundLimit

		if arg_59_2 then
			if var_0_4(var_59_6, var_59_7) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_6, var_59_7, var_0_5.LuaMenuMPRulesRoundLimit, var_0_6.LuaMenuMPRulesRoundLimitDesc, {
				var_0_8.LuaMenuMPRulesRounds1,
				var_0_8.LuaMenuMPRulesRounds2
			}))
		end
	end

	if var_59_1 == MP.GameMode.DomGameType then
		local var_59_8 = Lobby.MatchRulesClasses.CommonOption
		local var_59_9 = Lobby.MatchRulesMembers.RoundSwitch

		if arg_59_2 then
			if var_0_4(var_59_8, var_59_9) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_8, var_59_9, var_0_5.LuaMenuMPRulesRoundSwitch, var_0_6.LuaMenuMPRulesRoundSwitchDesc, {
				var_0_8.LuaMenuRulesNever,
				var_0_8.LuaMenuRulesEveryRound
			}))
		end
	end

	if MP.IsTimeLimitGameType(var_59_1) and var_59_1 ~= MP.GameMode.BRGameType then
		local var_59_10 = Lobby.MatchRulesClasses.CommonOption
		local var_59_11 = Lobby.MatchRulesMembers.TimeLimit

		if arg_59_2 then
			if var_0_4(var_59_10, var_59_11) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_10, var_59_11, var_0_5.LuaMenuMPRulesTimeLimit, var_0_6.LuaMenuMPRulesTimeLimitDesc, {
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

	if MP.IsShortTimeLimitGameType(var_59_1) then
		local var_59_12 = Lobby.MatchRulesClasses.CommonOption
		local var_59_13 = Lobby.MatchRulesMembers.TimeLimit

		if arg_59_2 then
			if var_0_4(var_59_12, var_59_13) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_12, var_59_13, var_0_5.LuaMenuMPRulesTimeLimit, var_0_6.LuaMenuMPRulesTimeLimitDesc, {
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

	if MP.IsHighRoundTimeLimitGameType(var_59_1) then
		local var_59_14 = Lobby.MatchRulesClasses.CommonOption
		local var_59_15 = Lobby.MatchRulesMembers.TimeLimit

		if arg_59_2 then
			if var_0_4(var_59_14, var_59_15) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_14, var_59_15, var_0_5.LuaMenuMPRulesRoundTimeLimit, var_0_6.LuaMenuMPRulesRoundTimeLimitDesc, {
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

	if var_59_1 == MP.GameMode.RushGameType then
		local var_59_16 = Lobby.MatchRulesClasses.RushData
		local var_59_17 = Lobby.MatchRulesMembers.ActivationDelay

		if arg_59_2 then
			if var_0_4(var_59_16, var_59_17) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_16, var_59_17, var_0_5.LuaMenuMPRulesActivationDelay, var_0_6.LuaMenuMPRulesActivationDelayDesc, {
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

		local var_59_18 = Lobby.MatchRulesClasses.RushData
		local var_59_19 = Lobby.MatchRulesMembers.CaptureDuration

		if arg_59_2 then
			if var_0_4(var_59_18, var_59_19) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_18, var_59_19, var_0_5.LuaMenuMPRulesCaptureDuration, var_0_6.LuaMenuMPRulesCaptureDurationDesc, {
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

		local var_59_20 = Lobby.MatchRulesClasses.RushData
		local var_59_21 = Lobby.MatchRulesMembers.ExtraTimeBonus

		if arg_59_2 then
			if var_0_4(var_59_20, var_59_21) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_20, var_59_21, var_0_5.LuaMenuMPRulesExtraTimeBonus, var_0_6.LuaMenuMPRulesExtraTimeBonusDesc, {
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

	if MP.IsLowRoundTimeLimitGameType(var_59_1) then
		local var_59_22 = Lobby.MatchRulesClasses.CommonOption
		local var_59_23 = Lobby.MatchRulesMembers.TimeLimit

		if arg_59_2 then
			if var_0_4(var_59_22, var_59_23) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_22, var_59_23, var_0_5.LuaMenuMPRulesRoundTimeLimit, var_0_6.LuaMenuMPRulesRoundTimeLimitDesc, {
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

	if var_59_1 == MP.GameMode.FrontGameType or var_59_1 == MP.GameMode.DomGameType or var_59_1 == MP.GameMode.BallGameType or var_59_1 == MP.GameMode.ArmsRaceGameType or var_59_1 == MP.GameMode.TDefGameType then
		local var_59_24 = Lobby.MatchRulesClasses.CommonOption
		local var_59_25 = Lobby.MatchRulesMembers.ScoreLimit

		if arg_59_2 then
			if var_0_4(var_59_24, var_59_25) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_24, var_59_25, var_0_5.LuaMenuMPRulesRoundScoreLimit, var_0_6.LuaMenuMPRulesRoundScoreLimitDesc, {
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

	if var_59_1 == MP.GameMode.TDMGameType or var_59_1 == MP.GameMode.MPZombiesGameType or var_59_1 == MP.GameMode.HardpointGameType or var_59_1 == MP.GameMode.HQGameType or var_59_1 == MP.GameMode.GrndGameType or var_59_1 == MP.GameMode.FFAGameType or var_59_1 == MP.GameMode.ConfGameType or var_59_1 == MP.GameMode.GrindGameType or var_59_1 == MP.GameMode.EscapeGameType or var_59_1 == MP.GameMode.HVTGameType or var_59_1 == MP.GameMode.TJuggGameType then
		local var_59_26 = Lobby.MatchRulesClasses.CommonOption
		local var_59_27 = Lobby.MatchRulesMembers.ScoreLimit

		if arg_59_2 then
			if var_0_4(var_59_26, var_59_27) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_26, var_59_27, var_0_5.LuaMenuMPRulesScoreLimit, var_0_6.LuaMenuMPRulesScoreLimitDesc, {
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

	if var_59_1 == MP.GameMode.CTFGameType or var_59_1 == MP.GameMode.BlitzGameType then
		local var_59_28 = Lobby.MatchRulesClasses.CommonOption
		local var_59_29 = Lobby.MatchRulesMembers.ScoreLimit

		if arg_59_2 then
			if var_0_4(var_59_28, var_59_29) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_28, var_59_29, var_0_5.LuaMenuMPRulesRoundScoreLimit, var_0_6.LuaMenuMPRulesRoundScoreLimitDesc, {
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

	if var_59_1 == MP.GameMode.AliensGameType then
		local var_59_30 = Lobby.MatchRulesClasses.CommonOption
		local var_59_31 = Lobby.MatchRulesMembers.ScoreLimit

		if arg_59_2 then
			if var_0_4(var_59_30, var_59_31) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_30, var_59_31, var_0_5.LuaMenuMPRulesScoreLimit, var_0_6.LuaMenuMPRulesScoreLimitDesc, {
				var_0_8.LuaMenuRulesUnlimited,
				var_0_8.LuaMenuMPRulesPoints1000
			}))
		end
	end

	if var_59_1 == MP.GameMode.SDGameType or var_59_1 == MP.GameMode.SRGameType or var_59_1 == MP.GameMode.SiegeGameType or var_59_1 == MP.GameMode.ArenaGameType or var_59_1 == MP.GameMode.CyberGameType then
		local var_59_32 = Lobby.MatchRulesClasses.CommonOption
		local var_59_33 = Lobby.MatchRulesMembers.WinLimit

		if arg_59_2 then
			if var_0_4(var_59_32, var_59_33) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_32, var_59_33, var_0_5.LuaMenuMPRulesWinLimit, var_0_6.LuaMenuMPRulesWinLimitDesc, {
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
			}, nil, {
				{
					eventName = "rule_changed_commonOption_winLimit",
					eventFunction = function(arg_60_0, arg_60_1)
						if var_0_14() then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.WinByTwoEnabled, false)
							var_0_0(arg_59_0)

							if arg_60_1.refreshOriginButtonID == "" or arg_60_1.refreshOriginButtonID == "option_commonOption_winByTwoEnabled" then
								arg_59_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_60_0
								})
							end
						end
					end
				}
			}))
		end
	end

	if var_59_1 == MP.GameMode.SDGameType or var_59_1 == MP.GameMode.SRGameType or var_59_1 == MP.GameMode.SiegeGameType or var_59_1 == MP.GameMode.ArenaGameType then
		local var_59_34 = Lobby.MatchRulesClasses.CommonOption
		local var_59_35 = Lobby.MatchRulesMembers.WinByTwoEnabled

		if arg_59_2 then
			if var_0_4(var_59_34, var_59_35) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_34, var_59_35, var_0_5.LuaMenuMPRulesWinByTwoEnabled, var_0_6.LuaMenuMPRulesWinByTwoEnabledDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}, var_0_14, {
				{
					eventName = "rule_changed_commonOption_winLimit",
					eventFunction = function(arg_61_0, arg_61_1)
						if var_0_14() then
							arg_61_0:SetButtonDisabled(true)
						else
							arg_61_0:SetButtonDisabled(false)
						end
					end
				}
			}))
		end

		local var_59_36 = Lobby.MatchRulesClasses.CommonOption
		local var_59_37 = Lobby.MatchRulesMembers.WinByTwoMaxRounds

		if arg_59_2 then
			if var_0_4(var_59_36, var_59_37) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_36, var_59_37, var_0_5.LuaMenuMPRulesWinByTwoMaxRounds, var_0_6.LuaMenuMPRulesWinByTwoMaxRoundsDesc, {
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

	if var_59_1 == MP.GameMode.SDGameType or var_59_1 == MP.GameMode.SRGameType or var_59_1 == MP.GameMode.SiegeGameType or var_59_1 == MP.GameMode.ArenaGameType or var_59_1 == MP.GameMode.CyberGameType then
		local var_59_38 = Lobby.MatchRulesClasses.CommonOption
		local var_59_39 = Lobby.MatchRulesMembers.RoundSwitch

		if arg_59_2 then
			if var_0_4(var_59_38, var_59_39) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_38, var_59_39, var_0_5.LuaMenuMPRulesRoundSwitch, var_0_6.LuaMenuMPRulesRoundSwitchDesc, {
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

	if var_59_1 ~= MP.GameMode.BRGameType then
		local var_59_40 = Lobby.MatchRulesClasses.CommonOption
		local var_59_41 = Lobby.MatchRulesMembers.MatchStartTime

		if arg_59_2 then
			if var_0_4(var_59_40, var_59_41) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_40, var_59_41, var_0_5.LuaMenuMPRulesMatchStartTime, var_0_6.LuaMenuMPRulesMatchStartTimeDesc, {
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
					eventFunction = function(arg_62_0, arg_62_1)
						if not var_0_13() then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.InfilSkip, true)
							var_0_0(arg_59_0)

							if arg_62_1.refreshOriginButtonID == "" or arg_62_1.refreshOriginButtonID == "option_commonOption_infilSkip" then
								arg_59_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_62_0
								})
							end
						end
					end
				}
			}))
		end
	end

	if MP.IsRoundBasedGameType(var_59_1) then
		local var_59_42 = Lobby.MatchRulesClasses.CommonOption
		local var_59_43 = Lobby.MatchRulesMembers.RoundStartTime

		if arg_59_2 then
			if var_0_4(var_59_42, var_59_43) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_42, var_59_43, var_0_5.LuaMenuMPRulesRoundStartTime, var_0_6.LuaMenuMPRulesRoundStartTimeDesc, {
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

	local var_59_44 = Lobby.MatchRulesClasses.CommonOption
	local var_59_45 = Lobby.MatchRulesMembers.InfilSkip

	if arg_59_2 then
		if var_0_4(var_59_44, var_59_45) then
			return true
		end
	else
		table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_44, var_59_45, var_0_5.LuaMenuMPRulesInfilSkip, var_0_6.LuaMenuMPRulesInfilSkipDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}, nil, {
			{
				eventName = "rule_changed_commonOption_infilSkip",
				eventFunction = function(arg_63_0, arg_63_1)
					if not var_0_12() then
						if MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MatchStartTime) ~= 15 then
							MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.MatchStartTime, 15)
						end

						var_0_0(arg_59_0)

						if arg_63_1.refreshOriginButtonID == "" or arg_63_1.refreshOriginButtonID == "option_commonOption_matchStartTime" then
							arg_59_0.GameSetupCategoryOptions:processEvent({
								name = "refresh_button_values",
								button = arg_63_0
							})
						end
					end
				end
			}
		}))
	end

	if var_59_1 == MP.GameMode.SDGameType or var_59_1 == MP.GameMode.CyberGameType or var_59_1 == MP.GameMode.ArenaGameType or var_59_1 == MP.GameMode.SiegeGameType then
		local var_59_46 = Lobby.MatchRulesClasses.CommonOption
		local var_59_47 = Lobby.MatchRulesMembers.PracticeRound

		if arg_59_2 then
			if var_0_4(var_59_46, var_59_47) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_46, var_59_47, var_0_5.LuaMenuMPRulesPracticeRound, var_0_6.LuaMenuMPRulesPracticeRoundDesc, {
				var_0_8.LuaMenuMPEnabled,
				var_0_8.LuaMenuMPDisabled
			}))
		end
	end

	local var_59_48 = Lobby.MatchRulesClasses.CommonOption
	local var_59_49 = Lobby.MatchRulesMembers.InputSwapEnabled

	if arg_59_2 then
		if var_0_4(var_59_48, var_59_49) then
			return true
		end
	else
		table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_48, var_59_49, var_0_5.LuaMenuMPRulesAllowInputSwap, var_0_6.LuaMenuMPRulesAllowInputSwapDesc, {
			var_0_8.LuaMenuMPEnabled,
			var_0_8.LuaMenuMPDisabled
		}, nil, {
			{
				eventName = "rule_changed_commonOption_inputSwapEnabled",
				eventFunction = function(arg_64_0, arg_64_1)
					Dvar.DHEGHJJJHI("NNPMRQSQN", arg_64_1.value)
				end
			}
		}))
	end

	local var_59_50 = Lobby.MatchRulesClasses.CommonOption
	local var_59_51 = Lobby.MatchRulesMembers.CDLTuning

	if arg_59_2 then
		if var_0_4(var_59_50, var_59_51) then
			return true
		end
	else
		table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_50, var_59_51, var_0_5.LuaMenuMPRulesCDLTuning, var_0_6.LuaMenuMPRulesCDLTuningDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}))
	end

	if Dvar.IBEGCHEFE("NRMMRSMNPS") then
		local var_59_52 = Lobby.MatchRulesClasses.CommonOption
		local var_59_53 = Lobby.MatchRulesMembers.CODCastingEnabled

		local function var_59_54()
			local var_65_0 = Lobby.GetCurrentGameType()

			if var_65_0 == MP.GameMode.TDMGameType or var_65_0 == MP.GameMode.CyberGameType or var_65_0 == MP.GameMode.DomGameType or var_65_0 == MP.GameMode.SDGameType or var_65_0 == MP.GameMode.HQGameType or var_65_0 == MP.GameMode.ArenaGameType or var_65_0 == MP.GameMode.HardpointGameType or var_65_0 == MP.GameMode.CTFGameType then
				return false
			end

			return true
		end

		local var_59_55 = {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}

		if var_59_54() then
			var_59_55 = {
				var_0_8.LuaMenuMPDisabled
			}
		end

		if arg_59_2 then
			if var_0_4(var_59_52, var_59_53) then
				return true
			end
		else
			table.insert(var_59_0, var_0_19(arg_59_0, arg_59_1, var_59_52, var_59_53, var_0_5.LuaMenuMPRulesCODCastingEnabled, var_0_6.LuaMenuMPRulesCODCastingEnabledDesc, var_59_55, var_59_54, {
				{
					eventName = "rule_changed_commonOption_codcasterEnabled",
					eventFunction = function(arg_66_0, arg_66_1)
						CODCASTER.SetCODCastingEnabled(arg_66_1.value)
					end
				}
			}))
		end
	end

	if arg_59_2 then
		return false
	else
		return var_59_0
	end
end

local function var_0_23(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = {}
	local var_67_1 = Lobby.GetCurrentGameType()

	local function var_67_2()
		return MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.NumLives) == 1
	end

	local var_67_3 = Lobby.MatchRulesClasses.CommonOption
	local var_67_4 = Lobby.MatchRulesMembers.NumLives

	if var_67_1 ~= MP.GameMode.InfectGameType and var_67_1 ~= MP.GameMode.DemoGameType then
		if arg_67_2 then
			if var_0_4(var_67_3, var_67_4) then
				return true
			end
		else
			table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_3, var_67_4, var_0_5.LuaMenuMPRulesNumberOfLives, var_0_6.LuaMenuMPRulesNumberOfLivesDesc, {
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
					eventFunction = function(arg_69_0, arg_69_1)
						if not var_67_2() then
							if MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.LastStand) == 2 then
								MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.LastStand, 1)
								var_0_0(arg_67_0)
							end

							if arg_69_1.refreshOriginButtonID and (arg_69_1.refreshOriginButtonID == "" or arg_69_1.refreshOriginButtonID == "option_commonOption_lastStand") then
								arg_67_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_69_0
								})
							end
						end
					end
				}
			}))
		end
	end

	local var_67_5 = Lobby.MatchRulesClasses.CommonOption
	local var_67_6 = Lobby.MatchRulesMembers.MaxHealth

	if arg_67_2 then
		if var_0_4(var_67_5, var_67_6) then
			return true
		end
	else
		table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_5, var_67_6, var_0_5.LuaMenuMPRulesMaxHealth, var_0_6.LuaMenuMPRulesMaxHealthDesc, {
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

	local var_67_7 = Lobby.MatchRulesClasses.CommonOption
	local var_67_8 = Lobby.MatchRulesMembers.HealthRegen

	if arg_67_2 then
		if var_0_4(var_67_7, var_67_8) then
			return true
		end
	else
		table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_7, var_67_8, var_0_5.LuaMenuMPRulesHealthRegen, var_0_6.LuaMenuMPRulesHealthRegenDesc, {
			var_0_8.LuaMenuRulesNone,
			var_0_8.LuaMenuRulesRegenVerySlow,
			var_0_8.LuaMenuRulesRegenSlow,
			var_0_8.LuaMenuRulesRegenNormal,
			var_0_8.LuaMenuRulesRegenFast
		}))
	end

	local var_67_9 = Lobby.MatchRulesClasses.CommonOption
	local var_67_10 = Lobby.MatchRulesMembers.DisableSuperSprint

	if arg_67_2 then
		if var_0_4(var_67_9, var_67_10) then
			return true
		end
	else
		table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_9, var_67_10, var_0_5.LuaMenuMPRulesDisableSuperSprint, var_0_6.LuaMenuMPRulesDisableSuperSprintDesc, {
			var_0_8.LuaMenuMPEnabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	local var_67_11 = Lobby.MatchRulesClasses.CommonOption
	local var_67_12 = Lobby.MatchRulesMembers.DisableMount

	if arg_67_2 then
		if var_0_4(var_67_11, var_67_12) then
			return true
		end
	else
		table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_11, var_67_12, var_0_5.LuaMenuMPRulesDisableMount, var_0_6.LuaMenuMPRulesDisableMountDesc, {
			var_0_8.LuaMenuMPEnabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	if var_67_1 ~= MP.GameMode.FFAGameType and var_67_1 ~= MP.GameMode.InfectGameType and var_67_1 ~= MP.GameMode.GunGameType and var_67_1 ~= MP.GameMode.OICGameType then
		local var_67_13 = Lobby.MatchRulesClasses.CommonOption
		local var_67_14 = Lobby.MatchRulesMembers.LastStand

		if arg_67_2 then
			if var_0_4(var_67_13, var_67_14) then
				return true
			end
		else
			table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_13, var_67_14, var_0_5.LuaMenuMPRulesLastStand, var_0_6.LuaMenuMPRulesLastStandDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesLastStandNormal,
				var_0_8.LuaMenuMPRulesLastStandAllowRevive
			}, nil, {
				{
					eventName = "rule_changed_commonOption_lastStand",
					eventFunction = function(arg_70_0, arg_70_1)
						if var_0_10() then
							if MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.NumLives) ~= 1 then
								MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.NumLives, 1)
							end

							var_0_0(arg_67_0)

							if arg_70_1.refreshOriginButtonID and (arg_70_1.refreshOriginButtonID == "" or arg_70_1.refreshOriginButtonID == "option_commonOption_numLives") then
								arg_67_0.GameSetupCategoryOptions:processEvent({
									name = "refresh_button_values",
									button = arg_70_0
								})
							end
						end
					end
				}
			}))
		end

		local var_67_15 = Lobby.MatchRulesClasses.CommonOption
		local var_67_16 = Lobby.MatchRulesMembers.EnemyDeathLoc

		if arg_67_2 then
			if var_0_4(var_67_15, var_67_16) then
				return true
			end
		else
			table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_15, var_67_16, var_0_5.LuaMenuMPRulesEnemyDeathLoc, var_0_6.LuaMenuMPRulesEnemyDeathLocDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_67_17 = Lobby.MatchRulesClasses.CommonOption
		local var_67_18 = Lobby.MatchRulesMembers.LastStandHealth

		if arg_67_2 then
			if var_0_4(var_67_17, var_67_18) then
				return true
			end
		else
			table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_17, var_67_18, var_0_5.LuaMenuMPRulesLastStandHealth, var_0_6.LuaMenuMPRulesLastStandHealthDesc, {
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

		local var_67_19 = Lobby.MatchRulesClasses.CommonOption
		local var_67_20 = Lobby.MatchRulesMembers.LastStandReviveHealth

		if arg_67_2 then
			if var_0_4(var_67_19, var_67_20) then
				return true
			end
		else
			table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_19, var_67_20, var_0_5.LuaMenuMPRulesLastStandReviveHealth, var_0_6.LuaMenuMPRulesLastStandReviveHealthDesc, {
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

		local var_67_21 = Lobby.MatchRulesClasses.CommonOption
		local var_67_22 = Lobby.MatchRulesMembers.LastStandTimer

		if arg_67_2 then
			if var_0_4(var_67_21, var_67_22) then
				return true
			end
		else
			table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_21, var_67_22, var_0_5.LuaMenuMPRulesLastStandTimer, var_0_6.LuaMenuMPRulesLastStandTimerDesc, {
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

		local var_67_23 = Lobby.MatchRulesClasses.CommonOption
		local var_67_24 = Lobby.MatchRulesMembers.LastStandReviveTimer

		if arg_67_2 then
			if var_0_4(var_67_23, var_67_24) then
				return true
			end
		else
			table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_23, var_67_24, var_0_5.LuaMenuMPRulesLastStandReviveTimer, var_0_6.LuaMenuMPRulesLastStandReviveTimerDesc, {
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

		local var_67_25 = Lobby.MatchRulesClasses.CommonOption
		local var_67_26 = Lobby.MatchRulesMembers.LastStandSuicideTimer

		if arg_67_2 then
			if var_0_4(var_67_25, var_67_26) then
				return true
			end
		else
			table.insert(var_67_0, var_0_19(arg_67_0, arg_67_1, var_67_25, var_67_26, var_0_5.LuaMenuMPRulesLastStandSuicideTimer, var_0_6.LuaMenuMPRulesLastStandSuicideTimerDesc, {
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

	if arg_67_2 then
		return false
	else
		return var_67_0
	end
end

local function var_0_24(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = {}
	local var_71_1 = Lobby.GetCurrentGameType()
	local var_71_2 = Lobby.MatchRulesClasses.CommonOption
	local var_71_3 = Lobby.MatchRulesMembers.SpectateModeAllowed

	if arg_71_2 then
		if var_0_4(var_71_2, var_71_3) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_2, var_71_3, var_0_5.LuaMenuMPRulesSpectating, var_0_6.LuaMenuMPRulesSpectatingDesc, {
			var_0_8.LuaMenuMPDisabledNumValue,
			var_0_8.LuaMenuMPRulesSpectating,
			var_0_8.LuaMenuRulesFree
		}))
	end

	local var_71_4 = Lobby.MatchRulesClasses.CommonOption
	local var_71_5 = Lobby.MatchRulesMembers.Spectate3rdAllowed

	if arg_71_2 then
		if var_0_4(var_71_4, var_71_5) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_4, var_71_5, var_0_5.LuaMenuMPRules3rdSpectating, var_0_6.LuaMenuMPRules3rdSpectatingDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}))
	end

	local var_71_6 = Lobby.MatchRulesClasses.CommonOption
	local var_71_7 = Lobby.MatchRulesMembers.ShowKillcam

	if arg_71_2 then
		if var_0_4(var_71_6, var_71_7) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_6, var_71_7, var_0_5.LuaMenuMPRulesKillcam, var_0_6.LuaMenuMPRulesKillcamDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}))
	end

	local var_71_8 = Lobby.MatchRulesClasses.CommonOption
	local var_71_9 = Lobby.MatchRulesMembers.KillcamType

	if arg_71_2 then
		if var_0_4(var_71_8, var_71_9) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_8, var_71_9, var_0_5.LuaMenuMPRulesKillcamType, var_0_6.LuaMenuMPRulesKillcamTypeDesc, {
			var_0_8.LuaMenuMPRulesFinalKillPotG,
			var_0_8.LuaMenuMPRulesFinalKillFK,
			var_0_8.LuaMenuMPRulesFinalKillDisabled
		}))
	end

	local var_71_10 = Lobby.MatchRulesClasses.CommonOption
	local var_71_11 = Lobby.MatchRulesMembers.EnableMiniMap

	if arg_71_2 then
		if var_0_4(var_71_10, var_71_11) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_10, var_71_11, var_0_5.LuaMenuMPRulesEnableMiniMap, var_0_6.LuaMenuMPRulesEnableMiniMapDesc, {
			var_0_8.LuaMPMenuNo,
			var_0_8.LuaMenuMPYes
		}))
	end

	local var_71_12 = Lobby.MatchRulesClasses.CommonOption
	local var_71_13 = Lobby.MatchRulesMembers.RadarAlwaysOn

	if arg_71_2 then
		if var_0_4(var_71_12, var_71_13) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_12, var_71_13, var_0_5.LuaMenuMPRulesRadarAlwaysOn, var_0_6.LuaMenuMPRulesRadarAlwaysOnDesc, {
			var_0_8.LuaMenuMPDisabledNumValue,
			var_0_8.LuaMenuMPRulesRadarNormalSweep,
			var_0_8.LuaMenuMPRulesRadarFastSweep,
			var_0_8.LuaMenuMPRulesRadarConstantOn,
			var_0_8.LuaMenuMPRulesRadarDirectional
		}))
	end

	local var_71_14 = Lobby.MatchRulesClasses.CommonOption
	local var_71_15 = Lobby.MatchRulesMembers.RadarHideShots

	if arg_71_2 then
		if var_0_4(var_71_14, var_71_15) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_14, var_71_15, var_0_5.LuaMenuMPRulesRadarHideShots, var_0_6.LuaMenuMPRulesRadarHideShotsDesc, {
			var_0_8.LuaMenuMPRulesRadarHidePings0,
			var_0_8.LuaMenuMPRulesRadarHidePings1,
			var_0_8.LuaMenuMPRulesRadarHidePings2
		}))
	end

	local var_71_16 = Lobby.MatchRulesClasses.CommonOption
	local var_71_17 = Lobby.MatchRulesMembers.CompassHidePings

	if arg_71_2 then
		if var_0_4(var_71_16, var_71_17) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_16, var_71_17, var_0_5.LuaMenuMPRulesCompassHideShots, var_0_6.LuaMenuMPRulesCompassHideShotsDesc, {
			var_0_8.LuaMenuMPRulesCompassHidePings0,
			var_0_8.LuaMenuMPRulesCompassHidePings1,
			var_0_8.LuaMenuMPRulesCompassHidePings2
		}))
	end

	local var_71_18 = Lobby.MatchRulesClasses.CommonOption
	local var_71_19 = Lobby.MatchRulesMembers.CompassHideEnemy

	if arg_71_2 then
		if var_0_4(var_71_18, var_71_19) then
			return true
		end
	else
		table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_18, var_71_19, var_0_5.LuaMenuMPRulesCompassHideEnemy, var_0_6.LuaMenuMPRulesCompassHideEnemyDesc, {
			var_0_8.LuaMenuMPDisabledValueTrue,
			var_0_8.LuaMenuMPEnabledValueFalse
		}))
	end

	if var_71_1 ~= MP.GameMode.InfectGameType and var_71_1 ~= MP.GameMode.GunGameType then
		local var_71_20 = Lobby.MatchRulesClasses.CommonOption
		local var_71_21 = Lobby.MatchRulesMembers.RespawnDelay

		if arg_71_2 then
			if var_0_4(var_71_20, var_71_21) then
				return true
			end
		else
			table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_20, var_71_21, var_0_5.LuaMenuMPRulesRespawnDelay, var_0_6.LuaMenuMPRulesRespawnDelayDesc, {
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

		local var_71_22 = Lobby.MatchRulesClasses.CommonOption
		local var_71_23 = Lobby.MatchRulesMembers.WaveRespawnDelay

		if arg_71_2 then
			if var_0_4(var_71_22, var_71_23) then
				return true
			end
		else
			table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_22, var_71_23, var_0_5.LuaMenuMPRulesWaveDelay, var_0_6.LuaMenuMPRulesWaveDelayDesc, {
				var_0_8.LuaMenuRulesNone,
				var_0_8.LuaMenuMPRulesSeconds5,
				var_0_8.LuaMenuMPRulesSeconds10,
				var_0_8.LuaMenuMPRulesSeconds15,
				var_0_8.LuaMenuMPRulesSeconds30
			}))
		end

		local var_71_24 = Lobby.MatchRulesClasses.CommonOption
		local var_71_25 = Lobby.MatchRulesMembers.SuicideSpawnDelay

		if arg_71_2 then
			if var_0_4(var_71_24, var_71_25) then
				return true
			end
		else
			table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_24, var_71_25, var_0_5.LuaMenuMPRulesSuicideSpawnDelay, var_0_6.LuaMenuMPRulesSuicideSpawnDelayDesc, {
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

		local var_71_26 = Lobby.MatchRulesClasses.CommonOption
		local var_71_27 = Lobby.MatchRulesMembers.ForceRespawn

		if arg_71_2 then
			if var_0_4(var_71_26, var_71_27) then
				return true
			end
		else
			table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_26, var_71_27, var_0_5.LuaMenuMPRulesForceRespawn, var_0_6.LuaMenuMPRulesForceRespawnDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		if Lobby.IsCurrentGameTypeteamBased() then
			local var_71_28 = Lobby.MatchRulesClasses.CommonOption
			local var_71_29 = Lobby.MatchRulesMembers.TeamAssignmentAllowed

			if arg_71_2 then
				if var_0_4(var_71_28, var_71_29) then
					return true
				end
			else
				table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_28, var_71_29, var_0_5.LuaMenuMPRulesTeamAssignmentAllowed, var_0_6.LuaMenuMPRulesTeamAssignmentAllowedDesc, {
					var_0_8.LuaMenuMPDisabled,
					var_0_8.LuaMenuMPEnabled
				}, nil, {
					{
						eventName = "rule_changed_commonOption_teamAssignmentAllowed",
						eventFunction = function(arg_72_0, arg_72_1)
							Dvar.DHEGHJJJHI("NQORMNOQQM", arg_72_1.value)
							Lobby.DIHECGCADG(arg_72_1.value)
						end
					}
				}))
			end

			if not Engine.ECAJCAJJGF() then
				local var_71_30 = Lobby.MatchRulesClasses.CommonOption
				local var_71_31 = Lobby.MatchRulesMembers.FriendlyFire

				if arg_71_2 then
					if var_0_4(var_71_30, var_71_31) then
						return true
					end
				else
					table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_30, var_71_31, var_0_5.LuaMenuMPRulesFriendlyFire, var_0_6.LuaMenuMPRulesFriendlyFireDesc, {
						var_0_8.LuaMenuMPDisabledNumValue,
						var_0_8.LuaMenuMPEnabledNumValue,
						var_0_8.LuaMenuMPRulesFFReflect,
						var_0_8.LuaMenuMPRulesFFShare,
						var_0_8.LuaMenuMPRulesFFPunish
					}))
				end

				local var_71_32 = Lobby.MatchRulesClasses.CommonOption
				local var_71_33 = Lobby.MatchRulesMembers.FFPunishLimit

				if arg_71_2 then
					if var_0_4(var_71_32, var_71_33) then
						return true
					end
				else
					table.insert(var_71_0, var_0_19(arg_71_0, arg_71_1, var_71_32, var_71_33, var_0_5.LuaMenuMPRulesFFPunishLimit, var_0_6.LuaMenuMPRulesFFPunishLimitDesc, {
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

	if arg_71_2 then
		return false
	else
		return var_71_0
	end
end

local function var_0_25(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = {}
	local var_73_1 = Lobby.GetCurrentGameType()
	local var_73_2 = Lobby.MatchRulesClasses.CommonOption
	local var_73_3 = Lobby.MatchRulesMembers.DisableSpawnCamera

	if arg_73_2 then
		if var_0_4(var_73_2, var_73_3) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_2, var_73_3, var_0_5.LuaMenuMPRulesDisableSpawnCamera, var_0_6.LuaMenuMPRulesDisableSpawnCameraDesc, {
			var_0_8.LuaMenuMPEnabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	local var_73_4 = Lobby.MatchRulesClasses.CommonOption
	local var_73_5 = Lobby.MatchRulesMembers.HardcoreModeOn

	if arg_73_2 then
		if var_0_4(var_73_4, var_73_5) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_4, var_73_5, var_0_5.LuaMenuMPRulesHardcore, var_0_6.LuaMenuMPRulesHardcoreDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}, nil, {
			{
				eventName = "rule_changed_commonOption_hardcoreModeOn",
				eventFunction = function(arg_74_0, arg_74_1)
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
						var_0_0(arg_73_0)

						if arg_74_1.refreshOriginButtonID == "" or arg_74_1.refreshOriginButtonID == "option_commonOption_tacticalMode" or arg_74_1.refreshOriginButtonID == "option_commonOption_hardcoreModeOn" then
							arg_73_0.GameSetupCategoryOptions:processEvent({
								name = "refresh_button_values",
								button = arg_74_0
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
						var_0_0(arg_73_0)

						if arg_74_1.refreshOriginButtonID == "" or arg_74_1.refreshOriginButtonID == "option_commonOption_tacticalMode" or arg_74_1.refreshOriginButtonID == "option_commonOption_hardcoreModeOn" then
							arg_73_0.GameSetupCategoryOptions:processEvent({
								name = "refresh_button_values",
								button = arg_74_0
							})
						end
					end
				end
			}
		}))
	end

	local var_73_6 = Lobby.MatchRulesClasses.CommonOption
	local var_73_7 = Lobby.MatchRulesMembers.TacticalModeOn

	if arg_73_2 then
		if var_0_4(var_73_6, var_73_7) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_6, var_73_7, var_0_5.LuaMenuMPRulesTacticalMode, var_0_6.LuaMenuMPRulesTacticalModeDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}, nil, {
			{
				eventName = "rule_changed_commonOption_tacticalMode",
				eventFunction = function(arg_75_0, arg_75_1)
					if var_0_11() then
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HardcoreModeOn, false)
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.EnableMiniMap, false)
						MatchRules.CIGFFEAEFD("commonOption", "nameplateSetting", 1)
					else
						MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.EnableMiniMap, true)
						MatchRules.CIGFFEAEFD("commonOption", "nameplateSetting", 0)
					end

					var_0_0(arg_73_0)

					if arg_75_1.refreshOriginButtonID == "" or arg_75_1.refreshOriginButtonID == "option_commonOption_hardcoreModeOn" or arg_75_1.refreshOriginButtonID == "option_commonOption_tacticalMode" then
						arg_73_0.GameSetupCategoryOptions:processEvent({
							name = "refresh_button_values",
							button = arg_75_0
						})
					end
				end
			}
		}))
	end

	local var_73_8 = Lobby.MatchRulesClasses.CommonOption
	local var_73_9 = Lobby.MatchRulesMembers.MagCount

	if arg_73_2 then
		if var_0_4(var_73_8, var_73_9) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_8, var_73_9, var_0_5.LuaMenuMPRulesMagCount, var_0_6.LuaMenuMPRulesMagCountDesc, {
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

	local var_73_10 = Lobby.MatchRulesClasses.CommonOption
	local var_73_11 = Lobby.MatchRulesMembers.HeadshotsOnly

	if arg_73_2 then
		if var_0_4(var_73_10, var_73_11) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_10, var_73_11, var_0_5.LuaMenuMPRulesHeadshotsOnly, var_0_6.LuaMenuMPRulesHeadshotsOnlyDesc, {
			var_0_8.LuaMenuMPDisabled,
			var_0_8.LuaMenuMPEnabled
		}))
	end

	if not Engine.ECAJCAJJGF() then
		local var_73_12 = Lobby.MatchRulesClasses.CommonOption
		local var_73_13 = Lobby.MatchRulesMembers.Vampirism

		if arg_73_2 then
			if var_0_4(var_73_12, var_73_13) then
				return true
			end
		else
			table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_12, var_73_13, var_0_5.LuaMenuMPRulesVampirism, var_0_6.LuaMenuMPRulesVampirismDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end
	end

	local var_73_14 = Lobby.MatchRulesClasses.CommonOption
	local var_73_15 = Lobby.MatchRulesMembers.CrankedBombTimer

	if arg_73_2 then
		if var_0_4(var_73_14, var_73_15) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_14, var_73_15, var_0_5.LuaMenuMPRulesCrankedTimer, var_0_6.LuaMenuMPRulesCrankedTimerDesc, {
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

	if var_73_1 ~= MP.GameMode.GunGameType then
		local var_73_16 = Lobby.MatchRulesClasses.CommonOption
		local var_73_17 = Lobby.MatchRulesMembers.AllowSupers

		if arg_73_2 then
			if var_0_4(var_73_16, var_73_17) then
				return true
			end
		else
			table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_16, var_73_17, var_0_5.LuaMenuMPRulesAllowSupers, var_0_6.LuaMenuMPRulesAllowSupersDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local var_73_18 = Lobby.MatchRulesClasses.CommonOption
		local var_73_19 = Lobby.MatchRulesMembers.SuperFastChargeRate

		if arg_73_2 then
			if var_0_4(var_73_18, var_73_19) then
				return true
			end
		else
			table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_18, var_73_19, var_0_5.LuaMenuMPRulesSuperFastChargeRate, var_0_6.LuaMenuMPRulesSuperFastChargeRateDesc, {
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

		local var_73_20 = Lobby.MatchRulesClasses.CommonOption
		local var_73_21 = Lobby.MatchRulesMembers.SuperPointsMod

		if arg_73_2 then
			if var_0_4(var_73_20, var_73_21) then
				return true
			end
		else
			table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_20, var_73_21, var_0_5.LuaMenuMPRulesSuperPointsMod, var_0_6.LuaMenuMPRulesSuperPointsModDesc, {
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

	if var_73_1 ~= MP.GameMode.InfectGameType and var_73_1 ~= MP.GameMode.GunGameType then
		local var_73_22 = Lobby.MatchRulesClasses.CommonOption
		local var_73_23 = Lobby.MatchRulesMembers.AllowPerks

		if arg_73_2 then
			if var_0_4(var_73_22, var_73_23) then
				return true
			end
		else
			table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_22, var_73_23, var_0_5.LuaMenuMPRulesPerks, var_0_6.LuaMenuMPRulesPerksDesc, {
				var_0_8.LuaMenuMPDisabled,
				var_0_8.LuaMenuMPEnabled
			}))
		end

		local function var_73_24()
			return not MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.AllowKillstreaks)
		end

		if MP.IsKillstreakSupportedGameType(var_73_1) and MP.IsNotKillstreakRestrictedMap() then
			local var_73_25 = Lobby.MatchRulesClasses.CommonOption
			local var_73_26 = Lobby.MatchRulesMembers.AllowKillstreaks

			if arg_73_2 then
				if var_0_4(var_73_25, var_73_26) then
					return true
				end
			else
				table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_25, var_73_26, var_0_5.LuaMenuMPRulesKillstreaks, var_0_6.LuaMenuMPRulesKillstreaksDesc, {
					var_0_8.LuaMenuMPDisabled,
					var_0_8.LuaMenuMPEnabled
				}, nil, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function(arg_77_0, arg_77_1)
							if var_73_24() then
								MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.RoundRetainStreaks, false)
								MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.DeathRetainStreaks, false)
								var_0_0(arg_73_0)
							end

							arg_73_0.GameSetupCategoryOptions:processEvent({
								name = "refresh_button_values",
								button = arg_77_0
							})
						end
					}
				}))
			end

			local var_73_27 = Lobby.MatchRulesClasses.CommonOption
			local var_73_28 = Lobby.MatchRulesMembers.RoundRetainStreaks

			if arg_73_2 then
				if var_0_4(var_73_27, var_73_28) then
					return true
				end
			else
				table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_27, var_73_28, var_0_5.LuaMenuMPRulesRoundRetainStreaks, var_0_6.LuaMenuMPRulesRoundRetainStreaksDesc, {
					var_0_8.LuaMenuMPDisabled,
					var_0_8.LuaMenuMPEnabled
				}, var_73_24, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function(arg_78_0, arg_78_1)
							if var_73_24() then
								arg_78_0:SetButtonDisabled(true)
							else
								arg_78_0:SetButtonDisabled(false)
							end
						end
					}
				}))
			end

			local var_73_29 = Lobby.MatchRulesClasses.CommonOption
			local var_73_30 = Lobby.MatchRulesMembers.DeathRetainStreaks

			if arg_73_2 then
				if var_0_4(var_73_29, var_73_30) then
					return true
				end
			else
				table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_29, var_73_30, var_0_5.LuaMenuMPRulesDeathRetainStreaks, var_0_6.LuaMenuMPRulesDeathRetainStreaksDesc, {
					var_0_8.LuaMenuMPEnabled,
					var_0_8.LuaMenuMPDisabled
				}, var_73_24, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function(arg_79_0, arg_79_1)
							if var_73_24() then
								arg_79_0:SetButtonDisabled(true)
							else
								arg_79_0:SetButtonDisabled(false)
							end
						end
					}
				}))
			end

			local var_73_31 = Lobby.MatchRulesClasses.CommonOption
			local var_73_32 = Lobby.MatchRulesMembers.CasualScoreStreaks

			if arg_73_2 then
				if var_0_4(var_73_31, var_73_32) then
					return true
				end
			else
				table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_31, var_73_32, var_0_5.LuaMenuMPRulesCasualScoreStreaks, var_0_6.LuaMenuMPRulesCasualScoreStreaksDesc, {
					var_0_8.LuaMenuMPDisabled,
					var_0_8.LuaMenuMPEnabled
				}, var_73_24, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function(arg_80_0, arg_80_1)
							if var_73_24() then
								arg_80_0:SetButtonDisabled(true)
							else
								arg_80_0:SetButtonDisabled(false)
							end
						end
					}
				}))
			end

			local var_73_33 = Lobby.MatchRulesClasses.CommonOption
			local var_73_34 = Lobby.MatchRulesMembers.WrapKillstreaks

			if arg_73_2 then
				if var_0_4(var_73_33, var_73_34) then
					return true
				end
			else
				table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_33, var_73_34, var_0_5.LuaMenuMPRulesWrapKillstreaks, var_0_6.LuaMenuMPRulesWrapKillstreaksDesc, {
					var_0_8.LuaMenuMPDisabled,
					var_0_8.LuaMenuMPEnabled
				}, var_73_24, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function(arg_81_0, arg_81_1)
							if var_73_24() then
								arg_81_0:SetButtonDisabled(true)
							else
								arg_81_0:SetButtonDisabled(false)
							end
						end
					}
				}))
			end
		end
	end

	local var_73_35 = Lobby.MatchRulesClasses.CommonOption
	local var_73_36 = Lobby.MatchRulesMembers.LethalDelay

	if arg_73_2 then
		if var_0_4(var_73_35, var_73_36) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_35, var_73_36, var_0_5.LuaMenuMPRulesLethalDelay, var_0_6.LuaMenuMPRulesLethalDelayDesc, {
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

	local var_73_37 = Lobby.MatchRulesClasses.CommonOption
	local var_73_38 = Lobby.MatchRulesMembers.EquipmentMSProtect

	if arg_73_2 then
		if var_0_4(var_73_37, var_73_38) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_37, var_73_38, var_0_5.LuaMenuMPRulesEquipmentMSProtect, var_0_6.LuaMenuMPRulesEquipmentMSProtectDesc, {
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

	local var_73_39 = Lobby.MatchRulesClasses.CommonOption
	local var_73_40 = Lobby.MatchRulesMembers.DisableBattleChatter

	if arg_73_2 then
		if var_0_4(var_73_39, var_73_40) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_39, var_73_40, var_0_5.LuaMenuMPRulesDisableBattleChatter, var_0_6.LuaMenuMPRulesDisableBattleChatterDesc, {
			var_0_8.LuaMenuMPEnabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	local var_73_41 = Lobby.MatchRulesClasses.CommonOption
	local var_73_42 = Lobby.MatchRulesMembers.DisableAnnouncer

	if arg_73_2 then
		if var_0_4(var_73_41, var_73_42) then
			return true
		end
	else
		table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_41, var_73_42, var_0_5.LuaMenuMPRulesDisableAnnouncer, var_0_6.LuaMenuMPRulesDisableAnnouncerDesc, {
			var_0_8.LuaMenuMPEnabledValueFalse,
			var_0_8.LuaMenuMPDisabledValueTrue
		}))
	end

	if var_73_1 ~= MP.GameMode.ArenaGameType and var_73_1 ~= MP.GameMode.InfectGameType and var_73_1 ~= MP.GameMode.GunGameType and var_73_1 ~= MP.GameMode.OICGameType then
		local var_73_43 = Lobby.MatchRulesClasses.CommonOption
		local var_73_44 = Lobby.MatchRulesMembers.GunGameWeapons

		if arg_73_2 then
			if var_0_4(var_73_43, var_73_44) then
				return true
			end
		else
			table.insert(var_73_0, var_0_19(arg_73_0, arg_73_1, var_73_43, var_73_44, var_0_5.LuaMenuMPRulesGunGameWeapons, var_0_6.LuaMenuMPRulesGunGameWeaponsDesc, {
				var_0_8.LuaMenuMPDisabledNumValue,
				var_0_8.LuaMenuMPRulesLadder1,
				var_0_8.LuaMenuMPRulesLadder2,
				var_0_8.LuaMenuMPRulesLadder3,
				var_0_8.LuaMenuMPRulesLadder4,
				var_0_8.LuaMenuMPRulesLadder7,
				var_0_8.LuaMenuMPRulesLadder8,
				var_0_8.LuaMenuMPRulesLadder9,
				var_0_8.LuaMenuMPRulesLadder10
			}))
		end
	end

	if arg_73_2 then
		return false
	else
		return var_73_0
	end
end

local var_0_26 = {
	[var_0_3.Gameplay] = {
		categoryTitle = "LUA_MENU/RULES_GAMEPLAY_OPTIONS",
		tabName = "LUA_MENU/RULES_GAMEPLAY_OPTIONS",
		optionsFeeder = var_0_25
	},
	[var_0_3.Team] = {
		categoryTitle = "LUA_MENU/RULES_TEAM_OPTIONS",
		tabName = "LUA_MENU/RULES_TEAM_OPTIONS",
		optionsFeeder = var_0_24
	},
	[var_0_3.Player] = {
		categoryTitle = "LUA_MENU/RULES_PLAYER_OPTIONS",
		tabName = "LUA_MENU/RULES_PLAYER_OPTIONS",
		optionsFeeder = var_0_23
	},
	[var_0_3.Game] = {
		categoryTitle = "LUA_MENU_MP/RULES_GAME_OPTIONS",
		tabName = "LUA_MENU/GAME_RULES",
		optionsFeeder = var_0_22
	},
	[var_0_3.ModeAdvanced] = {
		categoryTitle = "LUA_MENU_MP/RULES_MODE_ADVANCED_OPTIONS",
		tabName = "LUA_MENU_MP/RULES_MODE_ADVANCED_OPTIONS",
		optionsFeeder = var_0_20
	},
	[var_0_3.Draft] = {
		categoryTitle = "LUA_MENU_MP/RULES_DRAFT_OPTIONS",
		tabName = "LUA_MENU_MP/RULES_DRAFT_OPTIONS",
		optionsFeeder = var_0_21
	}
}

local function var_0_27()
	if var_0_26 then
		for iter_82_0 = 0, #var_0_26 do
			local var_82_0 = var_0_26[iter_82_0].options

			if var_82_0 then
				for iter_82_1 = 1, #var_82_0 do
					local var_82_1 = var_82_0[iter_82_1]

					if var_82_1 then
						var_82_1:DisableButton()
					end
				end
			end
		end
	end
end

local function var_0_28(arg_83_0, arg_83_1, arg_83_2)
	return #var_0_26[arg_83_2].optionsFeeder(arg_83_0, arg_83_1) > 0
end

local function var_0_29(arg_84_0, arg_84_1)
	return function(arg_85_0, arg_85_1)
		if arg_85_1 then
			if var_0_26[arg_85_0].optionsFeeder(arg_84_0, arg_84_1, arg_85_1) then
				ACTIONS.AnimateSequence(arg_84_0.Tabs:GetTabAtIndex(arg_84_0._currentTabIndex), "Changed")
			else
				ACTIONS.AnimateSequence(arg_84_0.Tabs:GetTabAtIndex(arg_84_0._currentTabIndex), "NotChanged")
			end
		else
			local var_85_0 = var_0_26[arg_85_0].optionsFeeder(arg_84_0, arg_84_1, arg_85_1)

			var_0_26[arg_85_0].options = var_85_0

			if arg_84_0.currentOptionButtons and #arg_84_0.currentOptionButtons > 0 then
				for iter_85_0, iter_85_1 in pairs(arg_84_0.currentOptionButtons) do
					arg_84_0.GameSetupCategoryOptions.optionsGrid:RemoveElement(iter_85_1)
				end
			end

			arg_84_0.currentOptionButtons = {}

			local var_85_1 = false

			for iter_85_2, iter_85_3 in pairs(var_85_0) do
				iter_85_3.optionIndex = iter_85_2

				table.insert(arg_84_0.currentOptionButtons, iter_85_3)
				arg_84_0.GameSetupCategoryOptions.optionsGrid:AddElement(iter_85_3)

				var_85_1 = var_85_1 or not iter_85_3._isDefault
			end

			if var_85_1 then
				ACTIONS.AnimateSequence(arg_84_0.Tabs:GetTabAtIndex(arg_84_0._currentTabIndex), "Changed")
			else
				ACTIONS.AnimateSequence(arg_84_0.Tabs:GetTabAtIndex(arg_84_0._currentTabIndex), "NotChanged")
			end

			ACTIONS.GainFocus(arg_84_0, "GameSetupCategoryOptions", arg_84_1)
		end
	end
end

function PostLoadFunc(arg_86_0, arg_86_1, arg_86_2)
	assert(arg_86_0.GameSetupCategoryOptions)
	assert(arg_86_0.MenuTitle)
	assert(arg_86_0.Tabs)
	assert(arg_86_0.bindButton)
	assert(arg_86_0.ModeDetails)

	arg_86_0.GameOptionsCategories = var_0_3
	arg_86_0.CategoryOptionsUpdate = var_0_29(arg_86_0, arg_86_1)
	arg_86_0.RefreshButtonEnableState = var_0_27

	local var_86_0 = Engine.JCBDICCAH(DataSources.frontEnd.lobby.gameTypeName:GetValue())

	arg_86_0.MenuTitle:SetMaxRightEdge(765 * _1080p)
	arg_86_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/GAME_RULES_TITLE", var_86_0))
	arg_86_0.ModeDetails:ShowIcon(false)

	if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "arena" then
		local var_86_1 = MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.ArenaData, Lobby.MatchRulesMembers.ArenaLoadouts)

		if var_86_1 == 3 or var_86_1 == 14 then
			local var_86_2 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
			local var_86_3 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_86_2, CSV.mpMapTable.cols.arenaMenuMinimap)

			if var_86_3 ~= "" then
				arg_86_0.ArenaPickupMinimap.MiniMap:setImage(RegisterMaterial(var_86_3))
				ACTIONS.AnimateSequence(arg_86_0, "ShowMiniMap")
			end
		end
	end

	local var_86_4 = {}
	local var_86_5 = {
		var_0_3.Game,
		var_0_3.ModeAdvanced,
		var_0_3.Player,
		var_0_3.Team,
		var_0_3.Gameplay
	}

	for iter_86_0, iter_86_1 in ipairs(var_86_5) do
		if var_0_28(arg_86_0, arg_86_1, iter_86_1) then
			table.insert(var_86_4, {
				name = Engine.CBBHFCGDIC(var_0_26[iter_86_1].tabName),
				id = iter_86_1
			})
		end
	end

	arg_86_0.tabNamesAndIDs = var_86_4

	local var_86_6 = {}

	for iter_86_2, iter_86_3 in ipairs(var_86_4) do
		table.insert(var_86_6, {
			name = iter_86_3.name,
			focusFunction = function(arg_87_0, arg_87_1, arg_87_2)
				arg_86_0._currentTabIndex = arg_87_2 + 1

				arg_86_0.CategoryOptionsUpdate(var_86_4[arg_87_2 + 1].id, false)
			end
		})
	end

	arg_86_0.Tabs:SetTabs(var_86_6)

	for iter_86_4, iter_86_5 in ipairs(var_86_4) do
		arg_86_0._currentTabIndex = iter_86_4

		arg_86_0.CategoryOptionsUpdate(var_86_4[iter_86_4].id, true)
	end

	arg_86_0._currentTabIndex = 1

	if not Engine.HDGDBCJFG() then
		arg_86_0.CategoryOptionsUpdate(var_0_3.Game, false)
	end

	arg_86_0.bindButton:addEventHandler("button_alt1", function(arg_88_0, arg_88_1)
		if MLG.AreMLGRulesEnabled() then
			LUI.FlowManager.RequestPopupMenu(nil, "PopupUnlockGameOptions", true, arg_86_1, false, {
				gameOptionsMenu = arg_86_0
			})
		else
			LUI.FlowManager.RequestPopupMenu(nil, "PopupResetGameOptions", true, arg_86_1, false, {
				gameOptionsMenu = arg_86_0
			})
		end
	end)
	arg_86_0.bindButton:addEventHandler("button_start", function(arg_89_0, arg_89_1)
		if not MLG.AreMLGRulesEnabled() then
			local function var_89_0()
				local var_90_0 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.COUNT)
				local var_90_1 = MatchRules.EABFIDADDB()
				local var_90_2

				if var_90_0 == nil then
					var_90_2 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, 0, MP.MatchRulesSaveHeaderLookup.ERROR_CODE) or -1
					var_90_0 = 0
				end

				if var_90_0 < var_90_1 then
					LUI.FlowManager.RequestPopupMenu(nil, "RecipeCreatePopup", true, arg_86_1, false, {
						saveSlot = var_90_0
					})

					if var_90_2 ~= nil and var_90_2 ~= -1 then
						LUI.FlowManager.RequestPopupMenu(arg_86_0, "CustomModeDataErrorPopup", true, arg_86_1, false, MP.MatchRulesErrorCodeMessage[var_90_2])
					end
				else
					LUI.FlowManager.RequestAddMenu("RecipeDeleteMenu", true, arg_86_1, false)
				end
			end

			local var_89_1 = Dvar.CFHDGABACF("NPSTLPMPSS")

			if var_89_1 == -1 then
				var_89_0()
			else
				local function var_89_2()
					MatchRules.JJFCFBDAA(var_89_1)
				end

				local var_89_3 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, var_89_1, MP.MatchRulesSaveHeaderLookup.NAME)

				LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_86_1, false, {
					yesAction = var_89_2,
					noAction = var_89_0,
					message = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_OVERWRITE", Engine.JCBDICCAH(var_89_3))
				})
			end
		end
	end)

	if MLG.AreMLGRulesEnabled() then
		arg_86_0:AddButtonHelperTextToElement(arg_86_0.HelperBar, {
			clickable = true,
			priority = 2,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_GAME_RULES")
		})
	else
		arg_86_0:AddButtonHelperTextToElement(arg_86_0.HelperBar, {
			clickable = true,
			priority = 2,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SET_DEFAULT_CONTROLS")
		})
		arg_86_0:AddButtonHelperTextToElement(arg_86_0.HelperBar, {
			clickable = true,
			priority = 3,
			side = "left",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/CREATE_CUSTOM_MODE")
		})
	end

	if not IsSystemLink() then
		local var_86_7 = LUI.UITimer.new({
			interval = 500,
			event = "update_lobby"
		})

		var_86_7.id = "lobbyTimer"

		arg_86_0:addElement(var_86_7)
		arg_86_0:registerEventHandler("update_lobby", function(arg_92_0, arg_92_1)
			local var_92_0 = {
				forceSuperfactionBasedOnTeam = true,
				widget = arg_86_0
			}

			Lobby.UpdateClientCharactersDelayed(arg_86_0, arg_86_1, var_92_0)
		end)
	end

	assert(arg_86_0.TabBacker)

	local function var_86_8()
		arg_86_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 160)
	end

	arg_86_0:addAndCallEventHandler("onVideoChange", var_86_8)
	LAYOUT.AddAspectRatioFadeFrame(arg_86_0, arg_86_1)
	assert(arg_86_0.Darken)
	ACTIONS.ScaleFullscreen(arg_86_0.Darken)
end

function GameSetupOptionsMenu(arg_94_0, arg_94_1)
	local var_94_0 = LUI.UIElement.new()

	var_94_0.id = "GameSetupOptionsMenu"
	var_94_0._animationSets = var_94_0._animationSets or {}
	var_94_0._sequences = var_94_0._sequences or {}

	local var_94_1 = arg_94_1 and arg_94_1.controllerIndex

	if not var_94_1 and not Engine.DDJFBBJAIG() then
		var_94_1 = var_94_0:getRootController()
	end

	assert(var_94_1)

	var_94_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_94_1
	})
	var_94_0.HelperBar.id = "HelperBar"

	var_94_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_94_0.HelperBar:setPriority(10)
	var_94_0:addElement(var_94_0.HelperBar)

	local var_94_2 = var_94_0
	local var_94_3
	local var_94_4 = {
		worldBlur = 1,
		controllerIndex = var_94_1
	}
	local var_94_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_94_4)

	var_94_5.id = "WorldBlur"

	var_94_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_94_0:addElement(var_94_5)

	var_94_0.WorldBlur = var_94_5

	local var_94_6
	local var_94_7 = LUI.UIImage.new()

	var_94_7.id = "Darken"

	var_94_7:SetRGBFromInt(0, 0)
	var_94_7:SetAlpha(0.5, 0)
	var_94_0:addElement(var_94_7)

	var_94_0.Darken = var_94_7

	local var_94_8
	local var_94_9 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_94_1
	})

	var_94_9.id = "Cinematic"

	var_94_0:addElement(var_94_9)

	var_94_0.Cinematic = var_94_9

	local var_94_10
	local var_94_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_94_1
	})

	var_94_11.id = "TabBacker"

	var_94_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_94_0:addElement(var_94_11)

	var_94_0.TabBacker = var_94_11

	local var_94_12
	local var_94_13 = MenuBuilder.BuildRegisteredType("GameSetupCategoryOptions", {
		controllerIndex = var_94_1
	})

	var_94_13.id = "GameSetupCategoryOptions"

	var_94_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 753, _1080p * 216, _1080p * 756)
	var_94_0:addElement(var_94_13)

	var_94_0.GameSetupCategoryOptions = var_94_13

	local var_94_14
	local var_94_15 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_94_1
	})

	var_94_15.id = "MenuTitle"

	var_94_15.MenuTitle:setText(ToUpperCase(""), 0)
	var_94_15.Line:SetLeft(0, 0)
	var_94_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_94_0:addElement(var_94_15)

	var_94_0.MenuTitle = var_94_15

	local var_94_16

	if CONDITIONS.InFrontendPublicMP(var_94_0) then
		local var_94_17 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_94_1
		})

		var_94_17.id = "MPPlayerDetails"

		var_94_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_94_0:addElement(var_94_17)

		var_94_0.MPPlayerDetails = var_94_17
	end

	local var_94_18
	local var_94_19 = MenuBuilder.BuildRegisteredType("ModeDetails", {
		controllerIndex = var_94_1
	})

	var_94_19.id = "ModeDetails"

	var_94_19.GenericItemInfo.BodyText:setText("", 0)
	var_94_19.GenericItemInfo.HeaderText:setText(ToUpperCase(""), 0)
	var_94_19.Icon:setImage(RegisterMaterial("icon_mp_mode_tdm"), 0)
	var_94_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 815, _1080p * 1635, _1080p * 216, _1080p * 436)
	var_94_0:addElement(var_94_19)

	var_94_0.ModeDetails = var_94_19

	local var_94_20
	local var_94_21 = MenuBuilder.BuildRegisteredType("ArenaPickupMiniMap", {
		controllerIndex = var_94_1
	})

	var_94_21.id = "ArenaPickupMinimap"

	var_94_21:SetAlpha(0, 0)
	var_94_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 662, _1080p * 1888, _1080p * 77, _1080p * 1309)
	var_94_0:addElement(var_94_21)

	var_94_0.ArenaPickupMinimap = var_94_21

	local var_94_22
	local var_94_23 = LUI.UIStyledText.new()

	var_94_23.id = "PickupLabel"

	var_94_23:SetAlpha(0, 0)
	var_94_23:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/ARENA_PICKUP_LABEL"), 0)
	var_94_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_94_23:SetAlignment(LUI.Alignment.Left)
	var_94_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_94_23:SetShadowMinDistance(-0.2, 0)
	var_94_23:SetShadowMaxDistance(0.2, 0)
	var_94_23:SetShadowUOffset(-0.001, 0)
	var_94_23:SetShadowVOffset(-0.001, 0)
	var_94_23:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_94_23:SetDecodeUseSystemTime(false)
	var_94_23:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 883, _1080p * -497, _1080p * 436, _1080p * 454)
	var_94_0:addElement(var_94_23)

	var_94_0.PickupLabel = var_94_23

	local var_94_24
	local var_94_25 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_94_1
			})
		end,
		controllerIndex = var_94_1
	}
	local var_94_26 = LUI.TabManager.new(var_94_25)

	var_94_26.id = "Tabs"

	var_94_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 91, _1080p * 991, _1080p * 108, _1080p * 160)
	var_94_0:addElement(var_94_26)

	var_94_0.Tabs = var_94_26

	local var_94_27
	local var_94_28 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_94_1
	})

	var_94_28.id = "LobbyMembersFooter"

	var_94_28:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_94_0:addElement(var_94_28)

	var_94_0.LobbyMembersFooter = var_94_28

	local function var_94_29()
		return
	end

	var_94_0._sequences.DefaultSequence = var_94_29

	local function var_94_30()
		return
	end

	var_94_0._sequences.Update = var_94_30

	local var_94_31
	local var_94_32 = {
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

	var_94_19:RegisterAnimationSequence("ShowMiniMap", var_94_32)

	local var_94_33 = {
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

	var_94_21:RegisterAnimationSequence("ShowMiniMap", var_94_33)

	local var_94_34 = {
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

	var_94_23:RegisterAnimationSequence("ShowMiniMap", var_94_34)

	local function var_94_35()
		var_94_19:AnimateSequence("ShowMiniMap")
		var_94_21:AnimateSequence("ShowMiniMap")
		var_94_23:AnimateSequence("ShowMiniMap")
	end

	var_94_0._sequences.ShowMiniMap = var_94_35

	local var_94_36
	local var_94_37 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 216
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 436
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

	var_94_19:RegisterAnimationSequence("HideMiniMap", var_94_37)

	local var_94_38 = {
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

	var_94_21:RegisterAnimationSequence("HideMiniMap", var_94_38)

	local var_94_39 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 436
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 454
		}
	}

	var_94_23:RegisterAnimationSequence("HideMiniMap", var_94_39)

	local function var_94_40()
		var_94_19:AnimateSequence("HideMiniMap")
		var_94_21:AnimateSequence("HideMiniMap")
		var_94_23:AnimateSequence("HideMiniMap")
	end

	var_94_0._sequences.HideMiniMap = var_94_40

	var_94_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_94_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_94_41 = LUI.UIBindButton.new()

	var_94_41.id = "selfBindButton"

	var_94_0:addElement(var_94_41)

	var_94_0.bindButton = var_94_41

	var_94_0.bindButton:addEventHandler("button_secondary", function(arg_100_0, arg_100_1)
		if not arg_100_1.controller then
			local var_100_0 = var_94_1
		end

		ACTIONS.LeaveMenu(var_94_0)
	end)
	PostLoadFunc(var_94_0, var_94_1, arg_94_1)

	return var_94_0
end

MenuBuilder.registerType("GameSetupOptionsMenu", GameSetupOptionsMenu)
LockTable(_M)
