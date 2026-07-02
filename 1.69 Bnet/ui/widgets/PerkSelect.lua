module(..., package.seeall)

local var_0_0 = "1"

local function var_0_1()
	return not CONDITIONS.IsThirdGameMode() and not CONDITIONS.InGameAndBR()
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6, arg_2_7, arg_2_8, arg_2_9, arg_2_10)
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

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.BasePerk:UpdatePerk(arg_3_2.basePerk)
	arg_3_0.UpgradePerk1:UpdatePerk(arg_3_2.upgradePerk1)
	arg_3_0.UpgradePerk2:UpdatePerk(arg_3_2.upgradePerk2)
end

local function var_0_4(arg_4_0, arg_4_1)
	CLIENT_MODEL.SetModel(arg_4_0, arg_4_1)
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if CONDITIONS.InFrontend() and arg_5_0.perkType == arg_5_2 then
		if arg_5_2 == Cac.PerkTypes.CORE then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PATCH, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.ACTIVE then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.PASSIVE then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.SPECIAL_ONE then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.SPECIAL_TWO then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, arg_5_3)
		elseif arg_5_2 == Cac.PerkTypes.SPECIAL_THREE then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, arg_5_3)
		end
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if CONDITIONS.InFrontend() and arg_6_0.perkType == arg_6_2 then
		if arg_6_2 == Cac.PerkTypes.CORE then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PATCH_SOURCE, arg_6_3)
		elseif arg_6_2 == Cac.PerkTypes.ACTIVE then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SOURCE, arg_6_3)
		elseif arg_6_2 == Cac.PerkTypes.PASSIVE then
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SOURCE, arg_6_3)
		end
	end
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_2.perkData
	local var_7_1 = PlayerData.BFFBGAJGD(arg_7_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers
	local var_7_2 = LOADOUT.GetLoadoutSelectedPerk(arg_7_1, arg_7_0.loadoutIndex, arg_7_0.perkLoadoutIndex, LOADOUT.IsSpecialPerk(arg_7_2.perkData.perkType))
	local var_7_3 = Restrictions.IsPerkRestricted(var_7_0.ref)
	local var_7_4 = var_7_2:get() == var_7_0.ref

	if var_7_4 then
		arg_7_0.selectedPerkButton = arg_7_2
		arg_7_0._focusedPerkName = ToUpperCase(Engine.CBBHFCGDIC(var_7_0.name))
	end

	if var_7_0.mpDisabled and arg_7_2.SnipeIcon then
		arg_7_2.SnipeIcon:UpdateSnipeIcon({
			gameSourceID = LUI.GAME_SOURCE_ID.WARZONE
		})
	elseif arg_7_2.SnipeIcon then
		arg_7_2.SnipeIcon:UpdateSnipeIcon({
			isNoWeapon = true
		})
	end

	arg_7_2.Text:setText(Engine.CBBHFCGDIC(var_7_0.name))
	arg_7_2.Icon:setImage(RegisterMaterial(var_7_0.image))
	arg_7_2:SetButtonDisabled(not var_7_0.isUnlocked or var_7_0.isConflict or var_7_0.isRestricted)
	arg_7_2:SetButtonConflicted(var_7_0.isConflict, not var_7_0.isUnlocked, var_7_3)
	arg_7_2:SetSelected(var_7_4)
	arg_7_2:SetNew(var_7_0.isNew, var_7_0.ref)

	local var_7_5 = LOOT.GetItemID(LOOT.itemTypes.PERK, var_7_0.ref)
	local var_7_6 = PROGRESSION.GetUnlockRank(var_7_5)

	arg_7_2:SetupLock(var_7_6)
end

local function var_0_8(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = 1
	local var_8_1 = #arg_8_0.specialPerkTable
	local var_8_2
	local var_8_3
	local var_8_4
	local var_8_5
	local var_8_6
	local var_8_7 = {}

	for iter_8_0 = 1, 3 do
		if iter_8_0 - 1 == arg_8_2 then
			var_8_6 = LOADOUT.GetLoadoutSelectedPerk(arg_8_1, arg_8_0.loadoutIndex, arg_8_2, true):get()
		else
			local var_8_8 = LOADOUT.GetLoadoutSelectedPerk(arg_8_1, arg_8_0.loadoutIndex, iter_8_0 - 1, true):get()

			table.insert(var_8_7, {
				ref = var_8_8,
				perkIndex = iter_8_0 - 1
			})
		end
	end

	if arg_8_3 then
		for iter_8_1 = 1, #var_8_7 do
			if var_8_6 == var_8_7[iter_8_1].ref then
				LOADOUT.SetLoadoutSelectedPerk(arg_8_1, arg_8_0.loadoutIndex, var_8_7[iter_8_1].perkIndex, arg_8_0.lastSelectedPerkRef, true)

				if Engine.DDJFBBJAIG() then
					local var_8_9
					local var_8_10 = LOADOUT.GetPerkDataByField(arg_8_0.lastSelectedPerkRef, CSV.perks.cols.specialistModel)

					if var_8_7[iter_8_1].perkIndex == 0 then
						var_8_9 = CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST
					elseif var_8_7[iter_8_1].perkIndex == 1 then
						var_8_9 = CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST
					elseif var_8_7[iter_8_1].perkIndex == 2 then
						var_8_9 = CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST
					end

					if var_8_9 then
						var_0_4(var_8_9, var_8_10)
					end
				end

				break
			end
		end
	else
		local var_8_11 = var_8_6 == arg_8_0.perk1 or var_8_6 == arg_8_0.perk2 or var_8_6 == arg_8_0.perk3
		local var_8_12 = var_8_6 == Cac.perkNoneValue

		if var_8_11 or var_8_12 then
			while var_8_0 <= var_8_1 do
				local var_8_13 = arg_8_0.specialPerkTable[var_8_0].ref
				local var_8_14 = var_8_13 == arg_8_0.perk1 or var_8_13 == arg_8_0.perk2 or var_8_13 == arg_8_0.perk3 or var_8_13 == var_8_7[1].ref or var_8_13 == var_8_7[2].ref
				local var_8_15 = PROGRESSION.IsUnlocked(arg_8_1, LOOT.itemTypes.PERK, var_8_13)

				if not var_8_14 and var_8_15 then
					LOADOUT.SetLoadoutSelectedPerk(arg_8_1, arg_8_0.loadoutIndex, arg_8_2, var_8_13, true)

					break
				end

				var_8_0 = var_8_0 + 1
			end
		end
	end
end

local function var_0_9(arg_9_0)
	return arg_9_0.perk1 == "specialty_hardline" or arg_9_0.perk2 == "specialty_hardline" or arg_9_0.perk3 == "specialty_hardline"
end

local function var_0_10(arg_10_0)
	return arg_10_0.perk1 == "specialty_strategist" or arg_10_0.perk2 == "specialty_strategist" or arg_10_0.perk3 == "specialty_strategist"
end

local function var_0_11(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0.perk1 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 0):get()
	arg_11_0.perk2 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 1):get()
	arg_11_0.perk3 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 2):get()

	if arg_11_3 then
		var_0_8(arg_11_0, arg_11_1, arg_11_2, true)
	else
		var_0_8(arg_11_0, arg_11_1, 0, false)
		var_0_8(arg_11_0, arg_11_1, 1, false)
		var_0_8(arg_11_0, arg_11_1, 2, false)
	end

	arg_11_0.specialPerk1 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 0, true):get()
	arg_11_0.specialPerk2 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 1, true):get()
	arg_11_0.specialPerk3 = LOADOUT.GetLoadoutSelectedPerk(arg_11_1, arg_11_0.loadoutIndex, 2, true):get()

	if arg_11_0.Tabs:IsTabAvailable() and arg_11_0.isSpecialPerkActive then
		local var_11_0 = arg_11_0.Tabs:GetTabAtIndex(Cac.PerkTypes.SPECIAL_ONE)
		local var_11_1 = arg_11_0.Tabs:GetTabAtIndex(Cac.PerkTypes.SPECIAL_TWO)
		local var_11_2 = arg_11_0.Tabs:GetTabAtIndex(Cac.PerkTypes.SPECIAL_THREE)

		var_11_0:SetupPerkData(arg_11_1, arg_11_0.specialPerk1, true, var_0_9(arg_11_0), var_0_10(arg_11_0))
		var_11_1:SetupPerkData(arg_11_1, arg_11_0.specialPerk2, true, var_0_9(arg_11_0), var_0_10(arg_11_0))
		var_11_2:SetupPerkData(arg_11_1, arg_11_0.specialPerk3, true, var_0_9(arg_11_0), var_0_10(arg_11_0))
		arg_11_0.PerkSpecialistInfo:UpdateKillRequirement(var_0_9(arg_11_0))
	end
