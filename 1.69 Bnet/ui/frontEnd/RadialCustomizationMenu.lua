module(..., package.seeall)

local var_0_0 = {
	GESTURES = 0,
	SPRAYS = 1
}

local function var_0_1(arg_1_0)
	if arg_1_0._lootType == LOOT.itemTypes.GESTURES then
		arg_1_0._favorites = LOOT.GetFavoritesForType(LOOT.itemTypes.GESTURES)
	elseif arg_1_0._lootType == LOOT.itemTypes.SPRAYS then
		arg_1_0._favorites = LOOT.GetFavoritesForType(LOOT.itemTypes.SPRAYS)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	if not arg_2_0._selection and not arg_2_0._selection.isUnlocked then
		return
	end

	if arg_2_0._favorites[arg_2_0._selection.ref] then
		LOOT.RemoveFavoriteForType(arg_2_0._lootType, arg_2_0._selection.ref)
	elseif arg_2_0._favorites.count >= LOOT.maxFavorites then
		ACTIONS.AnimateSequence(arg_2_0.FavoriteAndSort.FavoritesPrompt, "Warning")

		return
	else
		LOOT.AddFavoriteForType(arg_2_0._lootType, arg_2_0._selection.ref)
	end

	var_0_1(arg_2_0)
	arg_2_0:UpdateGrid(arg_2_1)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0._lootType == LOOT.itemTypes.GESTURES then
		GESTURES.SetEquippedByRef(arg_3_1, arg_3_2, arg_3_0._selection.ref)
	elseif arg_3_0._lootType == LOOT.itemTypes.SPRAYS then
		SPRAYS.SetEquippedByRef(arg_3_1, arg_3_2, arg_3_0._selection.ref)
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	ACTIONS.AnimateSequence(arg_4_0, "Popup")

	local var_4_0 = arg_4_2 or {}

	var_4_0.controllerIndex = arg_4_1
	var_4_0.previewName = arg_4_0._selection.name
	var_4_0.menu = arg_4_0

	arg_4_0.HelperBar.ButtonHelperText:RemoveButtonPrompt("button_secondary")
	arg_4_0.HelperBar.ButtonHelperText:RemoveButtonPrompt("button_primary")

	if not CONDITIONS.IsNewBarracksIdentityEnabled() then
		arg_4_0.HelperBar.ButtonHelperText:RemoveButtonPrompt("button_r3")
	end

	arg_4_0.HelperBar.ButtonHelperText:RemoveButtonPrompt("button_alt1")
	LUI.FlowManager.RequestPopupMenu(unused, "RadialCustomizationPopup", false, arg_4_1, false, var_4_0, nil, true, true)
end

local function var_0_5(arg_5_0, arg_5_1)
	ACTIONS.AnimateSequence(arg_5_0, "Normal")
	arg_5_0:UpdateGrid(arg_5_1)
end

local function var_0_6(arg_6_0)
	ACTIONS.AnimateSequence(arg_6_0, "Normal")
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2)
	ACTIONS.AnimateSequence(arg_7_0, "Popup")

	local var_7_0 = arg_7_0.Grid:GetCurrentAnchorsAndPositions()
	local var_7_1 = arg_7_0._selection.ref

	var_0_4(arg_7_0, arg_7_1, {
		button = arg_7_2,
		gridLeft = var_7_0.left,
		gridTop = var_7_0.top
	})
end

local function var_0_8(arg_8_0)
	local var_8_0 = arg_8_0.Grid:GetFocusPositionIndex()

	if not var_8_0 then
		return
	end

	arg_8_0._currentSelectedIndex = var_8_0 + 1
	arg_8_0._selection = arg_8_0._currentTable[arg_8_0._currentSelectedIndex]

	if arg_8_0._selection == nil then
		return
	end

	local var_8_1 = arg_8_0._selection.ref
	local var_8_2 = arg_8_0._equippedRefs[var_8_1]
	local var_8_3 = Loot.HDJCADADF(arg_8_0._controllerIndex, arg_8_0._selection.lootID)

	arg_8_0.DetailPanel:UpdatePanel(arg_8_0._selection, var_8_2, var_8_3)
end

local function var_0_9(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	arg_9_2:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(arg_9_4)
	})

	local var_9_0 = {
		id = "addToFavorite",
		actionName = arg_9_3 and Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES") or Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
		actionFunction = function()
			arg_9_0:SetFavorite(arg_9_1)
		end
	}
end

