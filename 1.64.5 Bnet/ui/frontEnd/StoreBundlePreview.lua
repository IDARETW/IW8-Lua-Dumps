module(..., package.seeall)

local var_0_0 = "button_alt1"
local var_0_1 = 200

local function var_0_2(arg_1_0)
	if arg_1_0._isItemGiftable and arg_1_0._previewsEnabled and CONDITIONS.IsGiftingEnabled() then
		arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt2",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_BUNDLE")
		})
	else
		arg_1_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			side = "left",
			button_ref = "button_alt2"
		})
	end
end

local function var_0_3()
	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end
end

local function var_0_4(arg_3_0, arg_3_1)
	local var_3_0 = MenuBuilder.BuildRegisteredType("PurchaseCPPopup", arg_3_1)
	local var_3_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		primaryButtonText = "LUA_MENU/PURCHASE",
		controllerIndex = arg_3_1.controllerIndex,
		widget = var_3_0
	})

	var_3_1.id = "PurchaseCODPointsPopup"

	return var_3_1
end

MenuBuilder.registerType("PurchaseCODPointsPopup", var_0_4)
LUI.FlowManager.RegisterStackPopBehaviour("PurchaseCODPointsPopup", var_0_3)

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_1.Card:getLocalRect()

	ACTIONS.AnimateSequence(arg_4_1.Card, "ShowPurchasedFrame")

	local function var_4_4()
		local var_5_0 = LOOT.GetBundleItemsMappedByType(arg_4_0._bundleID)

		if var_5_0[LOOT.itemTypes.BATTLE_PASS] and CONDITIONS.IsBattlePassEnabled() then
			local var_5_1 = 3000

			arg_4_1:Wait(var_5_1).onComplete = function()
				if BATTLEPASS.GetTier(arg_4_0._controllerIndex) < BATTLEPASS.GetMaxTier() then
					local var_6_0 = {
						tierSkipID = var_5_0[LOOT.itemTypes.BATTLE_PASS][1]
					}

					Engine.BJDBIAGIDA(SOUND_SETS.storefront.smokeCardSlam)
					LUI.FlowManager.RequestPopupMenu(nil, "BattlePassPurchaseProgressPopup", true, arg_4_0._controllerIndex, false, var_6_0)

					local var_6_1 = 1500

					arg_4_1:Wait(var_6_1).onComplete = function()
						arg_4_0._purchasedAnimation = false
						arg_4_0._previewsEnabled = true

						LUI.FlowManager.RequestLeaveMenuByName("BattlePassPurchaseProgressPopup", true, true)

						var_6_0.displayUpsellPopup = arg_4_0._displayUpsellPopup
						var_6_0.allowTierBank = arg_4_0._bundleID == BATTLEPASS.WarzoneTierSkipBundleID

						if arg_4_0._bundleID == tonumber(BATTLEPASS.GetTierSkipGiftID()) then
							local var_7_0 = LUI.FlowManager.GetScopedData("MainMenu")

							if var_7_0.returnToMainMenu then
								var_6_0.returnToMainMenu = var_7_0.returnToMainMenu
								var_7_0.returnToMainMenu = nil
							end
						end

						LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_4_0._controllerIndex, false, var_6_0, true)

						arg_4_0.isQuickAccessShortcutsDisabled = false
					end
				else
					arg_4_0._purchasedAnimation = false
					arg_4_0._previewsEnabled = true

					arg_4_0.ItemsGrid:RefreshContent()
				end
			end
		else
			if arg_4_0._displayUpsellPopup then
				local var_5_2 = 3000

				arg_4_0:Wait(var_5_2).onComplete = function()
					STORE.OpenBundleUpsellPopup(arg_4_0._controllerIndex)
				end
			end

			arg_4_0._purchasedAnimation = false
			arg_4_0._previewsEnabled = true

			arg_4_0.ItemsGrid:RefreshContent()

			arg_4_0.isQuickAccessShortcutsDisabled = false
		end

		var_0_2(arg_4_0)
	end

	local var_4_5

	local function var_4_6()
		local var_9_0 = math.random(-10, 10) * _1080p
		local var_9_1 = math.random(-10, 10) * _1080p
		local var_9_2 = LUI.EASING.linear
		local var_9_3 = math.random(10, 30)
		local var_9_4 = math.random(-4, 4)

		arg_4_1.Card:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_4_0 + var_9_1, var_4_2 + var_9_1, var_4_1 + var_9_0, var_4_3 + var_9_0, var_9_3, var_9_2).onComplete = function()
			if arg_4_1._shouldDoCustomJitterAnim then
				var_4_6()
			else
				arg_4_1.Card:SetZRotation(0, var_9_3, var_9_2)
				arg_4_1.Card:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_4_0, var_4_2, var_4_1, var_4_3, var_9_3, var_9_2)

				if arg_4_2 then
					var_4_4()
				end
			end
		end
	end

	local var_4_7 = 100

	arg_4_1:SetScale(1)
	arg_4_1:SetAlpha(1, var_4_7, LUI.EASING.outBack)
	arg_4_1:SetScale(0, var_4_7, LUI.EASING.outBack)

	arg_4_1:Wait(var_4_7).onComplete = function()
		arg_4_1._shouldDoCustomJitterAnim = true

		var_4_6()

		if arg_4_1._lootType == LOOT.itemTypes.BATTLE_PASS and CONDITIONS.IsBattlePassEnabled() then
			arg_4_1.Flare:PlayFlareSprite("BattlePassPurchased")

			arg_4_1:Wait(1500).onComplete = function()
				Engine.BJDBIAGIDA(SOUND_SETS.storefront.smokePoof)
				arg_4_1.Flare:PlayFlareSprite("Smoke")
				arg_4_1:SetAlpha(0.3, 1500)
			end
		else
			local var_11_0 = LOOT.RarityEffects[arg_4_1._rarity] and LOOT.RarityEffects[arg_4_1._rarity].flareRef or "Base"

			arg_4_1.Flare:PlayFlareSprite(var_11_0)
		end

		arg_4_1:Wait(50).onComplete = function()
			arg_4_1._shouldDoCustomJitterAnim = false
		end
	end
end

local function var_0_6(arg_14_0, arg_14_1)
	local function var_14_0()
		arg_14_0:addElement(LOOT.GetLootFlareMaterialStreamer())
		arg_14_0:processEvent({
			name = "bundle_purchase_complete"
		})

		local var_15_0 = STORE.GetBundlePurchaseID(arg_14_1, arg_14_0._bundleID)

		Loot.HAJHHFGJJ(arg_14_1, var_15_0)

		local var_15_1 = {
			message = "LUA_MENU_MP/PURCHASE"
		}

		LUI.FlowManager.RequestPopupMenu(nil, "LootPurchasingPopup", true, arg_14_1, false, var_15_1)
		arg_14_0.HelperBar:SetAlpha(0)

		if LUI.FlowManager.GetScopedData(arg_14_0).oneModBlueprintStore then
			LUI.FlowManager.RequestLeaveMenuByName("WeaponLocker")
		end

		if arg_14_0._upsellMenu then
			Engine.CEJJDJJHIJ(arg_14_1, "dlog_event_purchase_bundle_through_upsell", {
				bundle_id = tostring(arg_14_0._bundleID),
				upsell_menu = arg_14_0._upsellMenu
			})
		end
	end

	if Engine.DBFCJBDJEC() and Engine.DDHFCGHJEA() then
		local var_14_1 = {
			itemName = arg_14_0._itemName,
			itemImage = arg_14_0._itemImage,
			itemCurrencyID = arg_14_0._currencyID,
			itemCurrencyAmount = arg_14_0._currencyAmount,
			confirmAction = function()
				var_14_0()
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "StoreConfirmPurchaseKoreaLegalPupup", true, arg_14_1, false, var_14_1, nil, false, true)
	else
		var_14_0()
	end
end

