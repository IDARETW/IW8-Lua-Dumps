module(..., package.seeall)

local function var_0_0()
	return not CONDITIONS.IsThirdGameMode() and not CONDITIONS.InGameAndBR()
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6, arg_2_7, arg_2_8, arg_2_9, arg_2_10)
	arg_2_0.InfoPanel.ItemName:setText(arg_2_2)
	arg_2_0.InfoPanel:SetupPatchNotes(arg_2_1, arg_2_9)

	local var_2_0 = arg_2_0.InfoPanel:UpdateDescription({
		newDesc = arg_2_3,
		isUnlocked = arg_2_4,
		unlockText = arg_2_5,
		isNew = arg_2_6,
		extraDesc = arg_2_7,
		isRestricted = arg_2_8,
		unlockRank = arg_2_10
	})

	if arg_2_0.BRWarningInfoFEPro then
		local var_2_1 = 120 * _1080p
		local var_2_2 = arg_2_0.InfoPanel:GetCurrentAnchorsAndPositions().top
		local var_2_3 = LAYOUT.GetElementHeight(arg_2_0.BRWarningInfoFEPro)

		arg_2_0.BRWarningInfoFEPro:SetTop(var_2_2 + var_2_0 + var_2_1 + var_2_3, 200)
		arg_2_0.BRWarningInfoFEPro:SetBottom(var_2_2 + var_2_0 + var_2_1 + var_2_3 * 2, 200)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.BasePerk:UpdatePerk(arg_3_2.basePerk)
	arg_3_0.UpgradePerk1:UpdatePerk(arg_3_2.upgradePerk1)
	arg_3_0.UpgradePerk2:UpdatePerk(arg_3_2.upgradePerk2)
end

