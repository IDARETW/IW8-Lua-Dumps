module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		assert(arg_1_0._sequences[arg_1_1], "Missing anim " .. arg_1_1)
		WZWIP.AnimateThemeElement(arg_1_0, arg_1_1)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		var_0_0(arg_3_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		var_0_0(arg_4_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_active", function(arg_5_0, arg_5_1)
		var_0_0(arg_5_0, "ButtonUpActive")
	end)
	arg_2_0:addEventHandler("button_over_active", function(arg_6_0, arg_6_1)
		var_0_0(arg_6_0, "ButtonOverActive")
	end)
	arg_2_0:addEventHandler("disable", function(arg_7_0, arg_7_1)
		var_0_0(arg_7_0, "Disabled")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		var_0_0(arg_8_0, "ButtonOverDisabled")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_9_0, arg_9_1)
		var_0_0(arg_9_0, "ButtonUpDisabled")
	end)
	arg_2_0:addEventHandler("disable_active", function(arg_10_0, arg_10_1)
		var_0_0(arg_10_0, "DisabledActive")
	end)
	arg_2_0:addEventHandler("button_disable_active", function(arg_11_0, arg_11_1)
		var_0_0(arg_11_0, "ButtonUpDisabledActive")
	end)
	arg_2_0:addEventHandler("button_over_disable_active", function(arg_12_0, arg_12_1)
		var_0_0(arg_12_0, "ButtonOverDisabledActive")
	end)
	arg_2_0:addEventHandler("active", function(arg_13_0, arg_13_1)
		var_0_0(arg_13_0, "Active")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function GenericDropdownListButton(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_14_0.id = "GenericDropdownListButton"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "GenericButtonBackground"

	var_14_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 5, _1080p * -5)
	var_14_0:addElement(var_14_4)

	var_14_0.GenericButtonBackground = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIStyledText.new()

	var_14_6.id = "Text"

	var_14_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_14_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_14_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_6:SetWordWrap(false)
	var_14_6:SetAlignment(LUI.Alignment.Left)
	var_14_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_14_6:SetOutlineRGBFromInt(0, 0)
	var_14_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -10, _1080p * 10)
	var_14_0:addElement(var_14_6)

	var_14_0.Text = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "Icon"

	var_14_8:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_14_8:SetAlpha(0, 0)
	var_14_8:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_14_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -11, _1080p * -11, _1080p * 11)
	var_14_0:addElement(var_14_8)

	var_14_0.Icon = var_14_8

	local var_14_9
	local var_14_10 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_14_1
	})

	var_14_10.id = "NewItemSmallIcon"

	var_14_10:SetAlpha(0, 0)
	var_14_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -26, _1080p * -18, _1080p * 22, _1080p * 30)
	var_14_0:addElement(var_14_10)

	var_14_0.NewItemSmallIcon = var_14_10

	local function var_14_11()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_11

	local var_14_12
	local var_14_13 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_13)

	local function var_14_14()
		var_14_6:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_14

	local var_14_15
	local var_14_16 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_16)

	local function var_14_17()
		var_14_6:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_17

	local var_14_18
	local var_14_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_14_6:RegisterAnimationSequence("Active", var_14_19)

	local function var_14_20()
		var_14_6:AnimateSequence("Active")
	end

	var_14_0._sequences.Active = var_14_20

	local var_14_21
	local var_14_22 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverActive", var_14_22)

	local function var_14_23()
		var_14_6:AnimateSequence("ButtonOverActive")
	end

	var_14_0._sequences.ButtonOverActive = var_14_23

	local var_14_24
	local var_14_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpActive", var_14_25)

	local function var_14_26()
		var_14_6:AnimateSequence("ButtonUpActive")
	end

	var_14_0._sequences.ButtonUpActive = var_14_26

	local var_14_27
	local var_14_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("Disabled", var_14_28)

	local function var_14_29()
		var_14_6:AnimateSequence("Disabled")
	end

	var_14_0._sequences.Disabled = var_14_29

	local var_14_30
	local var_14_31 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverDisabled", var_14_31)

	local function var_14_32()
		var_14_6:AnimateSequence("ButtonOverDisabled")
	end

	var_14_0._sequences.ButtonOverDisabled = var_14_32

	local var_14_33
	local var_14_34 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpDisabled", var_14_34)

	local function var_14_35()
		var_14_6:AnimateSequence("ButtonUpDisabled")
	end

	var_14_0._sequences.ButtonUpDisabled = var_14_35

	local var_14_36
	local var_14_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_6:RegisterAnimationSequence("DisabledActive", var_14_37)

	local function var_14_38()
		var_14_6:AnimateSequence("DisabledActive")
	end

	var_14_0._sequences.DisabledActive = var_14_38

	local var_14_39
	local var_14_40 = {
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverDisabledActive", var_14_40)

	local function var_14_41()
		var_14_6:AnimateSequence("ButtonOverDisabledActive")
	end

	var_14_0._sequences.ButtonOverDisabledActive = var_14_41

	local var_14_42
	local var_14_43 = {
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpDisabledActive", var_14_43)

	local function var_14_44()
		var_14_6:AnimateSequence("ButtonUpDisabledActive")
	end

	var_14_0._sequences.ButtonUpDisabledActive = var_14_44

	local var_14_45
	local var_14_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -48
		}
	}

	var_14_6:RegisterAnimationSequence("Selected", var_14_46)

	local var_14_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("Selected", var_14_47)

	local function var_14_48()
		var_14_6:AnimateSequence("Selected")
		var_14_8:AnimateSequence("Selected")
	end

	var_14_0._sequences.Selected = var_14_48

	local var_14_49
	local var_14_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_14_6:RegisterAnimationSequence("NotSelected", var_14_50)

	local function var_14_51()
		var_14_6:AnimateSequence("NotSelected")
	end

	var_14_0._sequences.NotSelected = var_14_51

	local var_14_52
	local var_14_53 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpSelected", var_14_53)

	local function var_14_54()
		var_14_6:AnimateSequence("ButtonUpSelected")
	end

	var_14_0._sequences.ButtonUpSelected = var_14_54

	local var_14_55
	local var_14_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		}
	}

	var_14_6:RegisterAnimationSequence("AR", var_14_56)

	local function var_14_57()
		var_14_6:AnimateSequence("AR")
	end

	var_14_0._sequences.AR = var_14_57

	local var_14_58
	local var_14_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 48
		}
	}

	var_14_6:RegisterAnimationSequence("SelectedAR", var_14_59)

	local var_14_60 = {
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
		}
	}

	var_14_8:RegisterAnimationSequence("SelectedAR", var_14_60)

	local function var_14_61()
		var_14_6:AnimateSequence("SelectedAR")
		var_14_8:AnimateSequence("SelectedAR")
	end

	var_14_0._sequences.SelectedAR = var_14_61

	local var_14_62
	local var_14_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("NotificationOn", var_14_63)

	local function var_14_64()
		var_14_10:AnimateSequence("NotificationOn")
	end

	var_14_0._sequences.NotificationOn = var_14_64

	local var_14_65
	local var_14_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("NotificationOff", var_14_66)

	local function var_14_67()
		var_14_10:AnimateSequence("NotificationOff")
	end

	var_14_0._sequences.NotificationOff = var_14_67

	local var_14_68
	local var_14_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
		}
	}

	var_14_10:RegisterAnimationSequence("NotificationOnAR", var_14_69)

	local function var_14_70()
		var_14_10:AnimateSequence("NotificationOnAR")
	end

	var_14_0._sequences.NotificationOnAR = var_14_70

	local var_14_71
	local var_14_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_14_0.GenericButtonBackground.TextGlow
		}
	}

	var_14_4:RegisterAnimationSequence("WZWipSetup", var_14_72)

	local var_14_73 = {
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

	var_14_6:RegisterAnimationSequence("WZWipSetup", var_14_73)

	local function var_14_74()
		var_14_4:AnimateSequence("WZWipSetup")
		var_14_6:AnimateSequence("WZWipSetup")
	end

	var_14_0._sequences.WZWipSetup = var_14_74

	local var_14_75
	local var_14_76 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonOver", var_14_76)

	local function var_14_77()
		var_14_6:AnimateSequence("WZWipButtonOver")
	end

	var_14_0._sequences.WZWipButtonOver = var_14_77

	local var_14_78
	local var_14_79 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonOverActive", var_14_79)

	local function var_14_80()
		var_14_6:AnimateSequence("WZWipButtonOverActive")
	end

	var_14_0._sequences.WZWipButtonOverActive = var_14_80

	local var_14_81
	local var_14_82 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_14_82)

	local function var_14_83()
		var_14_6:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_14_0._sequences.WZWipButtonOverDisabled = var_14_83

	local var_14_84
	local var_14_85 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipNewSequenceName", var_14_85)

	local function var_14_86()
		var_14_6:AnimateSequence("WZWipNewSequenceName")
	end

	var_14_0._sequences.WZWipNewSequenceName = var_14_86

	local var_14_87
	local var_14_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonOverDisabledActive", var_14_88)

	local function var_14_89()
		var_14_6:AnimateSequence("WZWipButtonOverDisabledActive")
	end

	var_14_0._sequences.WZWipButtonOverDisabledActive = var_14_89

	local var_14_90
	local var_14_91 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonUp", var_14_91)

	local function var_14_92()
		var_14_6:AnimateSequence("WZWipButtonUp")
	end

	var_14_0._sequences.WZWipButtonUp = var_14_92

	local var_14_93
	local var_14_94 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonUpActive", var_14_94)

	local function var_14_95()
		var_14_6:AnimateSequence("WZWipButtonUpActive")
	end

	var_14_0._sequences.WZWipButtonUpActive = var_14_95

	local var_14_96
	local var_14_97 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_14_97)

	local function var_14_98()
		var_14_6:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_14_0._sequences.WZWipButtonUpDisabled = var_14_98

	local var_14_99
	local var_14_100 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_14_100)

	local function var_14_101()
		var_14_6:AnimateSequence("WZWipButtonUpDisabledActive")
	end

	var_14_0._sequences.WZWipButtonUpDisabledActive = var_14_101

	local var_14_102
	local var_14_103 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipButtonUpSelected", var_14_103)

	local function var_14_104()
		var_14_6:AnimateSequence("WZWipButtonUpSelected")
	end

	var_14_0._sequences.WZWipButtonUpSelected = var_14_104

	local var_14_105
	local var_14_106 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipDisabled", var_14_106)

	local function var_14_107()
		var_14_6:AnimateSequence("WZWipDisabled")
	end

	var_14_0._sequences.WZWipDisabled = var_14_107

	local var_14_108
	local var_14_109 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipDisabledActive", var_14_109)

	local function var_14_110()
		var_14_6:AnimateSequence("WZWipDisabledActive")
	end

	var_14_0._sequences.WZWipDisabledActive = var_14_110

	local var_14_111
	local var_14_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipSelected", var_14_112)

	local function var_14_113()
		var_14_6:AnimateSequence("WZWipSelected")
	end

	var_14_0._sequences.WZWipSelected = var_14_113

	local var_14_114
	local var_14_115 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipNotSelected", var_14_115)

	local function var_14_116()
		var_14_6:AnimateSequence("WZWipNotSelected")
	end

	var_14_0._sequences.WZWipNotSelected = var_14_116

	local var_14_117
	local var_14_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 48
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("WZWipSelectedAR", var_14_118)

	local var_14_119 = {
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
		}
	}

	var_14_8:RegisterAnimationSequence("WZWipSelectedAR", var_14_119)

	local function var_14_120()
		var_14_6:AnimateSequence("WZWipSelectedAR")
		var_14_8:AnimateSequence("WZWipSelectedAR")
	end

	var_14_0._sequences.WZWipSelectedAR = var_14_120

	PostLoadFunc(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("GenericDropdownListButton", GenericDropdownListButton)
LockTable(_M)
