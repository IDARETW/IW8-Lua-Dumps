module(..., package.seeall)

local var_0_0 = {
	default = {
		buttonOverSnap = "ButtonOverSnap",
		buttonUpSnap = "ButtonUpSnap",
		buttonUp = "ButtonUp",
		buttonOver = "ButtonOver"
	},
	blueprint = {
		buttonOverSnap = "ButtonOverBlueprintSnap",
		buttonUpSnap = "ButtonUpBlueprintSnap",
		buttonUp = "ButtonUpBlueprint",
		buttonOver = "ButtonOverBlueprint"
	},
	bundle = {
		buttonOverSnap = "ButtonOverBundleSnap",
		buttonUpSnap = "ButtonUpBundleSnap",
		buttonUp = "ButtonUpBundle",
		buttonOver = "ButtonOverBundle"
	}
}

local function var_0_1(arg_1_0)
	local var_1_0 = LUI.FlowManager.GetScopedData(arg_1_0)

	var_1_0.updateModifications = true
	var_1_0.lastFocusedClass = WEAPON.GetWeaponClass(arg_1_0._modification.weapon)

	local var_1_1 = {
		weaponRef = arg_1_0._modification.weapon,
		modSlot = GUNSMITH.GetCustomModSlot(arg_1_0._modification.blueprintName),
		closeLocker = var_1_0.deletingForWeapon or arg_1_0._onlyItem
	}

	LUI.FlowManager.RequestAddMenu("DeleteCustomMod", true, arg_1_0.controllerIndex, false, var_1_1)
end

