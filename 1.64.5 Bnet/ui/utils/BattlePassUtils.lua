BATTLEPASS = BATTLEPASS or {}
BATTLEPASS.BUNDLE_TOPPER_ITEM_LEVEL = 999
BATTLEPASS.TOPPER_TIMER_MAX_THRESHOLD_MS = 2147483647
BATTLEPASS.TOPPER_TIMER_MAX_THRESHOLD_TIMER_TICK_MS = 60000
BATTLEPASS.NumBonusItems = 4
BATTLEPASS.SINGLE_TIER_COST = 150
BATTLEPASS.SINGLE_TIER_SKIP_ID = "430002"
BATTLEPASS.TierUpsellMinTier = 15
BATTLEPASS.TierUpsellPopupXPThreshold = 0.2
BATTLEPASS.SHOW_TRAILER_PROMPT = false
BATTLEPASS.WarzoneTierSkipBundleID = 400107
BATTLEPASS.VIPNumFreeGifts = 1
BATTLEPASS.VIPNumOwnerGifts = 2
BATTLEPASS.START_TO_SHOW_COD_POINTS = 500
BATTLEPASS.MW_SKIP_VALUE_REF = "battlepass_skip1"
BATTLEPASS.T9_SKIP_VALUE_REF = "t9_battlepass_tier_skip_1"
BATTLEPASS.S4_SKIP_VALUE_REF = "s4_battlepass_tier_skip"
BATTLEPASS.CURRENT_SKIP_VALUE_REF = BATTLEPASS.S4_SKIP_VALUE_REF
BATTLEPASS.EMBLEM_BASE = "battlepass_season_emblem"
BATTLEPASS.EMBLEM_GOLD = "battlepass_season_emblem_gold"
BATTLEPASS.EMBLEM_SILVER = "battlepass_season_emblem_silver"
BATTLEPASS.TIER_SKIP_COUNT_DEFAULT = 20
BATTLEPASS.TIER_SKIP_COUNT_SONY = 25
BATTLEPASS.FullScreenPopupStates = {
	BATTLE_PASS_UNLOCKED = 0,
	BATTLE_PASS_GIFTED = 4,
	BATTLE_PASS_COMPLETE = 3,
	TIERS_UNLOCKED = 1,
	BATTLE_PASS_TIER_BUNDLE_UNLOCKED = 2
}
BATTLEPASS.ItemTypes = {
	CLAN = 4,
	TIER_SKIP = 1,
	BUNDLE = 2,
	PREMIUM = 0,
	TRACKER = 3
}
BATTLEPASS.ErrorCodes = {
	PREMIUM_ERROR = 1,
	BUNDLE_PREMIUM_ERROR = 3,
	UNKNOWN_ERROR = 5,
	TIER_ERROR = 2,
	BUNDLE_TIER_ERROR = 4,
	PURCHASE_ERROR = 0
}
BATTLEPASS.ErrorStrings = {
	[BATTLEPASS.ErrorCodes.PURCHASE_ERROR] = "BATTLEPASS/FAILED_PURCHASE",
	[BATTLEPASS.ErrorCodes.PREMIUM_ERROR] = "BATTLEPASS/FAILED_ACTIVATE",
	[BATTLEPASS.ErrorCodes.TIER_ERROR] = "BATTLEPASS/FAILED_CLAIM",
	[BATTLEPASS.ErrorCodes.BUNDLE_PREMIUM_ERROR] = "BATTLEPASS/FAILED_ACTIVATE",
	[BATTLEPASS.ErrorCodes.BUNDLE_TIER_ERROR] = "BATTLEPASS/FAILED_CLAIM"
}
BATTLEPASS.ItemTileImages = {}

function BATTLEPASS.GetItemTileImages(arg_1_0)
	if next(BATTLEPASS.ItemTileImages) == nil and arg_1_0 and arg_1_0.controllerIndex then
		BATTLEPASS.GetAllTiersData(arg_1_0.controllerIndex, nil, nil, false)
	end

	return BATTLEPASS.ItemTileImages
end

function BATTLEPASS.AddItemTileImage(arg_2_0, arg_2_1)
	if arg_2_0 then
		local var_2_0 = LOOT.GetLootFileForID(arg_2_1)

		if var_2_0 then
			local var_2_1 = StringTable.DIFCHIGDFB(var_2_0, 0, arg_2_1, 1)

			BATTLEPASS.ItemTileImages[var_2_1 .. arg_2_1] = arg_2_0
		end
	end
end

function BATTLEPASS.GetPurchaseRef()
	if not BATTLEPASS.purchaseRef then
		BATTLEPASS.purchaseRef = {}
	end

	local var_3_0 = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if not BATTLEPASS.purchaseRef[var_3_0] then
		BATTLEPASS.purchaseRef[var_3_0] = StringTable.CEBAGDAEJJ(CSV.battlePassIDs.file, {
			{
				col = CSV.battlePassIDs.cols.season,
				key = tostring(var_3_0)
			},
			{
				col = CSV.battlePassIDs.cols.type,
				key = tostring(BATTLEPASS.ItemTypes.PREMIUM)
			}
		}, CSV.battlePassIDs.cols.ref)
	end

	return BATTLEPASS.purchaseRef[var_3_0]
end

function BATTLEPASS.GetPurchaseBundleRef()
	if not BATTLEPASS.purchaseBundleRef then
		BATTLEPASS.purchaseBundleRef = {}
	end

	local var_4_0 = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if not BATTLEPASS.purchaseBundleRef[var_4_0] then
		local var_4_1 = ""

		if Engine.CIEGIACHAE() and var_4_0 > 0 then
			var_4_1 = "sy"
		end

		BATTLEPASS.purchaseBundleRef[var_4_0] = StringTable.CEBAGDAEJJ(CSV.battlePassIDs.file, {
			{
				col = CSV.battlePassIDs.cols.season,
				key = tostring(var_4_0)
			},
			{
				col = CSV.battlePassIDs.cols.type,
				key = tostring(BATTLEPASS.ItemTypes.BUNDLE)
			},
			{
				col = CSV.battlePassIDs.cols.platformExclusiveType,
				key = var_4_1
			}
		}, CSV.battlePassIDs.cols.ref)
	end

	return BATTLEPASS.purchaseBundleRef[var_4_0]
end

function BATTLEPASS.GetTierSkipPurchaseRef()
	if not BATTLEPASS.tierSkipPurchaseRef then
		BATTLEPASS.tierSkipPurchaseRef = {}
	end

	local var_5_0 = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if not BATTLEPASS.tierSkipPurchaseRef[var_5_0] then
		local var_5_1 = BATTLEPASS.GetPurchaseRef()
		local var_5_2
		local var_5_3 = LOOT.GetItemGameSource({
			type = LOOT.itemTypes.BATTLE_PASS,
			ref = var_5_1
		})

		if var_5_3 == LUI.GAME_SOURCE_ID.VANGUARD then
			var_5_2 = BATTLEPASS.S4_SKIP_VALUE_REF
		elseif var_5_3 == LUI.GAME_SOURCE_ID.COLD_WAR then
			var_5_2 = BATTLEPASS.T9_SKIP_VALUE_REF
		else
			var_5_2 = BATTLEPASS.MW_SKIP_VALUE_REF
		end

		BATTLEPASS.tierSkipPurchaseRef[var_5_0] = var_5_2
	end

	return BATTLEPASS.tierSkipPurchaseRef[var_5_0]
end

function BATTLEPASS.GetErrorMessage(arg_6_0, arg_6_1)
	if arg_6_0 == BATTLEPASS.ErrorCodes.PURCHASE_ERROR or arg_6_0 == BATTLEPASS.ErrorCodes.PREMIUM_ERROR or arg_6_0 == BATTLEPASS.ErrorCodes.BUNDLE_PREMIUM_ERROR or arg_6_0 == BATTLEPASS.ErrorCodes.TIER_ERROR or arg_6_0 == BATTLEPASS.ErrorCodes.BUNDLE_TIER_ERROR then
		if tonumber(BATTLEPASS.GetItemType(arg_6_1)) == BATTLEPASS.ItemTypes.TIER_SKIP then
			return Engine.CBBHFCGDIC(BATTLEPASS.ErrorStrings[arg_6_0], "BATTLEPASS/TIER")
		else
			return Engine.CBBHFCGDIC(BATTLEPASS.ErrorStrings[arg_6_0], BATTLEPASS.GetItemName(arg_6_1))
		end
	else
		assert(false, "BATTLEPASS.GetErrorMessage() unknown error code " .. arg_6_0)

		return ""
	end
