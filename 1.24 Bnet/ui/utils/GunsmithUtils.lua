GUNSMITH = {}
GUNSMITH.maxCategories = 9
GUNSMITH.lineDuration = 400
GUNSMITH.maxMods = 5
GUNSMITH.modSlotChars = 3
GUNSMITH.modSlotBaseID = 7000000
GUNSMITH.bucketItems = 5
GUNSMITH.buttonState = {
	CONFLICT = 5,
	MODIFICATION_LOCKED = 3,
	SWAP = 6,
	EQUIPPED = 7,
	UNLOCKED = 4,
	CHALLENGE_LOCKED = 2,
	PROGRESSION_LOCKED = 1
}
GUNSMITH.modificationSteps = {
	NAME = 2,
	GUNSMITH = 1,
	WARNING = 3
}
GUNSMITH.typeNamePostFix = {
	attachment = "_attachment",
	camos = "_camos"
}
GUNSMITH.WEAPON_PREVIEW_CAMERA_TYPE = {
	BIG_GUN = 1,
	SMALL_GUN = 2,
	NONE = 0
}

function GUNSMITH.GetDefaultModificationName()
	local var_1_0 = StringTable.BFHCAIIDA(CSV.modificationDefaults.file)

	math.randomseed(Engine.BFBIDEGDFB())

	local var_1_1 = math.random(0, var_1_0 - 1)

	return StringTable.CBGJCDIHCE(CSV.modificationDefaults.file, var_1_1, CSV.modificationDefaults.cols.name)
end

function GUNSMITH.GetAttachmentCategories(arg_2_0)
	local var_2_0 = WEAPON.GetWeaponClass(arg_2_0)
	local var_2_1 = StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, var_2_0, CSV.weaponClasses.cols.attachCategoryWhitelist)
	local var_2_2 = LUI.Split(var_2_1, "|")
	local var_2_3 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_2_0, CSV.weapons.cols.attachCategoryBlacklist)
	local var_2_4 = LUI.KeyValueSplit(var_2_3, "|")
	local var_2_5 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_2) do
		if not var_2_4[iter_2_1] then
			table.insert(var_2_5, iter_2_1)
		end
	end

	return var_2_5
end

function GUNSMITH.IsAttachVariantCategoryBlacklisted(arg_3_0, arg_3_1)
	local var_3_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_3_0, CSV.weapons.cols.attachVariantCategoryBlacklist)

	return LUI.KeyValueSplit(var_3_0, "|")[arg_3_1]
end

function GUNSMITH.GetBlockedCategories(arg_4_0)
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.attachments) do
		local var_4_1 = ATTACHMENT.GetRef(iter_4_1.ref, arg_4_0.weapon)
		local var_4_2 = ATTACHMENT.GetBlockedCategory(var_4_1)

		if var_4_2 and #var_4_2 > 0 then
			var_4_0[var_4_2] = var_4_1
		end
	end

	return var_4_0
end

function GUNSMITH.GetBlockedCategoryWarning(arg_5_0, arg_5_1)
	local var_5_0 = ATTACHMENT.GetRef(arg_5_0.attachments[arg_5_1].ref, arg_5_0.weapon)
	local var_5_1 = ATTACHMENT.GetCategory(var_5_0)
	local var_5_2 = ATTACHMENT.GetAttachmentCategoryName(var_5_1)

	return Engine.CBBHFCGDIC("CAS/BLOCKED_CATEGORY_WARNING", var_5_2, ATTACHMENT.GetName(var_5_0))
end

function GUNSMITH.GetBlockedCategoryButtonWarning(arg_6_0, arg_6_1)
	local var_6_0 = ATTACHMENT.GetCategory(arg_6_1)
	local var_6_1 = ATTACHMENT.GetAttachmentCategoryName(var_6_0)

	return Engine.CBBHFCGDIC("CAS/NOT_AVAILABLE", ATTACHMENT.GetName(arg_6_1))
end

function GUNSMITH.GetChallengeXPReward(arg_7_0)
	return StringTable.DIFCHIGDFB(CSV.gunsmithChallenges.file, CSV.gunsmithChallenges.cols.id, arg_7_0, CSV.gunsmithChallenges.cols.XPReward)
end

