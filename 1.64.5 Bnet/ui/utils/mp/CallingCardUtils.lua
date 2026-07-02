CallingCardUtils = {}
CallingCardUtils.Categories = {
	VICTORY = 2,
	CORE = 1
}
CallingCardUtils.DefaultCardIndex = 0
CallingCardUtils.DefaultFrameIndex = 0
CallingCardUtils.DefaultTitleIndex = 0

function CallingCardUtils.GetCardIDByRow(arg_1_0)
	return StringTable.CBGJCDIHCE(CSV.callingCards.file, arg_1_0, CSV.callingCards.cols.index)
end

function CallingCardUtils.GetAllPlayerCards(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1

	var_2_1 = arg_2_1 and arg_2_1.category

	local var_2_2 = arg_2_1 and arg_2_1.unlockType
	local var_2_3 = StringTable.BFHCAIIDA(CSV.callingCards.file)

	for iter_2_0 = 0, var_2_3 - 1 do
		local var_2_4 = CSV.ReadRow(CSV.callingCards, iter_2_0)

		if var_2_4 and var_2_4.hideInUI ~= "1" and var_2_4.ref ~= "" then
			var_2_4.isUnlocked = LOOT.IsUnlocked(arg_2_0, LOOT.itemTypes.PLAYERCARD, var_2_4.ref)
			var_2_4.rarity = LOOT.GetItemQuality(LOOT.itemTypes.PLAYERCARD, var_2_4.ref)
			var_2_4.season, var_2_4.event, var_2_4.isPremium = LOOT.GetItemSeason(LOOT.itemTypes.PLAYERCARD, var_2_4.ref)
			var_2_4.lootID = LOOT.GetItemID(LOOT.itemTypes.PLAYERCARD, var_2_4.ref)
			var_2_4.lootType = LOOT.itemTypes.PLAYERCARD
			var_2_4.gameSourceID = LOOT.GetGameSourceIDFromItemID(var_2_4.lootID)

			local var_2_5 = var_2_2 == CallingCardUtils.Categories.CORE and var_2_4.unlockType == "" or var_2_2 == tonumber(var_2_4.unlockType)

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

function CallingCardUtils.AreAllVictoryChallengesUnlocked(arg_3_0)
	local var_3_0 = CallingCardUtils.GetAllPlayerCards(arg_3_0, {
		{
			unlockType = CallingCardUtils.Categories.VICTORY
		}
	})

	for iter_3_0 = 1, #var_3_0 do
		if not var_3_0[iter_3_0].isUnlocked then
			return false
		end
	end

	return true
end

function CallingCardUtils.GetCardRef(arg_4_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, arg_4_0, CSV.callingCards.cols.ref)
end

function CallingCardUtils.GetCardName(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.ref, arg_5_0, CSV.callingCards.cols.name)
end

function CallingCardUtils.GetCardNameFromID(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, arg_6_0, CSV.callingCards.cols.name)
end

function CallingCardUtils.GetCardImage(arg_7_0)
	local var_7_0 = StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.ref, arg_7_0, CSV.callingCards.cols.image)

	if var_7_0 == nil or #var_7_0 == 0 then
		var_7_0 = CallingCardUtils.GetCardTexture(CallingCardUtils.DefaultCardIndex)
	end

	return var_7_0
end

function CallingCardUtils.GetCardTexture(arg_8_0)
	assert(arg_8_0 and arg_8_0 ~= "")

	local var_8_0 = CallingCardUtils.GetCardIsShippable(arg_8_0)
	local var_8_1

	if var_8_0 then
		var_8_1 = StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, arg_8_0, CSV.callingCards.cols.image)
	else
		DebugPrint("DEBUG CALLING CARD: card " .. arg_8_0 .. "is not shippable")

		var_8_1 = StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, tostring(tonumber(arg_8_0) % 10), CSV.callingCards.cols.image)
	end

	if var_8_1 == nil or #var_8_1 == 0 then
		return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, CallingCardUtils.DefaultCardIndex, CSV.callingCards.cols.image)
	end

	return var_8_1
end

function CallingCardUtils.GetCardSeason(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.ref, arg_9_0, CSV.callingCards.cols.season)
end

function CallingCardUtils.GetCardSeasonFromID(arg_10_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, arg_10_0, CSV.callingCards.cols.season)
end

function CallingCardUtils.GetCardCategoryFromID(arg_11_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, arg_11_0, CSV.callingCards.cols.category)
end

function CallingCardUtils.GetCardCategory(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.ref, ref, CSV.callingCards.cols.category)
end

function CallingCardUtils.GetCardChallenge(arg_13_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, arg_13_0, CSV.callingCards.cols.challenge)
end

