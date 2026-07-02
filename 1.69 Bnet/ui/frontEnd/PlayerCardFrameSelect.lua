module(..., package.seeall)

local var_0_0 = 1
local var_0_1 = 2

local function var_0_2(arg_1_0)
	local var_1_0 = arg_1_0.PlayerCardFrameGrid:GetFocusPositionIndex()

	if var_1_0 then
		return var_1_0 + 1
	end
end

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0 = RANDOM.IsEnabled(arg_2_0._controllerIndex, LOOT.itemTypes.FRAME)
	local var_2_1 = RANDOM.IsEnabled(arg_2_0._controllerIndex, LOOT.itemTypes.FRAME, {
		isFav = true
	})
	local var_2_2 = var_2_1 and arg_2_1.isRandomFavorite

	return not var_2_0 and not var_2_1 and arg_2_0._equippedFrameIndex == tonumber(arg_2_1.index) or var_2_0 and arg_2_1.isRandom and not arg_2_1.isRandomFavorite or var_2_2
end

local function var_0_4(arg_3_0, arg_3_1)
	arg_3_0._frameTable = {}

	if not arg_3_0._allFramesTable then
		arg_3_0._allFramesTable = CallingCardFramesUtils.GetAllFrames(arg_3_1, {
			unlockType = CallingCardUtils.Categories.CORE
		})
	end

	local var_3_0 = 0
	local var_3_1 = 0

	for iter_3_0 = 1, #arg_3_0._allFramesTable do
		local var_3_2 = arg_3_0._allFramesTable[iter_3_0]

		var_3_2.selected = var_0_3(arg_3_0, var_3_2)

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

	for iter_3_1 = 1, #arg_3_0._allFramesTable do
		if arg_3_0._allFramesTable[iter_3_1].isUnlocked or arg_3_0.lockedSortingType == LOOT.lockedSortingOptions.SHOW then
			table.insert(arg_3_0._frameTable, arg_3_0._allFramesTable[iter_3_1])
		end
	end

	local var_3_3 = {}

	table.insert(var_3_3, {
		sortFunc = MenuUtils.SortSelected
	})
	table.insert(var_3_3, {
		sortFunc = MenuUtils.SortFavorites,
		sortFuncParams = {
			favoritesTable = arg_3_0._favoriteFrames
		}
	})
	table.insert(var_3_3, {
		sortFunc = MenuUtils.SortNew,
		sortFuncParams = {
			controllerIndex = arg_3_0._controllerIndex
		}
	})
	table.insert(var_3_3, {
		sortFunc = MenuUtils.SortUnlocks
	})

	if arg_3_0.seasonsSortingType ~= LOOT.seasonsSortingOptions.NONE then
		table.insert(var_3_3, {
			sortFunc = MenuUtils.SortSeasons,
			sortFuncParams = {
				seasonsSortingType = arg_3_0.seasonsSortingType
			}
		})
	end

	if arg_3_0.raritySortingType ~= LOOT.raritySortingOptions.NONE then
		table.insert(var_3_3, {
			sortFunc = MenuUtils.SortRarity,
			sortFuncParams = {
				raritySortingType = arg_3_0.raritySortingType
			}
		})
	end

	table.insert(var_3_3, {
		sortFunc = MenuUtils.SortName
	})
	MenuUtils.SortTableViaOptions(arg_3_0._frameTable, var_3_3)

	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		local var_3_4 = RANDOM.GetItemData(arg_3_1, {
			isFav = true,
			itemType = LOOT.itemTypes.FRAME
		})

		var_3_4.isUnlocked = arg_3_0._favoriteFrames.count >= 2
		var_3_4.unlockText = Engine.CBBHFCGDIC("CUSTOMIZE/RANDOM_FRAME_FAVORITE_UNLOCK")

		table.insert(arg_3_0._frameTable, 1, var_3_4)
		table.insert(arg_3_0._frameTable, 1, RANDOM.GetItemData(arg_3_1, {
			itemType = LOOT.itemTypes.FRAME
		}))
	end

	arg_3_0.FavoriteAndSort:Update(arg_3_1, arg_3_0)
end

local function var_0_5(arg_4_0)
	local var_4_0 = arg_4_0.isUnlocked
	local var_4_1 = arg_4_0.isRandom

	return var_4_0 and not var_4_1
end

