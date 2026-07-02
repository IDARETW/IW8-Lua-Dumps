PlayerTitleUtils = {}
PlayerTitleUtils.Categories = {
	VICTORY = 2,
	CORE = 1
}
PlayerTitleUtils.DefaultTitleID = 0

function PlayerTitleUtils.GetTitleIDByRow(arg_1_0)
	return StringTable.CBGJCDIHCE(CSV.callingCardTitles.file, arg_1_0, CSV.callingCardTitles.cols.index)
end

function PlayerTitleUtils.GetAllPlayerTitles(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = arg_2_1 and arg_2_1.category
	local var_2_2

	var_2_2 = arg_2_1 and arg_2_1.unlockType

	local var_2_3 = StringTable.BFHCAIIDA(CSV.callingCardTitles.file)

	for iter_2_0 = 0, var_2_3 - 1 do
		local var_2_4 = CSV.ReadRow(CSV.callingCardTitles, iter_2_0)

		if var_2_4 and var_2_4.hideInUI ~= "1" then
			var_2_4.isUnlocked = LOOT.IsUnlocked(arg_2_0, LOOT.itemTypes.TITLE, var_2_4.ref)
			var_2_4.rarity = LOOT.GetItemQuality(LOOT.itemTypes.TITLE, var_2_4.ref)
			var_2_4.season, var_2_4.event, var_2_4.isPremium = LOOT.GetItemSeason(LOOT.itemTypes.TITLE, var_2_4.ref)
			var_2_4.lootID = LOOT.GetItemID(LOOT.itemTypes.TITLE, var_2_4.ref)
			var_2_4.lootType = LOOT.itemTypes.TITLE

			local var_2_5 = var_2_1 == nil or var_2_4.category == var_2_1

			if arg_2_1 and arg_2_1._shouldGetUnlockedOnly and not var_2_4.isUnlocked then
				var_2_5 = false
			end

			if var_2_5 then
				table.insert(var_2_0, var_2_4)
			end
		end
	end

	return var_2_0
end

function PlayerTitleUtils.AreAllVictoryChallengesUnlocked(arg_3_0)
	local var_3_0 = PlayerTitleUtils.GetAllPlayerTitles(arg_3_0, {
		{
			unlockType = PlayerTitleUtils.Categories.VICTORY
		}
	})

	for iter_3_0 = 1, #var_3_0 do
		if not var_3_0[iter_3_0].isUnlocked then
			return false
		end
	end

	return true
end

function PlayerTitleUtils.GetTitleRef(arg_4_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.index, arg_4_0, CSV.callingCardTitles.cols.ref)
end

function PlayerTitleUtils.GetTitleName(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.ref, arg_5_0, CSV.callingCardTitles.cols.name)
end

function PlayerTitleUtils.GetTitleNameFromID(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.index, arg_6_0, CSV.callingCardTitles.cols.name)
end

function PlayerTitleUtils.GetTitleImage(arg_7_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.ref, arg_7_0, CSV.callingCardTitles.cols.image)
end

function PlayerTitleUtils.GetTitleSeason(arg_8_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.ref, arg_8_0, CSV.callingCardTitles.cols.season)
end

function PlayerTitleUtils.GetCardSeasonFromID(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.index, arg_9_0, CSV.callingCardTitles.cols.season)
end

function PlayerTitleUtils.GetTitleCategoryFromID(arg_10_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.index, arg_10_0, CSV.callingCardTitles.cols.category)
end

function PlayerTitleUtils.GetTitleCategory(arg_11_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.ref, arg_11_0, CSV.callingCardTitles.cols.category)
end

function PlayerTitleUtils.GetTitleChallenge(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.index, arg_12_0, CSV.callingCardTitles.cols.challenge)
end

function PlayerTitleUtils.GetTitleChallengeName(arg_13_0)
	local var_13_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_13_0, CSV.allChallengesTable.cols.name)

	if var_13_0 == nil or var_13_0 == "" then
		var_13_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_13_0, CSV.allChallengesTable.cols.name)
	end

	return Engine.CBBHFCGDIC(var_13_0)
