module(..., package.seeall)

local var_0_0 = 200

local function var_0_1()
	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("PurchaseCPPopup", arg_2_1)
	local var_2_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		primaryButtonText = "LUA_MENU/PURCHASE",
		controllerIndex = arg_2_1.controllerIndex,
		widget = var_2_0
	})

	var_2_1.id = "PurchaseCODPointsPopup"

	return var_2_1
end

MenuBuilder.registerType("PurchaseCODPointsPopup", var_0_2)
LUI.FlowManager.RegisterStackPopBehaviour("PurchaseCODPointsPopup", var_0_1)

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0, var_3_1, var_3_2, var_3_3 = arg_3_1.Card:getLocalRect()

	ACTIONS.AnimateSequence(arg_3_1.Card, "ShowPurchasedFrame")

	local function var_3_4()
		local var_4_0 = LOOT.GetBundleItemsMappedByType(arg_3_0._bundleID)

		if var_4_0[LOOT.itemTypes.BATTLE_PASS] then
			local var_4_1 = 3000

			arg_3_1:Wait(var_4_1).onComplete = function()
				if BATTLEPASS.GetTier(arg_3_0._controllerIndex) < BATTLEPASS.GetMaxTier() then
					local var_5_0 = {
						tierSkipID = var_4_0[LOOT.itemTypes.BATTLE_PASS][1]
					}

					Engine.BJDBIAGIDA(SOUND_SETS.storefront.smokeCardSlam)
					LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_3_0._controllerIndex, false, var_5_0)

					local var_5_1 = 1500

					arg_3_1:Wait(var_5_1).onComplete = function()
						arg_3_0._purchasedAnimation = false
						arg_3_0._previewsEnabled = true

						LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup", true, true)

						var_5_0.displayUpsellPopup = arg_3_0._displayUpsellPopup
						var_5_0.allowTierBank = arg_3_0._bundleID == BATTLEPASS.WarzoneTierSkipBundleID

						if arg_3_0._bundleID == tonumber(BATTLEPASS.GetTierSkipGiftID()) then
							local var_6_0 = LUI.FlowManager.GetScopedData("MainMenu")

							if var_6_0.returnToMainMenu then
								var_5_0.returnToMainMenu = var_6_0.returnToMainMenu
								var_6_0.returnToMainMenu = nil
							end
						end

						LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_3_0._controllerIndex, false, var_5_0, true)

						arg_3_0.isQuickAccessShortcutsDisabled = false
					end
				else
					arg_3_0._purchasedAnimation = false
					arg_3_0._previewsEnabled = true

					arg_3_0.ItemsGrid:RefreshContent()
				end
			end
		else
			if arg_3_0._displayUpsellPopup then
				local var_4_2 = 3000

				arg_3_0:Wait(var_4_2).onComplete = function()
					STORE.OpenBundleUpsellPopup(arg_3_0._controllerIndex)
				end
			end

			arg_3_0._purchasedAnimation = false
			arg_3_0._previewsEnabled = true

			arg_3_0.ItemsGrid:RefreshContent()

			arg_3_0.isQuickAccessShortcutsDisabled = false
		end
	end

	local var_3_5

	local function var_3_6()
		local var_8_0 = math.random(-10, 10) * _1080p
		local var_8_1 = math.random(-10, 10) * _1080p
		local var_8_2 = LUI.EASING.linear
		local var_8_3 = math.random(10, 30)
		local var_8_4 = math.random(-4, 4)

		arg_3_1.Card:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_3_0 + var_8_1, var_3_2 + var_8_1, var_3_1 + var_8_0, var_3_3 + var_8_0, var_8_3, var_8_2).onComplete = function()
			if arg_3_1.shake then
				var_3_6()
			else
				arg_3_1.Card:SetZRotation(0, var_8_3, var_8_2)
				arg_3_1.Card:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_3_0, var_3_2, var_3_1, var_3_3, var_8_3, var_8_2)

				if arg_3_2 then
					var_3_4()
				end
			end
		end
	end

	local var_3_7 = 100

	arg_3_1:SetScale(1)
	arg_3_1:SetAlpha(1, var_3_7, LUI.EASING.outBack)
	arg_3_1:SetScale(0, var_3_7, LUI.EASING.outBack)

	arg_3_1:Wait(var_3_7).onComplete = function()
		arg_3_1.shake = true

		var_3_6(arg_3_1)

		if arg_3_1._lootType == LOOT.itemTypes.BATTLE_PASS then
			ACTIONS.AnimateSequence(arg_3_1.Flare, "BattlePassPurchased")

			arg_3_1:Wait(1500).onComplete = function()
				Engine.BJDBIAGIDA(SOUND_SETS.storefront.smokePoof)
				ACTIONS.AnimateSequence(arg_3_1.Flare, "Smoke")
				arg_3_1:SetAlpha(0.3, 1500)
			end
		elseif arg_3_1._rarity == LOOT.Rarity.BASE then
			ACTIONS.AnimateSequence(arg_3_1.Flare, "Base")
		elseif arg_3_1._rarity == LOOT.Rarity.RARE then
			ACTIONS.AnimateSequence(arg_3_1.Flare, "Rare")
		elseif arg_3_1._rarity == LOOT.Rarity.EPIC then
			ACTIONS.AnimateSequence(arg_3_1.Flare, "Epic")
		elseif arg_3_1._rarity == LOOT.Rarity.LEGENDARY then
			ACTIONS.AnimateSequence(arg_3_1.Flare, "Legendary")
		elseif arg_3_1._rarity == LOOT.Rarity.COMMON then
			ACTIONS.AnimateSequence(arg_3_1.Flare, "Common")
		end

		arg_3_1:Wait(50).onComplete = function()
			arg_3_1.shake = false
		end
	end