local function var_0_3(arg_4_0, arg_4_1)
	CLIENT_MODEL.SetModel(arg_4_0, arg_4_1)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if CONDITIONS.InFrontend() and arg_5_0.perkType == arg_5_2 then
		if arg_5_2 == Cac.PerkTypes.CORE then
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_PATCH, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.ACTIVE then
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.PASSIVE then
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.SPECIAL_ONE then
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.SPECIAL_TWO then
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.SPECIAL_THREE then
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, arg_5_3)
		end
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_2.perkData
	local var_6_1 = PlayerData.BFFBGAJGD(arg_6_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers
	local var_6_2 = LOADOUT.GetLoadoutSelectedPerk(arg_6_1, arg_6_0.loadoutIndex, arg_6_0.perkLoadoutIndex, LOADOUT.IsSpecialPerk(arg_6_2.perkData.perkType))
	local var_6_3 = MatchRules.CJBJJHJCI(var_6_0.ref)
	local var_6_4 = var_6_2:get() == var_6_0.ref

	if var_6_4 then
		arg_6_0.selectedPerkButton = arg_6_2
		arg_6_0._focusedPerkName = ToUpperCase(Engine.CBBHFCGDIC(var_6_0.name))
	end

	arg_6_2.Text:setText(Engine.CBBHFCGDIC(var_6_0.name))
	arg_6_2.Icon:setImage(RegisterMaterial(var_6_0.image))
	arg_6_2:SetButtonDisabled(not var_6_0.isUnlocked or var_6_0.isConflict or var_6_0.isRestricted)
	arg_6_2:SetButtonConflicted(var_6_0.isConflict, not var_6_0.isUnlocked, var_6_3)
	arg_6_2:SetSelected(var_6_4)
	arg_6_2:SetNew(var_6_0.isNew, var_6_0.ref)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = 1
	local var_7_1 = #arg_7_0.specialPerkTable
	local var_7_2
	local var_7_3
	local var_7_4
	local var_7_5
	local var_7_6
	local var_7_7 = {}

	for iter_7_0 = 1, 3 do
		if iter_7_0 - 1 == arg_7_2 then
			var_7_6 = LOADOUT.GetLoadoutSelectedPerk(arg_7_1, arg_7_0.loadoutIndex, arg_7_2, true):get()
		else
			local var_7_8 = LOADOUT.GetLoadoutSelectedPerk(arg_7_1, arg_7_0.loadoutIndex, iter_7_0 - 1, true):get()

			table.insert(var_7_7, {
				ref = var_7_8,
				perkIndex = iter_7_0 - 1
			})
		end
	end

	if arg_7_3 then
		for iter_7_1 = 1, #var_7_7 do
			if var_7_6 == var_7_7[iter_7_1].ref then
				LOADOUT.SetLoadoutSelectedPerk(arg_7_1, arg_7_0.loadoutIndex, var_7_7[iter_7_1].perkIndex, arg_7_0.lastSelectedPerkRef, true)

				if Engine.DDJFBBJAIG() then
					local var_7_9
					local var_7_10 = LOADOUT.GetPerkDataByField(arg_7_0.lastSelectedPerkRef, CSV.perks.cols.specialistModel)

					if var_7_7[iter_7_1].perkIndex == 0 then
						var_7_9 = CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST
					elseif var_7_7[iter_7_1].perkIndex == 1 then
						var_7_9 = CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST
					elseif var_7_7[iter_7_1].perkIndex == 2 then
						var_7_9 = CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST
					end

					if var_7_9 then
						var_0_3(var_7_9, var_7_10)
					end
				end

				break
			end
		end
	else
		local var_7_11 = var_7_6 == arg_7_0.perk1 or var_7_6 == arg_7_0.perk2 or var_7_6 == arg_7_0.perk3
		local var_7_12 = var_7_6 == Cac.perkNoneValue

		if var_7_11 or var_7_12 then
			while var_7_0 <= var_7_1 do
				local var_7_13 = arg_7_0.specialPerkTable[var_7_0].ref
				local var_7_14 = var_7_13 == arg_7_0.perk1 or var_7_13 == arg_7_0.perk2 or var_7_13 == arg_7_0.perk3 or var_7_13 == var_7_7[1].ref or var_7_13 == var_7_7[2].ref
				local var_7_15 = PROGRESSION.IsUnlocked(arg_7_1, LOOT.itemTypes.PERK, var_7_13)

				if not var_7_14 and var_7_15 then
					LOADOUT.SetLoadoutSelectedPerk(arg_7_1, arg_7_0.loadoutIndex, arg_7_2, var_7_13, true)

					break
				end

				var_7_0 = var_7_0 + 1
			end
		end
	end
end

local function var_0_7(arg_8_0)
	return arg_8_0.perk1 == "specialty_hardline" or arg_8_0.perk2 == "specialty_hardline" or arg_8_0.perk3 == "specialty_hardline"
end

local function var_0_8(arg_9_0)
	return arg_9_0.perk1 == "specialty_strategist" or arg_9_0.perk2 == "specialty_strategist" or arg_9_0.perk3 == "specialty_strategist"
end

local function var_0_9(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_0.perk1 = LOADOUT.GetLoadoutSelectedPerk(arg_10_1, arg_10_0.loadoutIndex, 0):get()
	arg_10_0.perk2 = LOADOUT.GetLoadoutSelectedPerk(arg_10_1, arg_10_0.loadoutIndex, 1):get()
	arg_10_0.perk3 = LOADOUT.GetLoadoutSelectedPerk(arg_10_1, arg_10_0.loadoutIndex, 2):get()

	if arg_10_3 then
		var_0_6(arg_10_0, arg_10_1, arg_10_2, true)
	else
		var_0_6(arg_10_0, arg_10_1, 0, false)
		var_0_6(arg_10_0, arg_10_1, 1, false)
		var_0_6(arg_10_0, arg_10_1, 2, false)
	end

	arg_10_0.specialPerk1 = LOADOUT.GetLoadoutSelectedPerk(arg_10_1, arg_10_0.loadoutIndex, 0, true):get()
	arg_10_0.specialPerk2 = LOADOUT.GetLoadoutSelectedPerk(arg_10_1, arg_10_0.loadoutIndex, 1, true):get()
	arg_10_0.specialPerk3 = LOADOUT.GetLoadoutSelectedPerk(arg_10_1, arg_10_0.loadoutIndex, 2, true):get()

	if arg_10_0.Tabs:IsTabAvailable() and arg_10_0.isSpecialPerkActive then
		local var_10_0 = arg_10_0.Tabs:GetTabAtIndex(Cac.PerkTypes.SPECIAL_ONE)
		local var_10_1 = arg_10_0.Tabs:GetTabAtIndex(Cac.PerkTypes.SPECIAL_TWO)
		local var_10_2 = arg_10_0.Tabs:GetTabAtIndex(Cac.PerkTypes.SPECIAL_THREE)

		var_10_0:SetupPerkData(arg_10_1, arg_10_0.specialPerk1, true, var_0_7(arg_10_0), var_0_8(arg_10_0))
		var_10_1:SetupPerkData(arg_10_1, arg_10_0.specialPerk2, true, var_0_7(arg_10_0), var_0_8(arg_10_0))
		var_10_2:SetupPerkData(arg_10_1, arg_10_0.specialPerk3, true, var_0_7(arg_10_0), var_0_8(arg_10_0))
		arg_10_0.PerkSpecialistInfo:UpdateKillRequirement(var_0_7(arg_10_0))
	end
end

local function var_0_10(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	var_0_9(arg_11_0, arg_11_1, arg_11_3, arg_11_4)

	local var_11_0 = 0
	local var_11_1 = 0
	local var_11_2 = false
	local var_11_3 = arg_11_0.perkTable[arg_11_2]
	local var_11_4 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, arg_11_0.perkLoadoutIndex, arg_11_4):get()
	local var_11_5 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 0, true):get()
	local var_11_6 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 1, true):get()
	local var_11_7 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 2, true):get()

	for iter_11_0, iter_11_1 in ipairs(var_11_3) do
		iter_11_1.perkType = arg_11_2
		iter_11_1.isConflict = false

		if arg_11_4 and (iter_11_1.ref == arg_11_0.perk1 or iter_11_1.ref == arg_11_0.perk2 or iter_11_1.ref == arg_11_0.perk3) then
			iter_11_1.isConflict = true
		end

		if (iter_11_1.ref == var_11_5 or iter_11_1.ref == var_11_6 or iter_11_1.ref == var_11_7) and arg_11_4 then
			iter_11_1.isSpecialPerkEquipped = true
		else
			iter_11_1.isSpecialPerkEquipped = false
		end

		if CONDITIONS.IsBRGameType() then
			iter_11_1.isDisabledBR = Cac.GetIsPerkDisabledForBR(iter_11_1.ref)
		else
			iter_11_1.isDisabledBR = false
		end
	end

	table.sort(var_11_3, function(arg_12_0, arg_12_1)
		if arg_12_0.isSpecialPerkEquipped ~= arg_12_1.isSpecialPerkEquipped then
			return arg_12_0.isSpecialPerkEquipped and not arg_12_1.isSpecialPerkEquipped
		end

		if arg_12_0.isUnlocked and arg_12_1.isUnlocked then
			if arg_12_0.isRestricted ~= arg_12_1.isRestricted then
				return arg_12_1.isRestricted and not arg_12_0.isRestricted
			end

			if not arg_12_0.isConflict and not arg_12_1.isConflict then
				return arg_12_0.unlockRank < arg_12_1.unlockRank
			end

			if arg_12_0.isConflict ~= arg_12_1.isConflict then
				return arg_12_1.isConflict and not arg_12_0.isConflict
			end

			if not arg_12_0.isConflict and not arg_12_1.isConflict then
				return false
			end
		end

		if arg_12_0.isDisabledBR ~= arg_12_1.isDisabledBR then
			return arg_12_1.isDisabledBR and not arg_12_0.isDisabledBR
		end

		return arg_12_0.unlockRank < arg_12_1.unlockRank
	end)

	for iter_11_2, iter_11_3 in ipairs(var_11_3) do
		if var_11_4 == iter_11_3.ref then
			var_11_1 = iter_11_2 - 1
		end
	end

	arg_11_0.perkGrid:SetRefreshChild(function(arg_13_0, arg_13_1, arg_13_2)
		local var_13_0 = arg_11_0.perkGrid:GetContentIndex(arg_13_1, arg_13_2, {
			relativePosition = false
		})

		arg_13_0.perkData = var_11_3[var_13_0 + 1]

		var_0_5(arg_11_0, arg_11_1, arg_13_0)

		if var_11_1 == var_13_0 then
			arg_13_0:HandleButtonFocus(arg_11_1)
		end
	end)

	arg_11_0.perkGrid._shouldFocus = false

	arg_11_0.perkGrid:SetNumChildren(#var_11_3)
	arg_11_0.perkGrid:SetDefaultFocus({
		x = 0,
		y = var_11_1
	})
	arg_11_0.perkGrid:processEvent({
		name = "gain_focus",
		controller = arg_11_1
	})
	arg_11_0.perkGrid:RefreshContent()

	if LUI.IsLastInputMouseNavigation(arg_11_1) then
		arg_11_0.perkGrid:processEvent({
			name = "lose_focus",
			controller = arg_11_1
		})
	end
end

local function var_0_11(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_0

	while var_14_0 ~= nil and var_14_0.id ~= "PerkSelect" do
		var_14_0 = var_14_0:getParent()
	end

	if var_14_0.id == "PerkSelect" then
		if Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() then
			local var_14_1 = LOADOUT.GetLoadoutSelectedPerk(arg_14_1, var_14_0.loadoutIndex, var_14_0.perkLoadoutIndex, var_14_0._isSpecialPerk):get()
			local var_14_2 = LOADOUT.GetPerkDataByField(var_14_1, CSV.perks.cols.model)

			if var_14_0.perkType == Cac.PerkTypes.SPECIAL_ONE or var_14_0.perkType == Cac.PerkTypes.SPECIAL_TWO or var_14_0.perkType == Cac.PerkTypes.SPECIAL_THREE then
				local var_14_3 = LOADOUT.GetPerkDataByField(var_14_1, CSV.perks.cols.specialistModel)

				if var_14_3 and #var_14_3 > 0 then
					var_14_2 = var_14_3
				end
			end

			var_0_4(var_14_0, arg_14_1, var_14_0.perkType, var_14_2)
		end

		var_14_0.perkLoadoutIndex = arg_14_3 and arg_14_0:GetCurrentTabIndex() - 3 or arg_14_0:GetCurrentTabIndex()
		var_14_0.perkType = arg_14_2

		var_0_10(var_14_0, arg_14_1, arg_14_2, var_14_0.perkLoadoutIndex, arg_14_3)

		var_14_0._isSpecialPerk = arg_14_3
		var_14_0.selectedPerkRef = LOADOUT.GetLoadoutSelectedPerk(arg_14_1, var_14_0.loadoutIndex, var_14_0.perkLoadoutIndex, arg_14_3):get()

		arg_14_0:GetCurrentTab():SetupPerkData(arg_14_1, var_14_0.selectedPerkRef, arg_14_3, var_0_7(var_14_0), var_0_8(var_14_0))
	end
end

local function var_0_12(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {
		perkLoadoutIndex = 0,
		isSpecialPerk = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_CORE"),
		loadoutIndex = arg_15_0.loadoutIndex,
		focusFunction = function(arg_16_0, arg_16_1)
			Engine.DHFCHIIJCA("loadout_showcase_x")
			var_0_11(arg_16_0, arg_16_1, Cac.PerkTypes.CORE)
		end,
		hasNewItem = #arg_15_0.newPerksRefTable[Cac.PerkTypes.CORE] > 0
	}
	local var_15_1 = {
		perkLoadoutIndex = 1,
		isSpecialPerk = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_ACTIVE"),
		loadoutIndex = arg_15_0.loadoutIndex,
		focusFunction = function(arg_17_0, arg_17_1)
			Engine.DHFCHIIJCA("loadout_showcase_y")
			var_0_11(arg_17_0, arg_17_1, Cac.PerkTypes.ACTIVE)
		end,
		hasNewItem = #arg_15_0.newPerksRefTable[Cac.PerkTypes.ACTIVE] > 0
	}
	local var_15_2 = {
		perkLoadoutIndex = 2,
		isSpecialPerk = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_PASSIVE"),
		loadoutIndex = arg_15_0.loadoutIndex,
		focusFunction = function(arg_18_0, arg_18_1)
			Engine.DHFCHIIJCA("loadout_showcase_z")
			var_0_11(arg_18_0, arg_18_1, Cac.PerkTypes.PASSIVE)
		end,
		hasNewItem = #arg_15_0.newPerksRefTable[Cac.PerkTypes.PASSIVE] > 0
	}
	local var_15_3 = {
		perkLoadoutIndex = 0,
		isSpecialPerk = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_CORE"),
		loadoutIndex = arg_15_0.loadoutIndex,
		focusFunction = function(arg_19_0, arg_19_1)
			Engine.DHFCHIIJCA("loadout_showcase_specialist")
			var_0_11(arg_19_0, arg_19_1, Cac.PerkTypes.SPECIAL_ONE, true)
		end,
		hasNewItem = #arg_15_0.newPerksRefTable[Cac.PerkTypes.SPECIAL_ONE] > 0
	}
	local var_15_4 = {
		perkLoadoutIndex = 1,
		isSpecialPerk = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_ACTIVE"),
		loadoutIndex = arg_15_0.loadoutIndex,
		focusFunction = function(arg_20_0, arg_20_1)
			Engine.DHFCHIIJCA("loadout_showcase_specialist")
			var_0_11(arg_20_0, arg_20_1, Cac.PerkTypes.SPECIAL_TWO, true)
		end,
		hasNewItem = #arg_15_0.newPerksRefTable[Cac.PerkTypes.SPECIAL_TWO] > 0
	}
	local var_15_5 = {
		perkLoadoutIndex = 2,
		isSpecialPerk = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_PASSIVE"),
		loadoutIndex = arg_15_0.loadoutIndex,
		focusFunction = function(arg_21_0, arg_21_1)
			Engine.DHFCHIIJCA("loadout_showcase_specialist")
			var_0_11(arg_21_0, arg_21_1, Cac.PerkTypes.SPECIAL_THREE, true)
		end,
		hasNewItem = #arg_15_0.newPerksRefTable[Cac.PerkTypes.SPECIAL_THREE] > 0
	}
	local var_15_6 = {
		var_15_0,
		var_15_1,
		var_15_2
	}

	if arg_15_2 then
		table.insert(var_15_6, var_15_3)
		table.insert(var_15_6, var_15_4)
		table.insert(var_15_6, var_15_5)
	end

	arg_15_0.tabsData = var_15_6

	arg_15_0.Tabs:SetTabs(var_15_6)
	arg_15_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

local function var_0_13(arg_22_0, arg_22_1)
	arg_22_0.perkTable = {
		[Cac.PerkTypes.CORE] = {},
		[Cac.PerkTypes.ACTIVE] = {},
		[Cac.PerkTypes.PASSIVE] = {},
		[Cac.PerkTypes.SPECIAL_ONE] = {},
		[Cac.PerkTypes.SPECIAL_TWO] = {},
		[Cac.PerkTypes.SPECIAL_THREE] = {}
	}
	arg_22_0.newPerksRefTable = {
		[Cac.PerkTypes.CORE] = {},
		[Cac.PerkTypes.ACTIVE] = {},
		[Cac.PerkTypes.PASSIVE] = {},
		[Cac.PerkTypes.SPECIAL_ONE] = {},
		[Cac.PerkTypes.SPECIAL_TWO] = {},
		[Cac.PerkTypes.SPECIAL_THREE] = {}
	}
	arg_22_0.selectedSpecialPerkTable = {}
	arg_22_0.specialPerkTable = {}

	for iter_22_0 = 0, StringTable.BFHCAIIDA(CSV.menuPerks.file) - 1 do
		local var_22_0 = CSV.ReadRow(CSV.menuPerks, iter_22_0)
		local var_22_1 = StringTable.BJJBBCJGEJ(CSV.perks.file, CSV.perks.cols.ref, var_22_0.ref)
		local var_22_2 = CSV.ReadRow(CSV.perks, var_22_1)
		local var_22_3 = StringTable.DIFCHIGDFB(CSV.menuPerks.file, CSV.menuPerks.cols.ref, var_22_2.ref, CSV.menuPerks.cols.slot)

		var_22_2.isUnlocked = PROGRESSION.IsUnlocked(arg_22_1, LOOT.itemTypes.PERK, var_22_2.ref)

		local var_22_4 = LOOT.GetItemID(LOOT.itemTypes.PERK, var_22_2.ref)

		var_22_2.isNew = Loot.HDJCADADF(arg_22_1, var_22_4)

		local var_22_5 = LOOT.GetItemID(LOOT.itemTypes.PERK, var_22_2.ref)

		var_22_2.unlockRank = PROGRESSION.GetUnlockRank(var_22_5)

		if not var_22_2.isUnlocked then
			var_22_2.unlockCriteria = PROGRESSION.GetUnlockText(arg_22_1, LOOT.itemTypes.PERK, var_22_2.ref)
		end

		local var_22_6 = tonumber(var_22_3)

		var_22_2.isRestricted = MatchRules.CJBJJHJCI(var_22_2.ref)

		if Engine.DDJFBBJAIG() or not var_22_2.isRestricted then
			if var_22_2.isNew then
				table.insert(arg_22_0.newPerksRefTable[var_22_6], var_22_2.ref)
			end

			table.insert(arg_22_0.perkTable[var_22_6], var_22_2)

			local var_22_7 = tonumber(StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, var_22_2.ref, CSV.perks.cols.specialist))

			if var_22_7 and var_22_7 > 0 then
				table.insert(arg_22_0.specialPerkTable, var_22_2)
			end
		end
	end

	arg_22_0.perkTable[Cac.PerkTypes.SPECIAL_ONE] = arg_22_0.specialPerkTable
	arg_22_0.perkTable[Cac.PerkTypes.SPECIAL_TWO] = arg_22_0.specialPerkTable
	arg_22_0.perkTable[Cac.PerkTypes.SPECIAL_THREE] = arg_22_0.specialPerkTable
end

local function var_0_14(arg_23_0)
	if arg_23_0.isSpecialPerkAvailable then
		if arg_23_0.BRWarningInfoFEPro then
			ACTIONS.AnimateSequence(arg_23_0.PerkSpecialistInfo.BRWarning, "Show")
		end

		if arg_23_0.isSpecialPerkActive then
			ACTIONS.AnimateSequence(arg_23_0, "SpecialPerkEnabled")
			ACTIONS.AnimateSequence(arg_23_0.PerkSpecialistInfo, "SpecialPerkEnabled")
		else
			ACTIONS.AnimateSequence(arg_23_0, "SpecialPerkDisabled")
			ACTIONS.AnimateSequence(arg_23_0.PerkSpecialistInfo, "SpecialPerkDisabled")
		end
	else
		ACTIONS.AnimateSequence(arg_23_0, "HideSpecialPerkPrompt")

		if arg_23_0.BRWarningInfoFEPro then
			ACTIONS.AnimateSequence(arg_23_0.BRWarningInfoFEPro, "Hide")
			ACTIONS.AnimateSequence(arg_23_0.PerkSpecialistInfo.BRWarning, "Hide")
		end
	end
end

local function var_0_15(arg_24_0, arg_24_1)
	var_0_14(arg_24_0)
	var_0_12(arg_24_0, arg_24_1, arg_24_0.isSpecialPerkActive and true or false)
end

local function var_0_16(arg_25_0, arg_25_1)
	if CONDITIONS.InFrontend() then
		if arg_25_0.isSpecialPerkActive then
			local var_25_0 = LOADOUT.GetLoadoutSelectedPerk(arg_25_1, arg_25_0.loadoutIndex, 0, true):get()
			local var_25_1 = LOADOUT.GetLoadoutSelectedPerk(arg_25_1, arg_25_0.loadoutIndex, 1, true):get()
			local var_25_2 = LOADOUT.GetLoadoutSelectedPerk(arg_25_1, arg_25_0.loadoutIndex, 2, true):get()
			local var_25_3 = LOADOUT.GetPerkDataByField(var_25_0, CSV.perks.cols.specialistModel)
			local var_25_4 = LOADOUT.GetPerkDataByField(var_25_1, CSV.perks.cols.specialistModel)
			local var_25_5 = LOADOUT.GetPerkDataByField(var_25_2, CSV.perks.cols.specialistModel)

			if var_25_3 == nil or #var_25_3 == 0 then
				var_25_3 = LOADOUT.GetPerkDataByField(var_25_0, CSV.perks.cols.model)
			end

			if var_25_4 == nil or #var_25_4 == 0 then
				var_25_4 = LOADOUT.GetPerkDataByField(var_25_1, CSV.perks.cols.model)
			end

			if var_25_5 == nil or #var_25_5 == 0 then
				var_25_5 = LOADOUT.GetPerkDataByField(var_25_2, CSV.perks.cols.model)
			end

			var_0_3(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, var_25_3)
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, var_25_4)
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, var_25_5)
		else
			local var_25_6 = "tag_origin"

			var_0_3(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, var_25_6)
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, var_25_6)
			var_0_3(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, var_25_6)
		end
	end
