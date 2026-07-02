module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.EditLoadoutButton then
		assert(arg_1_0.EditLoadoutButton.Description)

		if CONDITIONS.IsBRGameType() then
			arg_1_0.EditLoadoutButton.Text:setText(Engine.CBBHFCGDIC("MP_BR_FRONTEND/EDIT_DROP_KITS"))
			arg_1_0.EditLoadoutButton.Description:setText(Engine.CBBHFCGDIC("MP_BR_FRONTEND/EDIT_DROP_KITS_DESC"))
		end

		if CONDITIONS.IsDevelopmentBuild() or PROGRESSION.IsUnlocked(arg_1_1, LOOT.itemTypes.FEATURE, LOOT.createAClassRef) then
			arg_1_0.EditLoadoutButton:AddTooltipData(arg_1_1, {
				tooltipDescription = arg_1_0.EditLoadoutButton.Description:getText()
			})
		else
			arg_1_0.EditLoadoutButton.DisabledText:setText(PROGRESSION.GetUnlockText(arg_1_1, LOOT.itemTypes.FEATURE, LOOT.createAClassRef))

			local var_1_0 = arg_1_0.EditLoadoutButton.Description:getText() .. "\n\n^3" .. arg_1_0.EditLoadoutButton.DisabledText:getText() .. "^7"

			arg_1_0.EditLoadoutButton:AddTooltipData(arg_1_1, {
				tooltipDescription = var_1_0
			})
			arg_1_0.EditLoadoutButton:SetButtonDisabled(true)
		end

		arg_1_0.EditLoadoutButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
			if PROGRESSION.IsUnlocked(arg_2_1.controller, LOOT.itemTypes.FEATURE, LOOT.createAClassRef) or CONDITIONS.IsDevelopmentBuild() then
				ACTIONS.OpenMenu("LoadoutSelect", true, arg_2_1.controller)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", false, arg_1_1, false, {
					title = Engine.CBBHFCGDIC("MENU/NOTICE"),
					message = Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_LOCKED"),
					controllerIndex = arg_1_1
				})
			end
		end)
	end

	if arg_1_0.WeaponLockerButton then
		assert(arg_1_0.WeaponLockerButton.Description)

		if #WEAPON.GetModifications(arg_1_1, {
			includeBundleItems = Dvar.IBEGCHEFE("NKRLMNTNRS")
		}) == 0 then
			arg_1_0.WeaponLockerButton:SetButtonDisabled(true)

			local var_1_1 = arg_1_0.WeaponLockerButton.Description:getText() .. "\n\n^3" .. arg_1_0.WeaponLockerButton.DisabledText:getText() .. "^7"

			arg_1_0.WeaponLockerButton:AddTooltipData(arg_1_1, {
				tooltipDescription = var_1_1
			})

			local var_1_2, var_1_3, var_1_4, var_1_5 = arg_1_0.WeaponLockerButton.DisabledText:getLocalRect()
			local var_1_6 = arg_1_0.WeaponLockerButton.DisabledText:getText()
			local var_1_7 = arg_1_0.WeaponLockerButton.DisabledText:GetCurrentFont()
			local var_1_8, var_1_9, var_1_10, var_1_11 = GetTextDimensions(var_1_6, var_1_7, var_1_5 - var_1_3, nil, 1 * _1080p)
			local var_1_12 = var_1_10 - var_1_8

			arg_1_0.WeaponLockerButton.DisabledText:SetAnimMoveTime(20 * var_1_12)
		else
			arg_1_0.WeaponLockerButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
				if #WEAPON.GetModifications(arg_3_1.controller, {
					includeBundleItems = Dvar.IBEGCHEFE("NKRLMNTNRS")
				}) > 0 then
					ACTIONS.OpenMenu("WeaponLocker", true, arg_3_1.controller)
				end
			end)
			arg_1_0.WeaponLockerButton:AddTooltipData(arg_1_1, {
				tooltipDescription = arg_1_0.WeaponLockerButton.Description:getText()
			})
		end
	end

	if arg_1_0.VehicleCustomizationButton then
		assert(arg_1_0.VehicleCustomizationButton.Description)
		arg_1_0.VehicleCustomizationButton:AddTooltipData(arg_1_1, {
			tooltipDescription = arg_1_0.VehicleCustomizationButton.Description:getText()
		})
	end

	if arg_1_0.WatchSelectButton then
		assert(arg_1_0.WatchSelectButton.PlayMenuButton.Description)

		if WATCH.PlayerOwnsWatches(arg_1_1) then
			arg_1_0.WatchSelectButton:AddTooltipData(arg_1_1, {
				tooltipDescription = arg_1_0.WatchSelectButton.PlayMenuButton.Description:getText()
			})
		else
			local var_1_13 = arg_1_0.WatchSelectButton.PlayMenuButton.Description:getText() .. "\n\n^3" .. arg_1_0.WatchSelectButton.PlayMenuButton.DisabledText:getText() .. "^7"

			arg_1_0.WatchSelectButton:AddTooltipData(arg_1_1, {
				tooltipDescription = var_1_13
			})
		end

		arg_1_0.WatchSelectButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			if WATCH.PlayerOwnsWatches(arg_4_1.controller) then
				ACTIONS.OpenMenu("WatchSelect", true, arg_4_1.controller)
			end
		end)
	end

	if arg_1_0.CPFieldUpgradesButton then
		assert(arg_1_0.CPFieldUpgradesButton.PlayMenuButton.Description)
		arg_1_0.CPFieldUpgradesButton:AddTooltipData(arg_1_1, {
			tooltipDescription = arg_1_0.CPFieldUpgradesButton.PlayMenuButton.Description:getText()
		})
	end

	if arg_1_0.MunitionSelect then
		assert(arg_1_0.MunitionSelect.PlayMenuButton.Description)
		arg_1_0.MunitionSelect:AddTooltipData(arg_1_1, {
			tooltipDescription = arg_1_0.MunitionSelect.PlayMenuButton.Description:getText()
		})
	end

	if arg_1_0.FieldUpgradesButton then
		assert(arg_1_0.FieldUpgradesButton.PlayMenuButton.Description)
		arg_1_0.FieldUpgradesButton:AddTooltipData(arg_1_1, {
			tooltipDescription = arg_1_0.FieldUpgradesButton.PlayMenuButton.Description:getText()
		})
	end

	if arg_1_0.StreakSelectButton then
		assert(arg_1_0.StreakSelectButton.PlayMenuButton.Description)
		arg_1_0.StreakSelectButton:AddTooltipData(arg_1_1, {
			tooltipDescription = arg_1_0.StreakSelectButton.PlayMenuButton.Description:getText()
		})
	end
