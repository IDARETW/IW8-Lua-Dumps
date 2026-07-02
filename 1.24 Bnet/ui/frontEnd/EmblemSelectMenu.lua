module(..., package.seeall)

local var_0_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
local var_0_1 = LUI.DataSourceInControllerModel.new(var_0_0 .. ".emblemIndex")

local function var_0_2(arg_1_0)
	local var_1_0 = arg_1_0.EmblemsGrid:GetFocusPositionIndex()

	if var_1_0 then
		return var_1_0 + 1
	end
end

local function var_0_3(arg_2_0, arg_2_1)
	arg_2_0._emblemTable = {}

	if not arg_2_0._allEmblemsTable then
		arg_2_0._allEmblemsTable = EmblemEditorUtils.GetAllEmblems(arg_2_1)
	end

	local var_2_0 = 0
	local var_2_1 = 0

	for iter_2_0 = 1, #arg_2_0._allEmblemsTable do
		local var_2_2 = arg_2_0._allEmblemsTable[iter_2_0]

		if var_2_2.hideInUI ~= "1" then
			if var_2_2.isUnlocked then
				var_2_0 = var_2_0 + 1
				var_2_1 = var_2_1 + 1
			elseif not var_2_2.isPremium then
				var_2_1 = var_2_1 + 1
			end
		end
	end

	arg_2_0.ItemsCollected:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y", var_2_0, var_2_1))

	for iter_2_1 = 1, #arg_2_0._allEmblemsTable do
		if arg_2_0._allEmblemsTable[iter_2_1].isUnlocked or arg_2_0.lockedSortingType == LOOT.lockedSortingOptions.SHOW then
			table.insert(arg_2_0._emblemTable, arg_2_0._allEmblemsTable[iter_2_1])
		end
	end

	table.sort(arg_2_0._emblemTable, function(arg_3_0, arg_3_1)
		if arg_2_0._favoriteEmblems[arg_3_0.ref] ~= arg_2_0._favoriteEmblems[arg_3_1.ref] then
			return arg_2_0._favoriteEmblems[arg_3_0.ref] and not arg_2_0._favoriteEmblems[arg_3_1.ref]
		end

		local var_3_0 = Loot.HDJCADADF(arg_2_0._controllerIndex, arg_3_0.lootID)
		local var_3_1 = Loot.HDJCADADF(arg_2_0._controllerIndex, arg_3_1.lootID)

		if var_3_0 ~= var_3_1 then
			return var_3_0 and not var_3_1
		end

		if arg_3_0.isUnlocked ~= arg_3_1.isUnlocked then
			return arg_3_0.isUnlocked and not arg_3_1.isUnlocked
		end

		if arg_2_0.officerSortingType ~= LOOT.officerSortingOptions.NONE and arg_3_0.isOfficerEmblem ~= arg_3_1.isOfficerEmblem then
			return arg_3_0.isOfficerEmblem and not arg_3_1.isOfficerEmblem
		end

		if arg_3_0.isOfficerEmblem and arg_3_1.isOfficerEmblem and arg_2_0.officerSortingType ~= LOOT.officerSortingOptions.NONE then
			if arg_3_0.officerSeason ~= arg_3_1.officerSeason then
				return arg_3_0.officerSeason < arg_3_1.officerSeason
			else
				return arg_3_0.ref < arg_3_1.ref
			end
		else
			if arg_3_0.season ~= arg_3_1.season and arg_2_0.seasonsSortingType ~= LOOT.seasonsSortingOptions.NONE then
				if arg_2_0.seasonsSortingType == LOOT.seasonsSortingOptions.OLD_FIRST then
					return arg_3_0.season < arg_3_1.season
				elseif arg_2_0.seasonsSortingType == LOOT.seasonsSortingOptions.RECENT_FIRST then
					return arg_3_0.season > arg_3_1.season
				end
			end

			if arg_3_0.rarity ~= arg_3_1.rarity and arg_2_0.raritySortingOptions ~= LOOT.raritySortingOptions.NONE then
				if arg_2_0.raritySortingType == LOOT.raritySortingOptions.LOW_FIRST then
					return arg_3_0.rarity < arg_3_1.rarity
				elseif arg_2_0.raritySortingType == LOOT.raritySortingOptions.HIGH_FIRST then
					return arg_3_0.rarity > arg_3_1.rarity
				end
			end

			local var_3_2 = Engine.CBBHFCGDIC(arg_3_0.name)
			local var_3_3 = Engine.CBBHFCGDIC(arg_3_1.name)

			if var_3_2 ~= var_3_3 then
				return var_3_2 < var_3_3
			end
		end

		return false
	end)
	arg_2_0.FavoriteAndSort:Update(arg_2_1, arg_2_0)