end

local function var_0_12(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	var_0_11(arg_12_0, arg_12_1, arg_12_3, arg_12_4)

	local var_12_0 = 0
	local var_12_1 = 0
	local var_12_2 = false
	local var_12_3 = arg_12_0.perkTable[arg_12_2]
	local var_12_4 = LOADOUT.GetLoadoutSelectedPerk(arg_12_1, arg_12_0.loadoutIndex, arg_12_0.perkLoadoutIndex, arg_12_4):get()
	local var_12_5 = LOADOUT.GetLoadoutSelectedPerk(arg_12_1, arg_12_0.loadoutIndex, 0, true):get()
	local var_12_6 = LOADOUT.GetLoadoutSelectedPerk(arg_12_1, arg_12_0.loadoutIndex, 1, true):get()
	local var_12_7 = LOADOUT.GetLoadoutSelectedPerk(arg_12_1, arg_12_0.loadoutIndex, 2, true):get()

	for iter_12_0, iter_12_1 in ipairs(var_12_3) do
		iter_12_1.perkType = arg_12_2
		iter_12_1.isConflict = false

		if arg_12_4 and (iter_12_1.ref == arg_12_0.perk1 or iter_12_1.ref == arg_12_0.perk2 or iter_12_1.ref == arg_12_0.perk3) then
			iter_12_1.isConflict = true
		end

		if (iter_12_1.ref == var_12_5 or iter_12_1.ref == var_12_6 or iter_12_1.ref == var_12_7) and arg_12_4 then
			iter_12_1.isSpecialPerkEquipped = true
		else
			iter_12_1.isSpecialPerkEquipped = false
		end

		if CONDITIONS.IsMagmaGameMode() then
			iter_12_1.isDisabledBR = Cac.GetIsPerkDisabledForBR(iter_12_1.ref)
		else
			iter_12_1.isDisabledBR = false
		end
	end

	table.sort(var_12_3, function(arg_13_0, arg_13_1)
		if arg_13_0.isSpecialPerkEquipped ~= arg_13_1.isSpecialPerkEquipped then
			return arg_13_0.isSpecialPerkEquipped and not arg_13_1.isSpecialPerkEquipped
		end

		if arg_13_0.isUnlocked and arg_13_1.isUnlocked then
			if arg_13_0.isRestricted ~= arg_13_1.isRestricted then
				return arg_13_1.isRestricted and not arg_13_0.isRestricted
			end

			if not arg_13_0.isConflict and not arg_13_1.isConflict then
				return arg_13_0.unlockRank < arg_13_1.unlockRank
			end

			if arg_13_0.isConflict ~= arg_13_1.isConflict then
				return arg_13_1.isConflict and not arg_13_0.isConflict
			end

			if not arg_13_0.isConflict and not arg_13_1.isConflict then
				return false
			end
		end

		if arg_13_0.isDisabledBR ~= arg_13_1.isDisabledBR then
			return arg_13_1.isDisabledBR and not arg_13_0.isDisabledBR
		end

		return arg_13_0.unlockRank < arg_13_1.unlockRank
	end)

	for iter_12_2, iter_12_3 in ipairs(var_12_3) do
		if var_12_4 == iter_12_3.ref then
			var_12_1 = iter_12_2 - 1
		end
	end

	arg_12_0.perkGrid:SetRefreshChild(function(arg_14_0, arg_14_1, arg_14_2)
		local var_14_0 = arg_12_0.perkGrid:GetContentIndex(arg_14_1, arg_14_2, {
			relativePosition = false
		})

		arg_14_0.perkData = var_12_3[var_14_0 + 1]

		var_0_7(arg_12_0, arg_12_1, arg_14_0)

		if var_12_1 == var_14_0 then
			arg_14_0:HandleButtonFocus(arg_12_1)
		end
	end)

	arg_12_0.perkGrid._shouldFocus = false

	arg_12_0.perkGrid:SetNumChildren(#var_12_3)
	arg_12_0.perkGrid:SetDefaultFocus({
		x = 0,
		y = var_12_1
	})
	arg_12_0.perkGrid:processEvent({
		name = "gain_focus",
		controller = arg_12_1
	})
	arg_12_0.perkGrid:RefreshContent()

	if LUI.IsLastInputMouseNavigation(arg_12_1) then
		arg_12_0.perkGrid:processEvent({
			name = "lose_focus",
			controller = arg_12_1
		})
	end
end

local function var_0_13(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = arg_15_0

	while var_15_0 ~= nil and var_15_0.id ~= "PerkSelect" do
		var_15_0 = var_15_0:getParent()
	end

	if var_15_0.id == "PerkSelect" then
		if Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() then
			local var_15_1 = LOADOUT.GetLoadoutSelectedPerk(arg_15_1, var_15_0.loadoutIndex, var_15_0.perkLoadoutIndex, var_15_0._isSpecialPerk):get()
			local var_15_2 = LOADOUT.GetPerkDataByField(var_15_1, CSV.perks.cols.model)
			local var_15_3, var_15_4 = LOADOUT.GetPerkDataByField(var_15_1, CSV.perks.cols.sourceModel), var_15_2

			if var_15_0.perkType == Cac.PerkTypes.SPECIAL_ONE or var_15_0.perkType == Cac.PerkTypes.SPECIAL_TWO or var_15_0.perkType == Cac.PerkTypes.SPECIAL_THREE then
				local var_15_5 = LOADOUT.GetPerkDataByField(var_15_1, CSV.perks.cols.specialistModel)

				if var_15_5 and #var_15_5 > 0 then
					var_15_4 = var_15_5
				end
			end

			var_0_5(var_15_0, arg_15_1, var_15_0.perkType, var_15_4)
			var_0_6(var_15_0, arg_15_1, var_15_0.perkType, var_15_3)
		end

		var_15_0.perkLoadoutIndex = arg_15_3 and arg_15_0:GetCurrentTabIndex() - 3 or arg_15_0:GetCurrentTabIndex()
		var_15_0.perkType = arg_15_2

		var_0_12(var_15_0, arg_15_1, arg_15_2, var_15_0.perkLoadoutIndex, arg_15_3)

		var_15_0._isSpecialPerk = arg_15_3
		var_15_0.selectedPerkRef = LOADOUT.GetLoadoutSelectedPerk(arg_15_1, var_15_0.loadoutIndex, var_15_0.perkLoadoutIndex, arg_15_3):get()

		arg_15_0:GetCurrentTab():SetupPerkData(arg_15_1, var_15_0.selectedPerkRef, arg_15_3, var_0_9(var_15_0), var_0_10(var_15_0))
	end
end

local function var_0_14(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = {
		perkLoadoutIndex = 0,
		isSpecialPerk = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_CORE"),
		loadoutIndex = arg_16_0.loadoutIndex,
		focusFunction = function(arg_17_0, arg_17_1)
			Engine.DHFCHIIJCA("loadout_showcase_x")
			var_0_13(arg_17_0, arg_17_1, Cac.PerkTypes.CORE)
		end,
		hasNewItem = #arg_16_0.newPerksRefTable[Cac.PerkTypes.CORE] > 0
	}
	local var_16_1 = {
		perkLoadoutIndex = 1,
		isSpecialPerk = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_ACTIVE"),
		loadoutIndex = arg_16_0.loadoutIndex,
		focusFunction = function(arg_18_0, arg_18_1)
			Engine.DHFCHIIJCA("loadout_showcase_y")
			var_0_13(arg_18_0, arg_18_1, Cac.PerkTypes.ACTIVE)
		end,
		hasNewItem = #arg_16_0.newPerksRefTable[Cac.PerkTypes.ACTIVE] > 0
	}
	local var_16_2 = {
		perkLoadoutIndex = 2,
		isSpecialPerk = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_PASSIVE"),
		loadoutIndex = arg_16_0.loadoutIndex,
		focusFunction = function(arg_19_0, arg_19_1)
			Engine.DHFCHIIJCA("loadout_showcase_z")
			var_0_13(arg_19_0, arg_19_1, Cac.PerkTypes.PASSIVE)
		end,
		hasNewItem = #arg_16_0.newPerksRefTable[Cac.PerkTypes.PASSIVE] > 0
	}
	local var_16_3 = {
		perkLoadoutIndex = 0,
		isSpecialPerk = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_CORE"),
		loadoutIndex = arg_16_0.loadoutIndex,
		focusFunction = function(arg_20_0, arg_20_1)
			Engine.DHFCHIIJCA("loadout_showcase_specialist")
			var_0_13(arg_20_0, arg_20_1, Cac.PerkTypes.SPECIAL_ONE, true)
		end,
		hasNewItem = #arg_16_0.newPerksRefTable[Cac.PerkTypes.SPECIAL_ONE] > 0
	}
	local var_16_4 = {
		perkLoadoutIndex = 1,
		isSpecialPerk = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_ACTIVE"),
		loadoutIndex = arg_16_0.loadoutIndex,
		focusFunction = function(arg_21_0, arg_21_1)
			Engine.DHFCHIIJCA("loadout_showcase_specialist")
			var_0_13(arg_21_0, arg_21_1, Cac.PerkTypes.SPECIAL_TWO, true)
		end,
		hasNewItem = #arg_16_0.newPerksRefTable[Cac.PerkTypes.SPECIAL_TWO] > 0
	}
	local var_16_5 = {
		perkLoadoutIndex = 2,
		isSpecialPerk = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/PERK_PASSIVE"),
		loadoutIndex = arg_16_0.loadoutIndex,
		focusFunction = function(arg_22_0, arg_22_1)
			Engine.DHFCHIIJCA("loadout_showcase_specialist")
			var_0_13(arg_22_0, arg_22_1, Cac.PerkTypes.SPECIAL_THREE, true)
		end,
		hasNewItem = #arg_16_0.newPerksRefTable[Cac.PerkTypes.SPECIAL_THREE] > 0
	}
	local var_16_6 = {
		var_16_0,
		var_16_1,
		var_16_2
	}

	if arg_16_2 then
		table.insert(var_16_6, var_16_3)
		table.insert(var_16_6, var_16_4)
		table.insert(var_16_6, var_16_5)
	end

	arg_16_0.tabsData = var_16_6

	arg_16_0.Tabs:SetTabs(var_16_6)
	arg_16_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

local function var_0_15(arg_23_0, arg_23_1)
	arg_23_0.perkTable = {
		[Cac.PerkTypes.CORE] = {},
		[Cac.PerkTypes.ACTIVE] = {},
		[Cac.PerkTypes.PASSIVE] = {},
		[Cac.PerkTypes.SPECIAL_ONE] = {},
		[Cac.PerkTypes.SPECIAL_TWO] = {},
		[Cac.PerkTypes.SPECIAL_THREE] = {}
	}
	arg_23_0.newPerksRefTable = {
		[Cac.PerkTypes.CORE] = {},
		[Cac.PerkTypes.ACTIVE] = {},
		[Cac.PerkTypes.PASSIVE] = {},
		[Cac.PerkTypes.SPECIAL_ONE] = {},
		[Cac.PerkTypes.SPECIAL_TWO] = {},
		[Cac.PerkTypes.SPECIAL_THREE] = {}
	}
	arg_23_0.selectedSpecialPerkTable = {}
	arg_23_0.specialPerkTable = {}

	for iter_23_0 = 0, StringTable.BFHCAIIDA(CSV.menuPerks.file) - 1 do
		local var_23_0 = CSV.ReadRow(CSV.menuPerks, iter_23_0)
		local var_23_1 = StringTable.BJJBBCJGEJ(CSV.perks.file, CSV.perks.cols.ref, var_23_0.ref)
		local var_23_2 = CSV.ReadRow(CSV.perks, var_23_1)
		local var_23_3 = StringTable.DIFCHIGDFB(CSV.menuPerks.file, CSV.menuPerks.cols.ref, var_23_2.ref, CSV.menuPerks.cols.slot)

		var_23_2.isUnlocked = PROGRESSION.IsUnlocked(arg_23_1, LOOT.itemTypes.PERK, var_23_2.ref)

		local var_23_4 = LOOT.GetItemID(LOOT.itemTypes.PERK, var_23_2.ref)

		var_23_2.isNew = Loot.HDJCADADF(arg_23_1, var_23_4)

		local var_23_5 = LOOT.GetItemID(LOOT.itemTypes.PERK, var_23_2.ref)

		var_23_2.unlockRank = PROGRESSION.GetUnlockRank(var_23_5)

		if not var_23_2.isUnlocked then
			var_23_2.unlockCriteria = PROGRESSION.GetUnlockText(arg_23_1, LOOT.itemTypes.PERK, var_23_2.ref)
		end

		local var_23_6 = tonumber(var_23_3)

		var_23_2.isRestricted = Restrictions.IsPerkRestricted(var_23_2.ref)
		var_23_2.mpDisabled = var_23_2.mpDisabled == var_0_0

		if var_23_2.sourceModel == nil or var_23_2.sourceModel == "" then
			var_23_2.sourceModel = "tag_origin"
		end

		if (CONDITIONS.IsMagmaGameMode() and var_23_2.mpDisabled or not var_23_2.mpDisabled) and (Engine.DDJFBBJAIG() or not var_23_2.isRestricted) then
			if var_23_2.isNew then
				table.insert(arg_23_0.newPerksRefTable[var_23_6], var_23_2.ref)
			end

			table.insert(arg_23_0.perkTable[var_23_6], var_23_2)

			local var_23_7 = tonumber(StringTable.DIFCHIGDFB(CSV.perks.file, CSV.perks.cols.ref, var_23_2.ref, CSV.perks.cols.specialist))

			if var_23_7 and var_23_7 > 0 then
				table.insert(arg_23_0.specialPerkTable, var_23_2)
			end
		end
	end

	arg_23_0.perkTable[Cac.PerkTypes.SPECIAL_ONE] = arg_23_0.specialPerkTable
	arg_23_0.perkTable[Cac.PerkTypes.SPECIAL_TWO] = arg_23_0.specialPerkTable
	arg_23_0.perkTable[Cac.PerkTypes.SPECIAL_THREE] = arg_23_0.specialPerkTable
end

local function var_0_16(arg_24_0)
	if arg_24_0.isSpecialPerkAvailable then
		if arg_24_0.BRWarningInfoFEPro then
			ACTIONS.AnimateSequence(arg_24_0.PerkSpecialistInfo.BRWarning, "Show")
		end

		if arg_24_0.isSpecialPerkActive then
			ACTIONS.AnimateSequence(arg_24_0, "SpecialPerkEnabled")
			ACTIONS.AnimateSequence(arg_24_0.PerkSpecialistInfo, "SpecialPerkEnabled")
		else
			ACTIONS.AnimateSequence(arg_24_0, "SpecialPerkDisabled")
			ACTIONS.AnimateSequence(arg_24_0.PerkSpecialistInfo, "SpecialPerkDisabled")
		end
	else
		ACTIONS.AnimateSequence(arg_24_0, "HideSpecialPerkPrompt")

		if arg_24_0.BRWarningInfoFEPro then
			ACTIONS.AnimateSequence(arg_24_0.BRWarningInfoFEPro, "Hide")
			ACTIONS.AnimateSequence(arg_24_0.PerkSpecialistInfo.BRWarning, "Hide")
		end
	end
end

local function var_0_17(arg_25_0, arg_25_1)
	var_0_16(arg_25_0)
	var_0_14(arg_25_0, arg_25_1, arg_25_0.isSpecialPerkActive and true or false)
end

local function var_0_18(arg_26_0, arg_26_1)
	if CONDITIONS.InFrontend() then
		if arg_26_0.isSpecialPerkActive then
			local var_26_0 = LOADOUT.GetLoadoutSelectedPerk(arg_26_1, arg_26_0.loadoutIndex, 0, true):get()
			local var_26_1 = LOADOUT.GetLoadoutSelectedPerk(arg_26_1, arg_26_0.loadoutIndex, 1, true):get()
			local var_26_2 = LOADOUT.GetLoadoutSelectedPerk(arg_26_1, arg_26_0.loadoutIndex, 2, true):get()
			local var_26_3 = LOADOUT.GetPerkDataByField(var_26_0, CSV.perks.cols.specialistModel)
			local var_26_4 = LOADOUT.GetPerkDataByField(var_26_1, CSV.perks.cols.specialistModel)
			local var_26_5 = LOADOUT.GetPerkDataByField(var_26_2, CSV.perks.cols.specialistModel)

			if var_26_3 == nil or #var_26_3 == 0 then
				var_26_3 = LOADOUT.GetPerkDataByField(var_26_0, CSV.perks.cols.model)
			end

			if var_26_4 == nil or #var_26_4 == 0 then
				var_26_4 = LOADOUT.GetPerkDataByField(var_26_1, CSV.perks.cols.model)
			end

			if var_26_5 == nil or #var_26_5 == 0 then
				var_26_5 = LOADOUT.GetPerkDataByField(var_26_2, CSV.perks.cols.model)
			end

			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, var_26_3)
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, var_26_4)
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, var_26_5)
		else
			local var_26_6 = "tag_origin"

			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PATCH_SPECIALIST, var_26_6)
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_ACTIVE_PATCH_SPECIALIST, var_26_6)
			var_0_4(CLIENT_MODEL.coreMPModels.PERK_PASSIVE_PATCH_SPECIALIST, var_26_6)
		end
	end
