module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.PurchaseText)
	assert(arg_1_0.SecondaryText)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_1_0, "Expanded")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_1_0, "Contracted")
	end)
end

function MainMenuBladePromptButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 422 * _1080p, 0, 130 * _1080p)

	var_4_0.id = "MainMenuBladePromptButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "ButtonGradient"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetPixelGridEnabled(true)
	var_4_4:SetPixelGridContrast(0.5, 0)
	var_4_4:SetPixelGridBlockWidth(2, 0)
	var_4_4:SetPixelGridBlockHeight(2, 0)
	var_4_4:SetPixelGridGutterWidth(1, 0)
	var_4_4:SetPixelGridGutterHeight(1, 0)
	var_4_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -528, _1080p * 528, _1080p * -65, _1080p * 65)
	var_4_0:addElement(var_4_4)

	var_4_0.ButtonGradient = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Backer"

	var_4_6:SetRGBFromTable(SWATCHES.AAR.EnemyDarkRed, 0)
	var_4_6:SetAlpha(0.9, 0)
	var_4_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * -65, _1080p * 65)
	var_4_0:addElement(var_4_6)

	var_4_0.Backer = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "TextureLayer"

	var_4_8:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_4_8:SetAlpha(0.1, 0)
	var_4_8:SetPixelGridEnabled(true)
	var_4_8:SetPixelGridContrast(0.8, 0)
	var_4_8:SetPixelGridBlockWidth(2, 0)
	var_4_8:SetPixelGridBlockHeight(2, 0)
	var_4_8:SetPixelGridGutterWidth(1, 0)
	var_4_8:SetPixelGridGutterHeight(1, 0)
	var_4_8:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * -65, _1080p * 65)
	var_4_0:addElement(var_4_8)

	var_4_0.TextureLayer = var_4_8

	local var_4_9
	local var_4_10 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_11 = LUI.UIBorder.new(var_4_10)

	var_4_11.id = "Line"

	var_4_11:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_4_11:SetBorderThicknessLeft(_1080p * 0, 0)
	var_4_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_4_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * -65, _1080p * 65)
	var_4_0:addElement(var_4_11)

	var_4_0.Line = var_4_11

	local var_4_12
	local var_4_13 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_4_1
	})

	var_4_13.id = "ButtonGlowBottom"

	var_4_13:SetAlpha(0, 0)
	var_4_13.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * 50, _1080p * 65)
	var_4_0:addElement(var_4_13)

	var_4_0.ButtonGlowBottom = var_4_13

	local var_4_14
	local var_4_15 = LUI.UIImage.new()

	var_4_15.id = "HighlightBottom"

	var_4_15:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_4_15:SetAlpha(0.2, 0)
	var_4_15:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * 25, _1080p * 65)
	var_4_0:addElement(var_4_15)

	var_4_0.HighlightBottom = var_4_15

	local var_4_16
	local var_4_17 = LUI.UIStyledText.new()

	var_4_17.id = "PurchaseText"

	var_4_17:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_4_17:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"), 0)
	var_4_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_17:SetWordWrap(false)
	var_4_17:SetAlignment(LUI.Alignment.Center)
	var_4_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * -18, _1080p * 18)
	var_4_0:addElement(var_4_17)

	var_4_0.PurchaseText = var_4_17

	local var_4_18
	local var_4_19 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_4_1
	})

	var_4_19.id = "ButtonGlowTop"

	var_4_19:SetAlpha(0, 0)
	var_4_19.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * -65, _1080p * -49)
	var_4_0:addElement(var_4_19)

	var_4_0.ButtonGlowTop = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIImage.new()

	var_4_21.id = "LogoMW"

	var_4_21:SetAlpha(0.1, 0)
	var_4_21:setImage(RegisterMaterial("gamma_logo_cod_iw8"), 0)
	var_4_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -159, _1080p * 159, _1080p * -159, _1080p * 159)
	var_4_0:addElement(var_4_21)

	var_4_0.LogoMW = var_4_21

	local var_4_22
	local var_4_23 = LUI.UIImage.new()

	var_4_23.id = "SecondaryTextBackground"

	var_4_23:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_4_23:SetAlpha(0, 0)
	var_4_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * -65, _1080p * -35)
	var_4_0:addElement(var_4_23)

	var_4_0.SecondaryTextBackground = var_4_23

	local var_4_24
	local var_4_25 = LUI.UIText.new()

	var_4_25.id = "SecondaryText"

	var_4_25:SetRGBFromTable(SWATCHES.loot.legendaryDisabled, 0)
	var_4_25:SetAlpha(0, 0)
	var_4_25:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ON_SALE_NOW")), 0)
	var_4_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_25:SetWordWrap(false)
	var_4_25:SetTracking(2 * _1080p, 0)
	var_4_25:SetAlignment(LUI.Alignment.Center)
	var_4_25:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_25:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * -65, _1080p * -35)
	var_4_0:addElement(var_4_25)

	var_4_0.SecondaryText = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_27)

	local var_4_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_28)

	local var_4_29 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.background
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_8:RegisterAnimationSequence("DefaultSequence", var_4_29)

	local var_4_30 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		}
	}

	var_4_11:RegisterAnimationSequence("DefaultSequence", var_4_30)

	local var_4_31 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_13:RegisterAnimationSequence("DefaultSequence", var_4_31)

	local var_4_32 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("DefaultSequence", var_4_32)

	local var_4_33 = {
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_17:RegisterAnimationSequence("DefaultSequence", var_4_33)

	local var_4_34 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_19:RegisterAnimationSequence("DefaultSequence", var_4_34)

	local var_4_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("DefaultSequence", var_4_35)

	local var_4_36 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_23:RegisterAnimationSequence("DefaultSequence", var_4_36)

	local var_4_37 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_25:RegisterAnimationSequence("DefaultSequence", var_4_37)

	local function var_4_38()
		var_4_4:AnimateSequence("DefaultSequence")
		var_4_6:AnimateSequence("DefaultSequence")
		var_4_8:AnimateSequence("DefaultSequence")
		var_4_11:AnimateSequence("DefaultSequence")
		var_4_13:AnimateSequence("DefaultSequence")
		var_4_15:AnimateSequence("DefaultSequence")
		var_4_17:AnimateSequence("DefaultSequence")
		var_4_19:AnimateSequence("DefaultSequence")
		var_4_21:AnimateSequence("DefaultSequence")
		var_4_23:AnimateSequence("DefaultSequence")
		var_4_25:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_38

	local var_4_39
	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("Expanded", var_4_40)

	local var_4_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.EnemyDarkRed
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_6:RegisterAnimationSequence("Expanded", var_4_41)

	local var_4_42 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.background
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleTextHighlight
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_8:RegisterAnimationSequence("Expanded", var_4_42)

	local var_4_43 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationHighlight
		}
	}

	var_4_11:RegisterAnimationSequence("Expanded", var_4_43)

	local var_4_44 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_13:RegisterAnimationSequence("Expanded", var_4_44)

	local var_4_45 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationHighlight
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("Expanded", var_4_45)

	local var_4_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_17:RegisterAnimationSequence("Expanded", var_4_46)

	local var_4_47 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_19:RegisterAnimationSequence("Expanded", var_4_47)

	local var_4_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Expanded", var_4_48)

	local var_4_49 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_23:RegisterAnimationSequence("Expanded", var_4_49)

	local var_4_50 = {
		{
			value = 0.67,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_25:RegisterAnimationSequence("Expanded", var_4_50)

	local function var_4_51()
		var_4_4:AnimateSequence("Expanded")
		var_4_6:AnimateSequence("Expanded")
		var_4_8:AnimateSequence("Expanded")
		var_4_11:AnimateSequence("Expanded")
		var_4_13:AnimateSequence("Expanded")
		var_4_15:AnimateSequence("Expanded")
		var_4_17:AnimateSequence("Expanded")
		var_4_19:AnimateSequence("Expanded")
		var_4_21:AnimateSequence("Expanded")
		var_4_23:AnimateSequence("Expanded")
		var_4_25:AnimateSequence("Expanded")
	end

	var_4_0._sequences.Expanded = var_4_51

	local var_4_52
	local var_4_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("Contracted", var_4_53)

	local var_4_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.EnemyDarkRed
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_6:RegisterAnimationSequence("Contracted", var_4_54)

	local var_4_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.BundleTextHighlight
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.3,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.background
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_8:RegisterAnimationSequence("Contracted", var_4_55)

	local var_4_56 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationHighlight
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTexture
		}
	}

	var_4_11:RegisterAnimationSequence("Contracted", var_4_56)

	local var_4_57 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_13:RegisterAnimationSequence("Contracted", var_4_57)

	local var_4_58 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("Contracted", var_4_58)

	local var_4_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.55,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.55,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		}
	}

	var_4_17:RegisterAnimationSequence("Contracted", var_4_59)

	local var_4_60 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_19:RegisterAnimationSequence("Contracted", var_4_60)

	local var_4_61 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Contracted", var_4_61)

	local var_4_62 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.65,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_23:RegisterAnimationSequence("Contracted", var_4_62)

	local var_4_63 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.67,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.37,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_25:RegisterAnimationSequence("Contracted", var_4_63)

	local function var_4_64()
		var_4_4:AnimateSequence("Contracted")
		var_4_6:AnimateSequence("Contracted")
		var_4_8:AnimateSequence("Contracted")
		var_4_11:AnimateSequence("Contracted")
		var_4_13:AnimateSequence("Contracted")
		var_4_15:AnimateSequence("Contracted")
		var_4_17:AnimateSequence("Contracted")
		var_4_19:AnimateSequence("Contracted")
		var_4_21:AnimateSequence("Contracted")
		var_4_23:AnimateSequence("Contracted")
		var_4_25:AnimateSequence("Contracted")
	end

	var_4_0._sequences.Contracted = var_4_64

	local var_4_65
	local var_4_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 525,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -288
		},
		{
			duration = 525,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		},
		{
			value = 0.5,
			duration = 525,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 2125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2125,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -457,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 2125,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 457,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 375,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -288
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		},
		{
			value = 0.5,
			duration = 2125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 175,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		},
		{
			duration = 175,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -288
		},
		{
			value = 0,
			duration = 175,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("GlowPulse", var_4_66)

	local var_4_67 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 525,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.45,
			duration = 375,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 2125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 175,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("GlowPulse", var_4_67)

	local var_4_68 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 525,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.35,
			duration = 2125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.35,
			duration = 375,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 2125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 175,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("GlowPulse", var_4_68)

	local function var_4_69()
		var_4_4:AnimateLoop("GlowPulse")
		var_4_8:AnimateLoop("GlowPulse")
		var_4_15:AnimateLoop("GlowPulse")
	end

	var_4_0._sequences.GlowPulse = var_4_69

	local var_4_70
	local var_4_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35.5
		}
	}

	var_4_11:RegisterAnimationSequence("OnSale", var_4_71)

	local var_4_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_4_17:RegisterAnimationSequence("OnSale", var_4_72)

	local var_4_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 174
		}
	}

	var_4_21:RegisterAnimationSequence("OnSale", var_4_73)

	local var_4_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("OnSale", var_4_74)

	local var_4_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_25:RegisterAnimationSequence("OnSale", var_4_75)

	local function var_4_76()
		var_4_11:AnimateSequence("OnSale")
		var_4_17:AnimateSequence("OnSale")
		var_4_21:AnimateSequence("OnSale")
		var_4_23:AnimateSequence("OnSale")
		var_4_25:AnimateSequence("OnSale")
	end

	var_4_0._sequences.OnSale = var_4_76

	var_0_0(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("MainMenuBladePromptButton", MainMenuBladePromptButton)
LockTable(_M)
