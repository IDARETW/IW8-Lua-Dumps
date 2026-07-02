ATTACHMENT = ATTACHMENT or {}
ATTACHMENT.opticCategory = "optic"
ATTACHMENT.perkCategory = "gunperk"
ATTACHMENT.charmCategory = "charm"
ATTACHMENT.stickerCategory = "sticker"
ATTACHMENT.none = "none"
ATTACHMENT.count = 5
ATTACHMENT.baseVariant = 0
ATTACHMENT.perkFlag = "gunperk_"
ATTACHMENT.akimbo = "akimbo"
ATTACHMENT.FireType = {
	BURST = 2,
	FULLAUTO = 0,
	DOUBLEBARREL = 3,
	DOUBLEBARREL_DUALTRIGGER = 4,
	SINGLESHOT = 1,
	BEAM = 5
}
ATTACHMENT.FireTypeIcon = {
	[ATTACHMENT.FireType.FULLAUTO] = "ui_firetype_fullauto",
	[ATTACHMENT.FireType.SINGLESHOT] = "ui_firetype_semiauto",
	[ATTACHMENT.FireType.BURST] = "ui_firetype_burst",
	[ATTACHMENT.FireType.DOUBLEBARREL] = "ui_firetype_semiauto",
	[ATTACHMENT.FireType.DOUBLEBARREL_DUALTRIGGER] = "ui_firetype_semiauto",
	[ATTACHMENT.FireType.BEAM] = "ui_firetype_spread"
}
ATTACHMENT.AltModeFireTypeStringRef = {
	[ATTACHMENT.FireType.FULLAUTO] = "WEAPON/FIRE_TYPE_AUTO_ATTACHMENT",
	[ATTACHMENT.FireType.SINGLESHOT] = "WEAPON/FIRE_TYPE_SINGLE_ATTACHMENT",
	[ATTACHMENT.FireType.BURST] = "WEAPON/FIRE_TYPE_BURST_ATTACHMENT"
}
ATTACHMENT.HyperburstIcon = "ui_firetype_hyperburst"

function ATTACHMENT.GetMaxAttachmentCount(arg_1_0)
	local var_1_0 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_1_0, CSV.MPWeapons.cols.maxAllowedAttachment)

	return var_1_0 == "" and ATTACHMENT.count or tonumber(var_1_0)
end

function ATTACHMENT.GetImage(arg_2_0)
	local var_2_0 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_2_0, CSV.attachments.cols.image)

	var_2_0 = var_2_0 == "" and "white" or var_2_0

	return var_2_0
end

function ATTACHMENT.GetIndex(arg_3_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_3_0, CSV.attachments.cols.index)
end

function ATTACHMENT.GetRefAndVariantID(arg_4_0)
	local var_4_0 = LUI.Split(arg_4_0, "|")

	return var_4_0[1], var_4_0[2]
end

function ATTACHMENT.GetStatsForAttachments(arg_5_0, arg_5_1)
	local var_5_0 = {
		statFireRate = 0,
		statRange = 0,
		statAccuracy = 0,
		statControl = 0,
		statMobility = 0,
		statDamage = 0
	}
	local var_5_1 = 0
	local var_5_2 = WEAPON.GetWeaponClass(arg_5_0)

	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		local var_5_3 = ATTACHMENT.GetRef(iter_5_1.ref, arg_5_0, var_5_2)
		local var_5_4 = StringTable.BJJBBCJGEJ(CSV.attachments.file, CSV.attachments.cols.ref, var_5_3)

		if var_5_4 >= 0 then
			local var_5_5 = CSV.ReadRow(CSV.attachments, var_5_4)

			var_5_0.statAccuracy = var_5_0.statAccuracy + (tonumber(var_5_5.acc) or var_5_1)
			var_5_0.statDamage = var_5_0.statDamage + (tonumber(var_5_5.dam) or var_5_1)
			var_5_0.statRange = var_5_0.statRange + (tonumber(var_5_5.rng) or var_5_1)
			var_5_0.statFireRate = var_5_0.statFireRate + (tonumber(var_5_5.rof) or var_5_1)
			var_5_0.statMobility = var_5_0.statMobility + (tonumber(var_5_5.mob) or var_5_1)
			var_5_0.statControl = var_5_0.statControl + (tonumber(var_5_5.ctl) or var_5_1)
		end
	end

	return var_5_0
end

