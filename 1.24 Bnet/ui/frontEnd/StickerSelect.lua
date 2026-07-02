module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0.StickerGrid:GetFocusPositionIndex()

	if var_1_0 then
		return var_1_0 + 1
	end
end

local function var_0_1(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = 0
	local var_2_2 = 0
	local var_2_3 = StringTable.BFHCAIIDA(CSV.stickers.file)

	for iter_2_0 = 0, var_2_3 - 1 do
		local var_2_4 = CSV.ReadRow(CSV.stickers, iter_2_0)

		if var_2_4 and var_2_4.hideInUI ~= "1" then
			var_2_4.isUnlocked = LOOT.IsUnlocked(arg_2_0._controllerIndex, LOOT.itemTypes.STICKER, var_2_4.ref) or var_2_4.ref == WEAPON.StickerNoneValue
			var_2_4.rarity = LOOT.GetItemQuality(LOOT.itemTypes.STICKER, var_2_4.ref)
			var_2_4.season, var_2_4.event, var_2_4.isPremium = LOOT.GetItemSeason(LOOT.itemTypes.STICKER, var_2_4.ref)
			var_2_4.lootID = LOOT.GetItemID(LOOT.itemTypes.STICKER, var_2_4.ref)
			var_2_4.isNew = Loot.HDJCADADF(arg_2_0._controllerIndex, var_2_4.lootID)

			table.insert(var_2_0, var_2_4)

			if var_2_4.ref ~= WEAPON.StickerNoneValue then
				if var_2_4.isUnlocked then
					var_2_1 = var_2_1 + 1
					var_2_2 = var_2_2 + 1
				elseif not var_2_4.isPremium then
					var_2_2 = var_2_2 + 1
				end
			end
		end
	end

	arg_2_0.ItemsCollected:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y", var_2_1, var_2_2))

	return var_2_0
end

local function var_0_2(arg_3_0, arg_3_1)
	if not arg_3_0._allStickersTable or #arg_3_0._allStickersTable == 0 then
		arg_3_0._allStickersTable = var_0_1(arg_3_0)
	end

	arg_3_0._stickerTable = {}

	for iter_3_0 = 1, #arg_3_0._allStickersTable do
		if arg_3_0._allStickersTable[iter_3_0].isUnlocked or arg_3_0.lockedSortingType == LOOT.lockedSortingOptions.SHOW then
			table.insert(arg_3_0._stickerTable, arg_3_0._allStickersTable[iter_3_0])
		end
	end

	table.sort(arg_3_0._stickerTable, function(arg_4_0, arg_4_1)
		if arg_4_0.ref ~= WEAPON.StickerNoneValue and arg_4_1.ref == WEAPON.StickerNoneValue then
			return false
		elseif arg_4_0.ref == WEAPON.StickerNoneValue and not arg_4_1.ref == WEAPON.StickerNoneValue then
			return true
		end

		if arg_3_0._favoriteStickers[arg_4_0.ref] ~= arg_3_0._favoriteStickers[arg_4_1.ref] then
			return arg_3_0._favoriteStickers[arg_4_0.ref] and not arg_3_0._favoriteStickers[arg_4_1.ref]
		end

		local var_4_0 = Loot.HDJCADADF(arg_3_0._controllerIndex, arg_4_0.lootID)
		local var_4_1 = Loot.HDJCADADF(arg_3_0._controllerIndex, arg_4_1.lootID)

		if var_4_0 ~= var_4_1 then
			return var_4_0 and not var_4_1
		end

		if arg_4_0.isUnlocked ~= arg_4_1.isUnlocked then
			return arg_4_0.isUnlocked and not arg_4_1.isUnlocked
		end

		if arg_4_0.season ~= arg_4_1.season and arg_3_0.seasonsSortingType ~= LOOT.seasonsSortingOptions.NONE then
			if arg_3_0.seasonsSortingType == LOOT.seasonsSortingOptions.OLD_FIRST then
				return arg_4_0.season < arg_4_1.season
			elseif arg_3_0.seasonsSortingType == LOOT.seasonsSortingOptions.RECENT_FIRST then
				return arg_4_0.season > arg_4_1.season
			end
		end

		if arg_4_0.rarity ~= arg_4_1.rarity and arg_3_0.raritySortingOptions ~= LOOT.raritySortingOptions.NONE then
			if arg_3_0.raritySortingType == LOOT.raritySortingOptions.LOW_FIRST then
				return arg_4_0.rarity < arg_4_1.rarity
			elseif arg_3_0.raritySortingType == LOOT.raritySortingOptions.HIGH_FIRST then
				return arg_4_0.rarity > arg_4_1.rarity
			end
		end

		local var_4_2 = Engine.CBBHFCGDIC(arg_4_0.name)
		local var_4_3 = Engine.CBBHFCGDIC(arg_4_1.name)

		if var_4_2 ~= var_4_3 then
			return var_4_2 < var_4_3
		end

		return false
	end)
	arg_3_0.FavoriteAndSort:Update(arg_3_1, arg_3_0)
end

local function var_0_3(arg_5_0)
	local var_5_0 = (function()
		for iter_6_0, iter_6_1 in ipairs(arg_5_0._stickerTable) do
			if arg_5_0._equippedSticker == iter_6_1.ref then
				return iter_6_0 - 1
			end
		end
	end)() or 0
	local var_5_1 = arg_5_0.StickerGrid:GetPositionForIndex(var_5_0)

	arg_5_0.StickerGrid:SetFocusedPosition(var_5_1, true)
end

local function var_0_4(arg_7_0)
	if arg_7_0._isComingFromFilterMenu and LUI.IsLastInputGamepad(arg_7_0._controllerIndex) then
		local var_7_0 = (function()
			for iter_8_0, iter_8_1 in ipairs(arg_7_0._stickerTable) do
				if arg_7_0._currentSelectedSticker == iter_8_1.ref then
					return iter_8_0 - 1
				end
			end

			return 0
		end)()
		local var_7_1 = arg_7_0.StickerGrid:GetPositionForIndex(var_7_0)

		arg_7_0.StickerGrid:SetFocusedPosition(var_7_1, true, nil, nil, nil)

		arg_7_0._isComingFromFilterMenu = false

		return true
	end
end

local function var_0_5(arg_9_0)
	local var_9_0 = var_0_0(arg_9_0)

	if not var_9_0 then
		return
	end

	local var_9_1 = arg_9_0._stickerTable[var_9_0]

	if var_9_1.ref == WEAPON.StickerNoneValue or not var_9_1.isUnlocked then
		return
	end

	if arg_9_0._favoriteStickers[var_9_1.ref] then
		LOOT.RemoveFavoriteForType(LOOT.itemTypes.STICKER, var_9_1.ref)
	elseif arg_9_0._favoriteStickers.count >= LOOT.maxFavorites then
		ACTIONS.AnimateSequence(arg_9_0.FavoriteAndSort.FavoritesPrompt, "Warning")
		Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

		return
	else
		LOOT.AddFavoriteForType(LOOT.itemTypes.STICKER, var_9_1.ref)
	end

	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

	local var_9_2 = ""
	local var_9_3 = ""
	local var_9_4

	if not arg_9_0._favoriteStickers[var_9_1.ref] then
		var_9_2 = "LUA_MENU/ITEM_FAVORITED"
		var_9_4 = "cac_equip_fill"
	else
		var_9_2 = "LUA_MENU/ITEM_UNFAVORITED"
		var_9_4 = "cac_equip_ring"
	end

	local var_9_5 = {
		iconScale = -0.3,
		displayTime = 1500,
		icon = var_9_4,
		iconColor = SWATCHES.genericMenu.notificationHighlight,
		header = Engine.CBBHFCGDIC(var_9_2),
		description = Engine.CBBHFCGDIC(var_9_1.name),
		controllerIndex = controllerIndex
	}

	arg_9_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_9_5
	})

	arg_9_0._favoriteStickers = LOOT.GetFavoritesForType(LOOT.itemTypes.STICKER)

	arg_9_0.StickerGrid:RefreshContent()
