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

function ATTACHMENT.GetImage(arg_1_0)
	local var_1_0 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_1_0, CSV.attachments.cols.image)

	var_1_0 = var_1_0 == "" and "white" or var_1_0

	return var_1_0
end

function ATTACHMENT.GetIndex(arg_2_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_2_0, CSV.attachments.cols.index)
end

function ATTACHMENT.GetRefAndVariantID(arg_3_0)
	local var_3_0 = LUI.Split(arg_3_0, "|")

	return var_3_0[1], var_3_0[2]
end

function ATTACHMENT.GetStatsForAttachments(arg_4_0, arg_4_1)
	local var_4_0 = {
		statFireRate = 0,
		statRange = 0,
		statAccuracy = 0,
		statControl = 0,
		statMobility = 0,
		statDamage = 0
	}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		local var_4_1 = ATTACHMENT.GetRef(iter_4_1.ref, arg_4_0)
		local var_4_2 = StringTable.BJJBBCJGEJ(CSV.attachments.file, CSV.attachments.cols.ref, var_4_1)

		if var_4_2 >= 0 then
			local var_4_3 = CSV.ReadRow(CSV.attachments, var_4_2)

			var_4_0.statAccuracy = var_4_0.statAccuracy + tonumber(var_4_3.acc)
			var_4_0.statDamage = var_4_0.statDamage + tonumber(var_4_3.dam)
			var_4_0.statRange = var_4_0.statRange + tonumber(var_4_3.rng)
			var_4_0.statFireRate = var_4_0.statFireRate + tonumber(var_4_3.rof)
			var_4_0.statMobility = var_4_0.statMobility + tonumber(var_4_3.mob)
			var_4_0.statControl = var_4_0.statControl + tonumber(var_4_3.ctl)
		end
	end

	return var_4_0
end

function ATTACHMENT.GetModifierNameAndValue(arg_5_0)
	local var_5_0 = LUI.Split(arg_5_0, "|")

	assert(var_5_0[1], "Required MOD Name is Missing from attachmenttable.csv")
	assert(var_5_0[2], "Required MOD Value is Missing from attachmenttable.csv")

	local var_5_1 = var_5_0[1]
	local var_5_2 = var_5_0[2]

	return var_5_1, var_5_2
end

function ATTACHMENT.GetModifierInfo(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = CSV.attachments.cols.modifierEnd - CSV.attachments.cols.modifierStart + 1

	for iter_6_0 = 0, var_6_1 - 1 do
		local var_6_2 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_6_0, CSV.attachments.cols.modifierStart + iter_6_0)

		if var_6_2 and var_6_2 ~= "" then
			local var_6_3, var_6_4 = ATTACHMENT.GetModifierNameAndValue(var_6_2)

			table.insert(var_6_0, {
				name = var_6_3,
				value = tonumber(var_6_4)
			})
		end
	end

	return var_6_0
end

function ATTACHMENT.GetAttachmentModifierString(arg_7_0, arg_7_1)
	local var_7_0 = ""
	local var_7_1 = ""

	if arg_7_0 and arg_7_1 then
		local var_7_2 = arg_7_1 > 0 and "[{attribute_pro}]" or "[{attribute_con}]"

		for iter_7_0 = 0, math.abs(arg_7_1) - 1 do
			var_7_0 = var_7_0 .. var_7_2
		end

		var_7_1 = Engine.CBBHFCGDIC(arg_7_0)
	end

	return var_7_0, var_7_1
end

function ATTACHMENT.GetTableFromWeaponSetup(arg_8_0)
	local var_8_0 = {}

	for iter_8_0 = 0, #arg_8_0.attachmentSetup - 1 do
		table.insert(var_8_0, arg_8_0.attachmentSetup[iter_8_0].attachment:get())
	end

	return var_8_0
end

function ATTACHMENT.GetBaseRef(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_9_0, CSV.attachments.cols.baseRef)
end