function CallingCardUtils.GetCardChallengeName(arg_14_0)
	local var_14_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_14_0, CSV.allChallengesTable.cols.name)

	if var_14_0 == nil or var_14_0 == "" then
		var_14_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_14_0, CSV.allChallengesTable.cols.name)
	end

	return Engine.CBBHFCGDIC(var_14_0)
end

function CallingCardUtils.GetCardChallengeDesc(arg_15_0, arg_15_1, arg_15_2)
	return Challenge.GetLocalizedChallengeDesc(arg_15_0, arg_15_1, arg_15_2)
end

function CallingCardUtils.GetChallengeCardTexture(arg_16_0)
	local var_16_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_16_0, CSV.allChallengesTable.cols.name)

	if var_16_0 == nil or var_16_0 == "" then
		var_16_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_16_0, CSV.allChallengesTable.cols.name)
	end

	return Engine.CBBHFCGDIC(var_16_0)
end

function CallingCardUtils.GetCardChallengeTier(arg_17_0, arg_17_1)
	if arg_17_0 == nil or arg_17_0 == "" then
		return ""
	end

	return CallingCardUtils.GetChallengeEntry(arg_17_0, arg_17_1).currentTierLabel
end

function CallingCardUtils.GetCardChallengeInfoAlpha(arg_18_0, arg_18_1)
	if arg_18_0 == nil or arg_18_0 == "" then
		return 0
	end

	return 1
end

function CallingCardUtils.GetCardChallengeCategoryRef(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.category:GetValue(arg_19_1)

	if var_19_0 == nil or var_19_0 == "" then
		local var_19_1 = CallingCardUtils.GetCardChallengeSubCategoryRef(arg_19_0, arg_19_1)

		var_19_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, var_19_1, CSV.challengeSubCategories.cols.category)

		if var_19_0 == nil or var_19_0 == "" then
			var_19_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, var_19_1, CSV.challengeSubCategories.cols.category)
		end

		local var_19_2 = StringTable.DIFCHIGDFB(CSV.challengeCategories.file, CSV.challengeCategories.cols.ref, var_19_0, CSV.challengeCategories.cols.localizeRef)

		if var_19_2 == nil or var_19_2 == "" then
			var_19_2 = StringTable.DIFCHIGDFB(CSV.challengeCategories.altFile, CSV.challengeCategories.cols.ref, var_19_0, CSV.challengeCategories.cols.localizeRef)
		end

		arg_19_0.category:SetValue(arg_19_1, Engine.CBBHFCGDIC(var_19_2))
	end

	return var_19_0
end

function CallingCardUtils.GetCardChallengeCategoryRefByCardID(arg_20_0, arg_20_1)
	local var_20_0 = CallingCardUtils.GetCardCategoryFromID(arg_20_0)

	if var_20_0 == nil or var_20_0 == "" then
		local var_20_1 = CallingCardUtils.GetCardChallenge(arg_20_0)
		local var_20_2 = CallingCardUtils.GetCardChallengeSubCategoryRefByChallenge(var_20_1, arg_20_1)

		var_20_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, var_20_2, CSV.challengeSubCategories.cols.category)

		if var_20_0 == nil or var_20_0 == "" then
			var_20_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, var_20_2, CSV.challengeSubCategories.cols.category)
		end
	end

	return var_20_0
end

function CallingCardUtils.GetCardChallengeSubCategoryRefByChallenge(arg_21_0, arg_21_1)
	if arg_21_0 == nil or arg_21_0 == "" then
		return nil
	else
		local var_21_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_21_0, CSV.allChallengesTable.cols.subCategory)

		if var_21_0 == nil or var_21_0 == "" then
			var_21_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_21_0, CSV.allChallengesTable.cols.subCategory)
		end

		return var_21_0
	end
end

function CallingCardUtils.GetCardChallengeSubCategoryRef(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.challenge:GetValue(arg_22_1)

	if var_22_0 == nil or var_22_0 == "" then
		return nil
	else
		local var_22_1 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, var_22_0, CSV.allChallengesTable.cols.subCategory)

		if var_22_1 == nil or var_22_1 == "" then
			var_22_1 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, var_22_0, CSV.allChallengesTable.cols.subCategory)
		end

		return var_22_1
	end
end

function CallingCardUtils.GetCardChallengeSubCategoryFromID(arg_23_0, arg_23_1)
	if arg_23_0 and arg_23_0 ~= "" then
		local var_23_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, arg_23_0, CSV.allChallengesTable.cols.subCategory)

		if var_23_0 == nil or var_23_0 == "" then
			var_23_0 = StringTable.DIFCHIGDFB(CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, arg_23_0, CSV.allChallengesTable.cols.subCategory)
		end

		return var_23_0
	end
