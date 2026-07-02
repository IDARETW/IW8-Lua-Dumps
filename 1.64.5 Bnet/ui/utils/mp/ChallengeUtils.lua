Challenge = Challenge or {}
Challenge.MaxElderChallenges = 100
Challenge.numSummaryItems = 3
Challenge.DoVEventChallengeID1 = 9174
Challenge.DoVEventPlaylistID = 99
Challenge.Type = {
	ELDER = 6,
	SCHEDULED_RESET = 1,
	MISSION = 15,
	GUNSMITH_PROGRESSION = 36,
	HIDDEN = 28,
	BR_TUTORIAL = 29,
	SEASONAL_CHALLENGE = 42,
	PROGRESSION = 0,
	DAILY_CHURN_LOGIN = 21,
	NOT_USED1 = 3,
	TRIALS = 13,
	GAMES_OF_SUMMER = 33,
	MTX_CAMO = 24,
	BR = 4,
	DAILY = 12,
	BATTLEPASS_TIERSKIP = 43,
	OPERATOR_CHALLENGE = 41,
	COMMUNITY = 10,
	DAILY_LOGIN = 7,
	CLAN = 40,
	HAPPY_HOUR = 18,
	BATTLEPASS_PROGRESSION = 44,
	MAX_NUM = 46,
	WEAPON_MASTERY = 31,
	SP_REWARD = 17,
	MIN_NUM = 0,
	MISC = 34,
	BR_DAILY = 27,
	GUN_UNLOCK = 25,
	SEASON_REWARDS = 23,
	TOURNAMENT = 22,
	OPERATOR_PROGRESSION = 38,
	NOT_USED = 2,
	WEEKLY = 11,
	OPERATOR_MASTERY_CHALLENGE = 45,
	NO_TFA_LOGINS = 35,
	CP_REWARD = 19,
	BATTLEPASS = 20,
	GUNSMITH = 5,
	OPERATOR_UNLOCK = 8,
	CLAN_PROGRESSION = 39,
	CP_DAILY = 30,
	TOKENS = 14,
	STICKER_BOOK = 32,
	ELDER_PROGRESSION = 37,
	BR_WEEKLY = 26,
	KEY_EARNING = 9,
	RETICLE = 16
}
Challenge.DailyCategoryTypes = {
	SUPPORT = 2,
	COMBAT = 1,
	RECON = 3
}
Challenge.DailyCategoryData = {
	[Challenge.DailyCategoryTypes.COMBAT] = {
		icon = "ui_t9_shared_icon_logos_challenges_combat"
	},
	[Challenge.DailyCategoryTypes.SUPPORT] = {
		icon = "ui_t9_shared_icon_logos_challenges_support"
	},
	[Challenge.DailyCategoryTypes.RECON] = {
		icon = "ui_t9_shared_icon_logos_challenges_recon"
	}
}
Challenge.TypeNameTable = {
	[Challenge.Type.PROGRESSION] = "CHALLENGE/PROGRESSION",
	[Challenge.Type.SCHEDULED_RESET] = "",
	[Challenge.Type.NOT_USED] = "",
	[Challenge.Type.NOT_USED1] = "",
	[Challenge.Type.BR] = "CHALLENGE/BR",
	[Challenge.Type.GUNSMITH] = "CHALLENGE/GUNSMITH",
	[Challenge.Type.ELDER] = "CHALLENGE/ELDER",
	[Challenge.Type.DAILY_LOGIN] = "CHALLENGE/DAILY_LOGIN",
	[Challenge.Type.OPERATOR_UNLOCK] = "CHALLENGE/OPERATOR",
	[Challenge.Type.KEY_EARNING] = "CHALLENGE/KEY_EARNING",
	[Challenge.Type.COMMUNITY] = "CHALLENGE/COMMUNITY",
	[Challenge.Type.WEEKLY] = "CHALLENGE/WEEKLY",
	[Challenge.Type.DAILY] = "CHALLENGE/DAILY",
	[Challenge.Type.TRIALS] = "",
	[Challenge.Type.TOKENS] = "",
	[Challenge.Type.MISSION] = "CHALLENGE/MISSION",
	[Challenge.Type.RETICLE] = "CHALLENGE/RETICLE",
	[Challenge.Type.SP_REWARD] = "",
	[Challenge.Type.HAPPY_HOUR] = "",
	[Challenge.Type.CP_REWARD] = "",
	[Challenge.Type.BATTLEPASS] = "",
	[Challenge.Type.DAILY_CHURN_LOGIN] = "",
	[Challenge.Type.TOURNAMENT] = "",
	[Challenge.Type.SEASON_REWARDS] = "",
	[Challenge.Type.MTX_CAMO] = "",
	[Challenge.Type.GUN_UNLOCK] = "CHALLENGE/GUN_UNLOCK",
	[Challenge.Type.BR_WEEKLY] = "CHALLENGE/BR_WEEKLY",
	[Challenge.Type.BR_DAILY] = "CHALLENGE/BR_DAILY",
	[Challenge.Type.HIDDEN] = "",
	[Challenge.Type.BR_TUTORIAL] = "",
	[Challenge.Type.CP_DAILY] = "CHALLENGE/CP_DAILY",
	[Challenge.Type.WEAPON_MASTERY] = "",
	[Challenge.Type.STICKER_BOOK] = "CHALLENGE/MASTER",
	[Challenge.Type.GAMES_OF_SUMMER] = "",
	[Challenge.Type.MISC] = "CHALLENGE/MISCELLANEOUS",
	[Challenge.Type.NO_TFA_LOGINS] = "",
	[Challenge.Type.GUNSMITH_PROGRESSION] = "",
	[Challenge.Type.ELDER_PROGRESSION] = "",
	[Challenge.Type.OPERATOR_PROGRESSION] = "",
	[Challenge.Type.CLAN_PROGRESSION] = "",
	[Challenge.Type.CLAN] = "",
	[Challenge.Type.OPERATOR_CHALLENGE] = "",
	[Challenge.Type.SEASONAL_CHALLENGE] = "",
	[Challenge.Type.BATTLEPASS_TIERSKIP] = "",
	[Challenge.Type.BATTLEPASS_PROGRESSION] = "",
	[Challenge.Type.OPERATOR_MASTERY_CHALLENGE] = ""
}
Challenge.Reward = {
	XP = 1,
	LOOT = 2
}
Challenge.Difficulty = {
	HARDENED = 2,
	GAMES_OF_SUMMER = 5,
	REGULAR = 1,
	VETERAN = 3,
	NONE = 0
}
Challenge.MasterChallengeTypes = {
	WARZONE = 1,
	KILLSTREAK = 2,
	EQUIPMENT = 3
}
Challenge.KeyPressDirection = {
	LEFT = 1,
	RIGHT = 2
}
Challenge.BRCategory = "BR"
Challenge.allCategory = "ALL"
Challenge.PS4Category = "PS4"
Challenge.BPCategory = "BP"
Challenge.Operator = "OPERATOR"
Challenge.Intel = "INTEL"
Challenge.CPCategory = "CP"
Challenge.MPCategory = "MP"
Challenge.RewardCategory = "REWARD"
Challenge.StickerBookChallengeTypes = {
	[Challenge.MPCategory] = "MENU/MULTIPLAYER",
	[Challenge.BRCategory] = "CHALLENGE/WARZONE"
}
Challenge.ActivationCategoryMP = 0
Challenge.ActivationCategoryBR = 1
Challenge.ActivationCategoryCP = 4
Challenge.GamesOfSummerXPValue = 5000
Challenge.MissionsWhitelist = {
	Challenge.allCategory,
	Challenge.PS4Category,
	Challenge.BPCategory
}
Challenge.BRMissionsWhitelist = {
	Challenge.BRCategory
}
Challenge.CPMissionsWhitelist = {
	Challenge.CPCategory
}
Challenge.IntelMissionsWhitelist = {
	Challenge.Intel
}
Challenge.fakeChallenges = {
	{
		isComplete = false,
		name = "CHALLENGE/BR_DAILY_AMMO_DEALER",
		XP = "2000",
		progress = 0.3,
		amountNeeded = 10,
		unlocked = true,
		loot = "0",
		desc = "CHALLENGE/BR_DAILY_AMMO_DEALER_DESC",
		amount = "10",
		length = "1",
		ref = "ch_br_daily_ammo_dealer_short",
		id = "5000",
		amountEarned = 3,
		type = Challenge.Type.BR_DAILY
	},
	{
		isComplete = false,
		name = "CHALLENGE/BR_DAILY_THE_BIGGEST_BOOMS",
		XP = "5000",
		progress = 0.5,
		amountNeeded = 30,
		unlocked = true,
		loot = "0",
		desc = "CHALLENGE/BR_DAILY_THE_BIGGEST_BOOMS_DESC",
		amount = "30",
		length = "1",
		ref = "ch_br_daily_the_biggest_booms_short",
		id = "5001",
		amountEarned = 15,
		type = Challenge.Type.BR_DAILY
	},
	{
		isComplete = true,
		name = "CHALLENGE/BR_DAILY_EASY_MONEY",
		XP = "9999",
		progress = 1,
		amountNeeded = 5,
		unlocked = true,
		loot = "0",
		desc = "CHALLENGE/BR_DAILY_EASY_MONEY_DESC",
		amount = "5",
		length = "1",
		ref = "ch_br_daily_the_biggest_booms_short",
		id = "5002",
		amountEarned = 5,
		type = Challenge.Type.BR_DAILY
	}
}
Challenge.MAX_NUM_ACTIVE_DAILY_CHALLENGES = 3
Challenge.MAX_NUM_BANKED_CHALLENGES = 20

function Challenge.GetFileTableByType(arg_1_0)
	if arg_1_0 == Challenge.Type.GUNSMITH then
		return CSV.gunsmithChallenges
	elseif arg_1_0 == Challenge.Type.ELDER then
		return CSV.elderChallenges
	elseif arg_1_0 == Challenge.Type.OPERATOR_UNLOCK then
		return CSV.operatorUnlockChallenges
	elseif arg_1_0 == Challenge.Type.COMMUNITY then
		return CSV.communityChallenges
	elseif arg_1_0 == Challenge.Type.WEEKLY then
		return CSV.weeklyChallenges
	elseif arg_1_0 == Challenge.Type.DAILY then
		return CSV.dailyChallenges
	elseif arg_1_0 == Challenge.Type.MISSION then
		return CSV.questChallenges
	elseif arg_1_0 == Challenge.Type.RETICLE then
		return CSV.reticleChallenges
	elseif arg_1_0 == Challenge.Type.TOURNAMENT then
		return CSV.tournamentChallenges
	elseif arg_1_0 == Challenge.Type.GUN_UNLOCK then
		return CSV.gunChallenges
	elseif arg_1_0 == Challenge.Type.BR_WEEKLY then
		return CSV.brWeeklyChallenges
	elseif arg_1_0 == Challenge.Type.BR_DAILY then
		return CSV.brDailyChallenges
	elseif arg_1_0 == Challenge.Type.CP_DAILY then
		return CSV.cpDailyChallenges
	elseif arg_1_0 == Challenge.Type.WEAPON_MASTERY then
		return CSV.weaponMasterChallenges
	elseif arg_1_0 == Challenge.Type.STICKER_BOOK then
		return CSV.callingCardMasterChallenges
	elseif arg_1_0 == Challenge.Type.MISC then
		return CSV.miscChallenges
	elseif arg_1_0 == Challenge.Type.OPERATOR_CHALLENGE then
		return CSV.operatorChallenges
	elseif arg_1_0 == Challenge.Type.OPERATOR_MASTERY_CHALLENGE then
		return CSV.operatorMasteryChallenges
	end

	return nil
end

function Challenge.GetValidatedNumChallengesForSpecifiedMax(arg_2_0, arg_2_1)
	assert(arg_2_0, "Challenge.GetValidatedNumChallengesForSpecifiedMax: numChallenges is nil and must be specified")
	assert(arg_2_1, "Challenge.GetValidatedNumChallengesForSpecifiedMax: maxNumChallenges is nil and must be specified")

	local var_2_0 = 0

	if arg_2_0 then
		if arg_2_0 >= 0 and arg_2_0 <= arg_2_1 then
			var_2_0 = arg_2_0
		elseif arg_2_1 < arg_2_0 then
			var_2_0 = arg_2_1
		end
	end

	return var_2_0
end

