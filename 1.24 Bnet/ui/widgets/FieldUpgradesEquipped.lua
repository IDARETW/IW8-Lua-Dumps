module(..., package.seeall)

local function var_0_0(arg_1_0)
	assert(arg_1_0.PromptSwap)

	return arg_1_0.PromptSwap
end

local function var_0_1(arg_2_0)
	assert(arg_2_0.PromptPro)

	return arg_2_0.PromptPro
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_1.proMode)
	assert(arg_3_1.upgrades)

	if Engine.ECHCFGDDDF() then
		arg_3_0.ImageLeft:setImage(RegisterMaterial(SUPER.GetImage(arg_3_1.upgrades[SUPER.Slot.LEFT].ref)))
	elseif CONDITIONS.IsThirdGameMode() then
		arg_3_0.ImageLeft:setImage(RegisterMaterial(MUNITION.GetRoleImage(arg_3_1.upgrades[SUPER.Slot.LEFT].ref)))
	end

	if arg_3_1.proMode == SUPER.ProMode.ENABLED then
		if Engine.ECHCFGDDDF() then
			arg_3_0.ImageRight:setImage(RegisterMaterial(SUPER.GetImage(arg_3_1.upgrades[SUPER.Slot.RIGHT].ref)))
		elseif CONDITIONS.IsThirdGameMode() then
			arg_3_0.ImageRight:setImage(RegisterMaterial(MUNITION.GetRoleImage(arg_3_1.upgrades[SUPER.Slot.RIGHT].ref)))
		end

		ACTIONS.AnimateSequence(arg_3_0, "ProEnabled")
		arg_3_0.DeselectWarning:SetAlpha((not arg_3_1.upgrades[SUPER.Slot.LEFT].isActive or not arg_3_1.upgrades[SUPER.Slot.RIGHT].isActive) and 1 or 0)
	elseif arg_3_1.proMode == SUPER.ProMode.DISABLED then
		ACTIONS.AnimateSequence(arg_3_0, "ProDisabled")
		arg_3_0.DeselectWarning:SetAlpha(not arg_3_1.upgrades[SUPER.Slot.LEFT].isActive and 1 or 0)
	end

	ACTIONS.AnimateSequence(arg_3_0, arg_3_1.upgrades[SUPER.Slot.LEFT].isActive and "LeftActive" or "LeftInactive")
	ACTIONS.AnimateSequence(arg_3_0, arg_3_1.upgrades[SUPER.Slot.RIGHT].isActive and "RightActive" or "RightInactive")
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.Update = var_0_2
	arg_4_0.GetSwapContainer = var_0_0
	arg_4_0.GetProModeContainer = var_0_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function FieldUpgradesEquipped(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 189 * _1080p, 0, 80 * _1080p)

	var_5_0.id = "FieldUpgradesEquipped"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LeftBacker"

	var_5_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_5_4:SetAlpha(0.5, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 80, _1080p * -40, _1080p * 40)
	var_5_0:addElement(var_5_4)

	var_5_0.LeftBacker = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "RightBacker"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_5_6:SetAlpha(0, 0)
	var_5_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -80, 0, _1080p * -40, _1080p * 40)
	var_5_0:addElement(var_5_6)

	var_5_0.RightBacker = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "LabelEquipped"

	var_5_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -84.5, _1080p * 85.5, _1080p * -26, _1080p * -6)
	var_5_0:addElement(var_5_8)

	var_5_0.LabelEquipped = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "PromptSwap"

	var_5_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)

	if CONDITIONS.AlwaysFalse(var_5_0) then
		var_5_10.Label:setText("Prompt Swap", 0)
	end

	var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 194, _1080p * 122, _1080p * -2, _1080p * -49)
	var_5_0:addElement(var_5_10)

	var_5_0.PromptSwap = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "PromptPro"

	var_5_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)

	if CONDITIONS.AlwaysFalse(var_5_0) then
		var_5_12.Label:setText("Prompt Pro", 0)
	end

	var_5_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 194, _1080p * 122, _1080p * 47, 0)
	var_5_0:addElement(var_5_12)

	var_5_0.PromptPro = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "ImageLeft"

	var_5_14:SetScale(-0.15, 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 8, _1080p * 72, _1080p * -32, _1080p * 32)
	var_5_0:addElement(var_5_14)

	var_5_0.ImageLeft = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "ImageRight"

	var_5_16:SetScale(-0.15, 0)
	var_5_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -72, _1080p * -8, _1080p * -32, _1080p * 32)
	var_5_0:addElement(var_5_16)

	var_5_0.ImageRight = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIStyledText.new()

	var_5_18.id = "LabelLeft"

	var_5_18:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/FIELDUPGRADE_BTN_LEFT_HEADER"), 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Center)
	var_5_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_18:SetStartupDelay(1000)
	var_5_18:SetLineHoldTime(400)
	var_5_18:SetAnimMoveTime(150)
	var_5_18:SetAnimMoveSpeed(50)
	var_5_18:SetEndDelay(1000)
	var_5_18:SetCrossfadeTime(400)
	var_5_18:SetFadeInTime(300)
	var_5_18:SetFadeOutTime(300)
	var_5_18:SetMaxVisibleLines(1)
	var_5_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -13, _1080p * 93, _1080p * 4, _1080p * 24)
	var_5_0:addElement(var_5_18)

	var_5_0.LabelLeft = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "LabelRight"

	var_5_20:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_20:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/FIELDUPGRADE_BTN_RIGHT_HEADER"), 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Center)
	var_5_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_20:SetStartupDelay(1000)
	var_5_20:SetLineHoldTime(400)
	var_5_20:SetAnimMoveTime(150)
	var_5_20:SetAnimMoveSpeed(50)
	var_5_20:SetEndDelay(1000)
	var_5_20:SetCrossfadeTime(400)
	var_5_20:SetFadeInTime(300)
	var_5_20:SetFadeOutTime(300)
	var_5_20:SetMaxVisibleLines(1)
	var_5_20:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -91, _1080p * 15, _1080p * 4, _1080p * 24)
	var_5_0:addElement(var_5_20)

	var_5_0.LabelRight = var_5_20

	local var_5_21
	local var_5_22 = MenuBuilder.BuildRegisteredType("UnlockCriteria", {
		controllerIndex = var_5_1
	})

	var_5_22.id = "LockPromptPro"

	var_5_22:SetAlpha(0, 0)
	var_5_22.UnlockDesc:SetRight(_1080p * 343, 0)
	var_5_22.UnlockDesc:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_5_22.UnlockDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/FIELD_PRO_UNLOCK"), 0)
	var_5_22.UnlockDesc:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 140, _1080p * 482, _1080p * 40, _1080p * 72)
	var_5_0:addElement(var_5_22)

	var_5_0.LockPromptPro = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIStyledText.new()

	var_5_24.id = "DeselectWarning"

	var_5_24:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_24:setText(Engine.CBBHFCGDIC("MENU/UNEQUIPPED_WARNING"), 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_24:SetAlignment(LUI.Alignment.Center)
	var_5_24:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 192, _1080p * -61, _1080p * -41)
	var_5_0:addElement(var_5_24)

	var_5_0.DeselectWarning = var_5_24

	local var_5_25

	if CONDITIONS.IsMagmaGameMode(var_5_0) then
		var_5_25 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_5_1
		})
		var_5_25.id = "BRWarning"

		var_5_25:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 66, _1080p * 130, _1080p * 119, _1080p * 79)
		var_5_0:addElement(var_5_25)

		var_5_0.BRWarning = var_5_25
	end

	local function var_5_26()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_26

	local var_5_27
	local var_5_28 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 80
		}
	}

	var_5_4:RegisterAnimationSequence("ProEnabled", var_5_28)

	local var_5_29 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ProEnabled", var_5_29)

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 122
		}
	}

	var_5_10:RegisterAnimationSequence("ProEnabled", var_5_30)

	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 122
		}
	}

	var_5_12:RegisterAnimationSequence("ProEnabled", var_5_31)

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_5_14:RegisterAnimationSequence("ProEnabled", var_5_32)

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ProEnabled", var_5_33)

	local var_5_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ProEnabled", var_5_34)

	local var_5_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ProEnabled", var_5_35)

	if CONDITIONS.IsMagmaGameMode(var_5_0) then
		local var_5_36 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 108
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 68
			}
		}

		var_5_25:RegisterAnimationSequence("ProEnabled", var_5_36)
	end

	local function var_5_37()
		var_5_4:AnimateSequence("ProEnabled")
		var_5_6:AnimateSequence("ProEnabled")
		var_5_10:AnimateSequence("ProEnabled")
		var_5_12:AnimateSequence("ProEnabled")
		var_5_14:AnimateSequence("ProEnabled")
		var_5_16:AnimateSequence("ProEnabled")
		var_5_18:AnimateSequence("ProEnabled")
		var_5_20:AnimateSequence("ProEnabled")

		if CONDITIONS.IsMagmaGameMode(var_5_0) then
			var_5_25:AnimateSequence("ProEnabled")
		end
	end

	var_5_0._sequences.ProEnabled = var_5_37

	local var_5_38
	local var_5_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 130
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ProDisabled", var_5_39)

	local var_5_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ProDisabled", var_5_40)

	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 238
		}
	}

	var_5_10:RegisterAnimationSequence("ProDisabled", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 238
		}
	}

	var_5_12:RegisterAnimationSequence("ProDisabled", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 122
		}
	}

	var_5_14:RegisterAnimationSequence("ProDisabled", var_5_43)

	local var_5_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 74
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ProDisabled", var_5_44)

	local var_5_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ProDisabled", var_5_45)

	local var_5_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ProDisabled", var_5_46)

	if CONDITIONS.IsMagmaGameMode(var_5_0) then
		local var_5_47 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 89
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 49
			}
		}

		var_5_25:RegisterAnimationSequence("ProDisabled", var_5_47)
	end

	local function var_5_48()
		var_5_4:AnimateSequence("ProDisabled")
		var_5_6:AnimateSequence("ProDisabled")
		var_5_10:AnimateSequence("ProDisabled")
		var_5_12:AnimateSequence("ProDisabled")
		var_5_14:AnimateSequence("ProDisabled")
		var_5_16:AnimateSequence("ProDisabled")
		var_5_18:AnimateSequence("ProDisabled")
		var_5_20:AnimateSequence("ProDisabled")

		if CONDITIONS.IsMagmaGameMode(var_5_0) then
			var_5_25:AnimateSequence("ProDisabled")
		end
	end

	var_5_0._sequences.ProDisabled = var_5_48

	local var_5_49
	local var_5_50 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_14:RegisterAnimationSequence("LeftActive", var_5_50)

	local function var_5_51()
		var_5_14:AnimateSequence("LeftActive")
	end

	var_5_0._sequences.LeftActive = var_5_51

	local var_5_52
	local var_5_53 = {
		{
			value = 4210752,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_14:RegisterAnimationSequence("LeftInactive", var_5_53)

	local function var_5_54()
		var_5_14:AnimateSequence("LeftInactive")
	end

	var_5_0._sequences.LeftInactive = var_5_54

	local var_5_55
	local var_5_56 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_16:RegisterAnimationSequence("RightActive", var_5_56)

	local function var_5_57()
		var_5_16:AnimateSequence("RightActive")
	end

	var_5_0._sequences.RightActive = var_5_57

	local var_5_58
	local var_5_59 = {
		{
			value = 4210752,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_16:RegisterAnimationSequence("RightInactive", var_5_59)

	local function var_5_60()
		var_5_16:AnimateSequence("RightInactive")
	end

	var_5_0._sequences.RightInactive = var_5_60

	local function var_5_61()
		return
	end

	var_5_0._sequences.ProAvailable = var_5_61

	local var_5_62
	local var_5_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.ItemBtn_Disabled
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ProUnavailable", var_5_63)

	local var_5_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain,
			child = var_5_0.LockPromptPro.UnlockDesc
		}
	}

	var_5_22:RegisterAnimationSequence("ProUnavailable", var_5_64)

	local function var_5_65()
		var_5_12:AnimateSequence("ProUnavailable")
		var_5_22:AnimateSequence("ProUnavailable")
	end

	var_5_0._sequences.ProUnavailable = var_5_65

	local var_5_66
	local var_5_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ProHidden", var_5_67)

	local function var_5_68()
		var_5_12:AnimateSequence("ProHidden")
	end

	var_5_0._sequences.ProHidden = var_5_68

	local var_5_69
	local var_5_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -7
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_70)

	local function var_5_71()
		var_5_8:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_71

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("FieldUpgradesEquipped", FieldUpgradesEquipped)
LockTable(_M)
