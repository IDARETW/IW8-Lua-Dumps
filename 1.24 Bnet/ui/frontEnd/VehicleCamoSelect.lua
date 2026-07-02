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
end

local function var_0_2(arg_3_0, arg_3_1)
	LUI.FlowManager.RequestPopupMenu(nil, "VehiclePreview", true, arg_3_1, nil, arg_3_0._previewOptions, true)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
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

	if var_9_1.lootID == 0 or not var_9_1.isUnlocked then
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

	table.sort(arg_10_0._camoTable, function(arg_11_0, arg_11_1)
		if arg_11_0.lootID == 0 or arg_11_1.lootID == 0 then
			return arg_11_0.lootID < arg_11_1.lootID
		end

		if arg_10_0._favoriteVehicleCamos[arg_11_0.ref] ~= arg_10_0._favoriteVehicleCamos[arg_11_1.ref] then
			return arg_10_0._favoriteVehicleCamos[arg_11_0.ref] and not arg_10_0._favoriteVehicleCamos[arg_11_1.ref]
		end

		local var_11_0 = Loot.HDJCADADF(arg_10_1, arg_11_0.lootID)
		local var_11_1 = Loot.HDJCADADF(arg_10_1, arg_11_1.lootID)

		if var_11_0 ~= var_11_1 then
			return var_11_0 and not var_11_1
		end

		if arg_11_0.isUnlocked ~= arg_11_1.isUnlocked then
			return arg_11_0.isUnlocked and not arg_11_1.isUnlocked
		end

		if arg_11_0.season ~= arg_11_1.season and arg_10_0.seasonsSortingType ~= LOOT.seasonsSortingOptions.NONE then
			if arg_10_0.seasonsSortingType == LOOT.seasonsSortingOptions.OLD_FIRST then
				return arg_11_0.season < arg_11_1.season
			elseif arg_10_0.seasonsSortingType == LOOT.seasonsSortingOptions.RECENT_FIRST then
				return arg_11_0.season > arg_11_1.season
			end
		end

		if arg_11_0.rarity ~= arg_11_1.rarity and arg_10_0.raritySortingOptions ~= LOOT.raritySortingOptions.NONE then
			if arg_10_0.raritySortingType == LOOT.raritySortingOptions.LOW_FIRST then
				return arg_11_0.rarity < arg_11_1.rarity
			elseif arg_10_0.raritySortingType == LOOT.raritySortingOptions.HIGH_FIRST then
				return arg_11_0.rarity > arg_11_1.rarity
			end
		end

		local var_11_2 = Engine.CBBHFCGDIC(arg_11_0.name)
		local var_11_3 = Engine.CBBHFCGDIC(arg_11_1.name)

		if var_11_2 ~= var_11_3 then
			return var_11_2 < var_11_3
		end

		return false
	end)
	arg_10_0.CamoGrid:RemoveFocusFromChild()
	arg_10_0.CamoGrid:SetNumChildren(#arg_10_0._camoTable)
	arg_10_0.CamoGrid:RefreshContent()
	arg_10_0.FavoriteAndSort:Update(arg_10_1, arg_10_0, "LUA_MENU/PAD_ALT2_BUTTON")
end

local function var_0_8(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_2.vehicleInfo.ref

	arg_12_0._camoTable, arg_12_0._unlockCamoNum = VEHICLE.GetVehicleCamos(arg_12_1, var_12_0)

	arg_12_0.CamoGrid:SetNumChildren(#arg_12_0._camoTable)

	arg_12_0._vehiclePlayerData = VEHICLE.GetPlayerData(arg_12_1, var_12_0)
	arg_12_0._equippedCamoID = arg_12_0._vehiclePlayerData.camo:get()
	arg_12_0._favoriteVehicleCamos = LOOT.GetFavoritesForType(LOOT.itemTypes.VEHICLE_CAMO)

	var_0_7(arg_12_0, arg_12_1)
	arg_12_0.VehicleLootDetails:InitializeDimensions(arg_12_0.VehicleLootDetails:GetCurrentAnchorsAndPositions())
	arg_12_0.CamoGrid:SetRefreshChild(var_0_4(arg_12_0, arg_12_1))
	arg_12_0.CamoGrid:SetMask(arg_12_0.GridMask)
	arg_12_0:addEventHandler("loot_button_over", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_1.itemData

		arg_12_0.VehicleLootDetails:SetupDetails(var_13_0)
		arg_12_0.FullImage:setImage(RegisterMaterial(var_13_0.showcaseImage))

		if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") and not var_13_0.isUnlocked then
			arg_12_0.BundleUpsellButton:SetupUpsellButtonWithKey(arg_12_1, var_13_0.ref)
		else
			arg_12_0.BundleUpsellButton:HideButton()
		end

		var_0_1(arg_12_0, var_13_0)

		if var_13_0.isUnlocked and var_13_0.lootID ~= 0 then
			arg_12_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(1)

			local var_13_1 = arg_12_0._favoriteVehicleCamos[var_13_0.ref]
			local var_13_2 = arg_12_0._favoriteVehicleCamos.count

			arg_12_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_13_1, var_13_2)
		else
			arg_12_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(0)
		end
	end)

	if Dvar.IBEGCHEFE("OSNKSLRMS") and Dvar.IBEGCHEFE("LTSNLQNRKO") then
		arg_12_0.BundleUpsellButton:CacheBundleItems(arg_12_1, {
			byRef = true,
			itemType = LOOT.itemTypes.VEHICLE_CAMO
		})
	end

	local var_12_1 = VEHICLE.GetEquippedCamo(arg_12_1, var_12_0)
	local var_12_2 = var_0_0(arg_12_0, var_12_1.ref)
	local var_12_3 = arg_12_0.CamoGrid:GetPositionForIndex(var_12_2)

	arg_12_0.CamoGrid:SetFocusedPosition(var_12_3, true)
	var_0_5(arg_12_0)
	arg_12_0:addEventHandler("loot_button_action", function(arg_14_0, arg_14_1)
		arg_12_0._vehiclePlayerData.camo:set(arg_14_1.itemData.lootID)

		arg_12_0._equippedCamoID = arg_12_0._vehiclePlayerData.camo:get()

		arg_12_0.CamoGrid:RefreshContent()
		arg_12_0.VehicleLootDetails:SetupDetails(arg_14_1.itemData)
	end)

	arg_12_0._bindButton = LUI.UIBindButton.new()

	arg_12_0:addElement(arg_12_0._bindButton)
	arg_12_0._bindButton:addEventHandler("button_right_stick", function(arg_15_0, arg_15_1)
		var_0_2(arg_12_0, arg_12_1)
	end)

	if CONDITIONS.IsUserSignedInDemonware(arg_12_1) then
		arg_12_0._bindButton:addEventHandler("button_right_trigger", function(arg_16_0, arg_16_1)
			var_0_6(arg_12_0)
		end)
	end

	arg_12_0._bindButton:addEventHandler("button_alt2", function(arg_17_0, arg_17_1)
		local var_17_0 = MenuBuilder.BuildRegisteredType("CustomizeSortingPopup", {
			controllerIndex = arg_12_1,
			menu = arg_12_0,
			type = LOOT.itemTypes.VEHICLE_CAMO
		})

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_12_1, false, {
			flyInLeftNarrow = true,
			widget = var_17_0
		})
	end)
	arg_12_0:addAndCallEventHandler("restore_focus", function(arg_18_0, arg_18_1)
		var_0_7(arg_12_0, arg_12_1)
	end)

	local var_12_4 = Engine.DCJHCAFIIA()
	local var_12_5 = arg_12_0._equippedCamoID

	arg_12_0:addEventHandler("menu_close", function(arg_19_0, arg_19_1)
		local var_19_0 = arg_12_0._equippedCamoID

		METRICS.VehicleUsageSendDLogEvent(arg_12_0.id, arg_12_1, var_12_4, var_12_5, var_19_0)
	end)

	if arg_12_0.BundleUpsellButton then
		arg_12_0.BundleUpsellButton:SetUpsellMenu("VehicleCamoSelect")
	end
end

function VehicleCamoSelect(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIElement.new()

	var_20_0.id = "VehicleCamoSelect"

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_20_1
	})

	var_20_4.id = "Scrollbar"

	var_20_4:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1753, _1080p * 1763, _1080p * -268, _1080p * -65)
	var_20_0:addElement(var_20_4)

	var_20_0.Scrollbar = var_20_4

	local var_20_5
	local var_20_6 = {
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
		controllerIndex = var_20_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericLootButton", {
				controllerIndex = var_20_1
			})
		end,
		refreshChild = function(arg_22_0, arg_22_1, arg_22_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 126,
		rowHeight = _1080p * 126,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_20_7 = LUI.UIGrid.new(var_20_6)

	var_20_7.id = "CamoGrid"

	var_20_7:setUseStencil(true)
	var_20_7:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 1746, _1080p * -268, _1080p * -85)
	var_20_0:addElement(var_20_7)

	var_20_0.CamoGrid = var_20_7

	local var_20_8
	local var_20_9 = MenuBuilder.BuildRegisteredType("LootDetails", {
		controllerIndex = var_20_1
	})

	var_20_9.id = "VehicleLootDetails"

	var_20_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 636, _1080p * 200, _1080p * 310)
	var_20_0:addElement(var_20_9)

	var_20_0.VehicleLootDetails = var_20_9

	local var_20_10
	local var_20_11 = LUI.UIImage.new()

	var_20_11.id = "FullImage"

	var_20_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 717, _1080p * 1741, _1080p * 189, _1080p * 769)
	var_20_0:addElement(var_20_11)

	var_20_0.FullImage = var_20_11

	local var_20_12
	local var_20_13 = LUI.UIImage.new()

	var_20_13.id = "GridMask"

	var_20_13:setImage(RegisterMaterial("store_bundle_grid_mask"), 0)
	var_20_13:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 96, _1080p * -144, _1080p * -268, _1080p * -65)
	var_20_0:addElement(var_20_13)

	var_20_0.GridMask = var_20_13

	local var_20_14
	local var_20_15 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_20_1
	})

	var_20_15.id = "BundleUpsellButton"

	var_20_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 88, _1080p * 538, _1080p * 468, _1080p * 674)
	var_20_0:addElement(var_20_15)

	var_20_0.BundleUpsellButton = var_20_15

	local var_20_16
	local var_20_17 = LUI.UIStyledText.new()

	var_20_17.id = "ItemsCollected"

	var_20_17:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_20_17:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_20_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_20_17:SetAlignment(LUI.Alignment.Left)
	var_20_17:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 129, _1080p * 314, _1080p * -300, _1080p * -278)
	var_20_0:addElement(var_20_17)

	var_20_0.ItemsCollected = var_20_17

	local var_20_18
	local var_20_19 = MenuBuilder.BuildRegisteredType("FavoriteAndSort", {
		controllerIndex = var_20_1
	})

	var_20_19.id = "FavoriteAndSort"

	var_20_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1470, _1080p * 1741, _1080p * -300, _1080p * -276)
	var_20_0:addElement(var_20_19)

	var_20_0.FavoriteAndSort = var_20_19

	local var_20_20
	local var_20_21 = LUI.UIImage.new()

	var_20_21.id = "Line"

	var_20_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_20_21:SetAlpha(0.6, 0)
	var_20_21:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 1741, _1080p * -276, _1080p * -275)
	var_20_0:addElement(var_20_21)

	var_20_0.Line = var_20_21

	var_20_15:addEventHandler("button_over", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_20_1
		end

		ACTIONS.AnimateSequenceByElement(var_20_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonOver",
			elementName = "BundleUpsellButton"
		})
	end)
	var_20_15:addEventHandler("button_up", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_20_1
		end

		ACTIONS.AnimateSequenceByElement(var_20_0, {
			elementPath = "self.BundleUpsellButton",
			sequenceName = "ButtonUp",
			elementName = "BundleUpsellButton"
		})
	end)

	local var_20_22 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_20_4,
		startCap = var_20_4.startCap,
		endCap = var_20_4.endCap,
		sliderArea = var_20_4.sliderArea,
		slider = var_20_4.sliderArea and var_20_4.sliderArea.slider,
		fixedSizeSlider = var_20_4.sliderArea and var_20_4.sliderArea.fixedSizeSlider
	})

	var_20_7:AddScrollbar(var_20_22)
	var_0_8(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("VehicleCamoSelect", VehicleCamoSelect)
LockTable(_M)
