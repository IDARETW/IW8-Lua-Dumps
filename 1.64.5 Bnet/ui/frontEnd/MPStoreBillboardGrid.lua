module(..., package.seeall)

local var_0_0 = 3000
local var_0_1 = true

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = arg_1_2.items[1] or {}
	local var_1_2

	if arg_1_2.isFirstPartyCategory then
		local var_1_3 = {
			name = "MENU/FETCHING_STORE_DATA",
			asset = CONDITIONS.IsMagmaGameMode() and "wz_store_billboard_placeholder" or "mw_store_billboard_placeholder",
			buttonAction = function(arg_2_0, arg_2_1)
				if arg_1_0._catalogStatus ~= nil and arg_1_0._catalogStatus ~= InGameStoreCatalogStatus.READY then
					local var_2_0 = {
						message = arg_1_0._catalogFetchErrorMessage
					}

					LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_2_0, nil, false, true)
				end
			end
		}

		table.insert(var_1_0, var_1_3)
	elseif arg_1_2.idPubVar and var_1_1.layoutOnlyItem then
		local var_1_4 = STORE.GetCategoryItemIDs(arg_1_1, arg_1_2)

		if arg_1_2.justForYou and arg_1_0._recommendations then
			local var_1_5 = {
				items = arg_1_0._recommendations
			}

			var_1_5.isEnabled = true
			arg_1_0.recommendationData = var_1_5
		end

		local var_1_6 = 0

		arg_1_2.hasFirstPartyBundle = false

		for iter_1_0 = 1, #var_1_4 do
			local var_1_7 = var_1_4[iter_1_0]
			local var_1_8 = STORE.BundleAvailable(arg_1_1, var_1_7)
			local var_1_9 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_1_7)
			local var_1_10 = var_1_9 >= 0

			if var_1_8 and not var_1_10 then
				DebugPrint("Error: Bundle ID not found in " .. CSV.bundleIDs.file .. ": " .. var_1_7)
			end

			if var_1_8 and var_1_10 then
				local var_1_11 = LUI.DeepCopy(var_1_1)

				var_1_11.emptyCategory = false
				var_1_11.id = var_1_7

				local var_1_12 = {
					file = CSV.bundleIDs.file,
					cols = CSV.bundleIDs.cols
				}
				local var_1_13 = CSV.ReadRow(var_1_12, var_1_9)
				local var_1_14 = Dvar.IBEGCHEFE("NPQPKPKRTL")

				var_1_11.name = var_1_13.name
				var_1_11.asset = var_1_13.image
				var_1_11.description = STORE.GetBundleDescription(var_1_11.id, arg_1_0._totalCP)
				var_1_11.rarity = var_1_13.rarity
				var_1_11.bundleType = var_1_13.bundleType
				var_1_11.titleImage = var_1_13.titleImage
				var_1_11.currencyID = tonumber(var_1_13.currencyID)
				var_1_11.currencyAmount = tonumber(var_1_13.currencyAmount)
				var_1_11.discountPercent = var_1_13.discountPercent ~= "" and var_1_13.discountPercent
				var_1_11.firstPartyProductID = #var_1_13.firstPartyProductID > 0 and var_1_13.firstPartyProductID or nil
				var_1_11.purchaseEnd = var_1_13.purchaseEnd ~= "" and var_1_13.purchaseEnd or STORE.IsItemOnSale(var_1_11.id) and STORE.GetSaleTimer() ~= "" and STORE.GetSaleTimer() or nil
				var_1_11.gameSourceID = var_1_13.game
				var_1_11.hasOperatorMissions = (var_1_13.hasOperatorMissions ~= "" and tonumber(var_1_13.hasOperatorMissions) or 0) == 1

				if var_1_2 then
					if var_1_2 ~= var_1_11.gameSourceID then
						var_1_2 = "mixed"
					end
				else
					var_1_2 = var_1_11.gameSourceID
				end

				if not var_1_14 then
					var_1_11.purchaseEnd = nil
				end

				if var_1_11.purchaseEnd and STORE.SeasonTimestampMapping[var_1_11.purchaseEnd] then
					var_1_11.purchaseEnd = STORE.SeasonTimestampMapping[var_1_11.purchaseEnd]
				end

				if var_1_7 == tonumber(BATTLEPASS.GetTierSkipGiftID()) and BATTLEPASS.IsTierSkipGiftActive(arg_1_1) then
					var_1_11.purchaseEnd = BATTLEPASS.GetTierSkipGiftTimer()
				end

				local var_1_15, var_1_16, var_1_17 = STORE.GetCategoryTimeLeft(nil, var_1_11.purchaseEnd)

				if not var_1_11.purchaseEnd or var_1_15 > 0 then
					table.insert(var_1_0, var_1_11)

					var_1_6 = var_1_6 + 1
				end

				if var_1_11.firstPartyProductID then
					arg_1_2.hasFirstPartyBundle = true
				end
			end

			if var_1_6 == arg_1_2.numItemsShown then
				break
			end
		end
	end

	if #var_1_0 == 0 then
		local var_1_18 = LUI.DeepCopy(var_1_1)

		var_1_18.emptyCategory = true
		var_1_18.titleImage = nil
		var_1_18.purchaseEnd = nil
		var_1_18.asset = CONDITIONS.IsMagmaGameMode() and "wz_store_billboard_placeholder" or "mw_store_billboard_placeholder"
		var_1_18.name = "LUA_MENU/EMPTY"

		table.insert(var_1_0, var_1_18)
	end

	arg_1_2.rowGameSourceIDOrMixed = var_1_2
	arg_1_2.items = var_1_0
end

