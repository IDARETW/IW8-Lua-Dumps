module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function HappyHourAccordionButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_2_0.id = "HappyHourAccordionButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:setUseStencil(true)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "Background"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Text"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetStartupDelay(2000)
	var_2_6:SetLineHoldTime(400)
	var_2_6:SetAnimMoveTime(2000)
	var_2_6:SetAnimMoveSpeed(150)
	var_2_6:SetEndDelay(2000)
	var_2_6:SetCrossfadeTime(1000)
	var_2_6:SetFadeInTime(500)
	var_2_6:SetFadeOutTime(500)
	var_2_6:SetMaxVisibleLines(1)
	var_2_6:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 411, _1080p * -59, _1080p * -29)
	var_2_0:addElement(var_2_6)

	var_2_0.Text = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "Backer"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_2_8:SetAlpha(0, 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_2_0:addElement(var_2_8)

	var_2_0.Backer = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "Lock"

	var_2_10:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_2_10:SetAlpha(0, 0)
	var_2_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_2_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * -15, _1080p * 15)
	var_2_0:addElement(var_2_10)

	var_2_0.Lock = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIStyledText.new()

	var_2_12.id = "Description"

	var_2_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_12:SetAlpha(0, 0)
	var_2_12:setText("", 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 411, _1080p * -23, _1080p * -3)
	var_2_0:addElement(var_2_12)

	var_2_0.Description = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIStyledText.new()

	var_2_14.id = "DisabledText"

	var_2_14:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_2_14:SetAlpha(0, 0)
	var_2_14:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetWordWrap(false)
	var_2_14:SetAlignment(LUI.Alignment.Left)
	var_2_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_14:SetStartupDelay(2000)
	var_2_14:SetLineHoldTime(400)
	var_2_14:SetAnimMoveTime(2000)
	var_2_14:SetAnimMoveSpeed(150)
	var_2_14:SetEndDelay(2000)
	var_2_14:SetCrossfadeTime(1000)
	var_2_14:SetFadeInTime(300)
	var_2_14:SetFadeOutTime(300)
	var_2_14:SetMaxVisibleLines(1)
	var_2_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 45, _1080p * 65)
	var_2_0:addElement(var_2_14)

	var_2_0.DisabledText = var_2_14

	local function var_2_15()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_15

	local var_2_16
	local var_2_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_17)

	local var_2_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonOver", var_2_18)

	local var_2_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonOver", var_2_19)

	local var_2_20 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonOver", var_2_20)

	local var_2_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonOver", var_2_21)

	local function var_2_22()
		var_2_6:AnimateSequence("ButtonOver")
		var_2_8:AnimateSequence("ButtonOver")
		var_2_10:AnimateSequence("ButtonOver")
		var_2_12:AnimateSequence("ButtonOver")
		var_2_14:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_22

	local var_2_23
	local var_2_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_24)

	local var_2_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUp", var_2_25)

	local var_2_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonUp", var_2_26)

	local var_2_27 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonUp", var_2_27)

	local var_2_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonUp", var_2_28)

	local function var_2_29()
		var_2_6:AnimateSequence("ButtonUp")
		var_2_8:AnimateSequence("ButtonUp")
		var_2_10:AnimateSequence("ButtonUp")
		var_2_12:AnimateSequence("ButtonUp")
		var_2_14:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_29

	local var_2_30
	local var_2_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOverDisabled", var_2_31)

	local var_2_32 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonOverDisabled", var_2_32)

	local var_2_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonOverDisabled", var_2_33)

	local var_2_34 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonOverDisabled", var_2_34)

	local var_2_35 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonOverDisabled", var_2_35)

	local function var_2_36()
		var_2_6:AnimateSequence("ButtonOverDisabled")
		var_2_8:AnimateSequence("ButtonOverDisabled")
		var_2_10:AnimateSequence("ButtonOverDisabled")
		var_2_12:AnimateSequence("ButtonOverDisabled")
		var_2_14:AnimateSequence("ButtonOverDisabled")
	end

	var_2_0._sequences.ButtonOverDisabled = var_2_36

	local var_2_37
	local var_2_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpDisabled", var_2_38)

	local var_2_39 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUpDisabled", var_2_39)

	local var_2_40 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonUpDisabled", var_2_40)

	local var_2_41 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonUpDisabled", var_2_41)

	local var_2_42 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonUpDisabled", var_2_42)

	local function var_2_43()
		var_2_6:AnimateSequence("ButtonUpDisabled")
		var_2_8:AnimateSequence("ButtonUpDisabled")
		var_2_10:AnimateSequence("ButtonUpDisabled")
		var_2_12:AnimateSequence("ButtonUpDisabled")
		var_2_14:AnimateSequence("ButtonUpDisabled")
	end

	var_2_0._sequences.ButtonUpDisabled = var_2_43

	local var_2_44
	local var_2_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOverKBM", var_2_45)

	local var_2_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonOverKBM", var_2_46)

	local var_2_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonOverKBM", var_2_47)

	local var_2_48 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonOverKBM", var_2_48)

	local var_2_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonOverKBM", var_2_49)

	local function var_2_50()
		var_2_6:AnimateSequence("ButtonOverKBM")
		var_2_8:AnimateSequence("ButtonOverKBM")
		var_2_10:AnimateSequence("ButtonOverKBM")
		var_2_12:AnimateSequence("ButtonOverKBM")
		var_2_14:AnimateSequence("ButtonOverKBM")
	end

	var_2_0._sequences.ButtonOverKBM = var_2_50

	local var_2_51
	local var_2_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_2_52)

	local var_2_53 = {
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_2_53)

	local var_2_54 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonOverDisabledKBM", var_2_54)

	local var_2_55 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonOverDisabledKBM", var_2_55)

	local var_2_56 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonOverDisabledKBM", var_2_56)

	local function var_2_57()
		var_2_6:AnimateSequence("ButtonOverDisabledKBM")
		var_2_8:AnimateSequence("ButtonOverDisabledKBM")
		var_2_10:AnimateSequence("ButtonOverDisabledKBM")
		var_2_12:AnimateSequence("ButtonOverDisabledKBM")
		var_2_14:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_2_0._sequences.ButtonOverDisabledKBM = var_2_57

	local var_2_58
	local var_2_59 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_2_6:RegisterAnimationSequence("Disable", var_2_59)

	local var_2_60 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("Disable", var_2_60)

	local function var_2_61()
		var_2_6:AnimateSequence("Disable")
		var_2_10:AnimateSequence("Disable")
	end

	var_2_0._sequences.Disable = var_2_61

	local var_2_62
	local var_2_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -424
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -394
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_63)

	local var_2_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		}
	}

	var_2_12:RegisterAnimationSequence("AR", var_2_64)

	local var_2_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 407
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 69
		}
	}

	var_2_14:RegisterAnimationSequence("AR", var_2_65)

	local function var_2_66()
		var_2_10:AnimateSequence("AR")
		var_2_12:AnimateSequence("AR")
		var_2_14:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_66

	local var_2_67
	local var_2_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpKBM", var_2_68)

	local var_2_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUpKBM", var_2_69)

	local var_2_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonUpKBM", var_2_70)

	local var_2_71 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonUpKBM", var_2_71)

	local var_2_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonUpKBM", var_2_72)

	local function var_2_73()
		var_2_6:AnimateSequence("ButtonUpKBM")
		var_2_8:AnimateSequence("ButtonUpKBM")
		var_2_10:AnimateSequence("ButtonUpKBM")
		var_2_12:AnimateSequence("ButtonUpKBM")
		var_2_14:AnimateSequence("ButtonUpKBM")
	end

	var_2_0._sequences.ButtonUpKBM = var_2_73

	local var_2_74
	local var_2_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpDisabledKBM", var_2_75)

	local var_2_76 = {
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUpDisabledKBM", var_2_76)

	local var_2_77 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonUpDisabledKBM", var_2_77)

	local var_2_78 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonUpDisabledKBM", var_2_78)

	local var_2_79 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ButtonUpDisabledKBM", var_2_79)

	local function var_2_80()
		var_2_6:AnimateSequence("ButtonUpDisabledKBM")
		var_2_8:AnimateSequence("ButtonUpDisabledKBM")
		var_2_10:AnimateSequence("ButtonUpDisabledKBM")
		var_2_12:AnimateSequence("ButtonUpDisabledKBM")
		var_2_14:AnimateSequence("ButtonUpDisabledKBM")
	end

	var_2_0._sequences.ButtonUpDisabledKBM = var_2_80

	local var_2_81
	local var_2_82 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOverTitle", var_2_82)

	local function var_2_83()
		var_2_6:AnimateSequence("ButtonOverTitle")
	end

	var_2_0._sequences.ButtonOverTitle = var_2_83

	local var_2_84
	local var_2_85 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -66
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOverTitleAR", var_2_85)

	local function var_2_86()
		var_2_6:AnimateSequence("ButtonOverTitleAR")
	end

	var_2_0._sequences.ButtonOverTitleAR = var_2_86

	local var_2_87
	local var_2_88 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpTitle", var_2_88)

	local function var_2_89()
		var_2_6:AnimateSequence("ButtonUpTitle")
	end

	var_2_0._sequences.ButtonUpTitle = var_2_89

	local var_2_90
	local var_2_91 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -21
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpTitleAR", var_2_91)

	local function var_2_92()
		var_2_6:AnimateSequence("ButtonUpTitleAR")
	end

	var_2_0._sequences.ButtonUpTitleAR = var_2_92

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("HappyHourAccordionButton", HappyHourAccordionButton)
LockTable(_M)
