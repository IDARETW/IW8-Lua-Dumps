module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("StoreGameUpsellPopup", {
	"store",
	"fenceSpinner",
	"exchange"
})

local var_0_0 = {
	[STORE.GameUpsellStandardID] = "magma_upsell_billboard_standard",
	[STORE.GameUpsellStandardIDSIEE] = "magma_upsell_billboard_standard",
	[STORE.GameUpsellEnhancedID] = "magma_upsell_billboard_battlepass"
}

local function var_0_1()
	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end
end

local function var_0_2(arg_2_0)
	return STORE.IsZeusTrialProduct(arg_2_0) or STORE.IsVanguardProduct(arg_2_0)
end

local function var_0_3(arg_3_0, arg_3_1)
	assert(arg_3_0.Grid)

	local var_3_0 = false
	local var_3_1 = STORE.GetGameUpsellProducts(arg_3_1)

	if arg_3_0._isVanguard then
		var_3_1 = STORE.GetVanguardCategoryData(arg_3_1)
	elseif arg_3_0._isZeus then
		var_3_1 = STORE.GetZeusCategoryData(arg_3_1)
	end

	if var_3_1 and #var_3_1 > 0 then
		for iter_3_0, iter_3_1 in ipairs(var_3_1) do
			iter_3_1.itemIndex = iter_3_0
			iter_3_1.owned = false
			iter_3_1.isFirstParty = true
			iter_3_1.image = iter_3_1.image == "" and "placeholder_x" or iter_3_1.image
			iter_3_1.leavePartyAndLobbyOnPurchase = arg_3_0._leavePartyAndLobbyOnPurchase
		end

		local function var_3_2(arg_4_0, arg_4_1, arg_4_2)
			local var_4_0 = arg_3_0.Grid:GetContentIndex(arg_4_1, arg_4_2)

			arg_4_0:SetButtonData(var_3_1[var_4_0 + 1])

			if not arg_4_0.handlersAdded then
				arg_4_0:addEventHandler("gain_focus", function(arg_5_0, arg_5_1)
					if arg_5_0._buttonData then
						arg_3_0:SetupPopupData(arg_5_0._buttonData)
					end
				end)
				arg_4_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
					if Engine.CIEGIACHAE() then
						InGameStore.ShowStoreIcon(false)
					end
				end)

				arg_4_0.handlersAdded = true
			end
		end

		arg_3_0.Grid:SetRefreshChild(var_3_2)
		arg_3_0.Grid:SetNumChildren(#var_3_1)
		arg_3_0.Grid:RefreshContent()

		local function var_3_3()
			for iter_7_0, iter_7_1 in ipairs(var_3_1) do
				if iter_7_1.productId == arg_3_0._defaultProductId then
					return {
						y = 0,
						x = iter_7_0 - 1
					}
				end
			end
		end

		arg_3_0.Grid:SetDefaultFocus(var_3_3)
		arg_3_0:processEvent({
			name = "lose_focus"
		})
		arg_3_0:processEvent({
			name = "gain_focus"
		})

		var_3_0 = true
	end

	if var_3_0 then
		if (arg_3_0._defaultProductId == nil or not var_0_2(arg_3_0._defaultProductId)) and arg_3_0.ButtonHelperBar.ButtonHelperText:GetPromptByButtonRef("button_alt1") == nil then
			arg_3_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_CONTENT")
			})
		end

		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
		end
	else
		arg_3_0._noItemsAdded = true

		ACTIONS.AnimateSequence(arg_3_0, "NoItems")
	end
end