end

function BATTLEPASS.GetErrorCode(arg_7_0, arg_7_1)
	assert(arg_7_0 and arg_7_1, "Usage: BATTLEPASS.GetErrorCode( eventName, ref )")

	if arg_7_0 == "loot_item_transaction_error" then
		return BATTLEPASS.ErrorCodes.PURCHASE_ERROR
	elseif arg_7_0 == "battlepass_activation_failed" or arg_7_0 == "battlepass_send_event_failed" then
		if tonumber(BATTLEPASS.GetItemType(arg_7_1)) == BATTLEPASS.ItemTypes.TIER_SKIP then
			return BATTLEPASS.ErrorCodes.TIER_ERROR
		else
			return BATTLEPASS.ErrorCodes.PREMIUM_ERROR
		end
	else
		assert(false, "BATTLEPASS.GetErrorCode() unknown event \"" .. arg_7_0 .. "\"")

		return BATTLEPASS.ErrorCodes.UNKNOWN_ERROR
	end
end

function BATTLEPASS.IsPendingTransactions(arg_8_0)
	local var_8_0 = false
	local var_8_1 = false
	local var_8_2 = tonumber(BATTLEPASS.GetItemID(BATTLEPASS.GetPurchaseRef()))
	local var_8_3 = var_8_2 and Loot.DEBEIFJEEG(arg_8_0, var_8_2) > 0 or false
	local var_8_4, var_8_5 = BATTLEPASS.GetPendingTierSkips(arg_8_0)
	local var_8_6 = var_8_5 > 0

	return var_8_3, var_8_6
end

function BATTLEPASS.TierSkipHasIndividualChallenges(arg_9_0)
	return arg_9_0 == BATTLEPASS.T9_SKIP_VALUE_REF or arg_9_0 == BATTLEPASS.S4_SKIP_VALUE_REF
end

function BATTLEPASS.GetPendingTierSkips(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = 0
	local var_10_2 = BATTLEPASS.GetTierSkipPurchaseRef()
	local var_10_3 = tonumber(BATTLEPASS.GetItemID(var_10_2))
	local var_10_4 = Loot.DEBEIFJEEG(arg_10_0, var_10_3)
	local var_10_5 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, var_10_2, CSV.battlePassIDs.cols.skips))

	if BATTLEPASS.TierSkipHasIndividualChallenges(var_10_2) and var_10_4 > 0 then
		var_10_5 = var_10_4
		var_10_4 = 1
	end

	for iter_10_0 = 1, var_10_4 do
		table.insert(var_10_0, {
			skips = var_10_5,
			ref = var_10_2
		})

		var_10_1 = var_10_1 + var_10_5
	end

	return var_10_0, var_10_1
end

function BATTLEPASS.GetItemTable(arg_11_0)
	local var_11_0 = arg_11_0 or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_11_1 = CSV.battlePassSeason.GetFile(var_11_0)
	local var_11_2 = {}

	if var_11_1 ~= nil then
		for iter_11_0 = 0, StringTable.BFHCAIIDA(var_11_1) - 1 do
			local var_11_3 = CSV.ReadRowWithFile(CSV.battlePassSeason, var_11_1, iter_11_0)
			local var_11_4 = split(var_11_3.lootID, "|")

			for iter_11_1, iter_11_2 in ipairs(var_11_4) do
				var_11_2[iter_11_2] = var_11_3
			end
		end
	end

	return var_11_2
end

