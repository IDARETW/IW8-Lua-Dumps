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

function ONBOARDING_DATA.GetOnboardingCH2WZOperatorMissionsData()
	local function var_8_0(arg_9_0)
		ACTIONS.LeaveMenu(arg_9_0)
	end

	return {
		title = "ONBOARDING/OPERATOR_MISSIONS",
		panelData = {
			{
				desc = "ONBOARDING/OPERATOR_MISSIONS_CH2WZ_1",
				image = "onboarding_ch2_wz_only_operator_mission_01"
			},
			{
				desc = "ONBOARDING/OPERATOR_MISSIONS_CH2WZ_2",
				image = "onboarding_ch2_wz_only_operator_mission_02"
			}
		},
		confirmButton = {
			action = var_8_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZCWOperatorsData()
	local function var_10_0(arg_11_0)
		ACTIONS.LeaveMenu(arg_11_0)
	end

	return {
		title = "ONBOARDING/OPERATORS_CH2WZ_ONLY_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/OPERATORS_CH2WZ_ONLY_1",
				image = "onboarding_ch2_wz_only_operator_01"
			},
			{
				desc = "ONBOARDING/OPERATORS_CH2WZ_ONLY_2",
				image = "onboarding_ch2_wz_only_operator_02"
			},
			{
				desc = "ONBOARDING/OPERATORS_CH2WZ_ONLY_3",
				image = "onboarding_ch2_wz_only_operator_03"
			}
		},
		confirmButton = {
			action = var_10_0
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
				desc = "ONBOARDING/ARMORY_1_WZ",
				image = "onboarding_armory_1_wz"
			},
			{
				desc = "ONBOARDING/ARMORY_2",
				image = "onboarding_armory_2_wz"
			},
			{
				desc = "ONBOARDING/ARMORY_3_WZ",
				image = "onboarding_armory_3_wz"
			}
		}
	}
end

