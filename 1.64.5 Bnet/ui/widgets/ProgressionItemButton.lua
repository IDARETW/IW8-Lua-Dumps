module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOverParent")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUpParent")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonOverDisabledParent")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "ButtonOverDisabledParent")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsMagmaGameMode() then
		THEMES.ApplyRandomMaskRotation(arg_1_0, {
			elementToMask = arg_1_0.Background
		})
		ACTIONS.AnimateSequence(arg_1_0, "WZSetup")
	end
end

function ProgressionItemButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 62 * _1080p)

	var_6_0.id = "ProgressionItemButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "Background"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Icon"

	var_6_6:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 56, _1080p * -23, _1080p * 23)
	var_6_0:addElement(var_6_6)

	var_6_0.Icon = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "Selected"

	var_6_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -7, _1080p * -8, _1080p * 8)
	var_6_0:addElement(var_6_8)

	var_6_0.Selected = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "Text"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_10:setText(ToUpperCase(""), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_10:SetStartupDelay(2000)
	var_6_10:SetLineHoldTime(400)
	var_6_10:SetAnimMoveTime(2000)
	var_6_10:SetAnimMoveSpeed(50)
	var_6_10:SetEndDelay(1500)
	var_6_10:SetCrossfadeTime(750)
	var_6_10:SetFadeInTime(300)
	var_6_10:SetFadeOutTime(300)
	var_6_10:SetMaxVisibleLines(1)
	var_6_10:SetOutlineRGBFromInt(0, 0)
	var_6_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 68, _1080p * -60, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_10)

	var_6_0.Text = var_6_10

	local var_6_11

	if not CONDITIONS.IsSplitscreen() then
		local var_6_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
			controllerIndex = var_6_1
		})

		var_6_12.id = "NewItemNotification"

		var_6_12:SetAlpha(0, 0)
		var_6_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -19, _1080p * -11, _1080p * -4, _1080p * 4)
		var_6_0:addElement(var_6_12)

		var_6_0.NewItemNotification = var_6_12
	end

	local var_6_13

	if CONDITIONS.IsMagmaGameMode() then
		var_6_13 = LUI.UIImage.new()
		var_6_13.id = "Mask"

		var_6_13:SetAlpha(0, 0)
		var_6_13:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
		var_6_13:Setup3SliceHorizontalImage(_1080p * 40, 0.11)
		var_6_0:addElement(var_6_13)

		var_6_0.Mask = var_6_13
	end

	local function var_6_14()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_14

	local var_6_15
	local var_6_16 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOverParent", var_6_16)

	local var_6_17 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOverParent", var_6_17)

	local function var_6_18()
		var_6_6:AnimateSequence("ButtonOverParent")
		var_6_10:AnimateSequence("ButtonOverParent")
	end

	var_6_0._sequences.ButtonOverParent = var_6_18

	local var_6_19
	local var_6_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpParent", var_6_20)

	local var_6_21 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUpParent", var_6_21)

	local function var_6_22()
		var_6_6:AnimateSequence("ButtonUpParent")
		var_6_10:AnimateSequence("ButtonUpParent")
	end

	var_6_0._sequences.ButtonUpParent = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_6_6:RegisterAnimationSequence("Disabled", var_6_24)

	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_10:RegisterAnimationSequence("Disabled", var_6_25)

	local function var_6_26()
		var_6_6:AnimateSequence("Disabled")
		var_6_10:AnimateSequence("Disabled")
	end

	var_6_0._sequences.Disabled = var_6_26

	local var_6_27
	local var_6_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_6_6:RegisterAnimationSequence("Enabled", var_6_28)

	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_10:RegisterAnimationSequence("Enabled", var_6_29)

	local function var_6_30()
		var_6_6:AnimateSequence("Enabled")
		var_6_10:AnimateSequence("Enabled")
	end

	var_6_0._sequences.Enabled = var_6_30

	local var_6_31
	local var_6_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		}
	}

	var_6_10:RegisterAnimationSequence("AR", var_6_32)

	local function var_6_33()
		var_6_10:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOverDisabledParent", var_6_35)

	local function var_6_36()
		var_6_10:AnimateSequence("ButtonOverDisabledParent")
	end

	var_6_0._sequences.ButtonOverDisabledParent = var_6_36

	local var_6_37
	local var_6_38 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUpDisabledParent", var_6_38)

	local function var_6_39()
		var_6_10:AnimateSequence("ButtonUpDisabledParent")
	end

	var_6_0._sequences.ButtonUpDisabledParent = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 56
		}
	}

	var_6_6:RegisterAnimationSequence("Icon1x1", var_6_41)

	local function var_6_42()
		var_6_6:AnimateSequence("Icon1x1")
	end

	var_6_0._sequences.Icon1x1 = var_6_42

	local var_6_43
	local var_6_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
		}
	}

	var_6_6:RegisterAnimationSequence("Icon2x1", var_6_44)

	local function var_6_45()
		var_6_6:AnimateSequence("Icon2x1")
	end

	var_6_0._sequences.Icon2x1 = var_6_45

	local var_6_46
	local var_6_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("NoIcon", var_6_47)

	local var_6_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		}
	}

	var_6_10:RegisterAnimationSequence("NoIcon", var_6_48)

	local function var_6_49()
		var_6_6:AnimateSequence("NoIcon")
		var_6_10:AnimateSequence("NoIcon")
	end

	var_6_0._sequences.NoIcon = var_6_49

	local var_6_50
	local var_6_51 = {
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

	var_6_10:RegisterAnimationSequence("WZSetup", var_6_51)

	if CONDITIONS.IsMagmaGameMode() then
		local var_6_52 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_13:RegisterAnimationSequence("WZSetup", var_6_52)
	end

	local function var_6_53()
		var_6_10:AnimateSequence("WZSetup")

		if CONDITIONS.IsMagmaGameMode() then
			var_6_13:AnimateSequence("WZSetup")
		end
	end

	var_6_0._sequences.WZSetup = var_6_53

	local var_6_54
	local var_6_55 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonOverDisabledParent", var_6_55)

	local function var_6_56()
		var_6_10:AnimateSequence("WZWipButtonOverDisabledParent")
	end

	var_6_0._sequences.WZWipButtonOverDisabledParent = var_6_56

	local var_6_57
	local var_6_58 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOverParent", var_6_58)

	local var_6_59 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonOverParent", var_6_59)

	local function var_6_60()
		var_6_6:AnimateSequence("WZWipButtonOverParent")
		var_6_10:AnimateSequence("WZWipButtonOverParent")
	end

	var_6_0._sequences.WZWipButtonOverParent = var_6_60

	local var_6_61
	local var_6_62 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUpParent", var_6_62)

	local var_6_63 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonUpParent", var_6_63)

	local function var_6_64()
		var_6_6:AnimateSequence("WZWipButtonUpParent")
		var_6_10:AnimateSequence("WZWipButtonUpParent")
	end

	var_6_0._sequences.WZWipButtonUpParent = var_6_64

	local var_6_65
	local var_6_66 = {
		{
			value = 0.3,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonUpDisabledParent", var_6_66)

	local function var_6_67()
		var_6_10:AnimateSequence("WZWipButtonUpDisabledParent")
	end

	var_6_0._sequences.WZWipButtonUpDisabledParent = var_6_67

	local var_6_68
	local var_6_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipDisabled", var_6_69)

	local var_6_70 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipDisabled", var_6_70)

	local function var_6_71()
		var_6_6:AnimateSequence("WZWipDisabled")
		var_6_10:AnimateSequence("WZWipDisabled")
	end

	var_6_0._sequences.WZWipDisabled = var_6_71

	local var_6_72
	local var_6_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipEnabled", var_6_73)

	local var_6_74 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipEnabled", var_6_74)

	local function var_6_75()
		var_6_6:AnimateSequence("WZWipEnabled")
		var_6_10:AnimateSequence("WZWipEnabled")
	end

	var_6_0._sequences.WZWipEnabled = var_6_75

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ProgressionItemButton", ProgressionItemButton)
LockTable(_M)
