SEASONAL_EVENT = SEASONAL_EVENT or {}
SEASONAL_EVENT.BUTTON_LOCK_TIME = 2000
SEASONAL_EVENT.UNLOCK_SEEN_SIZE = 18
SEASONAL_EVENT.IDS = {
	SUMMER_OF_ACTION = 6,
	AMRB = 13,
	FESTIVE_FERVOR = 11,
	ADLER = 4,
	LEP = 10,
	ZOMBIES = 3,
	HAUNT = 9,
	VETERUN = 15,
	ATLANTIS = 2,
	TITANIUM_TRIALS = 17,
	HALLOWEEN = 1,
	MENDOTA = 14,
	MOF = 16,
	CITY_KILLER = 12,
	MILITARY_APPRECIATION = 5,
	HVV = 18,
	NUMBERS = 8,
	SATELLITE = 7
}
SEASONAL_EVENT.MOD_ANIM_EVENT_NAME = "update_season_event_mod_anim"
SEASONAL_EVENT.LOOT_GRID_TYPE = {
	SCROLLING_LIST = 1,
	STACKED_CARDS = 2,
	PARTICIPATION_CHALLENGES = 3,
	NONE = 0
}
SEASONAL_EVENT.SPAN_DISPLAY_TYPE = {
	COUNTDOWN = 2,
	WEEKS = 1,
	NONE = 0
}