end

local function var_0_19(arg_27_0, arg_27_1)
	arg_27_0.isSpecialPerkActive = not arg_27_0.isSpecialPerkActive

	if CONDITIONS.InFrontend() then
		if arg_27_0.isSpecialPerkActive then
			local var_27_0 = LOADOUT.GetLoadoutPlayerData(arg_27_1, arg_27_0.loadoutIndex)

			CLIENT_MODEL.UpdatePatchSpecialistClientModels(arg_27_0, var_27_0)
		else
			CLIENT_MODEL.HidePatchSpecialistClientModels(arg_27_0.isSpecialPerkActive)
		end
	end

	LOADOUT.SetLoadoutUsingSpecialist(arg_27_1, arg_27_0.loadoutIndex, arg_27_0.isSpecialPerkActive and 1 or 0)
	var_0_17(arg_27_0, arg_27_1)
	var_0_18(arg_27_0, arg_27_1)
end

local function var_0_20(arg_28_0, arg_28_1)
	arg_28_0.bindButton:addEventHandler("button_alt1", function(arg_29_0, arg_29_1)
		if arg_28_0.isSpecialPerkAvailable then
			local var_29_0 = arg_29_0

			while var_29_0 ~= nil and var_29_0.id ~= "PerkSelect" do
				var_29_0 = arg_29_0:getParent()
			end

			var_0_19(var_29_0, arg_28_1)
		end
	end)

	arg_28_0.isSpecialPerkAvailable = PROGRESSION.IsSpecialistPerkUnlocked(arg_28_1)
	arg_28_0.isSpecialPerkActive = LOADOUT.GetLoadoutUsingSpecialist(arg_28_1, arg_28_0.loadoutIndex) > 0

	var_0_17(arg_28_0, arg_28_1)

	if arg_28_0.isSpecialPerkActive then
		var_0_18(arg_28_0, arg_28_1)
	end
