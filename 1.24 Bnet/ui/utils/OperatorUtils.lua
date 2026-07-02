OPERATOR = {}
OPERATOR.SuperFaction = {
	EAST = 1,
	WEST = 0
}
OPERATOR.Gender = {
	MALE = 0,
	FEMALE = 1
}
OPERATOR.DEFAULT_FACTION_INDEX = 0
OPERATOR.WestDefaultLaunchRef = "murphy_western"
OPERATOR.EastDefaultLaunchRef = "minotavr_eastern"
OPERATOR.DefaultWestBody = "body_mp_western_fireteam_west_ar_1_1_lod1"
OPERATOR.DefaultWestHead = "head_mp_western_fireteam_west_ar_1_1"
OPERATOR.DefaultEastBody = "body_mp_eastern_fireteam_east_ar_lod1"
OPERATOR.DefaultEastHead = "head_mp_eastern_fireteam_east_ar_1"
OPERATOR.GlobalExecutionRef = "universal_ref"
OPERATOR.CachedSkinRefs = {}
OPERATOR.CachedExecutionRefs = {}
OPERATOR.CachedTauntRefs = {}
OPERATOR.UnlockedSkinRefs = {}

function OPERATOR.GetSkinsCSVFile(arg_1_0)
	if OPERATOR.IsDefaultOperator(arg_1_0) then
		return CSV.defaultOperatorSkins
	else
		return CSV.operatorSkins
	end
end

function OPERATOR.IsDefaultOperator(arg_2_0)
	if arg_2_0 then
		return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_2_0, CSV.operators.cols.factionRef) == "DEFAULT"
	end

	return true
end

function OPERATOR.DoesSkinHaveOverrides(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0 == "default_western" then
		return arg_3_2 == OPERATOR.DefaultWestHead and arg_3_1 == OPERATOR.DefaultWestBody
	else
		return arg_3_2 == OPERATOR.DefaultEastHead and arg_3_1 == OPERATOR.DefaultEastBody
	end

	return false
end

function OPERATOR.HasWeaponClassOverridesForSkin(arg_4_0, arg_4_1, arg_4_2)
	if OPERATOR.IsDefaultOperator(arg_4_0) then
		return OPERATOR.DoesSkinHaveOverrides(arg_4_0, arg_4_1, arg_4_2)
	end

	return false
end

function OPERATOR.IsLaunchOperator(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_5_0, CSV.operators.cols.isLaunchOperator) == "1"
end

function OPERATOR.GetDefaultLaunchOperatorForSuperfaction(arg_6_0)
	return arg_6_0 == OPERATOR.SuperFaction.WEST and OPERATOR.WestDefaultLaunchRef or OPERATOR.EastDefaultLaunchRef
end

function OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_7_0)
	local var_7_0 = WATCH.GetEquippedWatch(arg_7_0)

	if var_7_0 == WATCH.WatchNoneValue then
		return WATCH.WatchNoneValue
	end

	local var_7_1 = WATCH.GetFullModelName(var_7_0, true)

	if var_7_1 and #var_7_1 > 0 then
		return var_7_1
	end

	return WATCH.WatchNoneValue
end

function OPERATOR.IsStowedWeaponClassAllowed(arg_8_0)
	return arg_8_0 ~= WEAPON.SMGClass and arg_8_0 ~= WEAPON.ARClass and arg_8_0 ~= WEAPON.MELEEClass2
end

function OPERATOR.IsStowedWeaponAllowed(arg_9_0)
	return arg_9_0 ~= WEAPON.Knife
end

function OPERATOR.IsStowedWeaponAllowedInPreviewScreens(arg_10_0)
	return arg_10_0 ~= WEAPON.FrontEndRiotShield and arg_10_0 ~= WEAPON.RiotShield and arg_10_0 ~= WEAPON.FrontEndRiotShield_V2 and arg_10_0 ~= WEAPON.RiotShield_V2 and arg_10_0 ~= WEAPON.FrontEndRiotShield_V4 and arg_10_0 ~= WEAPON.RiotShield_V4
end

function OPERATOR.ShouldStripAttachments(arg_11_0)
	return arg_11_0 == WEAPON.pistolClass
end

function OPERATOR.CheckForAccessoryOverride(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.model, arg_12_0, CSV.bodies.cols.hideWatch)

	if #var_12_0 == 0 then
		local var_12_1 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.bodyModelHighRes, arg_12_2, CSV.operatorSkins.cols.bodyModel)

		if #var_12_1 > 0 then
			var_12_0 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.model, var_12_1, CSV.bodies.cols.hideWatch)
		end
	end

	if #var_12_0 > 0 and tonumber(var_12_0) == 1 then
		return WATCH.WatchNoneValue
	end

	local var_12_2 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.model, arg_12_0, CSV.bodies.cols.watchStyle)

	if var_12_2 and #var_12_2 > 0 then
		if var_12_2 == "hide" then
			return WATCH.WatchNoneValue
		end

		return WATCH.GetOverride(arg_12_1, var_12_2)
	end

	return arg_12_1
end