local var_0_0 = {
	{
		hasCommunityChallenges = true,
		useTugOfWarView = true,
		isGiftDisabled = true,
		useTitleHowTo = true,
		useTabLogo = true,
		showPreviewButtonInFooter = false,
		isFinalRewardAutomatic = true,
		initSetupSequenceName = "SetupHvVEvent",
		titleDescription = "SEASONAL_EVENT_TU_WZ350/HVV_DESCRIPTION",
		tabName = "SEASONAL_EVENT_TU_WZ350/HVV_TITLE",
		id = SEASONAL_EVENT.IDS.HVV,
		onboardingData = Onboarding.SeasonalEvent,
		onboardingBink = {
			fullscreen = false,
			video = "hvv_event_intro",
			soundSet = "ui_hvv_intro",
			isEncrypted = true,
			dates = "SEASONAL_EVENT_TU_WZ350/HVV_DATES"
		},
		completionBink = {
			isEncrypted = true,
			video = "hvv_event_complete",
			soundSet = "ui_hvv_completed"
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplash
		},
		binkBackground = {
			dvarBink = "hvv_menu_backer_",
			maxBinks = 3,
			isEncrypted = true
		},
		menuSubTab = {
			layoutAnim = "LimitedTimeVariantHVV"
		},
		displaySpanType = SEASONAL_EVENT.SPAN_DISPLAY_TYPE.COUNTDOWN,
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.NONE,
		notActiveChallengeHoverSFX = SOUND_SETS.seasonalEvents.seasonalEventLepHighlight,
		activeChallengeHoverSFX = SOUND_SETS.battlePass.bpCardHighlight,
		pauseLTMMenu = {
			timerDvar = "NKRNRKQPSQ",
			eventTitle = "SEASONAL_EVENT_TU_WZ350/HVV_TITLE",
			affectedModes = "LUA_MENU/PACIFIC_ISLAND_MODES",
			widgetBgImage = "ui_ltm_info_wdg_hvv_bg",
			widgetData = {
				image = {
					"ui_ltm_info_menu_hvv_img_1",
					"ui_ltm_info_menu_hvv_img_2",
					"ui_ltm_info_menu_hvv_img_3"
				},
				header = {
					"SEASONAL_EVENT_TU_WZ350/HVV_INFO_TITLE_01",
					"SEASONAL_EVENT_TU_WZ350/HVV_INFO_TITLE_02",
					"SEASONAL_EVENT_TU_WZ350/HVV_INFO_TITLE_03"
				},
				desc = {
					"SEASONAL_EVENT_TU_WZ350/HVV_INFO_01",
					"SEASONAL_EVENT_TU_WZ350/HVV_INFO_02",
					"SEASONAL_EVENT_TU_WZ350/HVV_INFO_03"
				}
			}
		}
	},
	{
		useFinalRewardRarityAsBackerColor = true,
		isGiftDisabled = true,
		useTabLogo = true,
		useShortDescriptionsInChallengeSplashes = false,
		showStoreBundle = true,
		isFinalRewardAutomatic = true,
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupSeasonalEvent",
		disableFTUE = true,
		titleDescription = "SEASONAL_EVENT_TU_WZ345/TT_DESCRIPTION",
		tabName = "SEASONAL_EVENT_TU_WZ345/TT_TITLE",
		id = SEASONAL_EVENT.IDS.TITANIUM_TRIALS,
		onboardingData = Onboarding.SeasonalEvent,
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.WARZONE,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.NONE
		},
		eventTitleData = {
			useCompactTitleLayout = false,
			crosslaunchPrompts = {
				[LUI.GAME_SOURCE_ID.WARZONE] = {
					controller_text = "SEASONAL_EVENT_TU_WZ345/CROSSLAUNCH_WZ_CONTROLLER",
					kbm_text = "SEASONAL_EVENT_TU_WZ345/CROSSLAUNCH_WZ_KBM_CENTER"
				}
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplash
		},
		menuSubTab = {
			layoutAnim = "LimitedTimeVariantMendota"
		},
		storeBundleButtonData = {
			layoutAnim = "SetupSeasonalEventStoreBundleLayout"
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		lootItemProgressThemeOverrides = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				backgroundColor = SWATCHES.WZGlobalSwatches.WZBackground,
				fillColor = SWATCHES.WZCH3.WZCH3SeasonalEventAltColor
			}
		},
		squareProgressPanelHeaderStrings = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				isUpperCase = true,
				stringRef = "SEASONAL_EVENT/COMPLETION_BONUS"
			}
		},
		binkBackground = {
			isEncrypted = false,
			wzBink = "titanium_trials_event_bg"
		},
		widgetIncludeList = {
			SeasonalEventSquareProgressPanel = {
				"Backer"
			}
		}
	},
	{
		useFinalRewardRarityAsBackerColor = true,
		isGiftDisabled = true,
		useTabLogo = true,
		useTitleHowTo = true,
		showStoreBundle = true,
		useShortDescriptionsInChallengeSplashes = false,
		isFinalRewardAutomatic = true,
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupSeasonalEvent",
		disableFTUE = true,
		titleDescription = "SEASONAL_EVENT_TU_WZ340/MOF_DESCRIPTION",
		tabName = "SEASONAL_EVENT_TU_WZ340/MOF_TITLE",
		id = SEASONAL_EVENT.IDS.MOF,
		onboardingData = Onboarding.SeasonalEvent,
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.WARZONE,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.NONE
		},
		eventTitleData = {
			useCompactTitleLayout = false,
			crosslaunchPrompts = {
				[LUI.GAME_SOURCE_ID.WARZONE] = {
					controller_text = "SEASONAL_EVENT_TU_WZ340/CROSSLAUNCH_WZ_CONTROLLER",
					kbm_text = "SEASONAL_EVENT_TU_WZ340/CROSSLAUNCH_WZ_KBM_CENTER"
				}
			}
		},
		menuSubTab = {
			layoutAnim = "LimitedTimeVariantMendota"
		},
		storeBundleButtonData = {
			layoutAnim = "SetupSeasonalEventStoreBundleLayout"
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		lootItemProgressThemeOverrides = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				backgroundColor = SWATCHES.WZGlobalSwatches.WZBackground,
				fillColor = SWATCHES.WZCH3.WZCH3SeasonalEventAltColor
			}
		},
		squareProgressPanelHeaderStrings = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				isUpperCase = true,
				stringRef = "SEASONAL_EVENT/COMPLETION_BONUS"
			}
		},
		binkBackground = {
			isEncrypted = false,
			wzBink = "seasonal_event_background_S4"
		},
		widgetIncludeList = {
			SeasonalEventSquareProgressPanel = {
				"Backer"
			}
		}
	},
	{
		isGiftDisabled = true,
		useFinalRewardRarityAsBackerColor = true,
		useDecodeChallengeText = true,
		useTabLogo = true,
		isFinalRewardAutomatic = true,
		showStoreBundle = true,
		useShortDescriptionsInChallengeSplashes = false,
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupSeasonalEvent",
		titleDescription = "",
		tabName = "SEASONAL_EVENT_TU_WZ330/MENDOTA_TITLE",
		id = SEASONAL_EVENT.IDS.MENDOTA,
		onboardingData = Onboarding.SeasonalEvent,
		uiToggleSequences = {
			hide = "HideSeasonalEventUI",
			show = "ShowSeasonalEventUI"
		},
		onboardingBink = {
			isEncrypted = true,
			video = "mendota_event_intro",
			soundSet = "ui_operation_monarch_intro",
			fullscreen = true
		},
		completionBink = {
			isEncrypted = true,
			video = "mendota_event_outro",
			soundSet = "ui_operation_monarch_completed"
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplash
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.WARZONE,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.NONE
		},
		menuSubTab = {
			layoutAnim = "LimitedTimeVariantMendota"
		},
		storeBundleButtonData = {
			layoutAnim = "SetupSeasonalEventStoreBundleLayout"
		},
		binkBackground = {
			isEncrypted = true,
			wzBink = "mendota_menu_backer"
		},
		eventTabAmbientSoundSets = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				looping = true,
				name = ""
			}
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		lootItemProgressThemeOverrides = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				backgroundColor = SWATCHES.WZGlobalSwatches.WZBackground,
				fillColor = SWATCHES.WZCH3.WZCH3SeasonalEventAltColor
			}
		},
		squareProgressPanelHeaderStrings = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				isUpperCase = true,
				stringRef = "SEASONAL_EVENT/COMPLETION_BONUS"
			}
		},
		useTacMapChallengeTracker = function()
			return not CONDITIONS.IsMapAtlantis()
		end,
		eventTitleData = {
			compactSpacerHeight = 15,
			useCompactTitleLayout = true,
			crosslaunchPrompts = {
				[LUI.GAME_SOURCE_ID.WARZONE] = {
					controller_text = "SEASONAL_EVENT_TU_WZ330/CROSSLAUNCH_WZ_CONTROLLER",
					kbm_text = "SEASONAL_EVENT_TU_WZ330/CROSSLAUNCH_WZ_KBM_CENTER"
				}
			}
		},
		widgetIncludeList = {
			SeasonalEventSquareProgressPanel = {
				"Backer"
			}
		},
		pauseLTMMenu = {
			timerDvar = "NKRNRKQPSQ",
			eventTitle = "SEASONAL_EVENT_TU_WZ330/MENDOTA_TITLE",
			affectedModes = "BR_MENDOTA/MODE_TITLE",
			widgetBgImage = "ui_ltm_info_wdg_mendota_bg",
			widgetThemeColor = SWATCHES.WZCH3.WZCH3SeasonalEventColor,
			pauseMenuHeaderColor = SWATCHES.WZGlobalSwatches.WZText,
			widgetData = {
				image = {
					"ui_ltm_info_menu_mendota_img_1",
					"ui_ltm_info_menu_mendota_img_2",
					"ui_ltm_info_menu_mendota_img_3",
					"ui_ltm_info_menu_mendota_img_4",
					"ui_ltm_info_menu_mendota_img_5"
				},
				header = {
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_TITLE_01",
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_TITLE_02",
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_TITLE_03",
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_TITLE_04",
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_TITLE_05"
				},
				desc = {
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_01",
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_02",
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_03",
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_04",
					"SEASONAL_EVENT_TU_WZ330/MENDOTA_INFO_05"
				}
			}
		}
	},
	{
		useTitleHowTo = true,
		hasCommunityChallenges = true,
		useAllChallengesTab = true,
		isGiftDisabled = true,
		showPreviewButtonInFooter = true,
		isFinalRewardAutomatic = true,
		initSetupSequenceName = "SetupArmoredEvent",
		titleDescription = "SEASONAL_EVENT_TU_WZ325/AMRB_DESCRIPTION",
		tabName = "SEASONAL_EVENT_TU_WZ325/AMRB_TITLE",
		id = SEASONAL_EVENT.IDS.AMRB,
		onboardingData = Onboarding.AMRB,
		onboardingBink = {
			isEncrypted = true,
			video = "mp_amrb_onboarding",
			dates = "SEASONAL_EVENT_TU_WZ325/AMRB_DATES",
			fullscreen = true
		},
		completionBink = {
			isEncrypted = true,
			video = "mp_amrb_collected"
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.WARZONE,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.NONE
		},
		eventTitleData = {
			crosslaunchPrompts = {
				[LUI.GAME_SOURCE_ID.WARZONE] = {
					controller_text = "SEASONAL_EVENT_TU_WZ325/DROP_INTO_REBIRTH_PROMPT",
					kbm_text = "SEASONAL_EVENT_TU_WZ325/DROP_INTO_REBIRTH"
				}
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplash
		},
		binkBackground = {
			isEncrypted = false,
			wzBink = "ui_menu_event_amrb_menu_backer_wz_10sec_1080p"
		},
		menuSubTab = {
			layoutAnim = "LimitedTimeVariantArmoredEvent"
		},
		displaySpanType = SEASONAL_EVENT.SPAN_DISPLAY_TYPE.WEEKS,
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.PARTICIPATION_CHALLENGES,
		notActiveChallengeHoverSFX = SOUND_SETS.seasonalEvents.seasonalEventLepHighlight,
		activeChallengeHoverSFX = SOUND_SETS.battlePass.bpCardHighlight,
		useTacMapChallengeTracker = function()
			return CONDITIONS.IsMapAtlantis()
		end,
		pauseLTMMenu = {
			timerDvar = "NKRNRKQPSQ",
			eventTitle = "SEASONAL_EVENT_TU_WZ325/AMRB_LTM_TITLE",
			affectedModes = "PRESENCE/MP_ESCAPE4",
			widgetBgImage = "ui_ltm_info_wdg_amrb_bg",
			widgetData = {
				image = {
					"ui_ltm_info_menu_amrb_img_1",
					"ui_ltm_info_menu_amrb_img_2",
					"ui_ltm_info_menu_amrb_img_3"
				},
				header = {
					"SEASONAL_EVENT_TU_WZ325/AMRB_INFO_TITLE_01",
					"SEASONAL_EVENT_TU_WZ325/AMRB_INFO_TITLE_02",
					"SEASONAL_EVENT_TU_WZ325/AMRB_INFO_TITLE_03"
				},
				desc = {
					"SEASONAL_EVENT_TU_WZ325/AMRB_INFO_01",
					"SEASONAL_EVENT_TU_WZ325/AMRB_INFO_02",
					"SEASONAL_EVENT_TU_WZ325/AMRB_INFO_03"
				}
			}
		}
	},
	{
		shareFinalReward = true,
		useSquareProgressPanel = true,
		showStoreBundle = true,
		initSetupSequenceName = "SetupSeasonalEvent",
		isGiftDisabled = true,
		titleDescription = "SEASONAL_EVENT/NUMBERS_DESC",
		tabName = "SEASONAL_EVENT/SEASONAL_EVENT_TITLE",
		isFinalRewardAutomatic = true,
		id = SEASONAL_EVENT.IDS.CITY_KILLER,
		onboardingData = Onboarding.SeasonalEvent,
		onboardingBink = {
			fullscreen = true,
			video = "seasonal_event_twelve_intro",
			soundSet = "ui_search_and_deploy"
		},
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.NONE,
		pauseLTMMenu = {
			timerDvar = "NKRNRKQPSQ",
			eventTitle = "SEASONAL_EVENT/EVENT_NAME",
			affectedModes = "LUA_MENU/PACIFIC_ISLAND_MODES",
			widgetBgImage = "ui_ltm_info_wdg_bg",
			widgetData = {
				image = {
					"ui_ltm_info_menu_img_1",
					"ui_ltm_info_menu_img_2",
					"ui_ltm_info_menu_img_3"
				},
				header = {
					"SEASONAL_EVENT/EVENT_HEADER_1",
					"SEASONAL_EVENT/EVENT_HEADER_2",
					"SEASONAL_EVENT/EVENT_HEADER_3"
				},
				desc = {
					"SEASONAL_EVENT/EVENT_DESC_1",
					"SEASONAL_EVENT/EVENT_DESC_2",
					"SEASONAL_EVENT/EVENT_DESC_3"
				}
			}
		}
	},
	{
		shareFinalReward = true,
		initSetupSequenceName = "ShowMilitaryAppreciation",
		isGiftDisabled = true,
		titleDescription = "SEASONAL_EVENT/NUMBERS_DESC",
		tabName = "SEASONAL_EVENT/SEASONAL_EVENT_TITLE",
		isFinalRewardAutomatic = true,
		id = SEASONAL_EVENT.IDS.VETERUN,
		onboardingData = Onboarding.SeasonalEvent,
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.NONE,
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_MILITARY_APPRECIATION_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SPLASH_MILITARY_APPRECIATION_CHALLENGE_COMPLETE_HEADER",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_MILITARY_APPRECIATION_CHALLENGE_COMPLETE_DESC",
			sound = SOUND_SETS.seasonalEvents.militaryAppreciationMonthInGameSplash
		},
		widgetIncludeList = {
			BRBannerHeader = {
				"Glow2",
				"ButtonGlowTop",
				"BodyBold",
				"HeaderNoWrap",
				"Reward"
			}
		}
	},
	{
		showStoreBundle = true,
		useTacMapChallengeTracker = false,
		isGiftDisabled = true,
		useGameSourceAsChallengeTitle = true,
		isFinalRewardAutomatic = true,
		hasOverlay = true,
		shareFinalReward = true,
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupFestiveFervorEvent",
		titleDescription = "SEASONAL_EVENT/FESTIVEFERVOR_DESC",
		tabName = "SEASONAL_EVENT/FESTIVEFERVOR_EVENT_TITLE",
		id = SEASONAL_EVENT.IDS.FESTIVE_FERVOR,
		onboardingData = Onboarding.SeasonalEvent,
		onboardingBink = {
			fullscreen = true,
			video = "seasonal_event_intro"
		},
		completionBink = {
			video = "seasonal_event_outro"
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.VANGUARD,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.MP
		},
		storeBundleButtonData = {
			layoutAnim = "SetupFestiveFervorStoreBundleLayout"
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.VANGUARD] = {
				showBaseSnipeOnly = true,
				modAnim = "ModVA"
			},
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplash
		},
		menuSubTab = {
			layoutAnim = "LimitedTimeVariantFestiveFervor"
		},
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.STACKED_CARDS,
		widgetIncludeList = {
			SeasonalEventMenu = {
				"UpgradingReward"
			},
			SeasonalEventSquareProgressPanel = {
				"Backer"
			}
		}
	},
	{
		useTacMapChallengeTracker = true,
		isGiftDisabled = true,
		isFinalRewardAutomatic = true,
		shareFinalReward = true,
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupLEPEvent",
		titleDescription = "BR_LEP_EVENT/LEP_DESC",
		tabName = "BR_LEP_EVENT/LEP_TITLE",
		id = SEASONAL_EVENT.IDS.LEP,
		onboardingData = Onboarding.LEP,
		onboardingBink = {
			isEncrypted = true,
			video = "mp_lep_onboarding",
			fullscreen = true
		},
		completionBink = {
			isEncrypted = true,
			video = "mp_lep_collected"
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.VANGUARD,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.MP
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.VANGUARD] = {
				modAnim = "ModVA"
			},
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplash
		},
		menuSubTab = {
			layoutAnim = "LimitedTimeVariantLEP"
		},
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.STACKED_CARDS,
		notActiveChallengeHoverSFX = SOUND_SETS.seasonalEvents.seasonalEventLepHighlight,
		activeChallengeHoverSFX = SOUND_SETS.battlePass.bpCardHighlight,
		flipRowsActionSFX = SOUND_SETS.seasonalEvents.seasonalEventLepHighlight,
		widgetIncludeList = {
			SeasonalEventMenu = {
				"ChallengeCompletedImage",
				"VignetteLeft",
				"VignetteRight",
				"SafeBacker"
			},
			SeasonalEventChallengesIndicator = {
				"IconChallenge"
			},
			SeasonalEventSquareProgressPanel = {
				"Backer"
			}
		}
	},
	{
		showStoreBundle = true,
		isGiftDisabled = true,
		baseWeaponReward = true,
		isFinalRewardAutomatic = true,
		shareFinalReward = true,
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupHauntEvent",
		tabName = "SEASONAL_EVENT/HAUNT_EVENT_TITLE",
		id = SEASONAL_EVENT.IDS.HAUNT,
		onboardingData = Onboarding.SeasonalEvent,
		onboardingBink = {
			fullscreen = true,
			video = "mp_haunt_onboarding"
		},
		completionBink = {
			video = "mp_haunt_collected"
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.COLD_WAR,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.MP
		},
		storeBundleButtonData = {
			layoutAnim = "StoreHauntStoreBundleLayout",
			hidePromptWhenCompleted = true
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.COLD_WAR] = {
				modAnim = "ModCW"
			},
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplashNumbers
		},
		binkBackground = {
			isEncrypted = false,
			t9Bink = "ui_menu_event_s6_menu_backer_wz_10sec_1080p",
			wzBink = "ui_menu_event_s6_menu_backer_cw_10sec_1080p"
		},
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.STACKED_CARDS
	},
	{
		showStoreBundle = true,
		useTacMapChallengeTracker = true,
		isGiftDisabled = true,
		baseWeaponReward = true,
		isFinalRewardAutomatic = true,
		shareFinalReward = true,
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupNumbersEvent",
		titleDescription = "SEASONAL_EVENT/NUMBERS_DESC",
		tabName = "SEASONAL_EVENT/SEASONAL_EVENT_TITLE",
		id = SEASONAL_EVENT.IDS.NUMBERS,
		onboardingData = Onboarding.SeasonalEvent,
		onboardingBink = {
			fullscreen = true,
			video = "seasonal_event_intro"
		},
		completionBink = {
			video = "seasonal_event_outro"
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.COLD_WAR,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.MP
		},
		storeBundleButtonData = {
			layoutAnim = "SetupNumbersStoreBundleLayout"
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.COLD_WAR] = {
				modAnim = "ModCW"
			},
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplashNumbers
		},
		binkBackground = {
			isEncrypted = false,
			t9Bink = "ui_menu_event_s5_5_menu_backer_wz_10sec_1080p",
			wzBink = "ui_menu_event_s5_5_menu_backer_cw_10sec_1080p"
		},
		menuSubTab = {
			layoutAnim = "LimitedTimeVariantNumbers"
		},
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.STACKED_CARDS
	},
	{
		shareFinalReward = true,
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupSeasonalEvent",
		isGiftDisabled = true,
		tabName = "SEASONAL_EVENT/SEASONAL_EVENT_TITLE",
		isFinalRewardAutomatic = true,
		id = SEASONAL_EVENT.IDS.SATELLITE,
		onboardingData = Onboarding.SeasonalEvent,
		onboardingBink = {
			fullscreen = true,
			video = "seasonal_event_intro"
		},
		completionBink = {
			video = "seasonal_event_outro"
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.COLD_WAR,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.MP
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.COLD_WAR] = {
				modAnim = "ModCW"
			},
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplash
		}
	},
	{
		isGiftDisabled = true,
		isFinalRewardAutomatic = true,
		useSquareProgressPanel = true,
		showStoreBundle = true,
		initSetupSequenceName = "SetupSeasonalEvent",
		tabName = "SEASONAL_EVENT/SEASONAL_EVENT_TITLE",
		id = SEASONAL_EVENT.IDS.SUMMER_OF_ACTION,
		onboardingData = Onboarding.SoAEvent,
		onboardingBink = {
			autoClosePopup = true,
			video = "seasonal_event_intro",
			fullscreen = true
		},
		completionBink = {
			video = "seasonal_event_outro"
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.COLD_WAR,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.MP
		},
		storeBundleButtonData = {
			layoutAnim = "StoreBundleLayout"
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.COLD_WAR] = {
				modAnim = "ModCW"
			},
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SEASONAL_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.seasonalEventSplash
		},
		challengeCardHoverSound = SOUND_SETS.seasonalEvents.adlerChallengeCardSFX,
		gridType = SEASONAL_EVENT.LOOT_GRID_TYPE.STACKED_CARDS,
		widgetIncludeList = {
			SeasonalEventSquareProgressPanel = {
				"XPBG",
				"XPIcon",
				"XPReward"
			}
		},
		widgetExcludeList = {
			SeasonalEventChallengesIndicator = {
				"XPReward"
			},
			SeasonalEventSquareProgressPanel = {
				"Divider"
			}
		}
	},
	{
		initSetupSequenceName = "ShowMilitaryAppreciation",
		id = SEASONAL_EVENT.IDS.MILITARY_APPRECIATION,
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_MILITARY_APPRECIATION_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SPLASH_MILITARY_APPRECIATION_CHALLENGE_COMPLETE_HEADER",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_MILITARY_APPRECIATION_CHALLENGE_COMPLETE_DESC",
			sound = SOUND_SETS.seasonalEvents.militaryAppreciationMonthInGameSplash
		},
		widgetIncludeList = {
			BRBannerHeader = {
				"Glow2",
				"ButtonGlowTop",
				"BodyBold",
				"HeaderNoWrap",
				"Reward"
			}
		}
	},
	{
		useSquareProgressPanel = true,
		initSetupSequenceName = "SetupAdlerEvent",
		isGiftDisabled = true,
		tabName = "SEASONAL_EVENT/HUNT_FOR_ADLER_TITLE",
		isFinalRewardAutomatic = true,
		id = SEASONAL_EVENT.IDS.ADLER,
		onboardingData = Onboarding.AdlerEvent,
		onboardingBink = {
			fullscreen = true,
			video = "mp_adlerhunt_onboarding"
		},
		completionBink = {
			video = "mp_adlerhunt_collected"
		},
		crossLaunchButtonData = {
			gameSourceID = LUI.GAME_SOURCE_ID.COLD_WAR,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.MP
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.COLD_WAR] = {
				modAnim = "ModCW"
			},
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				modAnim = "ModWZ"
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/H4A_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.adlerInGameSplash
		},
		challengeCardHoverSound = SOUND_SETS.seasonalEvents.adlerChallengeCardSFX,
		widgetIncludeList = {
			SeasonalEventChallengesIndicator = {
				"Divider",
				"Border0"
			}
		}
	},
	{
		initSetupSequenceName = "SetupZombiesEvent",
		isGiftDisabled = true,
		tabName = "SEASONAL_EVENT/OUTBREAK_TITLE",
		isFinalRewardAutomatic = true,
		id = SEASONAL_EVENT.IDS.ZOMBIES,
		onboardingData = Onboarding.ZombiesEvent,
		onboardingBink = {
			isKorea15Unsafe = true,
			video = "mp_outbreak_onboarding",
			fullscreen = true,
			soundSet = SOUND_SETS.seasonalEvents.zombiesOnboarding
		},
		completionBink = {
			video = "mp_outbreak_collected",
			soundSet = SOUND_SETS.seasonalEvents.zombiesCollected
		},
		crossLaunchButtonData = {
			layoutAnim = "CrossLaunchLayout",
			gameSourceID = LUI.GAME_SOURCE_ID.COLD_WAR,
			deepLinkMode = LUI.DEEP_LINK_GAME_MODE.ZM
		},
		storeBundleButtonData = {
			layoutAnim = "StoreBundleLayout"
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.COLD_WAR] = {
				findAllText = "SEASONAL_EVENT/COMPLETE_X_OUTBREAK_CHALLENGES",
				bonusLootText = "SEASONAL_EVENT/BONUS_OUTBREAK_REWARD",
				modAnim = "ModCW"
			},
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				findAllText = "SEASONAL_EVENT/COMPLETE_X_VERDANSK_CHALLENGES",
				bonusLootText = "SEASONAL_EVENT/BONUS_WARZONE_REWARD",
				modAnim = "ModWZ"
			}
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_X_CHALLENGE_COMPLETE_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/H4A_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.zombiesInGameSplash
		},
		widgetIncludeList = {
			SeasonalEventChallenges = {
				"Image"
			}
		}
	},
	{
		tabName = "SEASONAL_EVENT/ATLANTIS_TITLE",
		initSetupSequenceName = "AtlantisEvent",
		isFinalRewardAutomatic = true,
		id = SEASONAL_EVENT.IDS.ATLANTIS,
		onboardingData = Onboarding.RebirthEvent,
		onboardingBink = {
			autoClosePopup = true,
			video = "mp_atlantis_onboarding",
			fullscreen = true,
			soundSet = SOUND_SETS.seasonalEvents.atlantisOnboarding
		},
		completionBink = {
			video = "mp_atlantis_collected",
			soundSet = SOUND_SETS.seasonalEvents.atlantisCollected
		},
		gameSourceData = {
			[LUI.GAME_SOURCE_ID.WARZONE] = {
				findAllText = "SEASONAL_EVENT/COMPLETE_X_CHALLENGES"
			}
		}
	},
	{
		tabName = "SEASONAL_EVENT/HALLOWEEN",
		initSetupSequenceName = "Halloween",
		usingMap = true,
		id = SEASONAL_EVENT.IDS.HALLOWEEN,
		onboardingData = Onboarding.HalloweenOnboarding,
		onboardingBink = {
			autoClosePopup = true,
			video = "mp_halloween_onboarding",
			fullscreen = true,
			soundSet = SOUND_SETS.seasonalEvents.halloweenOnboarding
		},
		completionBink = {
			video = "mp_halloween_collected",
			soundSet = SOUND_SETS.seasonalEvents.halloweenCollected
		},
		inGameSplashData = {
			textHeaderParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_HEADER",
			textSeasonComplete = "SEASONAL_EVENT/SPLASH_EVENT_COMPLETE",
			textBodyParameterized = "SEASONAL_EVENT/SPLASH_LOOTFOUND_SUBHEADER",
			sound = SOUND_SETS.seasonalEvents.halloweenInGameSplash
		}
	}
}

