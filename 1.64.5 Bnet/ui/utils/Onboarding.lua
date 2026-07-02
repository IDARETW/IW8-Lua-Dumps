Onboarding = {}
Onboarding.mapNames = {
	BMTutorialMap = "mp_bm_tut",
	BRQuarryTutorialMap = "mp_br_quarry",
	BRTutorialMap = Dvar.DHEEJCCJBH("wz_tutorial_map") or "mp_br_tut2"
}
Onboarding.mapEndGameFlowData = {
	[Onboarding.mapNames.BRTutorialMap] = {
		tutorialLobbyNeedContinue = false,
		rewardID = "TRAINING_REWARD",
		tutorialCompletedID = "WARZONE_TUTORIAL_GAMEPLAY_COMPLETED",
		rewardDescription = "LUA_MENU/WZ_TUTORIAL_REWARD_POPUP_HINT1",
		lootID = Dvar.CFHDGABACF("LPKRQLLLNQ") or 30080
	},
	[Onboarding.mapNames.BMTutorialMap] = {
		tutorialLobbyNeedContinue = true,
		rewardID = "BLOOD_MONEY_TRAINING_REWARD",
		tutorialCompletedID = "PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED",
		rewardDescription = "LUA_MENU/WZ_TUTORIAL_REWARD_POPUP_HINT3",
		lootID = Dvar.CFHDGABACF("LNKPLSSRQ") or 170696
	},
	[Onboarding.mapNames.BRQuarryTutorialMap] = {
		tutorialLobbyNeedContinue = false,
		rewardID = "PRACTICE_REWARD",
		tutorialCompletedID = "WARZONE_PRACTICE_GAMEPLAY_COMPLETED",
		rewardDescription = "LUA_MENU/WZ_TUTORIAL_REWARD_POPUP_HINT2",
		lootID = Dvar.CFHDGABACF("NOMPNRSPRL") or 128
	}
}
Onboarding.tutorials = {
	WARZONE_PRIVATE_MATCH = 61,
	INTEL_MISSION_CHALLENGES = 51,
	GAMEMODE_MOSHPIT = 50,
	MISSION_CHALLENGES = 6,
	WEAPON_MASTERY_CHALLENGES = 52,
	SEASON1_WATCH_FLAG = 23,
	PLUNDERTUTORIAL = 44,
	FIELD_UPGRADE = 8,
	SEASON2_WATCH_FLAG = 24,
	OFFICER = 18,
	BATTLE_TRACKS = 57,
	WZ_DROPKIT = 36,
	GAMEBATTLES = 39,
	KILLSTREAKS = 9,
	WZ_PERKS = 37,
	MATURE_CONTENT = 16,
	SEASON4_WATCH_FLAG = 26,
	SPECIALIST_PERKS = 13,
	SEASON5_WATCH_FLAG = 27,
	SEASON3_WATCH_FLAG = 25,
	BLUEPRINT_STORE = 55,
	WEAPON_CH2_MWWZ_LOADOUT_SPLIT = 64,
	SPRAYS = 56,
	CDL = 31,
	GAMEMODE_TDM_ANYWHERE = 53,
	SEASON_MID_BINK_WATCH_FLAG = 91,
	LOADOUT_UPDATE_WZ = 72,
	VEHICLE_CAMOS = 45,
	WEAPON_MASTERY_CHALLENGE_RESERVE = 77,
	CROSS_PROGRESSION_BOOT_MW = 70,
	MAGMA_WATCHED_FLAG = 42,
	LOADOUT = 11,
	PERKS_CP = 20,
	CDL_RULES = 32,
	ARMORY = 7,
	CHALLENGES_WEAPON_CH2WZ_DAILY = 76,
	GIFTING_2FA = 94,
	PERKS = 3,
	OPERATORS_CH2_BOOT_SPLITOP_LOADOUT = 66,
	BARRACKS_CH2WZ_EQUIP = 79,
	PAUSE_MENU_LTM = 102,
	CAREER_WZ = 81,
	SEASON6_WATCH_FLAG = 28,
	DISABLE_WEAPON_PRESTIGE_WARNING = 2,
	CAREER_WZ_LEVELING = 83,
	GUNSMITH = 10,
	SEASON8_WATCH_FLAG = 84,
	SEASON_MID_EVENT_POPUP_WATCH_FLAG = 93,
	MASTER_CHALLENGES = 59,
	ZOMBIES_BR = 38,
	VEHICLE_HORN = 54,
	SEASON8_MID_WATCH_FLAG = 87,
	WEAPON_MASTERY_CHALLENGES_CH2WZ = 73,
	REBIRTH_EVENT_ONBOARDING = 68,
	OPERATORS_CH2_BOOT_SPLITOP_LOADOUT_MW = 67,
	SEASON_BINK_WATCH_FLAG = 89,
	CROSS_PROGRESSION_BOOT_WZ = 69,
	SEASON7_MID_WATCH_FLAG = 86,
	ELDER_PROGRESSION = 12,
	SEASON7_WATCH_FLAG = 71,
	LOOK_FOR_PARTY = 95,
	AMRB_ONBOARDING = 103,
	VG_BP_SPLIT_TIERS = 97,
	ZOMBIES_EVENT_ONBOARDING = 85,
	PRESTIGE_MASTER_PROGRESSION = 99,
	PACIFIC_TRANSITION_WATCH_FLAG = 100,
	MILSIM_OPERATORS = 46,
	GROUPS_REVEAL_AFTER_REGIMENT_TRANSITON = 101,
	CAREER_MW = 80,
	WARZONE_TUTORIAL_GAMEPLAY_COMPLETED = 35,
	LEP_ONBOARDING = 96,
	CORTEZ_INSTANT_GRAT_SHOWN = 104,
	GAMEMODE_GUNFIGHT = 49,
	TRIAL_EVENT_INTRODUCTION = 58,
	BATTLE_PASS = 29,
	GUNSMITH_CUSTOMS = 47,
	REGIMENTS = 30,
	OPERATORS_CH2_SPLITOP_LOADOUT = 65,
	CAREER_MW_LEVELING = 82,
	WEAPON_PRESTIGE = 0,
	LOADOUT_CP = 19,
	GAMEMODE_TDM = 48,
	SEASON_EVENT_POPUP_WATCH_FLAG = 92,
	HALLOWEEN_ONBOARDING = 62,
	REBIRTH_ONBOARDING = 63,
	QUARTERMASTER = 1,
	SEASON_UNLOCKS = 21,
	PRESTIGE_PROGRESSION = 98,
	OPERATORS = 4,
	ADLER_EVENT_ONBOARDING = 88,
	CP_ROLES = 5,
	WEAPON_CUSTOMIZATION = 74,
	BARRACKS_CH2MW_EQUIP = 78,
	WARZONE_INTRODUCTION = 33,
	GAMEMODE_ARMORED_ROYALE = 34,
	WEAPON_MOD = 22,
	CORTEZ_INSTANT_GRAT_SHOWN_AFTER_SEASON_START = 105,
	PRO_FIELD_UPGRADE = 14,
	SUMMER_OF_ACTION_EVENT_ONBOARDING = 90,
	WEAPON_MASTERY_CLASSIFIED_CHALLENGES = 60,
	PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED = 15,
	CP_MUNITIONS = 17,
	WARZONE_PRACTICE_GAMEPLAY_COMPLETED = 41,
	OPERATORS_CH2WZ = 75,
	WARZONE_TUTORIAL_GAMEPLAY_INITIATED = 40,
	OPERATOR_MISSIONS = 43
}
Onboarding.WeaponPrestige = {}
Onboarding.WeaponPrestige.stages = {
	{
		name = "WELCOME"
	}
}

function Onboarding.WeaponPrestige.WasCompleted(arg_1_0, arg_1_1)
	return Engine.ECCJEIDDC(arg_1_1, Onboarding.tutorials.WEAPON_PRESTIGE)
end

function Onboarding.WeaponPrestige.MarkCompleted(arg_2_0, arg_2_1)
	Engine.CIHICIEBIA(arg_2_1, Onboarding.tutorials.WEAPON_PRESTIGE)
	ACTIONS.UploadStats(arg_2_0, arg_2_1)
end

Onboarding.PauseMenuLtm = {}

function Onboarding.PauseMenuLtm.WasCompleted(arg_3_0, arg_3_1)
	return Engine.ECCJEIDDC(arg_3_1, Onboarding.tutorials.PAUSE_MENU_LTM)
end

function Onboarding.PauseMenuLtm.MarkCompleted(arg_4_0, arg_4_1)
	Engine.CIHICIEBIA(arg_4_1, Onboarding.tutorials.PAUSE_MENU_LTM)
	ACTIONS.UploadStats(arg_4_0, arg_4_1)
end

Onboarding.DisableWeaponPrestigeWarning = {}
Onboarding.DisableWeaponPrestigeWarning.stages = {
	{
		name = "DisableWeaponPrestigeWarning"
	}
}

function Onboarding.DisableWeaponPrestigeWarning.WasCompleted(arg_5_0, arg_5_1)
	return Engine.ECCJEIDDC(arg_5_1, Onboarding.tutorials.DISABLE_WEAPON_PRESTIGE_WARNING)
