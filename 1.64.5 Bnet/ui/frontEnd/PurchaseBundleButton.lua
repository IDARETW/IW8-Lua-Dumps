module(..., package.seeall)

local var_0_0 = 0.75

local function var_0_1(arg_1_0)
	local var_1_0 = 4
	local var_1_1 = arg_1_0.ButtonIconKBM:GetCurrentAnchorsAndPositions()
	local var_1_2 = var_1_1.right - var_1_1.left
	local var_1_3 = _1080p * 26
	local var_1_4 = _1080p * 10
	local var_1_5 = _1080p * -20
	local var_1_6 = LAYOUT.GetElementWidth(arg_1_0) * var_0_0
	local var_1_7 = LAYOUT.GetTextWidth(arg_1_0.BuyLabel)

	if var_1_6 < var_1_7 then
		var_1_7 = var_1_6
	end

	local var_1_8 = -1 * (var_1_7 / 2 + var_1_4)
	local var_1_9 = var_1_8 - var_1_3
	local var_1_10 = -1 * (var_1_7 / 2 + var_1_5)
	local var_1_11 = var_1_8 - var_1_2

	arg_1_0.ButtonIcon:SetLeft(var_1_9)
	arg_1_0.ButtonIcon:SetRight(var_1_8)
	arg_1_0.ButtonIconKBM:SetLeft(var_1_11)
	arg_1_0.ButtonIconKBM:SetRight(var_1_10)
	arg_1_0.HoldRadial:SetLeft(var_1_9 - var_1_0)
	arg_1_0.HoldRadial:SetRight(var_1_8 + var_1_0)
	arg_1_0.HoldPulse:SetLeft(var_1_9 - var_1_0)
	arg_1_0.HoldPulse:SetRight(var_1_8 + var_1_0)
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0.BuyLabel:setText(arg_2_1)
	arg_2_0:RepositionButtonIcon()
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if type(arg_3_1) == "string" then
		if arg_3_3 == STORE.FreeFirstPartyBundle then
			var_0_2(arg_3_0, Engine.CBBHFCGDIC("MENU/BUNDLE_CLAIM"))
			ACTIONS.AnimateSequence(arg_3_0, "Free")
			ACTIONS.AnimateSequence(arg_3_0.Background, "Free")
		else
			ACTIONS.AnimateSequence(arg_3_0, "Cash")
			arg_3_0.Price:setText(Engine.JCBDICCAH(arg_3_1))
			arg_3_0:RepositionButtonIcon()
		end
	elseif arg_3_1 == 0 or arg_3_2 and arg_3_2 == 0 then
		var_0_2(arg_3_0, Engine.CBBHFCGDIC("MENU/BUNDLE_CLAIM"))
		ACTIONS.AnimateSequence(arg_3_0, "Free")
		ACTIONS.AnimateSequence(arg_3_0.Background, "Free")
	elseif arg_3_2 and arg_3_2 > 0 and arg_3_2 < arg_3_1 then
		arg_3_0.Price:setText(Engine.JCBDICCAH(arg_3_2))
		arg_3_0.OriginalCost:setText(Engine.JCBDICCAH(arg_3_1))
		ACTIONS.AnimateSequence(arg_3_0, "Sale")
	else
		arg_3_0.Price:setText(Engine.JCBDICCAH(arg_3_1))
		ACTIONS.AnimateSequence(arg_3_0, "NoSale")
	end
end