end

function CallingCardUtils.GetCardChallengeCategoryFromID(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_0 == nil or arg_24_0 == "" then
		local var_24_0 = CallingCardUtils.GetCardChallengeSubCategoryFromID(arg_24_1, arg_24_2)

		arg_24_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, var_24_0, CSV.challengeSubCategories.cols.category)

		if arg_24_0 == nil or arg_24_0 == "" then
			arg_24_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, var_24_0, CSV.challengeSubCategories.cols.category)
		end
	end

	return arg_24_0
end

function CallingCardUtils.GetCardChallengeCategoryStringFromID(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	if arg_25_1 == nil or arg_25_1 == "" then
		local var_25_0 = CallingCardUtils.GetCardChallengeSubCategoryFromID(arg_25_2, arg_25_3)

		arg_25_1 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, var_25_0, CSV.challengeSubCategories.cols.category)

		if arg_25_1 == nil or arg_25_1 == "" then
			arg_25_1 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, var_25_0, CSV.challengeSubCategories.cols.category)
		end

		local var_25_1 = StringTable.DIFCHIGDFB(CSV.challengeCategories.file, CSV.challengeCategories.cols.ref, arg_25_1, CSV.challengeCategories.cols.localizeRef)

		if var_25_1 == nil or var_25_1 == "" then
			var_25_1 = StringTable.DIFCHIGDFB(CSV.challengeCategories.altFile, CSV.challengeCategories.cols.ref, arg_25_1, CSV.challengeCategories.cols.localizeRef)
		end

		return Engine.CBBHFCGDIC(var_25_1)
	else
		return CallingCardUtils.GetCardCategoryName(arg_25_0)
	end
end

function CallingCardUtils.BuildChallengeEntriesDataSources(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0, var_26_1 = CallingCardUtils.LoadChallengeEntries(arg_26_0, arg_26_2, arg_26_3)
	local var_26_2 = {}

	local function var_26_3(arg_27_0)
		local var_27_0 = arg_27_0.ref
		local var_27_1 = arg_26_1 .. ".current." .. var_27_0
		local var_27_2 = arg_27_0.image

		if var_27_2 == nil or var_27_2 == "" then
			local var_27_3 = StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.challenge, var_27_0, CSV.callingCards.cols.index)

			var_27_2 = CallingCardUtils.GetCardTexture(var_27_3)
		end

		return {
			name = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".name", arg_27_0.name),
			desc = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".desc", arg_27_0.desc),
			image = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".image", var_27_2),
			ref = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".ref", var_27_0),
			tierCount = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".tierCount", arg_27_0.tierCount),
			isCompleted = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".isCompleted", arg_27_0.isCompleted),
			isCompletedAlpha = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".isCompletedAlpha", arg_27_0.isCompleted and 1 or 0),
			currentTier = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".currentTier", arg_27_0.currentTier),
			currentTierLabel = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".currentTierLabel", arg_27_0.currentTierLabel),
			currentProgress = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".currentProgress", arg_27_0.currentProgress),
			currentProgressPercent = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".currentProgressPercent", arg_27_0.currentProgressPercent),
			currentTierMax = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".currentTierMax", arg_27_0.currentTierMax),
			currentTierXP = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".currentTierXP", arg_27_0.currentTierXP),
			currentTierScore = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".currentTierScore", arg_27_0.currentTierScore),
			isHiddenChallenge = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".isHiddenChallenge", arg_27_0.isHiddenChallenge),
			isSecretZombiesMerit = LUI.DataSourceInGlobalModel.new(var_27_1 .. ".isSecretZombiesMerit", arg_27_0.isSecretZombiesMerit)
		}
	end

	var_26_2.entries = LUI.DataSourceFromList.new(CountTableKeys(var_26_0))

	var_26_2.entries:SetCachingEnabled(true)

	function var_26_2.entries.MakeDataSourceAtIndex(arg_28_0, arg_28_1, arg_28_2)
		local var_28_0 = var_26_0[arg_28_1]

		return var_26_3(var_28_0)
	end

	if arg_26_2 and var_26_1 ~= nil then
		var_26_2.masterChallenge = var_26_3(var_26_1)
	end

	return var_26_2
end

