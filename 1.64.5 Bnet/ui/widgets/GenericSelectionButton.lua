module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUp")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "Disabled")
	end)
	arg_1_0:addEventHandler("button_enable", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "Enabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericSelectionButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 546 * _1080p, 0, 62 * _1080p)

	var_6_0.id = "GenericSelectionButton"
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
	local var_6_6 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Selected"

	var_6_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -55, _1080p * -27, _1080p * -14, _1080p * 14)
	var_6_0:addElement(var_6_6)

	var_6_0.Selected = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "Text"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_8:setText(ToUpperCase(""), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_8:SetStartupDelay(2000)
	var_6_8:SetLineHoldTime(400)
	var_6_8:SetAnimMoveTime(300)
	var_6_8:SetAnimMoveSpeed(50)
	var_6_8:SetEndDelay(1500)
	var_6_8:SetCrossfadeTime(750)
	var_6_8:SetFadeInTime(300)
	var_6_8:SetFadeOutTime(300)
	var_6_8:SetMaxVisibleLines(1)
	var_6_8:SetOutlineRGBFromInt(0, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 20, _1080p * 332, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_8)

	var_6_0.Text = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "Lock"

	var_6_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_6_10:SetAlpha(0, 0)
	var_6_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 216, _1080p * 259, _1080p * -21, _1080p * 21)
	var_6_0:addElement(var_6_10)

	var_6_0.Lock = var_6_10

	local function var_6_11()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_11

	local var_6_12
	local var_6_13 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_13)

	local function var_6_14()
		var_6_8:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_14

	local var_6_15
	local var_6_16 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_16)

	local function var_6_17()
		var_6_8:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_17

	local var_6_18
	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_8:RegisterAnimationSequence("Disabled", var_6_19)

	local var_6_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Disabled", var_6_20)

	local function var_6_21()
		var_6_8:AnimateSequence("Disabled")
		var_6_10:AnimateSequence("Disabled")
	end

	var_6_0._sequences.Disabled = var_6_21

	local var_6_22
	local var_6_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_8:RegisterAnimationSequence("Enabled", var_6_23)

	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Enabled", var_6_24)

	local function var_6_25()
		var_6_8:AnimateSequence("Enabled")
		var_6_10:AnimateSequence("Enabled")
	end

	var_6_0._sequences.Enabled = var_6_25

	local var_6_26
	local var_6_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_27)

	local var_6_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -333
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -75
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_6_8:RegisterAnimationSequence("AR", var_6_28)

	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_6_10:RegisterAnimationSequence("AR", var_6_29)

	local function var_6_30()
		var_6_6:AnimateSequence("AR")
		var_6_8:AnimateSequence("AR")
		var_6_10:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_30

	local var_6_31
	local var_6_32 = {
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

	var_6_8:RegisterAnimationSequence("WZWipSetup", var_6_32)

	local function var_6_33()
		var_6_8:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonOver", var_6_35)

	local function var_6_36()
		var_6_8:AnimateSequence("WZWipButtonOver")
	end

	var_6_0._sequences.WZWipButtonOver = var_6_36

	local var_6_37
	local var_6_38 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonUp", var_6_38)

	local function var_6_39()
		var_6_8:AnimateSequence("WZWipButtonUp")
	end

	var_6_0._sequences.WZWipButtonUp = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipEnabled", var_6_41)

	local function var_6_42()
		var_6_10:AnimateSequence("WZWipEnabled")
	end

	var_6_0._sequences.WZWipEnabled = var_6_42

	local var_6_43
	local var_6_44 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipDisabled", var_6_44)

	local var_6_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipDisabled", var_6_45)

	local function var_6_46()
		var_6_8:AnimateSequence("WZWipDisabled")
		var_6_10:AnimateSequence("WZWipDisabled")
	end

	var_6_0._sequences.WZWipDisabled = var_6_46

	local var_6_47
	local var_6_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -66
		}
	}

	var_6_6:RegisterAnimationSequence("SelectedOffset", var_6_48)

	local function var_6_49()
		var_6_6:AnimateSequence("SelectedOffset")
	end

	var_6_0._sequences.SelectedOffset = var_6_49

	var_6_0:addEventHandler("button_over", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
	end)
	var_6_0:addEventHandler("button_up", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUp")
	end)
	var_6_0:addEventHandler("disable", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Disabled")
	end)
	var_6_0:addEventHandler("enable", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Enabled")
	end)
	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GenericSelectionButton", GenericSelectionButton)
LockTable(_M)