function ATTACHMENT.GetRefInternal(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if arg_10_1 == nil or arg_10_1 == "none" then
		return arg_10_0
	end

	local var_10_0 = arg_10_0
	local var_10_1 = ""
	local var_10_2 = 0

	repeat
		var_10_2 = var_10_2 + 1
		var_10_1 = StringTable.CBGJCDIHCE(arg_10_2.file, arg_10_2.rows.attachRef, var_10_2)
	until var_10_1 == arg_10_0 or var_10_1 == ""

	if var_10_1 == arg_10_0 then
		local var_10_3 = StringTable.DIFCHIGDFB(arg_10_2.file, arg_10_2.cols.weapOrClass, arg_10_1, var_10_2)

		if var_10_3 == "" then
			var_10_3 = StringTable.DIFCHIGDFB(arg_10_2.file, arg_10_2.cols.weapOrClass, WEAPON.GetWeaponClass(arg_10_3 or arg_10_1), var_10_2)
		end

		if var_10_3 ~= "" then
			var_10_0 = var_10_3
		end
	end

	return var_10_0
end

function ATTACHMENT.GetRef(arg_11_0, arg_11_1, arg_11_2)
	return ATTACHMENT.GetRefInternal(arg_11_0, arg_11_1, CSV.attachmentMap, arg_11_2)
end

function ATTACHMENT.GetAttachmentAddition(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_12_0, CSV.attachments.cols.slot)
end

function ATTACHMENT.GetName(arg_13_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_13_0, CSV.attachments.cols.name))
end

function ATTACHMENT.GetNameUnlocalized(arg_14_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_14_0, CSV.attachments.cols.name)
end

function ATTACHMENT.GetDesc(arg_15_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_15_0, CSV.attachments.cols.desc))
end

function ATTACHMENT.GetEquippedOptic(arg_16_0)
	local var_16_0 = arg_16_0.weapon:get()

	for iter_16_0, iter_16_1 in ddlpairs(arg_16_0.attachmentSetup) do
		local var_16_1 = ATTACHMENT.GetRef(iter_16_1.attachment:get(), var_16_0)

		if ATTACHMENT.GetCategory(var_16_1) == ATTACHMENT.opticCategory then
			return var_16_1
		end
	end

	local var_16_2 = {}
	local var_16_3 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_16_0.weapon:get(), CSV.MPWeapons.cols.defaultAttachments)

	if var_16_3 and #var_16_3 > 0 then
		var_16_2 = LUI.Split(var_16_3, " ")
	end

	for iter_16_2, iter_16_3 in ipairs(var_16_2) do
		if ATTACHMENT.GetCategory(iter_16_3) == ATTACHMENT.opticCategory then
			return ATTACHMENT.GetRef(iter_16_3, var_16_0)
		end
	end

	return ""
end

function ATTACHMENT.GetOpticRef(arg_17_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_17_0, CSV.attachments.cols.reticles)
end

function ATTACHMENT.GetOpticReticleCategory(arg_18_0)
	if arg_18_0 == nil or #arg_18_0 == 0 then
		return ""
	end

	return StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.attachRef, arg_18_0, CSV.reticleCategoryTable.cols.categoryRef)
end

function ATTACHMENT.SupportsCustomReticles(arg_19_0)
	if arg_19_0 == nil or #arg_19_0 == 0 then
		return false
	end

	return #StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_19_0, CSV.attachments.cols.reticles) > 0
end

function ATTACHMENT.ReticleTypeSupportsAltImage(arg_20_0)
	return arg_20_0 == "hybrid" or arg_20_0 == "hybridthermal"
end

function ATTACHMENT.IsSelectableAttachment(arg_21_0, arg_21_1)
	local var_21_0 = ATTACHMENT.GetBaseRef(arg_21_0.ref)

	if var_21_0 == "" then
		return false
	end

	local var_21_1 = CSV.attachmentIDs.GetFile(arg_21_1)
	local var_21_2 = CSV.gunsmithProgressionTable:GetFile(arg_21_1)
	local var_21_3 = StringTable.DIFCHIGDFB(var_21_1, CSV.attachmentIDs.cols.ref, var_21_0, CSV.attachmentIDs.cols.index)

	return StringTable.DIFCHIGDFB(var_21_2, CSV.gunsmithProgressionTable.cols.lootID, var_21_3, CSV.gunsmithProgressionTable.cols.level) ~= ""
end

function ATTACHMENT.ClearAllAttachments(arg_22_0)
	for iter_22_0, iter_22_1 in ddlpairs(arg_22_0.attachmentSetup) do
		iter_22_1.attachment:set(ATTACHMENT.none)
		iter_22_1.variantID:set(ATTACHMENT.baseVariant)
	end

	WEAPON.SetEquippedReticle(arg_22_0, WEAPON.ReticleNoneValue)