local function var_0_10(arg_11_0, arg_11_1)
	return function(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = arg_12_1 + arg_12_2 * arg_11_0.Grid:GetNumColumns()
		local var_12_1 = arg_11_0._currentTable[var_12_0 + 1]
		local var_12_2 = var_12_1.ref
		local var_12_3 = var_12_1.name
		local var_12_4 = arg_11_0._equippedRefs[var_12_2] ~= nil
		local var_12_5 = arg_11_0._favorites[var_12_2]

		arg_12_0:RefreshButton(arg_11_0, var_12_1, arg_11_0._lootType, var_12_4)
	end
end

local function var_0_11(arg_13_0, arg_13_1)
	local var_13_0 = 0
	local var_13_1 = 0

	for iter_13_0 = 1, #arg_13_0._currentTable do
		local var_13_2 = arg_13_0._currentTable[iter_13_0]

		var_13_2.gameSourceID = LOOT.GetGameSourceIDFromItemID(var_13_2.lootID)

		if var_13_2.isNew then
			arg_13_0._newRefs[var_13_2.ref] = true
		end

		if var_13_2.hideInUI ~= "1" then
			if var_13_2.isUnlocked then
				var_13_0 = var_13_0 + 1
				var_13_1 = var_13_1 + 1
			elseif not var_13_2.isPremium then
				var_13_1 = var_13_1 + 1
			end
		end
	end

	arg_13_0.ItemsCollected:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y", var_13_0, var_13_1))

	arg_13_0._equippedRefs = GESTURES.GetEquippedRadialRefsTable(arg_13_0, arg_13_1)

	local var_13_3 = 1

	while var_13_3 <= #arg_13_0._currentTable do
		if not arg_13_0._currentTable[var_13_3].isUnlocked and arg_13_0.lockedSortingType == LOOT.lockedSortingOptions.HIDE then
			table.remove(arg_13_0._currentTable, var_13_3)
		else
			var_13_3 = var_13_3 + 1
		end
	end

	local var_13_4 = 1

	while var_13_4 <= #arg_13_0._currentTable do
		if arg_13_0.filterByTitleType == LOOT.filterOptions.MODERN_WARFARE_ONLY then
			if arg_13_0._currentTable[var_13_4].gameSourceID ~= LOOT.filterGameSourceID[arg_13_0.filterByTitleType] then
				table.remove(arg_13_0._currentTable, var_13_4)
			else
				var_13_4 = var_13_4 + 1
			end
		elseif arg_13_0.filterByTitleType == LOOT.filterOptions.VANGUARD_ONLY then
			if arg_13_0._currentTable[var_13_4].gameSourceID ~= LOOT.filterGameSourceID[arg_13_0.filterByTitleType] then
				table.remove(arg_13_0._currentTable, var_13_4)
			else
				var_13_4 = var_13_4 + 1
			end
		elseif arg_13_0.filterByTitleType == LOOT.filterOptions.COLD_WAR_ONLY then
			if arg_13_0._currentTable[var_13_4].gameSourceID ~= LOOT.filterGameSourceID[arg_13_0.filterByTitleType] then
				table.remove(arg_13_0._currentTable, var_13_4)
			else
				var_13_4 = var_13_4 + 1
			end
		elseif arg_13_0.filterByTitleType == nil or arg_13_0.filterByTitleType == LOOT.filterOptions.ALL then
			var_13_4 = var_13_4 + 1
		end
	end

	table.sort(arg_13_0._currentTable, function(arg_14_0, arg_14_1)
		local var_14_0 = Loot.HDJCADADF(arg_13_0._controllerIndex, arg_14_0.lootID)
		local var_14_1 = Loot.HDJCADADF(arg_13_0._controllerIndex, arg_14_1.lootID)

		if var_14_0 ~= var_14_1 then
			return var_14_0 and not var_14_1
		end

		if arg_14_0.isUnlocked ~= arg_14_1.isUnlocked then
			return arg_14_0.isUnlocked and not arg_14_1.isUnlocked
		end

		if arg_14_0.season ~= arg_14_1.season and arg_13_0.seasonsSortingType ~= LOOT.seasonsSortingOptions.NONE then
			if arg_13_0.seasonsSortingType == LOOT.seasonsSortingOptions.OLD_FIRST then
				return arg_14_0.season < arg_14_1.season
			elseif arg_13_0.seasonsSortingType == LOOT.seasonsSortingOptions.RECENT_FIRST then
				return arg_14_0.season > arg_14_1.season
			end
		end

		if arg_14_0.rarity ~= arg_14_1.rarity and arg_13_0.raritySortingType ~= LOOT.raritySortingOptions.NONE then
			if arg_13_0.raritySortingType == LOOT.raritySortingOptions.LOW_FIRST then
				return arg_14_0.rarity < arg_14_1.rarity
			elseif arg_13_0.raritySortingType == LOOT.raritySortingOptions.HIGH_FIRST then
				return arg_14_0.rarity > arg_14_1.rarity
			end
		end

		local var_14_2 = Engine.CBBHFCGDIC(arg_14_0.name)
		local var_14_3 = Engine.CBBHFCGDIC(arg_14_1.name)

		if var_14_2 ~= var_14_3 then
			return var_14_2 < var_14_3
		end

		return false
	end)
	arg_13_0.FavoriteAndSort:Update(arg_13_1, arg_13_0)
	arg_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	if not CONDITIONS.IsNewBarracksIdentityEnabled() then
		arg_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/RADIAL_PREVIEW")
		})
	end

	arg_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_left_trigger",
		priority = 3,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
	})
	arg_13_0.DetailPanel:SetAlpha(1)
