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
			isPlaceholder = true,
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

local function var_0_3(arg_3_0)
	if arg_3_0._allCategoryData == nil then
		return
	end

	local var_3_0

	for iter_3_0 = 1, #arg_3_0._allCategoryData do
		if arg_3_0._allCategoryData[iter_3_0].id == "cortez_preorder" then
			var_3_0 = arg_3_0._allCategoryData[iter_3_0]
			var_3_0.categoryIndex = 1
		end
	end

	arg_3_0._allCategoryData = {
		var_3_0
	}
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = {
		controllerIndex = arg_4_1
	}

	LUI.FlowManager.RequestPopupMenu(arg_4_0, "CreatorCodePopup", true, controllerIndex, false, var_4_0)
	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0, var_5_1 = STORE.GetIndexForBundle(arg_5_1, arg_5_0._controllerIndex)

	if var_5_0 and var_5_1 and arg_5_0.BundlesGrid then
		local var_5_2 = arg_5_0._allCategoryData[var_5_0]
		local var_5_3 = LUI.FlowManager.GetPerControllerPersistentData(arg_5_0._controllerIndex)

		arg_5_0._selectedCategory = var_5_0
		var_5_3._selectedCategory = var_5_2.categoryIndex
		arg_5_0._selectedBundle = var_5_1

		arg_5_0.BundlesGrid:SetFocusedPosition({
			x = 0,
			y = var_5_0 - 1
		}, true)

		local var_5_4 = LUI.FlowManager.GetScopedData(arg_5_0)

		var_5_4.focusForGifting = arg_5_3

		arg_5_0:BillboardCategoryButtonAction(element, event, var_5_2)

		var_5_4.focusForGifting = nil
	else
		if arg_5_3 and STORE.IsBundleOwned(arg_5_0._controllerIndex, arg_5_1) then
			LUI.FlowManager.RequestAddMenu("BundleLockerMenu", true, arg_5_0._controllerIndex, false, {
				bundleIdForGifting = arg_5_1
			})

			return
		end

		LUI.FlowManager.RequestPopupMenu(arg_5_0, "PopupOK", true, arg_5_0._controllerIndex, false, {
			message = Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_NOT_AVAILABLE")
		})
	end
end

local function var_0_6(arg_6_0, arg_6_1)
	local var_6_0 = STORE.GetCategoryIndex(arg_6_0._controllerIndex, arg_6_1)

	if var_6_0 and arg_6_0.BundlesGrid then
		local var_6_1 = arg_6_0._allCategoryData[var_6_0]
		local var_6_2 = LUI.FlowManager.GetPerControllerPersistentData(arg_6_0._controllerIndex)

		arg_6_0._selectedCategory = var_6_0
		var_6_2._selectedCategory = var_6_1.categoryIndex

		arg_6_0.BundlesGrid:SetFocusedPosition({
			x = 0,
			y = var_6_0 - 1
		}, true)
	end
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = arg_7_0._selectedBundle or 1
	local var_7_1 = arg_7_3.items[var_7_0]
	local var_7_2 = var_7_1.id

	if var_7_1.emptyCategory then
		arg_7_0._startPurchaseImmediately = false

		return
	end

	local var_7_3 = LUI.FlowManager.GetScopedData(arg_7_0)

	var_7_3.selectedBundleIndex = var_7_0

	if arg_7_3.isFirstPartyCategory then
		var_7_3.firstPartyColumnIndex = var_7_0

		if var_7_1.buttonAction then
			arg_7_0._startPurchaseImmediately = false

			var_7_1.buttonAction(arg_7_1, arg_7_2)

			return
		end
	else
		var_7_3.firstPartyColumnIndex = nil
	end

	if not arg_7_0._storeEnterComplete then
		QUARTERMASTER.RecordStoreEnterEvent(arg_7_0._controllerIndex, arg_7_0._storeLayout, arg_7_0.recommendationData, arg_7_0._sourceMenu, arg_7_0._allCategoryData)
		QUARTERMASTER.BeginMenuBrowseEvent(arg_7_0._controllerIndex, arg_7_3, arg_7_3.items[1], arg_7_0._storeLayout, arg_7_0.recommendationData)

		arg_7_0._storeEnterComplete = true
	end

	QUARTERMASTER.RecordMenuBrowseEvent(arg_7_0._controllerIndex, true)
	STORE.MarkItemSeen(arg_7_0._controllerIndex, var_7_2)
	arg_7_0.BundlesGrid:RefreshContent()

	if var_7_1.firstPartyProductID then
		local var_7_4 = var_7_1.firstPartyProductID

		if STORE.IsGameUpsellBundle(var_7_2) then
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "StoreGameUpsellPopup", true, arg_7_0._controllerIndex, false, {
				defaultProductId = var_7_4
			})
		elseif STORE.IsZeusBundle(var_7_2) then
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "StoreGameUpsellPopup", true, arg_7_0._controllerIndex, false, {
				isZeus = true,
				defaultProductId = var_7_4
			})
		elseif STORE.IsVanguardBundle(var_7_2) then
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "VGPreOrderPopup", true, arg_7_0._controllerIndex, false, {
				allowWeaponPreview = true,
				defaultProductId = var_7_4
			})
		elseif STORE.IsCortezBundle(var_7_2) then
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "CortezPreorderPopup", true, arg_7_0._controllerIndex, false, {
				defaultProductId = var_7_4,
				cortezEntryPointMenu = STORE.CortezEntryPointMenu.FirstPartyBundle
			})
		elseif arg_7_0._catalogStatus == InGameStoreCatalogStatus.READY then
			if STORE.GetNumItemsInBundle(var_7_2) > 0 then
				local var_7_5 = STORE.GetFirstPartyBundleData(arg_7_0._controllerIndex, var_7_2, var_7_4)

				var_7_5.bundleIndex = var_7_0
				var_7_5.openGiftingPopup = var_7_3.focusForGifting

				LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_7_0._controllerIndex, false, var_7_5)
			else
				InGameStore.SelectProduct(arg_7_0._controllerIndex, var_7_4, InGameStorePurchaseType.BROWSE)
			end
		else
			local var_7_6 = {
				message = arg_7_0._catalogFetchErrorMessage
			}

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_7_6, nil, false, true)
		end

		return
	end

	local var_7_7 = {
		bundleID = var_7_1.id,
		rarity = var_7_1.rarity,
		description = var_7_1.description,
		bundleType = var_7_1.bundleType,
		titleImage = var_7_1.titleImage,
		currencyID = var_7_1.currencyID,
		currencyAmount = var_7_1.currencyAmount,
		startPurchaseImmediately = arg_7_0._startPurchaseImmediately,
		timerValue = var_7_1.purchaseEnd,
		bundleIndex = var_7_0,
		positionInGrid = arg_7_0._positionInGrid,
		categoryIndex = arg_7_3.categoryIndex,
		categoryName = arg_7_3.id,
		storeLayout = arg_7_0._storeLayout,
		sourceMenu = arg_7_0._sourceMenu,
		recommendationData = arg_7_0.recommendationData,
		openGiftingPopup = var_7_3.focusForGifting
	}

	arg_7_0._startPurchaseImmediately = false

	if not arg_7_3.justForYou then
		var_7_7.timerPubVar = arg_7_3.timerPubVar
	end

	if Dvar.IBEGCHEFE("SKLSORKTK") and not BATTLEPASS.IsOwned(arg_7_0._controllerIndex) and STORE.BundleContainsBattlePass(var_7_1.id) then
		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_7_0._controllerIndex, false, {
			purchaseBattlePassInStore = true
		})
	else
		LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_7_0._controllerIndex, false, var_7_7)
	end
end

local function var_0_8(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0
	local var_8_1 = InGameStore.GetProduct(arg_8_1, arg_8_2)

	if var_8_1 ~= nil and var_8_1.status == InGameStoreProductStatus.NOT_OWNED then
		local var_8_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_8_1.productId, CSV.bundleIDs.cols.image)
		local var_8_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_8_1.productId, CSV.bundleIDs.cols.titleImage)

		if #var_8_2 == 0 or #var_8_3 == 0 then
			local var_8_4 = var_8_1.productId .. (Engine.CIEGIACHAE() and "_ps4" or Engine.BAHIIBFDDG() and "_xb3" or "_pc")

			var_8_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_8_4, CSV.bundleIDs.cols.image)
			var_8_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_8_4, CSV.bundleIDs.cols.titleImage)
		end

		if #var_8_2 > 0 and #var_8_3 > 0 then
			var_8_0 = {
				titleImage = var_8_3,
				asset = var_8_2,
				name = var_8_1.title,
				buttonAction = function(arg_9_0, arg_9_1)
					STORE.GoToStore(arg_8_1, arg_8_0:GetCurrentMenu().id, arg_9_0.id, var_8_1.productId)
				end
			}
		end
	end

	return var_8_0
end

