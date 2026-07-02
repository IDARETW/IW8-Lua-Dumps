VEHICLE = VEHICLE or {}
VEHICLE.DEFAULT_ROW_NUM = 0
VEHICLE.DEFAULT_REF = "default"
VEHICLE.DEFAULT_HORN_REF = "veh_horn_default"
VEHICLE.RANDOM_TRACK_REF = "veh_track_random"
VEHICLE.RANDOM_TRACK_PACK_REF = "veh_pack_random"
VEHICLE.NONE_TRACK_REF = "veh_track_none"
VEHICLE.RANDOM_TRACK_INDEX = 1
VEHICLE.MAX_RANDOM_SLOTS_COUNT = 9
VEHICLE.MAX_PLANE_OCCUPANTS = 4
VEHICLE.BOMBER_AUTO_REFILL_DROP_BOMB_TIME = Dvar.CFHDGABACF("scr_br_bomber_auto_refill_drop_bomb_time") or 20
VEHICLE.BOMBER_MAX_VALUE_PER_BOMB_STATE_BITS = 127
VEHICLE.PLANE_STATES = {
	FLYING = 2,
	STALLING = 3,
	TAXING = 1,
	STILL = 0
}
VEHICLE.AIRPLANE_PING_DURATION = 2500
VEHICLE.AIRPLANE_PING_RADIUS = 100
VEHICLE.DEFAULT_PING_DURATION = Dvar.CFHDGABACF("MPPKMQPPOT")
VEHICLE.DEFAULT_PING_RADIUS = Dvar.BJJCJHDBII("MNTSSMTOMR")
VEHICLE.RefToAliasCol = {
	apc = CSV.vehicleHorns.cols.apcAliasUI,
	atv = CSV.vehicleHorns.cols.atvAliasUI,
	cargo_truck = CSV.vehicleHorns.cols.cargoAliasUI,
	jeep = CSV.vehicleHorns.cols.jeepAliasUI,
	little_bird = CSV.vehicleHorns.cols.littleBirdAliasUI,
	tac_rover = CSV.vehicleHorns.cols.tacRoverAliasUI,
	motorcycle = CSV.vehicleHorns.cols.motorcycleAliasUI,
	open_jeep_carpoc = CSV.vehicleHorns.cols.openJeepCarpocAliasUI
}
VEHICLE.SpecialAttribute = {
	tailLightTracerRed = {
		name = "VEHICLES/ATTRIBUTE_TAIL_LIGHT_TRACER_RED",
		ref = "tailLightTracerRed",
		color = SWATCHES.VehicleAttributes.tailLightTracerRed
	},
	tailLightTracerAkira = {
		name = "VEHICLES/ATTRIBUTE_TAIL_LIGHT_TRACER_AKIRA",
		ref = "tailLightTracerAkira",
		color = SWATCHES.VehicleAttributes.tailLightTracerAkira
	},
	flightTrailStandard = {
		name = "VEHICLES/ATTRIBUTE_FLIGHT_TRAIL_STANDARD",
		ref = "flightTrailStandard",
		color = SWATCHES.VehicleAttributes.flightTrailStandard
	},
	flightTrailShadow = {
		name = "VEHICLES/ATTRIBUTE_FLIGHT_TRAIL_SHADOW",
		ref = "flightTrailShadow",
		color = SWATCHES.VehicleAttributes.flightTrailShadow
	},
	flightTrailRainbow = {
		name = "VEHICLES/ATTRIBUTE_FLIGHT_TRAIL_RAINBOW",
		ref = "flightTrailRainbow",
		color = SWATCHES.VehicleAttributes.flightTrailShadow
	},
	tireTrailFlame = {
		name = "VEHICLES/ATTRIBUTE_TIRE_TRAIL_FLAME",
		ref = "tireTrailFlame",
		color = SWATCHES.VehicleAttributes.tireTrailFlame
	},
	tireTrailTesla = {
		name = "VEHICLES/ATTRIBUTE_TIRE_TRAIL_TESLA",
		ref = "tireTrailTesla",
		color = SWATCHES.VehicleAttributes.tireTrailTesla
	},
	smoke = {
		name = "VEHICLES/ATTRIBUTE_SMOKE",
		ref = "smoke",
		color = SWATCHES.VehicleAttributes.smoke
	}
}

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local function var_1_0(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		if arg_2_1 == LOOT.itemTypes.VEHICLE_CAMO then
			return arg_2_3 == arg_2_0.ref and arg_2_2 ~= VEHICLE.DEFAULT_REF
		elseif arg_2_1 == LOOT.itemTypes.VEHICLE_HORN then
			return arg_2_2 ~= VEHICLE.DEFAULT_HORN_REF
		elseif arg_2_1 == LOOT.itemTypes.VEHICLE_TRACK then
			return (arg_2_3 == arg_2_0.ref or arg_2_3 == VEHICLE.DEFAULT_REF) and arg_2_2 ~= VEHICLE.NONE_TRACK_REF and arg_2_2 ~= VEHICLE.RANDOM_TRACK_REF
		else
			return false
		end
	end

	local var_1_1 = StringTable.BFHCAIIDA(arg_1_2.file) - 1

	for iter_1_0 = 1, var_1_1 do
		local var_1_2 = StringTable.CBGJCDIHCE(arg_1_2.file, iter_1_0, arg_1_2.cols.ref)
		local var_1_3 = (arg_1_3 == LOOT.itemTypes.VEHICLE_TRACK or arg_1_3 == LOOT.itemTypes.VEHICLE_CAMO) and StringTable.CBGJCDIHCE(arg_1_2.file, iter_1_0, arg_1_2.cols.vehicleRef) or nil

		if not (tonumber(StringTable.CBGJCDIHCE(arg_1_2.file, iter_1_0, arg_1_2.cols.hideInUI)) == 1) and var_1_0(arg_1_1, arg_1_3, var_1_2, var_1_3) and LOOT.IsUnlocked(arg_1_0, arg_1_3, var_1_2) then
			return true
		end
	end

	return false
end

local function var_0_1(arg_3_0)
	local var_3_0 = tonumber(arg_3_0.hideInUI) == 1
	local var_3_1 = tonumber(arg_3_0.hideInWZ) == 1 and CONDITIONS.IsWZWipFlowEnabled()
	local var_3_2 = tonumber(arg_3_0.hideInMW) == 1 and not CONDITIONS.IsWZWipFlowEnabled()

	return var_3_0 or var_3_1 or var_3_2
end

function VEHICLE.GetVehicleCamos(arg_4_0, arg_4_1)
	local var_4_0 = CSV.vehicleCamos
	local var_4_1 = {}
	local var_4_2 = VEHICLE.GetDefaultCamo(arg_4_1)

	table.insert(var_4_1, var_4_2)

	local var_4_3 = StringTable.BFHCAIIDA(var_4_0.file)
	local var_4_4 = 0

	for iter_4_0 = 1, var_4_3 do
		if StringTable.CBGJCDIHCE(var_4_0.file, iter_4_0, var_4_0.cols.vehicleRef) == arg_4_1 then
			local var_4_5 = tonumber(StringTable.CBGJCDIHCE(var_4_0.file, iter_4_0, var_4_0.cols.hideInUI))

			if var_4_5 and var_4_5 == 0 then
				local var_4_6 = {
					ref = StringTable.CBGJCDIHCE(var_4_0.file, iter_4_0, var_4_0.cols.ref),
					name = StringTable.CBGJCDIHCE(var_4_0.file, iter_4_0, var_4_0.cols.name),
					image = StringTable.CBGJCDIHCE(var_4_0.file, iter_4_0, var_4_0.cols.icon),
					showcaseImage = StringTable.CBGJCDIHCE(var_4_0.file, iter_4_0, var_4_0.cols.showcaseImage)
				}

				var_4_6.isUnlocked = LOOT.IsUnlocked(arg_4_0, LOOT.itemTypes.VEHICLE_CAMO, var_4_6.ref)

				if var_4_6.isUnlocked then
					var_4_4 = var_4_4 + 1
				end

				var_4_6.lootType = LOOT.itemTypes.VEHICLE_CAMO
				var_4_6.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_CAMO, var_4_6.ref)
				var_4_6.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_CAMO, var_4_6.lootID)
				var_4_6.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_CAMO, var_4_6.lootID)
				var_4_6.unlockText = Engine.CBBHFCGDIC(StringTable.CBGJCDIHCE(var_4_0.file, iter_4_0, var_4_0.cols.unlockText), SEASON.GetLocalizedName({
					seasonDataNumToUse = var_4_6.season
				}))

				table.insert(var_4_1, var_4_6)
			end
		end
	end

	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		local var_4_7 = RANDOM.GetItemData(arg_4_0)

		var_4_7.isUnlocked = var_4_4 > 0
		var_4_7.lootType = LOOT.itemTypes.VEHICLE_CAMO
		var_4_7.showcaseImage = var_4_2.showcaseImage

		table.insert(var_4_1, 2, var_4_7)
	end

	return var_4_1, var_4_4
