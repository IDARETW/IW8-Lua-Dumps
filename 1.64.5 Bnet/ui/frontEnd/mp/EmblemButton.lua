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

	arg_3_0.isNew = Loot.HDJCADADF(arg_3_0._controllerIndex, arg_3_2.lootID) and not arg_3_2.isRandom
	arg_3_0.emblemRef = arg_3_2.ref

	arg_3_0.NewItemNotification:UpdateAlpha(arg_3_0.isNew and 1 or 0)

	if arg_3_2.isClanEmblem then
		arg_3_0.ClanEmblem:SetAlpha(1)
		arg_3_0.Image:SetAlpha(0)
		arg_3_0.ClanEmblem:SetEmblem(arg_3_2.clanEmblemData, false)

		arg_3_0.isClanEmblem = arg_3_2.isClanEmblem
	else
		arg_3_0.Image:SetAlpha(1)

		if arg_3_2.image and arg_3_2.image ~= "" then
			arg_3_0.Image:setImage(RegisterMaterial(arg_3_2.image))
		else
			arg_3_0.Image:SetAlpha(0)
		end
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

		if arg_4_0.isClanEmblem then
			ACTIONS.AnimateSequence(arg_4_0, "ButtonOverClan")
		else
			ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		end
	end)
	arg_4_0:registerEventHandler("button_over_disable", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewEmblem()
		end

		if arg_4_0.isClanEmblem then
			ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabledClan")
		else
			ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabled")
		end
	end)
	arg_4_0:registerEventHandler("button_up", function()
		if arg_4_0.isNew then
			local var_7_0 = LOOT.GetItemID(LOOT.itemTypes.EMBLEM, arg_4_0.emblemRef)

			arg_4_0.NewItemNotification:ClearBreadcrumbByID(arg_4_0._controllerIndex, var_7_0)

			arg_4_0.isNew = false
		end

		if arg_4_0.isClanEmblem then
			ACTIONS.AnimateSequence(arg_4_0, "ButtonUpClan")
		else
			ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
		end
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
	local var_10_10 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "ClanEmblem"

	var_10_10:SetAlpha(0, 0)
	var_10_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 22, _1080p * -22, _1080p * 22, _1080p * -22)
	var_10_0:addElement(var_10_10)

	var_10_0.ClanEmblem = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "Lock"

	var_10_12:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_10_12:SetAlpha(0, 0)
	var_10_12:setImage(RegisterMaterial("ui_font_lock"), 0)
	var_10_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_10_0:addElement(var_10_12)

	var_10_0.Lock = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "Selected"

	var_10_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_10_0:addElement(var_10_14)

	var_10_0.Selected = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("QualityMarker", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "QualityMarker"

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

	var_10_20.id = "NewItemNotification"

	var_10_20:SetAlpha(0, 0)
	var_10_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_10_0:addElement(var_10_20)

	var_10_0.NewItemNotification = var_10_20

	local var_10_21
	local var_10_22 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_10_1
	})

	var_10_22.id = "ButtonHighlightBarTop"

	var_10_22:SetAlpha(0, 0)
	var_10_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_10_0:addElement(var_10_22)

	var_10_0.ButtonHighlightBarTop = var_10_22

	local var_10_23
	local var_10_24 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_10_1
	})

	var_10_24.id = "ButtonHighlightBarBottom"

	var_10_24:SetAlpha(0, 0)
	var_10_24:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_10_0:addElement(var_10_24)

	var_10_0.ButtonHighlightBarBottom = var_10_24

	local function var_10_25()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_25

	local var_10_26
	local var_10_27 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_27)

	local var_10_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("ButtonOver", var_10_28)

	local var_10_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("ButtonOver", var_10_29)

	local function var_10_30()
		var_10_8:AnimateSequence("ButtonOver")
		var_10_22:AnimateSequence("ButtonOver")
		var_10_24:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_30

	local var_10_31
	local var_10_32 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_32)

	local var_10_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("ButtonUp", var_10_33)

	local var_10_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("ButtonUp", var_10_34)

	local function var_10_35()
		var_10_8:AnimateSequence("ButtonUp")
		var_10_22:AnimateSequence("ButtonUp")
		var_10_24:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_35

	local var_10_36
	local var_10_37 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOverDisabled", var_10_37)

	local function var_10_38()
		var_10_8:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_38

	local var_10_39
	local var_10_40 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUpDisabled", var_10_40)

	local function var_10_41()
		var_10_8:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_41

	local var_10_42
	local var_10_43 = {
		{
			value = 8686977,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_8:RegisterAnimationSequence("Locked", var_10_43)

	local var_10_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("Locked", var_10_44)

	local function var_10_45()
		var_10_8:AnimateSequence("Locked")
		var_10_12:AnimateSequence("Locked")
	end

	var_10_0._sequences.Locked = var_10_45

	local var_10_46
	local var_10_47 = {
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

	var_10_8:RegisterAnimationSequence("Unlocked", var_10_47)

	local var_10_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("Unlocked", var_10_48)

	local function var_10_49()
		var_10_8:AnimateSequence("Unlocked")
		var_10_12:AnimateSequence("Unlocked")
	end

	var_10_0._sequences.Unlocked = var_10_49

	local var_10_50
	local var_10_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOverClan", var_10_51)

	local var_10_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("ButtonOverClan", var_10_52)

	local var_10_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("ButtonOverClan", var_10_53)

	local function var_10_54()
		var_10_10:AnimateSequence("ButtonOverClan")
		var_10_22:AnimateSequence("ButtonOverClan")
		var_10_24:AnimateSequence("ButtonOverClan")
	end

	var_10_0._sequences.ButtonOverClan = var_10_54

	local var_10_55
	local var_10_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOverDisabledClan", var_10_56)

	local function var_10_57()
		var_10_10:AnimateSequence("ButtonOverDisabledClan")
	end

	var_10_0._sequences.ButtonOverDisabledClan = var_10_57

	local var_10_58
	local var_10_59 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUpClan", var_10_59)

	local var_10_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("ButtonUpClan", var_10_60)

	local var_10_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("ButtonUpClan", var_10_61)

	local function var_10_62()
		var_10_10:AnimateSequence("ButtonUpClan")
		var_10_22:AnimateSequence("ButtonUpClan")
		var_10_24:AnimateSequence("ButtonUpClan")
	end

	var_10_0._sequences.ButtonUpClan = var_10_62

	local var_10_63
	local var_10_64 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUpDisabledClan", var_10_64)

	local function var_10_65()
		var_10_10:AnimateSequence("ButtonUpDisabledClan")
	end

	var_10_0._sequences.ButtonUpDisabledClan = var_10_65

	var_10_12:addEventHandler("disable", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Locked")
	end)
	var_10_12:addEventHandler("enable", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Unlocked")
	end)
	var_0_3(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("EmblemButton", EmblemButton)
LockTable(_M)