function BATTLEPASS.GetAllTiersData(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	if arg_12_2 and arg_12_1 and arg_12_2 <= arg_12_1 then
		return {}
	end

	BATTLEPASS.ItemTileImages = {}

	local var_12_0 = {}

	arg_12_1 = arg_12_1 or 0

	if CONDITIONS.IsPostSeasonAndMagma() then
		return
	end

	arg_12_2 = arg_12_2 or StringTable.BFHCAIIDA(CSV.battlePassSeason.GetFile()) - 1

	for iter_12_0 = arg_12_1, arg_12_2 do
		local var_12_1 = CSV.ReadRowWithFile(CSV.battlePassSeason, CSV.battlePassSeason.GetFile(), iter_12_0)
		local var_12_2 = split(var_12_1.lootID, "|")
		local var_12_3 = split(var_12_1.billboardImage, "|")
		local var_12_4 = split(var_12_1.tileImage, "|")
		local var_12_5 = split(var_12_1.challengeID, "|")
		local var_12_6 = tonumber(var_12_1.level)
		local var_12_7 = tonumber(var_12_1.numVisibleLoot)
		local var_12_8 = false

		if var_12_6 == BATTLEPASS.BUNDLE_TOPPER_ITEM_LEVEL then
			for iter_12_1 = 1, var_12_7 do
				if Loot.DEBEIFJEEG(arg_12_0, var_12_2[iter_12_1]) > 0 then
					var_12_8 = true

					break
				end
			end
		end

		if not (var_12_6 == BATTLEPASS.BUNDLE_TOPPER_ITEM_LEVEL and (arg_12_3 or not CONDITIONS.IsBattlePassBundleTopperActive() and not var_12_8)) then
			local function var_12_9(arg_13_0, arg_13_1)
				local var_13_0 = var_12_2[arg_13_1]
				local var_13_1 = {
					lootID = var_13_0,
					billboardImage = var_12_3[arg_13_1] or "",
					challengeID = var_12_5[arg_13_1] or "",
					subTierID = arg_13_1
				}

				table.insert(arg_13_0, var_13_1)
				BATTLEPASS.AddItemTileImage(var_12_4[arg_13_1], var_13_0)
			end

			if var_12_6 == 0 or var_12_6 == BATTLEPASS.BUNDLE_TOPPER_ITEM_LEVEL then
				for iter_12_2 = 1, var_12_7 do
					local var_12_10 = LUI.ShallowCopy(var_12_1)

					var_12_10.showProgress = false
					var_12_10.lootTable = {}
					var_12_10.subTierID = iter_12_2

					var_12_9(var_12_10.lootTable, iter_12_2)
					table.insert(var_12_0, var_12_10)
				end
			else
				local var_12_11 = LUI.ShallowCopy(var_12_1)

				var_12_11.showProgress = true
				var_12_11.lootTable = {}
				var_12_11.subTierID = 1

				for iter_12_3 = 1, var_12_7 do
					var_12_9(var_12_11.lootTable, iter_12_3)
				end

				table.insert(var_12_0, var_12_11)
			end
		end
	end

	return var_12_0
end

function BATTLEPASS.GetAllRewards(arg_14_0, arg_14_1)
	if CONDITIONS.IsPostSeasonAndMagma() then
		return
	end

	local var_14_0 = {}
	local var_14_1 = BATTLEPASS.GetAllTiersData(arg_14_0, nil, nil, arg_14_1)

	for iter_14_0 = 1, #var_14_1 do
		for iter_14_1, iter_14_2 in ipairs(var_14_1[iter_14_0].lootTable) do
			local var_14_2 = tonumber(iter_14_2.lootID)
			local var_14_3 = LOOT.GetLootFileForID(var_14_2)

			if not var_14_3 or #var_14_3 == 0 then
				DebugPrint("BATTLEPASS.GetAllRewards - GetLootFileForID unable to find the LootFile for item " .. var_14_2 .. ". BATTLEPASS.GetAllRewards will skip building reward data.")
			else
				local var_14_4 = StringTable.DIFCHIGDFB(var_14_3, 0, var_14_2, 1)

				if var_14_4 and #var_14_4 > 0 then
					local var_14_5 = {
						ref = var_14_4,
						type = LOOT.GetTypeForID(var_14_2)
					}

					var_14_5.name = LOOT.GetItemName(var_14_5.type, var_14_4, var_14_2)
					var_14_5.image = LOOT.GetBattlepassImage(var_14_5.type, var_14_4, var_14_2)
					var_14_5.rarity = LOOT.GetItemQuality(var_14_5.type, var_14_4, var_14_2)
					var_14_5.rarityColor = LOOT.GetRarityColor(var_14_5.rarity)
					var_14_5.rarityImage = LOOT.GetRarityImage(var_14_5.rarity)

					if var_14_5.type == LOOT.itemTypes.FEATURE then
						var_14_5.isOperatorChallenge = LOOT.IsFeatureOperatorChallenge(var_14_5.ref)
					end

					table.insert(var_14_0, var_14_5)
				end
			end
		end
	end

	return var_14_0
end

function BATTLEPASS.GetXP(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1 or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	return Battlepass.BAGCGCIHAF(arg_15_0, var_15_0)
end

function BATTLEPASS.GetTierMinXP(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1 or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_16_1 = CSV.battlePassSeason.GetFile(var_16_0)

	return BATTLEPASS.GetTierMinXPByFile(arg_16_0, var_16_1)
end

function BATTLEPASS.GetTierMaxXP(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1 or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_17_1 = CSV.battlePassSeason.GetFile(var_17_0)

	return BATTLEPASS.GetTierMaxXPByFile(arg_17_0, var_17_1)
end

function BATTLEPASS.GetMaxTier(arg_18_0)
	local var_18_0 = arg_18_0 or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_18_1 = CSV.battlePassSeason.GetFile(var_18_0)

	return BATTLEPASS.GetMaxTierByFile(var_18_1)
end

function BATTLEPASS.GetTierByXP(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_2 or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_19_1 = CSV.battlePassSeason.GetFile(var_19_0)

	if var_19_1 == nil then
		return 0
	end

	return BATTLEPASS.GetTierByXPAndFile(arg_19_0, arg_19_1, var_19_1) or 0
end

function BATTLEPASS.GetTierMinXPByFile(arg_20_0, arg_20_1)
	return tonumber(StringTable.DIFCHIGDFB(arg_20_1, CSV.battlePassSeason.cols.level, arg_20_0, CSV.battlePassSeason.cols.xp))
end

function BATTLEPASS.GetTierMaxXPByFile(arg_21_0, arg_21_1)
	return tonumber(StringTable.DIFCHIGDFB(arg_21_1, CSV.battlePassSeason.cols.level, arg_21_0, CSV.battlePassSeason.cols.xp)) + tonumber(StringTable.DIFCHIGDFB(arg_21_1, CSV.battlePassSeason.cols.level, arg_21_0, CSV.battlePassSeason.cols.xpToNext))
end

function BATTLEPASS.GetMaxTierByFile(arg_22_0)
	local var_22_0 = StringTable.BFHCAIIDA(arg_22_0) - 1
	local var_22_1 = tonumber(StringTable.CBGJCDIHCE(arg_22_0, var_22_0, CSV.battlePassSeason.cols.level))

	if not var_22_1 then
		assert(false, "BATTLEPASS.GetMaxTierByFile() -> maxTier is nil")
	end

	return var_22_1
end

function BATTLEPASS.GetTierByXPAndFile(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = 0
	local var_23_1 = BATTLEPASS.GetMaxTierByFile(arg_23_2)
	local var_23_2
	local var_23_3
	local var_23_4

	if not var_23_1 or arg_23_1 == nil or arg_23_1 < 0 then
		return 0
	else
		local var_23_5 = BATTLEPASS.GetTierMinXPByFile(var_23_1, arg_23_2)

		if arg_23_1 >= BATTLEPASS.GetTierMaxXPByFile(var_23_1, arg_23_2) then
			return var_23_1
		end
	end

	while var_23_1 > var_23_0 + 1 do
		local var_23_6 = var_23_0 + math.floor((var_23_1 - var_23_0) / 2)
		local var_23_7 = BATTLEPASS.GetTierMinXPByFile(var_23_6, arg_23_2)
		local var_23_8 = BATTLEPASS.GetTierMaxXPByFile(var_23_6, arg_23_2)

		if var_23_7 <= arg_23_1 and arg_23_1 < var_23_8 then
			return var_23_6
		elseif var_23_8 <= arg_23_1 then
			var_23_0 = var_23_6
		elseif arg_23_1 < var_23_7 then
			var_23_1 = var_23_6
		end
	end

	local var_23_9 = BATTLEPASS.GetTierMinXPByFile(var_23_1, arg_23_2)
	local var_23_10 = BATTLEPASS.GetTierMaxXPByFile(var_23_1, arg_23_2)

	if var_23_9 <= arg_23_1 and arg_23_1 < var_23_10 then
		return var_23_1
	end

	local var_23_11 = BATTLEPASS.GetTierMinXPByFile(var_23_0, arg_23_2)
	local var_23_12 = BATTLEPASS.GetTierMaxXPByFile(var_23_0, arg_23_2)

	if var_23_11 <= arg_23_1 and arg_23_1 < var_23_12 then
		return var_23_0
	end
end

function BATTLEPASS.GetTier(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1 or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_24_1 = BATTLEPASS.GetXP(arg_24_0, var_24_0)

	return BATTLEPASS.GetTierByXP(arg_24_0, var_24_1, var_24_0)
end

function BATTLEPASS.GetTierLootID(arg_25_0)
	local var_25_0 = CSV.battlePassSeason.GetFile()

	return split(StringTable.DIFCHIGDFB(var_25_0, CSV.battlePassSeason.cols.level, arg_25_0, CSV.battlePassSeason.cols.lootID), "|")[1] or ""
end

function BATTLEPASS.GetTierFromID(arg_26_0, arg_26_1)
	local var_26_0 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_26_1, CSV.battlePassIDs.cols.season)
	local var_26_1 = BATTLEPASS.GetXP(arg_26_0, var_26_0)
	local var_26_2 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_26_1, CSV.battlePassIDs.cols.seasonFile)
	local var_26_3 = CSV.battlePassSeason.GetFullFilePath(var_26_2)

	return BATTLEPASS.GetTierByXPAndFile(arg_26_0, var_26_1, var_26_3) or 0
end

function BATTLEPASS.IsTierUnlock(arg_27_0)
	arg_27_0 = tonumber(arg_27_0)

	local var_27_0 = CSV.battlePassSeason.GetFile()

	for iter_27_0 = 0, BATTLEPASS.GetMaxTier() do
		local var_27_1 = split(StringTable.DIFCHIGDFB(var_27_0, CSV.battlePassSeason.cols.level, iter_27_0, CSV.battlePassSeason.cols.lootID), "|")
		local var_27_2 = var_27_1 and #var_27_1 or 0

		for iter_27_1 = 1, var_27_2 do
			local var_27_3 = tonumber(var_27_1[iter_27_1])

			if var_27_3 and var_27_3 >= 0 and arg_27_0 == var_27_3 then
				return true
			end
		end
	end

	return false
end

function BATTLEPASS.GetTierMultiLootIDs(arg_28_0, arg_28_1)
	local var_28_0 = CSV.battlePassSeason.GetFile()
	local var_28_1 = split(StringTable.DIFCHIGDFB(var_28_0, CSV.battlePassSeason.cols.level, arg_28_1, CSV.battlePassSeason.cols.lootID), "|")
	local var_28_2 = BATTLEPASS.GetTierSplitItemIDs(arg_28_1)
	local var_28_3 = tonumber(StringTable.DIFCHIGDFB(var_28_0, CSV.battlePassSeason.cols.level, arg_28_1, CSV.battlePassSeason.cols.numVisibleLoot))
	local var_28_4 = {}

	for iter_28_0 = 1, var_28_3 do
		local var_28_5 = tonumber(var_28_1[iter_28_0])

		if var_28_5 and var_28_5 >= 0 then
			table.insert(var_28_4, var_28_5)
		else
			assert(false, "Invalid lootID")
		end

		local var_28_6 = tonumber(var_28_2[iter_28_0])

		if var_28_6 and var_28_6 > 0 then
			table.insert(var_28_4, var_28_6)
		end
	end

	return var_28_4
end

function BATTLEPASS.GetTierLootIsFree(arg_29_0, arg_29_1)
	local var_29_0 = CSV.battlePassSeason.GetFile()

	return StringTable.DIFCHIGDFB(var_29_0, CSV.battlePassSeason.cols.level, arg_29_1, CSV.battlePassSeason.cols.isFree) == "1"
end

function BATTLEPASS.GetTierLootIsShowcased(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = CSV.battlePassSeason.GetFile()
	local var_30_1

	var_30_1 = arg_30_2 ~= nil and arg_30_2 or 1

	local var_30_2 = split(StringTable.DIFCHIGDFB(var_30_0, CSV.battlePassSeason.cols.level, arg_30_1, CSV.battlePassSeason.cols.isShowcased), "|")

	return var_30_2[arg_30_2] and var_30_2[arg_30_2] == "1" or false
end

function BATTLEPASS.GetShowcaseTiers(arg_31_0, arg_31_1)
	local var_31_0 = CSV.battlePassSeason.GetFile()
	local var_31_1 = {}

	for iter_31_0 = StringTable.BFHCAIIDA(var_31_0) - 1, 0, -1 do
		if BATTLEPASS.GetTierLootIsShowcased(arg_31_0, iter_31_0) then
			table.insert(var_31_1, iter_31_0)
		end
	end

	return var_31_1
end

function BATTLEPASS.GetTierLootIsPromoted(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = CSV.battlePassSeason.GetFile()
	local var_32_1

	var_32_1 = arg_32_2 ~= nil and arg_32_2 or 1

	local var_32_2 = split(StringTable.DIFCHIGDFB(var_32_0, CSV.battlePassSeason.cols.level, arg_32_1, CSV.battlePassSeason.cols.isPromoted), "|")

	return var_32_2[arg_32_2] and var_32_2[arg_32_2] == "1" or false
end

function BATTLEPASS.GetTierLootChallengeID(arg_33_0, arg_33_1)
	local var_33_0 = CSV.battlePassSeason.GetFile()

	return split(StringTable.DIFCHIGDFB(var_33_0, CSV.battlePassSeason.cols.level, arg_33_1, CSV.battlePassSeason.cols.challengeID), "|")[1] or ""
end

function BATTLEPASS.GetTierSplitItemIDs(arg_34_0)
	local var_34_0 = CSV.battlePassSeason.GetFile()

	return (split(StringTable.DIFCHIGDFB(var_34_0, CSV.battlePassSeason.cols.level, arg_34_0, CSV.battlePassSeason.cols.splitTierIDs), "|"))
end

function BATTLEPASS.GetTierSplitBillboardImages(arg_35_0)
	local var_35_0 = CSV.battlePassSeason.GetFile()

	return (split(StringTable.DIFCHIGDFB(var_35_0, CSV.battlePassSeason.cols.level, arg_35_0, CSV.battlePassSeason.cols.splitTierBillboardImages), "|"))
end

function BATTLEPASS.GetTierSplitTileImages(arg_36_0)
	local var_36_0 = CSV.battlePassSeason.GetFile()

	return (split(StringTable.DIFCHIGDFB(var_36_0, CSV.battlePassSeason.cols.level, arg_36_0, CSV.battlePassSeason.cols.splitTierTileImages), "|"))
end

function BATTLEPASS.GetTierCODPoints(arg_37_0, arg_37_1)
	local var_37_0 = CSV.battlePassSeason.GetFile()

	return StringTable.DIFCHIGDFB(var_37_0, CSV.battlePassSeason.cols.level, arg_37_1, CSV.battlePassSeason.cols.codPoints)
end

function BATTLEPASS.GetTierPercentageFromXP(arg_38_0, arg_38_1)
	local var_38_0 = CSV.battlePassSeason.GetFile()
	local var_38_1 = BATTLEPASS.GetTierByXP(arg_38_0, arg_38_1)
	local var_38_2 = tonumber(StringTable.DIFCHIGDFB(var_38_0, CSV.battlePassSeason.cols.level, var_38_1, CSV.battlePassSeason.cols.xp))
	local var_38_3 = var_38_2 + tonumber(StringTable.DIFCHIGDFB(var_38_0, CSV.battlePassSeason.cols.level, var_38_1, CSV.battlePassSeason.cols.xpToNext))
	local var_38_4 = (arg_38_1 - var_38_2) / (var_38_3 - var_38_2)

	return LUI.clamp(var_38_4, 0, 1)
end

function BATTLEPASS.Purchase(arg_39_0, arg_39_1)
	assert(arg_39_1)
	Battlepass.GAICDBJEC(arg_39_0, arg_39_1)
end

function BATTLEPASS.Activate(arg_40_0, arg_40_1, arg_40_2)
	assert(arg_40_1)
	assert(arg_40_2)
	Battlepass.CBHBFIJDHG(arg_40_0, arg_40_1, arg_40_2)
end

function BATTLEPASS.SendEvent(arg_41_0, arg_41_1)
	Battlepass.BHAGDBCJDJ(arg_41_0, arg_41_1)
end

function BATTLEPASS.IsOwned(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = tonumber(arg_42_1) or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if var_42_0 >= SEASON.WZ_LEGACY_SEASON_NUM and CONDITIONS.IsPostSeasonAndMagma() then
		return false
	end

	DebugPrint("BATTLEPASS.IsOwned - > controllerIndex ( before forced validation ) = " .. tostring(arg_42_0))

	arg_42_0 = tonumber(arg_42_0) or Engine.IJEBHJIJF()

	DebugPrint("BATTLEPASS.IsOwned - > controllerIndex = " .. tostring(arg_42_0))
	DebugPrint("BATTLEPASS.IsOwned - > seasonToUse = " .. tostring(var_42_0))

	if Battlepass.DEBEIFJEEG(arg_42_0, var_42_0) then
		return true
	end

	if not arg_42_2 then
		return false
	end

	local var_42_1 = tonumber(BATTLEPASS.GetItemID(BATTLEPASS.GetPurchaseRef()))

	if var_42_1 then
		DebugPrint("BATTLEPASS.IsOwned - > itemID = " .. tostring(var_42_1))

		return Loot.DEBEIFJEEG(arg_42_0, var_42_1) > 0
	end

	return false
end

function BATTLEPASS.NeedFixUp(arg_43_0)
	assert(arg_43_0)

	return Battlepass.DFIJFJGED(arg_43_0)
end

function BATTLEPASS.FixUp(arg_44_0)
	assert(arg_44_0)
	Battlepass.BEBDCFAHB(arg_44_0)
end

function BATTLEPASS.HasSeenItem(arg_45_0, arg_45_1)
	return Loot.HDJCADADF(arg_45_0, arg_45_1)
end

function BATTLEPASS.MarkItemSeen(arg_46_0, arg_46_1)
	return Loot.DAGICBIGDH(arg_46_0, arg_46_1)
end

function BATTLEPASS.MarkPassSeenForSeason(arg_47_0, arg_47_1)
	local var_47_0 = StringTable.BFHCAIIDA(CSV.battlePassIDs.file)

	for iter_47_0 = 0, var_47_0 - 1 do
		local var_47_1 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_47_0, CSV.battlePassIDs.cols.id))
		local var_47_2 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_47_0, CSV.battlePassIDs.cols.season)) or 0

		if var_47_2 and var_47_2 == arg_47_1 then
			BATTLEPASS.MarkItemSeen(arg_47_0, var_47_1)
		end
	end
end

function BATTLEPASS.HasNewPassForSeason(arg_48_0)
	local var_48_0 = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_48_1 = StringTable.BFHCAIIDA(CSV.battlePassIDs.file)

	for iter_48_0 = 0, var_48_1 - 1 do
		local var_48_2 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_48_0, CSV.battlePassIDs.cols.id))
		local var_48_3 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_48_0, CSV.battlePassIDs.cols.season)) or 0
		local var_48_4 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_48_0, CSV.battlePassIDs.cols.type)) or -1
		local var_48_5 = var_48_3 > 0 and var_48_3 == var_48_0
		local var_48_6 = var_48_4 == BATTLEPASS.ItemTypes.PREMIUM
		local var_48_7 = BATTLEPASS.HasSeenItem(arg_48_0, var_48_2)

		if var_48_5 and var_48_6 and not var_48_7 then
			return true
		end
	end
