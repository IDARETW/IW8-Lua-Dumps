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

local function var_0_8(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.Expand = var_0_5
	arg_5_0.Contract = var_0_6
	arg_5_0.SetMinTextRight = var_0_7
	arg_5_0.UpdateNewItemNotification = var_0_4
	arg_5_0._minRight = IsLanguageChinese() and 275 or 380
	arg_5_0._minRightOverrideDisable = false
	arg_5_0._disabled = false
	arg_5_0._alphaValue = arg_5_0.NewItemNotification:GetAlpha()

	var_0_6(arg_5_0)
	arg_5_0:addEventHandler("disable", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0, "Disable")

		arg_5_0._disabled = true
	end)
	arg_5_0:addEventHandler("enable", function(arg_7_0, arg_7_1)
		arg_5_0._disabled = false
	end)
	arg_5_0:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		if not LUI.IsLastInputMouseNavigation(arg_5_1) then
			var_0_5(arg_8_0)
			ACTIONS.AnimateSequence(arg_8_0, "ButtonOver")
		else
			ACTIONS.AnimateSequence(arg_8_0, "ButtonOverKBM")
		end

		arg_8_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_5_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		var_0_6(arg_9_0)

		if not LUI.IsLastInputMouseNavigation(arg_5_1) then
			ACTIONS.AnimateSequence(arg_9_0, "ButtonUp")
		else
			ACTIONS.AnimateSequence(arg_9_0, "ButtonUpKBM")
		end

		arg_9_0.NewItemNotification:UpdateAlpha(arg_9_0._alphaValue and arg_9_0._alphaValue or 0)
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_10_0, arg_10_1)
		if not LUI.IsLastInputMouseNavigation(arg_5_1) then
			var_0_5(arg_10_0)
			ACTIONS.AnimateSequence(arg_10_0, "ButtonOverDisabled")
		else
			ACTIONS.AnimateSequence(arg_10_0, "ButtonOverDisabledKBM")
		end
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_11_0, arg_11_1)
		var_0_6(arg_11_0)
		ACTIONS.AnimateSequence(arg_11_0, "ButtonUpDisabled")
		arg_11_0.NewItemNotification:SetAlpha(0)
	end)

	if IsLanguageTraditionalChinese() then
		ACTIONS.AnimateSequence(arg_5_0, "CHT")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
		arg_5_0.Text:SetRight(var_0_1, 0)
		arg_5_0.Description:SetRight(var_0_1, 150)
	end
end

