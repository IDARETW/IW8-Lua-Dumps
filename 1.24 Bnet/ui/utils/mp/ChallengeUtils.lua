Challenge = Challenge or {}
Challenge.MaxElderChallenges = 100
Challenge.numSummaryItems = 3
Challenge.Type = {
	ELDER = 6,
	BATTLEPASS = 20,
	MISSION = 15,
	COMMUNITY = 10,
	HIDDEN = 28,
	BR_TUTORIAL = 29,
	PROGRESSION = 0,
	NOT_USED1 = 3,
	DAILY_CHURN_LOGIN = 21,
	BR = 4,
	TRIALS = 13,
	GAMES_OF_SUMMER = 33,
	MTX_CAMO = 24,
	MAX_NUM = 34,
	DAILY = 12,
	DAILY_LOGIN = 7,
	HAPPY_HOUR = 18,
	WEAPON_MASTERY = 31,
	SP_REWARD = 17,
	MIN_NUM = 0,
	BR_DAILY = 27,
	GUN_UNLOCK = 25,
	SEASON_REWARDS = 23,
	TOURNAMENT = 22,
	NOT_USED = 2,
	WEEKLY = 11,
	CP_REWARD = 19,
	NOT_USED2 = 1,
	GUNSMITH = 5,
	OPERATOR_UNLOCK = 8,
	CP_DAILY = 30,
	TOKENS = 14,
	STICKER_BOOK = 32,
	BR_WEEKLY = 26,
	KEY_EARNING = 9,
	RETICLE = 16
}
Challenge.TypeNameTable = {
	[Challenge.Type.PROGRESSION] = "CHALLENGE/PROGRESSION",
	[Challenge.Type.NOT_USED2] = "",
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
	[Challenge.Type.GAMES_OF_SUMMER] = ""
}
Challenge.Reward = {
	XP = 1,
	LOOT = 2
}
Challenge.Difficulty = {
	VETERAN = 3,
	HARDENED = 2,
	REGULAR = 1,
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
Challenge.StickerBookChallengeTypes = {
	[Challenge.MPCategory] = "MENU/MULTIPLAYER",
	[Challenge.BRCategory] = "CHALLENGE/WARZONE"
}
Challenge.ActivationCategoryMP = 0
Challenge.ActivationCategoryBR = 1
Challenge.ActivationCategoryCP = 4
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

function Challenge.GetFileTableByType(arg_1_0)
	if arg_1_0 == Challenge.Type.BR then
		return CSV.BRChallenges
	elseif arg_1_0 == Challenge.Type.GUNSMITH then
		return CSV.gunsmithChallenges
	elseif arg_1_0 == Challenge.Type.RETICLE then
		return CSV.reticleChallenges
	elseif arg_1_0 == Challenge.Type.ELDER then
		return CSV.elderChallenges
	elseif arg_1_0 == Challenge.Type.OPERATOR_UNLOCK then
		return CSV.operatorChallenges
	elseif arg_1_0 == Challenge.Type.COMMUNITY then
		return CSV.communityChallenges
	elseif arg_1_0 == Challenge.Type.WEEKLY then
		return CSV.weeklyChallenges
	elseif arg_1_0 == Challenge.Type.DAILY then
		return CSV.dailyChallenges
	elseif arg_1_0 == Challenge.Type.MISSION then
		return CSV.questChallenges
	elseif arg_1_0 == Challenge.Type.GUN_UNLOCK then
		return CSV.gunChallenges
	elseif arg_1_0 == Challenge.Type.BR_WEEKLY then
		return CSV.brWeeklyChallenges
	elseif arg_1_0 == Challenge.Type.BR_DAILY then
		return CSV.brDailyChallenges
	elseif arg_1_0 == Challenge.Type.CP_DAILY then
		return CSV.cpDailyChallenges
	elseif arg_1_0 == Challenge.Type.STICKER_BOOK then
		return CSV.callingCardMasterChallenges
	end

	return nil
end

function Challenge.GetTypeByLootID(arg_2_0)
	local var_2_0 = LOOT.GetTypeForID(arg_2_0)

	if var_2_0 == LOOT.itemTypes.OPERATOR then
		return Challenge.Type.OPERATOR_UNLOCK
	elseif var_2_0 == LOOT.itemTypes.RETICLE then
		return Challenge.Type.RETICLE
	elseif var_2_0 == LOOT.itemTypes.ATTACHMENT or var_2_0 == LOOT.itemTypes.CAMO then
		return Challenge.Type.GUNSMITH
	elseif var_2_0 == LOOT.itemTypes.WEAPON then
		return Challenge.Type.GUN_UNLOCK
	end

	return nil
end

function Challenge.GetTypeName(arg_3_0)
	if arg_3_0 > Challenge.Type.MAX_NUM or arg_3_0 < Challenge.Type.MIN_NUM then
		return
	end

	local var_3_0 = Challenge.TypeNameTable[arg_3_0]

	if var_3_0 and #var_3_0 > 0 then
		return Engine.CBBHFCGDIC(var_3_0)
	end

	assert(false, "We need to fill up challenge name def for type " .. arg_3_0)

	return nil
end

function Challenge.GetRef(arg_4_0, arg_4_1)
	if arg_4_1 > Challenge.Type.MAX_NUM or arg_4_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_4_0 = Challenge.GetFileTableByType(arg_4_1)

	if var_4_0 then
		return StringTable.DIFCHIGDFB(var_4_0.file, var_4_0.cols.id, arg_4_0, var_4_0.cols.ref)
	end
end

function Challenge.GetName(arg_5_0, arg_5_1)
	if arg_5_1 > Challenge.Type.MAX_NUM or arg_5_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_5_0 = Challenge.GetFileTableByType(arg_5_1)

	if var_5_0 then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_5_0.file, var_5_0.cols.id, arg_5_0, var_5_0.cols.name))
	end
end

function Challenge.GetNameFromRef(arg_6_0, arg_6_1)
	if arg_6_1 > Challenge.Type.MAX_NUM or arg_6_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_6_0 = Challenge.GetFileTableByType(arg_6_1)

	if var_6_0 then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_6_0.file, var_6_0.cols.ref, arg_6_0, var_6_0.cols.name))
	end
end

function Challenge.GetDesc(arg_7_0, arg_7_1)
	if arg_7_1 > Challenge.Type.MAX_NUM or arg_7_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_7_0 = Challenge.GetFileTableByType(arg_7_1)

	if var_7_0 then
		return StringTable.DIFCHIGDFB(var_7_0.file, var_7_0.cols.id, arg_7_0, var_7_0.cols.desc)
	end
end

function Challenge.GetAmount(arg_8_0, arg_8_1)
	if arg_8_1 > Challenge.Type.MAX_NUM or arg_8_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_8_0 = Challenge.GetFileTableByType(arg_8_1)

	if var_8_0 then
		return StringTable.DIFCHIGDFB(var_8_0.file, var_8_0.cols.id, arg_8_0, var_8_0.cols.amount)
	end
end

function Challenge.GetLootID(arg_9_0, arg_9_1)
	if arg_9_1 > Challenge.Type.MAX_NUM or arg_9_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_9_0 = Challenge.GetFileTableByType(arg_9_1)

	if var_9_0 then
		return StringTable.DIFCHIGDFB(var_9_0.file, var_9_0.cols.id, arg_9_0, var_9_0.cols.loot)
	end
end

function Challenge.GetXPReward(arg_10_0, arg_10_1)
	if arg_10_1 > Challenge.Type.MAX_NUM or arg_10_1 < Challenge.Type.MIN_NUM then
		return
	end

	local var_10_0 = Challenge.GetFileTableByType(arg_10_1)
	local var_10_1

	if var_10_0.cols.XPReward then
		var_10_1 = var_10_0.cols.XPReward
	elseif var_10_0.cols.XP then
		var_10_1 = var_10_0.cols.XP
	elseif var_10_0.cols.xp then
		var_10_1 = var_10_0.cols.xp
	end

	if var_10_0 and var_10_1 then
		return StringTable.DIFCHIGDFB(var_10_0.file, var_10_0.cols.id, arg_10_0, var_10_1)
	end

	return -1
end

