LOOT = LOOT or {}
LOOT.IntroSlamDuration = 500
LOOT.RandomizeDuration = 1000
LOOT.emptyID = 0
LOOT.baseQuality = 0
LOOT.createAClassRef = "create_a_class"
LOOT.challengesRef = "challenges"
LOOT.perkSpecialistRef = "perk_specialist"
LOOT.fieldUpgradeProRef = "field_upgrade_pro"
LOOT.AttachIDsMin = 1001000
LOOT.AttachIDsMax = 2000000
LOOT.CamoIDsMin = 2001000
LOOT.CamoIDsMax = 3000000
LOOT.BundleIDsMin = 400000
LOOT.BundleIDsMax = 409999
LOOT.WeaponIDsMin = 0
LOOT.WeaponIDsMax = 9999
LOOT.maxFavorites = 10
LOOT.CurrencyIDs = {
	COD_POINTS = 20,
	SALVAGE = 12,
	KEYS = 11
}
LOOT.itemTypes = {
	SPECIAL = 29,
	OPERATOR_INTRO = 20,
	MISSION = 32,
	FEATURE = 23,
	ATTACHMENT = 9,
	PLAYERCARD = 10,
	OPERATOR = 6,
	SUPER = 17,
	CAMO = 12,
	ROLE = 5,
	CHARM = 14,
	WEAPON = 1,
	BATTLE_PASS = 28,
	EQUIPMENT = 3,
	EMBLEM = 11,
	OPERATOR_EXECUTION = 19,
	VEHICLE_CAMO = 30,
	QUIP = 26,
	COUNT = 33,
	CONSUMABLE = 25,
	SPRAYS = 22,
	TEMP = 21,
	OPERATOR_TAUNT = 18,
	WATCH = 8,
	INVALID = 99,
	GESTURES = 16,
	VEHICLE_TRACK = 33,
	OPERATOR_SKIN = 7,
	BUNDLE = 27,
	STICKER = 15,
	FIRST_PARTY_LICENCE = 24,
	VEHICLE_HORN = 31,
	PERK = 2,
	STREAK = 4,
	RETICLE = 13
}
LOOT.unlockTypes = {
	CHALLENGE = 2,
	LEVEL = 1,
	PURCHASE = 3
}
LOOT.doubleXpTypes = {
	BATTLE_PASS = 3,
	KEY = 4,
	XP = 1,
	WEAPON = 2
}
LOOT.doubleXPType = {
	GLOBAL = 2,
	TOKEN = 1,
	ANY = 3
}
LOOT.DOUBLE_XP_TOKENS = {
	XP_Year = 200041,
	XP_Legendary = 200035,
	XP = 200002,
	XP_Epic = 200038,
	XP_Rare = 200032
}
LOOT.DOUBLE_WEAPON_XP_TOKENS = {
	WeaponXP_Rare = 200033,
	WeaponXP = 200030,
	WeaponXP_Epic = 200039,
	WeaponXP_Legendary = 200036
}
LOOT.DOUBLE_KEY_TOKENS = {
	KeyXP_Rare = 200034,
	KeyXP_Legendary = 200037,
	KeyXP = 200031,
	KeyXP_Epic = 200040
}
LOOT.DOUBLE_BATTLE_PASS_TOKENS = {
	BattlePassXP_Legendary = 200045,
	BattlePassXP_Epic = 200046,
	BattlePassXP = 200043,
	BattlePassXP_Rare = 200044
}
LOOT.typeNames = {
	[LOOT.itemTypes.WEAPON] = "weapon",
	[LOOT.itemTypes.PERK] = "perk",
	[LOOT.itemTypes.EQUIPMENT] = "equipment",
	[LOOT.itemTypes.STREAK] = "killstreak",
	[LOOT.itemTypes.ROLE] = "role",
	[LOOT.itemTypes.OPERATOR] = "operator",
	[LOOT.itemTypes.OPERATOR_SKIN] = "operator_skin",
	[LOOT.itemTypes.WATCH] = "accessory",
	[LOOT.itemTypes.ATTACHMENT] = "attachment",
	[LOOT.itemTypes.PLAYERCARD] = "playercards",
	[LOOT.itemTypes.EMBLEM] = "emblems",
	[LOOT.itemTypes.CAMO] = "camo",
	[LOOT.itemTypes.RETICLE] = "reticle",
	[LOOT.itemTypes.CHARM] = "weapon_charm",
	[LOOT.itemTypes.STICKER] = "sticker",
	[LOOT.itemTypes.GESTURES] = "gestures",
	[LOOT.itemTypes.SUPER] = "super",
	[LOOT.itemTypes.OPERATOR_TAUNT] = "operator_quip",
	[LOOT.itemTypes.OPERATOR_EXECUTION] = "executions",
	[LOOT.itemTypes.OPERATOR_INTRO] = "intro",
	[LOOT.itemTypes.SPRAYS] = "sprays",
	[LOOT.itemTypes.FEATURE] = "feature",
	[LOOT.itemTypes.SPECIAL] = "special",
	[LOOT.itemTypes.FIRST_PARTY_LICENCE] = "firstpartylicence",
	[LOOT.itemTypes.CONSUMABLE] = "consumable",
	[LOOT.itemTypes.QUIP] = "operator_quip",
	[LOOT.itemTypes.BUNDLE] = "bundle",
	[LOOT.itemTypes.BATTLE_PASS] = "battlepass",
	[LOOT.itemTypes.VEHICLE_CAMO] = "vehicle_camo",
	[LOOT.itemTypes.VEHICLE_HORN] = "vehicle_horn",
	[LOOT.itemTypes.VEHICLE_TRACK] = "vehicle_track",
	[LOOT.itemTypes.MISSION] = "mission",
	[LOOT.itemTypes.INVALID] = ""
}

