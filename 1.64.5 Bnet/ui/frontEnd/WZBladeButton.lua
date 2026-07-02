module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._lastState == "ButtonOver" and arg_1_0._isDisabled then
		WZWIP.AnimateThemeElement(arg_1_0, "ButtonOverDisabled", {
			resizeSmallIfLanguage = {
				IsLanguageChinese,
				IsLanguageKorean,
				IsLanguageJapanese
			},
			forceSmall = arg_1_0._isForcedSmall
		})
	elseif arg_1_0._lastState == "ButtonUp" and arg_1_0._isDisabled then
		WZWIP.AnimateThemeElement(arg_1_0, "ButtonUpDisabled")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.Text)

	arg_2_1 = CONDITIONS.IsWZWipFlowEnabled() and ToUpperCase(arg_2_1) or arg_2_1, arg_2_0.Text:setText(ToUpperCase(arg_2_1))
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._blockedText = arg_3_1 or ""
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0._isDisabled = arg_4_1

	var_0_0(arg_4_0)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0._lastState ~= arg_5_1 then
		arg_5_0._lastState = arg_5_1

		WZWIP.AnimateThemeElement(arg_5_0, arg_5_1, {
			doSnapToState = arg_5_2.snap,
			resizeSmallIfLanguage = arg_5_2.resizeSmallIfLanguage
		})
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0._downloadIconEnabled = arg_6_1
end