function Challenge.GetTypeByLootID(arg_3_0)
	local var_3_0 = LOOT.GetTypeForID(arg_3_0)

	if var_3_0 == LOOT.itemTypes.OPERATOR then
		return Challenge.Type.OPERATOR_UNLOCK
	elseif var_3_0 == LOOT.itemTypes.RETICLE then
		return Challenge.Type.RETICLE
	elseif var_3_0 == LOOT.itemTypes.ATTACHMENT or var_3_0 == LOOT.itemTypes.CAMO then
		return Challenge.Type.GUNSMITH
	elseif var_3_0 == LOOT.itemTypes.WEAPON then
		return Challenge.Type.GUN_UNLOCK
	end

	return nil
end

function Challenge.GetTypeName(arg_4_0)
	if arg_4_0 > Challenge.Type.MAX_NUM or arg_4_0 < Challenge.Type.MIN_NUM then
		return
	end

	local var_4_0 = Challenge.TypeNameTable[arg_4_0]

	if var_4_0 and #var_4_0 > 0 then
		return Engine.CBBHFCGDIC(var_4_0)
	end

	assert(false, "We need to fill up challenge name def for type " .. arg_4_0)

	return nil
end

function Challenge.GetRef(arg_5_0, arg_5_1)
	if arg_5_1 > Challenge.Type.MAX_NUM or arg_5_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_5_0 = Challenge.GetFileTableByType(arg_5_1)

	if var_5_0 then
		return StringTable.DIFCHIGDFB(var_5_0.file, var_5_0.cols.id, arg_5_0, var_5_0.cols.ref)
	end
end

function Challenge.GetName(arg_6_0, arg_6_1)
	if arg_6_1 > Challenge.Type.MAX_NUM or arg_6_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_6_0 = Challenge.GetFileTableByType(arg_6_1)

	if var_6_0 then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_6_0.file, var_6_0.cols.id, arg_6_0, var_6_0.cols.name))
	end
end

function Challenge.GetNameFromRef(arg_7_0, arg_7_1)
	if arg_7_1 > Challenge.Type.MAX_NUM or arg_7_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_7_0 = Challenge.GetFileTableByType(arg_7_1)

	if var_7_0 then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_7_0.file, var_7_0.cols.ref, arg_7_0, var_7_0.cols.name))
	end
end

function Challenge.GetIDFromRef(arg_8_0, arg_8_1)
	if arg_8_1 > Challenge.Type.MAX_NUM or arg_8_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_8_0 = Challenge.GetFileTableByType(arg_8_1)

	if var_8_0 then
		return StringTable.DIFCHIGDFB(var_8_0.file, var_8_0.cols.ref, arg_8_0, var_8_0.cols.id)
	end
end

function Challenge.GetDesc(arg_9_0, arg_9_1)
	if arg_9_1 > Challenge.Type.MAX_NUM or arg_9_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_9_0 = Challenge.GetFileTableByType(arg_9_1)

	if var_9_0 then
		return StringTable.DIFCHIGDFB(var_9_0.file, var_9_0.cols.id, arg_9_0, var_9_0.cols.desc)
	end
end

function Challenge.GetAmount(arg_10_0, arg_10_1)
	if arg_10_1 > Challenge.Type.MAX_NUM or arg_10_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_10_0 = Challenge.GetFileTableByType(arg_10_1)

	if var_10_0 then
		return StringTable.DIFCHIGDFB(var_10_0.file, var_10_0.cols.id, arg_10_0, var_10_0.cols.amount)
	end
end

function Challenge.GetLootID(arg_11_0, arg_11_1)
	if arg_11_1 > Challenge.Type.MAX_NUM or arg_11_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_11_0 = Challenge.GetFileTableByType(arg_11_1)

	if var_11_0 then
		return StringTable.DIFCHIGDFB(var_11_0.file, var_11_0.cols.id, arg_11_0, var_11_0.cols.loot)
	end
end

function Challenge.GetXPReward(arg_12_0, arg_12_1)
	if arg_12_1 > Challenge.Type.MAX_NUM or arg_12_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_12_0 = Challenge.GetFileTableByType(arg_12_1)
	local var_12_1

	if var_12_0.cols.XPReward then
		var_12_1 = var_12_0.cols.XPReward
	elseif var_12_0.cols.XP then
		var_12_1 = var_12_0.cols.XP
	elseif var_12_0.cols.xp then
		var_12_1 = var_12_0.cols.xp
	end

	if var_12_0 and var_12_1 then
		return StringTable.DIFCHIGDFB(var_12_0.file, var_12_0.cols.id, arg_12_0, var_12_1)
	end

	return -1
end

function Challenge.GetSkinChallengeData(arg_13_0, arg_13_1)
	local var_13_0 = tostring(LOOT.GetItemID(LOOT.itemTypes.OPERATOR_SKIN, arg_13_1))
	local var_13_1 = StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.loot, var_13_0)

	if var_13_1 >= 0 then
		local var_13_2 = CSV.questChallenges.cols
		local var_13_3 = {
			id = var_13_2.id,
			name = var_13_2.name,
			desc = var_13_2.desc,
			loot = var_13_2.loot,
			codPoints = var_13_2.codPoints,
			amount = var_13_2.amount
		}
		local var_13_4 = CSV.ReadRowWithColumns(CSV.questChallenges, var_13_1, var_13_3)

		var_13_4.progress = Quests.CCBJIDFAHE(arg_13_0, var_13_4.id)
		var_13_4.challengeRowIndex = var_13_1

		return var_13_4
	end

	return nil
end

function Challenge.GetChallengeDataForSkinLootIds(arg_14_0, arg_14_1)
	local var_14_0 = CSV.questChallenges.cols
	local var_14_1 = StringTable.BFHCAIIDA(CSV.questChallenges.file)
	local var_14_2 = {
		id = var_14_0.id,
		name = var_14_0.name,
		desc = var_14_0.desc,
		loot = var_14_0.loot,
		codPoints = var_14_0.codPoints,
		amount = var_14_0.amount
	}
	local var_14_3 = {}

	for iter_14_0 = 0, var_14_1 - 1 do
		if arg_14_1[StringTable.CBGJCDIHCE(CSV.questChallenges.file, iter_14_0, CSV.questChallenges.cols.loot)] ~= nil then
			local var_14_4 = CSV.ReadRowWithColumns(CSV.questChallenges, iter_14_0, var_14_2)

			var_14_4.progress = Quests.CCBJIDFAHE(arg_14_0, var_14_4.id)
			var_14_4.challengeRowIndex = iter_14_0
			var_14_3[var_14_4.loot] = var_14_4
		end
	end

	return var_14_3
end

function Challenge.GetChallengeIndexForSkinLootIds(arg_15_0, arg_15_1)
	local var_15_0 = StringTable.BFHCAIIDA(CSV.questChallenges.file)
	local var_15_1 = {}

	for iter_15_0 = 0, var_15_0 - 1 do
		local var_15_2 = StringTable.CBGJCDIHCE(CSV.questChallenges.file, iter_15_0, CSV.questChallenges.cols.loot)
		local var_15_3 = arg_15_1[tonumber(var_15_2)]

		if var_15_3 ~= nil then
			var_15_1[iter_15_0] = var_15_3
		end
	end

	return var_15_1
end

function Challenge.PopuplateCategoryInfo(arg_16_0)
	for iter_16_0, iter_16_1 in pairs(CHALLENGE_CATEGORIES_LIST) do
		if iter_16_1.topChallenges == nil then
			local var_16_0 = Challenge.GetCategoryInfo(iter_16_0, arg_16_0)

			iter_16_1.totalProgress = var_16_0.progress
			iter_16_1.topChallenges = var_16_0.topChallenges
		end
	end
end

function Challenge.GetCategoryInfo(arg_17_0, arg_17_1)
	local var_17_0 = 0
	local var_17_1 = 0
	local var_17_2 = {}

	for iter_17_0, iter_17_1 in pairs(CHALLENGE_CATEGORIES_LIST[arg_17_0].subCategories) do
		local var_17_3 = CHALLENGE_CATEGORIES_LIST[arg_17_0].subCategories[iter_17_0].ref
		local var_17_4 = {
			CSV.allChallengesTable.file,
			CSV.allChallengesTable.altFile
		}

		for iter_17_2, iter_17_3 in ipairs(var_17_4) do
			for iter_17_4 = 0, StringTable.BFHCAIIDA(iter_17_3) do
				local var_17_5 = StringTable.CBGJCDIHCE(iter_17_3, iter_17_4, CSV.allChallengesTable.cols.ref)

				if var_17_5 ~= "" and StringTable.CBGJCDIHCE(iter_17_3, iter_17_4, CSV.allChallengesTable.cols.subCategory) == var_17_3 then
					local var_17_6 = CallingCardUtils.GetChallengeEntry(var_17_5, arg_17_1, iter_17_3)

					if not var_17_6.isMasterChallenge then
						if var_17_6.isCompleted then
							var_17_1 = var_17_1 + 1
						else
							var_17_2[#var_17_2 + 1] = {
								ref = var_17_5,
								progress = var_17_6.currentProgressPercent,
								allChallengesTable = iter_17_3
							}
						end

						var_17_0 = var_17_0 + 1
					end
				end
			end
		end
	end

	table.sort(var_17_2, function(arg_18_0, arg_18_1)
		return arg_18_0.progress > arg_18_1.progress
	end)

	local var_17_7 = var_17_1 / math.max(var_17_0, 1)
	local var_17_8 = {}

	for iter_17_5 = 1, 3 do
		if var_17_2[iter_17_5] then
			table.insert(var_17_8, var_17_2[iter_17_5])
		end
	end

	return {
		progress = var_17_7,
		topChallenges = var_17_8
	}
end

function Challenge.GetCategoryRefFromIndex(arg_19_0)
	assert(type(arg_19_0) == "number")
	assert(arg_19_0 >= 0)

	for iter_19_0, iter_19_1 in pairs(CHALLENGE_CATEGORIES_LIST) do
		if iter_19_1.index == arg_19_0 then
			return iter_19_0
		end
	end
end

function Challenge.GetCategoryName(arg_20_0)
	return CHALLENGE_CATEGORIES_LIST[arg_20_0].name
end

function Challenge.GetCategoryDesc(arg_21_0)
	return CHALLENGE_CATEGORIES_LIST[arg_21_0].desc
end

function Challenge.GetCategoryIndex(arg_22_0)
	return CHALLENGE_CATEGORIES_LIST[arg_22_0].index
end

function Challenge.GetLocalizedUnlockString(arg_23_0)
	local var_23_0 = StringTable.DIFCHIGDFB(CSV.challengeUnlockTable.file, CSV.challengeUnlockTable.cols.ref, arg_23_0, CSV.challengeUnlockTable.cols.ui_text)
	local var_23_1 = StringTable.DIFCHIGDFB(CSV.challengeUnlockTable.file, CSV.challengeUnlockTable.cols.ref, arg_23_0, CSV.challengeUnlockTable.cols.ui_text_var1)

	return Engine.CBBHFCGDIC(var_23_0, var_23_1)
end

local function var_0_0(arg_24_0, arg_24_1)
	if arg_24_0 and #arg_24_0 > 0 then
		local var_24_0 = StringTable.BJJBBCJGEJ(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_24_0)

		assert(var_24_0 >= 0)

		local var_24_1 = CSV.ReadRow(CSV.allChallengesTable, var_24_0)
		local var_24_2 = CSV.allChallengesTable.tiers.targetStart + CSV.allChallengesTable.numTierCols * arg_24_1

		var_24_1.currentTierMax = StringTable.CBGJCDIHCE(CSV.allChallengesTable.file, var_24_0, var_24_2)

		return var_24_1
	end

	return false
end

function Challenge.GetPipeParsedReticleChallengeDataForLootID(arg_25_0, arg_25_1)
	arg_25_1 = tonumber(arg_25_1)

	assert(arg_25_0, "GetPipeParsedReticleChallengeDataForLootID: rowIndex expected to be non-nil")
	assert(arg_25_1, "GetPipeParsedReticleChallengeDataForLootID: lootIDToFind expected to be non-nil")

	local var_25_0 = CSV.ReadRow(CSV.reticleChallenges, arg_25_0)
	local var_25_1 = split(var_25_0.amount, "|")
	local var_25_2 = split(var_25_0.loot, "|")
	local var_25_3 = split(var_25_0.XPReward, "|")
	local var_25_4

	for iter_25_0, iter_25_1 in pairs(var_25_2) do
		if tonumber(iter_25_1) == arg_25_1 then
			var_25_4 = iter_25_0

			break
		end
	end

	if not var_25_4 then
		assert(var_25_4, "GetPipeParsedReticleChallengeDataForLootID: lootIDToFind = " .. arg_25_1 .. ", which was not found in the 'loot' column of reticle_challenges.csv for row #" .. arg_25_0)
	end

	return {
		amount = var_25_1[var_25_4],
		loot = var_25_2[var_25_4],
		XPReward = var_25_3[var_25_4]
	}