local function var_0_6(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if arg_5_1.isRandom then
		return
	end

	arg_5_1:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(arg_5_2)
	})

	local var_5_0 = {
		id = "playerCardAddToFavorite",
		actionName = arg_5_3 and Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES") or Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
		actionFunction = function()
			arg_5_0:SetFavorite()
		end
	}

	arg_5_1:AddContextualMenuAction(var_5_0)
end

local function var_0_7(arg_7_0)
	return function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = arg_8_1 + arg_8_2 * arg_7_0.PlayerCardFrameGrid:GetNumColumns()
		local var_8_1 = arg_7_0._frameTable[var_8_0 + 1]
		local var_8_2 = var_0_3(arg_7_0, var_8_1)
		local var_8_3 = arg_7_0._favoriteFrames[var_8_1.ref]

		arg_8_0:RefreshButton(arg_7_0, var_8_1, var_8_2, var_8_3)

		if var_0_5(var_8_1) then
			var_0_6(arg_7_0, arg_8_0, var_8_1.name, var_8_3)
		end
	end
end

local function var_0_8(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0._favoriteFrames[arg_9_1.ref]
	local var_9_1 = arg_9_0._favoriteFrames.count

	arg_9_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_9_0, var_9_1)
end

local function var_0_9(arg_10_0)
	local var_10_0 = var_0_2(arg_10_0)

	if not var_10_0 then
		return
	end

	local var_10_1 = arg_10_0._frameTable[var_10_0]

	if not var_0_5(var_10_1) then
		return
	end

	if arg_10_0._favoriteFrames[var_10_1.ref] then
		LOOT.RemoveFavoriteForType(LOOT.itemTypes.FRAME, var_10_1.ref)

		if Dvar.IBEGCHEFE("TQRNTTMSL") then
			local var_10_2 = arg_10_0._favoriteFrames.count

			arg_10_0._frameTable[var_0_1].isUnlocked = var_10_2 - 1 >= 2

			var_0_7(arg_10_0)

			if RANDOM.IsEnabled(arg_10_0._controllerIndex, LOOT.itemTypes.FRAME, {
				isFav = true
			}) and not arg_10_0._frameTable[var_0_1].isUnlocked then
				local var_10_3 = arg_10_0.PlayerCardFrameGrid:GetPositionForIndex(var_0_0)

				arg_10_0.PlayerCardFrameGrid:SetFocusedPosition(var_10_3, true)
				arg_10_0:Equip(var_0_0)
			end
		end
	else
		local var_10_4 = arg_10_0._favoriteFrames.count

		if var_10_4 >= LOOT.maxFavorites then
			ACTIONS.AnimateSequence(arg_10_0.FavoriteAndSort.FavoritesPrompt, "Warning")
			Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

			return
		else
			LOOT.AddFavoriteForType(LOOT.itemTypes.FRAME, var_10_1.ref)

			if Dvar.IBEGCHEFE("TQRNTTMSL") then
				arg_10_0._frameTable[var_0_1].isUnlocked = var_10_4 + 1 >= 2

				var_0_7(arg_10_0)
			end
		end
	end

	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

	local var_10_5 = ""
	local var_10_6 = ""
	local var_10_7

	if not arg_10_0._favoriteFrames[var_10_1.ref] then
		var_10_5 = "LUA_MENU/ITEM_FAVORITED"
		var_10_7 = "cac_equip_fill"
	else
		var_10_5 = "LUA_MENU/ITEM_UNFAVORITED"
		var_10_7 = "cac_equip_ring"
	end

	local var_10_8 = {
		iconScale = -0.3,
		displayTime = 1500,
		icon = var_10_7,
		iconColor = SWATCHES.genericMenu.notificationHighlight,
		header = Engine.CBBHFCGDIC(var_10_5),
		description = Engine.CBBHFCGDIC(var_10_1.name),
		controllerIndex = controllerIndex
	}

	arg_10_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_10_8
	})

	arg_10_0._favoriteFrames = LOOT.GetFavoritesForType(LOOT.itemTypes.FRAME)

	arg_10_0.PlayerCardFrameGrid:RefreshContent()

	if #arg_10_0._frameTable > 0 then
		arg_10_0.NoPlayerCardsLabel:SetAlpha(0)
	end

	local var_10_9 = arg_10_0.PlayerCardFrameGrid:GetPositionForIndex(var_10_0 - 1)

	arg_10_0.PlayerCardFrameGrid:SetFocusedPosition(var_10_9, true)
	var_0_8(arg_10_0, var_10_1)
end