function Challenge.GetSkinChallengeData(arg_11_0, arg_11_1)
	local var_11_0 = tostring(LOOT.GetItemID(LOOT.itemTypes.OPERATOR_SKIN, arg_11_1))
	local var_11_1 = CSV.questChallenges.cols
	local var_11_2 = StringTable.BFHCAIIDA(CSV.questChallenges.file)
	local var_11_3 = {
		id = var_11_1.id,
		name = var_11_1.name,
		desc = var_11_1.desc,
		loot = var_11_1.loot,
		codPoints = var_11_1.codPoints,
		amount = var_11_1.amount
	}

	for iter_11_0 = 0, var_11_2 - 1 do
		local var_11_4 = CSV.ReadRowWithColumns(CSV.questChallenges, iter_11_0, var_11_3)

		if var_11_4.loot == var_11_0 then
			var_11_4.progress = Quests.CCBJIDFAHE(arg_11_0, tonumber(var_11_4.id))
			var_11_4.challengeRowIndex = iter_11_0

			return var_11_4
		end
	end

	return nil
end

function Challenge.GetChallengeDataForSkinLootIds(arg_12_0, arg_12_1)
	local var_12_0 = CSV.questChallenges.cols
	local var_12_1 = StringTable.BFHCAIIDA(CSV.questChallenges.file)
	local var_12_2 = {
		id = var_12_0.id,
		name = var_12_0.name,
		desc = var_12_0.desc,
		loot = var_12_0.loot,
		codPoints = var_12_0.codPoints,
		amount = var_12_0.amount
	}
	local var_12_3 = {}

	for iter_12_0 = 0, var_12_1 - 1 do
		local var_12_4 = CSV.ReadRowWithColumns(CSV.questChallenges, iter_12_0, var_12_2)

		if arg_12_1[var_12_4.loot] ~= nil then
			var_12_4.progress = Quests.CCBJIDFAHE(arg_12_0, tonumber(var_12_4.id))
			var_12_4.challengeRowIndex = iter_12_0
			var_12_3[var_12_4.loot] = var_12_4
		end
	end

	return var_12_3
end

function Challenge.PopuplateCategoryInfo(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(CHALLENGE_CATEGORIES_LIST) do
		if iter_13_1.topChallenges == nil then
			local var_13_0 = Challenge.GetCategoryInfo(iter_13_0, arg_13_0)

			iter_13_1.totalProgress = var_13_0.progress
			iter_13_1.topChallenges = var_13_0.topChallenges
		end
	end
end

function Challenge.GetCategoryInfo(arg_14_0, arg_14_1)
	local var_14_0 = 0
	local var_14_1 = 0
	local var_14_2 = {}

	for iter_14_0, iter_14_1 in pairs(CHALLENGE_CATEGORIES_LIST[arg_14_0].subCategories) do
		local var_14_3 = CHALLENGE_CATEGORIES_LIST[arg_14_0].subCategories[iter_14_0].ref
		local var_14_4 = {
			CSV.allChallengesTable.file,
			CSV.allChallengesTable.altFile
		}

		for iter_14_2, iter_14_3 in ipairs(var_14_4) do
			for iter_14_4 = 0, StringTable.BFHCAIIDA(iter_14_3) do
				local var_14_5 = StringTable.CBGJCDIHCE(iter_14_3, iter_14_4, CSV.allChallengesTable.cols.ref)

				if var_14_5 ~= "" and StringTable.CBGJCDIHCE(iter_14_3, iter_14_4, CSV.allChallengesTable.cols.subCategory) == var_14_3 then
					local var_14_6 = CallingCardUtils.GetChallengeEntry(var_14_5, arg_14_1, iter_14_3)

					if not var_14_6.isMasterChallenge then
						if var_14_6.isCompleted then
							var_14_1 = var_14_1 + 1
						else
							var_14_2[#var_14_2 + 1] = {
								ref = var_14_5,
								progress = var_14_6.currentProgressPercent,
								allChallengesTable = iter_14_3
							}
						end

						var_14_0 = var_14_0 + 1
					end
				end
			end
		end
	end

	table.sort(var_14_2, function(arg_15_0, arg_15_1)
		return arg_15_0.progress > arg_15_1.progress
	end)

	local var_14_7 = var_14_1 / math.max(var_14_0, 1)
	local var_14_8 = {}

	for iter_14_5 = 1, 3 do
		if var_14_2[iter_14_5] then
			table.insert(var_14_8, var_14_2[iter_14_5])
		end
	end

	return {
		progress = var_14_7,
		topChallenges = var_14_8
	}
end

function Challenge.GetCategoryRefFromIndex(arg_16_0)
	assert(type(arg_16_0) == "number")
	assert(arg_16_0 >= 0)

	for iter_16_0, iter_16_1 in pairs(CHALLENGE_CATEGORIES_LIST) do
		if iter_16_1.index == arg_16_0 then
			return iter_16_0
		end
	end
end

function Challenge.GetCategoryName(arg_17_0)
	return CHALLENGE_CATEGORIES_LIST[arg_17_0].name
end

function Challenge.GetCategoryDesc(arg_18_0)
	return CHALLENGE_CATEGORIES_LIST[arg_18_0].desc
end

function Challenge.GetCategoryIndex(arg_19_0)
	return CHALLENGE_CATEGORIES_LIST[arg_19_0].index
end

function Challenge.GetLocalizedUnlockString(arg_20_0)
	local var_20_0 = StringTable.DIFCHIGDFB(CSV.challengeUnlockTable.file, CSV.challengeUnlockTable.cols.ref, arg_20_0, CSV.challengeUnlockTable.cols.ui_text)
	local var_20_1 = StringTable.DIFCHIGDFB(CSV.challengeUnlockTable.file, CSV.challengeUnlockTable.cols.ref, arg_20_0, CSV.challengeUnlockTable.cols.ui_text_var1)

	return Engine.CBBHFCGDIC(var_20_0, var_20_1)
end

local function var_0_0(arg_21_0, arg_21_1)
	if arg_21_0 and #arg_21_0 > 0 then
		local var_21_0 = StringTable.BJJBBCJGEJ(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_21_0)

		assert(var_21_0 >= 0)

		local var_21_1 = CSV.ReadRow(CSV.allChallengesTable, var_21_0)
		local var_21_2 = CSV.allChallengesTable.tiers.targetStart + CSV.allChallengesTable.numTierCols * arg_21_1

		var_21_1.currentTierMax = StringTable.CBGJCDIHCE(CSV.allChallengesTable.file, var_21_0, var_21_2)

		return var_21_1
	end

	return false
end

function Challenge.GetReticleChallengeData(arg_22_0)
	local var_22_0 = StringTable.BJJBBCJGEJ(CSV.reticleChallenges.file, CSV.reticleChallenges.cols.loot, arg_22_0)

	return CSV.ReadRow(CSV.reticleChallenges, var_22_0)
end

function Challenge.GetLocalizedChallengeDesc(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_2 or CSV.allChallengesTable.file
	local var_23_1 = StringTable.DIFCHIGDFB(var_23_0, CSV.allChallengesTable.cols.ref, arg_23_0, CSV.allChallengesTable.cols.desc)

	if var_23_1 == nil or var_23_1 == "" then
		var_23_1 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_23_0, CSV.allChallengesTable.cols.name)
	end

	local var_23_2 = StringTable.DIFCHIGDFB(var_23_0, CSV.allChallengesTable.cols.ref, arg_23_0, CSV.allChallengesTable.cols.displayParam)

	if not var_23_2 or var_23_2 == "" then
		var_23_2 = arg_23_1
	end

	if var_23_1 and var_23_1 ~= "" then
		if var_23_2 then
			return Engine.CBBHFCGDIC(var_23_1, var_23_2)
		else
			return Engine.CBBHFCGDIC(var_23_1)
		end
	end

	assert(false, "Unable to get localized description for challengeRef " .. arg_23_0)

	return ""
end

function Challenge.DebugGetChallengesData(arg_24_0)
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

function Challenge.GetLootReward(arg_25_0)
	local var_25_0 = {}
	local var_25_1 = LOOT.GetTypeForID(arg_25_0)

	if not var_25_1 then
		return
	end

	local var_25_2 = LOOT.GetItemRef(var_25_1, arg_25_0)

	if not var_25_2 or #var_25_2 <= 0 then
		return
	end

	var_25_0.type = var_25_1
	var_25_0.typeIcon = "icon_loot_category_0"
	var_25_0.typeName = Engine.CBBHFCGDIC("LOOT_MP/LOOT")
	var_25_0.ref = var_25_2
	var_25_0.name = LOOT.GetItemName(var_25_1, var_25_2, arg_25_0)
	var_25_0.image = LOOT.GetItemImage(var_25_1, var_25_2, arg_25_0)
	var_25_0.rarity = LOOT.GetItemQuality(var_25_1, var_25_2, arg_25_0)
	var_25_0.rarityImage = LOOT.GetRarityImage(var_25_0.rarity)
	var_25_0.rarityColor = LOOT.GetRarityColor(var_25_0.rarity)
	var_25_0.typeIconRendered = LOOT.GetRenderedLootIcon(var_25_0.rarity)
	var_25_0.lootItemID = arg_25_0

	return var_25_0
end

function Challenge.GetRewards(arg_26_0, arg_26_1)
	local var_26_0 = {}
	local var_26_1 = Challenge.GetXPReward(arg_26_0.id, arg_26_1)

	if var_26_1 and type(var_26_1) == "number" and var_26_1 < 0 then
		var_26_1 = ""
	end

	local var_26_2 = {
		typeIconRenderedScale = 0.4,
		type = "xp",
		image = "icon_xp_token",
		rarityImage = "icon_xp",
		typeIcon = "icon_xp",
		typeIconRendered = "icon_xp_token",
		name = Engine.CBBHFCGDIC("CHALLENGE/N_XP", var_26_1),
		typeName = Engine.CBBHFCGDIC("LOOT_MP/XP"),
		amount = var_26_1
	}

	table.insert(var_26_0, var_26_2)

	if arg_26_0.loot and #arg_26_0.loot > 0 then
		local var_26_3 = tonumber(arg_26_0.loot)
		local var_26_4 = Challenge.GetLootReward(var_26_3)

		assert(var_26_4, "Unable to get reward info for ID " .. var_26_3 .. ".  Item type or ref may be invalid.")

		if var_26_4 then
			var_26_4.itemID = var_26_3

			table.insert(var_26_0, var_26_4)
		end
	end

	return var_26_0
end

function Challenge.GetActiveMissionData(arg_27_0, arg_27_1)
	local var_27_0

	arg_27_1 = arg_27_1 or Challenge.ActivationCategoryMP

	local var_27_1 = Quests.BCIHEIDCGD(arg_27_0, arg_27_1)

	if var_27_1 and var_27_1 > 0 then
		local var_27_2 = tonumber(StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.id, tostring(var_27_1)))

		if not var_27_2 or var_27_2 < 0 then
			return
		end

		local var_27_3 = CSV.ReadRow({
			file = CSV.questChallenges.file,
			cols = CSV.questChallenges.cols
		}, var_27_2)

		if not var_27_3 then
			return
		end

		if var_27_3.category == "PS4" and not Engine.CIEGIACHAE() then
			return nil
		end

		var_27_3.amountEarned = Quests.CCBJIDFAHE(arg_27_0, var_27_1) or 0
		var_27_3.amountNeeded = tonumber(var_27_3.amount) or 1
		var_27_3.progress = tonumber(string.format("%.2f", var_27_3.amountEarned / var_27_3.amountNeeded))
		var_27_3.progress = LUI.clamp(var_27_3.progress, 0, 1)

		local var_27_4 = Engine.CFHBIHABCB(arg_27_0)

		var_27_3.unlocked = var_27_3.category == Challenge.BRCategory or var_27_4
		var_27_3.rewards = Challenge.GetRewards(var_27_3, Challenge.Type.MISSION)

		return var_27_3
	end
