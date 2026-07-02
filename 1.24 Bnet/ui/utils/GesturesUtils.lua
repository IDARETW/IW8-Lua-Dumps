GESTURES = GESTURES or {}
GESTURES.gimmeSlot = 0
GESTURES.gimmeSlotSecondary = 1
GESTURES.numRadialSlots = 8

function GESTURES.IsGimmeSlotActive(arg_1_0, arg_1_1)
	if WATCH.IsAnyEquipped(arg_1_1) then
		local var_1_0 = WATCH.GetEquippedWatch(arg_1_1)

		return arg_1_0 == GESTURES.gimmeSlot or WATCH.HasTwoGimmeSlots(arg_1_1, var_1_0) and arg_1_0 == GESTURES.gimmeSlotSecondary
	else
		return false
	end
end

function GESTURES.GetEquippedRadialRefsConfig(arg_2_0, arg_2_1)
	local var_2_0 = ""
	local var_2_1 = PlayerData.BFFBGAJGD(arg_2_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	for iter_2_0 = 0, GESTURES.numRadialSlots - 1 do
		local var_2_2 = var_2_1.radial[iter_2_0]:get()

		if var_2_2 > LOOT.emptyID then
			var_2_0 = var_2_0 .. "+" .. var_2_2
		end
	end

	if #var_2_0 > 0 then
		var_2_0 = string.sub(var_2_0, 2)
	end

	return var_2_0
end

function GESTURES.GetEquippedRadialRefsTable(arg_3_0, arg_3_1)
	local var_3_0 = {}
	local var_3_1 = PlayerData.BFFBGAJGD(arg_3_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	for iter_3_0 = 0, GESTURES.numRadialSlots - 1 do
		local var_3_2 = var_3_1.radial[iter_3_0]:get()

		if var_3_2 > LOOT.emptyID then
			local var_3_3 = LOOT.GetTypeForID(var_3_2)

			var_3_0[LOOT.GetItemRef(var_3_3, var_3_2)] = var_3_2
		end
	end

	return var_3_0
end

function GESTURES.GetAllGestures(arg_4_0)
	local var_4_0 = {}
	local var_4_1 = StringTable.BFHCAIIDA(CSV.gestures.file)

	for iter_4_0 = 0, var_4_1 - 1 do
		local var_4_2 = CSV.ReadRow(CSV.gestures, iter_4_0)

		if var_4_2 and var_4_2.hideInUI ~= "1" then
			var_4_2.isUnlocked = LOOT.IsUnlocked(arg_4_0, LOOT.itemTypes.GESTURES, var_4_2.ref)
			var_4_2.rarity = LOOT.GetItemQuality(LOOT.itemTypes.GESTURES, var_4_2.ref)
			var_4_2.season, var_4_2.event, var_4_2.isPremium = LOOT.GetItemSeason(LOOT.itemTypes.GESTURES, var_4_2.ref)
			var_4_2.lootID = LOOT.GetItemID(LOOT.itemTypes.GESTURES, var_4_2.ref)
			var_4_2.isNew = Loot.HDJCADADF(arg_4_0, var_4_2.lootID)

			table.insert(var_4_0, var_4_2)
		end
	end

	return var_4_0
end

function GESTURES.GetImageForRef(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.gestures.file, CSV.gestures.cols.ref, arg_5_0, CSV.gestures.cols.image)
end

function GESTURES.GetLootImageFromRef(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.gestures.file, CSV.gestures.cols.ref, arg_6_0, CSV.gestures.cols.lootImage)
end

function GESTURES.GetNameForRef(arg_7_0)
	return StringTable.DIFCHIGDFB(CSV.gestures.file, CSV.gestures.cols.ref, arg_7_0, CSV.gestures.cols.name)
end

function GESTURES.GetSeasonForRef(arg_8_0)
	return StringTable.DIFCHIGDFB(CSV.gestures.file, CSV.gestures.cols.ref, arg_8_0, CSV.gestures.cols.season)
end

function GESTURES.GetIndexForRef(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.gestures.file, CSV.gestures.cols.ref, arg_9_0, CSV.gestures.cols.index)
end

function GESTURES.SetEquippedByRef(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = LOOT.GetItemID(LOOT.itemTypes.GESTURES, arg_10_2)

	GESTURES.SetEquippedByID(arg_10_0, arg_10_1, var_10_0)
end

function GESTURES.SetEquippedByID(arg_11_0, arg_11_1, arg_11_2)
	PlayerData.BFFBGAJGD(arg_11_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.radial[arg_11_1]:set(arg_11_2)

	if arg_11_2 > LOOT.emptyID then
		local var_11_0 = LOOT.GetItemRef(LOOT.itemTypes.GESTURES, arg_11_2)
		local var_11_1 = LOOT.GetItemImage(LOOT.itemTypes.GESTURES, var_11_0)
		local var_11_2 = LOOT.GetItemName(LOOT.itemTypes.GESTURES, var_11_0)

		GESTURES.ToastEquipped(arg_11_0, var_11_1, var_11_2)
	else
		GESTURES.ToastEquipped(arg_11_0, nil, Engine.CBBHFCGDIC("MENU/NONE"))
	end
end

function GESTURES.ToastEquipped(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = {
		displayTime = 2000,
		icon = arg_12_1 and #arg_12_1 > 0 and arg_12_1 or "menu_default_slot",
		description = arg_12_2 and arg_12_2 or "",
		controllerIndex = arg_12_0,
		header = Engine.CBBHFCGDIC("LUA_MENU/GESTURE_EQUIPPED"),
		type = LUI.ToastManager.NotificationType.GestureEquipped
	}
	local var_12_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.ProcessEvent(var_12_1, {
		name = "send_toast_notification",
		immediate = true,
		options = var_12_0
	})
end
