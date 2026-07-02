module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Shine:SetMask(arg_1_0.Mask)
	arg_1_0.Mask:SetAlpha(1)
end

function BattlePassButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_2_0.id = "BattlePassButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "LowerGlowHighlight"

	var_2_4:SetAlpha(0, 0)
	var_2_4.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -8, _1080p * 8)
	var_2_0:addElement(var_2_4)

	var_2_0.LowerGlowHighlight = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Backer"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_2_6:SetAlpha(0.5, 0)
	var_2_0:addElement(var_2_6)

	var_2_0.Backer = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "TextureLayer"

	var_2_8:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_2_8:SetAlpha(0.05, 0)
	var_2_8:SetPixelGridEnabled(true)
	var_2_8:SetPixelGridContrast(0.8, 0)
	var_2_8:SetPixelGridBlockWidth(2, 0)
	var_2_8:SetPixelGridBlockHeight(2, 0)
	var_2_8:SetPixelGridGutterWidth(1, 0)
	var_2_8:SetPixelGridGutterHeight(1, 0)
	var_2_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_2_0:addElement(var_2_8)

	var_2_0.TextureLayer = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "Glow"

	var_2_10:SetRGBFromTable(SWATCHES.BattlePass.PurchasedHighlight, 0)
	var_2_10:SetAlpha(0, 0)
	var_2_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_2_10:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_2_0:addElement(var_2_10)

	var_2_0.Glow = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIStyledText.new()

	var_2_12.id = "Text"

	var_2_12:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_2_12:setText("Testing", 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_12:SetStartupDelay(2000)
	var_2_12:SetLineHoldTime(400)
	var_2_12:SetAnimMoveTime(300)
	var_2_12:SetAnimMoveSpeed(50)
	var_2_12:SetEndDelay(1500)
	var_2_12:SetCrossfadeTime(750)
	var_2_12:SetFadeInTime(300)
	var_2_12:SetFadeOutTime(300)
	var_2_12:SetMaxVisibleLines(1)
	var_2_12:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_2_12:SetOutlineRGBFromInt(0, 0)
	var_2_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -12, _1080p * 12)
	var_2_0:addElement(var_2_12)

	var_2_0.Text = var_2_12

	local var_2_13
	local var_2_14 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_2_15 = LUI.UIBorder.new(var_2_14)

	var_2_15.id = "Line"

	var_2_15:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_2_15:SetAlpha(0, 0)
	var_2_15:SetBorderThicknessLeft(_1080p * 0, 0)
	var_2_15:SetBorderThicknessRight(_1080p * 0, 0)
	var_2_15:SetBorderThicknessTop(_1080p * 0, 0)
	var_2_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 0)
	var_2_0:addElement(var_2_15)

	var_2_0.Line = var_2_15

	local var_2_16
	local var_2_17 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_2_1
	})

	var_2_17.id = "ButtonGlow"

	var_2_17:SetAlpha(0, 0)
	var_2_17.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_17:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -8, _1080p * 8)
	var_2_0:addElement(var_2_17)

	var_2_0.ButtonGlow = var_2_17

	local var_2_18
	local var_2_19 = LUI.UIImage.new()

	var_2_19.id = "Shine"

	var_2_19:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_2_19:SetAlpha(0, 0)
	var_2_19:SetZRotation(-45, 0)
	var_2_19:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_2_19:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_2_19:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -165, _1080p * -100, _1080p * -161, _1080p * 139)
	var_2_0:addElement(var_2_19)

	var_2_0.Shine = var_2_19

	local var_2_20
	local var_2_21 = LUI.UIImage.new()

	var_2_21.id = "Mask"

	var_2_21:SetAlpha(0, 0)
	var_2_21:setImage(RegisterMaterial("stencil_mask"), 0)
	var_2_0:addElement(var_2_21)

	var_2_0.Mask = var_2_21

	local function var_2_22()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_22

	local var_2_23
	local var_2_24 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonOver", var_2_24)

	local var_2_25 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.enemyTeamDark
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_25)

	local var_2_26 = {
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonOver", var_2_26)

	local var_2_27 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonOver", var_2_27)

	local var_2_28 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_15:RegisterAnimationSequence("ButtonOver", var_2_28)

	local var_2_29 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_17:RegisterAnimationSequence("ButtonOver", var_2_29)

	local function var_2_30()
		var_2_4:AnimateSequence("ButtonOver")
		var_2_6:AnimateSequence("ButtonOver")
		var_2_8:AnimateSequence("ButtonOver")
		var_2_12:AnimateSequence("ButtonOver")
		var_2_15:AnimateSequence("ButtonOver")
		var_2_17:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_30

	local var_2_31
	local var_2_32 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonUp", var_2_32)

	local var_2_33 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_33)

	local var_2_34 = {
		{
			value = 0.05,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUp", var_2_34)

	local var_2_35 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTitle
		}
	}

	var_2_12:RegisterAnimationSequence("ButtonUp", var_2_35)

	local var_2_36 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_15:RegisterAnimationSequence("ButtonUp", var_2_36)

	local var_2_37 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_17:RegisterAnimationSequence("ButtonUp", var_2_37)

	local function var_2_38()
		var_2_4:AnimateSequence("ButtonUp")
		var_2_6:AnimateSequence("ButtonUp")
		var_2_8:AnimateSequence("ButtonUp")
		var_2_12:AnimateSequence("ButtonUp")
		var_2_15:AnimateSequence("ButtonUp")
		var_2_17:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_38

	local var_2_39
	local var_2_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("AnimateGlow", var_2_40)

	local function var_2_41()
		var_2_10:AnimateLoop("AnimateGlow")
	end

	var_2_0._sequences.AnimateGlow = var_2_41

	local var_2_42
	local var_2_43 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("StopGlow", var_2_43)

	local function var_2_44()
		var_2_10:AnimateSequence("StopGlow")
	end

	var_2_0._sequences.StopGlow = var_2_44

	local var_2_45
	local var_2_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
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
			value = _1080p * -161
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 139
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 165,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 165,
			easing = LUI.EASING.snap
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100,
			easing = LUI.EASING.snap
		}
	}

	var_2_19:RegisterAnimationSequence("Glint", var_2_46)

	local function var_2_47()
		var_2_19:AnimateLoop("Glint")
	end

	var_2_0._sequences.Glint = var_2_47

	local var_2_48
	local var_2_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_19:RegisterAnimationSequence("ButtonOverGlint", var_2_49)

	local function var_2_50()
		var_2_19:AnimateSequence("ButtonOverGlint")
	end

	var_2_0._sequences.ButtonOverGlint = var_2_50

	local var_2_51
	local var_2_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.PopupTitle
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_19:RegisterAnimationSequence("ButtonUpGlint", var_2_52)

	local function var_2_53()
		var_2_19:AnimateSequence("ButtonUpGlint")
	end

	var_2_0._sequences.ButtonUpGlint = var_2_53

	local var_2_54
	local var_2_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_2_12:RegisterAnimationSequence("LargerText", var_2_55)

	local function var_2_56()
		var_2_12:AnimateSequence("LargerText")
	end

	var_2_0._sequences.LargerText = var_2_56

	local var_2_57
	local var_2_58 = {
		{
			value = 0.3,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("LowGlow", var_2_58)

	local var_2_59 = {
		{
			value = 0.7,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("LowGlow", var_2_59)

	local var_2_60 = {
		{
			value = 0.1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("LowGlow", var_2_60)

	local var_2_61 = {
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_2_12:RegisterAnimationSequence("LowGlow", var_2_61)

	local var_2_62 = {
		{
			value = 0.2,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_15:RegisterAnimationSequence("LowGlow", var_2_62)

	local var_2_63 = {
		{
			value = 0.2,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_17:RegisterAnimationSequence("LowGlow", var_2_63)

	local function var_2_64()
		var_2_4:AnimateSequence("LowGlow")
		var_2_6:AnimateSequence("LowGlow")
		var_2_8:AnimateSequence("LowGlow")
		var_2_12:AnimateSequence("LowGlow")
		var_2_15:AnimateSequence("LowGlow")
		var_2_17:AnimateSequence("LowGlow")
	end

	var_2_0._sequences.LowGlow = var_2_64

	var_2_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
		ACTIONS.AnimateSequence(var_2_0, "LowGlow")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BattlePassButton", BattlePassButton)
LockTable(_M)
