BRLOOT = BRLOOT or {}
BRLOOT.CARD_X_OFFSET = 0
BRLOOT.CARD_Y_OFFSET = 0
BRLOOT.CARD_Z_OFFSET = 15
BRLOOT.CARD_MIN_SCALE = 0.5
BRLOOT.CARD_MAX_SCALE = 1
BRLOOT.CARD_SNAP_TO_SCREEN_EDGES = false
BRLOOT.CARD_IS_PERSPECTIVE_SCALE_ENABLED = true
BRLOOT.INVALID_TARGET_ENTITY = -1
BRLOOT.INVALID_ITEM_VALUE = -1
BRLOOT.MAX_GENTITIES = 2048
BRLOOT.TRANSPARENT_TEXTURE = "ui_shared_transparent"
BRLOOT.DEFAULT_IW_EMPTY_TEXTURE = "specialty_ks_null"
BRLOOT.ERROR_TEXTURE = "white"
BRLOOT.ERROR_ANIM = "Hide"
BRLOOT.DEFAULT_MISSION_REWARDS_REF = "default"
BRLOOT.PLUNDER_QUANTITY_SCALING_FACTOR = 100
BRLOOT.TEAM_CASH_SCALAR = 100
BRLOOT.PLUNDER_BANKED_XP_SCALAR = 25
BRLOOT.MAX_ARMOR = 150
BRLOOT.MAX_ARMOR_PLATES_HELD = 3
BRLOOT.USING_CRATE_NAME = "ks_use_crate_mp"

function BRLOOT.ValidateImage(arg_1_0)
	local var_1_0 = arg_1_0

	if not arg_1_0 then
		var_1_0 = BRLOOT.ERROR_TEXTURE
	elseif arg_1_0 == DEFAULT_IW_EMPTY_TEXTURE then
		var_1_0 = BRLOOT.TRANSPARENT_TEXTURE
	end

	return var_1_0
end

