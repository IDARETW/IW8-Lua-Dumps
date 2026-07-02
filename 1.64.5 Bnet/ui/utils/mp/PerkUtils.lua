Cac = Cac or {}
PERK = PERK or {}
Cac.perkNoneValue = "specialty_null"
PERK.perkOverkill = "specialty_twoprimaries"
PERK.perkIncludesOverkill = "perkpackage_munitions"
PERK.perkMunitions = "specialty_munitions"
PERK.perkMunitions2 = "specialty_munitions_2"
PERK.perkPointman = "specialty_strategist"
PERK.perkKillchain = "specialty_heavy_metal"
PERK.perkDoubleTime = "specialty_hustle"
PERK.perkHardline = "specialty_hardline"
PERK.PERK_PACKAGE_STATES = {
	NoPackage = 0,
	Upgrade1Selected = 3,
	SelectUpgrade = 2,
	Upgrade2Selected = 4,
	ReadyToUpgrade = 1
}
PERK.PERK_TYPES = {
	FIRST = "1",
	SEDOND = "2",
	THIRD = "3"
}

function PERK.GetImage(arg_1_0)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_1_0, CSV.perks.cols.image)
end

function PERK.GetProgressionImage(arg_2_0)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_2_0, CSV.perks.cols.progressionImage)
end

function PERK.GetBWImage(arg_3_0)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_3_0, CSV.perks.cols.BWImage)
end

function PERK.GetModel(arg_4_0)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_4_0, CSV.perks.cols.model)
end

function PERK.GetSourceModel(arg_5_0)
	local var_5_0 = StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_5_0, CSV.perks.cols.sourceModel)

	if var_5_0 == nil or var_5_0 == "" then
		return "tag_origin"
	else
		return var_5_0
	end
end

function PERK.GetSpecialistModel(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_6_0, CSV.perks.cols.specialistModel)
end

function PERK.IsPointmanActive(arg_7_0)
	if Engine.DDJFBBJAIG() then
		return nil
	end

	local var_7_0 = #DataSources.inGame.player.perkListOmnvars

	for iter_7_0 = 1, var_7_0 do
		local var_7_1 = DataSources.inGame.player.perkListOmnvars[iter_7_0]:GetValue(arg_7_0)

		if var_7_1 and var_7_1 >= 0 and StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.index, var_7_1, CSV.perks.cols.ref) == PERK.perkPointman then
			return true
		end
	end

	return false
end

function PERK.SubscribeToChanges(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = #DataSources.inGame.player.perkListOmnvars

	for iter_8_0 = 1, var_8_0 do
		arg_8_0:SubscribeToModel(DataSources.inGame.player.perkListOmnvars[iter_8_0]:GetModel(arg_8_1), arg_8_2)
	end
end

function PERK.IsPerkOverkill(arg_9_0)
	return arg_9_0 == PERK.perkOverkill or arg_9_0 == PERK.perkIncludesOverkill or arg_9_0 == PERK.perkMunitions or arg_9_0 == PERK.perkMunitions2
end

function PERK.FixOverkillKillchainPerkSwap(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = PlayerData.BFFBGAJGD(arg_10_0, arg_10_1, CoD.PlayMode.Core, arg_10_2).squadMembers.loadouts

	for iter_10_0 = 0, #var_10_0 - 1 do
		local var_10_1 = var_10_0[iter_10_0]
		local var_10_2 = var_10_1.loadoutPerks[0]:get()
		local var_10_3 = var_10_1.loadoutPerks[1]:get()
		local var_10_4 = PERK.IsPerkOverkill(var_10_2)
		local var_10_5 = PERK.perkKillchain == var_10_3

		if var_10_5 and var_10_4 then
			var_10_1.loadoutPerks[0]:set(PERK.perkKillchain)
			var_10_1.loadoutPerks[1]:set(PERK.perkMunitions2)
		elseif var_10_5 then
			var_10_1.loadoutPerks[1]:set(PERK.perkHardline)
		elseif var_10_4 then
			var_10_1.loadoutPerks[0]:set(PERK.perkDoubleTime)
			var_10_1.loadoutPerks[1]:set(PERK.perkMunitions2)
		end
	end
end

function PERK.ValidatePlayerData(arg_11_0, arg_11_1)
	local var_11_0 = PlayerData.BFFBGAJGD(arg_11_0, CoD.StatsGroup.NonGame, CoD.PlayMode.Core, arg_11_1)
	local var_11_1 = MP_COMMON.postShipFlags.overkillSwap

	if var_11_0.postShipFlags[var_11_1]:get() < 1 then
		PERK.FixOverkillKillchainPerkSwap(arg_11_0, CoD.StatsGroup.RankedLoadouts, arg_11_1)
		PERK.FixOverkillKillchainPerkSwap(arg_11_0, CoD.StatsGroup.PrivateLoadouts, arg_11_1)

		if CONDITIONS.AreWZLoadoutsEnabled() then
			PERK.FixOverkillKillchainPerkSwap(arg_11_0, CoD.StatsGroup.WZRankedLoadouts, arg_11_1)
			PERK.FixOverkillKillchainPerkSwap(arg_11_0, CoD.StatsGroup.WZPrivateLoadouts, arg_11_1)
		end

		var_11_0.postShipFlags[var_11_1]:set(1)
	end
end

function Cac.GetPerkFullImage(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_12_0, CSV.perks.cols.fullImage)
end

function Cac.GetTraitManufacturersImage(arg_13_0)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_13_0, CSV.perks.cols.manufacturersImage)
end

function PERK.GetName(arg_14_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_14_0, CSV.perks.cols.name))
end