local function var_0_7(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	if arg_17_0._isOwned then
		return
	end

	if QUARTERMASTER.itemData then
		QUARTERMASTER.RecordItemBrowseEvent(arg_17_0._controllerIndex, false, arg_17_0._sourceMenu)
	end

	if arg_17_0._isFirstParty and arg_17_0._firstPartyPurchase then
		arg_17_0._firstPartyPurchase()

		return
	end

	if Commerce.CEDDCGHIGA(arg_17_3, arg_17_0._currencyID) < arg_17_0._currencyAmount then
		local var_17_0 = {
			showBalance = true,
			controllerIndex = arg_17_3,
			currencyID = arg_17_0._currencyID,
			currencyAmount = arg_17_0._currencyAmount
		}

		STORE.EnterStore(arg_17_3, arg_17_1, arg_17_2.id, var_17_0, "PurchaseCODPointsPopup", true)
	else
		local var_17_1 = {
			itemName = arg_17_0._itemName,
			itemImage = arg_17_0._itemImage,
			itemCurrencyID = arg_17_0._currencyID,
			itemCurrencyAmount = arg_17_0._currencyAmount,
			showDisclaimer = arg_17_0._showDisclaimer,
			startPurchaseImmediately = arg_17_4,
			alreadyOwnedCount = arg_17_0._alreadyOwnedCount,
			consumablesCount = arg_17_0._consumablesCount,
			confirmAction = function()
				var_0_6(arg_17_0, arg_17_3)
			end
		}
		local var_17_2 = LUI.FlowManager.GetScopedData(arg_17_0)

		var_17_1.bundleExclusivity = var_17_2.bundleExclusivity
		var_17_1.doesBundleHave1ExclusiveItem = var_17_2.doesBundleHave1ExclusiveItem

		Engine.BJDBIAGIDA(SOUND_SETS.storefront.purchaseBundle)
		LUI.FlowManager.RequestPopupMenu(nil, "StoreConfirmPurchasePopup", true, arg_17_3, false, var_17_1, nil, false, true)
	end
end

local function var_0_8(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = {
		showBalance = true,
		controllerIndex = arg_19_3,
		currencyID = arg_19_0._currencyID,
		currencyAmount = arg_19_0._currencyAmount
	}

	STORE.EnterStore(arg_19_3, arg_19_1, arg_19_2.id, var_19_0, "PurchaseCODPointsPopup", true)
end

local function var_0_9(arg_20_0)
	return function(arg_21_0, arg_21_1)
		if arg_21_1.name == var_0_0 and LUI.IsLastInputKeyboardMouse(arg_21_1.controller) then
			return
		end

		var_0_7(arg_20_0, arg_20_0:GetCurrentMenu().id, arg_21_0, arg_21_1.controller, false)
	end
end

local function var_0_10(arg_22_0, arg_22_1)
	if arg_22_1.name == var_0_0 and LUI.IsLastInputKeyboardMouse(arg_22_1.controller) then
		return
	end

	local var_22_0 = arg_22_0:getParent()
	local var_22_1 = var_22_0._items
	local var_22_2 = var_22_0.ItemsGrid:GetFocusPositionIndex() + 1
	local var_22_3 = tonumber(var_22_1[var_22_2])
	local var_22_4 = LOOT.GetTypeForID(var_22_3)
	local var_22_5 = LOOT.GetItemRef(var_22_4, var_22_3)
	local var_22_6 = LOOT.GetItemName(var_22_4, var_22_5, var_22_3)
	local var_22_7

	if LOOT.IsItemTypeQuickEquipable(var_22_4) and var_22_0._isOwned and LOOT.IsItemIDEquippableByCurrentGameMode(var_22_3) then
		if var_22_4 == LOOT.itemTypes.OPERATOR_SKIN then
			local var_22_8 = StringTable.DIFCHIGDFB(CSV.operatorSkinIDs.file, CSV.operatorSkinIDs.cols.id, var_22_3, CSV.operatorSkinIDs.cols.ref)

			if var_22_8 and #var_22_8 > 0 then
				local var_22_9 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, var_22_8, CSV.operatorSkins.cols.lootIndex)
				local var_22_10 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, var_22_8, CSV.operatorSkins.cols.operatorRef)
				local var_22_11 = OPERATOR.GetSuperFactionIndexForPlayerData(var_22_10)
				local var_22_12 = {
					operatorFaction = var_22_11,
					operatorRef = var_22_10
				}

				RANDOM.SetEnabled(var_22_0._controllerIndex, LOOT.itemTypes.OPERATOR_SKIN, false, var_22_12)
				OPERATOR.SetEquippedItemForLootType(var_22_0._controllerIndex, var_22_10, var_22_4, var_22_9)
				Lobby.PreloadViewHandsForLocalPlayer(var_22_0._controllerIndex)

				var_22_7 = {
					iconScale = -0.3,
					displayTime = 3000,
					icon = "cac_equip_fill",
					iconColor = SWATCHES.genericMenu.notificationHighlight,
					header = Engine.CBBHFCGDIC("LUA_MENU/SKIN_SELECTED"),
					description = var_22_6,
					type = LUI.ToastManager.NotificationType.SkinEquipped,
					controllerIndex = var_22_0._controllerIndex
				}

				local var_22_13 = PlayerData.BFFBGAJGD(var_22_0._controllerIndex, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
				local var_22_14 = var_22_13.operators[var_22_11]:get()

				RANDOM.SetEnabled(var_22_0._controllerIndex, LOOT.itemTypes.OPERATOR, false, var_22_12)
				var_22_13.operators[var_22_11]:set(var_22_10)
				var_22_13.selectedOperatorIndex:set(var_22_11)

				local var_22_15 = {
					iconScale = -0.3,
					displayTime = 3000,
					icon = "cac_equip_fill",
					iconColor = SWATCHES.genericMenu.notificationHighlight,
					header = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECTED"),
					description = Engine.CBBHFCGDIC(OPERATOR.GetName(var_22_10)),
					type = LUI.ToastManager.NotificationType.OperatorEquipped,
					controllerIndex = var_22_0._controllerIndex
				}

				var_22_0:dispatchEventToRoot({
					name = "send_toast_notification",
					immediate = true,
					options = var_22_15
				})
				Engine.DAGFFDGFII("uploadstats", var_22_0._controllerIndex)
			end
		elseif var_22_4 == LOOT.itemTypes.OPERATOR_EXECUTION then
			local var_22_16 = StringTable.DIFCHIGDFB(CSV.executionsIds.file, CSV.executionsIds.cols.id, var_22_3, CSV.executionsIds.cols.ref)

			if var_22_16 and #var_22_16 > 0 then
				local var_22_17 = StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, var_22_16, CSV.operatorExecutions.cols.lootIndex)
				local var_22_18 = OPERATOR.GetOperatorRefByLootTypeAndID(var_22_4, var_22_3, var_22_0._controllerIndex)

				OPERATOR.SetEquippedItemForLootType(var_22_0._controllerIndex, var_22_18, var_22_4, var_22_17)
				Lobby.PreloadViewHandsForLocalPlayer(var_22_0._controllerIndex)

				var_22_7 = {
					iconScale = -0.3,
					displayTime = 3000,
					icon = "cac_equip_fill",
					iconColor = SWATCHES.genericMenu.notificationHighlight,
					header = Engine.CBBHFCGDIC("LUA_MENU/EXECUTION_SELECTED"),
					description = var_22_6,
					type = LUI.ToastManager.NotificationType.ExecutionEquipped,
					controllerIndex = var_22_0._controllerIndex
				}
			end
		elseif var_22_4 == LOOT.itemTypes.WATCH then
			local var_22_19 = WATCH.GetEquippedWatch(var_22_0._controllerIndex)
			local var_22_20 = StringTable.DIFCHIGDFB(CSV.accessoryIds.file, CSV.accessoryIds.cols.id, var_22_3, CSV.accessoryIds.cols.ref)

			if var_22_20 and #var_22_20 > 0 then
				WATCH.SetEquippedWatch(var_22_0._controllerIndex, var_22_20, var_22_19)
			end
		elseif var_22_4 == LOOT.itemTypes.PLAYERCARD then
			local var_22_21 = StringTable.DIFCHIGDFB(CSV.playercardsIds.file, CSV.playercardsIds.cols.id, var_22_3, CSV.playercardsIds.cols.ref)

			if var_22_21 and #var_22_21 > 0 then
				local var_22_22 = StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.ref, var_22_21, CSV.callingCards.cols.index)

				Playercard.DAHDCGCDEC(var_22_0._controllerIndex)
				Playercard.CGGBAHFGAF(var_22_0._controllerIndex, var_22_22)
				Playercard.FCBJJBFBJ(var_22_0._controllerIndex)

				local var_22_23 = CallingCardUtils.GetCardTexture(var_22_22) or "hud_cmd_active_backer"

				var_22_7 = {
					displayTime = 2000,
					icon = var_22_23,
					header = Engine.CBBHFCGDIC("LUA_MENU/PLAYERCARD_EQUIPPED"),
					description = var_22_6,
					type = LUI.ToastManager.NotificationType.PlayerCardEquipped,
					controllerIndex = var_22_0._controllerIndex
				}

				RANDOM.SetEnabled(var_22_0._controllerIndex, LOOT.itemTypes.PLAYERCARD, false)
			end
		elseif var_22_4 == LOOT.itemTypes.EMBLEM then
			local var_22_24 = StringTable.DIFCHIGDFB(CSV.emblemsIds.file, CSV.emblemsIds.cols.id, var_22_3, CSV.emblemsIds.cols.ref)

			if var_22_24 and #var_22_24 > 0 then
				local var_22_25 = StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.ref, var_22_24, CSV.emblems.cols.index)

				Playercard.DAHDCGCDEC(var_22_0._controllerIndex)
				Playercard.DBBICFEAGH(var_22_0._controllerIndex, var_22_25)
				Playercard.FCBJJBFBJ(var_22_0._controllerIndex)

				local var_22_26 = EmblemEditorUtils.GetEmblemImageFromID(var_22_25) or "hud_cmd_active_backer"

				var_22_7 = {
					displayTime = 2000,
					icon = var_22_26,
					header = Engine.CBBHFCGDIC("LUA_MENU/EMBLEM_EQUIPPED"),
					description = var_22_6,
					type = LUI.ToastManager.NotificationType.EmblemEquipped,
					controllerIndex = var_22_0._controllerIndex
				}

				RANDOM.SetEnabled(var_22_0._controllerIndex, LOOT.itemTypes.EMBLEM, false)
			end
		elseif var_22_4 == LOOT.itemTypes.TITLE then
			local var_22_27 = StringTable.DIFCHIGDFB(CSV.playerCardTitleIds.file, CSV.playerCardTitleIds.cols.id, var_22_3, CSV.playerCardTitleIds.cols.ref)

			if var_22_27 and #var_22_27 > 0 then
				local var_22_28 = StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.ref, var_22_27, CSV.callingCardTitles.cols.index)
				local var_22_29 = StringTable.DIFCHIGDFB(CSV.callingCardTitles.file, CSV.callingCardTitles.cols.ref, var_22_27, CSV.callingCardTitles.cols.name)

				Playercard.DAHDCGCDEC(var_22_0._controllerIndex)
				Playercard.DAIIIAHAHH(var_22_0._controllerIndex, var_22_28)
				Playercard.FCBJJBFBJ(var_22_0._controllerIndex)

				var_22_7 = {
					displayTime = 2000,
					header = Engine.CBBHFCGDIC("LUA_MENU/PLAYERCARD_EQUIPPED"),
					description = Engine.CBBHFCGDIC(var_22_29),
					type = LUI.ToastManager.NotificationType.TitleEquipped,
					controllerIndex = var_22_0._controllerIndex
				}

				RANDOM.SetEnabled(var_22_0._controllerIndex, LOOT.itemTypes.TITLE, false)
			end
		elseif var_22_4 == LOOT.itemTypes.VEHICLE_CAMO then
			local var_22_30 = StringTable.DIFCHIGDFB(CSV.vehicleCamos.file, CSV.vehicleCamos.cols.lootID, var_22_3, CSV.vehicleCamos.cols.vehicleRef)

			if var_22_30 and #var_22_30 > 0 then
				VEHICLE.GetPlayerData(var_22_0._controllerIndex, var_22_30).camo:set(var_22_3)

				var_22_7 = {
					iconScale = -0.3,
					displayTime = 1500,
					icon = "cac_equip_fill",
					iconColor = SWATCHES.genericMenu.notificationHighlight,
					header = Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED_VEH_CAMO"),
					description = var_22_6,
					controllerIndex = var_22_0._controllerIndex
				}

				RANDOM.SetEnabled(var_22_0._controllerIndex, LOOT.itemTypes.VEHICLE_CAMO, false, {
					vehicleRef = var_22_30
				})
			end
		elseif var_22_4 == LOOT.itemTypes.VEHICLE_HORN then
			local var_22_31 = StringTable.DIFCHIGDFB(CSV.vehicleHornIds.file, CSV.vehicleHornIds.cols.id, var_22_3, CSV.vehicleHornIds.cols.ref)

			if var_22_31 and #var_22_31 > 0 then
				local var_22_32 = StringTable.DIFCHIGDFB(CSV.vehicleHorns.file, CSV.vehicleHorns.cols.ref, var_22_31, CSV.vehicleHorns.cols.index)
				local var_22_33 = VEHICLE.GetAllVehicles(var_22_0._controllerIndex)

				for iter_22_0 = 1, #var_22_33 do
					local var_22_34 = var_22_33[iter_22_0]

					VEHICLE.GetPlayerData(var_22_0._controllerIndex, var_22_34.ref).horn:set(var_22_32)
					RANDOM.SetEnabled(var_22_0._controllerIndex, LOOT.itemTypes.VEHICLE_HORN, false, {
						vehicleRef = var_22_34.ref
					})
				end

				var_22_7 = {
					iconScale = -0.3,
					displayTime = 1500,
					icon = "cac_equip_fill",
					iconColor = SWATCHES.genericMenu.notificationHighlight,
					header = Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED_VEH_HORN"),
					description = var_22_6,
					controllerIndex = var_22_0._controllerIndex
				}
			end
		end

		Engine.BJDBIAGIDA(SOUND_SETS.default.action)
	end

	if var_22_7 then
		var_22_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_22_7
		})
	end
