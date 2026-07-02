RANDOM = RANDOM or {}
RANDOM.lootID = 350020
RANDOM.favLootID = 350021
RANDOM.ref = "randomization"
RANDOM.favRef = "randomization_favorite"
RANDOM.watchWeapon = "iw8_acc_weapon_watch_2"
RANDOM.watchFace = "iw8_acc_attach_face_shadow"
RANDOM.icon = "ui_emblem_randomize"
RANDOM.iconFavorite = "ui_emblem_randomize_favorites"
RANDOM.iconFavoriteOperator = "ui_emblem_randomize_favorite_operator"

function RANDOM.GetItemData(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or {}

	local var_1_0 = RANDOM.lootID

	if arg_1_1.isFav and arg_1_1.itemType then
		var_1_0 = RANDOM.favLootID
	end

	local var_1_1 = StringTable.BJJBBCJGEJ(CSV.featureIDs.file, CSV.featureIDs.cols.index, var_1_0)
	local var_1_2 = CSV.ReadRow(CSV.featureIDs, var_1_1)

	var_1_2.lootID = var_1_0
	var_1_2.isUnlocked = LOOT.IsUnlockedWithID(arg_1_0, var_1_2.lootID)
	var_1_2.rarity = -1
	var_1_2.season, var_1_2.event, var_1_2.isPremium = LOOT.GetItemSeasonByID(LOOT.itemTypes.FEATURE, var_1_2.lootID)
	var_1_2.lootType = arg_1_1.itemType
	var_1_2.isRandom = var_1_0 == RANDOM.lootID
	var_1_2.isRandomFavorite = var_1_0 == RANDOM.favLootID

	if arg_1_1.itemType then
		var_1_2.desc = RANDOM.GetDesc(arg_1_1.itemType, arg_1_1.isFav)
	end

	if arg_1_1.itemType == LOOT.itemTypes.PLAYERCARD or arg_1_1.itemType == LOOT.itemTypes.EMBLEM or arg_1_1.itemType == LOOT.itemTypes.FRAME or arg_1_1.itemType == LOOT.itemTypes.TITLE then
		if var_1_0 == RANDOM.lootID then
			var_1_2.name = "CUSTOMIZE/RANDOMIZE_ALL"
		elseif var_1_0 == RANDOM.favLootID then
			var_1_2.name = "CUSTOMIZE/RANDOMIZE_FAVORITES"
		end
	end

	if arg_1_1.itemType == LOOT.itemTypes.OPERATOR then
		var_1_2.lootIndex = var_1_0
		var_1_2.transcript = var_1_2.desc
		var_1_2.lootImage = var_1_2.image
		var_1_2.imagePreview = var_1_2.image
		var_1_2.operatorPose = "chr_menu_male_idle_01_AR"
		var_1_2.factionRef = OPERATOR.RANDOM_FACTION
		var_1_2.displayOrder = 0
		var_1_2.gender = OPERATOR.Gender.MALE
	end

	if arg_1_1.itemType == LOOT.itemTypes.PLAYERCARD or arg_1_1.itemType == LOOT.itemTypes.FRAME or arg_1_1.itemType == LOOT.itemTypes.TITLE then
		var_1_2.image = arg_1_1.isFav and "ui_playercard_randomize_favorites" or "ui_playercard_randomize"

		if arg_1_1.itemType == LOOT.itemTypes.FRAME then
			var_1_2.description = Engine.CBBHFCGDIC(arg_1_1.isFav and "CUSTOMIZE/RANDOM_FRAME_FAVORITE" or "CUSTOMIZE/RANDOM_FRAME")
		elseif arg_1_1.itemType == LOOT.itemTypes.TITLE then
			var_1_2.description = Engine.CBBHFCGDIC(arg_1_1.isFav and "CUSTOMIZE/RANDOM_TITLE_FAVORITE" or "CUSTOMIZE/RANDOM_TITLE")
		else
			var_1_2.description = Engine.CBBHFCGDIC(arg_1_1.isFav and "CUSTOMIZE/RANDOM_CARD_FAVORITE" or "CUSTOMIZE/RANDOM_CARD")
		end
	elseif arg_1_1.itemType == LOOT.itemTypes.EMBLEM then
		var_1_2.image = arg_1_1.isFav and "ui_emblem_randomize_favorites" or "ui_emblem_randomize"
		var_1_2.description = Engine.CBBHFCGDIC(arg_1_1.isFav and "CUSTOMIZE/RANDOM_EMBLEM_FAVORITE" or "CUSTOMIZE/RANDOM_EMBLEM")
	elseif arg_1_1.itemType == LOOT.itemTypes.VEHICLE_CAMO and arg_1_1.vehicleRef then
		local var_1_3 = VEHICLE.GetDefaultCamo(arg_1_1.vehicleRef)

		var_1_2.showcaseImage = var_1_3.showcaseImage
		var_1_2.isUnlocked = var_1_3.isUnlocked
		var_1_2.vehicleRef = vehicleRef
		var_1_2.lootID = RANDOM.lootID
	end

	return var_1_2
end

function RANDOM.IsEnabled(arg_2_0, arg_2_1, arg_2_2)
	if not Dvar.IBEGCHEFE("TQRNTTMSL") then
		return false
	end

	return RANDOM.GetPlayerData(arg_2_0, arg_2_1, arg_2_2):get() == 1
end

function RANDOM.SetEnabled(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_2 then
		RANDOM.RollItem(arg_3_0, arg_3_1, arg_3_3)
	end

	arg_3_2 = arg_3_2 and 1 or 0

	RANDOM.GetPlayerData(arg_3_0, arg_3_1, arg_3_3):set(arg_3_2)
end

function RANDOM.GetIsRandomFavorite(arg_4_0, arg_4_1)
	return PlayerData.BFFBGAJGD(arg_4_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.randomFavoriteIndex:get() == arg_4_1
end

function RANDOM.SetFavoriteEnabled(arg_5_0, arg_5_1)
	arg_5_1 = arg_5_1 == RANDOM.favLootID and arg_5_1 or 0

	PlayerData.BFFBGAJGD(arg_5_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.randomFavoriteIndex:set(arg_5_1)

	return RANDOM.GetFavoriteEnabled(arg_5_0)
end

function RANDOM.GetFavoriteEnabled(arg_6_0)
	return PlayerData.BFFBGAJGD(arg_6_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.randomFavoriteIndex:get() == RANDOM.favLootID
end

function RANDOM.Toggle(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = RANDOM.IsEnabled(arg_7_0, arg_7_1, arg_7_2)

	RANDOM.SetEnabled(arg_7_0, arg_7_1, not var_7_0, arg_7_2)
end

function RANDOM.RollItem(arg_8_0, arg_8_1, arg_8_2)
	arg_8_2 = arg_8_2 or {}

	if arg_8_1 == LOOT.itemTypes.OPERATOR then
		assert(arg_8_2.operatorFaction)
		RANDOM.RollOperator(arg_8_0, arg_8_2)
	elseif arg_8_1 == LOOT.itemTypes.OPERATOR_SKIN or arg_8_1 == LOOT.itemTypes.OPERATOR_TAUNT or arg_8_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		assert(arg_8_2.operatorRef)
		RANDOM.RollOperatorLoot(arg_8_0, arg_8_1, arg_8_2)
	elseif arg_8_1 == LOOT.itemTypes.PLAYERCARD or arg_8_1 == LOOT.itemTypes.EMBLEM or arg_8_1 == LOOT.itemTypes.FRAME or arg_8_1 == LOOT.itemTypes.TITLE then
		RANDOM.RollPlayercardItem(arg_8_0, arg_8_1, arg_8_2)
	elseif arg_8_1 == LOOT.itemTypes.VEHICLE_CAMO then
		assert(arg_8_2.vehicleRef)
		RANDOM.RollVehicleCamo(arg_8_0, arg_8_2.vehicleRef)
	elseif arg_8_1 == LOOT.itemTypes.VEHICLE_HORN then
		assert(arg_8_2.vehicleRef)
		RANDOM.RollVehicleHorn(arg_8_0, arg_8_2.vehicleRef)
	elseif arg_8_1 == LOOT.itemTypes.VEHICLE_TRACK then
		assert(arg_8_2.vehicleRef)
		RANDOM.RollVehicleTrack(arg_8_0, arg_8_2.vehicleRef)
	elseif arg_8_1 == LOOT.itemTypes.WATCH then
		RANDOM.RollWatch(arg_8_0)
	else
		assert(false, "Random is not supported for item type " .. arg_8_1 .. ".")
	end

	Playercard.FCBJJBFBJ(arg_8_0)
end

function RANDOM.GetPlayerData(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_0)

	arg_9_2 = arg_9_2 or {}

	if arg_9_1 == LOOT.itemTypes.OPERATOR then
		assert(arg_9_2.operatorFaction)

		return PlayerData.BFFBGAJGD(arg_9_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.randomOperator[arg_9_2.operatorFaction]
	elseif arg_9_1 == LOOT.itemTypes.OPERATOR_SKIN then
		assert(arg_9_2.operatorRef)

		return PlayerData.BFFBGAJGD(arg_9_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorCustomization[arg_9_2.operatorRef].randomSkin
	elseif arg_9_1 == LOOT.itemTypes.OPERATOR_TAUNT then
		assert(arg_9_2.operatorRef)

		return PlayerData.BFFBGAJGD(arg_9_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorCustomization[arg_9_2.operatorRef].randomTaunt
	elseif arg_9_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		assert(arg_9_2.operatorRef)

		return PlayerData.BFFBGAJGD(arg_9_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorCustomization[arg_9_2.operatorRef].randomExecution
	elseif arg_9_1 == LOOT.itemTypes.PLAYERCARD then
		if arg_9_2.isFav then
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).randomFavoriteBackground
		else
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).randomBackground
		end
	elseif arg_9_1 == LOOT.itemTypes.EMBLEM then
		if arg_9_2.isFav then
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).randomFavoritePatch
		elseif arg_9_2.isClanEmblem then
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).clanEmblem
		else
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).randomPatch
		end
	elseif arg_9_1 == LOOT.itemTypes.VEHICLE_CAMO then
		assert(arg_9_2.vehicleRef)

		return PlayerData.BFFBGAJGD(arg_9_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.vehicleCustomization[arg_9_2.vehicleRef].randomCamo
	elseif arg_9_1 == LOOT.itemTypes.VEHICLE_HORN then
		assert(arg_9_2.vehicleRef)

		return PlayerData.BFFBGAJGD(arg_9_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.vehicleCustomization[arg_9_2.vehicleRef].randomHorn
	elseif arg_9_1 == LOOT.itemTypes.VEHICLE_TRACK then
		assert(arg_9_2.vehicleRef)

		return PlayerData.BFFBGAJGD(arg_9_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.vehicleCustomization[arg_9_2.vehicleRef].randomTrack
	elseif arg_9_1 == LOOT.itemTypes.WATCH then
		return PlayerData.BFFBGAJGD(arg_9_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.randomWatch
	elseif arg_9_1 == LOOT.itemTypes.FRAME then
		if arg_9_2.isFav then
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).randomFavoriteFrame
		else
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).randomFrame
		end
	elseif arg_9_1 == LOOT.itemTypes.TITLE then
		if arg_9_2.isFav then
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).randomFavoriteTitle
		else
			return PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.NonGame).randomTitle
		end
	else
		assert(false, "Random is not supported for item type " .. arg_9_1 .. ".")
	end
end

function RANDOM.GetOwnedItems(arg_10_0, arg_10_1, arg_10_2)
	arg_10_1 = arg_10_1 == LOOT.itemTypes.OPERATOR_TAUNT and LOOT.itemTypes.QUIP or arg_10_1

	if arg_10_1 == LOOT.itemTypes.EMBLEM then
		local var_10_0 = {
			items = {}
		}

		if arg_10_2 and arg_10_2.isFav then
			var_10_0.items = LOOT.GetFavoritesForType(LOOT.itemTypes.EMBLEM)
		else
			var_10_0.items = EmblemEditorUtils.GetAllEmblems(arg_10_0, {
				_shouldGetUnlockedOnly = true
			})
		end

		return var_10_0
	elseif arg_10_1 == LOOT.itemTypes.FRAME then
		local var_10_1 = {
			items = {}
		}

		if arg_10_2 and arg_10_2.isFav then
			var_10_1.items = LOOT.GetFavoriteForType(LOOT.itemType.FRAME)
		else
			var_10_1.items = CallingCardFramesUtils.GetAllFrames(arg_10_0, {
				_shouldGetUnlockedOnly = true
			})
		end

		return var_10_1
	elseif arg_10_1 == LOOT.itemTypes.TITLE then
		local var_10_2 = {
			items = {}
		}

		if arg_10_2 and arg_10_2.isFav then
			var_10_2.items = LOOT.GetFavoriteForType(LOOT.itemType.TITLE)
		else
			var_10_2.items = PlayerTitleUtils.GetAllPlayerTitles(arg_10_0, {
				_shouldGetUnlockedOnly = true
			})
		end

		return var_10_2
	elseif arg_10_1 == LOOT.itemTypes.PLAYERCARD then
		local var_10_3 = {
			items = {}
		}

		if arg_10_2 and arg_10_2.isFav then
			var_10_3.items = LOOT.GetFavoriteForType(LOOT.itemType.PLAYERCARD)
		else
			var_10_3.items = CallingCardUtils.GetAllPlayerCards(arg_10_0, {
				_shouldGetUnlockedOnly = true,
				unlockType = CallingCardUtils.Categories.CORE
			})
		end

		return var_10_3
	end

	local var_10_4 = tonumber(StringTable.DIFCHIGDFB(CSV.lootMaster.file, CSV.lootMaster.cols.typeValue, arg_10_1, CSV.lootMaster.cols.rangeStart))
	local var_10_5 = tonumber(StringTable.DIFCHIGDFB(CSV.lootMaster.file, CSV.lootMaster.cols.typeValue, arg_10_1, CSV.lootMaster.cols.rangeEnd))

	return Loot.CHFGBGCCC(arg_10_0, var_10_4, var_10_5, LOOT.typeNames[arg_10_1])
end

function RANDOM.GetOwnedItemsAsRefs(arg_11_0, arg_11_1)
	local var_11_0 = RANDOM.GetOwnedItems(arg_11_0, arg_11_1).items
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		local var_11_2 = LOOT.GetItemRef(arg_11_1, iter_11_1.ID)

		table.insert(var_11_1, var_11_2)
	end

	return var_11_1
end

function RANDOM.FilterOwnedCamosByVehicle(arg_12_0, arg_12_1)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0) do
		local var_12_1 = LOOT.GetItemRef(LOOT.itemTypes.VEHICLE_CAMO, iter_12_1.ID)

		if StringTable.DIFCHIGDFB(CSV.vehicleCamos.file, CSV.vehicleCamos.cols.ref, var_12_1, CSV.vehicleCamos.cols.vehicleRef) == arg_12_1 then
			table.insert(var_12_0, iter_12_1)
		end
	end

	return var_12_0
end

function RANDOM.RollPlayercardItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0
	local var_13_1 = ""

	if arg_13_1 == LOOT.itemTypes.EMBLEM then
		var_13_0 = CSV.emblems
		var_13_1 = "emblemIndex"
	elseif arg_13_1 == LOOT.itemTypes.PLAYERCARD then
		var_13_0 = CSV.callingCards
		var_13_1 = "backgroundIndex"
	elseif arg_13_1 == LOOT.itemTypes.FRAME then
		var_13_0 = CSV.callingCardFrames
		var_13_1 = "frameIndex"
	elseif arg_13_1 == LOOT.itemTypes.TITLE then
		var_13_0 = CSV.callingCardTitles
		var_13_1 = "titleIndex"
	end

	if not CSV and var_13_1 == "" then
		assert(false, "LootType is not a Playercard Item")
	end

	local var_13_2 = LUI.DataSourceInControllerModel.new("frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard." .. var_13_1)
	local var_13_3 = var_13_2:GetValue(arg_13_0)

	if not var_13_3 then
		assert(false, "Attempted to lookup for player card item rolling with no value in your player card data source.")

		return
	end

	local var_13_4 = StringTable.DIFCHIGDFB(var_13_0.file, var_13_0.cols.index, var_13_3, var_13_0.cols.ref)
	local var_13_5 = LOOT.GetItemID(arg_13_1, var_13_4)
	local var_13_6
	local var_13_7

	if arg_13_2 and arg_13_2.isFav then
		local var_13_8 = LOOT.GetFavoritesForType(arg_13_1, true)

		if #var_13_8 == 0 then
			return
		end

		local var_13_9 = math.random(1, #var_13_8)

		while #var_13_8 > 1 and var_13_8[var_13_9] == var_13_4 do
			var_13_9 = math.random(1, #var_13_8)
		end

		var_13_6 = var_13_8[var_13_9]

		if not var_13_6 then
			assert(false, "Attempted to lookup for player card item rolling with a nil item ref. Random isFav, newItemIndex is " .. var_13_9)

			return
		end
	else
		local var_13_10 = RANDOM.GetOwnedItems(arg_13_0, arg_13_1, arg_13_2).items
		local var_13_11 = math.random(1, #var_13_10)

		while #var_13_10 > 1 and var_13_10[var_13_11].ID == var_13_5 do
			var_13_11 = math.random(1, #var_13_10)
		end

		var_13_7 = var_13_10[var_13_11]

		if not var_13_7 then
			DebugPrint("RANDOM.RollPlayercardItem -> Randomization failed to find newItem with newItemIndex(" .. tostring(var_13_11) .. ")")

			return
		end

		local var_13_12 = var_13_7.ID or var_13_7.lootID

		if not var_13_12 then
			DebugPrint("RANDOM.RollPlayercardItem -> Randomization failed to find newItemId, attempted to use " .. tostring(var_13_7.ID) .. " or " .. tostring(var_13_7.lootID))

			return
		end

		var_13_6 = LOOT.GetItemRef(arg_13_1, var_13_12)

		if not var_13_6 then
			DebugPrint("RANDOM.RollPlayercardItem -> Randomization failed lookup for player card item rolling with a nil item ref. Loot id is " .. var_13_12 .. ".")

			return
		end
	end

	local var_13_13

	if var_13_6 == "" and var_13_7.ref then
		var_13_13 = StringTable.DIFCHIGDFB(var_13_0.file, var_13_0.cols.ref, var_13_7.ref, var_13_0.cols.index)
	else
		var_13_13 = StringTable.DIFCHIGDFB(var_13_0.file, var_13_0.cols.ref, var_13_6, var_13_0.cols.index)
	end

	if arg_13_1 == LOOT.itemTypes.EMBLEM then
		Playercard.DBBICFEAGH(arg_13_0, var_13_13)
	elseif arg_13_1 == LOOT.itemTypes.PLAYERCARD then
		Playercard.CGGBAHFGAF(arg_13_0, var_13_13)
	elseif arg_13_1 == LOOT.itemTypes.FRAME then
		Playercard.BCEECAFBBG(arg_13_0, var_13_13)
	elseif arg_13_1 == LOOT.itemTypes.TITLE then
		Playercard.DAIIIAHAHH(arg_13_0, var_13_13)
	end

	var_13_2:SetValue(arg_13_0, var_13_13)
end

function RANDOM.RollVehicleCamo(arg_14_0, arg_14_1)
	local var_14_0 = RANDOM.GetOwnedItems(arg_14_0, LOOT.vehicleItemTypes.CAMO).items
	local var_14_1 = VEHICLE.GetPlayerData(arg_14_0, arg_14_1)
	local var_14_2 = RANDOM.FilterOwnedCamosByVehicle(var_14_0, arg_14_1)

	if #var_14_2 == 0 then
		DebugPrint("Attempting to roll vehicle camos but you have none in your inventory. Did you dev unlock all items?")

		return
	end

	local var_14_3 = var_14_1.camo:get()
	local var_14_4 = math.random(1, #var_14_2)

	while #var_14_2 > 1 and var_14_2[var_14_4].ID == var_14_3 do
		var_14_4 = math.random(1, #var_14_2)
	end

	local var_14_5 = var_14_2[var_14_4]

	var_14_1.camo:set(var_14_5.ID)
end

function RANDOM.RollVehicleHorn(arg_15_0, arg_15_1)
	local var_15_0 = RANDOM.GetOwnedItems(arg_15_0, LOOT.vehicleItemTypes.HORN).items
	local var_15_1 = VEHICLE.GetPlayerData(arg_15_0, arg_15_1)

	if #var_15_0 == 0 then
		DebugPrint("Attempting to roll vehicle horns but you have none in your inventory. Did you dev unlock all items?")

		return
	end

	local var_15_2 = var_15_1.horn:get()
	local var_15_3 = VEHICLE.GetHornData(var_15_2).lootID
	local var_15_4 = math.random(1, #var_15_0)

	while #var_15_0 > 1 and var_15_0[var_15_4].ID == var_15_3 do
		var_15_4 = math.random(1, #var_15_0)
	end

	local var_15_5 = var_15_0[var_15_4]
	local var_15_6 = VEHICLE.GetItemIndexByLootID(LOOT.vehicleItemTypes.HORN, var_15_5.ID)

	var_15_1.horn:set(var_15_6)
end

function RANDOM.RollVehicleTrack(arg_16_0, arg_16_1)
	local var_16_0 = RANDOM.GetOwnedItems(arg_16_0, LOOT.vehicleItemTypes.TRACK).items
	local var_16_1 = VEHICLE.GetPlayerData(arg_16_0, arg_16_1)

	if #var_16_0 == 0 then
		DebugPrint("Attempting to roll vehicle tracks but you have none in your inventory. Did you dev unlock all items?")

		return
	end

	local var_16_2 = {}

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		local var_16_3 = math.random(1, #var_16_2 + 1)

		table.insert(var_16_2, var_16_3, iter_16_1)
	end

	local var_16_4 = math.min(#var_16_2, VEHICLE.MAX_RANDOM_SLOTS_COUNT)

	for iter_16_2 = 1, var_16_4 do
		local var_16_5 = VEHICLE.GetItemIndexByLootID(LOOT.vehicleItemTypes.TRACK, var_16_2[iter_16_2].ID)

		var_16_1.tracks[iter_16_2]:set(var_16_5)
	end
end

function RANDOM.RollVehicleItems(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 == LOOT.vehicleItemTypes.CAMO then
		RANDOM.RollVehicleCamo(arg_17_0, arg_17_2)
	elseif arg_17_1 == LOOT.vehicleItemTypes.HORN then
		RANDOM.RollVehicleHorn(arg_17_0, arg_17_2)
	elseif arg_17_1 == LOOT.vehicleItemTypes.TRACK then
		RANDOM.RollVehicleTrack(arg_17_0, arg_17_2)
	end
end

function RANDOM.RollWatch(arg_18_0)
	local var_18_0 = {}
	local var_18_1 = StringTable.BFHCAIIDA(CSV.accessoryIds.file)

	for iter_18_0 = 0, var_18_1 - 1 do
		local var_18_2 = CSV.ReadRow(CSV.accessoryIds, iter_18_0)

		if var_18_2 and LOOT.CheckItemIsOwned(arg_18_0, LOOT.itemTypes.WATCH, var_18_2.ref) then
			table.insert(var_18_0, {
				ID = var_18_2.id
			})
		end
	end

	if #var_18_0 == 0 then
		DebugPrint("Attempting to roll watches but you have none in your inventory. Did you dev unlock all items?")

		return
	end

	local var_18_3 = WATCH.GetEquippedWatch(arg_18_0)
	local var_18_4 = LOOT.GetItemID(LOOT.itemTypes.WATCH, var_18_3)
	local var_18_5 = math.random(1, #var_18_0)

	while #var_18_0 > 1 and var_18_0[var_18_5].ID == var_18_4 do
		var_18_5 = math.random(1, #var_18_0)
	end

	local var_18_6 = var_18_0[var_18_5]

	WATCH.SetEquippedWatch(arg_18_0, LOOT.GetItemRef(LOOT.itemTypes.WATCH, var_18_6.ID), var_18_3, true)
end

function RANDOM.FilterByOperatorRef(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in ipairs(arg_19_3) do
		local var_19_1 = LOOT.GetItemRef(arg_19_1, iter_19_1.ID)
		local var_19_2

		if arg_19_1 == LOOT.itemTypes.OPERATOR_SKIN then
			var_19_2 = OPERATOR.GetSkinOwnerRef(var_19_1)
		elseif arg_19_1 == LOOT.itemTypes.OPERATOR_TAUNT then
			var_19_2 = OPERATOR.GetQuipOwnerRef(var_19_1)
		elseif arg_19_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
			var_19_2 = OPERATOR.GetExecutionOwnerRef(var_19_1)
		end

		local var_19_3 = OPERATOR.IsT9Operator(arg_19_2)
		local var_19_4 = OPERATOR.IsS4Operator(arg_19_2)
		local var_19_5 = var_19_2 == arg_19_2
		local var_19_6 = var_19_3 and var_19_2 == OPERATOR.T9ExclusiveExecutionRef
		local var_19_7 = var_19_4 and var_19_2 == OPERATOR.S4ExclusiveExecutionRef
		local var_19_8 = not var_19_3 and not var_19_4 and var_19_2 == OPERATOR.MWExclusiveExecutionRef

		if var_19_5 or var_19_6 or var_19_8 or var_19_7 then
			table.insert(var_19_0, iter_19_1)
		end
	end

	return var_19_0
end

function RANDOM.RollOperatorLoot(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = RANDOM.GetOwnedItems(arg_20_0, arg_20_1).items
	local var_20_1 = RANDOM.FilterByOperatorRef(arg_20_0, arg_20_1, arg_20_2.operatorRef, var_20_0)

	if #var_20_1 == 0 then
		return
	end

	local var_20_2 = OPERATOR.GetEquippedItemIndexForLootType(arg_20_0, arg_20_2.operatorRef, arg_20_1)
	local var_20_3 = math.random(1, #var_20_1)

	while #var_20_1 > 1 and var_20_1[var_20_3] == var_20_2 do
		var_20_3 = math.random(1, #var_20_1)
	end

	local var_20_4 = var_20_1[var_20_3]
	local var_20_5 = OPERATOR.GetLootIndexFromLootID(var_20_4.ID, arg_20_1)

	OPERATOR.SetEquippedItemForLootType(arg_20_0, arg_20_2.operatorRef, arg_20_1, var_20_5)
end

function RANDOM.FilterBySuperfaction(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_2) do
		if OPERATOR.IsMWOperator(iter_21_1) then
			local var_21_1 = OPERATOR.GetOperatorSuperFactionRef(iter_21_1)

			if tonumber(var_21_1) == tonumber(arg_21_1) then
				table.insert(var_21_0, iter_21_1)
			end
		end
	end

	return var_21_0
end

function RANDOM.RollOperator(arg_22_0, arg_22_1)
	local var_22_0 = RANDOM.GetFavoriteEnabled(arg_22_0)
	local var_22_1 = {}

	if var_22_0 then
		local var_22_2 = LOOT.GetFavoritesForType(LOOT.itemTypes.OPERATOR)

		for iter_22_0, iter_22_1 in pairs(var_22_2) do
			if iter_22_0 ~= "count" and OPERATOR.IsUnlocked(arg_22_0, iter_22_0) then
				table.insert(var_22_1, iter_22_0)
			end
		end
	else
		var_22_1 = RANDOM.GetOwnedItemsAsRefs(arg_22_0, LOOT.itemTypes.OPERATOR)
	end

	local var_22_3 = {}

	for iter_22_2, iter_22_3 in ipairs(var_22_1) do
		var_22_3[iter_22_3] = true
	end

	if IsSystemLink() or IsPrivateMatch() or CONDITIONS.IsMagmaGameMode() and not var_22_0 then
		local var_22_4 = StringTable.BFHCAIIDA(CSV.operators.file)

		for iter_22_4 = 0, var_22_4 - 1 do
			local var_22_5 = CSV.ReadRow(CSV.operators, iter_22_4)
			local var_22_6 = OPERATOR.IsOperatorAvailableForSelection(arg_22_0, var_22_5)

			if var_22_5 and var_22_6 and not var_22_3[var_22_5.ref] and OPERATOR.IsUnlocked(arg_22_0, var_22_5.ref) then
				table.insert(var_22_1, var_22_5.ref)

				var_22_3[var_22_5.ref] = true
			end
		end
	end

	local var_22_7 = CONDITIONS.IsWZWipOperatorFlowEnabled() and var_22_1 or RANDOM.FilterBySuperfaction(arg_22_0, arg_22_1.operatorFaction, var_22_1)

	if #var_22_7 == 0 then
		return
	end

	local var_22_8 = PlayerData.BFFBGAJGD(arg_22_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_22_9 = var_22_8.operators[tonumber(arg_22_1.operatorFaction)]:get()
	local var_22_10 = math.random(1, #var_22_7)

	while #var_22_7 > 1 and var_22_7[var_22_10] == var_22_9 do
		var_22_10 = math.random(1, #var_22_7)
	end

	local var_22_11 = var_22_7[var_22_10]

	var_22_8.operators[tonumber(arg_22_1.operatorFaction)]:set(var_22_11)
end

function RANDOM.RollForAll()
	for iter_23_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_23_0) then
			RANDOM.RollItems(iter_23_0)
		end
	end
end

function RANDOM.GetDesc(arg_24_0, arg_24_1)
	if arg_24_0 == LOOT.itemTypes.OPERATOR_SKIN then
		return "CUSTOMIZE/RANDOM_SKIN"
	elseif arg_24_0 == LOOT.itemTypes.OPERATOR_TAUNT then
		return "CUSTOMIZE/RANDOM_QUIPS"
	elseif arg_24_0 == LOOT.itemTypes.OPERATOR_EXECUTION then
		return "CUSTOMIZE/RANDOM_EXECUTIONS"
	elseif arg_24_0 == LOOT.itemTypes.PLAYERCARD then
		return arg_24_1 and "CUSTOMIZE/RANDOM_CARD_FAVORITE" or "LUA_MENU_MP/RANDOM_DESC_CALLING_CARDS"
	elseif arg_24_0 == LOOT.itemTypes.EMBLEM then
		return arg_24_1 and "CUSTOMIZE/RANDOM_EMBLEM_FAVORITE" or "CUSTOMIZE/RANDOM_EMBLEM"
	end
end

function RANDOM.RollItems(arg_25_0)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(OPERATOR.SuperFaction) do
		var_25_0.operatorFaction = iter_25_1
		var_25_0.operatorRef = OPERATOR.GetEquippedOperatorRef(arg_25_0, iter_25_1)

		if RANDOM.IsEnabled(arg_25_0, LOOT.itemTypes.OPERATOR, var_25_0) then
			RANDOM.RollOperator(arg_25_0, var_25_0)
		end

		for iter_25_2, iter_25_3 in pairs(LOOT.OperatorLootTypes) do
			if RANDOM.IsEnabled(arg_25_0, iter_25_3, var_25_0) then
				RANDOM.RollOperatorLoot(arg_25_0, iter_25_3, var_25_0)
			end
		end
	end

	for iter_25_4, iter_25_5 in pairs(LOOT.playercardItemTypes) do
		if RANDOM.IsEnabled(arg_25_0, iter_25_5) then
			RANDOM.RollPlayercardItem(arg_25_0, iter_25_5)
		elseif RANDOM.IsEnabled(arg_25_0, iter_25_5, {
			isFav = true
		}) then
			RANDOM.RollPlayercardItem(arg_25_0, iter_25_5, {
				isFav = true
			})
		end
	end

	local var_25_1 = StringTable.BFHCAIIDA(CSV.vehicleCustomization.file)

	for iter_25_6 = 1, var_25_1 do
		if tonumber(StringTable.CBGJCDIHCE(CSV.vehicleCustomization.file, iter_25_6 - 1, CSV.vehicleCustomization.cols.hideInUI)) == 0 then
			var_25_0.vehicleRef = StringTable.CBGJCDIHCE(CSV.vehicleCustomization.file, iter_25_6 - 1, CSV.vehicleCustomization.cols.ref)

			for iter_25_7, iter_25_8 in pairs(LOOT.vehicleItemTypes) do
				if RANDOM.IsEnabled(arg_25_0, iter_25_8, var_25_0) then
					RANDOM.RollVehicleItems(arg_25_0, iter_25_8, var_25_0.vehicleRef)
				end
			end
		end
	end

	if RANDOM.IsEnabled(arg_25_0, LOOT.itemTypes.WATCH) then
		RANDOM.RollWatch(arg_25_0)
	end

	Playercard.FCBJJBFBJ(arg_25_0)
end