local function var_0_1()
	return Dvar.CFHDGABACF("MLNNMOPQOP")
end

SEASONAL_EVENT.MendotaIntelUnlockState = {
	LOCKED = 0,
	PREUNLOCKOUT = 4,
	NEXT = 1,
	UNLOCKED = 6,
	PREUNLOCKLOOP = 3,
	CELEBRATING = 5,
	PREUNLOCKIN = 2
}
SEASONAL_EVENT.PauseMenuLTM = {}

function SEASONAL_EVENT.PauseMenuLTM.SetupModeDescription(arg_4_0, arg_4_1)
	local var_4_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData().pauseLTMMenu.affectedModes
	local var_4_1 = LUI.Split(var_4_0, ":")
	local var_4_2 = ""

	if not CONDITIONS.IsArabic() then
		var_4_2 = Engine.CBBHFCGDIC(arg_4_1) .. " "

		for iter_4_0 = 1, #var_4_1 do
			var_4_2 = var_4_2 .. Engine.CBBHFCGDIC(var_4_1[iter_4_0])

			if iter_4_0 ~= #var_4_1 then
				var_4_2 = var_4_2 .. ", "
			end
		end
	else
		for iter_4_1 = #var_4_1, 1, -1 do
			var_4_2 = var_4_2 .. Engine.CBBHFCGDIC(var_4_1[iter_4_1])

			if iter_4_1 ~= #var_4_1 then
				var_4_2 = var_4_2 .. ", "
			end
		end

		var_4_2 = var_4_2 .. " " .. Engine.CBBHFCGDIC(arg_4_1)
	end

	if var_4_2 ~= "" then
		arg_4_0:setText(var_4_2)
	end
