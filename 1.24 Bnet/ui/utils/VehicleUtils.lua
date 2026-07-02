VEHICLE = VEHICLE or {}
VEHICLE.DEFAULT_ROW_NUM = 0
VEHICLE.DEFAULT_REF = "default"
VEHICLE.RefToAliasCol = {
	apc = CSV.vehicleHorns.cols.apcAliasUI,
	atv = CSV.vehicleHorns.cols.atvAliasUI,
	cargo_truck = CSV.vehicleHorns.cols.cargoAliasUI,
	jeep = CSV.vehicleHorns.cols.jeepAliasUI,
	little_bird = CSV.vehicleHorns.cols.littleBirdAliasUI,
	tac_rover = CSV.vehicleHorns.cols.tacRoverAliasUI
}

function VEHICLE.GetVehicleCamos(arg_1_0, arg_1_1)
	local var_1_0 = CSV.vehicleCamos
	local var_1_1 = {}

	table.insert(var_1_1, VEHICLE.GetDefaultCamo(arg_1_1))

	local var_1_2 = StringTable.BFHCAIIDA(var_1_0.file)
	local var_1_3 = 0

	for iter_1_0 = 1, var_1_2 do
		if StringTable.CBGJCDIHCE(var_1_0.file, iter_1_0, var_1_0.cols.vehicleRef) == arg_1_1 then
			local var_1_4 = tonumber(StringTable.CBGJCDIHCE(var_1_0.file, iter_1_0, var_1_0.cols.hideInUI))

			if var_1_4 and var_1_4 == 0 then
				local var_1_5 = {
					ref = StringTable.CBGJCDIHCE(var_1_0.file, iter_1_0, var_1_0.cols.ref),
					name = StringTable.CBGJCDIHCE(var_1_0.file, iter_1_0, var_1_0.cols.name),
					image = StringTable.CBGJCDIHCE(var_1_0.file, iter_1_0, var_1_0.cols.icon),
					showcaseImage = StringTable.CBGJCDIHCE(var_1_0.file, iter_1_0, var_1_0.cols.showcaseImage)
				}

				var_1_5.isUnlocked = LOOT.IsUnlocked(arg_1_0, LOOT.itemTypes.VEHICLE_CAMO, var_1_5.ref)

				if var_1_5.isUnlocked then
					var_1_3 = var_1_3 + 1
				end

				var_1_5.lootType = LOOT.itemTypes.VEHICLE_CAMO
				var_1_5.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_CAMO, var_1_5.ref)
				var_1_5.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_CAMO, var_1_5.lootID)
				var_1_5.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_CAMO, var_1_5.lootID)

				table.insert(var_1_1, var_1_5)
			end
		end
	end

	return var_1_1, var_1_3
end

function VEHICLE.IsCategoryLocked(arg_2_0, arg_2_1)
	local var_2_0 = CSV.vehicleCamos
	local var_2_1 = StringTable.BFHCAIIDA(var_2_0.file)

	for iter_2_0 = 1, var_2_1 do
		local var_2_2 = StringTable.CBGJCDIHCE(var_2_0.file, iter_2_0, var_2_0.cols.vehicleRef)
		local var_2_3 = tonumber(StringTable.CBGJCDIHCE(var_2_0.file, iter_2_0, var_2_0.cols.hideInUI))

		if var_2_2 == arg_2_1.ref and var_2_3 == 0 then
			local var_2_4 = StringTable.CBGJCDIHCE(var_2_0.file, iter_2_0, var_2_0.cols.ref)

			if var_2_4 ~= VEHICLE.DEFAULT_REF and LOOT.IsUnlocked(arg_2_0, LOOT.itemTypes.VEHICLE_CAMO, var_2_4) then
				return false
			end
		end
	end

	if arg_2_1.hideHornTab == 0 then
		local var_2_5 = CSV.vehicleHorns
		local var_2_6 = StringTable.BFHCAIIDA(var_2_5.file)

		for iter_2_1 = 1, var_2_6 do
			local var_2_7 = StringTable.CBGJCDIHCE(var_2_5.file, iter_2_1, var_2_5.cols.ref)

			if tonumber(StringTable.CBGJCDIHCE(var_2_5.file, iter_2_1, var_2_5.cols.hideInUI)) == 0 and var_2_7 ~= "veh_horn_default" and LOOT.IsUnlocked(arg_2_0, LOOT.itemTypes.VEHICLE_HORN, var_2_7) then
				return false
			end
		end
	end

	if arg_2_1.hideTrackTab == 0 then
		local var_2_8 = CSV.vehicleTracks
		local var_2_9 = StringTable.BFHCAIIDA(var_2_8.file)

		for iter_2_2 = 1, var_2_9 do
			local var_2_10 = StringTable.CBGJCDIHCE(var_2_8.file, iter_2_2, var_2_8.cols.vehicleRef)

			if tonumber(StringTable.CBGJCDIHCE(var_2_8.file, iter_2_2, var_2_8.cols.hideInUI)) == 0 and (var_2_10 == arg_2_1.ref or var_2_10 == "default") then
				local var_2_11 = StringTable.CBGJCDIHCE(var_2_8.file, iter_2_2, var_2_8.cols.ref)

				if LOOT.IsUnlocked(arg_2_0, LOOT.itemTypes.VEHICLE_TRACK, var_2_11) then
					return false
				end
			end
		end
	end

	return true
