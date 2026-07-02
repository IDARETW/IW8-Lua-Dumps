BATTLEPASS = BATTLEPASS or {}
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
BATTLEPASS.FullScreenPopupStates = {
	TIERS_UNLOCKED = 1,
	BATTLE_PASS_UNLOCKED = 0,
	BATTLE_PASS_COMPLETE = 3,
	BATTLE_PASS_TIER_BUNDLE_UNLOCKED = 2
}
BATTLEPASS.ItemTypes = {
	TIER_SKIP = 1,
	PREMIUM = 0,
	TRACKER = 3,
	BUNDLE = 2
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

function BATTLEPASS.GetPurchaseRef()
	if not BATTLEPASS.purchaseRef then
		BATTLEPASS.purchaseRef = {}
	end

	local var_1_0 = SEASON.GetCurrentSeason()

	if not BATTLEPASS.purchaseRef[var_1_0] then
		BATTLEPASS.purchaseRef[var_1_0] = StringTable.CEBAGDAEJJ(CSV.battlePassIDs.file, {
			{
				col = CSV.battlePassIDs.cols.season,
				key = tostring(var_1_0)
			},
			{
				col = CSV.battlePassIDs.cols.type,
				key = tostring(BATTLEPASS.ItemTypes.PREMIUM)
			}
		}, CSV.battlePassIDs.cols.ref)
	end

	return BATTLEPASS.purchaseRef[var_1_0]
end

function BATTLEPASS.GetPurchaseBundleRef()
	if not BATTLEPASS.purchaseBundleRef then
		BATTLEPASS.purchaseBundleRef = {}
	end

	local var_2_0 = SEASON.GetCurrentSeason()

	if not BATTLEPASS.purchaseBundleRef[var_2_0] then
		BATTLEPASS.purchaseBundleRef[var_2_0] = StringTable.CEBAGDAEJJ(CSV.battlePassIDs.file, {
			{
				col = CSV.battlePassIDs.cols.season,
				key = tostring(var_2_0)
			},
			{
				col = CSV.battlePassIDs.cols.type,
				key = tostring(BATTLEPASS.ItemTypes.BUNDLE)
			}
		}, CSV.battlePassIDs.cols.ref)
	end

	return BATTLEPASS.purchaseBundleRef[var_2_0]
end

function BATTLEPASS.GetErrorMessage(arg_3_0, arg_3_1)
	if arg_3_0 == BATTLEPASS.ErrorCodes.PURCHASE_ERROR or arg_3_0 == BATTLEPASS.ErrorCodes.PREMIUM_ERROR or arg_3_0 == BATTLEPASS.ErrorCodes.BUNDLE_PREMIUM_ERROR or arg_3_0 == BATTLEPASS.ErrorCodes.TIER_ERROR or arg_3_0 == BATTLEPASS.ErrorCodes.BUNDLE_TIER_ERROR then
		if tonumber(BATTLEPASS.GetItemType(arg_3_1)) == BATTLEPASS.ItemTypes.TIER_SKIP then
			return Engine.CBBHFCGDIC(BATTLEPASS.ErrorStrings[arg_3_0], "BATTLEPASS/TIER")
		else
			return Engine.CBBHFCGDIC(BATTLEPASS.ErrorStrings[arg_3_0], BATTLEPASS.GetItemName(arg_3_1))
		end
	else
		assert(false, "BATTLEPASS.GetErrorMessage() unknown error code " .. arg_3_0)

		return ""
	end
end

function BATTLEPASS.GetErrorCode(arg_4_0, arg_4_1)
	assert(arg_4_0 and arg_4_1, "Usage: BATTLEPASS.GetErrorCode( eventName, ref )")

	if arg_4_0 == "loot_item_transaction_error" then
		return BATTLEPASS.ErrorCodes.PURCHASE_ERROR
	elseif arg_4_0 == "battlepass_activation_failed" or arg_4_0 == "battlepass_send_event_failed" then
		if tonumber(BATTLEPASS.GetItemType(arg_4_1)) == BATTLEPASS.ItemTypes.TIER_SKIP then
			return BATTLEPASS.ErrorCodes.TIER_ERROR
		else
			return BATTLEPASS.ErrorCodes.PREMIUM_ERROR
		end
	else
		assert(false, "BATTLEPASS.GetErrorCode() unknown event \"" .. arg_4_0 .. "\"")

		return BATTLEPASS.ErrorCodes.UNKNOWN_ERROR
	end
end

function BATTLEPASS.IsPendingTransactions(arg_5_0)
	local var_5_0 = false
	local var_5_1 = false
	local var_5_2 = tonumber(BATTLEPASS.GetItemID(BATTLEPASS.GetPurchaseRef()))
	local var_5_3 = Loot.DEBEIFJEEG(arg_5_0, var_5_2) > 0
	local var_5_4, var_5_5 = BATTLEPASS.GetPendingTierSkips(arg_5_0)
	local var_5_6 = var_5_5 > 0

	return var_5_3, var_5_6
end

function BATTLEPASS.GetPendingTierSkips(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = 0

	for iter_6_0 = StringTable.BFHCAIIDA(CSV.battlePassIDs.file), 0, -1 do
		local var_6_2 = CSV.ReadRowWithFile(CSV.battlePassIDs, CSV.battlePassIDs.file, iter_6_0)

		if tonumber(BATTLEPASS.GetItemType(var_6_2.ref)) == BATTLEPASS.ItemTypes.TIER_SKIP then
			local var_6_3 = tonumber(BATTLEPASS.GetItemID(var_6_2.ref))
			local var_6_4 = Loot.DEBEIFJEEG(arg_6_0, var_6_3)
			local var_6_5 = tonumber(var_6_2.skips)

			for iter_6_1 = 1, var_6_4 do
				table.insert(var_6_0, var_6_5)

				var_6_1 = var_6_1 + var_6_5
			end
		end
	end

	return var_6_0, var_6_1
end

function BATTLEPASS.GetItemDetailsFromBattlePass(arg_7_0, arg_7_1)
	if not arg_7_0 then
		return
	end

	local var_7_0 = arg_7_1 or SEASON.GetCurrentSeason()
	local var_7_1 = CSV.battlePassSeason.GetFile(var_7_0)
	local var_7_2 = StringTable.BJJBBCJGEJ(var_7_1, CSV.battlePassSeason.cols.lootID, arg_7_0)

	if not var_7_2 or var_7_2 < 0 then
		return
	end

	local var_7_3 = CSV.ReadRowWithFile(CSV.battlePassSeason, var_7_1, var_7_2)

	if var_7_3 then
		return var_7_3
	end
end

function BATTLEPASS.GetAllTiersData(arg_8_0, arg_8_1)
	if arg_8_1 and arg_8_0 and arg_8_1 <= arg_8_0 then
		return {}
	end

	local var_8_0 = {}

	arg_8_0 = arg_8_0 or 0
	arg_8_1 = arg_8_1 or StringTable.BFHCAIIDA(CSV.battlePassSeason.GetFile()) - 1

	for iter_8_0 = arg_8_0, arg_8_1 do
		local var_8_1 = CSV.ReadRowWithFile(CSV.battlePassSeason, CSV.battlePassSeason.GetFile(), iter_8_0)
		local var_8_2 = split(var_8_1.lootID, "|")
		local var_8_3 = split(var_8_1.billboardImage, "|")
		local var_8_4 = split(var_8_1.challengeID, "|")
		local var_8_5 = tonumber(var_8_1.level)
		local var_8_6 = tonumber(var_8_1.numVisibleLoot)

		local function var_8_7(arg_9_0, arg_9_1)
			local var_9_0 = {
				lootID = var_8_2[arg_9_1],
				billboardImage = var_8_3[arg_9_1] or "",
				challengeID = var_8_4[arg_9_1] or "",
				subTierID = arg_9_1
			}

			table.insert(arg_9_0, var_9_0)
		end

		if var_8_5 == 0 then
			for iter_8_1 = 1, var_8_6 do
				local var_8_8 = LUI.ShallowCopy(var_8_1)

				var_8_8.showProgress = false
				var_8_8.lootTable = {}
				var_8_8.subTierID = iter_8_1

				var_8_7(var_8_8.lootTable, iter_8_1)
				table.insert(var_8_0, var_8_8)
			end
		else
			local var_8_9 = LUI.ShallowCopy(var_8_1)

			var_8_9.showProgress = true
			var_8_9.lootTable = {}
			var_8_9.subTierID = 1

			for iter_8_2 = 1, var_8_6 do
				var_8_7(var_8_9.lootTable, iter_8_2)
			end

			table.insert(var_8_0, var_8_9)
		end
	end

	return var_8_0
end

function BATTLEPASS.GetAllRewards()
	local var_10_0 = {}
	local var_10_1 = BATTLEPASS.GetAllTiersData()

	for iter_10_0 = 1, #var_10_1 do
		for iter_10_1, iter_10_2 in ipairs(var_10_1[iter_10_0].lootTable) do
			local var_10_2 = tonumber(iter_10_2.lootID)
			local var_10_3 = StringTable.DIFCHIGDFB(LOOT.GetLootFileForID(var_10_2), 0, var_10_2, 1)

			if var_10_3 and #var_10_3 > 0 then
				local var_10_4 = {
					ref = var_10_3,
					type = LOOT.GetTypeForID(var_10_2)
				}

				var_10_4.name = LOOT.GetItemName(var_10_4.type, var_10_3)
				var_10_4.image = LOOT.GetItemImage(var_10_4.type, var_10_3, var_10_2)
				var_10_4.rarity = LOOT.GetItemQuality(var_10_4.type, var_10_3, var_10_2)
				var_10_4.rarityColor = LOOT.GetRarityColor(var_10_4.rarity)
				var_10_4.rarityImage = LOOT.GetRarityImage(var_10_4.rarity)

				if var_10_4.type == LOOT.itemTypes.FEATURE then
					var_10_4.isOperatorChallenge = LOOT.IsFeatureOperatorChallenge(var_10_4.ref)
				end

				table.insert(var_10_0, var_10_4)
			end
		end
	end

	return var_10_0
end

function BATTLEPASS.GetXP(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1 or SEASON.GetCurrentSeason()

	return Battlepass.BAGCGCIHAF(arg_11_0, var_11_0)
end

function BATTLEPASS.GetTierMinXP(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1 or SEASON.GetCurrentSeason()
	local var_12_1 = CSV.battlePassSeason.GetFile(var_12_0)

	return BATTLEPASS.GetTierMinXPByFile(arg_12_0, var_12_1)
end

function BATTLEPASS.GetTierMaxXP(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1 or SEASON.GetCurrentSeason()
	local var_13_1 = CSV.battlePassSeason.GetFile(var_13_0)

	return BATTLEPASS.GetTierMaxXPByFile(arg_13_0, var_13_1)
end

function BATTLEPASS.GetMaxTier(arg_14_0)
	local var_14_0 = arg_14_0 or SEASON.GetCurrentSeason()
	local var_14_1 = CSV.battlePassSeason.GetFile(var_14_0)

	return BATTLEPASS.GetMaxTierByFile(var_14_1)
end

function BATTLEPASS.GetTierByXP(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_2 or SEASON.GetCurrentSeason()
	local var_15_1 = CSV.battlePassSeason.GetFile(var_15_0)

	return BATTLEPASS.GetTierByXPAndFile(arg_15_0, arg_15_1, var_15_1)
end

function BATTLEPASS.GetTierMinXPByFile(arg_16_0, arg_16_1)
	return tonumber(StringTable.DIFCHIGDFB(arg_16_1, CSV.battlePassSeason.cols.level, arg_16_0, CSV.battlePassSeason.cols.xp))
end

function BATTLEPASS.GetTierMaxXPByFile(arg_17_0, arg_17_1)
	return tonumber(StringTable.DIFCHIGDFB(arg_17_1, CSV.battlePassSeason.cols.level, arg_17_0, CSV.battlePassSeason.cols.xp)) + tonumber(StringTable.DIFCHIGDFB(arg_17_1, CSV.battlePassSeason.cols.level, arg_17_0, CSV.battlePassSeason.cols.xpToNext))
end

function BATTLEPASS.GetMaxTierByFile(arg_18_0)
	local var_18_0 = StringTable.BFHCAIIDA(arg_18_0) - 1

	return tonumber(StringTable.CBGJCDIHCE(arg_18_0, var_18_0, CSV.battlePassSeason.cols.level))
end

function BATTLEPASS.GetTierByXPAndFile(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = 0
	local var_19_1 = BATTLEPASS.GetMaxTierByFile(arg_19_2)
	local var_19_2
	local var_19_3
	local var_19_4

	if arg_19_1 == nil or arg_19_1 < 0 then
		return 0
	else
		local var_19_5 = BATTLEPASS.GetTierMinXPByFile(var_19_1, arg_19_2)

		if arg_19_1 >= BATTLEPASS.GetTierMaxXPByFile(var_19_1, arg_19_2) then
			return var_19_1
		end
	end

	while var_19_1 > var_19_0 + 1 do
		local var_19_6 = var_19_0 + math.floor((var_19_1 - var_19_0) / 2)
		local var_19_7 = BATTLEPASS.GetTierMinXPByFile(var_19_6, arg_19_2)
		local var_19_8 = BATTLEPASS.GetTierMaxXPByFile(var_19_6, arg_19_2)

		if var_19_7 <= arg_19_1 and arg_19_1 < var_19_8 then
			return var_19_6
		elseif var_19_8 <= arg_19_1 then
			var_19_0 = var_19_6
		elseif arg_19_1 < var_19_7 then
			var_19_1 = var_19_6
		end
	end

	local var_19_9 = BATTLEPASS.GetTierMinXPByFile(var_19_1, arg_19_2)
	local var_19_10 = BATTLEPASS.GetTierMaxXPByFile(var_19_1, arg_19_2)

	if var_19_9 <= arg_19_1 and arg_19_1 < var_19_10 then
		return var_19_1
	end

	local var_19_11 = BATTLEPASS.GetTierMinXPByFile(var_19_0, arg_19_2)
	local var_19_12 = BATTLEPASS.GetTierMaxXPByFile(var_19_0, arg_19_2)

	if var_19_11 <= arg_19_1 and arg_19_1 < var_19_12 then
		return var_19_0
	end
end

function BATTLEPASS.GetTier(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1 or SEASON.GetCurrentSeason()
	local var_20_1 = BATTLEPASS.GetXP(arg_20_0, var_20_0)

	return BATTLEPASS.GetTierByXP(arg_20_0, var_20_1, var_20_0)
end

function BATTLEPASS.GetTierLootID(arg_21_0, arg_21_1)
	local var_21_0 = CSV.battlePassSeason.GetFile()

	return split(StringTable.DIFCHIGDFB(var_21_0, CSV.battlePassSeason.cols.level, arg_21_1, CSV.battlePassSeason.cols.lootID), "|")[1] or ""
end

function BATTLEPASS.GetTierFromID(arg_22_0, arg_22_1)
	local var_22_0 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_22_1, CSV.battlePassIDs.cols.season)
	local var_22_1 = BATTLEPASS.GetXP(arg_22_0, var_22_0)
	local var_22_2 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_22_1, CSV.battlePassIDs.cols.seasonFile)
	local var_22_3 = CSV.battlePassSeason.GetFullFilePath(var_22_2)

	return BATTLEPASS.GetTierByXPAndFile(arg_22_0, var_22_1, var_22_3)
end

function BATTLEPASS.IsTierUnlock(arg_23_0)
	arg_23_0 = tonumber(arg_23_0)

	local var_23_0 = CSV.battlePassSeason.GetFile()

	for iter_23_0 = 0, BATTLEPASS.GetMaxTier() do
		local var_23_1 = split(StringTable.DIFCHIGDFB(var_23_0, CSV.battlePassSeason.cols.level, iter_23_0, CSV.battlePassSeason.cols.lootID), "|")
		local var_23_2 = var_23_1 and #var_23_1 or 0

		for iter_23_1 = 1, var_23_2 do
			local var_23_3 = tonumber(var_23_1[iter_23_1])

			if var_23_3 and var_23_3 >= 0 and arg_23_0 == var_23_3 then
				return true
			end
		end
	end

	return false
end

function BATTLEPASS.GetTierMultiLootIDs(arg_24_0, arg_24_1)
	local var_24_0 = CSV.battlePassSeason.GetFile()
	local var_24_1 = split(StringTable.DIFCHIGDFB(var_24_0, CSV.battlePassSeason.cols.level, arg_24_1, CSV.battlePassSeason.cols.lootID), "|")
	local var_24_2 = tonumber(StringTable.DIFCHIGDFB(var_24_0, CSV.battlePassSeason.cols.level, arg_24_1, CSV.battlePassSeason.cols.numVisibleLoot))
	local var_24_3 = {}

	for iter_24_0 = 1, var_24_2 do
		local var_24_4 = tonumber(var_24_1[iter_24_0])

		if var_24_4 and var_24_4 >= 0 then
			table.insert(var_24_3, var_24_4)
		else
			assert(false, "Invalid lootID")
		end
	end

	return var_24_3
end

function BATTLEPASS.GetTierLootIsFree(arg_25_0, arg_25_1)
	local var_25_0 = CSV.battlePassSeason.GetFile()

	return StringTable.DIFCHIGDFB(var_25_0, CSV.battlePassSeason.cols.level, arg_25_1, CSV.battlePassSeason.cols.isFree) == "1"
end

function BATTLEPASS.GetTierLootIsShowcased(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = CSV.battlePassSeason.GetFile()
	local var_26_1

	var_26_1 = arg_26_2 ~= nil and arg_26_2 or 1

	local var_26_2 = split(StringTable.DIFCHIGDFB(var_26_0, CSV.battlePassSeason.cols.level, arg_26_1, CSV.battlePassSeason.cols.isShowcased), "|")

	return var_26_2[arg_26_2] and var_26_2[arg_26_2] == "1" or false
end

function BATTLEPASS.GetShowcaseTiers(arg_27_0, arg_27_1)
	local var_27_0 = CSV.battlePassSeason.GetFile()
	local var_27_1 = {}

	for iter_27_0 = StringTable.BFHCAIIDA(var_27_0) - 1, 0, -1 do
		if BATTLEPASS.GetTierLootIsShowcased(arg_27_0, iter_27_0) then
			table.insert(var_27_1, iter_27_0)
		end
	end

	return var_27_1
end

function BATTLEPASS.GetTierLootIsPromoted(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = CSV.battlePassSeason.GetFile()
	local var_28_1

	var_28_1 = arg_28_2 ~= nil and arg_28_2 or 1

	local var_28_2 = split(StringTable.DIFCHIGDFB(var_28_0, CSV.battlePassSeason.cols.level, arg_28_1, CSV.battlePassSeason.cols.isPromoted), "|")

	return var_28_2[arg_28_2] and var_28_2[arg_28_2] == "1" or false
end

function BATTLEPASS.GetTierLootChallengeID(arg_29_0, arg_29_1)
	local var_29_0 = CSV.battlePassSeason.GetFile()

	return split(StringTable.DIFCHIGDFB(var_29_0, CSV.battlePassSeason.cols.level, arg_29_1, CSV.battlePassSeason.cols.challengeID), "|")[1] or ""
end

function BATTLEPASS.GetTierCODPoints(arg_30_0, arg_30_1)
	local var_30_0 = CSV.battlePassSeason.GetFile()

	return StringTable.DIFCHIGDFB(var_30_0, CSV.battlePassSeason.cols.level, arg_30_1, CSV.battlePassSeason.cols.codPoints)
end

function BATTLEPASS.GetTierPercentageFromXP(arg_31_0, arg_31_1)
	local var_31_0 = CSV.battlePassSeason.GetFile()
	local var_31_1 = BATTLEPASS.GetTierByXP(arg_31_0, arg_31_1)
	local var_31_2 = tonumber(StringTable.DIFCHIGDFB(var_31_0, CSV.battlePassSeason.cols.level, var_31_1, CSV.battlePassSeason.cols.xp))
	local var_31_3 = var_31_2 + tonumber(StringTable.DIFCHIGDFB(var_31_0, CSV.battlePassSeason.cols.level, var_31_1, CSV.battlePassSeason.cols.xpToNext))
	local var_31_4 = (arg_31_1 - var_31_2) / (var_31_3 - var_31_2)

	return LUI.clamp(var_31_4, 0, 1)
end

function BATTLEPASS.Purchase(arg_32_0, arg_32_1)
	assert(arg_32_1)
	Battlepass.GAICDBJEC(arg_32_0, arg_32_1)
end

function BATTLEPASS.Activate(arg_33_0, arg_33_1, arg_33_2)
	assert(arg_33_1)
	assert(arg_33_2)
	Battlepass.CBHBFIJDHG(arg_33_0, arg_33_1, arg_33_2)
end

function BATTLEPASS.SendEvent(arg_34_0, arg_34_1)
	Battlepass.BHAGDBCJDJ(arg_34_0, arg_34_1)
end

function BATTLEPASS.IsOwned(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_1 or SEASON.GetCurrentSeason()

	return Battlepass.DEBEIFJEEG(arg_35_0, var_35_0)
end

function BATTLEPASS.NeedFixUp(arg_36_0)
	assert(arg_36_0)

	return Battlepass.DFIJFJGED(arg_36_0)
end

function BATTLEPASS.FixUp(arg_37_0)
	assert(arg_37_0)
	Battlepass.BEBDCFAHB(arg_37_0)
end

function BATTLEPASS.HasSeenItem(arg_38_0, arg_38_1)
	return Loot.HDJCADADF(arg_38_0, arg_38_1)
end

function BATTLEPASS.MarkItemSeen(arg_39_0, arg_39_1)
	return Loot.DAGICBIGDH(arg_39_0, arg_39_1)
end

function BATTLEPASS.MarkPassSeenForSeason(arg_40_0, arg_40_1)
	local var_40_0 = StringTable.BFHCAIIDA(CSV.battlePassIDs.file)

	for iter_40_0 = 0, var_40_0 - 1 do
		local var_40_1 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_40_0, CSV.battlePassIDs.cols.id))
		local var_40_2 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_40_0, CSV.battlePassIDs.cols.season)) or 0

		if var_40_2 and var_40_2 == arg_40_1 then
			BATTLEPASS.MarkItemSeen(arg_40_0, var_40_1)
		end
	end
end

function BATTLEPASS.HasNewPassForSeason(arg_41_0)
	local var_41_0 = SEASON.GetCurrentSeason()
	local var_41_1 = StringTable.BFHCAIIDA(CSV.battlePassIDs.file)

	for iter_41_0 = 0, var_41_1 - 1 do
		local var_41_2 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_41_0, CSV.battlePassIDs.cols.id))
		local var_41_3 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_41_0, CSV.battlePassIDs.cols.season)) or 0
		local var_41_4 = tonumber(StringTable.CBGJCDIHCE(CSV.battlePassIDs.file, iter_41_0, CSV.battlePassIDs.cols.type)) or -1
		local var_41_5 = var_41_3 > 0 and var_41_3 == var_41_0
		local var_41_6 = var_41_4 == BATTLEPASS.ItemTypes.PREMIUM
		local var_41_7 = BATTLEPASS.HasSeenItem(arg_41_0, var_41_2)

		if var_41_5 and var_41_6 and not var_41_7 then
			return true
		end
	end
end

function BATTLEPASS.HasNewItems(arg_42_0)
	if BATTLEPASS.HasNewPassForSeason(arg_42_0) then
		return true
	end

	local var_42_0 = BATTLEPASS.GetLastMenuXP(arg_42_0)
	local var_42_1 = BATTLEPASS.GetXP(arg_42_0)
	local var_42_2 = BATTLEPASS.GetTierByXP(arg_42_0, var_42_0)
	local var_42_3 = BATTLEPASS.GetTierByXP(arg_42_0, var_42_1)
	local var_42_4 = var_42_3 == BATTLEPASS.GetMaxTier()
	local var_42_5, var_42_6 = BATTLEPASS.IsPendingTransactions(arg_42_0)

	if (var_42_5 or var_42_6) and not var_42_4 then
		return true
	end

	if var_42_2 < var_42_3 then
		return true
	end
end

function BATTLEPASS.GetLastMenuXP(arg_43_0)
	local var_43_0 = BATTLEPASS.GetXP(arg_43_0)
	local var_43_1 = PlayerData.BFFBGAJGD(arg_43_0, CoD.StatsGroup.NonGame)
	local var_43_2 = tonumber(var_43_1.lastBattlePassMenuXp:get())

	if var_43_0 < var_43_2 then
		BATTLEPASS.SetLastMenuXP(arg_43_0, var_43_0)

		return var_43_0
	end

	return var_43_2
end

function BATTLEPASS.SetLastMenuXP(arg_44_0, arg_44_1)
	PlayerData.BFFBGAJGD(arg_44_0, CoD.StatsGroup.NonGame).lastBattlePassMenuXp:set(arg_44_1)
	Engine.DAGFFDGFII("uploadstats", arg_44_0)
end

function BATTLEPASS.GetLastFreeTierSeen(arg_45_0)
	local var_45_0 = PlayerData.BFFBGAJGD(arg_45_0, CoD.StatsGroup.NonGame)
	local var_45_1 = tonumber(var_45_0.lastBattlePassFreeTierSeen:get())
	local var_45_2 = var_45_1 > 0 and var_45_1 - 1 or 0

	if BATTLEPASS.GetXP(arg_45_0) < BATTLEPASS.GetTierMinXP(var_45_2) then
		BATTLEPASS.SetLastFreeTierSeen(arg_45_0, 0)

		return 0
	end

	return var_45_1
end

function BATTLEPASS.SetLastFreeTierSeen(arg_46_0, arg_46_1)
	PlayerData.BFFBGAJGD(arg_46_0, CoD.StatsGroup.NonGame).lastBattlePassFreeTierSeen:set(arg_46_1)
	Engine.DAGFFDGFII("uploadstats", arg_46_0)
end

function BATTLEPASS.GetNextTier(arg_47_0)
	local var_47_0 = BATTLEPASS.GetTier(arg_47_0)

	return var_47_0 >= BATTLEPASS.GetMaxTier() and BATTLEPASS.GetMaxTier() or var_47_0 + 1
end

function BATTLEPASS.GetLastFreeTierReached(arg_48_0)
	local var_48_0 = BATTLEPASS.GetXP(arg_48_0)
	local var_48_1 = BATTLEPASS.GetTierByXP(arg_48_0, var_48_0)
	local var_48_2 = var_48_1 >= BATTLEPASS.GetMaxTier() and BATTLEPASS.GetMaxTier() or var_48_1 + 1
	local var_48_3 = CSV.battlePassSeason.GetFile()

	for iter_48_0 = BATTLEPASS.GetMaxTier(), 1, -1 do
		if BATTLEPASS.GetTierLootIsFree(arg_48_0, iter_48_0) and iter_48_0 <= var_48_2 then
			local var_48_4 = BATTLEPASS.GetTierMinXP(iter_48_0 - 1)
			local var_48_5 = BATTLEPASS.GetTierMaxXP(iter_48_0 - 1)

			if (var_48_0 - var_48_4) / (var_48_5 - var_48_4) > BATTLEPASS.TierUpsellPopupXPThreshold then
				return iter_48_0
			end
		end
	end

	return var_48_2
end

function BATTLEPASS.GetNextFreeTier(arg_49_0)
	local var_49_0 = BATTLEPASS.GetNextTier(arg_49_0)
	local var_49_1 = CSV.battlePassSeason.GetFile()
	local var_49_2 = BATTLEPASS.GetMaxTier()

	for iter_49_0 = var_49_0, var_49_2 do
		if BATTLEPASS.GetTierLootIsFree(arg_49_0, iter_49_0) then
			return iter_49_0
		end
	end

	return 1
end

function BATTLEPASS.ShouldShowFreeTierUpsell(arg_50_0)
	if not Dvar.IBEGCHEFE("MPMTRSQLLO") then
		return false
	end

	if BATTLEPASS.IsOwned(arg_50_0) then
		return false
	end

	local var_50_0 = BATTLEPASS.GetNextTier(arg_50_0)
	local var_50_1 = BATTLEPASS.GetLastFreeTierSeen(arg_50_0)

	if var_50_0 < BATTLEPASS.TierUpsellMinTier or var_50_0 <= var_50_1 then
		return false
	end

	local var_50_2 = BATTLEPASS.GetXP(arg_50_0)
	local var_50_3 = BATTLEPASS.GetTierByXP(arg_50_0, var_50_2)
	local var_50_4 = BATTLEPASS.GetTierMinXP(var_50_3)
	local var_50_5 = BATTLEPASS.GetTierMaxXP(var_50_3)

	if (var_50_2 - var_50_4) / (var_50_5 - var_50_4) < BATTLEPASS.TierUpsellPopupXPThreshold then
		return false
	end

	return (BATTLEPASS.GetTierLootIsFree(arg_50_0, var_50_0))
end

function BATTLEPASS.GetItemRef(arg_51_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_51_0, CSV.battlePassIDs.cols.ref)
end

function BATTLEPASS.GetItemID(arg_52_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_52_0, CSV.battlePassIDs.cols.id)
end

function BATTLEPASS.GetItemType(arg_53_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_53_0, CSV.battlePassIDs.cols.type)
end

function BATTLEPASS.GetItemSeason(arg_54_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_54_0, CSV.battlePassIDs.cols.season)
end

function BATTLEPASS.GetItemName(arg_55_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_55_0, CSV.battlePassIDs.cols.name)
end

function BATTLEPASS.GetItemImage(arg_56_0)
	local var_56_0 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_56_0, CSV.battlePassIDs.cols.season))

	return BATTLEPASS.GetBaseEmblem(var_56_0)