end

function SEASONAL_EVENT.PauseMenuLTM.SetupEventTimer(arg_5_0)
	local var_5_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData().pauseLTMMenu.timerDvar

	if var_5_0 then
		local var_5_1 = Dvar.CFHDGABACF(var_5_0)

		arg_5_0.eventTimer = LUI.UITimer.new({
			interval = 1000,
			event = "update_ltm_timer"
		})
		arg_5_0.eventTimer.id = "ltmTimer"

		arg_5_0:addElement(arg_5_0.eventTimer)
		arg_5_0:addAndCallEventHandler("update_ltm_timer", function()
			local var_6_0 = tonumber(Engine.DCJHCAFIIA())
			local var_6_1 = var_6_0 < var_5_1 and var_5_1 - var_6_0 or 0

			if var_6_1 <= 0 then
				var_6_1 = 0

				arg_5_0.eventTimer:closeTree()

				arg_5_0.eventTimer = nil
			end

			local var_6_2 = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/PAUSE_LTM_LIVE", Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_6_1))))

			arg_5_0:setText(var_6_2)
		end)
	else
		arg_5_0:SetAlpha(0)
	end
end

function SEASONAL_EVENT.GetCurrentEventID()
	return var_0_1()
end

function SEASONAL_EVENT.GetPopupOnboardingWatchFlag()
	return Onboarding.tutorials.SEASON_EVENT_POPUP_WATCH_FLAG
end

function SEASONAL_EVENT.RegisterElementToModAnimEvent(arg_9_0)
	assert(arg_9_0._sequences, "SEASONAL_EVENT.RegisterElementToModAnimEvent -> expecting non-nil sequences on elementToRegister -> " .. tostring(arg_9_0.id))
	arg_9_0:registerEventHandler(SEASONAL_EVENT.MOD_ANIM_EVENT_NAME, function(arg_10_0, arg_10_1)
		assert(arg_10_0._sequences[arg_10_1.animToUse], "SEASONAL_EVENT.RegisterElementToModAnimEvent -> expecting sequence ( " .. tostring(arg_10_1.animToUse) .. " ) defined on element -> " .. tostring(arg_10_0.id))
		ACTIONS.AnimateSequence(arg_10_0, arg_10_1.animToUse)
	end)
end

function SEASONAL_EVENT.GetCurrentSeasonalEventData(arg_11_0)
	if not CONDITIONS.IsSeasonalEventActive() and not arg_11_0 then
		return nil
	end

	for iter_11_0, iter_11_1 in ipairs(var_0_0) do
		if (not iter_11_1.condition or iter_11_1.condition and iter_11_1.condition()) and SEASONAL_EVENT.GetCurrentEventID() == iter_11_1.id then
			return iter_11_1
		end
	end
end

function SEASONAL_EVENT.GetCurrentSeasonalEventLootGridType()
	local var_12_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if not var_12_0.gridType then
		return SEASONAL_EVENT.LOOT_GRID_TYPE.SCROLLING_LIST
	else
		return var_12_0.gridType
	end
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsMap()
	local var_13_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_13_0 then
		return var_13_0.usingMap
	end

	return true
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsIntroPopupAutoClosing()
	local var_14_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_14_0 and var_14_0.onboardingBink then
		return var_14_0.onboardingBink.autoClosePopup
	end

	return false
end

function SEASONAL_EVENT.GetCurrentSeasonalEventShowStoreBundle()
	local var_15_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_15_0 then
		return var_15_0.showStoreBundle
	end

	return false
end

function SEASONAL_EVENT.GetCurrentSeasonalEventFTUEDisabled()
	local var_16_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_16_0 then
		return var_16_0.disableFTUE
	end
end

function SEASONAL_EVENT.IsUsingGameSourceChallengeTitles()
	local var_17_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_17_0 then
		return var_17_0.useGameSourceAsChallengeTitle
	end

	return false
end

local function var_0_2(arg_18_0, arg_18_1, arg_18_2)
	if not arg_18_0 or arg_18_0[arg_18_1] == nil then
		return false
	end

	for iter_18_0, iter_18_1 in ipairs(arg_18_0[arg_18_1]) do
		if iter_18_1 == arg_18_2 then
			return true
		end
	end

	return false
end

function SEASONAL_EVENT.IsWidgetInCurrentEventIncludeList(arg_19_0, arg_19_1)
	local var_19_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if not var_19_0 or var_19_0 == nil then
		return false
	end

	return var_0_2(var_19_0.widgetIncludeList, arg_19_0, arg_19_1)
end

function SEASONAL_EVENT.IsWidgetInCurrentEventExcludeList(arg_20_0, arg_20_1)
	local var_20_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if not var_20_0 or var_20_0 == nil then
		return false
	end

	return var_0_2(var_20_0.widgetExcludeList, arg_20_0, arg_20_1)
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsHVV()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.HVV
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsTitaniumTrials()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.TITANIUM_TRIALS
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsMOF()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.MOF
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsMendota()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.MENDOTA
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsArmoredRebirth()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.AMRB
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsLEP()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.LEP
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsHaunt()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.HAUNT
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsFestiveFervor()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.FESTIVE_FERVOR
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsNumbers()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.NUMBERS
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsSatellite()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.SATELLITE
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsSummerOfAction()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.SUMMER_OF_ACTION
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsMilitaryAppreciation()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.MILITARY_APPRECIATION
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsAdler()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.ADLER
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsAtlantis()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.ATLANTIS
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsZombies()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.ZOMBIES
end

function SEASONAL_EVENT.GetCurrentSeasonalEventIsHaunt()
	return SEASONAL_EVENT.GetCurrentEventID() == SEASONAL_EVENT.IDS.HAUNT
end

function SEASONAL_EVENT.GetCurrentInitSetupSequenceName()
	local var_37_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_37_0 and var_37_0.initSetupSequenceName then
		return var_37_0.initSetupSequenceName
	end

	return ""
end

function SEASONAL_EVENT.GetCurrentSeasonalEventTabName()
	local var_38_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_38_0 then
		DebugPrint("SEASONAL_EVENT.GetCurrentSeasonalEventTabName - seasonal currentEventID : " .. tostring(SEASONAL_EVENT.GetCurrentEventID()))
		DebugPrint("SEASONAL_EVENT.GetCurrentSeasonalEventTabName - data.tabName : " .. tostring(var_38_0.tabName))

		return var_38_0.tabName
	end

	return ""
end

function SEASONAL_EVENT.GetCurrentSeasonalEventOnboadingData()
	local var_39_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_39_0 then
		return var_39_0.onboardingData
	end

	return nil
end

function SEASONAL_EVENT.GetCurrentSeasonalEventHasCompletionSplash()
	local var_40_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData(true)

	if var_40_0 then
		return var_40_0.inGameSplashData ~= nil
	end

	return false
