module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = arg_1_4 and arg_1_4.weapons[WEAPON.PrimarySlot + 1].ref or arg_1_3.weaponSetups[WEAPON.PrimarySlot].weapon:get()

	arg_1_0._primary = var_1_0

	local var_1_1 = not GUNSMITH.IsDisabled(var_1_0)
	local var_1_2 = not GUNSMITH.IsCustomizationDisabled(var_1_0) and CONDITIONS.InFrontend()
	local var_1_3 = PROGRESSION.IsUnlocked(arg_1_1, LOOT.itemTypes.WEAPON, var_1_0)
	local var_1_4 = GUNSMITH.AreMasterChallengesEnabled(arg_1_1, var_1_0)
	local var_1_5 = arg_1_4 and arg_1_4.perks[1] or arg_1_3.loadoutPerks[0]:get()
	local var_1_6 = arg_1_4 and arg_1_4.perks[2] or arg_1_3.loadoutPerks[1]:get()
	local var_1_7 = arg_1_4 and arg_1_4.perks[3] or arg_1_3.loadoutPerks[2]:get()
	local var_1_8 = false

	if arg_1_4 then
		var_1_8 = LOADOUT.LookupDefaultClassItem(arg_1_1, arg_1_2, "loadoutSpecialist") == "TRUE"
	else
		var_1_8 = LOADOUT.GetLoadoutUsingSpecialist(arg_1_1, arg_1_2) > 0
	end

	if not PERK.IsPerkOverkill(var_1_5) and not PERK.IsPerkOverkill(var_1_6) then
		local var_1_9 = PERK.IsPerkOverkill(var_1_7)
	end

	local var_1_10 = WEAPON.SecondarySlot
	local var_1_11 = arg_1_4 and arg_1_4.weapons[var_1_10 + 1].ref or arg_1_3.weaponSetups[var_1_10].weapon:get()

	arg_1_0._secondary = var_1_11

	local var_1_12 = not GUNSMITH.IsDisabled(var_1_11)
	local var_1_13 = not GUNSMITH.IsCustomizationDisabled(var_1_11) and CONDITIONS.InFrontend()
	local var_1_14 = PROGRESSION.IsUnlocked(arg_1_1, LOOT.itemTypes.WEAPON, var_1_11)
	local var_1_15 = GUNSMITH.AreMasterChallengesEnabled(arg_1_1, var_1_11)
	local var_1_16 = arg_1_3 and arg_1_3.weaponSetups[0] or nil
	local var_1_17 = Engine.CBBHFCGDIC("LUA_MENU/TITLE_PRIMARY_WEAPON")
	local var_1_18 = arg_1_4 and arg_1_4.weapons[WEAPON.PrimarySlot + 1]
	local var_1_19 = arg_1_3 and arg_1_3.weaponSetups[var_1_10] or nil
	local var_1_20 = Engine.CBBHFCGDIC("LUA_MENU/TITLE_SECONDARY_WEAPON")
	local var_1_21 = arg_1_4 and arg_1_4.weapons[var_1_10 + 1]

	arg_1_0.loadoutIndex = arg_1_2

	arg_1_0.PrimaryWeaponCluster:SetupCluster(arg_1_1, var_1_16, arg_1_3, var_1_17, var_1_1, var_1_2, var_1_18)
	arg_1_0.SecondaryWeaponCluster:SetupCluster(arg_1_1, var_1_19, arg_1_3, var_1_20, var_1_12, var_1_13, var_1_21)

	arg_1_0._secondaryCameraType = WEAPON.GetGunTableSecondPositionScene(var_1_11)

	local var_1_22 = arg_1_4 and arg_1_4.lethal or arg_1_3.equipmentSetups[0].equipment:get()
	local var_1_23 = arg_1_4 and arg_1_4.tactical or arg_1_3.equipmentSetups[1].equipment:get()
	local var_1_24 = {}

	if var_1_8 and not CONDITIONS.IsThirdGameMode() and not CONDITIONS.InGameAndBR() then
		local var_1_25 = arg_1_4 and arg_1_4.extraPerks[1] or arg_1_3.extraPerks[0]:get()
		local var_1_26 = arg_1_4 and arg_1_4.extraPerks[2] or arg_1_3.extraPerks[1]:get()
		local var_1_27 = arg_1_4 and arg_1_4.extraPerks[3] or arg_1_3.extraPerks[2]:get()

		var_1_24 = {
			var_1_5,
			var_1_6,
			var_1_7,
			var_1_25,
			var_1_26,
			var_1_27
		}

		if CONDITIONS.IsSplitscreen(arg_1_0) then
			ACTIONS.AnimateSequence(arg_1_0, "SplitscreenSpecialist")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Specialist")
		end
	else
		var_1_24 = {
			var_1_5,
			var_1_6,
			var_1_7
		}

		if CONDITIONS.IsSplitscreen(arg_1_0) then
			ACTIONS.AnimateSequence(arg_1_0, "Splitscreen")
		else
			ACTIONS.AnimateSequence(arg_1_0, "NoSpecialist")
		end
	end

	arg_1_0.PerkGridItem:SetupButton(arg_1_1, var_1_24)
	arg_1_0.EquipmentGridItem:SetupButton(arg_1_1, var_1_22, LOOT.itemTypes.EQUIPMENT, "LUA_MENU/RIG_LETHAL")
	arg_1_0.TacticalGridItem:SetupButton(arg_1_1, var_1_23, LOOT.itemTypes.EQUIPMENT, "LUA_MENU/TITLE_TACTICAL")

	local function var_1_28(arg_2_0)
		local var_2_0 = LUI.FlowManager.GetScopedData(arg_2_0)

		if arg_2_0 == arg_1_0.PrimaryWeaponCluster then
			arg_1_0.PrimaryWeaponCluster:ShowCustomizeButtons((var_1_1 or var_1_2) and var_1_3, var_1_4, var_2_0.bundleVariants and var_2_0.bundleVariants[var_1_0])
			arg_1_0.SecondaryWeaponCluster:HideCustomizeButtons()

			if Engine.DDJFBBJAIG() then
				arg_2_0:dispatchEventToCurrentMenu({
					name = "update_bundle_upsell",
					weaponRef = var_1_0
				})
				arg_2_0:dispatchEventToCurrentMenu({
					name = "update_weapon_master_summary",
					weaponRef = var_1_0
				})
			end
		elseif arg_2_0 == arg_1_0.SecondaryWeaponCluster then
			arg_1_0.SecondaryWeaponCluster:ShowCustomizeButtons((var_1_12 or var_1_13) and var_1_14, var_1_15, var_2_0.bundleVariants and var_2_0.bundleVariants[var_1_11])
			arg_1_0.PrimaryWeaponCluster:HideCustomizeButtons()

			if Engine.DDJFBBJAIG() then
				arg_2_0:dispatchEventToCurrentMenu({
					name = "update_bundle_upsell",
					weaponRef = var_1_11
				})
				arg_2_0:dispatchEventToCurrentMenu({
					name = "update_weapon_master_summary",
					weaponRef = var_1_11
				})
			end
		else
			arg_1_0.PrimaryWeaponCluster:HideCustomizeButtons()
			arg_1_0.SecondaryWeaponCluster:HideCustomizeButtons()

			if arg_2_0 and Engine.DDJFBBJAIG() then
				arg_2_0:dispatchEventToCurrentMenu({
					name = "update_weapon_master_summary"
				})
			end
		end
	end

	arg_1_0.PrimaryWeaponCluster.WeaponButton:addEventHandler("button_over", function()
		var_1_28(arg_1_0.PrimaryWeaponCluster)
	end)
	arg_1_0.PrimaryWeaponCluster.AttachmentsButton:addEventHandler("button_over", function()
		var_1_28(arg_1_0.PrimaryWeaponCluster)
	end)
	arg_1_0.PrimaryWeaponCluster.ChallengesButton:addEventHandler("button_over", function()
		var_1_28(arg_1_0.PrimaryWeaponCluster)
	end)
	arg_1_0.SecondaryWeaponCluster.WeaponButton:addEventHandler("button_over", function()
		var_1_28(arg_1_0.SecondaryWeaponCluster)
	end)
	arg_1_0.SecondaryWeaponCluster.AttachmentsButton:addEventHandler("button_over", function()
		var_1_28(arg_1_0.SecondaryWeaponCluster)
	end)
	arg_1_0.SecondaryWeaponCluster.ChallengesButton:addEventHandler("button_over", function()
		var_1_28(arg_1_0.SecondaryWeaponCluster)
	end)
	arg_1_0.PrimaryWeaponCluster.BlueprintStoreButton:addEventHandler("button_over", function()
		var_1_28(arg_1_0.PrimaryWeaponCluster)
	end)
	arg_1_0.SecondaryWeaponCluster.BlueprintStoreButton:addEventHandler("button_over", function()
		var_1_28(arg_1_0.SecondaryWeaponCluster)
	end)
	arg_1_0.PerkGridItem:addEventHandler("button_over", function()
		var_1_28(arg_1_0.PerkGridItem)
	end)
	arg_1_0.TacticalGridItem:addEventHandler("button_over", function()
		var_1_28(arg_1_0.TacticalGridItem)
	end)
	arg_1_0.EquipmentGridItem:addEventHandler("button_over", function()
		var_1_28(arg_1_0.EquipmentGridItem)
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_14_0, arg_14_1)
		var_1_28(arg_14_0)
	end)