end

function VEHICLE.IsCategoryLocked(arg_5_0, arg_5_1)
	if var_0_0(arg_5_0, arg_5_1, CSV.vehicleCamos, LOOT.itemTypes.VEHICLE_CAMO) then
		return false
	end

	if tonumber(arg_5_1.hideHornTab) == 0 and var_0_0(arg_5_0, arg_5_1, CSV.vehicleHorns, LOOT.itemTypes.VEHICLE_HORN) then
		return false
	end

	if tonumber(arg_5_1.hideTrackTab) == 0 and var_0_0(arg_5_0, arg_5_1, CSV.vehicleTracks, LOOT.itemTypes.VEHICLE_TRACK) then
		return false
	end

	return true
end

function VEHICLE.GetAllVehicles(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = StringTable.BFHCAIIDA(CSV.vehicleCustomization.file)

	for iter_6_0 = 1, var_6_1 do
		local var_6_2 = CSV.ReadRow(CSV.vehicleCustomization, iter_6_0 - 1)

		if not var_0_1(var_6_2) then
			var_6_2.isLocked = VEHICLE.IsCategoryLocked(arg_6_0, var_6_2)

			table.insert(var_6_0, var_6_2)
		end
	end

	return var_6_0
end

function VEHICLE.GetDefaultCamo(arg_7_0)
	local var_7_0 = CSV.ReadRow(CSV.vehicleCamos, VEHICLE.DEFAULT_ROW_NUM) or {}

	var_7_0.lootID = 0
	var_7_0.isUnlocked = true
	var_7_0.rarity = 0
	var_7_0.season = 0
	var_7_0.image = var_7_0.icon
	var_7_0.showcaseImage = StringTable.DIFCHIGDFB(CSV.vehicleCustomization.file, CSV.vehicleCustomization.cols.ref, arg_7_0, CSV.vehicleCustomization.cols.defaultShowcaseImage)
	var_7_0.vehicleRef = arg_7_0

	return var_7_0
end

function VEHICLE.GetPlayerData(arg_8_0, arg_8_1)
	return PlayerData.BFFBGAJGD(arg_8_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.vehicleCustomization[arg_8_1]
end

function VEHICLE.GetEquippedCamo(arg_9_0, arg_9_1)
	local var_9_0

	if RANDOM.IsEnabled(arg_9_0, LOOT.itemTypes.VEHICLE_CAMO, {
		vehicleRef = arg_9_1
	}) then
		var_9_0 = RANDOM.GetItemData(arg_9_0, {
			itemType = LOOT.itemTypes.VEHICLE_CAMO,
			vehicleRef = arg_9_1
		})
	else
		local var_9_1 = VEHICLE.GetPlayerData(arg_9_0, arg_9_1).camo:get()
		local var_9_2 = CSV.vehicleCamos

		if var_9_1 and tonumber(var_9_1) > 0 then
			local var_9_3 = LOOT.GetItemRef(LOOT.itemTypes.VEHICLE_CAMO, var_9_1)
			local var_9_4 = StringTable.BJJBBCJGEJ(var_9_2.file, var_9_2.cols.ref, var_9_3)

			var_9_0 = CSV.ReadRow(var_9_2, var_9_4)
			var_9_0.isUnlocked = true
			var_9_0.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_CAMO, var_9_1)
			var_9_0.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_CAMO, var_9_1)

			if var_9_3 == "" or var_9_4 == -1 then
				var_9_0 = VEHICLE.GetDefaultCamo(arg_9_1)
			end
		else
			var_9_0 = VEHICLE.GetDefaultCamo(arg_9_1)
		end
	end

	var_9_0.isSelected = true

	return var_9_0