end

function SEASONAL_EVENT.GetOngoingCommunityChallengeData(arg_41_0)
	assert(#arg_41_0 > 0, "Current Seasonal Event has no Community Challenges registered!")

	for iter_41_0 = 1, #arg_41_0 do
		local var_41_0 = arg_41_0[iter_41_0]

		if not var_41_0.isComplete then
			return var_41_0
		end
	end

	return arg_41_0[#arg_41_0]
end

local function var_0_3(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	local function var_42_0(arg_43_0, arg_43_1, arg_43_2)
		return arg_43_0 * (1 - arg_43_2) + arg_43_1 * arg_43_2
	end

	local var_42_1 = arg_42_1
	local var_42_2 = var_42_0(0, arg_42_2, var_42_1 / arg_42_3)
	local var_42_3 = math.floor(var_42_2)

	DebugPrint("SeasonalEvent: Challenge \"" .. arg_42_0 .. "\" values re-scaled from challenge data " .. arg_42_1 .. "/" .. arg_42_3 .. " to UI display values " .. var_42_3 .. "/" .. arg_42_2)

	return var_42_3
end

function SEASONAL_EVENT.AdjustProgressWithCommunityChallengeData(arg_44_0, arg_44_1)
	local var_44_0 = tonumber(Challenge.GetAmount(arg_44_1.challengeId, Challenge.Type.COMMUNITY))

	if arg_44_1.maxValue ~= var_44_0 then
		arg_44_0.globalProgress = var_0_3(arg_44_1.challengeRef, arg_44_0.globalProgress, arg_44_1.maxValue, var_44_0)
		arg_44_0.playerProgress = var_0_3(arg_44_1.challengeRef, arg_44_0.playerProgress, arg_44_1.maxValue, var_44_0)
	end

	return arg_44_0
end

function SEASONAL_EVENT.AddChallengesAvailabilityToChallengeData(arg_45_0, arg_45_1)
	local var_45_0 = SEASONAL_EVENT.GetChallengesSpansTable(arg_45_0)
	local var_45_1 = SEASONAL_EVENT.GetEventCurrentSpan(var_45_0)

	for iter_45_0 = 1, #arg_45_0 do
		local var_45_2 = arg_45_0[iter_45_0]

		if not var_45_2.availableOnEpoch or var_45_2.availableOnEpoch == "" then
			var_45_2.isAvailable = true
		else
			local var_45_3 = SEASONAL_EVENT.GetSpanFromEpochTime(var_45_0, var_45_2.availableOnEpoch)

			var_45_2.isAvailable = var_45_3 <= var_45_1

			if arg_45_1 == SEASONAL_EVENT.SPAN_DISPLAY_TYPE.WEEKS then
				var_45_2.standbyText = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CH_STANDBY", var_45_3)
			end
		end
	end

	return arg_45_0
end

local function var_0_4(arg_46_0, arg_46_1)
	local var_46_0 = {}
	local var_46_1 = StringTable.BFHCAIIDA(CSV.seasonalCommunityChallenges.file)
	local var_46_2 = SEASONAL_EVENT.GetCurrentSeasonalEventData(arg_46_1)
	local var_46_3 = var_46_2 and var_46_2.id or -1

	for iter_46_0 = 0, var_46_1 - 1 do
		local var_46_4 = CSV.ReadRowWithFile(CSV.seasonalCommunityChallenges, CSV.seasonalCommunityChallenges.file, iter_46_0)

		if var_46_4 and var_46_4.eventID then
			local var_46_5 = tonumber(var_46_4.eventID)

			if var_46_5 and var_46_5 == var_46_3 then
				var_46_4.id = tonumber(var_46_4.id)
				var_46_4.eventId = tonumber(var_46_4.eventId)
				var_46_4.maxValue = tonumber(var_46_4.targetProgress)
				var_46_4.challengeId = Challenge.GetIDFromRef(var_46_4.challengeRef, Challenge.Type.COMMUNITY) or 0

				if not var_46_4.challengeId or var_46_4.challengeId == "" then
					var_46_4.challengeId = 0
				end

				var_46_4.challengeInfo = CommunityChallenges.DACBGIEGAA(arg_46_0, var_46_4.challengeId)

				if var_46_4.challengeId ~= 0 then
					var_46_4.challengeInfo = SEASONAL_EVENT.AdjustProgressWithCommunityChallengeData(var_46_4.challengeInfo, var_46_4)
				end

				local var_46_6 = var_46_4.challengeInfo.globalProgress

				var_46_4.isComplete = var_46_6 and var_46_6 >= var_46_4.maxValue

				table.insert(var_46_0, var_46_4)
			end
		end
	end

	if var_46_2 and #var_46_0 > 0 then
		var_46_0 = SEASONAL_EVENT.AddChallengesAvailabilityToChallengeData(var_46_0, var_46_2.displaySpanType)
	end

	return var_46_0
end

function SEASONAL_EVENT.TryUpdatingCommunityChallengesProgress(arg_47_0)
	local var_47_0 = LUI.DataSourceInGlobalModel.new("frontend.seasonalEvent.communityUpdateTimer"):GetModel(arg_47_0)
	local var_47_1 = DataModel.JJEHAEBDF(var_47_0)
	local var_47_2 = Dvar.CFHDGABACF("lui_min_time_between_community_updates") or 60

	if var_47_2 < (var_47_1 and -Engine.CCEJJCCDEG(var_47_1) or var_47_2 + 1) then
		CommunityChallenges.DEDFIDEGAI(arg_47_0)
		DataModel.DBEBGEAJHJ(var_47_0, Engine.DCJHCAFIIA())
	end
end

function SEASONAL_EVENT.FilterParticipationChallengesData(arg_48_0, arg_48_1)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_1) do
		iter_48_1.lootData = LOOT.GetLootCardData(arg_48_0, tonumber(iter_48_1.lootID))

		if iter_48_1.isFinalReward == "0" then
			table.insert(var_48_0, iter_48_1)
		end
	end

	return var_48_0
end

function SEASONAL_EVENT.GetCompletionChallengeData()
	local var_49_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	local var_49_1 = {}

	table.insert(var_49_1, {
		key = 1,
		col = CSV.seasonalEvent.cols.isFinalReward
	})
	table.insert(var_49_1, {
		col = CSV.seasonalEvent.cols.eventID,
		key = var_49_0.id
	})

	local var_49_2 = StringTable.BABCABFJEJ(CSV.seasonalEvent.file, var_49_1)
	local var_49_3 = CSV.ReadRow(CSV.seasonalEvent, var_49_2)

	if var_49_3 then
		return var_49_3.lootID, var_49_3.challengeRef, var_49_3.backendChallengeRef
	end
end

local function var_0_5(arg_50_0, arg_50_1, arg_50_2)
	if arg_50_2 == "1" then
		return arg_50_0.Challenges.Progress
	end

	local var_50_0 = Challenge.GetIDFromRef(arg_50_0.Challenges.Ref, Challenge.Type.MISC)
	local var_50_1 = tonumber(Challenge.GetAmount(var_50_0, Challenge.Type.MISC))

	if arg_50_1 ~= var_50_1 then
		return var_0_3(arg_50_0.Challenges.Ref, arg_50_0.Challenges.Progress, arg_50_1, var_50_1)
	else
		return arg_50_0.Challenges.Progress
	end
end

function SEASONAL_EVENT.ReadMiscChallengeProgressInfo(arg_51_0, arg_51_1)
	local var_51_0 = tonumber(arg_51_1.targetProgress)

	if Engine.DDJFBBJAIG() or CONDITIONS.IsOnlineMatch() then
		local var_51_1 = MiscChallenges.CJJHIEDGGG(arg_51_0, arg_51_1.challengeRef)

		if var_51_1 and var_51_1.Challenges and var_51_1.Challenges.Progress then
			var_51_1.Challenges.Progress = var_0_5(var_51_1, var_51_0, arg_51_1.isFinalReward)
			arg_51_1.isComplete = var_51_0 <= var_51_1.Challenges.Progress
			arg_51_1.currentValue = math.min(var_51_1.Challenges.Progress, var_51_0)
			arg_51_1.maxValue = var_51_0
		end
	else
		arg_51_1.isComplete = false
		arg_51_1.currentValue = 0
		arg_51_1.maxValue = var_51_0
	end

	return arg_51_1
end

local function var_0_6(arg_52_0, arg_52_1)
	local var_52_0 = {}
	local var_52_1 = StringTable.BFHCAIIDA(CSV.seasonalEvent.file)
	local var_52_2 = SEASONAL_EVENT.GetCurrentSeasonalEventData(arg_52_1)
	local var_52_3 = -1

	if var_52_2 and var_52_2.id then
		var_52_3 = var_52_2.id
	end

	for iter_52_0 = 0, var_52_1 - 1 do
		local var_52_4 = CSV.ReadRowWithFile(CSV.seasonalEvent, CSV.seasonalEvent.file, iter_52_0)

		if var_52_4 and var_52_4.eventID then
			local var_52_5 = tonumber(var_52_4.eventID)

			if var_52_5 and var_52_5 == var_52_3 then
				local var_52_6 = tonumber(var_52_4.targetProgress)

				if var_52_4.challengeRef and #var_52_4.challengeRef > 0 and var_52_6 then
					var_52_4 = SEASONAL_EVENT.ReadMiscChallengeProgressInfo(arg_52_0, var_52_4)
				end

				table.insert(var_52_0, var_52_4)
			end
		end
	end

	return var_52_0
end

function SEASONAL_EVENT.ParseTiersFromChallengeData(arg_53_0, arg_53_1)
	assert(type(arg_53_1) == "table")

	local var_53_0 = {}

	for iter_53_0, iter_53_1 in ipairs(arg_53_1) do
		local var_53_1 = tonumber(iter_53_1.order)
		local var_53_2 = split(iter_53_1.backendChallengeRef, "|")
		local var_53_3

		for iter_53_2, iter_53_3 in ipairs(var_53_2) do
			local var_53_4 = MiscChallenges.CJJHIEDGGG(arg_53_0, iter_53_3)
			local var_53_5 = var_53_4 and var_53_4.Challenges and var_53_4.Challenges.Progress

			if var_53_5 and (not var_53_3 or var_53_3 < var_53_5) then
				var_53_3 = var_53_5
				iter_53_1.backendChallengeRef = iter_53_3
			end
		end

		iter_53_1.progress = var_53_3

		if var_53_0[var_53_1] and tonumber(iter_53_1.tierGroup) then
			var_53_0[var_53_1].lootTable[tonumber(iter_53_1.tierGroup)] = iter_53_1
		else
			table.insert(var_53_0, var_53_1, {
				level = var_53_1,
				lootTable = {
					iter_53_1
				},
				cost = tonumber(iter_53_1.targetProgress)
			})
		end
	end

	return var_53_0
end

function SEASONAL_EVENT.SetupCountdown(arg_54_0, arg_54_1)
	assert(arg_54_0, "Usage: SEASONAL_EVENT.SetupCountdown( <label> )")

	if not arg_54_0 then
		DebugPrint("SEASONAL_EVENT.SetupCountdown called without a label element")

		return
	end

	local var_54_0 = arg_54_1 and arg_54_1.overrideEndTime or Dvar.CFHDGABACF("NKRNRKQPSQ") or 0
	local var_54_1 = arg_54_1 and arg_54_1.event or "update_seasonal_event_timer"

	arg_54_0.eventTimer = LUI.UITimer.new({
		interval = 1000,
		event = var_54_1
	})
	arg_54_0.eventTimer.id = "seasonalEventTimer"

	arg_54_0:addElement(arg_54_0.eventTimer)
	arg_54_0:addAndCallEventHandler(var_54_1, function()
		local var_55_0 = Engine.DEIDGHDBHD()
		local var_55_1 = var_55_0 < var_54_0 and var_54_0 - var_55_0 or 0

		if var_55_1 == 0 then
			arg_54_0.eventTimer:closeTree()

			arg_54_0.eventTimer = nil
		end

		if arg_54_1 and arg_54_1.displaySeconds then
			local var_55_2 = math.floor(var_55_1 / 86400)
			local var_55_3 = math.floor(var_55_1 % 86400 / 3600)
			local var_55_4 = math.floor(var_55_1 % 3600 / 60)
			local var_55_5 = math.floor(var_55_1 % 60)

			if var_55_2 == 0 then
				if var_55_3 == 0 then
					arg_54_0:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MINUTES_SECONDS", var_55_4, var_55_5))
				else
					arg_54_0:setText(Engine.CBBHFCGDIC("LUA_MENU/HOURS_MINUTES_SECONDS", var_55_3, var_55_4, var_55_5))
				end
			else
				arg_54_0:setText(Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", var_55_2, var_55_3, var_55_4, var_55_5))
			end
		else
			local var_55_6 = Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_55_1))

			if arg_54_1 and arg_54_1.singleLineDisplayString then
				assert(type("singleLineDisplayString") == "string", "The singleLineDisplayString must be of type 'string'.")

				local var_55_7 = Engine.CBBHFCGDIC(arg_54_1.singleLineDisplayString, var_55_6)

				arg_54_0:setText(ToUpperCase(var_55_7))
			else
				arg_54_0:setText(ToUpperCase(var_55_6))
			end
		end
	end)
end

function SEASONAL_EVENT.AreAllSeasonalEventsCompleted(arg_56_0)
	assert(arg_56_0, "Usage: SEASONAL_EVENT.AreAllSeasonalEventsCompleted( <controllerIndex> )")

	if not arg_56_0 then
		DebugPrint("SEASONAL_EVENT.AreAllSeasonalEventsCompleted requires controllerIndex")

		return
	end

	local var_56_0, var_56_1, var_56_2 = SEASONAL_EVENT.GetOverallWZProgress(arg_56_0)

	return var_56_0 == var_56_1 and var_56_2
end

function SEASONAL_EVENT.GetOverallWZProgress(arg_57_0)
	assert(arg_57_0, "Usage: SEASONAL_EVENT.GetOverallProgress( <controllerIndex> )")

	if not arg_57_0 then
		DebugPrint("SEASONAL_EVENT.GetOverallProgress requires controller index")

		return
	end

	local var_57_0 = 0
	local var_57_1 = 0
	local var_57_2 = false
	local var_57_3 = SEASONAL_EVENT.GetChallengesData(arg_57_0).miscChallengesData

	for iter_57_0, iter_57_1 in ipairs(var_57_3) do
		if iter_57_1.isFinalReward ~= "1" and iter_57_1.isIntroGift ~= "1" and iter_57_1.isEarlyAccessGift ~= "1" and iter_57_1.gameSource == LUI.GAME_SOURCE_ID.WARZONE then
			var_57_1 = var_57_1 + 1

			if iter_57_1.isComplete then
				var_57_0 = var_57_0 + 1
			end
		elseif iter_57_1.isFinalReward ~= "1" and iter_57_1.isComplete then
			var_57_2 = true
		end
	end

	if var_57_1 == var_57_0 then
		local var_57_4 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

		if var_57_4 and var_57_4.isFinalRewardAutomatic then
			var_57_2 = true
		end
	end

	return var_57_0, var_57_1, var_57_2
end

function SEASONAL_EVENT.GetChallengesData(arg_58_0, arg_58_1)
	assert(arg_58_0, "Usage: SEASONAL_EVENT.GetChallengesData( <controllerIndex> )")

	if not arg_58_0 then
		return
	end

	local var_58_0 = {
		miscChallengesData = var_0_6(arg_58_0, arg_58_1),
		commChallengesData = var_0_4(arg_58_0, arg_58_1)
	}

	if #var_58_0.commChallengesData == 0 then
		return var_58_0
	end

	local function var_58_1(arg_59_0, arg_59_1)
		for iter_59_0 = 1, #arg_59_0 do
			if arg_59_0[iter_59_0].challengeRef == arg_59_1 then
				return arg_59_0[iter_59_0]
			end
		end

		return nil
	end

	for iter_58_0 = 1, #var_58_0.miscChallengesData do
		local var_58_2 = var_58_0.miscChallengesData[iter_58_0]

		var_58_2.unlockIdOffset = #var_58_0.commChallengesData

		if var_58_2.availableWithCommChallengeRef and var_58_2.availableWithCommChallengeRef ~= "" then
			local var_58_3 = var_58_1(var_58_0.commChallengesData, var_58_2.availableWithCommChallengeRef)

			assert(var_58_3, "Can't find a community challenge with ref '" .. var_58_2.availableWithCommChallengeRef .. "'")

			var_58_2.isAvailable = var_58_3.challengeInfo.challengeFound and var_58_3.challengeInfo.globalProgress > 0
		else
			var_58_2.isAvailable = true
		end
	end

	return var_58_0
end

function SEASONAL_EVENT.IsSeasonalEventCompleteBinkSeen(arg_60_0)
	local var_60_0 = PlayerData.BFFBGAJGD(arg_60_0, CoD.StatsGroup.NonGame).isSeasonalEventComplete
	local var_60_1

	if var_60_0 then
		var_60_1 = var_60_0:get()
	end

	return var_60_1 and var_60_1 == 1
end

function SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_61_0, arg_61_1)
	local var_61_0 = PlayerData.BFFBGAJGD(arg_61_0, CoD.StatsGroup.NonGame).isSeasonalEventComplete

	if var_61_0 then
		var_61_0:set(arg_61_1 and 1 or 0)
		ACTIONS.UploadStats(nil, arg_61_0)
	end
