BRLOOT = BRLOOT or {}
BRLOOT.CARD_X_OFFSET = 0
BRLOOT.CARD_Y_OFFSET = 0
BRLOOT.CARD_Z_OFFSET = 15
BRLOOT.CARD_MIN_SCALE = 0.5
BRLOOT.CARD_MAX_SCALE = 1
BRLOOT.CARD_SNAP_TO_SCREEN_EDGES = false
BRLOOT.CARD_IS_PERSPECTIVE_SCALE_ENABLED = true
BRLOOT.CARD_MAX_NUM_DISPLAY_ATTACHMENTS = 5
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
		ICON = "ui_mp_br_loot_icon_health_armor_plates"
	},
	SATCHEL = {
		DEFAULT_MAX_COUNT = 3,
		ICON = "ui_mp_br_loot_icon_health_armor_satchel",
		NAME = "brloot_plate_pouch"
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
	ARMOR = "armor",
	HEALTH = "health",
	SPECIALIST = "specialist",
	TACTICAL = "tactical",
	TABLET = "tablet",
	SUPER = "super",
	TOKEN = "token",
	WEAPON = "weapon",
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
	}
}
BRLOOT.itemRarities = {
	COMMON = 0,
	EPIC = 3,
	MISSION = 6,
	PLAYER = 5,
	UNCOMMON = 1,
	SPECIAL_MISSION = 7,
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
	}
}
BRLOOT.weaponClasses = {
	SMG = "weapon_smg",
	SHOTGUN = "weapon_shotgun",
	ASSAULT = "weapon_assault",
	PROJECTILE = "weapon_projectile",
	PISTOL = "weapon_pistol",
	LMG = "weapon_lmg",
	SNIPER = "weapon_sniper",
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

function BRLOOT.UpdateLootCard(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0)
	assert(arg_4_1)
	assert(arg_4_2)
	assert(arg_4_2.CustomUpdate)

	if BRLOOT.ShouldShowLootCard(arg_4_1) then
		local var_4_0 = Game.DFFJEIIAD(arg_4_1)

		if var_4_0 then
			arg_4_2.CustomUpdate(arg_4_0, arg_4_1, {
				nativeLootDataTable = var_4_0
			})
		end
	elseif arg_4_2.CustomHideRoutine then
		arg_4_2.CustomHideRoutine(arg_4_0)
	else
		ACTIONS.AnimateSequence(arg_4_0, "ModHideAll")
	end
end

function BRLOOT.StripHackAttachmentsFromLootString(arg_5_0)
	arg_5_0 = arg_5_0:gsub("br_rangeext_ar%+", "")
	arg_5_0 = arg_5_0:gsub("br_rangeext_smg%+", "")
	arg_5_0 = arg_5_0:gsub("br_rangeext_shtgn%+", "")
	arg_5_0 = arg_5_0:gsub("br_rangeext_lmg%+", "")
	arg_5_0 = arg_5_0:gsub("br_rangeext_snpr%+", "")
	arg_5_0 = arg_5_0:gsub("br_rangeext_pstl%+", "")
	arg_5_0 = arg_5_0:gsub("br_rangeext_dmr%+", "")

	return arg_5_0
end

function BRLOOT.GetLootDataByRowIndex(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = CSV.ReadRow(CSV.BRLootBase, arg_6_0)

	if var_6_1 then
		var_6_0.name = var_6_1.name
		var_6_0.title = var_6_1.title
		var_6_0.desc = var_6_1.desc
		var_6_0.icon = var_6_1.icon
		var_6_0.type = var_6_1.type
		var_6_0.classCharacteristicTitle = var_6_1.classCharacteristicTitle
		var_6_0.weaponCharacteristicTitle = var_6_1.weaponCharacteristicTitle
		var_6_0.weaponRef = var_6_1.baseWeapon
		var_6_0.attachments = var_6_1.attachments
		var_6_0.rarityNum = tonumber(var_6_1.rarity)
		var_6_0.isBlueprint = var_6_1.isBlueprint

		return var_6_0
	end

	return nil
end

function BRLOOT.GetLootDataForLookupKeys(arg_7_0)
	local var_7_0 = CSV.BRLootBase.file
	local var_7_1 = {}

	local function var_7_2(arg_8_0, arg_8_1)
		if arg_8_1 then
			table.insert(var_7_1, {
				col = arg_8_0,
				key = arg_8_1
			})
		end
	end

	if arg_7_0.fullWeaponName then
		arg_7_0.fullWeaponName = BRLOOT.StripHackAttachmentsFromLootString(arg_7_0.fullWeaponName)
	end

	var_7_2(CSV.BRLootBase.cols.name, arg_7_0.nameRef)
	var_7_2(CSV.BRLootBase.cols.itemCategory, arg_7_0.itemCategory)
	var_7_2(CSV.BRLootBase.cols.fullWeaponName, arg_7_0.fullWeaponName)
	var_7_2(CSV.BRLootBase.cols.icon, arg_7_0.icon)

	local var_7_3 = StringTable.BABCABFJEJ(var_7_0, var_7_1)
	local var_7_4 = {}

	if var_7_3 and var_7_3 > -1 then
		var_7_4.name = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.name)
		var_7_4.title = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.title)
		var_7_4.desc = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.desc)
		var_7_4.icon = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.icon)
		var_7_4.type = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.type)
		var_7_4.classCharacteristicTitle = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.classCharacteristicTitle)
		var_7_4.weaponCharacteristicTitle = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.weaponCharacteristicTitle)
		var_7_4.weaponRef = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.baseWeapon)
		var_7_4.attachments = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.attachments)
		var_7_4.rarityNum = tonumber(StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.rarity))
		var_7_4.maxStackSize = tonumber(StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.maxStackSize))
		var_7_4.isBlueprint = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.isBlueprint)
		var_7_4.contractType = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.contractType)
		var_7_4.contractTime = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.contractTime)
		var_7_4.missionRef = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.missionRef)
		var_7_4.contractReward1Ref = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.contractReward1Ref)
		var_7_4.contractReward2Ref = StringTable.CBGJCDIHCE(var_7_0, var_7_3, CSV.BRLootBase.cols.contractReward2Ref)

		return var_7_4
	end

	return nil