local function var_0_4(arg_8_0, arg_8_1)
	local var_8_0

	var_8_0 = arg_8_0._preFetched == true

	InGameStore.FetchCatalog(arg_8_1, true, true)
	ACTIONS.AnimateSequence(arg_8_0, "ShowFetching")

	local var_8_1 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "update_fetching_store",
			controllerIndex = arg_8_1
		}
	})

	var_8_1.id = "fetchingTimer"

	arg_8_0:addElement(var_8_1)

	arg_8_0._fetchingTimer = var_8_1

	arg_8_0:registerEventHandler("update_fetching_store", function(arg_9_0, arg_9_1)
		local var_9_0 = InGameStore.GetCatalogStatus(arg_8_1)
		local var_9_1 = false

		if var_9_0 == InGameStoreCatalogStatus.READY then
			var_0_3(arg_8_0, arg_8_1)

			if arg_8_0._isZeus and STORE.AreZeusLaunchProductsEnabled() then
				arg_8_0._preOwnsZeusStandard = STORE.IsZeusProductOwned(arg_8_1, STORE.ZeusStandardID)
				arg_8_0._preOwnsZeusCrossGen = STORE.IsZeusProductOwned(arg_8_1, STORE.ZeusCrossGenID)
				arg_8_0._preOwnsZeusUltimate = STORE.IsZeusProductOwned(arg_8_1, STORE.ZeusUltimateID)
			end

			var_9_1 = true
		elseif var_9_0 == InGameStoreCatalogStatus.ERROR then
			var_9_1 = true

			local var_9_2 = {}

			if Engine.DBFCJBDJEC() then
				local var_9_3 = Engine.BIAFEJHHDD()

				if var_9_3 ~= nil then
					local var_9_4 = Engine.JCBDICCAH(var_9_3)

					var_9_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_9_4)

					Engine.DCFIDJGACA()
				else
					var_9_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_9_5 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				var_9_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_9_5)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_9_2, nil, false, true)
			Engine.DHCGHHBHCH()
			LUI.FlowManager.RequestLeaveMenu(arg_9_0)
		end

		if var_9_1 then
			if arg_8_0._isZeusOrVanguard then
				ACTIONS.AnimateSequence(arg_9_0, arg_8_0._noItemsAdded == true and "ZeusNoItems" or "Zeus")
			else
				ACTIONS.AnimateSequence(arg_9_0, "HideFetching")
			end

			local var_9_6 = "MENU/PREORDER_TITLE"

			if arg_8_0._isZeusOrVanguard then
				var_9_6 = "MENU/COMMERCE_PURCHASE"
			end

			arg_8_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(var_9_6))

			if Dvar.IBEGCHEFE("NKSSSTTRPN") then
				arg_8_0.SKUDescription:SetAlpha(1)
			end

			arg_8_0.Grid:SetAlpha(1)

			if arg_8_0._leavePartyAndLobbyOnPurchase then
				arg_8_0.DisbandDisclaimer:SetAlpha(1)
			end

			arg_9_0._fetchingTimer:closeTree()

			arg_9_0._fetchingTimer = nil
		end
	end)
end

local function var_0_5(arg_10_0, arg_10_1)
	if arg_10_1.productId and var_0_2(arg_10_1.productId) then
		arg_10_0.ButtonHelperBar.ButtonHelperText:RemoveButtonPrompt("button_alt1")
	elseif arg_10_0.ButtonHelperBar.ButtonHelperText:GetPromptByButtonRef("button_alt1") == nil then
		arg_10_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_CONTENT")
		})
	end

	arg_10_0.ButtonHelperBar.ButtonHelperText:RemoveButtonPrompt("button_primary")

	if arg_10_1.price then
		arg_10_0.Price.Amount:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_PRICE", Engine.JCBDICCAH(arg_10_1.price)), 0)
	end

	arg_10_0.Description:setText(arg_10_1.contentLong, 0)

	arg_10_0.currentButtonData = arg_10_1

	local var_10_0 = arg_10_0._isZeusOrVanguard and arg_10_1.image or var_0_0[arg_10_1.productId]

	if var_10_0 and #var_10_0 > 0 then
		arg_10_0.BG:SetAlpha(1)
		arg_10_0.BG:setImage(RegisterMaterial(var_10_0))
	else
		assert(false, "Invalid BG Image for productID, " .. arg_10_1.productId)
		arg_10_0.BG:SetAlpha(0)
	end

	if arg_10_0._isZeusOrVanguard then
		local var_10_1 = arg_10_1.titleImage

		if var_10_1 and #var_10_1 > 0 then
			arg_10_0.TitleImage:setImage(RegisterMaterial(var_10_1))
		end
	end
end

