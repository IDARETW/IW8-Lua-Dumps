STORE = STORE or {}
STORE.CODPointsCategory = "codpoints"
STORE.WZCODPointsCategory = "wzcodpoints"
STORE.TitlesCategory = "titles"
STORE.ZeusCategory = "zeus"
STORE.VanguardCategory = "vanguard"
STORE.CortezCategory = "cortez"
STORE.GameDLCCategory = "dlc"
STORE.CDLCategory = "CDL"
STORE.MiscCategory = "misc"
STORE.DATA_PACK_1_NAME = "dlc_dp1"
STORE.DATA_PACK_2_NAME = "dlc_dp2"
STORE.OPTIONAL_PACK_1_NAME = "dlc_optional1"
STORE.maxButtonsPerCategoryRow = 4
STORE.GameUpsellStandardID = "title_standard"
STORE.GameUpsellStandardIDSIEE = "title_standard_siee"
STORE.GameUpsellEnhancedID = "title_battlepass"
STORE.JustForYouCommsLocation = 14
STORE.GameUpsellIDs = {
	[STORE.GameUpsellStandardID] = 1,
	[STORE.GameUpsellStandardIDSIEE] = 2,
	[STORE.GameUpsellEnhancedID] = 3
}
STORE.ZeusTrialID = "title_zeus_trial"
STORE.ZeusTrialZMID = "title_zeus_trial_zm"
STORE.ZeusTrialEventID = "title_zeus_trial_event"
STORE.ZeusStandardID = "title_zeus_standard"
STORE.ZeusCrossGenID = "title_zeus_cross_gen"
STORE.ZeusUltimateID = "title_zeus_ultimate"
STORE.ZeusUltimateUpgradeID = "title_zeus_upgrade_standard_to_ultimate"
STORE.ZeusProductIDs = {
	[STORE.ZeusStandardID] = 1,
	[STORE.ZeusCrossGenID] = 2,
	[STORE.ZeusUltimateID] = 3
}
STORE.ZeusTrialProductIDs = {
	[STORE.ZeusTrialID] = 1,
	[STORE.ZeusTrialZMID] = 2,
	[STORE.ZeusTrialEventID] = 3
}
STORE.ZeusCategoryID = "zeus_preorder"
STORE.X2CategoryID = "x2_preorder"
STORE.CortezCategoryID = "cortez_preorder"
STORE.VanguardStandardID = "title_vanguard_standard"
STORE.VanguardCrossGenID = "title_vanguard_crossgen"
STORE.VanguardUltimateID = "title_vanguard_ultimate"
STORE.VanguardUpgradeToUltimateID = "title_vanguard_upgrade_standard_to_ultimate"
STORE.VanguardTrialID = "title_vanguard_trial"
STORE.VanguardProductIDs = {
	[STORE.VanguardStandardID] = 1,
	[STORE.VanguardCrossGenID] = 2,
	[STORE.VanguardUltimateID] = 3,
	[STORE.VanguardUpgradeToUltimateID] = 4,
	[STORE.VanguardTrialID] = 5
}
STORE.CortezEntryPointMenu = {
	FranchiseStore = "franchise store",
	FirstPartyBundle = "first party bundle",
	InGameStore = "in-game store",
	MainMenuBlades = "main menu blades"
}
STORE.CortezProductID = "franchise_mw2r"
STORE.CortezStandardID = "title_cortez_standard"
STORE.CortezAltID = "title_cortez_crossgen"
STORE.CortezVaultID = "title_cortez_ultimate"
STORE.CortezUpgradeToUltimateID = "title_cortez_upgrade_standard_to_ultimate"
STORE.CortezWarzone2ID = "title_cortez_wz2"
STORE.CortezProductIDs = {
	[STORE.CortezStandardID] = 1,
	[STORE.CortezAltID] = 2,
	[STORE.CortezVaultID] = 3,
	[STORE.CortezUpgradeToUltimateID] = 4,
	[STORE.CortezWarzone2ID] = 5
}
STORE.CODEID = "codepack"
STORE.CODE2ID = "codepack2"
STORE.CODE3ID = "codepack3"
STORE.HeadStartID = "headstartpack"
STORE.HeadStart7ID = "headstartpack7"
STORE.ProPackS02ID = "pro_pack_s02"
STORE.ProPackS04ID = "pro_pack_s04"
STORE.EliteProPack = "elite_pro_pack"
STORE.BundleIDBattlePass = 400049
STORE.BundleIDBattlePassBundle = 400050
STORE.KoreanTermsOfUseURL = "https://support.activision.com/servlet/servlet.FileDownload?retURL=%2Fapex%2Flicense&file=00P4P00001Ku2BoUAJ"
STORE.KoreanRefundPolicyURL = "https://support.activision.com/articles/ko/FAQ/Call-of-Duty-Modern-Warfare-Purchases"
STORE.ItemSaleIdOffset = 40000
STORE.SmartBundleIdOffset = 60000
STORE.PS4DLCOffset = 0
STORE.XB3DLCOffset = 1000
STORE.PCDLCOffset = 2000
STORE.TomogunchiCharmCollection = 400437
STORE.LimitedTimeWarningThreshold = 86400
STORE.ProductNoLongerAvailableError = 8003
STORE.SeasonTimestampMapping = {
	SEASON0_END = "1575396000",
	SEASON6_END = "1605636000",
	SEASON4_END = "1596607200",
	SEASON3_END = "1591855200",
	SEASON1_END = "1581444000",
	SEASON5_END = "1601359200",
	SEASON2_END = "1586325600"
}
STORE.CategoryType = {
	weapon = 4,
	cortez_preorder = 12,
	temp_category_2 = 7,
	operator = 3,
	just_for_you = 1,
	temp_category_5 = 10,
	featured = 2,
	franchise_store = 5,
	x2_preorder = 11,
	temp_category_3 = 8,
	zeus_preorder = 6,
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
	codpoints5000 = 1000,
	codpoints1100 = 100,
	wzcodpoints2400 = 400,
	wzcodpoints21000 = 6000,
	wzcodpoints200 = 0,
	wzcodpoints500 = 0,
	codpoints2400 = 400,
	wzcodpoints13000 = 3000,
	wzcodpoints1100 = 100,
	wzcodpoints9500 = 2000,
	codpoints13000 = 3000,
	wzcodpoints5000 = 1000,
	codpoints9500 = 2000,
	codpoints500 = 0,
	codpoints200 = 0
}
STORE.CODPointBonusPercentage = {
	codpoints5000 = 25,
	codpoints1100 = 10,
	wzcodpoints2400 = 20,
	wzcodpoints21000 = 40,
	wzcodpoints200 = 0,
	wzcodpoints500 = 0,
	codpoints2400 = 20,
	wzcodpoints13000 = 30,
	wzcodpoints1100 = 10,
	wzcodpoints9500 = 26,
	codpoints13000 = 30,
	wzcodpoints5000 = 25,
	codpoints9500 = 26,
	codpoints500 = 0,
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
STORE.ZeusTitleIDs = {
	ZEUS_STANDARD = 340057,
	ZEUS_ULTIMATE = 340058
}
STORE.VGPreOrderMastercraftRewardIDs = {
	Beta_Active = {
		PS = 18405251,
		PC = 29333943,
		XB = 27781229
	},
	Post_Beta = {
		PS = 18405251,
		PC = 29333943,
		XB = 27781229
	}
}
STORE.SENTINEL_ID_START = 33704432
STORE.SENTINEL_ID_END = 33724431

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
			message = Engine.EAABDHIDFJ() and Engine.CBBHFCGDIC("MSSTORE_PLATFORM/MPNOTALLOWED") or Engine.CBBHFCGDIC("XBOXLIVE/MPNOTALLOWED")
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
		InGameStore.FetchCatalog(arg_2_0, true, true)

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
			local var_4_0 = Store.DAEDJJBGDB(STORE.JustForYouCommsLocation)
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

			if not STORE.IsBundleOwned(arg_3_0, var_5_2) then
				table.insert(var_5_1, var_5_0[iter_5_0])
			end
		end

		return var_5_1
	end

	local function var_3_2(arg_6_0)
		local var_6_0 = {}
		local var_6_1 = Dvar.BJJCJHDBII("OMTLRQOPLK")
		local var_6_2 = Engine.DDHICDBBDI().day

		math.randomseed(var_6_2)

		for iter_6_0 = 1, #arg_6_0 do
			if var_6_1 < math.random() then
				table.insert(var_6_0, arg_6_0[iter_6_0])
			end
		end

		return var_6_0
	end

	local var_3_3 = Store.JGBAJAECG(STORE.JustForYouCommsLocation)
	local var_3_4 = {}

	if var_3_3 and #var_3_3 > 1 then
		local var_3_5

		if not CONDITIONS.IsMagmaGameMode() then
			var_3_5 = Dvar.DHEEJCCJBH("MOLOQRLLQK") or ""
		else
			var_3_5 = Dvar.DHEEJCCJBH("LSLPPRMTLR") or ""
		end

		local var_3_6 = split(var_3_5, ",")
		local var_3_7 = var_3_2(var_3_6)
		local var_3_8 = table.concat(var_3_7, ",") .. "," .. var_3_3

		var_3_4 = split(var_3_8, ",")
		var_3_4 = var_3_0(var_3_4)
		var_3_4 = STORE.TrimRecommendationsByBlacklistedItems(var_3_4)
		var_3_4 = var_3_1(var_3_4)
	end

	if var_3_4 and #var_3_4 > 0 then
		return table.concat(var_3_4, ",")
	end
end

function STORE.TrimRecommendationsByBlacklistedItems(arg_7_0)
	local var_7_0

	if not CONDITIONS.IsMagmaGameMode() then
		var_7_0 = Dvar.DHEEJCCJBH("ROTRKSQNT") or ""
	else
		var_7_0 = Dvar.DHEEJCCJBH("LQNLSMLQTS") or ""
	end

	local var_7_1 = split(var_7_0, ",")
	local var_7_2 = {}

	if var_7_1 and #var_7_1 > 0 then
		for iter_7_0 = 1, #var_7_1 do
			local var_7_3 = var_7_1[iter_7_0]

			var_7_2[var_7_3] = var_7_3
		end

		local var_7_4 = arg_7_0
		local var_7_5 = {}

		for iter_7_1 = 1, #var_7_4 do
			local var_7_6 = var_7_4[iter_7_1]

			if not var_7_2[var_7_6] then
				table.insert(var_7_5, var_7_6)
			end
		end

		return var_7_5
	else
		return arg_7_0
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

function STORE.GetSaleBundleID(arg_16_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_16_0, CSV.bundleIDs.cols.saleID))
end

function STORE.GetBundlePurchaseID(arg_17_0, arg_17_1)
	local var_17_0 = STORE.GetSmartBundleID(arg_17_1)

	if STORE.IsItemOnSale(arg_17_1, arg_17_0) then
		return STORE.GetSaleBundleID(arg_17_1)
	elseif var_17_0 and Loot.DEBEIFJEEG(arg_17_0, var_17_0) > 0 then
		return arg_17_1 + STORE.SmartBundleIdOffset
	end

	return arg_17_1
end

function STORE.GetBundleCost(arg_18_0, arg_18_1)
	local var_18_0 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_18_1, CSV.bundleIDs.cols.currencyAmount))
	local var_18_1
	local var_18_2 = STORE.GetSmartBundleID(arg_18_1)

	if STORE.IsItemOnSale(arg_18_1, arg_18_0) then
		var_18_1 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_18_1, CSV.bundleIDs.cols.saleCurrencyAmount))
	elseif var_18_2 and Loot.DEBEIFJEEG(arg_18_0, var_18_2) > 0 then
		var_18_1 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_18_1, CSV.bundleIDs.cols.smartCost))
	end

	return var_18_0, var_18_1
end

function STORE.CategoryHasNewItems(arg_19_0, arg_19_1)
	assert(arg_19_0)
	assert(arg_19_1)

	arg_19_1.items = arg_19_1.items or {}

	local var_19_0 = arg_19_1.items and arg_19_1.items[1] or {}

	if var_19_0.emptyCategory then
		return false
	end

	if arg_19_1.idPubVar and var_19_0.layoutOnlyItem then
		local var_19_1 = STORE.GetCategoryItemIDs(arg_19_0, arg_19_1)
		local var_19_2 = 0

		for iter_19_0 = 1, #var_19_1 do
			local var_19_3 = var_19_1[iter_19_0]

			if STORE.BundleAvailable(arg_19_0, var_19_3) then
				var_19_2 = var_19_2 + 1

				if not STORE.HasSeenItem(arg_19_0, var_19_3) then
					return true
				end
			end

			if var_19_2 == arg_19_1.numItemsShown then
				break
			end
		end
	end

	return false
end

