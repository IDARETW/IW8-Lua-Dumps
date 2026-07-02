WEAPON = WEAPON or {}
WEAPON.CamoNoneValue = "none"
WEAPON.ReticleNoneValue = "none"
WEAPON.CharmNoneValue = "none"
WEAPON.StickerNoneValue = "none"
WEAPON.NoneValue = "iw8_gunless"
WEAPON.GunsmithTestIndexWeapon = "iw8_ar_akilo47"
WEAPON.FrontEndRiotShield = "iw8_me_riotshield_mp_frontend"
WEAPON.RiotShield = "iw8_me_riotshield_mp"
WEAPON.FrontEndRiotShield_V2 = "iw8_me_riotshield_mpv2_frontend"
WEAPON.RiotShield_V2 = "iw8_me_riotshield_mpv2"
WEAPON.FrontEndRiotShield_V4 = "iw8_me_riotshield_mpv4_frontend"
WEAPON.RiotShield_V4 = "iw8_me_riotshield_mpv4"
WEAPON.FrontEndRiotShield_V5 = "iw8_me_riotshield_mpv5_frontend"
WEAPON.RiotShield_V5 = "iw8_me_riotshield_mpv5"
WEAPON.FrontEndRiotShield_V6 = "iw8_me_riotshield_mpv6_frontend"
WEAPON.RiotShield_V6 = "iw8_me_riotshield_mpv6"
WEAPON.Knife = "iw8_knife_mp"
WEAPON.MasterKnifeRef = "me_knife"
WEAPON.KaliSticks = "iw8_me_akimboblunt"
WEAPON.Swords = "iw8_me_akimboblades"
WEAPON.DefaultPrimary = "iw8_ar_kilo433"
WEAPON.DefaultPrimaryID = 20
WEAPON.DefaultSecondary = "iw8_pi_mike1911"
WEAPON.DefaultSecondaryID = 4
WEAPON.PrimarySlot = 0
WEAPON.SecondarySlot = 1
WEAPON.SandbagShort = 0
WEAPON.SandbagMedium = 1
WEAPON.SandbagLong = 2
WEAPON.ARClass = "weapon_assault"
WEAPON.LMGClass = "weapon_lmg"
WEAPON.sniperClass = "weapon_sniper"
WEAPON.DMRClass = "weapon_dmr"
WEAPON.pistolClass = "weapon_pistol"
WEAPON.SMGClass = "weapon_smg"
WEAPON.SHOTGUNClass = "weapon_shotgun"
WEAPON.LAUNCHERClass = "weapon_projectile"
WEAPON.MELEEClass = "weapon_melee"
WEAPON.MELEEClass2 = "weapon_melee2"
WEAPON.baseVariant = 0
WEAPON.goldCamoIDOffset = 2000100
WEAPON.clientWeaponPrimary = 0
WEAPON.clientWeaponSecondary = 1
WEAPON.clientWeaponPreview = 2
WEAPON.clientWeaponWatch = 3
WEAPON.maxLoadoutWeapons = 2
WEAPON.maxAttachmentsPerWeapon = 5
WEAPON.maxStickersPerWeapon = 4
WEAPON.emptyCustomizeSlotIcon = "customization_empty_slot"
WEAPON.JavelinStateType = {
	Hold = 2,
	Fire = 3,
	Scanning = 1,
	Off = 0,
	TooClose = 4
}
WEAPON.BinocularsStateType = {
	MarkingTarget = 1,
	Idle = 0,
	MarkResistant = 2
}
WEAPON.WeaponClassInC = {
	PISTOL = 5,
	ROCKETLAUNCHER = 7,
	SPREAD = 4,
	THROWINGKNIFE = 9,
	NON_PLAYER = 10,
	TURRET = 8,
	SNIPER = 1,
	NONE = 14,
	SMG = 3,
	RIFLE = 0,
	BALL = 13,
	ITEM = 11,
	MG = 2,
	GRENADE = 6,
	BEAM = 12
}
WEAPON.WeaponVariantMap = {
	optic = CSV.weaponVariants.cols.attachments.optic,
	magazine = CSV.weaponVariants.cols.attachments.mag,
	gunperk = CSV.weaponVariants.cols.attachments.perk,
	muzzle = CSV.weaponVariants.cols.attachments.muzzle,
	reargrip = CSV.weaponVariants.cols.attachments.rearGrip,
	undermount = CSV.weaponVariants.cols.attachments.underBarrel,
	extra = CSV.weaponVariants.cols.attachments.extra,
	frontpiece = CSV.weaponVariants.cols.attachments.barrel,
	backpiece = CSV.weaponVariants.cols.attachments.stock,
	trigger = CSV.weaponVariants.cols.attachments.trigger,
	other = CSV.weaponVariants.cols.attachments.other,
	extrapstl = CSV.weaponVariants.cols.attachments.extra
}
WEAPON.UltimateChallengeCounts = {
	MAX = 282,
	MIN = 16
}
WEAPON.UltimateChallengeItemId = 171217

function WEAPON.StripSuffix(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0
	local var_1_1 = string.len(arg_1_0)

	if string.sub(arg_1_0, var_1_1 - 2) == arg_1_1 then
		var_1_0 = string.sub(arg_1_0, 0, var_1_1 - 3)
	end

	return var_1_0
end

function WEAPON.GetClassSlot(arg_2_0)
	local var_2_0 = StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, arg_2_0, CSV.weaponClasses.cols.slot)

	if not var_2_0 or #var_2_0 == 0 then
		return WEAPON.PrimarySlot
	else
		return tonumber(var_2_0) - 1
	end
end

function WEAPON.GetSlotFromRef(arg_3_0)
	local var_3_0 = WEAPON.GetWeaponClass(arg_3_0)

	return (WEAPON.GetClassSlot(var_3_0))
end

function WEAPON.GetWeaponSandbagPlacementIndex(arg_4_0)
	local var_4_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.asset, arg_4_0, CSV.weapons.cols.menuClass)
	local var_4_1 = WEAPON.SandbagShort

	if var_4_0 == WEAPON.ARClass or var_4_0 == WEAPON.LMGClass then
		var_4_1 = WEAPON.SandbagMedium
	elseif var_4_0 == WEAPON.sniperClass then
		var_4_1 = WEAPON.SandbagLong
	end

	return var_4_1
end

function WEAPON.GetWeaponClass(arg_5_0)
	local var_5_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_5_0, CSV.weapons.cols.menuClass)

	if CONDITIONS.IsThirdGameMode() and var_5_0 == "weapon_classic_s" then
		var_5_0 = "weapon_classic_p"
	end

	return var_5_0
end

function WEAPON.GetWeaponClassName(arg_6_0)
	local var_6_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_6_0, CSV.weapons.cols.menuClass)

	if var_6_0 and #var_6_0 > 0 then
		return StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, var_6_0, CSV.weaponClasses.cols.name)
	end
end

function WEAPON.GetWeaponDetailsFromModel(arg_7_0)
	local var_7_0 = "+"
	local var_7_1 = LUI.Split(arg_7_0, var_7_0)[1]
	local var_7_2
	local var_7_3 = LUI.FindLast(var_7_1, "_mp")
	local var_7_4 = string.sub(var_7_1, 0, var_7_3 + 2)
	local var_7_5 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, var_7_4, CSV.MPWeapons.cols.class)
	local var_7_6 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, var_7_4, CSV.MPWeapons.cols.ref)

	return {
		weaponAsset = var_7_4,
		weaponClass = var_7_5,
		weaponRef = var_7_6
	}
end

function WEAPON.GetChallengeUnlockRow(arg_8_0)
	return StringTable.BJJBBCJGEJ(CSV.gunChallenges.file, CSV.gunChallenges.cols.loot, arg_8_0)
end

function WEAPON.GetWeaponClassAttachUnlockTablePrefix(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, arg_9_0, CSV.weaponClasses.cols.unlockTablePrefix)
end

function WEAPON.GetClassName(arg_10_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, arg_10_0, CSV.weaponClasses.cols.name))
end

function WEAPON.GetName(arg_11_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_11_0, CSV.weapons.cols.name))
end

function WEAPON.GetDisplayOrder(arg_12_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_12_0, CSV.weapons.cols.displayOrder))
end

function WEAPON.GetNameFromAsset(arg_13_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.asset, arg_13_0, CSV.weapons.cols.name))
end

function WEAPON.GetCategory(arg_14_0)
	local var_14_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_14_0, CSV.weapons.cols.category)

	if not var_14_0 or not (#var_14_0 > 0) then
		var_14_0 = "CAS/DEFAULT_WEAPON_CATEGORY"
	end

	return Engine.CBBHFCGDIC(var_14_0)
end

function WEAPON.GetDesc(arg_15_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_15_0, CSV.weapons.cols.desc))
end

function WEAPON.GetImage(arg_16_0)
	local var_16_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_16_0, CSV.weapons.cols.image)

	return var_16_0 == "" and "white" or var_16_0
end

function WEAPON.GetProgressionImage(arg_17_0)
	local var_17_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_17_0, CSV.weapons.cols.progressionImage)

	return var_17_0 == "" and "white" or var_17_0
end

function WEAPON.GetBWImage(arg_18_0)
	local var_18_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_18_0, CSV.weapons.cols.BWImage)

	return var_18_0 == "" and "white" or var_18_0
end

function WEAPON.GetShowcaseImage(arg_19_0)
	return WEAPON.GetImage(arg_19_0)
end

function WEAPON.GetModificationsByWeaponWithBaseWeapon(arg_20_0)
	local var_20_0 = WEAPON.GetModificationsByWeapon(arg_20_0)

	for iter_20_0, iter_20_1 in pairs(var_20_0) do
		table.insert(iter_20_1, 1, {
			name = "",
			weapon = iter_20_0,
			attachments = {}
		})
	end

	return var_20_0
end

