module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0, arg_1_1)
	return var_0_0(arg_1_0, arg_1_1)
end

MenuBuilder.registerType("MainMenuStore", var_0_1)
MenuBuilder.registerType("MPStore", var_0_1)
MenuBuilder.registerType("CPStore", var_0_1)
LUI.FlowManager.RegisterFenceGroup("MainMenuStore", {
	"onlineServicesNoPremium",
	"store",
	"fenceSpinner",
	"exchange"
})
LUI.FlowManager.RegisterFenceGroup("MPStore", {
	"store",
	"fenceSpinner",
	"exchange"
})
LUI.FlowManager.RegisterFenceGroup("CPStore", {
	"store",
	"fenceSpinner",
	"exchange"
})

function PopFunc()
	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end
end

LUI.FlowManager.RegisterStackPopBehaviour("MainMenuStore", PopFunc)
LUI.FlowManager.RegisterStackPopBehaviour("MPStore", PopFunc)
LUI.FlowManager.RegisterStackPopBehaviour("CPStore", PopFunc)

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = {
		adjustSizeToContent = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		wrapY = true,
		maxRows = 32,
		wrapX = false,
		controllerIndex = arg_3_1,
		spacingY = _1080p * 20
	}
	local var_3_1 = LUI.UIGrid.new(var_3_0)

	var_3_1.id = "itemsGrid"

	var_3_1:setUseStencil(true)
	var_3_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1456, _1080p * 216, _1080p * 916)
	arg_3_0:addElement(var_3_1)

	arg_3_0.itemsGrid = var_3_1

	local var_3_2 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_3_0.VerticalScrollbar,
		startCap = arg_3_0.VerticalScrollbar.startCap,
		endCap = arg_3_0.VerticalScrollbar.endCap,
		sliderArea = arg_3_0.VerticalScrollbar.sliderArea,
		slider = arg_3_0.VerticalScrollbar.sliderArea and arg_3_0.VerticalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_3_0.VerticalScrollbar.sliderArea and arg_3_0.VerticalScrollbar.sliderArea.fixedSizeSlider
	})

	var_3_2:SetKBMStyle(true)
	var_3_1:AddScrollbar(var_3_2)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = 0
	local var_4_1 = 0
	local var_4_2 = false

	if arg_4_2 and #arg_4_2 > 0 then
		for iter_4_0 = 1, #arg_4_2 do
			local var_4_3 = arg_4_2[iter_4_0]

			if var_4_3.categoryRows then
				var_4_1 = var_4_1 + 1

				if var_4_3.items and #var_4_3.items > 0 then
					for iter_4_1 = 1, #var_4_3.items do
						if var_4_3.items[iter_4_1].productId == arg_4_1 and not var_4_2 then
							local var_4_4 = math.floor((iter_4_1 - 1) / STORE.maxButtonsPerCategoryRow)

							arg_4_0.itemsGrid:SetFocusedPosition({
								x = 0,
								y = var_4_0 + var_4_1 + var_4_4
							}, true, false)
							var_4_3.categoryRows[var_4_4 + 1]:FocusItem(iter_4_1 - var_4_4 * STORE.maxButtonsPerCategoryRow)

							var_4_2 = true
						end
					end
				end

				var_4_0 = var_4_0 + #var_4_3.categoryRows
			end
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = {}

	if arg_5_0 and #arg_5_0 > 0 then
		for iter_5_0, iter_5_1 in ipairs(arg_5_0) do
			local var_5_1 = iter_5_1.productId
			local var_5_2 = iter_5_1.status ~= InGameStoreProductStatus.NOT_OWNED

			if STORE.IsGameUpsellProduct(var_5_1) then
				if Dvar.IBEGCHEFE("SSRQTKMLQ") and not Engine.CFHBIHABCB(arg_5_1) then
					table.insert(var_5_0, iter_5_1)
				end
			elseif not var_5_2 then
				table.insert(var_5_0, iter_5_1)
			end
		end
	end

	return var_5_0
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.Background)
	arg_6_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS")))
	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)

	local function var_6_0(arg_7_0, arg_7_1)
		local var_7_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_7_0.Background:SetScale(var_7_0)
	end

	arg_6_0:addAndCallEventHandler("onVideoChange", var_6_0)

	local var_6_1 = false
	local var_6_2 = false
	local var_6_3 = InGameStore.GetCategories(arg_6_1)

	local function var_6_4(arg_8_0, arg_8_1, arg_8_2)
		for iter_8_0 = 1, #arg_8_0 do
			local var_8_0 = arg_8_0[iter_8_0]

			var_8_0.itemIndex = iter_8_0 - 1

			if var_8_0.skuType == InGameStoreProductSkuType.FIRST_PARTY then
				var_8_0.isFirstParty = true
				var_6_1 = true
			end

			if not arg_8_2 then
				local var_8_1 = var_8_0.image == "" and "placeholder_x" or var_8_0.image

				if arg_8_1 and iter_8_0 == 1 then
					var_8_1 = var_8_1 .. "_large"
				elseif arg_8_1 and iter_8_0 == 2 then
					var_8_1 = var_8_1 .. "_medium"
				else
					var_8_1 = var_8_1 .. "_small"
				end

				var_8_0.image = var_8_1
			end

			if var_8_0.productId == STORE.VanguardTrialID then
				var_8_0.price = ""
			end

			var_8_0.owned = var_8_0.status ~= InGameStoreProductStatus.NOT_OWNED
			var_8_0.isTitleID = arg_8_2

			local var_8_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_8_0.productId, CSV.bundleIDs.cols.id)

			var_8_0.bundleID = #var_8_2 > 0 and var_8_2 or nil

			local var_8_3 = Engine.CIEGIACHAE() and "ps4" or Engine.BAHIIBFDDG() and "xb3" or "pc"
			local var_8_4 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_8_0.productId .. "_" .. var_8_3, CSV.bundleIDs.cols.id)

			var_8_0.bundleID = #var_8_4 > 0 and var_8_4 or var_8_0.bundleID
		end
	end

	local function var_6_5(arg_9_0)
		for iter_9_0 = 1, #arg_9_0 do
			local var_9_0 = arg_9_0[iter_9_0]
			local var_9_1 = InGameStore.GetCategoryProducts(arg_6_1, var_9_0.categoryId)
			local var_9_2 = var_9_0.categoryId == STORE.TitlesCategory or var_9_0.categoryId == STORE.ZeusCategory

			if var_9_2 then
				var_9_1 = var_0_4(var_9_1, arg_6_1)
			end

			var_6_4(var_9_1, var_9_0.isFeatured, var_9_2)

			if var_9_0.categoryRows then
				for iter_9_1, iter_9_2 in ipairs(var_9_0.categoryRows) do
					iter_9_2:UpdateStoreItemButtons(arg_6_1, var_9_1)
				end
			end

			var_9_0.items = var_9_1
		end
	end

	if var_6_3 then
		if #var_6_3 > 0 then
			var_0_2(arg_6_0, arg_6_1)
		else
			ACTIONS.AnimateSequence(arg_6_0, "NoItems")
		end

		local var_6_6 = STORE.GetActiveCODPointsCategory()

		for iter_6_0 = 1, #var_6_3 do
			local var_6_7 = var_6_3[iter_6_0]
			local var_6_8 = var_6_7.title
			local var_6_9 = var_6_7.categoryId
			local var_6_10 = var_6_9 == STORE.TitlesCategory or var_6_9 == STORE.ZeusCategory
			local var_6_11 = (not arg_6_2.onlyCODPoints or var_6_9 == var_6_6) and var_6_9 ~= STORE.GameDLCCategory

			if var_6_9 == STORE.CODPointsCategory or var_6_9 == STORE.WZCODPointsCategory then
				var_6_11 = var_6_11 and var_6_9 == var_6_6
			end

			if var_6_11 then
				local var_6_12 = InGameStore.GetCategoryProducts(arg_6_1, var_6_9)
				local var_6_13 = true

				if var_6_10 then
					var_6_12 = var_0_4(var_6_12, arg_6_1)
					var_6_13 = #var_6_12 > 0
				end

				if var_6_12 and #var_6_12 > 0 and var_6_13 then
					local var_6_14 = MenuBuilder.BuildRegisteredType("StoreCategoryHeaderRow", {
						controllerIndex = arg_6_1
					})

					arg_6_0.itemsGrid:AddElement(var_6_14)
					var_6_14.Label:setText(var_6_8)

					local var_6_15
					local var_6_16 = {}

					if not var_6_2 and not var_6_10 then
						var_6_15 = MenuBuilder.BuildRegisteredType("StoreFeaturedRow", {
							controllerIndex = arg_6_1,
							store = arg_6_0
						})
						var_6_15.id = "StoreFeaturedRow"

						arg_6_0.itemsGrid:AddElement(var_6_15)

						var_6_2 = true
						var_6_7.isFeatured = true
					else
						var_6_15 = MenuBuilder.BuildRegisteredType("Store4ItemsRow", {
							controllerIndex = arg_6_1,
							store = arg_6_0
						})
						var_6_15.id = "Store4ItemsRow_" .. iter_6_0 .. "_0"

						arg_6_0.itemsGrid:AddElement(var_6_15)
					end

					table.insert(var_6_16, var_6_15)

					local var_6_17 = #var_6_12 < STORE.maxButtonsPerCategoryRow and #var_6_12 or STORE.maxButtonsPerCategoryRow

					if var_6_17 < #var_6_12 then
						local var_6_18 = 1
						local var_6_19 = #var_6_12 - var_6_17

						while var_6_19 > 0 do
							local var_6_20 = MenuBuilder.BuildRegisteredType("Store4ItemsRow", {
								controllerIndex = arg_6_1,
								store = arg_6_0,
								rowIndex = var_6_18
							})

							var_6_20.id = "Store4ItemsRow_" .. iter_6_0 .. "_" .. var_6_18

							arg_6_0.itemsGrid:AddElement(var_6_20)

							if var_6_19 > STORE.maxButtonsPerCategoryRow then
								var_6_19 = var_6_19 - STORE.maxButtonsPerCategoryRow
							else
								var_6_19 = 0
							end

							table.insert(var_6_16, var_6_20)

							var_6_18 = var_6_18 + 1
						end
					end

					var_6_4(var_6_12, var_6_7.isFeatured, var_6_10)

					for iter_6_1, iter_6_2 in ipairs(var_6_16) do
						iter_6_2:UpdateStoreItemButtons(arg_6_1, var_6_12)
					end

					var_6_7.items = var_6_12
					var_6_7.categoryRows = var_6_16
				end
			end
		end
	else
		ACTIONS.AnimateSequence(arg_6_0, "NoItems")
	end

	local var_6_21 = LUI.UIBindButton.new()

	var_6_21.id = "bindButton"

	arg_6_0:addElement(var_6_21)
	var_6_21:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		if arg_6_2.fromMainMenu == true then
			Engine.BIGIHAGAAA()
		end

		ACTIONS.LeaveMenu(arg_6_0)
	end)
	arg_6_0:addEventHandler("menu_close", function(arg_11_0, arg_11_1)
		Engine.BGIAICIDDI(arg_6_1)
	end)

	if Engine.CIEGIACHAE() and var_6_1 then
		InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
	end

	local var_6_22 = LUI.FlowManager.GetScopedData(arg_6_0)

	arg_6_0:addEventHandler("lose_focus", function(arg_12_0, arg_12_1)
		if Engine.CIEGIACHAE() and not var_6_22.previewProductID then
			InGameStore.ShowStoreIcon(false)
		end
	end)
	arg_6_0:addEventHandler("restore_focus", function(arg_13_0, arg_13_1)
		if Engine.CIEGIACHAE() and var_6_1 then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
		end

		var_6_5(var_6_3)

		var_6_22 = LUI.FlowManager.GetScopedData(arg_6_0)

		if var_6_22.previewProductID then
			arg_6_0.itemsGrid:SetNotifyOnLayoutInit(true)
			arg_6_0.itemsGrid:addEventHandler("layout_initialized", function()
				var_0_3(arg_6_0, var_6_22.previewProductID, var_6_3)

				var_6_22.previewProductID = nil
			end)

			return true
		end

		if var_6_22.restoreFocusProduct then
			arg_6_0.itemsGrid:addEventHandler("restore_focus", function()
				var_0_3(arg_6_0, var_6_22.restoreFocusProduct, var_6_3)

				var_6_22.restoreFocusProduct = nil
			end)
		end
	end)
	arg_6_0:registerEventHandler("closing_quick_access_menu", function(arg_16_0, arg_16_1)
		Engine.DHFCHIIJCA("quartermaster")

		return true
	end)

	if arg_6_2.defaultItem then
		arg_6_0.itemsGrid:SetNotifyOnLayoutInit(true)
		arg_6_0.itemsGrid:addEventHandler("layout_initialized", function()
			var_0_3(arg_6_0, arg_6_2.defaultItem, var_6_3)

			if arg_6_2.andPurchase then
				InGameStore.SelectProduct(arg_6_1, item.productId, InGameStorePurchaseType.BROWSE)
			end

			arg_6_2.defaultItem = nil
		end)
	end

	if LUI.IsLastInputMouseNavigation(arg_6_1) then
		local var_6_23 = arg_6_0.itemsGrid:GetFirstFocusablePosition()

		arg_6_0.itemsGrid:SetFocusedPosition(var_6_23)
	end

	ACTIONS.ScaleFullscreen(arg_6_0.Background)
