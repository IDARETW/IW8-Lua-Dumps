module(..., package.seeall)

local var_0_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
local var_0_1 = LUI.DataSourceInControllerModel.new(var_0_0 .. ".emblemIndex")
local var_0_2 = 2

local function var_0_3(arg_1_0)
	local var_1_0 = arg_1_0.EmblemsGrid:GetFocusPositionIndex()

	if var_1_0 then
		return var_1_0 + 1
	end
end

local function var_0_4(arg_2_0, arg_2_1)
	local var_2_0 = RANDOM.IsEnabled(arg_2_0._controllerIndex, LOOT.itemTypes.EMBLEM)
	local var_2_1 = RANDOM.IsEnabled(arg_2_0._controllerIndex, LOOT.itemTypes.EMBLEM, {
		isFav = true
	})
	local var_2_2 = var_2_1 and arg_2_1.isRandomFavorite

	return not var_2_0 and not var_2_1 and arg_2_0._equippedEmblemIndex == tonumber(arg_2_1.index) or var_2_0 and arg_2_1.isRandom and not arg_2_1.isFavRandom or var_2_2
end

local function var_0_5(arg_3_0, arg_3_1)
	arg_3_0._emblemTable = {}

	if not arg_3_0._allEmblemsTable then
		arg_3_0._allEmblemsTable = EmblemEditorUtils.GetAllEmblems(arg_3_1)
	end

	local var_3_0 = 0
	local var_3_1 = 0

	for iter_3_0 = 1, #arg_3_0._allEmblemsTable do
		local var_3_2 = arg_3_0._allEmblemsTable[iter_3_0]

		var_3_2.selected = var_0_4(arg_3_0, var_3_2)

		if var_3_2.hideInUI ~= "1" then
			if var_3_2.isUnlocked then
				var_3_0 = var_3_0 + 1
				var_3_1 = var_3_1 + 1
			elseif not var_3_2.isPremium then
				var_3_1 = var_3_1 + 1
			end
		end
	end

	arg_3_0.ItemsCollected:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y", var_3_0, var_3_1))

	local var_3_3 = {}

	for iter_3_1 = 1, #arg_3_0._allEmblemsTable do
		if arg_3_0._allEmblemsTable[iter_3_1].isUnlocked or arg_3_0.lockedSortingType == LOOT.lockedSortingOptions.SHOW then
			if CONDITIONS.IsWZWipFlowEnabled() then
				LUI.InsertPlatformValidatedDataIntoTable(var_3_3, arg_3_0._allEmblemsTable[iter_3_1])
			else
				table.insert(var_3_3, arg_3_0._allEmblemsTable[iter_3_1])
			end
		end
	end

	for iter_3_2 = 1, #var_3_3 do
		if arg_3_0.filterByTitleType == LOOT.filterOptions.MODERN_WARFARE_ONLY then
			if var_3_3[iter_3_2].gameSourceID == LOOT.filterGameSourceID[arg_3_0.filterByTitleType] then
				table.insert(arg_3_0._emblemTable, var_3_3[iter_3_2])
			end
		elseif arg_3_0.filterByTitleType == LOOT.filterOptions.VANGUARD_ONLY then
			if var_3_3[iter_3_2].gameSourceID == LOOT.filterGameSourceID[arg_3_0.filterByTitleType] then
				table.insert(arg_3_0._emblemTable, var_3_3[iter_3_2])
			end
		elseif arg_3_0.filterByTitleType == LOOT.filterOptions.COLD_WAR_ONLY then
			if var_3_3[iter_3_2].gameSourceID == LOOT.filterGameSourceID[arg_3_0.filterByTitleType] then
				table.insert(arg_3_0._emblemTable, var_3_3[iter_3_2])
			end
		elseif arg_3_0.filterByTitleType == LOOT.filterOptions.ALL then
			table.insert(arg_3_0._emblemTable, var_3_3[iter_3_2])
		end
	end

	table.sort(arg_3_0._emblemTable, function(arg_4_0, arg_4_1)
		if arg_4_0.selected ~= arg_4_1.selected then
			return arg_4_0.selected and not arg_4_1.selected
		end

		if arg_3_0._favoriteEmblems[arg_4_0.ref] ~= arg_3_0._favoriteEmblems[arg_4_1.ref] then
			return arg_3_0._favoriteEmblems[arg_4_0.ref] and not arg_3_0._favoriteEmblems[arg_4_1.ref]
		end

		local var_4_0 = Loot.HDJCADADF(arg_3_0._controllerIndex, arg_4_0.lootID)
		local var_4_1 = Loot.HDJCADADF(arg_3_0._controllerIndex, arg_4_1.lootID)

		if var_4_0 ~= var_4_1 then
			return var_4_0 and not var_4_1
		end

		if arg_4_0.isUnlocked ~= arg_4_1.isUnlocked then
			return arg_4_0.isUnlocked and not arg_4_1.isUnlocked
		end

		if arg_3_0.officerSortingType ~= LOOT.officerSortingOptions.NONE and arg_4_0.isOfficerEmblem ~= arg_4_1.isOfficerEmblem then
			return arg_4_0.isOfficerEmblem and not arg_4_1.isOfficerEmblem
		end

		if arg_4_0.isOfficerEmblem and arg_4_1.isOfficerEmblem and arg_3_0.officerSortingType ~= LOOT.officerSortingOptions.NONE then
			if arg_4_0.officerSeason ~= arg_4_1.officerSeason then
				return arg_4_0.officerSeason < arg_4_1.officerSeason
			else
				return arg_4_0.ref < arg_4_1.ref
			end
		else
			if arg_4_0.season ~= arg_4_1.season and arg_3_0.seasonsSortingType ~= LOOT.seasonsSortingOptions.NONE then
				if arg_3_0.seasonsSortingType == LOOT.seasonsSortingOptions.OLD_FIRST then
					return arg_4_0.season < arg_4_1.season
				elseif arg_3_0.seasonsSortingType == LOOT.seasonsSortingOptions.RECENT_FIRST then
					return arg_4_0.season > arg_4_1.season
				end
			end

			if arg_4_0.rarity ~= arg_4_1.rarity and arg_3_0.raritySortingType ~= LOOT.raritySortingOptions.NONE then
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
		end

		return false
	end)

	if CLANS.IsInClan(arg_3_1) and not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_3_4 = EmblemEditorUtils.GetClanEmblemData(arg_3_1, {
			itemType = LOOT.itemTypes.EMBLEM
		})

		if EmblemEditorUtils.IsClanEmblemEnabled(arg_3_1) then
			arg_3_0._equippedEmblemIndex = EmblemEditorUtils.ClanEmblemID
		end

		table.insert(arg_3_0._emblemTable, 1, var_3_4)
	end

	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		local var_3_5 = RANDOM.GetItemData(arg_3_1, {
			isFav = true,
			itemType = LOOT.itemTypes.EMBLEM
		})

		var_3_5.isUnlocked = arg_3_0._favoriteEmblems.count >= 2
		var_3_5.unlockText = Engine.CBBHFCGDIC("CUSTOMIZE/RANDOM_EMBLEM_FAVORITE_UNLOCK")

		table.insert(arg_3_0._emblemTable, 1, var_3_5)
		table.insert(arg_3_0._emblemTable, 1, RANDOM.GetItemData(arg_3_1, {
			itemType = LOOT.itemTypes.EMBLEM
		}))
	end

	arg_3_0.FavoriteAndSort:Update(arg_3_1, arg_3_0)
