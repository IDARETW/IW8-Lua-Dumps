module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.AttachmentsButton:SetAlpha(0)
	arg_1_0.ChallengesButton:SetAlpha(0)
	arg_1_0.BlueprintStoreButton:SetAlpha(0)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0:SetMouseFocusBlocker(not arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_3 = arg_3_3 and Dvar.IBEGCHEFE("MRKSTPMLT") and not CONDITIONS.AreRestrictionsActiveAndBlueprintsBlocked(arg_3_0, controllerIndex)

	var_0_1(arg_3_0.AttachmentsButton, arg_3_1)
	var_0_1(arg_3_0.ChallengesButton, arg_3_2)
	var_0_1(arg_3_0.BlueprintStoreButton, arg_3_3)

	local var_3_0 = 3

	if arg_3_1 and not arg_3_2 then
		var_3_0 = 2
	elseif not arg_3_1 and not arg_3_2 then
		var_3_0 = 1
	end

	ACTIONS.AnimateSequence(arg_3_0, "BlueprintStore" .. var_3_0)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_3 = arg_4_3 and Dvar.IBEGCHEFE("MRKSTPMLT") and not CONDITIONS.AreRestrictionsActiveAndBlueprintsBlocked(arg_4_0, controllerIndex)

	if arg_4_1 ~= arg_4_0._attachmentsEnabled or arg_4_2 ~= arg_4_0._challengesEnabled or arg_4_3 ~= arg_4_0._blueprintStoreEnabled then
		arg_4_0.WeaponButton.navigation = (arg_4_1 or arg_4_2 or arg_4_3) and {} or nil
		arg_4_0.AttachmentsButton.navigation = arg_4_1 and {} or nil
		arg_4_0.ChallengesButton.navigation = arg_4_2 and {} or nil
		arg_4_0.BlueprintStoreButton.navigation = arg_4_3 and {} or nil

		arg_4_0.AttachmentsButton.FocusableRegion:SetFocusable(arg_4_1)
		arg_4_0.ChallengesButton.FocusableRegion:SetFocusable(arg_4_2)
		arg_4_0.BlueprintStoreButton.FocusableRegion:SetFocusable(arg_4_3)

		local var_4_0 = {
			arg_4_0.WeaponButton
		}

		if arg_4_1 then
			table.insert(var_4_0, arg_4_0.AttachmentsButton)
		end

		if arg_4_2 then
			table.insert(var_4_0, arg_4_0.ChallengesButton)
		end

		if arg_4_3 then
			table.insert(var_4_0, arg_4_0.BlueprintStoreButton)
		end

		for iter_4_0, iter_4_1 in ipairs(var_4_0) do
			if var_4_0[iter_4_0 + 1] then
				iter_4_1.navigation.right = var_4_0[iter_4_0 + 1]
			end

			if var_4_0[iter_4_0 - 1] then
				iter_4_1.navigation.left = var_4_0[iter_4_0 - 1]
			end
		end
	end

	arg_4_0._attachmentsEnabled = arg_4_1
	arg_4_0._challengesEnabled = arg_4_2
	arg_4_0._blueprintStoreEnabled = arg_4_3
end

local var_0_4 = {
	loadoutEdit = 2,
	loadoutSelect = 1
}

local function var_0_5(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = WEAPON.GetSlotFromRef(arg_5_2)
	local var_5_1 = #WEAPON.GetNewWeaponIDsBySlot(arg_5_1, var_5_0) > 0
	local var_5_2 = GUNSMITH.CheckNewGunsmithByWeapon(arg_5_1, arg_5_3)
	local var_5_3 = LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_5_3.attachmentSetup, arg_5_2)
	local var_5_4 = false

	if arg_5_0._menuState == var_0_4.loadoutSelect then
		var_5_4 = (var_5_1 or var_5_2) and not var_5_3
	else
		var_5_4 = var_5_1 and not var_5_3
	end

	if not CONDITIONS.IsSplitscreen() then
		arg_5_0.WeaponButton.NewItemSmallIcon:UpdateAlpha(var_5_4 and 1 or 0, 0, true)
		arg_5_0.AttachmentsButton.NewItemSmallIcon:UpdateAlpha(var_5_2 and not var_5_3 and 1 or 0, 0, true)

		local var_5_5 = LUI.FlowManager.GetScopedData(arg_5_0)

		if var_5_5.bundleVariants then
			local var_5_6 = STORE.AreAnyBundlesNew(arg_5_1, var_5_5.bundleVariants[arg_5_2])

			arg_5_0.BlueprintStoreButton.NewItemSmallIcon:UpdateAlpha(var_5_6 and 1 or 0, 0, true)
		end
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
	assert(arg_6_0.WeaponButton)
	assert(arg_6_0.AttachmentsButton)

	local var_6_0 = arg_6_7 and arg_6_7.ref or arg_6_2.weapon:get()
	local var_6_1 = arg_6_7 and true or false
	local var_6_2 = arg_6_7 and "" or GUNSMITH.GetCustomModName(arg_6_2.blueprintName:get())

	arg_6_0.WeaponButton:SetupButton(arg_6_1, var_6_0, var_6_2, arg_6_3, arg_6_4, arg_6_2, arg_6_7, var_6_1)

	if arg_6_0.WeaponButton.WeaponLevelBar then
		arg_6_0.WeaponButton.WeaponLevelBar:Setup(arg_6_1, var_6_0)
	end

	local var_6_3 = {
		weapon = var_6_0,
		attachments = arg_6_7 and arg_6_7.attachments or ATTACHMENT.GetTableFromWeaponSetup(arg_6_2)
	}
	local var_6_4, var_6_5 = ATTACHMENT.SetupSlotDisplay(arg_6_0.WeaponButton, {
		weaponTable = var_6_3
	})
	local var_6_6 = false

	if arg_6_2 then
		var_6_6 = PROGRESSION.IsUnlocked(arg_6_1, LOOT.itemTypes.WEAPON, arg_6_2.weapon:get())
	end

	if arg_6_0.WeaponButton.RarityColorBackground then
		if not Engine.DDJFBBJAIG() and CONDITIONS.IsBRGameType(arg_6_0) then
			if arg_6_7 then
				local var_6_7 = var_6_5

				if var_6_5 > 1 then
					var_6_7 = var_6_5 - 1
				end

				arg_6_0.WeaponButton.RarityColorBackground:ShowRarityColor(var_6_7)
			else
				local var_6_8 = arg_6_2.lootItemID:get()

				if var_6_8 ~= LOOT.emptyID then
					local var_6_9 = LOOT.GetItemQualityWithID(LOOT.itemTypes.WEAPON, var_6_8)

					arg_6_0.WeaponButton.RarityColorBackground:ShowRarityColor(var_6_9)
				else
					arg_6_0.WeaponButton.RarityColorBackground:ShowRarityColor(BRLOOT.itemRarities.COMMON)
				end
			end
		else
			arg_6_0.WeaponButton.RarityColorBackground:HideRarityColor()
		end
	end

	if CONDITIONS.UsingWZLoadouts() then
		WEAPON.DisplaySnipeIconByWeaponRef(arg_6_0, var_6_0, {
			setSnipeAnimOnElement = true
		})
	end

	if arg_6_5 then
		arg_6_0.WeaponButton.Grid:SetAlpha(1)
	else
		arg_6_0.WeaponButton.Grid:SetAlpha(0)
	end

	local var_6_10 = GUNSMITH.AreMasterChallengesEnabled(arg_6_1, var_6_0)
	local var_6_11 = LUI.FlowManager.GetScopedData(arg_6_0)

	var_0_3(arg_6_0, (arg_6_5 or arg_6_6) and var_6_6, var_6_10, var_6_11.bundleVariants and var_6_11.bundleVariants[var_6_0])
	arg_6_0.WeaponButton:addEventHandler("button_over", function()
		if arg_6_5 then
			arg_6_0.WeaponButton.Grid:SetAlpha(1, 200)
		else
			arg_6_0.WeaponButton.Grid:SetAlpha(0)
		end
	end)
	arg_6_0.WeaponButton:addEventHandler("button_up", function()
		if arg_6_5 then
			arg_6_0.WeaponButton.Grid:SetAlpha(1, 100)
		else
			arg_6_0.WeaponButton.Grid:SetAlpha(0)
		end
	end)
	arg_6_0:addAndCallEventHandler("menu_state_updated", function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_0 or arg_6_0:GetCurrentMenu()

		arg_6_0._menuState = var_9_0._scoped.menuState or var_0_4.loadoutSelect

		var_0_5(arg_6_0, arg_6_1, var_6_0, arg_6_2)
	end)

	if MatchRules.CADFFHGJAE(var_6_0) then
		ACTIONS.AnimateSequence(arg_6_0, "RestrictionOn")
	end

	if LOADOUT.MATCHRULES.WeaponHasRestrictedAttachment(arg_6_2.attachmentSetup, var_6_0) then
		ACTIONS.AnimateSequence(arg_6_0, "RestrictionWarningOn")
		ACTIONS.AnimateSequence(arg_6_0.AttachmentsButton, "RestrictionOn")
	else
		ACTIONS.AnimateSequence(arg_6_0, "RestrictionWarningOff")
		ACTIONS.AnimateSequence(arg_6_0.AttachmentsButton, "RestrictionOff")
	end

	if IsLanguageArabic() and CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "ArabicLayout")
	end
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.SetupCluster = var_0_6
	arg_10_0.HideCustomizeButtons = var_0_0
	arg_10_0.ShowCustomizeButtons = var_0_2

	if CONDITIONS.IsSplitscreen() then
		ACTIONS.AnimateSequence(arg_10_0, "Splitscreen")
	end

	arg_10_0:registerEventHandler("DisplayLoadoutButtons", function()
		arg_10_0:dispatchEventToParent({
			name = "DisplayLoadoutButtons",
			clusterID = arg_10_0.id
		})
	end)
	arg_10_0.AttachmentsButton.FocusableRegion:setGainFocusAllSFX(nil)
	arg_10_0.ChallengesButton.FocusableRegion:setGainFocusAllSFX(nil)
	arg_10_0.BlueprintStoreButton.FocusableRegion:setGainFocusAllSFX(nil)
	arg_10_0.BlueprintStoreButton:SetupTheme()