end

function Onboarding.DisableWeaponPrestigeWarning.MarkCompleted(arg_6_0, arg_6_1)
	Engine.CIHICIEBIA(arg_6_1, Onboarding.tutorials.DISABLE_WEAPON_PRESTIGE_WARNING)
	ACTIONS.UploadStats(arg_6_0, arg_6_1)
end

Onboarding.Quartermaster = {}

function Onboarding.Quartermaster.WasCompleted(arg_7_0, arg_7_1)
	return Engine.ECCJEIDDC(arg_7_1, Onboarding.tutorials.QUARTERMASTER)
end

function Onboarding.Quartermaster.MarkCompleted(arg_8_0, arg_8_1)
	Engine.CIHICIEBIA(arg_8_1, Onboarding.tutorials.QUARTERMASTER)
	ACTIONS.UploadStats(arg_8_0, arg_8_1)
end

Onboarding.Quartermaster.stages = {
	{
		name = "INTRO",
		whitelist = {
			{
				menu = "Armory",
				buttons = {}
			}
		}
	}
}
Onboarding.Perks = {}
Onboarding.Perks.stages = {
	{
		name = "PerkPopup"
	}
}

function Onboarding.Perks.WasCompleted(arg_9_0, arg_9_1)
	return Engine.ECCJEIDDC(arg_9_1, Onboarding.tutorials.PERKS)
end

function Onboarding.Perks.MarkCompleted(arg_10_0, arg_10_1)
	Engine.CIHICIEBIA(arg_10_1, Onboarding.tutorials.PERKS)
	ACTIONS.UploadStats(arg_10_0, arg_10_1)
end

Onboarding.PerksCP = {}
Onboarding.PerksCP.stages = {
	{
		name = "PerkPopup"
	}
}

function Onboarding.PerksCP.WasCompleted(arg_11_0, arg_11_1)
	return Engine.ECCJEIDDC(arg_11_1, Onboarding.tutorials.PERKS_CP)
end

function Onboarding.PerksCP.MarkCompleted(arg_12_0, arg_12_1)
	Engine.CIHICIEBIA(arg_12_1, Onboarding.tutorials.PERKS_CP)
	ACTIONS.UploadStats(arg_12_0, arg_12_1)
end

Onboarding.Operators = {}
Onboarding.Operators.stages = {
	{
		name = "OperatorPopup"
	}
}

function Onboarding.Operators.WasCompleted(arg_13_0, arg_13_1)
	return Engine.ECCJEIDDC(arg_13_1, Onboarding.tutorials.OPERATORS)
end

function Onboarding.Operators.MarkCompleted(arg_14_0, arg_14_1)
	Engine.CIHICIEBIA(arg_14_1, Onboarding.tutorials.OPERATORS)
	ACTIONS.UploadStats(arg_14_0, arg_14_1)
end

Onboarding.OperatorMissions = {}
Onboarding.OperatorMissions.stages = {
	{
		name = "OperatorMissionsPopup"
	}
}

function Onboarding.OperatorMissions.WasCompleted(arg_15_0, arg_15_1)
	return Engine.ECCJEIDDC(arg_15_1, Onboarding.tutorials.OPERATOR_MISSIONS)
end

function Onboarding.OperatorMissions.MarkCompleted(arg_16_0, arg_16_1)
	Engine.CIHICIEBIA(arg_16_1, Onboarding.tutorials.OPERATOR_MISSIONS)
	ACTIONS.UploadStats(arg_16_0, arg_16_1)
end

Onboarding.CPRoles = {}
Onboarding.CPRoles.stages = {
	{
		name = "CPRolePopup"
	}
}

function Onboarding.CPRoles.WasCompleted(arg_17_0, arg_17_1)
	return Engine.ECCJEIDDC(arg_17_1, Onboarding.tutorials.CP_ROLES)
end

function Onboarding.CPRoles.MarkCompleted(arg_18_0, arg_18_1)
	Engine.CIHICIEBIA(arg_18_1, Onboarding.tutorials.CP_ROLES)
	ACTIONS.UploadStats(arg_18_0, arg_18_1)
end

Onboarding.Armory = {}
Onboarding.Armory.stages = {
	{
		name = "ArmoryPopup"
	}
}

function Onboarding.Armory.WasCompleted(arg_19_0, arg_19_1)
	return Engine.ECCJEIDDC(arg_19_1, Onboarding.tutorials.ARMORY)
end

function Onboarding.Armory.MarkCompleted(arg_20_0, arg_20_1)
	Engine.CIHICIEBIA(arg_20_1, Onboarding.tutorials.ARMORY)
	ACTIONS.UploadStats(arg_20_0, arg_20_1)
end

Onboarding.FieldUpgrade = {}
Onboarding.FieldUpgrade.stages = {
	{
		name = "FieldUpgradePopup"
	}
}

function Onboarding.FieldUpgrade.WasCompleted(arg_21_0, arg_21_1)
	return Engine.ECCJEIDDC(arg_21_1, Onboarding.tutorials.FIELD_UPGRADE)
end

function Onboarding.FieldUpgrade.MarkCompleted(arg_22_0, arg_22_1)
	Engine.CIHICIEBIA(arg_22_1, Onboarding.tutorials.FIELD_UPGRADE)
	ACTIONS.UploadStats(arg_22_0, arg_22_1)
end

Onboarding.Killstreaks = {}
Onboarding.Killstreaks.stages = {
	{
		name = "KillstreakPopup"
	}
}

function Onboarding.Killstreaks.WasCompleted(arg_23_0, arg_23_1)
	return Engine.ECCJEIDDC(arg_23_1, Onboarding.tutorials.KILLSTREAKS)
end

function Onboarding.Killstreaks.MarkCompleted(arg_24_0, arg_24_1)
	Engine.CIHICIEBIA(arg_24_1, Onboarding.tutorials.KILLSTREAKS)
	ACTIONS.UploadStats(arg_24_0, arg_24_1)
end

Onboarding.Gunsmith = {}
Onboarding.Gunsmith.stages = {
	{
		name = "GunsmithPopup"
	}
}

function Onboarding.Gunsmith.WasCompleted(arg_25_0, arg_25_1)
	return Engine.ECCJEIDDC(arg_25_1, Onboarding.tutorials.GUNSMITH)
end

function Onboarding.Gunsmith.MarkCompleted(arg_26_0, arg_26_1)
	Engine.CIHICIEBIA(arg_26_1, Onboarding.tutorials.GUNSMITH)
	ACTIONS.UploadStats(arg_26_0, arg_26_1)
end

Onboarding.Loadout = {}
Onboarding.Loadout.stages = {
	{
		name = "LoadoutPopup"
	}
}

function Onboarding.Loadout.WasCompleted(arg_27_0, arg_27_1)
	return Engine.ECCJEIDDC(arg_27_1, Onboarding.tutorials.LOADOUT)
end

function Onboarding.Loadout.MarkCompleted(arg_28_0, arg_28_1)
	Engine.CIHICIEBIA(arg_28_1, Onboarding.tutorials.LOADOUT)
	ACTIONS.UploadStats(arg_28_0, arg_28_1)
end

Onboarding.LoadoutCP = {}
Onboarding.LoadoutCP.stages = {
	{
		name = "LoadoutPopup"
	}
}

function Onboarding.LoadoutCP.WasCompleted(arg_29_0, arg_29_1)
	return Engine.ECCJEIDDC(arg_29_1, Onboarding.tutorials.LOADOUT_CP)
end

function Onboarding.LoadoutCP.MarkCompleted(arg_30_0, arg_30_1)
	Engine.CIHICIEBIA(arg_30_1, Onboarding.tutorials.LOADOUT_CP)
	ACTIONS.UploadStats(arg_30_0, arg_30_1)
end

Onboarding.ElderProgression = {}
Onboarding.ElderProgression.stages = {
	{
		name = "ElderProgressionPopup"
	}
}

function Onboarding.ElderProgression.WasCompleted(arg_31_0, arg_31_1)
	return Engine.ECCJEIDDC(arg_31_1, Onboarding.tutorials.ELDER_PROGRESSION)
end

function Onboarding.ElderProgression.MarkCompleted(arg_32_0, arg_32_1)
	Engine.CIHICIEBIA(arg_32_1, Onboarding.tutorials.ELDER_PROGRESSION)
	ACTIONS.UploadStats(arg_32_0, arg_32_1)
end

Onboarding.SpecialistPerk = {}
Onboarding.SpecialistPerk.stages = {
	{
		name = "SpecialistPopup"
	}
}

function Onboarding.SpecialistPerk.WasCompleted(arg_33_0, arg_33_1)
	return Engine.ECCJEIDDC(arg_33_1, Onboarding.tutorials.SPECIALIST_PERKS)
end

function Onboarding.SpecialistPerk.MarkCompleted(arg_34_0, arg_34_1)
	Engine.CIHICIEBIA(arg_34_1, Onboarding.tutorials.SPECIALIST_PERKS)
	ACTIONS.UploadStats(arg_34_0, arg_34_1)
end

Onboarding.PerkUpdates = {}
Onboarding.PerkUpdates.stages = {
	{
		name = "PerkUpdates"
	}
}