function OPERATOR.ValidateAccessoryModel(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1

	if not LUI.FindLast(arg_13_1, "_lod1") then
		arg_13_1 = arg_13_1 .. "_lod1"
	end

	arg_13_0 = arg_13_0 or WATCH.WatchNoneValue

	if arg_13_0 ~= WATCH.WatchNoneValue then
		arg_13_0 = OPERATOR.CheckForAccessoryOverride(arg_13_1, arg_13_0, var_13_0)
	end

	return arg_13_0
end

function OPERATOR.TryOverrideStowedWeapon(arg_14_0, arg_14_1)
	if arg_14_1 == WEAPON.NoneValue then
		return WEAPON.NoneValue
	end

	local var_14_0 = WEAPON.GetWeaponDetailsFromModel(arg_14_1)

	if not OPERATOR.IsStowedWeaponClassAllowed(var_14_0.weaponClass) then
		return WEAPON.NoneValue
	end

	if not OPERATOR.IsStowedWeaponAllowed(var_14_0.weaponAsset) then
		return WEAPON.NoneValue
	end

	return arg_14_1
end

function OPERATOR.InternalSetupClientCharacter(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5, arg_15_6)
	arg_15_5 = arg_15_5 and OPERATOR.TryOverrideStowedWeapon(arg_15_0, arg_15_5)

	ClientCharacter.DFHIIAGHDG(arg_15_0, arg_15_1, arg_15_2)

	if arg_15_3 and #arg_15_3 > 0 then
		ClientCharacter.CAECDIHFCF(arg_15_0, arg_15_3)
	end

	if arg_15_4 then
		ClientCharacter.FHCIHJDAB(arg_15_0, arg_15_4, arg_15_5, arg_15_6)
	end
end

function OPERATOR.InternalShowCharacterAndWeaponWhenLoaded(arg_16_0, arg_16_1, arg_16_2)
	arg_16_2 = arg_16_2 or {}

	local var_16_0

	local function var_16_1()
		FrontEndScene.SetCharacterVisible(arg_16_1, true)

		if not arg_16_2.isPet then
			ClientCharacter.DGGEBHHGJG(arg_16_1, true)
		end
	end

	local var_16_2

	local function var_16_3()
		if ClientCharacter.IJFGGGBAB(arg_16_1) and ClientCharacter.EBDDCJHAHD(arg_16_1) then
			var_16_1()
		else
			arg_16_0:Wait(100, true).onComplete = var_16_3
		end
	end

	if arg_16_0 then
		var_16_3()
	else
		var_16_1()
	end
end

function OPERATOR.UpdateClientCharacter(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5, arg_19_6, arg_19_7, arg_19_8, arg_19_9, arg_19_10)
	FrontEndScene.SetCharacterVisible(arg_19_0, false, arg_19_10)
	OPERATOR.InternalSetupClientCharacter(arg_19_0, arg_19_2, arg_19_3, arg_19_4, arg_19_6, arg_19_7, arg_19_9)

	if arg_19_8 then
		OPERATOR.InternalShowCharacterAndWeaponWhenLoaded(arg_19_5, arg_19_0)
	end
end

function OPERATOR.GetCharacterTweenContainer(arg_20_0, arg_20_1)
	local var_20_0 = "tweenContainer" .. arg_20_1

	if not arg_20_0[var_20_0] then
		arg_20_0[var_20_0] = LUI.UIElement.new()

		arg_20_0:addElement(arg_20_0[var_20_0])
	end

	return arg_20_0[var_20_0]
end

function OPERATOR.UpdatePet(arg_21_0, arg_21_1, arg_21_2)
	arg_21_2 = arg_21_2 or {}

	FrontEndScene.SetCharacterVisible(arg_21_1, false)

	if arg_21_2.execution and not arg_21_2.executionPet then
		arg_21_2.executionPet = OPERATOR.GetExecutionPet(arg_21_2.execution)
	end

	if arg_21_2.executionPet and #arg_21_2.executionPet > 0 then
		local var_21_0 = StringTable.BJJBBCJGEJ(CSV.pets.file, CSV.pets.cols.ref, arg_21_2.executionPet)
		local var_21_1 = CSV.ReadRow(CSV.pets, var_21_0)

		ClientCharacter.DFHIIAGHDG(arg_21_1, var_21_1.body)

		local var_21_2 = arg_21_2.idle and var_21_1.idleAnim or OPERATOR.GetPetWalk(arg_21_0, var_21_0, arg_21_1)

		ClientCharacter.CAECDIHFCF(arg_21_1, var_21_2)

		local var_21_3

		if arg_21_2.element then
			var_21_3 = OPERATOR.GetCharacterTweenContainer(arg_21_2.element, arg_21_1)
		end

		OPERATOR.InternalShowCharacterAndWeaponWhenLoaded(var_21_3, arg_21_1, {
			isPet = true
		})
	end
end

function OPERATOR.GetPetWalk(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = StringTable.CBGJCDIHCE(CSV.pets.file, arg_22_1, CSV.pets.cols.walkAnimsStart + 1)

	if var_22_0 and #var_22_0 > 0 then
		return OPERATOR.GetRandomPetWalk(arg_22_0, arg_22_1, arg_22_2)
	else
		return StringTable.CBGJCDIHCE(CSV.pets.file, arg_22_1, CSV.pets.cols.walkAnimsStart)
	end
end

function OPERATOR.GetRandomPetWalk(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = LUI.DataSourceInGlobalModel.new("frontend.randomDogWalk." .. arg_23_1 .. "." .. arg_23_2)
	local var_23_1 = var_23_0:GetValue(arg_23_0)

	if not var_23_1 or #var_23_1 == 0 then
		local var_23_2 = {}

		for iter_23_0 = CSV.pets.cols.walkAnimsStart, CSV.pets.cols.walkAnimsEnd do
			local var_23_3 = StringTable.CBGJCDIHCE(CSV.pets.file, arg_23_1, iter_23_0)

			if var_23_3 and #var_23_3 > 0 then
				table.insert(var_23_2, var_23_3)
			end
		end

		assert(#var_23_2 > 0, "Pet in row" .. arg_23_1 .. " doesn't have any walk anims setup.")

		var_23_1 = var_23_2[math.random(1, #var_23_2)]

		var_23_0:SetValue(arg_23_0, var_23_1)
	end

	return var_23_1
end

function OPERATOR.GetWeaponDataFromLoadout(arg_24_0)
	local var_24_0 = LOADOUT.GetFavoriteLoadoutWeapons(arg_24_0)
	local var_24_1 = var_24_0.primaryWeaponModel
	local var_24_2 = var_24_0.secondaryWeaponModel
	local var_24_3 = WEAPON.GetWeaponDetailsFromModel(var_24_2)

	if OPERATOR.ShouldStripAttachments(var_24_3.weaponClass) and var_24_3.weaponRef and #var_24_3.weaponRef > 0 then
		var_24_2 = WEAPON.GetWeaponModelNameFromRef(var_24_3.weaponRef)
	end

	return var_24_1, var_24_2
end

function OPERATOR.GetEquippedItemForLootType(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = PlayerData.BFFBGAJGD(arg_25_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if arg_25_2 == LOOT.itemTypes.OPERATOR_SKIN then
		return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, var_25_0.operatorCustomization[arg_25_1].skin:get(), CSV.operatorSkins.cols.ref)
	elseif arg_25_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
		return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.lootIndex, var_25_0.operatorCustomization[arg_25_1].execution:get(), CSV.operatorExecutions.cols.ref)
	elseif arg_25_2 == LOOT.itemTypes.OPERATOR_TAUNT then
		return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.lootIndex, var_25_0.operatorCustomization[arg_25_1].taunt:get(), CSV.operatorQuips.cols.ref)
	elseif arg_25_2 == LOOT.itemTypes.OPERATOR_INTRO then
		return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.lootIndex, var_25_0.operatorCustomization[arg_25_1].intro:get(), CSV.operatorIntros.cols.ref)
	end
end

function OPERATOR.SetEquippedItemForLootType(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = PlayerData.BFFBGAJGD(arg_26_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if arg_26_2 == LOOT.itemTypes.OPERATOR_SKIN then
		var_26_0.operatorCustomization[arg_26_1].skin:set(arg_26_3)
	elseif arg_26_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
		var_26_0.operatorCustomization[arg_26_1].execution:set(arg_26_3)
	elseif arg_26_2 == LOOT.itemTypes.OPERATOR_TAUNT then
		var_26_0.operatorCustomization[arg_26_1].taunt:set(arg_26_3)
	elseif arg_26_2 == LOOT.itemTypes.OPERATOR_INTRO then
		var_26_0.operatorCustomization[arg_26_1].intro:set(arg_26_3)
	end
end

function OPERATOR.GetConfigString(arg_27_0)
	local var_27_0 = ""
	local var_27_1 = PlayerData.BFFBGAJGD(arg_27_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_27_2 = var_27_1.operators[OPERATOR.SuperFaction.WEST]:get()
	local var_27_3 = var_27_1.operators[OPERATOR.SuperFaction.EAST]:get()
	local var_27_4 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, var_27_2)
	local var_27_5 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, var_27_3)

	if var_27_4 then
		var_27_0 = var_27_0 .. "+" .. var_27_4
	end

	if var_27_5 then
		var_27_0 = var_27_0 .. "+" .. var_27_5
	end

	if #var_27_0 > 0 then
		var_27_0 = string.sub(var_27_0, 2)
	end

	return var_27_0
end

function OPERATOR.GetCosmeticConfigString(arg_28_0, arg_28_1)
	local var_28_0 = ""
	local var_28_1 = PlayerData.BFFBGAJGD(arg_28_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_28_2 = var_28_1.operatorCustomization[arg_28_0].skin:get()
	local var_28_3 = var_28_1.operatorCustomization[arg_28_0].execution:get()
	local var_28_4 = var_28_1.operatorCustomization[arg_28_0].taunt:get()
	local var_28_5 = OPERATOR.GetCosmeticRefByLootTypeAndIndex(LOOT.itemTypes.OPERATOR_SKIN, var_28_2)
	local var_28_6 = OPERATOR.GetCosmeticRefByLootTypeAndIndex(LOOT.itemTypes.OPERATOR_EXECUTION, var_28_3)
	local var_28_7 = OPERATOR.GetCosmeticRefByLootTypeAndIndex(LOOT.itemTypes.OPERATOR_TAUNT, var_28_4)
	local var_28_8 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_28_0)
	local var_28_9 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR_SKIN, var_28_5)
	local var_28_10 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR_EXECUTION, var_28_6)
	local var_28_11 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR_TAUNT, var_28_7)

	if var_28_8 then
		var_28_0 = var_28_0 .. "+" .. var_28_8
	end

	if var_28_9 then
		var_28_0 = var_28_0 .. "+" .. var_28_9
	end

	if var_28_10 then
		var_28_0 = var_28_0 .. "+" .. var_28_10
	end

	if var_28_11 then
		var_28_0 = var_28_0 .. "+" .. var_28_11
	end

	if #var_28_0 > 0 then
		var_28_0 = string.sub(var_28_0, 2)
	end

	return var_28_0
end

function OPERATOR.IsSkinGlobal(arg_29_0)
	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_29_0, CSV.operatorSkins.cols.isGlobal) == "1"
end

function OPERATOR.IsExecutionGlobal(arg_30_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_30_0, CSV.operatorExecutions.cols.operatorRef) == OPERATOR.GlobalExecutionRef
end

function OPERATOR.GetGender(arg_31_0)
	assert(arg_31_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_31_0, CSV.operators.cols.gender)
end

function OPERATOR.GetName(arg_32_0)
	assert(arg_32_0)

	if arg_32_0 then
		return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_32_0, CSV.operators.cols.name)
	end
end

function OPERATOR.GetIcon(arg_33_0)
	assert(arg_33_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_33_0, CSV.operators.cols.icon)
end

function OPERATOR.GetLootIcon(arg_34_0)
	assert(arg_34_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_34_0, CSV.operators.cols.lootImage)
end

function OPERATOR.GetIntroVideo(arg_35_0)
	assert(arg_35_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_35_0, CSV.operators.cols.introVideo)
end

function OPERATOR.GetSkinID(arg_36_0)
	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_36_0, CSV.operatorSkins.cols.lootIndex)
end

function OPERATOR.GetSkinRef(arg_37_0)
	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, arg_37_0, CSV.operatorSkins.cols.ref)
end

function OPERATOR.GetSkinName(arg_38_0)
	assert(arg_38_0)

	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_38_0, CSV.operatorSkins.cols.name)
end

function OPERATOR.GetSkinDesc(arg_39_0)
	assert(arg_39_0)

	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_39_0, CSV.operatorSkins.cols.desc)
end

function OPERATOR.GetSkinIcon(arg_40_0)
	assert(arg_40_0)

	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_40_0, CSV.operatorSkins.cols.icon)
end

function OPERATOR.GetLootSkinImage(arg_41_0)
	assert(arg_41_0)

	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_41_0, CSV.operatorSkins.cols.lootImage)
end