end

local function var_0_4(arg_13_0, arg_13_1)
	local function var_13_0()
		arg_13_0:addElement(LOOT.GetLootFlareMaterialStreamer())
		arg_13_0:processEvent({
			name = "bundle_purchase_complete"
		})

		local var_14_0 = STORE.GetBundlePurchaseID(arg_13_1, arg_13_0._bundleID)

		Loot.HAJHHFGJJ(arg_13_1, var_14_0, false)

		local var_14_1 = {
			message = "LUA_MENU_MP/PURCHASE"
		}

		LUI.FlowManager.RequestPopupMenu(nil, "LootPurchasingPopup", true, arg_13_1, false, var_14_1)
		arg_13_0.HelperBar:SetAlpha(0)

		if LUI.FlowManager.GetScopedData(arg_13_0).oneModBlueprintStore then
			LUI.FlowManager.RequestLeaveMenuByName("WeaponLocker")
		end

		if arg_13_0._upsellMenu then
			Engine.CEJJDJJHIJ(arg_13_1, "dlog_event_purchase_bundle_through_upsell", {
				bundle_id = tostring(arg_13_0._bundleID),
				upsell_menu = arg_13_0._upsellMenu
			})
		end
	end

	if Engine.DBFCJBDJEC() and Engine.DDHFCGHJEA() then
		local var_13_1 = {
			itemName = arg_13_0._itemName,
			itemImage = arg_13_0._itemImage,
			itemCurrencyID = arg_13_0._currencyID,
			itemCurrencyAmount = arg_13_0._currencyAmount,
			confirmAction = function()
				var_13_0()
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "StoreConfirmPurchaseKoreaLegalPupup", true, arg_13_1, false, var_13_1, nil, false, true)
	else
		var_13_0()
	end
end

