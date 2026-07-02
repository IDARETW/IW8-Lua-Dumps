module(..., package.seeall)

local var_0_0 = _1080p * 10

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = {
		LOOT.itemTypes.OPERATOR,
		LOOT.itemTypes.OPERATOR_SKIN,
		LOOT.itemTypes.WEAPON,
		LOOT.itemTypes.WATCH,
		LOOT.itemTypes.CHARM
	}
	local var_1_1 = (function(arg_2_0)
		local var_2_0 = {}

		for iter_2_0, iter_2_1 in pairs(arg_2_0) do
			var_2_0[iter_2_1] = iter_2_0
		end

		return var_2_0
	end)(var_1_0)
	local var_1_2 = LOOT.GetItemsInBundle(arg_1_1.id)
	local var_1_3 = {}

	for iter_1_0, iter_1_1 in pairs(var_1_2) do
		local var_1_4 = LOOT.GetTypeForID(iter_1_1)
		local var_1_5 = LOOT.GetItemRef(var_1_4, iter_1_1)

		if var_1_5 and #var_1_5 > 0 then
			local var_1_6 = LOOT.GetItemQuality(var_1_4, var_1_5, iter_1_1)

			table.insert(var_1_3, {
				itemID = iter_1_1,
				ref = var_1_5,
				type = var_1_4,
				rarity = var_1_6
			})
		end
	end

	table.sort(var_1_3, function(arg_3_0, arg_3_1)
		local var_3_0 = var_1_1[arg_3_0.type]
		local var_3_1 = var_1_1[arg_3_1.type]

		if not var_3_0 and var_3_1 then
			return false
		end

		if var_3_0 and not var_3_1 then
			return true
		end

		if not var_3_0 and not var_3_1 then
			return arg_3_0.rarity > arg_3_1.rarity
		end

		if var_3_0 == var_3_1 then
			return arg_3_0.rarity > arg_3_1.rarity
		else
			return var_3_0 < var_3_1
		end
	end)

	local var_1_7 = {}
	local var_1_8
	local var_1_9 = 0

	for iter_1_2 = 1, #var_1_3 do
		if var_1_8 ~= var_1_3[iter_1_2].type then
			var_1_8 = var_1_3[iter_1_2].type
			var_1_9 = var_1_9 + 1
			var_1_7[var_1_9] = {}
		end

		table.insert(var_1_7[var_1_9], var_1_3[iter_1_2])
	end

	for iter_1_3 = 1, #var_1_7 do
		var_1_7[iter_1_3][1].sameRarityCount = 1

		for iter_1_4 = 1, #var_1_7[iter_1_3] do
			if var_1_7[iter_1_3][iter_1_4 + 1] and var_1_7[iter_1_3][1].rarity == var_1_7[iter_1_3][iter_1_4 + 1].rarity then
				var_1_7[iter_1_3][1].sameRarityCount = var_1_7[iter_1_3][1].sameRarityCount + 1
			end
		end
	end

	local var_1_10 = _1080p * 130
	local var_1_11 = _1080p * 10
	local var_1_12 = 0
	local var_1_13 = 0

	if #var_1_7 > 0 then
		arg_1_0.BundleItemDesc1.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(var_1_7[1][1].rarity)))
		LOOT.ApplyRarityIconColoring(arg_1_0.BundleItemDesc1.RarityIcon, var_1_7[1][1].rarity)

		local var_1_14 = arg_1_0.BundleItemDesc1:SetText(Engine.CBBHFCGDIC(LOOT.typeNameStrings[var_1_7[1][1].type], var_1_7[1][1].sameRarityCount))

		arg_1_0.BundleItemDesc1:SetAlpha(1)

		local var_1_15 = false

		if #var_1_7 > 1 then
			arg_1_0.BundleItemDesc2.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(var_1_7[2][1].rarity)))
			LOOT.ApplyRarityIconColoring(arg_1_0.BundleItemDesc2.RarityIcon, var_1_7[2][1].rarity)

			var_1_13 = arg_1_0.BundleItemDesc2:SetText(Engine.CBBHFCGDIC(LOOT.typeNameStrings[var_1_7[2][1].type], var_1_7[2][1].sameRarityCount))

			arg_1_0.BundleItemDesc2:SetAlpha(1)

			var_1_15 = true
		elseif #var_1_7[1] > 1 then
			local var_1_16 = -1

			for iter_1_5 = 1, #var_1_7[1] do
				if var_1_7[1][iter_1_5 + 1] and var_1_7[1][1].rarity ~= var_1_7[1][iter_1_5 + 1].rarity then
					var_1_16 = iter_1_5 + 1
				end
			end

			if var_1_16 == -1 then
				arg_1_0.BundleItemDesc2:SetAlpha(0)
			else
				local var_1_17 = 1

				for iter_1_6 = var_1_16, #var_1_7[1] do
					if var_1_7[1][iter_1_6 + 1] and var_1_7[1][var_1_16].rarity == var_1_7[1][iter_1_6 + 1].rarity then
						var_1_17 = var_1_17 + 1
					end
				end

				arg_1_0.BundleItemDesc2.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(var_1_7[1][var_1_16].rarity)))
				LOOT.ApplyRarityIconColoring(arg_1_0.BundleItemDesc2.RarityIcon, var_1_7[1][var_1_16].rarity)

				var_1_13 = arg_1_0.BundleItemDesc2:SetText(Engine.CBBHFCGDIC(LOOT.typeNameStrings[var_1_7[1][var_1_16].type], var_1_17))

				arg_1_0.BundleItemDesc2:SetAlpha(1)

				var_1_15 = true
			end
		else
			arg_1_0.BundleItemDesc2:SetAlpha(0)
		end

		local var_1_18 = var_1_10 + var_1_14

		arg_1_0.BundleItemDesc1:SetLeft(var_1_10, 1)
		arg_1_0.BundleItemDesc1:SetRight(var_1_18, 1)

		if var_1_15 then
			local var_1_19 = var_1_18 + var_1_11
			local var_1_20 = var_1_19 + var_1_13

			arg_1_0.BundleItemDesc2:SetLeft(var_1_19, 1)
			arg_1_0.BundleItemDesc2:SetRight(var_1_20, 1)
		end
	else
		arg_1_0.BundleItemDesc1:SetAlpha(0)
		arg_1_0.BundleItemDesc2:SetAlpha(0)
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_1)

	local var_4_0 = Dvar.CFHDGABACF("MSQLPRTQRL")

	if var_4_0 ~= nil and var_4_0 > 0 then
		local var_4_1 = arg_4_1.productId
		local var_4_2 = Engine.CEAEFCAGJG()

		if Dvar.CFHDGABACF("ui_cortez_preorder_state_force_japan") == 1 then
			var_4_2 = AssetRegion.Japan
		end

		local var_4_3 = CONDITIONS.IsPC()
		local var_4_4 = CONDITIONS.IsSony()
		local var_4_5 = CONDITIONS.IsXbox()

		if Dvar.CFHDGABACF("ui_cortez_preorder_state_force_ps") == 1 then
			var_4_3 = false
			var_4_4 = true
			var_4_5 = false
		end

		if Dvar.CFHDGABACF("ui_cortez_preorder_state_force_xbox") == 1 then
			var_4_3 = false
			var_4_4 = false
			var_4_5 = true
		end

		local var_4_6

		if var_4_0 == 1 or var_4_0 == 2 or var_4_0 == 3 then
			if var_4_2 == AssetRegion.Japan then
				if var_4_1 == STORE.CortezStandardID and var_4_3 then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_STANDARD_DESC_JAPAN_ONLY_CHANGE_01"
				elseif var_4_1 == STORE.CortezAltID and (var_4_4 or var_4_5) then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_CROSS_GEN_DESC_CONSOLES_JAPAN_ONLY_CHANGE_01"
				elseif var_4_1 == STORE.CortezVaultID then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_VAULT_DESC_JAPAN_ONLY_CHANGE_01"
				end
			elseif var_4_1 == STORE.CortezStandardID and var_4_3 then
				var_4_6 = "INGAMESTORE_WZ350/CORTEZ_STANDARD_DESC_CHANGE_01"
			elseif var_4_1 == STORE.CortezAltID then
				if var_4_4 then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_CROSS_GEN_DESC_SONY_CHANGE_01"
				elseif var_4_5 then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_CROSS_GEN_DESC_XBOX_CHANGE_01"
				end
			elseif var_4_1 == STORE.CortezVaultID then
				if var_4_4 then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_VAULT_DESC_SONY_CHANGE_01"
				elseif var_4_5 then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_VAULT_DESC_XBOX_CHANGE_01"
				elseif var_4_3 then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_VAULT_DESC_PC_CHANGE_01"
				end
			end
		end

		if var_4_0 == 2 then
			if var_4_1 == STORE.CortezAltID and var_4_4 then
				var_4_6 = "INGAMESTORE_WZ350/CORTEZ_CROSS_GEN_DESC_CHANGE_02"
			elseif var_4_1 == STORE.CortezVaultID and var_4_4 then
				var_4_6 = "INGAMESTORE_WZ350/CORTEZ_VAULT_DESC_CHANGE_02"
			end
		end

		if var_4_0 == 3 then
			if var_4_1 == STORE.CortezStandardID and var_4_3 then
				var_4_6 = "INGAMESTORE_WZ350/CORTEZ_STANDARD_DESC_CHANGE_02"
			elseif var_4_1 == STORE.CortezAltID and (var_4_4 or var_4_5) then
				var_4_6 = "INGAMESTORE_WZ350/CORTEZ_CROSS_GEN_DESC_CHANGE_02"
			elseif var_4_1 == STORE.CortezVaultID then
				if var_4_4 or var_4_5 then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_VAULT_DESC_CHANGE_02"
				elseif var_4_3 then
					var_4_6 = "INGAMESTORE_WZ350/CORTEZ_VAULT_DESC_PC_CHANGE_02"
				end
			end
		end

		if var_4_0 == 4 then
			if var_4_1 == STORE.CortezStandardID and var_4_3 then
				var_4_6 = "INGAMESTORE_WZ355/CORTEZ_PC_DESC_CHANGE_03"
			elseif var_4_1 == STORE.CortezAltID and (var_4_4 or var_4_5) then
				var_4_6 = "INGAMESTORE_WZ355/CORTEZ_CONSOLES_DESC_CHANGE_03"
			elseif var_4_1 == STORE.CortezVaultID then
				if var_4_4 or var_4_5 then
					var_4_6 = "INGAMESTORE_WZ355/CORTEZ_CONSOLES_DESC_CHANGE_03"
				elseif var_4_3 then
					var_4_6 = "INGAMESTORE_WZ355/CORTEZ_PC_DESC_CHANGE_03"
				end
			end
		elseif var_4_0 == 5 then
			if var_4_1 == STORE.CortezStandardID or var_4_1 == STORE.CortezAltID then
				var_4_6 = "INGAMESTORE_WZ355/CORTEZ_STANDARD_AND_CROSS_GEN_DESC_CHANGE_04"
			elseif var_4_1 == STORE.CortezVaultID then
				var_4_6 = "INGAMESTORE_WZ355/CORTEZ_VAULT_DESC_CHANGE_04"
			end
		end

		if var_4_6 then
			if arg_4_1.description then
				arg_4_1.description = Engine.CBBHFCGDIC(var_4_6)
			end

			if arg_4_1.contentLong then
				arg_4_1.contentLong = Engine.CBBHFCGDIC(var_4_6)
			end
		end
	end

	if arg_4_1.description and not arg_4_1.emptyCategory then
		arg_4_0.Description:setText(arg_4_1.description)
		arg_4_0.Description:SetAlpha(1)
	elseif arg_4_2 and arg_4_1.contentLong then
		arg_4_0.Description:setText(arg_4_1.contentLong)
		arg_4_0.Description:SetAlpha(1)
	else
		arg_4_0.Description:SetAlpha(0)
	end

	if arg_4_1.asset and #arg_4_1.asset > 0 then
		local var_4_7 = RegisterMaterial(arg_4_1.asset)

		if var_4_7 then
			arg_4_0.Image:SetAlpha(1)
			arg_4_0.Image:setImage(var_4_7)
		end
	else
		assert(false, "Missing Image Asset for Item ID " .. arg_4_1.id)
		arg_4_0.Image:SetAlpha(0)
	end

	if arg_4_1.titleImage and #arg_4_1.titleImage > 0 then
		local var_4_8 = RegisterMaterial(arg_4_1.titleImage)

		if var_4_8 then
			arg_4_0.TitleImage:SetAlpha(1)
			arg_4_0.TitleImage:setImage(var_4_8)
		else
			arg_4_0.TitleImage:SetAlpha(0)
		end
	else
		arg_4_0.TitleImage:SetAlpha(0)
	end

	local var_4_9 = arg_4_1.name

	if var_4_9 then
		local var_4_10 = Engine.DGAIDIEIAC()

		if not (var_4_10 == 0 or var_4_10 == 1) and not arg_4_2 then
			if arg_4_1.usesFirstPartyStore or arg_4_1.emptyCategory then
				arg_4_0.LocalizedTitle:SetAlpha(0)
			else
				local var_4_11 = STORE.GetBundleFeatureText(arg_4_1.id)

				arg_4_0.LocalizedTitle:SetAlpha(1)

				if var_4_11 ~= "" then
					arg_4_0.LocalizedTitle:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_HAS_FEATURE_TEXT", Engine.CBBHFCGDIC(var_4_9), Engine.CBBHFCGDIC(var_4_11)))
				else
					arg_4_0.LocalizedTitle:setText(Engine.CBBHFCGDIC(var_4_9))
				end
			end
		else
			arg_4_0.LocalizedTitle:SetAlpha(0)
		end
	end

	if CONDITIONS.IsStoreBundlePreviewListEnabled(arg_4_0) then
		if not arg_4_1.emptyCategory and not arg_4_2 then
			arg_4_0.BundlePreviewList:SetupBundlePreview(arg_4_1)
			ACTIONS.AnimateSequence(arg_4_0, "ShowBundlePreview")
		else
			arg_4_0.BundlePreviewList:RemoveTimers()
			ACTIONS.AnimateSequence(arg_4_0, "HideBundlePreview")
		end
	elseif not arg_4_1.emptyCategory and not arg_4_2 then
		var_0_1(arg_4_0, arg_4_1)
	else
		arg_4_0.BundleItemDesc1:SetAlpha(0)
		arg_4_0.BundleItemDesc2:SetAlpha(0)
	end

	if arg_4_1.purchaseEnd then
		local var_4_12 = tonumber(arg_4_1.purchaseEnd)

		if var_4_12 then
			local var_4_13 = Engine.DEIDGHDBHD()
			local var_4_14 = var_4_13 < var_4_12 and var_4_12 - var_4_13 or 0
			local var_4_15 = false
			local var_4_16 = false

			if var_4_14 == 0 then
				var_4_15 = true
			else
				var_4_16 = true
			end

			arg_4_0.MPStoreBillboardLimitedTimeBanner:SetTimer(var_4_12, {
				isExpired = var_4_15,
				isLimitedTimeOffer = var_4_16
			})
			ACTIONS.AnimateSequence(arg_4_0, "ShowLimitedTime")
		end
	else
		ACTIONS.AnimateSequence(arg_4_0, "HideLimitedTime")
	end

	local var_4_17 = 0
	local var_4_18 = _1080p * 330

	if arg_4_1.usesFirstPartyStore or arg_4_1.firstPartyProductID or arg_4_1.emptyCategory or not arg_4_1.currencyID or not arg_4_1.currencyAmount or arg_4_2 then
		if Dvar.IBEGCHEFE("LSNMMPRLQT") == true then
			if arg_4_1.firstPartyProductID and STORE.IsCatalogReady(arg_4_0._controllerIndex) then
				local var_4_19 = STORE.GetFirstPartyBundleData(arg_4_0._controllerIndex, arg_4_1.id, arg_4_1.firstPartyProductID)

				if var_4_19 and var_4_19.price then
					ACTIONS.AnimateSequence(arg_4_0.Price, "Price")
					arg_4_0.Price.Amount:setText(Engine.JCBDICCAH(var_4_19.price))

					if STORE.IsVanguardProduct(arg_4_1.firstPartyProductID) or STORE.IsCortezProduct(arg_4_1.firstPartyProductID) then
						ACTIONS.AnimateSequence(arg_4_0, "ShowPrice")
						arg_4_0.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_WITH_PROMPT"))
						arg_4_0.Price:SetRight(var_4_18, 1)
					end
				else
					arg_4_0.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_WITH_PROMPT"))
					ACTIONS.AnimateSequence(arg_4_0, "HidePriceKeepPrompt")
				end
			else
				arg_4_0.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_WITH_PROMPT"))
				ACTIONS.AnimateSequence(arg_4_0, "HidePriceKeepPrompt")
			end
		else
			arg_4_0.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_WITH_PROMPT"))
			ACTIONS.AnimateSequence(arg_4_0, "HidePriceKeepPrompt")
		end
	else
		if arg_4_1.currencyID == LOOT.CurrencyIDs.COD_POINTS then
			arg_4_0.Price.Currency:setImage(RegisterMaterial("icon_currency_codpoints"))
		elseif arg_4_1.currencyID == LOOT.CurrencyIDs.KEYS then
			arg_4_0.Price.Currency:setImage(RegisterMaterial("icon_currency_key"))
		else
			assert(false, "Unsupported currency!")
		end

		local var_4_20, var_4_21 = STORE.GetBundleCost(arg_4_0._controllerIndex, arg_4_1.id)
		local var_4_22 = var_4_20

		if var_4_21 and var_4_21 < var_4_20 then
			var_4_22 = var_4_21
		end

		if var_4_22 > 0 then
			arg_4_0.Price.Amount:setText(var_4_22)

			var_4_17 = arg_4_0.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_WITH_PROMPT"))

			if var_4_21 then
				arg_4_0.Price.Discount:setText(var_4_20)

				var_4_18 = _1080p * 380

				arg_4_0.Price:SetRight(var_4_18, 1)
				ACTIONS.AnimateSequence(arg_4_0.Price, "PriceWithDiscount")
			else
				arg_4_0.Price:SetRight(var_4_18, 1)
				ACTIONS.AnimateSequence(arg_4_0.Price, "PriceAndIcon")
			end
		else
			arg_4_0.Price:SetRight(var_4_18, 1)
			ACTIONS.AnimateSequence(arg_4_0.Price, "Free")

			var_4_17 = arg_4_0.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/CLAIM_BUNDLE_WITH_PROMPT"))
		end

		ACTIONS.AnimateSequence(arg_4_0, "ShowPrice")
	end

	local var_4_23

	if arg_4_1.gameSourceID == LUI.GAME_SOURCE_ID.MODERN_WARFARE then
		var_4_23 = "mw_logo_shadowed"
	elseif arg_4_1.gameSourceID == LUI.GAME_SOURCE_ID.COLD_WAR then
		var_4_23 = "mw_bocw_logo_shadowed"
	elseif arg_4_1.gameSourceID == LUI.GAME_SOURCE_ID.VANGUARD then
		var_4_23 = "vanguard_logo_store_shadowed"
	end

	if var_4_23 then
		arg_4_0.SnipeLogo:SetAlpha(1)
		arg_4_0.SnipeLogo:setImage(RegisterMaterial(var_4_23))
	else
		arg_4_0.SnipeLogo:SetAlpha(0)
	end

	local var_4_24 = arg_4_0._promotedItems[tostring(arg_4_1.id)]
	local var_4_25 = STORE.IsItemOnSale(arg_4_1.id, arg_4_0._controllerIndex)

	if not arg_4_2 then
		arg_4_0.HotItem:SetAlpha(var_4_25 and 1 or 0)

		if var_4_25 and CONDITIONS.IsStoreSalesBannerEnabled() and arg_4_1.discountPercent then
			arg_4_0.HotItem:SetupDiscountPercentage(arg_4_1.discountPercent)
		else
			arg_4_0.HotItem:SetupOnSaleText()
		end
	else
		local var_4_26 = arg_4_1.firstPartyBundleId and STORE.IsItemOnSale(arg_4_1.firstPartyBundleId, arg_4_0._controllerIndex)

		arg_4_0.HotItem:SetAlpha(var_4_26 and 1 or 0)

		if var_4_26 and CONDITIONS.IsStoreSalesBannerEnabled() and arg_4_1.discountPercent then
			arg_4_0.HotItem:SetupDiscountPercentage(arg_4_1.discountPercent)
		else
			arg_4_0.HotItem:SetupOnSaleText()
		end
	end

	local var_4_27 = false

	if arg_4_1.id and not STORE.HasSeenItem(arg_4_0._controllerIndex, arg_4_1.id) and not arg_4_1.emptyCategory and not arg_4_2 then
		arg_4_0.NewItemNotification:SetAlpha(1)

		var_4_27 = true
	else
		arg_4_0.NewItemNotification:SetAlpha(0)

		var_4_27 = false
	end

	if var_4_27 then
		local var_4_28 = arg_4_0.LocalizedTitle:GetCurrentAnchorsAndPositions().left
		local var_4_29 = arg_4_0.LocalizedTitle:GetCurrentAnchorsAndPositions().right - var_4_28
		local var_4_30 = LAYOUT.GetTextWidth(arg_4_0.LocalizedTitle)
		local var_4_31 = math.min(var_4_30, var_4_29)
		local var_4_32 = LAYOUT.GetElementWidth(arg_4_0.NewItemNotification.Backer)
		local var_4_33 = (IsLanguageArabic() and 30 or 8) * _1080p

		arg_4_0.NewItemNotification:SetupLeftAlignment()
		arg_4_0.NewItemNotification:SetLeft(var_4_28 + var_4_31 + var_4_33)
		arg_4_0.NewItemNotification:SetRight(var_4_28 + var_4_31 + var_4_32 + var_4_33)
	end

	local var_4_34 = arg_4_0._bundlePreviewEnabled and _1080p * 130 or var_4_18 + var_0_0
	local var_4_35 = var_4_34 + var_4_17

	arg_4_0.Prompt:SetLeft(var_4_34, 1)
	arg_4_0.Prompt:SetRight(var_4_35, 1)
	ACTIONS.AnimateSequence(arg_4_0, "Fade")