local function var_0_2(arg_2_0)
	arg_2_0.LoadoutItemButtonBackground:SetupTheme(false)
	ACTIONS.AnimateSequence(arg_2_0.NewItemSmallIcon, "DefaultSequence")

	if not arg_2_0._modification.isCustom and not arg_2_0._modification.isBase and not arg_2_0._modification.fromBundle then
		arg_2_0._buttonAnims = var_0_0.blueprint
	elseif arg_2_0._modification.fromBundle then
		arg_2_0._buttonAnims = var_0_0.bundle

		arg_2_0.LoadoutItemButtonBackground:SetupTheme(true)
		ACTIONS.AnimateSequence(arg_2_0.NewItemSmallIcon, "Store")
	else
		arg_2_0._buttonAnims = var_0_0.default
	end

	ACTIONS.AnimateSequence(arg_2_0, arg_2_0:isInFocus() and arg_2_0._buttonAnims.buttonOverSnap or arg_2_0._buttonAnims.buttonUpSnap)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	assert(arg_3_0.Name)
	assert(arg_3_0.DynamicWeaponIcon)
	assert(arg_3_0.BundleIcon)

	if arg_3_1.isCustom then
		arg_3_0.Name:setText(GUNSMITH.GetCustomModName(arg_3_1.blueprintName))
	else
		arg_3_0.Name:setText(arg_3_1.lootName)
	end

	arg_3_0._modification = arg_3_1
	arg_3_0._onlyItem = arg_3_3

	local var_3_0 = "IsBlueprint"

	if arg_3_1.fromBundle then
		var_3_0 = "IsBlueprintBundle"
	elseif arg_3_1.isCustom then
		var_3_0 = "IsCustom"
	elseif arg_3_0._modification.isBase then
		var_3_0 = "IsBase"
	end

	ACTIONS.AnimateSequence(arg_3_0, var_3_0)
	ACTIONS.AnimateSequence(arg_3_0.Selected, arg_3_2 and "On" or "Off")
	arg_3_0.DynamicWeaponIcon:UpdateWithWeaponTable(arg_3_0._controllerIndex, false, arg_3_1)

	if not arg_3_1.isCustom and not arg_3_0._modification.isBase then
		local var_3_1 = LOOT.GetItemQualityWithID(LOOT.itemTypes.WEAPON, arg_3_1.lootID)
		local var_3_2 = LOOT.GetRarityColor(var_3_1)

		arg_3_0.RarityColor:SetRGBFromTable(var_3_2)
	end

	arg_3_0.AttributeIcon:SetAlpha(0)

	if not arg_3_0._modification.isBase then
		local var_3_3 = WEAPON.GetSpecialAttributeIcon(arg_3_1.lootID)

		if #var_3_3 > 0 then
			arg_3_0.AttributeIcon:setImage(RegisterMaterial(var_3_3))
			arg_3_0.AttributeIcon:SetAlpha(1)
		end
	end

	if not arg_3_1.isCustom and not arg_3_1.fromBundle and arg_3_1.lootID and not arg_3_0._modification.isBase then
		arg_3_0._isNew = arg_3_0.NewItemSmallIcon:UpdateBreadcrumbByID(arg_3_0._controllerIndex, arg_3_1.lootID)
	end

	if LUI.FlowManager.GetScopedData(arg_3_0).blueprintStore and arg_3_1.fromBundle and arg_3_1.bundleID then
		arg_3_0._isNew = arg_3_0.NewItemSmallIcon:UpdateBreadcrumbByID(arg_3_0._controllerIndex, arg_3_1.bundleID)
	end

	var_0_2(arg_3_0)

	local function var_3_4()
		local var_4_0 = LUI.FlowManager.GetScopedData(arg_3_0)
		local var_4_1 = {
			weaponTable = arg_3_1
		}

		var_4_1.fromArmory = true
		var_4_1.weaponRef = var_4_1.weaponTable.weapon
		var_4_0.lastFocusedClass = WEAPON.GetWeaponClass(arg_3_1.weapon)

		LUI.FlowManager.RequestAddMenu("ModificationPreview", true, arg_3_0._controllerIndex, nil, var_4_1, true)
	end

	arg_3_0:SetupContextualMenu({
		title = arg_3_0.Name:getText()
	})

	local var_3_5 = {
		id = "weaponDetails",
		actionName = Engine.CBBHFCGDIC("LUA_MENU_MP/WEAPON_DETAIL_CONTEXTUAL"),
		actionFunction = var_3_4
	}

	arg_3_0:AddContextualMenuAction(var_3_5)

	local var_3_6 = {
		id = "deleteWeapon",
		actionName = Engine.CBBHFCGDIC("CAS/DELETE"),
		conditionFunction = function()
			return arg_3_1.isCustom
		end,
		actionFunction = function()
			var_0_1(arg_3_0)
		end
	}

	arg_3_0:AddContextualMenuAction(var_3_6)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.NewItemSmallIcon)

	arg_7_0._controllerIndex = arg_7_1
	arg_7_0._buttonAnims = var_0_0.default
	arg_7_0.Setup = var_0_3

	arg_7_0.BlueprintGrid:SetMask(arg_7_0.Mask)
	arg_7_0:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_7_0, arg_7_0._buttonAnims.buttonOver)
		arg_8_0:dispatchEventToCurrentMenu({
			name = "update_for_weapon",
			weapon = arg_7_0._modification
		})
	end)
	arg_7_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_7_0, arg_7_0._buttonAnims.buttonUp)

		if not arg_7_0._modification.isCustom and not arg_7_0._modification.isBase and not arg_7_0._modification.fromBundle and arg_7_0._modification.lootID and arg_7_0._isNew then
			arg_7_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_7_0._controllerIndex, arg_7_0._modification.lootID)
			arg_9_0:dispatchEventToCurrentMenu({
				name = "clear_newMod",
				weapon = arg_7_0._modification
			})
		end

		if LUI.FlowManager.GetScopedData(arg_7_0).blueprintStore and arg_7_0._modification.fromBundle and arg_7_0._modification.bundleID then
			arg_7_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_7_0._controllerIndex, arg_7_0._modification.bundleID)
		end
	end)
	arg_7_0:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		local var_10_0 = LUI.FlowManager.GetScopedData(arg_10_0)

		if var_10_0.selectingForWeapon then
			DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_10_0, arg_7_1, DYN_ATTACHMENT.StreamedImageAction.REMOVE)

			local var_10_1 = PlayerData.BFFBGAJGD(arg_7_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_10_0.loadoutIndex].weaponSetups[var_10_0.weaponSlot]

			WEAPON.EquipModification(var_10_1, arg_10_0._modification)

			local var_10_2 = {
				iconScale = -0.3,
				displayTime = 3000,
				icon = "cac_equip_fill",
				iconColor = SWATCHES.genericMenu.notificationHighlight,
				header = Engine.CBBHFCGDIC("LUA_MENU/WEAPON_EQUIPPED"),
				description = arg_7_0.Name:getText(),
				type = LUI.ToastManager.NotificationType.WeaponEquipped,
				controllerIndex = arg_7_1
			}

			arg_10_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_10_2
			})
			DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_10_0, arg_7_1, DYN_ATTACHMENT.StreamedImageAction.ADD)
			LUI.FlowManager.RequestLeaveMenuByName("WeaponSelect", true, true)
			LUI.FlowManager.RequestLeaveMenu(arg_10_0, false)
		elseif arg_10_0._modification.isCustom then
			var_0_1(arg_10_0)
		elseif arg_10_0._modification.fromBundle then
			arg_10_0:dispatchEventToCurrentMenu({
				name = "open_bundle"
			})
		end
	end)