end

local function var_0_6(arg_5_0)
	local var_5_0 = arg_5_0.isUnlocked
	local var_5_1 = arg_5_0.isRandom

	return var_5_0 and not var_5_1
end

local function var_0_7(arg_6_0)
	local var_6_0 = (function()
		for iter_7_0, iter_7_1 in ipairs(arg_6_0._emblemTable) do
			if var_0_4(arg_6_0, iter_7_1) then
				return iter_7_0 - 1
			end
		end

		return 0
	end)()
	local var_6_1 = arg_6_0.EmblemsGrid:GetPositionForIndex(var_6_0)

	arg_6_0.EmblemsGrid:SetFocusedPosition(var_6_1, true)
end

local function var_0_8(arg_8_0)
	if arg_8_0._isComingFromFilterMenu then
		local var_8_0 = (function()
			for iter_9_0, iter_9_1 in ipairs(arg_8_0._emblemTable) do
				if var_0_4(arg_8_0, iter_9_1) then
					return iter_9_0 - 1
				end
			end

			return 0
		end)()
		local var_8_1 = arg_8_0.EmblemsGrid:GetPositionForIndex(var_8_0)

		arg_8_0.EmblemsGrid:SetFocusedPosition(var_8_1, true, nil, nil, nil)

		arg_8_0._isComingFromFilterMenu = false

		return true
	end
