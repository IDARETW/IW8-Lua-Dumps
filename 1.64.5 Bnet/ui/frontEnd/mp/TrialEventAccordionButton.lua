module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._alphaValue = arg_1_1

	arg_1_0.NewItemNotification:SetAlpha(arg_1_1)
end

local function var_0_1(arg_2_0)
	if arg_2_0._resizeEnabled then
		arg_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
		arg_2_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		arg_2_0.Timer:SetEndTime(true)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = "button_private"
	local var_3_1 = tonumber(Engine.DEIDGHDBHD() or Engine.DCJHCAFIIA())

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		if var_3_1 > iter_3_1.startTime then
			if iter_3_1.mainMenuBackgroundImage and iter_3_1.mainMenuBackgroundImage ~= "" then
				var_3_0 = iter_3_1.mainMenuBackgroundImage
			end
		else
			break
		end
	end

	arg_3_0.Background.BackgroundImage:setImage(RegisterMaterial(var_3_0), 0)
end

local function var_0_3(arg_4_0)
	if arg_4_0._resizeEnabled then
		arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
		arg_4_0.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		arg_4_0.Timer:SetEndTime(false)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = TRIALS.GetTrialsEventData(arg_5_1)

	arg_5_0.Contract = var_0_3
	arg_5_0.Expand = var_0_1

	local var_5_1 = 0

	arg_5_0._disabled = false
	arg_5_0._resizeEnabled = true

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		if iter_5_1.bestMedal >= 3 then
			var_5_1 = 1 + var_5_1
		end
	end

	arg_5_0.GoldImage:SetAlpha(var_5_1 > 0 and 1 or 0)
	arg_5_0.GoldLabel:SetAlpha(var_5_1 > 0 and 1 or 0)
	arg_5_0.GoldLabel:setText(Engine.CBBHFCGDIC("TRIALEVENT/MEDAL_COUNT", var_5_1))
	arg_5_0.Timer:SetEndTime()
	arg_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if not LUI.IsLastInputMouseNavigation(arg_5_1) then
			arg_6_0:Expand()
			ACTIONS.AnimateSequence(arg_6_0, CONDITIONS.IsArabic(arg_5_0) and "ButtonOverAR" or "ButtonOver")
		else
			ACTIONS.AnimateSequence(arg_6_0, CONDITIONS.IsArabic(arg_5_0) and "ButtonOverKBMAR" or "ButtonOverKBM")
			arg_6_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		end
	end)
	arg_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		arg_7_0:Contract()

		if not LUI.IsLastInputMouseNavigation(arg_5_1) then
			ACTIONS.AnimateSequence(arg_7_0, CONDITIONS.IsArabic(arg_5_0) and "ButtonUpAR" or "ButtonUp")
		else
			ACTIONS.AnimateSequence(arg_7_0, CONDITIONS.IsArabic(arg_5_0) and "ButtonUpKBMAR" or "ButtonUpKBM")
			arg_7_0.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		end

		arg_7_0.NewItemNotification:SetAlpha(arg_7_0._alphaValue and arg_7_0._alphaValue or 0)
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		if not LUI.IsLastInputMouseNavigation(arg_5_1) then
			var_0_1(arg_8_0)
			ACTIONS.AnimateSequence(arg_8_0, "ButtonOverDisabled")
		else
			ACTIONS.AnimateSequence(arg_8_0, "ButtonOverDisabledKBM")
		end
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_9_0, arg_9_1)
		var_0_3(arg_9_0)
		ACTIONS.AnimateSequence(arg_9_0, "ButtonUpDisabled")
		arg_9_0.NewItemNotification:SetAlpha(0)
	end)
	arg_5_0:addEventHandler("disable", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_10_0, "Disable")

		arg_5_0._disabled = true
	end)
	arg_5_0:addEventHandler("enable", function(arg_11_0, arg_11_1)
		arg_5_0._disabled = false
	end)
	arg_5_0:Contract()
	var_0_2(arg_5_0, var_5_0)
end