function Onboarding.PerkUpdates.WasCompleted(arg_35_0, arg_35_1)
	return Engine.ECCJEIDDC(arg_35_1, Onboarding.tutorials.PERK_UPDATES)
end

function Onboarding.PerkUpdates.MarkCompleted(arg_36_0, arg_36_1)
	Engine.CIHICIEBIA(arg_36_1, Onboarding.tutorials.PERK_UPDATES)
	ACTIONS.UploadStats(arg_36_0, arg_36_1)
end

Onboarding.ProFieldUpgrade = {}
Onboarding.ProFieldUpgrade.stages = {
	{
		name = "ProFieldUpgradePopup"
	}
}

function Onboarding.ProFieldUpgrade.WasCompleted(arg_37_0, arg_37_1)
	return Engine.ECCJEIDDC(arg_37_1, Onboarding.tutorials.PRO_FIELD_UPGRADE)
end

function Onboarding.ProFieldUpgrade.MarkCompleted(arg_38_0, arg_38_1)
	Engine.CIHICIEBIA(arg_38_1, Onboarding.tutorials.PRO_FIELD_UPGRADE)
	ACTIONS.UploadStats(arg_38_0, arg_38_1)
end

Onboarding.MissionChallenges = {}
Onboarding.MissionChallenges.stages = {
	{
		name = "MissionChallenges"
	}
}

function Onboarding.MissionChallenges.WasCompleted(arg_39_0, arg_39_1)
	return Engine.ECCJEIDDC(arg_39_1, Onboarding.tutorials.MISSION_CHALLENGES)
end

function Onboarding.MissionChallenges.MarkCompleted(arg_40_0, arg_40_1)
	Engine.CIHICIEBIA(arg_40_1, Onboarding.tutorials.MISSION_CHALLENGES)
	ACTIONS.UploadStats(arg_40_0, arg_40_1)
end

Onboarding.MatureContentWarning = {}
Onboarding.MatureContentWarning.stages = {
	{
		name = "MatureContentPopup"
	}
}

function Onboarding.MatureContentWarning.WasCompleted(arg_41_0, arg_41_1)
	return Engine.ECCJEIDDC(arg_41_1, Onboarding.tutorials.MATURE_CONTENT)
end

function Onboarding.MatureContentWarning.MarkCompleted(arg_42_0, arg_42_1)
	Engine.CIHICIEBIA(arg_42_1, Onboarding.tutorials.MATURE_CONTENT)
	ACTIONS.UploadStats(arg_42_0, arg_42_1)
end

Onboarding.CPMunitions = {}
Onboarding.CPMunitions.stages = {
	{
		name = "CPMunitionsPopup"
	}
}

function Onboarding.CPMunitions.WasCompleted(arg_43_0, arg_43_1)
	return Engine.ECCJEIDDC(arg_43_1, Onboarding.tutorials.CP_MUNITIONS)
end

function Onboarding.CPMunitions.MarkCompleted(arg_44_0, arg_44_1)
	Engine.CIHICIEBIA(arg_44_1, Onboarding.tutorials.CP_MUNITIONS)
	ACTIONS.UploadStats(arg_44_0, arg_44_1)
end

Onboarding.OfficerProgression = {}
Onboarding.OfficerProgression.stages = {
	{
		name = "CPMunitionsPopup"
	}
}

function Onboarding.OfficerProgression.WasCompleted(arg_45_0, arg_45_1)
	return Engine.ECCJEIDDC(arg_45_1, Onboarding.tutorials.OFFICER)
end

function Onboarding.OfficerProgression.MarkCompleted(arg_46_0, arg_46_1)
	Engine.CIHICIEBIA(arg_46_1, Onboarding.tutorials.OFFICER)
	ACTIONS.UploadStats(arg_46_0, arg_46_1)
end

Onboarding.WeaponMod = {}
Onboarding.WeaponMod.stages = {
	{
		name = "WeaponModPopup"
	}
}

function Onboarding.WeaponMod.WasCompleted(arg_47_0, arg_47_1)
	return Engine.ECCJEIDDC(arg_47_1, Onboarding.tutorials.WEAPON_MOD)
end

function Onboarding.WeaponMod.MarkCompleted(arg_48_0, arg_48_1)
	Engine.CIHICIEBIA(arg_48_1, Onboarding.tutorials.WEAPON_MOD)
	ACTIONS.UploadStats(arg_48_0, arg_48_1)
end

Onboarding.BattlePass = {}
Onboarding.BattlePass.stages = {
	{
		name = "BattlePassOnboardingPopup"
	}
}

function Onboarding.BattlePass.WasCompleted(arg_49_0, arg_49_1)
	return Engine.ECCJEIDDC(arg_49_1, Onboarding.tutorials.BATTLE_PASS)
end

function Onboarding.BattlePass.MarkCompleted(arg_50_0, arg_50_1)
	Engine.CIHICIEBIA(arg_50_1, Onboarding.tutorials.BATTLE_PASS)
	ACTIONS.UploadStats(arg_50_0, arg_50_1)
end

Onboarding.Regiments = {}
Onboarding.Regiments.stages = {
	{
		name = "RegimentsOnboardingPopup"
	}
}

function Onboarding.Regiments.WasCompleted(arg_51_0, arg_51_1)
	return Engine.ECCJEIDDC(arg_51_1, Onboarding.tutorials.REGIMENTS)
end

function Onboarding.Regiments.MarkCompleted(arg_52_0, arg_52_1)
	Engine.CIHICIEBIA(arg_52_1, Onboarding.tutorials.REGIMENTS)
	ACTIONS.UploadStats(arg_52_0, arg_52_1)
end

Onboarding.CDL = {}
Onboarding.CDL.stages = {
	{
		name = "CDLOnboardingPopup"
	}
}

function Onboarding.CDL.WasCompleted(arg_53_0, arg_53_1)
	return Engine.ECCJEIDDC(arg_53_1, Onboarding.tutorials.CDL)
end

function Onboarding.CDL.MarkCompleted(arg_54_0, arg_54_1)
	Engine.CIHICIEBIA(arg_54_1, Onboarding.tutorials.CDL)
	ACTIONS.UploadStats(arg_54_0, arg_54_1)
end

Onboarding.CDLRules = {}
Onboarding.CDLRules.stages = {
	{
		name = "CDLRulesPopup"
	}
}

function Onboarding.CDLRules.WasCompleted(arg_55_0, arg_55_1)
	return Engine.ECCJEIDDC(arg_55_1, Onboarding.tutorials.CDL_RULES)
end

function Onboarding.CDLRules.MarkCompleted(arg_56_0, arg_56_1)
	Engine.CIHICIEBIA(arg_56_1, Onboarding.tutorials.CDL_RULES)
	ACTIONS.UploadStats(arg_56_0, arg_56_1)
end

Onboarding.WARZONE_INTRODUCTION = {}
Onboarding.WARZONE_INTRODUCTION.stages = {
	{
		name = "WarzoneIntroductionPopup"
	}
}

function Onboarding.WARZONE_INTRODUCTION.WasCompleted(arg_57_0, arg_57_1)
	return Engine.ECCJEIDDC(arg_57_1, Onboarding.tutorials.WARZONE_INTRODUCTION)
end

function Onboarding.WARZONE_INTRODUCTION.MarkCompleted(arg_58_0, arg_58_1)
	Engine.CIHICIEBIA(arg_58_1, Onboarding.tutorials.WARZONE_INTRODUCTION)
	ACTIONS.UploadStats(arg_58_0, arg_58_1)
end

Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED = {}
Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.stages = {
	{
		name = "WarzoneTutorialGameplay"
	}
}

function Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(arg_59_0, arg_59_1)
	return Engine.ECCJEIDDC(arg_59_1, Onboarding.tutorials.WARZONE_TUTORIAL_GAMEPLAY_INITIATED)
end

function Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.MarkCompleted(arg_60_0, arg_60_1)
	Engine.CIHICIEBIA(arg_60_1, Onboarding.tutorials.WARZONE_TUTORIAL_GAMEPLAY_INITIATED)
	ACTIONS.UploadStats(arg_60_0, arg_60_1)
end

Onboarding.WARZONE_TUTORIAL_GAMEPLAY_COMPLETED = {}
Onboarding.WARZONE_TUTORIAL_GAMEPLAY_COMPLETED.stages = {
	{
		name = "WarzoneTutorialGameplay"
	}
}

function Onboarding.WARZONE_TUTORIAL_GAMEPLAY_COMPLETED.WasCompleted(arg_61_0, arg_61_1)
	return Engine.ECCJEIDDC(arg_61_1, Onboarding.tutorials.WARZONE_TUTORIAL_GAMEPLAY_COMPLETED)
end

function Onboarding.WARZONE_TUTORIAL_GAMEPLAY_COMPLETED.MarkCompleted(arg_62_0, arg_62_1)
	Engine.CIHICIEBIA(arg_62_1, Onboarding.tutorials.WARZONE_TUTORIAL_GAMEPLAY_COMPLETED)
	ACTIONS.UploadStats(arg_62_0, arg_62_1)
end

