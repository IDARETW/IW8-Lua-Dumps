module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.isAZombieCamo and not arg_1_1.isDefaultCamo then
		if arg_1_1.equipped then
			ACTIONS.AnimateSequence(arg_1_0, "EquippedZombieCamo")
		else
			ACTIONS.AnimateSequence(arg_1_0, "NotEquippedZombieCamo")
		end

		ACTIONS.AnimateSequence(arg_1_0.UnlockRequirements, "NoProgressAvailableWarzone")
	elseif not arg_1_1.unlocked then
		if arg_1_1.challengeID and #arg_1_1.challengeID > 0 then
			arg_1_0.UnlockRequirements:SetAlpha(1)
			arg_1_0.UnlockRequirements:Setup(arg_1_1)

			if arg_1_1.lockedText and #arg_1_1.lockedText > 0 then
				ACTIONS.AnimateSequence(arg_1_0, "LockedWithText")
				arg_1_0.UnlockText:setText(arg_1_1.lockedText)
			else
				ACTIONS.AnimateSequence(arg_1_0, "Locked")
			end
		else
			arg_1_0.UnlockRequirements:SetAlpha(0)
			arg_1_0.UnlockText:SetAlpha(0)
		end
	elseif arg_1_1.equipped then
		if arg_1_1.challengeID and #arg_1_1.challengeID > 0 then
			arg_1_0.UnlockRequirements:SetAlpha(1)
			arg_1_0.UnlockRequirements:Setup(arg_1_1)
			ACTIONS.AnimateSequence(arg_1_0, "Equipped")
		else
			arg_1_0.UnlockRequirements:SetAlpha(0)
			ACTIONS.AnimateSequence(arg_1_0, "EquippedNoChallenge")
		end
	elseif arg_1_1.challengeID and #arg_1_1.challengeID > 0 then
		arg_1_0.UnlockRequirements:SetAlpha(1)
		arg_1_0.UnlockRequirements:Setup(arg_1_1)
		ACTIONS.AnimateSequence(arg_1_0, "NotEquipped")
	else
		arg_1_0.UnlockRequirements:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_1_0, "NotEquippedNoChallenge")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.EquippedWidget)

	arg_2_0.UpdatePanelInfo = var_0_0

	arg_2_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	if not IsLanguageArabic() then
		arg_2_0.NewItemNotification:SetupLeftAlignment()
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function WeaponCustomizationPanel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 280 * _1080p)

	var_3_0.id = "WeaponCustomizationPanel"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "EquippedWidget"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 164, _1080p * 73, _1080p * 103)
	var_3_0:addElement(var_3_6)

	var_3_0.EquippedWidget = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("UnlockRequirements", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "UnlockRequirements"

	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 114, _1080p * 256)
	var_3_0:addElement(var_3_8)

	var_3_0.UnlockRequirements = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Name"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetStartupDelay(2000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(2000)
	var_3_10:SetAnimMoveSpeed(150)
	var_3_10:SetEndDelay(2000)
	var_3_10:SetCrossfadeTime(250)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -28, _1080p * 12, _1080p * 62)
	var_3_0:addElement(var_3_10)

	var_3_0.Name = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Lock"

	var_3_12:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_3_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 58, _1080p * 68, _1080p * 108)
	var_3_0:addElement(var_3_12)

	var_3_0.Lock = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "LockedText"

	var_3_14:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 63, _1080p * -22, _1080p * 77, _1080p * 105)
	var_3_0:addElement(var_3_14)

	var_3_0.LockedText = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "UnlockText"

	var_3_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 59, _1080p * -22, _1080p * 246, _1080p * 266)
	var_3_0:addElement(var_3_16)

	var_3_0.UnlockText = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "NewItemNotification"

	var_3_18:SetAlpha(0, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 31, _1080p * 109, _1080p * 73, _1080p * 103)
	var_3_0:addElement(var_3_18)

	var_3_0.NewItemNotification = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "InfoIcon"

	var_3_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_20:setImage(RegisterMaterial("hud_info_alert"), 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 52, _1080p * 244, _1080p * 267)
	var_3_0:addElement(var_3_20)

	var_3_0.InfoIcon = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "ToggleHybridPrompt"

	var_3_22:SetAlpha(0, 0)
	var_3_22:setText(Engine.CBBHFCGDIC("LUA_MENU/TOGGLE_HYBRID"), 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_22:SetAlignment(LUI.Alignment.Left)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 364, _1080p * 298, _1080p * 320)
	var_3_0:addElement(var_3_22)

	var_3_0.ToggleHybridPrompt = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -165
		}
	}

	var_3_4:RegisterAnimationSequence("DefaultSequence", var_3_24)

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("DefaultSequence", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("DefaultSequence", var_3_26)

	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("DefaultSequence", var_3_27)

	local var_3_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("DefaultSequence", var_3_28)

	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("DefaultSequence", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 109
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

	var_3_18:RegisterAnimationSequence("DefaultSequence", var_3_30)

	local var_3_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("DefaultSequence", var_3_31)

	local function var_3_32()
		var_3_4:AnimateSequence("DefaultSequence")
		var_3_6:AnimateSequence("DefaultSequence")
		var_3_8:AnimateSequence("DefaultSequence")
		var_3_12:AnimateSequence("DefaultSequence")
		var_3_14:AnimateSequence("DefaultSequence")
		var_3_16:AnimateSequence("DefaultSequence")
		var_3_18:AnimateSequence("DefaultSequence")
		var_3_20:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_3_4:RegisterAnimationSequence("Equipped", var_3_34)

	local var_3_35 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Equipped", var_3_35)

	local var_3_36 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Equipped", var_3_36)

	local var_3_37 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Equipped", var_3_37)

	local var_3_38 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Equipped", var_3_38)

	local var_3_39 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Equipped", var_3_39)

	local var_3_40 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 280
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302
		}
	}

	var_3_22:RegisterAnimationSequence("Equipped", var_3_40)

	local function var_3_41()
		var_3_4:AnimateSequence("Equipped")
		var_3_6:AnimateSequence("Equipped")
		var_3_12:AnimateSequence("Equipped")
		var_3_14:AnimateSequence("Equipped")
		var_3_16:AnimateSequence("Equipped")
		var_3_20:AnimateSequence("Equipped")
		var_3_22:AnimateSequence("Equipped")
	end

	var_3_0._sequences.Equipped = var_3_41

	local var_3_42
	local var_3_43 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_3_4:RegisterAnimationSequence("NotEquipped", var_3_43)

	local var_3_44 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("NotEquipped", var_3_44)

	local var_3_45 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("NotEquipped", var_3_45)

	local var_3_46 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("NotEquipped", var_3_46)

	local var_3_47 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("NotEquipped", var_3_47)

	local var_3_48 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("NotEquipped", var_3_48)

	local var_3_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 109
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

	var_3_18:RegisterAnimationSequence("NotEquipped", var_3_49)

	local var_3_50 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("NotEquipped", var_3_50)

	local var_3_51 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 270
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 292
		}
	}

	var_3_22:RegisterAnimationSequence("NotEquipped", var_3_51)

	local function var_3_52()
		var_3_4:AnimateSequence("NotEquipped")
		var_3_6:AnimateSequence("NotEquipped")
		var_3_8:AnimateSequence("NotEquipped")
		var_3_12:AnimateSequence("NotEquipped")
		var_3_14:AnimateSequence("NotEquipped")
		var_3_16:AnimateSequence("NotEquipped")
		var_3_18:AnimateSequence("NotEquipped")
		var_3_20:AnimateSequence("NotEquipped")
		var_3_22:AnimateSequence("NotEquipped")
	end

	var_3_0._sequences.NotEquipped = var_3_52

	local var_3_53
	local var_3_54 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_3_4:RegisterAnimationSequence("LockedWithText", var_3_54)

	local var_3_55 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("LockedWithText", var_3_55)

	local var_3_56 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("LockedWithText", var_3_56)

	local var_3_57 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("LockedWithText", var_3_57)

	local var_3_58 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("LockedWithText", var_3_58)

	local var_3_59 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("LockedWithText", var_3_59)

	local var_3_60 = {
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
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("LockedWithText", var_3_60)

	local var_3_61 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("LockedWithText", var_3_61)

	local var_3_62 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 312
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 334
		}
	}

	var_3_22:RegisterAnimationSequence("LockedWithText", var_3_62)

	local function var_3_63()
		var_3_4:AnimateSequence("LockedWithText")
		var_3_6:AnimateSequence("LockedWithText")
		var_3_8:AnimateSequence("LockedWithText")
		var_3_12:AnimateSequence("LockedWithText")
		var_3_14:AnimateSequence("LockedWithText")
		var_3_16:AnimateSequence("LockedWithText")
		var_3_18:AnimateSequence("LockedWithText")
		var_3_20:AnimateSequence("LockedWithText")
		var_3_22:AnimateSequence("LockedWithText")
	end

	var_3_0._sequences.LockedWithText = var_3_63

	local var_3_64
	local var_3_65 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -34
		}
	}

	var_3_4:RegisterAnimationSequence("Locked", var_3_65)

	local var_3_66 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Locked", var_3_66)

	local var_3_67 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_67)

	local var_3_68 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Locked", var_3_68)

	local var_3_69 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Locked", var_3_69)

	local var_3_70 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Locked", var_3_70)

	local var_3_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Locked", var_3_71)

	local var_3_72 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Locked", var_3_72)

	local var_3_73 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 266
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 288
		}
	}

	var_3_22:RegisterAnimationSequence("Locked", var_3_73)

	local function var_3_74()
		var_3_4:AnimateSequence("Locked")
		var_3_6:AnimateSequence("Locked")
		var_3_8:AnimateSequence("Locked")
		var_3_12:AnimateSequence("Locked")
		var_3_14:AnimateSequence("Locked")
		var_3_16:AnimateSequence("Locked")
		var_3_18:AnimateSequence("Locked")
		var_3_20:AnimateSequence("Locked")
		var_3_22:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_74

	local var_3_75
	local var_3_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 76
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_76)

	local var_3_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 270
		}
	}

	var_3_16:RegisterAnimationSequence("AR", var_3_77)

	local var_3_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -23
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
			value = _1080p * 246
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 269
		}
	}

	var_3_20:RegisterAnimationSequence("AR", var_3_78)

	local function var_3_79()
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
		var_3_20:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_79

	local var_3_80
	local var_3_81 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -165
		}
	}

	var_3_4:RegisterAnimationSequence("EquippedNoChallenge", var_3_81)

	local var_3_82 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("EquippedNoChallenge", var_3_82)

	local var_3_83 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("EquippedNoChallenge", var_3_83)

	local var_3_84 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("EquippedNoChallenge", var_3_84)

	local var_3_85 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("EquippedNoChallenge", var_3_85)

	local var_3_86 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("EquippedNoChallenge", var_3_86)

	local var_3_87 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("EquippedNoChallenge", var_3_87)

	local var_3_88 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 133
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 155
		}
	}

	var_3_22:RegisterAnimationSequence("EquippedNoChallenge", var_3_88)

	local function var_3_89()
		var_3_4:AnimateSequence("EquippedNoChallenge")
		var_3_6:AnimateSequence("EquippedNoChallenge")
		var_3_8:AnimateSequence("EquippedNoChallenge")
		var_3_12:AnimateSequence("EquippedNoChallenge")
		var_3_14:AnimateSequence("EquippedNoChallenge")
		var_3_16:AnimateSequence("EquippedNoChallenge")
		var_3_20:AnimateSequence("EquippedNoChallenge")
		var_3_22:AnimateSequence("EquippedNoChallenge")
	end

	var_3_0._sequences.EquippedNoChallenge = var_3_89

	local var_3_90
	local var_3_91 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -165
		}
	}

	var_3_4:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_91)

	local var_3_92 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_92)

	local var_3_93 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_93)

	local var_3_94 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_94)

	local var_3_95 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_95)

	local var_3_96 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_96)

	local var_3_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 109
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

	var_3_18:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_97)

	local var_3_98 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_98)

	local var_3_99 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 132
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		}
	}

	var_3_22:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_99)

	local function var_3_100()
		var_3_4:AnimateSequence("NotEquippedNoChallenge")
		var_3_6:AnimateSequence("NotEquippedNoChallenge")
		var_3_8:AnimateSequence("NotEquippedNoChallenge")
		var_3_12:AnimateSequence("NotEquippedNoChallenge")
		var_3_14:AnimateSequence("NotEquippedNoChallenge")
		var_3_16:AnimateSequence("NotEquippedNoChallenge")
		var_3_18:AnimateSequence("NotEquippedNoChallenge")
		var_3_20:AnimateSequence("NotEquippedNoChallenge")
		var_3_22:AnimateSequence("NotEquippedNoChallenge")
	end

	var_3_0._sequences.NotEquippedNoChallenge = var_3_100

	local var_3_101
	local var_3_102 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -70
		}
	}

	var_3_4:RegisterAnimationSequence("NotEquippedZombieCamo", var_3_102)

	local var_3_103 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("NotEquippedZombieCamo", var_3_103)

	local var_3_104 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("NotEquippedZombieCamo", var_3_104)

	local var_3_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 176
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 196
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_ACTOR/PROGRESS_UNAVAILABLE_DISCLAIMER")
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("NotEquippedZombieCamo", var_3_105)

	local var_3_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 109
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_3_18:RegisterAnimationSequence("NotEquippedZombieCamo", var_3_106)

	local var_3_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 196
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("NotEquippedZombieCamo", var_3_107)

	local var_3_108 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 312
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 334
		}
	}

	var_3_22:RegisterAnimationSequence("NotEquippedZombieCamo", var_3_108)

	local function var_3_109()
		var_3_4:AnimateSequence("NotEquippedZombieCamo")
		var_3_6:AnimateSequence("NotEquippedZombieCamo")
		var_3_8:AnimateSequence("NotEquippedZombieCamo")
		var_3_16:AnimateSequence("NotEquippedZombieCamo")
		var_3_18:AnimateSequence("NotEquippedZombieCamo")
		var_3_20:AnimateSequence("NotEquippedZombieCamo")
		var_3_22:AnimateSequence("NotEquippedZombieCamo")
	end

	var_3_0._sequences.NotEquippedZombieCamo = var_3_109

	local var_3_110
	local var_3_111 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -70
		}
	}

	var_3_4:RegisterAnimationSequence("EquippedZombieCamo", var_3_111)

	local var_3_112 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("EquippedZombieCamo", var_3_112)

	local var_3_113 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("EquippedZombieCamo", var_3_113)

	local var_3_114 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("EquippedZombieCamo", var_3_114)

	local var_3_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 176
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 196
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_ACTOR/PROGRESS_UNAVAILABLE_DISCLAIMER")
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("EquippedZombieCamo", var_3_115)

	local var_3_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 196
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("EquippedZombieCamo", var_3_116)

	local var_3_117 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 312
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 334
		}
	}

	var_3_22:RegisterAnimationSequence("EquippedZombieCamo", var_3_117)

	local function var_3_118()
		var_3_4:AnimateSequence("EquippedZombieCamo")
		var_3_6:AnimateSequence("EquippedZombieCamo")
		var_3_8:AnimateSequence("EquippedZombieCamo")
		var_3_12:AnimateSequence("EquippedZombieCamo")
		var_3_16:AnimateSequence("EquippedZombieCamo")
		var_3_20:AnimateSequence("EquippedZombieCamo")
		var_3_22:AnimateSequence("EquippedZombieCamo")
	end

	var_3_0._sequences.EquippedZombieCamo = var_3_118

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("WeaponCustomizationPanel", WeaponCustomizationPanel)
LockTable(_M)
