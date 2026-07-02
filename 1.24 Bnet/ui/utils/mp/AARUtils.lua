AAR = {
	TIME_TO_FILL_XP_BAR_MS = 2500,
	MAX_STATS_DISPLAY_NUM = 6,
	NumUnlocksPerPage = 3,
	MAX_XP_TYPE_DISPLAY_NUM = 6,
	MAX_UNLOCK_DISPLAY_NUM = 3,
	INVALID_STATS_NAME = "None",
	MAX_COMMENDATION_DISPLAY_NUM = 3,
	Layout = {
		FooterHeight = 38,
		TitleBarHeight = 33,
		SubTitleBarHeight = 31,
		Width = 800,
		Height = 490,
		SubTitleCapWidth = 20,
		SubTitleBannerWidth = 180
	},
	Scoreboard = {
		NumRows = 18,
		Layout = {
			Height = 614
		}
	},
	Arrow = {
		Height = 64,
		Width = 32
	},
	Progress = {
		Layout = {
			Height = 453
		}
	},
	Swatch = {
		title = SWATCHES.text.primaryText,
		title_2 = SWATCHES.text.secondaryText,
		background = COLORS.grey36,
		background_2 = COLORS.grey56,
		background_3 = COLORS.grey102,
		background_4 = {
			g = 0.125,
			b = 0.125,
			r = 0.125
		},
		background_5 = COLORS.veryDarkCyan,
		trim = COLORS.grey102,
		subtext = COLORS.grey102,
		colorpop = SWATCHES.highlight.frontEnd,
		progressborder = COLORS.white,
		header_text = COLORS.white,
		spacer_1 = COLORS.grey51,
		friendly = COLORS.cyan,
		enemy = COLORS.orange,
		border = SWATCHES.window.borderColor
	},
	UnlockTypes = {
		HEAD = "head",
		CHALLENGE = "challenge",
		BACKGROUND = "background",
		POWER = "power",
		RIG = "rig",
		CAMO = "camo",
		FATE_CARD = "fateCard",
		SUPER = "super",
		PATCH = "patch",
		BODY = "body",
		TRAIT = "trait",
		WEAPON = "weapon",
		ALIEN = "alien",
		ASSAULTATTACH = "assaultAttach",
		LMGATTACH = "lmgAttach",
		PISTOLATTACH = "pistolAttach",
		MELEEATTACH = "meleeAttach",
		MTXP = "missionTeamXP",
		FEATURE = "feature",
		DMRATTACH = "dmrAttach",
		PERK = "perk",
		CONSUMABLE = "ZombieConsumable",
		CALLING_CARD = "callingCard",
		PICK_10 = "pick10",
		SMGATTACH = "smgAttach",
		SNIPERATTACH = "sniperAttach",
		CLASSICATTACH = "classicAttach",
		FATE_DECK_SIZE = "fatedecksize",
		STREAK = "killstreak",
		CP_WEAPON = "CPWeapon",
		SHOTGUNATTACH = "shotgunAttach",
		PROJECTILEATTACH = "projectileAttach"
	},
	TabTypes = {
		SCOREBOARD = 2,
		CHALLENGES = 3,
		CONTRACTS = 6,
		COMMENDATIONS = 5,
		GUNSMITH = 4,
		SUMMARY = 1,
		NONE = 0
	},
	ProgressTypes = {
		MATCH_XP = 1,
		MISSION_BONUS = 6,
		MATCH_XP_DOUBLE = 2,
		CHALLENGE_BONUS = 5,
		CONTRACT_BONUS = 3,
		PLUNDER_BONUS = 4
	},
	BattlePassBonusTypes = {
		SKILL_BONUS4 = 5,
		MATCH_BONUS = 7,
		SKILL_BONUS1 = 2,
		CHALLENGE_BONUS = 9,
		TIME_BONUS = 1,
		SKILL_BONUS3 = 4,
		MATCH_BONUS_DOUBLE = 8,
		SKILL_BONUS5 = 6,
		SKILL_BONUS2 = 3
	},
	UnlockItemTypes = {
		CAC_UNLOCK = 7,
		TACTICAL = 4,
		SECONDARY_WEAPON = 2,
		PRIMARY_WEAPON = 1,
		PERK = 5,
		EQUIPMENT = 3,
		KILLSTREAK = 6,
		CHALLENGE_UNLOCK = 8,
		NONE = 0
	},
	ChallengeTypes = {
		OPERATORS = 1,
		ADVENTURE = 2,
		MISC = 5,
		STANDARD = 3,
		CUSTOMIZE = 4,
		NONE = 0
	},
	MatchSummaryAvailable = {
		PUBLIC = 1,
		NON_PUBLIC = 2,
		NONE = 0
	},
	ClientMatchData = {
		CP = "ddl/mp/zombieclientmatchdata.ddl",
		MP = "ddl/mp/clientmatchdata.ddl"
	}
}
UnlockDataTable = {
	[LOOT.itemTypes.WEAPON] = {
		File = "AARUnlockItemLoadout",
		Name = Engine.CBBHFCGDIC("AAR/WEAPON")
	},
	[LOOT.itemTypes.PERK] = {
		File = "AARUnlockItemLoadout",
		Name = Engine.CBBHFCGDIC("LUA_MENU/TITLE_PERK")
	},
	[LOOT.itemTypes.EQUIPMENT] = {
		File = "AARUnlockItemLoadout",
		Name = Engine.CBBHFCGDIC("LUA_MENU/TITLE_EQUIPMENT")
	},
	[LOOT.itemTypes.STREAK] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/KILLSTREAK")
	},
	[LOOT.itemTypes.OPERATOR] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/OPERATOR")
	},
	[LOOT.itemTypes.OPERATOR_SKIN] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/OPERATOR_SKIN")
	},
	[LOOT.itemTypes.WATCH] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/WATCH")
	},
	[LOOT.itemTypes.ATTACHMENT] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/ATTACHMENT")
	},
	[LOOT.itemTypes.PLAYERCARD] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/PLAYERCARD")
	},
	[LOOT.itemTypes.EMBLEM] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/EMBLEM")
	},
	[LOOT.itemTypes.CAMO] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/CAMO")
	},
	[LOOT.itemTypes.RETICLE] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/RETICLE")
	},
	[LOOT.itemTypes.CHARM] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/CHARM")
	},
	[LOOT.itemTypes.GESTURES] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/GESTURES")
	},
	[LOOT.itemTypes.SUPER] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/FIELD_UPGRADE")
	},
	[LOOT.itemTypes.ROLE] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/ROLE")
	},
	[LOOT.itemTypes.OPERATOR_TAUNT] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/TAUNTS")
	},
	[LOOT.itemTypes.OPERATOR_EXECUTION] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/EXECUTION")
	},
	[LOOT.itemTypes.OPERATOR_INTRO] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/INTRO")
	},
	[LOOT.itemTypes.STICKER] = {
		Name = "",
		File = ""
	},
	[LOOT.itemTypes.SPRAYS] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/SPRAYS")
	},
	[LOOT.itemTypes.FEATURE] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("AAR/FEATURE")
	},
	[LOOT.itemTypes.CONSUMABLE] = {
		File = "AARUnlockItemMisc",
		Name = Engine.CBBHFCGDIC("LUA_MENU/REWARD")
	}
}
AAR.UnlockItemTypeNames = UnlockItemTypeNames
AAR.UnlockDataTable = UnlockDataTable
AwardsTable = {
	File = "mp/awardTable.csv",
	Cols = {
		Name = 3,
		Icon = 2,
		Desc = 4,
		Ref = 1
	}
}
AAR.PROGRESSION_TRACKER_ID_START = 100000
AAR.PROGRESSION_TRACKER_ID_END = 109999
AAR.PARADE_PROGRESS_DONE = "parade_display_progress_done"
AAR.PARADE_ELDER_RANK_INTRO_DONE = "parade_display_elder_rank_intro_done"
AAR.PARADE_DONE = "parade_display_done"
AAR.PARADE_BATTLE_PASS_DONE = "parade_battlepass_done"
AAR.KEY_UNIT_CURRENCY = 100
AAR.ParadeState = {
	WEAPON_UNLOCKS = 4,
	KEY_REWARD = 6,
	XP = 2,
	XP_NONE = 1,
	BATTLE_PASS_XP = 3,
	WEAPON_CAMO_UNLOCKS = 5,
	COMMENDATIONS = 7,
	NONE = 0
}
AAR.BRXPType = {
	MISC_XP = 7,
	PLACEMENT = 6,
	COMBAT_XP = 1,
	CASH = 4,
	MATCH_BONUS = 5,
	MAX_NUM = 7,
	LOOT_XP = 3,
	MISSION_XP = 2
}
AAR.BRXPTable = {
	[AAR.BRXPType.COMBAT_XP] = {
		summaryNameKey = "AAR/COMBAT_VALUE_XP",
		value = 0,
		name = Engine.CBBHFCGDIC("AAR/COMBAT_XP")
	},
	[AAR.BRXPType.MISSION_XP] = {
		summaryNameKey = "AAR/MISSION_VALUE_XP",
		value = 0,
		name = Engine.CBBHFCGDIC("AAR/MISSION_XP")
	},
	[AAR.BRXPType.LOOT_XP] = {
		summaryNameKey = "AAR/LOOT_VALUE_XP",
		value = 0,
		name = Engine.CBBHFCGDIC("AAR/LOOT_XP")
	},
	[AAR.BRXPType.CASH] = {
		summaryNameKey = "AAR/CASH_COLLECTED_VALUE",
		value = 0,
		name = Engine.CBBHFCGDIC("AAR/CASH_COLLECTED")
	},
	[AAR.BRXPType.MATCH_BONUS] = {
		summaryNameKey = "AAR/MATCH_BONUS_VALUE",
		value = 0,
		name = Engine.CBBHFCGDIC("AAR/MATCH_BONUS")
	},
	[AAR.BRXPType.PLACEMENT] = {
		summaryNameKey = "AAR/PLACEMENT_VALUE",
		value = 0,
		name = Engine.CBBHFCGDIC("AAR/PLACEMENT")
	},
	[AAR.BRXPType.MISC_XP] = {
		summaryNameKey = "AAR/MISC_XP_VALUE",
		value = 0,
		name = Engine.CBBHFCGDIC("AAR/MISC_XP")
	}
}
AAR.MagmaSummaryState = {
	BR_TDM_SUMMARY_READY = 4,
	BR_PARADE_READY = 1,
	BR_SUMMARY_READY = 2,
	BM_SUMMARY_READY = 3,
	NONE = 0
}
BR_INIT_XP_INDEX = 6
BR_FINAL_XP_INDEX = 7
AAR.BRXPAudio = {
	[AAR.BRXPType.COMBAT_XP] = {
		start = SOUND_SETS.brAAR.combat_start,
		rise = SOUND_SETS.brAAR.combat_rise,
		stop = SOUND_SETS.brAAR.combat_stop
	},
	[AAR.BRXPType.MISSION_XP] = {
		start = SOUND_SETS.brAAR.contract_start,
		rise = SOUND_SETS.brAAR.contract_rise,
		stop = SOUND_SETS.brAAR.contract_stop
	},
	[AAR.BRXPType.LOOT_XP] = {
		start = SOUND_SETS.brAAR.matchBonus_start,
		rise = SOUND_SETS.brAAR.matchBonus_rise,
		stop = SOUND_SETS.brAAR.matchBonus_stop
	},
	[AAR.BRXPType.CASH] = {
		start = SOUND_SETS.brAAR.cash_start,
		rise = SOUND_SETS.brAAR.cash_rise,
		stop = SOUND_SETS.brAAR.cash_stop
	},
	[AAR.BRXPType.MATCH_BONUS] = {
		start = SOUND_SETS.brAAR.matchBonus_start,
		rise = SOUND_SETS.brAAR.matchBonus_rise,
		stop = SOUND_SETS.brAAR.matchBonus_stop
	},
	[AAR.BRXPType.PLACEMENT] = {
		start = SOUND_SETS.brAAR.placement_start,
		rise = SOUND_SETS.brAAR.placement_rise,
		stop = SOUND_SETS.brAAR.placement_stop
	},
	[AAR.BRXPType.MISC_XP] = {
		start = SOUND_SETS.brAAR.matchBonus_start,
		rise = SOUND_SETS.brAAR.matchBonus_rise,
		stop = SOUND_SETS.brAAR.matchBonus_stop
	}
}