end

function Challenge.GetDailyChallenges(arg_28_0)
	local var_28_0 = {}
	local var_28_1 = ScheduledChallenges.DCIDHEEHJA(arg_28_0)

	if not var_28_1 then
		return nil
	end

	local var_28_2 = Engine.CFHBIHABCB(arg_28_0)
	local var_28_3 = StringTable.BFHCAIIDA(CSV.dailyChallenges.file)

	for iter_28_0 = 0, var_28_3 - 1 do
		local var_28_4 = StringTable.CBGJCDIHCE(CSV.dailyChallenges.file, iter_28_0, CSV.dailyChallenges.cols.id)

		if var_28_1[var_28_4] ~= nil then
			local var_28_5 = CSV.ReadRow(CSV.dailyChallenges, iter_28_0)

			var_28_5.amountEarned = var_28_1[var_28_4]
			var_28_5.amountNeeded = tonumber(var_28_5.amount)
			var_28_5.progress = var_28_5.amountEarned / var_28_5.amountNeeded
			var_28_5.isComplete = var_28_5.amountEarned == var_28_5.amountNeeded
			var_28_5.rewards = Challenge.GetRewards(var_28_5, Challenge.Type.DAILY)
			var_28_5.unlocked = var_28_2
			var_28_5.type = Challenge.Type.DAILY

			table.insert(var_28_0, var_28_5)
		end
	end

	Challenge.SortByNearestComplete(var_28_0)

	return var_28_0
end

function Challenge.GetBRDailyChallenges(arg_29_0)
	local var_29_0 = {}
	local var_29_1 = ScheduledChallenges.JCAAACBBI(arg_29_0)

	if not var_29_1 then
		return nil
	end

	local var_29_2 = StringTable.BFHCAIIDA(CSV.brDailyChallenges.file)

	for iter_29_0 = 0, var_29_2 - 1 do
		local var_29_3 = StringTable.CBGJCDIHCE(CSV.brDailyChallenges.file, iter_29_0, CSV.brDailyChallenges.cols.id)

		if var_29_1[var_29_3] ~= nil then
			local var_29_4 = CSV.ReadRow(CSV.brDailyChallenges, iter_29_0)

			var_29_4.amountEarned = var_29_1[var_29_3]
			var_29_4.amountNeeded = tonumber(var_29_4.amount)
			var_29_4.progress = var_29_4.amountEarned / var_29_4.amountNeeded
			var_29_4.isComplete = var_29_4.amountEarned == var_29_4.amountNeeded
			var_29_4.rewards = Challenge.GetRewards(var_29_4, Challenge.Type.BR_DAILY)
			var_29_4.unlocked = true
			var_29_4.type = Challenge.Type.BR_DAILY

			table.insert(var_29_0, var_29_4)
		end
	end

	Challenge.SortByNearestComplete(var_29_0)

	return var_29_0
end

function Challenge.GetCPDailyChallenges(arg_30_0)
	local var_30_0 = {}
	local var_30_1 = ScheduledChallenges.DCBCJDCGGB(arg_30_0)

	if not var_30_1 then
		return nil
	end

	local var_30_2 = Engine.CFHBIHABCB(arg_30_0)
	local var_30_3 = StringTable.BFHCAIIDA(CSV.cpDailyChallenges.file)

	for iter_30_0 = 0, var_30_3 - 1 do
		local var_30_4 = StringTable.CBGJCDIHCE(CSV.cpDailyChallenges.file, iter_30_0, CSV.cpDailyChallenges.cols.id)

		if var_30_1[var_30_4] ~= nil then
			local var_30_5 = CSV.ReadRow(CSV.cpDailyChallenges, iter_30_0)

			var_30_5.amountEarned = var_30_1[var_30_4]
			var_30_5.amountNeeded = tonumber(var_30_5.amount)
			var_30_5.progress = var_30_5.amountEarned / var_30_5.amountNeeded
			var_30_5.isComplete = var_30_5.amountEarned == var_30_5.amountNeeded
			var_30_5.rewards = Challenge.GetRewards(var_30_5, Challenge.Type.CP_DAILY)
			var_30_5.unlocked = var_30_2
			var_30_5.type = Challenge.Type.CP_DAILY

			table.insert(var_30_0, var_30_5)
		end
	end

	Challenge.SortByNearestComplete(var_30_0)

	return var_30_0
end

function Challenge.GetCombinedDailyChallenges(arg_31_0)
	local var_31_0 = Challenge.GetDailyChallenges(arg_31_0) or {}

	if CONDITIONS.IsMagmaGameMode() and var_31_0 then
		assert(type(var_31_0) == "table")

		local var_31_1 = Challenge.GetBRDailyChallenges(arg_31_0)

		if not Engine.CFHBIHABCB(arg_31_0) then
			return var_31_1
		end

		if var_31_1 and #var_31_1 > 0 then
			for iter_31_0, iter_31_1 in ipairs(var_31_1) do
				table.insert(var_31_0, 1, iter_31_1)
			end
		end
	elseif CONDITIONS.IsThirdGameMode() and var_31_0 then
		assert(type(var_31_0) == "table")

		local var_31_2 = Challenge.GetCPDailyChallenges(arg_31_0)

		if var_31_2 and #var_31_2 > 0 then
			for iter_31_2, iter_31_3 in ipairs(var_31_2) do
				table.insert(var_31_0, 1, iter_31_3)
			end
		end
	end

	return var_31_0
