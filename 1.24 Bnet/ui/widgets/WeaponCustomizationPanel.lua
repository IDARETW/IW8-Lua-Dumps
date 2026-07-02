module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if not arg_1_1.unlocked then
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

	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -165
		}
	}

	var_3_4:RegisterAnimationSequence("DefaultSequence", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("DefaultSequence", var_3_22)

	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("DefaultSequence", var_3_23)

	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("DefaultSequence", var_3_24)

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("DefaultSequence", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("DefaultSequence", var_3_26)

	local var_3_27 = {
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

	var_3_18:RegisterAnimationSequence("DefaultSequence", var_3_27)

	local var_3_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("DefaultSequence", var_3_28)

	local function var_3_29()
		var_3_4:AnimateSequence("DefaultSequence")
		var_3_6:AnimateSequence("DefaultSequence")
		var_3_8:AnimateSequence("DefaultSequence")
		var_3_12:AnimateSequence("DefaultSequence")
		var_3_14:AnimateSequence("DefaultSequence")
		var_3_16:AnimateSequence("DefaultSequence")
		var_3_18:AnimateSequence("DefaultSequence")
		var_3_20:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_29

	local var_3_30 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_3_4:RegisterAnimationSequence("Equipped", var_3_30)

	local var_3_31 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Equipped", var_3_31)

	local var_3_32 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Equipped", var_3_32)

	local var_3_33 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Equipped", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Equipped", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Equipped", var_3_35)

	local function var_3_36()
		var_3_4:AnimateSequence("Equipped")
		var_3_6:AnimateSequence("Equipped")
		var_3_12:AnimateSequence("Equipped")
		var_3_14:AnimateSequence("Equipped")
		var_3_16:AnimateSequence("Equipped")
		var_3_20:AnimateSequence("Equipped")
	end

	var_3_0._sequences.Equipped = var_3_36

	local var_3_37 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_3_4:RegisterAnimationSequence("NotEquipped", var_3_37)

	local var_3_38 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("NotEquipped", var_3_38)

	local var_3_39 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("NotEquipped", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("NotEquipped", var_3_40)

	local var_3_41 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("NotEquipped", var_3_41)

	local var_3_42 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("NotEquipped", var_3_42)

	local var_3_43 = {
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

	var_3_18:RegisterAnimationSequence("NotEquipped", var_3_43)

	local var_3_44 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("NotEquipped", var_3_44)

	local function var_3_45()
		var_3_4:AnimateSequence("NotEquipped")
		var_3_6:AnimateSequence("NotEquipped")
		var_3_8:AnimateSequence("NotEquipped")
		var_3_12:AnimateSequence("NotEquipped")
		var_3_14:AnimateSequence("NotEquipped")
		var_3_16:AnimateSequence("NotEquipped")
		var_3_18:AnimateSequence("NotEquipped")
		var_3_20:AnimateSequence("NotEquipped")
	end

	var_3_0._sequences.NotEquipped = var_3_45

	local var_3_46 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_3_4:RegisterAnimationSequence("LockedWithText", var_3_46)

	local var_3_47 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("LockedWithText", var_3_47)

	local var_3_48 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("LockedWithText", var_3_48)

	local var_3_49 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("LockedWithText", var_3_49)

	local var_3_50 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("LockedWithText", var_3_50)

	local var_3_51 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("LockedWithText", var_3_51)

	local var_3_52 = {
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

	var_3_18:RegisterAnimationSequence("LockedWithText", var_3_52)

	local var_3_53 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("LockedWithText", var_3_53)

	local function var_3_54()
		var_3_4:AnimateSequence("LockedWithText")
		var_3_6:AnimateSequence("LockedWithText")
		var_3_8:AnimateSequence("LockedWithText")
		var_3_12:AnimateSequence("LockedWithText")
		var_3_14:AnimateSequence("LockedWithText")
		var_3_16:AnimateSequence("LockedWithText")
		var_3_18:AnimateSequence("LockedWithText")
		var_3_20:AnimateSequence("LockedWithText")
	end

	var_3_0._sequences.LockedWithText = var_3_54

	local var_3_55 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -34
		}
	}

	var_3_4:RegisterAnimationSequence("Locked", var_3_55)

	local var_3_56 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Locked", var_3_56)

	local var_3_57 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_57)

	local var_3_58 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Locked", var_3_58)

	local var_3_59 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Locked", var_3_59)

	local var_3_60 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Locked", var_3_60)

	local var_3_61 = {
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

	var_3_18:RegisterAnimationSequence("Locked", var_3_61)

	local var_3_62 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Locked", var_3_62)

	local function var_3_63()
		var_3_4:AnimateSequence("Locked")
		var_3_6:AnimateSequence("Locked")
		var_3_8:AnimateSequence("Locked")
		var_3_12:AnimateSequence("Locked")
		var_3_14:AnimateSequence("Locked")
		var_3_16:AnimateSequence("Locked")
		var_3_18:AnimateSequence("Locked")
		var_3_20:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_63

	local var_3_64 = {
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

	var_3_14:RegisterAnimationSequence("AR", var_3_64)

	local var_3_65 = {
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

	var_3_16:RegisterAnimationSequence("AR", var_3_65)

	local var_3_66 = {
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

	var_3_20:RegisterAnimationSequence("AR", var_3_66)

	local function var_3_67()
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
		var_3_20:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_67

	local var_3_68 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -165
		}
	}

	var_3_4:RegisterAnimationSequence("EquippedNoChallenge", var_3_68)

	local var_3_69 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("EquippedNoChallenge", var_3_69)

	local var_3_70 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("EquippedNoChallenge", var_3_70)

	local var_3_71 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("EquippedNoChallenge", var_3_71)

	local var_3_72 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("EquippedNoChallenge", var_3_72)

	local var_3_73 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("EquippedNoChallenge", var_3_73)

	local var_3_74 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("EquippedNoChallenge", var_3_74)

	local function var_3_75()
		var_3_4:AnimateSequence("EquippedNoChallenge")
		var_3_6:AnimateSequence("EquippedNoChallenge")
		var_3_8:AnimateSequence("EquippedNoChallenge")
		var_3_12:AnimateSequence("EquippedNoChallenge")
		var_3_14:AnimateSequence("EquippedNoChallenge")
		var_3_16:AnimateSequence("EquippedNoChallenge")
		var_3_20:AnimateSequence("EquippedNoChallenge")
	end

	var_3_0._sequences.EquippedNoChallenge = var_3_75

	local var_3_76 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -165
		}
	}

	var_3_4:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_76)

	local var_3_77 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_77)

	local var_3_78 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_78)

	local var_3_79 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_79)

	local var_3_80 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_80)

	local var_3_81 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_81)

	local var_3_82 = {
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

	var_3_18:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_82)

	local var_3_83 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("NotEquippedNoChallenge", var_3_83)

	local function var_3_84()
		var_3_4:AnimateSequence("NotEquippedNoChallenge")
		var_3_6:AnimateSequence("NotEquippedNoChallenge")
		var_3_8:AnimateSequence("NotEquippedNoChallenge")
		var_3_12:AnimateSequence("NotEquippedNoChallenge")
		var_3_14:AnimateSequence("NotEquippedNoChallenge")
		var_3_16:AnimateSequence("NotEquippedNoChallenge")
		var_3_18:AnimateSequence("NotEquippedNoChallenge")
		var_3_20:AnimateSequence("NotEquippedNoChallenge")
	end

	var_3_0._sequences.NotEquippedNoChallenge = var_3_84

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("WeaponCustomizationPanel", WeaponCustomizationPanel)
LockTable(_M)