end

local function var_0_11(arg_23_0)
	local var_23_0 = arg_23_0._isOwned and var_0_10 or var_0_9(arg_23_0)

	arg_23_0.bindButton:registerEventHandler("button_alt1", var_23_0)
	arg_23_0.bindButton:addEventHandler("button_start", var_23_0)
end

local function var_0_12(arg_24_0)
	return function(arg_25_0, arg_25_1)
		var_0_8(arg_24_0, arg_24_0:GetCurrentMenu().id, arg_25_0, arg_25_1.controller)
	end
end

local function var_0_13(arg_26_0, arg_26_1)
	local var_26_0 = LUI.FlowManager.GetScopedData(arg_26_0)

	STORE.SetupGameExclusiveStatusOfBundle(arg_26_1, var_26_0)
	ACTIONS.AnimateSequence(arg_26_0, "Setup")

	local var_26_1 = {
		[LOOT.itemSourceExclusivity.MW_WZ] = {
			exclusivityText = var_26_0.doesBundleHave1ExclusiveItem and Engine.CBBHFCGDIC("WZ_TU_TANGO/BUNDLE_W_EXCLUSIVE_ITEM_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE"))) or Engine.CBBHFCGDIC("WZ_TU_TANGO/BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")))
		},
		[LOOT.itemSourceExclusivity.MW_EXCLUSIVE] = {
			exclusivityText = Engine.CBBHFCGDIC("WZ_TU_TANGO/EXCLUSIVE_BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
		},
		[LOOT.itemSourceExclusivity.CW_WZ] = {
			exclusivityText = var_26_0.doesBundleHave1ExclusiveItem and Engine.CBBHFCGDIC("WZ_TU_TANGO/BUNDLE_W_EXCLUSIVE_ITEM_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE"))) or Engine.CBBHFCGDIC("WZ_TU_TANGO/BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")))
		},
		[LOOT.itemSourceExclusivity.CW_EXCLUSIVE] = {
			exclusivityText = Engine.CBBHFCGDIC("WZ_TU_TANGO/EXCLUSIVE_BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")))
		},
		[LOOT.itemSourceExclusivity.CW_ZOMBIES_EXCLUSIVE] = {
			exclusivityText = Engine.CBBHFCGDIC("WZ_TU_TANGO/EXCLUSIVE_BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")))
		},
		[LOOT.itemSourceExclusivity.VG_WZ] = {
			exclusivityText = var_26_0.doesBundleHave1ExclusiveItem and Engine.CBBHFCGDIC("WZ_TU_TANGO/BUNDLE_W_EXCLUSIVE_ITEM_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE"))) or Engine.CBBHFCGDIC("WZ_TU_TANGO/BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")))
		},
		[LOOT.itemSourceExclusivity.VG_EXCLUSIVE] = {
			exclusivityText = Engine.CBBHFCGDIC("WZ_TU_TANGO/EXCLUSIVE_BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
		},
		[LOOT.itemSourceExclusivity.CW_MW_EXCLUSIVE] = {
			exclusivityText = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_EXCLUSIVE_BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
		},
		[LOOT.itemSourceExclusivity.CW_VG_EXCLUSIVE] = {
			exclusivityText = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_EXCLUSIVE_BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
		},
		[LOOT.itemSourceExclusivity.MW_VG_EXCLUSIVE] = {
			exclusivityText = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_EXCLUSIVE_BUNDLE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
		}
	}

	arg_26_0.SnipeIcon:UpdateSnipeIcon({
		selected = true,
		gameSourceExclusivityID = var_26_0.bundleExclusivity,
		alignment = LUI.Alignment.Left
	})

	if var_26_1[var_26_0.bundleExclusivity] then
		arg_26_0.EquippabilityText:setText(var_26_1[var_26_0.bundleExclusivity].exclusivityText)
	end
end

local function var_0_14()
	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end
end