function ATTACHMENT.GetModifierNameAndValue(arg_6_0)
	local var_6_0 = LUI.Split(arg_6_0, "|")

	assert(var_6_0[1], "Required MOD Name is Missing from attachmenttable.csv")
	assert(var_6_0[2], "Required MOD Value is Missing from attachmenttable.csv")

	local var_6_1 = var_6_0[1]
	local var_6_2 = var_6_0[2]

	return var_6_1, var_6_2
end

function ATTACHMENT.GetModifierInfo(arg_7_0)
	local var_7_0 = {}
	local var_7_1 = CSV.attachments.cols.modifierEnd - CSV.attachments.cols.modifierStart + 1

	for iter_7_0 = 0, var_7_1 - 1 do
		local var_7_2 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_7_0, CSV.attachments.cols.modifierStart + iter_7_0)

		if var_7_2 and var_7_2 ~= "" then
			local var_7_3, var_7_4 = ATTACHMENT.GetModifierNameAndValue(var_7_2)

			table.insert(var_7_0, {
				name = var_7_3,
				value = tonumber(var_7_4)
			})
		end
	end

	return var_7_0
end

function ATTACHMENT.GetAttachmentModifierString(arg_8_0, arg_8_1)
	local var_8_0 = ""
	local var_8_1 = ""

	if arg_8_0 and arg_8_1 then
		local var_8_2 = arg_8_1 > 0 and "[{attribute_pro}]" or "[{attribute_con}]"

		for iter_8_0 = 0, math.abs(arg_8_1) - 1 do
			var_8_0 = var_8_0 .. var_8_2
		end

		var_8_1 = Engine.CBBHFCGDIC(arg_8_0)
	end

	return var_8_0, var_8_1
end

function ATTACHMENT.GetTableFromWeaponSetup(arg_9_0)
	local var_9_0 = {}

	for iter_9_0 = 0, #arg_9_0.attachmentSetup - 1 do
		table.insert(var_9_0, arg_9_0.attachmentSetup[iter_9_0].attachment:get())
	end

	return var_9_0
end

function ATTACHMENT.GetBaseRef(arg_10_0)
	if arg_10_0 == "none" then
		return "none"
	else
		return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_10_0, CSV.attachments.cols.baseRef)
	end
end

function ATTACHMENT.GetRefInternal(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_1 == nil or arg_11_1 == "none" or arg_11_0 == "none" then
		return arg_11_0
	end

	local var_11_0 = arg_11_0
	local var_11_1 = StringTable.BHHDFEHAHB(arg_11_2.file, arg_11_2.rows.attachRef, arg_11_0)

	if var_11_1 >= 0 then
		local var_11_2 = StringTable.DIFCHIGDFB(arg_11_2.file, arg_11_2.cols.weapOrClass, arg_11_1, var_11_1)

		if var_11_2 == "" then
			var_11_2 = StringTable.DIFCHIGDFB(arg_11_2.file, arg_11_2.cols.weapOrClass, arg_11_3 or WEAPON.GetWeaponClass(arg_11_1), var_11_1)
		end

		if var_11_2 ~= "" then
			var_11_0 = var_11_2
		end
	end

	return var_11_0
end

function ATTACHMENT.GetRef(arg_12_0, arg_12_1, arg_12_2)
	return ATTACHMENT.GetRefInternal(arg_12_0, arg_12_1, CSV.attachmentMap, arg_12_2)
end

function ATTACHMENT.GetAttachmentAddition(arg_13_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_13_0, CSV.attachments.cols.slot)
end

function ATTACHMENT.GetName(arg_14_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_14_0, CSV.attachments.cols.name))
end

function ATTACHMENT.GetNameUnlocalized(arg_15_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_15_0, CSV.attachments.cols.name)
end

function ATTACHMENT.GetDesc(arg_16_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_16_0, CSV.attachments.cols.desc))
end

function ATTACHMENT.GetEquippedOptic(arg_17_0)
	local var_17_0 = arg_17_0.weapon:get()
	local var_17_1 = WEAPON.GetWeaponClass(var_17_0)

	for iter_17_0, iter_17_1 in ddlpairs(arg_17_0.attachmentSetup) do
		local var_17_2 = ATTACHMENT.GetRef(iter_17_1.attachment:get(), var_17_0, var_17_1)

		if ATTACHMENT.GetCategory(var_17_2) == ATTACHMENT.opticCategory then
			return var_17_2
		end
	end

	local var_17_3 = {}
	local var_17_4 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_17_0.weapon:get(), CSV.MPWeapons.cols.defaultAttachments)

	if var_17_4 and #var_17_4 > 0 then
		var_17_3 = LUI.Split(var_17_4, " ")
	end

	for iter_17_2, iter_17_3 in ipairs(var_17_3) do
		if ATTACHMENT.GetCategory(iter_17_3) == ATTACHMENT.opticCategory then
			return ATTACHMENT.GetRef(iter_17_3, var_17_0, var_17_1)
		end
	end

	return ""