end

local function var_0_17(arg_26_0, arg_26_1)
	arg_26_0.isSpecialPerkActive = not arg_26_0.isSpecialPerkActive

	if CONDITIONS.InFrontend() then
		if arg_26_0.isSpecialPerkActive then
			local var_26_0 = LOADOUT.GetLoadoutPlayerData(arg_26_1, arg_26_0.loadoutIndex)

			CLIENT_MODEL.UpdatePatchSpecialistClientModels(arg_26_0, var_26_0)
		else
			CLIENT_MODEL.HidePatchSpecialistClientModels(arg_26_0.isSpecialPerkActive)
		end
	end

	LOADOUT.SetLoadoutUsingSpecialist(arg_26_1, arg_26_0.loadoutIndex, arg_26_0.isSpecialPerkActive and 1 or 0)
	var_0_15(arg_26_0, arg_26_1)
	var_0_16(arg_26_0, arg_26_1)
end

local function var_0_18(arg_27_0, arg_27_1)
	arg_27_0.bindButton:addEventHandler("button_alt1", function(arg_28_0, arg_28_1)
		if arg_27_0.isSpecialPerkAvailable then
			local var_28_0 = arg_28_0

			while var_28_0 ~= nil and var_28_0.id ~= "PerkSelect" do
				var_28_0 = arg_28_0:getParent()
			end

			var_0_17(var_28_0, arg_27_1)
		end
	end)

	arg_27_0.isSpecialPerkAvailable = PROGRESSION.IsSpecialistPerkUnlocked(arg_27_1)
	arg_27_0.isSpecialPerkActive = LOADOUT.GetLoadoutUsingSpecialist(arg_27_1, arg_27_0.loadoutIndex) > 0

	var_0_15(arg_27_0, arg_27_1)

	if arg_27_0.isSpecialPerkActive then
		var_0_16(arg_27_0, arg_27_1)
	end
