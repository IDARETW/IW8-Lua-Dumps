STORE = STORE or {}
STORE.CODPointsCategory = "codpoints"
STORE.TitlesCategory = "titles"
STORE.GameDLCCategory = "dlc"
STORE.CDLCategory = "CDL"
STORE.MiscCategory = "misc"
STORE.DATA_PACK_1_NAME = "dlc_mp3"
STORE.maxButtonsPerCategoryRow = 4
STORE.GameUpsellStandardID = "title_standard"
STORE.GameUpsellStandardIDSIEE = "title_standard_siee"
STORE.GameUpsellEnhancedID = "title_battlepass"
STORE.GameUpsellIDs = {
	[STORE.GameUpsellStandardID] = 1,
	[STORE.GameUpsellStandardIDSIEE] = 2,
	[STORE.GameUpsellEnhancedID] = 3
}
STORE.MW2RProductID = "franchise_mw2r"
STORE.CODEID = "codepack"
STORE.CODE2ID = "codepack2"
STORE.HeadStartID = "headstartpack"
STORE.BundleIDBattlePass = 400049
STORE.BundleIDBattlePassBundle = 400050
STORE.KoreanTermsOfUseURL = "https://support.activision.com/servlet/servlet.FileDownload?retURL=%2Fapex%2Flicense&file=00P4P00001Ku2BoUAJ"
STORE.KoreanRefundPolicyURL = "https://support.activision.com/articles/ko/FAQ/Call-of-Duty-Modern-Warfare-Purchases"
STORE.ItemSaleIdOffset = 20000
STORE.SmartBundleIdOffset = 60000
STORE.PS4DLCOffset = 0
STORE.XB3DLCOffset = 1000
STORE.PCDLCOffset = 2000
STORE.TomogunchiCharmCollection = 400437
STORE.LimitedTimeWarningThreshold = 86400
STORE.ProductNoLongerAvailableError = 8003
STORE.CategoryType = {
	temp_category_1 = 6,
	operator = 3,
	temp_category_2 = 7,
	featured = 2,
	just_for_you = 1,
	weapon = 4,
	temp_category_5 = 10,
	franchise_store = 5,
	temp_category_3 = 8,
	temp_category_4 = 9
}
STORE.TransactionResult = {
	TRANSACTION_FAILED = 3,
	TRANSACTION_CANCELLED = 2,
	TRANSACTION_SUCCEEDED = 1,
	TRANSACTION_UNKNOWN = 0
}
STORE.CratePopupType = {
	OPEN = 2,
	OPEN_FAIL = 3,
	PURCHASE_FAIL = 1,
	PURCHASE = 0
}
STORE.CratePopupInfo = {
	[STORE.CratePopupType.PURCHASE] = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_TITLE"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE")
	},
	[STORE.CratePopupType.PURCHASE_FAIL] = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_FAIL_TITLE"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/PERCHASE_FAIL")
	},
	[STORE.CratePopupType.OPEN] = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/OPEN_TITLE"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/OPEN")
	},
	[STORE.CratePopupType.OPEN_FAIL] = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/OPEN_FAIL_TITLE"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/OPEN_FAIL")
	}
}

function STORE.GetStoreMenu(arg_1_0)
	if arg_1_0 then
		return "MainMenuStore"
	else
		return Engine.EAIICIFIFA() and "CPStore" or "MPStore"
	end
end

STORE.CODPointBonuses = {
	codpoints9500 = 2000,
	codpoints1100 = 100,
	codpoints13000 = 3000,
	codpoints5000 = 1000,
	codpoints500 = 0,
	codpoints2400 = 400,
	codpoints200 = 0
}
STORE.CODPointBonusPercentage = {
	codpoints9500 = 26,
	codpoints1100 = 10,
	codpoints13000 = 30,
	codpoints5000 = 25,
	codpoints500 = 0,
	codpoints2400 = 20,
	codpoints200 = 0
}
STORE.FreeFirstPartyBundle = 400232
STORE.CODPointBtnImages = {
	codpoints9500 = "purchase_cod_points_button_bg_large",
	codpoints1100 = "purchase_cod_points_button_bg_large",
	codpoints13000 = "purchase_cod_points_button_bg_large",
	codpoints5000 = "purchase_cod_points_button_bg_med",
	codpoints500 = "purchase_cod_points_button_bg",
	codpoints2400 = "purchase_cod_points_button_bg_med",
	codpoints200 = "purchase_cod_points_button_bg"
}
STORE.TitleIDs = {
	PS4_STANDARD = 340031,
	BNET_STANDARD = 340019,
	BNET_BATTLE_PASS = 340023,
	XB3_STANDARD = 340034,
	XB3_BATTLE_PASS = 340036,
	PS4_BATTLE_PASS = 340033
}

