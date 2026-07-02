ONBOARDING_DATA = {}

function ONBOARDING_DATA.GetOnboardingPerkData()
	local function var_1_0(arg_2_0)
		ACTIONS.LeaveMenu(arg_2_0)
	end

	local var_1_1

	if not CONDITIONS.IsThirdGameMode() then
		var_1_1 = {
			title = "ONBOARDING/PERKS",
			panelData = {
				{
					desc = "ONBOARDING/PERK_1",
					image = "onboarding_perks_1"
				},
				{
					desc = "ONBOARDING/PERK_2",
					image = "onboarding_perks_2"
				}
			},
			confirmButton = {
				action = var_1_0
			}
		}
	else
		var_1_1 = {
			title = "ONBOARDING/PERKS",
			panelData = {
				{
					desc = "ONBOARDING/PERK_1",
					image = "onboarding_perks_1"
				}
			},
			confirmButton = {
				action = var_1_0
			}
		}
	end

	return var_1_1
end

function ONBOARDING_DATA.GetOnboardingRoleData()
	return {
		title = "ONBOARDING/ROLES",
		panelData = {
			{
				desc = "ONBOARDING/ROLE_1",
				image = "onboarding_role_1"
			},
			{
				desc = "ONBOARDING/ROLE_2",
				image = "onboarding_role_2"
			},
			{
				desc = "ONBOARDING/ROLE_3",
				image = "onboarding_role_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingOperatorData()
	return {
		title = "ONBOARDING/OPERATORS",
		panelData = {
			{
				desc = "ONBOARDING/OPERATOR_1",
				image = "onboarding_operator_1"
			},
			{
				desc = "ONBOARDING/OPERATOR_2",
				image = "onboarding_operator_2"
			},
			{
				desc = "ONBOARDING/OPERATOR_3",
				image = "onboarding_operator_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZOperatorData()
	return {
		title = "ONBOARDING/OPERATORS",
		panelData = {
			{
				desc = "ONBOARDING/OPERATOR_1",
				image = "onboarding_operator_1"
			},
			{
				desc = "ONBOARDING/OPERATOR_2",
				image = "onboarding_operator_2"
			},
			{
				desc = "ONBOARDING/OPERATOR_3_WZ",
				image = "onboarding_operator_3_wz"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingOperatorMissionsData()
	local function var_6_0(arg_7_0)
		ACTIONS.LeaveMenu(arg_7_0)
	end

	return {
		title = "ONBOARDING/OPERATOR_MISSIONS",
		panelData = {
			{
				desc = "ONBOARDING/OPERATOR_MISSIONS_1",
				image = "onboarding_operator_mission_1"
			},
			{
				desc = "ONBOARDING/OPERATOR_MISSIONS_2",
				image = "onboarding_operator_mission_2"
			},
			{
				desc = "ONBOARDING/OPERATOR_MISSIONS_3",
				image = "onboarding_operator_mission_3"
			}
		},
		confirmButton = {
			action = var_6_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingArmoryData()
	return {
		title = "ONBOARDING/ARMORY",
		panelData = {
			{
				desc = "ONBOARDING/ARMORY_1",
				image = "onboarding_armory_1"
			},
			{
				desc = "ONBOARDING/ARMORY_2",
				image = "onboarding_armory_2"
			},
			{
				desc = "ONBOARDING/ARMORY_3",
				image = "onboarding_armory_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZArmoryData()
	return {
		title = "ONBOARDING/ARMORY",
		panelData = {
			{
				desc = "ONBOARDING/ARMORY_1",
				image = "onboarding_armory_1"
			},
			{
				desc = "ONBOARDING/ARMORY_2",
				image = "onboarding_armory_2"
			},
			{
				desc = "ONBOARDING/ARMORY_3_WZ",
				image = "onboarding_armory_3_wz"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingFieldUpgradeData()
	local function var_10_0(arg_11_0)
		ACTIONS.LeaveMenu(arg_11_0)
	end

	return {
		title = "ONBOARDING/FIELDUPGRADE",
		panelData = {
			{
				desc = "ONBOARDING/FIELDUPGRADE_1",
				image = "onboarding_fieldUpgrade_1"
			},
			{
				desc = "ONBOARDING/FIELDUPGRADE_2",
				image = "onboarding_fieldUpgrade_2"
			},
			{
				desc = "ONBOARDING/FIELDUPGRADE_3",
				image = "onboarding_fieldUpgrade_3"
			}
		},
		confirmButton = {
			action = var_10_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingKillstreaksData()
	return {
		title = "ONBOARDING/KILLSTREAKS",
		panelData = {
			{
				desc = "ONBOARDING/KILLSTREAK_1",
				image = "onboarding_killstreaks_1"
			},
			{
				desc = "ONBOARDING/KILLSTREAK_2",
				image = "onboarding_killstreaks_2"
			},
			{
				desc = "ONBOARDING/KILLSTREAK_3",
				image = "onboarding_killstreaks_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingGunsmithData()
	local function var_13_0(arg_14_0)
		ACTIONS.LeaveMenu(arg_14_0)
	end

	return {
		title = "ONBOARDING/GUNSMITH",
		panelData = {
			{
				desc = "ONBOARDING/GUNSMITH_1",
				image = "onboarding_gunsmith_1"
			},
			{
				desc = "ONBOARDING/GUNSMITH_2",
				image = "onboarding_gunsmith_2"
			},
			{
				desc = "ONBOARDING/GUNSMITH_3",
				image = "onboarding_gunsmith_3"
			}
		},
		confirmButton = {
			action = var_13_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingLoadoutData()
	local function var_15_0(arg_16_0)
		ACTIONS.LeaveMenu(arg_16_0)
	end

	return {
		title = "ONBOARDING/LOADOUT",
		panelData = {
			{
				image = "onboarding_loadout_1",
				desc = CONDITIONS.IsThirdGameMode() and "ONBOARDING/LOADOUT_1_CP" or "ONBOARDING/LOADOUT_1"
			},
			{
				image = "onboarding_loadout_2",
				desc = CONDITIONS.IsThirdGameMode() and "ONBOARDING/LOADOUT_2_CP" or "ONBOARDING/LOADOUT_2"
			},
			{
				desc = "ONBOARDING/LOADOUT_3",
				image = "onboarding_loadout_3"
			}
		},
		confirmButton = {
			action = var_15_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingElderProgressionData()
	return {
		title = "ONBOARDING/ELDER",
		panelData = {
			{
				desc = "ONBOARDING/ELDER_1",
				image = "onboarding_elderProgression_1"
			},
			{
				desc = "ONBOARDING/ELDER_2",
				image = "onboarding_elderProgression_2"
			},
			{
				desc = "ONBOARDING/ELDER_3",
				image = "onboarding_elderProgression_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingSpecialistPerkData()
	local function var_18_0(arg_19_0)
		ACTIONS.LeaveMenu(arg_19_0)
	end

	local function var_18_1(arg_20_0)
		ACTIONS.LeaveMenu(arg_20_0)
	end

	return {
		additionalText = "ONBOARDING/SPECIALIST_WARNING",
		title = "ONBOARDING/SPECIALIST",
		panelData = {
			{
				desc = "ONBOARDING/SPECIALIST_DESC",
				image = "onboarding_perkSpecialist_1"
			}
		},
		confirmButton = {
			text = "ONBOARDING/SPECIALIST_CONFIRM",
			action = var_18_0
		},
		cancelButton = {
			text = "ONBOARDING/SPECIALIST_CANCEL",
			action = var_18_1
		}
	}
end

function ONBOARDING_DATA.GetOnboardingPerkUpdateData()
	local function var_21_0(arg_22_0)
		ACTIONS.LeaveMenu(arg_22_0)
	end

	local function var_21_1(arg_23_0)
		ACTIONS.LeaveMenu(arg_23_0)
	end

	return {
		title = "ONBOARDING/PERK_UPDATE",
		panelData = {
			{
				desc = "ONBOARDING/PERK_UPDATE_1",
				image = "onboarding_perk_updates_1"
			},
			{
				desc = "ONBOARDING/PERK_UPDATE_2",
				image = "onboarding_perk_updates_2"
			},
			{
				desc = "ONBOARDING/PERK_UPDATE_3",
				image = "onboarding_perk_updates_3"
			}
		},
		confirmButton = {
			action = var_21_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingProFieldUpgradeData()
	local function var_24_0(arg_25_0)
		ACTIONS.LeaveMenu(arg_25_0)
	end

	return {
		title = "ONBOARDING/FIELDUPGRADE_PRO",
		panelData = {
			{
				desc = "ONBOARDING/FIELDUPGRADE_PRO_DESC",
				image = "onboarding_fieldUpgrade_3"
			}
		},
		confirmButton = {
			text = "LUA_MENU/OK",
			action = var_24_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMissionChallengesData()
	local function var_26_0(arg_27_0)
		ACTIONS.LeaveMenu(arg_27_0)
	end

	return {
		title = "ONBOARDING/MISSION_CHALLENGES",
		panelData = {
			{
				desc = "ONBOARDING/MISSION_CHALLENGES_1",
				image = "onboarding_mission_1"
			},
			{
				desc = "ONBOARDING/MISSION_CHALLENGES_2",
				image = "onboarding_mission_2"
			},
			{
				desc = "ONBOARDING/MISSION_CHALLENGES_3",
				image = "onboarding_mission_3"
			}
		},
		confirmButton = {
			action = var_26_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMatureContentData()
	local function var_28_0(arg_29_0)
		ACTIONS.LeaveMenu(arg_29_0)
	end

	local function var_28_1(arg_30_0, arg_30_1)
		if LUI.FlowManager.IsInStack("MainMenuOffline") then
			ACTIONS.RestoreMenu("MainMenuOffline", true, arg_30_1)
		else
			ACTIONS.RestoreMenu("MainMenu", true, arg_30_1)
		end
	end

	return {
		title = "ONBOARDING/MATURE_CONTENT_WARNING",
		waitTime = 0,
		panelData = {
			{
				desc = "ONBOARDING/MATURE_CONTENT_DESC",
				image = "onboarding_matureContent_1"
			}
		},
		confirmButton = {
			text = "ONBOARDING/MATURE_CONTENT_CONFIRM",
			action = var_28_0
		},
		cancelButton = {
			text = "ONBOARDING/MATURE_CONTENT_CANCEL",
			action = var_28_1
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMunitionData()
	return {
		title = "ONBOARDING/MUNITIONS",
		panelData = {
			{
				desc = "ONBOARDING/MUNITION_1",
				image = "onboarding_munition_1"
			},
			{
				desc = "ONBOARDING/MUNITION_2",
				image = "onboarding_munition_2"
			},
			{
				desc = "ONBOARDING/MUNITION_3",
				image = "onboarding_munition_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWeaponModData()
	local function var_32_0(arg_33_0)
		ACTIONS.LeaveMenu(arg_33_0)
	end

	return {
		title = "ONBOARDING/MODS",
		panelData = {
			{
				desc = "ONBOARDING/MOD_1",
				image = "onboarding_mod_1"
			},
			{
				desc = "ONBOARDING/MOD_2",
				image = "onboarding_mod_2"
			},
			{
				desc = "ONBOARDING/MOD_3",
				image = "onboarding_mod_3"
			}
		},
		confirmButton = {
			action = var_32_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCDLRulesData()
	local function var_34_0(arg_35_0)
		ACTIONS.LeaveMenu(arg_35_0)
	end

	return {
		title = "ONBOARDING/CDL_RULES",
		panelData = {
			{
				desc = "ONBOARDING/CDL_RULES_1",
				image = "onboarding_cdlrules_1"
			},
			{
				desc = "ONBOARDING/CDL_RULES_2",
				image = "onboarding_cdlrules_2"
			},
			{
				desc = "ONBOARDING/CDL_RULES_3",
				image = "onboarding_cdlrules_3"
			}
		},
		confirmButton = {
			action = var_34_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingRegimentData()
	local function var_36_0(arg_37_0)
		ACTIONS.LeaveMenu(arg_37_0)
	end

	return {
		title = "ONBOARDING/REGIMENTS",
		panelData = {
			{
				desc = "ONBOARDING/REGIMENT_1",
				image = "onboarding_regiments_1"
			},
			{
				desc = "ONBOARDING/REGIMENT_2",
				image = "onboarding_regiments_2"
			},
			{
				desc = "ONBOARDING/REGIMENT_3",
				image = "onboarding_regiments_3"
			}
		},
		confirmButton = {
			action = var_36_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCDLData()
	local function var_38_0(arg_39_0)
		ACTIONS.LeaveMenu(arg_39_0)
	end

	return {
		title = "ONBOARDING/CDL",
		panelData = {
			{
				desc = "ONBOARDING/CDL_1",
				image = "onboarding_cdlrestriction_1"
			},
			{
				desc = "ONBOARDING/CDL_2",
				image = "onboarding_cdlrestriction_2"
			},
			{
				desc = "ONBOARDING/CDL_3",
				image = "onboarding_cdlrestriction_3"
			}
		},
		confirmButton = {
			action = var_38_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZDropKitData()
	local function var_40_0(arg_41_0)
		ACTIONS.LeaveMenu(arg_41_0)
	end

	return {
		title = "ONBOARDING/EDITDROPKIT",
		panelData = {
			{
				desc = "ONBOARDING/EDITDROPKIT_1",
				image = "onboarding_loadout_1"
			},
			{
				desc = "ONBOARDING/EDITDROPKIT_2",
				image = "onboarding_br_perks"
			},
			{
				desc = "ONBOARDING/EDITDROPKIT_3",
				image = "onboarding_loadout_3"
			}
		},
		confirmButton = {
			action = var_40_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZPerksData()
	local function var_42_0(arg_43_0)
		ACTIONS.LeaveMenu(arg_43_0)
	end

	return {
		title = "ONBOARDING/PERKS",
		panelData = {
			{
				desc = "ONBOARDING/PERK_1",
				image = "onboarding_perks_2"
			},
			{
				desc = "ONBOARDING/PERK_3",
				image = "onboarding_br_dropkit"
			},
			{
				desc = "ONBOARDING/PERK_2",
				image = "onboarding_br_specialist"
			}
		},
		confirmButton = {
			action = var_42_0
		}
	}
end

function ONBOARDING_DATA.GetPlunderTutorialData(arg_44_0)
	local function var_44_0(arg_45_0)
		ACTIONS.LeaveMenu(arg_45_0)
	end

	return {
		modeIcon = "icon_br_mode_plunder",
		panelData = {
			{
				infoPointAnim = "InfoPointLayoutPlunder1",
				header = "ONBOARDING/TUTORIAL_PLUNDER_1_HEADER",
				image = "tutorial_br_plunder_1",
				desc = "",
				infoPoints = {
					{
						text = "ONBOARDING/TUTORIAL_PLUNDER_1_POINT_1"
					},
					{
						text = ""
					},
					{
						text = ""
					}
				}
			},
			{
				infoPointAnim = "InfoPointLayoutPlunder2",
				header = "ONBOARDING/TUTORIAL_PLUNDER_2_HEADER",
				image = "tutorial_br_plunder_2",
				desc = "",
				infoPoints = {
					{
						text = "ONBOARDING/TUTORIAL_PLUNDER_2_POINT_1"
					},
					{
						text = "ONBOARDING/TUTORIAL_PLUNDER_2_POINT_2"
					},
					{
						text = "ONBOARDING/TUTORIAL_PLUNDER_2_POINT_3"
					}
				}
			},
			{
				infoPointAnim = "InfoPointLayoutPlunder3",
				header = "ONBOARDING/TUTORIAL_PLUNDER_3_HEADER",
				image = "tutorial_br_plunder_3",
				desc = "",
				infoPoints = {
					{
						text = "ONBOARDING/TUTORIAL_PLUNDER_3_POINT_1"
					},
					{
						text = ""
					},
					{
						text = "ONBOARDING/TUTORIAL_PLUNDER_3_POINT_3"
					}
				}
			}
		},
		confirmButton = {
			action = var_44_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingTDMData(arg_46_0)
	local function var_46_0(arg_47_0)
		ACTIONS.LeaveMenu(arg_47_0)

		if arg_46_0 then
			arg_46_0()
		end
	end

	return {
		title = "ONBOARDING/TDM",
		panelData = {
			{
				desc = "ONBOARDING/TDM_1",
				image = "onboarding_tdm_1"
			},
			{
				desc = "ONBOARDING/TDM_2",
				image = "onboarding_tdm_2"
			},
			{
				desc = "ONBOARDING/TDM_3",
				image = "onboarding_tdm_3"
			}
		},
		confirmButton = {
			action = var_46_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingGunfightData(arg_48_0)
	local function var_48_0(arg_49_0)
		ACTIONS.LeaveMenu(arg_49_0)

		if arg_48_0 then
			arg_48_0()
		end
	end

	return {
		title = "ONBOARDING/GUNFIGHT",
		panelData = {
			{
				desc = "ONBOARDING/GUNFIGHT_1",
				image = "onboarding_gunfight_1"
			},
			{
				desc = "ONBOARDING/GUNFIGHT_2",
				image = "onboarding_gunfight_2"
			},
			{
				desc = "ONBOARDING/GUNFIGHT_3",
				image = "onboarding_gunfight_3"
			}
		},
		confirmButton = {
			action = var_48_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMPMoshpitData(arg_50_0)
	local function var_50_0(arg_51_0)
		ACTIONS.LeaveMenu(arg_51_0)

		if arg_50_0 then
			arg_50_0()
		end
	end

	return {
		title = "ONBOARDING/MOSHPIT_TRIALS",
		panelData = {
			{
				desc = "ONBOARDING/MOSHPIT_TRIALS_1",
				image = "onboarding_mp_trials_1"
			},
			{
				desc = "ONBOARDING/MOSHPIT_TRIALS_2",
				image = "onboarding_mp_trials_2"
			},
			{
				desc = "ONBOARDING/MOSHPIT_TRIALS_3",
				image = "onboarding_mp_trials_3"
			}
		},
		confirmButton = {
			action = var_50_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingVehicleCamosData()
	local function var_52_0(arg_53_0)
		ACTIONS.LeaveMenu(arg_53_0)
	end

	return {
		title = "VEHICLES/VEHICLE_CUSTOMIZATION",
		panelData = {
			{
				desc = "ONBOARDING/VEHICLE_CAMOS_1",
				image = "onboarding_vehicle_camos_1"
			},
			{
				desc = "ONBOARDING/VEHICLE_CAMOS_2",
				image = "onboarding_vehicle_camos_2"
			},
			{
				desc = "ONBOARDING/VEHICLE_CAMOS_3",
				image = "onboarding_vehicle_camos_3"
			}
		},
		confirmButton = {
			action = var_52_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMilSimOperatorsData()
	local function var_54_0(arg_55_0)
		ACTIONS.LeaveMenu(arg_55_0)
	end

	return {
		title = "ONBOARDING/MILSIM",
		panelData = {
			{
				desc = "ONBOARDING/MILSIM_1",
				image = "onboarding_milsim_1"
			}
		},
		confirmButton = {
			text = "LUA_MENU/OK",
			action = var_54_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingGunsmithCustomsData()
	local function var_56_0(arg_57_0)
		ACTIONS.LeaveMenu(arg_57_0)
	end

	return {
		title = "ONBOARDING/GUNSMITH_CUSTOMS",
		panelData = {
			{
				desc = "ONBOARDING/GUNSMITH_CUSTOMS_1",
				image = "onboarding_gunsmith_customs_1"
			},
			{
				desc = "ONBOARDING/GUNSMITH_CUSTOMS_2",
				image = "onboarding_gunsmith_customs_2"
			}
		},
		confirmButton = {
			action = var_56_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingIntelMissionChallengesData()
	local function var_58_0(arg_59_0)
		ACTIONS.LeaveMenu(arg_59_0)
	end

	return {
		title = "ONBOARDING/INTEL_MISSION_CHALLENGES",
		panelData = {
			{
				desc = "ONBOARDING/INTEL_MISSION_CHALLENGES_1",
				image = "onboarding_intel_mission_1"
			},
			{
				desc = "ONBOARDING/INTEL_MISSION_CHALLENGES_2",
				image = "onboarding_intel_mission_2"
			},
			{
				desc = "ONBOARDING/INTEL_MISSION_CHALLENGES_3",
				image = "onboarding_intel_mission_3"
			}
		},
		confirmButton = {
			action = var_58_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWeaponMasteryChallengesData()
	local function var_60_0(arg_61_0)
		ACTIONS.LeaveMenu(arg_61_0)
	end

	return {
		title = "ONBOARDING/WEAPON_MASTERY",
		panelData = {
			{
				desc = "ONBOARDING/WEAPON_MASTERY_1",
				image = "onboarding_weapon_mastery_1"
			},
			{
				desc = "ONBOARDING/WEAPON_MASTERY_2",
				image = "onboarding_weapon_mastery_2"
			}
		},
		confirmButton = {
			action = var_60_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingTDMAnywhereData(arg_62_0)
	local function var_62_0(arg_63_0)
		ACTIONS.LeaveMenu(arg_63_0)

		if arg_62_0 then
			arg_62_0()
		end
	end

	return {
		title = "ONBOARDING/TDM_ANYWHERE",
		panelData = {
			{
				desc = "ONBOARDING/TDM_ANYWHERE_DESC_1",
				image = "onboarding_br_tdm_1"
			},
			{
				desc = "ONBOARDING/TDM_ANYWHERE_DESC_2",
				image = "onboarding_br_tdm_2"
			},
			{
				desc = "ONBOARDING/TDM_ANYWHERE_DESC_3",
				image = "onboarding_br_tdm_3"
			}
		},
		confirmButton = {
			action = var_62_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingVehicleHornData()
	return {
		title = "ONBOARDING/VEHICLE_HORN",
		panelData = {
			{
				desc = "ONBOARDING/VEHICLE_HORN_DESC_1",
				image = "onboarding_vehicle_horns_1"
			},
			{
				desc = "ONBOARDING/VEHICLE_HORN_DESC_2",
				image = "onboarding_vehicle_horns_2"
			},
			{
				desc = "ONBOARDING/VEHICLE_HORN_DESC_3",
				image = "onboarding_vehicle_horns_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingBlueprintStoreData()
	local function var_65_0(arg_66_0)
		ACTIONS.LeaveMenu(arg_66_0)
	end

	return {
		title = "ONBOARDING/BLUEPRINT_STORE",
		panelData = {
			{
				desc = "ONBOARDING/BLUEPRINT_STORE_1",
				image = "onboarding_blueprint_store_1"
			},
			{
				desc = "ONBOARDING/BLUEPRINT_STORE_2",
				image = "onboarding_blueprint_store_2"
			}
		},
		confirmButton = {
			action = var_65_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingSprayData()
	return {
		title = "ONBOARDING/SPRAYS",
		panelData = {
			{
				desc = "ONBOARDING/SPRAYS_DESC_1",
				image = "onboarding_sprays_1"
			},
			{
				desc = "ONBOARDING/SPRAYS_DESC_2",
				image = "onboarding_sprays_2"
			},
			{
				desc = "ONBOARDING/SPRAYS_DESC_3",
				image = "onboarding_sprays_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingBattleTracksData()
	return {
		title = "ONBOARDING/BATTLE_TRACKS",
		panelData = {
			{
				desc = "ONBOARDING/BATTLE_TRACKS_DESC_1",
				image = "onboarding_battle_tracks_1"
			},
			{
				desc = "ONBOARDING/BATTLE_TRACKS_DESC_2",
				image = "onboarding_battle_tracks_2"
			},
			{
				desc = "ONBOARDING/BATTLE_TRACKS_DESC_3",
				image = "onboarding_battle_tracks_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingTrialEventData()
	return {
		title = "ONBOARDING/TRIAL_EVENT",
		panelData = {
			{
				desc = "ONBOARDING/TRIAL_EVENT_DESC_1",
				image = "onboarding_trial_event_1"
			},
			{
				desc = "ONBOARDING/TRIAL_EVENT_DESC_2",
				image = "onboarding_trial_event_2"
			},
			{
				desc = "ONBOARDING/TRIAL_EVENT_DESC_3",
				image = "onboarding_trial_event_3"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMasterChallengesData()
	local function var_70_0(arg_71_0)
		ACTIONS.LeaveMenu(arg_71_0)
	end

	return {
		title = "ONBOARDING/MASTER_CHALLENGES",
		panelData = {
			{
				desc = "ONBOARDING/MASTER_CHALLENGES_1",
				image = "onboarding_master_challenges_1"
			}
		},
		confirmButton = {
			action = var_70_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWeaponClassifiedChallengeData()
	local function var_72_0(arg_73_0)
		ACTIONS.LeaveMenu(arg_73_0)
	end

	return {
		title = "ONBOARDING/CLASSIFIED_CHALLENGE",
		panelData = {
			{
				desc = "ONBOARDING/CLASSIFIED_CHALLENGES_DESC",
				image = "onboarding_classified_challenge"
			}
		},
		confirmButton = {
			action = var_72_0
		}
	}
end
