module(..., package.seeall)

local var_0_0 = 1
local var_0_1 = 1000
local var_0_2 = {
	{
		class = Engine.CBBHFCGDIC("MENU/CAMPAIGN"),
		name = Engine.CBBHFCGDIC("MENU/CAMPAIGN_DESC")
	},
	{
		class = Engine.CBBHFCGDIC("MENU/MULTIPLAYER"),
		name = Engine.CBBHFCGDIC("MENU/MULTIPLAYER_DESC")
	},
	{
		class = Engine.CBBHFCGDIC("MENU/COOP"),
		name = Engine.CBBHFCGDIC("LUA_MENU/COOP_DESC")
	}
}

local function var_0_3(arg_1_0)
	arg_1_0.TitleIDItemGrid._scrollbars[1]:SetKBMStyle(true)
	arg_1_0:registerEventHandler("gamepad_sticks", function(arg_2_0, arg_2_1)
		arg_1_0._lastRightStickPitch = arg_2_1.rightStickPitch

		return true
	end)
	arg_1_0:registerEventHandler("update_grid_scroll", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0._lastRightStickPitch or 0
		local var_3_1 = 10

		arg_3_0.TitleIDItemGrid:ScrollAmount(var_3_0 > 0 and "up" or "down", math.abs(var_3_0 * var_3_1 * 0.016))

		return true
	end)

	arg_1_0._pitchUpdateTimer = LUI.UITimer.new({
		interval = 16,
		event = {
			name = "update_grid_scroll"
		}
	})
	arg_1_0._pitchUpdateTimer.id = "_pitchUpdateTimer"

	arg_1_0:addElement(arg_1_0._pitchUpdateTimer)
	arg_1_0:AddButtonHelperTextToElement(arg_1_0.ButtonHelperBar, {
		priority = 2,
		side = "left",
		gamepad_only = true,
		button_ref = "button_right_stick",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SCROLL"),
		container = arg_1_0.GridScrollPrompt
	})
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = {
		"STORE/ZEUS_STANDARD_ITEM_1",
		"STORE/ZEUS_STANDARD_ITEM_3"
	}
	local var_4_1 = {
		"STORE/ZEUS_ULTIMATE_ITEM_2",
		"STORE/ZEUS_ULTIMATE_ITEM_1"
	}
	local var_4_2 = arg_4_0._purchaseData and arg_4_0._purchaseData.productId
	local var_4_3 = false

	if Engine.HDGDBCJFG() then
		if var_4_2 then
			local var_4_4 = STORE.ZeusProductIDs[arg_4_0._purchaseData.productId] == STORE.ZeusProductIDs[STORE.ZeusCrossGenID]
			local var_4_5 = STORE.ZeusProductIDs[arg_4_0._purchaseData.productId] == STORE.ZeusProductIDs[STORE.ZeusUltimateID]

			if var_4_4 or var_4_5 then
				table.insert(var_4_0, 2, "STORE/ZEUS_NEXT_GEN_ITEM")

				var_4_3 = true
			end
		elseif arg_4_1 == STORE.ZeusTitleIDs.ZEUS_STANDARD then
			local var_4_6 = STORE.IsZeusProductOwned(arg_4_0._controllerIndex, STORE.ZeusCrossGenID)
			local var_4_7 = STORE.IsZeusProductOwned(arg_4_0._controllerIndex, STORE.ZeusUltimateID)

			if var_4_6 and not var_4_7 then
				table.insert(var_4_0, 2, "STORE/ZEUS_NEXT_GEN_ITEM")

				var_4_3 = true
			end
		elseif arg_4_1 == STORE.ZeusTitleIDs.ZEUS_ULTIMATE then
			table.insert(var_4_0, 2, "STORE/ZEUS_NEXT_GEN_ITEM")

			var_4_3 = true
		end
	end

	if arg_4_1 == STORE.ZeusTitleIDs.ZEUS_STANDARD then
		return var_4_0
	elseif arg_4_1 == STORE.ZeusTitleIDs.ZEUS_ULTIMATE then
		for iter_4_0 = #var_4_1, 1, -1 do
			table.insert(var_4_0, var_4_3 and 3 or 2, var_4_1[iter_4_0])
		end

		return var_4_0
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	for iter_5_0 = CSV.dlcIDs.cols.itemStart, CSV.dlcIDs.cols.itemEnd do
		local var_5_0 = StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_5_1, iter_5_0)

		if #var_5_0 > 0 then
			local var_5_1 = tonumber(var_5_0)
			local var_5_2 = LOOT.GetTypeForID(var_5_1)

			if var_5_2 and var_5_2 ~= LOOT.itemTypes.INVALID and var_5_2 ~= LOOT.itemTypes.FIRST_PARTY_LICENCE and var_5_2 ~= LOOT.itemTypes.BUNDLE then
				local var_5_3 = LOOT.GetItemRef(var_5_2, var_5_1)
				local var_5_4 = tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_5_1, CSV.bundleIDs.cols.isCollection)) == 1

				table.insert(arg_5_0._additionalItems, {
					name = LOOT.GetItemName(var_5_2, var_5_3, var_5_1),
					class = LOOT.GetItemClassName(var_5_2, var_5_3, var_5_1),
					image = LOOT.GetItemImage(var_5_2, var_5_3, var_5_1),
					isCollection = var_5_4,
					lootID = var_5_1,
					lootType = var_5_2
				})
			end
		end
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if not STORE.IsZeusTitle(arg_6_1) or not STORE.AreZeusLaunchProductsEnabled() then
		if arg_6_1 == STORE.ZeusTitleIDs.ZEUS_ULTIMATE then
			var_0_5(arg_6_0, STORE.ZeusTitleIDs.ZEUS_STANDARD)
		end

		var_0_5(arg_6_0, arg_6_1)
	end

	if #arg_6_2.CPAmount > 0 then
		table.insert(arg_6_0._additionalItems, {
			image = "icon_currency_codpoints_large",
			name = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS", arg_6_2.CPAmount),
			class = Engine.CBBHFCGDIC("LUA_MENU/COD_POINTS_CLASS")
		})
	end

	if arg_6_3 then
		arg_6_0.TitleIDItemGrid:SetNumChildren(#arg_6_0._additionalItems)
		arg_6_0.TitleIDItemGrid:SetRefreshChild(function(arg_7_0, arg_7_1, arg_7_2)
			local var_7_0 = arg_7_1 + arg_7_2 * arg_6_0.TitleIDItemGrid:GetNumColumns()
			local var_7_1 = arg_6_0._additionalItems[var_7_0 + 1]

			arg_7_0.Name:setText(var_7_1.name)
			arg_7_0.Class:setText(var_7_1.class)
		end)
		arg_6_0.TitleIDItemGrid:RefreshContent()
	else
		arg_6_0.ItemGrid:SetNumChildren(#arg_6_0._additionalItems)
		arg_6_0.ItemGrid:SetRefreshChild(function(arg_8_0, arg_8_1, arg_8_2)
			local var_8_0 = arg_8_1 + arg_8_2 * arg_6_0.ItemGrid:GetNumColumns()
			local var_8_1 = arg_6_0._additionalItems[var_8_0 + 1]

			arg_8_0.Name:setText(var_8_1.name)
			arg_8_0.Class:setText(var_8_1.class)
			arg_8_0.Name:SetAlpha(var_8_1.isCollection and 0 or 1)
		end)
		arg_6_0.ItemGrid:RefreshContent()
	end

	if STORE.IsZeusTitle(arg_6_1) then
		local var_6_0 = var_0_4(arg_6_0, arg_6_1)

		arg_6_0.TitleIDGrid:SetMaxVisibleColumns(2)
		arg_6_0.TitleIDGrid:SetMaxVisibleRows(4)
		arg_6_0.TitleIDGrid:SetNumChildren(#var_6_0)
		arg_6_0.TitleIDGrid:SetRefreshChild(function(arg_9_0, arg_9_1, arg_9_2)
			local var_9_0 = arg_9_1 + arg_9_2 * arg_6_0.TitleIDGrid:GetNumColumns()
			local var_9_1 = Engine.CBBHFCGDIC(var_6_0[var_9_0 + 1])

			arg_9_0.Name:setText("")
			arg_9_0.Class:setText(var_9_1)
		end)
		arg_6_0.TitleIDGrid:RefreshContent()
	end
end

local function var_0_7(arg_10_0)
	arg_10_0.TitleIDGrid:SetNumChildren(#var_0_2)

	for iter_10_0, iter_10_1 in ipairs(var_0_2) do
		local var_10_0 = arg_10_0.TitleIDGrid:GetElementAtPosition(0, iter_10_0 - 1)

		var_10_0.Name:setText(iter_10_1.name)
		var_10_0.Class:setText(iter_10_1.class)
	end
end

local function var_0_8(arg_11_0)
	local var_11_0 = 50 * _1080p
	local var_11_1 = LAYOUT.GetTextWidth(arg_11_0.AvailableLaunch)

	arg_11_0.TitleIDGridBackground.Text:SetRight(-var_11_1 - var_11_0)

	local var_11_2 = LAYOUT.GetTextWidth(arg_11_0.AvailableNow)

	arg_11_0.ItemGridBackground.Text:SetRight(-var_11_2 - var_11_0)
end

local function var_0_9(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_12_2)
	local var_12_1 = CSV.ReadRow(CSV.dlcIDs, var_12_0)

	arg_12_0.Image:setImage(RegisterMaterial(var_12_1.image))

	if tonumber(StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_12_2, CSV.dlcIDs.cols.isCODPoints)) == 1 then
		ACTIONS.AnimateSequence(arg_12_0, "CODPoints")
		arg_12_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_COMPLETED", var_12_1.title)))

		local var_12_2 = StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_12_2, CSV.dlcIDs.cols.CPAmount)

		LUI.FlowManager.RequestLeaveMenuByName("PurchaseCODPointsPopup")
		LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
		assert(arg_12_0.Price)
		arg_12_0.Price.Amount:setText(var_12_2)
		ACTIONS.AnimateSequence(arg_12_0.Price, "HideBacker")
	else
		arg_12_0._additionalItems = {}

		local var_12_3 = false

		if arg_12_0._purchaseData then
			if STORE.IsZeusTitle(arg_12_2) then
				ACTIONS.AnimateSequence(arg_12_0, "ZeusTitle")
				ACTIONS.AnimateSequence(arg_12_0, "ZeusPreview")

				if IsLanguageArabic() then
					ACTIONS.AnimateSequence(arg_12_0, "ARZeusPreview")
				end

				if STORE.AreZeusLaunchProductsEnabled() then
					ACTIONS.AnimateSequence(arg_12_0, "ZeusLaunch")
				end

				arg_12_0.Image:SetMask(arg_12_0.BillboardMask)
				arg_12_0.ItemGrid:SetMaxVisibleRows(4)
				arg_12_0.ItemGrid:SetMaxVisibleColumns(3)

				local var_12_4 = STORE.LookupFirstPartyBundle(arg_12_0._purchaseData.productId)

				if var_12_4 then
					arg_12_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_TITLE", var_12_4.name)))
					arg_12_0.TitleImage:setImage(RegisterMaterial(var_12_4.titleImage))
					arg_12_0.Image:setImage(RegisterMaterial(var_12_4.image))
				end

				var_0_8(arg_12_0)
			else
				ACTIONS.AnimateSequence(arg_12_0, IsLanguageArabic() and "PreviewAR" or "Preview")

				if STORE.IsBattlePassTitleID(arg_12_2) then
					var_0_3(arg_12_0)
				end

				arg_12_0:FillGameModesGrid()

				var_12_3 = true

				arg_12_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_TITLE", var_12_1.title)))
			end

			arg_12_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_secondary",
				priority = 0,
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})
			arg_12_0.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
				if not arg_13_1.controller then
					local var_13_0 = arg_12_1
				end

				ACTIONS.LeaveMenu(arg_12_0)
			end)
			arg_12_0.PurchaseButton:SetHandleMouse(true)
			arg_12_0.PurchaseButton:SetFocusable(true)
			arg_12_0.ConfirmButtonGamepad:SetHandleMouse(false)
			arg_12_0.ConfirmButtonGamepad:SetFocusable(false)
			arg_12_0.ConfirmButtonKBM:SetHandleMouse(false)
			arg_12_0.ConfirmButtonKBM:SetFocusable(false)
		elseif STORE.IsZeusTitle(arg_12_2) then
			ACTIONS.AnimateSequence(arg_12_0, "ZeusTitle")

			if arg_12_0._fromSignIn then
				ACTIONS.AnimateSequence(arg_12_0, "ZeusGeneric")
				arg_12_0.TitleImage:SetMask(arg_12_0.TitleMask)
			elseif IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_12_0, "ARZeusPreview")
			end

			if STORE.AreZeusLaunchProductsEnabled() then
				ACTIONS.AnimateSequence(arg_12_0, "ZeusLaunch")
			end

			arg_12_0.Image:SetMask(arg_12_0.BillboardMask)
			arg_12_0.ItemGrid:SetMaxVisibleRows(4)
			arg_12_0.ItemGrid:SetMaxVisibleColumns(3)
			var_0_8(arg_12_0)

			local var_12_5 = "STORE/PURCHASED_X"
			local var_12_6 = false

			if not STORE.IsZeusProductOwned(arg_12_0._controllerIndex, STORE.ZeusUltimateID) and Engine.HDGDBCJFG() then
				local var_12_7 = STORE.IsZeusProductOwned(arg_12_0._controllerIndex, STORE.ZeusCrossGenID)

				if arg_12_2 == STORE.ZeusTitleIDs.ZEUS_STANDARD and var_12_7 then
					local var_12_8 = STORE.LookupFirstPartyBundle(STORE.ZeusCrossGenID)

					if var_12_8 then
						arg_12_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(var_12_5, var_12_8.name)))
						arg_12_0.TitleImage:setImage(RegisterMaterial(var_12_8.titleImage))
						arg_12_0.Image:setImage(RegisterMaterial(var_12_8.image))

						var_12_6 = true
					end
				end
			end

			if not var_12_6 then
				local var_12_9 = STORE.GetZeusTitleImageForTitleID(arg_12_2)

				if var_12_9 and #var_12_9 > 0 then
					arg_12_0.TitleImage:setImage(RegisterMaterial(var_12_9))
				end

				arg_12_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(var_12_5, var_12_1.title)))
			end
		elseif STORE.IsTitleID(arg_12_2) then
			ACTIONS.AnimateSequence(arg_12_0, "TitleID")

			if STORE.IsBattlePassTitleID(arg_12_2) then
				var_0_3(arg_12_0)
			end

			arg_12_0:FillGameModesGrid()
			arg_12_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PURCHASED_TITLE", var_12_1.title)))

			var_12_3 = true
		else
			ACTIONS.AnimateSequence(arg_12_0, "ItemList")

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_12_0, "AR")
			end

			arg_12_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(var_12_1.title)))
		end

		var_0_6(arg_12_0, arg_12_2, var_12_1, var_12_3)

		if STORE.IsZeusTitle(arg_12_2) then
			return
		end

		if Engine.DBFCJBDJEC() then
			if arg_12_2 == 340021 or arg_12_2 == STORE.TitleIDs.BNET_BATTLE_PASS then
				local var_12_10 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, STORE.TitleIDs.BNET_STANDARD)

				if var_12_10 >= 0 then
					local var_12_11 = CSV.ReadRow(CSV.dlcIDs, var_12_10)

					if var_12_11 ~= nil then
						var_0_6(arg_12_0, STORE.TitleIDs.BNET_STANDARD, var_12_11, var_12_3)
					end
				end
			end

			if arg_12_2 == STORE.TitleIDs.BNET_BATTLE_PASS then
				local var_12_12 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, 340021)

				if var_12_12 > 0 then
					local var_12_13 = CSV.ReadRow(CSV.dlcIDs, var_12_12)

					if var_12_13 ~= nil then
						var_0_6(arg_12_0, 340021, var_12_13, var_12_3)
					end
				end

				local var_12_14 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, 340024)

				if var_12_14 > 0 then
					local var_12_15 = CSV.ReadRow(CSV.dlcIDs, var_12_14)

					if var_12_15 ~= nil then
						var_0_6(arg_12_0, 340024, var_12_15, var_12_3)
					end
				end
			end
		end

		if arg_12_2 == 340033 then
			local var_12_16 = StringTable.BJJBBCJGEJ(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, 340007)

			if var_12_16 > 0 then
				local var_12_17 = CSV.ReadRow(CSV.dlcIDs, var_12_16)

				if var_12_17 ~= nil then
					var_0_6(arg_12_0, 340007, var_12_17, var_12_3)
				end
			end
		end

		local var_12_18 = LOOT.GetItemID(LOOT.itemTypes.FEATURE, LOOT.createAClassRef)
		local var_12_19 = PROGRESSION.GetUnlockRank(var_12_18)
		local var_12_20 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = var_12_19
		})

		arg_12_0.AlertMessage:setText(Engine.CBBHFCGDIC("LUA_MENU/LOCKED_ITEMS_CAC_MSG", var_12_20._rankDisplay))
	end