end

function PlayerTitleUtils.GetTitleChallengeDesc(arg_14_0, arg_14_1, arg_14_2)
	return Challenge.GetLocalizedChallengeDesc(arg_14_0, arg_14_1, arg_14_2)
end

function PlayerTitleUtils.GetChallengeTitleTexture(arg_15_0)
	local var_15_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_15_0, CSV.allChallengesTable.cols.name)

	if var_15_0 == nil or var_15_0 == "" then
		var_15_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_15_0, CSV.allChallengesTable.cols.name)
	end

	return Engine.CBBHFCGDIC(var_15_0)
end

function PlayerTitleUtils.GetTitleChallengeTier(arg_16_0, arg_16_1)
	if arg_16_0 == nil or arg_16_0 == "" then
		return ""
	end

	return PlayerTitleUtils.GetChallengeEntry(arg_16_0, arg_16_1).currentTierLabel
end

function PlayerTitleUtils.GetTitleChallengeInfoAlpha(arg_17_0)
	if arg_17_0 == nil or arg_17_0 == "" then
		return 0
	end

	return 1
end

function PlayerTitleUtils.GetTitleChallengeCategoryRef(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.category:GetValue(arg_18_1)

	if var_18_0 == nil or var_18_0 == "" then
		local var_18_1 = PlayerTitleUtils.GetTitleChallengeSubCategoryRef(arg_18_0, arg_18_1)

		var_18_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, var_18_1, CSV.challengeSubCategories.cols.category)

		if var_18_0 == nil or var_18_0 == "" then
			var_18_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, var_18_1, CSV.challengeSubCategories.cols.category)
		end

		local var_18_2 = StringTable.DIFCHIGDFB(CSV.challengeCategories.file, CSV.challengeCategories.cols.ref, var_18_0, CSV.challengeCategories.cols.localizeRef)

		if var_18_2 == nil or var_18_2 == "" then
			var_18_2 = StringTable.DIFCHIGDFB(CSV.challengeCategories.altFile, CSV.challengeCategories.cols.ref, var_18_0, CSV.challengeCategories.cols.localizeRef)
		end

		arg_18_0.category:SetValue(arg_18_1, Engine.CBBHFCGDIC(var_18_2))
	end

	return var_18_0
end

function PlayerTitleUtils.GetTitleChallengeCategoryRefByTitleID(arg_19_0, arg_19_1)
	local var_19_0 = PlayerTitleUtils.GetTitleCategoryFromID(arg_19_0)

	if var_19_0 == nil or var_19_0 == "" then
		local var_19_1 = PlayerTitleUtils.GetTitleChallenge(arg_19_0)
		local var_19_2 = PlayerTitleUtils.GetTitleChallengeSubCategoryRefByChallenge(var_19_1, arg_19_1)

		var_19_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, var_19_2, CSV.challengeSubCategories.cols.category)

		if var_19_0 == nil or var_19_0 == "" then
			var_19_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, var_19_2, CSV.challengeSubCategories.cols.category)
		end
	end

	return var_19_0
end

function PlayerTitleUtils.GetTitleChallengeSubCategoryRefByChallenge(arg_20_0)
	if arg_20_0 == nil or arg_20_0 == "" then
		return nil
	else
		local var_20_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_20_0, CSV.allChallengesTable.cols.subCategory)

		if var_20_0 == nil or var_20_0 == "" then
			var_20_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_20_0, CSV.allChallengesTable.cols.subCategory)
		end

		return var_20_0
	end
end

function PlayerTitleUtils.GetTitleChallengeSubCategoryRef(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.challenge:GetValue(arg_21_1)

	if var_21_0 == nil or var_21_0 == "" then
		return nil
	else
		local var_21_1 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, var_21_0, CSV.allChallengesTable.cols.subCategory)

		if var_21_1 == nil or var_21_1 == "" then
			var_21_1 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, var_21_0, CSV.allChallengesTable.cols.subCategory)
		end

		return var_21_1
	end