function WEAPON.GetModificationsByWeapon(arg_21_0, arg_21_1)
	local var_21_0 = WEAPON.GetModifications(arg_21_0, arg_21_1)
	local var_21_1 = {}

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		if not var_21_1[iter_21_1.weapon] then
			var_21_1[iter_21_1.weapon] = {}
		end

		table.insert(var_21_1[iter_21_1.weapon], iter_21_1)
	end

	return var_21_1
end

function WEAPON.GetArmoryWeaponsByClass(arg_22_0, arg_22_1)
	local var_22_0 = WEAPON.GetModifications(arg_22_0, arg_22_1)
	local var_22_1 = {}

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		local var_22_2 = WEAPON.GetWeaponClass(iter_22_1.weapon)

		if not var_22_1[var_22_2] then
			var_22_1[var_22_2] = {}
		end

		table.insert(var_22_1[var_22_2], iter_22_1)
	end

	return var_22_1
end

function WEAPON.GetVariantFile(arg_23_0)
	local var_23_0 = string.sub(arg_23_0, 5)

	return CSV.weaponVariants:GetFile(var_23_0)
end

function WEAPON.GetVariantRef(arg_24_0)
	return StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_24_0, CSV.weaponIDs.cols.variantRef)
end

function WEAPON.GetVariantBaseRef(arg_25_0)
	return StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_25_0, CSV.weaponIDs.cols.baseRef)
end

function WEAPON.GetLootWeaponName(arg_26_0, arg_26_1)
	local var_26_0 = WEAPON.GetVariantFile(arg_26_0)
	local var_26_1 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_26_1, CSV.weaponIDs.cols.variantRef)

	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_26_0, CSV.weaponVariants.cols.ref, var_26_1, CSV.weaponVariants.cols.name))
end

function WEAPON.GetLootWeaponRef(arg_27_0, arg_27_1)
	local var_27_0 = WEAPON.GetVariantFile(arg_27_0)

	return StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_27_1, CSV.weaponIDs.cols.variantRef)
end

function WEAPON.IsVariant(arg_28_0, arg_28_1)
	return WEAPON.GenerateWeaponTableFromID(arg_28_0, arg_28_1).variantID > 0
end

WEAPON.allLootMods = {}

function WEAPON.PopulateLootMods()
	for iter_29_0 = 0, StringTable.BFHCAIIDA(CSV.weaponIDs.file) - 1 do
		local var_29_0 = CSV.ReadRow(CSV.weaponIDs, iter_29_0)

		if tonumber(var_29_0.quality) > 0 then
			if not WEAPON.allLootMods[var_29_0.baseRef] then
				WEAPON.allLootMods[var_29_0.baseRef] = {}
			end

			local var_29_1 = WEAPON.GetVariantFile(var_29_0.baseRef)
			local var_29_2 = StringTable.BJJBBCJGEJ(var_29_1, CSV.weaponVariants.cols.ref, var_29_0.variantRef)
			local var_29_3 = CSV.ReadRowWithFile(CSV.weaponVariants, var_29_1, var_29_2)
			local var_29_4 = {
				weaponData = var_29_0,
				variantData = var_29_3
			}

			table.insert(WEAPON.allLootMods[var_29_0.baseRef], var_29_4)
		end
	end
end

function WEAPON.GetLootModTable(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = {}

	var_30_0.blueprintName = ""
	var_30_0.lootName = Engine.CBBHFCGDIC(arg_30_3.name)
	var_30_0.weapon = arg_30_1
	var_30_0.attachments = {}
	var_30_0.lootID = tonumber(arg_30_2)
	var_30_0.variantID = tonumber(arg_30_3.variantID)

	for iter_30_0, iter_30_1 in pairs(arg_30_3.attachments) do
		if #iter_30_1 > 0 then
			local var_30_1 = {}
			local var_30_2, var_30_3 = ATTACHMENT.GetRefAndVariantID(iter_30_1)

			var_30_1.ref = var_30_2
			var_30_1.variantID = tonumber(var_30_3) or ATTACHMENT.baseVariant

			table.insert(var_30_0.attachments, var_30_1)
		end
	end

	var_30_0.isCustom = false
	var_30_0.isBase = var_30_0.variantID == WEAPON.baseVariant
	var_30_0.displayOrder = WEAPON.GetDisplayOrder(arg_30_1)

	return var_30_0
end

function WEAPON.GetModifications(arg_31_0, arg_31_1)
	if not WEAPON.allLootMods[WEAPON.GunsmithTestIndexWeapon] then
		WEAPON.PopulateLootMods()
	end

	arg_31_1 = arg_31_1 or {}

	local var_31_0 = {}
	local var_31_1 = arg_31_1.includeBundleItems or arg_31_1.exclusiveBundleItems

	if var_31_1 and Engine.CJJAFGIFAC(arg_31_0) then
		var_31_0 = WEAPON.GetPriorityVariants(arg_31_0)
		var_31_0 = WEAPON.GetAllVariantsInStore(arg_31_0, {
			variantsTable = var_31_0
		})
	end

	if arg_31_1.checkOwnership == nil then
		arg_31_1.checkOwnership = true
	end

	local var_31_2 = {}

	if not arg_31_1.forceCustom then
		for iter_31_0, iter_31_1 in pairs(WEAPON.allLootMods) do
			local var_31_3 = arg_31_1.byWeapons and not arg_31_1.byWeapons[iter_31_0]

			if arg_31_1.includeBaseWeapons and not var_31_3 then
				local var_31_4 = LOOT.GetBaseWeaponItemID(iter_31_0)

				if not arg_31_1.checkOwnership or LOOT.IsUnlockedWithID(arg_31_0, var_31_4) then
					local var_31_5 = WEAPON.GetLootModTable(arg_31_0, iter_31_0, Cac.BaseLootID, {
						name = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, iter_31_0, CSV.weapons.cols.name),
						variantID = WEAPON.baseVariant,
						attachments = {}
					})

					var_31_5.rarity = 0

					table.insert(var_31_2, var_31_5)
				end
			end

			for iter_31_2, iter_31_3 in ipairs(iter_31_1) do
				local var_31_6 = iter_31_3.weaponData
				local var_31_7 = iter_31_3.variantData
				local var_31_8 = arg_31_1.byWeapons and not arg_31_1.byWeapons[iter_31_0]
				local var_31_9 = not arg_31_1.checkOwnership or LOOT.IsUnlockedWithID(arg_31_0, var_31_6.index)
				local var_31_10 = var_31_0[tonumber(var_31_6.index)]
				local var_31_11 = var_31_9 or var_31_10 and var_31_1
				local var_31_12 = var_31_10 and not var_31_9 or not arg_31_1.exclusiveBundleItems

				if not var_31_8 and var_31_11 and var_31_12 then
					local var_31_13 = WEAPON.GetLootModTable(arg_31_0, iter_31_0, iter_31_3.weaponData.index, iter_31_3.variantData)

					var_31_13.rarity = tonumber(var_31_6.quality)
					var_31_13.fromBundle = var_31_10 and not var_31_9
					var_31_13.bundleID = var_31_10 and var_31_1 and var_31_0[tonumber(var_31_6.index)].bundleID

					table.insert(var_31_2, var_31_13)
				end
			end
		end
	end

	if not arg_31_1.forceLoot then
		GUNSMITH.GetAllCustomMods(arg_31_0, var_31_2, arg_31_1)
	end

	return var_31_2
end