end

function Challenge.GetReticleChallengeData(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_26_1, CSV.reticles.cols.unlockChallengeRef)
	local var_26_1 = -1

	if var_26_0 and var_26_0 ~= "" then
		var_26_1 = StringTable.BJJBBCJGEJ(CSV.reticleChallenges.file, CSV.reticleChallenges.cols.ref, var_26_0)
	else
		var_26_1 = StringTable.BJJBBCJGEJ(CSV.reticleChallenges.file, CSV.reticleChallenges.cols.loot, arg_26_2)
	end

	if var_26_1 == -1 then
		var_26_1 = arg_26_0[tostring(arg_26_2)] or -1
	elseif var_26_1 == "" then
		DebugPrint("Unable to find required table")
		LUI.FlowManager.RequestDevErrorPopup("Unable to find required table")

		return nil
	end

	local var_26_2 = CSV.ReadRow(CSV.reticleChallenges, var_26_1)

	if var_26_2 and var_26_1 >= 0 then
		local var_26_3 = Challenge.GetPipeParsedReticleChallengeDataForLootID(var_26_1, arg_26_2)

		var_26_2.amount = var_26_3.amount
		var_26_2.loot = var_26_3.loot
		var_26_2.XPReward = var_26_3.XPReward
	end

	return var_26_2
end

function Challenge.GetLocalizedChallengeDesc(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_2 or CSV.allChallengesTable.file
	local var_27_1 = StringTable.DIFCHIGDFB(var_27_0, CSV.allChallengesTable.cols.ref, arg_27_0, CSV.allChallengesTable.cols.desc)

	if var_27_1 == nil or var_27_1 == "" then
		var_27_1 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_27_0, CSV.allChallengesTable.cols.name)
	end

	local var_27_2 = StringTable.DIFCHIGDFB(var_27_0, CSV.allChallengesTable.cols.ref, arg_27_0, CSV.allChallengesTable.cols.displayParam)

	if not var_27_2 or var_27_2 == "" then
		var_27_2 = arg_27_1
	end

	if var_27_1 and var_27_1 ~= "" then
		if var_27_2 then
			return Engine.CBBHFCGDIC(var_27_1, var_27_2)
		else
			return Engine.CBBHFCGDIC(var_27_1)
		end
	end

	assert(false, "Unable to get localized description for challengeRef " .. arg_27_0)

	return ""
end

function Challenge.DebugGetChallengesData(arg_28_0)
	return {
		{
			ID = 1003,
			progressPercentage = 0.35
		},
		{
			ID = 1004,
			progressPercentage = 0.65
		},
		{
			ID = 1005,
			progressPercentage = 0.8
		}
	}
end

function Challenge.GetDefaultLootReward(arg_29_0)
	return {
		image = "default",
		typeIcon = "icon_loot_category_0",
		type = LOOT.itemTypes.TEMP,
		typeName = Engine.CBBHFCGDIC("LOOT_MP/LOOT"),
		ref = "" .. arg_29_0,
		name = Engine.CBBHFCGDIC("LOOT_MP/PLACEHOLDER"),
		rarity = LOOT.Rarity.BASE,
		rarityImage = LOOT.GetRarityImage(LOOT.Rarity.BASE),
		rarityColor = LOOT.GetRarityColor(LOOT.Rarity.BASE),
		typeIconRendered = LOOT.GetRenderedLootIcon(LOOT.Rarity.BASE),
		lootItemID = arg_29_0
	}
end

function Challenge.GetLootReward(arg_30_0)
	local var_30_0 = {}
	local var_30_1 = LOOT.GetTypeForID(arg_30_0)

	if not var_30_1 then
		return Challenge.GetDefaultLootReward(arg_30_0)
	end

	local var_30_2 = LOOT.GetItemRef(var_30_1, arg_30_0)

	if not var_30_2 or #var_30_2 <= 0 then
		return Challenge.GetDefaultLootReward(arg_30_0)
	end

	return {
		typeIcon = "icon_loot_category_0",
		type = var_30_1,
		typeName = Engine.CBBHFCGDIC("LOOT_MP/LOOT"),
		ref = var_30_2,
		name = LOOT.GetItemName(var_30_1, var_30_2, arg_30_0),
		image = LOOT.GetItemImage(var_30_1, var_30_2, arg_30_0),
		rarity = LOOT.GetItemQuality(var_30_1, var_30_2, arg_30_0),
		rarityImage = LOOT.GetRarityImage(var_30_0.rarity),
		rarityColor = LOOT.GetRarityColor(var_30_0.rarity),
		typeIconRendered = LOOT.GetRenderedLootIcon(var_30_0.rarity),
		lootItemID = arg_30_0
	}
end

function Challenge.GetRewards(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = Challenge.GetXPReward(arg_31_0.id, arg_31_1)

	if var_31_1 and type(var_31_1) == "number" and var_31_1 < 0 then
		var_31_1 = ""
	end

	local var_31_2 = {
		typeIconRenderedScale = 0.4,
		type = "xp",
		image = "icon_xp_token",
		rarityImage = "icon_xp",
		typeIcon = "icon_xp",
		typeIconRendered = "icon_xp_token",
		name = Engine.CBBHFCGDIC("CHALLENGE/N_XP", var_31_1),
		typeName = Engine.CBBHFCGDIC("LOOT_MP/XP"),
		amount = var_31_1
	}

	table.insert(var_31_0, var_31_2)

	if arg_31_0.loot and #arg_31_0.loot > 0 then
		local var_31_3 = tonumber(arg_31_0.loot)
		local var_31_4 = Challenge.GetLootReward(var_31_3)

		if not var_31_4 then
			assert(false, "Unable to get reward info for ID " .. var_31_3 .. ".  Item type or ref may be invalid.")
		end

		if var_31_4 then
			var_31_4.itemID = var_31_3

			local var_31_5 = LOOT.GetTypeForID(var_31_3)
			local var_31_6 = Challenge.GetDifficulty(arg_31_0.id, arg_31_1)

			if var_31_5 == LOOT.itemTypes.FEATURE then
				var_31_4.name = Challenge.GetCodPointsFromMissionData(arg_31_0)
			end

			if var_31_6 == Challenge.Difficulty.GAMES_OF_SUMMER and (var_31_3 == LOOT.DOUBLE_WEAPON_XP_TOKENS.WeaponXP_Rare or var_31_3 == LOOT.BATTLE_PASS_TIER_SKIP_TOKENS.Skip1) then
				local var_31_7 = LOOT.GetItemRef(var_31_5, var_31_3)

				var_31_4.typeIconRendered = LOOT.GetItemImage(var_31_5, var_31_7, var_31_3)
				var_31_4.typeIconRenderedScale = var_31_3 == LOOT.DOUBLE_WEAPON_XP_TOKENS.WeaponXP_Rare and 0.15 or 0
			end

			table.insert(var_31_0, var_31_4)
		end
	end

	return var_31_0
end

function Challenge.GetActiveMissionData(arg_32_0, arg_32_1)
	local var_32_0

	arg_32_1 = arg_32_1 or Challenge.ActivationCategoryMP

	local var_32_1 = Quests.BCIHEIDCGD(arg_32_0, arg_32_1)

	if var_32_1 and var_32_1 > 0 then
		local var_32_2 = tostring(var_32_1)
		local var_32_3 = tonumber(StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.id, var_32_2))

		if not var_32_3 or var_32_3 < 0 then
			return
		end

		local var_32_4 = CSV.ReadRow({
			file = CSV.questChallenges.file,
			cols = CSV.questChallenges.cols
		}, var_32_3)

		if not var_32_4 then
			return
		end

		if var_32_4.category == "PS4" and not Engine.CIEGIACHAE() then
			return nil
		end

		var_32_4.amountEarned = Quests.CCBJIDFAHE(arg_32_0, var_32_2) or 0
		var_32_4.amountNeeded = tonumber(var_32_4.amount) or 1
		var_32_4.progress = tonumber(string.format("%.2f", var_32_4.amountEarned / var_32_4.amountNeeded))
		var_32_4.progress = LUI.clamp(var_32_4.progress, 0, 1)

		local var_32_5 = Engine.CFHBIHABCB(arg_32_0)

		var_32_4.unlocked = var_32_4.category == Challenge.BRCategory or var_32_5
		var_32_4.rewards = Challenge.GetRewards(var_32_4, Challenge.Type.MISSION)

		return var_32_4
	end
end

