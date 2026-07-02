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
	var_1_0.lastFocusedClass = WEAPON.GetWeaponClass(arg_1_0._modification.weapon, true)

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

	WZWIP.AnimateThemeElement(arg_2_0, arg_2_0:isInFocus() and arg_2_0._buttonAnims.buttonOverSnap or arg_2_0._buttonAnims.buttonUpSnap)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
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

	if CONDITIONS.AreRestrictionsActiveAndBlueprintsAllowed(arg_3_0, arg_3_0._controllerIndex) then
		arg_3_0.RestrictionWarning:SetAlpha(arg_3_4 and 1 or 0)
		arg_3_0:SetButtonDisabled(arg_3_4)
	end

	ACTIONS.AnimateSequence(arg_3_0, var_3_0)
	ACTIONS.AnimateSequence(arg_3_0.Selected, arg_3_2 and "On" or "Off")

	local var_3_1 = WEAPON.GetWeaponClass(arg_3_0._modification.weapon)

	if DYN_ATTACHMENT.IsDynamicAttachmentIconsEnabled() and WEAPON.IsBulletWeapon(var_3_1) then
		local var_3_2

		if arg_3_0._modification.isBase then
			var_3_2 = WEAPON.GenerateWeaponTableFromRef(arg_3_0._modification.weapon)
		elseif arg_3_1.isCustom then
			local var_3_3 = arg_3_0._modification.weapon
			local var_3_4 = GUNSMITH.GetCustomModSlot(arg_3_0._modification.blueprintName)

			var_3_2 = GUNSMITH.GetCustomMod(arg_3_0._controllerIndex, var_3_3, var_3_4)
		else
			var_3_2 = WEAPON.GenerateWeaponTableFromID(arg_3_0._controllerIndex, arg_3_0._modification.lootID)
		end

		local var_3_5 = WEAPON.GetWeaponModelName(var_3_2.weapon, var_3_2, {
			includeStickers = true,
			includeAttachments = true,
			keepAkimbo = true,
			includeCamos = true,
			isDefault = arg_3_0._modification.isBase,
			controllerIndex = arg_3_0._controllerIndex
		})
		local var_3_6 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_3_5)

		arg_3_0.DynamicWeaponIcon:SetAlpha(1)
		arg_3_0.DynamicWeaponIcon:PerformUpdate(arg_3_0._controllerIndex, {
			isInteractive = false,
			attachmentsData = var_3_6,
			weaponRef = arg_3_0._modification.weapon,
			weaponFullName = var_3_5
		})
	else
		arg_3_0.DynamicWeaponIcon:UpdateStaticWithWeaponTable(arg_3_0._controllerIndex, arg_3_0._modification)
	end

	if not arg_3_1.isCustom and not arg_3_0._modification.isBase then
		local var_3_7 = LOOT.GetItemQualityWithID(LOOT.itemTypes.WEAPON, arg_3_1.lootID)
		local var_3_8 = LOOT.GetRarityColor(var_3_7)

		arg_3_0.RarityColor:SetRGBFromTable(var_3_8)
	end

	arg_3_0.AttributeIcon:SetAlpha(0)

	if not arg_3_0._modification.isBase then
		local var_3_9
		local var_3_10 = WEAPON.GetDismembermentType(arg_3_1)
		local var_3_11 = WEAPON.GetTracerType(arg_3_1.lootID)

		if var_3_10 and Loot.DEBEIFJEEG(arg_3_0._controllerIndex, arg_3_1.lootID) > 0 or var_3_10 and arg_3_1.lootID == 0 then
			var_3_9 = var_3_10
		elseif var_3_11 and #var_3_11 > 0 then
			var_3_9 = var_3_11
		end

		if var_3_9 then
			local var_3_12 = WEAPON.GetSpecialAttributeIcon(var_3_9)
			local var_3_13 = WEAPON.GetSpecialAttributeIconColor(var_3_9)

			arg_3_0.AttributeIcon:SetRGBFromTable(var_3_9 == var_3_11 and var_3_13 or COLORS.white)

			arg_3_0._hasAttribute = true

			arg_3_0.AttributeIcon:setImage(RegisterMaterial(var_3_12))
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

	local var_3_14 = arg_3_5 == nil and true or arg_3_5

	if Engine.DDJFBBJAIG() and var_3_14 then
		local function var_3_15()
			local var_4_0 = LUI.FlowManager.GetScopedData(arg_3_0)
			local var_4_1 = {
				weaponTable = arg_3_1
			}

			var_4_1.fromArmory = true
			var_4_1.weaponRef = var_4_1.weaponTable.weapon
			var_4_0.lastFocusedClass = WEAPON.GetWeaponClass(arg_3_1.weapon, true)

			LUI.FlowManager.RequestAddMenu("ModificationPreview", true, arg_3_0._controllerIndex, nil, var_4_1, true)
		end

		arg_3_0:SetupContextualMenu({
			title = arg_3_0.Name:getText()
		})

		local var_3_16 = {
			id = "weaponDetails",
			actionName = Engine.CBBHFCGDIC("LUA_MENU_MP/WEAPON_DETAIL_CONTEXTUAL"),
			actionFunction = var_3_15
		}

		arg_3_0:AddContextualMenuAction(var_3_16)

		local var_3_17 = {
			id = "deleteWeapon",
			actionName = Engine.CBBHFCGDIC("CAS/DELETE"),
			conditionFunction = function()
				return arg_3_1.isCustom
			end,
			actionFunction = function()
				var_0_1(arg_3_0)
			end
		}

		arg_3_0:AddContextualMenuAction(var_3_17)
	end

	WEAPON.DisplaySnipeIconByWeaponRef(arg_3_0, arg_3_1.weapon, {
		setSnipeAnimOnElement = true
	})

	local var_3_18 = false

	if arg_3_1 and not arg_3_1.isBase and arg_3_1.lootID then
		local var_3_19 = arg_3_1.lootID

		if arg_3_1.lootID == 0 then
			var_3_19 = LOOT.GetBaseWeaponItemID(arg_3_1.weapon)
		end

		var_3_18 = LOOT.HasReactiveCamo(var_3_19)

		if arg_3_0._hasAttribute and var_3_18 then
			LAYOUT.MoveImageNextToImage(arg_3_0.AttributeIcon, arg_3_0.ReactiveIcon, {
				padding = -5
			})
		end
	end

	ACTIONS.AnimateSequence(arg_3_0, var_3_18 and "ShowReactiveIcon" or "HideReactiveIcon")
	arg_3_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		WZWIP.AnimateThemeElement(arg_3_0, arg_3_0._buttonAnims.buttonOver)
		arg_7_0:dispatchEventToCurrentMenu({
			name = "update_for_weapon",
			weapon = arg_3_0._modification
		})
	end)
	arg_3_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		WZWIP.AnimateThemeElement(arg_3_0, arg_3_0._buttonAnims.buttonUp)

		if not arg_3_0._modification.isCustom and not arg_3_0._modification.isBase and not arg_3_0._modification.fromBundle and arg_3_0._modification.lootID and arg_3_0._isNew then
			arg_3_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_3_0._controllerIndex, arg_3_0._modification.lootID)
			arg_8_0:dispatchEventToCurrentMenu({
				name = "clear_newMod",
				weapon = arg_3_0._modification
			})
		end

		if LUI.FlowManager.GetScopedData(arg_3_0).blueprintStore and arg_3_0._modification.fromBundle and arg_3_0._modification.bundleID then
			arg_3_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_3_0._controllerIndex, arg_3_0._modification.bundleID)
		end
	end)
	arg_3_0:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		local var_9_0 = LUI.FlowManager.GetScopedData(arg_9_0)

		if var_9_0.selectingForWeapon then
			DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_9_0, arg_3_0._controllerIndex, DYN_ATTACHMENT.StreamedImageAction.REMOVE)

			local var_9_1 = PlayerData.BFFBGAJGD(arg_3_0._controllerIndex, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_9_0.loadoutIndex].weaponSetups[var_9_0.weaponSlot]

			WEAPON.EquipModification(var_9_1, arg_9_0._modification)

			local var_9_2 = {
				iconScale = -0.3,
				displayTime = 3000,
				icon = "cac_equip_fill",
				iconColor = SWATCHES.genericMenu.notificationHighlight,
				header = Engine.CBBHFCGDIC("LUA_MENU/WEAPON_EQUIPPED"),
				description = arg_3_0.Name:getText(),
				type = LUI.ToastManager.NotificationType.WeaponEquipped,
				controllerIndex = arg_3_0._controllerIndex
			}

			arg_9_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_9_2
			})
			DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_9_0, arg_3_0._controllerIndex, DYN_ATTACHMENT.StreamedImageAction.ADD)
			LUI.FlowManager.RequestLeaveMenuByName("WeaponSelect", true, true)
			LUI.FlowManager.RequestLeaveMenu(arg_9_0, false)
		elseif arg_9_0._modification.isCustom then
			var_0_1(arg_9_0)
		elseif arg_9_0._modification.fromBundle then
			arg_9_0:dispatchEventToCurrentMenu({
				name = "open_bundle"
			})
		end
	end)