end

function BATTLEPASS.HasNewItems(arg_49_0)
	if CONDITIONS.IsPostSeason() then
		return false
	end

	if BATTLEPASS.HasNewPassForSeason(arg_49_0) then
		return true
	end

	local var_49_0 = BATTLEPASS.GetLastMenuXP(arg_49_0)
	local var_49_1 = BATTLEPASS.GetXP(arg_49_0)
	local var_49_2 = BATTLEPASS.GetTierByXP(arg_49_0, var_49_0)
	local var_49_3 = BATTLEPASS.GetTierByXP(arg_49_0, var_49_1)
	local var_49_4 = var_49_3 == BATTLEPASS.GetMaxTier()
	local var_49_5, var_49_6 = BATTLEPASS.IsPendingTransactions(arg_49_0)

	if (var_49_5 or var_49_6) and not var_49_4 then
		return true
	end

	if var_49_2 < var_49_3 then
		return true
	end
end

function BATTLEPASS.GetLastMenuXP(arg_50_0)
	local var_50_0 = BATTLEPASS.GetXP(arg_50_0)
	local var_50_1 = PlayerData.BFFBGAJGD(arg_50_0, CoD.StatsGroup.NonGame)
	local var_50_2 = tonumber(var_50_1.lastBattlePassMenuXp:get())

	if var_50_0 < var_50_2 then
		BATTLEPASS.SetLastMenuXP(arg_50_0, var_50_0)

		return var_50_0
	end

	return var_50_2
