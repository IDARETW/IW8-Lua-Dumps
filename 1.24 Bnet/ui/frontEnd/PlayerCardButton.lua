module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0.Selected, arg_1_1 and "On" or "Off")

	arg_1_0.isSelected = arg_1_1

	arg_1_0.NewPlayerCardNotification:UpdateAlpha(arg_1_0.isNew and not arg_1_1 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0.Favorited, arg_2_1 and "On" or "Off")

	arg_2_0.isFavorite = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if not arg_3_0._menu then
		arg_3_0._menu = arg_3_1
	end

	arg_3_0.Text:setText(Engine.CBBHFCGDIC(arg_3_2.name))

	arg_3_0.isNew = Loot.HDJCADADF(arg_3_0._controllerIndex, arg_3_2.lootID)
	arg_3_0.cardRef = arg_3_2.ref

	arg_3_0.NewPlayerCardNotification:UpdateAlpha(arg_3_0.isNew and 1 or 0)

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
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0.isSelected = false
	arg_4_0.isFavorite = false
	arg_4_0.isNew = false
	arg_4_0.cardRef = ""

	arg_4_0:registerEventHandler("button_over", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewPlayerCard()
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
	end)
	arg_4_0:registerEventHandler("button_over_disable", function()
		if arg_4_0._menu then
			arg_4_0._menu:PreviewPlayerCard()
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabled")
	end)
	arg_4_0:registerEventHandler("button_up", function()
		if arg_4_0.isNew then
			local var_7_0 = LOOT.GetItemID(LOOT.itemTypes.PLAYERCARD, arg_4_0.cardRef)

			arg_4_0.NewPlayerCardNotification:ClearBreadcrumbByID(arg_4_0._controllerIndex, var_7_0)

			arg_4_0.isNew = false
		end

		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
	end)
	arg_4_0:registerEventHandler("button_disable", function()
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUpDisabled")
	end)
	arg_4_0:registerEventHandler("button_action", function()
		if arg_4_0._menu then
			arg_4_0._menu:EquipPlayerCard()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function PlayerCardButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 140 * _1080p)

	var_10_0.id = "PlayerCardButton"
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
	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 90, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.TextBacker = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "Image"

	var_10_6:SetRGBFromInt(8421504, 0)
	var_10_6:SetAlpha(0.5, 0)
	var_10_6:setImage(RegisterMaterial("ui_playercard_001"), 0)
	var_10_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 90)
	var_10_0:addElement(var_10_6)

	var_10_0.Image = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "Darkener"

	var_10_8:SetRGBFromInt(0, 0)
	var_10_8:SetAlpha(0, 0)
	var_10_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_10_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 4, 0)
	var_10_0:addElement(var_10_8)

	var_10_0.Darkener = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "Gradient"

	var_10_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_10_10:SetAlpha(0, 0)
	var_10_10:SetPixelGridEnabled(true)
	var_10_10:SetPixelGridContrast(0.2, 0)
	var_10_10:SetPixelGridBlockWidth(2, 0)
	var_10_10:SetPixelGridBlockHeight(2, 0)
	var_10_10:SetPixelGridGutterWidth(1, 0)
	var_10_10:SetPixelGridGutterHeight(1, 0)
	var_10_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_10_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 60, 0)
	var_10_0:addElement(var_10_10)

	var_10_0.Gradient = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIStyledText.new()

	var_10_12.id = "Text"

	var_10_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_12:setText("", 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_12:SetStartupDelay(1000)
	var_10_12:SetLineHoldTime(500)
	var_10_12:SetAnimMoveTime(500)
	var_10_12:SetAnimMoveSpeed(50)
	var_10_12:SetEndDelay(1000)
	var_10_12:SetCrossfadeTime(500)
	var_10_12:SetFadeInTime(300)
	var_10_12:SetFadeOutTime(300)
	var_10_12:SetMaxVisibleLines(1)
	var_10_12:SetShadowRGBFromInt(0, 0)
	var_10_12:SetOutlineRGBFromInt(0, 0)
	var_10_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -59, _1080p * -34, _1080p * -14)
	var_10_0:addElement(var_10_12)

	var_10_0.Text = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIImage.new()

	var_10_14.id = "Lock"

	var_10_14:SetRGBFromInt(8686977, 0)
	var_10_14:SetAlpha(0, 0)
	var_10_14:setImage(RegisterMaterial("ui_font_lock"), 0)
	var_10_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -25, _1080p * -5, _1080p * -35, _1080p * -15)
	var_10_0:addElement(var_10_14)

	var_10_0.Lock = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "ButtonHighlightBarTop"

	var_10_16:SetAlpha(0, 0)
	var_10_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_10_0:addElement(var_10_16)

	var_10_0.ButtonHighlightBarTop = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "ButtonHighlightBarBottom"

	var_10_18:SetAlpha(0, 0)
	var_10_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_10_0:addElement(var_10_18)

	var_10_0.ButtonHighlightBarBottom = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "Selected"

	var_10_20:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -23, _1080p * -7, _1080p * -33, _1080p * -17)
	var_10_0:addElement(var_10_20)

	var_10_0.Selected = var_10_20

	local var_10_21
	local var_10_22 = MenuBuilder.BuildRegisteredType("QualityMarker", {
		controllerIndex = var_10_1
	})

	var_10_22.id = "QualityMarker"

	var_10_22:SetPixelGridEnabled(true)
	var_10_22:SetPixelGridContrast(0.5, 0)
	var_10_22:SetPixelGridBlockWidth(2, 0)
	var_10_22:SetPixelGridBlockHeight(2, 0)
	var_10_22:SetPixelGridGutterWidth(1, 0)
	var_10_22:SetPixelGridGutterHeight(1, 0)
	var_10_22:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, _1080p * 90, 0)
	var_10_0:addElement(var_10_22)

	var_10_0.QualityMarker = var_10_22

	local var_10_23
	local var_10_24 = MenuBuilder.BuildRegisteredType("FavoritedNotification", {
		controllerIndex = var_10_1
	})

	var_10_24.id = "Favorited"

	var_10_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 48, 0, _1080p * 48)
	var_10_0:addElement(var_10_24)

	var_10_0.Favorited = var_10_24

	local var_10_25
	local var_10_26 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_26.id = "NewPlayerCardNotification"

	var_10_26:SetAlpha(0, 0)
	var_10_26:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -19, _1080p * -11, _1080p * -29, _1080p * -21)
	var_10_0:addElement(var_10_26)

	var_10_0.NewPlayerCardNotification = var_10_26

	local function var_10_27()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_27

	local var_10_28 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonOver", var_10_28)

	local var_10_29 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_29)

	local var_10_30 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_30)

	local var_10_31 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonOver", var_10_31)

	local var_10_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonOver", var_10_32)

	local var_10_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonOver", var_10_33)

	local function var_10_34()
		var_10_6:AnimateSequence("ButtonOver")
		var_10_8:AnimateSequence("ButtonOver")
		var_10_10:AnimateSequence("ButtonOver")
		var_10_12:AnimateSequence("ButtonOver")
		var_10_16:AnimateSequence("ButtonOver")
		var_10_18:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_34

	local var_10_35 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 8421504,
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonUp", var_10_35)

	local var_10_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_36)

	local var_10_37 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_37)

	local var_10_38 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonUp", var_10_38)

	local var_10_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonUp", var_10_39)

	local var_10_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonUp", var_10_40)

	local function var_10_41()
		var_10_6:AnimateSequence("ButtonUp")
		var_10_8:AnimateSequence("ButtonUp")
		var_10_10:AnimateSequence("ButtonUp")
		var_10_12:AnimateSequence("ButtonUp")
		var_10_16:AnimateSequence("ButtonUp")
		var_10_18:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_41

	local var_10_42 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonOverDisabled", var_10_42)

	local var_10_43 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOverDisabled", var_10_43)

	local var_10_44 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOverDisabled", var_10_44)

	local var_10_45 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonOverDisabled", var_10_45)

	local var_10_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonOverDisabled", var_10_46)

	local var_10_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonOverDisabled", var_10_47)

	local function var_10_48()
		var_10_6:AnimateSequence("ButtonOverDisabled")
		var_10_8:AnimateSequence("ButtonOverDisabled")
		var_10_10:AnimateSequence("ButtonOverDisabled")
		var_10_12:AnimateSequence("ButtonOverDisabled")
		var_10_16:AnimateSequence("ButtonOverDisabled")
		var_10_18:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_48

	local var_10_49 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 8421504,
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonUpDisabled", var_10_49)

	local var_10_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUpDisabled", var_10_50)

	local var_10_51 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUpDisabled", var_10_51)

	local var_10_52 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonUpDisabled", var_10_52)

	local var_10_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonUpDisabled", var_10_53)

	local var_10_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonUpDisabled", var_10_54)

	local function var_10_55()
		var_10_6:AnimateSequence("ButtonUpDisabled")
		var_10_8:AnimateSequence("ButtonUpDisabled")
		var_10_10:AnimateSequence("ButtonUpDisabled")
		var_10_12:AnimateSequence("ButtonUpDisabled")
		var_10_16:AnimateSequence("ButtonUpDisabled")
		var_10_18:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_55

	local var_10_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("Locked", var_10_56)

	local function var_10_57()
		var_10_14:AnimateSequence("Locked")
	end

	var_10_0._sequences.Locked = var_10_57

	local var_10_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("Unlocked", var_10_58)

	local function var_10_59()
		var_10_14:AnimateSequence("Unlocked")
	end

	var_10_0._sequences.Unlocked = var_10_59

	local var_10_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -11
		}
	}

	var_10_12:RegisterAnimationSequence("AR", var_10_60)

	local function var_10_61()
		var_10_12:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_61

	var_10_14:addEventHandler("disable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Locked")
	end)
	var_10_14:addEventHandler("enable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Locked")
	end)
	var_0_3(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("PlayerCardButton", PlayerCardButton)
LockTable(_M)