end

local function var_0_4(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.NewItemSmallIcon)

	arg_10_0._controllerIndex = arg_10_1
	arg_10_0._buttonAnims = var_0_0.default
	arg_10_0.Setup = var_0_3

	THEMES.ApplyRandomMaskRotation(arg_10_0, {
		elementToMask = arg_10_0.LoadoutItemButtonBackground
	})

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_10_0, "WZWipSetup")
	end
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

	var_11_0:setUseStencil(true)

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

	if CONDITIONS.IsVanguardRevealed() then
		local var_11_8 = LUI.UIImage.new()

		var_11_8.id = "Mask"

		var_11_8:SetXRotation(180, 0)
		var_11_8:SetYRotation(180, 0)
		var_11_8:SetZRotation(180, 0)
		var_11_8:setImage(RegisterMaterial("ui_mp_wz_bkg_button_5"), 0)
		var_11_0:addElement(var_11_8)

		var_11_0.Mask = var_11_8
	end

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "BlueprintGrid"

	var_11_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_11_10:SetAlpha(0.8, 0)
	var_11_10:setImage(RegisterMaterial("blueprintButton_grid"), 0)
	var_11_0:addElement(var_11_10)

	var_11_0.BlueprintGrid = var_11_10

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
	local var_11_16 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "DynamicWeaponIcon"

	var_11_16:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_11_16:SetScale(-0.4, 0)
	var_11_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 109, _1080p * -46, _1080p * 60)
	var_11_0:addElement(var_11_16)

	var_11_0.DynamicWeaponIcon = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIImage.new()

	var_11_18.id = "RarityColor"

	var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 4, 0, _1080p * 100)
	var_11_0:addElement(var_11_18)

	var_11_0.RarityColor = var_11_18

	local var_11_19
	local var_11_20 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_20.id = "NewItemSmallIcon"

	var_11_20:SetAlpha(0, 0)
	var_11_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -20, _1080p * -12, _1080p * 12, _1080p * 20)
	var_11_0:addElement(var_11_20)

	var_11_0.NewItemSmallIcon = var_11_20

	local var_11_21
	local var_11_22 = LUI.UIImage.new()

	var_11_22.id = "ModIcon"

	var_11_22:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_22:setImage(RegisterMaterial("icon_mod"), 0)
	var_11_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 34, _1080p * 68, _1080p * 93)
	var_11_0:addElement(var_11_22)

	var_11_0.ModIcon = var_11_22

	local var_11_23
	local var_11_24 = LUI.UIImage.new()

	var_11_24.id = "BundleIcon"

	var_11_24:SetAlpha(0, 0)
	var_11_24:setImage(RegisterMaterial("icon_blueprint_bundle"), 0)
	var_11_24:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 11, _1080p * 33, _1080p * -30, _1080p * -8)
	var_11_0:addElement(var_11_24)

	var_11_0.BundleIcon = var_11_24

	local var_11_25
	local var_11_26 = LUI.UIImage.new()

	var_11_26.id = "BlueprintIcon"

	var_11_26:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_26:SetAlpha(0.8, 0)
	var_11_26:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_11_26:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 11, _1080p * 33, _1080p * -30, _1080p * -8)
	var_11_0:addElement(var_11_26)

	var_11_0.BlueprintIcon = var_11_26

	local var_11_27
	local var_11_28 = LUI.UIImage.new()

	var_11_28.id = "AttributeIcon"

	var_11_28:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 38, _1080p * 78, _1080p * -30, _1080p * -10)
	var_11_0:addElement(var_11_28)

	var_11_0.AttributeIcon = var_11_28

	local var_11_29

	if CONDITIONS.AreRestrictionsActiveAndBlueprintsAllowed(var_11_0, var_11_1) then
		local var_11_30 = LUI.UIImage.new()

		var_11_30.id = "RestrictionWarning"

		var_11_30:SetAlpha(0, 0)
		var_11_30:setImage(RegisterMaterial("ui_streak_warning"), 0)
		var_11_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 101, _1080p * 131, _1080p * -48, _1080p * -20)
		var_11_0:addElement(var_11_30)

		var_11_0.RestrictionWarning = var_11_30
	end

	local var_11_31
	local var_11_32 = LUI.UIImage.new()

	var_11_32.id = "ReactiveIcon"

	var_11_32:setImage(RegisterMaterial("ui_icon_blueprint_reactive_camo_flipbook"), 0)
	var_11_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 38, _1080p * 101, _1080p * -34, _1080p * -6)
	var_11_0:addElement(var_11_32)

	var_11_0.ReactiveIcon = var_11_32

	local var_11_33
	local var_11_34 = MenuBuilder.BuildRegisteredType("WZWeaponButtonSnipeIcon", {
		controllerIndex = var_11_1
	})

	var_11_34.id = "SnipeIcon"

	var_11_34:SetScale(-0.3, 0)
	var_11_34:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -77, _1080p * 1, _1080p * -41, 0)
	var_11_0:addElement(var_11_34)

	var_11_0.SnipeIcon = var_11_34

	local function var_11_35()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_35

	local var_11_36
	local var_11_37 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverBlueprint", var_11_37)

	local var_11_38 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOverBlueprint", var_11_38)

	local var_11_39 = {
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

	var_11_26:RegisterAnimationSequence("ButtonOverBlueprint", var_11_39)

	local function var_11_40()
		var_11_12:AnimateSequence("ButtonOverBlueprint")
		var_11_16:AnimateSequence("ButtonOverBlueprint")
		var_11_26:AnimateSequence("ButtonOverBlueprint")
	end

	var_11_0._sequences.ButtonOverBlueprint = var_11_40

	local var_11_41
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

	var_11_16:RegisterAnimationSequence("ButtonUpBlueprint", var_11_43)

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

	var_11_26:RegisterAnimationSequence("ButtonUpBlueprint", var_11_44)

	local function var_11_45()
		var_11_12:AnimateSequence("ButtonUpBlueprint")
		var_11_16:AnimateSequence("ButtonUpBlueprint")
		var_11_26:AnimateSequence("ButtonUpBlueprint")
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("IsBlueprint", var_11_48)

	local var_11_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_22:RegisterAnimationSequence("IsBlueprint", var_11_49)

	local var_11_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("IsBlueprint", var_11_50)

	local function var_11_51()
		var_11_4:AnimateSequence("IsBlueprint")
		var_11_18:AnimateSequence("IsBlueprint")
		var_11_22:AnimateSequence("IsBlueprint")
		var_11_24:AnimateSequence("IsBlueprint")
	end

	var_11_0._sequences.IsBlueprint = var_11_51

	local var_11_52
	local var_11_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bg
		}
	}

	var_11_4:RegisterAnimationSequence("IsCustom", var_11_53)

	local var_11_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("IsCustom", var_11_54)

	local var_11_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_22:RegisterAnimationSequence("IsCustom", var_11_55)

	local var_11_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("IsCustom", var_11_56)

	local var_11_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("IsCustom", var_11_57)

	local function var_11_58()
		var_11_4:AnimateSequence("IsCustom")
		var_11_18:AnimateSequence("IsCustom")
		var_11_22:AnimateSequence("IsCustom")
		var_11_24:AnimateSequence("IsCustom")
		var_11_26:AnimateSequence("IsCustom")
	end

	var_11_0._sequences.IsCustom = var_11_58

	local var_11_59
	local var_11_60 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOver", var_11_60)

	local var_11_61 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOver", var_11_61)

	local var_11_62 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_22:RegisterAnimationSequence("ButtonOver", var_11_62)

	local function var_11_63()
		var_11_12:AnimateSequence("ButtonOver")
		var_11_16:AnimateSequence("ButtonOver")
		var_11_22:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_63

	local var_11_64
	local var_11_65 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUp", var_11_65)

	local var_11_66 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUp", var_11_66)

	local var_11_67 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_22:RegisterAnimationSequence("ButtonUp", var_11_67)

	local function var_11_68()
		var_11_12:AnimateSequence("ButtonUp")
		var_11_16:AnimateSequence("ButtonUp")
		var_11_22:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_68

	local var_11_69
	local var_11_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bg
		}
	}

	var_11_4:RegisterAnimationSequence("IsBase", var_11_70)

	local var_11_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("IsBase", var_11_71)

	local var_11_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_22:RegisterAnimationSequence("IsBase", var_11_72)

	local var_11_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("IsBase", var_11_73)

	local function var_11_74()
		var_11_4:AnimateSequence("IsBase")
		var_11_18:AnimateSequence("IsBase")
		var_11_22:AnimateSequence("IsBase")
		var_11_26:AnimateSequence("IsBase")
	end

	var_11_0._sequences.IsBase = var_11_74

	local var_11_75
	local var_11_76 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverBundle", var_11_76)

	local var_11_77 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOverBundle", var_11_77)

	local var_11_78 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonOverBundle", var_11_78)

	local function var_11_79()
		var_11_12:AnimateSequence("ButtonOverBundle")
		var_11_16:AnimateSequence("ButtonOverBundle")
		var_11_24:AnimateSequence("ButtonOverBundle")
	end

	var_11_0._sequences.ButtonOverBundle = var_11_79

	local var_11_80
	local var_11_81 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpBundle", var_11_81)

	local var_11_82 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUpBundle", var_11_82)

	local var_11_83 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonUpBundle", var_11_83)

	local function var_11_84()
		var_11_12:AnimateSequence("ButtonUpBundle")
		var_11_16:AnimateSequence("ButtonUpBundle")
		var_11_24:AnimateSequence("ButtonUpBundle")
	end

	var_11_0._sequences.ButtonUpBundle = var_11_84

	local var_11_85
	local var_11_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverSnap", var_11_86)

	local var_11_87 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOverSnap", var_11_87)

	local var_11_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_22:RegisterAnimationSequence("ButtonOverSnap", var_11_88)

	local function var_11_89()
		var_11_12:AnimateSequence("ButtonOverSnap")
		var_11_16:AnimateSequence("ButtonOverSnap")
		var_11_22:AnimateSequence("ButtonOverSnap")
	end

	var_11_0._sequences.ButtonOverSnap = var_11_89

	local var_11_90
	local var_11_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverBlueprintSnap", var_11_91)

	local var_11_92 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOverBlueprintSnap", var_11_92)

	local var_11_93 = {
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

	var_11_26:RegisterAnimationSequence("ButtonOverBlueprintSnap", var_11_93)

	local function var_11_94()
		var_11_12:AnimateSequence("ButtonOverBlueprintSnap")
		var_11_16:AnimateSequence("ButtonOverBlueprintSnap")
		var_11_26:AnimateSequence("ButtonOverBlueprintSnap")
	end

	var_11_0._sequences.ButtonOverBlueprintSnap = var_11_94

	local var_11_95
	local var_11_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverBundleSnap", var_11_96)

	local var_11_97 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOverBundleSnap", var_11_97)

	local var_11_98 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonOverBundleSnap", var_11_98)

	local function var_11_99()
		var_11_12:AnimateSequence("ButtonOverBundleSnap")
		var_11_16:AnimateSequence("ButtonOverBundleSnap")
		var_11_24:AnimateSequence("ButtonOverBundleSnap")
	end

	var_11_0._sequences.ButtonOverBundleSnap = var_11_99

	local var_11_100
	local var_11_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpSnap", var_11_101)

	local var_11_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUpSnap", var_11_102)

	local var_11_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_22:RegisterAnimationSequence("ButtonUpSnap", var_11_103)

	local function var_11_104()
		var_11_12:AnimateSequence("ButtonUpSnap")
		var_11_16:AnimateSequence("ButtonUpSnap")
		var_11_22:AnimateSequence("ButtonUpSnap")
	end

	var_11_0._sequences.ButtonUpSnap = var_11_104

	local var_11_105
	local var_11_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpBlueprintSnap", var_11_106)

	local var_11_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUpBlueprintSnap", var_11_107)

	local var_11_108 = {
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

	var_11_26:RegisterAnimationSequence("ButtonUpBlueprintSnap", var_11_108)

	local function var_11_109()
		var_11_12:AnimateSequence("ButtonUpBlueprintSnap")
		var_11_16:AnimateSequence("ButtonUpBlueprintSnap")
		var_11_26:AnimateSequence("ButtonUpBlueprintSnap")
	end

	var_11_0._sequences.ButtonUpBlueprintSnap = var_11_109

	local var_11_110
	local var_11_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpBundleSnap", var_11_111)

	local var_11_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUpBundleSnap", var_11_112)

	local var_11_113 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonUpBundleSnap", var_11_113)

	local function var_11_114()
		var_11_12:AnimateSequence("ButtonUpBundleSnap")
		var_11_16:AnimateSequence("ButtonUpBundleSnap")
		var_11_24:AnimateSequence("ButtonUpBundleSnap")
	end

	var_11_0._sequences.ButtonUpBundleSnap = var_11_114

	local var_11_115
	local var_11_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleBG
		}
	}

	var_11_4:RegisterAnimationSequence("IsBlueprintBundle", var_11_116)

	local var_11_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("IsBlueprintBundle", var_11_117)

	local var_11_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_22:RegisterAnimationSequence("IsBlueprintBundle", var_11_118)

	local var_11_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("IsBlueprintBundle", var_11_119)

	local function var_11_120()
		var_11_4:AnimateSequence("IsBlueprintBundle")
		var_11_18:AnimateSequence("IsBlueprintBundle")
		var_11_22:AnimateSequence("IsBlueprintBundle")
		var_11_26:AnimateSequence("IsBlueprintBundle")
	end

	var_11_0._sequences.IsBlueprintBundle = var_11_120

	local var_11_121
	local var_11_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_32:RegisterAnimationSequence("ShowReactiveIcon", var_11_122)

	local function var_11_123()
		var_11_32:AnimateSequence("ShowReactiveIcon")
	end

	var_11_0._sequences.ShowReactiveIcon = var_11_123

	local var_11_124
	local var_11_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_32:RegisterAnimationSequence("HideReactiveIcon", var_11_125)

	local function var_11_126()
		var_11_32:AnimateSequence("HideReactiveIcon")
	end

	var_11_0._sequences.HideReactiveIcon = var_11_126

	local var_11_127
	local var_11_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipSetup", var_11_128)

	local var_11_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipSetup", var_11_129)

	local var_11_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_11_26:RegisterAnimationSequence("WZWipSetup", var_11_130)

	local function var_11_131()
		var_11_10:AnimateSequence("WZWipSetup")
		var_11_12:AnimateSequence("WZWipSetup")
		var_11_26:AnimateSequence("WZWipSetup")
	end

	var_11_0._sequences.WZWipSetup = var_11_131

	local var_11_132
	local var_11_133 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZButtonOver", var_11_133)

	local var_11_134 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("WZButtonOver", var_11_134)

	local var_11_135 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_22:RegisterAnimationSequence("WZButtonOver", var_11_135)

	local function var_11_136()
		var_11_12:AnimateSequence("WZButtonOver")
		var_11_16:AnimateSequence("WZButtonOver")
		var_11_22:AnimateSequence("WZButtonOver")
	end

	var_11_0._sequences.WZButtonOver = var_11_136

	local var_11_137
	local var_11_138 = {
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZButtonUp", var_11_138)

	local var_11_139 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("WZButtonUp", var_11_139)

	local var_11_140 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_22:RegisterAnimationSequence("WZButtonUp", var_11_140)

	local function var_11_141()
		var_11_12:AnimateSequence("WZButtonUp")
		var_11_16:AnimateSequence("WZButtonUp")
		var_11_22:AnimateSequence("WZButtonUp")
	end

	var_11_0._sequences.WZButtonUp = var_11_141

	local var_11_142
	local var_11_143 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipButtonOverBlueprint", var_11_143)

	local var_11_144 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("WZWipButtonOverBlueprint", var_11_144)

	local var_11_145 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("WZWipButtonOverBlueprint", var_11_145)

	local function var_11_146()
		var_11_12:AnimateSequence("WZWipButtonOverBlueprint")
		var_11_16:AnimateSequence("WZWipButtonOverBlueprint")
		var_11_26:AnimateSequence("WZWipButtonOverBlueprint")
	end

	var_11_0._sequences.WZWipButtonOverBlueprint = var_11_146

	local var_11_147
	local var_11_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipButtonOverBlueprintSnap", var_11_148)

	local var_11_149 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("WZWipButtonOverBlueprintSnap", var_11_149)

	local var_11_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("WZWipButtonOverBlueprintSnap", var_11_150)

	local function var_11_151()
		var_11_12:AnimateSequence("WZWipButtonOverBlueprintSnap")
		var_11_16:AnimateSequence("WZWipButtonOverBlueprintSnap")
		var_11_26:AnimateSequence("WZWipButtonOverBlueprintSnap")
	end

	var_11_0._sequences.WZWipButtonOverBlueprintSnap = var_11_151

	local var_11_152
	local var_11_153 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZButtonOverSnap", var_11_153)

	local var_11_154 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("WZButtonOverSnap", var_11_154)

	local var_11_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_22:RegisterAnimationSequence("WZButtonOverSnap", var_11_155)

	local function var_11_156()
		var_11_12:AnimateSequence("WZButtonOverSnap")
		var_11_16:AnimateSequence("WZButtonOverSnap")
		var_11_22:AnimateSequence("WZButtonOverSnap")
	end

	var_11_0._sequences.WZButtonOverSnap = var_11_156

	local var_11_157
	local var_11_158 = {
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipButtonUpBlueprint", var_11_158)

	local var_11_159 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_11_16:RegisterAnimationSequence("WZWipButtonUpBlueprint", var_11_159)

	local var_11_160 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("WZWipButtonUpBlueprint", var_11_160)

	local function var_11_161()
		var_11_12:AnimateSequence("WZWipButtonUpBlueprint")
		var_11_16:AnimateSequence("WZWipButtonUpBlueprint")
		var_11_26:AnimateSequence("WZWipButtonUpBlueprint")
	end

	var_11_0._sequences.WZWipButtonUpBlueprint = var_11_161

	local var_11_162
	local var_11_163 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZButtonUpSnap", var_11_163)

	local var_11_164 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_16:RegisterAnimationSequence("WZButtonUpSnap", var_11_164)

	local var_11_165 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_22:RegisterAnimationSequence("WZButtonUpSnap", var_11_165)

	local function var_11_166()
		var_11_12:AnimateSequence("WZButtonUpSnap")
		var_11_16:AnimateSequence("WZButtonUpSnap")
		var_11_22:AnimateSequence("WZButtonUpSnap")
	end

	var_11_0._sequences.WZButtonUpSnap = var_11_166

	local function var_11_167()
		return
	end

	var_11_0._sequences.MaskState1 = var_11_167

	local var_11_168
	local var_11_169 = {
		{
			value = -0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1
		}
	}

	var_11_34:RegisterAnimationSequence("MW", var_11_169)

	local function var_11_170()
		var_11_34:AnimateSequence("MW")
	end

	var_11_0._sequences.MW = var_11_170

	local var_11_171
	local var_11_172 = {
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		}
	}

	var_11_34:RegisterAnimationSequence("CW", var_11_172)

	local function var_11_173()
		var_11_34:AnimateSequence("CW")
	end

	var_11_0._sequences.CW = var_11_173

	local var_11_174
	local var_11_175 = {
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_11_34:RegisterAnimationSequence("VG", var_11_175)

	local function var_11_176()
		var_11_34:AnimateSequence("VG")
	end

	var_11_0._sequences.VG = var_11_176

	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("WeaponLockerButton", WeaponLockerButton)
LockTable(_M)
