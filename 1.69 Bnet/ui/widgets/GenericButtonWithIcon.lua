module(..., package.seeall)

function GenericButtonWithIcon(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_1_0.id = "GenericButtonWithIcon"
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

	var_1_4.id = "BackgroundDarkener"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BackgroundDarkener = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Background"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Background = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Text"

	var_1_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_8:setText(ToUpperCase(""), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_8:SetStartupDelay(2000)
	var_1_8:SetLineHoldTime(400)
	var_1_8:SetAnimMoveTime(300)
	var_1_8:SetAnimMoveSpeed(50)
	var_1_8:SetEndDelay(1500)
	var_1_8:SetCrossfadeTime(750)
	var_1_8:SetFadeInTime(300)
	var_1_8:SetFadeOutTime(300)
	var_1_8:SetMaxVisibleLines(1)
	var_1_8:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_1_8:SetOutlineRGBFromInt(0, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -13, _1080p * 11)
	var_1_0:addElement(var_1_8)

	var_1_0.Text = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Lock"

	var_1_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_1_0:addElement(var_1_10)

	var_1_0.Lock = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Icon"

	var_1_12:SetRGBFromInt(8489356, 0)
	var_1_12:SetAlpha(0.7, 0)
	var_1_12:setImage(RegisterMaterial("icon_open_new_window_thin"), 0)
	var_1_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -16, _1080p * 16)
	var_1_0:addElement(var_1_12)

	var_1_0.Icon = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "TopSep"

	var_1_14:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_1_14:SetAlpha(0, 0)
	var_1_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 2, _1080p * -1, 0, _1080p * 1)
	var_1_0:addElement(var_1_14)

	var_1_0.TopSep = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "BotSep"

	var_1_16:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_1_16:SetAlpha(0, 0)
	var_1_16:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 2, _1080p * -1, _1080p * -2, _1080p * -3)
	var_1_0:addElement(var_1_16)

	var_1_0.BotSep = var_1_16

	local function var_1_17()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_17

	local var_1_18
	local var_1_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOver", var_1_20)

	local function var_1_21()
		var_1_8:AnimateSequence("ButtonOver")
		var_1_10:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_21

	local var_1_22
	local var_1_23 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_23)

	local var_1_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUp", var_1_24)

	local function var_1_25()
		var_1_8:AnimateSequence("ButtonUp")
		var_1_10:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_25

	local var_1_26
	local var_1_27 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_8:RegisterAnimationSequence("Locked", var_1_27)

	local var_1_28 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Locked", var_1_28)

	local function var_1_29()
		var_1_8:AnimateSequence("Locked")
		var_1_10:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_29

	local var_1_30
	local var_1_31 = {
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

	var_1_8:RegisterAnimationSequence("NewNotification", var_1_31)

	local function var_1_32()
		var_1_8:AnimateSequence("NewNotification")
	end

	var_1_0._sequences.NewNotification = var_1_32

	local var_1_33
	local var_1_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOverDisabled", var_1_34)

	local var_1_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOverDisabled", var_1_35)

	local function var_1_36()
		var_1_8:AnimateSequence("ButtonOverDisabled")
		var_1_10:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_36

	local var_1_37
	local var_1_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUpDisabled", var_1_38)

	local var_1_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUpDisabled", var_1_39)

	local function var_1_40()
		var_1_8:AnimateSequence("ButtonUpDisabled")
		var_1_10:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_40

	local var_1_41
	local var_1_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUpSnap", var_1_42)

	local function var_1_43()
		var_1_8:AnimateSequence("ButtonUpSnap")
	end

	var_1_0._sequences.ButtonUpSnap = var_1_43

	local var_1_44
	local var_1_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_1_45)

	local function var_1_46()
		var_1_8:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_1_0._sequences.ButtonUpDisabledSnap = var_1_46

	local var_1_47
	local var_1_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_1_8:RegisterAnimationSequence("AR", var_1_48)

	local var_1_49 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 36
		}
	}

	var_1_10:RegisterAnimationSequence("AR", var_1_49)

	local function var_1_50()
		var_1_8:AnimateSequence("AR")
		var_1_10:AnimateSequence("AR")
	end

	var_1_0._sequences.AR = var_1_50

	local var_1_51
	local var_1_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("Enabled", var_1_52)

	local var_1_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Enabled", var_1_53)

	local function var_1_54()
		var_1_8:AnimateSequence("Enabled")
		var_1_10:AnimateSequence("Enabled")
	end

	var_1_0._sequences.Enabled = var_1_54

	local var_1_55
	local var_1_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Disabled", var_1_56)

	local var_1_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Disabled", var_1_57)

	local function var_1_58()
		var_1_8:AnimateSequence("Disabled")
		var_1_10:AnimateSequence("Disabled")
	end

	var_1_0._sequences.Disabled = var_1_58

	local var_1_59
	local var_1_60 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipButtonOver", var_1_60)

	local var_1_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipButtonOver", var_1_61)

	local var_1_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipButtonOver", var_1_62)

	local var_1_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipButtonOver", var_1_63)

	local function var_1_64()
		var_1_8:AnimateSequence("WZWipButtonOver")
		var_1_10:AnimateSequence("WZWipButtonOver")
		var_1_14:AnimateSequence("WZWipButtonOver")
		var_1_16:AnimateSequence("WZWipButtonOver")
	end

	var_1_0._sequences.WZWipButtonOver = var_1_64

	local var_1_65
	local var_1_66 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("WZWipButtonUp", var_1_66)

	local var_1_67 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipButtonUp", var_1_67)

	local var_1_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipButtonUp", var_1_68)

	local var_1_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipButtonUp", var_1_69)

	local var_1_70 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipButtonUp", var_1_70)

	local function var_1_71()
		var_1_4:AnimateSequence("WZWipButtonUp")
		var_1_8:AnimateSequence("WZWipButtonUp")
		var_1_10:AnimateSequence("WZWipButtonUp")
		var_1_14:AnimateSequence("WZWipButtonUp")
		var_1_16:AnimateSequence("WZWipButtonUp")
	end

	var_1_0._sequences.WZWipButtonUp = var_1_71

	local var_1_72
	local var_1_73 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("WZWipButtonOverDisabled", var_1_73)

	local var_1_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_1_74)

	local var_1_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_1_75)

	local var_1_76 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_1_76)

	local var_1_77 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipButtonOverDisabled", var_1_77)

	local function var_1_78()
		var_1_4:AnimateSequence("WZWipButtonOverDisabled")
		var_1_8:AnimateSequence("WZWipButtonOverDisabled")
		var_1_10:AnimateSequence("WZWipButtonOverDisabled")
		var_1_14:AnimateSequence("WZWipButtonOverDisabled")
		var_1_16:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_1_0._sequences.WZWipButtonOverDisabled = var_1_78

	local var_1_79
	local var_1_80 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("WZWipButtonUpDisabled", var_1_80)

	local var_1_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_1_81)

	local var_1_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_1_82)

	local var_1_83 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_1_83)

	local var_1_84 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipButtonUpDisabled", var_1_84)

	local function var_1_85()
		var_1_4:AnimateSequence("WZWipButtonUpDisabled")
		var_1_8:AnimateSequence("WZWipButtonUpDisabled")
		var_1_10:AnimateSequence("WZWipButtonUpDisabled")
		var_1_14:AnimateSequence("WZWipButtonUpDisabled")
		var_1_16:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_1_0._sequences.WZWipButtonUpDisabled = var_1_85

	local var_1_86
	local var_1_87 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("WZWipButtonUpSnap", var_1_87)

	local var_1_88 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipButtonUpSnap", var_1_88)

	local var_1_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipButtonUpSnap", var_1_89)

	local var_1_90 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipButtonUpSnap", var_1_90)

	local var_1_91 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipButtonUpSnap", var_1_91)

	local function var_1_92()
		var_1_4:AnimateSequence("WZWipButtonUpSnap")
		var_1_8:AnimateSequence("WZWipButtonUpSnap")
		var_1_10:AnimateSequence("WZWipButtonUpSnap")
		var_1_14:AnimateSequence("WZWipButtonUpSnap")
		var_1_16:AnimateSequence("WZWipButtonUpSnap")
	end

	var_1_0._sequences.WZWipButtonUpSnap = var_1_92

	local var_1_93
	local var_1_94 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("WZWipSetup", var_1_94)

	local var_1_95 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipSetup", var_1_95)

	local var_1_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipSetup", var_1_96)

	local var_1_97 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipSetup", var_1_97)

	local var_1_98 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipSetup", var_1_98)

	local function var_1_99()
		var_1_4:AnimateSequence("WZWipSetup")
		var_1_8:AnimateSequence("WZWipSetup")
		var_1_10:AnimateSequence("WZWipSetup")
		var_1_14:AnimateSequence("WZWipSetup")
		var_1_16:AnimateSequence("WZWipSetup")
	end

	var_1_0._sequences.WZWipSetup = var_1_99

	local var_1_100
	local var_1_101 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_1_101)

	local var_1_102 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_1_102)

	local var_1_103 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_1_103)

	local var_1_104 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_1_104)

	local var_1_105 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_1_105)

	local function var_1_106()
		var_1_4:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_1_8:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_1_10:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_1_14:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_1_16:AnimateSequence("WZWipButtonUpDisabledSnap")
	end

	var_1_0._sequences.WZWipButtonUpDisabledSnap = var_1_106

	local var_1_107
	local var_1_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipEnabled", var_1_108)

	local var_1_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipEnabled", var_1_109)

	local var_1_110 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipEnabled", var_1_110)

	local var_1_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipEnabled", var_1_111)

	local function var_1_112()
		var_1_8:AnimateSequence("WZWipEnabled")
		var_1_10:AnimateSequence("WZWipEnabled")
		var_1_14:AnimateSequence("WZWipEnabled")
		var_1_16:AnimateSequence("WZWipEnabled")
	end

	var_1_0._sequences.WZWipEnabled = var_1_112

	local var_1_113
	local var_1_114 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WZWipDisabled", var_1_114)

	local var_1_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WZWipDisabled", var_1_115)

	local var_1_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("WZWipDisabled", var_1_116)

	local var_1_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("WZWipDisabled", var_1_117)

	local function var_1_118()
		var_1_8:AnimateSequence("WZWipDisabled")
		var_1_10:AnimateSequence("WZWipDisabled")
		var_1_14:AnimateSequence("WZWipDisabled")
		var_1_16:AnimateSequence("WZWipDisabled")
	end

	var_1_0._sequences.WZWipDisabled = var_1_118

	return var_1_0
end

MenuBuilder.registerType("GenericButtonWithIcon", GenericButtonWithIcon)
LockTable(_M)