assert(LOOT.itemTypes.COUNT == #LOOT.typeNames)

LOOT.typeNameStrings = {
	[LOOT.itemTypes.WEAPON] = "STORE/BUNDLE_ITEMS_INCLUDED_WEAPON",
	[LOOT.itemTypes.PERK] = "STORE/BUNDLE_ITEMS_INCLUDED_PERK",
	[LOOT.itemTypes.EQUIPMENT] = "STORE/BUNDLE_ITEMS_INCLUDED_EQUIPMENT",
	[LOOT.itemTypes.STREAK] = "STORE/BUNDLE_ITEMS_INCLUDED_KILLSTREAK",
	[LOOT.itemTypes.ROLE] = "STORE/BUNDLE_ITEMS_INCLUDED_ROLE",
	[LOOT.itemTypes.OPERATOR] = "STORE/BUNDLE_ITEMS_INCLUDED_OPERATOR",
	[LOOT.itemTypes.OPERATOR_SKIN] = "STORE/BUNDLE_ITEMS_INCLUDED_OPERATOR_SKIN",
	[LOOT.itemTypes.WATCH] = "STORE/BUNDLE_ITEMS_INCLUDED_ACCESSORY",
	[LOOT.itemTypes.ATTACHMENT] = "STORE/BUNDLE_ITEMS_INCLUDED_ATTACHMENT",
	[LOOT.itemTypes.PLAYERCARD] = "STORE/BUNDLE_ITEMS_INCLUDED_PLAYERCARD",
	[LOOT.itemTypes.EMBLEM] = "STORE/BUNDLE_ITEMS_INCLUDED_EMBLEM",
	[LOOT.itemTypes.CAMO] = "STORE/BUNDLE_ITEMS_INCLUDED_CAMO",
	[LOOT.itemTypes.RETICLE] = "STORE/BUNDLE_ITEMS_INCLUDED_RETICLE",
	[LOOT.itemTypes.CHARM] = "STORE/BUNDLE_ITEMS_INCLUDED_WEAPON_CHARM",
	[LOOT.itemTypes.STICKER] = "STORE/BUNDLE_ITEMS_INCLUDED_STICKER",
	[LOOT.itemTypes.GESTURES] = "STORE/BUNDLE_ITEMS_INCLUDED_GESTURE",
	[LOOT.itemTypes.SUPER] = "STORE/BUNDLE_ITEMS_INCLUDED_SUPER",
	[LOOT.itemTypes.OPERATOR_TAUNT] = "STORE/BUNDLE_ITEMS_INCLUDED_OPERATOR_QUIP",
	[LOOT.itemTypes.OPERATOR_EXECUTION] = "STORE/BUNDLE_ITEMS_INCLUDED_EXECUTION",
	[LOOT.itemTypes.OPERATOR_INTRO] = "STORE/BUNDLE_ITEMS_INCLUDED_INTRO",
	[LOOT.itemTypes.SPRAYS] = "STORE/BUNDLE_ITEMS_INCLUDED_SPRAY",
	[LOOT.itemTypes.FEATURE] = "STORE/BUNDLE_ITEMS_INCLUDED_FEATURE",
	[LOOT.itemTypes.SPECIAL] = "STORE/BUNDLE_ITEMS_INCLUDED_SPECIAL",
	[LOOT.itemTypes.FIRST_PARTY_LICENCE] = "STORE/BUNDLE_ITEMS_INCLUDED_FIRSTPARTYLICENCE",
	[LOOT.itemTypes.CONSUMABLE] = "STORE/BUNDLE_ITEMS_INCLUDED_CONSUMABLE",
	[LOOT.itemTypes.QUIP] = "STORE/BUNDLE_ITEMS_INCLUDED_OPERATOR_QUIP",
	[LOOT.itemTypes.BUNDLE] = "STORE/BUNDLE_ITEMS_INCLUDED_BUNDLE",
	[LOOT.itemTypes.BATTLE_PASS] = "STORE/BUNDLE_ITEMS_INCLUDED_BATTLEPASS",
	[LOOT.itemTypes.VEHICLE_CAMO] = "STORE/BUNDLE_ITEMS_INCLUDED_VEHICLE_CAMO",
	[LOOT.itemTypes.VEHICLE_HORN] = "STORE/BUNDLE_ITEMS_INCLUDED_VEHICLE_HORN",
	[LOOT.itemTypes.VEHICLE_TRACK] = "STORE/BUNDLE_ITEMS_INCLUDED_VEHICLE_TRACK",
	[LOOT.itemTypes.MISSION] = "STORE/BUNDLE_ITEMS_INCLUDED_MISSION",
	[LOOT.itemTypes.INVALID] = ""
}

assert(LOOT.itemTypes.COUNT == #LOOT.typeNameStrings)

LOOT.typeCSV = {
	[LOOT.itemTypes.WATCH] = CSV.watches,
	[LOOT.itemTypes.PLAYERCARD] = CSV.callingCards,
	[LOOT.itemTypes.EMBLEM] = CSV.emblems,
	[LOOT.itemTypes.CHARM] = CSV.charms,
	[LOOT.itemTypes.STICKER] = CSV.stickers,
	[LOOT.itemTypes.GESTURES] = CSV.gestures,
	[LOOT.itemTypes.SPRAYS] = CSV.sprays,
	[LOOT.itemTypes.VEHICLE_CAMO] = CSV.vehicleCamos,
	[LOOT.itemTypes.VEHICLE_HORN] = CSV.vehicleHorns,
	[LOOT.itemTypes.VEHICLE_TRACK] = CSV.vehicleTracks
}
LOOT.Rarity = {
	EPIC = 3,
	COMMON = 1,
	BASE = 0,
	RARE = 2,
	LEGENDARY = 4
}
LOOT.qualities = {
	{
		name = "LOOT_MP/QUALITY_0",
		image = "icon_rarity_1",
		border = "loot_card_border_0",
		color = SWATCHES.itemRarity.qualityBase,
		darkcolor = SWATCHES.itemRarity.qualityAltBase
	},
	{
		name = "LOOT_MP/QUALITY_1",
		image = "icon_rarity_2",
		border = "loot_card_border_1",
		color = SWATCHES.itemRarity.quality0,
		darkcolor = SWATCHES.itemRarity.qualityAlt0
	},
	{
		name = "LOOT_MP/QUALITY_2",
		image = "icon_rarity_3",
		border = "loot_card_border_2",
		color = SWATCHES.itemRarity.quality1,
		darkcolor = SWATCHES.itemRarity.qualityAlt1
	},
	{
		name = "LOOT_MP/QUALITY_3",
		image = "icon_rarity_4",
		border = "loot_card_border_3",
		color = SWATCHES.itemRarity.quality2,
		darkcolor = SWATCHES.itemRarity.qualityAlt2
	},
	{
		name = "LOOT_MP/QUALITY_4",
		image = "icon_rarity_5",
		border = "loot_card_border_4",
		color = SWATCHES.itemRarity.quality3,
		darkcolor = SWATCHES.itemRarity.qualityAlt3
	}
}
LOOT.seasonsSortingOptions = {
	RECENT_FIRST = "season_recent_first",
	OLD_FIRST = "season_old_first",
	NONE = "season_none"
}
LOOT.seasonSortStrings = {
	season_none = LOOT.seasonsSortingOptions.NONE,
	season_recent_first = LOOT.seasonsSortingOptions.RECENT_FIRST,
	season_old_first = LOOT.seasonsSortingOptions.OLD_FIRST
}
LOOT.raritySortingOptions = {
	HIGH_FIRST = "rarity_high_first",
	LOW_FIRST = "rarity_low_first",
	NONE = "rarity_none"
}
LOOT.raritySortStrings = {
	rarity_none = LOOT.raritySortingOptions.NONE,
	rarity_low_first = LOOT.raritySortingOptions.LOW_FIRST,
	rarity_high_first = LOOT.raritySortingOptions.HIGH_FIRST
}
LOOT.officerSortingOptions = {
	OFFICER_FIRST = "officer_first",
	NONE = "officer_none"
}
LOOT.officerSortStrings = {
	officer_none = LOOT.officerSortingOptions.NONE,
	officer_first = LOOT.officerSortingOptions.OFFICER_FIRST
}
LOOT.lockedSortingOptions = {
	HIDE = 2,
	SHOW = 1
}
LOOT.OperatorLootTypes = {
	Skin = LOOT.itemTypes.OPERATOR_SKIN,
	Taunt = LOOT.itemTypes.OPERATOR_TAUNT,
	Execution = LOOT.itemTypes.OPERATOR_EXECUTION
}

function LOOT.GetPlayerPreferenceForLootType(arg_1_0, arg_1_1)
	local var_1_0 = PlayerData.BFFBGAJGD(arg_1_0, CoD.StatsGroup.NonGame).sortPreferences

	if arg_1_1 == LOOT.itemTypes.EMBLEM then
		return var_1_0.emblemSortPreference
	elseif arg_1_1 == LOOT.itemTypes.PLAYERCARD then
		return var_1_0.callingcardSortPreference
	elseif arg_1_1 == LOOT.itemTypes.GESTURES then
		return var_1_0.gesturesSortPreference
	elseif arg_1_1 == LOOT.itemTypes.CHARM then
		return var_1_0.charmsSortPreference
	elseif arg_1_1 == LOOT.itemTypes.STICKER then
		return var_1_0.stickerSortPreference
	elseif arg_1_1 == LOOT.itemTypes.VEHICLE_CAMO then
		return var_1_0.vehicleCamoSortPreference
	end
end

function LOOT.SetupSortingBehavior(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = LOOT.GetPlayerPreferenceForLootType(arg_2_1, arg_2_2)

	if var_2_0 then
		arg_2_0.raritySortingType = LOOT.raritySortStrings[var_2_0.raritySortPreference:get()]

		if Dvar.IBEGCHEFE("NRTLNOPOSM") then
			arg_2_0.seasonsSortingType = LOOT.seasonSortStrings[var_2_0.seasonSortPreference:get()]
		else
			arg_2_0.seasonsSortingType = LOOT.seasonsSortingOptions.NONE
		end

		if arg_2_2 == LOOT.itemTypes.EMBLEM then
			arg_2_0.officerSortingType = LOOT.officerSortStrings[var_2_0.officerSortPreference:get()]
		end
	end

	arg_2_0.lockedSortingType = LUI.DataSourceInControllerModel.new("frontend.MP.players.lockedSortingType"):GetValue(arg_2_1) or LOOT.lockedSortingOptions.HIDE
end

function LOOT.GetFavoritesPlayerDataForType(arg_3_0)
	local var_3_0 = Engine.IJEBHJIJF()

	if CONDITIONS.IsUserSignedInDemonware(var_3_0) then
		local var_3_1 = PlayerData.BFFBGAJGD(var_3_0, LOADOUT.GetLoadoutStatsGroup()).customizationFavorites

		if arg_3_0 == LOOT.itemTypes.CAMO then
			return var_3_1.favoriteCamos
		elseif arg_3_0 == LOOT.itemTypes.RETICLE then
			return var_3_1.favoriteReticles
		elseif arg_3_0 == LOOT.itemTypes.CHARM then
			return var_3_1.favoriteCharms
		elseif arg_3_0 == LOOT.itemTypes.STICKER then
			return var_3_1.favoriteStickers
		elseif arg_3_0 == LOOT.itemTypes.PLAYERCARD then
			return var_3_1.favoriteCallingCards
		elseif arg_3_0 == LOOT.itemTypes.EMBLEM then
			return var_3_1.favoriteEmblems
		elseif arg_3_0 == LOOT.itemTypes.GESTURES then
			return var_3_1.favoriteGestures
		elseif arg_3_0 == LOOT.itemTypes.SPRAYS then
			return var_3_1.favoriteSprays
		elseif arg_3_0 == LOOT.itemTypes.WATCH then
			return var_3_1.favoriteWatches
		elseif arg_3_0 == LOOT.itemTypes.VEHICLE_CAMO then
			return var_3_1.favoriteVehicleCamos
		end
	end

	return false
end

function LOOT.GetFavoritesForType(arg_4_0)
	local var_4_0 = LOOT.GetFavoritesPlayerDataForType(arg_4_0)
	local var_4_1 = {}
	local var_4_2 = 0

	if var_4_0 then
		for iter_4_0 = 0, LOOT.maxFavorites - 1 do
			local var_4_3 = var_4_0[iter_4_0]:get()

			if var_4_3 ~= 0 then
				assert(arg_4_0 == LOOT.GetTypeForID(var_4_3))

				local var_4_4 = LOOT.GetItemRef(arg_4_0, var_4_3)

				if var_4_4 ~= nil and var_4_4 ~= "" then
					var_4_1[var_4_4] = true
					var_4_2 = var_4_2 + 1
				end
			end
		end
	end

	var_4_1.count = var_4_2

	return var_4_1
end

function LOOT.AddFavoriteForType(arg_5_0, arg_5_1)
	local var_5_0 = LOOT.GetFavoritesPlayerDataForType(arg_5_0)
	local var_5_1 = LOOT.GetItemID(arg_5_0, arg_5_1)

	if arg_5_0 ~= LOOT.GetTypeForID(var_5_1) then
		return false
	end

	if var_5_0 then
		for iter_5_0 = 0, LOOT.maxFavorites - 1 do
			if var_5_0[iter_5_0]:get() == 0 then
				var_5_0[iter_5_0]:set(var_5_1)

				return true
			end
		end
	end

	return false
end

function LOOT.RemoveFavoriteForType(arg_6_0, arg_6_1)
	local var_6_0 = LOOT.GetFavoritesPlayerDataForType(arg_6_0)
	local var_6_1 = LOOT.GetItemID(arg_6_0, arg_6_1)

	if var_6_0 then
		for iter_6_0 = 0, LOOT.maxFavorites - 1 do
			if var_6_1 == var_6_0[iter_6_0]:get() then
				var_6_0[iter_6_0]:set(0)

				return true
			end
		end
	end

	return false
end

function LOOT.RemoveFavoriteByIndex(arg_7_0, arg_7_1)
	LOOT.GetFavoritesPlayerDataForType(arg_7_0)[arg_7_1]:set(0)

	return true
end

function LOOT.GetTypeForID(arg_8_0)
	arg_8_0 = tonumber(arg_8_0)

	if arg_8_0 then
		local var_8_0 = StringTable.BFHCAIIDA(CSV.lootMaster.file)

		for iter_8_0 = 1, var_8_0 - 1 do
			local var_8_1 = CSV.ReadRow(CSV.lootMaster, iter_8_0)

			if var_8_1 and var_8_1.rangeStart and #var_8_1.rangeStart > 0 and var_8_1.rangeEnd and #var_8_1.rangeEnd > 0 and arg_8_0 >= tonumber(var_8_1.rangeStart) and arg_8_0 <= tonumber(var_8_1.rangeEnd) then
				return tonumber(var_8_1.typeValue)
			end
		end

		assert(false, "loot ID " .. arg_8_0 .. " is in an invalid range, please check loot_master.csv for valid ranges.")
	end
end

function LOOT.IsUnlocked(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = LOOT.GetItemID(arg_9_1, arg_9_2)

	if var_9_0 then
		return LOOT.IsUnlockedWithID(arg_9_0, var_9_0)
	else
		DebugPrint("Attempt to check unlock state for item " .. arg_9_2 .. " which is not included in loot csvs.")

		return true
	end
end

function LOOT.IsUnlockedWithID(arg_10_0, arg_10_1)
	if arg_10_1 ~= nil then
		arg_10_1 = tonumber(arg_10_1)

		if (Engine.BGAAHHAGAC() or Engine.BHICADFIHA()) and Dvar.IBEGCHEFE("OLKMKMTKRO") then
			return true
		elseif Engine.BACCCIHGDG() and Engine.CJJAFGIFAC(arg_10_0) then
			return Loot.DEBEIFJEEG(arg_10_0, arg_10_1) > 0
		else
			return LOOT.IsItemDefault(arg_10_1)
		end
	end

	return false
end

function LOOT.IsItemDefault(arg_11_0)
	if arg_11_0 ~= nil then
		arg_11_0 = tonumber(arg_11_0)

		local var_11_0 = StringTable.BFHCAIIDA(CSV.initialItems.file) - 1

		for iter_11_0 = 0, var_11_0 - 1 do
			local var_11_1 = StringTable.CBGJCDIHCE(CSV.initialItems.file, iter_11_0, CSV.initialItems.cols.lootID)

			if arg_11_0 == tonumber(var_11_1) then
				return true
			end
		end
	end

	return false
end

function LOOT.GetIDFileForType(arg_12_0, arg_12_1)
	arg_12_1 = arg_12_1 or {}

	assert(arg_12_0, "Attempt to get a file with a nil type.")

	local var_12_0 = LOOT.typeNames[arg_12_0]

	assert(var_12_0, "Attempt to get ID file for type " .. arg_12_0 .. " which either doesn't exist or doesn't have an associated file.")

	if arg_12_0 == LOOT.itemTypes.ATTACHMENT and arg_12_1.weaponRef then
		return CSV.attachmentIDs.GetFile(arg_12_1.weaponRef)
	elseif arg_12_0 == LOOT.itemTypes.CAMO and arg_12_1.weaponRef then
		return CSV.camosIDs.GetFile(arg_12_1.weaponRef)
	else
		return CSV.lootIDs.filePrefix .. var_12_0 .. CSV.lootIDs.fileSuffix
	end
end

function LOOT.GetIDFileForTypeName(arg_13_0)
	assert(arg_13_0, "Attempt to get ID file for type " .. arg_13_0 .. " which either doesn't exist or doesn't have an associated file.")

	return CSV.lootIDs.filePrefix .. arg_13_0 .. CSV.lootIDs.fileSuffix
end

function LOOT.GetLootFileForID(arg_14_0)
	local var_14_0 = StringTable.BFHCAIIDA(CSV.lootMaster.file)

	for iter_14_0 = 1, var_14_0 - 1 do
		local var_14_1 = tonumber(StringTable.CBGJCDIHCE(CSV.lootMaster.file, iter_14_0, CSV.lootMaster.cols.rangeStart))
		local var_14_2 = tonumber(StringTable.CBGJCDIHCE(CSV.lootMaster.file, iter_14_0, CSV.lootMaster.cols.rangeEnd))

		if var_14_1 <= arg_14_0 and arg_14_0 <= var_14_2 then
			local var_14_3 = StringTable.CBGJCDIHCE(CSV.lootMaster.file, iter_14_0, CSV.lootMaster.cols.typeName)

			return LOOT.GetIDFileForTypeName(var_14_3)
		end
	end

	return nil
end

function LOOT.GetBaseWeaponRefForID(arg_15_0)
	local var_15_0 = StringTable.BFHCAIIDA(CSV.lootMaster.file)

	for iter_15_0 = 1, var_15_0 - 1 do
		local var_15_1 = tonumber(StringTable.CBGJCDIHCE(CSV.lootMaster.file, iter_15_0, CSV.lootMaster.cols.rangeStart))
		local var_15_2 = tonumber(StringTable.CBGJCDIHCE(CSV.lootMaster.file, iter_15_0, CSV.lootMaster.cols.rangeEnd))

		if var_15_1 <= arg_15_0 and arg_15_0 <= var_15_2 then
			return StringTable.CBGJCDIHCE(CSV.lootMaster.file, iter_15_0, CSV.lootMaster.cols.baseWeaponRef)
		end
	end

	return nil
end

function LOOT.GetBaseWeaponItemID(arg_16_0)
	local var_16_0 = {
		{
			col = CSV.weaponIDs.cols.baseRef,
			key = arg_16_0
		},
		{
			col = CSV.weaponIDs.cols.quality,
			key = tostring(LOOT.baseQuality)
		}
	}
	local var_16_1 = StringTable.CEBAGDAEJJ(CSV.weaponIDs.file, var_16_0, CSV.lootIDs.cols.index)

	if not var_16_1 or #var_16_1 == 0 then
		DebugPrint("Weapon " .. arg_16_0 .. " is missing from weapon_ids.csv. Defaulting ID to 1.")

		return 1
	end

	return tonumber(var_16_1)
end

function LOOT.GetBaseWeaponIDFromAttachmentLootID(arg_17_0)
	local var_17_0 = LOOT.GetBaseWeaponRefForID(arg_17_0)

	if var_17_0 and #var_17_0 > 0 then
		return LOOT.GetBaseWeaponItemID(var_17_0)
	end

	return nil
end

function LOOT.GetItemID(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = LOOT.GetIDFileForType(arg_18_0, arg_18_2)

	if arg_18_0 == LOOT.itemTypes.WEAPON then
		return LOOT.GetBaseWeaponItemID(arg_18_1)
	else
		local var_18_1 = StringTable.DIFCHIGDFB(var_18_0, CSV.lootIDs.cols.ref, arg_18_1, CSV.lootIDs.cols.index)

		if not var_18_1 or #var_18_1 == 0 then
			DebugPrint("Item " .. arg_18_1 .. " is missing from its ID table" .. var_18_0 .. ". Defaulting ID to 1.")

			return 1
		end

		return tonumber(var_18_1)
	end
end

function LOOT.GetItemRef(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = LOOT.GetIDFileForType(arg_19_0, arg_19_2)

	return StringTable.DIFCHIGDFB(var_19_0, CSV.lootIDs.cols.index, arg_19_1, CSV.lootIDs.cols.ref)
end

function LOOT.GetItemQuality(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_2 then
		if tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_20_2, CSV.bundleIDs.cols.isCollection)) == 1 then
			return LOOT.Rarity.RARE
		else
			return LOOT.GetItemQualityWithID(arg_20_0, arg_20_2)
		end
	else
		local var_20_0 = LOOT.GetIDFileForType(arg_20_0)

		if arg_20_0 == LOOT.itemTypes.BATTLE_PASS then
			return tonumber(StringTable.DIFCHIGDFB(var_20_0, CSV.battlePassIDs.cols.ref, arg_20_1, CSV.battlePassIDs.cols.rarity)) or 0
		elseif arg_20_0 == LOOT.itemTypes.SPECIAL then
			return tonumber(StringTable.DIFCHIGDFB(var_20_0, CSV.specialIDs.cols.ref, arg_20_1, CSV.specialIDs.cols.rarity)) or 0
		else
			return tonumber(StringTable.DIFCHIGDFB(var_20_0, CSV.lootIDs.cols.ref, arg_20_1, CSV.lootIDs.cols.quality)) or 0
		end
	end
end

function LOOT.GetItemQualityWithID(arg_21_0, arg_21_1)
	local var_21_0 = LOOT.GetIDFileForType(arg_21_0)

	if arg_21_0 == LOOT.itemTypes.BATTLE_PASS then
		return tonumber(StringTable.DIFCHIGDFB(var_21_0, CSV.battlePassIDs.cols.id, arg_21_1, CSV.battlePassIDs.cols.rarity)) or 0
	elseif arg_21_0 == LOOT.itemTypes.SPECIAL then
		return tonumber(StringTable.DIFCHIGDFB(var_21_0, CSV.specialIDs.cols.id, arg_21_1, CSV.specialIDs.cols.rarity)) or 0
	else
		return tonumber(StringTable.DIFCHIGDFB(var_21_0, CSV.lootIDs.cols.index, arg_21_1, CSV.lootIDs.cols.quality)) or 0
	end
end

function LOOT.GetItemCost(arg_22_0, arg_22_1)
	local var_22_0 = LOOT.GetIDFileForType(arg_22_0)

	return tonumber(StringTable.DIFCHIGDFB(var_22_0, CSV.lootIDs.cols.ref, arg_22_1, CSV.lootIDs.cols.cost))
end

function LOOT.GetFeatureItemImage(arg_23_0)
	if Engine.DDJFBBJAIG() then
		return StringTable.DIFCHIGDFB(CSV.featureIDs.file, CSV.featureIDs.cols.ref, arg_23_0, CSV.featureIDs.cols.image)
	else
		return StringTable.DIFCHIGDFB(CSV.featureIDs.file, CSV.featureIDs.cols.ref, arg_23_0, CSV.featureIDs.cols.hudImage)
	end
end

function LOOT.GetFeatureItemName(arg_24_0)
	if arg_24_0 == "bp_boost" then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.featureIDs.file, CSV.featureIDs.cols.ref, arg_24_0, CSV.featureIDs.cols.name), SEASON.GetCurrentSeason())
	else
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.featureIDs.file, CSV.featureIDs.cols.ref, arg_24_0, CSV.featureIDs.cols.name))
	end
end

function LOOT.GetFeatureItemDesc(arg_25_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.featureIDs.file, CSV.featureIDs.cols.ref, arg_25_0, CSV.featureIDs.cols.desc))
end