end

function VEHICLE.IsNewLootByVehicle(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = Loot.BCBAGDEJAJ(arg_10_0, LOOT.typeNames[arg_10_2])

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		local var_10_1 = false
		local var_10_2

		if arg_10_2 == LOOT.itemTypes.VEHICLE_HORN or arg_10_2 == LOOT.itemTypes.VEHICLE_TRACK then
			var_10_2 = true
		else
			local var_10_3 = LOOT.GetItemRef(arg_10_2, iter_10_1)
			local var_10_4 = LOOT.typeCSV[arg_10_2]

			var_10_2 = arg_10_1 == StringTable.DIFCHIGDFB(var_10_4.file, var_10_4.cols.ref, var_10_3, var_10_4.cols.vehicleRef)
		end

		if var_10_2 and Loot.HDJCADADF(arg_10_0, iter_10_1) then
			return true
		end
	end

	return false
end

function VEHICLE.GetLootImage(arg_11_0, arg_11_1)
	local var_11_0 = LOOT.typeCSV[arg_11_0]
	local var_11_1 = var_11_0.cols.lootImage

	if arg_11_0 == LOOT.itemTypes.VEHICLE_CAMO then
		var_11_1 = var_11_0.cols.showcaseImage
	end

	return StringTable.DIFCHIGDFB(var_11_0.file, var_11_0.cols.ref, arg_11_1, var_11_1)
end

function VEHICLE.GetBattlepassImage(arg_12_0, arg_12_1)
	local var_12_0 = LOOT.typeCSV[arg_12_0]
	local var_12_1 = var_12_0.cols.lootImage

	if arg_12_0 == LOOT.itemTypes.VEHICLE_CAMO then
		var_12_1 = var_12_0.cols.battlePassImage
	end

	return StringTable.DIFCHIGDFB(var_12_0.file, var_12_0.cols.ref, arg_12_1, var_12_1)
end

function VEHICLE.GetLootName(arg_13_0, arg_13_1)
	local var_13_0 = LOOT.typeCSV[arg_13_0]

	return StringTable.DIFCHIGDFB(var_13_0.file, var_13_0.cols.ref, arg_13_1, var_13_0.cols.name)
end

function VEHICLE.GetCamoName(arg_14_0)
	local var_14_0 = CSV.vehicleCamos

	return StringTable.DIFCHIGDFB(var_14_0.file, var_14_0.cols.ref, arg_14_0, var_14_0.cols.name)
end

function VEHICLE.GetFlavorText(arg_15_0)
	local var_15_0 = CSV.vehicleCamos

	return StringTable.DIFCHIGDFB(var_15_0.file, var_15_0.cols.ref, arg_15_0, var_15_0.cols.flavorText)
end

function VEHICLE.GetCategoryName(arg_16_0)
	local var_16_0 = CSV.vehicleCustomization

	return StringTable.DIFCHIGDFB(var_16_0.file, var_16_0.cols.ref, arg_16_0, var_16_0.cols.name)
end

function VEHICLE.GetCategoryDesc(arg_17_0)
	local var_17_0 = CSV.vehicleCustomization

	return StringTable.DIFCHIGDFB(var_17_0.file, var_17_0.cols.ref, arg_17_0, var_17_0.cols.desc)
end

function VEHICLE.GetVehicleHorns(arg_18_0)
	local var_18_0 = CSV.vehicleHorns
	local var_18_1 = {}
	local var_18_2 = StringTable.BFHCAIIDA(var_18_0.file)
	local var_18_3 = false

	for iter_18_0 = 0, var_18_2 do
		local var_18_4 = tonumber(StringTable.CBGJCDIHCE(var_18_0.file, iter_18_0, var_18_0.cols.hideInUI))

		if var_18_4 and var_18_4 == 0 then
			local var_18_5 = {
				index = tonumber(StringTable.CBGJCDIHCE(var_18_0.file, iter_18_0, var_18_0.cols.index)),
				ref = StringTable.CBGJCDIHCE(var_18_0.file, iter_18_0, var_18_0.cols.ref),
				name = StringTable.CBGJCDIHCE(var_18_0.file, iter_18_0, var_18_0.cols.name)
			}

			var_18_5.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_HORN, var_18_5.ref)
			var_18_5.lootType = LOOT.itemTypes.VEHICLE_HORN

			if var_18_5.index > 0 then
				var_18_5.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_HORN, var_18_5.lootID)
				var_18_5.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_HORN, var_18_5.lootID)
				var_18_5.isUnlocked = LOOT.IsUnlocked(arg_18_0, LOOT.itemTypes.VEHICLE_HORN, var_18_5.ref)
				var_18_5.unlockText = Engine.CBBHFCGDIC(StringTable.CBGJCDIHCE(var_18_0.file, iter_18_0, var_18_0.cols.unlockText), SEASON.GetLocalizedName({
					seasonDataNumToUse = var_18_5.season
				}))
			else
				var_18_5.rarity = 0
				var_18_5.isUnlocked = true
			end

			if not var_18_3 and var_18_5.index > 0 and var_18_5.isUnlocked then
				var_18_3 = true
			end

			table.insert(var_18_1, var_18_5)
		end
	end

	if Dvar.IBEGCHEFE("TQRNTTMSL") and var_18_3 then
		local var_18_6 = RANDOM.GetItemData(arg_18_0)

		var_18_6.isUnlocked = true
		var_18_6.rarity = nil
		var_18_6.season = nil
		var_18_6.lootType = LOOT.itemTypes.VEHICLE_HORN

		table.insert(var_18_1, 2, var_18_6)
	end

	return var_18_1
