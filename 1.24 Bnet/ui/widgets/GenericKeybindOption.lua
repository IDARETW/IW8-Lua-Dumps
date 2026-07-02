module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:addEventHandler("binding", function(arg_2_0, arg_2_1)
		if arg_2_0.GenericButtonBackground then
			arg_2_0.GenericButtonBackground:processEvent({
				name = "binding"
			})
		end

		if arg_2_0.PrimaryKey then
			arg_2_0.PrimaryKey:processEvent({
				name = "binding"
			})
		end

		if arg_2_0.SecondaryKey then
			arg_2_0.SecondaryKey:processEvent({
				name = "binding"
			})
		end

		if arg_2_0.LinkButton then
			ACTIONS.AnimateSequence(arg_2_0.LinkButton, "Binding")
		end
	end)
	arg_1_0:addEventHandler("button_active", function(arg_3_0, arg_3_1)
		if arg_3_0.PrimaryKey then
			arg_3_0.PrimaryKey:processEvent({
				name = "button_active"
			})
		end

		if arg_3_0.SecondaryKey then
			arg_3_0.SecondaryKey:processEvent({
				name = "button_active"
			})
		end

		if arg_3_0.LinkButton then
			ACTIONS.AnimateSequence(arg_3_0.LinkButton, "Active")
		end
	end)
	arg_1_0:addEventHandler("button_over_active", function(arg_4_0, arg_4_1)
		if arg_4_0.PrimaryKey then
			arg_4_0.PrimaryKey:processEvent({
				name = "button_active"
			})
		end

		if arg_4_0.SecondaryKey then
			arg_4_0.SecondaryKey:processEvent({
				name = "button_active"
			})
		end

		if arg_4_0.LinkButton then
			ACTIONS.AnimateSequence(arg_4_0.LinkButton, "GainFocus")
		end
	end)
	arg_1_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		if arg_5_0.LinkButton then
			ACTIONS.AnimateSequence(arg_5_0.LinkButton, "ButtonUp")
		end
	end)
	arg_1_0:addEventHandler("button_up_active", function(arg_6_0, arg_6_1)
		if arg_6_0.LinkButton then
			ACTIONS.AnimateSequence(arg_6_0.LinkButton, "ButtonUp")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

local function var_0_1(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._needKeybindLinkButton = arg_7_2.needKeybindLinkButton
end

function GenericKeybindOption(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_8_0.id = "GenericKeybindOption"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)
	var_0_1(var_8_0, var_8_1, arg_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "GenericButtonBackground"

	var_8_4.Title:SetLeft(_1080p * 20, 0)
	var_8_4.Title:SetRight(_1080p * -375, 0)
	var_8_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.GenericButtonBackground = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericKeybindInnerButton", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "PrimaryKey"

	var_8_6.Text:setText("KEY", 0)
	var_8_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -357, _1080p * -189, 0, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.PrimaryKey = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("GenericKeybindInnerButton", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "SecondaryKey"

	var_8_8.Text:setText("KEY", 0)
	var_8_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -189, _1080p * -21, 0, 0)
	var_8_0:addElement(var_8_8)

	var_8_0.SecondaryKey = var_8_8

	local var_8_9

	if CONDITIONS.ShouldCreateKeybindLinkButton(var_8_0) then
		var_8_9 = MenuBuilder.BuildRegisteredType("GenericKeybindLinkButton", {
			controllerIndex = var_8_1
		})
		var_8_9.id = "LinkButton"

		var_8_9:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -405, _1080p * -369, 0, 0)
		var_8_0:addElement(var_8_9)

		var_8_0.LinkButton = var_8_9
	end

	local var_8_10
	local var_8_11 = LUI.UIImage.new()

	var_8_11.id = "Lock"

	var_8_11:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_8_11:SetAlpha(0, 0)
	var_8_11:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_11:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -395, _1080p * -369, _1080p * -13, _1080p * 13)
	var_8_0:addElement(var_8_11)

	var_8_0.Lock = var_8_11

	local var_8_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("DefaultSequence", var_8_12)

	local var_8_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("DefaultSequence", var_8_13)

	local var_8_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("DefaultSequence", var_8_14)

	local function var_8_15()
		var_8_6:AnimateSequence("DefaultSequence")
		var_8_8:AnimateSequence("DefaultSequence")
		var_8_11:AnimateSequence("DefaultSequence")
	end

	var_8_0._sequences.DefaultSequence = var_8_15

	local var_8_16 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_8_0.GenericButtonBackground.Title
		}
	}

	var_8_4:RegisterAnimationSequence("NewNotification", var_8_16)

	local var_8_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("NewNotification", var_8_17)

	local function var_8_18()
		var_8_4:AnimateSequence("NewNotification")
		var_8_11:AnimateSequence("NewNotification")
	end

	var_8_0._sequences.NewNotification = var_8_18

	local var_8_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOver", var_8_19)

	local function var_8_20()
		var_8_11:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_20

	local var_8_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_21)

	local var_8_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_22)

	local var_8_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonUp", var_8_23)

	local function var_8_24()
		var_8_6:AnimateSequence("ButtonUp")
		var_8_8:AnimateSequence("ButtonUp")
		var_8_11:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_24

	local var_8_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("Changed", var_8_25)

	local function var_8_26()
		var_8_11:AnimateSequence("Changed")
	end

	var_8_0._sequences.Changed = var_8_26

	local var_8_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("NotChanged", var_8_27)

	local function var_8_28()
		var_8_11:AnimateSequence("NotChanged")
	end

	var_8_0._sequences.NotChanged = var_8_28

	local var_8_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Active", var_8_29)

	local var_8_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Active", var_8_30)

	local var_8_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("Active", var_8_31)

	local function var_8_32()
		var_8_6:AnimateSequence("Active")
		var_8_8:AnimateSequence("Active")
		var_8_11:AnimateSequence("Active")
	end

	var_8_0._sequences.Active = var_8_32

	local var_8_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOverActive", var_8_33)

	local function var_8_34()
		var_8_11:AnimateSequence("ButtonOverActive")
	end

	var_8_0._sequences.ButtonOverActive = var_8_34

	local var_8_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpActive", var_8_35)

	local var_8_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpActive", var_8_36)

	local var_8_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonUpActive", var_8_37)

	local function var_8_38()
		var_8_6:AnimateSequence("ButtonUpActive")
		var_8_8:AnimateSequence("ButtonUpActive")
		var_8_11:AnimateSequence("ButtonUpActive")
	end

	var_8_0._sequences.ButtonUpActive = var_8_38

	local var_8_39 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Disabled", var_8_39)

	local var_8_40 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Disabled", var_8_40)

	local var_8_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -392
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -362
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

	var_8_11:RegisterAnimationSequence("Disabled", var_8_41)

	local function var_8_42()
		var_8_6:AnimateSequence("Disabled")
		var_8_8:AnimateSequence("Disabled")
		var_8_11:AnimateSequence("Disabled")
	end

	var_8_0._sequences.Disabled = var_8_42

	local var_8_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOverDisabled", var_8_43)

	local function var_8_44()
		var_8_11:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_44

	local var_8_45 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpDisabled", var_8_45)

	local var_8_46 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpDisabled", var_8_46)

	local var_8_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonUpDisabled", var_8_47)

	local function var_8_48()
		var_8_6:AnimateSequence("ButtonUpDisabled")
		var_8_8:AnimateSequence("ButtonUpDisabled")
		var_8_11:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_48

	local var_8_49 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("DisabledActive", var_8_49)

	local var_8_50 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("DisabledActive", var_8_50)

	local var_8_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.X_Rotation
		}
	}

	var_8_11:RegisterAnimationSequence("DisabledActive", var_8_51)

	local function var_8_52()
		var_8_6:AnimateSequence("DisabledActive")
		var_8_8:AnimateSequence("DisabledActive")
		var_8_11:AnimateSequence("DisabledActive")
	end

	var_8_0._sequences.DisabledActive = var_8_52

	local var_8_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOverDisabledActive", var_8_53)

	local function var_8_54()
		var_8_11:AnimateSequence("ButtonOverDisabledActive")
	end

	var_8_0._sequences.ButtonOverDisabledActive = var_8_54

	local var_8_55 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpDisabledActive", var_8_55)

	local var_8_56 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpDisabledActive", var_8_56)

	local var_8_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonUpDisabledActive", var_8_57)

	local function var_8_58()
		var_8_6:AnimateSequence("ButtonUpDisabledActive")
		var_8_8:AnimateSequence("ButtonUpDisabledActive")
		var_8_11:AnimateSequence("ButtonUpDisabledActive")
	end

	var_8_0._sequences.ButtonUpDisabledActive = var_8_58

	local var_8_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding,
			child = var_8_0.GenericButtonBackground.Title
		}
	}

	var_8_4:RegisterAnimationSequence("Binding", var_8_59)

	local var_8_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("Binding", var_8_60)

	local function var_8_61()
		var_8_4:AnimateSequence("Binding")
		var_8_11:AnimateSequence("Binding")
	end

	var_8_0._sequences.Binding = var_8_61

	local var_8_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -412,
			child = var_8_0.GenericButtonBackground.Title
		}
	}

	var_8_4:RegisterAnimationSequence("ShorterTitle", var_8_62)

	local var_8_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ShorterTitle", var_8_63)

	local function var_8_64()
		var_8_4:AnimateSequence("ShorterTitle")
		var_8_11:AnimateSequence("ShorterTitle")
	end

	var_8_0._sequences.ShorterTitle = var_8_64

	local var_8_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_8_0.GenericButtonBackground.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_8_0.GenericButtonBackground.Title
		}
	}

	var_8_4:RegisterAnimationSequence("AR", var_8_65)

	local var_8_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 188
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

	var_8_6:RegisterAnimationSequence("AR", var_8_66)

	local var_8_67 = {
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
		}
	}

	var_8_8:RegisterAnimationSequence("AR", var_8_67)

	if CONDITIONS.ShouldCreateKeybindLinkButton(var_8_0) then
		local var_8_68 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 356
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 392
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

		var_8_9:RegisterAnimationSequence("AR", var_8_68)
	end

	local var_8_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("AR", var_8_69)

	local function var_8_70()
		var_8_4:AnimateSequence("AR")
		var_8_6:AnimateSequence("AR")
		var_8_8:AnimateSequence("AR")

		if CONDITIONS.ShouldCreateKeybindLinkButton(var_8_0) then
			var_8_9:AnimateSequence("AR")
		end

		var_8_11:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_70

	local var_8_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_8_0.GenericButtonBackground.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412,
			child = var_8_0.GenericButtonBackground.Title
		}
	}

	var_8_4:RegisterAnimationSequence("ShorterTitleAR", var_8_71)

	local var_8_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("ShorterTitleAR", var_8_72)

	local function var_8_73()
		var_8_4:AnimateSequence("ShorterTitleAR")
		var_8_11:AnimateSequence("ShorterTitleAR")
	end

	var_8_0._sequences.ShorterTitleAR = var_8_73

	var_8_0:addEventHandler("button_over", function(arg_28_0, arg_28_1)
		if not arg_28_1.controller then
			local var_28_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonOver")
		ACTIONS.AnimateSequenceByElement(var_8_0, {
			elementPath = "self.GenericButtonBackground.GenericButtonBackground",
			sequenceName = "ButtonOver",
			elementName = "GenericButtonBackground"
		})
	end)
	var_8_0:addEventHandler("button_up", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonUp")
		ACTIONS.AnimateSequenceByElement(var_8_0, {
			elementPath = "self.PrimaryKey",
			sequenceName = "ButtonUp",
			elementName = "PrimaryKey"
		})
		ACTIONS.AnimateSequenceByElement(var_8_0, {
			elementPath = "self.SecondaryKey",
			sequenceName = "ButtonUp",
			elementName = "SecondaryKey"
		})
	end)
	var_8_0:addEventHandler("disable", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "Disabled")
	end)
	var_0_0(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "DefaultSequence")

	return var_8_0
end

MenuBuilder.registerType("GenericKeybindOption", GenericKeybindOption)
LockTable(_M)
