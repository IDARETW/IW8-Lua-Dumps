module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		for iter_1_0, iter_1_1 in ipairs(arg_1_0._camoTable) do
			if iter_1_1.ref == arg_1_1 then
				return iter_1_0 - 1
			end
		end
	end

	return 0
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._previewOptions = {}
	arg_2_0._previewOptions.lootID = arg_2_1.lootID

	if arg_2_1.lootID ~= 0 then
		arg_2_0._previewOptions.lootID = arg_2_1.lootID
		arg_2_0._previewOptions.storePreviewItemType = LOOT.GetTypeForID(arg_2_0._previewOptions.lootID)
		arg_2_0._previewOptions.lootType = LOOT.GetTypeForID(arg_2_0._previewOptions.lootID)
		arg_2_0._previewOptions.itemRef = LOOT.GetItemRef(arg_2_0._previewOptions.lootType, arg_2_0._previewOptions.lootID)
	else
		arg_2_0._previewOptions = arg_2_1
		arg_2_0._previewOptions.isDefault = true
	end

	if arg_2_0._menu then
		if arg_2_0._previewOptions.itemRef == "randomization" then
			arg_2_0._menu.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_r3"
			})
		else
			arg_2_0._menu.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_r3",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_CAMO")
			})
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_0._previewOptions.itemRef == "randomization" then
		return
	end

	LUI.FlowManager.RequestPopupMenu(nil, "VehiclePreview", true, arg_3_1, nil, arg_3_0._previewOptions, true)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_2._itemData.ref == "randomization" then
		return
	end

	arg_4_2:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(arg_4_3)
	})

	local var_4_0 = {
		id = "vehicleCamoPreview",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_CAMO"),
		actionFunction = function()
			var_0_2(arg_4_0, arg_4_1)
		end
	}

	arg_4_2:AddContextualMenuAction(var_4_0)
end

local function var_0_4(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.CamoGrid:GetNumColumns()

	return function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_7_2 * var_6_0 + arg_7_1 + 1
		local var_7_1 = arg_6_0._camoTable[var_7_0]

		var_7_1.isSelected = var_7_1.lootID == arg_6_0._equippedCamoID
		var_7_1.isUnlocked = var_7_1.isUnlocked or LOOT.IsUnlockedWithID(arg_6_1, var_7_1.lootID)
		var_7_1.isFavorite = arg_6_0._favoriteVehicleCamos[var_7_1.ref]

		if not CONDITIONS.IsPostSeason() and not var_7_1.isUnlocked then
			local var_7_2 = BATTLEPASS.GetLootTierMap()
			local var_7_3 = var_7_2 and var_7_2[var_7_1.lootID] or nil

			if var_7_3 then
				var_7_1.unlockText = Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", var_7_3)
			end
		end

		arg_7_0:RefreshButton(nil, var_7_1, var_7_1.isSelected, var_7_1.isFavorite)
		var_0_3(arg_6_0, arg_6_1, arg_7_0, var_7_1.name)
	end
end

local function var_0_5(arg_8_0)
	arg_8_0.CamoGrid:RefreshContent()
	arg_8_0.FavoriteAndSort.FavoritesPrompt:UpdateText(isFavorite, arg_8_0._favoriteVehicleCamos.count)

	local var_8_0 = #arg_8_0._camoTable
	local var_8_1 = var_8_0 > 0 and var_8_0 - 1 or 0

	arg_8_0.ItemsCollected:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y", arg_8_0._unlockCamoNum, var_8_1))
end

local function var_0_6(arg_9_0)
	local var_9_0 = arg_9_0.CamoGrid:GetFocusPositionIndex()

	if not var_9_0 then
		return
	end

	local var_9_1 = arg_9_0._camoTable[var_9_0 + 1]

	if var_9_1.lootID == 0 or not var_9_1.isUnlocked or var_9_1.isRandom then
		return
	end

	local var_9_2 = false

	if arg_9_0._favoriteVehicleCamos[var_9_1.ref] then
		LOOT.RemoveFavoriteForType(LOOT.itemTypes.VEHICLE_CAMO, var_9_1.ref)
	elseif arg_9_0._favoriteVehicleCamos.count >= LOOT.maxFavorites then
		ACTIONS.AnimateSequence(arg_9_0.FavoriteAndSort.FavoritesPrompt, "Warning")
		Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

		return
	else
		LOOT.AddFavoriteForType(LOOT.itemTypes.VEHICLE_CAMO, var_9_1.ref)

		var_9_2 = true
	end

	arg_9_0._favoriteVehicleCamos = LOOT.GetFavoritesForType(LOOT.itemTypes.VEHICLE_CAMO)

	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

	local var_9_3 = ""
	local var_9_4 = ""
	local var_9_5

	if var_9_2 then
		var_9_3 = "LUA_MENU/ITEM_FAVORITED"
		var_9_5 = "cac_equip_fill"
	else
		var_9_3 = "LUA_MENU/ITEM_UNFAVORITED"
		var_9_5 = "cac_equip_ring"
	end

	local var_9_6 = {
		iconScale = -0.3,
		displayTime = 1500,
		icon = var_9_5,
		iconColor = SWATCHES.genericMenu.notificationHighlight,
		header = Engine.CBBHFCGDIC(var_9_3),
		description = Engine.CBBHFCGDIC(var_9_1.name),
		controllerIndex = controllerIndex
	}

	arg_9_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_9_6
	})
	var_0_5(arg_9_0)
