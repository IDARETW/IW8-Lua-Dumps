Onboarding = {}
Onboarding.tutorials = {
	LOADOUT = 11,
	SEASON5_WATCH_FLAG = 27,
	SPECIALIST_PERKS = 13,
	SEASON4_WATCH_FLAG = 26,
	WEAPON_MASTERY_CHALLENGES = 52,
	WARZONE_TUTORIAL_GAMEPLAY_COMPLETED = 35,
	PLUNDERTUTORIAL = 44,
	FIELD_UPGRADE = 8,
	GAMEMODE_GUNFIGHT = 49,
	CP_MUNITIONS = 17,
	OFFICER = 18,
	WZ_DROPKIT = 36,
	BATTLE_PASS = 29,
	GUNSMITH_CUSTOMS = 47,
	REGIMENTS = 30,
	WEAPON_PRESTIGE = 0,
	ARMORY = 7,
	WARZONE_INTRODUCTION = 33,
	SEASON2_WATCH_FLAG = 24,
	PERKS = 3,
	_NOT_BEING_USED = 15,
	WZ_PERKS = 37,
	KILLSTREAKS = 9,
	CDL = 31,
	LOADOUT_CP = 19,
	PERK_UPDATES = 38,
	GAMEBATTLES = 39,
	VEHICLE_CAMOS = 45,
	GAMEMODE_TDM = 48,
	MILSIM_OPERATORS = 46,
	MAGMA_WATCHED_FLAG = 42,
	MISSION_CHALLENGES = 6,
	PERKS_CP = 20,
	CDL_RULES = 32,
	QUARTERMASTER = 1,
	MATURE_CONTENT = 16,
	SEASON1_WATCH_FLAG = 23,
	SEASON_UNLOCKS = 21,
	CP_ROLES = 5,
	GAMEMODE_MOSHPIT = 50,
	OPERATORS = 4,
	INTEL_MISSION_CHALLENGES = 51,
	SEASON6_WATCH_FLAG = 28,
	DISABLE_WEAPON_PRESTIGE_WARNING = 2,
	SEASON3_WATCH_FLAG = 25,
	GUNSMITH = 10,
	GAMEMODE_TDM_ANYWHERE = 53,
	BLUEPRINT_STORE = 55,
	WEAPON_MOD = 22,
	SPRAYS = 56,
	VEHICLE_HORN = 54,
	PRO_FIELD_UPGRADE = 14,
	BATTLE_TRACKS = 57,
	TRIAL_EVENT_INTRODUCTION = 58,
	WEAPON_MASTERY_CLASSIFIED_CHALLENGES = 60,
	MASTER_CHALLENGES = 59,
	ELDER_PROGRESSION = 12,
	WARZONE_PRACTICE_GAMEPLAY_COMPLETED = 41,
	_NOT_BEING_USED2 = 34,
	WARZONE_TUTORIAL_GAMEPLAY_INITIATED = 40,
	OPERATOR_MISSIONS = 43
}
TutorialSeasonValues = {
	Onboarding.tutorials.SEASON1_WATCH_FLAG,
	Onboarding.tutorials.SEASON2_WATCH_FLAG,
	Onboarding.tutorials.SEASON3_WATCH_FLAG,
	Onboarding.tutorials.SEASON4_WATCH_FLAG,
	Onboarding.tutorials.SEASON5_WATCH_FLAG,
	Onboarding.tutorials.SEASON6_WATCH_FLAG
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

Onboarding.DisableWeaponPrestigeWarning = {}
Onboarding.DisableWeaponPrestigeWarning.stages = {
	{
		name = "DisableWeaponPrestigeWarning"
	}
}

function Onboarding.DisableWeaponPrestigeWarning.WasCompleted(arg_3_0, arg_3_1)
	return Engine.ECCJEIDDC(arg_3_1, Onboarding.tutorials.DISABLE_WEAPON_PRESTIGE_WARNING)
end

function Onboarding.DisableWeaponPrestigeWarning.MarkCompleted(arg_4_0, arg_4_1)
	Engine.CIHICIEBIA(arg_4_1, Onboarding.tutorials.DISABLE_WEAPON_PRESTIGE_WARNING)
	ACTIONS.UploadStats(arg_4_0, arg_4_1)
end

Onboarding.Quartermaster = {}

function Onboarding.Quartermaster.WasCompleted(arg_5_0, arg_5_1)
	return Engine.ECCJEIDDC(arg_5_1, Onboarding.tutorials.QUARTERMASTER)
end

function Onboarding.Quartermaster.MarkCompleted(arg_6_0, arg_6_1)
	Engine.CIHICIEBIA(arg_6_1, Onboarding.tutorials.QUARTERMASTER)
	ACTIONS.UploadStats(arg_6_0, arg_6_1)
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

function Onboarding.Perks.WasCompleted(arg_7_0, arg_7_1)
	return Engine.ECCJEIDDC(arg_7_1, Onboarding.tutorials.PERKS)
end

function Onboarding.Perks.MarkCompleted(arg_8_0, arg_8_1)
	Engine.CIHICIEBIA(arg_8_1, Onboarding.tutorials.PERKS)
	ACTIONS.UploadStats(arg_8_0, arg_8_1)
end

Onboarding.PerksCP = {}
Onboarding.PerksCP.stages = {
	{
		name = "PerkPopup"
	}
}

function Onboarding.PerksCP.WasCompleted(arg_9_0, arg_9_1)
	return Engine.ECCJEIDDC(arg_9_1, Onboarding.tutorials.PERKS_CP)
end

function Onboarding.PerksCP.MarkCompleted(arg_10_0, arg_10_1)
	Engine.CIHICIEBIA(arg_10_1, Onboarding.tutorials.PERKS_CP)
	ACTIONS.UploadStats(arg_10_0, arg_10_1)
end

Onboarding.Operators = {}
Onboarding.Operators.stages = {
	{
		name = "OperatorPopup"
	}
}

function Onboarding.Operators.WasCompleted(arg_11_0, arg_11_1)
	return Engine.ECCJEIDDC(arg_11_1, Onboarding.tutorials.OPERATORS)
end

function Onboarding.Operators.MarkCompleted(arg_12_0, arg_12_1)
	Engine.CIHICIEBIA(arg_12_1, Onboarding.tutorials.OPERATORS)
	ACTIONS.UploadStats(arg_12_0, arg_12_1)
end

Onboarding.OperatorMissions = {}
Onboarding.OperatorMissions.stages = {
	{
		name = "OperatorMissionsPopup"
	}
}

function Onboarding.OperatorMissions.WasCompleted(arg_13_0, arg_13_1)
	return Engine.ECCJEIDDC(arg_13_1, Onboarding.tutorials.OPERATOR_MISSIONS)
end

function Onboarding.OperatorMissions.MarkCompleted(arg_14_0, arg_14_1)
	Engine.CIHICIEBIA(arg_14_1, Onboarding.tutorials.OPERATOR_MISSIONS)
	ACTIONS.UploadStats(arg_14_0, arg_14_1)
end

Onboarding.CPRoles = {}
Onboarding.CPRoles.stages = {
	{
		name = "CPRolePopup"
	}
}

function Onboarding.CPRoles.WasCompleted(arg_15_0, arg_15_1)
	return Engine.ECCJEIDDC(arg_15_1, Onboarding.tutorials.CP_ROLES)
end

function Onboarding.CPRoles.MarkCompleted(arg_16_0, arg_16_1)
	Engine.CIHICIEBIA(arg_16_1, Onboarding.tutorials.CP_ROLES)
	ACTIONS.UploadStats(arg_16_0, arg_16_1)
end

Onboarding.Armory = {}
Onboarding.Armory.stages = {
	{
		name = "ArmoryPopup"
	}
}

function Onboarding.Armory.WasCompleted(arg_17_0, arg_17_1)
	return Engine.ECCJEIDDC(arg_17_1, Onboarding.tutorials.ARMORY)
end

function Onboarding.Armory.MarkCompleted(arg_18_0, arg_18_1)
	Engine.CIHICIEBIA(arg_18_1, Onboarding.tutorials.ARMORY)
	ACTIONS.UploadStats(arg_18_0, arg_18_1)
end

Onboarding.FieldUpgrade = {}
Onboarding.FieldUpgrade.stages = {
	{
		name = "FieldUpgradePopup"
	}
}

function Onboarding.FieldUpgrade.WasCompleted(arg_19_0, arg_19_1)
	return Engine.ECCJEIDDC(arg_19_1, Onboarding.tutorials.FIELD_UPGRADE)
end

function Onboarding.FieldUpgrade.MarkCompleted(arg_20_0, arg_20_1)
	Engine.CIHICIEBIA(arg_20_1, Onboarding.tutorials.FIELD_UPGRADE)
	ACTIONS.UploadStats(arg_20_0, arg_20_1)
end

Onboarding.Killstreaks = {}
Onboarding.Killstreaks.stages = {
	{
		name = "KillstreakPopup"
	}
}

function Onboarding.Killstreaks.WasCompleted(arg_21_0, arg_21_1)
	return Engine.ECCJEIDDC(arg_21_1, Onboarding.tutorials.KILLSTREAKS)
end

function Onboarding.Killstreaks.MarkCompleted(arg_22_0, arg_22_1)
	Engine.CIHICIEBIA(arg_22_1, Onboarding.tutorials.KILLSTREAKS)
	ACTIONS.UploadStats(arg_22_0, arg_22_1)
end

Onboarding.Gunsmith = {}
Onboarding.Gunsmith.stages = {
	{
		name = "GunsmithPopup"
	}
}

function Onboarding.Gunsmith.WasCompleted(arg_23_0, arg_23_1)
	return Engine.ECCJEIDDC(arg_23_1, Onboarding.tutorials.GUNSMITH)
end

function Onboarding.Gunsmith.MarkCompleted(arg_24_0, arg_24_1)
	Engine.CIHICIEBIA(arg_24_1, Onboarding.tutorials.GUNSMITH)
	ACTIONS.UploadStats(arg_24_0, arg_24_1)
end

Onboarding.Loadout = {}
Onboarding.Loadout.stages = {
	{
		name = "LoadoutPopup"
	}
}

function Onboarding.Loadout.WasCompleted(arg_25_0, arg_25_1)
	return Engine.ECCJEIDDC(arg_25_1, Onboarding.tutorials.LOADOUT)
end

function Onboarding.Loadout.MarkCompleted(arg_26_0, arg_26_1)
	Engine.CIHICIEBIA(arg_26_1, Onboarding.tutorials.LOADOUT)
	ACTIONS.UploadStats(arg_26_0, arg_26_1)
end

Onboarding.LoadoutCP = {}
Onboarding.LoadoutCP.stages = {
	{
		name = "LoadoutPopup"
	}
}

function Onboarding.LoadoutCP.WasCompleted(arg_27_0, arg_27_1)
	return Engine.ECCJEIDDC(arg_27_1, Onboarding.tutorials.LOADOUT_CP)
end

function Onboarding.LoadoutCP.MarkCompleted(arg_28_0, arg_28_1)
	Engine.CIHICIEBIA(arg_28_1, Onboarding.tutorials.LOADOUT_CP)
	ACTIONS.UploadStats(arg_28_0, arg_28_1)
end

Onboarding.ElderProgression = {}
Onboarding.ElderProgression.stages = {
	{
		name = "ElderProgressionPopup"
	}
}

function Onboarding.ElderProgression.WasCompleted(arg_29_0, arg_29_1)
	return Engine.ECCJEIDDC(arg_29_1, Onboarding.tutorials.ELDER_PROGRESSION)
end

function Onboarding.ElderProgression.MarkCompleted(arg_30_0, arg_30_1)
	Engine.CIHICIEBIA(arg_30_1, Onboarding.tutorials.ELDER_PROGRESSION)
	ACTIONS.UploadStats(arg_30_0, arg_30_1)
end

Onboarding.SpecialistPerk = {}
Onboarding.SpecialistPerk.stages = {
	{
		name = "SpecialistPopup"
	}
}

function Onboarding.SpecialistPerk.WasCompleted(arg_31_0, arg_31_1)
	return Engine.ECCJEIDDC(arg_31_1, Onboarding.tutorials.SPECIALIST_PERKS)
end

function Onboarding.SpecialistPerk.MarkCompleted(arg_32_0, arg_32_1)
	Engine.CIHICIEBIA(arg_32_1, Onboarding.tutorials.SPECIALIST_PERKS)
	ACTIONS.UploadStats(arg_32_0, arg_32_1)
end

Onboarding.PerkUpdates = {}
Onboarding.PerkUpdates.stages = {
	{
		name = "PerkUpdates"
	}
}

function Onboarding.PerkUpdates.WasCompleted(arg_33_0, arg_33_1)
	return Engine.ECCJEIDDC(arg_33_1, Onboarding.tutorials.PERK_UPDATES)
end

function Onboarding.PerkUpdates.MarkCompleted(arg_34_0, arg_34_1)
	Engine.CIHICIEBIA(arg_34_1, Onboarding.tutorials.PERK_UPDATES)
	ACTIONS.UploadStats(arg_34_0, arg_34_1)
end

Onboarding.ProFieldUpgrade = {}
Onboarding.ProFieldUpgrade.stages = {
	{
		name = "ProFieldUpgradePopup"
	}
}

function Onboarding.ProFieldUpgrade.WasCompleted(arg_35_0, arg_35_1)
	return Engine.ECCJEIDDC(arg_35_1, Onboarding.tutorials.PRO_FIELD_UPGRADE)
end

function Onboarding.ProFieldUpgrade.MarkCompleted(arg_36_0, arg_36_1)
	Engine.CIHICIEBIA(arg_36_1, Onboarding.tutorials.PRO_FIELD_UPGRADE)
	ACTIONS.UploadStats(arg_36_0, arg_36_1)
end

Onboarding.MissionChallenges = {}
Onboarding.MissionChallenges.stages = {
	{
		name = "MissionChallenges"
	}
}

function Onboarding.MissionChallenges.WasCompleted(arg_37_0, arg_37_1)
	return Engine.ECCJEIDDC(arg_37_1, Onboarding.tutorials.MISSION_CHALLENGES)
end

function Onboarding.MissionChallenges.MarkCompleted(arg_38_0, arg_38_1)
	Engine.CIHICIEBIA(arg_38_1, Onboarding.tutorials.MISSION_CHALLENGES)
	ACTIONS.UploadStats(arg_38_0, arg_38_1)
end

Onboarding.MatureContentWarning = {}
Onboarding.MatureContentWarning.stages = {
	{
		name = "MatureContentPopup"
	}
}

function Onboarding.MatureContentWarning.WasCompleted(arg_39_0, arg_39_1)
	return Engine.ECCJEIDDC(arg_39_1, Onboarding.tutorials.MATURE_CONTENT)
end

function Onboarding.MatureContentWarning.MarkCompleted(arg_40_0, arg_40_1)
	Engine.CIHICIEBIA(arg_40_1, Onboarding.tutorials.MATURE_CONTENT)
	ACTIONS.UploadStats(arg_40_0, arg_40_1)
end

Onboarding.CPMunitions = {}
Onboarding.CPMunitions.stages = {
	{
		name = "CPMunitionsPopup"
	}
}

function Onboarding.CPMunitions.WasCompleted(arg_41_0, arg_41_1)
	return Engine.ECCJEIDDC(arg_41_1, Onboarding.tutorials.CP_MUNITIONS)
end

function Onboarding.CPMunitions.MarkCompleted(arg_42_0, arg_42_1)
	Engine.CIHICIEBIA(arg_42_1, Onboarding.tutorials.CP_MUNITIONS)
	ACTIONS.UploadStats(arg_42_0, arg_42_1)
end

Onboarding.OfficerProgression = {}
Onboarding.OfficerProgression.stages = {
	{
		name = "CPMunitionsPopup"
	}
}

function Onboarding.OfficerProgression.WasCompleted(arg_43_0, arg_43_1)
	return Engine.ECCJEIDDC(arg_43_1, Onboarding.tutorials.OFFICER)
end

function Onboarding.OfficerProgression.MarkCompleted(arg_44_0, arg_44_1)
	Engine.CIHICIEBIA(arg_44_1, Onboarding.tutorials.OFFICER)
	ACTIONS.UploadStats(arg_44_0, arg_44_1)
end

Onboarding.SeasonUnlocks = {}
Onboarding.SeasonUnlocks.stages = {
	{
		name = "SeasonUnlocksPopup"
	}
}

function Onboarding.SeasonUnlocks.WasCompleted(arg_45_0, arg_45_1)
	return Engine.ECCJEIDDC(arg_45_1, Onboarding.tutorials.SEASON_UNLOCKS)
end

function Onboarding.SeasonUnlocks.MarkCompleted(arg_46_0, arg_46_1)
	Engine.CIHICIEBIA(arg_46_1, Onboarding.tutorials.SEASON_UNLOCKS)
	ACTIONS.UploadStats(arg_46_0, arg_46_1)
end

Onboarding.WeaponMod = {}
Onboarding.WeaponMod.stages = {
	{
		name = "SeasonUnlocksPopup"
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

Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED = {}
Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED.stages = {
	{
		name = "WarzoneTutorialGameplay"
	}
}

function Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED.WasCompleted(arg_63_0, arg_63_1)
	return Engine.ECCJEIDDC(arg_63_1, Onboarding.tutorials.WARZONE_PRACTICE_GAMEPLAY_COMPLETED)
end

function Onboarding.WARZONE_PRACTICE_GAMEPLAY_COMPLETED.MarkCompleted(arg_64_0, arg_64_1)
	Engine.CIHICIEBIA(arg_64_1, Onboarding.tutorials.WARZONE_PRACTICE_GAMEPLAY_COMPLETED)
	ACTIONS.UploadStats(arg_64_0, arg_64_1)
end

Onboarding.SeasonVideo = {}
Onboarding.SeasonVideo.stages = {
	{
		name = "SeasonVideoPopup"
	}
}

function Onboarding.SeasonVideo.WasCompleted(arg_65_0, arg_65_1, arg_65_2)
	return Engine.ECCJEIDDC(arg_65_1, TutorialSeasonValues[arg_65_2])
end

function Onboarding.SeasonVideo.MarkCompleted(arg_66_0, arg_66_1, arg_66_2)
	Engine.CIHICIEBIA(arg_66_1, TutorialSeasonValues[arg_66_2])
	ACTIONS.UploadStats(arg_66_0, arg_66_1)
end

Onboarding.MagmaVideo = {}
Onboarding.MagmaVideo.stages = {
	{
		name = "MagmaVideoPopup"
	}
}

function Onboarding.MagmaVideo.WasCompleted(arg_67_0, arg_67_1)
	return Engine.ECCJEIDDC(arg_67_1, Onboarding.tutorials.MAGMA_WATCHED_FLAG)
end

function Onboarding.MagmaVideo.MarkCompleted(arg_68_0, arg_68_1, arg_68_2)
	Engine.CIHICIEBIA(arg_68_1, Onboarding.tutorials.MAGMA_WATCHED_FLAG)
	ACTIONS.UploadStats(arg_68_0, arg_68_1)
end

Onboarding.WZPerks = {}
Onboarding.WZPerks.stages = {
	{
		name = "BRPerksPopup"
	}
}

function Onboarding.WZPerks.WasCompleted(arg_69_0, arg_69_1)
	return Engine.ECCJEIDDC(arg_69_1, Onboarding.tutorials.WZ_PERKS)
end

function Onboarding.WZPerks.MarkCompleted(arg_70_0, arg_70_1)
	Engine.CIHICIEBIA(arg_70_1, Onboarding.tutorials.WZ_PERKS)
	ACTIONS.UploadStats(arg_70_0, arg_70_1)
end

Onboarding.WZDropKit = {}
Onboarding.WZDropKit.stages = {
	{
		name = "BRDropKitPopup"
	}
}

function Onboarding.WZDropKit.WasCompleted(arg_71_0, arg_71_1)
	return Engine.ECCJEIDDC(arg_71_1, Onboarding.tutorials.WZ_DROPKIT)
end

function Onboarding.WZDropKit.MarkCompleted(arg_72_0, arg_72_1)
	Engine.CIHICIEBIA(arg_72_1, Onboarding.tutorials.WZ_DROPKIT)
	ACTIONS.UploadStats(arg_72_0, arg_72_1)
end

Onboarding.GameBattles = {}
Onboarding.GameBattles.stages = {
	{
		name = "GameBattles"
	}
}

function Onboarding.GameBattles.WasCompleted(arg_73_0, arg_73_1)
	return Engine.ECCJEIDDC(arg_73_1, Onboarding.tutorials.GAMEBATTLES)
end

function Onboarding.GameBattles.MarkCompleted(arg_74_0, arg_74_1)
	Engine.CIHICIEBIA(arg_74_1, Onboarding.tutorials.GAMEBATTLES)
	ACTIONS.UploadStats(arg_74_0, arg_74_1)
end

Onboarding.Plunder = {}
Onboarding.Plunder.stages = {
	{
		name = "PlunderTutorialPopup"
	}
}

function Onboarding.Plunder.WasCompleted(arg_75_0, arg_75_1)
	return Engine.ECCJEIDDC(arg_75_1, Onboarding.tutorials.PLUNDERTUTORIAL)
end

function Onboarding.Plunder.MarkCompleted(arg_76_0, arg_76_1)
	Engine.CIHICIEBIA(arg_76_1, Onboarding.tutorials.PLUNDERTUTORIAL)
	ACTIONS.UploadStats(arg_76_0, arg_76_1)
end

Onboarding.VehicleCamos = {}
Onboarding.VehicleCamos.stages = {
	{
		name = "VehicleCamosTutorialPopup"
	}
}

function Onboarding.VehicleCamos.WasCompleted(arg_77_0, arg_77_1)
	return Engine.ECCJEIDDC(arg_77_1, Onboarding.tutorials.VEHICLE_CAMOS)
end

function Onboarding.VehicleCamos.MarkCompleted(arg_78_0, arg_78_1)
	Engine.CIHICIEBIA(arg_78_1, Onboarding.tutorials.VEHICLE_CAMOS)
	ACTIONS.UploadStats(arg_78_0, arg_78_1)
end

Onboarding.MilSimOperators = {}
Onboarding.MilSimOperators.stages = {
	{
		name = "MilsimOperatorsPopup"
	}
}

function Onboarding.MilSimOperators.WasCompleted(arg_79_0, arg_79_1)
	return Engine.ECCJEIDDC(arg_79_1, Onboarding.tutorials.MILSIM_OPERATORS)
end

function Onboarding.MilSimOperators.MarkCompleted(arg_80_0, arg_80_1)
	Engine.CIHICIEBIA(arg_80_1, Onboarding.tutorials.MILSIM_OPERATORS)
	ACTIONS.UploadStats(arg_80_0, arg_80_1)
end

Onboarding.GunsmithCustoms = {}
Onboarding.GunsmithCustoms.stages = {
	{
		name = "GunsmithCustomsPopup"
	}
}

function Onboarding.GunsmithCustoms.WasCompleted(arg_81_0, arg_81_1)
	return Engine.ECCJEIDDC(arg_81_1, Onboarding.tutorials.GUNSMITH_CUSTOMS)
end

function Onboarding.GunsmithCustoms.MarkCompleted(arg_82_0, arg_82_1)
	Engine.CIHICIEBIA(arg_82_1, Onboarding.tutorials.GUNSMITH_CUSTOMS)
	ACTIONS.UploadStats(arg_82_0, arg_82_1)
end

Onboarding.GamemodeTDM = {}
Onboarding.GamemodeTDM.stages = {
	{
		name = "GamemodeTDMPopup"
	}
}

function Onboarding.GamemodeTDM.WasCompleted(arg_83_0, arg_83_1)
	return Engine.ECCJEIDDC(arg_83_1, Onboarding.tutorials.GAMEMODE_TDM)
end

function Onboarding.GamemodeTDM.MarkCompleted(arg_84_0, arg_84_1)
	Engine.CIHICIEBIA(arg_84_1, Onboarding.tutorials.GAMEMODE_TDM)
	ACTIONS.UploadStats(arg_84_0, arg_84_1)
end

Onboarding.GamemodeGunfight = {}
Onboarding.GamemodeGunfight.stages = {
	{
		name = "GamemodeGunfightPopup"
	}
}

function Onboarding.GamemodeGunfight.WasCompleted(arg_85_0, arg_85_1)
	return Engine.ECCJEIDDC(arg_85_1, Onboarding.tutorials.GAMEMODE_GUNFIGHT)
end

function Onboarding.GamemodeGunfight.MarkCompleted(arg_86_0, arg_86_1)
	Engine.CIHICIEBIA(arg_86_1, Onboarding.tutorials.GAMEMODE_GUNFIGHT)
	ACTIONS.UploadStats(arg_86_0, arg_86_1)
end

Onboarding.GamemodeMoshpit = {}
Onboarding.GamemodeMoshpit.stages = {
	{
		name = "GamemodeMoshpitPopup"
	}
}

function Onboarding.GamemodeMoshpit.WasCompleted(arg_87_0, arg_87_1)
	return Engine.ECCJEIDDC(arg_87_1, Onboarding.tutorials.GAMEMODE_MOSHPIT)
end

function Onboarding.GamemodeMoshpit.MarkCompleted(arg_88_0, arg_88_1)
	Engine.CIHICIEBIA(arg_88_1, Onboarding.tutorials.GAMEMODE_MOSHPIT)
	ACTIONS.UploadStats(arg_88_0, arg_88_1)
end

Onboarding.IntelMissionChallenges = {}
Onboarding.IntelMissionChallenges.stages = {
	{
		name = "IntelMissionChallengesPopup"
	}
}

function Onboarding.IntelMissionChallenges.WasCompleted(arg_89_0, arg_89_1)
	return Engine.ECCJEIDDC(arg_89_1, Onboarding.tutorials.INTEL_MISSION_CHALLENGES)
end

function Onboarding.IntelMissionChallenges.MarkCompleted(arg_90_0, arg_90_1)
	Engine.CIHICIEBIA(arg_90_1, Onboarding.tutorials.INTEL_MISSION_CHALLENGES)
	ACTIONS.UploadStats(arg_90_0, arg_90_1)
end

Onboarding.WeaponMasteryChallenges = {}
Onboarding.WeaponMasteryChallenges.stages = {
	{
		name = "WeaponMasteryChallengesPopup"
	}
}

function Onboarding.WeaponMasteryChallenges.WasCompleted(arg_91_0, arg_91_1)
	return Engine.ECCJEIDDC(arg_91_1, Onboarding.tutorials.WEAPON_MASTERY_CHALLENGES)
end

function Onboarding.WeaponMasteryChallenges.MarkCompleted(arg_92_0, arg_92_1)
	Engine.CIHICIEBIA(arg_92_1, Onboarding.tutorials.WEAPON_MASTERY_CHALLENGES)
	ACTIONS.UploadStats(arg_92_0, arg_92_1)
end

Onboarding.GamemodeTDMAnywhere = {}
Onboarding.GamemodeTDMAnywhere.stages = {
	{
		name = "GamemodeTDMAnywherePopup"
	}
}

function Onboarding.GamemodeTDMAnywhere.WasCompleted(arg_93_0, arg_93_1)
	return Engine.ECCJEIDDC(arg_93_1, Onboarding.tutorials.GAMEMODE_TDM_ANYWHERE)
end

function Onboarding.GamemodeTDMAnywhere.MarkCompleted(arg_94_0, arg_94_1)
	Engine.CIHICIEBIA(arg_94_1, Onboarding.tutorials.GAMEMODE_TDM_ANYWHERE)
	ACTIONS.UploadStats(arg_94_0, arg_94_1)
end

Onboarding.VehicleHorn = {}
Onboarding.VehicleHorn.stages = {
	{
		name = "VehicleHornPopup"
	}
}

function Onboarding.VehicleHorn.WasCompleted(arg_95_0, arg_95_1)
	return Engine.ECCJEIDDC(arg_95_1, Onboarding.tutorials.VEHICLE_HORN)
end

function Onboarding.VehicleHorn.MarkCompleted(arg_96_0, arg_96_1)
	Engine.CIHICIEBIA(arg_96_1, Onboarding.tutorials.VEHICLE_HORN)
	ACTIONS.UploadStats(arg_96_0, arg_96_1)
end

Onboarding.BlueprintStore = {}
Onboarding.BlueprintStore.stages = {
	{
		name = "BlueprintStorePopup"
	}
}

function Onboarding.BlueprintStore.WasCompleted(arg_97_0, arg_97_1)
	return Engine.ECCJEIDDC(arg_97_1, Onboarding.tutorials.BLUEPRINT_STORE)
end

function Onboarding.BlueprintStore.MarkCompleted(arg_98_0, arg_98_1)
	Engine.CIHICIEBIA(arg_98_1, Onboarding.tutorials.BLUEPRINT_STORE)
	ACTIONS.UploadStats(arg_98_0, arg_98_1)
end

Onboarding.Sprays = {}
Onboarding.Sprays.stages = {
	{
		name = "SpraysPopup"
	}
}

function Onboarding.Sprays.WasCompleted(arg_99_0, arg_99_1)
	return Engine.ECCJEIDDC(arg_99_1, Onboarding.tutorials.SPRAYS)
end

function Onboarding.Sprays.MarkCompleted(arg_100_0, arg_100_1)
	Engine.CIHICIEBIA(arg_100_1, Onboarding.tutorials.SPRAYS)
	ACTIONS.UploadStats(arg_100_0, arg_100_1)
end

Onboarding.BattleTracks = {}
Onboarding.BattleTracks.stages = {
	{
		name = "BattleTracksPopup"
	}
}

function Onboarding.BattleTracks.WasCompleted(arg_101_0, arg_101_1)
	return Engine.ECCJEIDDC(arg_101_1, Onboarding.tutorials.BATTLE_TRACKS)
end

function Onboarding.BattleTracks.MarkCompleted(arg_102_0, arg_102_1)
	Engine.CIHICIEBIA(arg_102_1, Onboarding.tutorials.BATTLE_TRACKS)
	ACTIONS.UploadStats(arg_102_0, arg_102_1)
end

Onboarding.TRIAL_EVENT_INTRODUCTION = {}
Onboarding.TRIAL_EVENT_INTRODUCTION.stages = {
	{
		name = "TrialEventIntroductionPopup"
	}
}

function Onboarding.TRIAL_EVENT_INTRODUCTION.WasCompleted(arg_103_0, arg_103_1)
	return Engine.ECCJEIDDC(arg_103_1, Onboarding.tutorials.TRIAL_EVENT_INTRODUCTION)
end

function Onboarding.TRIAL_EVENT_INTRODUCTION.MarkCompleted(arg_104_0, arg_104_1)
	Engine.CIHICIEBIA(arg_104_1, Onboarding.tutorials.TRIAL_EVENT_INTRODUCTION)
	ACTIONS.UploadStats(arg_104_0, arg_104_1)
end

Onboarding.MasterChallenges = {}
Onboarding.MasterChallenges.stages = {
	{
		name = "MasterChallengesPopup"
	}
}

function Onboarding.MasterChallenges.WasCompleted(arg_105_0, arg_105_1)
	return Engine.ECCJEIDDC(arg_105_1, Onboarding.tutorials.MASTER_CHALLENGES)
end

function Onboarding.MasterChallenges.MarkCompleted(arg_106_0, arg_106_1)
	Engine.CIHICIEBIA(arg_106_1, Onboarding.tutorials.MASTER_CHALLENGES)
	ACTIONS.UploadStats(arg_106_0, arg_106_1)
end

Onboarding.WeaponMasteryClassifiedChallenges = {}
Onboarding.WeaponMasteryClassifiedChallenges.stages = {
	{
		name = "ClassifiedChallengePopup"
	}
}

function Onboarding.WeaponMasteryClassifiedChallenges.WasCompleted(arg_107_0, arg_107_1)
	return Engine.ECCJEIDDC(arg_107_1, Onboarding.tutorials.WEAPON_MASTERY_CLASSIFIED_CHALLENGES)
end

function Onboarding.WeaponMasteryClassifiedChallenges.MarkCompleted(arg_108_0, arg_108_1)
	Engine.CIHICIEBIA(arg_108_1, Onboarding.tutorials.WEAPON_MASTERY_CLASSIFIED_CHALLENGES)
	ACTIONS.UploadStats(arg_108_0, arg_108_1)
end

function Onboarding.BeginFlow(arg_109_0, arg_109_1, arg_109_2)
	if arg_109_0._activeFlow then
		return false
	end

	assert(arg_109_2)

	if arg_109_1:WasCompleted(arg_109_2) then
		return false
	end

	assert(#arg_109_1.stages > 0)

	arg_109_0._activeFlow = arg_109_1
	arg_109_0._currentStage = 1
	arg_109_0._controllerIndex = arg_109_2

	return true
end

function Onboarding.IsFlowInProgress(arg_110_0, arg_110_1)
	return arg_110_1 == arg_110_0._activeFlow
end

function Onboarding.AdvanceFlow(arg_111_0, arg_111_1, arg_111_2)
	if arg_111_0._activeFlow ~= arg_111_1 then
		return false
	end

	local var_111_0 = false

	for iter_111_0, iter_111_1 in ipairs(arg_111_0._activeFlow.stages) do
		if iter_111_1.name == arg_111_2 and iter_111_0 == arg_111_0._currentStage then
			arg_111_0._currentStage = arg_111_0._currentStage + 1

			DebugPrint("Onboarding completed stage: " .. arg_111_2)

			var_111_0 = true

			break
		end
	end

	if arg_111_0._currentStage > #arg_111_0._activeFlow.stages then
		arg_111_0:CompleteFlow()
	end

	return var_111_0
end

function Onboarding.ResetFlow(arg_112_0, arg_112_1)
	if arg_112_0._activeFlow and arg_112_0._activeFlow == arg_112_1 then
		arg_112_0._activeFlow = nil
		arg_112_0._currentStage = nil
		arg_112_0._controllerIndex = nil
	end
end

function Onboarding.CompleteFlow(arg_113_0)
	if arg_113_0._activeFlow then
		arg_113_0._activeFlow:MarkCompleted(arg_113_0._controllerIndex)

		arg_113_0._activeFlow = nil
		arg_113_0._currentStage = nil
		arg_113_0._controllerIndex = nil
	end
end

function Onboarding.ApplyWhitelist(arg_114_0, arg_114_1, arg_114_2)
	if not arg_114_0._activeFlow then
		return
	end

	local var_114_0 = arg_114_0._activeFlow.stages[arg_114_0._currentStage]

	assert(var_114_0)

	local var_114_1

	if var_114_0.whitelist then
		for iter_114_0, iter_114_1 in ipairs(var_114_0.whitelist) do
			if iter_114_1.menu == arg_114_1 then
				var_114_1 = iter_114_1.buttons

				break
			end
		end
	end

	if not var_114_1 then
		return
	end

	local var_114_2 = arg_114_2:getFirstChild()

	while var_114_2 do
		if var_114_2.SetButtonDisabled then
			if not LUI.IsItemInArray(var_114_1, var_114_2.id) then
				var_114_2:SetButtonDisabled(true)
			end
		else
			Onboarding:ApplyWhitelist(arg_114_1, var_114_2)
		end

		var_114_2 = var_114_2:getNextSibling()
	end
end

function Onboarding.GetOnboardingForGametype(arg_115_0)
	if arg_115_0 == MP.GameMode.PlunderGameType then
		return {
			type = Onboarding.Plunder,
			data = ONBOARDING_DATA.GetPlunderTutorialData()
		}
	end
end