function STORE.EnterStore(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	if not CONDITIONS.IsStoreAllowed() then
		return
	end

	if Engine.CIFGGDIGBE(arg_2_0) then
		local var_2_0 = {
			message = Engine.CBBHFCGDIC("PATCH_MENU/NO_GUEST")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_2_0, nil, false, true)
	elseif Engine.GHHAJBJAE(arg_2_0) then
		local var_2_1 = {
			message = Engine.CBBHFCGDIC("XBOXLIVE/MPNOTALLOWED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_2_1, nil, false, true)
	elseif not Engine.BICHEEFHEC(arg_2_0) then
		local var_2_2 = {
			message = Engine.CBBHFCGDIC("PLATFORM/COMMERCE_NO_ONLINE_ERROR")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_2_2, nil, false, true)
	elseif CONDITIONS.IsTrialLicense() then
		if CONDITIONS.IsPS4() then
			Commerce.DAGIHHFJIJ(arg_2_0)
		elseif CONDITIONS.IsXboxOne() then
			LUI.FlowManager.RequestPopupMenu(nil, "ShowUpsellXboxStore", false, nil, false, {}, nil, false, true)
		end
	else
		InGameStore.FetchCatalog(arg_2_0, true, false)

		if arg_2_5 then
			LUI.FlowManager.RequestPopupMenu(nil, arg_2_4, true, arg_2_0, false, arg_2_3)
		else
			LUI.FlowManager.RequestAddMenu(arg_2_4, true, arg_2_0, false, arg_2_3)
		end

		Engine.BACIFDBICF(arg_2_0, arg_2_1 or "None", arg_2_2 or "None")
	end
end

function STORE.CheckForPersonalRecommendations(arg_3_0)
	local function var_3_0(arg_4_0)
		if Dvar.IBEGCHEFE("LROPKRSOL") then
			local var_4_0 = Store.IAACDBFDC(arg_3_0)
			local var_4_1 = arg_4_0
			local var_4_2 = {}

			for iter_4_0 = 1, #var_4_1 do
				local var_4_3 = var_4_1[iter_4_0]
				local var_4_4 = os.time(os.date("!*t"))

				if var_4_0[var_4_3] and var_4_4 > var_4_0[var_4_3].saleStart and var_4_4 < var_4_0[var_4_3].saleEnd then
					table.insert(var_4_2, var_4_3)
				end
			end

			return var_4_2
		else
			return arg_4_0
		end
	end

	local function var_3_1(arg_5_0)
		local var_5_0 = arg_5_0
		local var_5_1 = {}

		for iter_5_0 = 1, #var_5_0 do
			local var_5_2 = tonumber(var_5_0[iter_5_0])

			if Loot.DEBEIFJEEG(arg_3_0, var_5_2) <= 0 then
				table.insert(var_5_1, var_5_0[iter_5_0])
			end
		end

		return var_5_1
	end

	local function var_3_2(arg_6_0)
		local var_6_0

		if Engine.CFHBIHABCB(arg_3_0) then
			var_6_0 = Dvar.DHEEJCCJBH("ROTRKSQNT") or ""
		else
			var_6_0 = Dvar.DHEEJCCJBH("LQNLSMLQTS") or ""
		end

		local var_6_1 = split(var_6_0, ",")
		local var_6_2 = {}

		if var_6_1 and #var_6_1 > 0 then
			for iter_6_0 = 1, #var_6_1 do
				local var_6_3 = var_6_1[iter_6_0]

				var_6_2[var_6_3] = var_6_3
			end

			local var_6_4 = arg_6_0
			local var_6_5 = {}

			for iter_6_1 = 1, #var_6_4 do
				local var_6_6 = var_6_4[iter_6_1]

				if not var_6_2[var_6_6] then
					table.insert(var_6_5, var_6_6)
				end
			end

			return var_6_5
		else
			return arg_6_0
		end
	end

	local function var_3_3(arg_7_0)
		local var_7_0 = {}
		local var_7_1 = Dvar.BJJCJHDBII("OMTLRQOPLK")
		local var_7_2 = Engine.DDHICDBBDI().day

		math.randomseed(var_7_2)

		for iter_7_0 = 1, #arg_7_0 do
			if var_7_1 < math.random() then
				table.insert(var_7_0, arg_7_0[iter_7_0])
			end
		end

		return var_7_0
	end

	local var_3_4 = Store.CDHBJGJJBB(arg_3_0)
	local var_3_5 = {}

	if var_3_4 and #var_3_4 > 1 then
		local var_3_6

		if Engine.CFHBIHABCB(arg_3_0) then
			var_3_6 = Dvar.DHEEJCCJBH("MOLOQRLLQK") or ""
		else
			var_3_6 = Dvar.DHEEJCCJBH("LSLPPRMTLR") or ""
		end

		local var_3_7 = split(var_3_6, ",")
		local var_3_8 = var_3_3(var_3_7)
		local var_3_9 = table.concat(var_3_8, ",") .. "," .. var_3_4

		var_3_5 = split(var_3_9, ",")
		var_3_5 = var_3_0(var_3_5)
		var_3_5 = var_3_2(var_3_5)
		var_3_5 = var_3_1(var_3_5)
	end

	if var_3_5 and #var_3_5 > 0 then
		return table.concat(var_3_5, ",")
	end
end

function STORE.IsCatalogReady(arg_8_0)
	return InGameStore.GetCatalogStatus(arg_8_0) == InGameStoreCatalogStatus.READY
end

function STORE.FormatRecommendationItems(arg_9_0)
	assert(arg_9_0)

	arg_9_0 = arg_9_0 or ""

	local var_9_0 = split(arg_9_0, ",")
	local var_9_1 = {}
	local var_9_2 = {}

	for iter_9_0 = 1, #var_9_0 do
		local var_9_3 = var_9_0[iter_9_0]

		if not var_9_1[var_9_3] then
			var_9_1[var_9_3] = var_9_3

			table.insert(var_9_2, var_9_3)
		end
	end

	if Dvar.IBEGCHEFE("OKKOKTLTP") then
		local var_9_4 = Engine.DDHICDBBDI().day

		math.randomseed(var_9_4)

		local var_9_5 = #var_9_2

		while var_9_5 > 0 do
			local var_9_6 = math.random(var_9_5)

			var_9_2[var_9_6], var_9_2[var_9_5] = var_9_2[var_9_5], var_9_2[var_9_6]
			var_9_5 = var_9_5 - 1
		end
	end

	return table.concat(var_9_2, ",")
end

function STORE.IsGameUpsellProduct(arg_10_0)
	return STORE.GameUpsellIDs[arg_10_0] ~= nil
end

function STORE.GetGameUpsellProducts(arg_11_0)
	local var_11_0 = {}

	if STORE.IsCatalogReady(arg_11_0) then
		local var_11_1 = InGameStore.GetCategoryProducts(arg_11_0, STORE.TitlesCategory)

		if var_11_1 and #var_11_1 > 0 then
			for iter_11_0, iter_11_1 in ipairs(var_11_1) do
				if STORE.IsGameUpsellProduct(iter_11_1.productId) then
					table.insert(var_11_0, iter_11_1)
				end
			end
		end
	end

	return var_11_0
end

function STORE.HasSeenItem(arg_12_0, arg_12_1)
	return Loot.HDJCADADF(arg_12_0, arg_12_1)
end

function STORE.MarkItemSeen(arg_13_0, arg_13_1)
	return Loot.DAGICBIGDH(arg_13_0, arg_13_1)
end

function STORE.AreAnyBundlesNew(arg_14_0, arg_14_1)
	if arg_14_1 then
		for iter_14_0, iter_14_1 in pairs(arg_14_1) do
			if not STORE.HasSeenItem(arg_14_0, iter_14_1.bundleID) then
				return true
			end
		end
	end

	return false
end

function STORE.GetSmartBundleID(arg_15_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_15_0, CSV.bundleIDs.cols.smartID))
end

function STORE.GetBundlePurchaseID(arg_16_0, arg_16_1)
	local var_16_0 = STORE.GetSmartBundleID(arg_16_1)

	if STORE.IsItemOnSale(arg_16_1, arg_16_0) then
		return arg_16_1 + STORE.ItemSaleIdOffset
	elseif var_16_0 and Loot.DEBEIFJEEG(arg_16_0, var_16_0) > 0 then
		return arg_16_1 + STORE.SmartBundleIdOffset
	end

	return arg_16_1
end

function STORE.GetBundleCost(arg_17_0, arg_17_1)
	local var_17_0 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_17_1, CSV.bundleIDs.cols.currencyAmount))
	local var_17_1
	local var_17_2 = STORE.GetSmartBundleID(arg_17_1)

	if STORE.IsItemOnSale(arg_17_1, arg_17_0) then
		var_17_1 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_17_1, CSV.bundleIDs.cols.saleCurrencyAmount))
	elseif var_17_2 and Loot.DEBEIFJEEG(arg_17_0, var_17_2) > 0 then
		var_17_1 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_17_1, CSV.bundleIDs.cols.smartCost))
	end

	return var_17_0, var_17_1
end

function STORE.CategoryHasNewItems(arg_18_0, arg_18_1)
	assert(arg_18_0)
	assert(arg_18_1)

	arg_18_1.items = arg_18_1.items or {}

	local var_18_0 = arg_18_1.items and arg_18_1.items[1] or {}

	if var_18_0.emptyCategory then
		return false
	end

	if arg_18_1.idPubVar and var_18_0.layoutOnlyItem then
		local var_18_1 = Dvar.DHEEJCCJBH(arg_18_1.idPubVar) or ""

		if arg_18_1.justForYou then
			local var_18_2 = STORE.CheckForPersonalRecommendations(arg_18_0)

			if var_18_2 then
				var_18_1 = STORE.FormatRecommendationItems(var_18_2 .. "," .. var_18_1)
			end
		end

		local var_18_3 = split(var_18_1, ",")
		local var_18_4 = 0

		for iter_18_0 = 1, #var_18_3 do
			local var_18_5 = tonumber(var_18_3[iter_18_0])

			if STORE.BundleAvailable(arg_18_0, var_18_5) then
				var_18_4 = var_18_4 + 1

				if not STORE.HasSeenItem(arg_18_0, var_18_5) then
					return true
				end
			end

			if var_18_4 == arg_18_1.numItemsShown then
				break
			end
		end
	end

	return false
end