function OPERATOR.GetEquippedOperatorName(arg_42_0, arg_42_1)
	local var_42_0 = PlayerData.BFFBGAJGD(arg_42_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	return Engine.CBBHFCGDIC(OPERATOR.GetName(var_42_0.operators[arg_42_1]:get()))
end

function OPERATOR.GetExecutionID(arg_43_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_43_0, CSV.operatorExecutions.cols.lootIndex)
end

function OPERATOR.GetExecutionRef(arg_44_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.lootIndex, arg_44_0, CSV.operatorExecutions.cols.ref)
end

function OPERATOR.GetExecutionPet(arg_45_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.lootIndex, arg_45_0, CSV.operatorExecutions.cols.pet)
end

function OPERATOR.GetPetModel(arg_46_0)
	return StringTable.DIFCHIGDFB(CSV.pets.file, CSV.pets.cols.ref, arg_46_0, CSV.pets.cols.body)
end

function OPERATOR.GetExecutionVideo(arg_47_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_47_0, CSV.operatorExecutions.cols.videoPreview)
end

function OPERATOR.GetTauntVideo(arg_48_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_48_0, CSV.operatorQuips.cols.lootImage)
end

function OPERATOR.GetIntroImage(arg_49_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_49_0, CSV.operatorIntros.cols.imagePreview)
end

function OPERATOR.GetExecutionName(arg_50_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_50_0, CSV.operatorExecutions.cols.name)
end

function OPERATOR.GetExecutionDesc(arg_51_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_51_0, CSV.operatorExecutions.cols.desc)
end

function OPERATOR.GetExecutionIcon(arg_52_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_52_0, CSV.operatorExecutions.cols.icon)
end

function OPERATOR.GetExecutionLootImage(arg_53_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_53_0, CSV.operatorExecutions.cols.lootImage)
end

function OPERATOR.GetExecutionSeason(arg_54_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_54_0, CSV.operatorExecutions.cols.season)
end

function OPERATOR.GetQuipID(arg_55_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_55_0, CSV.operatorQuips.cols.lootIndex)
end

function OPERATOR.GetQuipName(arg_56_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_56_0, CSV.operatorQuips.cols.name)
end

function OPERATOR.GetQuipIcon(arg_57_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_57_0, CSV.operatorQuips.cols.icon)
end

function OPERATOR.GetQuipLootImage(arg_58_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_58_0, CSV.operatorQuips.cols.lootImage)
end

function OPERATOR.GetQuipAlias(arg_59_0)
	if not arg_59_0 then
		return
	end

	local var_59_0 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_59_0, CSV.operatorQuips.cols.operatorRef)

	if not var_59_0 or #var_59_0 <= 0 then
		return
	end

	local var_59_1 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, var_59_0, CSV.operators.cols.voice)

	if not var_59_1 or #var_59_1 <= 0 then
		return
	end

	local var_59_2 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_59_0, CSV.operatorQuips.cols.alias)

	if not var_59_2 or #var_59_2 <= 0 then
		return
	end

	return "dx_mpp_" .. var_59_1 .. "_flavor_player_execution" .. var_59_2
end

function OPERATOR.GetTauntRef(arg_60_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.lootIndex, arg_60_0, CSV.operatorQuips.cols.ref)
end

function OPERATOR.GetTauntName(arg_61_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_61_0, CSV.operatorQuips.cols.name)
end

function OPERATOR.GetTauntDesc(arg_62_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_62_0, CSV.operatorQuips.cols.desc)
end

function OPERATOR.GetTauntIcon(arg_63_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_63_0, CSV.operatorQuips.cols.icon)
end

function OPERATOR.GetTauntSeason(arg_64_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_64_0, CSV.operatorQuips.cols.season)
end

function OPERATOR.GetIntroName(arg_65_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_65_0, CSV.operatorIntros.cols.name)
end

function OPERATOR.GetIntroDesc(arg_66_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_66_0, CSV.operatorIntros.cols.desc)
end

function OPERATOR.GetIntroIcon(arg_67_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_67_0, CSV.operatorIntros.cols.icon)
end

function OPERATOR.GetIntroSeason(arg_68_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_68_0, CSV.operatorIntros.cols.season)
end

function OPERATOR.GetSkinOwnerRef(arg_69_0)
	local var_69_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_69_0, CSV.operatorSkins.cols.operatorRef)

	if var_69_0 and #var_69_0 > 0 then
		return var_69_0
	end
end

function OPERATOR.GetQuipOwnerRef(arg_70_0)
	local var_70_0 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_70_0, CSV.operatorQuips.cols.operatorRef)

	if var_70_0 and #var_70_0 > 0 then
		return var_70_0
	end
end

function OPERATOR.GetExecutionOwnerRef(arg_71_0)
	local var_71_0 = StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_71_0, CSV.operatorExecutions.cols.operatorRef)

	if var_71_0 and #var_71_0 > 0 then
		return var_71_0
	end
end

function OPERATOR.GetSkinOwnerName(arg_72_0)
	if OPERATOR.IsSkinGlobal(arg_72_0) then
		return "LOOT_MP/OPERATOR"
	else
		local var_72_0 = OPERATOR.GetSkinOwnerRef(arg_72_0)

		return OPERATOR.GetName(var_72_0)
	end
end

function OPERATOR.GetQuipOwnerName(arg_73_0)
	local var_73_0 = OPERATOR.GetQuipOwnerRef(arg_73_0)

	return OPERATOR.GetName(var_73_0)
end

function OPERATOR.GetExecutionOwnerName(arg_74_0)
	if OPERATOR.IsExecutionGlobal(arg_74_0) then
		return "LOOT_MP/OPERATOR"
	else
		local var_74_0 = OPERATOR.GetExecutionOwnerRef(arg_74_0)

		return OPERATOR.GetName(var_74_0)
	end
end

function OPERATOR.GetOperatorSkinRef(arg_75_0, arg_75_1)
	local var_75_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.bodyModel, arg_75_0, CSV.operators.cols.ref)

	if not var_75_0 or #var_75_0 <= 0 then
		var_75_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.headModel, arg_75_1, CSV.operators.cols.ref)
	end

	return var_75_0
end

function OPERATOR.GetOperatorFactionRef(arg_76_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_76_0, CSV.operators.cols.factionRef)
end

function OPERATOR.GetOperatorSuperFactionRef(arg_77_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_77_0, CSV.operators.cols.superfaction)
end

function OPERATOR.GetFactionIcon(arg_78_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_78_0, CSV.operators.cols.factionIcon)
end

function OPERATOR.GetFactionName(arg_79_0)
	local var_79_0 = OPERATOR.GetOperatorFactionRef(arg_79_0)

	if var_79_0 and #var_79_0 > 0 then
		return StringTable.DIFCHIGDFB(CSV.FactionTable.file, CSV.FactionTable.cols.ref, var_79_0, CSV.FactionTable.cols.name)
	end
end

function OPERATOR.GetViewHandsForOperator(arg_80_0)
	return StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.model, arg_80_0, CSV.bodies.cols.armModel)
end

function OPERATOR.GetFavoriteOperatorRef(arg_81_0)
	local var_81_0 = OPERATOR.GetSelectedOperatorIndex(arg_81_0)

	return (OPERATOR.GetEquippedOperatorRef(arg_81_0, var_81_0))
end

function OPERATOR.GetEquippedOperatorRef(arg_82_0, arg_82_1)
	return (PlayerData.BFFBGAJGD(arg_82_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_82_1]:get())
end

function OPERATOR.GetEquippedOperatorData(arg_83_0, arg_83_1)
	local var_83_0 = PlayerData.BFFBGAJGD(arg_83_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_83_1]:get()
	local var_83_1 = StringTable.BJJBBCJGEJ(CSV.operators.file, CSV.operators.cols.ref, var_83_0)

	return CSV.ReadRow(CSV.operators, var_83_1)
end

function OPERATOR.GetEquippedSkinForOperator(arg_84_0, arg_84_1)
	local var_84_0 = PlayerData.BFFBGAJGD(arg_84_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorCustomization[arg_84_1].skin:get()

	assert(var_84_0)

	return OPERATOR.GetOperatorSkin(arg_84_0, var_84_0, arg_84_1)
end

function OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_85_0, arg_85_1, arg_85_2)
	local var_85_0 = LOADOUT.GetFavoriteLoadoutIndex(arg_85_0)
	local var_85_1 = PlayerData.BFFBGAJGD(arg_85_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_85_0].weaponSetups[0]
	local var_85_2 = arg_85_2 or var_85_1.weapon:get()
	local var_85_3
	local var_85_4
	local var_85_5 = WEAPON.GetWeaponClass(var_85_2)

	for iter_85_0 = 0, StringTable.BFHCAIIDA(CSV.defaultOperatorSkins.file) - 1 do
		local var_85_6 = CSV.ReadRow(CSV.defaultOperatorSkins, iter_85_0)

		if var_85_6 and var_85_6.weaponClass == var_85_5 and var_85_6.operatorRef == arg_85_1 then
			var_85_4 = var_85_6.bodyModel
			var_85_3 = var_85_6.headModel

			return var_85_3, var_85_4
		end
	end

	if arg_85_1 == "default_western" then
		var_85_3 = OPERATOR.DefaultWestHead
		var_85_4 = OPERATOR.DefaultWestBody
	else
		var_85_3 = OPERATOR.DefaultEastHead
		var_85_4 = OPERATOR.DefaultEastBody
	end

	return var_85_3, var_85_4
end