Onboarding.PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED = {}
Onboarding.PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED.stages = {
	{
		name = "WarzoneTutorialGameplay"
	}
}

function Onboarding.PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED.WasCompleted(arg_63_0, arg_63_1)
	return Engine.ECCJEIDDC(arg_63_1, Onboarding.tutorials.PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED)
end

function Onboarding.PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED.MarkCompleted(arg_64_0, arg_64_1)
	Engine.CIHICIEBIA(arg_64_1, Onboarding.tutorials.PLUNDER_TUTORIAL_GAMEPLAY_COMPLETED)
	ACTIONS.UploadStats(arg_64_0, arg_64_1)
end

Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED = {}
Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED.stages = {
	{
		name = "WarzoneTutorialGameplay"
	}
}

function Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED.WasCompleted(arg_65_0, arg_65_1)
	return Engine.ECCJEIDDC(arg_65_1, Onboarding.tutorials.WARZONE_PRACTICE_GAMEPLAY_COMPLETED)
end

function Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED.MarkCompleted(arg_66_0, arg_66_1)
	Engine.CIHICIEBIA(arg_66_1, Onboarding.tutorials.WARZONE_PRACTICE_GAMEPLAY_COMPLETED)
	ACTIONS.UploadStats(arg_66_0, arg_66_1)
end

Onboarding.SeasonVideo = {}
Onboarding.SeasonVideo.stages = {
	{
		name = "SeasonVideoPopup"
	}
}

function Onboarding.SeasonVideo.WasCompleted(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, arg_67_2, CSV.seasons.cols.introVideoName)

	if not var_67_0 or var_67_0 == "" then
		return true
	end

	return Engine.ECCJEIDDC(arg_67_1, Onboarding.tutorials.SEASON_BINK_WATCH_FLAG)
end

function Onboarding.SeasonVideo.MarkCompleted(arg_68_0, arg_68_1)
	Engine.CIHICIEBIA(arg_68_1, Onboarding.tutorials.SEASON_BINK_WATCH_FLAG)
	ACTIONS.UploadStats(arg_68_0, arg_68_1)
end

Onboarding.MidSeasonVideo = {}
Onboarding.MidSeasonVideo.stages = {
	{
		name = "SeasonVideoPopup"
	}
}

function Onboarding.MidSeasonVideo.WasCompleted(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, arg_69_2, CSV.seasons.cols.midSeasonVideoName)

	if not var_69_0 or var_69_0 == "" then
		return true
	end

	return Engine.ECCJEIDDC(arg_69_1, Onboarding.tutorials.SEASON_MID_BINK_WATCH_FLAG)
end

function Onboarding.MidSeasonVideo.MarkCompleted(arg_70_0, arg_70_1)
	Engine.CIHICIEBIA(arg_70_1, Onboarding.tutorials.SEASON_MID_BINK_WATCH_FLAG)
	ACTIONS.UploadStats(arg_70_0, arg_70_1)
end

Onboarding.ReverseNukeVideo = {}
Onboarding.ReverseNukeVideo.stages = {
	{
		name = "ReverseNukeVideoPopup"
	}
}

function Onboarding.ReverseNukeVideo.WasCompleted(arg_71_0, arg_71_1)
	return Engine.BECCFCBIAA("hasSeenReverseNukeVideo", arg_71_1) == 1
end

function Onboarding.ReverseNukeVideo.MarkCompleted(arg_72_0, arg_72_1)
	Engine.DFJDIFJEGA("hasSeenReverseNukeVideo", 1, arg_72_1)
end

Onboarding.MagmaVideo = {}
Onboarding.MagmaVideo.stages = {
	{
		name = "MagmaVideoPopup"
	}
}

function Onboarding.MagmaVideo.WasCompleted(arg_73_0, arg_73_1)
	return Engine.ECCJEIDDC(arg_73_1, Onboarding.tutorials.MAGMA_WATCHED_FLAG)
end

function Onboarding.MagmaVideo.MarkCompleted(arg_74_0, arg_74_1, arg_74_2)
	Engine.CIHICIEBIA(arg_74_1, Onboarding.tutorials.MAGMA_WATCHED_FLAG)
	ACTIONS.UploadStats(arg_74_0, arg_74_1)
end

Onboarding.WZPerks = {}
Onboarding.WZPerks.stages = {
	{
		name = "BRPerksPopup"
	}
}

function Onboarding.WZPerks.WasCompleted(arg_75_0, arg_75_1)
	return Engine.ECCJEIDDC(arg_75_1, Onboarding.tutorials.WZ_PERKS)
end

function Onboarding.WZPerks.MarkCompleted(arg_76_0, arg_76_1)
	Engine.CIHICIEBIA(arg_76_1, Onboarding.tutorials.WZ_PERKS)
	ACTIONS.UploadStats(arg_76_0, arg_76_1)
end

Onboarding.WZDropKit = {}
Onboarding.WZDropKit.stages = {
	{
		name = "BRDropKitPopup"
	}
}

function Onboarding.WZDropKit.WasCompleted(arg_77_0, arg_77_1)
	return Engine.ECCJEIDDC(arg_77_1, Onboarding.tutorials.WZ_DROPKIT)
end

function Onboarding.WZDropKit.MarkCompleted(arg_78_0, arg_78_1)
	Engine.CIHICIEBIA(arg_78_1, Onboarding.tutorials.WZ_DROPKIT)
	ACTIONS.UploadStats(arg_78_0, arg_78_1)
end

Onboarding.GameBattles = {}
Onboarding.GameBattles.stages = {
	{
		name = "GameBattles"
	}
}

function Onboarding.GameBattles.WasCompleted(arg_79_0, arg_79_1)
	return Engine.ECCJEIDDC(arg_79_1, Onboarding.tutorials.GAMEBATTLES)
end

function Onboarding.GameBattles.MarkCompleted(arg_80_0, arg_80_1)
	Engine.CIHICIEBIA(arg_80_1, Onboarding.tutorials.GAMEBATTLES)
	ACTIONS.UploadStats(arg_80_0, arg_80_1)
end

Onboarding.Plunder = {}
Onboarding.Plunder.stages = {
	{
		name = "PlunderTutorialPopup"
	}
}

function Onboarding.Plunder.WasCompleted(arg_81_0, arg_81_1)
	return Engine.ECCJEIDDC(arg_81_1, Onboarding.tutorials.PLUNDERTUTORIAL)
end

function Onboarding.Plunder.MarkCompleted(arg_82_0, arg_82_1)
	Engine.CIHICIEBIA(arg_82_1, Onboarding.tutorials.PLUNDERTUTORIAL)
	ACTIONS.UploadStats(arg_82_0, arg_82_1)
end

Onboarding.VehicleCamos = {}
Onboarding.VehicleCamos.stages = {
	{
		name = "VehicleCamosTutorialPopup"
	}
}

function Onboarding.VehicleCamos.WasCompleted(arg_83_0, arg_83_1)
	return Engine.ECCJEIDDC(arg_83_1, Onboarding.tutorials.VEHICLE_CAMOS)
end

function Onboarding.VehicleCamos.MarkCompleted(arg_84_0, arg_84_1)
	Engine.CIHICIEBIA(arg_84_1, Onboarding.tutorials.VEHICLE_CAMOS)
	ACTIONS.UploadStats(arg_84_0, arg_84_1)
end

Onboarding.MilSimOperators = {}
Onboarding.MilSimOperators.stages = {
	{
		name = "MilsimOperatorsPopup"
	}
}

function Onboarding.MilSimOperators.WasCompleted(arg_85_0, arg_85_1)
	return Engine.ECCJEIDDC(arg_85_1, Onboarding.tutorials.MILSIM_OPERATORS)
end

function Onboarding.MilSimOperators.MarkCompleted(arg_86_0, arg_86_1)
	Engine.CIHICIEBIA(arg_86_1, Onboarding.tutorials.MILSIM_OPERATORS)
	ACTIONS.UploadStats(arg_86_0, arg_86_1)
end

Onboarding.WZSplitLoadoutAndCWOperators = {}
Onboarding.WZSplitLoadoutAndCWOperators.stages = {
	{
		name = "WZSplitLoadoutAndCWOperatorsPopup"
	}
}

function Onboarding.WZSplitLoadoutAndCWOperators.WasCompleted(arg_87_0, arg_87_1)
	return Engine.ECCJEIDDC(arg_87_1, Onboarding.tutorials.OPERATORS_CH2WZ)
end

function Onboarding.WZSplitLoadoutAndCWOperators.MarkCompleted(arg_88_0, arg_88_1)
	Engine.CIHICIEBIA(arg_88_1, Onboarding.tutorials.OPERATORS_CH2WZ)
	ACTIONS.UploadStats(arg_88_0, arg_88_1)
end

Onboarding.WZBootCrossProgression = {}
Onboarding.WZBootCrossProgression.stages = {
	{
		name = "WZBootCrossProgressionPopup"
	}
}

function Onboarding.WZBootCrossProgression.WasCompleted(arg_89_0, arg_89_1)
	return Engine.ECCJEIDDC(arg_89_1, Onboarding.tutorials.CROSS_PROGRESSION_BOOT_WZ)
end