local function var_0_4(arg_4_0, arg_4_1)
	if not arg_4_0._isPurchased then
		if LUI.IsLastInputKeyboardMouse(arg_4_1.controllerIndex) then
			ACTIONS.AnimateSequence(arg_4_0, "DisplayKBM")
		elseif arg_4_0._usesHoldToPurchase then
			ACTIONS.AnimateSequence(arg_4_0, "DisplayGamepad")
			arg_4_0.HoldRadial.Progress:SetProgress(0)
		else
			ACTIONS.AnimateSequence(arg_4_0, "DisplayGamepadNoHold")
		end
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	assert(arg_5_1 and arg_5_1.controllerIndex and type(arg_5_1.controllerIndex) == "number", "This method requires an options table with a int value for current controllerIndex.")

	arg_5_0._usesHoldToPurchase = false

	var_0_4(arg_5_0, {
		controllerIndex = arg_5_1.controllerIndex
	})
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetPurchaseTitleText = var_0_2
	arg_6_0.RepositionButtonIcon = var_0_1
	arg_6_0.SetDisableHoldToPurchase = var_0_5
	arg_6_0.SetPrice = var_0_3
	arg_6_0._isPurchased = false
	arg_6_0._usesHoldToPurchase = true

	arg_6_0:addAndCallEventHandler("update_input_type", var_0_4, {
		controllerIndex = arg_6_1
	})
	arg_6_0.Glint:SetMask(arg_6_0.Mask)
	arg_6_0:RepositionButtonIcon()
	arg_6_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_6_0, "GlintAnimeStop")
	end)
	arg_6_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonUp")
		ACTIONS.AnimateSequence(arg_6_0, "GlintAnime")
	end)
	arg_6_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonOverDisabled")
	end)
	arg_6_0:addEventHandler("button_disable", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonUpDisabled")
	end)
	arg_6_0:addEventHandler("Purchased", function(arg_11_0, arg_11_1)
		arg_6_0._isPurchased = true

		ACTIONS.AnimateSequence(arg_6_0, "Purchased")
		arg_6_0:SetMouseFocusBlocker(true)
	end)
end