function OPERATOR.GetOperatorSkin(arg_86_0, arg_86_1, arg_86_2)
	local var_86_0 = {}
	local var_86_1 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, arg_86_1, CSV.operatorSkins.cols.headModel)
	local var_86_2 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, arg_86_1, CSV.operatorSkins.cols.bodyModel)

	if OPERATOR.HasWeaponClassOverridesForSkin(arg_86_2, var_86_2, var_86_1) then
		var_86_1, var_86_2 = OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_86_0, arg_86_2)
	end

	local var_86_3 = OPERATOR.GetSkinsCSVFile(arg_86_2)
	local var_86_4 = StringTable.DIFCHIGDFB(var_86_3.file, var_86_3.cols.headModel, var_86_1, var_86_3.cols.headModelHighRes)
	local var_86_5 = StringTable.DIFCHIGDFB(var_86_3.file, var_86_3.cols.bodyModel, var_86_2, var_86_3.cols.bodyModelHighRes)

	var_86_0.headModel = #var_86_4 > 0 and var_86_4 or var_86_1
	var_86_0.bodyModel = #var_86_5 > 0 and var_86_5 or var_86_2

	if #var_86_0.bodyModel <= 0 or #var_86_0.headModel <= 0 then
		var_86_0.bodyModel = "faction_smith_proxy"
		var_86_0.headModel = "faction_smith_proxy_head"
	end

	return var_86_0
end

function OPERATOR.GetOperatorSkinByRef(arg_87_0, arg_87_1, arg_87_2)
	local var_87_0 = {}
	local var_87_1 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_87_1, CSV.operatorSkins.cols.headModel)
	local var_87_2 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_87_1, CSV.operatorSkins.cols.bodyModel)

	if OPERATOR.HasWeaponClassOverridesForSkin(arg_87_2, var_87_2, var_87_1) then
		var_87_1, var_87_2 = OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_87_0, arg_87_2)
	else
		local var_87_3 = {
			{
				col = CSV.operatorSkins.cols.ref,
				key = arg_87_1
			},
			{
				col = CSV.operatorSkins.cols.operatorRef,
				key = arg_87_2
			}
		}
		local var_87_4 = StringTable.BABCABFJEJ(CSV.operatorSkins.file, var_87_3)

		var_87_1 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, var_87_4, CSV.operatorSkins.cols.headModel)
		var_87_2 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, var_87_4, CSV.operatorSkins.cols.bodyModel)
	end

	local var_87_5 = OPERATOR.GetSkinsCSVFile(arg_87_2)
	local var_87_6 = StringTable.DIFCHIGDFB(var_87_5.file, var_87_5.cols.headModel, var_87_1, var_87_5.cols.headModelHighRes)
	local var_87_7 = StringTable.DIFCHIGDFB(var_87_5.file, var_87_5.cols.bodyModel, var_87_2, var_87_5.cols.bodyModelHighRes)

	var_87_0.headModel = #var_87_6 > 0 and var_87_6 or var_87_1
	var_87_0.bodyModel = #var_87_7 > 0 and var_87_7 or var_87_2

	if #var_87_0.bodyModel <= 0 or #var_87_0.headModel <= 0 then
		var_87_0.bodyModel = "faction_smith_proxy"
		var_87_0.headModel = "faction_smith_proxy_head"
	end

	return var_87_0
end

function OPERATOR.SetSelectedOperatorIndex(arg_88_0, arg_88_1)
	PlayerData.BFFBGAJGD(arg_88_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.selectedOperatorIndex:set(arg_88_1)
	Engine.DAGFFDGFII("uploadstats", arg_88_0)
end

function OPERATOR.GetSelectedOperatorIndex(arg_89_0)
	return PlayerData.BFFBGAJGD(arg_89_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.selectedOperatorIndex:get()
end

function OPERATOR.GetEquippedOperatorSkin(arg_90_0, arg_90_1)
	local var_90_0 = PlayerData.BFFBGAJGD(arg_90_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_90_1 = var_90_0.operators[arg_90_1]:get()
	local var_90_2 = var_90_0.operatorCustomization[var_90_1].skin:get()

	assert(var_90_2)

	local var_90_3 = OPERATOR.GetOperatorSkin(arg_90_0, var_90_2, var_90_1)

	return var_90_3.bodyModel, var_90_3.headModel
end

function OPERATOR.GetPetForEquippedOperator(arg_91_0, arg_91_1)
	local var_91_0 = PlayerData.BFFBGAJGD(arg_91_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_91_1]:get()

	return OPERATOR.GetPetForOperator(arg_91_0, var_91_0)
end

function OPERATOR.GetPetForOperator(arg_92_0, arg_92_1)
	local var_92_0 = OPERATOR.GetExecutionForOperator(arg_92_0, arg_92_1)

	return OPERATOR.GetExecutionPet(var_92_0)
end

function OPERATOR.GetLootIDFromRef(arg_93_0)
	local var_93_0 = "loot/operator_ids.csv"

	return StringTable.DIFCHIGDFB(var_93_0, CSV.lootIDs.cols.ref, arg_93_0, CSV.lootIDs.cols.index)
end

function OPERATOR.IsUnlockedInPrivate(arg_94_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_94_0, CSV.operators.cols.unlockedInPrivate) == "1"
end

function OPERATOR.IsUnlockedInIGR(arg_95_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_95_0, CSV.operators.cols.unlockedInIGR) == "1"
end

function OPERATOR.IsUnlocked(arg_96_0, arg_96_1)
	assert(arg_96_1)

	local var_96_0 = LOOT.IsUnlocked(arg_96_0, LOOT.itemTypes.OPERATOR, arg_96_1)

	if IsSystemLink() or IsPrivateMatch() and not CONDITIONS.IsThirdGameMode() or MLG.IsCDLActive(arg_96_0) or CONDITIONS.IsInGameBattlesMatch() then
		var_96_0 = var_96_0 or OPERATOR.IsUnlockedInPrivate(arg_96_1)
	end

	if Engine.GEHBEDCEC() then
		var_96_0 = var_96_0 or OPERATOR.IsUnlockedInIGR(arg_96_1)
	end

	return var_96_0
end

function OPERATOR.GetUnlockMethod(arg_97_0, arg_97_1, arg_97_2)
	if arg_97_1 == LOOT.itemTypes.OPERATOR_SKIN then
		return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_97_2, CSV.operatorSkins.cols.unlockType)
	elseif arg_97_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_97_2, CSV.operatorExecutions.cols.unlockType)
	elseif arg_97_1 == LOOT.itemTypes.OPERATOR_TAUNT then
		return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_97_2, CSV.operatorQuips.cols.unlockType)
	elseif arg_97_1 == LOOT.itemTypes.OPERATOR_INTRO then
		return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_97_2, CSV.operatorIntros.cols.unlockType)
	end
end

function OPERATOR.GetItemValue(arg_98_0, arg_98_1, arg_98_2)
	return LOOT.GetItemCost(arg_98_1, arg_98_2)
end

function OPERATOR.GetIdleAnimations(arg_99_0)
	local var_99_0 = {}
	local var_99_1 = CSV.operatorSelectAnimations.cols.idleAnimationsEnd - CSV.operatorSelectAnimations.cols.idleAnimationsStart + 1

	for iter_99_0 = 0, var_99_1 - 1 do
		local var_99_2 = StringTable.CBGJCDIHCE(CSV.operatorSelectAnimations.file, arg_99_0, CSV.operatorSelectAnimations.cols.idleAnimationsStart + iter_99_0)

		if var_99_2 and var_99_2 ~= "" then
			table.insert(var_99_0, var_99_2)
		end
	end

	return var_99_0
end

function OPERATOR.GetEquipAnimations(arg_100_0)
	local var_100_0 = {}
	local var_100_1 = CSV.operatorSelectAnimations.cols.equipAnimationsEnd - CSV.operatorSelectAnimations.cols.equipAnimationsStart + 1

	for iter_100_0 = 0, var_100_1 - 1 do
		local var_100_2 = StringTable.CBGJCDIHCE(CSV.operatorSelectAnimations.file, arg_100_0, CSV.operatorSelectAnimations.cols.equipAnimationsStart + iter_100_0)

		if var_100_2 and var_100_2 ~= "" then
			table.insert(var_100_0, var_100_2)
		end
	end

	return var_100_0
end

function OPERATOR.GetTransitionInfoFromAnimation(arg_101_0)
	local var_101_0 = StringTable.BJJBBCJGEJ(CSV.operatorSelectAnimationTransitions.file, CSV.operatorSelectAnimationTransitions.cols.ref, arg_101_0)
	local var_101_1 = CSV.ReadRow(CSV.operatorSelectAnimationTransitions, var_101_0)
	local var_101_2 = 0
	local var_101_3 = 0
	local var_101_4

	if var_101_1.blendTime and #var_101_1.blendTime > 0 then
		var_101_2 = tonumber(var_101_1.blendTime)
	end

	if var_101_1.startTime and #var_101_1.startTime > 0 then
		var_101_3 = tonumber(var_101_1.startTime)
	end

	if var_101_1.notetrack and #var_101_1.notetrack > 0 then
		var_101_4 = var_101_1.notetrack
	end

	return var_101_2, var_101_3, var_101_4
end