function STORE.CategoryHasLimitedTimeItems(arg_19_0, arg_19_1)
	assert(arg_19_0)
	assert(arg_19_1)

	arg_19_1.items = arg_19_1.items or {}

	local var_19_0 = arg_19_1.items and arg_19_1.items[1] or {}

	if var_19_0.emptyCategory then
		return nil
	end

	if arg_19_1.idPubVar and var_19_0.layoutOnlyItem then
		local var_19_1 = Dvar.DHEEJCCJBH(arg_19_1.idPubVar) or ""

		if arg_19_1.justForYou then
			local var_19_2 = STORE.CheckForPersonalRecommendations(arg_19_0)

			if var_19_2 then
				var_19_1 = STORE.FormatRecommendationItems(var_19_2 .. "," .. var_19_1)
			end
		end

		local var_19_3 = split(var_19_1, ",")
		local var_19_4 = 0

		for iter_19_0 = 1, #var_19_3 do
			local var_19_5 = tonumber(var_19_3[iter_19_0])

			if STORE.BundleAvailable(arg_19_0, var_19_5) then
				local var_19_6 = {
					file = CSV.bundleIDs.file,
					cols = CSV.bundleIDs.cols
				}
				local var_19_7 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_19_3[iter_19_0])
				local var_19_8 = CSV.ReadRow(var_19_6, var_19_7)

				if var_19_8.isBattlePassBundle ~= "1" then
					local var_19_9 = var_19_8.purchaseEnd ~= "" and var_19_8.purchaseEnd or nil

					if var_19_5 == tonumber(BATTLEPASS.GetTierSkipGiftID()) and BATTLEPASS.IsTierSkipGiftActive(arg_19_0) then
						var_19_9 = BATTLEPASS.GetTierSkipGiftTimer()
					end

					local var_19_10, var_19_11, var_19_12 = STORE.GetCategoryTimeLeft(nil, var_19_9)

					if not var_19_9 then
						var_19_4 = var_19_4 + 1
					elseif var_19_10 > 0 then
						return var_19_9
					end
				end
			end

			if var_19_4 == arg_19_1.numItemsShown then
				break
			end
		end
	end

	return nil
end

function STORE.HasNewAndFreeAndLimitedTimeItems(arg_20_0)
	assert(arg_20_0)

	local var_20_0 = Store.DBFHBBIDHD()
	local var_20_1 = Engine.DBFHBBIDHD(var_20_0)
	local var_20_2 = false
	local var_20_3 = false
	local var_20_4

	for iter_20_0 = 1, #var_20_1 do
		local var_20_5 = var_20_1[iter_20_0]

		var_20_5.items = var_20_5.items or {}

		local var_20_6 = STORE.CategoryHasNewItems(arg_20_0, var_20_5) or false
		local var_20_7 = STORE.CategoryHasFreeItems(arg_20_0, var_20_5) or false

		var_20_4 = var_20_4 or STORE.CategoryHasLimitedTimeItems(arg_20_0, var_20_5)

		if var_20_6 then
			var_20_2 = true
		end

		if var_20_7 then
			var_20_3 = true
		end

		if var_20_2 and var_20_3 and var_20_4 then
			break
		end
	end

	return var_20_2, var_20_3, var_20_4
end

function STORE.HasFreeItems(arg_21_0)
	assert(arg_21_0)

	local var_21_0 = Store.DBFHBBIDHD()
	local var_21_1 = Engine.DBFHBBIDHD(var_21_0)

	for iter_21_0 = 1, #var_21_1 do
		local var_21_2 = var_21_1[iter_21_0]

		var_21_2.items = var_21_2.items or {}

		if STORE.CategoryHasFreeItems(arg_21_0, var_21_2) then
			return true
		end
	end

	return false
end

function STORE.CategoryHasFreeItems(arg_22_0, arg_22_1)
	assert(arg_22_0)
	assert(arg_22_1)

	arg_22_1.items = arg_22_1.items or {}

	local var_22_0 = arg_22_1.items and arg_22_1.items[1] or {}

	if var_22_0.emptyCategory then
		return false
	end

	if arg_22_1.idPubVar and var_22_0.layoutOnlyItem then
		local var_22_1 = Dvar.DHEEJCCJBH(arg_22_1.idPubVar) or ""

		if arg_22_1.justForYou then
			local var_22_2 = STORE.CheckForPersonalRecommendations(arg_22_0)

			if var_22_2 then
				var_22_1 = STORE.FormatRecommendationItems(var_22_2 .. "," .. var_22_1)
			end
		end

		local var_22_3 = split(var_22_1, ",")
		local var_22_4 = 0

		for iter_22_0 = 1, #var_22_3 do
			local var_22_5 = tonumber(var_22_3[iter_22_0])

			if STORE.BundleAvailable(arg_22_0, var_22_5) then
				var_22_4 = var_22_4 + 1

				if tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_22_5, CSV.bundleIDs.cols.currencyAmount)) == 0 then
					return true
				elseif STORE.IsItemOnSale(var_22_5, arg_22_0) and tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_22_5, CSV.bundleIDs.cols.saleCurrencyAmount)) == 0 then
					return true
				end
			end

			if var_22_4 == arg_22_1.numItemsShown then
				break
			end
		end
	end

	return false
end

function STORE.HasNewItems(arg_23_0)
	assert(arg_23_0)

	local var_23_0 = Store.DBFHBBIDHD()
	local var_23_1 = Engine.DBFHBBIDHD(var_23_0)

	for iter_23_0 = 1, #var_23_1 do
		local var_23_2 = var_23_1[iter_23_0]

		var_23_2.items = var_23_2.items or {}

		if STORE.CategoryHasNewItems(arg_23_0, var_23_2) then
			return true
		end
	end

	return false
end

function STORE.GetCategoryIndex(arg_24_0)
	local var_24_0 = Store.DBFHBBIDHD()
	local var_24_1 = Engine.DBFHBBIDHD(var_24_0)

	for iter_24_0 = 1, #var_24_1 do
		local var_24_2 = var_24_1[iter_24_0]

		if var_24_2.id and #var_24_2.id > 0 then
			assert(STORE.CategoryType[var_24_2.id] ~= nil, "The category ID \"" .. var_24_2.id .. "\" in the store_config JSON file for category name \"" .. Engine.CBBHFCGDIC(var_24_2.name) .. "\" is undefined. Make sure the ID is included in the STORE.CategoryType enum in StoreUtils.lua.")

			if var_24_2.id == arg_24_0 then
				return iter_24_0
			end
		end
	end
end

function STORE.GetIndexForBundle(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_2 then
		local var_25_0 = Store.DBFHBBIDHD()

		arg_25_2 = Engine.DBFHBBIDHD(var_25_0)
	end

	for iter_25_0 = 1, #arg_25_2 do
		local var_25_1 = arg_25_2[iter_25_0]

		if var_25_1.idPubVar then
			local var_25_2 = Dvar.DHEEJCCJBH(var_25_1.idPubVar) or ""

			if var_25_1.justForYou then
				local var_25_3 = STORE.CheckForPersonalRecommendations(arg_25_1)

				if var_25_3 then
					var_25_2 = var_25_3 .. "," .. var_25_2
				end
			end

			local var_25_4 = split(var_25_2, ",")
			local var_25_5 = 0

			for iter_25_1 = 1, #var_25_4 do
				local var_25_6 = tonumber(var_25_4[iter_25_1])

				if STORE.BundleAvailable(arg_25_1, var_25_6) then
					var_25_5 = var_25_5 + 1

					if var_25_6 == tonumber(arg_25_0) then
						return iter_25_0, var_25_5
					end
				end

				if var_25_5 == var_25_1.numItemsShown then
					break
				end
			end
		end
	end
end

function STORE.GetDLCID(arg_26_0)
	local var_26_0 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_26_0, CSV.bundleIDs.cols.dlcRef)

	if #var_26_0 == 0 then
		return
	end

	local var_26_1 = tonumber(StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.name, var_26_0, CSV.dlcIDs.cols.id))

	if not var_26_1 then
		return
	end

	if CONDITIONS.IsPS4() then
		return var_26_1 + STORE.PS4DLCOffset
	elseif CONDITIONS.IsXboxOne() then
		return var_26_1 + STORE.XB3DLCOffset
	elseif CONDITIONS.IsPC() then
		return var_26_1 + STORE.PCDLCOffset
	end