end

local function var_0_6(arg_10_0)
	local var_10_0 = var_0_0(arg_10_0)

	if not var_10_0 then
		return
	end

	local var_10_1 = arg_10_0._stickerTable[var_10_0]

	if arg_10_0._equippedSticker == var_10_1.ref then
		var_10_1 = arg_10_0._stickerTable[1]
	end

	WEAPON.SetEquippedStickerForIndex(arg_10_0.weaponPlayerData, arg_10_0._slotIndex, var_10_1.ref)
	arg_10_0:UpdateGrid()

	local var_10_2 = "hud_cmd_active_backer"

	if var_10_1.image ~= "" then
		var_10_2 = var_10_1.image
	end

	local var_10_3 = {
		displayTime = 2000,
		icon = var_10_2,
		header = Engine.CBBHFCGDIC("LUA_MENU/STICKER_EQUIPPED"),
		description = Engine.CBBHFCGDIC(var_10_1.name),
		type = LUI.ToastManager.NotificationType.StickerEquipped,
		controllerIndex = arg_10_0._controllerIndex
	}

	arg_10_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_10_3
	})
end

local function var_0_7(arg_11_0)
	local var_11_0 = var_0_0(arg_11_0)

	if not var_11_0 then
		return
	end

	local var_11_1 = arg_11_0._stickerTable[var_11_0]

	if var_11_1.isUnlocked then
		if var_11_1.ref ~= WEAPON.StickerNoneValue then
			arg_11_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(1)

			local var_11_2 = arg_11_0._favoriteStickers[var_11_1.ref]
			local var_11_3 = arg_11_0._favoriteStickers.count

			arg_11_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_11_2, var_11_3)
		else
			arg_11_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(0)
		end
	else
		arg_11_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(0)
	end

	var_11_1.isSelected = arg_11_0._equippedSticker == var_11_1.ref

	if Engine.DDJFBBJAIG() then
		local var_11_4 = WEAPON.GenerateWeaponTable(arg_11_0.weaponPlayerData)

		var_11_4.stickers[arg_11_0._slotIndex] = var_11_1.ref

		local var_11_5 = WEAPON.GetWeaponModelName(var_11_4.weapon, var_11_4, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_11_0._controllerIndex
		})

		FrontEndScene.RequestWeaponViewModels({
			var_11_5
		}, arg_11_0._controllerIndex)
		WEAPON.SetModelIfLoaded(arg_11_0._controllerIndex, arg_11_0.weaponModel, var_11_5)
	end

	arg_11_0.LootDetails:SetupDetails(var_11_1)