function OPERATOR.GetWeaponPosesTable()
	local var_102_0 = {}

	for iter_102_0 = 0, StringTable.BFHCAIIDA(CSV.operatorWeaponPoses.file) - 1 do
		local var_102_1 = CSV.ReadRow(CSV.operatorWeaponPoses, iter_102_0)

		if var_102_1.weaponType ~= "" then
			if not var_102_0[var_102_1.weaponType] then
				var_102_0[var_102_1.weaponType] = {}
			end

			if not var_102_0[var_102_1.weaponType][var_102_1.superfaction] then
				var_102_0[var_102_1.weaponType][var_102_1.superfaction] = {}
			end

			if not var_102_0[var_102_1.weaponType][var_102_1.superfaction][var_102_1.gender] then
				var_102_0[var_102_1.weaponType][var_102_1.superfaction][var_102_1.gender] = {}
			end

			table.insert(var_102_0[var_102_1.weaponType][var_102_1.superfaction][var_102_1.gender], var_102_1.pose)
		end
	end

	return var_102_0
end

function OPERATOR.GetSkinsForOperator(arg_103_0, arg_103_1, arg_103_2, arg_103_3)
	assert(arg_103_0)

	return OPERATOR.GetSkinsForOperators({
		[arg_103_0] = true
	}, arg_103_1, arg_103_2, arg_103_3)[arg_103_0] or {}
end

function OPERATOR.CreateSkinCache()
	for iter_104_0, iter_104_1 in pairs(OPERATOR.CachedSkinRefs) do
		return
	end

	OPERATOR.CachedSkinRefs = {}

	local var_104_0 = StringTable.BFHCAIIDA(CSV.operatorSkins.file)

	for iter_104_2 = 0, var_104_0 - 1 do
		local var_104_1 = CSV.ReadRow(CSV.operatorSkins, iter_104_2)

		if var_104_1 then
			if not OPERATOR.CachedSkinRefs[var_104_1.operatorRef] then
				OPERATOR.CachedSkinRefs[var_104_1.operatorRef] = {}
			end

			table.insert(OPERATOR.CachedSkinRefs[var_104_1.operatorRef], var_104_1.ref)
		end
	end
end

function OPERATOR.GetFirstUnlockedSkin(arg_105_0, arg_105_1)
	OPERATOR.CreateSkinCache()

	if OPERATOR.UnlockedSkinRefs[arg_105_0] then
		return OPERATOR.UnlockedSkinRefs[arg_105_0]
	end

	if OPERATOR.CachedSkinRefs[arg_105_0] then
		local var_105_0 = OPERATOR.CachedSkinRefs[arg_105_0]

		for iter_105_0 = 1, #var_105_0 do
			if LOOT.IsUnlocked(arg_105_1, LOOT.itemTypes.OPERATOR_SKIN, var_105_0[iter_105_0]) then
				OPERATOR.UnlockedSkinRefs[arg_105_0] = var_105_0[iter_105_0]

				return var_105_0[iter_105_0]
			end
		end

		return false
	end
end

function OPERATOR.GetFirstUnlockedExecution(arg_106_0, arg_106_1)
	local var_106_0 = OPERATOR.GetExecutionsForOperator(nil, arg_106_0, arg_106_1)

	if #var_106_0 > 0 then
		return var_106_0[1].ref
	end
end

function OPERATOR.GetFirstUnlockedTaunt(arg_107_0, arg_107_1)
	local var_107_0 = OPERATOR.GetTauntsForOperator(nil, arg_107_0, arg_107_1)

	if #var_107_0 > 0 then
		return var_107_0[1].ref
	end
end

function OPERATOR.GetSkinsForOperators(arg_108_0, arg_108_1, arg_108_2, arg_108_3)
	assert(arg_108_0)

	local var_108_0 = {}
	local var_108_1
	local var_108_2 = arg_108_2 or Dvar.IBEGCHEFE("NLTNQNSMQK")

	if var_108_2 then
		var_108_1 = {}
	end

	local var_108_3 = StringTable.BFHCAIIDA(CSV.operatorSkins.file)

	for iter_108_0 = 0, var_108_3 - 1 do
		local var_108_4 = CSV.ReadRow(CSV.operatorSkins, iter_108_0)

		if var_108_4 and arg_108_0[var_108_4.operatorRef] then
			var_108_4.rarity = LOOT.GetItemQuality(LOOT.itemTypes.OPERATOR_SKIN, var_108_4.ref)
			var_108_4.season = LOOT.GetItemSeason(LOOT.itemTypes.OPERATOR_SKIN, var_108_4.ref)
			var_108_4.isUnlocked = LOOT.IsUnlocked(arg_108_1, LOOT.itemTypes.OPERATOR_SKIN, var_108_4.ref)

			local var_108_5 = tostring(LOOT.GetItemID(LOOT.itemTypes.OPERATOR_SKIN, var_108_4.ref))

			var_108_4.lootId = var_108_5

			if not var_108_4.isUnlocked and Engine.CJJAFGIFAC(arg_108_1) or var_108_4.isUnlocked then
				table.insert(var_108_0, var_108_4)

				if var_108_2 then
					var_108_1[var_108_5] = var_108_4
				end
			end
		end
	end

	if var_108_2 then
		local var_108_6 = Challenge.GetChallengeDataForSkinLootIds(arg_108_1, var_108_1)

		for iter_108_1, iter_108_2 in pairs(var_108_1) do
			iter_108_2.challengeData = var_108_6[iter_108_1]
		end
	end

	local var_108_7 = {}

	for iter_108_3, iter_108_4 in ipairs(var_108_0) do
		local var_108_8 = arg_108_3 and iter_108_4.challengeData and not Challenge.IsMissionCurrent(arg_108_1, iter_108_4.challengeData.id)

		if iter_108_4.isUnlocked or iter_108_4.challengeData and not var_108_8 or BATTLEPASS.GetItemDetailsFromBattlePass(iter_108_4.lootId) then
			if not var_108_7[iter_108_4.operatorRef] then
				var_108_7[iter_108_4.operatorRef] = {}
			end

			table.insert(var_108_7[iter_108_4.operatorRef], iter_108_4)
		end
	end

	return var_108_7
end

function OPERATOR.GetOutfitChallengeDetailsFromObjective(arg_109_0, arg_109_1)
	local var_109_0
	local var_109_1 = 1
	local var_109_2 = 1

	for iter_109_0 = 1, #arg_109_1 do
		local var_109_3 = arg_109_1[iter_109_0].objectives

		for iter_109_1 = 1, #var_109_3 do
			if var_109_3[iter_109_1].id == arg_109_0 then
				var_109_0 = arg_109_1[iter_109_0]
				var_109_1 = iter_109_1
				var_109_2 = iter_109_0

				break
			end
		end

		if var_109_0 then
			break
		end
	end

	assert(var_109_0)

	return {
		challenge = var_109_0,
		objectiveIndex = var_109_1,
		missionIndex = var_109_2
	}
end

function OPERATOR.GetOutfitMissionQuestsForOperator(arg_110_0, arg_110_1, arg_110_2)
	return OPERATOR.GetOutfitMissionQuestsForOperators({
		[arg_110_0] = true
	}, arg_110_1, arg_110_2)[arg_110_0]
end

function OPERATOR.GetOutfitMissionQuestsForOperators(arg_111_0, arg_111_1, arg_111_2)
	local var_111_0 = {}
	local var_111_1 = {}
	local var_111_2 = OPERATOR.GetSkinsForOperators(arg_111_0, arg_111_1, true)

	for iter_111_0, iter_111_1 in pairs(var_111_2) do
		for iter_111_2, iter_111_3 in ipairs(iter_111_1) do
			if iter_111_3.challengeData then
				var_111_0[iter_111_3.challengeData.challengeRowIndex] = iter_111_0
			end
		end
	end

	local function var_111_3(arg_112_0, arg_112_1)
		for iter_112_0, iter_112_1 in ipairs(arg_112_0) do
			local var_112_0 = var_111_0[iter_112_1.rowIndex]

			if var_112_0 ~= nil then
				if not var_111_1[var_112_0] then
					var_111_1[var_112_0] = {}
				end

				local var_112_1 = arg_111_2 or not arg_112_1.isBattlePassLocked or arg_112_1.isBattlePassLocked and arg_112_1.season == SEASON.GetCurrentSeason()

				var_112_1 = var_112_1 or Challenge.MissionIsOwned(arg_111_1, iter_112_1.id)

				if var_112_1 then
					table.insert(var_111_1[var_112_0], arg_112_1)
				end

				return true
			end
		end

		return false
	end

	local function var_111_4(arg_113_0)
		return false
	end

	local var_111_5 = Challenge.GetQuestsForMissionChallenges(arg_111_1, {
		Challenge.Operator
	})

	if arg_111_2 then
		local var_111_6 = {}

		for iter_111_4, iter_111_5 in ipairs(var_111_5.questIDs) do
			local var_111_7 = var_111_5.quests[iter_111_5]
			local var_111_8 = false

			for iter_111_6 = 1, #var_111_7 do
				if var_111_7[iter_111_6].id == arg_111_2 then
					var_111_8 = true

					break
				end
			end

			if not var_111_8 then
				table.insert(var_111_6, iter_111_4)
			end
		end

		if #var_111_6 > 0 then
			for iter_111_7 = #var_111_6, 1, -1 do
				table.remove(var_111_5.questIDs, var_111_6[iter_111_7])
			end
		end
	end

	local var_111_9 = SEASON.GetCurrentSeason()

	for iter_111_8 = 1, var_111_9 do
		Challenge.GetMissionsForQuests(arg_111_1, var_111_5, iter_111_8, var_111_4, var_111_3)
	end

	return var_111_1
