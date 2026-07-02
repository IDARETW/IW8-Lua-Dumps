module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.WatchGrid:GetFocusPositionIndex() + 1
end

local function var_0_1(arg_2_0)
	return WATCH.GetAllWatches(arg_2_0._controllerIndex)
end

local function var_0_2(arg_3_0)
	if not arg_3_0._allWatchesTable or #arg_3_0._allWatchesTable == 0 then
		arg_3_0._allWatchesTable = var_0_1(arg_3_0)
	end

	arg_3_0._watchTable = {}

	for iter_3_0 = 1, #arg_3_0._allWatchesTable do
		if arg_3_0._allWatchesTable[iter_3_0].isUnlocked or arg_3_0.lockedSortingType == LOOT.lockedSortingOptions.SHOW then
			table.insert(arg_3_0._watchTable, arg_3_0._allWatchesTable[iter_3_0])
		end
	end

	table.sort(arg_3_0._watchTable, function(arg_4_0, arg_4_1)
		if arg_4_0.ref ~= WATCH.WatchNoneValue and arg_4_1.ref == WATCH.WatchNoneValue then
			return false
		elseif arg_4_0.ref == WATCH.WatchNoneValue and not arg_4_1.ref == WATCH.WatchNoneValue then
			return true
		end

		if arg_3_0._favoriteWatches[arg_4_0.ref] ~= arg_3_0._favoriteWatches[arg_4_1.ref] then
			return arg_3_0._favoriteWatches[arg_4_0.ref] and not arg_3_0._favoriteWatches[arg_4_1.ref]
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

		return false
	end)
	arg_3_0.SortPrompt:UpdateText(arg_3_0)
end

local function var_0_3(arg_5_0)
	local var_5_0 = (function()
		for iter_6_0, iter_6_1 in ipairs(arg_5_0._watchTable) do
			if arg_5_0._equippedWatch == iter_6_1.ref then
				return iter_6_0 - 1
			end
		end
	end)() or 0

	arg_5_0.WatchGrid:SetFocusedPosition({
		x = 0,
		y = var_5_0
	}, true)
end

local function var_0_4(arg_7_0)
	local var_7_0 = var_0_0(arg_7_0)
	local var_7_1 = arg_7_0._watchTable[var_7_0]

	if arg_7_0._equippedWatch == var_7_1.ref then
		var_7_1 = arg_7_0._watchTable[1]
	end

	WATCH.SetEquippedWatch(arg_7_0._controllerIndex, var_7_1.ref, arg_7_0._equippedWatch)
	arg_7_0:UpdateGrid()
end

local function var_0_5(arg_8_0, arg_8_1)
	local var_8_0 = PlayerData.BFFBGAJGD(arg_8_0._controllerIndex, CoD.StatsGroup.Common)
	local var_8_1

	if arg_8_1 == "pet_turbo" then
		var_8_1 = var_8_0.petWatchDataTurbo
	else
		var_8_1 = var_8_0.petWatchDataTurboAlt
	end

	local var_8_2 = var_8_1.phase:get()
	local var_8_3
	local var_8_4

	if var_8_2 == 1 then
		var_8_3 = "MENU/CHALLENGE_EGG"
		var_8_4 = "CHARMS/COS_349"
	elseif var_8_2 == 2 then
		var_8_3 = "MENU/CHALLENGE_BABY"
		var_8_4 = "CHARMS/COS_350"
	elseif var_8_2 == 3 then
		var_8_3 = "MENU/CHALLENGE_CHILD"
		var_8_4 = "CHARMS/COS_351"
	elseif var_8_2 == 4 then
		var_8_3 = "MENU/CHALLENGE_TEENA"
		var_8_4 = "CHARMS/COS_352"
	elseif var_8_2 == 5 then
		var_8_3 = "MENU/CHALLENGE_TEENB"
		var_8_4 = "CHARMS/COS_353"
	elseif var_8_2 == 6 then
		var_8_3 = "MENU/CHALLENGE_SKUNK"
		var_8_4 = "CHARMS/COS_340"
	elseif var_8_2 == 7 then
		var_8_3 = "MENU/CHALLENGE_BEAR"
		var_8_4 = "CHARMS/COS_341"
	elseif var_8_2 == 8 then
		var_8_3 = "MENU/CHALLENGE_MANTIS"
		var_8_4 = "CHARMS/COS_342"
	elseif var_8_2 == 9 then
		var_8_3 = "MENU/CHALLENGE_TREX"
		var_8_4 = "CHARMS/COS_343"
	elseif var_8_2 == 10 then
		var_8_3 = "MENU/CHALLENGE_OCTOPUS"
		var_8_4 = "CHARMS/COS_344"
	elseif var_8_2 == 11 then
		var_8_3 = "MENU/CHALLENGE_FOX"
		var_8_4 = "CHARMS/COS_345"
	elseif var_8_2 == 12 then
		var_8_3 = "MENU/CHALLENGE_SECRET1"
		var_8_4 = "CHARMS/COS_346"
	elseif var_8_2 == 13 then
		var_8_3 = "MENU/CHALLENGE_SECRET2"
		var_8_4 = "CHARMS/COS_347"
	elseif var_8_2 == 14 then
		var_8_3 = "MENU/CHALLENGE_SECRETFINAL"
		var_8_4 = "CHARMS/COS_348"
	elseif var_8_2 == 15 then
		var_8_3 = "STORE_FLAVOR/TURBO_PET_FLAVOR_DEAD"
		var_8_4 = "GAME/DEAD"
	end

	local var_8_5 = Engine.CBBHFCGDIC("LUA_MENU/X_COLON_Y", var_8_4, var_8_3)

	return (Engine.CBBHFCGDIC("LUA_MENU/N_NEWLINE_M", "STORE_FLAVOR/TURBO_PET_FLAVOR_BASE", var_8_5))