end

function VEHICLE.GetHornData(arg_19_0)
	local var_19_0 = CSV.vehicleHorns
	local var_19_1 = {
		index = arg_19_0,
		ref = StringTable.DIFCHIGDFB(var_19_0.file, var_19_0.cols.index, arg_19_0, var_19_0.cols.ref),
		name = StringTable.DIFCHIGDFB(var_19_0.file, var_19_0.cols.index, arg_19_0, var_19_0.cols.name),
		lootType = LOOT.itemTypes.VEHICLE_HORN
	}

	if arg_19_0 > 0 then
		var_19_1.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_HORN, var_19_1.ref)
		var_19_1.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_HORN, var_19_1.lootID)
		var_19_1.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_HORN, var_19_1.lootID)
	else
		var_19_1.lootID = 0
		var_19_1.rarity = 0
		var_19_1.season = 0
	end

	return var_19_1
end

function VEHICLE.GetEquippedHorn(arg_20_0, arg_20_1)
	local var_20_0 = {}

	if RANDOM.IsEnabled(arg_20_0, LOOT.itemTypes.VEHICLE_HORN, {
		vehicleRef = arg_20_1
	}) then
		var_20_0 = RANDOM.GetItemData(arg_20_0, {
			itemType = LOOT.itemTypes.VEHICLE_HORN,
			vehicleRef = arg_20_1
		})
	else
		local var_20_1 = VEHICLE.GetPlayerData(arg_20_0, arg_20_1)

		var_20_0 = VEHICLE.GetHornData(var_20_1.horn:get())
	end

	return var_20_0