end

function Challenge.SortByNearestComplete(arg_32_0)
	table.sort(arg_32_0, function(arg_33_0, arg_33_1)
		if arg_33_0.progress > arg_33_1.progress then
			return arg_33_0.progress ~= 1
		elseif arg_33_0.progress == arg_33_1.progress then
			return tonumber(arg_33_0.id) < tonumber(arg_33_1.id)
		else
			return arg_33_1.progress == 1
		end
	end)
end

function Challenge.SortByLength(arg_34_0)
	table.sort(arg_34_0, function(arg_35_0, arg_35_1)
		return tonumber(arg_35_0.length) > tonumber(arg_35_1.length)
	end)
end

function Challenge.SortMissionChallenges(arg_36_0)
	table.sort(arg_36_0, function(arg_37_0, arg_37_1)
		if arg_37_0.isActive or arg_37_1.isActive then
			return arg_37_0.isActive
		elseif arg_37_0.progress > arg_37_1.progress then
			return arg_37_0.progress ~= 1
		elseif arg_37_0.progress == arg_37_1.progress then
			return arg_37_0.id < arg_37_1.id
		else
			return arg_37_1.progress == 1
		end
	end)
end

function Challenge.SetupDailyResetTimer(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = Dvar.BJJCJHDBII("MMLQOSOMTQ")
	local var_38_1 = 3600
	local var_38_2 = var_38_1 * 24
	local var_38_3 = 1000
	local var_38_4 = var_38_0 * var_38_1

	local function var_38_5()
		local var_39_0 = var_38_2 - (Engine.DEIDGHDBHD() - var_38_4) % var_38_2
		local var_39_1 = Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_39_0))

		if var_39_0 <= var_38_1 then
			if not arg_38_0._timerAlert then
				ACTIONS.AnimateSequence(arg_38_0, "Warning")

				arg_38_0._timerAlert = true
			end
		else
			arg_38_0._timerAlert = false

			ACTIONS.AnimateSequence(arg_38_0, "Normal")
		end

		arg_38_1:setText(Engine.CBBHFCGDIC(arg_38_2 and "CHALLENGE/RESETS_IN_X" or "CHALLENGE/RESET_TIME", var_39_1))
	end

	local var_38_6 = LUI.UITimer.new({
		event = "update_reset_time",
		interval = var_38_3
	})

	var_38_6.id = "dayResetTimer"

	arg_38_0:addElement(var_38_6)
	arg_38_0:addAndCallEventHandler("update_reset_time", var_38_5)
end

function Challenge.SetupSeasonEndsTimer(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = 1000
	local var_40_1 = SEASON.SeasonEndEpochTime()

	local function var_40_2()
		local var_41_0 = Engine.CCEJJCCDEG(tostring(var_40_1))

		if not var_41_0 or var_41_0 < 0 then
			var_41_0 = 0
		end

		local var_41_1 = Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_41_0))

		arg_40_1:setText(Engine.CBBHFCGDIC(arg_40_2, var_41_1))
	end

	local var_40_3 = LUI.UITimer.new({
		event = "update_time_to_season",
		interval = var_40_0
	})

	var_40_3.id = "seasonTimer"

	arg_40_0:addElement(var_40_3)
	arg_40_0:addAndCallEventHandler("update_time_to_season", var_40_2)
end

function Challenge.GenerateChecksum(arg_42_0)
	local var_42_0 = ScheduledChallenges.DCIDHEEHJA(arg_42_0)

	if not var_42_0 then
		return 0
	end

	local var_42_1 = 0

	for iter_42_0, iter_42_1 in pairs(var_42_0) do
		var_42_1 = var_42_1 + tonumber(iter_42_0)
	end

	if CONDITIONS.IsMagmaEnabled() then
		local var_42_2 = ScheduledChallenges.JCAAACBBI(arg_42_0)

		if var_42_2 then
			for iter_42_2, iter_42_3 in pairs(var_42_2) do
				var_42_1 = var_42_1 + tonumber(iter_42_2)
			end
		end
	end

	return var_42_1
end

function Challenge.ShouldShowDailyPopup(arg_43_0)
	if Engine.DGEFGAJIB() ~= CoD.PlayMode.None then
		return false
	end

	if Dvar.IBEGCHEFE("MKSNTLMSQR") then
		return true
	end

	if not Dvar.IBEGCHEFE("MLKSPNRQRL") or Dvar.IBEGCHEFE("unattended") then
		return false
	end

	local var_43_0 = PlayerData.BFFBGAJGD(arg_43_0, CoD.StatsGroup.NonGame)

	if not var_43_0.dailyChallengesPopupChecksum then
		return false
	end

	local var_43_1 = tonumber(var_43_0.dailyChallengesPopupChecksum:get())
	local var_43_2 = Challenge.GenerateChecksum(arg_43_0)
	local var_43_3 = var_43_2 ~= 0 and var_43_2 ~= var_43_1
	local var_43_4 = Challenge.GetDailyChallenges(arg_43_0)

	if not Dvar.IBEGCHEFE("LPKNOPTMLP") and not Engine.CFHBIHABCB(arg_43_0) then
		var_43_3 = var_43_3 and var_43_4 and #var_43_4 > 0
	elseif CONDITIONS.IsMagmaEnabled() then
		local var_43_5 = Challenge.GetBRDailyChallenges(arg_43_0)

		var_43_3 = var_43_3 and (var_43_4 and #var_43_4 > 0 or var_43_5 and #var_43_5 > 0)
	else
		var_43_3 = var_43_3 and var_43_4 and #var_43_4 > 0
	end

	return var_43_3
end

function Challenge.TryOpenDailyPopup(arg_44_0)
	if Challenge.ShouldShowDailyPopup(arg_44_0) then
		if CONDITIONS.IsMagmaEnabled() and (Dvar.IBEGCHEFE("LPKNOPTMLP") or Engine.CFHBIHABCB(arg_44_0)) then
			local var_44_0 = Challenge.GetDailyChallenges(arg_44_0)
			local var_44_1 = Challenge.GetBRDailyChallenges(arg_44_0)
			local var_44_2 = "MagmaDailyPopup"
			local var_44_3 = {}

			if not var_44_0 or var_44_0 and #var_44_0 == 0 or not var_44_1 or var_44_1 and #var_44_1 == 0 then
				if var_44_1 and #var_44_1 > 0 then
					var_44_3.GetChallengesFunction = Challenge.GetBRDailyChallenges
				end

				var_44_2 = "ChallengesDailyPopup"
			end

			LUI.FlowManager.RequestPopupMenu(nil, var_44_2, true, arg_44_0, false, var_44_3, nil, false, true)

			return var_44_2
		else
			LUI.FlowManager.RequestPopupMenu(nil, "ChallengesDailyPopup", true, arg_44_0, false, {}, nil, false, true)

			return "ChallengesDailyPopup"
		end
	end
end

function Challenge.SetSeenDailyPopup(arg_45_0)
	if Dvar.IBEGCHEFE("MKSNTLMSQR") then
		return
	end

	local var_45_0 = Challenge.GenerateChecksum(arg_45_0)
	local var_45_1 = PlayerData.BFFBGAJGD(arg_45_0, CoD.StatsGroup.NonGame)

	if not var_45_1.dailyChallengesPopupChecksum then
		return
	end

	var_45_1.dailyChallengesPopupChecksum:set(var_45_0)
end

function Challenge.UpdateDailyPopupEnabled()
	Dvar.DHEGHJJJHI("MLKSPNRQRL", Engine.EAAHGICFBD())
end

function Challenge.IsGunsmithCamoChallenge(arg_47_0, arg_47_1)
	local var_47_0 = Challenge.GetLootID(arg_47_0, arg_47_1)

	if var_47_0 and #var_47_0 > 0 then
		local var_47_1 = split(var_47_0, "|")
		local var_47_2 = tonumber(var_47_1[1])

		if var_47_2 and var_47_2 >= LOOT.CamoIDsMin and var_47_2 <= LOOT.CamoIDsMax then
			return true
		end
	end

	return false
end

function Challenge.GetQuestStageByRef(arg_48_0)
	local var_48_0 = "ch_quest"
	local var_48_1 = "_stage"
	local var_48_2, var_48_3 = string.find(arg_48_0, var_48_0)
	local var_48_4, var_48_5 = string.find(arg_48_0, var_48_1)
	local var_48_6 = string.sub(arg_48_0, var_48_3 + 1, var_48_4 - 1)
	local var_48_7 = string.sub(arg_48_0, var_48_5 + 1, #arg_48_0)

	return tonumber(var_48_6), tonumber(var_48_7)
end

function Challenge.GetMissionDataFromRowNum(arg_49_0, arg_49_1, arg_49_2)
	if not arg_49_1 or arg_49_1 < 0 then
		return
	end

	local var_49_0 = CSV.ReadRow({
		file = CSV.questChallenges.file,
		cols = CSV.questChallenges.cols
	}, arg_49_1)

	if not var_49_0 then
		return
	end

	var_49_0.amountEarned = Quests.CCBJIDFAHE(arg_49_0, arg_49_2) or 0
	var_49_0.amountNeeded = tonumber(var_49_0.amount) or 1
	var_49_0.progress = tonumber(string.format("%.2f", var_49_0.amountEarned / var_49_0.amountNeeded))
	var_49_0.rewards = Challenge.GetRewards(var_49_0, Challenge.Type.MISSION)

	return var_49_0
end

function Challenge.GetMissionDataByRef(arg_50_0, arg_50_1)
	local var_50_0 = tonumber(StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_50_1))

	if var_50_0 and var_50_0 >= 0 then
		local var_50_1 = StringTable.CBGJCDIHCE(CSV.questChallenges.file, var_50_0, CSV.questChallenges.cols.id)

		return Challenge.GetMissionDataFromRowNum(arg_50_0, var_50_0, var_50_1)
	end
end

function Challenge.GetNextMissionDataInChain(arg_51_0, arg_51_1)
	if arg_51_1.challenges then
		local var_51_0 = tonumber(StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.ref, arg_51_1.challenges))

		if var_51_0 and var_51_0 >= 0 then
			local var_51_1 = StringTable.CBGJCDIHCE(CSV.questChallenges.file, var_51_0, CSV.questChallenges.cols.id)

			return Challenge.GetMissionDataFromRowNum(arg_51_0, var_51_0, var_51_1)
		end
	end