local function var_0_3(arg_3_0, arg_3_1)
	local var_3_0 = {
		controllerIndex = arg_3_1
	}

	LUI.FlowManager.RequestPopupMenu(arg_3_0, "CreatorCodePopup", true, controllerIndex, false, var_3_0)
	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0, var_4_1 = STORE.GetIndexForBundle(arg_4_1, arg_4_0._controllerIndex)

	if var_4_0 and var_4_1 and arg_4_0.BundlesGrid then
		local var_4_2 = arg_4_0._allCategoryData[var_4_0]
		local var_4_3 = LUI.FlowManager.GetPerControllerPersistentData(arg_4_0._controllerIndex)

		arg_4_0._selectedCategory = var_4_0
		var_4_3._selectedCategory = var_4_2.categoryIndex
		arg_4_0._selectedBundle = var_4_1

		arg_4_0.BundlesGrid:SetFocusedPosition({
			x = 0,
			y = var_4_0 - 1
		}, true)

		local var_4_4 = LUI.FlowManager.GetScopedData(arg_4_0)

		var_4_4.focusForGifting = arg_4_3

		arg_4_0:BillboardCategoryButtonAction(element, event, var_4_2)

		var_4_4.focusForGifting = nil
	else
		if arg_4_3 and STORE.IsBundleOwned(arg_4_0._controllerIndex, arg_4_1) then
			LUI.FlowManager.RequestAddMenu("BundleLockerMenu", true, arg_4_0._controllerIndex, false, {
				bundleIdForGifting = arg_4_1
			})

			return
		end

		LUI.FlowManager.RequestPopupMenu(arg_4_0, "PopupOK", true, arg_4_0._controllerIndex, false, {
			message = Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_NOT_AVAILABLE")
		})
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = STORE.GetCategoryIndex(arg_5_0._controllerIndex, arg_5_1)

	if var_5_0 and arg_5_0.BundlesGrid then
		local var_5_1 = arg_5_0._allCategoryData[var_5_0]
		local var_5_2 = LUI.FlowManager.GetPerControllerPersistentData(arg_5_0._controllerIndex)

		arg_5_0._selectedCategory = var_5_0
		var_5_2._selectedCategory = var_5_1.categoryIndex

		arg_5_0.BundlesGrid:SetFocusedPosition({
			x = 0,
			y = var_5_0 - 1
		}, true)
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = arg_6_0._selectedBundle or 1
	local var_6_1 = arg_6_3.items[var_6_0]
	local var_6_2 = var_6_1.id

	if var_6_1.emptyCategory then
		arg_6_0._startPurchaseImmediately = false

		return
	end

	local var_6_3 = LUI.FlowManager.GetScopedData(arg_6_0)

	var_6_3.selectedBundleIndex = var_6_0

	if arg_6_3.isFirstPartyCategory then
		var_6_3.firstPartyColumnIndex = var_6_0

		if var_6_1.buttonAction then
			arg_6_0._startPurchaseImmediately = false

			var_6_1.buttonAction(arg_6_1, arg_6_2)

			return
		end
	else
		var_6_3.firstPartyColumnIndex = nil
	end

	if not arg_6_0._storeEnterComplete then
		QUARTERMASTER.RecordStoreEnterEvent(arg_6_0._controllerIndex, arg_6_0._storeLayout, arg_6_0.recommendationData, arg_6_0._sourceMenu, arg_6_0._allCategoryData)
		QUARTERMASTER.BeginMenuBrowseEvent(arg_6_0._controllerIndex, arg_6_3, arg_6_3.items[1], arg_6_0._storeLayout, arg_6_0.recommendationData)

		arg_6_0._storeEnterComplete = true
	end

	QUARTERMASTER.RecordMenuBrowseEvent(arg_6_0._controllerIndex, true)
	STORE.MarkItemSeen(arg_6_0._controllerIndex, var_6_2)
	arg_6_0.BundlesGrid:RefreshContent()

	if var_6_1.firstPartyProductID then
		local var_6_4 = var_6_1.firstPartyProductID

		if STORE.IsGameUpsellBundle(var_6_2) then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "StoreGameUpsellPopup", true, arg_6_0._controllerIndex, false, {
				defaultProductId = var_6_4
			})
		elseif STORE.IsZeusBundle(var_6_2) then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "StoreGameUpsellPopup", true, arg_6_0._controllerIndex, false, {
				isZeus = true,
				defaultProductId = var_6_4
			})
		elseif STORE.IsVanguardBundle(var_6_2) then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "VGPreOrderPopup", true, arg_6_0._controllerIndex, false, {
				allowWeaponPreview = true,
				defaultProductId = var_6_4
			})
		elseif STORE.IsCortezBundle(var_6_2) then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "CortezPreorderPopup", true, arg_6_0._controllerIndex, false, {
				defaultProductId = var_6_4,
				cortezEntryPointMenu = STORE.CortezEntryPointMenu.FirstPartyBundle
			})
		elseif arg_6_0._catalogStatus == InGameStoreCatalogStatus.READY then
			if STORE.GetNumItemsInBundle(var_6_2) > 0 then
				local var_6_5 = STORE.GetFirstPartyBundleData(arg_6_0._controllerIndex, var_6_2, var_6_4)

				var_6_5.bundleIndex = var_6_0
				var_6_5.openGiftingPopup = var_6_3.focusForGifting

				LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_6_0._controllerIndex, false, var_6_5)
			else
				InGameStore.SelectProduct(arg_6_0._controllerIndex, var_6_4, InGameStorePurchaseType.BROWSE)
			end
		else
			local var_6_6 = {
				message = arg_6_0._catalogFetchErrorMessage
			}

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_6_6, nil, false, true)
		end

		return
	end

	local var_6_7 = {
		bundleID = var_6_1.id,
		rarity = var_6_1.rarity,
		description = var_6_1.description,
		bundleType = var_6_1.bundleType,
		titleImage = var_6_1.titleImage,
		currencyID = var_6_1.currencyID,
		currencyAmount = var_6_1.currencyAmount,
		startPurchaseImmediately = arg_6_0._startPurchaseImmediately,
		timerValue = var_6_1.purchaseEnd,
		bundleIndex = var_6_0,
		positionInGrid = arg_6_0._positionInGrid,
		categoryIndex = arg_6_3.categoryIndex,
		categoryName = arg_6_3.id,
		storeLayout = arg_6_0._storeLayout,
		sourceMenu = arg_6_0._sourceMenu,
		recommendationData = arg_6_0.recommendationData,
		openGiftingPopup = var_6_3.focusForGifting
	}

	arg_6_0._startPurchaseImmediately = false

	if not arg_6_3.justForYou then
		var_6_7.timerPubVar = arg_6_3.timerPubVar
	end

	if Dvar.IBEGCHEFE("SKLSORKTK") and not BATTLEPASS.IsOwned(arg_6_0._controllerIndex) and STORE.BundleContainsBattlePass(var_6_1.id) then
		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_6_0._controllerIndex, false, {
			purchaseBattlePassInStore = true
		})
	else
		LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_6_0._controllerIndex, false, var_6_7)
	end
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0
	local var_7_1 = InGameStore.GetProduct(arg_7_1, arg_7_2)

	if var_7_1 ~= nil and var_7_1.status == InGameStoreProductStatus.NOT_OWNED then
		local var_7_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_7_1.productId, CSV.bundleIDs.cols.image)
		local var_7_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_7_1.productId, CSV.bundleIDs.cols.titleImage)

		if #var_7_2 == 0 or #var_7_3 == 0 then
			local var_7_4 = var_7_1.productId .. (Engine.CIEGIACHAE() and "_ps4" or Engine.BAHIIBFDDG() and "_xb3" or "_pc")

			var_7_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_7_4, CSV.bundleIDs.cols.image)
			var_7_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_7_4, CSV.bundleIDs.cols.titleImage)
		end

		if #var_7_2 > 0 and #var_7_3 > 0 then
			var_7_0 = {
				titleImage = var_7_3,
				asset = var_7_2,
				name = var_7_1.title,
				buttonAction = function(arg_8_0, arg_8_1)
					STORE.GoToStore(arg_7_1, arg_7_0:GetCurrentMenu().id, arg_8_0.id, var_7_1.productId)
				end
			}
		end
	end

	return var_7_0
end

