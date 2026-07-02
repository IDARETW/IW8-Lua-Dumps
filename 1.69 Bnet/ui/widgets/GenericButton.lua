module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Text)
	arg_1_0.Text:setText(arg_1_1)
end

function RefreshAnimation(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0._lastState ~= arg_2_1 then
		arg_2_0._lastState = arg_2_1

		WZWIP.AnimateThemeElement(arg_2_0, arg_2_1, {
			doSnapToState = arg_2_2
		})
	end
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = LUI.Alignment.Left

	arg_3_0:SetNotifyOnLayoutInit(true)
	arg_3_0:addEventHandler("layout_initialized", function(arg_4_0, arg_4_1)
		if arg_4_0.Text then
			var_3_0 = arg_4_0.Text:getHorizontalAlignment()

			arg_4_0.Background:SetupButton(arg_4_0.Text, arg_4_0.Text:getText(), var_3_0)
		end
	end)
	arg_3_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		arg_3_0.isInHoverState = true

		RefreshAnimation(arg_5_0, "ButtonOver")
		arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_0)
	end)
	arg_3_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		arg_3_0.isInHoverState = false

		RefreshAnimation(arg_6_0, "ButtonUp", arg_6_1.snap)
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonUpDisabled", arg_7_1.snap)
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		RefreshAnimation(arg_8_0, "ButtonOverDisabled")
		arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end

	arg_3_0.SetText = var_0_0
end

function GenericButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_9_0.id = "GenericButton"
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

	var_9_4.id = "BackgroundDarkener"

	var_9_4:SetRGBFromInt(0, 0)
	var_9_4:SetAlpha(0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.BackgroundDarkener = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "Background"

	var_9_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_6)

	var_9_0.Background = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "Text"

	var_9_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_8:setText(ToUpperCase(""), 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_8:SetAlignment(LUI.Alignment.Left)
	var_9_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_8:SetStartupDelay(2000)
	var_9_8:SetLineHoldTime(400)
	var_9_8:SetAnimMoveTime(300)
	var_9_8:SetAnimMoveSpeed(50)
	var_9_8:SetEndDelay(1500)
	var_9_8:SetCrossfadeTime(750)
	var_9_8:SetFadeInTime(300)
	var_9_8:SetFadeOutTime(300)
	var_9_8:SetMaxVisibleLines(1)
	var_9_8:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_9_8:SetOutlineRGBFromInt(0, 0)
	var_9_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -13, _1080p * 11)
	var_9_0:addElement(var_9_8)

	var_9_0.Text = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Lock"

	var_9_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_9_10:SetAlpha(0, 0)
	var_9_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_9_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_9_0:addElement(var_9_10)

	var_9_0.Lock = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIImage.new()

	var_9_12.id = "TopSep"

	var_9_12:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_9_12:SetAlpha(0, 0)
	var_9_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 2, _1080p * -1, 0, _1080p * 1)
	var_9_0:addElement(var_9_12)

	var_9_0.TopSep = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIImage.new()

	var_9_14.id = "BotSep"

	var_9_14:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_9_14:SetAlpha(0, 0)
	var_9_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 2, _1080p * -1, _1080p * -2, _1080p * -3)
	var_9_0:addElement(var_9_14)

	var_9_0.BotSep = var_9_14

	local function var_9_15()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_15

	local var_9_16
	local var_9_17 = {
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

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_17)

	local var_9_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOver", var_9_18)

	local function var_9_19()
		var_9_8:AnimateSequence("ButtonOver")
		var_9_10:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_19

	local var_9_20
	local var_9_21 = {
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

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_21)

	local var_9_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUp", var_9_22)

	local function var_9_23()
		var_9_8:AnimateSequence("ButtonUp")
		var_9_10:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_23

	local var_9_24
	local var_9_25 = {
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

	var_9_8:RegisterAnimationSequence("Locked", var_9_25)

	local var_9_26 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Locked", var_9_26)

	local function var_9_27()
		var_9_8:AnimateSequence("Locked")
		var_9_10:AnimateSequence("Locked")
	end

	var_9_0._sequences.Locked = var_9_27

	local var_9_28
	local var_9_29 = {
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

	var_9_8:RegisterAnimationSequence("NewNotification", var_9_29)

	local function var_9_30()
		var_9_8:AnimateSequence("NewNotification")
	end

	var_9_0._sequences.NewNotification = var_9_30

	local var_9_31
	local var_9_32 = {
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

	var_9_8:RegisterAnimationSequence("ButtonOverDisabled", var_9_32)

	local var_9_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOverDisabled", var_9_33)

	local function var_9_34()
		var_9_8:AnimateSequence("ButtonOverDisabled")
		var_9_10:AnimateSequence("ButtonOverDisabled")
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_34

	local var_9_35
	local var_9_36 = {
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

	var_9_8:RegisterAnimationSequence("ButtonUpDisabled", var_9_36)

	local var_9_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUpDisabled", var_9_37)

	local function var_9_38()
		var_9_8:AnimateSequence("ButtonUpDisabled")
		var_9_10:AnimateSequence("ButtonUpDisabled")
	end

	var_9_0._sequences.ButtonUpDisabled = var_9_38

	local var_9_39
	local var_9_40 = {
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

	var_9_8:RegisterAnimationSequence("ButtonUpSnap", var_9_40)

	local function var_9_41()
		var_9_8:AnimateSequence("ButtonUpSnap")
	end

	var_9_0._sequences.ButtonUpSnap = var_9_41

	local var_9_42
	local var_9_43 = {
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

	var_9_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_9_43)

	local function var_9_44()
		var_9_8:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_9_0._sequences.ButtonUpDisabledSnap = var_9_44

	local var_9_45
	local var_9_46 = {
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

	var_9_8:RegisterAnimationSequence("AR", var_9_46)

	local var_9_47 = {
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

	var_9_10:RegisterAnimationSequence("AR", var_9_47)

	local function var_9_48()
		var_9_8:AnimateSequence("AR")
		var_9_10:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_48

	local var_9_49
	local var_9_50 = {
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

	var_9_8:RegisterAnimationSequence("Enabled", var_9_50)

	local var_9_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Enabled", var_9_51)

	local function var_9_52()
		var_9_8:AnimateSequence("Enabled")
		var_9_10:AnimateSequence("Enabled")
	end

	var_9_0._sequences.Enabled = var_9_52

	local var_9_53
	local var_9_54 = {
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

	var_9_8:RegisterAnimationSequence("Disabled", var_9_54)

	local var_9_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Disabled", var_9_55)

	local function var_9_56()
		var_9_8:AnimateSequence("Disabled")
		var_9_10:AnimateSequence("Disabled")
	end

	var_9_0._sequences.Disabled = var_9_56

	local var_9_57
	local var_9_58 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipButtonOver", var_9_58)

	local var_9_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipButtonOver", var_9_59)

	local var_9_60 = {
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

	var_9_12:RegisterAnimationSequence("WZWipButtonOver", var_9_60)

	local var_9_61 = {
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

	var_9_14:RegisterAnimationSequence("WZWipButtonOver", var_9_61)

	local function var_9_62()
		var_9_8:AnimateSequence("WZWipButtonOver")
		var_9_10:AnimateSequence("WZWipButtonOver")
		var_9_12:AnimateSequence("WZWipButtonOver")
		var_9_14:AnimateSequence("WZWipButtonOver")
	end

	var_9_0._sequences.WZWipButtonOver = var_9_62

	local var_9_63
	local var_9_64 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("WZWipButtonUp", var_9_64)

	local var_9_65 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipButtonUp", var_9_65)

	local var_9_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipButtonUp", var_9_66)

	local var_9_67 = {
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

	var_9_12:RegisterAnimationSequence("WZWipButtonUp", var_9_67)

	local var_9_68 = {
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

	var_9_14:RegisterAnimationSequence("WZWipButtonUp", var_9_68)

	local function var_9_69()
		var_9_4:AnimateSequence("WZWipButtonUp")
		var_9_8:AnimateSequence("WZWipButtonUp")
		var_9_10:AnimateSequence("WZWipButtonUp")
		var_9_12:AnimateSequence("WZWipButtonUp")
		var_9_14:AnimateSequence("WZWipButtonUp")
	end

	var_9_0._sequences.WZWipButtonUp = var_9_69

	local var_9_70
	local var_9_71 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_71)

	local var_9_72 = {
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

	var_9_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_72)

	local var_9_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_73)

	local var_9_74 = {
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

	var_9_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_74)

	local var_9_75 = {
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

	var_9_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_75)

	local function var_9_76()
		var_9_4:AnimateSequence("WZWipButtonOverDisabled")
		var_9_8:AnimateSequence("WZWipButtonOverDisabled")
		var_9_10:AnimateSequence("WZWipButtonOverDisabled")
		var_9_12:AnimateSequence("WZWipButtonOverDisabled")
		var_9_14:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_9_0._sequences.WZWipButtonOverDisabled = var_9_76

	local var_9_77
	local var_9_78 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("WZWipButtonUpDisabled", var_9_78)

	local var_9_79 = {
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

	var_9_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_9_79)

	local var_9_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_9_80)

	local var_9_81 = {
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

	var_9_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_9_81)

	local var_9_82 = {
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

	var_9_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_9_82)

	local function var_9_83()
		var_9_4:AnimateSequence("WZWipButtonUpDisabled")
		var_9_8:AnimateSequence("WZWipButtonUpDisabled")
		var_9_10:AnimateSequence("WZWipButtonUpDisabled")
		var_9_12:AnimateSequence("WZWipButtonUpDisabled")
		var_9_14:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_9_0._sequences.WZWipButtonUpDisabled = var_9_83

	local var_9_84
	local var_9_85 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("WZWipButtonUpSnap", var_9_85)

	local var_9_86 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipButtonUpSnap", var_9_86)

	local var_9_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipButtonUpSnap", var_9_87)

	local var_9_88 = {
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

	var_9_12:RegisterAnimationSequence("WZWipButtonUpSnap", var_9_88)

	local var_9_89 = {
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

	var_9_14:RegisterAnimationSequence("WZWipButtonUpSnap", var_9_89)

	local function var_9_90()
		var_9_4:AnimateSequence("WZWipButtonUpSnap")
		var_9_8:AnimateSequence("WZWipButtonUpSnap")
		var_9_10:AnimateSequence("WZWipButtonUpSnap")
		var_9_12:AnimateSequence("WZWipButtonUpSnap")
		var_9_14:AnimateSequence("WZWipButtonUpSnap")
	end

	var_9_0._sequences.WZWipButtonUpSnap = var_9_90

	local var_9_91
	local var_9_92 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("WZWipSetup", var_9_92)

	local var_9_93 = {
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

	var_9_8:RegisterAnimationSequence("WZWipSetup", var_9_93)

	local var_9_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipSetup", var_9_94)

	local var_9_95 = {
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

	var_9_12:RegisterAnimationSequence("WZWipSetup", var_9_95)

	local var_9_96 = {
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

	var_9_14:RegisterAnimationSequence("WZWipSetup", var_9_96)

	local function var_9_97()
		var_9_4:AnimateSequence("WZWipSetup")
		var_9_8:AnimateSequence("WZWipSetup")
		var_9_10:AnimateSequence("WZWipSetup")
		var_9_12:AnimateSequence("WZWipSetup")
		var_9_14:AnimateSequence("WZWipSetup")
	end

	var_9_0._sequences.WZWipSetup = var_9_97

	local var_9_98
	local var_9_99 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_9_99)

	local var_9_100 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_9_100)

	local var_9_101 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_9_101)

	local var_9_102 = {
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

	var_9_12:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_9_102)

	local var_9_103 = {
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

	var_9_14:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_9_103)

	local function var_9_104()
		var_9_4:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_9_8:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_9_10:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_9_12:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_9_14:AnimateSequence("WZWipButtonUpDisabledSnap")
	end

	var_9_0._sequences.WZWipButtonUpDisabledSnap = var_9_104

	local var_9_105
	local var_9_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipEnabled", var_9_106)

	local var_9_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipEnabled", var_9_107)

	local var_9_108 = {
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

	var_9_12:RegisterAnimationSequence("WZWipEnabled", var_9_108)

	local var_9_109 = {
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

	var_9_14:RegisterAnimationSequence("WZWipEnabled", var_9_109)

	local function var_9_110()
		var_9_8:AnimateSequence("WZWipEnabled")
		var_9_10:AnimateSequence("WZWipEnabled")
		var_9_12:AnimateSequence("WZWipEnabled")
		var_9_14:AnimateSequence("WZWipEnabled")
	end

	var_9_0._sequences.WZWipEnabled = var_9_110

	local var_9_111
	local var_9_112 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("WZWipDisabled", var_9_112)

	local var_9_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("WZWipDisabled", var_9_113)

	local var_9_114 = {
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

	var_9_12:RegisterAnimationSequence("WZWipDisabled", var_9_114)

	local var_9_115 = {
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

	var_9_14:RegisterAnimationSequence("WZWipDisabled", var_9_115)

	local function var_9_116()
		var_9_8:AnimateSequence("WZWipDisabled")
		var_9_10:AnimateSequence("WZWipDisabled")
		var_9_12:AnimateSequence("WZWipDisabled")
		var_9_14:AnimateSequence("WZWipDisabled")
	end

	var_9_0._sequences.WZWipDisabled = var_9_116

	PostLoadFunc(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("GenericButton", GenericButton)
LockTable(_M)