end

function ATTACHMENT.GetStatAccuracy(arg_23_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_23_0, CSV.attachments.cols.acc))
end

function ATTACHMENT.GetStatDamage(arg_24_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_24_0, CSV.attachments.cols.dam))
end

function ATTACHMENT.GetStatRange(arg_25_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_25_0, CSV.attachments.cols.rng))
end

function ATTACHMENT.GetStatFireRate(arg_26_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_26_0, CSV.attachments.cols.rof))
end

function ATTACHMENT.GetStatMobility(arg_27_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_27_0, CSV.attachments.cols.mob))
end

function ATTACHMENT.GetStatControl(arg_28_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_28_0, CSV.attachments.cols.ctl))
end

function ATTACHMENT.GetCategory(arg_29_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_29_0, CSV.attachments.cols.category)
end

function ATTACHMENT.IsUnlocked(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = WEAPON.GetWeaponClass(arg_30_1)
	local var_30_1 = WEAPON.GetWeaponClassAttachUnlockTablePrefix(var_30_0)

	return Unlocks.BFCEGDJIEI(arg_30_2, var_30_1 .. "Attach", arg_30_1 .. "+" .. arg_30_0)
end

function ATTACHMENT.GetUnlockText(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = WEAPON.GetWeaponClass(arg_31_1)
	local var_31_1 = ATTACHMENT.GetUnlockTable(arg_31_1)
	local var_31_2 = arg_31_1 .. "+" .. arg_31_0

	if arg_31_3 then
		return Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/NOT_AVAILABLE_IN_CWL")
	end

	local var_31_3 = StringTable.DIFCHIGDFB(var_31_1, CSV.attachmentUnlockTable.cols.weaponAttachRef, var_31_2, CSV.attachmentUnlockTable.cols.ui_text)
	local var_31_4 = StringTable.DIFCHIGDFB(var_31_1, CSV.attachmentUnlockTable.cols.weaponAttachRef, var_31_2, CSV.attachmentUnlockTable.cols.ui_text_var1)
	local var_31_5 = StringTable.DIFCHIGDFB(var_31_1, CSV.attachmentUnlockTable.cols.weaponAttachRef, var_31_2, CSV.attachmentUnlockTable.cols.ui_text_var2)

	return Engine.CBBHFCGDIC(var_31_3, var_31_4, var_31_5)
end

function ATTACHMENT.GetUnlockTable(arg_32_0)
	local var_32_0 = WEAPON.GetWeaponClass(arg_32_0)
	local var_32_1 = WEAPON.GetWeaponClassAttachUnlockTablePrefix(var_32_0)

	return CSV.attachmentUnlockTable.fileRoot .. var_32_1 .. CSV.attachmentUnlockTable.fileSuffix
end

function ATTACHMENT.IsNew(arg_33_0, arg_33_1, arg_33_2)
	return false
end

function ATTACHMENT.ClearNew(arg_34_0, arg_34_1, arg_34_2)
	return
end

function ATTACHMENT.GetConflictingAttachment(arg_35_0, arg_35_1)
	local var_35_0 = ATTACHMENT.GetCategory(arg_35_1)

	for iter_35_0, iter_35_1 in pairs(arg_35_0.attachments) do
		local var_35_1 = iter_35_1.ref

		if ATTACHMENT.GetCategory(var_35_1) == var_35_0 then
			return var_35_1
		end
	end

	return false
end

function ATTACHMENT.GetAttachmentCategoryName(arg_36_0)
	return StringTable.DIFCHIGDFB(CSV.attachmentCategories.file, CSV.attachmentCategories.cols.ref, arg_36_0, CSV.attachmentCategories.cols.name)
end

function ATTACHMENT.GetAttachmentCategoryButton(arg_37_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.attachmentCategories.file, CSV.attachmentCategories.cols.ref, arg_37_0, CSV.attachmentCategories.cols.buttonIndex))
end

function ATTACHMENT.GetBlockedCategory(arg_38_0)
	return StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, arg_38_0, CSV.attachments.cols.blockedCategory)
end