end

local function var_0_1(arg_15_0, arg_15_1)
	arg_15_0:dispatchEventToCurrentMenu({
		name = "update_camera_limits",
		isZoomed = arg_15_1
	})
end

local function var_0_2(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local function var_16_0(arg_17_0)
		return function(arg_18_0, arg_18_1)
			if arg_18_0.id == "WeaponButtonSecondary" or arg_18_0.id == "AttachmentsButtonSecondary" then
				arg_17_0 = arg_16_0._secondaryCameraType
			end

			if not arg_16_0.modelsSetup then
				local var_18_0 = LUI.FlowManager.GetScopedData(arg_18_0)

				for iter_18_0 = 0, 1 do
					local var_18_1 = arg_16_3[var_18_0.selectedLoadoutIndex].weaponSetups[iter_18_0]
					local var_18_2 = WEAPON.GetWeaponModelNameFromPlayerData(var_18_1.weapon:get(), var_18_1, {
						includeCamos = true,
						includeAttachments = true,
						includeStickers = true,
						controllerIndex = arg_16_1
					})

					WEAPON.SetModelIfLoaded(arg_16_1, arg_16_2[iter_18_0 + 1], var_18_2, {
						adjustSandbags = iter_18_0 == 0
					})
				end

				arg_16_0.modelsSetup = true
			end

			Engine.DHFCHIIJCA(CONDITIONS.IsMultiplayer(arg_16_0) and arg_17_0 or "loadout_showcase")

			local var_18_3 = arg_17_0 == "loadout_showcase_p" or "loadout_showcase_o"

			var_0_1(arg_16_0, var_18_3)
		end
	end

	local function var_16_1(arg_19_0, arg_19_1)
		arg_19_0.WeaponButton:addEventHandler("button_over", var_16_0(arg_19_1))
		arg_19_0.AttachmentsButton:addEventHandler("button_over", var_16_0(arg_19_1))
	end

	var_16_1(arg_16_0.PrimaryWeaponCluster, "loadout_showcase_p")
	var_16_1(arg_16_0.SecondaryWeaponCluster, "loadout_showcase_s")
	arg_16_0.PerkGridItem:addEventHandler("button_over", var_16_0("loadout_showcase_perks"))
	arg_16_0.EquipmentGridItem:addEventHandler("button_over", var_16_0("loadout_showcase_l"))
	arg_16_0.TacticalGridItem:addEventHandler("button_over", var_16_0("loadout_showcase_t"))
end

local function var_0_3(arg_20_0, arg_20_1)
	return function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_0

		while var_21_0 ~= nil and var_21_0.id ~= "LoadoutSelect" do
			var_21_0 = var_21_0:getParent()
		end

		local var_21_1

		if var_21_0 and var_21_0.streamer then
			var_21_1 = var_21_0.streamer:GetStreamedImageTable()
		end

		local var_21_2 = LUI.FlowManager.GetScopedData(arg_20_0)
		local var_21_3 = {
			weaponSlot = arg_20_1,
			loadoutIndex = var_21_2.selectedLoadoutIndex,
			streamedImageTable = var_21_1
		}

		LUI.FlowManager.RequestAddMenu("WeaponSelect", true, arg_21_1.controller, nil, var_21_3, true)
	end
end

local function var_0_4(arg_22_0, arg_22_1)
	return function(arg_23_0, arg_23_1)
		local var_23_0 = LUI.FlowManager.GetScopedData(arg_22_0)

		GUNSMITH.OpenGunsmith(arg_23_1.controller, var_23_0.selectedLoadoutIndex, arg_22_1)
	end
end

local function var_0_5(arg_24_0, arg_24_1)
	return function(arg_25_0, arg_25_1)
		local var_25_0 = LUI.FlowManager.GetScopedData(arg_24_0)
		local var_25_1 = {
			loadoutIndex = var_25_0.selectedLoadoutIndex,
			weaponSlot = arg_24_1
		}

		LUI.FlowManager.RequestAddMenu("WeaponMasterMenu", true, arg_25_1.controller, false, var_25_1, true)
	end
end

local function var_0_6(arg_26_0, arg_26_1)
	return function(arg_27_0, arg_27_1)
		local var_27_0 = arg_26_1 == WEAPON.PrimarySlot and arg_26_0._primary or arg_26_0._secondary
		local var_27_1 = LUI.FlowManager.GetScopedData(arg_26_0)
		local var_27_2 = {
			blueprintStore = true,
			weaponRef = var_27_0,
			weaponSlot = arg_26_1
		}

		LUI.FlowManager.RequestAddMenu("WeaponLocker", true, arg_27_1.controller, false, var_27_2, true)
	end
end

local function var_0_7(arg_28_0, arg_28_1)
	return function(arg_29_0, arg_29_1)
		local var_29_0 = LUI.FlowManager.GetScopedData(arg_28_0)
		local var_29_1 = {
			weaponSlot = arg_28_1,
			loadoutIndex = var_29_0.selectedLoadoutIndex
		}

		LUI.FlowManager.RequestAddMenu("WeaponCustomize", true, arg_29_1.controller, nil, var_29_1, true)
	end
end

local function var_0_8(arg_30_0)
	return function(arg_31_0, arg_31_1)
		local var_31_0 = LUI.FlowManager.GetScopedData(arg_30_0)
		local var_31_1 = {
			loadoutIndex = var_31_0.selectedLoadoutIndex
		}

		LUI.FlowManager.RequestAddMenu("PerkSelect", true, arg_31_1.controller, nil, var_31_1, true)
	end
end

local function var_0_9(arg_32_0, arg_32_1)
	return function(arg_33_0, arg_33_1)
		local var_33_0 = LUI.FlowManager.GetScopedData(arg_32_0)
		local var_33_1 = {
			equipmentIndex = arg_32_1,
			loadoutIndex = var_33_0.selectedLoadoutIndex
		}

		LUI.FlowManager.RequestAddMenu("EquipmentSelect", true, arg_33_1.controller, nil, var_33_1, true)
	end
end

local function var_0_10(arg_34_0, arg_34_1)
	arg_34_0._blockMouseMove = not arg_34_1
end

local function var_0_11(arg_35_0, arg_35_1)
	ACTIONS.AnimateSequence(arg_35_0, "HideAll")
	arg_35_0:registerEventHandler("gamepad_button", function(arg_36_0, arg_36_1)
		if arg_36_1.name == "gamepad_button" and arg_36_1.down then
			if arg_36_1.button == "right_trigger" then
				ACTIONS.AnimateSequence(arg_36_0, "ShowLoadout")
			end
		elseif arg_36_1.name == "gamepad_button" and arg_36_1.button == "right_trigger" then
			ACTIONS.AnimateSequence(arg_36_0, "HideLoadout")
		end
	end)
end

local function var_0_12(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0.SetupGridItems = var_0_0
	arg_37_0.SetupLoadoutPreview = var_0_11
	arg_37_0.SetupWeaponModelEvents = var_0_2
	arg_37_0.SetupButtons = SetupButtons
	arg_37_0.SetMouseHandling = var_0_10
	arg_37_0._secondaryCameraType = "loadout_showcase_s"

	arg_37_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	arg_37_0.PrimaryWeaponCluster.WeaponButton.id = "WeaponButtonPrimary"
	arg_37_0.PrimaryWeaponCluster.AttachmentsButton.id = "AttachmentsButtonPrimary"
	arg_37_0.PrimaryWeaponCluster.BlueprintStoreButton.id = "BlueprintStoreButtonPrimary"
	arg_37_0.PrimaryWeaponCluster.ChallengesButton.id = "ChallengesButtonPrimary"
	arg_37_0.SecondaryWeaponCluster.WeaponButton.id = "WeaponButtonSecondary"
	arg_37_0.SecondaryWeaponCluster.AttachmentsButton.id = "AttachmentsButtonSecondary"
	arg_37_0.SecondaryWeaponCluster.BlueprintStoreButton.id = "BlueprintStoreButtonSecondary"
	arg_37_0.SecondaryWeaponCluster.ChallengesButton.id = "ChallengesButtonSecondary"

	arg_37_0.PrimaryWeaponCluster.WeaponButton:addEventHandler("button_action", var_0_3(arg_37_0, WEAPON.PrimarySlot))
	arg_37_0.SecondaryWeaponCluster.WeaponButton:addEventHandler("button_action", var_0_3(arg_37_0, WEAPON.SecondarySlot))
	arg_37_0.PerkGridItem:addEventHandler("button_action", var_0_8(arg_37_0))
	arg_37_0.EquipmentGridItem:addEventHandler("button_action", var_0_9(arg_37_0, 0))
	arg_37_0.TacticalGridItem:addEventHandler("button_action", var_0_9(arg_37_0, 1))
	arg_37_0.PrimaryWeaponCluster.AttachmentsButton:addEventHandler("button_action", var_0_4(arg_37_0, WEAPON.PrimarySlot))
	arg_37_0.SecondaryWeaponCluster.AttachmentsButton:addEventHandler("button_action", var_0_4(arg_37_0, WEAPON.SecondarySlot))
	arg_37_0.PrimaryWeaponCluster.ChallengesButton:addEventHandler("button_action", var_0_5(arg_37_0, WEAPON.PrimarySlot))
	arg_37_0.SecondaryWeaponCluster.ChallengesButton:addEventHandler("button_action", var_0_5(arg_37_0, WEAPON.SecondarySlot))
	arg_37_0.PrimaryWeaponCluster.BlueprintStoreButton:addEventHandler("button_action", var_0_6(arg_37_0, WEAPON.PrimarySlot))
	arg_37_0.SecondaryWeaponCluster.BlueprintStoreButton:addEventHandler("button_action", var_0_6(arg_37_0, WEAPON.SecondarySlot))

	arg_37_0.PrimaryWeaponCluster.navigation = {}
	arg_37_0.PrimaryWeaponCluster.navigation.down = arg_37_0.SecondaryWeaponCluster

	if CONDITIONS.IsSplitscreen(arg_37_0) then
		arg_37_0.PrimaryWeaponCluster.navigation.up = arg_37_0.SecondaryWeaponCluster.WeaponButton
		arg_37_0.PrimaryWeaponCluster.navigation.right = arg_37_0.PerkGridItem
	else
		arg_37_0.PrimaryWeaponCluster.navigation.up = arg_37_0.TacticalGridItem
	end

	arg_37_0.SecondaryWeaponCluster.navigation = {}
	arg_37_0.SecondaryWeaponCluster.navigation.up = arg_37_0.PrimaryWeaponCluster.WeaponButton

	if CONDITIONS.IsSplitscreen(arg_37_0) then
		arg_37_0.SecondaryWeaponCluster.navigation.right = arg_37_0.PerkGridItem
		arg_37_0.SecondaryWeaponCluster.navigation.down = arg_37_0.PrimaryWeaponCluster.WeaponButton
	else
		arg_37_0.SecondaryWeaponCluster.navigation.down = arg_37_0.PerkGridItem
	end

	arg_37_0.PerkGridItem.navigation = {}

	if CONDITIONS.IsSplitscreen(arg_37_0) then
		arg_37_0.PerkGridItem.navigation.left = arg_37_0.PrimaryWeaponCluster.WeaponButton
		arg_37_0.PerkGridItem.navigation.up = arg_37_0.TacticalGridItem
	else
		arg_37_0.PerkGridItem.navigation.up = arg_37_0.SecondaryWeaponCluster
	end

	arg_37_0.PerkGridItem.navigation.down = arg_37_0.EquipmentGridItem
	arg_37_0.EquipmentGridItem.navigation = {}
	arg_37_0.EquipmentGridItem.navigation.up = arg_37_0.PerkGridItem
	arg_37_0.EquipmentGridItem.navigation.down = arg_37_0.TacticalGridItem

	if CONDITIONS.IsSplitscreen(arg_37_0) then
		arg_37_0.EquipmentGridItem.navigation.left = arg_37_0.PrimaryWeaponCluster.WeaponButton
	end

	arg_37_0.TacticalGridItem.navigation = {}
	arg_37_0.TacticalGridItem.navigation.up = arg_37_0.EquipmentGridItem

	if CONDITIONS.IsSplitscreen(arg_37_0) then
		arg_37_0.TacticalGridItem.navigation.down = arg_37_0.PerkGridItem
		arg_37_0.TacticalGridItem.navigation.left = arg_37_0.PrimaryWeaponCluster.WeaponButton
	else
		arg_37_0.TacticalGridItem.navigation.down = arg_37_0.PrimaryWeaponCluster.WeaponButton
	end

	if CONDITIONS.IsSplitscreen(arg_37_0) then
		ACTIONS.AnimateSequence(arg_37_0, "Splitscreen")
	end
end

function LoadoutSelectButtons(arg_38_0, arg_38_1)
	local var_38_0 = LUI.UIElement.new()

	var_38_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1154 * _1080p, 0, 916 * _1080p)

	var_38_0.id = "LoadoutSelectButtons"
	var_38_0._animationSets = var_38_0._animationSets or {}
	var_38_0._sequences = var_38_0._sequences or {}

	local var_38_1 = arg_38_1 and arg_38_1.controllerIndex

	if not var_38_1 and not Engine.DDJFBBJAIG() then
		var_38_1 = var_38_0:getRootController()
	end

	assert(var_38_1)

	local var_38_2 = var_38_0
	local var_38_3
	local var_38_4 = MenuBuilder.BuildRegisteredType("LoadoutWeaponCluster", {
		controllerIndex = var_38_1
	})

	var_38_4.id = "PrimaryWeaponCluster"

	var_38_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, 0, _1080p * 190)
	var_38_0:addElement(var_38_4)

	var_38_0.PrimaryWeaponCluster = var_38_4

	local var_38_5
	local var_38_6 = MenuBuilder.BuildRegisteredType("LoadoutWeaponCluster", {
		controllerIndex = var_38_1
	})

	var_38_6.id = "SecondaryWeaponCluster"

	var_38_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, _1080p * 202, _1080p * 392)
	var_38_0:addElement(var_38_6)

	var_38_0.SecondaryWeaponCluster = var_38_6

	local var_38_7
	local var_38_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButton", {
		controllerIndex = var_38_1
	})

	var_38_8.id = "EquipmentGridItem"

	var_38_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, _1080p * 531, _1080p * 617)
	var_38_0:addElement(var_38_8)

	var_38_0.EquipmentGridItem = var_38_8

	local var_38_9
	local var_38_10 = MenuBuilder.BuildRegisteredType("LoadoutItemButton", {
		controllerIndex = var_38_1
	})

	var_38_10.id = "TacticalGridItem"

	var_38_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, _1080p * 629, _1080p * 715)
	var_38_0:addElement(var_38_10)

	var_38_0.TacticalGridItem = var_38_10

	local var_38_11
	local var_38_12 = LUI.UIImage.new()

	var_38_12.id = "BorderTop"

	var_38_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -6, _1080p * -6, _1080p * 18, _1080p * 19)
	var_38_0:addElement(var_38_12)

	var_38_0.BorderTop = var_38_12

	local var_38_13
	local var_38_14 = LUI.UIImage.new()

	var_38_14.id = "BorderRight"

	var_38_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 5, _1080p * 6, _1080p * 19, _1080p * 19)
	var_38_0:addElement(var_38_14)

	var_38_0.BorderRight = var_38_14

	local var_38_15
	local var_38_16 = LUI.UIImage.new()

	var_38_16.id = "BorderBottom"

	var_38_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * 5, _1080p * 5, _1080p * -91, _1080p * -90)
	var_38_0:addElement(var_38_16)

	var_38_0.BorderBottom = var_38_16

	local var_38_17
	local var_38_18 = LUI.UIImage.new()

	var_38_18.id = "BorderLeft"

	var_38_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -6, _1080p * -5, _1080p * -139, _1080p * -139)
	var_38_0:addElement(var_38_18)

	var_38_0.BorderLeft = var_38_18

	local var_38_19
	local var_38_20 = MenuBuilder.BuildRegisteredType("LoadoutItemPerkButton", {
		controllerIndex = var_38_1
	})

	var_38_20.id = "PerkGridItem"

	var_38_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, _1080p * 404, _1080p * 519)
	var_38_0:addElement(var_38_20)

	var_38_0.PerkGridItem = var_38_20

	local var_38_21
	local var_38_22 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_38_1
	})

	var_38_22.id = "EquippedWidget"

	var_38_22:SetAlpha(0, 0)
	var_38_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 268, _1080p * 404, _1080p * -30, 0)
	var_38_0:addElement(var_38_22)

	var_38_0.EquippedWidget = var_38_22

	local function var_38_23()
		return
	end

	var_38_0._sequences.DefaultSequence = var_38_23

	local var_38_24
	local var_38_25 = {
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

	var_38_8:RegisterAnimationSequence("ShowLoadout", var_38_25)

	local var_38_26 = {
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

	var_38_10:RegisterAnimationSequence("ShowLoadout", var_38_26)

	local function var_38_27()
		var_38_8:AnimateSequence("ShowLoadout")
		var_38_10:AnimateSequence("ShowLoadout")
	end

	var_38_0._sequences.ShowLoadout = var_38_27

	local var_38_28
	local var_38_29 = {
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

	var_38_8:RegisterAnimationSequence("HideLoadout", var_38_29)

	local var_38_30 = {
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

	var_38_10:RegisterAnimationSequence("HideLoadout", var_38_30)

	local function var_38_31()
		var_38_8:AnimateSequence("HideLoadout")
		var_38_10:AnimateSequence("HideLoadout")
	end

	var_38_0._sequences.HideLoadout = var_38_31

	local var_38_32
	local var_38_33 = {
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

	var_38_8:RegisterAnimationSequence("HideAll", var_38_33)

	local var_38_34 = {
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

	var_38_10:RegisterAnimationSequence("HideAll", var_38_34)

	local var_38_35 = {
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

	var_38_12:RegisterAnimationSequence("HideAll", var_38_35)

	local var_38_36 = {
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

	var_38_14:RegisterAnimationSequence("HideAll", var_38_36)

	local var_38_37 = {
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

	var_38_16:RegisterAnimationSequence("HideAll", var_38_37)

	local var_38_38 = {
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

	var_38_18:RegisterAnimationSequence("HideAll", var_38_38)

	local function var_38_39()
		var_38_8:AnimateSequence("HideAll")
		var_38_10:AnimateSequence("HideAll")
		var_38_12:AnimateSequence("HideAll")
		var_38_14:AnimateSequence("HideAll")
		var_38_16:AnimateSequence("HideAll")
		var_38_18:AnimateSequence("HideAll")
	end

	var_38_0._sequences.HideAll = var_38_39

	local var_38_40
	local var_38_41 = {
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

	var_38_4:RegisterAnimationSequence("Splitscreen", var_38_41)

	local var_38_42 = {
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

	var_38_6:RegisterAnimationSequence("Splitscreen", var_38_42)

	local var_38_43 = {
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

	var_38_8:RegisterAnimationSequence("Splitscreen", var_38_43)

	local var_38_44 = {
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

	var_38_10:RegisterAnimationSequence("Splitscreen", var_38_44)

	local var_38_45 = {
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

	var_38_12:RegisterAnimationSequence("Splitscreen", var_38_45)

	local var_38_46 = {
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

	var_38_14:RegisterAnimationSequence("Splitscreen", var_38_46)

	local var_38_47 = {
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

	var_38_18:RegisterAnimationSequence("Splitscreen", var_38_47)

	local var_38_48 = {
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

	var_38_20:RegisterAnimationSequence("Splitscreen", var_38_48)

	local var_38_49 = {
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

	var_38_22:RegisterAnimationSequence("Splitscreen", var_38_49)

	local function var_38_50()
		var_38_4:AnimateSequence("Splitscreen")
		var_38_6:AnimateSequence("Splitscreen")
		var_38_8:AnimateSequence("Splitscreen")
		var_38_10:AnimateSequence("Splitscreen")
		var_38_12:AnimateSequence("Splitscreen")
		var_38_14:AnimateSequence("Splitscreen")
		var_38_18:AnimateSequence("Splitscreen")
		var_38_20:AnimateSequence("Splitscreen")
		var_38_22:AnimateSequence("Splitscreen")
	end

	var_38_0._sequences.Splitscreen = var_38_50

	local var_38_51
	local var_38_52 = {
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

	var_38_8:RegisterAnimationSequence("Specialist", var_38_52)

	local var_38_53 = {
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

	var_38_10:RegisterAnimationSequence("Specialist", var_38_53)

	local var_38_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 578
		}
	}

	var_38_20:RegisterAnimationSequence("Specialist", var_38_54)

	local function var_38_55()
		var_38_8:AnimateSequence("Specialist")
		var_38_10:AnimateSequence("Specialist")
		var_38_20:AnimateSequence("Specialist")
	end

	var_38_0._sequences.Specialist = var_38_55

	local var_38_56
	local var_38_57 = {
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

	var_38_8:RegisterAnimationSequence("NoSpecialist", var_38_57)

	local var_38_58 = {
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

	var_38_10:RegisterAnimationSequence("NoSpecialist", var_38_58)

	local var_38_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 519
		}
	}

	var_38_20:RegisterAnimationSequence("NoSpecialist", var_38_59)

	local function var_38_60()
		var_38_8:AnimateSequence("NoSpecialist")
		var_38_10:AnimateSequence("NoSpecialist")
		var_38_20:AnimateSequence("NoSpecialist")
	end

	var_38_0._sequences.NoSpecialist = var_38_60

	local var_38_61
	local var_38_62 = {
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

	var_38_4:RegisterAnimationSequence("SplitscreenSpecialist", var_38_62)

	local var_38_63 = {
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

	var_38_6:RegisterAnimationSequence("SplitscreenSpecialist", var_38_63)

	local var_38_64 = {
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

	var_38_8:RegisterAnimationSequence("SplitscreenSpecialist", var_38_64)

	local var_38_65 = {
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

	var_38_10:RegisterAnimationSequence("SplitscreenSpecialist", var_38_65)

	local var_38_66 = {
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

	var_38_12:RegisterAnimationSequence("SplitscreenSpecialist", var_38_66)

	local var_38_67 = {
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

	var_38_14:RegisterAnimationSequence("SplitscreenSpecialist", var_38_67)

	local var_38_68 = {
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

	var_38_18:RegisterAnimationSequence("SplitscreenSpecialist", var_38_68)

	local var_38_69 = {
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

	var_38_20:RegisterAnimationSequence("SplitscreenSpecialist", var_38_69)

	local var_38_70 = {
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

	var_38_22:RegisterAnimationSequence("SplitscreenSpecialist", var_38_70)

	local function var_38_71()
		var_38_4:AnimateSequence("SplitscreenSpecialist")
		var_38_6:AnimateSequence("SplitscreenSpecialist")
		var_38_8:AnimateSequence("SplitscreenSpecialist")
		var_38_10:AnimateSequence("SplitscreenSpecialist")
		var_38_12:AnimateSequence("SplitscreenSpecialist")
		var_38_14:AnimateSequence("SplitscreenSpecialist")
		var_38_18:AnimateSequence("SplitscreenSpecialist")
		var_38_20:AnimateSequence("SplitscreenSpecialist")
		var_38_22:AnimateSequence("SplitscreenSpecialist")
	end

	var_38_0._sequences.SplitscreenSpecialist = var_38_71

	var_0_12(var_38_0, var_38_1, arg_38_1)

	return var_38_0
end

MenuBuilder.registerType("LoadoutSelectButtons", LoadoutSelectButtons)
LockTable(_M)