end

function var_0_0(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0.id = "Store"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	var_18_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_18_1
	})
	var_18_0.HelperBar.id = "HelperBar"

	var_18_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_18_0.HelperBar:setPriority(10)
	var_18_0:addElement(var_18_0.HelperBar)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "Background"

	var_18_4:SetRGBFromInt(0, 0)
	var_18_4:SetAlpha(0.95, 0)
	var_18_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_18_4:SetVMin(0.5, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.Background = var_18_4

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "MenuTitle"

	var_18_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS"), 0)
	var_18_6.Line:SetLeft(0, 0)
	var_18_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_18_0:addElement(var_18_6)

	var_18_0.MenuTitle = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "PlayerDetails"

	var_18_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_18_0:addElement(var_18_8)

	var_18_0.PlayerDetails = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("StoreItemDetails", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "StoreItemDetails"

	var_18_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1490, _1080p * 1790, _1080p * 216, _1080p * 916)
	var_18_0:addElement(var_18_10)

	var_18_0.StoreItemDetails = var_18_10

	local var_18_11
	local var_18_12 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_18_1
	})

	var_18_12.id = "VerticalScrollbar"

	var_18_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1455, _1080p * 1467, _1080p * 216, _1080p * 916)
	var_18_0:addElement(var_18_12)

	var_18_0.VerticalScrollbar = var_18_12

	local var_18_13
	local var_18_14 = LUI.UIText.new()

	var_18_14.id = "NoItemsLabel"

	var_18_14:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_18_14:SetAlpha(0, 0)
	var_18_14:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_STORE_ITEMS"), 0)
	var_18_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_14:SetAlignment(LUI.Alignment.Center)
	var_18_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * -24, _1080p * 24)
	var_18_0:addElement(var_18_14)

	var_18_0.NoItemsLabel = var_18_14

	local function var_18_15()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_15

	local var_18_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("NoItems", var_18_16)

	local var_18_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("NoItems", var_18_17)

	local var_18_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_14:RegisterAnimationSequence("NoItems", var_18_18)

	local function var_18_19()
		var_18_10:AnimateSequence("NoItems")
		var_18_12:AnimateSequence("NoItems")
		var_18_14:AnimateSequence("NoItems")
	end

	var_18_0._sequences.NoItems = var_18_19

	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_18_20 = LUI.UIBindButton.new()

	var_18_20.id = "selfBindButton"

	var_18_0:addElement(var_18_20)

	var_18_0.bindButton = var_18_20

	var_0_5(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("Store", var_0_0)
LUI.FlowManager.RegisterStackPopBehaviour("Store", PopFunc)
LockTable(_M)
