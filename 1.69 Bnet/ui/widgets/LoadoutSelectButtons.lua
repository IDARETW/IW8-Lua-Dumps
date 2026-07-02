module(..., package.seeall)

local var_0_0 = hashset({})

local function var_0_1(arg_1_0)
	if CONDITIONS.LockS4Blueprints() and var_0_0[arg_1_0] then
		return false
	end

	return true
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	local var_2_0 = arg_2_4 and arg_2_4.weapons[WEAPON.PrimarySlot + 1].ref or arg_2_3.weaponSetups[WEAPON.PrimarySlot].weapon:get()

	arg_2_0._primary = var_2_0

	local var_2_1 = not GUNSMITH.IsDisabled(var_2_0)
	local var_2_2 = not GUNSMITH.IsCustomizationDisabled(var_2_0) and CONDITIONS.InFrontend()
	local var_2_3 = PROGRESSION.IsUnlocked(arg_2_1, LOOT.itemTypes.WEAPON, var_2_0)
	local var_2_4 = GUNSMITH.AreMasterChallengesEnabled(arg_2_1, var_2_0)

	if not var_0_1(var_2_0) then
		var_2_1 = false
		var_2_2 = false
		var_2_4 = false
	end

	local var_2_5 = arg_2_4 and arg_2_4.perks[1] or arg_2_3.loadoutPerks[0]:get()
	local var_2_6 = arg_2_4 and arg_2_4.perks[2] or arg_2_3.loadoutPerks[1]:get()
	local var_2_7 = arg_2_4 and arg_2_4.perks[3] or arg_2_3.loadoutPerks[2]:get()
	local var_2_8 = false

	if arg_2_4 then
		var_2_8 = LOADOUT.LookupDefaultClassItem(arg_2_1, arg_2_2, "loadoutSpecialist") == "TRUE"
	else
		var_2_8 = LOADOUT.GetLoadoutUsingSpecialist(arg_2_1, arg_2_2) > 0
	end

	if not PERK.IsPerkOverkill(var_2_5) and not PERK.IsPerkOverkill(var_2_6) then
		local var_2_9 = PERK.IsPerkOverkill(var_2_7)
	end

	local var_2_10 = WEAPON.SecondarySlot
	local var_2_11 = arg_2_4 and arg_2_4.weapons[var_2_10 + 1].ref or arg_2_3.weaponSetups[var_2_10].weapon:get()

	arg_2_0._secondary = var_2_11

	local var_2_12 = not GUNSMITH.IsDisabled(var_2_11)
	local var_2_13 = not GUNSMITH.IsCustomizationDisabled(var_2_11) and CONDITIONS.InFrontend()
	local var_2_14 = PROGRESSION.IsUnlocked(arg_2_1, LOOT.itemTypes.WEAPON, var_2_11)
	local var_2_15 = GUNSMITH.AreMasterChallengesEnabled(arg_2_1, var_2_11)
	local var_2_16 = arg_2_3 and arg_2_3.weaponSetups[0] or nil
	local var_2_17 = Engine.CBBHFCGDIC("LUA_MENU/TITLE_PRIMARY_WEAPON")
	local var_2_18 = arg_2_4 and arg_2_4.weapons[WEAPON.PrimarySlot + 1]
	local var_2_19 = arg_2_3 and arg_2_3.weaponSetups[var_2_10] or nil
	local var_2_20 = Engine.CBBHFCGDIC("LUA_MENU/TITLE_SECONDARY_WEAPON")
	local var_2_21 = arg_2_4 and arg_2_4.weapons[var_2_10 + 1]

	arg_2_0.loadoutIndex = arg_2_2

	arg_2_0.PrimaryWeaponCluster:SetupCluster(arg_2_1, var_2_16, arg_2_3, var_2_17, var_2_1, var_2_2, var_2_18)
	arg_2_0.SecondaryWeaponCluster:SetupCluster(arg_2_1, var_2_19, arg_2_3, var_2_20, var_2_12, var_2_13, var_2_21)

	arg_2_0._secondaryCameraType = WEAPON.GetGunTableSecondPositionScene(var_2_11)

	local var_2_22 = arg_2_4 and arg_2_4.lethal or arg_2_3.equipmentSetups[0].equipment:get()
	local var_2_23 = arg_2_4 and arg_2_4.tactical or arg_2_3.equipmentSetups[1].equipment:get()
	local var_2_24 = {}

	if var_2_8 and not CONDITIONS.IsThirdGameMode() and not CONDITIONS.InGameAndBR() and not Restrictions.ArePerksRestricted() then
		local var_2_25 = arg_2_4 and arg_2_4.extraPerks[1] or arg_2_3.extraPerks[0]:get()
		local var_2_26 = arg_2_4 and arg_2_4.extraPerks[2] or arg_2_3.extraPerks[1]:get()
		local var_2_27 = arg_2_4 and arg_2_4.extraPerks[3] or arg_2_3.extraPerks[2]:get()

		var_2_24 = {
			var_2_5,
			var_2_6,
			var_2_7,
			var_2_25,
			var_2_26,
			var_2_27
		}

		if CONDITIONS.IsGunGameClasses(arg_2_0) then
			ACTIONS.AnimateSequence(arg_2_0, "HideWeaponsSpecialist")
		elseif CONDITIONS.IsSplitscreen(arg_2_0) then
			ACTIONS.AnimateSequence(arg_2_0, "SplitscreenSpecialist")
		else
			ACTIONS.AnimateSequence(arg_2_0, "Specialist")
		end
	else
		var_2_24 = {
			var_2_5,
			var_2_6,
			var_2_7
		}

		if CONDITIONS.IsGunGameClasses(arg_2_0) then
			ACTIONS.AnimateSequence(arg_2_0, "HideWeapons")
		elseif CONDITIONS.IsSplitscreen(arg_2_0) then
			ACTIONS.AnimateSequence(arg_2_0, "Splitscreen")
		else
			ACTIONS.AnimateSequence(arg_2_0, "NoSpecialist")
		end
	end

	arg_2_0.PerkGridItem:SetupButton(arg_2_1, var_2_24)
	arg_2_0.PerkGridItem:SetButtonDisabled(Restrictions.ArePerksRestricted())
	arg_2_0.EquipmentGridItem:SetupButton(arg_2_1, var_2_22, LOOT.itemTypes.EQUIPMENT, "LUA_MENU/RIG_LETHAL")
	arg_2_0.TacticalGridItem:SetupButton(arg_2_1, var_2_23, LOOT.itemTypes.EQUIPMENT, "LUA_MENU/TITLE_TACTICAL")

	local function var_2_28(arg_3_0)
		local var_3_0 = (var_2_1 or var_2_2) and var_2_3
		local var_3_1 = arg_3_0.bundleVariants and arg_3_0.bundleVariants[var_2_0]

		arg_2_0.PrimaryWeaponCluster:ShowCustomizeButtons(var_3_0, var_2_4, var_3_1)
		arg_2_0.SecondaryWeaponCluster:HideCustomizeButtons()
	end

	local function var_2_29(arg_4_0)
		local var_4_0 = (var_2_12 or var_2_13) and var_2_14
		local var_4_1 = arg_4_0.bundleVariants and arg_4_0.bundleVariants[var_2_11]

		arg_2_0.SecondaryWeaponCluster:ShowCustomizeButtons(var_4_0, var_2_15, var_4_1)
		arg_2_0.PrimaryWeaponCluster:HideCustomizeButtons()
	end

	local function var_2_30()
		arg_2_0.PrimaryWeaponCluster:HideCustomizeButtons()
		arg_2_0.SecondaryWeaponCluster:HideCustomizeButtons()
	end

	local function var_2_31(arg_6_0)
		local var_6_0 = LUI.FlowManager.GetScopedData(arg_6_0)

		if arg_6_0 == arg_2_0.PrimaryWeaponCluster then
			var_2_28(var_6_0)

			if Engine.DDJFBBJAIG() then
				arg_6_0:dispatchEventToCurrentMenu({
					name = "update_bundle_upsell",
					weaponRef = var_2_0
				})
				arg_6_0:dispatchEventToCurrentMenu({
					name = "update_weapon_master_summary",
					weaponRef = var_2_0
				})
			end
		elseif arg_6_0 == arg_2_0.SecondaryWeaponCluster then
			var_2_29(var_6_0)

			if Engine.DDJFBBJAIG() then
				arg_6_0:dispatchEventToCurrentMenu({
					name = "update_bundle_upsell",
					weaponRef = var_2_11
				})
				arg_6_0:dispatchEventToCurrentMenu({
					name = "update_weapon_master_summary",
					weaponRef = var_2_11
				})
			end
		else
			var_2_30()

			if arg_6_0 and Engine.DDJFBBJAIG() then
				arg_6_0:dispatchEventToCurrentMenu({
					name = "update_weapon_master_summary"
				})
			end
		end
	end

	arg_2_0:registerEventHandler("DisplayLoadoutButtons", function(arg_7_0, arg_7_1)
		if arg_7_1.clusterID then
			if arg_7_1.clusterID == arg_2_0.PrimaryWeaponCluster.id then
				var_2_31(arg_2_0.PrimaryWeaponCluster)
			elseif arg_7_1.clusterID == arg_2_0.SecondaryWeaponCluster.id then
				var_2_31(arg_2_0.SecondaryWeaponCluster)
			end
		end
	end)
	arg_2_0.PrimaryWeaponCluster.WeaponButton:addEventHandler("button_over", function()
		var_2_31(arg_2_0.PrimaryWeaponCluster)
	end)
	arg_2_0.PrimaryWeaponCluster.AttachmentsButton:addEventHandler("button_over", function()
		var_2_31(arg_2_0.PrimaryWeaponCluster)
	end)
	arg_2_0.PrimaryWeaponCluster.ChallengesButton:addEventHandler("button_over", function()
		var_2_31(arg_2_0.PrimaryWeaponCluster)
	end)
	arg_2_0.PrimaryWeaponCluster.BlueprintStoreButton:addEventHandler("button_over", function()
		var_2_31(arg_2_0.PrimaryWeaponCluster)
	end)
	arg_2_0.SecondaryWeaponCluster.WeaponButton:addEventHandler("button_over", function()
		var_2_31(arg_2_0.SecondaryWeaponCluster)
	end)
	arg_2_0.SecondaryWeaponCluster.AttachmentsButton:addEventHandler("button_over", function()
		var_2_31(arg_2_0.SecondaryWeaponCluster)
	end)
	arg_2_0.SecondaryWeaponCluster.ChallengesButton:addEventHandler("button_over", function()
		var_2_31(arg_2_0.SecondaryWeaponCluster)
	end)
	arg_2_0.SecondaryWeaponCluster.BlueprintStoreButton:addEventHandler("button_over", function()
		var_2_31(arg_2_0.SecondaryWeaponCluster)
	end)
	arg_2_0.PerkGridItem:addEventHandler("button_over", function()
		var_2_31(arg_2_0.PerkGridItem)
	end)
	arg_2_0.TacticalGridItem:addEventHandler("button_over", function()
		var_2_31(arg_2_0.TacticalGridItem)
	end)
	arg_2_0.EquipmentGridItem:addEventHandler("button_over", function()
		var_2_31(arg_2_0.EquipmentGridItem)
	end)
	arg_2_0:addEventHandler("lose_focus", function(arg_19_0, arg_19_1)
		var_2_31(arg_19_0)
	end)