end

function BATTLEPASS.GetItemLargeImage(arg_57_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_57_0, CSV.battlePassIDs.cols.imageLarge)
end

function BATTLEPASS.GetItemCost(arg_58_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_58_0, CSV.battlePassIDs.cols.currencyAmount)
end

function BATTLEPASS.GetItemCostByID(arg_59_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_59_0, CSV.battlePassIDs.cols.currencyAmount)
end

function BATTLEPASS.GetNumItems(arg_60_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_60_0, CSV.battlePassIDs.cols.numItems)
end

function BATTLEPASS.GetItemSkips(arg_61_0)
	return StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_61_0, CSV.battlePassIDs.cols.skips)
end

function BATTLEPASS.GetBundleItemIDs(arg_62_0)
	local var_62_0 = {}
	local var_62_1 = BATTLEPASS.GetNumItems(arg_62_0)

	for iter_62_0 = 1, var_62_1 do
		local var_62_2 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_62_0, CSV.battlePassIDs.cols["item" .. iter_62_0])

		if #var_62_2 > 0 then
			table.insert(var_62_0, var_62_2)
		end
	end

	return var_62_0
end

function BATTLEPASS.GetItemValue(arg_63_0)
	local var_63_0 = 0
	local var_63_1 = BATTLEPASS.GetBundleItemIDs(arg_63_0)

	for iter_63_0 = 1, #var_63_1 do
		local var_63_2 = var_63_1[iter_63_0]

		if LOOT.GetTypeForID(var_63_2) == LOOT.itemTypes.BATTLE_PASS then
			var_63_0 = var_63_0 + BATTLEPASS.GetItemCostByID(var_63_2)
		end
	end

	return var_63_0
