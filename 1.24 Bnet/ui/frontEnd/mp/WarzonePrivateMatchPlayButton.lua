module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LUI.FlowManager.GetScopedData(arg_1_0)

	arg_1_0:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestAddMenu("GameModes", true, arg_2_1.controller, false, {
			isWarzone = var_1_0.isWarzone,
			matchmakerSettings = var_1_0.matchmakerSettings
		}, true)
	end)
	arg_1_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "WZButtonOver")
		ACTIONS.SetFont(arg_3_0.Name, FONTS.MainBold)
	end)
	arg_1_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, "WZButtonUp")
		ACTIONS.AnimateSequence(arg_4_0.Background, "WZButtonUp")
		ACTIONS.SetFont(arg_4_0.Name, FONTS.MainRegular)
	end)
	arg_1_0:addEventHandler("disable", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_5_0, "ButtonUpDisabled")
		ACTIONS.AnimateSequence(arg_5_0, "Disabled")
		ACTIONS.SetFont(arg_5_0.Name, FONTS.MainRegular)
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		ACTIONS.SetFont(arg_6_0.Name, FONTS.MainBold)
	end)
	arg_1_0:addEventHandler("enable", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0, "Enabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	assert(arg_1_0.Background)
	arg_1_0.Background:SetWZTheme(true)
	ACTIONS.AnimateSequence(arg_1_0, "WZButtonUp")
	ACTIONS.AnimateSequence(arg_1_0.Background, "WZButtonUp")
end

function WarzonePrivateMatchPlayButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_8_0.id = "WarzonePrivateMatchPlayButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "Background"

	var_8_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "Name"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAY_WARZONE_PRIVATE_MATCH")), 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_6:SetWordWrap(false)
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_6:SetStartupDelay(2000)
	var_8_6:SetLineHoldTime(400)
	var_8_6:SetAnimMoveTime(2000)
	var_8_6:SetAnimMoveSpeed(150)
	var_8_6:SetEndDelay(2000)
	var_8_6:SetCrossfadeTime(250)
	var_8_6:SetFadeInTime(300)
	var_8_6:SetFadeOutTime(300)
	var_8_6:SetMaxVisibleLines(1)
	var_8_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 358, _1080p * -59, _1080p * -29)
	var_8_0:addElement(var_8_6)

	var_8_0.Name = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Lock"

	var_8_8:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_8_8:SetAlpha(0, 0)
	var_8_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -40, _1080p * -10, _1080p * 35, _1080p * 65)
	var_8_0:addElement(var_8_8)

	var_8_0.Lock = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIStyledText.new()

	var_8_10.id = "Description"

	var_8_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_10:SetAlpha(0, 0)
	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_8_10:SetStartupDelay(2000)
	var_8_10:SetLineHoldTime(2000)
	var_8_10:SetAnimMoveTime(1000)
	var_8_10:SetAnimMoveSpeed(150)
	var_8_10:SetEndDelay(2000)
	var_8_10:SetCrossfadeTime(1000)
	var_8_10:SetFadeInTime(300)
	var_8_10:SetFadeOutTime(300)
	var_8_10:SetMaxVisibleLines(2)
	var_8_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 343, _1080p * -29, _1080p * -9)
	var_8_0:addElement(var_8_10)

	var_8_0.Description = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIStyledText.new()

	var_8_12.id = "DisabledText"

	var_8_12:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_8_12:SetAlpha(0, 0)
	var_8_12:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetWordWrap(false)
	var_8_12:SetAlignment(LUI.Alignment.Left)
	var_8_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_12:SetStartupDelay(2000)
	var_8_12:SetLineHoldTime(400)
	var_8_12:SetAnimMoveTime(2000)
	var_8_12:SetAnimMoveSpeed(150)
	var_8_12:SetEndDelay(2000)
	var_8_12:SetCrossfadeTime(1000)
	var_8_12:SetFadeInTime(300)
	var_8_12:SetFadeOutTime(300)
	var_8_12:SetMaxVisibleLines(1)
	var_8_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 37, _1080p * 57)
	var_8_0:addElement(var_8_12)

	var_8_0.DisabledText = var_8_12

	local function var_8_13()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_13

	local var_8_14
	local var_8_15 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_15)

	local var_8_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_16)

	local var_8_17 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOver", var_8_17)

	local function var_8_18()
		var_8_6:AnimateSequence("ButtonOver")
		var_8_8:AnimateSequence("ButtonOver")
		var_8_10:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_18

	local var_8_19
	local var_8_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_20)

	local var_8_21 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUp", var_8_21)

	local function var_8_22()
		var_8_6:AnimateSequence("ButtonUp")
		var_8_10:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_22

	local var_8_23
	local var_8_24 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonOverDisabled", var_8_24)

	local function var_8_25()
		var_8_12:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_25

	local function var_8_26()
		return
	end

	var_8_0._sequences.ButtonOverDisabledKBM = var_8_26

	local var_8_27
	local var_8_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpDisabled", var_8_28)

	local var_8_29 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUpDisabled", var_8_29)

	local function var_8_30()
		var_8_6:AnimateSequence("ButtonUpDisabled")
		var_8_12:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_30

	local var_8_31
	local var_8_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOverKBM", var_8_32)

	local function var_8_33()
		var_8_6:AnimateSequence("ButtonOverKBM")
	end

	var_8_0._sequences.ButtonOverKBM = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Disabled", var_8_35)

	local function var_8_36()
		var_8_8:AnimateSequence("Disabled")
	end

	var_8_0._sequences.Disabled = var_8_36

	local function var_8_37()
		return
	end

	var_8_0._sequences.DisabledAR = var_8_37

	local var_8_38
	local var_8_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Enabled", var_8_39)

	local function var_8_40()
		var_8_8:AnimateSequence("Enabled")
	end

	var_8_0._sequences.Enabled = var_8_40

	local function var_8_41()
		return
	end

	var_8_0._sequences.EnabledAR = var_8_41

	local var_8_42
	local var_8_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -16
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

	var_8_6:RegisterAnimationSequence("AR", var_8_43)

	local var_8_44 = {
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
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 35
		}
	}

	var_8_8:RegisterAnimationSequence("AR", var_8_44)

	local var_8_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -336
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		}
	}

	var_8_10:RegisterAnimationSequence("AR", var_8_45)

	local var_8_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -376
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		}
	}

	var_8_12:RegisterAnimationSequence("AR", var_8_46)

	local function var_8_47()
		var_8_6:AnimateSequence("AR")
		var_8_8:AnimateSequence("AR")
		var_8_10:AnimateSequence("AR")
		var_8_12:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_47

	local var_8_48
	local var_8_49 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_8_6:RegisterAnimationSequence("WZButtonOver", var_8_49)

	local var_8_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZButtonOver", var_8_50)

	local var_8_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneDescription
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZButtonOver", var_8_51)

	local function var_8_52()
		var_8_6:AnimateSequence("WZButtonOver")
		var_8_8:AnimateSequence("WZButtonOver")
		var_8_10:AnimateSequence("WZButtonOver")
	end

	var_8_0._sequences.WZButtonOver = var_8_52

	local var_8_53
	local var_8_54 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextDefault
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_8_6:RegisterAnimationSequence("WZButtonUp", var_8_54)

	local var_8_55 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZButtonUp", var_8_55)

	local function var_8_56()
		var_8_6:AnimateSequence("WZButtonUp")
		var_8_10:AnimateSequence("WZButtonUp")
	end

	var_8_0._sequences.WZButtonUp = var_8_56

	local var_8_57
	local var_8_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.warzoneTextFocus
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_8_6:RegisterAnimationSequence("WZButtonOverKBM", var_8_58)

	local function var_8_59()
		var_8_6:AnimateSequence("WZButtonOverKBM")
	end

	var_8_0._sequences.WZButtonOverKBM = var_8_59

	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WarzonePrivateMatchPlayButton", WarzonePrivateMatchPlayButton)
LockTable(_M)