end

local function var_0_3(arg_20_0, arg_20_1)
	arg_20_0:dispatchEventToCurrentMenu({
		name = "update_camera_limits",
		isZoomed = arg_20_1
	})
end

local function var_0_4(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local function var_21_0(arg_22_0)
		return function(arg_23_0, arg_23_1)
			if arg_23_0.id == "WeaponButtonSecondary" or arg_23_0.id == "AttachmentsButtonSecondary" or arg_23_0.id == "BlueprintStoreButtonSecondary" or arg_23_0.id == "ChallengesButtonSecondary" then
				arg_22_0 = arg_21_0._secondaryCameraType
			end

			if not arg_21_0.modelsSetup then
				local var_23_0 = LUI.FlowManager.GetScopedData(arg_23_0)

				for iter_23_0 = 0, 1 do
					local var_23_1 = arg_21_3[var_23_0.selectedLoadoutIndex].weaponSetups[iter_23_0]
					local var_23_2 = WEAPON.GetWeaponModelNameFromPlayerData(var_23_1.weapon:get(), var_23_1, {
						includeCamos = true,
						includeAttachments = true,
						includeStickers = true,
						controllerIndex = arg_21_1
					})
					local var_23_3 = WEAPON.GenerateWeaponTable(var_23_1)

					WEAPON.SetModelIfLoaded(arg_21_1, arg_21_2[iter_23_0 + 1], var_23_2, {
						adjustSandbags = iter_23_0 == 0,
						modelWeaponTable = var_23_3
					})
				end

				arg_21_0.modelsSetup = true
			end

			Engine.DHFCHIIJCA(CONDITIONS.IsMultiplayer(arg_21_0) and arg_22_0 or "loadout_showcase")

			local var_23_4 = arg_22_0 == "loadout_showcase_p" or "loadout_showcase_o"

			var_0_3(arg_21_0, var_23_4)
		end
	end

	local function var_21_1(arg_24_0, arg_24_1)
		arg_24_0.WeaponButton:addEventHandler("button_over", var_21_0(arg_24_1))
		arg_24_0.AttachmentsButton:addEventHandler("button_over", var_21_0(arg_24_1))
		arg_24_0.BlueprintStoreButton:addEventHandler("button_over", var_21_0(arg_24_1))
		arg_24_0.ChallengesButton:addEventHandler("button_over", var_21_0(arg_24_1))
	end

	var_21_1(arg_21_0.PrimaryWeaponCluster, "loadout_showcase_p")
	var_21_1(arg_21_0.SecondaryWeaponCluster, "loadout_showcase_s")
	arg_21_0.PerkGridItem:addEventHandler("button_over", var_21_0("loadout_showcase_perks"))
	arg_21_0.EquipmentGridItem:addEventHandler("button_over", var_21_0("loadout_showcase_l"))
	arg_21_0.TacticalGridItem:addEventHandler("button_over", var_21_0("loadout_showcase_t"))
end

local function var_0_5(arg_25_0, arg_25_1)
	return function(arg_26_0, arg_26_1)
		local var_26_0 = arg_26_0

		while var_26_0 ~= nil and var_26_0.id ~= "LoadoutSelect" do
			var_26_0 = var_26_0:getParent()
		end

		local var_26_1

		if var_26_0 and var_26_0.streamer then
			var_26_1 = var_26_0.streamer:GetStreamedImageTable()
		end

		local var_26_2 = LUI.FlowManager.GetScopedData(arg_25_0)
		local var_26_3 = {
			weaponSlot = arg_25_1,
			loadoutIndex = var_26_2.selectedLoadoutIndex,
			streamedImageTable = var_26_1
		}

		LUI.FlowManager.RequestAddMenu("WeaponSelect", true, arg_26_1.controller, nil, var_26_3, true)
	end
end

local function var_0_6(arg_27_0, arg_27_1)
	return function(arg_28_0, arg_28_1)
		local var_28_0 = LUI.FlowManager.GetScopedData(arg_27_0)

		GUNSMITH.OpenGunsmith(arg_28_1.controller, var_28_0.selectedLoadoutIndex, arg_27_1)
	end
end

local function var_0_7(arg_29_0, arg_29_1)
	return function(arg_30_0, arg_30_1)
		local var_30_0 = LUI.FlowManager.GetScopedData(arg_29_0)
		local var_30_1 = {
			loadoutIndex = var_30_0.selectedLoadoutIndex,
			weaponSlot = arg_29_1
		}

		LUI.FlowManager.RequestAddMenu("WeaponMasterMenu", true, arg_30_1.controller, false, var_30_1, true)
	end
end

local function var_0_8(arg_31_0, arg_31_1)
	return function(arg_32_0, arg_32_1)
		local var_32_0 = arg_31_1 == WEAPON.PrimarySlot and arg_31_0._primary or arg_31_0._secondary
		local var_32_1 = LUI.FlowManager.GetScopedData(arg_31_0)
		local var_32_2 = {
			blueprintStore = true,
			weaponRef = var_32_0,
			weaponSlot = arg_31_1
		}

		LUI.FlowManager.RequestAddMenu("WeaponLocker", true, arg_32_1.controller, false, var_32_2, true)
	end
end

local function var_0_9(arg_33_0, arg_33_1)
	return function(arg_34_0, arg_34_1)
		local var_34_0 = LUI.FlowManager.GetScopedData(arg_33_0)
		local var_34_1 = {
			weaponSlot = arg_33_1,
			loadoutIndex = var_34_0.selectedLoadoutIndex
		}

		LUI.FlowManager.RequestAddMenu("WeaponCustomize", true, arg_34_1.controller, nil, var_34_1, true)
	end
end

local function var_0_10(arg_35_0)
	return function(arg_36_0, arg_36_1)
		local var_36_0 = LUI.FlowManager.GetScopedData(arg_35_0)
		local var_36_1 = {
			loadoutIndex = var_36_0.selectedLoadoutIndex
		}

		LUI.FlowManager.RequestAddMenu("PerkSelect", true, arg_36_1.controller, nil, var_36_1, true)
	end
end

local function var_0_11(arg_37_0, arg_37_1)
	return function(arg_38_0, arg_38_1)
		local var_38_0 = LUI.FlowManager.GetScopedData(arg_37_0)
		local var_38_1 = {
			equipmentIndex = arg_37_1,
			loadoutIndex = var_38_0.selectedLoadoutIndex
		}

		LUI.FlowManager.RequestAddMenu("EquipmentSelect", true, arg_38_1.controller, nil, var_38_1, true)
	end
end

local function var_0_12(arg_39_0, arg_39_1)
	arg_39_0._blockMouseMove = not arg_39_1
end

local function var_0_13(arg_40_0, arg_40_1)
	ACTIONS.AnimateSequence(arg_40_0, "HideAll")
	arg_40_0:registerEventHandler("gamepad_button", function(arg_41_0, arg_41_1)
		if arg_41_1.name == "gamepad_button" and arg_41_1.down then
			if arg_41_1.button == "right_trigger" then
				ACTIONS.AnimateSequence(arg_41_0, "ShowLoadout")
			end
		elseif arg_41_1.name == "gamepad_button" and arg_41_1.button == "right_trigger" then
			ACTIONS.AnimateSequence(arg_41_0, "HideLoadout")
		end
	end)
end

local function var_0_14(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0.SetupGridItems = var_0_2
	arg_42_0.SetupLoadoutPreview = var_0_13
	arg_42_0.SetupWeaponModelEvents = var_0_4
	arg_42_0.SetupButtons = SetupButtons
	arg_42_0.SetMouseHandling = var_0_12
	arg_42_0._secondaryCameraType = "loadout_showcase_s"

	arg_42_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	arg_42_0.PrimaryWeaponCluster.WeaponButton.id = "WeaponButtonPrimary"
	arg_42_0.PrimaryWeaponCluster.AttachmentsButton.id = "AttachmentsButtonPrimary"
	arg_42_0.PrimaryWeaponCluster.BlueprintStoreButton.id = "BlueprintStoreButtonPrimary"
	arg_42_0.PrimaryWeaponCluster.ChallengesButton.id = "ChallengesButtonPrimary"
	arg_42_0.SecondaryWeaponCluster.WeaponButton.id = "WeaponButtonSecondary"
	arg_42_0.SecondaryWeaponCluster.AttachmentsButton.id = "AttachmentsButtonSecondary"
	arg_42_0.SecondaryWeaponCluster.BlueprintStoreButton.id = "BlueprintStoreButtonSecondary"
	arg_42_0.SecondaryWeaponCluster.ChallengesButton.id = "ChallengesButtonSecondary"

	if CONDITIONS.IsGunGameClasses(arg_42_0) then
		arg_42_0:RemoveElement(arg_42_0.PrimaryWeaponCluster)
		arg_42_0:RemoveElement(arg_42_0.SecondaryWeaponCluster)

		arg_42_0.PerkGridItem.navigation = {}
		arg_42_0.PerkGridItem.navigation.up = arg_42_0.TacticalGridItem
		arg_42_0.PerkGridItem.navigation.down = arg_42_0.EquipmentGridItem
		arg_42_0.EquipmentGridItem.navigation = {}
		arg_42_0.EquipmentGridItem.navigation.up = arg_42_0.PerkGridItem
		arg_42_0.EquipmentGridItem.navigation.down = arg_42_0.TacticalGridItem
		arg_42_0.TacticalGridItem.navigation = {}
		arg_42_0.TacticalGridItem.navigation.up = arg_42_0.EquipmentGridItem
		arg_42_0.TacticalGridItem.navigation.down = arg_42_0.PerkGridItem

		arg_42_0.PerkGridItem:addEventHandler("button_action", var_0_10(arg_42_0))
		arg_42_0.EquipmentGridItem:addEventHandler("button_action", var_0_11(arg_42_0, 0))
		arg_42_0.TacticalGridItem:addEventHandler("button_action", var_0_11(arg_42_0, 1))
		arg_42_0.PerkGridItem:SetButtonDisabled(Restrictions.ArePerksRestricted())
	else
		arg_42_0.PrimaryWeaponCluster.WeaponButton:addEventHandler("button_action", var_0_5(arg_42_0, WEAPON.PrimarySlot))
		arg_42_0.SecondaryWeaponCluster.WeaponButton:addEventHandler("button_action", var_0_5(arg_42_0, WEAPON.SecondarySlot))
		arg_42_0.PrimaryWeaponCluster.AttachmentsButton:addEventHandler("button_action", var_0_6(arg_42_0, WEAPON.PrimarySlot))
		arg_42_0.SecondaryWeaponCluster.AttachmentsButton:addEventHandler("button_action", var_0_6(arg_42_0, WEAPON.SecondarySlot))
		arg_42_0.PrimaryWeaponCluster.ChallengesButton:addEventHandler("button_action", var_0_7(arg_42_0, WEAPON.PrimarySlot))
		arg_42_0.SecondaryWeaponCluster.ChallengesButton:addEventHandler("button_action", var_0_7(arg_42_0, WEAPON.SecondarySlot))
		arg_42_0.PrimaryWeaponCluster.BlueprintStoreButton:addEventHandler("button_action", var_0_8(arg_42_0, WEAPON.PrimarySlot))
		arg_42_0.SecondaryWeaponCluster.BlueprintStoreButton:addEventHandler("button_action", var_0_8(arg_42_0, WEAPON.SecondarySlot))
		arg_42_0.PerkGridItem:addEventHandler("button_action", var_0_10(arg_42_0))
		arg_42_0.EquipmentGridItem:addEventHandler("button_action", var_0_11(arg_42_0, 0))
		arg_42_0.TacticalGridItem:addEventHandler("button_action", var_0_11(arg_42_0, 1))
		arg_42_0.PerkGridItem:SetButtonDisabled(Restrictions.ArePerksRestricted())

		arg_42_0.PrimaryWeaponCluster.navigation = {}
		arg_42_0.PrimaryWeaponCluster.navigation.down = arg_42_0.SecondaryWeaponCluster

		if CONDITIONS.IsSplitscreen(arg_42_0) then
			arg_42_0.PrimaryWeaponCluster.navigation.up = arg_42_0.SecondaryWeaponCluster.WeaponButton
			arg_42_0.PrimaryWeaponCluster.navigation.right = arg_42_0.PerkGridItem
		else
			arg_42_0.PrimaryWeaponCluster.navigation.up = arg_42_0.TacticalGridItem
		end

		arg_42_0.SecondaryWeaponCluster.navigation = {}
		arg_42_0.SecondaryWeaponCluster.navigation.up = arg_42_0.PrimaryWeaponCluster.WeaponButton

		if CONDITIONS.IsSplitscreen(arg_42_0) then
			arg_42_0.SecondaryWeaponCluster.navigation.right = arg_42_0.PerkGridItem
			arg_42_0.SecondaryWeaponCluster.navigation.down = arg_42_0.PrimaryWeaponCluster.WeaponButton
		else
			arg_42_0.SecondaryWeaponCluster.navigation.down = arg_42_0.PerkGridItem
		end

		arg_42_0.PerkGridItem.navigation = {}

		if CONDITIONS.IsSplitscreen(arg_42_0) then
			arg_42_0.PerkGridItem.navigation.left = arg_42_0.PrimaryWeaponCluster.WeaponButton
			arg_42_0.PerkGridItem.navigation.up = arg_42_0.TacticalGridItem
		else
			arg_42_0.PerkGridItem.navigation.up = arg_42_0.SecondaryWeaponCluster
		end

		arg_42_0.PerkGridItem.navigation.down = arg_42_0.EquipmentGridItem
		arg_42_0.EquipmentGridItem.navigation = {}
		arg_42_0.EquipmentGridItem.navigation.up = arg_42_0.PerkGridItem
		arg_42_0.EquipmentGridItem.navigation.down = arg_42_0.TacticalGridItem

		if CONDITIONS.IsSplitscreen(arg_42_0) then
			arg_42_0.EquipmentGridItem.navigation.left = arg_42_0.PrimaryWeaponCluster.WeaponButton
		end

		arg_42_0.TacticalGridItem.navigation = {}
		arg_42_0.TacticalGridItem.navigation.up = arg_42_0.EquipmentGridItem

		if CONDITIONS.IsSplitscreen(arg_42_0) then
			arg_42_0.TacticalGridItem.navigation.down = arg_42_0.PerkGridItem
			arg_42_0.TacticalGridItem.navigation.left = arg_42_0.PrimaryWeaponCluster.WeaponButton
		else
			arg_42_0.TacticalGridItem.navigation.down = arg_42_0.PrimaryWeaponCluster.WeaponButton
		end
	end

	if CONDITIONS.IsSplitscreen(arg_42_0) then
		ACTIONS.AnimateSequence(arg_42_0, "Splitscreen")
	end
end

function LoadoutSelectButtons(arg_43_0, arg_43_1)
	local var_43_0 = LUI.UIElement.new()

	var_43_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1154 * _1080p, 0, 916 * _1080p)

	var_43_0.id = "LoadoutSelectButtons"
	var_43_0._animationSets = var_43_0._animationSets or {}
	var_43_0._sequences = var_43_0._sequences or {}

	local var_43_1 = arg_43_1 and arg_43_1.controllerIndex

	if not var_43_1 and not Engine.DDJFBBJAIG() then
		var_43_1 = var_43_0:getRootController()
	end

	assert(var_43_1)

	local var_43_2 = var_43_0
	local var_43_3
	local var_43_4 = MenuBuilder.BuildRegisteredType("LoadoutWeaponCluster", {
		controllerIndex = var_43_1
	})

	var_43_4.id = "PrimaryWeaponCluster"

	var_43_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, 0, _1080p * 190)
	var_43_0:addElement(var_43_4)

	var_43_0.PrimaryWeaponCluster = var_43_4

	local var_43_5
	local var_43_6 = MenuBuilder.BuildRegisteredType("LoadoutWeaponCluster", {
		controllerIndex = var_43_1
	})

	var_43_6.id = "SecondaryWeaponCluster"

	var_43_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, _1080p * 202, _1080p * 392)
	var_43_0:addElement(var_43_6)

	var_43_0.SecondaryWeaponCluster = var_43_6

	local var_43_7
	local var_43_8 = MenuBuilder.BuildRegisteredType("LoadoutItemPerkButton", {
		controllerIndex = var_43_1
	})

	var_43_8.id = "PerkGridItem"

	var_43_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, _1080p * 404, _1080p * 519)
	var_43_0:addElement(var_43_8)

	var_43_0.PerkGridItem = var_43_8

	local var_43_9
	local var_43_10 = MenuBuilder.BuildRegisteredType("LoadoutItemButton", {
		controllerIndex = var_43_1
	})

	var_43_10.id = "EquipmentGridItem"

	var_43_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, _1080p * 531, _1080p * 617)
	var_43_0:addElement(var_43_10)

	var_43_0.EquipmentGridItem = var_43_10

	local var_43_11
	local var_43_12 = MenuBuilder.BuildRegisteredType("LoadoutItemButton", {
		controllerIndex = var_43_1
	})

	var_43_12.id = "TacticalGridItem"

	var_43_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, _1080p * 629, _1080p * 715)
	var_43_0:addElement(var_43_12)

	var_43_0.TacticalGridItem = var_43_12

	local var_43_13
	local var_43_14 = LUI.UIImage.new()

	var_43_14.id = "BorderTop"

	var_43_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -6, _1080p * -6, _1080p * 18, _1080p * 19)
	var_43_0:addElement(var_43_14)

	var_43_0.BorderTop = var_43_14

	local var_43_15
	local var_43_16 = LUI.UIImage.new()

	var_43_16.id = "BorderRight"

	var_43_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 5, _1080p * 6, _1080p * 19, _1080p * 19)
	var_43_0:addElement(var_43_16)

	var_43_0.BorderRight = var_43_16

	local var_43_17
	local var_43_18 = LUI.UIImage.new()

	var_43_18.id = "BorderBottom"

	var_43_18:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * 5, _1080p * 5, _1080p * -91, _1080p * -90)
	var_43_0:addElement(var_43_18)

	var_43_0.BorderBottom = var_43_18

	local var_43_19
	local var_43_20 = LUI.UIImage.new()

	var_43_20.id = "BorderLeft"

	var_43_20:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -6, _1080p * -5, _1080p * -139, _1080p * -139)
	var_43_0:addElement(var_43_20)

	var_43_0.BorderLeft = var_43_20

	local var_43_21
	local var_43_22 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_43_1
	})

	var_43_22.id = "EquippedWidget"

	var_43_22:SetAlpha(0, 0)
	var_43_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 268, _1080p * 404, _1080p * -30, 0)
	var_43_0:addElement(var_43_22)

	var_43_0.EquippedWidget = var_43_22

	local function var_43_23()
		return
	end

	var_43_0._sequences.DefaultSequence = var_43_23

	local var_43_24
	local var_43_25 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 205,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_43_10:RegisterAnimationSequence("ShowLoadout", var_43_25)

	local var_43_26 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 215,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 420,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_43_12:RegisterAnimationSequence("ShowLoadout", var_43_26)

	local function var_43_27()
		var_43_10:AnimateSequence("ShowLoadout")
		var_43_12:AnimateSequence("ShowLoadout")
	end

	var_43_0._sequences.ShowLoadout = var_43_27

	local var_43_28
	local var_43_29 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 165,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 370,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_43_10:RegisterAnimationSequence("HideLoadout", var_43_29)

	local var_43_30 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 380,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 585,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_43_12:RegisterAnimationSequence("HideLoadout", var_43_30)

	local function var_43_31()
		var_43_10:AnimateSequence("HideLoadout")
		var_43_12:AnimateSequence("HideLoadout")
	end

	var_43_0._sequences.HideLoadout = var_43_31

	local var_43_32
	local var_43_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 370
		}
	}

	var_43_10:RegisterAnimationSequence("HideAll", var_43_33)

	local var_43_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 380
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 585
		}
	}

	var_43_12:RegisterAnimationSequence("HideAll", var_43_34)

	local var_43_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		}
	}

	var_43_14:RegisterAnimationSequence("HideAll", var_43_35)

	local var_43_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		}
	}

	var_43_16:RegisterAnimationSequence("HideAll", var_43_36)

	local var_43_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 5
		}
	}

	var_43_18:RegisterAnimationSequence("HideAll", var_43_37)

	local var_43_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_43_20:RegisterAnimationSequence("HideAll", var_43_38)

	local function var_43_39()
		var_43_10:AnimateSequence("HideAll")
		var_43_12:AnimateSequence("HideAll")
		var_43_14:AnimateSequence("HideAll")
		var_43_16:AnimateSequence("HideAll")
		var_43_18:AnimateSequence("HideAll")
		var_43_20:AnimateSequence("HideAll")
	end

	var_43_0._sequences.HideAll = var_43_39

	local var_43_40
	local var_43_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		}
	}

	var_43_4:RegisterAnimationSequence("Splitscreen", var_43_41)

	local var_43_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 152
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 342
		}
	}

	var_43_6:RegisterAnimationSequence("Splitscreen", var_43_42)

	local var_43_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 942
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		}
	}

	var_43_8:RegisterAnimationSequence("Splitscreen", var_43_43)

	local var_43_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 942
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 182
		}
	}

	var_43_10:RegisterAnimationSequence("Splitscreen", var_43_44)

	local var_43_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 942
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302
		}
	}

	var_43_12:RegisterAnimationSequence("Splitscreen", var_43_45)

	local var_43_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -31
		}
	}

	var_43_14:RegisterAnimationSequence("Splitscreen", var_43_46)

	local var_43_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -31
		}
	}

	var_43_16:RegisterAnimationSequence("Splitscreen", var_43_47)

	local var_43_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 414
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -638
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 415
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -638
		}
	}

	var_43_20:RegisterAnimationSequence("Splitscreen", var_43_48)

	local var_43_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -50
		}
	}

	var_43_22:RegisterAnimationSequence("Splitscreen", var_43_49)

	local function var_43_50()
		var_43_4:AnimateSequence("Splitscreen")
		var_43_6:AnimateSequence("Splitscreen")
		var_43_8:AnimateSequence("Splitscreen")
		var_43_10:AnimateSequence("Splitscreen")
		var_43_12:AnimateSequence("Splitscreen")
		var_43_14:AnimateSequence("Splitscreen")
		var_43_16:AnimateSequence("Splitscreen")
		var_43_20:AnimateSequence("Splitscreen")
		var_43_22:AnimateSequence("Splitscreen")
	end

	var_43_0._sequences.Splitscreen = var_43_50

	local var_43_51
	local var_43_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 578
		}
	}

	var_43_8:RegisterAnimationSequence("Specialist", var_43_52)

	local var_43_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 589
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 675
		}
	}

	var_43_10:RegisterAnimationSequence("Specialist", var_43_53)

	local var_43_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 687
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 773
		}
	}

	var_43_12:RegisterAnimationSequence("Specialist", var_43_54)

	local function var_43_55()
		var_43_8:AnimateSequence("Specialist")
		var_43_10:AnimateSequence("Specialist")
		var_43_12:AnimateSequence("Specialist")
	end

	var_43_0._sequences.Specialist = var_43_55

	local var_43_56
	local var_43_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 519
		}
	}

	var_43_8:RegisterAnimationSequence("NoSpecialist", var_43_57)

	local var_43_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 531
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 617
		}
	}

	var_43_10:RegisterAnimationSequence("NoSpecialist", var_43_58)

	local var_43_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 629
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 715
		}
	}

	var_43_12:RegisterAnimationSequence("NoSpecialist", var_43_59)

	local function var_43_60()
		var_43_8:AnimateSequence("NoSpecialist")
		var_43_10:AnimateSequence("NoSpecialist")
		var_43_12:AnimateSequence("NoSpecialist")
	end

	var_43_0._sequences.NoSpecialist = var_43_60

	local var_43_61
	local var_43_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 140
		}
	}

	var_43_4:RegisterAnimationSequence("SplitscreenSpecialist", var_43_62)

	local var_43_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 152
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 342
		}
	}

	var_43_6:RegisterAnimationSequence("SplitscreenSpecialist", var_43_63)

	local var_43_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 942
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		}
	}

	var_43_8:RegisterAnimationSequence("SplitscreenSpecialist", var_43_64)

	local var_43_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 942
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 239
		}
	}

	var_43_10:RegisterAnimationSequence("SplitscreenSpecialist", var_43_65)

	local var_43_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 249
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 942
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 359
		}
	}

	var_43_12:RegisterAnimationSequence("SplitscreenSpecialist", var_43_66)

	local var_43_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -31
		}
	}

	var_43_14:RegisterAnimationSequence("SplitscreenSpecialist", var_43_67)

	local var_43_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -42
		}
	}

	var_43_16:RegisterAnimationSequence("SplitscreenSpecialist", var_43_68)

	local var_43_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 414
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -638
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 415
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -638
		}
	}

	var_43_20:RegisterAnimationSequence("SplitscreenSpecialist", var_43_69)

	local var_43_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -50
		}
	}

	var_43_22:RegisterAnimationSequence("SplitscreenSpecialist", var_43_70)

	local function var_43_71()
		var_43_4:AnimateSequence("SplitscreenSpecialist")
		var_43_6:AnimateSequence("SplitscreenSpecialist")
		var_43_8:AnimateSequence("SplitscreenSpecialist")
		var_43_10:AnimateSequence("SplitscreenSpecialist")
		var_43_12:AnimateSequence("SplitscreenSpecialist")
		var_43_14:AnimateSequence("SplitscreenSpecialist")
		var_43_16:AnimateSequence("SplitscreenSpecialist")
		var_43_20:AnimateSequence("SplitscreenSpecialist")
		var_43_22:AnimateSequence("SplitscreenSpecialist")
	end

	var_43_0._sequences.SplitscreenSpecialist = var_43_71

	local var_43_72
	local var_43_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_43_4:RegisterAnimationSequence("HideWeapons", var_43_73)

	local var_43_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_43_6:RegisterAnimationSequence("HideWeapons", var_43_74)

	local var_43_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 404
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 129
		}
	}

	var_43_8:RegisterAnimationSequence("HideWeapons", var_43_75)

	local var_43_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 288
		}
	}

	var_43_10:RegisterAnimationSequence("HideWeapons", var_43_76)

	local var_43_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 383
		}
	}

	var_43_12:RegisterAnimationSequence("HideWeapons", var_43_77)

	local function var_43_78()
		var_43_4:AnimateSequence("HideWeapons")
		var_43_6:AnimateSequence("HideWeapons")
		var_43_8:AnimateSequence("HideWeapons")
		var_43_10:AnimateSequence("HideWeapons")
		var_43_12:AnimateSequence("HideWeapons")
	end

	var_43_0._sequences.HideWeapons = var_43_78

	local var_43_79
	local var_43_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_43_4:RegisterAnimationSequence("HideWeaponsSpecialist", var_43_80)

	local var_43_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_43_6:RegisterAnimationSequence("HideWeaponsSpecialist", var_43_81)

	local var_43_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 404
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 193
		}
	}

	var_43_8:RegisterAnimationSequence("HideWeaponsSpecialist", var_43_82)

	local var_43_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 288
		}
	}

	var_43_10:RegisterAnimationSequence("HideWeaponsSpecialist", var_43_83)

	local var_43_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 383
		}
	}

	var_43_12:RegisterAnimationSequence("HideWeaponsSpecialist", var_43_84)

	local function var_43_85()
		var_43_4:AnimateSequence("HideWeaponsSpecialist")
		var_43_6:AnimateSequence("HideWeaponsSpecialist")
		var_43_8:AnimateSequence("HideWeaponsSpecialist")
		var_43_10:AnimateSequence("HideWeaponsSpecialist")
		var_43_12:AnimateSequence("HideWeaponsSpecialist")
	end

	var_43_0._sequences.HideWeaponsSpecialist = var_43_85

	var_0_14(var_43_0, var_43_1, arg_43_1)

	return var_43_0
end

MenuBuilder.registerType("LoadoutSelectButtons", LoadoutSelectButtons)
LockTable(_M)