end

local function var_0_8(arg_12_0)
	local var_12_0 = {
		weaponTable = WEAPON.GenerateWeaponTable(arg_12_0.weaponPlayerData)
	}
	local var_12_1 = var_0_0(arg_12_0)

	if var_12_1 then
		local var_12_2 = arg_12_0._stickerTable[var_12_1]

		var_12_0.weaponTable.stickers[arg_12_0._slotIndex] = var_12_2.ref
	end

	LUI.FlowManager.RequestAddMenu("WeaponPreview", true, controllerIndex, nil, var_12_0, true)
end

local function var_0_9(arg_13_0)
	local var_13_0 = {
		weaponTable = WEAPON.GenerateEmptyWeaponTable(arg_13_0.weaponPlayerData)
	}
	local var_13_1 = var_0_0(arg_13_0)

	if not var_13_1 then
		return
	end

	local var_13_2 = arg_13_0._stickerTable[var_13_1]

	var_13_0.weaponTable.stickers[arg_13_0._slotIndex] = var_13_2.ref

	LUI.FlowManager.RequestAddMenu("WeaponPreview", true, nil, nil, var_13_0, true)
end

local function var_0_10(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if arg_14_2 ~= "STICKERS/DEFAULT" then
		arg_14_1:SetupContextualMenu({
			title = Engine.CBBHFCGDIC(arg_14_2)
		})

		local var_14_0 = {
			id = "playerCardPreview",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_STICKER"),
			actionFunction = function()
				arg_14_0:ViewItem()
			end
		}

		arg_14_1:AddContextualMenuAction(var_14_0)

		local var_14_1 = {
			id = "weaponPreview",
			actionName = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON"),
			actionFunction = function()
				arg_14_0:ViewWeapon()
			end
		}

		arg_14_1:AddContextualMenuAction(var_14_1)

		local var_14_2 = {
			id = "playerCardAddToFavorite",
			actionName = arg_14_3 and Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES") or Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
			actionFunction = function()
				arg_14_0:FavoriteItem()
			end
		}

		arg_14_1:AddContextualMenuAction(var_14_2)
	end
end

local function var_0_11(arg_18_0)
	arg_18_0._equippedSticker = WEAPON.GetEquippedStickerForIndex(arg_18_0.weaponPlayerData, arg_18_0._slotIndex)

	arg_18_0.StickerGrid:RemoveFocusFromChild()
	arg_18_0.StickerGrid:SetNumChildren(#arg_18_0._stickerTable)
	arg_18_0.StickerGrid:RefreshContent()
end

local function var_0_12(arg_19_0)
	return function(arg_20_0, arg_20_1, arg_20_2)
		local var_20_0 = arg_20_1 + arg_20_2 * arg_19_0.StickerGrid:GetNumColumns()
		local var_20_1 = arg_19_0._stickerTable[var_20_0 + 1]

		var_20_1.lootType = LOOT.itemTypes.STICKER

		local var_20_2 = arg_19_0._equippedSticker == var_20_1.ref
		local var_20_3 = arg_19_0._favoriteStickers[var_20_1.ref]

		arg_20_0:RefreshButton(arg_19_0, var_20_1, var_20_2, var_20_3)
		var_0_10(arg_19_0, arg_20_0, var_20_1.name, var_20_3)
	end
end

local function var_0_13(arg_21_0, arg_21_1, arg_21_2)
	assert(arg_21_0.MenuTitle)
	assert(arg_21_0.LootDetails)
	assert(arg_21_0.StickerGrid)
	assert(arg_21_0.FavoriteAndSort)
	arg_21_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/STICKER_SELECT_TITLE_WITH_SLOT", arg_21_2.slotIndex))
	arg_21_0.LootDetails:InitializeDimensions(arg_21_0.LootDetails:GetCurrentAnchorsAndPositions())

	arg_21_0.FavoriteItem = var_0_5
	arg_21_0.EquipItem = var_0_6
	arg_21_0.PreviewItem = var_0_7
	arg_21_0.ViewWeapon = var_0_8
	arg_21_0.ViewItem = var_0_9
	arg_21_0.UpdateGrid = var_0_11
	arg_21_0.SetDefaultFocus = var_0_3
	arg_21_0._controllerIndex = arg_21_1
	arg_21_0._stickerTable = {}
	arg_21_0._allStickersTable = var_0_1(arg_21_0)
	arg_21_0._favoriteStickers = LOOT.GetFavoritesForType(LOOT.itemTypes.STICKER)

	assert(arg_21_2.slotIndex)

	arg_21_0._slotIndex = arg_21_2.slotIndex

	assert(arg_21_2.loadoutIndex)
	assert(arg_21_2.weaponSlot)
	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.Preview
	})

	arg_21_0.weaponModel = WEAPON.GetWeaponModel(arg_21_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.attachmentFile)

	arg_21_0:addElement(arg_21_0.weaponModel)

	arg_21_0.weaponPlayerData = PlayerData.BFFBGAJGD(arg_21_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_21_2.loadoutIndex].weaponSetups[arg_21_2.weaponSlot]

	if Engine.DDJFBBJAIG() then
		local var_21_0 = GUNSMITH.GetAttachmentCategoryScene(arg_21_0.weaponPlayerData.weapon:get(), arg_21_0.weaponPlayerData.variantID:get(), ATTACHMENT.stickerCategory)

		if var_21_0 then
			Engine.DHFCHIIJCA(var_21_0)
		end
	end

	arg_21_0._equippedSticker = WEAPON.GetEquippedStickerForIndex(arg_21_0.weaponPlayerData, arg_21_0._slotIndex)

	LOOT.SetupSortingBehavior(arg_21_0, arg_21_1, LOOT.itemTypes.STICKER)
	var_0_2(arg_21_0, arg_21_1)
	arg_21_0.StickerGrid:SetRefreshChild(var_0_12(arg_21_0))
	arg_21_0:addEventHandler("restore_focus", var_0_4)
	arg_21_0.StickerGrid:SetSnapOnWrapEnabled(true)
	arg_21_0:UpdateGrid()
	arg_21_0:SetDefaultFocus()

	arg_21_0._isComingFromFilterMenu = false

	if CONDITIONS.IsUserSignedInDemonware(arg_21_1) then
		arg_21_0.bindButton:addEventHandler("button_right_trigger", function(arg_22_0, arg_22_1)
			arg_21_0:FavoriteItem()
		end)
	end

	arg_21_0.bindButton:addEventHandler("button_right_stick", function(arg_23_0, arg_23_1)
		arg_21_0:ViewWeapon()

		if arg_23_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)
	arg_21_0.HelperBar:AddButtonHelperTextToElement(arg_21_0, {
		kbm_only = true,
		priority = 4,
		side = "left",
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
	})
	arg_21_0.bindButton:addEventHandler("button_alt1", function(arg_24_0, arg_24_1)
		if LUI.IsLastInputGamepad(arg_24_1.controller) then
			local var_24_0 = arg_21_0.StickerGrid:GetFocusPositionIndex() + 1

			arg_21_0._currentSelectedSticker = arg_21_0._stickerTable[var_24_0].ref
		end

		local var_24_1 = MenuBuilder.BuildRegisteredType("CustomizeSortingPopup", {
			controllerIndex = arg_21_1,
			menu = arg_21_0,
			type = LOOT.itemTypes.STICKER
		})

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_21_1, false, {
			flyInLeftNarrow = true,
			disableQuickAccessShortcuts = false,
			widget = var_24_1
		})
		var_24_1:addEventHandler("menu_close", function(arg_25_0, arg_25_1)
			arg_21_0._isComingFromFilterMenu = true

			var_0_2(arg_21_0, arg_21_1)
			arg_21_0:UpdateGrid()
		end)
	end)

	local var_21_1 = arg_21_0.weaponPlayerData.weapon:get()

	if PROGRESSION.ShouldUnlockAll() then
		arg_21_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_21_0.GunsmithWeaponLevel:Setup(arg_21_1, var_21_1)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_21_0.TabBacker)