local function var_0_5(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	if arg_16_0._isOwned then
		return
	end

	if QUARTERMASTER.itemData then
		QUARTERMASTER.RecordItemBrowseEvent(arg_16_0._controllerIndex, false, arg_16_0._sourceMenu)
	end

	if arg_16_0._isFirstParty and arg_16_0._firstPartyPurchase then
		arg_16_0._firstPartyPurchase()

		return
	end

	if Commerce.CEDDCGHIGA(arg_16_3, arg_16_0._currencyID) < arg_16_0._currencyAmount then
		local var_16_0 = {
			showBalance = true,
			controllerIndex = arg_16_3,
			currencyID = arg_16_0._currencyID,
			currencyAmount = arg_16_0._currencyAmount
		}

		STORE.EnterStore(arg_16_3, arg_16_1, arg_16_2.id, var_16_0, "PurchaseCODPointsPopup", true)
	else
		local var_16_1 = {
			itemName = arg_16_0._itemName,
			itemImage = arg_16_0._itemImage,
			itemCurrencyID = arg_16_0._currencyID,
			itemCurrencyAmount = arg_16_0._currencyAmount,
			showDisclaimer = arg_16_0._showDisclaimer,
			startPurchaseImmediately = arg_16_4,
			alreadyOwnedCount = arg_16_0._alreadyOwnedCount,
			confirmAction = function()
				var_0_4(arg_16_0, arg_16_3)
			end
		}

		Engine.BJDBIAGIDA(SOUND_SETS.storefront.purchaseBundle)
		LUI.FlowManager.RequestPopupMenu(nil, "StoreConfirmPurchasePopup", true, arg_16_3, false, var_16_1, nil, false, true)
	end
end

local function var_0_6(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = {
		showBalance = true,
		controllerIndex = arg_18_3,
		currencyID = arg_18_0._currencyID,
		currencyAmount = arg_18_0._currencyAmount
	}

	STORE.EnterStore(arg_18_3, arg_18_1, arg_18_2.id, var_18_0, "PurchaseCODPointsPopup", true)
end

local function var_0_7(arg_19_0)
	return function(arg_20_0, arg_20_1)
		var_0_5(arg_19_0, arg_19_0:GetCurrentMenu().id, arg_20_0, arg_20_1.controller, false)
	end
end

local function var_0_8(arg_21_0)
	return function(arg_22_0, arg_22_1)
		var_0_6(arg_21_0, arg_21_0:GetCurrentMenu().id, arg_22_0, arg_22_1.controller)
	end
end

local function var_0_9(arg_23_0, arg_23_1, arg_23_2)
	assert(arg_23_2.bundleID)
	Engine.BJDBIAGIDA(SOUND_SETS.storefront.windowAppear)
	arg_23_0:addElement(LOOT.GetLootSmokeMaterialStreamer())

	arg_23_0._bundleID = arg_23_2.bundleID
	arg_23_0._timerValue = arg_23_2.timerValue
	arg_23_0._controllerIndex = arg_23_1 or Engine.IJEBHJIJF()
	arg_23_0._previewsEnabled = true
	arg_23_0._promotedItems = STORE.ParsePromotedItems(arg_23_1)
	arg_23_0._showDisclaimer = false
	arg_23_0._alreadyOwnedCount = 0
	arg_23_0._totalTierSkips = 0
	arg_23_0._curBattlePassTier = BATTLEPASS.GetTier(arg_23_1)
	arg_23_0._displayUpsellPopup = arg_23_2.displayUpsellPopup
	arg_23_0._itemName = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_23_0._bundleID, CSV.bundleIDs.cols.name)
	arg_23_0._itemImage = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_23_0._bundleID, CSV.bundleIDs.cols.titleImage)
	arg_23_0._positionInGrid = arg_23_2.positionInGrid
	arg_23_0._categoryIndex = arg_23_2.categoryIndex
	arg_23_0._categoryName = arg_23_2.categoryName
	arg_23_0._storeLayout = arg_23_2.storeLayout
	arg_23_0._sourceMenu = arg_23_2.sourceMenu
	arg_23_0._recommendationData = arg_23_2.recommendationData
	arg_23_0._upsellMenu = arg_23_2.upsellMenu

	local var_23_0 = {
		itemID = arg_23_0._bundleID,
		itemName = arg_23_0._itemName,
		positionInGrid = arg_23_0._positionInGrid,
		categoryIndex = arg_23_0._categoryIndex,
		categoryName = arg_23_0._categoryName,
		storeLayout = arg_23_0._storeLayout,
		sourceMenu = arg_23_0._sourceMenu,
		recommendationData = arg_23_0._recommendationData
	}
	local var_23_1 = LUI.FlowManager.GetScopedData(arg_23_0)
	local var_23_2 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_alt1",
				button_ref = "button_alt1",
				helper_text = ""
			}
		}
	}

	arg_23_0.PurchaseButton:AddTooltipData(arg_23_1, var_23_2)

	if arg_23_2.isFirstParty then
		arg_23_0._isFirstParty = arg_23_2.isFirstParty
		arg_23_0._isOwned = var_23_1.firstPartyOwned or arg_23_2.owned
		arg_23_0._firstPartyPurchase = arg_23_2.firstPartyPurchase

		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
		end

		arg_23_0.PurchaseButton:SetPrice(arg_23_2.price, nil, arg_23_2.bundleID)
	else
		local var_23_3, var_23_4 = STORE.GetBundleCost(arg_23_0._controllerIndex, arg_23_2.bundleID)

		if var_23_4 and var_23_4 < var_23_3 then
			arg_23_0._currencyAmount = var_23_4
		else
			arg_23_0._currencyAmount = var_23_3
		end

		arg_23_0._currencyID = arg_23_2.currencyID
		arg_23_0._isOwned = Loot.DEBEIFJEEG(arg_23_0._controllerIndex, arg_23_0._bundleID) > 0

		arg_23_0.PurchaseButton:SetPrice(var_23_3, var_23_4, arg_23_2.bundleID)
	end

	local var_23_5 = LUI.FlowManager.GetMenuNameAtIndex(-1)

	if arg_23_2.currencyID == LOOT.CurrencyIDs.COD_POINTS then
		arg_23_0.PurchaseButton.CurrencyIcon:setImage(RegisterMaterial("icon_currency_codpoints"))
	elseif arg_23_2.currencyID == LOOT.CurrencyIDs.KEYS then
		arg_23_0.PurchaseButton.CurrencyIcon:setImage(RegisterMaterial("icon_currency_key"))
	elseif not arg_23_0._isFirstParty then
		assert(false, "Unsupported currency!")
	end

	local function var_23_6()
		if arg_23_0._isOwned then
			ACTIONS.AnimateSequence(arg_23_0, "Purchased")
			arg_23_0.PurchaseButton:SetButtonDisabled(true)
			arg_23_0.PurchaseButton:processEvent({
				name = "Purchased"
			})
			arg_23_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				side = "left",
				button_ref = "button_alt1"
			})
		end
	end

	var_23_6()
	Engine.DHFCHIIJCA("loadout_showcase_preview")
	FrontEndScene.HideWeaponModels()

	local var_23_7 = true

	arg_23_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_PREVIEW")), var_23_7)

	local var_23_8 = LOOT.GetItemsInBundle(arg_23_0._bundleID)

	assert(#var_23_8 <= 10, "A maximum of 10 bundle items are supported!")

	local function var_23_9(arg_25_0, arg_25_1, arg_25_2)
		arg_23_0.bundleData = {
			startPurchaseImmediately = false,
			controllerIndex = arg_23_1,
			bundleID = arg_23_0._bundleID,
			itemCurrencyID = arg_23_0._currencyID,
			itemCurrencyAmount = arg_23_0._currencyAmount,
			timerValue = arg_23_0._timerValue,
			showDisclaimer = arg_23_0._showDisclaimer,
			alreadyOwnedCount = arg_23_0._alreadyOwnedCount,
			isBundlePurchased = arg_23_0._isOwned
		}

		local var_25_0 = arg_23_0.ItemsGrid:GetContentIndex(arg_25_1, arg_25_2) + 1
		local var_25_1 = tonumber(var_23_8[var_25_0])
		local var_25_2 = {}
		local var_25_3 = LOOT.GetTypeForID(var_25_1)
		local var_25_4 = LOOT.GetItemRef(var_25_3, var_25_1)

		if var_25_4 and #var_25_4 > 0 then
			local var_25_5 = LOOT.GetItemQuality(var_25_3, var_25_4, var_25_1)
			local var_25_6 = LOOT.GetRarityColor(var_25_5)
			local var_25_7 = LOOT.GetDarkRarityColor(var_25_5)

			arg_25_0._previewsEnabled = arg_23_0._previewsEnabled
			arg_25_0.Card._previewsEnabled = arg_23_0._previewsEnabled

			arg_25_0.Card:SetHandleMouse(arg_23_0._previewsEnabled)
			arg_25_0.Card:SetFocusable(arg_23_0._previewsEnabled)

			arg_25_0._rarity = var_25_5

			arg_25_0.Card.RarityBG:SetRGBFromTable(var_25_7)
			arg_25_0.Card.Border:setImage(RegisterMaterial(LOOT.GetRarityBorder(var_25_5)))
			arg_25_0.Card.RarityImage:setImage(RegisterMaterial(LOOT.GetRarityImage(var_25_5)))
			arg_25_0.Card.RarityImage:SetRGBFromTable(var_25_6)
			arg_25_0.Card.BlueprintIcon:SetRGBFromTable(var_25_6)

			arg_25_0._lootType = var_25_3

			if var_25_5 == LOOT.Rarity.LEGENDARY then
				ACTIONS.AnimateSequence(arg_25_0.Card, "GlintAnime")
			end

			if var_25_3 == LOOT.itemTypes.SPECIAL then
				ACTIONS.AnimateSequence(arg_25_0.Flare, "SpecialItemHighlight")
			end

			if var_25_3 == LOOT.itemTypes.WEAPON then
				if WEAPON.IsVariant(arg_23_1, var_25_1) then
					arg_25_0.Card.BlueprintIcon:SetAlpha(0.7)
				end

				arg_25_0.Card:SetupTracer(arg_23_1, var_25_1)
			end

			local var_25_8 = LOOT.GetItemImage(var_25_3, var_25_4, var_25_1)

			if var_25_8 and #var_25_8 > 0 then
				arg_25_0.Card.Foreground:setImage(RegisterMaterial(var_25_8))
				arg_25_0.Card:UpdateCardConfig(var_25_3, var_25_8)
			else
				DebugPrint("Could not find image asset for type: " .. var_25_3 .. ", and ref: " .. var_25_4)
			end

			local var_25_9

			if var_25_4 == "battlepass" then
				local var_25_10 = SEASON.GetCurrentSeason()

				var_25_9 = Engine.CBBHFCGDIC("BATTLEPASS/SEASON_X_BATTLEPASS", var_25_10)
			else
				var_25_9 = LOOT.GetItemName(var_25_3, var_25_4, var_25_1)
			end

			if var_25_9 and #var_25_9 > 0 then
				arg_25_0.Card.ItemName:setText(ToUpperCase(var_25_9))
			else
				DebugPrint("Could not find item name for type: " .. var_25_3 .. ", and ref: " .. var_25_4)
			end

			local var_25_11 = LOOT.GetItemClassName(var_25_3, var_25_4, var_25_1)

			if var_25_11 and #var_25_11 > 0 then
				arg_25_0.Card.ItemType:setText(var_25_11)
			else
				DebugPrint("Could not find item class name for type: " .. var_25_3 .. ", and ref: " .. var_25_4)
			end

			var_25_2.id = var_25_1
			var_25_2.rarity = var_25_5
			var_25_2.type = var_25_3
			var_25_2.image = var_25_8
			var_25_2.name = var_25_9
			var_25_2.className = var_25_11
			var_25_2.bundleID = arg_23_2.bundleID
			var_25_2.positionInGrid = arg_23_2.bundleIndex
			var_25_2.isOwned = Loot.DEBEIFJEEG(arg_23_1, var_25_1) > 0

			if var_25_2.isOwned and not arg_25_0._alreadyOwned then
				arg_25_0._alreadyOwned = true
				arg_23_0._alreadyOwnedCount = arg_23_0._alreadyOwnedCount + 1
			end

			if not arg_25_0._buttonHandlerAdded then
				arg_25_0.Card:addEventHandler("button_action", function(arg_26_0, arg_26_1)
					if arg_23_0._previewsEnabled and STORE.PreviewSupported(var_25_3) then
						if arg_23_0._isFirstParty and Engine.CIEGIACHAE() then
							InGameStore.ShowStoreIcon(false)
						end

						STORE.PreviewItem(arg_23_1, var_25_3, var_25_1, arg_23_0._bundleID, arg_23_0._timerValue, false, false, arg_23_0.bundleData)
						QUARTERMASTER.RecordItemBrowseEvent(arg_23_0._controllerIndex, true, arg_23_0._sourceMenu)
					end
				end)
				arg_25_0.Card:addEventHandler("button_over", function(arg_27_0, arg_27_1)
					if arg_23_0._previewsEnabled then
						if QUARTERMASTER.itemData then
							QUARTERMASTER.RecordItemBrowseEvent(arg_23_0._controllerIndex, false, arg_23_0._sourceMenu)
						end

						QUARTERMASTER.BeginItemBrowseEvent(arg_23_1, var_25_2, arg_23_0._storeLayout, arg_23_0._recommendationData)
					end
				end)

				if arg_23_0._showDisclaimer == false and var_25_3 == LOOT.itemTypes.BATTLE_PASS then
					arg_23_0._totalTierSkips = arg_23_0._totalTierSkips + LOOT.GetBattlePassLootSkips(var_25_2.id)

					if arg_23_0._curBattlePassTier + arg_23_0._totalTierSkips > BATTLEPASS.GetMaxTier() then
						arg_23_0._showDisclaimer = true
					end
				end

				arg_25_0._buttonHandlerAdded = true
			end

			if arg_23_0._purchasedAnimation or arg_23_0._isOwned then
				ACTIONS.AnimateSequence(arg_23_0, "Purchased")
			elseif arg_23_0._showDisclaimer or var_25_2.isOwned then
				ACTIONS.AnimateSequence(arg_23_0, "TierDisclaimer")

				if arg_23_0._showDisclaimer and var_25_2.isOwned then
					arg_23_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_OWNED_DISCLAIMER", arg_23_0._alreadyOwnedCount))
				elseif arg_23_0._showDisclaimer then
					arg_23_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"))
				elseif var_25_2.isOwned then
					arg_23_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_OWNED_DISCLAIMER", arg_23_0._alreadyOwnedCount))
				end
			end
		end

		if arg_23_0._purchasedAnimation then
			arg_25_0:SetAlpha(0)

			arg_25_0:Wait(var_0_0 * var_25_0).onComplete = function()
				if var_25_0 == 1 then
					Engine.BJDBIAGIDA(SOUND_SETS.storefront.cardFlipFirst)
				end

				Engine.BJDBIAGIDA(SOUND_SETS.storefront.cardFlipMiddle)

				if var_25_0 == #var_23_8 then
					Engine.BJDBIAGIDA(SOUND_SETS.storefront.cardFlipLast)
				end

				var_0_3(arg_23_0, arg_25_0, var_25_0 == #var_23_8)
			end
		elseif arg_23_0._isOwned then
			ACTIONS.AnimateSequence(arg_25_0.Card, "ShowPurchasedFrame")
			ACTIONS.AnimateSequence(arg_25_0.Card, "HideAlreadyOwned")

			if var_25_2.type == LOOT.itemTypes.BATTLE_PASS then
				arg_25_0:SetAlpha(0.3)
				arg_25_0.Card.Border:SetAlpha(0)
				arg_25_0.Card.ItemType:setText(Engine.CBBHFCGDIC("BATTLEPASS/REDEEMED"))
			end
		elseif var_25_2.isOwned then
			ACTIONS.AnimateSequence(arg_25_0.Card, "ShowPurchasedFrame")
			ACTIONS.AnimateSequence(arg_25_0.Card, "ShowAlreadyOwned")
		end
	end

	arg_23_0.ItemsGrid:SetRefreshChild(var_23_9)
	arg_23_0.ItemsGrid:SetNumRows(#var_23_8 > 5 and 2 or 1)
	arg_23_0.ItemsGrid:SetNumColumns(#var_23_8 > 5 and 5 or #var_23_8)
	arg_23_0.ItemsGrid:SetNumChildren(math.min(#var_23_8, 10))
	arg_23_0.ItemsGrid:RefreshContent()
	arg_23_0.PurchaseButton:addEventHandler("button_action", var_0_7(arg_23_0))
	arg_23_0:addEventHandler("bundle_purchase_complete", function(arg_29_0, arg_29_1)
		arg_23_0.isQuickAccessShortcutsDisabled = true
		arg_23_0._previewsEnabled = false

		arg_29_0.ItemsGrid:RefreshContent()
		Engine.BJDBIAGIDA(SOUND_SETS.storefront.purchaseBundleComplete)
		Engine.DFCGFCGBFD("mp_store_bundle_purchase")
		ACTIONS.AnimateSequence(arg_29_0, "BundlePurchaseShow")

		local var_29_0 = Dvar.CFHDGABACF("QKKMRRLRR")
		local var_29_1 = var_29_0 == 5 or var_29_0 == 6

		if Engine.CGABICJHAI() and var_29_1 == true then
			ACTIONS.AnimateSequence(arg_23_0, "WideAspectRatioFrame")
		end
	end)

	local function var_23_10()
		QUARTERMASTER.RecordPurchaseConfirmEvent(arg_23_1, var_23_5, true, false, var_23_0)

		arg_23_0._purchasedAnimation = arg_23_0.ItemsGrid:GetNumChildren() > 0

		if arg_23_0._isFirstParty then
			arg_23_0._isOwned = true
		else
			arg_23_0._isOwned = Loot.DEBEIFJEEG(arg_23_0._controllerIndex, arg_23_0._bundleID) > 0
		end

		LUI.FlowManager.RequestLeaveMenuByName("LootPurchasingPopup", true)
		var_23_6()
		Engine.BJDBIAGIDA(SOUND_SETS.storefront.selectionConfirmed)

		arg_23_0:Wait(3000).onComplete = function()
			Engine.EBCGADABJ()
			ACTIONS.AnimateSequence(arg_23_0, "BundlePurchaseHide")
			arg_23_0.ItemsGrid:RefreshContent()
			arg_23_0.HelperBar:SetAlpha(1)
		end
	end

	if arg_23_0._isFirstParty then
		arg_23_0:addEventHandler("exchanged_item", function(arg_32_0, arg_32_1)
			if not arg_32_1.fromSignIn then
				arg_32_0._firstPartyPurchaseSuccess = true
				var_23_1.firstPartyOwned = true

				return true
			end
		end)
		arg_23_0:addEventHandler("exchanged_item_failed", function(arg_33_0, arg_33_1)
			if not arg_33_1.fromSignIn then
				QUARTERMASTER.RecordPurchaseConfirmEvent(arg_23_1, var_23_5, false, true, var_23_0)

				arg_23_0._previewsEnabled = true
			end
		end)
		arg_23_0:addEventHandler("ingamestore_purchased_product", function(arg_34_0, arg_34_1)
			if arg_34_1.transactionResult == STORE.TransactionResult.TRANSACTION_SUCCEEDED then
				arg_34_0._firstPartyPurchaseSuccess = true
				var_23_1.firstPartyOwned = true

				LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
			end
		end)
	else
		arg_23_0:addEventHandler("loot_item_transaction_complete", var_23_10)
		arg_23_0:addEventHandler("loot_item_transaction_error", function(arg_35_0, arg_35_1)
			if arg_35_1.errorCode == STORE.ProductNoLongerAvailableError then
				LUI.FlowManager.RequestPopupMenu(nil, "ProductNoLongerAvailableErrorPopup", true, arg_23_1, false)
			end

			QUARTERMASTER.RecordPurchaseConfirmEvent(arg_23_1, var_23_5, false, true, var_23_0)
			LUI.FlowManager.RequestLeaveMenuByName("LootPurchasingPopup", true)

			local var_35_0 = {
				cratePopupType = STORE.CratePopupType.PURCHASE_FAIL
			}

			LUI.FlowManager.RequestPopupMenu(nil, "popup_handle_lootcrate", true, arg_23_1, false, var_35_0)
			Engine.EBCGADABJ()
			ACTIONS.AnimateSequence(arg_23_0, "BundlePurchaseHide")

			arg_23_0._previewsEnabled = true

			arg_23_0.ItemsGrid:RefreshContent()
			arg_23_0.HelperBar:SetAlpha(1)
		end)
	end

	arg_23_0:addEventHandler("restore_focus", function(arg_36_0, arg_36_1)
		if arg_23_0._isFirstParty then
			if Engine.CIEGIACHAE() then
				InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
			end

			if arg_23_0._firstPartyPurchaseSuccess and not var_23_1.hasPlayedPurchaseAnimation then
				arg_23_0._firstPartyPurchaseSuccess = nil

				arg_23_0:processEvent({
					name = "bundle_purchase_complete"
				})

				var_23_1.hasPlayedPurchaseAnimation = true

				var_23_10()
			end
		end
	end)
	arg_23_0.bindButton:registerEventHandler("button_alt1", var_0_7(arg_23_0))

	if not arg_23_0._isFirstParty and CONDITIONS.AreCODPointsEnabled(arg_23_0) then
		arg_23_0.bindButton:registerEventHandler("button_alt2", var_0_8(arg_23_0))
		arg_23_0.PlayerDetails.Wallet.CoDPoints.Btn:SetAlpha(1)
	end

	local var_23_11 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_23_0._bundleID, CSV.bundleIDs.cols.titleImage)

	if var_23_11 and #var_23_11 > 0 then
		arg_23_0.TitleImage:setImage(RegisterMaterial(var_23_11))
	else
		arg_23_0.TitleImage:SetAlpha(0)
	end

	local var_23_12 = STORE.GetBundleDescription(arg_23_0._bundleID)

	if var_23_12 then
		arg_23_0.DescriptionText:setText(var_23_12)
	end

	local var_23_13 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_23_0._bundleID, CSV.bundleIDs.cols.name)

	if var_23_13 then
		local var_23_14 = Engine.DGAIDIEIAC()

		if not (var_23_14 == 0 or var_23_14 == 1) then
			arg_23_0.LocalizedTitle:setText(Engine.CBBHFCGDIC(var_23_13))
		end
	end

	if arg_23_0._isOwned then
		ACTIONS.AnimateSequence(arg_23_0, "Purchased")
		arg_23_0.PurchaseButton:SetButtonDisabled(true)
		arg_23_0.PurchaseButton:processEvent({
			name = "Purchased"
		})
		arg_23_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			side = "left",
			button_ref = "button_alt1"
		})
	elseif LUI.IsLastInputKeyboardMouse(arg_23_1) then
		arg_23_0.PurchaseButton:processEvent({
			name = "button_up"
		})
	else
		arg_23_0.PurchaseButton:processEvent({
			name = "button_over"
		})
	end

	arg_23_0:registerEventHandler("menu_close", function(arg_37_0, arg_37_1)
		LUI.FlowManager.RequestLeaveMenuByName("LootPurchasingPopup")

		if arg_23_0._bundleID == tonumber(BATTLEPASS.GetTierSkipGiftID()) then
			local var_37_0 = LUI.FlowManager.GetScopedData("MainMenu")

			if var_37_0.returnToMainMenu then
				var_37_0.returnToMainMenu = nil
			end
		end
	end)
	arg_23_0.bindButton:addEventHandler("button_secondary", function(arg_38_0, arg_38_1)
		if not arg_23_0._purchasedAnimation then
			if LUI.FlowManager.IsInStack("OperatorSelect") and arg_23_0._isOwned then
				local var_38_0 = LUI.FlowManager.GetScopedData("OperatorSelect")

				var_38_0.operatorData.useDefaultOperatorForFocus = true
				var_38_0.operatorData.useEquippedOperatorFocusIndex = false

				LUI.FlowManager.RequestRestoreMenu("OperatorSelect")
			else
				LUI.FlowManager.RequestLeaveMenu(arg_38_0)
			end
		end
	end)
	ACTIONS.ScaleFullscreen(arg_23_0.Darkener)
	ACTIONS.ScaleFullscreen(arg_23_0.Transition)
	LAYOUT.AddAspectRatioFadeFrame(arg_23_0, arg_23_1)

	local function var_23_15()
		var_0_5(arg_23_0, arg_23_0.id, arg_23_0.PurchaseButton, arg_23_1, arg_23_2.startPurchaseImmediately)

		arg_23_2.startPurchaseImmediately = false
		var_23_1.startPurchaseImmediately = false
	end

	if arg_23_2.startPurchaseImmediately or var_23_1.startPurchaseImmediately then
		var_23_15()
	end

	if not arg_23_2.isQuickPurchasePopupInPreview then
		if arg_23_0.ItemsGrid then
			arg_23_0.ItemsGrid:FocusFirstItem()
		end

		arg_23_0:saveState()
	end

	arg_23_0:addEventHandler("restore_focus", function(arg_40_0, arg_40_1)
		if arg_23_2.startPurchaseImmediately or var_23_1.startPurchaseImmediately then
			var_23_15()
		elseif var_23_1.isQuickPurchasePopupInPreview then
			var_23_1.isQuickPurchasePopupInPreview = false

			var_0_4(arg_40_0, arg_40_1.controller)
		end
	end)

	if arg_23_0._timerValue then
		arg_23_0.LimitedTimeItem:SetupTimeLimit(nil, nil, arg_23_0._timerValue, true, true)
	else
		arg_23_0.LimitedTimeItem:SetAlpha(0)
	end
end

function StoreBundlePreview(arg_41_0, arg_41_1)
	local var_41_0 = LUI.UIElement.new()

	var_41_0.id = "StoreBundlePreview"
	var_41_0._animationSets = var_41_0._animationSets or {}
	var_41_0._sequences = var_41_0._sequences or {}

	local var_41_1 = arg_41_1 and arg_41_1.controllerIndex

	if not var_41_1 and not Engine.DDJFBBJAIG() then
		var_41_1 = var_41_0:getRootController()
	end

	assert(var_41_1)

	var_41_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_41_1
	})
	var_41_0.HelperBar.id = "HelperBar"

	var_41_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_41_0.HelperBar:setPriority(10)
	var_41_0:addElement(var_41_0.HelperBar)

	local var_41_2 = var_41_0
	local var_41_3
	local var_41_4 = LUI.UIImage.new()

	var_41_4.id = "Darkener"

	var_41_4:SetRGBFromInt(0, 0)
	var_41_0:addElement(var_41_4)

	var_41_0.Darkener = var_41_4

	local var_41_5
	local var_41_6 = LUI.UIImage.new()

	var_41_6.id = "Background"

	var_41_6:setImage(RegisterMaterial("mw_store_billboard_preview_blur"), 0)
	var_41_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 170, _1080p * 922)
	var_41_0:addElement(var_41_6)

	var_41_0.Background = var_41_6

	local var_41_7
	local var_41_8 = LUI.UIStyledText.new()

	var_41_8.id = "DescriptionText"

	var_41_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_41_8:setText("", 0)
	var_41_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_41_8:SetAlignment(LUI.Alignment.Left)
	var_41_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_41_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_41_8:SetStartupDelay(2000)
	var_41_8:SetLineHoldTime(400)
	var_41_8:SetAnimMoveTime(2000)
	var_41_8:SetAnimMoveSpeed(150)
	var_41_8:SetEndDelay(2000)
	var_41_8:SetCrossfadeTime(250)
	var_41_8:SetFadeInTime(300)
	var_41_8:SetFadeOutTime(300)
	var_41_8:SetMaxVisibleLines(4)
	var_41_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 580, _1080p * 604)
	var_41_0:addElement(var_41_8)

	var_41_0.DescriptionText = var_41_8

	local var_41_9

	if CONDITIONS.InFrontend(var_41_0) then
		local var_41_10 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_41_1
		})

		var_41_10.id = "LobbyMembersFooter"

		var_41_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_41_0:addElement(var_41_10)

		var_41_0.LobbyMembersFooter = var_41_10
	end

	local var_41_11
	local var_41_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 5,
		maxVisibleRows = 2,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_41_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LootItemCardWrapper", {
				controllerIndex = var_41_1
			})
		end,
		refreshChild = function(arg_43_0, arg_43_1, arg_43_2)
			return
		end,
		spacingX = _1080p * 30,
		spacingY = _1080p * 30,
		columnWidth = _1080p * 210,
		rowHeight = _1080p * 310,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_41_13 = LUI.UIGrid.new(var_41_12)

	var_41_13.id = "ItemsGrid"

	var_41_13:setUseStencil(false)
	var_41_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1266, _1080p * -96, _1080p * 215, _1080p * 865)
	var_41_0:addElement(var_41_13)

	var_41_0.ItemsGrid = var_41_13

	local var_41_14
	local var_41_15 = MenuBuilder.BuildRegisteredType("PurchaseBundleButton", {
		controllerIndex = var_41_1
	})

	var_41_15.id = "PurchaseButton"

	var_41_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 496, _1080p * 715, _1080p * 835)
	var_41_0:addElement(var_41_15)

	var_41_0.PurchaseButton = var_41_15

	local var_41_16
	local var_41_17 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_41_1
	})

	var_41_17.id = "PlayerDetails"

	var_41_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_41_0:addElement(var_41_17)

	var_41_0.PlayerDetails = var_41_17

	local var_41_18
	local var_41_19 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_41_1
	})

	var_41_19.id = "MenuTitle"

	var_41_19.MenuTitle:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_PREVIEW"), 0)
	var_41_19.Line:SetLeft(0, 0)
	var_41_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_41_0:addElement(var_41_19)

	var_41_0.MenuTitle = var_41_19

	local var_41_20
	local var_41_21 = LUI.UIImage.new()

	var_41_21.id = "TitleImage"

	var_41_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 240, _1080p * 496)
	var_41_0:addElement(var_41_21)

	var_41_0.TitleImage = var_41_21

	local var_41_22
	local var_41_23 = LUI.UIStyledText.new()

	var_41_23.id = "LocalizedTitle"

	var_41_23:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_41_23:setText("", 0)
	var_41_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_41_23:SetWordWrap(false)
	var_41_23:SetAlignment(LUI.Alignment.Left)
	var_41_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_41_23:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_41_23:SetStartupDelay(2000)
	var_41_23:SetLineHoldTime(400)
	var_41_23:SetAnimMoveTime(2000)
	var_41_23:SetAnimMoveSpeed(150)
	var_41_23:SetEndDelay(2000)
	var_41_23:SetCrossfadeTime(250)
	var_41_23:SetFadeInTime(300)
	var_41_23:SetFadeOutTime(300)
	var_41_23:SetMaxVisibleLines(1)
	var_41_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 546, _1080p * 576)
	var_41_0:addElement(var_41_23)

	var_41_0.LocalizedTitle = var_41_23

	local var_41_24
	local var_41_25 = LUI.UIStyledText.new()

	var_41_25.id = "Disclaimer"

	var_41_25:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_41_25:SetAlpha(0, 0)
	var_41_25:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"), 0)
	var_41_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_41_25:SetAlignment(LUI.Alignment.Left)
	var_41_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 496, _1080p * 845, _1080p * 863)
	var_41_0:addElement(var_41_25)

	var_41_0.Disclaimer = var_41_25

	local var_41_26
	local var_41_27 = LUI.UIImage.new()

	var_41_27.id = "Lock"

	var_41_27:SetAlpha(0, 0)
	var_41_27:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_41_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 128, _1080p * 838, _1080p * 870)
	var_41_0:addElement(var_41_27)

	var_41_0.Lock = var_41_27

	local var_41_28
	local var_41_29 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_41_1
	})

	var_41_29.id = "LimitedTimeItem"

	var_41_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 396, _1080p * 185, _1080p * 215)
	var_41_0:addElement(var_41_29)

	var_41_0.LimitedTimeItem = var_41_29

	local var_41_30
	local var_41_31 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_41_1
	})

	var_41_31.id = "Cinematic"

	var_41_31:SetAlpha(0, 0)
	var_41_0:addElement(var_41_31)

	var_41_0.Cinematic = var_41_31

	local var_41_32
	local var_41_33 = LUI.UIImage.new()

	var_41_33.id = "VignetteRight"

	var_41_33:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_41_33:SetAlpha(0, 0)
	var_41_33:setImage(RegisterMaterial("gradient_curve"), 0)
	var_41_33:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
	var_41_0:addElement(var_41_33)

	var_41_0.VignetteRight = var_41_33

	local var_41_34
	local var_41_35 = LUI.UIImage.new()

	var_41_35.id = "VignetteLeft"

	var_41_35:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_41_35:SetAlpha(0, 0)
	var_41_35:SetYRotation(180, 0)
	var_41_35:setImage(RegisterMaterial("gradient_curve"), 0)
	var_41_35:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
	var_41_0:addElement(var_41_35)

	var_41_0.VignetteLeft = var_41_35

	local var_41_36
	local var_41_37 = LUI.UIStyledText.new()

	var_41_37.id = "PurchasedMessage"

	var_41_37:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_41_37:SetAlpha(0, 0)
	var_41_37:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_PURCHASED")), 0)
	var_41_37:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_41_37:SetAlignment(LUI.Alignment.Center)
	var_41_37:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -35, _1080p * 35)
	var_41_0:addElement(var_41_37)

	var_41_0.PurchasedMessage = var_41_37

	local var_41_38
	local var_41_39 = LUI.UIImage.new()

	var_41_39.id = "Transition"

	var_41_39:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_41_39:SetAlpha(0, 0)
	var_41_0:addElement(var_41_39)

	var_41_0.Transition = var_41_39

	local var_41_40
	local var_41_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1266
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 865
		}
	}

	var_41_13:RegisterAnimationSequence("DefaultSequence", var_41_41)

	local var_41_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_39:RegisterAnimationSequence("DefaultSequence", var_41_42)

	local function var_41_43()
		var_41_13:AnimateSequence("DefaultSequence")
		var_41_39:AnimateSequence("DefaultSequence")
	end

	var_41_0._sequences.DefaultSequence = var_41_43

	local var_41_44
	local var_41_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_31:RegisterAnimationSequence("BundlePurchaseShow", var_41_45)

	local var_41_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_37:RegisterAnimationSequence("BundlePurchaseShow", var_41_46)

	local function var_41_47()
		var_41_31:AnimateSequence("BundlePurchaseShow")
		var_41_37:AnimateSequence("BundlePurchaseShow")
	end

	var_41_0._sequences.BundlePurchaseShow = var_41_47

	local var_41_48
	local var_41_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_31:RegisterAnimationSequence("BundlePurchaseHide", var_41_49)

	local var_41_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_33:RegisterAnimationSequence("BundlePurchaseHide", var_41_50)

	local var_41_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_35:RegisterAnimationSequence("BundlePurchaseHide", var_41_51)

	local var_41_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_37:RegisterAnimationSequence("BundlePurchaseHide", var_41_52)

	local function var_41_53()
		var_41_31:AnimateSequence("BundlePurchaseHide")
		var_41_33:AnimateSequence("BundlePurchaseHide")
		var_41_35:AnimateSequence("BundlePurchaseHide")
		var_41_37:AnimateSequence("BundlePurchaseHide")
	end

	var_41_0._sequences.BundlePurchaseHide = var_41_53

	local var_41_54
	local var_41_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 496
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		}
	}

	var_41_25:RegisterAnimationSequence("TierDisclaimer", var_41_55)

	local var_41_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_27:RegisterAnimationSequence("TierDisclaimer", var_41_56)

	local function var_41_57()
		var_41_25:AnimateSequence("TierDisclaimer")
		var_41_27:AnimateSequence("TierDisclaimer")
	end

	var_41_0._sequences.TierDisclaimer = var_41_57

	local var_41_58
	local var_41_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 496
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/BUNDLE_ADDED_TO_INVENTORY")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_41_25:RegisterAnimationSequence("Purchased", var_41_59)

	local var_41_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_27:RegisterAnimationSequence("Purchased", var_41_60)

	local function var_41_61()
		var_41_25:AnimateSequence("Purchased")
		var_41_27:AnimateSequence("Purchased")
	end

	var_41_0._sequences.Purchased = var_41_61

	local var_41_62
	local var_41_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_33:RegisterAnimationSequence("WideAspectRatioFrame", var_41_63)

	local var_41_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_41_35:RegisterAnimationSequence("WideAspectRatioFrame", var_41_64)

	local function var_41_65()
		var_41_33:AnimateSequence("WideAspectRatioFrame")
		var_41_35:AnimateSequence("WideAspectRatioFrame")
	end

	var_41_0._sequences.WideAspectRatioFrame = var_41_65

	var_41_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_41_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_41_66 = LUI.UIBindButton.new()

	var_41_66.id = "selfBindButton"

	var_41_0:addElement(var_41_66)

	var_41_0.bindButton = var_41_66

	var_0_9(var_41_0, var_41_1, arg_41_1)
	ACTIONS.AnimateSequence(var_41_0, "DefaultSequence")

	return var_41_0
end

MenuBuilder.registerType("StoreBundlePreview", StoreBundlePreview)
LockTable(_M)
