module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		assert(arg_1_0._sequences[arg_1_1], "Missing anim " .. arg_1_1)
		WZWIP.AnimateThemeElement(arg_1_0, arg_1_1)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1)
	arg_2_0:SetHandleMouseButton(true)

	local var_2_0 = WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp", CONDITIONS.IsWZWipDvarEnabled())

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		var_0_0(arg_3_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("active", function(arg_4_0, arg_4_1)
		var_0_0(arg_4_0, "Active")
	end)
	arg_2_0:addEventHandler("button_over_active", function(arg_5_0, arg_5_1)
		var_0_0(arg_5_0, "ButtonOverActive")
	end)
	arg_2_0:addEventHandler("button_active", function(arg_6_0, arg_6_1)
		var_0_0(arg_6_0, "ButtonUpActive")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		var_0_0(arg_7_0, "ButtonUp")
		ACTIONS.AnimateSequenceByElement(arg_7_0, {
			elementPath = "self.ButtonFalse",
			elementName = "ButtonFalse",
			sequenceName = var_2_0
		})
		ACTIONS.AnimateSequenceByElement(arg_7_0, {
			elementPath = "self.ButtonTrue",
			elementName = "ButtonTrue",
			sequenceName = var_2_0
		})
	end)
	arg_2_0:addEventHandler("disable_active", function(arg_8_0, arg_8_1)
		var_0_0(arg_8_0, "DisabledActive")
	end)
	arg_2_0:addEventHandler("button_over_disable_active", function(arg_9_0, arg_9_1)
		var_0_0(arg_9_0, "ButtonOverDisabledActive")
	end)
	arg_2_0:addEventHandler("button_disable_active", function(arg_10_0, arg_10_1)
		var_0_0(arg_10_0, "ButtonUpDisabledActive")
	end)
	arg_2_0:addEventHandler("disable", function(arg_11_0, arg_11_1)
		var_0_0(arg_11_0, "Disabled")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		var_0_0(arg_12_0, "ButtonOverDisabled")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_13_0, arg_13_1)
		var_0_0(arg_13_0, "ButtonUpDisabled")
	end)
	arg_2_0:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if not arg_14_0:IsActive() then
			arg_14_0:dispatchEventToParent({
				name = "request_active",
				target = arg_14_0
			})
		elseif arg_14_1.keyboard then
			arg_14_0:ToggleValue(arg_2_1)
		end

		return true
	end)
	arg_2_0:addEventHandler("button_action_disable", function(arg_15_0, arg_15_1)
		arg_15_0:dispatchEventToParent({
			name = "request_active",
			target = arg_15_0
		})
	end)
	arg_2_0:addEventHandler("enable", function(arg_16_0, arg_16_1)
		ACTIONS.AnimateSequence(arg_16_0, "Unlocked")
	end)
	arg_2_0:addEventHandler("disable", function(arg_17_0, arg_17_1)
		ACTIONS.AnimateSequence(arg_17_0, "Disabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function GenericToggleButton(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIButton.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_18_0.id = "GenericToggleButton"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "GenericOptionButtonBase"

	var_18_4.Title:SetLeft(_1080p * 20, 0)
	var_18_4.Title:SetRight(_1080p * -375, 0)
	var_18_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_18_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.GenericOptionButtonBase = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "ChangeIndicator"

	var_18_6:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_18_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_18_0:addElement(var_18_6)

	var_18_0.ChangeIndicator = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("GenericInnerButton", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "ButtonFalse"

	var_18_8.Text:SetLeft(_1080p * 10, 0)
	var_18_8.Text:SetRight(_1080p * -5, 0)
	var_18_8.Text:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_18_8.Text:SetAlignment(LUI.Alignment.Left)
	var_18_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -357, _1080p * -189, 0, 0)
	var_18_0:addElement(var_18_8)

	var_18_0.ButtonFalse = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("GenericInnerButton", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "ButtonTrue"

	var_18_10.Text:SetLeft(_1080p * 10, 0)
	var_18_10.Text:SetRight(_1080p * -5, 0)
	var_18_10.Text:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_18_10.Text:SetAlignment(LUI.Alignment.Left)
	var_18_10:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -179, _1080p * -11, 0, 0)
	var_18_0:addElement(var_18_10)

	var_18_0.ButtonTrue = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIImage.new()

	var_18_12.id = "Lock"

	var_18_12:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_18_12:SetAlpha(0, 0)
	var_18_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_18_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_18_0:addElement(var_18_12)

	var_18_0.Lock = var_18_12

	local var_18_13
	local var_18_14 = LUI.UIImage.new()

	var_18_14.id = "LeftLine"

	var_18_14:SetAlpha(0.2, 0)
	var_18_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -356, _1080p * -10, _1080p * 10)
	var_18_0:addElement(var_18_14)

	var_18_0.LeftLine = var_18_14

	local function var_18_15()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_15

	local var_18_16
	local var_18_17 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_18_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_18_0.GenericOptionButtonBase.Title
		}
	}

	var_18_4:RegisterAnimationSequence("Locked", var_18_17)

	local var_18_18 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_18_8:RegisterAnimationSequence("Locked", var_18_18)

	local var_18_19 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_18_10:RegisterAnimationSequence("Locked", var_18_19)

	local var_18_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -364
		}
	}

	var_18_12:RegisterAnimationSequence("Locked", var_18_20)

	local function var_18_21()
		var_18_4:AnimateSequence("Locked")
		var_18_8:AnimateSequence("Locked")
		var_18_10:AnimateSequence("Locked")
		var_18_12:AnimateSequence("Locked")
	end

	var_18_0._sequences.Locked = var_18_21

	local var_18_22
	local var_18_23 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_18_0.GenericOptionButtonBase.Title
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_18_0.GenericOptionButtonBase.Title
		}
	}

	var_18_4:RegisterAnimationSequence("NewNotification", var_18_23)

	local var_18_24 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_18_8:RegisterAnimationSequence("NewNotification", var_18_24)

	local var_18_25 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_18_10:RegisterAnimationSequence("NewNotification", var_18_25)

	local var_18_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("NewNotification", var_18_26)

	local function var_18_27()
		var_18_4:AnimateSequence("NewNotification")
		var_18_8:AnimateSequence("NewNotification")
		var_18_10:AnimateSequence("NewNotification")
		var_18_12:AnimateSequence("NewNotification")
	end

	var_18_0._sequences.NewNotification = var_18_27

	local var_18_28
	local var_18_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_18_6:RegisterAnimationSequence("ButtonOver", var_18_29)

	local function var_18_30()
		var_18_6:AnimateSequence("ButtonOver")
	end

	var_18_0._sequences.ButtonOver = var_18_30

	local var_18_31
	local var_18_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_18_6:RegisterAnimationSequence("ButtonUp", var_18_32)

	local var_18_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("ButtonUp", var_18_33)

	local var_18_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ButtonUp", var_18_34)

	local var_18_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonUp", var_18_35)

	local function var_18_36()
		var_18_6:AnimateSequence("ButtonUp")
		var_18_8:AnimateSequence("ButtonUp")
		var_18_10:AnimateSequence("ButtonUp")
		var_18_12:AnimateSequence("ButtonUp")
	end

	var_18_0._sequences.ButtonUp = var_18_36

	local var_18_37
	local var_18_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_18_0.GenericOptionButtonBase.Title
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_18_0.GenericOptionButtonBase.Title
		}
	}

	var_18_4:RegisterAnimationSequence("Unlocked", var_18_38)

	local var_18_39 = {
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

	var_18_8:RegisterAnimationSequence("Unlocked", var_18_39)

	local var_18_40 = {
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

	var_18_10:RegisterAnimationSequence("Unlocked", var_18_40)

	local var_18_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("Unlocked", var_18_41)

	local function var_18_42()
		var_18_4:AnimateSequence("Unlocked")
		var_18_8:AnimateSequence("Unlocked")
		var_18_10:AnimateSequence("Unlocked")
		var_18_12:AnimateSequence("Unlocked")
	end

	var_18_0._sequences.Unlocked = var_18_42

	local var_18_43
	local var_18_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_18_6:RegisterAnimationSequence("Changed", var_18_44)

	local function var_18_45()
		var_18_6:AnimateSequence("Changed")
	end

	var_18_0._sequences.Changed = var_18_45

	local var_18_46
	local var_18_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_6:RegisterAnimationSequence("NotChanged", var_18_47)

	local function var_18_48()
		var_18_6:AnimateSequence("NotChanged")
	end

	var_18_0._sequences.NotChanged = var_18_48

	local var_18_49
	local var_18_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("Active", var_18_50)

	local var_18_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("Active", var_18_51)

	local var_18_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("Active", var_18_52)

	local function var_18_53()
		var_18_8:AnimateSequence("Active")
		var_18_10:AnimateSequence("Active")
		var_18_12:AnimateSequence("Active")
	end

	var_18_0._sequences.Active = var_18_53

	local var_18_54
	local var_18_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonOverActive", var_18_55)

	local function var_18_56()
		var_18_12:AnimateSequence("ButtonOverActive")
	end

	var_18_0._sequences.ButtonOverActive = var_18_56

	local var_18_57
	local var_18_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("ButtonUpActive", var_18_58)

	local var_18_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ButtonUpActive", var_18_59)

	local var_18_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonUpActive", var_18_60)

	local function var_18_61()
		var_18_8:AnimateSequence("ButtonUpActive")
		var_18_10:AnimateSequence("ButtonUpActive")
		var_18_12:AnimateSequence("ButtonUpActive")
	end

	var_18_0._sequences.ButtonUpActive = var_18_61

	local var_18_62
	local var_18_63 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("Disabled", var_18_63)

	local var_18_64 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("Disabled", var_18_64)

	local var_18_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -364
		}
	}

	var_18_12:RegisterAnimationSequence("Disabled", var_18_65)

	local function var_18_66()
		var_18_8:AnimateSequence("Disabled")
		var_18_10:AnimateSequence("Disabled")
		var_18_12:AnimateSequence("Disabled")
	end

	var_18_0._sequences.Disabled = var_18_66

	local var_18_67
	local var_18_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonOverDisabled", var_18_68)

	local function var_18_69()
		var_18_12:AnimateSequence("ButtonOverDisabled")
	end

	var_18_0._sequences.ButtonOverDisabled = var_18_69

	local var_18_70
	local var_18_71 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("ButtonUpDisabled", var_18_71)

	local var_18_72 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ButtonUpDisabled", var_18_72)

	local var_18_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonUpDisabled", var_18_73)

	local function var_18_74()
		var_18_8:AnimateSequence("ButtonUpDisabled")
		var_18_10:AnimateSequence("ButtonUpDisabled")
		var_18_12:AnimateSequence("ButtonUpDisabled")
	end

	var_18_0._sequences.ButtonUpDisabled = var_18_74

	local var_18_75
	local var_18_76 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("DisabledActive", var_18_76)

	local var_18_77 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("DisabledActive", var_18_77)

	local var_18_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -364
		}
	}

	var_18_12:RegisterAnimationSequence("DisabledActive", var_18_78)

	local function var_18_79()
		var_18_8:AnimateSequence("DisabledActive")
		var_18_10:AnimateSequence("DisabledActive")
		var_18_12:AnimateSequence("DisabledActive")
	end

	var_18_0._sequences.DisabledActive = var_18_79

	local var_18_80
	local var_18_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonOverDisabledActive", var_18_81)

	local function var_18_82()
		var_18_12:AnimateSequence("ButtonOverDisabledActive")
	end

	var_18_0._sequences.ButtonOverDisabledActive = var_18_82

	local var_18_83
	local var_18_84 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("ButtonUpDisabledActive", var_18_84)

	local var_18_85 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_10:RegisterAnimationSequence("ButtonUpDisabledActive", var_18_85)

	local var_18_86 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonUpDisabledActive", var_18_86)

	local function var_18_87()
		var_18_8:AnimateSequence("ButtonUpDisabledActive")
		var_18_10:AnimateSequence("ButtonUpDisabledActive")
		var_18_12:AnimateSequence("ButtonUpDisabledActive")
	end

	var_18_0._sequences.ButtonUpDisabledActive = var_18_87

	local var_18_88
	local var_18_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_18_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_18_0.GenericOptionButtonBase.Title
		}
	}

	var_18_4:RegisterAnimationSequence("AR", var_18_89)

	local var_18_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 178
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5,
			child = var_18_0.ButtonFalse.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10,
			child = var_18_0.ButtonFalse.Text
		}
	}

	var_18_8:RegisterAnimationSequence("AR", var_18_90)

	local var_18_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 188
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 356
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5,
			child = var_18_0.ButtonTrue.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10,
			child = var_18_0.ButtonTrue.Text
		}
	}

	var_18_10:RegisterAnimationSequence("AR", var_18_91)

	local var_18_92 = {
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

	var_18_12:RegisterAnimationSequence("AR", var_18_92)

	local var_18_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 356
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
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

	var_18_14:RegisterAnimationSequence("AR", var_18_93)

	local function var_18_94()
		var_18_4:AnimateSequence("AR")
		var_18_8:AnimateSequence("AR")
		var_18_10:AnimateSequence("AR")
		var_18_12:AnimateSequence("AR")
		var_18_14:AnimateSequence("AR")
	end

	var_18_0._sequences.AR = var_18_94

	local var_18_95
	local var_18_96 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_18_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_18_0.GenericOptionButtonBase.Title
		}
	}

	var_18_4:RegisterAnimationSequence("WZWipSetup", var_18_96)

	local var_18_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_18_6:RegisterAnimationSequence("WZWipSetup", var_18_97)

	local var_18_98 = {
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

	var_18_8:RegisterAnimationSequence("WZWipSetup", var_18_98)

	local var_18_99 = {
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

	var_18_10:RegisterAnimationSequence("WZWipSetup", var_18_99)

	local var_18_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_18_12:RegisterAnimationSequence("WZWipSetup", var_18_100)

	local function var_18_101()
		var_18_4:AnimateSequence("WZWipSetup")
		var_18_6:AnimateSequence("WZWipSetup")
		var_18_8:AnimateSequence("WZWipSetup")
		var_18_10:AnimateSequence("WZWipSetup")
		var_18_12:AnimateSequence("WZWipSetup")
	end

	var_18_0._sequences.WZWipSetup = var_18_101

	local var_18_102
	local var_18_103 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_18_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_18_0.GenericOptionButtonBase.Title
		}
	}

	var_18_4:RegisterAnimationSequence("WZWipLocked", var_18_103)

	local var_18_104 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_18_8:RegisterAnimationSequence("WZWipLocked", var_18_104)

	local var_18_105 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_18_10:RegisterAnimationSequence("WZWipLocked", var_18_105)

	local var_18_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -364
		}
	}

	var_18_12:RegisterAnimationSequence("WZWipLocked", var_18_106)

	local function var_18_107()
		var_18_4:AnimateSequence("WZWipLocked")
		var_18_8:AnimateSequence("WZWipLocked")
		var_18_10:AnimateSequence("WZWipLocked")
		var_18_12:AnimateSequence("WZWipLocked")
	end

	var_18_0._sequences.WZWipLocked = var_18_107

	local var_18_108
	local var_18_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_18_0.GenericOptionButtonBase.Title
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_18_0.GenericOptionButtonBase.Title
		}
	}

	var_18_4:RegisterAnimationSequence("WZWipUnlocked", var_18_109)

	local var_18_110 = {
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

	var_18_8:RegisterAnimationSequence("WZWipUnlocked", var_18_110)

	local var_18_111 = {
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

	var_18_10:RegisterAnimationSequence("WZWipUnlocked", var_18_111)

	local var_18_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("WZWipUnlocked", var_18_112)

	local function var_18_113()
		var_18_4:AnimateSequence("WZWipUnlocked")
		var_18_8:AnimateSequence("WZWipUnlocked")
		var_18_10:AnimateSequence("WZWipUnlocked")
		var_18_12:AnimateSequence("WZWipUnlocked")
	end

	var_18_0._sequences.WZWipUnlocked = var_18_113

	local var_18_114
	local var_18_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_6:RegisterAnimationSequence("WZWipChanged", var_18_115)

	local function var_18_116()
		var_18_6:AnimateSequence("WZWipChanged")
	end

	var_18_0._sequences.WZWipChanged = var_18_116

	local var_18_117
	local var_18_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_6:RegisterAnimationSequence("WZWipNotChanged", var_18_118)

	local function var_18_119()
		var_18_6:AnimateSequence("WZWipNotChanged")
	end

	var_18_0._sequences.WZWipNotChanged = var_18_119

	PostLoadFunc(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("GenericToggleButton", GenericToggleButton)
LockTable(_M)