function GUNSMITH.GetAttachmentsAndBucketItems(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = {}
	local var_8_1 = {}
	local var_8_2 = CSV.gunsmithProgressionTable
	local var_8_3 = var_8_2:GetFile(arg_8_1)
	local var_8_4 = {}
	local var_8_5 = not Engine.DDJFBBJAIG() and CONDITIONS.AreRestrictionsActive(arg_8_0)
	local var_8_6 = WEAPON.GetModificationAttachments(arg_8_0, arg_8_1, arg_8_2)

	for iter_8_0 = 0, StringTable.BFHCAIIDA(var_8_3) do
		local var_8_7 = 0
		local var_8_8 = CSV.ReadRowWithFile(var_8_2, var_8_3, iter_8_0)
		local var_8_9 = var_8_8.level

		while var_8_8.lootID and #var_8_8.lootID > 0 do
			local var_8_10 = tonumber(var_8_8.lootID)

			var_8_8.lootID = var_8_10

			if var_8_10 and var_8_10 >= LOOT.AttachIDsMin and var_8_10 <= LOOT.AttachIDsMax then
				local var_8_11 = LOOT.GetItemRef(LOOT.itemTypes.ATTACHMENT, var_8_8.lootID, {
					weaponRef = arg_8_1
				})

				if var_8_11 and #var_8_11 > 0 then
					local var_8_12 = ATTACHMENT.GetRef(var_8_11, arg_8_1)
					local var_8_13 = StringTable.BJJBBCJGEJ(CSV.attachments.file, CSV.attachments.cols.ref, var_8_12)
					local var_8_14 = CSV.ReadRow(CSV.attachments, var_8_13)
					local var_8_15 = MatchRules.EBCADBGDHB(var_8_14.baseRef, arg_8_1)

					if not var_8_5 or not var_8_15 then
						var_8_14.gunsmithAttach = var_8_8

						local var_8_16 = #var_8_8.challengeID > 0

						if var_8_16 then
							var_8_14.gunsmithAttach.progress = Gunsmith.CEFIIHJEFG(arg_8_0, tonumber(var_8_14.gunsmithAttach.challengeID)).progress
						end

						var_8_14.unlocked = PROGRESSION.IsUnlockedWithID(arg_8_0, var_8_8.lootID)
						var_8_14.variants = WEAPON.GetAttachVariants(arg_8_0, var_8_10, arg_8_1)

						if CONDITIONS.IsWaveGameType() then
							var_8_14.survivalCost = CP.GetAttachmentSurvivalCost(var_8_14.category)
						end

						var_8_0[var_8_14.category] = var_8_0[var_8_14.category] or {}
						var_8_1[var_8_14.category] = var_8_1[var_8_14.category] or {}

						if var_8_15 then
							table.insert(var_8_1[var_8_14.category], var_8_14)
						elseif var_8_14.unlocked or var_8_6[var_8_11] then
							table.insert(var_8_0[var_8_14.category], var_8_14)

							if not var_8_16 then
								if var_8_14.unlocked then
									if #var_8_4 >= GUNSMITH.bucketItems then
										var_8_4 = {}
									end

									table.insert(var_8_4, var_8_14)
								elseif var_8_6[var_8_11] then
									var_8_14.unlocked = true

									if #var_8_4 < GUNSMITH.bucketItems then
										table.insert(var_8_4, var_8_14)
									end
								end
							end
						elseif not var_8_16 and #var_8_4 < GUNSMITH.bucketItems then
							table.insert(var_8_0[var_8_14.category], var_8_14)
							table.insert(var_8_4, var_8_14)
						elseif var_8_16 then
							table.insert(var_8_0[var_8_14.category], var_8_14)
						elseif #var_8_0[var_8_14.category] > 0 then
							var_8_14.isClassified = true

							table.insert(var_8_0[var_8_14.category], var_8_14)
						end
					end
				end
			end

			var_8_7 = var_8_7 + 1

			local var_8_17 = var_8_2.colOffset * var_8_7
			local var_8_18 = {
				lootID = var_8_2.cols.lootID + var_8_17,
				challengeID = var_8_2.cols.challengeID + var_8_17,
				challengeRef = var_8_2.cols.challengeRef + var_8_17,
				bucketID = var_8_2.cols.bucketID + var_8_17
			}

			var_8_8 = CSV.ReadRowWithFileAndColumns(var_8_3, iter_8_0, var_8_18)
			var_8_8.level = var_8_9
		end
	end

	for iter_8_1, iter_8_2 in pairs(var_8_1) do
		for iter_8_3, iter_8_4 in pairs(iter_8_2) do
			table.insert(var_8_0[iter_8_1], iter_8_4)
		end
	end

	return var_8_0, var_8_4
end

function GUNSMITH.IsDisabled(arg_9_0)
	local var_9_0 = WEAPON.GetWeaponClass(arg_9_0)
	local var_9_1 = false

	if var_9_0 and #var_9_0 > 0 then
		var_9_1 = StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, var_9_0, CSV.weaponClasses.cols.canBeGunsmithed) == "1"
	end

	local var_9_2 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_9_0, CSV.weapons.cols.isGunsmithDisabled) == "1"

	return not var_9_1 or var_9_2
end

function GUNSMITH.IsCustomizationDisabled(arg_10_0)
	local var_10_0 = WEAPON.GetWeaponClass(arg_10_0)

	return StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_10_0, CSV.weapons.cols.isCustomizationDisabled) == "1"
end

function GUNSMITH.IsGunsmithCustomsAvailable(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = arg_11_1 and #arg_11_2 > 1
	local var_11_1 = GUNSMITH.IsAttachVariantCategoryBlacklisted(arg_11_3, arg_11_4)

	return ATTACHMENT.AreVariantsEnabled() and var_11_0 and not var_11_1 and Engine.DDJFBBJAIG() and Engine.CJJAFGIFAC(arg_11_0)
end

function GUNSMITH.AreMasterChallengesEnabled(arg_12_0, arg_12_1)
	if arg_12_0 == nil or arg_12_1 == nil then
		return false
	end

	local var_12_0 = Dvar.IBEGCHEFE("MTORSRMLSQ")
	local var_12_1 = WEAPON.IsGoldCamoUnlocked(arg_12_0, arg_12_1)

	return var_12_0 and CONDITIONS.InFrontendPublic() and var_12_1 or Dvar.IBEGCHEFE("lui_weapon_master_challenges_forced")
end

function GUNSMITH.ToastEquipAttach(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = {
		displayTime = 3000,
		icon = "hud_info_alert",
		header = Engine.CBBHFCGDIC("LUA_MENU/ATTACHMENT_EQUIPPED"),
		description = arg_13_2,
		type = LUI.ToastManager.NotificationType.AttachmentEquipped,
		controllerIndex = arg_13_1
	}

	arg_13_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_13_0
	})
end