function WEAPON.GetModification(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = {
		[arg_32_1] = true
	}
	local var_32_1 = WEAPON.GetModifications(arg_32_0, {
		forceLoot = true,
		checkOwnership = false,
		byWeapons = var_32_0
	})
	local var_32_2 = {}
	local var_32_3

	for iter_32_0, iter_32_1 in ipairs(var_32_1) do
		if iter_32_1.lootID == arg_32_2 then
			var_32_3 = iter_32_1

			break
		end
	end

	assert(var_32_3)

	if not var_32_3 then
		return WEAPON.GenerateWeaponTableFromRef(arg_32_1)
	else
		return var_32_3
	end
end

function WEAPON.GetModificationAttachments(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = {
		[arg_33_1] = true
	}
	local var_33_1 = WEAPON.GetModifications(arg_33_0, {
		forceLoot = true,
		checkOwnership = false,
		byWeapons = var_33_0
	})
	local var_33_2 = {}
	local var_33_3

	for iter_33_0, iter_33_1 in ipairs(var_33_1) do
		if iter_33_1.lootID == arg_33_2 then
			var_33_3 = iter_33_1

			break
		end
	end

	if not var_33_3 then
		return var_33_2
	end

	for iter_33_2, iter_33_3 in ipairs(var_33_3.attachments) do
		var_33_2[iter_33_3.ref] = var_33_2[iter_33_3.ref] or {}
		var_33_2[iter_33_3.ref] = iter_33_3.variantID or ATTACHMENT.baseVariant
	end

	return var_33_2
end

function WEAPON.GetAttachVariants(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = CSV.attachmentIDs.GetFile(arg_34_2)
	local var_34_1 = StringTable.BJJBBCJGEJ(var_34_0, CSV.attachmentIDs.cols.index, arg_34_1)
	local var_34_2 = CSV.ReadRowWithFile(CSV.attachmentIDs, var_34_0, var_34_1)
	local var_34_3 = var_34_2.ref
	local var_34_4 = {}
	local var_34_5 = {
		variantID = ATTACHMENT.baseVariant,
		lootID = LOOT.emptyID,
		baseRef = var_34_3
	}

	table.insert(var_34_4, var_34_5)

	local var_34_6 = 0

	while var_34_2.variantLootID and #var_34_2.variantLootID > 0 do
		if LOOT.IsUnlockedWithID(arg_34_0, var_34_2.variantLootID) then
			local var_34_7 = {
				variantID = tonumber(var_34_2.variantID),
				lootID = tonumber(var_34_2.variantLootID),
				baseRef = var_34_3
			}

			table.insert(var_34_4, var_34_7)
		end

		var_34_6 = var_34_6 + 1

		local var_34_8 = CSV.attachmentIDs.variantOffset * var_34_6
		local var_34_9 = {
			variantID = CSV.attachmentIDs.cols.variantID + var_34_8,
			variantLootID = CSV.attachmentIDs.cols.variantLootID + var_34_8
		}

		var_34_2 = CSV.ReadRowWithFileAndColumns(var_34_0, var_34_1, var_34_9)
	end

	return var_34_4
end

function WEAPON.GetWeaponsWithModifications(arg_35_0, arg_35_1)
	local var_35_0 = WEAPON.GetModifications(arg_35_0, arg_35_1)
	local var_35_1 = {}
	local var_35_2 = {}

	for iter_35_0, iter_35_1 in ipairs(var_35_0) do
		local var_35_3 = iter_35_1.weapon

		if not var_35_2[var_35_3] then
			var_35_2[var_35_3] = true

			table.insert(var_35_1, var_35_3)
		end
	end

	return var_35_1
end

function WEAPON.HasModifications(arg_36_0, arg_36_1)
	return #WEAPON.GetModifications(arg_36_0, {
		byWeapon = arg_36_1
	}) > 0
end

function WEAPON.GetStatsForWeapon(arg_37_0)
	local var_37_0 = StringTable.BJJBBCJGEJ(CSV.weapons.file, CSV.weapons.cols.ref, arg_37_0)

	return (CSV.ReadRow(CSV.weapons, var_37_0))
end

function WEAPON.GetEquippedCamo(arg_38_0)
	return arg_38_0.camo:get()
end

function WEAPON.SetEquippedCamo(arg_39_0, arg_39_1)
	return arg_39_0.camo:set(arg_39_1)
end

function WEAPON.GetCamoName(arg_40_0)
	return StringTable.DIFCHIGDFB(CSV.camoTable.file, CSV.camoTable.cols.ref, arg_40_0, CSV.camoTable.cols.name)
end

function WEAPON.GetCamoImage(arg_41_0)
	return StringTable.DIFCHIGDFB(CSV.camoTable.file, CSV.camoTable.cols.ref, arg_41_0, CSV.camoTable.cols.image)
end

function WEAPON.GetCamoSeason(arg_42_0)
	return StringTable.DIFCHIGDFB(CSV.camoTable.file, CSV.camoTable.cols.ref, arg_42_0, CSV.camoTable.cols.season)
end

function WEAPON.GetCamoCategory(arg_43_0)
	return StringTable.DIFCHIGDFB(CSV.camoTable.file, CSV.camoTable.cols.ref, arg_43_0, CSV.camoTable.cols.category)
end

function WEAPON.GetEquippedReticle(arg_44_0)
	return arg_44_0.reticle:get()
end

function WEAPON.SetEquippedReticle(arg_45_0, arg_45_1)
	return arg_45_0.reticle:set(arg_45_1)
end

function WEAPON.GetReticleName(arg_46_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_46_0, CSV.reticles.cols.name)
end

function WEAPON.GetReticleImage(arg_47_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_47_0, CSV.reticles.cols.image)
end

function WEAPON.GetReticleSeason(arg_48_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_48_0, CSV.reticles.cols.season)
end

function WEAPON.GetReticleDesc(arg_49_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_49_0, CSV.reticles.cols.desc)
end

function WEAPON.GetReticleType(arg_50_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_50_0, CSV.reticles.cols.type)
end

function WEAPON.GetReticleCategory(arg_51_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_51_0, CSV.reticles.cols.category)
end

function WEAPON.GetReticleCategoryName(arg_52_0)
	return StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.categoryRef, arg_52_0, CSV.reticleCategoryTable.cols.categoryName)
end

function WEAPON.SupportsOptics(arg_53_0)
	return StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_53_0, CSV.weapons.cols.canUseOptics) == "1"
end

function WEAPON.GetEquippedCharm(arg_54_0)
	return arg_54_0.cosmeticAttachment:get()
end

function WEAPON.SetEquippedCharm(arg_55_0, arg_55_1)
	return arg_55_0.cosmeticAttachment:set(arg_55_1)
end

function WEAPON.GetCharmName(arg_56_0)
	return StringTable.DIFCHIGDFB(CSV.charms.file, CSV.charms.cols.ref, arg_56_0, CSV.charms.cols.name)
end

function WEAPON.GetCharmImage(arg_57_0)
	return StringTable.DIFCHIGDFB(CSV.charms.file, CSV.charms.cols.ref, arg_57_0, CSV.charms.cols.image)
end

function WEAPON.GetCharmSeason(arg_58_0)
	return StringTable.DIFCHIGDFB(CSV.charms.file, CSV.charms.cols.ref, arg_58_0, CSV.charms.cols.season)
end

function WEAPON.GetCharmCategory(arg_59_0)
	return StringTable.DIFCHIGDFB(CSV.charms.file, CSV.charms.cols.ref, arg_59_0, CSV.charms.cols.category)
end

function WEAPON.SupportsCosmetics(arg_60_0)
	return StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_60_0, CSV.weapons.cols.canUseCosmetic) == "1"
end

function WEAPON.GetEquippedStickers(arg_61_0)
	local var_61_0 = {}

	for iter_61_0 = 1, #arg_61_0.sticker do
		var_61_0[iter_61_0] = WEAPON.GetEquippedStickerForIndex(arg_61_0, iter_61_0)
	end

	return var_61_0
end

function WEAPON.GetEquippedStickerForIndex(arg_62_0, arg_62_1)
	return arg_62_0.sticker[arg_62_1 - 1]:get()
end

function WEAPON.SetEquippedStickerForIndex(arg_63_0, arg_63_1, arg_63_2)
	return arg_63_0.sticker[arg_63_1 - 1]:set(arg_63_2)
end

function WEAPON.GetStickerIDFromRef(arg_64_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_64_0, CSV.stickers.cols.netConstID)
end

function WEAPON.GetStickerName(arg_65_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_65_0, CSV.stickers.cols.name)
end

function WEAPON.GetStickerImage(arg_66_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_66_0, CSV.stickers.cols.image)
end

function WEAPON.GetStickerSeason(arg_67_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_67_0, CSV.stickers.cols.season)
end

function WEAPON.GetStickerCategory(arg_68_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_68_0, CSV.stickers.cols.category)
end

function WEAPON.GetMaxStickerSlotsForWeapon(arg_69_0)
	local var_69_0 = tonumber(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_69_0, CSV.weapons.cols.stickerSlots))

	return var_69_0 ~= nil and var_69_0 or 0
end

function WEAPON.ForceWideSecondaryCamera(arg_70_0)
	return arg_70_0 == WEAPON.KaliSticks or arg_70_0 == WEAPON.Swords
end

function WEAPON.GetCosmeticConfigString(arg_71_0)
	local var_71_0 = ""
	local var_71_1 = arg_71_0.camo
	local var_71_2 = arg_71_0.reticle
	local var_71_3 = arg_71_0.cosmeticAttachment
	local var_71_4 = arg_71_0.stickers

	if var_71_1 then
		var_71_0 = var_71_0 .. "+" .. var_71_1
	end

	if var_71_2 then
		var_71_0 = var_71_0 .. "+" .. var_71_2
	end

	if var_71_3 then
		var_71_0 = var_71_0 .. "+" .. var_71_3
	end

	if var_71_4 then
		for iter_71_0 = 1, #var_71_4 do
			local var_71_5 = var_71_4[iter_71_0]

			if var_71_5 then
				var_71_0 = var_71_0 .. "+" .. var_71_5
			end
		end
	end

	if #var_71_0 > 0 then
		var_71_0 = string.sub(var_71_0, 2)
	end

	return var_71_0
end

function WEAPON.IsWeaponNoneValue(arg_72_0)
	return not arg_72_0 or arg_72_0 == "" or arg_72_0 == "iw8_fists_mp" or arg_72_0 == "iw8_fists" or arg_72_0 == "none" or arg_72_0 == WEAPON.NoneValue or arg_72_0 == WEAPON.NoneValue .. "_infil" or CONDITIONS.IsMagmaGameMode() and BRLOOT.IsWeaponNoneValue(arg_72_0)
end

function WEAPON.ClearWeaponCosmetics(arg_73_0)
	arg_73_0.camo:set(WEAPON.CamoNoneValue)
	arg_73_0.reticle:set(WEAPON.ReticleNoneValue)
	arg_73_0.cosmeticAttachment:set(WEAPON.CharmNoneValue)

	for iter_73_0 = 0, #arg_73_0.sticker - 1 do
		arg_73_0.sticker[iter_73_0]:set(WEAPON.StickerNoneValue)
	end
end

function WEAPON.WipeWeaponSetup(arg_74_0)
	ATTACHMENT.ClearAllAttachments(arg_74_0)
	WEAPON.ClearWeaponCosmetics(arg_74_0)
	arg_74_0.variantID:set(Cac.BaseVariantID)
	arg_74_0.lootItemID:set(Cac.BaseLootID)
	arg_74_0.blueprintName:set("")
end

function WEAPON.GetWeaponModelNameFromPlayerData(arg_75_0, arg_75_1, arg_75_2)
	return WEAPON.GetWeaponModelName(arg_75_0, WEAPON.GenerateWeaponTable(arg_75_1), arg_75_2)
end

function WEAPON.GetWeaponModelNameFromRef(arg_76_0, arg_76_1)
	return WEAPON.GetWeaponModelName(arg_76_0, WEAPON.GenerateWeaponTableFromRef(arg_76_0), arg_76_1)
end