function AAR.GetRoundSquadMember(arg_1_0)
	return (PlayerData.BFFBGAJGD(arg_1_0, CoD.StatsGroup.Common).round.squadMemberIndex:get())
end

function AAR.GetRoundMatchXP(arg_2_0)
	return PlayerData.BFFBGAJGD(arg_2_0, CoD.StatsGroup.Common).round.matchXp:get() or 0
end

function AAR.GetRoundMiscXP(arg_3_0)
	return PlayerData.BFFBGAJGD(arg_3_0, CoD.StatsGroup.Common).round.miscXp:get() or 0
end

function AAR.GetRoundScoreXP(arg_4_0)
	return PlayerData.BFFBGAJGD(arg_4_0, CoD.StatsGroup.Common).round.scoreXp:get() or 0
end

function AAR.GetRoundMedalXP(arg_5_0)
	return PlayerData.BFFBGAJGD(arg_5_0, CoD.StatsGroup.Common).round.medalXp:get() or 0
end

function AAR.GetRoundChallengeXP(arg_6_0)
	return PlayerData.BFFBGAJGD(arg_6_0, CoD.StatsGroup.Common).round.challengeXp:get() or 0
end

function AAR.GetRoundMatchXPBonus(arg_7_0)
	return PlayerData.BFFBGAJGD(arg_7_0, CoD.StatsGroup.Common).round.matchBonusXp:get() + AAR.GetRoundScoreXP(arg_7_0) + AAR.GetRoundMedalXP(arg_7_0) + AAR.GetRoundMiscXP(arg_7_0) or 0
end

function AAR.IsAttachmentUnlockType(arg_8_0)
	return arg_8_0 == AAR.UnlockTypes.ASSAULTATTACH or arg_8_0 == AAR.UnlockTypes.DMRATTACH or arg_8_0 == AAR.UnlockTypes.LMGATTACH or arg_8_0 == AAR.UnlockTypes.MELEEATTACH or arg_8_0 == AAR.UnlockTypes.PISTOLATTACH or arg_8_0 == AAR.UnlockTypes.PROJECTILEATTACH or arg_8_0 == AAR.UnlockTypes.SHOTGUNATTACH or arg_8_0 == AAR.UnlockTypes.SMGATTACH or arg_8_0 == AAR.UnlockTypes.SNIPERATTACH or arg_8_0 == AAR.UnlockTypes.CLASSICATTACH
end

function AAR.GetRoundDoubleXP(arg_9_0)
	return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.Common).common_entitlement_xp:get() or 0
end

function AAR.GetRoundClanXP(arg_10_0)
	return PlayerData.BFFBGAJGD(arg_10_0, CoD.StatsGroup.Common).common_clan_wars_xp:get() or 0
end

function AAR.GetTotalUnlockPoints(arg_11_0)
	return 0 or 0
end

function AAR.GetRoundTotalXP(arg_12_0)
	return PlayerData.BFFBGAJGD(arg_12_0, CoD.StatsGroup.Common).round.totalXp:get() or 0
end

function AAR.GetNumAwards(arg_13_0)
	return PlayerData.BFFBGAJGD(arg_13_0, CoD.StatsGroup.Common).round.awardCount:get()
end

function AAR.GetAccolade(arg_14_0, arg_14_1)
	return PlayerData.BFFBGAJGD(arg_14_0, CoD.StatsGroup.Common).round.awards[arg_14_1].award:get()
end

function AAR.GetAwardIcon(arg_15_0)
	return StringTable.DIFCHIGDFB(AwardsTable.File, AwardsTable.Cols.Ref, arg_15_0, AwardsTable.Cols.Icon)
end

function AAR.GetAwardName(arg_16_0)
	return StringTable.DIFCHIGDFB(AwardsTable.File, AwardsTable.Cols.Ref, arg_16_0, AwardsTable.Cols.Name)
end

function AAR.GetAwardDesc(arg_17_0)
	return StringTable.DIFCHIGDFB(AwardsTable.File, AwardsTable.Cols.Ref, arg_17_0, AwardsTable.Cols.Desc)
end

function AAR.AreChaosStats(arg_18_0)
	if not Engine.EAIICIFIFA() then
		return false
	end

	if arg_18_0 == "mugger" then
		return true
	else
		return false
	end
end

function AAR.shouldShowRepair()
	return false
end

function AAR.IsFFAMatch(arg_20_0)
	return PlayerData.BFFBGAJGD(arg_20_0, CoD.StatsGroup.Common).round.scoreboardType:get() == "neutral"
end

function AAR.IsDisplayingAARParade(arg_21_0)
	if arg_21_0 then
		if CONDITIONS.IsCoreMultiplayer() and not IsPrivateMatch() and not IsSystemLink() then
			return true
		elseif CONDITIONS.IsThirdGameMode() and not IsSystemLink() then
			return true
		elseif CONDITIONS.IsTrialGameType() then
			return true
		end
	end

	return false
end

function AAR.GetUnlockTypeName(arg_22_0)
	return AAR.UnlockDataTable[arg_22_0].Name
end

function AAR.GetUnlockTypeFile(arg_23_0)
	return AAR.UnlockDataTable[arg_23_0].File
end

function AAR.GetGunsmithUnlockData(arg_24_0)
	local var_24_0 = LOOT.itemTypes.ATTACHMENT
	local var_24_1 = AAR.UnlockDataTable[var_24_0].Name
	local var_24_2 = ""
	local var_24_3 = "white"
	local var_24_4
	local var_24_5 = LOOT.GetLootItemRelatedWeapon(arg_24_0, var_24_0)
	local var_24_6 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_24_5, CSV.weaponIDs.cols.baseRef)
	local var_24_7 = ATTACHMENT.GetRefByID(var_24_5, arg_24_0)
	local var_24_8 = LOOT.GetItemName(var_24_0, var_24_7)
	local var_24_9 = LOOT.GetItemProgressionImage(var_24_0, var_24_7)
	local var_24_10 = PROGRESSION.GetLootUnlockWeaponLevel(var_24_6, arg_24_0)

	return {
		unlocked = true,
		name = var_24_8,
		icon = var_24_9,
		lootRef = var_24_7,
		lootType = var_24_0,
		lootTypeName = var_24_1,
		unlockWeaponLevel = var_24_10,
		weaponRef = var_24_6,
		lootID = arg_24_0
	}
end

function AAR.GetUnlockData(arg_25_0, arg_25_1)
	if arg_25_1 == nil or tonumber(arg_25_1) == 0 then
		return nil
	end

	local var_25_0 = LOOT.GetTypeForID(arg_25_1)

	if var_25_0 == nil or not LOOT.IsValidItemType(var_25_0) then
		return nil
	end

	if var_25_0 == LOOT.itemTypes.ATTACHMENT then
		return AAR.GetGunsmithUnlockData(arg_25_1)
	elseif var_25_0 == LOOT.itemTypes.CAMO then
		-- block empty
	end

	local var_25_1 = ""
	local var_25_2 = ""
	local var_25_3 = ""
	local var_25_4 = "white"
	local var_25_5 = LOOT.GetItemRef(var_25_0, arg_25_1)
	local var_25_6 = LOOT.GetItemName(var_25_0, var_25_5)
	local var_25_7 = LOOT.GetItemProgressionImage(var_25_0, var_25_5)
	local var_25_8 = LOOT.GetItemClassName(var_25_0, var_25_5)

	if var_25_0 == LOOT.itemTypes.WEAPON then
		var_25_6 = WEAPON.GetLootWeaponName(var_25_5, arg_25_1)
	end

	local var_25_9 = PROGRESSION.IsUnlocked(arg_25_0, var_25_0, var_25_5)
	local var_25_10 = PROGRESSION.GetUnlockRank(arg_25_1)
	local var_25_11 = 0

	if not var_25_10 then
		return nil
	end

	return {
		name = var_25_6,
		icon = var_25_7,
		lootType = var_25_0,
		lootTypeName = var_25_8,
		unlocked = var_25_9,
		unlockRank = var_25_10,
		lootID = arg_25_1
	}
end

function AAR.IsRankupUnlock(arg_26_0)
	return PROGRESSION.GetUnlockRank(arg_26_0) >= 0
end