local function var_0_6(arg_11_0, arg_11_1)
	if arg_11_0.Grid then
		return
	end

	local var_11_0
	local var_11_1 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = arg_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType(arg_11_0._isZeusOrVanguard and "StoreBillboardSKUButton" or "TitleIDItemButton", {
				controllerIndex = arg_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		spacingX = _1080p * (arg_11_0._isZeusOrVanguard and 10 or 40),
		spacingY = _1080p * (arg_11_0._isZeusOrVanguard and 10 or 40),
		columnWidth = _1080p * (arg_11_0._isZeusOrVanguard and 320 or 307),
		rowHeight = _1080p * (arg_11_0._isZeusOrVanguard and 120 or 153),
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = arg_11_0._isZeusOrVanguard and LUI.Alignment.Top or LUI.Alignment.Bottom
	}
	local var_11_2 = LUI.UIGrid.new(var_11_1)

	var_11_2.id = "Grid"

	var_11_2:SetAlpha(0, 0)
	var_11_2:setUseStencil(true)
	var_11_2:SetAnchorsAndPosition(0, 1, arg_11_0._isZeusOrVanguard and 0 or 0.5, arg_11_0._isZeusOrVanguard and 1 or 0.5, _1080p * (arg_11_0._isZeusOrVanguard and 130 or 165), _1080p * 1727, _1080p * (arg_11_0._isZeusOrVanguard and 751 or 203), _1080p * (arg_11_0._isZeusOrVanguard and 896 or 356))
	arg_11_0:addElement(var_11_2)

	arg_11_0.Grid = var_11_2

	arg_11_0.Grid:SetNumChildren(0)
	arg_11_0.Grid:SetAlpha(0)
end

local function var_0_7(arg_14_0, arg_14_1)
	local var_14_0 = STORE.IsZeusProductOwned(arg_14_1, STORE.ZeusStandardID)
	local var_14_1 = STORE.IsZeusProductOwned(arg_14_1, STORE.ZeusCrossGenID)
	local var_14_2 = STORE.IsZeusProductOwned(arg_14_1, STORE.ZeusUltimateID)
	local var_14_3 = arg_14_0._preOwnsZeusStandard == false and var_14_0
	local var_14_4 = arg_14_0._preOwnsZeusCrossGen == false and var_14_1
	local var_14_5 = arg_14_0._preOwnsZeusUltimate == false and var_14_2

	if var_14_3 or var_14_4 or var_14_5 then
		local var_14_6

		if var_14_5 then
			var_14_6 = STORE.ZeusTitleIDs.ZEUS_ULTIMATE
		elseif var_14_4 or var_14_3 then
			var_14_6 = STORE.ZeusTitleIDs.ZEUS_STANDARD
		end

		LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangePopup", false, arg_14_1, false, {
			itemID = var_14_6,
			leavePartyAndLobbyOnPurchase = arg_14_0._leavePartyAndLobbyOnPurchase
		})
		LUI.FlowManager.RequestLeaveMenu(arg_14_0)
	end
end

local function var_0_8(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.currentButtonData = nil
	arg_15_0._leavePartyAndLobbyOnPurchase = arg_15_2.leavePartyAndLobbyOnPurchase
	arg_15_0._defaultProductId = arg_15_2.defaultProductId
	arg_15_0._isZeus = arg_15_2.isZeus
	arg_15_0._isVanguard = arg_15_2.isVanguard
	arg_15_0._isZeusOrVanguard = arg_15_2.isZeus or arg_15_2.isVanguard
	arg_15_0._isVanguardTrialEvent = arg_15_2._isVanguardTrialEvent
	arg_15_0._preFetched = arg_15_2.preFetched
	arg_15_0._fromPlaylistEventButton = arg_15_2.fromPlaylistEventButton
	arg_15_0.SetupPopupData = var_0_5

	var_0_6(arg_15_0, arg_15_1)
	arg_15_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_0_4(arg_15_0, arg_15_1)
	arg_15_0:addEventHandler("exchanged_item", function(arg_16_0, arg_16_1)
		LUI.FlowManager.RequestLeaveMenu(arg_16_0)
	end)
	ACTIONS.ScaleFullscreen(arg_15_0.Darkener)
	arg_15_0.bindButton:addEventHandler("button_alt1", function(arg_17_0, arg_17_1)
		if arg_15_0.currentButtonData and (arg_15_0.currentButtonData.productId == nil or not var_0_2(arg_15_0.currentButtonData.productId)) then
			local var_17_0 = arg_17_1.controller or arg_15_1
			local var_17_1

			if arg_15_0._isZeus then
				var_17_1 = STORE.GetZeusTitleIDForProduct(arg_15_0.currentButtonData.productId)
			elseif not arg_15_0._isVanguard then
				var_17_1 = STORE.GetTitleIDsForCurrentPlatform()[arg_15_0.currentButtonData.itemIndex]
			end

			LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangePopup", false, var_17_0, false, {
				markerItemID = var_17_1,
				purchaseData = arg_15_0.currentButtonData,
				leavePartyAndLobbyOnPurchase = arg_15_0._leavePartyAndLobbyOnPurchase,
				fromPlaylistEventButton = arg_15_0._fromPlaylistEventButton
			})
		end
	end)
	arg_15_0:addEventHandler("restore_focus", function(arg_18_0, arg_18_1)
		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
		end

		if arg_15_0._isZeus and STORE.AreZeusLaunchProductsEnabled() then
			var_0_7(arg_15_0, arg_15_1)
		end
	end)