BRLOOT.ARMOR_DATA = {
	ARMOR_EQUIPPING_WEP_NAME = "armor_plate_deploy_mp",
	PLATES = {
		DEFAULT_MAX_COUNT = 5,
		ICON = "ui_mp_br_loot_icon_health_armor_plates",
		TYPE_INDEX = 0
	},
	SATCHEL = {
		TOTAL_MAX_COUNT = 8,
		NAME = "brloot_plate_pouch",
		TYPE_INDEX = 1,
		DEFAULT_MAX_COUNT = 3,
		ICON = "ui_mp_br_loot_icon_health_armor_satchel"
	}
}
BRLOOT.GAS_MASK_TYPES = {
	NORMAL = 2,
	DURABLE = 3
}
BRLOOT.GAS_MASK_NAMES = {
	NORMAL = "brloot_equip_gasmask",
	DURABLE = "brloot_equip_gasmask_durable"
}
BRLOOT.itemCategories = {
	ITEM = "item"
}
BRLOOT.distanceStates = {
	SHORT = "short",
	FAR = "far",
	MEDIUM = "medium"
}
BRLOOT.itemTypes = {
	CACHE = "cache",
	OBJECTIVE = "objective",
	HEALTH = "health",
	SPECIALIST = "specialist",
	ARMOR = "armor",
	TABLET = "tablet",
	WEAPON = "weapon",
	SUPER = "super",
	TACTICAL = "tactical",
	TOKEN = "token",
	BOMBSITE = "bombsite",
	TRADER = "trader",
	REVIVE = "revive",
	ATTACHMENT = "attachment",
	GEAR = "gear",
	PLUNDER = "plunder",
	KIOSK = "kiosk",
	KILLSTREAK = "killstreak",
	LETHAL = "lethal",
	AMMO = "ammo"
}
BRLOOT.itemTypeData = {
	[BRLOOT.itemTypes.AMMO] = {
		nameUnlocalized = "LOOT_MP/ITEM_TYPE_AMMO"
	},
	[BRLOOT.itemTypes.HEALTH] = {
		nameUnlocalized = "MP_BR_INGAME/ITEM_TYPE_HEALTH"
	},
	[BRLOOT.itemTypes.PLUNDER] = {
		nameUnlocalized = "LOOT_MP/ITEM_TYPE_PLUNDER"
	},
	[BRLOOT.itemTypes.GEAR] = {
		nameUnlocalized = "MP_BR_INGAME/ITEM_TYPE_GEAR"
	},
	[BRLOOT.itemTypes.ARMOR] = {
		nameUnlocalized = "LOOT_MP/ITEM_TYPE_ARMOR"
	},
	[BRLOOT.itemTypes.ATTACHMENT] = {
		nameUnlocalized = "LOOT_MP/ITEM_TYPE_ATTACHMENT"
	},
	[BRLOOT.itemTypes.LETHAL] = {
		nameUnlocalized = "LOOT_MP/ITEM_TYPE_LETHAL"
	},
	[BRLOOT.itemTypes.TACTICAL] = {
		nameUnlocalized = "LOOT_MP/ITEM_TYPE_TACTICAL"
	},
	[BRLOOT.itemTypes.WEAPON] = {},
	[BRLOOT.itemTypes.TABLET] = {
		uniqueInputString = "MENU/ACCEPT"
	},
	[BRLOOT.itemTypes.KIOSK] = {
		nameUnlocalized = "MP_BR_INGAME/ITEM_TYPE_KIOSK",
		uniqueInputString = "MENU/INTERACT"
	},
	[BRLOOT.itemTypes.TRADER] = {
		nameUnlocalized = "MP_BR_INGAME_TU_WZ325/ARMORY_TRADER",
		uniqueInputString = "MP_BR_INGAME_TU_WZ325/ARMORY_TRADER_HOLD"
	},
	[BRLOOT.itemTypes.SUPER] = {
		nameUnlocalized = "MP_BR_INGAME/ITEM_TYPE_SUPER"
	},
	[BRLOOT.itemTypes.CACHE] = {
		nameUnlocalized = "MP_BR_INGAME/ITEM_TYPE_CACHE",
		uniqueInputString = "MP_BR_INGAME/OPEN"
	},
	[BRLOOT.itemTypes.KILLSTREAK] = {
		nameUnlocalized = "MP_BR_INGAME/ITEM_TYPE_KILLSTREAK"
	},
	[BRLOOT.itemTypes.TOKEN] = {
		nameUnlocalized = "MP_BR_INGAME/REDEPLOYMENT"
	},
	[BRLOOT.itemTypes.REVIVE] = {
		nameUnlocalized = "MP_BR_INGAME/ITEM_TYPE_LAST_STAND"
	},
	[BRLOOT.itemTypes.SPECIALIST] = {
		nameUnlocalized = "MP_BR_INGAME/ITEM_TYPE_SPECIALIST"
	},
	[BRLOOT.itemTypes.BOMBSITE] = {
		uniqueInputString = "MENU/INTERACT"
	}
}
BRLOOT.itemRarities = {
	EPIC = 3,
	COMMON = 0,
	MISSION = 11,
	ULTRA = 5,
	HEROIC = 6,
	SPECIAL_MISSION = 12,
	CLASSIFIED = 14,
	PLAYER = 10,
	REUSABLE_CRATE = 13,
	UNCOMMON = 1,
	RARE = 2,
	LEGENDARY = 4
}
BRLOOT.rewardsTypes = {
	TRAINING_REWARD = 0,
	PRACTICE_REWARD = 2,
	BLOOD_MONEY_TRAINING_REWARD = 3,
	FIRST_MATCH_REWARD = 1
}
BRLOOT.itemRarityData = {
	[BRLOOT.itemRarities.COMMON] = {
		nameUnlocalized = "LOOT_MP/QUALITY_1",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_common",
		swatch = SWATCHES.BRLootItemRarity.Common
	},
	[BRLOOT.itemRarities.UNCOMMON] = {
		nameUnlocalized = "LOOT_MP/QUALITY_UNCOMMON",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_uncommon",
		swatch = SWATCHES.BRLootItemRarity.Uncommon
	},
	[BRLOOT.itemRarities.RARE] = {
		nameUnlocalized = "LOOT_MP/QUALITY_2",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_rare",
		swatch = SWATCHES.BRLootItemRarity.Rare
	},
	[BRLOOT.itemRarities.EPIC] = {
		nameUnlocalized = "LOOT_MP/QUALITY_3",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_epic",
		swatch = SWATCHES.BRLootItemRarity.Epic
	},
	[BRLOOT.itemRarities.LEGENDARY] = {
		nameUnlocalized = "LOOT_MP/QUALITY_4",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_legendary",
		swatch = SWATCHES.BRLootItemRarity.Legendary
	},
	[BRLOOT.itemRarities.PLAYER] = {
		nameUnlocalized = "LOOT_MP/QUALITY_PLAYER",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_advancedsupplydrop",
		swatch = SWATCHES.BRLootItemRarity.Player
	},
	[BRLOOT.itemRarities.MISSION] = {
		nameUnlocalized = "MP_BR_INGAME/CONTRACT",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_common",
		swatch = SWATCHES.BRLootItemRarity.Mission
	},
	[BRLOOT.itemRarities.SPECIAL_MISSION] = {
		nameUnlocalized = "MP_BR_INGAME/CONTRACT",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_common",
		swatch = SWATCHES.BRLootItemRarity.SpecialMission
	},
	[BRLOOT.itemRarities.REUSABLE_CRATE] = {
		nameUnlocalized = "LOOT_MP/QUALITY_3",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_epic",
		swatch = SWATCHES.BRLootItemRarity.ReusableCrate
	},
	[BRLOOT.itemRarities.ULTRA] = {
		nameUnlocalized = "LOOT_MP/QUALITY_5",
		rarityIcon = "icon_rarity_7",
		swatch = SWATCHES.itemRarity.quality4
	},
	[BRLOOT.itemRarities.HEROIC] = {
		nameUnlocalized = "LOOT_MP/QUALITY_6",
		rarityIcon = "icon_rarity_6",
		swatch = SWATCHES.itemRarity.quality6,
		rarityIconColorOverride = SWATCHES.CH2.White
	},
	[BRLOOT.itemRarities.CLASSIFIED] = {
		nameUnlocalized = "GAME/VOTE_RANDOM",
		rarityIcon = "ui_mp_br_lootcard_icon_rarity_epic",
		swatch = SWATCHES.BRLootItemRarity.Classified
	}
}
BRLOOT.weaponClasses = {
	PROJECTILE = "weapon_projectile",
	SHOTGUN = "weapon_shotgun",
	PRIMARY_MELEE = "weapon_melee",
	MELEE = "weapon_melee2",
	LMG = "weapon_lmg",
	SNIPER = "weapon_sniper",
	SMG = "weapon_smg",
	TACTICAL = "weapon_tactical",
	ASSAULT = "weapon_assault",
	PISTOL = "weapon_pistol",
	DMR = "weapon_dmr"
}
BRLOOT.ammoTypes = {
	AR = "brloot_ammo_762",
	SHOTGUN = "brloot_ammo_12g",
	SMALL_ARMS = "brloot_ammo_919",
	SNIPER = "brloot_ammo_50cal",
	ROCKET = "brloot_ammo_rocket"
}
BRLOOT.ammoData = {
	[BRLOOT.ammoTypes.AR] = {
		ammoImageDetail = "ui_mp_br_loot_icon_ammo_mid_detail",
		ammoAnim = "AssaultActive",
		ammoName = "MP/BR_AMMO_AR_LMG",
		storedAmmoOmnvarName = "ui_br_assault_ammo",
		ammoImage = "ui_mp_br_loot_icon_ammo_mid",
		maxAmmo = 150,
		ammoDSRef = "PlayerAssaultRifleAmmoStore",
		weaponClass = {
			BRLOOT.weaponClasses.ASSAULT,
			BRLOOT.weaponClasses.LMG
		},
		ammoType = BRLOOT.ammoTypes.AR
	},
	[BRLOOT.ammoTypes.SMALL_ARMS] = {
		ammoImageDetail = "ui_mp_br_loot_icon_ammo_small_detail",
		ammoAnim = "SmallArmsActive",
		ammoName = "MP/BR_AMMO_PISTOL_SMG",
		storedAmmoOmnvarName = "ui_br_smallarms_ammo",
		ammoImage = "ui_mp_br_loot_icon_ammo_small",
		maxAmmo = 120,
		ammoDSRef = "PlayerSmallArmsAmmoStore",
		weaponClass = {
			BRLOOT.weaponClasses.PISTOL,
			BRLOOT.weaponClasses.SMG
		},
		ammoType = BRLOOT.ammoTypes.SMALL_ARMS
	},
	[BRLOOT.ammoTypes.SHOTGUN] = {
		ammoImageDetail = "ui_mp_br_loot_icon_ammo_shells_detail",
		ammoAnim = "ShotgunActive",
		ammoName = "MP/BR_AMMO_SHOTGUN",
		storedAmmoOmnvarName = "ui_br_shotgun_ammo",
		ammoImage = "ui_mp_br_loot_icon_ammo_shells",
		maxAmmo = 30,
		ammoDSRef = "PlayerShotgunAmmoStore",
		weaponClass = {
			BRLOOT.weaponClasses.SHOTGUN
		},
		ammoType = BRLOOT.ammoTypes.SHOTGUN
	},
	[BRLOOT.ammoTypes.SNIPER] = {
		ammoImageDetail = "ui_mp_br_loot_icon_ammo_high_detail",
		ammoAnim = "SniperActive",
		ammoName = "MP/BR_AMMO_SNIPER",
		storedAmmoOmnvarName = "ui_br_sniper_ammo",
		ammoImage = "ui_mp_br_loot_icon_ammo_high",
		maxAmmo = 30,
		ammoDSRef = "PlayerSniperAmmoStore",
		weaponClass = {
			BRLOOT.weaponClasses.SNIPER,
			BRLOOT.weaponClasses.DMR
		},
		ammoType = BRLOOT.ammoTypes.SNIPER
	},
	[BRLOOT.ammoTypes.ROCKET] = {
		ammoImageDetail = "ui_mp_br_loot_icon_ammo_rocket_detail",
		ammoAnim = "RocketActive",
		ammoName = "MP/BR_AMMO_LAUNCHER",
		storedAmmoOmnvarName = "ui_br_rocket_ammo",
		ammoImage = "ui_mp_br_loot_icon_ammo_rocket",
		maxAmmo = 3,
		ammoDSRef = "PlayerRocketAmmoStore",
		weaponClass = {
			BRLOOT.weaponClasses.PROJECTILE
		},
		ammoType = BRLOOT.ammoTypes.ROCKET
	}
}
BRLOOT.weaponClassData = {
	[BRLOOT.weaponClasses.ASSAULT] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.AR]
	},
	[BRLOOT.weaponClasses.LMG] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.AR]
	},
	[BRLOOT.weaponClasses.TACTICAL] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.AR]
	},
	[BRLOOT.weaponClasses.SMG] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.SMALL_ARMS]
	},
	[BRLOOT.weaponClasses.PISTOL] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.SMALL_ARMS]
	},
	[BRLOOT.weaponClasses.SHOTGUN] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.SHOTGUN]
	},
	[BRLOOT.weaponClasses.SNIPER] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.SNIPER]
	},
	[BRLOOT.weaponClasses.DMR] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.SNIPER]
	},
	[BRLOOT.weaponClasses.PROJECTILE] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.ROCKET]
	},
	[BRLOOT.weaponClasses.MELEE] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.ROCKET]
	},
	[BRLOOT.weaponClasses.PRIMARY_MELEE] = {
		ammoData = BRLOOT.ammoData[BRLOOT.ammoTypes.ROCKET]
	}
}