end

function SEASONAL_EVENT.DisplayGiftPopups()
	local var_62_0 = Dvar.IBEGCHEFE("lui_seasonal_content_show_gifts")

	if var_62_0 ~= nil then
		return var_62_0
	end

	local var_62_1 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	return not (var_62_1 and var_62_1.isGiftDisabled)
end

function SEASONAL_EVENT.GetIntroGiftDetails()
	local var_63_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	local var_63_1 = {}

	table.insert(var_63_1, {
		key = 1,
		col = CSV.seasonalEvent.cols.isIntroGift
	})
	table.insert(var_63_1, {
		col = CSV.seasonalEvent.cols.eventID,
		key = var_63_0.id
	})

	local var_63_2 = StringTable.BABCABFJEJ(CSV.seasonalEvent.file, var_63_1)
	local var_63_3 = CSV.ReadRow(CSV.seasonalEvent, var_63_2)

	if var_63_3 then
		return var_63_3.lootID, var_63_3.challengeRef
	end
end

function SEASONAL_EVENT.IsIntroGiftRecieved(arg_64_0)
	assert(arg_64_0, "Usage: SEASONAL_EVENT.IsIntroGiftRecieved( <controllerIndex> )")

	local var_64_0, var_64_1 = SEASONAL_EVENT.GetIntroGiftDetails()

	assert(var_64_1, "Need gift challenge ref")

	local var_64_2 = MiscChallenges.CJJHIEDGGG(arg_64_0, var_64_1)

	return var_64_2 and var_64_2.Challenges and var_64_2.Challenges.Progress and var_64_2.Challenges.Progress >= 1
end