end

local function var_0_6(arg_9_0, arg_9_1)
	local var_9_0 = var_0_0(arg_9_0)
	local var_9_1 = arg_9_0._watchTable[var_9_0]
	local var_9_2 = {}
	local var_9_3 = var_9_0 - 1
	local var_9_4 = var_9_0 + 1

	if var_9_3 < 1 then
		var_9_3 = #arg_9_0._watchTable
	end

	if var_9_4 > #arg_9_0._watchTable then
		var_9_4 = 1
	end

	table.insert(var_9_2, arg_9_0._watchTable[var_9_3].ref)
	table.insert(var_9_2, arg_9_0._watchTable[var_9_4].ref)
	table.insert(var_9_2, arg_9_0._watchTable[var_9_0].ref)

	if var_9_1.isUnlocked then
		var_9_1.isNew = Loot.HDJCADADF(arg_9_0._controllerIndex, var_9_1.lootID)
		var_9_1.isSelected = arg_9_0._equippedWatch == var_9_1.ref

		local var_9_5 = WATCH.GetPetWatchType(var_9_1.ref)

		if var_9_5 == "pet_turbo" or var_9_5 == "pet_turbo_alt" then
			var_9_1.flavorOverride = var_0_5(arg_9_0, var_9_5)
		end

		arg_9_0.LootDetails:SetupDetails(var_9_1)

		local var_9_6 = LOADOUT.GetFavoriteLoadoutIndex(arg_9_0._controllerIndex)

		LOADOUT.RequestWatchAndWeaponModels(arg_9_0._controllerIndex, var_9_6, var_9_2)
		WATCH.SetWatchModelIfLoaded(arg_9_0, arg_9_0._controllerIndex, arg_9_0.watchModel, var_9_1.ref)

		if var_9_1.ref ~= WATCH.WatchNoneValue and WATCH.IsPreviewEnabled(var_9_1.ref) then
			arg_9_0:AddButtonHelperTextToElement(arg_9_0.HelperBar, {
				side = "left",
				priority = 2,
				gamepad_only = true,
				button_ref = "button_r3",
				helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WATCH")
			})

			if LUI.IsLastInputKeyboardMouse(arg_9_0._controllerIndex) then
				arg_9_0.LootDetails.PromptPreview:SetAlpha(1)
			end
		else
			arg_9_0:RemoveButtonHelperTextFromElement(arg_9_0.HelperBar, "button_r3", "left")
			arg_9_0.LootDetails.PromptPreview:SetAlpha(0)
		end
	else
		arg_9_0.EquippedWidget:SetAlpha(0)
	end

	arg_9_0._selectedWatch = var_9_1.ref
end

