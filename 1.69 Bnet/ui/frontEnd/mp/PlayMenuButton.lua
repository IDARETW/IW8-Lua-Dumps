module(..., package.seeall)

local var_0_0 = 410 * _1080p
local var_0_1 = 350 * _1080p
local var_0_2 = 70 * _1080p
local var_0_3 = 40 * _1080p

local function var_0_4(arg_1_0, arg_1_1)
	arg_1_0._alphaValue = arg_1_1

	arg_1_0.NewItemNotification:UpdateAlpha(arg_1_1)
end

local function var_0_5(arg_2_0)
	arg_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
	arg_2_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))

	if IsLanguageArabic() then
		arg_2_0.Text:SetLeft(var_0_2, 150)
	else
		arg_2_0.Text:SetRight(var_0_0, 150)
	end
end

local function var_0_6(arg_3_0)
	arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
	arg_3_0.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))

	if IsLanguageArabic() then
		arg_3_0.Text:SetLeft(var_0_2, 150)
	elseif arg_3_0._disabled or arg_3_0._minRightOverrideDisable then
		arg_3_0.Text:SetRight(arg_3_0._minRight, 150)
	else
		arg_3_0.Text:SetRight(var_0_0, 150)
	end
end

local function var_0_7(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._minRight = arg_4_1
	arg_4_0._minRightOverrideDisable = arg_4_2

	if not IsLanguageArabic() then
		arg_4_0.Text:SetRight(arg_4_0._minRight, 0)
	end
end

local function var_0_8(arg_5_0)
	arg_5_0.CheckBox:SetAlpha(1)

	var_0_0 = 360 * _1080p

	if not IsLanguageArabic() then
		arg_5_0.Text:SetRight(var_0_0, 0)
	end
end

local function var_0_9(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.Expand = var_0_5
	arg_6_0.Contract = var_0_6
	arg_6_0.SetMinTextRight = var_0_7
	arg_6_0.UpdateNewItemNotification = var_0_4
	arg_6_0.SetupCheckbox = var_0_8
	arg_6_0._minRight = IsLanguageChinese() and 275 or 380
	arg_6_0._minRightOverrideDisable = false
	arg_6_0._disabled = false
	arg_6_0._alphaValue = arg_6_0.NewItemNotification:GetAlpha()

	var_0_6(arg_6_0)
	arg_6_0:addEventHandler("disable", function(arg_7_0, arg_7_1)
		WZWIP.AnimateThemeElement(arg_7_0, "Disable")

		arg_7_0._disabled = true
	end)
	arg_6_0:addEventHandler("enable", function(arg_8_0, arg_8_1)
		arg_8_0._disabled = false
	end)
	arg_6_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not LUI.IsLastInputMouseNavigation(arg_6_1) then
			var_0_5(arg_9_0)
		end

		WZWIP.AnimateThemeElement(arg_9_0, LUI.IsLastInputMouseNavigation(arg_6_1) and "ButtonOverKBM" or "ButtonOver")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			arg_9_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		end
	end)
	arg_6_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		var_0_6(arg_10_0)
		WZWIP.AnimateThemeElement(arg_10_0, LUI.IsLastInputMouseNavigation(arg_6_1) and "ButtonUpKBM" or "ButtonUp")
		arg_10_0.NewItemNotification:UpdateAlpha(arg_10_0._alphaValue and arg_10_0._alphaValue or 0)
	end)
	arg_6_0:addEventHandler("button_over_disable", function(arg_11_0, arg_11_1)
		if not LUI.IsLastInputMouseNavigation(arg_6_1) then
			var_0_5(arg_11_0)
		end

		WZWIP.AnimateThemeElement(arg_11_0, LUI.IsLastInputMouseNavigation(arg_6_1) and "ButtonOverDisabledKBM" or "ButtonOverDisabled")
	end)
	arg_6_0:addEventHandler("button_disable", function(arg_12_0, arg_12_1)
		var_0_6(arg_12_0)
		WZWIP.AnimateThemeElement(arg_12_0, "ButtonUpDisabled")
		arg_12_0.NewItemNotification:SetAlpha(0)
	end)

	if IsLanguageTraditionalChinese() then
		ACTIONS.AnimateSequence(arg_6_0, "CHT")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
		arg_6_0.Text:SetRight(var_0_1, 0)
		arg_6_0.Description:SetRight(var_0_1, 150)
	end

	THEMES.ApplyRandomMaskRotation(arg_6_0)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
	end