function BRLOOT.InitLootCSV()
	CSV.BRLootBase.file = Dvar.DHEEJCCJBH("RKMMNSQKO")

	assert(CSV.BRLootBase.file ~= "")

	for iter_2_0, iter_2_1 in pairs(BRLOOT.ammoTypes) do
		local var_2_0 = tonumber(StringTable.DIFCHIGDFB(CSV.BRLootBase.file, CSV.BRLootBase.cols.name, iter_2_1, CSV.BRLootBase.cols.maxStackSize))

		BRLOOT.ammoData[iter_2_1].maxAmmo = var_2_0 or 0
	end

	local var_2_1 = tonumber(StringTable.DIFCHIGDFB(CSV.BRLootBase.file, CSV.BRLootBase.cols.name, "brloot_armor_plate", CSV.BRLootBase.cols.classCharacteristicTitle))

	BRLOOT.MAX_ARMOR = var_2_1 or BRLOOT.MAX_ARMOR

	local var_2_2 = tonumber(StringTable.DIFCHIGDFB(CSV.BRLootBase.file, CSV.BRLootBase.cols.name, "brloot_armor_plate", CSV.BRLootBase.cols.maxStackSize))

	BRLOOT.MAX_ARMOR_PLATES_HELD = var_2_2 or BRLOOT.MAX_ARMOR_PLATES_HELD