end

function BATTLEPASS.GetNumSkipsInBundle(arg_64_0)
	local var_64_0 = 0
	local var_64_1 = StringTable.BJJBBCJGEJ(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_64_0)

	if not var_64_1 or var_64_1 < 0 then
		return var_64_0
	end

	local var_64_2 = CSV.ReadRow({
		file = CSV.battlePassIDs.file,
		cols = CSV.battlePassIDs.cols
	}, var_64_1)

	if var_64_2 then
		for iter_64_0 = 1, var_64_2.numItems do
			local var_64_3 = var_64_2["item" .. iter_64_0]
			local var_64_4 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, var_64_3, CSV.battlePassIDs.cols.skips))

			if var_64_4 then
				var_64_0 = var_64_0 + var_64_4
			end
		end
	end

	return var_64_0
end

function BATTLEPASS.GetCodPointsInPass()
	local var_65_0 = 0
	local var_65_1 = CSV.battlePassSeason.GetFile()
	local var_65_2 = StringTable.BFHCAIIDA(var_65_1)

	for iter_65_0 = 0, var_65_2 - 1 do
		local var_65_3 = StringTable.DIFCHIGDFB(var_65_1, CSV.battlePassSeason.cols.level, iter_65_0, CSV.battlePassSeason.cols.codPoints)

		if #var_65_3 > 0 then
			var_65_0 = var_65_0 + tonumber(var_65_3)
		end
	end

	return var_65_0