function STORE.CategoryHasLimitedTimeItems(arg_20_0, arg_20_1)
	assert(arg_20_0)
	assert(arg_20_1)

	arg_20_1.items = arg_20_1.items or {}

	local var_20_0 = arg_20_1.items and arg_20_1.items[1] or {}

	if var_20_0.emptyCategory then
		return nil
	end

	if arg_20_1.idPubVar and var_20_0.layoutOnlyItem then
		local var_20_1 = STORE.GetCategoryItemIDs(arg_20_0, arg_20_1)
		local var_20_2 = 0

		for iter_20_0 = 1, #var_20_1 do
			local var_20_3 = var_20_1[iter_20_0]

			if STORE.BundleAvailable(arg_20_0, var_20_3) then
				local var_20_4 = {
					file = CSV.bundleIDs.file,
					cols = CSV.bundleIDs.cols
				}
				local var_20_5 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_20_1[iter_20_0])
				local var_20_6 = CSV.ReadRow(var_20_4, var_20_5)
				local var_20_7 = Dvar.IBEGCHEFE("NPQPKPKRTL")

				if var_20_6.isBattlePassBundle ~= "1" and var_20_7 then
					local var_20_8 = var_20_6.purchaseEnd ~= "" and var_20_6.purchaseEnd or STORE.IsItemOnSale(var_20_3) and STORE.GetSaleTimer() ~= "" and STORE.GetSaleTimer() or nil

					if var_20_8 and STORE.SeasonTimestampMapping[var_20_8] then
						var_20_8 = STORE.SeasonTimestampMapping[var_20_8]
					end

					if var_20_3 == tonumber(BATTLEPASS.GetTierSkipGiftID()) and BATTLEPASS.IsTierSkipGiftActive(arg_20_0) then
						var_20_8 = BATTLEPASS.GetTierSkipGiftTimer()
					end

					local var_20_9, var_20_10, var_20_11 = STORE.GetCategoryTimeLeft(nil, var_20_8)

					if not var_20_8 then
						var_20_2 = var_20_2 + 1
					elseif var_20_9 > 0 then
						return var_20_8
					end
				end
			end

			if var_20_2 == arg_20_1.numItemsShown then
				break
			end
		end
	end

	return nil
end

function STORE.HasNewAndFreeAndLimitedTimeItems(arg_21_0)
	assert(arg_21_0)

	local var_21_0 = STORE.GetCategoryData(arg_21_0)
	local var_21_1 = false
	local var_21_2 = false
	local var_21_3

	if var_21_0 == nil then
		return var_21_1, var_21_2, limmitedTimeItem
	end

	for iter_21_0 = 1, #var_21_0 do
		local var_21_4 = var_21_0[iter_21_0]

		if var_21_4 then
			var_21_4.items = var_21_4.items or {}

			local var_21_5 = STORE.CategoryHasNewItems(arg_21_0, var_21_4) or false
			local var_21_6 = STORE.CategoryHasFreeItems(arg_21_0, var_21_4) or false

			var_21_3 = var_21_3 or STORE.CategoryHasLimitedTimeItems(arg_21_0, var_21_4)

			if var_21_5 then
				var_21_1 = true
			end

			if var_21_6 then
				var_21_2 = true
			end

			if var_21_1 and var_21_2 and var_21_3 then
				break
			end
		end
	end

	return var_21_1, var_21_2, var_21_3
end

function STORE.HasFreeItems(arg_22_0)
	assert(arg_22_0)

	local var_22_0 = STORE.GetCategoryData(arg_22_0)

	if var_22_0 == nil then
		return false
	end

	for iter_22_0 = 1, #var_22_0 do
		local var_22_1 = var_22_0[iter_22_0]

		var_22_1.items = var_22_1.items or {}

		if STORE.CategoryHasFreeItems(arg_22_0, var_22_1) then
			return true
		end
	end

	return false
end

function STORE.CategoryHasFreeItems(arg_23_0, arg_23_1)
	assert(arg_23_0)
	assert(arg_23_1)

	arg_23_1.items = arg_23_1.items or {}

	local var_23_0 = arg_23_1.items and arg_23_1.items[1] or {}

	if var_23_0.emptyCategory then
		return false
	end

	if arg_23_1.idPubVar and var_23_0.layoutOnlyItem then
		local var_23_1 = STORE.GetCategoryItemIDs(arg_23_0, arg_23_1)
		local var_23_2 = 0

		for iter_23_0 = 1, #var_23_1 do
			local var_23_3 = var_23_1[iter_23_0]

			if STORE.BundleAvailable(arg_23_0, var_23_3) then
				var_23_2 = var_23_2 + 1

				if tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_23_3, CSV.bundleIDs.cols.currencyAmount)) == 0 then
					return true
				elseif STORE.IsItemOnSale(var_23_3, arg_23_0) and tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_23_3, CSV.bundleIDs.cols.saleCurrencyAmount)) == 0 then
					return true
				end
			end

			if var_23_2 == arg_23_1.numItemsShown then
				break
			end
		end
	end

	return false
end

function STORE.HasNewItems(arg_24_0)
	assert(arg_24_0)

	local var_24_0 = STORE.GetCategoryData(arg_24_0)

	if var_24_0 == nil then
		return false
	end

	for iter_24_0 = 1, #var_24_0 do
		local var_24_1 = var_24_0[iter_24_0]

		var_24_1.items = var_24_1.items or {}

		if STORE.CategoryHasNewItems(arg_24_0, var_24_1) then
			return true
		end
	end

	return false
end

function STORE.SetupGameExclusiveStatusOfBundle(arg_25_0, arg_25_1)
	arg_25_1.doesBundleHave1ExclusiveItem = false
	arg_25_1.bundleExclusivity = LOOT.itemSourceExclusivity.NONE

	for iter_25_0 = 1, #arg_25_0 do
		local var_25_0 = tonumber(arg_25_0[iter_25_0])

		if not (#StringTable.DIFCHIGDFB(CSV.snipeIgnoreIDs.file, CSV.snipeIgnoreIDs.cols.id, var_25_0, CSV.snipeIgnoreIDs.cols.ref) > 0) then
			local var_25_1 = LOOT.GetGameSourceExclusivityByItemID(var_25_0)

			if var_25_1 ~= LOOT.itemSourceExclusivity.NONE then
				if LOOT.IsItemSourceExclusive(var_25_1) then
					if arg_25_1.bundleExclusivity == LOOT.itemSourceExclusivity.NONE or LOOT.IsItemSubExclusivity(var_25_1, arg_25_1.bundleExclusivity) then
						arg_25_1.bundleExclusivity = var_25_1
					end

					arg_25_1.doesBundleHave1ExclusiveItem = true
				else
					arg_25_1.bundleExclusivity = var_25_1
				end
			end
		end
	end
end

function STORE.GetCategoryIndex(arg_26_0, arg_26_1)
	assert(arg_26_0)

	local var_26_0 = STORE.GetCategoryData(arg_26_0)

	if var_26_0 == nil then
		return nil
	end

	for iter_26_0 = 1, #var_26_0 do
		local var_26_1 = var_26_0[iter_26_0]

		if var_26_1.id and #var_26_1.id > 0 and (var_26_1.id == arg_26_1 or arg_26_1 == "") then
			return iter_26_0
		end
	end
end

function STORE.GetIndexForBundle(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_2 then
		arg_27_2 = STORE.GetCategoryData(arg_27_1)

		if arg_27_2 == nil then
			return nil
		end
	end

	for iter_27_0 = 1, #arg_27_2 do
		local var_27_0 = arg_27_2[iter_27_0]

		assert(var_27_0, "categoryData is nil at categoryIndex " .. iter_27_0 .. " in STORE.GetIndexForBundle()")

		if var_27_0 and var_27_0.idPubVar then
			local var_27_1 = STORE.GetCategoryItemIDs(arg_27_1, var_27_0)
			local var_27_2 = 0

			for iter_27_1 = 1, #var_27_1 do
				local var_27_3 = var_27_1[iter_27_1]

				if STORE.BundleAvailable(arg_27_1, var_27_3) then
					var_27_2 = var_27_2 + 1

					if var_27_3 == tonumber(arg_27_0) then
						return iter_27_0, var_27_2
					end
				end

				if var_27_2 == var_27_0.numItemsShown then
					break
				end
			end
		end
	end
end

function STORE.GetDLCID(arg_28_0)
	local var_28_0 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_28_0, CSV.bundleIDs.cols.dlcRef)

	if #var_28_0 == 0 then
		return
	end

	local var_28_1 = tonumber(StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.name, var_28_0, CSV.dlcIDs.cols.id))

	if not var_28_1 then
		return
	end

	if CONDITIONS.IsPS4() then
		return var_28_1 + STORE.PS4DLCOffset
	elseif CONDITIONS.IsXboxOne() then
		return var_28_1 + STORE.XB3DLCOffset
	elseif CONDITIONS.IsPC() then
		return var_28_1 + STORE.PCDLCOffset
	end
end

function STORE.GetNumItemsInBundle(arg_29_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_29_0, CSV.bundleIDs.cols.numItems))
end

function STORE.StripPlatformSuffix(arg_30_0)
	if arg_30_0:sub(-3) == "_pc" then
		arg_30_0 = arg_30_0:sub(1, -4)
	elseif arg_30_0:sub(-4) == "_ps4" then
		arg_30_0 = arg_30_0:sub(1, -5)
	elseif arg_30_0:sub(-4) == "_xb3" then
		arg_30_0 = arg_30_0:sub(1, -5)
	elseif arg_30_0:sub(-4) == "_bnet" then
		arg_30_0 = arg_30_0:sub(1, -5)
	elseif arg_30_0:sub(-4) == "_psn" then
		arg_30_0 = arg_30_0:sub(1, -5)
	elseif arg_30_0:sub(-4) == "_xbl" then
		arg_30_0 = arg_30_0:sub(1, -5)
	end

	return arg_30_0
end

function STORE.GetFirstPartyBundleData(arg_31_0, arg_31_1, arg_31_2)
	if not arg_31_1 or not arg_31_2 then
		assert(arg_31_1)
		assert(arg_31_2)

		return
	end

	if not STORE.IsCatalogReady(arg_31_0) then
		assert(false, "Catalog has not been fetched.")

		return
	end

	local var_31_0 = InGameStore.GetProduct(arg_31_0, arg_31_2)

	if not var_31_0 then
		arg_31_2 = STORE.StripPlatformSuffix(arg_31_2)
		var_31_0 = InGameStore.GetProduct(arg_31_0, arg_31_2)

		if not var_31_0 then
			if not Dvar.IBEGCHEFE("LMKNLPNKTM") then
				assert(var_31_0, "No data found for product ID, " .. arg_31_2)
			end

			return
		end
	end

	local function var_31_1()
		LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangeFencePopup", true, arg_31_0, false, {
			controllerIndex = arg_31_0,
			message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASING_DLC")
		})
		InGameStore.SelectProduct(arg_31_0, arg_31_2, InGameStorePurchaseType.BROWSE)
	end

	return {
		isFirstParty = true,
		bundleID = tonumber(arg_31_1),
		price = var_31_0.price,
		owned = var_31_0.status ~= InGameStoreProductStatus.NOT_OWNED,
		firstPartyPurchase = var_31_1
	}
end

function STORE.GetFirstPartyProductID(arg_33_0)
	local var_33_0 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_0, CSV.bundleIDs.cols.firstPartyProductID)

	if (var_33_0:sub(-3) == "_pc" or var_33_0:sub(-4) == "_bnet") and not Engine.CGABICJHAI() then
		return
	elseif (var_33_0:sub(-4) == "_ps4" or var_33_0:sub(-4) == "_psn") and not Engine.CIEGIACHAE() then
		return
	elseif (var_33_0:sub(-4) == "_xb3" or var_33_0:sub(-4) == "_xbl") and not Engine.BAHIIBFDDG() then
		return
	end

	return (STORE.StripPlatformSuffix(var_33_0))
end

function STORE.IsFirstPartyBundle(arg_34_0)
	assert(arg_34_0)

	if not arg_34_0 then
		return
	end

	local var_34_0 = STORE.GetFirstPartyProductID(arg_34_0)

	return var_34_0 and #var_34_0 > 0
end

function STORE.IsGameUpsellBundle(arg_35_0)
	assert(arg_35_0)

	if not arg_35_0 then
		return
	end

	local var_35_0 = STORE.GetFirstPartyProductID(arg_35_0)

	return var_35_0 == STORE.GameUpsellStandardID or var_35_0 == STORE.GameUpsellStandardIDSIEE or var_35_0 == STORE.GameUpsellEnhancedID
end

function STORE.IsZeusBundle(arg_36_0)
	assert(arg_36_0)

	if not arg_36_0 then
		return
	end

	local var_36_0 = STORE.GetFirstPartyProductID(arg_36_0)

	return var_36_0 == STORE.ZeusStandardID or var_36_0 == STORE.ZeusCrossGenID or var_36_0 == STORE.ZeusUltimateID
end