end

function BRLOOT.ShouldShowLootCard(arg_3_0)
	local var_3_0 = DataSources.inGame.HUD.hints.interactiveObject.lootCard.shouldShow:GetModel(arg_3_0)

	return DataModel.JJEHAEBDF(var_3_0) == 1
end

function BRLOOT.IsValidRarityNum(arg_4_0)
	return BRLOOT.itemRarityData[arg_4_0] ~= nil
end

function BRLOOT.ApplyRarityIconColoring(arg_5_0, arg_5_1)
	if arg_5_0 and arg_5_1 then
		local var_5_0 = BRLOOT.itemRarityData[arg_5_1]

		if var_5_0 then
			local var_5_1 = var_5_0.swatch
			local var_5_2 = var_5_0.rarityIconColorOverride

			if var_5_2 then
				arg_5_0:SetRGBFromTable(var_5_2)

				return
			elseif var_5_1 then
				arg_5_0:SetRGBFromTable(var_5_1)

				return
			end
		end
	end

	DebugPrint("Error: BRLOOT.ApplyRarityIconColoring: there was a failure applying rarity coloring for rarity num " .. tostring(arg_5_1) .. " to iconWidget " .. tostring(arg_5_0))
end

function BRLOOT.IsLootCache(arg_6_0)
	return arg_6_0 and (arg_6_0.name == "br_loot_cache" or arg_6_0.name == "br_loot_cache_lege" or arg_6_0.name == "br_reusable_loot_cache")