end

local function var_0_3(arg_5_0, arg_5_1)
	if arg_5_1 then
		ACTIONS.AnimateSequence(arg_5_0, "ShowPromptGift")

		local var_5_0 = arg_5_0.PromptGift:SetText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/GIFT_BUNDLE_PROMPT"))
		local var_5_1 = _1080p * 330
		local var_5_2 = arg_5_0._bundlePreviewEnabled and _1080p * 130 or var_5_1 + var_0_0
		local var_5_3 = var_5_2 + var_5_0

		arg_5_0.Prompt:SetLeft(var_5_2, 1)
		arg_5_0.Prompt:SetRight(var_5_3, 1)
	else
		ACTIONS.AnimateSequence(arg_5_0, "HidePromptGift")
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._bundlePreviewEnabled = CONDITIONS.IsStoreBundlePreviewListEnabled(arg_6_0)

	if arg_6_0._bundlePreviewEnabled then
		ACTIONS.AnimateSequence(arg_6_0, "ConfigBundlePreview")
		arg_6_0.Description:SetMaxVisibleLines(2)
	else
		ACTIONS.AnimateSequence(arg_6_0, "ConfigBundleItemDesc")
		arg_6_0.Description:SetMaxVisibleLines(3)
	end

	arg_6_0.UpdateBillboard = var_0_2
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0._promotedItems = STORE.ParsePromotedItems(arg_6_1)
	arg_6_0.SetGiftPromtButtonActive = var_0_3

	ACTIONS.AnimateSequence(arg_6_0, "HidePrice")

	if arg_6_0.NewItemNotification then
		arg_6_0.NewItemNotification.Highlight:SetRGBFromTable(SWATCHES.Store.NewItemTab)
		arg_6_0.NewItemNotification.Backer:SetRGBFromTable(SWATCHES.Store.NewItemBackground)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
	end

	arg_6_0.Image:SetMask(arg_6_0.CenterOutMask)