end

local function var_0_10(arg_14_0)
	if not CONDITIONS.IsBattlePassEnabled() then
		return
	end

	local var_14_0 = false
	local var_14_1

	if arg_14_0._additionalItems then
		for iter_14_0 = 1, #arg_14_0._additionalItems do
			if arg_14_0._additionalItems[iter_14_0].lootType and arg_14_0._additionalItems[iter_14_0].lootType == LOOT.itemTypes.BATTLE_PASS then
				var_14_0 = true
				var_14_1 = arg_14_0._additionalItems[iter_14_0].lootID
			end
		end
	end

	if var_14_0 and BATTLEPASS.GetTier(arg_14_0._controllerIndex) < BATTLEPASS.GetMaxTier() then
		local var_14_2 = {
			tierSkipID = var_14_1
		}

		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_14_0._controllerIndex, false, var_14_2, false)
	end
end

local function var_0_11(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_2.markerItemID)

	arg_15_0.FillGameModesGrid = var_0_7
	arg_15_0.TryDisplayBattlePass = var_0_10
	arg_15_0.currentMarkerItemID = arg_15_2.markerItemID
	arg_15_0._purchaseData = arg_15_2.purchaseData
	arg_15_0._fromSignIn = arg_15_2.fromSignIn
	arg_15_0._fromPlaylistEventButton = arg_15_2.fromPlaylistEventButton
	arg_15_0._controllerIndex = arg_15_1

	local var_15_0 = LUI.UIBindButton.new()

	var_15_0.id = "selfBindButton"

	arg_15_0:addElement(var_15_0)

	arg_15_0.bindButton = var_15_0

	local var_15_1 = LUI.FlowManager.GetScopedData("ItemExchangePopup")

	if not var_15_1.itemQueue then
		var_15_1.itemQueue = LUI.CreateQueue()
	end

	arg_15_0.PurchaseButton:SetHandleMouse(false)
	arg_15_0.PurchaseButton:SetFocusable(false)
	arg_15_0.TitleIDItemGrid:SetNumChildren(0)
	arg_15_0.TitleIDGrid:SetNumChildren(0)
	arg_15_0.ItemGrid:SetNumChildren(0)
	var_0_9(arg_15_0, arg_15_1, arg_15_0.currentMarkerItemID)

	if arg_15_2.leavePartyAndLobbyOnPurchase then
		arg_15_0.DisbandDisclaimer:SetAlpha(1)
	end

	local function var_15_2()
		arg_15_0:TryDisplayBattlePass()

		local var_16_0 = var_15_1.itemQueue:Pop()

		if var_16_0 and var_16_0 ~= arg_15_0.currentMarkerItemID then
			var_0_9(arg_15_0, arg_15_1, var_16_0)

			arg_15_0.currentMarkerItemID = var_16_0
		else
			if Engine.DBFCJBDJEC() and Dvar.IBEGCHEFE("OPONKOMKQ") then
				LUI.FlowManager.RequestPopupMenu(arg_15_0, "restart_upsell_popmenu", true, arg_15_1, false, {
					controllerIndex = arg_15_1
				})
			end

			LUI.FlowManager.RequestLeaveMenu(arg_15_0, true)
		end
	end

	local var_15_3 = tonumber(StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_15_0.currentMarkerItemID, CSV.dlcIDs.cols.isCODPoints)) == 1

	LUI.AddUIHoldButtonLogic(arg_15_0.ConfirmButtonGamepad, arg_15_1, {
		clickKeyboardAndMouse = true,
		requireFocus = true,
		buttons = {
			primary = true
		},
		fill = arg_15_0.ConfirmButtonGamepad.GenericProgressBar,
		duration = var_15_3 and var_0_0 or var_0_1,
		onFill = var_15_2
	})
	arg_15_0.ConfirmButtonKBM:addEventHandler("button_action", function(arg_17_0, arg_17_1)
		var_15_2()
	end)

	local function var_15_4(arg_18_0, arg_18_1)
		if arg_15_0.ConfirmButtonKBM.Alpha == 1 or arg_15_0.ConfirmButtonGamepad.Alpha == 1 then
			if LUI.IsLastInputGamepad(arg_15_1) then
				arg_15_0.ConfirmButtonKBM:SetHandleMouse(false)
				arg_15_0.ConfirmButtonKBM:SetFocusable(false)
				arg_15_0.ConfirmButtonKBM:SetAlpha(0)
				arg_15_0.ConfirmButtonGamepad:SetHandleMouse(true)
				arg_15_0.ConfirmButtonGamepad:SetFocusable(true)
				arg_15_0.ConfirmButtonGamepad:SetAlpha(1)
			else
				arg_15_0.ConfirmButtonGamepad:SetHandleMouse(false)
				arg_15_0.ConfirmButtonGamepad:SetFocusable(false)
				arg_15_0.ConfirmButtonGamepad:SetAlpha(0)
				arg_15_0.ConfirmButtonKBM:SetHandleMouse(true)
				arg_15_0.ConfirmButtonKBM:SetFocusable(true)
				arg_15_0.ConfirmButtonKBM:SetAlpha(1)
			end
		end
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_15_0, arg_15_1)
	ACTIONS.ScaleFullscreen(arg_15_0.Background)
	arg_15_0.PurchaseButton:addEventHandler("button_action", function(arg_19_0, arg_19_1)
		if not arg_15_0._purchaseData or arg_15_0._purchaseData.owned then
			return true
		end

		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(false)
		end

		if STORE.IsTitleID(arg_15_2.itemID) then
			LUI.FlowManager.RequestPopupMenu(nil, "MagmaUpsellFullScreenPopup", true, arg_19_1.controller, false, {
				controllerIndex = arg_15_1,
				fromPlaylistEventButton = arg_15_0._fromPlaylistEventButton
			})
		end

		InGameStore.SelectProduct(arg_15_1, arg_15_0._purchaseData.productId, InGameStorePurchaseType.BROWSE)
		LUI.FlowManager.RequestLeaveMenu(arg_19_0)

		if arg_15_2.leavePartyAndLobbyOnPurchase and Lobby.BBDICGHE() then
			Lobby.LeavePublicLobby()

			if LUI.FlowManager.IsInStack("BRPublicLobby") then
				LUI.FlowManager.RequestLeaveMenuByName("BRPublicLobby", true, true)
			elseif LUI.FlowManager.IsInStack("MPPublicLobby") then
				LUI.FlowManager.RequestLeaveMenuByName("MPPublicLobby", true, true)
			end
		end
	end)