end

function BRLOOT.GetNativeLootData(arg_7_0)
	local var_7_0

	if BRLOOT.ShouldShowLootCard(arg_7_0) then
		var_7_0 = Game.DFFJEIIAD(arg_7_0)

		if CONDITIONS.IsPlayerAZombie(arg_7_0) and (not (Dvar.IBEGCHEFE("scr_br_zxp_zombie_can_see_and_open_loot") or true) or not BRLOOT.IsLootCache(var_7_0)) then
			var_7_0 = nil
		end
	end

	return var_7_0
end

function BRLOOT.UpdateLootCard(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0)
	assert(arg_8_1)
	assert(arg_8_2)
	assert(arg_8_2.CustomUpdate)

	local var_8_0 = BRLOOT.GetNativeLootData(arg_8_1)

	if var_8_0 then
		arg_8_2.CustomUpdate(arg_8_0, arg_8_1, {
			nativeLootDataTable = var_8_0
		})
	elseif arg_8_2.CustomHideRoutine then
		arg_8_2.CustomHideRoutine(arg_8_0)
	else
		ACTIONS.AnimateSequence(arg_8_0, "ModHideAll")
	end
end

function BRLOOT.StripHackAttachmentsFromLootString(arg_9_0)
	arg_9_0 = arg_9_0:gsub("br_rangeext_ar%+", "")
	arg_9_0 = arg_9_0:gsub("br_rangeext_smg%+", "")
	arg_9_0 = arg_9_0:gsub("br_rangeext_shtgn%+", "")
	arg_9_0 = arg_9_0:gsub("br_rangeext_lmg%+", "")
	arg_9_0 = arg_9_0:gsub("br_rangeext_snpr%+", "")
	arg_9_0 = arg_9_0:gsub("br_rangeext_pstl%+", "")
	arg_9_0 = arg_9_0:gsub("br_rangeext_dmr%+", "")

	return arg_9_0
end