function STORE.IsBundleOwned(arg_37_0, arg_37_1)
	if StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_37_1, CSV.bundleIDs.cols.game) == "s4" then
		local var_37_0
		local var_37_1 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_37_1, CSV.bundleIDs.cols.numHiddenItems)
		local var_37_2 = tonumber(var_37_1)

		if var_37_2 then
			for iter_37_0 = 0, var_37_2 - 1 do
				local var_37_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_37_1, CSV.bundleIDs.cols.hiddenItem1 + iter_37_0)
				local var_37_4 = tonumber(var_37_3)

				if var_37_4 and var_37_4 >= STORE.SENTINEL_ID_START and var_37_4 <= STORE.SENTINEL_ID_END then
					var_37_0 = var_37_4

					break
				end
			end
		end

		if var_37_0 and Loot.DEBEIFJEEG(arg_37_0, var_37_0) > 0 then
			return true
		end
	elseif Loot.DEBEIFJEEG(arg_37_0, arg_37_1) > 0 then
		return true
	end

	return false
end

function STORE.BundleAvailable(arg_38_0, arg_38_1)
	arg_38_1 = tonumber(arg_38_1)

	if not arg_38_1 then
		return false
	end

	if Dvar.IBEGCHEFE("LMKNLPNKTM") then
		return true
	end

	if STORE.IsBundleBlacklisted(arg_38_1) then
		return false
	end

	if STORE.IsGameUpsellBundle(arg_38_1) then
		return not Engine.CFHBIHABCB(arg_38_0)
	end

	if STORE.IsBundleOwned(arg_38_0, arg_38_1) then
		return false
	end

	local var_38_0 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_38_1, CSV.bundleIDs.cols.oldBundleOwnershipID)

	if var_38_0 and #var_38_0 > 0 and Loot.DEBEIFJEEG(arg_38_0, tonumber(var_38_0)) then
		return false
	end

	local var_38_1 = STORE.GetFirstPartyProductID(arg_38_1)

	if var_38_1 == nil then
		return false
	end

	if var_38_1 and #var_38_1 > 0 then
		if STORE.IsCatalogReady(arg_38_0) then
			local var_38_2 = InGameStore.GetProduct(arg_38_0, var_38_1)

			if not var_38_2 or var_38_2.status ~= InGameStoreProductStatus.NOT_OWNED then
				return false
			end
		else
			return false
		end
	end

	local var_38_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_38_1, CSV.bundleIDs.cols.battlePassID)

	if #var_38_3 > 0 then
		local var_38_4 = tonumber(BATTLEPASS.GetTierFromID(arg_38_0, var_38_3))
		local var_38_5 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_38_1, CSV.bundleIDs.cols.minTierInclude))
		local var_38_6 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_38_1, CSV.bundleIDs.cols.maxTierInclude))

		if var_38_4 < var_38_5 or var_38_6 < var_38_4 then
			return false
		end
	end

	if StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_38_1, CSV.bundleIDs.cols.isBattlePassBundle) == "1" then
		local var_38_7 = tonumber(BATTLEPASS.GetTierSkipGiftID())
		local var_38_8 = BATTLEPASS.IsOwned(arg_38_0)
		local var_38_9, var_38_10 = BATTLEPASS.IsPendingTransactions(arg_38_0)
		local var_38_11 = LOOT.GetBundleItemsMappedByType(arg_38_1)[LOOT.itemTypes.BATTLE_PASS]
		local var_38_12 = 0
		local var_38_13 = false

		if arg_38_1 == var_38_7 and not BATTLEPASS.IsTierSkipGiftActive(arg_38_0) then
			return false
		end

		if var_38_11 then
			for iter_38_0 = 1, #var_38_11 do
				local var_38_14 = var_38_11[iter_38_0]
				local var_38_15 = LOOT.GetItemRef(LOOT.itemTypes.BATTLE_PASS, var_38_14)
				local var_38_16 = tonumber(BATTLEPASS.GetItemType(var_38_15))

				if var_38_16 == BATTLEPASS.ItemTypes.PREMIUM or var_38_16 == BATTLEPASS.ItemTypes.BUNDLE then
					var_38_13 = true

					if var_38_8 or var_38_9 then
						return false
					end
				end

				if var_38_16 == BATTLEPASS.ItemTypes.TIER_SKIP or var_38_16 == BATTLEPASS.ItemTypes.BUNDLE then
					var_38_12 = var_38_12 + BATTLEPASS.GetNumSkipsInBundle(var_38_15)
				end
			end
		end

		if not var_38_8 and not var_38_13 then
			return false
		end
	end

	return true
end

function STORE.PreviewReward(arg_39_0, arg_39_1, arg_39_2)
	if not arg_39_2 or type(arg_39_2) ~= "table" or not arg_39_2.previewData or not arg_39_2.previewIndex then
		assert(false, "You must provide a table of options containing the preview data and the preview index.")
	end

	local var_39_0 = arg_39_2.previewData

	if STORE.PreviewSupported(var_39_0.type) then
		if arg_39_0 then
			local var_39_1 = LUI.FlowManager.GetScopedData(arg_39_0)

			if var_39_1 then
				var_39_1.focussedMissionIndex = arg_39_2.previewIndex
			end
		end

		STORE.PreviewItem(arg_39_1, var_39_0.type, var_39_0.itemID)

		if arg_39_2.playDefaultSound then
			Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
		end
	end
end

function STORE.GoToStore(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4)
	local var_40_0

	if arg_40_3 then
		var_40_0 = {
			defaultItem = arg_40_3,
			andPurchase = arg_40_4
		}
	end

	STORE.EnterStore(arg_40_0, arg_40_1, arg_40_2, var_40_0, STORE.GetStoreMenu(false), false)
end

function STORE.GoToStoreFromMainMenu(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = {
		fromMainMenu = true
	}

	STORE.EnterStore(arg_41_0, arg_41_1, arg_41_2, var_41_0, STORE.GetStoreMenu(true), false)
end

function STORE.GoToCODPointsOnlyStore(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = {
		onlyCODPoints = true
	}

	STORE.EnterStore(arg_42_0, arg_42_1, arg_42_2, var_42_0, STORE.GetStoreMenu(false), false)
end

function STORE.GetStoreDescription()
	return CONDITIONS.AreCODPointsEnabled() and Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC") or Engine.CBBHFCGDIC("LUA_MENU/STORE_DESC_NO_COD_POINTS")
end

function STORE.GetBundleFeatureText(arg_44_0)
	return StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_44_0, CSV.bundleIDs.cols.featureText)
end

function STORE.GetBundleDescription(arg_45_0, arg_45_1)
	local var_45_0
	local var_45_1 = false
	local var_45_2

	if CONDITIONS.IsLateGrindersEnabled() then
		var_45_1 = arg_45_1 >= BATTLEPASS.START_TO_SHOW_COD_POINTS

		if var_45_1 then
			var_45_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_45_0, CSV.bundleIDs.cols.isBattlePassBundle)
		end
	end

	if var_45_1 and var_45_2 and STORE.BundleContainsBattlePass(arg_45_0) then
		local var_45_3 = SEASON.GetCurrentSeasonDataNum()

		var_45_0 = Engine.CBBHFCGDIC("BATTLEPASS/LATE_GRINDER_DESCRIPTION", SEASON.GetLocalizedName({
			seasonDataNumToUse = var_45_3
		}), SEASON.GetLocalizedName({
			seasonDataNumToUse = var_45_3 + 1
		}))
	else
		local var_45_4 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_45_0, CSV.bundleIDs.cols.description)

		var_45_0 = Engine.CBBHFCGDIC(var_45_4)
	end

	if not Engine.CIDEADAABH() and STORE.BundleContainsDismemberment(arg_45_0) then
		var_45_0 = var_45_0 .. " " .. Engine.CBBHFCGDIC("LUA_MENU/DISMEMBERMENT_REGION_LOCK_WARNING")
	end

	if STORE.BundleContainsDismembermentGesture(arg_45_0) then
		var_45_0 = var_45_0 .. " " .. Engine.CBBHFCGDIC("LUA_MENU/DISMEMBERMENT_GESTURE_REGION_LOCK_WARNING")
	end

	return var_45_0
end

function STORE.BundleContainsDismemberment(arg_46_0)
	local var_46_0 = LOOT.GetBundleItemsMappedByType(arg_46_0)[LOOT.itemTypes.WEAPON]

	if var_46_0 and #var_46_0 > 0 then
		for iter_46_0 = 1, #var_46_0 do
			local var_46_1 = var_46_0[iter_46_0]
			local var_46_2 = WEAPON.GenerateWeaponTableFromID(controllerIndex, var_46_1)

			if WEAPON.GetDismembermentType(var_46_2) then
				return true
			end
		end
	end

	return false
end

function STORE.BundleContainsDismembermentGesture(arg_47_0)
	local var_47_0 = LOOT.GetBundleItemsMappedByType(arg_47_0)[LOOT.itemTypes.GESTURES]

	if var_47_0 and #var_47_0 > 0 then
		for iter_47_0 = 1, #var_47_0 do
			local var_47_1 = var_47_0[iter_47_0]
			local var_47_2 = LOOT.GetItemRef(LOOT.itemTypes.GESTURES, var_47_1)

			if Engine.FABABBDBA() and var_47_2 and var_47_2 == "gesture049" then
				return true
			end
		end
	end

	return false
end

function STORE.GetCategoryTimeLeft(arg_48_0, arg_48_1)
	local var_48_0 = ""
	local var_48_1 = 0
	local var_48_2 = Engine.DEIDGHDBHD()

	if arg_48_1 and #arg_48_1 > 0 then
		var_48_2 = arg_48_1
	elseif arg_48_0 and #arg_48_0 > 0 then
		var_48_2 = Dvar.DHEEJCCJBH(arg_48_0)
	end

	local var_48_3 = tostring(var_48_2)

	if var_48_3 and #var_48_3 > 0 then
		var_48_1 = Engine.CCEJJCCDEG(var_48_3)

		if var_48_1 > 0 then
			local var_48_4 = math.floor(var_48_1 / 86400)
			local var_48_5 = math.floor(var_48_1 % 86400 / 3600)
			local var_48_6 = math.floor(var_48_1 % 3600 / 60)
			local var_48_7 = math.floor(var_48_1 % 60)

			var_48_0 = Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", var_48_4, var_48_5, var_48_6, var_48_7)
		else
			var_48_0 = Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", 0, 0, 0, 0)
		end
	end

	return var_48_1, var_48_0, var_48_3
end

function STORE.RunTimer(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4, arg_49_5, arg_49_6)
	assert(arg_49_0)

	if not arg_49_1 and not arg_49_4 then
		arg_49_0:Wait(1, true)
		arg_49_0:SetAlpha(0)

		return
	end

	arg_49_0:Wait(1000, true).onComplete = function()
		return STORE.RunTimer(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4, arg_49_5, arg_49_6)
	end

	local var_49_0, var_49_1, var_49_2 = STORE.GetCategoryTimeLeft(arg_49_1, arg_49_4)

	if not arg_49_0.timerValue and var_49_2 ~= "" then
		arg_49_0.timerValue = var_49_2
	end

	if arg_49_6 then
		arg_49_6(var_49_0)
	end

	if arg_49_2 then
		if not arg_49_3 or var_49_0 <= arg_49_3 then
			arg_49_0:SetAlpha(1)
		else
			arg_49_0:SetAlpha(0)
		end

		arg_49_2:setText(var_49_1)
	end

	if var_49_0 <= 0 and arg_49_5 then
		LUI.FlowManager.RequestLeaveMenu(arg_49_0)
	end
end

function STORE.IsOperatorPreviewWeaponBlacklisted(arg_51_0, arg_51_1, arg_51_2)
	assert(arg_51_0)
	assert(arg_51_1)
	assert(arg_51_2)

	if arg_51_1 ~= LOOT.itemTypes.OPERATOR and arg_51_1 ~= LOOT.itemTypes.OPERATOR_SKIN then
		return false
	end

	return StringTable.BJJBBCJGEJ(CSV.operatorPreviewWeaponBlacklist.file, CSV.operatorPreviewWeaponBlacklist.cols.ref, arg_51_2) ~= -1
end

