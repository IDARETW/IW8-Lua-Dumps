Cac = Cac or {}
SUPER = SUPER or {}
Cac.superNoneValue = "none"
Cac.rigNoneValue = "archetype_assault"
Cac.traitNoneValue = "specialty_null"
Cac.esportsDefaultHeads = {
	archetype_sniper = 27,
	archetype_heavy = 12,
	archetype_engineer = 46,
	archetype_assassin = 57,
	archetype_assault = 4,
	archetype_scout = 28
}
Cac.esportsDefaultBodies = {
	archetype_sniper = 31,
	archetype_heavy = 5,
	archetype_engineer = 39,
	archetype_assassin = 28,
	archetype_assault = 18,
	archetype_scout = 1
}
Cac.noneSuper = {
	archetype_sniper = "super_penetrationrailgun",
	archetype_heavy = "super_steeldragon",
	archetype_engineer = "super_blackholegun",
	archetype_assassin = "super_atomizer",
	archetype_assault = "super_claw",
	archetype_scout = "super_armmgs"
}
Cac.CustomizationTypes = {
	HEAD = "head",
	BODY = "body"
}
Cac.RigLootTypes = {
	Head = "rig_head",
	Body = "rig_body"
}
Cac.RigEmoteTypes = {
	Taunt = "taunt"
}
Cac.RigArchetypes = {
	Human = "allRigsButC6"
}
SUPER.RechargeSpeed = {
	FAST = 3,
	SLOW = 1,
	MEDIUM = 2,
	NONE = 0
}
Cac.rigVariantCount = 1
Cac.noDraftedRigIndex = -1
Cac.noDraftedSuperIndex = -1
Cac.noDraftedTraitIndex = -1
Cac.noDraftedWeaponIndex = -1

function Cac.GetRigIcon(arg_1_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_1_0, CSV.battleRigs.cols.icon)
end

function Cac.GetRigManufacturersImage(arg_2_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_2_0, CSV.battleRigs.cols.manufacturersImage)
end

function Cac.GetRigHeadshot(arg_3_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_3_0, CSV.battleRigs.cols.headshot)
end

function Cac.GetRigPortrait(arg_4_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_4_0, CSV.battleRigs.cols.portrait)
end

function Cac.GetSuperFullImage(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_5_0, CSV.supers.cols.uiImageLarge)
end

function Cac.GetSuperManufacturersImage(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_6_0, CSV.supers.cols.manufacturersImage)
end

function Cac.GetSuperDesc(arg_7_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_7_0, CSV.supers.cols.uiDesc))
end

function Cac.GetSuperRig(arg_8_0)
	return StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_8_0, CSV.supers.cols.rigRef)
end

function Cac.GetSuperIndex(arg_9_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_9_0, CSV.supers.cols.index))
end

function Cac.GetRigName(arg_10_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_10_0, CSV.battleRigs.cols.name))
end

function Cac.GetRigDesc(arg_11_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_11_0, CSV.battleRigs.cols.desc))
end

function Cac.GetRigBaseBodyModel(arg_12_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_12_0, CSV.battleRigs.cols.baseBodyModel))
end

function Cac.GetRigBaseHeadModel(arg_13_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_13_0, CSV.battleRigs.cols.baseHeadModel))
end

function Cac.GetRigFrontEndIdleAnim(arg_14_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_14_0, CSV.battleRigs.cols.defaultFrontEndAnim)
end

function Cac.GetRigFrontEndProfileAnim(arg_15_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_15_0, CSV.battleRigs.cols.frontEndProfileAnim)
end

function Cac.GetRigFrontEndCustomizationIdleAnim(arg_16_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_16_0, CSV.battleRigs.cols.customizationIdleAnim)
end

function Cac.GetRigFrontEndCustomizationArmsDownIdleAnim(arg_17_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_17_0, CSV.battleRigs.cols.customizationArmsDownIdle)
end

