module(..., package.seeall)

local var_0_0 = 3000
local var_0_1 = true

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = arg_1_2.items[1] or {}

	if arg_1_2.isFirstPartyCategory then
		local var_1_2 = {
			asset = "mw_store_billboard_placeholder",
			name = "MENU/FETCHING_STORE_DATA",
			buttonAction = function()
				return
			end
		}

		table.insert(var_1_0, var_1_2)
	elseif arg_1_2.idPubVar and var_1_1.layoutOnlyItem then
		local var_1_3 = Dvar.DHEEJCCJBH(arg_1_2.idPubVar) or ""

		if arg_1_2.justForYou and arg_1_0._recommendations then
			local var_1_4 = {
				items = arg_1_0._recommendations
			}

			var_1_4.isEnabled = true
			arg_1_0.recommendationData = var_1_4
			var_1_3 = STORE.FormatRecommendationItems(arg_1_0._recommendations .. "," .. var_1_3)
		end

		local var_1_5 = split(var_1_3, ",")
		local var_1_6 = 0

		arg_1_2.hasFirstPartyBundle = false

		for iter_1_0 = 1, #var_1_5 do
			local var_1_7 = tonumber(var_1_5[iter_1_0])

			if STORE.BundleAvailable(arg_1_1, var_1_7) then
				local var_1_8 = LUI.DeepCopy(var_1_1)

				var_1_8.emptyCategory = false
				var_1_8.id = var_1_7

				local var_1_9 = {
					file = CSV.bundleIDs.file,
					cols = CSV.bundleIDs.cols
				}
				local var_1_10 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_1_5[iter_1_0])
				local var_1_11 = CSV.ReadRow(var_1_9, var_1_10)

				var_1_8.name = var_1_11.name
				var_1_8.asset = var_1_11.image
				var_1_8.description = STORE.GetBundleDescription(var_1_8.id)
				var_1_8.rarity = var_1_11.rarity
				var_1_8.bundleType = var_1_11.bundleType
				var_1_8.titleImage = var_1_11.titleImage
				var_1_8.currencyID = tonumber(var_1_11.currencyID)
				var_1_8.currencyAmount = tonumber(var_1_11.currencyAmount)
				var_1_8.firstPartyProductID = #var_1_11.firstPartyProductID > 0 and var_1_11.firstPartyProductID or nil
				var_1_8.purchaseEnd = var_1_11.purchaseEnd ~= "" and var_1_11.purchaseEnd or nil

				if var_1_7 == tonumber(BATTLEPASS.GetTierSkipGiftID()) and BATTLEPASS.IsTierSkipGiftActive(arg_1_1) then
					var_1_8.purchaseEnd = BATTLEPASS.GetTierSkipGiftTimer()
				end

				local var_1_12, var_1_13, var_1_14 = STORE.GetCategoryTimeLeft(nil, var_1_8.purchaseEnd)

				if not var_1_8.purchaseEnd or var_1_12 > 0 then
					table.insert(var_1_0, var_1_8)

					var_1_6 = var_1_6 + 1
				end

				if var_1_8.firstPartyProductID then
					arg_1_2.hasFirstPartyBundle = true
				end
			end

			if var_1_6 == arg_1_2.numItemsShown then
				break
			end
		end
	end

	if #var_1_0 == 0 then
		local var_1_15 = LUI.DeepCopy(var_1_1)

		var_1_15.emptyCategory = true
		var_1_15.titleImage = nil
		var_1_15.purchaseEnd = nil
		var_1_15.asset = "mw_store_billboard_placeholder"
		var_1_15.name = "LUA_MENU/EMPTY"

		table.insert(var_1_0, var_1_15)
	end

	arg_1_2.items = var_1_0
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0, var_3_1 = STORE.GetIndexForBundle(arg_3_1, arg_3_0._controllerIndex)

	if var_3_0 and var_3_1 and arg_3_0.BundlesGrid then
		local var_3_2 = arg_3_0._allCategoryData[var_3_0]
		local var_3_3 = LUI.FlowManager.GetPerControllerPersistentData(arg_3_0._controllerIndex)

		arg_3_0._selectedCategory = var_3_0
		var_3_3._selectedCategory = var_3_2.categoryIndex
		arg_3_0._selectedBundle = var_3_1

		arg_3_0.BundlesGrid:SetFocusedPosition({
			x = 0,
			y = var_3_0 - 1
		}, true)
		arg_3_0:BillboardCategoryButtonAction(element, event, var_3_2)
	else
		LUI.FlowManager.RequestPopupMenu(arg_3_0, "PopupOK", true, arg_3_0._controllerIndex, false, {
			message = Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_NOT_AVAILABLE")
		})
	end
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = STORE.GetCategoryIndex(arg_4_1)

	if var_4_0 and arg_4_0.BundlesGrid then
		local var_4_1 = arg_4_0._allCategoryData[var_4_0]
		local var_4_2 = LUI.FlowManager.GetPerControllerPersistentData(arg_4_0._controllerIndex)

		arg_4_0._selectedCategory = var_4_0
		var_4_2._selectedCategory = var_4_1.categoryIndex

		arg_4_0.BundlesGrid:SetFocusedPosition({
			x = 0,
			y = var_4_0 - 1
		}, true)
	end
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_0._selectedBundle or 1
	local var_5_1 = arg_5_3.items[var_5_0]
	local var_5_2 = var_5_1.id

	if var_5_1.emptyCategory then
		arg_5_0._startPurchaseImmediately = false

		return
	end

	local var_5_3 = LUI.FlowManager.GetScopedData(arg_5_0)

	var_5_3.selectedBundleIndex = var_5_0

	if arg_5_3.isFirstPartyCategory then
		var_5_3.firstPartyColumnIndex = var_5_0

		if var_5_1.buttonAction then
			arg_5_0._startPurchaseImmediately = false

			var_5_1.buttonAction(arg_5_1, arg_5_2)

			return
		end
	else
		var_5_3.firstPartyColumnIndex = nil
	end

	if not arg_5_0._storeEnterComplete then
		QUARTERMASTER.RecordStoreEnterEvent(arg_5_0._controllerIndex, arg_5_0._storeLayout, arg_5_0.recommendationData, arg_5_0._sourceMenu)
		QUARTERMASTER.BeginMenuBrowseEvent(arg_5_0._controllerIndex, arg_5_3, arg_5_3.items[1], arg_5_0._storeLayout, arg_5_0.recommendationData)

		arg_5_0._storeEnterComplete = true
	end

	QUARTERMASTER.RecordMenuBrowseEvent(arg_5_0._controllerIndex, true)
	STORE.MarkItemSeen(arg_5_0._controllerIndex, var_5_2)
	arg_5_0.BundlesGrid:RefreshContent()

	if var_5_1.firstPartyProductID then
		local var_5_4 = var_5_1.firstPartyProductID

		if STORE.IsGameUpsellBundle(var_5_2) then
			LUI.FlowManager.RequestPopupMenu(arg_5_0, "StoreGameUpsellPopup", true, arg_5_0._controllerIndex, false, {
				defaultProductId = var_5_4
			})
		elseif arg_5_0._catalogStatus == InGameStoreCatalogStatus.READY then
			if STORE.GetNumItemsInBundle(var_5_2) > 0 then
				local var_5_5 = STORE.GetFirstPartyBundleData(arg_5_0._controllerIndex, var_5_2, var_5_4)

				var_5_5.bundleIndex = var_5_0

				LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_5_0._controllerIndex, false, var_5_5)
			else
				InGameStore.SelectProduct(arg_5_0._controllerIndex, var_5_4, InGameStorePurchaseType.BROWSE)
			end
		else
			local var_5_6 = {
				message = arg_5_0._catalogFetchErrorMessage
			}

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_5_6, nil, false, true)
		end

		return
	end

	local var_5_7 = {
		bundleID = var_5_1.id,
		rarity = var_5_1.rarity,
		description = var_5_1.description,
		bundleType = var_5_1.bundleType,
		titleImage = var_5_1.titleImage,
		currencyID = var_5_1.currencyID,
		currencyAmount = var_5_1.currencyAmount,
		startPurchaseImmediately = arg_5_0._startPurchaseImmediately,
		timerValue = var_5_1.purchaseEnd,
		bundleIndex = var_5_0,
		positionInGrid = arg_5_0._positionInGrid,
		categoryIndex = arg_5_3.categoryIndex,
		categoryName = arg_5_3.id,
		storeLayout = arg_5_0._storeLayout,
		sourceMenu = arg_5_0._sourceMenu,
		recommendationData = arg_5_0.recommendationData
	}

	arg_5_0._startPurchaseImmediately = false

	if not arg_5_3.justForYou then
		var_5_7.timerPubVar = arg_5_3.timerPubVar
	end

	if Dvar.IBEGCHEFE("SKLSORKTK") and not BATTLEPASS.IsOwned(arg_5_0._controllerIndex) and STORE.BundleContainsBattlePass(var_5_1.id) then
		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_5_0._controllerIndex, false, {
			purchaseBattlePassInStore = true
		})
	else
		LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_5_0._controllerIndex, false, var_5_7)
	end