local function var_0_9(arg_10_0, arg_10_1)
	arg_10_0._allCategoryData[#arg_10_0._allCategoryData].items = {}

	local var_10_0 = InGameStore.GetCategoryProducts(arg_10_1, STORE.GetActiveCODPointsCategory())
	local var_10_1 = {
		asset = "mw_store_billboard_cod_points",
		name = "INGAMESTORE/CATEGORY_CODPOINTS",
		titleImage = "mw_store_title_cod_points",
		buttonAction = function(arg_11_0, arg_11_1)
			STORE.GoToStore(arg_10_1, arg_10_0:GetCurrentMenu().id, arg_11_0.id, var_10_0[1].productId)
		end
	}

	table.insert(arg_10_0._allCategoryData[#arg_10_0._allCategoryData].items, var_10_1)

	local var_10_2 = Dvar.DHEEJCCJBH("LPNPSRNSMQ") or ""
	local var_10_3 = split(var_10_2, ",")

	for iter_10_0 = 1, #var_10_3 do
		local var_10_4 = var_0_8(arg_10_0, arg_10_1, var_10_3[iter_10_0])

		if var_10_4 ~= nil then
			table.insert(arg_10_0._allCategoryData[#arg_10_0._allCategoryData].items, var_10_4)

			if #arg_10_0._allCategoryData[#arg_10_0._allCategoryData].items >= 4 then
				break
			end
		end
	end

	if Dvar.IBEGCHEFE("MRTNRKPNQT") then
		local var_10_5 = var_0_8(arg_10_0, arg_10_1, STORE.CortezStandardID)

		if var_10_5 == nil then
			var_10_5 = var_0_8(arg_10_0, arg_10_1, STORE.VanguardStandardID)
		end

		if var_10_5 == nil then
			var_10_5 = var_0_8(arg_10_0, arg_10_1, STORE.ZeusStandardID)
		end

		if var_10_5 ~= nil then
			if #arg_10_0._allCategoryData[#arg_10_0._allCategoryData].items < 4 then
				table.insert(arg_10_0._allCategoryData[#arg_10_0._allCategoryData].items, var_10_5)
			else
				arg_10_0._allCategoryData[#arg_10_0._allCategoryData].items[4] = var_10_5
			end
		end
	end

	local var_10_6 = {
		asset = "mw_store_billboard_franchise_store",
		name = "MENU/STORE_CAT_FRANCHISE",
		titleImage = "mw_store_title_franchise_store",
		buttonAction = function(arg_12_0, arg_12_1)
			STORE.GoToStore(arg_10_1, arg_10_0:GetCurrentMenu().id, arg_12_0.id)
		end
	}

	table.insert(arg_10_0._allCategoryData[#arg_10_0._allCategoryData].items, var_10_6)
	arg_10_0:dispatchEventToChildren({
		name = "categoryTimerUpdate"
	})

	if arg_10_0._allCategoryData[#arg_10_0._allCategoryData].isFirstPartyCategory and arg_10_0._selectedCategory == arg_10_0._allCategoryData[#arg_10_0._allCategoryData].categoryIndex then
		local var_10_7 = arg_10_0.BundlesGrid:GetElementAtPosition(0, arg_10_0._selectedCategory - 1)

		if var_10_7 then
			local var_10_8 = LUI.FlowManager.GetScopedData(arg_10_0)
			local var_10_9 = var_10_7.RowGrid

			if not var_10_8.firstPartyColumnIndex or var_10_8.firstPartyColumnIndex == 1 then
				var_10_9:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_10_9:SetFocusedPosition({
					y = 0,
					x = var_10_8.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_10(arg_13_0, arg_13_1)
	if STORE.IsCatalogReady(arg_13_1) then
		return
	end

	if not Dvar.IBEGCHEFE("MRTNRKPNQT") then
		return
	end

	if Dvar.IBEGCHEFE("TNMTRNOQT") then
		arg_13_0._allCategoryData[STORE.GetZeusCategoryIndex()] = {
			isFirstPartyCategory = true,
			name = "INGAMESTORE/CATEGORY_ZEUS",
			placeholderCategoryID = STORE.ZeusCategoryID
		}
	end

	if Dvar.IBEGCHEFE("online_store_x2_category_enabled") then
		arg_13_0._allCategoryData[STORE.GetX2CategoryIndex()] = {
			isFirstPartyCategory = true,
			name = "MENU/STORE_CAT_X2",
			placeholderCategoryID = STORE.X2CategoryID
		}
	end

	if Dvar.IBEGCHEFE("LMMPLKNTMP") then
		arg_13_0._allCategoryData[STORE.GetCortezCategoryIndex()] = {
			isFirstPartyCategory = true,
			name = "STORE_FLAVOR_WZ335/CATEGORY_CORTEZ",
			placeholderCategoryID = STORE.CortezCategoryID
		}
	end
end

local function var_0_11(arg_14_0, arg_14_1)
	for iter_14_0 = 1, #arg_14_0._allCategoryData do
		local var_14_0 = arg_14_0._allCategoryData[iter_14_0]

		if var_14_0.placeholderCategoryID and var_14_0.placeholderCategoryID == arg_14_1 then
			table.remove(arg_14_0._allCategoryData, iter_14_0)

			return
		end
	end
end

local function var_0_12(arg_15_0, arg_15_1)
	local var_15_0 = STORE.GetCategoryIndexWithFanchiseItems(arg_15_0._allCategoryData, STORE.ZeusCategoryID)
	local var_15_1 = arg_15_0._allCategoryData[var_15_0] and arg_15_0._allCategoryData[var_15_0].id

	if not var_15_1 or STORE.CategoryType[var_15_1] ~= STORE.CategoryType.zeus_preorder then
		DebugPrint("Zeus category missing from allCategoryData")

		return
	end

	arg_15_0._allCategoryData[var_15_0].items = STORE.GetZeusCategoryData(arg_15_1)

	if #arg_15_0._allCategoryData[var_15_0].items == 0 then
		DebugPrint("Zeus category contains no items")

		return
	end

	arg_15_0:ClearPlaceholderFromCategory(STORE.ZeusCategoryID)

	local var_15_2 = LUI.FlowManager.GetScopedData(arg_15_0)

	for iter_15_0 = 1, #arg_15_0._allCategoryData[var_15_0].items do
		arg_15_0._allCategoryData[var_15_0].items[iter_15_0].buttonAction = function(arg_16_0, arg_16_1)
			var_15_2.openedZeusUpsell = true

			LUI.FlowManager.RequestAddMenu("StoreGameUpsellPopup", true, arg_15_1, false, {
				preFetched = true,
				isZeus = true,
				defaultProductId = arg_15_0._allCategoryData[var_15_0].items[iter_15_0].productId
			}, true)
		end
	end

	if (arg_15_0._selectedCategory and arg_15_0._selectedCategory - arg_15_0._allCategoryData[var_15_0].categoryIndex) == 1 then
		arg_15_0.BundlesGrid:RefreshContent()
	else
		arg_15_0:dispatchEventToChildren({
			name = "categoryTimerUpdate"
		})
	end

	if arg_15_0._allCategoryData[var_15_0].isFirstPartyCategory and arg_15_0._selectedCategory == arg_15_0._allCategoryData[var_15_0].categoryIndex then
		local var_15_3 = arg_15_0.BundlesGrid:GetElementAtPosition(0, arg_15_0._selectedCategory - 1)

		if var_15_3 then
			local var_15_4 = LUI.FlowManager.GetScopedData(arg_15_0)
			local var_15_5 = var_15_3.RowGrid

			if not var_15_4.firstPartyColumnIndex or var_15_4.firstPartyColumnIndex == 1 then
				var_15_5:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_15_5:SetFocusedPosition({
					y = 0,
					x = var_15_4.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_13(arg_17_0, arg_17_1)
	local var_17_0 = STORE.GetCategoryIndexWithFanchiseItems(arg_17_0._allCategoryData, STORE.X2CategoryID)
	local var_17_1 = arg_17_0._allCategoryData
	local var_17_2 = arg_17_0._allCategoryData[var_17_0] and arg_17_0._allCategoryData[var_17_0].id

	if not var_17_2 or STORE.CategoryType[var_17_2] ~= STORE.CategoryType.x2_preorder then
		DebugPrint("X2 category missing from allCategoryData")

		return
	end

	arg_17_0._allCategoryData[var_17_0].items = {}

	local var_17_3 = STORE.GetVanguardCategoryData(arg_17_1)

	for iter_17_0, iter_17_1 in ipairs(var_17_3) do
		if not iter_17_1.owned then
			table.insert(arg_17_0._allCategoryData[var_17_0].items, iter_17_1)
		end
	end

	if #arg_17_0._allCategoryData[var_17_0].items == 0 then
		DebugPrint("Vanguard category contains no items")

		return
	end

	arg_17_0:ClearPlaceholderFromCategory(STORE.X2CategoryID)

	local var_17_4 = LUI.FlowManager.GetScopedData(arg_17_0)

	for iter_17_2 = 1, #arg_17_0._allCategoryData[var_17_0].items do
		arg_17_0._allCategoryData[var_17_0].items[iter_17_2].buttonAction = function(arg_18_0, arg_18_1)
			var_17_4.openedX2Upsell = true

			local var_18_0 = arg_17_0._allCategoryData[var_17_0].items[iter_17_2]

			if var_18_0.productId == STORE.VanguardTrialID then
				if Engine.DBFCJBDJEC() then
					STORE.GoToX2InBattleNet(arg_17_1)
				elseif var_18_0.uri ~= nil then
					Engine.CBEBCGFAIE(arg_17_1, var_18_0.uri)
				else
					InGameStore.SelectProduct(arg_17_1, var_18_0.productId, InGameStorePurchaseType.BROWSE)
				end
			else
				LUI.FlowManager.RequestPopupMenu(arg_17_0, "VGPreOrderPopup", true, arg_17_0._controllerIndex, false, {
					allowWeaponPreview = true,
					defaultProductId = var_18_0.productId
				})
			end
		end
	end

	if (arg_17_0._selectedCategory and arg_17_0._selectedCategory - arg_17_0._allCategoryData[var_17_0].categoryIndex) == 1 then
		arg_17_0.BundlesGrid:RefreshContent()
	else
		arg_17_0:dispatchEventToChildren({
			name = "categoryTimerUpdate"
		})
	end

	if arg_17_0._allCategoryData[var_17_0].isFirstPartyCategory and arg_17_0._selectedCategory == arg_17_0._allCategoryData[var_17_0].categoryIndex then
		local var_17_5 = arg_17_0.BundlesGrid:GetElementAtPosition(0, arg_17_0._selectedCategory - 1)

		if var_17_5 then
			local var_17_6 = LUI.FlowManager.GetScopedData(arg_17_0)
			local var_17_7 = var_17_5.RowGrid

			if not var_17_6.firstPartyColumnIndex or var_17_6.firstPartyColumnIndex == 1 then
				var_17_7:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_17_7:SetFocusedPosition({
					y = 0,
					x = var_17_6.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_14(arg_19_0, arg_19_1)
	if arg_19_0._allCategoryData == nil then
		return
	end

	local var_19_0 = STORE.GetCategoryIndexWithFanchiseItems(arg_19_0._allCategoryData, STORE.CortezCategoryID)
	local var_19_1 = arg_19_0._allCategoryData
	local var_19_2 = arg_19_0._allCategoryData[var_19_0] and arg_19_0._allCategoryData[var_19_0].id

	if not var_19_2 or STORE.CategoryType[var_19_2] ~= STORE.CategoryType.cortez_preorder then
		DebugPrint("Cortez category missing from allCategoryData")

		return
	end

	arg_19_0._allCategoryData[var_19_0].items = {}

	local var_19_3 = STORE.GetCortezCategoryData(arg_19_1)

	for iter_19_0, iter_19_1 in ipairs(var_19_3) do
		table.insert(arg_19_0._allCategoryData[var_19_0].items, iter_19_1)
	end

	arg_19_0:ClearPlaceholderFromCategory(STORE.CortezCategoryID)

	local var_19_4 = LUI.FlowManager.GetScopedData(arg_19_0)

	for iter_19_2 = 1, #arg_19_0._allCategoryData[var_19_0].items do
		arg_19_0._allCategoryData[var_19_0].items[iter_19_2].buttonAction = function(arg_20_0, arg_20_1)
			var_19_4.openedCortezUpsell = true

			local var_20_0 = arg_19_0._allCategoryData[var_19_0].items[iter_19_2]

			if var_20_0.productId == STORE.CortezTrialID then
				if Engine.DBFCJBDJEC() then
					STORE.GoToCortezInBattleNet(arg_19_1)
				elseif var_20_0.uri ~= nil then
					Engine.CBEBCGFAIE(arg_19_1, var_20_0.uri)
				else
					InGameStore.SelectProduct(arg_19_1, var_20_0.productId, InGameStorePurchaseType.BROWSE)
				end
			else
				LUI.FlowManager.RequestPopupMenu(arg_19_0, "CortezPreOrderPopup", true, arg_19_0._controllerIndex, false, {
					allowWeaponPreview = true,
					defaultProductId = var_20_0.productId,
					cortezEntryPointMenu = STORE.CortezEntryPointMenu.InGameStore
				})
			end
		end
	end

	if (arg_19_0._selectedCategory and arg_19_0._selectedCategory - arg_19_0._allCategoryData[var_19_0].categoryIndex) == 1 then
		arg_19_0.BundlesGrid:RefreshContent()
	else
		arg_19_0:dispatchEventToChildren({
			name = "categoryTimerUpdate"
		})
	end

	if arg_19_0._allCategoryData[var_19_0].isFirstPartyCategory and arg_19_0._selectedCategory == arg_19_0._allCategoryData[var_19_0].categoryIndex then
		local var_19_5 = arg_19_0.BundlesGrid:GetElementAtPosition(0, arg_19_0._selectedCategory - 1)

		if var_19_5 then
			local var_19_6 = LUI.FlowManager.GetScopedData(arg_19_0)
			local var_19_7 = var_19_5.RowGrid

			if not var_19_6.firstPartyColumnIndex or var_19_6.firstPartyColumnIndex == 1 then
				var_19_7:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_19_7:SetFocusedPosition({
					y = 0,
					x = var_19_6.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_15(arg_21_0, arg_21_1)
	if arg_21_0._allCategoryData == nil or #arg_21_0._allCategoryData == 0 then
		if arg_21_0._refreshEmptyTimer == nil then
			ACTIONS.AnimateSequence(arg_21_0, "EmptyStore")

			local var_21_0 = LUI.UITimer.new({
				interval = 1000,
				event = {
					name = "refresh_timer",
					controllerIndex = arg_21_1
				}
			})

			var_21_0.id = "refreshTimer"

			arg_21_0:addElement(var_21_0)

			arg_21_0._refreshEmptyTimer = var_21_0
		end

		return false
	elseif arg_21_0._refreshEmptyTimer ~= nil then
		arg_21_0._refreshEmptyTimer:closeTree()

		arg_21_0._refreshEmptyTimer = nil

		return true
	else
		return true
	end
end

local function var_0_16(arg_22_0, arg_22_1)
	arg_22_0._allCategoryData = STORE.GetCategoryData(arg_22_1, arg_22_0._allCategoryData)

	if CONDITIONS.IsPostSeasonAndMagma() then
		var_0_3(arg_22_0)
	end

	var_0_15(arg_22_0, arg_22_1)

	local var_22_0 = (CONDITIONS.IsWZStoreDisabled() and CONDITIONS.IsMagmaGameMode()) ~= true

	if var_22_0 then
		for iter_22_0 = 1, #arg_22_0._allCategoryData do
			arg_22_0._allCategoryData[iter_22_0].categoryIndex = iter_22_0
		end
	else
		var_0_3(arg_22_0)

		if var_0_15(arg_22_0, arg_22_1) == false then
			return
		end
	end

	if var_22_0 then
		var_0_9(arg_22_0, arg_22_1)
		var_0_12(arg_22_0, arg_22_1)
		var_0_13(arg_22_0, arg_22_1)
	end

	var_0_14(arg_22_0, arg_22_1)
	arg_22_0.BundlesGrid:SetNumRows(arg_22_0._allCategoryData ~= nil and #arg_22_0._allCategoryData or 0)
	arg_22_0.BundlesGrid:RefreshContent()

	local var_22_1 = LUI.FlowManager.GetPerControllerPersistentData(arg_22_1)

	if not var_22_1._hasEnteredStore and arg_22_0._allCategoryData ~= nil and #arg_22_0._allCategoryData >= 1 then
		var_22_1._hasEnteredStore = true

		local var_22_2 = arg_22_0._allCategoryData[1]
		local var_22_3 = var_22_2.items

		if var_22_3 and #var_22_3 > 0 then
			local var_22_4 = var_22_3[1]

			arg_22_0.BillboardItem:UpdateBillboard(var_22_4, var_22_2.isFirstPartyCategory)
			arg_22_0.BillboardItem:SetGiftPromtButtonActive(GIFT.IsItemGiftable(var_22_2.id))

			arg_22_0._selectedCategory = var_22_2.categoryIndex
			var_22_1._selectedCategory = var_22_2.categoryIndex
			arg_22_0._selectedBundle = 1
		end
	end

	arg_22_0:dispatchEventToChildren({
		name = "categoryTimerUpdate"
	})
end

local function var_0_17(arg_23_0, arg_23_1)
	InGameStore.FetchCatalog(arg_23_1, false, true)

	arg_23_0._catalogStatus = InGameStore.GetCatalogStatus(arg_23_1)
	arg_23_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE")

	local var_23_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "refresh_timer",
			controllerIndex = arg_23_1
		}
	})

	var_23_0.id = "refreshTimer"

	arg_23_0:addElement(var_23_0)

	arg_23_0._refreshTimer = var_23_0

	arg_23_0:registerEventHandler("refresh_timer", function(arg_24_0, arg_24_1)
		local var_24_0

		if Dvar.CFHDGABACF("ui_test_getcatalogstatus") == 1 then
			var_24_0 = InGameStoreCatalogStatus.ERROR
		elseif Dvar.CFHDGABACF("ui_test_getcatalogstatus") == 2 then
			var_24_0 = InGameStoreCatalogStatus.NOTREADY
		elseif Dvar.CFHDGABACF("ui_test_getcatalogstatus") == 3 then
			var_24_0 = InGameStoreCatalogStatus.FETCHING
		else
			var_24_0 = InGameStore.GetCatalogStatus(arg_24_1.controllerIndex)
		end

		local var_24_1 = false

		if arg_23_0._catalogStatus == InGameStoreCatalogStatus.FETCHING and var_24_0 == InGameStoreCatalogStatus.READY then
			arg_23_0:dispatchEventToChildren({
				catalogFetched = true,
				name = "categoryTimerUpdate"
			})
		end

		arg_23_0._catalogStatus = var_24_0

		if arg_23_0._catalogStatus == InGameStoreCatalogStatus.READY then
			var_0_16(arg_23_0, arg_23_1)

			var_24_1 = true
		elseif arg_23_0._catalogStatus == InGameStoreCatalogStatus.ERROR then
			var_24_1 = true

			if Engine.DBFCJBDJEC() then
				local var_24_2 = Engine.BIAFEJHHDD()

				if var_24_2 ~= nil then
					local var_24_3 = Engine.JCBDICCAH(var_24_2)

					arg_23_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_24_3)

					Engine.DCFIDJGACA()
				else
					arg_23_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_24_4 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				arg_23_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_24_4)
			end

			Engine.DHCGHHBHCH()

			local var_24_5 = (CONDITIONS.IsWZStoreDisabled() and CONDITIONS.IsMagmaGameMode()) ~= true

			if Commerce.CCIEAECGHB() then
				if var_24_5 then
					var_0_9(arg_23_0, arg_23_1)
					var_0_12(arg_23_0, arg_23_1)
					var_0_13(arg_23_0, arg_23_1)
				end

				var_0_14(arg_23_0, arg_23_1)
			elseif CONDITIONS.IsPostSeasonAndMagma() ~= true then
				arg_23_0._allCategoryData[#arg_23_0._allCategoryData].items[1].fetchingDataFailed = true

				arg_23_0:dispatchEventToChildren({
					name = "categoryTimerUpdate"
				})
			else
				var_0_14(arg_23_0, arg_23_1)
				var_0_3(arg_23_0)
				var_0_15(arg_23_0, arg_23_1)
			end
		end

		if var_24_1 and arg_24_0._refreshTimer ~= nil then
			arg_24_0._refreshTimer:closeTree()

			arg_24_0._refreshTimer = nil
		end
	end)
end

local function var_0_18(arg_25_0)
	local var_25_0 = {}
	local var_25_1 = "DefaultSequence"
	local var_25_2 = "DefaultSequence"

	if arg_25_0._selectedCategory > 1 then
		for iter_25_0 = arg_25_0._selectedCategory - 1, 1, -1 do
			table.insert(var_25_0, arg_25_0._allCategoryData[iter_25_0])
		end
	end

	if arg_25_0._selectedCategory < #arg_25_0._allCategoryData then
		for iter_25_1 = arg_25_0._selectedCategory + 1, #arg_25_0._allCategoryData do
			table.insert(var_25_0, arg_25_0._allCategoryData[iter_25_1])
		end
	end

	for iter_25_2 = 1, #var_25_0 do
		local var_25_3 = var_25_0[iter_25_2]

		var_25_3.hasNewItems = false
		var_25_3.hasFreeItems = false

		if var_0_1 and Dvar.IBEGCHEFE("LSOLLKOPQT") then
			var_25_3.hasFreeItems = STORE.CategoryHasFreeItems(arg_25_0._controllerIndex, var_25_3)
		end

		for iter_25_3 = 1, #var_25_3.items do
			local var_25_4 = var_25_3.items[iter_25_3]

			if var_25_4.id and not STORE.HasSeenItem(arg_25_0._controllerIndex, var_25_4.id) then
				var_25_3.hasNewItems = true

				break
			end
		end

		if var_25_3.categoryIndex < arg_25_0._selectedCategory then
			if var_25_3.hasFreeItems then
				var_25_1 = "Free"
			elseif var_25_1 ~= "Free" and var_25_3.hasNewItems then
				var_25_1 = "New"
			end
		elseif var_25_3.categoryIndex > arg_25_0._selectedCategory then
			if var_25_3.hasFreeItems then
				var_25_2 = "Free"
			elseif var_25_2 ~= "Free" and var_25_3.hasNewItems then
				var_25_2 = "New"
			end
		end
	end

	if var_25_1 == "Free" then
		arg_25_0.ArrowUp:SetFreeState()
	else
		arg_25_0.ArrowUp:ClearState()
		ACTIONS.AnimateSequence(arg_25_0.ArrowUp, var_25_1)
	end

	if var_25_2 == "Free" then
		arg_25_0.ArrowDown:SetFreeState()
	else
		arg_25_0.ArrowDown:ClearState()
		ACTIONS.AnimateSequence(arg_25_0.ArrowDown, var_25_2)
	end
end

local function var_0_19(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.BillboardCategoryButtonAction = var_0_7
	arg_26_0.InjectPlaceholdersForFirstPartyCategories = var_0_10
	arg_26_0.ClearPlaceholderFromCategory = var_0_11
	arg_26_0._gridChildMouseFocusCount = 0

	function arg_26_0.FocusBundleByID(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
		var_0_5(arg_26_0, arg_27_1, arg_27_2, arg_27_3)
	end

	function arg_26_0.FocusButtonByName(arg_28_0, arg_28_1)
		var_0_6(arg_26_0, arg_28_1)
	end

	ACTIONS.ScaleFullscreen(arg_26_0.Background)
	Engine.DHFCHIIJCA("quartermaster")
	arg_26_0.BundlesGrid:SetMask(arg_26_0.GridMask)

	if CONDITIONS.IsNotWZStoreDisabledOrIsNotMagmaGameMode() then
		local var_26_0 = CONDITIONS.IsGiftingEnabled() and "LUA_MENU/FRANCHISE_STORE_WITH_PROMPT_RS" or "LUA_MENU/FRANCHISE_STORE_WITH_PROMPT"

		arg_26_0.FranchiseStorePrompt:SetText(Engine.CBBHFCGDIC(var_26_0))
	end

	arg_26_0:addElement(LOOT.GetLootFlareMaterialStreamer())

	arg_26_0._controllerIndex = arg_26_1
	arg_26_0._promotedItems = STORE.ParsePromotedItems(arg_26_1)
	arg_26_0._chaseItems = STORE.ParseChaseItems(arg_26_1)

	local var_26_1 = BATTLEPASS.GetCurrentCPRewards(arg_26_1)

	arg_26_0._totalCP = var_26_1 and var_26_1.totalCP or 0

	local var_26_2 = STORE.GetSaleTimer(arg_26_1)

	if var_26_2 and #var_26_2 > 0 and tonumber(var_26_2) > Engine.DEIDGHDBHD() and STORE.GetHighestDiscountPercentage(arg_26_1) > 0 then
		arg_26_0.SaleBanner:SetAlpha(1)
	else
		arg_26_0.SaleBanner:SetAlpha(0)
	end

	if CONDITIONS.IsStoreSalesBannerEnabled() then
		arg_26_0.SaleBanner:SetAlpha(0)
	end

	if Dvar.IBEGCHEFE("MLTTQSTKQS") then
		arg_26_0.GridMask:setImage(RegisterMaterial("stencil_mask"))
		arg_26_0.GridMask:SetBottom(-70 * _1080p)
	end

	var_0_17(arg_26_0, arg_26_1)

	if QUARTERMASTER.itemData then
		QUARTERMASTER.itemData = {}
	end

	function arg_26_0.BackButtonOverride(arg_29_0, arg_29_1)
		local var_29_0 = LUI.FlowManager.GetScopedData(arg_29_0)

		LUI.FlowManager.GetPerControllerPersistentData(arg_26_1)._selectedCategory = nil

		if var_29_0.useStandaloneStore then
			LUI.FlowManager.RequestLeaveMenu(arg_29_0)
		else
			local var_29_1 = arg_29_1.qualifier ~= "keyboard" and arg_29_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad
			local var_29_2 = arg_29_0:getParent()
			local var_29_3 = arg_29_1.controller or arg_26_1
			local var_29_4 = TAB.GetIndex(TAB.MP.PLAY)

			if arg_26_0._returnToEventTabFromStore then
				var_29_4 = TAB.GetIndex(TAB.MP.EVENT)
			end

			var_29_2.Tabs:FocusTab(var_29_3, var_29_4, var_29_1)
		end

		return false
	end

	local function var_26_3(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
		local var_30_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_26_1)

		arg_26_0._categoryData = arg_30_2

		if arg_26_0.DisableAutoScrollTimer and not arg_26_0._autoScroll then
			arg_26_0.DisableAutoScrollTimer()
		end

		if arg_30_3 > #arg_30_2.items then
			arg_30_3 = 1
		end

		local var_30_1 = arg_30_2.items[arg_30_3]

		if arg_30_4 then
			local var_30_2 = arg_30_4:GetFocusPosition(LUI.DIRECTION.horizontal)

			if var_30_2 then
				var_30_1.positionInGrid = var_30_2 + 1
				arg_26_0._positionInGrid = var_30_1.positionInGrid
			end
		end

		if var_30_1.purchaseEnd then
			local var_30_3, var_30_4, var_30_5 = STORE.GetCategoryTimeLeft(nil, var_30_1.purchaseEnd)

			if var_30_3 <= 0 then
				arg_26_0:dispatchEventToChildren({
					expiredBundle = true,
					name = "categoryTimerUpdate"
				})

				return
			end
		end

		;(function()
			local var_31_0 = var_30_1 and var_30_1.emptyCategory or false

			if not arg_30_2.isFirstPartyCategory and not var_31_0 then
				arg_26_0._isItemGiftable = GIFT.IsItemGiftable(var_30_1.id)
			else
				arg_26_0._isItemGiftable = false
			end

			local var_31_1 = arg_26_0.BundlesGrid:GetCurrentMenu()
			local var_31_2 = arg_26_0._isItemGiftable and CONDITIONS.IsGiftingEnabled()

			arg_26_0.BillboardItem:SetGiftPromtButtonActive(var_31_2)
		end)()
		arg_26_0.BillboardItem:UpdateBillboard(var_30_1, arg_30_2.isFirstPartyCategory)

		if not arg_30_2.isFirstPartyCategory then
			if QUARTERMASTER.itemData and QUARTERMASTER.itemData.sessionId ~= nil then
				QUARTERMASTER.RecordMenuBrowseEvent(arg_26_1, false, arg_26_0._sourceMenu)
			end

			if arg_26_0._initialBrowse then
				if not arg_26_0._storeEnterComplete then
					QUARTERMASTER.RecordStoreEnterEvent(arg_26_1, arg_26_0._storeLayout, arg_26_0.recommendationData, arg_26_0._sourceMenu, arg_26_0._allCategoryData)

					arg_26_0._storeEnterComplete = true
				end

				QUARTERMASTER.BeginMenuBrowseEvent(arg_26_1, arg_30_2, var_30_1, arg_26_0._storeLayout, arg_26_0.recommendationData)
			else
				arg_26_0._initialBrowse = true
			end
		end

		local var_30_6 = arg_26_0._selectedCategory ~= arg_30_2.categoryIndex

		arg_26_0._selectedCategory = arg_30_2.categoryIndex
		var_30_0._selectedCategory = arg_30_2.categoryIndex
		arg_26_0._selectedBundle = arg_30_3

		local var_30_7 = (CONDITIONS.IsWZStoreDisabled() and CONDITIONS.IsMagmaGameMode()) ~= true

		if var_30_6 and var_30_7 then
			arg_26_0:dispatchEventToChildren({
				categoryChanged = true,
				name = "categoryTimerUpdate"
			})
			var_0_18(arg_26_0)
		elseif var_30_7 ~= true then
			arg_26_0.ArrowUp:SetAlpha(0)
			arg_26_0.ArrowDown:SetAlpha(0)
		end
	end

	local var_26_4 = Store.EHGIGBJJC()
	local var_26_5 = Engine.EHGIGBJJC(var_26_4)

	arg_26_0._allCategoryData = STORE.GetCategoryData(arg_26_1)

	if CONDITIONS.IsPostSeasonAndMagma() then
		var_0_3(arg_26_0)
	end

	arg_26_0._recommendations = STORE.CheckForPersonalRecommendations(arg_26_1)

	if var_26_5.scheduleFilename then
		local var_26_6 = var_26_5.scheduleFilename

		arg_26_0._storeSchedule = Engine.DBABFCGGIC(var_26_6)
	end

	if not arg_26_0._recommendations then
		arg_26_0.recommendationData = {
			isEnabled = false
		}
	end

	local var_26_7 = LUI.FlowManager.GetScopedData(arg_26_0)
	local var_26_8 = var_26_7.openedZeusUpsell and STORE.IsZeusOwned(arg_26_1)

	var_26_7.openedZeusUpsell = nil

	if var_26_8 then
		var_26_7.selectedBundleIndex = nil
		var_26_7.firstPartyColumnIndex = nil
	end

	if (CONDITIONS.IsWZStoreDisabled() and CONDITIONS.IsMagmaGameMode()) ~= true then
		arg_26_0._allCategoryData[#arg_26_0._allCategoryData + 1] = {
			isFirstPartyCategory = true,
			name = "MENU/STORE_CAT_FRANCHISE"
		}

		arg_26_0:InjectPlaceholdersForFirstPartyCategories(arg_26_1)
	end

	if arg_26_0._allCategoryData ~= nil then
		for iter_26_0 = 1, #arg_26_0._allCategoryData do
			local var_26_9 = arg_26_0._allCategoryData[iter_26_0]

			var_26_9.items = var_26_9.items or {}

			var_0_2(arg_26_0, arg_26_1, var_26_9)

			var_26_9.categoryIndex = iter_26_0
		end
	end

	local var_26_10 = var_26_5.layoutType

	arg_26_0._storeLayout = var_26_10

	local var_26_11
	local var_26_12 = LUI.FlowManager.IsMenuOnTop("BRMainMenuStore") and "BladeMenu" or -1

	arg_26_0._sourceMenu = var_26_12
	arg_26_0._storeEnterComplete = false
	arg_26_0._initialBrowse = false
	arg_26_0:Wait(2000, true).onComplete = function()
		if not arg_26_0._storeEnterComplete then
			QUARTERMASTER.RecordStoreEnterEvent(arg_26_1, var_26_10, arg_26_0.recommendationData, var_26_12, arg_26_0._allCategoryData)

			arg_26_0._storeEnterComplete = true
		end
	end

	local function var_26_13(arg_33_0, arg_33_1)
		if arg_33_1 and arg_33_1.name then
			local var_33_0 = arg_33_1.items

			if not var_33_0 or not (#var_33_0 > 0) or var_33_0[1].emptyCategory then
				arg_33_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/X_TO_Y", Engine.CBBHFCGDIC(arg_33_1.name), Engine.CBBHFCGDIC("MENU/SOLD_OUT"))))
			else
				arg_33_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_33_1.name)))
			end
		else
			arg_33_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SOLD_OUT")))
		end

		if arg_33_1 and arg_33_1.rowGameSourceIDOrMixed then
			arg_33_0:UpdateWZSnipeBar(arg_33_1.rowGameSourceIDOrMixed)
		end
	end

	local function var_26_14(arg_34_0, arg_34_1, arg_34_2)
		if arg_26_0._allCategoryData == nil or #arg_26_0._allCategoryData == 0 then
			return
		end

		local var_34_0 = arg_26_0._allCategoryData[arg_34_2 + 1]

		local function var_34_1()
			if var_34_0 == nil then
				return
			end

			local var_35_0 = LUI.FlowManager.GetScopedData(arg_26_0)
			local var_35_1 = arg_26_0._selectedBundle or var_35_0.selectedBundleIndex or 1

			if var_35_1 > #var_34_0.items then
				var_35_1 = #var_34_0.items
			end

			var_35_0.selectedBundleIndex = nil

			return {
				y = 0,
				x = var_35_1 - 1
			}
		end

		arg_34_0.RowGrid:SetDefaultFocus(var_34_1)

		local function var_34_2(arg_36_0, arg_36_1, arg_36_2)
			local var_36_0 = var_34_0.items[arg_36_1 + 1]

			if not var_36_0 then
				DebugPrint("STORE SCROLL BUG: Column: " .. arg_36_1 .. ", Row: " .. arg_36_2)
				arg_36_0:registerEventHandler("button_over", function(arg_37_0, arg_37_1)
					return
				end)
				arg_36_0:registerEventHandler("button_action", function(arg_38_0, arg_38_1)
					return
				end)
				arg_36_0:registerEventHandler("mouseenter", function(arg_39_0, arg_39_1)
					return
				end)
				arg_36_0:registerEventHandler("mouseleave", function(arg_40_0, arg_40_1)
					return
				end)
				arg_36_0:registerEventHandler("categoryTimerUpdate", function(arg_41_0, arg_41_1)
					return
				end)
				arg_36_0:UpdateNewIndicator(0)

				return
			end

			arg_36_0:UpdateButton(var_36_0)
			arg_36_0:UpdateChaseItem(var_36_0, arg_26_0._chaseItems, var_34_0.isFirstPartyCategory)

			if not var_34_0.isFirstPartyCategory then
				if not var_36_0.emptyCategory and not STORE.HasSeenItem(arg_26_1, var_36_0.id) then
					arg_36_0:UpdateNewIndicator(1)
				else
					arg_36_0:UpdateNewIndicator(0)
				end
			else
				arg_36_0:UpdateNewIndicator(0)
			end

			arg_36_0:registerEventHandler("button_over", function(arg_42_0, arg_42_1)
				var_26_3(arg_42_0, arg_42_1, var_34_0, arg_36_1 + 1, arg_34_0.RowGrid)

				arg_26_0._focusedBundle = arg_42_0
			end)
			arg_36_0:registerEventHandler("button_action", function(arg_43_0, arg_43_1)
				arg_26_0:BillboardCategoryButtonAction(arg_43_0, arg_43_1, var_34_0)
			end)
			arg_36_0:registerEventHandler("mouseenter", function(arg_44_0, arg_44_1)
				arg_26_0._gridChildMouseFocusCount = arg_26_0._gridChildMouseFocusCount + 1
			end)
			arg_36_0:registerEventHandler("mouseleave", function(arg_45_0, arg_45_1)
				arg_26_0._gridChildMouseFocusCount = math.max(0, arg_26_0._gridChildMouseFocusCount - 1)
			end)
			arg_36_0:registerEventHandler("categoryTimerUpdate", function(arg_46_0, arg_46_1)
				if not arg_46_1.expiredBundle and var_36_0.purchaseEnd then
					local var_46_0, var_46_1, var_46_2 = STORE.GetCategoryTimeLeft(nil, var_36_0.purchaseEnd)

					if var_46_0 <= 0 then
						arg_26_0:dispatchEventToChildren({
							expiredBundle = true,
							name = "categoryTimerUpdate"
						})
					end
				end
			end)

			local var_36_1 = var_34_0.rowGameSourceIDOrMixed == "mixed" and var_36_0.gameSourceID or nil

			arg_36_0:UpdateWZSnipeBar(var_36_1)
		end

		arg_34_0.RowGrid:SetRefreshChild(var_34_2)

		arg_34_0._timerValue = nil
		arg_34_0._idPubVarString = nil

		arg_34_0:registerEventHandler("categoryTimerUpdate", function(arg_47_0, arg_47_1)
			if var_34_0 == nil then
				return
			end

			local var_47_0 = var_34_0.categoryIndex == arg_26_0._selectedCategory

			if var_34_0.isFirstPartyCategory and not arg_47_1.firstPartyCategoryIgnoreUpdate then
				if not arg_47_1.categoryChanged then
					arg_34_0.RowGrid:SetNumRows(1)
					arg_34_0.RowGrid:SetNumColumns(#var_34_0.items)
					arg_34_0.RowGrid:RefreshContent()
				end

				if var_47_0 then
					arg_26_0.NoMoreItemsMessage:SetAlpha(0)
				end

				return
			end

			local var_47_1 = var_34_0.items
			local var_47_2 = var_47_1 and #var_47_1 > 0 and var_47_1[1] or nil

			if var_47_0 then
				if var_47_2 == nil or var_47_2.emptyCategory then
					arg_26_0.NoMoreItemsMessage:SetAlpha(1)
				else
					arg_26_0.NoMoreItemsMessage:SetAlpha(0)
				end
			end

			if not var_34_0.justForYou then
				local var_47_3, var_47_4, var_47_5 = STORE.GetCategoryTimeLeft(var_34_0.timerPubVar)

				if not arg_34_0._timerValue and var_34_0.timerPubVar and var_47_5 ~= "" then
					arg_34_0._timerValue = var_47_5
				end

				local var_47_6 = var_34_0.idPubVar and Dvar.DHEEJCCJBH(var_34_0.idPubVar) or ""

				if not arg_34_0._idPubVarString and var_47_6 ~= "" then
					arg_34_0._idPubVarString = var_47_6
				end

				local var_47_7 = arg_47_1.expiredBundle and var_47_0
				local var_47_8 = arg_47_1.catalogFetched
				local var_47_9 = arg_34_0._timerValue and arg_34_0._timerValue ~= var_47_5
				local var_47_10 = arg_34_0._idPubVarString and arg_34_0._idPubVarString ~= var_47_6
				local var_47_11 = arg_47_1.categoryChanged
				local var_47_12 = var_47_7 or var_47_8 or var_47_9 or var_47_10

				if var_47_12 or var_47_11 then
					var_0_2(arg_26_0, arg_26_1, var_34_0)

					if var_47_12 then
						arg_34_0.RowGrid:SetNumRows(1)
						arg_34_0.RowGrid:SetNumColumns(#var_34_0.items)
						arg_34_0.RowGrid:RefreshContent()
					end

					arg_34_0._timerValue = var_47_5
					arg_34_0._idPubVarString = var_34_0.idPubVarString

					if not arg_26_0._refocusing and (Dvar.IBEGCHEFE("LMKNLPNKTM") or var_47_7 or var_47_8 and var_34_0.hasFirstPartyBundle) then
						arg_26_0._refocusing = true

						arg_34_0.RowGrid:processEvent({
							name = "lose_focus"
						})
						arg_34_0.RowGrid:SetFocusedPosition({
							x = 0,
							y = 0
						}, true)

						arg_26_0._refocusing = false
					end
				end
			end

			var_26_13(arg_34_0, var_34_0)
		end)
		arg_34_0.RowGrid:SetNumRows(1)
		arg_34_0.RowGrid:SetNumColumns(var_34_0 ~= nil and #var_34_0.items or 0)
		arg_34_0.RowGrid:RefreshContent()
		var_26_13(arg_34_0, var_34_0)
	end

	arg_26_0.BundlesGrid:SetRefreshChild(var_26_14)
	arg_26_0.BundlesGrid:SetNumColumns(1)
	arg_26_0.BundlesGrid:SetNumRows(arg_26_0._allCategoryData ~= nil and #arg_26_0._allCategoryData or 0)
	arg_26_0.BundlesGrid:RefreshContent()

	local var_26_15 = LUI.UITimer.new({
		interval = 1000,
		event = {
			firstPartyCategoryIgnoreUpdate = true,
			name = "categoryTimerUpdate"
		}
	})

	var_26_15.id = "timer"

	arg_26_0:addElement(var_26_15)

	local var_26_16 = LUI.UITimer.new({
		event = "autoScrollTimerUpdate",
		interval = var_0_0
	})

	var_26_16.id = "autoScrollTimer"

	arg_26_0:addElement(var_26_16)

	arg_26_0._autoScrollEnabled = true

	arg_26_0:registerEventHandler("autoScrollTimerUpdate", function(arg_48_0, arg_48_1)
		local var_48_0 = LUI.IsLastInputMouseNavigation(arg_26_1) and arg_26_0._gridChildMouseFocusCount > 0

		if arg_26_0._autoScrollEnabled and not var_48_0 and arg_26_0._selectedCategory and arg_26_0._selectedBundle and #arg_26_0._allCategoryData > 0 then
			local var_48_1 = arg_26_0._allCategoryData[arg_26_0._selectedCategory]
			local var_48_2 = arg_26_0._selectedBundle + 1

			if var_48_2 > #var_48_1.items then
				var_48_2 = 1
			end

			local var_48_3 = arg_26_0.BundlesGrid:GetElementAtPosition(0, arg_26_0._selectedCategory - 1)

			if var_48_3 then
				local var_48_4 = var_48_3.RowGrid

				arg_26_0._autoScroll = true

				var_48_4:SetFocusedPosition({
					y = 0,
					x = var_48_2 - 1
				}, false)

				arg_26_0._autoScroll = false
			end
		end
	end)

	arg_26_0._autoScrollEnabledTimerHolder = LUI.UIElement.new()

	arg_26_0:addElement(arg_26_0._autoScrollEnabledTimerHolder)

	function arg_26_0.DisableAutoScrollTimer()
		arg_26_0._autoScrollEnabled = false
		arg_26_0._autoScrollEnabledTimerHolder:Wait(Dvar.CFHDGABACF("NPSTPKMPKS"), true).onComplete = function()
			arg_26_0._autoScrollEnabled = true
		end
	end

	local var_26_17 = LUI.UIBindButton.new()

	var_26_17.id = "bindButton"

	arg_26_0:addElement(var_26_17)

	arg_26_0.bindButton = var_26_17

	arg_26_0.bindButton:addEventHandler("button_alt1", function(arg_51_0, arg_51_1)
		local var_51_0 = arg_26_0._allCategoryData[arg_26_0._selectedCategory]

		if var_51_0 == nil then
			return
		end

		if not var_51_0.isFirstPartyCategory then
			arg_26_0._startPurchaseImmediately = true

			arg_26_0:BillboardCategoryButtonAction(nil, nil, var_51_0)
		else
			local var_51_1 = arg_26_0._selectedBundle or 1
			local var_51_2 = var_51_0.items[var_51_1]

			LUI.FlowManager.GetScopedData(arg_26_0).firstPartyColumnIndex = var_51_1

			if var_51_2.buttonAction then
				arg_26_0._startPurchaseImmediately = false

				var_51_2.buttonAction(arg_51_0, arg_51_1)

				return
			end
		end
	end)

	local function var_26_18(arg_52_0)
		assert(arg_52_0)

		local var_52_0 = {
			bundleGiftInfo = arg_26_0._selectedBundleGiftInfo,
			recipientXuidString = arg_52_0
		}

		LUI.FlowManager.RequestPopupMenu(nil, "GiftBundlePurchaseConfirmationPopup", true, arg_26_1, false, var_52_0)
	end

	local function var_26_19(arg_53_0)
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)

		if not arg_26_0._storeEnterComplete then
			QUARTERMASTER.RecordStoreEnterEvent(arg_26_1, arg_26_0._storeLayout, arg_26_0.recommendationData, arg_26_0._sourceMenu, arg_26_0._allCategoryData)
			QUARTERMASTER.BeginMenuBrowseEvent(arg_26_0._controllerIndex, arg_26_0._categoryData, arg_26_0._categoryData.items[1], arg_26_0._storeLayout, arg_26_0.recommendationData)

			arg_26_0._storeEnterComplete = true
		end

		QUARTERMASTER.RecordMenuBrowseEvent(arg_26_1, true)
		STORE.GoToStore(arg_26_1, arg_26_0:GetCurrentMenu().id, arg_53_0.id)
	end

	local function var_26_20()
		if arg_26_0._isItemGiftable then
			local var_54_0 = arg_26_0._allCategoryData[arg_26_0._selectedCategory]
			local var_54_1 = arg_26_0._selectedBundle or 1
			local var_54_2 = var_54_0.items[var_54_1]
			local var_54_3 = var_54_2.id

			arg_26_0._selectedBundleGiftInfo = var_54_2

			local var_54_4 = {
				controllerIndex = arg_26_1,
				bundleSKU = var_54_2.id,
				selectedGifteeCallback = var_26_18
			}

			local function var_54_5()
				local var_55_0 = MenuBuilder.BuildRegisteredType("GiftingFriendSelectPopup", var_54_4)

				LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_26_1, false, {
					flyInLeftNarrow = true,
					widget = var_55_0
				})
			end

			GIFT.StartFTUEFlow(arg_26_0, var_54_5)
		end
	end

	if CONDITIONS.IsNotWZStoreDisabledOrIsNotMagmaGameMode() then
		local var_26_21 = CONDITIONS.IsGiftingEnabled()
		local var_26_22 = var_26_21 and var_26_20 or var_26_19

		arg_26_0.bindButton:addEventHandler("button_alt2", function(arg_56_0, arg_56_1)
			var_26_22(arg_56_0)
		end)

		if var_26_21 then
			local var_26_23 = LUI.UIBindButton.new()

			var_26_23.id = "bindButtonFranchiseStore"

			arg_26_0:addElement(var_26_23)

			arg_26_0.bindButtonFranchiseStore = var_26_23

			arg_26_0.bindButtonFranchiseStore:addEventHandler("button_right_stick", function(arg_57_0, arg_57_1)
				var_26_19(arg_57_0)
			end)
		end
	end

	arg_26_0.bindButton:addEventHandler("button_left_stick", function(arg_58_0, arg_58_1)
		if Dvar.IBEGCHEFE("OLNMSNSTKS") then
			LUI.FlowManager.RequestPopupMenu(arg_26_0, "CreatorCodePopup", true, arg_26_1, false, arg_26_2)
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
		end
	end)
	arg_26_0.bindButton:addEventHandler("button_left_trigger", function(arg_59_0, arg_59_1)
		LUI.FlowManager.RequestAddMenu("BundleLockerMenu", true, arg_26_0._controllerIndex, false)
	end)
	arg_26_0:addEventHandler("gamepad_button", function(arg_60_0, arg_60_1)
		if arg_60_1.controller ~= arg_26_1 and (arg_60_1.button == "primary" or arg_60_1.button == "alt1" or arg_60_1.button == "alt2" or arg_60_1.button == "left" or arg_60_1.button == "right" or arg_60_1.button == "up" or arg_60_1.button == "down") then
			return true
		end
	end)

	local function var_26_24(arg_61_0, arg_61_1)
		local var_61_0 = CONDITIONS.IsGiftingEnabled() and "button_right_stick" or "button_alt2"

		if arg_61_0._menu.HelperBar ~= nil then
			arg_61_0._menu.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = var_61_0
			})
		end

		if LUI.IsLastInputGamepad(arg_26_1) and CONDITIONS.IsNotWZStoreDisabledOrIsNotMagmaGameMode() then
			arg_61_0.FranchiseStorePrompt:SetAlpha(1)

			if arg_61_0._gridChildMouseFocusCount == 0 and arg_61_0._focusedBundle then
				arg_61_0._focusedBundle:GainFocus(arg_61_1)
			end
		else
			if arg_61_0._gridChildMouseFocusCount == 0 and arg_61_0._focusedBundle then
				arg_61_0._focusedBundle:processEvent({
					name = "gain_focus"
				})
			end

			arg_61_0.FranchiseStorePrompt:SetAlpha(0)

			if arg_61_0._menu.HelperBar ~= nil and CONDITIONS.IsNotWZStoreDisabledOrIsNotMagmaGameMode() then
				arg_61_0._menu.HelperBar.ButtonHelperText:PushButtonPrompt({
					kbm_only = true,
					helper_text = Engine.CBBHFCGDIC("MENU/STORE_CAT_FRANCHISE"),
					button_ref = var_61_0,
					container = arg_61_0.FranchisePromptContainer,
					containerAlignment = LUI.Alignment.Right
				})
			end
		end
	end

	arg_26_0.BundlesGrid:addEventHandler("layout_initialized", function(arg_62_0, arg_62_1)
		arg_26_0._menu = arg_62_0:GetCurrentMenu()

		arg_26_0:addAndCallEventHandler("update_input_type", var_26_24)

		local var_62_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_26_1)

		if var_62_0._selectedCategory then
			arg_62_0:SetFocusedPosition({
				x = 0,
				y = var_62_0._selectedCategory - 1
			}, false)
		else
			arg_62_0:GainFocus({
				controllerIndex = arg_26_1
			})
		end
	end)
	arg_26_0.ArrowUp:addEventHandler("grid_focus_up_blocked", function(arg_63_0, arg_63_1)
		arg_63_0:SetAlpha(0, 100)
	end)
	arg_26_0.ArrowUp:addEventHandler("grid_focus_up_not_blocked", function(arg_64_0, arg_64_1)
		arg_64_0:SetAlpha(1, 200)
	end)
	arg_26_0.ArrowDown:addEventHandler("grid_focus_down_blocked", function(arg_65_0, arg_65_1)
		arg_65_0:SetAlpha(0, 100)
	end)
	arg_26_0.ArrowDown:addEventHandler("grid_focus_down_not_blocked", function(arg_66_0, arg_66_1)
		arg_66_0:SetAlpha(1, 200)
	end)

	local function var_26_25(arg_67_0)
		if not arg_67_0.numRowsPassed then
			arg_67_0.numRowsPassed = 0
		end

		if arg_67_0.numRowsPassed == 0 then
			arg_67_0.waitingForNextScroll = true
			arg_67_0:Wait(Dvar.CFHDGABACF("LRKMTOLKTO")).onComplete = function()
				arg_67_0.waitingForNextScroll = false
				arg_67_0.numRowsPassed = 0
			end
		end

		arg_67_0.numRowsPassed = arg_67_0.numRowsPassed + 1
	end

	local function var_26_26(arg_69_0)
		local var_69_0 = Dvar.CFHDGABACF("MKRLLMTMRS")

		return arg_69_0.numRowsPassed and var_69_0 <= arg_69_0.numRowsPassed
	end

	local function var_26_27(arg_70_0, arg_70_1)
		local var_70_0 = var_26_26(arg_26_0)

		if arg_70_1.down and arg_70_1.qualifier == "mousewheel" and (not arg_26_0.waitingForNextScroll or not var_70_0) then
			var_26_25(arg_26_0)

			return arg_26_0.BundlesGrid:GamepadButton(arg_70_1)
		end
	end

	local function var_26_28(arg_71_0, arg_71_1)
		if arg_71_1.down and arg_71_1.qualifier == "mousewheel" then
			local var_71_0 = var_26_26(arg_26_0)

			if not arg_26_0.waitingForNextScroll or not var_71_0 then
				var_26_25(arg_26_0)

				return arg_26_0.BundlesGrid:GamepadButton(arg_71_1)
			end
		else
			return arg_26_0.BundlesGrid:GamepadButton(arg_71_1)
		end
	end

	arg_26_0.BillboardItem.Image:SetHandleMouse(true)
	arg_26_0.BillboardItem.Image:registerEventHandler("leftmousedown", function(arg_72_0, arg_72_1)
		return true
	end)
	arg_26_0.BillboardItem.Image:registerEventHandler("leftmouseup", function(arg_73_0, arg_73_1)
		if arg_26_0._allCategoryData ~= nil then
			local var_73_0 = arg_26_0._allCategoryData[arg_26_0._selectedCategory]

			if var_73_0 ~= nil then
				arg_26_0:BillboardCategoryButtonAction(arg_73_0, arg_73_1, var_73_0)
			end
		end

		return true
	end)
	arg_26_0.BillboardItem.Image:addEventHandler("gamepad_button", var_26_27)

	arg_26_0.BundlesGrid._showNumbersAndArrowsKBM = true
	arg_26_0.BundlesGrid._updateArrowVisibilityOnRefresh = false
	arg_26_0.BundlesGrid._alwaysTrapMouseWheel = true

	arg_26_0.BundlesGrid:registerEventHandler("gamepad_button", var_26_28)
	arg_26_0.MouseScrollCatcher:SetHandleMouse(true)
	arg_26_0.MouseScrollCatcher:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_NORMAL)
	arg_26_0.MouseScrollCatcher:addEventHandler("gamepad_button", var_26_27)
	arg_26_0:addEventHandler("tab_create", function(arg_74_0, arg_74_1)
		local var_74_0 = arg_74_0:GetCurrentMenu()

		if var_74_0 then
			local var_74_1 = LUI.FlowManager.GetScopedData(var_74_0)

			if var_74_1.returnToEventTabFromStore then
				var_74_1.returnToEventTabFromStore = nil
				arg_74_0._returnToEventTabFromStore = true
			end
		end
	end)
	arg_26_0:addEventHandler("ingamestore_purchased_product", function(arg_75_0, arg_75_1)
		if arg_75_1.transactionResult == STORE.TransactionResult.TRANSACTION_SUCCEEDED then
			var_0_16(arg_26_0, arg_75_1.controllerIndex)
		end
	end)
end

function MPStoreBillboardGrid(arg_76_0, arg_76_1)
	local var_76_0 = LUI.UIElement.new()

	var_76_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_76_0.id = "MPStoreBillboardGrid"
	var_76_0._animationSets = var_76_0._animationSets or {}
	var_76_0._sequences = var_76_0._sequences or {}

	local var_76_1 = arg_76_1 and arg_76_1.controllerIndex

	if not var_76_1 and not Engine.DDJFBBJAIG() then
		var_76_1 = var_76_0:getRootController()
	end

	assert(var_76_1)

	local var_76_2 = var_76_0
	local var_76_3
	local var_76_4 = LUI.UIImage.new()

	var_76_4.id = "Background"

	var_76_4:SetRGBFromInt(0, 0)
	var_76_4:SetAlpha(0.95, 0)
	var_76_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_76_4:SetVMin(0.5, 0)
	var_76_0:addElement(var_76_4)

	var_76_0.Background = var_76_4

	local var_76_5
	local var_76_6 = LUI.UIImage.new()

	var_76_6.id = "MouseScrollCatcher"

	var_76_6:SetRGBFromInt(0, 0)
	var_76_6:SetAlpha(0, 0)
	var_76_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_76_6:SetVMin(0.5, 0)
	var_76_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 200, _1080p * -85)
	var_76_0:addElement(var_76_6)

	var_76_0.MouseScrollCatcher = var_76_6

	local var_76_7
	local var_76_8 = MenuBuilder.BuildRegisteredType("StoreBillboardItem", {
		controllerIndex = var_76_1
	})

	var_76_8.id = "BillboardItem"

	var_76_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 200, _1080p * 780)
	var_76_0:addElement(var_76_8)

	var_76_0.BillboardItem = var_76_8

	local var_76_9
	local var_76_10 = {
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
		controllerIndex = var_76_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MPStoreBillboardGridRow", {
				controllerIndex = var_76_1
			})
		end,
		refreshChild = function(arg_78_0, arg_78_1, arg_78_2)
			return
		end,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1680,
		rowHeight = _1080p * 190,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_76_11 = LUI.UIPeekingGrid.new(var_76_10)

	var_76_11.id = "BundlesGrid"

	var_76_11:setUseStencil(true)
	var_76_11:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 130, _1080p * -140, _1080p * -370, 0)
	var_76_0:addElement(var_76_11)

	var_76_0.BundlesGrid = var_76_11

	local var_76_12
	local var_76_13 = LUI.UIImage.new()

	var_76_13.id = "GridMask"

	var_76_13:setImage(RegisterMaterial("store_bundle_grid_mask"), 0)
	var_76_13:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 120, _1080p * -120, _1080p * -370, _1080p * -54)
	var_76_0:addElement(var_76_13)

	var_76_0.GridMask = var_76_13

	local var_76_14
	local var_76_15 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_76_1
	})

	var_76_15.id = "VerticalScrollbar"

	var_76_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -140, _1080p * -129, _1080p * -330, _1080p * -85)
	var_76_0:addElement(var_76_15)

	var_76_0.VerticalScrollbar = var_76_15

	local var_76_16
	local var_76_17 = MenuBuilder.BuildRegisteredType("NoMoreItemsMessage", {
		controllerIndex = var_76_1
	})

	var_76_17.id = "NoMoreItemsMessage"

	var_76_17:SetAlpha(0, 0)
	var_76_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -90, _1080p * -10)
	var_76_0:addElement(var_76_17)

	var_76_0.NoMoreItemsMessage = var_76_17

	local var_76_18
	local var_76_19 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_76_1
	})

	var_76_19.id = "StoreEmpty"

	var_76_19:SetAlpha(0, 0)
	var_76_19.Backer:SetRGBFromTable(SWATCHES.Store.NoItemBGAlt, 0)
	var_76_19.Backer:SetAlpha(1, 0)
	var_76_19.Node:SetRGBFromTable(SWATCHES.Store.NoItemTimer, 0)
	var_76_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 246, _1080p * 160, _1080p * 194)
	var_76_0:addElement(var_76_19)

	var_76_0.StoreEmpty = var_76_19

	local var_76_20
	local var_76_21 = MenuBuilder.BuildRegisteredType("StoreScrollArrow", {
		controllerIndex = var_76_1
	})

	var_76_21.id = "ArrowDown"

	var_76_21:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -110, _1080p * -60)
	var_76_0:addElement(var_76_21)

	var_76_0.ArrowDown = var_76_21

	local var_76_22
	local var_76_23 = MenuBuilder.BuildRegisteredType("StoreScrollArrow", {
		controllerIndex = var_76_1
	})

	var_76_23.id = "ArrowUp"

	var_76_23:SetZRotation(180, 0)
	var_76_23.FreeBundleText:SetZRotation(180, 0)
	var_76_23:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -350, _1080p * -300)
	var_76_0:addElement(var_76_23)

	var_76_0.ArrowUp = var_76_23

	local var_76_24
	local var_76_25 = MenuBuilder.BuildRegisteredType("PromptButton", {
		controllerIndex = var_76_1
	})

	var_76_25.id = "FranchiseStorePrompt"

	var_76_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -330, _1080p * -130, _1080p * 164, _1080p * 196)
	var_76_0:addElement(var_76_25)

	var_76_0.FranchiseStorePrompt = var_76_25

	local var_76_26
	local var_76_27 = MenuBuilder.BuildRegisteredType("SupportingCreatorCode", {
		controllerIndex = var_76_1
	})

	var_76_27.id = "SupportingCreatorCode"

	var_76_27:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -761, _1080p * -371, _1080p * 172, _1080p * 196)
	var_76_0:addElement(var_76_27)

	var_76_0.SupportingCreatorCode = var_76_27

	local var_76_28
	local var_76_29 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_76_1
	})

	var_76_29.id = "FranchisePromptContainer"

	if CONDITIONS.AlwaysFalse() then
		var_76_29.Label:setText("", 0)
	end

	var_76_29:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -361, _1080p * -130, _1080p * 165, _1080p * 196)
	var_76_0:addElement(var_76_29)

	var_76_0.FranchisePromptContainer = var_76_29

	local var_76_30
	local var_76_31 = MenuBuilder.BuildRegisteredType("StoreSaleBanner", {
		controllerIndex = var_76_1
	})

	var_76_31.id = "SaleBanner"

	var_76_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 830, _1080p * 175, _1080p * 210)
	var_76_0:addElement(var_76_31)

	var_76_0.SaleBanner = var_76_31

	local function var_76_32()
		return
	end

	var_76_0._sequences.DefaultSequence = var_76_32

	local var_76_33
	local var_76_34 = {
		{
			value = 0.47,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_6:RegisterAnimationSequence("EmptyStore", var_76_34)

	local var_76_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_8:RegisterAnimationSequence("EmptyStore", var_76_35)

	local var_76_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_11:RegisterAnimationSequence("EmptyStore", var_76_36)

	local var_76_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_13:RegisterAnimationSequence("EmptyStore", var_76_37)

	local var_76_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_15:RegisterAnimationSequence("EmptyStore", var_76_38)

	local var_76_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_17:RegisterAnimationSequence("EmptyStore", var_76_39)

	local var_76_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_19:RegisterAnimationSequence("EmptyStore", var_76_40)

	local var_76_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_21:RegisterAnimationSequence("EmptyStore", var_76_41)

	local var_76_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_23:RegisterAnimationSequence("EmptyStore", var_76_42)

	local var_76_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_25:RegisterAnimationSequence("EmptyStore", var_76_43)

	local var_76_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_27:RegisterAnimationSequence("EmptyStore", var_76_44)

	local var_76_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_29:RegisterAnimationSequence("EmptyStore", var_76_45)

	local var_76_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_76_31:RegisterAnimationSequence("EmptyStore", var_76_46)

	local function var_76_47()
		var_76_6:AnimateSequence("EmptyStore")
		var_76_8:AnimateSequence("EmptyStore")
		var_76_11:AnimateSequence("EmptyStore")
		var_76_13:AnimateSequence("EmptyStore")
		var_76_15:AnimateSequence("EmptyStore")
		var_76_17:AnimateSequence("EmptyStore")
		var_76_19:AnimateSequence("EmptyStore")
		var_76_21:AnimateSequence("EmptyStore")
		var_76_23:AnimateSequence("EmptyStore")
		var_76_25:AnimateSequence("EmptyStore")
		var_76_27:AnimateSequence("EmptyStore")
		var_76_29:AnimateSequence("EmptyStore")
		var_76_31:AnimateSequence("EmptyStore")
	end

	var_76_0._sequences.EmptyStore = var_76_47

	local var_76_48 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_76_15,
		startCap = var_76_15.startCap,
		endCap = var_76_15.endCap,
		sliderArea = var_76_15.sliderArea,
		slider = var_76_15.sliderArea and var_76_15.sliderArea.slider,
		fixedSizeSlider = var_76_15.sliderArea and var_76_15.sliderArea.fixedSizeSlider
	})

	var_76_11:AddScrollbar(var_76_48)
	var_76_11:AddArrow(var_76_23)
	var_76_11:AddArrow(var_76_21)
	var_0_19(var_76_0, var_76_1, arg_76_1)

	return var_76_0
end

MenuBuilder.registerType("MPStoreBillboardGrid", MPStoreBillboardGrid)
LockTable(_M)