end

local function var_0_21(arg_30_0, arg_30_1, arg_30_2)
	for iter_30_0 = 1, #arg_30_0.newPerksRefTable[arg_30_1] do
		if arg_30_0.newPerksRefTable[arg_30_1][iter_30_0] == arg_30_2 then
			table.remove(arg_30_0.newPerksRefTable[arg_30_1], iter_30_0)

			break
		end
	end

	if #arg_30_0.newPerksRefTable[arg_30_1] <= 0 then
		arg_30_0.Tabs:GetCurrentTab().NewItemSmallIcon:SetAlpha(0)
	end
end

local function var_0_22(arg_31_0, arg_31_1)
	if Engine.DDJFBBJAIG() then
		local var_31_0 = CONDITIONS.IsThirdGameMode()
		local var_31_1 = LUI.FlowManager.IsInStack("BRMainMenu")
		local var_31_2 = var_31_0 and not Onboarding.PerksCP.WasCompleted(arg_31_0, arg_31_1) or not var_31_0 and not Onboarding.Perks.WasCompleted(arg_31_0, arg_31_1)

		local function var_31_3(arg_32_0, arg_32_1)
			if not CONDITIONS.AreRestrictionsActive(arg_32_1) then
				local function var_32_0(arg_33_0, arg_33_1)
					var_0_19(arg_32_0, arg_33_1)
					ACTIONS.LeaveMenu(arg_33_0)
				end

				local var_32_1 = ONBOARDING_DATA.GetOnboardingSpecialistPerkData()

				var_32_1.confirmButton.action = var_32_0

				if not Onboarding.SpecialistPerk.WasCompleted(arg_32_0, arg_32_1) then
					LUI.FlowManager.RequestPopupMenu(arg_32_0, "onboardingfeaturepopup", true, arg_32_1, false, var_32_1)
					Onboarding.SpecialistPerk.MarkCompleted(arg_32_0, arg_32_1)
				end

				if PROGRESSION.IsSpecialistPerkUnlocked(arg_32_1) and var_0_1() then
					arg_32_0.HelperBar.ButtonHelperText:PushButtonPrompt({
						side = "left",
						button_ref = "button_r3",
						helper_text = Engine.CBBHFCGDIC("ONBOARDING/SPECIALIST_MODE_INFO")
					})

					local var_32_2 = LUI.UIBindButton.new()

					var_32_2.id = "selfBindButton"

					arg_32_0:addElement(var_32_2)

					arg_32_0.bindButton = var_32_2

					arg_32_0.bindButton:addEventHandler("button_right_stick", function(arg_34_0, arg_34_1)
						local var_34_0 = arg_34_1.controller or arg_32_1

						LUI.FlowManager.RequestPopupMenu(arg_32_0, "onboardingfeaturepopup", true, var_34_0, false, var_32_1)
					end)
				end
			end
		end

		if not var_31_1 and var_31_2 then
			local var_31_4 = ONBOARDING_DATA.GetOnboardingPerkData()

			if PROGRESSION.IsSpecialistPerkUnlocked(arg_31_1) and var_0_1() then
				local function var_31_5(arg_35_0, arg_35_1)
					ACTIONS.LeaveMenu(arg_35_0)
					var_31_3(arg_31_0, arg_35_1)
				end

				var_31_4.confirmButton.action = var_31_5
			end

			LUI.FlowManager.RequestPopupMenu(arg_31_0, "onboardingpopup", true, arg_31_1, false, var_31_4)

			if var_31_0 then
				Onboarding.PerksCP.MarkCompleted(arg_31_0, arg_31_1)
			else
				Onboarding.Perks.MarkCompleted(arg_31_0, arg_31_1)
			end
		elseif var_31_1 and not Onboarding.WZPerks.WasCompleted(arg_31_0, arg_31_1) then
			local var_31_6

			if CONDITIONS.IsWZWipFlowEnabled() and CONDITIONS.AreWZLoadoutsEnabled() then
				var_31_6 = ONBOARDING_DATA.GetCH2OnboardingWZPerksData()
			else
				var_31_6 = ONBOARDING_DATA.GetOnboardingWZPerksData()
			end

			LUI.FlowManager.RequestPopupMenu(arg_31_0, "onboardingpopup", true, arg_31_1, false, var_31_6)
			Onboarding.WZPerks.MarkCompleted(arg_31_0, arg_31_1)
		elseif PROGRESSION.IsSpecialistPerkUnlocked(arg_31_1) and var_0_1() then
			var_31_3(arg_31_0, arg_31_1)
		end
	end
