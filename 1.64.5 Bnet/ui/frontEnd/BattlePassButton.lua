module(..., package.seeall)

local function var_0_0(arg_1_0)
	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_1_0.Text:SetFont(FONTS.GetFont(arg_1_0._isFocused and FONTS.MainBold.File or FONTS.MainRegular.File))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Shine:SetMask(arg_2_0.Mask)
	arg_2_0.Mask:SetAlpha(1)

	arg_2_0.ToggleFont = var_0_0

	arg_2_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		arg_3_0._isFocused = false

		ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
		arg_3_0:ToggleFont()
	end)
	arg_2_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		arg_4_0._isFocused = true

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		arg_4_0:ToggleFont()
	end)

	if CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function BattlePassButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_5_0.id = "BattlePassButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LowerGlowHighlight"

	var_5_4:SetAlpha(0, 0)
	var_5_4.Glow:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -8, _1080p * 8)
	var_5_0:addElement(var_5_4)

	var_5_0.LowerGlowHighlight = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Backer"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_6:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Backer = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Glow"

	var_5_8:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_8:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_5_0:addElement(var_5_8)

	var_5_0.Glow = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "Text"

	var_5_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_10:SetAlpha(0.5, 0)
	var_5_10:setText("Testing", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_10:SetStartupDelay(2000)
	var_5_10:SetLineHoldTime(400)
	var_5_10:SetAnimMoveTime(300)
	var_5_10:SetAnimMoveSpeed(50)
	var_5_10:SetEndDelay(1500)
	var_5_10:SetCrossfadeTime(750)
	var_5_10:SetFadeInTime(300)
	var_5_10:SetFadeOutTime(300)
	var_5_10:SetMaxVisibleLines(1)
	var_5_10:SetShadowRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_5_10:SetOutlineRGBFromInt(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -13, _1080p * 11)
	var_5_0:addElement(var_5_10)

	var_5_0.Text = var_5_10

	local var_5_11
	local var_5_12 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_5_13 = LUI.UIBorder.new(var_5_12)

	var_5_13.id = "Line"

	var_5_13:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_5_13:SetAlpha(0.5, 0)
	var_5_13:SetBorderThicknessLeft(_1080p * 0, 0)
	var_5_13:SetBorderThicknessRight(_1080p * 0, 0)
	var_5_13:SetBorderThicknessTop(_1080p * 0, 0)
	var_5_13:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_13)

	var_5_0.Line = var_5_13

	local var_5_14
	local var_5_15 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_5_16 = LUI.UIBorder.new(var_5_15)

	var_5_16.id = "TopLine"

	var_5_16:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_5_16:SetAlpha(0.5, 0)
	var_5_16:SetBorderThicknessLeft(_1080p * 0, 0)
	var_5_16:SetBorderThicknessRight(_1080p * 0, 0)
	var_5_16:SetBorderThicknessTop(_1080p * 0, 0)
	var_5_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 1, _1080p * 1)
	var_5_0:addElement(var_5_16)

	var_5_0.TopLine = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "ButtonGlow"

	var_5_18:SetAlpha(0, 0)
	var_5_18.Glow:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_5_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -7, _1080p * 9)
	var_5_0:addElement(var_5_18)

	var_5_0.ButtonGlow = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "Shine"

	var_5_20:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_5_20:SetAlpha(0, 0)
	var_5_20:SetZRotation(-45, 0)
	var_5_20:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_5_20:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_5_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -165, _1080p * -100, _1080p * -161, _1080p * 139)
	var_5_0:addElement(var_5_20)

	var_5_0.Shine = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIImage.new()

	var_5_22.id = "Mask"

	var_5_22:SetAlpha(0, 0)
	var_5_22:setImage(RegisterMaterial("stencil_mask"), 0)
	var_5_0:addElement(var_5_22)

	var_5_0.Mask = var_5_22

	local function var_5_23()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_23

	local var_5_24
	local var_5_25 = {
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_25)

	local var_5_26 = {
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_26)

	local var_5_27 = {
		{
			value = 0.15,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_27)

	local var_5_28 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_28)

	local var_5_29 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_5_13:RegisterAnimationSequence("ButtonOver", var_5_29)

	local var_5_30 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonOver", var_5_30)

	local var_5_31 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ButtonOver", var_5_31)

	local function var_5_32()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_6:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
		var_5_10:AnimateSequence("ButtonOver")
		var_5_13:AnimateSequence("ButtonOver")
		var_5_16:AnimateSequence("ButtonOver")
		var_5_18:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_32

	local var_5_33
	local var_5_34 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_34)

	local var_5_35 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_36)

	local var_5_37 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_37)

	local var_5_38 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder
		}
	}

	var_5_13:RegisterAnimationSequence("ButtonUp", var_5_38)

	local var_5_39 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonUp", var_5_39)

	local var_5_40 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ButtonUp", var_5_40)

	local function var_5_41()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_6:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
		var_5_13:AnimateSequence("ButtonUp")
		var_5_16:AnimateSequence("ButtonUp")
		var_5_18:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_41

	local var_5_42
	local var_5_43 = {
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

	var_5_8:RegisterAnimationSequence("AnimateGlow", var_5_43)

	local function var_5_44()
		var_5_8:AnimateLoop("AnimateGlow")
	end

	var_5_0._sequences.AnimateGlow = var_5_44

	local var_5_45
	local var_5_46 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("StopGlow", var_5_46)

	local function var_5_47()
		var_5_8:AnimateSequence("StopGlow")
	end

	var_5_0._sequences.StopGlow = var_5_47

	local var_5_48
	local var_5_49 = {
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

	var_5_20:RegisterAnimationSequence("Glint", var_5_49)

	local function var_5_50()
		var_5_20:AnimateLoop("Glint")
	end

	var_5_0._sequences.Glint = var_5_50

	local var_5_51
	local var_5_52 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOverGlint", var_5_52)

	local var_5_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOverGlint", var_5_53)

	local var_5_54 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonOverGlint", var_5_54)

	local function var_5_55()
		var_5_8:AnimateSequence("ButtonOverGlint")
		var_5_10:AnimateSequence("ButtonOverGlint")
		var_5_20:AnimateSequence("ButtonOverGlint")
	end

	var_5_0._sequences.ButtonOverGlint = var_5_55

	local var_5_56
	local var_5_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUpGlint", var_5_57)

	local var_5_58 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonUpGlint", var_5_58)

	local function var_5_59()
		var_5_8:AnimateSequence("ButtonUpGlint")
		var_5_20:AnimateSequence("ButtonUpGlint")
	end

	var_5_0._sequences.ButtonUpGlint = var_5_59

	local var_5_60
	local var_5_61 = {
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

	var_5_10:RegisterAnimationSequence("LargerText", var_5_61)

	local function var_5_62()
		var_5_10:AnimateSequence("LargerText")
	end

	var_5_0._sequences.LargerText = var_5_62

	local var_5_63
	local var_5_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight,
			child = var_5_0.LowerGlowHighlight.Glow
		},
		{
			value = 0.1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("LowGlow", var_5_64)

	local function var_5_65()
		var_5_4:AnimateSequence("LowGlow")
	end

	var_5_0._sequences.LowGlow = var_5_65

	local var_5_66
	local var_5_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		}
	}

	var_5_10:RegisterAnimationSequence("VIPButton", var_5_67)

	local function var_5_68()
		var_5_10:AnimateSequence("VIPButton")
	end

	var_5_0._sequences.VIPButton = var_5_68

	local var_5_69
	local var_5_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		}
	}

	var_5_10:RegisterAnimationSequence("AR", var_5_70)

	local function var_5_71()
		var_5_10:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_71

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassButton", BattlePassButton)
LockTable(_M)