end

function BATTLEPASS.GetActivationRefs(arg_66_0)
	local var_66_0 = {}
	local var_66_1 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_66_0, CSV.battlePassIDs.cols.numItems))

	if var_66_1 then
		for iter_66_0 = 1, var_66_1 do
			local var_66_2 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.ref, arg_66_0, CSV.battlePassIDs.cols["item" .. iter_66_0])

			if var_66_2 and #var_66_2 > 0 and LOOT.GetTypeForID(var_66_2) == LOOT.itemTypes.BATTLE_PASS then
				local var_66_3 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, var_66_2, CSV.battlePassIDs.cols.ref)
				local var_66_4 = tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, var_66_2, CSV.battlePassIDs.cols.type))
				local var_66_5 = var_66_4 == BATTLEPASS.ItemTypes.PREMIUM or var_66_4 == BATTLEPASS.ItemTypes.TIER_SKIP

				if var_66_3 and #var_66_3 > 0 and var_66_5 then
					table.insert(var_66_0, var_66_3)
				end
			end
		end
	end

	return var_66_0
end

function BATTLEPASS.GetPreviewWeapon(arg_67_0, arg_67_1, arg_67_2)
	assert(arg_67_0)
	assert(arg_67_1)
	assert(arg_67_2)

	local var_67_0 = {}

	if arg_67_1 == LOOT.itemTypes.WEAPON then
		local var_67_1 = WEAPON.GenerateWeaponTableFromID(arg_67_0, arg_67_2)

		if var_67_1 then
			table.insert(var_67_0, var_67_1)
		else
			assert(false, "Unable to build weapon table for ID " .. arg_67_2)

			return
		end
	end

	local var_67_2 = LOADOUT.GetFavoriteLoadoutIndex(arg_67_0) or 0
	local var_67_3 = LOADOUT.GetLoadoutPlayerData(arg_67_0, var_67_2)

	if var_67_3 then
		local var_67_4 = WEAPON.GenerateWeaponTable(var_67_3.weaponSetups[0])

		if var_67_4 then
			table.insert(var_67_0, var_67_4)
		end
	end

	for iter_67_0 = 1, LOADOUT.DefaultClassCount do
		if iter_67_0 ~= var_67_2 then
			local var_67_5 = LOADOUT.GetLoadoutPlayerData(arg_67_0, iter_67_0)

			if var_67_5 then
				local var_67_6 = WEAPON.GenerateWeaponTable(var_67_5.weaponSetups[0])

				if var_67_6 then
					table.insert(var_67_0, var_67_6)
				end
			end
		end
	end

	local var_67_7 = WEAPON.DefaultPrimaryID
	local var_67_8 = WEAPON.GenerateWeaponTableFromID(arg_67_0, var_67_7)

	if var_67_8 then
		table.insert(var_67_0, var_67_8)
	end

	local function var_67_9(arg_68_0, arg_68_1, arg_68_2)
		if arg_68_0 == LOOT.itemTypes.WEAPON then
			return true
		elseif arg_68_0 == LOOT.itemTypes.OPERATOR or arg_68_0 == LOOT.itemTypes.OPERATOR_SKIN then
			return true
		elseif arg_68_0 == LOOT.itemTypes.CHARM then
			return arg_68_1
		elseif arg_68_0 == LOOT.itemTypes.STICKER then
			return arg_68_2
		end
	end

	for iter_67_1, iter_67_2 in ipairs(var_67_0) do
		local var_67_10 = false
		local var_67_11 = false

		if arg_67_1 == LOOT.itemTypes.CHARM and WEAPON.SupportsCosmetics(iter_67_2.weapon) then
			iter_67_2.cosmeticAttachment = LOOT.GetItemRef(LOOT.itemTypes.CHARM, arg_67_2)
			var_67_10 = true
		end

		local var_67_12 = WEAPON.GetMaxStickerSlotsForWeapon(iter_67_2.weapon)

		if arg_67_1 == LOOT.itemTypes.STICKER and var_67_12 > 0 then
			iter_67_2.stickers = {}

			for iter_67_3 = 1, var_67_12 do
				table.insert(iter_67_2.stickers, LOOT.GetItemRef(LOOT.itemTypes.STICKER, arg_67_2))
			end

			var_67_11 = true
		end

		if var_67_9(arg_67_1, var_67_10, var_67_11) then
			return iter_67_2
		end
	end