function PostLoadFunc(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.RefreshDisabledAnimation = var_0_0
	arg_7_0.SetText = var_0_1
	arg_7_0.SetBlockedText = var_0_2
	arg_7_0.SetIsDisabled = var_0_3
	arg_7_0.SetDownloadIconVisibility = var_0_5
	arg_7_0._defaultState = arg_7_2.defaultState or "ButtonUp"
	arg_7_0._isDisabled = arg_7_2.isDisabled or false
	arg_7_0._downloadIconEnabled = false
	arg_7_0._blockedText = arg_7_2.blockedText or ""
	arg_7_0._lastState = "ButtonUp"

	local var_7_0 = LUI.Alignment.Left

	arg_7_0:SetNotifyOnLayoutInit(true)
	arg_7_0:addEventHandler("layout_initialized", function(arg_8_0, arg_8_1)
		if arg_8_0.Text then
			var_7_0 = arg_8_0.Text:getHorizontalAlignment()

			arg_8_0.Background:SetupButton(arg_8_0.Text, arg_8_0.Text:getText(), var_7_0)
		end
	end)
	arg_7_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		arg_9_0._lastState = "ButtonOver"

		WZWIP.AnimateThemeElement(arg_9_0, "ButtonOver", {
			resizeSmallIfLanguage = {
				IsLanguageChinese,
				IsLanguageKorean,
				IsLanguageJapanese
			},
			forceSmall = arg_7_0._isForcedSmall
		})
		arg_9_0.Background:SetupButton(arg_9_0.Text, arg_9_0.Text:getText(), var_7_0)

		if arg_7_0._downloadIconEnabled then
			arg_7_0.DownloadIcon:SetAlpha(1)
		end
	end)
	arg_7_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		arg_7_0.DownloadIcon:SetAlpha(0)
	end)
	arg_7_0:addEventHandler("button_disable", function(arg_11_0, arg_11_1)
		var_0_4(arg_11_0, "ButtonUpDisabled", {
			snap = arg_11_1.snap
		})
	end)
	arg_7_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		var_0_4(arg_12_0, "ButtonOverDisabled", {
			resizeSmallIfLanguage = {
				IsLanguageChinese,
				IsLanguageKorean,
				IsLanguageJapanese
			},
			forceSmall = arg_7_0._isForcedSmall
		})
		arg_12_0.Background:SetupButton(arg_12_0.Text, arg_12_0.Text:getText(), var_7_0)

		if arg_7_0._downloadIconEnabled then
			arg_7_0.DownloadIcon:SetAlpha(1)
		end
	end)
	arg_7_0:addEventHandler("disable", function(arg_13_0, arg_13_1)
		WZWIP.AnimateThemeElement(arg_13_0, "Disabled")
	end)
	arg_7_0:addEventHandler("enable", function(arg_14_0, arg_14_1)
		WZWIP.AnimateThemeElement(arg_14_0, "Enabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_7_0, "WZWipSetup")
	end

	var_0_4(arg_7_0, arg_7_0._defaultState)
end

function WZBladeButton(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIButton.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 46 * _1080p)

	var_15_0.id = "WZBladeButton"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "BackgroundDarkener"

	var_15_4:SetRGBFromInt(0, 0)
	var_15_4:SetAlpha(0, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.BackgroundDarkener = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "Background"

	var_15_6:SetAlpha(0, 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_15_0:addElement(var_15_6)

	var_15_0.Background = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIImage.new()

	var_15_8.id = "ButtonBacking"

	var_15_8:SetRGBFromInt(15066083, 0)
	var_15_8:setImage(RegisterMaterial("menu_blade_highlight_backing_ch2"), 0)
	var_15_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -190, _1080p * 190, 0, _1080p * 64)
	var_15_0:addElement(var_15_8)

	var_15_0.ButtonBacking = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIStyledText.new()

	var_15_10.id = "Text"

	var_15_10:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_15_10:setText(ToUpperCase(""), 0)
	var_15_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_10:SetAlignment(LUI.Alignment.Center)
	var_15_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_10:SetStartupDelay(2000)
	var_15_10:SetLineHoldTime(400)
	var_15_10:SetAnimMoveTime(300)
	var_15_10:SetAnimMoveSpeed(50)
	var_15_10:SetEndDelay(1500)
	var_15_10:SetCrossfadeTime(750)
	var_15_10:SetFadeInTime(300)
	var_15_10:SetFadeOutTime(300)
	var_15_10:SetMaxVisibleLines(1)
	var_15_10:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_15_10:SetOutlineRGBFromInt(0, 0)
	var_15_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 13)
	var_15_0:addElement(var_15_10)

	var_15_0.Text = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIStyledText.new()

	var_15_12.id = "TextPurchaseDescr"

	var_15_12:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_15_12:SetAlpha(0, 0)
	var_15_12:setText("Promo", 0)
	var_15_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_12:SetAlignment(LUI.Alignment.Center)
	var_15_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_12:SetStartupDelay(2000)
	var_15_12:SetLineHoldTime(400)
	var_15_12:SetAnimMoveTime(300)
	var_15_12:SetAnimMoveSpeed(50)
	var_15_12:SetEndDelay(1500)
	var_15_12:SetCrossfadeTime(750)
	var_15_12:SetFadeInTime(300)
	var_15_12:SetFadeOutTime(300)
	var_15_12:SetMaxVisibleLines(1)
	var_15_12:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_15_12:SetOutlineRGBFromInt(0, 0)
	var_15_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * 29, _1080p * 53)
	var_15_0:addElement(var_15_12)

	var_15_0.TextPurchaseDescr = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIImage.new()

	var_15_14.id = "Lock"

	var_15_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_15_14:SetAlpha(0, 0)
	var_15_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_15_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_15_0:addElement(var_15_14)

	var_15_0.Lock = var_15_14

	local var_15_15
	local var_15_16 = LUI.UIImage.new()

	var_15_16.id = "DownloadIcon"

	var_15_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_15_16:SetAlpha(0, 0)
	var_15_16:setImage(RegisterMaterial("icon_install"), 0)
	var_15_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 142, _1080p * 168, _1080p * -11, _1080p * 15)
	var_15_0:addElement(var_15_16)

	var_15_0.DownloadIcon = var_15_16

	local var_15_17

	if CONDITIONS.AlwaysFalse() then
		var_15_17 = LUI.UIImage.new()
		var_15_17.id = "WZWipAsterik"

		var_15_17:SetRGBFromInt(13642801, 0)
		var_15_17:SetAlpha(0, 0)
		var_15_17:setImage(RegisterMaterial("ui_mp_br_blade_list_button_asterik"), 0)
		var_15_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 100, _1080p * 7, _1080p * 39)
		var_15_0:addElement(var_15_17)

		var_15_0.WZWipAsterik = var_15_17
	end

	local function var_15_18()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_18

	local var_15_19
	local var_15_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 15327545,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_15_8:RegisterAnimationSequence("ButtonPurchase", var_15_20)

	local var_15_21 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonPurchase", var_15_21)

	local var_15_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonPurchase", var_15_22)

	local var_15_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonPurchase", var_15_23)

	local function var_15_24()
		var_15_8:AnimateSequence("ButtonPurchase")
		var_15_10:AnimateSequence("ButtonPurchase")
		var_15_12:AnimateSequence("ButtonPurchase")
		var_15_14:AnimateSequence("ButtonPurchase")
	end

	var_15_0._sequences.ButtonPurchase = var_15_24

	local var_15_25
	local var_15_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUp", var_15_26)

	local var_15_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("ButtonUp", var_15_27)

	local var_15_28 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.MainMenuLines
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUp", var_15_28)

	local function var_15_29()
		var_15_6:AnimateSequence("ButtonUp")
		var_15_8:AnimateSequence("ButtonUp")
		var_15_10:AnimateSequence("ButtonUp")
	end

	var_15_0._sequences.ButtonUp = var_15_29

	local var_15_30
	local var_15_31 = {
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

	var_15_10:RegisterAnimationSequence("Locked", var_15_31)

	local var_15_32 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("Locked", var_15_32)

	local function var_15_33()
		var_15_10:AnimateSequence("Locked")
		var_15_14:AnimateSequence("Locked")
	end

	var_15_0._sequences.Locked = var_15_33

	local var_15_34
	local var_15_35 = {
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

	var_15_10:RegisterAnimationSequence("NewNotification", var_15_35)

	local function var_15_36()
		var_15_10:AnimateSequence("NewNotification")
	end

	var_15_0._sequences.NewNotification = var_15_36

	local var_15_37
	local var_15_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("ButtonOverDisabled", var_15_38)

	local var_15_39 = {
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

	var_15_10:RegisterAnimationSequence("ButtonOverDisabled", var_15_39)

	local var_15_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonOverDisabled", var_15_40)

	local function var_15_41()
		var_15_8:AnimateSequence("ButtonOverDisabled")
		var_15_10:AnimateSequence("ButtonOverDisabled")
		var_15_14:AnimateSequence("ButtonOverDisabled")
	end

	var_15_0._sequences.ButtonOverDisabled = var_15_41

	local var_15_42
	local var_15_43 = {
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

	var_15_10:RegisterAnimationSequence("ButtonUpDisabled", var_15_43)

	local var_15_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonUpDisabled", var_15_44)

	local function var_15_45()
		var_15_10:AnimateSequence("ButtonUpDisabled")
		var_15_14:AnimateSequence("ButtonUpDisabled")
	end

	var_15_0._sequences.ButtonUpDisabled = var_15_45

	local var_15_46
	local var_15_47 = {
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

	var_15_10:RegisterAnimationSequence("ButtonUpSnap", var_15_47)

	local function var_15_48()
		var_15_10:AnimateSequence("ButtonUpSnap")
	end

	var_15_0._sequences.ButtonUpSnap = var_15_48

	local var_15_49
	local var_15_50 = {
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

	var_15_10:RegisterAnimationSequence("ButtonUpDisabledSnap", var_15_50)

	local function var_15_51()
		var_15_10:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_15_0._sequences.ButtonUpDisabledSnap = var_15_51

	local var_15_52
	local var_15_53 = {
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

	var_15_10:RegisterAnimationSequence("AR", var_15_53)

	local var_15_54 = {
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

	var_15_14:RegisterAnimationSequence("AR", var_15_54)

	local var_15_55 = {
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
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_install")
		}
	}

	var_15_16:RegisterAnimationSequence("AR", var_15_55)

	local function var_15_56()
		var_15_10:AnimateSequence("AR")
		var_15_14:AnimateSequence("AR")
		var_15_16:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_56

	local var_15_57
	local var_15_58 = {
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

	var_15_10:RegisterAnimationSequence("Enabled", var_15_58)

	local var_15_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("Enabled", var_15_59)

	local function var_15_60()
		var_15_10:AnimateSequence("Enabled")
		var_15_14:AnimateSequence("Enabled")
	end

	var_15_0._sequences.Enabled = var_15_60

	local var_15_61
	local var_15_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("Disabled", var_15_62)

	local var_15_63 = {
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

	var_15_10:RegisterAnimationSequence("Disabled", var_15_63)

	local var_15_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("Disabled", var_15_64)

	local function var_15_65()
		var_15_8:AnimateSequence("Disabled")
		var_15_10:AnimateSequence("Disabled")
		var_15_14:AnimateSequence("Disabled")
	end

	var_15_0._sequences.Disabled = var_15_65

	local var_15_66
	local var_15_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.MainMenuLines
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("ButtonOver", var_15_67)

	local var_15_68 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOver", var_15_68)

	local var_15_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonOver", var_15_69)

	local function var_15_70()
		var_15_8:AnimateSequence("ButtonOver")
		var_15_10:AnimateSequence("ButtonOver")
		var_15_14:AnimateSequence("ButtonOver")
	end

	var_15_0._sequences.ButtonOver = var_15_70

	local var_15_71
	local var_15_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipButtonOver", var_15_72)

	local var_15_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonOver", var_15_73)

	if CONDITIONS.AlwaysFalse() then
		local var_15_74 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_17:RegisterAnimationSequence("WZWipButtonOver", var_15_74)
	end

	local function var_15_75()
		var_15_8:AnimateSequence("WZWipButtonOver")
		var_15_10:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.AlwaysFalse() then
			var_15_17:AnimateSequence("WZWipButtonOver")
		end
	end

	var_15_0._sequences.WZWipButtonOver = var_15_75

	local var_15_76
	local var_15_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("WZWipSetup", var_15_77)

	local var_15_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipSetup", var_15_78)

	local var_15_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipSetup", var_15_79)

	local var_15_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipSetup", var_15_80)

	local var_15_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipSetup", var_15_81)

	local function var_15_82()
		var_15_4:AnimateSequence("WZWipSetup")
		var_15_6:AnimateSequence("WZWipSetup")
		var_15_8:AnimateSequence("WZWipSetup")
		var_15_10:AnimateSequence("WZWipSetup")
		var_15_14:AnimateSequence("WZWipSetup")
	end

	var_15_0._sequences.WZWipSetup = var_15_82

	local var_15_83
	local var_15_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipButtonUp", var_15_84)

	local var_15_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonUp", var_15_85)

	local var_15_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipButtonUp", var_15_86)

	if CONDITIONS.AlwaysFalse() then
		local var_15_87 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_17:RegisterAnimationSequence("WZWipButtonUp", var_15_87)
	end

	local function var_15_88()
		var_15_8:AnimateSequence("WZWipButtonUp")
		var_15_10:AnimateSequence("WZWipButtonUp")
		var_15_14:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.AlwaysFalse() then
			var_15_17:AnimateSequence("WZWipButtonUp")
		end
	end

	var_15_0._sequences.WZWipButtonUp = var_15_88

	local var_15_89
	local var_15_90 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_15_90)

	local var_15_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_15_91)

	local function var_15_92()
		var_15_8:AnimateSequence("WZWipButtonOverDisabled")
		var_15_10:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_15_0._sequences.WZWipButtonOverDisabled = var_15_92

	local var_15_93
	local var_15_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_15_94)

	local var_15_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_15_95)

	local function var_15_96()
		var_15_8:AnimateSequence("WZWipButtonUpDisabled")
		var_15_10:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_15_0._sequences.WZWipButtonUpDisabled = var_15_96

	local var_15_97
	local var_15_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_15_98)

	local var_15_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_15_99)

	local function var_15_100()
		var_15_8:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_15_10:AnimateSequence("WZWipButtonUpDisabledSnap")
	end

	var_15_0._sequences.WZWipButtonUpDisabledSnap = var_15_100

	local var_15_101
	local var_15_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipEnabled", var_15_102)

	local var_15_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipEnabled", var_15_103)

	local var_15_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipEnabled", var_15_104)

	local function var_15_105()
		var_15_8:AnimateSequence("WZWipEnabled")
		var_15_10:AnimateSequence("WZWipEnabled")
		var_15_14:AnimateSequence("WZWipEnabled")
	end

	var_15_0._sequences.WZWipEnabled = var_15_105

	local var_15_106
	local var_15_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipDisabled", var_15_107)

	local var_15_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipDisabled", var_15_108)

	local function var_15_109()
		var_15_8:AnimateSequence("WZWipDisabled")
		var_15_10:AnimateSequence("WZWipDisabled")
	end

	var_15_0._sequences.WZWipDisabled = var_15_109

	local var_15_110
	local var_15_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipLocked", var_15_111)

	local var_15_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipLocked", var_15_112)

	local var_15_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipLocked", var_15_113)

	local function var_15_114()
		var_15_8:AnimateSequence("WZWipLocked")
		var_15_10:AnimateSequence("WZWipLocked")
		var_15_14:AnimateSequence("WZWipLocked")
	end

	var_15_0._sequences.WZWipLocked = var_15_114

	local var_15_115
	local var_15_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipNewNotification", var_15_116)

	local var_15_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipNewNotification", var_15_117)

	local var_15_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipNewNotification", var_15_118)

	local function var_15_119()
		var_15_8:AnimateSequence("WZWipNewNotification")
		var_15_10:AnimateSequence("WZWipNewNotification")
		var_15_14:AnimateSequence("WZWipNewNotification")
	end

	var_15_0._sequences.WZWipNewNotification = var_15_119

	local var_15_120
	local var_15_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipButtonUpSnap", var_15_121)

	local var_15_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonUpSnap", var_15_122)

	local var_15_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipButtonUpSnap", var_15_123)

	local function var_15_124()
		var_15_8:AnimateSequence("WZWipButtonUpSnap")
		var_15_10:AnimateSequence("WZWipButtonUpSnap")
		var_15_14:AnimateSequence("WZWipButtonUpSnap")
	end

	var_15_0._sequences.WZWipButtonUpSnap = var_15_124

	local var_15_125

	if CONDITIONS.AlwaysFalse() then
		local var_15_126 = {
			{
				value = 13642801,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_15_17:RegisterAnimationSequence("SetThemeColdWar", var_15_126)
	end

	local function var_15_127()
		if CONDITIONS.AlwaysFalse() then
			var_15_17:AnimateSequence("SetThemeColdWar")
		end
	end

	var_15_0._sequences.SetThemeColdWar = var_15_127

	local var_15_128

	if CONDITIONS.AlwaysFalse() then
		local var_15_129 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_15_17:RegisterAnimationSequence("SetThemeMW", var_15_129)
	end

	local function var_15_130()
		if CONDITIONS.AlwaysFalse() then
			var_15_17:AnimateSequence("SetThemeMW")
		end
	end

	var_15_0._sequences.SetThemeMW = var_15_130

	local var_15_131
	local var_15_132 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipButtonOverSmall", var_15_132)

	local var_15_133 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonOverSmall", var_15_133)

	if CONDITIONS.AlwaysFalse() then
		local var_15_134 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_17:RegisterAnimationSequence("WZWipButtonOverSmall", var_15_134)
	end

	local function var_15_135()
		var_15_8:AnimateSequence("WZWipButtonOverSmall")
		var_15_10:AnimateSequence("WZWipButtonOverSmall")

		if CONDITIONS.AlwaysFalse() then
			var_15_17:AnimateSequence("WZWipButtonOverSmall")
		end
	end

	var_15_0._sequences.WZWipButtonOverSmall = var_15_135

	local var_15_136
	local var_15_137 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipButtonOverDisabledSmall", var_15_137)

	local var_15_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipButtonOverDisabledSmall", var_15_138)

	local function var_15_139()
		var_15_8:AnimateSequence("WZWipButtonOverDisabledSmall")
		var_15_10:AnimateSequence("WZWipButtonOverDisabledSmall")
	end

	var_15_0._sequences.WZWipButtonOverDisabledSmall = var_15_139

	local function var_15_140()
		return
	end

	var_15_0._sequences.SetThemeCortez = var_15_140

	var_15_0:addEventHandler("disable", function(arg_45_0, arg_45_1)
		if not arg_45_1.controller then
			local var_45_0 = var_15_1
		end

		ACTIONS.AnimateSequence(var_15_0, "Disabled")
	end)
	var_15_0:addEventHandler("enable", function(arg_46_0, arg_46_1)
		if not arg_46_1.controller then
			local var_46_0 = var_15_1
		end

		ACTIONS.AnimateSequence(var_15_0, "Enabled")
	end)
	PostLoadFunc(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("WZBladeButton", WZBladeButton)
LockTable(_M)