end

function PlayerTitleUtils.GetTitleChallengeSubCategoryFromID(arg_22_0)
	if arg_22_0 and arg_22_0 ~= "" then
		local var_22_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_22_0, CSV.allChallengesTable.cols.subCategory)

		if var_22_0 == nil or var_22_0 == "" then
			var_22_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_22_0, CSV.allChallengesTable.cols.subCategory)
		end

		return var_22_0
	end
end

function PlayerTitleUtils.GetTitleChallengeCategoryFromID(arg_23_0, arg_23_1, arg_23_2)
	if (arg_23_0 == nil or arg_23_0 == "") and (arg_23_1 == nil or arg_23_1 == "") then
		local var_23_0 = PlayerTitleUtils.GetTitleChallengeSubCategoryFromID(arg_23_1, arg_23_2)

		arg_23_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, var_23_0, CSV.challengeSubCategories.cols.category)

		if arg_23_0 == nil or arg_23_0 == "" then
			arg_23_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, var_23_0, CSV.challengeSubCategories.cols.category)
		end
	end

	return arg_23_0
end

function PlayerTitleUtils.GetTitleChallengeCategoryStringFromID(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	if (arg_24_1 == nil or arg_24_1 == "") and (arg_24_2 == nil or arg_24_2 == "") then
		local var_24_0 = PlayerTitleUtils.GetTitleChallengeSubCategoryFromID(arg_24_2, arg_24_3)

		arg_24_1 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, var_24_0, CSV.challengeSubCategories.cols.category)

		if arg_24_1 == nil or arg_24_1 == "" then
			arg_24_1 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, var_24_0, CSV.challengeSubCategories.cols.category)
		end

		local var_24_1 = StringTable.DIFCHIGDFB(CSV.challengeCategories.file, CSV.challengeCategories.cols.ref, arg_24_1, CSV.challengeCategories.cols.localizeRef)

		if var_24_1 == nil or var_24_1 == "" then
			var_24_1 = StringTable.DIFCHIGDFB(CSV.challengeCategories.altFile, CSV.challengeCategories.cols.ref, arg_24_1, CSV.challengeCategories.cols.localizeRef)
		end

		return Engine.CBBHFCGDIC(var_24_1)
	else
		return PlayerTitleUtils.GetTitleCategoryName(arg_24_0)
	end
end