function LOOT.IsFeatureOperatorChallenge(arg_26_0)
	local var_26_0 = StringTable.DIFCHIGDFB(CSV.featureIDs.file, CSV.featureIDs.cols.ref, arg_26_0, CSV.featureIDs.cols.operatorSkinRef)

	return var_26_0 and #var_26_0 > 0 and true or false
end

function LOOT.GetFeatureOperatorSkinRef(arg_27_0)
	return (StringTable.DIFCHIGDFB(CSV.featureIDs.file, CSV.featureIDs.cols.ref, arg_27_0, CSV.featureIDs.cols.operatorSkinRef))
end

function LOOT.GetConsumableItemName(arg_28_0)
	return StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.ref, arg_28_0, CSV.consumablesIDs.cols.name)
end

function LOOT.GetConsumableItemImage(arg_29_0)
	return StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.ref, arg_29_0, CSV.consumablesIDs.cols.image)
end

function LOOT.GetSpecialItemName(arg_30_0)
	return StringTable.DIFCHIGDFB(CSV.specialIDs.file, CSV.specialIDs.cols.ref, arg_30_0, CSV.specialIDs.cols.name)
end

function LOOT.GetSpecialItemImage(arg_31_0)
	return StringTable.DIFCHIGDFB(CSV.specialIDs.file, CSV.specialIDs.cols.ref, arg_31_0, CSV.specialIDs.cols.image)