end

function VEHICLE.GetLootAlias(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0 == LOOT.itemTypes.VEHICLE_HORN then
		local var_21_0 = CSV.vehicleHorns
		local var_21_1 = VEHICLE.RefToAliasCol[arg_21_2]

		return StringTable.DIFCHIGDFB(var_21_0.file, var_21_0.cols.ref, arg_21_1, var_21_1)
	elseif arg_21_0 == LOOT.itemTypes.VEHICLE_TRACK then
		local var_21_2 = CSV.vehicleTracks

		return StringTable.DIFCHIGDFB(var_21_2.file, var_21_2.cols.ref, arg_21_1, var_21_2.cols.alias)
	end
end

function VEHICLE.GetHornPreviewAlias(arg_22_0)
	local var_22_0 = CSV.vehicleHorns

	return StringTable.DIFCHIGDFB(var_22_0.file, var_22_0.cols.ref, arg_22_0, var_22_0.cols.mtxAlias)
end

function VEHICLE.GetEquippedHornName(arg_23_0, arg_23_1)
	local var_23_0 = VEHICLE.GetPlayerData(arg_23_0, arg_23_1)

	if var_23_0 then
		local var_23_1 = var_23_0.horn:get()

		return (StringTable.DIFCHIGDFB(CSV.vehicleHorns.file, CSV.vehicleHorns.cols.index, var_23_1, CSV.vehicleHorns.cols.name))
	end

	return nil
end

function VEHICLE.GetItemIndexByLootID(arg_24_0, arg_24_1)
	local var_24_0 = LOOT.GetItemRef(arg_24_0, arg_24_1)
	local var_24_1 = LOOT.typeCSV[arg_24_0]

	return StringTable.DIFCHIGDFB(var_24_1.file, var_24_1.cols.ref, var_24_0, var_24_1.cols.index)
end

function VEHICLE.GetVehicleTracks(arg_25_0, arg_25_1)
	local var_25_0 = CSV.vehicleTracks
	local var_25_1 = {}
	local var_25_2 = StringTable.BFHCAIIDA(var_25_0.file)
	local var_25_3 = false

	for iter_25_0 = 0, var_25_2 do
		local var_25_4 = StringTable.CBGJCDIHCE(var_25_0.file, iter_25_0, var_25_0.cols.vehicleRef)

		if var_25_4 == arg_25_1 or var_25_4 == "default" then
			local var_25_5 = tonumber(StringTable.CBGJCDIHCE(var_25_0.file, iter_25_0, var_25_0.cols.hideInUI))

			if var_25_5 and var_25_5 == 0 then
				local var_25_6 = {
					index = tonumber(StringTable.CBGJCDIHCE(var_25_0.file, iter_25_0, var_25_0.cols.index)),
					ref = StringTable.CBGJCDIHCE(var_25_0.file, iter_25_0, var_25_0.cols.ref),
					name = StringTable.CBGJCDIHCE(var_25_0.file, iter_25_0, var_25_0.cols.name),
					lootType = LOOT.itemTypes.VEHICLE_TRACK
				}

				var_25_6.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_TRACK, var_25_6.ref)
				var_25_6.isUnlocked = LOOT.IsUnlocked(arg_25_0, LOOT.itemTypes.VEHICLE_TRACK, var_25_6.ref)

				if var_25_6.index > 1 then
					var_25_6.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_TRACK, var_25_6.lootID)
					var_25_6.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_TRACK, var_25_6.lootID)
					var_25_6.unlockText = Engine.CBBHFCGDIC(StringTable.CBGJCDIHCE(var_25_0.file, iter_25_0, var_25_0.cols.unlockText), SEASON.GetLocalizedName({
						seasonDataNumToUse = var_25_6.season
					}))
				elseif var_25_6.index == 0 then
					var_25_6.isDefault = true
					var_25_6.rarity = 0
				elseif var_25_6.index == 1 then
					var_25_6.isRandom = true
				end

				if not var_25_3 and iter_25_0 > 1 and var_25_6.isUnlocked then
					var_25_3 = true
				end

				table.insert(var_25_1, var_25_6)
			end
		end
	end

	if not var_25_3 then
		table.remove(var_25_1, 2)
	end

	return var_25_1