end

function PlayMenuButton(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIButton.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_13_0.id = "PlayMenuButton"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0

	var_13_0:setUseStencil(true)

	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "Background"

	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIStyledText.new()

	var_13_6.id = "Text"

	var_13_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_13_6:setText("", 0)
	var_13_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_6:SetWordWrap(false)
	var_13_6:SetAlignment(LUI.Alignment.Left)
	var_13_6:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_13_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_6:SetStartupDelay(2000)
	var_13_6:SetLineHoldTime(400)
	var_13_6:SetAnimMoveTime(2000)
	var_13_6:SetAnimMoveSpeed(150)
	var_13_6:SetEndDelay(2000)
	var_13_6:SetCrossfadeTime(1000)
	var_13_6:SetFadeInTime(500)
	var_13_6:SetFadeOutTime(500)
	var_13_6:SetMaxVisibleLines(1)
	var_13_6:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 350, _1080p * -15, _1080p * 15)
	var_13_0:addElement(var_13_6)

	var_13_0.Text = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIImage.new()

	var_13_8.id = "Backer"

	var_13_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_13_8:SetAlpha(0, 0)
	var_13_8:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_13_0:addElement(var_13_8)

	var_13_0.Backer = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIImage.new()

	var_13_10.id = "Lock"

	var_13_10:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_13_10:SetAlpha(0, 0)
	var_13_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_13_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * -15, _1080p * 15)
	var_13_0:addElement(var_13_10)

	var_13_0.Lock = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIStyledText.new()

	var_13_12.id = "Description"

	var_13_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_13_12:SetAlpha(0, 0)
	var_13_12:setText("", 0)
	var_13_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_12:SetAlignment(LUI.Alignment.Left)
	var_13_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 396, _1080p * -28, _1080p * -8)
	var_13_0:addElement(var_13_12)

	var_13_0.Description = var_13_12

	local var_13_13
	local var_13_14 = LUI.UIStyledText.new()

	var_13_14.id = "DisabledText"

	var_13_14:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_13_14:SetAlpha(0, 0)
	var_13_14:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_13_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_14:SetWordWrap(false)
	var_13_14:SetAlignment(LUI.Alignment.Left)
	var_13_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_14:SetStartupDelay(2000)
	var_13_14:SetLineHoldTime(400)
	var_13_14:SetAnimMoveTime(2000)
	var_13_14:SetAnimMoveSpeed(150)
	var_13_14:SetEndDelay(2000)
	var_13_14:SetCrossfadeTime(1000)
	var_13_14:SetFadeInTime(300)
	var_13_14:SetFadeOutTime(300)
	var_13_14:SetMaxVisibleLines(1)
	var_13_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 45, _1080p * 65)
	var_13_0:addElement(var_13_14)

	var_13_0.DisabledText = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "NewItemNotification"

	var_13_16:SetAlpha(0, 0)
	var_13_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -24, _1080p * -16, _1080p * -4, _1080p * 4)
	var_13_0:addElement(var_13_16)

	var_13_0.NewItemNotification = var_13_16

	local var_13_17
	local var_13_18 = LUI.UIImage.new()

	var_13_18.id = "RestrictionWarning"

	var_13_18:SetAlpha(0, 0)
	var_13_18:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_13_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 183, _1080p * 213, _1080p * -15, _1080p * 15)
	var_13_0:addElement(var_13_18)

	var_13_0.RestrictionWarning = var_13_18

	local var_13_19
	local var_13_20 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_13_1
	})

	var_13_20.id = "CheckBox"

	var_13_20:SetAlpha(0, 0)
	var_13_20.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_13_20:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -52, _1080p * -16, _1080p * -18, _1080p * 18)
	var_13_0:addElement(var_13_20)

	var_13_0.CheckBox = var_13_20

	local var_13_21

	if CONDITIONS.IsVanguardRevealed() then
		var_13_21 = LUI.UIImage.new()
		var_13_21.id = "Mask"

		var_13_21:SetAlpha(0, 0)
		var_13_21:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
		var_13_0:addElement(var_13_21)

		var_13_0.Mask = var_13_21
	end

	local function var_13_22()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_22

	local var_13_23
	local var_13_24 = {
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
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOver", var_13_24)

	local var_13_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOver", var_13_25)

	local var_13_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOver", var_13_26)

	local var_13_27 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOver", var_13_27)

	local var_13_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOver", var_13_28)

	local var_13_29 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_13_16:RegisterAnimationSequence("ButtonOver", var_13_29)

	local var_13_30 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -62
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_13_20:RegisterAnimationSequence("ButtonOver", var_13_30)

	local function var_13_31()
		var_13_6:AnimateSequence("ButtonOver")
		var_13_8:AnimateSequence("ButtonOver")
		var_13_10:AnimateSequence("ButtonOver")
		var_13_12:AnimateSequence("ButtonOver")
		var_13_14:AnimateSequence("ButtonOver")
		var_13_16:AnimateSequence("ButtonOver")
		var_13_20:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_31

	local var_13_32
	local var_13_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
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
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUp", var_13_33)

	local var_13_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUp", var_13_34)

	local var_13_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUp", var_13_35)

	local var_13_36 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUp", var_13_36)

	local var_13_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUp", var_13_37)

	local var_13_38 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("ButtonUp", var_13_38)

	local var_13_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("ButtonUp", var_13_39)

	local function var_13_40()
		var_13_6:AnimateSequence("ButtonUp")
		var_13_8:AnimateSequence("ButtonUp")
		var_13_10:AnimateSequence("ButtonUp")
		var_13_12:AnimateSequence("ButtonUp")
		var_13_14:AnimateSequence("ButtonUp")
		var_13_16:AnimateSequence("ButtonUp")
		var_13_20:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_40

	local var_13_41
	local var_13_42 = {
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

	var_13_6:RegisterAnimationSequence("ButtonOverDisabled", var_13_42)

	local var_13_43 = {
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

	var_13_8:RegisterAnimationSequence("ButtonOverDisabled", var_13_43)

	local var_13_44 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverDisabled", var_13_44)

	local var_13_45 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOverDisabled", var_13_45)

	local var_13_46 = {
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

	var_13_14:RegisterAnimationSequence("ButtonOverDisabled", var_13_46)

	local var_13_47 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("ButtonOverDisabled", var_13_47)

	local var_13_48 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -62
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_13_20:RegisterAnimationSequence("ButtonOverDisabled", var_13_48)

	local function var_13_49()
		var_13_6:AnimateSequence("ButtonOverDisabled")
		var_13_8:AnimateSequence("ButtonOverDisabled")
		var_13_10:AnimateSequence("ButtonOverDisabled")
		var_13_12:AnimateSequence("ButtonOverDisabled")
		var_13_14:AnimateSequence("ButtonOverDisabled")
		var_13_16:AnimateSequence("ButtonOverDisabled")
		var_13_20:AnimateSequence("ButtonOverDisabled")
	end

	var_13_0._sequences.ButtonOverDisabled = var_13_49

	local var_13_50
	local var_13_51 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
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
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpDisabled", var_13_51)

	local var_13_52 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpDisabled", var_13_52)

	local var_13_53 = {
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

	var_13_10:RegisterAnimationSequence("ButtonUpDisabled", var_13_53)

	local var_13_54 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUpDisabled", var_13_54)

	local var_13_55 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUpDisabled", var_13_55)

	local var_13_56 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("ButtonUpDisabled", var_13_56)

	local var_13_57 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("ButtonUpDisabled", var_13_57)

	local function var_13_58()
		var_13_6:AnimateSequence("ButtonUpDisabled")
		var_13_8:AnimateSequence("ButtonUpDisabled")
		var_13_10:AnimateSequence("ButtonUpDisabled")
		var_13_12:AnimateSequence("ButtonUpDisabled")
		var_13_14:AnimateSequence("ButtonUpDisabled")
		var_13_16:AnimateSequence("ButtonUpDisabled")
		var_13_20:AnimateSequence("ButtonUpDisabled")
	end

	var_13_0._sequences.ButtonUpDisabled = var_13_58

	local var_13_59
	local var_13_60 = {
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverKBM", var_13_60)

	local var_13_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverKBM", var_13_61)

	local var_13_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverKBM", var_13_62)

	local var_13_63 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOverKBM", var_13_63)

	local var_13_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOverKBM", var_13_64)

	local var_13_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("ButtonOverKBM", var_13_65)

	local var_13_66 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("ButtonOverKBM", var_13_66)

	local function var_13_67()
		var_13_6:AnimateSequence("ButtonOverKBM")
		var_13_8:AnimateSequence("ButtonOverKBM")
		var_13_10:AnimateSequence("ButtonOverKBM")
		var_13_12:AnimateSequence("ButtonOverKBM")
		var_13_14:AnimateSequence("ButtonOverKBM")
		var_13_16:AnimateSequence("ButtonOverKBM")
		var_13_20:AnimateSequence("ButtonOverKBM")
	end

	var_13_0._sequences.ButtonOverKBM = var_13_67

	local var_13_68
	local var_13_69 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
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

	var_13_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_13_69)

	local var_13_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_13_70)

	local var_13_71 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOverDisabledKBM", var_13_71)

	local var_13_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOverDisabledKBM", var_13_72)

	local var_13_73 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("ButtonOverDisabledKBM", var_13_73)

	local var_13_74 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("ButtonOverDisabledKBM", var_13_74)

	local function var_13_75()
		var_13_6:AnimateSequence("ButtonOverDisabledKBM")
		var_13_8:AnimateSequence("ButtonOverDisabledKBM")
		var_13_12:AnimateSequence("ButtonOverDisabledKBM")
		var_13_14:AnimateSequence("ButtonOverDisabledKBM")
		var_13_16:AnimateSequence("ButtonOverDisabledKBM")
		var_13_20:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_13_0._sequences.ButtonOverDisabledKBM = var_13_75

	local var_13_76
	local var_13_77 = {
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

	var_13_6:RegisterAnimationSequence("Disable", var_13_77)

	local var_13_78 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("Disable", var_13_78)

	local var_13_79 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("Disable", var_13_79)

	local function var_13_80()
		var_13_6:AnimateSequence("Disable")
		var_13_10:AnimateSequence("Disable")
		var_13_16:AnimateSequence("Disable")
	end

	var_13_0._sequences.Disable = var_13_80

	local var_13_81
	local var_13_82 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 349
		}
	}

	var_13_6:RegisterAnimationSequence("AR", var_13_82)

	local var_13_83 = {
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

	var_13_10:RegisterAnimationSequence("AR", var_13_83)

	local var_13_84 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 314
		}
	}

	var_13_12:RegisterAnimationSequence("AR", var_13_84)

	local var_13_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 407
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 65
		}
	}

	var_13_14:RegisterAnimationSequence("AR", var_13_85)

	local var_13_86 = {
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
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 24
		}
	}

	var_13_16:RegisterAnimationSequence("AR", var_13_86)

	local var_13_87 = {
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
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 48
		}
	}

	var_13_20:RegisterAnimationSequence("AR", var_13_87)

	local function var_13_88()
		var_13_6:AnimateSequence("AR")
		var_13_10:AnimateSequence("AR")
		var_13_12:AnimateSequence("AR")
		var_13_14:AnimateSequence("AR")
		var_13_16:AnimateSequence("AR")
		var_13_20:AnimateSequence("AR")
	end

	var_13_0._sequences.AR = var_13_88

	local var_13_89
	local var_13_90 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 350
		}
	}

	var_13_6:RegisterAnimationSequence("CHT", var_13_90)

	local var_13_91 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 366
		}
	}

	var_13_12:RegisterAnimationSequence("CHT", var_13_91)

	local function var_13_92()
		var_13_6:AnimateSequence("CHT")
		var_13_12:AnimateSequence("CHT")
	end

	var_13_0._sequences.CHT = var_13_92

	local var_13_93
	local var_13_94 = {
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpKBM", var_13_94)

	local var_13_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpKBM", var_13_95)

	local var_13_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpKBM", var_13_96)

	local var_13_97 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUpKBM", var_13_97)

	local var_13_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUpKBM", var_13_98)

	local var_13_99 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("ButtonUpKBM", var_13_99)

	local var_13_100 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("ButtonUpKBM", var_13_100)

	local function var_13_101()
		var_13_6:AnimateSequence("ButtonUpKBM")
		var_13_8:AnimateSequence("ButtonUpKBM")
		var_13_10:AnimateSequence("ButtonUpKBM")
		var_13_12:AnimateSequence("ButtonUpKBM")
		var_13_14:AnimateSequence("ButtonUpKBM")
		var_13_16:AnimateSequence("ButtonUpKBM")
		var_13_20:AnimateSequence("ButtonUpKBM")
	end

	var_13_0._sequences.ButtonUpKBM = var_13_101

	local var_13_102
	local var_13_103 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_18:RegisterAnimationSequence("RestrictionOn", var_13_103)

	local function var_13_104()
		var_13_18:AnimateSequence("RestrictionOn")
	end

	var_13_0._sequences.RestrictionOn = var_13_104

	local var_13_105
	local var_13_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_18:RegisterAnimationSequence("RestrictionOff", var_13_106)

	local function var_13_107()
		var_13_18:AnimateSequence("RestrictionOff")
	end

	var_13_0._sequences.RestrictionOff = var_13_107

	local var_13_108
	local var_13_109 = {
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

	var_13_6:RegisterAnimationSequence("WZWipSetup", var_13_109)

	local var_13_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("WZWipSetup", var_13_110)

	local var_13_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		}
	}

	var_13_10:RegisterAnimationSequence("WZWipSetup", var_13_111)

	if CONDITIONS.IsVanguardRevealed() then
		local var_13_112 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_21:RegisterAnimationSequence("WZWipSetup", var_13_112)
	end

	local function var_13_113()
		var_13_6:AnimateSequence("WZWipSetup")
		var_13_8:AnimateSequence("WZWipSetup")
		var_13_10:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsVanguardRevealed() then
			var_13_21:AnimateSequence("WZWipSetup")
		end
	end

	var_13_0._sequences.WZWipSetup = var_13_113

	local var_13_114
	local var_13_115 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
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
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("WZWipButtonOver", var_13_115)

	local var_13_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("WZWipButtonOver", var_13_116)

	local var_13_117 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("WZWipButtonOver", var_13_117)

	local var_13_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("WZWipButtonOver", var_13_118)

	local var_13_119 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_13_16:RegisterAnimationSequence("WZWipButtonOver", var_13_119)

	local var_13_120 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -62
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_13_20:RegisterAnimationSequence("WZWipButtonOver", var_13_120)

	local function var_13_121()
		var_13_6:AnimateSequence("WZWipButtonOver")
		var_13_10:AnimateSequence("WZWipButtonOver")
		var_13_12:AnimateSequence("WZWipButtonOver")
		var_13_14:AnimateSequence("WZWipButtonOver")
		var_13_16:AnimateSequence("WZWipButtonOver")
		var_13_20:AnimateSequence("WZWipButtonOver")
	end

	var_13_0._sequences.WZWipButtonOver = var_13_121

	local var_13_122
	local var_13_123 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_123)

	local var_13_124 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_13_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_124)

	local var_13_125 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_125)

	local var_13_126 = {
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

	var_13_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_126)

	local var_13_127 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_127)

	local var_13_128 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -62
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_13_20:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_128)

	local function var_13_129()
		var_13_6:AnimateSequence("WZWipButtonOverDisabled")
		var_13_10:AnimateSequence("WZWipButtonOverDisabled")
		var_13_12:AnimateSequence("WZWipButtonOverDisabled")
		var_13_14:AnimateSequence("WZWipButtonOverDisabled")
		var_13_16:AnimateSequence("WZWipButtonOverDisabled")
		var_13_20:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_13_0._sequences.WZWipButtonOverDisabled = var_13_129

	local var_13_130
	local var_13_131 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("WZWipButtonOverKBM", var_13_131)

	local var_13_132 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("WZWipButtonOverKBM", var_13_132)

	local var_13_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("WZWipButtonOverKBM", var_13_133)

	local var_13_134 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("WZWipButtonOverKBM", var_13_134)

	local var_13_135 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("WZWipButtonOverKBM", var_13_135)

	local function var_13_136()
		var_13_6:AnimateSequence("WZWipButtonOverKBM")
		var_13_12:AnimateSequence("WZWipButtonOverKBM")
		var_13_14:AnimateSequence("WZWipButtonOverKBM")
		var_13_16:AnimateSequence("WZWipButtonOverKBM")
		var_13_20:AnimateSequence("WZWipButtonOverKBM")
	end

	var_13_0._sequences.WZWipButtonOverKBM = var_13_136

	local var_13_137
	local var_13_138 = {
		{
			value = 0.1,
			duration = 0,
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
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("WZWipButtonOverDisabledKBM", var_13_138)

	local var_13_139 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("WZWipButtonOverDisabledKBM", var_13_139)

	local var_13_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("WZWipButtonOverDisabledKBM", var_13_140)

	local var_13_141 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("WZWipButtonOverDisabledKBM", var_13_141)

	local var_13_142 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("WZWipButtonOverDisabledKBM", var_13_142)

	local function var_13_143()
		var_13_6:AnimateSequence("WZWipButtonOverDisabledKBM")
		var_13_12:AnimateSequence("WZWipButtonOverDisabledKBM")
		var_13_14:AnimateSequence("WZWipButtonOverDisabledKBM")
		var_13_16:AnimateSequence("WZWipButtonOverDisabledKBM")
		var_13_20:AnimateSequence("WZWipButtonOverDisabledKBM")
	end

	var_13_0._sequences.WZWipButtonOverDisabledKBM = var_13_143

	local var_13_144
	local var_13_145 = {
		{
			value = 1,
			duration = 0,
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
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("WZWipButtonUp", var_13_145)

	local var_13_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("WZWipButtonUp", var_13_146)

	local var_13_147 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("WZWipButtonUp", var_13_147)

	local var_13_148 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("WZWipButtonUp", var_13_148)

	local var_13_149 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("WZWipButtonUp", var_13_149)

	local var_13_150 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("WZWipButtonUp", var_13_150)

	local function var_13_151()
		var_13_6:AnimateSequence("WZWipButtonUp")
		var_13_10:AnimateSequence("WZWipButtonUp")
		var_13_12:AnimateSequence("WZWipButtonUp")
		var_13_14:AnimateSequence("WZWipButtonUp")
		var_13_16:AnimateSequence("WZWipButtonUp")
		var_13_20:AnimateSequence("WZWipButtonUp")
	end

	var_13_0._sequences.WZWipButtonUp = var_13_151

	local var_13_152
	local var_13_153 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
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
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_13_153)

	local var_13_154 = {
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

	var_13_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_13_154)

	local var_13_155 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_13_155)

	local var_13_156 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_13_156)

	local var_13_157 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("WZWipButtonUpDisabled", var_13_157)

	local var_13_158 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("WZWipButtonUpDisabled", var_13_158)

	local function var_13_159()
		var_13_6:AnimateSequence("WZWipButtonUpDisabled")
		var_13_10:AnimateSequence("WZWipButtonUpDisabled")
		var_13_12:AnimateSequence("WZWipButtonUpDisabled")
		var_13_14:AnimateSequence("WZWipButtonUpDisabled")
		var_13_16:AnimateSequence("WZWipButtonUpDisabled")
		var_13_20:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_13_0._sequences.WZWipButtonUpDisabled = var_13_159

	local var_13_160
	local var_13_161 = {
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
			duration = 170,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 170,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			value = 0.5,
			duration = 170,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("WZWipButtonUpKBM", var_13_161)

	local var_13_162 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("WZWipButtonUpKBM", var_13_162)

	local var_13_163 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("WZWipButtonUpKBM", var_13_163)

	local var_13_164 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("WZWipButtonUpKBM", var_13_164)

	local var_13_165 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		}
	}

	var_13_16:RegisterAnimationSequence("WZWipButtonUpKBM", var_13_165)

	local var_13_166 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_13_20:RegisterAnimationSequence("WZWipButtonUpKBM", var_13_166)

	local function var_13_167()
		var_13_6:AnimateSequence("WZWipButtonUpKBM")
		var_13_10:AnimateSequence("WZWipButtonUpKBM")
		var_13_12:AnimateSequence("WZWipButtonUpKBM")
		var_13_14:AnimateSequence("WZWipButtonUpKBM")
		var_13_16:AnimateSequence("WZWipButtonUpKBM")
		var_13_20:AnimateSequence("WZWipButtonUpKBM")
	end

	var_13_0._sequences.WZWipButtonUpKBM = var_13_167

	var_0_9(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("PlayMenuButton", PlayMenuButton)
LockTable(_M)