end

function OPERATOR.CreateExecutionCache()
	OPERATOR.CachedExecutionRefs = {}

	local var_114_0 = StringTable.BFHCAIIDA(CSV.operatorExecutions.file)

	for iter_114_0 = 0, var_114_0 - 1 do
		local var_114_1 = CSV.ReadRow(CSV.operatorExecutions, iter_114_0)

		if var_114_1 then
			if not OPERATOR.CachedExecutionRefs[var_114_1.operatorRef] then
				OPERATOR.CachedExecutionRefs[var_114_1.operatorRef] = {}
			end

			table.insert(OPERATOR.CachedExecutionRefs[var_114_1.operatorRef], var_114_1)
		end
	end
end

function OPERATOR.GetExecutionsForOperator(arg_115_0, arg_115_1, arg_115_2)
	assert(arg_115_1)

	local var_115_0 = {}

	if #OPERATOR.CachedExecutionRefs < 1 then
		OPERATOR.CreateExecutionCache()
	end

	local var_115_1 = OPERATOR.CachedExecutionRefs[arg_115_1] or {}
	local var_115_2 = OPERATOR.CachedExecutionRefs[OPERATOR.GlobalExecutionRef]

	for iter_115_0 = 1, #var_115_2 do
		var_115_1[#var_115_1 + 1] = var_115_2[iter_115_0]
	end

	for iter_115_1 = 1, #var_115_1 do
		local var_115_3 = var_115_1[iter_115_1]

		if var_115_3 then
			var_115_3.rarity = LOOT.GetItemQuality(LOOT.itemTypes.OPERATOR_EXECUTION, var_115_3.ref)
			var_115_3.season = LOOT.GetItemSeason(LOOT.itemTypes.OPERATOR_EXECUTION, var_115_3.ref)
			var_115_3.isUnlocked = LOOT.IsUnlocked(arg_115_2, LOOT.itemTypes.OPERATOR_EXECUTION, var_115_3.ref)

			if var_115_3.isUnlocked then
				table.insert(var_115_0, var_115_3)
			end
		end
	end

	return var_115_0
end

function OPERATOR.CreateTauntCache()
	OPERATOR.CachedTauntRefs = {}

	local var_116_0 = StringTable.BFHCAIIDA(CSV.operatorQuips.file)

	for iter_116_0 = 0, var_116_0 - 1 do
		local var_116_1 = CSV.ReadRow(CSV.operatorQuips, iter_116_0)

		if var_116_1 then
			if not OPERATOR.CachedTauntRefs[var_116_1.operatorRef] then
				OPERATOR.CachedTauntRefs[var_116_1.operatorRef] = {}
			end

			table.insert(OPERATOR.CachedTauntRefs[var_116_1.operatorRef], var_116_1)
		end
	end
end

function OPERATOR.GetTauntsForOperator(arg_117_0, arg_117_1, arg_117_2)
	assert(arg_117_1)

	local var_117_0 = {}

	if #OPERATOR.CachedTauntRefs < 1 then
		OPERATOR.CreateTauntCache()
	end

	local var_117_1 = OPERATOR.CachedTauntRefs[arg_117_1] or {}

	for iter_117_0 = 1, #var_117_1 do
		local var_117_2 = var_117_1[iter_117_0]

		if var_117_2 then
			var_117_2.rarity = LOOT.GetItemQuality(LOOT.itemTypes.OPERATOR_TAUNT, var_117_2.ref)
			var_117_2.season = LOOT.GetItemSeason(LOOT.itemTypes.OPERATOR_TAUNT, var_117_2.ref)
			var_117_2.isUnlocked = LOOT.IsUnlocked(arg_117_2, LOOT.itemTypes.OPERATOR_TAUNT, var_117_2.ref)

			if var_117_2.isUnlocked then
				table.insert(var_117_0, var_117_2)
			end
		end
	end

	return var_117_0
end

function OPERATOR.GetIntrosForOperator(arg_118_0, arg_118_1, arg_118_2)
	assert(arg_118_1)

	local var_118_0 = {}
	local var_118_1 = StringTable.BFHCAIIDA(CSV.operatorIntros.file)

	for iter_118_0 = 0, var_118_1 - 1 do
		local var_118_2 = CSV.ReadRow(CSV.operatorIntros, iter_118_0)

		if var_118_2 and var_118_2.operatorRef == arg_118_1 then
			var_118_2.isUnlocked = true

			table.insert(var_118_0, var_118_2)
		end
	end

	return var_118_0
end

function OPERATOR.GetOperatorsForSuperfaction(arg_119_0, arg_119_1)
	assert(arg_119_1)

	local var_119_0 = {}
	local var_119_1 = StringTable.BFHCAIIDA(CSV.operators.file)

	for iter_119_0 = 0, var_119_1 - 1 do
		local var_119_2 = CSV.ReadRow(CSV.operators, iter_119_0)

		if var_119_2 and tonumber(var_119_2.displayOrder) >= 0 and tonumber(var_119_2.superfaction) == arg_119_1 then
			table.insert(var_119_0, var_119_2)
		end
	end

	table.sort(var_119_0, OPERATOR.Internal_SortByDisplayOrder)

	return var_119_0
end

function OPERATOR.GetExecutionForOperator(arg_120_0, arg_120_1)
	return PlayerData.BFFBGAJGD(arg_120_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorCustomization[arg_120_1].execution:get()
end

function OPERATOR.ValidateEquippedCustomization(arg_121_0, arg_121_1, arg_121_2)
	local var_121_0 = PlayerData.BFFBGAJGD(arg_121_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorCustomization[arg_121_1]

	assert(var_121_0, arg_121_1 .. ", is missing an entry in the enum: Operator. FILE: loadout_mp.rddl")

	local var_121_1 = var_121_0.skin:get()
	local var_121_2 = var_121_0.execution:get()
	local var_121_3 = var_121_0.taunt:get()

	if var_121_1 == 0 or not LOOT.IsUnlocked(arg_121_0, LOOT.itemTypes.OPERATOR_SKIN, OPERATOR.GetSkinRef(var_121_1)) then
		local var_121_4 = OPERATOR.GetFirstUnlockedSkin(arg_121_1, arg_121_0)

		if var_121_4 then
			local var_121_5 = OPERATOR.GetSkinID(var_121_4)

			var_121_0.skin:set(tonumber(var_121_5))
		elseif #arg_121_2.defaultSkin > 0 then
			local var_121_6 = OPERATOR.GetSkinID(arg_121_2.defaultSkin)

			if #var_121_6 > 0 then
				var_121_0.skin:set(tonumber(var_121_6))
			end
		end
	end

	if var_121_2 == 0 or not LOOT.IsUnlocked(arg_121_0, LOOT.itemTypes.OPERATOR_EXECUTION, OPERATOR.GetExecutionRef(var_121_2)) then
		local var_121_7 = OPERATOR.GetFirstUnlockedExecution(arg_121_1, arg_121_0)

		if var_121_7 then
			local var_121_8 = OPERATOR.GetExecutionID(var_121_7)

			var_121_0.execution:set(tonumber(var_121_8))
		elseif #arg_121_2.defaultExecution > 0 then
			local var_121_9 = OPERATOR.GetExecutionID(arg_121_2.defaultExecution)

			if #var_121_9 > 0 then
				var_121_0.execution:set(tonumber(var_121_9))
			end
		end
	end

	if var_121_3 == 0 or not LOOT.IsUnlocked(arg_121_0, LOOT.itemTypes.OPERATOR_TAUNT, OPERATOR.GetTauntRef(var_121_3)) then
		local var_121_10 = OPERATOR.GetFirstUnlockedTaunt(arg_121_1, arg_121_0)

		if var_121_10 then
			local var_121_11 = OPERATOR.GetQuipID(var_121_10)

			var_121_0.taunt:set(tonumber(var_121_11))
		elseif #arg_121_2.defaultQuip > 0 then
			local var_121_12 = OPERATOR.GetQuipID(arg_121_2.defaultQuip)

			if #var_121_12 > 0 then
				var_121_0.taunt:set(tonumber(var_121_12))
			end
		end
	end
end

function OPERATOR.OutfitMissionSortFn(arg_122_0, arg_122_1)
	if arg_122_0.complete ~= arg_122_1.complete then
		return arg_122_1.complete
	end

	if arg_122_0.unlocked ~= arg_122_1.unlocked then
		return arg_122_0.unlocked
	end

	if arg_122_0.isBattlePassLocked ~= arg_122_1.isBattlePassLocked then
		return not arg_122_0.isBattlePassLocked
	end

	if arg_122_0.progress ~= arg_122_1.progress then
		return arg_122_0.progress > arg_122_1.progress
	end

	return arg_122_0.id < arg_122_1.id
end

function OPERATOR.GetAllOperators(arg_123_0)
	local var_123_0 = {}
	local var_123_1 = {}

	var_123_0.east = {}
	var_123_0.west = {}

	local var_123_2 = StringTable.BFHCAIIDA(CSV.operators.file)

	for iter_123_0 = 0, var_123_2 - 1 do
		local var_123_3 = CSV.ReadRow(CSV.operators, iter_123_0)
		local var_123_4 = true

		if Engine.GEHBEDCEC() then
			var_123_4 = OPERATOR.IsUnlocked(arg_123_0, var_123_3.ref)
		elseif Engine.ECAJCAJJGF() then
			var_123_4 = not CONDITIONS.IsWeGameGovBanned() or tonumber(var_123_3.weGame) == 1
		end

		if var_123_3 and var_123_4 and tonumber(var_123_3.displayOrder) >= 0 then
			local var_123_5 = var_123_3.ref

			if var_123_3.factionRef ~= "DEFAULT" then
				OPERATOR.ValidateEquippedCustomization(arg_123_0, var_123_5, var_123_3)
			end

			local var_123_6 = var_123_3.factionRef
			local var_123_7 = math.floor(var_123_3.displayOrder)

			var_123_1[var_123_5] = var_123_3

			if tonumber(var_123_3.superfaction) == OPERATOR.SuperFaction.EAST then
				if not var_123_0.east[var_123_6] then
					var_123_0.east[var_123_6] = {}
					var_123_0.east[var_123_6].displayOrder = var_123_7
				end

				var_123_0.east[var_123_6].displayOrder = math.max(var_123_0.east[var_123_6].displayOrder, var_123_7)

				table.insert(var_123_0.east[var_123_6], var_123_3)
			else
				if not var_123_0.west[var_123_6] then
					var_123_0.west[var_123_6] = {}
					var_123_0.west[var_123_6].displayOrder = var_123_7
				end

				var_123_0.west[var_123_6].displayOrder = math.max(var_123_0.west[var_123_6].displayOrder, var_123_7)

				table.insert(var_123_0.west[var_123_6], var_123_3)
			end
		end
	end

	local var_123_8 = OPERATOR.GetOutfitMissionQuestsForOperators(var_123_1, arg_123_0)

	for iter_123_1, iter_123_2 in pairs(var_123_1) do
		local var_123_9 = var_123_8[iter_123_1]

		if var_123_9 then
			table.sort(var_123_9, OPERATOR.OutfitMissionSortFn)

			iter_123_2.outfitMissionQuests = var_123_9
		end
	end

	local var_123_10 = {
		east = OPERATOR.Internal_GetFactionsSortedByDisplayOrder(var_123_0.east, OPERATOR.Internal_SortByDisplayOrder),
		west = OPERATOR.Internal_GetFactionsSortedByDisplayOrder(var_123_0.west, OPERATOR.Internal_SortByDisplayOrder)
	}

	for iter_123_3, iter_123_4 in pairs(var_123_0.east) do
		table.sort(iter_123_4, OPERATOR.Internal_SortByDisplayOrder)
	end

	for iter_123_5, iter_123_6 in pairs(var_123_0.west) do
		table.sort(iter_123_6, OPERATOR.Internal_SortByDisplayOrder)
	end

	return var_123_0, var_123_10
end

function OPERATOR.GetOperatorChallenges(arg_124_0, arg_124_1)
	return OperatorChallenges.BFAGEJGBJD(arg_124_0, tonumber(OPERATOR.GetLootIDFromRef(arg_124_1)))
end

function OPERATOR.GetFunctionalUnlocks(arg_125_0, arg_125_1)
	return {
		6,
		60013
	}
end

function OPERATOR.SwitchFactionEast(arg_126_0)
	if arg_126_0.previousState ~= arg_126_0.currentState or arg_126_0.currentState == OPERATOR.SuperFaction.EAST then
		return
	end

	if arg_126_0.isCustomizationMenu then
		Engine.DHFCHIIJCA("character_faction_select_r_detail")
	else
		Engine.DHFCHIIJCA("character_faction_select_r")
	end

	arg_126_0.currentState = OPERATOR.SuperFaction.EAST

	return true
end

function OPERATOR.SwitchFactionWest(arg_127_0)
	if arg_127_0.previousState ~= arg_127_0.currentState or arg_127_0.currentState == OPERATOR.SuperFaction.WEST then
		return
	end

	if arg_127_0.isCustomizationMenu then
		Engine.DHFCHIIJCA("character_faction_select_l_detail")
	else
		Engine.DHFCHIIJCA("character_faction_select_l")
	end

	arg_127_0.currentState = OPERATOR.SuperFaction.WEST

	return true
end

function OPERATOR.SwitchFaction(arg_128_0)
	if arg_128_0.currentState == OPERATOR.SuperFaction.WEST then
		return OPERATOR.SwitchFactionEast(arg_128_0)
	else
		return OPERATOR.SwitchFactionWest(arg_128_0)
	end
end

function OPERATOR.GetClientCharacterForSuperFaction(arg_129_0)
	if arg_129_0 == OPERATOR.SuperFaction.WEST then
		return FrontEndScene.ClientCharacters.OperatorWest
	end

	return FrontEndScene.ClientCharacters.OperatorEast
end

function OPERATOR.IsOperatorMissionsAvailable(arg_130_0, arg_130_1)
	local var_130_0 = LUI.FlowManager.GetScopedData(arg_130_0)
	local var_130_1 = arg_130_0.currentState == OPERATOR.SuperFaction.WEST and var_130_0.operatorData.westSelectedOperatorOutfitMissionQuests or var_130_0.operatorData.eastSelectedOperatorOutfitMissionQuests

	return var_130_1 and #var_130_1 > 0
end

function OPERATOR.OpenOperatorMissions(arg_131_0, arg_131_1, arg_131_2)
	local var_131_0 = LUI.FlowManager.GetScopedData(arg_131_0)

	var_131_0.operatorData.currentState = arg_131_0.currentState
	var_131_0.operatorData.useSelectedOperatorIndexForFocus = true

	local var_131_1 = arg_131_0.currentState == OPERATOR.SuperFaction.WEST and var_131_0.operatorData.westSelectedOperator or var_131_0.operatorData.eastSelectedOperator
	local var_131_2 = arg_131_0.currentState == OPERATOR.SuperFaction.WEST and var_131_0.operatorData.westSelectedOperatorOutfitMissionQuests or var_131_0.operatorData.eastSelectedOperatorOutfitMissionQuests
	local var_131_3 = var_131_1 == arg_131_2

	LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_131_1, false, {
		operatorRef = var_131_1,
		outfitMissionQuests = var_131_2,
		isActive = var_131_3
	})
end

function OPERATOR.GetPetCharacterForSuperFaction(arg_132_0)
	if arg_132_0 == OPERATOR.SuperFaction.WEST then
		return FrontEndScene.ClientCharacters.WestGoodBoy
	end

	return FrontEndScene.ClientCharacters.EastGoodGirl
end

function OPERATOR.IsOperatorBioAvailable(arg_133_0, arg_133_1)
	local var_133_0 = LUI.FlowManager.GetScopedData(arg_133_0)
	local var_133_1 = arg_133_0.currentState == OPERATOR.SuperFaction.WEST and var_133_0.operatorData.westSelectedOperator or var_133_0.operatorData.eastSelectedOperator

	return not OPERATOR.IsDefaultOperator(var_133_1)
end

function OPERATOR.OpenOperatorBio(arg_134_0, arg_134_1)
	local var_134_0 = LUI.FlowManager.GetScopedData(arg_134_0)

	var_134_0.operatorData.currentState = arg_134_0.currentState
	var_134_0.operatorData.useSelectedOperatorIndexForFocus = true

	local var_134_1 = arg_134_0.currentState == OPERATOR.SuperFaction.WEST and var_134_0.operatorData.westSelectedOperator or var_134_0.operatorData.eastSelectedOperator
	local var_134_2 = OPERATOR.GetOperatorFactionRef(var_134_1)

	LUI.FlowManager.RequestPopupMenu(nil, "OperatorBio", true, arg_134_1, false, {
		operatorRef = var_134_1,
		operatorList = arg_134_0._currentOperators[var_134_2],
		menu = arg_134_0
	})
end

function OPERATOR.IsOperatorSubMenuAvailable(arg_135_0, arg_135_1, arg_135_2)
	local var_135_0 = arg_135_0:GetSelectedOperator()

	if var_135_0 then
		local var_135_1 = OPERATOR.IsDefaultOperator(var_135_0)
		local var_135_2 = OPERATOR.IsUnlocked(arg_135_1, var_135_0)
		local var_135_3 = not var_135_1 or var_135_1 and Dvar.IBEGCHEFE("LMTKOLOLTK")

		if not var_135_2 or arg_135_2 == "OperatorCustomization" and not var_135_3 then
			return false
		end
	else
		return false
	end

	if arg_135_0.previousState ~= arg_135_0.currentState then
		return false
	end

	return true
end

function OPERATOR.CheckForAdditionalSubMenuOptions(arg_136_0, arg_136_1)
	if arg_136_1 == "OperatorCustomization" then
		local var_136_0 = arg_136_0:GetSelectedOperator()

		if var_136_0 then
			local var_136_1 = OPERATOR.IsDefaultOperator(var_136_0)

			return {
				showSkins = true,
				showExecutions = true,
				showTaunts = not var_136_1
			}
		end
	end
end

function OPERATOR.OpenOperatorSubMenu(arg_137_0, arg_137_1, arg_137_2)
	local var_137_0 = LUI.FlowManager.GetScopedData(arg_137_0)

	var_137_0.menuName = arg_137_2
	var_137_0.operatorData.currentState = arg_137_0.currentState
	var_137_0.operatorData.useSelectedOperatorIndexForFocus = true
	var_137_0.operatorData.operatorInfo = arg_137_0.operatorInfo

	LUI.FlowManager.RequestAddMenu(arg_137_2, false, arg_137_1, false, {
		operatorData = var_137_0.operatorData,
		menuOptions = OPERATOR.CheckForAdditionalSubMenuOptions(arg_137_0, arg_137_2)
	})
end

function OPERATOR.PlayFullscreenIntroVideo(arg_138_0, arg_138_1, arg_138_2)
	Engine.EBCGADABJ()

	local var_138_0 = {
		restartVideo = true,
		video = arg_138_1
	}

	LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, arg_138_2, false, var_138_0)
end

function OPERATOR.GetOperatorRefByLootTypeAndID(arg_139_0, arg_139_1, arg_139_2)
	local var_139_0 = LOOT.GetItemRef(arg_139_0, arg_139_1)
	local var_139_1

	if arg_139_0 == LOOT.OperatorLootTypes.Skin then
		if OPERATOR.IsSkinGlobal(var_139_0) then
			var_139_1 = OPERATOR.GetFavoriteOperatorRef(arg_139_2)

			local var_139_2 = OPERATOR.IsDefaultOperator(var_139_1)
			local var_139_3 = OPERATOR.IsLaunchOperator(var_139_1)

			if var_139_2 or not var_139_3 then
				local var_139_4 = OPERATOR.GetSelectedOperatorIndex(arg_139_2)

				var_139_1 = OPERATOR.GetDefaultLaunchOperatorForSuperfaction(var_139_4)
			end
		else
			var_139_1 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, var_139_0, CSV.operatorSkins.cols.operatorRef)
		end
	elseif arg_139_0 == LOOT.OperatorLootTypes.Taunt then
		var_139_1 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, var_139_0, CSV.operatorQuips.cols.operatorRef)
	elseif arg_139_0 == LOOT.OperatorLootTypes.Execution then
		if OPERATOR.IsExecutionGlobal(var_139_0) then
			var_139_1 = OPERATOR.GetFavoriteOperatorRef(arg_139_2)
		else
			var_139_1 = StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, var_139_0, CSV.operatorExecutions.cols.operatorRef)
		end
	end

	return var_139_1
