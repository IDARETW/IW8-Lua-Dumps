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
	arg_3_0.QualityMarker:SetRarityColor(arg_3_1)

	arg_3_0.rarity = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
	if not arg_4_0._menu then
		arg_4_0._menu = arg_4_1
	end

	arg_4_0.lootType = arg_4_3
	arg_4_0.lootRef = arg_4_2.ref
	arg_4_0.isNew = Loot.HDJCADADF(arg_4_0._controllerIndex, arg_4_2.lootID)

	arg_4_0.NewItemNotification:UpdateAlpha(arg_4_0.isNew and 1 or 0)

	if arg_4_2.image then
		arg_4_0.Image:setImage(RegisterMaterial(arg_4_2.image))
	end

	arg_4_0:SetSelected(arg_4_4)
	arg_4_0:SetFavorite(arg_4_5)
	arg_4_0:SetQuality(arg_4_2.rarity)
	arg_4_0:SetButtonDisabled(not arg_4_2.isUnlocked)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Image)
	assert(arg_5_0.Selected)
	assert(arg_5_0.Favorited)
	assert(arg_5_0.Lock)

	arg_5_0.RefreshButton = var_0_3
	arg_5_0.SetSelected = var_0_0
	arg_5_0.SetFavorite = var_0_1
	arg_5_0.SetQuality = var_0_2
	arg_5_0.isSelected = false
	arg_5_0.isFavorite = false
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0.isNew = false
	arg_5_0.lootRef = ""
	arg_5_0.lootType = ""

	arg_5_0:registerEventHandler("button_over", function()
		ACTIONS.AnimateSequence(arg_5_0, "ButtonOver")

		if arg_5_0._menu then
			arg_5_0._menu:ButtonOver()
		end
	end)
	arg_5_0:registerEventHandler("button_action", function()
		if arg_5_0._menu then
			arg_5_0._menu:ButtonAction(arg_5_1, arg_5_0)
		end
	end)
	arg_5_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if arg_8_0.isNew then
			local var_8_0 = LOOT.GetItemID(arg_8_0.lootType, arg_8_0.lootRef)

			arg_8_0.NewItemNotification:ClearBreadcrumbByID(arg_8_0._controllerIndex, var_8_0)
			arg_5_0._menu:RemoveRefFromNewList(arg_8_0.lootRef)
		end
	end)
end

function RadialCustomizationButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 150 * _1080p)

	var_9_0.id = "RadialCustomizationButton"
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
	var_9_8:SetAlpha(0.15, 0)
	var_9_8:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_9_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -68, _1080p * 68, _1080p * -68, _1080p * 68)
	var_9_0:addElement(var_9_8)

	var_9_0.GradientBacker = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Image"

	var_9_10:setImage(RegisterMaterial("icon_gesture_placeholder"), 0)
	var_9_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -52, _1080p * 52, _1080p * -52, _1080p * 52)
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
	var_9_14:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_9_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -5, _1080p * -25, _1080p * 5, _1080p * 25)
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

	var_9_20.id = "NewItemNotification"

	var_9_20:SetAlpha(0, 0)
	var_9_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_9_0:addElement(var_9_20)

	var_9_0.NewItemNotification = var_9_20

	local var_9_21
	local var_9_22 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("DefaultSequence", var_9_22)

	local function var_9_23()
		var_9_10:AnimateSequence("DefaultSequence")
	end

	var_9_0._sequences.DefaultSequence = var_9_23

	local var_9_24
	local var_9_25 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUp", var_9_25)

	local function var_9_26()
		var_9_10:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_26

	local var_9_27
	local var_9_28 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOver", var_9_28)

	local function var_9_29()
		var_9_10:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_29

	local var_9_30
	local var_9_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_9_10:RegisterAnimationSequence("Disable", var_9_31)

	local function var_9_32()
		var_9_10:AnimateSequence("Disable")
	end

	var_9_0._sequences.Disable = var_9_32

	local var_9_33
	local var_9_34 = {
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

	var_9_10:RegisterAnimationSequence("Enable", var_9_34)

	local function var_9_35()
		var_9_10:AnimateSequence("Enable")
	end

	var_9_0._sequences.Enable = var_9_35

	local var_9_36
	local var_9_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Locked", var_9_37)

	local var_9_38 = {
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

	var_9_14:RegisterAnimationSequence("Locked", var_9_38)

	local function var_9_39()
		var_9_10:AnimateSequence("Locked")
		var_9_14:AnimateSequence("Locked")
	end

	var_9_0._sequences.Locked = var_9_39

	local var_9_40
	local var_9_41 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_9_10:RegisterAnimationSequence("Unlocked", var_9_41)

	local var_9_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("Unlocked", var_9_42)

	local function var_9_43()
		var_9_10:AnimateSequence("Unlocked")
		var_9_14:AnimateSequence("Unlocked")
	end

	var_9_0._sequences.Unlocked = var_9_43

	var_9_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonUp")
	end)
	var_9_0:addEventHandler("disable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "Disable")
	end)
	var_9_0:addEventHandler("enable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "Enable")
	end)
	var_9_0:addEventHandler("button_over_disable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonOver")
	end)
	var_9_0:addEventHandler("button_disable", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonUp")
	end)
	var_0_4(var_9_0, var_9_1, arg_9_1)
	ACTIONS.AnimateSequence(var_9_0, "DefaultSequence")

	return var_9_0
end

MenuBuilder.registerType("RadialCustomizationButton", RadialCustomizationButton)
LockTable(_M)
