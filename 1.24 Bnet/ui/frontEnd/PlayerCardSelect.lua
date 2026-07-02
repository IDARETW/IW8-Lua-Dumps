module(..., package.seeall)

local var_0_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
local var_0_1 = LUI.DataSourceInControllerModel.new(var_0_0 .. ".backgroundIndex")

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = PlayercardUtils.GetFrontendDataSources(var_0_0, arg_1_1)

	arg_1_0.SmallPlayerCard:SetDataSource(var_1_0, arg_1_1)
end

local function var_0_3(arg_2_0)
	local var_2_0 = arg_2_0.PlayerCardGrid:GetFocusPositionIndex()

	if var_2_0 then
		return var_2_0 + 1
	end
end

local function var_0_4(arg_3_0, arg_3_1)
	arg_3_0._playerCardTable = {}

	if not arg_3_0._allPlayerCardsTable then
		arg_3_0._allPlayerCardsTable = CallingCardUtils.GetAllPlayerCards(arg_3_1, {
			unlockType = CallingCardUtils.Categories.CORE
		})
	end

	local var_3_0 = 0
	local var_3_1 = 0

	for iter_3_0 = 1, #arg_3_0._allPlayerCardsTable do
		local var_3_2 = arg_3_0._allPlayerCardsTable[iter_3_0]

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

	for iter_3_1 = 1, #arg_3_0._allPlayerCardsTable do
		if arg_3_0._allPlayerCardsTable[iter_3_1].isUnlocked or arg_3_0.lockedSortingType == LOOT.lockedSortingOptions.SHOW then
			table.insert(arg_3_0._playerCardTable, arg_3_0._allPlayerCardsTable[iter_3_1])
		end
	end

	table.sort(arg_3_0._playerCardTable, function(arg_4_0, arg_4_1)
		if arg_3_0._favoritePlayerCards[arg_4_0.ref] ~= arg_3_0._favoritePlayerCards[arg_4_1.ref] then
			return arg_3_0._favoritePlayerCards[arg_4_0.ref] and not arg_3_0._favoritePlayerCards[arg_4_1.ref]
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

local function var_0_5(arg_5_0)
	local var_5_0 = var_0_3(arg_5_0)

	if not var_5_0 then
		return
	end

	local var_5_1 = arg_5_0._playerCardTable[var_5_0]

	if not var_5_1.isUnlocked then
		return
	end

	if arg_5_0._favoritePlayerCards[var_5_1.image] then
		LOOT.RemoveFavoriteForType(LOOT.itemTypes.PLAYERCARD, var_5_1.image)
	elseif arg_5_0._favoritePlayerCards.count >= LOOT.maxFavorites then
		ACTIONS.AnimateSequence(arg_5_0.FavoriteAndSort.FavoritesPrompt, "Warning")
		Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

		return
	else
		LOOT.AddFavoriteForType(LOOT.itemTypes.PLAYERCARD, var_5_1.image)
	end

	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

	local var_5_2 = ""
	local var_5_3 = ""
	local var_5_4

	if not arg_5_0._favoritePlayerCards[var_5_1.image] then
		var_5_2 = "LUA_MENU/ITEM_FAVORITED"
		var_5_4 = "cac_equip_fill"
	else
		var_5_2 = "LUA_MENU/ITEM_UNFAVORITED"
		var_5_4 = "cac_equip_ring"
	end

	local var_5_5 = {
		iconScale = -0.3,
		displayTime = 1500,
		icon = var_5_4,
		iconColor = SWATCHES.genericMenu.notificationHighlight,
		header = Engine.CBBHFCGDIC(var_5_2),
		description = Engine.CBBHFCGDIC(var_5_1.name),
		controllerIndex = controllerIndex
	}

	arg_5_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_5_5
	})

	arg_5_0._favoritePlayerCards = LOOT.GetFavoritesForType(LOOT.itemTypes.PLAYERCARD)

	arg_5_0.PlayerCardGrid:RefreshContent()

	if #arg_5_0._playerCardTable > 0 then
		arg_5_0.NoPlayerCardsLabel:SetAlpha(0)
	end

	local var_5_6 = arg_5_0.PlayerCardGrid:GetPositionForIndex(var_5_0 - 1)

	arg_5_0.PlayerCardGrid:SetFocusedPosition(var_5_6, true)
end

local function var_0_6(arg_6_0)
	local var_6_0 = var_0_3(arg_6_0)

	if not var_6_0 then
		return
	end

	local var_6_1 = arg_6_0._playerCardTable[var_6_0]
	local var_6_2 = tonumber(var_6_1.index)

	if arg_6_0._equippedPlayerCardIndex ~= var_6_2 then
		Playercard.CGGBAHFGAF(arg_6_0._controllerIndex, var_6_2)
		arg_6_0.SmallPlayerCard.PlayerCardImage:setImage(RegisterMaterial(var_6_1.image))

		arg_6_0._equippedPlayerCardIndex = var_6_2

		arg_6_0:UpdateGrid()

		local var_6_3 = "hud_cmd_active_backer"

		if var_6_1.image ~= "" then
			var_6_3 = var_6_1.image
		end

		local var_6_4 = {
			displayTime = 2000,
			icon = var_6_3,
			header = Engine.CBBHFCGDIC("LUA_MENU/PLAYERCARD_EQUIPPED"),
			description = Engine.CBBHFCGDIC(var_6_1.name),
			type = LUI.ToastManager.NotificationType.PlayerCardEquipped,
			controllerIndex = arg_6_0._controllerIndex
		}

		arg_6_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_6_4
		})
	end
end