local function var_0_7(arg_10_0)
	arg_10_0._equippedWatch = WATCH.GetEquippedWatch(arg_10_0._controllerIndex)

	arg_10_0.WatchGrid:RemoveFocusFromChild()
	arg_10_0.WatchGrid:SetNumChildren(#arg_10_0._watchTable)
	arg_10_0.WatchGrid:RefreshContent()
end

local function var_0_8(arg_11_0)
	return function(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = arg_12_1 + arg_12_2 * arg_11_0.WatchGrid:GetNumColumns()
		local var_12_1 = arg_11_0._watchTable[var_12_0 + 1]

		var_12_1.lootType = LOOT.itemTypes.WATCH

		local var_12_2 = arg_11_0._equippedWatch == var_12_1.ref
		local var_12_3 = arg_11_0._favoriteWatches[var_12_1.ref]

		arg_12_0:RefreshButton(arg_11_0, var_12_1, var_12_2, var_12_3)
	end
end

local function var_0_9(arg_13_0, arg_13_1)
	Engine.DHFCHIIJCA("loadout_showcase_watch")

	local var_13_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_13_1
	})

	var_13_0:SetLimits(-0.15, 0.15, -0.15, 0.15)
	var_13_0:SetSwayValues(4500, 0.03, 0.05)
	arg_13_0:addElement(var_13_0)
	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.GunTablePrimary,
		FrontEndScene.ClientWeapons.GunTableSecondary,
		FrontEndScene.ClientWeapons.Watch
	})

	arg_13_0.watchModel = WEAPON.GetWeaponModel(arg_13_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

	arg_13_0:addElement(arg_13_0.watchModel)
end

local function var_0_10(arg_14_0, arg_14_1, arg_14_2)
	assert(arg_14_0.MenuTitle)
	assert(arg_14_0.WatchGrid)
	assert(arg_14_0.LootDetails)
	assert(arg_14_0.FavoritesPrompt)
	arg_14_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT"))
	var_0_9(arg_14_0, arg_14_1)
	arg_14_0.LootDetails:InitializeDimensions(arg_14_0.LootDetails:GetCurrentAnchorsAndPositions())

	arg_14_0.FavoriteItem = FavoriteItem
	arg_14_0.EquipItem = var_0_4
	arg_14_0.PreviewItem = var_0_6
	arg_14_0.UpdateGrid = var_0_7
	arg_14_0._controllerIndex = arg_14_1
	arg_14_0._lootType = LOOT.itemTypes.WATCH
	arg_14_0._watchTable = {}
	arg_14_0._allWatchesTable = var_0_1(arg_14_0)
	arg_14_0._favoriteWatches = LOOT.GetFavoritesForType(LOOT.itemTypes.WATCH)
	arg_14_0._equippedWatch = WATCH.GetEquippedWatch(arg_14_1)
	arg_14_0._selectedWatch = arg_14_0._equippedWatch

	LOOT.SetupSortingBehavior(arg_14_0, arg_14_1)

	arg_14_0.raritySortingType = LOOT.raritySortingOptions.LOW_FIRST

	var_0_2(arg_14_0)
	arg_14_0.WatchGrid:SetRefreshChild(var_0_8(arg_14_0))
	arg_14_0.WatchGrid:SetSnapOnWrapEnabled(true)
	arg_14_0:UpdateGrid()
	var_0_3(arg_14_0)
	arg_14_0.bindButton:addEventHandler("button_right_stick", function(arg_15_0, arg_15_1)
		if arg_14_0._selectedWatch ~= WATCH.WatchNoneValue and WATCH.IsPreviewEnabled(arg_14_0._selectedWatch) then
			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_14_1, nil, {
				watchRef = arg_14_0._selectedWatch
			}, true)
			Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
		end
	end)
	arg_14_0:addEventHandler("restore_focus", function(arg_16_0, arg_16_1)
		var_0_2(arg_14_0, arg_14_1)
		arg_14_0:UpdateGrid()
	end)

	local var_14_0 = Engine.DCJHCAFIIA()
	local var_14_1 = LOOT.GetItemID(LOOT.itemTypes.WATCH, arg_14_0._equippedWatch)

	arg_14_0:addEventHandler("menu_close", function(arg_17_0, arg_17_1)
		local var_17_0 = LOOT.GetItemID(LOOT.itemTypes.WATCH, arg_14_0._equippedWatch)

		METRICS.IdentityUsageSendDLogEvent(arg_14_0, arg_14_1, var_14_0, LOOT.itemTypes.WATCH, var_14_1, var_17_0)
	end)

	local function var_14_2()
		local var_18_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_14_0.Vignette:SetScale(var_18_0)
	end

	arg_14_0:addAndCallEventHandler("onVideoChange", var_14_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_14_0, arg_14_1)