local function var_0_10(arg_11_0, arg_11_1)
	arg_11_1 = arg_11_1 ~= nil and arg_11_1 or var_0_2(arg_11_0)

	if not arg_11_1 then
		return
	end

	local var_11_0 = arg_11_0._frameTable[arg_11_1]
	local var_11_1 = tonumber(var_11_0.index)

	if var_11_0.isRandom or not var_0_3(arg_11_0, var_11_0) then
		local var_11_2 = var_11_0.image

		if var_11_0.isRandomFavorite then
			RANDOM.Toggle(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME, {
				isFav = true
			})

			if not RANDOM.IsEnabled(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME, {
				isFav = true
			}) then
				var_11_2 = CallingCardFramesUtils.GetFrameTexture(arg_11_0._equippedFrameIndex)
			end

			RANDOM.SetEnabled(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME, false)
		elseif var_11_0.isRandom then
			RANDOM.Toggle(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME)

			if not RANDOM.IsEnabled(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME) then
				var_11_2 = CallingCardFramesUtils.GetFrameTexture(arg_11_0._equippedFrameIndex)
			end

			RANDOM.SetEnabled(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME, false, {
				isFav = true
			})
		else
			RANDOM.SetEnabled(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME, false)
			RANDOM.SetEnabled(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME, false, {
				isFav = true
			})
			Playercard.BCEECAFBBG(arg_11_0._controllerIndex, var_11_1)

			arg_11_0._equippedFrameIndex = var_11_1
		end

		if not RANDOM.IsEnabled(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME) and not RANDOM.IsEnabled(arg_11_0._controllerIndex, LOOT.itemTypes.FRAME, {
			isFav = true
		}) then
			arg_11_0.DetailPanel.WZSmallPlayerCard.PlayerCardFrameImage:setImage(RegisterMaterial(var_11_2))
		end

		arg_11_0:UpdateGrid()

		local var_11_3 = "hud_cmd_active_backer"

		if var_11_2 ~= "" then
			var_11_3 = var_11_2
		end

		local var_11_4 = {
			displayTime = 2000,
			icon = var_11_3,
			header = Engine.CBBHFCGDIC("LUA_MENU/PLAYERCARD_EQUIPPED"),
			description = Engine.CBBHFCGDIC(var_11_0.name),
			type = LUI.ToastManager.NotificationType.FrameEquipped,
			controllerIndex = arg_11_0._controllerIndex
		}

		arg_11_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_11_4
		})
	end
end

local function var_0_11(arg_12_0)
	local var_12_0 = var_0_2(arg_12_0)

	if not var_12_0 then
		return
	end

	local var_12_1 = arg_12_0._frameTable[var_12_0]
	local var_12_2 = Loot.HDJCADADF(arg_12_0._controllerIndex, var_12_1.lootID)

	arg_12_0.DetailPanel:UpdatePanel(var_12_1, isSelected, not var_12_1.isRandom and var_12_2)

	if var_0_5(var_12_1) then
		arg_12_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(1)

		local var_12_3 = arg_12_0._favoriteFrames[var_12_1.ref]
		local var_12_4 = arg_12_0._favoriteFrames.count

		arg_12_0.FavoriteAndSort.FavoritesPrompt:UpdateText(var_12_3, var_12_4)
	else
		arg_12_0.FavoriteAndSort.FavoritesPrompt:SetAlpha(0)
	end
end