end

local function var_0_6(arg_6_0, arg_6_1)
	local var_6_0 = {
		{
			name = "INGAMESTORE/CATEGORY_CODPOINTS",
			titleImage = "mw_store_title_cod_points",
			asset = "mw_store_billboard_cod_points",
			id = STORE.CODPointsCategory
		},
		{
			name = "LUA_MENU/CWL_MODES",
			titleImage = "mw_store_title_cdl",
			asset = "mw_store_billboard_cdl",
			id = STORE.CDLCategory
		},
		{
			name = "LUA_MENU_MP/COD_ENDOWMENT",
			titleImage = "mw_store_title_code_pack_ii",
			asset = "mw_store_billboard_code_pack_ii",
			id = STORE.MiscCategory
		},
		{
			name = "INGAMESTORE/PRODUCT_MW2R",
			titleImage = "mw_store_title_ghost_pack_oil_rig",
			asset = "mw_store_billboard_ghost_pack_oil_rig",
			id = STORE.TitlesCategory
		},
		{
			id = -1,
			name = "MENU/STORE_CAT_FRANCHISE",
			titleImage = "mw_store_title_franchise_store",
			asset = "mw_store_billboard_franchise_store"
		}
	}

	arg_6_0._allCategoryData[#arg_6_0._allCategoryData].items = {}

	for iter_6_0 = 1, #var_6_0 do
		local var_6_1 = var_6_0[iter_6_0]
		local var_6_2

		if var_6_1.id == -1 then
			var_6_2 = {
				asset = var_6_1.asset,
				name = var_6_1.name,
				titleImage = var_6_1.titleImage
			}

			function var_6_2.buttonAction(arg_7_0, arg_7_1)
				STORE.GoToStore(arg_6_1, arg_6_0:GetCurrentMenu().id, arg_7_0.id)
			end
		else
			local var_6_3 = InGameStore.GetCategoryProducts(arg_6_1, var_6_1.id)

			if var_6_3 and #var_6_3 > 0 then
				local var_6_4 = var_6_1.id == STORE.MiscCategory
				local var_6_5 = var_6_1.id == STORE.TitlesCategory
				local var_6_6 = false
				local var_6_7 = false

				if var_6_4 then
					for iter_6_1 = 1, #var_6_3 do
						if var_6_3[iter_6_1].productId == STORE.CODEID or var_6_3[iter_6_1].productId == STORE.CODE2ID then
							local var_6_8 = InGameStore.GetProduct(arg_6_1, var_6_3[iter_6_1].productId)

							var_6_6 = not (var_6_8 and var_6_8.status ~= InGameStoreProductStatus.NOT_OWNED)

							break
						end
					end
				end

				if var_6_5 then
					for iter_6_2 = 1, #var_6_3 do
						if var_6_3[iter_6_2].productId == STORE.MW2RProductID then
							local var_6_9 = InGameStore.GetProduct(arg_6_1, STORE.MW2RProductID)

							var_6_7 = not (var_6_9 and var_6_9.status ~= InGameStoreProductStatus.NOT_OWNED)

							break
						end
					end
				end

				local var_6_10 = var_6_5 and var_6_7
				local var_6_11 = var_6_4 and var_6_6

				if not var_6_5 and not var_6_4 or var_6_10 or var_6_11 then
					var_6_2 = {
						asset = var_6_1.asset,
						name = var_6_1.name,
						titleImage = var_6_1.titleImage
					}

					function var_6_2.buttonAction(arg_8_0, arg_8_1)
						STORE.GoToStore(arg_6_1, arg_6_0:GetCurrentMenu().id, arg_8_0.id, var_6_3[1].productId)
					end
				end
			end
		end

		if var_6_2 then
			table.insert(arg_6_0._allCategoryData[#arg_6_0._allCategoryData].items, var_6_2)
		end
	end

	arg_6_0:dispatchEventToChildren({
		name = "categoryTimerUpdate"
	})

	if arg_6_0._allCategoryData[#arg_6_0._allCategoryData].isFirstPartyCategory and arg_6_0._selectedCategory == arg_6_0._allCategoryData[#arg_6_0._allCategoryData].categoryIndex then
		local var_6_12 = arg_6_0.BundlesGrid:GetElementAtPosition(0, arg_6_0._selectedCategory - 1)

		if var_6_12 then
			local var_6_13 = LUI.FlowManager.GetScopedData(arg_6_0)
			local var_6_14 = var_6_12.RowGrid

			if not var_6_13.firstPartyColumnIndex or var_6_13.firstPartyColumnIndex == 1 then
				var_6_14:GetElementAtPosition(0, 0):processEvent({
					name = "button_over"
				})
			else
				var_6_14:SetFocusedPosition({
					y = 0,
					x = var_6_13.firstPartyColumnIndex - 1
				}, true)
			end
		end
	end
end

local function var_0_7(arg_9_0, arg_9_1)
	InGameStore.FetchCatalog(arg_9_1, false, true)

	arg_9_0._catalogStatus = InGameStore.GetCatalogStatus(arg_9_1)
	arg_9_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE")

	local var_9_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "refresh_timer",
			controllerIndex = arg_9_1
		}
	})

	var_9_0.id = "refreshTimer"

	arg_9_0:addElement(var_9_0)

	arg_9_0._refreshTimer = var_9_0

	arg_9_0:registerEventHandler("refresh_timer", function(arg_10_0, arg_10_1)
		local var_10_0 = InGameStore.GetCatalogStatus(arg_10_1.controllerIndex)
		local var_10_1 = false

		if arg_9_0._catalogStatus == InGameStoreCatalogStatus.FETCHING and var_10_0 == InGameStoreCatalogStatus.READY then
			arg_9_0:dispatchEventToChildren({
				catalogFetched = true,
				name = "categoryTimerUpdate"
			})
		end

		arg_9_0._catalogStatus = var_10_0

		if arg_9_0._catalogStatus == InGameStoreCatalogStatus.READY then
			var_0_6(arg_9_0, arg_9_1)

			var_10_1 = true
		elseif arg_9_0._catalogStatus == InGameStoreCatalogStatus.ERROR then
			var_10_1 = true

			if Engine.DBFCJBDJEC() then
				local var_10_2 = Engine.BIAFEJHHDD()

				if var_10_2 ~= nil then
					local var_10_3 = Engine.JCBDICCAH(var_10_2)

					arg_9_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_10_3)

					Engine.DCFIDJGACA()
				else
					arg_9_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_10_4 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				arg_9_0._catalogFetchErrorMessage = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_10_4)
			end

			Engine.DHCGHHBHCH()

			if Commerce.CCIEAECGHB() then
				var_0_6(arg_9_0, arg_9_1)
			else
				arg_9_0._allCategoryData[#arg_9_0._allCategoryData].items[1].fetchingDataFailed = true

				arg_9_0:dispatchEventToChildren({
					name = "categoryTimerUpdate"
				})
			end
		end

		if var_10_1 then
			arg_10_0._refreshTimer:closeTree()

			arg_10_0._refreshTimer = nil
		end
	end)