function Cac.GetCustomizationCSV(arg_18_0)
	if arg_18_0 == Cac.CustomizationTypes.HEAD then
		return CSV.heads
	elseif arg_18_0 == Cac.CustomizationTypes.BODY then
		return CSV.bodies
	end

	error("Unexpected customization type")
end

function Cac.GetRigFrontEndLobbyMemberAnim(arg_19_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_19_0, CSV.battleRigs.cols.lobbyMemberAnim)
end

function Cac.GetRigFrontEndTauntTransitionAnims(arg_20_0)
	local var_20_0 = StringTable.BJJBBCJGEJ(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_20_0)
	local var_20_1 = StringTable.CBGJCDIHCE(CSV.battleRigs.file, var_20_0, CSV.battleRigs.cols.transitionToTauntAnim)
	local var_20_2 = StringTable.CBGJCDIHCE(CSV.battleRigs.file, var_20_0, CSV.battleRigs.cols.transitionFromTauntAnim)

	return var_20_1, var_20_2
end

function Cac.GetRigOffset(arg_21_0)
	local var_21_0 = StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.index, arg_21_0, CSV.battleRigs.cols.modelOffset)

	return LUI.Split(var_21_0, " ")
end

function Cac.GetRigCapacityBink(arg_22_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_22_0, CSV.battleRigs.cols.capacityBink)
end

function Cac.SetPlayedCapacityBink(arg_23_0, arg_23_1)
	local var_23_0 = Cac.GetRigIndex(arg_23_0)

	PlayerData.BFFBGAJGD(arg_23_1, CoD.StatsGroup.Ranked).hasSeenCapacityVideo[var_23_0]:set(true)
end

function Cac.HasPlayedCapacityBink(arg_24_0, arg_24_1)
	local var_24_0 = Cac.GetRigIndex(arg_24_0)

	return PlayerData.BFFBGAJGD(arg_24_1, CoD.StatsGroup.Ranked).hasSeenCapacityVideo[var_24_0]:get()
end

function Cac.PlayFirstRigCapacityBink(arg_25_0, arg_25_1)
	if CONDITIONS.IsPublicMatch() and not Cac.HasPlayedCapacityBink(arg_25_0, arg_25_1) and Engine.DDJFBBJAIG() then
		Cac.PlayRigCapacityBink(arg_25_0, true, arg_25_1)
		Cac.SetPlayedCapacityBink(arg_25_0, arg_25_1)
	end
end

function Cac.PlayRigCapacityBink(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = Cac.GetRigCapacityBink(arg_26_0)

	LUI.FlowManager.RequestPopupMenu(nil, "MPFullScreenVideoOverlay", false, arg_26_2, false, {
		videoRef = var_26_0,
		allowSkip = arg_26_1
	})
end

function Cac.IsRigInUse(arg_27_0)
	return arg_27_0 ~= "" and arg_27_0 ~= "none"
end

function Cac.GetRigTableIndex(arg_28_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_28_0, CSV.battleRigs.cols.index))
end

function Cac.GetRigVariantName()
	return "Master"
end

function Cac.GetRigVariantImage()
	return "weapon_variable_zoom"
end

function Cac.GetRigVariantRef()
	return "variant_master"
end

function Cac.GetRigTrait(arg_32_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_32_0, CSV.battleRigs.cols.trait))
end

function Cac.GetTraitRig(arg_33_0)
	return StringTable.DIFCHIGDFB(CSV.menuRigPerks.file, CSV.menuRigPerks.cols.ref, arg_33_0, CSV.menuRigPerks.cols.rig)
end

function Cac.GetRigAffinity(arg_34_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_34_0, CSV.battleRigs.cols.weaponAffinity)
end

function Cac.GetRigMovementSpeed(arg_35_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_35_0, CSV.battleRigs.cols.movementSpeed)
end

function Cac.GetRigLiftType(arg_36_0)
	return StringTable.DIFCHIGDFB(CSV.battleRigs.file, CSV.battleRigs.cols.ref, arg_36_0, CSV.battleRigs.cols.liftType)
end

