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

	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		table.insert(arg_3_0._watchTable, #arg_3_0._watchTable, RANDOM.GetItemData(arg_3_0._controllerIndex))
	end

	table.sort(arg_3_0._watchTable, function(arg_4_0, arg_4_1)
		if arg_4_0.ref ~= WATCH.WatchNoneValue and arg_4_1.ref == WATCH.WatchNoneValue then
			return false
		elseif arg_4_0.ref == WATCH.WatchNoneValue and not arg_4_1.ref == WATCH.WatchNoneValue then
			return true
		end

		if arg_4_0.isRandom or arg_4_1.isRandom then
			return arg_4_0.isRandom and not arg_4_1.isRandom
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

local function var_0_3(arg_5_0, arg_5_1)
	if RANDOM.IsEnabled(arg_5_0._controllerIndex, LOOT.itemTypes.WATCH) then
		return arg_5_1.isRandom
	else
		return arg_5_0._equippedWatch == arg_5_1.ref
	end
end

local function var_0_4(arg_6_0)
	local var_6_0 = (function()
		for iter_7_0, iter_7_1 in ipairs(arg_6_0._watchTable) do
			if var_0_3(arg_6_0, iter_7_1) then
				return iter_7_0 - 1
			end
		end
	end)() or 0

	arg_6_0.WatchGrid:SetFocusedPosition({
		x = 0,
		y = var_6_0
	}, true)
end

local function var_0_5(arg_8_0)
	local var_8_0 = var_0_0(arg_8_0)
	local var_8_1 = arg_8_0._watchTable[var_8_0]

	if var_0_3(arg_8_0, var_8_1) then
		var_8_1 = arg_8_0._watchTable[1]
	end

	if var_8_1.isRandom then
		RANDOM.Toggle(arg_8_0._controllerIndex, LOOT.itemTypes.WATCH)
	else
		RANDOM.SetEnabled(arg_8_0._controllerIndex, LOOT.itemTypes.WATCH, false)
		WATCH.SetEquippedWatch(arg_8_0._controllerIndex, var_8_1.ref, arg_8_0._equippedWatch)
	end

	arg_8_0:UpdateGrid()
end

local function var_0_6(arg_9_0, arg_9_1)
	local var_9_0 = PlayerData.BFFBGAJGD(arg_9_0._controllerIndex, CoD.StatsGroup.Common)
	local var_9_1

	if arg_9_1 == "pet_turbo" then
		var_9_1 = var_9_0.petWatchDataTurbo
	else
		var_9_1 = var_9_0.petWatchDataTurboAlt
	end

	local var_9_2 = var_9_1.phase:get()
	local var_9_3
	local var_9_4
	local var_9_5

	if var_9_2 == 2 then
		var_9_3 = "MENU/CHALLENGE_BABY"
		var_9_5 = "CHARMS/COS_350"
	elseif var_9_2 == 3 then
		var_9_3 = "MENU/CHALLENGE_CHILD"
		var_9_5 = "CHARMS/COS_351"
	elseif var_9_2 == 4 then
		var_9_3 = "MENU/CHALLENGE_TEENA"
		var_9_5 = "CHARMS/COS_352"
	elseif var_9_2 == 5 then
		var_9_3 = "MENU/CHALLENGE_TEENB"
		var_9_5 = "CHARMS/COS_353"
	elseif var_9_2 == 6 then
		var_9_3 = "MENU/CHALLENGE_SKUNK"
		var_9_5 = "CHARMS/COS_340"
	elseif var_9_2 == 7 then
		var_9_3 = "MENU/CHALLENGE_BEAR"
		var_9_5 = "CHARMS/COS_341"
	elseif var_9_2 == 8 then
		var_9_3 = "MENU/CHALLENGE_MANTIS"
		var_9_5 = "CHARMS/COS_342"
	elseif var_9_2 == 9 then
		var_9_3 = "MENU/CHALLENGE_TREX"
		var_9_5 = "CHARMS/COS_343"
	elseif var_9_2 == 10 then
		var_9_3 = "MENU/CHALLENGE_OCTOPUS"
		var_9_5 = "CHARMS/COS_344"
	elseif var_9_2 == 11 then
		var_9_3 = "MENU/CHALLENGE_FOX"
		var_9_5 = "CHARMS/COS_345"
	elseif var_9_2 == 12 then
		var_9_3 = "MENU/CHALLENGE_SECRET1"
		var_9_5 = "CHARMS/COS_346"
	elseif var_9_2 == 13 then
		var_9_3 = "MENU/CHALLENGE_SECRET2"
		var_9_5 = "CHARMS/COS_347"
	elseif var_9_2 == 14 then
		var_9_3 = "MENU/CHALLENGE_SECRETFINAL"
		var_9_5 = "CHARMS/COS_348"
	elseif var_9_2 == 15 then
		var_9_3 = "STORE_FLAVOR/TURBO_PET_FLAVOR_DEAD"
		var_9_5 = "GAME/DEAD"
	else
		var_9_3 = "MENU/CHALLENGE_EGG"
		var_9_5 = "CHARMS/COS_349"
	end

	local var_9_6 = Engine.CBBHFCGDIC("LUA_MENU/X_COLON_Y", var_9_5, var_9_3)

	return (Engine.CBBHFCGDIC("LUA_MENU/N_NEWLINE_M", "STORE_FLAVOR/TURBO_PET_FLAVOR_BASE", var_9_6))
end

local var_0_7

local function var_0_8(arg_10_0, arg_10_1)
	local var_10_0 = PlayerData.BFFBGAJGD(arg_10_1, CoD.StatsGroup.Common)
	local var_10_1

	if var_0_7 == "pet_turbo" then
		var_10_1 = var_10_0.petWatchDataTurbo
	else
		var_10_1 = var_10_0.petWatchDataTurboAlt
	end

	if var_10_1.apachePoints:get() ~= 0 then
		var_10_1.apachePoints:set(0)
		Engine.BJDBIAGIDA("ui_watch_pet_sad_adult_ae")
		DebugPrint("TURBO PET WATCH - HAX OFF!!!!!!!!!! ")
	else
		var_10_1.apachePoints:set(1)
		Engine.BJDBIAGIDA("ui_watch_pet_happy_adult_ae")
		DebugPrint("TURBO PET WATCH - HAX ON!!!!!!!!!! ")
	end

	ACTIONS.UploadStats(nil, arg_10_1)
end

local function var_0_9(arg_11_0, arg_11_1)
	local var_11_0 = var_0_0(arg_11_0)
	local var_11_1 = arg_11_0._watchTable[var_11_0]
	local var_11_2 = {}
	local var_11_3 = var_11_0 - 1
	local var_11_4 = var_11_0 + 1

	if var_11_3 < 1 then
		var_11_3 = #arg_11_0._watchTable
	end

	if var_11_4 > #arg_11_0._watchTable then
		var_11_4 = 1
	end

	table.insert(var_11_2, arg_11_0._watchTable[var_11_3].ref)
	table.insert(var_11_2, arg_11_0._watchTable[var_11_4].ref)
	table.insert(var_11_2, arg_11_0._watchTable[var_11_0].ref)

	if var_11_1.isUnlocked then
		var_11_1.isNew = Loot.HDJCADADF(arg_11_0._controllerIndex, var_11_1.lootID) and not var_11_1.isRandom
		var_11_1.isSelected = var_0_3(arg_11_0, var_11_1)

		local var_11_5 = WATCH.GetPetWatchType(var_11_1.ref)

		if var_11_5 == "pet_turbo" or var_11_5 == "pet_turbo_alt" then
			var_11_1.flavorOverride = var_0_6(arg_11_0, var_11_5)

			if not arg_11_0._turboWatchCheat then
				if Engine.JDFDCGCIJ(arg_11_0._controllerIndex) then
					local var_11_6 = {
						interval = 3000,
						closeOnSuccess = false,
						buttonTable = {
							"up",
							"up",
							"down",
							"down",
							"left",
							"right",
							"left",
							"right",
							"primary",
							"primary"
						},
						callback = var_0_8
					}

					arg_11_0._turboWatchCheatKB = LUI.UIButtonCombination.new(var_11_6)

					arg_11_0:addElement(arg_11_0._turboWatchCheatKB)
				end

				local var_11_7 = {
					interval = 3000,
					closeOnSuccess = false,
					buttonTable = {
						"up",
						"up",
						"down",
						"down",
						"left",
						"right",
						"left",
						"right",
						"left_trigger",
						"right_trigger",
						"start"
					},
					callback = var_0_8
				}

				arg_11_0._turboWatchCheat = LUI.UIButtonCombination.new(var_11_7)
				var_0_7 = var_11_5

				arg_11_0:addElement(arg_11_0._turboWatchCheat)
			end
		end

		arg_11_0.LootDetails:SetupDetails(var_11_1)

		local var_11_8 = LOADOUT.GetFavoriteLoadoutIndex(arg_11_0._controllerIndex)

		LOADOUT.RequestWatchAndWeaponModels(arg_11_0._controllerIndex, var_11_8, var_11_2)
		WATCH.SetWatchModelIfLoaded(arg_11_0, arg_11_0._controllerIndex, arg_11_0.watchModel, var_11_1.ref)

		if var_11_1.ref ~= WATCH.WatchNoneValue and not var_11_1.isRandom and WATCH.IsPreviewEnabled(var_11_1.ref) then
			arg_11_0:AddButtonHelperTextToElement(arg_11_0.HelperBar, {
				side = "left",
				priority = 2,
				gamepad_only = true,
				button_ref = "button_r3",
				helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WATCH")
			})

			if LUI.IsLastInputKeyboardMouse(arg_11_0._controllerIndex) then
				arg_11_0.LootDetails.PromptPreview:SetAlpha(1)
			end
		else
			arg_11_0:RemoveButtonHelperTextFromElement(arg_11_0.HelperBar, "button_r3", "left")
			arg_11_0.LootDetails.PromptPreview:SetAlpha(0)
		end
	end

	arg_11_0._selectedWatch = var_11_1.ref
end

local function var_0_10(arg_12_0)
	arg_12_0._equippedWatch = WATCH.GetEquippedWatch(arg_12_0._controllerIndex)

	arg_12_0.WatchGrid:RemoveFocusFromChild()
	arg_12_0.WatchGrid:SetNumChildren(#arg_12_0._watchTable)
	arg_12_0.WatchGrid:RefreshContent()
end

local function var_0_11(arg_13_0)
	return function(arg_14_0, arg_14_1, arg_14_2)
		local var_14_0 = arg_14_1 + arg_14_2 * arg_13_0.WatchGrid:GetNumColumns()
		local var_14_1 = arg_13_0._watchTable[var_14_0 + 1]

		var_14_1.lootType = LOOT.itemTypes.WATCH

		local var_14_2 = var_0_3(arg_13_0, var_14_1)
		local var_14_3 = arg_13_0._favoriteWatches[var_14_1.ref]

		arg_14_0:RefreshButton(arg_13_0, var_14_1, var_14_2, var_14_3)
	end
end

local function var_0_12(arg_15_0, arg_15_1)
	Engine.DHFCHIIJCA("loadout_showcase_watch")

	local var_15_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_15_1
	})

	var_15_0:SetLimits(-0.15, 0.15, -0.15, 0.15)
	var_15_0:SetSwayValues(4500, 0.03, 0.05)
	arg_15_0:addElement(var_15_0)
	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.GunTablePrimary,
		FrontEndScene.ClientWeapons.GunTableSecondary,
		FrontEndScene.ClientWeapons.Watch
	})

	arg_15_0.watchModel = WEAPON.GetWeaponModel(arg_15_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

	arg_15_0:addElement(arg_15_0.watchModel)
end

local function var_0_13(arg_16_0, arg_16_1, arg_16_2)
	assert(arg_16_0.MenuTitle)
	assert(arg_16_0.WatchGrid)
	assert(arg_16_0.LootDetails)
	assert(arg_16_0.FavoritesPrompt)
	arg_16_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT"))
	var_0_12(arg_16_0, arg_16_1)
	arg_16_0.LootDetails:SetupDetails({
		name = ""
	})
	arg_16_0.LootDetails:InitializeDimensions(arg_16_0.LootDetails:GetCurrentAnchorsAndPositions())

	arg_16_0.FavoriteItem = FavoriteItem
	arg_16_0.EquipItem = var_0_5
	arg_16_0.PreviewItem = var_0_9
	arg_16_0.UpdateGrid = var_0_10
	arg_16_0._controllerIndex = arg_16_1
	arg_16_0._lootType = LOOT.itemTypes.WATCH
	arg_16_0._watchTable = {}
	arg_16_0._allWatchesTable = var_0_1(arg_16_0)
	arg_16_0._favoriteWatches = LOOT.GetFavoritesForType(LOOT.itemTypes.WATCH)
	arg_16_0._equippedWatch = WATCH.GetEquippedWatch(arg_16_1)
	arg_16_0._selectedWatch = arg_16_0._equippedWatch

	LOOT.SetupSortingBehavior(arg_16_0, arg_16_1)

	arg_16_0.raritySortingType = LOOT.raritySortingOptions.LOW_FIRST

	var_0_2(arg_16_0)
	arg_16_0.WatchGrid:SetRefreshChild(var_0_11(arg_16_0))
	arg_16_0.WatchGrid:SetSnapOnWrapEnabled(true)
	arg_16_0:UpdateGrid()
	var_0_4(arg_16_0)
	arg_16_0.bindButton:addEventHandler("button_right_stick", function(arg_17_0, arg_17_1)
		if arg_16_0._selectedWatch ~= WATCH.WatchNoneValue and WATCH.IsPreviewEnabled(arg_16_0._selectedWatch) and arg_16_0._selectedWatch ~= RANDOM.ref then
			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_16_1, nil, {
				watchRef = arg_16_0._selectedWatch
			}, true)
			Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
		end
	end)
	arg_16_0:addEventHandler("restore_focus", function(arg_18_0, arg_18_1)
		var_0_2(arg_16_0, arg_16_1)
		arg_16_0:UpdateGrid()
	end)

	local var_16_0 = Engine.DCJHCAFIIA()
	local var_16_1 = LOOT.GetItemID(LOOT.itemTypes.WATCH, arg_16_0._equippedWatch)

	arg_16_0:addEventHandler("menu_close", function(arg_19_0, arg_19_1)
		local var_19_0 = LOOT.GetItemID(LOOT.itemTypes.WATCH, arg_16_0._equippedWatch)

		var_19_0 = RANDOM.IsEnabled(arg_16_1, LOOT.itemTypes.WATCH) and RANDOM.lootID or var_19_0

		METRICS.LootUsageSendDLogEvent(arg_16_0, {
			controllerIndex = arg_16_1,
			startTime = var_16_0,
			previousItemIDs = var_16_1,
			newItemIDs = var_19_0
		})
	end)

	local function var_16_2()
		local var_20_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_16_0.Vignette:SetScale(var_20_0)
	end

	arg_16_0:addAndCallEventHandler("onVideoChange", var_16_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_16_0, arg_16_1)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_16_0)
	end