function ATTACHMENT.GetBlockedCategorySlot(arg_39_0, arg_39_1)
	local var_39_0 = ATTACHMENT.GetRef(arg_39_0, arg_39_1.weapon)
	local var_39_1 = ATTACHMENT.GetBlockedCategory(var_39_0)

	if not var_39_1 or #var_39_1 == 0 then
		return
	end

	for iter_39_0, iter_39_1 in ipairs(arg_39_1.attachments) do
		local var_39_2 = ATTACHMENT.GetRef(iter_39_1.ref, arg_39_1.weapon)

		if ATTACHMENT.GetCategory(var_39_2) == var_39_1 then
			return iter_39_0
		end
	end
end

function ATTACHMENT.GetRefByID(arg_40_0, arg_40_1)
	local var_40_0 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_40_0, CSV.weaponIDs.cols.baseRef)
	local var_40_1 = CSV.attachmentIDs.GetFile(var_40_0)
	local var_40_2 = StringTable.DIFCHIGDFB(var_40_1, CSV.attachmentIDs.cols.index, arg_40_1, CSV.attachmentIDs.cols.ref)

	return ATTACHMENT.GetRef(var_40_2, var_40_0)
end

function ATTACHMENT.GetRefByAttachmentID(arg_41_0)
	local var_41_0 = LOOT.GetBaseWeaponIDFromAttachmentLootID(arg_41_0)

	if var_41_0 then
		return ATTACHMENT.GetRefByID(var_41_0, arg_41_0)
	end

	return nil
end

function ATTACHMENT.GetConfigString(arg_42_0)
	local var_42_0 = ""

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.attachments) do
		if iter_42_1.ref ~= ATTACHMENT.none then
			if #var_42_0 > 0 then
				var_42_0 = var_42_0 .. "+"
			end

			var_42_0 = var_42_0 .. iter_42_1.ref .. "|" .. iter_42_1.variantID
		end
	end

	return var_42_0
end

function ATTACHMENT.GetCategoryByLootID(arg_43_0, arg_43_1)
	local var_43_0 = CSV.attachmentIDs.GetFile(arg_43_1)
	local var_43_1 = StringTable.DIFCHIGDFB(var_43_0, CSV.attachmentIDs.cols.index, arg_43_0, CSV.attachmentIDs.cols.ref)
	local var_43_2 = ATTACHMENT.GetRef(var_43_1, arg_43_1)

	return (StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, var_43_2, CSV.attachments.cols.category))
end

function ATTACHMENT.GetNewAttachmentIDsByCategory(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = {}
	local var_44_1 = arg_44_2 .. GUNSMITH.typeNamePostFix.attachment
	local var_44_2 = Loot.BCBAGDEJAJ(arg_44_0, var_44_1)

	if var_44_2 and #var_44_2 > 0 then
		for iter_44_0, iter_44_1 in ipairs(var_44_2) do
			if ATTACHMENT.GetCategoryByLootID(iter_44_1, arg_44_2) == arg_44_1 then
				table.insert(var_44_0, iter_44_1)
			end
		end
	end

	return var_44_0
end

function ATTACHMENT.IsDisplayNameAvailable(arg_45_0)
	if arg_45_0 == nil or #arg_45_0 == 0 or arg_45_0 == "none" then
		return false
	end

	local var_45_0 = StringTable.DIFCHIGDFB(CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, arg_45_0, CSV.MPAttachments.cols.category)

	return false
end

function ATTACHMENT.AreVariantsEnabled()
	return Dvar.IBEGCHEFE("NNMMRMNMNQ")
end

function ATTACHMENT.GetOverrideDesc(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = WEAPON.GetVariantFile(arg_47_1)
	local var_47_1 = StringTable.DIFCHIGDFB(var_47_0, CSV.weaponVariants.cols.variantID, arg_47_2, CSV.weaponVariants.cols.assetOverride)

	if var_47_1 and #var_47_1 > 0 then
		local var_47_2 = ATTACHMENT.GetRef(arg_47_0, var_47_1)
		local var_47_3 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.ref, var_47_2, CSV.attachments.cols.desc)

		if var_47_3 and #var_47_3 > 0 then
			return var_47_3
		end
	end
end

function ATTACHMENT.IsDismembermentEnabled(arg_48_0)
	return StringTable.DIFCHIGDFB(CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, arg_48_0, CSV.MPAttachments.cols.dismembermentEnabled) == "1"
end