function Onboarding.WZBootCrossProgression.MarkCompleted(arg_90_0, arg_90_1)
	Engine.CIHICIEBIA(arg_90_1, Onboarding.tutorials.CROSS_PROGRESSION_BOOT_WZ)
	ACTIONS.UploadStats(arg_90_0, arg_90_1)
end

Onboarding.MWBootCrossProgression = {}
Onboarding.MWBootCrossProgression.stages = {
	{
		name = "MWBootCrossProgressionPopup"
	}
}

function Onboarding.MWBootCrossProgression.WasCompleted(arg_91_0, arg_91_1)
	return Engine.ECCJEIDDC(arg_91_1, Onboarding.tutorials.CROSS_PROGRESSION_BOOT_MW)
end

function Onboarding.MWBootCrossProgression.MarkCompleted(arg_92_0, arg_92_1)
	Engine.CIHICIEBIA(arg_92_1, Onboarding.tutorials.CROSS_PROGRESSION_BOOT_MW)
	ACTIONS.UploadStats(arg_92_0, arg_92_1)
end

Onboarding.GunsmithCustoms = {}
Onboarding.GunsmithCustoms.stages = {
	{
		name = "GunsmithCustomsPopup"
	}
}

function Onboarding.GunsmithCustoms.WasCompleted(arg_93_0, arg_93_1)
	return Engine.ECCJEIDDC(arg_93_1, Onboarding.tutorials.GUNSMITH_CUSTOMS)
end

function Onboarding.GunsmithCustoms.MarkCompleted(arg_94_0, arg_94_1)
	Engine.CIHICIEBIA(arg_94_1, Onboarding.tutorials.GUNSMITH_CUSTOMS)
	ACTIONS.UploadStats(arg_94_0, arg_94_1)
end

Onboarding.GamemodeTDM = {}
Onboarding.GamemodeTDM.stages = {
	{
		name = "GamemodeTDMPopup"
	}
}

function Onboarding.GamemodeTDM.WasCompleted(arg_95_0, arg_95_1)
	return Engine.ECCJEIDDC(arg_95_1, Onboarding.tutorials.GAMEMODE_TDM)
end

function Onboarding.GamemodeTDM.MarkCompleted(arg_96_0, arg_96_1)
	Engine.CIHICIEBIA(arg_96_1, Onboarding.tutorials.GAMEMODE_TDM)
	ACTIONS.UploadStats(arg_96_0, arg_96_1)
end

Onboarding.GamemodeGunfight = {}
Onboarding.GamemodeGunfight.stages = {
	{
		name = "GamemodeGunfightPopup"
	}
}

function Onboarding.GamemodeGunfight.WasCompleted(arg_97_0, arg_97_1)
	return Engine.ECCJEIDDC(arg_97_1, Onboarding.tutorials.GAMEMODE_GUNFIGHT)
end

function Onboarding.GamemodeGunfight.MarkCompleted(arg_98_0, arg_98_1)
	Engine.CIHICIEBIA(arg_98_1, Onboarding.tutorials.GAMEMODE_GUNFIGHT)
	ACTIONS.UploadStats(arg_98_0, arg_98_1)
end

Onboarding.GamemodeMoshpit = {}
Onboarding.GamemodeMoshpit.stages = {
	{
		name = "GamemodeMoshpitPopup"
	}
}

function Onboarding.GamemodeMoshpit.WasCompleted(arg_99_0, arg_99_1)
	return Engine.ECCJEIDDC(arg_99_1, Onboarding.tutorials.GAMEMODE_MOSHPIT)
end

function Onboarding.GamemodeMoshpit.MarkCompleted(arg_100_0, arg_100_1)
	Engine.CIHICIEBIA(arg_100_1, Onboarding.tutorials.GAMEMODE_MOSHPIT)
	ACTIONS.UploadStats(arg_100_0, arg_100_1)
end

Onboarding.GamemodeArmoredRoyale = {}
Onboarding.GamemodeArmoredRoyale.stages = {
	{
		name = "GamemodeArmoredRoyalePopup"
	}
}

function Onboarding.GamemodeArmoredRoyale.WasCompleted(arg_101_0, arg_101_1)
	return Engine.ECCJEIDDC(arg_101_1, Onboarding.tutorials.GAMEMODE_ARMORED_ROYALE)
end

function Onboarding.GamemodeArmoredRoyale.MarkCompleted(arg_102_0, arg_102_1)
	Engine.CIHICIEBIA(arg_102_1, Onboarding.tutorials.GAMEMODE_ARMORED_ROYALE)
	ACTIONS.UploadStats(arg_102_0, arg_102_1)
end

Onboarding.GamemodeZombiesBR = {}
Onboarding.GamemodeZombiesBR.stages = {
	{
		name = "GamemodeZombiesBRPopup"
	}
}

function Onboarding.GamemodeZombiesBR.WasCompleted(arg_103_0, arg_103_1)
	return Engine.ECCJEIDDC(arg_103_1, Onboarding.tutorials.ZOMBIES_BR)
end

function Onboarding.GamemodeZombiesBR.MarkCompleted(arg_104_0, arg_104_1)
	Engine.CIHICIEBIA(arg_104_1, Onboarding.tutorials.ZOMBIES_BR)
	ACTIONS.UploadStats(arg_104_0, arg_104_1)
end

Onboarding.WeaponMasteryChallenges = {}
Onboarding.WeaponMasteryChallenges.stages = {
	{
		name = "WeaponMasteryChallengesPopup"
	}
}

function Onboarding.WeaponMasteryChallenges.WasCompleted(arg_105_0, arg_105_1)
	return Engine.ECCJEIDDC(arg_105_1, Onboarding.tutorials.WEAPON_MASTERY_CHALLENGES)
end

function Onboarding.WeaponMasteryChallenges.MarkCompleted(arg_106_0, arg_106_1)
	Engine.CIHICIEBIA(arg_106_1, Onboarding.tutorials.WEAPON_MASTERY_CHALLENGES)
	ACTIONS.UploadStats(arg_106_0, arg_106_1)
end

Onboarding.WeaponCH2WZMasteryChallenges = {}
Onboarding.WeaponCH2WZMasteryChallenges.stages = {
	{
		name = "WeaponCH2WZMasteryChallengesPopup"
	}
}

function Onboarding.WeaponCH2WZMasteryChallenges.WasCompleted(arg_107_0, arg_107_1)
	return Engine.ECCJEIDDC(arg_107_1, Onboarding.tutorials.WEAPON_MASTERY_CHALLENGES_CH2WZ)
end

function Onboarding.WeaponCH2WZMasteryChallenges.MarkCompleted(arg_108_0, arg_108_1)
	Engine.CIHICIEBIA(arg_108_1, Onboarding.tutorials.WEAPON_MASTERY_CHALLENGES_CH2WZ)
	ACTIONS.UploadStats(arg_108_0, arg_108_1)
end

Onboarding.WeaponCH2WZLoadoutUpdate = {}
Onboarding.WeaponCH2WZLoadoutUpdate.stages = {
	{
		name = "WeaponCH2WZLoadoutUpdatePopup"
	}
}

function Onboarding.WeaponCH2WZLoadoutUpdate.WasCompleted(arg_109_0, arg_109_1)
	return Engine.ECCJEIDDC(arg_109_1, Onboarding.tutorials.LOADOUT_UPDATE_WZ)
end

function Onboarding.WeaponCH2WZLoadoutUpdate.MarkCompleted(arg_110_0, arg_110_1)
	Engine.CIHICIEBIA(arg_110_1, Onboarding.tutorials.LOADOUT_UPDATE_WZ)
	ACTIONS.UploadStats(arg_110_0, arg_110_1)
end

Onboarding.WeaponCH2WZWeaponCustomization = {}
Onboarding.WeaponCH2WZWeaponCustomization.stages = {
	{
		name = "WeaponCH2WZWeaponCustomizationPopup"
	}
}

function Onboarding.WeaponCH2WZWeaponCustomization.WasCompleted(arg_111_0, arg_111_1)
	return Engine.ECCJEIDDC(arg_111_1, Onboarding.tutorials.WEAPON_CUSTOMIZATION)
end

function Onboarding.WeaponCH2WZWeaponCustomization.MarkCompleted(arg_112_0, arg_112_1)
	Engine.CIHICIEBIA(arg_112_1, Onboarding.tutorials.WEAPON_CUSTOMIZATION)
	ACTIONS.UploadStats(arg_112_0, arg_112_1)
end

Onboarding.GamemodeTDMAnywhere = {}
Onboarding.GamemodeTDMAnywhere.stages = {
	{
		name = "GamemodeTDMAnywherePopup"
	}
}

function Onboarding.GamemodeTDMAnywhere.WasCompleted(arg_113_0, arg_113_1)
	return Engine.ECCJEIDDC(arg_113_1, Onboarding.tutorials.GAMEMODE_TDM_ANYWHERE)
end

function Onboarding.GamemodeTDMAnywhere.MarkCompleted(arg_114_0, arg_114_1)
	Engine.CIHICIEBIA(arg_114_1, Onboarding.tutorials.GAMEMODE_TDM_ANYWHERE)
	ACTIONS.UploadStats(arg_114_0, arg_114_1)