function CallingCardUtils.LoadChallengeEntries(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = {}
	local var_29_1 = {
		CSV.allChallengesTable.file,
		CSV.allChallengesTable.altFile
	}
	local var_29_2 = 0
	local var_29_3

	for iter_29_0, iter_29_1 in ipairs(var_29_1) do
		for iter_29_2 = 0, StringTable.BFHCAIIDA(iter_29_1) do
			local var_29_4 = StringTable.CBGJCDIHCE(iter_29_1, iter_29_2, CSV.allChallengesTable.cols.ref)

			if var_29_4 ~= "" and StringTable.CBGJCDIHCE(iter_29_1, iter_29_2, CSV.allChallengesTable.cols.subCategory) == arg_29_0 then
				local var_29_5 = CallingCardUtils.GetChallengeEntry(var_29_4, arg_29_2, iter_29_1)

				if var_29_5.isMasterChallenge and arg_29_1 then
					var_29_3 = var_29_5
				else
					var_29_0[var_29_2] = var_29_5
					var_29_2 = var_29_2 + 1
				end
			end
		end
	end

	return var_29_0, var_29_3
end

function CallingCardUtils.GetChallengeEntry(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0
	local var_30_1 = arg_30_2 or CSV.allChallengesTable.file
	local var_30_2 = not Engine.EAIICIFIFA() and var_30_1 == CSV.allChallengesTable.file or Engine.EAIICIFIFA() and var_30_1 ~= CSV.allChallengesTable.file

	if var_30_2 then
		var_30_0 = PlayerData.BFFBGAJGD(arg_30_1, CoD.StatsGroup.Ranked).challengeState[arg_30_0]:get()
	else
		var_30_0 = PlayerData.BFFBGAJGD(arg_30_1, CoD.StatsGroup.Coop).meritState[arg_30_0]:get()
	end

	local var_30_3 = {
		name = StringTable.DIFCHIGDFB(var_30_1, CSV.allChallengesTable.cols.ref, arg_30_0, CSV.allChallengesTable.cols.name),
		ref = arg_30_0
	}
	local var_30_4 = {}
	local var_30_5 = 0

	for iter_30_0 = 0, CSV.allChallengesTable.maxTiers do
		local var_30_6 = StringTable.DIFCHIGDFB(var_30_1, CSV.allChallengesTable.cols.ref, arg_30_0, CSV.allChallengesTable.tiers.targetStart + CSV.allChallengesTable.numTierCols * iter_30_0)
		local var_30_7 = StringTable.DIFCHIGDFB(var_30_1, CSV.allChallengesTable.cols.ref, arg_30_0, CSV.allChallengesTable.tiers.xpStart + CSV.allChallengesTable.numTierCols * iter_30_0)
		local var_30_8 = StringTable.DIFCHIGDFB(var_30_1, CSV.allChallengesTable.cols.ref, arg_30_0, CSV.allChallengesTable.tiers.scoreStart + CSV.allChallengesTable.numTierCols * iter_30_0)

		if var_30_6 and var_30_7 and var_30_8 and var_30_6 ~= "" and var_30_7 ~= "" and var_30_8 ~= "" then
			var_30_4[iter_30_0] = {}
			var_30_4[iter_30_0].target = var_30_6
			var_30_4[iter_30_0].xp = var_30_7
			var_30_4[iter_30_0].score = var_30_8
		else
			var_30_5 = iter_30_0

			break
		end
	end

	if var_30_5 <= 0 then
		assert(false, "Failed to get challenge data for " .. arg_30_0)
	end

	local var_30_9 = var_30_5 <= var_30_0
	local var_30_10 = var_30_4[var_30_9 and var_30_5 - 1 or var_30_0]

	var_30_3.isUnlocked = Unlocks.BFCEGDJIEI(arg_30_1, "challenge", arg_30_0)
	var_30_3.image = StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.challenge, arg_30_0, CSV.callingCards.cols.image)
	var_30_3.tierCount = var_30_5
	var_30_3.currentTier = var_30_9 and var_30_5 - 1 or var_30_0
	var_30_3.isCompleted = var_30_9
	var_30_3.currentTierLabel = Engine.CBBHFCGDIC("LUA_MENU_MP/CHALLENGE_TIER_LABEL", tostring(var_30_3.currentTier + 1), tostring(var_30_5))
	var_30_3.currentTierMax = var_30_10.target

	if var_30_2 then
		var_30_3.currentProgress = var_30_9 and var_30_3.currentTierMax or PlayerData.BFFBGAJGD(arg_30_1, CoD.StatsGroup.Ranked).challengeProgress[arg_30_0]:get()
	else
		var_30_3.currentProgress = var_30_9 and var_30_3.currentTierMax or PlayerData.BFFBGAJGD(arg_30_1, CoD.StatsGroup.Coop).meritProgress[arg_30_0]:get()
	end

	var_30_3.currentProgressPercent = var_30_9 and 1 or var_30_3.currentProgress / var_30_3.currentTierMax
	var_30_3.currentTierXP = var_30_10.xp
	var_30_3.currentTierScore = var_30_10.score

	local var_30_11 = StringTable.DIFCHIGDFB(var_30_1, CSV.allChallengesTable.cols.ref, arg_30_0, CSV.allChallengesTable.cols.paramScale)

	if var_30_11 and var_30_11 ~= "" then
		local var_30_12 = tonumber(var_30_11)

		var_30_3.currentTierMax = math.floor(var_30_3.currentTierMax / var_30_12)
		var_30_3.currentProgress = math.floor(var_30_3.currentProgress / var_30_12)
	end

	if var_30_3.isUnlocked then
		var_30_3.desc = CallingCardUtils.GetCardChallengeDesc(arg_30_0, var_30_3.currentTierMax, var_30_1)
	else
		var_30_3.desc = Cac.GetUnlockText(CSV.challengeUnlockTable, arg_30_0)
	end

	local var_30_13 = StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.challenge, arg_30_0, CSV.callingCards.cols.index)

	var_30_3.isMasterChallenge = CallingCardUtils.GetCardIsMasterCard(var_30_13) == "TRUE"
	var_30_3.isHiddenChallenge = false
	var_30_3.isSecretZombiesMerit = false

	local var_30_14 = StringTable.DIFCHIGDFB(var_30_1, CSV.allChallengesTable.cols.ref, arg_30_0, CSV.allChallengesTable.cols.subCategory)

	if not var_30_9 and (var_30_14 == "darkops" or var_30_14 == "secret") then
		var_30_3.tierCount = 1
		var_30_3.currentTier = 0
		var_30_3.currentTierLabel = Engine.CBBHFCGDIC("LUA_MENU_MP/CHALLENGE_TIER_LABEL", 1, "?")
		var_30_3.currentTierMax = 1
		var_30_3.currentProgress = 0
		var_30_3.currentProgressPercent = 0
		var_30_3.name = "LUA_MENU_MP/HIDDEN_UNLOCK_CRITERIA"
		var_30_3.desc = Engine.CBBHFCGDIC("LUA_MENU_MP/HIDDEN_UNLOCK_CRITERIA")
		var_30_3.currentTierXP = "???"
		var_30_3.currentTierScore = "???"
		var_30_3.image = "widg_disabled"
		var_30_3.isHiddenChallenge = true

		if var_30_14 == "secret" then
			var_30_3.isSecretZombiesMerit = true
		end
	end

	return var_30_3
