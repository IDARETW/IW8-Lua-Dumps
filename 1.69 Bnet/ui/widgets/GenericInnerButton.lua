module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0:SetHandleMouseButton(true)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		if not arg_2_0:IsDisabled() then
			WZWIP.AnimateThemeElement(arg_2_0, "GainFocus")
			WZWIP.AnimateThemeElement(arg_2_0.GenericInnerButtonBackground, "GainFocus")
		end
	end)
	arg_1_0:addEventHandler("gamepad_button", function(arg_3_0, arg_3_1)
		if arg_3_1.button == "down" or arg_3_1.button == "up" then
			arg_3_0.Text:processEvent({
				active = true,
				name = "text_edit_complete"
			})
		end
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "LoseFocus")
		WZWIP.AnimateThemeElement(arg_4_0.GenericInnerButtonBackground, "LoseFocus")
	end)
	arg_1_0:addEventHandler("enable", function(arg_5_0, arg_5_1)
		if CONDITIONS.IsWZWipDvarEnabled() then
			ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericInnerButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 54 * _1080p)

	var_6_0.id = "GenericInnerButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericInnerButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "GenericInnerButtonBackground"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.GenericInnerButtonBackground = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "Text"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetWordWrap(false)
	var_6_6:SetAlignment(LUI.Alignment.Center)
	var_6_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_6:SetUseEllipses(ELLIPSES.enabled)
	var_6_6:SetStartupDelay(1000)
	var_6_6:SetLineHoldTime(400)
	var_6_6:SetAnimMoveTime(0)
	var_6_6:SetAnimMoveSpeed(150)
	var_6_6:SetEndDelay(400)
	var_6_6:SetCrossfadeTime(0)
	var_6_6:SetFadeInTime(300)
	var_6_6:SetFadeOutTime(300)
	var_6_6:SetMaxVisibleLines(1)
	var_6_6:SetOutlineRGBFromInt(0, 0)
	var_6_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 5, _1080p * -5, _1080p * -10, _1080p * 10)
	var_6_0:addElement(var_6_6)

	var_6_0.Text = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Pip"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 18, _1080p * 19)
	var_6_0:addElement(var_6_8)

	var_6_0.Pip = var_6_8

	local function var_6_9()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_9

	local var_6_10
	local var_6_11 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_11)

	local var_6_12 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_12)

	local function var_6_13()
		var_6_6:AnimateSequence("ButtonOver")
		var_6_8:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_13

	local var_6_14
	local var_6_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_15)

	local var_6_16 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_16)

	local function var_6_17()
		var_6_6:AnimateSequence("ButtonUp")
		var_6_8:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_17

	local function var_6_18()
		return
	end

	var_6_0._sequences.GainFocus = var_6_18

	local function var_6_19()
		return
	end

	var_6_0._sequences.LoseFocus = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("NotSelected", var_6_21)

	local var_6_22 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("NotSelected", var_6_22)

	local var_6_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("NotSelected", var_6_23)

	local function var_6_24()
		var_6_4:AnimateSequence("NotSelected")
		var_6_6:AnimateSequence("NotSelected")
		var_6_8:AnimateSequence("NotSelected")
	end

	var_6_0._sequences.NotSelected = var_6_24

	local function var_6_25()
		return
	end

	var_6_0._sequences.NoLeftLine = var_6_25

	local var_6_26
	local var_6_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Selected", var_6_27)

	local var_6_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Selected", var_6_28)

	local function var_6_29()
		var_6_6:AnimateSequence("Selected")
		var_6_8:AnimateSequence("Selected")
	end

	var_6_0._sequences.Selected = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			value = 5614798,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOverNotSelected", var_6_31)

	local var_6_32 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOverNotSelected", var_6_32)

	local function var_6_33()
		var_6_6:AnimateSequence("ButtonOverNotSelected")
		var_6_8:AnimateSequence("ButtonOverNotSelected")
	end

	var_6_0._sequences.ButtonOverNotSelected = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.6,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpNotSelected", var_6_35)

	local var_6_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUpNotSelected", var_6_36)

	local function var_6_37()
		var_6_6:AnimateSequence("ButtonUpNotSelected")
		var_6_8:AnimateSequence("ButtonUpNotSelected")
	end

	var_6_0._sequences.ButtonUpNotSelected = var_6_37

	local var_6_38
	local var_6_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpActive", var_6_39)

	local var_6_40 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUpActive", var_6_40)

	local function var_6_41()
		var_6_6:AnimateSequence("ButtonUpActive")
		var_6_8:AnimateSequence("ButtonUpActive")
	end

	var_6_0._sequences.ButtonUpActive = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOverActive", var_6_43)

	local var_6_44 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOverActive", var_6_44)

	local function var_6_45()
		var_6_6:AnimateSequence("ButtonOverActive")
		var_6_8:AnimateSequence("ButtonOverActive")
	end

	var_6_0._sequences.ButtonOverActive = var_6_45

	local var_6_46
	local var_6_47 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Disabled", var_6_47)

	local function var_6_48()
		var_6_6:AnimateSequence("Disabled")
	end

	var_6_0._sequences.Disabled = var_6_48

	local var_6_49
	local var_6_50 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.6,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpActiveNotSelected", var_6_50)

	local var_6_51 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUpActiveNotSelected", var_6_51)

	local function var_6_52()
		var_6_6:AnimateSequence("ButtonUpActiveNotSelected")
		var_6_8:AnimateSequence("ButtonUpActiveNotSelected")
	end

	var_6_0._sequences.ButtonUpActiveNotSelected = var_6_52

	local var_6_53
	local var_6_54 = {
		{
			value = 5614798,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOverActiveNotSelected", var_6_54)

	local var_6_55 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOverActiveNotSelected", var_6_55)

	local function var_6_56()
		var_6_6:AnimateSequence("ButtonOverActiveNotSelected")
		var_6_8:AnimateSequence("ButtonOverActiveNotSelected")
	end

	var_6_0._sequences.ButtonOverActiveNotSelected = var_6_56

	local var_6_57
	local var_6_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_58)

	local function var_6_59()
		var_6_6:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_59

	local var_6_60
	local var_6_61 = {
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

	var_6_6:RegisterAnimationSequence("WZWipSetup", var_6_61)

	local var_6_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipSetup", var_6_62)

	local function var_6_63()
		var_6_6:AnimateSequence("WZWipSetup")
		var_6_8:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_63

	local var_6_64
	local var_6_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOver", var_6_65)

	local var_6_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonOver", var_6_66)

	local function var_6_67()
		var_6_6:AnimateSequence("WZWipButtonOver")
		var_6_8:AnimateSequence("WZWipButtonOver")
	end

	var_6_0._sequences.WZWipButtonOver = var_6_67

	local var_6_68
	local var_6_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOverActive", var_6_69)

	local var_6_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonOverActive", var_6_70)

	local function var_6_71()
		var_6_6:AnimateSequence("WZWipButtonOverActive")
		var_6_8:AnimateSequence("WZWipButtonOverActive")
	end

	var_6_0._sequences.WZWipButtonOverActive = var_6_71

	local var_6_72
	local var_6_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOverActiveNotSelected", var_6_73)

	local var_6_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonOverActiveNotSelected", var_6_74)

	local function var_6_75()
		var_6_6:AnimateSequence("WZWipButtonOverActiveNotSelected")
		var_6_8:AnimateSequence("WZWipButtonOverActiveNotSelected")
	end

	var_6_0._sequences.WZWipButtonOverActiveNotSelected = var_6_75

	local var_6_76
	local var_6_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOverNotSelected", var_6_77)

	local var_6_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonOverNotSelected", var_6_78)

	local function var_6_79()
		var_6_6:AnimateSequence("WZWipButtonOverNotSelected")
		var_6_8:AnimateSequence("WZWipButtonOverNotSelected")
	end

	var_6_0._sequences.WZWipButtonOverNotSelected = var_6_79

	local var_6_80
	local var_6_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.5,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUp", var_6_81)

	local var_6_82 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonUp", var_6_82)

	local function var_6_83()
		var_6_6:AnimateSequence("WZWipButtonUp")
		var_6_8:AnimateSequence("WZWipButtonUp")
	end

	var_6_0._sequences.WZWipButtonUp = var_6_83

	local var_6_84
	local var_6_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.5,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUpActive", var_6_85)

	local var_6_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			value = 0.5,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonUpActive", var_6_86)

	local function var_6_87()
		var_6_6:AnimateSequence("WZWipButtonUpActive")
		var_6_8:AnimateSequence("WZWipButtonUpActive")
	end

	var_6_0._sequences.WZWipButtonUpActive = var_6_87

	local var_6_88
	local var_6_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.6,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUpActiveNotSelected", var_6_89)

	local var_6_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonUpActiveNotSelected", var_6_90)

	local function var_6_91()
		var_6_6:AnimateSequence("WZWipButtonUpActiveNotSelected")
		var_6_8:AnimateSequence("WZWipButtonUpActiveNotSelected")
	end

	var_6_0._sequences.WZWipButtonUpActiveNotSelected = var_6_91

	local var_6_92
	local var_6_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.6,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUpNotSelected", var_6_93)

	local var_6_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonUpNotSelected", var_6_94)

	local function var_6_95()
		var_6_6:AnimateSequence("WZWipButtonUpNotSelected")
		var_6_8:AnimateSequence("WZWipButtonUpNotSelected")
	end

	var_6_0._sequences.WZWipButtonUpNotSelected = var_6_95

	local var_6_96
	local var_6_97 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipDisabled", var_6_97)

	local var_6_98 = {
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipDisabled", var_6_98)

	local function var_6_99()
		var_6_6:AnimateSequence("WZWipDisabled")
		var_6_8:AnimateSequence("WZWipDisabled")
	end

	var_6_0._sequences.WZWipDisabled = var_6_99

	local function var_6_100()
		return
	end

	var_6_0._sequences.WZWipGainFocus = var_6_100

	local function var_6_101()
		return
	end

	var_6_0._sequences.WZWipLoseFocus = var_6_101

	local var_6_102
	local var_6_103 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipSelected", var_6_103)

	local var_6_104 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipSelected", var_6_104)

	local function var_6_105()
		var_6_6:AnimateSequence("WZWipSelected")
		var_6_8:AnimateSequence("WZWipSelected")
	end

	var_6_0._sequences.WZWipSelected = var_6_105

	local var_6_106
	local var_6_107 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipNotSelected", var_6_107)

	local var_6_108 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipNotSelected", var_6_108)

	local var_6_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipNotSelected", var_6_109)

	local function var_6_110()
		var_6_4:AnimateSequence("WZWipNotSelected")
		var_6_6:AnimateSequence("WZWipNotSelected")
		var_6_8:AnimateSequence("WZWipNotSelected")
	end

	var_6_0._sequences.WZWipNotSelected = var_6_110

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GenericInnerButton", GenericInnerButton)
LockTable(_M)