function Cac.GetPreferencesForRig(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0:GetCountValue(arg_37_2)

	for iter_37_0 = 0, var_37_0 - 1 do
		local var_37_1 = arg_37_0[iter_37_0]

		if var_37_1.archetype:GetValue(arg_37_2) == arg_37_1 then
			return var_37_1
		end
	end

	assert(false, "Cac.GetPreferencesForRig rigRef not found in playerdata rig preferences.")
end

function Cac.ApplyRigPreferences(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	local var_38_0 = arg_38_1.archetypePerk:GetValue(arg_38_3)
	local var_38_1 = arg_38_1.archetypeSuper:GetValue(arg_38_3)

	arg_38_2.archetypePerk.ref:SetValue(arg_38_3, var_38_0)
	arg_38_2.archetypeSuper.ref:SetValue(arg_38_3, var_38_1)
end

function Cac.ApplyRigCustomizations(arg_39_0, arg_39_1, arg_39_2)
	arg_39_1.head.ref:SetValue(arg_39_2, arg_39_0.head.ref:GetValue(arg_39_2))
	arg_39_1.body.ref:SetValue(arg_39_2, arg_39_0.body.ref:GetValue(arg_39_2))
end

function Cac.IsSuperInUse(arg_40_0)
	return arg_40_0 ~= Cac.superNoneValue and arg_40_0 ~= ""
end

function SUPER.IsSuperUnlocked(arg_41_0, arg_41_1)
	return Unlocks.BFCEGDJIEI(arg_41_1, "super", arg_41_0)
end

function Cac.IsTraitUnlocked(arg_42_0, arg_42_1)
	return Unlocks.BFCEGDJIEI(arg_42_1, "trait", arg_42_0)
end

function Cac.GetItemRigPackageUnlockRank(arg_43_0, arg_43_1)
	local var_43_0 = StringTable.DIFCHIGDFB(arg_43_1.file, arg_43_1.cols.ref, arg_43_0, arg_43_1.cols.rigPackage)
	local var_43_1 = LUI.Split(var_43_0, ":")[2]

	assert(var_43_1)

	return Cac.GetRigPackageUnlockRank(var_43_1)
end

function Cac.GetRigPackageUnlockRank(arg_44_0)
	local var_44_0 = StringTable.DIFCHIGDFB(CSV.rigPackageUnlockTable.file, CSV.rigPackageUnlockTable.cols.ref, arg_44_0, CSV.rigPackageUnlockTable.cols.unlockRank)

	return (Rank.GetRankFromRankDisplay(var_44_0))
end

function Cac.RequestAndSetRig(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.ref, arg_45_2, CSV.bodies.cols.model)
	local var_45_1 = StringTable.DIFCHIGDFB(CSV.heads.file, CSV.heads.cols.ref, arg_45_1, CSV.heads.cols.model)

	if var_45_0 and var_45_0 ~= "" then
		FrontEndScene.RequestBodyModels({
			var_45_0
		})
	end

	if var_45_1 and var_45_1 ~= "" then
		FrontEndScene.RequestHeadModels({
			var_45_1
		})
	end

	FrontEndScene.SetCharacterModels(FrontEndScene.ClientCharacters.Customization, var_45_0, var_45_1)
	FrontEndScene.SetCustomizationWeaponForSuper(FrontEndScene.ClientCharacters.Customization, arg_45_3, arg_45_0)
	FrontEndScene.PlayCustomizationIdle(FrontEndScene.ClientCharacters.Customization, arg_45_0)

	local var_45_2 = Cac.GetRigOffset(Cac.GetRigTableIndex(arg_45_0))

	ClientCharacter.GHFDEGFFJ(FrontEndScene.ClientCharacters.Customization, tonumber(var_45_2[1]), tonumber(var_45_2[2]), tonumber(var_45_2[3]))
end

function Cac.GetRigPackageTrait(arg_46_0)
	arg_46_0 = "rigPackage:" .. arg_46_0

	return (StringTable.DIFCHIGDFB(CSV.rigTraitUnlockTable.file, CSV.rigTraitUnlockTable.cols.rigPackage, arg_46_0, CSV.rigTraitUnlockTable.cols.ref))
end

function Cac.GetRigPackageSuper(arg_47_0)
	arg_47_0 = "rigPackage:" .. arg_47_0

	return (StringTable.DIFCHIGDFB(CSV.rigSuperUnlockTable.file, CSV.rigSuperUnlockTable.cols.rigPackage, arg_47_0, CSV.rigSuperUnlockTable.cols.ref))
end

function Cac.GetRigPackageRig(arg_48_0)
	arg_48_0 = "rigPackage:" .. arg_48_0

	return (StringTable.DIFCHIGDFB(CSV.rigUnlockTable.file, CSV.rigUnlockTable.cols.rigPackage, arg_48_0, CSV.rigUnlockTable.cols.ref))
end

function Cac.GetRigPackageUnlocks(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0 = {}
	local var_49_1 = Cac.GetRigPackageTrait(arg_49_1)

	if var_49_1 ~= "" then
		local var_49_2 = {
			type = "trait",
			item = var_49_1,
			level = arg_49_2
		}

		table.insert(var_49_0, var_49_2)

		if arg_49_3 == true then
			Cac.SetNewUnlock(arg_49_0, "trait", var_49_1)
		end
	end

	local var_49_3 = Cac.GetRigPackageRig(arg_49_1)

	if var_49_3 ~= "" then
		local var_49_4 = {
			type = "rig",
			item = var_49_3,
			level = arg_49_2
		}

		table.insert(var_49_0, var_49_4)

		if arg_49_3 == true then
			Cac.SetNewUnlock(arg_49_0, "rig", var_49_3)
		end
	end

	local var_49_5 = Cac.GetRigPackageSuper(arg_49_1)

	if var_49_5 ~= "" then
		local var_49_6 = {
			type = "super",
			item = var_49_5,
			level = arg_49_2
		}

		table.insert(var_49_0, var_49_6)

		if arg_49_3 == true then
			Cac.SetNewUnlock(arg_49_0, "super", var_49_5)
		end
	end

	return var_49_0
end

function Cac.SetNewUnlock(arg_50_0, arg_50_1, arg_50_2)
	return
end

function Cac.GetRigSuperStreamer()
	local var_51_0 = {}
	local var_51_1 = StringTable.BFHCAIIDA(CSV.supers.file)

	for iter_51_0 = 0, var_51_1 - 1 do
		local var_51_2 = StringTable.CBGJCDIHCE(CSV.supers.file, iter_51_0, CSV.supers.cols.uiImageLarge)

		if #var_51_2 > 0 then
			local var_51_3 = RegisterMaterial(var_51_2)

			table.insert(var_51_0, var_51_3)
		end
	end

	local var_51_4 = LUI.UIElement.new()

	var_51_4.id = "RigSuperStreamer"

	var_51_4:SetupImageTableStreamer(var_51_0)

	return var_51_4
end

function Cac.GetAltTauntAnim(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = StringTable.DIFCHIGDFB(CSV.taunts.file, CSV.taunts.cols.index, arg_52_0, CSV.taunts.cols.altAnimRigRefs)

	if var_52_0 and #var_52_0 > 0 and string.find(var_52_0, arg_52_1) then
		local var_52_1 = CSV.taunts.cols.altAnim

		if arg_52_2 then
			var_52_1 = CSV.taunts.cols.altPreviewAnim
		end

		local var_52_2 = StringTable.DIFCHIGDFB(CSV.taunts.file, CSV.taunts.cols.index, arg_52_0, var_52_1)

		if var_52_2 and #var_52_2 > 0 then
			return var_52_2
		end
	end

	return nil
end

function Cac.HasRigItemBeenDrafted(arg_53_0, arg_53_1)
	local var_53_0 = Cac.GetRigTableIndex(arg_53_1)

	return not Engine.EBCDCFCBE(LoadoutDrafting.CDDHABCDHI(arg_53_0, var_53_0))
end

function Cac.GetSuperStats(arg_54_0)
	local var_54_0 = {}

	for iter_54_0 = 0, StringTable.BFHCAIIDA(CSV.supers.file) do
		local var_54_1 = CSV.ReadRow(CSV.supers, iter_54_0)

		if tonumber(var_54_1.index) ~= nil and tonumber(var_54_1.index) > 0 then
			local var_54_2 = PlayerData.BFFBGAJGD(arg_54_0, CoD.StatsGroup.Ranked).superStats[var_54_1.ref]
			local var_54_3 = {
				ref = var_54_1.ref,
				name = Engine.CBBHFCGDIC(var_54_1.uiName),
				image = var_54_1.uiImageSmall,
				uses = var_54_2.uses:get(),
				kills = var_54_2.kills:get()
			}
			local var_54_4 = var_54_1.rigRef

			if var_54_0[var_54_4] == nil then
				var_54_0[var_54_4] = {}
			end

			table.insert(var_54_0[var_54_4], var_54_3)
		end
	end

	for iter_54_1, iter_54_2 in pairs(var_54_0) do
		table.sort(iter_54_2, function(arg_55_0, arg_55_1)
			return arg_55_0.kills > arg_55_1.kills
		end)
	end

	return var_54_0
end

function Cac.GetRigStats(arg_56_0)
	local var_56_0 = {}
	local var_56_1 = Cac.GetSuperStats(arg_56_0)

	for iter_56_0 = 0, StringTable.BFHCAIIDA(CSV.battleRigs.file) do
		local var_56_2 = CSV.ReadRow(CSV.battleRigs, iter_56_0)

		if var_56_2 ~= nil and var_56_2.ref ~= "" then
			local var_56_3 = PlayerData.BFFBGAJGD(arg_56_0, CoD.StatsGroup.Ranked).archetypeStats[var_56_2.ref]
			local var_56_4 = {
				ref = var_56_2.ref,
				name = Engine.CBBHFCGDIC(var_56_2.name),
				image = var_56_2.headshot,
				kills = var_56_3.kills:get(),
				deaths = var_56_3.deaths:get(),
				superStats = var_56_1[var_56_2.ref]
			}

			var_56_4.kdr = var_56_4.kills / (var_56_4.deaths ~= 0 and var_56_4.deaths or 1)

			table.insert(var_56_0, var_56_4)
		end
	end

	table.sort(var_56_0, function(arg_57_0, arg_57_1)
		return arg_57_0.kills > arg_57_1.kills
	end)

	return var_56_0
end

local function var_0_0(arg_58_0, arg_58_1)
	local var_58_0 = Cac.GetCustomizationCSV(arg_58_1)

	for iter_58_0 = 0, StringTable.BFHCAIIDA(var_58_0.file) do
		if not (StringTable.CBGJCDIHCE(var_58_0.file, iter_58_0, var_58_0.cols.releaseKillswitch) == "1") then
			local var_58_1 = StringTable.CBGJCDIHCE(var_58_0.file, iter_58_0, var_58_0.cols.index)
			local var_58_2 = StringTable.CBGJCDIHCE(var_58_0.file, iter_58_0, var_58_0.cols.rigRef)
			local var_58_3 = var_58_2 == arg_58_0
			local var_58_4 = var_58_2 == "allRigs"
			local var_58_5 = var_58_2 ~= "archetype_scout" and var_58_2 == "allRigsButC6"

			if (var_58_3 or var_58_4 or var_58_5) and StringTable.CBGJCDIHCE(var_58_0.file, iter_58_0, var_58_0.cols.uiCategory) == "default" then
				return StringTable.CBGJCDIHCE(var_58_0.file, iter_58_0, var_58_0.cols.model)
			end
		end
	end
end

SUPER.ProMode = {
	ENABLED = 1,
	DISABLED = 0
}
SUPER.Slot = {
	LEFT = 1,
	RIGHT = 2
}

function SUPER.GetTutorialVideo(arg_59_0)
	return tostring(StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_59_0, CSV.supers.cols.tutorialVideo))
end

function SUPER.GetAlternateSuper(arg_60_0)
	return StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_60_0, CSV.supers.cols.alt)
end

function SUPER.GetName(arg_61_0)
	return StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_61_0, CSV.supers.cols.uiName)
end

function SUPER.GetDesc(arg_62_0)
	return StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_62_0, CSV.supers.cols.uiDesc)
