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
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

local function var_0_1(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._needKeybindLinkButton = arg_5_2.needKeybindLinkButton
end

function GenericKeybindOption(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_6_0.id = "GenericKeybindOption"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "GenericButtonBackground"

	var_6_4.Title:SetLeft(_1080p * 20, 0)
	var_6_4.Title:SetRight(_1080p * -375, 0)
	var_6_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.GenericButtonBackground = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericKeybindInnerButton", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "PrimaryKey"

	var_6_6.Text:setText("KEY", 0)
	var_6_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -357, _1080p * -189, 0, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.PrimaryKey = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("GenericKeybindInnerButton", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "SecondaryKey"

	var_6_8.Text:setText("KEY", 0)
	var_6_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -189, _1080p * -21, 0, 0)
	var_6_0:addElement(var_6_8)

	var_6_0.SecondaryKey = var_6_8

	local var_6_9

	if CONDITIONS.ShouldCreateKeybindLinkButton(var_6_0) then
		var_6_9 = MenuBuilder.BuildRegisteredType("GenericKeybindLinkButton", {
			controllerIndex = var_6_1
		})
		var_6_9.id = "LinkButton"

		var_6_9:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -405, _1080p * -369, 0, 0)
		var_6_0:addElement(var_6_9)

		var_6_0.LinkButton = var_6_9
	end

	local var_6_10
	local var_6_11 = LUI.UIImage.new()

	var_6_11.id = "Lock"

	var_6_11:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_6_11:SetAlpha(0, 0)
	var_6_11:setImage(RegisterMaterial("icon_lock"), 0)
	var_6_11:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -395, _1080p * -369, _1080p * -13, _1080p * 13)
	var_6_0:addElement(var_6_11)

	var_6_0.Lock = var_6_11

	local var_6_12
	local var_6_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("DefaultSequence", var_6_13)

	local var_6_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("DefaultSequence", var_6_14)

	local var_6_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("DefaultSequence", var_6_15)

	local function var_6_16()
		var_6_6:AnimateSequence("DefaultSequence")
		var_6_8:AnimateSequence("DefaultSequence")
		var_6_11:AnimateSequence("DefaultSequence")
	end

	var_6_0._sequences.DefaultSequence = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_6_0.GenericButtonBackground.Title
		}
	}

	var_6_4:RegisterAnimationSequence("NewNotification", var_6_18)

	local var_6_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("NewNotification", var_6_19)

	local function var_6_20()
		var_6_4:AnimateSequence("NewNotification")
		var_6_11:AnimateSequence("NewNotification")
	end

	var_6_0._sequences.NewNotification = var_6_20

	local var_6_21
	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonOver", var_6_22)

	local function var_6_23()
		var_6_11:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_23

	local var_6_24
	local var_6_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_25)

	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_26)

	local var_6_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonUp", var_6_27)

	local function var_6_28()
		var_6_6:AnimateSequence("ButtonUp")
		var_6_8:AnimateSequence("ButtonUp")
		var_6_11:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_28

	local var_6_29
	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("Changed", var_6_30)

	local function var_6_31()
		var_6_11:AnimateSequence("Changed")
	end

	var_6_0._sequences.Changed = var_6_31

	local var_6_32
	local var_6_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("NotChanged", var_6_33)

	local function var_6_34()
		var_6_11:AnimateSequence("NotChanged")
	end

	var_6_0._sequences.NotChanged = var_6_34

	local var_6_35
	local var_6_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Active", var_6_36)

	local var_6_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Active", var_6_37)

	local var_6_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("Active", var_6_38)

	local function var_6_39()
		var_6_6:AnimateSequence("Active")
		var_6_8:AnimateSequence("Active")
		var_6_11:AnimateSequence("Active")
	end

	var_6_0._sequences.Active = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonOverActive", var_6_41)

	local function var_6_42()
		var_6_11:AnimateSequence("ButtonOverActive")
	end

	var_6_0._sequences.ButtonOverActive = var_6_42

	local var_6_43
	local var_6_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpActive", var_6_44)

	local var_6_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUpActive", var_6_45)

	local var_6_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonUpActive", var_6_46)

	local function var_6_47()
		var_6_6:AnimateSequence("ButtonUpActive")
		var_6_8:AnimateSequence("ButtonUpActive")
		var_6_11:AnimateSequence("ButtonUpActive")
	end

	var_6_0._sequences.ButtonUpActive = var_6_47

	local var_6_48
	local var_6_49 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Disabled", var_6_49)

	local var_6_50 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Disabled", var_6_50)

	local var_6_51 = {
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

	var_6_11:RegisterAnimationSequence("Disabled", var_6_51)

	local function var_6_52()
		var_6_6:AnimateSequence("Disabled")
		var_6_8:AnimateSequence("Disabled")
		var_6_11:AnimateSequence("Disabled")
	end

	var_6_0._sequences.Disabled = var_6_52

	local var_6_53
	local var_6_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonOverDisabled", var_6_54)

	local function var_6_55()
		var_6_11:AnimateSequence("ButtonOverDisabled")
	end

	var_6_0._sequences.ButtonOverDisabled = var_6_55

	local var_6_56
	local var_6_57 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpDisabled", var_6_57)

	local var_6_58 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUpDisabled", var_6_58)

	local var_6_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonUpDisabled", var_6_59)

	local function var_6_60()
		var_6_6:AnimateSequence("ButtonUpDisabled")
		var_6_8:AnimateSequence("ButtonUpDisabled")
		var_6_11:AnimateSequence("ButtonUpDisabled")
	end

	var_6_0._sequences.ButtonUpDisabled = var_6_60

	local var_6_61
	local var_6_62 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("DisabledActive", var_6_62)

	local var_6_63 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("DisabledActive", var_6_63)

	local var_6_64 = {
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

	var_6_11:RegisterAnimationSequence("DisabledActive", var_6_64)

	local function var_6_65()
		var_6_6:AnimateSequence("DisabledActive")
		var_6_8:AnimateSequence("DisabledActive")
		var_6_11:AnimateSequence("DisabledActive")
	end

	var_6_0._sequences.DisabledActive = var_6_65

	local var_6_66
	local var_6_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonOverDisabledActive", var_6_67)

	local function var_6_68()
		var_6_11:AnimateSequence("ButtonOverDisabledActive")
	end

	var_6_0._sequences.ButtonOverDisabledActive = var_6_68

	local var_6_69
	local var_6_70 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpDisabledActive", var_6_70)

	local var_6_71 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUpDisabledActive", var_6_71)

	local var_6_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonUpDisabledActive", var_6_72)

	local function var_6_73()
		var_6_6:AnimateSequence("ButtonUpDisabledActive")
		var_6_8:AnimateSequence("ButtonUpDisabledActive")
		var_6_11:AnimateSequence("ButtonUpDisabledActive")
	end

	var_6_0._sequences.ButtonUpDisabledActive = var_6_73

	local var_6_74
	local var_6_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding,
			child = var_6_0.GenericButtonBackground.Title
		}
	}

	var_6_4:RegisterAnimationSequence("Binding", var_6_75)

	local var_6_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("Binding", var_6_76)

	local function var_6_77()
		var_6_4:AnimateSequence("Binding")
		var_6_11:AnimateSequence("Binding")
	end

	var_6_0._sequences.Binding = var_6_77

	local var_6_78
	local var_6_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -412,
			child = var_6_0.GenericButtonBackground.Title
		}
	}

	var_6_4:RegisterAnimationSequence("ShorterTitle", var_6_79)

	local var_6_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ShorterTitle", var_6_80)

	local function var_6_81()
		var_6_4:AnimateSequence("ShorterTitle")
		var_6_11:AnimateSequence("ShorterTitle")
	end

	var_6_0._sequences.ShorterTitle = var_6_81

	local var_6_82
	local var_6_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_6_0.GenericButtonBackground.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_6_0.GenericButtonBackground.Title
		}
	}

	var_6_4:RegisterAnimationSequence("AR", var_6_83)

	local var_6_84 = {
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

	var_6_6:RegisterAnimationSequence("AR", var_6_84)

	local var_6_85 = {
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

	var_6_8:RegisterAnimationSequence("AR", var_6_85)

	if CONDITIONS.ShouldCreateKeybindLinkButton(var_6_0) then
		local var_6_86 = {
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

		var_6_9:RegisterAnimationSequence("AR", var_6_86)
	end

	local var_6_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("AR", var_6_87)

	local function var_6_88()
		var_6_4:AnimateSequence("AR")
		var_6_6:AnimateSequence("AR")
		var_6_8:AnimateSequence("AR")

		if CONDITIONS.ShouldCreateKeybindLinkButton(var_6_0) then
			var_6_9:AnimateSequence("AR")
		end

		var_6_11:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_88

	local var_6_89
	local var_6_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_6_0.GenericButtonBackground.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412,
			child = var_6_0.GenericButtonBackground.Title
		}
	}

	var_6_4:RegisterAnimationSequence("ShorterTitleAR", var_6_90)

	local var_6_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("ShorterTitleAR", var_6_91)

	local function var_6_92()
		var_6_4:AnimateSequence("ShorterTitleAR")
		var_6_11:AnimateSequence("ShorterTitleAR")
	end

	var_6_0._sequences.ShorterTitleAR = var_6_92

	local var_6_93
	local var_6_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_6_0.GenericButtonBackground.Title
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipSetup", var_6_94)

	local function var_6_95()
		var_6_4:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_95

	local var_6_96
	local var_6_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("WZWipChanged", var_6_97)

	local function var_6_98()
		var_6_11:AnimateSequence("WZWipChanged")
	end

	var_6_0._sequences.WZWipChanged = var_6_98

	local var_6_99
	local var_6_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_11:RegisterAnimationSequence("WZWipNotChanged", var_6_100)

	local function var_6_101()
		var_6_11:AnimateSequence("WZWipNotChanged")
	end

	var_6_0._sequences.WZWipNotChanged = var_6_101

	var_6_0:addEventHandler("button_over", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
		ACTIONS.AnimateSequenceByElement(var_6_0, {
			elementPath = "self.GenericButtonBackground.GenericButtonBackground",
			sequenceName = "ButtonOver",
			elementName = "GenericButtonBackground"
		})
	end)
	var_6_0:addEventHandler("button_up", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUp")
		ACTIONS.AnimateSequenceByElement(var_6_0, {
			elementPath = "self.PrimaryKey",
			sequenceName = "ButtonUp",
			elementName = "PrimaryKey"
		})
		ACTIONS.AnimateSequenceByElement(var_6_0, {
			elementPath = "self.SecondaryKey",
			sequenceName = "ButtonUp",
			elementName = "SecondaryKey"
		})
	end)
	var_6_0:addEventHandler("disable", function(arg_31_0, arg_31_1)
		if not arg_31_1.controller then
			local var_31_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Disabled")
	end)
	var_0_0(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "DefaultSequence")

	return var_6_0
end

MenuBuilder.registerType("GenericKeybindOption", GenericKeybindOption)
LockTable(_M)