function Cac.GetPerkIndex(arg_15_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_15_0, CSV.perks.cols.index))
end

function PERK.GetPerkPatchNotes(arg_16_0)
	return StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_16_0, CSV.perks.cols.patchNotes)
end

function Cac.GetPerkDesc(arg_17_0)
	if CONDITIONS.IsMagmaGameMode() then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_17_0, CSV.perks.cols.brDesc))
	elseif not CONDITIONS.IsThirdGameMode() then
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_17_0, CSV.perks.cols.desc))
	else
		return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_17_0, CSV.perks.cols.cpDesc))
	end
end

function Cac.GetIsPerkDisabledForBR(arg_18_0)
	local var_18_0 = StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, arg_18_0, CSV.perks.cols.brDisabled)

	if var_18_0 and var_18_0 ~= "" then
		return tonumber(var_18_0) == 1
	else
		return false
	end
end

function Cac.IsPerkInUse(arg_19_0)
	return arg_19_0 ~= Cac.perkNoneValue and arg_19_0 ~= ""
end

function Cac.IsPerkSlotInUse(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1.perk:GetValue(arg_20_0)
	local var_20_1 = arg_20_1.extraPerk:GetValue(arg_20_0)

	return Cac.IsPerkInUse(var_20_0), Cac.IsPerkInUse(var_20_1)
end

function Cac.GetPerkSlot(arg_21_0, arg_21_1)
	local var_21_0

	if arg_21_1 == 0 then
		var_21_0 = arg_21_0.perkSlotOne
	elseif arg_21_1 == 1 then
		var_21_0 = arg_21_0.perkSlotTwo
	else
		var_21_0 = arg_21_0.perkSlotThree
	end

	return var_21_0
end

function Cac.GetNumPerksEquipped(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.perk:GetValue(arg_22_0)
	local var_22_1 = arg_22_1.extraPerk:GetValue(arg_22_0)

	if Cac.IsPerkInUse(var_22_1) then
		return 2
	elseif Cac.IsPerkInUse(var_22_0) then
		return 1
	else
		return 0
	end
end

function Cac.GetPerkSlotDataSourceByEquippedRef(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_1.perkSlotOne.perk:GetValue(arg_23_0) == arg_23_2 then
		return arg_23_1.perkSlotOne, false
	elseif arg_23_1.perkSlotOne.extraPerk:GetValue(arg_23_0) == arg_23_2 then
		return arg_23_1.perkSlotOne, true
	elseif arg_23_1.perkSlotTwo.perk:GetValue(arg_23_0) == arg_23_2 then
		return arg_23_1.perkSlotTwo, false
	elseif arg_23_1.perkSlotTwo.extraPerk:GetValue(arg_23_0) == arg_23_2 then
		return arg_23_1.perkSlotTwo, true
	elseif arg_23_1.perkSlotThree.perk:GetValue(arg_23_0) == arg_23_2 then
		return arg_23_1.perkSlotThree, false
	elseif arg_23_1.perkSlotThree.extraPerk:GetValue(arg_23_0) == arg_23_2 then
		return arg_23_1.perkSlotThree, true
	end

	return nil, false
end

function Cac.GetPerkSlotDataSourceByIndex(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = {
		arg_24_1.perkSlotOne,
		arg_24_1.perkSlotTwo,
		arg_24_1.perkSlotThree
	}

	assert(arg_24_2 < #var_24_0)

	return var_24_0[arg_24_2 + 1]
end

function Cac.GetPerkSlotName(arg_25_0)
	local var_25_0 = {
		"LUA_MENU_MP/PERK_SLOT_ONE_SHORT_CAPS",
		"LUA_MENU_MP/PERK_SLOT_TWO_SHORT_CAPS",
		"LUA_MENU_MP/PERK_SLOT_THREE_SHORT_CAPS"
	}

	assert(arg_25_0 < #var_25_0)

	return Engine.CBBHFCGDIC(var_25_0[arg_25_0 + 1])
end

function Cac.GetPerkSlotNumber(arg_26_0)
	return StringTable.DIFCHIGDFB(CSV.menuPerks.file, CSV.menuPerks.cols.ref, arg_26_0, CSV.menuPerks.cols.slot)
end

function Cac.GetPerkSlotColor(arg_27_0)
	local var_27_0 = {
		SWATCHES.CAC.perkSlotOne,
		SWATCHES.CAC.perkSlotTwo,
		SWATCHES.CAC.perkSlotThree
	}

	assert(arg_27_0 < #var_27_0)

	return GetIntForColor(var_27_0[arg_27_0 + 1])
end

function Cac.GetNonePerkInfoDataSource()
	local var_28_0 = "frontEnd.MP.CAC." .. Cac.perkNoneValue

	return {
		ref = LUI.DataSourceInGlobalModel.new(var_28_0 .. "ref", Cac.perkNoneValue),
		desc = LUI.DataSourceInGlobalModel.new(var_28_0 .. "desc", Cac.GetPerkDesc(Cac.perkNoneValue)),
		name = LUI.DataSourceInGlobalModel.new(var_28_0 .. "name", PERK.GetImage(Cac.perkNoneValue)),
		image = LUI.DataSourceInGlobalModel.new(var_28_0 .. "image", Cac.GetPerkDesc(Cac.perkNoneValue))
	}
end

function Cac.ClearPerk(arg_29_0, arg_29_1)
	arg_29_1:SetValue(arg_29_0, Cac.perkNoneValue)
end
