module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._isSelected = arg_1_1

	assert(arg_1_0.Selected)
	ACTIONS.AnimateSequence(arg_1_0.Selected, arg_1_1 and "On" or "Off")

	if arg_1_1 then
		arg_1_0.NewItemNotification:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetSelected = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function WeaponButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 410 * _1080p, 0, 140 * _1080p)

	var_3_0.id = "WeaponButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "LoadoutItemButtonBackground"

	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_3_0:addElement(var_3_4)

	var_3_0.LoadoutItemButtonBackground = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "BlueprintIndicator"

	var_3_6:SetAlpha(0, 0)
	var_3_6:setImage(RegisterMaterial("perk_icon_bling"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 48, _1080p * 44, _1080p * 68)
	var_3_0:addElement(var_3_6)

	var_3_0.BlueprintIndicator = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Selected"

	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -26, _1080p * -10, _1080p * 10, _1080p * 26)
	var_3_0:addElement(var_3_8)

	var_3_0.Selected = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Text"

	var_3_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_10:setText(ToUpperCase(""), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetStartupDelay(2000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(300)
	var_3_10:SetAnimMoveSpeed(50)
	var_3_10:SetEndDelay(1500)
	var_3_10:SetCrossfadeTime(750)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetOutlineRGBFromInt(0, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 250, _1080p * 13, _1080p * 41)
	var_3_0:addElement(var_3_10)

	var_3_0.Text = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "WeaponIcon"

	var_3_12:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -74, _1080p * 74, _1080p * 38, _1080p * 112)
	var_3_0:addElement(var_3_12)

	var_3_0.WeaponIcon = var_3_12

	local var_3_13

	if not CONDITIONS.AreCDLRulesActive(var_3_1) then
		var_3_13 = LUI.UIImage.new()
		var_3_13.id = "Lock"

		var_3_13:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
		var_3_13:SetAlpha(0, 0)
		var_3_13:SetColorOp(COLOR_OP.saturation, 0)
		var_3_13:setImage(RegisterMaterial("icon_lock"), 0)
		var_3_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -28, _1080p * -8, _1080p * 8, _1080p * 28)
		var_3_0:addElement(var_3_13)

		var_3_0.Lock = var_3_13
	end

	local var_3_14

	if CONDITIONS.InFrontend(var_3_0) then
		var_3_14 = MenuBuilder.BuildRegisteredType("WeaponLevelBar", {
			controllerIndex = var_3_1
		})
		var_3_14.id = "WeaponLevelBar"

		var_3_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_3_14:SetAlpha(0.3, 0)
		var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 118, _1080p * 126)
		var_3_0:addElement(var_3_14)

		var_3_0.WeaponLevelBar = var_3_14
	end

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "WeaponLevel"

	var_3_16:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_3_16:SetAlpha(0.8, 0)
	var_3_16:setText(ToUpperCase(""), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_16:SetStartupDelay(2000)
	var_3_16:SetLineHoldTime(400)
	var_3_16:SetAnimMoveTime(300)
	var_3_16:SetAnimMoveSpeed(50)
	var_3_16:SetEndDelay(1500)
	var_3_16:SetCrossfadeTime(750)
	var_3_16:SetFadeInTime(300)
	var_3_16:SetFadeOutTime(300)
	var_3_16:SetMaxVisibleLines(1)
	var_3_16:SetOutlineRGBFromInt(0, 0)
	var_3_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 97, _1080p * 115)
	var_3_0:addElement(var_3_16)

	var_3_0.WeaponLevel = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "ClassName"

	var_3_18:SetRGBFromInt(8421504, 0)
	var_3_18:SetAlpha(0.6, 0)
	var_3_18:setText("", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_18:SetStartupDelay(2000)
	var_3_18:SetLineHoldTime(400)
	var_3_18:SetAnimMoveTime(300)
	var_3_18:SetAnimMoveSpeed(50)
	var_3_18:SetEndDelay(1500)
	var_3_18:SetCrossfadeTime(750)
	var_3_18:SetFadeInTime(300)
	var_3_18:SetFadeOutTime(300)
	var_3_18:SetMaxVisibleLines(1)
	var_3_18:SetOutlineRGBFromInt(0, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 407, _1080p * -21, _1080p * 3)
	var_3_0:addElement(var_3_18)

	var_3_0.ClassName = var_3_18

	local var_3_19

	if CONDITIONS.IsWaveGameType(var_3_0) then
		var_3_19 = LUI.UIStyledText.new()
		var_3_19.id = "CPWaveSurvivalCost"

		var_3_19:SetRGBFromInt(8421504, 0)
		var_3_19:SetAlpha(0.6, 0)
		var_3_19:setText("", 0)
		var_3_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_3_19:SetAlignment(LUI.Alignment.Right)
		var_3_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_3_19:SetStartupDelay(2000)
		var_3_19:SetLineHoldTime(400)
		var_3_19:SetAnimMoveTime(300)
		var_3_19:SetAnimMoveSpeed(50)
		var_3_19:SetEndDelay(1500)
		var_3_19:SetCrossfadeTime(750)
		var_3_19:SetFadeInTime(300)
		var_3_19:SetFadeOutTime(300)
		var_3_19:SetMaxVisibleLines(1)
		var_3_19:SetOutlineRGBFromInt(0, 0)
		var_3_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 258, _1080p * 386, _1080p * 63, _1080p * 87)
		var_3_0:addElement(var_3_19)

		var_3_0.CPWaveSurvivalCost = var_3_19
	end

	local var_3_20
	local var_3_21 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_3_1
	})

	var_3_21.id = "NewItemNotification"

	var_3_21:SetAlpha(0, 0)
	var_3_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -22, _1080p * -14, _1080p * 14, _1080p * 22)
	var_3_0:addElement(var_3_21)

	var_3_0.NewItemNotification = var_3_21

	local var_3_22
	local var_3_23 = LUI.UIImage.new()

	var_3_23.id = "RestrictionWarning"

	var_3_23:SetAlpha(0, 0)
	var_3_23:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_3_23:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -35, _1080p * -5, _1080p * 5, _1080p * 35)
	var_3_0:addElement(var_3_23)

	var_3_0.RestrictionWarning = var_3_23

	local var_3_24

	if CONDITIONS.IsWaveGameType(var_3_0) then
		local var_3_25 = MenuBuilder.BuildRegisteredType("MiniAttachments", {
			controllerIndex = var_3_1
		})

		var_3_25.id = "MiniAttachments"

		var_3_25:SetAlpha(0, 0)
		var_3_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 258, _1080p * 356, _1080p * 9, _1080p * 25)
		var_3_0:addElement(var_3_25)

		var_3_0.MiniAttachments = var_3_25
	end

	local var_3_26
	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_3_10:RegisterAnimationSequence("DefaultSequence", var_3_27)

	local function var_3_28()
		var_3_10:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_28

	local var_3_29
	local var_3_30 = {
		{
			value = 3355443,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOver", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonOver", var_3_31)

	local var_3_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonOver", var_3_32)

	if not CONDITIONS.AreCDLRulesActive(var_3_1) then
		local var_3_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_13:RegisterAnimationSequence("ButtonOver", var_3_33)
	end

	local var_3_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ButtonOver", var_3_34)

	local function var_3_35()
		var_3_6:AnimateSequence("ButtonOver")
		var_3_10:AnimateSequence("ButtonOver")
		var_3_12:AnimateSequence("ButtonOver")

		if not CONDITIONS.AreCDLRulesActive(var_3_1) then
			var_3_13:AnimateSequence("ButtonOver")
		end

		var_3_18:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_35

	local var_3_36
	local var_3_37 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUp", var_3_37)

	local var_3_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonUp", var_3_38)

	local var_3_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonUp", var_3_39)

	if not CONDITIONS.AreCDLRulesActive(var_3_1) then
		local var_3_40 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_13:RegisterAnimationSequence("ButtonUp", var_3_40)
	end

	local var_3_41 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ButtonUp", var_3_41)

	local function var_3_42()
		var_3_6:AnimateSequence("ButtonUp")
		var_3_10:AnimateSequence("ButtonUp")
		var_3_12:AnimateSequence("ButtonUp")

		if not CONDITIONS.AreCDLRulesActive(var_3_1) then
			var_3_13:AnimateSequence("ButtonUp")
		end

		var_3_18:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_42

	local var_3_43
	local var_3_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_44)

	local var_3_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_10:RegisterAnimationSequence("Locked", var_3_45)

	local var_3_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_3_12:RegisterAnimationSequence("Locked", var_3_46)

	if not CONDITIONS.AreCDLRulesActive(var_3_1) then
		local var_3_47 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_13:RegisterAnimationSequence("Locked", var_3_47)
	end

	if CONDITIONS.InFrontend(var_3_0) then
		local var_3_48 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_14:RegisterAnimationSequence("Locked", var_3_48)
	end

	local var_3_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Locked", var_3_49)

	if CONDITIONS.IsWaveGameType(var_3_0) then
		local var_3_50 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_19:RegisterAnimationSequence("Locked", var_3_50)
	end

	local function var_3_51()
		var_3_8:AnimateSequence("Locked")
		var_3_10:AnimateSequence("Locked")
		var_3_12:AnimateSequence("Locked")

		if not CONDITIONS.AreCDLRulesActive(var_3_1) then
			var_3_13:AnimateSequence("Locked")
		end

		if CONDITIONS.InFrontend(var_3_0) then
			var_3_14:AnimateSequence("Locked")
		end

		var_3_16:AnimateSequence("Locked")

		if CONDITIONS.IsWaveGameType(var_3_0) then
			var_3_19:AnimateSequence("Locked")
		end
	end

	var_3_0._sequences.Locked = var_3_51

	local var_3_52
	local var_3_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 31
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

	var_3_8:RegisterAnimationSequence("AR", var_3_53)

	local var_3_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
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
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -367
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_54)

	if not CONDITIONS.AreCDLRulesActive(var_3_1) then
		local var_3_55 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -401
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -381
			}
		}

		var_3_13:RegisterAnimationSequence("AR", var_3_55)
	end

	local var_3_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		}
	}

	var_3_18:RegisterAnimationSequence("AR", var_3_56)

	local function var_3_57()
		var_3_8:AnimateSequence("AR")
		var_3_10:AnimateSequence("AR")

		if not CONDITIONS.AreCDLRulesActive(var_3_1) then
			var_3_13:AnimateSequence("AR")
		end

		var_3_18:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_57

	local var_3_58
	local var_3_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonUpDisabled", var_3_59)

	local var_3_60 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonUpDisabled", var_3_60)

	if not CONDITIONS.AreCDLRulesActive(var_3_1) then
		local var_3_61 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_13:RegisterAnimationSequence("ButtonUpDisabled", var_3_61)
	end

	if CONDITIONS.InFrontend(var_3_0) then
		local var_3_62 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_14:RegisterAnimationSequence("ButtonUpDisabled", var_3_62)
	end

	local var_3_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ButtonUpDisabled", var_3_63)

	local var_3_64 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 407
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.subPopupText
		}
	}

	var_3_18:RegisterAnimationSequence("ButtonUpDisabled", var_3_64)

	if CONDITIONS.IsWaveGameType(var_3_0) then
		local var_3_65 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_19:RegisterAnimationSequence("ButtonUpDisabled", var_3_65)
	end

	local function var_3_66()
		var_3_10:AnimateSequence("ButtonUpDisabled")
		var_3_12:AnimateSequence("ButtonUpDisabled")

		if not CONDITIONS.AreCDLRulesActive(var_3_1) then
			var_3_13:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.InFrontend(var_3_0) then
			var_3_14:AnimateSequence("ButtonUpDisabled")
		end

		var_3_16:AnimateSequence("ButtonUpDisabled")
		var_3_18:AnimateSequence("ButtonUpDisabled")

		if CONDITIONS.IsWaveGameType(var_3_0) then
			var_3_19:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_3_0._sequences.ButtonUpDisabled = var_3_66

	local var_3_67
	local var_3_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonOverDisabled", var_3_68)

	local var_3_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonOverDisabled", var_3_69)

	if not CONDITIONS.AreCDLRulesActive(var_3_1) then
		local var_3_70 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_13:RegisterAnimationSequence("ButtonOverDisabled", var_3_70)
	end

	if CONDITIONS.InFrontend(var_3_0) then
		local var_3_71 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_14:RegisterAnimationSequence("ButtonOverDisabled", var_3_71)
	end

	local var_3_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ButtonOverDisabled", var_3_72)

	local var_3_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ButtonOverDisabled", var_3_73)

	if CONDITIONS.IsWaveGameType(var_3_0) then
		local var_3_74 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_19:RegisterAnimationSequence("ButtonOverDisabled", var_3_74)
	end

	local function var_3_75()
		var_3_10:AnimateSequence("ButtonOverDisabled")
		var_3_12:AnimateSequence("ButtonOverDisabled")

		if not CONDITIONS.AreCDLRulesActive(var_3_1) then
			var_3_13:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.InFrontend(var_3_0) then
			var_3_14:AnimateSequence("ButtonOverDisabled")
		end

		var_3_16:AnimateSequence("ButtonOverDisabled")
		var_3_18:AnimateSequence("ButtonOverDisabled")

		if CONDITIONS.IsWaveGameType(var_3_0) then
			var_3_19:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_3_0._sequences.ButtonOverDisabled = var_3_75

	local var_3_76

	if CONDITIONS.InFrontend(var_3_0) then
		local var_3_77 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_14:RegisterAnimationSequence("ProgressBarOver", var_3_77)
	end

	local var_3_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_3_16:RegisterAnimationSequence("ProgressBarOver", var_3_78)

	local function var_3_79()
		if CONDITIONS.InFrontend(var_3_0) then
			var_3_14:AnimateSequence("ProgressBarOver")
		end

		var_3_16:AnimateSequence("ProgressBarOver")
	end

	var_3_0._sequences.ProgressBarOver = var_3_79

	local var_3_80

	if CONDITIONS.InFrontend(var_3_0) then
		local var_3_81 = {
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_14:RegisterAnimationSequence("ProgressBarUp", var_3_81)
	end

	local var_3_82 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_3_16:RegisterAnimationSequence("ProgressBarUp", var_3_82)

	local function var_3_83()
		if CONDITIONS.InFrontend(var_3_0) then
			var_3_14:AnimateSequence("ProgressBarUp")
		end

		var_3_16:AnimateSequence("ProgressBarUp")
	end

	var_3_0._sequences.ProgressBarUp = var_3_83

	local var_3_84

	if CONDITIONS.InFrontend(var_3_0) then
		local var_3_85 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_14:RegisterAnimationSequence("HideProgressBar", var_3_85)
	end

	local var_3_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("HideProgressBar", var_3_86)

	local function var_3_87()
		if CONDITIONS.InFrontend(var_3_0) then
			var_3_14:AnimateSequence("HideProgressBar")
		end

		var_3_16:AnimateSequence("HideProgressBar")
	end

	var_3_0._sequences.HideProgressBar = var_3_87

	local var_3_88
	local var_3_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_3_8:RegisterAnimationSequence("ShowRestriction", var_3_89)

	local var_3_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		}
	}

	var_3_23:RegisterAnimationSequence("ShowRestriction", var_3_90)

	local function var_3_91()
		var_3_8:AnimateSequence("ShowRestriction")
		var_3_23:AnimateSequence("ShowRestriction")
	end

	var_3_0._sequences.ShowRestriction = var_3_91

	local var_3_92
	local var_3_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_3_8:RegisterAnimationSequence("HideRestriction", var_3_93)

	local var_3_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("HideRestriction", var_3_94)

	local function var_3_95()
		var_3_8:AnimateSequence("HideRestriction")
		var_3_23:AnimateSequence("HideRestriction")
	end

	var_3_0._sequences.HideRestriction = var_3_95

	var_3_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
		ACTIONS.AnimateSequence(var_3_0, "ProgressBarOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
		ACTIONS.AnimateSequence(var_3_0, "ProgressBarUp")
	end)
	var_3_0:addEventHandler("disable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "Locked")
	end)
	var_3_0:addEventHandler("button_over_disable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOverDisabled")
		ACTIONS.AnimateSequence(var_3_0, "HideProgressBar")
	end)
	var_3_0:addEventHandler("button_disable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUpDisabled")
		ACTIONS.AnimateSequence(var_3_0, "HideProgressBar")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("WeaponButton", WeaponButton)
LockTable(_M)