function ONBOARDING_DATA.GetOnboardingFieldUpgradeData()
	local function var_14_0(arg_15_0)
		ACTIONS.LeaveMenu(arg_15_0)
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
			action = var_14_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2FieldUpgradeData()
	local function var_16_0(arg_17_0)
		ACTIONS.LeaveMenu(arg_17_0)
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
			}
		},
		confirmButton = {
			action = var_16_0
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
	local function var_19_0(arg_20_0)
		ACTIONS.LeaveMenu(arg_20_0)
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
			action = var_19_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZCH2GunsmithData()
	local function var_21_0(arg_22_0)
		ACTIONS.LeaveMenu(arg_22_0)
	end

	return {
		title = "ONBOARDING/GUNSMITH",
		panelData = {
			{
				desc = "ONBOARDING/GUNSMITH_1",
				image = "onboarding_ch3_wz_only_gunsmith_01"
			},
			{
				desc = "ONBOARDING/GUNSMITH_2_CH2_WZ",
				image = "onboarding_ch2_wz_only_gunsmith_02"
			},
			{
				desc = "ONBOARDING/GUNSMITH_3_WZ_ONLY",
				image = "onboarding_ch3_wz_only_gunsmith_03"
			}
		},
		confirmButton = {
			action = var_21_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingLoadoutData()
	local function var_23_0(arg_24_0)
		ACTIONS.LeaveMenu(arg_24_0)
	end

	return {
		title = "ONBOARDING/LOADOUT",
		panelData = {
			{
				image = CONDITIONS.IsThirdGameMode() and "onboarding_loadout_1" or "onboarding_ch2_mw_only_edit_loadout_01",
				desc = CONDITIONS.IsThirdGameMode() and "ONBOARDING/LOADOUT_1_CP" or "ONBOARDING/EDITDROPKIT_MW_EDITLOADOUT_1"
			},
			{
				image = CONDITIONS.IsThirdGameMode() and "onboarding_loadout_2" or "onboarding_ch2_mw_only_edit_loadout_02",
				desc = CONDITIONS.IsThirdGameMode() and "ONBOARDING/LOADOUT_2_CP" or "ONBOARDING/EDITDROPKIT_MW_EDITLOADOUT_2"
			},
			{
				image = CONDITIONS.IsThirdGameMode() and "onboarding_loadout_3" or "onboarding_ch2_mw_only_edit_loadout_03",
				desc = CONDITIONS.IsThirdGameMode() and "ONBOARDING/LOADOUT_3" or "ONBOARDING/EDITDROPKIT_MW_EDITLOADOUT_3"
			}
		},
		confirmButton = {
			action = var_23_0
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
	local function var_26_0(arg_27_0)
		ACTIONS.LeaveMenu(arg_27_0)
	end

	local function var_26_1(arg_28_0)
		ACTIONS.LeaveMenu(arg_28_0)
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
			action = var_26_0
		},
		cancelButton = {
			text = "ONBOARDING/SPECIALIST_CANCEL",
			action = var_26_1
		}
	}
end

function ONBOARDING_DATA.GetOnboardingPerkUpdateData()
	local function var_29_0(arg_30_0)
		ACTIONS.LeaveMenu(arg_30_0)
	end

	local function var_29_1(arg_31_0)
		ACTIONS.LeaveMenu(arg_31_0)
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
			action = var_29_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingProFieldUpgradeData()
	local function var_32_0(arg_33_0)
		ACTIONS.LeaveMenu(arg_33_0)
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
			action = var_32_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMissionChallengesData()
	local function var_34_0(arg_35_0)
		ACTIONS.LeaveMenu(arg_35_0)
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
			action = var_34_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMatureContentData()
	local function var_36_0(arg_37_0)
		ACTIONS.LeaveMenu(arg_37_0)
	end

	local function var_36_1(arg_38_0, arg_38_1)
		if LUI.FlowManager.IsInStack("MainMenuOffline") then
			ACTIONS.RestoreMenu("MainMenuOffline", true, arg_38_1)
		else
			ACTIONS.RestoreMenu("MainMenu", true, arg_38_1)
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
			action = var_36_0
		},
		cancelButton = {
			text = "ONBOARDING/MATURE_CONTENT_CANCEL",
			action = var_36_1
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
	local function var_40_0(arg_41_0)
		ACTIONS.LeaveMenu(arg_41_0)
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
			action = var_40_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCDLRulesData()
	local function var_42_0(arg_43_0)
		ACTIONS.LeaveMenu(arg_43_0)
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
			action = var_42_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingRegimentData()
	local function var_44_0(arg_45_0)
		ACTIONS.LeaveMenu(arg_45_0)
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
			action = var_44_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCDLData()
	local function var_46_0(arg_47_0)
		ACTIONS.LeaveMenu(arg_47_0)
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
			action = var_46_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZDropKitData()
	local function var_48_0(arg_49_0)
		ACTIONS.LeaveMenu(arg_49_0)
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
			action = var_48_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZEditLoadoutData()
	local function var_50_0(arg_51_0)
		ACTIONS.LeaveMenu(arg_51_0)
	end

	return {
		title = "ONBOARDING/EDITDROPKIT",
		panelData = {
			{
				desc = "ONBOARDING/EDITDROPKIT_1",
				image = "onboarding_ch2_wz_only_edit_loadout_01"
			},
			{
				desc = "ONBOARDING/EDITDROPKIT_WZ_EDITLOADOUT_2",
				image = "onboarding_ch2_wz_only_edit_loadout_02"
			},
			{
				desc = "ONBOARDING/EDITDROPKIT_WZ_EDITLOADOUT_3",
				image = "onboarding_ch2_wz_only_edit_loadout_03"
			}
		},
		confirmButton = {
			action = var_50_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWZPerksData()
	local function var_52_0(arg_53_0)
		ACTIONS.LeaveMenu(arg_53_0)
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
			action = var_52_0
		}
	}
end

function ONBOARDING_DATA.GetCH2OnboardingWZPerksData()
	local function var_54_0(arg_55_0)
		ACTIONS.LeaveMenu(arg_55_0)
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
			}
		},
		confirmButton = {
			action = var_54_0
		}
	}
end

