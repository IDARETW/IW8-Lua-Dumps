module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LUI.Alignment.Left

	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		arg_2_0.Background:SetupButton(arg_2_0.Text, arg_2_0.Text:getText(), var_1_0)
		ACTIONS.AnimateSequence(arg_2_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled"))
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		arg_5_0.Background:SetupButton(arg_5_0.Text, arg_5_0.Text:getText(), var_1_0)
		ACTIONS.AnimateSequence(arg_5_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled"))
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function ClanTagSuggestButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 40 * _1080p)

	var_6_0.id = "ClanTagSuggestButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "Background"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "Text"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_6_6:SetShadowRGBFromInt(0, 0)
	var_6_6:SetOutlineRGBFromInt(0, 0)
	var_6_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_6)

	var_6_0.Text = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Lock"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_8:SetAlpha(0, 0)
	var_6_8:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -45, _1080p * 11, _1080p * -24, _1080p * 32)
	var_6_0:addElement(var_6_8)

	var_6_0.Lock = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "Description"

	var_6_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_6_10:SetAlpha(0, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetShadowRGBFromInt(0, 0)
	var_6_10:SetOutlineRGBFromInt(0, 0)
	var_6_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 11, _1080p * 411, _1080p * -10, _1080p * 10)
	var_6_0:addElement(var_6_10)

	var_6_0.Description = var_6_10

	local function var_6_11()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_11

	local var_6_12
	local var_6_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_13)

	local var_6_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_14)

	local var_6_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 3000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOver", var_6_15)

	local function var_6_16()
		var_6_6:AnimateSequence("ButtonOver")
		var_6_8:AnimateSequence("ButtonOver")
		var_6_10:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_18)

	local var_6_19 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_19)

	local var_6_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUp", var_6_20)

	local function var_6_21()
		var_6_6:AnimateSequence("ButtonUp")
		var_6_8:AnimateSequence("ButtonUp")
		var_6_10:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_21

	local var_6_22
	local var_6_23 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_6:RegisterAnimationSequence("Locked", var_6_23)

	local var_6_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Locked", var_6_24)

	local function var_6_25()
		var_6_6:AnimateSequence("Locked")
		var_6_8:AnimateSequence("Locked")
	end

	var_6_0._sequences.Locked = var_6_25

	local var_6_26
	local var_6_27 = {
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

	var_6_6:RegisterAnimationSequence("ButtonOverDisabled", var_6_27)

	local var_6_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 5000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOverDisabled", var_6_28)

	local function var_6_29()
		var_6_6:AnimateSequence("ButtonOverDisabled")
		var_6_10:AnimateSequence("ButtonOverDisabled")
	end

	var_6_0._sequences.ButtonOverDisabled = var_6_29

	local var_6_30
	local var_6_31 = {
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

	var_6_6:RegisterAnimationSequence("ButtonUpDisabled", var_6_31)

	local var_6_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUpDisabled", var_6_32)

	local function var_6_33()
		var_6_6:AnimateSequence("ButtonUpDisabled")
		var_6_10:AnimateSequence("ButtonUpDisabled")
	end

	var_6_0._sequences.ButtonUpDisabled = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_35)

	local var_6_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		}
	}

	var_6_10:RegisterAnimationSequence("AR", var_6_36)

	local function var_6_37()
		var_6_6:AnimateSequence("AR")
		var_6_10:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_37

	local var_6_38
	local var_6_39 = {
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

	var_6_6:RegisterAnimationSequence("WZWipSetup", var_6_39)

	local var_6_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipSetup", var_6_40)

	local function var_6_41()
		var_6_6:AnimateSequence("WZWipSetup")
		var_6_8:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOver", var_6_43)

	local var_6_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonOver", var_6_44)

	local var_6_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 3000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonOver", var_6_45)

	local function var_6_46()
		var_6_6:AnimateSequence("WZWipButtonOver")
		var_6_8:AnimateSequence("WZWipButtonOver")
		var_6_10:AnimateSequence("WZWipButtonOver")
	end

	var_6_0._sequences.WZWipButtonOver = var_6_46

	local var_6_47
	local var_6_48 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_6_48)

	local var_6_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 5000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_6_49)

	local function var_6_50()
		var_6_6:AnimateSequence("WZWipButtonOverDisabled")
		var_6_10:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_6_0._sequences.WZWipButtonOverDisabled = var_6_50

	local var_6_51
	local var_6_52 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUp", var_6_52)

	local var_6_53 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonUp", var_6_53)

	local var_6_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonUp", var_6_54)

	local function var_6_55()
		var_6_6:AnimateSequence("WZWipButtonUp")
		var_6_8:AnimateSequence("WZWipButtonUp")
		var_6_10:AnimateSequence("WZWipButtonUp")
	end

	var_6_0._sequences.WZWipButtonUp = var_6_55

	local var_6_56
	local var_6_57 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_6_57)

	local var_6_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_6_58)

	local function var_6_59()
		var_6_6:AnimateSequence("WZWipButtonUpDisabled")
		var_6_10:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_6_0._sequences.WZWipButtonUpDisabled = var_6_59

	local var_6_60
	local var_6_61 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipLocked", var_6_61)

	local var_6_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipLocked", var_6_62)

	local function var_6_63()
		var_6_6:AnimateSequence("WZWipLocked")
		var_6_8:AnimateSequence("WZWipLocked")
	end

	var_6_0._sequences.WZWipLocked = var_6_63

	local var_6_64
	local var_6_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_6_6:RegisterAnimationSequence("CenterText", var_6_65)

	local function var_6_66()
		var_6_6:AnimateSequence("CenterText")
	end

	var_6_0._sequences.CenterText = var_6_66

	local var_6_67
	local var_6_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_6_6:RegisterAnimationSequence("DefaultText", var_6_68)

	local function var_6_69()
		var_6_6:AnimateSequence("DefaultText")
	end

	var_6_0._sequences.DefaultText = var_6_69

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ClanTagSuggestButton", ClanTagSuggestButton)
LockTable(_M)