end

function WatchSelect(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIElement.new()

	var_21_0.id = "WatchSelect"

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	var_21_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_21_1
	})
	var_21_0.HelperBar.id = "HelperBar"

	var_21_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_21_0.HelperBar:setPriority(10)
	var_21_0:addElement(var_21_0.HelperBar)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_21_1
	})

	var_21_4.id = "Vignette"

	var_21_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_21_0:addElement(var_21_4)

	var_21_0.Vignette = var_21_4

	local var_21_5
	local var_21_6 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_21_1
	})

	var_21_6.id = "Scrollbar"

	var_21_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 566, _1080p * 576, _1080p * 216, _1080p * 880)
	var_21_0:addElement(var_21_6)

	var_21_0.Scrollbar = var_21_6

	local var_21_7
	local var_21_8 = {
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
		controllerIndex = var_21_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WatchButton", {
				controllerIndex = var_21_1
			})
		end,
		refreshChild = function(arg_23_0, arg_23_1, arg_23_2)
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
	local var_21_9 = LUI.UIGrid.new(var_21_8)

	var_21_9.id = "WatchGrid"

	var_21_9:setUseStencil(true)
	var_21_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 943)
	var_21_0:addElement(var_21_9)

	var_21_0.WatchGrid = var_21_9

	local var_21_10
	local var_21_11 = MenuBuilder.BuildRegisteredType("SortPrompt", {
		controllerIndex = var_21_1
	})

	var_21_11.id = "SortPrompt"

	var_21_11:SetAlpha(0, 0)
	var_21_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 777, _1080p * 907, _1080p * 399, _1080p * 423)
	var_21_0:addElement(var_21_11)

	var_21_0.SortPrompt = var_21_11

	local var_21_12
	local var_21_13 = MenuBuilder.BuildRegisteredType("FavoritesPrompt", {
		controllerIndex = var_21_1
	})

	var_21_13.id = "FavoritesPrompt"

	var_21_13:SetAlpha(0, 0)
	var_21_13.FavoritesPrompt:SetAlignment(LUI.Alignment.Right)
	var_21_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 777, _1080p * 907, _1080p * 399, _1080p * 423)
	var_21_0:addElement(var_21_13)

	var_21_0.FavoritesPrompt = var_21_13

	local var_21_14

	if CONDITIONS.InFrontendPublicMP() then
		local var_21_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_21_1
		})

		var_21_15.id = "MPPlayerDetails"

		var_21_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_21_0:addElement(var_21_15)

		var_21_0.MPPlayerDetails = var_21_15
	end

	local var_21_16
	local var_21_17 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_21_1
	})

	var_21_17.id = "MenuTitle"

	var_21_17.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT_CAPS"), 0)
	var_21_17.Line:SetLeft(0, 0)
	var_21_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_21_0:addElement(var_21_17)

	var_21_0.MenuTitle = var_21_17

	local var_21_18
	local var_21_19 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_21_1
	})

	var_21_19.id = "LobbyMembersFooter"

	var_21_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_21_0:addElement(var_21_19)

	var_21_0.LobbyMembersFooter = var_21_19

	local var_21_20
	local var_21_21 = MenuBuilder.BuildRegisteredType("LootDetails", {
		controllerIndex = var_21_1
	})

	var_21_21.id = "LootDetails"

	var_21_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1174, _1080p * 216, _1080p * 242)
	var_21_0:addElement(var_21_21)

	var_21_0.LootDetails = var_21_21

	local var_21_22 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_21_6,
		startCap = var_21_6.startCap,
		endCap = var_21_6.endCap,
		sliderArea = var_21_6.sliderArea,
		slider = var_21_6.sliderArea and var_21_6.sliderArea.slider,
		fixedSizeSlider = var_21_6.sliderArea and var_21_6.sliderArea.fixedSizeSlider
	})

	var_21_9:AddScrollbar(var_21_22)
	var_21_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_21_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_21_23 = LUI.UIBindButton.new()

	var_21_23.id = "selfBindButton"

	var_21_0:addElement(var_21_23)

	var_21_0.bindButton = var_21_23

	var_21_0.bindButton:addEventHandler("button_secondary", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_21_1
		end

		ACTIONS.LeaveMenu(var_21_0)
	end)
	var_0_13(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("WatchSelect", WatchSelect)
LockTable(_M)