end

local function var_0_9(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_1:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(arg_10_2)
	})

	local var_10_0 = {
		id = "emblemAddToFavorite",
		actionName = arg_10_3 and Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES") or Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
		actionFunction = function()
			arg_10_0:SetFavorite()
		end
	}

	arg_10_1:AddContextualMenuAction(var_10_0)
end

local function var_0_10(arg_12_0)
	arg_12_0.EmblemsGrid:RemoveFocusFromChild()
	arg_12_0.EmblemsGrid:SetNumChildren(#arg_12_0._emblemTable)
	arg_12_0.EmblemsGrid:RefreshContent()

	if #arg_12_0._emblemTable > 0 then
		arg_12_0.NoEmblemsLabel:SetAlpha(0)
	end
end

local function var_0_11(arg_13_0)
	return function(arg_14_0, arg_14_1, arg_14_2)
		local var_14_0 = arg_14_1 + arg_14_2 * arg_13_0.EmblemsGrid:GetNumColumns()
		local var_14_1 = arg_13_0._emblemTable[var_14_0 + 1]
		local var_14_2 = var_0_4(arg_13_0, var_14_1)
		local var_14_3 = arg_13_0._favoriteEmblems[var_14_1.ref]

		arg_14_0:RefreshButton(arg_13_0, var_14_1, var_14_2, var_14_3)

		if var_0_6(var_14_1) then
			var_0_9(arg_13_0, arg_14_0, var_14_1.name, var_14_3)
		end
	end
end

local function var_0_12(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0._favoriteEmblems[arg_15_1.ref]
	local var_15_1 = arg_15_0._favoriteEmblems.count

	arg_15_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_15_0, var_15_1)
end

local function var_0_13(arg_16_0)
	local var_16_0 = var_0_3(arg_16_0)

	if not var_16_0 then
		return
	end

	local var_16_1 = arg_16_0._emblemTable[var_16_0]

	if not var_0_6(var_16_1) then
		return
	end

	if arg_16_0._favoriteEmblems[var_16_1.ref] then
		LOOT.RemoveFavoriteForType(LOOT.itemTypes.EMBLEM, var_16_1.ref)

		if Dvar.IBEGCHEFE("TQRNTTMSL") then
			local var_16_2 = arg_16_0._favoriteEmblems.count

			arg_16_0._emblemTable[var_0_2].isUnlocked = var_16_2 - 1 >= 2

			var_0_11(arg_16_0)

			if RANDOM.IsEnabled(arg_16_0._controllerIndex, LOOT.itemTypes.EMBLEM, {
				isFav = true
			}) and not arg_16_0._emblemTable[var_0_2].isUnlocked then
				local var_16_3 = arg_16_0.EmblemsGrid:GetPositionForIndex(1)

				arg_16_0.EmblemsGrid:SetFocusedPosition(var_16_3, true)
				arg_16_0:EquipEmblem(1)
			end
		end
	else
		local var_16_4 = arg_16_0._favoriteEmblems.count

		if var_16_4 >= LOOT.maxFavorites then
			ACTIONS.AnimateSequence(arg_16_0.FavoriteAndSort.FavoritesPrompt, "Warning")
			Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

			return
		else
			LOOT.AddFavoriteForType(LOOT.itemTypes.EMBLEM, var_16_1.ref)

			if Dvar.IBEGCHEFE("TQRNTTMSL") then
				arg_16_0._emblemTable[var_0_2].isUnlocked = var_16_4 + 1 >= 2

				var_0_11(arg_16_0)
			end
		end
	end

	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

	local var_16_5 = ""
	local var_16_6 = ""
	local var_16_7

	if not arg_16_0._favoriteEmblems[var_16_1.ref] then
		var_16_5 = "LUA_MENU/ITEM_FAVORITED"
		var_16_7 = "cac_equip_fill"
	else
		var_16_5 = "LUA_MENU/ITEM_UNFAVORITED"
		var_16_7 = "cac_equip_ring"
	end

	local var_16_8 = {
		iconScale = -0.3,
		displayTime = 1500,
		icon = var_16_7,
		iconColor = SWATCHES.genericMenu.notificationHighlight,
		header = Engine.CBBHFCGDIC(var_16_5),
		description = Engine.CBBHFCGDIC(var_16_1.name),
		controllerIndex = controllerIndex
	}

	arg_16_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_16_8
	})

	arg_16_0._favoriteEmblems = LOOT.GetFavoritesForType(LOOT.itemTypes.EMBLEM)

	arg_16_0.EmblemsGrid:RefreshContent()

	if #arg_16_0._emblemTable > 0 then
		arg_16_0.NoEmblemsLabel:SetAlpha(0)
	end

	local var_16_9 = arg_16_0.EmblemsGrid:GetPositionForIndex(var_16_0 - 1)

	arg_16_0.EmblemsGrid:SetFocusedPosition(var_16_9, true)
	var_0_12(arg_16_0, var_16_1)