function WEAPON.GetWeaponModelName(arg_77_0, arg_77_1, arg_77_2)
	arg_77_2 = arg_77_2 or {}

	if arg_77_2.includeAttachments == nil then
		arg_77_2.includeAttachments = false
	end

	if arg_77_2.includeCamos == nil then
		arg_77_2.includeCamo = false
	end

	if arg_77_2.includeStickers == nil then
		arg_77_2.includeStickers = false
	end

	if arg_77_2.useOperatorOverride == nil then
		arg_77_2.useOperatorOverride = false
	end

	if not arg_77_2.useOperatorOverride and arg_77_2.useGuntableOverride == nil then
		arg_77_2.useGuntableOverride = true
	else
		arg_77_2.useGuntableOverride = false
	end

	if arg_77_2.isDefault == nil then
		arg_77_2.isDefault = false
	end

	local var_77_0

	if not arg_77_2.keepAkimbo then
		for iter_77_0, iter_77_1 in ipairs(arg_77_1.attachments) do
			if ATTACHMENT.GetBaseRef(iter_77_1.ref) == ATTACHMENT.akimbo then
				var_77_0 = iter_77_0
			end
		end
	end

	local var_77_1 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_77_0, CSV.MPWeapons.cols.asset)
	local var_77_2 = ""

	if arg_77_2.useOperatorOverride then
		var_77_2 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_77_0, CSV.MPWeapons.cols.operatorOverrideAsset)
	elseif arg_77_2.useGuntableOverride then
		var_77_2 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_77_0, CSV.MPWeapons.cols.gunTableOverrideAsset)
	end

	if #var_77_2 > 0 then
		var_77_1 = var_77_2
	end

	local var_77_3 = {}
	local var_77_4 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_77_0, CSV.MPWeapons.cols.defaultAttachments)

	if var_77_4 and #var_77_4 > 0 then
		var_77_3 = LUI.Split(var_77_4, " ")
	end

	local var_77_5 = {}
	local var_77_6 = ""

	if arg_77_1.lootID and tonumber(arg_77_1.lootID) ~= LOOT.emptyID then
		local var_77_7 = {}
		local var_77_8 = WEAPON.GetVariantFile(arg_77_0)
		local var_77_9 = StringTable.DIFCHIGDFB(var_77_8, CSV.weaponVariants.cols.variantID, arg_77_1.variantID, CSV.weaponVariants.cols.defaultAttachmentOverrides)

		var_77_6 = StringTable.DIFCHIGDFB(var_77_8, CSV.weaponVariants.cols.variantID, arg_77_1.variantID, CSV.weaponVariants.cols.assetOverride)

		if arg_77_2.useOperatorOverride then
			var_77_2 = StringTable.DIFCHIGDFB(var_77_8, CSV.weaponVariants.cols.variantID, arg_77_1.variantID, CSV.weaponVariants.cols.operatorOverrideAsset)
		elseif arg_77_2.useGuntableOverride then
			var_77_2 = StringTable.DIFCHIGDFB(var_77_8, CSV.weaponVariants.cols.variantID, arg_77_1.variantID, CSV.weaponVariants.cols.gunTableOverrideAsset)
		end

		if #var_77_2 > 0 then
			var_77_1 = var_77_2
		end

		if var_77_9 and #var_77_9 > 0 then
			var_77_7 = LUI.Split(var_77_9, " ")
		end

		for iter_77_2, iter_77_3 in ipairs(var_77_7) do
			local var_77_10, var_77_11 = ATTACHMENT.GetRefAndVariantID(iter_77_3)

			var_77_5[var_77_10] = var_77_11

			if not LUI.IsItemInArray(var_77_3, var_77_10) then
				table.insert(var_77_3, var_77_10)
			end
		end
	end

	local var_77_12

	if var_77_6 and #var_77_6 > 0 then
		var_77_12 = arg_77_0
		arg_77_0 = var_77_6

		if #var_77_2 <= 0 then
			var_77_1 = var_77_6
		end
	end

	local var_77_13 = {}

	if arg_77_2.includeAttachments then
		for iter_77_4, iter_77_5 in ipairs(var_77_3) do
			table.insert(var_77_13, iter_77_5)
		end

		local var_77_14
		local var_77_15

		if arg_77_1.lootID and tonumber(arg_77_1.lootID) ~= LOOT.emptyID then
			local var_77_16 = WEAPON.GetVariantFile(var_77_12 or arg_77_0)
			local var_77_17 = StringTable.DIFCHIGDFB(var_77_16, CSV.weaponVariants.cols.variantID, arg_77_1.variantID, CSV.weaponVariants.cols.extraToID)

			if var_77_17 and #var_77_17 > 0 then
				var_77_14, var_77_15 = ATTACHMENT.GetRefAndVariantID(var_77_17)
			end
		end

		for iter_77_6 = 1, #arg_77_1.attachments do
			if iter_77_6 ~= var_77_0 then
				local var_77_18 = arg_77_2.isDefault and arg_77_1.attachments[iter_77_6] or arg_77_1.attachments[iter_77_6].ref

				if var_77_18 and var_77_18 ~= ATTACHMENT.none then
					table.insert(var_77_13, var_77_18)

					local var_77_19 = ATTACHMENT.GetRef(var_77_18, arg_77_0, var_77_12)

					if var_77_19 and var_77_19 ~= ATTACHMENT.none then
						local var_77_20 = ATTACHMENT.GetAttachmentAddition(var_77_19)

						if var_77_20 and #var_77_20 > 0 and var_77_20 ~= ATTACHMENT.none then
							table.insert(var_77_13, var_77_20)

							if var_77_14 and var_77_15 and var_77_14 == var_77_20 then
								var_77_5[var_77_20] = tonumber(var_77_15)
							end
						end
					end
				end

				local var_77_21 = arg_77_1.attachments[iter_77_6].variantID

				if var_77_21 and var_77_21 > 0 then
					var_77_5[var_77_18] = var_77_21
				end
			end
		end

		var_77_13 = WEAPON.FilterAttachments(var_77_13)
	else
		var_77_13 = var_77_3
	end

	if arg_77_1.cosmeticAttachment then
		table.insert(var_77_13, arg_77_1.cosmeticAttachment)
	end

	for iter_77_7, iter_77_8 in ipairs(var_77_13) do
		local var_77_22 = ATTACHMENT.GetRef(iter_77_8, arg_77_0, var_77_12)

		if var_77_22 and var_77_22 ~= "" and var_77_22 ~= ATTACHMENT.none then
			var_77_1 = var_77_1 .. "+" .. var_77_22

			if var_77_5[iter_77_8] then
				var_77_1 = var_77_1 .. "|" .. var_77_5[iter_77_8]
			end
		end
	end

	if arg_77_2.includeCamos and arg_77_1.camo ~= nil then
		local var_77_23 = arg_77_1.camo

		if var_77_23 and var_77_23 ~= WEAPON.CamoNoneValue then
			var_77_1 = var_77_1 .. "+camo|" .. var_77_23
		end
	end

	if arg_77_2.includeStickers and arg_77_1.stickers ~= nil then
		local var_77_24 = arg_77_1.stickers

		for iter_77_9 = 1, #var_77_24 do
			if var_77_24[iter_77_9] ~= WEAPON.StickerNoneValue then
				local var_77_25 = WEAPON.GetStickerIDFromRef(var_77_24[iter_77_9])

				if var_77_25 ~= nil and var_77_25 ~= "" then
					var_77_1 = var_77_1 .. "+sticker" .. iter_77_9 - 1 .. "|" .. var_77_25
				end
			end
		end
	end

	return var_77_1
end

function WEAPON.FilterAttachments(arg_78_0)
	arg_78_0 = arg_78_0 or {}

	if #arg_78_0 <= 0 then
		return arg_78_0
	end

	local var_78_0 = {}

	for iter_78_0, iter_78_1 in ipairs(arg_78_0) do
		local var_78_1 = true

		for iter_78_2, iter_78_3 in ipairs(var_78_0) do
			if iter_78_1 == var_78_0[iter_78_2] then
				var_78_1 = false

				break
			end

			local var_78_2 = WEAPON.CheckAttachmentConflict(iter_78_1, iter_78_3)

			if var_78_2 ~= ATTACHMENT.none then
				var_78_1 = false

				table.remove(var_78_0, iter_78_2)

				local var_78_3 = LUI.Split(var_78_2, " ")

				for iter_78_4, iter_78_5 in ipairs(var_78_3) do
					table.insert(arg_78_0, iter_78_0 + iter_78_4, iter_78_5)
				end

				break
			end
		end

		if var_78_1 then
			table.insert(var_78_0, iter_78_1)
		end
	end

	return var_78_0
end

function WEAPON.CheckAttachmentConflict(arg_79_0, arg_79_1)
	local var_79_0 = ATTACHMENT.none
	local var_79_1 = StringTable.BJJBBCJGEJ(CSV.attachmentComboTable.file, CSV.attachmentComboTable.cols.ref, arg_79_1)
	local var_79_2 = true

	if var_79_1 == -1 then
		return var_79_0
	end

	if arg_79_0 == arg_79_1 then
		var_79_0 = arg_79_0
	else
		local var_79_3 = StringTable.DIFCHIGDFB(CSV.attachmentComboTable.file, CSV.attachmentComboTable.cols.ref, arg_79_0, var_79_1)

		if var_79_3 == "no" then
			var_79_0 = arg_79_0
		elseif var_79_3 ~= "" then
			var_79_0 = var_79_3
		end
	end

	return var_79_0
end

function WEAPON.GetStatsTable(arg_80_0)
	local var_80_0 = {}
	local var_80_1 = PlayerData.BFFBGAJGD(arg_80_0, CoD.StatsGroup.Ranked).playerStats.weaponStats

	for iter_80_0 = 0, StringTable.BFHCAIIDA(CSV.MPWeapons.file) do
		local var_80_2 = CSV.ReadRow(CSV.MPWeapons, iter_80_0)

		if var_80_2 ~= nil and tonumber(var_80_2.displayOrder) ~= nil and tonumber(var_80_2.displayOrder) > 0 then
			local var_80_3 = var_80_1[var_80_2.ref]

			if not var_80_3 then
				break
			end

			local var_80_4 = {
				ref = var_80_2.ref,
				name = var_80_2.name,
				image = WEAPON.GetProgressionImage(var_80_2.ref),
				deaths = var_80_3.deaths:get(),
				headShots = var_80_3.headShots:get(),
				hits = var_80_3.hits:get(),
				kills = var_80_3.kills:get(),
				shots = var_80_3.shots:get()
			}

			var_80_4.kdr = var_80_4.kills / (var_80_4.deaths ~= 0 and var_80_4.deaths or 1)
			var_80_4.accuracy = var_80_4.hits / (var_80_4.shots ~= 0 and var_80_4.shots or 1)

			table.insert(var_80_0, var_80_4)
		end
	end

	return var_80_0