end

function ItemExchangePopup(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIElement.new()

	var_20_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_20_0.id = "ItemExchangePopup"
	var_20_0._animationSets = var_20_0._animationSets or {}
	var_20_0._sequences = var_20_0._sequences or {}

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = LUI.UIImage.new()

	var_20_4.id = "Background"

	var_20_4:SetRGBFromInt(0, 0)
	var_20_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_20_0:addElement(var_20_4)

	var_20_0.Background = var_20_4

	local var_20_5
	local var_20_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_20_1
	})

	var_20_6.id = "GenericPopupWindow"

	var_20_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * 860, _1080p * -486, _1080p * 456)
	var_20_0:addElement(var_20_6)

	var_20_0.GenericPopupWindow = var_20_6

	local var_20_7
	local var_20_8 = LUI.UIImage.new()

	var_20_8.id = "Image"

	var_20_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -768, _1080p * 768, _1080p * -386, _1080p * 78)
	var_20_0:addElement(var_20_8)

	var_20_0.Image = var_20_8

	local var_20_9
	local var_20_10 = LUI.UIImage.new()

	var_20_10.id = "BillboardMask"

	var_20_10:SetAlpha(0, 0)
	var_20_10:setImage(RegisterMaterial("store_bundle_grid_mask"), 0)
	var_20_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 96, _1080p * -96, _1080p * -926, _1080p * -344)
	var_20_0:addElement(var_20_10)

	var_20_0.BillboardMask = var_20_10

	local var_20_11
	local var_20_12 = MenuBuilder.BuildRegisteredType("GenericContentPanel", {
		controllerIndex = var_20_1
	})

	var_20_12.id = "ItemGridBackground"

	var_20_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/NEW_REWARDS"), 0)
	var_20_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -768, _1080p * 768, _1080p * 100, _1080p * 380)
	var_20_0:addElement(var_20_12)

	var_20_0.ItemGridBackground = var_20_12

	local var_20_13
	local var_20_14 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 4,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_20_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ItemExchangeLabel", {
				controllerIndex = var_20_1
			})
		end,
		refreshChild = function(arg_22_0, arg_22_1, arg_22_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 265,
		rowHeight = _1080p * 46,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle
	}
	local var_20_15 = LUI.UIGrid.new(var_20_14)

	var_20_15.id = "ItemGrid"

	var_20_15:setUseStencil(true)
	var_20_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -715, _1080p * 715, _1080p * 158, _1080p * 370)
	var_20_0:addElement(var_20_15)

	var_20_0.ItemGrid = var_20_15

	local var_20_16
	local var_20_17 = LUI.UIStyledText.new()

	var_20_17.id = "AlertMessage"

	var_20_17:SetRGBFromTable(SWATCHES.HUDWarnings.warning, 0)
	var_20_17:setText(Engine.CBBHFCGDIC("LUA_MENU/LOCKED_ITEMS_CAC_MSG"), 0)
	var_20_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_17:SetAlignment(LUI.Alignment.Right)
	var_20_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_20_17:SetStartupDelay(2000)
	var_20_17:SetLineHoldTime(400)
	var_20_17:SetAnimMoveTime(2000)
	var_20_17:SetAnimMoveSpeed(150)
	var_20_17:SetEndDelay(2000)
	var_20_17:SetCrossfadeTime(250)
	var_20_17:SetFadeInTime(300)
	var_20_17:SetFadeOutTime(300)
	var_20_17:SetMaxVisibleLines(1)
	var_20_17:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 956, _1080p * -205, _1080p * 654, _1080p * 674)
	var_20_0:addElement(var_20_17)

	var_20_0.AlertMessage = var_20_17

	local var_20_18
	local var_20_19 = MenuBuilder.BuildRegisteredType("PriceButtonSmall", {
		controllerIndex = var_20_1
	})

	var_20_19.id = "Price"

	var_20_19:SetAlpha(0, 0)
	var_20_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 515, _1080p * 715, 0, _1080p * 50)
	var_20_0:addElement(var_20_19)

	var_20_0.Price = var_20_19

	local var_20_20
	local var_20_21 = LUI.UIStyledText.new()

	var_20_21.id = "Title"

	var_20_21:SetRGBFromTable(SWATCHES.Popups.titleTxt, 0)
	var_20_21:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_COMPLETED")), 0)
	var_20_21:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_20_21:SetWordWrap(false)
	var_20_21:SetAlignment(LUI.Alignment.Left)
	var_20_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_20_21:SetStartupDelay(1000)
	var_20_21:SetLineHoldTime(400)
	var_20_21:SetAnimMoveTime(1000)
	var_20_21:SetAnimMoveSpeed(150)
	var_20_21:SetEndDelay(1000)
	var_20_21:SetCrossfadeTime(400)
	var_20_21:SetFadeInTime(300)
	var_20_21:SetFadeOutTime(300)
	var_20_21:SetMaxVisibleLines(1)
	var_20_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -466, _1080p * -406)
	var_20_0:addElement(var_20_21)

	var_20_0.Title = var_20_21

	local var_20_22
	local var_20_23 = MenuBuilder.BuildRegisteredType("GenericContentPanel", {
		controllerIndex = var_20_1
	})

	var_20_23.id = "TitleIDGridBackground"

	var_20_23:SetAlpha(0, 0)
	var_20_23.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/ALL_MODES_UNLOCKED"), 0)
	var_20_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -768, _1080p * -294, _1080p * 33, _1080p * 313)
	var_20_0:addElement(var_20_23)

	var_20_0.TitleIDGridBackground = var_20_23

	local var_20_24
	local var_20_25 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 3,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_20_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ItemExchangeLabel", {
				controllerIndex = var_20_1
			})
		end,
		refreshChild = function(arg_24_0, arg_24_1, arg_24_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 265,
		rowHeight = _1080p * 46,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_20_26 = LUI.UIGrid.new(var_20_25)

	var_20_26.id = "TitleIDGrid"

	var_20_26:SetAlpha(0, 0)
	var_20_26:setUseStencil(true)
	var_20_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -736, _1080p * -330, _1080p * 101, _1080p * 292)
	var_20_0:addElement(var_20_26)

	var_20_0.TitleIDGrid = var_20_26

	local var_20_27
	local var_20_28 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 3,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_20_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ItemExchangeLabel", {
				controllerIndex = var_20_1
			})
		end,
		refreshChild = function(arg_26_0, arg_26_1, arg_26_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 265,
		rowHeight = _1080p * 46,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_20_29 = LUI.UIGrid.new(var_20_28)

	var_20_29.id = "TitleIDItemGrid"

	var_20_29:SetAlpha(0, 0)
	var_20_29:setUseStencil(true)
	var_20_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -221, _1080p * 730, _1080p * 101, _1080p * 292)
	var_20_0:addElement(var_20_29)

	var_20_0.TitleIDItemGrid = var_20_29

	local var_20_30
	local var_20_31 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_20_1
	})

	var_20_31.id = "TitleIDGridScrollbar"

	var_20_31:SetAlpha(0, 0)
	var_20_31:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 730, _1080p * 741, _1080p * 101, _1080p * 292)
	var_20_0:addElement(var_20_31)

	var_20_0.TitleIDGridScrollbar = var_20_31

	local var_20_32
	local var_20_33 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_20_1
	})

	var_20_33.id = "ButtonHelperBar"

	var_20_33.Background:SetAlpha(0, 0)
	var_20_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 966, _1080p * 1026)
	var_20_0:addElement(var_20_33)

	var_20_0.ButtonHelperBar = var_20_33

	local var_20_34
	local var_20_35 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_20_1
	})

	var_20_35.id = "PurchaseButton"

	var_20_35:SetAlpha(0, 0)
	var_20_35.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_20_35.Text:SetAlignment(LUI.Alignment.Center)
	var_20_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 749, _1080p * 1171, _1080p * 902, _1080p * 952)
	var_20_0:addElement(var_20_35)

	var_20_0.PurchaseButton = var_20_35

	local var_20_36
	local var_20_37 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_20_1
	})

	var_20_37.id = "ConfirmButtonGamepad"

	var_20_37.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OK")), 0)
	var_20_37.Text:SetAlignment(LUI.Alignment.Center)
	var_20_37:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 401, _1080p * 439)
	var_20_0:addElement(var_20_37)

	var_20_0.ConfirmButtonGamepad = var_20_37

	local var_20_38
	local var_20_39 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_20_1
	})

	var_20_39.id = "ConfirmButtonKBM"

	var_20_39.Text:SetLeft(_1080p * 20, 0)
	var_20_39.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OK")), 0)
	var_20_39.Text:SetAlignment(LUI.Alignment.Center)
	var_20_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 401, _1080p * 439)
	var_20_0:addElement(var_20_39)

	var_20_0.ConfirmButtonKBM = var_20_39

	local var_20_40
	local var_20_41 = LUI.UIText.new()

	var_20_41.id = "DisbandDisclaimer"

	var_20_41:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_20_41:SetAlpha(0, 0)
	var_20_41:setText(Engine.CBBHFCGDIC("LUA_MENU/UPSELL_PURCHASE_DISBAND_DISCLAIMER"), 0)
	var_20_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_41:SetAlignment(LUI.Alignment.Center)
	var_20_41:SetVerticalAlignment(LUI.Alignment.Center)
	var_20_41:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -768, _1080p * 768, _1080p * 335, _1080p * 359)
	var_20_0:addElement(var_20_41)

	var_20_0.DisbandDisclaimer = var_20_41

	local var_20_42
	local var_20_43 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_20_1
	})

	var_20_43.id = "GridScrollPrompt"

	var_20_43:SetAlpha(0, 0)

	if CONDITIONS.AlwaysFalse(var_20_0) then
		var_20_43.Label:setText("ButtonPrompt", 0)
	end

	var_20_43:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 630, _1080p * 730, _1080p * 399, _1080p * 439)
	var_20_0:addElement(var_20_43)

	var_20_0.GridScrollPrompt = var_20_43

	local var_20_44
	local var_20_45 = LUI.UIStyledText.new()

	var_20_45.id = "AvailableNow"

	var_20_45:SetAlpha(0, 0)
	var_20_45:setText(Engine.CBBHFCGDIC("STORE/AVAILABLE_NOW"), 0)
	var_20_45:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_45:SetAlignment(LUI.Alignment.Right)
	var_20_45:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_20_45:SetStartupDelay(2000)
	var_20_45:SetLineHoldTime(400)
	var_20_45:SetAnimMoveTime(2000)
	var_20_45:SetAnimMoveSpeed(150)
	var_20_45:SetEndDelay(2000)
	var_20_45:SetCrossfadeTime(250)
	var_20_45:SetFadeInTime(300)
	var_20_45:SetFadeOutTime(300)
	var_20_45:SetMaxVisibleLines(1)
	var_20_45:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 192, _1080p * -991, _1080p * 654, _1080p * 674)
	var_20_0:addElement(var_20_45)

	var_20_0.AvailableNow = var_20_45

	local var_20_46
	local var_20_47 = LUI.UIStyledText.new()

	var_20_47.id = "AvailableLaunch"

	var_20_47:SetAlpha(0, 0)
	var_20_47:setText(Engine.CBBHFCGDIC("STORE/AVAILABLE_NOW"), 0)
	var_20_47:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_47:SetAlignment(LUI.Alignment.Right)
	var_20_47:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_20_47:SetStartupDelay(2000)
	var_20_47:SetLineHoldTime(400)
	var_20_47:SetAnimMoveTime(2000)
	var_20_47:SetAnimMoveSpeed(150)
	var_20_47:SetEndDelay(2000)
	var_20_47:SetCrossfadeTime(250)
	var_20_47:SetFadeInTime(300)
	var_20_47:SetFadeOutTime(300)
	var_20_47:SetMaxVisibleLines(1)
	var_20_47:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 978, _1080p * -205, _1080p * 654, _1080p * 674)
	var_20_0:addElement(var_20_47)

	var_20_0.AvailableLaunch = var_20_47

	local var_20_48
	local var_20_49 = LUI.UIImage.new()

	var_20_49.id = "TitleImage"

	var_20_49:SetAlpha(0, 0)
	var_20_49:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_20_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 642, _1080p * 170, _1080p * 426)
	var_20_0:addElement(var_20_49)

	var_20_0.TitleImage = var_20_49

	local var_20_50
	local var_20_51 = LUI.UIImage.new()

	var_20_51.id = "TitleMask"

	var_20_51:SetAlpha(0, 0)
	var_20_51:setImage(RegisterMaterial("stencil_mask"), 0)
	var_20_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 642, _1080p * 170, _1080p * 397)
	var_20_0:addElement(var_20_51)

	var_20_0.TitleMask = var_20_51

	local function var_20_52()
		return
	end

	var_20_0._sequences.DefaultSequence = var_20_52

	local var_20_53
	local var_20_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 643
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 679
		},
		{
			value = false,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		}
	}

	var_20_17:RegisterAnimationSequence("AR", var_20_54)

	local function var_20_55()
		var_20_17:AnimateSequence("AR")
	end

	var_20_0._sequences.AR = var_20_55

	local var_20_56
	local var_20_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_20_0.GenericPopupWindow.PopupBackground
		}
	}

	var_20_6:RegisterAnimationSequence("TitleID", var_20_57)

	local var_20_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 512
		}
	}

	var_20_8:RegisterAnimationSequence("TitleID", var_20_58)

	local var_20_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BONUS_REWARDS"),
			child = var_20_0.ItemGridBackground.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 782
		}
	}

	var_20_12:RegisterAnimationSequence("TitleID", var_20_59)

	local var_20_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("TitleID", var_20_60)

	local var_20_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 587
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 607
		}
	}

	var_20_17:RegisterAnimationSequence("TitleID", var_20_61)

	local var_20_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_19:RegisterAnimationSequence("TitleID", var_20_62)

	local var_20_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_23:RegisterAnimationSequence("TitleID", var_20_63)

	local var_20_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("TitleID", var_20_64)

	local var_20_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_29:RegisterAnimationSequence("TitleID", var_20_65)

	local var_20_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_31:RegisterAnimationSequence("TitleID", var_20_66)

	local var_20_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_43:RegisterAnimationSequence("TitleID", var_20_67)

	local function var_20_68()
		var_20_6:AnimateSequence("TitleID")
		var_20_8:AnimateSequence("TitleID")
		var_20_12:AnimateSequence("TitleID")
		var_20_15:AnimateSequence("TitleID")
		var_20_17:AnimateSequence("TitleID")
		var_20_19:AnimateSequence("TitleID")
		var_20_23:AnimateSequence("TitleID")
		var_20_26:AnimateSequence("TitleID")
		var_20_29:AnimateSequence("TitleID")
		var_20_31:AnimateSequence("TitleID")
		var_20_43:AnimateSequence("TitleID")
	end

	var_20_0._sequences.TitleID = var_20_68

	local var_20_69
	local var_20_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -151
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -719
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 719
		}
	}

	var_20_6:RegisterAnimationSequence("CODPoints", var_20_70)

	local var_20_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -717
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -149
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -224
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 149
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cod_purchase_complete_image")
		}
	}

	var_20_8:RegisterAnimationSequence("CODPoints", var_20_71)

	local var_20_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_12:RegisterAnimationSequence("CODPoints", var_20_72)

	local var_20_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("CODPoints", var_20_73)

	local var_20_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_17:RegisterAnimationSequence("CODPoints", var_20_74)

	local var_20_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 135
		}
	}

	var_20_19:RegisterAnimationSequence("CODPoints", var_20_75)

	local var_20_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -80
		}
	}

	var_20_21:RegisterAnimationSequence("CODPoints", var_20_76)

	local var_20_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_23:RegisterAnimationSequence("CODPoints", var_20_77)

	local var_20_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("CODPoints", var_20_78)

	local var_20_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		}
	}

	var_20_37:RegisterAnimationSequence("CODPoints", var_20_79)

	local var_20_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		}
	}

	var_20_39:RegisterAnimationSequence("CODPoints", var_20_80)

	local function var_20_81()
		var_20_6:AnimateSequence("CODPoints")
		var_20_8:AnimateSequence("CODPoints")
		var_20_12:AnimateSequence("CODPoints")
		var_20_15:AnimateSequence("CODPoints")
		var_20_17:AnimateSequence("CODPoints")
		var_20_19:AnimateSequence("CODPoints")
		var_20_21:AnimateSequence("CODPoints")
		var_20_23:AnimateSequence("CODPoints")
		var_20_26:AnimateSequence("CODPoints")
		var_20_37:AnimateSequence("CODPoints")
		var_20_39:AnimateSequence("CODPoints")
	end

	var_20_0._sequences.CODPoints = var_20_81

	local var_20_82
	local var_20_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -860
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 860
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -486
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 456
		}
	}

	var_20_6:RegisterAnimationSequence("ItemList", var_20_83)

	local var_20_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -386
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_8:RegisterAnimationSequence("ItemList", var_20_84)

	local var_20_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 380
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/NEW_REWARDS"),
			child = var_20_0.ItemGridBackground.Text
		}
	}

	var_20_12:RegisterAnimationSequence("ItemList", var_20_85)

	local var_20_86 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -715
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 715
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 158
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 370
		}
	}

	var_20_15:RegisterAnimationSequence("ItemList", var_20_86)

	local var_20_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_17:RegisterAnimationSequence("ItemList", var_20_87)

	local var_20_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_19:RegisterAnimationSequence("ItemList", var_20_88)

	local var_20_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -830
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 830
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -466
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -406
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_20_21:RegisterAnimationSequence("ItemList", var_20_89)

	local var_20_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_23:RegisterAnimationSequence("ItemList", var_20_90)

	local var_20_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -682
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 682
		}
	}

	var_20_26:RegisterAnimationSequence("ItemList", var_20_91)

	local var_20_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 439
		}
	}

	var_20_37:RegisterAnimationSequence("ItemList", var_20_92)

	local var_20_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 399
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 437
		}
	}

	var_20_39:RegisterAnimationSequence("ItemList", var_20_93)

	local function var_20_94()
		var_20_6:AnimateSequence("ItemList")
		var_20_8:AnimateSequence("ItemList")
		var_20_12:AnimateSequence("ItemList")
		var_20_15:AnimateSequence("ItemList")
		var_20_17:AnimateSequence("ItemList")
		var_20_19:AnimateSequence("ItemList")
		var_20_21:AnimateSequence("ItemList")
		var_20_23:AnimateSequence("ItemList")
		var_20_26:AnimateSequence("ItemList")
		var_20_37:AnimateSequence("ItemList")
		var_20_39:AnimateSequence("ItemList")
	end

	var_20_0._sequences.ItemList = var_20_94

	local var_20_95
	local var_20_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -230
		}
	}

	var_20_6:RegisterAnimationSequence("SingleItem", var_20_96)

	local var_20_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -122
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 134
		}
	}

	var_20_8:RegisterAnimationSequence("SingleItem", var_20_97)

	local var_20_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_12:RegisterAnimationSequence("SingleItem", var_20_98)

	local var_20_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("SingleItem", var_20_99)

	local var_20_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_17:RegisterAnimationSequence("SingleItem", var_20_100)

	local var_20_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
		}
	}

	var_20_19:RegisterAnimationSequence("SingleItem", var_20_101)

	local var_20_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -135
		}
	}

	var_20_21:RegisterAnimationSequence("SingleItem", var_20_102)

	local var_20_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_23:RegisterAnimationSequence("SingleItem", var_20_103)

	local var_20_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("SingleItem", var_20_104)

	local var_20_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 186
		}
	}

	var_20_37:RegisterAnimationSequence("SingleItem", var_20_105)

	local var_20_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 186
		}
	}

	var_20_39:RegisterAnimationSequence("SingleItem", var_20_106)

	local function var_20_107()
		var_20_6:AnimateSequence("SingleItem")
		var_20_8:AnimateSequence("SingleItem")
		var_20_12:AnimateSequence("SingleItem")
		var_20_15:AnimateSequence("SingleItem")
		var_20_17:AnimateSequence("SingleItem")
		var_20_19:AnimateSequence("SingleItem")
		var_20_21:AnimateSequence("SingleItem")
		var_20_23:AnimateSequence("SingleItem")
		var_20_26:AnimateSequence("SingleItem")
		var_20_37:AnimateSequence("SingleItem")
		var_20_39:AnimateSequence("SingleItem")
	end

	var_20_0._sequences.SingleItem = var_20_107

	local var_20_108
	local var_20_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 864
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -867
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -410
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_20_0.GenericPopupWindow.PopupBackground
		}
	}

	var_20_6:RegisterAnimationSequence("Preview", var_20_109)

	local var_20_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -545
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 479
		}
	}

	var_20_8:RegisterAnimationSequence("Preview", var_20_110)

	local var_20_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BONUS_REWARDS"),
			child = var_20_0.ItemGridBackground.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 782
		}
	}

	var_20_12:RegisterAnimationSequence("Preview", var_20_111)

	local var_20_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("Preview", var_20_112)

	local var_20_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 590
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 610
		}
	}

	var_20_17:RegisterAnimationSequence("Preview", var_20_113)

	local var_20_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_19:RegisterAnimationSequence("Preview", var_20_114)

	local var_20_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_23:RegisterAnimationSequence("Preview", var_20_115)

	local var_20_116 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("Preview", var_20_116)

	local var_20_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_29:RegisterAnimationSequence("Preview", var_20_117)

	local var_20_118 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 738
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 730
		}
	}

	var_20_31:RegisterAnimationSequence("Preview", var_20_118)

	local var_20_119 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_35:RegisterAnimationSequence("Preview", var_20_119)

	local var_20_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_37:RegisterAnimationSequence("Preview", var_20_120)

	local var_20_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_39:RegisterAnimationSequence("Preview", var_20_121)

	local var_20_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_43:RegisterAnimationSequence("Preview", var_20_122)

	local function var_20_123()
		var_20_6:AnimateSequence("Preview")
		var_20_8:AnimateSequence("Preview")
		var_20_12:AnimateSequence("Preview")
		var_20_15:AnimateSequence("Preview")
		var_20_17:AnimateSequence("Preview")
		var_20_19:AnimateSequence("Preview")
		var_20_23:AnimateSequence("Preview")
		var_20_26:AnimateSequence("Preview")
		var_20_29:AnimateSequence("Preview")
		var_20_31:AnimateSequence("Preview")
		var_20_35:AnimateSequence("Preview")
		var_20_37:AnimateSequence("Preview")
		var_20_39:AnimateSequence("Preview")
		var_20_43:AnimateSequence("Preview")
	end

	var_20_0._sequences.Preview = var_20_123

	local var_20_124
	local var_20_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 864
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -867
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -410
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_20_0.GenericPopupWindow.PopupBackground
		}
	}

	var_20_6:RegisterAnimationSequence("PreviewAR", var_20_125)

	local var_20_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -545
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 479
		}
	}

	var_20_8:RegisterAnimationSequence("PreviewAR", var_20_126)

	local var_20_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BONUS_REWARDS"),
			child = var_20_0.ItemGridBackground.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 782
		}
	}

	var_20_12:RegisterAnimationSequence("PreviewAR", var_20_127)

	local var_20_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("PreviewAR", var_20_128)

	local var_20_129 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 585
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 615
		}
	}

	var_20_17:RegisterAnimationSequence("PreviewAR", var_20_129)

	local var_20_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_19:RegisterAnimationSequence("PreviewAR", var_20_130)

	local var_20_131 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_23:RegisterAnimationSequence("PreviewAR", var_20_131)

	local var_20_132 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("PreviewAR", var_20_132)

	local var_20_133 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_29:RegisterAnimationSequence("PreviewAR", var_20_133)

	local var_20_134 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 738
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 730
		}
	}

	var_20_31:RegisterAnimationSequence("PreviewAR", var_20_134)

	local var_20_135 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_35:RegisterAnimationSequence("PreviewAR", var_20_135)

	local var_20_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_37:RegisterAnimationSequence("PreviewAR", var_20_136)

	local var_20_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_39:RegisterAnimationSequence("PreviewAR", var_20_137)

	local function var_20_138()
		var_20_6:AnimateSequence("PreviewAR")
		var_20_8:AnimateSequence("PreviewAR")
		var_20_12:AnimateSequence("PreviewAR")
		var_20_15:AnimateSequence("PreviewAR")
		var_20_17:AnimateSequence("PreviewAR")
		var_20_19:AnimateSequence("PreviewAR")
		var_20_23:AnimateSequence("PreviewAR")
		var_20_26:AnimateSequence("PreviewAR")
		var_20_29:AnimateSequence("PreviewAR")
		var_20_31:AnimateSequence("PreviewAR")
		var_20_35:AnimateSequence("PreviewAR")
		var_20_37:AnimateSequence("PreviewAR")
		var_20_39:AnimateSequence("PreviewAR")
	end

	var_20_0._sequences.PreviewAR = var_20_138

	local var_20_139
	local var_20_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -452
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_20_6:RegisterAnimationSequence("ZeusTitle", var_20_140)

	local var_20_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 860
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -860
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -376
		}
	}

	var_20_8:RegisterAnimationSequence("ZeusTitle", var_20_141)

	local var_20_142 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_10:RegisterAnimationSequence("ZeusTitle", var_20_142)

	local var_20_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("STORE/MW_WZ_REWARDS"),
			child = var_20_0.ItemGridBackground.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 346
		}
	}

	var_20_12:RegisterAnimationSequence("ZeusTitle", var_20_143)

	local var_20_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 336
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -745
		}
	}

	var_20_15:RegisterAnimationSequence("ZeusTitle", var_20_144)

	local var_20_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 196
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 578
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -196
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 602
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("STORE/ZEUS_NOTE_AVAILABLE_AT_LAUNCH")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Top
		}
	}

	var_20_17:RegisterAnimationSequence("ZeusTitle", var_20_145)

	local var_20_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -436
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -376
		}
	}

	var_20_21:RegisterAnimationSequence("ZeusTitle", var_20_146)

	local var_20_147 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 346
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("STORE/ZEUS_REWARDS"),
			child = var_20_0.TitleIDGridBackground.Text
		}
	}

	var_20_23:RegisterAnimationSequence("ZeusTitle", var_20_147)

	local var_20_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 744
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 316
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("ZeusTitle", var_20_148)

	local var_20_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 248
		}
	}

	var_20_31:RegisterAnimationSequence("ZeusTitle", var_20_149)

	local var_20_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1008
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1068
		}
	}

	var_20_33:RegisterAnimationSequence("ZeusTitle", var_20_150)

	local var_20_151 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 900
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 950
		}
	}

	var_20_35:RegisterAnimationSequence("ZeusTitle", var_20_151)

	local var_20_152 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 402
		}
	}

	var_20_37:RegisterAnimationSequence("ZeusTitle", var_20_152)

	local var_20_153 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 364
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 402
		}
	}

	var_20_39:RegisterAnimationSequence("ZeusTitle", var_20_153)

	local var_20_154 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 316
		}
	}

	var_20_41:RegisterAnimationSequence("ZeusTitle", var_20_154)

	local var_20_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 356
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 396
		}
	}

	var_20_43:RegisterAnimationSequence("ZeusTitle", var_20_155)

	local var_20_156 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 644
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 664
		}
	}

	var_20_45:RegisterAnimationSequence("ZeusTitle", var_20_156)

	local var_20_157 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 644
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 664
		}
	}

	var_20_47:RegisterAnimationSequence("ZeusTitle", var_20_157)

	local var_20_158 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 456
		}
	}

	var_20_49:RegisterAnimationSequence("ZeusTitle", var_20_158)

	local function var_20_159()
		var_20_6:AnimateSequence("ZeusTitle")
		var_20_8:AnimateSequence("ZeusTitle")
		var_20_10:AnimateSequence("ZeusTitle")
		var_20_12:AnimateSequence("ZeusTitle")
		var_20_15:AnimateSequence("ZeusTitle")
		var_20_17:AnimateSequence("ZeusTitle")
		var_20_21:AnimateSequence("ZeusTitle")
		var_20_23:AnimateSequence("ZeusTitle")
		var_20_26:AnimateSequence("ZeusTitle")
		var_20_31:AnimateSequence("ZeusTitle")
		var_20_33:AnimateSequence("ZeusTitle")
		var_20_35:AnimateSequence("ZeusTitle")
		var_20_37:AnimateSequence("ZeusTitle")
		var_20_39:AnimateSequence("ZeusTitle")
		var_20_41:AnimateSequence("ZeusTitle")
		var_20_43:AnimateSequence("ZeusTitle")
		var_20_45:AnimateSequence("ZeusTitle")
		var_20_47:AnimateSequence("ZeusTitle")
		var_20_49:AnimateSequence("ZeusTitle")
	end

	var_20_0._sequences.ZeusTitle = var_20_159

	local var_20_160
	local var_20_161 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_35:RegisterAnimationSequence("ZeusPreview", var_20_161)

	local var_20_162 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_37:RegisterAnimationSequence("ZeusPreview", var_20_162)

	local var_20_163 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_39:RegisterAnimationSequence("ZeusPreview", var_20_163)

	local function var_20_164()
		var_20_35:AnimateSequence("ZeusPreview")
		var_20_37:AnimateSequence("ZeusPreview")
		var_20_39:AnimateSequence("ZeusPreview")
	end

	var_20_0._sequences.ZeusPreview = var_20_164

	local var_20_165
	local var_20_166 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -830
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		}
	}

	var_20_15:RegisterAnimationSequence("ARZeusPreview", var_20_166)

	local function var_20_167()
		var_20_15:AnimateSequence("ARZeusPreview")
	end

	var_20_0._sequences.ARZeusPreview = var_20_167

	local var_20_168
	local var_20_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 615
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -628
		}
	}

	var_20_12:RegisterAnimationSequence("ZeusGeneric", var_20_169)

	local var_20_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 604
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -575
		}
	}

	var_20_15:RegisterAnimationSequence("ZeusGeneric", var_20_170)

	local var_20_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 332
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -345
		}
	}

	var_20_17:RegisterAnimationSequence("ZeusGeneric", var_20_171)

	local var_20_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_23:RegisterAnimationSequence("ZeusGeneric", var_20_172)

	local var_20_173 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_26:RegisterAnimationSequence("ZeusGeneric", var_20_173)

	local var_20_174 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -376
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 332
		}
	}

	var_20_45:RegisterAnimationSequence("ZeusGeneric", var_20_174)

	local var_20_175 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1072
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -299
		}
	}

	var_20_47:RegisterAnimationSequence("ZeusGeneric", var_20_175)

	local var_20_176 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_51:RegisterAnimationSequence("ZeusGeneric", var_20_176)

	local function var_20_177()
		var_20_12:AnimateSequence("ZeusGeneric")
		var_20_15:AnimateSequence("ZeusGeneric")
		var_20_17:AnimateSequence("ZeusGeneric")
		var_20_23:AnimateSequence("ZeusGeneric")
		var_20_26:AnimateSequence("ZeusGeneric")
		var_20_45:AnimateSequence("ZeusGeneric")
		var_20_47:AnimateSequence("ZeusGeneric")
		var_20_51:AnimateSequence("ZeusGeneric")
	end

	var_20_0._sequences.ZeusGeneric = var_20_177

	local var_20_178
	local var_20_179 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_12:RegisterAnimationSequence("ZeusLaunch", var_20_179)

	local var_20_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_15:RegisterAnimationSequence("ZeusLaunch", var_20_180)

	local var_20_181 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_17:RegisterAnimationSequence("ZeusLaunch", var_20_181)

	local var_20_182 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 349
		}
	}

	var_20_23:RegisterAnimationSequence("ZeusLaunch", var_20_182)

	local var_20_183 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -325
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 325
		}
	}

	var_20_26:RegisterAnimationSequence("ZeusLaunch", var_20_183)

	local var_20_184 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_45:RegisterAnimationSequence("ZeusLaunch", var_20_184)

	local var_20_185 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 559
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -624
		}
	}

	var_20_47:RegisterAnimationSequence("ZeusLaunch", var_20_185)

	local function var_20_186()
		var_20_12:AnimateSequence("ZeusLaunch")
		var_20_15:AnimateSequence("ZeusLaunch")
		var_20_17:AnimateSequence("ZeusLaunch")
		var_20_23:AnimateSequence("ZeusLaunch")
		var_20_26:AnimateSequence("ZeusLaunch")
		var_20_45:AnimateSequence("ZeusLaunch")
		var_20_47:AnimateSequence("ZeusLaunch")
	end

	var_20_0._sequences.ZeusLaunch = var_20_186

	var_20_35:addEventHandler("button_action", function(arg_40_0, arg_40_1)
		local var_40_0 = arg_40_1.controller or var_20_1

		ACTIONS.OpenPopupMenu(var_20_0, "StoreGameUpsellPopup", true, var_40_0)
		ACTIONS.LeaveMenu(var_20_0)
	end)

	local var_20_187 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_20_31,
		startCap = var_20_31.startCap,
		endCap = var_20_31.endCap,
		sliderArea = var_20_31.sliderArea,
		slider = var_20_31.sliderArea and var_20_31.sliderArea.slider,
		fixedSizeSlider = var_20_31.sliderArea and var_20_31.sliderArea.fixedSizeSlider
	})

	var_20_29:AddScrollbar(var_20_187)
	var_0_11(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("ItemExchangePopup", ItemExchangePopup)
LockTable(_M)