end

function StickerSelect(arg_26_0, arg_26_1)
	local var_26_0 = LUI.UIElement.new()

	var_26_0.id = "StickerSelect"

	local var_26_1 = arg_26_1 and arg_26_1.controllerIndex

	if not var_26_1 and not Engine.DDJFBBJAIG() then
		var_26_1 = var_26_0:getRootController()
	end

	assert(var_26_1)

	var_26_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_26_1
	})
	var_26_0.HelperBar.id = "HelperBar"

	var_26_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_26_0.HelperBar:setPriority(10)
	var_26_0:addElement(var_26_0.HelperBar)

	local var_26_2 = var_26_0
	local var_26_3

	if CONDITIONS.InGame(var_26_0) then
		local var_26_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_26_1
		})

		var_26_4.id = "InGameMenuBackground"

		var_26_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_26_0:addElement(var_26_4)

		var_26_0.InGameMenuBackground = var_26_4
	end

	local var_26_5
	local var_26_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_26_1
	})

	var_26_6.id = "TabBacker"

	var_26_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_26_0:addElement(var_26_6)

	var_26_0.TabBacker = var_26_6

	local var_26_7
	local var_26_8 = {
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
		controllerIndex = var_26_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericLootButton", {
				controllerIndex = var_26_1
			})
		end,
		refreshChild = function(arg_28_0, arg_28_1, arg_28_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 126,
		rowHeight = _1080p * 126,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_26_9 = LUI.UIGrid.new(var_26_8)

	var_26_9.id = "StickerGrid"

	var_26_9:setUseStencil(true)
	var_26_9:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 1755, _1080p * -365, _1080p * -103)
	var_26_0:addElement(var_26_9)

	var_26_0.StickerGrid = var_26_9

	local var_26_10
	local var_26_11 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_26_1
	})

	var_26_11.id = "Scrollbar"

	var_26_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1757, _1080p * 1767, _1080p * -365, _1080p * -103)
	var_26_0:addElement(var_26_11)

	var_26_0.Scrollbar = var_26_11

	local var_26_12
	local var_26_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_26_1
	})

	var_26_13.id = "MenuTitle"

	var_26_13.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/STICKER_SELECT_TITLE"), 0)
	var_26_13.Line:SetLeft(0, 0)
	var_26_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_26_0:addElement(var_26_13)

	var_26_0.MenuTitle = var_26_13

	local var_26_14

	if CONDITIONS.InFrontend(var_26_0) then
		local var_26_15 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_26_1
		})

		var_26_15.id = "LobbyMembersFooter"

		var_26_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_26_0:addElement(var_26_15)

		var_26_0.LobbyMembersFooter = var_26_15
	end

	local var_26_16
	local var_26_17 = LUI.UIStyledText.new()

	var_26_17.id = "ItemsCollected"

	var_26_17:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_26_17:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_26_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_26_17:SetAlignment(LUI.Alignment.Left)
	var_26_17:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 129, _1080p * 314, _1080p * -400, _1080p * -378)
	var_26_0:addElement(var_26_17)

	var_26_0.ItemsCollected = var_26_17

	local var_26_18
	local var_26_19 = MenuBuilder.BuildRegisteredType("FavoriteAndSort", {
		controllerIndex = var_26_1
	})

	var_26_19.id = "FavoriteAndSort"

	var_26_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1470, _1080p * 1752, _1080p * -400, _1080p * -376)
	var_26_0:addElement(var_26_19)

	var_26_0.FavoriteAndSort = var_26_19

	local var_26_20
	local var_26_21 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_26_1
	})

	var_26_21.id = "GunsmithWeaponLevel"

	var_26_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_26_0:addElement(var_26_21)

	var_26_0.GunsmithWeaponLevel = var_26_21

	local var_26_22
	local var_26_23 = LUI.UIImage.new()

	var_26_23.id = "Line"

	var_26_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_26_23:SetAlpha(0.6, 0)
	var_26_23:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 1752, _1080p * -376, _1080p * -375)
	var_26_0:addElement(var_26_23)

	var_26_0.Line = var_26_23

	local var_26_24
	local var_26_25 = MenuBuilder.BuildRegisteredType("LootDetails", {
		controllerIndex = var_26_1
	})

	var_26_25.id = "LootDetails"

	var_26_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 636, _1080p * 200, _1080p * 310)
	var_26_0:addElement(var_26_25)

	var_26_0.LootDetails = var_26_25

	local var_26_26 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_26_11,
		startCap = var_26_11.startCap,
		endCap = var_26_11.endCap,
		sliderArea = var_26_11.sliderArea,
		slider = var_26_11.sliderArea and var_26_11.sliderArea.slider,
		fixedSizeSlider = var_26_11.sliderArea and var_26_11.sliderArea.fixedSizeSlider
	})

	var_26_9:AddScrollbar(var_26_26)
	var_26_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_26_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/WEAPON_CUSTOMIZATION_SELECTION")
	})
	var_26_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
	})

	local var_26_27 = LUI.UIBindButton.new()

	var_26_27.id = "selfBindButton"

	var_26_0:addElement(var_26_27)

	var_26_0.bindButton = var_26_27

	var_26_0.bindButton:addEventHandler("button_secondary", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_26_1
		end

		ACTIONS.LeaveMenu(var_26_0)
	end)
	var_0_13(var_26_0, var_26_1, arg_26_1)

	return var_26_0
end

MenuBuilder.registerType("StickerSelect", StickerSelect)
LockTable(_M)
