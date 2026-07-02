Cac = Cac or {}
EQUIPMENT = EQUIPMENT or {}
EQUIPMENT.lethalSlot = 1
EQUIPMENT.tacticalSlot = 2
Cac.powerNoneValue = "none"
Cac.SPPowerState = {
	LOCKED = "locked",
	UPGRADE_TWO = "upgrade2",
	UPGRADE_ONE = "upgrade1",
	SCANNED = "scanned",
	UNLOCKED = "unlocked"
}
Cac.SPHands = {
	OFFHAND = 0,
	ITEM = 1
}

function Cac.GetPowerDesc(arg_1_0)
	assert(arg_1_0)

	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.powers.file, CSV.powers.cols.ref, tostring(arg_1_0), CSV.powers.cols.desc))
end

function Cac.GetPowerUpgradeOneDesc(arg_2_0)
	assert(arg_2_0)

	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.powers.file, CSV.powers.cols.ref, tostring(arg_2_0), CSV.powers.cols.upgradeOneText))
end

function Cac.GetPowerUpgradeTwoDesc(arg_3_0)
	assert(arg_3_0)

	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.powers.file, CSV.powers.cols.ref, tostring(arg_3_0), CSV.powers.cols.upgradeTwoText))
end

function EQUIPMENT.GetImageLarge(arg_4_0)
	return StringTable.DIFCHIGDFB(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, arg_4_0, CSV.MPEquipment.cols.iconLarge)
end

function EQUIPMENT.GetName(arg_5_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, arg_5_0, CSV.MPEquipment.cols.nameRef))
end

function EQUIPMENT.GetModel(arg_6_0)
	return StringTable.DIFCHIGDFB(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, arg_6_0, CSV.MPEquipment.cols.model)
end

function EQUIPMENT.GetImage(arg_7_0)
	return StringTable.DIFCHIGDFB(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, arg_7_0, CSV.MPEquipment.cols.image)
end

function EQUIPMENT.GetProgressionImage(arg_8_0)
	return StringTable.DIFCHIGDFB(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, arg_8_0, CSV.MPEquipment.cols.progressionImage)
end

function EQUIPMENT.GetTutorialVideo(arg_9_0)
	return tostring(StringTable.DIFCHIGDFB(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, arg_9_0, CSV.MPEquipment.cols.tutorialVideo))
end

function EQUIPMENT.GetDesc(arg_10_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.MPEquipment.file, CSV.MPEquipment.cols.ref, arg_10_0, CSV.MPEquipment.cols.desc))
end

function Cac.GetPowerImage(arg_11_0)
	return StringTable.DIFCHIGDFB(CSV.powers.file, CSV.powers.cols.ref, arg_11_0, CSV.powers.cols.image)
end

function Cac.GetPowerSmallRender(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.powers.file, CSV.powers.cols.ref, arg_12_0, CSV.powers.cols.smallRender)
end

function Cac.IsExtraPowerInUse(arg_13_0)
	return arg_13_0 == 1
end

function Cac.ClearPower(arg_14_0, arg_14_1)
	if Engine.EAAHGICFBD() then
		arg_14_0.power:SetValue(arg_14_1, Cac.powerNoneValue)
		arg_14_0.lootItemID:SetValue(arg_14_1, Cac.BaseLootID)
		Cac.ClearExtraPower(arg_14_0, arg_14_1)
	else
		arg_14_0:SetValue(arg_14_1, Cac.powerNoneValue)
	end
end

function Cac.ClearExtraPower(arg_15_0, arg_15_1)
	arg_15_0.extraCharge:SetValue(arg_15_1, 0)
end

function Cac.GetSPPowerUpgradeCost(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.ref:GetValue(arg_16_1)
	local var_16_1 = DataSources.inGame.SP.player.equipmentState[var_16_0]:GetValue(arg_16_1)

	if var_16_1 == Cac.SPPowerState.UNLOCKED or var_16_1 == Cac.SPPowerState.UPGRADE_ONE then
		local var_16_2

		if var_16_1 == Cac.SPPowerState.UNLOCKED then
			var_16_2 = arg_16_0.upgradeOneCost:GetValue(arg_16_1)
		else
			var_16_2 = arg_16_0.upgradeTwoCost:GetValue(arg_16_1)
		end

		return var_16_2
	else
		return 0
	end
end

function Cac.GetSPPowerStateText(arg_17_0)
	assert(Engine.CAADCDEEIA())

	if arg_17_0 == Cac.SPPowerState.UNLOCKED then
		return ""
	elseif arg_17_0 == Cac.SPPowerState.UPGRADE_ONE then
		return Engine.CBBHFCGDIC("MENU_SP/V1")
	elseif arg_17_0 == Cac.SPPowerState.UPGRADE_TWO then
		return Engine.CBBHFCGDIC("MENU_SP/V2")
	else
		return ""
	end
end

function Cac.GetSPPowerHandFromSlot(arg_18_0, arg_18_1)
	return arg_18_1 == Cac.SPHands.OFFHAND and arg_18_0.offhandPowers or arg_18_0.powers
end

function Cac.GetPowerUnlockRank(arg_19_0)
	return StringTable.DIFCHIGDFB(CSV.powerUnlockTable.file, CSV.powerUnlockTable.cols.ref, arg_19_0, CSV.powerUnlockTable.cols.unlockRank)
end

function EQUIPMENT.GetLethalStats(arg_20_0)
	local var_20_0 = {}

	for iter_20_0 = 0, StringTable.BFHCAIIDA(CSV.MPEquipment.file) do
		local var_20_1 = CSV.ReadRow(CSV.MPEquipment, iter_20_0)

		if var_20_1 ~= nil and tonumber(var_20_1.uiSlot) == EQUIPMENT.lethalSlot and tonumber(var_20_1.uiOrder) >= 0 then
			local var_20_2 = PlayerData.BFFBGAJGD(arg_20_0, CoD.StatsGroup.Ranked).playerStats.lethalStats[var_20_1.ref]

			if var_20_2 == nil then
				DebugPrint(var_20_1.ref .. " does not exist in lethalStats")
			else
				var_20_1.uses = var_20_2.uses:get()
				var_20_1.kills = var_20_2.kills:get()
				var_20_1.killsPerUse = var_20_1.kills / (var_20_1.uses ~= 0 and var_20_1.uses or 1)

				table.insert(var_20_0, var_20_1)
			end
		end
	end

	return var_20_0
end

function EQUIPMENT.GetTacticalStats(arg_21_0)
	local var_21_0 = {}

	for iter_21_0 = 0, StringTable.BFHCAIIDA(CSV.MPEquipment.file) do
		local var_21_1 = CSV.ReadRow(CSV.MPEquipment, iter_21_0)

		if var_21_1 ~= nil and tonumber(var_21_1.uiSlot) == EQUIPMENT.tacticalSlot and tonumber(var_21_1.uiOrder) >= 0 then
			local var_21_2 = PlayerData.BFFBGAJGD(arg_21_0, CoD.StatsGroup.Ranked).playerStats.tacticalStats[var_21_1.ref]

			if var_21_2 == nil then
				DebugPrint(var_21_1.ref .. " does not exist in tacticalStats")
			else
				var_21_1.uses = var_21_2.uses:get()
				var_21_1.extraStat1 = var_21_2.extraStat1:get()

				table.insert(var_21_0, var_21_1)
			end
		end
	end

	return var_21_0
end