end

function SUPER.GetImage(arg_63_0)
	return StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_63_0, CSV.supers.cols.uiImageSmall)
end

function SUPER.GetProgressionImage(arg_64_0)
	return StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_64_0, CSV.supers.cols.progressionImage)
end

function SUPER.GetRechargeLabel(arg_65_0)
	local var_65_0 = tonumber(StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_65_0, CSV.supers.cols.rechargeSpeed))

	if var_65_0 == SUPER.RechargeSpeed.FAST then
		return Engine.CBBHFCGDIC("LUA_MENU/RECHARGE_FAST")
	elseif var_65_0 == SUPER.RechargeSpeed.MEDIUM then
		return Engine.CBBHFCGDIC("LUA_MENU/RECHARGE_MEDIUM")
	elseif var_65_0 == SUPER.RechargeSpeed.SLOW then
		return Engine.CBBHFCGDIC("LUA_MENU/RECHARGE_SLOW")
	else
		return Engine.CBBHFCGDIC("MENU/NONE")
	end
end

function SUPER.GetRechargeColor(arg_66_0)
	local var_66_0 = tonumber(StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_66_0, CSV.supers.cols.rechargeSpeed))

	if var_66_0 == SUPER.RechargeSpeed.FAST then
		return SWATCHES.Recharge.RechargeFast
	elseif var_66_0 == SUPER.RechargeSpeed.MEDIUM then
		return SWATCHES.Recharge.RechargeMedium
	elseif var_66_0 == SUPER.RechargeSpeed.SLOW then
		return SWATCHES.Recharge.RechargeSlow
	else
		return SWATCHES.genericMenu.mainTitle
	end
