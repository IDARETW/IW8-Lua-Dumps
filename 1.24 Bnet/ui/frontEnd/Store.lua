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
		maxVisibleRows = 5,
		wrapY = true,
		maxRows = 20,
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

			var_8_0.owned = var_8_0.status ~= InGameStoreProductStatus.NOT_OWNED
			var_8_0.isTitleID = arg_8_2

			local var_8_2 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.firstPartyProductID, var_8_0.productId, CSV.bundleIDs.cols.id)

			var_8_0.bundleID = #var_8_2 > 0 and var_8_2 or nil
		end
	end

	local function var_6_5(arg_9_0)
		for iter_9_0 = 1, #arg_9_0 do
			local var_9_0 = arg_9_0[iter_9_0]
			local var_9_1 = InGameStore.GetCategoryProducts(arg_6_1, var_9_0.categoryId)

			if var_9_0.categoryId == STORE.TitlesCategory then
				var_9_1 = var_0_4(var_9_1, arg_6_1)
			end

			var_6_4(var_9_1, var_9_0.isFeatured, var_9_0.categoryId == STORE.TitlesCategory)

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

		for iter_6_0 = 1, #var_6_3 do
			local var_6_6 = var_6_3[iter_6_0]
			local var_6_7 = var_6_6.title
			local var_6_8 = var_6_6.categoryId
			local var_6_9 = var_6_8 == STORE.TitlesCategory

			if (not arg_6_2.onlyCODPoints or var_6_8 == STORE.CODPointsCategory) and var_6_8 ~= STORE.GameDLCCategory then
				local var_6_10 = InGameStore.GetCategoryProducts(arg_6_1, var_6_8)
				local var_6_11 = true

				if var_6_9 then
					var_6_10 = var_0_4(var_6_10, arg_6_1)
					var_6_11 = #var_6_10 > 0
				end

				if var_6_10 and #var_6_10 > 0 and var_6_11 then
					local var_6_12 = MenuBuilder.BuildRegisteredType("StoreCategoryHeaderRow", {
						controllerIndex = arg_6_1
					})

					arg_6_0.itemsGrid:AddElement(var_6_12)
					var_6_12.Label:setText(var_6_7)

					local var_6_13
					local var_6_14 = {}

					if not var_6_2 and not var_6_9 then
						var_6_13 = MenuBuilder.BuildRegisteredType("StoreFeaturedRow", {
							controllerIndex = arg_6_1,
							store = arg_6_0
						})
						var_6_13.id = "StoreFeaturedRow"

						arg_6_0.itemsGrid:AddElement(var_6_13)

						var_6_2 = true
						var_6_6.isFeatured = true
					else
						var_6_13 = MenuBuilder.BuildRegisteredType("Store4ItemsRow", {
							controllerIndex = arg_6_1,
							store = arg_6_0
						})
						var_6_13.id = "Store4ItemsRow_" .. iter_6_0 .. "_0"

						arg_6_0.itemsGrid:AddElement(var_6_13)
					end

					table.insert(var_6_14, var_6_13)

					local var_6_15 = #var_6_10 < STORE.maxButtonsPerCategoryRow and #var_6_10 or STORE.maxButtonsPerCategoryRow

					if var_6_15 < #var_6_10 then
						local var_6_16 = 1
						local var_6_17 = #var_6_10 - var_6_15

						while var_6_17 > 0 do
							local var_6_18 = MenuBuilder.BuildRegisteredType("Store4ItemsRow", {
								controllerIndex = arg_6_1,
								store = arg_6_0,
								rowIndex = var_6_16
							})

							var_6_18.id = "Store4ItemsRow_" .. iter_6_0 .. "_" .. var_6_16

							arg_6_0.itemsGrid:AddElement(var_6_18)

							if var_6_17 > STORE.maxButtonsPerCategoryRow then
								var_6_17 = var_6_17 - STORE.maxButtonsPerCategoryRow
							else
								var_6_17 = 0
							end

							table.insert(var_6_14, var_6_18)

							var_6_16 = var_6_16 + 1
						end
					end

					var_6_4(var_6_10, var_6_6.isFeatured, var_6_9)

					for iter_6_1, iter_6_2 in ipairs(var_6_14) do
						iter_6_2:UpdateStoreItemButtons(arg_6_1, var_6_10)
					end

					var_6_6.items = var_6_10
					var_6_6.categoryRows = var_6_14
				end
			end
		end
	else
		ACTIONS.AnimateSequence(arg_6_0, "NoItems")
	end

	local var_6_19 = LUI.UIBindButton.new()

	var_6_19.id = "bindButton"

	arg_6_0:addElement(var_6_19)
	var_6_19:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
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

	local var_6_20 = LUI.FlowManager.GetScopedData(arg_6_0)

	arg_6_0:addEventHandler("lose_focus", function(arg_12_0, arg_12_1)
		if Engine.CIEGIACHAE() and not var_6_20.previewProductID then
			InGameStore.ShowStoreIcon(false)
		end
	end)
	arg_6_0:addEventHandler("restore_focus", function(arg_13_0, arg_13_1)
		if Engine.CIEGIACHAE() and var_6_1 then
			InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
		end

		var_6_5(var_6_3)

		if var_6_20.previewProductID then
			arg_6_0.itemsGrid:SetNotifyOnLayoutInit(true)
			arg_6_0.itemsGrid:addEventHandler("layout_initialized", function()
				var_0_3(arg_6_0, var_6_20.previewProductID, var_6_3)

				var_6_20.previewProductID = nil
			end)

			return true
		end
	end)
	arg_6_0:registerEventHandler("closing_quick_access_menu", function(arg_15_0, arg_15_1)
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
		local var_6_21 = arg_6_0.itemsGrid:GetFirstFocusablePosition()

		arg_6_0.itemsGrid:SetFocusedPosition(var_6_21)
	end

	ACTIONS.ScaleFullscreen(arg_6_0.Background)
end

function var_0_0(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "Store"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	var_17_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_17_1
	})
	var_17_0.HelperBar.id = "HelperBar"

	var_17_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_17_0.HelperBar:setPriority(10)
	var_17_0:addElement(var_17_0.HelperBar)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = LUI.UIImage.new()

	var_17_4.id = "Background"

	var_17_4:SetRGBFromInt(0, 0)
	var_17_4:SetAlpha(0.95, 0)
	var_17_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_17_4:SetVMin(0.5, 0)
	var_17_0:addElement(var_17_4)

	var_17_0.Background = var_17_4

	local var_17_5
	local var_17_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_6.id = "MenuTitle"

	var_17_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_CAPS"), 0)
	var_17_6.Line:SetLeft(0, 0)
	var_17_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_6)

	var_17_0.MenuTitle = var_17_6

	local var_17_7
	local var_17_8 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_17_1
	})

	var_17_8.id = "PlayerDetails"

	var_17_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_17_0:addElement(var_17_8)

	var_17_0.PlayerDetails = var_17_8

	local var_17_9
	local var_17_10 = MenuBuilder.BuildRegisteredType("StoreItemDetails", {
		controllerIndex = var_17_1
	})

	var_17_10.id = "StoreItemDetails"

	var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1490, _1080p * 1790, _1080p * 216, _1080p * 916)
	var_17_0:addElement(var_17_10)

	var_17_0.StoreItemDetails = var_17_10

	local var_17_11
	local var_17_12 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_17_1
	})

	var_17_12.id = "VerticalScrollbar"

	var_17_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1455, _1080p * 1467, _1080p * 216, _1080p * 916)
	var_17_0:addElement(var_17_12)

	var_17_0.VerticalScrollbar = var_17_12

	local var_17_13
	local var_17_14 = LUI.UIText.new()

	var_17_14.id = "NoItemsLabel"

	var_17_14:SetRGBFromTable(SWATCHES.genericMenu.itemName, 0)
	var_17_14:SetAlpha(0, 0)
	var_17_14:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_STORE_ITEMS"), 0)
	var_17_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_14:SetAlignment(LUI.Alignment.Center)
	var_17_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * -24, _1080p * 24)
	var_17_0:addElement(var_17_14)

	var_17_0.NoItemsLabel = var_17_14

	local function var_17_15()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_15

	local var_17_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_10:RegisterAnimationSequence("NoItems", var_17_16)

	local var_17_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("NoItems", var_17_17)

	local var_17_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("NoItems", var_17_18)

	local function var_17_19()
		var_17_10:AnimateSequence("NoItems")
		var_17_12:AnimateSequence("NoItems")
		var_17_14:AnimateSequence("NoItems")
	end

	var_17_0._sequences.NoItems = var_17_19

	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_17_20 = LUI.UIBindButton.new()

	var_17_20.id = "selfBindButton"

	var_17_0:addElement(var_17_20)

	var_17_0.bindButton = var_17_20

	var_0_5(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("Store", var_0_0)
LUI.FlowManager.RegisterStackPopBehaviour("Store", PopFunc)
LockTable(_M)