end

local function var_0_14(arg_17_0, arg_17_1)
	arg_17_1 = arg_17_1 ~= nil and arg_17_1 or var_0_3(arg_17_0)

	if not arg_17_1 then
		return
	end

	local var_17_0 = arg_17_0._emblemTable[arg_17_1]
	local var_17_1 = tonumber(var_17_0.index)

	if var_17_0.isRandom or not var_0_4(arg_17_0, var_17_0) then
		local var_17_2 = var_17_0.image

		if var_17_0.isRandomFavorite then
			RANDOM.Toggle(arg_17_0._controllerIndex, LOOT.itemTypes.EMBLEM, {
				isFav = true
			})

			if not RANDOM.IsEnabled(arg_17_0._controllerIndex, LOOT.itemTypes.EMBLEM, {
				isFav = true
			}) then
				var_17_2 = EmblemEditorUtils.GetEmblemImageFromID(arg_17_0._equippedEmblemIndex)
			end

			RANDOM.SetEnabled(arg_17_0._controllerIndex, LOOT.itemTypes.EMBLEM, false)
		elseif var_17_0.isRandom then
			RANDOM.Toggle(arg_17_0._controllerIndex, LOOT.itemTypes.EMBLEM)

			if not RANDOM.IsEnabled(arg_17_0._controllerIndex, LOOT.itemTypes.EMBLEM) then
				var_17_2 = EmblemEditorUtils.GetEmblemImageFromID(arg_17_0._equippedEmblemIndex)
			end

			RANDOM.SetEnabled(arg_17_0._controllerIndex, LOOT.itemTypes.EMBLEM, false, {
				isFav = true
			})
		elseif var_17_0.isClanEmblem and CLANS.IsInClan(arg_17_0._controllerIndex) then
			EmblemEditorUtils.ToggleClanEmblem(arg_17_0._controllerIndex)
			Playercard.DBBICFEAGH(arg_17_0._controllerIndex, var_17_1)

			arg_17_0._equippedEmblemIndex = var_17_1
		else
			RANDOM.SetEnabled(arg_17_0._controllerIndex, LOOT.itemTypes.EMBLEM, false)
			RANDOM.SetEnabled(arg_17_0._controllerIndex, LOOT.itemTypes.EMBLEM, false, {
				isFav = true
			})
			EmblemEditorUtils.SetClanEmblemEnabled(arg_17_0._controllerIndex, false)
			Playercard.DBBICFEAGH(arg_17_0._controllerIndex, var_17_1)

			arg_17_0._equippedEmblemIndex = var_17_1
		end

		if CONDITIONS.IsCoreMultiplayerNotBr() then
			arg_17_0.DetailPanel.SmallPlayerCard.Emblem:setImage(RegisterMaterial(var_17_2))
		elseif var_17_0.isClanEmblem and CLANS.IsInClan(arg_17_0._controllerIndex) then
			arg_17_0.DetailPanel.WZSmallPlayerCard:SetClanEmblem(var_17_0.clanEmblemData)
		else
			arg_17_0.DetailPanel.WZSmallPlayerCard:SetEmblem(var_17_2)
		end

		arg_17_0:UpdateGrid()

		local var_17_3 = "hud_icon_player"

		if var_17_0.image ~= "" and not var_17_0.isClanEmblem then
			var_17_3 = var_17_2
		end

		local var_17_4 = {
			displayTime = 2000,
			icon = var_17_3,
			header = Engine.CBBHFCGDIC("LUA_MENU/EMBLEM_EQUIPPED"),
			description = Engine.CBBHFCGDIC(var_17_0.name),
			type = LUI.ToastManager.NotificationType.EmblemEquipped,
			controllerIndex = arg_17_0._controllerIndex
		}

		arg_17_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_17_4
		})
	end