end

local function var_0_19(arg_29_0, arg_29_1, arg_29_2)
	for iter_29_0 = 1, #arg_29_0.newPerksRefTable[arg_29_1] do
		if arg_29_0.newPerksRefTable[arg_29_1][iter_29_0] == arg_29_2 then
			table.remove(arg_29_0.newPerksRefTable[arg_29_1], iter_29_0)

			break
		end
	end

	if #arg_29_0.newPerksRefTable[arg_29_1] <= 0 then
		arg_29_0.Tabs:GetCurrentTab().NewItemSmallIcon:SetAlpha(0)
	end
end

local function var_0_20(arg_30_0, arg_30_1)
	if Engine.DDJFBBJAIG() then
		local var_30_0 = CONDITIONS.IsThirdGameMode()
		local var_30_1 = LUI.FlowManager.IsInStack("BRMainMenu")
		local var_30_2 = var_30_0 and not Onboarding.PerksCP.WasCompleted(arg_30_0, arg_30_1) or not var_30_0 and not Onboarding.Perks.WasCompleted(arg_30_0, arg_30_1)

		local function var_30_3(arg_31_0, arg_31_1)
			if not CONDITIONS.AreRestrictionsActive(arg_31_1) then
				local function var_31_0(arg_32_0, arg_32_1)
					var_0_17(arg_31_0, arg_32_1)
					ACTIONS.LeaveMenu(arg_32_0)
				end

				local var_31_1 = ONBOARDING_DATA.GetOnboardingSpecialistPerkData()

				var_31_1.confirmButton.action = var_31_0

				if not Onboarding.SpecialistPerk.WasCompleted(arg_31_0, arg_31_1) then
					LUI.FlowManager.RequestPopupMenu(arg_31_0, "onboardingfeaturepopup", true, arg_31_1, false, var_31_1)
					Onboarding.SpecialistPerk.MarkCompleted(arg_31_0, arg_31_1)
				end

				if PROGRESSION.IsSpecialistPerkUnlocked(arg_31_1) and var_0_0() then
					arg_31_0.HelperBar.ButtonHelperText:PushButtonPrompt({
						side = "left",
						button_ref = "button_r3",
						helper_text = Engine.CBBHFCGDIC("ONBOARDING/SPECIALIST_MODE_INFO")
					})

					local var_31_2 = LUI.UIBindButton.new()

					var_31_2.id = "selfBindButton"

					arg_31_0:addElement(var_31_2)

					arg_31_0.bindButton = var_31_2

					arg_31_0.bindButton:addEventHandler("button_right_stick", function(arg_33_0, arg_33_1)
						local var_33_0 = arg_33_1.controller or arg_31_1

						LUI.FlowManager.RequestPopupMenu(arg_31_0, "onboardingfeaturepopup", true, var_33_0, false, var_31_1)
					end)
				end
			end
		end

		if not var_30_1 and var_30_2 then
			local var_30_4 = ONBOARDING_DATA.GetOnboardingPerkData()

			if PROGRESSION.IsSpecialistPerkUnlocked(arg_30_1) and var_0_0() then
				local function var_30_5(arg_34_0, arg_34_1)
					ACTIONS.LeaveMenu(arg_34_0)
					var_30_3(arg_30_0, arg_34_1)
				end

				var_30_4.confirmButton.action = var_30_5
			end

			LUI.FlowManager.RequestPopupMenu(arg_30_0, "onboardingpopup", true, arg_30_1, false, var_30_4)

			if var_30_0 then
				Onboarding.PerksCP.MarkCompleted(arg_30_0, arg_30_1)
			else
				Onboarding.Perks.MarkCompleted(arg_30_0, arg_30_1)
			end
		elseif var_30_1 and not Onboarding.WZPerks.WasCompleted(arg_30_0, arg_30_1) then
			LUI.FlowManager.RequestPopupMenu(arg_30_0, "onboardingpopup", true, arg_30_1, false, ONBOARDING_DATA.GetOnboardingWZPerksData())
			Onboarding.WZPerks.MarkCompleted(arg_30_0, arg_30_1)
		elseif PROGRESSION.IsSpecialistPerkUnlocked(arg_30_1) and var_0_0() then
			var_30_3(arg_30_0, arg_30_1)
		end
	end
