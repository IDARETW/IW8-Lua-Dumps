module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Text)
	arg_1_0.Text:setText(arg_1_1)
end

function RefreshAnimation(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0._lastState ~= arg_2_1 then
		arg_2_0._lastState = arg_2_1

		if arg_2_2 then
			assert(arg_2_0._sequences and arg_2_0._sequences[arg_2_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_2_0, arg_2_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_2_0, arg_2_1)
		end
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	if arg_3_1 then
		arg_3_0.NewItemNotification:SetAlpha(arg_3_1)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.UpdateNewItemNotification = var_0_1

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		RefreshAnimation(arg_5_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"), arg_6_1.snap)
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled"), arg_7_1.snap)
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		RefreshAnimation(arg_8_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled"))
	end)
	arg_4_0:addEventHandler("disable", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_9_0, WZWIP.CheckForApplyPrependWZWipPrefix("Disabled"))
	end)
	arg_4_0:addEventHandler("enable", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_10_0, WZWIP.CheckForApplyPrependWZWipPrefix("Enabled"))
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	THEMES.ApplyRandomMaskRotation(arg_4_0, {
		elementToMask = arg_4_0.Background
	})

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end

	arg_4_0.SetText = var_0_0
end

function PlaylistButtonSlim(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 50 * _1080p)

	var_11_0.id = "PlaylistButtonSlim"
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

	var_11_4.id = "BackgroundDarkener"

	var_11_4:SetRGBFromInt(0, 0)
	var_11_4:SetAlpha(0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.BackgroundDarkener = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "Background"

	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_6)

	var_11_0.Background = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIStyledText.new()

	var_11_8.id = "Text"

	var_11_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_8:setText(ToUpperCase(""), 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_8:SetAlignment(LUI.Alignment.Left)
	var_11_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_8:SetStartupDelay(1000)
	var_11_8:SetLineHoldTime(400)
	var_11_8:SetAnimMoveTime(2000)
	var_11_8:SetAnimMoveSpeed(150)
	var_11_8:SetEndDelay(2000)
	var_11_8:SetCrossfadeTime(1000)
	var_11_8:SetFadeInTime(300)
	var_11_8:SetFadeOutTime(300)
	var_11_8:SetMaxVisibleLines(1)
	var_11_8:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_11_8:SetOutlineRGBFromInt(0, 0)
	var_11_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -64, _1080p * -15, _1080p * 15)
	var_11_0:addElement(var_11_8)

	var_11_0.Text = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "Lock"

	var_11_10:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_11_10:SetAlpha(0, 0)
	var_11_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_11_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_11_0:addElement(var_11_10)

	var_11_0.Lock = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "NewItemNotification"

	var_11_12:SetAlpha(0, 0)
	var_11_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -49, _1080p * -41, _1080p * -4, _1080p * 4)
	var_11_0:addElement(var_11_12)

	var_11_0.NewItemNotification = var_11_12

	local var_11_13

	if CONDITIONS.IsVanguardRevealed() then
		local var_11_14 = LUI.UIImage.new()

		var_11_14.id = "Mask"

		var_11_14:SetZRotation(180, 0)
		var_11_14:setImage(RegisterMaterial("ui_mp_wz_bkg_button_3"), 0)
		var_11_14:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
		var_11_0:addElement(var_11_14)

		var_11_0.Mask = var_11_14
	end

	local function var_11_15()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_15

	local var_11_16
	local var_11_17 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOver", var_11_17)

	local var_11_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOver", var_11_18)

	local function var_11_19()
		var_11_8:AnimateSequence("ButtonOver")
		var_11_10:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_19

	local var_11_20
	local var_11_21 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUp", var_11_21)

	local function var_11_22()
		var_11_8:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_22

	local var_11_23
	local var_11_24 = {
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

	var_11_8:RegisterAnimationSequence("Locked", var_11_24)

	local var_11_25 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Locked", var_11_25)

	local function var_11_26()
		var_11_8:AnimateSequence("Locked")
		var_11_10:AnimateSequence("Locked")
	end

	var_11_0._sequences.Locked = var_11_26

	local var_11_27
	local var_11_28 = {
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

	var_11_8:RegisterAnimationSequence("NewNotification", var_11_28)

	local function var_11_29()
		var_11_8:AnimateSequence("NewNotification")
	end

	var_11_0._sequences.NewNotification = var_11_29

	local var_11_30
	local var_11_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverDisabled", var_11_31)

	local function var_11_32()
		var_11_8:AnimateSequence("ButtonOverDisabled")
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_32

	local var_11_33
	local var_11_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpDisabled", var_11_34)

	local var_11_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpDisabled", var_11_35)

	local function var_11_36()
		var_11_8:AnimateSequence("ButtonUpDisabled")
		var_11_10:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_36

	local var_11_37
	local var_11_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpSnap", var_11_38)

	local function var_11_39()
		var_11_8:AnimateSequence("ButtonUpSnap")
	end

	var_11_0._sequences.ButtonUpSnap = var_11_39

	local var_11_40
	local var_11_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_11_41)

	local function var_11_42()
		var_11_8:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_11_0._sequences.ButtonUpDisabledSnap = var_11_42

	local var_11_43
	local var_11_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		}
	}

	var_11_8:RegisterAnimationSequence("AR", var_11_44)

	local var_11_45 = {
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

	var_11_10:RegisterAnimationSequence("AR", var_11_45)

	local var_11_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -392
		}
	}

	var_11_12:RegisterAnimationSequence("AR", var_11_46)

	local function var_11_47()
		var_11_8:AnimateSequence("AR")
		var_11_10:AnimateSequence("AR")
		var_11_12:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_47

	local var_11_48
	local var_11_49 = {
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

	var_11_8:RegisterAnimationSequence("Enabled", var_11_49)

	local var_11_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Enabled", var_11_50)

	local function var_11_51()
		var_11_8:AnimateSequence("Enabled")
		var_11_10:AnimateSequence("Enabled")
	end

	var_11_0._sequences.Enabled = var_11_51

	local var_11_52
	local var_11_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_8:RegisterAnimationSequence("Disabled", var_11_53)

	local var_11_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Disabled", var_11_54)

	local function var_11_55()
		var_11_8:AnimateSequence("Disabled")
		var_11_10:AnimateSequence("Disabled")
	end

	var_11_0._sequences.Disabled = var_11_55

	local var_11_56
	local var_11_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -150
		}
	}

	var_11_8:RegisterAnimationSequence("HasMods", var_11_57)

	local function var_11_58()
		var_11_8:AnimateSequence("HasMods")
	end

	var_11_0._sequences.HasMods = var_11_58

	local var_11_59
	local var_11_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 106
		}
	}

	var_11_8:RegisterAnimationSequence("HasModsAR", var_11_60)

	local function var_11_61()
		var_11_8:AnimateSequence("HasModsAR")
	end

	var_11_0._sequences.HasModsAR = var_11_61

	local var_11_62
	local var_11_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipSetup", var_11_63)

	local var_11_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipSetup", var_11_64)

	local function var_11_65()
		var_11_8:AnimateSequence("WZWipSetup")
		var_11_10:AnimateSequence("WZWipSetup")
	end

	var_11_0._sequences.WZWipSetup = var_11_65

	local var_11_66
	local var_11_67 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonOver", var_11_67)

	local var_11_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipButtonOver", var_11_68)

	local function var_11_69()
		var_11_8:AnimateSequence("WZWipButtonOver")
		var_11_10:AnimateSequence("WZWipButtonOver")
	end

	var_11_0._sequences.WZWipButtonOver = var_11_69

	local var_11_70
	local var_11_71 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_71)

	local function var_11_72()
		var_11_8:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_11_0._sequences.WZWipButtonOverDisabled = var_11_72

	local var_11_73
	local var_11_74 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonUp", var_11_74)

	local function var_11_75()
		var_11_8:AnimateSequence("WZWipButtonUp")
	end

	var_11_0._sequences.WZWipButtonUp = var_11_75

	local var_11_76
	local var_11_77 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_77)

	local var_11_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_78)

	local function var_11_79()
		var_11_8:AnimateSequence("WZWipButtonUpDisabled")
		var_11_10:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_11_0._sequences.WZWipButtonUpDisabled = var_11_79

	local var_11_80
	local var_11_81 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_11_81)

	local function var_11_82()
		var_11_8:AnimateSequence("WZWipButtonUpDisabledSnap")
	end

	var_11_0._sequences.WZWipButtonUpDisabledSnap = var_11_82

	local var_11_83
	local var_11_84 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonUpSnap", var_11_84)

	local function var_11_85()
		var_11_8:AnimateSequence("WZWipButtonUpSnap")
	end

	var_11_0._sequences.WZWipButtonUpSnap = var_11_85

	local var_11_86
	local var_11_87 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipDisabled", var_11_87)

	local var_11_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipDisabled", var_11_88)

	local function var_11_89()
		var_11_8:AnimateSequence("WZWipDisabled")
		var_11_10:AnimateSequence("WZWipDisabled")
	end

	var_11_0._sequences.WZWipDisabled = var_11_89

	local var_11_90
	local var_11_91 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipEnabled", var_11_91)

	local var_11_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipEnabled", var_11_92)

	local function var_11_93()
		var_11_8:AnimateSequence("WZWipEnabled")
		var_11_10:AnimateSequence("WZWipEnabled")
	end

	var_11_0._sequences.WZWipEnabled = var_11_93

	local var_11_94
	local var_11_95 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipLocked", var_11_95)

	local var_11_96 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipLocked", var_11_96)

	local function var_11_97()
		var_11_8:AnimateSequence("WZWipLocked")
		var_11_10:AnimateSequence("WZWipLocked")
	end

	var_11_0._sequences.WZWipLocked = var_11_97

	local var_11_98
	local var_11_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46.4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_11_8:RegisterAnimationSequence("ARIcons1", var_11_99)

	local var_11_100 = {
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

	var_11_10:RegisterAnimationSequence("ARIcons1", var_11_100)

	local var_11_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -392
		}
	}

	var_11_12:RegisterAnimationSequence("ARIcons1", var_11_101)

	local function var_11_102()
		var_11_8:AnimateSequence("ARIcons1")
		var_11_10:AnimateSequence("ARIcons1")
		var_11_12:AnimateSequence("ARIcons1")
	end

	var_11_0._sequences.ARIcons1 = var_11_102

	local var_11_103
	local var_11_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			value = 0.19,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_11_8:RegisterAnimationSequence("ARIcons2", var_11_104)

	local var_11_105 = {
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

	var_11_10:RegisterAnimationSequence("ARIcons2", var_11_105)

	local var_11_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -392
		}
	}

	var_11_12:RegisterAnimationSequence("ARIcons2", var_11_106)

	local function var_11_107()
		var_11_8:AnimateSequence("ARIcons2")
		var_11_10:AnimateSequence("ARIcons2")
		var_11_12:AnimateSequence("ARIcons2")
	end

	var_11_0._sequences.ARIcons2 = var_11_107

	local var_11_108
	local var_11_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			value = 0.29,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_11_8:RegisterAnimationSequence("ARIcons3", var_11_109)

	local var_11_110 = {
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

	var_11_10:RegisterAnimationSequence("ARIcons3", var_11_110)

	local var_11_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -392
		}
	}

	var_11_12:RegisterAnimationSequence("ARIcons3", var_11_111)

	local function var_11_112()
		var_11_8:AnimateSequence("ARIcons3")
		var_11_10:AnimateSequence("ARIcons3")
		var_11_12:AnimateSequence("ARIcons3")
	end

	var_11_0._sequences.ARIcons3 = var_11_112

	PostLoadFunc(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("PlaylistButtonSlim", PlaylistButtonSlim)
LockTable(_M)