local function var_0_12(arg_13_0)
	arg_13_0.PlayerCardFrameGrid:RemoveFocusFromChild()
	arg_13_0.PlayerCardFrameGrid:SetNumChildren(#arg_13_0._frameTable)
	arg_13_0.PlayerCardFrameGrid:RefreshContent()

	if #arg_13_0._frameTable > 0 then
		arg_13_0.NoPlayerCardsLabel:SetAlpha(0)
	end
end

local function var_0_13(arg_14_0)
	local var_14_0 = CallingCardFramesUtils.GetFrameRef(arg_14_0._equippedFrameIndex)

	return LOOT.GetItemID(LOOT.itemTypes.FRAME, var_14_0)
end

local function var_0_14(arg_15_0)
	local var_15_0 = (function()
		for iter_16_0, iter_16_1 in ipairs(arg_15_0._frameTable) do
			if var_0_3(arg_15_0, iter_16_1) then
				return iter_16_0 - 1
			end
		end

		return 0
	end)()
	local var_15_1 = arg_15_0.PlayerCardFrameGrid:GetPositionForIndex(var_15_0)

	arg_15_0.PlayerCardFrameGrid:SetFocusedPosition(var_15_1, true)
end

local function var_0_15(arg_17_0)
	if arg_17_0._isComingFromFilterMenu then
		local var_17_0 = (function()
			for iter_18_0, iter_18_1 in ipairs(arg_17_0._frameTable) do
				if iter_18_1.lootID == arg_17_0._currentSelectedLootID then
					return iter_18_0 - 1
				end
			end

			return 0
		end)()
		local var_17_1 = arg_17_0.PlayerCardFrameGrid:GetPositionForIndex(var_17_0)

		arg_17_0.PlayerCardFrameGrid:SetFocusedPosition(var_17_1, true, nil, nil, nil)

		arg_17_0._isComingFromFilterMenu = false

		return true
	end
end

local function var_0_16(arg_19_0, arg_19_1)
	local var_19_0 = {
		{
			name = Engine.CBBHFCGDIC("CHALLENGE/CORE")
		},
		{
			name = Engine.CBBHFCGDIC("CHALLENGE/VICTORIES")
		}
	}

	if #var_19_0 > 0 then
		local var_19_1 = {}

		for iter_19_0, iter_19_1 in ipairs(var_19_0) do
			table.insert(var_19_1, {
				disabled = false,
				name = iter_19_1.name,
				tabHeight = _1080p * 52,
				focusFunction = function(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
					assert(arg_20_2 + 1 > #CallingCardFramesUtils.Categories)

					arg_19_0._allPlayerCardsTable = CallingCardFramesUtils.GetAllFramesCards(arg_20_1, {
						unlockType = arg_20_2 + 1
					})

					var_0_4(arg_19_0, arg_20_1)
					arg_19_0:UpdateGrid()
				end
			})
		end

		arg_19_0.Tabs:SetTabs(var_19_1)
		arg_19_0.Tabs:SetAlignment(LUI.Alignment.Left)
	end
end

local function var_0_17(arg_21_0, arg_21_1)
	assert(arg_21_0.MenuTitle)
	assert(arg_21_0.PlayerCardFrameGrid)
	assert(arg_21_0.FavoriteAndSort)
	arg_21_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CALLINGCARDFRAME"))
	arg_21_0.DetailPanel:SetupPanel(arg_21_0.DetailPanel:GetCurrentAnchorsAndPositions())
	arg_21_0.DetailPanel:UpdatePlayerCardData(arg_21_1)

	arg_21_0.SetFavorite = var_0_9
	arg_21_0.Equip = var_0_10
	arg_21_0.FavoriteFrame = FavoriteFrame
	arg_21_0.Preview = var_0_11
	arg_21_0.UpdateGrid = var_0_12
	arg_21_0._controllerIndex = arg_21_1
	arg_21_0._frameTable = {}
	arg_21_0._allFramesTable = CallingCardFramesUtils.GetAllFrames(arg_21_1, {
		unlockType = CallingCardFramesUtils.Categories.CORE
	})
	arg_21_0._favoriteFrames = LOOT.GetFavoritesForType(LOOT.itemTypes.FRAME)
	arg_21_0._equippedFrameIndex = DataSources.frontEnd.PlayerCard.frame:GetValue(arg_21_1)
	arg_21_0._isComingFromFilterMenu = false

	LOOT.SetupSortingBehavior(arg_21_0, arg_21_1, LOOT.itemTypes.FRAME)
	arg_21_0.Tabs:closeTree()

	arg_21_0.Tabs = nil

	var_0_4(arg_21_0, arg_21_1)
	arg_21_0.PlayerCardFrameGrid:SetRefreshChild(var_0_7(arg_21_0))
	arg_21_0:addEventHandler("restore_focus", var_0_15)
	arg_21_0.PlayerCardFrameGrid:SetSnapOnWrapEnabled(true)
	arg_21_0:UpdateGrid()
	var_0_14(arg_21_0)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	Playercard.DAHDCGCDEC(arg_21_1)

	local var_21_0 = Engine.DCJHCAFIIA()
	local var_21_1 = var_0_13(arg_21_0)

	arg_21_0:addEventHandler("menu_close", function(arg_22_0, arg_22_1)
		DataSources.frontEnd.PlayerCard.frame:SetValue(arg_21_1, arg_21_0._equippedFrameIndex)
		Playercard.FCBJJBFBJ(arg_21_1)

		local var_22_0 = var_0_13(arg_21_0)

		METRICS.LootUsageSendDLogEvent(arg_21_0, {
			controllerIndex = arg_21_1,
			startTime = var_21_0,
			previousItemIDs = var_21_1,
			newItemIDs = var_22_0
		})
	end)

	if CONDITIONS.IsUserSignedInDemonware(arg_21_1) then
		arg_21_0.bindButton:addEventHandler("button_right_trigger", function(arg_23_0, arg_23_1)
			arg_21_0:SetFavorite()
		end)
	end

	arg_21_0:addEventHandler("update_input_type", function(arg_24_0, arg_24_1)
		arg_24_0.FavoriteAndSort:Update(arg_24_1.controllerIndex, arg_24_0)
	end, {
		controllerIndex = arg_21_1
	})
	arg_21_0.HelperBar:AddButtonHelperTextToElement(arg_21_0, {
		kbm_only = true,
		priority = 4,
		side = "left",
		button_ref = "button_left_trigger",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
	})
	arg_21_0.bindButton:addEventHandler("button_left_trigger", function(arg_25_0, arg_25_1)
		if LUI.IsLastInputGamepad(arg_25_1.controller) then
			local var_25_0 = var_0_2(arg_21_0)

			arg_21_0._currentSelectedLootID = arg_21_0._frameTable[var_25_0].lootID
		end

		local var_25_1 = MenuBuilder.BuildRegisteredType("CustomizeSortingPopup", {
			controllerIndex = arg_21_1,
			menu = arg_21_0,
			type = LOOT.itemTypes.FRAME
		})

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_21_1, false, {
			flyInLeftNarrow = true,
			widget = var_25_1
		})
		var_25_1:addEventHandler("menu_close", function(arg_26_0, arg_26_1)
			arg_21_0._isComingFromFilterMenu = true

			var_0_4(arg_21_0, arg_21_1)
			arg_21_0:UpdateGrid()
		end)
	end)

	local function var_21_2()
		local var_27_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_21_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -192, _1080p * 192, 0, _1080p * 160)
	end

	arg_21_0:addAndCallEventHandler("onVideoChange", var_21_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_21_0, arg_21_1)
	ACTIONS.ScaleFullscreen(arg_21_0.Darken)
	arg_21_0.DetailPanel.WZSmallPlayerCard:UpdateWithRandom(arg_21_1)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_21_0)
	end