end

function BATTLEPASS.SetLastMenuXP(arg_51_0, arg_51_1)
	PlayerData.BFFBGAJGD(arg_51_0, CoD.StatsGroup.NonGame).lastBattlePassMenuXp:set(arg_51_1)
	Engine.DAGFFDGFII("uploadstats", arg_51_0)
end

function BATTLEPASS.GetLastFreeTierSeen(arg_52_0)
	local var_52_0 = PlayerData.BFFBGAJGD(arg_52_0, CoD.StatsGroup.NonGame)
	local var_52_1 = tonumber(var_52_0.lastBattlePassFreeTierSeen:get())
	local var_52_2 = var_52_1 > 0 and var_52_1 - 1 or 0

	if BATTLEPASS.GetXP(arg_52_0) < BATTLEPASS.GetTierMinXP(var_52_2) then
		BATTLEPASS.SetLastFreeTierSeen(arg_52_0, 0)

		return 0
	end

	return var_52_1
end

function BATTLEPASS.SetLastFreeTierSeen(arg_53_0, arg_53_1)
	PlayerData.BFFBGAJGD(arg_53_0, CoD.StatsGroup.NonGame).lastBattlePassFreeTierSeen:set(arg_53_1)
	Engine.DAGFFDGFII("uploadstats", arg_53_0)
end

function BATTLEPASS.GetNextTier(arg_54_0)
	local var_54_0 = BATTLEPASS.GetTier(arg_54_0)

	return var_54_0 >= BATTLEPASS.GetMaxTier() and BATTLEPASS.GetMaxTier() or var_54_0 + 1
end

function BATTLEPASS.GetLastFreeTierReached(arg_55_0)
	local var_55_0 = BATTLEPASS.GetXP(arg_55_0)
	local var_55_1 = BATTLEPASS.GetTierByXP(arg_55_0, var_55_0)
	local var_55_2 = var_55_1 >= BATTLEPASS.GetMaxTier() and BATTLEPASS.GetMaxTier() or var_55_1 + 1
	local var_55_3 = CSV.battlePassSeason.GetFile()

	for iter_55_0 = BATTLEPASS.GetMaxTier(), 1, -1 do
		if BATTLEPASS.GetTierLootIsFree(arg_55_0, iter_55_0) and iter_55_0 <= var_55_2 then
			local var_55_4 = BATTLEPASS.GetTierMinXP(iter_55_0 - 1)
			local var_55_5 = BATTLEPASS.GetTierMaxXP(iter_55_0 - 1)

			if (var_55_0 - var_55_4) / (var_55_5 - var_55_4) > BATTLEPASS.TierUpsellPopupXPThreshold then
				return iter_55_0
			end
		end
	end

	return var_55_2
end

function BATTLEPASS.GetNextFreeTier(arg_56_0)
	local var_56_0 = BATTLEPASS.GetNextTier(arg_56_0)
	local var_56_1 = CSV.battlePassSeason.GetFile()
	local var_56_2 = BATTLEPASS.GetMaxTier()

	for iter_56_0 = var_56_0, var_56_2 do
		if BATTLEPASS.GetTierLootIsFree(arg_56_0, iter_56_0) then
			return iter_56_0
		end
	end

	return 1
end

function BATTLEPASS.ShouldShowFreeTierUpsell(arg_57_0)
	if not Dvar.IBEGCHEFE("MPMTRSQLLO") then
		return false
	end

	if BATTLEPASS.IsOwned(arg_57_0, nil, true) then
		return false
	end

	if CONDITIONS.IsPostSeason() then
		return false
	end

	local var_57_0 = BATTLEPASS.GetNextTier(arg_57_0)
	local var_57_1 = BATTLEPASS.GetLastFreeTierSeen(arg_57_0)

	if var_57_0 < BATTLEPASS.TierUpsellMinTier or var_57_0 <= var_57_1 then
		return false
	end

	local var_57_2 = BATTLEPASS.GetXP(arg_57_0)
	local var_57_3 = BATTLEPASS.GetTierByXP(arg_57_0, var_57_2)
	local var_57_4 = BATTLEPASS.GetTierMinXP(var_57_3)
	local var_57_5 = BATTLEPASS.GetTierMaxXP(var_57_3)

	if (var_57_2 - var_57_4) / (var_57_5 - var_57_4) < BATTLEPASS.TierUpsellPopupXPThreshold then
		return false
	end

	return (BATTLEPASS.GetTierLootIsFree(arg_57_0, var_57_0))
end

function BATTLEPASS.GetItemRef(arg_58_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_58_0, CSV.battlePassIDs.cols.ref)
end

function BATTLEPASS.GetItemID(arg_59_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_59_0, CSV.battlePassIDs.cols.id)
end

function BATTLEPASS.GetItemSKU(arg_60_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_60_0, CSV.battlePassIDs.cols.sku)
end

function BATTLEPASS.GetItemType(arg_61_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_61_0, CSV.battlePassIDs.cols.type)
end

function BATTLEPASS.GetItemSeason(arg_62_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_62_0, CSV.battlePassIDs.cols.season)
end

function BATTLEPASS.GetItemName(arg_63_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_63_0, CSV.battlePassIDs.cols.name)
end

function BATTLEPASS.GetItemImage(arg_64_0)
	local var_64_0 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_64_0, CSV.battlePassIDs.cols.previewImage)

	if var_64_0 and var_64_0 ~= "" then
		return var_64_0
	end

	return BATTLEPASS.GetBaseEmblem()
end

function BATTLEPASS.GetItemLargeImage(arg_65_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_65_0, CSV.battlePassIDs.cols.imageLarge)
end

function BATTLEPASS.GetItemCost(arg_66_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_66_0, CSV.battlePassIDs.cols.currencyAmount)
end

function BATTLEPASS.GetItemCostByID(arg_67_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_67_0, CSV.battlePassIDs.cols.currencyAmount)
end

function BATTLEPASS.GetNumItems(arg_68_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_68_0, CSV.battlePassIDs.cols.numItems)
end

function BATTLEPASS.GetItemSkips(arg_69_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_69_0, CSV.battlePassIDs.cols.skips)
end