end

function STORE.GetNumItemsInBundle(arg_27_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_27_0, CSV.bundleIDs.cols.numItems))
end

function STORE.GetFirstPartyBundleData(arg_28_0, arg_28_1, arg_28_2)
	if not arg_28_1 or not arg_28_2 then
		assert(arg_28_1)
		assert(arg_28_2)

		return
	end

	if not STORE.IsCatalogReady(arg_28_0) then
		assert(false, "Catalog has not been fetched.")

		return
	end

	local var_28_0 = InGameStore.GetProduct(arg_28_0, arg_28_2)

	if not var_28_0 then
		assert(var_28_0, "No data found for product ID, " .. arg_28_2)

		return
	end

	local function var_28_1()
		LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangeFencePopup", true, arg_28_0, false, {
			controllerIndex = arg_28_0,
			message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASING_DLC")
		})
		InGameStore.SelectProduct(arg_28_0, arg_28_2, InGameStorePurchaseType.BROWSE)
	end

	return {
		isFirstParty = true,
		bundleID = tonumber(arg_28_1),
		price = var_28_0.price,
		owned = var_28_0.owned,
		firstPartyPurchase = var_28_1
	}
end

function STORE.GetFirstPartyProductID(arg_30_0)
	return StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_30_0, CSV.bundleIDs.cols.firstPartyProductID)
end

function STORE.IsFirstPartyBundle(arg_31_0)
	assert(arg_31_0)

	if not arg_31_0 then
		return
	end

	local var_31_0 = STORE.GetFirstPartyProductID(arg_31_0)

	return var_31_0 and #var_31_0 > 0
end

function STORE.IsGameUpsellBundle(arg_32_0)
	assert(arg_32_0)

	if not arg_32_0 then
		return
	end

	local var_32_0 = STORE.GetFirstPartyProductID(arg_32_0)

	return var_32_0 == STORE.GameUpsellStandardID or var_32_0 == STORE.GameUpsellStandardIDSIEE or var_32_0 == STORE.GameUpsellEnhancedID
end

function STORE.BundleAvailable(arg_33_0, arg_33_1)
	arg_33_1 = tonumber(arg_33_1)

	if not arg_33_1 then
		return false
	end

	if STORE.IsGameUpsellBundle(arg_33_1) then
		return not Engine.CFHBIHABCB(arg_33_0)
	end

	if Loot.DEBEIFJEEG(arg_33_0, arg_33_1) > 0 then
		return false
	end

	local var_33_0 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_1, CSV.bundleIDs.cols.oldBundleOwnershipID)

	if var_33_0 and #var_33_0 > 0 and Loot.DEBEIFJEEG(arg_33_0, tonumber(var_33_0)) then
		return false
	end

	local var_33_1 = STORE.GetFirstPartyProductID(arg_33_1)

	if var_33_1 and #var_33_1 > 0 then
		if STORE.IsCatalogReady(arg_33_0) then
			local var_33_2 = InGameStore.GetProduct(arg_33_0, var_33_1)

			if var_33_2 and var_33_2.status ~= InGameStoreProductStatus.NOT_OWNED then
				return false
			end
		else
			return false
		end
	end

	local var_33_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_1, CSV.bundleIDs.cols.battlePassID)

	if #var_33_3 > 0 then
		local var_33_4 = tonumber(BATTLEPASS.GetTierFromID(arg_33_0, var_33_3))
		local var_33_5 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_1, CSV.bundleIDs.cols.minTierInclude))
		local var_33_6 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_1, CSV.bundleIDs.cols.maxTierInclude))

		if var_33_4 < var_33_5 or var_33_6 < var_33_4 then
			return false
		end
	end

	if StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_1, CSV.bundleIDs.cols.isBattlePassBundle) == "1" then
		local var_33_7 = tonumber(BATTLEPASS.GetTierSkipGiftID())
		local var_33_8 = BATTLEPASS.IsOwned(arg_33_0)
		local var_33_9 = LOOT.GetBundleItemsMappedByType(arg_33_1)[LOOT.itemTypes.BATTLE_PASS]
		local var_33_10 = 0
		local var_33_11 = false

		if arg_33_1 == var_33_7 and not BATTLEPASS.IsTierSkipGiftActive(arg_33_0) then
			return false
		end

		if var_33_9 then
			for iter_33_0 = 1, #var_33_9 do
				local var_33_12 = var_33_9[iter_33_0]
				local var_33_13 = LOOT.GetItemRef(LOOT.itemTypes.BATTLE_PASS, var_33_12)
				local var_33_14 = tonumber(BATTLEPASS.GetItemType(var_33_13))

				if var_33_14 == BATTLEPASS.ItemTypes.PREMIUM or var_33_14 == BATTLEPASS.ItemTypes.BUNDLE then
					var_33_11 = true

					if var_33_8 then
						return false
					end
				end

				if var_33_14 == BATTLEPASS.ItemTypes.TIER_SKIP or var_33_14 == BATTLEPASS.ItemTypes.BUNDLE then
					var_33_10 = var_33_10 + BATTLEPASS.GetNumSkipsInBundle(var_33_13)
				end
			end
		end

		if not var_33_8 and not var_33_11 then
			return false
		end
	end

	return true
end

