module(..., package.seeall)

local var_0_0 = 0.75

local function var_0_1(arg_1_0)
	local var_1_0 = _1080p * 26
	local var_1_1 = _1080p * 10
	local var_1_2 = LAYOUT.GetElementWidth(arg_1_0) * var_0_0
	local var_1_3 = LAYOUT.GetTextWidth(arg_1_0.BuyLabel)

	if var_1_2 < var_1_3 then
		var_1_3 = var_1_2
	end

	local var_1_4 = -1 * (var_1_3 / 2 + var_1_1)
	local var_1_5 = var_1_4 - var_1_0

	arg_1_0.ButtonIcon:SetLeft(var_1_5)
	arg_1_0.ButtonIcon:SetRight(var_1_4)
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

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetPurchaseTitleText = var_0_2
	arg_4_0.RepositionButtonIcon = var_0_1
	arg_4_0.SetPrice = var_0_3
	arg_4_0._isPurchased = false

	local function var_4_0(arg_5_0, arg_5_1)
		if not arg_5_0._isPurchased then
			if LUI.IsLastInputMouseNavigation(arg_5_1.controllerIndex) then
				arg_5_0.Gradient:SetAlpha(0.5)
			else
				arg_5_0.Gradient:SetAlpha(0)
			end

			if LUI.IsLastInputKeyboardMouse(arg_5_1.controllerIndex) then
				arg_5_0.ButtonIcon:SetAlpha(0)
			else
				arg_5_0.ButtonIcon:SetAlpha(1)
			end
		end
	end

	arg_4_0:addAndCallEventHandler("update_input_type", var_4_0, {
		controllerIndex = arg_4_1
	})
	arg_4_0.Glint:SetMask(arg_4_0.Mask)
	arg_4_0:RepositionButtonIcon()
	arg_4_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_4_0, "GlintAnimeStop")
	end)
	arg_4_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
		ACTIONS.AnimateSequence(arg_4_0, "GlintAnime")
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabled")
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUpDisabled")
	end)
	arg_4_0:addEventHandler("Purchased", function(arg_10_0, arg_10_1)
		arg_4_0._isPurchased = true

		ACTIONS.AnimateSequence(arg_4_0, "Purchased")
		arg_4_0:SetMouseFocusBlocker(true)
	end)
end

function PurchaseBundleButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 120 * _1080p)

	var_11_0.id = "PurchaseBundleButton"
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

	var_11_4.id = "Gradient"

	var_11_4:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_11_4:SetAlpha(0, 0)
	var_11_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 120)
	var_11_0:addElement(var_11_4)

	var_11_0.Gradient = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("StoreItemButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "Background"

	var_11_6:SetAlpha(0.95, 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_6)

	var_11_0.Background = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIStyledText.new()

	var_11_8.id = "BuyLabel"

	var_11_8:SetRGBFromTable(SWATCHES.Store.BundleText, 0)
	var_11_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUNDLE_BUY")), 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_8:SetWordWrap(false)
	var_11_8:SetAlignment(LUI.Alignment.Center)
	var_11_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_8:SetStartupDelay(1000)
	var_11_8:SetLineHoldTime(400)
	var_11_8:SetAnimMoveTime(1000)
	var_11_8:SetAnimMoveSpeed(150)
	var_11_8:SetEndDelay(1000)
	var_11_8:SetCrossfadeTime(1000)
	var_11_8:SetFadeInTime(300)
	var_11_8:SetFadeOutTime(300)
	var_11_8:SetMaxVisibleLines(1)
	var_11_8:SetShadowMinDistance(-0.2, 0)
	var_11_8:SetShadowMaxDistance(0.2, 0)
	var_11_8:SetShadowRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_11_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 50, _1080p * -50, _1080p * 22, _1080p * 58)
	var_11_0:addElement(var_11_8)

	var_11_0.BuyLabel = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "CurrencyIcon"

	var_11_10:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -72, _1080p * -40, _1080p * -42, _1080p * -10)
	var_11_0:addElement(var_11_10)

	var_11_0.CurrencyIcon = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIText.new()

	var_11_12.id = "Price"

	var_11_12:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_11_12:setText("", 0)
	var_11_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_12:SetAlignment(LUI.Alignment.Left)
	var_11_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -30, _1080p * 66, _1080p * -42, _1080p * -12)
	var_11_0:addElement(var_11_12)

	var_11_0.Price = var_11_12

	local var_11_13
	local var_11_14 = {
		iconString = "LUA_MENU/PAD_ALT1_BUTTON",
		controllerIndex = var_11_1
	}
	local var_11_15 = MenuBuilder.BuildRegisteredType("IconImage", var_11_14)

	var_11_15.id = "ButtonIcon"

	var_11_15:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_11_15:setImage(RegisterMaterial("button_alt1"), 0)
	var_11_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -109, _1080p * -83, _1080p * 27, _1080p * 53)
	var_11_0:addElement(var_11_15)

	var_11_0.ButtonIcon = var_11_15

	local var_11_16
	local var_11_17 = LUI.UIImage.new()

	var_11_17.id = "Glint"

	var_11_17:SetAlpha(0, 0)
	var_11_17:SetZRotation(-60, 0)
	var_11_17:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -200, _1080p * 600, _1080p * -1000, _1080p * 1000)
	var_11_0:addElement(var_11_17)

	var_11_0.Glint = var_11_17

	local var_11_18
	local var_11_19 = LUI.UIImage.new()

	var_11_19.id = "Mask"

	var_11_19:setImage(RegisterMaterial("stencil_mask"), 0)
	var_11_0:addElement(var_11_19)

	var_11_0.Mask = var_11_19

	local var_11_20
	local var_11_21 = LUI.UIText.new()

	var_11_21.id = "OriginalCost"

	var_11_21:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_11_21:SetAlpha(0, 0)
	var_11_21:setText("4000", 0)
	var_11_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_21:SetAlignment(LUI.Alignment.Center)
	var_11_21:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -128, _1080p * -39, _1080p * 78, _1080p * 108)
	var_11_0:addElement(var_11_21)

	var_11_0.OriginalCost = var_11_21

	local var_11_22
	local var_11_23 = LUI.UIImage.new()

	var_11_23.id = "RedLine"

	var_11_23:SetRGBFromInt(16711680, 0)
	var_11_23:SetAlpha(0, 0)
	var_11_23:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -128, _1080p * -39, _1080p * 95, _1080p * 93)
	var_11_0:addElement(var_11_23)

	var_11_0.RedLine = var_11_23

	local function var_11_24()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_24

	local var_11_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleTextOver
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOver", var_11_25)

	local function var_11_26()
		var_11_8:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_26

	local var_11_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleText
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUp", var_11_27)

	local function var_11_28()
		var_11_8:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_28

	local var_11_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverDisabled", var_11_29)

	local function var_11_30()
		var_11_8:AnimateSequence("ButtonOverDisabled")
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_30

	local var_11_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpDisabled", var_11_31)

	local function var_11_32()
		var_11_8:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_32

	local var_11_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("Purchased", var_11_33)

	local var_11_34 = {
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

	var_11_6:RegisterAnimationSequence("Purchased", var_11_34)

	local var_11_35 = {
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

	var_11_8:RegisterAnimationSequence("Purchased", var_11_35)

	local var_11_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Purchased", var_11_36)

	local var_11_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("Purchased", var_11_37)

	local var_11_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_15:RegisterAnimationSequence("Purchased", var_11_38)

	local var_11_39 = {
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

	var_11_19:RegisterAnimationSequence("Purchased", var_11_39)

	local function var_11_40()
		var_11_4:AnimateSequence("Purchased")
		var_11_6:AnimateSequence("Purchased")
		var_11_8:AnimateSequence("Purchased")
		var_11_10:AnimateSequence("Purchased")
		var_11_12:AnimateSequence("Purchased")
		var_11_15:AnimateSequence("Purchased")
		var_11_19:AnimateSequence("Purchased")
	end

	var_11_0._sequences.Purchased = var_11_40

	local var_11_41 = {
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

	var_11_17:RegisterAnimationSequence("GlintAnime", var_11_41)

	local function var_11_42()
		var_11_17:AnimateLoop("GlintAnime")
	end

	var_11_0._sequences.GlintAnime = var_11_42

	local var_11_43 = {
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

	var_11_17:RegisterAnimationSequence("GlintAnimeStop", var_11_43)

	local function var_11_44()
		var_11_17:AnimateSequence("GlintAnimeStop")
	end

	var_11_0._sequences.GlintAnimeStop = var_11_44

	local var_11_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("Free", var_11_45)

	local var_11_46 = {
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

	var_11_6:RegisterAnimationSequence("Free", var_11_46)

	local var_11_47 = {
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

	var_11_8:RegisterAnimationSequence("Free", var_11_47)

	local var_11_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Free", var_11_48)

	local var_11_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("Free", var_11_49)

	local var_11_50 = {
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

	var_11_15:RegisterAnimationSequence("Free", var_11_50)

	local var_11_51 = {
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

	var_11_19:RegisterAnimationSequence("Free", var_11_51)

	local function var_11_52()
		var_11_4:AnimateSequence("Free")
		var_11_6:AnimateSequence("Free")
		var_11_8:AnimateSequence("Free")
		var_11_10:AnimateSequence("Free")
		var_11_12:AnimateSequence("Free")
		var_11_15:AnimateSequence("Free")
		var_11_19:AnimateSequence("Free")
	end

	var_11_0._sequences.Free = var_11_52

	local var_11_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Cash", var_11_53)

	local var_11_54 = {
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

	var_11_12:RegisterAnimationSequence("Cash", var_11_54)

	local function var_11_55()
		var_11_10:AnimateSequence("Cash")
		var_11_12:AnimateSequence("Cash")
	end

	var_11_0._sequences.Cash = var_11_55

	local var_11_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("Sale", var_11_56)

	local var_11_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_23:RegisterAnimationSequence("Sale", var_11_57)

	local function var_11_58()
		var_11_21:AnimateSequence("Sale")
		var_11_23:AnimateSequence("Sale")
	end

	var_11_0._sequences.Sale = var_11_58

	local var_11_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("NoSale", var_11_59)

	local var_11_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_23:RegisterAnimationSequence("NoSale", var_11_60)

	local function var_11_61()
		var_11_21:AnimateSequence("NoSale")
		var_11_23:AnimateSequence("NoSale")
	end

	var_11_0._sequences.NoSale = var_11_61

	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("PurchaseBundleButton", PurchaseBundleButton)
LockTable(_M)
