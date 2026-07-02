module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		assert(arg_1_0._sequences[arg_1_1], "Missing anim " .. arg_1_1)
		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1)
	arg_2_0:SetHandleMouseButton(true)
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

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function GenericToggleButton(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIButton.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_16_0.id = "GenericToggleButton"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "GenericOptionButtonBase"

	var_16_4.Title:SetLeft(_1080p * 20, 0)
	var_16_4.Title:SetRight(_1080p * -375, 0)
	var_16_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_16_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.GenericOptionButtonBase = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "ChangeIndicator"

	var_16_6:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_16_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_16_0:addElement(var_16_6)

	var_16_0.ChangeIndicator = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("GenericInnerButton", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "ButtonFalse"

	var_16_8.Text:SetLeft(_1080p * 10, 0)
	var_16_8.Text:SetRight(_1080p * -5, 0)
	var_16_8.Text:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_16_8.Text:SetAlignment(LUI.Alignment.Left)
	var_16_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -357, _1080p * -189, 0, 0)
	var_16_0:addElement(var_16_8)

	var_16_0.ButtonFalse = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("GenericInnerButton", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "ButtonTrue"

	var_16_10.Text:SetLeft(_1080p * 10, 0)
	var_16_10.Text:SetRight(_1080p * -5, 0)
	var_16_10.Text:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_16_10.Text:SetAlignment(LUI.Alignment.Left)
	var_16_10:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -179, _1080p * -11, 0, 0)
	var_16_0:addElement(var_16_10)

	var_16_0.ButtonTrue = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIImage.new()

	var_16_12.id = "Lock"

	var_16_12:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_16_12:SetAlpha(0, 0)
	var_16_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_16_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_16_0:addElement(var_16_12)

	var_16_0.Lock = var_16_12

	local var_16_13
	local var_16_14 = LUI.UIImage.new()

	var_16_14.id = "LeftLine"

	var_16_14:SetAlpha(0.2, 0)
	var_16_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -356, _1080p * -10, _1080p * 10)
	var_16_0:addElement(var_16_14)

	var_16_0.LeftLine = var_16_14

	local var_16_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_16_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_16_0.GenericOptionButtonBase.Title
		}
	}

	var_16_4:RegisterAnimationSequence("DefaultSequence", var_16_15)

	local var_16_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("DefaultSequence", var_16_16)

	local var_16_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("DefaultSequence", var_16_17)

	local var_16_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("DefaultSequence", var_16_18)

	local var_16_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("DefaultSequence", var_16_19)

	local function var_16_20()
		var_16_4:AnimateSequence("DefaultSequence")
		var_16_6:AnimateSequence("DefaultSequence")
		var_16_8:AnimateSequence("DefaultSequence")
		var_16_10:AnimateSequence("DefaultSequence")
		var_16_12:AnimateSequence("DefaultSequence")
	end

	var_16_0._sequences.DefaultSequence = var_16_20

	local var_16_21 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_16_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_16_0.GenericOptionButtonBase.Title
		}
	}

	var_16_4:RegisterAnimationSequence("Locked", var_16_21)

	local var_16_22 = {
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

	var_16_8:RegisterAnimationSequence("Locked", var_16_22)

	local var_16_23 = {
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

	var_16_10:RegisterAnimationSequence("Locked", var_16_23)

	local var_16_24 = {
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

	var_16_12:RegisterAnimationSequence("Locked", var_16_24)

	local function var_16_25()
		var_16_4:AnimateSequence("Locked")
		var_16_8:AnimateSequence("Locked")
		var_16_10:AnimateSequence("Locked")
		var_16_12:AnimateSequence("Locked")
	end

	var_16_0._sequences.Locked = var_16_25

	local var_16_26 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_16_0.GenericOptionButtonBase.Title
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_16_0.GenericOptionButtonBase.Title
		}
	}

	var_16_4:RegisterAnimationSequence("NewNotification", var_16_26)

	local var_16_27 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_16_8:RegisterAnimationSequence("NewNotification", var_16_27)

	local var_16_28 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_16_10:RegisterAnimationSequence("NewNotification", var_16_28)

	local var_16_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("NewNotification", var_16_29)

	local function var_16_30()
		var_16_4:AnimateSequence("NewNotification")
		var_16_8:AnimateSequence("NewNotification")
		var_16_10:AnimateSequence("NewNotification")
		var_16_12:AnimateSequence("NewNotification")
	end

	var_16_0._sequences.NewNotification = var_16_30

	local var_16_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOver", var_16_31)

	local function var_16_32()
		var_16_6:AnimateSequence("ButtonOver")
	end

	var_16_0._sequences.ButtonOver = var_16_32

	local var_16_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUp", var_16_33)

	local var_16_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUp", var_16_34)

	local var_16_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUp", var_16_35)

	local var_16_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonUp", var_16_36)

	local function var_16_37()
		var_16_6:AnimateSequence("ButtonUp")
		var_16_8:AnimateSequence("ButtonUp")
		var_16_10:AnimateSequence("ButtonUp")
		var_16_12:AnimateSequence("ButtonUp")
	end

	var_16_0._sequences.ButtonUp = var_16_37

	local var_16_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_16_0.GenericOptionButtonBase.Title
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_16_0.GenericOptionButtonBase.Title
		}
	}

	var_16_4:RegisterAnimationSequence("Unlocked", var_16_38)

	local var_16_39 = {
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

	var_16_8:RegisterAnimationSequence("Unlocked", var_16_39)

	local var_16_40 = {
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

	var_16_10:RegisterAnimationSequence("Unlocked", var_16_40)

	local var_16_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("Unlocked", var_16_41)

	local function var_16_42()
		var_16_4:AnimateSequence("Unlocked")
		var_16_8:AnimateSequence("Unlocked")
		var_16_10:AnimateSequence("Unlocked")
		var_16_12:AnimateSequence("Unlocked")
	end

	var_16_0._sequences.Unlocked = var_16_42

	local var_16_43 = {
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

	var_16_6:RegisterAnimationSequence("Changed", var_16_43)

	local function var_16_44()
		var_16_6:AnimateSequence("Changed")
	end

	var_16_0._sequences.Changed = var_16_44

	local var_16_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("NotChanged", var_16_45)

	local function var_16_46()
		var_16_6:AnimateSequence("NotChanged")
	end

	var_16_0._sequences.NotChanged = var_16_46

	local var_16_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("Active", var_16_47)

	local var_16_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("Active", var_16_48)

	local var_16_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("Active", var_16_49)

	local function var_16_50()
		var_16_8:AnimateSequence("Active")
		var_16_10:AnimateSequence("Active")
		var_16_12:AnimateSequence("Active")
	end

	var_16_0._sequences.Active = var_16_50

	local var_16_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonOverActive", var_16_51)

	local function var_16_52()
		var_16_12:AnimateSequence("ButtonOverActive")
	end

	var_16_0._sequences.ButtonOverActive = var_16_52

	local var_16_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpActive", var_16_53)

	local var_16_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUpActive", var_16_54)

	local var_16_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonUpActive", var_16_55)

	local function var_16_56()
		var_16_8:AnimateSequence("ButtonUpActive")
		var_16_10:AnimateSequence("ButtonUpActive")
		var_16_12:AnimateSequence("ButtonUpActive")
	end

	var_16_0._sequences.ButtonUpActive = var_16_56

	local var_16_57 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("Disabled", var_16_57)

	local var_16_58 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("Disabled", var_16_58)

	local var_16_59 = {
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

	var_16_12:RegisterAnimationSequence("Disabled", var_16_59)

	local function var_16_60()
		var_16_8:AnimateSequence("Disabled")
		var_16_10:AnimateSequence("Disabled")
		var_16_12:AnimateSequence("Disabled")
	end

	var_16_0._sequences.Disabled = var_16_60

	local var_16_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonOverDisabled", var_16_61)

	local function var_16_62()
		var_16_12:AnimateSequence("ButtonOverDisabled")
	end

	var_16_0._sequences.ButtonOverDisabled = var_16_62

	local var_16_63 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabled", var_16_63)

	local var_16_64 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUpDisabled", var_16_64)

	local var_16_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonUpDisabled", var_16_65)

	local function var_16_66()
		var_16_8:AnimateSequence("ButtonUpDisabled")
		var_16_10:AnimateSequence("ButtonUpDisabled")
		var_16_12:AnimateSequence("ButtonUpDisabled")
	end

	var_16_0._sequences.ButtonUpDisabled = var_16_66

	local var_16_67 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("DisabledActive", var_16_67)

	local var_16_68 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("DisabledActive", var_16_68)

	local var_16_69 = {
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

	var_16_12:RegisterAnimationSequence("DisabledActive", var_16_69)

	local function var_16_70()
		var_16_8:AnimateSequence("DisabledActive")
		var_16_10:AnimateSequence("DisabledActive")
		var_16_12:AnimateSequence("DisabledActive")
	end

	var_16_0._sequences.DisabledActive = var_16_70

	local var_16_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonOverDisabledActive", var_16_71)

	local function var_16_72()
		var_16_12:AnimateSequence("ButtonOverDisabledActive")
	end

	var_16_0._sequences.ButtonOverDisabledActive = var_16_72

	local var_16_73 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabledActive", var_16_73)

	local var_16_74 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUpDisabledActive", var_16_74)

	local var_16_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonUpDisabledActive", var_16_75)

	local function var_16_76()
		var_16_8:AnimateSequence("ButtonUpDisabledActive")
		var_16_10:AnimateSequence("ButtonUpDisabledActive")
		var_16_12:AnimateSequence("ButtonUpDisabledActive")
	end

	var_16_0._sequences.ButtonUpDisabledActive = var_16_76

	local var_16_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_16_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_16_0.GenericOptionButtonBase.Title
		}
	}

	var_16_4:RegisterAnimationSequence("AR", var_16_77)

	local var_16_78 = {
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
			child = var_16_0.ButtonFalse.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10,
			child = var_16_0.ButtonFalse.Text
		}
	}

	var_16_8:RegisterAnimationSequence("AR", var_16_78)

	local var_16_79 = {
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
			child = var_16_0.ButtonTrue.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10,
			child = var_16_0.ButtonTrue.Text
		}
	}

	var_16_10:RegisterAnimationSequence("AR", var_16_79)

	local var_16_80 = {
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

	var_16_12:RegisterAnimationSequence("AR", var_16_80)

	local var_16_81 = {
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

	var_16_14:RegisterAnimationSequence("AR", var_16_81)

	local function var_16_82()
		var_16_4:AnimateSequence("AR")
		var_16_8:AnimateSequence("AR")
		var_16_10:AnimateSequence("AR")
		var_16_12:AnimateSequence("AR")
		var_16_14:AnimateSequence("AR")
	end

	var_16_0._sequences.AR = var_16_82

	var_16_0:addEventHandler("disable", function(arg_35_0, arg_35_1)
		if not arg_35_1.controller then
			local var_35_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "Disabled")
	end)
	var_16_0:addEventHandler("enable", function(arg_36_0, arg_36_1)
		if not arg_36_1.controller then
			local var_36_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "Unlocked")
	end)
	var_16_0:addEventHandler("button_up", function(arg_37_0, arg_37_1)
		if not arg_37_1.controller then
			local var_37_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "ButtonUp")
		ACTIONS.AnimateSequenceByElement(var_16_0, {
			elementPath = "self.ButtonFalse",
			sequenceName = "ButtonUp",
			elementName = "ButtonFalse"
		})
		ACTIONS.AnimateSequenceByElement(var_16_0, {
			elementPath = "self.ButtonTrue",
			sequenceName = "ButtonUp",
			elementName = "ButtonTrue"
		})
	end)
	var_16_0:addEventHandler("button_over", function(arg_38_0, arg_38_1)
		if not arg_38_1.controller then
			local var_38_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "ButtonOver")
	end)
	PostLoadFunc(var_16_0, var_16_1, arg_16_1)
	ACTIONS.AnimateSequence(var_16_0, "DefaultSequence")

	return var_16_0
end

MenuBuilder.registerType("GenericToggleButton", GenericToggleButton)
LockTable(_M)