end

local function var_0_15(arg_18_0)
	local var_18_0 = var_0_3(arg_18_0)

	if not var_18_0 then
		return
	end

	local var_18_1 = arg_18_0._emblemTable[var_18_0]
	local var_18_2 = var_0_4(arg_18_0, var_18_1)
	local var_18_3 = Loot.HDJCADADF(arg_18_0._controllerIndex, var_18_1.lootID)

	arg_18_0.DetailPanel:UpdatePanel(var_18_1, var_18_2, not var_18_1.isRandom and var_18_3)

	local var_18_4 = var_18_1.isUnlocked

	if var_0_6(var_18_1) then
		arg_18_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(1)

		local var_18_5 = arg_18_0._favoriteEmblems[var_18_1.ref]
		local var_18_6 = arg_18_0._favoriteEmblems.count

		arg_18_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_18_5, var_18_6)
	else
		arg_18_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(0)
	end
end

local function var_0_16(arg_19_0)
	local var_19_0 = EmblemEditorUtils.GetEmblemRef(arg_19_0._equippedEmblemIndex)

	return LOOT.GetItemID(LOOT.itemTypes.EMBLEM, var_19_0)
end

local function var_0_17(arg_20_0, arg_20_1)
	assert(arg_20_0.MenuTitle)
	assert(arg_20_0.EmblemsGrid)
	assert(arg_20_0.FavoriteAndSort)
	arg_20_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/TITLE_EMBLEM_SELECT"))
	arg_20_0.DetailPanel:SetupPanel(arg_20_0.DetailPanel:GetCurrentAnchorsAndPositions())
	arg_20_0.DetailPanel:UpdatePlayerCardData(arg_20_1)

	arg_20_0.SetFavorite = var_0_13
	arg_20_0.EquipEmblem = var_0_14
	arg_20_0.FavoriteEmblem = FavoriteEmblem
	arg_20_0.PreviewEmblem = var_0_15
	arg_20_0.UpdateGrid = var_0_10
	arg_20_0._controllerIndex = arg_20_1
	arg_20_0._emblemTable = {}
	arg_20_0._allEmblemsTable = EmblemEditorUtils.GetAllEmblems(arg_20_1)
	arg_20_0._favoriteEmblems = LOOT.GetFavoritesForType(LOOT.itemTypes.EMBLEM)
	arg_20_0._equippedEmblemIndex = var_0_1:GetValue(arg_20_1)
	arg_20_0._isComingFromFilterMenu = false

	LOOT.SetupSortingBehavior(arg_20_0, arg_20_1, LOOT.itemTypes.EMBLEM)
	var_0_5(arg_20_0, arg_20_1)
	arg_20_0.EmblemsGrid:SetRefreshChild(var_0_11(arg_20_0))
	arg_20_0:addEventHandler("restore_focus", var_0_8)
	arg_20_0.EmblemsGrid:SetSnapOnWrapEnabled(true)
	arg_20_0:UpdateGrid()
	var_0_7(arg_20_0)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	Playercard.DAHDCGCDEC(arg_20_1)

	local var_20_0 = Engine.DCJHCAFIIA()
	local var_20_1 = var_0_16(arg_20_0)

	arg_20_0:addEventHandler("menu_close", function(arg_21_0, arg_21_1)
		var_0_1:SetValue(arg_20_1, arg_20_0._equippedEmblemIndex)
		Playercard.FCBJJBFBJ(arg_20_1)

		local var_21_0 = var_0_16(arg_20_0)

		METRICS.LootUsageSendDLogEvent(arg_20_0, {
			controllerIndex = arg_20_1,
			startTime = var_20_0,
			previousItemIDs = var_20_1,
			newItemIDs = var_21_0
		})
	end)

	if CONDITIONS.IsUserSignedInDemonware(arg_20_1) then
		arg_20_0.bindButton:addEventHandler("button_right_trigger", function(arg_22_0, arg_22_1)
			arg_20_0:SetFavorite()
		end)
	end

	arg_20_0:addEventHandler("update_input_type", function(arg_23_0, arg_23_1)
		arg_23_0.FavoriteAndSort:Update(arg_23_1.controllerIndex, arg_23_0)
	end, {
		controllerIndex = arg_20_1
	})
	arg_20_0.HelperBar:AddButtonHelperTextToElement(arg_20_0, {
		kbm_only = true,
		priority = 4,
		side = "left",
		button_ref = "button_left_trigger",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
	})
	arg_20_0.bindButton:addEventHandler("button_left_trigger", function(arg_24_0, arg_24_1)
		if LUI.IsLastInputGamepad(arg_24_1.controller) then
			local var_24_0 = var_0_3(arg_20_0)

			arg_20_0._currentSelectedLootID = arg_20_0._emblemTable[var_24_0].lootID
		end

		local var_24_1 = {
			data = {}
		}

		LOOT.SetupSortingBehavior(var_24_1.data, arg_20_0._controllerIndex, LOOT.itemTypes.EMBLEM)

		var_24_1.controllerIndex = arg_20_1
		var_24_1.type = LOOT.itemTypes.EMBLEM
		var_24_1.menu = arg_20_0

		local var_24_2 = MenuBuilder.BuildRegisteredType("CustomizeSortingPopup", var_24_1)

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_20_1, false, {
			flyInLeftNarrow = true,
			widget = var_24_2
		})
		var_24_2:addEventHandler("menu_close", function(arg_25_0, arg_25_1)
			arg_20_0._isComingFromFilterMenu = true

			var_0_5(arg_20_0, arg_20_1)
			arg_20_0:UpdateGrid()
		end)
	end)

	local function var_20_2()
		local var_26_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_20_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_20_0:addAndCallEventHandler("onVideoChange", var_20_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_20_0, arg_20_1)
	ACTIONS.ScaleFullscreen(arg_20_0.Darken)
	ACTIONS.ScaleFullscreen(arg_20_0.Vignette)

	if CONDITIONS.IsCoreMultiplayerNotBr() then
		arg_20_0.DetailPanel.SmallPlayerCard:UpdateWithRandom(arg_20_1)
	else
		arg_20_0.DetailPanel.WZSmallPlayerCard:UpdateWithRandom(arg_20_1)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_20_0)
	end