end

local function var_0_1(arg_5_0)
	if arg_5_0.WeaponLockerButton then
		arg_5_0.WeaponLockerButton:UpdateNewItemNotification(0)
	end

	if arg_5_0.VehicleCustomizationButton then
		arg_5_0.VehicleCustomizationButton:UpdateNewItemNotification(0)
	end

	if arg_5_0.WatchSelectButton then
		arg_5_0.WatchSelectButton.PlayMenuButton:UpdateNewItemNotification(0)
	end

	if arg_5_0.EditLoadoutButton then
		arg_5_0.EditLoadoutButton:UpdateNewItemNotification(0)
	end

	if arg_5_0.FieldUpgradesButton then
		arg_5_0.FieldUpgradesButton.PlayMenuButton:UpdateNewItemNotification(0)
	end

	if arg_5_0.StreakSelectButton then
		arg_5_0.StreakSelectButton.PlayMenuButton:UpdateNewItemNotification(0)
	end
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.RemoveBreadcrumbsFromButtons = var_0_1

	local var_6_0 = LOOT.IsCategoryNew(arg_6_1, LOOT.itemTypes.STREAK)
	local var_6_1 = LOOT.IsCategoryNew(arg_6_1, LOOT.itemTypes.SUPER)
	local var_6_2 = LOOT.IsCategoryNew(arg_6_1, LOOT.itemTypes.VEHICLE_CAMO) or LOOT.IsCategoryNew(arg_6_1, LOOT.itemTypes.VEHICLE_HORN) or LOOT.IsCategoryNew(arg_6_1, LOOT.itemTypes.VEHICLE_TRACK)
	local var_6_3 = LOOT.IsCategoryNew(arg_6_1, LOOT.itemTypes.WATCH)
	local var_6_4 = LOOT.LoadoutHasNewLoot(arg_6_1)
	local var_6_5 = #WEAPON.GetNewWeaponIDs(arg_6_1, {
		getBaseWeapon = false
	}) > 0
	local var_6_6 = {
		clearChildrenSFX = true
	}

	if arg_6_0.WeaponLockerButton then
		arg_6_0.WeaponLockerButton:UpdateNewItemNotification(var_6_5 and 1 or 0)
		arg_6_0.WeaponLockerButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_6_6)
		arg_6_0.WeaponLockerButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_6_6)
	end

	if arg_6_0.VehicleCustomizationButton then
		arg_6_0.VehicleCustomizationButton:UpdateNewItemNotification(var_6_2 and 1 or 0)
		arg_6_0.VehicleCustomizationButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_6_6)
		arg_6_0.VehicleCustomizationButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_6_6)
	end

	if arg_6_0.WatchSelectButton then
		arg_6_0.WatchSelectButton:SetButtonDisabled(not WATCH.PlayerOwnsWatches(arg_6_1))
		arg_6_0.WatchSelectButton.PlayMenuButton:UpdateNewItemNotification(var_6_3 and 1 or 0)
		arg_6_0.WatchSelectButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_6_6)
		arg_6_0.WatchSelectButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_6_6)
	end

	local var_6_7 = not LOADOUT.MATCHRULES.IsThereARestrictedLoadout(arg_6_1) and not CONDITIONS.IsInGameBattlesMatch()

	if arg_6_0.EditLoadoutButton then
		arg_6_0.EditLoadoutButton:UpdateNewItemNotification(var_6_4 and var_6_7 and 1 or 0)
		arg_6_0.EditLoadoutButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_6_6)
		arg_6_0.EditLoadoutButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_6_6)

		if LOADOUT.MATCHRULES.IsThereARestrictedLoadout(arg_6_1) then
			ACTIONS.AnimateSequence(arg_6_0.EditLoadoutButton, "CDLOn")
		end
	end

	if arg_6_0.FieldUpgradesButton then
		arg_6_0.FieldUpgradesButton.PlayMenuButton:UpdateNewItemNotification(var_6_1 and var_6_7 and 1 or 0)
		arg_6_0.FieldUpgradesButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_6_6)
		arg_6_0.FieldUpgradesButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_6_6)

		if LOADOUT.MATCHRULES.IsThereARestrictedFieldUpgrade(arg_6_1) then
			ACTIONS.AnimateSequence(arg_6_0.FieldUpgradesButton.PlayMenuButton, "CDLOn")
		end
	end

	if arg_6_0.StreakSelectButton then
		arg_6_0.StreakSelectButton.PlayMenuButton:UpdateNewItemNotification(var_6_0 and var_6_7 and 1 or 0)
		arg_6_0.StreakSelectButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_6_6)
		arg_6_0.StreakSelectButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_6_6)

		if LOADOUT.MATCHRULES.IsThereARestrictedKillstreak(arg_6_1) then
			ACTIONS.AnimateSequence(arg_6_0.StreakSelectButton.PlayMenuButton, "CDLOn")

			if LOADOUT.MATCHRULES.AreAllKillstreakRestricted(arg_6_1) then
				arg_6_0.StreakSelectButton:SetButtonDisabled(true)
			else
				arg_6_0.StreakSelectButton:SetButtonDisabled(false)
			end
		else
			arg_6_0.StreakSelectButton:SetButtonDisabled(false)
		end
	end

	if arg_6_0.CPFieldUpgradesButton then
		arg_6_0.CPFieldUpgradesButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_6_6)
		arg_6_0.CPFieldUpgradesButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_6_6)
	end

	if arg_6_0.MunitionSelect then
		arg_6_0.MunitionSelect:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_6_6)
		arg_6_0.MunitionSelect:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_6_6)
	end

	var_0_0(arg_6_0, arg_6_1)