end

function WEAPON.GetStatsTableForClass(arg_81_0, arg_81_1)
	local var_81_0 = {}
	local var_81_1 = PlayerData.BFFBGAJGD(arg_81_0, CoD.StatsGroup.Ranked).playerStats.weaponStats

	for iter_81_0 = 0, StringTable.BFHCAIIDA(CSV.MPWeapons.file) do
		local var_81_2 = CSV.ReadRow(CSV.MPWeapons, iter_81_0)

		if var_81_2 ~= nil and tonumber(var_81_2.displayOrder) ~= nil and tonumber(var_81_2.displayOrder) > 0 and var_81_2.class == arg_81_1 then
			local var_81_3 = var_81_1[var_81_2.ref]

			if not var_81_3 then
				break
			end

			local var_81_4 = {
				ref = var_81_2.ref,
				name = var_81_2.name,
				image = WEAPON.GetProgressionImage(var_81_2.ref),
				deaths = var_81_3.deaths:get(),
				headShots = var_81_3.headShots:get(),
				hits = var_81_3.hits:get(),
				kills = var_81_3.kills:get(),
				shots = var_81_3.shots:get(),
				displayOrder = tonumber(var_81_2.displayOrder)
			}

			var_81_4.kdr = var_81_4.kills / (var_81_4.deaths ~= 0 and var_81_4.deaths or 1)
			var_81_4.accuracy = var_81_4.hits / (var_81_4.shots ~= 0 and var_81_4.shots or 1)

			table.insert(var_81_0, var_81_4)
		end
	end

	return var_81_0
end

function WEAPON.EquipBaseWeapon(arg_82_0, arg_82_1)
	if #arg_82_0.blueprintName:get() > 0 or arg_82_1 ~= arg_82_0.weapon:get() then
		arg_82_0.camo:set(WEAPON.CamoNoneValue)
		arg_82_0.reticle:set(WEAPON.ReticleNoneValue)
		arg_82_0.cosmeticAttachment:set(WEAPON.CharmNoneValue)
		arg_82_0.weapon:set(arg_82_1)
		arg_82_0.variantID:set(WEAPON.baseVariant)
		arg_82_0.blueprintName:set("")
		arg_82_0.lootItemID:set(LOOT.emptyID)

		for iter_82_0 = 0, #arg_82_0.attachmentSetup - 1 do
			arg_82_0.attachmentSetup[iter_82_0].attachment:set(ATTACHMENT.none)
			arg_82_0.attachmentSetup[iter_82_0].variantID:set(ATTACHMENT.baseVariant)
		end

		for iter_82_1 = 0, #arg_82_0.sticker - 1 do
			arg_82_0.sticker[iter_82_1]:set(WEAPON.StickerNoneValue)
		end
	end
end

function WEAPON.EquipModification(arg_83_0, arg_83_1)
	arg_83_0.camo:set(arg_83_1.camo or WEAPON.CamoNoneValue)
	arg_83_0.reticle:set(arg_83_1.reticle or WEAPON.ReticleNoneValue)
	arg_83_0.cosmeticAttachment:set(arg_83_1.cosmeticAttachment or WEAPON.CharmNoneValue)
	arg_83_0.weapon:set(arg_83_1.weapon)
	arg_83_0.lootItemID:set(arg_83_1.lootID)

	if arg_83_1.blueprintName then
		arg_83_0.blueprintName:set(arg_83_1.blueprintName)
	else
		arg_83_0.blueprintName:set("")
	end

	arg_83_0.variantID:set(arg_83_1.variantID)

	for iter_83_0 = 0, #arg_83_1.attachments - 1 do
		arg_83_0.attachmentSetup[iter_83_0].attachment:set(arg_83_1.attachments[iter_83_0 + 1].ref)
		arg_83_0.attachmentSetup[iter_83_0].variantID:set(arg_83_1.attachments[iter_83_0 + 1].variantID or ATTACHMENT.baseVariant)
	end

	for iter_83_1 = #arg_83_1.attachments, #arg_83_0.attachmentSetup - 1 do
		arg_83_0.attachmentSetup[iter_83_1].attachment:set(ATTACHMENT.none)
		arg_83_0.attachmentSetup[iter_83_1].variantID:set(ATTACHMENT.baseVariant)
	end

	for iter_83_2 = 0, #arg_83_0.sticker - 1 do
		arg_83_0.sticker[iter_83_2]:set(arg_83_1.stickers and arg_83_1.stickers[iter_83_2 + 1] or WEAPON.StickerNoneValue)
	end
end

function WEAPON.GenerateEmptyWeaponTable(arg_84_0)
	local var_84_0 = {
		weapon = arg_84_0.weapon:get(),
		variantID = arg_84_0.variantID:get(),
		attachments = {}
	}

	for iter_84_0 = 0, #arg_84_0.attachmentSetup - 1 do
		var_84_0.attachments[iter_84_0 + 1] = {}
		var_84_0.attachments[iter_84_0 + 1].ref = "none"
		var_84_0.attachments[iter_84_0 + 1].variantID = 0
	end

	var_84_0.stickers = WEAPON.GetEquippedStickers(arg_84_0)

	for iter_84_1, iter_84_2 in ipairs(var_84_0.stickers) do
		var_84_0.stickers[iter_84_1] = "none"
	end

	var_84_0.camo = "none"
	var_84_0.cosmeticAttachment = "none"
	var_84_0.reticle = "none"
	var_84_0.blueprintName = ""
	var_84_0.lootID = 0

	return var_84_0
end

function WEAPON.GenerateWeaponTable(arg_85_0)
	local var_85_0 = {
		weapon = arg_85_0.weapon:get(),
		variantID = arg_85_0.variantID:get(),
		attachments = {}
	}

	for iter_85_0 = 0, #arg_85_0.attachmentSetup - 1 do
		var_85_0.attachments[iter_85_0 + 1] = var_85_0.attachments[iter_85_0 + 1] or {}
		var_85_0.attachments[iter_85_0 + 1].ref = arg_85_0.attachmentSetup[iter_85_0].attachment:get()
		var_85_0.attachments[iter_85_0 + 1].variantID = arg_85_0.attachmentSetup[iter_85_0].variantID:get()
	end

	var_85_0.camo = arg_85_0.camo:get()
	var_85_0.cosmeticAttachment = arg_85_0.cosmeticAttachment:get()
	var_85_0.reticle = arg_85_0.reticle:get()
	var_85_0.stickers = WEAPON.GetEquippedStickers(arg_85_0)
	var_85_0.blueprintName = arg_85_0.blueprintName:get()
	var_85_0.lootID = arg_85_0.lootItemID:get()

	return var_85_0
end

function WEAPON.GenerateWeaponTableFromRef(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	local var_86_0 = {
		weapon = arg_86_0
	}

	var_86_0.variantID = 0
	var_86_0.attachments = {}
	var_86_0.camo = arg_86_1
	var_86_0.cosmeticAttachment = arg_86_2
	var_86_0.stickers = {}

	if arg_86_3 ~= nil then
		for iter_86_0 = 1, #arg_86_3 do
			var_86_0.stickers[iter_86_0] = arg_86_3[iter_86_0]
		end
	end

	var_86_0.blueprintName = ""
	var_86_0.lootID = LOOT.emptyID

	return var_86_0
end

function WEAPON.GenerateWeaponTableFromID(arg_87_0, arg_87_1)
	local var_87_0 = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, arg_87_1)

	if not var_87_0 or #var_87_0 <= 0 then
		return
	end

	local var_87_1 = WEAPON.GetVariantRef(arg_87_1)

	if not var_87_1 or #var_87_1 <= 0 then
		return
	end

	local var_87_2 = WEAPON.GetVariantFile(var_87_0)
	local var_87_3 = StringTable.BJJBBCJGEJ(var_87_2, CSV.weaponVariants.cols.ref, var_87_1)

	if var_87_3 < 0 then
		return
	end

	local var_87_4 = CSV.ReadRowWithFile(CSV.weaponVariants, var_87_2, var_87_3)

	if not var_87_4 then
		return
	end

	return WEAPON.GetLootModTable(arg_87_0, var_87_0, arg_87_1, var_87_4)
end

function WEAPON.SetSceneForWeaponSlot(arg_88_0)
	if Engine.DDJFBBJAIG() then
		if arg_88_0 == WEAPON.PrimarySlot then
			Engine.DHFCHIIJCA("loadout_showcase_p")
		else
			Engine.DHFCHIIJCA("loadout_showcase_s")
		end
	else
		Engine.DHFCHIIJCA("loadout_showcase")
	end
end

function WEAPON.SetPreviewSceneForWeapon(arg_89_0)
	local var_89_0 = WEAPON.GetWeaponClass(arg_89_0)
	local var_89_1 = StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, var_89_0, CSV.weaponClasses.cols.previewScene)

	if not var_89_1 or #var_89_1 == 0 then
		var_89_1 = "loadout_showcase_preview"
	end

	Engine.DHFCHIIJCA(var_89_1)
end