end

local function var_0_21(arg_35_0, arg_35_1)
	if Engine.DDJFBBJAIG() then
		local var_35_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = true,
			controllerIndex = arg_35_1
		})

		var_35_0:SetSwayValues(4500, 0.06, 0.1)
		var_35_0:SetLimits(-0.3, 0.3, -0.3, 0.3)
		arg_35_0:addElement(var_35_0)

		local var_35_1 = WATCH.GetEquippedWatch(arg_35_1)

		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary,
			FrontEndScene.ClientWeapons.Watch
		})

		local var_35_2 = WEAPON.GetWeaponModel(arg_35_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

		arg_35_0:addElement(var_35_2)
		LOADOUT.RequestWatchAndWeaponModels(arg_35_1, arg_35_0.loadoutIndex)
		WATCH.SetWatchModelIfLoaded(arg_35_0, arg_35_1, var_35_2, var_35_1)
	end
end

local function var_0_22(arg_36_0, arg_36_1, arg_36_2)
	assert(arg_36_0.InfoPanel)

	arg_36_0.UpdatePerkTree = var_0_2
	arg_36_0.UpdatePerkClientModel = var_0_4
	arg_36_0.UpdatePerkDisplayData = var_0_1
	arg_36_0.UpdatePerkList = var_0_10
	arg_36_0.RemovePerkFromTable = var_0_19
	arg_36_0._isSpecialPerk = false

	if Engine.BHICADFIHA() and not arg_36_2.loadoutIndex then
		DebugPrint("WARNING: Missing \"loadoutIndex\" option for PerkSelect menu. Only OK after a MyChanges.")

		arg_36_2.loadoutIndex = 0
	end

	assert(arg_36_2.loadoutIndex)

	arg_36_0.loadoutIndex = arg_36_2.loadoutIndex
	arg_36_0.perkLoadoutIndex = 0
	arg_36_0.selectedPerkButton = nil

	arg_36_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TITLE_PERK_SELECT")))
	var_0_21(arg_36_0, arg_36_1)
	arg_36_0.InfoPanel:SetupPanel(arg_36_0.InfoPanel:GetCurrentAnchorsAndPositions())
	var_0_13(arg_36_0, arg_36_1)
	var_0_10(arg_36_0, arg_36_1, Cac.PerkTypes.CORE)
	arg_36_0.bindButton:addEventHandler("button_secondary", function(arg_37_0, arg_37_1)
		ACTIONS.LeaveMenu(arg_36_0)
	end)

	local function var_36_0(arg_38_0, arg_38_1, arg_38_2)
		local var_38_0 = LOOT.GetItemID(LOOT.itemTypes.PERK, arg_38_2.ref)
		local var_38_1 = Loot.HDJCADADF(arg_38_1, var_38_0)
		local var_38_2 = arg_38_2.desc

		if CONDITIONS.IsBRGameType() then
			var_38_2 = arg_38_2.brDesc
		elseif CONDITIONS.IsThirdGameMode() then
			var_38_2 = arg_38_2.cpDesc
		end

		local var_38_3 = CONDITIONS.AreRestrictionsActive(arg_38_1)

		arg_38_0:UpdatePerkDisplayData(arg_38_1, arg_38_0._focusedPerkName, Engine.CBBHFCGDIC(var_38_2), not arg_38_2.isConflict and arg_38_2.isUnlocked, arg_38_2.isConflict and Engine.CBBHFCGDIC("LUA_MENU/PERK_IN_CONFLICT") or arg_38_2.unlockCriteria, var_38_1, arg_38_2.extraInfo and #arg_38_2.extraInfo > 0 and Engine.CBBHFCGDIC(arg_38_2.extraInfo) or "", MatchRules.CJBJJHJCI(arg_38_2.ref) and var_38_3, PERK.GetPerkPatchNotes(arg_38_2.ref), arg_38_2.unlockRank)
	end

	arg_36_0:addEventHandler("perk_button_over", function(arg_39_0, arg_39_1)
		local var_39_0 = arg_39_1.perkData

		if arg_39_1.isSelect then
			arg_39_0.InfoPanel:SetEquipped(true)
		else
			arg_39_0.InfoPanel:SetEquipped(false)
		end

		arg_39_0._focusedPerkName = ToUpperCase(Engine.CBBHFCGDIC(var_39_0.name))

		if Engine.DDJFBBJAIG() then
			if var_39_0.extraInfo and #var_39_0.extraInfo > 0 and Engine.ECHCFGDDDF() then
				arg_36_0.InfoPanel.ActionPrompt:SetAlpha(1)
			else
				arg_36_0.InfoPanel.ActionPrompt:SetAlpha(0)
			end
		end

		if CONDITIONS.IsBRGameType(arg_36_0) then
			arg_36_0.InfoPanel:SetShouldShowDisabledInfoBR(Cac.GetIsPerkDisabledForBR(var_39_0.ref))
		end

		var_36_0(arg_39_0, arg_36_1, var_39_0)
		arg_39_0:UpdatePerkTree(arg_36_1, var_39_0)

		if Engine.DDJFBBJAIG() then
			local var_39_1 = var_39_0.perkType

			if var_39_1 and var_39_1 > Cac.PerkTypes.NONE then
				local var_39_2 = var_39_0.model

				if var_39_1 == Cac.PerkTypes.SPECIAL_ONE or var_39_1 == Cac.PerkTypes.SPECIAL_TWO or var_39_1 == Cac.PerkTypes.SPECIAL_THREE then
					local var_39_3 = LOADOUT.GetPerkDataByField(var_39_0.ref, CSV.perks.cols.specialistModel)

					if var_39_3 and #var_39_3 > 0 then
						var_39_2 = var_39_3
					end
				end

				arg_39_0:UpdatePerkClientModel(arg_36_1, tonumber(var_39_1), var_39_2)
			end
		end

		arg_36_0._perkData = var_39_0
	end)
	arg_36_0:addEventHandler("perk_button_action", function(arg_40_0, arg_40_1)
		local var_40_0 = arg_40_1.perkData
		local var_40_1 = arg_40_1.playerData
		local var_40_2 = LOADOUT.GetLoadoutSelectedPerk(arg_36_1, arg_36_0.loadoutIndex, arg_36_0.perkLoadoutIndex, LOADOUT.IsSpecialPerk(var_40_0.perkType))

		if arg_40_0.selectedPerkRef ~= var_40_0.ref then
			local var_40_3 = {
				iconScale = -0.3,
				displayTime = 3000,
				icon = "cac_equip_fill",
				iconColor = SWATCHES.genericMenu.notificationHighlight,
				header = Engine.CBBHFCGDIC("LUA_MENU/PERK_EQUIPPED"),
				description = Engine.CBBHFCGDIC(var_40_0.name),
				type = LUI.ToastManager.NotificationType.PerkEquipped,
				controllerIndex = arg_36_1
			}

			arg_40_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_40_3
			})
			arg_40_0.InfoPanel:SetEquipped(1)

			local var_40_4 = PERK.IsPerkOverkill(var_40_2:get())
			local var_40_5 = PERK.IsPerkOverkill(var_40_0.ref)
			local var_40_6 = var_40_1.loadouts[arg_40_0.loadoutIndex].weaponSetups[1]

			if var_40_4 and not var_40_5 then
				var_40_6.weapon:set(WEAPON.DefaultSecondary)
				WEAPON.WipeWeaponSetup(var_40_6)
			elseif var_40_5 and not var_40_4 then
				local var_40_7 = var_40_1.loadouts[arg_40_0.loadoutIndex].weaponSetups[0].weapon:get() == "iw8_sh_romeo870" and "iw8_ar_mike4" or "iw8_sh_romeo870"

				var_40_6.weapon:set(var_40_7)
				WEAPON.WipeWeaponSetup(var_40_6)
			end

			arg_40_0.lastSelectedPerkRef = var_40_2:get()

			var_40_2:set(var_40_0.ref)

			arg_40_0.selectedPerkRef = var_40_0.ref

			if arg_40_0.selectedPerkButton then
				arg_40_0.selectedPerkButton:SetSelected(false)
			end

			arg_40_0.selectedPerkButton = arg_40_1.source

			arg_40_1.source:SetSelected(true)
			arg_40_0.Tabs:GetCurrentTab():SetupPerkData(arg_36_1, var_40_0.ref, LOADOUT.IsSpecialPerk(var_40_0.perkType), var_0_7(arg_36_0), var_0_8(arg_36_0))
			arg_40_0:UpdatePerkList(arg_36_1, var_40_0.perkType, arg_40_0.perkLoadoutIndex, LOADOUT.IsSpecialPerk(var_40_0.perkType))

			if CONDITIONS.InGame() then
				Engine.EBHIFJCGBH("equip_item_ingame", 1)
			end
		end
	end)
	arg_36_0:addEventHandler("perk_button_up", function(arg_41_0, arg_41_1)
		arg_41_0:RemovePerkFromTable(arg_41_1.perkData.perkType, arg_41_1.perkData.ref)
	end)

	if CONDITIONS.InGame() and not CONDITIONS.IsThirdGameMode() then
		arg_36_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 5,
			ignoreTooltip = false,
			side = "left",
			kbmTooltipPromptOverload = "button_dismiss_pause_menu",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
		})
		arg_36_0.bindButton:addEventHandler("button_start", function(arg_42_0, arg_42_1)
			LUI.FlowManager.RequestCloseAllMenus()
		end)
	end

	var_0_20(arg_36_0, arg_36_1)

	if Engine.DDJFBBJAIG() then
		if CONDITIONS.IsCoreMultiplayer() then
			arg_36_0.bindButton:addEventHandler("button_alt2", function(arg_43_0, arg_43_1)
				if arg_36_0._perkData then
					arg_36_0.InfoPanel:ToggleExtraDesc()

					if arg_36_0.InfoPanel._showExtraDesc then
						arg_36_0.InfoPanel.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SHOW_LESS_INFO"))
						Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
					else
						arg_36_0.InfoPanel.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SHOW_MORE_INFO"))
						Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
					end

					var_36_0(arg_36_0, arg_36_1, arg_36_0._perkData)
				end
			end)
		else
			arg_36_0.InfoPanel.ActionPrompt:SetAlpha(0)
		end
	end

	var_0_12(arg_36_0, arg_36_1, false)

	if var_0_0() then
		var_0_18(arg_36_0, arg_36_1)
	end

	if arg_36_0.selectedPerkButton then
		var_36_0(arg_36_0, arg_36_1, arg_36_0.selectedPerkButton.perkData)
	end

	if arg_36_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_36_0.InGameMenuBackground)
	end

	local function var_36_1()
		local var_44_0 = CoD.GetAspectRatioScaleAdjust(0.7)

		arg_36_0.Vignette:SetScale(var_44_0)
	end

	arg_36_0:addAndCallEventHandler("onVideoChange", var_36_1)

	if not CONDITIONS.InGame(arg_36_0) then
		LAYOUT.AddAspectRatioFadeFrame(arg_36_0, arg_36_1)
	end

	if CONDITIONS.IsSplitscreen(arg_36_0) and CONDITIONS.InGame(arg_36_0) then
		ACTIONS.ScaleFullscreen(arg_36_0.Vignette)
		ACTIONS.AnimateSequence(arg_36_0, "Splitscreen")
	end

	if arg_36_0.BRWarningInfoFEPro then
		arg_36_0.BRWarningInfoFEPro:SetupWarning("LUA_MENU/BR_WARNING_PERK_SPECIALIST_DESC", 3)
	end