end

function Challenge.GetMissionDataByID(arg_52_0, arg_52_1)
	local var_52_0 = tonumber(StringTable.BJJBBCJGEJ(CSV.questChallenges.file, CSV.questChallenges.cols.id, tostring(arg_52_1)))
	local var_52_1 = Challenge.GetMissionDataFromRowNum(arg_52_0, var_52_0, arg_52_1)
end

function Challenge.GetMissionSeason(arg_53_0, arg_53_1)
	return StringTable.DIFCHIGDFB(CSV.questChallenges.file, CSV.questChallenges.cols.id, arg_53_1, CSV.questChallenges.cols.season)
end

function Challenge.GetQuestsForMissionChallenges(arg_54_0, arg_54_1)
	local var_54_0 = {}
	local var_54_1 = {}
	local var_54_2 = Dvar.CFHDGABACF("MKSNRSOQSS") or 0
	local var_54_3 = StringTable.BFHCAIIDA(CSV.questChallenges.file)

	for iter_54_0 = 0, var_54_3 - 1 do
		local var_54_4 = CSV.ReadRow(CSV.questChallenges, iter_54_0)
		local var_54_5 = split(var_54_4.ref, "_")

		var_54_4.rowIndex = iter_54_0
		var_54_4.unlocked = var_54_4.category == Challenge.BRCategory or Engine.CFHBIHABCB(arg_54_0)

		local var_54_6
		local var_54_7

		if var_54_4.category == Challenge.Intel then
			var_54_6 = Challenge.GetIntelSeasonWeek(var_54_4.ref)
			var_54_7 = tonumber(var_54_5[#var_54_5])
			var_54_4.isIntel = true
			var_54_4.intelSeasonWeek = var_54_6
		else
			var_54_6 = split(var_54_5[2], "quest")[1]
			var_54_7 = tonumber(split(var_54_5[3], "stage")[1])
		end

		local var_54_8 = true

		if arg_54_1 and #arg_54_1 > 0 then
			for iter_54_1 = 1, #arg_54_1 do
				var_54_8 = var_54_4.category == arg_54_1[iter_54_1]

				if var_54_8 then
					break
				end
			end
		end

		if var_54_4.category == Challenge.Intel and var_54_4.intelSeasonWeek ~= "" and var_54_2 and var_54_2 > 0 and var_54_2 < tonumber(var_54_4.intelSeasonWeek) then
			var_54_8 = false
		end

		if var_54_8 then
			if not var_54_0[var_54_6] then
				var_54_0[var_54_6] = {}

				table.insert(var_54_1, var_54_6)
			end

			table.insert(var_54_0[var_54_6], var_54_7, var_54_4)
		end
	end

	for iter_54_2, iter_54_3 in ipairs(var_54_1) do
		local var_54_9 = var_54_0[iter_54_3]
		local var_54_10 = #var_54_9

		for iter_54_4 = 1, var_54_10 do
			if not var_54_9[iter_54_4] then
				table.remove(var_54_9, iter_54_4)

				iter_54_4 = iter_54_4 - 1
				var_54_10 = var_54_10 - 1
			end
		end
	end

	return {
		quests = var_54_0,
		questIDs = var_54_1
	}
end

function Challenge.IsMissionCurrent(arg_55_0, arg_55_1)
	local var_55_0 = SEASON.GetCurrentSeason()
	local var_55_1 = Challenge.GetMissionSeason(arg_55_0, arg_55_1)

	if #var_55_1 > 0 then
		return tonumber(var_55_1) == var_55_0
	end
end

function Challenge.GetMissionsForQuests(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	local var_56_0 = {}
	local var_56_1 = arg_56_1.quests
	local var_56_2 = arg_56_1.questIDs
	local var_56_3 = arg_56_2 or SEASON.GetCurrentSeason()

	for iter_56_0, iter_56_1 in ipairs(var_56_2) do
		local var_56_4 = #var_56_1[iter_56_1]
		local var_56_5 = var_56_1[iter_56_1][var_56_4]
		local var_56_6 = Challenge.GetMissionSeason(arg_56_0, var_56_1[iter_56_1][1].id)
		local var_56_7 = false

		if #var_56_6 > 0 then
			var_56_7 = tonumber(var_56_6) == arg_56_2
		end

		if #var_56_6 > 0 and (var_56_3 >= tonumber(var_56_6) or Dvar.IBEGCHEFE("MRMSRLKSPT")) and (not arg_56_2 or var_56_7) then
			var_56_5.season = tonumber(var_56_6)

			if var_56_1[iter_56_1][1].category == Challenge.Operator then
				local var_56_8 = BATTLEPASS.GetMissionLevel(var_56_1[iter_56_1][1].ref, var_56_3)

				if var_56_8 > BATTLEPASS.GetTier(arg_56_0, var_56_3) or not BATTLEPASS.IsOwned(arg_56_0, var_56_3) then
					var_56_5.isBattlePassLocked = true
					var_56_5.battlePassLevelToUnlock = var_56_8
				else
					var_56_5.isBattlePassLocked = false
				end
			end

			if not arg_56_4 or arg_56_4(var_56_1[iter_56_1], var_56_5) then
				var_56_5.rewards = Challenge.GetRewards(var_56_5, Challenge.Type.MISSION)
				var_56_5.isPS4Exclusive = var_56_1[iter_56_1][1].category == Challenge.PS4Category

				local var_56_9 = false

				if var_56_4 == 1 then
					var_56_5.firstIncompleteQuestID = tonumber(var_56_1[iter_56_1][1].id)
					var_56_5.amountEarned = Quests.CCBJIDFAHE(arg_56_0, tonumber(var_56_1[iter_56_1][1].id))
					var_56_5.amountNeeded = tonumber(var_56_1[iter_56_1][1].amount)
					var_56_5.amountEarned = math.min(var_56_5.amountEarned, var_56_5.amountNeeded)
					var_56_5.progress = var_56_5.amountEarned / var_56_5.amountNeeded
					var_56_5.complete = var_56_5.amountEarned == var_56_5.amountNeeded
				else
					local var_56_10 = {}
					local var_56_11 = false
					local var_56_12 = false
					local var_56_13 = 0

					if var_56_5.isIntel and var_56_5.intelSeasonWeek then
						var_56_9 = Challenge.IsIntelMissionActive(var_56_5.intelSeasonWeek)
					end

					for iter_56_2 = var_56_4, 1, -1 do
						local var_56_14 = var_56_1[iter_56_1][iter_56_2]
						local var_56_15 = var_56_14.isIntel
						local var_56_16 = tonumber(var_56_1[iter_56_1][iter_56_2].amount)

						if not var_56_15 then
							local var_56_17 = Quests.CCBJIDFAHE(arg_56_0, tonumber(var_56_1[iter_56_1][iter_56_2].id))
							local var_56_18 = math.min(var_56_17, var_56_16)

							if not var_56_11 and not var_56_12 and var_56_18 < var_56_16 then
								var_56_5.firstIncompleteQuestID = tonumber(var_56_1[iter_56_1][iter_56_2].id)
							else
								if iter_56_2 == var_56_4 then
									var_56_11 = true
									var_56_13 = var_56_4
								elseif not var_56_11 then
									var_56_13 = var_56_13 + 1
								end

								var_56_18 = var_56_16
								var_56_12 = true
							end

							var_56_14.amountEarned = var_56_18
						else
							var_56_14.intelComplete = false

							if Challenge.IsInGameIntel(var_56_14.ref) then
								var_56_14.intelComplete = Challenge.HasCompletedInGameIntel(arg_56_0, var_56_14.ref)
							else
								var_56_14.intelComplete = Challenge.HasCompletedFrontendIntel(arg_56_0, var_56_14.ref)
							end

							var_56_14.amountEarned = 0

							if var_56_14.intelComplete then
								var_56_14.amountEarned = var_56_16
								var_56_13 = var_56_13 + 1

								if var_56_13 == var_56_4 then
									var_56_11 = true
								end
							end
						end

						if not var_56_5.isActive then
							if not var_56_15 then
								var_56_5.isActive = arg_56_3 and arg_56_3(var_56_14)
							else
								var_56_5.isActive = var_56_9
							end
						end

						if not var_56_5.isIntel then
							var_56_5.isIntel = var_56_14.isIntel
						end

						if var_56_5.isIntel and not var_56_5.isIntelUnlocked then
							var_56_5.isIntelUnlocked = var_56_9
						end

						var_56_14.amountNeeded = var_56_16
						var_56_14.progress = var_56_14.amountEarned / var_56_14.amountNeeded
						var_56_14.rewards = Challenge.GetRewards(var_56_14, Challenge.Type.MISSION)
						var_56_10[iter_56_2] = var_56_14
					end

					if var_56_5.isIntel then
						if not var_56_11 and var_56_13 > 0 then
							var_56_13 = var_56_13 - 1
						end

						var_56_5.isActive = var_56_5.isActive and not var_56_11
					end

					var_56_5.complete = var_56_11 == true
					var_56_5.progress = var_56_13 / var_56_4
					var_56_5.objectives = var_56_10
					var_56_5.numObjectivesComplete = var_56_13
				end

				if not var_56_5.isPS4Exclusive or Engine.CIEGIACHAE() then
					table.insert(var_56_0, var_56_5)
				end
			end
		end
	end

	return var_56_0
end

function Challenge.GetDifficulty(arg_57_0, arg_57_1)
	local var_57_0 = tonumber(Challenge.GetXPReward(arg_57_0, arg_57_1))

	if var_57_0 == nil then
		return Challenge.Difficulty.NONE
	end

	local var_57_1 = Dvar.CFHDGABACF("MSORRSMRQM")
	local var_57_2 = Dvar.CFHDGABACF("NTPLTMKQOT")
	local var_57_3 = Dvar.CFHDGABACF("PQOTPPRPP")

	if var_57_1 and var_57_2 and var_57_3 then
		if var_57_0 <= var_57_1 then
			return Challenge.Difficulty.REGULAR
		elseif var_57_0 <= var_57_2 then
			return Challenge.Difficulty.HARDENED
		elseif var_57_0 <= var_57_3 then
			return Challenge.Difficulty.VETERAN
		end
	else
		return Challenge.Difficulty.NONE
	end
end

function Challenge.GetChallengeCompletionStatus(arg_58_0)
	local var_58_0 = 0
	local var_58_1 = false

	if arg_58_0 and #arg_58_0 > 0 then
		for iter_58_0 = 1, #arg_58_0 do
			local var_58_2 = arg_58_0[iter_58_0]

			if var_58_2 and var_58_2.isComplete then
				var_58_0 = var_58_0 + 1
			end
		end

		var_58_1 = var_58_0 == #arg_58_0
	end

	return var_58_0, var_58_1
end

function Challenge.GetWeeklyChallenges(arg_59_0, arg_59_1)
	assert(arg_59_1 == Challenge.Type.WEEKLY or arg_59_1 == Challenge.Type.BR_WEEKLY)

	local var_59_0
	local var_59_1
	local var_59_2 = {}
	local var_59_3
	local var_59_4 = Engine.DEIDGHDBHD() + Dvar.CFHDGABACF("MNRLLKTLPT")
	local var_59_5 = Dvar.CFHDGABACF("TPQRKMRLN")
	local var_59_6 = SEASON.GetCurrentSeason()
	local var_59_7 = 604800

	if arg_59_1 == Challenge.Type.WEEKLY then
		var_59_0 = CSV.weeklyChallenges
		var_59_1 = ScheduledChallenges.EBFEIJBCEC(arg_59_0)
	elseif arg_59_1 == Challenge.Type.BR_WEEKLY then
		var_59_0 = CSV.brWeeklyChallenges
		var_59_1 = ScheduledChallenges.BCFEBEHEBI(arg_59_0)
	end

	local var_59_8 = StringTable.BFHCAIIDA(var_59_0.file)

	for iter_59_0 = 0, var_59_8 - 1 do
		local var_59_9 = CSV.ReadRow(var_59_0, iter_59_0)

		if tonumber(var_59_9.season) == var_59_6 then
			local var_59_10 = split(var_59_9.ref, "_")
			local var_59_11

			if arg_59_1 == Challenge.Type.WEEKLY then
				var_59_11 = tonumber(var_59_10[5])
			elseif arg_59_1 == Challenge.Type.BR_WEEKLY then
				var_59_11 = tonumber(var_59_10[6])
			end

			local var_59_12 = tonumber(var_59_9.start)

			if var_59_5 and var_59_5 > 0 then
				var_59_12 = var_59_5 + (var_59_11 - 1) * var_59_7
			end

			local var_59_13 = tonumber(var_59_9.length)
			local var_59_14 = SEASON.SeasonEndEpochTime()

			if var_59_14 and var_59_14 > 0 then
				var_59_13 = var_59_14
			end

			local var_59_15

			var_59_15 = var_59_12 >= 0 and var_59_12 <= var_59_4 and var_59_4 <= var_59_13

			local var_59_16 = var_59_4 < var_59_12

			if not var_59_2[var_59_11] then
				var_59_2[var_59_11] = {}
				var_59_2[var_59_11].isWeekLocked = var_59_16
				var_59_2[var_59_11].weekStartTime = var_59_12
				var_59_2[var_59_11].numComplete = 0
				var_59_2.numWeeks = var_59_2.numWeeks and var_59_2.numWeeks + 1 or 1
			end

			if not var_59_16 and (not var_59_3 or var_59_3 < var_59_11) then
				var_59_3 = var_59_11
			end

			var_59_9.amountNeeded = tonumber(var_59_9.amount)

			assert(var_59_9.amountNeeded and var_59_9.amountNeeded > 0)

			if var_59_9.amountNeeded and var_59_9.amountNeeded > 0 then
				if var_59_1 and var_59_1[var_59_9.id] then
					var_59_9.amountEarned = var_59_1[var_59_9.id]
				else
					var_59_9.amountEarned = 0
				end

				var_59_9.progress = var_59_9.amountEarned / var_59_9.amountNeeded
				var_59_9.progress = LUI.clamp(var_59_9.progress, 0, 1)
				var_59_9.isComplete = var_59_9.amountEarned >= var_59_9.amountNeeded
				var_59_9.type = arg_59_1
				var_59_9.rewards = Challenge.GetRewards(var_59_9, var_59_9.type)

				if arg_59_1 == Challenge.Type.WEEKLY then
					var_59_9.unlocked = Engine.CFHBIHABCB(arg_59_0) and not var_59_16
				elseif arg_59_1 == Challenge.Type.BR_WEEKLY then
					var_59_9.unlocked = not var_59_16
				end

				table.insert(var_59_2[var_59_11], var_59_9)
			end
		end
	end

	if var_59_2 and var_59_2.numWeeks then
		for iter_59_1 = 1, var_59_2.numWeeks do
			local var_59_17 = var_59_2[iter_59_1]

			if var_59_17 then
				Challenge.SortByNearestComplete(var_59_17)
			end
		end
	end

	return var_59_2, var_59_3
end

function Challenge.GetCurrentWeekChallengesData(arg_60_0, arg_60_1, arg_60_2)
	local function var_60_0(arg_61_0)
		if arg_61_0 then
			for iter_61_0 = 1, #arg_61_0 do
				local var_61_0 = arg_61_0[iter_61_0]

				if var_61_0 and var_61_0.progress and var_61_0.progress > 0 then
					return true
				end
			end
		end

		return false
	end

	local var_60_1 = var_60_0(arg_60_1)
	local var_60_2 = var_60_0(arg_60_2)
	local var_60_3 = {}
	local var_60_4 = false

	if CONDITIONS.IsMagmaGameMode() then
		local var_60_5 = #arg_60_2
		local var_60_6 = Engine.CFHBIHABCB(arg_60_0)

		if var_60_6 then
			var_60_4 = var_60_2 or var_60_1
			var_60_5 = var_60_4 and #arg_60_2 or 5
		end

		for iter_60_0 = 1, var_60_5 do
			table.insert(var_60_3, arg_60_2[iter_60_0])
		end

		if var_60_6 or Dvar.IBEGCHEFE("MMOTQROLKT") then
			for iter_60_1 = 1, var_60_5 do
				table.insert(var_60_3, arg_60_1[iter_60_1])
			end
		end
	elseif CONDITIONS.IsMagmaEnabled() then
		var_60_4 = var_60_2 or var_60_1

		local var_60_7 = var_60_4 and #arg_60_1 or 5

		for iter_60_2 = 1, var_60_7 do
			table.insert(var_60_3, arg_60_1[iter_60_2])
		end

		for iter_60_3 = 1, var_60_7 do
			table.insert(var_60_3, arg_60_2[iter_60_3])
		end
	else
		for iter_60_4 = 1, #arg_60_1 do
			table.insert(var_60_3, arg_60_1[iter_60_4])
		end
	end

	if var_60_4 then
		Challenge.SortByNearestComplete(var_60_3)
	end

	return var_60_3
end

function Challenge.FocusTab(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_0:GetCurrentMenu()
	local var_62_1 = arg_62_1.qualifier ~= "keyboard" and arg_62_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

	if var_62_0.MPTabsMenu then
		local var_62_2 = var_62_0.MPTabsMenu:GetTabIndexByWidgetName("ChallengeMenu") - 1

		var_62_0.MPTabsMenu.Tabs:FocusTab(arg_62_1.controller, var_62_2, var_62_1)
	end
end

function Challenge.IsIntelMissionActive(arg_63_0)
	assert(arg_63_0)

	if not arg_63_0 then
		return false
	end

	return (Dvar.CFHDGABACF("LSQRKOSLTP") or 0) >= tonumber(arg_63_0)
end

function Challenge.HasCompletedIntelMission(arg_64_0, arg_64_1)
	local var_64_0 = PlayerData.BFFBGAJGD(arg_64_0, CoD.StatsGroup.Ranked)

	if not var_64_0 then
		assert(var_64_0)

		return false
	end

	local var_64_1 = var_64_0.missionComplete

	if not var_64_1 then
		assert(var_64_1)

		return false
	end

	return var_64_1[arg_64_1]:get() == 1
end

function Challenge.HasCompletedInGameIntel(arg_65_0, arg_65_1)
	local var_65_0 = Challenge.IsInGameIntel(arg_65_1) == true

	assert(var_65_0)

	if not var_65_0 then
		return false
	else
		return Challenge.HasCompletedIntelMission(arg_65_0, arg_65_1)
	end
end

function Challenge.HasCompletedFrontendIntel(arg_66_0, arg_66_1)
	local var_66_0 = Challenge.IsInGameIntel(arg_66_1) == false

	assert(var_66_0)

	if not var_66_0 then
		return false
	else
		local var_66_1 = split(arg_66_1, "_")
		local var_66_2 = tonumber(var_66_1[#var_66_1])
		local var_66_3 = ""

		for iter_66_0 = 1, #var_66_1 - 1 do
			var_66_3 = var_66_3 .. var_66_1[iter_66_0] .. "_"
		end

		local var_66_4 = var_66_3 .. tostring(var_66_2 + 1)
		local var_66_5 = Challenge.HasCompletedIntelMission(arg_66_0, arg_66_1)
		local var_66_6 = Challenge.HasCompletedIntelMission(arg_66_0, var_66_4)

		return var_66_5 and var_66_6
	end
end

function Challenge.GetIntelImage(arg_67_0)
	return StringTable.DIFCHIGDFB(CSV.intelChallenges.file, CSV.intelChallenges.cols.ref, arg_67_0, CSV.intelChallenges.cols.image)
end

function Challenge.GetIntelEvent(arg_68_0)
	return StringTable.DIFCHIGDFB(CSV.intelChallenges.file, CSV.intelChallenges.cols.ref, arg_68_0, CSV.intelChallenges.cols.event)
end

function Challenge.GetIntelSeasonWeek(arg_69_0)
	return StringTable.DIFCHIGDFB(CSV.intelChallenges.file, CSV.intelChallenges.cols.ref, arg_69_0, CSV.intelChallenges.cols.seasonWeek)
end

function Challenge.IsInGameIntel(arg_70_0)
	return StringTable.DIFCHIGDFB(CSV.intelChallenges.file, CSV.intelChallenges.cols.ref, arg_70_0, CSV.intelChallenges.cols.inGame) == "1"
end

function Challenge.GetActiveIntelData(arg_71_0)
	local var_71_0 = Challenge.GetQuestsForMissionChallenges(arg_71_0, Challenge.IntelMissionsWhitelist)
	local var_71_1 = Challenge.GetMissionsForQuests(arg_71_0, var_71_0)

	for iter_71_0, iter_71_1 in ipairs(var_71_1) do
		if iter_71_1.isActive and not iter_71_1.complete then
			local var_71_2 = iter_71_1.objectives[iter_71_1.numObjectivesComplete + 1]

			if var_71_2 then
				var_71_2.progress = 0
				var_71_2.amountEarned = 0

				return var_71_2
			end
		end
	end
end

function Challenge.SortIntelMissions(arg_72_0)
	local var_72_0 = SEASON.GetCurrentSeason()

	table.sort(arg_72_0, function(arg_73_0, arg_73_1)
		local var_73_0 = Challenge.GetIntelSeason(arg_73_0.intelSeasonWeek)
		local var_73_1 = Challenge.GetIntelSeason(arg_73_1.intelSeasonWeek)
		local var_73_2 = tonumber(arg_73_0.intelSeasonWeek)
		local var_73_3 = tonumber(arg_73_1.intelSeasonWeek)

		if var_73_0 == var_72_0 then
			if var_73_1 == var_72_0 then
				return var_73_2 < var_73_3
			else
				return true
			end
		elseif var_73_1 == var_72_0 then
			return false
		else
			return var_73_2 < var_73_3
		end
	end)
end

function Challenge.GetIntelSeason(arg_74_0)
	return math.floor(tonumber(arg_74_0) / 1000)
end

function Challenge.GetMasterChallengesCount()
	return StringTable.BFHCAIIDA(CSV.callingCardMasterChallenges.file)
end

function Challenge.GetMasterChallengeCategories()
	local var_76_0 = {}
	local var_76_1 = ""
	local var_76_2 = StringTable.BFHCAIIDA(CSV.callingCardMasterChallenges.file)

	for iter_76_0 = 0, var_76_2 - 1 do
		local var_76_3 = CSV.ReadRow(CSV.callingCardMasterChallenges, iter_76_0).categoryType

		if var_76_3 and #var_76_3 > 0 then
			var_76_0[var_76_3] = true
		end
	end

	return var_76_0, var_76_2
end

local function var_0_1(arg_77_0, arg_77_1)
	local var_77_0
	local var_77_1
	local var_77_2 = true
	local var_77_3 = split(arg_77_0, "|")
	local var_77_4

	if var_77_3 and #var_77_3 > 0 then
		var_77_1 = #var_77_3

		for iter_77_0 = 1, #var_77_3 do
			if arg_77_1 < tonumber(var_77_3[iter_77_0]) then
				var_77_0 = iter_77_0
				var_77_4 = var_77_3[iter_77_0]

				break
			elseif iter_77_0 == var_77_1 and arg_77_1 >= tonumber(var_77_3[iter_77_0]) then
				var_77_0 = var_77_1
				var_77_2 = false
				var_77_4 = var_77_3[iter_77_0]
			end
		end
	end

	return var_77_0, var_77_1, var_77_2, var_77_4
end

function Challenge.GetCallingCardMasterChallenges(arg_78_0, arg_78_1)
	local var_78_0 = {}

	local function var_78_1(arg_79_0)
		local var_79_0 = {
			id = arg_79_0.id,
			ref = arg_79_0.ref,
			challengeName = arg_79_0.name,
			loot = arg_79_0.loot,
			tierDesc = arg_79_0.desc,
			XPReward = arg_79_0.XPReward,
			amounts = arg_79_0.amount,
			categoryName = Challenge.StickerBookChallengeTypes[arg_79_0.categoryType]
		}
		local var_79_1 = StickerBookChallenges.CJBJIFGJHG(arg_78_0, var_79_0.id)
		local var_79_2 = var_79_1.Challenges.UnlockProgress
		local var_79_3, var_79_4, var_79_5, var_79_6 = var_0_1(arg_79_0.amount, var_79_2)

		var_79_0.progress = LUI.clamp(var_79_2 / var_79_6, 0, 1)
		var_79_0.actualProgress = var_79_1.Challenges.UnlockProgress
		var_79_0.currentTier = var_79_3
		var_79_0.isChallengeActive = var_79_5

		local var_79_7 = split(arg_79_0.loot, "|")

		var_79_0.challengeImage = LOOT.GetItemRef(LOOT.itemTypes.PLAYERCARD, var_79_7[var_79_4])
		var_79_0.numTiers = var_79_4
		var_79_0.currentChallengeProgressAmount = var_79_2
		var_79_0.currentChallengeMaxAmount = var_79_6

		return var_79_0
	end

	local var_78_2 = StringTable.BFHCAIIDA(CSV.callingCardMasterChallenges.file)

	for iter_78_0 = 0, var_78_2 - 1 do
		local var_78_3 = CSV.ReadRow(CSV.callingCardMasterChallenges, iter_78_0)
		local var_78_4 = var_78_3.categoryType

		if var_78_4 and var_78_4 == arg_78_1 or arg_78_1 == nil then
			local var_78_5 = var_78_1(var_78_3)

			if var_78_5 then
				table.insert(var_78_0, var_78_5)
			end
		end
	end

	return var_78_0
end

function Challenge.GetAllMasterChallenges(arg_80_0, arg_80_1)
	local var_80_0 = {}
	local var_80_1 = Challenge.GetMasterChallengeCategories()

	if var_80_1 then
		for iter_80_0, iter_80_1 in pairs(var_80_1) do
			local var_80_2 = Challenge.GetCallingCardMasterChallenges(arg_80_0, iter_80_0)

			for iter_80_2 = 1, #var_80_2 do
				table.insert(var_80_0, var_80_2[iter_80_2])
			end
		end
	else
		var_80_0 = Challenge.GetCallingCardMasterChallenges(arg_80_0)
	end

	if arg_80_1 then
		table.sort(var_80_0, function(arg_81_0, arg_81_1)
			if arg_81_0.currentTier and arg_81_1.currentTier then
				if arg_81_0.progress ~= arg_81_1.progress then
					return arg_81_0.progress > arg_81_1.progress
				elseif arg_81_0.currentTierProgress ~= arg_81_1.currentTierProgress then
					return arg_81_0.currentTierProgress > arg_81_1.currentTierProgress
				else
					return arg_81_0.id > arg_81_1.id
				end
			end
		end)
	end

	return var_80_0
end

function Challenge.GetCompletedStickerBookChallengeCount(arg_82_0)
	local var_82_0 = Challenge.GetAllMasterChallenges(arg_82_0, false)
	local var_82_1 = 0

	for iter_82_0 = 1, #var_82_0 do
		if var_82_0[iter_82_0].isChallengeActive == false then
			var_82_1 = var_82_1 + 1
		end
	end

	return var_82_1
end

function Challenge.GetCompletedStickerBookChallengeOfTypeCount(arg_83_0, arg_83_1)
	local var_83_0 = Challenge.GetCallingCardMasterChallenges(arg_83_0, arg_83_1)
	local var_83_1 = 0

	for iter_83_0 = 1, #var_83_0 do
		if var_83_0[iter_83_0].isChallengeActive == false then
			var_83_1 = var_83_1 + 1
		end
	end

	return var_83_1
end

function Challenge.GetWeaponMasterSplashInfo(arg_84_0, arg_84_1)
	local var_84_0

	if not arg_84_0 or not arg_84_1 then
		assert(false, "Challenge.GetWeaponMasterSplashInfo( <challengeID>, <progress> )")

		return
	else
		arg_84_0 = tonumber(arg_84_0)
		arg_84_1 = tonumber(arg_84_1)
	end

	local var_84_1 = StringTable.BJJBBCJGEJ(CSV.weaponMasterChallenges.file, CSV.weaponMasterChallenges.cols.id, arg_84_0)

	if var_84_1 >= 0 then
		local var_84_2 = CSV.ReadRowWithFile(CSV.weaponMasterChallenges, CSV.weaponMasterChallenges.file, var_84_1)
		local var_84_3 = LUI.Split(var_84_2.amount, "|")

		if #var_84_3 > 1 then
			local var_84_4

			for iter_84_0 = #var_84_3, 1, -1 do
				if arg_84_1 >= tonumber(var_84_3[iter_84_0]) then
					var_84_4 = iter_84_0

					break
				end
			end

			if not var_84_4 then
				assert(false, "Challenge.GetWeaponMasterSplashInfo could not find completed challenge for id: " .. arg_84_0 .. ", progress: " .. arg_84_1)

				return
			end

			var_84_0 = {
				id = var_84_2.id,
				ref = var_84_2.ref,
				name = LUI.Split(var_84_2.name, "|")[var_84_4] or var_84_2.name,
				desc = var_84_2.desc,
				detailDesc = var_84_2.detailDesc,
				categoryName = var_84_2.categoryName,
				loot = LUI.Split(var_84_2.loot, "|")[var_84_4] or var_84_2.loot,
				XPReward = LUI.Split(var_84_2.XPReward, "|")[var_84_4] or var_84_2.XPReward,
				icon = LUI.Split(var_84_2.icon, "|")[var_84_4] or var_84_2.icon
			}

			if var_84_4 > 1 then
				local var_84_5 = tonumber(var_84_3[var_84_4])
				local var_84_6 = tonumber(var_84_3[var_84_4 - 1])

				if var_84_6 < var_84_5 then
					var_84_5 = var_84_5 - var_84_6
				end

				var_84_0.amount = tostring(var_84_5)
			else
				var_84_0.amount = var_84_3[var_84_4]
			end
		else
			var_84_0 = var_84_2
		end
	end

	return var_84_0
end

function Challenge.MissionIsOwned(arg_85_0, arg_85_1)
	if not arg_85_1 then
		return false
	end

	arg_85_1 = tostring(arg_85_1)

	if #arg_85_1 <= 0 then
		return false
	end

	local var_85_0 = StringTable.DIFCHIGDFB(CSV.missionIDs.file, CSV.missionIDs.cols.ref, arg_85_1, CSV.missionIDs.cols.index)

	if not var_85_0 or #var_85_0 <= 0 then
		return false
	end

	return Loot.DEBEIFJEEG(arg_85_0, tonumber(var_85_0)) > 0
end