end

Onboarding.VehicleHorn = {}
Onboarding.VehicleHorn.stages = {
	{
		name = "VehicleHornPopup"
	}
}

function Onboarding.VehicleHorn.WasCompleted(arg_115_0, arg_115_1)
	return Engine.ECCJEIDDC(arg_115_1, Onboarding.tutorials.VEHICLE_HORN)
end

function Onboarding.VehicleHorn.MarkCompleted(arg_116_0, arg_116_1)
	Engine.CIHICIEBIA(arg_116_1, Onboarding.tutorials.VEHICLE_HORN)
	ACTIONS.UploadStats(arg_116_0, arg_116_1)
end

Onboarding.BlueprintStore = {}
Onboarding.BlueprintStore.stages = {
	{
		name = "BlueprintStorePopup"
	}
}

function Onboarding.BlueprintStore.WasCompleted(arg_117_0, arg_117_1)
	return Engine.ECCJEIDDC(arg_117_1, Onboarding.tutorials.BLUEPRINT_STORE)
end

function Onboarding.BlueprintStore.MarkCompleted(arg_118_0, arg_118_1)
	Engine.CIHICIEBIA(arg_118_1, Onboarding.tutorials.BLUEPRINT_STORE)
	ACTIONS.UploadStats(arg_118_0, arg_118_1)
end

Onboarding.Sprays = {}
Onboarding.Sprays.stages = {
	{
		name = "SpraysPopup"
	}
}

function Onboarding.Sprays.WasCompleted(arg_119_0, arg_119_1)
	return Engine.ECCJEIDDC(arg_119_1, Onboarding.tutorials.SPRAYS)
end

function Onboarding.Sprays.MarkCompleted(arg_120_0, arg_120_1)
	Engine.CIHICIEBIA(arg_120_1, Onboarding.tutorials.SPRAYS)
	ACTIONS.UploadStats(arg_120_0, arg_120_1)
end

Onboarding.BattleTracks = {}
Onboarding.BattleTracks.stages = {
	{
		name = "BattleTracksPopup"
	}
}

function Onboarding.BattleTracks.WasCompleted(arg_121_0, arg_121_1)
	return Engine.ECCJEIDDC(arg_121_1, Onboarding.tutorials.BATTLE_TRACKS)
end

function Onboarding.BattleTracks.MarkCompleted(arg_122_0, arg_122_1)
	Engine.CIHICIEBIA(arg_122_1, Onboarding.tutorials.BATTLE_TRACKS)
	ACTIONS.UploadStats(arg_122_0, arg_122_1)
end

Onboarding.TRIAL_EVENT_INTRODUCTION = {}
Onboarding.TRIAL_EVENT_INTRODUCTION.stages = {
	{
		name = "TrialEventIntroductionPopup"
	}
}

function Onboarding.TRIAL_EVENT_INTRODUCTION.WasCompleted(arg_123_0, arg_123_1)
	return Engine.ECCJEIDDC(arg_123_1, Onboarding.tutorials.TRIAL_EVENT_INTRODUCTION)
end

function Onboarding.TRIAL_EVENT_INTRODUCTION.MarkCompleted(arg_124_0, arg_124_1)
	Engine.CIHICIEBIA(arg_124_1, Onboarding.tutorials.TRIAL_EVENT_INTRODUCTION)
	ACTIONS.UploadStats(arg_124_0, arg_124_1)
end

Onboarding.MasterChallenges = {}
Onboarding.MasterChallenges.stages = {
	{
		name = "MasterChallengesPopup"
	}
}

function Onboarding.MasterChallenges.WasCompleted(arg_125_0, arg_125_1)
	return Engine.ECCJEIDDC(arg_125_1, Onboarding.tutorials.MASTER_CHALLENGES)
end

function Onboarding.MasterChallenges.MarkCompleted(arg_126_0, arg_126_1)
	Engine.CIHICIEBIA(arg_126_1, Onboarding.tutorials.MASTER_CHALLENGES)
	ACTIONS.UploadStats(arg_126_0, arg_126_1)
end

Onboarding.MasteryChallengesCH2WZDaily = {}
Onboarding.MasteryChallengesCH2WZDaily.stages = {
	{
		name = "MasteryChallengesCH2WZDailyPopup"
	}
}

function Onboarding.MasteryChallengesCH2WZDaily.WasCompleted(arg_127_0, arg_127_1)
	return Engine.ECCJEIDDC(arg_127_1, Onboarding.tutorials.CHALLENGES_WEAPON_CH2WZ_DAILY)
end

function Onboarding.MasteryChallengesCH2WZDaily.MarkCompleted(arg_128_0, arg_128_1)
	Engine.CIHICIEBIA(arg_128_1, Onboarding.tutorials.CHALLENGES_WEAPON_CH2WZ_DAILY)
	ACTIONS.UploadStats(arg_128_0, arg_128_1)
end

Onboarding.WeaponMasteryClassifiedChallenges = {}
Onboarding.WeaponMasteryClassifiedChallenges.stages = {
	{
		name = "ClassifiedChallengePopup"
	}
}

function Onboarding.WeaponMasteryClassifiedChallenges.WasCompleted(arg_129_0, arg_129_1)
	return Engine.ECCJEIDDC(arg_129_1, Onboarding.tutorials.WEAPON_MASTERY_CLASSIFIED_CHALLENGES)
end

function Onboarding.WeaponMasteryClassifiedChallenges.MarkCompleted(arg_130_0, arg_130_1)
	Engine.CIHICIEBIA(arg_130_1, Onboarding.tutorials.WEAPON_MASTERY_CLASSIFIED_CHALLENGES)
	ACTIONS.UploadStats(arg_130_0, arg_130_1)
end

Onboarding.WeaponMasteryChallengeReserves = {}
Onboarding.WeaponMasteryChallengeReserves.stages = {
	{
		name = "WeaponMasteryChallengeReservesPopup"
	}
}

function Onboarding.WeaponMasteryChallengeReserves.WasCompleted(arg_131_0, arg_131_1)
	return Engine.ECCJEIDDC(arg_131_1, Onboarding.tutorials.WEAPON_MASTERY_CHALLENGE_RESERVE)
end

function Onboarding.WeaponMasteryChallengeReserves.MarkCompleted(arg_132_0, arg_132_1)
	Engine.CIHICIEBIA(arg_132_1, Onboarding.tutorials.WEAPON_MASTERY_CHALLENGE_RESERVE)
	ACTIONS.UploadStats(arg_132_0, arg_132_1)
end

Onboarding.BarracksCH2MWEquip = {}
Onboarding.BarracksCH2MWEquip.stages = {
	{
		name = "BarracksCH2MWEquipPopup"
	}
}

function Onboarding.BarracksCH2MWEquip.WasCompleted(arg_133_0, arg_133_1)
	return Engine.ECCJEIDDC(arg_133_1, Onboarding.tutorials.BARRACKS_CH2MW_EQUIP)
end

function Onboarding.BarracksCH2MWEquip.MarkCompleted(arg_134_0, arg_134_1)
	Engine.CIHICIEBIA(arg_134_1, Onboarding.tutorials.BARRACKS_CH2MW_EQUIP)
	ACTIONS.UploadStats(arg_134_0, arg_134_1)
end

Onboarding.BarracksCH2WZEquip = {}
Onboarding.BarracksCH2WZEquip.stages = {
	{
		name = "BarracksCH2WZEquipPopup"
	}
}

function Onboarding.BarracksCH2WZEquip.WasCompleted(arg_135_0, arg_135_1)
	return Engine.ECCJEIDDC(arg_135_1, Onboarding.tutorials.BARRACKS_CH2WZ_EQUIP)
end

function Onboarding.BarracksCH2WZEquip.MarkCompleted(arg_136_0, arg_136_1)
	Engine.CIHICIEBIA(arg_136_1, Onboarding.tutorials.BARRACKS_CH2WZ_EQUIP)
	ACTIONS.UploadStats(arg_136_0, arg_136_1)
end

Onboarding.WarzonePrivateMatch = {}
Onboarding.WarzonePrivateMatch.stages = {
	{
		name = "WarzonePrivateMatchPopup"
	}
}

function Onboarding.WarzonePrivateMatch.WasCompleted(arg_137_0, arg_137_1)
	return Engine.ECCJEIDDC(arg_137_1, Onboarding.tutorials.WARZONE_PRIVATE_MATCH)
end

function Onboarding.WarzonePrivateMatch.MarkCompleted(arg_138_0, arg_138_1)
	Engine.CIHICIEBIA(arg_138_1, Onboarding.tutorials.WARZONE_PRIVATE_MATCH)
	ACTIONS.UploadStats(arg_138_0, arg_138_1)
end

Onboarding.AMRB = {}
Onboarding.AMRB.stages = {
	{
		name = "AMRBOnboardingPopup"
	}
}

function Onboarding.AMRB.WasCompleted(arg_139_0, arg_139_1)
	return Engine.ECCJEIDDC(arg_139_1, Onboarding.tutorials.AMRB_ONBOARDING)
end