function WEAPON.LoadAndSetModelFromName(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
	FrontEndScene.RequestWeaponViewModels({
		arg_90_2
	}, arg_90_0)
	WEAPON.SetModelIfLoaded(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
end

function WEAPON.LoadAndSetModelFromPlayerData(arg_91_0, arg_91_1, arg_91_2, arg_91_3)
	local var_91_0 = WEAPON.GenerateWeaponTable(arg_91_2)

	WEAPON.LoadAndSetModel(arg_91_0, arg_91_1, var_91_0, arg_91_3)
end

function WEAPON.LoadAndSetModel(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	local var_92_0 = WEAPON.GetWeaponModelName(arg_92_2.weapon, arg_92_2, {
		includeCamos = true,
		includeAttachments = true,
		includeStickers = true,
		controllerIndex = arg_92_0
	})

	FrontEndScene.RequestWeaponViewModels({
		var_92_0
	}, arg_92_0)
	WEAPON.SetModelIfLoaded(arg_92_0, arg_92_1, var_92_0, arg_92_3)
end

function WEAPON.SetModelIfLoaded(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	arg_93_3 = arg_93_3 or {}
	arg_93_1._nextWeaponModel = arg_93_2

	if Streaming.DACIGAEDAE({
		arg_93_1._nextWeaponModel
	}, arg_93_0) then
		arg_93_1:SetWeaponModel(arg_93_1._nextWeaponModel)

		if arg_93_3.adjustSandbags then
			WEAPON.AdjustSandbags(arg_93_0, arg_93_1._nextWeaponModel)
		end

		arg_93_1._nextWeaponModel = nil

		if arg_93_3.callbackFunc then
			arg_93_3.callbackFunc()
		end
	else
		local var_93_0

		local function var_93_1()
			if arg_93_1._nextWeaponModel then
				if Streaming.DACIGAEDAE({
					arg_93_1._nextWeaponModel
				}, arg_93_0) then
					arg_93_1:SetWeaponModel(arg_93_1._nextWeaponModel)

					if arg_93_3.adjustSandbags then
						WEAPON.AdjustSandbags(arg_93_0, arg_93_1._nextWeaponModel)
					end

					arg_93_1._nextWeaponModel = nil

					if arg_93_3.callbackFunc then
						arg_93_3.callbackFunc()
					end
				else
					arg_93_1:Wait(100, true).onComplete = var_93_1
				end
			end
		end

		var_93_1()
	end

	if arg_93_3.forceOffsetsAndRotations then
		arg_93_1:SetOffsetsAndRotations(arg_93_2)
	end
end

function WEAPON.AdjustSandbags(arg_95_0, arg_95_1)
	local var_95_0 = LUI.Split(arg_95_1, "+")[1]
	local var_95_1 = WEAPON.GetWeaponSandbagPlacementIndex(var_95_0)

	Engine.EBHIFJCGBH("primary_weapon_changed", var_95_1)
end

function WEAPON.GetDefaultOffsetFileForClientWeapon(arg_96_0)
	if arg_96_0 == FrontEndScene.ClientWeapons.GunTablePrimary then
		return CSV.weaponOffsets.gunTableFirstFile
	elseif arg_96_0 == FrontEndScene.ClientWeapons.GunTableSecondary then
		return CSV.weaponOffsets.gunTableSecondFile
	elseif arg_96_0 == FrontEndScene.ClientWeapons.Preview then
		return CSV.weaponOffsets.previewFile
	elseif arg_96_0 == FrontEndScene.ClientWeapons.Watch then
		return CSV.weaponOffsets.watchFile
	end
end

function WEAPON.GetWeaponModel(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	if arg_97_2 == nil then
		arg_97_2 = WEAPON.GetDefaultOffsetFileForClientWeapon(arg_97_1)
	end

	local var_97_0 = {
		0 * _1080p,
		-50 * _1080p
	}
	local var_97_1 = LUI.UIWeaponModel.new({
		controllerIndex = arg_97_0,
		clientWeaponIndex = arg_97_1,
		basePosition = var_97_0,
		dataCSVFile = arg_97_2,
		baseOffsets = arg_97_3
	})

	var_97_1:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -302, _1080p * 779, _1080p * 290, _1080p * 740, 0)

	var_97_1.id = "weaponModel"

	if arg_97_1 == FrontEndScene.ClientWeapons.GunTableSecondary then
		local var_97_2 = -0.4

		var_97_1:SetCollisionPlaneHeightOffset(var_97_2)
		ClientWeapon.CCAGDACGCC(arg_97_1, true)
	else
		ClientWeapon.CCAGDACGCC(arg_97_1, false)
	end

	return var_97_1
end

function WEAPON.IsWeaponDismembermentEnabled(arg_98_0)
	local var_98_0 = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, arg_98_0)
	local var_98_1 = WEAPON.GetVariantFile(var_98_0)
	local var_98_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_98_0, CSV.weaponIDs.cols.variantRef)

	return StringTable.DIFCHIGDFB(var_98_1, CSV.weaponVariants.cols.ref, var_98_2, CSV.weaponVariants.cols.dismembermentEnabled) == "1"
end

function WEAPON.GetSpecialAttributeIcon(arg_99_0)
	if arg_99_0 == LOOT.emptyID then
		return ""
	end

	local var_99_0 = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, arg_99_0)
	local var_99_1 = WEAPON.GetVariantFile(var_99_0)
	local var_99_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_99_0, CSV.weaponIDs.cols.variantRef)

	return (StringTable.DIFCHIGDFB(var_99_1, CSV.weaponVariants.cols.ref, var_99_2, CSV.weaponVariants.cols.attributeIcon))
end

function WEAPON.GetSpecialAttributeName(arg_100_0)
	if arg_100_0 == LOOT.emptyID then
		return ""
	end

	local var_100_0 = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, arg_100_0)
	local var_100_1 = WEAPON.GetVariantFile(var_100_0)
	local var_100_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_100_0, CSV.weaponIDs.cols.variantRef)

	return (StringTable.DIFCHIGDFB(var_100_1, CSV.weaponVariants.cols.ref, var_100_2, CSV.weaponVariants.cols.attributeName))
end

function WEAPON.GetWeaponTracerColor(arg_101_0, arg_101_1)
	local var_101_0 = LOOT.GetTypeForID(arg_101_1)

	if var_101_0 ~= LOOT.itemTypes.WEAPON then
		return
	end

	local var_101_1 = LOOT.GetItemRef(var_101_0, arg_101_1)

	if #var_101_1 == 0 then
		return
	end

	local var_101_2 = WEAPON.GetVariantFile(var_101_1)
	local var_101_3 = WEAPON.GenerateWeaponTableFromID(arg_101_0, arg_101_1)
	local var_101_4 = StringTable.DIFCHIGDFB(var_101_2, CSV.weaponVariants.cols.variantID, var_101_3.variantID, CSV.weaponVariants.cols.tracerColor)

	if #var_101_4 > 0 then
		return SWATCHES.Tracer[var_101_4]
	end
end

function WEAPON.SetupCrosshair(arg_102_0, arg_102_1)
	local var_102_0 = LUI.DataSourceInControllerModel.new("cg.player.currentWeapon.crosshairAlpha"):GetModel(arg_102_1)

	arg_102_0:BindAlphaToModel(var_102_0)
end

function WEAPON.GetBaseRef(arg_103_0, arg_103_1)
	local var_103_0 = LUI.FindLast(arg_103_0, "_mp")

	if var_103_0 then
		local var_103_1 = arg_103_1 and var_103_0 + 2 or var_103_0 - 1

		arg_103_0 = string.sub(arg_103_0, 0, var_103_1)
	end

	return arg_103_0
end

function WEAPON.IsNonBulletWeapon(arg_104_0)
	return not WEAPON.IsBulletWeapon(arg_104_0)
end

function WEAPON.IsBulletWeapon(arg_105_0)
	return arg_105_0 and #arg_105_0 > 0 and arg_105_0 ~= "weapon_projectile" and arg_105_0 ~= "weapon_classic_s" and arg_105_0 ~= "weapon_melee2" and arg_105_0 ~= "weapon_melee" and arg_105_0 ~= "weapon_classic_p"
end

function WEAPON.IsCurrentBulletWeapon(arg_106_0, arg_106_1)
	local var_106_0 = Game.DEJBCHBCIH(arg_106_0, arg_106_1)
	local var_106_1 = WEAPON.GetBaseRef(var_106_0, false)
	local var_106_2 = WEAPON.GetWeaponClass(var_106_1)

	return WEAPON.IsBulletWeapon(var_106_2)
end

function WEAPON.GetDynamicWeaponAnimationSeq(arg_107_0)
	return StringTable.DIFCHIGDFB(CSV.DynamicWeaponTable.file, CSV.DynamicWeaponTable.cols.ref, arg_107_0, CSV.DynamicWeaponTable.cols.animateSeq)
end

function WEAPON.GetDynamicWeaponEnableValue(arg_108_0)
	local var_108_0 = tonumber(StringTable.DIFCHIGDFB(CSV.DynamicWeaponTable.file, CSV.DynamicWeaponTable.cols.ref, arg_108_0, CSV.DynamicWeaponTable.cols.enable))

	return var_108_0 and var_108_0 > 0
end