end

function MPWeaponMenuButtons(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalList.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 709 * _1080p)

	var_7_0.id = "MPWeaponMenuButtons"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(10 * _1080p)

	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "EditLoadoutButton"

	var_7_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EDIT_LOADOUTS")), 0)
	var_7_4.Description:setText(Engine.CBBHFCGDIC("CAS/EDIT_LOADOUTS_DESC"), 0)
	var_7_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_7_4.DisabledText:SetAnimMoveTime(2000)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_7_0:addElement(var_7_4)

	var_7_0.EditLoadoutButton = var_7_4

	local var_7_5

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		var_7_5 = MenuBuilder.BuildRegisteredType("EditStreaksButton", {
			controllerIndex = var_7_1
		})
		var_7_5.id = "StreakSelectButton"

		var_7_5.PlayMenuButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/STREAK_SELECT")), 0)
		var_7_5.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("CAS/STREAK_SELECT_DESC"), 0)
		var_7_5.PlayMenuButton.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_7_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
		var_7_0:addElement(var_7_5)

		var_7_0.StreakSelectButton = var_7_5
	end

	local var_7_6

	if CONDITIONS.IsThirdGameMode(var_7_0) then
		var_7_6 = MenuBuilder.BuildRegisteredType("EditStreaksButton", {
			controllerIndex = var_7_1
		})
		var_7_6.id = "MunitionSelect"

		var_7_6.PlayMenuButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SELECT")), 0)
		var_7_6.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITIONS_SELECT_DEC"), 0)
		var_7_6.PlayMenuButton.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
		var_7_0:addElement(var_7_6)

		var_7_0.MunitionSelect = var_7_6
	end

	local var_7_7

	if CONDITIONS.IsThirdGameMode(var_7_0) then
		var_7_7 = MenuBuilder.BuildRegisteredType("EditFieldUpgradesButton", {
			controllerIndex = var_7_1
		})
		var_7_7.id = "CPFieldUpgradesButton"

		var_7_7.PlayMenuButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/ROLE_SELECT")), 0)
		var_7_7.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/ROLE_SELECT_DESC"), 0)
		var_7_7.PlayMenuButton.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_7_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
		var_7_0:addElement(var_7_7)

		var_7_0.CPFieldUpgradesButton = var_7_7
	end

	local var_7_8

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		var_7_8 = MenuBuilder.BuildRegisteredType("EditFieldUpgradesButton", {
			controllerIndex = var_7_1
		})
		var_7_8.id = "FieldUpgradesButton"

		var_7_8.PlayMenuButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADES")), 0)
		var_7_8.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("CAS/FIELD_UPGRADES_DESC"), 0)
		var_7_8.PlayMenuButton.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 240, _1080p * 290)
		var_7_0:addElement(var_7_8)

		var_7_0.FieldUpgradesButton = var_7_8
	end

	local var_7_9

	if CONDITIONS.IsVehicleCustomizeEnabled(var_7_0) then
		var_7_9 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_9.id = "VehicleCustomizationButton"

		var_7_9.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION")), 0)
		var_7_9.Description:setText(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION_DESC"), 0)
		var_7_9.DisabledText:setText(Engine.CBBHFCGDIC("VEHICLES/VEHICLE_CUSTOMIZATION"), 0)
		var_7_9.DisabledText:SetAnimMoveTime(2000)
		var_7_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 300, _1080p * 351)
		var_7_0:addElement(var_7_9)

		var_7_0.VehicleCustomizationButton = var_7_9
	end

	local var_7_10
	local var_7_11 = MenuBuilder.BuildRegisteredType("WatchSelectButton", {
		controllerIndex = var_7_1
	})

	var_7_11.id = "WatchSelectButton"

	var_7_11.PlayMenuButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT")), 0)
	var_7_11.PlayMenuButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT_DESC"), 0)
	var_7_11.PlayMenuButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU/WATCH_SELECT_DISABLED_TEXT"), 0)
	var_7_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 361, _1080p * 412)
	var_7_0:addElement(var_7_11)

	var_7_0.WatchSelectButton = var_7_11

	local var_7_12

	if CONDITIONS.IsArmoryEnabled(var_7_0, var_7_1) then
		var_7_12 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_7_1
		})
		var_7_12.id = "WeaponLockerButton"

		var_7_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/WEAPON_LOCKER")), 0)
		var_7_12.Description:setText(Engine.CBBHFCGDIC("CAS/WEAPON_LOCKER_DESC"), 0)
		var_7_12.DisabledText:setText(Engine.CBBHFCGDIC("CAS/WEAPON_LOCKER_DISABLED_DESC"), 0)
		var_7_12.DisabledText:SetAnimMoveTime(7000)
		var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 422, _1080p * 472)
		var_7_0:addElement(var_7_12)

		var_7_0.WeaponLockerButton = var_7_12
	end

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		var_7_5:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			local var_8_0 = arg_8_1.controller or var_7_1

			ACTIONS.OpenMenu("StreakSelect", true, var_8_0)
		end)
	end

	if CONDITIONS.IsThirdGameMode(var_7_0) then
		var_7_6:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			local var_9_0 = arg_9_1.controller or var_7_1

			ACTIONS.OpenMenu("CPMunitionSelect", true, var_9_0)
		end)
	end

	if CONDITIONS.IsThirdGameMode(var_7_0) then
		var_7_7:addEventHandler("button_action", function(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1.controller or var_7_1

			ACTIONS.OpenMenu("CPFieldUpgrades", true, var_10_0)
		end)
	end

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		var_7_8:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			local var_11_0 = arg_11_1.controller or var_7_1

			ACTIONS.OpenMenu("FieldUpgrades", true, var_11_0)
		end)
	end

	if CONDITIONS.IsVehicleCustomizeEnabled(var_7_0) then
		var_7_9:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			local var_12_0 = arg_12_1.controller or var_7_1

			ACTIONS.OpenMenu("VehicleSelect", true, var_12_0)
		end)
	end

	if CONDITIONS.IsArmoryEnabled(var_7_0, var_7_1) then
		var_7_12:addEventHandler("button_action_disable", function(arg_13_0, arg_13_1)
			if not arg_13_1.controller then
				local var_13_0 = var_7_1
			end

			ACTIONS.PlaySoundSetSound(var_7_0, "action", false)
		end)
	end

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("MPWeaponMenuButtons", MPWeaponMenuButtons)
LockTable(_M)