end

local function var_0_12(arg_15_0, arg_15_1)
	arg_15_0.Grid:RemoveFocusFromChild()
	arg_15_0.Grid:SetNumChildren(#arg_15_0._currentTable)
	arg_15_0.Grid:RefreshContent()
end

local function var_0_13(arg_16_0)
	if arg_16_0.Tabs:GetCurrentTabIndex() == var_0_0.GESTURES then
		arg_16_0._lootType = LOOT.itemTypes.GESTURES
		arg_16_0._currentTable = LUI.ShallowCopy(arg_16_0._gesturesTable)
	elseif arg_16_0.Tabs:GetCurrentTabIndex() == var_0_0.SPRAYS then
		arg_16_0._lootType = LOOT.itemTypes.SPRAYS
		arg_16_0._currentTable = LUI.ShallowCopy(arg_16_0._spraysTable)
	end
end

local function var_0_14(arg_17_0, arg_17_1)
	var_0_13(arg_17_0)
	var_0_1(arg_17_0)
	var_0_11(arg_17_0, arg_17_1)
	arg_17_0:FocusFunction()
	arg_17_0.Grid:SetRefreshChild(var_0_10(arg_17_0, arg_17_1))
	arg_17_0.Grid:SetSnapOnWrapEnabled(true)
	arg_17_0:UpdateGrid(arg_17_1)
end

local function var_0_15(arg_18_0, arg_18_1)
	return function()
		var_0_13(arg_18_0)
		var_0_1(arg_18_0)
		var_0_11(arg_18_0, arg_18_1)
		arg_18_0:UpdateGrid(arg_18_1)
	end
end

local function var_0_16(arg_20_0, arg_20_1)
	assert(arg_20_0.Tabs)

	local var_20_0 = {}
	local var_20_1 = LOOT.IsCategoryNew(arg_20_1, LOOT.itemTypes.GESTURES)
	local var_20_2 = LOOT.IsCategoryNew(arg_20_1, LOOT.itemTypes.SPRAYS)

	table.insert(var_20_0, {
		disabled = false,
		hasDefaultFocus = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/GESTURES"),
		focusFunction = var_0_15(arg_20_0, arg_20_1),
		hasNewItem = var_20_1
	})
	table.insert(var_20_0, {
		disabled = false,
		hasDefaultFocus = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/SPRAYS"),
		focusFunction = var_0_15(arg_20_0, arg_20_1),
		hasNewItem = var_20_2
	})
	arg_20_0.Tabs:SetTabs(var_20_0)
	arg_20_0.Tabs:SetAlignment(LUI.Alignment.Left)

	local var_20_3 = arg_20_0.Tabs:GetTabAtIndex(var_0_0.GESTURES + 1)

	if var_20_3 then
		var_20_3:SetBreadcrumb(var_20_1)
	end

	local var_20_4 = arg_20_0.Tabs:GetTabAtIndex(var_0_0.SPRAYS + 1)

	if var_20_4 then
		var_20_4:SetBreadcrumb(var_20_2)
	end
end

local function var_0_17(arg_21_0, arg_21_1)
	ACTIONS.AnimateSequence(arg_21_0, "Popup")
	var_0_4(arg_21_0, arg_21_1, {
		previewMode = true
	})
end

local function var_0_18(arg_22_0, arg_22_1)
	arg_22_0.bindButton:addEventHandler("button_right_stick", function()
		var_0_17(arg_22_0, arg_22_1)
	end)
end

local function var_0_19(arg_24_0, arg_24_1)
	if arg_24_0._newRefs[arg_24_1] then
		arg_24_0._newRefs[arg_24_1] = nil

		if #arg_24_0._newRefs <= 0 then
			arg_24_0.Tabs:GetCurrentTab().NewItemSmallIcon:SetAlpha(0)
		end
	end
end

local function var_0_20(arg_25_0)
	local var_25_0 = (function()
		local var_26_0 = 0

		for iter_26_0, iter_26_1 in ipairs(arg_25_0._currentTable) do
			if arg_25_0._equippedRefs[iter_26_1.ref] then
				return iter_26_0 - 1
			end
		end

		return var_26_0
	end)()
	local var_25_1 = arg_25_0.Grid:GetPositionForIndex(var_25_0)

	arg_25_0.Grid:SetFocusedPosition(var_25_1, true, nil, nil, nil)
end

local function var_0_21(arg_27_0)
	if arg_27_0._isComingFromFilterMenu and LUI.IsLastInputGamepad(arg_27_0._controllerIndex) then
		local var_27_0 = (function()
			for iter_28_0, iter_28_1 in ipairs(arg_27_0._currentTable) do
				if iter_28_1.lootID == arg_27_0._currentSelectedLootID then
					return iter_28_0 - 1
				end
			end

			return 0
		end)()
		local var_27_1 = arg_27_0.Grid:GetPositionForIndex(var_27_0)

		arg_27_0.Grid:SetFocusedPosition(var_27_1, true, nil, nil, nil)

		arg_27_0._isComingFromFilterMenu = false

		return true
	end
end

local function var_0_22(arg_29_0, arg_29_1, arg_29_2)
	assert(arg_29_0.MenuTitle)
	assert(arg_29_0.Tabs)
	assert(arg_29_0.Grid)
	assert(arg_29_0.FavoriteAndSort)

	arg_29_0.UpdateGrid = var_0_12
	arg_29_0.SetFavorite = var_0_2
	arg_29_0.ButtonAction = var_0_7
	arg_29_0.ButtonOver = var_0_8
	arg_29_0.EquipSelection = var_0_3
	arg_29_0.ClosePopupAction = var_0_5
	arg_29_0.ClosePopupPreviewAction = var_0_6
	arg_29_0.RemoveRefFromNewList = var_0_19
	arg_29_0.FocusFunction = var_0_20
	arg_29_0._lootType = 0
	arg_29_0._controllerIndex = arg_29_1

	arg_29_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION"))
	arg_29_0.DetailPanel:SetupPanel(arg_29_0.DetailPanel:GetCurrentAnchorsAndPositions())
	ACTIONS.AnimateSequence(arg_29_0.DetailPanel, "HideCurrentEquipped")

	arg_29_0._gesturesTable = GESTURES.GetAllGestures(arg_29_1, {
		shouldOnlyIncludeCurrentTitle = true
	})
	arg_29_0._spraysTable = SPRAYS.GetAllSprays(arg_29_1, {
		shouldOnlyIncludeCurrentTitle = true
	})
	arg_29_0._isComingFromFilterMenu = false

	arg_29_0:addEventHandler("restore_focus", var_0_21)

	arg_29_0._selection = {}
	arg_29_0._favorites = {}
	arg_29_0._newRefs = {}

	LOOT.SetupSortingBehavior(arg_29_0, arg_29_1, LOOT.itemTypes.GESTURES)
	var_0_16(arg_29_0, arg_29_1)
	var_0_14(arg_29_0, arg_29_1)

	if not CONDITIONS.IsNewBarracksIdentityEnabled() then
		var_0_18(arg_29_0, arg_29_1)
	end

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	arg_29_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION"))
	arg_29_0.bindButton:addEventHandler("button_left_trigger", function(arg_30_0, arg_30_1)
		if LUI.IsLastInputGamepad(arg_30_1.controller) then
			local var_30_0 = arg_29_0.Grid:GetFocusPositionIndex()

			if var_30_0 ~= nil then
				arg_29_0._currentSelectedLootID = arg_29_0._currentTable[var_30_0 + 1].lootID
			end
		end

		local var_30_1 = {
			data = {}
		}

		LOOT.SetupSortingBehavior(var_30_1.data, arg_29_0._controllerIndex, LOOT.itemTypes.GESTURES)

		var_30_1.controllerIndex = arg_29_1
		var_30_1.type = LOOT.itemTypes.GESTURES
		var_30_1.menu = arg_29_0

		local var_30_2 = MenuBuilder.BuildRegisteredType("CustomizeSortingPopup", var_30_1)

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_29_1, false, {
			flyInLeftNarrow = true,
			disableQuickAccessShortcuts = false,
			widget = var_30_2
		})
		var_30_2:addEventHandler("menu_close", function(arg_31_0, arg_31_1)
			arg_29_0._isComingFromFilterMenu = true

			var_0_14(arg_29_0, arg_29_1)
		end)
	end)

	local var_29_0 = Engine.DCJHCAFIIA()
	local var_29_1 = GESTURES.GetEquippedRadialRefsConfig(arg_29_0, arg_29_1)

	arg_29_0:addEventHandler("menu_close", function(arg_32_0, arg_32_1)
		local var_32_0 = GESTURES.GetEquippedRadialRefsConfig(arg_29_0, arg_29_1)

		METRICS.LootUsageSendDLogEvent(arg_29_0, {
			controllerIndex = arg_29_1,
			startTime = var_29_0,
			previousItemIDs = var_29_1,
			newItemIDs = var_32_0
		})
	end)

	local function var_29_2()
		local var_33_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_29_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_29_0:addAndCallEventHandler("onVideoChange", var_29_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_29_0, arg_29_1)
	ACTIONS.ScaleFullscreen(arg_29_0.Darken)
	ACTIONS.ScaleFullscreen(arg_29_0.Vignette)
	arg_29_0:registerEventHandler("update_input_type", function(arg_34_0, arg_34_1)
		local var_34_0 = arg_34_1.controller or arg_29_1

		if not LUI.IsLastInputMouseNavigation(var_34_0) then
			ACTIONS.LoseFocus(arg_34_0, "Scrollbar", var_34_0)
		end
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_29_0)
	end