end

function VEHICLE.GetAllVehicles(arg_3_0)
	local var_3_0 = CSV.vehicleCustomization
	local var_3_1 = {}
	local var_3_2 = StringTable.BFHCAIIDA(var_3_0.file)

	for iter_3_0 = 1, var_3_2 do
		local var_3_3 = {
			hideInUI = tonumber(StringTable.CBGJCDIHCE(var_3_0.file, iter_3_0 - 1, var_3_0.cols.hideInUI))
		}

		if var_3_3.hideInUI == 0 then
			var_3_3.ref = StringTable.CBGJCDIHCE(var_3_0.file, iter_3_0 - 1, var_3_0.cols.ref)
			var_3_3.name = StringTable.CBGJCDIHCE(var_3_0.file, iter_3_0 - 1, var_3_0.cols.name)
			var_3_3.vehicleIcon = StringTable.CBGJCDIHCE(var_3_0.file, iter_3_0 - 1, var_3_0.cols.icon)
			var_3_3.hideHornTab = tonumber(StringTable.CBGJCDIHCE(var_3_0.file, iter_3_0 - 1, var_3_0.cols.hideHornTab))
			var_3_3.hideTrackTab = tonumber(StringTable.CBGJCDIHCE(var_3_0.file, iter_3_0 - 1, var_3_0.cols.hideTrackTab))
			var_3_3.isLocked = VEHICLE.IsCategoryLocked(arg_3_0, var_3_3)

			table.insert(var_3_1, var_3_3)
		end
	end

	return var_3_1
end

function VEHICLE.GetDefaultCamo(arg_4_0)
	local var_4_0 = CSV.ReadRow(CSV.vehicleCamos, VEHICLE.DEFAULT_ROW_NUM) or {}

	var_4_0.lootID = 0
	var_4_0.isUnlocked = true
	var_4_0.rarity = 0
	var_4_0.season = 0
	var_4_0.image = var_4_0.icon
	var_4_0.showcaseImage = StringTable.DIFCHIGDFB(CSV.vehicleCustomization.file, CSV.vehicleCustomization.cols.ref, arg_4_0, CSV.vehicleCustomization.cols.defaultShowcaseImage)
	var_4_0.vehicleRef = arg_4_0

	return var_4_0
end

function VEHICLE.GetPlayerData(arg_5_0, arg_5_1)
	return PlayerData.BFFBGAJGD(arg_5_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.vehicleCustomization[arg_5_1]
end

function VEHICLE.GetEquippedCamo(arg_6_0, arg_6_1)
	local var_6_0 = VEHICLE.GetPlayerData(arg_6_0, arg_6_1).camo:get()
	local var_6_1 = CSV.vehicleCamos
	local var_6_2

	if var_6_0 and tonumber(var_6_0) > 0 then
		local var_6_3 = LOOT.GetItemRef(LOOT.itemTypes.VEHICLE_CAMO, var_6_0)
		local var_6_4 = StringTable.BJJBBCJGEJ(var_6_1.file, var_6_1.cols.ref, var_6_3)

		var_6_2 = CSV.ReadRow(var_6_1, var_6_4)
		var_6_2.isUnlocked = true
		var_6_2.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_CAMO, var_6_0)
		var_6_2.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_CAMO, var_6_0)
	else
		var_6_2 = VEHICLE.GetDefaultCamo(arg_6_1)
	end

	var_6_2.isSelected = true

	return var_6_2
end

