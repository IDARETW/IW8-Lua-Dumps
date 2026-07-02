module(..., package.seeall)

function PriceButtonSmall(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "PriceButtonSmall"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_4:SetPixelGridEnabled(true)
	var_1_4:SetPixelGridContrast(0.5, 0)
	var_1_4:SetPixelGridBlockWidth(2, 0)
	var_1_4:SetPixelGridBlockHeight(2, 0)
	var_1_4:SetPixelGridGutterWidth(1, 0)
	var_1_4:SetPixelGridGutterHeight(1, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Currency"

	var_1_6:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 30, _1080p * 62, _1080p * -16, _1080p * 16)
	var_1_0:addElement(var_1_6)

	var_1_0.Currency = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Amount"

	var_1_8:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_1_8:setText(ToUpperCase(""), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 70, 0, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_8)

	var_1_0.Amount = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "FreeText"

	var_1_10:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/FREE_BUNDLE")), 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_10:SetTracking(2 * _1080p, 0)
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_10)

	var_1_0.FreeText = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Highlight"

	var_1_12:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_1_12:SetAlpha(0, 0)
	var_1_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_1_12:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_0:addElement(var_1_12)

	var_1_0.Highlight = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "Tab"

	var_1_14:SetRGBFromTable(SWATCHES.Store.PanelDescription, 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_1_0:addElement(var_1_14)

	var_1_0.Tab = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "LowerGlow"

	var_1_16:SetAlpha(0, 0)
	var_1_16.Glow:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_1_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -8, _1080p * 8)
	var_1_0:addElement(var_1_16)

	var_1_0.LowerGlow = var_1_16

	local var_1_17
	local var_1_18 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_18.id = "UpperGlow"

	var_1_18:SetAlpha(0, 0)
	var_1_18.Glow:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_1_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -8, _1080p * 8)
	var_1_0:addElement(var_1_18)

	var_1_0.UpperGlow = var_1_18

	local var_1_19
	local var_1_20 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_21 = LUI.UIBorder.new(var_1_20)

	var_1_21.id = "Lines"

	var_1_21:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_1_21:SetAlpha(0, 0)
	var_1_21:SetBorderThicknessLeft(_1080p * 0, 0)
	var_1_21:SetBorderThicknessRight(_1080p * 0, 0)
	var_1_0:addElement(var_1_21)

	var_1_0.Lines = var_1_21

	local var_1_22
	local var_1_23 = LUI.UIText.new()

	var_1_23.id = "Discount"

	var_1_23:SetAlpha(0, 0)
	var_1_23:setText("", 0)
	var_1_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_23:SetWordWrap(false)
	var_1_23:SetAlignment(LUI.Alignment.Center)
	var_1_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_23:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -92, _1080p * -22, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_23)

	var_1_0.Discount = var_1_23

	local var_1_24
	local var_1_25 = LUI.UIImage.new()

	var_1_25.id = "DiscountLine"

	var_1_25:SetRGBFromInt(16711680, 0)
	var_1_25:SetAlpha(0, 0)
	var_1_25:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -92, _1080p * -22, 0, _1080p * 1)
	var_1_0:addElement(var_1_25)

	var_1_0.DiscountLine = var_1_25

	local function var_1_26()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_26

	local var_1_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_1_4:RegisterAnimationSequence("PriceAndIcon", var_1_27)

	local var_1_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("PriceAndIcon", var_1_28)

	local var_1_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.Description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("PriceAndIcon", var_1_29)

	local var_1_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("PriceAndIcon", var_1_30)

	local var_1_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("PriceAndIcon", var_1_31)

	local var_1_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.PanelDescription
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("PriceAndIcon", var_1_32)

	local var_1_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("PriceAndIcon", var_1_33)

	local var_1_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("PriceAndIcon", var_1_34)

	local var_1_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_21:RegisterAnimationSequence("PriceAndIcon", var_1_35)

	local var_1_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_23:RegisterAnimationSequence("PriceAndIcon", var_1_36)

	local var_1_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_25:RegisterAnimationSequence("PriceAndIcon", var_1_37)

	local function var_1_38()
		var_1_4:AnimateSequence("PriceAndIcon")
		var_1_6:AnimateSequence("PriceAndIcon")
		var_1_8:AnimateSequence("PriceAndIcon")
		var_1_10:AnimateSequence("PriceAndIcon")
		var_1_12:AnimateSequence("PriceAndIcon")
		var_1_14:AnimateSequence("PriceAndIcon")
		var_1_16:AnimateSequence("PriceAndIcon")
		var_1_18:AnimateSequence("PriceAndIcon")
		var_1_21:AnimateSequence("PriceAndIcon")
		var_1_23:AnimateSequence("PriceAndIcon")
		var_1_25:AnimateSequence("PriceAndIcon")
	end

	var_1_0._sequences.PriceAndIcon = var_1_38

	local var_1_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_1_4:RegisterAnimationSequence("Price", var_1_39)

	local var_1_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Price", var_1_40)

	local var_1_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.Description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Price", var_1_41)

	local var_1_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Price", var_1_42)

	local var_1_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Price", var_1_43)

	local var_1_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.PanelDescription
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("Price", var_1_44)

	local var_1_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Price", var_1_45)

	local var_1_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("Price", var_1_46)

	local var_1_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_21:RegisterAnimationSequence("Price", var_1_47)

	local var_1_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_23:RegisterAnimationSequence("Price", var_1_48)

	local var_1_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_25:RegisterAnimationSequence("Price", var_1_49)

	local function var_1_50()
		var_1_4:AnimateSequence("Price")
		var_1_6:AnimateSequence("Price")
		var_1_8:AnimateSequence("Price")
		var_1_10:AnimateSequence("Price")
		var_1_12:AnimateSequence("Price")
		var_1_14:AnimateSequence("Price")
		var_1_16:AnimateSequence("Price")
		var_1_18:AnimateSequence("Price")
		var_1_21:AnimateSequence("Price")
		var_1_23:AnimateSequence("Price")
		var_1_25:AnimateSequence("Price")
	end

	var_1_0._sequences.Price = var_1_50

	local var_1_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("HideBacker", var_1_51)

	local var_1_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		}
	}

	var_1_6:RegisterAnimationSequence("HideBacker", var_1_52)

	local var_1_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_1_8:RegisterAnimationSequence("HideBacker", var_1_53)

	local var_1_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("HideBacker", var_1_54)

	local function var_1_55()
		var_1_4:AnimateSequence("HideBacker")
		var_1_6:AnimateSequence("HideBacker")
		var_1_8:AnimateSequence("HideBacker")
		var_1_14:AnimateSequence("HideBacker")
	end

	var_1_0._sequences.HideBacker = var_1_55

	local var_1_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicatorDark
		}
	}

	var_1_4:RegisterAnimationSequence("Free", var_1_56)

	local var_1_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Free", var_1_57)

	local var_1_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 2 * _1080p
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Free", var_1_58)

	local var_1_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Free", var_1_59)

	local var_1_60 = {
		{
			value = 0.5,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 1400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Free", var_1_60)

	local var_1_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("Free", var_1_61)

	local var_1_62 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Free", var_1_62)

	local var_1_63 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("Free", var_1_63)

	local var_1_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_21:RegisterAnimationSequence("Free", var_1_64)

	local var_1_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_23:RegisterAnimationSequence("Free", var_1_65)

	local var_1_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_25:RegisterAnimationSequence("Free", var_1_66)

	local function var_1_67()
		var_1_4:AnimateLoop("Free")
		var_1_6:AnimateLoop("Free")
		var_1_8:AnimateLoop("Free")
		var_1_10:AnimateLoop("Free")
		var_1_12:AnimateLoop("Free")
		var_1_14:AnimateLoop("Free")
		var_1_16:AnimateLoop("Free")
		var_1_18:AnimateLoop("Free")
		var_1_21:AnimateLoop("Free")
		var_1_23:AnimateLoop("Free")
		var_1_25:AnimateLoop("Free")
	end

	var_1_0._sequences.Free = var_1_67

	local var_1_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_1_4:RegisterAnimationSequence("PriceWithDiscount", var_1_68)

	local var_1_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("PriceWithDiscount", var_1_69)

	local var_1_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.Description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("PriceWithDiscount", var_1_70)

	local var_1_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("PriceWithDiscount", var_1_71)

	local var_1_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("PriceWithDiscount", var_1_72)

	local var_1_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.PanelDescription
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("PriceWithDiscount", var_1_73)

	local var_1_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("PriceWithDiscount", var_1_74)

	local var_1_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("PriceWithDiscount", var_1_75)

	local var_1_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_21:RegisterAnimationSequence("PriceWithDiscount", var_1_76)

	local var_1_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_23:RegisterAnimationSequence("PriceWithDiscount", var_1_77)

	local var_1_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_25:RegisterAnimationSequence("PriceWithDiscount", var_1_78)

	local function var_1_79()
		var_1_4:AnimateSequence("PriceWithDiscount")
		var_1_6:AnimateSequence("PriceWithDiscount")
		var_1_8:AnimateSequence("PriceWithDiscount")
		var_1_10:AnimateSequence("PriceWithDiscount")
		var_1_12:AnimateSequence("PriceWithDiscount")
		var_1_14:AnimateSequence("PriceWithDiscount")
		var_1_16:AnimateSequence("PriceWithDiscount")
		var_1_18:AnimateSequence("PriceWithDiscount")
		var_1_21:AnimateSequence("PriceWithDiscount")
		var_1_23:AnimateSequence("PriceWithDiscount")
		var_1_25:AnimateSequence("PriceWithDiscount")
	end

	var_1_0._sequences.PriceWithDiscount = var_1_79

	return var_1_0
end

MenuBuilder.registerType("PriceButtonSmall", PriceButtonSmall)
LockTable(_M)