end

local function var_0_4(arg_4_0)
	local var_4_0 = (function()
		for iter_5_0, iter_5_1 in ipairs(arg_4_0._emblemTable) do
			if arg_4_0._equippedEmblemIndex == tonumber(iter_5_1.index) then
				return iter_5_0 - 1
			end
		end

		return 0
	end)()
	local var_4_1 = arg_4_0.EmblemsGrid:GetPositionForIndex(var_4_0)

	arg_4_0.EmblemsGrid:SetFocusedPosition(var_4_1, true)
end

local function var_0_5(arg_6_0)
	if arg_6_0._isComingFromFilterMenu and LUI.IsLastInputGamepad(arg_6_0._controllerIndex) then
		local var_6_0 = (function()
			for iter_7_0, iter_7_1 in ipairs(arg_6_0._emblemTable) do
				if iter_7_1.lootID == arg_6_0._currentSelectedLootID then
					return iter_7_0 - 1
				end
			end

			return 0
		end)()
		local var_6_1 = arg_6_0.EmblemsGrid:GetPositionForIndex(var_6_0)

		arg_6_0.EmblemsGrid:SetFocusedPosition(var_6_1, true, nil, nil, nil)

		arg_6_0._isComingFromFilterMenu = false

		return true
	end
end

local function var_0_6(arg_8_0)
	local var_8_0 = var_0_2(arg_8_0)

	if not var_8_0 then
		return
	end

	local var_8_1 = arg_8_0._emblemTable[var_8_0]

	if not var_8_1.isUnlocked then
		return
	end

	if arg_8_0._favoriteEmblems[var_8_1.image] then
		LOOT.RemoveFavoriteForType(LOOT.itemTypes.EMBLEM, var_8_1.image)
	elseif arg_8_0._favoriteEmblems.count >= LOOT.maxFavorites then
		ACTIONS.AnimateSequence(arg_8_0.FavoriteAndSort.FavoritesPrompt, "Warning")
		Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

		return
	else
		LOOT.AddFavoriteForType(LOOT.itemTypes.EMBLEM, var_8_1.image)
	end

	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

	local var_8_2 = ""
	local var_8_3 = ""
	local var_8_4

	if not arg_8_0._favoriteEmblems[var_8_1.image] then
		var_8_2 = "LUA_MENU/ITEM_FAVORITED"
		var_8_4 = "cac_equip_fill"
	else
		var_8_2 = "LUA_MENU/ITEM_UNFAVORITED"
		var_8_4 = "cac_equip_ring"
	end

	local var_8_5 = {
		iconScale = -0.3,
		displayTime = 1500,
		icon = var_8_4,
		iconColor = SWATCHES.genericMenu.notificationHighlight,
		header = Engine.CBBHFCGDIC(var_8_2),
		description = Engine.CBBHFCGDIC(var_8_1.name),
		controllerIndex = controllerIndex
	}

	arg_8_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_8_5
	})

	arg_8_0._favoriteEmblems = LOOT.GetFavoritesForType(LOOT.itemTypes.EMBLEM)

	arg_8_0.EmblemsGrid:RefreshContent()

	if #arg_8_0._emblemTable > 0 then
		arg_8_0.NoEmblemsLabel:SetAlpha(0)
	end

	local var_8_6 = arg_8_0.EmblemsGrid:GetPositionForIndex(var_8_0 - 1)

	arg_8_0.EmblemsGrid:SetFocusedPosition(var_8_6, true)
end