end

local function var_0_23(arg_36_0, arg_36_1)
	if Engine.DDJFBBJAIG() then
		local var_36_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = true,
			controllerIndex = arg_36_1
		})

		var_36_0:SetSwayValues(4500, 0.06, 0.1)
		var_36_0:SetLimits(-0.3, 0.3, -0.3, 0.3)
		arg_36_0:addElement(var_36_0)

		local var_36_1 = WATCH.GetEquippedWatch(arg_36_1)

		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary,
			FrontEndScene.ClientWeapons.Watch
		})

		local var_36_2 = WEAPON.GetWeaponModel(arg_36_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

		arg_36_0:addElement(var_36_2)
		LOADOUT.RequestWatchAndWeaponModels(arg_36_1, arg_36_0.loadoutIndex)
		WATCH.SetWatchModelIfLoaded(arg_36_0, arg_36_1, var_36_2, var_36_1)
	end
end

local function var_0_24(arg_37_0, arg_37_1, arg_37_2)
	assert(arg_37_0.InfoPanel)

	arg_37_0.UpdatePerkTree = var_0_3
	arg_37_0.UpdatePerkClientModel = var_0_5
	arg_37_0.UpdatePerkClientSourceModel = var_0_6
	arg_37_0.UpdatePerkDisplayData = var_0_2
	arg_37_0.UpdatePerkList = var_0_12
	arg_37_0.RemovePerkFromTable = var_0_21
	arg_37_0._isSpecialPerk = false

	if Engine.BHICADFIHA() and not arg_37_2.loadoutIndex then
		DebugPrint("WARNING: Missing \"loadoutIndex\" option for PerkSelect menu. Only OK after a MyChanges.")

		arg_37_2.loadoutIndex = 0
	end

	assert(arg_37_2.loadoutIndex)

	arg_37_0.loadoutIndex = arg_37_2.loadoutIndex
	arg_37_0.perkLoadoutIndex = 0
	arg_37_0.selectedPerkButton = nil

	arg_37_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TITLE_PERK_SELECT")))
	var_0_23(arg_37_0, arg_37_1)
	arg_37_0.InfoPanel:SetupPanel(arg_37_0.InfoPanel:GetCurrentAnchorsAndPositions())
	var_0_15(arg_37_0, arg_37_1)
	var_0_12(arg_37_0, arg_37_1, Cac.PerkTypes.CORE)
	arg_37_0.bindButton:addEventHandler("button_secondary", function(arg_38_0, arg_38_1)
		ACTIONS.LeaveMenu(arg_37_0)
	end)

	local function var_37_0(arg_39_0, arg_39_1, arg_39_2)
		local var_39_0 = LOOT.GetItemID(LOOT.itemTypes.PERK, arg_39_2.ref)
		local var_39_1 = Loot.HDJCADADF(arg_39_1, var_39_0)
		local var_39_2 = arg_39_2.desc

		if CONDITIONS.IsMagmaGameMode() then
			var_39_2 = arg_39_2.brDesc
		elseif CONDITIONS.IsThirdGameMode() then
			var_39_2 = arg_39_2.cpDesc
		end

		local var_39_3 = CONDITIONS.AreRestrictionsActive(arg_39_1) or Restrictions.AreBarebonesRulesInUse()

		arg_39_0:UpdatePerkDisplayData(arg_39_1, arg_39_0._focusedPerkName, Engine.CBBHFCGDIC(var_39_2), not arg_39_2.isConflict and arg_39_2.isUnlocked, arg_39_2.isConflict and Engine.CBBHFCGDIC("LUA_MENU/PERK_IN_CONFLICT") or arg_39_2.unlockCriteria, var_39_1, arg_39_2.extraInfo and #arg_39_2.extraInfo > 0 and Engine.CBBHFCGDIC(arg_39_2.extraInfo) or "", Restrictions.IsPerkRestricted(arg_39_2.ref) and var_39_3, PERK.GetPerkPatchNotes(arg_39_2.ref), arg_39_2.unlockRank)
	end

	arg_37_0:addEventHandler("perk_button_over", function(arg_40_0, arg_40_1)
		local var_40_0 = arg_40_1.perkData

		if arg_40_1.isSelect then
			arg_40_0.InfoPanel:SetEquipped(true)
		else
			arg_40_0.InfoPanel:SetEquipped(false)
		end

		arg_40_0._focusedPerkName = ToUpperCase(Engine.CBBHFCGDIC(var_40_0.name))

		if Engine.DDJFBBJAIG() then
			if var_40_0.extraInfo and #var_40_0.extraInfo > 0 and Engine.ECHCFGDDDF() then
				arg_37_0.InfoPanel.ActionPrompt:SetAlpha(1)
			else
				arg_37_0.InfoPanel.ActionPrompt:SetAlpha(0)
			end
		end

		if CONDITIONS.IsBRGameType(arg_37_0) then
			arg_37_0.InfoPanel:SetShouldShowDisabledInfoBR(Cac.GetIsPerkDisabledForBR(var_40_0.ref))
		end

		var_37_0(arg_40_0, arg_37_1, var_40_0)
		arg_40_0:UpdatePerkTree(arg_37_1, var_40_0)

		if Engine.DDJFBBJAIG() then
			local var_40_1 = var_40_0.perkType

			if var_40_1 and var_40_1 > Cac.PerkTypes.NONE then
				local var_40_2 = var_40_0.model
				local var_40_3 = var_40_0.sourceModel

				if var_40_1 == Cac.PerkTypes.SPECIAL_ONE or var_40_1 == Cac.PerkTypes.SPECIAL_TWO or var_40_1 == Cac.PerkTypes.SPECIAL_THREE then
					local var_40_4 = LOADOUT.GetPerkDataByField(var_40_0.ref, CSV.perks.cols.specialistModel)

					if var_40_4 and #var_40_4 > 0 then
						var_40_2 = var_40_4
					end
				end

				arg_40_0:UpdatePerkClientModel(arg_37_1, tonumber(var_40_1), var_40_2)
				arg_40_0:UpdatePerkClientSourceModel(arg_37_1, tonumber(var_40_1), var_40_3)
			end
		end

		arg_37_0._perkData = var_40_0
	end)
	arg_37_0:addEventHandler("perk_button_action", function(arg_41_0, arg_41_1)
		local var_41_0 = arg_41_1.perkData
		local var_41_1 = arg_41_1.playerData
		local var_41_2 = LOADOUT.GetLoadoutSelectedPerk(arg_37_1, arg_37_0.loadoutIndex, arg_37_0.perkLoadoutIndex, LOADOUT.IsSpecialPerk(var_41_0.perkType))

		if arg_41_0.selectedPerkRef ~= var_41_0.ref then
			local var_41_3 = {
				iconScale = -0.3,
				displayTime = 3000,
				icon = "cac_equip_fill",
				iconColor = SWATCHES.genericMenu.notificationHighlight,
				header = Engine.CBBHFCGDIC("LUA_MENU/PERK_EQUIPPED"),
				description = Engine.CBBHFCGDIC(var_41_0.name),
				type = LUI.ToastManager.NotificationType.PerkEquipped,
				controllerIndex = arg_37_1
			}

			arg_41_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_41_3
			})
			arg_41_0.InfoPanel:SetEquipped(1)

			local var_41_4 = PERK.IsPerkOverkill(var_41_2:get())
			local var_41_5 = PERK.IsPerkOverkill(var_41_0.ref)
			local var_41_6 = var_41_1.loadouts[arg_41_0.loadoutIndex].weaponSetups[1]

			if var_41_4 and not var_41_5 then
				var_41_6.weapon:set(WEAPON.DefaultSecondary)
				WEAPON.WipeWeaponSetup(var_41_6)
			elseif var_41_5 and not var_41_4 then
				local var_41_7 = var_41_1.loadouts[arg_41_0.loadoutIndex].weaponSetups[0].weapon:get() == "iw8_sh_romeo870" and "iw8_ar_mike4" or "iw8_sh_romeo870"

				var_41_6.weapon:set(var_41_7)
				WEAPON.WipeWeaponSetup(var_41_6)
			end

			arg_41_0.lastSelectedPerkRef = var_41_2:get()

			var_41_2:set(var_41_0.ref)

			arg_41_0.selectedPerkRef = var_41_0.ref

			if arg_41_0.selectedPerkButton then
				arg_41_0.selectedPerkButton:SetSelected(false)
			end

			arg_41_0.selectedPerkButton = arg_41_1.source

			arg_41_1.source:SetSelected(true)
			arg_41_0.Tabs:GetCurrentTab():SetupPerkData(arg_37_1, var_41_0.ref, LOADOUT.IsSpecialPerk(var_41_0.perkType), var_0_9(arg_37_0), var_0_10(arg_37_0))
			arg_41_0:UpdatePerkList(arg_37_1, var_41_0.perkType, arg_41_0.perkLoadoutIndex, LOADOUT.IsSpecialPerk(var_41_0.perkType))

			if CONDITIONS.InGame() then
				Engine.EBHIFJCGBH("equip_item_ingame", 1)
			end
		end
	end)
	arg_37_0:addEventHandler("perk_button_up", function(arg_42_0, arg_42_1)
		arg_42_0:RemovePerkFromTable(arg_42_1.perkData.perkType, arg_42_1.perkData.ref)
	end)

	if CONDITIONS.InGame() and not CONDITIONS.IsThirdGameMode() then
		arg_37_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 5,
			ignoreTooltip = false,
			side = "left",
			kbmTooltipPromptOverload = "button_dismiss_pause_menu",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
		})
		arg_37_0.bindButton:addEventHandler("button_start", function(arg_43_0, arg_43_1)
			LUI.FlowManager.RequestCloseAllMenus()
		end)
	end

	var_0_22(arg_37_0, arg_37_1)

	if Engine.DDJFBBJAIG() then
		if CONDITIONS.IsCoreMultiplayer() then
			arg_37_0.bindButton:addEventHandler("button_alt2", function(arg_44_0, arg_44_1)
				if arg_37_0._perkData then
					arg_37_0.InfoPanel:ToggleExtraDesc()

					if arg_37_0.InfoPanel._showExtraDesc then
						arg_37_0.InfoPanel.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SHOW_LESS_INFO"))
						Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
					else
						arg_37_0.InfoPanel.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SHOW_MORE_INFO"))
						Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
					end

					var_37_0(arg_37_0, arg_37_1, arg_37_0._perkData)
				end
			end)
		else
			arg_37_0.InfoPanel.ActionPrompt:SetAlpha(0)
		end
	end

	var_0_14(arg_37_0, arg_37_1, false)

	if var_0_1() then
		var_0_20(arg_37_0, arg_37_1)
	end

	if arg_37_0.selectedPerkButton then
		var_37_0(arg_37_0, arg_37_1, arg_37_0.selectedPerkButton.perkData)
	end

	if arg_37_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_37_0.InGameMenuBackground)
	end

	local function var_37_1()
		local var_45_0 = CoD.GetAspectRatioScaleAdjust(0.7)

		arg_37_0.Vignette:SetScale(var_45_0)
	end

	arg_37_0:addAndCallEventHandler("onVideoChange", var_37_1)

	if not CONDITIONS.InGame(arg_37_0) then
		LAYOUT.AddAspectRatioFadeFrame(arg_37_0, arg_37_1)
	end

	if CONDITIONS.IsSplitscreen(arg_37_0) and CONDITIONS.InGame(arg_37_0) then
		ACTIONS.ScaleFullscreen(arg_37_0.Vignette)
		ACTIONS.AnimateSequence(arg_37_0, "Splitscreen")
	end

	if arg_37_0.BRWarningInfoFEPro then
		arg_37_0.BRWarningInfoFEPro:SetupWarning("LUA_MENU/BR_WARNING_PERK_SPECIALIST_DESC", 3)
	end