end

function OPERATOR.GetCosmeticRefByLootTypeAndIndex(arg_140_0, arg_140_1)
	local var_140_0

	if arg_140_0 == LOOT.OperatorLootTypes.Skin then
		var_140_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, arg_140_1, CSV.operatorSkins.cols.ref)
	elseif arg_140_0 == LOOT.OperatorLootTypes.Taunt then
		var_140_0 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.lootIndex, arg_140_1, CSV.operatorQuips.cols.ref)
	elseif arg_140_0 == LOOT.OperatorLootTypes.Execution then
		var_140_0 = StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.lootIndex, arg_140_1, CSV.operatorExecutions.cols.ref)
	end

	return var_140_0
end

function OPERATOR.OperatorHasNewLoots(arg_141_0, arg_141_1)
	for iter_141_0, iter_141_1 in pairs(LOOT.OperatorLootTypes) do
		local var_141_0 = Loot.BCBAGDEJAJ(arg_141_0, LOOT.typeNames[iter_141_1])

		if var_141_0 and #var_141_0 > 0 then
			for iter_141_2, iter_141_3 in ipairs(var_141_0) do
				if OPERATOR.GetOperatorRefByLootTypeAndID(iter_141_1, iter_141_3, arg_141_0) == arg_141_1 then
					return true
				end
			end
		end
	end

	return false