function STORE.GetBundlePreviewWeapon(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	assert(arg_52_0)
	assert(arg_52_1)
	assert(arg_52_2)
	assert(arg_52_3)

	local var_52_0 = {}
	local var_52_1 = LOOT.GetBundleItemsMappedByType(arg_52_3)

	if arg_52_1 ~= LOOT.itemTypes.WEAPON and var_52_1[LOOT.itemTypes.WEAPON] ~= nil then
		for iter_52_0 = 1, #var_52_1[LOOT.itemTypes.WEAPON] do
			local var_52_2 = tonumber(var_52_1[LOOT.itemTypes.WEAPON][iter_52_0])

			if LOOT.GetItemRef(LOOT.itemTypes.WEAPON, var_52_2) == WEAPON.Wakizashi then
				local var_52_3 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, "iw8_sm_t9handling")

				var_52_1[LOOT.itemTypes.WEAPON][iter_52_0] = var_52_3
			end
		end
	end

	if arg_52_1 == LOOT.itemTypes.WEAPON then
		local var_52_4 = WEAPON.GenerateWeaponTableFromID(arg_52_0, arg_52_2)

		if var_52_4 then
			table.insert(var_52_0, var_52_4)
		else
			assert(false, "Unable to build weapon table for ID " .. arg_52_2)

			return
		end
	elseif var_52_1[LOOT.itemTypes.WEAPON] ~= nil then
		local var_52_5 = {}

		for iter_52_1 = 1, #var_52_1[LOOT.itemTypes.WEAPON] do
			local var_52_6 = tonumber(var_52_1[LOOT.itemTypes.WEAPON][iter_52_1])
			local var_52_7 = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, var_52_6)
			local var_52_8 = WEAPON.GetSlotFromRef(var_52_7)
			local var_52_9 = tonumber(LOOT.GetItemQualityWithID(LOOT.itemTypes.WEAPON, var_52_6)) or 0

			if not STORE.IsOperatorPreviewWeaponBlacklisted(arg_52_0, arg_52_1, var_52_7) then
				table.insert(var_52_5, {
					weaponID = var_52_6,
					slot = var_52_8,
					rarity = var_52_9
				})
			end
		end

		table.sort(var_52_5, function(arg_53_0, arg_53_1)
			if (arg_52_1 == LOOT.itemTypes.OPERATOR or arg_52_1 == LOOT.itemTypes.OPERATOR_SKIN) and arg_53_0.slot ~= arg_53_1.slot then
				return arg_53_0.slot < arg_53_1.slot
			end

			if arg_53_0.rarity ~= arg_53_1.rarity then
				return arg_53_0.rarity > arg_53_1.rarity
			end
		end)

		for iter_52_2 = 1, #var_52_5 do
			local var_52_10 = var_52_5[iter_52_2].weaponID
			local var_52_11 = WEAPON.GenerateWeaponTableFromID(arg_52_0, var_52_10)

			if var_52_11 then
				table.insert(var_52_0, var_52_11)
			end
		end
	end

	local var_52_12 = LOADOUT.GetFavoriteLoadoutIndex(arg_52_0) or 0
	local var_52_13 = LOADOUT.GetLoadoutPlayerData(arg_52_0, var_52_12)

	if var_52_13 then
		local var_52_14 = WEAPON.GenerateWeaponTable(var_52_13.weaponSetups[0])

		if var_52_14 then
			table.insert(var_52_0, var_52_14)
		end
	end

	for iter_52_3 = 1, LOADOUT.DefaultClassCount do
		if iter_52_3 ~= favoriteLoadoutIndex then
			local var_52_15 = LOADOUT.GetLoadoutPlayerData(arg_52_0, iter_52_3)

			if var_52_15 then
				local var_52_16 = WEAPON.GenerateWeaponTable(var_52_15.weaponSetups[0])

				if var_52_16 then
					table.insert(var_52_0, var_52_16)
				end
			end
		end
	end

	local var_52_17 = WEAPON.DefaultPrimaryID
	local var_52_18 = WEAPON.GenerateWeaponTableFromID(arg_52_0, var_52_17)

	if var_52_18 then
		table.insert(var_52_0, var_52_18)
	end

	local function var_52_19(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
		if arg_54_0 == LOOT.itemTypes.WEAPON then
			return true
		elseif arg_54_0 == LOOT.itemTypes.OPERATOR or arg_54_0 == LOOT.itemTypes.OPERATOR_SKIN then
			return true
		elseif arg_54_0 == LOOT.itemTypes.CHARM then
			return arg_54_1
		elseif arg_54_0 == LOOT.itemTypes.STICKER then
			return arg_54_2
		elseif arg_54_0 == LOOT.itemTypes.CAMO then
			return arg_54_3
		end
	end

	local var_52_20 = var_52_1[LOOT.itemTypes.CHARM] ~= nil
	local var_52_21 = var_52_1[LOOT.itemTypes.STICKER] ~= nil
	local var_52_22 = var_52_1[LOOT.itemTypes.CAMO] ~= nil

	for iter_52_4, iter_52_5 in ipairs(var_52_0) do
		local var_52_23 = false
		local var_52_24 = false
		local var_52_25 = false

		if var_52_20 and WEAPON.SupportsCosmetics(iter_52_5.weapon) and arg_52_1 ~= LOOT.itemTypes.STICKER and arg_52_1 ~= LOOT.itemTypes.CAMO then
			local var_52_26

			if arg_52_1 == LOOT.itemTypes.CHARM then
				var_52_26 = arg_52_2
			else
				var_52_26 = tonumber(var_52_1[LOOT.itemTypes.CHARM][1])
			end

			iter_52_5.cosmeticAttachment = LOOT.GetItemRef(LOOT.itemTypes.CHARM, var_52_26)
			var_52_23 = true
		end

		local var_52_27 = WEAPON.GetMaxStickerSlotsForWeapon(iter_52_5.weapon)

		if var_52_21 and var_52_27 > 0 and arg_52_1 ~= LOOT.itemTypes.CHARM and arg_52_1 ~= LOOT.itemTypes.CAMO then
			local var_52_28 = 0

			if arg_52_1 == LOOT.itemTypes.STICKER then
				var_52_28 = var_52_27
			else
				var_52_28 = math.min(var_52_27, #var_52_1[LOOT.itemTypes.STICKER])
			end

			iter_52_5.stickers = {}

			for iter_52_6 = 1, var_52_28 do
				local var_52_29

				if arg_52_1 == LOOT.itemTypes.STICKER then
					var_52_29 = arg_52_2
				else
					var_52_29 = tonumber(var_52_1[LOOT.itemTypes.STICKER][iter_52_6])
				end

				table.insert(iter_52_5.stickers, LOOT.GetItemRef(LOOT.itemTypes.STICKER, var_52_29))
			end

			var_52_24 = true
		end

		local var_52_30 = arg_52_1 ~= LOOT.itemTypes.WEAPON and arg_52_1 ~= LOOT.itemTypes.CHARM and arg_52_1 ~= LOOT.itemTypes.STICKER

		if var_52_22 and var_52_30 then
			local var_52_31

			if arg_52_1 == LOOT.itemTypes.CAMO then
				var_52_31 = arg_52_2
			else
				var_52_31 = tonumber(var_52_1[LOOT.itemTypes.CAMO][1])
			end

			iter_52_5.camo = LOOT.GetItemRef(LOOT.itemTypes.CAMO, var_52_31)

			local var_52_32 = true
		end

		if var_52_19(arg_52_1, var_52_23, var_52_24, var_52_22) then
			return iter_52_5
		end
	end
end

function STORE.PreviewSupported(arg_55_0)
	return arg_55_0 == LOOT.itemTypes.WEAPON or arg_55_0 == LOOT.itemTypes.CHARM or arg_55_0 == LOOT.itemTypes.STICKER or arg_55_0 == LOOT.itemTypes.WATCH or arg_55_0 == LOOT.itemTypes.OPERATOR or arg_55_0 == LOOT.itemTypes.OPERATOR_SKIN or arg_55_0 == LOOT.itemTypes.PLAYERCARD or arg_55_0 == LOOT.itemTypes.EMBLEM or arg_55_0 == LOOT.itemTypes.CAMO or arg_55_0 == LOOT.itemTypes.RETICLE or arg_55_0 == LOOT.itemTypes.SPRAYS or arg_55_0 == LOOT.itemTypes.QUIP or arg_55_0 == LOOT.itemTypes.OPERATOR_EXECUTION or arg_55_0 == LOOT.itemTypes.GESTURES or arg_55_0 == LOOT.itemTypes.VEHICLE_CAMO or arg_55_0 == LOOT.itemTypes.VEHICLE_HORN or arg_55_0 == LOOT.itemTypes.BATTLE_PASS or arg_55_0 == LOOT.itemTypes.BUNDLE or arg_55_0 == LOOT.itemTypes.MISSION
end

function STORE.PreviewItem(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4, arg_56_5, arg_56_6, arg_56_7)
	local function var_56_0()
		if arg_56_3 then
			return STORE.GetBundlePreviewWeapon(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
		else
			return BATTLEPASS.GetPreviewWeapon(arg_56_0, arg_56_1, arg_56_2)
		end
	end

	local function var_56_1()
		local var_58_0 = {
			lootID = arg_56_2,
			lootType = arg_56_1,
			timerValue = arg_56_4,
			isBattlePass = arg_56_5,
			bundleData = arg_56_7,
			quickPurchaseEnabled = arg_56_3 and not STORE.IsFirstPartyBundle(arg_56_3)
		}

		if LOOT.CanPreview(arg_56_1, arg_56_2) then
			LUI.FlowManager.RequestPopupMenu(nil, "StorePreviewItemPopup", true, arg_56_0, arg_56_6, var_58_0, nil, false, false)
		end
	end

	local function var_56_2()
		local var_59_0

		if arg_56_1 ~= LOOT.itemTypes.WATCH then
			var_59_0 = var_56_0()

			if not var_59_0 then
				if arg_56_1 == LOOT.itemTypes.CAMO then
					var_56_1(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
				end

				return
			end
		end

		local var_59_1 = LOOT.GetItemRef(arg_56_1, arg_56_2)

		if arg_56_1 == LOOT.itemTypes.WEAPON then
			local var_59_2 = {
				isStorePreview = true,
				storePreviewItemType = arg_56_1,
				timerValue = arg_56_4,
				weaponTable = var_59_0,
				itemRef = var_59_1,
				weaponRef = var_59_1,
				isBattlePass = arg_56_5,
				isVariant = WEAPON.IsVariant(arg_56_0, arg_56_2),
				bundleData = arg_56_7,
				quickPurchaseEnabled = arg_56_3 and not STORE.IsFirstPartyBundle(arg_56_3)
			}

			LUI.FlowManager.RequestAddMenu("ModificationPreview", true, arg_56_0, arg_56_6, var_59_2, true)
		else
			local var_59_3 = {
				isStorePreview = true,
				storePreviewItemType = arg_56_1,
				titleOverride = LOOT.GetItemName(arg_56_1, var_59_1),
				timerValue = arg_56_4,
				weaponTable = var_59_0,
				isBattlePass = arg_56_5,
				watchRef = arg_56_1 == LOOT.itemTypes.WATCH and var_59_1 or nil,
				itemRef = var_59_1,
				bundleData = arg_56_7,
				quickPurchaseEnabled = arg_56_3 and not STORE.IsFirstPartyBundle(arg_56_3),
				storeFlavor = LOOT.GetStoreFlavor(arg_56_1, var_59_1)
			}

			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_56_0, arg_56_6, var_59_3, true)
		end
	end

	local function var_56_3()
		local var_60_0 = {
			isStorePreview = true,
			lootID = arg_56_2,
			timerValue = arg_56_4,
			bundleData = arg_56_7,
			isBattlePass = arg_56_5,
			quickPurchaseEnabled = arg_56_3 and not STORE.IsFirstPartyBundle(arg_56_3)
		}

		LUI.FlowManager.RequestAddMenu("ReticleSelect", true, arg_56_0, arg_56_6, var_60_0, true)
	end

	local function var_56_4()
		local var_61_0
		local var_61_1
		local var_61_2

		if arg_56_1 == LOOT.itemTypes.OPERATOR then
			var_61_0 = LOOT.GetItemRef(arg_56_1, arg_56_2)
			var_61_1 = OPERATOR.GetEquippedSkinForOperator(arg_56_0, var_61_0)
			var_61_2 = OPERATOR.GetName(var_61_0)
		elseif arg_56_1 == LOOT.itemTypes.FEATURE then
			local var_61_3 = LOOT.GetItemRef(arg_56_1, arg_56_2)
			local var_61_4 = LOOT.GetFeatureOperatorSkinRef(var_61_3)

			assert(var_61_4 and #var_61_4 > 0)

			var_61_0 = OPERATOR.GetSkinOwnerRef(var_61_4)
			var_61_1 = OPERATOR.GetOperatorSkinByRef(arg_56_0, var_61_4, var_61_0)
			var_61_2 = OPERATOR.GetSkinName(var_61_4)
		else
			var_61_0 = OPERATOR.GetOperatorRefByLootTypeAndID(arg_56_1, arg_56_2, arg_56_0)

			local var_61_5 = LOOT.GetItemRef(arg_56_1, arg_56_2)

			var_61_1 = OPERATOR.GetOperatorSkinByRef(arg_56_0, var_61_5, var_61_0)
			var_61_2 = OPERATOR.GetSkinName(var_61_5)
		end

		local var_61_6 = OPERATOR.GetOperatorSuperFactionRef(var_61_0)
		local var_61_7
		local var_61_8 = var_56_0()

		if var_61_8 then
			local var_61_9, var_61_10 = OPERATOR.GetWeaponDataFromLoadout(arg_56_0)

			var_61_7 = {
				primaryModel = WEAPON.GetWeaponModelName(var_61_8.weapon, var_61_8, {
					includeStickers = true,
					includeAttachments = true,
					useOperatorOverride = true,
					includeCamos = true,
					controllerIndex = arg_56_0
				}),
				secondaryModel = var_61_10
			}
		end

		local var_61_11 = {
			isStorePreview = true,
			operatorData = {
				currentState = tonumber(var_61_6),
				previewOperatorRef = var_61_0,
				skinInfo = var_61_1
			},
			storePreviewItemType = arg_56_1,
			titleOverride = var_61_2,
			timerValue = arg_56_4,
			weaponData = var_61_7,
			itemRef = LOOT.GetItemRef(arg_56_1, arg_56_2),
			isBattlePass = arg_56_5,
			bundleData = arg_56_7,
			quickPurchaseEnabled = arg_56_3 and not STORE.IsFirstPartyBundle(arg_56_3)
		}

		LUI.FlowManager.RequestAddMenu("OperatorShowcase", true, arg_56_0, arg_56_6, var_61_11, true)
	end

	local function var_56_5()
		local var_62_0 = {
			file = CSV.missionIDs.file,
			cols = CSV.missionIDs.cols
		}
		local var_62_1 = StringTable.BJJBBCJGEJ(CSV.missionIDs.file, CSV.missionIDs.cols.operatorMissionItemID, arg_56_2)
		local var_62_2 = CSV.ReadRow(var_62_0, var_62_1)
		local var_62_3 = {
			hideBundleUpsellButton = true,
			singleMissionOverride = true,
			hideBattlePassTierReq = true,
			challengeID = var_62_2.ref,
			skinLootId = tonumber(var_62_2.operatorSkinID)
		}

		LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_56_0, arg_56_6, var_62_3)
	end

	local function var_56_6()
		local var_63_0 = {
			isStorePreview = true,
			storePreviewItemType = arg_56_1,
			lootID = arg_56_2,
			lootType = arg_56_1,
			timerValue = arg_56_4,
			isBattlePass = arg_56_5,
			itemRef = LOOT.GetItemRef(arg_56_1, arg_56_2),
			bundleData = arg_56_7,
			quickPurchaseEnabled = arg_56_3 and not STORE.IsFirstPartyBundle(arg_56_3)
		}

		LUI.FlowManager.RequestPopupMenu(nil, "VehiclePreview", true, arg_56_0, arg_56_6, var_63_0, true)
	end

	if arg_56_1 == LOOT.itemTypes.WEAPON or arg_56_1 == LOOT.itemTypes.CHARM or arg_56_1 == LOOT.itemTypes.STICKER or arg_56_1 == LOOT.itemTypes.CAMO or arg_56_1 == LOOT.itemTypes.WATCH then
		var_56_2(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	elseif arg_56_1 == LOOT.itemTypes.RETICLE then
		var_56_3(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	elseif arg_56_1 == LOOT.itemTypes.OPERATOR or arg_56_1 == LOOT.itemTypes.OPERATOR_SKIN or arg_56_1 == LOOT.itemTypes.FEATURE then
		var_56_4(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	elseif arg_56_1 == LOOT.itemTypes.VEHICLE_CAMO then
		var_56_6(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	elseif arg_56_1 == LOOT.itemTypes.PLAYERCARD or arg_56_1 == LOOT.itemTypes.EMBLEM or arg_56_1 == LOOT.itemTypes.SPRAYS or arg_56_1 == LOOT.itemTypes.QUIP or arg_56_1 == LOOT.itemTypes.VEHICLE_HORN or arg_56_1 == LOOT.itemTypes.VEHICLE_TRACK or arg_56_1 == LOOT.itemTypes.OPERATOR_EXECUTION and not Engine.FABABBDBA() or arg_56_1 == LOOT.itemTypes.GESTURES or arg_56_1 == LOOT.itemTypes.BUNDLE or arg_56_1 == LOOT.itemTypes.BATTLE_PASS then
		var_56_1(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	elseif arg_56_1 == LOOT.itemTypes.MISSION then
		var_56_5(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	end
end

function STORE.GetSaleTimer(arg_64_0)
	local var_64_0

	if not CONDITIONS.IsMagmaGameMode() then
		var_64_0 = Dvar.DHEEJCCJBH("MNQTSRMPMP")
	else
		var_64_0 = Dvar.DHEEJCCJBH("MTQSNPMOTQ")
	end

	if var_64_0 then
		return var_64_0
	else
		return ""
	end
end

function STORE.ParseSalesItems(arg_65_0)
	local var_65_0

	if not CONDITIONS.IsMagmaGameMode() then
		var_65_0 = Dvar.DHEEJCCJBH("OQLLQNMS")
	else
		var_65_0 = Dvar.DHEEJCCJBH("LKORRRQNPR")
	end

	return LUI.Split(var_65_0, ",")
end

function STORE.ParsePromotedItems(arg_66_0)
	local var_66_0

	if not CONDITIONS.IsMagmaGameMode() then
		var_66_0 = Dvar.DHEEJCCJBH("MSKPMNRQTS")
	else
		var_66_0 = Dvar.DHEEJCCJBH("NPPRRPOLLL")
	end

	return LUI.KeyValueSplit(var_66_0, ",")
end

function STORE.ParseEventTabPromotedBundles()
	local var_67_0 = Dvar.DHEEJCCJBH("online_event_tab_store_promoted_bundles")

	if var_67_0 and var_67_0 ~= "" then
		return LUI.Split(var_67_0, ",")
	end
end

function STORE.ParseEventTabHasSeenPromotedBundles()
	local var_68_0 = Dvar.DHEEJCCJBH("online_event_tab_store_promoted_bundles_check_seen")

	if var_68_0 and var_68_0 ~= "" then
		return LUI.Split(var_68_0, ",")
	end
end

function STORE.ParseChaseItems(arg_69_0)
	local var_69_0

	if not CONDITIONS.IsMagmaGameMode() then
		var_69_0 = Dvar.DHEEJCCJBH("MSRSTLNLTM")
	else
		var_69_0 = Dvar.DHEEJCCJBH("MTNMKSLKL")
	end

	if var_69_0 then
		return LUI.KeyValueSplit(var_69_0, ",")
	else
		return ""
	end
end

function STORE.IsItemOnSale(arg_70_0, arg_70_1)
	local var_70_0 = STORE.ParseSalesItems(arg_70_1)

	if var_70_0 ~= nil then
		for iter_70_0, iter_70_1 in ipairs(var_70_0) do
			if tonumber(iter_70_1) == arg_70_0 then
				return STORE.GetSaleBundleID(iter_70_1) ~= nil
			end
		end
	end

	return false
end

function STORE.GetHighestDiscountPercentage(arg_71_0)
	local var_71_0 = STORE.ParseSalesItems(arg_71_0)
	local var_71_1 = 0

	if var_71_0 ~= nil then
		for iter_71_0, iter_71_1 in ipairs(var_71_0) do
			local var_71_2, var_71_3 = STORE.GetBundleCost(arg_71_0, tonumber(iter_71_1))

			if var_71_3 and var_71_3 < var_71_2 then
				local var_71_4 = (var_71_2 - var_71_3) / var_71_2

				if var_71_1 < var_71_4 then
					var_71_1 = var_71_4
				end
			end
		end
	end

	return var_71_1
end

function STORE.GetCountDownTimeComponents(arg_72_0)
	local var_72_0 = 0
	local var_72_1 = 0
	local var_72_2 = 0
	local var_72_3 = 0
	local var_72_4

	if arg_72_0 and #arg_72_0 > 0 and tonumber(arg_72_0) > 0 then
		var_72_3 = Engine.CCEJJCCDEG(tostring(arg_72_0))

		if var_72_3 > 0 then
			var_72_0 = math.floor(var_72_3 / 86400)
			var_72_1 = math.floor(var_72_3 % 86400 / 3600)
			var_72_2 = math.floor(var_72_3 % 3600 / 60)
			var_72_3 = math.floor(var_72_3 % 60)
		end
	end

	return var_72_0, var_72_1, var_72_2, var_72_3
end

function STORE.ParseCountDownTime(arg_73_0)
	local var_73_0
	local var_73_1, var_73_2, var_73_3, var_73_4 = STORE.GetCountDownTimeComponents(arg_73_0)

	return (Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", var_73_1, var_73_2, var_73_3, var_73_4))
end

function STORE.OwnsItemInCategory(arg_74_0, arg_74_1)
	if STORE.IsCatalogReady(arg_74_0) then
		local var_74_0 = InGameStore.GetCategoryProducts(arg_74_0, arg_74_1)

		for iter_74_0, iter_74_1 in ipairs(var_74_0) do
			if iter_74_1.status ~= InGameStoreProductStatus.NOT_OWNED then
				return true
			end
		end
	end

	return false
end

function STORE.IsTitleID(arg_75_0)
	for iter_75_0, iter_75_1 in pairs(STORE.TitleIDs) do
		if arg_75_0 == iter_75_1 then
			return true
		end
	end

	return false
end

function STORE.IsStandardTitleID(arg_76_0)
	return arg_76_0 == STORE.TitleIDs.BNET_STANDARD or arg_76_0 == STORE.TitleIDs.PS4_STANDARD or arg_76_0 == STORE.TitleIDs.XB3_STANDARD
end

function STORE.IsBattlePassTitleID(arg_77_0)
	return arg_77_0 == STORE.TitleIDs.BNET_BATTLE_PASS or arg_77_0 == STORE.TitleIDs.PS4_BATTLE_PASS or arg_77_0 == STORE.TitleIDs.XB3_BATTLE_PASS
end

function STORE.GetTitleIDsForCurrentPlatform()
	local var_78_0 = {}

	if Engine.DBFCJBDJEC() then
		var_78_0 = {
			STORE.TitleIDs.BNET_STANDARD,
			STORE.TitleIDs.BNET_BATTLE_PASS
		}
	elseif Engine.CIEGIACHAE() then
		var_78_0 = {
			STORE.TitleIDs.PS4_STANDARD,
			STORE.TitleIDs.PS4_BATTLE_PASS
		}
	elseif Engine.BAHIIBFDDG() then
		var_78_0 = {
			STORE.TitleIDs.XB3_STANDARD,
			STORE.TitleIDs.XB3_BATTLE_PASS
		}
	end

	return var_78_0
end

function STORE.IsZeusTitle(arg_79_0)
	assert(arg_79_0)

	for iter_79_0, iter_79_1 in pairs(STORE.ZeusTitleIDs) do
		if iter_79_1 == arg_79_0 then
			return true
		end
	end

	return false
end

function STORE.IsZeusProduct(arg_80_0)
	assert(arg_80_0)

	for iter_80_0, iter_80_1 in pairs(STORE.ZeusProductIDs) do
		if iter_80_0 == arg_80_0 then
			return true
		end
	end

	return false
end

function STORE.IsZeusTrialProduct(arg_81_0)
	assert(arg_81_0)

	for iter_81_0, iter_81_1 in pairs(STORE.ZeusTrialProductIDs) do
		if iter_81_0 == arg_81_0 then
			return true
		end
	end

	return false
end

function STORE.GetZeusTitleIDForProduct(arg_82_0)
	assert(arg_82_0)

	if arg_82_0 == STORE.ZeusStandardID or arg_82_0 == STORE.ZeusCrossGenID then
		return STORE.ZeusTitleIDs.ZEUS_STANDARD
	elseif arg_82_0 == STORE.ZeusUltimateID then
		return STORE.ZeusTitleIDs.ZEUS_ULTIMATE
	else
		assert(false, "STORE.GetZeusTitleIDForProduct: Unknown product ID: " .. arg_82_0)
	end
end

function STORE.IsVanguardProduct(arg_83_0)
	assert(arg_83_0)

	for iter_83_0, iter_83_1 in pairs(STORE.VanguardProductIDs) do
		if iter_83_0 == arg_83_0 then
			return true
		end
	end

	return false
end

function STORE.IsCortezProduct(arg_84_0)
	assert(arg_84_0)

	for iter_84_0, iter_84_1 in pairs(STORE.CortezProductIDs) do
		if iter_84_0 == arg_84_0 then
			return true
		end
	end

	return false
end

function STORE.GetZeusTitleImageForTitleID(arg_85_0)
	assert(arg_85_0)

	local var_85_0

	if arg_85_0 == STORE.ZeusTitleIDs.ZEUS_STANDARD then
		var_85_0 = STORE.ZeusStandardID
	elseif arg_85_0 == STORE.ZeusTitleIDs.ZEUS_ULTIMATE then
		var_85_0 = STORE.ZeusUltimateID
	else
		assert(false, "STORE.GetZeusTitleImageForTitleID: Unsupported product ID")

		return
	end

	local var_85_1 = STORE.LookupFirstPartyBundle(var_85_0)

	if var_85_1 then
		return var_85_1.titleImage
	end
end

function STORE.GetZeusCategoryIndex()
	return Dvar.CFHDGABACF("QNTKKORK") or 1
end

function STORE.GetX2CategoryIndex()
	return Dvar.CFHDGABACF("online_store_X2_category_index") or 1
end

function STORE.GetCortezCategoryIndex()
	return Dvar.CFHDGABACF("OOKRTSKQ") or 1
end

function STORE.OpenQuickPurchasePopupInPreview(arg_89_0)
	if arg_89_0 then
		if Commerce.CEDDCGHIGA(arg_89_0.controllerIndex, arg_89_0.itemCurrencyID) < arg_89_0.itemCurrencyAmount then
			local var_89_0 = {
				showBalance = true,
				controllerIndex = arg_89_0.controllerIndex,
				currencyID = arg_89_0.itemCurrencyID,
				currencyAmount = arg_89_0.itemCurrencyAmount
			}

			STORE.EnterStore(arg_89_0.controllerIndex, "StoreConfirmPurchasePopup", "ConfirmButton", var_89_0, "PurchaseCODPointsPopup", true)
		else
			local var_89_1 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_89_0.bundleID, CSV.bundleIDs.cols.name)
			local var_89_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_89_0.bundleID, CSV.bundleIDs.cols.titleImage)
			local var_89_3 = {
				itemName = var_89_1,
				itemImage = var_89_2,
				itemCurrencyID = arg_89_0.itemCurrencyID,
				itemCurrencyAmount = arg_89_0.itemCurrencyAmount,
				timerPubVar = arg_89_0.timerPubVar,
				showDisclaimer = arg_89_0.showDisclaimer,
				alreadyOwnedCount = arg_89_0.alreadyOwnedCount,
				startPurchaseImmediately = arg_89_0.startPurchaseImmediately,
				confirmAction = function()
					LUI.FlowManager.GetScopedData("StoreBundlePreview").isQuickPurchasePopupInPreview = true

					ACTIONS.RestoreMenu("StoreBundlePreview", true, arg_89_0.controllerIndex)
				end
			}
			local var_89_4 = LOOT.GetItemsInBundle(arg_89_0.bundleID)

			STORE.SetupGameExclusiveStatusOfBundle(var_89_4, var_89_3)
			Engine.BJDBIAGIDA(SOUND_SETS.storefront.purchaseBundle)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreConfirmPurchasePopup", true, arg_89_0.controllerIndex, false, var_89_3, nil, false, true)
		end
	end
end

function STORE.GetUpsellBundleList(arg_91_0)
	local var_91_0 = {}
	local var_91_1 = 3
	local var_91_2 = STORE.GetCategoryData(arg_91_0)

	if var_91_2 == nil then
		return var_91_0
	end

	local var_91_3 = STORE.CheckForPersonalRecommendations(arg_91_0)

	for iter_91_0, iter_91_1 in ipairs(var_91_2) do
		local var_91_4 = STORE.GetCategoryItemIDs(arg_91_0, iter_91_1)

		for iter_91_2, iter_91_3 in ipairs(var_91_4) do
			local var_91_5 = iter_91_3

			if STORE.BundleAvailable(arg_91_0, var_91_5) then
				local var_91_6 = {
					id = var_91_5
				}
				local var_91_7 = {
					file = CSV.bundleIDs.file,
					cols = CSV.bundleIDs.cols
				}
				local var_91_8 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, iter_91_3)
				local var_91_9 = CSV.ReadRow(var_91_7, var_91_8)

				var_91_6.name = var_91_9.name
				var_91_6.image = var_91_9.image
				var_91_6.description = var_91_9.description
				var_91_6.rarity = var_91_9.rarity
				var_91_6.bundleType = var_91_9.bundleType
				var_91_6.titleImage = var_91_9.titleImage
				var_91_6.currencyID = tonumber(var_91_9.currencyID)
				var_91_6.currencyAmount = tonumber(var_91_9.currencyAmount)
				var_91_6.itemIndex = iter_91_2
				var_91_6.owned = false
				var_91_6.isFirstParty = false
				var_91_6.openedFromPopup = true

				table.insert(var_91_0, var_91_6)

				if var_91_1 <= #var_91_0 then
					return var_91_0
				end
			end
		end
	end

	return var_91_0
end

function STORE.OpenBundleUpsellPopup(arg_92_0)
	if Dvar.IBEGCHEFE("MMOOMQPMTP") then
		local var_92_0 = STORE.GetUpsellBundleList(arg_92_0)

		if #var_92_0 > 0 then
			LUI.FlowManager.RequestPopupMenu(nil, "BundlePurchaseUpsellPopup", true, arg_92_0, false, {
				items = var_92_0
			})
		end
	end
end

function STORE.BundleContainsBattlePass(arg_93_0)
	arg_93_0 = tonumber(arg_93_0)

	if not arg_93_0 then
		return false
	end

	local var_93_0 = LOOT.GetBundleItemsMappedByType(arg_93_0)[LOOT.itemTypes.BATTLE_PASS]

	if var_93_0 then
		for iter_93_0 = 1, #var_93_0 do
			local var_93_1 = var_93_0[iter_93_0]
			local var_93_2 = LOOT.GetItemRef(LOOT.itemTypes.BATTLE_PASS, var_93_1)
			local var_93_3 = tonumber(BATTLEPASS.GetItemType(var_93_2))

			if var_93_3 == BATTLEPASS.ItemTypes.PREMIUM or var_93_3 == BATTLEPASS.ItemTypes.BUNDLE then
				return true
			end
		end
	end

	return false
end

function STORE.AddItemsInBundleToTable(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	arg_94_3 = arg_94_3 or {}

	local var_94_0 = {
		file = CSV.bundleIDs.file,
		cols = CSV.bundleIDs.cols
	}
	local var_94_1 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_94_1)
	local var_94_2 = CSV.ReadRow(var_94_0, var_94_1)

	for iter_94_0 = 1, CSV.bundleIDs.maxItems do
		local var_94_3 = tonumber(var_94_2["item" .. iter_94_0])

		if not var_94_3 then
			break
		end

		if not arg_94_3.itemType or arg_94_3.itemType == LOOT.GetTypeForID(var_94_3) then
			local var_94_4 = {
				lootID = var_94_3,
				bundleID = arg_94_1
			}

			if arg_94_3.byRef then
				arg_94_2[LOOT.GetItemRef(arg_94_3.itemType, var_94_3)] = var_94_4
			else
				arg_94_2[var_94_3] = var_94_4
			end
		end
	end
end

function STORE.GetAllItemsInStore(arg_95_0, arg_95_1)
	assert(arg_95_0)

	arg_95_1 = arg_95_1 or {}
	arg_95_1.AddItemsFunction = arg_95_1.AddItemsFunction or STORE.AddItemsInBundleToTable

	local var_95_0 = arg_95_1.itemsTable or {}
	local var_95_1 = STORE.GetCategoryData(arg_95_0)

	if var_95_1 == nil then
		return var_95_0
	end

	for iter_95_0, iter_95_1 in ipairs(var_95_1) do
		iter_95_1.items = iter_95_1.items or {}

		local var_95_2 = iter_95_1.items and iter_95_1.items[1] or {}

		if not var_95_2.emptyCategory and iter_95_1.idPubVar and var_95_2.layoutOnlyItem then
			local var_95_3 = STORE.GetCategoryItemIDs(arg_95_0, iter_95_1)

			for iter_95_2 = 1, #var_95_3 do
				local var_95_4 = var_95_3[iter_95_2]
				local var_95_5 = STORE.IsFirstPartyBundle(var_95_4)

				if STORE.BundleAvailable(arg_95_0, var_95_4) and not var_95_5 then
					arg_95_1.AddItemsFunction(arg_95_0, var_95_4, var_95_0, arg_95_1)
				end
			end
		end
	end

	return var_95_0
end

function STORE.ShouldModifyFeaturedItems(arg_96_0)
	local var_96_0 = Dvar.CFHDGABACF("OMSTQOKTNQ")

	if not var_96_0 or var_96_0 <= 0 then
		return false
	end

	local var_96_1 = AccountRegistration.DJEIHHEBB(arg_96_0)

	if var_96_1 and var_96_1 > 0 then
		return var_96_0 > var_96_1 / 60 / 60 / 24
	end

	return false
end

function STORE.GetPriorityFeaturedItems()
	local var_97_0 = ""

	if CONDITIONS.IsMagmaGameMode() then
		var_97_0 = Dvar.DHEEJCCJBH("LTORSQOPQO") or ""
	else
		var_97_0 = Dvar.DHEEJCCJBH("NOPPTTNRNR") or ""
	end

	return var_97_0
end

function STORE.GetScheduledProductsForCategory(arg_98_0, arg_98_1)
	local var_98_0 = Engine.DEIDGHDBHD()
	local var_98_1 = Dvar.CFHDGABACF("LSRQOQNRMM")

	if var_98_1 ~= 0 then
		var_98_0 = var_98_1
	end

	if var_98_0 then
		local var_98_2 = arg_98_0.id
		local var_98_3

		for iter_98_0 = 1, #arg_98_1 do
			local var_98_4 = arg_98_1[iter_98_0].startDate
			local var_98_5 = arg_98_1[iter_98_0].endDate

			if var_98_4 and var_98_5 and var_98_4 <= var_98_0 and var_98_0 < var_98_5 and arg_98_1[iter_98_0].categoryId == var_98_2 then
				return arg_98_1[iter_98_0].productList
			end
		end
	end

	return ""
end

function STORE.GetCategoryIndexWithFanchiseItems(arg_99_0, arg_99_1)
	if arg_99_0 then
		for iter_99_0 = 1, #arg_99_0 do
			local var_99_0 = arg_99_0[iter_99_0]

			if var_99_0 and var_99_0.id == arg_99_1 then
				return var_99_0.categoryIndex
			end
		end
	end

	return nil
end

function STORE.GetCategoryData(arg_100_0, arg_100_1)
	local var_100_0 = Dvar.CFHDGABACF("ui_test_empty_store")

	if var_100_0 == 1 then
		return {}
	elseif var_100_0 == 2 then
		return nil
	end

	assert(arg_100_0)

	local var_100_1 = arg_100_1

	if not arg_100_1 then
		local var_100_2 = Store.DBFHBBIDHD()

		var_100_1 = Engine.DBFHBBIDHD(var_100_2)
	end

	if not Dvar.IBEGCHEFE("MRTNRKPNQT") then
		return var_100_1
	end

	if Dvar.IBEGCHEFE("TNMTRNOQT") and CONDITIONS.IsT9PremiumPlayer(arg_100_0) == false and STORE.IsZeusOwned(arg_100_0) == false and not STORE.GetCategoryIndexWithFanchiseItems(var_100_1, STORE.ZeusCategoryID) and #STORE.GetZeusCategoryData(arg_100_0) > 0 then
		table.insert(var_100_1, STORE.GetZeusCategoryIndex(), {
			name = "MENU/STORE_CAT_ZEUS",
			isFirstPartyCategory = true,
			id = STORE.ZeusCategoryID
		})
	end

	if Dvar.IBEGCHEFE("online_store_x2_category_enabled") and (STORE.IsX2Owned(arg_100_0) == false or STORE.IsVanguardUpgradeToUltimateExisteAndNotOwned(arg_100_0)) and not STORE.GetCategoryIndexWithFanchiseItems(var_100_1, STORE.X2CategoryID) and #STORE.GetVanguardCategoryData(arg_100_0) > 0 then
		table.insert(var_100_1, STORE.GetX2CategoryIndex(), {
			name = "MENU/STORE_CAT_X2",
			isFirstPartyCategory = true,
			id = STORE.X2CategoryID
		})
	end

	if Dvar.IBEGCHEFE("LMMPLKNTMP") and not STORE.GetCategoryIndexWithFanchiseItems(var_100_1, STORE.CortezCategoryID) and #STORE.GetCortezCategoryData(arg_100_0) > 0 then
		table.insert(var_100_1, STORE.GetCortezCategoryIndex(), {
			name = "STORE_FLAVOR_WZ335/CATEGORY_CORTEZ",
			isFirstPartyCategory = true,
			id = STORE.CortezCategoryID
		})
	end

	return var_100_1
end

function STORE.IsZeusOwned(arg_101_0)
	assert(arg_101_0)

	if STORE.IsCatalogReady(arg_101_0) then
		local var_101_0 = false

		for iter_101_0, iter_101_1 in pairs(STORE.ZeusProductIDs) do
			local var_101_1 = InGameStore.GetProduct(arg_101_0, iter_101_0)

			if var_101_1 and var_101_1.status ~= InGameStoreProductStatus.NOT_OWNED then
				return true
			end

			if var_101_1 ~= nil then
				var_101_0 = var_101_0 or true
			end
		end

		if var_101_0 then
			return false
		else
			DebugPrint("STORE.IsZeusOwned: Did not find Zeus product in InGameStore, returning nil")

			return nil
		end
	else
		DebugPrint("STORE.IsZeusOwned: Catalog is not ready, returning nil")

		return nil
	end
end

function STORE.IsZeusAvailable(arg_102_0)
	assert(arg_102_0)

	if STORE.IsCatalogReady(arg_102_0) then
		for iter_102_0, iter_102_1 in pairs(STORE.ZeusProductIDs) do
			if InGameStore.GetProduct(arg_102_0, iter_102_0) ~= nil then
				return true
			end
		end
	end

	return false
end

function STORE.IsX2Owned(arg_103_0)
	assert(arg_103_0)

	if STORE.IsCatalogReady(arg_103_0) then
		local var_103_0 = false

		for iter_103_0, iter_103_1 in pairs(STORE.VanguardProductIDs) do
			local var_103_1 = InGameStore.GetProduct(arg_103_0, iter_103_0)

			if var_103_1 and var_103_1.status ~= InGameStoreProductStatus.NOT_OWNED then
				return true
			end

			if var_103_1 ~= nil then
				var_103_0 = var_103_0 or true
			end
		end

		if var_103_0 then
			return false
		else
			DebugPrint("STORE.IsX2Owned: Did not find X2 product in InGameStore, returning nil")

			return nil
		end
	else
		DebugPrint("STORE.IsX2Owned: Catalog is not ready, returning nil")

		return nil
	end
end

function STORE.IsVanguardUpgradeToUltimateExisteAndNotOwned(arg_104_0)
	assert(arg_104_0)

	if STORE.IsCatalogReady(arg_104_0) then
		local var_104_0 = InGameStore.GetProduct(arg_104_0, STORE.VanguardUpgradeToUltimateID)

		if not var_104_0 then
			return false
		elseif var_104_0.status ~= InGameStoreProductStatus.NOT_OWNED then
			return false
		else
			return true
		end
	else
		DebugPrint("STORE.IsX2Owned: Catalog is not ready, returning nil")

		return nil
	end
end

function STORE.IsCortezUpgradeToUltimateExistentAndNotOwned(arg_105_0)
	assert(arg_105_0)

	if STORE.IsCatalogReady(arg_105_0) then
		if CONDITIONS.IsPC() then
			local var_105_0 = InGameStore.GetProduct(arg_105_0, STORE.CortezUpgradeToUltimateID)

			if not var_105_0 then
				return false
			elseif var_105_0.status ~= InGameStoreProductStatus.NOT_OWNED then
				return false
			else
				return true
			end
		else
			local var_105_1 = InGameStore.GetProduct(arg_105_0, STORE.CortezAltID)
			local var_105_2 = InGameStore.GetProduct(arg_105_0, STORE.CortezVaultID)
			local var_105_3 = var_105_1 and var_105_1.status ~= InGameStoreProductStatus.NOT_OWNED
			local var_105_4 = var_105_2 and var_105_2.status ~= InGameStoreProductStatus.NOT_OWNED

			return var_105_3 and not var_105_4
		end
	else
		DebugPrint("STORE.IsCortezUpgradeToUltimateExistentAndNotOwned: Catalog is not ready, returning nil")

		return nil
	end
end

function STORE.IsZeusProductOwned(arg_106_0, arg_106_1)
	assert(arg_106_0)
	assert(arg_106_1)

	if STORE.IsCatalogReady(arg_106_0) then
		local var_106_0 = InGameStore.GetProduct(arg_106_0, arg_106_1)

		return var_106_0 and var_106_0.status ~= InGameStoreProductStatus.NOT_OWNED
	else
		DebugPrint("STORE.IsZeusProductOwned: Catalog is not ready, returning nil")

		return nil
	end
end

function STORE.LookupFirstPartyBundle(arg_107_0)
	assert(arg_107_0)

	local var_107_0 = {
		file = CSV.bundleIDs.file,
		cols = CSV.bundleIDs.cols
	}
	local var_107_1 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, arg_107_0)

	if var_107_1 and var_107_1 >= 0 then
		return CSV.ReadRow(var_107_0, var_107_1)
	end

	local var_107_2 = arg_107_0

	if Engine.CGABICJHAI() then
		var_107_2 = var_107_2 .. "_pc"
	elseif Engine.CIEGIACHAE() then
		var_107_2 = var_107_2 .. "_ps4"
	else
		var_107_2 = var_107_2 .. "_xb3"
	end

	local var_107_3 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_107_2)

	if var_107_3 and var_107_3 >= 0 then
		return CSV.ReadRow(var_107_0, var_107_3)
	end

	local var_107_4 = arg_107_0

	if Engine.CGABICJHAI() then
		var_107_4 = var_107_4 .. "_bnet"
	elseif Engine.CIEGIACHAE() then
		var_107_4 = var_107_4 .. "_psn"
	else
		var_107_4 = var_107_4 .. "_xbl"
	end

	local var_107_5 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_107_4)

	if var_107_5 and var_107_5 >= 0 then
		return CSV.ReadRow(var_107_0, var_107_5)
	end

	DebugPrint("STORE.LookupFirstPartyBundle: did not find bundle for " .. arg_107_0)
end

function STORE.GetZeusCategoryData(arg_108_0)
	local var_108_0 = {}

	if STORE.IsCatalogReady(arg_108_0) then
		local var_108_1 = {
			STORE.ZeusTrialID,
			STORE.ZeusTrialZMID,
			STORE.ZeusTrialEventID,
			STORE.ZeusStandardID,
			STORE.ZeusCrossGenID,
			STORE.ZeusUltimateID
		}
		local var_108_2 = {
			STORE.ZeusStandardID,
			STORE.ZeusCrossGenID,
			STORE.ZeusUltimateID
		}
		local var_108_3 = false
		local var_108_4 = InGameStore.GetCategoryProducts(arg_108_0, STORE.ZeusCategory)

		if var_108_4 and #var_108_4 > 0 then
			for iter_108_0, iter_108_1 in ipairs(var_108_4) do
				if iter_108_1.status ~= InGameStoreProductStatus.NOT_OWNED then
					for iter_108_2, iter_108_3 in ipairs(var_108_2) do
						if iter_108_1.productId == iter_108_3 and STORE.LookupFirstPartyBundle(iter_108_1.productId) then
							var_108_3 = true
						end
					end
				end
			end

			if not var_108_3 then
				local var_108_5 = Dvar.DHEEJCCJBH("MMSQOQKNK")

				if CONDITIONS.IsBackCompatPS5() and var_108_5 ~= nil and var_108_5 ~= "" then
					local var_108_6 = Commerce.IFDAHCGFE()
					local var_108_7

					if var_108_6 == PS4Region.PS4_REGION_SCEA_EN_FR or var_108_6 == PS4Region.PS4_REGION_SIEA_EN_ES or var_108_6 == PS4Region.PS4_REGION_SIEA_EN_PT then
						var_108_7 = Dvar.DHEEJCCJBH("MQQLTKRRTQ")
					elseif var_108_6 == PS4Region.PS4_REGION_SIEE_EN_FR or var_108_6 == PS4Region.PS4_REGION_SIEE_EN_DE or var_108_6 == PS4Region.PS4_REGION_SIEE_ES_IT or var_108_6 == PS4Region.PS4_REGION_SIEE_RU or var_108_6 == PS4Region.PS4_REGION_SIEE_PL then
						var_108_7 = Dvar.DHEEJCCJBH("MTQLNQOQPQ")
					elseif var_108_6 == PS4Region.PS4_REGION_SIEE_EN_AR then
						var_108_7 = Dvar.DHEEJCCJBH("MSRSTKKMQO")
					elseif var_108_6 == PS4Region.PS4_REGION_SIEJ_JP then
						var_108_7 = Dvar.DHEEJCCJBH("NTSPSSPKRT")
					elseif var_108_6 == PS4Region.PS4_REGION_SIEK_EN_KO then
						var_108_7 = Dvar.DHEEJCCJBH("LQSKTRNSRP")
					end

					if var_108_7 ~= nil and var_108_7 ~= "" then
						local var_108_8 = STORE.LookupFirstPartyBundle(var_108_5)

						if var_108_8 then
							local var_108_9 = {
								image = var_108_8.image,
								asset = var_108_8.image,
								name = var_108_8.name,
								titleImage = var_108_8.titleImage,
								contentLong = Engine.CBBHFCGDIC(var_108_8.description),
								firstPartyBundleId = var_108_8.id and tonumber(var_108_8.id) or nil,
								uri = var_108_7
							}

							table.insert(var_108_0, var_108_9)
						end
					end
				end

				for iter_108_4, iter_108_5 in ipairs(var_108_4) do
					if iter_108_5.status == InGameStoreProductStatus.NOT_OWNED then
						for iter_108_6, iter_108_7 in ipairs(var_108_1) do
							if iter_108_5.productId == iter_108_7 then
								local var_108_10 = STORE.LookupFirstPartyBundle(iter_108_5.productId)

								if var_108_10 then
									local var_108_11 = {
										image = var_108_10.image,
										asset = var_108_10.image,
										name = var_108_10.name,
										titleImage = var_108_10.titleImage,
										productId = iter_108_5.productId,
										contentLong = Engine.CBBHFCGDIC(var_108_10.description),
										firstPartyBundleId = var_108_10.id and tonumber(var_108_10.id) or nil
									}

									table.insert(var_108_0, var_108_11)
								end
							end
						end
					end
				end
			end
		end
	end

	return var_108_0
end

function STORE.GoToZeusInBattleNet(arg_109_0)
	if Engine.DBFCJBDJEC() then
		Engine.BHECIAHGC(arg_109_0, 0, "battlenet://game/zeus/focus")
	end
end

function STORE.GoToX2InBattleNet(arg_110_0)
	if Engine.DBFCJBDJEC() then
		Engine.BHECIAHGC(arg_110_0, 0, "battlenet://game/fore/focus")
	end
end

function STORE.GetVanguardCategoryData(arg_111_0)
	local var_111_0 = {}

	if STORE.IsCatalogReady(arg_111_0) then
		local var_111_1 = {
			STORE.VanguardTrialID,
			STORE.VanguardStandardID,
			STORE.VanguardCrossGenID,
			STORE.VanguardUltimateID,
			STORE.VanguardUpgradeToUltimateID
		}

		local function var_111_2(arg_112_0, arg_112_1)
			local var_112_0 = arg_112_0

			if var_112_0 == STORE.VanguardUpgradeToUltimateID then
				var_112_0 = STORE.VanguardUltimateID
			end

			local var_112_1 = STORE.LookupFirstPartyBundle(var_112_0)

			if var_112_1 then
				local var_112_2

				if arg_112_0 == STORE.VanguardTrialID and CONDITIONS.IsBackCompatPS5() then
					local var_112_3 = Commerce.IFDAHCGFE()

					if var_112_3 == PS4Region.PS4_REGION_SCEA_EN_FR or var_112_3 == PS4Region.PS4_REGION_SIEA_EN_ES or var_112_3 == PS4Region.PS4_REGION_SIEA_EN_PT then
						var_112_2 = Dvar.DHEEJCCJBH("MTLLMRTKP")
					elseif var_112_3 == PS4Region.PS4_REGION_SIEE_EN_FR or var_112_3 == PS4Region.PS4_REGION_SIEE_EN_DE or var_112_3 == PS4Region.PS4_REGION_SIEE_ES_IT or var_112_3 == PS4Region.PS4_REGION_SIEE_RU or var_112_3 == PS4Region.PS4_REGION_SIEE_PL then
						var_112_2 = Dvar.DHEEJCCJBH("OMSQQNSNOL")
					elseif var_112_3 == PS4Region.PS4_REGION_SIEE_EN_AR then
						var_112_2 = Dvar.DHEEJCCJBH("NRSOMLONN")
					elseif var_112_3 == PS4Region.PS4_REGION_SIEJ_JP then
						var_112_2 = Dvar.DHEEJCCJBH("MTQMQQLKPS")
					elseif var_112_3 == PS4Region.PS4_REGION_SIEK_EN_KO then
						var_112_2 = Dvar.DHEEJCCJBH("MNPMTMLRSQ")
					end

					if var_112_2 == "" then
						var_112_2 = nil
					end
				end

				local var_112_4 = {
					owned = arg_112_1,
					image = var_112_1.image,
					asset = var_112_1.image,
					name = var_112_1.name,
					titleImage = var_112_1.titleImage,
					description = Engine.CBBHFCGDIC(var_112_1.description),
					productId = arg_112_0,
					contentLong = Engine.CBBHFCGDIC(var_112_1.description),
					firstPartyBundleId = var_112_1.id and tonumber(var_112_1.id) or nil,
					firstPartyProductID = arg_112_0,
					id = var_112_1.id and tonumber(var_112_1.id) or nil,
					uri = var_112_2
				}

				table.insert(var_111_0, var_112_4)
			end
		end

		local var_111_3 = false
		local var_111_4 = InGameStore.GetCategoryProducts(arg_111_0, STORE.VanguardCategory)

		if var_111_4 and #var_111_4 > 0 then
			for iter_111_0, iter_111_1 in ipairs(var_111_4) do
				if iter_111_1.status == InGameStoreProductStatus.NOT_OWNED then
					for iter_111_2, iter_111_3 in ipairs(var_111_1) do
						if iter_111_1.productId == iter_111_3 then
							var_111_2(iter_111_1.productId, false)
						end
					end
				else
					for iter_111_4, iter_111_5 in ipairs(var_111_1) do
						if iter_111_1.productId == iter_111_5 then
							var_111_2(iter_111_1.productId, true)
						end
					end
				end
			end
		end
	end

	return var_111_0
end

function STORE.GetCortezCategoryData(arg_113_0)
	local var_113_0 = {}

	if STORE.IsCatalogReady(arg_113_0) then
		local var_113_1 = {
			STORE.CortezStandardID,
			STORE.CortezAltID,
			STORE.CortezVaultID,
			STORE.CortezUpgradeToUltimateID,
			STORE.CortezWarzone2ID
		}

		local function var_113_2(arg_114_0, arg_114_1)
			local var_114_0 = arg_114_0

			if var_114_0 == STORE.CortezUpgradeToUltimateID then
				var_114_0 = STORE.CortezVaultID
			end

			local var_114_1 = STORE.LookupFirstPartyBundle(var_114_0)

			if var_114_1 then
				local var_114_2 = {
					owned = arg_114_1,
					image = var_114_1.image,
					asset = var_114_1.image,
					name = var_114_1.name,
					titleImage = var_114_1.titleImage,
					description = Engine.CBBHFCGDIC(var_114_1.description),
					productId = arg_114_0,
					contentLong = Engine.CBBHFCGDIC(var_114_1.description),
					firstPartyBundleId = var_114_1.id and tonumber(var_114_1.id) or nil,
					firstPartyProductID = arg_114_0,
					id = var_114_1.id and tonumber(var_114_1.id) or nil,
					uri = uri
				}

				table.insert(var_113_0, var_114_2)
			end
		end

		local var_113_3 = false
		local var_113_4 = InGameStore.GetCategoryProducts(arg_113_0, STORE.CortezCategory)

		if var_113_4 and #var_113_4 > 0 then
			for iter_113_0, iter_113_1 in ipairs(var_113_4) do
				for iter_113_2, iter_113_3 in ipairs(var_113_1) do
					if iter_113_1.productId == iter_113_3 then
						var_113_2(iter_113_1.productId, iter_113_1.status ~= InGameStoreProductStatus.NOT_OWNED)
					end
				end
			end
		end
	end

	return var_113_0
end

function STORE.IsExchangePopupAllowed(arg_115_0, arg_115_1)
	if arg_115_1.exchangeID == STORE.ZeusTitleIDs.ZEUS_STANDARD then
		return STORE.IsZeusStandardExchangePopupAllowed(arg_115_0)
	end

	return true
end

function STORE.IsZeusStandardExchangePopupAllowed(arg_116_0)
	return not STORE.IsZeusProductOwned(arg_116_0, STORE.ZeusUltimateID)
end

function STORE.GetActiveCODPointsCategory()
	if Dvar.IBEGCHEFE("NOKMRLMRPK") then
		return CONDITIONS.IsMagmaGameMode() and STORE.WZCODPointsCategory or STORE.CODPointsCategory
	else
		return STORE.CODPointsCategory
	end
end

function STORE.AreZeusLaunchProductsEnabled()
	return Dvar.IBEGCHEFE("LMROSLPPQR") == true
end

function STORE.GetVGPreOrderMastercraftRewardId()
	local var_119_0
	local var_119_1 = CONDITIONS.IsVanguardBetaEnded() and "Post_Beta" or "Beta_Active"

	if CONDITIONS.IsPC() then
		var_119_0 = STORE.VGPreOrderMastercraftRewardIDs[var_119_1].PC
	elseif CONDITIONS.IsPS4() then
		var_119_0 = STORE.VGPreOrderMastercraftRewardIDs[var_119_1].PS
	else
		var_119_0 = STORE.VGPreOrderMastercraftRewardIDs[var_119_1].XB
	end

	return var_119_0
end

function STORE.IsVanguardBundle(arg_120_0)
	assert(arg_120_0)

	if not arg_120_0 then
		return
	end

	local var_120_0 = STORE.GetFirstPartyProductID(arg_120_0)

	return var_120_0 == STORE.VanguardTrialID or var_120_0 == STORE.VanguardStandardID or var_120_0 == STORE.VanguardCrossGenID or var_120_0 == STORE.VanguardUltimateID
end

function STORE.IsVanguardOwned(arg_121_0)
	assert(arg_121_0)

	if STORE.IsCatalogReady(arg_121_0) then
		local var_121_0 = false

		for iter_121_0, iter_121_1 in pairs(STORE.VanguardProductIDs) do
			local var_121_1 = InGameStore.GetProduct(arg_121_0, iter_121_0)

			if var_121_1 and var_121_1.status ~= InGameStoreProductStatus.NOT_OWNED then
				return true
			end

			if var_121_1 ~= nil then
				var_121_0 = var_121_0 or true
			end
		end

		if var_121_0 then
			return false
		else
			DebugPrint("STORE.IsVanguardOwned: Did not find Vanguard product in InGameStore, returning nil")

			return nil
		end
	else
		DebugPrint("STORE.IsVanguardOwned: Catalog is not ready, returning nil")

		return nil
	end
end

function STORE.IsVanguardAvailable(arg_122_0)
	assert(arg_122_0)

	if STORE.IsCatalogReady(arg_122_0) then
		for iter_122_0, iter_122_1 in pairs(STORE.VanguardProductIDs) do
			if InGameStore.GetProduct(arg_122_0, iter_122_0) ~= nil then
				return true
			end
		end
	end

	return false
end

function STORE.IsCortezBundle(arg_123_0)
	assert(arg_123_0)

	if not arg_123_0 then
		return
	end

	local var_123_0 = STORE.GetFirstPartyProductID(arg_123_0)

	return var_123_0 == STORE.CortezStandardID or var_123_0 == STORE.CortezUltimateID or var_123_0 == STORE.CortezUpgradeToUltimateID
end

function STORE.IsCortezAvailable(arg_124_0)
	assert(arg_124_0)

	if STORE.IsCatalogReady(arg_124_0) then
		for iter_124_0, iter_124_1 in pairs(STORE.CortezProductIDs) do
			if InGameStore.GetProduct(arg_124_0, iter_124_0) ~= nil then
				return true
			end
		end
	end

	return false
end

function STORE.IsCortezOwned(arg_125_0)
	assert(arg_125_0)

	if CONDITIONS.IsCZStandardOrCrossGenOwned(arg_125_0) or CONDITIONS.IsCZVaultOwned(arg_125_0) then
		return true
	end

	if STORE.IsCatalogReady(arg_125_0) then
		local var_125_0 = false

		for iter_125_0, iter_125_1 in pairs(STORE.CortezProductIDs) do
			local var_125_1 = InGameStore.GetProduct(arg_125_0, iter_125_0)

			if var_125_1 and var_125_1.status ~= InGameStoreProductStatus.NOT_OWNED then
				return true
			end

			if var_125_1 ~= nil then
				var_125_0 = var_125_0 or true
			end
		end

		if var_125_0 then
			return false
		else
			DebugPrint("STORE.IsCortezOwned: Did not find Cortez product in InGameStore, returning nil")

			return nil
		end
	else
		DebugPrint("STORE.IsCortezOwned: Catalog is not ready, returning nil")

		return nil
	end
end

STORE.CachedSchedule = nil
STORE.CachedRecommendations = {}
STORE.CachedCategoryLists = {}
STORE.CachedCategoryDvarValue = {}

function STORE.GetCategoryItemIDs(arg_126_0, arg_126_1)
	if STORE.CachedCategoryLists[arg_126_0] and STORE.CachedCategoryLists[arg_126_0][arg_126_1.id] and STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id][1] == Dvar.CFHDGABACF("LSRQOQNRMM") and STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id][2] == Dvar.IBEGCHEFE("OKMSPKPMLO") and STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id][3] == Dvar.DHEEJCCJBH("LQQSPONNOK") and STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id][4] == Dvar.DHEEJCCJBH("MMOOTLNTNR") then
		return STORE.CachedCategoryLists[arg_126_0][arg_126_1.id]
	end

	DebugPrint("STORE.GetCategoryItemIDs evaluate cache " .. tostring(arg_126_1.id))

	if not STORE.CachedSchedule then
		local var_126_0 = Store.EHGIGBJJC()
		local var_126_1 = Engine.EHGIGBJJC(var_126_0)

		if var_126_1.scheduleFilename then
			local var_126_2 = var_126_1.scheduleFilename

			STORE.CachedSchedule = Engine.DBABFCGGIC(var_126_2)
		end
	end

	local var_126_3 = STORE.CachedSchedule

	if not STORE.CachedRecommendations[arg_126_0] then
		STORE.CachedRecommendations[arg_126_0] = STORE.CheckForPersonalRecommendations(arg_126_0)
	end

	local var_126_4 = STORE.CachedRecommendations[arg_126_0]
	local var_126_5 = ""

	if not Dvar.IBEGCHEFE("OKMSPKPMLO") then
		if var_126_3 then
			var_126_5 = STORE.GetScheduledProductsForCategory(arg_126_1, var_126_3)
		end

		local var_126_6 = ""

		if arg_126_1.justForYou and var_126_4 then
			({
				items = var_126_4
			}).isEnabled = true
			var_126_6 = var_126_4
		elseif arg_126_1.commsLocationId then
			var_126_6 = Store.JGBAJAECG(arg_126_1.commsLocationId)

			if var_126_6 then
				local var_126_7 = split(var_126_6, ",")
				local var_126_8 = STORE.TrimRecommendationsByBlacklistedItems(var_126_7)

				var_126_6 = table.concat(var_126_8, ",")
			end
		end

		var_126_5 = STORE.FormatRecommendationItems(var_126_5 .. "," .. var_126_6)
	end

	if arg_126_1.idPubVar then
		local var_126_9 = Dvar.DHEEJCCJBH(arg_126_1.idPubVar) or ""

		var_126_5 = STORE.FormatRecommendationItems(var_126_5 .. "," .. var_126_9)
	end

	if STORE.CategoryType[arg_126_1.id] == STORE.CategoryType.featured and STORE.ShouldModifyFeaturedItems(arg_126_0) then
		var_126_5 = STORE.GetPriorityFeaturedItems() .. "," .. var_126_5
	end

	local var_126_10 = {}
	local var_126_11 = split(var_126_5, ",")

	for iter_126_0 = 1, #var_126_11 do
		local var_126_12 = tonumber(var_126_11[iter_126_0])

		table.insert(var_126_10, var_126_12)
	end

	if not STORE.CachedCategoryDvarValue[arg_126_0] then
		STORE.CachedCategoryDvarValue[arg_126_0] = {}
	end

	if not STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id] then
		STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id] = {}
	end

	STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id][1] = Dvar.CFHDGABACF("LSRQOQNRMM")
	STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id][2] = Dvar.IBEGCHEFE("OKMSPKPMLO")
	STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id][3] = Dvar.DHEEJCCJBH("LQQSPONNOK")
	STORE.CachedCategoryDvarValue[arg_126_0][arg_126_1.id][4] = Dvar.DHEEJCCJBH("MMOOTLNTNR")

	if not STORE.CachedCategoryLists[arg_126_0] then
		STORE.CachedCategoryLists[arg_126_0] = {}
	end

	STORE.CachedCategoryLists[arg_126_0][arg_126_1.id] = var_126_10

	return var_126_10