function PlayMenuButton(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_12_0.id = "PlayMenuButton"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0

	var_12_0:setUseStencil(true)

	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "Background"

	var_12_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Background = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIStyledText.new()

	var_12_6.id = "Text"

	var_12_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_12_6:setText("", 0)
	var_12_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_6:SetWordWrap(false)
	var_12_6:SetAlignment(LUI.Alignment.Left)
	var_12_6:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_12_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_6:SetStartupDelay(2000)
	var_12_6:SetLineHoldTime(400)
	var_12_6:SetAnimMoveTime(2000)
	var_12_6:SetAnimMoveSpeed(150)
	var_12_6:SetEndDelay(2000)
	var_12_6:SetCrossfadeTime(1000)
	var_12_6:SetFadeInTime(500)
	var_12_6:SetFadeOutTime(500)
	var_12_6:SetMaxVisibleLines(1)
	var_12_6:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_12_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 350, _1080p * -15, _1080p * 15)
	var_12_0:addElement(var_12_6)

	var_12_0.Text = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIImage.new()

	var_12_8.id = "Backer"

	var_12_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_8:SetAlpha(0, 0)
	var_12_8:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_12_0:addElement(var_12_8)

	var_12_0.Backer = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "Lock"

	var_12_10:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_12_10:SetAlpha(0, 0)
	var_12_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_12_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -5, _1080p * -15, _1080p * 15)
	var_12_0:addElement(var_12_10)

	var_12_0.Lock = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIStyledText.new()

	var_12_12.id = "Description"

	var_12_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_12:SetAlpha(0, 0)
	var_12_12:setText("", 0)
	var_12_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_12:SetAlignment(LUI.Alignment.Left)
	var_12_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 396, _1080p * -23, _1080p * -3)
	var_12_0:addElement(var_12_12)

	var_12_0.Description = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIStyledText.new()

	var_12_14.id = "DisabledText"

	var_12_14:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_12_14:SetAlpha(0, 0)
	var_12_14:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_12_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_14:SetWordWrap(false)
	var_12_14:SetAlignment(LUI.Alignment.Left)
	var_12_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_14:SetStartupDelay(2000)
	var_12_14:SetLineHoldTime(400)
	var_12_14:SetAnimMoveTime(2000)
	var_12_14:SetAnimMoveSpeed(150)
	var_12_14:SetEndDelay(2000)
	var_12_14:SetCrossfadeTime(1000)
	var_12_14:SetFadeInTime(300)
	var_12_14:SetFadeOutTime(300)
	var_12_14:SetMaxVisibleLines(1)
	var_12_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 45, _1080p * 65)
	var_12_0:addElement(var_12_14)

	var_12_0.DisabledText = var_12_14

	local var_12_15
	local var_12_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_12_1
	})

	var_12_16.id = "NewItemNotification"

	var_12_16:SetAlpha(0, 0)
	var_12_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -24, _1080p * -16, _1080p * -4, _1080p * 4)
	var_12_0:addElement(var_12_16)

	var_12_0.NewItemNotification = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIImage.new()

	var_12_18.id = "RestrictionWarning"

	var_12_18:SetAlpha(0, 0)
	var_12_18:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_12_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 183, _1080p * 213, _1080p * -15, _1080p * 15)
	var_12_0:addElement(var_12_18)

	var_12_0.RestrictionWarning = var_12_18

	local function var_12_19()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_19

	local var_12_20
	local var_12_21 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOver", var_12_21)

	local var_12_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOver", var_12_22)

	local var_12_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonOver", var_12_23)

	local var_12_24 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOver", var_12_24)

	local var_12_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOver", var_12_25)

	local var_12_26 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -42
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOver", var_12_26)

	local function var_12_27()
		var_12_6:AnimateSequence("ButtonOver")
		var_12_8:AnimateSequence("ButtonOver")
		var_12_10:AnimateSequence("ButtonOver")
		var_12_12:AnimateSequence("ButtonOver")
		var_12_14:AnimateSequence("ButtonOver")
		var_12_16:AnimateSequence("ButtonOver")
	end

	var_12_0._sequences.ButtonOver = var_12_27

	local var_12_28
	local var_12_29 = {
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

	var_12_6:RegisterAnimationSequence("ButtonUp", var_12_29)

	local var_12_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUp", var_12_30)

	local var_12_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUp", var_12_31)

	local var_12_32 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUp", var_12_32)

	local var_12_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUp", var_12_33)

	local var_12_34 = {
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

	var_12_16:RegisterAnimationSequence("ButtonUp", var_12_34)

	local function var_12_35()
		var_12_6:AnimateSequence("ButtonUp")
		var_12_8:AnimateSequence("ButtonUp")
		var_12_10:AnimateSequence("ButtonUp")
		var_12_12:AnimateSequence("ButtonUp")
		var_12_14:AnimateSequence("ButtonUp")
		var_12_16:AnimateSequence("ButtonUp")
	end

	var_12_0._sequences.ButtonUp = var_12_35

	local var_12_36
	local var_12_37 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOverDisabled", var_12_37)

	local var_12_38 = {
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

	var_12_8:RegisterAnimationSequence("ButtonOverDisabled", var_12_38)

	local var_12_39 = {
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

	var_12_10:RegisterAnimationSequence("ButtonOverDisabled", var_12_39)

	local var_12_40 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverDisabled", var_12_40)

	local var_12_41 = {
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

	var_12_14:RegisterAnimationSequence("ButtonOverDisabled", var_12_41)

	local var_12_42 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -42
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOverDisabled", var_12_42)

	local function var_12_43()
		var_12_6:AnimateSequence("ButtonOverDisabled")
		var_12_8:AnimateSequence("ButtonOverDisabled")
		var_12_10:AnimateSequence("ButtonOverDisabled")
		var_12_12:AnimateSequence("ButtonOverDisabled")
		var_12_14:AnimateSequence("ButtonOverDisabled")
		var_12_16:AnimateSequence("ButtonOverDisabled")
	end

	var_12_0._sequences.ButtonOverDisabled = var_12_43

	local var_12_44
	local var_12_45 = {
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

	var_12_6:RegisterAnimationSequence("ButtonUpDisabled", var_12_45)

	local var_12_46 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUpDisabled", var_12_46)

	local var_12_47 = {
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

	var_12_10:RegisterAnimationSequence("ButtonUpDisabled", var_12_47)

	local var_12_48 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUpDisabled", var_12_48)

	local var_12_49 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUpDisabled", var_12_49)

	local var_12_50 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonUpDisabled", var_12_50)

	local function var_12_51()
		var_12_6:AnimateSequence("ButtonUpDisabled")
		var_12_8:AnimateSequence("ButtonUpDisabled")
		var_12_10:AnimateSequence("ButtonUpDisabled")
		var_12_12:AnimateSequence("ButtonUpDisabled")
		var_12_14:AnimateSequence("ButtonUpDisabled")
		var_12_16:AnimateSequence("ButtonUpDisabled")
	end

	var_12_0._sequences.ButtonUpDisabled = var_12_51

	local var_12_52
	local var_12_53 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOverKBM", var_12_53)

	local var_12_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverKBM", var_12_54)

	local var_12_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonOverKBM", var_12_55)

	local var_12_56 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverKBM", var_12_56)

	local var_12_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOverKBM", var_12_57)

	local var_12_58 = {
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

	var_12_16:RegisterAnimationSequence("ButtonOverKBM", var_12_58)

	local function var_12_59()
		var_12_6:AnimateSequence("ButtonOverKBM")
		var_12_8:AnimateSequence("ButtonOverKBM")
		var_12_10:AnimateSequence("ButtonOverKBM")
		var_12_12:AnimateSequence("ButtonOverKBM")
		var_12_14:AnimateSequence("ButtonOverKBM")
		var_12_16:AnimateSequence("ButtonOverKBM")
	end

	var_12_0._sequences.ButtonOverKBM = var_12_59

	local var_12_60
	local var_12_61 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_61)

	local var_12_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_62)

	local var_12_63 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_63)

	local var_12_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_64)

	local var_12_65 = {
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

	var_12_16:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_65)

	local function var_12_66()
		var_12_6:AnimateSequence("ButtonOverDisabledKBM")
		var_12_8:AnimateSequence("ButtonOverDisabledKBM")
		var_12_12:AnimateSequence("ButtonOverDisabledKBM")
		var_12_14:AnimateSequence("ButtonOverDisabledKBM")
		var_12_16:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_12_0._sequences.ButtonOverDisabledKBM = var_12_66

	local var_12_67
	local var_12_68 = {
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

	var_12_6:RegisterAnimationSequence("Disable", var_12_68)

	local var_12_69 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("Disable", var_12_69)

	local var_12_70 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("Disable", var_12_70)

	local function var_12_71()
		var_12_6:AnimateSequence("Disable")
		var_12_10:AnimateSequence("Disable")
		var_12_16:AnimateSequence("Disable")
	end

	var_12_0._sequences.Disable = var_12_71

	local var_12_72
	local var_12_73 = {
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

	var_12_6:RegisterAnimationSequence("AR", var_12_73)

	local var_12_74 = {
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

	var_12_10:RegisterAnimationSequence("AR", var_12_74)

	local var_12_75 = {
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

	var_12_12:RegisterAnimationSequence("AR", var_12_75)

	local var_12_76 = {
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

	var_12_14:RegisterAnimationSequence("AR", var_12_76)

	local var_12_77 = {
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

	var_12_16:RegisterAnimationSequence("AR", var_12_77)

	local function var_12_78()
		var_12_6:AnimateSequence("AR")
		var_12_10:AnimateSequence("AR")
		var_12_12:AnimateSequence("AR")
		var_12_14:AnimateSequence("AR")
		var_12_16:AnimateSequence("AR")
	end

	var_12_0._sequences.AR = var_12_78

	local var_12_79
	local var_12_80 = {
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

	var_12_6:RegisterAnimationSequence("CHT", var_12_80)

	local var_12_81 = {
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

	var_12_12:RegisterAnimationSequence("CHT", var_12_81)

	local function var_12_82()
		var_12_6:AnimateSequence("CHT")
		var_12_12:AnimateSequence("CHT")
	end

	var_12_0._sequences.CHT = var_12_82

	local var_12_83
	local var_12_84 = {
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

	var_12_6:RegisterAnimationSequence("ButtonUpKBM", var_12_84)

	local var_12_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUpKBM", var_12_85)

	local var_12_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUpKBM", var_12_86)

	local var_12_87 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUpKBM", var_12_87)

	local var_12_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUpKBM", var_12_88)

	local var_12_89 = {
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

	var_12_16:RegisterAnimationSequence("ButtonUpKBM", var_12_89)

	local function var_12_90()
		var_12_6:AnimateSequence("ButtonUpKBM")
		var_12_8:AnimateSequence("ButtonUpKBM")
		var_12_10:AnimateSequence("ButtonUpKBM")
		var_12_12:AnimateSequence("ButtonUpKBM")
		var_12_14:AnimateSequence("ButtonUpKBM")
		var_12_16:AnimateSequence("ButtonUpKBM")
	end

	var_12_0._sequences.ButtonUpKBM = var_12_90

	local var_12_91
	local var_12_92 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("RestrictionOn", var_12_92)

	local function var_12_93()
		var_12_18:AnimateSequence("RestrictionOn")
	end

	var_12_0._sequences.RestrictionOn = var_12_93

	local var_12_94
	local var_12_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("RestrictionOff", var_12_95)

	local function var_12_96()
		var_12_18:AnimateSequence("RestrictionOff")
	end

	var_12_0._sequences.RestrictionOff = var_12_96

	var_0_8(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("PlayMenuButton", PlayMenuButton)
LockTable(_M)