function BATTLEPASS.GetBundleItemIDs(arg_70_0)
	local var_70_0 = {}
	local var_70_1 = tonumber(BATTLEPASS.GetNumItems(arg_70_0)) or 0

	for iter_70_0 = 1, var_70_1 do
		local var_70_2 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_70_0, CSV.battlePassIDs.cols["item" .. iter_70_0])

		if #var_70_2 > 0 then
			table.insert(var_70_0, var_70_2)
		end
	end

	return var_70_0
end

function BATTLEPASS.GetItemValue(arg_71_0)
	local var_71_0 = 0
	local var_71_1 = BATTLEPASS.GetItemID(arg_71_0)
	local var_71_2 = BATTLEPASS.GetBundleItemIDs(arg_71_0)

	for iter_71_0 = 1, #var_71_2 do
		local var_71_3 = var_71_2[iter_71_0]

		if LOOT.GetTypeForID(var_71_3) == LOOT.itemTypes.BATTLE_PASS then
			local var_71_4 = 1

			if LOOT.IsMWItem({
				itemID = var_71_3
			}) == false then
				local var_71_5 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, var_71_3, CSV.battlePassIDs.cols.type)

				if var_71_5 ~= "" and tonumber(var_71_5) == BATTLEPASS.ItemTypes.TIER_SKIP then
					var_71_4 = BATTLEPASS.GetNumSkipsInBundle(arg_71_0)
				end
			end

			var_71_0 = var_71_0 + BATTLEPASS.GetItemCostByID(var_71_3) * var_71_4
		end
	end

	return var_71_0
end

function BATTLEPASS.GetNumSkipsInBundle(arg_72_0)
	local var_72_0 = 0
	local var_72_1 = StringTable.BJJBBCJGEJ(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_72_0)

	if not var_72_1 or var_72_1 < 0 then
		return var_72_0
	end

	local var_72_2 = CSV.ReadRow({
		file = CSV.battlePassIDs.file,
		cols = CSV.battlePassIDs.cols
	}, var_72_1)

	if var_72_2 then
		local var_72_3 = tonumber(var_72_2.skips)

		if var_72_3 > 0 then
			var_72_0 = var_72_0 + var_72_3
		else
			for iter_72_0 = 1, var_72_2.numItems do
				local var_72_4 = var_72_2["item" .. iter_72_0]
				local var_72_5 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, var_72_4, CSV.battlePassIDs.cols.skips))

				if var_72_5 then
					var_72_0 = var_72_0 + var_72_5
				end
			end
		end
	end

	return var_72_0
end

function BATTLEPASS.GetCodPointsInPass()
	local var_73_0 = 0
	local var_73_1 = CSV.battlePassSeason.GetFile()
	local var_73_2 = StringTable.BFHCAIIDA(var_73_1)

	for iter_73_0 = 0, var_73_2 - 1 do
		local var_73_3 = StringTable.DIFCHIGDFB(var_73_1, CSV.battlePassSeason.cols.level, iter_73_0, CSV.battlePassSeason.cols.codPoints)

		if #var_73_3 > 0 then
			var_73_0 = var_73_0 + tonumber(var_73_3)
		end
	end

	return var_73_0
end

function BATTLEPASS.GetActivationRefs(arg_74_0)
	local var_74_0 = {}
	local var_74_1 = StringTable.BJJBBCJGEJ(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_74_0)

	if var_74_1 < 0 then
		return var_74_0
	end

	local var_74_2 = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_74_3 = tostring(var_74_2)
	local var_74_4 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, var_74_1, CSV.battlePassIDs.cols.numItems))
	local var_74_5 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, var_74_1, CSV.battlePassIDs.cols.skips))

	if var_74_4 then
		for iter_74_0 = 1, var_74_4 do
			local var_74_6 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_74_0, CSV.battlePassIDs.cols["item" .. iter_74_0])

			if var_74_6 and #var_74_6 > 0 and LOOT.GetTypeForID(var_74_6) == LOOT.itemTypes.BATTLE_PASS then
				local var_74_7 = StringTable.BABCABFJEJ(CSV.battlePassIDs.file, {
					{
						col = CSV.battlePassIDs.cols.season,
						key = var_74_3
					},
					{
						col = CSV.battlePassIDs.cols.id,
						key = var_74_6
					}
				})

				if var_74_7 < 0 then
					var_74_7 = StringTable.BJJBBCJGEJ(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, var_74_6)
				end

				local var_74_8 = StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, var_74_7, CSV.battlePassIDs.cols.ref)
				local var_74_9 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, var_74_7, CSV.battlePassIDs.cols.type))
				local var_74_10 = var_74_9 == BATTLEPASS.ItemTypes.PREMIUM or var_74_9 == BATTLEPASS.ItemTypes.TIER_SKIP

				if var_74_8 and #var_74_8 > 0 and var_74_10 then
					local var_74_11 = 1

					if var_74_9 == BATTLEPASS.ItemTypes.TIER_SKIP and var_74_5 > 1 and LOOT.IsMWItem({
						itemID = var_74_6
					}) == false then
						var_74_11 = var_74_5
					end

					table.insert(var_74_0, {
						ref = var_74_8,
						quantity = var_74_11
					})
				end
			end
		end
	end

	return var_74_0
end

function BATTLEPASS.GetPreviewWeapon(arg_75_0, arg_75_1, arg_75_2)
	assert(arg_75_0)
	assert(arg_75_1)
	assert(arg_75_2)

	local var_75_0 = {}

	if arg_75_1 == LOOT.itemTypes.WEAPON then
		local var_75_1 = WEAPON.GenerateWeaponTableFromID(arg_75_0, arg_75_2)

		if var_75_1 then
			table.insert(var_75_0, var_75_1)
		else
			assert(false, "Unable to build weapon table for ID " .. arg_75_2)

			return
		end
	end

	local var_75_2 = LOADOUT.GetFavoriteLoadoutIndex(arg_75_0) or 0
	local var_75_3 = LOADOUT.GetLoadoutPlayerData(arg_75_0, var_75_2)

	if var_75_3 then
		local var_75_4 = WEAPON.GenerateWeaponTable(var_75_3.weaponSetups[0])

		if var_75_4 then
			table.insert(var_75_0, var_75_4)
		end
	end

	for iter_75_0 = 1, LOADOUT.DefaultClassCount do
		if iter_75_0 ~= var_75_2 then
			local var_75_5 = LOADOUT.GetLoadoutPlayerData(arg_75_0, iter_75_0)

			if var_75_5 then
				local var_75_6 = WEAPON.GenerateWeaponTable(var_75_5.weaponSetups[0])

				if var_75_6 then
					table.insert(var_75_0, var_75_6)
				end
			end
		end
	end

	local var_75_7 = WEAPON.DefaultPrimaryID
	local var_75_8 = WEAPON.GenerateWeaponTableFromID(arg_75_0, var_75_7)

	if var_75_8 then
		table.insert(var_75_0, var_75_8)
	end

	local function var_75_9(arg_76_0, arg_76_1, arg_76_2)
		if arg_76_0 == LOOT.itemTypes.WEAPON then
			return true
		elseif arg_76_0 == LOOT.itemTypes.OPERATOR or arg_76_0 == LOOT.itemTypes.OPERATOR_SKIN then
			return true
		elseif arg_76_0 == LOOT.itemTypes.CHARM then
			return arg_76_1
		elseif arg_76_0 == LOOT.itemTypes.STICKER then
			return arg_76_2
		end
	end

	for iter_75_1, iter_75_2 in ipairs(var_75_0) do
		local var_75_10 = false
		local var_75_11 = false

		if arg_75_1 == LOOT.itemTypes.CHARM and WEAPON.SupportsCosmetics(iter_75_2.weapon) then
			iter_75_2.cosmeticAttachment = LOOT.GetItemRef(LOOT.itemTypes.CHARM, arg_75_2)
			var_75_10 = true
		end

		local var_75_12 = WEAPON.GetMaxStickerSlotsForWeapon(iter_75_2.weapon)

		if arg_75_1 == LOOT.itemTypes.STICKER and var_75_12 > 0 then
			iter_75_2.stickers = {}

			for iter_75_3 = 1, var_75_12 do
				table.insert(iter_75_2.stickers, LOOT.GetItemRef(LOOT.itemTypes.STICKER, arg_75_2))
			end

			var_75_11 = true
		end

		if var_75_9(arg_75_1, var_75_10, var_75_11) then
			return iter_75_2
		end
	end