local function var_0_7(arg_9_0)
	local var_9_0 = var_0_2(arg_9_0)

	if not var_9_0 then
		return
	end

	local var_9_1 = arg_9_0._emblemTable[var_9_0]
	local var_9_2 = tonumber(var_9_1.index)

	if arg_9_0._equippedEmblemIndex ~= var_9_2 then
		Playercard.DBBICFEAGH(arg_9_0._controllerIndex, var_9_2)
		arg_9_0.DetailPanel.SmallPlayerCard.Emblem:setImage(RegisterMaterial(var_9_1.image))

		arg_9_0._equippedEmblemIndex = var_9_2

		arg_9_0:UpdateGrid()

		local var_9_3 = "hud_cmd_active_backer"

		if var_9_1.image ~= "" then
			var_9_3 = var_9_1.image
		end

		local var_9_4 = {
			displayTime = 2000,
			icon = var_9_3,
			header = Engine.CBBHFCGDIC("LUA_MENU/EMBLEM_EQUIPPED"),
			description = Engine.CBBHFCGDIC(var_9_1.name),
			type = LUI.ToastManager.NotificationType.EmblemEquipped,
			controllerIndex = arg_9_0._controllerIndex
		}

		arg_9_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_9_4
		})
	end
end

local function var_0_8(arg_10_0)
	local var_10_0 = var_0_2(arg_10_0)

	if not var_10_0 then
		return
	end

	local var_10_1 = arg_10_0._emblemTable[var_10_0]
	local var_10_2 = arg_10_0._equippedEmblemIndex == tonumber(var_10_1.index)
	local var_10_3 = Loot.HDJCADADF(arg_10_0._controllerIndex, var_10_1.lootID)

	arg_10_0.DetailPanel:UpdatePanel(var_10_1, var_10_2, var_10_3)

	if var_10_1.isUnlocked then
		arg_10_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(1)

		local var_10_4 = arg_10_0._favoriteEmblems[var_10_1.image]
		local var_10_5 = arg_10_0._favoriteEmblems.count

		arg_10_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_10_4, var_10_5)
	else
		arg_10_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(0)
	end
end

local function var_0_9(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_1:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(arg_11_2)
	})

	local var_11_0 = {
		id = "emblemAddToFavorite",
		actionName = arg_11_3 and Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES") or Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
		actionFunction = function()
			arg_11_0:SetFavorite()
		end
	}

	arg_11_1:AddContextualMenuAction(var_11_0)
end

