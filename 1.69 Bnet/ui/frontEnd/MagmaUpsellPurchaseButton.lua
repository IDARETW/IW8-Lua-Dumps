module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Mask:SetAlpha(1)
	arg_1_0.Glint:SetMask(arg_1_0.Mask)
	ACTIONS.AnimateSequence(arg_1_0, "Shine")
	ACTIONS.AnimateSequence(arg_1_0, "GlowPulse")
end

function MagmaUpsellPurchaseButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 422 * _1080p, 0, 130 * _1080p)

	var_2_0.id = "MagmaUpsellPurchaseButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "ButtonGradient"

	var_2_4:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_4:SetAlpha(0.5, 0)
	var_2_4:SetPixelGridEnabled(true)
	var_2_4:SetPixelGridContrast(0.5, 0)
	var_2_4:SetPixelGridBlockWidth(2, 0)
	var_2_4:SetPixelGridBlockHeight(2, 0)
	var_2_4:SetPixelGridGutterWidth(1, 0)
	var_2_4:SetPixelGridGutterHeight(1, 0)
	var_2_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -528, _1080p * 528, _1080p * 1, _1080p * -2)
	var_2_0:addElement(var_2_4)

	var_2_0.ButtonGradient = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Backer"

	var_2_6:SetRGBFromTable(SWATCHES.AAR.EnemyDarkRed, 0)
	var_2_6:SetAlpha(0.9, 0)
	var_2_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -1)
	var_2_0:addElement(var_2_6)

	var_2_0.Backer = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "TextureLayer"

	var_2_8:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_2_8:SetAlpha(0.1, 0)
	var_2_8:SetPixelGridEnabled(true)
	var_2_8:SetPixelGridContrast(0.8, 0)
	var_2_8:SetPixelGridBlockWidth(2, 0)
	var_2_8:SetPixelGridBlockHeight(2, 0)
	var_2_8:SetPixelGridGutterWidth(1, 0)
	var_2_8:SetPixelGridGutterHeight(1, 0)
	var_2_8:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_2_0:addElement(var_2_8)

	var_2_0.TextureLayer = var_2_8

	local var_2_9
	local var_2_10 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_2_11 = LUI.UIBorder.new(var_2_10)

	var_2_11.id = "Line"

	var_2_11:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_2_11:SetBorderThicknessLeft(_1080p * 0, 0)
	var_2_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_2_11:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -1)
	var_2_0:addElement(var_2_11)

	var_2_0.Line = var_2_11

	local var_2_12
	local var_2_13 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_2_1
	})

	var_2_13.id = "ButtonGlowBottom"

	var_2_13:SetAlpha(0, 0)
	var_2_13.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_13:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -10, _1080p * 6)
	var_2_0:addElement(var_2_13)

	var_2_0.ButtonGlowBottom = var_2_13

	local var_2_14
	local var_2_15 = LUI.UIImage.new()

	var_2_15.id = "HighlightBottom"

	var_2_15:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_2_15:SetAlpha(0.2, 0)
	var_2_15:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_2_15:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -40, 0)
	var_2_0:addElement(var_2_15)

	var_2_0.HighlightBottom = var_2_15

	local var_2_16
	local var_2_17 = LUI.UIImage.new()

	var_2_17.id = "LogoMW"

	var_2_17:SetAlpha(0.1, 0)
	var_2_17:setImage(RegisterMaterial("gamma_logo_cod_iw8"), 0)
	var_2_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -159, _1080p * 159, _1080p * -159, _1080p * 158)
	var_2_0:addElement(var_2_17)

	var_2_0.LogoMW = var_2_17

	local var_2_18
	local var_2_19 = LUI.UIStyledText.new()

	var_2_19.id = "PurchaseText"

	var_2_19:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_2_19:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"), 0)
	var_2_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_19:SetWordWrap(false)
	var_2_19:SetAlignment(LUI.Alignment.Center)
	var_2_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_19:SetStartupDelay(2000)
	var_2_19:SetLineHoldTime(400)
	var_2_19:SetAnimMoveTime(2000)
	var_2_19:SetAnimMoveSpeed(150)
	var_2_19:SetEndDelay(2000)
	var_2_19:SetCrossfadeTime(250)
	var_2_19:SetFadeInTime(300)
	var_2_19:SetFadeOutTime(300)
	var_2_19:SetMaxVisibleLines(1)
	var_2_19:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -15, _1080p * 13)
	var_2_0:addElement(var_2_19)

	var_2_0.PurchaseText = var_2_19

	local var_2_20
	local var_2_21 = LUI.UIImage.new()

	var_2_21.id = "Glint"

	var_2_21:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_2_21:SetAlpha(0, 0)
	var_2_21:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_2_21:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_2_21:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_21)

	var_2_0.Glint = var_2_21

	local var_2_22
	local var_2_23 = LUI.UIImage.new()

	var_2_23.id = "Mask"

	var_2_23:SetAlpha(0, 0)
	var_2_23:setImage(RegisterMaterial("stencil_mask"), 0)
	var_2_0:addElement(var_2_23)

	var_2_0.Mask = var_2_23

	local var_2_24
	local var_2_25 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_2_1
	})

	var_2_25.id = "ButtonGlowTop"

	var_2_25:SetAlpha(0, 0)
	var_2_25.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_25:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -7, _1080p * 9)
	var_2_0:addElement(var_2_25)

	var_2_0.ButtonGlowTop = var_2_25

	local var_2_26
	local var_2_27 = LUI.UIImage.new()

	var_2_27.id = "TopBar"

	var_2_27:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_2_27:SetAlpha(0, 0)
	var_2_27:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -25, _1080p * 2)
	var_2_0:addElement(var_2_27)

	var_2_0.TopBar = var_2_27

	local var_2_28
	local var_2_29 = LUI.UIText.new()

	var_2_29.id = "Title"

	var_2_29:SetRGBFromTable(SWATCHES.loot.legendaryDisabled, 0)
	var_2_29:SetAlpha(0, 0)
	var_2_29:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUYMW_BLADE_INFOS")), 0)
	var_2_29:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_29:SetTracking(1 * _1080p, 0)
	var_2_29:SetAlignment(LUI.Alignment.Center)
	var_2_29:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -195, _1080p * 195, _1080p * -22, _1080p * -1)
	var_2_0:addElement(var_2_29)

	var_2_0.Title = var_2_29

	local function var_2_30()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_30

	local var_2_31
	local var_2_32 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -528
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 528
		},
		{
			duration = 1417,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -319,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 1417,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 319,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 1417,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1417,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -528
		},
		{
			duration = 1417,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 528
		},
		{
			value = 0.2,
			duration = 1167,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("GlowPulse", var_2_32)

	local function var_2_33()
		var_2_4:AnimateLoop("GlowPulse")
	end

	var_2_0._sequences.GlowPulse = var_2_33

	local var_2_34
	local var_2_35 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			value = 0,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 800,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 800,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 4200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_21:RegisterAnimationSequence("Shine", var_2_35)

	local function var_2_36()
		var_2_21:AnimateLoop("Shine")
	end

	var_2_0._sequences.Shine = var_2_36

	local var_2_37
	local var_2_38 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonOver", var_2_38)

	local var_2_39 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_13:RegisterAnimationSequence("ButtonOver", var_2_39)

	local var_2_40 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -56
		}
	}

	var_2_15:RegisterAnimationSequence("ButtonOver", var_2_40)

	local var_2_41 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_25:RegisterAnimationSequence("ButtonOver", var_2_41)

	local function var_2_42()
		var_2_8:AnimateSequence("ButtonOver")
		var_2_13:AnimateSequence("ButtonOver")
		var_2_15:AnimateSequence("ButtonOver")
		var_2_25:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_42

	local var_2_43
	local var_2_44 = {
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUp", var_2_44)

	local var_2_45 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_13:RegisterAnimationSequence("ButtonUp", var_2_45)

	local var_2_46 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_15:RegisterAnimationSequence("ButtonUp", var_2_46)

	local var_2_47 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_25:RegisterAnimationSequence("ButtonUp", var_2_47)

	local function var_2_48()
		var_2_8:AnimateSequence("ButtonUp")
		var_2_13:AnimateSequence("ButtonUp")
		var_2_15:AnimateSequence("ButtonUp")
		var_2_25:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_48

	local var_2_49
	local var_2_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("PurchaseBlade", var_2_50)

	local var_2_51 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_11:RegisterAnimationSequence("PurchaseBlade", var_2_51)

	local var_2_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_27:RegisterAnimationSequence("PurchaseBlade", var_2_52)

	local var_2_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_29:RegisterAnimationSequence("PurchaseBlade", var_2_53)

	local function var_2_54()
		var_2_4:AnimateSequence("PurchaseBlade")
		var_2_11:AnimateSequence("PurchaseBlade")
		var_2_27:AnimateSequence("PurchaseBlade")
		var_2_29:AnimateSequence("PurchaseBlade")
	end

	var_2_0._sequences.PurchaseBlade = var_2_54

	var_2_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("MagmaUpsellPurchaseButton", MagmaUpsellPurchaseButton)
LockTable(_M)