end

function StoreBillboardItem(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 580 * _1080p)

	var_7_0.id = "StoreBillboardItem"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:setUseStencil(true)

	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Image"

	var_7_4:SetAlpha(0, 0)
	var_7_4:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Image = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "CenterOutMask"

	var_7_6:setImage(RegisterMaterial("ui_mp_br_shared_item_mask"), 0)
	var_7_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -98, _1080p * 53, _1080p * -23, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.CenterOutMask = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "BackerText"

	var_7_8:SetRGBFromTable(SWATCHES.Reticles.Black, 0)
	var_7_8:setImage(RegisterMaterial("widg_gradient_ch2"), 0)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 899, 0, _1080p * 588)
	var_7_0:addElement(var_7_8)

	var_7_0.BackerText = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "LocalizedTitle"

	var_7_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_7_10:setText("", 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetWordWrap(false)
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_10:SetStartupDelay(2000)
	var_7_10:SetLineHoldTime(400)
	var_7_10:SetAnimMoveTime(2000)
	var_7_10:SetAnimMoveSpeed(150)
	var_7_10:SetEndDelay(2000)
	var_7_10:SetCrossfadeTime(250)
	var_7_10:SetFadeInTime(300)
	var_7_10:SetFadeOutTime(300)
	var_7_10:SetMaxVisibleLines(1)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 642, _1080p * 268, _1080p * 298)
	var_7_0:addElement(var_7_10)

	var_7_0.LocalizedTitle = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "TitleImage"

	var_7_12:SetAlpha(0, 0)
	var_7_12:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 17, _1080p * 273)
	var_7_0:addElement(var_7_12)

	var_7_0.TitleImage = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIStyledText.new()

	var_7_14.id = "Description"

	var_7_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_7_14:setText("", 0)
	var_7_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_14:SetAlignment(LUI.Alignment.Left)
	var_7_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_7_14:SetStartupDelay(2000)
	var_7_14:SetLineHoldTime(400)
	var_7_14:SetAnimMoveTime(2000)
	var_7_14:SetAnimMoveSpeed(150)
	var_7_14:SetEndDelay(2000)
	var_7_14:SetCrossfadeTime(250)
	var_7_14:SetFadeInTime(300)
	var_7_14:SetFadeOutTime(300)
	var_7_14:SetMaxVisibleLines(2)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 642, _1080p * 297, _1080p * 321)
	var_7_0:addElement(var_7_14)

	var_7_0.Description = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("PromptButton", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "PromptGift"

	var_7_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 330, _1080p * -106, _1080p * -76)
	var_7_0:addElement(var_7_16)

	var_7_0.PromptGift = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("PriceButtonSmall", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "Price"

	var_7_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 330, _1080p * -192, _1080p * -152)
	var_7_0:addElement(var_7_18)

	var_7_0.Price = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("PromptButton", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "Prompt"

	var_7_20:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 330, _1080p * -144, _1080p * -114)
	var_7_0:addElement(var_7_20)

	var_7_0.Prompt = var_7_20

	local var_7_21
	local var_7_22 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_7_1
	})

	var_7_22.id = "NewItemNotification"

	var_7_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 208, _1080p * 267, _1080p * 290)
	var_7_0:addElement(var_7_22)

	var_7_0.NewItemNotification = var_7_22

	local var_7_23
	local var_7_24 = MenuBuilder.BuildRegisteredType("HotItem", {
		controllerIndex = var_7_1
	})

	var_7_24.id = "HotItem"

	var_7_24:SetAlpha(0, 0)
	var_7_24:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -371, _1080p * -121, _1080p * 271, _1080p * 501)
	var_7_0:addElement(var_7_24)

	var_7_0.HotItem = var_7_24

	local var_7_25

	if not CONDITIONS.IsStoreBundlePreviewListEnabled() then
		var_7_25 = MenuBuilder.BuildRegisteredType("StoreBillboardDescItem", {
			controllerIndex = var_7_1
		})
		var_7_25.id = "BundleItemDesc1"

		var_7_25:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 330, _1080p * -214, _1080p * -190)
		var_7_0:addElement(var_7_25)

		var_7_0.BundleItemDesc1 = var_7_25
	end

	local var_7_26

	if not CONDITIONS.IsStoreBundlePreviewListEnabled() then
		var_7_26 = MenuBuilder.BuildRegisteredType("StoreBillboardDescItem", {
			controllerIndex = var_7_1
		})
		var_7_26.id = "BundleItemDesc2"

		var_7_26:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 340, _1080p * 540, _1080p * -214, _1080p * -190)
		var_7_0:addElement(var_7_26)

		var_7_0.BundleItemDesc2 = var_7_26
	end

	local var_7_27
	local var_7_28 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_7_1
	})

	var_7_28.id = "LimitedTimeItem"

	var_7_28:SetAlpha(0, 0)
	var_7_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -396, _1080p * -96, _1080p * 15, _1080p * 45)
	var_7_0:addElement(var_7_28)

	var_7_0.LimitedTimeItem = var_7_28

	local var_7_29
	local var_7_30 = MenuBuilder.BuildRegisteredType("MPStoreBillboardLimitedTimeBanner", {
		controllerIndex = var_7_1
	})

	var_7_30.id = "MPStoreBillboardLimitedTimeBanner"

	var_7_30:SetAlpha(0, 0)
	var_7_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1533, _1080p * 1815, _1080p * 475, _1080p * 501)
	var_7_0:addElement(var_7_30)

	var_7_0.MPStoreBillboardLimitedTimeBanner = var_7_30

	local var_7_31
	local var_7_32 = LUI.UIStyledText.new()

	var_7_32.id = "BundleIncludesText"

	var_7_32:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_7_32:setText(ToUpperCase(Engine.CBBHFCGDIC("INGAMESTORE/BUNDLE_INCLUDES")), 0)
	var_7_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_32:SetWordWrap(false)
	var_7_32:SetAlignment(LUI.Alignment.Left)
	var_7_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_32:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_32:SetStartupDelay(2000)
	var_7_32:SetLineHoldTime(400)
	var_7_32:SetAnimMoveTime(2000)
	var_7_32:SetAnimMoveSpeed(150)
	var_7_32:SetEndDelay(2000)
	var_7_32:SetCrossfadeTime(250)
	var_7_32:SetFadeInTime(300)
	var_7_32:SetFadeOutTime(300)
	var_7_32:SetMaxVisibleLines(1)
	var_7_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 132, _1080p * 360, _1080p * -226, _1080p * -202)
	var_7_0:addElement(var_7_32)

	var_7_0.BundleIncludesText = var_7_32

	local var_7_33
	local var_7_34 = LUI.UIImage.new()

	var_7_34.id = "BundleIncludesDivider"

	var_7_34:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_7_34:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_7_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 810, _1080p * -202, _1080p * -201)
	var_7_0:addElement(var_7_34)

	var_7_0.BundleIncludesDivider = var_7_34

	local var_7_35

	if CONDITIONS.IsStoreBundlePreviewListEnabled() then
		var_7_35 = MenuBuilder.BuildRegisteredType("StoreBundlePreviewList", {
			controllerIndex = var_7_1
		})
		var_7_35.id = "BundlePreviewList"

		var_7_35:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 360, _1080p * 810, _1080p * -190, _1080p * -40)
		var_7_0:addElement(var_7_35)

		var_7_0.BundlePreviewList = var_7_35
	end

	local var_7_36
	local var_7_37 = LUI.UIImage.new()

	var_7_37.id = "SnipeLogo"

	var_7_37:setImage(RegisterMaterial("mw_logo_shadowed"), 0)
	var_7_37:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -337, _1080p * -135, _1080p * 51, _1080p * 151)
	var_7_0:addElement(var_7_37)

	var_7_0.SnipeLogo = var_7_37

	local var_7_38
	local var_7_39 = LUI.UIImage.new()

	var_7_39.id = "Overlay"

	var_7_39:SetRGBFromInt(0, 0)
	var_7_39:SetAlpha(0, 0)
	var_7_0:addElement(var_7_39)

	var_7_0.Overlay = var_7_39

	local function var_7_40()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_40

	local var_7_41
	local var_7_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("ShowPrice", var_7_42)

	local var_7_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("ShowPrice", var_7_43)

	local function var_7_44()
		var_7_18:AnimateSequence("ShowPrice")
		var_7_20:AnimateSequence("ShowPrice")
	end

	var_7_0._sequences.ShowPrice = var_7_44

	local var_7_45
	local var_7_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("HidePrice", var_7_46)

	local var_7_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("HidePrice", var_7_47)

	local function var_7_48()
		var_7_18:AnimateSequence("HidePrice")
		var_7_20:AnimateSequence("HidePrice")
	end

	var_7_0._sequences.HidePrice = var_7_48

	local var_7_49
	local var_7_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_7_39:RegisterAnimationSequence("Fade", var_7_50)

	local function var_7_51()
		var_7_39:AnimateSequence("Fade")
	end

	var_7_0._sequences.Fade = var_7_51

	local var_7_52
	local var_7_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("ShowBundlePreview", var_7_53)

	local var_7_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("ShowBundlePreview", var_7_54)

	if CONDITIONS.IsStoreBundlePreviewListEnabled() then
		local var_7_55 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_35:RegisterAnimationSequence("ShowBundlePreview", var_7_55)
	end

	local function var_7_56()
		var_7_32:AnimateSequence("ShowBundlePreview")
		var_7_34:AnimateSequence("ShowBundlePreview")

		if CONDITIONS.IsStoreBundlePreviewListEnabled() then
			var_7_35:AnimateSequence("ShowBundlePreview")
		end
	end

	var_7_0._sequences.ShowBundlePreview = var_7_56

	local var_7_57
	local var_7_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("HideBundlePreview", var_7_58)

	local var_7_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("HideBundlePreview", var_7_59)

	if CONDITIONS.IsStoreBundlePreviewListEnabled() then
		local var_7_60 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_35:RegisterAnimationSequence("HideBundlePreview", var_7_60)
	end

	local function var_7_61()
		var_7_32:AnimateSequence("HideBundlePreview")
		var_7_34:AnimateSequence("HideBundlePreview")

		if CONDITIONS.IsStoreBundlePreviewListEnabled() then
			var_7_35:AnimateSequence("HideBundlePreview")
		end
	end

	var_7_0._sequences.HideBundlePreview = var_7_61

	local var_7_62
	local var_7_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 298
		}
	}

	var_7_10:RegisterAnimationSequence("ConfigBundlePreview", var_7_63)

	local var_7_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 640
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 321
		}
	}

	var_7_14:RegisterAnimationSequence("ConfigBundlePreview", var_7_64)

	local var_7_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -76
		}
	}

	var_7_16:RegisterAnimationSequence("ConfigBundlePreview", var_7_65)

	local var_7_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -152
		}
	}

	var_7_18:RegisterAnimationSequence("ConfigBundlePreview", var_7_66)

	local var_7_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		}
	}

	var_7_20:RegisterAnimationSequence("ConfigBundlePreview", var_7_67)

	local var_7_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 267
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 290
		}
	}

	var_7_22:RegisterAnimationSequence("ConfigBundlePreview", var_7_68)

	if not CONDITIONS.IsStoreBundlePreviewListEnabled() then
		local var_7_69 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -214
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -190
			}
		}

		var_7_25:RegisterAnimationSequence("ConfigBundlePreview", var_7_69)
	end

	if not CONDITIONS.IsStoreBundlePreviewListEnabled() then
		local var_7_70 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -214
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -190
			}
		}

		var_7_26:RegisterAnimationSequence("ConfigBundlePreview", var_7_70)
	end

	local var_7_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -202
		}
	}

	var_7_32:RegisterAnimationSequence("ConfigBundlePreview", var_7_71)

	local var_7_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -201
		}
	}

	var_7_34:RegisterAnimationSequence("ConfigBundlePreview", var_7_72)

	local function var_7_73()
		var_7_10:AnimateSequence("ConfigBundlePreview")
		var_7_14:AnimateSequence("ConfigBundlePreview")
		var_7_16:AnimateSequence("ConfigBundlePreview")
		var_7_18:AnimateSequence("ConfigBundlePreview")
		var_7_20:AnimateSequence("ConfigBundlePreview")
		var_7_22:AnimateSequence("ConfigBundlePreview")

		if not CONDITIONS.IsStoreBundlePreviewListEnabled() then
			var_7_25:AnimateSequence("ConfigBundlePreview")
		end

		if not CONDITIONS.IsStoreBundlePreviewListEnabled() then
			var_7_26:AnimateSequence("ConfigBundlePreview")
		end

		var_7_32:AnimateSequence("ConfigBundlePreview")
		var_7_34:AnimateSequence("ConfigBundlePreview")
	end

	var_7_0._sequences.ConfigBundlePreview = var_7_73

	local var_7_74
	local var_7_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 640
		}
	}

	var_7_14:RegisterAnimationSequence("ConfigBundleItemDesc", var_7_75)

	local var_7_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -40
		}
	}

	var_7_16:RegisterAnimationSequence("ConfigBundleItemDesc", var_7_76)

	local var_7_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		}
	}

	var_7_18:RegisterAnimationSequence("ConfigBundleItemDesc", var_7_77)

	local var_7_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -80
		}
	}

	var_7_20:RegisterAnimationSequence("ConfigBundleItemDesc", var_7_78)

	local var_7_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("ConfigBundleItemDesc", var_7_79)

	local var_7_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("ConfigBundleItemDesc", var_7_80)

	if CONDITIONS.IsStoreBundlePreviewListEnabled() then
		local var_7_81 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_35:RegisterAnimationSequence("ConfigBundleItemDesc", var_7_81)
	end

	local function var_7_82()
		var_7_14:AnimateSequence("ConfigBundleItemDesc")
		var_7_16:AnimateSequence("ConfigBundleItemDesc")
		var_7_18:AnimateSequence("ConfigBundleItemDesc")
		var_7_20:AnimateSequence("ConfigBundleItemDesc")
		var_7_32:AnimateSequence("ConfigBundleItemDesc")
		var_7_34:AnimateSequence("ConfigBundleItemDesc")

		if CONDITIONS.IsStoreBundlePreviewListEnabled() then
			var_7_35:AnimateSequence("ConfigBundleItemDesc")
		end
	end

	var_7_0._sequences.ConfigBundleItemDesc = var_7_82

	local var_7_83
	local var_7_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_7_32:RegisterAnimationSequence("WZWipSetup", var_7_84)

	local var_7_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_7_34:RegisterAnimationSequence("WZWipSetup", var_7_85)

	local function var_7_86()
		var_7_32:AnimateSequence("WZWipSetup")
		var_7_34:AnimateSequence("WZWipSetup")
	end

	var_7_0._sequences.WZWipSetup = var_7_86

	local var_7_87
	local var_7_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ShowPromptGift", var_7_88)

	local function var_7_89()
		var_7_16:AnimateSequence("ShowPromptGift")
	end

	var_7_0._sequences.ShowPromptGift = var_7_89

	local var_7_90
	local var_7_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("HidePromptGift", var_7_91)

	local function var_7_92()
		var_7_16:AnimateSequence("HidePromptGift")
	end

	var_7_0._sequences.HidePromptGift = var_7_92

	local var_7_93
	local var_7_94 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_30:RegisterAnimationSequence("ShowLimitedTime", var_7_94)

	local function var_7_95()
		var_7_30:AnimateSequence("ShowLimitedTime")
	end

	var_7_0._sequences.ShowLimitedTime = var_7_95

	local var_7_96
	local var_7_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_30:RegisterAnimationSequence("HideLimitedTime", var_7_97)

	local function var_7_98()
		var_7_30:AnimateSequence("HideLimitedTime")
	end

	var_7_0._sequences.HideLimitedTime = var_7_98

	local var_7_99
	local var_7_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("HidePriceKeepPrompt", var_7_100)

	local var_7_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("HidePriceKeepPrompt", var_7_101)

	local var_7_102 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("HidePriceKeepPrompt", var_7_102)

	local function var_7_103()
		var_7_16:AnimateSequence("HidePriceKeepPrompt")
		var_7_18:AnimateSequence("HidePriceKeepPrompt")
		var_7_20:AnimateSequence("HidePriceKeepPrompt")
	end

	var_7_0._sequences.HidePriceKeepPrompt = var_7_103

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("StoreBillboardItem", StoreBillboardItem)
LockTable(_M)