end

function BATTLEPASS.GetTierUnlockLootReward(arg_69_0, arg_69_1)
	local var_69_0 = BATTLEPASS.GetTierLootID(arg_69_0, arg_69_1)
	local var_69_1 = LOOT.GetLootCardData(arg_69_0, var_69_0)

	if LOOT.GetTypeForID(var_69_0) == LOOT.itemTypes.FEATURE then
		local var_69_2 = BATTLEPASS.GetTierCODPoints(arg_69_0, arg_69_1)

		var_69_1.name = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS", var_69_2)
	end

	var_69_1.isFreeLoot = BATTLEPASS.GetTierLootIsFree(arg_69_0, arg_69_1)

	return var_69_1
end

function BATTLEPASS.GetTierMultiUnlockLootRewards(arg_70_0, arg_70_1)
	local var_70_0 = BATTLEPASS.GetTierMultiLootIDs(arg_70_0, arg_70_1)
	local var_70_1 = {}

	for iter_70_0, iter_70_1 in ipairs(var_70_0) do
		local var_70_2 = LOOT.GetLootCardData(arg_70_0, iter_70_1)

		if LOOT.GetTypeForID(iter_70_1) == LOOT.itemTypes.FEATURE and not var_70_2.isOperatorChallenge then
			local var_70_3 = BATTLEPASS.GetTierCODPoints(arg_70_0, arg_70_1)

			var_70_2.name = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS", var_70_3)
		end

		var_70_2.isFreeLoot = BATTLEPASS.GetTierLootIsFree(arg_70_0, arg_70_1)

		table.insert(var_70_1, var_70_2)
	end

	return var_70_1
