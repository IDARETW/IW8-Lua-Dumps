SPRAYS = SPRAYS or {}

function SPRAYS.GetAllSprays(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = StringTable.BFHCAIIDA(CSV.sprays.file)

	for iter_1_0 = 0, var_1_1 - 1 do
		local var_1_2 = CSV.ReadRow(CSV.sprays, iter_1_0)

		if var_1_2 and var_1_2.hideInUI ~= "1" then
			var_1_2.isUnlocked = LOOT.IsUnlocked(arg_1_0, LOOT.itemTypes.SPRAYS, var_1_2.ref)
			var_1_2.rarity = LOOT.GetItemQuality(LOOT.itemTypes.SPRAYS, var_1_2.ref)
			var_1_2.season, var_1_2.event, var_1_2.isPremium = LOOT.GetItemSeason(LOOT.itemTypes.SPRAYS, var_1_2.ref)
			var_1_2.lootID = LOOT.GetItemID(LOOT.itemTypes.SPRAYS, var_1_2.ref)
			var_1_2.isNew = Loot.HDJCADADF(arg_1_0, var_1_2.lootID)

			table.insert(var_1_0, var_1_2)
		end
	end

	return var_1_0
end

function SPRAYS.GetNameForRef(arg_2_0)
	return StringTable.DIFCHIGDFB(CSV.sprays.file, CSV.sprays.cols.ref, arg_2_0, CSV.sprays.cols.name)
end

function SPRAYS.GetImageForRef(arg_3_0)
	return StringTable.DIFCHIGDFB(CSV.sprays.file, CSV.sprays.cols.ref, arg_3_0, CSV.sprays.cols.image)
end

function SPRAYS.GetSeasonForRef(arg_4_0)
	return StringTable.DIFCHIGDFB(CSV.sprays.file, CSV.sprays.cols.ref, arg_4_0, CSV.sprays.cols.season)
end

function SPRAYS.GetIndexForRef(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.sprays.file, CSV.sprays.cols.ref, arg_5_0, CSV.sprays.cols.index)
end

function SPRAYS.SetEquippedByRef(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = PlayerData.BFFBGAJGD(arg_6_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_6_1 = LOOT.GetItemID(LOOT.itemTypes.SPRAYS, arg_6_2)

	var_6_0.radial[arg_6_1]:set(var_6_1)

	local var_6_2 = LOOT.GetItemImage(LOOT.itemTypes.SPRAYS, arg_6_2)
	local var_6_3 = LOOT.GetItemName(LOOT.itemTypes.SPRAYS, arg_6_2)

	SPRAYS.ToastEquipped(arg_6_0, var_6_2, var_6_3)
end

function SPRAYS.ToastEquipped(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {
		displayTime = 2000,
		icon = arg_7_1 and #arg_7_1 > 0 and arg_7_1 or "menu_default_slot",
		description = arg_7_2 and arg_7_2 or "",
		controllerIndex = arg_7_0,
		header = Engine.CBBHFCGDIC("LUA_MENU/SPRAY_EQUIPPED"),
		type = LUI.ToastManager.NotificationType.SprayEquipped
	}
	local var_7_1 = Engine.DBFFAEEFGJ()

	LUI.UIRoot.ProcessEvent(var_7_1, {
		name = "send_toast_notification",
		immediate = true,
		options = var_7_0
	})
end