local function var_0_7(arg_7_0)
	local var_7_0 = var_0_3(arg_7_0)

	if not var_7_0 then
		return
	end

	local var_7_1 = arg_7_0._playerCardTable[var_7_0]

	arg_7_0.QualityWithText:UpdateQualityText(var_7_1.rarity)
	arg_7_0.SeasonWithText:UpdateSeasonText(var_7_1.season)
	arg_7_0.SelectedPlayerCard:setImage(RegisterMaterial(var_7_1.image))

	if var_7_1.unlockString and #var_7_1.unlockString > 0 then
		arg_7_0.UnlockText:setText(Engine.CBBHFCGDIC(var_7_1.unlockString))
	else
		arg_7_0.UnlockText:setText("")
	end

	if var_7_1.isUnlocked then
		arg_7_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(1)

		local var_7_2 = arg_7_0._favoritePlayerCards[var_7_1.image]
		local var_7_3 = arg_7_0._favoritePlayerCards.count

		arg_7_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_7_2, var_7_3)
	else
		arg_7_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(0)
	end

	local var_7_4 = Loot.HDJCADADF(arg_7_0._controllerIndex, var_7_1.lootID) and LOOT.HideLootBreadcrumbsCondition()

	arg_7_0.NewItemPreviewNotification:UpdateAlpha(var_7_4 and 1 or 0)

	local var_7_5 = arg_7_0._equippedPlayerCardIndex == tonumber(var_7_1.index)

	if var_7_5 and not arg_7_0.EquippedWidget.enabled then
		ACTIONS.AnimateSequence(arg_7_0.EquippedWidget, "TurnOn")
		arg_7_0.NewItemPreviewNotification:SetAlpha(0)
	end

	arg_7_0.EquippedWidget:UpdateVisibility(var_7_5)

	local var_7_6 = var_7_1.unlockString and #var_7_1.unlockString > 0

	if var_7_5 then
		if tonumber(var_7_1.season) > 0 and Dvar.IBEGCHEFE("NPOLQSQMNO") then
			if var_7_6 then
				ACTIONS.AnimateSequence(arg_7_0, "EquippedWithUnlockTextAndSeason")
			else
				ACTIONS.AnimateSequence(arg_7_0, "EquippedWithSeason")
			end
		elseif var_7_6 then
			ACTIONS.AnimateSequence(arg_7_0, "EquippedWithUnlockText")
		else
			ACTIONS.AnimateSequence(arg_7_0, "EquippedWithoutSeason")
		end
	elseif tonumber(var_7_1.season) > 0 and Dvar.IBEGCHEFE("NPOLQSQMNO") then
		if var_7_6 then
			ACTIONS.AnimateSequence(arg_7_0, var_7_4 and "NewWithUnlockTextAndSeason" or "NotEquippedWithUnlockTextAndSeason")
		else
			ACTIONS.AnimateSequence(arg_7_0, var_7_4 and "NewWithSeason" or "NotEquippedWithSeason")
		end
	elseif var_7_6 then
		ACTIONS.AnimateSequence(arg_7_0, var_7_4 and "NewWithUnlockText" or "NotEquippedWithUnlockText")
	else
		ACTIONS.AnimateSequence(arg_7_0, var_7_4 and "NewWithoutSeason" or "NotEquippedWithoutSeason")
	end

	arg_7_0.CurrentName:setText(Engine.CBBHFCGDIC(var_7_1.name))
end

local function var_0_8(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	arg_8_1:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(arg_8_2)
	})

	local var_8_0 = {
		id = "playerCardAddToFavorite",
		actionName = arg_8_3 and Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES") or Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
		actionFunction = function()
			arg_8_0:SetFavorite()
		end
	}

	arg_8_1:AddContextualMenuAction(var_8_0)
end

