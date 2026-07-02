module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._isEquipped = arg_1_1

	if arg_1_1 then
		arg_1_0.Title:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -45, _1080p * -11, _1080p * 11)
	else
		arg_1_0.Title:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 11)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1)
	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_active", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "ButtonUpActive")
	end)
	arg_2_0:addEventHandler("button_over_active", function(arg_6_0, arg_6_1)
		WZWIP.AnimateThemeElement(arg_6_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("disable", function(arg_7_0, arg_7_1)
		WZWIP.AnimateThemeElement(arg_7_0, "Disabled")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		WZWIP.AnimateThemeElement(arg_8_0, "ButtonOverDisabled")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_9_0, arg_9_1)
		WZWIP.AnimateThemeElement(arg_9_0, "ButtonUpDisabled")
	end)
	arg_2_0:addEventHandler("disable_active", function(arg_10_0, arg_10_1)
		WZWIP.AnimateThemeElement(arg_10_0, "DisabledActive")
	end)
	arg_2_0:addEventHandler("button_disable_active", function(arg_11_0, arg_11_1)
		WZWIP.AnimateThemeElement(arg_11_0, "ButtonUpDisabledActive")
	end)
	arg_2_0:addEventHandler("button_over_disable_active", function(arg_12_0, arg_12_1)
		WZWIP.AnimateThemeElement(arg_12_0, "ButtonOverDisabledActive")
	end)
	arg_2_0:addEventHandler("active", function(arg_13_0, arg_13_1)
		WZWIP.AnimateThemeElement(arg_13_0, "Active")
	end)
	arg_2_0:addEventHandler("binding", function(arg_14_0, arg_14_1)
		if arg_14_0.GenericButtonBackground then
			arg_14_0.GenericButtonBackground:processEvent({
				name = "binding"
			})
			arg_14_0.GenericButtonBackground:AnimateSequence("Binding")
		end
	end)

	arg_2_0.SetEquipped = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function GenericOptionButtonBase(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_15_0.id = "GenericOptionButtonBase"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "GenericButtonBackground"

	var_15_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.GenericButtonBackground = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIStyledText.new()

	var_15_6.id = "Title"

	var_15_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_15_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_15_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_6:SetWordWrap(false)
	var_15_6:SetAlignment(LUI.Alignment.Left)
	var_15_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_15_6:SetOutlineRGBFromInt(0, 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 11)
	var_15_0:addElement(var_15_6)

	var_15_0.Title = var_15_6

	local function var_15_7()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_7

	local var_15_8
	local var_15_9 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOver", var_15_9)

	local function var_15_10()
		var_15_6:AnimateSequence("ButtonOver")
	end

	var_15_0._sequences.ButtonOver = var_15_10

	local var_15_11
	local var_15_12 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUp", var_15_12)

	local function var_15_13()
		var_15_6:AnimateSequence("ButtonUp")
	end

	var_15_0._sequences.ButtonUp = var_15_13

	local var_15_14
	local var_15_15 = {
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

	var_15_6:RegisterAnimationSequence("Active", var_15_15)

	local function var_15_16()
		var_15_6:AnimateSequence("Active")
	end

	var_15_0._sequences.Active = var_15_16

	local var_15_17
	local var_15_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOverActive", var_15_18)

	local function var_15_19()
		var_15_6:AnimateSequence("ButtonOverActive")
	end

	var_15_0._sequences.ButtonOverActive = var_15_19

	local var_15_20
	local var_15_21 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUpActive", var_15_21)

	local function var_15_22()
		var_15_6:AnimateSequence("ButtonUpActive")
	end

	var_15_0._sequences.ButtonUpActive = var_15_22

	local var_15_23
	local var_15_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("Disabled", var_15_24)

	local function var_15_25()
		var_15_6:AnimateSequence("Disabled")
	end

	var_15_0._sequences.Disabled = var_15_25

	local var_15_26
	local var_15_27 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOverDisabled", var_15_27)

	local function var_15_28()
		var_15_6:AnimateSequence("ButtonOverDisabled")
	end

	var_15_0._sequences.ButtonOverDisabled = var_15_28

	local var_15_29
	local var_15_30 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUpDisabled", var_15_30)

	local function var_15_31()
		var_15_6:AnimateSequence("ButtonUpDisabled")
	end

	var_15_0._sequences.ButtonUpDisabled = var_15_31

	local var_15_32
	local var_15_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_15_6:RegisterAnimationSequence("DisabledActive", var_15_33)

	local function var_15_34()
		var_15_6:AnimateSequence("DisabledActive")
	end

	var_15_0._sequences.DisabledActive = var_15_34

	local var_15_35
	local var_15_36 = {
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOverDisabledActive", var_15_36)

	local function var_15_37()
		var_15_6:AnimateSequence("ButtonOverDisabledActive")
	end

	var_15_0._sequences.ButtonOverDisabledActive = var_15_37

	local var_15_38
	local var_15_39 = {
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUpDisabledActive", var_15_39)

	local function var_15_40()
		var_15_6:AnimateSequence("ButtonUpDisabledActive")
	end

	var_15_0._sequences.ButtonUpDisabledActive = var_15_40

	local var_15_41
	local var_15_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_15_6:RegisterAnimationSequence("AR", var_15_42)

	local function var_15_43()
		var_15_6:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_43

	local var_15_44
	local var_15_45 = {
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

	var_15_6:RegisterAnimationSequence("WZWipSetup", var_15_45)

	local function var_15_46()
		var_15_6:AnimateSequence("WZWipSetup")
	end

	var_15_0._sequences.WZWipSetup = var_15_46

	local var_15_47
	local var_15_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipButtonOver", var_15_48)

	local function var_15_49()
		var_15_6:AnimateSequence("WZWipButtonOver")
	end

	var_15_0._sequences.WZWipButtonOver = var_15_49

	local var_15_50
	local var_15_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipButtonUp", var_15_51)

	local function var_15_52()
		var_15_6:AnimateSequence("WZWipButtonUp")
	end

	var_15_0._sequences.WZWipButtonUp = var_15_52

	local var_15_53
	local var_15_54 = {
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

	var_15_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_15_54)

	local function var_15_55()
		var_15_6:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_15_0._sequences.WZWipButtonOverDisabled = var_15_55

	local var_15_56
	local var_15_57 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_15_57)

	local function var_15_58()
		var_15_6:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_15_0._sequences.WZWipButtonUpDisabled = var_15_58

	local var_15_59
	local var_15_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipButtonOverActive", var_15_60)

	local function var_15_61()
		var_15_6:AnimateSequence("WZWipButtonOverActive")
	end

	var_15_0._sequences.WZWipButtonOverActive = var_15_61

	local var_15_62
	local var_15_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipButtonUpActive", var_15_63)

	local function var_15_64()
		var_15_6:AnimateSequence("WZWipButtonUpActive")
	end

	var_15_0._sequences.WZWipButtonUpActive = var_15_64

	local var_15_65
	local var_15_66 = {
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

	var_15_6:RegisterAnimationSequence("WZWipButtonOverDisabledActive", var_15_66)

	local function var_15_67()
		var_15_6:AnimateSequence("WZWipButtonOverDisabledActive")
	end

	var_15_0._sequences.WZWipButtonOverDisabledActive = var_15_67

	local var_15_68
	local var_15_69 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipDisabled", var_15_69)

	local function var_15_70()
		var_15_6:AnimateSequence("WZWipDisabled")
	end

	var_15_0._sequences.WZWipDisabled = var_15_70

	local var_15_71
	local var_15_72 = {
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

	var_15_6:RegisterAnimationSequence("WZWipDisabledActive", var_15_72)

	local function var_15_73()
		var_15_6:AnimateSequence("WZWipDisabledActive")
	end

	var_15_0._sequences.WZWipDisabledActive = var_15_73

	local var_15_74
	local var_15_75 = {
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

	var_15_6:RegisterAnimationSequence("WZWipActive", var_15_75)

	local function var_15_76()
		var_15_6:AnimateSequence("WZWipActive")
	end

	var_15_0._sequences.WZWipActive = var_15_76

	local var_15_77
	local var_15_78 = {
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

	var_15_6:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_15_78)

	local function var_15_79()
		var_15_6:AnimateSequence("WZWipButtonUpDisabledActive")
	end

	var_15_0._sequences.WZWipButtonUpDisabledActive = var_15_79

	PostLoadFunc(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("GenericOptionButtonBase", GenericOptionButtonBase)
LockTable(_M)