function Challenge.GetFakeChallenges(arg_33_0)
	local var_33_0 = {}
	local var_33_1 = math.min(#Challenge.fakeChallenges, arg_33_0)
	local var_33_2 = Dvar.CFHDGABACF("challenge_summary_test_entry_count")

	if var_33_2 ~= nil then
		var_33_1 = math.min(var_33_1, var_33_2)
	end

	for iter_33_0 = 1, var_33_1 do
		table.insert(var_33_0, Challenge.fakeChallenges[iter_33_0])
	end

	return var_33_0
end

function Challenge.GetDailyChallenges(arg_34_0)
	if CONDITIONS.AreDailyChallengesDisabled() then
		return nil
	end

	local var_34_0 = {}
	local var_34_1 = ScheduledChallenges.DCIDHEEHJA(arg_34_0)

	if not var_34_1 then
		return nil
	end

	local var_34_2 = Engine.CFHBIHABCB(arg_34_0)
	local var_34_3 = StringTable.BFHCAIIDA(CSV.dailyChallenges.file)

	for iter_34_0 = 0, var_34_3 - 1 do
		local var_34_4 = StringTable.CBGJCDIHCE(CSV.dailyChallenges.file, iter_34_0, CSV.dailyChallenges.cols.id)

		if var_34_1[var_34_4] ~= nil then
			local var_34_5 = CSV.ReadRow(CSV.dailyChallenges, iter_34_0)

			var_34_5.amountEarned = var_34_1[var_34_4]
			var_34_5.amountNeeded = tonumber(var_34_5.amount)
			var_34_5.progress = var_34_5.amountEarned / var_34_5.amountNeeded
			var_34_5.isComplete = var_34_5.amountEarned == var_34_5.amountNeeded
			var_34_5.rewards = Challenge.GetRewards(var_34_5, Challenge.Type.DAILY)
			var_34_5.unlocked = var_34_2
			var_34_5.type = Challenge.Type.DAILY

			table.insert(var_34_0, var_34_5)
		end
	end

	Challenge.SortByNearestComplete(var_34_0)

	return var_34_0
end

function Challenge.GetBRDailyChallenges(arg_35_0)
	local var_35_0 = {}

	if CONDITIONS.AreDailyChallengesDisabled() then
		return var_35_0
	end

	local var_35_1 = ScheduledChallenges.JCAAACBBI(arg_35_0)

	if not var_35_1 then
		return var_35_0
	end

	for iter_35_0, iter_35_1 in pairs(var_35_1) do
		local var_35_2 = StringTable.BJJBBCJGEJ(CSV.brDailyChallenges.file, CSV.brDailyChallenges.cols.id, iter_35_0)

		if var_35_2 >= 0 then
			local var_35_3 = CSV.ReadRow(CSV.brDailyChallenges, var_35_2)

			var_35_3.amountEarned = var_35_1[iter_35_0]
			var_35_3.amountNeeded = tonumber(var_35_3.amount)
			var_35_3.progress = var_35_3.amountEarned / var_35_3.amountNeeded
			var_35_3.isComplete = var_35_3.amountEarned == var_35_3.amountNeeded
			var_35_3.rewards = Challenge.GetRewards(var_35_3, Challenge.Type.BR_DAILY)
			var_35_3.unlocked = true
			var_35_3.type = Challenge.Type.BR_DAILY

			table.insert(var_35_0, var_35_3)
		end
	end

	Challenge.SortByNearestComplete(var_35_0)

	return var_35_0
end

function Challenge.GetBRBankedChallenges(arg_36_0)
	if CONDITIONS.AreDailyChallengesDisabled() then
		return {}
	end

	local var_36_0 = ScheduledChallenges.CCECJEFJDH(arg_36_0)

	if not var_36_0 then
		return {}
	end

	local var_36_1 = {}

	for iter_36_0, iter_36_1 in ipairs(var_36_0) do
		var_36_1[iter_36_1.id] = iter_36_1.progress
	end

	local var_36_2 = {}

	for iter_36_2, iter_36_3 in pairs(var_36_1) do
		local var_36_3 = StringTable.BJJBBCJGEJ(CSV.brDailyChallenges.file, CSV.brDailyChallenges.cols.id, iter_36_2)

		if var_36_3 >= 0 then
			local var_36_4 = CSV.ReadRow(CSV.brDailyChallenges, var_36_3)

			var_36_4.amountEarned = var_36_1[iter_36_2]
			var_36_4.amountNeeded = tonumber(var_36_4.amount)
			var_36_4.progress = var_36_4.amountEarned / var_36_4.amountNeeded
			var_36_4.isComplete = var_36_4.amountEarned == var_36_4.amountNeeded
			var_36_4.rewards = Challenge.GetRewards(var_36_4, Challenge.Type.BR_DAILY)
			var_36_4.unlocked = true
			var_36_4.type = Challenge.Type.BR_DAILY

			table.insert(var_36_2, var_36_4)
		end
	end

	local var_36_5 = {}

	for iter_36_4, iter_36_5 in ipairs(var_36_0) do
		for iter_36_6, iter_36_7 in ipairs(var_36_2) do
			if iter_36_7.id == iter_36_5.id then
				table.insert(var_36_5, iter_36_7)

				break
			end
		end
	end

	return var_36_5
end

function Challenge.GetCPDailyChallenges(arg_37_0)
	if CONDITIONS.AreDailyChallengesDisabled() then
		return nil
	end

	local var_37_0 = {}
	local var_37_1 = ScheduledChallenges.DCBCJDCGGB(arg_37_0)

	if not var_37_1 then
		return nil
	end

	local var_37_2 = Engine.CFHBIHABCB(arg_37_0)
	local var_37_3 = StringTable.BFHCAIIDA(CSV.cpDailyChallenges.file)

	for iter_37_0 = 0, var_37_3 - 1 do
		local var_37_4 = StringTable.CBGJCDIHCE(CSV.cpDailyChallenges.file, iter_37_0, CSV.cpDailyChallenges.cols.id)

		if var_37_1[var_37_4] ~= nil then
			local var_37_5 = CSV.ReadRow(CSV.cpDailyChallenges, iter_37_0)

			var_37_5.amountEarned = var_37_1[var_37_4]
			var_37_5.amountNeeded = tonumber(var_37_5.amount)
			var_37_5.progress = var_37_5.amountEarned / var_37_5.amountNeeded
			var_37_5.isComplete = var_37_5.amountEarned == var_37_5.amountNeeded
			var_37_5.rewards = Challenge.GetRewards(var_37_5, Challenge.Type.CP_DAILY)
			var_37_5.unlocked = var_37_2
			var_37_5.type = Challenge.Type.CP_DAILY

			table.insert(var_37_0, var_37_5)
		end
	end

	Challenge.SortByNearestComplete(var_37_0)

	return var_37_0
end

function Challenge.ShouldUseFakeChallengeData()
	return Dvar.IBEGCHEFE("challenge_summary_test")
end

function Challenge.GetDailyChallengeData(arg_39_0, arg_39_1)
	local var_39_0 = {}
	local var_39_1 = CONDITIONS.IsMagmaGameMode() or CONDITIONS.IsBRTDMGameType()

	if Challenge.ShouldUseFakeChallengeData() then
		var_39_0 = Challenge.GetFakeChallenges(arg_39_1)
	elseif var_39_1 then
		var_39_0 = Challenge.GetBRDailyChallenges(arg_39_0)
	else
		var_39_0 = Challenge.GetCombinedDailyChallenges(arg_39_0)

		if not CONDITIONS.IsThirdGameMode() then
			Challenge.SortByNearestComplete(var_39_0)
		end
	end

	if arg_39_1 < #var_39_0 then
		local var_39_2 = {}

		for iter_39_0 = 1, arg_39_1 do
			table.insert(var_39_2, var_39_0[iter_39_0])
		end

		var_39_0 = var_39_2
	end

	return var_39_0
end

function Challenge.GetCombinedDailyChallenges(arg_40_0)
	local var_40_0 = Challenge.GetDailyChallenges(arg_40_0) or {}

	if CONDITIONS.IsMagmaGameMode() and var_40_0 then
		assert(type(var_40_0) == "table")

		local var_40_1 = Challenge.GetBRDailyChallenges(arg_40_0)

		if not Engine.CFHBIHABCB(arg_40_0) then
			return var_40_1
		end

		if var_40_1 and #var_40_1 > 0 then
			for iter_40_0, iter_40_1 in ipairs(var_40_1) do
				table.insert(var_40_0, 1, iter_40_1)
			end
		end
	elseif CONDITIONS.IsThirdGameMode() and var_40_0 then
		assert(type(var_40_0) == "table")

		local var_40_2 = Challenge.GetCPDailyChallenges(arg_40_0)

		if var_40_2 and #var_40_2 > 0 then
			for iter_40_2, iter_40_3 in ipairs(var_40_2) do
				table.insert(var_40_0, 1, iter_40_3)
			end
		end
	end

	return var_40_0
end

function Challenge.SortByNearestComplete(arg_41_0)
	table.sort(arg_41_0, function(arg_42_0, arg_42_1)
		if arg_42_0.progress > arg_42_1.progress then
			return arg_42_0.progress ~= 1
		elseif arg_42_0.progress == arg_42_1.progress then
			return tonumber(arg_42_0.id) < tonumber(arg_42_1.id)
		else
			return arg_42_1.progress == 1
		end
	end)
end

function Challenge.SortByLength(arg_43_0)
	table.sort(arg_43_0, function(arg_44_0, arg_44_1)
		if arg_44_0.length ~= nil and arg_44_1.length ~= nil then
			return tonumber(arg_44_0.length) > tonumber(arg_44_1.length)
		else
			return tonumber(arg_44_0.category) > tonumber(arg_44_1.category)
		end
	end)
end

function Challenge.SortMissionChallenges(arg_45_0)
	table.sort(arg_45_0, function(arg_46_0, arg_46_1)
		if arg_46_0.isActive or arg_46_1.isActive then
			return arg_46_0.isActive
		elseif arg_46_0.progress > arg_46_1.progress then
			return arg_46_0.progress ~= 1
		elseif arg_46_0.progress == arg_46_1.progress then
			return arg_46_0.id < arg_46_1.id
		else
			return arg_46_1.progress == 1
		end
	end)
end

function Challenge.SetupDailyResetTimer(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0 = Dvar.BJJCJHDBII("MMLQOSOMTQ")
	local var_47_1 = 3600
	local var_47_2 = var_47_1 * 24
	local var_47_3 = 1000
	local var_47_4 = var_47_0 * var_47_1

	local function var_47_5()
		local var_48_0 = Engine.DEIDGHDBHD()
		local var_48_1 = 0

		if var_48_0 ~= nil then
			var_48_1 = var_47_2 - (var_48_0 - var_47_4) % var_47_2
		end

		local var_48_2 = Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_48_1))

		if var_48_1 <= var_47_1 then
			if not arg_47_0._timerAlert then
				ACTIONS.AnimateSequence(arg_47_0, "Warning")

				arg_47_0._timerAlert = true
			end
		else
			arg_47_0._timerAlert = false

			ACTIONS.AnimateSequence(arg_47_0, "Normal")

			if arg_47_3 and arg_47_3.textSwatchOverride then
				arg_47_1:SetRGBFromTable(arg_47_3.textSwatchOverride)
			end
		end

		local var_48_3

		if arg_47_3 and arg_47_3.labelKeyOverride then
			var_48_3 = arg_47_3.labelKeyOverride
		else
			var_48_3 = arg_47_2 and "CHALLENGE/RESETS_IN_X" or "CHALLENGE/RESET_TIME"
		end

		arg_47_1:setText(Engine.CBBHFCGDIC(var_48_3, var_48_2))
	end

	local var_47_6 = LUI.UITimer.new({
		event = "update_reset_time",
		interval = var_47_3
	})

	var_47_6.id = "dayResetTimer"

	arg_47_0:addElement(var_47_6)
	arg_47_0:addAndCallEventHandler("update_reset_time", var_47_5)
end

function Challenge.SetupSeasonEndsTimer(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = 1000
	local var_49_1 = SEASON.SeasonEndEpochTime()

	local function var_49_2()
		local var_50_0 = Engine.CCEJJCCDEG(tostring(var_49_1))

		if not var_50_0 or var_50_0 < 0 then
			var_50_0 = 0
		end

		local var_50_1 = Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_50_0))

		arg_49_1:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC(arg_49_2, var_50_1)))
	end

	local var_49_3 = LUI.UITimer.new({
		event = "update_time_to_season",
		interval = var_49_0
	})

	var_49_3.id = "seasonTimer"

	arg_49_0:addElement(var_49_3)
	arg_49_0:addAndCallEventHandler("update_time_to_season", var_49_2)
end

function Challenge.GenerateChecksum(arg_51_0)
	local var_51_0 = ScheduledChallenges.DCIDHEEHJA(arg_51_0)

	if not var_51_0 then
		return 0
	end

	local var_51_1 = 0

	for iter_51_0, iter_51_1 in pairs(var_51_0) do
		var_51_1 = var_51_1 + tonumber(iter_51_0)
	end

	if CONDITIONS.IsMagmaEnabled() then
		local var_51_2 = ScheduledChallenges.JCAAACBBI(arg_51_0)

		if var_51_2 then
			for iter_51_2, iter_51_3 in pairs(var_51_2) do
				var_51_1 = var_51_1 + tonumber(iter_51_2)
			end
		end
	end

	return var_51_1
end