end

function BATTLEPASS.GetRecentTierUnlocks(arg_71_0, arg_71_1)
	local var_71_0 = BATTLEPASS.GetTier(arg_71_0)
	local var_71_1 = arg_71_1 and var_71_0 - arg_71_1 or 0

	if var_71_1 < 0 then
		var_71_1 = 0
	end

	local var_71_2 = {}

	while var_71_1 < var_71_0 do
		local var_71_3 = BATTLEPASS.GetTierMultiUnlockLootRewards(arg_71_0, var_71_0)

		var_71_3.tier = var_71_0

		for iter_71_0, iter_71_1 in ipairs(var_71_3) do
			table.insert(var_71_2, iter_71_1)
		end

		var_71_0 = var_71_0 - 1
	end

	return var_71_2
end

function BATTLEPASS.GetNextTierUnlocks(arg_72_0)
	local var_72_0 = BATTLEPASS.GetTier(arg_72_0)
	local var_72_1 = var_72_0 >= BATTLEPASS.GetMaxTier() and BATTLEPASS.GetMaxTier() or var_72_0 + 1

	return BATTLEPASS.GetTierMultiUnlockLootRewards(arg_72_0, var_72_1)
end

function BATTLEPASS.GetTierUnlocksByTier(arg_73_0, arg_73_1, arg_73_2)
	if arg_73_2 <= arg_73_1 then
		return {}
	end

	local var_73_0 = {}
	local var_73_1 = arg_73_1 + 1

	while var_73_1 <= arg_73_2 do
		local var_73_2 = BATTLEPASS.GetTierMultiUnlockLootRewards(arg_73_0, var_73_1)

		for iter_73_0, iter_73_1 in ipairs(var_73_2) do
			table.insert(var_73_0, iter_73_1)
		end

		var_73_1 = var_73_1 + 1
	end

	return var_73_0
