module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0.Selected, arg_1_1 and "On" or "Off")

	arg_1_0.isSelected = arg_1_1

	arg_1_0.NewItemNotification:UpdateAlpha(arg_1_0.isNew and not arg_1_1 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0.Favorited, arg_2_1 and "On" or "Off")

	arg_2_0.isFavorite = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if not arg_3_0._menu then
		arg_3_0._menu = arg_3_1
	end

	arg_3_0.isNew = Loot.HDJCADADF(arg_3_0._controllerIndex, arg_3_2.lootID)
	arg_3_0.emblemRef = arg_3_2.ref

	arg_3_0.NewItemNotification:UpdateAlpha(arg_3_0.isNew and 1 or 0)

	if arg_3_2.image and arg_3_2.image ~= "" then
		arg_3_0.Image:setImage(RegisterMaterial(arg_3_2.image))
	else
		arg_3_0.Image:SetAlpha(0)
	end

	arg_3_0.QualityMarker:SetRarityColor(arg_3_2.rarity)
	arg_3_0:SetSelected(arg_3_3)
	arg_3_0:SetFavorite(arg_3_4)
	arg_3_0:SetButtonDisabled(not arg_3_2.isUnlocked)
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
	arg_4_0.isSelected = false
	arg_4_0.isFavorite = false
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0.isNew = false
	arg_4_0.emblemRef = ""

	arg_4_0:registerEventHandler("button_over", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewEmblem()
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
	end)
	arg_4_0:registerEventHandler("button_over_disable", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewEmblem()
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabled")
	end)
	arg_4_0:registerEventHandler("button_up", function()
		if arg_4_0.isNew then
			local var_7_0 = LOOT.GetItemID(LOOT.itemTypes.EMBLEM, arg_4_0.emblemRef)

			arg_4_0.NewItemNotification:ClearBreadcrumbByID(arg_4_0._controllerIndex, var_7_0)

			arg_4_0.isNew = false
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
	end)
	arg_4_0:registerEventHandler("button_disable", function()
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUpDisabled")
	end)
	arg_4_0:registerEventHandler("button_action", function()
		if arg_4_0._menu then
			arg_4_0._menu:EquipEmblem()
		end
	end)
end

function EmblemButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 150 * _1080p)

	var_10_0.id = "EmblemButton"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0

	var_10_0:setUseStencil(true)

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

	var_10_8.id = "Image"

	var_10_8:SetAlpha(0.5, 0)
	var_10_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 22, _1080p * -22, _1080p * 22, _1080p * -22)
	var_10_0:addElement(var_10_8)

	var_10_0.Image = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "Lock"

	var_10_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_10_10:SetAlpha(0, 0)
	var_10_10:setImage(RegisterMaterial("ui_font_lock"), 0)
	var_10_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_10_0:addElement(var_10_10)

	var_10_0.Lock = var_10_10

	local var_10_11
	local var_10_12 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_10_1
	})

	var_10_12.id = "Selected"

	var_10_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_10_0:addElement(var_10_12)

	var_10_0.Selected = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("QualityMarker", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "QualityMarker"

	var_10_14:SetPixelGridEnabled(true)
	var_10_14:SetPixelGridContrast(0.5, 0)
	var_10_14:SetPixelGridBlockWidth(2, 0)
	var_10_14:SetPixelGridBlockHeight(2, 0)
	var_10_14:SetPixelGridGutterWidth(1, 0)
	var_10_14:SetPixelGridGutterHeight(1, 0)
	var_10_14:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_10_0:addElement(var_10_14)

	var_10_0.QualityMarker = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("FavoritedNotification", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "Favorited"

	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 48, 0, _1080p * 48)
	var_10_0:addElement(var_10_16)

	var_10_0.Favorited = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "NewItemNotification"

	var_10_18:SetAlpha(0, 0)
	var_10_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_10_0:addElement(var_10_18)

	var_10_0.NewItemNotification = var_10_18

	local function var_10_19()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_19

	local var_10_20
	local var_10_21 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_21)

	local function var_10_22()
		var_10_8:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_22

	local var_10_23
	local var_10_24 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_24)

	local function var_10_25()
		var_10_8:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_25

	local var_10_26
	local var_10_27 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOverDisabled", var_10_27)

	local function var_10_28()
		var_10_8:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_28

	local var_10_29
	local var_10_30 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUpDisabled", var_10_30)

	local function var_10_31()
		var_10_8:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_31

	local var_10_32
	local var_10_33 = {
		{
			value = 8686977,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_8:RegisterAnimationSequence("Locked", var_10_33)

	local var_10_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("Locked", var_10_34)

	local function var_10_35()
		var_10_8:AnimateSequence("Locked")
		var_10_10:AnimateSequence("Locked")
	end

	var_10_0._sequences.Locked = var_10_35

	local var_10_36
	local var_10_37 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("Unlocked", var_10_37)

	local var_10_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("Unlocked", var_10_38)

	local function var_10_39()
		var_10_8:AnimateSequence("Unlocked")
		var_10_10:AnimateSequence("Unlocked")
	end

	var_10_0._sequences.Unlocked = var_10_39

	var_10_10:addEventHandler("disable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Locked")
	end)
	var_10_10:addEventHandler("enable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Unlocked")
	end)
	var_0_3(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("EmblemButton", EmblemButton)
LockTable(_M)