function PlayerTitleUtils.LoadChallengeEntries(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = {}
	local var_25_1 = {
		CSV.allChallengesTable.file,
		CSV.allChallengesTable.altFile
	}
	local var_25_2 = 0
	local var_25_3

	for iter_25_0, iter_25_1 in ipairs(var_25_1) do
		for iter_25_2 = 0, StringTable.BFHCAIIDA(iter_25_1) - 1 do
			local var_25_4 = StringTable.CBGJCDIHCE(iter_25_1, iter_25_2, CSV.allChallengesTable.cols.ref)

			if var_25_4 ~= "" and StringTable.CBGJCDIHCE(iter_25_1, iter_25_2, CSV.allChallengesTable.cols.subCategory) == arg_25_0 then
				local var_25_5 = PlayerTitleUtils.GetChallengeEntry(var_25_4, arg_25_2, iter_25_1)

				if var_25_5.isMasterChallenge and arg_25_1 then
					var_25_3 = var_25_5
				else
					var_25_0[var_25_2] = var_25_5
					var_25_2 = var_25_2 + 1
				end
			end
		end
	end

	return var_25_0, var_25_3
end

function PlayerTitleUtils.GetChallengeEntry(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0
	local var_26_1 = arg_26_2 or CSV.allChallengesTable.file
	local var_26_2 = not Engine.EAIICIFIFA() and var_26_1 == CSV.allChallengesTable.file or Engine.EAIICIFIFA() and var_26_1 ~= CSV.allChallengesTable.file

	if var_26_2 then
		var_26_0 = PlayerData.BFFBGAJGD(arg_26_1, CoD.StatsGroup.Ranked).challengeState[arg_26_0]:get()
	else
		var_26_0 = PlayerData.BFFBGAJGD(arg_26_1, CoD.StatsGroup.Coop).meritState[arg_26_0]:get()
	end

	local var_26_3 = {
		name = StringTable.DIFCHIGDFB(var_26_1, CSV.allChallengesTable.cols.ref, arg_26_0, CSV.allChallengesTable.cols.name),
		ref = arg_26_0
	}
	local var_26_4 = {}
	local var_26_5 = 0

	for iter_26_0 = 0, CSV.allChallengesTable.maxTiers do
		local var_26_6 = StringTable.DIFCHIGDFB(var_26_1, CSV.allChallengesTable.cols.ref, arg_26_0, CSV.allChallengesTable.tiers.targetStart + CSV.allChallengesTable.numTierCols * iter_26_0)
		local var_26_7 = StringTable.DIFCHIGDFB(var_26_1, CSV.allChallengesTable.cols.ref, arg_26_0, CSV.allChallengesTable.tiers.xpStart + CSV.allChallengesTable.numTierCols * iter_26_0)
		local var_26_8 = StringTable.DIFCHIGDFB(var_26_1, CSV.allChallengesTable.cols.ref, arg_26_0, CSV.allChallengesTable.tiers.scoreStart + CSV.allChallengesTable.numTierCols * iter_26_0)

		if var_26_6 and var_26_7 and var_26_8 and var_26_6 ~= "" and var_26_7 ~= "" and var_26_8 ~= "" then
			var_26_4[iter_26_0] = {}
			var_26_4[iter_26_0].target = var_26_6
			var_26_4[iter_26_0].xp = var_26_7
			var_26_4[iter_26_0].score = var_26_8
		else
			var_26_5 = iter_26_0

			break
		end
	end

	if var_26_5 <= 0 then
		assert(false, "Failed to get challenge data for " .. arg_26_0)
	end

	local var_26_9 = var_26_5 <= var_26_0
	local var_26_10 = var_26_4[var_26_9 and var_26_5 - 1 or var_26_0]

	var_26_3.isUnlocked = Unlocks.BFCEGDJIEI(arg_26_1, "challenge", arg_26_0)
	var_26_3.image = StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.challenge, arg_26_0, CSV.callingCardTitles.cols.image)
	var_26_3.tierCount = var_26_5
	var_26_3.currentTier = var_26_9 and var_26_5 - 1 or var_26_0
	var_26_3.isCompleted = var_26_9
	var_26_3.currentTierLabel = Engine.CBBHFCGDIC("LUA_MENU_MP/CHALLENGE_TIER_LABEL", tostring(var_26_3.currentTier + 1), tostring(var_26_5))
	var_26_3.currentTierMax = var_26_10.target

	if var_26_2 then
		var_26_3.currentProgress = var_26_9 and var_26_3.currentTierMax or PlayerData.BFFBGAJGD(arg_26_1, CoD.StatsGroup.Ranked).challengeProgress[arg_26_0]:get()
	else
		var_26_3.currentProgress = var_26_9 and var_26_3.currentTierMax or PlayerData.BFFBGAJGD(arg_26_1, CoD.StatsGroup.Coop).meritProgress[arg_26_0]:get()
	end

	var_26_3.currentProgressPercent = var_26_9 and 1 or var_26_3.currentProgress / var_26_3.currentTierMax
	var_26_3.currentTierXP = var_26_10.xp
	var_26_3.currentTierScore = var_26_10.score

	local var_26_11 = StringTable.DIFCHIGDFB(var_26_1, CSV.allChallengesTable.cols.ref, arg_26_0, CSV.allChallengesTable.cols.paramScale)

	if var_26_11 and var_26_11 ~= "" then
		local var_26_12 = tonumber(var_26_11)

		var_26_3.currentTierMax = math.floor(var_26_3.currentTierMax / var_26_12)
		var_26_3.currentProgress = math.floor(var_26_3.currentProgress / var_26_12)
	end

	if var_26_3.isUnlocked then
		var_26_3.desc = PlayerTitleUtils.GetTitleChallengeDesc(arg_26_0, var_26_3.currentTierMax, var_26_1)
	else
		var_26_3.desc = Cac.GetUnlockText(CSV.challengeUnlockTable, arg_26_0)
	end

	local var_26_13 = StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.challenge, arg_26_0, CSV.callingCardTitles.cols.index)

	var_26_3.isMasterChallenge = PlayerTitleUtils.GetTitleIsMasterTitle(var_26_13) == "TRUE"
	var_26_3.isHiddenChallenge = false
	var_26_3.isSecretZombiesMerit = false

	local var_26_14 = StringTable.DIFCHIGDFB(var_26_1, CSV.allChallengesTable.cols.ref, arg_26_0, CSV.allChallengesTable.cols.subCategory)

	if not var_26_9 and (var_26_14 == "darkops" or var_26_14 == "secret") then
		var_26_3.tierCount = 1
		var_26_3.currentTier = 0
		var_26_3.currentTierLabel = Engine.CBBHFCGDIC("LUA_MENU_MP/CHALLENGE_TIER_LABEL", 1, "?")
		var_26_3.currentTierMax = 1
		var_26_3.currentProgress = 0
		var_26_3.currentProgressPercent = 0
		var_26_3.name = "LUA_MENU_MP/HIDDEN_UNLOCK_CRITERIA"
		var_26_3.desc = Engine.CBBHFCGDIC("LUA_MENU_MP/HIDDEN_UNLOCK_CRITERIA")
		var_26_3.currentTierXP = "???"
		var_26_3.currentTierScore = "???"
		var_26_3.image = "widg_disabled"
		var_26_3.isHiddenChallenge = true

		if var_26_14 == "secret" then
			var_26_3.isSecretZombiesMerit = true
		end
	end

	return var_26_3
