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

	arg_3_0.isNew = Loot.HDJCADADF(arg_3_0._controllerIndex, arg_3_2.lootID) and not arg_3_2.isRandom
	arg_3_0.cardRef = arg_3_2.ref

	arg_3_0.NewPlayerCardNotification:UpdateAlpha(arg_3_0.isNew and 1 or 0)

	if arg_3_2.isRandom or arg_3_2.isRandomFavorite then
		arg_3_0.PlayerTitle:SetAlpha(0)
		arg_3_0.Image:SetAlpha(0.5)
		arg_3_0.Text:SetAlpha(1)
		arg_3_0.Image:setImage(RegisterMaterial(arg_3_2.image))
		arg_3_0.Text:setText(Engine.CBBHFCGDIC(arg_3_2.name))
	elseif arg_3_2.name and arg_3_2.name ~= "" then
		arg_3_0.PlayerTitle:SetAlpha(1)
		arg_3_0.Image:SetAlpha(0)

		if arg_3_2.index ~= tostring(PlayerTitleUtils.DefaultTitleID) then
			arg_3_0.Text:SetAlpha(0)
			arg_3_0.PlayerTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(arg_3_2.name)))
			arg_3_0.Text:setText("")
		else
			arg_3_0.Text:SetAlpha(1)
			arg_3_0.PlayerTitle:SetAlpha(0)
			arg_3_0.Text:setText(Engine.CBBHFCGDIC(arg_3_2.name))
		end
	end

	arg_3_0.QualityMarker:SetRarityColor(arg_3_2.rarity)
	arg_3_0:SetSelected(arg_3_3)
	arg_3_0:SetFavorite(arg_3_4)
	arg_3_0:SetButtonDisabled(not arg_3_2.isUnlocked)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.PlayerTitle)
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

	arg_4_0:registerEventHandler("button_over", function(arg_5_0, arg_5_1)
		if arg_4_0._menu then
			arg_4_0._menu:Preview()
		end

		if arg_4_0.cardRef == "randomization" then
			WZWIP.AnimateThemeElement(arg_5_0, "ButtonOverRandom")
		else
			WZWIP.AnimateThemeElement(arg_5_0, "ButtonOver")
		end
	end)
	arg_4_0:registerEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		if arg_4_0._menu then
			arg_4_0._menu:Preview()
		end

		if arg_4_0.cardRef == "randomization" then
			WZWIP.AnimateThemeElement(arg_6_0, "ButtonOverDisabledRandom")
		else
			WZWIP.AnimateThemeElement(arg_6_0, "ButtonOverDisabled")
		end
	end)
	arg_4_0:registerEventHandler("button_up", function(arg_7_0, arg_7_1)
		if arg_4_0.isNew then
			local var_7_0 = LOOT.GetItemID(LOOT.itemTypes.TITLE, arg_4_0.cardRef)

			arg_4_0.NewPlayerCardNotification:ClearBreadcrumbByID(arg_4_0._controllerIndex, var_7_0)

			arg_4_0.isNew = false
		end

		if arg_4_0.cardRef == "randomization" then
			WZWIP.AnimateThemeElement(arg_7_0, "ButtonUpRandom")
		else
			WZWIP.AnimateThemeElement(arg_7_0, "ButtonUp")
		end
	end)
	arg_4_0:registerEventHandler("button_disable", function(arg_8_0, arg_8_1)
		if arg_4_0.cardRef == "randomization" then
			WZWIP.AnimateThemeElement(arg_8_0, "ButtonUpDisabledRandom")
		else
			WZWIP.AnimateThemeElement(arg_8_0, "ButtonUpDisabled")
		end
	end)
	arg_4_0:registerEventHandler("button_action", function(arg_9_0, arg_9_1)
		if arg_4_0._menu then
			arg_4_0._menu:Equip()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

function PlayerTitleButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 140 * _1080p)

	var_10_0.id = "PlayerTitleButton"
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

	var_10_6.id = "Darkener"

	var_10_6:SetRGBFromInt(0, 0)
	var_10_6:SetAlpha(0, 0)
	var_10_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_10_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 4, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.Darkener = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "Image"

	var_10_8:SetAlpha(0, 0)
	var_10_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 90)
	var_10_0:addElement(var_10_8)

	var_10_0.Image = var_10_8

	local var_10_9

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_10_9 = LUI.UIImage.new()
		var_10_9.id = "TextureLayer"

		var_10_9:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
		var_10_9:SetAlpha(0.1, 0)
		var_10_9:SetPixelGridEnabled(true)
		var_10_9:SetPixelGridContrast(0.8, 0)
		var_10_9:SetPixelGridBlockWidth(2, 0)
		var_10_9:SetPixelGridBlockHeight(2, 0)
		var_10_9:SetPixelGridGutterWidth(1, 0)
		var_10_9:SetPixelGridGutterHeight(1, 0)
		var_10_9:setImage(RegisterMaterial("ui_default_white"), 0)
		var_10_9:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 90, 0)
		var_10_0:addElement(var_10_9)

		var_10_0.TextureLayer = var_10_9
	end

	local var_10_10

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_10_10 = LUI.UIImage.new()
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
	end

	local var_10_11

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_10_11 = LUI.UIImage.new()
		var_10_11.id = "WZWipGradient"

		var_10_11:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_10_11:SetAlpha(0, 0)
		var_10_11:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_10_11:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 60, 0)
		var_10_0:addElement(var_10_11)

		var_10_0.WZWipGradient = var_10_11
	end

	local var_10_12
	local var_10_13 = LUI.UIStyledText.new()

	var_10_13.id = "Text"

	var_10_13:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_10_13:SetAlpha(0.5, 0)
	var_10_13:setText("", 0)
	var_10_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_13:SetAlignment(LUI.Alignment.Left)
	var_10_13:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_13:SetStartupDelay(1000)
	var_10_13:SetLineHoldTime(500)
	var_10_13:SetAnimMoveTime(500)
	var_10_13:SetAnimMoveSpeed(50)
	var_10_13:SetEndDelay(1000)
	var_10_13:SetCrossfadeTime(500)
	var_10_13:SetFadeInTime(300)
	var_10_13:SetFadeOutTime(300)
	var_10_13:SetMaxVisibleLines(1)
	var_10_13:SetShadowRGBFromInt(0, 0)
	var_10_13:SetOutlineRGBFromInt(0, 0)
	var_10_13:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -59, _1080p * -34, _1080p * -14)
	var_10_0:addElement(var_10_13)

	var_10_0.Text = var_10_13

	local var_10_14
	local var_10_15 = LUI.UIImage.new()

	var_10_15.id = "Lock"

	var_10_15:SetRGBFromInt(8686977, 0)
	var_10_15:SetAlpha(0, 0)
	var_10_15:setImage(RegisterMaterial("ui_font_lock"), 0)
	var_10_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -25, _1080p * -5, _1080p * -35, _1080p * -15)
	var_10_0:addElement(var_10_15)

	var_10_0.Lock = var_10_15

	local var_10_16
	local var_10_17 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_10_1
	})

	var_10_17.id = "ButtonHighlightBarTop"

	var_10_17:SetAlpha(0, 0)
	var_10_17:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_10_0:addElement(var_10_17)

	var_10_0.ButtonHighlightBarTop = var_10_17

	local var_10_18
	local var_10_19 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_10_1
	})

	var_10_19.id = "ButtonHighlightBarBottom"

	var_10_19:SetAlpha(0, 0)
	var_10_19:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_10_0:addElement(var_10_19)

	var_10_0.ButtonHighlightBarBottom = var_10_19

	local var_10_20
	local var_10_21 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_10_1
	})

	var_10_21.id = "Selected"

	var_10_21:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -23, _1080p * -7, _1080p * -33, _1080p * -17)
	var_10_0:addElement(var_10_21)

	var_10_0.Selected = var_10_21

	local var_10_22
	local var_10_23 = MenuBuilder.BuildRegisteredType("QualityMarker", {
		controllerIndex = var_10_1
	})

	var_10_23.id = "QualityMarker"

	var_10_23:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, _1080p * 90, 0)
	var_10_0:addElement(var_10_23)

	var_10_0.QualityMarker = var_10_23

	local var_10_24
	local var_10_25 = MenuBuilder.BuildRegisteredType("FavoritedNotification", {
		controllerIndex = var_10_1
	})

	var_10_25.id = "Favorited"

	var_10_25:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 48, 0, _1080p * 48)
	var_10_0:addElement(var_10_25)

	var_10_0.Favorited = var_10_25

	local var_10_26
	local var_10_27 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_27.id = "NewPlayerCardNotification"

	var_10_27:SetAlpha(0, 0)
	var_10_27:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -19, _1080p * -11, _1080p * -29, _1080p * -21)
	var_10_0:addElement(var_10_27)

	var_10_0.NewPlayerCardNotification = var_10_27

	local var_10_28
	local var_10_29 = LUI.UIStyledText.new()

	var_10_29.id = "PlayerTitle"

	var_10_29:setText("", 0)
	var_10_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_29:SetAlignment(LUI.Alignment.Center)
	var_10_29:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_29:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 341, _1080p * 36, _1080p * 66)
	var_10_0:addElement(var_10_29)

	var_10_0.PlayerTitle = var_10_29

	local function var_10_30()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_30

	local var_10_31
	local var_10_32 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ButtonOver", var_10_32)

	local var_10_33 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonOver", var_10_33)

	local var_10_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_34)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_35 = {
			{
				value = 0.15,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.backgroundFocus
			}
		}

		var_10_9:RegisterAnimationSequence("ButtonOver", var_10_35)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_36 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_10:RegisterAnimationSequence("ButtonOver", var_10_36)
	end

	local var_10_37 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_10_13:RegisterAnimationSequence("ButtonOver", var_10_37)

	local var_10_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ButtonOver", var_10_38)

	local var_10_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ButtonOver", var_10_39)

	local function var_10_40()
		var_10_4:AnimateSequence("ButtonOver")
		var_10_6:AnimateSequence("ButtonOver")
		var_10_8:AnimateSequence("ButtonOver")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_10_9:AnimateSequence("ButtonOver")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_10_10:AnimateSequence("ButtonOver")
		end

		var_10_13:AnimateSequence("ButtonOver")
		var_10_17:AnimateSequence("ButtonOver")
		var_10_19:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_40

	local var_10_41
	local var_10_42 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ButtonUp", var_10_42)

	local var_10_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonUp", var_10_43)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_44 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textureUnFocused
			},
			{
				value = 0.05,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_9:RegisterAnimationSequence("ButtonUp", var_10_44)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_45 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_10:RegisterAnimationSequence("ButtonUp", var_10_45)
	end

	local var_10_46 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_13:RegisterAnimationSequence("ButtonUp", var_10_46)

	local var_10_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ButtonUp", var_10_47)

	local var_10_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ButtonUp", var_10_48)

	local function var_10_49()
		var_10_4:AnimateSequence("ButtonUp")
		var_10_6:AnimateSequence("ButtonUp")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_10_9:AnimateSequence("ButtonUp")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_10_10:AnimateSequence("ButtonUp")
		end

		var_10_13:AnimateSequence("ButtonUp")
		var_10_17:AnimateSequence("ButtonUp")
		var_10_19:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_49

	local var_10_50
	local var_10_51 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ButtonOverDisabled", var_10_51)

	local var_10_52 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonOverDisabled", var_10_52)

	local var_10_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOverDisabled", var_10_53)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_54 = {
			{
				value = 16777215,
				duration = 200,
				property = TWEEN_PROPERTY.RGB
			},
			{
				value = 0.15,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_9:RegisterAnimationSequence("ButtonOverDisabled", var_10_54)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_55 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDisabled
			},
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_10:RegisterAnimationSequence("ButtonOverDisabled", var_10_55)
	end

	local var_10_56 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_10_13:RegisterAnimationSequence("ButtonOverDisabled", var_10_56)

	local var_10_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ButtonOverDisabled", var_10_57)

	local var_10_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ButtonOverDisabled", var_10_58)

	local function var_10_59()
		var_10_4:AnimateSequence("ButtonOverDisabled")
		var_10_6:AnimateSequence("ButtonOverDisabled")
		var_10_8:AnimateSequence("ButtonOverDisabled")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_10_9:AnimateSequence("ButtonOverDisabled")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_10_10:AnimateSequence("ButtonOverDisabled")
		end

		var_10_13:AnimateSequence("ButtonOverDisabled")
		var_10_17:AnimateSequence("ButtonOverDisabled")
		var_10_19:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_59

	local var_10_60
	local var_10_61 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ButtonUpDisabled", var_10_61)

	local var_10_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonUpDisabled", var_10_62)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_63 = {
			{
				value = 0.05,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 16777215,
				duration = 100,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_10_9:RegisterAnimationSequence("ButtonUpDisabled", var_10_63)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_64 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_10:RegisterAnimationSequence("ButtonUpDisabled", var_10_64)
	end

	local var_10_65 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_10_13:RegisterAnimationSequence("ButtonUpDisabled", var_10_65)

	local var_10_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ButtonUpDisabled", var_10_66)

	local var_10_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ButtonUpDisabled", var_10_67)

	local function var_10_68()
		var_10_4:AnimateSequence("ButtonUpDisabled")
		var_10_6:AnimateSequence("ButtonUpDisabled")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_10_9:AnimateSequence("ButtonUpDisabled")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_10_10:AnimateSequence("ButtonUpDisabled")
		end

		var_10_13:AnimateSequence("ButtonUpDisabled")
		var_10_17:AnimateSequence("ButtonUpDisabled")
		var_10_19:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_68

	local var_10_69
	local var_10_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("Locked", var_10_70)

	local function var_10_71()
		var_10_15:AnimateSequence("Locked")
	end

	var_10_0._sequences.Locked = var_10_71

	local var_10_72
	local var_10_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("Unlocked", var_10_73)

	local function var_10_74()
		var_10_15:AnimateSequence("Unlocked")
	end

	var_10_0._sequences.Unlocked = var_10_74

	local var_10_75
	local var_10_76 = {
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

	var_10_13:RegisterAnimationSequence("AR", var_10_76)

	local function var_10_77()
		var_10_13:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_77

	local var_10_78
	local var_10_79 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipSetup", var_10_79)

	local var_10_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipSetup", var_10_80)

	local function var_10_81()
		var_10_13:AnimateSequence("WZWipSetup")
		var_10_15:AnimateSequence("WZWipSetup")
	end

	var_10_0._sequences.WZWipSetup = var_10_81

	local var_10_82
	local var_10_83 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonOver", var_10_83)

	local var_10_84 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipButtonOver", var_10_84)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_85 = {
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonOver", var_10_85)
	end

	local var_10_86 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipButtonOver", var_10_86)

	local var_10_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonOver", var_10_87)

	local var_10_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipButtonOver", var_10_88)

	local function var_10_89()
		var_10_4:AnimateSequence("WZWipButtonOver")
		var_10_6:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonOver")
		end

		var_10_13:AnimateSequence("WZWipButtonOver")
		var_10_17:AnimateSequence("WZWipButtonOver")
		var_10_19:AnimateSequence("WZWipButtonOver")
	end

	var_10_0._sequences.WZWipButtonOver = var_10_89

	local var_10_90
	local var_10_91 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_91)

	local var_10_92 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_92)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_93 = {
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_93)
	end

	local var_10_94 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_94)

	local var_10_95 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_95)

	local var_10_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_96)

	local function var_10_97()
		var_10_4:AnimateSequence("WZWipButtonOverDisabled")
		var_10_6:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonOverDisabled")
		end

		var_10_13:AnimateSequence("WZWipButtonOverDisabled")
		var_10_17:AnimateSequence("WZWipButtonOverDisabled")
		var_10_19:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_10_0._sequences.WZWipButtonOverDisabled = var_10_97

	local var_10_98
	local var_10_99 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonUp", var_10_99)

	local var_10_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipButtonUp", var_10_100)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_101 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonUp", var_10_101)
	end

	local var_10_102 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipButtonUp", var_10_102)

	local var_10_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonUp", var_10_103)

	local var_10_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipButtonUp", var_10_104)

	local function var_10_105()
		var_10_4:AnimateSequence("WZWipButtonUp")
		var_10_6:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonUp")
		end

		var_10_13:AnimateSequence("WZWipButtonUp")
		var_10_17:AnimateSequence("WZWipButtonUp")
		var_10_19:AnimateSequence("WZWipButtonUp")
	end

	var_10_0._sequences.WZWipButtonUp = var_10_105

	local var_10_106
	local var_10_107 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_107)

	local var_10_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_108)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_109 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_109)
	end

	local var_10_110 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_110)

	local var_10_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_111)

	local var_10_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_112)

	local function var_10_113()
		var_10_4:AnimateSequence("WZWipButtonUpDisabled")
		var_10_6:AnimateSequence("WZWipButtonUpDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonUpDisabled")
		end

		var_10_13:AnimateSequence("WZWipButtonUpDisabled")
		var_10_17:AnimateSequence("WZWipButtonUpDisabled")
		var_10_19:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_10_0._sequences.WZWipButtonUpDisabled = var_10_113

	local var_10_114
	local var_10_115 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonOverRandom", var_10_115)

	local var_10_116 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipButtonOverRandom", var_10_116)

	local var_10_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonOverRandom", var_10_117)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_118 = {
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonOverRandom", var_10_118)
	end

	local var_10_119 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipButtonOverRandom", var_10_119)

	local var_10_120 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonOverRandom", var_10_120)

	local var_10_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipButtonOverRandom", var_10_121)

	local function var_10_122()
		var_10_4:AnimateSequence("WZWipButtonOverRandom")
		var_10_6:AnimateSequence("WZWipButtonOverRandom")
		var_10_8:AnimateSequence("WZWipButtonOverRandom")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonOverRandom")
		end

		var_10_13:AnimateSequence("WZWipButtonOverRandom")
		var_10_17:AnimateSequence("WZWipButtonOverRandom")
		var_10_19:AnimateSequence("WZWipButtonOverRandom")
	end

	var_10_0._sequences.WZWipButtonOverRandom = var_10_122

	local var_10_123
	local var_10_124 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonOverDisabledRandom", var_10_124)

	local var_10_125 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipButtonOverDisabledRandom", var_10_125)

	local var_10_126 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonOverDisabledRandom", var_10_126)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_127 = {
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonOverDisabledRandom", var_10_127)
	end

	local var_10_128 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipButtonOverDisabledRandom", var_10_128)

	local var_10_129 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonOverDisabledRandom", var_10_129)

	local var_10_130 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipButtonOverDisabledRandom", var_10_130)

	local function var_10_131()
		var_10_4:AnimateSequence("WZWipButtonOverDisabledRandom")
		var_10_6:AnimateSequence("WZWipButtonOverDisabledRandom")
		var_10_8:AnimateSequence("WZWipButtonOverDisabledRandom")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonOverDisabledRandom")
		end

		var_10_13:AnimateSequence("WZWipButtonOverDisabledRandom")
		var_10_17:AnimateSequence("WZWipButtonOverDisabledRandom")
		var_10_19:AnimateSequence("WZWipButtonOverDisabledRandom")
	end

	var_10_0._sequences.WZWipButtonOverDisabledRandom = var_10_131

	local var_10_132
	local var_10_133 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonUpRandom", var_10_133)

	local var_10_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipButtonUpRandom", var_10_134)

	local var_10_135 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonUpRandom", var_10_135)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_136 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonUpRandom", var_10_136)
	end

	local var_10_137 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipButtonUpRandom", var_10_137)

	local var_10_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonUpRandom", var_10_138)

	local var_10_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipButtonUpRandom", var_10_139)

	local function var_10_140()
		var_10_4:AnimateSequence("WZWipButtonUpRandom")
		var_10_6:AnimateSequence("WZWipButtonUpRandom")
		var_10_8:AnimateSequence("WZWipButtonUpRandom")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonUpRandom")
		end

		var_10_13:AnimateSequence("WZWipButtonUpRandom")
		var_10_17:AnimateSequence("WZWipButtonUpRandom")
		var_10_19:AnimateSequence("WZWipButtonUpRandom")
	end

	var_10_0._sequences.WZWipButtonUpRandom = var_10_140

	local var_10_141
	local var_10_142 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonUpDisabledRandom", var_10_142)

	local var_10_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipButtonUpDisabledRandom", var_10_143)

	local var_10_144 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonUpDisabledRandom", var_10_144)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_145 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonUpDisabledRandom", var_10_145)
	end

	local var_10_146 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_13:RegisterAnimationSequence("WZWipButtonUpDisabledRandom", var_10_146)

	local var_10_147 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipButtonUpDisabledRandom", var_10_147)

	local var_10_148 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipButtonUpDisabledRandom", var_10_148)

	local function var_10_149()
		var_10_4:AnimateSequence("WZWipButtonUpDisabledRandom")
		var_10_6:AnimateSequence("WZWipButtonUpDisabledRandom")
		var_10_8:AnimateSequence("WZWipButtonUpDisabledRandom")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonUpDisabledRandom")
		end

		var_10_13:AnimateSequence("WZWipButtonUpDisabledRandom")
		var_10_17:AnimateSequence("WZWipButtonUpDisabledRandom")
		var_10_19:AnimateSequence("WZWipButtonUpDisabledRandom")
	end

	var_10_0._sequences.WZWipButtonUpDisabledRandom = var_10_149

	var_10_15:addEventHandler("disable", function(arg_28_0, arg_28_1)
		if not arg_28_1.controller then
			local var_28_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Locked")
	end)
	var_10_15:addEventHandler("enable", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Unlocked")
	end)
	var_0_3(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("PlayerTitleButton", PlayerTitleButton)
LockTable(_M)