end

function BATTLEPASS.GetTierUnlockLootReward(arg_77_0, arg_77_1)
	local var_77_0 = BATTLEPASS.GetTierLootID(arg_77_1)
	local var_77_1 = LOOT.GetLootCardData(arg_77_0, var_77_0)

	if LOOT.GetTypeForID(var_77_0) == LOOT.itemTypes.FEATURE then
		local var_77_2 = BATTLEPASS.GetTierCODPoints(arg_77_0, arg_77_1)

		var_77_1.name = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS", var_77_2)
	end

	var_77_1.isFreeLoot = BATTLEPASS.GetTierLootIsFree(arg_77_0, arg_77_1)

	return var_77_1
end

function BATTLEPASS.GetTierMultiUnlockLootRewards(arg_78_0, arg_78_1)
	local var_78_0 = BATTLEPASS.GetTierMultiLootIDs(arg_78_0, arg_78_1)
	local var_78_1 = {}

	for iter_78_0, iter_78_1 in ipairs(var_78_0) do
		local var_78_2 = LOOT.GetTypeForID(iter_78_1)

		if var_78_2 then
			local var_78_3 = LOOT.GetLootCardData(arg_78_0, iter_78_1)

			if var_78_2 == LOOT.itemTypes.FEATURE and not var_78_3.isOperatorChallenge then
				local var_78_4 = BATTLEPASS.GetTierCODPoints(arg_78_0, arg_78_1)

				var_78_3.name = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS", var_78_4)
			end

			var_78_3.isFreeLoot = BATTLEPASS.GetTierLootIsFree(arg_78_0, arg_78_1)
			var_78_3.isPartOfSplitTier = #BATTLEPASS.GetTierSplitItemIDs(arg_78_1) > 0

			table.insert(var_78_1, var_78_3)
		end
	end

	return var_78_1
end

function BATTLEPASS.GetRecentTierUnlocks(arg_79_0, arg_79_1)
	local var_79_0 = BATTLEPASS.GetTier(arg_79_0)
	local var_79_1 = arg_79_1 and var_79_0 - arg_79_1 or 0

	if var_79_1 < 0 then
		var_79_1 = 0
	end

	local var_79_2 = {}

	while var_79_1 < var_79_0 do
		local var_79_3 = BATTLEPASS.GetTierMultiUnlockLootRewards(arg_79_0, var_79_0)

		var_79_3.tier = var_79_0

		for iter_79_0, iter_79_1 in ipairs(var_79_3) do
			table.insert(var_79_2, iter_79_1)
		end

		var_79_0 = var_79_0 - 1
	end

	return var_79_2
end

function BATTLEPASS.GetNextTierUnlocks(arg_80_0)
	local var_80_0 = BATTLEPASS.GetTier(arg_80_0)
	local var_80_1 = var_80_0 >= BATTLEPASS.GetMaxTier() and BATTLEPASS.GetMaxTier() or var_80_0 + 1

	return BATTLEPASS.GetTierMultiUnlockLootRewards(arg_80_0, var_80_1)
end

function BATTLEPASS.GetTierUnlocksByTier(arg_81_0, arg_81_1, arg_81_2)
	if arg_81_2 <= arg_81_1 then
		return {}
	end

	local var_81_0 = {}
	local var_81_1 = arg_81_1 + 1

	while var_81_1 <= arg_81_2 do
		local var_81_2 = BATTLEPASS.GetTierMultiUnlockLootRewards(arg_81_0, var_81_1)

		for iter_81_0, iter_81_1 in ipairs(var_81_2) do
			if not Dvar.IBEGCHEFE("NKPPMRTRRK") then
				if iter_81_1.ID and not LOOT.IsItemIDEquippableByS4(iter_81_1.ID) then
					table.insert(var_81_0, iter_81_1)
				end
			else
				table.insert(var_81_0, iter_81_1)
			end
		end

		var_81_1 = var_81_1 + 1
	end

	return var_81_0
end

function BATTLEPASS.GetMissionLevel(arg_82_0, arg_82_1)
	if CONDITIONS.IsPostSeasonAndMagma() then
		return
	end

	assert(arg_82_0, "Usage: BATTLEPASS.GetMissionLevel( <missionRef>, [season]")

	if not arg_82_0 then
		return
	end

	local var_82_0 = arg_82_1 or SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_82_1 = StringTable.BFHCAIIDA(CSV.battlePassSeason.GetFile(var_82_0))

	for iter_82_0 = 0, var_82_1 - 1 do
		local var_82_2 = CSV.ReadRowWithFile(CSV.battlePassSeason, CSV.battlePassSeason.GetFile(var_82_0), iter_82_0)
		local var_82_3 = split(var_82_2.challengeID, "|")
		local var_82_4 = tonumber(var_82_2.level)

		for iter_82_1, iter_82_2 in ipairs(var_82_3) do
			if arg_82_0 == iter_82_2 then
				return var_82_4
			end
		end
	end
end