function TrialEventAccordionButton(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_12_0.id = "TrialEventAccordionButton"
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
	local var_12_4 = MenuBuilder.BuildRegisteredType("FeaturedButtonBackground", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "Background"

	var_12_4.BackgroundImage:SetTop(_1080p * -108, 0)
	var_12_4.BackgroundImage:SetBottom(_1080p * 108, 0)
	var_12_4.BackgroundImage:setImage(RegisterMaterial("button_summergames"), 0)
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
	var_12_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 245, _1080p * -15, _1080p * 15)
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
	var_12_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -31, _1080p * -1, _1080p * -15, _1080p * 15)
	var_12_0:addElement(var_12_10)

	var_12_0.Lock = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIStyledText.new()

	var_12_12.id = "Description"

	var_12_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_12:SetAlpha(0, 0)
	var_12_12:setText(Engine.CBBHFCGDIC("TRIALEVENT/MAIN_MENU_BUTTON_DESC"), 0)
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
	var_12_14:SetShadowMinDistance(-0.2, 0)
	var_12_14:SetShadowMaxDistance(0.2, 0)
	var_12_14:SetShadowUOffset(-0.002, 0)
	var_12_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 45, _1080p * 65)
	var_12_0:addElement(var_12_14)

	var_12_0.DisabledText = var_12_14

	local var_12_15
	local var_12_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_12_1
	})

	var_12_16.id = "NewItemNotification"

	var_12_16:SetAlpha(0, 0)
	var_12_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -49, _1080p * -41, _1080p * -4, _1080p * 4)
	var_12_0:addElement(var_12_16)

	var_12_0.NewItemNotification = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIText.new()

	var_12_18.id = "GoldLabel"

	var_12_18:setText("", 0)
	var_12_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_18:SetAlignment(LUI.Alignment.Left)
	var_12_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 55, _1080p * 84, _1080p * 40, _1080p * 58)
	var_12_0:addElement(var_12_18)

	var_12_0.GoldLabel = var_12_18

	local var_12_19
	local var_12_20 = LUI.UIImage.new()

	var_12_20.id = "GoldImage"

	var_12_20:setImage(RegisterMaterial("trial_medal_gold_sm"), 0)
	var_12_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 51, _1080p * 33, _1080p * 65)
	var_12_0:addElement(var_12_20)

	var_12_0.GoldImage = var_12_20

	local var_12_21
	local var_12_22 = MenuBuilder.BuildRegisteredType("TrialEventAccorionTimer", {
		controllerIndex = var_12_1
	})

	var_12_22.id = "Timer"

	var_12_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 266, _1080p * 414, _1080p * -15, _1080p * 15)
	var_12_0:addElement(var_12_22)

	var_12_0.Timer = var_12_22

	local function var_12_23()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_23

	local var_12_24
	local var_12_25 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOver", var_12_25)

	local var_12_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOver", var_12_26)

	local var_12_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonOver", var_12_27)

	local var_12_28 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOver", var_12_28)

	local var_12_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOver", var_12_29)

	local var_12_30 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -41
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOver", var_12_30)

	local var_12_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 190
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		}
	}

	var_12_22:RegisterAnimationSequence("ButtonOver", var_12_31)

	local function var_12_32()
		var_12_6:AnimateSequence("ButtonOver")
		var_12_8:AnimateSequence("ButtonOver")
		var_12_10:AnimateSequence("ButtonOver")
		var_12_12:AnimateSequence("ButtonOver")
		var_12_14:AnimateSequence("ButtonOver")
		var_12_16:AnimateSequence("ButtonOver")
		var_12_22:AnimateSequence("ButtonOver")
	end

	var_12_0._sequences.ButtonOver = var_12_32

	local var_12_33
	local var_12_34 = {
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

	var_12_6:RegisterAnimationSequence("ButtonUp", var_12_34)

	local var_12_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUp", var_12_35)

	local var_12_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUp", var_12_36)

	local var_12_37 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUp", var_12_37)

	local var_12_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUp", var_12_38)

	local var_12_39 = {
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

	var_12_16:RegisterAnimationSequence("ButtonUp", var_12_39)

	local var_12_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 266
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

	var_12_22:RegisterAnimationSequence("ButtonUp", var_12_40)

	local function var_12_41()
		var_12_6:AnimateSequence("ButtonUp")
		var_12_8:AnimateSequence("ButtonUp")
		var_12_10:AnimateSequence("ButtonUp")
		var_12_12:AnimateSequence("ButtonUp")
		var_12_14:AnimateSequence("ButtonUp")
		var_12_16:AnimateSequence("ButtonUp")
		var_12_22:AnimateSequence("ButtonUp")
	end

	var_12_0._sequences.ButtonUp = var_12_41

	local var_12_42
	local var_12_43 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOverDisabled", var_12_43)

	local var_12_44 = {
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

	var_12_8:RegisterAnimationSequence("ButtonOverDisabled", var_12_44)

	local var_12_45 = {
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

	var_12_10:RegisterAnimationSequence("ButtonOverDisabled", var_12_45)

	local var_12_46 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverDisabled", var_12_46)

	local var_12_47 = {
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

	var_12_14:RegisterAnimationSequence("ButtonOverDisabled", var_12_47)

	local var_12_48 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -41
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOverDisabled", var_12_48)

	local var_12_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 190
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_12_22:RegisterAnimationSequence("ButtonOverDisabled", var_12_49)

	local function var_12_50()
		var_12_6:AnimateSequence("ButtonOverDisabled")
		var_12_8:AnimateSequence("ButtonOverDisabled")
		var_12_10:AnimateSequence("ButtonOverDisabled")
		var_12_12:AnimateSequence("ButtonOverDisabled")
		var_12_14:AnimateSequence("ButtonOverDisabled")
		var_12_16:AnimateSequence("ButtonOverDisabled")
		var_12_22:AnimateSequence("ButtonOverDisabled")
	end

	var_12_0._sequences.ButtonOverDisabled = var_12_50

	local var_12_51
	local var_12_52 = {
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

	var_12_6:RegisterAnimationSequence("ButtonUpDisabled", var_12_52)

	local var_12_53 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUpDisabled", var_12_53)

	local var_12_54 = {
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

	var_12_10:RegisterAnimationSequence("ButtonUpDisabled", var_12_54)

	local var_12_55 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUpDisabled", var_12_55)

	local var_12_56 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUpDisabled", var_12_56)

	local var_12_57 = {
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

	var_12_16:RegisterAnimationSequence("ButtonUpDisabled", var_12_57)

	local var_12_58 = {
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

	var_12_22:RegisterAnimationSequence("ButtonUpDisabled", var_12_58)

	local function var_12_59()
		var_12_6:AnimateSequence("ButtonUpDisabled")
		var_12_8:AnimateSequence("ButtonUpDisabled")
		var_12_10:AnimateSequence("ButtonUpDisabled")
		var_12_12:AnimateSequence("ButtonUpDisabled")
		var_12_14:AnimateSequence("ButtonUpDisabled")
		var_12_16:AnimateSequence("ButtonUpDisabled")
		var_12_22:AnimateSequence("ButtonUpDisabled")
	end

	var_12_0._sequences.ButtonUpDisabled = var_12_59

	local var_12_60
	local var_12_61 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverKBM", var_12_61)

	local var_12_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverKBM", var_12_62)

	local var_12_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonOverKBM", var_12_63)

	local var_12_64 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverKBM", var_12_64)

	local var_12_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOverKBM", var_12_65)

	local function var_12_66()
		var_12_6:AnimateSequence("ButtonOverKBM")
		var_12_8:AnimateSequence("ButtonOverKBM")
		var_12_10:AnimateSequence("ButtonOverKBM")
		var_12_12:AnimateSequence("ButtonOverKBM")
		var_12_14:AnimateSequence("ButtonOverKBM")
	end

	var_12_0._sequences.ButtonOverKBM = var_12_66

	local var_12_67
	local var_12_68 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_68)

	local var_12_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_69)

	local var_12_70 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_70)

	local var_12_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_71)

	local var_12_72 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -41
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_72)

	local var_12_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
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

	var_12_22:RegisterAnimationSequence("ButtonOverDisabledKBM", var_12_73)

	local function var_12_74()
		var_12_6:AnimateSequence("ButtonOverDisabledKBM")
		var_12_8:AnimateSequence("ButtonOverDisabledKBM")
		var_12_12:AnimateSequence("ButtonOverDisabledKBM")
		var_12_14:AnimateSequence("ButtonOverDisabledKBM")
		var_12_16:AnimateSequence("ButtonOverDisabledKBM")
		var_12_22:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_12_0._sequences.ButtonOverDisabledKBM = var_12_74

	local var_12_75
	local var_12_76 = {
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

	var_12_6:RegisterAnimationSequence("Disable", var_12_76)

	local var_12_77 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("Disable", var_12_77)

	local var_12_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_22:RegisterAnimationSequence("Disable", var_12_78)

	local function var_12_79()
		var_12_6:AnimateSequence("Disable")
		var_12_10:AnimateSequence("Disable")
		var_12_22:AnimateSequence("Disable")
	end

	var_12_0._sequences.Disable = var_12_79

	local var_12_80
	local var_12_81 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 202
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 376
		}
	}

	var_12_6:RegisterAnimationSequence("AR", var_12_81)

	local var_12_82 = {
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

	var_12_10:RegisterAnimationSequence("AR", var_12_82)

	local var_12_83 = {
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
			value = _1080p * 356
		}
	}

	var_12_12:RegisterAnimationSequence("AR", var_12_83)

	local var_12_84 = {
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

	var_12_14:RegisterAnimationSequence("AR", var_12_84)

	local var_12_85 = {
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
			value = _1080p * 19
		}
	}

	var_12_16:RegisterAnimationSequence("AR", var_12_85)

	local var_12_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_12_18:RegisterAnimationSequence("AR", var_12_86)

	local var_12_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_12_20:RegisterAnimationSequence("AR", var_12_87)

	local var_12_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 159
		}
	}

	var_12_22:RegisterAnimationSequence("AR", var_12_88)

	local function var_12_89()
		var_12_6:AnimateSequence("AR")
		var_12_10:AnimateSequence("AR")
		var_12_12:AnimateSequence("AR")
		var_12_14:AnimateSequence("AR")
		var_12_16:AnimateSequence("AR")
		var_12_18:AnimateSequence("AR")
		var_12_20:AnimateSequence("AR")
		var_12_22:AnimateSequence("AR")
	end

	var_12_0._sequences.AR = var_12_89

	local var_12_90
	local var_12_91 = {
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

	var_12_6:RegisterAnimationSequence("ButtonUpKBM", var_12_91)

	local var_12_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUpKBM", var_12_92)

	local var_12_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUpKBM", var_12_93)

	local var_12_94 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUpKBM", var_12_94)

	local var_12_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUpKBM", var_12_95)

	local var_12_96 = {
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

	var_12_16:RegisterAnimationSequence("ButtonUpKBM", var_12_96)

	local var_12_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 266
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

	var_12_22:RegisterAnimationSequence("ButtonUpKBM", var_12_97)

	local function var_12_98()
		var_12_6:AnimateSequence("ButtonUpKBM")
		var_12_8:AnimateSequence("ButtonUpKBM")
		var_12_10:AnimateSequence("ButtonUpKBM")
		var_12_12:AnimateSequence("ButtonUpKBM")
		var_12_14:AnimateSequence("ButtonUpKBM")
		var_12_16:AnimateSequence("ButtonUpKBM")
		var_12_22:AnimateSequence("ButtonUpKBM")
	end

	var_12_0._sequences.ButtonUpKBM = var_12_98

	local var_12_99
	local var_12_100 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_12_6:RegisterAnimationSequence("ARGameBattles", var_12_100)

	local function var_12_101()
		var_12_6:AnimateSequence("ARGameBattles")
	end

	var_12_0._sequences.ARGameBattles = var_12_101

	local var_12_102
	local var_12_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 251
		}
	}

	var_12_6:RegisterAnimationSequence("WZ", var_12_103)

	local var_12_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_12_18:RegisterAnimationSequence("WZ", var_12_104)

	local var_12_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 58
		}
	}

	var_12_20:RegisterAnimationSequence("WZ", var_12_105)

	local function var_12_106()
		var_12_6:AnimateSequence("WZ")
		var_12_18:AnimateSequence("WZ")
		var_12_20:AnimateSequence("WZ")
	end

	var_12_0._sequences.WZ = var_12_106

	local var_12_107
	local var_12_108 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOverAR", var_12_108)

	local var_12_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverAR", var_12_109)

	local var_12_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonOverAR", var_12_110)

	local var_12_111 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverAR", var_12_111)

	local var_12_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOverAR", var_12_112)

	local var_12_113 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -41
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOverAR", var_12_113)

	local var_12_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 235
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		}
	}

	var_12_22:RegisterAnimationSequence("ButtonOverAR", var_12_114)

	local function var_12_115()
		var_12_6:AnimateSequence("ButtonOverAR")
		var_12_8:AnimateSequence("ButtonOverAR")
		var_12_10:AnimateSequence("ButtonOverAR")
		var_12_12:AnimateSequence("ButtonOverAR")
		var_12_14:AnimateSequence("ButtonOverAR")
		var_12_16:AnimateSequence("ButtonOverAR")
		var_12_22:AnimateSequence("ButtonOverAR")
	end

	var_12_0._sequences.ButtonOverAR = var_12_115

	local var_12_116
	local var_12_117 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverKBMAR", var_12_117)

	local var_12_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverKBMAR", var_12_118)

	local var_12_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonOverKBMAR", var_12_119)

	local var_12_120 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverKBMAR", var_12_120)

	local var_12_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOverKBMAR", var_12_121)

	local var_12_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 159
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		}
	}

	var_12_22:RegisterAnimationSequence("ButtonOverKBMAR", var_12_122)

	local function var_12_123()
		var_12_6:AnimateSequence("ButtonOverKBMAR")
		var_12_8:AnimateSequence("ButtonOverKBMAR")
		var_12_10:AnimateSequence("ButtonOverKBMAR")
		var_12_12:AnimateSequence("ButtonOverKBMAR")
		var_12_14:AnimateSequence("ButtonOverKBMAR")
		var_12_22:AnimateSequence("ButtonOverKBMAR")
	end

	var_12_0._sequences.ButtonOverKBMAR = var_12_123

	local var_12_124
	local var_12_125 = {
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

	var_12_6:RegisterAnimationSequence("ButtonUpAR", var_12_125)

	local var_12_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUpAR", var_12_126)

	local var_12_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUpAR", var_12_127)

	local var_12_128 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUpAR", var_12_128)

	local var_12_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUpAR", var_12_129)

	local var_12_130 = {
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

	var_12_16:RegisterAnimationSequence("ButtonUpAR", var_12_130)

	local var_12_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 159
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

	var_12_22:RegisterAnimationSequence("ButtonUpAR", var_12_131)

	local function var_12_132()
		var_12_6:AnimateSequence("ButtonUpAR")
		var_12_8:AnimateSequence("ButtonUpAR")
		var_12_10:AnimateSequence("ButtonUpAR")
		var_12_12:AnimateSequence("ButtonUpAR")
		var_12_14:AnimateSequence("ButtonUpAR")
		var_12_16:AnimateSequence("ButtonUpAR")
		var_12_22:AnimateSequence("ButtonUpAR")
	end

	var_12_0._sequences.ButtonUpAR = var_12_132

	local var_12_133
	local var_12_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
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

	var_12_6:RegisterAnimationSequence("ButtonUpKBMAR", var_12_134)

	local var_12_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUpKBMAR", var_12_135)

	local var_12_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUpKBMAR", var_12_136)

	local var_12_137 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUpKBMAR", var_12_137)

	local var_12_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUpKBMAR", var_12_138)

	local var_12_139 = {
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

	var_12_16:RegisterAnimationSequence("ButtonUpKBMAR", var_12_139)

	local var_12_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 159
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

	var_12_22:RegisterAnimationSequence("ButtonUpKBMAR", var_12_140)

	local function var_12_141()
		var_12_6:AnimateSequence("ButtonUpKBMAR")
		var_12_8:AnimateSequence("ButtonUpKBMAR")
		var_12_10:AnimateSequence("ButtonUpKBMAR")
		var_12_12:AnimateSequence("ButtonUpKBMAR")
		var_12_14:AnimateSequence("ButtonUpKBMAR")
		var_12_16:AnimateSequence("ButtonUpKBMAR")
		var_12_22:AnimateSequence("ButtonUpKBMAR")
	end

	var_12_0._sequences.ButtonUpKBMAR = var_12_141

	var_0_4(var_12_0, var_12_1, arg_12_1)

	if CONDITIONS.IsArabic(var_12_0) then
		ACTIONS.AnimateSequence(var_12_0, "AR")
	end

	if CONDITIONS.IsMagmaGameMode(var_12_0) and not CONDITIONS.IsArabic(var_12_0) then
		ACTIONS.AnimateSequence(var_12_0, "WZ")
	end

	return var_12_0
end

MenuBuilder.registerType("TrialEventAccordionButton", TrialEventAccordionButton)
LockTable(_M)