end

function CallingCardUtils.GetChallengeSubcatName(arg_31_0)
	local var_31_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, arg_31_0, CSV.challengeSubCategories.cols.localizeRef)

	if var_31_0 == nil or var_31_0 == "" then
		var_31_0 = StringTable.DIFCHIGDFB(CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, arg_31_0, CSV.challengeSubCategories.cols.localizeRef)
	end

	assert(var_31_0)

	return Engine.CBBHFCGDIC(var_31_0)
end

function CallingCardUtils.GetCardIsShippable(arg_32_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, arg_32_0, CSV.callingCards.cols.hideInUI) ~= "1"
end

function CallingCardUtils.GetCardHideIfLocked(arg_33_0)
	return StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.index, arg_33_0, CSV.callingCards.cols.hideIfLocked) == "1"
end

function CallingCardUtils.HasAnyNewLootCards(arg_34_0)
	local var_34_0 = StringTable.BFHCAIIDA(CSV.callingCards.file)

	for iter_34_0 = 0, var_34_0 do
		local var_34_1 = StringTable.CBGJCDIHCE(CSV.callingCards.file, iter_34_0, CSV.callingCards.cols.lootID)

		if var_34_1 and var_34_1 ~= "" and Loot.HDJCADADF(arg_34_0, tonumber(var_34_1)) then
			return true
		end
	end

	return false
end

function CallingCardUtils.HasNewLootCardsByCategory(arg_35_0, arg_35_1)
	local var_35_0 = StringTable.BFHCAIIDA(CSV.callingCards.file)

	for iter_35_0 = 0, var_35_0 do
		if StringTable.CBGJCDIHCE(CSV.callingCards.file, iter_35_0, CSV.callingCards.cols.category) == arg_35_1 then
			local var_35_1 = StringTable.CBGJCDIHCE(CSV.callingCards.file, iter_35_0, CSV.callingCards.cols.lootID)

			if var_35_1 and var_35_1 ~= "" and Loot.HDJCADADF(arg_35_0, tonumber(var_35_1)) then
				return true
			end
		end
	end

	return false
end
