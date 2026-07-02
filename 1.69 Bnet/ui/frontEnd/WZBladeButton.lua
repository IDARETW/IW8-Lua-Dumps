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

	local function var_7_1(arg_9_0)
		local var_9_0 = IsLanguageArabic() ~= true
		local var_9_1

		if var_9_0 then
			local var_9_2 = 40
			local var_9_3 = 64
			local var_9_4 = LAYOUT.GetTextWidth(arg_9_0.Text)
			local var_9_5 = 1.5

			var_9_1 = (var_9_4 + var_9_2) * var_9_5 * _1080p

			if arg_9_0.ButtonBacking then
				arg_9_0.ButtonBacking:SetAnchorsAndPosition(0.5, 0.5, 0, 1, -var_9_1, var_9_1, 0, _1080p * var_9_3)
			end
		end

		if arg_7_0._downloadIconEnabled then
			arg_9_0.DownloadIcon:SetAlpha(1)

			if var_9_0 then
				local var_9_6, var_9_7, var_9_8, var_9_9 = arg_9_0.DownloadIcon:getLocalRect()
				local var_9_10 = var_9_8 - var_9_6
				local var_9_11 = 15

				arg_9_0.DownloadIcon:SetLeft(var_9_1 - (var_9_10 + var_9_11), 0)
				arg_9_0.DownloadIcon:SetRight(var_9_1 - var_9_11, 0)
			end
		end
	end

	arg_7_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		arg_10_0._lastState = "ButtonOver"

		local var_10_0 = CONDITIONS.IsLanguageAsian() and CONDITIONS.IsLazeOrOutrun()

		WZWIP.AnimateThemeElement(arg_10_0, "ButtonOver", {
			resizeSmallIfLanguage = {
				IsLanguageChinese,
				IsLanguageKorean,
				IsLanguageJapanese
			},
			forceSmall = arg_7_0._isForcedSmall,
			conditionOverride = var_10_0
		})
		arg_10_0.Background:SetupButton(arg_10_0.Text, arg_10_0.Text:getText(), var_7_0)
		var_7_1(arg_10_0)
	end)
	arg_7_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		arg_7_0.DownloadIcon:SetAlpha(0)
	end)
	arg_7_0:addEventHandler("button_disable", function(arg_12_0, arg_12_1)
		var_0_4(arg_12_0, "ButtonUpDisabled", {
			snap = arg_12_1.snap
		})
	end)
	arg_7_0:addEventHandler("button_over_disable", function(arg_13_0, arg_13_1)
		var_0_4(arg_13_0, "ButtonOverDisabled", {
			resizeSmallIfLanguage = {
				IsLanguageChinese,
				IsLanguageKorean,
				IsLanguageJapanese
			},
			forceSmall = arg_7_0._isForcedSmall
		})
		arg_13_0.Background:SetupButton(arg_13_0.Text, arg_13_0.Text:getText(), var_7_0)
		var_7_1(arg_13_0)
	end)
	arg_7_0:addEventHandler("disable", function(arg_14_0, arg_14_1)
		WZWIP.AnimateThemeElement(arg_14_0, "Disabled")
	end)
	arg_7_0:addEventHandler("enable", function(arg_15_0, arg_15_1)
		WZWIP.AnimateThemeElement(arg_15_0, "Enabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_7_0, "WZWipSetup")
	end

	var_0_4(arg_7_0, arg_7_0._defaultState)
end

function WZBladeButton(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIButton.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 46 * _1080p)

	var_16_0.id = "WZBladeButton"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "BackgroundDarkener"

	var_16_4:SetRGBFromInt(0, 0)
	var_16_4:SetAlpha(0, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.BackgroundDarkener = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "Background"

	var_16_6:SetAlpha(0, 0)
	var_16_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_16_0:addElement(var_16_6)

	var_16_0.Background = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIImage.new()

	var_16_8.id = "ButtonBacking"

	var_16_8:SetRGBFromInt(15066083, 0)
	var_16_8:setImage(RegisterMaterial("menu_blade_highlight_backing_ch2"), 0)
	var_16_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -214, _1080p * 212, 0, _1080p * 64)
	var_16_0:addElement(var_16_8)

	var_16_0.ButtonBacking = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIStyledText.new()

	var_16_10.id = "Text"

	var_16_10:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_16_10:setText(ToUpperCase(""), 0)
	var_16_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_16_10:SetAlignment(LUI.Alignment.Center)
	var_16_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_16_10:SetStartupDelay(2000)
	var_16_10:SetLineHoldTime(400)
	var_16_10:SetAnimMoveTime(300)
	var_16_10:SetAnimMoveSpeed(50)
	var_16_10:SetEndDelay(1500)
	var_16_10:SetCrossfadeTime(750)
	var_16_10:SetFadeInTime(300)
	var_16_10:SetFadeOutTime(300)
	var_16_10:SetMaxVisibleLines(1)
	var_16_10:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_16_10:SetOutlineRGBFromInt(0, 0)
	var_16_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 13)
	var_16_0:addElement(var_16_10)

	var_16_0.Text = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIStyledText.new()

	var_16_12.id = "TextPurchaseDescr"

	var_16_12:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_16_12:SetAlpha(0, 0)
	var_16_12:setText("Promo", 0)
	var_16_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_12:SetAlignment(LUI.Alignment.Center)
	var_16_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_16_12:SetStartupDelay(2000)
	var_16_12:SetLineHoldTime(400)
	var_16_12:SetAnimMoveTime(300)
	var_16_12:SetAnimMoveSpeed(50)
	var_16_12:SetEndDelay(1500)
	var_16_12:SetCrossfadeTime(750)
	var_16_12:SetFadeInTime(300)
	var_16_12:SetFadeOutTime(300)
	var_16_12:SetMaxVisibleLines(1)
	var_16_12:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_16_12:SetOutlineRGBFromInt(0, 0)
	var_16_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * 29, _1080p * 53)
	var_16_0:addElement(var_16_12)

	var_16_0.TextPurchaseDescr = var_16_12

	local var_16_13
	local var_16_14 = LUI.UIImage.new()

	var_16_14.id = "Lock"

	var_16_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_16_14:SetAlpha(0, 0)
	var_16_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_16_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_16_0:addElement(var_16_14)

	var_16_0.Lock = var_16_14

	local var_16_15
	local var_16_16 = LUI.UIImage.new()

	var_16_16.id = "DownloadIcon"

	var_16_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_16_16:SetAlpha(0, 0)
	var_16_16:setImage(RegisterMaterial("icon_install"), 0)
	var_16_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 142, _1080p * 168, _1080p * -11, _1080p * 15)
	var_16_0:addElement(var_16_16)

	var_16_0.DownloadIcon = var_16_16

	local var_16_17

	if CONDITIONS.AlwaysFalse() then
		var_16_17 = LUI.UIImage.new()
		var_16_17.id = "WZWipAsterik"

		var_16_17:SetRGBFromInt(13642801, 0)
		var_16_17:SetAlpha(0, 0)
		var_16_17:setImage(RegisterMaterial("ui_mp_br_blade_list_button_asterik"), 0)
		var_16_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 100, _1080p * 7, _1080p * 39)
		var_16_0:addElement(var_16_17)

		var_16_0.WZWipAsterik = var_16_17
	end

	local function var_16_18()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_18

	local var_16_19
	local var_16_20 = {
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

	var_16_8:RegisterAnimationSequence("ButtonPurchase", var_16_20)

	local var_16_21 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonPurchase", var_16_21)

	local var_16_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonPurchase", var_16_22)

	local var_16_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonPurchase", var_16_23)

	local function var_16_24()
		var_16_8:AnimateSequence("ButtonPurchase")
		var_16_10:AnimateSequence("ButtonPurchase")
		var_16_12:AnimateSequence("ButtonPurchase")
		var_16_14:AnimateSequence("ButtonPurchase")
	end

	var_16_0._sequences.ButtonPurchase = var_16_24

	local var_16_25
	local var_16_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUp", var_16_26)

	local var_16_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUp", var_16_27)

	local var_16_28 = {
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

	var_16_10:RegisterAnimationSequence("ButtonUp", var_16_28)

	local function var_16_29()
		var_16_6:AnimateSequence("ButtonUp")
		var_16_8:AnimateSequence("ButtonUp")
		var_16_10:AnimateSequence("ButtonUp")
	end

	var_16_0._sequences.ButtonUp = var_16_29

	local var_16_30
	local var_16_31 = {
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

	var_16_10:RegisterAnimationSequence("Locked", var_16_31)

	local var_16_32 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("Locked", var_16_32)

	local function var_16_33()
		var_16_10:AnimateSequence("Locked")
		var_16_14:AnimateSequence("Locked")
	end

	var_16_0._sequences.Locked = var_16_33

	local var_16_34
	local var_16_35 = {
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

	var_16_10:RegisterAnimationSequence("NewNotification", var_16_35)

	local function var_16_36()
		var_16_10:AnimateSequence("NewNotification")
	end

	var_16_0._sequences.NewNotification = var_16_36

	local var_16_37
	local var_16_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOverDisabled", var_16_38)

	local var_16_39 = {
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

	var_16_10:RegisterAnimationSequence("ButtonOverDisabled", var_16_39)

	local var_16_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonOverDisabled", var_16_40)

	local function var_16_41()
		var_16_8:AnimateSequence("ButtonOverDisabled")
		var_16_10:AnimateSequence("ButtonOverDisabled")
		var_16_14:AnimateSequence("ButtonOverDisabled")
	end

	var_16_0._sequences.ButtonOverDisabled = var_16_41

	local var_16_42
	local var_16_43 = {
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

	var_16_10:RegisterAnimationSequence("ButtonUpDisabled", var_16_43)

	local var_16_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonUpDisabled", var_16_44)

	local function var_16_45()
		var_16_10:AnimateSequence("ButtonUpDisabled")
		var_16_14:AnimateSequence("ButtonUpDisabled")
	end

	var_16_0._sequences.ButtonUpDisabled = var_16_45

	local var_16_46
	local var_16_47 = {
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

	var_16_10:RegisterAnimationSequence("ButtonUpSnap", var_16_47)

	local function var_16_48()
		var_16_10:AnimateSequence("ButtonUpSnap")
	end

	var_16_0._sequences.ButtonUpSnap = var_16_48

	local var_16_49
	local var_16_50 = {
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

	var_16_10:RegisterAnimationSequence("ButtonUpDisabledSnap", var_16_50)

	local function var_16_51()
		var_16_10:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_16_0._sequences.ButtonUpDisabledSnap = var_16_51

	local var_16_52
	local var_16_53 = {
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

	var_16_10:RegisterAnimationSequence("AR", var_16_53)

	local var_16_54 = {
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

	var_16_14:RegisterAnimationSequence("AR", var_16_54)

	local var_16_55 = {
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

	var_16_16:RegisterAnimationSequence("AR", var_16_55)

	local function var_16_56()
		var_16_10:AnimateSequence("AR")
		var_16_14:AnimateSequence("AR")
		var_16_16:AnimateSequence("AR")
	end

	var_16_0._sequences.AR = var_16_56

	local var_16_57
	local var_16_58 = {
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

	var_16_10:RegisterAnimationSequence("Enabled", var_16_58)

	local var_16_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("Enabled", var_16_59)

	local function var_16_60()
		var_16_10:AnimateSequence("Enabled")
		var_16_14:AnimateSequence("Enabled")
	end

	var_16_0._sequences.Enabled = var_16_60

	local var_16_61
	local var_16_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("Disabled", var_16_62)

	local var_16_63 = {
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

	var_16_10:RegisterAnimationSequence("Disabled", var_16_63)

	local var_16_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("Disabled", var_16_64)

	local function var_16_65()
		var_16_8:AnimateSequence("Disabled")
		var_16_10:AnimateSequence("Disabled")
		var_16_14:AnimateSequence("Disabled")
	end

	var_16_0._sequences.Disabled = var_16_65

	local var_16_66
	local var_16_67 = {
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

	var_16_8:RegisterAnimationSequence("ButtonOver", var_16_67)

	local var_16_68 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOver", var_16_68)

	local var_16_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonOver", var_16_69)

	local function var_16_70()
		var_16_8:AnimateSequence("ButtonOver")
		var_16_10:AnimateSequence("ButtonOver")
		var_16_14:AnimateSequence("ButtonOver")
	end

	var_16_0._sequences.ButtonOver = var_16_70

	local var_16_71
	local var_16_72 = {
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

	var_16_8:RegisterAnimationSequence("WZWipButtonOver", var_16_72)

	local var_16_73 = {
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

	var_16_10:RegisterAnimationSequence("WZWipButtonOver", var_16_73)

	if CONDITIONS.AlwaysFalse() then
		local var_16_74 = {
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

		var_16_17:RegisterAnimationSequence("WZWipButtonOver", var_16_74)
	end

	local function var_16_75()
		var_16_8:AnimateSequence("WZWipButtonOver")
		var_16_10:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.AlwaysFalse() then
			var_16_17:AnimateSequence("WZWipButtonOver")
		end
	end

	var_16_0._sequences.WZWipButtonOver = var_16_75

	local var_16_76
	local var_16_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("WZWipSetup", var_16_77)

	local var_16_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("WZWipSetup", var_16_78)

	local var_16_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipSetup", var_16_79)

	local var_16_80 = {
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

	var_16_10:RegisterAnimationSequence("WZWipSetup", var_16_80)

	local var_16_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipSetup", var_16_81)

	local function var_16_82()
		var_16_4:AnimateSequence("WZWipSetup")
		var_16_6:AnimateSequence("WZWipSetup")
		var_16_8:AnimateSequence("WZWipSetup")
		var_16_10:AnimateSequence("WZWipSetup")
		var_16_14:AnimateSequence("WZWipSetup")
	end

	var_16_0._sequences.WZWipSetup = var_16_82

	local var_16_83
	local var_16_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonUp", var_16_84)

	local var_16_85 = {
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

	var_16_10:RegisterAnimationSequence("WZWipButtonUp", var_16_85)

	local var_16_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipButtonUp", var_16_86)

	if CONDITIONS.AlwaysFalse() then
		local var_16_87 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_16_17:RegisterAnimationSequence("WZWipButtonUp", var_16_87)
	end

	local function var_16_88()
		var_16_8:AnimateSequence("WZWipButtonUp")
		var_16_10:AnimateSequence("WZWipButtonUp")
		var_16_14:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.AlwaysFalse() then
			var_16_17:AnimateSequence("WZWipButtonUp")
		end
	end

	var_16_0._sequences.WZWipButtonUp = var_16_88

	local var_16_89
	local var_16_90 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_16_90)

	local var_16_91 = {
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

	var_16_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_16_91)

	local function var_16_92()
		var_16_8:AnimateSequence("WZWipButtonOverDisabled")
		var_16_10:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_16_0._sequences.WZWipButtonOverDisabled = var_16_92

	local var_16_93
	local var_16_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_16_94)

	local var_16_95 = {
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

	var_16_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_16_95)

	local function var_16_96()
		var_16_8:AnimateSequence("WZWipButtonUpDisabled")
		var_16_10:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_16_0._sequences.WZWipButtonUpDisabled = var_16_96

	local var_16_97
	local var_16_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_16_98)

	local var_16_99 = {
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

	var_16_10:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_16_99)

	local function var_16_100()
		var_16_8:AnimateSequence("WZWipButtonUpDisabledSnap")
		var_16_10:AnimateSequence("WZWipButtonUpDisabledSnap")
	end

	var_16_0._sequences.WZWipButtonUpDisabledSnap = var_16_100

	local var_16_101
	local var_16_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipEnabled", var_16_102)

	local var_16_103 = {
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

	var_16_10:RegisterAnimationSequence("WZWipEnabled", var_16_103)

	local var_16_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipEnabled", var_16_104)

	local function var_16_105()
		var_16_8:AnimateSequence("WZWipEnabled")
		var_16_10:AnimateSequence("WZWipEnabled")
		var_16_14:AnimateSequence("WZWipEnabled")
	end

	var_16_0._sequences.WZWipEnabled = var_16_105

	local var_16_106
	local var_16_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipDisabled", var_16_107)

	local var_16_108 = {
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

	var_16_10:RegisterAnimationSequence("WZWipDisabled", var_16_108)

	local function var_16_109()
		var_16_8:AnimateSequence("WZWipDisabled")
		var_16_10:AnimateSequence("WZWipDisabled")
	end

	var_16_0._sequences.WZWipDisabled = var_16_109

	local var_16_110
	local var_16_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipLocked", var_16_111)

	local var_16_112 = {
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

	var_16_10:RegisterAnimationSequence("WZWipLocked", var_16_112)

	local var_16_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipLocked", var_16_113)

	local function var_16_114()
		var_16_8:AnimateSequence("WZWipLocked")
		var_16_10:AnimateSequence("WZWipLocked")
		var_16_14:AnimateSequence("WZWipLocked")
	end

	var_16_0._sequences.WZWipLocked = var_16_114

	local var_16_115
	local var_16_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipNewNotification", var_16_116)

	local var_16_117 = {
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

	var_16_10:RegisterAnimationSequence("WZWipNewNotification", var_16_117)

	local var_16_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipNewNotification", var_16_118)

	local function var_16_119()
		var_16_8:AnimateSequence("WZWipNewNotification")
		var_16_10:AnimateSequence("WZWipNewNotification")
		var_16_14:AnimateSequence("WZWipNewNotification")
	end

	var_16_0._sequences.WZWipNewNotification = var_16_119

	local var_16_120
	local var_16_121 = {
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

	var_16_8:RegisterAnimationSequence("WZWipButtonUpSnap", var_16_121)

	local var_16_122 = {
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

	var_16_10:RegisterAnimationSequence("WZWipButtonUpSnap", var_16_122)

	local var_16_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipButtonUpSnap", var_16_123)

	local function var_16_124()
		var_16_8:AnimateSequence("WZWipButtonUpSnap")
		var_16_10:AnimateSequence("WZWipButtonUpSnap")
		var_16_14:AnimateSequence("WZWipButtonUpSnap")
	end

	var_16_0._sequences.WZWipButtonUpSnap = var_16_124

	local var_16_125

	if CONDITIONS.AlwaysFalse() then
		local var_16_126 = {
			{
				value = 13642801,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_16_17:RegisterAnimationSequence("SetThemeColdWar", var_16_126)
	end

	local function var_16_127()
		if CONDITIONS.AlwaysFalse() then
			var_16_17:AnimateSequence("SetThemeColdWar")
		end
	end

	var_16_0._sequences.SetThemeColdWar = var_16_127

	local var_16_128

	if CONDITIONS.AlwaysFalse() then
		local var_16_129 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_16_17:RegisterAnimationSequence("SetThemeMW", var_16_129)
	end

	local function var_16_130()
		if CONDITIONS.AlwaysFalse() then
			var_16_17:AnimateSequence("SetThemeMW")
		end
	end

	var_16_0._sequences.SetThemeMW = var_16_130

	local var_16_131
	local var_16_132 = {
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

	var_16_8:RegisterAnimationSequence("WZWipButtonOverSmall", var_16_132)

	local var_16_133 = {
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

	var_16_10:RegisterAnimationSequence("WZWipButtonOverSmall", var_16_133)

	if CONDITIONS.AlwaysFalse() then
		local var_16_134 = {
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

		var_16_17:RegisterAnimationSequence("WZWipButtonOverSmall", var_16_134)
	end

	local function var_16_135()
		var_16_8:AnimateSequence("WZWipButtonOverSmall")
		var_16_10:AnimateSequence("WZWipButtonOverSmall")

		if CONDITIONS.AlwaysFalse() then
			var_16_17:AnimateSequence("WZWipButtonOverSmall")
		end
	end

	var_16_0._sequences.WZWipButtonOverSmall = var_16_135

	local var_16_136
	local var_16_137 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonOverDisabledSmall", var_16_137)

	local var_16_138 = {
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

	var_16_10:RegisterAnimationSequence("WZWipButtonOverDisabledSmall", var_16_138)

	local function var_16_139()
		var_16_8:AnimateSequence("WZWipButtonOverDisabledSmall")
		var_16_10:AnimateSequence("WZWipButtonOverDisabledSmall")
	end

	var_16_0._sequences.WZWipButtonOverDisabledSmall = var_16_139

	local function var_16_140()
		return
	end

	var_16_0._sequences.SetThemeCortez = var_16_140

	var_16_0:addEventHandler("disable", function(arg_46_0, arg_46_1)
		if not arg_46_1.controller then
			local var_46_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "Disabled")
	end)
	var_16_0:addEventHandler("enable", function(arg_47_0, arg_47_1)
		if not arg_47_1.controller then
			local var_47_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "Enabled")
	end)
	PostLoadFunc(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("WZBladeButton", WZBladeButton)
LockTable(_M)
