MUNITION = MUNITION or {}
MUNITION.none = "none"

function MUNITION.GetImage(arg_1_0)
	local var_1_0 = StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.ref, arg_1_0, CSV.munitions.cols.icon)

	return var_1_0 == "" and "white" or var_1_0
end

function MUNITION.GetRechargeLabel(arg_2_0)
	local var_2_0 = tonumber(StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_2_0, CSV.cpFieldUpgrades.cols.rechargeRate))

	if var_2_0 == SUPER.RechargeSpeed.FAST then
		return Engine.CBBHFCGDIC("LUA_MENU/RECHARGE_FAST")
	elseif var_2_0 == SUPER.RechargeSpeed.MEDIUM then
		return Engine.CBBHFCGDIC("LUA_MENU/RECHARGE_MEDIUM")
	elseif var_2_0 == SUPER.RechargeSpeed.SLOW then
		return Engine.CBBHFCGDIC("LUA_MENU/RECHARGE_SLOW")
	else
		return Engine.CBBHFCGDIC("MENU/NONE")
	end
end

function MUNITION.GetRechargeColor(arg_3_0)
	local var_3_0 = tonumber(StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_3_0, CSV.cpFieldUpgrades.cols.rechargeRate))

	if var_3_0 == SUPER.RechargeSpeed.FAST then
		return SWATCHES.Recharge.RechargeFast
	elseif var_3_0 == SUPER.RechargeSpeed.MEDIUM then
		return SWATCHES.Recharge.RechargeMedium
	elseif var_3_0 == SUPER.RechargeSpeed.SLOW then
		return SWATCHES.Recharge.RechargeSlow
	else
		return SWATCHES.genericMenu.mainTitle
	end
end

function MUNITION.AreAllSlotsFilled(arg_4_0)
	for iter_4_0, iter_4_1 in ddlpairs(arg_4_0) do
		if iter_4_1.munition:get() == MUNITION.none then
			return false
		end
	end

	return true
end

function MUNITION.GetCost(arg_5_0)
	return StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.ref, arg_5_0, CSV.munitions.cols.coolDown)
end

function MUNITION.SortPlayerData(arg_6_0)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in ddlpairs(arg_6_0) do
		local var_6_1 = iter_6_1.munition:get()

		table.insert(var_6_0, {
			ref = var_6_1,
			cost = tonumber(MUNITION.GetCost(var_6_1)) or 0,
			index = iter_6_0
		})
	end

	table.sort(var_6_0, function(arg_7_0, arg_7_1)
		if arg_7_0.index ~= 3 and arg_7_1.index ~= 3 then
			if arg_7_0.ref == MUNITION.none and arg_7_1.ref ~= MUNITION.none then
				return false
			elseif arg_7_1.ref == MUNITION.none and arg_7_0.ref ~= MUNITION.none then
				return true
			end

			return arg_7_0.cost < arg_7_1.cost
		end
	end)

	for iter_6_2, iter_6_3 in ddlpairs(arg_6_0) do
		local var_6_2 = var_6_0[iter_6_2 + 1].ref

		iter_6_3.munition:set(var_6_2)
	end
end

function MUNITION.GetRoleImage(arg_8_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_8_0, CSV.cpFieldUpgrades.cols.uiImageSmall)
end

function MUNITION.GetRoleImageLarge(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_9_0, CSV.cpFieldUpgrades.cols.uiImageLarge)
end

function MUNITION.GetRoleName(arg_10_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_10_0, CSV.cpFieldUpgrades.cols.uiName)
end

function MUNITION.GetShowcaseImage(arg_11_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_11_0, CSV.cpFieldUpgrades.cols.showcaseImage)
end

function MUNITION.GetFieldUpgradeName(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_12_0, CSV.cpFieldUpgrades.cols.fieldUpgradeName)
end

function MUNITION.GetFieldUpgradeDesc(arg_13_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_13_0, CSV.cpFieldUpgrades.cols.fieldUpgradeDesc)
end

function MUNITION.GetFieldUpgradeImage(arg_14_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_14_0, CSV.cpFieldUpgrades.cols.fieldUpgradeImage)
end

function MUNITION.GetPassiveName(arg_15_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_15_0, CSV.cpFieldUpgrades.cols.passiveName)
end

function MUNITION.GetPassiveDesc(arg_16_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_16_0, CSV.cpFieldUpgrades.cols.passiveDesc)
end

function MUNITION.GetPassiveImage(arg_17_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_17_0, CSV.cpFieldUpgrades.cols.passiveImage)
end

function MUNITION.GetProgressionImage(arg_18_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_18_0, CSV.cpFieldUpgrades.cols.progressionImage)
end

function MUNITION.GetProgressionDesc(arg_19_0)
	return StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, arg_19_0, CSV.cpFieldUpgrades.cols.progressionDesc)
end

function MUNITION.GetAllFieldUpgradeRefs()
	local var_20_0 = -1
	local var_20_1 = {}
	local var_20_2 = {}

	for iter_20_0 = 0, StringTable.BFHCAIIDA(CSV.cpFieldUpgrades.file) do
		local var_20_3 = CSV.ReadRow(CSV.cpFieldUpgrades, iter_20_0)

		if #var_20_3.ref > 0 and tonumber(var_20_3.menuPriority) ~= var_20_0 then
			table.insert(var_20_1, var_20_3)
		end
	end

	table.sort(var_20_1, function(arg_21_0, arg_21_1)
		return tonumber(arg_21_0.menuPriority) < tonumber(arg_21_1.menuPriority)
	end)

	for iter_20_1, iter_20_2 in ipairs(var_20_1) do
		table.insert(var_20_2, iter_20_2.ref)
	end

	return var_20_2
end

function MUNITION.GetTutorialVideo(arg_22_0)
	return StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.ref, arg_22_0, CSV.munitions.cols.tutorialVideo)
end