end

function LoadoutWeaponCluster(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 404 * _1080p, 0, 190 * _1080p)

	var_12_0.id = "LoadoutWeaponCluster"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("LoadoutWeaponButton", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "WeaponButton"

	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 404, 0, _1080p * 190)
	var_12_0:addElement(var_12_4)

	var_12_0.WeaponButton = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("RestrictionGunsmithWarning", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "RestrictionGunsmithWarning"

	var_12_6:SetAlpha(0, 0)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 411, _1080p * 453, 0, _1080p * 120)
	var_12_0:addElement(var_12_6)

	var_12_0.RestrictionGunsmithWarning = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("LoadoutEditButton", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "AttachmentsButton"

	var_12_8:SetAlpha(0, 0)
	var_12_8.Icon:setImage(RegisterMaterial("icon_attachments"), 0)
	var_12_8.ItemName:setText(Engine.CBBHFCGDIC("LUA_MENU/GUNSMITH"), 0)
	var_12_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 411, _1080p * 531, 0, _1080p * 120)
	var_12_0:addElement(var_12_8)

	var_12_0.AttachmentsButton = var_12_8

	local var_12_9
	local var_12_10 = MenuBuilder.BuildRegisteredType("LoadoutEditButton", {
		controllerIndex = var_12_1
	})

	var_12_10.id = "ChallengesButton"

	var_12_10:SetAlpha(0, 0)
	var_12_10.Icon:setImage(RegisterMaterial("icon_challenge_weapon"), 0)
	var_12_10.ItemName:setText(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGE"), 0)
	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 538, _1080p * 658, 0, _1080p * 120)
	var_12_0:addElement(var_12_10)

	var_12_0.ChallengesButton = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIImage.new()

	var_12_12.id = "RestrictionWarning"

	var_12_12:SetAlpha(0, 0)
	var_12_12:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_12_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -37, _1080p * -2, _1080p * 74, _1080p * 109)
	var_12_0:addElement(var_12_12)

	var_12_0.RestrictionWarning = var_12_12

	local var_12_13
	local var_12_14 = MenuBuilder.BuildRegisteredType("LoadoutEditButton", {
		controllerIndex = var_12_1
	})

	var_12_14.id = "BlueprintStoreButton"

	var_12_14:SetAlpha(0, 0)
	var_12_14.Icon:setImage(RegisterMaterial("icon_challenge_weapon"), 0)
	var_12_14.ItemName:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE"), 0)
	var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 665, _1080p * 785, 0, _1080p * 120)
	var_12_0:addElement(var_12_14)

	var_12_0.BlueprintStoreButton = var_12_14

	local var_12_15
	local var_12_16 = MenuBuilder.BuildRegisteredType("WZWeaponButtonSnipeIcon", {
		controllerIndex = var_12_1
	})

	var_12_16.id = "SnipeIcon"

	var_12_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -98, _1080p * -20, _1080p * 27, _1080p * 68)
	var_12_0:addElement(var_12_16)

	var_12_0.SnipeIcon = var_12_16

	local function var_12_17()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_17

	local function var_12_18()
		return
	end

	var_12_0._sequences.ExtendAttachments = var_12_18

	local function var_12_19()
		return
	end

	var_12_0._sequences.RetractAttachments = var_12_19

	local var_12_20
	local var_12_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 188
		}
	}

	var_12_4:RegisterAnimationSequence("Splitscreen", var_12_21)

	local function var_12_22()
		var_12_4:AnimateSequence("Splitscreen")
	end

	var_12_0._sequences.Splitscreen = var_12_22

	local var_12_23
	local var_12_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("RestrictionWarningOff", var_12_24)

	local function var_12_25()
		var_12_6:AnimateSequence("RestrictionWarningOff")
	end

	var_12_0._sequences.RestrictionWarningOff = var_12_25

	local var_12_26
	local var_12_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("RestrictionWarningOn", var_12_27)

	local function var_12_28()
		var_12_6:AnimateSequence("RestrictionWarningOn")
	end

	var_12_0._sequences.RestrictionWarningOn = var_12_28

	local var_12_29
	local var_12_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("RestrictionOn", var_12_30)

	local function var_12_31()
		var_12_12:AnimateSequence("RestrictionOn")
	end

	var_12_0._sequences.RestrictionOn = var_12_31

	local var_12_32
	local var_12_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("RestrictionOff", var_12_33)

	local function var_12_34()
		var_12_12:AnimateSequence("RestrictionOff")
	end

	var_12_0._sequences.RestrictionOff = var_12_34

	local var_12_35
	local var_12_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 538
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 658
		}
	}

	var_12_14:RegisterAnimationSequence("BlueprintStore2", var_12_36)

	local function var_12_37()
		var_12_14:AnimateSequence("BlueprintStore2")
	end

	var_12_0._sequences.BlueprintStore2 = var_12_37

	local var_12_38
	local var_12_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 411
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 531
		}
	}

	var_12_14:RegisterAnimationSequence("BlueprintStore1", var_12_39)

	local function var_12_40()
		var_12_14:AnimateSequence("BlueprintStore1")
	end

	var_12_0._sequences.BlueprintStore1 = var_12_40

	local var_12_41
	local var_12_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 665
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 785
		}
	}

	var_12_14:RegisterAnimationSequence("BlueprintStore3", var_12_42)

	local function var_12_43()
		var_12_14:AnimateSequence("BlueprintStore3")
	end

	var_12_0._sequences.BlueprintStore3 = var_12_43

	local function var_12_44()
		return
	end

	var_12_0._sequences.ArabicLayout = var_12_44

	local var_12_45
	local var_12_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -24
		}
	}

	var_12_16:RegisterAnimationSequence("DisplayExtraAttachments", var_12_46)

	local function var_12_47()
		var_12_16:AnimateSequence("DisplayExtraAttachments")
	end

	var_12_0._sequences.DisplayExtraAttachments = var_12_47

	local function var_12_48()
		return
	end

	var_12_0._sequences.HideExtraAttachments = var_12_48

	local var_12_49
	local var_12_50 = {
		{
			value = 0.12,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		}
	}

	var_12_16:RegisterAnimationSequence("VG", var_12_50)

	local function var_12_51()
		var_12_16:AnimateSequence("VG")
	end

	var_12_0._sequences.VG = var_12_51

	local var_12_52
	local var_12_53 = {
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -92
		}
	}

	var_12_16:RegisterAnimationSequence("CW", var_12_53)

	local function var_12_54()
		var_12_16:AnimateSequence("CW")
	end

	var_12_0._sequences.CW = var_12_54

	local var_12_55
	local var_12_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -92
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_16:RegisterAnimationSequence("MW", var_12_56)

	local function var_12_57()
		var_12_16:AnimateSequence("MW")
	end

	var_12_0._sequences.MW = var_12_57

	local var_12_58
	local var_12_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_12_16:RegisterAnimationSequence("ShowAttachments", var_12_59)

	local function var_12_60()
		var_12_16:AnimateSequence("ShowAttachments")
	end

	var_12_0._sequences.ShowAttachments = var_12_60

	var_0_7(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("LoadoutWeaponCluster", LoadoutWeaponCluster)
LockTable(_M)
