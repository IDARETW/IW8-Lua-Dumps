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

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonOver", {
			conditionOverride = CONDITIONS.UsingWZLoadouts()
		})
		ACTIONS.AnimateSequence(arg_3_0, "ProgressBarOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonUp", {
			conditionOverride = CONDITIONS.UsingWZLoadouts()
		})
		ACTIONS.AnimateSequence(arg_4_0, "ProgressBarUp")
	end)
	arg_2_0:addEventHandler("disable", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_5_0, "Locked")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled"), CONDITIONS.UsingWZLoadouts())
		ACTIONS.AnimateSequence(arg_6_0, "HideProgressBar")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled"), CONDITIONS.UsingWZLoadouts())
		ACTIONS.AnimateSequence(arg_7_0, "HideProgressBar")
	end)
	THEMES.ApplyRandomMaskRotation(arg_2_0, {
		elementToMask = arg_2_0.LoadoutItemButtonBackground
	})

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function WeaponButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 410 * _1080p, 0, 140 * _1080p)

	var_8_0.id = "WeaponButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "LoadoutItemButtonBackground"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_8_0:addElement(var_8_4)

	var_8_0.LoadoutItemButtonBackground = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "BlueprintIndicator"

	var_8_6:SetAlpha(0, 0)
	var_8_6:setImage(RegisterMaterial("perk_icon_bling"), 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 48, _1080p * 44, _1080p * 68)
	var_8_0:addElement(var_8_6)

	var_8_0.BlueprintIndicator = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "Selected"

	var_8_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -26, _1080p * -10, _1080p * 20, _1080p * 36)
	var_8_0:addElement(var_8_8)

	var_8_0.Selected = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIStyledText.new()

	var_8_10.id = "Text"

	var_8_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_10:setText(ToUpperCase(""), 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_10:SetStartupDelay(2000)
	var_8_10:SetLineHoldTime(400)
	var_8_10:SetAnimMoveTime(300)
	var_8_10:SetAnimMoveSpeed(50)
	var_8_10:SetEndDelay(1500)
	var_8_10:SetCrossfadeTime(750)
	var_8_10:SetFadeInTime(300)
	var_8_10:SetFadeOutTime(300)
	var_8_10:SetMaxVisibleLines(1)
	var_8_10:SetOutlineRGBFromInt(0, 0)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 250, _1080p * 13, _1080p * 41)
	var_8_0:addElement(var_8_10)

	var_8_0.Text = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "WeaponIcon"

	var_8_12:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -74, _1080p * 74, _1080p * 38, _1080p * 112)
	var_8_0:addElement(var_8_12)

	var_8_0.WeaponIcon = var_8_12

	local var_8_13

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		var_8_13 = LUI.UIImage.new()
		var_8_13.id = "Lock"

		var_8_13:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
		var_8_13:SetAlpha(0, 0)
		var_8_13:SetColorOp(COLOR_OP.saturation, 0)
		var_8_13:setImage(RegisterMaterial("icon_lock"), 0)
		var_8_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -28, _1080p * -8, _1080p * 8, _1080p * 28)
		var_8_0:addElement(var_8_13)

		var_8_0.Lock = var_8_13
	end

	local var_8_14

	if CONDITIONS.InFrontend() then
		var_8_14 = MenuBuilder.BuildRegisteredType("WeaponLevelBar", {
			controllerIndex = var_8_1
		})
		var_8_14.id = "WeaponLevelBar"

		var_8_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_8_14:SetAlpha(0.3, 0)
		var_8_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 118, _1080p * 126)
		var_8_0:addElement(var_8_14)

		var_8_0.WeaponLevelBar = var_8_14
	end

	local var_8_15
	local var_8_16 = LUI.UIStyledText.new()

	var_8_16.id = "WeaponLevel"

	var_8_16:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_8_16:SetAlpha(0.8, 0)
	var_8_16:setText(ToUpperCase(""), 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_16:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_16:SetStartupDelay(2000)
	var_8_16:SetLineHoldTime(400)
	var_8_16:SetAnimMoveTime(300)
	var_8_16:SetAnimMoveSpeed(50)
	var_8_16:SetEndDelay(1500)
	var_8_16:SetCrossfadeTime(750)
	var_8_16:SetFadeInTime(300)
	var_8_16:SetFadeOutTime(300)
	var_8_16:SetMaxVisibleLines(1)
	var_8_16:SetOutlineRGBFromInt(0, 0)
	var_8_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 26, _1080p * -22, _1080p * 96, _1080p * 114)
	var_8_0:addElement(var_8_16)

	var_8_0.WeaponLevel = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIStyledText.new()

	var_8_18.id = "ClassName"

	var_8_18:SetRGBFromInt(8421504, 0)
	var_8_18:SetAlpha(0.6, 0)
	var_8_18:setText("", 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_18:SetAlignment(LUI.Alignment.Left)
	var_8_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_18:SetStartupDelay(2000)
	var_8_18:SetLineHoldTime(400)
	var_8_18:SetAnimMoveTime(300)
	var_8_18:SetAnimMoveSpeed(50)
	var_8_18:SetEndDelay(1500)
	var_8_18:SetCrossfadeTime(750)
	var_8_18:SetFadeInTime(300)
	var_8_18:SetFadeOutTime(300)
	var_8_18:SetMaxVisibleLines(1)
	var_8_18:SetOutlineRGBFromInt(0, 0)
	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 407, _1080p * -21, _1080p * 3)
	var_8_0:addElement(var_8_18)

	var_8_0.ClassName = var_8_18

	local var_8_19

	if CONDITIONS.IsWaveGameType() then
		var_8_19 = LUI.UIStyledText.new()
		var_8_19.id = "CPWaveSurvivalCost"

		var_8_19:SetRGBFromInt(8421504, 0)
		var_8_19:SetAlpha(0.6, 0)
		var_8_19:setText("", 0)
		var_8_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_8_19:SetAlignment(LUI.Alignment.Right)
		var_8_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_8_19:SetStartupDelay(2000)
		var_8_19:SetLineHoldTime(400)
		var_8_19:SetAnimMoveTime(300)
		var_8_19:SetAnimMoveSpeed(50)
		var_8_19:SetEndDelay(1500)
		var_8_19:SetCrossfadeTime(750)
		var_8_19:SetFadeInTime(300)
		var_8_19:SetFadeOutTime(300)
		var_8_19:SetMaxVisibleLines(1)
		var_8_19:SetOutlineRGBFromInt(0, 0)
		var_8_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 258, _1080p * 386, _1080p * 63, _1080p * 87)
		var_8_0:addElement(var_8_19)

		var_8_0.CPWaveSurvivalCost = var_8_19
	end

	local var_8_20
	local var_8_21 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_8_1
	})

	var_8_21.id = "NewItemNotification"

	var_8_21:SetAlpha(0, 0)
	var_8_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -22, _1080p * -14, _1080p * 14, _1080p * 22)
	var_8_0:addElement(var_8_21)

	var_8_0.NewItemNotification = var_8_21

	local var_8_22
	local var_8_23 = LUI.UIImage.new()

	var_8_23.id = "RestrictionWarning"

	var_8_23:SetAlpha(0, 0)
	var_8_23:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_8_23:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -35, _1080p * -5, _1080p * 5, _1080p * 35)
	var_8_0:addElement(var_8_23)

	var_8_0.RestrictionWarning = var_8_23

	local var_8_24

	if CONDITIONS.IsWaveGameType() then
		local var_8_25 = MenuBuilder.BuildRegisteredType("MiniAttachments", {
			controllerIndex = var_8_1
		})

		var_8_25.id = "MiniAttachments"

		var_8_25:SetAlpha(0, 0)
		var_8_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 258, _1080p * 356, _1080p * 9, _1080p * 25)
		var_8_0:addElement(var_8_25)

		var_8_0.MiniAttachments = var_8_25
	end

	local var_8_26

	if CONDITIONS.IsVanguardRevealed() then
		local var_8_27 = LUI.UIImage.new()

		var_8_27.id = "Mask"

		var_8_27:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
		var_8_27:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 3, _1080p * -3)
		var_8_0:addElement(var_8_27)

		var_8_0.Mask = var_8_27
	end

	local var_8_28
	local var_8_29 = MenuBuilder.BuildRegisteredType("WZWeaponButtonSnipeIcon", {
		controllerIndex = var_8_1
	})

	var_8_29.id = "SnipeIcon"

	var_8_29:SetScale(-0.64, 0)
	var_8_29:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -158, _1080p * 22, _1080p * -20, _1080p * 76)
	var_8_0:addElement(var_8_29)

	var_8_0.SnipeIcon = var_8_29

	local var_8_30
	local var_8_31 = LUI.UIText.new()

	var_8_31.id = "Recommended"

	var_8_31:SetRGBFromTable(SWATCHES.genericMenu.newIndicator, 0)
	var_8_31:SetAlpha(0, 0)
	var_8_31:setText(Engine.CBBHFCGDIC("CLANS/RECOMMENDED"), 0)
	var_8_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_31:SetAlignment(LUI.Alignment.Right)
	var_8_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 144, _1080p * 376, _1080p * 96, _1080p * 114)
	var_8_0:addElement(var_8_31)

	var_8_0.Recommended = var_8_31

	local var_8_32

	if Engine.DDJFBBJAIG() then
		local var_8_33 = {
			borderThicknessLeft = _1080p * 2,
			borderThicknessRight = _1080p * 2,
			borderThicknessTop = _1080p * 2,
			borderThicknessBottom = _1080p * 2
		}

		var_8_32 = LUI.UIBorder.new(var_8_33)
		var_8_32.id = "RecommendedBorder"

		var_8_32:SetRGBFromTable(SWATCHES.genericMenu.newIndicator, 0)
		var_8_32:SetAlpha(0, 0)
		var_8_32:SetBorderThicknessLeft(_1080p * 2, 0)
		var_8_32:SetBorderThicknessRight(_1080p * 2, 0)
		var_8_32:SetBorderThicknessTop(_1080p * 2, 0)
		var_8_32:SetBorderThicknessBottom(_1080p * 2, 0)
		var_8_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 396, _1080p * 5, _1080p * 134)
		var_8_0:addElement(var_8_32)

		var_8_0.RecommendedBorder = var_8_32
	end

	local function var_8_34()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_34

	local var_8_35
	local var_8_36 = {
		{
			value = 3355443,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_36)

	local var_8_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOver", var_8_37)

	local var_8_38 = {
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

	var_8_12:RegisterAnimationSequence("ButtonOver", var_8_38)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("ButtonOver", var_8_39)
	end

	local var_8_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("ButtonOver", var_8_40)

	local function var_8_41()
		var_8_6:AnimateSequence("ButtonOver")
		var_8_10:AnimateSequence("ButtonOver")
		var_8_12:AnimateSequence("ButtonOver")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("ButtonOver")
		end

		var_8_18:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_41

	local var_8_42
	local var_8_43 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_43)

	local var_8_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUp", var_8_44)

	local var_8_45 = {
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

	var_8_12:RegisterAnimationSequence("ButtonUp", var_8_45)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_46 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("ButtonUp", var_8_46)
	end

	local var_8_47 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("ButtonUp", var_8_47)

	local function var_8_48()
		var_8_6:AnimateSequence("ButtonUp")
		var_8_10:AnimateSequence("ButtonUp")
		var_8_12:AnimateSequence("ButtonUp")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("ButtonUp")
		end

		var_8_18:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_48

	local var_8_49
	local var_8_50 = {
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

	var_8_8:RegisterAnimationSequence("Locked", var_8_50)

	local var_8_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_8_12:RegisterAnimationSequence("Locked", var_8_51)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_52 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("Locked", var_8_52)
	end

	if CONDITIONS.InFrontend() then
		local var_8_53 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_14:RegisterAnimationSequence("Locked", var_8_53)
	end

	local var_8_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Locked", var_8_54)

	if CONDITIONS.IsWaveGameType() then
		local var_8_55 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_19:RegisterAnimationSequence("Locked", var_8_55)
	end

	local function var_8_56()
		var_8_8:AnimateSequence("Locked")
		var_8_12:AnimateSequence("Locked")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("Locked")
		end

		if CONDITIONS.InFrontend() then
			var_8_14:AnimateSequence("Locked")
		end

		var_8_16:AnimateSequence("Locked")

		if CONDITIONS.IsWaveGameType() then
			var_8_19:AnimateSequence("Locked")
		end
	end

	var_8_0._sequences.Locked = var_8_56

	local var_8_57
	local var_8_58 = {
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

	var_8_8:RegisterAnimationSequence("AR", var_8_58)

	local var_8_59 = {
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

	var_8_10:RegisterAnimationSequence("AR", var_8_59)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_60 = {
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

		var_8_13:RegisterAnimationSequence("AR", var_8_60)
	end

	local var_8_61 = {
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

	var_8_18:RegisterAnimationSequence("AR", var_8_61)

	local var_8_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		}
	}

	var_8_29:RegisterAnimationSequence("AR", var_8_62)

	local function var_8_63()
		var_8_8:AnimateSequence("AR")
		var_8_10:AnimateSequence("AR")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("AR")
		end

		var_8_18:AnimateSequence("AR")
		var_8_29:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_63

	local var_8_64
	local var_8_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUpDisabled", var_8_65)

	local var_8_66 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUpDisabled", var_8_66)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_67 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("ButtonUpDisabled", var_8_67)
	end

	if CONDITIONS.InFrontend() then
		local var_8_68 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_14:RegisterAnimationSequence("ButtonUpDisabled", var_8_68)
	end

	local var_8_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ButtonUpDisabled", var_8_69)

	local var_8_70 = {
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

	var_8_18:RegisterAnimationSequence("ButtonUpDisabled", var_8_70)

	if CONDITIONS.IsWaveGameType() then
		local var_8_71 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_19:RegisterAnimationSequence("ButtonUpDisabled", var_8_71)
	end

	local function var_8_72()
		var_8_10:AnimateSequence("ButtonUpDisabled")
		var_8_12:AnimateSequence("ButtonUpDisabled")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.InFrontend() then
			var_8_14:AnimateSequence("ButtonUpDisabled")
		end

		var_8_16:AnimateSequence("ButtonUpDisabled")
		var_8_18:AnimateSequence("ButtonUpDisabled")

		if CONDITIONS.IsWaveGameType() then
			var_8_19:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_72

	local var_8_73
	local var_8_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOverDisabled", var_8_74)

	local var_8_75 = {
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

	var_8_12:RegisterAnimationSequence("ButtonOverDisabled", var_8_75)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_76 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("ButtonOverDisabled", var_8_76)
	end

	if CONDITIONS.InFrontend() then
		local var_8_77 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_14:RegisterAnimationSequence("ButtonOverDisabled", var_8_77)
	end

	local var_8_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ButtonOverDisabled", var_8_78)

	local var_8_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("ButtonOverDisabled", var_8_79)

	if CONDITIONS.IsWaveGameType() then
		local var_8_80 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_19:RegisterAnimationSequence("ButtonOverDisabled", var_8_80)
	end

	local function var_8_81()
		var_8_10:AnimateSequence("ButtonOverDisabled")
		var_8_12:AnimateSequence("ButtonOverDisabled")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.InFrontend() then
			var_8_14:AnimateSequence("ButtonOverDisabled")
		end

		var_8_16:AnimateSequence("ButtonOverDisabled")
		var_8_18:AnimateSequence("ButtonOverDisabled")

		if CONDITIONS.IsWaveGameType() then
			var_8_19:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_81

	local var_8_82

	if CONDITIONS.InFrontend() then
		local var_8_83 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_14:RegisterAnimationSequence("ProgressBarOver", var_8_83)
	end

	local var_8_84 = {
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

	var_8_16:RegisterAnimationSequence("ProgressBarOver", var_8_84)

	local function var_8_85()
		if CONDITIONS.InFrontend() then
			var_8_14:AnimateSequence("ProgressBarOver")
		end

		var_8_16:AnimateSequence("ProgressBarOver")
	end

	var_8_0._sequences.ProgressBarOver = var_8_85

	local var_8_86

	if CONDITIONS.InFrontend() then
		local var_8_87 = {
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_14:RegisterAnimationSequence("ProgressBarUp", var_8_87)
	end

	local var_8_88 = {
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

	var_8_16:RegisterAnimationSequence("ProgressBarUp", var_8_88)

	local function var_8_89()
		if CONDITIONS.InFrontend() then
			var_8_14:AnimateSequence("ProgressBarUp")
		end

		var_8_16:AnimateSequence("ProgressBarUp")
	end

	var_8_0._sequences.ProgressBarUp = var_8_89

	local var_8_90

	if CONDITIONS.InFrontend() then
		local var_8_91 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_14:RegisterAnimationSequence("HideProgressBar", var_8_91)
	end

	local var_8_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("HideProgressBar", var_8_92)

	local function var_8_93()
		if CONDITIONS.InFrontend() then
			var_8_14:AnimateSequence("HideProgressBar")
		end

		var_8_16:AnimateSequence("HideProgressBar")
	end

	var_8_0._sequences.HideProgressBar = var_8_93

	local var_8_94
	local var_8_95 = {
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

	var_8_8:RegisterAnimationSequence("ShowRestriction", var_8_95)

	local var_8_96 = {
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

	var_8_23:RegisterAnimationSequence("ShowRestriction", var_8_96)

	local function var_8_97()
		var_8_8:AnimateSequence("ShowRestriction")
		var_8_23:AnimateSequence("ShowRestriction")
	end

	var_8_0._sequences.ShowRestriction = var_8_97

	local var_8_98
	local var_8_99 = {
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

	var_8_8:RegisterAnimationSequence("HideRestriction", var_8_99)

	local var_8_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_23:RegisterAnimationSequence("HideRestriction", var_8_100)

	local function var_8_101()
		var_8_8:AnimateSequence("HideRestriction")
		var_8_23:AnimateSequence("HideRestriction")
	end

	var_8_0._sequences.HideRestriction = var_8_101

	local var_8_102
	local var_8_103 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipSetup", var_8_103)

	local var_8_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_8_16:RegisterAnimationSequence("WZWipSetup", var_8_104)

	local var_8_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTitle
		}
	}

	var_8_18:RegisterAnimationSequence("WZWipSetup", var_8_105)

	if CONDITIONS.IsWaveGameType() then
		local var_8_106 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZDescription
			}
		}

		var_8_19:RegisterAnimationSequence("WZWipSetup", var_8_106)
	end

	local function var_8_107()
		var_8_10:AnimateSequence("WZWipSetup")
		var_8_16:AnimateSequence("WZWipSetup")
		var_8_18:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWaveGameType() then
			var_8_19:AnimateSequence("WZWipSetup")
		end
	end

	var_8_0._sequences.WZWipSetup = var_8_107

	local var_8_108
	local var_8_109 = {
		{
			value = 3355443,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonOver", var_8_109)

	local var_8_110 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonOver", var_8_110)

	local var_8_111 = {
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

	var_8_12:RegisterAnimationSequence("WZWipButtonOver", var_8_111)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_112 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("WZWipButtonOver", var_8_112)
	end

	local var_8_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("WZWipButtonOver", var_8_113)

	local function var_8_114()
		var_8_6:AnimateSequence("WZWipButtonOver")
		var_8_10:AnimateSequence("WZWipButtonOver")
		var_8_12:AnimateSequence("WZWipButtonOver")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("WZWipButtonOver")
		end

		var_8_18:AnimateSequence("WZWipButtonOver")
	end

	var_8_0._sequences.WZWipButtonOver = var_8_114

	local var_8_115
	local var_8_116 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_116)

	local var_8_117 = {
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

	var_8_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_117)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_118 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_118)
	end

	if CONDITIONS.InFrontend() then
		local var_8_119 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_119)
	end

	local var_8_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_120)

	local var_8_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_121)

	if CONDITIONS.IsWaveGameType() then
		local var_8_122 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_19:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_122)
	end

	local function var_8_123()
		var_8_10:AnimateSequence("WZWipButtonOverDisabled")
		var_8_12:AnimateSequence("WZWipButtonOverDisabled")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("WZWipButtonOverDisabled")
		end

		if CONDITIONS.InFrontend() then
			var_8_14:AnimateSequence("WZWipButtonOverDisabled")
		end

		var_8_16:AnimateSequence("WZWipButtonOverDisabled")
		var_8_18:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.IsWaveGameType() then
			var_8_19:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_8_0._sequences.WZWipButtonOverDisabled = var_8_123

	local var_8_124
	local var_8_125 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonUp", var_8_125)

	local var_8_126 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonUp", var_8_126)

	local var_8_127 = {
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

	var_8_12:RegisterAnimationSequence("WZWipButtonUp", var_8_127)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_128 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("WZWipButtonUp", var_8_128)
	end

	local var_8_129 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("WZWipButtonUp", var_8_129)

	local function var_8_130()
		var_8_6:AnimateSequence("WZWipButtonUp")
		var_8_10:AnimateSequence("WZWipButtonUp")
		var_8_12:AnimateSequence("WZWipButtonUp")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("WZWipButtonUp")
		end

		var_8_18:AnimateSequence("WZWipButtonUp")
	end

	var_8_0._sequences.WZWipButtonUp = var_8_130

	local var_8_131
	local var_8_132 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_132)

	local var_8_133 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_133)

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_134 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_13:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_134)
	end

	if CONDITIONS.InFrontend() then
		local var_8_135 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_135)
	end

	local var_8_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_136)

	local var_8_137 = {
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
		}
	}

	var_8_18:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_137)

	if CONDITIONS.IsWaveGameType() then
		local var_8_138 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_19:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_138)
	end

	local function var_8_139()
		var_8_10:AnimateSequence("WZWipButtonUpDisabled")
		var_8_12:AnimateSequence("WZWipButtonUpDisabled")

		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_13:AnimateSequence("WZWipButtonUpDisabled")
		end

		if CONDITIONS.InFrontend() then
			var_8_14:AnimateSequence("WZWipButtonUpDisabled")
		end

		var_8_16:AnimateSequence("WZWipButtonUpDisabled")
		var_8_18:AnimateSequence("WZWipButtonUpDisabled")

		if CONDITIONS.IsWaveGameType() then
			var_8_19:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_8_0._sequences.WZWipButtonUpDisabled = var_8_139

	local var_8_140
	local var_8_141 = {
		{
			value = -0.58,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
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
		}
	}

	var_8_29:RegisterAnimationSequence("VG", var_8_141)

	local function var_8_142()
		var_8_29:AnimateSequence("VG")
	end

	var_8_0._sequences.VG = var_8_142

	local var_8_143
	local var_8_144 = {
		{
			value = -0.58,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
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

	var_8_29:RegisterAnimationSequence("VGAR", var_8_144)

	local function var_8_145()
		var_8_29:AnimateSequence("VGAR")
	end

	var_8_0._sequences.VGAR = var_8_145

	local var_8_146
	local var_8_147 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_31:RegisterAnimationSequence("ShowRecommended", var_8_147)

	if Engine.DDJFBBJAIG() then
		local var_8_148 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_32:RegisterAnimationSequence("ShowRecommended", var_8_148)
	end

	local function var_8_149()
		var_8_31:AnimateSequence("ShowRecommended")

		if Engine.DDJFBBJAIG() then
			var_8_32:AnimateSequence("ShowRecommended")
		end
	end

	var_8_0._sequences.ShowRecommended = var_8_149

	local var_8_150
	local var_8_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_31:RegisterAnimationSequence("HideRecommended", var_8_151)

	if Engine.DDJFBBJAIG() then
		local var_8_152 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_32:RegisterAnimationSequence("HideRecommended", var_8_152)
	end

	local function var_8_153()
		var_8_31:AnimateSequence("HideRecommended")

		if Engine.DDJFBBJAIG() then
			var_8_32:AnimateSequence("HideRecommended")
		end
	end

	var_8_0._sequences.HideRecommended = var_8_153

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WeaponButton", WeaponButton)
LockTable(_M)