end

function SUPER.GetAllRefs()
	local var_67_0 = -1
	local var_67_1 = {}
	local var_67_2 = {}

	for iter_67_0 = 0, StringTable.BFHCAIIDA(CSV.supers.file) do
		local var_67_3 = CSV.ReadRow(CSV.supers, iter_67_0)

		if #var_67_3.ref > 0 and tonumber(var_67_3.menuPriority) ~= var_67_0 and (not CONDITIONS.InGame() or not MatchRules.DFIIFBCIH(var_67_3.ref)) then
			table.insert(var_67_1, var_67_3)
		end
	end

	table.sort(var_67_1, function(arg_68_0, arg_68_1)
		return tonumber(arg_68_0.menuPriority) < tonumber(arg_68_1.menuPriority)
	end)

	for iter_67_1, iter_67_2 in ipairs(var_67_1) do
		table.insert(var_67_2, iter_67_2.ref)
	end

	return var_67_2
end

function SUPER.GetStatsTable(arg_69_0)
	local var_69_0 = {}

	for iter_69_0 = 0, StringTable.BFHCAIIDA(CSV.supers.file) do
		local var_69_1 = CSV.ReadRow(CSV.supers, iter_69_0)

		if var_69_1 ~= nil and tonumber(var_69_1.menuPriority) ~= nil and tonumber(var_69_1.menuPriority) > 0 then
			local var_69_2 = PlayerData.BFFBGAJGD(arg_69_0, CoD.StatsGroup.Ranked).playerStats.superStats[var_69_1.ref]

			if var_69_2 ~= nil then
				local var_69_3 = {
					ref = var_69_1.ref,
					name = var_69_1.uiName,
					image = var_69_1.uiImageLarge,
					uses = var_69_2.uses:get(),
					tracksKills = tonumber(var_69_1.tracksKills) == 1,
					kills = var_69_2.kills:get(),
					misc1name = var_69_1.misc1Text,
					misc1data = var_69_2.misc1:get()
				}

				table.insert(var_69_0, var_69_3)
			end
		end
	end

	return var_69_0
end
