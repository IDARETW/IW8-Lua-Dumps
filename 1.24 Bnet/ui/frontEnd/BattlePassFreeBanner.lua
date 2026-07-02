module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 then
		arg_1_0.TimerText:setText(ToUpperCase(arg_1_1))
	else
		arg_1_0.FreeText:setText(ToUpperCase(arg_1_1))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 then
		arg_2_0.Shine:SetRGBFromTable(arg_2_2)
	end

	arg_2_0.Shine:SetAlpha(0.5)
	ACTIONS.AnimateSequence(arg_2_0, arg_2_1 and "GlintFast" or "Glint")
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetText = var_0_0
	arg_3_0.PlayGlint = var_0_1

	arg_3_0.Shine:SetMask(arg_3_0.Mask)
	arg_3_0.Mask:SetAlpha(1)
	ACTIONS.AnimateSequence(arg_3_0, "GlowPulse")

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function BattlePassFreeBanner(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 140 * _1080p, 0, 24 * _1080p)

	var_4_0.id = "BattlePassFreeBanner"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "LowerGlow"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4.Glow:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 3, _1080p * 19)
	var_4_0:addElement(var_4_4)

	var_4_0.LowerGlow = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "UpperGlow"

	var_4_6:SetAlpha(0.5, 0)
	var_4_6.Glow:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -20, _1080p * -4)
	var_4_0:addElement(var_4_6)

	var_4_0.UpperGlow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "FreeBanner"

	var_4_8:SetRGBFromTable(SWATCHES.genericMenu.newIndicatorDark, 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_8)

	var_4_0.FreeBanner = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "CenterOut"

	var_4_10:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_4_10:SetAlpha(0.15, 0)
	var_4_10:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_10)

	var_4_0.CenterOut = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Shine"

	var_4_12:SetAlpha(0, 0)
	var_4_12:SetZRotation(-45, 0)
	var_4_12:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -50, _1080p * -8, _1080p * -106, _1080p * 106)
	var_4_0:addElement(var_4_12)

	var_4_0.Shine = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "Flash"

	var_4_14:SetRGBFromTable(SWATCHES.splashNotifications.GreenLight, 0)
	var_4_14:SetAlpha(0, 0)
	var_4_14:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_4_14:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_14:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 70, _1080p * -70, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_14)

	var_4_0.Flash = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIStyledText.new()

	var_4_16.id = "FreeText"

	var_4_16:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_4_16:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/FREE")), 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_16:SetWordWrap(false)
	var_4_16:SetTracking(2 * _1080p, 0)
	var_4_16:SetAlignment(LUI.Alignment.Center)
	var_4_16:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_16:SetStartupDelay(1000)
	var_4_16:SetLineHoldTime(400)
	var_4_16:SetAnimMoveTime(1000)
	var_4_16:SetAnimMoveSpeed(150)
	var_4_16:SetEndDelay(1000)
	var_4_16:SetCrossfadeTime(1000)
	var_4_16:SetFadeInTime(300)
	var_4_16:SetFadeOutTime(300)
	var_4_16:SetMaxVisibleLines(1)
	var_4_16:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 7, _1080p * -7, _1080p * -9, _1080p * 9)
	var_4_0:addElement(var_4_16)

	var_4_0.FreeText = var_4_16

	local var_4_17
	local var_4_18 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_19 = LUI.UIBorder.new(var_4_18)

	var_4_19.id = "LowerLine"

	var_4_19:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_4_19:SetBorderThicknessLeft(_1080p * 0, 0)
	var_4_19:SetBorderThicknessRight(_1080p * 0, 0)
	var_4_19:SetBorderThicknessTop(_1080p * 0, 0)
	var_4_19:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 3, _1080p * 12)
	var_4_0:addElement(var_4_19)

	var_4_0.LowerLine = var_4_19

	local var_4_20
	local var_4_21 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_22 = LUI.UIBorder.new(var_4_21)

	var_4_22.id = "UpperLine"

	var_4_22:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_4_22:SetBorderThicknessLeft(_1080p * 0, 0)
	var_4_22:SetBorderThicknessRight(_1080p * 0, 0)
	var_4_22:SetBorderThicknessTop(_1080p * 0, 0)
	var_4_22:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -20, _1080p * -11)
	var_4_0:addElement(var_4_22)

	var_4_0.UpperLine = var_4_22

	local var_4_23
	local var_4_24 = LUI.UIImage.new()

	var_4_24.id = "Highlight"

	var_4_24:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_4_24:SetAlpha(0.15, 0)
	var_4_24:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_24:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_24:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -25, _1080p * 11)
	var_4_0:addElement(var_4_24)

	var_4_0.Highlight = var_4_24

	local var_4_25
	local var_4_26 = LUI.UIStyledText.new()

	var_4_26.id = "InstantBonus"

	var_4_26:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_4_26:SetAlpha(0, 0)
	var_4_26:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BONUS")), 0)
	var_4_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_26:SetTracking(3 * _1080p, 0)
	var_4_26:SetLeading(-4 * _1080p, 0)
	var_4_26:SetAlignment(LUI.Alignment.Center)
	var_4_26:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_26:SetStartupDelay(1000)
	var_4_26:SetLineHoldTime(400)
	var_4_26:SetAnimMoveTime(1000)
	var_4_26:SetAnimMoveSpeed(150)
	var_4_26:SetEndDelay(1000)
	var_4_26:SetCrossfadeTime(1000)
	var_4_26:SetFadeInTime(300)
	var_4_26:SetFadeOutTime(300)
	var_4_26:SetMaxVisibleLines(2)
	var_4_26:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 4, _1080p * -4, _1080p * -15, _1080p * 3)
	var_4_0:addElement(var_4_26)

	var_4_0.InstantBonus = var_4_26

	local var_4_27
	local var_4_28 = LUI.UIImage.new()

	var_4_28.id = "Mask"

	var_4_28:SetAlpha(0, 0)
	var_4_28:setImage(RegisterMaterial("stencil_mask"), 0)
	var_4_0:addElement(var_4_28)

	var_4_0.Mask = var_4_28

	local var_4_29
	local var_4_30 = LUI.UIImage.new()

	var_4_30.id = "TimerClock"

	var_4_30:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_4_30:SetAlpha(0, 0)
	var_4_30:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_4_30:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 20, _1080p * -8, _1080p * 8)
	var_4_0:addElement(var_4_30)

	var_4_0.TimerClock = var_4_30

	local var_4_31
	local var_4_32 = LUI.UIStyledText.new()

	var_4_32.id = "TimerText"

	var_4_32:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_4_32:SetAlpha(0, 0)
	var_4_32:setText("", 0)
	var_4_32:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_32:SetWordWrap(false)
	var_4_32:SetAlignment(LUI.Alignment.Left)
	var_4_32:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_32:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 25, _1080p * -7, _1080p * -9, _1080p * 9)
	var_4_0:addElement(var_4_32)

	var_4_0.TimerText = var_4_32

	local function var_4_33()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_33

	local var_4_34
	local var_4_35 = {
		{
			value = 0.5,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 1400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("GlowPulse", var_4_35)

	local function var_4_36()
		var_4_24:AnimateLoop("GlowPulse")
	end

	var_4_0._sequences.GlowPulse = var_4_36

	local var_4_37
	local var_4_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PurchasedHighlight,
			child = var_4_0.LowerGlow.Glow
		}
	}

	var_4_4:RegisterAnimationSequence("BundleVariant", var_4_38)

	local var_4_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PurchasedHighlight,
			child = var_4_0.UpperGlow.Glow
		}
	}

	var_4_6:RegisterAnimationSequence("BundleVariant", var_4_39)

	local var_4_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeamDark
		}
	}

	var_4_8:RegisterAnimationSequence("BundleVariant", var_4_40)

	local var_4_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -23
		}
	}

	var_4_10:RegisterAnimationSequence("BundleVariant", var_4_41)

	local var_4_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("BundleVariant", var_4_42)

	local var_4_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_4_19:RegisterAnimationSequence("BundleVariant", var_4_43)

	local var_4_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -23
		}
	}

	var_4_22:RegisterAnimationSequence("BundleVariant", var_4_44)

	local var_4_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_4_24:RegisterAnimationSequence("BundleVariant", var_4_45)

	local var_4_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("BundleVariant", var_4_46)

	local var_4_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_4_28:RegisterAnimationSequence("BundleVariant", var_4_47)

	local function var_4_48()
		var_4_4:AnimateSequence("BundleVariant")
		var_4_6:AnimateSequence("BundleVariant")
		var_4_8:AnimateSequence("BundleVariant")
		var_4_10:AnimateSequence("BundleVariant")
		var_4_16:AnimateSequence("BundleVariant")
		var_4_19:AnimateSequence("BundleVariant")
		var_4_22:AnimateSequence("BundleVariant")
		var_4_24:AnimateSequence("BundleVariant")
		var_4_26:AnimateSequence("BundleVariant")
		var_4_28:AnimateSequence("BundleVariant")
	end

	var_4_0._sequences.BundleVariant = var_4_48

	local var_4_49
	local var_4_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary,
			child = var_4_0.LowerGlow.Glow
		}
	}

	var_4_4:RegisterAnimationSequence("FreeVariant", var_4_50)

	local var_4_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary,
			child = var_4_0.UpperGlow.Glow
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		}
	}

	var_4_6:RegisterAnimationSequence("FreeVariant", var_4_51)

	local var_4_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicatorDark
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_4_8:RegisterAnimationSequence("FreeVariant", var_4_52)

	local var_4_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		}
	}

	var_4_10:RegisterAnimationSequence("FreeVariant", var_4_53)

	local var_4_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("FreeVariant", var_4_54)

	local var_4_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_4_19:RegisterAnimationSequence("FreeVariant", var_4_55)

	local var_4_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -11
		}
	}

	var_4_22:RegisterAnimationSequence("FreeVariant", var_4_56)

	local var_4_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		}
	}

	var_4_24:RegisterAnimationSequence("FreeVariant", var_4_57)

	local var_4_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("FreeVariant", var_4_58)

	local var_4_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_4_28:RegisterAnimationSequence("FreeVariant", var_4_59)

	local function var_4_60()
		var_4_4:AnimateSequence("FreeVariant")
		var_4_6:AnimateSequence("FreeVariant")
		var_4_8:AnimateSequence("FreeVariant")
		var_4_10:AnimateSequence("FreeVariant")
		var_4_16:AnimateSequence("FreeVariant")
		var_4_19:AnimateSequence("FreeVariant")
		var_4_22:AnimateSequence("FreeVariant")
		var_4_24:AnimateSequence("FreeVariant")
		var_4_26:AnimateSequence("FreeVariant")
		var_4_28:AnimateSequence("FreeVariant")
	end

	var_4_0._sequences.FreeVariant = var_4_60

	local var_4_61
	local var_4_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_4_16:RegisterAnimationSequence("AR", var_4_62)

	local var_4_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		}
	}

	var_4_26:RegisterAnimationSequence("AR", var_4_63)

	local function var_4_64()
		var_4_16:AnimateSequence("AR")
		var_4_26:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_64

	local var_4_65
	local var_4_66 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_4_0.LowerGlow.Glow
		}
	}

	var_4_4:RegisterAnimationSequence("TierSaleVariant", var_4_66)

	local var_4_67 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_4_0.UpperGlow.Glow
		}
	}

	var_4_6:RegisterAnimationSequence("TierSaleVariant", var_4_67)

	local var_4_68 = {
		{
			value = 8087114,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("TierSaleVariant", var_4_68)

	local var_4_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		}
	}

	var_4_10:RegisterAnimationSequence("TierSaleVariant", var_4_69)

	local var_4_70 = {
		{
			value = 3742230,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_16:RegisterAnimationSequence("TierSaleVariant", var_4_70)

	local var_4_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		}
	}

	var_4_19:RegisterAnimationSequence("TierSaleVariant", var_4_71)

	local var_4_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		}
	}

	var_4_22:RegisterAnimationSequence("TierSaleVariant", var_4_72)

	local var_4_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_4_24:RegisterAnimationSequence("TierSaleVariant", var_4_73)

	local function var_4_74()
		var_4_4:AnimateSequence("TierSaleVariant")
		var_4_6:AnimateSequence("TierSaleVariant")
		var_4_8:AnimateSequence("TierSaleVariant")
		var_4_10:AnimateSequence("TierSaleVariant")
		var_4_16:AnimateSequence("TierSaleVariant")
		var_4_19:AnimateSequence("TierSaleVariant")
		var_4_22:AnimateSequence("TierSaleVariant")
		var_4_24:AnimateSequence("TierSaleVariant")
	end

	var_4_0._sequences.TierSaleVariant = var_4_74

	local var_4_75
	local var_4_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_4_4:RegisterAnimationSequence("HotVariant", var_4_76)

	local var_4_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		}
	}

	var_4_6:RegisterAnimationSequence("HotVariant", var_4_77)

	local var_4_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		}
	}

	var_4_8:RegisterAnimationSequence("HotVariant", var_4_78)

	local var_4_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_4_10:RegisterAnimationSequence("HotVariant", var_4_79)

	local var_4_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_4_19:RegisterAnimationSequence("HotVariant", var_4_80)

	local var_4_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -7
		}
	}

	var_4_22:RegisterAnimationSequence("HotVariant", var_4_81)

	local var_4_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		}
	}

	var_4_28:RegisterAnimationSequence("HotVariant", var_4_82)

	local function var_4_83()
		var_4_4:AnimateSequence("HotVariant")
		var_4_6:AnimateSequence("HotVariant")
		var_4_8:AnimateSequence("HotVariant")
		var_4_10:AnimateSequence("HotVariant")
		var_4_19:AnimateSequence("HotVariant")
		var_4_22:AnimateSequence("HotVariant")
		var_4_28:AnimateSequence("HotVariant")
	end

	var_4_0._sequences.HotVariant = var_4_83

	local var_4_84
	local var_4_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("FreeBundleVariant", var_4_85)

	local var_4_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_4_10:RegisterAnimationSequence("FreeBundleVariant", var_4_86)

	local var_4_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("FreeBundleVariant", var_4_87)

	local function var_4_88()
		var_4_6:AnimateSequence("FreeBundleVariant")
		var_4_10:AnimateSequence("FreeBundleVariant")
		var_4_22:AnimateSequence("FreeBundleVariant")
	end

	var_4_0._sequences.FreeBundleVariant = var_4_88

	local var_4_89
	local var_4_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -89
		},
		{
			value = 1,
			duration = 909,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 909,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 909,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 909,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 1,
			duration = 909,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 909,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 909,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 909,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117
		}
	}

	var_4_12:RegisterAnimationSequence("GlintFast", var_4_90)

	local function var_4_91()
		var_4_12:AnimateLoop("GlintFast")
	end

	var_4_0._sequences.GlintFast = var_4_91

	local var_4_92
	local var_4_93 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -89
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117
		}
	}

	var_4_12:RegisterAnimationSequence("Glint", var_4_93)

	local function var_4_94()
		var_4_12:AnimateLoop("Glint")
	end

	var_4_0._sequences.Glint = var_4_94

	local var_4_95
	local var_4_96 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_4_0.LowerGlow.Glow
		}
	}

	var_4_4:RegisterAnimationSequence("SeasonVariant", var_4_96)

	local var_4_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_4_0.UpperGlow.Glow
		}
	}

	var_4_6:RegisterAnimationSequence("SeasonVariant", var_4_97)

	local var_4_98 = {
		{
			value = 8087114,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("SeasonVariant", var_4_98)

	local var_4_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		}
	}

	var_4_10:RegisterAnimationSequence("SeasonVariant", var_4_99)

	local var_4_100 = {
		{
			value = 3742230,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_16:RegisterAnimationSequence("SeasonVariant", var_4_100)

	local var_4_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		}
	}

	var_4_19:RegisterAnimationSequence("SeasonVariant", var_4_101)

	local var_4_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		}
	}

	var_4_22:RegisterAnimationSequence("SeasonVariant", var_4_102)

	local var_4_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_4_24:RegisterAnimationSequence("SeasonVariant", var_4_103)

	local var_4_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_4_26:RegisterAnimationSequence("SeasonVariant", var_4_104)

	local function var_4_105()
		var_4_4:AnimateSequence("SeasonVariant")
		var_4_6:AnimateSequence("SeasonVariant")
		var_4_8:AnimateSequence("SeasonVariant")
		var_4_10:AnimateSequence("SeasonVariant")
		var_4_16:AnimateSequence("SeasonVariant")
		var_4_19:AnimateSequence("SeasonVariant")
		var_4_22:AnimateSequence("SeasonVariant")
		var_4_24:AnimateSequence("SeasonVariant")
		var_4_26:AnimateSequence("SeasonVariant")
	end

	var_4_0._sequences.SeasonVariant = var_4_105

	local var_4_106
	local var_4_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder,
			child = var_4_0.LowerGlow.Glow
		}
	}

	var_4_4:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_107)

	local var_4_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder,
			child = var_4_0.UpperGlow.Glow
		}
	}

	var_4_6:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_108)

	local var_4_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.warningDark
		}
	}

	var_4_8:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_109)

	local var_4_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		}
	}

	var_4_10:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_110)

	local var_4_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		}
	}

	var_4_12:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_111)

	local var_4_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_4_16:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_112)

	local var_4_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		}
	}

	var_4_19:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_113)

	local var_4_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		}
	}

	var_4_22:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_114)

	local var_4_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.failed
		}
	}

	var_4_24:RegisterAnimationSequence("TierSaleVariantEndSoon", var_4_115)

	local function var_4_116()
		var_4_4:AnimateSequence("TierSaleVariantEndSoon")
		var_4_6:AnimateSequence("TierSaleVariantEndSoon")
		var_4_8:AnimateSequence("TierSaleVariantEndSoon")
		var_4_10:AnimateSequence("TierSaleVariantEndSoon")
		var_4_12:AnimateSequence("TierSaleVariantEndSoon")
		var_4_16:AnimateSequence("TierSaleVariantEndSoon")
		var_4_19:AnimateSequence("TierSaleVariantEndSoon")
		var_4_22:AnimateSequence("TierSaleVariantEndSoon")
		var_4_24:AnimateSequence("TierSaleVariantEndSoon")
	end

	var_4_0._sequences.TierSaleVariantEndSoon = var_4_116

	local var_4_117
	local var_4_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonSizeSetup", var_4_118)

	local var_4_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonSizeSetup", var_4_119)

	local var_4_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -21
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonSizeSetup", var_4_120)

	local var_4_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 68
		}
	}

	var_4_16:RegisterAnimationSequence("ButtonSizeSetup", var_4_121)

	local var_4_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19
		}
	}

	var_4_22:RegisterAnimationSequence("ButtonSizeSetup", var_4_122)

	local var_4_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -33
		}
	}

	var_4_24:RegisterAnimationSequence("ButtonSizeSetup", var_4_123)

	local var_4_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("ButtonSizeSetup", var_4_124)

	local var_4_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		}
	}

	var_4_28:RegisterAnimationSequence("ButtonSizeSetup", var_4_125)

	local function var_4_126()
		var_4_6:AnimateSequence("ButtonSizeSetup")
		var_4_8:AnimateSequence("ButtonSizeSetup")
		var_4_10:AnimateSequence("ButtonSizeSetup")
		var_4_16:AnimateSequence("ButtonSizeSetup")
		var_4_22:AnimateSequence("ButtonSizeSetup")
		var_4_24:AnimateSequence("ButtonSizeSetup")
		var_4_26:AnimateSequence("ButtonSizeSetup")
		var_4_28:AnimateSequence("ButtonSizeSetup")
	end

	var_4_0._sequences.ButtonSizeSetup = var_4_126

	local var_4_127
	local var_4_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("TabSizeSetup", var_4_128)

	local var_4_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_4_10:RegisterAnimationSequence("TabSizeSetup", var_4_129)

	local var_4_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("TabSizeSetup", var_4_130)

	local var_4_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_4_26:RegisterAnimationSequence("TabSizeSetup", var_4_131)

	local function var_4_132()
		var_4_6:AnimateSequence("TabSizeSetup")
		var_4_10:AnimateSequence("TabSizeSetup")
		var_4_22:AnimateSequence("TabSizeSetup")
		var_4_26:AnimateSequence("TabSizeSetup")
	end

	var_4_0._sequences.TabSizeSetup = var_4_132

	local var_4_133
	local var_4_134 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -89
		},
		{
			value = 1,
			duration = 1250,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 1250,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1250,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 1,
			duration = 1250,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 1250,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 1250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 1250,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117
		}
	}

	var_4_12:RegisterAnimationSequence("SlowGlint", var_4_134)

	local function var_4_135()
		var_4_12:AnimateLoop("SlowGlint")
	end

	var_4_0._sequences.SlowGlint = var_4_135

	local var_4_136
	local var_4_137 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -89
		},
		{
			value = 1,
			duration = 2000,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 1,
			duration = 2000,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117
		}
	}

	var_4_12:RegisterAnimationSequence("GlintSlow", var_4_137)

	local function var_4_138()
		var_4_12:AnimateLoop("GlintSlow")
	end

	var_4_0._sequences.GlintSlow = var_4_138

	local var_4_139
	local var_4_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -41
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

	var_4_12:RegisterAnimationSequence("StopGlint", var_4_140)

	local function var_4_141()
		var_4_12:AnimateSequence("StopGlint")
	end

	var_4_0._sequences.StopGlint = var_4_141

	local var_4_142
	local var_4_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab,
			child = var_4_0.LowerGlow.Glow
		}
	}

	var_4_4:RegisterAnimationSequence("LimitedTimeVariant", var_4_143)

	local var_4_144 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_4_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("LimitedTimeVariant", var_4_144)

	local var_4_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleBG
		}
	}

	var_4_8:RegisterAnimationSequence("LimitedTimeVariant", var_4_145)

	local var_4_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab
		}
	}

	var_4_10:RegisterAnimationSequence("LimitedTimeVariant", var_4_146)

	local var_4_147 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("LimitedTimeVariant", var_4_147)

	local var_4_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab
		}
	}

	var_4_19:RegisterAnimationSequence("LimitedTimeVariant", var_4_148)

	local var_4_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("LimitedTimeVariant", var_4_149)

	local var_4_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab
		}
	}

	var_4_24:RegisterAnimationSequence("LimitedTimeVariant", var_4_150)

	local var_4_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("LimitedTimeVariant", var_4_151)

	local var_4_152 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("LimitedTimeVariant", var_4_152)

	local var_4_153 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("LimitedTimeVariant", var_4_153)

	local function var_4_154()
		var_4_4:AnimateSequence("LimitedTimeVariant")
		var_4_6:AnimateSequence("LimitedTimeVariant")
		var_4_8:AnimateSequence("LimitedTimeVariant")
		var_4_10:AnimateSequence("LimitedTimeVariant")
		var_4_16:AnimateSequence("LimitedTimeVariant")
		var_4_19:AnimateSequence("LimitedTimeVariant")
		var_4_22:AnimateSequence("LimitedTimeVariant")
		var_4_24:AnimateSequence("LimitedTimeVariant")
		var_4_26:AnimateSequence("LimitedTimeVariant")
		var_4_30:AnimateSequence("LimitedTimeVariant")
		var_4_32:AnimateSequence("LimitedTimeVariant")
	end

	var_4_0._sequences.LimitedTimeVariant = var_4_154

	local var_4_155
	local var_4_156 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningTab,
			child = var_4_0.LowerGlow.Glow
		}
	}

	var_4_4:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_156)

	local var_4_157 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_4_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_157)

	local var_4_158 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningBG
		}
	}

	var_4_8:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_158)

	local var_4_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningTab
		}
	}

	var_4_10:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_159)

	local var_4_160 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_160)

	local var_4_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningTab
		}
	}

	var_4_19:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_161)

	local var_4_162 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_162)

	local var_4_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningTab
		}
	}

	var_4_24:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_163)

	local var_4_164 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_164)

	local var_4_165 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_165)

	local var_4_166 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("LimitedTimeWarningVariant", var_4_166)

	local function var_4_167()
		var_4_4:AnimateSequence("LimitedTimeWarningVariant")
		var_4_6:AnimateSequence("LimitedTimeWarningVariant")
		var_4_8:AnimateSequence("LimitedTimeWarningVariant")
		var_4_10:AnimateSequence("LimitedTimeWarningVariant")
		var_4_16:AnimateSequence("LimitedTimeWarningVariant")
		var_4_19:AnimateSequence("LimitedTimeWarningVariant")
		var_4_22:AnimateSequence("LimitedTimeWarningVariant")
		var_4_24:AnimateSequence("LimitedTimeWarningVariant")
		var_4_26:AnimateSequence("LimitedTimeWarningVariant")
		var_4_30:AnimateSequence("LimitedTimeWarningVariant")
		var_4_32:AnimateSequence("LimitedTimeWarningVariant")
	end

	var_4_0._sequences.LimitedTimeWarningVariant = var_4_167

	local var_4_168
	local var_4_169 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Splash", var_4_169)

	local var_4_170 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Splash", var_4_170)

	local var_4_171 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Splash", var_4_171)

	local var_4_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Splash", var_4_172)

	local var_4_173 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Splash", var_4_173)

	local var_4_174 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -70
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 800,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 800,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 800,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1320,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 800,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1320,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_4_14:RegisterAnimationSequence("Splash", var_4_174)

	local var_4_175 = {
		{
			value = 3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		}
	}

	var_4_16:RegisterAnimationSequence("Splash", var_4_175)

	local var_4_176 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Splash", var_4_176)

	local var_4_177 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("Splash", var_4_177)

	local var_4_178 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("Splash", var_4_178)

	local function var_4_179()
		var_4_4:AnimateSequence("Splash")
		var_4_6:AnimateSequence("Splash")
		var_4_8:AnimateSequence("Splash")
		var_4_10:AnimateSequence("Splash")
		var_4_12:AnimateSequence("Splash")
		var_4_14:AnimateSequence("Splash")
		var_4_16:AnimateSequence("Splash")
		var_4_19:AnimateSequence("Splash")
		var_4_22:AnimateSequence("Splash")
		var_4_24:AnimateSequence("Splash")
	end

	var_4_0._sequences.Splash = var_4_179

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BattlePassFreeBanner", BattlePassFreeBanner)
LockTable(_M)
