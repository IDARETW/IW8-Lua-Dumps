module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0, arg_1_2 and arg_1_2.hideBanner and "BattlePassPopupTopperTitle" or "BattlePassFreeBundleTopper")

	arg_1_0.FreeText.eventTimer = LUI.UITimer.new({
		interval = 1000,
		event = "update_bp_topper_timer"
	})
	arg_1_0.FreeText.eventTimer.id = "bpTopperTimer"

	arg_1_0.FreeText:addElement(arg_1_0.FreeText.eventTimer)
	arg_1_0.FreeText:addAndCallEventHandler("update_bp_topper_timer", function()
		local var_2_0 = Engine.DEIDGHDBHD()
		local var_2_1 = var_2_0 < arg_1_1 and arg_1_1 - var_2_0 or 0

		if var_2_1 == 0 then
			arg_1_0.FreeText.eventTimer:closeTree()

			arg_1_0.FreeText.eventTimer = nil

			ACTIONS.AnimateSequence(arg_1_0, "BattlePassFreeBundleTopperDisabled")
		else
			local var_2_2 = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("BATTLEPASS/BUNDLE_OFFER", Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_2_1))))

			arg_1_0.FreeText:setText(var_2_2)
		end
	end)
end

local function var_0_1(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0, "BattlePassFreeBundleTopperDisabled")
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 then
		arg_4_0.TimerText:setText(ToUpperCase(arg_4_1))
	else
		arg_4_0.FreeText:setText(ToUpperCase(arg_4_1))
		arg_4_0.FreeTextShadow:setText(ToUpperCase(arg_4_1))
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_2 then
		arg_5_0.Shine:SetRGBFromTable(arg_5_2)
	end

	arg_5_0.Shine:SetAlpha(0.5)
	ACTIONS.AnimateSequence(arg_5_0, arg_5_1 and "GlintFast" or "Glint")
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetText = var_0_2
	arg_6_0.PlayGlint = var_0_3
	arg_6_0.SetBattlePassTopperTimer = var_0_0
	arg_6_0.HideBattlePassTopperTimer = var_0_1

	arg_6_0.Shine:SetMask(arg_6_0.Mask)
	arg_6_0.Mask:SetAlpha(1)
	ACTIONS.AnimateSequence(arg_6_0, "GlowPulse")

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end
end

