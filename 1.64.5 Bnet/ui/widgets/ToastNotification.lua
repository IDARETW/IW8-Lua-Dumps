module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageArabic() then
		local var_1_0 = arg_1_0.Description
		local var_1_1 = arg_1_0.CenterDescription
		local var_1_2 = var_1_0:GetCurrentAnchorsAndPositions()
		local var_1_3 = var_1_1:GetCurrentAnchorsAndPositions()

		var_1_0:SetBottom(var_1_2.top + 28 * _1080p)
		var_1_1:SetBottom(var_1_3.top + 28 * _1080p)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = "button_start"
	local var_2_1 = "[{accept_notification}]"
	local var_2_2 = {
		{
			keyprompt_text = var_2_1,
			helper_text = Engine.CBBHFCGDIC(arg_2_1.leftTooltip or "LUA_MENU/ACCEPT_REQUEST"),
			button_ref = var_2_0
		}
	}
	local var_2_3 = {
		promptsData = var_2_2
	}

	arg_2_0.MenuButtonLeft:AddTooltipData(arg_2_0._controllerIndex, var_2_3)

	local var_2_4 = "[{decline_notification}]"
	local var_2_5 = {
		{
			keyprompt_text = var_2_4,
			helper_text = Engine.CBBHFCGDIC(arg_2_1.rightTooltip or "LUA_MENU/DISMISS_NOTIFICATION"),
			button_ref = var_2_0
		}
	}
	local var_2_6 = {
		promptsData = var_2_5
	}

	arg_2_0.MenuButtonRight:AddTooltipData(arg_2_0._controllerIndex, var_2_6)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupButtonsTooltipData = var_0_1
	arg_3_0._controllerIndex = arg_3_1

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_3_0, "JA")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end

	assert(arg_3_0.HeaderText)

	arg_3_0.HeaderText.usingBnetFont = false
	arg_3_0.AdjustARTextSize = var_0_0
end