function Challenge.ShouldShowDailyPopup(arg_52_0)
	if Dvar.IBEGCHEFE("MKSNTLMSQR") then
		return true
	end

	if not Dvar.IBEGCHEFE("MLKSPNRQRL") or Dvar.IBEGCHEFE("unattended") or CONDITIONS.IsWZWipFlowEnabled() then
		return false
	end

	local var_52_0 = PlayerData.BFFBGAJGD(arg_52_0, CoD.StatsGroup.NonGame)

	if not var_52_0.dailyChallengesPopupChecksum then
		return false
	end

	local var_52_1 = tonumber(var_52_0.dailyChallengesPopupChecksum:get())
	local var_52_2 = Challenge.GenerateChecksum(arg_52_0)
	local var_52_3 = var_52_2 ~= 0 and var_52_2 ~= var_52_1
	local var_52_4 = Challenge.GetDailyChallenges(arg_52_0)

	if not Dvar.IBEGCHEFE("LPKNOPTMLP") and not Engine.CFHBIHABCB(arg_52_0) then
		var_52_3 = var_52_3 and var_52_4 and #var_52_4 > 0
	elseif CONDITIONS.IsMagmaEnabled() then
		local var_52_5 = Challenge.GetBRDailyChallenges(arg_52_0)

		var_52_3 = var_52_3 and (var_52_4 and #var_52_4 > 0 or var_52_5 and #var_52_5 > 0)
	else
		var_52_3 = var_52_3 and var_52_4 and #var_52_4 > 0
	end

	return var_52_3
end

function Challenge.TryOpenDailyPopup(arg_53_0)
	if Challenge.ShouldShowDailyPopup(arg_53_0) then
		if CONDITIONS.IsMagmaEnabled() and (Dvar.IBEGCHEFE("LPKNOPTMLP") or Engine.CFHBIHABCB(arg_53_0)) then
			local var_53_0 = Challenge.GetDailyChallenges(arg_53_0)
			local var_53_1 = Challenge.GetBRDailyChallenges(arg_53_0)
			local var_53_2 = "MagmaDailyPopup"
			local var_53_3 = {}

			if not var_53_0 or var_53_0 and #var_53_0 == 0 or not var_53_1 or var_53_1 and #var_53_1 == 0 then
				if var_53_1 and #var_53_1 > 0 then
					var_53_3.GetChallengesFunction = Challenge.GetBRDailyChallenges
				end

				var_53_2 = "ChallengesDailyPopup"
			end

			LUI.FlowManager.RequestPopupMenu(nil, var_53_2, true, arg_53_0, false, var_53_3, nil, false, true)

			return var_53_2
		else
			LUI.FlowManager.RequestPopupMenu(nil, "ChallengesDailyPopup", true, arg_53_0, false, {}, nil, false, true)

			return "ChallengesDailyPopup"
		end
	end
end

function Challenge.OpenDailyPopup(arg_54_0, arg_54_1)
	assert(arg_54_0)

	local var_54_0 = Challenge.GetDailyChallenges(arg_54_1)
	local var_54_1 = Engine.CFHBIHABCB(arg_54_1)
	local var_54_2 = Onboarding.WARZONE_TUTORIAL_GAMEPLAY_INITIATED.WasCompleted(arg_54_0, arg_54_1)

	if (var_54_1 or var_54_2) and var_54_0 and #var_54_0 > 0 then
		arg_54_0.openedDailyPopup = true

		local var_54_3 = Challenge.TryOpenDailyPopup(arg_54_1)

		return var_54_3 and #var_54_3 > 0
	end
end

function Challenge.SetSeenDailyPopup(arg_55_0)
	if Dvar.IBEGCHEFE("MKSNTLMSQR") then
		return
	end

	local var_55_0 = Challenge.GenerateChecksum(arg_55_0)
	local var_55_1 = PlayerData.BFFBGAJGD(arg_55_0, CoD.StatsGroup.NonGame)

	if not var_55_1.dailyChallengesPopupChecksum then
		return
	end

	var_55_1.dailyChallengesPopupChecksum:set(var_55_0)
	ACTIONS.UploadStats(nil, arg_55_0)
end

function Challenge.UpdateDailyPopupEnabled()
	Dvar.DHEGHJJJHI("MLKSPNRQRL", Engine.EAAHGICFBD())
end

function Challenge.IsGunsmithCamoChallenge(arg_57_0, arg_57_1)
	local var_57_0 = Challenge.GetLootID(arg_57_0, arg_57_1)

	if var_57_0 and #var_57_0 > 0 then
		local var_57_1 = split(var_57_0, "|")
		local var_57_2 = tonumber(var_57_1[1])

		if var_57_2 and LOOT.IsCamo(var_57_2) then
			return true
		end
	end

	return false
end

function Challenge.GetQuestStageByRef(arg_58_0)
	local var_58_0 = "ch_quest"
	local var_58_1 = "_stage"
	local var_58_2, var_58_3 = string.find(arg_58_0, var_58_0)
	local var_58_4, var_58_5 = string.find(arg_58_0, var_58_1)
	local var_58_6 = string.sub(arg_58_0, var_58_3 + 1, var_58_4 - 1)
	local var_58_7 = string.sub(arg_58_0, var_58_5 + 1, #arg_58_0)

	return tonumber(var_58_6), tonumber(var_58_7)
end

function Challenge.GetMissionDataFromRowNum(arg_59_0, arg_59_1, arg_59_2)
	if not arg_59_1 or arg_59_1 < 0 then
		return
	end

	local var_59_0 = CSV.ReadRow({
		file = CSV.questChallenges.file,
		cols = CSV.questChallenges.cols
	}, arg_59_1)

	if not var_59_0 then
		return
	end

	var_59_0.amountEarned = Quests.CCBJIDFAHE(arg_59_0, var_59_0.id) or 0
	var_59_0.amountNeeded = tonumber(var_59_0.amount) or 1
	var_59_0.progress = tonumber(string.format("%.2f", var_59_0.amountEarned / var_59_0.amountNeeded))
	var_59_0.rewards = Challenge.GetRewards(var_59_0, Challenge.Type.MISSION)

	return var_59_0
end

function Challenge.GetMissionDataByRef(arg_60_0, arg_60_1)
	local var_60_0 = tonumber(StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_60_1))

	if var_60_0 and var_60_0 >= 0 then
		local var_60_1 = StringTable.CBGJCDIHCE(CSV.questChallenges.file, var_60_0, CSV.questChallenges.cols.id)

		return Challenge.GetMissionDataFromRowNum(arg_60_0, var_60_0, var_60_1)
	end
end

function Challenge.GetNextMissionDataInChain(arg_61_0, arg_61_1)
	if arg_61_1.challenges then
		local var_61_0 = tonumber(StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_61_1.challenges))

		if var_61_0 and var_61_0 >= 0 then
			local var_61_1 = StringTable.CBGJCDIHCE(CSV.questChallenges.file, var_61_0, CSV.questChallenges.cols.id)

			return Challenge.GetMissionDataFromRowNum(arg_61_0, var_61_0, var_61_1)
		end
	end
end

function Challenge.GetNextQuestRef(arg_62_0)
	assert(arg_62_0, "Usage: Challenge.GetNextQuestRef( <questRef> )")

	if not arg_62_0 then
		return
	end

	local var_62_0 = StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_62_0)

	if var_62_0 and var_62_0 >= 0 then
		local var_62_1 = StringTable.CBGJCDIHCE(CSV.questChallenges.file, var_62_0, CSV.questChallenges.cols.challenges)

		if var_62_1 and #var_62_1 > 0 then
			return var_62_1
		end
	end
end

function Challenge.GetPreviousQuestRef(arg_63_0)
	assert(arg_63_0, "Usage: Challenge.GetPreviousQuestRef( <questRef> )")

	if not arg_63_0 then
		return
	end

	local var_63_0 = StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.challenges, arg_63_0)

	if var_63_0 and var_63_0 >= 0 then
		local var_63_1 = StringTable.CBGJCDIHCE(CSV.questChallenges.file, var_63_0, CSV.questChallenges.cols.ref)

		if var_63_1 and #var_63_1 > 0 then
			return var_63_1
		end
	end
end

function Challenge.GetMissionDataByID(arg_64_0, arg_64_1)
	local var_64_0 = tonumber(StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.id, tostring(arg_64_1)))

	return (Challenge.GetMissionDataFromRowNum(arg_64_0, var_64_0, arg_64_1))
end

function Challenge.GetMissionSeason(arg_65_0, arg_65_1)
	return StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.id, arg_65_1, CSV.questChallenges.cols.season)
end