function VEHICLE.IsNewLootByVehicle(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = Loot.BCBAGDEJAJ(arg_7_0, LOOT.typeNames[arg_7_2])

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = false
		local var_7_2

		if arg_7_2 == LOOT.itemTypes.VEHICLE_HORN or arg_7_2 == LOOT.itemTypes.VEHICLE_TRACK then
			var_7_2 = true
		else
			local var_7_3 = LOOT.GetItemRef(arg_7_2, iter_7_1)
			local var_7_4 = LOOT.typeCSV[arg_7_2]

			var_7_2 = arg_7_1 == StringTable.DIFCHIGDFB(var_7_4.file, var_7_4.cols.ref, var_7_3, var_7_4.cols.vehicleRef)
		end

		if var_7_2 and Loot.HDJCADADF(arg_7_0, iter_7_1) then
			return true
		end
	end

	return false
end

function VEHICLE.GetLootImage(arg_8_0, arg_8_1)
	local var_8_0 = LOOT.typeCSV[arg_8_0]
	local var_8_1 = var_8_0.cols.lootImage

	if arg_8_0 == LOOT.itemTypes.VEHICLE_CAMO then
		var_8_1 = var_8_0.cols.showcaseImage
	end

	return StringTable.DIFCHIGDFB(var_8_0.file, var_8_0.cols.ref, arg_8_1, var_8_1)
end

function VEHICLE.GetLootName(arg_9_0, arg_9_1)
	local var_9_0 = LOOT.typeCSV[arg_9_0]

	return StringTable.DIFCHIGDFB(var_9_0.file, var_9_0.cols.ref, arg_9_1, var_9_0.cols.name)
end

function VEHICLE.GetCamoName(arg_10_0)
	local var_10_0 = CSV.vehicleCamos

	return StringTable.DIFCHIGDFB(var_10_0.file, var_10_0.cols.ref, arg_10_0, var_10_0.cols.name)
end

function VEHICLE.GetFlavorText(arg_11_0)
	local var_11_0 = CSV.vehicleCamos

	return StringTable.DIFCHIGDFB(var_11_0.file, var_11_0.cols.ref, arg_11_0, var_11_0.cols.flavorText)
end

function VEHICLE.GetCategoryName(arg_12_0)
	local var_12_0 = CSV.vehicleCustomization

	return StringTable.DIFCHIGDFB(var_12_0.file, var_12_0.cols.ref, arg_12_0, var_12_0.cols.name)
end

function VEHICLE.GetCategoryDesc(arg_13_0)
	local var_13_0 = CSV.vehicleCustomization

	return StringTable.DIFCHIGDFB(var_13_0.file, var_13_0.cols.ref, arg_13_0, var_13_0.cols.desc)
end

function VEHICLE.GetVehicleHorns()
	local var_14_0 = CSV.vehicleHorns
	local var_14_1 = {}
	local var_14_2 = StringTable.BFHCAIIDA(var_14_0.file)

	for iter_14_0 = 0, var_14_2 do
		local var_14_3 = tonumber(StringTable.CBGJCDIHCE(var_14_0.file, iter_14_0, var_14_0.cols.hideInUI))

		if var_14_3 and var_14_3 == 0 then
			local var_14_4 = {
				index = StringTable.CBGJCDIHCE(var_14_0.file, iter_14_0, var_14_0.cols.index),
				ref = StringTable.CBGJCDIHCE(var_14_0.file, iter_14_0, var_14_0.cols.ref),
				name = StringTable.CBGJCDIHCE(var_14_0.file, iter_14_0, var_14_0.cols.name)
			}

			var_14_4.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_HORN, var_14_4.ref)
			var_14_4.lootType = LOOT.itemTypes.VEHICLE_HORN
			var_14_4.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_HORN, var_14_4.lootID)
			var_14_4.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_HORN, var_14_4.lootID)

			table.insert(var_14_1, var_14_4)
		end
	end

	return var_14_1
end

function VEHICLE.GetHornData(arg_15_0)
	local var_15_0 = CSV.vehicleHorns
	local var_15_1 = {
		index = arg_15_0,
		ref = StringTable.DIFCHIGDFB(var_15_0.file, var_15_0.cols.index, arg_15_0, var_15_0.cols.ref),
		name = StringTable.DIFCHIGDFB(var_15_0.file, var_15_0.cols.index, arg_15_0, var_15_0.cols.name),
		lootType = LOOT.itemTypes.VEHICLE_HORN
	}

	if arg_15_0 > 0 then
		var_15_1.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_HORN, var_15_1.ref)
		var_15_1.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_HORN, var_15_1.lootID)
		var_15_1.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_HORN, var_15_1.lootID)
	else
		var_15_1.lootID = 0
		var_15_1.rarity = 0
		var_15_1.season = 0
	end

	return var_15_1