end

function EmblemSelectMenu(arg_27_0, arg_27_1)
	local var_27_0 = LUI.UIElement.new()

	var_27_0.id = "EmblemSelectMenu"

	local var_27_1 = arg_27_1 and arg_27_1.controllerIndex

	if not var_27_1 and not Engine.DDJFBBJAIG() then
		var_27_1 = var_27_0:getRootController()
	end

	assert(var_27_1)

	var_27_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_27_1
	})
	var_27_0.HelperBar.id = "HelperBar"

	var_27_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_27_0.HelperBar:setPriority(10)
	var_27_0:addElement(var_27_0.HelperBar)

	local var_27_2 = var_27_0
	local var_27_3
	local var_27_4 = {
		worldBlur = 1,
		controllerIndex = var_27_1
	}
	local var_27_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_27_4)

	var_27_5.id = "WorldBlur"

	var_27_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_27_0:addElement(var_27_5)

	var_27_0.WorldBlur = var_27_5

	local var_27_6
	local var_27_7 = LUI.UIImage.new()

	var_27_7.id = "Darken"

	var_27_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_27_7:SetAlpha(0.5, 0)
	var_27_0:addElement(var_27_7)

	var_27_0.Darken = var_27_7

	local var_27_8
	local var_27_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_27_1
	})

	var_27_9.id = "Vignette"

	var_27_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_27_0:addElement(var_27_9)

	var_27_0.Vignette = var_27_9

	local var_27_10
	local var_27_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_27_1
	})

	var_27_11.id = "TabBacker"

	var_27_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_27_0:addElement(var_27_11)

	var_27_0.TabBacker = var_27_11

	local var_27_12
	local var_27_13 = {
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
		controllerIndex = var_27_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("EmblemButton", {
				controllerIndex = var_27_1
			})
		end,
		refreshChild = function(arg_29_0, arg_29_1, arg_29_2)
			return
		end,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 150,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_27_14 = LUI.UIGrid.new(var_27_13)

	var_27_14.id = "EmblemsGrid"

	var_27_14:setUseStencil(true)
	var_27_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1195, _1080p * 244, _1080p * 868)
	var_27_0:addElement(var_27_14)

	var_27_0.EmblemsGrid = var_27_14

	local var_27_15
	local var_27_16 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_27_1
	})

	var_27_16.id = "EmblemsScrollbar"

	var_27_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1199, _1080p * 1218, _1080p * 244, _1080p * 868)
	var_27_0:addElement(var_27_16)

	var_27_0.EmblemsScrollbar = var_27_16

	local var_27_17
	local var_27_18 = LUI.UIText.new()

	var_27_18.id = "NoEmblemsLabel"

	var_27_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NO_EMBLEMS"), 0)
	var_27_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_18:SetAlignment(LUI.Alignment.Center)
	var_27_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -726, _1080p * 534, _1080p * 579)
	var_27_0:addElement(var_27_18)

	var_27_0.NoEmblemsLabel = var_27_18

	local var_27_19
	local var_27_20 = LUI.UIImage.new()

	var_27_20.id = "GridDivider"

	var_27_20:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_27_20:SetAlpha(0.6, 0)
	var_27_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1194, _1080p * 230, _1080p * 231)
	var_27_0:addElement(var_27_20)

	var_27_0.GridDivider = var_27_20

	local var_27_21
	local var_27_22 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_27_1
	})

	var_27_22.id = "MenuTitle"

	var_27_22.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/TITLE_EMBLEM_SELECT"), 0)
	var_27_22.Line:SetLeft(0, 0)
	var_27_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_27_0:addElement(var_27_22)

	var_27_0.MenuTitle = var_27_22

	local var_27_23
	local var_27_24 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_27_1
	})

	var_27_24.id = "LobbyMembersFooter"

	var_27_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_27_0:addElement(var_27_24)

	var_27_0.LobbyMembersFooter = var_27_24

	local var_27_25
	local var_27_26 = MenuBuilder.BuildRegisteredType("CustomizationDetailPanel", {
		controllerIndex = var_27_1
	})

	var_27_26.id = "DetailPanel"

	var_27_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1269, _1080p * 1824, _1080p * 230, _1080p * 426)
	var_27_0:addElement(var_27_26)

	var_27_0.DetailPanel = var_27_26

	local var_27_27
	local var_27_28 = LUI.UIStyledText.new()

	var_27_28.id = "ItemsCollected"

	var_27_28:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_27_28:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_27_28:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_27_28:SetAlignment(LUI.Alignment.Left)
	var_27_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 281, _1080p * 201, _1080p * 223)
	var_27_0:addElement(var_27_28)

	var_27_0.ItemsCollected = var_27_28

	local var_27_29
	local var_27_30 = MenuBuilder.BuildRegisteredType("FavoriteAndSort", {
		controllerIndex = var_27_1
	})

	var_27_30.id = "FavoriteAndSort"

	var_27_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1194, _1080p * 200, _1080p * 224)
	var_27_0:addElement(var_27_30)

	var_27_0.FavoriteAndSort = var_27_30

	local var_27_31 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_27_16,
		startCap = var_27_16.startCap,
		endCap = var_27_16.endCap,
		sliderArea = var_27_16.sliderArea,
		slider = var_27_16.sliderArea and var_27_16.sliderArea.slider,
		fixedSizeSlider = var_27_16.sliderArea and var_27_16.sliderArea.fixedSizeSlider
	})

	var_27_14:AddScrollbar(var_27_31)
	var_27_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_27_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_27_32 = LUI.UIBindButton.new()

	var_27_32.id = "selfBindButton"

	var_27_0:addElement(var_27_32)

	var_27_0.bindButton = var_27_32

	var_27_0.bindButton:addEventHandler("button_secondary", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_27_1
		end

		ACTIONS.LeaveMenu(var_27_0)
	end)
	var_0_17(var_27_0, var_27_1, arg_27_1)

	return var_27_0
end

MenuBuilder.registerType("EmblemSelectMenu", EmblemSelectMenu)
LockTable(_M)