end

function ATTACHMENT.GetOpticRef(arg_18_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_18_0, CSV.attachments.cols.reticles)
end

function ATTACHMENT.GetOpticReticleCategory(arg_19_0)
	if arg_19_0 == nil or #arg_19_0 == 0 then
		return ""
	end

	return StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.attachRef, arg_19_0, CSV.reticleCategoryTable.cols.categoryRef)
end

function ATTACHMENT.SupportsCustomReticles(arg_20_0, arg_20_1)
	if arg_20_0 == nil or #arg_20_0 == 0 then
		return false
	end

	local var_20_0 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_20_0, CSV.attachments.cols.reticles)

	if arg_20_1 then
		return #var_20_0 > 0
	else
		local var_20_1 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_20_0, CSV.attachments.cols.doesNotUseCustomReticles)

		return #var_20_0 > 0 and #var_20_1 == 0
	end
end

function ATTACHMENT.IsDefaultScope(arg_21_0)
	if arg_21_0 == nil or #arg_21_0 == 0 then
		return false
	end

	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_21_0, CSV.attachments.cols.reticles) == "intscope"
end

function ATTACHMENT.ReticleTypeSupportsAltImage(arg_22_0)
	return arg_22_0 == "hybrid" or arg_22_0 == "hybridthermal"
end

function ATTACHMENT.IsSelectableAttachment(arg_23_0, arg_23_1)
	local var_23_0 = ATTACHMENT.GetBaseRef(arg_23_0.ref)

	if var_23_0 == "" then
		return false
	end

	local var_23_1 = CSV.attachmentIDs.GetFile(arg_23_1)
	local var_23_2 = CSV.gunsmithProgressionTable:GetFile(arg_23_1)
	local var_23_3 = StringTable.DIFCHIGDFB(var_23_1, CSV.attachmentIDs.cols.ref, var_23_0, CSV.attachmentIDs.cols.index)
	local var_23_4 = StringTable.DIFCHIGDFB(var_23_2, CSV.gunsmithProgressionTable.cols.lootID, var_23_3, CSV.gunsmithProgressionTable.cols.level)

	if var_23_4 == "" then
		var_23_4 = StringTable.DIFCHIGDFB(var_23_2, CSV.gunsmithProgressionTable.cols.unlockID, var_23_3, CSV.gunsmithProgressionTable.cols.level)
	end

	return var_23_4 ~= ""
end

function ATTACHMENT.ClearAllAttachments(arg_24_0)
	for iter_24_0, iter_24_1 in ddlpairs(arg_24_0.attachmentSetup) do
		iter_24_1.attachment:set(ATTACHMENT.none)
		iter_24_1.variantID:set(ATTACHMENT.baseVariant)
	end

	WEAPON.SetEquippedReticle(arg_24_0, WEAPON.ReticleNoneValue)
end

function ATTACHMENT.GetStatAccuracy(arg_25_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_25_0, CSV.attachments.cols.acc))
end

function ATTACHMENT.GetStatDamage(arg_26_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_26_0, CSV.attachments.cols.dam))
end

function ATTACHMENT.GetStatRange(arg_27_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_27_0, CSV.attachments.cols.rng))
end

function ATTACHMENT.GetStatFireRate(arg_28_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_28_0, CSV.attachments.cols.rof))
end

function ATTACHMENT.GetStatMobility(arg_29_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_29_0, CSV.attachments.cols.mob))
end

function ATTACHMENT.GetStatControl(arg_30_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_30_0, CSV.attachments.cols.ctl))
end

function ATTACHMENT.GetCategory(arg_31_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_31_0, CSV.attachments.cols.category)
end