end

function StoreGameUpsellPopup(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "StoreGameUpsellPopup"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "Darkener"

	var_19_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_4:SetAlpha(0.9, 0)
	var_19_0:addElement(var_19_4)

	var_19_0.Darkener = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "GenericPopupWindow"

	var_19_6.PopupBackground:SetAlpha(1, 0)
	var_19_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -865, _1080p * 865, _1080p * -380, _1080p * 380)
	var_19_0:addElement(var_19_6)

	var_19_0.GenericPopupWindow = var_19_6

	local var_19_7
	local var_19_8 = LUI.UIImage.new()

	var_19_8.id = "BG"

	var_19_8:SetAlpha(0, 0)
	var_19_8:setImage(RegisterMaterial("magma_upsell_billboard_standard"), 0)
	var_19_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1024, _1080p * 1024, _1080p * -532, _1080p * 492)
	var_19_0:addElement(var_19_8)

	var_19_0.BG = var_19_8

	local var_19_9
	local var_19_10 = LUI.UIText.new()

	var_19_10.id = "FetchingStoreLabel"

	var_19_10:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_19_10:SetAlpha(0, 0)
	var_19_10:setText(Engine.CBBHFCGDIC("MENU/FETCHING_STORE_DATA"), 0)
	var_19_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_10:SetAlignment(LUI.Alignment.Center)
	var_19_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * 20, _1080p * 50)
	var_19_0:addElement(var_19_10)

	var_19_0.FetchingStoreLabel = var_19_10

	local var_19_11
	local var_19_12 = LUI.UIImage.new()

	var_19_12.id = "Spinner"

	var_19_12:SetAlpha(0, 0)
	var_19_12:setImage(RegisterMaterial("spinner_loading"), 0)
	var_19_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170.5, _1080p * 169.5, _1080p * 55, _1080p * 65)
	var_19_0:addElement(var_19_12)

	var_19_0.Spinner = var_19_12

	local var_19_13
	local var_19_14 = LUI.UIText.new()

	var_19_14.id = "NoItemsLabel"

	var_19_14:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_19_14:SetAlpha(0, 0)
	var_19_14:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_STORE_ITEMS"), 0)
	var_19_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_14:SetAlignment(LUI.Alignment.Center)
	var_19_14:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * 20, _1080p * 50)
	var_19_0:addElement(var_19_14)

	var_19_0.NoItemsLabel = var_19_14

	local var_19_15
	local var_19_16 = LUI.UIImage.new()

	var_19_16.id = "Smoke"

	var_19_16:SetAlpha(0, 0)
	var_19_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 867, _1080p * 1824, _1080p * 575, _1080p * 916)
	var_19_0:addElement(var_19_16)

	var_19_0.Smoke = var_19_16

	local var_19_17
	local var_19_18 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_19_1
	})

	var_19_18.id = "ButtonHelperBar"

	var_19_18.Background:SetAlpha(0, 0)
	var_19_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 921, _1080p * 981)
	var_19_0:addElement(var_19_18)

	var_19_0.ButtonHelperBar = var_19_18

	local var_19_19
	local var_19_20 = LUI.UIStyledText.new()

	var_19_20.id = "Description"

	var_19_20:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_19_20:SetAlpha(0, 0)
	var_19_20:setText(Engine.CBBHFCGDIC("LUA_MENU/UPSELL_OPERATOR_ENHANCED_DESC"), 0)
	var_19_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_20:SetAlignment(LUI.Alignment.Left)
	var_19_20:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_19_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_19_20:SetStartupDelay(2000)
	var_19_20:SetLineHoldTime(400)
	var_19_20:SetAnimMoveTime(2000)
	var_19_20:SetAnimMoveSpeed(150)
	var_19_20:SetEndDelay(2000)
	var_19_20:SetCrossfadeTime(250)
	var_19_20:SetFadeInTime(300)
	var_19_20:SetFadeOutTime(300)
	var_19_20:SetMaxVisibleLines(4)
	var_19_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 165, _1080p * 829, _1080p * 7, _1080p * 31)
	var_19_0:addElement(var_19_20)

	var_19_0.Description = var_19_20

	local var_19_21
	local var_19_22 = MenuBuilder.BuildRegisteredType("TitleIDPriceButton", {
		controllerIndex = var_19_1
	})

	var_19_22.id = "Price"

	var_19_22:SetAlpha(0, 0)
	var_19_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 165, _1080p * 515, _1080p * 645, _1080p * 695)
	var_19_0:addElement(var_19_22)

	var_19_0.Price = var_19_22

	local var_19_23
	local var_19_24 = LUI.UIText.new()

	var_19_24.id = "DisbandDisclaimer"

	var_19_24:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_19_24:SetAlpha(0, 0)
	var_19_24:setText(Engine.CBBHFCGDIC("LUA_MENU/UPSELL_PURCHASE_DISBAND_DISCLAIMER"), 0)
	var_19_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_24:SetAlignment(LUI.Alignment.Left)
	var_19_24:SetVerticalAlignment(LUI.Alignment.Center)
	var_19_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 525, _1080p * 946, _1080p * 671, _1080p * 699)
	var_19_0:addElement(var_19_24)

	var_19_0.DisbandDisclaimer = var_19_24

	local var_19_25
	local var_19_26 = LUI.UIStyledText.new()

	var_19_26.id = "LocalizedTitle"

	var_19_26:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_19_26:SetAlpha(0, 0)
	var_19_26:setText("", 0)
	var_19_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_26:SetWordWrap(false)
	var_19_26:SetAlignment(LUI.Alignment.Left)
	var_19_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_26:SetStartupDelay(2000)
	var_19_26:SetLineHoldTime(400)
	var_19_26:SetAnimMoveTime(2000)
	var_19_26:SetAnimMoveSpeed(150)
	var_19_26:SetEndDelay(2000)
	var_19_26:SetCrossfadeTime(250)
	var_19_26:SetFadeInTime(300)
	var_19_26:SetFadeOutTime(300)
	var_19_26:SetMaxVisibleLines(1)
	var_19_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 642, _1080p * 496, _1080p * 526)
	var_19_0:addElement(var_19_26)

	var_19_0.LocalizedTitle = var_19_26

	local var_19_27
	local var_19_28 = LUI.UIImage.new()

	var_19_28.id = "TitleImage"

	var_19_28:SetAlpha(0, 0)
	var_19_28:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_19_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 240, _1080p * 496)
	var_19_0:addElement(var_19_28)

	var_19_0.TitleImage = var_19_28

	local var_19_29
	local var_19_30 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_19_1
	})

	var_19_30.id = "MenuTitle"

	var_19_30:SetAlpha(0, 0)
	var_19_30.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PREORDER_TITLE")), 0)
	var_19_30.Line:SetLeft(0, 0)
	var_19_30:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_19_0:addElement(var_19_30)

	var_19_0.MenuTitle = var_19_30

	local var_19_31
	local var_19_32 = LUI.UIStyledText.new()

	var_19_32.id = "SKUDescription"

	var_19_32:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_19_32:SetAlpha(0, 0)
	var_19_32:setText(Engine.CBBHFCGDIC("LUA_MENU/BETA_GO_TO_STORE_DESC"), 0)
	var_19_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_32:SetWordWrap(false)
	var_19_32:SetAlignment(LUI.Alignment.Left)
	var_19_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_32:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_32:SetStartupDelay(2000)
	var_19_32:SetLineHoldTime(400)
	var_19_32:SetAnimMoveTime(2000)
	var_19_32:SetAnimMoveSpeed(150)
	var_19_32:SetEndDelay(2000)
	var_19_32:SetCrossfadeTime(250)
	var_19_32:SetFadeInTime(300)
	var_19_32:SetFadeOutTime(300)
	var_19_32:SetMaxVisibleLines(4)
	var_19_32:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 1824, _1080p * -430, _1080p * -406)
	var_19_0:addElement(var_19_32)

	var_19_0.SKUDescription = var_19_32

	local function var_19_33()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_33

	local var_19_34
	local var_19_35 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("ShowFetching", var_19_35)

	local var_19_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("ShowFetching", var_19_36)

	local var_19_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_8:RegisterAnimationSequence("ShowFetching", var_19_37)

	local var_19_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_10:RegisterAnimationSequence("ShowFetching", var_19_38)

	local var_19_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_12:RegisterAnimationSequence("ShowFetching", var_19_39)

	local var_19_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("ShowFetching", var_19_40)

	local var_19_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_26:RegisterAnimationSequence("ShowFetching", var_19_41)

	local var_19_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_28:RegisterAnimationSequence("ShowFetching", var_19_42)

	local var_19_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_30:RegisterAnimationSequence("ShowFetching", var_19_43)

	local function var_19_44()
		var_19_4:AnimateSequence("ShowFetching")
		var_19_6:AnimateSequence("ShowFetching")
		var_19_8:AnimateSequence("ShowFetching")
		var_19_10:AnimateSequence("ShowFetching")
		var_19_12:AnimateSequence("ShowFetching")
		var_19_20:AnimateSequence("ShowFetching")
		var_19_26:AnimateSequence("ShowFetching")
		var_19_28:AnimateSequence("ShowFetching")
		var_19_30:AnimateSequence("ShowFetching")
	end

	var_19_0._sequences.ShowFetching = var_19_44

	local var_19_45
	local var_19_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_19_0.GenericPopupWindow.PopupBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -868
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 864
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("HideFetching", var_19_46)

	local var_19_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_19_8:RegisterAnimationSequence("HideFetching", var_19_47)

	local var_19_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_10:RegisterAnimationSequence("HideFetching", var_19_48)

	local var_19_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_12:RegisterAnimationSequence("HideFetching", var_19_49)

	local var_19_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1823
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1573
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 379
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_sparks")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_19_16:RegisterAnimationSequence("HideFetching", var_19_50)

	local var_19_51 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 379
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 439
		}
	}

	var_19_18:RegisterAnimationSequence("HideFetching", var_19_51)

	local var_19_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.descText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Bottom
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_19_20:RegisterAnimationSequence("HideFetching", var_19_52)

	local var_19_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 518
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_19_22:RegisterAnimationSequence("HideFetching", var_19_53)

	local var_19_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_26:RegisterAnimationSequence("HideFetching", var_19_54)

	local var_19_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_28:RegisterAnimationSequence("HideFetching", var_19_55)

	local function var_19_56()
		var_19_6:AnimateSequence("HideFetching")
		var_19_8:AnimateSequence("HideFetching")
		var_19_10:AnimateSequence("HideFetching")
		var_19_12:AnimateSequence("HideFetching")
		var_19_16:AnimateSequence("HideFetching")
		var_19_18:AnimateSequence("HideFetching")
		var_19_20:AnimateSequence("HideFetching")
		var_19_22:AnimateSequence("HideFetching")
		var_19_26:AnimateSequence("HideFetching")
		var_19_28:AnimateSequence("HideFetching")
	end

	var_19_0._sequences.HideFetching = var_19_56

	local var_19_57
	local var_19_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("NoItems", var_19_58)

	local var_19_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_14:RegisterAnimationSequence("NoItems", var_19_59)

	local var_19_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("NoItems", var_19_60)

	local var_19_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_22:RegisterAnimationSequence("NoItems", var_19_61)

	local var_19_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_26:RegisterAnimationSequence("NoItems", var_19_62)

	local var_19_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_28:RegisterAnimationSequence("NoItems", var_19_63)

	local function var_19_64()
		var_19_6:AnimateSequence("NoItems")
		var_19_14:AnimateSequence("NoItems")
		var_19_20:AnimateSequence("NoItems")
		var_19_22:AnimateSequence("NoItems")
		var_19_26:AnimateSequence("NoItems")
		var_19_28:AnimateSequence("NoItems")
	end

	var_19_0._sequences.NoItems = var_19_64

	local var_19_65
	local var_19_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("Zeus", var_19_66)

	local var_19_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("Zeus", var_19_67)

	local var_19_68 = {
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
			value = _1080p * 780
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_19_8:RegisterAnimationSequence("Zeus", var_19_68)

	local var_19_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_10:RegisterAnimationSequence("Zeus", var_19_69)

	local var_19_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_12:RegisterAnimationSequence("Zeus", var_19_70)

	local var_19_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_16:RegisterAnimationSequence("Zeus", var_19_71)

	local var_19_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 540
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_19_18:RegisterAnimationSequence("Zeus", var_19_72)

	local var_19_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 530
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 794
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 554
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Top
		}
	}

	var_19_20:RegisterAnimationSequence("Zeus", var_19_73)

	local var_19_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_22:RegisterAnimationSequence("Zeus", var_19_74)

	local var_19_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_26:RegisterAnimationSequence("Zeus", var_19_75)

	local var_19_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_28:RegisterAnimationSequence("Zeus", var_19_76)

	local var_19_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_30:RegisterAnimationSequence("Zeus", var_19_77)

	local function var_19_78()
		var_19_4:AnimateSequence("Zeus")
		var_19_6:AnimateSequence("Zeus")
		var_19_8:AnimateSequence("Zeus")
		var_19_10:AnimateSequence("Zeus")
		var_19_12:AnimateSequence("Zeus")
		var_19_16:AnimateSequence("Zeus")
		var_19_18:AnimateSequence("Zeus")
		var_19_20:AnimateSequence("Zeus")
		var_19_22:AnimateSequence("Zeus")
		var_19_26:AnimateSequence("Zeus")
		var_19_28:AnimateSequence("Zeus")
		var_19_30:AnimateSequence("Zeus")
	end

	var_19_0._sequences.Zeus = var_19_78

	local var_19_79
	local var_19_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("ZeusNoItems", var_19_80)

	local var_19_81 = {
		{
			value = 0,
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
			value = _1080p * 780
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_19_8:RegisterAnimationSequence("ZeusNoItems", var_19_81)

	local var_19_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_10:RegisterAnimationSequence("ZeusNoItems", var_19_82)

	local var_19_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_12:RegisterAnimationSequence("ZeusNoItems", var_19_83)

	local var_19_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_16:RegisterAnimationSequence("ZeusNoItems", var_19_84)

	local var_19_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 540
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_19_18:RegisterAnimationSequence("ZeusNoItems", var_19_85)

	local var_19_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 530
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 794
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 554
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Top
		}
	}

	var_19_20:RegisterAnimationSequence("ZeusNoItems", var_19_86)

	local var_19_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_22:RegisterAnimationSequence("ZeusNoItems", var_19_87)

	local var_19_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_26:RegisterAnimationSequence("ZeusNoItems", var_19_88)

	local var_19_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_28:RegisterAnimationSequence("ZeusNoItems", var_19_89)

	local var_19_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_30:RegisterAnimationSequence("ZeusNoItems", var_19_90)

	local function var_19_91()
		var_19_4:AnimateSequence("ZeusNoItems")
		var_19_8:AnimateSequence("ZeusNoItems")
		var_19_10:AnimateSequence("ZeusNoItems")
		var_19_12:AnimateSequence("ZeusNoItems")
		var_19_16:AnimateSequence("ZeusNoItems")
		var_19_18:AnimateSequence("ZeusNoItems")
		var_19_20:AnimateSequence("ZeusNoItems")
		var_19_22:AnimateSequence("ZeusNoItems")
		var_19_26:AnimateSequence("ZeusNoItems")
		var_19_28:AnimateSequence("ZeusNoItems")
		var_19_30:AnimateSequence("ZeusNoItems")
	end

	var_19_0._sequences.ZeusNoItems = var_19_91

	function var_19_0.addButtonHelperFunction(arg_26_0, arg_26_1)
		arg_26_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_26_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_19_0:addEventHandler("menu_create", var_19_0.addButtonHelperFunction)

	local var_19_92 = LUI.UIBindButton.new()

	var_19_92.id = "selfBindButton"

	var_19_0:addElement(var_19_92)

	var_19_0.bindButton = var_19_92

	var_19_0.bindButton:addEventHandler("button_secondary", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = var_19_1
		end

		ACTIONS.LeaveMenu(var_19_0)
	end)
	var_0_8(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("StoreGameUpsellPopup", StoreGameUpsellPopup)
LUI.FlowManager.RegisterStackPopBehaviour("StoreGameUpsellPopup", var_0_1)
LockTable(_M)