function AAR.GetUnlockIDTableAtRank(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_2 then
		local var_27_0 = PROGRESSION.GetPlayerRank(arg_27_0)
		local var_27_1 = {}

		for iter_27_0 = CSV.progressionItems.cols.firstItem, CSV.progressionItems.cols.lastItem do
			local var_27_2 = tonumber(StringTable.DIFCHIGDFB(CSV.progressionItems.file, CSV.progressionItems.cols.rank, arg_27_1, iter_27_0))

			if var_27_2 then
				table.insert(var_27_1, var_27_2)
			end
		end

		return var_27_1
	else
		local var_27_3 = PROGRESSION.GetCurrentSeasonProgressionFile()
		local var_27_4 = arg_27_1 - PROGRESSION.GetMaxRank()
		local var_27_5 = tonumber(StringTable.DIFCHIGDFB(var_27_3, CSV.elderProgressionTable.cols.rank, var_27_4, CSV.elderProgressionTable.cols.lootID))

		return {
			var_27_5
		}
	end
end

function AAR.GetNextRankUnlockID(arg_28_0)
	if not PROGRESSION.IsElder(arg_28_0) then
		local var_28_0 = PROGRESSION.GetPlayerRank(arg_28_0)

		if var_28_0 + 1 <= PROGRESSION.GetMaxRank() then
			return tonumber(StringTable.DIFCHIGDFB(CSV.progressionItems.file, CSV.progressionItems.cols.rank, var_28_0 + 1, CSV.progressionItems.cols.firstItem))
		end
	end

	local var_28_1 = PROGRESSION.GetCurrentSeasonProgressionFile()

	if PROGRESSION.GetPlayerRank(arg_28_0) == PROGRESSION.GetMaxRank() then
		local var_28_2 = 1

		return tonumber(StringTable.DIFCHIGDFB(var_28_1, CSV.elderProgressionTable.cols.rank, var_28_2, CSV.elderProgressionTable.cols.lootID))
	else
		local var_28_3 = PROGRESSION.GetPlayerRank(arg_28_0) - PROGRESSION.GetMaxRank()
		local var_28_4 = tonumber(StringTable.DIFCHIGDFB(var_28_1, CSV.elderProgressionTable.cols.rank, var_28_3 + 1, CSV.elderProgressionTable.cols.lootID))

		while var_28_4 == nil and var_28_3 + 1 <= PROGRESSION.GetMaxElderRank() do
			var_28_3 = var_28_3 + 1
			var_28_4 = tonumber(StringTable.DIFCHIGDFB(var_28_1, CSV.elderProgressionTable.cols.rank, var_28_3 + 1, CSV.elderProgressionTable.cols.lootID))
		end

		return var_28_4
	end
end

function AAR.GetNewUnlocksTable(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = PROGRESSION.IsPlayerLifeTimeRankMax(arg_29_1)
	local var_29_1 = PROGRESSION.IsPlayerLifeTimeXPMax(arg_29_1)
	local var_29_2 = PROGRESSION.GetPlayerLifeTimeMaxRankLootID()
	local var_29_3 = {}

	if #arg_29_2 > 0 then
		local var_29_4 = #arg_29_2

		for iter_29_0 = 1, var_29_4 do
			local var_29_5 = tonumber(arg_29_2[iter_29_0].ID)

			if var_29_5 and not PROGRESSION.IsProgressionTracker(var_29_5) and not BATTLEPASS.IsTierUnlock(var_29_5) then
				local var_29_6 = LOOT.GetTypeForID(var_29_5)
				local var_29_7 = var_29_5 and var_29_5 >= LOOT.CamoIDsMin and var_29_5 <= LOOT.CamoIDsMax

				if var_29_6 and var_29_6 ~= LOOT.itemTypes.INVALID and var_29_6 ~= LOOT.itemTypes.ATTACHMENT and not var_29_7 then
					local var_29_8 = LOOT.GetItemRef(var_29_6, var_29_5)
					local var_29_9 = LOOT.GetItemQuality(var_29_6, var_29_8) or 0
					local var_29_10 = 0

					if (var_29_0 or var_29_1) and var_29_2 and #var_29_2 > 0 then
						var_29_10 = var_29_5 == tonumber(var_29_2) and 1 or 0
					end

					table.insert(var_29_3, {
						ID = var_29_5,
						rarity = var_29_9,
						isMaxRankUnlockItem = var_29_10
					})
				elseif var_29_6 then
					DebugPrint("Invalid unlocks ID" .. var_29_5 .. ". We should not have unlocks of type " .. var_29_6)
				else
					DebugPrint("Invalid unlocks ID" .. var_29_5 .. ".The loot type is not supported")
				end
			end
		end
	end

	table.sort(var_29_3, function(arg_30_0, arg_30_1)
		if arg_30_0.isMaxRankUnlockItem > arg_30_1.isMaxRankUnlockItem then
			return true
		else
			return arg_30_0.rarity > arg_30_1.rarity
		end
	end)

	return var_29_3
end

function AAR.GetRankupUnlockPackage(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = arg_31_1 > PROGRESSION.GetMaxRank()
	local var_31_2 = AAR.GetUnlockIDTableAtRank(arg_31_0, arg_31_1, var_31_1)

	for iter_31_0 = 1, #var_31_2 do
		local var_31_3 = tonumber(var_31_2[iter_31_0])

		if var_31_3 and not PROGRESSION.IsProgressionTracker(var_31_3) then
			local var_31_4 = LOOT.GetTypeForID(var_31_3)

			if var_31_4 and var_31_4 ~= LOOT.itemTypes.INVALID then
				local var_31_5 = AAR.GetUnlockData(arg_31_0, var_31_3)

				if var_31_5 then
					local var_31_6 = var_31_5.name and #var_31_5.name > 0
					local var_31_7 = var_31_5.lootTypeName and #var_31_5.lootTypeName > 0
					local var_31_8 = var_31_5.icon and #var_31_5.icon > 0

					if var_31_6 and var_31_7 and var_31_8 then
						table.insert(var_31_0, var_31_5)
					end
				end
			end
		end
	end

	return var_31_0
end

function AAR.PrestreamImagePackage(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4)
	local var_32_0 = {}

	if arg_32_2 and #arg_32_2 > 0 then
		local var_32_1 = #arg_32_2

		for iter_32_0 = 1, var_32_1 do
			local var_32_2 = tonumber(arg_32_2[iter_32_0].ID)

			if not PROGRESSION.IsProgressionTracker(var_32_2) then
				local var_32_3 = LOOT.GetTypeForID(var_32_2)

				if var_32_3 and var_32_3 ~= LOOT.itemTypes.INVALID then
					local var_32_4 = AAR.GetUnlockData(arg_32_1, var_32_2)

					if var_32_4 and var_32_4.icon and #var_32_4.icon > 0 then
						table.insert(var_32_0, RegisterMaterial(var_32_4.icon))
					end
				end
			end
		end
	end

	if arg_32_3 and #arg_32_3 > 0 then
		for iter_32_1 = 1, #arg_32_3 do
			local var_32_5 = arg_32_3[iter_32_1].weaponRef
			local var_32_6 = LOOT.GetItemProgressionImage(LOOT.itemTypes.WEAPON, var_32_5)

			table.insert(var_32_0, RegisterMaterial(var_32_6))
		end
	end

	local var_32_7 = PROGRESSION.GetPlayerRank(arg_32_1)
	local var_32_8 = PROGRESSION.IsElderRank(var_32_7)
	local var_32_9 = AAR.GetUnlockIDTableAtRank(arg_32_1, var_32_7, var_32_8)

	for iter_32_2 = 1, #var_32_9 do
		local var_32_10 = var_32_9[iter_32_2]

		if not PROGRESSION.IsProgressionTracker(var_32_10) then
			local var_32_11 = LOOT.GetTypeForID(var_32_10)

			if var_32_11 and var_32_11 ~= LOOT.itemTypes.INVALID then
				local var_32_12 = AAR.GetUnlockData(arg_32_1, var_32_10)

				if var_32_12 and var_32_12.icon and #var_32_12.icon > 0 then
					table.insert(var_32_0, RegisterMaterial(var_32_12.icon))
				end
			end
		end
	end

	local var_32_13 = AAR.GetNextRankUnlockID(arg_32_1)

	if var_32_13 then
		local var_32_14 = AAR.GetUnlockData(arg_32_1, var_32_13)

		if var_32_14 and var_32_14.icon and #var_32_14.icon > 0 then
			table.insert(var_32_0, RegisterMaterial(var_32_14.icon))
		end
	end

	for iter_32_3, iter_32_4 in ipairs(arg_32_4) do
		table.insert(var_32_0, RegisterMaterial(iter_32_4.image))
	end

	arg_32_0.streamer = LUI.UIElement.new()
	arg_32_0.streamer.id = "aar_images_streamer"

	arg_32_0:addElement(arg_32_0.streamer)
	arg_32_0.streamer:SetupImageTableStreamer(var_32_0, false)
end

function AAR.CreateUnlockItemByType(arg_33_0, arg_33_1)
	if arg_33_1 then
		local var_33_0 = MenuBuilder.BuildRegisteredType(AAR.GetUnlockTypeFile(arg_33_1), {
			controllerIndex = arg_33_0
		})

		var_33_0.id = "UnlockItem"

		return var_33_0
	end

	return nil
end

function AAR.IsBestStatsData(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = PlayerData.BFFBGAJGD(arg_34_0, CoD.StatsGroup.Ranked)

	if arg_34_1 == "kills" then
		return arg_34_2 > var_34_0.bestScores.kills:get()
	elseif arg_34_1 == "kdRatio" then
		return arg_34_2 > var_34_0.bestKD.score:get()
	elseif arg_34_1 == "score" then
		return arg_34_2 > var_34_0.bestScores.score:get()
	elseif arg_34_1 == "scorePerMin" then
		return arg_34_2 > var_34_0.bestSPM.score:get()
	elseif var_34_0.bestScores[arg_34_1] then
		return arg_34_2 > var_34_0.bestScores[arg_34_1]:get()
	end

	return false
end

function AAR.FormatStatsData(arg_35_0, arg_35_1)
	if arg_35_0 == "kdRatio" then
		return string.format("%.2f", arg_35_1 / 1000)
	end

	return tostring(arg_35_1)
end

function AAR.GetStatsInfoPackage(arg_36_0)
	local var_36_0 = PostMatch.BDHAIHIEBE(arg_36_0)

	if var_36_0 == nil then
		return {
			{
				Value = 0,
				Icon = "icon_scoreboard_score",
				Name = AAR.INVALID_STATS_NAME
			},
			{
				Value = 0,
				Icon = "icon_scoreboard_score",
				Name = AAR.INVALID_STATS_NAME
			},
			{
				Value = 0,
				Icon = "icon_scoreboard_score",
				Name = AAR.INVALID_STATS_NAME
			},
			{
				Value = 0,
				Icon = "icon_scoreboard_score",
				Name = AAR.INVALID_STATS_NAME
			},
			{
				Value = 0,
				Icon = "icon_scoreboard_score",
				Name = AAR.INVALID_STATS_NAME
			},
			{
				Value = 0,
				Icon = "icon_scoreboard_score",
				Name = AAR.INVALID_STATS_NAME
			}
		}
	end

	local var_36_1 = SCOREBOARD.GetGameModeFieldName(arg_36_0, 1)
	local var_36_2 = SCOREBOARD.GetGameModeFieldName(arg_36_0, 2)
	local var_36_3 = SCOREBOARD.GetGameModeFieldName(arg_36_0, 3)
	local var_36_4 = SCOREBOARD.GetGameModeFieldName(arg_36_0, 4)
	local var_36_5 = var_36_1 ~= "" and SCOREBOARD.GetColReferenceName(var_36_1) or INVALID_STATS_NAME
	local var_36_6 = var_36_2 ~= "" and SCOREBOARD.GetColReferenceName(var_36_2) or INVALID_STATS_NAME
	local var_36_7 = var_36_3 ~= "" and SCOREBOARD.GetColReferenceName(var_36_3) or INVALID_STATS_NAME
	local var_36_8 = var_36_4 ~= "" and SCOREBOARD.GetColReferenceName(var_36_4) or INVALID_STATS_NAME
	local var_36_9 = var_36_0[var_36_1]
	local var_36_10 = var_36_0[var_36_2]
	local var_36_11 = var_36_0[var_36_3] or var_36_0.extraScore0
	local var_36_12 = var_36_0[var_36_4] or var_36_0.extraScore1
	local var_36_13 = PlayerData.BFFBGAJGD(arg_36_0, CoD.StatsGroup.Ranked)
	local var_36_14 = var_36_13.bestScores.score:get()
	local var_36_15 = var_36_13.bestSPM.score:get()
	local var_36_16 = var_36_13.bestScores.kills:get()
	local var_36_17 = var_36_13.bestKD.score:get()

	return {
		{
			Name = "LUA_MENU/SCORE",
			Icon = "icon_scoreboard_score",
			Value = AAR.FormatStatsData("score", var_36_0.score),
			isPersonalBest = AAR.IsBestStatsData(arg_36_0, "score", var_36_0.score)
		},
		{
			Name = "LUA_MENU_MP/SPM",
			Icon = "icon_scoreboard_score",
			Value = AAR.FormatStatsData("scorePerMin", var_36_0.scorePerMin),
			isPersonalBest = AAR.IsBestStatsData(arg_36_0, "scorePerMin", var_36_0.scorePerMin)
		},
		{
			Name = var_36_5,
			Value = AAR.FormatStatsData(var_36_1, var_36_9),
			Icon = SCOREBOARD.GetColReferenceIcon(var_36_1),
			isPersonalBest = AAR.IsBestStatsData(arg_36_0, var_36_1, var_36_9)
		},
		{
			Name = var_36_6,
			Value = AAR.FormatStatsData(var_36_2, var_36_10),
			Icon = SCOREBOARD.GetColReferenceIcon(var_36_2),
			isPersonalBest = AAR.IsBestStatsData(arg_36_0, var_36_2, var_36_10)
		},
		{
			Name = var_36_7,
			Value = AAR.FormatStatsData(var_36_3, var_36_11),
			Icon = SCOREBOARD.GetColReferenceIcon(var_36_3),
			isPersonalBest = AAR.IsBestStatsData(arg_36_0, var_36_3, var_36_11)
		},
		{
			Name = var_36_8,
			Value = AAR.FormatStatsData(var_36_4, var_36_12),
			Icon = SCOREBOARD.GetColReferenceIcon(var_36_4),
			isPersonalBest = AAR.IsBestStatsData(arg_36_0, var_36_4, var_36_12)
		}
	}
end

AAR.MAX_NUM_AAR_CONTRACT_DATA_CHUNKS = 4

function AAR.BrUpdatePlayerTeamContractNum(arg_37_0, arg_37_1)
	if AAR.IsScoreboardDataValid(arg_37_0) and arg_37_1 then
		for iter_37_0, iter_37_1 in pairs(arg_37_1) do
			local var_37_0 = 16
			local var_37_1 = 4
			local var_37_2 = 1
			local var_37_3 = 0

			iter_37_1.missions = 0

			for iter_37_2 = 0, AAR.MAX_NUM_AAR_CONTRACT_DATA_CHUNKS - 1 do
				if var_37_0 < var_37_2 then
					var_37_2 = 1
					var_37_3 = var_37_3 + 1
				end

				var_37_2 = var_37_2 + var_37_1

				local var_37_4 = MP.ExtractBitsFromBitPositionInValue(iter_37_1["extraScore" .. var_37_3], var_37_1, var_37_2)

				iter_37_1.missions = iter_37_1.missions + var_37_4
				var_37_2 = var_37_2 + var_37_1
			end
		end
	end

	return arg_37_1
end

function AAR.BrGetContractStatsForController(arg_38_0)
	local var_38_0 = {
		contract3NumCompleted = 0,
		contract2NumCompleted = 0,
		contract1NumCompleted = 0,
		totalContractXp = 0,
		contract0Id = 0,
		contract1Id = 0,
		contract2Id = 0,
		contract3Id = 0,
		totalCompleted = 0,
		contract0NumCompleted = 0
	}
	local var_38_1 = Teams.free

	if AAR.IsDebugAARSummaryEnabled() then
		var_38_0.contract0NumCompleted = MP.ExtractBitsFromBitPositionInValue(4386, 4, 1)

		local var_38_2 = MP.ExtractBitsFromBitPositionInValue(4386, 4, 1)

		var_38_0.contract0Id = var_38_2
		var_38_0.totalCompleted = var_38_2
		var_38_0.totalContractXp = 12500

		return var_38_0
	end

	if AAR.IsScoreboardDataValid(arg_38_0) then
		var_38_0.totalCompleted = 0

		local var_38_3 = var_38_1
		local var_38_4 = PostMatch.DGCJIFGJBD(arg_38_0, var_38_3)

		if var_38_4 then
			for iter_38_0, iter_38_1 in pairs(var_38_4) do
				if iter_38_1 and iter_38_1.isMe then
					local var_38_5 = 16
					local var_38_6 = 4
					local var_38_7 = 1
					local var_38_8 = 0

					for iter_38_2 = 0, AAR.MAX_NUM_AAR_CONTRACT_DATA_CHUNKS - 1 do
						if var_38_5 < var_38_7 then
							var_38_7 = 1
							var_38_8 = var_38_8 + 1
						end

						local var_38_9 = MP.ExtractBitsFromBitPositionInValue(iter_38_1["extraScore" .. var_38_8], var_38_6, var_38_7)

						var_38_0["contract" .. iter_38_2 .. "Id"] = var_38_9
						var_38_7 = var_38_7 + var_38_6

						local var_38_10 = MP.ExtractBitsFromBitPositionInValue(iter_38_1["extraScore" .. var_38_8], var_38_6, var_38_7)

						var_38_0.totalCompleted = var_38_0.totalCompleted + var_38_10
						var_38_0["contract" .. iter_38_2 .. "NumCompleted"] = var_38_10
						var_38_7 = var_38_7 + var_38_6
					end

					var_38_0.totalContractXp = iter_38_1.extraScore2

					break
				end
			end
		end
	end

	return var_38_0
end

function AAR.IsCommendtionEnabled()
	return Dvar.IBEGCHEFE("LSQMOSORKS")
end

function AAR.GetCommendationPackage(arg_40_0)
	return {}
end

function AAR.IsCommendationPackageAvailable(arg_41_0)
	local var_41_0 = AAR.GetCommendationPackage(arg_41_0)

	return var_41_0 ~= nil and #var_41_0 > 0
end

function AAR.IsAnyValidChallengeAvailable(arg_42_0, arg_42_1)
	for iter_42_0 = 1, #arg_42_0 do
		local var_42_0 = arg_42_0[iter_42_0].type
		local var_42_1 = var_42_0 <= Challenge.Type.MAX_NUM and var_42_0 >= Challenge.Type.MIN_NUM
		local var_42_2 = Challenge.GetFileTableByType(var_42_0)
		local var_42_3 = Challenge.GetRef(arg_42_0[iter_42_0].ID, arg_42_0[iter_42_0].type)

		if var_42_1 and var_42_2 and var_42_3 and #var_42_3 > 0 then
			return true
		end
	end

	for iter_42_1 = 1, #arg_42_1 do
		local var_42_4 = arg_42_1[iter_42_1].ID

		if var_42_4 and var_42_4 >= LOOT.CamoIDsMin and var_42_4 <= LOOT.CamoIDsMax then
			return true
		end
	end

	return false
end

function AAR.ProcessStickerBookChallengeLoot(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = split(arg_43_3, "|")

	if #var_43_0 > 1 then
		local var_43_1 = Challenge.GetAmount(arg_43_1, arg_43_2)
		local var_43_2 = split(var_43_1, "|")
		local var_43_3 = StickerBookChallenges.CJBJIFGJHG(arg_43_0, arg_43_1).Challenges.UnlockProgress
		local var_43_4 = #var_43_2

		if tonumber(var_43_3) == tonumber(var_43_2[var_43_4]) then
			arg_43_3 = var_43_0[var_43_4]

			local var_43_5 = var_43_2[var_43_4]

			return arg_43_3, var_43_5
		else
			for iter_43_0 = 1, var_43_4 - 1 do
				if tonumber(var_43_3) >= tonumber(var_43_2[iter_43_0]) and tonumber(var_43_3) < tonumber(var_43_2[iter_43_0 + 1]) then
					arg_43_3 = var_43_0[iter_43_0]

					local var_43_6 = var_43_2[iter_43_0]

					return arg_43_3, var_43_6
				end
			end
		end
	end

	return arg_43_3, nil
end

function AAR.ProcessStickerBookChallengeXPReward(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = split(arg_44_3, "|")

	if #var_44_0 > 1 then
		local var_44_1 = Challenge.GetAmount(arg_44_1, arg_44_2)
		local var_44_2 = split(var_44_1, "|")
		local var_44_3 = StickerBookChallenges.CJBJIFGJHG(arg_44_0, arg_44_1).Challenges.UnlockProgress
		local var_44_4 = #var_44_2

		if tonumber(var_44_3) == tonumber(var_44_2[var_44_4]) then
			arg_44_3 = var_44_0[var_44_4]
		else
			for iter_44_0 = 1, var_44_4 - 1 do
				if tonumber(var_44_3) >= tonumber(var_44_2[iter_44_0]) and tonumber(var_44_3) < tonumber(var_44_2[iter_44_0 + 1]) then
					arg_44_3 = var_44_0[iter_44_0]

					break
				end
			end
		end
	end

	return arg_44_3
end

function AAR.GetChallengesPackage(arg_45_0, arg_45_1)
	local var_45_0 = {}
	local var_45_1 = {}

	for iter_45_0 = 1, #arg_45_1 do
		local var_45_2 = arg_45_1[iter_45_0].ID

		if CONDITIONS.IsDevelopmentBuild() then
			DebugPrint("\n AAR challenge ID: " .. tostring(var_45_2))
		end

		if var_45_1[var_45_2] then
			var_45_1[var_45_2].completedNum = var_45_1[var_45_2].completedNum + 1
		else
			local var_45_3 = arg_45_1[iter_45_0].type
			local var_45_4 = Challenge.GetRef(var_45_2, var_45_3)

			if var_45_4 and #var_45_4 > 0 then
				local var_45_5 = Challenge.GetName(var_45_2, var_45_3)
				local var_45_6 = Challenge.GetDesc(var_45_2, var_45_3)
				local var_45_7 = Challenge.GetAmount(var_45_2, var_45_3)
				local var_45_8
				local var_45_9
				local var_45_10
				local var_45_11
				local var_45_12
				local var_45_13
				local var_45_14
				local var_45_15 = true
				local var_45_16 = false
				local var_45_17
				local var_45_18 = Challenge.GetLootID(var_45_2, var_45_3)

				if var_45_18 == nil or #var_45_18 == 0 then
					var_45_15 = false
				elseif Challenge.IsGunsmithCamoChallenge(var_45_2, var_45_3) then
					var_45_16 = true

					local var_45_19 = GUNSMITH.GetGunsmithChallengeCamoCategory(var_45_2, var_45_3)
					local var_45_20 = GUNSMITH.GetGunsmithChallengeRelatedWeaponID(var_45_2, var_45_3)

					var_45_17 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_45_20, CSV.weaponIDs.cols.baseRef)
					var_45_6 = StringTable.DIFCHIGDFB(CSV.camoCategoryTable.file, CSV.camoCategoryTable.cols.ref, var_45_19, CSV.camoCategoryTable.cols.name)
				else
					if var_45_3 == Challenge.Type.STICKER_BOOK then
						var_45_18, var_45_7 = AAR.ProcessStickerBookChallengeLoot(arg_45_0, var_45_2, var_45_3, var_45_18)
					end

					var_45_8 = LOOT.GetTypeForID(var_45_18)

					if var_45_8 == LOOT.itemTypes.ATTACHMENT then
						local var_45_21 = LOOT.GetLootItemRelatedWeapon(var_45_18, LOOT.itemTypes.ATTACHMENT)
						local var_45_22 = WEAPON.GetVariantBaseRef(var_45_21)

						var_45_9 = ATTACHMENT.GetRefByID(var_45_21, var_45_18)
					else
						var_45_9 = LOOT.GetItemRef(var_45_8, var_45_18)
					end

					if var_45_8 == LOOT.itemTypes.WEAPON then
						var_45_14 = WEAPON.GetLootWeaponName(var_45_9, var_45_18)
						var_45_13 = WEAPON.GetLootVariantImage(var_45_9, var_45_18)
					elseif var_45_8 == LOOT.itemTypes.ATTACHMENT then
						var_45_14 = ATTACHMENT.GetName(var_45_9)
						var_45_13 = ATTACHMENT.GetImage(var_45_9)
					else
						var_45_14 = LOOT.GetItemName(var_45_8, var_45_9)
						var_45_13 = LOOT.GetItemImage(var_45_8, var_45_9, var_45_18)
					end

					var_45_10 = LOOT.GetItemQuality(var_45_8, var_45_9) or 0
					var_45_11 = LOOT.GetRarityImage(var_45_10)
					var_45_12 = LOOT.GetRarityColor(var_45_10)
				end

				local var_45_23
				local var_45_24
				local var_45_25

				if var_45_16 then
					var_45_25 = false
				else
					var_45_23 = Challenge.GetXPReward(var_45_2, var_45_3)

					if var_45_3 == Challenge.Type.STICKER_BOOK then
						var_45_23 = AAR.ProcessStickerBookChallengeXPReward(arg_45_0, var_45_2, var_45_3, var_45_23)
					end

					var_45_23 = tonumber(var_45_23)
					var_45_25 = var_45_23 > 0
				end

				local var_45_26 = {
					completedNum = 1,
					ID = var_45_2,
					ref = var_45_4,
					name = var_45_5,
					desc = var_45_6,
					type = var_45_3,
					amount = var_45_7,
					isGunsmithCamoChallenge = var_45_16,
					gunsmithCamoIDTable = split(var_45_18, "|"),
					gunsmithCamoWeaponRef = var_45_17,
					lootReward = {
						isValid = var_45_15,
						ref = var_45_9,
						type = var_45_8,
						name = var_45_14,
						image = var_45_13,
						rarity = var_45_10,
						rarityImage = var_45_11,
						rarityColor = var_45_12
					},
					xpReward = {
						type = "xp",
						image = "icon_xp_token",
						isValid = var_45_25,
						name = var_45_23,
						rarityImage = LOOT.GetRarityImage(1),
						rarityColor = LOOT.GetRarityColor(1)
					}
				}

				if not var_45_16 then
					var_45_1[var_45_2] = var_45_26
				end
			end
		end
	end

	for iter_45_1, iter_45_2 in pairs(var_45_1) do
		table.insert(var_45_0, iter_45_2)
	end

	return var_45_0
end

function AAR.GetChallengeWidgetNameByType(arg_46_0)
	if arg_46_0 == Challenge.Type.BR then
		return "AARChallengeItemStandard"
	elseif arg_46_0 == Challenge.Type.GUNSMITH then
		return "AARChallengeItemStandard"
	elseif arg_46_0 == Challenge.Type.ELDER then
		return "AARChallengeItemStandard"
	elseif arg_46_0 == Challenge.Type.OPERATOR_UNLOCK then
		return "AARChallengeItemStandard"
	elseif arg_46_0 == Challenge.Type.COMMUNITY then
		return "AARChallengeItemStandard"
	elseif arg_46_0 == Challenge.Type.WEEKLY then
		return "AARChallengeItemStandard"
	elseif arg_46_0 == Challenge.Type.DAILY then
		return "AARChallengeItemStandard"
	end

	return nil
end

function AAR.CreateChallengeItemByType(arg_47_0, arg_47_1)
	if arg_47_1 then
		local var_47_0 = AAR.GetChallengeWidgetNameByType(arg_47_1)

		if var_47_0 and #var_47_0 > 0 then
			local var_47_1 = MenuBuilder.BuildRegisteredType(var_47_0, {
				controllerIndex = arg_47_0
			})

			var_47_1.id = "challengeItem"

			return var_47_1
		end
	end

	return nil
end

function AAR.GetCamoUnlocksPackage(arg_48_0)
	local var_48_0 = {}

	for iter_48_0 = 1, #arg_48_0 do
		local var_48_1 = arg_48_0[iter_48_0].ID

		if var_48_1 and var_48_1 >= LOOT.CamoIDsMin and var_48_1 <= LOOT.CamoIDsMax then
			local var_48_2 = LOOT.GetLootItemRelatedWeapon(var_48_1, LOOT.itemTypes.CAMO)
			local var_48_3 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_48_2, CSV.weaponIDs.cols.baseRef)
			local var_48_4 = WEAPON.GetName(var_48_3)
			local var_48_5 = WEAPON.GetProgressionImage(var_48_3)
			local var_48_6
			local var_48_7 = var_48_4
			local var_48_8 = false
			local var_48_9 = false
			local var_48_10 = false
			local var_48_11 = LOOT.GetItemRef(LOOT.itemTypes.CAMO, var_48_1, {
				weaponRef = var_48_3
			})

			if var_48_11 and #var_48_11 > 0 then
				local var_48_12 = StringTable.BJJBBCJGEJ(CSV.camoTable.file, CSV.camoTable.cols.ref, var_48_11)
				local var_48_13 = CSV.ReadRow(CSV.camoTable, var_48_12)
				local var_48_14 = StringTable.BFHCAIIDA(CSV.gunsmithChallenges.file)

				for iter_48_1 = 0, var_48_14 - 1 do
					if var_48_9 then
						break
					end

					local var_48_15 = CSV.ReadRow(CSV.gunsmithChallenges, iter_48_1)
					local var_48_16 = var_48_15.loot

					if var_48_16 and #var_48_16 > 0 then
						local var_48_17 = split(var_48_16, "|")

						for iter_48_2 = 1, #var_48_17 do
							if tostring(var_48_1) == var_48_17[iter_48_2] then
								var_48_9 = true
								var_48_7 = Engine.CBBHFCGDIC(var_48_15.desc)

								local var_48_18 = var_48_15.id
								local var_48_19 = var_48_15.amount

								if var_48_19 and #var_48_19 > 0 then
									local var_48_20 = split(var_48_19, "|")[iter_48_2]

									var_48_7 = Engine.CBBHFCGDIC(var_48_15.desc, var_48_20, var_48_15.detailDesc)
								end

								if string.find(var_48_15.ref, "_gold_") then
									var_48_10 = true
								end

								break
							end
						end
					end
				end

				if not var_48_9 then
					local var_48_21 = {}
					local var_48_22 = CSV.gunsmithProgressionTable
					local var_48_23 = var_48_22:GetFile(var_48_3)
					local var_48_24 = WEAPON.GetName(var_48_3)
					local var_48_25 = StringTable.BFHCAIIDA(var_48_23)

					for iter_48_3 = 0, var_48_25 - 1 do
						if var_48_8 then
							break
						end

						local var_48_26 = CSV.ReadRowWithFileAndColumns(var_48_23, iter_48_3, {
							ID = var_48_22.cols.lootID,
							level = var_48_22.cols.level
						})
						local var_48_27 = var_48_26.level
						local var_48_28 = 1

						while var_48_26.ID and #var_48_26.ID > 0 do
							if var_48_26.ID == tostring(var_48_1) then
								var_48_8 = true
								var_48_7 = Engine.CBBHFCGDIC("AAR/WEAPON_REACH_RANK", var_48_24, var_48_27)

								break
							end

							local var_48_29 = var_48_22.colOffset * var_48_28
							local var_48_30 = {
								ID = var_48_22.cols.lootID + var_48_29
							}

							var_48_28 = var_48_28 + 1
							var_48_26 = CSV.ReadRowWithFileAndColumns(var_48_23, iter_48_3, var_48_30)
							var_48_26.level = var_48_27
						end
					end
				end

				if var_48_8 or var_48_9 then
					local var_48_31 = WEAPON.GetCamoRef(var_48_1)
					local var_48_32 = LOOT.GetItemQuality(LOOT.itemTypes.CAMO, var_48_31) or 0
					local var_48_33 = LOOT.GetRarityImage(var_48_32)
					local var_48_34 = LOOT.GetRarityColor(var_48_32)
					local var_48_35 = {
						isCamo = true,
						isGoldCamo = var_48_10,
						type = Challenge.Type.GUNSMITH,
						name = Engine.CBBHFCGDIC("AAR/CAMO_CHALLENGE"),
						desc = var_48_7,
						weaponIcon = var_48_5,
						lootReward = {
							isValid = true,
							ref = challengeLootRef,
							type = LOOT.itemTypes.CAMO,
							name = Engine.CBBHFCGDIC(var_48_13.name),
							image = var_48_13.image,
							rarity = var_48_32,
							rarityImage = var_48_33,
							rarityColor = var_48_34
						},
						xpReward = {
							isValid = false,
							name = "",
							rarityColor = "",
							type = "xp",
							image = "icon_xp_token",
							rarityImage = ""
						}
					}

					table.insert(var_48_0, var_48_35)
				end
			end
		end
	end

	return var_48_0
end

function AAR.GetMatchInfoPackage(arg_49_0)
	local var_49_0 = OnlineAAR.BIJEDCBCBH(arg_49_0)
	local var_49_1 = AAR.ParsePlayerProgressionXPData(arg_49_0, var_49_0.StartXP, var_49_0.CurrentXP, var_49_0.StartSeasonXP, var_49_0.CurrentSeasonXP)

	var_49_0.ContractXP = 0

	if CONDITIONS.IsMagmaGameMode() then
		local var_49_2 = AAR.BrGetContractStatsForController(arg_49_0)

		if var_49_2 and var_49_2.totalContractXp then
			var_49_0.ContractXP = tonumber(var_49_2.totalContractXp) or 0
		end
	end

	local var_49_3 = {
		startXP = var_49_0.StartXP,
		currentXP = var_49_0.CurrentXP,
		startSeasonXP = var_49_0.StartSeasonXP,
		currentSeasonXP = var_49_0.CurrentSeasonXP,
		startTierXP = var_49_0.StartBattlepassXP,
		currentTierXP = var_49_0.CurrentBattlepassXP,
		battlepassTimeXP = var_49_0.BattlepassTimeXP,
		battlepassChallengeXP = var_49_0.BattlepassChallengeXP,
		startLevelXP = var_49_0.StartLevelXP,
		currentLevelXP = var_49_0.CurrentLevelXP,
		startLevel = var_49_0.StartLevel,
		currentLevel = var_49_0.CurrentLevel,
		startKeys = var_49_0.StartKeys,
		currentKeys = var_49_0.CurrentKeys,
		startCommonCrate = var_49_0.StartCommonCrate,
		currentCommonCrate = var_49_0.CurrentCommonCrate,
		startCPpoints = var_49_0.StartCPpoints,
		currentCPpoints = var_49_0.CurrentCPpoints,
		challengeBonus = var_49_0.ChallengeXP,
		missionXP = var_49_0.MissionXP,
		plunderBonus = var_49_0.PlunderXP or 0,
		matchXP = var_49_0.CurrentXP - var_49_0.StartXP + (var_49_0.CurrentSeasonXP - var_49_0.StartSeasonXP) - var_49_0.ChallengeXP - var_49_0.MissionXP - var_49_0.PlunderXP - var_49_0.ContractXP,
		earnedXP = var_49_0.CurrentXP - var_49_0.StartXP,
		earnedSeasonXP = var_49_0.CurrentSeasonXP - var_49_0.StartSeasonXP,
		contractBonus = var_49_0.ContractXP or 0,
		challenges = var_49_0.Challenges,
		unlocks = var_49_0.Unlocks,
		rank = PROGRESSION.GetPlayerRank(arg_49_0),
		prestige = PROGRESSION.GetPlayerPrestige(arg_49_0),
		preRank = var_49_1.preRank,
		curRank = var_49_1.curRank,
		preSeasonRank = var_49_1.preSeasonRank,
		curSeasonRank = var_49_1.curSeasonRank,
		isElder = var_49_1.isElder,
		isElderFirstTime = var_49_1.isElderFirstTime,
		isGainingElderXP = var_49_1.isGainingElderXP
	}

	if AAR.IsDebugBattlePassEnabled() then
		local var_49_4 = Dvar.CFHDGABACF("NPQKMMLMRS")

		var_49_3.startTierXP = BATTLEPASS.GetXP(arg_49_0)
		var_49_3.currentTierXP = BATTLEPASS.GetXP(arg_49_0) + var_49_4
	end

	var_49_3.matchXP = math.max(var_49_3.matchXP, 0)

	return var_49_3
end

function AAR.ResetMatchData(arg_50_0)
	OnlineAAR.DBIGAJIAFG(arg_50_0)
end

function AAR.GetGunsmithUnlockPackage(arg_51_0, arg_51_1)
	local var_51_0 = {}

	if arg_51_1 == nil or #arg_51_1 == 0 then
		return var_51_0
	end

	local var_51_1 = #arg_51_1

	for iter_51_0 = 1, var_51_1 do
		local var_51_2 = arg_51_1[iter_51_0].ID

		if not PROGRESSION.IsProgressionTracker(var_51_2) then
			local var_51_3 = LOOT.GetTypeForID(var_51_2)

			if var_51_3 and var_51_3 ~= LOOT.itemTypes.INVALID and var_51_3 == LOOT.itemTypes.ATTACHMENT then
				local var_51_4 = AAR.GetUnlockData(arg_51_0, var_51_2)
				local var_51_5 = true

				for iter_51_1 = 1, #var_51_0 do
					if var_51_0[iter_51_1].weaponRef == var_51_4.weaponRef then
						var_51_5 = false

						table.insert(var_51_0[iter_51_1].attachmentsData, var_51_4)

						break
					end
				end

				if var_51_5 then
					var_51_0[#var_51_0 + 1] = {
						weaponRef = var_51_4.weaponRef,
						attachmentsData = {
							var_51_4
						}
					}
				end
			end
		end
	end

	return var_51_0
end

function AAR.GetGunsmithCamoUnlockPackage(arg_52_0, arg_52_1)
	local var_52_0 = {}

	if arg_52_1 == nil or #arg_52_1 == 0 then
		return var_52_0
	end

	local var_52_1 = #arg_52_1

	for iter_52_0 = 1, var_52_1 do
		local var_52_2 = arg_52_1[iter_52_0].ID

		if not PROGRESSION.IsProgressionTracker(var_52_2) and var_52_2 and var_52_2 >= LOOT.CamoIDsMin and var_52_2 <= LOOT.CamoIDsMax then
			local var_52_3 = LOOT.GetLootItemRelatedWeapon(var_52_2, LOOT.itemTypes.CAMO)
			local var_52_4 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_52_3, CSV.weaponIDs.cols.baseRef)
			local var_52_5 = LOOT.GetItemRef(LOOT.itemTypes.CAMO, var_52_2, {
				weaponRef = var_52_4
			})
			local var_52_6 = StringTable.BJJBBCJGEJ(CSV.camoTable.file, CSV.camoTable.cols.ref, var_52_5)
			local var_52_7 = CSV.ReadRow(CSV.camoTable, var_52_6)
			local var_52_8 = {
				weaponRef = var_52_4,
				icon = var_52_7.image,
				name = Engine.CBBHFCGDIC(var_52_7.name)
			}
			local var_52_9 = true

			for iter_52_1 = 1, #var_52_0 do
				if var_52_0[iter_52_1].weaponRef == var_52_8.weaponRef then
					var_52_9 = false

					table.insert(var_52_0[iter_52_1].camoData, var_52_8)

					break
				end
			end

			if var_52_9 then
				var_52_0[#var_52_0 + 1] = {
					weaponRef = var_52_8.weaponRef,
					camoData = {
						var_52_8
					}
				}
			end
		end
	end

	return var_52_0
end

function AAR.ParsePlayerProgressionXPData(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
	local var_53_0 = false
	local var_53_1 = false
	local var_53_2 = false

	if PROGRESSION.IsElder(arg_53_0) then
		var_53_0 = true
	end

	if var_53_0 and arg_53_1 < PROGRESSION.GetRankMaxXP(PROGRESSION.GetMaxRank()) then
		var_53_1 = true
	end

	if var_53_0 and arg_53_1 == arg_53_2 and arg_53_2 == PROGRESSION.GetRankMaxXP(PROGRESSION.GetMaxRank()) then
		var_53_2 = true
	end

	local var_53_3 = PROGRESSION.GetRankByXP(arg_53_1)
	local var_53_4 = PROGRESSION.GetRankByXP(arg_53_2)
	local var_53_5 = PROGRESSION.GetElderRankByXP(arg_53_3)
	local var_53_6 = PROGRESSION.GetElderRankByXP(arg_53_4)

	return {
		isElder = var_53_0,
		isElderFirstTime = var_53_1,
		isGainingElderXP = var_53_2,
		preRank = var_53_3,
		curRank = var_53_4,
		preSeasonRank = var_53_5,
		curSeasonRank = var_53_6
	}
end

function AAR.IsBRFrontendScoreboardAvailable()
	if CONDITIONS.InFrontend() then
		local var_54_0 = AAR.IsBRTDMClientMatchDataAvailable()

		return (CONDITIONS.IsBRGameType() or CONDITIONS.IsBloodMoney()) and not var_54_0
	end

	return false
end

function AAR.IsContractTabAvailable()
	if CONDITIONS.InFrontend() then
		return CONDITIONS.IsMagmaGameMode() and not AAR.IsBRTDMClientMatchDataAvailable()
	end

	return false
end

function AAR.IsBRTDMClientMatchDataAvailable()
	if CONDITIONS.IsThirdGameMode() then
		return false
	end

	return Dvar.CFHDGABACF("NMPNSQNNRQ") == AAR.MagmaSummaryState.BR_TDM_SUMMARY_READY
end

function AAR.IsBRMatchDataAvailable()
	if Dvar.CFHDGABACF("NMPNSQNNRQ") == AAR.MagmaSummaryState.BR_SUMMARY_READY and CONDITIONS.IsMagmaGameMode() and not CONDITIONS.IsBloodMoney() and not CONDITIONS.IsRiskGametype() then
		return true
	end

	return false
end

function AAR.IsPublicMatchClientDataAvailable()
	local var_58_0 = Engine.EAIADADAIH("isPublicMatch")

	if Engine.EAIICIFIFA() then
		return Engine.JCFIBGGJB(AAR.ClientMatchData.CP) and var_58_0
	else
		return Engine.JCFIBGGJB(AAR.ClientMatchData.MP) and var_58_0
	end
end

function AAR.IsPrivateMatchClientDataAvailable()
	local var_59_0 = not Engine.EAIADADAIH("isPublicMatch")

	if Engine.EAIICIFIFA() then
		return Engine.JCFIBGGJB(AAR.ClientMatchData.CP) and var_59_0
	else
		return Engine.JCFIBGGJB(AAR.ClientMatchData.MP) and var_59_0
	end
end

function AAR.IsMatchClientDataAvailable()
	local var_60_0 = Dvar.CFHDGABACF("NMPNSQNNRQ")
	local var_60_1 = AAR.IsPublicMatchClientDataAvailable() or AAR.IsPrivateMatchClientDataAvailable()
	local var_60_2 = var_60_0 == AAR.MagmaSummaryState.BR_SUMMARY_READY
	local var_60_3 = var_60_0 == AAR.MagmaSummaryState.BM_SUMMARY_READY
	local var_60_4 = var_60_0 == AAR.MagmaSummaryState.BR_TDM_SUMMARY_READY

	if CONDITIONS.IsMagmaGameMode() then
		if CONDITIONS.IsBRTDMGameType() then
			return var_60_4 and var_60_1
		elseif CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() then
			return var_60_3 and var_60_1
		else
			local var_60_5 = var_60_1 and var_60_2
			local var_60_6 = var_60_1 and var_60_3
			local var_60_7 = var_60_1 and var_60_4
			local var_60_8 = Engine.DBFFAEEFGJ().flowManager:GetStackTop(false)

			if not (var_60_8 and (var_60_8.name == "BRMainMenu" or var_60_8.name == "leave_public_mp_lobby" or var_60_8.name == "leave_private_mp_lobby")) then
				return var_60_1 and var_60_2
			end

			return var_60_5 or var_60_6 or var_60_7
		end
	elseif CONDITIONS.IsThirdGameMode() then
		if var_60_3 or var_60_2 or var_60_4 then
			return false
		end

		return var_60_1
	else
		if var_60_3 or var_60_2 then
			return false
		end

		if CONDITIONS.IsBRTDMGameType() then
			return var_60_4 and var_60_1
		end

		return var_60_1
	end

	return false
end

function AAR.IsAnyNonXPParadeAvailable(arg_61_0)
	local var_61_0 = AAR.GetMatchInfoPackage(arg_61_0)
	local var_61_1 = AAR.GetGunsmithCamoUnlockPackage(arg_61_0, var_61_0.unlocks)
	local var_61_2 = AAR.GetAccoladesPackage(arg_61_0)
	local var_61_3 = #AAR.GetGunsmithUnlockPackage(arg_61_0, var_61_0.unlocks) > 0
	local var_61_4 = #var_61_1 > 0
	local var_61_5 = CONDITIONS.AreKeysEnabled() and var_61_0.currentKeys - var_61_0.startKeys >= AAR.KEY_UNIT_CURRENCY
	local var_61_6 = AAR.IsCommendtionEnabled() and var_61_2 and #var_61_2 > 0

	return var_61_3 or var_61_4 or var_61_5 or var_61_6
end

function AAR.GetBattlePassTierBreakdown(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_1.startTierXP
	local var_62_1 = arg_62_1.currentTierXP - var_62_0
	local var_62_2 = SCOREBOARD.GetColumnNames(arg_62_0)
	local var_62_3 = SCOREBOARD.GetMaxColumn(arg_62_0)
	local var_62_4 = AAR.BattlePassBonusTypes.SKILL_BONUS1
	local var_62_5 = {}
	local var_62_6 = 0
	local var_62_7 = arg_62_1.battlepassTimeXP
	local var_62_8 = arg_62_1.battlepassChallengeXP
	local var_62_9

	if not AAR.IsDebugBattlePassEnabled() then
		local var_62_10 = CONDITIONS.IsCoreMultiplayer() and DataSources.frontEnd.AAR.scoreboard.numPlayersTeamA or CONDITIONS.IsThirdGameMode() and DataSources.frontEnd.AAR.scoreboard.numCPPlayers or nil

		if var_62_10 then
			local var_62_11 = var_62_10:GetValue(arg_62_0)
			local var_62_12 = PostMatch.DGCJIFGJBD(arg_62_0, var_62_11)

			for iter_62_0 = 0, #var_62_12 do
				if var_62_12[iter_62_0] and var_62_12[iter_62_0].isMe then
					var_62_9 = var_62_12[iter_62_0]
				end
			end
		end
	end

	for iter_62_1 = 1, var_62_3 do
		local var_62_13 = var_62_2[iter_62_1]

		if StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, var_62_13, CSV.gameStats.cols.enabledInAAR) == "1" then
			local var_62_14 = SCOREBOARD.GetGameModeFieldName(arg_62_0, iter_62_1)

			if var_62_14 and (var_62_9 and tonumber(var_62_9[var_62_14]) > 0 or true) then
				local var_62_15 = StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, var_62_13, CSV.gameStats.cols.AARName)
				local var_62_16 = StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, var_62_13, CSV.gameStats.cols.AARIcon)

				if var_62_4 <= AAR.BattlePassBonusTypes.SKILL_BONUS5 then
					var_62_5[var_62_4] = {
						value = 0,
						name = Engine.CBBHFCGDIC(var_62_15),
						icon = var_62_16
					}
					var_62_4 = var_62_4 + 1
					var_62_6 = var_62_6 + 1
				end
			end
		end
	end

	local var_62_17 = (var_62_1 - var_62_7 - var_62_8) / 2
	local var_62_18 = var_62_6 > 0 and var_62_17 / var_62_6 or 0
	local var_62_19 = LOOT.IsDoubleBattlePassXPActive()
	local var_62_20 = {
		[AAR.BattlePassBonusTypes.TIME_BONUS] = {
			sound = SOUND_SETS.aarBattlePass.timeBonus,
			icon = BATTLEPASS.IsOwned(arg_62_0) and "battlepass_emblem_gold" or "battlepass_emblem_silver",
			name = Engine.CBBHFCGDIC("BATTLEPASS/TIME_BONUS"),
			value = var_62_7
		},
		[AAR.BattlePassBonusTypes.SKILL_BONUS1] = {
			value = 0,
			icon = "",
			name = "",
			sound = SOUND_SETS.aarBattlePass.matchBonus
		},
		[AAR.BattlePassBonusTypes.SKILL_BONUS2] = {
			value = 0,
			icon = "",
			name = "",
			sound = SOUND_SETS.aarBattlePass.matchBonus
		},
		[AAR.BattlePassBonusTypes.SKILL_BONUS3] = {
			value = 0,
			icon = "",
			name = "",
			sound = SOUND_SETS.aarBattlePass.matchBonus
		},
		[AAR.BattlePassBonusTypes.SKILL_BONUS4] = {
			value = 0,
			icon = "",
			name = "",
			sound = SOUND_SETS.aarBattlePass.matchBonus
		},
		[AAR.BattlePassBonusTypes.SKILL_BONUS5] = {
			value = 0,
			icon = "",
			name = "",
			sound = SOUND_SETS.aarBattlePass.matchBonus
		},
		[AAR.BattlePassBonusTypes.MATCH_BONUS] = {
			icon = "icon_commendation_kills_enemy_team",
			sound = SOUND_SETS.aarBattlePass.matchBonus,
			name = Engine.CBBHFCGDIC("BATTLEPASS/MATCH_BONUS"),
			value = var_62_19 and var_62_17 / 2 or var_62_17
		},
		[AAR.BattlePassBonusTypes.MATCH_BONUS_DOUBLE] = {
			icon = "icon_double_battle_xp",
			sound = SOUND_SETS.aarBattlePass.matchBonus,
			name = Engine.CBBHFCGDIC("BATTLEPASS/MATCH_DOUBLE_BONUS"),
			value = var_62_19 and var_62_17 / 2 or 0
		},
		[AAR.BattlePassBonusTypes.CHALLENGE_BONUS] = {
			icon = "icon_challenge_generic",
			sound = SOUND_SETS.aarBattlePass.challengeBonus,
			name = Engine.CBBHFCGDIC("BATTLEPASS/CHALLENGE_BONUS"),
			value = var_62_8,
			color = SWATCHES.Global.keyColor
		}
	}

	for iter_62_2 = AAR.BattlePassBonusTypes.SKILL_BONUS1, AAR.BattlePassBonusTypes.SKILL_BONUS1 + var_62_6 - 1 do
		var_62_20[iter_62_2].icon = var_62_5[iter_62_2].icon
		var_62_20[iter_62_2].name = var_62_5[iter_62_2].name
		var_62_20[iter_62_2].value = var_62_18
	end

	return var_62_20
end

function AAR.GetAccoladesPackage(arg_63_0, arg_63_1)
	local var_63_0 = CSV.accolades
	local var_63_1 = {}
	local var_63_2

	if arg_63_1 then
		var_63_2 = PlayerData.BFFBGAJGD(arg_63_0, CoD.StatsGroup.Ranked).playerStats.accoladeStats
	else
		var_63_2 = PlayerData.BFFBGAJGD(arg_63_0, CoD.StatsGroup.Ranked).playerStats.matchAccolades
	end

	local var_63_3 = StringTable.BFHCAIIDA(var_63_0.file)

	for iter_63_0 = 1, var_63_3 - 1 do
		local var_63_4 = StringTable.CBGJCDIHCE(var_63_0.file, iter_63_0, var_63_0.cols.ref)

		if var_63_2[var_63_4] then
			local var_63_5 = var_63_2[var_63_4]:get()

			if var_63_5 and var_63_5 > 0 then
				local var_63_6 = {
					ref = var_63_4,
					num = var_63_5,
					priority = StringTable.CBGJCDIHCE(var_63_0.file, iter_63_0, var_63_0.cols.priority),
					name = StringTable.CBGJCDIHCE(var_63_0.file, iter_63_0, var_63_0.cols.name),
					desc = StringTable.CBGJCDIHCE(var_63_0.file, iter_63_0, var_63_0.cols.desc),
					image = StringTable.CBGJCDIHCE(var_63_0.file, iter_63_0, var_63_0.cols.image)
				}

				table.insert(var_63_1, var_63_6)
			end
		else
			DebugPrint("Warning: Missing accolade ref: " .. var_63_4)
		end
	end

	if arg_63_1 then
		table.sort(var_63_1, function(arg_64_0, arg_64_1)
			return arg_64_0.num > arg_64_1.num
		end)
	else
		table.sort(var_63_1, function(arg_65_0, arg_65_1)
			return arg_65_0.priority > arg_65_1.priority
		end)
	end

	return var_63_1
end

function AAR.GetDebugAccoladesPackage()
	return {
		{
			priority = 32,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_kills_ads",
			ref = "adsKills",
			num = 3,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 31,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_kills_hipfire",
			ref = "hipfireKills",
			num = 5,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 33,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_kills_lower_ranked",
			ref = "lowerRankedKills",
			num = 7,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 34,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_kills_higher_ranked",
			ref = "higherRankedKills",
			num = 9,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 150,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_headshots",
			ref = "headshots",
			num = 11,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 32,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_longest_life",
			ref = "longestLife",
			num = 3,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 149,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_longest_streak",
			ref = "longestStreak",
			num = 13,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 33,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_most_kills",
			ref = "mostKills",
			num = 15,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 34,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_most_kills_least_deaths",
			ref = "mostKillsLeastDeaths",
			num = 16,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 150,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_headshots",
			ref = "highestRankedKills",
			num = 17,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 32,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_suicides",
			ref = "suicides",
			num = 3,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 31,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_reloads",
			ref = "reloads",
			num = 18,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 33,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_pickups_weapon",
			ref = "weaponPickups",
			num = 19,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 34,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_shots_fired",
			ref = "shotsFired",
			num = 20,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 150,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_class_changes",
			ref = "classChanges",
			num = 21,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 32,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_time_killcams",
			ref = "timeWatchingKillcams",
			num = 3,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 31,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_revives",
			ref = "revives",
			num = 22,
			desc = "MP_ACCOLADES_TODO_DESC"
		},
		{
			priority = 33,
			name = "MP_ACCOLADES_TODO",
			image = "icon_commendation_kills_one_shot",
			ref = "oneShotOneKills",
			num = 23,
			desc = "MP_ACCOLADES_TODO_DESC"
		}
	}
end

function AAR.GetDebugMatchInfoPackage()
	local var_67_0 = {
		plunderBonus = 0,
		startKeys = 8741,
		startLevelXP = 0,
		contractBonus = 0,
		startXP = 958899,
		earnedSeasonXP = 25773,
		curSeasonRank = 1,
		startLevel = 0,
		isGainingElderXP = false,
		currentCPpoints = 528,
		preRank = 54,
		currentXP = 960000,
		currentLevelXP = 0,
		preSeasonRank = 1,
		currentCommonCrate = 0,
		earnedXP = 1101,
		prestige = 0,
		startCommonCrate = 0,
		startSeasonXP = 0,
		isElder = true,
		missionXP = 0,
		battlepassChallengeXP = 4500,
		isElderFirstTime = true,
		startTierXP = 16200000,
		curRank = 54,
		challengeBonus = 4500,
		currentLevel = 0,
		battlepassTimeXP = 34965,
		currentTierXP = 16200000,
		startCPpoints = 528,
		currentKeys = 9190,
		rank = 55,
		currentSeasonXP = 25773,
		challenges = {
			{
				ID = 1501,
				type = 15
			},
			{
				ID = 2000020,
				type = 5
			}
		},
		unlocks = {
			{
				ID = 714
			}
		}
	}

	var_67_0.matchXP = var_67_0.currentXP - var_67_0.startXP + (var_67_0.currentSeasonXP - var_67_0.startSeasonXP) - var_67_0.challengeBonus - var_67_0.missionXP - var_67_0.plunderBonus - var_67_0.contractBonus

	return var_67_0
end

function AAR.GetDebugMatchInfoPackageString(arg_68_0)
	local var_68_0 = AAR.GetMatchInfoPackage(arg_68_0)

	return " startXP " .. tostring(var_68_0.startXP) .. " \n currentXP " .. tostring(var_68_0.currentXP) .. " \n startSeasonXP " .. tostring(var_68_0.startSeasonXP) .. " \n currentSeasonXP " .. tostring(var_68_0.currentSeasonXP) .. " \n startTierXP " .. tostring(var_68_0.startTierXP) .. " \n currentTierXP " .. tostring(var_68_0.currentTierXP) .. " \n battlepassTimeXP " .. tostring(var_68_0.battlepassTimeXP) .. " \n battlepassChallengeXP " .. tostring(var_68_0.battlepassChallengeXP) .. " \n startLevelXP " .. tostring(var_68_0.startLevelXP) .. " \n currentLevelXP " .. tostring(var_68_0.currentLevelXP) .. " \n startLevel " .. tostring(var_68_0.startLevel) .. " \n currentLevel " .. tostring(var_68_0.currentLevel) .. " \n startKeys " .. tostring(var_68_0.startKeys) .. " \n currentKeys " .. tostring(var_68_0.currentKeys) .. " \n startCommonCrate " .. tostring(var_68_0.startCommonCrate) .. " \n currentCommonCrate " .. tostring(var_68_0.currentCommonCrate) .. " \n startCPpoints " .. tostring(var_68_0.startCPpoints) .. " \n currentCPpoints " .. tostring(var_68_0.currentCPpoints) .. " \n challengeBonus " .. tostring(var_68_0.challengeBonus) .. " \n missionXP " .. tostring(var_68_0.missionXP) .. " \n plunderBonus " .. tostring(var_68_0.plunderBonus) .. " \n matchXP " .. tostring(var_68_0.matchXP) .. " \n earnedXP " .. tostring(var_68_0.earnedXP) .. " \n earnedSeasonXP " .. tostring(var_68_0.earnedSeasonXP) .. " \n contractBonus " .. tostring(var_68_0.contractBonus) .. " \n rank " .. tostring(var_68_0.rank) .. " \n prestige " .. tostring(var_68_0.prestige) .. " \n preRank " .. tostring(var_68_0.preRank) .. " \n curRank " .. tostring(var_68_0.curRank) .. " \n preSeasonRank " .. tostring(var_68_0.preSeasonRank) .. " \n curSeasonRank " .. tostring(var_68_0.curSeasonRank) .. " \n isElder " .. tostring(var_68_0.isElder) .. " \n isElderFirstTime " .. tostring(var_68_0.isElderFirstTime) .. " \n isGainingElderXP " .. tostring(var_68_0.isGainingElderXP)
end

function AAR.GetDebugCommendationPackage(arg_69_0)
	return {
		{
			value = 10,
			name = "10 Killstreak",
			icon = "icon_scoreboard_kills"
		},
		{
			value = 5,
			name = "Avenger",
			icon = "icon_scoreboard_deaths"
		},
		{
			value = 3,
			name = "Burnout",
			icon = "icon_scoreboard_revives"
		}
	}
end

function AAR.GetDebugChallengesPackage(arg_70_0)
	local var_70_0 = {}
	local var_70_1 = StringTable.BFHCAIIDA(CSV.questChallenges.file)

	for iter_70_0 = 0, var_70_1 - 1 do
		local var_70_2 = CSV.ReadRow(CSV.questChallenges, iter_70_0)
	end

	local var_70_3 = StringTable.BFHCAIIDA(CSV.gunChallenges.file)

	for iter_70_1 = 0, var_70_3 - 1 do
		local var_70_4 = CSV.ReadRow(CSV.gunChallenges, iter_70_1)
	end

	table.insert(var_70_0, {
		ID = 10180,
		type = Challenge.Type.MISSION
	})
	table.insert(var_70_0, {
		ID = 10181,
		type = Challenge.Type.MISSION
	})
	table.insert(var_70_0, {
		ID = 10182,
		type = Challenge.Type.MISSION
	})
	table.insert(var_70_0, {
		ID = 10183,
		type = Challenge.Type.MISSION
	})
	table.insert(var_70_0, {
		ID = 10150,
		type = Challenge.Type.MISSION
	})
	table.insert(var_70_0, {
		ID = 10149,
		type = Challenge.Type.MISSION
	})
	table.insert(var_70_0, {
		ID = 520,
		type = Challenge.Type.GUNSMITH
	})
	table.insert(var_70_0, {
		ID = 1320,
		type = Challenge.Type.GUNSMITH
	})
	table.insert(var_70_0, {
		ID = 3083,
		type = Challenge.Type.GUNSMITH
	})

	return AAR.GetChallengesPackage(arg_70_0, var_70_0)
end

function AAR.GetDebugGunsmithUnlockPackage()
	local var_71_0 = {
		{
			ID = 1016017
		},
		{
			ID = 1017017
		},
		{
			ID = 1017004
		},
		{
			ID = 1017034
		},
		{
			ID = 1018017
		},
		{
			ID = 1018004
		},
		{
			ID = 1019017
		},
		{
			ID = 1015017
		},
		{
			ID = 1015004
		},
		{
			ID = 1015034
		},
		{
			ID = 1020017
		},
		{
			ID = 1011017
		},
		{
			ID = 1011004
		},
		{
			ID = 1021017
		},
		{
			ID = 1021004
		},
		{
			ID = 1021034
		},
		{
			ID = 1022017
		},
		{
			ID = 1022004
		}
	}

	return AAR.GetGunsmithUnlockPackage(0, var_71_0)
end

function AAR.IsDebugAARSummaryEnabled()
	if CONDITIONS.IsDevelopmentBuild() then
		return Dvar.IBEGCHEFE("NNKNPMORKR")
	end

	return false
end

function AAR.IsDebugBattlePassEnabled()
	if CONDITIONS.IsDevelopmentBuild() then
		return Dvar.IBEGCHEFE("NSSKNKRKNP")
	end

	return false
end

function AAR.IsScoreboardDataValid(arg_74_0)
	local var_74_0 = false
	local var_74_1 = Engine.EAIADADAIH("scoreboardPlayerCount")
	local var_74_2 = var_74_1 and var_74_1 > 0

	if AAR.IsBRTDMClientMatchDataAvailable() and CONDITIONS.IsCoreMultiplayer() then
		local var_74_3 = PostMatch.DGCJIFGJBD(arg_74_0, Teams.allies)
		local var_74_4 = PostMatch.DGCJIFGJBD(arg_74_0, Teams.axis)
		local var_74_5 = DataSources.frontEnd.AAR.friendlyScore:GetValue(arg_74_0)
		local var_74_6 = DataSources.frontEnd.AAR.enemyScore:GetValue(arg_74_0)

		var_74_0 = var_74_2 and var_74_3 and var_74_4 and var_74_5 and var_74_5 >= 0 and var_74_6 and var_74_6 >= 0
	elseif CONDITIONS.IsMagmaGameMode() then
		var_74_0 = var_74_2

		local var_74_7 = PostMatch.DGCJIFGJBD(arg_74_0, Teams.free)

		var_74_0 = var_74_0 and (var_74_7 and #var_74_7 > 0 or false)
	elseif AAR.IsFFAMatch(arg_74_0) then
		local var_74_8 = PostMatch.DGCJIFGJBD(arg_74_0, Teams.free)

		var_74_0 = var_74_2 and var_74_8
	elseif CONDITIONS.IsCoreMultiplayer() then
		local var_74_9 = PostMatch.DGCJIFGJBD(arg_74_0, Teams.allies)
		local var_74_10 = PostMatch.DGCJIFGJBD(arg_74_0, Teams.axis)
		local var_74_11 = DataSources.frontEnd.AAR.friendlyScore:GetValue(arg_74_0)
		local var_74_12 = DataSources.frontEnd.AAR.enemyScore:GetValue(arg_74_0)

		var_74_0 = var_74_2 and var_74_9 and var_74_10 and var_74_11 and var_74_11 >= 0 and var_74_12 and var_74_12 >= 0
	elseif CONDITIONS.IsThirdGameMode() then
		var_74_0 = var_74_2
	end

	return var_74_0
end

function AAR.GetBloodMoneyXPPackage(arg_75_0)
	local var_75_0 = {}
	local var_75_1 = PlayerData.BFFBGAJGD(arg_75_0, CoD.StatsGroup.Ranked).aarValue

	if var_75_1 then
		local var_75_2 = 0

		for iter_75_0 = 1, AAR.BRXPType.MAX_NUM - 1 do
			local var_75_3 = AAR.BRXPTable[iter_75_0]
			local var_75_4 = {
				name = var_75_3.name,
				summaryNameKey = var_75_3.summaryNameKey
			}
			local var_75_5 = var_75_1[iter_75_0 - 1]:get()

			if var_75_5 > 0 then
				var_75_2 = var_75_2 + var_75_5
				var_75_4.value = var_75_5

				table.insert(var_75_0, var_75_4)

				if CONDITIONS.IsDevelopmentBuild() then
					local var_75_6 = "\n BR InGame AAR Data - name: " .. tostring(var_75_4.name) .. " Value: " .. tostring(var_75_4.value)

					DebugPrint(var_75_6)
				end
			end
		end

		local var_75_7 = AAR.BRXPTable[AAR.BRXPType.MAX_NUM]
		local var_75_8 = {
			name = var_75_7.name,
			summaryNameKey = var_75_7.summaryNameKey
		}
		local var_75_9 = var_75_1[BR_FINAL_XP_INDEX]:get()
		local var_75_10 = var_75_1[BR_INIT_XP_INDEX]:get()

		var_75_8.value = var_75_9 - var_75_10 - var_75_2
		var_75_8.value = var_75_8.value > 0 and var_75_8.value or 0

		table.insert(var_75_0, 1, var_75_8)

		if CONDITIONS.IsDevelopmentBuild() then
			local var_75_11 = "\n BR InGame AAR Data ( misc ) - name: " .. tostring(var_75_8.name) .. " Value: " .. tostring(var_75_8.value) .. "\n final xp: " .. tostring(var_75_9) .. " initXP: " .. tostring(var_75_10)

			DebugPrint(var_75_11)
		end
	end

	return var_75_0
end

function AAR.GetDebugBloodMoneyXPPackage(arg_76_0)
	local var_76_0 = {}
	local var_76_1 = PlayerData.BFFBGAJGD(arg_76_0, CoD.StatsGroup.Ranked).aarValue
	local var_76_2 = AAR.GetDebugBRMatchPackage()
	local var_76_3 = (var_76_2.earnedXP + var_76_2.earnedSeasonXP) / AAR.BRXPType.MAX_NUM

	for iter_76_0 = 1, AAR.BRXPType.MAX_NUM do
		local var_76_4 = AAR.BRXPTable[iter_76_0]
		local var_76_5 = {
			name = var_76_4.name,
			summaryNameKey = var_76_4.summaryNameKey
		}
		local var_76_6 = var_76_3

		if var_76_6 > 0 then
			var_76_5.value = var_76_6

			table.insert(var_76_0, var_76_5)
		end
	end

	return var_76_0
end

function AAR.GetBRMatchXPPackage(arg_77_0)
	local var_77_0 = {}
	local var_77_1 = PlayerData.BFFBGAJGD(arg_77_0, CoD.StatsGroup.Ranked).aarValue

	if var_77_1 then
		local var_77_2 = 0

		for iter_77_0 = 1, AAR.BRXPType.MAX_NUM - 1 do
			local var_77_3 = AAR.BRXPTable[iter_77_0]
			local var_77_4 = {
				name = var_77_3.name,
				summaryNameKey = var_77_3.summaryNameKey
			}
			local var_77_5 = var_77_1[iter_77_0 - 1]:get()

			if var_77_5 > 0 then
				var_77_2 = var_77_2 + var_77_5
				var_77_4.value = var_77_5

				table.insert(var_77_0, var_77_4)

				if CONDITIONS.IsDevelopmentBuild() then
					local var_77_6 = "\n BR InGame AAR Data - name: " .. tostring(var_77_4.name) .. " Value: " .. tostring(var_77_4.value)

					DebugPrint(var_77_6)
				end
			end
		end

		local var_77_7 = AAR.BRXPTable[AAR.BRXPType.MAX_NUM]
		local var_77_8 = {
			name = var_77_7.name,
			summaryNameKey = var_77_7.summaryNameKey
		}
		local var_77_9 = var_77_1[BR_FINAL_XP_INDEX]:get()
		local var_77_10 = var_77_1[BR_INIT_XP_INDEX]:get()

		var_77_8.value = var_77_9 - var_77_10 - var_77_2
		var_77_8.value = var_77_8.value > 0 and var_77_8.value or 0

		if CONDITIONS.IsDevelopmentBuild() then
			local var_77_11 = "\n BR InGame AAR Data ( misc ) - name: " .. tostring(var_77_8.name) .. " Value: " .. tostring(var_77_8.value) .. "\n final xp: " .. tostring(var_77_9) .. " initXP: " .. tostring(var_77_10)

			DebugPrint(var_77_11)
		end

		table.insert(var_77_0, 1, var_77_8)
	end

	return var_77_0
end

function AAR.GetDebugBRMatchPackage(arg_78_0)
	return {
		curRank = 54,
		currentTierXP = 67498,
		matchXP = 66753,
		startXP = 898247,
		isElder = true,
		curSeasonRank = 1,
		isElderFirstTime = true,
		startTierXP = 61213,
		preRank = 53,
		currentXP = 960000,
		challengeBonus = 0,
		preSeasonRank = 1,
		earnedXP = 61753,
		isGainingElderXP = false,
		earnedSeasonXP = 5000,
		rank = 55,
		currentSeasonXP = 5000
	}
end

function AAR.ShouldShowBattlePassPurchasePopup(arg_79_0)
	if BATTLEPASS.IsOwned(arg_79_0) then
		return false
	end

	local var_79_0 = AAR.GetMatchInfoPackage(arg_79_0)
	local var_79_1 = BATTLEPASS.GetTierByXP(arg_79_0, var_79_0.StartBattlepassXP)
	local var_79_2 = BATTLEPASS.GetTierByXP(arg_79_0, var_79_0.CurrentBattlepassXP)
	local var_79_3 = {}
	local var_79_4 = BATTLEPASS.GetTierByTotalCPRewards(BATTLEPASS.START_TO_SHOW_COD_POINTS)

	table.insert(var_79_3, var_79_4)

	local var_79_5 = tonumber(BATTLEPASS.GetItemCost(BATTLEPASS.GetPurchaseRef()))
	local var_79_6 = BATTLEPASS.GetTierByTotalCPRewards(var_79_5)

	table.insert(var_79_3, var_79_6)

	local var_79_7 = BATTLEPASS.GetMaxTier()

	table.insert(var_79_3, var_79_7)

	for iter_79_0, iter_79_1 in ipairs(var_79_3) do
		if var_79_1 < iter_79_1 and iter_79_1 <= var_79_2 then
			return true
		end
	end

	return false
end

function AAR.CheckAndShowBattlePassPurchasePopup(arg_80_0)
	if AAR.ShouldShowBattlePassPurchasePopup(arg_80_0) then
		local var_80_0 = LUI.FlowManager.GetScopedData("MainMenu")

		var_80_0.tabIndexToFocus = TAB.GetIndex(TAB.MP.BATTLE_PASS)
		var_80_0.showBattlePassPurchasePopup = true
	end
end