end

function BRLOOT.GetEquipmentLootRarityNumber(arg_9_0)
	return (tonumber(StringTable.DIFCHIGDFB(CSV.BRLootBase.file, CSV.BRLootBase.cols.baseWeapon, arg_9_0, CSV.BRLootBase.cols.rarity)))
end

function BRLOOT.GetAbbreviatedNumber(arg_10_0)
	local var_10_0 = 1000000000
	local var_10_1 = 1000000
	local var_10_2 = 1000
	local var_10_3

	if var_10_0 <= arg_10_0 then
		arg_10_0 = string.format("%g", tonumber(string.format("%.1f", arg_10_0 / var_10_0)))
		var_10_3 = Engine.CBBHFCGDIC("LUA_MENU/ABBREVIATED_CASH_BILLION", arg_10_0)
	elseif var_10_1 <= arg_10_0 then
		arg_10_0 = string.format("%g", tonumber(string.format("%.1f", arg_10_0 / var_10_1)))
		var_10_3 = Engine.CBBHFCGDIC("LUA_MENU/ABBREVIATED_CASH_MILLION", arg_10_0)
	elseif var_10_2 <= arg_10_0 then
		arg_10_0 = string.format("%g", tonumber(string.format("%.1f", arg_10_0 / var_10_2)))
		var_10_3 = Engine.CBBHFCGDIC("LUA_MENU/ABBREVIATED_CASH_THOUSAND", arg_10_0)
	else
		var_10_3 = arg_10_0
	end

	return var_10_3
end

function BRLOOT.GetCurrentMaxArmorPlates(arg_11_0)
	local var_11_0 = DataSources.inGame.player.healthEquipment.numCharges:GetValue(arg_11_0)
	local var_11_1 = Dvar.CFHDGABACF("scr_br_platePouchCount") or BRLOOT.ARMOR_DATA.SATCHEL.DEFAULT_MAX_COUNT
	local var_11_2 = DataSources.inGame.player.healthEquipment.hasPlatePouch:GetValue(arg_11_0)
	local var_11_3

	if var_11_2 then
		var_11_3 = BRLOOT.MAX_ARMOR_PLATES_HELD + var_11_1
	else
		var_11_3 = BRLOOT.MAX_ARMOR_PLATES_HELD
	end

	return var_11_3 or 0
end

function BRLOOT.IsWeaponNoneValue(arg_12_0)
	return arg_12_0 == BRLOOT.USING_CRATE_NAME or arg_12_0 == BRLOOT.ARMOR_DATA.ARMOR_EQUIPPING_WEP_NAME
end