function SEASONAL_EVENT.GetEarlyAccessGiftDetails()
	local var_65_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	local var_65_1 = {}

	table.insert(var_65_1, {
		key = 1,
		col = CSV.seasonalEvent.cols.isEarlyAccessGift
	})
	table.insert(var_65_1, {
		col = CSV.seasonalEvent.cols.eventID,
		key = var_65_0.id
	})

	local var_65_2 = StringTable.BABCABFJEJ(CSV.seasonalEvent.file, var_65_1)

	if var_65_2 >= 0 then
		local var_65_3 = CSV.ReadRow(CSV.seasonalEvent, var_65_2)

		if var_65_3 then
			return var_65_3.lootID, var_65_3.challengeRef
		end
	end

	return nil
end

function SEASONAL_EVENT.IsEarlyAccessGiftRecieved(arg_66_0)
	assert(arg_66_0, "Usage: SEASONAL_EVENT.IsEarlyAccessGiftRecieved( <controllerIndex> )")

	local var_66_0, var_66_1 = SEASONAL_EVENT.GetEarlyAccessGiftDetails()

	if var_66_0 and var_66_1 then
		local var_66_2 = MiscChallenges.CJJHIEDGGG(arg_66_0, var_66_1)

		return var_66_2 and var_66_2.Challenges and var_66_2.Challenges.Progress and var_66_2.Challenges.Progress >= 1
	end

	return nil
end

function SEASONAL_EVENT.GetSeasonalChallengeDetailsForChallengeId(arg_67_0, arg_67_1)
	local var_67_0 = MiscChallenges.DFHEFHDCFC(arg_67_0, arg_67_1)

	if var_67_0 then
		local var_67_1 = var_67_0.Challenges.Ref

		if var_67_1 and #var_67_1 > 0 then
			local var_67_2 = StringTable.BJJBBCJGEJ(CSV.seasonalEvent.file, CSV.seasonalEvent.cols.challengeRef, var_67_1)

			if var_67_2 and var_67_2 >= 0 then
				local var_67_3 = CSV.ReadRow(CSV.seasonalEvent, var_67_2)

				if var_67_3 then
					return var_67_3
				end
			end
		end
	end
end

function SEASONAL_EVENT.IsSeasonalChallenge(arg_68_0, arg_68_1)
	return SEASONAL_EVENT.GetSeasonalChallengeDetailsForChallengeId(arg_68_0, arg_68_1) ~= nil
end

function SEASONAL_EVENT.IsSeasonalFinalChallenge(arg_69_0, arg_69_1)
	local var_69_0 = SEASONAL_EVENT.GetSeasonalChallengeDetailsForChallengeId(arg_69_0, arg_69_1)

	return var_69_0 ~= nil and var_69_0.isFinalReward and tonumber(var_69_0.isFinalReward) == 1
end

function SEASONAL_EVENT.GetSeenUnlockID(arg_70_0, arg_70_1)
	assert(arg_70_0 and arg_70_1, "Usage: SEASONAL_EVENT.GetSeenUnlockID( <controllerIndex>, <seasonalEventID> )")

	if not arg_70_0 or not arg_70_1 then
		DebugPrint("SEASONAL_EVENT.GetSeenUnlockID: missing controller index or sesaonal event ID")

		return nil
	end

	arg_70_1 = tonumber(arg_70_1)

	if not arg_70_1 or arg_70_1 <= 0 or arg_70_1 > SEASONAL_EVENT.UNLOCK_SEEN_SIZE then
		DebugPrint("SEASONAL_EVENT.GetSeenUnlockID: seasonalEventID not in range, expected: [1-" .. SEASONAL_EVENT.UNLOCK_SEEN_SIZE .. "]")

		return nil
	end

	local var_70_0 = PlayerData.BFFBGAJGD(arg_70_0, CoD.StatsGroup.NonGame).isSeasonalEventUnlockSeen

	if var_70_0 then
		return var_70_0[arg_70_1 - 1]:get() == 1
	else
		DebugPrint("SEASONAL_EVENT.GetSeenUnlockID: nongamedata entry isSeasonalEventUnlockSeen does not exist")

		return nil
	end
end

function SEASONAL_EVENT.SetSeenUnlockID(arg_71_0, arg_71_1)
	assert(arg_71_0 and arg_71_1, "Usage: SEASONAL_EVENT.SetSeenUnlockID( <controllerIndex>, <seasonalEventID> )")

	if not arg_71_0 or not arg_71_1 then
		DebugPrint("SEASONAL_EVENT.SetSeenUnlockID: missing controller index or seasonal event ID")

		return
	end

	arg_71_1 = tonumber(arg_71_1)

	if not arg_71_1 or arg_71_1 <= 0 or arg_71_1 > SEASONAL_EVENT.UNLOCK_SEEN_SIZE then
		DebugPrint("SEASONAL_EVENT.SetSeenUnlockID: seasonalEventID not in range, expected: [1-" .. SEASONAL_EVENT.UNLOCK_SEEN_SIZE .. "]")

		return
	end

	local var_71_0 = PlayerData.BFFBGAJGD(arg_71_0, CoD.StatsGroup.NonGame).isSeasonalEventUnlockSeen

	if var_71_0 then
		var_71_0[arg_71_1 - 1]:set(1)
		ACTIONS.UploadStats(nil, arg_71_0)
	else
		DebugPrint("SEASONAL_EVENT.SetSeenUnlockID: nongamedata entry isSeasonalEventUnlockSeen does not exist")
	end
end

function SEASONAL_EVENT.ResetUnlocksSeen(arg_72_0)
	assert(arg_72_0, "Usage: SEASONAL_EVENT.ResetUnlocksSeen( <controllerIndex> )")

	if not arg_72_0 then
		return
	end

	local var_72_0 = PlayerData.BFFBGAJGD(arg_72_0, CoD.StatsGroup.NonGame).isSeasonalEventUnlockSeen

	if var_72_0 then
		local var_72_1 = 0
		local var_72_2 = StringTable.BFHCAIIDA(CSV.seasonalEvent.file)

		for iter_72_0 = 0, var_72_2 - 1 do
			if iter_72_0 < SEASONAL_EVENT.UNLOCK_SEEN_SIZE then
				var_72_1 = var_72_1 + 1

				var_72_0[iter_72_0]:set(0)
			end
		end

		ACTIONS.UploadStats(nil, arg_72_0)

		if var_72_1 == var_72_2 then
			DebugPrint("SeasonalEvent: Successfully reset nongamedata.isSeasonalEventUnlockSeen.")
		else
			DebugPrint("SeasonalEvent: Size of " .. CSV.seasonalEvent.file .. " and nongamedata.isSeasonalEventUnlockSeen are out of sync.")
		end
	end
end

local var_0_7 = 10000

function SEASONAL_EVENT.TryAwardSeasonalEventsComplete(arg_73_0, arg_73_1)
	local var_73_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	local function var_73_1()
		local var_74_0 = {
			isComplete = true,
			isSeasonalEvent = true,
			completionBink = var_73_0.completionBink
		}

		LUI.FlowManager.RequestAddMenu("StoreFullScreenCinematic", true, arg_73_1, false, var_74_0, true)
		SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_73_1, true)
	end

	if var_73_0 and var_73_0.isFinalRewardAutomatic then
		local var_73_2, var_73_3, var_73_4 = SEASONAL_EVENT.GetCompletionChallengeData()

		if var_73_3 then
			local var_73_5 = MiscChallenges.CJJHIEDGGG(arg_73_1, var_73_3)

			if Dvar.IBEGCHEFE("lui_test_force_show_completion_bink") and var_73_5 and var_73_5.Challenges and var_73_5.Challenges.Progress then
				Dvar.DHEGHJJJHI("lui_test_force_show_completion_bink", false)
				SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_73_1, false)

				var_73_5.Challenges.Progress = 1
			end

			if var_73_5 and var_73_5.Challenges and var_73_5.Challenges.Progress and var_73_5.Challenges.Progress < 1 then
				arg_73_0:addEventHandler("completed_misc_challenge", function(arg_75_0, arg_75_1)
					var_73_1()
				end)
				Challenges.DFGEFGFCFC(arg_73_1, "collect_item", var_73_4)
			elseif not SEASONAL_EVENT.IsSeasonalEventCompleteBinkSeen(arg_73_1) then
				var_73_1()
			end
		end
	end
end

function SEASONAL_EVENT.SetupProgressionEntries(arg_76_0, arg_76_1)
	local var_76_0

	for iter_76_0, iter_76_1 in ipairs(arg_76_0) do
		if Engine.DIEEIEFCFF() then
			if iter_76_1.id == SEASONAL_EVENT.IDS.ZOMBIES and iter_76_1.order == "2" then
				var_76_0 = iter_76_1
			elseif var_76_0 == nil and iter_76_1.id ~= SEASONAL_EVENT.IDS.ZOMBIES and iter_76_1.order == "1" then
				var_76_0 = iter_76_1
			end
		elseif var_76_0 == nil and iter_76_1.order == "1" then
			var_76_0 = iter_76_1
		end

		local var_76_1 = iter_76_1.gameSource or LUI.GAME_SOURCE_ID.WARZONE

		if not arg_76_1[var_76_1] then
			arg_76_1[var_76_1] = {
				_numChallenges = 0,
				_numComplete = 0,
				_finalLootID = 0
			}
		end

		local var_76_2 = iter_76_1.isFinalReward == "1"
		local var_76_3 = iter_76_1.isIntroGift ~= "1" and iter_76_1.isEarlyAccessGift ~= "1"

		if var_76_2 then
			arg_76_1[var_76_1]._finalLootID = tonumber(iter_76_1.lootID) or 0
			arg_76_1[var_76_1]._challengeRef = iter_76_1.challengeRef or ""
		elseif var_76_3 then
			arg_76_1[var_76_1]._numChallenges = arg_76_1[var_76_1]._numChallenges + 1

			if iter_76_1.isComplete then
				arg_76_1[var_76_1]._numComplete = arg_76_1[var_76_1]._numComplete + 1
			end
		end

		if iter_76_1.fakeLootCardImage then
			arg_76_1[var_76_1]._fakeLootCardImage = iter_76_1.fakeLootCardImage
		end

		if iter_76_1.fakeRarity then
			arg_76_1[var_76_1]._fakeRarity = iter_76_1.fakeRarity
		end
	end

	return var_76_0