end

function WeaponLockerButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 310 * _1080p, 0, 100 * _1080p)

	var_11_0.id = "WeaponLockerButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Backer"

	var_11_4:SetRGBFromTable(SWATCHES.genericMenu.bg, 0)
	var_11_4:SetAlpha(0.9, 0)
	var_11_4:SetBlendMode(BLEND_MODE.multiply)
	var_11_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -155, _1080p * 155, _1080p * -50, _1080p * 50)
	var_11_0:addElement(var_11_4)

	var_11_0.Backer = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "LoadoutItemButtonBackground"

	var_11_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -155, _1080p * 155, _1080p * -50, _1080p * 50)
	var_11_0:addElement(var_11_6)

	var_11_0.LoadoutItemButtonBackground = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "BlueprintGrid"

	var_11_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_11_8:SetAlpha(0.05, 0)
	var_11_8:setImage(RegisterMaterial("blueprintButton_grid"), 0)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -255.5, _1080p * 256.5, _1080p * -64, _1080p * 64)
	var_11_0:addElement(var_11_8)

	var_11_0.BlueprintGrid = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "BlueprintDetail"

	var_11_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_10:setImage(RegisterMaterial("blueprintButton_detail"), 0)
	var_11_10:Setup9SliceImage(_1080p * 80, _1080p * 40, 0.5, 0.5)
	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -146, _1080p * 152, _1080p * -44, _1080p * 44)
	var_11_0:addElement(var_11_10)

	var_11_0.BlueprintDetail = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIText.new()

	var_11_12.id = "Name"

	var_11_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_12:setText(ToUpperCase(""), 0)
	var_11_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_12:SetAlignment(LUI.Alignment.Left)
	var_11_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -141, _1080p * 118, _1080p * 6, _1080p * 30)
	var_11_0:addElement(var_11_12)

	var_11_0.Name = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "Selected"

	var_11_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -24, _1080p * -8, _1080p * 8, _1080p * 24)
	var_11_0:addElement(var_11_14)

	var_11_0.Selected = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIImage.new()

	var_11_16.id = "Mask"

	var_11_16:setImage(RegisterMaterial("stencil_mask"), 0)
	var_11_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * -50, _1080p * 50)
	var_11_0:addElement(var_11_16)

	var_11_0.Mask = var_11_16

	local var_11_17
	local var_11_18 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_11_1
	})

	var_11_18.id = "DynamicWeaponIcon"

	var_11_18:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_11_18:SetScale(-0.4, 0)
	var_11_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 109, _1080p * -46, _1080p * 60)
	var_11_0:addElement(var_11_18)

	var_11_0.DynamicWeaponIcon = var_11_18

	local var_11_19
	local var_11_20 = LUI.UIImage.new()

	var_11_20.id = "RarityColor"

	var_11_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 4, 0, _1080p * 100)
	var_11_0:addElement(var_11_20)

	var_11_0.RarityColor = var_11_20

	local var_11_21
	local var_11_22 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_22.id = "NewItemSmallIcon"

	var_11_22:SetAlpha(0, 0)
	var_11_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -20, _1080p * -12, _1080p * 12, _1080p * 20)
	var_11_0:addElement(var_11_22)

	var_11_0.NewItemSmallIcon = var_11_22

	local var_11_23
	local var_11_24 = LUI.UIImage.new()

	var_11_24.id = "ModIcon"

	var_11_24:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_24:setImage(RegisterMaterial("icon_mod"), 0)
	var_11_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 34, _1080p * 68, _1080p * 93)
	var_11_0:addElement(var_11_24)

	var_11_0.ModIcon = var_11_24

	local var_11_25
	local var_11_26 = LUI.UIImage.new()

	var_11_26.id = "BundleIcon"

	var_11_26:SetAlpha(0, 0)
	var_11_26:setImage(RegisterMaterial("icon_blueprint_bundle"), 0)
	var_11_26:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 11, _1080p * 33, _1080p * -30, _1080p * -8)
	var_11_0:addElement(var_11_26)

	var_11_0.BundleIcon = var_11_26

	local var_11_27
	local var_11_28 = LUI.UIImage.new()

	var_11_28.id = "BlueprintIcon"

	var_11_28:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_28:SetAlpha(0.8, 0)
	var_11_28:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_11_28:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 11, _1080p * 33, _1080p * -30, _1080p * -8)
	var_11_0:addElement(var_11_28)

	var_11_0.BlueprintIcon = var_11_28

	local var_11_29
	local var_11_30 = LUI.UIImage.new()

	var_11_30.id = "AttributeIcon"

	var_11_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 78, _1080p * 70, _1080p * 90)
	var_11_0:addElement(var_11_30)

	var_11_0.AttributeIcon = var_11_30

	local function var_11_31()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_31

	local var_11_32
	local var_11_33 = {
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverBlueprint", var_11_33)

	local var_11_34 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverBlueprint", var_11_34)

	local var_11_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverBlueprint", var_11_35)

	local var_11_36 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonOverBlueprint", var_11_36)

	local var_11_37 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_28:RegisterAnimationSequence("ButtonOverBlueprint", var_11_37)

	local function var_11_38()
		var_11_8:AnimateSequence("ButtonOverBlueprint")
		var_11_10:AnimateSequence("ButtonOverBlueprint")
		var_11_12:AnimateSequence("ButtonOverBlueprint")
		var_11_18:AnimateSequence("ButtonOverBlueprint")
		var_11_28:AnimateSequence("ButtonOverBlueprint")
	end

	var_11_0._sequences.ButtonOverBlueprint = var_11_38

	local var_11_39
	local var_11_40 = {
		{
			value = 0.05,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpBlueprint", var_11_40)

	local var_11_41 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpBlueprint", var_11_41)

	local var_11_42 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpBlueprint", var_11_42)

	local var_11_43 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonUpBlueprint", var_11_43)

	local var_11_44 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_28:RegisterAnimationSequence("ButtonUpBlueprint", var_11_44)

	local function var_11_45()
		var_11_8:AnimateSequence("ButtonUpBlueprint")
		var_11_10:AnimateSequence("ButtonUpBlueprint")
		var_11_12:AnimateSequence("ButtonUpBlueprint")
		var_11_18:AnimateSequence("ButtonUpBlueprint")
		var_11_28:AnimateSequence("ButtonUpBlueprint")
	end

	var_11_0._sequences.ButtonUpBlueprint = var_11_45

	local var_11_46
	local var_11_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bg
		}
	}

	var_11_4:RegisterAnimationSequence("IsBlueprint", var_11_47)

	local var_11_48 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("IsBlueprint", var_11_48)

	local var_11_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("IsBlueprint", var_11_49)

	local var_11_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("IsBlueprint", var_11_50)

	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("IsBlueprint", var_11_51)

	local var_11_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("IsBlueprint", var_11_52)

	local function var_11_53()
		var_11_4:AnimateSequence("IsBlueprint")
		var_11_8:AnimateSequence("IsBlueprint")
		var_11_10:AnimateSequence("IsBlueprint")
		var_11_20:AnimateSequence("IsBlueprint")
		var_11_24:AnimateSequence("IsBlueprint")
		var_11_26:AnimateSequence("IsBlueprint")
	end

	var_11_0._sequences.IsBlueprint = var_11_53

	local var_11_54
	local var_11_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bg
		}
	}

	var_11_4:RegisterAnimationSequence("IsCustom", var_11_55)

	local var_11_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -255
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 257
		}
	}

	var_11_8:RegisterAnimationSequence("IsCustom", var_11_56)

	local var_11_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("IsCustom", var_11_57)

	local var_11_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("IsCustom", var_11_58)

	local var_11_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("IsCustom", var_11_59)

	local var_11_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("IsCustom", var_11_60)

	local var_11_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_28:RegisterAnimationSequence("IsCustom", var_11_61)

	local function var_11_62()
		var_11_4:AnimateSequence("IsCustom")
		var_11_8:AnimateSequence("IsCustom")
		var_11_10:AnimateSequence("IsCustom")
		var_11_20:AnimateSequence("IsCustom")
		var_11_24:AnimateSequence("IsCustom")
		var_11_26:AnimateSequence("IsCustom")
		var_11_28:AnimateSequence("IsCustom")
	end

	var_11_0._sequences.IsCustom = var_11_62

	local var_11_63
	local var_11_64 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOver", var_11_64)

	local var_11_65 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonOver", var_11_65)

	local var_11_66 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonOver", var_11_66)

	local function var_11_67()
		var_11_12:AnimateSequence("ButtonOver")
		var_11_18:AnimateSequence("ButtonOver")
		var_11_24:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_67

	local var_11_68
	local var_11_69 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUp", var_11_69)

	local var_11_70 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonUp", var_11_70)

	local var_11_71 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonUp", var_11_71)

	local function var_11_72()
		var_11_12:AnimateSequence("ButtonUp")
		var_11_18:AnimateSequence("ButtonUp")
		var_11_24:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_72

	local var_11_73
	local var_11_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bg
		}
	}

	var_11_4:RegisterAnimationSequence("IsBase", var_11_74)

	local var_11_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -255
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 257
		}
	}

	var_11_8:RegisterAnimationSequence("IsBase", var_11_75)

	local var_11_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("IsBase", var_11_76)

	local var_11_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("IsBase", var_11_77)

	local var_11_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("IsBase", var_11_78)

	local var_11_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_28:RegisterAnimationSequence("IsBase", var_11_79)

	local function var_11_80()
		var_11_4:AnimateSequence("IsBase")
		var_11_8:AnimateSequence("IsBase")
		var_11_10:AnimateSequence("IsBase")
		var_11_20:AnimateSequence("IsBase")
		var_11_24:AnimateSequence("IsBase")
		var_11_28:AnimateSequence("IsBase")
	end

	var_11_0._sequences.IsBase = var_11_80

	local var_11_81
	local var_11_82 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverBundle", var_11_82)

	local var_11_83 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverBundle", var_11_83)

	local var_11_84 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverBundle", var_11_84)

	local var_11_85 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonOverBundle", var_11_85)

	local var_11_86 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("ButtonOverBundle", var_11_86)

	local function var_11_87()
		var_11_8:AnimateSequence("ButtonOverBundle")
		var_11_10:AnimateSequence("ButtonOverBundle")
		var_11_12:AnimateSequence("ButtonOverBundle")
		var_11_18:AnimateSequence("ButtonOverBundle")
		var_11_26:AnimateSequence("ButtonOverBundle")
	end

	var_11_0._sequences.ButtonOverBundle = var_11_87

	local var_11_88
	local var_11_89 = {
		{
			value = 0.05,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpBundle", var_11_89)

	local var_11_90 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpBundle", var_11_90)

	local var_11_91 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpBundle", var_11_91)

	local var_11_92 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonUpBundle", var_11_92)

	local var_11_93 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("ButtonUpBundle", var_11_93)

	local function var_11_94()
		var_11_8:AnimateSequence("ButtonUpBundle")
		var_11_10:AnimateSequence("ButtonUpBundle")
		var_11_12:AnimateSequence("ButtonUpBundle")
		var_11_18:AnimateSequence("ButtonUpBundle")
		var_11_26:AnimateSequence("ButtonUpBundle")
	end

	var_11_0._sequences.ButtonUpBundle = var_11_94

	local var_11_95
	local var_11_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverSnap", var_11_96)

	local var_11_97 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonOverSnap", var_11_97)

	local var_11_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonOverSnap", var_11_98)

	local function var_11_99()
		var_11_12:AnimateSequence("ButtonOverSnap")
		var_11_18:AnimateSequence("ButtonOverSnap")
		var_11_24:AnimateSequence("ButtonOverSnap")
	end

	var_11_0._sequences.ButtonOverSnap = var_11_99

	local var_11_100
	local var_11_101 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverBlueprintSnap", var_11_101)

	local var_11_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverBlueprintSnap", var_11_102)

	local var_11_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverBlueprintSnap", var_11_103)

	local var_11_104 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonOverBlueprintSnap", var_11_104)

	local var_11_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_28:RegisterAnimationSequence("ButtonOverBlueprintSnap", var_11_105)

	local function var_11_106()
		var_11_8:AnimateSequence("ButtonOverBlueprintSnap")
		var_11_10:AnimateSequence("ButtonOverBlueprintSnap")
		var_11_12:AnimateSequence("ButtonOverBlueprintSnap")
		var_11_18:AnimateSequence("ButtonOverBlueprintSnap")
		var_11_28:AnimateSequence("ButtonOverBlueprintSnap")
	end

	var_11_0._sequences.ButtonOverBlueprintSnap = var_11_106

	local var_11_107
	local var_11_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverBundleSnap", var_11_108)

	local var_11_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverBundleSnap", var_11_109)

	local var_11_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverBundleSnap", var_11_110)

	local var_11_111 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonOverBundleSnap", var_11_111)

	local var_11_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("ButtonOverBundleSnap", var_11_112)

	local function var_11_113()
		var_11_8:AnimateSequence("ButtonOverBundleSnap")
		var_11_10:AnimateSequence("ButtonOverBundleSnap")
		var_11_12:AnimateSequence("ButtonOverBundleSnap")
		var_11_18:AnimateSequence("ButtonOverBundleSnap")
		var_11_26:AnimateSequence("ButtonOverBundleSnap")
	end

	var_11_0._sequences.ButtonOverBundleSnap = var_11_113

	local var_11_114
	local var_11_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpSnap", var_11_115)

	local var_11_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonUpSnap", var_11_116)

	local var_11_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonUpSnap", var_11_117)

	local function var_11_118()
		var_11_12:AnimateSequence("ButtonUpSnap")
		var_11_18:AnimateSequence("ButtonUpSnap")
		var_11_24:AnimateSequence("ButtonUpSnap")
	end

	var_11_0._sequences.ButtonUpSnap = var_11_118

	local var_11_119
	local var_11_120 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpBlueprintSnap", var_11_120)

	local var_11_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpBlueprintSnap", var_11_121)

	local var_11_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpBlueprintSnap", var_11_122)

	local var_11_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonUpBlueprintSnap", var_11_123)

	local var_11_124 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_28:RegisterAnimationSequence("ButtonUpBlueprintSnap", var_11_124)

	local function var_11_125()
		var_11_8:AnimateSequence("ButtonUpBlueprintSnap")
		var_11_10:AnimateSequence("ButtonUpBlueprintSnap")
		var_11_12:AnimateSequence("ButtonUpBlueprintSnap")
		var_11_18:AnimateSequence("ButtonUpBlueprintSnap")
		var_11_28:AnimateSequence("ButtonUpBlueprintSnap")
	end

	var_11_0._sequences.ButtonUpBlueprintSnap = var_11_125

	local var_11_126
	local var_11_127 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpBundleSnap", var_11_127)

	local var_11_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpBundleSnap", var_11_128)

	local var_11_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpBundleSnap", var_11_129)

	local var_11_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_18:RegisterAnimationSequence("ButtonUpBundleSnap", var_11_130)

	local var_11_131 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("ButtonUpBundleSnap", var_11_131)

	local function var_11_132()
		var_11_8:AnimateSequence("ButtonUpBundleSnap")
		var_11_10:AnimateSequence("ButtonUpBundleSnap")
		var_11_12:AnimateSequence("ButtonUpBundleSnap")
		var_11_18:AnimateSequence("ButtonUpBundleSnap")
		var_11_26:AnimateSequence("ButtonUpBundleSnap")
	end

	var_11_0._sequences.ButtonUpBundleSnap = var_11_132

	local var_11_133
	local var_11_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleBG
		}
	}

	var_11_4:RegisterAnimationSequence("IsBlueprintBundle", var_11_134)

	local var_11_135 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("IsBlueprintBundle", var_11_135)

	local var_11_136 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("IsBlueprintBundle", var_11_136)

	local var_11_137 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("IsBlueprintBundle", var_11_137)

	local var_11_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("IsBlueprintBundle", var_11_138)

	local var_11_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_28:RegisterAnimationSequence("IsBlueprintBundle", var_11_139)

	local function var_11_140()
		var_11_4:AnimateSequence("IsBlueprintBundle")
		var_11_8:AnimateSequence("IsBlueprintBundle")
		var_11_10:AnimateSequence("IsBlueprintBundle")
		var_11_20:AnimateSequence("IsBlueprintBundle")
		var_11_24:AnimateSequence("IsBlueprintBundle")
		var_11_28:AnimateSequence("IsBlueprintBundle")
	end

	var_11_0._sequences.IsBlueprintBundle = var_11_140

	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("WeaponLockerButton", WeaponLockerButton)
LockTable(_M)