end

function WatchSelect(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "WatchSelect"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	var_19_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_19_1
	})
	var_19_0.HelperBar.id = "HelperBar"

	var_19_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_19_0.HelperBar:setPriority(10)
	var_19_0:addElement(var_19_0.HelperBar)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "Vignette"

	var_19_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_4:SetAlpha(0.5, 0)
	var_19_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_19_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1020, 0, 0)
	var_19_0:addElement(var_19_4)

	var_19_0.Vignette = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "Scrollbar"

	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 566, _1080p * 576, _1080p * 216, _1080p * 880)
	var_19_0:addElement(var_19_6)

	var_19_0.Scrollbar = var_19_6

	local var_19_7
	local var_19_8 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 12,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = true,
		springCoefficient = 400,
		controllerIndex = var_19_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WatchButton", {
				controllerIndex = var_19_1
			})
		end,
		refreshChild = function(arg_21_0, arg_21_1, arg_21_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 460,
		rowHeight = _1080p * 48,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_19_9 = LUI.UIGrid.new(var_19_8)

	var_19_9.id = "WatchGrid"

	var_19_9:setUseStencil(true)
	var_19_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 943)
	var_19_0:addElement(var_19_9)

	var_19_0.WatchGrid = var_19_9

	local var_19_10
	local var_19_11 = MenuBuilder.BuildRegisteredType("SortPrompt", {
		controllerIndex = var_19_1
	})

	var_19_11.id = "SortPrompt"

	var_19_11:SetAlpha(0, 0)
	var_19_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 777, _1080p * 907, _1080p * 399, _1080p * 423)
	var_19_0:addElement(var_19_11)

	var_19_0.SortPrompt = var_19_11

	local var_19_12
	local var_19_13 = MenuBuilder.BuildRegisteredType("FavoritesPrompt", {
		controllerIndex = var_19_1
	})

	var_19_13.id = "FavoritesPrompt"

	var_19_13:SetAlpha(0, 0)
	var_19_13.FavoritesPrompt:SetAlignment(LUI.Alignment.Right)
	var_19_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 777, _1080p * 907, _1080p * 399, _1080p * 423)
	var_19_0:addElement(var_19_13)

	var_19_0.FavoritesPrompt = var_19_13

	local var_19_14

	if CONDITIONS.InFrontendPublicMP(var_19_0) then
		local var_19_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_19_1
		})

		var_19_15.id = "MPPlayerDetails"

		var_19_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_19_0:addElement(var_19_15)

		var_19_0.MPPlayerDetails = var_19_15
	end

	local var_19_16
	local var_19_17 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_19_1
	})

	var_19_17.id = "MenuTitle"

	var_19_17.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT_CAPS"), 0)
	var_19_17.Line:SetLeft(0, 0)
	var_19_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_19_0:addElement(var_19_17)

	var_19_0.MenuTitle = var_19_17

	local var_19_18
	local var_19_19 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_19_1
	})

	var_19_19.id = "LobbyMembersFooter"

	var_19_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_19_0:addElement(var_19_19)

	var_19_0.LobbyMembersFooter = var_19_19

	local var_19_20
	local var_19_21 = MenuBuilder.BuildRegisteredType("LootDetails", {
		controllerIndex = var_19_1
	})

	var_19_21.id = "LootDetails"

	var_19_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1174, _1080p * 216, _1080p * 326)
	var_19_0:addElement(var_19_21)

	var_19_0.LootDetails = var_19_21

	local var_19_22 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_19_6,
		startCap = var_19_6.startCap,
		endCap = var_19_6.endCap,
		sliderArea = var_19_6.sliderArea,
		slider = var_19_6.sliderArea and var_19_6.sliderArea.slider,
		fixedSizeSlider = var_19_6.sliderArea and var_19_6.sliderArea.fixedSizeSlider
	})

	var_19_9:AddScrollbar(var_19_22)
	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_19_23 = LUI.UIBindButton.new()

	var_19_23.id = "selfBindButton"

	var_19_0:addElement(var_19_23)

	var_19_0.bindButton = var_19_23

	var_19_0.bindButton:addEventHandler("button_secondary", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_19_1
		end

		ACTIONS.LeaveMenu(var_19_0)
	end)
	var_0_10(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("WatchSelect", WatchSelect)
LockTable(_M)