end

function VEHICLE.GetVehiclePacks(arg_26_0)
	local var_26_0 = CSV.vehiclePacks
	local var_26_1 = {}
	local var_26_2 = StringTable.BFHCAIIDA(var_26_0.file)
	local var_26_3 = false

	for iter_26_0 = 0, var_26_2 do
		local var_26_4 = tonumber(StringTable.CBGJCDIHCE(var_26_0.file, iter_26_0, var_26_0.cols.hideInUI))

		if var_26_4 and var_26_4 == 0 then
			local var_26_5 = {
				ref = StringTable.CBGJCDIHCE(var_26_0.file, iter_26_0, var_26_0.cols.ref),
				index = StringTable.CBGJCDIHCE(var_26_0.file, iter_26_0, var_26_0.cols.index),
				name = StringTable.CBGJCDIHCE(var_26_0.file, iter_26_0, var_26_0.cols.name)
			}
			local var_26_6 = StringTable.CBGJCDIHCE(var_26_0.file, iter_26_0, var_26_0.cols.tracks)

			var_26_5.tracks = split(var_26_6, "|")
			var_26_5.lootType = LOOT.itemTypes.VEHICLE_TRACK
			var_26_5.lootID = LOOT.GetItemID(LOOT.itemTypes.VEHICLE_TRACK, var_26_5.tracks[1])
			var_26_5.isUnlocked = LOOT.IsUnlocked(arg_26_0, LOOT.itemTypes.VEHICLE_TRACK, var_26_5.tracks[1])

			if not var_26_3 and iter_26_0 > 1 and LOOT.IsUnlockedWithID(arg_26_0, var_26_5.lootID) then
				var_26_3 = true
			end

			if tonumber(var_26_5.index) > 1 then
				var_26_5.rarity = LOOT.GetItemQualityWithID(LOOT.itemTypes.VEHICLE_TRACK, var_26_5.lootID)
				var_26_5.season = LOOT.GetItemSeasonByID(LOOT.itemTypes.VEHICLE_TRACK, var_26_5.lootID)
				var_26_5.unlockText = Engine.CBBHFCGDIC(StringTable.CBGJCDIHCE(var_26_0.file, iter_26_0, var_26_0.cols.unlockText), SEASON.GetLocalizedName({
					seasonDataNumToUse = var_26_5.season
				}))
			elseif tonumber(var_26_5.index) == 0 then
				var_26_5.isDefault = true
				var_26_5.rarity = 0
			elseif tonumber(var_26_5.index) == 1 then
				var_26_5.isRandom = true
			end

			table.insert(var_26_1, var_26_5)
		end
	end

	if not var_26_3 then
		table.remove(var_26_1, 2)
	end

	return var_26_1