function WEAPON.StreamAllWeapons(arg_109_0)
	local var_109_0 = Streaming.DDFJHJEIBI()

	for iter_109_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_109_0) then
			local var_109_1 = {}
			local var_109_2 = {}
			local var_109_3 = LOADOUT.GetDefaultLoadouts(iter_109_0)
			local var_109_4 = PlayerData.BFFBGAJGD(iter_109_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

			for iter_109_1 = 0, 1 do
				for iter_109_2, iter_109_3 in ipairs(var_109_3) do
					local var_109_5 = iter_109_3.weapons[iter_109_1 + 1]
					local var_109_6 = WEAPON.GetWeaponModelNameFromRef(var_109_5.ref, {
						includeStickers = true,
						includeCamos = true,
						includeAttachments = true
					})

					table.insert(var_109_2, var_109_6)
				end

				for iter_109_4, iter_109_5 in ddlpairs(var_109_4) do
					local var_109_7 = iter_109_5.weaponSetups[iter_109_1]
					local var_109_8 = WEAPON.GenerateWeaponTable(var_109_7)
					local var_109_9 = WEAPON.GetWeaponModelName(var_109_8.weapon, var_109_8, {
						includeCamos = true,
						includeAttachments = true,
						includeStickers = true,
						controllerIndex = iter_109_0
					})

					table.insert(var_109_2, var_109_9)
				end
			end

			for iter_109_6 = 0, var_109_0 do
				table.insert(var_109_1, var_109_2[iter_109_6])
			end

			FrontEndScene.RequestWeaponViewModels(var_109_1, iter_109_0)
		end
	end
end

function WEAPON.LookUpTrialWeapon(arg_110_0, arg_110_1)
	return StringTable.DIFCHIGDFB(CSV.trialWeaponTable.file, CSV.trialWeaponTable.cols.trialID, arg_110_0, CSV.trialWeaponTable.cols.trialID + arg_110_1)
end

function WEAPON.LookUpTrialWeapons(arg_111_0)
	local var_111_0 = {}
	local var_111_1 = 1
	local var_111_2 = true

	while var_111_2 do
		local var_111_3 = WEAPON.LookUpTrialWeapon(arg_111_0, var_111_1)

		if var_111_3 ~= "" then
			table.insert(var_111_0, var_111_3)

			var_111_1 = var_111_1 + 1
		else
			var_111_2 = false
		end
	end

	return var_111_0
end

function WEAPON.StreamTrialWeapons(arg_112_0)
	local var_112_0 = WEAPON.LookUpTrialWeapons(arg_112_0)

	FrontEndScene.RequestWeaponWorldModels(var_112_0)

	return var_112_0
end

function WEAPON.GetSubClass(arg_113_0)
	local var_113_0 = WEAPON.GetWeaponClassName(arg_113_0)
	local var_113_1 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_113_0, CSV.MPWeapons.cols.subclassID)

	return (Engine.CBBHFCGDIC("WEAPON/SUBCLASS", var_113_0, var_113_1))
end

function WEAPON.GetClassRefByID(arg_114_0)
	local var_114_0 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_114_0, CSV.weaponIDs.cols.baseRef)

	return (StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, var_114_0, CSV.MPWeapons.cols.menuClass))
end

function WEAPON.GetNewWeaponIDsByClass(arg_115_0, arg_115_1, arg_115_2)
	local var_115_0 = {}
	local var_115_1 = Loot.BCBAGDEJAJ(arg_115_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])

	if var_115_1 and #var_115_1 > 0 then
		for iter_115_0, iter_115_1 in ipairs(var_115_1) do
			local var_115_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_115_1, CSV.weaponIDs.cols.quality)

			if WEAPON.GetClassRefByID(iter_115_1) == arg_115_1 then
				if arg_115_2 and arg_115_2.getBaseWeapon ~= nil then
					if arg_115_2.getBaseWeapon and tonumber(var_115_2) == LOOT.baseQuality or not arg_115_2.getBaseWeapon and tonumber(var_115_2) ~= LOOT.baseQuality then
						table.insert(var_115_0, iter_115_1)
					end
				else
					table.insert(var_115_0, iter_115_1)
				end
			end
		end
	end

	return var_115_0
end

function WEAPON.GetNewWeaponIDs(arg_116_0, arg_116_1)
	assert(arg_116_1.getBaseWeapon ~= nil)

	local var_116_0 = {}
	local var_116_1 = Loot.BCBAGDEJAJ(arg_116_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])

	if var_116_1 and #var_116_1 > 0 then
		for iter_116_0, iter_116_1 in ipairs(var_116_1) do
			local var_116_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_116_1, CSV.weaponIDs.cols.quality)

			if arg_116_1.getBaseWeapon and tonumber(var_116_2) == LOOT.baseQuality or not arg_116_1.getBaseWeapon and tonumber(var_116_2) ~= LOOT.baseQuality then
				table.insert(var_116_0, iter_116_1)
			end
		end
	end

	return var_116_0
end

function WEAPON.GetNewWeaponIDsBySlot(arg_117_0, arg_117_1)
	local var_117_0 = {}
	local var_117_1 = Loot.BCBAGDEJAJ(arg_117_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])

	if var_117_1 and #var_117_1 > 0 then
		for iter_117_0, iter_117_1 in ipairs(var_117_1) do
			local var_117_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_117_1, CSV.weaponIDs.cols.quality)
			local var_117_3 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_117_1, CSV.weaponIDs.cols.baseRef)
			local var_117_4 = WEAPON.GetSlotFromRef(var_117_3)

			if tonumber(var_117_2) == LOOT.baseQuality and var_117_4 == arg_117_1 then
				table.insert(var_117_0, iter_117_1)
			end
		end
	end

	return var_117_0
end

function WEAPON.GetNewArmoryIDsByWeapon(arg_118_0, arg_118_1)
	local var_118_0 = {}
	local var_118_1 = Loot.BCBAGDEJAJ(arg_118_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])

	if var_118_1 and #var_118_1 > 0 then
		for iter_118_0, iter_118_1 in ipairs(var_118_1) do
			local var_118_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_118_1, CSV.weaponIDs.cols.quality)
			local var_118_3 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_118_1, CSV.weaponIDs.cols.baseRef)

			if tonumber(var_118_2) ~= LOOT.baseQuality and arg_118_1 == var_118_3 then
				table.insert(var_118_0, iter_118_1)
			end
		end
	end

	return var_118_0
end

function WEAPON.GetLootVariantImage(arg_119_0, arg_119_1)
	local var_119_0 = WEAPON.GetVariantFile(arg_119_0)
	local var_119_1 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_119_1, CSV.weaponIDs.cols.variantRef)

	return (StringTable.DIFCHIGDFB(var_119_0, CSV.weaponVariants.cols.ref, var_119_1, CSV.weaponVariants.cols.image))
end

function WEAPON.GetGunTableSecondPositionScene(arg_120_0)
	if (WEAPON.GetWeaponClass(arg_120_0) == WEAPON.pistolClass or WEAPON.GetWeaponClass(arg_120_0) == WEAPON.MELEEClass2) and not WEAPON.ForceWideSecondaryCamera(arg_120_0) then
		return "loadout_showcase_s"
	else
		return "loadout_showcase_o"
	end
end

function WEAPON.GetVariantOverridenIcon(arg_121_0, arg_121_1)
	if arg_121_1 and arg_121_1 > 0 then
		local var_121_0 = WEAPON.GetVariantFile(arg_121_0)

		if var_121_0 and #var_121_0 > 0 then
			local var_121_1 = StringTable.DIFCHIGDFB(var_121_0, CSV.weaponVariants.cols.variantID, arg_121_1, CSV.weaponVariants.cols.overrideImage)

			if var_121_1 and #var_121_1 > 0 then
				return var_121_1
			end
		end
	end

	return nil
end

function WEAPON.GetCamoRef(arg_122_0)
	local var_122_0 = LOOT.GetLootItemRelatedWeapon(arg_122_0, LOOT.itemTypes.CAMO)
	local var_122_1 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_122_0, CSV.weaponIDs.cols.baseRef)
	local var_122_2 = LOOT.GetIDFileForType(LOOT.itemTypes.CAMO, {
		weaponRef = var_122_1
	})

	return StringTable.DIFCHIGDFB(var_122_2, CSV.camosIDs.cols.index, arg_122_0, CSV.camosIDs.cols.ref)
end

function WEAPON.SetResetDynBones(arg_123_0)
	for iter_123_0 = 1, 2 do
		ClientWeapon.CCGIDAEHBC(arg_123_0[iter_123_0])
	end
end

function WEAPON.ClearBreadcrumbs(arg_124_0)
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.WATCH])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.STREAK])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.SUPER])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.VEHICLE_CAMO])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.VEHICLE_HORN])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.VEHICLE_TRACK])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.RETICLE])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.CHARM])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.PERK])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.EQUIPMENT])
	Loot.GADJEFJEA(arg_124_0, LOOT.typeNames[LOOT.itemTypes.STICKER])

	local var_124_0 = StringTable.BFHCAIIDA(CSV.lootMaster.file)

	for iter_124_0 = 0, var_124_0 - 1 do
		local var_124_1 = CSV.ReadRow(CSV.lootMaster, iter_124_0)

		if tonumber(var_124_1.typeValue) == LOOT.itemTypes.CAMO or tonumber(var_124_1.typeValue) == LOOT.itemTypes.ATTACHMENT then
			local var_124_2 = var_124_1.typeName

			Loot.GADJEFJEA(arg_124_0, var_124_2)
		end
	end
end

function WEAPON.AddWeaponsInBundleToTable(arg_125_0, arg_125_1, arg_125_2, arg_125_3)
	arg_125_3 = arg_125_3 or {}
	arg_125_3.dupeCheckTable = arg_125_3.dupeCheckTable or {}

	local var_125_0 = {
		file = CSV.bundleIDs.file,
		cols = CSV.bundleIDs.cols
	}
	local var_125_1 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_125_1)
	local var_125_2 = CSV.ReadRow(var_125_0, var_125_1)

	for iter_125_0 = 1, CSV.bundleIDs.maxItems do
		local var_125_3 = tonumber(var_125_2["item" .. iter_125_0])

		if not var_125_3 then
			break
		end

		if LOOT.IsWeapon(var_125_3) and (not arg_125_3.excludeOwned or not LOOT.IsUnlockedWithID(arg_125_0, var_125_3)) then
			if arg_125_3.useBaseRefKeys and not arg_125_3.dupeCheckTable[var_125_3] then
				local var_125_4 = WEAPON.GetVariantBaseRef(var_125_3)

				arg_125_2[var_125_4] = arg_125_2[var_125_4] or {}

				table.insert(arg_125_2[var_125_4], {
					lootID = var_125_3,
					bundleID = arg_125_1
				})

				arg_125_3.dupeCheckTable[var_125_3] = true
			else
				arg_125_2[var_125_3] = {
					lootID = var_125_3,
					bundleID = arg_125_1
				}
			end
		end
	end
end

function WEAPON.GetPriorityVariants(arg_126_0, arg_126_1)
	arg_126_1 = arg_126_1 or {}

	local var_126_0 = arg_126_1.variantsTable or {}
	local var_126_1 = Engine.CFHBIHABCB(arg_126_0) and Dvar.DHEEJCCJBH("LRTKSQRKLR") or Dvar.DHEEJCCJBH("NQPKQKPTOQ") or ""
	local var_126_2 = split(var_126_1, ",")

	if var_126_2 then
		for iter_126_0, iter_126_1 in ipairs(var_126_2) do
			if STORE.BundleAvailable(arg_126_0, iter_126_1) then
				WEAPON.AddWeaponsInBundleToTable(arg_126_0, iter_126_1, var_126_0, arg_126_1)
			end
		end
	end

	return var_126_0
