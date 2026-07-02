module(..., package.seeall)

function LimitedTimeNotification(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 136 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "LimitedTimeNotification"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Backer"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_1_4:SetPixelGridEnabled(true)
	var_1_4:SetPixelGridContrast(0.5, 0)
	var_1_4:SetPixelGridBlockWidth(2, 0)
	var_1_4:SetPixelGridBlockHeight(2, 0)
	var_1_4:SetPixelGridGutterWidth(1, 0)
	var_1_4:SetPixelGridGutterHeight(1, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Backer = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Highlight"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Highlight = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "NewText"

	var_1_8:setText(Engine.CBBHFCGDIC("LUA_MENU/LIMITED_TIME"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Right)
	var_1_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_8:SetStartupDelay(2000)
	var_1_8:SetLineHoldTime(400)
	var_1_8:SetAnimMoveTime(2000)
	var_1_8:SetAnimMoveSpeed(150)
	var_1_8:SetEndDelay(2000)
	var_1_8:SetCrossfadeTime(250)
	var_1_8:SetFadeInTime(300)
	var_1_8:SetFadeOutTime(300)
	var_1_8:SetMaxVisibleLines(1)
	var_1_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 12, _1080p * -6, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_8)

	var_1_0.NewText = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "LimitedTimeIcon"

	var_1_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 11, _1080p * 35, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_10)

	var_1_0.LimitedTimeIcon = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12
	local var_1_13 = {
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
			value = _1080p * -78
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_1_4:RegisterAnimationSequence("AR", var_1_13)

	local var_1_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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

	var_1_6:RegisterAnimationSequence("AR", var_1_14)

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
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
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_1_8:RegisterAnimationSequence("AR", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("AR")
		var_1_6:AnimateSequence("AR")
		var_1_8:AnimateSequence("AR")
	end

	var_1_0._sequences.AR = var_1_16

	local var_1_17
	local var_1_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Off", var_1_18)

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Off", var_1_19)

	local function var_1_20()
		var_1_4:AnimateSequence("Off")
		var_1_8:AnimateSequence("Off")
	end

	var_1_0._sequences.Off = var_1_20

	local var_1_21
	local var_1_22 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 78
		}
	}

	var_1_4:RegisterAnimationSequence("LeftAligned", var_1_22)

	local var_1_23 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		}
	}

	var_1_6:RegisterAnimationSequence("LeftAligned", var_1_23)

	local var_1_24 = {
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
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_1_8:RegisterAnimationSequence("LeftAligned", var_1_24)

	local function var_1_25()
		var_1_4:AnimateSequence("LeftAligned")
		var_1_6:AnimateSequence("LeftAligned")
		var_1_8:AnimateSequence("LeftAligned")
	end

	var_1_0._sequences.LeftAligned = var_1_25

	local var_1_26
	local var_1_27 = {
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
			value = _1080p * -78
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_1_4:RegisterAnimationSequence("RightAligned", var_1_27)

	local var_1_28 = {
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
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -72
		}
	}

	var_1_6:RegisterAnimationSequence("RightAligned", var_1_28)

	local var_1_29 = {
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
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_1_8:RegisterAnimationSequence("RightAligned", var_1_29)

	local function var_1_30()
		var_1_4:AnimateSequence("RightAligned")
		var_1_6:AnimateSequence("RightAligned")
		var_1_8:AnimateSequence("RightAligned")
	end

	var_1_0._sequences.RightAligned = var_1_30

	local var_1_31
	local var_1_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 162
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

	var_1_4:RegisterAnimationSequence("ShowIcon", var_1_32)

	local var_1_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 157
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
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_1_8:RegisterAnimationSequence("ShowIcon", var_1_33)

	local var_1_34 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ShowIcon", var_1_34)

	local function var_1_35()
		var_1_4:AnimateSequence("ShowIcon")
		var_1_8:AnimateSequence("ShowIcon")
		var_1_10:AnimateSequence("ShowIcon")
	end

	var_1_0._sequences.ShowIcon = var_1_35

	local var_1_36
	local var_1_37 = {
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
			value = _1080p * -150
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_1_4:RegisterAnimationSequence("ARShowIcon", var_1_37)

	local var_1_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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

	var_1_6:RegisterAnimationSequence("ARShowIcon", var_1_38)

	local var_1_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -53
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
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_1_8:RegisterAnimationSequence("ARShowIcon", var_1_39)

	local var_1_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_1_10:RegisterAnimationSequence("ARShowIcon", var_1_40)

	local function var_1_41()
		var_1_4:AnimateSequence("ARShowIcon")
		var_1_6:AnimateSequence("ARShowIcon")
		var_1_8:AnimateSequence("ARShowIcon")
		var_1_10:AnimateSequence("ARShowIcon")
	end

	var_1_0._sequences.ARShowIcon = var_1_41

	return var_1_0
end

MenuBuilder.registerType("LimitedTimeNotification", LimitedTimeNotification)
LockTable(_M)