function BattlePassFreeBanner(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 140 * _1080p, 0, 24 * _1080p)

	var_7_0.id = "BattlePassFreeBanner"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "LowerGlow"

	var_7_4:SetAlpha(0.5, 0)
	var_7_4.Glow:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 3, _1080p * 19)
	var_7_0:addElement(var_7_4)

	var_7_0.LowerGlow = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "UpperGlow"

	var_7_6:SetAlpha(0.5, 0)
	var_7_6.Glow:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_7_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -20, _1080p * -4)
	var_7_0:addElement(var_7_6)

	var_7_0.UpperGlow = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "FreeBanner"

	var_7_8:SetRGBFromTable(SWATCHES.genericMenu.newIndicatorDark, 0)
	var_7_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12)
	var_7_0:addElement(var_7_8)

	var_7_0.FreeBanner = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "BattlePassBundleTopperIcon"

	var_7_10:SetAlpha(0, 0)
	var_7_10:setImage(RegisterMaterial("ui_icon_battlepass_bundle_topper"), 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -114, _1080p * -90, _1080p * -12, _1080p * 12)
	var_7_0:addElement(var_7_10)

	var_7_0.BattlePassBundleTopperIcon = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "IconSeasonTab"

	var_7_12:SetAlpha(0, 0)
	var_7_12:setImage(RegisterMaterial("ui_icon_seasontab"), 0)
	var_7_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -12, _1080p * 36)
	var_7_0:addElement(var_7_12)

	var_7_0.IconSeasonTab = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "IconSeasonTabGlint"

	var_7_14:SetAlpha(0, 0)
	var_7_14:setImage(RegisterMaterial("ui_icon_seasontab_glint"), 0)
	var_7_14:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_14:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -12, _1080p * 36)
	var_7_0:addElement(var_7_14)

	var_7_0.IconSeasonTabGlint = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "CenterOut"

	var_7_16:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_7_16:SetAlpha(0.15, 0)
	var_7_16:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_7_16:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12)
	var_7_0:addElement(var_7_16)

	var_7_0.CenterOut = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "Shine"

	var_7_18:SetAlpha(0, 0)
	var_7_18:SetZRotation(-45, 0)
	var_7_18:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_7_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -50, _1080p * -8, _1080p * -106, _1080p * 106)
	var_7_0:addElement(var_7_18)

	var_7_0.Shine = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIImage.new()

	var_7_20.id = "Flash"

	var_7_20:SetRGBFromTable(SWATCHES.splashNotifications.GreenLight, 0)
	var_7_20:SetAlpha(0, 0)
	var_7_20:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_7_20:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_20:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 70, _1080p * -70, _1080p * -12, _1080p * 12)
	var_7_0:addElement(var_7_20)

	var_7_0.Flash = var_7_20

	local var_7_21
	local var_7_22 = LUI.UIImage.new()

	var_7_22.id = "BattlePassTopperShadow"

	var_7_22:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_7_22:SetAlpha(0, 0)
	var_7_22:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_7_0:addElement(var_7_22)

	var_7_0.BattlePassTopperShadow = var_7_22

	local var_7_23
	local var_7_24 = LUI.UIStyledText.new()

	var_7_24.id = "FreeTextShadow"

	var_7_24:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_7_24:SetAlpha(0, 0)
	var_7_24:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/FREE")), 0)
	var_7_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_24:SetTracking(2 * _1080p, 0)
	var_7_24:SetAlignment(LUI.Alignment.Center)
	var_7_24:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_24:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -6, _1080p * 12)
	var_7_0:addElement(var_7_24)

	var_7_0.FreeTextShadow = var_7_24

	local var_7_25
	local var_7_26 = LUI.UIStyledText.new()

	var_7_26.id = "FreeText"

	var_7_26:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_7_26:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/FREE")), 0)
	var_7_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_26:SetTracking(2 * _1080p, 0)
	var_7_26:SetAlignment(LUI.Alignment.Center)
	var_7_26:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_26:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -9, _1080p * 9)
	var_7_0:addElement(var_7_26)

	var_7_0.FreeText = var_7_26

	local var_7_27
	local var_7_28 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_7_29 = LUI.UIBorder.new(var_7_28)

	var_7_29.id = "LowerLine"

	var_7_29:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_7_29:SetBorderThicknessLeft(_1080p * 0, 0)
	var_7_29:SetBorderThicknessRight(_1080p * 0, 0)
	var_7_29:SetBorderThicknessTop(_1080p * 0, 0)
	var_7_29:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 3, _1080p * 12)
	var_7_0:addElement(var_7_29)

	var_7_0.LowerLine = var_7_29

	local var_7_30
	local var_7_31 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_7_32 = LUI.UIBorder.new(var_7_31)

	var_7_32.id = "UpperLine"

	var_7_32:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_7_32:SetBorderThicknessLeft(_1080p * 0, 0)
	var_7_32:SetBorderThicknessRight(_1080p * 0, 0)
	var_7_32:SetBorderThicknessTop(_1080p * 0, 0)
	var_7_32:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -20, _1080p * -11)
	var_7_0:addElement(var_7_32)

	var_7_0.UpperLine = var_7_32

	local var_7_33
	local var_7_34 = LUI.UIImage.new()

	var_7_34.id = "Highlight"

	var_7_34:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_7_34:SetAlpha(0.15, 0)
	var_7_34:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_34:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_34:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -25, _1080p * 12)
	var_7_0:addElement(var_7_34)

	var_7_0.Highlight = var_7_34

	local var_7_35
	local var_7_36 = LUI.UIStyledText.new()

	var_7_36.id = "InstantBonus"

	var_7_36:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_7_36:SetAlpha(0, 0)
	var_7_36:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BONUS")), 0)
	var_7_36:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_36:SetTracking(3 * _1080p, 0)
	var_7_36:SetLeading(-4 * _1080p, 0)
	var_7_36:SetAlignment(LUI.Alignment.Center)
	var_7_36:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_36:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_7_36:SetStartupDelay(1000)
	var_7_36:SetLineHoldTime(400)
	var_7_36:SetAnimMoveTime(1000)
	var_7_36:SetAnimMoveSpeed(150)
	var_7_36:SetEndDelay(1000)
	var_7_36:SetCrossfadeTime(1000)
	var_7_36:SetFadeInTime(300)
	var_7_36:SetFadeOutTime(300)
	var_7_36:SetMaxVisibleLines(2)
	var_7_36:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 4, _1080p * -4, _1080p * -15, _1080p * 3)
	var_7_0:addElement(var_7_36)

	var_7_0.InstantBonus = var_7_36

	local var_7_37
	local var_7_38 = LUI.UIImage.new()

	var_7_38.id = "Mask"

	var_7_38:SetAlpha(0, 0)
	var_7_38:setImage(RegisterMaterial("stencil_mask"), 0)
	var_7_0:addElement(var_7_38)

	var_7_0.Mask = var_7_38

	local var_7_39
	local var_7_40 = LUI.UIImage.new()

	var_7_40.id = "TimerClock"

	var_7_40:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_7_40:SetAlpha(0, 0)
	var_7_40:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_7_40:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 20, _1080p * -8, _1080p * 8)
	var_7_0:addElement(var_7_40)

	var_7_0.TimerClock = var_7_40

	local var_7_41
	local var_7_42 = LUI.UIStyledText.new()

	var_7_42.id = "TimerText"

	var_7_42:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_7_42:SetAlpha(0, 0)
	var_7_42:setText(ToUpperCase(""), 0)
	var_7_42:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_42:SetWordWrap(false)
	var_7_42:SetAlignment(LUI.Alignment.Center)
	var_7_42:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_42:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_42:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 25, _1080p * -7, _1080p * -8, _1080p * 8)
	var_7_0:addElement(var_7_42)

	var_7_0.TimerText = var_7_42

	local function var_7_43()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_43

	local var_7_44
	local var_7_45 = {
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

	var_7_34:RegisterAnimationSequence("GlowPulse", var_7_45)

	local function var_7_46()
		var_7_34:AnimateLoop("GlowPulse")
	end

	var_7_0._sequences.GlowPulse = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PurchasedHighlight,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("BundleVariant", var_7_48)

	local var_7_49 = {
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
			child = var_7_0.UpperGlow.Glow
		}
	}

	var_7_6:RegisterAnimationSequence("BundleVariant", var_7_49)

	local var_7_50 = {
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

	var_7_8:RegisterAnimationSequence("BundleVariant", var_7_50)

	local var_7_51 = {
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

	var_7_16:RegisterAnimationSequence("BundleVariant", var_7_51)

	local var_7_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BundleVariant", var_7_52)

	local var_7_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("BundleVariant", var_7_53)

	local var_7_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_7_29:RegisterAnimationSequence("BundleVariant", var_7_54)

	local var_7_55 = {
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

	var_7_32:RegisterAnimationSequence("BundleVariant", var_7_55)

	local var_7_56 = {
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

	var_7_34:RegisterAnimationSequence("BundleVariant", var_7_56)

	local var_7_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("BundleVariant", var_7_57)

	local var_7_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_38:RegisterAnimationSequence("BundleVariant", var_7_58)

	local function var_7_59()
		var_7_4:AnimateSequence("BundleVariant")
		var_7_6:AnimateSequence("BundleVariant")
		var_7_8:AnimateSequence("BundleVariant")
		var_7_16:AnimateSequence("BundleVariant")
		var_7_24:AnimateSequence("BundleVariant")
		var_7_26:AnimateSequence("BundleVariant")
		var_7_29:AnimateSequence("BundleVariant")
		var_7_32:AnimateSequence("BundleVariant")
		var_7_34:AnimateSequence("BundleVariant")
		var_7_36:AnimateSequence("BundleVariant")
		var_7_38:AnimateSequence("BundleVariant")
	end

	var_7_0._sequences.BundleVariant = var_7_59

	local var_7_60
	local var_7_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("FreeVariant", var_7_61)

	local var_7_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary,
			child = var_7_0.UpperGlow.Glow
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

	var_7_6:RegisterAnimationSequence("FreeVariant", var_7_62)

	local var_7_63 = {
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

	var_7_8:RegisterAnimationSequence("FreeVariant", var_7_63)

	local var_7_64 = {
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

	var_7_16:RegisterAnimationSequence("FreeVariant", var_7_64)

	local var_7_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("FreeVariant", var_7_65)

	local var_7_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("FreeVariant", var_7_66)

	local var_7_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_7_26:RegisterAnimationSequence("FreeVariant", var_7_67)

	local var_7_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_7_29:RegisterAnimationSequence("FreeVariant", var_7_68)

	local var_7_69 = {
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

	var_7_32:RegisterAnimationSequence("FreeVariant", var_7_69)

	local var_7_70 = {
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

	var_7_34:RegisterAnimationSequence("FreeVariant", var_7_70)

	local var_7_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("FreeVariant", var_7_71)

	local var_7_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_7_38:RegisterAnimationSequence("FreeVariant", var_7_72)

	local function var_7_73()
		var_7_4:AnimateSequence("FreeVariant")
		var_7_6:AnimateSequence("FreeVariant")
		var_7_8:AnimateSequence("FreeVariant")
		var_7_16:AnimateSequence("FreeVariant")
		var_7_22:AnimateSequence("FreeVariant")
		var_7_24:AnimateSequence("FreeVariant")
		var_7_26:AnimateSequence("FreeVariant")
		var_7_29:AnimateSequence("FreeVariant")
		var_7_32:AnimateSequence("FreeVariant")
		var_7_34:AnimateSequence("FreeVariant")
		var_7_36:AnimateSequence("FreeVariant")
		var_7_38:AnimateSequence("FreeVariant")
	end

	var_7_0._sequences.FreeVariant = var_7_73

	local var_7_74
	local var_7_75 = {
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

	var_7_26:RegisterAnimationSequence("AR", var_7_75)

	local var_7_76 = {
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

	var_7_36:RegisterAnimationSequence("AR", var_7_76)

	local function var_7_77()
		var_7_26:AnimateSequence("AR")
		var_7_36:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_77

	local var_7_78
	local var_7_79 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.LowerGlow.Glow
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("TierSaleVariant", var_7_79)

	local var_7_80 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("TierSaleVariant", var_7_80)

	local var_7_81 = {
		{
			value = 8087114,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_8:RegisterAnimationSequence("TierSaleVariant", var_7_81)

	local var_7_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_16:RegisterAnimationSequence("TierSaleVariant", var_7_82)

	local var_7_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("TierSaleVariant", var_7_83)

	local var_7_84 = {
		{
			value = 3742230,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		}
	}

	var_7_26:RegisterAnimationSequence("TierSaleVariant", var_7_84)

	local var_7_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("TierSaleVariant", var_7_85)

	local var_7_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_7_32:RegisterAnimationSequence("TierSaleVariant", var_7_86)

	local var_7_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("TierSaleVariant", var_7_87)

	local function var_7_88()
		var_7_4:AnimateSequence("TierSaleVariant")
		var_7_6:AnimateSequence("TierSaleVariant")
		var_7_8:AnimateSequence("TierSaleVariant")
		var_7_16:AnimateSequence("TierSaleVariant")
		var_7_24:AnimateSequence("TierSaleVariant")
		var_7_26:AnimateSequence("TierSaleVariant")
		var_7_29:AnimateSequence("TierSaleVariant")
		var_7_32:AnimateSequence("TierSaleVariant")
		var_7_34:AnimateSequence("TierSaleVariant")
	end

	var_7_0._sequences.TierSaleVariant = var_7_88

	local var_7_89
	local var_7_90 = {
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

	var_7_4:RegisterAnimationSequence("HotVariant", var_7_90)

	local var_7_91 = {
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

	var_7_6:RegisterAnimationSequence("HotVariant", var_7_91)

	local var_7_92 = {
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

	var_7_8:RegisterAnimationSequence("HotVariant", var_7_92)

	local var_7_93 = {
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

	var_7_16:RegisterAnimationSequence("HotVariant", var_7_93)

	local var_7_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("HotVariant", var_7_94)

	local var_7_95 = {
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

	var_7_29:RegisterAnimationSequence("HotVariant", var_7_95)

	local var_7_96 = {
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

	var_7_32:RegisterAnimationSequence("HotVariant", var_7_96)

	local var_7_97 = {
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

	var_7_38:RegisterAnimationSequence("HotVariant", var_7_97)

	local function var_7_98()
		var_7_4:AnimateSequence("HotVariant")
		var_7_6:AnimateSequence("HotVariant")
		var_7_8:AnimateSequence("HotVariant")
		var_7_16:AnimateSequence("HotVariant")
		var_7_24:AnimateSequence("HotVariant")
		var_7_29:AnimateSequence("HotVariant")
		var_7_32:AnimateSequence("HotVariant")
		var_7_38:AnimateSequence("HotVariant")
	end

	var_7_0._sequences.HotVariant = var_7_98

	local var_7_99
	local var_7_100 = {
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

	var_7_18:RegisterAnimationSequence("GlintFast", var_7_100)

	local function var_7_101()
		var_7_18:AnimateLoop("GlintFast")
	end

	var_7_0._sequences.GlintFast = var_7_101

	local var_7_102
	local var_7_103 = {
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

	var_7_18:RegisterAnimationSequence("Glint", var_7_103)

	local function var_7_104()
		var_7_18:AnimateLoop("Glint")
	end

	var_7_0._sequences.Glint = var_7_104

	local var_7_105
	local var_7_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_7_4:RegisterAnimationSequence("SeasonVariant", var_7_106)

	local var_7_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_7_6:RegisterAnimationSequence("SeasonVariant", var_7_107)

	local var_7_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_7_8:RegisterAnimationSequence("SeasonVariant", var_7_108)

	local var_7_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_12:RegisterAnimationSequence("SeasonVariant", var_7_109)

	local var_7_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 35
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutSine
		}
	}

	var_7_14:RegisterAnimationSequence("SeasonVariant", var_7_110)

	local var_7_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("SeasonVariant", var_7_111)

	local var_7_112 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 1 * _1080p
		}
	}

	var_7_24:RegisterAnimationSequence("SeasonVariant", var_7_112)

	local var_7_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 1 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_7_26:RegisterAnimationSequence("SeasonVariant", var_7_113)

	local var_7_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("SeasonVariant", var_7_114)

	local var_7_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("SeasonVariant", var_7_115)

	local var_7_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("SeasonVariant", var_7_116)

	local function var_7_117()
		var_7_4:AnimateSequence("SeasonVariant")
		var_7_6:AnimateSequence("SeasonVariant")
		var_7_8:AnimateSequence("SeasonVariant")
		var_7_12:AnimateSequence("SeasonVariant")
		var_7_14:AnimateSequence("SeasonVariant")
		var_7_16:AnimateSequence("SeasonVariant")
		var_7_24:AnimateSequence("SeasonVariant")
		var_7_26:AnimateSequence("SeasonVariant")
		var_7_29:AnimateSequence("SeasonVariant")
		var_7_32:AnimateSequence("SeasonVariant")
		var_7_34:AnimateSequence("SeasonVariant")
	end

	var_7_0._sequences.SeasonVariant = var_7_117

	local var_7_118
	local var_7_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder,
			child = var_7_0.LowerGlow.Glow
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_119)

	local var_7_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_120)

	local var_7_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.warningDark
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_8:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_121)

	local var_7_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_16:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_122)

	local var_7_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		}
	}

	var_7_18:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_123)

	local var_7_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_124)

	local var_7_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_7_26:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_125)

	local var_7_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_126)

	local var_7_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_7_32:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_127)

	local var_7_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.failed
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("TierSaleVariantEndSoon", var_7_128)

	local function var_7_129()
		var_7_4:AnimateSequence("TierSaleVariantEndSoon")
		var_7_6:AnimateSequence("TierSaleVariantEndSoon")
		var_7_8:AnimateSequence("TierSaleVariantEndSoon")
		var_7_16:AnimateSequence("TierSaleVariantEndSoon")
		var_7_18:AnimateSequence("TierSaleVariantEndSoon")
		var_7_24:AnimateSequence("TierSaleVariantEndSoon")
		var_7_26:AnimateSequence("TierSaleVariantEndSoon")
		var_7_29:AnimateSequence("TierSaleVariantEndSoon")
		var_7_32:AnimateSequence("TierSaleVariantEndSoon")
		var_7_34:AnimateSequence("TierSaleVariantEndSoon")
	end

	var_7_0._sequences.TierSaleVariantEndSoon = var_7_129

	local var_7_130
	local var_7_131 = {
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

	var_7_6:RegisterAnimationSequence("ButtonSizeSetup", var_7_131)

	local var_7_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonSizeSetup", var_7_132)

	local var_7_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -21
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonSizeSetup", var_7_133)

	local var_7_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("ButtonSizeSetup", var_7_134)

	local var_7_135 = {
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

	var_7_26:RegisterAnimationSequence("ButtonSizeSetup", var_7_135)

	local var_7_136 = {
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

	var_7_32:RegisterAnimationSequence("ButtonSizeSetup", var_7_136)

	local var_7_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -33
		}
	}

	var_7_34:RegisterAnimationSequence("ButtonSizeSetup", var_7_137)

	local var_7_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("ButtonSizeSetup", var_7_138)

	local var_7_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		}
	}

	var_7_38:RegisterAnimationSequence("ButtonSizeSetup", var_7_139)

	local function var_7_140()
		var_7_6:AnimateSequence("ButtonSizeSetup")
		var_7_8:AnimateSequence("ButtonSizeSetup")
		var_7_16:AnimateSequence("ButtonSizeSetup")
		var_7_24:AnimateSequence("ButtonSizeSetup")
		var_7_26:AnimateSequence("ButtonSizeSetup")
		var_7_32:AnimateSequence("ButtonSizeSetup")
		var_7_34:AnimateSequence("ButtonSizeSetup")
		var_7_36:AnimateSequence("ButtonSizeSetup")
		var_7_38:AnimateSequence("ButtonSizeSetup")
	end

	var_7_0._sequences.ButtonSizeSetup = var_7_140

	local var_7_141
	local var_7_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("TabSizeSetup", var_7_142)

	local var_7_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_16:RegisterAnimationSequence("TabSizeSetup", var_7_143)

	local var_7_144 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("TabSizeSetup", var_7_144)

	local var_7_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_7_36:RegisterAnimationSequence("TabSizeSetup", var_7_145)

	local function var_7_146()
		var_7_6:AnimateSequence("TabSizeSetup")
		var_7_16:AnimateSequence("TabSizeSetup")
		var_7_32:AnimateSequence("TabSizeSetup")
		var_7_36:AnimateSequence("TabSizeSetup")
	end

	var_7_0._sequences.TabSizeSetup = var_7_146

	local var_7_147
	local var_7_148 = {
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

	var_7_18:RegisterAnimationSequence("SlowGlint", var_7_148)

	local function var_7_149()
		var_7_18:AnimateLoop("SlowGlint")
	end

	var_7_0._sequences.SlowGlint = var_7_149

	local var_7_150
	local var_7_151 = {
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

	var_7_18:RegisterAnimationSequence("GlintSlow", var_7_151)

	local function var_7_152()
		var_7_18:AnimateLoop("GlintSlow")
	end

	var_7_0._sequences.GlintSlow = var_7_152

	local var_7_153
	local var_7_154 = {
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

	var_7_18:RegisterAnimationSequence("StopGlint", var_7_154)

	local function var_7_155()
		var_7_18:AnimateSequence("StopGlint")
	end

	var_7_0._sequences.StopGlint = var_7_155

	local var_7_156
	local var_7_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("LimitedTimeVariant", var_7_157)

	local var_7_158 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LimitedTimeVariant", var_7_158)

	local var_7_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleBG
		}
	}

	var_7_8:RegisterAnimationSequence("LimitedTimeVariant", var_7_159)

	local var_7_160 = {
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

	var_7_16:RegisterAnimationSequence("LimitedTimeVariant", var_7_160)

	local var_7_161 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("LimitedTimeVariant", var_7_161)

	local var_7_162 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("LimitedTimeVariant", var_7_162)

	local var_7_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab
		}
	}

	var_7_29:RegisterAnimationSequence("LimitedTimeVariant", var_7_163)

	local var_7_164 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("LimitedTimeVariant", var_7_164)

	local var_7_165 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab
		}
	}

	var_7_34:RegisterAnimationSequence("LimitedTimeVariant", var_7_165)

	local var_7_166 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("LimitedTimeVariant", var_7_166)

	local var_7_167 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_40:RegisterAnimationSequence("LimitedTimeVariant", var_7_167)

	local var_7_168 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BattleNetBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		}
	}

	var_7_42:RegisterAnimationSequence("LimitedTimeVariant", var_7_168)

	local function var_7_169()
		var_7_4:AnimateSequence("LimitedTimeVariant")
		var_7_6:AnimateSequence("LimitedTimeVariant")
		var_7_8:AnimateSequence("LimitedTimeVariant")
		var_7_16:AnimateSequence("LimitedTimeVariant")
		var_7_24:AnimateSequence("LimitedTimeVariant")
		var_7_26:AnimateSequence("LimitedTimeVariant")
		var_7_29:AnimateSequence("LimitedTimeVariant")
		var_7_32:AnimateSequence("LimitedTimeVariant")
		var_7_34:AnimateSequence("LimitedTimeVariant")
		var_7_36:AnimateSequence("LimitedTimeVariant")
		var_7_40:AnimateSequence("LimitedTimeVariant")
		var_7_42:AnimateSequence("LimitedTimeVariant")
	end

	var_7_0._sequences.LimitedTimeVariant = var_7_169

	local var_7_170
	local var_7_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningTab,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_171)

	local var_7_172 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_172)

	local var_7_173 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningBG
		}
	}

	var_7_8:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_173)

	local var_7_174 = {
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

	var_7_16:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_174)

	local var_7_175 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_175)

	local var_7_176 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_176)

	local var_7_177 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningTab
		}
	}

	var_7_29:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_177)

	local var_7_178 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_178)

	local var_7_179 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningTab
		}
	}

	var_7_34:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_179)

	local var_7_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_180)

	local var_7_181 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_7_40:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_181)

	local var_7_182 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_7_42:RegisterAnimationSequence("LimitedTimeWarningVariant", var_7_182)

	local function var_7_183()
		var_7_4:AnimateSequence("LimitedTimeWarningVariant")
		var_7_6:AnimateSequence("LimitedTimeWarningVariant")
		var_7_8:AnimateSequence("LimitedTimeWarningVariant")
		var_7_16:AnimateSequence("LimitedTimeWarningVariant")
		var_7_24:AnimateSequence("LimitedTimeWarningVariant")
		var_7_26:AnimateSequence("LimitedTimeWarningVariant")
		var_7_29:AnimateSequence("LimitedTimeWarningVariant")
		var_7_32:AnimateSequence("LimitedTimeWarningVariant")
		var_7_34:AnimateSequence("LimitedTimeWarningVariant")
		var_7_36:AnimateSequence("LimitedTimeWarningVariant")
		var_7_40:AnimateSequence("LimitedTimeWarningVariant")
		var_7_42:AnimateSequence("LimitedTimeWarningVariant")
	end

	var_7_0._sequences.LimitedTimeWarningVariant = var_7_183

	local var_7_184
	local var_7_185 = {
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

	var_7_4:RegisterAnimationSequence("Splash", var_7_185)

	local var_7_186 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Splash", var_7_186)

	local var_7_187 = {
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

	var_7_8:RegisterAnimationSequence("Splash", var_7_187)

	local var_7_188 = {
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

	var_7_16:RegisterAnimationSequence("Splash", var_7_188)

	local var_7_189 = {
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

	var_7_18:RegisterAnimationSequence("Splash", var_7_189)

	local var_7_190 = {
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

	var_7_20:RegisterAnimationSequence("Splash", var_7_190)

	local var_7_191 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("Splash", var_7_191)

	local var_7_192 = {
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

	var_7_26:RegisterAnimationSequence("Splash", var_7_192)

	local var_7_193 = {
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

	var_7_29:RegisterAnimationSequence("Splash", var_7_193)

	local var_7_194 = {
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

	var_7_32:RegisterAnimationSequence("Splash", var_7_194)

	local var_7_195 = {
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

	var_7_34:RegisterAnimationSequence("Splash", var_7_195)

	local function var_7_196()
		var_7_4:AnimateSequence("Splash")
		var_7_6:AnimateSequence("Splash")
		var_7_8:AnimateSequence("Splash")
		var_7_16:AnimateSequence("Splash")
		var_7_18:AnimateSequence("Splash")
		var_7_20:AnimateSequence("Splash")
		var_7_24:AnimateSequence("Splash")
		var_7_26:AnimateSequence("Splash")
		var_7_29:AnimateSequence("Splash")
		var_7_32:AnimateSequence("Splash")
		var_7_34:AnimateSequence("Splash")
	end

	var_7_0._sequences.Splash = var_7_196

	local var_7_197
	local var_7_198 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowDark,
			child = var_7_0.LowerGlow.Glow
		},
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("LateGrindersVariant", var_7_198)

	local var_7_199 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowDark,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LateGrindersVariant", var_7_199)

	local var_7_200 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		}
	}

	var_7_8:RegisterAnimationSequence("LateGrindersVariant", var_7_200)

	local var_7_201 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_7_16:RegisterAnimationSequence("LateGrindersVariant", var_7_201)

	local var_7_202 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("LateGrindersVariant", var_7_202)

	local var_7_203 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70
		}
	}

	var_7_26:RegisterAnimationSequence("LateGrindersVariant", var_7_203)

	local var_7_204 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowBody
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("LateGrindersVariant", var_7_204)

	local var_7_205 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowBody
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -14
		}
	}

	var_7_32:RegisterAnimationSequence("LateGrindersVariant", var_7_205)

	local var_7_206 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowLight
		}
	}

	var_7_34:RegisterAnimationSequence("LateGrindersVariant", var_7_206)

	local function var_7_207()
		var_7_4:AnimateSequence("LateGrindersVariant")
		var_7_6:AnimateSequence("LateGrindersVariant")
		var_7_8:AnimateSequence("LateGrindersVariant")
		var_7_16:AnimateSequence("LateGrindersVariant")
		var_7_24:AnimateSequence("LateGrindersVariant")
		var_7_26:AnimateSequence("LateGrindersVariant")
		var_7_29:AnimateSequence("LateGrindersVariant")
		var_7_32:AnimateSequence("LateGrindersVariant")
		var_7_34:AnimateSequence("LateGrindersVariant")
	end

	var_7_0._sequences.LateGrindersVariant = var_7_207

	local var_7_208
	local var_7_209 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRed,
			child = var_7_0.LowerGlow.Glow
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Zeus", var_7_209)

	local var_7_210 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRed,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Zeus", var_7_210)

	local var_7_211 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.EnemyDarkRed
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_8:RegisterAnimationSequence("Zeus", var_7_211)

	local var_7_212 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeamHighlight
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_16:RegisterAnimationSequence("Zeus", var_7_212)

	local var_7_213 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRed
		}
	}

	var_7_18:RegisterAnimationSequence("Zeus", var_7_213)

	local var_7_214 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("Zeus", var_7_214)

	local var_7_215 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRed
		}
	}

	var_7_26:RegisterAnimationSequence("Zeus", var_7_215)

	local var_7_216 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRed
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("Zeus", var_7_216)

	local var_7_217 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRed
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_7_32:RegisterAnimationSequence("Zeus", var_7_217)

	local var_7_218 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRed
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("Zeus", var_7_218)

	local function var_7_219()
		var_7_4:AnimateSequence("Zeus")
		var_7_6:AnimateSequence("Zeus")
		var_7_8:AnimateSequence("Zeus")
		var_7_16:AnimateSequence("Zeus")
		var_7_18:AnimateSequence("Zeus")
		var_7_24:AnimateSequence("Zeus")
		var_7_26:AnimateSequence("Zeus")
		var_7_29:AnimateSequence("Zeus")
		var_7_32:AnimateSequence("Zeus")
		var_7_34:AnimateSequence("Zeus")
	end

	var_7_0._sequences.Zeus = var_7_219

	local var_7_220
	local var_7_221 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText2,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("StoreSaleEnd", var_7_221)

	local var_7_222 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText2,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("StoreSaleEnd", var_7_222)

	local var_7_223 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner4
		}
	}

	var_7_8:RegisterAnimationSequence("StoreSaleEnd", var_7_223)

	local var_7_224 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemBase
		}
	}

	var_7_16:RegisterAnimationSequence("StoreSaleEnd", var_7_224)

	local var_7_225 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("StoreSaleEnd", var_7_225)

	local var_7_226 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_7_26:RegisterAnimationSequence("StoreSaleEnd", var_7_226)

	local var_7_227 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText2
		}
	}

	var_7_29:RegisterAnimationSequence("StoreSaleEnd", var_7_227)

	local var_7_228 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText2
		}
	}

	var_7_32:RegisterAnimationSequence("StoreSaleEnd", var_7_228)

	local var_7_229 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText2
		}
	}

	var_7_34:RegisterAnimationSequence("StoreSaleEnd", var_7_229)

	local var_7_230 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("StoreSaleEnd", var_7_230)

	local var_7_231 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_7_40:RegisterAnimationSequence("StoreSaleEnd", var_7_231)

	local var_7_232 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_42:RegisterAnimationSequence("StoreSaleEnd", var_7_232)

	local function var_7_233()
		var_7_4:AnimateSequence("StoreSaleEnd")
		var_7_6:AnimateSequence("StoreSaleEnd")
		var_7_8:AnimateSequence("StoreSaleEnd")
		var_7_16:AnimateSequence("StoreSaleEnd")
		var_7_24:AnimateSequence("StoreSaleEnd")
		var_7_26:AnimateSequence("StoreSaleEnd")
		var_7_29:AnimateSequence("StoreSaleEnd")
		var_7_32:AnimateSequence("StoreSaleEnd")
		var_7_34:AnimateSequence("StoreSaleEnd")
		var_7_36:AnimateSequence("StoreSaleEnd")
		var_7_40:AnimateSequence("StoreSaleEnd")
		var_7_42:AnimateSequence("StoreSaleEnd")
	end

	var_7_0._sequences.StoreSaleEnd = var_7_233

	local var_7_234
	local var_7_235 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner1,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("StoreSale", var_7_235)

	local var_7_236 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner1,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("StoreSale", var_7_236)

	local var_7_237 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemBase
		}
	}

	var_7_8:RegisterAnimationSequence("StoreSale", var_7_237)

	local var_7_238 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner2
		}
	}

	var_7_16:RegisterAnimationSequence("StoreSale", var_7_238)

	local var_7_239 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("StoreSale", var_7_239)

	local var_7_240 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText
		}
	}

	var_7_26:RegisterAnimationSequence("StoreSale", var_7_240)

	local var_7_241 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Bottom,
			value = _1080p * 2
		}
	}

	var_7_29:RegisterAnimationSequence("StoreSale", var_7_241)

	local var_7_242 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner1
		}
	}

	var_7_32:RegisterAnimationSequence("StoreSale", var_7_242)

	local var_7_243 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner3
		}
	}

	var_7_34:RegisterAnimationSequence("StoreSale", var_7_243)

	local var_7_244 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("StoreSale", var_7_244)

	local var_7_245 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.SaleBanner2
		}
	}

	var_7_40:RegisterAnimationSequence("StoreSale", var_7_245)

	local var_7_246 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_42:RegisterAnimationSequence("StoreSale", var_7_246)

	local function var_7_247()
		var_7_4:AnimateSequence("StoreSale")
		var_7_6:AnimateSequence("StoreSale")
		var_7_8:AnimateSequence("StoreSale")
		var_7_16:AnimateSequence("StoreSale")
		var_7_24:AnimateSequence("StoreSale")
		var_7_26:AnimateSequence("StoreSale")
		var_7_29:AnimateSequence("StoreSale")
		var_7_32:AnimateSequence("StoreSale")
		var_7_34:AnimateSequence("StoreSale")
		var_7_36:AnimateSequence("StoreSale")
		var_7_40:AnimateSequence("StoreSale")
		var_7_42:AnimateSequence("StoreSale")
	end

	var_7_0._sequences.StoreSale = var_7_247

	local var_7_248
	local var_7_249 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("FreeBundleVariant", var_7_249)

	local var_7_250 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary,
			child = var_7_0.UpperGlow.Glow
		}
	}

	var_7_6:RegisterAnimationSequence("FreeBundleVariant", var_7_250)

	local var_7_251 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicatorDark
		}
	}

	var_7_8:RegisterAnimationSequence("FreeBundleVariant", var_7_251)

	local var_7_252 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_7_16:RegisterAnimationSequence("FreeBundleVariant", var_7_252)

	local var_7_253 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("FreeBundleVariant", var_7_253)

	local var_7_254 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_7_26:RegisterAnimationSequence("FreeBundleVariant", var_7_254)

	local var_7_255 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_7_29:RegisterAnimationSequence("FreeBundleVariant", var_7_255)

	local var_7_256 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_7_32:RegisterAnimationSequence("FreeBundleVariant", var_7_256)

	local var_7_257 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_7_34:RegisterAnimationSequence("FreeBundleVariant", var_7_257)

	local function var_7_258()
		var_7_4:AnimateSequence("FreeBundleVariant")
		var_7_6:AnimateSequence("FreeBundleVariant")
		var_7_8:AnimateSequence("FreeBundleVariant")
		var_7_16:AnimateSequence("FreeBundleVariant")
		var_7_24:AnimateSequence("FreeBundleVariant")
		var_7_26:AnimateSequence("FreeBundleVariant")
		var_7_29:AnimateSequence("FreeBundleVariant")
		var_7_32:AnimateSequence("FreeBundleVariant")
		var_7_34:AnimateSequence("FreeBundleVariant")
	end

	var_7_0._sequences.FreeBundleVariant = var_7_258

	local var_7_259
	local var_7_260 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BattlePassFreeBundleTopper", var_7_260)

	local var_7_261 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/FREE"))
		}
	}

	var_7_26:RegisterAnimationSequence("BattlePassFreeBundleTopper", var_7_261)

	local function var_7_262()
		var_7_24:AnimateSequence("BattlePassFreeBundleTopper")
		var_7_26:AnimateSequence("BattlePassFreeBundleTopper")
	end

	var_7_0._sequences.BattlePassFreeBundleTopper = var_7_262

	local var_7_263
	local var_7_264 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper,
			child = var_7_0.UpperGlow.Glow
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -17
		}
	}

	var_7_6:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_264)

	local var_7_265 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		}
	}

	var_7_8:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_265)

	local var_7_266 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		}
	}

	var_7_16:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_266)

	local var_7_267 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_22:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_267)

	local var_7_268 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_268)

	local var_7_269 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BUNDLE_BONUS_SKIN"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 2 * _1080p
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_7_26:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_269)

	local var_7_270 = {
		{
			value = 5234849,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_29:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_270)

	local var_7_271 = {
		{
			value = 5234849,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_7_32:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_271)

	local var_7_272 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_7_34:RegisterAnimationSequence("BattlePassBundleBonusTopper", var_7_272)

	local function var_7_273()
		var_7_6:AnimateSequence("BattlePassBundleBonusTopper")
		var_7_8:AnimateSequence("BattlePassBundleBonusTopper")
		var_7_16:AnimateSequence("BattlePassBundleBonusTopper")
		var_7_22:AnimateSequence("BattlePassBundleBonusTopper")
		var_7_24:AnimateSequence("BattlePassBundleBonusTopper")
		var_7_26:AnimateSequence("BattlePassBundleBonusTopper")
		var_7_29:AnimateSequence("BattlePassBundleBonusTopper")
		var_7_32:AnimateSequence("BattlePassBundleBonusTopper")
		var_7_34:AnimateSequence("BattlePassBundleBonusTopper")
	end

	var_7_0._sequences.BattlePassBundleBonusTopper = var_7_273

	local var_7_274
	local var_7_275 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_275)

	local var_7_276 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_276)

	local var_7_277 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_277)

	local var_7_278 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_278)

	local var_7_279 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_279)

	local var_7_280 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_280)

	local var_7_281 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_281)

	local var_7_282 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_282)

	local var_7_283 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_283)

	local var_7_284 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_284)

	local var_7_285 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("BattlePassFreeBundleTopperDisabled", var_7_285)

	local function var_7_286()
		var_7_4:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_6:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_8:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_10:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_16:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_22:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_24:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_26:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_29:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_32:AnimateSequence("BattlePassFreeBundleTopperDisabled")
		var_7_34:AnimateSequence("BattlePassFreeBundleTopperDisabled")
	end

	var_7_0._sequences.BattlePassFreeBundleTopperDisabled = var_7_286

	local var_7_287
	local var_7_288 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BattlePassTopperPopup", var_7_288)

	local var_7_289 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BUNDLE_EXCLUSIVE"))
		}
	}

	var_7_26:RegisterAnimationSequence("BattlePassTopperPopup", var_7_289)

	local function var_7_290()
		var_7_24:AnimateSequence("BattlePassTopperPopup")
		var_7_26:AnimateSequence("BattlePassTopperPopup")
	end

	var_7_0._sequences.BattlePassTopperPopup = var_7_290

	local var_7_291
	local var_7_292 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.yellowLight,
			child = var_7_0.LowerGlow.Glow
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Vanguard", var_7_292)

	local var_7_293 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.yellowLight,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Vanguard", var_7_293)

	local var_7_294 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tracer.yellow
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_8:RegisterAnimationSequence("Vanguard", var_7_294)

	local var_7_295 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Yellow
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_16:RegisterAnimationSequence("Vanguard", var_7_295)

	local var_7_296 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.yellowLight
		}
	}

	var_7_18:RegisterAnimationSequence("Vanguard", var_7_296)

	local var_7_297 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("Vanguard", var_7_297)

	local var_7_298 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Black
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		}
	}

	var_7_26:RegisterAnimationSequence("Vanguard", var_7_298)

	local var_7_299 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.yellowLight
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("Vanguard", var_7_299)

	local var_7_300 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.yellowLight
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_7_32:RegisterAnimationSequence("Vanguard", var_7_300)

	local var_7_301 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.yellowLight
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("Vanguard", var_7_301)

	local var_7_302 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_40:RegisterAnimationSequence("Vanguard", var_7_302)

	local function var_7_303()
		var_7_4:AnimateSequence("Vanguard")
		var_7_6:AnimateSequence("Vanguard")
		var_7_8:AnimateSequence("Vanguard")
		var_7_16:AnimateSequence("Vanguard")
		var_7_18:AnimateSequence("Vanguard")
		var_7_24:AnimateSequence("Vanguard")
		var_7_26:AnimateSequence("Vanguard")
		var_7_29:AnimateSequence("Vanguard")
		var_7_32:AnimateSequence("Vanguard")
		var_7_34:AnimateSequence("Vanguard")
		var_7_40:AnimateSequence("Vanguard")
	end

	var_7_0._sequences.Vanguard = var_7_303

	local var_7_304
	local var_7_305 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_305)

	local var_7_306 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper,
			child = var_7_0.UpperGlow.Glow
		}
	}

	var_7_6:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_306)

	local var_7_307 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		}
	}

	var_7_8:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_307)

	local var_7_308 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		}
	}

	var_7_16:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_308)

	local var_7_309 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
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
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_7_22:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_309)

	local var_7_310 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_310)

	local var_7_311 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS_BONUS"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = -4 * _1080p
		},
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 10
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_7_26:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_311)

	local var_7_312 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_312)

	local var_7_313 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_313)

	local var_7_314 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_7_34:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_314)

	local var_7_315 = {
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

	var_7_40:RegisterAnimationSequence("BattlePassBundleTopperBanner", var_7_315)

	local function var_7_316()
		var_7_4:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_6:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_8:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_16:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_22:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_24:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_26:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_29:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_32:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_34:AnimateSequence("BattlePassBundleTopperBanner")
		var_7_40:AnimateSequence("BattlePassBundleTopperBanner")
	end

	var_7_0._sequences.BattlePassBundleTopperBanner = var_7_316

	local var_7_317
	local var_7_318 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("BattlePassBundleVisible", var_7_318)

	local var_7_319 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper,
			child = var_7_0.UpperGlow.Glow
		}
	}

	var_7_6:RegisterAnimationSequence("BattlePassBundleVisible", var_7_319)

	local var_7_320 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		}
	}

	var_7_8:RegisterAnimationSequence("BattlePassBundleVisible", var_7_320)

	local var_7_321 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -95
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("BattlePassBundleVisible", var_7_321)

	local var_7_322 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		}
	}

	var_7_16:RegisterAnimationSequence("BattlePassBundleVisible", var_7_322)

	local var_7_323 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		}
	}

	var_7_20:RegisterAnimationSequence("BattlePassBundleVisible", var_7_323)

	local var_7_324 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("BattlePassBundleVisible", var_7_324)

	local var_7_325 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BattlePassBundleVisible", var_7_325)

	local var_7_326 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BUNDLE_OFFER"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_7_26:RegisterAnimationSequence("BattlePassBundleVisible", var_7_326)

	local var_7_327 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		}
	}

	var_7_29:RegisterAnimationSequence("BattlePassBundleVisible", var_7_327)

	local var_7_328 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		}
	}

	var_7_32:RegisterAnimationSequence("BattlePassBundleVisible", var_7_328)

	local function var_7_329()
		var_7_4:AnimateSequence("BattlePassBundleVisible")
		var_7_6:AnimateSequence("BattlePassBundleVisible")
		var_7_8:AnimateSequence("BattlePassBundleVisible")
		var_7_10:AnimateSequence("BattlePassBundleVisible")
		var_7_16:AnimateSequence("BattlePassBundleVisible")
		var_7_20:AnimateSequence("BattlePassBundleVisible")
		var_7_22:AnimateSequence("BattlePassBundleVisible")
		var_7_24:AnimateSequence("BattlePassBundleVisible")
		var_7_26:AnimateSequence("BattlePassBundleVisible")
		var_7_29:AnimateSequence("BattlePassBundleVisible")
		var_7_32:AnimateSequence("BattlePassBundleVisible")
	end

	var_7_0._sequences.BattlePassBundleVisible = var_7_329

	local var_7_330
	local var_7_331 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("BattlePassBundleHidden", var_7_331)

	local var_7_332 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("BattlePassBundleHidden", var_7_332)

	local var_7_333 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BattlePassBundleHidden", var_7_333)

	local var_7_334 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_38:RegisterAnimationSequence("BattlePassBundleHidden", var_7_334)

	local function var_7_335()
		var_7_10:AnimateSequence("BattlePassBundleHidden")
		var_7_22:AnimateSequence("BattlePassBundleHidden")
		var_7_24:AnimateSequence("BattlePassBundleHidden")
		var_7_38:AnimateSequence("BattlePassBundleHidden")
	end

	var_7_0._sequences.BattlePassBundleHidden = var_7_335

	local var_7_336
	local var_7_337 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_337)

	local var_7_338 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_338)

	local var_7_339 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_339)

	local var_7_340 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_340)

	local var_7_341 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_341)

	local var_7_342 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2BattlePassTopper
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BUNDLE_OFFER"))
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_342)

	local var_7_343 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_343)

	local var_7_344 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_344)

	local var_7_345 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("BattlePassPopupTopperTitle", var_7_345)

	local function var_7_346()
		var_7_4:AnimateSequence("BattlePassPopupTopperTitle")
		var_7_6:AnimateSequence("BattlePassPopupTopperTitle")
		var_7_8:AnimateSequence("BattlePassPopupTopperTitle")
		var_7_16:AnimateSequence("BattlePassPopupTopperTitle")
		var_7_24:AnimateSequence("BattlePassPopupTopperTitle")
		var_7_26:AnimateSequence("BattlePassPopupTopperTitle")
		var_7_29:AnimateSequence("BattlePassPopupTopperTitle")
		var_7_32:AnimateSequence("BattlePassPopupTopperTitle")
		var_7_34:AnimateSequence("BattlePassPopupTopperTitle")
	end

	var_7_0._sequences.BattlePassPopupTopperTitle = var_7_346

	local var_7_347
	local var_7_348 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_348)

	local var_7_349 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_349)

	local var_7_350 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.ZeusRedDark
		}
	}

	var_7_8:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_350)

	local var_7_351 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red
		}
	}

	var_7_16:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_351)

	local var_7_352 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red
		}
	}

	var_7_20:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_352)

	local var_7_353 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_353)

	local var_7_354 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red
		}
	}

	var_7_29:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_354)

	local var_7_355 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red
		}
	}

	var_7_32:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_355)

	local var_7_356 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Red
		}
	}

	var_7_34:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_356)

	local var_7_357 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_357)

	local var_7_358 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_40:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_358)

	local var_7_359 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BattleNetBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_7_42:RegisterAnimationSequence("LimitedTimeVariantNumbers", var_7_359)

	local function var_7_360()
		var_7_4:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_6:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_8:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_16:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_20:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_24:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_29:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_32:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_34:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_36:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_40:AnimateSequence("LimitedTimeVariantNumbers")
		var_7_42:AnimateSequence("LimitedTimeVariantNumbers")
	end

	var_7_0._sequences.LimitedTimeVariantNumbers = var_7_360

	local var_7_361
	local var_7_362 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisLight,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_362)

	local var_7_363 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_363)

	local var_7_364 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.popupBackground
		}
	}

	var_7_8:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_364)

	local var_7_365 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Objective.iconDark
		}
	}

	var_7_16:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_365)

	local var_7_366 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_366)

	local var_7_367 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_367)

	local var_7_368 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisLight
		}
	}

	var_7_29:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_368)

	local var_7_369 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_369)

	local var_7_370 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisLight
		}
	}

	var_7_34:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_370)

	local var_7_371 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_371)

	local var_7_372 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_40:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_372)

	local var_7_373 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BattleNetBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_7_42:RegisterAnimationSequence("LimitedTimeVariantLEP", var_7_373)

	local function var_7_374()
		var_7_4:AnimateSequence("LimitedTimeVariantLEP")
		var_7_6:AnimateSequence("LimitedTimeVariantLEP")
		var_7_8:AnimateSequence("LimitedTimeVariantLEP")
		var_7_16:AnimateSequence("LimitedTimeVariantLEP")
		var_7_24:AnimateSequence("LimitedTimeVariantLEP")
		var_7_26:AnimateSequence("LimitedTimeVariantLEP")
		var_7_29:AnimateSequence("LimitedTimeVariantLEP")
		var_7_32:AnimateSequence("LimitedTimeVariantLEP")
		var_7_34:AnimateSequence("LimitedTimeVariantLEP")
		var_7_36:AnimateSequence("LimitedTimeVariantLEP")
		var_7_40:AnimateSequence("LimitedTimeVariantLEP")
		var_7_42:AnimateSequence("LimitedTimeVariantLEP")
	end

	var_7_0._sequences.LimitedTimeVariantLEP = var_7_374

	local var_7_375
	local var_7_376 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("ClanVariant", var_7_376)

	local var_7_377 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary,
			child = var_7_0.UpperGlow.Glow
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

	var_7_6:RegisterAnimationSequence("ClanVariant", var_7_377)

	local var_7_378 = {
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

	var_7_8:RegisterAnimationSequence("ClanVariant", var_7_378)

	local var_7_379 = {
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

	var_7_16:RegisterAnimationSequence("ClanVariant", var_7_379)

	local var_7_380 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("ClanVariant", var_7_380)

	local var_7_381 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("ClanVariant", var_7_381)

	local var_7_382 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		}
	}

	var_7_26:RegisterAnimationSequence("ClanVariant", var_7_382)

	local var_7_383 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_7_29:RegisterAnimationSequence("ClanVariant", var_7_383)

	local var_7_384 = {
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

	var_7_32:RegisterAnimationSequence("ClanVariant", var_7_384)

	local var_7_385 = {
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

	var_7_34:RegisterAnimationSequence("ClanVariant", var_7_385)

	local var_7_386 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("ClanVariant", var_7_386)

	local var_7_387 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_7_38:RegisterAnimationSequence("ClanVariant", var_7_387)

	local function var_7_388()
		var_7_4:AnimateSequence("ClanVariant")
		var_7_6:AnimateSequence("ClanVariant")
		var_7_8:AnimateSequence("ClanVariant")
		var_7_16:AnimateSequence("ClanVariant")
		var_7_22:AnimateSequence("ClanVariant")
		var_7_24:AnimateSequence("ClanVariant")
		var_7_26:AnimateSequence("ClanVariant")
		var_7_29:AnimateSequence("ClanVariant")
		var_7_32:AnimateSequence("ClanVariant")
		var_7_34:AnimateSequence("ClanVariant")
		var_7_36:AnimateSequence("ClanVariant")
		var_7_38:AnimateSequence("ClanVariant")
	end

	var_7_0._sequences.ClanVariant = var_7_388

	local var_7_389
	local var_7_390 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_390)

	local var_7_391 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_391)

	local var_7_392 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		}
	}

	var_7_8:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_392)

	local var_7_393 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_7_16:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_393)

	local var_7_394 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		}
	}

	var_7_24:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_394)

	local var_7_395 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_395)

	local var_7_396 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		}
	}

	var_7_29:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_396)

	local var_7_397 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_397)

	local var_7_398 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_7_34:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_398)

	local var_7_399 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_7_40:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_399)

	local var_7_400 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_7_42:RegisterAnimationSequence("LimitedTimeVariantFestiveFervor", var_7_400)

	local function var_7_401()
		var_7_4:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_6:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_8:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_16:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_24:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_26:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_29:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_32:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_34:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_40:AnimateSequence("LimitedTimeVariantFestiveFervor")
		var_7_42:AnimateSequence("LimitedTimeVariantFestiveFervor")
	end

	var_7_0._sequences.LimitedTimeVariantFestiveFervor = var_7_401

	local var_7_402
	local var_7_403 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_403)

	local var_7_404 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_404)

	local var_7_405 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.popupBackground
		}
	}

	var_7_8:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_405)

	local var_7_406 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Objective.iconDark
		}
	}

	var_7_16:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_406)

	local var_7_407 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_407)

	local var_7_408 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_408)

	local var_7_409 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		}
	}

	var_7_29:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_409)

	local var_7_410 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_410)

	local var_7_411 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		}
	}

	var_7_34:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_411)

	local var_7_412 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_412)

	local var_7_413 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_40:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_413)

	local var_7_414 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BattleNetBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_7_42:RegisterAnimationSequence("LimitedTimeVariantArmoredEvent", var_7_414)

	local function var_7_415()
		var_7_4:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_6:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_8:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_16:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_24:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_26:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_29:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_32:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_34:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_36:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_40:AnimateSequence("LimitedTimeVariantArmoredEvent")
		var_7_42:AnimateSequence("LimitedTimeVariantArmoredEvent")
	end

	var_7_0._sequences.LimitedTimeVariantArmoredEvent = var_7_415

	local var_7_416
	local var_7_417 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_417)

	local var_7_418 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_418)

	local var_7_419 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_7_8:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_419)

	local var_7_420 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_7_16:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_420)

	local var_7_421 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		}
	}

	var_7_24:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_421)

	local var_7_422 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_422)

	local var_7_423 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_423)

	local var_7_424 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_424)

	local var_7_425 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		}
	}

	var_7_34:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_425)

	local var_7_426 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_7_40:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_426)

	local var_7_427 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		}
	}

	var_7_42:RegisterAnimationSequence("LimitedTimeVariantMendota", var_7_427)

	local function var_7_428()
		var_7_4:AnimateSequence("LimitedTimeVariantMendota")
		var_7_6:AnimateSequence("LimitedTimeVariantMendota")
		var_7_8:AnimateSequence("LimitedTimeVariantMendota")
		var_7_16:AnimateSequence("LimitedTimeVariantMendota")
		var_7_24:AnimateSequence("LimitedTimeVariantMendota")
		var_7_26:AnimateSequence("LimitedTimeVariantMendota")
		var_7_29:AnimateSequence("LimitedTimeVariantMendota")
		var_7_32:AnimateSequence("LimitedTimeVariantMendota")
		var_7_34:AnimateSequence("LimitedTimeVariantMendota")
		var_7_40:AnimateSequence("LimitedTimeVariantMendota")
		var_7_42:AnimateSequence("LimitedTimeVariantMendota")
	end

	var_7_0._sequences.LimitedTimeVariantMendota = var_7_428

	local var_7_429
	local var_7_430 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen,
			child = var_7_0.LowerGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutCubic
		}
	}

	var_7_4:RegisterAnimationSequence("Cortez", var_7_430)

	local var_7_431 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Cortez", var_7_431)

	local var_7_432 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_7_8:RegisterAnimationSequence("Cortez", var_7_432)

	local var_7_433 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZIconTint
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			value = 0.3,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutCubic
		}
	}

	var_7_16:RegisterAnimationSequence("Cortez", var_7_433)

	local var_7_434 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZIconTint
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 170,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 212,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70,
			easing = LUI.EASING.snap
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28,
			easing = LUI.EASING.snap
		}
	}

	var_7_18:RegisterAnimationSequence("Cortez", var_7_434)

	local var_7_435 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("Cortez", var_7_435)

	local var_7_436 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Black
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		}
	}

	var_7_26:RegisterAnimationSequence("Cortez", var_7_436)

	local var_7_437 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("Cortez", var_7_437)

	local var_7_438 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_7_32:RegisterAnimationSequence("Cortez", var_7_438)

	local var_7_439 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZIconTint
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_34:RegisterAnimationSequence("Cortez", var_7_439)

	local var_7_440 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_40:RegisterAnimationSequence("Cortez", var_7_440)

	local function var_7_441()
		var_7_4:AnimateLoop("Cortez")
		var_7_6:AnimateLoop("Cortez")
		var_7_8:AnimateLoop("Cortez")
		var_7_16:AnimateLoop("Cortez")
		var_7_18:AnimateLoop("Cortez")
		var_7_24:AnimateLoop("Cortez")
		var_7_26:AnimateLoop("Cortez")
		var_7_29:AnimateLoop("Cortez")
		var_7_32:AnimateLoop("Cortez")
		var_7_34:AnimateLoop("Cortez")
		var_7_40:AnimateLoop("Cortez")
	end

	var_7_0._sequences.Cortez = var_7_441

	local var_7_442
	local var_7_443 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("RefreshTimerVariant", var_7_443)

	local var_7_444 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("RefreshTimerVariant", var_7_444)

	local var_7_445 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleBG
		}
	}

	var_7_8:RegisterAnimationSequence("RefreshTimerVariant", var_7_445)

	local var_7_446 = {
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

	var_7_16:RegisterAnimationSequence("RefreshTimerVariant", var_7_446)

	local var_7_447 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("RefreshTimerVariant", var_7_447)

	local var_7_448 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("RefreshTimerVariant", var_7_448)

	local var_7_449 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab
		}
	}

	var_7_29:RegisterAnimationSequence("RefreshTimerVariant", var_7_449)

	local var_7_450 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("RefreshTimerVariant", var_7_450)

	local var_7_451 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab
		}
	}

	var_7_34:RegisterAnimationSequence("RefreshTimerVariant", var_7_451)

	local var_7_452 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("RefreshTimerVariant", var_7_452)

	local var_7_453 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_7_40:RegisterAnimationSequence("RefreshTimerVariant", var_7_453)

	local var_7_454 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BattleNetBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		}
	}

	var_7_42:RegisterAnimationSequence("RefreshTimerVariant", var_7_454)

	local function var_7_455()
		var_7_4:AnimateSequence("RefreshTimerVariant")
		var_7_6:AnimateSequence("RefreshTimerVariant")
		var_7_8:AnimateSequence("RefreshTimerVariant")
		var_7_16:AnimateSequence("RefreshTimerVariant")
		var_7_24:AnimateSequence("RefreshTimerVariant")
		var_7_26:AnimateSequence("RefreshTimerVariant")
		var_7_29:AnimateSequence("RefreshTimerVariant")
		var_7_32:AnimateSequence("RefreshTimerVariant")
		var_7_34:AnimateSequence("RefreshTimerVariant")
		var_7_36:AnimateSequence("RefreshTimerVariant")
		var_7_40:AnimateSequence("RefreshTimerVariant")
		var_7_42:AnimateSequence("RefreshTimerVariant")
	end

	var_7_0._sequences.RefreshTimerVariant = var_7_455

	local var_7_456
	local var_7_457 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText,
			child = var_7_0.LowerGlow.Glow
		}
	}

	var_7_4:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_457)

	local var_7_458 = {
		{
			value = 13022573,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.UpperGlow.Glow
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_458)

	local var_7_459 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZContainerBackground
		}
	}

	var_7_8:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_459)

	local var_7_460 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Objective.iconDark
		}
	}

	var_7_16:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_460)

	local var_7_461 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_461)

	local var_7_462 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_462)

	local var_7_463 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_7_29:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_463)

	local var_7_464 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_32:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_464)

	local var_7_465 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_hvv_tab")
		}
	}

	var_7_34:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_465)

	local var_7_466 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_36:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_466)

	local var_7_467 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_40:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_467)

	local var_7_468 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BattleNetBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_7_42:RegisterAnimationSequence("LimitedTimeVariantHVV", var_7_468)

	local function var_7_469()
		var_7_4:AnimateSequence("LimitedTimeVariantHVV")
		var_7_6:AnimateSequence("LimitedTimeVariantHVV")
		var_7_8:AnimateSequence("LimitedTimeVariantHVV")
		var_7_16:AnimateSequence("LimitedTimeVariantHVV")
		var_7_24:AnimateSequence("LimitedTimeVariantHVV")
		var_7_26:AnimateSequence("LimitedTimeVariantHVV")
		var_7_29:AnimateSequence("LimitedTimeVariantHVV")
		var_7_32:AnimateSequence("LimitedTimeVariantHVV")
		var_7_34:AnimateSequence("LimitedTimeVariantHVV")
		var_7_36:AnimateSequence("LimitedTimeVariantHVV")
		var_7_40:AnimateSequence("LimitedTimeVariantHVV")
		var_7_42:AnimateSequence("LimitedTimeVariantHVV")
	end

	var_7_0._sequences.LimitedTimeVariantHVV = var_7_469

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("BattlePassFreeBanner", BattlePassFreeBanner)
LockTable(_M)
