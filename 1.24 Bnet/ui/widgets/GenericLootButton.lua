module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0.Selected, arg_1_1 and "On" or "Off")

	arg_1_0.isSelected = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0.Favorited, arg_2_1 and "On" or "Off")

	arg_2_0.isFavorite = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if not arg_3_0._menu then
		arg_3_0._menu = arg_3_1
	end

	if arg_3_2.image and arg_3_2.image ~= "" then
		arg_3_0.Image:setImage(RegisterMaterial(arg_3_2.image))
	else
		arg_3_0.Image:SetAlpha(0)
	end

	arg_3_0.QualityMarker:SetRarityColor(arg_3_2.rarity)
	arg_3_0:SetSelected(arg_3_3)
	arg_3_0:SetFavorite(arg_3_4)

	local var_3_0 = arg_3_2.isUnlocked or arg_3_2.unlockInfo and arg_3_2.unlockInfo.unlocked

	arg_3_0:SetButtonDisabled(not var_3_0)

	arg_3_0._lootID = arg_3_2.lootID or LOOT.GetItemID(arg_3_2.lootType, arg_3_2.ref, {
		weaponRef = arg_3_2.weaponRef
	})
	arg_3_2.isNew = arg_3_0.NewItemSmallIcon:UpdateBreadcrumbByID(arg_3_0._controllerIndex, arg_3_0._lootID)
	arg_3_0._itemData = arg_3_2
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Image)
	assert(arg_4_0.Selected)
	assert(arg_4_0.Favorited)
	assert(arg_4_0.QualityMarker)
	assert(arg_4_0.Lock)

	arg_4_0.RefreshButton = var_0_2
	arg_4_0.SetSelected = var_0_0
	arg_4_0.SetFavorite = var_0_1
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0.isSelected = false
	arg_4_0.isFavorite = false

	arg_4_0:registerEventHandler("button_over", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewItem()

			if arg_4_0._menu.UpdateBreadcrumb then
				arg_4_0._menu:UpdateBreadcrumb(arg_4_0._lootID)
			end
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		arg_4_0:dispatchEventToParent({
			name = "loot_button_over",
			itemData = arg_4_0._itemData
		})
	end)
	arg_4_0:registerEventHandler("button_over_disable", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewItem()
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabled")
		arg_4_0:dispatchEventToParent({
			name = "loot_button_over",
			itemData = arg_4_0._itemData
		})
	end)
	arg_4_0:registerEventHandler("button_action", function()
		if arg_4_0._lootID then
			arg_4_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_4_1, arg_4_0._lootID)

			arg_4_0._itemData.isNew = false
		end

		if arg_4_0._menu then
			arg_4_0._menu:EquipItem()
		end

		arg_4_0:dispatchEventToParent({
			name = "loot_button_action",
			itemData = arg_4_0._itemData
		})
	end)
	arg_4_0:registerEventHandler("button_up", function()
		if arg_4_0._lootID then
			arg_4_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_4_1, arg_4_0._lootID)

			arg_4_0._itemData.isNew = false
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")

		if arg_4_0:GetCurrentMenu() then
			arg_4_0:dispatchEventToCurrentMenu({
				name = "loot_button_up",
				itemData = arg_4_0._itemData
			})
		end
	end)
end

function GenericLootButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 126 * _1080p, 0, 126 * _1080p)

	var_9_0.id = "GenericLootButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "TextBacker"

	var_9_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_9_4:SetAlpha(0.6, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.TextBacker = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "LoadoutItemButtonBackground"

	var_9_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_6)

	var_9_0.LoadoutItemButtonBackground = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "GradientBacker"

	var_9_8:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_9_8:SetAlpha(0.1, 0)
	var_9_8:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_9_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -58, _1080p * 58, _1080p * -58, _1080p * 58)
	var_9_0:addElement(var_9_8)

	var_9_0.GradientBacker = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Image"

	var_9_10:SetAlpha(0.5, 0)
	var_9_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 52, _1080p * -49, _1080p * 49)
	var_9_0:addElement(var_9_10)

	var_9_0.Image = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "Selected"

	var_9_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_9_0:addElement(var_9_12)

	var_9_0.Selected = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIImage.new()

	var_9_14.id = "Lock"

	var_9_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_9_14:SetAlpha(0, 0)
	var_9_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_9_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_9_0:addElement(var_9_14)

	var_9_0.Lock = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("QualityMarker", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "QualityMarker"

	var_9_16:SetPixelGridEnabled(true)
	var_9_16:SetPixelGridContrast(0.5, 0)
	var_9_16:SetPixelGridBlockWidth(2, 0)
	var_9_16:SetPixelGridBlockHeight(2, 0)
	var_9_16:SetPixelGridGutterWidth(1, 0)
	var_9_16:SetPixelGridGutterHeight(1, 0)
	var_9_16:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_9_0:addElement(var_9_16)

	var_9_0.QualityMarker = var_9_16

	local var_9_17
	local var_9_18 = MenuBuilder.BuildRegisteredType("FavoritedNotification", {
		controllerIndex = var_9_1
	})

	var_9_18.id = "Favorited"

	var_9_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 48, 0, _1080p * 48)
	var_9_0:addElement(var_9_18)

	var_9_0.Favorited = var_9_18

	local var_9_19
	local var_9_20 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_9_1
	})

	var_9_20.id = "NewItemSmallIcon"

	var_9_20:SetAlpha(0, 0)
	var_9_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -15, _1080p * -7, _1080p * 11, _1080p * 19)
	var_9_0:addElement(var_9_20)

	var_9_0.NewItemSmallIcon = var_9_20

	local function var_9_21()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_21

	local var_9_22
	local var_9_23 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOver", var_9_23)

	local function var_9_24()
		var_9_10:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_24

	local var_9_25
	local var_9_26 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUp", var_9_26)

	local function var_9_27()
		var_9_10:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_27

	local var_9_28
	local var_9_29 = {
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

	var_9_10:RegisterAnimationSequence("Disabled", var_9_29)

	local var_9_30 = {
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

	var_9_14:RegisterAnimationSequence("Disabled", var_9_30)

	local function var_9_31()
		var_9_10:AnimateSequence("Disabled")
		var_9_14:AnimateSequence("Disabled")
	end

	var_9_0._sequences.Disabled = var_9_31

	local var_9_32
	local var_9_33 = {
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

	var_9_10:RegisterAnimationSequence("Enabled", var_9_33)

	local var_9_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("Enabled", var_9_34)

	local function var_9_35()
		var_9_10:AnimateSequence("Enabled")
		var_9_14:AnimateSequence("Enabled")
	end

	var_9_0._sequences.Enabled = var_9_35

	local var_9_36
	local var_9_37 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOverDisabled", var_9_37)

	local function var_9_38()
		var_9_10:AnimateSequence("ButtonOverDisabled")
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_38

	local var_9_39
	local var_9_40 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUpDisabled", var_9_40)

	local function var_9_41()
		var_9_10:AnimateSequence("ButtonUpDisabled")
	end

	var_9_0._sequences.ButtonUpDisabled = var_9_41

	var_9_0:addEventHandler("button_over", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonOver")
	end)
	var_9_0:addEventHandler("button_up", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonUp")
	end)
	var_9_0:addEventHandler("disable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "Disabled")
	end)
	var_9_0:addEventHandler("enable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "Enabled")
	end)
	var_0_3(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("GenericLootButton", GenericLootButton)
LockTable(_M)