end

function WEAPON.GetAllVariantsInStore(arg_127_0, arg_127_1)
	assert(arg_127_0)

	arg_127_1 = arg_127_1 or {}
	arg_127_1.dupeCheckTable = {}

	if arg_127_1.useBaseRefKeys and arg_127_1.itemsTable then
		for iter_127_0, iter_127_1 in pairs(arg_127_1.itemsTable) do
			for iter_127_2, iter_127_3 in pairs(iter_127_1) do
				dupeCheckTable[iter_127_3.lootID] = true
			end
		end
	end

	arg_127_1.AddItemsFunction = WEAPON.AddWeaponsInBundleToTable

	return (STORE.GetAllItemsInStore(arg_127_0, arg_127_1))
end

function WEAPON.IsGoldCamoUnlocked(arg_128_0, arg_128_1)
	local var_128_0 = LOOT.GetBaseWeaponItemID(arg_128_1)

	if not var_128_0 then
		assert(false, "Missing weapon ID for " .. (arg_128_1 or "nil"))

		return false
	end

	local var_128_1 = var_128_0 * 1000 + WEAPON.goldCamoIDOffset

	return Loot.DEBEIFJEEG(arg_128_0, var_128_1) > 0
end

function WEAPON.GetMasterChallenges(arg_129_0, arg_129_1)
	local var_129_0 = {
		numComplete = 0,
		numChallenges = 0
	}
	local var_129_1 = -1
	local var_129_2 = {}
	local var_129_3 = WEAPON.GetMasterChallengeRefs(arg_129_1)
	local var_129_4 = #var_129_3

	for iter_129_0 = 1, var_129_4 do
		var_129_2[iter_129_0] = {}

		local var_129_5 = 0
		local var_129_6 = false

		if type(var_129_3[iter_129_0]) == "string" then
			var_129_5 = #LUI.Split(StringTable.DIFCHIGDFB(CSV.weaponMasterChallenges.file, CSV.weaponMasterChallenges.cols.ref, var_129_3[iter_129_0], CSV.weaponMasterChallenges.cols.amount), "|")
			var_129_6 = true
		elseif type(var_129_3[iter_129_0]) == "table" then
			var_129_5 = #var_129_3[iter_129_0]
		else
			assert(false, "unexpected mastery ref type")
		end

		for iter_129_1 = 1, var_129_5 do
			local var_129_7
			local var_129_8
			local var_129_9
			local var_129_10
			local var_129_11
			local var_129_12 = var_129_6 and var_129_3[iter_129_0] or var_129_3[iter_129_0][iter_129_1]
			local var_129_13 = StringTable.BJJBBCJGEJ(CSV.weaponMasterChallenges.file, CSV.weaponMasterChallenges.cols.ref, var_129_12)

			if var_129_13 >= 0 then
				local var_129_14 = CSV.ReadRowWithFile(CSV.weaponMasterChallenges, CSV.weaponMasterChallenges.file, var_129_13)

				if var_129_6 then
					var_129_7 = LUI.Split(var_129_14.name, "|")[iter_129_1]
					var_129_8 = LUI.Split(var_129_14.amount, "|")[iter_129_1]
					var_129_9 = LUI.Split(var_129_14.XPReward, "|")[iter_129_1]
					var_129_10 = LUI.Split(var_129_14.loot, "|")[iter_129_1]
					var_129_11 = LUI.Split(var_129_14.icon, "|")[iter_129_1]
				else
					var_129_7 = var_129_14.name
					var_129_8 = var_129_14.amount
					var_129_9 = var_129_14.XPReward
					var_129_10 = var_129_14.loot
					var_129_11 = var_129_14.icon
				end

				var_129_2[iter_129_0][iter_129_1] = {
					categoryName = Engine.CBBHFCGDIC(var_129_14.categoryName),
					name = Engine.CBBHFCGDIC(var_129_7),
					desc = Engine.CBBHFCGDIC(var_129_14.desc, var_129_8),
					amountEarned = Gunsmith.BICGDCCGCI(arg_129_0, var_129_14.id).progress,
					amountNeeded = tonumber(var_129_8),
					rewardXP = tonumber(var_129_9),
					rewardLoot = tonumber(var_129_10),
					icon = var_129_11,
					isUnlocked = iter_129_1 == 1
				}

				if var_129_6 and iter_129_1 > 1 then
					local var_129_15 = var_129_2[iter_129_0][iter_129_1].amountEarned
					local var_129_16 = var_129_2[iter_129_0][iter_129_1].amountNeeded
					local var_129_17 = var_129_2[iter_129_0][iter_129_1 - 1].amountNeeded

					if var_129_17 < var_129_15 then
						var_129_15 = var_129_15 - var_129_17
					else
						var_129_15 = 0
					end

					if var_129_17 < var_129_16 then
						var_129_16 = var_129_16 - var_129_17
					end

					var_129_2[iter_129_0][iter_129_1].amountEarned = var_129_15
					var_129_2[iter_129_0][iter_129_1].amountNeeded = var_129_16
					var_129_2[iter_129_0][iter_129_1].desc = Engine.CBBHFCGDIC(var_129_14.desc, var_129_16)
				end

				var_129_2[iter_129_0][iter_129_1].amountEarned = LUI.clamp(var_129_2[iter_129_0][iter_129_1].amountEarned, 0, var_129_2[iter_129_0][iter_129_1].amountNeeded)
				var_129_2[iter_129_0][iter_129_1].isComplete = var_129_2[iter_129_0][iter_129_1].amountEarned == var_129_2[iter_129_0][iter_129_1].amountNeeded

				if iter_129_1 > 1 then
					var_129_2[iter_129_0][iter_129_1].prevChallengeName = var_129_2[iter_129_0][iter_129_1 - 1].name
					var_129_2[iter_129_0][iter_129_1].isUnlocked = var_129_2[iter_129_0][iter_129_1 - 1].isComplete
				end

				var_129_0.numChallenges = var_129_0.numChallenges + 1

				if var_129_2[iter_129_0][iter_129_1].isComplete then
					var_129_0.numComplete = var_129_0.numComplete + 1
				end

				if var_129_2[iter_129_0][iter_129_1].amountNeeded > 0 then
					local var_129_18 = var_129_2[iter_129_0][iter_129_1].amountEarned / var_129_2[iter_129_0][iter_129_1].amountNeeded

					if var_129_18 < 1 and var_129_1 < var_129_18 then
						var_129_1 = var_129_18
						var_129_0.nearestComplete = var_129_2[iter_129_0][iter_129_1]
					end
				end
			end
		end
	end

	return var_129_2, var_129_0
end

function WEAPON.GetMasterChallengeRefs(arg_130_0)
	local var_130_0 = string.gsub(arg_130_0, "^iw8_", "")

	if var_130_0 == "knife" then
		var_130_0 = WEAPON.MasterKnifeRef
	end

	local var_130_1 = "ch_mastery_"

	return {
		var_130_1 .. var_130_0 .. "_card_kill",
		var_130_1 .. var_130_0 .. "_card_hs",
		{
			var_130_1 .. var_130_0 .. "_emblem_gold",
			var_130_1 .. var_130_0 .. "_emblem_platinum",
			var_130_1 .. var_130_0 .. "_emblem_damascus",
			var_130_1 .. var_130_0 .. "_emblem_obsidian"
		}
	}
end

function WEAPON.GetWeaponBlueprintString(arg_131_0, arg_131_1, arg_131_2)
	local var_131_0 = ""
	local var_131_1 = arg_131_1.weapon
	local var_131_2 = string.sub(arg_131_1.weapon, 5)
	local var_131_3 = split(arg_131_2, "+")
	local var_131_4 = {}

	for iter_131_0 = 1, #var_131_3 do
		local var_131_5 = split(var_131_3[iter_131_0], "|")

		if var_131_5 then
			local var_131_6 = var_131_5[1]

			if var_131_6 then
				local var_131_7 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.baseRef, var_131_6, CSV.attachments.cols.category)

				table.insert(var_131_4, var_131_7)
			end
		end
	end

	local var_131_8 = CSV.weaponVariants:GetFile(var_131_2)

	for iter_131_1 = 1, #var_131_4 do
		if var_131_4[iter_131_1] ~= "" then
			local var_131_9 = WEAPON.WeaponVariantMap[var_131_4[iter_131_1]]

			if var_131_9 then
				local var_131_10 = StringTable.DIFCHIGDFB(var_131_8, var_131_9, var_131_3[iter_131_1], CSV.weaponVariants.cols.name)

				var_131_10 = var_131_10 == "" and "MENU/DEFAULT" or var_131_10
				var_131_0 = var_131_0 .. "|" .. Engine.CBBHFCGDIC(var_131_10)
			end
		end
	end

	if #var_131_0 > 0 then
		var_131_0 = string.sub(var_131_0, 2)
	end

	return var_131_0
end

function WEAPON.GetMasterChallengeCompletionCount(arg_132_0)
	local var_132_0 = CSV.weaponMasterChallenges
	local var_132_1 = StringTable.BFHCAIIDA(var_132_0.file)
	local var_132_2 = 0

	for iter_132_0 = 0, var_132_1 - 1 do
		local var_132_3 = CSV.ReadRow(var_132_0, iter_132_0)
		local var_132_4 = Gunsmith.BICGDCCGCI(arg_132_0, var_132_3.id).progress
		local var_132_5 = split(var_132_3.amount, "|")

		if var_132_5 and #var_132_5 > 0 and var_132_4 >= tonumber(var_132_5[#var_132_5]) then
			var_132_2 = var_132_2 + 1
		end
	end

	return var_132_2
end