end

function PlayerCardFrameSelect(arg_28_0, arg_28_1)
	local var_28_0 = LUI.UIElement.new()

	var_28_0.id = "PlayerCardFrameSelect"

	local var_28_1 = arg_28_1 and arg_28_1.controllerIndex

	if not var_28_1 and not Engine.DDJFBBJAIG() then
		var_28_1 = var_28_0:getRootController()
	end

	assert(var_28_1)

	var_28_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_28_1
	})
	var_28_0.HelperBar.id = "HelperBar"

	var_28_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_28_0.HelperBar:setPriority(10)
	var_28_0:addElement(var_28_0.HelperBar)

	local var_28_2 = var_28_0
	local var_28_3
	local var_28_4 = {
		worldBlur = 1,
		controllerIndex = var_28_1
	}
	local var_28_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_28_4)

	var_28_5.id = "WorldBlur"

	var_28_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_28_0:addElement(var_28_5)

	var_28_0.WorldBlur = var_28_5

	local var_28_6
	local var_28_7 = LUI.UIImage.new()

	var_28_7.id = "Darken"

	var_28_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_28_7:SetAlpha(0.5, 0)
	var_28_0:addElement(var_28_7)

	var_28_0.Darken = var_28_7

	local var_28_8
	local var_28_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_28_1
	})

	var_28_9.id = "Vignette"

	var_28_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_28_0:addElement(var_28_9)

	var_28_0.Vignette = var_28_9

	local var_28_10
	local var_28_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_28_1
	})

	var_28_11.id = "TabBacker"

	var_28_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_28_0:addElement(var_28_11)

	var_28_0.TabBacker = var_28_11

	local var_28_12
	local var_28_13 = {
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
		controllerIndex = var_28_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PlayerCardButton", {
				controllerIndex = var_28_1
			})
		end,
		refreshChild = function(arg_30_0, arg_30_1, arg_30_2)
			return
		end,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 360,
		rowHeight = _1080p * 140,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_28_14 = LUI.UIGrid.new(var_28_13)

	var_28_14.id = "PlayerCardFrameGrid"

	var_28_14:setUseStencil(true)
	var_28_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -720, _1080p * 244, _1080p * 840)
	var_28_0:addElement(var_28_14)

	var_28_0.PlayerCardFrameGrid = var_28_14

	local var_28_15
	local var_28_16 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_28_1
	})

	var_28_16.id = "PlayercardScrollbar"

	var_28_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1200, _1080p * 1216, _1080p * 244, _1080p * 840)
	var_28_0:addElement(var_28_16)

	var_28_0.PlayercardScrollbar = var_28_16

	local var_28_17
	local var_28_18 = LUI.UIText.new()

	var_28_18.id = "NoPlayerCardsLabel"

	var_28_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NO_CALLING_CARDS"), 0)
	var_28_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_28_18:SetAlignment(LUI.Alignment.Center)
	var_28_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -720, _1080p * 522, _1080p * 567)
	var_28_0:addElement(var_28_18)

	var_28_0.NoPlayerCardsLabel = var_28_18

	local var_28_19
	local var_28_20 = LUI.UIImage.new()

	var_28_20.id = "GridDivider"

	var_28_20:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_28_20:SetAlpha(0.6, 0)
	var_28_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1200, _1080p * 230, _1080p * 231)
	var_28_0:addElement(var_28_20)

	var_28_0.GridDivider = var_28_20

	local var_28_21
	local var_28_22 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_28_1
	})

	var_28_22.id = "MenuTitle"

	var_28_22.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CALLINGCARDFRAME"), 0)
	var_28_22.Line:SetLeft(0, 0)
	var_28_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_28_0:addElement(var_28_22)

	var_28_0.MenuTitle = var_28_22

	local var_28_23
	local var_28_24 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_28_1
	})

	var_28_24.id = "LobbyMembersFooter"

	var_28_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_28_0:addElement(var_28_24)

	var_28_0.LobbyMembersFooter = var_28_24

	local var_28_25
	local var_28_26 = LUI.UIStyledText.new()

	var_28_26.id = "ItemsCollected"

	var_28_26:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_28_26:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_28_26:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_28_26:SetAlignment(LUI.Alignment.Left)
	var_28_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 102, _1080p * 287, _1080p * 201, _1080p * 223)
	var_28_0:addElement(var_28_26)

	var_28_0.ItemsCollected = var_28_26

	local var_28_27
	local var_28_28 = MenuBuilder.BuildRegisteredType("FavoriteAndSort", {
		controllerIndex = var_28_1
	})

	var_28_28.id = "FavoriteAndSort"

	var_28_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 929, _1080p * 1200, _1080p * 200, _1080p * 224)
	var_28_0:addElement(var_28_28)

	var_28_0.FavoriteAndSort = var_28_28

	local var_28_29
	local var_28_30 = {
		spacing = 0,
		wrap = false,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_28_1
			})
		end,
		controllerIndex = var_28_1
	}
	local var_28_31 = LUI.TabManager.new(var_28_30)

	var_28_31.id = "Tabs"

	var_28_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 687, _1080p * 102, _1080p * 154)
	var_28_0:addElement(var_28_31)

	var_28_0.Tabs = var_28_31

	local var_28_32
	local var_28_33 = MenuBuilder.BuildRegisteredType("CustomizationDetailPanel", {
		controllerIndex = var_28_1
	})

	var_28_33.id = "DetailPanel"

	var_28_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1269, _1080p * 1824, _1080p * 230, _1080p * 426)
	var_28_0:addElement(var_28_33)

	var_28_0.DetailPanel = var_28_33

	local var_28_34 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_28_16,
		startCap = var_28_16.startCap,
		endCap = var_28_16.endCap,
		sliderArea = var_28_16.sliderArea,
		slider = var_28_16.sliderArea and var_28_16.sliderArea.slider,
		fixedSizeSlider = var_28_16.sliderArea and var_28_16.sliderArea.fixedSizeSlider
	})

	var_28_14:AddScrollbar(var_28_34)
	var_28_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_28_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_28_35 = LUI.UIBindButton.new()

	var_28_35.id = "selfBindButton"

	var_28_0:addElement(var_28_35)

	var_28_0.bindButton = var_28_35

	var_28_0.bindButton:addEventHandler("button_secondary", function(arg_32_0, arg_32_1)
		if not arg_32_1.controller then
			local var_32_0 = var_28_1
		end

		ACTIONS.LeaveMenu(var_28_0)
	end)
	var_0_17(var_28_0, var_28_1, arg_28_1)

	return var_28_0
end

MenuBuilder.registerType("PlayerCardFrameSelect", PlayerCardFrameSelect)
LockTable(_M)