function GUNSMITH.EquipAttachment(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	local var_14_0 = arg_14_4.attachSlot

	if var_14_0 then
		local var_14_1 = arg_14_3.attachmentSetup[var_14_0 - 1].attachment:get()
		local var_14_2 = false
		local var_14_3 = arg_14_3.weapon:get()
		local var_14_4 = ATTACHMENT.GetRef(var_14_1, var_14_3)
		local var_14_5 = ATTACHMENT.GetRef(arg_14_2, var_14_3)

		if var_14_1 == arg_14_2 and not arg_14_4.variantID then
			arg_14_3.attachmentSetup[var_14_0 - 1].attachment:set(ATTACHMENT.none)

			arg_14_2 = ATTACHMENT.none
			var_14_5 = ATTACHMENT.none
			var_14_2 = true
		else
			arg_14_3.attachmentSetup[var_14_0 - 1].attachment:set(arg_14_2)
		end

		if arg_14_4.variantID then
			arg_14_3.attachmentSetup[var_14_0 - 1].variantID:set(tonumber(arg_14_4.variantID))
		else
			local var_14_6 = ATTACHMENT.baseVariant

			if arg_14_3.lootItemID:get() ~= LOOT.emptyID then
				local var_14_7 = WEAPON.GetModificationAttachments(arg_14_1, var_14_3, arg_14_3.lootItemID:get())

				if var_14_7[arg_14_2] then
					var_14_6 = var_14_7[arg_14_2]
				end
			end

			arg_14_3.attachmentSetup[var_14_0 - 1].variantID:set(var_14_6)
		end

		local var_14_8

		if arg_14_4.isNewAttachment or arg_14_4.isNewVariantID and arg_14_4.variantID == ATTACHMENT.baseVariant then
			var_14_8 = ATTACHMENT.GetName(var_14_5)
		elseif arg_14_4.isNewVariantID and arg_14_4.lootID then
			var_14_8 = GUNSMITH.GetVariantName(arg_14_4.variantID, arg_14_4.lootID)
		end

		if arg_14_0 and var_14_8 then
			GUNSMITH.ToastEquipAttach(arg_14_0, arg_14_1, var_14_8)
		end

		local var_14_9 = ATTACHMENT.GetBlockedCategorySlot(arg_14_2, WEAPON.GenerateWeaponTable(arg_14_3))

		if var_14_9 then
			arg_14_3.attachmentSetup[var_14_9 - 1].attachment:set(ATTACHMENT.none)
			arg_14_3.attachmentSetup[var_14_9 - 1].variantID:set(ATTACHMENT.baseVariant)
		end

		if ATTACHMENT.GetCategory(var_14_4) == ATTACHMENT.opticCategory or ATTACHMENT.GetCategory(var_14_5) == ATTACHMENT.opticCategory then
			local var_14_10 = ATTACHMENT.GetOpticReticleCategory(var_14_1)
			local var_14_11 = ATTACHMENT.GetOpticReticleCategory(arg_14_2)

			if not ATTACHMENT.SupportsCustomReticles(var_14_5) or var_14_10 ~= var_14_11 then
				WEAPON.SetEquippedReticle(arg_14_3, WEAPON.ReticleNoneValue)
			end
		end

		if arg_14_4.menusToLeave and not var_14_2 then
			for iter_14_0, iter_14_1 in ipairs(arg_14_4.menusToLeave) do
				LUI.FlowManager.RequestLeaveMenuByName(iter_14_1)
			end

			return true
		else
			return false
		end
	else
		local var_14_12 = {
			attachToReplaceWith = arg_14_2,
			weaponPlayerData = arg_14_3,
			menusToLeave = arg_14_4.menusToLeave,
			variantID = arg_14_4.variantID,
			lootID = arg_14_4.lootID,
			survivalCost = arg_14_4.survivalCost
		}

		LUI.FlowManager.RequestPopupMenu(nil, "SwapAttachmentPopup", true, arg_14_1, false, var_14_12)
	end
end

function GUNSMITH.GetAttachmentSceneOverride(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {
		{
			col = CSV.gunsmithSetup.cols.weapon,
			key = arg_15_0
		},
		{
			col = CSV.gunsmithSetup.cols.category,
			key = arg_15_2
		},
		{
			col = CSV.gunsmithSetup.cols.variantID,
			key = arg_15_1
		}
	}
	local var_15_1 = StringTable.CEBAGDAEJJ(CSV.gunsmithSetup.file, var_15_0, CSV.gunsmithSetup.cols.scene)

	if not var_15_1 or #var_15_1 == 0 then
		var_15_0[3] = {
			col = CSV.gunsmithSetup.cols.variantID,
			key = WEAPON.baseVariant
		}
		var_15_1 = StringTable.CEBAGDAEJJ(CSV.gunsmithSetup.file, var_15_0, CSV.gunsmithSetup.cols.scene)
	end

	return var_15_1
end

function GUNSMITH.GetAttachmentCategoryScene(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = WEAPON.GetWeaponClass(arg_16_0)
	local var_16_1 = GUNSMITH.GetAttachmentSceneOverride(arg_16_0, arg_16_1, arg_16_2)

	if var_16_1 and #var_16_1 > 0 then
		return var_16_1
	end

	if var_16_0 == WEAPON.LAUNCHERClass then
		return StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, var_16_0, CSV.weaponClasses.cols.previewScene)
	end

	local var_16_2 = CSV.attachmentCategories.cols.categoryScene

	if var_16_0 == WEAPON.pistolClass then
		var_16_2 = CSV.attachmentCategories.cols.smallCategoryScene
	elseif var_16_0 == WEAPON.LMGClass or var_16_0 == WEAPON.sniperClass then
		var_16_2 = CSV.attachmentCategories.cols.largeCategoryScene
	end

	return StringTable.DIFCHIGDFB(CSV.attachmentCategories.file, CSV.attachmentCategories.cols.ref, arg_16_2, var_16_2)
end

local function var_0_0(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in pairs(arg_17_0) do
		if iter_17_1.data["slot" .. arg_17_2] == "1" and not arg_17_1[iter_17_0] then
			table.insert(var_17_0, iter_17_1)
		end
	end

	return var_17_0
end

local function var_0_1(arg_18_0, arg_18_1)
	local var_18_0 = {}
	local var_18_1 = 0
	local var_18_2 = "selectionPriority"

	for iter_18_0, iter_18_1 in ipairs(arg_18_0[arg_18_1.slotIndex]) do
		if arg_18_1.cellIndex == 4 then
			if iter_18_1.cellRequirement >= arg_18_1.cellIndex - 1 then
				table.insert(var_18_0, iter_18_1)

				var_18_1 = var_18_1 + iter_18_1[var_18_2]
			end
		elseif iter_18_1.cellRequirement == arg_18_1.cellIndex then
			table.insert(var_18_0, iter_18_1)

			var_18_1 = var_18_1 + iter_18_1[var_18_2]
		end
	end

	if #var_18_0 == 0 then
		return nil
	end

	local var_18_3 = 0
	local var_18_4 = math.floor(math.random() * 100 + 0.5) / 100 * var_18_1
	local var_18_5 = 1

	for iter_18_2, iter_18_3 in ipairs(var_18_0) do
		if var_18_4 <= var_18_3 + iter_18_3[var_18_2] then
			var_18_5 = iter_18_2

			break
		else
			var_18_3 = var_18_3 + iter_18_3[var_18_2]
		end
	end

	for iter_18_4, iter_18_5 in ipairs(arg_18_0[arg_18_1.slotIndex]) do
		if iter_18_5.ref == var_18_0[var_18_5].ref then
			table.remove(arg_18_0[arg_18_1.slotIndex], iter_18_4)

			break
		end
	end

	return var_18_0[var_18_5]
end

function GUNSMITH.GetVariantName(arg_19_0, arg_19_1)
	if arg_19_0 == 0 then
		return Engine.CBBHFCGDIC("CAS/DEFAULT_VARIANT")
	else
		local var_19_0 = WEAPON.GetVariantBaseRef(arg_19_1)

		return WEAPON.GetLootWeaponName(var_19_0, arg_19_1)
	end
end

function GUNSMITH.GetSelectedAttachIndexForCategory(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_1.attachments) do
		local var_20_0 = ATTACHMENT.GetRef(iter_20_1.ref, arg_20_1.weapon)

		if ATTACHMENT.GetCategory(var_20_0) == arg_20_0 then
			return iter_20_0
		end
	end
end

function GUNSMITH.GetGunsmithMenu()
	return Engine.DDJFBBJAIG() and "Gunsmith" or "InGameGunsmith"
end

function GUNSMITH.OpenGunsmith(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = PlayerData.BFFBGAJGD(arg_22_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts
	local var_22_1 = var_22_0[arg_22_1].loadoutPerks[0]:get()
	local var_22_2 = var_22_0[arg_22_1].loadoutPerks[1]:get()
	local var_22_3 = var_22_0[arg_22_1].loadoutPerks[2]:get()

	if not PERK.IsPerkOverkill(var_22_1) and not PERK.IsPerkOverkill(var_22_2) then
		local var_22_4 = PERK.IsPerkOverkill(var_22_3)
	end

	local var_22_5 = {
		weaponSlot = arg_22_2,
		loadoutIndex = arg_22_1
	}
	local var_22_6 = var_22_0[arg_22_1].weaponSetups[arg_22_2]

	if CONDITIONS.IsWaveGameType then
		arg_22_3 = false
	end

	LUI.FlowManager.RequestAddMenu(GUNSMITH.GetGunsmithMenu(), true, arg_22_0, arg_22_3, var_22_5, true)
end

function GUNSMITH.GetLineOffsets(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = {
		{
			col = CSV.gunsmithSetup.cols.weapon,
			key = arg_23_0
		},
		{
			col = CSV.gunsmithSetup.cols.category,
			key = arg_23_2
		},
		{
			col = CSV.gunsmithSetup.cols.variantID,
			key = arg_23_1
		}
	}
	local var_23_1 = StringTable.BABCABFJEJ(CSV.gunsmithSetup.file, var_23_0)

	if not var_23_1 or var_23_1 == -1 then
		var_23_0[3] = {
			col = CSV.gunsmithSetup.cols.variantID,
			key = WEAPON.baseVariant
		}
		var_23_1 = StringTable.BABCABFJEJ(CSV.gunsmithSetup.file, var_23_0)
	end

	local var_23_2 = StringTable.CBGJCDIHCE(CSV.gunsmithSetup.file, var_23_1, CSV.gunsmithSetup.cols.lineOffsetX)
	local var_23_3 = StringTable.CBGJCDIHCE(CSV.gunsmithSetup.file, var_23_1, CSV.gunsmithSetup.cols.lineOffsetY)
	local var_23_4 = StringTable.CBGJCDIHCE(CSV.gunsmithSetup.file, var_23_1, CSV.gunsmithSetup.cols.lineOffsetZ)

	return var_23_2, var_23_3, var_23_4
end

function GUNSMITH.GetDefaultLineOffsets(arg_24_0)
	local var_24_0 = StringTable.BJJBBCJGEJ(CSV.attachmentCategories.file, CSV.attachmentCategories.cols.ref, arg_24_0)
	local var_24_1 = StringTable.CBGJCDIHCE(CSV.attachmentCategories.file, var_24_0, CSV.attachmentCategories.cols.defaultLineOffsetX)
	local var_24_2 = StringTable.CBGJCDIHCE(CSV.attachmentCategories.file, var_24_0, CSV.attachmentCategories.cols.defaultLineOffsetY)
	local var_24_3 = StringTable.CBGJCDIHCE(CSV.attachmentCategories.file, var_24_0, CSV.attachmentCategories.cols.defaultLineOffsetZ)
	local var_24_4

	var_24_4 = var_24_1 and #var_24_1 > 0 and tonumber(var_24_1) or 0

	local var_24_5

	var_24_5 = var_24_2 and #var_24_2 > 0 and tonumber(var_24_2) or 0

	local var_24_6

	var_24_6 = var_24_3 and #var_24_3 > 0 and tonumber(var_24_3) or 0

	return var_24_4, var_24_5, var_24_6
end

function GUNSMITH.GetFinalLineOffsets(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0, var_25_1, var_25_2 = GUNSMITH.GetDefaultLineOffsets(arg_25_2)
	local var_25_3, var_25_4, var_25_5 = GUNSMITH.GetLineOffsets(arg_25_0, arg_25_1, arg_25_2)

	var_25_0 = var_25_3 and #var_25_3 > 0 and tonumber(var_25_3) or var_25_0
	var_25_1 = var_25_4 and #var_25_4 > 0 and tonumber(var_25_4) or var_25_1
	var_25_2 = var_25_5 and #var_25_5 > 0 and tonumber(var_25_5) or var_25_2

	if Dvar.IBEGCHEFE("LPKPKPTMKR") then
		var_25_0 = Dvar.BJJCJHDBII("LMRQMOPNSM")
		var_25_1 = Dvar.BJJCJHDBII("OLSQQQTNON")
		var_25_2 = Dvar.BJJCJHDBII("MQPQRPNNKK")
	end

	return var_25_0, var_25_1, var_25_2
end

function GUNSMITH.GetOverrideLineBone(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = {
		{
			col = CSV.gunsmithSetup.cols.weapon,
			key = arg_26_0
		},
		{
			col = CSV.gunsmithSetup.cols.category,
			key = arg_26_2
		},
		{
			col = CSV.gunsmithSetup.cols.variantID,
			key = arg_26_1
		}
	}
	local var_26_1 = StringTable.CEBAGDAEJJ(CSV.gunsmithSetup.file, var_26_0, CSV.gunsmithSetup.cols.overrideLineBone)

	if not var_26_1 or #var_26_1 == 0 then
		var_26_0[3] = {
			col = CSV.gunsmithSetup.cols.variantID,
			key = WEAPON.baseVariant
		}
		var_26_1 = StringTable.CEBAGDAEJJ(CSV.gunsmithSetup.file, var_26_0, CSV.gunsmithSetup.cols.overrideLineBone)
	end

	return var_26_1
end

function GUNSMITH.GetLineBone(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = GUNSMITH.GetOverrideLineBone(arg_27_0, arg_27_1, arg_27_2)

	return var_27_0 and #var_27_0 > 0 and var_27_0 or StringTable.DIFCHIGDFB(CSV.attachmentCategories.file, CSV.attachmentCategories.cols.ref, arg_27_2, CSV.attachmentCategories.cols.bone)
end

function GUNSMITH.CanMakeModification(arg_28_0, arg_28_1)
	local var_28_0 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, arg_28_1)
	local var_28_1 = GUNSMITH.AreAnyModSlotsUnlocked(arg_28_0, var_28_0)

	return Dvar.IBEGCHEFE("NSPPTONLNP") and var_28_1
end

function GUNSMITH.CheckNewAttachmentAndCustomization(arg_29_0, arg_29_1)
	local var_29_0 = false
	local var_29_1 = false

	if arg_29_1 then
		local var_29_2 = arg_29_1.weapon:get()
		local var_29_3 = ATTACHMENT.GetEquippedOptic(arg_29_1)

		var_29_0 = Loot.DAFIICDBFJ(arg_29_0, var_29_2 .. GUNSMITH.typeNamePostFix.attachment)

		local var_29_4 = Loot.DAFIICDBFJ(arg_29_0, var_29_2 .. GUNSMITH.typeNamePostFix.camos)
		local var_29_5 = WEAPON.SupportsOptics(var_29_2) and GUNSMITH.CheckNewReticleForOptic(arg_29_0, var_29_3)
		local var_29_6 = WEAPON.SupportsCosmetics(var_29_2) and LOOT.IsCategoryNew(arg_29_0, LOOT.itemTypes.CHARM)
		local var_29_7 = WEAPON.GetMaxStickerSlotsForWeapon(var_29_2) > 0 and LOOT.IsCategoryNew(arg_29_0, LOOT.itemTypes.STICKER)

		var_29_1 = var_29_4 or var_29_5 or var_29_6 or var_29_7
	end

	return var_29_0, var_29_1
end

function GUNSMITH.CheckNewGunsmithByWeapon(arg_30_0, arg_30_1)
	local var_30_0, var_30_1 = GUNSMITH.CheckNewAttachmentAndCustomization(arg_30_0, arg_30_1)

	return var_30_0 or var_30_1
end

function GUNSMITH.CheckNewReticleForOptic(arg_31_0, arg_31_1)
	if ATTACHMENT.SupportsCustomReticles(arg_31_1) then
		local var_31_0 = ATTACHMENT.GetOpticRef(arg_31_1)
		local var_31_1 = ATTACHMENT.GetOpticReticleCategory(var_31_0)
		local var_31_2 = Loot.BCBAGDEJAJ(arg_31_0, LOOT.typeNames[LOOT.itemTypes.RETICLE])

		for iter_31_0 = 1, #var_31_2 do
			local var_31_3 = var_31_2[iter_31_0]
			local var_31_4 = LOOT.GetItemRef(LOOT.itemTypes.RETICLE, var_31_3)

			if var_31_1 == StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, var_31_4, CSV.reticles.cols.category) then
				return true
			end
		end
	end

	return false
end

function GUNSMITH.SetupAttachLine(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = GUNSMITH.GetLineBone(arg_32_1, arg_32_2, arg_32_3)

	if var_32_0 and #var_32_0 > 0 then
		if not arg_32_0._attachLine then
			arg_32_0._attachLine = LUI.UILine.new()

			arg_32_0._attachLine:setPriority(-5)
			arg_32_0._attachLine:SetAlpha(0)
			arg_32_0._attachLine:SetThickness(1 * _1080p)
			arg_32_0._attachLine:SetVertexPosition(LUI.UILine.START, 0, 0, 220 * _1080p, 32 * _1080p)
			arg_32_0:addElement(arg_32_0._attachLine)
		end

		local var_32_1 = ClientWeapon.CJABBBHHFC(FrontEndScene.ClientWeapons.Preview)

		arg_32_0._attachLine:SetVertexEntity(LUI.UILine.END, var_32_1)
		arg_32_0._attachLine:SetVertexEntityTag(LUI.UILine.END, var_32_0)
		arg_32_0._attachLine:AttachVertexToWorldModel(LUI.UILine.END)

		local var_32_2, var_32_3, var_32_4 = GUNSMITH.GetFinalLineOffsets(arg_32_1, arg_32_2, arg_32_3)

		arg_32_0._attachLine:SetVertexTagSpacePosition(LUI.UILine.END, var_32_2, var_32_3, var_32_4)
	elseif arg_32_0._attachLine then
		arg_32_0._attachLine:closeTree()

		arg_32_0._attachLine = nil
	end
end

function GUNSMITH.GetCustomModPath(arg_33_0, arg_33_1)
	return "blueprints." .. arg_33_0 .. ".weaponSetup." .. arg_33_1
end

function GUNSMITH.IsModSlotInUse(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = GUNSMITH.GetCustomModPath(arg_34_1, arg_34_2)
	local var_34_1 = Gunsmith.CCJIIFCJHA(arg_34_0, var_34_0 .. ".blueprintName")

	if var_34_1 ~= nil then
		return #var_34_1 > 0
	else
		return false
	end
end

function GUNSMITH.GetAllCustomMods(arg_35_0, arg_35_1, arg_35_2)
	arg_35_1 = arg_35_1 or {}
	arg_35_2 = arg_35_2 or {}

	for iter_35_0 = 0, StringTable.BFHCAIIDA(CSV.weapons.file) do
		local var_35_0 = CSV.ReadRow(CSV.weapons, iter_35_0)

		if not (arg_35_2.byWeapons and not arg_35_2.byWeapons[var_35_0.ref]) and tonumber(var_35_0.displayOrder) and tonumber(var_35_0.displayOrder) >= 0 then
			for iter_35_1 = 0, GUNSMITH.maxMods - 1 do
				if GUNSMITH.IsModSlotInUse(arg_35_0, var_35_0.ref, iter_35_1) then
					table.insert(arg_35_1, GUNSMITH.GetCustomMod(arg_35_0, var_35_0.ref, iter_35_1))
				end
			end
		end
	end

	return arg_35_1
end

function GUNSMITH.GetCustomModsForWeapon(arg_36_0, arg_36_1)
	local var_36_0 = {}

	for iter_36_0 = 0, GUNSMITH.maxMods - 1 do
		if GUNSMITH.IsModSlotInUse(arg_36_0, arg_36_1, iter_36_0) then
			table.insert(var_36_0, GUNSMITH.GetCustomMod(arg_36_0, arg_36_1, iter_36_0))
		end
	end

	return var_36_0
end

function GUNSMITH.GetCustomMod(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = GUNSMITH.GetCustomModPath(arg_37_1, arg_37_2)
	local var_37_1 = {
		blueprintName = Gunsmith.CCJIIFCJHA(arg_37_0, var_37_0 .. ".blueprintName"),
		weapon = Gunsmith.CCJIIFCJHA(arg_37_0, var_37_0 .. ".weapon"),
		lootID = tonumber(Gunsmith.CCJIIFCJHA(arg_37_0, var_37_0 .. ".lootItemID")),
		variantID = tonumber(Gunsmith.CCJIIFCJHA(arg_37_0, var_37_0 .. ".variantID")),
		camo = Gunsmith.CCJIIFCJHA(arg_37_0, var_37_0 .. ".camo"),
		cosmeticAttachment = Gunsmith.CCJIIFCJHA(arg_37_0, var_37_0 .. ".cosmeticAttachment"),
		reticle = Gunsmith.CCJIIFCJHA(arg_37_0, var_37_0 .. ".reticle")
	}
	local var_37_2 = var_37_0 .. ".attachmentSetup"

	var_37_1.attachments = {}

	for iter_37_0 = 0, WEAPON.maxAttachmentsPerWeapon - 1 do
		local var_37_3 = var_37_2 .. "." .. iter_37_0
		local var_37_4 = {
			ref = Gunsmith.CCJIIFCJHA(arg_37_0, var_37_3 .. ".attachment"),
			variantID = Gunsmith.CCJIIFCJHA(arg_37_0, var_37_3 .. ".variantID")
		}

		table.insert(var_37_1.attachments, var_37_4)
	end

	local var_37_5 = var_37_0 .. ".sticker"

	var_37_1.stickers = {}

	for iter_37_1 = 0, WEAPON.maxStickersPerWeapon - 1 do
		table.insert(var_37_1.stickers, Gunsmith.CCJIIFCJHA(arg_37_0, var_37_5 .. "." .. iter_37_1))
	end

	var_37_1.isCustom = true
	var_37_1.displayOrder = WEAPON.GetDisplayOrder(var_37_1.weapon)

	return var_37_1
end

function GUNSMITH.GetFirstFreeCustomModSlot(arg_38_0, arg_38_1, arg_38_2)
	for iter_38_0 = 0, GUNSMITH.maxMods - 1 do
		if GUNSMITH.IsModSlotUnlocked(arg_38_0, arg_38_2, iter_38_0) then
			local var_38_0 = GUNSMITH.GetCustomModPath(arg_38_1, iter_38_0)

			if #Gunsmith.CCJIIFCJHA(arg_38_0, var_38_0 .. ".blueprintName") == 0 then
				return iter_38_0
			end
		end
	end

	return false
end

function GUNSMITH.GetSlotUnlockRank(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = GUNSMITH.modSlotBaseID + arg_39_1 * 1000 + arg_39_2
	local var_39_1 = CSV.gunsmithProgressionTable:GetFile(arg_39_0)

	return StringTable.DIFCHIGDFB(var_39_1, CSV.gunsmithProgressionTable.cols.unlockID, var_39_0, CSV.gunsmithProgressionTable.cols.level)
end

function GUNSMITH.GetNextModUnlockRank(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = GUNSMITH.CountModSlotsUnlocked(arg_40_0, arg_40_2)

	if var_40_0 <= GUNSMITH.maxMods then
		return GUNSMITH.GetSlotUnlockRank(arg_40_1, arg_40_2, var_40_0)
	end

	return nil
end

function GUNSMITH.CountAvailableCustomModSlots(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = 0

	for iter_41_0 = 0, GUNSMITH.maxMods - 1 do
		if GUNSMITH.IsModSlotUnlocked(arg_41_0, arg_41_2, iter_41_0) then
			local var_41_1 = GUNSMITH.GetCustomModPath(arg_41_1, iter_41_0)

			if #Gunsmith.CCJIIFCJHA(arg_41_0, var_41_1 .. ".blueprintName") == 0 then
				var_41_0 = var_41_0 + 1
			end
		end
	end

	return var_41_0
end

function GUNSMITH.SaveAsCustomMod(arg_42_0, arg_42_1, arg_42_2)
	assert(arg_42_2)
	assert(type(arg_42_2) == "number")
	assert(arg_42_2 >= 0 and arg_42_2 <= GUNSMITH.maxMods - 1)

	local var_42_0 = GUNSMITH.GetCustomModPath(arg_42_1.weapon, arg_42_2)

	Gunsmith.CDEJBFGGAG(arg_42_0, var_42_0 .. ".blueprintName", arg_42_1.blueprintName)
	Gunsmith.CDEJBFGGAG(arg_42_0, var_42_0 .. ".weapon", arg_42_1.weapon)
	Gunsmith.CDEJBFGGAG(arg_42_0, var_42_0 .. ".variantID", arg_42_1.variantID)
	Gunsmith.CDEJBFGGAG(arg_42_0, var_42_0 .. ".camo", arg_42_1.camo)
	Gunsmith.CDEJBFGGAG(arg_42_0, var_42_0 .. ".cosmeticAttachment", arg_42_1.cosmeticAttachment)
	Gunsmith.CDEJBFGGAG(arg_42_0, var_42_0 .. ".reticle", arg_42_1.reticle)
	Gunsmith.CDEJBFGGAG(arg_42_0, var_42_0 .. ".lootItemID", arg_42_1.lootID)

	local var_42_1 = var_42_0 .. ".attachmentSetup"

	for iter_42_0 = 0, #arg_42_1.attachments - 1 do
		local var_42_2 = var_42_1 .. "." .. iter_42_0

		Gunsmith.CDEJBFGGAG(arg_42_0, var_42_2 .. ".attachment", arg_42_1.attachments[iter_42_0 + 1].ref)
		Gunsmith.CDEJBFGGAG(arg_42_0, var_42_2 .. ".variantID", arg_42_1.attachments[iter_42_0 + 1].variantID)
	end

	local var_42_3 = var_42_0 .. ".sticker"

	for iter_42_1 = 0, #arg_42_1.stickers - 1 do
		Gunsmith.CDEJBFGGAG(arg_42_0, var_42_3 .. "." .. iter_42_1, arg_42_1.stickers[iter_42_1 + 1])
	end

	Gunsmith.DAJAJGBAEF(arg_42_0)
end

function GUNSMITH.DeleteCustomMod(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = GUNSMITH.GetCustomModPath(arg_43_1, arg_43_2)
	local var_43_1 = Gunsmith.CCJIIFCJHA(arg_43_0, var_43_0 .. ".blueprintName")

	Gunsmith.CDEJBFGGAG(arg_43_0, var_43_0 .. ".blueprintName", "")
	Gunsmith.CDEJBFGGAG(arg_43_0, var_43_0 .. ".weapon", WEAPON.none)
	Gunsmith.CDEJBFGGAG(arg_43_0, var_43_0 .. ".variantID", WEAPON.baseVariant)
	Gunsmith.CDEJBFGGAG(arg_43_0, var_43_0 .. ".camo", WEAPON.CamoNoneValue)
	Gunsmith.CDEJBFGGAG(arg_43_0, var_43_0 .. ".cosmeticAttachment", WEAPON.CharmNoneValue)
	Gunsmith.CDEJBFGGAG(arg_43_0, var_43_0 .. ".reticle", WEAPON.ReticleNoneValue)
	Gunsmith.CDEJBFGGAG(arg_43_0, var_43_0 .. ".lootItemID", LOOT.emptyID)

	local var_43_2 = var_43_0 .. ".attachmentSetup"

	for iter_43_0 = 0, WEAPON.maxAttachmentsPerWeapon - 1 do
		local var_43_3 = var_43_2 .. "." .. iter_43_0

		Gunsmith.CDEJBFGGAG(arg_43_0, var_43_3 .. ".attachment", ATTACHMENT.none)
		Gunsmith.CDEJBFGGAG(arg_43_0, var_43_3 .. ".variantID", ATTACHMENT.baseVariant)
	end

	local var_43_4 = var_43_0 .. ".sticker"

	for iter_43_1 = 0, WEAPON.maxStickersPerWeapon - 1 do
		Gunsmith.CDEJBFGGAG(arg_43_0, var_43_4 .. "." .. iter_43_1, WEAPON.StickerNoneValue)
	end

	local var_43_5 = PlayerData.BFFBGAJGD(arg_43_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	for iter_43_2, iter_43_3 in ddlpairs(var_43_5) do
		for iter_43_4, iter_43_5 in ddlpairs(iter_43_3.weaponSetups) do
			if iter_43_5.blueprintName:get() == var_43_1 then
				iter_43_5.blueprintName:set("")
			end
		end
	end

	Gunsmith.DAJAJGBAEF(arg_43_0)
end

function GUNSMITH.GetUsedAttachmentIndices(arg_44_0, arg_44_1)
	local var_44_0 = GUNSMITH.GetAttachmentCategories(arg_44_0)
	local var_44_1 = {}

	for iter_44_0, iter_44_1 in ipairs(var_44_0) do
		if arg_44_1[iter_44_1] and #arg_44_1[iter_44_1] > 0 then
			local var_44_2 = ATTACHMENT.GetAttachmentCategoryButton(iter_44_1)

			if var_44_1[var_44_2] then
				DebugPrint("Tried to use button index " .. var_44_2 .. " for category " .. iter_44_1 .. " but it was already in use. Attempting to use first unused index.")

				for iter_44_2 = 1, GUNSMITH.maxCategories do
					if not var_44_1[iter_44_2] then
						return iter_44_2
					end
				end
			end

			assert(var_44_2)

			var_44_1[var_44_2] = iter_44_1
		end
	end

	return var_44_1
end

function GUNSMITH.GetCustomModName(arg_45_0)
	if #arg_45_0 > 0 then
		return string.sub(arg_45_0, GUNSMITH.modSlotChars + 1)
	else
		return ""
	end
end

function GUNSMITH.GetCustomModSlot(arg_46_0)
	return tonumber(string.sub(arg_46_0, 1, GUNSMITH.modSlotChars))
end

function GUNSMITH.AreCustomModsEqual(arg_47_0, arg_47_1)
	return arg_47_0.blueprintName == arg_47_1.blueprintName and arg_47_0.weapon == arg_47_1.weapon
end

function GUNSMITH.GenerateModName(arg_48_0, arg_48_1)
	return string.format("%03d", arg_48_1) .. arg_48_0
end

function GUNSMITH.GetWeaponPreviewCameraType(arg_49_0)
	local var_49_0 = WEAPON.GetWeaponClass(arg_49_0)
	local var_49_1 = GUNSMITH.WEAPON_PREVIEW_CAMERA_TYPE.NONE

	if var_49_0 == WEAPON.ARClass or var_49_0 == WEAPON.LMGClass or var_49_0 == WEAPON.sniperClass or var_49_0 == WEAPON.SMGClass or var_49_0 == WEAPON.SHOTGUNClass or var_49_0 == WEAPON.DMRClass then
		var_49_1 = GUNSMITH.WEAPON_PREVIEW_CAMERA_TYPE.BIG_GUN
	elseif var_49_0 == WEAPON.pistolClass then
		var_49_1 = GUNSMITH.WEAPON_PREVIEW_CAMERA_TYPE.SMALL_GUN
	end

	return var_49_1
end

function GUNSMITH.GetWeaponAvailableCategoryPreviewTable(arg_50_0)
	local var_50_0 = GUNSMITH.GetWeaponPreviewCameraType(arg_50_0)
	local var_50_1 = StringTable.BFHCAIIDA(CSV.attachmentCategories.file)
	local var_50_2 = {}
	local var_50_3 = false

	for iter_50_0 = 0, var_50_1 - 1 do
		local var_50_4

		if var_50_0 == GUNSMITH.WEAPON_PREVIEW_CAMERA_TYPE.BIG_GUN then
			var_50_4 = StringTable.CBGJCDIHCE(CSV.attachmentCategories.file, iter_50_0, CSV.attachmentCategories.cols.enableBigGunPreviewCamera)
		elseif var_50_0 == GUNSMITH.WEAPON_PREVIEW_CAMERA_TYPE.SMALL_GUN then
			var_50_4 = StringTable.CBGJCDIHCE(CSV.attachmentCategories.file, iter_50_0, CSV.attachmentCategories.cols.enableSmallGunPreviewCamera)
		end

		if tonumber(var_50_4) == 1 then
			local var_50_5 = StringTable.CBGJCDIHCE(CSV.attachmentCategories.file, iter_50_0, CSV.attachmentCategories.cols.ref)

			table.insert(var_50_2, var_50_5)
		end
	end

	return var_50_2
end

function GUNSMITH.IsAnyWeaponAvailableCategoryPreviewData(arg_51_0)
	local var_51_0 = GUNSMITH.GetWeaponPreviewCameraType(arg_51_0)
	local var_51_1 = StringTable.BFHCAIIDA(CSV.attachmentCategories.file)
	local var_51_2 = {}
	local var_51_3

	for iter_51_0 = 0, var_51_1 - 1 do
		local var_51_4

		if var_51_0 == GUNSMITH.WEAPON_PREVIEW_CAMERA_TYPE.BIG_GUN then
			var_51_4 = StringTable.CBGJCDIHCE(CSV.attachmentCategories.file, iter_51_0, CSV.attachmentCategories.cols.enableBigGunPreviewCamera)
		elseif var_51_0 == GUNSMITH.WEAPON_PREVIEW_CAMERA_TYPE.SMALL_GUN then
			var_51_4 = StringTable.CBGJCDIHCE(CSV.attachmentCategories.file, iter_51_0, CSV.attachmentCategories.cols.enableSmallGunPreviewCamera)
		end

		if tonumber(var_51_4) == 1 then
			return true
		end
	end

	return false
end

function GUNSMITH.GetModSlotLootID(arg_52_0, arg_52_1)
	return GUNSMITH.modSlotBaseID + arg_52_0 * 1000 + arg_52_1
end

function GUNSMITH.IsModSlotUnlocked(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = GUNSMITH.GetModSlotLootID(arg_53_1, arg_53_2)

	return LOOT.IsUnlockedWithID(arg_53_0, var_53_0)
end

function GUNSMITH.AreAnyModSlotsUnlocked(arg_54_0, arg_54_1)
	for iter_54_0 = 0, GUNSMITH.maxMods - 1 do
		if GUNSMITH.IsModSlotUnlocked(arg_54_0, arg_54_1, iter_54_0) then
			return true
		end
	end

	return false
end

function GUNSMITH.CountModSlotsUnlocked(arg_55_0, arg_55_1)
	local var_55_0 = 0

	for iter_55_0 = 0, GUNSMITH.maxMods - 1 do
		if GUNSMITH.IsModSlotUnlocked(arg_55_0, arg_55_1, iter_55_0) then
			var_55_0 = var_55_0 + 1
		end
	end

	return var_55_0
end

function GUNSMITH.GetGunsmithChallengeCamoCategory(arg_56_0, arg_56_1)
	local var_56_0 = Challenge.GetLootID(arg_56_0, arg_56_1)

	if var_56_0 and #var_56_0 > 0 then
		local var_56_1 = split(var_56_0, "|")
		local var_56_2 = tonumber(var_56_1[1])

		if var_56_2 and var_56_2 >= LOOT.CamoIDsMin and var_56_2 <= LOOT.CamoIDsMax then
			local var_56_3 = WEAPON.GetCamoRef(var_56_2)
			local var_56_4 = "camo_"
			local var_56_5, var_56_6 = string.find(var_56_3, var_56_4)
			local var_56_7 = string.sub(var_56_3, var_56_6 + 1, #var_56_3)
			local var_56_8, var_56_9 = string.find(var_56_7, "%a")
			local var_56_10 = string.sub(var_56_7, 1, var_56_8 - 1)
			local var_56_11 = tonumber(var_56_10)

			return StringTable.DIFCHIGDFB(CSV.camoCategoryTable.file, CSV.camoCategoryTable.cols.index, var_56_11, CSV.camoCategoryTable.cols.ref)
		end
	end

	return nil
end

function GUNSMITH.GetGunsmithChallengeRelatedWeaponID(arg_57_0, arg_57_1)
	local var_57_0 = Challenge.GetLootID(arg_57_0, arg_57_1)

	if var_57_0 and #var_57_0 > 0 then
		local var_57_1 = split(var_57_0, "|")
		local var_57_2 = tonumber(var_57_1[1])

		if var_57_2 and var_57_2 >= LOOT.CamoIDsMin and var_57_2 <= LOOT.CamoIDsMax then
			return LOOT.GetLootItemRelatedWeapon(var_57_2, LOOT.itemTypes.CAMO)
		end
	end

	return nil
end