end

local function var_0_8(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = "DefaultSequence"
	local var_11_2 = "DefaultSequence"

	if arg_11_0._selectedCategory > 1 then
		for iter_11_0 = arg_11_0._selectedCategory - 1, 1, -1 do
			table.insert(var_11_0, arg_11_0._allCategoryData[iter_11_0])
		end
	end

	if arg_11_0._selectedCategory < #arg_11_0._allCategoryData then
		for iter_11_1 = arg_11_0._selectedCategory + 1, #arg_11_0._allCategoryData do
			table.insert(var_11_0, arg_11_0._allCategoryData[iter_11_1])
		end
	end

	for iter_11_2 = 1, #var_11_0 do
		local var_11_3 = var_11_0[iter_11_2]

		var_11_3.hasNewItems = false
		var_11_3.hasFreeItems = false

		if var_0_1 and Dvar.IBEGCHEFE("LSOLLKOPQT") then
			var_11_3.hasFreeItems = STORE.CategoryHasFreeItems(arg_11_0._controllerIndex, var_11_3)
		end

		for iter_11_3 = 1, #var_11_3.items do
			local var_11_4 = var_11_3.items[iter_11_3]

			if var_11_4.id and not STORE.HasSeenItem(arg_11_0._controllerIndex, var_11_4.id) then
				var_11_3.hasNewItems = true

				break
			end
		end

		if var_11_3.categoryIndex < arg_11_0._selectedCategory then
			if var_11_3.hasFreeItems then
				var_11_1 = "Free"
			elseif var_11_1 ~= "Free" and var_11_3.hasNewItems then
				var_11_1 = "New"
			end
		elseif var_11_3.categoryIndex > arg_11_0._selectedCategory then
			if var_11_3.hasFreeItems then
				var_11_2 = "Free"
			elseif var_11_2 ~= "Free" and var_11_3.hasNewItems then
				var_11_2 = "New"
			end
		end
	end

	if var_11_1 == "Free" then
		arg_11_0.ArrowUp:SetFreeState()
	else
		arg_11_0.ArrowUp:ClearState()
		ACTIONS.AnimateSequence(arg_11_0.ArrowUp, var_11_1)
	end

	if var_11_2 == "Free" then
		arg_11_0.ArrowDown:SetFreeState()
	else
		arg_11_0.ArrowDown:ClearState()
		ACTIONS.AnimateSequence(arg_11_0.ArrowDown, var_11_2)
	end
end

local function var_0_9(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.BillboardCategoryButtonAction = var_0_5
	arg_12_0._gridChildMouseFocusCount = 0

	function arg_12_0.FocusBundleByID(arg_13_0, arg_13_1, arg_13_2)
		var_0_3(arg_12_0, arg_13_1, arg_13_2)
	end

	function arg_12_0.FocusButtonByName(arg_14_0, arg_14_1)
		var_0_4(arg_12_0, arg_14_1)
	end

	ACTIONS.ScaleFullscreen(arg_12_0.Background)
	Engine.DHFCHIIJCA("quartermaster")
	arg_12_0.BundlesGrid:SetMask(arg_12_0.GridMask)
	arg_12_0.FranchiseStorePrompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/FRANCHISE_STORE_WITH_PROMPT"))
	arg_12_0:addElement(LOOT.GetLootFlareMaterialStreamer())

	arg_12_0._controllerIndex = arg_12_1
	arg_12_0._promotedItems = STORE.ParsePromotedItems(arg_12_1)

	var_0_7(arg_12_0, arg_12_1)

	if QUARTERMASTER.itemData then
		QUARTERMASTER.itemData = {}
	end

	function arg_12_0.BackButtonOverride(arg_15_0, arg_15_1)
		local var_15_0 = LUI.FlowManager.GetScopedData(arg_15_0)

		LUI.FlowManager.GetPerControllerPersistentData(arg_12_1)._selectedCategory = nil

		if var_15_0.useStandaloneStore then
			LUI.FlowManager.RequestLeaveMenu(arg_15_0)
		else
			local var_15_1 = arg_15_1.qualifier ~= "keyboard" and arg_15_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad
			local var_15_2 = arg_15_0:getParent()
			local var_15_3 = arg_15_1.controller or arg_12_1

			var_15_2.Tabs:FocusTab(var_15_3, 0, var_15_1)
		end

		return false
	end

	local function var_12_0(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
		local var_16_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_12_1)

		arg_12_0._categoryData = arg_16_2

		if arg_12_0.DisableAutoScrollTimer and not arg_12_0._autoScroll then
			arg_12_0.DisableAutoScrollTimer()
		end

		if arg_16_3 > #arg_16_2.items then
			arg_16_3 = 1
		end

		local var_16_1 = arg_16_2.items[arg_16_3]

		if arg_16_4 then
			local var_16_2 = arg_16_4:GetFocusPosition(LUI.DIRECTION.horizontal)

			if var_16_2 then
				var_16_1.positionInGrid = var_16_2 + 1
				arg_12_0._positionInGrid = var_16_1.positionInGrid
			end
		end

		if var_16_1.purchaseEnd then
			local var_16_3, var_16_4, var_16_5 = STORE.GetCategoryTimeLeft(nil, var_16_1.purchaseEnd)

			if var_16_3 <= 0 then
				arg_12_0:dispatchEventToChildren({
					expiredBundle = true,
					name = "categoryTimerUpdate"
				})

				return
			end
		end

		arg_12_0.BillboardItem:UpdateBillboard(var_16_1, arg_16_2.isFirstPartyCategory)

		if not arg_16_2.isFirstPartyCategory then
			if QUARTERMASTER.itemData and QUARTERMASTER.itemData.sessionId ~= nil then
				QUARTERMASTER.RecordMenuBrowseEvent(arg_12_1, false, arg_12_0._sourceMenu)
			end

			if arg_12_0._initialBrowse then
				if not arg_12_0._storeEnterComplete then
					QUARTERMASTER.RecordStoreEnterEvent(arg_12_1, arg_12_0._storeLayout, arg_12_0.recommendationData, arg_12_0._sourceMenu)

					arg_12_0._storeEnterComplete = true
				end

				QUARTERMASTER.BeginMenuBrowseEvent(arg_12_1, arg_16_2, var_16_1, arg_12_0._storeLayout, arg_12_0.recommendationData)
			else
				arg_12_0._initialBrowse = true
			end
		end

		local var_16_6 = arg_12_0._selectedCategory ~= arg_16_2.categoryIndex

		arg_12_0._selectedCategory = arg_16_2.categoryIndex
		var_16_0._selectedCategory = arg_16_2.categoryIndex
		arg_12_0._selectedBundle = arg_16_3

		if var_16_6 then
			arg_12_0:dispatchEventToChildren({
				categoryChanged = true,
				name = "categoryTimerUpdate"
			})
			var_0_8(arg_12_0)
		end
	end

	local var_12_1 = Store.EHGIGBJJC()
	local var_12_2 = Store.DBFHBBIDHD()
	local var_12_3 = Engine.EHGIGBJJC(var_12_1)
	local var_12_4 = Engine.DBFHBBIDHD(var_12_2)

	arg_12_0._allCategoryData = var_12_4
	arg_12_0._recommendations = STORE.CheckForPersonalRecommendations(arg_12_1)

	if not arg_12_0._recommendations then
		arg_12_0.recommendationData = {
			isEnabled = false
		}
	end

	arg_12_0._allCategoryData[#arg_12_0._allCategoryData + 1] = {
		isFirstPartyCategory = true,
		name = "MENU/STORE_CAT_FRANCHISE"
	}

	for iter_12_0 = 1, #var_12_4 do
		local var_12_5 = var_12_4[iter_12_0]

		var_12_5.items = var_12_5.items or {}

		var_0_2(arg_12_0, arg_12_1, var_12_5)

		var_12_5.categoryIndex = iter_12_0
	end

	local var_12_6 = var_12_3.layoutType

	arg_12_0._storeLayout = var_12_6

	local var_12_7
	local var_12_8 = LUI.FlowManager.IsMenuOnTop("BRMainMenuStore") and "BladeMenu" or -1

	arg_12_0._sourceMenu = var_12_8
	arg_12_0._storeEnterComplete = false
	arg_12_0._initialBrowse = false
	arg_12_0:Wait(2000, true).onComplete = function()
		if not arg_12_0._storeEnterComplete then
			QUARTERMASTER.RecordStoreEnterEvent(arg_12_1, var_12_6, arg_12_0.recommendationData, var_12_8)

			arg_12_0._storeEnterComplete = true
		end
	end

	local function var_12_9(arg_18_0, arg_18_1)
		if arg_18_1.name then
			if arg_18_1.items[1].emptyCategory then
				arg_18_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/X_TO_Y", Engine.CBBHFCGDIC(arg_18_1.name), Engine.CBBHFCGDIC("MENU/SOLD_OUT"))))
			else
				arg_18_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_18_1.name)))
			end
		else
			arg_18_0.CategoryText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SOLD_OUT")))
		end
	end

	local function var_12_10(arg_19_0, arg_19_1, arg_19_2)
		local var_19_0 = var_12_4[arg_19_2 + 1]

		local function var_19_1()
			local var_20_0 = LUI.FlowManager.GetScopedData(arg_12_0)
			local var_20_1 = arg_12_0._selectedBundle or var_20_0.selectedBundleIndex or 1

			if var_20_1 > #var_19_0.items then
				var_20_1 = #var_19_0.items
			end

			var_20_0.selectedBundleIndex = nil

			return {
				y = 0,
				x = var_20_1 - 1
			}
		end

		arg_19_0.RowGrid:SetDefaultFocus(var_19_1)

		local function var_19_2(arg_21_0, arg_21_1, arg_21_2)
			local var_21_0 = var_19_0.items[arg_21_1 + 1]

			if not var_21_0 then
				DebugPrint("STORE SCROLL BUG: Column: " .. arg_21_1 .. ", Row: " .. arg_21_2)
				arg_21_0:registerEventHandler("button_over", function(arg_22_0, arg_22_1)
					return
				end)
				arg_21_0:registerEventHandler("button_action", function(arg_23_0, arg_23_1)
					return
				end)
				arg_21_0:registerEventHandler("mouseenter", function(arg_24_0, arg_24_1)
					return
				end)
				arg_21_0:registerEventHandler("mouseleave", function(arg_25_0, arg_25_1)
					return
				end)
				arg_21_0:registerEventHandler("categoryTimerUpdate", function(arg_26_0, arg_26_1)
					return
				end)
				arg_21_0:UpdateNewIndicator(0)

				return
			end

			arg_21_0:UpdateButton(var_21_0, arg_12_0._promotedItems, var_19_0.isFirstPartyCategory)

			if not var_19_0.isFirstPartyCategory then
				if not var_21_0.emptyCategory and arg_21_0.NewItemNotification and not STORE.HasSeenItem(arg_12_1, var_21_0.id) then
					arg_21_0:UpdateNewIndicator(1)
				else
					arg_21_0:UpdateNewIndicator(0)
				end
			else
				arg_21_0:UpdateNewIndicator(0)
			end

			arg_21_0:registerEventHandler("button_over", function(arg_27_0, arg_27_1)
				var_12_0(arg_27_0, arg_27_1, var_19_0, arg_21_1 + 1, arg_19_0.RowGrid)

				arg_12_0._focusedBundle = arg_27_0
			end)
			arg_21_0:registerEventHandler("button_action", function(arg_28_0, arg_28_1)
				arg_12_0:BillboardCategoryButtonAction(arg_28_0, arg_28_1, var_19_0)
			end)
			arg_21_0:registerEventHandler("mouseenter", function(arg_29_0, arg_29_1)
				arg_12_0._gridChildMouseFocusCount = arg_12_0._gridChildMouseFocusCount + 1
			end)
			arg_21_0:registerEventHandler("mouseleave", function(arg_30_0, arg_30_1)
				arg_12_0._gridChildMouseFocusCount = math.max(0, arg_12_0._gridChildMouseFocusCount - 1)
			end)
			arg_21_0:registerEventHandler("categoryTimerUpdate", function(arg_31_0, arg_31_1)
				if not arg_31_1.expiredBundle and var_21_0.purchaseEnd then
					local var_31_0, var_31_1, var_31_2 = STORE.GetCategoryTimeLeft(nil, var_21_0.purchaseEnd)

					if var_31_0 <= 0 then
						arg_12_0:dispatchEventToChildren({
							expiredBundle = true,
							name = "categoryTimerUpdate"
						})
					end
				end
			end)
		end

		arg_19_0.RowGrid:SetRefreshChild(var_19_2)

		arg_19_0._timerValue = nil
		arg_19_0._idPubVarString = nil

		arg_19_0:registerEventHandler("categoryTimerUpdate", function(arg_32_0, arg_32_1)
			local var_32_0 = var_19_0.categoryIndex == arg_12_0._selectedCategory

			if var_19_0.isFirstPartyCategory and not arg_32_1.firstPartyCategoryIgnoreUpdate then
				if not arg_32_1.categoryChanged then
					arg_19_0.RowGrid:SetNumRows(1)
					arg_19_0.RowGrid:SetNumColumns(#var_19_0.items)
					arg_19_0.RowGrid:RefreshContent()
				end

				if var_32_0 then
					arg_12_0.NoMoreItemsMessage:SetAlpha(0)
				end

				return
			end

			local var_32_1 = var_19_0.items[1]

			if var_32_0 then
				if var_32_1.emptyCategory then
					arg_12_0.NoMoreItemsMessage:SetAlpha(1)
				else
					arg_12_0.NoMoreItemsMessage:SetAlpha(0)
				end
			end

			if not var_19_0.justForYou then
				local var_32_2, var_32_3, var_32_4 = STORE.GetCategoryTimeLeft(var_19_0.timerPubVar)

				if not arg_19_0._timerValue and var_19_0.timerPubVar and var_32_4 ~= "" then
					arg_19_0._timerValue = var_32_4
				end

				local var_32_5 = var_19_0.idPubVar and Dvar.DHEEJCCJBH(var_19_0.idPubVar) or ""

				if not arg_19_0._idPubVarString and var_32_5 ~= "" then
					arg_19_0._idPubVarString = var_32_5
				end

				local var_32_6 = arg_32_1.expiredBundle and var_32_0
				local var_32_7 = arg_32_1.catalogFetched
				local var_32_8 = arg_19_0._timerValue and arg_19_0._timerValue ~= var_32_4
				local var_32_9 = arg_19_0._idPubVarString and arg_19_0._idPubVarString ~= var_32_5
				local var_32_10 = arg_32_1.categoryChanged
				local var_32_11 = var_32_6 or var_32_7 or var_32_8 or var_32_9

				if var_32_11 or var_32_10 then
					var_0_2(arg_12_0, arg_12_1, var_19_0)

					if var_32_11 then
						arg_19_0.RowGrid:SetNumRows(1)
						arg_19_0.RowGrid:SetNumColumns(#var_19_0.items)
						arg_19_0.RowGrid:RefreshContent()
					end

					arg_19_0._timerValue = var_32_4
					arg_19_0._idPubVarString = var_19_0.idPubVarString

					if var_32_6 or var_32_7 and var_19_0.hasFirstPartyBundle then
						arg_19_0.RowGrid:processEvent({
							name = "lose_focus"
						})
						arg_19_0.RowGrid:SetFocusedPosition({
							x = 0,
							y = 0
						}, true)
					end
				end
			end

			var_12_9(arg_19_0, var_19_0)
		end)
		arg_19_0.RowGrid:SetNumRows(1)
		arg_19_0.RowGrid:SetNumColumns(#var_19_0.items)
		arg_19_0.RowGrid:RefreshContent()
		var_12_9(arg_19_0, var_19_0)
	end

	arg_12_0.BundlesGrid:SetRefreshChild(var_12_10)
	arg_12_0.BundlesGrid:SetNumColumns(1)
	arg_12_0.BundlesGrid:SetNumRows(#var_12_4)
	arg_12_0.BundlesGrid:RefreshContent()

	local var_12_11 = LUI.UITimer.new({
		interval = 1000,
		event = {
			firstPartyCategoryIgnoreUpdate = true,
			name = "categoryTimerUpdate"
		}
	})

	var_12_11.id = "timer"

	arg_12_0:addElement(var_12_11)

	local var_12_12 = LUI.UITimer.new({
		event = "autoScrollTimerUpdate",
		interval = var_0_0
	})

	var_12_12.id = "autoScrollTimer"

	arg_12_0:addElement(var_12_12)

	arg_12_0._autoScrollEnabled = true

	arg_12_0:registerEventHandler("autoScrollTimerUpdate", function(arg_33_0, arg_33_1)
		local var_33_0 = LUI.IsLastInputMouseNavigation(arg_12_1) and arg_12_0._gridChildMouseFocusCount > 0

		if arg_12_0._autoScrollEnabled and not var_33_0 and arg_12_0._selectedCategory and arg_12_0._selectedBundle and #var_12_4 > 0 then
			local var_33_1 = var_12_4[arg_12_0._selectedCategory]
			local var_33_2 = arg_12_0._selectedBundle + 1

			if var_33_2 > #var_33_1.items then
				var_33_2 = 1
			end

			local var_33_3 = arg_12_0.BundlesGrid:GetElementAtPosition(0, arg_12_0._selectedCategory - 1)

			if var_33_3 then
				local var_33_4 = var_33_3.RowGrid

				arg_12_0._autoScroll = true

				var_33_4:SetFocusedPosition({
					y = 0,
					x = var_33_2 - 1
				}, false)

				arg_12_0._autoScroll = false
			end
		end
	end)

	arg_12_0._autoScrollEnabledTimerHolder = LUI.UIElement.new()

	arg_12_0:addElement(arg_12_0._autoScrollEnabledTimerHolder)

	function arg_12_0.DisableAutoScrollTimer()
		arg_12_0._autoScrollEnabled = false
		arg_12_0._autoScrollEnabledTimerHolder:Wait(Dvar.CFHDGABACF("NPSTPKMPKS"), true).onComplete = function()
			arg_12_0._autoScrollEnabled = true
		end
	end

	local var_12_13 = LUI.UIBindButton.new()

	var_12_13.id = "bindButton"

	arg_12_0:addElement(var_12_13)

	arg_12_0.bindButton = var_12_13

	arg_12_0.bindButton:addEventHandler("button_alt1", function(arg_36_0, arg_36_1)
		if not var_12_4[arg_12_0._selectedCategory].isFirstPartyCategory then
			arg_12_0._startPurchaseImmediately = true

			arg_12_0:BillboardCategoryButtonAction(nil, nil, var_12_4[arg_12_0._selectedCategory])
		end
	end)
	arg_12_0.bindButton:addEventHandler("button_alt2", function(arg_37_0, arg_37_1)
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)

		if not arg_12_0._storeEnterComplete then
			QUARTERMASTER.RecordStoreEnterEvent(arg_12_1, arg_12_0._storeLayout, arg_12_0.recommendationData, arg_12_0._sourceMenu)
			QUARTERMASTER.BeginMenuBrowseEvent(arg_12_0._controllerIndex, arg_12_0._categoryData, arg_12_0._categoryData.items[1], arg_12_0._storeLayout, arg_12_0.recommendationData)

			arg_12_0._storeEnterComplete = true
		end

		QUARTERMASTER.RecordMenuBrowseEvent(arg_12_1, true)
		STORE.GoToStore(arg_12_1, arg_12_0:GetCurrentMenu().id, arg_37_0.id)
	end)
	arg_12_0.bindButton:addEventHandler("button_left_stick", function(arg_38_0, arg_38_1)
		if Dvar.IBEGCHEFE("OLNMSNSTKS") then
			LUI.FlowManager.RequestPopupMenu(arg_12_0, "CreatorCodePopup", true, arg_12_1, false, arg_12_2)
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
		end
	end)
	arg_12_0:addEventHandler("gamepad_button", function(arg_39_0, arg_39_1)
		if arg_39_1.controller ~= arg_12_1 and (arg_39_1.button == "primary" or arg_39_1.button == "alt1" or arg_39_1.button == "alt2" or arg_39_1.button == "left" or arg_39_1.button == "right" or arg_39_1.button == "up" or arg_39_1.button == "down") then
			return true
		end
	end)

	local function var_12_14(arg_40_0, arg_40_1)
		if LUI.IsLastInputGamepad(arg_12_1) then
			arg_40_0.FranchiseStorePrompt:SetAlpha(1)
			arg_40_0._menu.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_alt2"
			})

			if arg_40_0._gridChildMouseFocusCount == 0 and arg_40_0._focusedBundle then
				arg_40_0._focusedBundle:GainFocus(arg_40_1)
			end
		else
			arg_40_0.FranchiseStorePrompt:SetAlpha(0)
			arg_40_0._menu.HelperBar.ButtonHelperText:PushButtonPrompt({
				kbm_only = true,
				button_ref = "button_alt2",
				helper_text = Engine.CBBHFCGDIC("MENU/STORE_CAT_FRANCHISE"),
				container = arg_40_0.FranchisePromptContainer,
				containerAlignment = LUI.Alignment.Right
			})
		end
	end

	arg_12_0.BundlesGrid:addEventHandler("layout_initialized", function(arg_41_0, arg_41_1)
		arg_12_0._menu = arg_41_0:GetCurrentMenu()

		arg_12_0:addAndCallEventHandler("update_input_type", var_12_14)

		if LUI.IsLastInputMouseNavigation(arg_12_1) then
			local var_41_0 = LUI.FlowManager.GetPerControllerPersistentData(arg_12_1)

			if var_41_0._selectedCategory then
				arg_41_0:SetFocusedPosition({
					x = 0,
					y = var_41_0._selectedCategory - 1
				}, false)
			else
				arg_41_0:GainFocus({
					controllerIndex = arg_12_1
				})
			end
		end
	end)
	arg_12_0.ArrowUp:addEventHandler("grid_focus_up_blocked", function(arg_42_0, arg_42_1)
		arg_42_0:SetAlpha(0, 100)
	end)
	arg_12_0.ArrowUp:addEventHandler("grid_focus_up_not_blocked", function(arg_43_0, arg_43_1)
		arg_43_0:SetAlpha(1, 200)
	end)
	arg_12_0.ArrowDown:addEventHandler("grid_focus_down_blocked", function(arg_44_0, arg_44_1)
		arg_44_0:SetAlpha(0, 100)
	end)
	arg_12_0.ArrowDown:addEventHandler("grid_focus_down_not_blocked", function(arg_45_0, arg_45_1)
		arg_45_0:SetAlpha(1, 200)
	end)

	local function var_12_15(arg_46_0, arg_46_1)
		if arg_46_1.down and arg_46_1.qualifier == "mousewheel" then
			return arg_12_0.BundlesGrid:processEvent(arg_46_1)
		end
	end

	arg_12_0.BillboardItem.Image:SetHandleMouse(true)
	arg_12_0.BillboardItem.Image:registerEventHandler("leftmousedown", function(arg_47_0, arg_47_1)
		return true
	end)
	arg_12_0.BillboardItem.Image:registerEventHandler("leftmouseup", function(arg_48_0, arg_48_1)
		local var_48_0 = arg_12_0._allCategoryData[arg_12_0._selectedCategory]

		arg_12_0:BillboardCategoryButtonAction(arg_48_0, arg_48_1, var_48_0)

		return true
	end)
	arg_12_0.BillboardItem.Image:addEventHandler("gamepad_button", var_12_15)

	arg_12_0.BundlesGrid._showNumbersAndArrowsKBM = true
	arg_12_0.BundlesGrid._updateArrowVisibilityOnRefresh = false
	arg_12_0.BundlesGrid._alwaysTrapMouseWheel = true

	arg_12_0.MouseScrollCatcher:SetHandleMouse(true)
	arg_12_0.MouseScrollCatcher:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_NORMAL)
	arg_12_0.MouseScrollCatcher:addEventHandler("gamepad_button", var_12_15)