function STORE.GoToStore(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	local var_34_0

	if arg_34_3 then
		var_34_0 = {
			defaultItem = arg_34_3,
			andPurchase = arg_34_4
		}
	end

	STORE.EnterStore(arg_34_0, arg_34_1, arg_34_2, var_34_0, STORE.GetStoreMenu(false), false)
end

function STORE.GoToStoreFromMainMenu(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = {
		fromMainMenu = true
	}

	STORE.EnterStore(arg_35_0, arg_35_1, arg_35_2, var_35_0, STORE.GetStoreMenu(true), false)
end

function STORE.GoToCODPointsOnlyStore(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = {
		onlyCODPoints = true
	}

	STORE.EnterStore(arg_36_0, arg_36_1, arg_36_2, var_36_0, STORE.GetStoreMenu(false), false)
end

function STORE.GetStoreDescription()
	return CONDITIONS.AreCODPointsEnabled() and Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC") or Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC_NO_COD_POINTS")
end

function STORE.GetBundleDescription(arg_38_0)
	local var_38_0 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_38_0, CSV.bundleIDs.cols.description)
	local var_38_1 = Engine.CBBHFCGDIC(var_38_0)

	if not Engine.CIDEADAABH() and STORE.BundleContainsDismemberment(arg_38_0) then
		var_38_1 = var_38_1 .. " " .. Engine.CBBHFCGDIC("LUA_MENU/DISMEMBERMENT_REGION_LOCK_WARNING")
	end

	return var_38_1
end

function STORE.BundleContainsDismemberment(arg_39_0)
	local var_39_0 = LOOT.GetBundleItemsMappedByType(arg_39_0)[LOOT.itemTypes.WEAPON]

	if var_39_0 and #var_39_0 > 0 then
		for iter_39_0 = 1, #var_39_0 do
			local var_39_1 = var_39_0[iter_39_0]

			if WEAPON.IsWeaponDismembermentEnabled(var_39_1) then
				return true
			end
		end
	end

	return false
end

function STORE.GetCategoryTimeLeft(arg_40_0, arg_40_1)
	local var_40_0 = ""
	local var_40_1 = 0
	local var_40_2 = Engine.DEIDGHDBHD()

	if arg_40_1 and #arg_40_1 > 0 then
		var_40_2 = arg_40_1
	elseif arg_40_0 and #arg_40_0 > 0 then
		var_40_2 = Dvar.DHEEJCCJBH(arg_40_0)
	end

	local var_40_3 = tostring(var_40_2)

	if var_40_3 and #var_40_3 > 0 then
		var_40_1 = Engine.CCEJJCCDEG(var_40_3)

		if var_40_1 > 0 then
			local var_40_4 = math.floor(var_40_1 % 604800 / 86400)
			local var_40_5 = math.floor(var_40_1 % 86400 / 3600)
			local var_40_6 = math.floor(var_40_1 % 3600 / 60)
			local var_40_7 = math.floor(var_40_1 % 60)

			var_40_0 = Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", var_40_4, var_40_5, var_40_6, var_40_7)
		else
			var_40_0 = Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", 0, 0, 0, 0)
		end
	end

	return var_40_1, var_40_0, var_40_3
end

function STORE.RunTimer(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4, arg_41_5, arg_41_6)
	assert(arg_41_0)

	if not arg_41_1 and not arg_41_4 then
		arg_41_0:Wait(1, true)
		arg_41_0:SetAlpha(0)

		return
	end

	arg_41_0:Wait(1000, true).onComplete = function()
		return STORE.RunTimer(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4, arg_41_5, arg_41_6)
	end

	local var_41_0, var_41_1, var_41_2 = STORE.GetCategoryTimeLeft(arg_41_1, arg_41_4)

	if not arg_41_0.timerValue and var_41_2 ~= "" then
		arg_41_0.timerValue = var_41_2
	end

	if arg_41_6 then
		arg_41_6(var_41_0)
	end

	if arg_41_2 then
		if not arg_41_3 or var_41_0 <= arg_41_3 then
			arg_41_0:SetAlpha(1)
		else
			arg_41_0:SetAlpha(0)
		end

		arg_41_2:setText(var_41_1)
	end

	if var_41_0 <= 0 and arg_41_5 then
		LUI.FlowManager.RequestLeaveMenu(arg_41_0)
	end
end

function STORE.GetBundlePreviewWeapon(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	assert(arg_43_0)
	assert(arg_43_1)
	assert(arg_43_2)
	assert(arg_43_3)

	local var_43_0 = {}
	local var_43_1 = LOOT.GetBundleItemsMappedByType(arg_43_3)

	if arg_43_1 == LOOT.itemTypes.WEAPON then
		local var_43_2 = WEAPON.GenerateWeaponTableFromID(arg_43_0, arg_43_2)

		if var_43_2 then
			table.insert(var_43_0, var_43_2)
		else
			assert(false, "Unable to build weapon table for ID " .. arg_43_2)

			return
		end
	elseif var_43_1[LOOT.itemTypes.WEAPON] ~= nil then
		local var_43_3 = {}

		for iter_43_0 = 1, #var_43_1[LOOT.itemTypes.WEAPON] do
			local var_43_4 = tonumber(var_43_1[LOOT.itemTypes.WEAPON][iter_43_0])
			local var_43_5 = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, var_43_4)
			local var_43_6 = WEAPON.GetSlotFromRef(var_43_5)
			local var_43_7 = tonumber(LOOT.GetItemQualityWithID(LOOT.itemTypes.WEAPON, var_43_4)) or 0

			table.insert(var_43_3, {
				weaponID = var_43_4,
				slot = var_43_6,
				rarity = var_43_7
			})
		end

		table.sort(var_43_3, function(arg_44_0, arg_44_1)
			if (arg_43_1 == LOOT.itemTypes.OPERATOR or arg_43_1 == LOOT.itemTypes.OPERATOR_SKIN) and arg_44_0.slot ~= arg_44_1.slot then
				return arg_44_0.slot < arg_44_1.slot
			end

			if arg_44_0.rarity ~= arg_44_1.rarity then
				return arg_44_0.rarity > arg_44_1.rarity
			end
		end)

		for iter_43_1 = 1, #var_43_3 do
			local var_43_8 = var_43_3[iter_43_1].weaponID
			local var_43_9 = WEAPON.GenerateWeaponTableFromID(arg_43_0, var_43_8)

			if var_43_9 then
				table.insert(var_43_0, var_43_9)
			end
		end
	end

	local var_43_10 = LOADOUT.GetFavoriteLoadoutIndex(arg_43_0) or 0
	local var_43_11 = LOADOUT.GetLoadoutPlayerData(arg_43_0, var_43_10)

	if var_43_11 then
		local var_43_12 = WEAPON.GenerateWeaponTable(var_43_11.weaponSetups[0])

		if var_43_12 then
			table.insert(var_43_0, var_43_12)
		end
	end

	for iter_43_2 = 1, LOADOUT.DefaultClassCount do
		if iter_43_2 ~= favoriteLoadoutIndex then
			local var_43_13 = LOADOUT.GetLoadoutPlayerData(arg_43_0, iter_43_2)

			if var_43_13 then
				local var_43_14 = WEAPON.GenerateWeaponTable(var_43_13.weaponSetups[0])

				if var_43_14 then
					table.insert(var_43_0, var_43_14)
				end
			end
		end
	end

	local var_43_15 = WEAPON.DefaultPrimaryID
	local var_43_16 = WEAPON.GenerateWeaponTableFromID(arg_43_0, var_43_15)

	if var_43_16 then
		table.insert(var_43_0, var_43_16)
	end

	local function var_43_17(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
		if arg_45_0 == LOOT.itemTypes.WEAPON then
			return true
		elseif arg_45_0 == LOOT.itemTypes.OPERATOR or arg_45_0 == LOOT.itemTypes.OPERATOR_SKIN then
			return true
		elseif arg_45_0 == LOOT.itemTypes.CHARM then
			return arg_45_1
		elseif arg_45_0 == LOOT.itemTypes.STICKER then
			return arg_45_2
		elseif arg_45_0 == LOOT.itemTypes.CAMO then
			return arg_45_3
		end
	end

	local var_43_18 = var_43_1[LOOT.itemTypes.CHARM] ~= nil
	local var_43_19 = var_43_1[LOOT.itemTypes.STICKER] ~= nil
	local var_43_20 = var_43_1[LOOT.itemTypes.CAMO] ~= nil

	for iter_43_3, iter_43_4 in ipairs(var_43_0) do
		local var_43_21 = false
		local var_43_22 = false
		local var_43_23 = false

		if var_43_18 and WEAPON.SupportsCosmetics(iter_43_4.weapon) and arg_43_1 ~= LOOT.itemTypes.STICKER and arg_43_1 ~= LOOT.itemTypes.CAMO then
			local var_43_24

			if arg_43_1 == LOOT.itemTypes.CHARM then
				var_43_24 = arg_43_2
			else
				var_43_24 = tonumber(var_43_1[LOOT.itemTypes.CHARM][1])
			end

			iter_43_4.cosmeticAttachment = LOOT.GetItemRef(LOOT.itemTypes.CHARM, var_43_24)
			var_43_21 = true
		end

		local var_43_25 = WEAPON.GetMaxStickerSlotsForWeapon(iter_43_4.weapon)

		if var_43_19 and var_43_25 > 0 and arg_43_1 ~= LOOT.itemTypes.CHARM and arg_43_1 ~= LOOT.itemTypes.CAMO then
			local var_43_26 = 0

			if arg_43_1 == LOOT.itemTypes.STICKER then
				var_43_26 = var_43_25
			else
				var_43_26 = math.min(var_43_25, #var_43_1[LOOT.itemTypes.STICKER])
			end

			iter_43_4.stickers = {}

			for iter_43_5 = 1, var_43_26 do
				local var_43_27

				if arg_43_1 == LOOT.itemTypes.STICKER then
					var_43_27 = arg_43_2
				else
					var_43_27 = tonumber(var_43_1[LOOT.itemTypes.STICKER][iter_43_5])
				end

				table.insert(iter_43_4.stickers, LOOT.GetItemRef(LOOT.itemTypes.STICKER, var_43_27))
			end

			var_43_22 = true
		end

		local var_43_28 = arg_43_1 ~= LOOT.itemTypes.WEAPON and arg_43_1 ~= LOOT.itemTypes.CHARM and arg_43_1 ~= LOOT.itemTypes.STICKER

		if var_43_20 and var_43_28 then
			local var_43_29

			if arg_43_1 == LOOT.itemTypes.CAMO then
				var_43_29 = arg_43_2
			else
				var_43_29 = tonumber(var_43_1[LOOT.itemTypes.CAMO][1])
			end

			iter_43_4.camo = LOOT.GetItemRef(LOOT.itemTypes.CAMO, var_43_29)

			local var_43_30 = true
		end

		if var_43_17(arg_43_1, var_43_21, var_43_22, var_43_20) then
			return iter_43_4
		end
	end
end

function STORE.PreviewSupported(arg_46_0)
	return arg_46_0 == LOOT.itemTypes.WEAPON or arg_46_0 == LOOT.itemTypes.CHARM or arg_46_0 == LOOT.itemTypes.STICKER or arg_46_0 == LOOT.itemTypes.WATCH or arg_46_0 == LOOT.itemTypes.OPERATOR or arg_46_0 == LOOT.itemTypes.OPERATOR_SKIN or arg_46_0 == LOOT.itemTypes.PLAYERCARD or arg_46_0 == LOOT.itemTypes.EMBLEM or arg_46_0 == LOOT.itemTypes.CAMO or arg_46_0 == LOOT.itemTypes.RETICLE or arg_46_0 == LOOT.itemTypes.SPRAYS or arg_46_0 == LOOT.itemTypes.QUIP or arg_46_0 == LOOT.itemTypes.OPERATOR_EXECUTION or arg_46_0 == LOOT.itemTypes.GESTURES or arg_46_0 == LOOT.itemTypes.VEHICLE_CAMO or arg_46_0 == LOOT.itemTypes.VEHICLE_HORN or arg_46_0 == LOOT.itemTypes.BATTLE_PASS or arg_46_0 == LOOT.itemTypes.BUNDLE or arg_46_0 == LOOT.itemTypes.MISSION
end

function STORE.PreviewItem(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5, arg_47_6, arg_47_7)
	local function var_47_0()
		if arg_47_3 then
			return STORE.GetBundlePreviewWeapon(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
		else
			return BATTLEPASS.GetPreviewWeapon(arg_47_0, arg_47_1, arg_47_2)
		end
	end

	local function var_47_1()
		local var_49_0

		if arg_47_1 ~= LOOT.itemTypes.WATCH then
			var_49_0 = var_47_0()

			if not var_49_0 then
				return
			end
		end

		local var_49_1 = LOOT.GetItemRef(arg_47_1, arg_47_2)

		if arg_47_1 == LOOT.itemTypes.WEAPON then
			local var_49_2 = {
				isStorePreview = true,
				storePreviewItemType = arg_47_1,
				timerValue = arg_47_4,
				weaponTable = var_49_0,
				itemRef = var_49_1,
				weaponRef = var_49_1,
				isBattlePass = arg_47_5,
				isVariant = WEAPON.IsVariant(arg_47_0, arg_47_2),
				bundleData = arg_47_7,
				quickPurchaseEnabled = arg_47_3 and not STORE.IsFirstPartyBundle(arg_47_3)
			}

			LUI.FlowManager.RequestAddMenu("ModificationPreview", true, arg_47_0, arg_47_6, var_49_2, true)
		else
			local var_49_3 = {
				isStorePreview = true,
				storePreviewItemType = arg_47_1,
				titleOverride = LOOT.GetItemName(arg_47_1, var_49_1),
				timerValue = arg_47_4,
				weaponTable = var_49_0,
				isBattlePass = arg_47_5,
				watchRef = arg_47_1 == LOOT.itemTypes.WATCH and var_49_1 or nil,
				itemRef = var_49_1,
				bundleData = arg_47_7,
				quickPurchaseEnabled = arg_47_3 and not STORE.IsFirstPartyBundle(arg_47_3)
			}

			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_47_0, arg_47_6, var_49_3, true)
		end
	end

	local function var_47_2()
		local var_50_0 = {
			isStorePreview = true,
			lootID = arg_47_2,
			timerValue = arg_47_4,
			bundleData = arg_47_7,
			isBattlePass = arg_47_5,
			quickPurchaseEnabled = arg_47_3 and not STORE.IsFirstPartyBundle(arg_47_3)
		}

		LUI.FlowManager.RequestAddMenu("ReticleSelect", true, arg_47_0, arg_47_6, var_50_0, true)
	end

	local function var_47_3()
		local var_51_0
		local var_51_1
		local var_51_2

		if arg_47_1 == LOOT.itemTypes.OPERATOR then
			var_51_0 = LOOT.GetItemRef(arg_47_1, arg_47_2)
			var_51_1 = OPERATOR.GetEquippedSkinForOperator(arg_47_0, var_51_0)
			var_51_2 = OPERATOR.GetName(var_51_0)
		elseif arg_47_1 == LOOT.itemTypes.FEATURE then
			local var_51_3 = LOOT.GetItemRef(arg_47_1, arg_47_2)
			local var_51_4 = LOOT.GetFeatureOperatorSkinRef(var_51_3)

			assert(var_51_4 and #var_51_4 > 0)

			var_51_0 = OPERATOR.GetSkinOwnerRef(var_51_4)
			var_51_1 = OPERATOR.GetOperatorSkinByRef(arg_47_0, var_51_4, var_51_0)
			var_51_2 = OPERATOR.GetSkinName(var_51_4)
		else
			var_51_0 = OPERATOR.GetOperatorRefByLootTypeAndID(arg_47_1, arg_47_2, arg_47_0)

			local var_51_5 = LOOT.GetItemRef(arg_47_1, arg_47_2)

			var_51_1 = OPERATOR.GetOperatorSkinByRef(arg_47_0, var_51_5, var_51_0)
			var_51_2 = OPERATOR.GetSkinName(var_51_5)
		end

		local var_51_6 = OPERATOR.GetOperatorSuperFactionRef(var_51_0)
		local var_51_7
		local var_51_8 = var_47_0()

		if var_51_8 then
			local var_51_9, var_51_10 = OPERATOR.GetWeaponDataFromLoadout(arg_47_0)

			var_51_7 = {
				primaryModel = WEAPON.GetWeaponModelName(var_51_8.weapon, var_51_8, {
					includeStickers = true,
					includeAttachments = true,
					useOperatorOverride = true,
					includeCamos = true,
					controllerIndex = arg_47_0
				}),
				secondaryModel = var_51_10
			}
		end

		local var_51_11 = {
			isStorePreview = true,
			operatorData = {
				currentState = tonumber(var_51_6),
				previewOperatorRef = var_51_0,
				skinInfo = var_51_1
			},
			storePreviewItemType = arg_47_1,
			titleOverride = var_51_2,
			timerValue = arg_47_4,
			weaponData = var_51_7,
			itemRef = LOOT.GetItemRef(arg_47_1, arg_47_2),
			isBattlePass = arg_47_5,
			bundleData = arg_47_7,
			quickPurchaseEnabled = arg_47_3 and not STORE.IsFirstPartyBundle(arg_47_3)
		}

		LUI.FlowManager.RequestAddMenu("OperatorShowcase", true, arg_47_0, arg_47_6, var_51_11, true)
	end

	local function var_47_4()
		local var_52_0 = {
			lootID = arg_47_2,
			lootType = arg_47_1,
			timerValue = arg_47_4,
			isBattlePass = arg_47_5,
			bundleData = arg_47_7,
			quickPurchaseEnabled = arg_47_3 and not STORE.IsFirstPartyBundle(arg_47_3)
		}

		LUI.FlowManager.RequestPopupMenu(nil, "StorePreviewItemPopup", true, arg_47_0, arg_47_6, var_52_0, nil, false, false)
	end

	local function var_47_5()
		local var_53_0 = {
			file = CSV.missionIDs.file,
			cols = CSV.missionIDs.cols
		}
		local var_53_1 = StringTable.BJJBBCJGEJ(CSV.missionIDs.file, CSV.missionIDs.cols.index, arg_47_2)
		local var_53_2 = CSV.ReadRow(var_53_0, var_53_1)
		local var_53_3 = {
			singleMissionOverride = true,
			challengeID = var_53_2.ref,
			skinLootId = tonumber(var_53_2.operatorSkinID)
		}

		LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_47_0, arg_47_6, var_53_3)
	end

	local function var_47_6()
		local var_54_0 = {
			isStorePreview = true,
			storePreviewItemType = arg_47_1,
			lootID = arg_47_2,
			lootType = arg_47_1,
			timerValue = arg_47_4,
			isBattlePass = arg_47_5,
			itemRef = LOOT.GetItemRef(arg_47_1, arg_47_2),
			bundleData = arg_47_7,
			quickPurchaseEnabled = arg_47_3 and not STORE.IsFirstPartyBundle(arg_47_3)
		}

		LUI.FlowManager.RequestPopupMenu(nil, "VehiclePreview", true, arg_47_0, arg_47_6, var_54_0, true)
	end

	if arg_47_1 == LOOT.itemTypes.WEAPON or arg_47_1 == LOOT.itemTypes.CHARM or arg_47_1 == LOOT.itemTypes.STICKER or arg_47_1 == LOOT.itemTypes.CAMO or arg_47_1 == LOOT.itemTypes.WATCH then
		var_47_1(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	elseif arg_47_1 == LOOT.itemTypes.RETICLE then
		var_47_2(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	elseif arg_47_1 == LOOT.itemTypes.OPERATOR or arg_47_1 == LOOT.itemTypes.OPERATOR_SKIN or arg_47_1 == LOOT.itemTypes.FEATURE then
		var_47_3(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	elseif arg_47_1 == LOOT.itemTypes.VEHICLE_CAMO then
		var_47_6(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	elseif arg_47_1 == LOOT.itemTypes.PLAYERCARD or arg_47_1 == LOOT.itemTypes.EMBLEM or arg_47_1 == LOOT.itemTypes.SPRAYS or arg_47_1 == LOOT.itemTypes.QUIP or arg_47_1 == LOOT.itemTypes.VEHICLE_HORN or arg_47_1 == LOOT.itemTypes.VEHICLE_TRACK or arg_47_1 == LOOT.itemTypes.OPERATOR_EXECUTION and not Engine.FABABBDBA() or arg_47_1 == LOOT.itemTypes.GESTURES or arg_47_1 == LOOT.itemTypes.BUNDLE or arg_47_1 == LOOT.itemTypes.BATTLE_PASS then
		var_47_4(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	elseif arg_47_1 == LOOT.itemTypes.MISSION then
		var_47_5(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	end
end

function STORE.ParseSalesItems(arg_55_0)
	local var_55_0

	if Engine.CFHBIHABCB(arg_55_0) then
		var_55_0 = Dvar.DHEEJCCJBH("OQLLQNMS")
	else
		var_55_0 = Dvar.DHEEJCCJBH("LKORRRQNPR")
	end

	return LUI.Split(var_55_0, ",")
end

function STORE.ParsePromotedItems(arg_56_0)
	local var_56_0

	if Engine.CFHBIHABCB(arg_56_0) then
		var_56_0 = Dvar.DHEEJCCJBH("MSKPMNRQTS")
	else
		var_56_0 = Dvar.DHEEJCCJBH("NPPRRPOLLL")
	end

	return LUI.KeyValueSplit(var_56_0, ",")
end

function STORE.IsItemOnSale(arg_57_0, arg_57_1)
	local var_57_0 = STORE.ParseSalesItems(arg_57_1)

	if var_57_0 ~= nil then
		for iter_57_0, iter_57_1 in ipairs(var_57_0) do
			if tonumber(iter_57_1) == arg_57_0 then
				return true
			end
		end
	end

	return false
end

function STORE.ParseCountDownTime(arg_58_0)
	local var_58_0

	if arg_58_0 and #arg_58_0 > 0 and tonumber(arg_58_0) > 0 then
		local var_58_1 = Engine.CCEJJCCDEG(tostring(arg_58_0))

		if var_58_1 > 0 then
			local var_58_2 = math.floor(var_58_1 % 604800 / 86400)
			local var_58_3 = math.floor(var_58_1 % 86400 / 3600)
			local var_58_4 = math.floor(var_58_1 % 3600 / 60)
			local var_58_5 = math.floor(var_58_1 % 60)

			var_58_0 = Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", var_58_2, var_58_3, var_58_4, var_58_5)
		else
			var_58_0 = Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", 0, 0, 0, 0)
		end
	end

	return var_58_0
end

function STORE.OwnsItemInCategory(arg_59_0, arg_59_1)
	if STORE.IsCatalogReady(arg_59_0) then
		local var_59_0 = InGameStore.GetCategoryProducts(arg_59_0, arg_59_1)

		for iter_59_0, iter_59_1 in ipairs(var_59_0) do
			if iter_59_1.status ~= InGameStoreProductStatus.NOT_OWNED then
				return true
			end
		end
	end

	return false
end

function STORE.IsTitleID(arg_60_0)
	for iter_60_0, iter_60_1 in pairs(STORE.TitleIDs) do
		if arg_60_0 == iter_60_1 then
			return true
		end
	end

	return false
end

function STORE.IsStandardTitleID(arg_61_0)
	return arg_61_0 == STORE.TitleIDs.BNET_STANDARD or arg_61_0 == STORE.TitleIDs.PS4_STANDARD or arg_61_0 == STORE.TitleIDs.XB3_STANDARD
end

function STORE.IsBattlePassTitleID(arg_62_0)
	return arg_62_0 == STORE.TitleIDs.BNET_BATTLE_PASS or arg_62_0 == STORE.TitleIDs.PS4_BATTLE_PASS or arg_62_0 == STORE.TitleIDs.XB3_BATTLE_PASS
end

function STORE.GetTitleIDsForCurrentPlatform()
	local var_63_0 = {}

	if Engine.DBFCJBDJEC() then
		var_63_0 = {
			STORE.TitleIDs.BNET_STANDARD,
			STORE.TitleIDs.BNET_BATTLE_PASS
		}
	elseif Engine.CIEGIACHAE() then
		var_63_0 = {
			STORE.TitleIDs.PS4_STANDARD,
			STORE.TitleIDs.PS4_BATTLE_PASS
		}
	elseif Engine.BAHIIBFDDG() then
		var_63_0 = {
			STORE.TitleIDs.XB3_STANDARD,
			STORE.TitleIDs.XB3_BATTLE_PASS
		}
	end

	return var_63_0
end

function STORE.OpenQuickPurchasePopupInPreview(arg_64_0)
	if arg_64_0 then
		if Commerce.CEDDCGHIGA(arg_64_0.controllerIndex, arg_64_0.itemCurrencyID) < arg_64_0.itemCurrencyAmount then
			local var_64_0 = {
				showBalance = true,
				controllerIndex = arg_64_0.controllerIndex,
				currencyID = arg_64_0.itemCurrencyID,
				currencyAmount = arg_64_0.itemCurrencyAmount
			}

			STORE.EnterStore(arg_64_0.controllerIndex, "StoreConfirmPurchasePopup", "ConfirmButton", var_64_0, "PurchaseCODPointsPopup", true)
		else
			local var_64_1 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_64_0.bundleID, CSV.bundleIDs.cols.name)
			local var_64_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_64_0.bundleID, CSV.bundleIDs.cols.titleImage)
			local var_64_3 = {
				itemName = var_64_1,
				itemImage = var_64_2,
				itemCurrencyID = arg_64_0.itemCurrencyID,
				itemCurrencyAmount = arg_64_0.itemCurrencyAmount,
				timerPubVar = arg_64_0.timerPubVar,
				showDisclaimer = arg_64_0.showDisclaimer,
				alreadyOwnedCount = arg_64_0.alreadyOwnedCount,
				startPurchaseImmediately = arg_64_0.startPurchaseImmediately,
				confirmAction = function()
					LUI.FlowManager.GetScopedData("StoreBundlePreview").isQuickPurchasePopupInPreview = true

					ACTIONS.RestoreMenu("StoreBundlePreview", true, arg_64_0.controllerIndex)
				end
			}

			Engine.BJDBIAGIDA(SOUND_SETS.storefront.purchaseBundle)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreConfirmPurchasePopup", true, arg_64_0.controllerIndex, false, var_64_3, nil, false, true)
		end
	end
end

function STORE.GetUpsellBundleList(arg_66_0)
	local var_66_0 = {}
	local var_66_1 = 3
	local var_66_2 = Store.DBFHBBIDHD()
	local var_66_3 = Engine.DBFHBBIDHD(var_66_2)
	local var_66_4 = STORE.CheckForPersonalRecommendations(arg_66_0)

	for iter_66_0, iter_66_1 in ipairs(var_66_3) do
		local var_66_5 = Dvar.DHEEJCCJBH(iter_66_1.idPubVar) or ""

		if iter_66_1.justForYou and var_66_4 then
			var_66_5 = STORE.FormatRecommendationItems(var_66_4 .. "," .. var_66_5)
		end

		local var_66_6 = split(var_66_5, ",")

		for iter_66_2, iter_66_3 in ipairs(var_66_6) do
			local var_66_7 = tonumber(iter_66_3)

			if STORE.BundleAvailable(arg_66_0, var_66_7) then
				local var_66_8 = {
					id = var_66_7
				}
				local var_66_9 = {
					file = CSV.bundleIDs.file,
					cols = CSV.bundleIDs.cols
				}
				local var_66_10 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, iter_66_3)
				local var_66_11 = CSV.ReadRow(var_66_9, var_66_10)

				var_66_8.name = var_66_11.name
				var_66_8.image = var_66_11.image
				var_66_8.description = var_66_11.description
				var_66_8.rarity = var_66_11.rarity
				var_66_8.bundleType = var_66_11.bundleType
				var_66_8.titleImage = var_66_11.titleImage
				var_66_8.currencyID = tonumber(var_66_11.currencyID)
				var_66_8.currencyAmount = tonumber(var_66_11.currencyAmount)
				var_66_8.itemIndex = iter_66_2
				var_66_8.owned = false
				var_66_8.isFirstParty = false
				var_66_8.openedFromPopup = true

				table.insert(var_66_0, var_66_8)

				if var_66_1 <= #var_66_0 then
					return var_66_0
				end
			end
		end
	end

	return var_66_0
end

function STORE.OpenBundleUpsellPopup(arg_67_0)
	if Dvar.IBEGCHEFE("MMOOMQPMTP") then
		local var_67_0 = STORE.GetUpsellBundleList(arg_67_0)

		if #var_67_0 > 0 then
			LUI.FlowManager.RequestPopupMenu(nil, "BundlePurchaseUpsellPopup", true, arg_67_0, false, {
				items = var_67_0
			})
		end
	end
end

function STORE.BundleContainsBattlePass(arg_68_0)
	arg_68_0 = tonumber(arg_68_0)

	if not arg_68_0 then
		return false
	end

	local var_68_0 = LOOT.GetBundleItemsMappedByType(arg_68_0)[LOOT.itemTypes.BATTLE_PASS]

	if var_68_0 then
		for iter_68_0 = 1, #var_68_0 do
			local var_68_1 = var_68_0[iter_68_0]
			local var_68_2 = LOOT.GetItemRef(LOOT.itemTypes.BATTLE_PASS, var_68_1)
			local var_68_3 = tonumber(BATTLEPASS.GetItemType(var_68_2))

			if var_68_3 == BATTLEPASS.ItemTypes.PREMIUM or var_68_3 == BATTLEPASS.ItemTypes.BUNDLE then
				return true
			end
		end
	end

	return false
end

function STORE.AddItemsInBundleToTable(arg_69_0, arg_69_1, arg_69_2, arg_69_3)
	arg_69_3 = arg_69_3 or {}

	local var_69_0 = {
		file = CSV.bundleIDs.file,
		cols = CSV.bundleIDs.cols
	}
	local var_69_1 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_69_1)
	local var_69_2 = CSV.ReadRow(var_69_0, var_69_1)

	for iter_69_0 = 1, CSV.bundleIDs.maxItems do
		local var_69_3 = tonumber(var_69_2["item" .. iter_69_0])

		if not var_69_3 then
			break
		end

		if not arg_69_3.itemType or arg_69_3.itemType == LOOT.GetTypeForID(var_69_3) then
			local var_69_4 = {
				lootID = var_69_3,
				bundleID = arg_69_1
			}

			if arg_69_3.byRef then
				arg_69_2[LOOT.GetItemRef(arg_69_3.itemType, var_69_3)] = var_69_4
			else
				arg_69_2[var_69_3] = var_69_4
			end
		end
	end
end

function STORE.GetAllItemsInStore(arg_70_0, arg_70_1)
	assert(arg_70_0)

	arg_70_1 = arg_70_1 or {}
	arg_70_1.AddItemsFunction = arg_70_1.AddItemsFunction or STORE.AddItemsInBundleToTable

	local var_70_0 = arg_70_1.itemsTable or {}
	local var_70_1 = Store.DBFHBBIDHD()
	local var_70_2 = Engine.DBFHBBIDHD(var_70_1)

	for iter_70_0, iter_70_1 in ipairs(var_70_2) do
		iter_70_1.items = iter_70_1.items or {}

		local var_70_3 = iter_70_1.items and iter_70_1.items[1] or {}

		if not var_70_3.emptyCategory and iter_70_1.idPubVar and var_70_3.layoutOnlyItem then
			local var_70_4 = Dvar.DHEEJCCJBH(iter_70_1.idPubVar) or ""

			if iter_70_1.justForYou then
				local var_70_5 = STORE.CheckForPersonalRecommendations(arg_70_0)

				if var_70_5 then
					var_70_4 = STORE.FormatRecommendationItems(var_70_5 .. "," .. var_70_4)
				end
			end

			local var_70_6 = split(var_70_4, ",")

			for iter_70_2 = 1, #var_70_6 do
				local var_70_7 = tonumber(var_70_6[iter_70_2])
				local var_70_8 = STORE.IsFirstPartyBundle(var_70_7)

				if STORE.BundleAvailable(arg_70_0, var_70_7) and not var_70_8 then
					arg_70_1.AddItemsFunction(arg_70_0, var_70_7, var_70_0, arg_70_1)
				end
			end
		end
	end

	return var_70_0
end