end

function PerkSelect(arg_45_0, arg_45_1)
	local var_45_0 = LUI.UIElement.new()

	var_45_0.id = "PerkSelect"
	var_45_0._animationSets = var_45_0._animationSets or {}
	var_45_0._sequences = var_45_0._sequences or {}

	local var_45_1 = arg_45_1 and arg_45_1.controllerIndex

	if not var_45_1 and not Engine.DDJFBBJAIG() then
		var_45_1 = var_45_0:getRootController()
	end

	assert(var_45_1)

	var_45_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_45_1
	})
	var_45_0.HelperBar.id = "HelperBar"

	var_45_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_45_0.HelperBar:setPriority(10)
	var_45_0:addElement(var_45_0.HelperBar)

	local var_45_2 = var_45_0
	local var_45_3

	if CONDITIONS.InGame(var_45_0) then
		local var_45_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_45_1
		})

		var_45_4.id = "InGameMenuBackground"

		var_45_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_45_0:addElement(var_45_4)

		var_45_0.InGameMenuBackground = var_45_4
	end

	local var_45_5
	local var_45_6 = LUI.UIImage.new()

	var_45_6.id = "Vignette"

	var_45_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_45_6:SetAlpha(0.5, 0)
	var_45_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_45_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1020, 0, 0)
	var_45_0:addElement(var_45_6)

	var_45_0.Vignette = var_45_6

	local var_45_7
	local var_45_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_45_1
	})

	var_45_8.id = "MenuTitle"

	var_45_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TITLE_PERK_SELECT")), 0)
	var_45_8.Line:SetLeft(0, 0)
	var_45_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_45_0:addElement(var_45_8)

	var_45_0.MenuTitle = var_45_8

	local var_45_9
	local var_45_10 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_45_1
	})

	var_45_10.id = "Cinematic"

	var_45_10:SetAlpha(0, 0)
	var_45_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1609, _1080p * 1790, _1080p * 278, _1080p * 457)
	var_45_0:addElement(var_45_10)

	var_45_0.Cinematic = var_45_10

	local var_45_11
	local var_45_12 = MenuBuilder.BuildRegisteredType("PerkDetails", {
		controllerIndex = var_45_1
	})

	var_45_12.id = "BasePerk"

	var_45_12:SetAlpha(0, 0)
	var_45_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 751, _1080p * 1067, _1080p * 524, _1080p * 840)
	var_45_0:addElement(var_45_12)

	var_45_0.BasePerk = var_45_12

	local var_45_13
	local var_45_14 = MenuBuilder.BuildRegisteredType("PerkDetails", {
		controllerIndex = var_45_1
	})

	var_45_14.id = "UpgradePerk1"

	var_45_14:SetAlpha(0, 0)
	var_45_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1309, _1080p * 1625, _1080p * 299, _1080p * 615)
	var_45_0:addElement(var_45_14)

	var_45_0.UpgradePerk1 = var_45_14

	local var_45_15
	local var_45_16 = MenuBuilder.BuildRegisteredType("PerkDetails", {
		controllerIndex = var_45_1
	})

	var_45_16.id = "UpgradePerk2"

	var_45_16:SetAlpha(0, 0)
	var_45_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1309, _1080p * 1625, _1080p * 664, _1080p * 980)
	var_45_0:addElement(var_45_16)

	var_45_0.UpgradePerk2 = var_45_16

	local var_45_17
	local var_45_18 = MenuBuilder.BuildRegisteredType("PerkSpecialistInfo", {
		controllerIndex = var_45_1
	})

	var_45_18.id = "PerkSpecialistInfo"

	var_45_18:SetAlpha(0, 0)
	var_45_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1274, _1080p * 1824, _1080p * 113, _1080p * 303)
	var_45_0:addElement(var_45_18)

	var_45_0.PerkSpecialistInfo = var_45_18

	local var_45_19
	local var_45_20 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 5,
		springCoefficient = 400,
		maxVisibleRows = SubtractForSplitscreen(9, 6),
		controllerIndex = var_45_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PerkButton", {
				controllerIndex = var_45_1
			})
		end,
		refreshChild = function(arg_47_0, arg_47_1, arg_47_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 546,
		rowHeight = _1080p * 62,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_45_21 = LUI.UIGrid.new(var_45_20)

	var_45_21.id = "perkGrid"

	var_45_21:setUseStencil(true)
	var_45_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 119, _1080p * 665, _1080p * 329, _1080p * 1024)
	var_45_0:addElement(var_45_21)

	var_45_0.perkGrid = var_45_21

	local var_45_22
	local var_45_23 = {
		spacing = 5,
		wrap = true,
		tabHeight = _1080p * 190,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("PerkTab", {
				controllerIndex = var_45_1
			})
		end,
		controllerIndex = var_45_1
	}
	local var_45_24 = LUI.TabManager.new(var_45_23)

	var_45_24.id = "Tabs"

	var_45_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 64, _1080p * 610, _1080p * 113, _1080p * 189)
	var_45_0:addElement(var_45_24)

	var_45_0.Tabs = var_45_24

	local var_45_25

	if CONDITIONS.InFrontendPublicMP(var_45_0) then
		local var_45_26 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_45_1
		})

		var_45_26.id = "MPPlayerDetails"

		var_45_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_45_0:addElement(var_45_26)

		var_45_0.MPPlayerDetails = var_45_26
	end

	local var_45_27
	local var_45_28 = MenuBuilder.BuildRegisteredType("PerkInfoPanel", {
		controllerIndex = var_45_1
	})

	var_45_28.id = "InfoPanel"

	if CONDITIONS.InFrontend(var_45_0) then
		var_45_28.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SHOW_MORE_INFO"), 0)
	end

	if CONDITIONS.InFrontend(var_45_0) then
		var_45_28.SecondActionPrompt:setText("", 0)
	end

	var_45_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 728, _1080p * 1255, _1080p * 329, _1080p * 420)
	var_45_0:addElement(var_45_28)

	var_45_0.InfoPanel = var_45_28

	local var_45_29

	if CONDITIONS.InFrontend(var_45_0) then
		local var_45_30 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_45_1
		})

		var_45_30.id = "LobbyMembersFooter"

		var_45_30:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_45_0:addElement(var_45_30)

		var_45_0.LobbyMembersFooter = var_45_30
	end

	local var_45_31

	if CONDITIONS.InGame(var_45_0) then
		local var_45_32 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_45_1
		})

		var_45_32.id = "InGameMenuTimerStatus"

		var_45_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -140, _1080p * 260, _1080p * 54, _1080p * 104)
		var_45_0:addElement(var_45_32)

		var_45_0.InGameMenuTimerStatus = var_45_32
	end

	local var_45_33
	local var_45_34 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_45_1
	})

	var_45_34.id = "VerticalMinimalScrollbar"

	var_45_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 687, _1080p * 329, _1080p * 919)
	var_45_0:addElement(var_45_34)

	var_45_0.VerticalMinimalScrollbar = var_45_34

	local var_45_35

	if Engine.DDJFBBJAIG() then
		var_45_35 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_45_1
		})
		var_45_35.id = "CDLRestrictionTag"

		var_45_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_45_0:addElement(var_45_35)

		var_45_0.CDLRestrictionTag = var_45_35
	end

	local var_45_36

	if CONDITIONS.IsMagmaGameMode(var_45_0) then
		local var_45_37 = MenuBuilder.BuildRegisteredType("BRWarningInfo", {
			controllerIndex = var_45_1
		})

		var_45_37.id = "BRWarningInfoFEPro"

		var_45_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 732, _1080p * 1255, _1080p * 624, _1080p * 654)
		var_45_0:addElement(var_45_37)

		var_45_0.BRWarningInfoFEPro = var_45_37
	end

	local var_45_38
	local var_45_39 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_45_1
	})

	var_45_39.id = "ArrowUp"

	var_45_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 292, _1080p * 324, _1080p * 923, _1080p * 955)
	var_45_0:addElement(var_45_39)

	var_45_0.ArrowUp = var_45_39

	local var_45_40
	local var_45_41 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_45_1
	})

	var_45_41.id = "ArrowDown"

	var_45_41.Arrow:SetZRotation(180, 0)
	var_45_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 460, _1080p * 492, _1080p * 923, _1080p * 955)
	var_45_0:addElement(var_45_41)

	var_45_0.ArrowDown = var_45_41

	local var_45_42
	local var_45_43 = LUI.UIText.new()

	var_45_43.id = "ListCount"

	var_45_43:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_45_43:setText("", 0)
	var_45_43:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_45_43:SetAlignment(LUI.Alignment.Center)
	var_45_43:SetVerticalAlignment(LUI.Alignment.Center)
	var_45_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 324, _1080p * 460, _1080p * 930, _1080p * 950)
	var_45_0:addElement(var_45_43)

	var_45_0.ListCount = var_45_43

	local function var_45_44()
		return
	end

	var_45_0._sequences.DefaultSequence = var_45_44

	local var_45_45
	local var_45_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 728
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1278
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_18:RegisterAnimationSequence("SpecialPerkDisabled", var_45_46)

	if Engine.DDJFBBJAIG() then
		local var_45_47 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 200
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 170
			}
		}

		var_45_35:RegisterAnimationSequence("SpecialPerkDisabled", var_45_47)
	end

	local function var_45_48()
		var_45_18:AnimateSequence("SpecialPerkDisabled")

		if Engine.DDJFBBJAIG() then
			var_45_35:AnimateSequence("SpecialPerkDisabled")
		end
	end

	var_45_0._sequences.SpecialPerkDisabled = var_45_48

	local var_45_49
	local var_45_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_18:RegisterAnimationSequence("SpecialPerkEnabled", var_45_50)

	if Engine.DDJFBBJAIG() then
		local var_45_51 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 329
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 359
			}
		}

		var_45_35:RegisterAnimationSequence("SpecialPerkEnabled", var_45_51)
	end

	local function var_45_52()
		var_45_18:AnimateSequence("SpecialPerkEnabled")

		if Engine.DDJFBBJAIG() then
			var_45_35:AnimateSequence("SpecialPerkEnabled")
		end
	end

	var_45_0._sequences.SpecialPerkEnabled = var_45_52

	local var_45_53
	local var_45_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 551
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 639
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 124
		}
	}

	var_45_21:RegisterAnimationSequence("Splitscreen", var_45_54)

	local var_45_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 524
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 692
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 703
		}
	}

	var_45_34:RegisterAnimationSequence("Splitscreen", var_45_55)

	local var_45_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 532
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 564
		}
	}

	var_45_39:RegisterAnimationSequence("Splitscreen", var_45_56)

	local var_45_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 532
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 564
		}
	}

	var_45_41:RegisterAnimationSequence("Splitscreen", var_45_57)

	local var_45_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 539
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 559
		}
	}

	var_45_43:RegisterAnimationSequence("Splitscreen", var_45_58)

	local function var_45_59()
		var_45_21:AnimateSequence("Splitscreen")
		var_45_34:AnimateSequence("Splitscreen")
		var_45_39:AnimateSequence("Splitscreen")
		var_45_41:AnimateSequence("Splitscreen")
		var_45_43:AnimateSequence("Splitscreen")
	end

	var_45_0._sequences.Splitscreen = var_45_59

	local var_45_60
	local var_45_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_45_18:RegisterAnimationSequence("HideSpecialPerkPrompt", var_45_61)

	local function var_45_62()
		var_45_18:AnimateSequence("HideSpecialPerkPrompt")
	end

	var_45_0._sequences.HideSpecialPerkPrompt = var_45_62

	local var_45_63 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_45_34,
		startCap = var_45_34.startCap,
		endCap = var_45_34.endCap,
		sliderArea = var_45_34.sliderArea,
		slider = var_45_34.sliderArea and var_45_34.sliderArea.slider,
		fixedSizeSlider = var_45_34.sliderArea and var_45_34.sliderArea.fixedSizeSlider
	})

	var_45_21:AddScrollbar(var_45_63)
	var_45_21:AddArrow(var_45_39)
	var_45_21:AddArrow(var_45_41)
	var_45_21:AddItemNumbers(var_45_43)
	var_45_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_45_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_45_64 = LUI.UIBindButton.new()

	var_45_64.id = "selfBindButton"

	var_45_0:addElement(var_45_64)

	var_45_0.bindButton = var_45_64

	var_0_22(var_45_0, var_45_1, arg_45_1)

	return var_45_0
end

MenuBuilder.registerType("PerkSelect", PerkSelect)
LockTable(_M)