end

function MPStoreBillboardGrid(arg_49_0, arg_49_1)
	local var_49_0 = LUI.UIElement.new()

	var_49_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_49_0.id = "MPStoreBillboardGrid"

	local var_49_1 = arg_49_1 and arg_49_1.controllerIndex

	if not var_49_1 and not Engine.DDJFBBJAIG() then
		var_49_1 = var_49_0:getRootController()
	end

	assert(var_49_1)

	local var_49_2 = var_49_0
	local var_49_3
	local var_49_4 = LUI.UIImage.new()

	var_49_4.id = "Background"

	var_49_4:SetRGBFromInt(0, 0)
	var_49_4:SetAlpha(0.95, 0)
	var_49_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_49_4:SetVMin(0.5, 0)
	var_49_0:addElement(var_49_4)

	var_49_0.Background = var_49_4

	local var_49_5
	local var_49_6 = LUI.UIImage.new()

	var_49_6.id = "MouseScrollCatcher"

	var_49_6:SetRGBFromInt(0, 0)
	var_49_6:SetAlpha(0, 0)
	var_49_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_49_6:SetVMin(0.5, 0)
	var_49_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 200, _1080p * -85)
	var_49_0:addElement(var_49_6)

	var_49_0.MouseScrollCatcher = var_49_6

	local var_49_7
	local var_49_8 = MenuBuilder.BuildRegisteredType("StoreBillboardItem", {
		controllerIndex = var_49_1
	})

	var_49_8.id = "BillboardItem"

	var_49_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 200, _1080p * 780)
	var_49_0:addElement(var_49_8)

	var_49_0.BillboardItem = var_49_8

	local var_49_9
	local var_49_10 = {
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
		controllerIndex = var_49_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MPStoreBillboardGridRow", {
				controllerIndex = var_49_1
			})
		end,
		refreshChild = function(arg_51_0, arg_51_1, arg_51_2)
			return
		end,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1680,
		rowHeight = _1080p * 190,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_49_11 = LUI.UIPeekingGrid.new(var_49_10)

	var_49_11.id = "BundlesGrid"

	var_49_11:setUseStencil(true)
	var_49_11:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 130, _1080p * -140, _1080p * -370, 0)
	var_49_0:addElement(var_49_11)

	var_49_0.BundlesGrid = var_49_11

	local var_49_12
	local var_49_13 = LUI.UIImage.new()

	var_49_13.id = "GridMask"

	var_49_13:setImage(RegisterMaterial("store_bundle_grid_mask"), 0)
	var_49_13:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 120, _1080p * -120, _1080p * -370, _1080p * -54)
	var_49_0:addElement(var_49_13)

	var_49_0.GridMask = var_49_13

	local var_49_14
	local var_49_15 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_49_1
	})

	var_49_15.id = "VerticalScrollbar"

	var_49_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -140, _1080p * -129, _1080p * -330, _1080p * -85)
	var_49_0:addElement(var_49_15)

	var_49_0.VerticalScrollbar = var_49_15

	local var_49_16
	local var_49_17 = MenuBuilder.BuildRegisteredType("NoMoreItemsMessage", {
		controllerIndex = var_49_1
	})

	var_49_17.id = "NoMoreItemsMessage"

	var_49_17:SetAlpha(0, 0)
	var_49_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -90, _1080p * -10)
	var_49_0:addElement(var_49_17)

	var_49_0.NoMoreItemsMessage = var_49_17

	local var_49_18
	local var_49_19 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_49_1
	})

	var_49_19.id = "StoreEmpty"

	var_49_19:SetAlpha(0, 0)
	var_49_19.Backer:SetRGBFromTable(SWATCHES.Store.NoItemBGAlt, 0)
	var_49_19.Backer:SetAlpha(1, 0)
	var_49_19.Node:SetRGBFromTable(SWATCHES.Store.NoItemTimer, 0)
	var_49_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 246, _1080p * 160, _1080p * 194)
	var_49_0:addElement(var_49_19)

	var_49_0.StoreEmpty = var_49_19

	local var_49_20
	local var_49_21 = MenuBuilder.BuildRegisteredType("StoreScrollArrow", {
		controllerIndex = var_49_1
	})

	var_49_21.id = "ArrowDown"

	var_49_21:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -110, _1080p * -60)
	var_49_0:addElement(var_49_21)

	var_49_0.ArrowDown = var_49_21

	local var_49_22
	local var_49_23 = MenuBuilder.BuildRegisteredType("StoreScrollArrow", {
		controllerIndex = var_49_1
	})

	var_49_23.id = "ArrowUp"

	var_49_23:SetZRotation(180, 0)
	var_49_23.FreeBundleText:SetZRotation(180, 0)
	var_49_23:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -350, _1080p * -300)
	var_49_0:addElement(var_49_23)

	var_49_0.ArrowUp = var_49_23

	local var_49_24
	local var_49_25 = MenuBuilder.BuildRegisteredType("PromptButton", {
		controllerIndex = var_49_1
	})

	var_49_25.id = "FranchiseStorePrompt"

	var_49_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -270, _1080p * -70, _1080p * 164, _1080p * 196)
	var_49_0:addElement(var_49_25)

	var_49_0.FranchiseStorePrompt = var_49_25

	local var_49_26
	local var_49_27 = MenuBuilder.BuildRegisteredType("SupportingCreatorCode", {
		controllerIndex = var_49_1
	})

	var_49_27.id = "SupportingCreatorCode"

	var_49_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1162, _1080p * 1522, _1080p * 172, _1080p * 196)
	var_49_0:addElement(var_49_27)

	var_49_0.SupportingCreatorCode = var_49_27

	local var_49_28
	local var_49_29 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_49_1
	})

	var_49_29.id = "FranchisePromptContainer"

	if CONDITIONS.AlwaysFalse(var_49_0) then
		var_49_29.Label:setText("", 0)
	end

	var_49_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1559, _1080p * 1790, _1080p * 165, _1080p * 196)
	var_49_0:addElement(var_49_29)

	var_49_0.FranchisePromptContainer = var_49_29

	local var_49_30 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_49_15,
		startCap = var_49_15.startCap,
		endCap = var_49_15.endCap,
		sliderArea = var_49_15.sliderArea,
		slider = var_49_15.sliderArea and var_49_15.sliderArea.slider,
		fixedSizeSlider = var_49_15.sliderArea and var_49_15.sliderArea.fixedSizeSlider
	})

	var_49_11:AddScrollbar(var_49_30)
	var_49_11:AddArrow(var_49_23)
	var_49_11:AddArrow(var_49_21)
	var_0_9(var_49_0, var_49_1, arg_49_1)

	return var_49_0
end

MenuBuilder.registerType("MPStoreBillboardGrid", MPStoreBillboardGrid)
LockTable(_M)