end

function VEHICLE.GetEquippedHorn(arg_16_0, arg_16_1)
	local var_16_0 = VEHICLE.GetPlayerData(arg_16_0, arg_16_1)

	return VEHICLE.GetHornData(var_16_0.horn:get())
end

function VEHICLE.GetLootAlias(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0 == LOOT.itemTypes.VEHICLE_HORN then
		local var_17_0 = CSV.vehicleHorns
		local var_17_1 = VEHICLE.RefToAliasCol[arg_17_2]

		return StringTable.DIFCHIGDFB(var_17_0.file, var_17_0.cols.ref, arg_17_1, var_17_1)
	elseif arg_17_0 == LOOT.itemTypes.VEHICLE_TRACK then
		local var_17_2 = CSV.vehicleTracks

		return StringTable.DIFCHIGDFB(var_17_2.file, var_17_2.cols.ref, arg_17_1, var_17_2.cols.alias)
	end
end

function VEHICLE.GetHornPreviewAlias(arg_18_0)
	local var_18_0 = CSV.vehicleHorns

	return StringTable.DIFCHIGDFB(var_18_0.file, var_18_0.cols.ref, arg_18_0, var_18_0.cols.mtxAlias)
end

function VEHICLE.GetEquippedHornName(arg_19_0, arg_19_1)
	local var_19_0 = VEHICLE.GetPlayerData(arg_19_0, arg_19_1)

	if var_19_0 then
		local var_19_1 = var_19_0.horn:get()

		return (StringTable.DIFCHIGDFB(CSV.vehicleHorns.file, CSV.vehicleHorns.cols.index, var_19_1, CSV.vehicleHorns.cols.name))
	end

	return nil
end

function VEHICLE.GetVehicleTracks(arg_20_0, arg_20_1)
	local var_20_0 = CSV.vehicleTracks
	local var_20_1 = {}
	local var_20_2 = StringTable.BFHCAIIDA(var_20_0.file)
	local var_20_3 = false

	for iter_20_0 = 0, var_20_2 do
		local var_20_4 = StringTable.CBGJCDIHCE(var_20_0.file, iter_20_0, var_20_0.cols.vehicleRef)

		if var_20_4 == arg_20_1 or var_20_4 == "default" then
			local var_20_5 = tonumber(StringTable.CBGJCDIHCE(var_20_0.file, iter_20_0, var_20_0.cols.hideInUI))

			if var_20_5 and var_20_5 == 0 then
				local var_20_6 = {
					index = StringTable.CBGJCDIHCE(var_20_0.file, iter_20_0, var_20_0.cols.index),
					ref = StringTable.CBGJCDIHCE(var_20_0.file, iter_20_0, var_20_0.cols.ref),
					name = StringTable.CBGJCDIHCE(var_20_0.file, iter_20_0, var_20_0.cols.name),
					lootType = LOOT.itemTypes.VEHICLE_TRACK
				}

				var_20_6.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_TRACK, var_20_6.ref)

				if not var_20_3 and iter_20_0 > 1 and LOOT.IsUnlockedWithID(arg_20_0, var_20_6.lootID) then
					var_20_3 = true
				end

				if tonumber(var_20_6.index) > 1 then
					var_20_6.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_TRACK, var_20_6.lootID)
					var_20_6.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_TRACK, var_20_6.lootID)
				end

				table.insert(var_20_1, var_20_6)
			end
		end
	end

	if not var_20_3 then
		table.remove(var_20_1, 2)
	end

	return var_20_1
end

function VEHICLE.GetEquippedTrack(arg_21_0, arg_21_1)
	return VEHICLE.GetPlayerData(arg_21_0, arg_21_1).tracks[0]:get()
end

function VEHICLE.GetTrackPreviewAlias(arg_22_0)
	local var_22_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_22_0.file, var_22_0.cols.ref, arg_22_0, var_22_0.cols.alias)
end

function VEHICLE.GetTrackBattlePassPreviewAlias(arg_23_0)
	local var_23_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_23_0.file, var_23_0.cols.ref, arg_23_0, var_23_0.cols.battlePassAlias)
end

function VEHICLE.GetTrackBattlePassPreviewName(arg_24_0)
	local var_24_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_24_0.file, var_24_0.cols.ref, arg_24_0, var_24_0.cols.battlePassName)
end