function Onboarding.AMRB.MarkCompleted(arg_140_0, arg_140_1)
	SEASONAL_EVENT.ResetUnlocksSeen(arg_140_1)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_140_1, false)
	Engine.CIHICIEBIA(arg_140_1, Onboarding.tutorials.AMRB_ONBOARDING)
	ACTIONS.UploadStats(arg_140_0, arg_140_1)
end

Onboarding.HalloweenOnboarding = {}
Onboarding.HalloweenOnboarding.stages = {
	{
		name = "HalloweenOnboardingPopup"
	}
}

function Onboarding.HalloweenOnboarding.WasCompleted(arg_141_0, arg_141_1)
	return Engine.ECCJEIDDC(arg_141_1, Onboarding.tutorials.HALLOWEEN_ONBOARDING)
end

function Onboarding.HalloweenOnboarding.MarkCompleted(arg_142_0, arg_142_1)
	SEASONAL_EVENT.ResetUnlocksSeen(arg_142_1)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_142_1, false)
	Engine.CIHICIEBIA(arg_142_1, Onboarding.tutorials.HALLOWEEN_ONBOARDING)
	ACTIONS.UploadStats(arg_142_0, arg_142_1)
end

Onboarding.ZombiesEvent = {}
Onboarding.ZombiesEvent.stages = {
	{
		name = "ZombiesOnboardingPopup"
	}
}

function Onboarding.ZombiesEvent.WasCompleted(arg_143_0, arg_143_1)
	return Engine.ECCJEIDDC(arg_143_1, Onboarding.tutorials.ZOMBIES_EVENT_ONBOARDING)
end

function Onboarding.ZombiesEvent.MarkCompleted(arg_144_0, arg_144_1)
	SEASONAL_EVENT.ResetUnlocksSeen(arg_144_1)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_144_1, false)
	Engine.CIHICIEBIA(arg_144_1, Onboarding.tutorials.ZOMBIES_EVENT_ONBOARDING)
	ACTIONS.UploadStats(arg_144_0, arg_144_1)
end

Onboarding.AdlerEvent = {}
Onboarding.AdlerEvent.stages = {
	{
		name = "AdlerOnboardingPopup"
	}
}

function Onboarding.AdlerEvent.WasCompleted(arg_145_0, arg_145_1)
	return Engine.ECCJEIDDC(arg_145_1, Onboarding.tutorials.ADLER_EVENT_ONBOARDING)
end

function Onboarding.AdlerEvent.MarkCompleted(arg_146_0, arg_146_1)
	SEASONAL_EVENT.ResetUnlocksSeen(arg_146_1)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_146_1, false)
	Engine.CIHICIEBIA(arg_146_1, Onboarding.tutorials.ADLER_EVENT_ONBOARDING)
	ACTIONS.UploadStats(arg_146_0, arg_146_1)
end

Onboarding.SoAEvent = {}
Onboarding.SoAEvent.stages = {
	{
		name = "SoAOnboardingPopup"
	}
}

function Onboarding.SoAEvent.WasCompleted(arg_147_0, arg_147_1)
	return Engine.ECCJEIDDC(arg_147_1, Onboarding.tutorials.SUMMER_OF_ACTION_EVENT_ONBOARDING)
end

function Onboarding.SoAEvent.MarkCompleted(arg_148_0, arg_148_1)
	SEASONAL_EVENT.ResetUnlocksSeen(arg_148_1)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_148_1, false)
	Engine.CIHICIEBIA(arg_148_1, Onboarding.tutorials.SUMMER_OF_ACTION_EVENT_ONBOARDING)
	ACTIONS.UploadStats(arg_148_0, arg_148_1)
end

Onboarding.SeasonalEvent = {}
Onboarding.SeasonalEvent.stages = {
	{
		name = "SeasonalEventPopup"
	}
}

function Onboarding.SeasonalEvent.WasCompleted(arg_149_0, arg_149_1)
	return Engine.ECCJEIDDC(arg_149_1, SEASONAL_EVENT.GetPopupOnboardingWatchFlag())
end

function Onboarding.SeasonalEvent.MarkCompleted(arg_150_0, arg_150_1)
	SEASONAL_EVENT.ResetUnlocksSeen(arg_150_1)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_150_1, false)
	Engine.CIHICIEBIA(arg_150_1, SEASONAL_EVENT.GetPopupOnboardingWatchFlag())
	ACTIONS.UploadStats(arg_150_0, arg_150_1)
end

Onboarding.LEP = {}
Onboarding.LEP.stages = {
	{
		name = "LepPopup"
	}
}

function Onboarding.LEP.WasCompleted(arg_151_0, arg_151_1)
	return Engine.ECCJEIDDC(arg_151_1, Onboarding.tutorials.LEP_ONBOARDING)
end

function Onboarding.LEP.MarkCompleted(arg_152_0, arg_152_1)
	SEASONAL_EVENT.ResetUnlocksSeen(arg_152_1)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_152_1, false)
	Engine.CIHICIEBIA(arg_152_1, Onboarding.tutorials.LEP_ONBOARDING)
	ACTIONS.UploadStats(arg_152_0, arg_152_1)
end

Onboarding.Rebirth = {}
Onboarding.Rebirth.stages = {
	{
		name = "RebirthPopup"
	}
}

function Onboarding.Rebirth.WasCompleted(arg_153_0, arg_153_1)
	return Engine.ECCJEIDDC(arg_153_1, Onboarding.tutorials.REBIRTH_ONBOARDING)
end

function Onboarding.Rebirth.MarkCompleted(arg_154_0, arg_154_1)
	Engine.CIHICIEBIA(arg_154_1, Onboarding.tutorials.REBIRTH_ONBOARDING)
	ACTIONS.UploadStats(arg_154_0, arg_154_1)
end

Onboarding.RebirthEvent = {}
Onboarding.RebirthEvent.stages = {
	{
		name = "RebirthEventPopup"
	}
}

function Onboarding.RebirthEvent.WasCompleted(arg_155_0, arg_155_1)
	return Engine.ECCJEIDDC(arg_155_1, Onboarding.tutorials.REBIRTH_EVENT_ONBOARDING)
end

function Onboarding.RebirthEvent.MarkCompleted(arg_156_0, arg_156_1)
	SEASONAL_EVENT.ResetUnlocksSeen(arg_156_1)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_156_1, false)
	Engine.CIHICIEBIA(arg_156_1, Onboarding.tutorials.REBIRTH_EVENT_ONBOARDING)
	ACTIONS.UploadStats(arg_156_0, arg_156_1)
end

Onboarding.CareerMW = {}
Onboarding.CareerMW.stages = {
	{
		name = "CareerMWPopup"
	}
}

function Onboarding.CareerMW.WasCompleted(arg_157_0, arg_157_1)
	return Engine.ECCJEIDDC(arg_157_1, Onboarding.tutorials.CAREER_MW)
end

function Onboarding.CareerMW.MarkCompleted(arg_158_0, arg_158_1)
	Engine.CIHICIEBIA(arg_158_1, Onboarding.tutorials.CAREER_MW)
	ACTIONS.UploadStats(arg_158_0, arg_158_1)
end

Onboarding.CareerWZ = {}
Onboarding.CareerWZ.stages = {
	{
		name = "CareerWZPopup"
	}
}

function Onboarding.CareerWZ.WasCompleted(arg_159_0, arg_159_1)
	return Engine.ECCJEIDDC(arg_159_1, Onboarding.tutorials.CAREER_WZ)
end

function Onboarding.CareerWZ.MarkCompleted(arg_160_0, arg_160_1)
	Engine.CIHICIEBIA(arg_160_1, Onboarding.tutorials.CAREER_WZ)
	ACTIONS.UploadStats(arg_160_0, arg_160_1)
end

Onboarding.CareerWZSeasonLeveling = {}
Onboarding.CareerWZSeasonLeveling.stages = {
	{
		name = "CareerWZSeasonLevelingPopup"
	}
}

function Onboarding.CareerWZSeasonLeveling.WasCompleted(arg_161_0, arg_161_1)
	return Engine.ECCJEIDDC(arg_161_1, Onboarding.tutorials.CAREER_WZ_LEVELING)
end

function Onboarding.CareerWZSeasonLeveling.MarkCompleted(arg_162_0, arg_162_1)
	Engine.CIHICIEBIA(arg_162_1, Onboarding.tutorials.CAREER_WZ_LEVELING)
	ACTIONS.UploadStats(arg_162_0, arg_162_1)
end

Onboarding.CareerMWSeasonLeveling = {}
Onboarding.CareerMWSeasonLeveling.stages = {
	{
		name = "CareerMWSeasonLevelingPopup"
	}
}

function Onboarding.CareerMWSeasonLeveling.WasCompleted(arg_163_0, arg_163_1)
	return Engine.ECCJEIDDC(arg_163_1, Onboarding.tutorials.CAREER_MW_LEVELING)
end

function Onboarding.CareerMWSeasonLeveling.MarkCompleted(arg_164_0, arg_164_1)
	Engine.CIHICIEBIA(arg_164_1, Onboarding.tutorials.CAREER_MW_LEVELING)
	ACTIONS.UploadStats(arg_164_0, arg_164_1)
end

Onboarding.PrestigeProgression = {}
Onboarding.PrestigeProgression.stages = {
	{
		name = "PrestigeProgressionPopup"
	}
}