function Challenge.GetQuestsForMissionChallenges(arg_66_0, arg_66_1)
	local var_66_0 = {}
	local var_66_1 = {}
	local var_66_2 = Dvar.CFHDGABACF("MKSNRSOQSS") or 0
	local var_66_3 = StringTable.BFHCAIIDA(CSV.questChallenges.file)

	for iter_66_0 = 0, var_66_3 - 1 do
		local var_66_4 = CSV.ReadRow(CSV.questChallenges, iter_66_0)
		local var_66_5 = split(var_66_4.ref, "_")

		var_66_4.rowIndex = iter_66_0
		var_66_4.unlocked = var_66_4.category == Challenge.BRCategory or Engine.CFHBIHABCB(arg_66_0)

		local var_66_6
		local var_66_7

		if var_66_4.category == Challenge.Intel then
			var_66_6 = Challenge.GetIntelSeasonWeek(var_66_4.ref)
			var_66_7 = tonumber(var_66_5[#var_66_5])
			var_66_4.isIntel = true
			var_66_4.intelSeasonWeek = var_66_6
		else
			var_66_6 = split(var_66_5[2], "quest")[1]
			var_66_7 = tonumber(split(var_66_5[3], "stage")[1])
		end

		local var_66_8 = true

		if arg_66_1 and #arg_66_1 > 0 then
			for iter_66_1 = 1, #arg_66_1 do
				var_66_8 = var_66_4.category == arg_66_1[iter_66_1]

				if var_66_8 then
					break
				end
			end
		end

		if var_66_4.category == Challenge.Intel and var_66_4.intelSeasonWeek ~= "" and var_66_2 and var_66_2 > 0 and var_66_2 < tonumber(var_66_4.intelSeasonWeek) then
			var_66_8 = false
		end

		if var_66_8 then
			if not var_66_0[var_66_6] then
				var_66_0[var_66_6] = {}

				table.insert(var_66_1, var_66_6)
			end

			table.insert(var_66_0[var_66_6], var_66_7, var_66_4)
		end
	end

	for iter_66_2, iter_66_3 in ipairs(var_66_1) do
		local var_66_9 = var_66_0[iter_66_3]
		local var_66_10 = #var_66_9

		for iter_66_4 = 1, var_66_10 do
			if not var_66_9[iter_66_4] then
				table.remove(var_66_9, iter_66_4)

				iter_66_4 = iter_66_4 - 1
				var_66_10 = var_66_10 - 1
			end
		end
	end

	return {
		quests = var_66_0,
		questIDs = var_66_1
	}
end

function Challenge.IsMissionCurrent(arg_67_0, arg_67_1)
	local var_67_0 = SEASON.GetCurrentSeasonDataNum()
	local var_67_1 = Challenge.GetMissionSeason(arg_67_0, arg_67_1)

	if #var_67_1 > 0 then
		return tonumber(var_67_1) == var_67_0
	end
end

function Challenge.GetMissionsForQuests(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4)
	local var_68_0 = {}
	local var_68_1 = arg_68_1.quests
	local var_68_2 = arg_68_1.questIDs
	local var_68_3
	local var_68_4 = {}
	local var_68_5 = {}

	if arg_68_2 then
		var_68_3 = arg_68_2
		var_68_4[var_68_3] = BATTLEPASS.IsOwned(arg_68_0, var_68_3)
		var_68_5[var_68_3] = BATTLEPASS.GetTier(arg_68_0, var_68_3)
	else
		var_68_3 = SEASON.GetCurrentSeasonDataNum()

		for iter_68_0 = 1, var_68_3 do
			var_68_4[iter_68_0] = BATTLEPASS.IsOwned(arg_68_0, iter_68_0)
			var_68_5[iter_68_0] = BATTLEPASS.GetTier(arg_68_0, iter_68_0)
		end
	end

	for iter_68_1, iter_68_2 in ipairs(var_68_2) do
		local var_68_6 = #var_68_1[iter_68_2]
		local var_68_7 = var_68_1[iter_68_2][var_68_6]
		local var_68_8 = Challenge.GetMissionSeason(arg_68_0, var_68_1[iter_68_2][1].id)
		local var_68_9 = tonumber(var_68_8)
		local var_68_10 = false

		if #var_68_8 > 0 then
			var_68_10 = var_68_9 == arg_68_2
		end

		if #var_68_8 > 0 and (var_68_9 <= var_68_3 or Dvar.IBEGCHEFE("MRMSRLKSPT")) and (not arg_68_2 or var_68_10) then
			var_68_7.season = var_68_9

			if var_68_1[iter_68_2][1].category == Challenge.Operator then
				var_68_7.isOwned = Challenge.MissionIsOwned(arg_68_0, var_68_1[iter_68_2][1].id)

				if not var_68_7.isOwned then
					local var_68_11 = BATTLEPASS.GetMissionLevel(var_68_1[iter_68_2][1].ref, var_68_9)

					if var_68_11 then
						local var_68_12 = var_68_11 > var_68_5[var_68_9]

						var_68_12 = var_68_12 or not var_68_4[var_68_9]
						var_68_7.isBattlePassLocked = var_68_12
						var_68_7.battlePassLevelToUnlock = var_68_11
					else
						var_68_7.unlocked = false
					end
				end

				var_68_7.isRestartRequiredToActivate = Challenge.IsRestartRequired(arg_68_0, var_68_7)
			end

			if not arg_68_4 or arg_68_4(var_68_1[iter_68_2], var_68_7) then
				var_68_7.rewards = Challenge.GetRewards(var_68_7, Challenge.Type.MISSION)
				var_68_7.isPS4Exclusive = var_68_1[iter_68_2][1].category == Challenge.PS4Category

				local var_68_13 = false

				if var_68_6 == 1 then
					var_68_7.firstIncompleteQuestID = var_68_1[iter_68_2][1].id
					var_68_7.amountEarned = Quests.CCBJIDFAHE(arg_68_0, var_68_1[iter_68_2][1].id)
					var_68_7.amountNeeded = tonumber(var_68_1[iter_68_2][1].amount)
					var_68_7.amountEarned = math.min(var_68_7.amountEarned, var_68_7.amountNeeded)
					var_68_7.progress = var_68_7.amountEarned / var_68_7.amountNeeded
					var_68_7.complete = var_68_7.amountEarned == var_68_7.amountNeeded
				else
					local var_68_14 = {}
					local var_68_15 = false
					local var_68_16 = false
					local var_68_17 = 0

					if var_68_7.isIntel and var_68_7.intelSeasonWeek then
						var_68_13 = Challenge.IsIntelMissionActive(var_68_7.intelSeasonWeek)
					end

					for iter_68_3 = var_68_6, 1, -1 do
						local var_68_18 = var_68_1[iter_68_2][iter_68_3]
						local var_68_19 = var_68_18.isIntel
						local var_68_20 = tonumber(var_68_1[iter_68_2][iter_68_3].amount)

						if not var_68_19 then
							local var_68_21 = Quests.CCBJIDFAHE(arg_68_0, var_68_1[iter_68_2][iter_68_3].id)
							local var_68_22 = math.min(var_68_21, var_68_20)

							if not var_68_15 and not var_68_16 and var_68_22 < var_68_20 then
								var_68_7.firstIncompleteQuestID = var_68_1[iter_68_2][iter_68_3].id
							else
								if iter_68_3 == var_68_6 then
									var_68_15 = true
									var_68_17 = var_68_6
								elseif not var_68_15 then
									var_68_17 = var_68_17 + 1
								end

								var_68_22 = var_68_20
								var_68_16 = true
							end

							var_68_18.amountEarned = var_68_22
						else
							var_68_18.intelComplete = false

							if Challenge.IsInGameIntel(var_68_18.ref) then
								var_68_18.intelComplete = Challenge.HasCompletedInGameIntel(arg_68_0, var_68_18.ref)
							else
								var_68_18.intelComplete = Challenge.HasCompletedFrontendIntel(arg_68_0, var_68_18.ref)
							end

							var_68_18.amountEarned = 0

							if var_68_18.intelComplete then
								var_68_18.amountEarned = var_68_20
								var_68_17 = var_68_17 + 1

								if var_68_17 == var_68_6 then
									var_68_15 = true
								end
							end
						end

						if not var_68_7.isActive then
							if not var_68_19 then
								var_68_7.isActive = arg_68_3 and arg_68_3(var_68_18)
							else
								var_68_7.isActive = var_68_13
							end
						end

						if not var_68_7.isIntel then
							var_68_7.isIntel = var_68_18.isIntel
						end

						if var_68_7.isIntel and not var_68_7.isIntelUnlocked then
							var_68_7.isIntelUnlocked = var_68_13
						end

						var_68_18.amountNeeded = var_68_20
						var_68_18.progress = var_68_18.amountEarned / var_68_18.amountNeeded
						var_68_18.rewards = Challenge.GetRewards(var_68_18, Challenge.Type.MISSION)
						var_68_14[iter_68_3] = var_68_18
					end

					if var_68_7.isIntel then
						if not var_68_15 and var_68_17 > 0 then
							var_68_17 = var_68_17 - 1
						end

						var_68_7.isActive = var_68_7.isActive and not var_68_15
					end

					var_68_7.complete = var_68_15 == true
					var_68_7.progress = var_68_17 / var_68_6
					var_68_7.objectives = var_68_14
					var_68_7.numObjectivesComplete = var_68_17
				end

				if not var_68_7.isPS4Exclusive or Engine.CIEGIACHAE() then
					table.insert(var_68_0, var_68_7)
				end
			end
		end
	end

	return var_68_0
end

function Challenge.GetDifficulty(arg_69_0, arg_69_1)
	local var_69_0 = tonumber(Challenge.GetXPReward(arg_69_0, arg_69_1))

	if var_69_0 == nil then
		return Challenge.Difficulty.NONE
	end

	if (arg_69_1 == Challenge.Type.DAILY or arg_69_1 == Challenge.Type.BR_DAILY) and var_69_0 == Challenge.GamesOfSummerXPValue then
		return Challenge.Difficulty.GAMES_OF_SUMMER
	else
		local var_69_1 = Dvar.CFHDGABACF("MSORRSMRQM")
		local var_69_2 = Dvar.CFHDGABACF("NTPLTMKQOT")
		local var_69_3 = Dvar.CFHDGABACF("PQOTPPRPP")

		if var_69_1 and var_69_2 and var_69_3 then
			if var_69_0 <= var_69_1 then
				return Challenge.Difficulty.REGULAR
			elseif var_69_0 <= var_69_2 then
				return Challenge.Difficulty.HARDENED
			elseif var_69_0 <= var_69_3 then
				return Challenge.Difficulty.VETERAN
			end
		else
			return Challenge.Difficulty.NONE
		end
	end
end

function Challenge.GetChallengeCompletionStatus(arg_70_0)
	local var_70_0 = 0
	local var_70_1 = false

	if arg_70_0 and #arg_70_0 > 0 then
		for iter_70_0 = 1, #arg_70_0 do
			local var_70_2 = arg_70_0[iter_70_0]

			if var_70_2 and var_70_2.isComplete then
				var_70_0 = var_70_0 + 1
			end
		end

		var_70_1 = var_70_0 == #arg_70_0
	end

	return var_70_0, var_70_1
end

function Challenge.GetWeeklyChallenges(arg_71_0, arg_71_1)
	assert(arg_71_1 == Challenge.Type.WEEKLY or arg_71_1 == Challenge.Type.BR_WEEKLY)

	local var_71_0
	local var_71_1
	local var_71_2 = {}
	local var_71_3
	local var_71_4 = Engine.DEIDGHDBHD() + Dvar.CFHDGABACF("MNRLLKTLPT")
	local var_71_5 = Dvar.CFHDGABACF("TPQRKMRLN")
	local var_71_6 = SEASON.GetCurrentSeasonDataNum()
	local var_71_7 = 604800

	if arg_71_1 == Challenge.Type.WEEKLY then
		var_71_0 = CSV.weeklyChallenges
		var_71_1 = ScheduledChallenges.EBFEIJBCEC(arg_71_0)
	elseif arg_71_1 == Challenge.Type.BR_WEEKLY then
		var_71_0 = CSV.brWeeklyChallenges
		var_71_1 = ScheduledChallenges.BCFEBEHEBI(arg_71_0)
	end

	local var_71_8 = StringTable.BFHCAIIDA(var_71_0.file)

	for iter_71_0 = 0, var_71_8 - 1 do
		local var_71_9 = CSV.ReadRow(var_71_0, iter_71_0)

		if tonumber(var_71_9.season) == var_71_6 then
			local var_71_10 = split(var_71_9.ref, "_")
			local var_71_11

			if arg_71_1 == Challenge.Type.WEEKLY then
				var_71_11 = tonumber(var_71_10[5])
			elseif arg_71_1 == Challenge.Type.BR_WEEKLY then
				var_71_11 = tonumber(var_71_10[6])
			end

			local var_71_12 = tonumber(var_71_9.start)

			if var_71_5 and var_71_5 > 0 then
				var_71_12 = var_71_5 + (var_71_11 - 1) * var_71_7
			end

			local var_71_13 = tonumber(var_71_9.length)
			local var_71_14 = SEASON.SeasonEndEpochTime()

			if var_71_14 and var_71_14 > 0 then
				var_71_13 = var_71_14
			end

			local var_71_15

			var_71_15 = var_71_12 >= 0 and var_71_12 <= var_71_4 and var_71_4 <= var_71_13

			local var_71_16 = var_71_4 < var_71_12

			if not var_71_2[var_71_11] then
				var_71_2[var_71_11] = {}
				var_71_2[var_71_11].isWeekLocked = var_71_16
				var_71_2[var_71_11].weekStartTime = var_71_12
				var_71_2[var_71_11].numComplete = 0
				var_71_2.numWeeks = var_71_2.numWeeks and var_71_2.numWeeks + 1 or 1
			end

			if not var_71_16 and (not var_71_3 or var_71_3 < var_71_11) then
				var_71_3 = var_71_11
			end

			var_71_9.amountNeeded = tonumber(var_71_9.amount)

			assert(var_71_9.amountNeeded and var_71_9.amountNeeded > 0)

			if var_71_9.amountNeeded and var_71_9.amountNeeded > 0 then
				if var_71_1 and var_71_1[var_71_9.id] then
					var_71_9.amountEarned = var_71_1[var_71_9.id]
				else
					var_71_9.amountEarned = 0
				end

				var_71_9.progress = var_71_9.amountEarned / var_71_9.amountNeeded
				var_71_9.progress = LUI.clamp(var_71_9.progress, 0, 1)
				var_71_9.isComplete = var_71_9.amountEarned >= var_71_9.amountNeeded
				var_71_9.type = arg_71_1
				var_71_9.rewards = Challenge.GetRewards(var_71_9, var_71_9.type)

				if arg_71_1 == Challenge.Type.WEEKLY then
					var_71_9.unlocked = Engine.CFHBIHABCB(arg_71_0) and not var_71_16
				elseif arg_71_1 == Challenge.Type.BR_WEEKLY then
					var_71_9.unlocked = not var_71_16
				end

				table.insert(var_71_2[var_71_11], var_71_9)
			end
		end
	end

	if var_71_2 and var_71_2.numWeeks then
		for iter_71_1 = 1, var_71_2.numWeeks do
			local var_71_17 = var_71_2[iter_71_1]

			if var_71_17 then
				Challenge.SortByNearestComplete(var_71_17)
			end
		end
	end

	return var_71_2, var_71_3
end

function Challenge.GetCurrentWeekChallengesData(arg_72_0, arg_72_1, arg_72_2)
	local function var_72_0(arg_73_0)
		if arg_73_0 then
			for iter_73_0 = 1, #arg_73_0 do
				local var_73_0 = arg_73_0[iter_73_0]

				if var_73_0 and var_73_0.progress and var_73_0.progress > 0 then
					return true
				end
			end
		end

		return false
	end

	local var_72_1 = var_72_0(arg_72_1)
	local var_72_2 = var_72_0(arg_72_2)
	local var_72_3 = {}
	local var_72_4 = false

	if CONDITIONS.IsMagmaGameMode() then
		local var_72_5 = #arg_72_2
		local var_72_6 = Engine.CFHBIHABCB(arg_72_0)

		if var_72_6 then
			var_72_4 = var_72_2 or var_72_1
			var_72_5 = var_72_4 and #arg_72_2 or 5
		end

		for iter_72_0 = 1, var_72_5 do
			table.insert(var_72_3, arg_72_2[iter_72_0])
		end

		if var_72_6 or Dvar.IBEGCHEFE("MMOTQROLKT") then
			for iter_72_1 = 1, var_72_5 do
				table.insert(var_72_3, arg_72_1[iter_72_1])
			end
		end
	elseif CONDITIONS.IsMagmaEnabled() then
		var_72_4 = var_72_2 or var_72_1

		local var_72_7 = var_72_4 and #arg_72_1 or 5

		for iter_72_2 = 1, var_72_7 do
			table.insert(var_72_3, arg_72_1[iter_72_2])
		end

		for iter_72_3 = 1, var_72_7 do
			table.insert(var_72_3, arg_72_2[iter_72_3])
		end
	else
		for iter_72_4 = 1, #arg_72_1 do
			table.insert(var_72_3, arg_72_1[iter_72_4])
		end
	end

	if var_72_4 then
		Challenge.SortByNearestComplete(var_72_3)
	end

	return var_72_3
end

function Challenge.FocusTab(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_0:GetCurrentMenu()
	local var_74_1 = arg_74_1.qualifier ~= "keyboard" and arg_74_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

	if var_74_0.MPTabsMenu then
		local var_74_2 = var_74_0.MPTabsMenu:GetTabIndexByWidgetName("ChallengeMenu") - 1

		var_74_0.MPTabsMenu.Tabs:FocusTab(arg_74_1.controller, var_74_2, var_74_1)
	end
end

function Challenge.IsIntelMissionActive(arg_75_0)
	assert(arg_75_0)

	if not arg_75_0 then
		return false
	end

	return (Dvar.CFHDGABACF("LSQRKOSLTP") or 0) >= tonumber(arg_75_0)
end

function Challenge.HasCompletedIntelMission(arg_76_0, arg_76_1)
	local var_76_0 = PlayerData.BFFBGAJGD(arg_76_0, CoD.StatsGroup.Ranked)

	if not var_76_0 then
		assert(var_76_0)

		return false
	end

	local var_76_1 = var_76_0.missionComplete

	if not var_76_1 then
		assert(var_76_1)

		return false
	end

	return var_76_1[arg_76_1]:get() == 1
end

function Challenge.HasCompletedInGameIntel(arg_77_0, arg_77_1)
	local var_77_0 = Challenge.IsInGameIntel(arg_77_1) == true

	assert(var_77_0)

	if not var_77_0 then
		return false
	else
		return Challenge.HasCompletedIntelMission(arg_77_0, arg_77_1)
	end
end

function Challenge.HasCompletedFrontendIntel(arg_78_0, arg_78_1)
	local var_78_0 = Challenge.IsInGameIntel(arg_78_1) == false

	assert(var_78_0)

	if not var_78_0 then
		return false
	else
		local var_78_1 = Challenge.GetPreviousQuestRef(arg_78_1)

		if not var_78_1 then
			local var_78_2 = Challenge.GetNextQuestRef(arg_78_1)

			if var_78_2 then
				local var_78_3 = Challenge.HasCompletedIntelMission(arg_78_0, arg_78_1)
				local var_78_4 = Challenge.HasCompletedIntelMission(arg_78_0, var_78_2)

				return var_78_3 and var_78_4
			end
		else
			return Challenge.HasCompletedIntelMission(arg_78_0, var_78_1)
		end
	end
end

function Challenge.GetIntelImage(arg_79_0)
	return StringTable.DIFCHIGDFB(CSV.intelChallenges.file, CSV.intelChallenges.cols.masterRef, arg_79_0, CSV.intelChallenges.cols.image)
end

function Challenge.GetIntelEvent(arg_80_0)
	return StringTable.DIFCHIGDFB(CSV.intelChallenges.file, CSV.intelChallenges.cols.masterRef, arg_80_0, CSV.intelChallenges.cols.event)
end

function Challenge.GetIntelSeasonWeek(arg_81_0)
	return StringTable.DIFCHIGDFB(CSV.intelChallenges.file, CSV.intelChallenges.cols.masterRef, arg_81_0, CSV.intelChallenges.cols.seasonWeek)
end

function Challenge.IsInGameIntel(arg_82_0)
	return StringTable.DIFCHIGDFB(CSV.intelChallenges.file, CSV.intelChallenges.cols.masterRef, arg_82_0, CSV.intelChallenges.cols.inGame) == "1"
end

function Challenge.GetActiveIntelData(arg_83_0)
	local var_83_0 = Challenge.GetQuestsForMissionChallenges(arg_83_0, Challenge.IntelMissionsWhitelist)
	local var_83_1 = Challenge.GetMissionsForQuests(arg_83_0, var_83_0)

	for iter_83_0, iter_83_1 in ipairs(var_83_1) do
		if iter_83_1.isActive and not iter_83_1.complete then
			local var_83_2 = iter_83_1.objectives[iter_83_1.numObjectivesComplete + 1]

			if var_83_2 then
				var_83_2.progress = 0
				var_83_2.amountEarned = 0

				return var_83_2
			end
		end
	end
end

function Challenge.SortIntelMissions(arg_84_0)
	local var_84_0 = SEASON.GetCurrentSeasonDataNum()

	table.sort(arg_84_0, function(arg_85_0, arg_85_1)
		local var_85_0 = Challenge.GetIntelSeason(arg_85_0.intelSeasonWeek)
		local var_85_1 = Challenge.GetIntelSeason(arg_85_1.intelSeasonWeek)
		local var_85_2 = tonumber(arg_85_0.intelSeasonWeek)
		local var_85_3 = tonumber(arg_85_1.intelSeasonWeek)

		if var_85_0 == var_84_0 then
			if var_85_1 == var_84_0 then
				return var_85_2 < var_85_3
			else
				return true
			end
		elseif var_85_1 == var_84_0 then
			return false
		else
			return var_85_2 < var_85_3
		end
	end)
end

function Challenge.GetIntelSeason(arg_86_0)
	return math.floor(tonumber(arg_86_0) / 1000)
end

function Challenge.GetMasterChallengesCount()
	return StringTable.BFHCAIIDA(CSV.callingCardMasterChallenges.file)
end

function Challenge.GetMasterChallengeCategories()
	local var_88_0 = {}
	local var_88_1 = ""
	local var_88_2 = StringTable.BFHCAIIDA(CSV.callingCardMasterChallenges.file)

	for iter_88_0 = 0, var_88_2 - 1 do
		local var_88_3 = StringTable.CBGJCDIHCE(CSV.callingCardMasterChallenges.file, iter_88_0, CSV.callingCardMasterChallenges.cols.categoryType)

		if var_88_3 and #var_88_3 > 0 then
			var_88_0[var_88_3] = true
		end
	end

	return var_88_0, var_88_2
end

local function var_0_1(arg_89_0, arg_89_1)
	local var_89_0
	local var_89_1
	local var_89_2 = true
	local var_89_3 = split(arg_89_0, "|")
	local var_89_4

	if var_89_3 and #var_89_3 > 0 then
		var_89_1 = #var_89_3

		for iter_89_0 = 1, #var_89_3 do
			if arg_89_1 < tonumber(var_89_3[iter_89_0]) then
				var_89_0 = iter_89_0
				var_89_4 = var_89_3[iter_89_0]

				break
			elseif iter_89_0 == var_89_1 and arg_89_1 >= tonumber(var_89_3[iter_89_0]) then
				var_89_0 = var_89_1
				var_89_2 = false
				var_89_4 = var_89_3[iter_89_0]
			end
		end
	end

	return var_89_0, var_89_1, var_89_2, var_89_4
end

function Challenge.GetCallingCardMasterChallenges(arg_90_0, arg_90_1)
	local var_90_0 = {}

	local function var_90_1(arg_91_0)
		local var_91_0 = {
			id = arg_91_0.id,
			ref = arg_91_0.ref,
			challengeName = arg_91_0.name,
			loot = arg_91_0.loot,
			tierDesc = arg_91_0.desc,
			XPReward = arg_91_0.XPReward,
			amounts = arg_91_0.amount,
			categoryName = Challenge.StickerBookChallengeTypes[arg_91_0.categoryType]
		}
		local var_91_1 = StickerBookChallenges.CJBJIFGJHG(arg_90_0, var_91_0.id)
		local var_91_2 = var_91_1.Challenges.UnlockProgress
		local var_91_3, var_91_4, var_91_5, var_91_6 = var_0_1(arg_91_0.amount, var_91_2)

		var_91_0.progress = LUI.clamp(var_91_2 / var_91_6, 0, 1)
		var_91_0.actualProgress = var_91_1.Challenges.UnlockProgress
		var_91_0.currentTier = var_91_3
		var_91_0.isChallengeActive = var_91_5

		local var_91_7 = split(arg_91_0.loot, "|")

		var_91_0.challengeImage = LOOT.GetItemRef(LOOT.itemTypes.PLAYERCARD, var_91_7[var_91_4])
		var_91_0.numTiers = var_91_4
		var_91_0.currentChallengeProgressAmount = var_91_2
		var_91_0.currentChallengeMaxAmount = var_91_6

		return var_91_0
	end

	local var_90_2 = StringTable.BFHCAIIDA(CSV.callingCardMasterChallenges.file)

	for iter_90_0 = 0, var_90_2 - 1 do
		local var_90_3 = StringTable.CBGJCDIHCE(CSV.callingCardMasterChallenges.file, iter_90_0, CSV.callingCardMasterChallenges.cols.categoryType)

		if var_90_3 and var_90_3 == arg_90_1 or arg_90_1 == nil then
			local var_90_4 = CSV.ReadRow(CSV.callingCardMasterChallenges, iter_90_0)
			local var_90_5 = var_90_1(var_90_4)

			if var_90_5 then
				table.insert(var_90_0, var_90_5)
			end
		end
	end

	return var_90_0
end

function Challenge.GetAllMasterChallenges(arg_92_0, arg_92_1)
	local var_92_0 = {}
	local var_92_1 = Challenge.GetMasterChallengeCategories()

	if var_92_1 then
		for iter_92_0, iter_92_1 in pairs(var_92_1) do
			local var_92_2 = Challenge.GetCallingCardMasterChallenges(arg_92_0, iter_92_0)

			for iter_92_2 = 1, #var_92_2 do
				table.insert(var_92_0, var_92_2[iter_92_2])
			end
		end
	else
		var_92_0 = Challenge.GetCallingCardMasterChallenges(arg_92_0)
	end

	if arg_92_1 then
		table.sort(var_92_0, function(arg_93_0, arg_93_1)
			if arg_93_0.currentTier and arg_93_1.currentTier then
				if arg_93_0.isChallengeActive ~= arg_93_1.isChallengeActive then
					return arg_93_0.isChallengeActive
				elseif arg_93_0.progress ~= arg_93_1.progress then
					return arg_93_0.progress > arg_93_1.progress
				else
					return arg_93_0.id < arg_93_1.id
				end
			end
		end)
	end

	return var_92_0
end

function Challenge.GetCompletedStickerBookChallengeCount(arg_94_0)
	local var_94_0 = Challenge.GetAllMasterChallenges(arg_94_0, false)
	local var_94_1 = 0

	for iter_94_0 = 1, #var_94_0 do
		if var_94_0[iter_94_0].isChallengeActive == false then
			var_94_1 = var_94_1 + 1
		end
	end

	return var_94_1
end

function Challenge.GetCompletedStickerBookChallengeOfTypeCount(arg_95_0, arg_95_1)
	local var_95_0 = Challenge.GetCallingCardMasterChallenges(arg_95_0, arg_95_1)
	local var_95_1 = 0

	for iter_95_0 = 1, #var_95_0 do
		if var_95_0[iter_95_0].isChallengeActive == false then
			var_95_1 = var_95_1 + 1
		end
	end

	return var_95_1
end

function Challenge.IsCallingCardMasterChallengeLoot(arg_96_0, arg_96_1)
	local var_96_0 = StringTable.BFHCAIIDA(CSV.callingCardMasterChallenges.file)

	for iter_96_0 = 0, var_96_0 - 1 do
		local var_96_1 = CSV.ReadRow(CSV.callingCardMasterChallenges, iter_96_0)
		local var_96_2 = split(var_96_1.loot, "|")

		for iter_96_1 = 1, #var_96_2 do
			if arg_96_1 == var_96_2[iter_96_1] then
				return true
			end
		end
	end

	return false
end

function Challenge.GetWeaponMasterSplashInfo(arg_97_0, arg_97_1)
	local var_97_0

	if not arg_97_0 or not arg_97_1 then
		assert(false, "Challenge.GetWeaponMasterSplashInfo( <challengeID>, <progress> )")

		return
	else
		arg_97_1 = tonumber(arg_97_1)
	end

	local var_97_1 = StringTable.BJJBBCJGEJ(CSV.weaponMasterChallenges.file, CSV.weaponMasterChallenges.cols.id, arg_97_0)

	if var_97_1 >= 0 then
		local var_97_2 = CSV.ReadRowWithFile(CSV.weaponMasterChallenges, CSV.weaponMasterChallenges.file, var_97_1)
		local var_97_3 = LUI.Split(var_97_2.amount, "|")

		if #var_97_3 > 1 then
			local var_97_4

			for iter_97_0 = #var_97_3, 1, -1 do
				if arg_97_1 >= tonumber(var_97_3[iter_97_0]) then
					var_97_4 = iter_97_0

					break
				end
			end

			if not var_97_4 then
				assert(false, "Challenge.GetWeaponMasterSplashInfo could not find completed challenge for id: " .. arg_97_0 .. ", progress: " .. arg_97_1)

				return
			end

			var_97_0 = {
				id = var_97_2.id,
				ref = var_97_2.ref,
				name = LUI.Split(var_97_2.name, "|")[var_97_4] or var_97_2.name,
				desc = var_97_2.desc,
				detailDesc = var_97_2.detailDesc,
				categoryName = var_97_2.categoryName,
				loot = LUI.Split(var_97_2.loot, "|")[var_97_4] or var_97_2.loot,
				XPReward = LUI.Split(var_97_2.XPReward, "|")[var_97_4] or var_97_2.XPReward,
				icon = LUI.Split(var_97_2.icon, "|")[var_97_4] or var_97_2.icon
			}

			if var_97_4 > 1 then
				local var_97_5 = tonumber(var_97_3[var_97_4])
				local var_97_6 = tonumber(var_97_3[var_97_4 - 1])

				if var_97_6 < var_97_5 then
					var_97_5 = var_97_5 - var_97_6
				end

				var_97_0.amount = tostring(var_97_5)
			else
				var_97_0.amount = var_97_3[var_97_4]
			end
		else
			var_97_0 = var_97_2
		end
	end

	return var_97_0
end

function Challenge.MissionIsOwned(arg_98_0, arg_98_1)
	if not arg_98_1 or #arg_98_1 <= 0 then
		return false
	end

	local var_98_0 = arg_98_1
	local var_98_1 = Challenge.FindFirstChallenge(arg_98_1)

	if var_98_1 and #var_98_1 > 0 then
		var_98_0 = StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.ref, var_98_1, CSV.questChallenges.cols.id)
	end

	local var_98_2 = StringTable.DIFCHIGDFB(CSV.missionIDs.file, CSV.missionIDs.cols.ref, var_98_0, CSV.missionIDs.cols.operatorMissionItemID)

	if not var_98_2 or #var_98_2 <= 0 then
		return false
	end

	return Loot.DEBEIFJEEG(arg_98_0, tonumber(var_98_2)) > 0
end

function Challenge.FindFirstChallenge(arg_99_0)
	local var_99_0 = StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.id, arg_99_0, CSV.questChallenges.cols.ref)

	while var_99_0 ~= nil and #var_99_0 > 0 do
		local var_99_1 = StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.challenges, var_99_0, CSV.questChallenges.cols.ref)

		if var_99_1 ~= nil and #var_99_1 > 0 then
			var_99_0 = var_99_1
		else
			break
		end
	end

	return var_99_0