end

STORE.DLogRecordedInstalledDLCs = false

function STORE.DLogRecordInstalledDLCs(arg_127_0)
	if not STORE.DLogRecordedInstalledDLCs and CONDITIONS.IsPS4() and STORE.IsCatalogReady(arg_127_0) then
		local var_127_0 = InGameStore.GetCategoryProducts(arg_127_0, STORE.GameDLCCategory)

		if var_127_0 then
			local var_127_1 = {}

			for iter_127_0 = 1, #var_127_0 do
				local var_127_2 = var_127_0[iter_127_0]

				if var_127_2.status == InGameStoreProductStatus.INSTALLED then
					var_127_1[#var_127_1 + 1] = var_127_2.skuId
				end
			end

			Engine.CEJJDJJHIJ(arg_127_0, "dlog_event_installed_dlcs", {
				sku_ids = var_127_1
			})
		end
	end

	STORE.DLogRecordedInstalledDLCs = true
end

STORE.BundleBlacklistCache = {}
STORE.BundleBlacklistValue = nil

function STORE.IsBundleBlacklisted(arg_128_0)
	local var_128_0 = Dvar.DHEEJCCJBH("MKNQKSTPMR")

	if STORE.BundleBlacklistValue ~= var_128_0 then
		STORE.BundleBlacklistCache = {}

		local var_128_1 = split(var_128_0, ",")

		for iter_128_0 = 1, #var_128_1 do
			local var_128_2 = tonumber(var_128_1[iter_128_0])

			STORE.BundleBlacklistCache[var_128_2] = 1
		end

		STORE.BundleBlacklistValue = var_128_0
	end

	return STORE.BundleBlacklistCache[arg_128_0] ~= nil
end