function PurchaseBundleButton(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 120 * _1080p)

	var_12_0.id = "PurchaseBundleButton"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Gradient"

	var_12_4:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_12_4:SetAlpha(0, 0)
	var_12_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 120)
	var_12_0:addElement(var_12_4)

	var_12_0.Gradient = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("StoreItemButtonBackground", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "Background"

	var_12_6:SetAlpha(0.95, 0)
	var_12_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.Background = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIStyledText.new()

	var_12_8.id = "BuyLabel"

	var_12_8:SetRGBFromTable(SWATCHES.Store.BundleText, 0)
	var_12_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_BUY")), 0)
	var_12_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_8:SetWordWrap(false)
	var_12_8:SetAlignment(LUI.Alignment.Center)
	var_12_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_8:SetStartupDelay(1000)
	var_12_8:SetLineHoldTime(400)
	var_12_8:SetAnimMoveTime(1000)
	var_12_8:SetAnimMoveSpeed(150)
	var_12_8:SetEndDelay(1000)
	var_12_8:SetCrossfadeTime(1000)
	var_12_8:SetFadeInTime(300)
	var_12_8:SetFadeOutTime(300)
	var_12_8:SetMaxVisibleLines(1)
	var_12_8:SetShadowMinDistance(-0.2, 0)
	var_12_8:SetShadowMaxDistance(0.2, 0)
	var_12_8:SetShadowRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_12_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 45, _1080p * -45, _1080p * 21, _1080p * 57)
	var_12_0:addElement(var_12_8)

	var_12_0.BuyLabel = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIStyledText.new()

	var_12_10.id = "BuyLabelGamepad"

	var_12_10:SetRGBFromTable(SWATCHES.Store.BundleText, 0)
	var_12_10:SetAlpha(0, 0)
	var_12_10:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_BUY")), 0)
	var_12_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_10:SetWordWrap(false)
	var_12_10:SetAlignment(LUI.Alignment.Center)
	var_12_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_10:SetStartupDelay(1000)
	var_12_10:SetLineHoldTime(400)
	var_12_10:SetAnimMoveTime(1000)
	var_12_10:SetAnimMoveSpeed(150)
	var_12_10:SetEndDelay(1000)
	var_12_10:SetCrossfadeTime(1000)
	var_12_10:SetFadeInTime(300)
	var_12_10:SetFadeOutTime(300)
	var_12_10:SetMaxVisibleLines(1)
	var_12_10:SetShadowMinDistance(-0.2, 0)
	var_12_10:SetShadowMaxDistance(0.2, 0)
	var_12_10:SetShadowRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_12_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 45, _1080p * -45, _1080p * 21, _1080p * 57)
	var_12_0:addElement(var_12_10)

	var_12_0.BuyLabelGamepad = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIImage.new()

	var_12_12.id = "CurrencyIcon"

	var_12_12:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_12_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -72, _1080p * -40, _1080p * -42, _1080p * -10)
	var_12_0:addElement(var_12_12)

	var_12_0.CurrencyIcon = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIText.new()

	var_12_14.id = "Price"

	var_12_14:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_12_14:setText("", 0)
	var_12_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_14:SetAlignment(LUI.Alignment.Left)
	var_12_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -30, _1080p * 66, _1080p * -42, _1080p * -12)
	var_12_0:addElement(var_12_14)

	var_12_0.Price = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIText.new()

	var_12_16.id = "ButtonIconKBM"

	var_12_16:SetAlpha(0, 0)
	var_12_16:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_START_BUTTON"), 0)
	var_12_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_16:SetAlignment(LUI.Alignment.Right)
	var_12_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -157, _1080p * -81, _1080p * 33, _1080p * 51)
	var_12_0:addElement(var_12_16)

	var_12_0.ButtonIconKBM = var_12_16

	local var_12_17
	local var_12_18 = {
		iconString = "LUA_MENU/PAD_ALT1_BUTTON",
		controllerIndex = var_12_1
	}
	local var_12_19 = MenuBuilder.BuildRegisteredType("IconImage", var_12_18)

	var_12_19.id = "ButtonIcon"

	var_12_19:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_12_19:setImage(RegisterMaterial("button_alt1"), 0)
	var_12_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -107, _1080p * -81, _1080p * 27, _1080p * 53)
	var_12_0:addElement(var_12_19)

	var_12_0.ButtonIcon = var_12_19

	local var_12_20
	local var_12_21 = LUI.UIImage.new()

	var_12_21.id = "Glint"

	var_12_21:SetAlpha(0, 0)
	var_12_21:SetZRotation(-60, 0)
	var_12_21:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -200, _1080p * 600, _1080p * -1000, _1080p * 1000)
	var_12_0:addElement(var_12_21)

	var_12_0.Glint = var_12_21

	local var_12_22
	local var_12_23 = LUI.UIImage.new()

	var_12_23.id = "Mask"

	var_12_23:setImage(RegisterMaterial("stencil_mask"), 0)
	var_12_0:addElement(var_12_23)

	var_12_0.Mask = var_12_23

	local var_12_24
	local var_12_25 = LUI.UIText.new()

	var_12_25.id = "OriginalCost"

	var_12_25:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_12_25:SetAlpha(0, 0)
	var_12_25:setText("4000", 0)
	var_12_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_25:SetAlignment(LUI.Alignment.Center)
	var_12_25:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -128, _1080p * -39, _1080p * 78, _1080p * 108)
	var_12_0:addElement(var_12_25)

	var_12_0.OriginalCost = var_12_25

	local var_12_26
	local var_12_27 = LUI.UIImage.new()

	var_12_27.id = "RedLine"

	var_12_27:SetRGBFromInt(16711680, 0)
	var_12_27:SetAlpha(0, 0)
	var_12_27:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -128, _1080p * -39, _1080p * 95, _1080p * 93)
	var_12_0:addElement(var_12_27)

	var_12_0.RedLine = var_12_27

	local var_12_28
	local var_12_29 = MenuBuilder.BuildRegisteredType("GenericRadialProgressBar", {
		controllerIndex = var_12_1
	})

	var_12_29.id = "HoldRadial"

	var_12_29:SetAlpha(0, 0)
	var_12_29.Backer:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_12_29.Progress:SetRGBFromTable(SWATCHES.CH2.CH2SeasonalEventColor, 0)
	var_12_29.Progress:setImage(RegisterMaterial("dpad_circle_segment"), 0)
	var_12_29.Percent:SetAlpha(0, 0)
	var_12_29:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -112, _1080p * -76, _1080p * 22, _1080p * 58)
	var_12_0:addElement(var_12_29)

	var_12_0.HoldRadial = var_12_29

	local var_12_30
	local var_12_31 = LUI.UIImage.new()

	var_12_31.id = "HoldPulse"

	var_12_31:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_12_31:SetAlpha(0, 0)
	var_12_31:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_12_31:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -112, _1080p * -76, _1080p * 22, _1080p * 58)
	var_12_0:addElement(var_12_31)

	var_12_0.HoldPulse = var_12_31

	local function var_12_32()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_32

	local var_12_33
	local var_12_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleTextOver
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOver", var_12_34)

	local function var_12_35()
		var_12_8:AnimateSequence("ButtonOver")
	end

	var_12_0._sequences.ButtonOver = var_12_35

	local var_12_36
	local var_12_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleText
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUp", var_12_37)

	local function var_12_38()
		var_12_8:AnimateSequence("ButtonUp")
	end

	var_12_0._sequences.ButtonUp = var_12_38

	local var_12_39
	local var_12_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverDisabled", var_12_40)

	local function var_12_41()
		var_12_8:AnimateSequence("ButtonOverDisabled")
	end

	var_12_0._sequences.ButtonOverDisabled = var_12_41

	local var_12_42
	local var_12_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUpDisabled", var_12_43)

	local function var_12_44()
		var_12_8:AnimateSequence("ButtonUpDisabled")
	end

	var_12_0._sequences.ButtonUpDisabled = var_12_44

	local var_12_45
	local var_12_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Purchased", var_12_46)

	local var_12_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_12_6:RegisterAnimationSequence("Purchased", var_12_47)

	local var_12_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_PURCHASED"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.TextOver
		}
	}

	var_12_8:RegisterAnimationSequence("Purchased", var_12_48)

	local var_12_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("Purchased", var_12_49)

	local var_12_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("Purchased", var_12_50)

	local var_12_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("Purchased", var_12_51)

	local var_12_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_19:RegisterAnimationSequence("Purchased", var_12_52)

	local var_12_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 26
		}
	}

	var_12_23:RegisterAnimationSequence("Purchased", var_12_53)

	local var_12_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_25:RegisterAnimationSequence("Purchased", var_12_54)

	local var_12_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("Purchased", var_12_55)

	local var_12_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_29:RegisterAnimationSequence("Purchased", var_12_56)

	local function var_12_57()
		var_12_4:AnimateSequence("Purchased")
		var_12_6:AnimateSequence("Purchased")
		var_12_8:AnimateSequence("Purchased")
		var_12_12:AnimateSequence("Purchased")
		var_12_14:AnimateSequence("Purchased")
		var_12_16:AnimateSequence("Purchased")
		var_12_19:AnimateSequence("Purchased")
		var_12_23:AnimateSequence("Purchased")
		var_12_25:AnimateSequence("Purchased")
		var_12_27:AnimateSequence("Purchased")
		var_12_29:AnimateSequence("Purchased")
	end

	var_12_0._sequences.Purchased = var_12_57

	local var_12_58
	local var_12_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -515
		},
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 535
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1335
		},
		{
			value = 1,
			duration = 2000,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 6000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 535
		},
		{
			duration = 6000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1335
		}
	}

	var_12_21:RegisterAnimationSequence("GlintAnime", var_12_59)

	local function var_12_60()
		var_12_21:AnimateLoop("GlintAnime")
	end

	var_12_0._sequences.GlintAnime = var_12_60

	local var_12_61
	local var_12_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 600
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_21:RegisterAnimationSequence("GlintAnimeStop", var_12_62)

	local function var_12_63()
		var_12_21:AnimateSequence("GlintAnimeStop")
	end

	var_12_0._sequences.GlintAnimeStop = var_12_63

	local var_12_64
	local var_12_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Free", var_12_65)

	local var_12_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_12_6:RegisterAnimationSequence("Free", var_12_66)

	local var_12_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.TextOver
		}
	}

	var_12_8:RegisterAnimationSequence("Free", var_12_67)

	local var_12_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("Free", var_12_68)

	local var_12_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("Free", var_12_69)

	local var_12_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 73
		}
	}

	var_12_16:RegisterAnimationSequence("Free", var_12_70)

	local var_12_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 73
		}
	}

	var_12_19:RegisterAnimationSequence("Free", var_12_71)

	local var_12_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_12_23:RegisterAnimationSequence("Free", var_12_72)

	local function var_12_73()
		var_12_4:AnimateSequence("Free")
		var_12_6:AnimateSequence("Free")
		var_12_8:AnimateSequence("Free")
		var_12_12:AnimateSequence("Free")
		var_12_14:AnimateSequence("Free")
		var_12_16:AnimateSequence("Free")
		var_12_19:AnimateSequence("Free")
		var_12_23:AnimateSequence("Free")
	end

	var_12_0._sequences.Free = var_12_73

	local var_12_74
	local var_12_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("Cash", var_12_75)

	local var_12_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_12_14:RegisterAnimationSequence("Cash", var_12_76)

	local var_12_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -83
		}
	}

	var_12_29:RegisterAnimationSequence("Cash", var_12_77)

	local var_12_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -83
		}
	}

	var_12_31:RegisterAnimationSequence("Cash", var_12_78)

	local function var_12_79()
		var_12_12:AnimateSequence("Cash")
		var_12_14:AnimateSequence("Cash")
		var_12_29:AnimateSequence("Cash")
		var_12_31:AnimateSequence("Cash")
	end

	var_12_0._sequences.Cash = var_12_79

	local var_12_80
	local var_12_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_25:RegisterAnimationSequence("Sale", var_12_81)

	local var_12_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("Sale", var_12_82)

	local function var_12_83()
		var_12_25:AnimateSequence("Sale")
		var_12_27:AnimateSequence("Sale")
	end

	var_12_0._sequences.Sale = var_12_83

	local var_12_84
	local var_12_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_25:RegisterAnimationSequence("NoSale", var_12_85)

	local var_12_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("NoSale", var_12_86)

	local function var_12_87()
		var_12_25:AnimateSequence("NoSale")
		var_12_27:AnimateSequence("NoSale")
	end

	var_12_0._sequences.NoSale = var_12_87

	local var_12_88
	local var_12_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("DisplayKBM", var_12_89)

	local var_12_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("DisplayKBM", var_12_90)

	local var_12_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_19:RegisterAnimationSequence("DisplayKBM", var_12_91)

	local var_12_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_29:RegisterAnimationSequence("DisplayKBM", var_12_92)

	local function var_12_93()
		var_12_4:AnimateSequence("DisplayKBM")
		var_12_16:AnimateSequence("DisplayKBM")
		var_12_19:AnimateSequence("DisplayKBM")
		var_12_29:AnimateSequence("DisplayKBM")
	end

	var_12_0._sequences.DisplayKBM = var_12_93

	local var_12_94
	local var_12_95 = {
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("DisplayGamepad", var_12_95)

	local var_12_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("DisplayGamepad", var_12_96)

	local var_12_97 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_19:RegisterAnimationSequence("DisplayGamepad", var_12_97)

	local var_12_98 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_29:RegisterAnimationSequence("DisplayGamepad", var_12_98)

	local var_12_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_31:RegisterAnimationSequence("DisplayGamepad", var_12_99)

	local function var_12_100()
		var_12_4:AnimateSequence("DisplayGamepad")
		var_12_16:AnimateSequence("DisplayGamepad")
		var_12_19:AnimateSequence("DisplayGamepad")
		var_12_29:AnimateSequence("DisplayGamepad")
		var_12_31:AnimateSequence("DisplayGamepad")
	end

	var_12_0._sequences.DisplayGamepad = var_12_100

	local var_12_101
	local var_12_102 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 260,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("HoldPulseLoop", var_12_102)

	local var_12_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.5,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 240,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 250,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.99,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 240,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_31:RegisterAnimationSequence("HoldPulseLoop", var_12_103)

	local function var_12_104()
		var_12_8:AnimateLoop("HoldPulseLoop")
		var_12_31:AnimateLoop("HoldPulseLoop")
	end

	var_12_0._sequences.HoldPulseLoop = var_12_104

	local var_12_105
	local var_12_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_31:RegisterAnimationSequence("StopHoldPulse", var_12_106)

	local function var_12_107()
		var_12_31:AnimateSequence("StopHoldPulse")
	end

	var_12_0._sequences.StopHoldPulse = var_12_107

	local var_12_108
	local var_12_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("HoldComplete", var_12_109)

	local var_12_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.5,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 120,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 130,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 125,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.99,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 120,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_31:RegisterAnimationSequence("HoldComplete", var_12_110)

	local function var_12_111()
		var_12_8:AnimateSequence("HoldComplete")
		var_12_31:AnimateSequence("HoldComplete")
	end

	var_12_0._sequences.HoldComplete = var_12_111

	local var_12_112
	local var_12_113 = {
		{
			value = 0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("DisplayGamepadNoHold", var_12_113)

	local var_12_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("DisplayGamepadNoHold", var_12_114)

	local var_12_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_19:RegisterAnimationSequence("DisplayGamepadNoHold", var_12_115)

	local var_12_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_29:RegisterAnimationSequence("DisplayGamepadNoHold", var_12_116)

	local var_12_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_31:RegisterAnimationSequence("DisplayGamepadNoHold", var_12_117)

	local function var_12_118()
		var_12_4:AnimateSequence("DisplayGamepadNoHold")
		var_12_16:AnimateSequence("DisplayGamepadNoHold")
		var_12_19:AnimateSequence("DisplayGamepadNoHold")
		var_12_29:AnimateSequence("DisplayGamepadNoHold")
		var_12_31:AnimateSequence("DisplayGamepadNoHold")
	end

	var_12_0._sequences.DisplayGamepadNoHold = var_12_118

	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("PurchaseBundleButton", PurchaseBundleButton)
LockTable(_M)