end

function RadialCustomizationMenu(arg_35_0, arg_35_1)
	local var_35_0 = LUI.UIElement.new()

	var_35_0.id = "RadialCustomizationMenu"
	var_35_0._animationSets = var_35_0._animationSets or {}
	var_35_0._sequences = var_35_0._sequences or {}

	local var_35_1 = arg_35_1 and arg_35_1.controllerIndex

	if not var_35_1 and not Engine.DDJFBBJAIG() then
		var_35_1 = var_35_0:getRootController()
	end

	assert(var_35_1)

	var_35_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_35_1
	})
	var_35_0.HelperBar.id = "HelperBar"

	var_35_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_35_0.HelperBar:setPriority(10)
	var_35_0:addElement(var_35_0.HelperBar)

	local var_35_2 = var_35_0
	local var_35_3
	local var_35_4 = {
		worldBlur = 1,
		controllerIndex = var_35_1
	}
	local var_35_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_35_4)

	var_35_5.id = "WorldBlur"

	var_35_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_35_0:addElement(var_35_5)

	var_35_0.WorldBlur = var_35_5

	local var_35_6
	local var_35_7 = LUI.UIImage.new()

	var_35_7.id = "Darken"

	var_35_7:SetRGBFromInt(0, 0)
	var_35_7:SetAlpha(0.5, 0)
	var_35_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_35_0:addElement(var_35_7)

	var_35_0.Darken = var_35_7

	local var_35_8
	local var_35_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_35_1
	})

	var_35_9.id = "Vignette"

	var_35_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_35_0:addElement(var_35_9)

	var_35_0.Vignette = var_35_9

	local var_35_10
	local var_35_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_35_1
	})

	var_35_11.id = "TabBacker"

	var_35_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_35_0:addElement(var_35_11)

	var_35_0.TabBacker = var_35_11

	local var_35_12
	local var_35_13 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 7,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 5,
		springCoefficient = 400,
		controllerIndex = var_35_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("RadialCustomizationButton", {
				controllerIndex = var_35_1
			})
		end,
		refreshChild = function(arg_37_0, arg_37_1, arg_37_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 150,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_35_14 = LUI.UIGrid.new(var_35_13)

	var_35_14.id = "Grid"

	var_35_14:setUseStencil(true)
	var_35_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1136, _1080p * 244, _1080p * 834)
	var_35_0:addElement(var_35_14)

	var_35_0.Grid = var_35_14

	local var_35_15
	local var_35_16 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_35_1
	})

	var_35_16.id = "Scrollbar"

	var_35_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1211, _1080p * 1230, _1080p * 244, _1080p * 870)
	var_35_0:addElement(var_35_16)

	var_35_0.Scrollbar = var_35_16

	local var_35_17
	local var_35_18 = LUI.UIImage.new()

	var_35_18.id = "GridDivider"

	var_35_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_35_18:SetAlpha(0.6, 0)
	var_35_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1206, _1080p * 230, _1080p * 231)
	var_35_0:addElement(var_35_18)

	var_35_0.GridDivider = var_35_18

	local var_35_19
	local var_35_20 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_35_1
	})

	var_35_20.id = "MenuTitle"

	var_35_20.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_CUSTOMIZATION")), 0)
	var_35_20.Line:SetLeft(0, 0)
	var_35_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_35_0:addElement(var_35_20)

	var_35_0.MenuTitle = var_35_20

	local var_35_21
	local var_35_22 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_35_1
			})
		end,
		controllerIndex = var_35_1
	}
	local var_35_23 = LUI.TabManager.new(var_35_22)

	var_35_23.id = "Tabs"

	var_35_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_35_0:addElement(var_35_23)

	var_35_0.Tabs = var_35_23

	local var_35_24
	local var_35_25 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_35_1
	})

	var_35_25.id = "LobbyMembersFooter"

	var_35_25:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_35_0:addElement(var_35_25)

	var_35_0.LobbyMembersFooter = var_35_25

	local var_35_26
	local var_35_27 = MenuBuilder.BuildRegisteredType("CustomizationDetailPanel", {
		controllerIndex = var_35_1
	})

	var_35_27.id = "DetailPanel"

	var_35_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1269, _1080p * 1824, _1080p * 230, _1080p * 426)
	var_35_0:addElement(var_35_27)

	var_35_0.DetailPanel = var_35_27

	local var_35_28
	local var_35_29 = LUI.UIStyledText.new()

	var_35_29.id = "ItemsCollected"

	var_35_29:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_35_29:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X"), 0)
	var_35_29:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_35_29:SetAlignment(LUI.Alignment.Left)
	var_35_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 281, _1080p * 201, _1080p * 223)
	var_35_0:addElement(var_35_29)

	var_35_0.ItemsCollected = var_35_29

	local var_35_30
	local var_35_31 = MenuBuilder.BuildRegisteredType("FavoriteAndSort", {
		controllerIndex = var_35_1
	})

	var_35_31.id = "FavoriteAndSort"

	var_35_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 865, _1080p * 1206, _1080p * 200, _1080p * 224)
	var_35_0:addElement(var_35_31)

	var_35_0.FavoriteAndSort = var_35_31

	local function var_35_32()
		return
	end

	var_35_0._sequences.DefaultSequence = var_35_32

	local var_35_33
	local var_35_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_35_27:RegisterAnimationSequence("Popup", var_35_34)

	local function var_35_35()
		var_35_27:AnimateSequence("Popup")
	end

	var_35_0._sequences.Popup = var_35_35

	local var_35_36
	local var_35_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_35_27:RegisterAnimationSequence("Normal", var_35_37)

	local function var_35_38()
		var_35_27:AnimateSequence("Normal")
	end

	var_35_0._sequences.Normal = var_35_38

	local var_35_39 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_35_16,
		startCap = var_35_16.startCap,
		endCap = var_35_16.endCap,
		sliderArea = var_35_16.sliderArea,
		slider = var_35_16.sliderArea and var_35_16.sliderArea.slider,
		fixedSizeSlider = var_35_16.sliderArea and var_35_16.sliderArea.fixedSizeSlider
	})

	var_35_14:AddScrollbar(var_35_39)
	var_35_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_35_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_35_40 = LUI.UIBindButton.new()

	var_35_40.id = "selfBindButton"

	var_35_0:addElement(var_35_40)

	var_35_0.bindButton = var_35_40

	var_35_0.bindButton:addEventHandler("button_secondary", function(arg_42_0, arg_42_1)
		if not arg_42_1.controller then
			local var_42_0 = var_35_1
		end

		ACTIONS.LeaveMenu(var_35_0)
	end)
	var_0_22(var_35_0, var_35_1, arg_35_1)
	ACTIONS.AnimateSequenceByElement(var_35_0, {
		elementPath = "self.DetailPanel",
		sequenceName = "HideCurrentEquipped",
		elementName = "DetailPanel"
	})

	return var_35_0
end

MenuBuilder.registerType("RadialCustomizationMenu", RadialCustomizationMenu)
LockTable(_M)