local function var_0_15(arg_28_0, arg_28_1, arg_28_2)
	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() and arg_28_2.bundleID == nil then
		local var_28_0 = tonumber(Dvar.DHEEJCCJBH("online_store_bundle_id"))

		if var_28_0 and var_28_0 ~= 0 then
			arg_28_2.bundleID = var_28_0
			arg_28_2.currencyID = LOOT.CurrencyIDs.COD_POINTS
		end
	end

	assert(arg_28_2.bundleID)
	Engine.BJDBIAGIDA(SOUND_SETS.storefront.windowAppear)
	arg_28_0:addElement(LOOT.GetLootSmokeMaterialStreamer())

	arg_28_0._bundleID = arg_28_2.bundleID
	arg_28_0._timerValue = arg_28_2.timerValue
	arg_28_0._controllerIndex = arg_28_1 or Engine.IJEBHJIJF()
	arg_28_0._previewsEnabled = true
	arg_28_0._promotedItems = STORE.ParsePromotedItems(arg_28_1)
	arg_28_0._showDisclaimer = false
	arg_28_0._alreadyOwnedCount = 0
	arg_28_0._consumablesCount = 0
	arg_28_0._totalTierSkips = 0
	arg_28_0._curBattlePassTier = BATTLEPASS.GetTier(arg_28_1)
	arg_28_0._displayUpsellPopup = arg_28_2.displayUpsellPopup
	arg_28_0._itemName = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_28_0._bundleID, CSV.bundleIDs.cols.name)
	arg_28_0._itemImage = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_28_0._bundleID, CSV.bundleIDs.cols.titleImage)
	arg_28_0._discountPercent = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_28_0._bundleID, CSV.bundleIDs.cols.discountPercent)
	arg_28_0._positionInGrid = arg_28_2.positionInGrid
	arg_28_0._categoryIndex = arg_28_2.categoryIndex
	arg_28_0._categoryName = arg_28_2.categoryName
	arg_28_0._storeLayout = arg_28_2.storeLayout
	arg_28_0._sourceMenu = arg_28_2.sourceMenu
	arg_28_0._recommendationData = arg_28_2.recommendationData
	arg_28_0._upsellMenu = arg_28_2.upsellMenu
	arg_28_0._hasSelectPrompt = true
	arg_28_0._isItemGiftable = GIFT.IsItemGiftable(arg_28_0._bundleID)
	arg_28_0.RefreshAltAction = var_0_11

	local var_28_1 = {
		itemID = arg_28_0._bundleID,
		itemName = arg_28_0._itemName,
		positionInGrid = arg_28_0._positionInGrid,
		categoryIndex = arg_28_0._categoryIndex,
		categoryName = arg_28_0._categoryName,
		storeLayout = arg_28_0._storeLayout,
		sourceMenu = arg_28_0._sourceMenu,
		recommendationData = arg_28_0._recommendationData
	}
	local var_28_2 = LUI.FlowManager.GetScopedData(arg_28_0)

	if arg_28_2.isFirstParty then
		arg_28_0._isFirstParty = arg_28_2.isFirstParty
		arg_28_0._isOwned = var_28_2.firstPartyOwned or arg_28_2.owned
		arg_28_0._firstPartyPurchase = arg_28_2.firstPartyPurchase

		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
		end

		arg_28_0.PurchaseButton:SetPrice(arg_28_2.price, nil, arg_28_2.bundleID)
	else
		local var_28_3, var_28_4 = STORE.GetBundleCost(arg_28_0._controllerIndex, arg_28_2.bundleID)

		if var_28_4 and var_28_4 < var_28_3 then
			arg_28_0._currencyAmount = var_28_4

			if CONDITIONS.IsStoreSalesBannerEnabled() and arg_28_0._discountPercent then
				arg_28_0.SaleBanner:SetupDiscountPercentage(arg_28_0._discountPercent)
				arg_28_0.SaleBanner:SetAlpha(1)
			else
				arg_28_0.SaleBanner:SetAlpha(0)
			end
		else
			arg_28_0._currencyAmount = var_28_3

			arg_28_0.SaleBanner:SetAlpha(0)
		end

		arg_28_0._currencyID = arg_28_2.currencyID
		arg_28_0._isOwned = STORE.IsBundleOwned(arg_28_0._controllerIndex, arg_28_0._bundleID)

		arg_28_0.PurchaseButton:SetPrice(var_28_3, var_28_4, arg_28_2.bundleID)
	end

	local var_28_5 = LUI.FlowManager.GetMenuNameAtIndex(-1)

	if arg_28_2.currencyID == LOOT.CurrencyIDs.COD_POINTS then
		arg_28_0.PurchaseButton.CurrencyIcon:setImage(RegisterMaterial("icon_currency_codpoints"))
	elseif arg_28_2.currencyID == LOOT.CurrencyIDs.KEYS then
		arg_28_0.PurchaseButton.CurrencyIcon:setImage(RegisterMaterial("icon_currency_key"))
	elseif not arg_28_0._isFirstParty then
		assert(false, "Unsupported currency!")
	end

	local function var_28_6(arg_29_0)
		if arg_29_0._isOwned then
			local var_29_0 = arg_29_0.ItemsGrid:GetFocusPositionIndex() + 1
			local var_29_1 = arg_29_0._items
			local var_29_2 = tonumber(var_29_1[var_29_0])
			local var_29_3 = LOOT.GetTypeForID(var_29_2)
			local var_29_4 = LOOT.IsItemTypeQuickEquipable(var_29_3) and LOOT.IsItemIDEquippableByCurrentGameMode(var_29_2) and "ShowQuickEquip" or "HideQuickEquip"

			ACTIONS.AnimateSequence(arg_29_0, "Purchased")
			ACTIONS.AnimateSequence(arg_29_0, var_29_4)
			arg_29_0.PurchaseButton:SetButtonDisabled(true)
			arg_29_0.PurchaseButton:processEvent({
				name = "Purchased"
			})
			arg_29_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				side = "left",
				button_ref = "button_alt1"
			})
		else
			ACTIONS.AnimateSequence(arg_29_0, "HideQuickEquip")
		end
	end

	Engine.DHFCHIIJCA("loadout_showcase_preview")
	FrontEndScene.HideWeaponModels()

	local var_28_7 = true

	arg_28_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_PREVIEW")), var_28_7)

	arg_28_0._items = LOOT.GetItemsInBundle(arg_28_0._bundleID)

	local var_28_8 = arg_28_0._items

	assert(#var_28_8 <= 10, "A maximum of 10 bundle items are supported!")

	local function var_28_9(arg_30_0, arg_30_1, arg_30_2)
		arg_28_0.bundleData = {
			startPurchaseImmediately = false,
			controllerIndex = arg_28_1,
			bundleID = arg_28_0._bundleID,
			itemCurrencyID = arg_28_0._currencyID,
			itemCurrencyAmount = arg_28_0._currencyAmount,
			timerValue = arg_28_0._timerValue,
			showDisclaimer = arg_28_0._showDisclaimer,
			alreadyOwnedCount = arg_28_0._alreadyOwnedCount,
			consumablesCount = arg_28_0._consumablesCount,
			isBundlePurchased = arg_28_0._isOwned
		}

		local var_30_0 = arg_28_0.ItemsGrid:GetContentIndex(arg_30_1, arg_30_2) + 1
		local var_30_1 = tonumber(var_28_8[var_30_0])
		local var_30_2 = {}
		local var_30_3 = LOOT.GetTypeForID(var_30_1)
		local var_30_4 = LOOT.GetItemRef(var_30_3, var_30_1)
		local var_30_5 = CSV.MultiTableLookup(CSV.itemSourceTable.fileList, CSV.itemSourceTable.cols.marketPlaceID, var_30_1, CSV.itemSourceTable.cols.refType)

		if var_30_3 == LOOT.itemTypes.T9_MISC and LOOT.IsItemIDEquippableByWZ(var_30_1) and var_30_5 == "vehicleskin" then
			var_30_3 = LOOT.itemTypes.VEHICLE_CAMO
		end

		local var_30_6

		if var_30_3 == LOOT.itemTypes.S4_MISC then
			var_30_6 = LOOT.GetMiscTypeForID(var_30_1)
		end

		if var_30_4 and #var_30_4 > 0 then
			local var_30_7 = LOOT.GetItemQuality(var_30_3, var_30_4, var_30_1)
			local var_30_8 = LOOT.GetRarityColor(var_30_7)
			local var_30_9 = LOOT.GetDarkRarityColor(var_30_7)

			arg_30_0._previewsEnabled = arg_28_0._previewsEnabled
			arg_30_0.Card._previewsEnabled = arg_28_0._previewsEnabled

			arg_30_0.Card:SetHandleMouse(arg_28_0._previewsEnabled)
			arg_30_0.Card:SetFocusable(arg_28_0._previewsEnabled)

			arg_30_0._rarity = var_30_7

			arg_30_0.Card.RarityBG:SetRGBFromTable(var_30_9)
			arg_30_0.Card.Border:setImage(RegisterMaterial(LOOT.GetRarityBorder(var_30_7)))
			arg_30_0.Card:UpdateRarityImage(var_30_7)
			arg_30_0.Card.BlueprintIcon:SetRGBFromTable(var_30_8)
			arg_30_0.Card:UpdateOperatorMissionBorder(var_30_7)
			arg_30_0.Card:UpdateOperatorMissionBanner(arg_28_1, var_30_7, var_30_4)

			arg_30_0._lootType = var_30_3

			if var_30_7 >= LOOT.Rarity.LEGENDARY then
				ACTIONS.AnimateSequence(arg_30_0.Card, "GlintAnime")
			end

			if var_30_3 == LOOT.itemTypes.SPECIAL then
				ACTIONS.AnimateSequence(arg_30_0.Flare, "SpecialItemHighlight")
			end

			if Engine.FABABBDBA() and var_30_4 == "gesture049" then
				arg_30_0.Card._previewsEnabled = false

				arg_30_0.Card:SetFocusable(false)
				arg_30_0.Card:SetHandleMouse(false)
				ACTIONS.AnimateSequence(arg_30_0, "Disabled")
			end

			if var_30_3 == LOOT.itemTypes.WEAPON then
				if WEAPON.IsVariant(arg_28_1, var_30_1) then
					arg_30_0.Card.BlueprintIcon:SetAlpha(0.7)
				end

				if WEAPON.GetTracerType(var_30_1) then
					arg_30_0.Card:SetupTracer(arg_28_1, var_30_1)
				end
			end

			local var_30_10 = LOOT.GetItemImage(var_30_3, var_30_4, var_30_1)

			if var_30_3 == LOOT.itemTypes.TITLE then
				var_30_10 = "bp_playertitle_bg"
			end

			if var_30_10 and #var_30_10 > 0 then
				arg_30_0.Card.Foreground:setImage(RegisterMaterial(var_30_10))
				arg_30_0.Card:UpdateCardConfig(var_30_3, var_30_10, {
					miscType = var_30_6
				})
				arg_30_0.Card:UpdateWZCardConfig(var_30_1)
			else
				DebugPrint("Could not find image asset for type: " .. var_30_3 .. ", and ref: " .. var_30_4)
			end

			local var_30_11

			if var_30_4 == "battlepass" or var_30_4 == "t9_battlepass_purchase_s1" then
				var_30_11 = Engine.CBBHFCGDIC("BATTLEPASS/SEASON_X_BATTLEPASS", SEASON.GetLocalizedName())
			else
				var_30_11 = LOOT.GetItemName(var_30_3, var_30_4, var_30_1)
			end

			if var_30_11 and #var_30_11 > 0 then
				arg_30_0.Card.ItemName:setText(ToUpperCase(var_30_11))

				if var_30_3 == LOOT.itemTypes.TITLE then
					arg_30_0.Card.PlayerTitleName:setText(ToUpperCase(var_30_11))
				end
			else
				DebugPrint("Could not find item name for type: " .. var_30_3 .. ", and ref: " .. var_30_4)
			end

			local var_30_12 = LOOT.GetItemClassName(var_30_3, var_30_4, var_30_1)

			if var_30_12 and #var_30_12 > 0 then
				arg_30_0.Card.ItemType:setText(var_30_12)
			else
				DebugPrint("Could not find item class name for type: " .. var_30_3 .. ", and ref: " .. var_30_4)
			end

			var_30_2.id = var_30_1
			var_30_2.rarity = var_30_7
			var_30_2.type = var_30_3
			var_30_2.image = var_30_10
			var_30_2.name = var_30_11
			var_30_2.className = var_30_12
			var_30_2.bundleID = arg_28_2.bundleID
			var_30_2.positionInGrid = arg_28_2.bundleIndex
			var_30_2.isOwned = Loot.DEBEIFJEEG(arg_28_1, var_30_1) > 0

			if var_30_2.isOwned and not arg_30_0._alreadyOwned then
				if var_30_2.type ~= LOOT.itemTypes.SPECIAL and (var_30_2.type ~= LOOT.itemTypes.BATTLE_PASS or CONDITIONS.IsBattlePassEnabled()) then
					arg_30_0._alreadyOwned = true
					arg_28_0._alreadyOwnedCount = arg_28_0._alreadyOwnedCount + 1

					if var_30_2.type == LOOT.itemTypes.CONSUMABLE then
						arg_28_0._consumablesCount = arg_28_0._consumablesCount + 1
					end
				else
					var_30_2.isOwned = false
				end
			end

			if not arg_30_0._buttonHandlerAdded then
				arg_30_0.Card:addEventHandler("button_action", function(arg_31_0, arg_31_1)
					local var_31_0 = STORE.PreviewSupported(var_30_3)

					if arg_28_0._previewsEnabled then
						if var_31_0 then
							if arg_28_0._isFirstParty and Engine.CIEGIACHAE() then
								InGameStore.ShowStoreIcon(false)
							end

							STORE.PreviewItem(arg_28_1, var_30_3, var_30_1, arg_28_0._bundleID, arg_28_0._timerValue, false, false, arg_28_0.bundleData)
							QUARTERMASTER.RecordItemBrowseEvent(arg_28_1, true, arg_28_0._sourceMenu)
						else
							local var_31_1 = LUI.FlowManager.GetScopedData(arg_28_0)
							local var_31_2 = var_31_1.bundleExclusivity == LOOT.itemSourceExclusivity.CW_EXCLUSIVE or var_31_1.bundleExclusivity == LOOT.itemSourceExclusivity.CW_WZ
							local var_31_3 = Loot.DEBEIFJEEG(arg_28_1, var_30_1) > 0

							if var_31_2 and not var_31_3 then
								LUI.FlowManager.RequestPopupMenu(arg_28_0, "WZCWUpsellPopup", true, arg_28_1, false)
							end
						end
					end
				end)
				arg_30_0.Card:addEventHandler("button_over", function(arg_32_0, arg_32_1)
					if arg_28_0._previewsEnabled then
						if QUARTERMASTER.itemData then
							QUARTERMASTER.RecordItemBrowseEvent(arg_28_1, false, arg_28_0._sourceMenu)
						end

						QUARTERMASTER.BeginItemBrowseEvent(arg_28_1, var_30_2, arg_28_0._storeLayout, arg_28_0._recommendationData)
					end
				end)

				if arg_28_0._showDisclaimer == false and var_30_3 == LOOT.itemTypes.BATTLE_PASS then
					arg_28_0._totalTierSkips = arg_28_0._totalTierSkips + LOOT.GetBattlePassLootSkips(var_30_2.id)

					if arg_28_0._curBattlePassTier + arg_28_0._totalTierSkips > BATTLEPASS.GetMaxTier() then
						arg_28_0._showDisclaimer = true
					end
				end

				arg_30_0._buttonHandlerAdded = true
			end

			if arg_28_0._purchasedAnimation or arg_28_0._isOwned then
				ACTIONS.AnimateSequence(arg_28_0, "Purchased")
			elseif (arg_28_0._showDisclaimer or var_30_2.isOwned) and var_30_2.type ~= LOOT.itemTypes.CONSUMABLE then
				ACTIONS.AnimateSequence(arg_28_0, "TierDisclaimer")

				if arg_28_0._showDisclaimer and var_30_2.isOwned then
					arg_28_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_OWNED_DISCLAIMER", arg_28_0._alreadyOwnedCount))
				elseif arg_28_0._showDisclaimer then
					arg_28_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"))
				elseif var_30_2.isOwned then
					arg_28_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_OWNED_DISCLAIMER", arg_28_0._alreadyOwnedCount))
				end
			end
		end

		if arg_28_0._purchasedAnimation then
			ACTIONS.AnimateSequence(arg_30_0.Card, "HideAlreadyOwned")
			arg_30_0:SetAlpha(0)

			arg_30_0:Wait(var_0_1 * var_30_0).onComplete = function()
				if var_30_0 == 1 then
					Engine.BJDBIAGIDA(SOUND_SETS.storefront.cardFlipFirst)
				end

				Engine.BJDBIAGIDA(SOUND_SETS.storefront.cardFlipMiddle)

				if var_30_0 == #var_28_8 then
					Engine.BJDBIAGIDA(SOUND_SETS.storefront.cardFlipLast)
				end

				var_0_5(arg_28_0, arg_30_0, var_30_0 == #var_28_8)
			end
		elseif arg_28_0._isOwned then
			ACTIONS.AnimateSequence(arg_30_0.Card, "ShowPurchasedFrame")
			ACTIONS.AnimateSequence(arg_30_0.Card, "HideAlreadyOwned")

			if var_30_2.type == LOOT.itemTypes.BATTLE_PASS and CONDITIONS.IsBattlePassEnabled() then
				arg_30_0:SetAlpha(0.3)
				arg_30_0.Card.Border:SetAlpha(0)
				arg_30_0.Card.ItemType:setText(Engine.CBBHFCGDIC("BATTLEPASS/REDEEMED"))
			end
		elseif var_30_2.isOwned and var_30_2.type ~= LOOT.itemTypes.CONSUMABLE and (var_30_2.type ~= LOOT.itemTypes.BATTLE_PASS or CONDITIONS.IsBattlePassEnabled()) then
			ACTIONS.AnimateSequence(arg_30_0.Card, "ShowPurchasedFrame")
			ACTIONS.AnimateSequence(arg_30_0.Card, "ShowAlreadyOwned")
		end
	end

	local function var_28_10()
		local var_34_0 = arg_28_0.ItemsGrid:GetFocusPositionIndex() + 1
		local var_34_1 = tonumber(var_28_8[var_34_0])
		local var_34_2 = LOOT.GetTypeForID(var_34_1)

		if var_34_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
			arg_28_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				side = "left",
				button_ref = "button_primary"
			})

			arg_28_0._hasSelectPrompt = false
		elseif arg_28_0._hasSelectPrompt == false then
			arg_28_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
			})

			arg_28_0._hasSelectPrompt = true
		end

		local var_34_3 = LOOT.IsItemTypeQuickEquipable(var_34_2) and arg_28_0._isOwned and LOOT.IsItemIDEquippableByCurrentGameMode(var_34_1) and "ShowQuickEquip" or "HideQuickEquip"

		ACTIONS.AnimateSequence(arg_28_0, var_34_3)

		local var_34_4 = LOOT.quickEquipDesc[var_34_2]

		if var_34_4 then
			var_34_4 = Engine.CBBHFCGDIC(var_34_4)
		else
			var_34_4 = ""
		end

		arg_28_0.QuickEquipDesc:setText(var_34_4)
		var_28_6(arg_28_0)
	end

	arg_28_0.ItemsGrid:SetRefreshChild(var_28_9)
	arg_28_0.ItemsGrid:SetNumRows(#var_28_8 > 5 and 2 or 1)
	arg_28_0.ItemsGrid:SetNumColumns(#var_28_8 > 5 and 5 or #var_28_8)
	arg_28_0.ItemsGrid:SetNumChildren(math.min(#var_28_8, 10))
	arg_28_0.ItemsGrid:RefreshContent()

	arg_28_0.ItemsGrid._onNewTargetFocusPosition = var_28_10

	arg_28_0.PurchaseButton:addEventHandler("button_action", var_0_9(arg_28_0))
	arg_28_0.QuickEquipButton:addEventHandler("button_action", var_0_10)
	arg_28_0.QuickEquipButton:addAndCallEventHandler("update_input_type", function(arg_35_0, arg_35_1)
		local var_35_0 = LUI.IsLastInputKeyboardMouse(arg_28_1) and "MENU/QUICK_EQUIP_KBM" or "MENU/QUICK_EQUIP"

		arg_35_0.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(var_35_0)), 0)
	end)
	arg_28_0:addEventHandler("bundle_purchase_complete", function(arg_36_0, arg_36_1)
		arg_28_0.isQuickAccessShortcutsDisabled = true
		arg_28_0._previewsEnabled = false

		arg_36_0.ItemsGrid:RefreshContent()
		Engine.BJDBIAGIDA(SOUND_SETS.storefront.purchaseBundleComplete)
		Engine.DFCGFCGBFD("mp_store_bundle_purchase")
		ACTIONS.AnimateSequence(arg_36_0, "BundlePurchaseShow")

		local var_36_0 = Dvar.CFHDGABACF("QKKMRRLRR")
		local var_36_1 = var_36_0 == 5 or var_36_0 == 6

		if Engine.CGABICJHAI() and var_36_1 == true then
			ACTIONS.AnimateSequence(arg_28_0, "WideAspectRatioFrame")
		end

		var_0_2(arg_28_0)
	end)

	local function var_28_11()
		QUARTERMASTER.RecordPurchaseConfirmEvent(arg_28_1, var_28_5, true, false, var_28_1)

		arg_28_0._purchasedAnimation = arg_28_0.ItemsGrid:GetNumChildren() > 0

		if arg_28_0._isFirstParty then
			arg_28_0._isOwned = true
		else
			arg_28_0._isOwned = STORE.IsBundleOwned(arg_28_0._controllerIndex, arg_28_0._bundleID)
		end

		LUI.FlowManager.RequestLeaveMenuByName("LootPurchasingPopup", true)
		Engine.BJDBIAGIDA(SOUND_SETS.storefront.selectionConfirmed)

		arg_28_0:Wait(3000).onComplete = function()
			Engine.EBCGADABJ()
			ACTIONS.AnimateSequence(arg_28_0, "BundlePurchaseHide")
			arg_28_0.ItemsGrid:RefreshContent()
			arg_28_0.HelperBar:SetAlpha(1)
		end

		arg_28_0:RefreshAltAction(arg_28_0)
	end

	if arg_28_0._isFirstParty then
		arg_28_0:addEventHandler("exchanged_item", function(arg_39_0, arg_39_1)
			if not arg_39_1.fromSignIn then
				arg_39_0._firstPartyPurchaseSuccess = true
				var_28_2.firstPartyOwned = true

				return true
			end
		end)
		arg_28_0:addEventHandler("exchanged_item_failed", function(arg_40_0, arg_40_1)
			if not arg_40_1.fromSignIn then
				QUARTERMASTER.RecordPurchaseConfirmEvent(arg_28_1, var_28_5, false, true, var_28_1)

				arg_28_0._previewsEnabled = true

				var_0_2(arg_28_0)
			end
		end)
		arg_28_0:addEventHandler("ingamestore_purchased_product", function(arg_41_0, arg_41_1)
			if arg_41_1.transactionResult == STORE.TransactionResult.TRANSACTION_SUCCEEDED then
				arg_41_0._firstPartyPurchaseSuccess = true
				var_28_2.firstPartyOwned = true

				LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
			end
		end)
	else
		arg_28_0:addEventHandler("loot_item_transaction_complete", var_28_11)
		arg_28_0:addEventHandler("loot_item_transaction_error", function(arg_42_0, arg_42_1)
			if arg_42_1.errorCode == STORE.ProductNoLongerAvailableError then
				LUI.FlowManager.RequestPopupMenu(nil, "ProductNoLongerAvailableErrorPopup", true, arg_28_1, false)
			end

			QUARTERMASTER.RecordPurchaseConfirmEvent(arg_28_1, var_28_5, false, true, var_28_1)
			LUI.FlowManager.RequestLeaveMenuByName("LootPurchasingPopup", true)

			local var_42_0 = {
				cratePopupType = STORE.CratePopupType.PURCHASE_FAIL
			}

			LUI.FlowManager.RequestPopupMenu(nil, "popup_handle_lootcrate", true, arg_28_1, false, var_42_0)
			Engine.EBCGADABJ()
			ACTIONS.AnimateSequence(arg_28_0, "BundlePurchaseHide")

			arg_28_0._previewsEnabled = true

			arg_28_0.ItemsGrid:RefreshContent()
			arg_28_0.HelperBar:SetAlpha(1)
			var_0_2(arg_28_0)
		end)
	end

	arg_28_0:addEventHandler("restore_focus", function(arg_43_0, arg_43_1)
		if arg_28_0._isFirstParty then
			if Engine.CIEGIACHAE() then
				InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
			end

			if arg_28_0._firstPartyPurchaseSuccess and not var_28_2.hasPlayedPurchaseAnimation then
				arg_28_0._firstPartyPurchaseSuccess = nil

				arg_28_0:processEvent({
					name = "bundle_purchase_complete"
				})

				var_28_2.hasPlayedPurchaseAnimation = true

				var_28_11()
			end
		end
	end)
	arg_28_0:RefreshAltAction(arg_28_0)

	local function var_28_12(arg_44_0)
		assert(arg_44_0)

		local var_44_0 = {
			bundleGiftInfo = {
				currencyAmount = arg_28_0._currencyAmount,
				id = arg_28_0._bundleID,
				name = arg_28_0._itemName,
				titleImage = arg_28_0._itemImage
			},
			recipientXuidString = arg_44_0
		}

		LUI.FlowManager.RequestPopupMenu(nil, "GiftBundlePurchaseConfirmationPopup", true, arg_28_1, false, var_44_0)
	end

	if CONDITIONS.IsGiftingEnabled() then
		var_0_2(arg_28_0)
		arg_28_0.bindButton:registerEventHandler("button_alt2", function(arg_45_0, arg_45_1)
			if arg_28_0._isItemGiftable and arg_28_0._previewsEnabled then
				local function var_45_0()
					local var_46_0 = {
						controllerIndex = arg_28_1,
						bundleSKU = arg_28_0._bundleID,
						selectedGifteeCallback = var_28_12
					}
					local var_46_1 = MenuBuilder.BuildRegisteredType("GiftingFriendSelectPopup", var_46_0)

					LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_28_1, false, {
						flyInLeftNarrow = true,
						widget = var_46_1
					})
				end

				GIFT.StartFTUEFlow(arg_28_0, var_45_0)
			end
		end)
	elseif not arg_28_0._isFirstParty and CONDITIONS.AreCODPointsEnabled(arg_28_0) then
		arg_28_0.bindButton:registerEventHandler("button_alt2", var_0_12(arg_28_0))

		if arg_28_0.PlayerDetails.Wallet ~= nil then
			arg_28_0.PlayerDetails.Wallet.CoDPoints.Btn:SetAlpha(1)
		end
	end

	local var_28_13 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_28_0._bundleID, CSV.bundleIDs.cols.titleImage)

	if var_28_13 and #var_28_13 > 0 then
		arg_28_0.TitleImage:setImage(RegisterMaterial(var_28_13))
	else
		arg_28_0.TitleImage:SetAlpha(0)
	end

	local var_28_14 = BATTLEPASS.GetCurrentCPRewards(arg_28_1)
	local var_28_15 = STORE.GetBundleDescription(arg_28_0._bundleID, var_28_14 and var_28_14.totalCP or 0)

	if var_28_15 then
		arg_28_0.DescriptionText:setText(var_28_15)
	end

	local var_28_16 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_28_0._bundleID, CSV.bundleIDs.cols.name)

	if var_28_16 then
		local var_28_17 = Engine.DGAIDIEIAC()

		if not (var_28_17 == 0 or var_28_17 == 1) then
			arg_28_0.LocalizedTitle:setText(Engine.CBBHFCGDIC(var_28_16))
		end
	end

	if arg_28_0._isOwned then
		ACTIONS.AnimateSequence(arg_28_0, "Purchased")
		arg_28_0.PurchaseButton:SetButtonDisabled(true)
		arg_28_0.PurchaseButton:processEvent({
			name = "Purchased"
		})
		arg_28_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			side = "left",
			button_ref = "button_alt1"
		})
	elseif LUI.IsLastInputKeyboardMouse(arg_28_1) then
		arg_28_0.PurchaseButton:processEvent({
			name = "button_up"
		})
	else
		arg_28_0.PurchaseButton:processEvent({
			name = "button_over"
		})
	end

	arg_28_0:registerEventHandler("menu_close", function(arg_47_0, arg_47_1)
		LUI.FlowManager.RequestLeaveMenuByName("LootPurchasingPopup")

		if arg_28_0._bundleID == tonumber(BATTLEPASS.GetTierSkipGiftID()) then
			local var_47_0 = LUI.FlowManager.GetScopedData("MainMenu")

			if var_47_0.returnToMainMenu then
				var_47_0.returnToMainMenu = nil
			end
		end
	end)
	arg_28_0.bindButton:addEventHandler("button_secondary", function(arg_48_0, arg_48_1)
		if not arg_28_0._purchasedAnimation then
			if LUI.FlowManager.IsInStack("OperatorSelect") and arg_28_0._isOwned then
				local var_48_0 = LUI.FlowManager.GetScopedData("OperatorSelect")

				var_48_0.operatorData.useDefaultOperatorForFocus = true
				var_48_0.operatorData.useEquippedOperatorFocusIndex = false

				LUI.FlowManager.RequestRestoreMenu("OperatorSelect")
			else
				LUI.FlowManager.RequestLeaveMenu(arg_48_0)
			end
		end
	end)
	var_0_13(arg_28_0, var_28_8)
	ACTIONS.ScaleFullscreen(arg_28_0.Transition)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_28_0, arg_28_1, {
		addScreenDarkener = true,
		darkenerOpacity = 0.9
	})

	local function var_28_18()
		var_0_7(arg_28_0, arg_28_0.id, arg_28_0.PurchaseButton, arg_28_1, arg_28_2.startPurchaseImmediately)

		arg_28_2.startPurchaseImmediately = false
		var_28_2.startPurchaseImmediately = false
	end

	if arg_28_2.startPurchaseImmediately or var_28_2.startPurchaseImmediately then
		var_28_18()
	end

	if not arg_28_2.isQuickPurchasePopupInPreview then
		if arg_28_0.ItemsGrid then
			arg_28_0.ItemsGrid:FocusFirstItem()
		end

		arg_28_0:saveState()
	end

	arg_28_0:addEventHandler("restore_focus", function(arg_50_0, arg_50_1)
		if arg_28_2.startPurchaseImmediately or var_28_2.startPurchaseImmediately then
			var_28_18()
		elseif var_28_2.isQuickPurchasePopupInPreview then
			var_28_2.isQuickPurchasePopupInPreview = false

			var_0_6(arg_50_0, arg_50_1.controller)
		end
	end)

	if arg_28_0._timerValue and not CONDITIONS.IsStoreSalesBannerEnabled() then
		arg_28_0.LimitedTimeItem:SetupTimeLimit(nil, nil, arg_28_0._timerValue, true, true)
	else
		arg_28_0.LimitedTimeItem:SetAlpha(0)
	end

	local var_28_19 = LUI.FlowManager.GetScopedData("MainMenu")

	if var_28_19 and var_28_19.ShouldHandleGiftBundle then
		var_28_19.ShouldHandleGiftBundle = nil

		arg_28_0:processEvent({
			name = "bundle_purchase_complete"
		})
		var_28_11()
	end

	arg_28_0.PurchaseButton:SetDisableHoldToPurchase({
		controllerIndex = arg_28_1
	})

	if arg_28_2.openGiftingPopup then
		arg_28_0.bindButton:processEvent({
			name = "button_alt2"
		})
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_28_0, "WZSetup")
	end