end

function SEASONAL_EVENT.SetupProgressionPanel(arg_77_0, arg_77_1)
	assert(arg_77_1, "ProgressPanel:Setup requires seasonal event data")

	if not arg_77_1 then
		arg_77_0.FinalReward:SetAlpha(0)

		return
	end

	if SEASONAL_EVENT.GetCurrentSeasonalEventIsArmoredRebirth() then
		arg_77_0.Preview:setText(Engine.CBBHFCGDIC(LUI.IsLastInputKeyboardMouse(arg_77_0._controllerIndex) and "SEASONAL_EVENT/PREVIEW" or "SEASONAL_EVENT/PREVIEW_GAMEPAD_PROMPT"))
	end

	local var_77_0 = SEASONAL_EVENT.SetupProgressionEntries(arg_77_1, arg_77_0._csvEntryListData)

	if var_77_0 and var_77_0.gameSource then
		return var_77_0.gameSource
	end
end

function SEASONAL_EVENT.GetLepChallengeName(arg_78_0)
	local var_78_0 = Game.BFEEGCHICA(arg_78_0, "ui_br_lep_data_client") or 0
	local var_78_1 = BitwiseOperators.band(var_78_0, 7)

	if var_78_1 > 0 then
		return ({
			"BR_LEP_EVENT/CH_HINT_TITLE_WZ_1",
			"BR_LEP_EVENT/CH_HINT_TITLE_WZ_2",
			"BR_LEP_EVENT/CH_HINT_TITLE_WZ_3",
			"BR_LEP_EVENT/CH_HINT_TITLE_WZ_4",
			"BR_LEP_EVENT/CH_HINT_TITLE_WZ_5",
			"BR_LEP_EVENT/CH_HINT_TITLE_WZ_6"
		})[var_78_1]
	else
		return ""
	end
end

function SEASONAL_EVENT.GetChallengesSpansTable(arg_79_0)
	local function var_79_0(arg_80_0, arg_80_1)
		for iter_80_0 = 1, #arg_80_0 do
			if arg_80_0[iter_80_0] == arg_80_1 then
				return true
			end
		end

		return false
	end

	local var_79_1 = {}
	local var_79_2 = Dvar.CFHDGABACF("LMLNTMTRKP")
	local var_79_3 = Dvar.CFHDGABACF("NKRNRKQPSQ")

	table.insert(var_79_1, var_79_2)
	table.insert(var_79_1, var_79_3)

	for iter_79_0 = 1, #arg_79_0 do
		local var_79_4 = arg_79_0[iter_79_0]

		if var_79_4.availableOnEpoch ~= "" and not var_79_0(var_79_1, tonumber(var_79_4.availableOnEpoch)) then
			table.insert(var_79_1, tonumber(var_79_4.availableOnEpoch))
		end
	end

	table.sort(var_79_1, function(arg_81_0, arg_81_1)
		return arg_81_0 < arg_81_1
	end)

	return var_79_1
end

function SEASONAL_EVENT.GetSpanFromEpochTime(arg_82_0, arg_82_1)
	local var_82_0 = 0
	local var_82_1 = Engine.CCEJJCCDEG(arg_82_1)

	for iter_82_0 = 1, #arg_82_0 do
		local var_82_2 = arg_82_0[iter_82_0]
		local var_82_3 = Engine.CCEJJCCDEG(var_82_2)

		if var_82_1 and var_82_3 and var_82_3 <= var_82_1 then
			var_82_0 = iter_82_0
		else
			return var_82_0
		end
	end

	return var_82_0
end

function SEASONAL_EVENT.GetEventCurrentSpan(arg_83_0)
	local var_83_0 = 604800
	local var_83_1 = Dvar.CFHDGABACF("lui_seasonal_challenges_availability_dev_offset_weeks") or 0
	local var_83_2 = Engine.BAHGDJFBEF(Engine.DCJHCAFIIA(), var_83_1 * var_83_0)

	return SEASONAL_EVENT.GetSpanFromEpochTime(arg_83_0, var_83_2)
end

function SEASONAL_EVENT.IsSeasonalEventUsingDecodeChallengeText()
	local var_84_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	return var_84_0 and var_84_0.useDecodeChallengeText
end

function SEASONAL_EVENT.IsSeasonalEventUsingTabLogo()
	local var_85_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	return var_85_0 and var_85_0.useTabLogo
end

function SEASONAL_EVENT.IsSeasonalEventTabSoundLooped(arg_86_0)
	local var_86_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_86_0 and var_86_0.eventTabAmbientSoundSets then
		local var_86_1 = var_86_0.eventTabAmbientSoundSets[arg_86_0]

		return var_86_1 and var_86_1.looping
	end

	return false
end

function SEASONAL_EVENT.AreLootItemProgressBarColorsOverridden()
	local var_87_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	return var_87_0 and var_87_0.lootItemProgressThemeOverrides ~= nil
end

function SEASONAL_EVENT.GetSquareProgressPanelHeaderStrings(arg_88_0)
	local var_88_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()

	if var_88_0 and var_88_0.squareProgressPanelHeaderStrings then
		local var_88_1 = var_88_0.squareProgressPanelHeaderStrings[arg_88_0]

		if var_88_1 and var_88_1.stringRef then
			if not var_88_1.isUpperCase then
				return Engine.CBBHFCGDIC(var_88_1.stringRef)
			else
				return ToUpperCase(Engine.CBBHFCGDIC(var_88_1.stringRef))
			end
		end
	end
end

function SEASONAL_EVENT.GetMPTabsMenu()
	local var_89_0 = {
		"MPMainMenu",
		"BRMainMenu",
		"CPMainMenu"
	}

	for iter_89_0 = 1, #var_89_0 do
		local var_89_1 = var_89_0[iter_89_0]

		if LUI.FlowManager.IsInStack(var_89_1) then
			local var_89_2 = LUI.FlowManager.GetMenuByName(var_89_1).menu

			if var_89_2 then
				return var_89_2.MPTabsMenu
			end
		end
	end
end

SEASONAL_EVENT.HVV = {}
SEASONAL_EVENT.HVV.N = 0
SEASONAL_EVENT.HVV.H = 1
SEASONAL_EVENT.HVV.V = 2

function SEASONAL_EVENT.GetHVVAllegiances(arg_90_0)
	local var_90_0 = DataSources.inGame.player.BRData.hvvPoints.squadAllegiances:GetValue(arg_90_0)
	local var_90_1 = {}

	for iter_90_0 = 0, MP.BRTeamMaxSize - 1 do
		local var_90_2 = iter_90_0 + 1

		var_90_1[var_90_2] = {}

		local var_90_3 = BitwiseOperators.rshift(var_90_0, 2 * iter_90_0)

		var_90_1[var_90_2].allegiance = BitwiseOperators.band(var_90_3, 3)
	end

	for iter_90_1 = 0, MP.BRTeamMaxSize - 1 do
		local var_90_4 = DataSources.inGame.player.BRData.teamList:GetDataSourceAtIndex(iter_90_1, arg_90_0)

		if var_90_4 and var_90_4.clientNum then
			local var_90_5 = var_90_4.clientNum:GetValue(arg_90_0) or Game.DBACJGFHDD(arg_90_0)

			if var_90_5 then
				local var_90_6 = Game.DEFDIHBJEH(var_90_5)

				if not var_90_1[var_90_6].clientNum then
					var_90_1[var_90_6].clientNum = var_90_5
					var_90_1[var_90_6].squadIndex = var_90_6
					var_90_1[var_90_6].gamerTag = Game.CFHAGHFFJI(var_90_5)
				end
			end
		end
	end

	return var_90_1
end

function SEASONAL_EVENT.GetOlarideItemType(arg_91_0, arg_91_1)
	for iter_91_0 = 0, MP.BRTeamMaxSize - 1 do
		if arg_91_1 == iter_91_0 + 1 then
			local var_91_0 = DataSources.inGame.player.BRData.olaride.itemTypeArray:GetValue(arg_91_0)
			local var_91_1 = BitwiseOperators.rshift(var_91_0, 2 * iter_91_0)

			return BitwiseOperators.band(var_91_1, 3)
		end
	end
end

function SEASONAL_EVENT.IsHVVRewardAlreadyUnlocked(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	if not SEASONAL_EVENT.GetCurrentSeasonalEventIsHVV() then
		return false
	end

	local var_92_0 = {
		2,
		4
	}
	local var_92_1 = tonumber(arg_92_3) == 11583
	local var_92_2 = false

	for iter_92_0, iter_92_1 in ipairs(var_92_0) do
		if arg_92_2 == tonumber(arg_92_1[iter_92_1]) then
			var_92_2 = true
		end
	end

	if not var_92_2 then
		return false
	end

	local var_92_3 = SEASONAL_EVENT.GetChallengesData(arg_92_0, true)
	local var_92_4 = var_92_3.commChallengesData[1].challengeInfo.playerProgress or 0
	local var_92_5 = var_92_3.commChallengesData[2].challengeInfo.playerProgress or 0

	if var_92_1 then
		return arg_92_2 <= var_92_5
	else
		return arg_92_2 <= var_92_4
	end
end
