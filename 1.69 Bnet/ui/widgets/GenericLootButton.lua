module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0.Selected, arg_1_1 and "On" or "Off")

	arg_1_0.isSelected = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0.Favorited, arg_2_1 and "On" or "Off")

	arg_2_0.isFavorite = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.SpecialAttribute:SetAlpha(VEHICLE.GetAttributeType(arg_3_1) and 1 or 0)
	arg_3_0.SpecialAttributeBacker:SetAlpha(VEHICLE.GetAttributeType(arg_3_1) and 0.7 or 0)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	if not arg_4_0._menu then
		arg_4_0._menu = arg_4_1
	end

	if arg_4_2.image and arg_4_2.image ~= "" then
		arg_4_0.Image:setImage(RegisterMaterial(arg_4_2.image))
	else
		arg_4_0.Image:SetAlpha(0)
	end

	arg_4_0.QualityMarker:SetRarityColor(arg_4_2.rarity)
	arg_4_0:SetSelected(arg_4_3)
	arg_4_0:SetFavorite(arg_4_4)

	if arg_4_2.lootType == LOOT.itemTypes.VEHICLE_CAMO then
		arg_4_0:SetSpecialAttribute(arg_4_2.ref)
	end

	local var_4_0 = arg_4_2.isUnlocked or arg_4_2.unlockInfo and arg_4_2.unlockInfo.unlocked

	arg_4_0:SetButtonDisabled(not var_4_0)

	arg_4_0._lootID = arg_4_2.lootID or LOOT.GetItemID(arg_4_2.lootType, arg_4_2.ref, {
		weaponRef = arg_4_2.weaponRef
	})
	arg_4_2.isNew = arg_4_0.NewItemSmallIcon:UpdateBreadcrumbByID(arg_4_0._controllerIndex, arg_4_0._lootID)
	arg_4_0._itemData = arg_4_2
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Image)
	assert(arg_5_0.Selected)
	assert(arg_5_0.Favorited)
	assert(arg_5_0.QualityMarker)
	assert(arg_5_0.Lock)

	arg_5_0.RefreshButton = var_0_3
	arg_5_0.SetSelected = var_0_0
	arg_5_0.SetFavorite = var_0_1
	arg_5_0.SetSpecialAttribute = var_0_2
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0.isSelected = false
	arg_5_0.isFavorite = false

	arg_5_0:registerEventHandler("button_over", function()
		if arg_5_0._menu then
			arg_5_0._menu:PreviewItem()

			if arg_5_0._menu.UpdateBreadcrumb then
				arg_5_0._menu:UpdateBreadcrumb(arg_5_0._lootID)
			end
		end

		ACTIONS.AnimateSequence(arg_5_0, "ButtonOver")
		arg_5_0:dispatchEventToParent({
			name = "loot_button_over",
			itemData = arg_5_0._itemData
		})
	end)
	arg_5_0:registerEventHandler("button_over_disable", function()
		if arg_5_0._menu then
			arg_5_0._menu:PreviewItem()
		end

		ACTIONS.AnimateSequence(arg_5_0, "ButtonOverDisabled")
		arg_5_0:dispatchEventToParent({
			name = "loot_button_over",
			itemData = arg_5_0._itemData
		})
	end)
	arg_5_0:registerEventHandler("button_action", function()
		if arg_5_0._lootID then
			arg_5_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_5_1, arg_5_0._lootID)

			arg_5_0._itemData.isNew = false
		end

		if arg_5_0._menu then
			arg_5_0._menu:EquipItem()
		end

		arg_5_0:dispatchEventToParent({
			name = "loot_button_action",
			itemData = arg_5_0._itemData
		})
	end)
	arg_5_0:registerEventHandler("button_up", function()
		if arg_5_0._lootID then
			arg_5_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_5_1, arg_5_0._lootID)

			arg_5_0._itemData.isNew = false
		end

		ACTIONS.AnimateSequence(arg_5_0, "ButtonUp")

		if arg_5_0:GetCurrentMenu() then
			arg_5_0:dispatchEventToCurrentMenu({
				name = "loot_button_up",
				itemData = arg_5_0._itemData
			})
		end
	end)
end

function GenericLootButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 126 * _1080p, 0, 126 * _1080p)

	var_10_0.id = "GenericLootButton"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "TextBacker"

	var_10_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_10_4:SetAlpha(0.6, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.TextBacker = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "LoadoutItemButtonBackground"

	var_10_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.LoadoutItemButtonBackground = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "GradientBacker"

	var_10_8:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_10_8:SetAlpha(0.1, 0)
	var_10_8:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -58, _1080p * 58, _1080p * -58, _1080p * 58)
	var_10_0:addElement(var_10_8)

	var_10_0.GradientBacker = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "Image"

	var_10_10:SetAlpha(0.5, 0)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 52, _1080p * -49, _1080p * 49)
	var_10_0:addElement(var_10_10)

	var_10_0.Image = var_10_10

	local var_10_11
	local var_10_12 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_10_1
	})

	var_10_12.id = "Selected"

	var_10_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_10_0:addElement(var_10_12)

	var_10_0.Selected = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIImage.new()

	var_10_14.id = "Lock"

	var_10_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_10_14:SetAlpha(0, 0)
	var_10_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_10_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_10_0:addElement(var_10_14)

	var_10_0.Lock = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("QualityMarker", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "QualityMarker"

	var_10_16:SetPixelGridEnabled(true)
	var_10_16:SetPixelGridContrast(0.5, 0)
	var_10_16:SetPixelGridBlockWidth(2, 0)
	var_10_16:SetPixelGridBlockHeight(2, 0)
	var_10_16:SetPixelGridGutterWidth(1, 0)
	var_10_16:SetPixelGridGutterHeight(1, 0)
	var_10_16:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_10_0:addElement(var_10_16)

	var_10_0.QualityMarker = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("FavoritedNotification", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "Favorited"

	var_10_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 48, 0, _1080p * 48)
	var_10_0:addElement(var_10_18)

	var_10_0.Favorited = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "NewItemSmallIcon"

	var_10_20:SetAlpha(0, 0)
	var_10_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -15, _1080p * -7, _1080p * 11, _1080p * 19)
	var_10_0:addElement(var_10_20)

	var_10_0.NewItemSmallIcon = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIImage.new()

	var_10_22.id = "SpecialAttributeBacker"

	var_10_22:SetRGBFromInt(0, 0)
	var_10_22:SetAlpha(0, 0)
	var_10_22:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 52, _1080p * 1, _1080p * 49)
	var_10_0:addElement(var_10_22)

	var_10_0.SpecialAttributeBacker = var_10_22

	local var_10_23
	local var_10_24 = LUI.UIImage.new()

	var_10_24.id = "SpecialAttribute"

	var_10_24:SetAlpha(0, 0)
	var_10_24:setImage(RegisterMaterial("icon_attribute_vehicle"), 0)
	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 35, _1080p * 14, _1080p * 46)
	var_10_0:addElement(var_10_24)

	var_10_0.SpecialAttribute = var_10_24

	local function var_10_25()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_25

	local var_10_26
	local var_10_27 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_27)

	local function var_10_28()
		var_10_10:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_28

	local var_10_29
	local var_10_30 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_30)

	local function var_10_31()
		var_10_10:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_31

	local var_10_32
	local var_10_33 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 10526880,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_10:RegisterAnimationSequence("Disabled", var_10_33)

	local var_10_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_lock")
		}
	}

	var_10_14:RegisterAnimationSequence("Disabled", var_10_34)

	local function var_10_35()
		var_10_10:AnimateSequence("Disabled")
		var_10_14:AnimateSequence("Disabled")
	end

	var_10_0._sequences.Disabled = var_10_35

	local var_10_36
	local var_10_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_10:RegisterAnimationSequence("Enabled", var_10_37)

	local var_10_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("Enabled", var_10_38)

	local function var_10_39()
		var_10_10:AnimateSequence("Enabled")
		var_10_14:AnimateSequence("Enabled")
	end

	var_10_0._sequences.Enabled = var_10_39

	local var_10_40
	local var_10_41 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOverDisabled", var_10_41)

	local function var_10_42()
		var_10_10:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_42

	local var_10_43
	local var_10_44 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUpDisabled", var_10_44)

	local function var_10_45()
		var_10_10:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_45

	var_10_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOver")
	end)
	var_10_0:addEventHandler("button_up", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUp")
	end)
	var_10_0:addEventHandler("disable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Disabled")
	end)
	var_10_0:addEventHandler("enable", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Enabled")
	end)
	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("GenericLootButton", GenericLootButton)
LockTable(_M)