function BATTLEPASS.GetTierItemName(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0

	if arg_83_2 then
		local var_83_1 = BATTLEPASS.GetTierMultiLootIDs(arg_83_0, arg_83_1)

		if arg_83_2 <= #var_83_1 then
			var_83_0 = var_83_1[arg_83_2]
		else
			var_83_0 = var_83_1[1]
		end
	else
		var_83_0 = BATTLEPASS.GetTierLootID(arg_83_1)
	end

	local var_83_2 = LOOT.GetTypeForID(var_83_0)
	local var_83_3 = LOOT.GetItemRef(var_83_2, var_83_0)
	local var_83_4

	if var_83_2 == LOOT.itemTypes.WEAPON then
		var_83_4 = WEAPON.GetLootWeaponName(var_83_3, var_83_0)
	elseif var_83_2 == LOOT.itemTypes.FEATURE then
		local var_83_5 = BATTLEPASS.GetTierCODPoints(arg_83_0, arg_83_1)

		var_83_4 = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS", var_83_5)
	else
		var_83_4 = LOOT.GetItemName(var_83_2, var_83_3)
	end

	return var_83_4
end

function BATTLEPASS.GetBaseEmblem()
	return BATTLEPASS.EMBLEM_BASE
end

function BATTLEPASS.GetCurrentEmblem(arg_85_0)
	if BATTLEPASS.IsOwned(arg_85_0) then
		return BATTLEPASS.GetEmblemGold()
	else
		return BATTLEPASS.GetEmblemSilver()
	end
end

function BATTLEPASS.GetEmblemGold()
	return BATTLEPASS.EMBLEM_GOLD
end

function BATTLEPASS.GetEmblemSilver()
	return BATTLEPASS.EMBLEM_SILVER
end

function BATTLEPASS.GetLootTierMap()
	local var_88_0 = {}
	local var_88_1 = CSV.battlePassSeason.GetFile()

	if var_88_1 == nil then
		return
	end

	local var_88_2 = StringTable.BFHCAIIDA(var_88_1)

	for iter_88_0 = 0, var_88_2 - 1 do
		local var_88_3 = CSV.ReadRowWithFile(CSV.battlePassSeason, var_88_1, iter_88_0)
		local var_88_4 = split(var_88_3.lootID, "|")

		for iter_88_1 = 1, #var_88_4 do
			var_88_0[tonumber(var_88_4[iter_88_1])] = var_88_3.level
		end
	end

	return var_88_0
end

function BATTLEPASS.BRRewardAvailable(arg_89_0)
	if not CONDITIONS.IsBattlePassEnabled() then
		return false
	end

	local var_89_0 = Dvar.IBEGCHEFE("NRONMTPKML")
	local var_89_1 = CONDITIONS.IsMagmaGameMode()
	local var_89_2 = PlayerData.BFFBGAJGD(arg_89_0, CoD.StatsGroup.Ranked).playerStats.modeStats.br.gamesPlayed:get()
	local var_89_3 = var_89_2 and var_89_2 > 0
	local var_89_4 = BATTLEPASS.GetTier(arg_89_0) >= BATTLEPASS.GetMaxTier()
	local var_89_5 = OnlineProgression.DFBEBDGCHJ(arg_89_0, BRLOOT.rewardsTypes.FIRST_MATCH_REWARD)

	return var_89_0 and var_89_1 and var_89_3 and not var_89_4 and not var_89_5
end

function BATTLEPASS.VIPGiftAvailable(arg_90_0)
	if not CONDITIONS.IsBattlePassEnabled() or CONDITIONS.IsQABotSkipActive() then
		return false
	end

	local var_90_0 = Dvar.CFHDGABACF("LTOQKNQLNP")
	local var_90_1 = Dvar.CFHDGABACF("LNTOLMQMOQ")

	if not var_90_0 or var_90_0 <= 0 or not var_90_1 or var_90_1 <= 0 then
		return false
	else
		return not STORE.IsBundleOwned(arg_90_0, var_90_0) and not STORE.IsBundleOwned(arg_90_0, var_90_1)
	end
end

function BATTLEPASS.GetVIPGifts(arg_91_0, arg_91_1, arg_91_2)
	if not arg_91_1 or arg_91_1 <= 0 then
		return
	end

	if STORE.IsBundleOwned(arg_91_0, arg_91_1) then
		return
	end

	local var_91_0 = LOOT.GetItemsInBundle(arg_91_1)

	if not var_91_0 or #var_91_0 <= 0 then
		return
	end

	local var_91_1 = {}

	arg_91_2 = math.min(arg_91_2, #var_91_0)

	for iter_91_0 = 1, arg_91_2 do
		table.insert(var_91_1, LOOT.GetLootCardData(arg_91_0, var_91_0[iter_91_0]))
	end

	return var_91_1
end

function BATTLEPASS.GetVIPFreeGifts(arg_92_0)
	return BATTLEPASS.GetVIPGifts(arg_92_0, Dvar.CFHDGABACF("LTOQKNQLNP"), BATTLEPASS.VIPNumFreeGifts)
end

function BATTLEPASS.GetVIPOwnerGifts(arg_93_0)
	return BATTLEPASS.GetVIPGifts(arg_93_0, Dvar.CFHDGABACF("LNTOLMQMOQ"), BATTLEPASS.VIPNumOwnerGifts)
end

function BATTLEPASS.ShowBPTrailer(arg_94_0)
	local var_94_0 = "main_menu_warzone_battlepass_trailer"

	Engine.BJDBIAGIDA(SOUND_SETS.default.action)
	LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, arg_94_0, false, {
		widescreen = true,
		video = var_94_0
	})
end

function BATTLEPASS.IsTierSkipGiftActive(arg_95_0)
	if not Dvar.IBEGCHEFE("MNLKTLKTPM") then
		return false
	end

	local var_95_0 = tonumber(BATTLEPASS.GetTierSkipGiftID())
	local var_95_1 = tonumber(BATTLEPASS.GetTierSkipGiftTimer())
	local var_95_2 = BATTLEPASS.GetTier(arg_95_0) >= BATTLEPASS.GetMaxTier()

	if var_95_0 and var_95_1 and not var_95_2 then
		local var_95_3 = Loot.DEBEIFJEEG(arg_95_0, var_95_0) > 0
		local var_95_4 = Engine.DEIDGHDBHD()

		if not var_95_3 and var_95_4 and var_95_4 < var_95_1 then
			return true
		end
	end

	return false
end

function BATTLEPASS.GetTierSkipGiftID()
	return Dvar.DHEEJCCJBH("LQLOKOPRKS") or ""
end

function BATTLEPASS.GetTierSkipGiftTimer()
	return Dvar.DHEEJCCJBH("OKRROQNRPK") or ""
end

function BATTLEPASS.AddPurchasePrompt(arg_98_0, arg_98_1, arg_98_2, arg_98_3)
	if not BATTLEPASS.IsOwned(arg_98_1) then
		arg_98_3 = arg_98_3 or 2

		arg_98_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("BATTLEPASS/PURCHASE_BATTLEPASS"),
			container = arg_98_2,
			priority = arg_98_3
		})
		arg_98_0.bindButton:addEventHandler("button_alt1", function(arg_99_0, arg_99_1)
			local var_99_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

			if var_99_0 then
				var_99_0.isPurchaseFromPreview = true

				ACTIONS.LeaveMenu(arg_98_0)
			end
		end)
	end
end

function BATTLEPASS.GetCurrentCPRewards(arg_100_0)
	if CONDITIONS.IsPostSeasonAndMagma() then
		return
	end

	local var_100_0 = BATTLEPASS.GetXP(arg_100_0)
	local var_100_1 = BATTLEPASS.GetTierByXP(arg_100_0, var_100_0)
	local var_100_2 = {}

	var_100_2.totalCP = 0
	var_100_2.codTiers = {}

	local var_100_3 = CSV.battlePassSeason
	local var_100_4 = BATTLEPASS.GetAllRewards(arg_100_0)

	for iter_100_0 = 0, var_100_1 do
		local var_100_5 = StringTable.CBGJCDIHCE(var_100_3.GetFile(), iter_100_0, var_100_3.cols.codPoints)

		if tonumber(var_100_5) > 0 then
			var_100_2.totalCP = var_100_2.totalCP + var_100_5

			table.insert(var_100_2.codTiers, iter_100_0)
		end
	end

	return var_100_2
end

function BATTLEPASS.GetTierByTotalCPRewards(arg_101_0, arg_101_1)
	local var_101_0 = 0
	local var_101_1 = CSV.battlePassSeason
	local var_101_2 = BATTLEPASS.GetAllRewards(arg_101_0)
	local var_101_3 = StringTable.BFHCAIIDA(CSV.battlePassSeason.GetFile())

	for iter_101_0 = 0, var_101_3 do
		local var_101_4 = StringTable.CBGJCDIHCE(var_101_1.GetFile(), iter_101_0, var_101_1.cols.codPoints)

		if tonumber(var_101_4) > 0 then
			var_101_0 = var_101_0 + var_101_4

			if arg_101_1 <= var_101_0 then
				return iter_101_0
			end
		end
	end

	return var_101_3
end

function BATTLEPASS.RecordVIPGiftEvent(arg_102_0, arg_102_1, arg_102_2, arg_102_3, arg_102_4)
	local var_102_0 = LUI.FlowManager.GetCurrentMenu(arg_102_2)._typeName or ""
	local var_102_1 = LUI.FlowManager.GetMenuNameAtIndex(arg_102_3) or ""
	local var_102_2 = Commerce.CEDDCGHIGA(arg_102_0, 20) or 0
	local var_102_3 = {
		previous_menu = var_102_1,
		current_menu = var_102_0,
		cp_balance = var_102_2,
		action = arg_102_1 or "",
		bp_owned = arg_102_4
	}

	Engine.CEJJDJJHIJ(arg_102_0, "dlog_event_store_vip_gift_bp_upsell", var_102_3)
end

function BATTLEPASS.GetCurrentSeasonGameExclusivity()
	local var_103_0 = {
		[LUI.GAME_SOURCE_ID.COLD_WAR] = {
			exclusivity = LOOT.itemSourceExclusivity.CW_WZ
		},
		[LUI.GAME_SOURCE_ID.WARZONE] = {
			exclusivity = LOOT.itemSourceExclusivity.WZ_EXCLUSIVE
		},
		[LUI.GAME_SOURCE_ID.MODERN_WARFARE] = {
			exclusivity = LOOT.itemSourceExclusivity.MW_WZ
		},
		[LUI.GAME_SOURCE_ID.VANGUARD] = {
			exclusivity = LOOT.itemSourceExclusivity.VG_WZ
		}
	}
	local var_103_1 = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})
	local var_103_2 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.season, var_103_1, CSV.battlePassIDs.cols.id))

	return var_103_0[LOOT.GetGameSourceIDFromItemID(var_103_2)].exclusivity
end