local function var_0_10(arg_13_0)
	arg_13_0.EmblemsGrid:RemoveFocusFromChild()
	arg_13_0.EmblemsGrid:SetNumChildren(#arg_13_0._emblemTable)
	arg_13_0.EmblemsGrid:RefreshContent()

	if #arg_13_0._emblemTable > 0 then
		arg_13_0.NoEmblemsLabel:SetAlpha(0)
	end
end

local function var_0_11(arg_14_0)
	return function(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0 = arg_15_1 + arg_15_2 * arg_14_0.EmblemsGrid:GetNumColumns()
		local var_15_1 = arg_14_0._emblemTable[var_15_0 + 1]
		local var_15_2 = arg_14_0._equippedEmblemIndex == tonumber(var_15_1.index)
		local var_15_3 = arg_14_0._favoriteEmblems[var_15_1.image]

		arg_15_0:RefreshButton(arg_14_0, var_15_1, var_15_2, var_15_3)
		var_0_9(arg_14_0, arg_15_0, var_15_1.name, var_15_3)
	end
end

local function var_0_12(arg_16_0)
	local var_16_0 = EmblemEditorUtils.GetEmblemRef(arg_16_0._equippedEmblemIndex)

	return LOOT.GetItemID(LOOT.itemTypes.EMBLEM, var_16_0)
end

local function var_0_13(arg_17_0, arg_17_1)
	assert(arg_17_0.MenuTitle)
	assert(arg_17_0.EmblemsGrid)
	assert(arg_17_0.FavoriteAndSort)
	arg_17_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/TITLE_EMBLEM_SELECT"))
	arg_17_0.DetailPanel:UpdatePlayerCardData(arg_17_1)

	arg_17_0.SetFavorite = var_0_6
	arg_17_0.EquipEmblem = var_0_7
	arg_17_0.FavoriteEmblem = FavoriteEmblem
	arg_17_0.PreviewEmblem = var_0_8
	arg_17_0.UpdateGrid = var_0_10
	arg_17_0._controllerIndex = arg_17_1
	arg_17_0._emblemTable = {}
	arg_17_0._allEmblemsTable = EmblemEditorUtils.GetAllEmblems(arg_17_1)
	arg_17_0._favoriteEmblems = LOOT.GetFavoritesForType(LOOT.itemTypes.EMBLEM)
	arg_17_0._equippedEmblemIndex = var_0_1:GetValue(arg_17_1)
	arg_17_0._isComingFromFilterMenu = false

	LOOT.SetupSortingBehavior(arg_17_0, arg_17_1, LOOT.itemTypes.EMBLEM)
	var_0_3(arg_17_0, arg_17_1)
	arg_17_0.EmblemsGrid:SetRefreshChild(var_0_11(arg_17_0))
	arg_17_0:addEventHandler("restore_focus", var_0_5)
	arg_17_0.EmblemsGrid:SetSnapOnWrapEnabled(true)
	arg_17_0:UpdateGrid()
	var_0_4(arg_17_0)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	Playercard.DAHDCGCDEC(arg_17_1)

	local var_17_0 = Engine.DCJHCAFIIA()
	local var_17_1 = var_0_12(arg_17_0)

	arg_17_0:addEventHandler("menu_close", function(arg_18_0, arg_18_1)
		var_0_1:SetValue(arg_17_1, arg_17_0._equippedEmblemIndex)
		Playercard.FCBJJBFBJ(arg_17_1)

		local var_18_0 = var_0_12(arg_17_0)

		METRICS.IdentityUsageSendDLogEvent(arg_17_0, arg_17_1, var_17_0, LOOT.itemTypes.EMBLEM, var_17_1, var_18_0)
	end)

	if CONDITIONS.IsUserSignedInDemonware(arg_17_1) then
		arg_17_0.bindButton:addEventHandler("button_right_trigger", function(arg_19_0, arg_19_1)
			arg_17_0:SetFavorite()
		end)
	end

	arg_17_0:addEventHandler("update_input_type", function(arg_20_0, arg_20_1)
		arg_20_0.FavoriteAndSort:Update(arg_20_1.controllerIndex, arg_20_0)
	end, {
		controllerIndex = arg_17_1
	})
	arg_17_0.HelperBar:AddButtonHelperTextToElement(arg_17_0, {
		kbm_only = true,
		priority = 4,
		side = "left",
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
	})
	arg_17_0.bindButton:addEventHandler("button_alt1", function(arg_21_0, arg_21_1)
		if LUI.IsLastInputGamepad(arg_21_1.controller) then
			local var_21_0 = var_0_2(arg_17_0)

			arg_17_0._currentSelectedLootID = arg_17_0._emblemTable[var_21_0].lootID
		end

		local var_21_1 = MenuBuilder.BuildRegisteredType("CustomizeSortingPopup", {
			controllerIndex = arg_17_1,
			menu = arg_17_0,
			type = LOOT.itemTypes.EMBLEM
		})

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_17_1, false, {
			flyInLeftNarrow = true,
			widget = var_21_1
		})
		var_21_1:addEventHandler("menu_close", function(arg_22_0, arg_22_1)
			arg_17_0._isComingFromFilterMenu = true

			var_0_3(arg_17_0, arg_17_1)
			arg_17_0:UpdateGrid()
		end)
	end)

	local function var_17_2()
		local var_23_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_17_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_17_0:addAndCallEventHandler("onVideoChange", var_17_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_17_0, arg_17_1)
	ACTIONS.ScaleFullscreen(arg_17_0.Darken)
end

function EmblemSelectMenu(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIElement.new()

	var_24_0.id = "EmblemSelectMenu"

	local var_24_1 = arg_24_1 and arg_24_1.controllerIndex

	if not var_24_1 and not Engine.DDJFBBJAIG() then
		var_24_1 = var_24_0:getRootController()
	end

	assert(var_24_1)

	var_24_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_24_1
	})
	var_24_0.HelperBar.id = "HelperBar"

	var_24_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_24_0.HelperBar:setPriority(10)
	var_24_0:addElement(var_24_0.HelperBar)

	local var_24_2 = var_24_0
	local var_24_3
	local var_24_4 = {
		worldBlur = 1,
		controllerIndex = var_24_1
	}
	local var_24_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_24_4)

	var_24_5.id = "WorldBlur"

	var_24_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_24_0:addElement(var_24_5)

	var_24_0.WorldBlur = var_24_5

	local var_24_6
	local var_24_7 = LUI.UIImage.new()

	var_24_7.id = "Darken"

	var_24_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_24_7:SetAlpha(0.5, 0)
	var_24_0:addElement(var_24_7)

	var_24_0.Darken = var_24_7

	local var_24_8
	local var_24_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_24_1
	})

	var_24_9.id = "TabBacker"

	var_24_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_24_0:addElement(var_24_9)

	var_24_0.TabBacker = var_24_9

	local var_24_10
	local var_24_11 = {
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
		controllerIndex = var_24_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("EmblemButton", {
				controllerIndex = var_24_1
			})
		end,
		refreshChild = function(arg_26_0, arg_26_1, arg_26_2)
			return
		end,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 150,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_24_12 = LUI.UIGrid.new(var_24_11)

	var_24_12.id = "EmblemsGrid"

	var_24_12:setUseStencil(true)
	var_24_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1195, _1080p * 244, _1080p * 868)
	var_24_0:addElement(var_24_12)

	var_24_0.EmblemsGrid = var_24_12

	local var_24_13
	local var_24_14 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_24_1
	})

	var_24_14.id = "EmblemsScrollbar"

	var_24_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1199, _1080p * 1218, _1080p * 244, _1080p * 868)
	var_24_0:addElement(var_24_14)

	var_24_0.EmblemsScrollbar = var_24_14

	local var_24_15
	local var_24_16 = LUI.UIText.new()

	var_24_16.id = "NoEmblemsLabel"

	var_24_16:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NO_EMBLEMS"), 0)
	var_24_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_24_16:SetAlignment(LUI.Alignment.Center)
	var_24_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -726, _1080p * 534, _1080p * 579)
	var_24_0:addElement(var_24_16)

	var_24_0.NoEmblemsLabel = var_24_16

	local var_24_17
	local var_24_18 = LUI.UIImage.new()

	var_24_18.id = "GridDivider"

	var_24_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_24_18:SetAlpha(0.6, 0)
	var_24_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1194, _1080p * 230, _1080p * 231)
	var_24_0:addElement(var_24_18)

	var_24_0.GridDivider = var_24_18

	local var_24_19
	local var_24_20 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_24_1
	})

	var_24_20.id = "MenuTitle"

	var_24_20.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/TITLE_EMBLEM_SELECT"), 0)
	var_24_20.Line:SetLeft(0, 0)
	var_24_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_24_0:addElement(var_24_20)

	var_24_0.MenuTitle = var_24_20

	local var_24_21
	local var_24_22 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_24_1
	})

	var_24_22.id = "LobbyMembersFooter"

	var_24_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_24_0:addElement(var_24_22)

	var_24_0.LobbyMembersFooter = var_24_22

	local var_24_23
	local var_24_24 = MenuBuilder.BuildRegisteredType("CustomizationDetailPanel", {
		controllerIndex = var_24_1
	})

	var_24_24.id = "DetailPanel"

	var_24_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1269, _1080p * 1824, _1080p * 230, _1080p * 868)
	var_24_0:addElement(var_24_24)

	var_24_0.DetailPanel = var_24_24

	local var_24_25
	local var_24_26 = LUI.UIStyledText.new()

	var_24_26.id = "ItemsCollected"

	var_24_26:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_24_26:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_24_26:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_24_26:SetAlignment(LUI.Alignment.Left)
	var_24_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 281, _1080p * 201, _1080p * 223)
	var_24_0:addElement(var_24_26)

	var_24_0.ItemsCollected = var_24_26

	local var_24_27
	local var_24_28 = MenuBuilder.BuildRegisteredType("FavoriteAndSort", {
		controllerIndex = var_24_1
	})

	var_24_28.id = "FavoriteAndSort"

	var_24_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1194, _1080p * 200, _1080p * 224)
	var_24_0:addElement(var_24_28)

	var_24_0.FavoriteAndSort = var_24_28

	local var_24_29 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_24_14,
		startCap = var_24_14.startCap,
		endCap = var_24_14.endCap,
		sliderArea = var_24_14.sliderArea,
		slider = var_24_14.sliderArea and var_24_14.sliderArea.slider,
		fixedSizeSlider = var_24_14.sliderArea and var_24_14.sliderArea.fixedSizeSlider
	})

	var_24_12:AddScrollbar(var_24_29)
	var_24_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_24_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_24_30 = LUI.UIBindButton.new()

	var_24_30.id = "selfBindButton"

	var_24_0:addElement(var_24_30)

	var_24_0.bindButton = var_24_30

	var_24_0.bindButton:addEventHandler("button_secondary", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = var_24_1
		end

		ACTIONS.LeaveMenu(var_24_0)
	end)
	var_0_13(var_24_0, var_24_1, arg_24_1)

	return var_24_0
end

MenuBuilder.registerType("EmblemSelectMenu", EmblemSelectMenu)
LockTable(_M)