function ToastNotification(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 67 * _1080p)

	var_4_0.id = "ToastNotification"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "BackingBlackLeft"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 60, _1080p * 225, _1080p * 70, _1080p * 108)
	var_4_0:addElement(var_4_4)

	var_4_0.BackingBlackLeft = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "BackingBlackRight"

	var_4_6:SetRGBFromInt(0, 0)
	var_4_6:SetAlpha(0, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 235, _1080p * 400, _1080p * 70, _1080p * 108)
	var_4_0:addElement(var_4_6)

	var_4_0.BackingBlackRight = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "Background"

	var_4_8:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_4_8.Background:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Background = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "MenuButtonRight"

	var_4_10:SetAlpha(0, 0)
	var_4_10.Text:SetLeft(_1080p * 20, 0)
	var_4_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/DISMISS_NOTIFICATION"), 0)
	var_4_10.Text:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 235, _1080p * 400, _1080p * 70, _1080p * 108)
	var_4_0:addElement(var_4_10)

	var_4_0.MenuButtonRight = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "IconBacker"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.notificationBackground, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 60, 0, 0)
	var_4_0:addElement(var_4_12)

	var_4_0.IconBacker = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "CenterDescription"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.notificationBackground, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetWordWrap(false)
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_14:SetStartupDelay(2000)
	var_4_14:SetLineHoldTime(400)
	var_4_14:SetAnimMoveTime(1500)
	var_4_14:SetAnimMoveSpeed(150)
	var_4_14:SetEndDelay(2000)
	var_4_14:SetCrossfadeTime(1000)
	var_4_14:SetFadeInTime(300)
	var_4_14:SetFadeOutTime(300)
	var_4_14:SetMaxVisibleLines(1)
	var_4_14:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 72, _1080p * -10, _1080p * 0.5, _1080p * 20.5)
	var_4_0:addElement(var_4_14)

	var_4_0.CenterDescription = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIStyledText.new()

	var_4_16.id = "Description"

	var_4_16:SetRGBFromTable(SWATCHES.genericMenu.notificationBackground, 0)
	var_4_16:setText("", 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_16:SetWordWrap(false)
	var_4_16:SetAlignment(LUI.Alignment.Left)
	var_4_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_16:SetStartupDelay(2000)
	var_4_16:SetLineHoldTime(400)
	var_4_16:SetAnimMoveTime(1500)
	var_4_16:SetAnimMoveSpeed(150)
	var_4_16:SetEndDelay(2000)
	var_4_16:SetCrossfadeTime(400)
	var_4_16:SetFadeInTime(300)
	var_4_16:SetFadeOutTime(300)
	var_4_16:SetMaxVisibleLines(1)
	var_4_16:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 72, _1080p * -34, _1080p * -1.5, _1080p * 20.5)
	var_4_0:addElement(var_4_16)

	var_4_0.Description = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "HoldButton"

	var_4_18:SetAlpha(0, 0)
	var_4_18.Text:setText(ToUpperCase(""), 0)
	var_4_18.Text:SetAlignment(LUI.Alignment.Left)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 225, _1080p * 79, _1080p * 104)
	var_4_0:addElement(var_4_18)

	var_4_0.HoldButton = var_4_18

	local var_4_19
	local var_4_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_20.id = "MenuButtonLeft"

	var_4_20:SetAlpha(0, 0)
	var_4_20.Text:SetLeft(_1080p * 20, 0)
	var_4_20.Text:setText(ToUpperCase(""), 0)
	var_4_20.Text:SetAlignment(LUI.Alignment.Left)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 60, _1080p * 225, _1080p * 70, _1080p * 108)
	var_4_0:addElement(var_4_20)

	var_4_0.MenuButtonLeft = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIImage.new()

	var_4_22.id = "Icon"

	var_4_22:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_4_22:setImage(RegisterMaterial("hud_icon_trap_package"), 0)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 54, _1080p * 6, _1080p * 54)
	var_4_0:addElement(var_4_22)

	var_4_0.Icon = var_4_22

	local var_4_23
	local var_4_24 = LUI.UIStyledText.new()

	var_4_24.id = "HeaderText"

	var_4_24:SetRGBFromTable(SWATCHES.genericMenu.notificationBackground, 0)
	var_4_24:setText("", 0)
	var_4_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_24:SetWordWrap(false)
	var_4_24:SetAlignment(LUI.Alignment.Left)
	var_4_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_24:SetStartupDelay(2000)
	var_4_24:SetLineHoldTime(400)
	var_4_24:SetAnimMoveTime(1500)
	var_4_24:SetAnimMoveSpeed(150)
	var_4_24:SetEndDelay(2000)
	var_4_24:SetCrossfadeTime(400)
	var_4_24:SetFadeInTime(300)
	var_4_24:SetFadeOutTime(300)
	var_4_24:SetMaxVisibleLines(1)
	var_4_24:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 72, _1080p * -34, _1080p * 2, _1080p * 22)
	var_4_0:addElement(var_4_24)

	var_4_0.HeaderText = var_4_24

	local var_4_25
	local var_4_26 = LUI.UIImage.new()

	var_4_26.id = "Line"

	var_4_26:SetRGBFromTable(SWATCHES.genericMenu.notificationBackground, 0)
	var_4_26:SetAlpha(0.4, 0)
	var_4_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 60, _1080p * 400, _1080p * 25, _1080p * 26)
	var_4_0:addElement(var_4_26)

	var_4_0.Line = var_4_26

	local var_4_27
	local var_4_28 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_4_1
	})

	var_4_28.id = "CountdownTimer"

	var_4_28:SetRGBFromTable(SWATCHES.genericMenu.notificationBackground, 0)
	var_4_28:SetAlpha(0, 0)
	var_4_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_28:SetAlignment(LUI.Alignment.Left)
	var_4_28:setEndTime(0)
	var_4_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 180, _1080p * 29, _1080p * 53)
	var_4_0:addElement(var_4_28)

	var_4_0.CountdownTimer = var_4_28

	local var_4_29
	local var_4_30 = LUI.UIStyledText.new()

	var_4_30.id = "ButtonPromptLeft"

	var_4_30:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_4_30:setText("", 0)
	var_4_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_30:SetAlignment(LUI.Alignment.Left)
	var_4_30:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_30:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_30:SetStartupDelay(1000)
	var_4_30:SetLineHoldTime(400)
	var_4_30:SetAnimMoveTime(2000)
	var_4_30:SetAnimMoveSpeed(50)
	var_4_30:SetEndDelay(1000)
	var_4_30:SetCrossfadeTime(400)
	var_4_30:SetFadeInTime(300)
	var_4_30:SetFadeOutTime(300)
	var_4_30:SetMaxVisibleLines(3)
	var_4_30:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 98, _1080p * -175, _1080p * 19, _1080p * 41)
	var_4_0:addElement(var_4_30)

	var_4_0.ButtonPromptLeft = var_4_30

	local var_4_31
	local var_4_32 = LUI.UIStyledText.new()

	var_4_32.id = "ButtonPromptRight"

	var_4_32:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_4_32:setText(Engine.CBBHFCGDIC("LUA_MENU/DISMISS_NOTIFICATION"), 0)
	var_4_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_32:SetAlignment(LUI.Alignment.Left)
	var_4_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_32:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_32:SetStartupDelay(1000)
	var_4_32:SetLineHoldTime(400)
	var_4_32:SetAnimMoveTime(150)
	var_4_32:SetAnimMoveSpeed(50)
	var_4_32:SetEndDelay(1000)
	var_4_32:SetCrossfadeTime(400)
	var_4_32:SetFadeInTime(300)
	var_4_32:SetFadeOutTime(300)
	var_4_32:SetMaxVisibleLines(3)
	var_4_32:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 278, 0, _1080p * 19, _1080p * 41)
	var_4_0:addElement(var_4_32)

	var_4_0.ButtonPromptRight = var_4_32

	local var_4_33
	local var_4_34 = LUI.UIImage.new()

	var_4_34.id = "HoldButtonIcon"

	var_4_34:SetAlpha(0, 0)
	var_4_34:setImage(RegisterMaterial("button_alt1"), 0)
	var_4_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 60, _1080p * 82, _1080p * 79, _1080p * 101)
	var_4_0:addElement(var_4_34)

	var_4_0.HoldButtonIcon = var_4_34

	local var_4_35
	local var_4_36 = {
		iconString = "LUA_MENU/PAD_L3_BUTTON",
		controllerIndex = var_4_1
	}
	local var_4_37 = MenuBuilder.BuildRegisteredType("IconImage", var_4_36)

	var_4_37.id = "FontIconRight"

	var_4_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 246, _1080p * 268, _1080p * 79, _1080p * 101)
	var_4_0:addElement(var_4_37)

	var_4_0.FontIconRight = var_4_37

	local var_4_38
	local var_4_39 = {
		iconString = "LUA_MENU/PAD_ALT1_BUTTON",
		controllerIndex = var_4_1
	}
	local var_4_40 = MenuBuilder.BuildRegisteredType("IconImage", var_4_39)

	var_4_40.id = "FontIconLeft"

	var_4_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 90, _1080p * 79, _1080p * 101)
	var_4_0:addElement(var_4_40)

	var_4_0.FontIconLeft = var_4_40

	local var_4_41
	local var_4_42 = LUI.UIStyledText.new()

	var_4_42.id = "PauseMenuLabelGamepad"

	var_4_42:setText(Engine.CBBHFCGDIC("LUA_MENU/OPEN_MENU_TO_ACCEPT"), 0)
	var_4_42:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_42:SetAlignment(LUI.Alignment.Left)
	var_4_42:SetShadowMinDistance(-0.2, 0)
	var_4_42:SetShadowMaxDistance(0.2, 0)
	var_4_42:SetShadowUOffset(-0.002, 0)
	var_4_42:SetShadowVOffset(-0.002, 0)
	var_4_42:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_4_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 60, _1080p * 560, _1080p * 72, _1080p * 96)
	var_4_0:addElement(var_4_42)

	var_4_0.PauseMenuLabelGamepad = var_4_42

	local function var_4_43()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_43

	local var_4_44
	local var_4_45 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WithHeaderGamepad", var_4_45)

	local var_4_46 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WithHeaderGamepad", var_4_46)

	local var_4_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WithHeaderGamepad", var_4_47)

	local var_4_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WithHeaderGamepad", var_4_48)

	local var_4_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WithHeaderGamepad", var_4_49)

	local var_4_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WithHeaderGamepad", var_4_50)

	local var_4_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WithHeaderGamepad", var_4_51)

	local var_4_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("WithHeaderGamepad", var_4_52)

	local var_4_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("WithHeaderGamepad", var_4_53)

	local var_4_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("WithHeaderGamepad", var_4_54)

	local var_4_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("WithHeaderGamepad", var_4_55)

	local var_4_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -149
		}
	}

	var_4_30:RegisterAnimationSequence("WithHeaderGamepad", var_4_56)

	local var_4_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 278
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		}
	}

	var_4_32:RegisterAnimationSequence("WithHeaderGamepad", var_4_57)

	local var_4_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("WithHeaderGamepad", var_4_58)

	local var_4_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("WithHeaderGamepad", var_4_59)

	local var_4_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithHeaderGamepad", var_4_60)

	local var_4_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("WithHeaderGamepad", var_4_61)

	local function var_4_62()
		var_4_4:AnimateSequence("WithHeaderGamepad")
		var_4_6:AnimateSequence("WithHeaderGamepad")
		var_4_8:AnimateSequence("WithHeaderGamepad")
		var_4_10:AnimateSequence("WithHeaderGamepad")
		var_4_12:AnimateSequence("WithHeaderGamepad")
		var_4_14:AnimateSequence("WithHeaderGamepad")
		var_4_16:AnimateSequence("WithHeaderGamepad")
		var_4_18:AnimateSequence("WithHeaderGamepad")
		var_4_20:AnimateSequence("WithHeaderGamepad")
		var_4_22:AnimateSequence("WithHeaderGamepad")
		var_4_24:AnimateSequence("WithHeaderGamepad")
		var_4_30:AnimateSequence("WithHeaderGamepad")
		var_4_32:AnimateSequence("WithHeaderGamepad")
		var_4_34:AnimateSequence("WithHeaderGamepad")
		var_4_37:AnimateSequence("WithHeaderGamepad")
		var_4_40:AnimateSequence("WithHeaderGamepad")
		var_4_42:AnimateSequence("WithHeaderGamepad")
	end

	var_4_0._sequences.WithHeaderGamepad = var_4_62

	local var_4_63
	local var_4_64 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_64)

	local var_4_65 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_65)

	local var_4_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_66)

	local var_4_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_67)

	local var_4_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_68)

	local var_4_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_4_14:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_69)

	local var_4_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_70)

	local var_4_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_71)

	local var_4_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_72)

	local var_4_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_73)

	local var_4_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_74)

	local var_4_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_75)

	local var_4_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_76)

	local var_4_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_77)

	local var_4_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_78)

	local var_4_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("WithoutHeaderGamepad", var_4_79)

	local function var_4_80()
		var_4_4:AnimateSequence("WithoutHeaderGamepad")
		var_4_6:AnimateSequence("WithoutHeaderGamepad")
		var_4_8:AnimateSequence("WithoutHeaderGamepad")
		var_4_10:AnimateSequence("WithoutHeaderGamepad")
		var_4_12:AnimateSequence("WithoutHeaderGamepad")
		var_4_14:AnimateSequence("WithoutHeaderGamepad")
		var_4_18:AnimateSequence("WithoutHeaderGamepad")
		var_4_20:AnimateSequence("WithoutHeaderGamepad")
		var_4_24:AnimateSequence("WithoutHeaderGamepad")
		var_4_26:AnimateSequence("WithoutHeaderGamepad")
		var_4_30:AnimateSequence("WithoutHeaderGamepad")
		var_4_32:AnimateSequence("WithoutHeaderGamepad")
		var_4_34:AnimateSequence("WithoutHeaderGamepad")
		var_4_37:AnimateSequence("WithoutHeaderGamepad")
		var_4_40:AnimateSequence("WithoutHeaderGamepad")
		var_4_42:AnimateSequence("WithoutHeaderGamepad")
	end

	var_4_0._sequences.WithoutHeaderGamepad = var_4_80

	local var_4_81
	local var_4_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WithHeader", var_4_82)

	local var_4_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_6:RegisterAnimationSequence("WithHeader", var_4_83)

	local var_4_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WithHeader", var_4_84)

	local var_4_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			child = var_4_0.MenuButtonRight.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		}
	}

	var_4_10:RegisterAnimationSequence("WithHeader", var_4_85)

	local var_4_86 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WithHeader", var_4_86)

	local var_4_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WithHeader", var_4_87)

	local var_4_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WithHeader", var_4_88)

	local var_4_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			child = var_4_0.MenuButtonLeft.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		}
	}

	var_4_20:RegisterAnimationSequence("WithHeader", var_4_89)

	local var_4_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("WithHeader", var_4_90)

	local var_4_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("WithHeader", var_4_91)

	local var_4_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("WithHeader", var_4_92)

	local var_4_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("WithHeader", var_4_93)

	local var_4_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("WithHeader", var_4_94)

	local var_4_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithHeader", var_4_95)

	local var_4_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("WithHeader", var_4_96)

	local function var_4_97()
		var_4_4:AnimateSequence("WithHeader")
		var_4_6:AnimateSequence("WithHeader")
		var_4_8:AnimateSequence("WithHeader")
		var_4_10:AnimateSequence("WithHeader")
		var_4_12:AnimateSequence("WithHeader")
		var_4_14:AnimateSequence("WithHeader")
		var_4_16:AnimateSequence("WithHeader")
		var_4_20:AnimateSequence("WithHeader")
		var_4_22:AnimateSequence("WithHeader")
		var_4_24:AnimateSequence("WithHeader")
		var_4_30:AnimateSequence("WithHeader")
		var_4_32:AnimateSequence("WithHeader")
		var_4_37:AnimateSequence("WithHeader")
		var_4_40:AnimateSequence("WithHeader")
		var_4_42:AnimateSequence("WithHeader")
	end

	var_4_0._sequences.WithHeader = var_4_97

	local var_4_98
	local var_4_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WithoutHeader", var_4_99)

	local var_4_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WithoutHeader", var_4_100)

	local var_4_101 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WithoutHeader", var_4_101)

	local var_4_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			child = var_4_0.MenuButtonRight.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		}
	}

	var_4_10:RegisterAnimationSequence("WithoutHeader", var_4_102)

	local var_4_103 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WithoutHeader", var_4_103)

	local var_4_104 = {
		{
			value = 1,
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
			value = _1080p * 10
		}
	}

	var_4_14:RegisterAnimationSequence("WithoutHeader", var_4_104)

	local var_4_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		}
	}

	var_4_20:RegisterAnimationSequence("WithoutHeader", var_4_105)

	local var_4_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("WithoutHeader", var_4_106)

	local var_4_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("WithoutHeader", var_4_107)

	local var_4_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("WithoutHeader", var_4_108)

	local var_4_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("WithoutHeader", var_4_109)

	local var_4_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("WithoutHeader", var_4_110)

	local var_4_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithoutHeader", var_4_111)

	local var_4_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("WithoutHeader", var_4_112)

	local function var_4_113()
		var_4_4:AnimateSequence("WithoutHeader")
		var_4_6:AnimateSequence("WithoutHeader")
		var_4_8:AnimateSequence("WithoutHeader")
		var_4_10:AnimateSequence("WithoutHeader")
		var_4_12:AnimateSequence("WithoutHeader")
		var_4_14:AnimateSequence("WithoutHeader")
		var_4_20:AnimateSequence("WithoutHeader")
		var_4_24:AnimateSequence("WithoutHeader")
		var_4_26:AnimateSequence("WithoutHeader")
		var_4_30:AnimateSequence("WithoutHeader")
		var_4_32:AnimateSequence("WithoutHeader")
		var_4_37:AnimateSequence("WithoutHeader")
		var_4_40:AnimateSequence("WithoutHeader")
		var_4_42:AnimateSequence("WithoutHeader")
	end

	var_4_0._sequences.WithoutHeader = var_4_113

	local var_4_114
	local var_4_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WithHeaderToMenu", var_4_115)

	local var_4_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WithHeaderToMenu", var_4_116)

	local var_4_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WithHeaderToMenu", var_4_117)

	local var_4_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		}
	}

	var_4_10:RegisterAnimationSequence("WithHeaderToMenu", var_4_118)

	local var_4_119 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WithHeaderToMenu", var_4_119)

	local var_4_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WithHeaderToMenu", var_4_120)

	local var_4_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WithHeaderToMenu", var_4_121)

	local var_4_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			child = var_4_0.MenuButtonLeft.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		}
	}

	var_4_20:RegisterAnimationSequence("WithHeaderToMenu", var_4_122)

	local var_4_123 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("WithHeaderToMenu", var_4_123)

	local var_4_124 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("WithHeaderToMenu", var_4_124)

	local var_4_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("WithHeaderToMenu", var_4_125)

	local var_4_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("WithHeaderToMenu", var_4_126)

	local var_4_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("WithHeaderToMenu", var_4_127)

	local var_4_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithHeaderToMenu", var_4_128)

	local var_4_129 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("WithHeaderToMenu", var_4_129)

	local function var_4_130()
		var_4_4:AnimateSequence("WithHeaderToMenu")
		var_4_6:AnimateSequence("WithHeaderToMenu")
		var_4_8:AnimateSequence("WithHeaderToMenu")
		var_4_10:AnimateSequence("WithHeaderToMenu")
		var_4_12:AnimateSequence("WithHeaderToMenu")
		var_4_14:AnimateSequence("WithHeaderToMenu")
		var_4_16:AnimateSequence("WithHeaderToMenu")
		var_4_20:AnimateSequence("WithHeaderToMenu")
		var_4_22:AnimateSequence("WithHeaderToMenu")
		var_4_24:AnimateSequence("WithHeaderToMenu")
		var_4_30:AnimateSequence("WithHeaderToMenu")
		var_4_32:AnimateSequence("WithHeaderToMenu")
		var_4_37:AnimateSequence("WithHeaderToMenu")
		var_4_40:AnimateSequence("WithHeaderToMenu")
		var_4_42:AnimateSequence("WithHeaderToMenu")
	end

	var_4_0._sequences.WithHeaderToMenu = var_4_130

	local var_4_131
	local var_4_132 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Hide", var_4_132)

	local var_4_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Hide", var_4_133)

	local var_4_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Hide", var_4_134)

	local var_4_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Hide", var_4_135)

	local var_4_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Hide", var_4_136)

	local var_4_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Hide", var_4_137)

	local var_4_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Hide", var_4_138)

	local var_4_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("Hide", var_4_139)

	local var_4_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("Hide", var_4_140)

	local var_4_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("Hide", var_4_141)

	local var_4_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("Hide", var_4_142)

	local var_4_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("Hide", var_4_143)

	local var_4_144 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_28:RegisterAnimationSequence("Hide", var_4_144)

	local var_4_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("Hide", var_4_145)

	local var_4_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("Hide", var_4_146)

	local var_4_147 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("Hide", var_4_147)

	local var_4_148 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("Hide", var_4_148)

	local var_4_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("Hide", var_4_149)

	local var_4_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("Hide", var_4_150)

	local function var_4_151()
		var_4_4:AnimateSequence("Hide")
		var_4_6:AnimateSequence("Hide")
		var_4_8:AnimateSequence("Hide")
		var_4_10:AnimateSequence("Hide")
		var_4_12:AnimateSequence("Hide")
		var_4_14:AnimateSequence("Hide")
		var_4_16:AnimateSequence("Hide")
		var_4_18:AnimateSequence("Hide")
		var_4_20:AnimateSequence("Hide")
		var_4_22:AnimateSequence("Hide")
		var_4_24:AnimateSequence("Hide")
		var_4_26:AnimateSequence("Hide")
		var_4_28:AnimateSequence("Hide")
		var_4_30:AnimateSequence("Hide")
		var_4_32:AnimateSequence("Hide")
		var_4_34:AnimateSequence("Hide")
		var_4_37:AnimateSequence("Hide")
		var_4_40:AnimateSequence("Hide")
		var_4_42:AnimateSequence("Hide")
	end

	var_4_0._sequences.Hide = var_4_151

	local var_4_152
	local var_4_153 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_153)

	local var_4_154 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_154)

	local var_4_155 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationHighlight,
			child = var_4_0.Background.Background
		}
	}

	var_4_8:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_155)

	local var_4_156 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_156)

	local var_4_157 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_157)

	local var_4_158 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_158)

	local var_4_159 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_159)

	local var_4_160 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_160)

	local var_4_161 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_161)

	local var_4_162 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_162)

	local var_4_163 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_163)

	local var_4_164 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -175
		}
	}

	var_4_30:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_164)

	local var_4_165 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 246
		}
	}

	var_4_32:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_165)

	local var_4_166 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_166)

	local var_4_167 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_167)

	local var_4_168 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_168)

	local var_4_169 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("WithHeaderKBMInGame", var_4_169)

	local function var_4_170()
		var_4_4:AnimateSequence("WithHeaderKBMInGame")
		var_4_6:AnimateSequence("WithHeaderKBMInGame")
		var_4_8:AnimateSequence("WithHeaderKBMInGame")
		var_4_10:AnimateSequence("WithHeaderKBMInGame")
		var_4_12:AnimateSequence("WithHeaderKBMInGame")
		var_4_14:AnimateSequence("WithHeaderKBMInGame")
		var_4_16:AnimateSequence("WithHeaderKBMInGame")
		var_4_18:AnimateSequence("WithHeaderKBMInGame")
		var_4_20:AnimateSequence("WithHeaderKBMInGame")
		var_4_22:AnimateSequence("WithHeaderKBMInGame")
		var_4_24:AnimateSequence("WithHeaderKBMInGame")
		var_4_30:AnimateSequence("WithHeaderKBMInGame")
		var_4_32:AnimateSequence("WithHeaderKBMInGame")
		var_4_34:AnimateSequence("WithHeaderKBMInGame")
		var_4_37:AnimateSequence("WithHeaderKBMInGame")
		var_4_40:AnimateSequence("WithHeaderKBMInGame")
		var_4_42:AnimateSequence("WithHeaderKBMInGame")
	end

	var_4_0._sequences.WithHeaderKBMInGame = var_4_170

	local var_4_171
	local var_4_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Icon1x1", var_4_172)

	local var_4_173 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_4_12:RegisterAnimationSequence("Icon1x1", var_4_173)

	local var_4_174 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("Icon1x1", var_4_174)

	local var_4_175 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		}
	}

	var_4_22:RegisterAnimationSequence("Icon1x1", var_4_175)

	local function var_4_176()
		var_4_10:AnimateSequence("Icon1x1")
		var_4_12:AnimateSequence("Icon1x1")
		var_4_20:AnimateSequence("Icon1x1")
		var_4_22:AnimateSequence("Icon1x1")
	end

	var_4_0._sequences.Icon1x1 = var_4_176

	local var_4_177
	local var_4_178 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -125
		}
	}

	var_4_12:RegisterAnimationSequence("Icon2x1", var_4_178)

	local var_4_179 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 54
		}
	}

	var_4_22:RegisterAnimationSequence("Icon2x1", var_4_179)

	local function var_4_180()
		var_4_12:AnimateSequence("Icon2x1")
		var_4_22:AnimateSequence("Icon2x1")
	end

	var_4_0._sequences.Icon2x1 = var_4_180

	local var_4_181
	local var_4_182 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WithoutHeaderKBM", var_4_182)

	local var_4_183 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WithoutHeaderKBM", var_4_183)

	local var_4_184 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WithoutHeaderKBM", var_4_184)

	local var_4_185 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			child = var_4_0.MenuButtonRight.Text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		}
	}

	var_4_10:RegisterAnimationSequence("WithoutHeaderKBM", var_4_185)

	local var_4_186 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WithoutHeaderKBM", var_4_186)

	local var_4_187 = {
		{
			value = 1,
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
			value = _1080p * 10
		}
	}

	var_4_14:RegisterAnimationSequence("WithoutHeaderKBM", var_4_187)

	local var_4_188 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("WithoutHeaderKBM", var_4_188)

	local var_4_189 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		}
	}

	var_4_20:RegisterAnimationSequence("WithoutHeaderKBM", var_4_189)

	local var_4_190 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("WithoutHeaderKBM", var_4_190)

	local var_4_191 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("WithoutHeaderKBM", var_4_191)

	local var_4_192 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("WithoutHeaderKBM", var_4_192)

	local var_4_193 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("WithoutHeaderKBM", var_4_193)

	local var_4_194 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("WithoutHeaderKBM", var_4_194)

	local var_4_195 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("WithoutHeaderKBM", var_4_195)

	local var_4_196 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithoutHeaderKBM", var_4_196)

	local var_4_197 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("WithoutHeaderKBM", var_4_197)

	local function var_4_198()
		var_4_4:AnimateSequence("WithoutHeaderKBM")
		var_4_6:AnimateSequence("WithoutHeaderKBM")
		var_4_8:AnimateSequence("WithoutHeaderKBM")
		var_4_10:AnimateSequence("WithoutHeaderKBM")
		var_4_12:AnimateSequence("WithoutHeaderKBM")
		var_4_14:AnimateSequence("WithoutHeaderKBM")
		var_4_18:AnimateSequence("WithoutHeaderKBM")
		var_4_20:AnimateSequence("WithoutHeaderKBM")
		var_4_24:AnimateSequence("WithoutHeaderKBM")
		var_4_26:AnimateSequence("WithoutHeaderKBM")
		var_4_30:AnimateSequence("WithoutHeaderKBM")
		var_4_32:AnimateSequence("WithoutHeaderKBM")
		var_4_34:AnimateSequence("WithoutHeaderKBM")
		var_4_37:AnimateSequence("WithoutHeaderKBM")
		var_4_40:AnimateSequence("WithoutHeaderKBM")
		var_4_42:AnimateSequence("WithoutHeaderKBM")
	end

	var_4_0._sequences.WithoutHeaderKBM = var_4_198

	local var_4_199
	local var_4_200 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_200)

	local var_4_201 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_201)

	local var_4_202 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_202)

	local var_4_203 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonRight.Text
		}
	}

	var_4_10:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_203)

	local var_4_204 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_204)

	local var_4_205 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_205)

	local var_4_206 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_206)

	local var_4_207 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			child = var_4_0.MenuButtonLeft.Text
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_4_0.MenuButtonLeft.Text
		}
	}

	var_4_20:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_207)

	local var_4_208 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_208)

	local var_4_209 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_209)

	local var_4_210 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_210)

	local var_4_211 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_211)

	local var_4_212 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_212)

	local var_4_213 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_213)

	local var_4_214 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("WithoutHeaderToMenu", var_4_214)

	local function var_4_215()
		var_4_4:AnimateSequence("WithoutHeaderToMenu")
		var_4_6:AnimateSequence("WithoutHeaderToMenu")
		var_4_8:AnimateSequence("WithoutHeaderToMenu")
		var_4_10:AnimateSequence("WithoutHeaderToMenu")
		var_4_12:AnimateSequence("WithoutHeaderToMenu")
		var_4_14:AnimateSequence("WithoutHeaderToMenu")
		var_4_16:AnimateSequence("WithoutHeaderToMenu")
		var_4_20:AnimateSequence("WithoutHeaderToMenu")
		var_4_22:AnimateSequence("WithoutHeaderToMenu")
		var_4_24:AnimateSequence("WithoutHeaderToMenu")
		var_4_30:AnimateSequence("WithoutHeaderToMenu")
		var_4_32:AnimateSequence("WithoutHeaderToMenu")
		var_4_37:AnimateSequence("WithoutHeaderToMenu")
		var_4_40:AnimateSequence("WithoutHeaderToMenu")
		var_4_42:AnimateSequence("WithoutHeaderToMenu")
	end

	var_4_0._sequences.WithoutHeaderToMenu = var_4_215

	local var_4_216
	local var_4_217 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		}
	}

	var_4_14:RegisterAnimationSequence("JA", var_4_217)

	local var_4_218 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		}
	}

	var_4_16:RegisterAnimationSequence("JA", var_4_218)

	local var_4_219 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		}
	}

	var_4_24:RegisterAnimationSequence("JA", var_4_219)

	local function var_4_220()
		var_4_14:AnimateSequence("JA")
		var_4_16:AnimateSequence("JA")
		var_4_24:AnimateSequence("JA")
	end

	var_4_0._sequences.JA = var_4_220

	local var_4_221
	local var_4_222 = {
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
			value = _1080p * -510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_4_42:RegisterAnimationSequence("AR", var_4_222)

	local function var_4_223()
		var_4_42:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_223

	local var_4_224
	local var_4_225 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("WithHoldButton", var_4_225)

	local var_4_226 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("WithHoldButton", var_4_226)

	local var_4_227 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("WithHoldButton", var_4_227)

	local var_4_228 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("WithHoldButton", var_4_228)

	local function var_4_229()
		var_4_18:AnimateSequence("WithHoldButton")
		var_4_30:AnimateSequence("WithHoldButton")
		var_4_34:AnimateSequence("WithHoldButton")
		var_4_40:AnimateSequence("WithHoldButton")
	end

	var_4_0._sequences.WithHoldButton = var_4_229

	local var_4_230
	local var_4_231 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_4_0.Background.Background
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_231)

	local var_4_232 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipSetup", var_4_232)

	local var_4_233 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22.5
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipSetup", var_4_233)

	local var_4_234 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_4_16:RegisterAnimationSequence("WZWipSetup", var_4_234)

	local var_4_235 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_4_24:RegisterAnimationSequence("WZWipSetup", var_4_235)

	local var_4_236 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_sep_menu_title")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 390
		}
	}

	var_4_26:RegisterAnimationSequence("WZWipSetup", var_4_236)

	local function var_4_237()
		var_4_8:AnimateSequence("WZWipSetup")
		var_4_12:AnimateSequence("WZWipSetup")
		var_4_14:AnimateSequence("WZWipSetup")
		var_4_16:AnimateSequence("WZWipSetup")
		var_4_24:AnimateSequence("WZWipSetup")
		var_4_26:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_237

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ToastNotification", ToastNotification)
LockTable(_M)