local function var_0_9(arg_10_0)
	arg_10_0.PlayerCardGrid:RemoveFocusFromChild()
	arg_10_0.PlayerCardGrid:SetNumChildren(#arg_10_0._playerCardTable)
	arg_10_0.PlayerCardGrid:RefreshContent()

	if #arg_10_0._playerCardTable > 0 then
		arg_10_0.NoPlayerCardsLabel:SetAlpha(0)
	end
end

local function var_0_10(arg_11_0)
	return function(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = arg_12_1 + arg_12_2 * arg_11_0.PlayerCardGrid:GetNumColumns()
		local var_12_1 = arg_11_0._playerCardTable[var_12_0 + 1]
		local var_12_2 = arg_11_0._equippedPlayerCardIndex == tonumber(var_12_1.index)
		local var_12_3 = arg_11_0._favoritePlayerCards[var_12_1.image]

		arg_12_0:RefreshButton(arg_11_0, var_12_1, var_12_2, var_12_3)
		var_0_8(arg_11_0, arg_12_0, var_12_1.name, var_12_3)
	end
end

local function var_0_11(arg_13_0)
	local var_13_0 = CallingCardUtils.GetCardRef(arg_13_0._equippedPlayerCardIndex)

	return LOOT.GetItemID(LOOT.itemTypes.PLAYERCARD, var_13_0)
end

local function var_0_12(arg_14_0)
	local var_14_0 = (function()
		for iter_15_0, iter_15_1 in ipairs(arg_14_0._playerCardTable) do
			if arg_14_0._equippedPlayerCardIndex == tonumber(iter_15_1.index) then
				return iter_15_0 - 1
			end
		end

		return 0
	end)()
	local var_14_1 = arg_14_0.PlayerCardGrid:GetPositionForIndex(var_14_0)

	arg_14_0.PlayerCardGrid:SetFocusedPosition(var_14_1, true)
end

local function var_0_13(arg_16_0)
	if arg_16_0._isComingFromFilterMenu and LUI.IsLastInputGamepad(arg_16_0._controllerIndex) then
		local var_16_0 = (function()
			for iter_17_0, iter_17_1 in ipairs(arg_16_0._playerCardTable) do
				if iter_17_1.lootID == arg_16_0._currentSelectedLootID then
					return iter_17_0 - 1
				end
			end

			return 0
		end)()
		local var_16_1 = arg_16_0.PlayerCardGrid:GetPositionForIndex(var_16_0)

		arg_16_0.PlayerCardGrid:SetFocusedPosition(var_16_1, true, nil, nil, nil)

		arg_16_0._isComingFromFilterMenu = false

		return true
	end
end

local function var_0_14(arg_18_0, arg_18_1)
	local var_18_0 = {
		{
			name = Engine.CBBHFCGDIC("CHALLENGE/CORE")
		},
		{
			name = Engine.CBBHFCGDIC("CHALLENGE/VICTORIES")
		}
	}

	if #var_18_0 > 0 then
		local var_18_1 = {}

		for iter_18_0, iter_18_1 in ipairs(var_18_0) do
			table.insert(var_18_1, {
				disabled = false,
				name = iter_18_1.name,
				tabHeight = _1080p * 52,
				focusFunction = function(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
					assert(arg_19_2 + 1 > #CallingCardUtils.Categories)

					arg_18_0._allPlayerCardsTable = CallingCardUtils.GetAllPlayerCards(arg_19_1, {
						unlockType = arg_19_2 + 1
					})

					var_0_4(arg_18_0, arg_19_1)
					arg_18_0:UpdateGrid()
				end
			})
		end

		arg_18_0.Tabs:SetTabs(var_18_1)
		arg_18_0.Tabs:SetAlignment(LUI.Alignment.Left)
	end
end

local function var_0_15(arg_20_0, arg_20_1, arg_20_2)
	assert(arg_20_0.MenuTitle)
	assert(arg_20_0.PlayerCardGrid)
	assert(arg_20_0.EquippedWidget)
	assert(arg_20_0.FavoriteAndSort)
	assert(arg_20_0.SmallPlayerCard)
	ACTIONS.AnimateSequence(arg_20_0, "InitializeDetails")
	arg_20_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT"))
	arg_20_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	var_0_2(arg_20_0, arg_20_1)

	arg_20_0.SetFavorite = var_0_5
	arg_20_0.EquipPlayerCard = var_0_6
	arg_20_0.PreviewPlayerCard = var_0_7
	arg_20_0.UpdateGrid = var_0_9
	arg_20_0.FocusFunction = var_0_12
	arg_20_0._controllerIndex = arg_20_1
	arg_20_0._playerCardTable = {}
	arg_20_0._allPlayerCardsTable = CallingCardUtils.GetAllPlayerCards(arg_20_1, {
		unlockType = CallingCardUtils.Categories.CORE
	})
	arg_20_0._favoritePlayerCards = LOOT.GetFavoritesForType(LOOT.itemTypes.PLAYERCARD)
	arg_20_0._equippedPlayerCardIndex = var_0_1:GetValue(arg_20_1)
	arg_20_0._isComingFromFilterMenu = false

	if Dvar.IBEGCHEFE("MSSTOMNNMR") and CallingCardUtils.AreAllVictoryChallengesUnlocked(arg_20_1) then
		var_0_14(arg_20_0, arg_20_1)
	else
		arg_20_0.Tabs:closeTree()

		arg_20_0.Tabs = nil
	end

	LOOT.SetupSortingBehavior(arg_20_0, arg_20_1, LOOT.itemTypes.PLAYERCARD)
	var_0_4(arg_20_0, arg_20_1)
	arg_20_0.PlayerCardGrid:SetRefreshChild(var_0_10(arg_20_0))
	arg_20_0:addEventHandler("restore_focus", var_0_13)
	arg_20_0.PlayerCardGrid:SetSnapOnWrapEnabled(true)
	arg_20_0:UpdateGrid()
	arg_20_0:FocusFunction()
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	Playercard.DAHDCGCDEC(arg_20_1)

	local var_20_0 = Engine.DCJHCAFIIA()
	local var_20_1 = var_0_11(arg_20_0)

	arg_20_0:addEventHandler("menu_close", function(arg_21_0, arg_21_1)
		var_0_1:SetValue(arg_20_1, arg_20_0._equippedPlayerCardIndex)
		Playercard.FCBJJBFBJ(arg_20_1)

		local var_21_0 = var_0_11(arg_20_0)

		METRICS.IdentityUsageSendDLogEvent(arg_20_0, arg_20_1, var_20_0, LOOT.itemTypes.PLAYERCARD, var_20_1, var_21_0)
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
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
	})
	arg_20_0.bindButton:addEventHandler("button_alt1", function(arg_24_0, arg_24_1)
		if LUI.IsLastInputGamepad(arg_24_1.controller) then
			local var_24_0 = var_0_3(arg_20_0)

			arg_20_0._currentSelectedLootID = arg_20_0._playerCardTable[var_24_0].lootID
		end

		local var_24_1 = MenuBuilder.BuildRegisteredType("CustomizeSortingPopup", {
			controllerIndex = arg_20_1,
			menu = arg_20_0,
			type = LOOT.itemTypes.PLAYERCARD
		})

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_20_1, false, {
			flyInLeftNarrow = true,
			widget = var_24_1
		})
		var_24_1:addEventHandler("menu_close", function(arg_25_0, arg_25_1)
			arg_20_0._isComingFromFilterMenu = true

			var_0_4(arg_20_0, arg_20_1)
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

	if not IsLanguageArabic() then
		arg_20_0.NewItemPreviewNotification:SetupLeftAlignment()
	end
end

function PlayerCardSelect(arg_27_0, arg_27_1)
	local var_27_0 = LUI.UIElement.new()

	var_27_0.id = "PlayerCardSelect"
	var_27_0._animationSets = var_27_0._animationSets or {}
	var_27_0._sequences = var_27_0._sequences or {}

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
	local var_27_9 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_27_1
	})

	var_27_9.id = "SelectedEmblemBG"

	var_27_9:SetAlpha(0.5, 0)
	var_27_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1269, _1080p * 1824, _1080p * 230, _1080p * 567)
	var_27_0:addElement(var_27_9)

	var_27_0.SelectedEmblemBG = var_27_9

	local var_27_10
	local var_27_11 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_27_1
	})

	var_27_11.id = "CurrentEmblemBG"

	var_27_11:SetAlpha(0.5, 0)
	var_27_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1269, _1080p * 1824, _1080p * 586, _1080p * 758)
	var_27_0:addElement(var_27_11)

	var_27_0.CurrentEmblemBG = var_27_11

	local var_27_12
	local var_27_13 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_27_1
	})

	var_27_13.id = "TabBacker"

	var_27_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_27_0:addElement(var_27_13)

	var_27_0.TabBacker = var_27_13

	local var_27_14
	local var_27_15 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_27_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PlayerCardButton", {
				controllerIndex = var_27_1
			})
		end,
		refreshChild = function(arg_29_0, arg_29_1, arg_29_2)
			return
		end,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 360,
		rowHeight = _1080p * 140,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_27_16 = LUI.UIGrid.new(var_27_15)

	var_27_16.id = "PlayerCardGrid"

	var_27_16:setUseStencil(true)
	var_27_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -720, _1080p * 244, _1080p * 840)
	var_27_0:addElement(var_27_16)

	var_27_0.PlayerCardGrid = var_27_16

	local var_27_17
	local var_27_18 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_27_1
	})

	var_27_18.id = "PlayercardScrollbar"

	var_27_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1200, _1080p * 1216, _1080p * 244, _1080p * 840)
	var_27_0:addElement(var_27_18)

	var_27_0.PlayercardScrollbar = var_27_18

	local var_27_19
	local var_27_20 = LUI.UIText.new()

	var_27_20.id = "NoPlayerCardsLabel"

	var_27_20:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NO_CALLING_CARDS"), 0)
	var_27_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_20:SetAlignment(LUI.Alignment.Center)
	var_27_20:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -720, _1080p * 522, _1080p * 567)
	var_27_0:addElement(var_27_20)

	var_27_0.NoPlayerCardsLabel = var_27_20

	local var_27_21
	local var_27_22 = LUI.UIImage.new()

	var_27_22.id = "GridDivider"

	var_27_22:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_27_22:SetAlpha(0.6, 0)
	var_27_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1200, _1080p * 230, _1080p * 231)
	var_27_0:addElement(var_27_22)

	var_27_0.GridDivider = var_27_22

	local var_27_23
	local var_27_24 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_27_1
	})

	var_27_24.id = "MenuTitle"

	var_27_24.MenuTitle:setText(Engine.CBBHFCGDIC("MENU/PLAYERCARD_SELECT"), 0)
	var_27_24.Line:SetLeft(0, 0)
	var_27_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_27_0:addElement(var_27_24)

	var_27_0.MenuTitle = var_27_24

	local var_27_25
	local var_27_26 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_27_1
	})

	var_27_26.id = "CurrentEquipTitle"

	var_27_26.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENTLY_EQUIPPED"), 0)
	var_27_26:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1269, _1080p * -96, _1080p * 586, _1080p * 633)
	var_27_0:addElement(var_27_26)

	var_27_0.CurrentEquipTitle = var_27_26

	local var_27_27
	local var_27_28 = MenuBuilder.BuildRegisteredType("SmallPlayerCard", {
		controllerIndex = var_27_1
	})

	var_27_28.id = "SmallPlayerCard"

	var_27_28.GradientBacker:SetAlpha(0, 0)
	var_27_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1286, _1080p * 1806, _1080p * 614, _1080p * 738)
	var_27_0:addElement(var_27_28)

	var_27_0.SmallPlayerCard = var_27_28

	local var_27_29
	local var_27_30 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_27_1
	})

	var_27_30.id = "SeasonWithText"

	var_27_30:SetAlpha(0, 0)
	var_27_30:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -630, _1080p * -470, _1080p * 516, _1080p * 548)
	var_27_0:addElement(var_27_30)

	var_27_0.SeasonWithText = var_27_30

	local var_27_31
	local var_27_32 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_27_1
	})

	var_27_32.id = "QualityWithText"

	var_27_32:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -630, _1080p * -470, _1080p * 474, _1080p * 506)
	var_27_0:addElement(var_27_32)

	var_27_0.QualityWithText = var_27_32

	local var_27_33
	local var_27_34 = LUI.UIStyledText.new()

	var_27_34.id = "CurrentName"

	var_27_34:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_27_34:setText("", 0)
	var_27_34:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_27_34:SetWordWrap(false)
	var_27_34:SetAlignment(LUI.Alignment.Left)
	var_27_34:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_27_34:SetStartupDelay(2000)
	var_27_34:SetLineHoldTime(400)
	var_27_34:SetAnimMoveTime(2000)
	var_27_34:SetAnimMoveSpeed(150)
	var_27_34:SetEndDelay(2000)
	var_27_34:SetCrossfadeTime(250)
	var_27_34:SetFadeInTime(300)
	var_27_34:SetFadeOutTime(300)
	var_27_34:SetMaxVisibleLines(1)
	var_27_34:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -624, _1080p * -114, _1080p * 244, _1080p * 280)
	var_27_0:addElement(var_27_34)

	var_27_0.CurrentName = var_27_34

	local var_27_35
	local var_27_36 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_27_1
	})

	var_27_36.id = "LobbyMembersFooter"

	var_27_36:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_27_0:addElement(var_27_36)

	var_27_0.LobbyMembersFooter = var_27_36

	local var_27_37
	local var_27_38 = LUI.UIImage.new()

	var_27_38.id = "SelectedPlayerCard"

	var_27_38:setImage(RegisterMaterial("ui_playercard_012"), 0)
	var_27_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1290, _1080p * 1802, _1080p * 290, _1080p * 418)
	var_27_0:addElement(var_27_38)

	var_27_0.SelectedPlayerCard = var_27_38

	local var_27_39
	local var_27_40 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_27_1
	})

	var_27_40.id = "EquippedWidget"

	var_27_40:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -630, _1080p * -494, _1080p * 432, _1080p * 462)
	var_27_0:addElement(var_27_40)

	var_27_0.EquippedWidget = var_27_40

	local var_27_41
	local var_27_42 = LUI.UIStyledText.new()

	var_27_42.id = "ItemsCollected"

	var_27_42:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_27_42:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_27_42:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_27_42:SetAlignment(LUI.Alignment.Left)
	var_27_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 102, _1080p * 287, _1080p * 201, _1080p * 223)
	var_27_0:addElement(var_27_42)

	var_27_0.ItemsCollected = var_27_42

	local var_27_43
	local var_27_44 = MenuBuilder.BuildRegisteredType("FavoriteAndSort", {
		controllerIndex = var_27_1
	})

	var_27_44.id = "FavoriteAndSort"

	var_27_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 929, _1080p * 1200, _1080p * 200, _1080p * 224)
	var_27_0:addElement(var_27_44)

	var_27_0.FavoriteAndSort = var_27_44

	local var_27_45
	local var_27_46 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_27_1
	})

	var_27_46.id = "NewItemPreviewNotification"

	var_27_46:SetAlpha(0, 0)
	var_27_46:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -630, _1080p * -552, _1080p * 432, _1080p * 462)
	var_27_0:addElement(var_27_46)

	var_27_0.NewItemPreviewNotification = var_27_46

	local var_27_47
	local var_27_48 = {
		spacing = 0,
		wrap = false,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_27_1
			})
		end,
		controllerIndex = var_27_1
	}
	local var_27_49 = LUI.TabManager.new(var_27_48)

	var_27_49.id = "Tabs"

	var_27_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 687, _1080p * 102, _1080p * 154)
	var_27_0:addElement(var_27_49)

	var_27_0.Tabs = var_27_49

	local var_27_50
	local var_27_51 = LUI.UIText.new()

	var_27_51.id = "UnlockText"

	var_27_51:SetAlpha(0, 0)
	var_27_51:setText("", 0)
	var_27_51:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_51:SetAlignment(LUI.Alignment.Left)
	var_27_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1296, _1080p * 1790, _1080p * 522, _1080p * 546)
	var_27_0:addElement(var_27_51)

	var_27_0.UnlockText = var_27_51

	local function var_27_52()
		return
	end

	var_27_0._sequences.DefaultSequence = var_27_52

	local var_27_53
	local var_27_54 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 567
		}
	}

	var_27_9:RegisterAnimationSequence("EquippedWithSeason", var_27_54)

	local var_27_55 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 586
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 758
		}
	}

	var_27_11:RegisterAnimationSequence("EquippedWithSeason", var_27_55)

	local var_27_56 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 586
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 633
		}
	}

	var_27_26:RegisterAnimationSequence("EquippedWithSeason", var_27_56)

	local var_27_57 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 614
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 738
		}
	}

	var_27_28:RegisterAnimationSequence("EquippedWithSeason", var_27_57)

	local var_27_58 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 516
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 548
		}
	}

	var_27_30:RegisterAnimationSequence("EquippedWithSeason", var_27_58)

	local var_27_59 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 474
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 506
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_32:RegisterAnimationSequence("EquippedWithSeason", var_27_59)

	local var_27_60 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("EquippedWithSeason", var_27_60)

	local function var_27_61()
		var_27_9:AnimateSequence("EquippedWithSeason")
		var_27_11:AnimateSequence("EquippedWithSeason")
		var_27_26:AnimateSequence("EquippedWithSeason")
		var_27_28:AnimateSequence("EquippedWithSeason")
		var_27_30:AnimateSequence("EquippedWithSeason")
		var_27_32:AnimateSequence("EquippedWithSeason")
		var_27_40:AnimateSequence("EquippedWithSeason")
	end

	var_27_0._sequences.EquippedWithSeason = var_27_61

	local var_27_62
	local var_27_63 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		}
	}

	var_27_9:RegisterAnimationSequence("EquippedWithoutSeason", var_27_63)

	local var_27_64 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 713
		}
	}

	var_27_11:RegisterAnimationSequence("EquippedWithoutSeason", var_27_64)

	local var_27_65 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 588
		}
	}

	var_27_26:RegisterAnimationSequence("EquippedWithoutSeason", var_27_65)

	local var_27_66 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 569
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_27_28:RegisterAnimationSequence("EquippedWithoutSeason", var_27_66)

	local var_27_67 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("EquippedWithoutSeason", var_27_67)

	local var_27_68 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 474
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 506
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_32:RegisterAnimationSequence("EquippedWithoutSeason", var_27_68)

	local var_27_69 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("EquippedWithoutSeason", var_27_69)

	local function var_27_70()
		var_27_9:AnimateSequence("EquippedWithoutSeason")
		var_27_11:AnimateSequence("EquippedWithoutSeason")
		var_27_26:AnimateSequence("EquippedWithoutSeason")
		var_27_28:AnimateSequence("EquippedWithoutSeason")
		var_27_30:AnimateSequence("EquippedWithoutSeason")
		var_27_32:AnimateSequence("EquippedWithoutSeason")
		var_27_40:AnimateSequence("EquippedWithoutSeason")
	end

	var_27_0._sequences.EquippedWithoutSeason = var_27_70

	local var_27_71
	local var_27_72 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		}
	}

	var_27_9:RegisterAnimationSequence("NotEquippedWithSeason", var_27_72)

	local var_27_73 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 713
		}
	}

	var_27_11:RegisterAnimationSequence("NotEquippedWithSeason", var_27_73)

	local var_27_74 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 588
		}
	}

	var_27_26:RegisterAnimationSequence("NotEquippedWithSeason", var_27_74)

	local var_27_75 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 569
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_27_28:RegisterAnimationSequence("NotEquippedWithSeason", var_27_75)

	local var_27_76 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 477
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 509
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -630
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -470
		}
	}

	var_27_30:RegisterAnimationSequence("NotEquippedWithSeason", var_27_76)

	local var_27_77 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_32:RegisterAnimationSequence("NotEquippedWithSeason", var_27_77)

	local var_27_78 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("NotEquippedWithSeason", var_27_78)

	local var_27_79 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_51:RegisterAnimationSequence("NotEquippedWithSeason", var_27_79)

	local function var_27_80()
		var_27_9:AnimateSequence("NotEquippedWithSeason")
		var_27_11:AnimateSequence("NotEquippedWithSeason")
		var_27_26:AnimateSequence("NotEquippedWithSeason")
		var_27_28:AnimateSequence("NotEquippedWithSeason")
		var_27_30:AnimateSequence("NotEquippedWithSeason")
		var_27_32:AnimateSequence("NotEquippedWithSeason")
		var_27_40:AnimateSequence("NotEquippedWithSeason")
		var_27_51:AnimateSequence("NotEquippedWithSeason")
	end

	var_27_0._sequences.NotEquippedWithSeason = var_27_80

	local var_27_81
	local var_27_82 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 477
		}
	}

	var_27_9:RegisterAnimationSequence("NotEquippedWithoutSeason", var_27_82)

	local var_27_83 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 496
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 668
		}
	}

	var_27_11:RegisterAnimationSequence("NotEquippedWithoutSeason", var_27_83)

	local var_27_84 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 496
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 543
		}
	}

	var_27_26:RegisterAnimationSequence("NotEquippedWithoutSeason", var_27_84)

	local var_27_85 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 524
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 648
		}
	}

	var_27_28:RegisterAnimationSequence("NotEquippedWithoutSeason", var_27_85)

	local var_27_86 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("NotEquippedWithoutSeason", var_27_86)

	local var_27_87 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_32:RegisterAnimationSequence("NotEquippedWithoutSeason", var_27_87)

	local var_27_88 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("NotEquippedWithoutSeason", var_27_88)

	local function var_27_89()
		var_27_9:AnimateSequence("NotEquippedWithoutSeason")
		var_27_11:AnimateSequence("NotEquippedWithoutSeason")
		var_27_26:AnimateSequence("NotEquippedWithoutSeason")
		var_27_28:AnimateSequence("NotEquippedWithoutSeason")
		var_27_30:AnimateSequence("NotEquippedWithoutSeason")
		var_27_32:AnimateSequence("NotEquippedWithoutSeason")
		var_27_40:AnimateSequence("NotEquippedWithoutSeason")
	end

	var_27_0._sequences.NotEquippedWithoutSeason = var_27_89

	local var_27_90
	local var_27_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 447
		}
	}

	var_27_9:RegisterAnimationSequence("InitializeDetails", var_27_91)

	local var_27_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 466
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 638
		}
	}

	var_27_11:RegisterAnimationSequence("InitializeDetails", var_27_92)

	local var_27_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 466
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 513
		}
	}

	var_27_26:RegisterAnimationSequence("InitializeDetails", var_27_93)

	local var_27_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 494
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 618
		}
	}

	var_27_28:RegisterAnimationSequence("InitializeDetails", var_27_94)

	local var_27_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("InitializeDetails", var_27_95)

	local var_27_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_32:RegisterAnimationSequence("InitializeDetails", var_27_96)

	local var_27_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("InitializeDetails", var_27_97)

	local function var_27_98()
		var_27_9:AnimateSequence("InitializeDetails")
		var_27_11:AnimateSequence("InitializeDetails")
		var_27_26:AnimateSequence("InitializeDetails")
		var_27_28:AnimateSequence("InitializeDetails")
		var_27_30:AnimateSequence("InitializeDetails")
		var_27_32:AnimateSequence("InitializeDetails")
		var_27_40:AnimateSequence("InitializeDetails")
	end

	var_27_0._sequences.InitializeDetails = var_27_98

	local var_27_99
	local var_27_100 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		}
	}

	var_27_9:RegisterAnimationSequence("NewWithoutSeason", var_27_100)

	local var_27_101 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 713
		}
	}

	var_27_11:RegisterAnimationSequence("NewWithoutSeason", var_27_101)

	local var_27_102 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 588
		}
	}

	var_27_26:RegisterAnimationSequence("NewWithoutSeason", var_27_102)

	local var_27_103 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 569
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_27_28:RegisterAnimationSequence("NewWithoutSeason", var_27_103)

	local var_27_104 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("NewWithoutSeason", var_27_104)

	local var_27_105 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 474
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 506
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_32:RegisterAnimationSequence("NewWithoutSeason", var_27_105)

	local function var_27_106()
		var_27_9:AnimateSequence("NewWithoutSeason")
		var_27_11:AnimateSequence("NewWithoutSeason")
		var_27_26:AnimateSequence("NewWithoutSeason")
		var_27_28:AnimateSequence("NewWithoutSeason")
		var_27_30:AnimateSequence("NewWithoutSeason")
		var_27_32:AnimateSequence("NewWithoutSeason")
	end

	var_27_0._sequences.NewWithoutSeason = var_27_106

	local var_27_107
	local var_27_108 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 567
		}
	}

	var_27_9:RegisterAnimationSequence("NewWithSeason", var_27_108)

	local var_27_109 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 586
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 758
		}
	}

	var_27_11:RegisterAnimationSequence("NewWithSeason", var_27_109)

	local var_27_110 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 586
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 633
		}
	}

	var_27_26:RegisterAnimationSequence("NewWithSeason", var_27_110)

	local var_27_111 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 614
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 738
		}
	}

	var_27_28:RegisterAnimationSequence("NewWithSeason", var_27_111)

	local var_27_112 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 516
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 548
		}
	}

	var_27_30:RegisterAnimationSequence("NewWithSeason", var_27_112)

	local var_27_113 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 474
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 506
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_32:RegisterAnimationSequence("NewWithSeason", var_27_113)

	local function var_27_114()
		var_27_9:AnimateSequence("NewWithSeason")
		var_27_11:AnimateSequence("NewWithSeason")
		var_27_26:AnimateSequence("NewWithSeason")
		var_27_28:AnimateSequence("NewWithSeason")
		var_27_30:AnimateSequence("NewWithSeason")
		var_27_32:AnimateSequence("NewWithSeason")
	end

	var_27_0._sequences.NewWithSeason = var_27_114

	local var_27_115
	local var_27_116 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		}
	}

	var_27_9:RegisterAnimationSequence("EquippedWithUnlockText", var_27_116)

	local var_27_117 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 713
		}
	}

	var_27_11:RegisterAnimationSequence("EquippedWithUnlockText", var_27_117)

	local var_27_118 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 588
		}
	}

	var_27_26:RegisterAnimationSequence("EquippedWithUnlockText", var_27_118)

	local var_27_119 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 569
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_27_28:RegisterAnimationSequence("EquippedWithUnlockText", var_27_119)

	local var_27_120 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("EquippedWithUnlockText", var_27_120)

	local var_27_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -485
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -325
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 474
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 506
		}
	}

	var_27_32:RegisterAnimationSequence("EquippedWithUnlockText", var_27_121)

	local var_27_122 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("EquippedWithUnlockText", var_27_122)

	local var_27_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 482
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 506
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_51:RegisterAnimationSequence("EquippedWithUnlockText", var_27_123)

	local function var_27_124()
		var_27_9:AnimateSequence("EquippedWithUnlockText")
		var_27_11:AnimateSequence("EquippedWithUnlockText")
		var_27_26:AnimateSequence("EquippedWithUnlockText")
		var_27_28:AnimateSequence("EquippedWithUnlockText")
		var_27_30:AnimateSequence("EquippedWithUnlockText")
		var_27_32:AnimateSequence("EquippedWithUnlockText")
		var_27_40:AnimateSequence("EquippedWithUnlockText")
		var_27_51:AnimateSequence("EquippedWithUnlockText")
	end

	var_27_0._sequences.EquippedWithUnlockText = var_27_124

	local var_27_125
	local var_27_126 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		}
	}

	var_27_9:RegisterAnimationSequence("EquippedWithUnlockTextAndSeason", var_27_126)

	local var_27_127 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 713
		}
	}

	var_27_11:RegisterAnimationSequence("EquippedWithUnlockTextAndSeason", var_27_127)

	local var_27_128 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 588
		}
	}

	var_27_26:RegisterAnimationSequence("EquippedWithUnlockTextAndSeason", var_27_128)

	local var_27_129 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 569
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_27_28:RegisterAnimationSequence("EquippedWithUnlockTextAndSeason", var_27_129)

	local var_27_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("EquippedWithUnlockTextAndSeason", var_27_130)

	local var_27_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -485
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -325
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -477
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -317
		}
	}

	var_27_32:RegisterAnimationSequence("EquippedWithUnlockTextAndSeason", var_27_131)

	local var_27_132 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("EquippedWithUnlockTextAndSeason", var_27_132)

	local var_27_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 482
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 506
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_51:RegisterAnimationSequence("EquippedWithUnlockTextAndSeason", var_27_133)

	local function var_27_134()
		var_27_9:AnimateSequence("EquippedWithUnlockTextAndSeason")
		var_27_11:AnimateSequence("EquippedWithUnlockTextAndSeason")
		var_27_26:AnimateSequence("EquippedWithUnlockTextAndSeason")
		var_27_28:AnimateSequence("EquippedWithUnlockTextAndSeason")
		var_27_30:AnimateSequence("EquippedWithUnlockTextAndSeason")
		var_27_32:AnimateSequence("EquippedWithUnlockTextAndSeason")
		var_27_40:AnimateSequence("EquippedWithUnlockTextAndSeason")
		var_27_51:AnimateSequence("EquippedWithUnlockTextAndSeason")
	end

	var_27_0._sequences.EquippedWithUnlockTextAndSeason = var_27_134

	local var_27_135
	local var_27_136 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 516
		}
	}

	var_27_9:RegisterAnimationSequence("NotEquippedWithUnlockText", var_27_136)

	local var_27_137 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 519
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 691
		}
	}

	var_27_11:RegisterAnimationSequence("NotEquippedWithUnlockText", var_27_137)

	local var_27_138 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 532
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 579
		}
	}

	var_27_26:RegisterAnimationSequence("NotEquippedWithUnlockText", var_27_138)

	local var_27_139 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 567
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 691
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1283
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1803
		}
	}

	var_27_28:RegisterAnimationSequence("NotEquippedWithUnlockText", var_27_139)

	local var_27_140 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("NotEquippedWithUnlockText", var_27_140)

	local var_27_141 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -630
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -470
		}
	}

	var_27_32:RegisterAnimationSequence("NotEquippedWithUnlockText", var_27_141)

	local var_27_142 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("NotEquippedWithUnlockText", var_27_142)

	local var_27_143 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 477
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 501
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1290
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1784
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_51:RegisterAnimationSequence("NotEquippedWithUnlockText", var_27_143)

	local function var_27_144()
		var_27_9:AnimateSequence("NotEquippedWithUnlockText")
		var_27_11:AnimateSequence("NotEquippedWithUnlockText")
		var_27_26:AnimateSequence("NotEquippedWithUnlockText")
		var_27_28:AnimateSequence("NotEquippedWithUnlockText")
		var_27_30:AnimateSequence("NotEquippedWithUnlockText")
		var_27_32:AnimateSequence("NotEquippedWithUnlockText")
		var_27_40:AnimateSequence("NotEquippedWithUnlockText")
		var_27_51:AnimateSequence("NotEquippedWithUnlockText")
	end

	var_27_0._sequences.NotEquippedWithUnlockText = var_27_144

	local var_27_145
	local var_27_146 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 516
		}
	}

	var_27_9:RegisterAnimationSequence("NotEquippedWithUnlockTextAndSeason", var_27_146)

	local var_27_147 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 519
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 691
		}
	}

	var_27_11:RegisterAnimationSequence("NotEquippedWithUnlockTextAndSeason", var_27_147)

	local var_27_148 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 532
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 579
		}
	}

	var_27_26:RegisterAnimationSequence("NotEquippedWithUnlockTextAndSeason", var_27_148)

	local var_27_149 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 567
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 691
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1283
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1803
		}
	}

	var_27_28:RegisterAnimationSequence("NotEquippedWithUnlockTextAndSeason", var_27_149)

	local var_27_150 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -449
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -289
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		}
	}

	var_27_30:RegisterAnimationSequence("NotEquippedWithUnlockTextAndSeason", var_27_150)

	local var_27_151 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -630
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -470
		}
	}

	var_27_32:RegisterAnimationSequence("NotEquippedWithUnlockTextAndSeason", var_27_151)

	local var_27_152 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_40:RegisterAnimationSequence("NotEquippedWithUnlockTextAndSeason", var_27_152)

	local var_27_153 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 477
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 501
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1290
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1784
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_51:RegisterAnimationSequence("NotEquippedWithUnlockTextAndSeason", var_27_153)

	local function var_27_154()
		var_27_9:AnimateSequence("NotEquippedWithUnlockTextAndSeason")
		var_27_11:AnimateSequence("NotEquippedWithUnlockTextAndSeason")
		var_27_26:AnimateSequence("NotEquippedWithUnlockTextAndSeason")
		var_27_28:AnimateSequence("NotEquippedWithUnlockTextAndSeason")
		var_27_30:AnimateSequence("NotEquippedWithUnlockTextAndSeason")
		var_27_32:AnimateSequence("NotEquippedWithUnlockTextAndSeason")
		var_27_40:AnimateSequence("NotEquippedWithUnlockTextAndSeason")
		var_27_51:AnimateSequence("NotEquippedWithUnlockTextAndSeason")
	end

	var_27_0._sequences.NotEquippedWithUnlockTextAndSeason = var_27_154

	local var_27_155
	local var_27_156 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		}
	}

	var_27_9:RegisterAnimationSequence("NewWithUnlockText", var_27_156)

	local var_27_157 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 713
		}
	}

	var_27_11:RegisterAnimationSequence("NewWithUnlockText", var_27_157)

	local var_27_158 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 588
		}
	}

	var_27_26:RegisterAnimationSequence("NewWithUnlockText", var_27_158)

	local var_27_159 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 569
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_27_28:RegisterAnimationSequence("NewWithUnlockText", var_27_159)

	local var_27_160 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("NewWithUnlockText", var_27_160)

	local var_27_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -310
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		}
	}

	var_27_32:RegisterAnimationSequence("NewWithUnlockText", var_27_161)

	local var_27_162 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 479
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1784
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1290
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 503
		}
	}

	var_27_51:RegisterAnimationSequence("NewWithUnlockText", var_27_162)

	local function var_27_163()
		var_27_9:AnimateSequence("NewWithUnlockText")
		var_27_11:AnimateSequence("NewWithUnlockText")
		var_27_26:AnimateSequence("NewWithUnlockText")
		var_27_28:AnimateSequence("NewWithUnlockText")
		var_27_30:AnimateSequence("NewWithUnlockText")
		var_27_32:AnimateSequence("NewWithUnlockText")
		var_27_51:AnimateSequence("NewWithUnlockText")
	end

	var_27_0._sequences.NewWithUnlockText = var_27_163

	local var_27_164
	local var_27_165 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		}
	}

	var_27_9:RegisterAnimationSequence("NewWithUnlockTextAndSeason", var_27_165)

	local var_27_166 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 713
		}
	}

	var_27_11:RegisterAnimationSequence("NewWithUnlockTextAndSeason", var_27_166)

	local var_27_167 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 541
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 588
		}
	}

	var_27_26:RegisterAnimationSequence("NewWithUnlockTextAndSeason", var_27_167)

	local var_27_168 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 569
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		}
	}

	var_27_28:RegisterAnimationSequence("NewWithUnlockTextAndSeason", var_27_168)

	local var_27_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("NewWithUnlockTextAndSeason", var_27_169)

	local var_27_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 464
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -310
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 432
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_32:RegisterAnimationSequence("NewWithUnlockTextAndSeason", var_27_170)

	local var_27_171 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1290
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 479
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1784
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 503
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_51:RegisterAnimationSequence("NewWithUnlockTextAndSeason", var_27_171)

	local function var_27_172()
		var_27_9:AnimateSequence("NewWithUnlockTextAndSeason")
		var_27_11:AnimateSequence("NewWithUnlockTextAndSeason")
		var_27_26:AnimateSequence("NewWithUnlockTextAndSeason")
		var_27_28:AnimateSequence("NewWithUnlockTextAndSeason")
		var_27_30:AnimateSequence("NewWithUnlockTextAndSeason")
		var_27_32:AnimateSequence("NewWithUnlockTextAndSeason")
		var_27_51:AnimateSequence("NewWithUnlockTextAndSeason")
	end

	var_27_0._sequences.NewWithUnlockTextAndSeason = var_27_172

	local var_27_173 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_27_18,
		startCap = var_27_18.startCap,
		endCap = var_27_18.endCap,
		sliderArea = var_27_18.sliderArea,
		slider = var_27_18.sliderArea and var_27_18.sliderArea.slider,
		fixedSizeSlider = var_27_18.sliderArea and var_27_18.sliderArea.fixedSizeSlider
	})

	var_27_16:AddScrollbar(var_27_173)
	var_27_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_27_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_27_174 = LUI.UIBindButton.new()

	var_27_174.id = "selfBindButton"

	var_27_0:addElement(var_27_174)

	var_27_0.bindButton = var_27_174

	var_27_0.bindButton:addEventHandler("button_secondary", function(arg_45_0, arg_45_1)
		if not arg_45_1.controller then
			local var_45_0 = var_27_1
		end

		ACTIONS.LeaveMenu(var_27_0)
	end)
	var_0_15(var_27_0, var_27_1, arg_27_1)

	return var_27_0
end

MenuBuilder.registerType("PlayerCardSelect", PlayerCardSelect)
LockTable(_M)
