module(..., package.seeall)

function RefreshAnimation(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		WZWIP.AnimateThemeElement(arg_1_0, arg_1_1)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	if IsLanguageArabic() then
		WZWIP.AnimateThemeElement(arg_2_0, "AR")
	end

	arg_2_0:addEventHandler("ignore_game_mode_layout", function(arg_3_0, arg_3_1)
		arg_2_0._ignoreGameModeLayout = true
	end)
	arg_2_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		RefreshAnimation(arg_4_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		RefreshAnimation(arg_5_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, "ButtonUpDisabled")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonOverDisabled")
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function MenuButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 40 * _1080p)

	var_8_0.id = "MenuButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "GenericButtonBackground"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.GenericButtonBackground = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "Text"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_6:setText("", 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_6:SetStartupDelay(1000)
	var_8_6:SetLineHoldTime(500)
	var_8_6:SetAnimMoveTime(500)
	var_8_6:SetAnimMoveSpeed(50)
	var_8_6:SetEndDelay(1000)
	var_8_6:SetCrossfadeTime(500)
	var_8_6:SetFadeInTime(300)
	var_8_6:SetFadeOutTime(300)
	var_8_6:SetMaxVisibleLines(1)
	var_8_6:SetOutlineRGBFromInt(0, 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_6)

	var_8_0.Text = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Lock"

	var_8_8:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_8_8:SetAlpha(0, 0)
	var_8_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -35, _1080p * -9, _1080p * -13, _1080p * 13)
	var_8_0:addElement(var_8_8)

	var_8_0.Lock = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10
	local var_8_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_11)

	local var_8_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_12)

	local function var_8_13()
		var_8_6:AnimateSequence("ButtonOver")
		var_8_8:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_13

	local var_8_14
	local var_8_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_15)

	local var_8_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_16)

	local function var_8_17()
		var_8_6:AnimateSequence("ButtonUp")
		var_8_8:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_17

	local var_8_18
	local var_8_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Locked", var_8_19)

	local function var_8_20()
		var_8_6:AnimateSequence("Locked")
	end

	var_8_0._sequences.Locked = var_8_20

	local var_8_21
	local var_8_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("NewNotification", var_8_22)

	local function var_8_23()
		var_8_6:AnimateSequence("NewNotification")
	end

	var_8_0._sequences.NewNotification = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			value = 5066061,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOverDisabled", var_8_25)

	local var_8_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.lockColor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOverDisabled", var_8_26)

	local function var_8_27()
		var_8_6:AnimateSequence("ButtonOverDisabled")
		var_8_8:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpDisabled", var_8_29)

	local var_8_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.lockColor
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpDisabled", var_8_30)

	local function var_8_31()
		var_8_6:AnimateSequence("ButtonUpDisabled")
		var_8_8:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_31

	local var_8_32
	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_6:RegisterAnimationSequence("AR", var_8_33)

	local var_8_34 = {
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
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 35
		}
	}

	var_8_8:RegisterAnimationSequence("AR", var_8_34)

	local function var_8_35()
		var_8_6:AnimateSequence("AR")
		var_8_8:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_35

	local var_8_36
	local var_8_37 = {
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

	var_8_6:RegisterAnimationSequence("WZWipSetup", var_8_37)

	local function var_8_38()
		var_8_6:AnimateSequence("WZWipSetup")
	end

	var_8_0._sequences.WZWipSetup = var_8_38

	local var_8_39
	local var_8_40 = {
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonOver", var_8_40)

	local var_8_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipButtonOver", var_8_41)

	local function var_8_42()
		var_8_6:AnimateSequence("WZWipButtonOver")
		var_8_8:AnimateSequence("WZWipButtonOver")
	end

	var_8_0._sequences.WZWipButtonOver = var_8_42

	local var_8_43
	local var_8_44 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_44)

	local var_8_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.lockColor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_45)

	local function var_8_46()
		var_8_6:AnimateSequence("WZWipButtonOverDisabled")
		var_8_8:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_8_0._sequences.WZWipButtonOverDisabled = var_8_46

	local var_8_47
	local var_8_48 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonUp", var_8_48)

	local var_8_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipButtonUp", var_8_49)

	local function var_8_50()
		var_8_6:AnimateSequence("WZWipButtonUp")
		var_8_8:AnimateSequence("WZWipButtonUp")
	end

	var_8_0._sequences.WZWipButtonUp = var_8_50

	local var_8_51
	local var_8_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_52)

	local var_8_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.lockColor
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_53)

	local function var_8_54()
		var_8_6:AnimateSequence("WZWipButtonUpDisabled")
		var_8_8:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_8_0._sequences.WZWipButtonUpDisabled = var_8_54

	local var_8_55
	local var_8_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_8_6:RegisterAnimationSequence("CenterText", var_8_56)

	local function var_8_57()
		var_8_6:AnimateSequence("CenterText")
	end

	var_8_0._sequences.CenterText = var_8_57

	local var_8_58
	local var_8_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_8_6:RegisterAnimationSequence("DefaultText", var_8_59)

	local function var_8_60()
		var_8_6:AnimateSequence("DefaultText")
	end

	var_8_0._sequences.DefaultText = var_8_60

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("MenuButton", MenuButton)
LockTable(_M)