end

local function var_0_7(arg_10_0, arg_10_1)
	local var_10_0 = PlayerData.BFFBGAJGD(arg_10_1, CoD.StatsGroup.NonGame).sortPreferences.vehicleCamoSortPreference

	arg_10_0.seasonsSortingType = var_10_0.seasonSortPreference:get()
	arg_10_0.raritySortingType = var_10_0.raritySortPreference:get()

	local var_10_1 = {}

	table.insert(var_10_1, {
		sortFunc = MenuUtils.SortNoneValue,
		sortFuncParams = {
			noneValue = "default"
		}
	})

	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		table.insert(var_10_1, {
			sortFunc = MenuUtils.SortRandomValue
		})
	end

	table.insert(var_10_1, {
		sortFunc = MenuUtils.SortFavorites,
		sortFuncParams = {
			favoritesTable = arg_10_0._favoriteVehicleCamos
		}
	})
	table.insert(var_10_1, {
		sortFunc = MenuUtils.SortNew,
		sortFuncParams = {
			controllerIndex = arg_10_1
		}
	})
	table.insert(var_10_1, {
		sortFunc = MenuUtils.SortUnlocks
	})

	if arg_10_0.seasonsSortingType ~= LOOT.seasonsSortingOptions.NONE then
		table.insert(var_10_1, {
			sortFunc = MenuUtils.SortSeasons,
			sortFuncParams = {
				seasonsSortingType = arg_10_0.seasonsSortingType
			}
		})
	end

	if arg_10_0.raritySortingType ~= LOOT.raritySortingOptions.NONE then
		table.insert(var_10_1, {
			sortFunc = MenuUtils.SortRarity,
			sortFuncParams = {
				raritySortingType = arg_10_0.raritySortingType
			}
		})
	end

	table.insert(var_10_1, {
		sortFunc = MenuUtils.SortName
	})
	MenuUtils.SortTableViaOptions(arg_10_0._camoTable, var_10_1)
	arg_10_0.CamoGrid:RemoveFocusFromChild()
	arg_10_0.CamoGrid:SetNumChildren(#arg_10_0._camoTable)
	arg_10_0.CamoGrid:RefreshContent()
	arg_10_0.FavoriteAndSort:Update(arg_10_1, arg_10_0, "LUA_MENU/PAD_ALT2_BUTTON")
end

local function var_0_8(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0._menu = arg_11_2.menu

	local var_11_0 = arg_11_2.vehicleInfo.ref

	arg_11_0._camoTable, arg_11_0._unlockCamoNum = VEHICLE.GetVehicleCamos(arg_11_1, var_11_0)

	arg_11_0.CamoGrid:SetNumChildren(#arg_11_0._camoTable)

	arg_11_0._vehiclePlayerData = VEHICLE.GetPlayerData(arg_11_1, var_11_0)

	if RANDOM.IsEnabled(arg_11_1, LOOT.itemTypes.VEHICLE_CAMO, {
		vehicleRef = var_11_0
	}) then
		arg_11_0._equippedCamoID = RANDOM.lootID
	else
		arg_11_0._equippedCamoID = arg_11_0._vehiclePlayerData.camo:get()
	end

	arg_11_0._favoriteVehicleCamos = LOOT.GetFavoritesForType(LOOT.itemTypes.VEHICLE_CAMO)

	var_0_7(arg_11_0, arg_11_1)
	arg_11_0.CamoGrid:SetRefreshChild(var_0_4(arg_11_0, arg_11_1))
	arg_11_0.CamoGrid:SetMask(arg_11_0.GridMask)
	arg_11_0:addEventHandler("loot_button_over", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.itemData

		var_12_0.isCamo = true

		arg_11_0.VehicleLootDetails:SetupDetails(var_12_0)
		arg_11_0.FullImage:setImage(RegisterMaterial(var_12_0.showcaseImage))

		if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") and not var_12_0.isUnlocked then
			arg_11_0.BundleUpsellButton:SetupUpsellButtonWithKey(arg_11_1, var_12_0.ref)
		else
			arg_11_0.BundleUpsellButton:HideButton()
		end

		var_0_1(arg_11_0, var_12_0)

		if var_12_0.isUnlocked and var_12_0.lootID ~= 0 and not var_12_0.isRandom then
			arg_11_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(1)

			local var_12_1 = arg_11_0._favoriteVehicleCamos[var_12_0.ref]
			local var_12_2 = arg_11_0._favoriteVehicleCamos.count

			arg_11_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_12_1, var_12_2)
		else
			arg_11_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(0)
		end
	end)

	if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") then
		arg_11_0.BundleUpsellButton:CacheBundleItems(arg_11_1, {
			byRef = true,
			itemType = LOOT.itemTypes.VEHICLE_CAMO
		})
	end

	local var_11_1 = VEHICLE.GetEquippedCamo(arg_11_1, var_11_0)
	local var_11_2 = var_0_0(arg_11_0, var_11_1.ref)
	local var_11_3 = arg_11_0.CamoGrid:GetPositionForIndex(var_11_2)

	arg_11_0.CamoGrid:SetFocusedPosition(var_11_3, true)
	var_0_5(arg_11_0)
	arg_11_0:addEventHandler("loot_button_action", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_1.itemData

		RANDOM.SetEnabled(arg_11_1, LOOT.itemTypes.VEHICLE_CAMO, var_13_0.isRandom, {
			vehicleRef = var_11_0
		})

		if var_13_0.isRandom then
			arg_11_0._equippedCamoID = RANDOM.lootID
		else
			arg_11_0._vehiclePlayerData.camo:set(var_13_0.lootID)

			arg_11_0._equippedCamoID = var_13_0.lootID
		end

		local var_13_1 = {
			iconScale = -0.3,
			displayTime = 1500,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED_VEH_CAMO"),
			description = Engine.CBBHFCGDIC(var_13_0.name),
			controllerIndex = arg_11_1
		}

		arg_11_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_13_1
		})
		arg_11_0.CamoGrid:RefreshContent()
		arg_11_0.VehicleLootDetails:SetupDetails(var_13_0)
	end)

	arg_11_0._bindButton = LUI.UIBindButton.new()

	arg_11_0:addElement(arg_11_0._bindButton)
	arg_11_0._bindButton:addEventHandler("button_right_stick", function(arg_14_0, arg_14_1)
		var_0_2(arg_11_0, arg_11_1)
	end)

	if CONDITIONS.IsUserSignedInDemonware(arg_11_1) then
		arg_11_0._bindButton:addEventHandler("button_right_trigger", function(arg_15_0, arg_15_1)
			var_0_6(arg_11_0)
		end)
	end

	arg_11_0._bindButton:addEventHandler("button_alt2", function(arg_16_0, arg_16_1)
		local var_16_0 = MenuBuilder.BuildRegisteredType("CustomizeSortingPopup", {
			controllerIndex = arg_11_1,
			menu = arg_11_0,
			type = LOOT.itemTypes.VEHICLE_CAMO
		})

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_11_1, false, {
			flyInLeftNarrow = true,
			widget = var_16_0
		})
	end)
	arg_11_0:addAndCallEventHandler("restore_focus", function(arg_17_0, arg_17_1)
		var_0_7(arg_11_0, arg_11_1)
	end)

	local var_11_4 = Engine.DCJHCAFIIA()
	local var_11_5 = arg_11_0._equippedCamoID

	arg_11_0:addEventHandler("menu_close", function(arg_18_0, arg_18_1)
		local var_18_0 = arg_11_0._equippedCamoID

		METRICS.LootUsageSendDLogEvent(arg_11_0, {
			controllerIndex = arg_11_1,
			startTime = var_11_4,
			previousItemIDs = var_11_5,
			newItemIDs = var_18_0
		})
	end)

	if arg_11_0.BundleUpsellButton then
		arg_11_0.BundleUpsellButton:SetUpsellMenu("VehicleCamoSelect")
	end