end

function VEHICLE.GetEquippedTrack(arg_27_0, arg_27_1)
	if RANDOM.IsEnabled(arg_27_0, LOOT.itemTypes.VEHICLE_TRACK, {
		vehicleRef = arg_27_1
	}) then
		return VEHICLE.RANDOM_TRACK_PACK_REF
	else
		local var_27_0 = VEHICLE.GetPlayerData(arg_27_0, arg_27_1)

		if var_27_0.tracks[0]:get() == VEHICLE.RANDOM_TRACK_INDEX then
			return VEHICLE.RANDOM_TRACK_PACK_REF
		else
			return StringTable.DIFCHIGDFB(CSV.vehicleTracks.file, CSV.vehicleTracks.cols.index, var_27_0.tracks[0]:get(), CSV.vehicleTracks.cols.packRef)
		end
	end
end

function VEHICLE.GetTrackPreviewAlias(arg_28_0)
	local var_28_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_28_0.file, var_28_0.cols.ref, arg_28_0, var_28_0.cols.alias)
end

function VEHICLE.GetTrackPack(arg_29_0)
	local var_29_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_29_0.file, var_29_0.cols.ref, arg_29_0, var_29_0.cols.packRef)
end

function VEHICLE.GetAllTracksInPack(arg_30_0)
	local var_30_0 = CSV.vehiclePacks
	local var_30_1 = StringTable.DIFCHIGDFB(var_30_0.file, var_30_0.cols.ref, arg_30_0, var_30_0.cols.tracks)

	return split(var_30_1, "|")
end

function VEHICLE.GetTrackBattlePassPreviewAlias(arg_31_0)
	local var_31_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_31_0.file, var_31_0.cols.ref, arg_31_0, var_31_0.cols.battlePassAlias)
end

function VEHICLE.GetTrackBattlePassPreviewName(arg_32_0)
	local var_32_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_32_0.file, var_32_0.cols.ref, arg_32_0, var_32_0.cols.battlePassName)
end

function VEHICLE.GetTrackName(arg_33_0)
	local var_33_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_33_0.file, var_33_0.cols.ref, arg_33_0, var_33_0.cols.name)
end

function VEHICLE.GetTrackIndex(arg_34_0)
	local var_34_0 = CSV.vehicleTracks

	return StringTable.DIFCHIGDFB(var_34_0.file, var_34_0.cols.ref, arg_34_0, var_34_0.cols.index)
end

function VEHICLE.GetAttributeType(arg_35_0)
	local var_35_0 = CSV.vehicleCamos
	local var_35_1 = StringTable.DIFCHIGDFB(var_35_0.file, var_35_0.cols.ref, arg_35_0, var_35_0.cols.specialAttribute)

	return var_35_1 ~= "" and var_35_1 or false
end

function VEHICLE.GetSpecialAttributeName(arg_36_0)
	return VEHICLE.SpecialAttribute[arg_36_0].name
end

function VEHICLE.GetSpecialAttributeColor(arg_37_0)
	return VEHICLE.SpecialAttribute[arg_37_0].color
end