end

function BATTLEPASS.GetMissionLevel(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_1 or SEASON.GetCurrentSeason()
	local var_74_1 = StringTable.BFHCAIIDA(CSV.battlePassSeason.GetFile(var_74_0))

	for iter_74_0 = 0, var_74_1 - 1 do
		local var_74_2 = CSV.ReadRowWithFile(CSV.battlePassSeason, CSV.battlePassSeason.GetFile(var_74_0), iter_74_0)
		local var_74_3 = split(var_74_2.challengeID, "|")
		local var_74_4 = tonumber(var_74_2.level)

		for iter_74_1, iter_74_2 in ipairs(var_74_3) do
			if arg_74_0 == iter_74_2 then
				return var_74_4
			end
		end
	end

	return 0
end

function BATTLEPASS.GetTierItemName(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0

	if arg_75_2 then
		local var_75_1 = BATTLEPASS.GetTierMultiLootIDs(arg_75_0, arg_75_1)

		if arg_75_2 <= #var_75_1 then
			var_75_0 = var_75_1[arg_75_2]
		else
			var_75_0 = var_75_1[1]
		end
	else
		var_75_0 = BATTLEPASS.GetTierLootID(arg_75_0, arg_75_1)
	end

	local var_75_2 = LOOT.GetTypeForID(var_75_0)
	local var_75_3 = LOOT.GetItemRef(var_75_2, var_75_0)
	local var_75_4

	if var_75_2 == LOOT.itemTypes.WEAPON then
		var_75_4 = WEAPON.GetLootWeaponName(var_75_3, var_75_0)
	elseif var_75_2 == LOOT.itemTypes.FEATURE then
		local var_75_5 = BATTLEPASS.GetTierCODPoints(arg_75_0, arg_75_1)

		var_75_4 = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS", var_75_5)
	else
		var_75_4 = LOOT.GetItemName(var_75_2, var_75_3)
	end

	return var_75_4
end

function BATTLEPASS.GetBaseEmblem(arg_76_0)
	local var_76_0 = arg_76_0 and arg_76_0 or SEASON.GetCurrentSeason()

	return StringTable.DIFCHIGDFB(CSV.battlePassSeasonIcon.file, CSV.battlePassSeasonIcon.cols.season, var_76_0, CSV.battlePassSeasonIcon.cols.emblem)
end

function BATTLEPASS.GetCurrentEmblem(arg_77_0, arg_77_1)
	if BATTLEPASS.IsOwned(arg_77_0) then
		return BATTLEPASS.GetEmblemGold(arg_77_1)
	else
		return BATTLEPASS.GetEmblemSilver(arg_77_1)
	end
end

function BATTLEPASS.GetEmblemGold(arg_78_0)
	local var_78_0 = tostring(arg_78_0 and arg_78_0 or SEASON.GetCurrentSeason())

	return StringTable.DIFCHIGDFB(CSV.battlePassSeasonIcon.file, CSV.battlePassSeasonIcon.cols.season, var_78_0, CSV.battlePassSeasonIcon.cols.emblemGold)
end

function BATTLEPASS.GetEmblemSilver(arg_79_0)
	local var_79_0 = tostring(arg_79_0 and arg_79_0 or SEASON.GetCurrentSeason())

	return StringTable.DIFCHIGDFB(CSV.battlePassSeasonIcon.file, CSV.battlePassSeasonIcon.cols.season, var_79_0, CSV.battlePassSeasonIcon.cols.emblemSilver)
end

function BATTLEPASS.GetLootTierMap()
	local var_80_0 = {}
	local var_80_1 = StringTable.BFHCAIIDA(CSV.battlePassSeason.GetFile())

	for iter_80_0 = 0, var_80_1 - 1 do
		local var_80_2 = CSV.ReadRowWithFile(CSV.battlePassSeason, CSV.battlePassSeason.GetFile(), iter_80_0)
		local var_80_3 = split(var_80_2.lootID, "|")

		for iter_80_1 = 1, #var_80_3 do
			var_80_0[tonumber(var_80_3[iter_80_1])] = var_80_2.level
		end
	end

	return var_80_0
end

function BATTLEPASS.BRRewardAvailable(arg_81_0)
	local var_81_0 = Dvar.IBEGCHEFE("NRONMTPKML")
	local var_81_1 = CONDITIONS.IsMagmaGameMode()
	local var_81_2 = PlayerData.BFFBGAJGD(arg_81_0, CoD.StatsGroup.Ranked).playerStats.modeStats.br.gamesPlayed:get()
	local var_81_3 = var_81_2 and var_81_2 > 0
	local var_81_4 = BATTLEPASS.GetTier(arg_81_0) >= BATTLEPASS.GetMaxTier()
	local var_81_5 = OnlineProgression.DFBEBDGCHJ(arg_81_0, BRLOOT.rewardsTypes.FIRST_MATCH_REWARD)

	return var_81_0 and var_81_1 and var_81_3 and not var_81_4 and not var_81_5
end

function BATTLEPASS.VIPGiftAvailable(arg_82_0)
	local var_82_0 = Dvar.CFHDGABACF("LTOQKNQLNP")
	local var_82_1 = Dvar.CFHDGABACF("LNTOLMQMOQ")

	if not var_82_0 or var_82_0 <= 0 or not var_82_1 or var_82_1 <= 0 then
		return false
	else
		return Loot.DEBEIFJEEG(arg_82_0, var_82_0) == 0 and Loot.DEBEIFJEEG(arg_82_0, var_82_1) == 0
	end
end

function BATTLEPASS.GetVIPGifts(arg_83_0, arg_83_1, arg_83_2)
	if not arg_83_1 or arg_83_1 <= 0 then
		return
	end

	if Loot.DEBEIFJEEG(arg_83_0, arg_83_1) > 0 then
		return
	end

	local var_83_0 = LOOT.GetItemsInBundle(arg_83_1)

	if not var_83_0 or #var_83_0 <= 0 then
		return
	end

	local var_83_1 = {}

	arg_83_2 = math.min(arg_83_2, #var_83_0)

	for iter_83_0 = 1, arg_83_2 do
		table.insert(var_83_1, LOOT.GetLootCardData(arg_83_0, var_83_0[iter_83_0]))
	end

	return var_83_1
end

function BATTLEPASS.GetVIPFreeGifts(arg_84_0)
	return BATTLEPASS.GetVIPGifts(arg_84_0, Dvar.CFHDGABACF("LTOQKNQLNP"), BATTLEPASS.VIPNumFreeGifts)
end

function BATTLEPASS.GetVIPOwnerGifts(arg_85_0)
	return BATTLEPASS.GetVIPGifts(arg_85_0, Dvar.CFHDGABACF("LNTOLMQMOQ"), BATTLEPASS.VIPNumOwnerGifts)
end

function BATTLEPASS.ShowBPTrailer(arg_86_0)
	local var_86_0 = "main_menu_warzone_battlepass_trailer"

	Engine.BJDBIAGIDA(SOUND_SETS.default.action)
	LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, arg_86_0, false, {
		widescreen = true,
		video = var_86_0
	})
end

function BATTLEPASS.IsTierSkipGiftActive(arg_87_0)
	if not Dvar.IBEGCHEFE("MNLKTLKTPM") then
		return false
	end

	local var_87_0 = tonumber(BATTLEPASS.GetTierSkipGiftID())
	local var_87_1 = tonumber(BATTLEPASS.GetTierSkipGiftTimer())
	local var_87_2 = BATTLEPASS.GetTier(arg_87_0) >= BATTLEPASS.GetMaxTier()

	if var_87_0 and var_87_1 and not var_87_2 then
		local var_87_3 = Loot.DEBEIFJEEG(arg_87_0, var_87_0) > 0
		local var_87_4 = Engine.DEIDGHDBHD()

		if not var_87_3 and var_87_4 and var_87_4 < var_87_1 then
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

function BATTLEPASS.AddPurchasePrompt(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
	if not BATTLEPASS.IsOwned(arg_90_1) then
		arg_90_3 = arg_90_3 or 2

		arg_90_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("BATTLEPASS/PURCHASE_BATTLEPASS"),
			container = arg_90_2,
			priority = arg_90_3
		})
		arg_90_0.bindButton:addEventHandler("button_alt1", function(arg_91_0, arg_91_1)
			local var_91_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

			if var_91_0 then
				var_91_0.isPurchaseFromPreview = true

				ACTIONS.LeaveMenu(arg_90_0)
			end
		end)
	end
end

function BATTLEPASS.GetCurrentCPRewards(arg_92_0)
	local var_92_0 = BATTLEPASS.GetXP(arg_92_0)
	local var_92_1 = BATTLEPASS.GetTierByXP(arg_92_0, var_92_0)
	local var_92_2 = {}

	var_92_2.totalCP = 0
	var_92_2.codTiers = {}

	local var_92_3 = CSV.battlePassSeason
	local var_92_4 = BATTLEPASS.GetAllRewards()

	for iter_92_0 = 0, var_92_1 do
		local var_92_5 = StringTable.CBGJCDIHCE(var_92_3.GetFile(), iter_92_0, var_92_3.cols.codPoints)

		if tonumber(var_92_5) > 0 then
			var_92_2.totalCP = var_92_2.totalCP + var_92_5

			table.insert(var_92_2.codTiers, iter_92_0)
		end
	end

	return var_92_2
end

function BATTLEPASS.GetTierByTotalCPRewards(arg_93_0)
	local var_93_0 = 0
	local var_93_1 = CSV.battlePassSeason
	local var_93_2 = BATTLEPASS.GetAllRewards()
	local var_93_3 = StringTable.BFHCAIIDA(CSV.battlePassSeason.GetFile())

	for iter_93_0 = 0, var_93_3 do
		local var_93_4 = StringTable.CBGJCDIHCE(var_93_1.GetFile(), iter_93_0, var_93_1.cols.codPoints)

		if tonumber(var_93_4) > 0 then
			var_93_0 = var_93_0 + var_93_4

			if arg_93_0 < var_93_0 then
				return iter_93_0
			end
		end
	end

	return var_93_3
end