end

function Challenge.GetInitialMissionID(arg_100_0)
	local var_100_0 = ""
	local var_100_1 = Challenge.FindFirstChallenge(arg_100_0)

	if var_100_1 then
		var_100_0 = StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.ref, var_100_1, CSV.questChallenges.cols.id)
	end

	return var_100_0
end

function Challenge.IsFinalIntelBinkSeen(arg_101_0)
	local var_101_0 = PlayerData.BFFBGAJGD(arg_101_0, CoD.StatsGroup.NonGame).isFinalIntelBinkSeen
	local var_101_1

	if var_101_0 then
		var_101_1 = var_101_0:get()
	end

	return var_101_1 and var_101_1 == 1
end

function Challenge.MarkSeasonalEventCompleteBink(arg_102_0, arg_102_1)
	local var_102_0 = PlayerData.BFFBGAJGD(arg_102_0, CoD.StatsGroup.NonGame).isFinalIntelBinkSeen

	if var_102_0 then
		var_102_0:set(arg_102_1 and 1 or 0)
		ACTIONS.UploadStats(nil, arg_102_0)
	end
end

function Challenge.GetOperatorRefFromMission(arg_103_0)
	return StringTable.DIFCHIGDFB(CSV.missionIDs.file, CSV.missionIDs.cols.operatorMissionItemID, arg_103_0, CSV.missionIDs.cols.operatorRef)