end

function LOOT.IsValidItemType(arg_32_0)
	if arg_32_0 == nil or arg_32_0 == LOOT.itemTypes.INVALID then
		return false
	end

	return true
end

function LOOT.GetItemName(arg_33_0, arg_33_1, arg_33_2)
	if not LOOT.IsValidItemType(arg_33_0) then
		return ""
	end

	if arg_33_0 == LOOT.itemTypes.WEAPON then
		if arg_33_2 then
			return WEAPON.GetLootWeaponName(arg_33_1, arg_33_2)
		else
			return WEAPON.GetName(arg_33_1)
		end
	elseif arg_33_0 == LOOT.itemTypes.PERK then
		return PERK.GetName(arg_33_1)
	elseif arg_33_0 == LOOT.itemTypes.EQUIPMENT then
		return EQUIPMENT.GetName(arg_33_1)
	elseif arg_33_0 == LOOT.itemTypes.STREAK then
		return STREAK.GetName(arg_33_1)
	elseif arg_33_0 == LOOT.itemTypes.ROLE then
		return Engine.CBBHFCGDIC(MUNITION.GetRoleName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.OPERATOR then
		return Engine.CBBHFCGDIC(OPERATOR.GetName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.OPERATOR_SKIN then
		return Engine.CBBHFCGDIC(OPERATOR.GetSkinName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.WATCH then
		return Engine.CBBHFCGDIC(WATCH.GetWatchName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.ATTACHMENT then
		return ATTACHMENT.GetName(arg_33_1)
	elseif arg_33_0 == LOOT.itemTypes.PLAYERCARD then
		return Engine.CBBHFCGDIC(CallingCardUtils.GetCardName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.EMBLEM then
		return Engine.CBBHFCGDIC(EmblemEditorUtils.GetEmblemName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.CAMO then
		return Engine.CBBHFCGDIC(WEAPON.GetCamoName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.RETICLE then
		return Engine.CBBHFCGDIC(WEAPON.GetReticleName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.CHARM then
		return Engine.CBBHFCGDIC(WEAPON.GetCharmName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.STICKER then
		return Engine.CBBHFCGDIC(WEAPON.GetStickerName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.GESTURES then
		return Engine.CBBHFCGDIC(GESTURES.GetNameForRef(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.SUPER then
		return Engine.CBBHFCGDIC(SUPER.GetName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.OPERATOR_TAUNT then
		return Engine.CBBHFCGDIC(OPERATOR.GetTauntName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.OPERATOR_EXECUTION then
		return Engine.CBBHFCGDIC(OPERATOR.GetExecutionName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.OPERATOR_INTRO then
		return Engine.CBBHFCGDIC(OPERATOR.GetIntroName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.SPRAYS then
		return Engine.CBBHFCGDIC(SPRAYS.GetNameForRef(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.FEATURE then
		return LOOT.GetFeatureItemName(arg_33_1)
	elseif arg_33_0 == LOOT.itemTypes.CONSUMABLE then
		return Engine.CBBHFCGDIC(LOOT.GetConsumableItemName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.QUIP then
		return Engine.CBBHFCGDIC(OPERATOR.GetQuipName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.BATTLE_PASS then
		return Engine.CBBHFCGDIC(BATTLEPASS.GetItemName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.SPECIAL then
		return Engine.CBBHFCGDIC(LOOT.GetSpecialItemName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.VEHICLE_CAMO then
		return Engine.CBBHFCGDIC(VEHICLE.GetLootName(arg_33_0, arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.VEHICLE_HORN then
		return Engine.CBBHFCGDIC(VEHICLE.GetLootName(arg_33_0, arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.VEHICLE_TRACK then
		local var_33_0 = VEHICLE.GetTrackBattlePassPreviewName(arg_33_1)

		if not var_33_0 or var_33_0 == "" then
			var_33_0 = VEHICLE.GetLootName(arg_33_0, arg_33_1)
		end

		return Engine.CBBHFCGDIC(var_33_0)
	elseif arg_33_0 == LOOT.itemTypes.MISSION then
		return Engine.CBBHFCGDIC(MissionUtils.GetMissionName(arg_33_1))
	elseif arg_33_0 == LOOT.itemTypes.BUNDLE then
		if tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_2, CSV.bundleIDs.cols.isCollection)) == 1 then
			return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_2, CSV.bundleIDs.cols.collectionName))
		else
			return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_33_1, CSV.bundleIDs.cols.name))
		end
	else
		assert(false, "Loot item type not supported. Please complete the loot item definition in csv file.")
	end
end

function LOOT.GetItemImage(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_0 == LOOT.itemTypes.WEAPON then
		if arg_34_2 then
			return WEAPON.GetLootVariantImage(arg_34_1, arg_34_2)
		else
			return WEAPON.GetImage(arg_34_1)
		end
	elseif arg_34_0 == LOOT.itemTypes.PERK then
		return PERK.GetImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.EQUIPMENT then
		return EQUIPMENT.GetImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.STREAK then
		return STREAK.GetImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.ROLE then
		return MUNITION.GetRoleImageLarge(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.OPERATOR then
		if arg_34_2 then
			return OPERATOR.GetLootIcon(arg_34_1)
		else
			return OPERATOR.GetIcon(arg_34_1)
		end
	elseif arg_34_0 == LOOT.itemTypes.OPERATOR_SKIN then
		if arg_34_2 then
			return OPERATOR.GetLootSkinImage(arg_34_1)
		else
			return OPERATOR.GetSkinIcon(arg_34_1)
		end
	elseif arg_34_0 == LOOT.itemTypes.WATCH then
		if arg_34_2 then
			return WATCH.GetWatchLootIcon(arg_34_1)
		else
			return WATCH.GetWatchIcon(arg_34_1)
		end
	elseif arg_34_0 == LOOT.itemTypes.ATTACHMENT then
		return ATTACHMENT.GetImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.PLAYERCARD then
		return CallingCardUtils.GetCardImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.EMBLEM then
		return EmblemEditorUtils.GetEmblemImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.CAMO then
		return WEAPON.GetCamoImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.RETICLE then
		return WEAPON.GetReticleImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.CHARM then
		return WEAPON.GetCharmImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.STICKER then
		return WEAPON.GetStickerImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.GESTURES then
		if arg_34_2 then
			return GESTURES.GetLootImageFromRef(arg_34_1)
		else
			return GESTURES.GetImageForRef(arg_34_1)
		end
	elseif arg_34_0 == LOOT.itemTypes.SUPER then
		return SUPER.GetImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.OPERATOR_TAUNT then
		return OPERATOR.GetTauntIcon(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.OPERATOR_EXECUTION then
		if arg_34_2 then
			return OPERATOR.GetExecutionLootImage(arg_34_1)
		else
			return OPERATOR.GetExecutionIcon(arg_34_1)
		end
	elseif arg_34_0 == LOOT.itemTypes.OPERATOR_INTRO then
		return OPERATOR.GetIntroIcon(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.SPRAYS then
		return SPRAYS.GetImageForRef(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.FEATURE then
		return LOOT.GetFeatureItemImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.CONSUMABLE then
		return LOOT.GetConsumableItemImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.QUIP then
		if arg_34_2 then
			return OPERATOR.GetQuipLootImage(arg_34_1)
		else
			return OPERATOR.GetQuipIcon(arg_34_1)
		end
	elseif arg_34_0 == LOOT.itemTypes.BATTLE_PASS then
		return BATTLEPASS.GetItemImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.SPECIAL then
		return LOOT.GetSpecialItemImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.VEHICLE_CAMO then
		return VEHICLE.GetLootImage(arg_34_0, arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.VEHICLE_HORN then
		return VEHICLE.GetLootImage(arg_34_0, arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.VEHICLE_TRACK then
		return VEHICLE.GetLootImage(arg_34_0, arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.MISSION then
		return MissionUtils.GetMissionImage(arg_34_1)
	elseif arg_34_0 == LOOT.itemTypes.BUNDLE then
		if tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_34_2, CSV.bundleIDs.cols.isCollection)) == 1 then
			return StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_34_2, CSV.bundleIDs.cols.collectionImage)
		else
			return "placeholder_x"
		end
	else
		assert(false, "Loot item type not supported. Please complete the item definition in csv file")

		return ""
	end
end

function LOOT.GetItemProgressionImage(arg_35_0, arg_35_1)
	if arg_35_0 == LOOT.itemTypes.WEAPON then
		return WEAPON.GetProgressionImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.PERK then
		return PERK.GetProgressionImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.EQUIPMENT then
		return EQUIPMENT.GetProgressionImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.STREAK then
		return STREAK.GetProgressionImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.OPERATOR then
		return OPERATOR.GetIcon(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.ATTACHMENT then
		return ATTACHMENT.GetImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.PLAYERCARD then
		return CallingCardUtils.GetCardImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.EMBLEM then
		return EmblemEditorUtils.GetEmblemImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.CAMO then
		return WEAPON.GetCamoImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.RETICLE then
		return WEAPON.GetReticleImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.SUPER then
		return SUPER.GetProgressionImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.ROLE then
		return MUNITION.GetProgressionImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.FEATURE then
		return LOOT.GetFeatureItemImage(arg_35_1)
	elseif arg_35_0 == LOOT.itemTypes.CONSUMABLE then
		return LOOT.GetConsumableItemImage(arg_35_1)
	else
		DebugPrint("Loot item type:" .. tostring(arg_35_0) .. "not supported in GetItemProgressionImage. Please fix it.")
	end
end

function LOOT.GetItemSeason(arg_36_0, arg_36_1)
	local var_36_0 = LOOT.GetIDFileForType(arg_36_0)
	local var_36_1 = StringTable.DIFCHIGDFB(var_36_0, CSV.lootIDs.cols.ref, arg_36_1, CSV.lootIDs.cols.license)
	local var_36_2 = StringTable.DIFCHIGDFB(var_36_0, CSV.lootIDs.cols.ref, arg_36_1, CSV.lootIDs.cols.isPremium)

	return LOOT.GetSeasonFromLicense(var_36_1, var_36_2)
end

function LOOT.GetItemSeasonByID(arg_37_0, arg_37_1)
	local var_37_0 = LOOT.GetIDFileForType(arg_37_0)
	local var_37_1 = StringTable.DIFCHIGDFB(var_37_0, CSV.lootIDs.cols.index, arg_37_1, CSV.lootIDs.cols.license)
	local var_37_2 = StringTable.DIFCHIGDFB(var_37_0, CSV.lootIDs.cols.index, arg_37_1, CSV.lootIDs.cols.isPremium)

	return LOOT.GetSeasonFromLicense(var_37_1, var_37_2)
end

function LOOT.GetSeasonFromLicense(arg_38_0, arg_38_1)
	local var_38_0 = tonumber(string.sub(arg_38_0, 1, 1)) or 0
	local var_38_1 = tonumber(string.sub(arg_38_0, 2)) or 0

	if tonumber(arg_38_0) == 99 then
		var_38_0 = 0
	end

	local var_38_2 = arg_38_1 == "1" or var_38_0 > SEASON.GetCurrentSeason() or tonumber(arg_38_0) == 99

	return var_38_0, var_38_1, var_38_2
end

function LOOT.GetItemDescription(arg_39_0, arg_39_1)
	if not LOOT.IsValidItemType(arg_39_0) then
		assert(false, "Loot item type not supported")
	end

	if arg_39_0 == LOOT.itemTypes.WEAPON then
		return WEAPON.GetDesc(arg_39_1)
	elseif arg_39_0 == LOOT.itemTypes.PERK then
		return Cac.GetPerkDesc(arg_39_1)
	elseif arg_39_0 == LOOT.itemTypes.EQUIPMENT then
		return EQUIPMENT.GetDesc(arg_39_1)
	elseif arg_39_0 == LOOT.itemTypes.STREAK then
		return Cac.GetStreakDesc(arg_39_1)
	elseif arg_39_0 == LOOT.itemTypes.ROLE then
		return Engine.CBBHFCGDIC(MUNITION.GetProgressionDesc(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.OPERATOR then
		return Engine.CBBHFCGDIC(OPERATOR.GetName(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.OPERATOR_SKIN then
		return Engine.CBBHFCGDIC(OPERATOR.GetSkinDesc(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.WATCH then
		return Engine.CBBHFCGDIC(WATCH.GetWatchDesc(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.ATTACHMENT then
		return ATTACHMENT.GetDesc(arg_39_1)
	elseif arg_39_0 == LOOT.itemTypes.PLAYERCARD then
		return ""
	elseif arg_39_0 == LOOT.itemTypes.EMBLEM then
		return ""
	elseif arg_39_0 == LOOT.itemTypes.CAMO then
		return ""
	elseif arg_39_0 == LOOT.itemTypes.RETICLE then
		return Engine.CBBHFCGDIC(WEAPON.GetReticleDesc(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.CHARM then
		return ""
	elseif arg_39_0 == LOOT.itemTypes.GESTURES then
		return ""
	elseif arg_39_0 == LOOT.itemTypes.SUPER then
		return Engine.CBBHFCGDIC(SUPER.GetDesc(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.OPERATOR_TAUNT then
		return Engine.CBBHFCGDIC(OPERATOR.GetTauntDesc(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.OPERATOR_EXECUTION then
		return Engine.CBBHFCGDIC(OPERATOR.GetExecutionDesc(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.OPERATOR_INTRO then
		return Engine.CBBHFCGDIC(OPERATOR.GetIntroDesc(arg_39_1))
	elseif arg_39_0 == LOOT.itemTypes.SPRAYS then
		return ""
	elseif arg_39_0 == LOOT.itemTypes.FEATURE then
		return LOOT.GetFeatureItemDesc(arg_39_1)
	else
		assert(false, "Loot item type not supported. Please complete the loot item definition in csv file.")
	end
end

function LOOT.GetItemClassName(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = StringTable.DIFCHIGDFB(CSV.lootMaster.file, CSV.lootMaster.cols.typeValue, arg_40_0, CSV.lootMaster.cols.typeNameLoc)

	if arg_40_2 and tonumber(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_40_2, CSV.bundleIDs.cols.isCollection)) == 1 then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_40_2, CSV.bundleIDs.cols.collectionName))
	end

	if arg_40_0 == LOOT.itemTypes.WEAPON and arg_40_1 then
		return Engine.CBBHFCGDIC(WEAPON.GetWeaponClassName(arg_40_1))
	elseif arg_40_0 == LOOT.itemTypes.ROLE then
		return Engine.CBBHFCGDIC("LOOT_MP/ROLE")
	elseif arg_40_0 == LOOT.itemTypes.OPERATOR_SKIN and arg_40_1 then
		local var_40_1 = OPERATOR.GetSkinOwnerName(arg_40_1)

		return Engine.CBBHFCGDIC("LOOT_MP/OPERATOR_NAME_SKIN", var_40_1)
	elseif arg_40_0 == LOOT.itemTypes.QUIP and arg_40_1 then
		local var_40_2 = OPERATOR.GetQuipOwnerName(arg_40_1)

		return Engine.CBBHFCGDIC("LOOT_MP/OPERATOR_NAME_QUIP", var_40_2)
	elseif arg_40_0 == LOOT.itemTypes.OPERATOR_EXECUTION and arg_40_1 then
		local var_40_3 = OPERATOR.GetExecutionOwnerName(arg_40_1)

		return Engine.CBBHFCGDIC("LOOT_MP/OPERATOR_NAME_EXECUTION", var_40_3)
	elseif arg_40_0 == LOOT.itemTypes.FEATURE and LOOT.IsFeatureOperatorChallenge(arg_40_1) then
		return Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_MISSIONS")
	elseif arg_40_0 == LOOT.itemTypes.INVALID or #var_40_0 == 0 then
		assert(false, "Loot item type for type number " .. arg_40_0 .. " is not supported. Please complete the loot item definition in loot_master.csv.")

		return ""
	else
		return Engine.CBBHFCGDIC(var_40_0)
	end
end

function LOOT.GetItemClassImage(arg_41_0)
	return StringTable.DIFCHIGDFB(CSV.lootMaster.file, CSV.lootMaster.cols.typeValue, arg_41_0, CSV.lootMaster.cols.typeImg)
end

function LOOT.GetItemClassDesc(arg_42_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.lootMaster.file, CSV.lootMaster.cols.typeValue, arg_42_0, CSV.lootMaster.cols.typeDesc))
end

function LOOT.GetItemsInBundle(arg_43_0)
	local var_43_0 = tostring(arg_43_0)
	local var_43_1 = {
		file = CSV.bundleIDs.file,
		cols = CSV.bundleIDs.cols
	}
	local var_43_2 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_43_0)
	local var_43_3 = CSV.ReadRow(var_43_1, var_43_2)
	local var_43_4 = {}

	for iter_43_0 = 1, var_43_3.numItems do
		table.insert(var_43_4, var_43_3["item" .. iter_43_0])
	end

	return var_43_4
end

function LOOT.GetBundleItemsMappedByType(arg_44_0)
	local var_44_0 = {}

	if not arg_44_0 or arg_44_0 <= 0 then
		return var_44_0
	end

	local var_44_1 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, tostring(arg_44_0))

	if var_44_1 < 0 then
		return var_44_0
	end

	local var_44_2 = CSV.ReadRow({
		file = CSV.bundleIDs.file,
		cols = CSV.bundleIDs.cols
	}, var_44_1)

	if not var_44_2 then
		return var_44_0
	end

	for iter_44_0 = 1, var_44_2.numItems do
		local var_44_3 = var_44_2["item" .. iter_44_0]

		if var_44_3 and #var_44_3 > 0 then
			local var_44_4 = LOOT.GetTypeForID(var_44_3)

			if var_44_4 then
				if not var_44_0[var_44_4] then
					var_44_0[var_44_4] = {}
				end

				table.insert(var_44_0[var_44_4], var_44_3)
			end
		end
	end

	return var_44_0
end

function LOOT.IsBundle(arg_45_0)
	return arg_45_0 >= LOOT.BundleIDsMin and arg_45_0 <= LOOT.BundleIDsMax
end

function LOOT.GetIndexForRef(arg_46_0, arg_46_1)
	if arg_46_0 == LOOT.itemTypes.GESTURES then
		return GESTURES.GetIndexForRef(arg_46_1)
	elseif arg_46_0 == LOOT.itemTypes.SPRAYS then
		return SPRAYS.GetIndexForRef(arg_46_1)
	else
		assert(false, "Loot item type not supported. Please complete the loot item definition in csv file.")
	end
end

function LOOT.GetLootQualityString(arg_47_0)
	return Engine.CBBHFCGDIC("LOOT_MP/QUALITY_" .. tostring(arg_47_0))
end

function LOOT.GetRarityColor(arg_48_0)
	return LOOT.qualities[arg_48_0 + 1].color
end

function LOOT.GetDarkRarityColor(arg_49_0)
	return LOOT.qualities[arg_49_0 + 1].darkcolor
end

function LOOT.GetRarityImage(arg_50_0)
	local var_50_0 = arg_50_0 or 0

	return LOOT.qualities[var_50_0 + 1].image
end

function LOOT.GetRarityBorder(arg_51_0)
	local var_51_0 = arg_51_0 or 0

	return LOOT.qualities[var_51_0 + 1].border
end

function LOOT.GetRarityName(arg_52_0)
	return LOOT.qualities[arg_52_0 + 1].name
end

function LOOT.GetRenderedLootIcon(arg_53_0)
	local var_53_0 = arg_53_0 or 0

	return "icon_loot_category_" .. var_53_0
end

function LOOT.GetLootProperties(arg_54_0, arg_54_1)
	local var_54_0 = LOOT.GetItemRef(arg_54_0, arg_54_1)

	return {
		name = LOOT.GetItemName(arg_54_0, var_54_0),
		class = LOOT.GetItemClassName(arg_54_0, var_54_0),
		image = LOOT.GetItemImage(arg_54_0, var_54_0),
		rarity = LOOT.GetItemQuality(arg_54_0, var_54_0)
	}
end

function LOOT.GetXPLootProperties(arg_55_0)
	return {
		name = Engine.CBBHFCGDIC("LOOT_MP/PLAYER_XP"),
		class = Engine.CBBHFCGDIC("LOOT_MP/XP"),
		value = arg_55_0
	}
end

function LOOT.GetCPLootProperties(arg_56_0)
	local var_56_0 = {
		name = Engine.CBBHFCGDIC("LOOT_MP/COD_POINTS"),
		class = Engine.CBBHFCGDIC("LOOT_MP/CP")
	}

	var_56_0.image = "icon_currency_codpoints"
	var_56_0.value = arg_56_0

	return var_56_0
end

function LOOT.GetLastLootDropList(arg_57_0)
	local var_57_0 = PlayerData.BFFBGAJGD(arg_57_0, CoD.StatsGroup.Common)
	local var_57_1 = var_57_0.lastLootDropIndex:get()

	if var_57_1 == 0 then
		return {}
	end

	local var_57_2 = {}
	local var_57_3 = var_57_0.lastLootDrops
	local var_57_4 = var_57_1 - 1
	local var_57_5 = #var_57_3 - 1

	while var_57_4 ~= var_57_1 do
		local var_57_6 = var_57_3[var_57_4]:get()

		if var_57_6 == 0 then
			break
		end

		table.insert(var_57_2, var_57_6)

		var_57_4 = var_57_4 == 0 and var_57_5 or var_57_4 - 1
	end

	return var_57_2
end

function LOOT.GetCurrentLootLicense()
	return Dvar.CFHDGABACF("LSLQSSPLO")
end

function LOOT.HasDoubleXPToken(arg_59_0)
	for iter_59_0, iter_59_1 in pairs(LOOT.DOUBLE_XP_TOKENS) do
		if Loot.DEBEIFJEEG(arg_59_0, iter_59_1) > 0 then
			return true
		end
	end

	return false
end

function LOOT.HasDoubleWeaponXPToken(arg_60_0)
	for iter_60_0, iter_60_1 in pairs(LOOT.DOUBLE_WEAPON_XP_TOKENS) do
		if Loot.DEBEIFJEEG(arg_60_0, iter_60_1) > 0 then
			return true
		end
	end

	return false
end

function LOOT.HasActiveDoubleXPToken(arg_61_0)
	local var_61_0, var_61_1, var_61_2, var_61_3 = OnlineProgression.CEHEBBGFGG(arg_61_0)
	local var_61_4 = Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())

	return var_61_0 ~= nil and var_61_0 - var_61_4 > 0
end

function LOOT.HasActiveDoubleWeaponXPToken(arg_62_0)
	local var_62_0, var_62_1, var_62_2, var_62_3 = OnlineProgression.CEHEBBGFGG(arg_62_0)
	local var_62_4 = Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())

	return var_62_1 ~= nil and var_62_1 - var_62_4 > 0
end

function LOOT.IsDoubleKeyActive()
	return Dvar.CFHDGABACF("LPORTLTMNP") > 0
end

function LOOT.IsDoubleWeaponXPActive()
	local var_64_0
	local var_64_1
	local var_64_2 = Lobby.IsNotAloneInPrivateParty()
	local var_64_3 = Dvar.CFHDGABACF("PMORNPNTK")

	if Dvar.CFHDGABACF("LNQMMNNPSR") == 2 then
		return var_64_2
	end

	return var_64_3 == 2
end

function LOOT.IsDoubleXPActive()
	local var_65_0
	local var_65_1
	local var_65_2 = Lobby.IsNotAloneInPrivateParty()
	local var_65_3 = Dvar.CFHDGABACF("LKKNORQKTP")

	if Dvar.CFHDGABACF("NTLKOKLKRS") == 2 then
		return var_65_2
	end

	return var_65_3 == 2
end

function LOOT.IsDoubleBattlePassXPActive()
	return Dvar.CFHDGABACF("LTKKKPSRSK") == 2
end

function LOOT.IsDoubleXPActiveByType(arg_67_0, arg_67_1)
	if arg_67_1 == LOOT.doubleXPType.TOKEN then
		return LOOT.IsDoubleXPActive() or LOOT.HasActiveDoubleXPToken(arg_67_0)
	elseif arg_67_1 == LOOT.doubleXPType.GLOBAL then
		local var_67_0, var_67_1, var_67_2, var_67_3 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()

		return var_67_0 - (Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())) > 0
	elseif arg_67_1 == LOOT.doubleXPType.ANY then
		local var_67_4 = LOOT.IsDoubleXPActive() or LOOT.HasActiveDoubleXPToken(arg_67_0)
		local var_67_5, var_67_6, var_67_7, var_67_8 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()
		local var_67_9 = var_67_5 - (Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())) > 0

		return var_67_4 or var_67_9
	else
		return false
	end
end

function LOOT.IsDoubleWeaponXPActiveByType(arg_68_0, arg_68_1)
	if arg_68_1 == LOOT.doubleXPType.TOKEN then
		return LOOT.IsDoubleWeaponXPActive() or LOOT.HasActiveDoubleWeaponXPToken(arg_68_0)
	elseif arg_68_1 == LOOT.doubleXPType.GLOBAL then
		local var_68_0, var_68_1, var_68_2, var_68_3 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()

		return var_68_1 - (Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())) > 0
	elseif arg_68_1 == LOOT.doubleXPType.ANY then
		local var_68_4 = LOOT.IsDoubleWeaponXPActive() or LOOT.HasActiveDoubleWeaponXPToken(arg_68_0)
		local var_68_5, var_68_6, var_68_7, var_68_8 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()
		local var_68_9 = var_68_6 - (Engine.DEIDGHDBHD() or tonumber(Engine.DCJHCAFIIA())) > 0

		return var_68_4 or var_68_9
	else
		return false
	end
end

function LOOT.GetLootItemRelatedWeapon(arg_69_0, arg_69_1)
	arg_69_0 = tonumber(arg_69_0)

	local var_69_0
	local var_69_1

	if arg_69_1 == LOOT.itemTypes.ATTACHMENT then
		var_69_1 = 1000000
	elseif arg_69_1 == LOOT.itemTypes.CAMO then
		var_69_1 = 2000000
	else
		assert(false, "We cannot support decoding loot item type other than attachment and camo")
	end

	return (math.floor((arg_69_0 - var_69_1) / 1000))
end

function LOOT.LoadoutHasNewLoot(arg_70_0)
	local var_70_0 = PlayerData.BFFBGAJGD(arg_70_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts
	local var_70_1 = {}
	local var_70_2 = #var_70_0
	local var_70_3 = false

	for iter_70_0, iter_70_1 in ddlpairs(var_70_0) do
		for iter_70_2 = 0, 1 do
			local var_70_4 = iter_70_1.weaponSetups[iter_70_2]

			if GUNSMITH.CheckNewGunsmithByWeapon(arg_70_0, var_70_4) then
				var_70_3 = true

				break
			end
		end
	end

	return #WEAPON.GetNewWeaponIDs(arg_70_0, {
		getBaseWeapon = true
	}) > 0 or var_70_3 or LOOT.IsCategoryNew(arg_70_0, LOOT.itemTypes.PERK) or LOOT.IsCategoryNew(arg_70_0, LOOT.itemTypes.EQUIPMENT)
end

function LOOT.GetLootSmokeMaterialStreamer()
	local var_71_0 = {}

	for iter_71_0 = 0, 28 do
		local var_71_1 = "loot_card_overlay_smoke_"
		local var_71_2 = iter_71_0 < 10 and tostring("0" .. iter_71_0) or iter_71_0
		local var_71_3 = tostring(var_71_1 .. var_71_2)

		table.insert(var_71_0, RegisterMaterial(var_71_3))
	end

	local var_71_4 = LUI.UIElement.new()

	var_71_4.id = "LootSmokeMaterialStreamer"

	var_71_4:SetupImageTableStreamer(var_71_0)

	return var_71_4
end

function LOOT.GetLootFlareMaterialStreamer()
	local var_72_0 = {
		{
			"loot_card_border_flare_rare_",
			0,
			28
		},
		{
			"loot_card_border_flare_epic_",
			0,
			26
		},
		{
			"loot_card_border_flare_legendary_",
			0,
			29
		},
		{
			"loot_card_border_flare_common_",
			0,
			29
		},
		{
			"loot_card_border_flare_base_",
			0,
			29
		},
		{
			"loot_card_border_flare_battlepass_",
			0,
			29
		},
		{
			"loot_card_border_introduction_",
			0,
			28
		}
	}
	local var_72_1 = {
		RegisterMaterial("ui_waveform_active"),
		RegisterMaterial("ui_waveform_idle")
	}

	for iter_72_0 = 1, #var_72_0 do
		for iter_72_1 = var_72_0[iter_72_0][2], var_72_0[iter_72_0][3] do
			local var_72_2 = var_72_0[iter_72_0][1]
			local var_72_3 = iter_72_1 < 10 and tostring("0" .. iter_72_1) or iter_72_1
			local var_72_4 = tostring(var_72_2 .. var_72_3)

			table.insert(var_72_1, RegisterMaterial(var_72_4))
		end
	end

	local var_72_5 = LUI.UIElement.new()

	var_72_5.id = "LootFlareMaterialStreamer"

	var_72_5:SetupImageTableStreamer(var_72_1)

	return var_72_5
end

function LOOT.GetLootCardData(arg_73_0, arg_73_1)
	if arg_73_1 then
		local var_73_0 = LOOT.GetTypeForID(arg_73_1)
		local var_73_1 = LOOT.GetItemRef(var_73_0, arg_73_1)
		local var_73_2 = LOOT.GetItemQuality(var_73_0, var_73_1, arg_73_1) or 0
		local var_73_3 = LOOT.GetRarityImage(var_73_2)
		local var_73_4 = LOOT.GetRarityColor(var_73_2)
		local var_73_5
		local var_73_6
		local var_73_7

		if var_73_0 == LOOT.itemTypes.WEAPON then
			var_73_6 = WEAPON.GetLootWeaponName(var_73_1, arg_73_1)
			var_73_5 = WEAPON.GetLootVariantImage(var_73_1, arg_73_1)
		else
			var_73_6 = LOOT.GetItemName(var_73_0, var_73_1)
			var_73_5 = LOOT.GetItemImage(var_73_0, var_73_1, arg_73_1)
		end

		if var_73_0 == LOOT.itemTypes.FEATURE then
			var_73_7 = LOOT.IsFeatureOperatorChallenge(var_73_1)
		end

		return {
			ID = arg_73_1,
			ref = var_73_1,
			type = var_73_0,
			name = var_73_6,
			image = var_73_5,
			rarity = var_73_2,
			rarityImage = var_73_3,
			rarityColor = var_73_4,
			isOperatorChallenge = var_73_7
		}
	end

	return nil
end

function LOOT.GetBattlePassLootSkips(arg_74_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, arg_74_0, CSV.battlePassIDs.cols.skips)) or 0
end

function LOOT.HideLootBreadcrumbsCondition(arg_75_0)
	return IsPrivateMatch() or IsSystemLink() or arg_75_0 and CONDITIONS.IsInGameBattlesMatch()
end

function LOOT.IsCategoryNew(arg_76_0, arg_76_1)
	local var_76_0 = LOOT.typeCSV[arg_76_1]

	if var_76_0 and var_76_0.cols.hideInUI then
		local var_76_1 = Loot.BCBAGDEJAJ(arg_76_0, LOOT.typeNames[arg_76_1])

		for iter_76_0, iter_76_1 in ipairs(var_76_1) do
			local var_76_2 = LOOT.GetItemRef(arg_76_1, iter_76_1)

			if StringTable.DIFCHIGDFB(var_76_0.file, var_76_0.cols.ref, var_76_2, var_76_0.cols.hideInUI) ~= "1" then
				return true
			end
		end

		return false
	else
		return Loot.DAFIICDBFJ(arg_76_0, LOOT.typeNames[arg_76_1])
	end
end

function LOOT.IsWeapon(arg_77_0)
	return arg_77_0 >= LOOT.WeaponIDsMin and arg_77_0 <= LOOT.WeaponIDsMax
end

function LOOT.GetUnlockableBlueprintIcon(arg_78_0)
	return StringTable.DIFCHIGDFB(CSV.BRUnlockables.file, CSV.BRUnlockables.cols.lootID, arg_78_0, CSV.BRUnlockables.cols.image)
end

function LOOT.CanPreview(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_0 ~= LOOT.itemTypes.CONSUMABLE and arg_79_0 ~= LOOT.itemTypes.FEATURE
	local var_79_1 = true

	if arg_79_0 == LOOT.itemTypes.WATCH then
		local var_79_2 = LOOT.GetItemRef(arg_79_0, arg_79_1)

		var_79_1 = WATCH.IsPreviewEnabled(var_79_2)
	elseif arg_79_0 == LOOT.itemTypes.FEATURE then
		local var_79_3 = LOOT.GetItemRef(arg_79_0, arg_79_1)

		var_79_0 = LOOT.IsFeatureOperatorChallenge(var_79_3)
	end

	return var_79_0 and var_79_1
end