end

function StoreBundlePreview(arg_51_0, arg_51_1)
	local var_51_0 = LUI.UIElement.new()

	var_51_0.id = "StoreBundlePreview"
	var_51_0._animationSets = var_51_0._animationSets or {}
	var_51_0._sequences = var_51_0._sequences or {}

	local var_51_1 = arg_51_1 and arg_51_1.controllerIndex

	if not var_51_1 and not Engine.DDJFBBJAIG() then
		var_51_1 = var_51_0:getRootController()
	end

	assert(var_51_1)

	var_51_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_51_1
	})
	var_51_0.HelperBar.id = "HelperBar"

	var_51_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_51_0.HelperBar:setPriority(10)
	var_51_0:addElement(var_51_0.HelperBar)

	local var_51_2 = var_51_0
	local var_51_3
	local var_51_4 = LUI.UIImage.new()

	var_51_4.id = "Background"

	var_51_4:setImage(RegisterMaterial("mw_store_billboard_preview_blur"), 0)
	var_51_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 170, _1080p * 922)
	var_51_0:addElement(var_51_4)

	var_51_0.Background = var_51_4

	local var_51_5
	local var_51_6 = LUI.UIStyledText.new()

	var_51_6.id = "DescriptionText"

	var_51_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_51_6:setText("", 0)
	var_51_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_51_6:SetAlignment(LUI.Alignment.Left)
	var_51_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_51_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_51_6:SetStartupDelay(2000)
	var_51_6:SetLineHoldTime(400)
	var_51_6:SetAnimMoveTime(2000)
	var_51_6:SetAnimMoveSpeed(150)
	var_51_6:SetEndDelay(2000)
	var_51_6:SetCrossfadeTime(250)
	var_51_6:SetFadeInTime(300)
	var_51_6:SetFadeOutTime(300)
	var_51_6:SetMaxVisibleLines(4)
	var_51_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 631, _1080p * 655)
	var_51_0:addElement(var_51_6)

	var_51_0.DescriptionText = var_51_6

	local var_51_7
	local var_51_8 = LUI.UIStyledText.new()

	var_51_8.id = "EquippabilityText"

	var_51_8:SetRGBFromTable(SWATCHES.CH2.NeutralGray, 0)
	var_51_8:setText("", 0)
	var_51_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_51_8:SetAlignment(LUI.Alignment.Left)
	var_51_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_51_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_51_8:SetStartupDelay(2000)
	var_51_8:SetLineHoldTime(400)
	var_51_8:SetAnimMoveTime(2000)
	var_51_8:SetAnimMoveSpeed(150)
	var_51_8:SetEndDelay(2000)
	var_51_8:SetCrossfadeTime(250)
	var_51_8:SetFadeInTime(300)
	var_51_8:SetFadeOutTime(300)
	var_51_8:SetMaxVisibleLines(4)
	var_51_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 571, _1080p * 591)
	var_51_0:addElement(var_51_8)

	var_51_0.EquippabilityText = var_51_8

	local var_51_9

	if CONDITIONS.InFrontend() then
		local var_51_10 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_51_1
		})

		var_51_10.id = "LobbyMembersFooter"

		var_51_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_51_0:addElement(var_51_10)

		var_51_0.LobbyMembersFooter = var_51_10
	end

	local var_51_11
	local var_51_12 = {
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
		controllerIndex = var_51_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LootItemCardWrapper", {
				controllerIndex = var_51_1
			})
		end,
		refreshChild = function(arg_53_0, arg_53_1, arg_53_2)
			return
		end,
		spacingX = _1080p * 30,
		spacingY = _1080p * 30,
		columnWidth = _1080p * 210,
		rowHeight = _1080p * 310,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_51_13 = LUI.UIGrid.new(var_51_12)

	var_51_13.id = "ItemsGrid"

	var_51_13:setUseStencil(false)
	var_51_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1266, _1080p * -96, _1080p * 215, _1080p * 865)
	var_51_0:addElement(var_51_13)

	var_51_0.ItemsGrid = var_51_13

	local var_51_14
	local var_51_15 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_51_1
	})

	var_51_15.id = "QuickEquipButton"

	var_51_15:SetAlpha(0, 0)
	var_51_15.Text:SetLeft(_1080p * 20, 0)
	var_51_15.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/QUICK_EQUIP")), 0)
	var_51_15.Text:SetAlignment(LUI.Alignment.Left)
	var_51_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 496, _1080p * 774, _1080p * 840)
	var_51_0:addElement(var_51_15)

	var_51_0.QuickEquipButton = var_51_15

	local var_51_16
	local var_51_17 = MenuBuilder.BuildRegisteredType("PurchaseBundleButton", {
		controllerIndex = var_51_1
	})

	var_51_17.id = "PurchaseButton"

	var_51_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 496, _1080p * 745, _1080p * 865)
	var_51_0:addElement(var_51_17)

	var_51_0.PurchaseButton = var_51_17

	local var_51_18
	local var_51_19 = LUI.UIStyledText.new()

	var_51_19.id = "QuickEquipDesc"

	var_51_19:SetRGBFromTable(SWATCHES.CH2.NeutralGray, 0)
	var_51_19:setText("", 0)
	var_51_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_51_19:SetAlignment(LUI.Alignment.Left)
	var_51_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 600, _1080p * 868, _1080p * 892)
	var_51_0:addElement(var_51_19)

	var_51_0.QuickEquipDesc = var_51_19

	local var_51_20
	local var_51_21 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_51_1
	})

	var_51_21.id = "PlayerDetails"

	var_51_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_51_0:addElement(var_51_21)

	var_51_0.PlayerDetails = var_51_21

	local var_51_22
	local var_51_23 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_51_1
	})

	var_51_23.id = "MenuTitle"

	var_51_23.MenuTitle:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_PREVIEW"), 0)
	var_51_23.Line:SetLeft(0, 0)
	var_51_23:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_51_0:addElement(var_51_23)

	var_51_0.MenuTitle = var_51_23

	local var_51_24
	local var_51_25 = LUI.UIImage.new()

	var_51_25.id = "TitleImage"

	var_51_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 240, _1080p * 496)
	var_51_0:addElement(var_51_25)

	var_51_0.TitleImage = var_51_25

	local var_51_26
	local var_51_27 = LUI.UIStyledText.new()

	var_51_27.id = "LocalizedTitle"

	var_51_27:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_51_27:setText("", 0)
	var_51_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_51_27:SetWordWrap(false)
	var_51_27:SetAlignment(LUI.Alignment.Left)
	var_51_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_51_27:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_51_27:SetStartupDelay(2000)
	var_51_27:SetLineHoldTime(400)
	var_51_27:SetAnimMoveTime(2000)
	var_51_27:SetAnimMoveSpeed(150)
	var_51_27:SetEndDelay(2000)
	var_51_27:SetCrossfadeTime(250)
	var_51_27:SetFadeInTime(300)
	var_51_27:SetFadeOutTime(300)
	var_51_27:SetMaxVisibleLines(1)
	var_51_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 498, _1080p * 528)
	var_51_0:addElement(var_51_27)

	var_51_0.LocalizedTitle = var_51_27

	local var_51_28
	local var_51_29 = LUI.UIStyledText.new()

	var_51_29.id = "Disclaimer"

	var_51_29:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_51_29:SetAlpha(0, 0)
	var_51_29:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"), 0)
	var_51_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_51_29:SetAlignment(LUI.Alignment.Left)
	var_51_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 496, _1080p * 845, _1080p * 863)
	var_51_0:addElement(var_51_29)

	var_51_0.Disclaimer = var_51_29

	local var_51_30
	local var_51_31 = LUI.UIImage.new()

	var_51_31.id = "Lock"

	var_51_31:SetAlpha(0, 0)
	var_51_31:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_51_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 128, _1080p * 838, _1080p * 870)
	var_51_0:addElement(var_51_31)

	var_51_0.Lock = var_51_31

	local var_51_32
	local var_51_33 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_51_1
	})

	var_51_33.id = "LimitedTimeItem"

	var_51_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 396, _1080p * 185, _1080p * 215)
	var_51_0:addElement(var_51_33)

	var_51_0.LimitedTimeItem = var_51_33

	local var_51_34
	local var_51_35 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_51_1
	})

	var_51_35.id = "SaleBanner"

	var_51_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 395, _1080p * 496, _1080p * 870, _1080p * 900)
	var_51_0:addElement(var_51_35)

	var_51_0.SaleBanner = var_51_35

	local var_51_36
	local var_51_37 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_51_1
	})

	var_51_37.id = "SnipeIcon"

	var_51_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 496, _1080p * 530, _1080p * 571)
	var_51_0:addElement(var_51_37)

	var_51_0.SnipeIcon = var_51_37

	local var_51_38
	local var_51_39 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_51_1
	})

	var_51_39.id = "Cinematic"

	var_51_39:SetAlpha(0, 0)
	var_51_0:addElement(var_51_39)

	var_51_0.Cinematic = var_51_39

	local var_51_40
	local var_51_41 = LUI.UIImage.new()

	var_51_41.id = "VignetteRight"

	var_51_41:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_51_41:SetAlpha(0, 0)
	var_51_41:setImage(RegisterMaterial("gradient_curve"), 0)
	var_51_41:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
	var_51_0:addElement(var_51_41)

	var_51_0.VignetteRight = var_51_41

	local var_51_42
	local var_51_43 = LUI.UIImage.new()

	var_51_43.id = "VignetteLeft"

	var_51_43:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_51_43:SetAlpha(0, 0)
	var_51_43:SetYRotation(180, 0)
	var_51_43:setImage(RegisterMaterial("gradient_curve"), 0)
	var_51_43:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
	var_51_0:addElement(var_51_43)

	var_51_0.VignetteLeft = var_51_43

	local var_51_44
	local var_51_45 = LUI.UIStyledText.new()

	var_51_45.id = "PurchasedMessage"

	var_51_45:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_51_45:SetAlpha(0, 0)
	var_51_45:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_PURCHASED")), 0)
	var_51_45:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_51_45:SetAlignment(LUI.Alignment.Center)
	var_51_45:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -35, _1080p * 35)
	var_51_0:addElement(var_51_45)

	var_51_0.PurchasedMessage = var_51_45

	local var_51_46
	local var_51_47 = LUI.UIImage.new()

	var_51_47.id = "Transition"

	var_51_47:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_51_47:SetAlpha(0, 0)
	var_51_0:addElement(var_51_47)

	var_51_0.Transition = var_51_47

	local var_51_48
	local var_51_49 = {
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

	var_51_13:RegisterAnimationSequence("DefaultSequence", var_51_49)

	local var_51_50 = {
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

	var_51_47:RegisterAnimationSequence("DefaultSequence", var_51_50)

	local function var_51_51()
		var_51_13:AnimateSequence("DefaultSequence")
		var_51_47:AnimateSequence("DefaultSequence")
	end

	var_51_0._sequences.DefaultSequence = var_51_51

	local var_51_52
	local var_51_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_39:RegisterAnimationSequence("BundlePurchaseShow", var_51_53)

	local var_51_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_45:RegisterAnimationSequence("BundlePurchaseShow", var_51_54)

	local function var_51_55()
		var_51_39:AnimateSequence("BundlePurchaseShow")
		var_51_45:AnimateSequence("BundlePurchaseShow")
	end

	var_51_0._sequences.BundlePurchaseShow = var_51_55

	local var_51_56
	local var_51_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_39:RegisterAnimationSequence("BundlePurchaseHide", var_51_57)

	local var_51_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_41:RegisterAnimationSequence("BundlePurchaseHide", var_51_58)

	local var_51_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_43:RegisterAnimationSequence("BundlePurchaseHide", var_51_59)

	local var_51_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_45:RegisterAnimationSequence("BundlePurchaseHide", var_51_60)

	local function var_51_61()
		var_51_39:AnimateSequence("BundlePurchaseHide")
		var_51_41:AnimateSequence("BundlePurchaseHide")
		var_51_43:AnimateSequence("BundlePurchaseHide")
		var_51_45:AnimateSequence("BundlePurchaseHide")
	end

	var_51_0._sequences.BundlePurchaseHide = var_51_61

	local var_51_62
	local var_51_63 = {
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
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 959
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 977
		}
	}

	var_51_29:RegisterAnimationSequence("TierDisclaimer", var_51_63)

	local var_51_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_31:RegisterAnimationSequence("TierDisclaimer", var_51_64)

	local function var_51_65()
		var_51_29:AnimateSequence("TierDisclaimer")
		var_51_31:AnimateSequence("TierDisclaimer")
	end

	var_51_0._sequences.TierDisclaimer = var_51_65

	local var_51_66
	local var_51_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_19:RegisterAnimationSequence("Purchased", var_51_67)

	local var_51_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/BUNDLE_ADDED_TO_INVENTORY")
		}
	}

	var_51_29:RegisterAnimationSequence("Purchased", var_51_68)

	local var_51_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_31:RegisterAnimationSequence("Purchased", var_51_69)

	local function var_51_70()
		var_51_19:AnimateSequence("Purchased")
		var_51_29:AnimateSequence("Purchased")
		var_51_31:AnimateSequence("Purchased")
	end

	var_51_0._sequences.Purchased = var_51_70

	local var_51_71
	local var_51_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_41:RegisterAnimationSequence("WideAspectRatioFrame", var_51_72)

	local var_51_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_43:RegisterAnimationSequence("WideAspectRatioFrame", var_51_73)

	local function var_51_74()
		var_51_41:AnimateSequence("WideAspectRatioFrame")
		var_51_43:AnimateSequence("WideAspectRatioFrame")
	end

	var_51_0._sequences.WideAspectRatioFrame = var_51_74

	local var_51_75
	local var_51_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 631
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 655
		}
	}

	var_51_6:RegisterAnimationSequence("Setup", var_51_76)

	local var_51_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 571
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 591
		}
	}

	var_51_8:RegisterAnimationSequence("Setup", var_51_77)

	local var_51_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 772
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 838
		}
	}

	var_51_15:RegisterAnimationSequence("Setup", var_51_78)

	local var_51_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 745
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 865
		}
	}

	var_51_17:RegisterAnimationSequence("Setup", var_51_79)

	local var_51_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 868
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 892
		}
	}

	var_51_19:RegisterAnimationSequence("Setup", var_51_80)

	local var_51_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 959
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 977
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 496
		}
	}

	var_51_29:RegisterAnimationSequence("Setup", var_51_81)

	local var_51_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 952
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 984
		}
	}

	var_51_31:RegisterAnimationSequence("Setup", var_51_82)

	local function var_51_83()
		var_51_6:AnimateSequence("Setup")
		var_51_8:AnimateSequence("Setup")
		var_51_15:AnimateSequence("Setup")
		var_51_17:AnimateSequence("Setup")
		var_51_19:AnimateSequence("Setup")
		var_51_29:AnimateSequence("Setup")
		var_51_31:AnimateSequence("Setup")
	end

	var_51_0._sequences.Setup = var_51_83

	local var_51_84
	local var_51_85 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_15:RegisterAnimationSequence("ShowQuickEquip", var_51_85)

	local var_51_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_17:RegisterAnimationSequence("ShowQuickEquip", var_51_86)

	local var_51_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 841
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 600
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 865
		}
	}

	var_51_19:RegisterAnimationSequence("ShowQuickEquip", var_51_87)

	local function var_51_88()
		var_51_15:AnimateSequence("ShowQuickEquip")
		var_51_17:AnimateSequence("ShowQuickEquip")
		var_51_19:AnimateSequence("ShowQuickEquip")
	end

	var_51_0._sequences.ShowQuickEquip = var_51_88

	local var_51_89
	local var_51_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_15:RegisterAnimationSequence("HideQuickEquip", var_51_90)

	local var_51_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_17:RegisterAnimationSequence("HideQuickEquip", var_51_91)

	local var_51_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_51_19:RegisterAnimationSequence("HideQuickEquip", var_51_92)

	local function var_51_93()
		var_51_15:AnimateSequence("HideQuickEquip")
		var_51_17:AnimateSequence("HideQuickEquip")
		var_51_19:AnimateSequence("HideQuickEquip")
	end

	var_51_0._sequences.HideQuickEquip = var_51_93

	local var_51_94
	local var_51_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("wz_store_billboard_preview_blur")
		}
	}

	var_51_4:RegisterAnimationSequence("WZSetup", var_51_95)

	local var_51_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_51_6:RegisterAnimationSequence("WZSetup", var_51_96)

	local var_51_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_51_8:RegisterAnimationSequence("WZSetup", var_51_97)

	local var_51_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 903
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 927
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_51_19:RegisterAnimationSequence("WZSetup", var_51_98)

	local var_51_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_51_27:RegisterAnimationSequence("WZSetup", var_51_99)

	local function var_51_100()
		var_51_4:AnimateSequence("WZSetup")
		var_51_6:AnimateSequence("WZSetup")
		var_51_8:AnimateSequence("WZSetup")
		var_51_19:AnimateSequence("WZSetup")
		var_51_27:AnimateSequence("WZSetup")
	end

	var_51_0._sequences.WZSetup = var_51_100

	var_51_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_51_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_51_101 = LUI.UIBindButton.new()

	var_51_101.id = "selfBindButton"

	var_51_0:addElement(var_51_101)

	var_51_0.bindButton = var_51_101

	var_0_15(var_51_0, var_51_1, arg_51_1)
	ACTIONS.AnimateSequence(var_51_0, "DefaultSequence")

	return var_51_0
end

MenuBuilder.registerType("StoreBundlePreview", StoreBundlePreview)
LUI.FlowManager.RegisterStackPopBehaviour("StoreBundlePreview", var_0_14)
LockTable(_M)