function ATTACHMENT.IsUnlocked(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = WEAPON.GetWeaponClass(arg_32_1)
	local var_32_1 = WEAPON.GetWeaponClassAttachUnlockTablePrefix(var_32_0)

	return Unlocks.BFCEGDJIEI(arg_32_2, var_32_1 .. "Attach", arg_32_1 .. "+" .. arg_32_0)
end

function ATTACHMENT.GetUnlockText(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = WEAPON.GetWeaponClass(arg_33_1)
	local var_33_1 = ATTACHMENT.GetUnlockTable(arg_33_1)
	local var_33_2 = arg_33_1 .. "+" .. arg_33_0

	if arg_33_3 then
		return Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/NOT_AVAILABLE_IN_CWL")
	end

	local var_33_3 = StringTable.DIFCHIGDFB(var_33_1, CSV.attachmentUnlockTable.cols.weaponAttachRef, var_33_2, CSV.attachmentUnlockTable.cols.ui_text)
	local var_33_4 = StringTable.DIFCHIGDFB(var_33_1, CSV.attachmentUnlockTable.cols.weaponAttachRef, var_33_2, CSV.attachmentUnlockTable.cols.ui_text_var1)
	local var_33_5 = StringTable.DIFCHIGDFB(var_33_1, CSV.attachmentUnlockTable.cols.weaponAttachRef, var_33_2, CSV.attachmentUnlockTable.cols.ui_text_var2)

	return Engine.CBBHFCGDIC(var_33_3, var_33_4, var_33_5)
end

function ATTACHMENT.GetUnlockTable(arg_34_0)
	local var_34_0 = WEAPON.GetWeaponClass(arg_34_0)
	local var_34_1 = WEAPON.GetWeaponClassAttachUnlockTablePrefix(var_34_0)

	return CSV.attachmentUnlockTable.fileRoot .. var_34_1 .. CSV.attachmentUnlockTable.fileSuffix
end

function ATTACHMENT.IsNew(arg_35_0, arg_35_1, arg_35_2)
	return false
end

function ATTACHMENT.ClearNew(arg_36_0, arg_36_1, arg_36_2)
	return
end

function ATTACHMENT.GetConflictingAttachment(arg_37_0, arg_37_1)
	local var_37_0 = ATTACHMENT.GetCategory(arg_37_1)

	for iter_37_0, iter_37_1 in pairs(arg_37_0.attachments) do
		local var_37_1 = iter_37_1.ref

		if ATTACHMENT.GetCategory(var_37_1) == var_37_0 then
			return var_37_1
		end
	end

	return false
end

function ATTACHMENT.GetValidWeaponAttachments(arg_38_0)
	local var_38_0 = {}
	local var_38_1 = WEAPON.GetWeaponClass(arg_38_0.weapon)

	for iter_38_0, iter_38_1 in ipairs(arg_38_0.attachments) do
		local var_38_2 = ATTACHMENT.GetRef(iter_38_1.ref, arg_38_0.weapon, var_38_1)
		local var_38_3 = ATTACHMENT.GetCategory(var_38_2)

		if var_38_2 ~= ATTACHMENT.none then
			var_38_0[var_38_3] = var_38_0[var_38_3] or {}

			table.insert(var_38_0[var_38_3], var_38_2)
		end
	end

	return var_38_0
end

function ATTACHMENT.GetAttachmentCategoryName(arg_39_0)
	return StringTable.DIFCHIGDFB(CSV.attachmentCategories.file, CSV.attachmentCategories.cols.ref, arg_39_0, CSV.attachmentCategories.cols.name)
end

function ATTACHMENT.GetAttachmentCategoryButton(arg_40_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachmentCategories.file, CSV.attachmentCategories.cols.ref, arg_40_0, CSV.attachmentCategories.cols.buttonIndex))
end

function ATTACHMENT.GetBlockedCategory(arg_41_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_41_0, CSV.attachments.cols.blockedCategory)
end

function ATTACHMENT.GetBlockedCategorySlot(arg_42_0, arg_42_1)
	local var_42_0 = WEAPON.GetWeaponClass(arg_42_1.weapon)
	local var_42_1 = ATTACHMENT.GetRef(arg_42_0, arg_42_1.weapon, var_42_0)
	local var_42_2 = ATTACHMENT.GetBlockedCategory(var_42_1)

	if not var_42_2 or #var_42_2 == 0 then
		return
	end

	for iter_42_0, iter_42_1 in ipairs(arg_42_1.attachments) do
		local var_42_3 = ATTACHMENT.GetRef(iter_42_1.ref, arg_42_1.weapon, var_42_0)

		if ATTACHMENT.GetCategory(var_42_3) == var_42_2 then
			return iter_42_0
		end
	end
end

function ATTACHMENT.GetRefByID(arg_43_0, arg_43_1)
	local var_43_0 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_43_0, CSV.weaponIDs.cols.baseRef)
	local var_43_1 = CSV.attachmentIDs.GetFile(var_43_0)
	local var_43_2 = StringTable.DIFCHIGDFB(var_43_1, CSV.attachmentIDs.cols.index, arg_43_1, CSV.attachmentIDs.cols.ref)

	return ATTACHMENT.GetRef(var_43_2, var_43_0)