function Onboarding.PrestigeProgression.WasCompleted(arg_165_0, arg_165_1)
	return Engine.ECCJEIDDC(arg_165_1, Onboarding.tutorials.PRESTIGE_PROGRESSION)
end

function Onboarding.PrestigeProgression.MarkCompleted(arg_166_0, arg_166_1)
	Engine.CIHICIEBIA(arg_166_1, Onboarding.tutorials.PRESTIGE_PROGRESSION)
	ACTIONS.UploadStats(arg_166_0, arg_166_1)
end

Onboarding.PrestigeMasterProgression = {}
Onboarding.PrestigeMasterProgression.stages = {
	{
		name = "PrestigeMasterProgressionPopup"
	}
}

function Onboarding.PrestigeMasterProgression.WasCompleted(arg_167_0, arg_167_1)
	return Engine.ECCJEIDDC(arg_167_1, Onboarding.tutorials.PRESTIGE_MASTER_PROGRESSION)
end

function Onboarding.PrestigeMasterProgression.MarkCompleted(arg_168_0, arg_168_1)
	Engine.CIHICIEBIA(arg_168_1, Onboarding.tutorials.PRESTIGE_MASTER_PROGRESSION)
	ACTIONS.UploadStats(arg_168_0, arg_168_1)
end

Onboarding.Gifting2FA = {}
Onboarding.Gifting2FA.stages = {
	{
		name = "Gifting2FAPopup"
	}
}

function Onboarding.Gifting2FA.WasCompleted(arg_169_0, arg_169_1)
	return Engine.ECCJEIDDC(arg_169_1, Onboarding.tutorials.GIFTING_2FA)
end

function Onboarding.Gifting2FA.MarkCompleted(arg_170_0, arg_170_1)
	Engine.CIHICIEBIA(arg_170_1, Onboarding.tutorials.GIFTING_2FA)
	ACTIONS.UploadStats(arg_170_0, arg_170_1)
end

Onboarding.LookForParty = {}
Onboarding.LookForParty.stages = {
	{
		name = "LookingForPartyPopup"
	}
}

function Onboarding.LookForParty.WasCompleted(arg_171_0, arg_171_1)
	return Engine.ECCJEIDDC(arg_171_1, Onboarding.tutorials.LOOK_FOR_PARTY)
end

function Onboarding.LookForParty.MarkCompleted(arg_172_0, arg_172_1)
	Engine.CIHICIEBIA(arg_172_1, Onboarding.tutorials.LOOK_FOR_PARTY)
	ACTIONS.UploadStats(arg_172_0, arg_172_1)
end

Onboarding.VanguardBattlePassSplitTiers = {}
Onboarding.VanguardBattlePassSplitTiers.stages = {
	{
		name = "VanguardBattlePassSplitTiersPopup"
	}
}

function Onboarding.VanguardBattlePassSplitTiers.WasCompleted(arg_173_0, arg_173_1)
	return Engine.ECCJEIDDC(arg_173_1, Onboarding.tutorials.VG_BP_SPLIT_TIERS)
end

function Onboarding.VanguardBattlePassSplitTiers.MarkCompleted(arg_174_0, arg_174_1)
	Engine.CIHICIEBIA(arg_174_1, Onboarding.tutorials.VG_BP_SPLIT_TIERS)
	ACTIONS.UploadStats(arg_174_0, arg_174_1)
end

Onboarding.CortezInstantGratPopup = {}
Onboarding.CortezInstantGratPopup.states = {
	{
		name = "CortezInstantGratificationPopup"
	}
}

function Onboarding.CortezInstantGratPopup.WasCompleted(arg_175_0, arg_175_1)
	return Engine.ECCJEIDDC(arg_175_1, Onboarding.tutorials.CORTEZ_INSTANT_GRAT_SHOWN)
end

function Onboarding.CortezInstantGratPopup.MarkCompleted(arg_176_0, arg_176_1)
	Engine.CIHICIEBIA(arg_176_1, Onboarding.tutorials.CORTEZ_INSTANT_GRAT_SHOWN)
	ACTIONS.UploadStats(arg_176_0, arg_176_1)
end

Onboarding.CortezInstantGratPopupAfterSeasonStart = {}
Onboarding.CortezInstantGratPopupAfterSeasonStart.states = {
	{
		name = "CortezInstantGratificationPopupAfterSeasonStart"
	}
}

function Onboarding.CortezInstantGratPopupAfterSeasonStart.WasCompleted(arg_177_0, arg_177_1)
	return Engine.ECCJEIDDC(arg_177_1, Onboarding.tutorials.CORTEZ_INSTANT_GRAT_SHOWN_AFTER_SEASON_START)
end

function Onboarding.CortezInstantGratPopupAfterSeasonStart.MarkCompleted(arg_178_0, arg_178_1)
	Engine.CIHICIEBIA(arg_178_1, Onboarding.tutorials.CORTEZ_INSTANT_GRAT_SHOWN_AFTER_SEASON_START)
	ACTIONS.UploadStats(arg_178_0, arg_178_1)
end

Onboarding.GroupsRevealAfterRegimentTransition = {}
Onboarding.GroupsRevealAfterRegimentTransition.stages = {
	{
		"GroupsRevealPopup"
	}
}

function Onboarding.GroupsRevealAfterRegimentTransition.WasCompleted(arg_179_0, arg_179_1)
	return Engine.ECCJEIDDC(arg_179_1, Onboarding.tutorials.GROUPS_REVEAL_AFTER_REGIMENT_TRANSITON)
end

function Onboarding.GroupsRevealAfterRegimentTransition.MarkCompleted(arg_180_0, arg_180_1)
	Engine.CIHICIEBIA(arg_180_1, Onboarding.tutorials.GROUPS_REVEAL_AFTER_REGIMENT_TRANSITON)
	ACTIONS.UploadStats(arg_180_0, arg_180_1)
end

function Onboarding.BeginFlow(arg_181_0, arg_181_1, arg_181_2)
	if arg_181_0._activeFlow then
		return false
	end

	assert(arg_181_2)

	if arg_181_1:WasCompleted(arg_181_2) then
		return false
	end

	assert(#arg_181_1.stages > 0)

	arg_181_0._activeFlow = arg_181_1
	arg_181_0._currentStage = 1
	arg_181_0._controllerIndex = arg_181_2

	return true
end

function Onboarding.IsFlowInProgress(arg_182_0, arg_182_1)
	return arg_182_1 == arg_182_0._activeFlow
end

function Onboarding.AdvanceFlow(arg_183_0, arg_183_1, arg_183_2)
	if arg_183_0._activeFlow ~= arg_183_1 then
		return false
	end

	local var_183_0 = false

	for iter_183_0, iter_183_1 in ipairs(arg_183_0._activeFlow.stages) do
		if iter_183_1.name == arg_183_2 and iter_183_0 == arg_183_0._currentStage then
			arg_183_0._currentStage = arg_183_0._currentStage + 1

			DebugPrint("Onboarding completed stage: " .. arg_183_2)

			var_183_0 = true

			break
		end
	end

	if arg_183_0._currentStage > #arg_183_0._activeFlow.stages then
		arg_183_0:CompleteFlow()
	end

	return var_183_0
end

function Onboarding.ResetFlow(arg_184_0, arg_184_1)
	if arg_184_0._activeFlow and arg_184_0._activeFlow == arg_184_1 then
		arg_184_0._activeFlow = nil
		arg_184_0._currentStage = nil
		arg_184_0._controllerIndex = nil
	end
end

function Onboarding.CompleteFlow(arg_185_0)
	if arg_185_0._activeFlow then
		arg_185_0._activeFlow:MarkCompleted(arg_185_0._controllerIndex)

		arg_185_0._activeFlow = nil
		arg_185_0._currentStage = nil
		arg_185_0._controllerIndex = nil
	end
end

function Onboarding.ApplyWhitelist(arg_186_0, arg_186_1, arg_186_2)
	if not arg_186_0._activeFlow then
		return
	end

	local var_186_0 = arg_186_0._activeFlow.stages[arg_186_0._currentStage]

	assert(var_186_0)

	local var_186_1

	if var_186_0.whitelist then
		for iter_186_0, iter_186_1 in ipairs(var_186_0.whitelist) do
			if iter_186_1.menu == arg_186_1 then
				var_186_1 = iter_186_1.buttons

				break
			end
		end
	end

	if not var_186_1 then
		return
	end

	local var_186_2 = arg_186_2:getFirstChild()

	while var_186_2 do
		if var_186_2.SetButtonDisabled then
			if not LUI.IsItemInArray(var_186_1, var_186_2.id) then
				var_186_2:SetButtonDisabled(true)
			end
		else
			Onboarding:ApplyWhitelist(arg_186_1, var_186_2)
		end

		var_186_2 = var_186_2:getNextSibling()
	end
end

function Onboarding.GetOnboardingForGametype(arg_187_0)
	if arg_187_0 == MP.GameMode.PlunderGameType then
		return {
			type = Onboarding.Plunder,
			data = ONBOARDING_DATA.GetPlunderTutorialData()
		}
	end
end