end

function PlayerTitleUtils.GetChallengeSubcatName(arg_27_0)
	local var_27_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, arg_27_0, CSV.challengeSubCategories.cols.localizeRef)

	if var_27_0 == nil or var_27_0 == "" then
		var_27_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, arg_27_0, CSV.challengeSubCategories.cols.localizeRef)
	end

	assert(var_27_0)

	return Engine.CBBHFCGDIC(var_27_0)
end

function PlayerTitleUtils.GetTitleIsShippable(arg_28_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.index, arg_28_0, CSV.callingCardTitles.cols.hideInUI) ~= "1"
end

function PlayerTitleUtils.GetTitleHideIfLocked(arg_29_0)
	return StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.index, arg_29_0, CSV.callingCardTitles.cols.hideIfLocked) == "1"
end

function PlayerTitleUtils.HasAnyNewLootTitles(arg_30_0)
	local var_30_0 = StringTable.BFHCAIIDA(CSV.callingCardTitles.file)

	for iter_30_0 = 0, var_30_0 do
		local var_30_1 = StringTable.CBGJCDIHCE(CSV.callingCardTitles.file, iter_30_0, CSV.callingCardTitles.cols.lootID)

		if var_30_1 and var_30_1 ~= "" and Loot.HDJCADADF(arg_30_0, tonumber(var_30_1)) then
			return true
		end
	end

	return false
end

function PlayerTitleUtils.HasNewLootTitlesByCategory(arg_31_0, arg_31_1)
	local var_31_0 = StringTable.BFHCAIIDA(CSV.callingCardTitles.file)

	for iter_31_0 = 0, var_31_0 do
		if StringTable.CBGJCDIHCE(CSV.callingCardTitles.file, iter_31_0, CSV.callingCardTitles.cols.category) == arg_31_1 then
			local var_31_1 = StringTable.CBGJCDIHCE(CSV.callingCardTitles.file, iter_31_0, CSV.callingCardTitles.cols.lootID)

			if var_31_1 and var_31_1 ~= "" and Loot.HDJCADADF(arg_31_0, tonumber(var_31_1)) then
				return true
			end
		end
	end

	return false
end