local function var_0_8(arg_9_0, arg_9_1)
	arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items = {}

	local var_9_0 = InGameStore.GetCategoryProducts(arg_9_1, STORE.GetActiveCODPointsCategory())
	local var_9_1 = {
		asset = "mw_store_billboard_cod_points",
		name = "INGAMESTORE/CATEGORY_CODPOINTS",
		titleImage = "mw_store_title_cod_points",
		buttonAction = function(arg_10_0, arg_10_1)
			STORE.GoToStore(arg_9_1, arg_9_0:GetCurrentMenu().id, arg_10_0.id, var_9_0[1].productId)
		end
	}

	table.insert(arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items, var_9_1)

	local var_9_2 = Dvar.DHEEJCCJBH("LPNPSRNSMQ") or ""
	local var_9_3 = split(var_9_2, ",")

	for iter_9_0 = 1, #var_9_3 do
		local var_9_4 = var_0_7(arg_9_0, arg_9_1, var_9_3[iter_9_0])

		if var_9_4 ~= nil then
			table.insert(arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items, var_9_4)

			if #arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items >= 4 then
				break
			end
		end
	end

	local var_9_5 = var_0_7(arg_9_0, arg_9_1, STORE.CortezStandardID)

	if var_9_5 == nil then
		var_9_5 = var_0_7(arg_9_0, arg_9_1, STORE.VanguardStandardID)
	end

	if var_9_5 == nil then
		var_9_5 = var_0_7(arg_9_0, arg_9_1, STORE.ZeusStandardID)
	end

	if var_9_5 ~= nil then
		if #arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items < 4 then
			table.insert(arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items, var_9_5)
		else
			arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items[4] = var_9_5
		end
	end

	local var_9_6 = {
		asset = "mw_store_billboard_franchise_store",
		name = "MENU/STORE_CAT_FRANCHISE",
		titleImage = "mw_store_title_franchise_store",
		buttonAction = function(arg_11_0, arg_11_1)
			STORE.GoToStore(arg_9_1, arg_9_0:GetCurrentMenu().id, arg_11_0.id)
		end
	}

	table.insert(arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items, var_9_6)
	arg_9_0:dispatchEventToChildren({
		name = "categoryTimerUpdate"
	})

	if arg_9_0._allCategoryData[#arg_9_0._allCategoryData].isFirstPartyCategory and arg_9_0._selectedCategory == arg_9_0._allCategoryData[#arg_9_0._allCategoryData].categoryIndex then
		local var_9_7 = arg_9_0.BundlesGrid:GetElementAtPosition(0, arg_9_0._selectedCategory - 1)

		if var_9_7 then
			local var_9_8 = LUI.FlowManager.GetScopedData(arg_9_0)
			local var_9_9 = var_9_7.RowGrid

			if not var_9_8.firstPartyColumnIndex or var_9_8.firstPartyColumnIndex == 1 then
				var_9_9:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_9_9:SetFocusedPosition({
					y = 0,
					x = var_9_8.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_9(arg_12_0, arg_12_1)
	if STORE.IsCatalogReady(arg_12_1) then
		return
	end

	if Dvar.IBEGCHEFE("TNMTRNOQT") then
		arg_12_0._allCategoryData[STORE.GetZeusCategoryIndex()] = {
			isFirstPartyCategory = true,
			name = "INGAMESTORE/CATEGORY_ZEUS",
			placeholderCategoryID = STORE.ZeusCategoryID
		}
	end

	if Dvar.IBEGCHEFE("online_store_x2_category_enabled") then
		arg_12_0._allCategoryData[STORE.GetX2CategoryIndex()] = {
			isFirstPartyCategory = true,
			name = "MENU/STORE_CAT_X2",
			placeholderCategoryID = STORE.X2CategoryID
		}
	end

	if Dvar.IBEGCHEFE("LMMPLKNTMP") then
		arg_12_0._allCategoryData[STORE.GetCortezCategoryIndex()] = {
			isFirstPartyCategory = true,
			name = "STORE_FLAVOR_WZ335/CATEGORY_CORTEZ",
			placeholderCategoryID = STORE.CortezCategoryID
		}
	end
end

local function var_0_10(arg_13_0, arg_13_1)
	for iter_13_0 = 1, #arg_13_0._allCategoryData do
		local var_13_0 = arg_13_0._allCategoryData[iter_13_0]

		if var_13_0.placeholderCategoryID and var_13_0.placeholderCategoryID == arg_13_1 then
			table.remove(arg_13_0._allCategoryData, iter_13_0)

			return
		end
	end
end

local function var_0_11(arg_14_0, arg_14_1)
	local var_14_0 = STORE.GetCategoryIndexWithFanchiseItems(arg_14_0._allCategoryData, STORE.ZeusCategoryID)
	local var_14_1 = arg_14_0._allCategoryData[var_14_0] and arg_14_0._allCategoryData[var_14_0].id

	if not var_14_1 or STORE.CategoryType[var_14_1] ~= STORE.CategoryType.zeus_preorder then
		DebugPrint("Zeus category missing from allCategoryData")

		return
	end

	arg_14_0._allCategoryData[var_14_0].items = STORE.GetZeusCategoryData(arg_14_1)

	if #arg_14_0._allCategoryData[var_14_0].items == 0 then
		DebugPrint("Zeus category contains no items")

		return
	end

	arg_14_0:ClearPlaceholderFromCategory(STORE.ZeusCategoryID)

	local var_14_2 = LUI.FlowManager.GetScopedData(arg_14_0)

	for iter_14_0 = 1, #arg_14_0._allCategoryData[var_14_0].items do
		arg_14_0._allCategoryData[var_14_0].items[iter_14_0].buttonAction = function(arg_15_0, arg_15_1)
			var_14_2.openedZeusUpsell = true

			LUI.FlowManager.RequestAddMenu("StoreGameUpsellPopup", true, arg_14_1, false, {
				preFetched = true,
				isZeus = true,
				defaultProductId = arg_14_0._allCategoryData[var_14_0].items[iter_14_0].productId
			}, true)
		end
	end

	if (arg_14_0._selectedCategory and arg_14_0._selectedCategory - arg_14_0._allCategoryData[var_14_0].categoryIndex) == 1 then
		arg_14_0.BundlesGrid:RefreshContent()
	else
		arg_14_0:dispatchEventToChildren({
			name = "categoryTimerUpdate"
		})
	end

	if arg_14_0._allCategoryData[var_14_0].isFirstPartyCategory and arg_14_0._selectedCategory == arg_14_0._allCategoryData[var_14_0].categoryIndex then
		local var_14_3 = arg_14_0.BundlesGrid:GetElementAtPosition(0, arg_14_0._selectedCategory - 1)

		if var_14_3 then
			local var_14_4 = LUI.FlowManager.GetScopedData(arg_14_0)
			local var_14_5 = var_14_3.RowGrid

			if not var_14_4.firstPartyColumnIndex or var_14_4.firstPartyColumnIndex == 1 then
				var_14_5:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_14_5:SetFocusedPosition({
					y = 0,
					x = var_14_4.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_12(arg_16_0, arg_16_1)
	local var_16_0 = STORE.GetCategoryIndexWithFanchiseItems(arg_16_0._allCategoryData, STORE.X2CategoryID)
	local var_16_1 = arg_16_0._allCategoryData
	local var_16_2 = arg_16_0._allCategoryData[var_16_0] and arg_16_0._allCategoryData[var_16_0].id

	if not var_16_2 or STORE.CategoryType[var_16_2] ~= STORE.CategoryType.x2_preorder then
		DebugPrint("X2 category missing from allCategoryData")

		return
	end

	arg_16_0._allCategoryData[var_16_0].items = {}

	local var_16_3 = STORE.GetVanguardCategoryData(arg_16_1)

	for iter_16_0, iter_16_1 in ipairs(var_16_3) do
		if not iter_16_1.owned then
			table.insert(arg_16_0._allCategoryData[var_16_0].items, iter_16_1)
		end
	end

	if #arg_16_0._allCategoryData[var_16_0].items == 0 then
		DebugPrint("Vanguard category contains no items")

		return
	end

	arg_16_0:ClearPlaceholderFromCategory(STORE.X2CategoryID)

	local var_16_4 = LUI.FlowManager.GetScopedData(arg_16_0)

	for iter_16_2 = 1, #arg_16_0._allCategoryData[var_16_0].items do
		arg_16_0._allCategoryData[var_16_0].items[iter_16_2].buttonAction = function(arg_17_0, arg_17_1)
			var_16_4.openedX2Upsell = true

			local var_17_0 = arg_16_0._allCategoryData[var_16_0].items[iter_16_2]

			if var_17_0.productId == STORE.VanguardTrialID then
				if Engine.DBFCJBDJEC() then
					STORE.GoToX2InBattleNet(arg_16_1)
				elseif var_17_0.uri ~= nil then
					Engine.CBEBCGFAIE(arg_16_1, var_17_0.uri)
				else
					InGameStore.SelectProduct(arg_16_1, var_17_0.productId, InGameStorePurchaseType.BROWSE)
				end
			else
				LUI.FlowManager.RequestPopupMenu(arg_16_0, "VGPreOrderPopup", true, arg_16_0._controllerIndex, false, {
					allowWeaponPreview = true,
					defaultProductId = var_17_0.productId
				})
			end
		end
	end

	if (arg_16_0._selectedCategory and arg_16_0._selectedCategory - arg_16_0._allCategoryData[var_16_0].categoryIndex) == 1 then
		arg_16_0.BundlesGrid:RefreshContent()
	else
		arg_16_0:dispatchEventToChildren({
			name = "categoryTimerUpdate"
		})
	end

	if arg_16_0._allCategoryData[var_16_0].isFirstPartyCategory and arg_16_0._selectedCategory == arg_16_0._allCategoryData[var_16_0].categoryIndex then
		local var_16_5 = arg_16_0.BundlesGrid:GetElementAtPosition(0, arg_16_0._selectedCategory - 1)

		if var_16_5 then
			local var_16_6 = LUI.FlowManager.GetScopedData(arg_16_0)
			local var_16_7 = var_16_5.RowGrid

			if not var_16_6.firstPartyColumnIndex or var_16_6.firstPartyColumnIndex == 1 then
				var_16_7:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_16_7:SetFocusedPosition({
					y = 0,
					x = var_16_6.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_13(arg_18_0, arg_18_1)
	local var_18_0 = STORE.GetCategoryIndexWithFanchiseItems(arg_18_0._allCategoryData, STORE.CortezCategoryID)
	local var_18_1 = arg_18_0._allCategoryData
	local var_18_2 = arg_18_0._allCategoryData[var_18_0] and arg_18_0._allCategoryData[var_18_0].id

	if not var_18_2 or STORE.CategoryType[var_18_2] ~= STORE.CategoryType.cortez_preorder then
		DebugPrint("Cortez category missing from allCategoryData")

		return
	end

	arg_18_0._allCategoryData[var_18_0].items = {}

	local var_18_3 = STORE.GetCortezCategoryData(arg_18_1)
	local var_18_4 = false

	for iter_18_0, iter_18_1 in ipairs(var_18_3) do
		if not iter_18_1.owned then
			table.insert(arg_18_0._allCategoryData[var_18_0].items, iter_18_1)
		elseif iter_18_1.owned and (iter_18_1.productId == STORE.CortezVaultID or iter_18_1.productId == STORE.CortezUpgradeToUltimateID) then
			DebugPrint("Cortez Vault owned. Excluding Cortez category!")

			var_18_4 = true

			break
		end
	end

	if #arg_18_0._allCategoryData[var_18_0].items == 0 then
		DebugPrint("Cortez category contains no items")

		var_18_4 = true
	end

	if var_18_4 then
		table.remove(arg_18_0._allCategoryData, var_18_0)

		return
	end

	arg_18_0:ClearPlaceholderFromCategory(STORE.CortezCategoryID)

	local var_18_5 = LUI.FlowManager.GetScopedData(arg_18_0)

	for iter_18_2 = 1, #arg_18_0._allCategoryData[var_18_0].items do
		arg_18_0._allCategoryData[var_18_0].items[iter_18_2].buttonAction = function(arg_19_0, arg_19_1)
			var_18_5.openedCortezUpsell = true

			local var_19_0 = arg_18_0._allCategoryData[var_18_0].items[iter_18_2]

			if var_19_0.productId == STORE.CortezTrialID then
				if Engine.DBFCJBDJEC() then
					STORE.GoToCortezInBattleNet(arg_18_1)
				elseif var_19_0.uri ~= nil then
					Engine.CBEBCGFAIE(arg_18_1, var_19_0.uri)
				else
					InGameStore.SelectProduct(arg_18_1, var_19_0.productId, InGameStorePurchaseType.BROWSE)
				end
			else
				LUI.FlowManager.RequestPopupMenu(arg_18_0, "CortezPreOrderPopup", true, arg_18_0._controllerIndex, false, {
					allowWeaponPreview = true,
					defaultProductId = var_19_0.productId,
					cortezEntryPointMenu = STORE.CortezEntryPointMenu.InGameStore
				})
			end
		end
	end

	if (arg_18_0._selectedCategory and arg_18_0._selectedCategory - arg_18_0._allCategoryData[var_18_0].categoryIndex) == 1 then
		arg_18_0.BundlesGrid:RefreshContent()
	else
		arg_18_0:dispatchEventToChildren({
			name = "categoryTimerUpdate"
		})
	end

	if arg_18_0._allCategoryData[var_18_0].isFirstPartyCategory and arg_18_0._selectedCategory == arg_18_0._allCategoryData[var_18_0].categoryIndex then
		local var_18_6 = arg_18_0.BundlesGrid:GetElementAtPosition(0, arg_18_0._selectedCategory - 1)

		if var_18_6 then
			local var_18_7 = LUI.FlowManager.GetScopedData(arg_18_0)
			local var_18_8 = var_18_6.RowGrid

			if not var_18_7.firstPartyColumnIndex or var_18_7.firstPartyColumnIndex == 1 then
				var_18_8:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_18_8:SetFocusedPosition({
					y = 0,
					x = var_18_7.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_14(arg_20_0, arg_20_1)
	arg_20_0._allCategoryData = STORE.GetCategoryData(arg_20_1, arg_20_0._allCategoryData)

	local var_20_0 = (CONDITIONS.IsWZStoreDisabled() and CONDITIONS.IsMagmaGameMode()) ~= true

	if var_20_0 then
		for iter_20_0 = 1, #arg_20_0._allCategoryData do
			arg_20_0._allCategoryData[iter_20_0].categoryIndex = iter_20_0
		end
	else
		local var_20_1

		for iter_20_1 = 1, #arg_20_0._allCategoryData do
			if arg_20_0._allCategoryData[iter_20_1].id == "cortez_preorder" then
				var_20_1 = arg_20_0._allCategoryData[iter_20_1]
				var_20_1.categoryIndex = 1
			end
		end

		arg_20_0._allCategoryData = {
			var_20_1
		}
	end

	if var_20_0 then
		var_0_8(arg_20_0, arg_20_1)
		var_0_11(arg_20_0, arg_20_1)
		var_0_12(arg_20_0, arg_20_1)
	end

	var_0_13(arg_20_0, arg_20_1)
	arg_20_0.BundlesGrid:SetNumRows(#arg_20_0._allCategoryData)
	arg_20_0.BundlesGrid:RefreshContent()

	local var_20_2 = LUI.FlowManager.GetPerControllerPersistentData(arg_20_1)

	if not var_20_2._hasEnteredStore and #arg_20_0._allCategoryData >= 1 then
		var_20_2._hasEnteredStore = true

		local var_20_3 = arg_20_0._allCategoryData[1]
		local var_20_4 = var_20_3.items

		if var_20_4 and #var_20_4 > 0 then
			local var_20_5 = var_20_4[1]

			arg_20_0.BillboardItem:UpdateBillboard(var_20_5, var_20_3.isFirstPartyCategory)
			arg_20_0.BillboardItem:SetGiftPromtButtonActive(GIFT.IsItemGiftable(var_20_3.id))

			arg_20_0._selectedCategory = var_20_3.categoryIndex
			var_20_2._selectedCategory = var_20_3.categoryIndex
			arg_20_0._selectedBundle = 1
		end
	end

	arg_20_0:dispatchEventToChildren({
		name = "categoryTimerUpdate"
	})
end

local function var_0_15(arg_21_0, arg_21_1)
	InGameStore.FetchCatalog(arg_21_1, false, true)

	arg_21_0._catalogStatus = InGameStore.GetCatalogStatus(arg_21_1)
	arg_21_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE")

	local var_21_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "refresh_timer",
			controllerIndex = arg_21_1
		}
	})

	var_21_0.id = "refreshTimer"

	arg_21_0:addElement(var_21_0)

	arg_21_0._refreshTimer = var_21_0

	arg_21_0:registerEventHandler("refresh_timer", function(arg_22_0, arg_22_1)
		local var_22_0 = InGameStore.GetCatalogStatus(arg_22_1.controllerIndex)
		local var_22_1 = false

		if arg_21_0._catalogStatus == InGameStoreCatalogStatus.FETCHING and var_22_0 == InGameStoreCatalogStatus.READY then
			arg_21_0:dispatchEventToChildren({
				catalogFetched = true,
				name = "categoryTimerUpdate"
			})
		end

		arg_21_0._catalogStatus = var_22_0

		if arg_21_0._catalogStatus == InGameStoreCatalogStatus.READY then
			var_0_14(arg_21_0, arg_21_1)

			var_22_1 = true
		elseif arg_21_0._catalogStatus == InGameStoreCatalogStatus.ERROR then
			var_22_1 = true

			if Engine.DBFCJBDJEC() then
				local var_22_2 = Engine.BIAFEJHHDD()

				if var_22_2 ~= nil then
					local var_22_3 = Engine.JCBDICCAH(var_22_2)

					arg_21_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_22_3)

					Engine.DCFIDJGACA()
				else
					arg_21_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_22_4 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				arg_21_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_22_4)
			end

			Engine.DHCGHHBHCH()

			local var_22_5 = (CONDITIONS.IsWZStoreDisabled() and CONDITIONS.IsMagmaGameMode()) ~= true

			if Commerce.CCIEAECGHB() then
				if var_22_5 then
					var_0_8(arg_21_0, arg_21_1)
					var_0_11(arg_21_0, arg_21_1)
					var_0_12(arg_21_0, arg_21_1)
				end

				var_0_13(arg_21_0, arg_21_1)
			else
				arg_21_0._allCategoryData[#arg_21_0._allCategoryData].items[1].fetchingDataFailed = true

				arg_21_0:dispatchEventToChildren({
					name = "categoryTimerUpdate"
				})
			end
		end

		if var_22_1 then
			arg_22_0._refreshTimer:closeTree()

			arg_22_0._refreshTimer = nil
		end
	end)
end

local function var_0_16(arg_23_0)
	local var_23_0 = {}
	local var_23_1 = "DefaultSequence"
	local var_23_2 = "DefaultSequence"

	if arg_23_0._selectedCategory > 1 then
		for iter_23_0 = arg_23_0._selectedCategory - 1, 1, -1 do
			table.insert(var_23_0, arg_23_0._allCategoryData[iter_23_0])
		end
	end

	if arg_23_0._selectedCategory < #arg_23_0._allCategoryData then
		for iter_23_1 = arg_23_0._selectedCategory + 1, #arg_23_0._allCategoryData do
			table.insert(var_23_0, arg_23_0._allCategoryData[iter_23_1])
		end
	end

	for iter_23_2 = 1, #var_23_0 do
		local var_23_3 = var_23_0[iter_23_2]

		var_23_3.hasNewItems = false
		var_23_3.hasFreeItems = false

		if var_0_1 and Dvar.IBEGCHEFE("LSOLLKOPQT") then
			var_23_3.hasFreeItems = STORE.CategoryHasFreeItems(arg_23_0._controllerIndex, var_23_3)
		end

		for iter_23_3 = 1, #var_23_3.items do
			local var_23_4 = var_23_3.items[iter_23_3]

			if var_23_4.id and not STORE.HasSeenItem(arg_23_0._controllerIndex, var_23_4.id) then
				var_23_3.hasNewItems = true

				break
			end
		end

		if var_23_3.categoryIndex < arg_23_0._selectedCategory then
			if var_23_3.hasFreeItems then
				var_23_1 = "Free"
			elseif var_23_1 ~= "Free" and var_23_3.hasNewItems then
				var_23_1 = "New"
			end
		elseif var_23_3.categoryIndex > arg_23_0._selectedCategory then
			if var_23_3.hasFreeItems then
				var_23_2 = "Free"
			elseif var_23_2 ~= "Free" and var_23_3.hasNewItems then
				var_23_2 = "New"
			end
		end
	end

	if var_23_1 == "Free" then
		arg_23_0.ArrowUp:SetFreeState()
	else
		arg_23_0.ArrowUp:ClearState()
		ACTIONS.AnimateSequence(arg_23_0.ArrowUp, var_23_1)
	end

	if var_23_2 == "Free" then
		arg_23_0.ArrowDown:SetFreeState()
	else
		arg_23_0.ArrowDown:ClearState()
		ACTIONS.AnimateSequence(arg_23_0.ArrowDown, var_23_2)
	end
end

local function var_0_17(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.BillboardCategoryButtonAction = var_0_6
	arg_24_0.InjectPlaceholdersForFirstPartyCategories = var_0_9
	arg_24_0.ClearPlaceholderFromCategory = var_0_10
	arg_24_0._gridChildMouseFocusCount = 0

	function arg_24_0.FocusBundleByID(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
		var_0_4(arg_24_0, arg_25_1, arg_25_2, arg_25_3)
	end

	function arg_24_0.FocusButtonByName(arg_26_0, arg_26_1)
		var_0_5(arg_24_0, arg_26_1)
	end

	ACTIONS.ScaleFullscreen(arg_24_0.Background)
	Engine.DHFCHIIJCA("quartermaster")
	arg_24_0.BundlesGrid:SetMask(arg_24_0.GridMask)

	local var_24_0 = CONDITIONS.IsGiftingEnabled() and "LUA_MENU/FRANCHISE_STORE_WITH_PROMPT_RS" or "LUA_MENU/FRANCHISE_STORE_WITH_PROMPT"

	arg_24_0.FranchiseStorePrompt:SetText(Engine.CBBHFCGDIC(var_24_0))
	arg_24_0:addElement(LOOT.GetLootFlareMaterialStreamer())

	arg_24_0._controllerIndex = arg_24_1
	arg_24_0._promotedItems = STORE.ParsePromotedItems(arg_24_1)
	arg_24_0._chaseItems = STORE.ParseChaseItems(arg_24_1)

	local var_24_1 = BATTLEPASS.GetCurrentCPRewards(arg_24_1)

	arg_24_0._totalCP = var_24_1 and var_24_1.totalCP or 0

	local var_24_2 = STORE.GetSaleTimer(arg_24_1)

	if var_24_2 and #var_24_2 > 0 and tonumber(var_24_2) > Engine.DEIDGHDBHD() and STORE.GetHighestDiscountPercentage(arg_24_1) > 0 then
		arg_24_0.SaleBanner:SetAlpha(1)
	else
		arg_24_0.SaleBanner:SetAlpha(0)
	end

	if CONDITIONS.IsStoreSalesBannerEnabled() then
		arg_24_0.SaleBanner:SetAlpha(0)
	end

	if Dvar.IBEGCHEFE("MLTTQSTKQS") then
		arg_24_0.GridMask:setImage(RegisterMaterial("stencil_mask"))
		arg_24_0.GridMask:SetBottom(-70 * _1080p)
	end

	var_0_15(arg_24_0, arg_24_1)

	if QUARTERMASTER.itemData then
		QUARTERMASTER.itemData = {}
	end

	function arg_24_0.BackButtonOverride(arg_27_0, arg_27_1)
		local var_27_0 = LUI.FlowManager.GetScopedData(arg_27_0)

		LUI.FlowManager.GetPerControllerPersistentData(arg_24_1)._selectedCategory = nil

		if var_27_0.useStandaloneStore then
			LUI.FlowManager.RequestLeaveMenu(arg_27_0)
		else
			local var_27_1 = arg_27_1.qualifier ~= "keyboard" and arg_27_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad
			local var_27_2 = arg_27_0:getParent()
			local var_27_3 = arg_27_1.controller or arg_24_1
			local var_27_4 = TAB.GetIndex(TAB.MP.PLAY)

			if arg_24_0._returnToEventTabFromStore then
				var_27_4 = TAB.GetIndex(TAB.MP.EVENT)
			end

			var_27_2.Tabs:FocusTab(var_27_3, var_27_4, var_27_1)
		end

		return false
	end

	local function var_24_3(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4)
		local var_28_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_24_1)

		arg_24_0._categoryData = arg_28_2

		if arg_24_0.DisableAutoScrollTimer and not arg_24_0._autoScroll then
			arg_24_0.DisableAutoScrollTimer()
		end

		if arg_28_3 > #arg_28_2.items then
			arg_28_3 = 1
		end

		local var_28_1 = arg_28_2.items[arg_28_3]

		if arg_28_4 then
			local var_28_2 = arg_28_4:GetFocusPosition(LUI.DIRECTION.horizontal)

			if var_28_2 then
				var_28_1.positionInGrid = var_28_2 + 1
				arg_24_0._positionInGrid = var_28_1.positionInGrid
			end
		end

		if var_28_1.purchaseEnd then
			local var_28_3, var_28_4, var_28_5 = STORE.GetCategoryTimeLeft(nil, var_28_1.purchaseEnd)

			if var_28_3 <= 0 then
				arg_24_0:dispatchEventToChildren({
					expiredBundle = true,
					name = "categoryTimerUpdate"
				})

				return
			end
		end

		;(function()
			local var_29_0 = var_28_1 and var_28_1.emptyCategory or false

			if not arg_28_2.isFirstPartyCategory and not var_29_0 then
				arg_24_0._isItemGiftable = GIFT.IsItemGiftable(var_28_1.id)
			else
				arg_24_0._isItemGiftable = false
			end

			local var_29_1 = arg_24_0.BundlesGrid:GetCurrentMenu()
			local var_29_2 = arg_24_0._isItemGiftable and CONDITIONS.IsGiftingEnabled()

			arg_24_0.BillboardItem:SetGiftPromtButtonActive(var_29_2)
		end)()
		arg_24_0.BillboardItem:UpdateBillboard(var_28_1, arg_28_2.isFirstPartyCategory)

		if not arg_28_2.isFirstPartyCategory then
			if QUARTERMASTER.itemData and QUARTERMASTER.itemData.sessionId ~= nil then
				QUARTERMASTER.RecordMenuBrowseEvent(arg_24_1, false, arg_24_0._sourceMenu)
			end

			if arg_24_0._initialBrowse then
				if not arg_24_0._storeEnterComplete then
					QUARTERMASTER.RecordStoreEnterEvent(arg_24_1, arg_24_0._storeLayout, arg_24_0.recommendationData, arg_24_0._sourceMenu, arg_24_0._allCategoryData)

					arg_24_0._storeEnterComplete = true
				end

				QUARTERMASTER.BeginMenuBrowseEvent(arg_24_1, arg_28_2, var_28_1, arg_24_0._storeLayout, arg_24_0.recommendationData)
			else
				arg_24_0._initialBrowse = true
			end
		end

		local var_28_6 = arg_24_0._selectedCategory ~= arg_28_2.categoryIndex

		arg_24_0._selectedCategory = arg_28_2.categoryIndex
		var_28_0._selectedCategory = arg_28_2.categoryIndex
		arg_24_0._selectedBundle = arg_28_3

		local var_28_7 = (CONDITIONS.IsWZStoreDisabled() and CONDITIONS.IsMagmaGameMode()) ~= true

		if var_28_6 and var_28_7 then
			arg_24_0:dispatchEventToChildren({
				categoryChanged = true,
				name = "categoryTimerUpdate"
			})
			var_0_16(arg_24_0)
		elseif var_28_7 ~= true then
			arg_24_0.ArrowUp:SetAlpha(0)
			arg_24_0.ArrowDown:SetAlpha(0)
		end
	end

	local var_24_4 = Store.EHGIGBJJC()
	local var_24_5 = Engine.EHGIGBJJC(var_24_4)

	arg_24_0._allCategoryData = STORE.GetCategoryData(arg_24_1)
	arg_24_0._recommendations = STORE.CheckForPersonalRecommendations(arg_24_1)

	if var_24_5.scheduleFilename then
		local var_24_6 = var_24_5.scheduleFilename

		arg_24_0._storeSchedule = Engine.DBABFCGGIC(var_24_6)
	end

	if not arg_24_0._recommendations then
		arg_24_0.recommendationData = {
			isEnabled = false
		}
	end

	local var_24_7 = LUI.FlowManager.GetScopedData(arg_24_0)
	local var_24_8 = var_24_7.openedZeusUpsell and STORE.IsZeusOwned(arg_24_1)

	var_24_7.openedZeusUpsell = nil

	if var_24_8 then
		var_24_7.selectedBundleIndex = nil
		var_24_7.firstPartyColumnIndex = nil
	end

	if (CONDITIONS.IsWZStoreDisabled() and CONDITIONS.IsMagmaGameMode()) ~= true then
		arg_24_0._allCategoryData[#arg_24_0._allCategoryData + 1] = {
			isFirstPartyCategory = true,
			name = "MENU/STORE_CAT_FRANCHISE"
		}

		arg_24_0:InjectPlaceholdersForFirstPartyCategories(arg_24_1)
	end

	for iter_24_0 = 1, #arg_24_0._allCategoryData do
		local var_24_9 = arg_24_0._allCategoryData[iter_24_0]

		var_24_9.items = var_24_9.items or {}

		var_0_2(arg_24_0, arg_24_1, var_24_9)

		var_24_9.categoryIndex = iter_24_0
	end

	local var_24_10 = var_24_5.layoutType

	arg_24_0._storeLayout = var_24_10

	local var_24_11
	local var_24_12 = LUI.FlowManager.IsMenuOnTop("BRMainMenuStore") and "BladeMenu" or -1

	arg_24_0._sourceMenu = var_24_12
	arg_24_0._storeEnterComplete = false
	arg_24_0._initialBrowse = false
	arg_24_0:Wait(2000, true).onComplete = function()
		if not arg_24_0._storeEnterComplete then
			QUARTERMASTER.RecordStoreEnterEvent(arg_24_1, var_24_10, arg_24_0.recommendationData, var_24_12, arg_24_0._allCategoryData)

			arg_24_0._storeEnterComplete = true
		end
	end

	local function var_24_13(arg_31_0, arg_31_1)
		if arg_31_1 and arg_31_1.name then
			local var_31_0 = arg_31_1.items

			if not var_31_0 or not (#var_31_0 > 0) or var_31_0[1].emptyCategory then
				arg_31_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/X_TO_Y", Engine.CBBHFCGDIC(arg_31_1.name), Engine.CBBHFCGDIC("MENU/SOLD_OUT"))))
			else
				arg_31_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_31_1.name)))
			end
		else
			arg_31_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SOLD_OUT")))
		end

		arg_31_0:UpdateWZSnipeBar(arg_31_1.rowGameSourceIDOrMixed)
	end

	local function var_24_14(arg_32_0, arg_32_1, arg_32_2)
		local var_32_0 = arg_24_0._allCategoryData[arg_32_2 + 1]

		local function var_32_1()
			local var_33_0 = LUI.FlowManager.GetScopedData(arg_24_0)
			local var_33_1 = arg_24_0._selectedBundle or var_33_0.selectedBundleIndex or 1

			if var_33_1 > #var_32_0.items then
				var_33_1 = #var_32_0.items
			end

			var_33_0.selectedBundleIndex = nil

			return {
				y = 0,
				x = var_33_1 - 1
			}
		end

		arg_32_0.RowGrid:SetDefaultFocus(var_32_1)

		local function var_32_2(arg_34_0, arg_34_1, arg_34_2)
			local var_34_0 = var_32_0.items[arg_34_1 + 1]

			if not var_34_0 then
				DebugPrint("STORE SCROLL BUG: Column: " .. arg_34_1 .. ", Row: " .. arg_34_2)
				arg_34_0:registerEventHandler("button_over", function(arg_35_0, arg_35_1)
					return
				end)
				arg_34_0:registerEventHandler("button_action", function(arg_36_0, arg_36_1)
					return
				end)
				arg_34_0:registerEventHandler("mouseenter", function(arg_37_0, arg_37_1)
					return
				end)
				arg_34_0:registerEventHandler("mouseleave", function(arg_38_0, arg_38_1)
					return
				end)
				arg_34_0:registerEventHandler("categoryTimerUpdate", function(arg_39_0, arg_39_1)
					return
				end)
				arg_34_0:UpdateNewIndicator(0)

				return
			end

			arg_34_0:UpdateButton(var_34_0)
			arg_34_0:UpdateChaseItem(var_34_0, arg_24_0._chaseItems, var_32_0.isFirstPartyCategory)

			if not var_32_0.isFirstPartyCategory then
				if not var_34_0.emptyCategory and not STORE.HasSeenItem(arg_24_1, var_34_0.id) then
					arg_34_0:UpdateNewIndicator(1)
				else
					arg_34_0:UpdateNewIndicator(0)
				end
			else
				arg_34_0:UpdateNewIndicator(0)
			end

			arg_34_0:registerEventHandler("button_over", function(arg_40_0, arg_40_1)
				var_24_3(arg_40_0, arg_40_1, var_32_0, arg_34_1 + 1, arg_32_0.RowGrid)

				arg_24_0._focusedBundle = arg_40_0
			end)
			arg_34_0:registerEventHandler("button_action", function(arg_41_0, arg_41_1)
				arg_24_0:BillboardCategoryButtonAction(arg_41_0, arg_41_1, var_32_0)
			end)
			arg_34_0:registerEventHandler("mouseenter", function(arg_42_0, arg_42_1)
				arg_24_0._gridChildMouseFocusCount = arg_24_0._gridChildMouseFocusCount + 1
			end)
			arg_34_0:registerEventHandler("mouseleave", function(arg_43_0, arg_43_1)
				arg_24_0._gridChildMouseFocusCount = math.max(0, arg_24_0._gridChildMouseFocusCount - 1)
			end)
			arg_34_0:registerEventHandler("categoryTimerUpdate", function(arg_44_0, arg_44_1)
				if not arg_44_1.expiredBundle and var_34_0.purchaseEnd then
					local var_44_0, var_44_1, var_44_2 = STORE.GetCategoryTimeLeft(nil, var_34_0.purchaseEnd)

					if var_44_0 <= 0 then
						arg_24_0:dispatchEventToChildren({
							expiredBundle = true,
							name = "categoryTimerUpdate"
						})
					end
				end
			end)

			local var_34_1 = var_32_0.rowGameSourceIDOrMixed == "mixed" and var_34_0.gameSourceID or nil

			arg_34_0:UpdateWZSnipeBar(var_34_1)
		end

		arg_32_0.RowGrid:SetRefreshChild(var_32_2)

		arg_32_0._timerValue = nil
		arg_32_0._idPubVarString = nil

		arg_32_0:registerEventHandler("categoryTimerUpdate", function(arg_45_0, arg_45_1)
			local var_45_0 = var_32_0.categoryIndex == arg_24_0._selectedCategory

			if var_32_0.isFirstPartyCategory and not arg_45_1.firstPartyCategoryIgnoreUpdate then
				if not arg_45_1.categoryChanged then
					arg_32_0.RowGrid:SetNumRows(1)
					arg_32_0.RowGrid:SetNumColumns(#var_32_0.items)
					arg_32_0.RowGrid:RefreshContent()
				end

				if var_45_0 then
					arg_24_0.NoMoreItemsMessage:SetAlpha(0)
				end

				return
			end

			local var_45_1 = var_32_0.items
			local var_45_2 = var_45_1 and #var_45_1 > 0 and var_45_1[1] or nil

			if var_45_0 then
				if var_45_2 == nil or var_45_2.emptyCategory then
					arg_24_0.NoMoreItemsMessage:SetAlpha(1)
				else
					arg_24_0.NoMoreItemsMessage:SetAlpha(0)
				end
			end

			if not var_32_0.justForYou then
				local var_45_3, var_45_4, var_45_5 = STORE.GetCategoryTimeLeft(var_32_0.timerPubVar)

				if not arg_32_0._timerValue and var_32_0.timerPubVar and var_45_5 ~= "" then
					arg_32_0._timerValue = var_45_5
				end

				local var_45_6 = var_32_0.idPubVar and Dvar.DHEEJCCJBH(var_32_0.idPubVar) or ""

				if not arg_32_0._idPubVarString and var_45_6 ~= "" then
					arg_32_0._idPubVarString = var_45_6
				end

				local var_45_7 = arg_45_1.expiredBundle and var_45_0
				local var_45_8 = arg_45_1.catalogFetched
				local var_45_9 = arg_32_0._timerValue and arg_32_0._timerValue ~= var_45_5
				local var_45_10 = arg_32_0._idPubVarString and arg_32_0._idPubVarString ~= var_45_6
				local var_45_11 = arg_45_1.categoryChanged
				local var_45_12 = var_45_7 or var_45_8 or var_45_9 or var_45_10

				if var_45_12 or var_45_11 then
					var_0_2(arg_24_0, arg_24_1, var_32_0)

					if var_45_12 then
						arg_32_0.RowGrid:SetNumRows(1)
						arg_32_0.RowGrid:SetNumColumns(#var_32_0.items)
						arg_32_0.RowGrid:RefreshContent()
					end

					arg_32_0._timerValue = var_45_5
					arg_32_0._idPubVarString = var_32_0.idPubVarString

					if not arg_24_0._refocusing and (Dvar.IBEGCHEFE("LMKNLPNKTM") or var_45_7 or var_45_8 and var_32_0.hasFirstPartyBundle) then
						arg_24_0._refocusing = true

						arg_32_0.RowGrid:processEvent({
							name = "lose_focus"
						})
						arg_32_0.RowGrid:SetFocusedPosition({
							x = 0,
							y = 0
						}, true)

						arg_24_0._refocusing = false
					end
				end
			end

			var_24_13(arg_32_0, var_32_0)
		end)
		arg_32_0.RowGrid:SetNumRows(1)
		arg_32_0.RowGrid:SetNumColumns(#var_32_0.items)
		arg_32_0.RowGrid:RefreshContent()
		var_24_13(arg_32_0, var_32_0)
	end

	arg_24_0.BundlesGrid:SetRefreshChild(var_24_14)
	arg_24_0.BundlesGrid:SetNumColumns(1)
	arg_24_0.BundlesGrid:SetNumRows(#arg_24_0._allCategoryData)
	arg_24_0.BundlesGrid:RefreshContent()

	local var_24_15 = LUI.UITimer.new({
		interval = 1000,
		event = {
			firstPartyCategoryIgnoreUpdate = true,
			name = "categoryTimerUpdate"
		}
	})

	var_24_15.id = "timer"

	arg_24_0:addElement(var_24_15)

	local var_24_16 = LUI.UITimer.new({
		event = "autoScrollTimerUpdate",
		interval = var_0_0
	})

	var_24_16.id = "autoScrollTimer"

	arg_24_0:addElement(var_24_16)

	arg_24_0._autoScrollEnabled = true

	arg_24_0:registerEventHandler("autoScrollTimerUpdate", function(arg_46_0, arg_46_1)
		local var_46_0 = LUI.IsLastInputMouseNavigation(arg_24_1) and arg_24_0._gridChildMouseFocusCount > 0

		if arg_24_0._autoScrollEnabled and not var_46_0 and arg_24_0._selectedCategory and arg_24_0._selectedBundle and #arg_24_0._allCategoryData > 0 then
			local var_46_1 = arg_24_0._allCategoryData[arg_24_0._selectedCategory]
			local var_46_2 = arg_24_0._selectedBundle + 1

			if var_46_2 > #var_46_1.items then
				var_46_2 = 1
			end

			local var_46_3 = arg_24_0.BundlesGrid:GetElementAtPosition(0, arg_24_0._selectedCategory - 1)

			if var_46_3 then
				local var_46_4 = var_46_3.RowGrid

				arg_24_0._autoScroll = true

				var_46_4:SetFocusedPosition({
					y = 0,
					x = var_46_2 - 1
				}, false)

				arg_24_0._autoScroll = false
			end
		end
	end)

	arg_24_0._autoScrollEnabledTimerHolder = LUI.UIElement.new()

	arg_24_0:addElement(arg_24_0._autoScrollEnabledTimerHolder)

	function arg_24_0.DisableAutoScrollTimer()
		arg_24_0._autoScrollEnabled = false
		arg_24_0._autoScrollEnabledTimerHolder:Wait(Dvar.CFHDGABACF("NPSTPKMPKS"), true).onComplete = function()
			arg_24_0._autoScrollEnabled = true
		end
	end

	local var_24_17 = LUI.UIBindButton.new()

	var_24_17.id = "bindButton"

	arg_24_0:addElement(var_24_17)

	arg_24_0.bindButton = var_24_17

	arg_24_0.bindButton:addEventHandler("button_alt1", function(arg_49_0, arg_49_1)
		local var_49_0 = arg_24_0._allCategoryData[arg_24_0._selectedCategory]

		if not var_49_0.isFirstPartyCategory then
			arg_24_0._startPurchaseImmediately = true

			arg_24_0:BillboardCategoryButtonAction(nil, nil, var_49_0)
		else
			local var_49_1 = arg_24_0._selectedBundle or 1
			local var_49_2 = var_49_0.items[var_49_1]

			LUI.FlowManager.GetScopedData(arg_24_0).firstPartyColumnIndex = var_49_1

			if var_49_2.buttonAction then
				arg_24_0._startPurchaseImmediately = false

				var_49_2.buttonAction(arg_49_0, arg_49_1)

				return
			end
		end
	end)

	local function var_24_18(arg_50_0)
		assert(arg_50_0)

		local var_50_0 = {
			bundleGiftInfo = arg_24_0._selectedBundleGiftInfo,
			recipientXuidString = arg_50_0
		}

		LUI.FlowManager.RequestPopupMenu(nil, "GiftBundlePurchaseConfirmationPopup", true, arg_24_1, false, var_50_0)
	end

	local function var_24_19(arg_51_0)
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)

		if not arg_24_0._storeEnterComplete then
			QUARTERMASTER.RecordStoreEnterEvent(arg_24_1, arg_24_0._storeLayout, arg_24_0.recommendationData, arg_24_0._sourceMenu, arg_24_0._allCategoryData)
			QUARTERMASTER.BeginMenuBrowseEvent(arg_24_0._controllerIndex, arg_24_0._categoryData, arg_24_0._categoryData.items[1], arg_24_0._storeLayout, arg_24_0.recommendationData)

			arg_24_0._storeEnterComplete = true
		end

		QUARTERMASTER.RecordMenuBrowseEvent(arg_24_1, true)
		STORE.GoToStore(arg_24_1, arg_24_0:GetCurrentMenu().id, arg_51_0.id)
	end

	local function var_24_20()
		if arg_24_0._isItemGiftable then
			local var_52_0 = arg_24_0._allCategoryData[arg_24_0._selectedCategory]
			local var_52_1 = arg_24_0._selectedBundle or 1
			local var_52_2 = var_52_0.items[var_52_1]
			local var_52_3 = var_52_2.id

			arg_24_0._selectedBundleGiftInfo = var_52_2

			local var_52_4 = {
				controllerIndex = arg_24_1,
				bundleSKU = var_52_2.id,
				selectedGifteeCallback = var_24_18
			}

			local function var_52_5()
				local var_53_0 = MenuBuilder.BuildRegisteredType("GiftingFriendSelectPopup", var_52_4)

				LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_24_1, false, {
					flyInLeftNarrow = true,
					widget = var_53_0
				})
			end

			GIFT.StartFTUEFlow(arg_24_0, var_52_5)
		end
	end

	local var_24_21 = CONDITIONS.IsGiftingEnabled()
	local var_24_22 = var_24_21 and var_24_20 or var_24_19

	arg_24_0.bindButton:addEventHandler("button_alt2", function(arg_54_0, arg_54_1)
		var_24_22(arg_54_0)
	end)

	if var_24_21 then
		local var_24_23 = LUI.UIBindButton.new()

		var_24_23.id = "bindButtonFranchiseStore"

		arg_24_0:addElement(var_24_23)

		arg_24_0.bindButtonFranchiseStore = var_24_23

		arg_24_0.bindButtonFranchiseStore:addEventHandler("button_right_stick", function(arg_55_0, arg_55_1)
			var_24_19(arg_55_0)
		end)
	end

	arg_24_0.bindButton:addEventHandler("button_left_stick", function(arg_56_0, arg_56_1)
		if Dvar.IBEGCHEFE("OLNMSNSTKS") then
			LUI.FlowManager.RequestPopupMenu(arg_24_0, "CreatorCodePopup", true, arg_24_1, false, arg_24_2)
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
		end
	end)
	arg_24_0.bindButton:addEventHandler("button_left_trigger", function(arg_57_0, arg_57_1)
		LUI.FlowManager.RequestAddMenu("BundleLockerMenu", true, arg_24_0._controllerIndex, false)
	end)
	arg_24_0:addEventHandler("gamepad_button", function(arg_58_0, arg_58_1)
		if arg_58_1.controller ~= arg_24_1 and (arg_58_1.button == "primary" or arg_58_1.button == "alt1" or arg_58_1.button == "alt2" or arg_58_1.button == "left" or arg_58_1.button == "right" or arg_58_1.button == "up" or arg_58_1.button == "down") then
			return true
		end
	end)

	local function var_24_24(arg_59_0, arg_59_1)
		local var_59_0 = CONDITIONS.IsGiftingEnabled() and "button_right_stick" or "button_alt2"

		if arg_59_0._menu.HelperBar ~= nil then
			arg_59_0._menu.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = var_59_0
			})
		end

		if LUI.IsLastInputGamepad(arg_24_1) then
			arg_59_0.FranchiseStorePrompt:SetAlpha(1)

			if arg_59_0._gridChildMouseFocusCount == 0 and arg_59_0._focusedBundle then
				arg_59_0._focusedBundle:GainFocus(arg_59_1)
			end
		else
			if arg_59_0._gridChildMouseFocusCount == 0 and arg_59_0._focusedBundle then
				arg_59_0._focusedBundle:processEvent({
					name = "gain_focus"
				})
			end

			arg_59_0.FranchiseStorePrompt:SetAlpha(0)

			if arg_59_0._menu.HelperBar ~= nil then
				arg_59_0._menu.HelperBar.ButtonHelperText:PushButtonPrompt({
					kbm_only = true,
					helper_text = Engine.CBBHFCGDIC("MENU/STORE_CAT_FRANCHISE"),
					button_ref = var_59_0,
					container = arg_59_0.FranchisePromptContainer,
					containerAlignment = LUI.Alignment.Right
				})
			end
		end
	end

	arg_24_0.BundlesGrid:addEventHandler("layout_initialized", function(arg_60_0, arg_60_1)
		arg_24_0._menu = arg_60_0:GetCurrentMenu()

		arg_24_0:addAndCallEventHandler("update_input_type", var_24_24)

		local var_60_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_24_1)

		if var_60_0._selectedCategory then
			arg_60_0:SetFocusedPosition({
				x = 0,
				y = var_60_0._selectedCategory - 1
			}, false)
		else
			arg_60_0:GainFocus({
				controllerIndex = arg_24_1
			})
		end
	end)
	arg_24_0.ArrowUp:addEventHandler("grid_focus_up_blocked", function(arg_61_0, arg_61_1)
		arg_61_0:SetAlpha(0, 100)
	end)
	arg_24_0.ArrowUp:addEventHandler("grid_focus_up_not_blocked", function(arg_62_0, arg_62_1)
		arg_62_0:SetAlpha(1, 200)
	end)
	arg_24_0.ArrowDown:addEventHandler("grid_focus_down_blocked", function(arg_63_0, arg_63_1)
		arg_63_0:SetAlpha(0, 100)
	end)
	arg_24_0.ArrowDown:addEventHandler("grid_focus_down_not_blocked", function(arg_64_0, arg_64_1)
		arg_64_0:SetAlpha(1, 200)
	end)

	local function var_24_25(arg_65_0)
		if not arg_65_0.numRowsPassed then
			arg_65_0.numRowsPassed = 0
		end

		if arg_65_0.numRowsPassed == 0 then
			arg_65_0.waitingForNextScroll = true
			arg_65_0:Wait(Dvar.CFHDGABACF("LRKMTOLKTO")).onComplete = function()
				arg_65_0.waitingForNextScroll = false
				arg_65_0.numRowsPassed = 0
			end
		end

		arg_65_0.numRowsPassed = arg_65_0.numRowsPassed + 1
	end

	local function var_24_26(arg_67_0)
		local var_67_0 = Dvar.CFHDGABACF("MKRLLMTMRS")

		return arg_67_0.numRowsPassed and var_67_0 <= arg_67_0.numRowsPassed
	end

	local function var_24_27(arg_68_0, arg_68_1)
		local var_68_0 = var_24_26(arg_24_0)

		if arg_68_1.down and arg_68_1.qualifier == "mousewheel" and (not arg_24_0.waitingForNextScroll or not var_68_0) then
			var_24_25(arg_24_0)

			return arg_24_0.BundlesGrid:GamepadButton(arg_68_1)
		end
	end

	local function var_24_28(arg_69_0, arg_69_1)
		if arg_69_1.down and arg_69_1.qualifier == "mousewheel" then
			local var_69_0 = var_24_26(arg_24_0)

			if not arg_24_0.waitingForNextScroll or not var_69_0 then
				var_24_25(arg_24_0)

				return arg_24_0.BundlesGrid:GamepadButton(arg_69_1)
			end
		else
			return arg_24_0.BundlesGrid:GamepadButton(arg_69_1)
		end
	end

	arg_24_0.BillboardItem.Image:SetHandleMouse(true)
	arg_24_0.BillboardItem.Image:registerEventHandler("leftmousedown", function(arg_70_0, arg_70_1)
		return true
	end)
	arg_24_0.BillboardItem.Image:registerEventHandler("leftmouseup", function(arg_71_0, arg_71_1)
		local var_71_0 = arg_24_0._allCategoryData[arg_24_0._selectedCategory]

		arg_24_0:BillboardCategoryButtonAction(arg_71_0, arg_71_1, var_71_0)

		return true
	end)
	arg_24_0.BillboardItem.Image:addEventHandler("gamepad_button", var_24_27)

	arg_24_0.BundlesGrid._showNumbersAndArrowsKBM = true
	arg_24_0.BundlesGrid._updateArrowVisibilityOnRefresh = false
	arg_24_0.BundlesGrid._alwaysTrapMouseWheel = true

	arg_24_0.BundlesGrid:registerEventHandler("gamepad_button", var_24_28)
	arg_24_0.MouseScrollCatcher:SetHandleMouse(true)
	arg_24_0.MouseScrollCatcher:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_NORMAL)
	arg_24_0.MouseScrollCatcher:addEventHandler("gamepad_button", var_24_27)
	arg_24_0:addEventHandler("tab_create", function(arg_72_0, arg_72_1)
		local var_72_0 = arg_72_0:GetCurrentMenu()

		if var_72_0 then
			local var_72_1 = LUI.FlowManager.GetScopedData(var_72_0)

			if var_72_1.returnToEventTabFromStore then
				var_72_1.returnToEventTabFromStore = nil
				arg_72_0._returnToEventTabFromStore = true
			end
		end
	end)
	arg_24_0:addEventHandler("ingamestore_purchased_product", function(arg_73_0, arg_73_1)
		if arg_73_1.transactionResult == STORE.TransactionResult.TRANSACTION_SUCCEEDED then
			var_0_14(arg_24_0, arg_73_1.controllerIndex)
		end
	end)
end

function MPStoreBillboardGrid(arg_74_0, arg_74_1)
	local var_74_0 = LUI.UIElement.new()

	var_74_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_74_0.id = "MPStoreBillboardGrid"

	local var_74_1 = arg_74_1 and arg_74_1.controllerIndex

	if not var_74_1 and not Engine.DDJFBBJAIG() then
		var_74_1 = var_74_0:getRootController()
	end

	assert(var_74_1)

	local var_74_2 = var_74_0
	local var_74_3
	local var_74_4 = LUI.UIImage.new()

	var_74_4.id = "Background"

	var_74_4:SetRGBFromInt(0, 0)
	var_74_4:SetAlpha(0.95, 0)
	var_74_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_74_4:SetVMin(0.5, 0)
	var_74_0:addElement(var_74_4)

	var_74_0.Background = var_74_4

	local var_74_5
	local var_74_6 = LUI.UIImage.new()

	var_74_6.id = "MouseScrollCatcher"

	var_74_6:SetRGBFromInt(0, 0)
	var_74_6:SetAlpha(0, 0)
	var_74_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_74_6:SetVMin(0.5, 0)
	var_74_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 200, _1080p * -85)
	var_74_0:addElement(var_74_6)

	var_74_0.MouseScrollCatcher = var_74_6

	local var_74_7
	local var_74_8 = MenuBuilder.BuildRegisteredType("StoreBillboardItem", {
		controllerIndex = var_74_1
	})

	var_74_8.id = "BillboardItem"

	var_74_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 200, _1080p * 780)
	var_74_0:addElement(var_74_8)

	var_74_0.BillboardItem = var_74_8

	local var_74_9
	local var_74_10 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 2,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_74_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MPStoreBillboardGridRow", {
				controllerIndex = var_74_1
			})
		end,
		refreshChild = function(arg_76_0, arg_76_1, arg_76_2)
			return
		end,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1680,
		rowHeight = _1080p * 190,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_74_11 = LUI.UIPeekingGrid.new(var_74_10)

	var_74_11.id = "BundlesGrid"

	var_74_11:setUseStencil(true)
	var_74_11:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 130, _1080p * -140, _1080p * -370, 0)
	var_74_0:addElement(var_74_11)

	var_74_0.BundlesGrid = var_74_11

	local var_74_12
	local var_74_13 = LUI.UIImage.new()

	var_74_13.id = "GridMask"

	var_74_13:setImage(RegisterMaterial("store_bundle_grid_mask"), 0)
	var_74_13:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 120, _1080p * -120, _1080p * -370, _1080p * -54)
	var_74_0:addElement(var_74_13)

	var_74_0.GridMask = var_74_13

	local var_74_14
	local var_74_15 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_74_1
	})

	var_74_15.id = "VerticalScrollbar"

	var_74_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -140, _1080p * -129, _1080p * -330, _1080p * -85)
	var_74_0:addElement(var_74_15)

	var_74_0.VerticalScrollbar = var_74_15

	local var_74_16
	local var_74_17 = MenuBuilder.BuildRegisteredType("NoMoreItemsMessage", {
		controllerIndex = var_74_1
	})

	var_74_17.id = "NoMoreItemsMessage"

	var_74_17:SetAlpha(0, 0)
	var_74_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -90, _1080p * -10)
	var_74_0:addElement(var_74_17)

	var_74_0.NoMoreItemsMessage = var_74_17

	local var_74_18
	local var_74_19 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_74_1
	})

	var_74_19.id = "StoreEmpty"

	var_74_19:SetAlpha(0, 0)
	var_74_19.Backer:SetRGBFromTable(SWATCHES.Store.NoItemBGAlt, 0)
	var_74_19.Backer:SetAlpha(1, 0)
	var_74_19.Node:SetRGBFromTable(SWATCHES.Store.NoItemTimer, 0)
	var_74_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 246, _1080p * 160, _1080p * 194)
	var_74_0:addElement(var_74_19)

	var_74_0.StoreEmpty = var_74_19

	local var_74_20
	local var_74_21 = MenuBuilder.BuildRegisteredType("StoreScrollArrow", {
		controllerIndex = var_74_1
	})

	var_74_21.id = "ArrowDown"

	var_74_21:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -110, _1080p * -60)
	var_74_0:addElement(var_74_21)

	var_74_0.ArrowDown = var_74_21

	local var_74_22
	local var_74_23 = MenuBuilder.BuildRegisteredType("StoreScrollArrow", {
		controllerIndex = var_74_1
	})

	var_74_23.id = "ArrowUp"

	var_74_23:SetZRotation(180, 0)
	var_74_23.FreeBundleText:SetZRotation(180, 0)
	var_74_23:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -350, _1080p * -300)
	var_74_0:addElement(var_74_23)

	var_74_0.ArrowUp = var_74_23

	local var_74_24
	local var_74_25 = MenuBuilder.BuildRegisteredType("PromptButton", {
		controllerIndex = var_74_1
	})

	var_74_25.id = "FranchiseStorePrompt"

	var_74_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -330, _1080p * -130, _1080p * 164, _1080p * 196)
	var_74_0:addElement(var_74_25)

	var_74_0.FranchiseStorePrompt = var_74_25

	local var_74_26
	local var_74_27 = MenuBuilder.BuildRegisteredType("SupportingCreatorCode", {
		controllerIndex = var_74_1
	})

	var_74_27.id = "SupportingCreatorCode"

	var_74_27:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -761, _1080p * -371, _1080p * 172, _1080p * 196)
	var_74_0:addElement(var_74_27)

	var_74_0.SupportingCreatorCode = var_74_27

	local var_74_28
	local var_74_29 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_74_1
	})

	var_74_29.id = "FranchisePromptContainer"

	if CONDITIONS.AlwaysFalse() then
		var_74_29.Label:setText("", 0)
	end

	var_74_29:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -361, _1080p * -130, _1080p * 165, _1080p * 196)
	var_74_0:addElement(var_74_29)

	var_74_0.FranchisePromptContainer = var_74_29

	local var_74_30
	local var_74_31 = MenuBuilder.BuildRegisteredType("StoreSaleBanner", {
		controllerIndex = var_74_1
	})

	var_74_31.id = "SaleBanner"

	var_74_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 830, _1080p * 175, _1080p * 210)
	var_74_0:addElement(var_74_31)

	var_74_0.SaleBanner = var_74_31

	local var_74_32 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_74_15,
		startCap = var_74_15.startCap,
		endCap = var_74_15.endCap,
		sliderArea = var_74_15.sliderArea,
		slider = var_74_15.sliderArea and var_74_15.sliderArea.slider,
		fixedSizeSlider = var_74_15.sliderArea and var_74_15.sliderArea.fixedSizeSlider
	})

	var_74_11:AddScrollbar(var_74_32)
	var_74_11:AddArrow(var_74_23)
	var_74_11:AddArrow(var_74_21)
	var_0_17(var_74_0, var_74_1, arg_74_1)

	return var_74_0
end

MenuBuilder.registerType("MPStoreBillboardGrid", MPStoreBillboardGrid)
LockTable(_M)