end

function OPERATOR.ClearOperatorBreadcrumbs(arg_142_0)
	for iter_142_0, iter_142_1 in pairs(LOOT.OperatorLootTypes) do
		Loot.GADJEFJEA(arg_142_0, LOOT.typeNames[iter_142_1])
	end

	Loot.GADJEFJEA(arg_142_0, LOOT.typeNames[LOOT.itemTypes.OPERATOR])
end

function OPERATOR.GetNewLootsByOperatorAndType(arg_143_0, arg_143_1, arg_143_2)
	local var_143_0 = {}
	local var_143_1 = Loot.BCBAGDEJAJ(arg_143_0, LOOT.typeNames[arg_143_2])

	if var_143_1 and #var_143_1 > 0 then
		for iter_143_0, iter_143_1 in ipairs(var_143_1) do
			if OPERATOR.GetOperatorRefByLootTypeAndID(arg_143_2, iter_143_1, arg_143_0) == arg_143_1 then
				table.insert(var_143_0, iter_143_1)
			end
		end
	end

	return var_143_0
end

function OPERATOR.GetOperatorRefsByFaction(arg_144_0, arg_144_1)
	local var_144_0 = {}
	local var_144_1 = StringTable.BFHCAIIDA(CSV.operators.file)

	for iter_144_0 = 0, var_144_1 - 1 do
		local var_144_2 = CSV.ReadRow(CSV.operators, iter_144_0)

		if var_144_2 and (not CONDITIONS.IsWeGameGovBanned() or tonumber(var_144_2.weGame) == 1) and tonumber(var_144_2.superfaction) == arg_144_1 then
			table.insert(var_144_0, var_144_2.ref)
		end
	end

	return var_144_0
end

function OPERATOR.FactionHasNewLoots(arg_145_0, arg_145_1)
	local var_145_0 = OPERATOR.GetOperatorRefsByFaction(arg_145_0, arg_145_1)

	for iter_145_0, iter_145_1 in ipairs(var_145_0) do
		local var_145_1 = OPERATOR.IsUnlocked(arg_145_0, iter_145_1)
		local var_145_2 = OPERATOR.IsDefaultOperator(iter_145_1)

		if var_145_1 and not var_145_2 then
			local var_145_3 = OPERATOR.GetLootIDFromRef(iter_145_1)

			if Loot.HDJCADADF(arg_145_0, var_145_3) or OPERATOR.OperatorHasNewLoots(arg_145_0, iter_145_1) then
				return true
			end
		end
	end

	return false
end

function OPERATOR.ShouldShowGhostTeaser(arg_146_0)
	return false
end

function OPERATOR.ShowGhostTeaser(arg_147_0, arg_147_1)
	if arg_147_1.showingGhost then
		return
	end

	local var_147_0 = LUI.UIElement.new()

	arg_147_1:addElement(var_147_0)

	arg_147_1.showingGhost = true

	local var_147_1

	local function var_147_2()
		local var_148_0 = "chr_menu_mp_squad_mag_tease_05"
		local var_148_1 = false

		if var_147_0._lastPlayedAnim ~= nil then
			if var_147_0._lastPlayedAnim == "chr_menu_mp_squad_mag_tease_05" then
				var_148_0 = "chr_menu_mp_squad_mag_tease_05_copy"
				var_148_1 = true
			else
				var_148_0 = "chr_menu_mp_squad_mag_tease_05"
			end
		end

		local var_148_2 = OPERATOR.ShouldShowGhostTeaser(arg_147_0)

		OPERATOR.UpdateClientCharacter(FrontEndScene.ClientCharacters.Ghost, arg_147_0, "body_mp_western_ghost_1_1_fe", "head_mp_western_ghost_1_1", var_148_0, nil, "iw8_ar_scharlie_mpv2+rec_scharlie|1+back_scharlie|1+mag_scharlie|1+selectsemi+barlong_scharlie_v2|3+ammomod_wound+pistolgrip02_scharlie_v2|1+vzscope_mike14_ar", "iw8_pi_cpapa_mp+rec_cpapa+front_cpapa+ammo_cpapa+backno_cpapa+ironsdefault_cpapa", var_148_2, WATCH.WatchNoneValue)

		var_147_0._lastPlayedAnim = var_148_0

		local var_148_3 = 20000
		local var_148_4 = 20000

		if var_148_1 then
			var_148_3 = 60000
			var_148_4 = 90000
		end

		var_147_0:Wait(math.random(var_148_3, var_148_4), true).onComplete = var_147_2
	end

	var_147_0:Wait(math.random(20000, 30000), true).onComplete = var_147_2
end

function OPERATOR.Internal_SortByDisplayOrder(arg_149_0, arg_149_1)
	return tonumber(arg_149_0.displayOrder) < tonumber(arg_149_1.displayOrder)
end

function OPERATOR.Internal_GetFactionsSortedByDisplayOrder(arg_150_0)
	local var_150_0 = {}

	for iter_150_0 in pairs(arg_150_0) do
		table.insert(var_150_0, iter_150_0)
	end

	table.sort(var_150_0, function(arg_151_0, arg_151_1)
		return OPERATOR.Internal_SortByDisplayOrder(arg_150_0[arg_151_0], arg_150_0[arg_151_1])
	end)

	return var_150_0
end