end

function ATTACHMENT.GetRefByAttachmentID(arg_44_0)
	local var_44_0 = LOOT.GetBaseWeaponIDFromAttachmentLootID(arg_44_0)

	if var_44_0 then
		return ATTACHMENT.GetRefByID(var_44_0, arg_44_0)
	end

	return nil
end

function ATTACHMENT.GetConfigString(arg_45_0)
	local var_45_0 = ""

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.attachments) do
		if iter_45_1.ref ~= ATTACHMENT.none then
			if #var_45_0 > 0 then
				var_45_0 = var_45_0 .. "+"
			end

			var_45_0 = var_45_0 .. iter_45_1.ref .. "|" .. iter_45_1.variantID
		end
	end

	return var_45_0
end

function ATTACHMENT.GetCategoryByLootID(arg_46_0, arg_46_1)
	local var_46_0 = CSV.attachmentIDs.GetFile(arg_46_1)
	local var_46_1 = StringTable.DIFCHIGDFB(var_46_0, CSV.attachmentIDs.cols.index, arg_46_0, CSV.attachmentIDs.cols.ref)
	local var_46_2 = ATTACHMENT.GetRef(var_46_1, arg_46_1)

	return (StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, var_46_2, CSV.attachments.cols.category))
end

function ATTACHMENT.GetNewAttachmentIDsByCategory(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = {}
	local var_47_1 = arg_47_2 .. GUNSMITH.typeNamePostFix.attachment
	local var_47_2 = Loot.BCBAGDEJAJ(arg_47_0, var_47_1)

	if var_47_2 and #var_47_2 > 0 then
		for iter_47_0, iter_47_1 in ipairs(var_47_2) do
			if ATTACHMENT.GetCategoryByLootID(iter_47_1, arg_47_2) == arg_47_1 then
				table.insert(var_47_0, iter_47_1)
			end
		end
	end

	return var_47_0
end

function ATTACHMENT.IsDisplayNameAvailable(arg_48_0)
	if arg_48_0 == nil or #arg_48_0 == 0 or arg_48_0 == "none" then
		return false
	end

	local var_48_0 = StringTable.DIFCHIGDFB(CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, arg_48_0, CSV.MPAttachments.cols.category)

	return false
end

function ATTACHMENT.AreVariantsEnabled()
	return Dvar.IBEGCHEFE("NNMMRMNMNQ")
end

function ATTACHMENT.GetOverrideDesc(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = WEAPON.GetVariantFile(arg_50_1)
	local var_50_1 = StringTable.DIFCHIGDFB(var_50_0, CSV.weaponVariants.cols.variantID, arg_50_2, CSV.weaponVariants.cols.assetOverride)

	if var_50_1 and #var_50_1 > 0 then
		local var_50_2 = ATTACHMENT.GetRef(arg_50_0, var_50_1)
		local var_50_3 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, var_50_2, CSV.attachments.cols.desc)

		if var_50_3 and #var_50_3 > 0 then
			return var_50_3
		end
	end
end

function ATTACHMENT.IsDismembermentEnabled(arg_51_0)
	return StringTable.DIFCHIGDFB(CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, arg_51_0, CSV.MPAttachments.cols.dismembermentEnabled) ~= ""
end

function ATTACHMENT.SortTableOnEquipped(arg_52_0)
	table.sort(arg_52_0, function(arg_53_0, arg_53_1)
		return arg_53_0.ref ~= ATTACHMENT.none and arg_53_1.ref == ATTACHMENT.none
	end)
end

function ATTACHMENT.GetAttachmentData(arg_54_0, arg_54_1)
	if not arg_54_1 or type(arg_54_1) ~= "table" or not arg_54_1.weaponTable then
		assert(false, "You must specify a table of options with a property/value set for the weaponTable to lookup.")
	end

	local var_54_0 = {}
	local var_54_1 = arg_54_1.weaponTable
	local var_54_2 = GUNSMITH.GetAttachmentCategories(var_54_1.weapon)

	for iter_54_0 = 1, #var_54_2 do
		for iter_54_1 = 1, #var_54_1.attachments do
			local var_54_3 = var_54_1.attachments[iter_54_1].ref and var_54_1.attachments[iter_54_1].ref or var_54_1.attachments[iter_54_1]
			local var_54_4 = {}
			local var_54_5 = ATTACHMENT.GetRef(var_54_3, var_54_1.weapon)

			if var_54_5 and var_54_5 ~= ATTACHMENT.none then
				local var_54_6 = ATTACHMENT.GetCategory(var_54_5)

				var_54_4.icon = ATTACHMENT.GetImage(var_54_5)
				var_54_4.category = var_54_6

				if var_54_6 == var_54_2[iter_54_0] then
					table.insert(var_54_0, var_54_4)
				end
			end
		end
	end

	return var_54_0
end

function ATTACHMENT.SetupSlotDisplay(arg_55_0, arg_55_1)
	if not arg_55_1 or type(arg_55_1) ~= "table" or not arg_55_1.weaponTable then
		assert(false, "You must pass a valid table of options with a set weaponTable property/value.")
	end

	assert(arg_55_0.Grid, "Slot displays require a gridLayout widget with an instance name of 'Grid.'")

	local var_55_0 = 0
	local var_55_1 = ATTACHMENT.GetAttachmentData(arg_55_0, {
		weaponTable = arg_55_1.weaponTable
	})
	local var_55_2 = ATTACHMENT.GetMaxAttachmentCount(arg_55_1.weaponTable.weapon)
	local var_55_3 = var_55_2 > ATTACHMENT.count
	local var_55_4

	if arg_55_0._sequences.DisplayExtraAttachments then
		var_55_4 = arg_55_0._sequences.DisplayExtraAttachments
	elseif arg_55_0:getParent()._sequences then
		var_55_4 = arg_55_0:getParent()._sequences.DisplayExtraAttachments
	end

	local var_55_5

	if arg_55_0._sequences.HideExtraAttachments then
		var_55_5 = arg_55_0._sequences.HideExtraAttachments
	elseif arg_55_0:getParent()._sequences then
		var_55_5 = arg_55_0:getParent()._sequences.HideExtraAttachments
	end

	if var_55_3 then
		if var_55_4 then
			ACTIONS.AnimateSequence(arg_55_0, "DisplayExtraAttachments")
			ACTIONS.AnimateSequence(arg_55_0:getParent(), "DisplayExtraAttachments")
		end
	elseif var_55_5 then
		ACTIONS.AnimateSequence(arg_55_0, "HideExtraAttachments")
		ACTIONS.AnimateSequence(arg_55_0:getParent(), "HideExtraAttachments")
	end

	ATTACHMENT.SortTableOnEquipped(var_55_1)
	arg_55_0.Grid:SetRefreshChild(function(arg_56_0, arg_56_1, arg_56_2)
		local var_56_0 = arg_55_0.Grid:GetContentIndex(arg_56_1, arg_56_2)

		arg_56_0._itemData = var_55_1[var_56_0 + 1]

		ACTIONS.AnimateSequence(arg_56_0, "Empty")

		if not arg_56_0._itemData then
			return
		end

		if arg_56_0._itemData.ref ~= ATTACHMENT.none then
			ACTIONS.AnimateSequence(arg_56_0, "Filled")
		end

		arg_56_0._isCurrentCategory = arg_56_0._itemData.category == arg_55_1.currentCategory

		if arg_56_0.SetSlotDisplay then
			arg_56_0:SetSlotDisplay()
		end
	end)

	if arg_55_0.EquippedText then
		if var_55_2 < #var_55_1 then
			assert(false, "There are more weapon attachments assigned to this weapon than allowed. Please check the file " .. arg_55_1.weaponTable.weapon .. " _variants.csv")
		end

		arg_55_0.EquippedText:setText(Engine.CBBHFCGDIC("CAS/EQUIPPED_COUNT", #var_55_1, var_55_2))

		local var_55_6 = LAYOUT.GetTextWidth(arg_55_0.EquippedText)
		local var_55_7, var_55_8, var_55_9, var_55_10 = arg_55_0.EquippedText:getLocalRect()
		local var_55_11 = 15 * _1080p
		local var_55_12 = var_55_7 + var_55_6 + var_55_11

		arg_55_0.Grid:SetLeft(var_55_12)

		var_55_0 = var_55_0 + var_55_12
	end

	local var_55_13 = var_55_0 + (arg_55_0.Grid._columnWidth + arg_55_0.Grid._spacingX) * (var_55_2 - 1)

	arg_55_0.Grid:SetNumChildren(var_55_2)
	arg_55_0.Grid:RefreshContent()

	return var_55_13, #var_55_1
end