end

function VehicleCamoSelect(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "VehicleCamoSelect"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "Scrollbar"

	var_19_4:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1753, _1080p * 1763, _1080p * -268, _1080p * -65)
	var_19_0:addElement(var_19_4)

	var_19_0.Scrollbar = var_19_4

	local var_19_5
	local var_19_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 12,
		maxVisibleRows = 2,
		wrapY = true,
		arrowsVerticalOffset = -8,
		springCoefficient = 400,
		controllerIndex = var_19_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericLootButton", {
				controllerIndex = var_19_1
			})
		end,
		refreshChild = function(arg_21_0, arg_21_1, arg_21_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 126,
		rowHeight = _1080p * 126,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_19_7 = LUI.UIGrid.new(var_19_6)

	var_19_7.id = "CamoGrid"

	var_19_7:setUseStencil(true)
	var_19_7:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 1758, _1080p * -268, _1080p * -138)
	var_19_0:addElement(var_19_7)

	var_19_0.CamoGrid = var_19_7

	local var_19_8
	local var_19_9 = LUI.UIImage.new()

	var_19_9.id = "FullImage"

	var_19_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 717, _1080p * 1741, _1080p * 189, _1080p * 769)
	var_19_0:addElement(var_19_9)

	var_19_0.FullImage = var_19_9

	local var_19_10
	local var_19_11 = LUI.UIImage.new()

	var_19_11.id = "GridMask"

	var_19_11:setImage(RegisterMaterial("store_bundle_grid_mask"), 0)
	var_19_11:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 96, _1080p * -144, _1080p * -268, _1080p * -65)
	var_19_0:addElement(var_19_11)

	var_19_0.GridMask = var_19_11

	local var_19_12
	local var_19_13 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_19_1
	})

	var_19_13.id = "BundleUpsellButton"

	var_19_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 88, _1080p * 538, _1080p * 508, _1080p * 714)
	var_19_0:addElement(var_19_13)

	var_19_0.BundleUpsellButton = var_19_13

	local var_19_14
	local var_19_15 = LUI.UIStyledText.new()

	var_19_15.id = "ItemsCollected"

	var_19_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_19_15:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_19_15:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_19_15:SetAlignment(LUI.Alignment.Left)
	var_19_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 129, _1080p * 314, _1080p * -300, _1080p * -278)
	var_19_0:addElement(var_19_15)

	var_19_0.ItemsCollected = var_19_15

	local var_19_16
	local var_19_17 = MenuBuilder.BuildRegisteredType("FavoriteAndSort", {
		controllerIndex = var_19_1
	})

	var_19_17.id = "FavoriteAndSort"

	var_19_17:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1470, _1080p * 1741, _1080p * -300, _1080p * -276)
	var_19_0:addElement(var_19_17)

	var_19_0.FavoriteAndSort = var_19_17

	local var_19_18
	local var_19_19 = LUI.UIImage.new()

	var_19_19.id = "Line"

	var_19_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_19_19:SetAlpha(0.6, 0)
	var_19_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 1741, _1080p * -276, _1080p * -275)
	var_19_0:addElement(var_19_19)

	var_19_0.Line = var_19_19

	local var_19_20
	local var_19_21 = MenuBuilder.BuildRegisteredType("VehicleLootPanel", {
		controllerIndex = var_19_1
	})

	var_19_21.id = "VehicleLootDetails"

	if CONDITIONS.InFrontend(var_19_0) then
		var_19_21.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/TUTORIAL_PROMPT"), 0)
	end

	var_19_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 636, _1080p * 200, _1080p * 310)
	var_19_0:addElement(var_19_21)

	var_19_0.VehicleLootDetails = var_19_21

	var_19_13:addEventHandler("button_over", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_19_1
		end

		ACTIONS.AnimateSequenceByElement(var_19_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonOver",
			elementName = "BundleUpsellButton"
		})
	end)
	var_19_13:addEventHandler("button_up", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_19_1
		end

		ACTIONS.AnimateSequenceByElement(var_19_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonUp",
			elementName = "BundleUpsellButton"
		})
	end)

	local var_19_22 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_19_4,
		startCap = var_19_4.startCap,
		endCap = var_19_4.endCap,
		sliderArea = var_19_4.sliderArea,
		slider = var_19_4.sliderArea and var_19_4.sliderArea.slider,
		fixedSizeSlider = var_19_4.sliderArea and var_19_4.sliderArea.fixedSizeSlider
	})

	var_19_7:AddScrollbar(var_19_22)
	var_0_8(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("VehicleCamoSelect", VehicleCamoSelect)
LockTable(_M)