function BRLOOT.GetLootDataByRowIndex(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = CSV.ReadRow(CSV.BRLootBase, arg_10_0)

	if var_10_1 then
		var_10_0.name = var_10_1.name
		var_10_0.title = var_10_1.title
		var_10_0.desc = var_10_1.desc
		var_10_0.icon = var_10_1.icon
		var_10_0.type = var_10_1.type
		var_10_0.classCharacteristicTitle = var_10_1.classCharacteristicTitle
		var_10_0.weaponCharacteristicTitle = var_10_1.weaponCharacteristicTitle
		var_10_0.weaponRef = var_10_1.baseWeapon
		var_10_0.attachments = var_10_1.attachments
		var_10_0.rarityNum = tonumber(var_10_1.rarity)
		var_10_0.isBlueprint = var_10_1.isBlueprint
		var_10_0.quantity = var_10_1.ammoStart

		return var_10_0
	end

	return nil
end

function BRLOOT.GetLootDataForLookupKeys(arg_11_0)
	local var_11_0 = CSV.BRLootBase.file
	local var_11_1 = {}

	local function var_11_2(arg_12_0, arg_12_1)
		if arg_12_1 then
			table.insert(var_11_1, {
				col = arg_12_0,
				key = arg_12_1
			})
		end
	end

	if arg_11_0.fullWeaponName then
		arg_11_0.fullWeaponName = BRLOOT.StripHackAttachmentsFromLootString(arg_11_0.fullWeaponName)
	end

	var_11_2(CSV.BRLootBase.cols.name, arg_11_0.nameRef)
	var_11_2(CSV.BRLootBase.cols.itemCategory, arg_11_0.itemCategory)
	var_11_2(CSV.BRLootBase.cols.fullWeaponName, arg_11_0.fullWeaponName)
	var_11_2(CSV.BRLootBase.cols.icon, arg_11_0.icon)

	local var_11_3 = StringTable.BABCABFJEJ(var_11_0, var_11_1)
	local var_11_4 = {}

	if var_11_3 and var_11_3 > -1 then
		var_11_4.name = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.name)
		var_11_4.title = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.title)
		var_11_4.desc = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.desc)
		var_11_4.icon = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.icon)
		var_11_4.type = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.type)
		var_11_4.classCharacteristicTitle = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.classCharacteristicTitle)
		var_11_4.weaponCharacteristicTitle = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.weaponCharacteristicTitle)
		var_11_4.weaponRef = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.baseWeapon)
		var_11_4.attachments = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.attachments)
		var_11_4.rarityNum = tonumber(StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.rarity))
		var_11_4.maxStackSize = tonumber(StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.maxStackSize))
		var_11_4.isBlueprint = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.isBlueprint)
		var_11_4.contractType = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.contractType)
		var_11_4.contractTime = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.contractTime)
		var_11_4.missionRef = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.missionRef)
		var_11_4.contractReward1Ref = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.contractReward1Ref)
		var_11_4.contractReward2Ref = StringTable.CBGJCDIHCE(var_11_0, var_11_3, CSV.BRLootBase.cols.contractReward2Ref)

		return var_11_4
	end

	return nil
end

function BRLOOT.GetEquipmentLootRarityNumber(arg_13_0)
	return (tonumber(StringTable.DIFCHIGDFB(CSV.BRLootBase.file, CSV.BRLootBase.cols.baseWeapon, arg_13_0, CSV.BRLootBase.cols.rarity)))
end

function BRLOOT.GetAbbreviatedNumber(arg_14_0)
	local var_14_0 = 1000000000
	local var_14_1 = 1000000
	local var_14_2 = 1000
	local var_14_3

	if var_14_0 <= arg_14_0 then
		arg_14_0 = string.format("%g", tonumber(string.format("%.1f", arg_14_0 / var_14_0)))
		var_14_3 = Engine.CBBHFCGDIC("LUA_MENU/ABBREVIATED_CASH_BILLION", arg_14_0)
	elseif var_14_1 <= arg_14_0 then
		arg_14_0 = string.format("%g", tonumber(string.format("%.1f", arg_14_0 / var_14_1)))
		var_14_3 = Engine.CBBHFCGDIC("LUA_MENU/ABBREVIATED_CASH_MILLION", arg_14_0)
	elseif var_14_2 <= arg_14_0 then
		arg_14_0 = string.format("%g", tonumber(string.format("%.1f", arg_14_0 / var_14_2)))
		var_14_3 = Engine.CBBHFCGDIC("LUA_MENU/ABBREVIATED_CASH_THOUSAND", arg_14_0)
	else
		var_14_3 = arg_14_0
	end

	return var_14_3
end

function BRLOOT.GetCurrentMaxArmorPlates(arg_15_0)
	local var_15_0 = DataSources.inGame.player.healthEquipment.numCharges:GetValue(arg_15_0)
	local var_15_1 = Dvar.CFHDGABACF("scr_br_platePouchCount") or BRLOOT.ARMOR_DATA.SATCHEL.DEFAULT_MAX_COUNT
	local var_15_2 = DataSources.inGame.player.healthEquipment.hasPlatePouch:GetValue(arg_15_0)
	local var_15_3

	if var_15_2 then
		var_15_3 = BRLOOT.MAX_ARMOR_PLATES_HELD + var_15_1
	else
		var_15_3 = BRLOOT.MAX_ARMOR_PLATES_HELD
	end

	return var_15_3 or 0
end

function BRLOOT.IsWeaponNoneValue(arg_16_0)
	return arg_16_0 == BRLOOT.USING_CRATE_NAME or arg_16_0 == BRLOOT.ARMOR_DATA.ARMOR_EQUIPPING_WEP_NAME
end