end

function Challenge.IsFinalStage(arg_104_0)
	return (arg_104_0.isFinalStage ~= "" and tonumber(arg_104_0.isFinalStage) or 0) == 1
end

function Challenge.GetCodPointsFromMissionData(arg_105_0)
	return arg_105_0.codPoints ~= "" and tonumber(arg_105_0.codPoints) or 0
end

function Challenge.GetTotalCodPointsForMission(arg_106_0, arg_106_1)
	local var_106_0
	local var_106_1 = 0

	repeat
		if var_106_0 == nil then
			var_106_0 = Challenge.GetMissionDataByID(arg_106_0, arg_106_1)
		else
			var_106_0 = Challenge.GetNextMissionDataInChain(arg_106_0, var_106_0)
		end

		var_106_1 = var_106_1 + Challenge.GetCodPointsFromMissionData(var_106_0)
	until Challenge.IsFinalStage(var_106_0)

	return var_106_1
end

function Challenge.GetMissionItemID(arg_107_0)
	return (StringTable.DIFCHIGDFB(CSV.missionIDs.file, CSV.missionIDs.cols.ref, arg_107_0, CSV.missionIDs.cols.operatorMissionItemID))
end

function Challenge.GetMissionRarity(arg_108_0)
	local var_108_0 = StringTable.DIFCHIGDFB(CSV.missionIDs.file, CSV.missionIDs.cols.ref, arg_108_0, CSV.missionIDs.cols.quality)

	return tonumber(var_108_0)
end

function Challenge.IsRestartRequired(arg_109_0, arg_109_1)
	if not arg_109_1.isOwned then
		local var_109_0 = Challenge.GetInitialMissionID(arg_109_1.id)
		local var_109_1 = Challenge.GetMissionItemID(var_109_0)

		if #var_109_1 > 0 then
			local var_109_2 = Loot.DFGCEHHCEA(var_109_1)

			if not var_109_2 then
				return false
			end

			for iter_109_0, iter_109_1 in ipairs(var_109_2) do
				if STORE.IsBundleOwned(arg_109_0, iter_109_1) then
					return true
				end
			end
		end
	end

	return false
end

Challenge.INVALID_CHALLENGE_ID = ""

function Challenge.IsValidChallengeID(arg_110_0)
	return arg_110_0 ~= nil and arg_110_0 ~= ""
end

local function var_0_2(arg_111_0, arg_111_1, arg_111_2)
	if arg_111_2 then
		for iter_111_0, iter_111_1 in ipairs(arg_111_0) do
			if arg_111_2[iter_111_1.rewardValueOrID] then
				DebugPrint("Multiple Identical Loot Entries", "Loot id: " .. iter_111_1.rewardValueOrID .. " is already present in loot map. There should be a unique lootID to challengeID")
			else
				arg_111_2[iter_111_1.rewardValueOrID] = arg_111_1
			end
		end
	end
end

local function var_0_3(arg_112_0, arg_112_1)
	local var_112_0 = {}

	if not arg_112_0 then
		return var_112_0
	end

	local var_112_1 = LUI.Split(arg_112_0, "+", true)

	for iter_112_0 = 1, #var_112_1 do
		local var_112_2 = LUI.Split(var_112_1[iter_112_0], "@", true)
		local var_112_3 = {
			rewardType = arg_112_1,
			rewardValueOrID = var_112_2[1],
			rewardTarget = #var_112_2 > 1 and var_112_2[2] or nil
		}

		table.insert(var_112_0, var_112_3)
	end

	return var_112_0
end

local function var_0_4(arg_113_0, arg_113_1)
	local var_113_0 = {}
	local var_113_1 = 0

	assert(arg_113_0.amount, "Challenge " .. arg_113_0.id .. " requires at least one tier target")

	local var_113_2 = LUI.SplitIncludingEmpty(arg_113_0.amount, "|")
	local var_113_3 = arg_113_0.loot and LUI.SplitIncludingEmpty(arg_113_0.loot, "|") or {}
	local var_113_4 = arg_113_0.xp and LUI.SplitIncludingEmpty(arg_113_0.xp, "|") or {}

	for iter_113_0 = 1, #var_113_2 do
		local var_113_5 = var_0_3(var_113_3[iter_113_0], Challenge.Reward.LOOT)

		var_0_2(var_113_5, arg_113_0.id, arg_113_1)
		LUI.ConcatenateToTable(var_113_5, var_0_3(var_113_4[iter_113_0], Challenge.Reward.XP))

		local var_113_6 = {
			complete = false,
			progress = 0,
			tierTarget = tonumber(var_113_2[iter_113_0]),
			rewards = var_113_5
		}

		var_113_1 = var_113_6.tierTarget

		table.insert(var_113_0, var_113_6)
	end

	return var_113_0, var_113_1
end

local function var_0_5(arg_114_0)
	local var_114_0 = {}
	local var_114_1 = 0

	assert(arg_114_0.amount)

	local var_114_2 = LUI.SplitIncludingEmpty(arg_114_0.amount, "|")
	local var_114_3 = arg_114_0.loot and LUI.SplitIncludingEmpty(arg_114_0.loot, "|") or {}

	for iter_114_0 = 1, #var_114_2 do
		local var_114_4 = #var_114_3 > 0 and var_0_3(var_114_3[iter_114_0], Challenge.Reward.LOOT) or {}
		local var_114_5 = {
			complete = false,
			progress = 0,
			tierTarget = tonumber(var_114_2[iter_114_0]),
			rewards = var_114_4
		}

		var_114_1 = var_114_5.tierTarget

		table.insert(var_114_0, var_114_5)
	end

	return var_114_0, var_114_1
end

local function var_0_6(arg_115_0)
	if arg_115_0 == Challenge.Type.OPERATOR_UNLOCK then
		return true
	elseif arg_115_0 == Challenge.Type.GUN_UNLOCK then
		return true
	else
		return false
	end
end

local function var_0_7(arg_116_0, arg_116_1, arg_116_2, arg_116_3)
	local var_116_0 = CSV.ReadRow(arg_116_0, arg_116_1)

	if var_0_6(arg_116_2) then
		var_116_0.tiers, var_116_0.cumulativeProgressMax = var_0_5(var_116_0)
	else
		var_116_0.tiers, var_116_0.cumulativeProgressMax = var_0_4(var_116_0, arg_116_3)
	end

	var_116_0.cumulativeProgress = 0
	var_116_0.complete = false
	var_116_0.activeTier = 1
	var_116_0.topCompletedTier = 0
	var_116_0.unlockLevel = var_116_0.unlockLevel and #var_116_0.unlockLevel > 0 and tonumber(var_116_0.unlockLevel) or 0

	return var_116_0
end

function Challenge.GetChallenges(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = {}
	local var_117_1 = {}

	assert(arg_117_1)

	local var_117_2 = StringTable.BFHCAIIDA(arg_117_1.file)

	for iter_117_0 = 0, var_117_2 - 1 do
		if not arg_117_2 or arg_117_2(arg_117_1, iter_117_0) then
			local var_117_3 = var_0_7(arg_117_1, iter_117_0, arg_117_0, var_117_1)

			var_117_0[var_117_3.id] = var_117_3
		end
	end

	return var_117_0, var_117_1
end

function Challenge.GetChallengesNoProgress(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = Challenge.GetFileTableByType(arg_118_1)
	local var_118_1, var_118_2 = Challenge.GetChallenges(arg_118_1, var_118_0, arg_118_2)

	return LUI.TableToArray(var_118_1), var_118_2
end

function Challenge.GetChallengeByAEID(arg_119_0, arg_119_1)
	for iter_119_0, iter_119_1 in ipairs(arg_119_1) do
		if iter_119_1.id == arg_119_0 then
			return iter_119_1
		end
	end

	return nil
end

function Challenge.GetChallengeAndTierForLoot(arg_120_0, arg_120_1, arg_120_2)
	assert(arg_120_2 and arg_120_1)

	local var_120_0 = tostring(arg_120_0)
	local var_120_1 = arg_120_2[var_120_0]
	local var_120_2 = Challenge.GetChallengeByAEID(var_120_1, arg_120_1)

	if var_120_2 then
		for iter_120_0, iter_120_1 in ipairs(var_120_2.tiers) do
			for iter_120_2, iter_120_3 in ipairs(iter_120_1.rewards) do
				if var_120_0 == iter_120_3.rewardValueOrID then
					return var_120_2, iter_120_0
				end
			end
		end
	end

	return nil, nil
end

Challenge.ActivationTokens = nil

function Challenge.CacheActivationTokens()
	if Challenge.ActivationTokens == nil then
		Challenge.ActivationTokens = {}

		local var_121_0 = StringTable.BFHCAIIDA(CSV.activationTokens.file)

		for iter_121_0 = 0, var_121_0 - 1 do
			local var_121_1 = StringTable.CBGJCDIHCE(CSV.activationTokens.file, iter_121_0, CSV.activationTokens.cols.itemID)

			if var_121_1 ~= nil then
				local var_121_2 = tonumber(var_121_1)

				Challenge.ActivationTokens[var_121_2] = iter_121_0
			end
		end
	end
end

function Challenge.ConsumeActivationTokenForRow(arg_122_0, arg_122_1)
	local var_122_0 = StringTable.CBGJCDIHCE(CSV.activationTokens.file, arg_122_1, CSV.activationTokens.cols.itemID)
	local var_122_1 = StringTable.CBGJCDIHCE(CSV.activationTokens.file, arg_122_1, CSV.activationTokens.cols.achievementID)
	local var_122_2 = StringTable.CBGJCDIHCE(CSV.activationTokens.file, arg_122_1, CSV.activationTokens.cols.achievementName)
	local var_122_3 = StringTable.CBGJCDIHCE(CSV.activationTokens.file, arg_122_1, CSV.activationTokens.cols.eventID)
	local var_122_4 = tonumber(StringTable.CBGJCDIHCE(CSV.activationTokens.file, arg_122_1, CSV.activationTokens.cols.kind))
	local var_122_5 = StringTable.CBGJCDIHCE(CSV.activationTokens.file, arg_122_1, CSV.activationTokens.cols.sentinelItemID)
	local var_122_6

	if var_122_5 ~= nil and var_122_5 ~= "" then
		local var_122_7 = tonumber(var_122_5)

		if Loot.DEBEIFJEEG(arg_122_0, var_122_7) > 0 then
			return
		end
	end

	if var_122_1 ~= nil and var_122_1 ~= "" and var_122_3 ~= nil and var_122_3 ~= "" then
		DebugPrint("Consume token itemID: " .. var_122_0 .. ", activate achievement: " .. var_122_2 .. " with event: " .. var_122_3)
		OnlineChallenges.CBDFIIJJCB(arg_122_0, var_122_1, var_122_4, var_122_3)
	end
end

function Challenge.ActivateAchievementForNewItem(arg_123_0, arg_123_1)
	if Challenge.ActivationTokens == nil then
		Challenge.CacheActivationTokens()
	end

	if Challenge.ActivationTokens ~= nil then
		local var_123_0 = Challenge.ActivationTokens[arg_123_1]

		if var_123_0 ~= nil then
			Challenge.ConsumeActivationTokenForRow(arg_123_0, var_123_0)
		end
	end
end

function Challenge.FixupActivationTokens(arg_124_0)
	if Challenge.ActivationTokens == nil then
		Challenge.CacheActivationTokens()
	end

	if Challenge.ActivationTokens ~= nil then
		for iter_124_0, iter_124_1 in pairs(Challenge.ActivationTokens) do
			if Loot.DEBEIFJEEG(arg_124_0, iter_124_0) > 0 then
				local var_124_0 = iter_124_1

				Challenge.ConsumeActivationTokenForRow(arg_124_0, var_124_0)
			end
		end
	end
end