function ONBOARDING_DATA.GetPlunderTutorialData(arg_56_0)
	local function var_56_0(arg_57_0)
		ACTIONS.LeaveMenu(arg_57_0)
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
			action = var_56_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingTDMData(arg_58_0)
	local function var_58_0(arg_59_0)
		ACTIONS.LeaveMenu(arg_59_0)

		if arg_58_0 then
			arg_58_0()
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
			action = var_58_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingGunfightData(arg_60_0)
	local function var_60_0(arg_61_0)
		ACTIONS.LeaveMenu(arg_61_0)

		if arg_60_0 then
			arg_60_0()
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
			action = var_60_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMPMoshpitData(arg_62_0)
	local function var_62_0(arg_63_0)
		ACTIONS.LeaveMenu(arg_63_0)

		if arg_62_0 then
			arg_62_0()
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
			action = var_62_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingVehicleCamosData()
	local function var_64_0(arg_65_0)
		ACTIONS.LeaveMenu(arg_65_0)
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
			action = var_64_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingVehicleCamosWZData()
	local function var_66_0(arg_67_0)
		ACTIONS.LeaveMenu(arg_67_0)
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
				image = "onboarding_vehicle_camos_wz_2"
			},
			{
				desc = "ONBOARDING/VEHICLE_CAMOS_3",
				image = "onboarding_vehicle_camos_3"
			}
		},
		confirmButton = {
			action = var_66_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingMilSimOperatorsData()
	local function var_68_0(arg_69_0)
		ACTIONS.LeaveMenu(arg_69_0)
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
			action = var_68_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingGunsmithCustomsData()
	local function var_70_0(arg_71_0)
		ACTIONS.LeaveMenu(arg_71_0)
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
			action = var_70_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWeaponMasteryChallengesData()
	local function var_72_0(arg_73_0)
		ACTIONS.LeaveMenu(arg_73_0)
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
			action = var_72_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2WZWeaponMasteryChallengesData()
	local function var_74_0(arg_75_0)
		ACTIONS.LeaveMenu(arg_75_0)
	end

	return {
		title = "ONBOARDING/WEAPON_MASTERY",
		panelData = {
			{
				desc = "ONBOARDING/WEAPON_MASTERY_1_CH2WZ",
				image = "onboarding_weapon_mastery_1"
			},
			{
				desc = "ONBOARDING/WEAPON_MASTERY_2_CH2WZ",
				image = "onboarding_ch2_wz_only_weapon_mastery_02"
			}
		},
		confirmButton = {
			action = var_74_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2WZWeaponCustomizationData()
	local function var_76_0(arg_77_0)
		ACTIONS.LeaveMenu(arg_77_0)
	end

	return {
		title = "ONBOARDING/WEAPON_CUSTOMIZATION",
		panelData = {
			{
				desc = "ONBOARDING/WEAPON_CUSTOMIZATION_1",
				image = "onboarding_ch2_wz_only_weapon_customization_01"
			}
		},
		confirmButton = {
			action = var_76_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingTDMAnywhereData(arg_78_0)
	local function var_78_0(arg_79_0)
		ACTIONS.LeaveMenu(arg_79_0)

		if arg_78_0 then
			arg_78_0()
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
			action = var_78_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingArmoredRoyaleData(arg_80_0)
	local function var_80_0(arg_81_0)
		ACTIONS.LeaveMenu(arg_81_0)

		if arg_80_0 then
			arg_80_0()
		end
	end

	return {
		title = "ONBOARDING/ARMORED_ROYALE",
		panelData = {
			{
				desc = "ONBOARDING/ARMORED_ROYALE_DESC_1",
				image = "onboarding_armored_royale_1"
			},
			{
				desc = "ONBOARDING/ARMORED_ROYALE_DESC_2",
				image = "onboarding_armored_royale_2"
			},
			{
				desc = "ONBOARDING/ARMORED_ROYALE_DESC_3",
				image = "onboarding_armored_royale_3"
			}
		},
		confirmButton = {
			action = var_80_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingZombiesBRData(arg_82_0)
	local function var_82_0(arg_83_0)
		ACTIONS.LeaveMenu(arg_83_0)

		if arg_82_0 then
			arg_82_0()
		end
	end

	return {
		title = "MP_ZXP/WELCOME",
		panelData = {
			{
				desc = "MP_ZXP/ZXP_HINT_TEXT_1",
				image = "onboarding_zmbr_hints_1"
			},
			{
				desc = "MP_ZXP/ZXP_HINT_TEXT_2",
				image = "onboarding_zmbr_hints_2"
			},
			{
				desc = "MP_ZXP/ZXP_HINT_TEXT_3",
				image = "onboarding_zmbr_hints_3"
			}
		},
		confirmButton = {
			action = var_82_0
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
	local function var_85_0(arg_86_0)
		ACTIONS.LeaveMenu(arg_86_0)
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
			action = var_85_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2WZBlueprintStoreData()
	local function var_87_0(arg_88_0)
		ACTIONS.LeaveMenu(arg_88_0)
	end

	return {
		title = "ONBOARDING/BLUEPRINT_STORE",
		panelData = {
			{
				desc = "ONBOARDING/BLUEPRINT_STORE_CH2WZ_1",
				image = "onboarding_ch2_wz_only_store_blueprint_01"
			},
			{
				desc = "ONBOARDING/BLUEPRINT_STORE_CH2WZ_2",
				image = "onboarding_ch2_wz_only_store_blueprint_02"
			},
			{
				desc = "ONBOARDING/BLUEPRINT_STORE_2",
				image = "onboarding_blueprint_store_2"
			}
		},
		confirmButton = {
			action = var_87_0
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
				kbmDesc = "ONBOARDING/SPRAYS_DESC_2_KBM",
				image = "onboarding_sprays_2",
				desc = "ONBOARDING/SPRAYS_DESC_2"
			},
			{
				kbmDesc = "ONBOARDING/SPRAYS_DESC_3_KBM",
				image = "onboarding_sprays_3",
				desc = "ONBOARDING/SPRAYS_DESC_3"
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
	local function var_92_0(arg_93_0)
		ACTIONS.LeaveMenu(arg_93_0)
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
			action = var_92_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2WZMasteryChallengesDailyData()
	local function var_94_0(arg_95_0)
		ACTIONS.LeaveMenu(arg_95_0)
	end

	return {
		title = "ONBOARDING/CHALLENGES_DAILY_CH2WZ_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/CHALLENGES_DAILY_CH2WZ_1",
				image = "onboarding_ch2_wz_only_daily_challenge_01"
			}
		},
		confirmButton = {
			action = var_94_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2WZMasteryChallengesReservesData()
	local function var_96_0(arg_97_0)
		ACTIONS.LeaveMenu(arg_97_0)
	end

	return {
		title = "ONBOARDING/CHALLENGES_CH2WZ_RESERVES_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/CHALLENGES_CH2WZ_RESERVES_1",
				image = "onboarding_ch2_wz_only_challenge_reserves_02"
			},
			{
				desc = "ONBOARDING/CHALLENGES_CH2WZ_RESERVES_2",
				image = "onboarding_ch2_wz_only_challenge_reserves_01"
			}
		},
		confirmButton = {
			action = var_96_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardinWarzonePrivateMatchData()
	local function var_98_0(arg_99_0)
		ACTIONS.LeaveMenu(arg_99_0)
	end

	return {
		title = "ONBOARDING/WARZONE_PRIVATE_MATCH",
		panelData = {
			{
				desc = "ONBOARDING/WARZONE_PRIVATE_MATCH_DESC_1",
				image = "onboarding_wz_private_match_1"
			},
			{
				desc = "ONBOARDING/WARZONE_PRIVATE_MATCH_DESC_2",
				image = "onboarding_wz_private_match_2"
			},
			{
				desc = "ONBOARDING/WARZONE_PRIVATE_MATCH_DESC_3",
				image = "onboarding_wz_private_match_3"
			}
		},
		confirmButton = {
			action = var_98_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingRebirthOnboardingData(arg_100_0)
	local function var_100_0(arg_101_0)
		ACTIONS.LeaveMenu(arg_101_0)

		if arg_100_0 then
			arg_100_0()
		end
	end

	return {
		title = "LUA_MENU_MP/REBIRTH_NAME",
		panelData = {
			{
				desc = "ONBOARDING/ONBOARDING_TEXT_REBIRTH_1",
				image = "onboarding_rebirth_1"
			},
			{
				desc = "ONBOARDING/ONBOARDING_TEXT_REBIRTH_2",
				image = "onboarding_rebirth_2"
			},
			{
				desc = "ONBOARDING/ONBOARDING_TEXT_REBIRTH_3",
				image = "onboarding_rebirth_3"
			}
		},
		confirmButton = {
			action = var_100_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingWeaponClassifiedChallengeData()
	local function var_102_0(arg_103_0)
		ACTIONS.LeaveMenu(arg_103_0)
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
			action = var_102_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2WZLoadoutUpdateData()
	local function var_104_0(arg_105_0)
		ACTIONS.LeaveMenu(arg_105_0)
	end

	return {
		title = "ONBOARDING/CH2_WEAPONS_LOADOUTUPDATE_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/CH2_WEAPONS_LOADOUTUPDATE_1",
				image = "onboarding_ch2_wz_only_ loadout_update_01"
			}
		},
		confirmButton = {
			action = var_104_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2BootWZCrossProgressionData()
	local function var_106_0(arg_107_0)
		ACTIONS.LeaveMenu(arg_107_0)
	end

	return {
		title = "ONBOARDING/ONBOARDING_CH2_MWWZ_CROSSPROGRESSION_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/ONBOARDING_CH2_WZ_BOOT_CROSSPROGRESSION_1",
				image = "onboarding_ch2_mwwz_crossprogression_01"
			},
			{
				desc = "ONBOARDING/ONBOARDING_CH2_WZ_BOOT_CROSSPROGRESSION_2",
				image = "onboarding_ch2_mwwz_crossprogression_02"
			},
			{
				desc = "ONBOARDING/ONBOARDING_CH2_WZ_BOOT_CROSSPROGRESSION_3",
				image = "onboarding_ch2_mwwz_crossprogression_03"
			}
		},
		confirmButton = {
			action = var_106_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2BootMWCrossProgressionData()
	local function var_108_0(arg_109_0)
		ACTIONS.LeaveMenu(arg_109_0)
	end

	return {
		title = "ONBOARDING/ONBOARDING_CH2_MWWZ_CROSSPROGRESSION_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/ONBOARDING_CH2_MW_BOOT_CROSSPROGRESSION_1",
				image = "onboarding_ch2_mwwz_crossprogression_01"
			},
			{
				desc = "ONBOARDING/ONBOARDING_CH2_MW_BOOT_CROSSPROGRESSION_2",
				image = "onboarding_ch2_mwwz_crossprogression_02"
			},
			{
				desc = "ONBOARDING/ONBOARDING_CH2_MW_BOOT_CROSSPROGRESSION_3",
				image = "onboarding_ch2_mwwz_crossprogression_03"
			}
		},
		confirmButton = {
			action = var_108_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2BootMWLazeCrossProgressionData()
	local function var_110_0(arg_111_0)
		ACTIONS.LeaveMenu(arg_111_0)
	end

	return {
		title = "ONBOARDING/ONBOARDING_CH2_MWWZ_CROSSPROGRESSION_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/ONBOARDING_CH2_MW_LAZE_BOOT_CROSSPROGRESSION_1",
				image = "onboarding_ch2_mw_laze_crossprogression_01"
			},
			{
				desc = "ONBOARDING/ONBOARDING_CH2_MW_LAZE_BOOT_CROSSPROGRESSION_2",
				image = "onboarding_ch2_mw_laze_crossprogression_02"
			},
			{
				desc = "ONBOARDING/ONBOARDING_CH2_MW_LAZE_BOOT_CROSSPROGRESSION_3",
				image = "onboarding_ch2_mw_laze_crossprogression_03"
			}
		},
		confirmButton = {
			action = var_110_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2MWBarracksEquipData()
	local function var_112_0(arg_113_0)
		ACTIONS.LeaveMenu(arg_113_0)
	end

	return {
		title = "ONBOARDING/BARRACKS_CH2_EQUIP_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/BARRACKS_CH2MW_CONTENT_1",
				image = "onboarding_ch2_wz_only_barracks_01"
			}
		},
		confirmButton = {
			action = var_112_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2MWLazeBarracksEquipData()
	local function var_114_0(arg_115_0)
		ACTIONS.LeaveMenu(arg_115_0)
	end

	return {
		title = "ONBOARDING/BARRACKS_CH2_EQUIP_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/BARRACKS_CH2MW_LAZE_CONTENT_1",
				image = "onboarding_ch2_mw_laze_only_barracks_01"
			}
		},
		confirmButton = {
			action = var_114_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2WZBarracksEquipData()
	local function var_116_0(arg_117_0)
		ACTIONS.LeaveMenu(arg_117_0)
	end

	return {
		title = "ONBOARDING/BARRACKS_CH2_EQUIP_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/BARRACKS_CH2WZ_CONTENT_1",
				image = "onboarding_ch2_wz_only_barracks_01"
			}
		},
		confirmButton = {
			action = var_116_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2MWWZCareerData()
	local function var_118_0(arg_119_0)
		ACTIONS.LeaveMenu(arg_119_0)
	end

	return {
		title = "ONBOARDING/CAREER_NEWCAREER_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/CAREER_NEWCAREER_1",
				image = "onboarding_ch2_mwwz_new_career_01"
			},
			{
				desc = "ONBOARDING/CAREER_NEWCAREER_2",
				image = "onboarding_ch2_mwwz_new_career_02"
			},
			{
				desc = "ONBOARDING/CAREER_NEWCAREER_3",
				image = "onboarding_ch2_mwwz_new_career_03"
			}
		},
		confirmButton = {
			action = var_118_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2MWLazeCareerData()
	local function var_120_0(arg_121_0)
		ACTIONS.LeaveMenu(arg_121_0)
	end

	return {
		title = "ONBOARDING/CAREER_NEWCAREER_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/CAREER_LAZE_NEWCAREER_1",
				image = "onboarding_ch2_mw_laze_new_career_01"
			},
			{
				desc = "ONBOARDING/CAREER_LAZE_NEWCAREER_2",
				image = "onboarding_ch2_mw_laze_new_career_02"
			},
			{
				desc = "ONBOARDING/CAREER_LAZE_NEWCAREER_3",
				image = "onboarding_ch2_mw_laze_new_career_03"
			}
		},
		confirmButton = {
			action = var_120_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingCH2MWWZCareerSeaonLevelingData()
	local function var_122_0(arg_123_0)
		ACTIONS.LeaveMenu(arg_123_0)
	end

	return {
		title = "ONBOARDING/CAREER_LEASONLEVELING_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/CAREER_LEASONLEVELING_1",
				image = "onboarding_ch2_mwwz_seasons_01"
			},
			{
				desc = "ONBOARDING/CAREER_LEASONLEVELING_2",
				image = "onboarding_ch2_mwwz_seasons_02"
			},
			{
				desc = "ONBOARDING/CAREER_LEASONLEVELING_3",
				image = "onboarding_ch2_mwwz_seasons_03"
			}
		},
		confirmButton = {
			action = var_122_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingPrestigeProgressionData()
	local function var_124_0(arg_125_0)
		ACTIONS.LeaveMenu(arg_125_0)
	end

	return {
		title = "ONBOARDING/PRESTIGE_PROGRESSION_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/PRESTIGE_PROGRESSION_1",
				image = "onboarding_prestige_update_1"
			},
			{
				desc = "ONBOARDING/PRESTIGE_PROGRESSION_2",
				image = "onboarding_prestige_update_2"
			},
			{
				desc = "ONBOARDING/PRESTIGE_PROGRESSION_3",
				image = "onboarding_prestige_update_3"
			}
		},
		confirmButton = {
			action = var_124_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingPrestigeMasterProgressionData()
	local function var_126_0(arg_127_0)
		ACTIONS.LeaveMenu(arg_127_0)
	end

	return {
		title = "ONBOARDING/PRESTIGE_MASTER_PROGRESSION_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/PRESTIGE_MASTER_PROGRESSION_1",
				image = "onboarding_prestige_ribbon_1"
			},
			{
				desc = "ONBOARDING/PRESTIGE_MASTER_PROGRESSION_2",
				image = "onboarding_prestige_ribbon_2"
			},
			{
				desc = "ONBOARDING/PRESTIGE_MASTER_PROGRESSION_3",
				image = "onboarding_prestige_ribbon_3"
			}
		},
		confirmButton = {
			action = var_126_0
		}
	}
end

function ONBOARDING_DATA.GetGiftingFTUEData2FAEnrolled()
	local function var_128_0(arg_129_0)
		ACTIONS.LeaveMenu(arg_129_0)
	end

	return {
		title = "ONBOARDING/GIFTING_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/GIFTING_FRIEND",
				image = "onboarding_gifting_friend_1"
			},
			{
				desc = "ONBOARDING/GIFTING_SELECT",
				image = "onboarding_gifting_select_2"
			},
			{
				desc = "ONBOARDING/GIFTING_SEND",
				image = "onboarding_gifting_send_2"
			}
		},
		confirmButton = {
			action = var_128_0
		}
	}
end

function ONBOARDING_DATA.GetGiftingFTUEData2FANotEnrolled()
	local function var_130_0(arg_131_0)
		ACTIONS.LeaveMenu(arg_131_0)
	end

	return {
		setup2FA_URL = "https://profile.callofduty.com/cod/login",
		continueToSetupButtonText = "ONBOARDING/GIFTING_CONTINUE_TO_2FA",
		alreadyEnrolledButtonText = "ONBOARDING/GIFTING_2FA_ALREADY_SETUP",
		title = "ONBOARDING/GIFTING_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/GIFTING_ACTIVATE",
				image = "onboarding_gifting_activate_2"
			},
			{
				desc = "ONBOARDING/GIFTING_FRIEND",
				image = "onboarding_gifting_friend_1"
			},
			{
				desc = "ONBOARDING/GIFTING_SEND",
				image = "onboarding_gifting_send_2"
			}
		},
		confirmButton = {
			action = var_130_0
		}
	}
end

function ONBOARDING_DATA.GetGiftingFTUEData2FAEnrolledBundleVersion()
	local function var_132_0(arg_133_0)
		ACTIONS.LeaveMenu(arg_133_0)
	end

	return {
		title = "ONBOARDING/GIFTING_TITLE",
		panelData = {
			{
				desc = "ONBOARDING/GIFTING_FRIEND",
				image = "onboarding_gifting_friend_1"
			},
			{
				desc = "ONBOARDING/GIFTING_SELECT",
				image = "onboarding_gifting_select_2"
			},
			{
				desc = "ONBOARDING/GIFTING_SEND",
				image = "onboarding_gifting_send_2"
			}
		},
		confirmButton = {
			action = var_132_0
		}
	}
end

function ONBOARDING_DATA.GetLookForPartyData()
	local function var_134_0(arg_135_0)
		ACTIONS.LeaveMenu(arg_135_0)
	end

	return {
		title = "LUA_MENU_MP/LOOK_FOR_PARTY",
		panelData = {
			{
				desc_title = "ONBOARDING/LFP_TITLE_1",
				image = "onboarding_lfp_01",
				desc = "ONBOARDING/LFP_DESC_1"
			},
			{
				desc_title = "ONBOARDING/LFP_TITLE_2",
				image = "onboarding_lfp_02",
				desc = "ONBOARDING/LFP_DESC_2"
			},
			{
				desc_title = "ONBOARDING/LFP_TITLE_3",
				image = "onboarding_lfp_03",
				desc = "ONBOARDING/LFP_DESC_3"
			}
		},
		confirmButton = {
			action = var_134_0
		}
	}
end

function ONBOARDING_DATA.GetOnboardingRegimentTransitionData()
	local function var_136_0(arg_137_0)
		ACTIONS.LeaveMenu(arg_137_0)
	end

	return {
		title = "ONBOARDING/REGIMENT_FREEZE_TITLE",
		panelData = {
			{
				desc_title = "ONBOARDING/REGIMENT_FREEZE_HEADER_1",
				image = "onboarding_regiments_freeze_01",
				desc = "ONBOARDING/REGIMENT_FREEZE_DESC_1"
			},
			{
				desc_title = "ONBOARDING/REGIMENT_FREEZE_HEADER_2",
				image = "onboarding_regiments_freeze_02",
				desc = "ONBOARDING/REGIMENT_FREEZE_DESC_2"
			},
			{
				desc_title = "ONBOARDING/REGIMENT_FREEZE_HEADER_3",
				image = "onboarding_regiments_freeze_03",
				desc = "ONBOARDING/REGIMENT_FREEZE_DESC_3"
			}
		},
		confirmButton = {
			action = var_136_0
		}
	}
end

function ONBOARDING_DATA.GetGroupsRevealData()
	local function var_138_0(arg_139_0)
		ACTIONS.LeaveMenu(arg_139_0)
	end

	local var_138_1
	local var_138_2
	local var_138_3
	local var_138_4 = "ONBOARDING/GROUP_DESC_1"
	local var_138_5 = "ONBOARDING/GROUP_DESC_2"
	local var_138_6 = CONDITIONS.IsLazeOrOutrun() and "ONBOARDING/GROUP_LAZE_DESC_3" or "ONBOARDING/GROUP_DESC_3"

	return {
		title = "ONBOARDING/GROUP_TITLE",
		panelData = {
			{
				desc_title = "ONBOARDING/GROUP_HEADER_2",
				image = "onboarding_regiments_freeze_02",
				desc = var_138_5
			},
			{
				desc_title = "ONBOARDING/GROUP_HEADER_3",
				image = "onboarding_regiments_freeze_03",
				desc = var_138_6
			}
		},
		confirmButton = {
			action = var_138_0
		}
	}
end