end

function PerkSelect(arg_46_0, arg_46_1)
	local var_46_0 = LUI.UIElement.new()

	var_46_0.id = "PerkSelect"
	var_46_0._animationSets = var_46_0._animationSets or {}
	var_46_0._sequences = var_46_0._sequences or {}

	local var_46_1 = arg_46_1 and arg_46_1.controllerIndex

	if not var_46_1 and not Engine.DDJFBBJAIG() then
		var_46_1 = var_46_0:getRootController()
	end

	assert(var_46_1)

	var_46_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_46_1
	})
	var_46_0.HelperBar.id = "HelperBar"

	var_46_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_46_0.HelperBar:setPriority(10)
	var_46_0:addElement(var_46_0.HelperBar)

	local var_46_2 = var_46_0
	local var_46_3

	if CONDITIONS.InGame(var_46_0) then
		local var_46_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_46_1
		})

		var_46_4.id = "InGameMenuBackground"

		var_46_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_46_0:addElement(var_46_4)

		var_46_0.InGameMenuBackground = var_46_4
	end

	local var_46_5
	local var_46_6 = LUI.UIImage.new()

	var_46_6.id = "Vignette"

	var_46_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_46_6:SetAlpha(0.5, 0)
	var_46_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_46_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1020, 0, 0)
	var_46_0:addElement(var_46_6)

	var_46_0.Vignette = var_46_6

	local var_46_7
	local var_46_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_46_1
	})

	var_46_8.id = "MenuTitle"

	var_46_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TITLE_PERK_SELECT")), 0)
	var_46_8.Line:SetLeft(0, 0)
	var_46_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_46_0:addElement(var_46_8)

	var_46_0.MenuTitle = var_46_8

	local var_46_9
	local var_46_10 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_46_1
	})

	var_46_10.id = "Cinematic"

	var_46_10:SetAlpha(0, 0)
	var_46_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1609, _1080p * 1790, _1080p * 278, _1080p * 457)
	var_46_0:addElement(var_46_10)

	var_46_0.Cinematic = var_46_10

	local var_46_11
	local var_46_12 = MenuBuilder.BuildRegisteredType("PerkDetails", {
		controllerIndex = var_46_1
	})

	var_46_12.id = "BasePerk"

	var_46_12:SetAlpha(0, 0)
	var_46_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 751, _1080p * 1067, _1080p * 524, _1080p * 840)
	var_46_0:addElement(var_46_12)

	var_46_0.BasePerk = var_46_12

	local var_46_13
	local var_46_14 = MenuBuilder.BuildRegisteredType("PerkDetails", {
		controllerIndex = var_46_1
	})

	var_46_14.id = "UpgradePerk1"

	var_46_14:SetAlpha(0, 0)
	var_46_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1309, _1080p * 1625, _1080p * 299, _1080p * 615)
	var_46_0:addElement(var_46_14)

	var_46_0.UpgradePerk1 = var_46_14

	local var_46_15
	local var_46_16 = MenuBuilder.BuildRegisteredType("PerkDetails", {
		controllerIndex = var_46_1
	})

	var_46_16.id = "UpgradePerk2"

	var_46_16:SetAlpha(0, 0)
	var_46_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1309, _1080p * 1625, _1080p * 664, _1080p * 980)
	var_46_0:addElement(var_46_16)

	var_46_0.UpgradePerk2 = var_46_16

	local var_46_17
	local var_46_18 = MenuBuilder.BuildRegisteredType("PerkSpecialistInfo", {
		controllerIndex = var_46_1
	})

	var_46_18.id = "PerkSpecialistInfo"

	var_46_18:SetAlpha(0, 0)
	var_46_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1274, _1080p * 1824, _1080p * 113, _1080p * 303)
	var_46_0:addElement(var_46_18)

	var_46_0.PerkSpecialistInfo = var_46_18

	local var_46_19
	local var_46_20 = {
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
		controllerIndex = var_46_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PerkButton", {
				controllerIndex = var_46_1
			})
		end,
		refreshChild = function(arg_48_0, arg_48_1, arg_48_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 546,
		rowHeight = _1080p * 62,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_46_21 = LUI.UIGrid.new(var_46_20)

	var_46_21.id = "perkGrid"

	var_46_21:setUseStencil(true)
	var_46_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 119, _1080p * 665, _1080p * 329, _1080p * 1024)
	var_46_0:addElement(var_46_21)

	var_46_0.perkGrid = var_46_21

	local var_46_22
	local var_46_23 = {
		spacing = 5,
		wrap = true,
		tabHeight = _1080p * 190,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("PerkTab", {
				controllerIndex = var_46_1
			})
		end,
		controllerIndex = var_46_1
	}
	local var_46_24 = LUI.TabManager.new(var_46_23)

	var_46_24.id = "Tabs"

	var_46_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 64, _1080p * 610, _1080p * 113, _1080p * 189)
	var_46_0:addElement(var_46_24)

	var_46_0.Tabs = var_46_24

	local var_46_25

	if CONDITIONS.InFrontendPublicMP(var_46_0) then
		local var_46_26 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_46_1
		})

		var_46_26.id = "MPPlayerDetails"

		var_46_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_46_0:addElement(var_46_26)

		var_46_0.MPPlayerDetails = var_46_26
	end

	local var_46_27
	local var_46_28 = MenuBuilder.BuildRegisteredType("PerkInfoPanel", {
		controllerIndex = var_46_1
	})

	var_46_28.id = "InfoPanel"

	if CONDITIONS.InFrontend(var_46_0) then
		var_46_28.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SHOW_MORE_INFO"), 0)
	end

	if CONDITIONS.InFrontend(var_46_0) then
		var_46_28.SecondActionPrompt:setText("", 0)
	end

	var_46_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 728, _1080p * 1255, _1080p * 329, _1080p * 420)
	var_46_0:addElement(var_46_28)

	var_46_0.InfoPanel = var_46_28

	local var_46_29

	if CONDITIONS.InFrontend(var_46_0) then
		local var_46_30 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_46_1
		})

		var_46_30.id = "LobbyMembersFooter"

		var_46_30:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_46_0:addElement(var_46_30)

		var_46_0.LobbyMembersFooter = var_46_30
	end

	local var_46_31

	if CONDITIONS.InGame(var_46_0) then
		local var_46_32 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_46_1
		})

		var_46_32.id = "InGameMenuTimerStatus"

		var_46_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -140, _1080p * 260, _1080p * 54, _1080p * 104)
		var_46_0:addElement(var_46_32)

		var_46_0.InGameMenuTimerStatus = var_46_32
	end

	local var_46_33
	local var_46_34 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_46_1
	})

	var_46_34.id = "VerticalMinimalScrollbar"

	var_46_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 687, _1080p * 329, _1080p * 919)
	var_46_0:addElement(var_46_34)

	var_46_0.VerticalMinimalScrollbar = var_46_34

	local var_46_35

	if Engine.DDJFBBJAIG() then
		var_46_35 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_46_1
		})
		var_46_35.id = "CDLRestrictionTag"

		var_46_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_46_0:addElement(var_46_35)

		var_46_0.CDLRestrictionTag = var_46_35
	end

	local var_46_36

	if CONDITIONS.IsMagmaGameMode(var_46_0) then
		local var_46_37 = MenuBuilder.BuildRegisteredType("BRWarningInfo", {
			controllerIndex = var_46_1
		})

		var_46_37.id = "BRWarningInfoFEPro"

		var_46_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 732, _1080p * 1255, _1080p * 624, _1080p * 654)
		var_46_0:addElement(var_46_37)

		var_46_0.BRWarningInfoFEPro = var_46_37
	end

	local var_46_38
	local var_46_39 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_46_1
	})

	var_46_39.id = "ArrowUp"

	var_46_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 292, _1080p * 324, _1080p * 923, _1080p * 955)
	var_46_0:addElement(var_46_39)

	var_46_0.ArrowUp = var_46_39

	local var_46_40
	local var_46_41 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_46_1
	})

	var_46_41.id = "ArrowDown"

	var_46_41.Arrow:SetZRotation(180, 0)
	var_46_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 460, _1080p * 492, _1080p * 923, _1080p * 955)
	var_46_0:addElement(var_46_41)

	var_46_0.ArrowDown = var_46_41

	local var_46_42
	local var_46_43 = LUI.UIText.new()

	var_46_43.id = "ListCount"

	var_46_43:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_46_43:setText("", 0)
	var_46_43:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_46_43:SetAlignment(LUI.Alignment.Center)
	var_46_43:SetVerticalAlignment(LUI.Alignment.Center)
	var_46_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 324, _1080p * 460, _1080p * 930, _1080p * 950)
	var_46_0:addElement(var_46_43)

	var_46_0.ListCount = var_46_43

	local function var_46_44()
		return
	end

	var_46_0._sequences.DefaultSequence = var_46_44

	local var_46_45
	local var_46_46 = {
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

	var_46_18:RegisterAnimationSequence("SpecialPerkDisabled", var_46_46)

	if Engine.DDJFBBJAIG() then
		local var_46_47 = {
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

		var_46_35:RegisterAnimationSequence("SpecialPerkDisabled", var_46_47)
	end

	local function var_46_48()
		var_46_18:AnimateSequence("SpecialPerkDisabled")

		if Engine.DDJFBBJAIG() then
			var_46_35:AnimateSequence("SpecialPerkDisabled")
		end
	end

	var_46_0._sequences.SpecialPerkDisabled = var_46_48

	local var_46_49
	local var_46_50 = {
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

	var_46_18:RegisterAnimationSequence("SpecialPerkEnabled", var_46_50)

	if Engine.DDJFBBJAIG() then
		local var_46_51 = {
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

		var_46_35:RegisterAnimationSequence("SpecialPerkEnabled", var_46_51)
	end

	local function var_46_52()
		var_46_18:AnimateSequence("SpecialPerkEnabled")

		if Engine.DDJFBBJAIG() then
			var_46_35:AnimateSequence("SpecialPerkEnabled")
		end
	end

	var_46_0._sequences.SpecialPerkEnabled = var_46_52

	local var_46_53
	local var_46_54 = {
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

	var_46_21:RegisterAnimationSequence("Splitscreen", var_46_54)

	local var_46_55 = {
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

	var_46_34:RegisterAnimationSequence("Splitscreen", var_46_55)

	local var_46_56 = {
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

	var_46_39:RegisterAnimationSequence("Splitscreen", var_46_56)

	local var_46_57 = {
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

	var_46_41:RegisterAnimationSequence("Splitscreen", var_46_57)

	local var_46_58 = {
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

	var_46_43:RegisterAnimationSequence("Splitscreen", var_46_58)

	local function var_46_59()
		var_46_21:AnimateSequence("Splitscreen")
		var_46_34:AnimateSequence("Splitscreen")
		var_46_39:AnimateSequence("Splitscreen")
		var_46_41:AnimateSequence("Splitscreen")
		var_46_43:AnimateSequence("Splitscreen")
	end

	var_46_0._sequences.Splitscreen = var_46_59

	local var_46_60
	local var_46_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_46_18:RegisterAnimationSequence("HideSpecialPerkPrompt", var_46_61)

	local function var_46_62()
		var_46_18:AnimateSequence("HideSpecialPerkPrompt")
	end

	var_46_0._sequences.HideSpecialPerkPrompt = var_46_62

	local var_46_63 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_46_34,
		startCap = var_46_34.startCap,
		endCap = var_46_34.endCap,
		sliderArea = var_46_34.sliderArea,
		slider = var_46_34.sliderArea and var_46_34.sliderArea.slider,
		fixedSizeSlider = var_46_34.sliderArea and var_46_34.sliderArea.fixedSizeSlider
	})

	var_46_21:AddScrollbar(var_46_63)
	var_46_21:AddArrow(var_46_39)
	var_46_21:AddArrow(var_46_41)
	var_46_21:AddItemNumbers(var_46_43)
	var_46_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_46_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_46_64 = LUI.UIBindButton.new()

	var_46_64.id = "selfBindButton"

	var_46_0:addElement(var_46_64)

	var_46_0.bindButton = var_46_64

	var_0_24(var_46_0, var_46_1, arg_46_1)

	return var_46_0
end

MenuBuilder.registerType("PerkSelect", PerkSelect)
LockTable(_M)
