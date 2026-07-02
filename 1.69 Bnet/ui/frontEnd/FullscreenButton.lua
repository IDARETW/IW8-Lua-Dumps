module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = "button_right_stick"
	local var_1_1 = {
		{
			keyprompt_text = CoD.GetTextForButton(var_1_0),
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN"),
			button_ref = var_1_0
		}
	}
	local var_1_2 = {
		promptsData = var_1_1
	}

	arg_1_0:AddTooltipData(arg_1_1, var_1_2)
end

function FullscreenButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_2_0.id = "FullscreenButton"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_4:SetRGBFromInt(0, 0)
	var_2_4:SetAlpha(0.4, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 0
	}
	local var_2_7 = LUI.UIBorder.new(var_2_6)

	var_2_7.id = "UpperLeft"

	var_2_7:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
	var_2_7:SetBorderThicknessLeft(_1080p * 2, 0)
	var_2_7:SetBorderThicknessRight(_1080p * 0, 0)
	var_2_7:SetBorderThicknessTop(_1080p * 2, 0)
	var_2_7:SetBorderThicknessBottom(_1080p * 0, 0)
	var_2_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 14, _1080p * 6, _1080p * 14)
	var_2_0:addElement(var_2_7)

	var_2_0.UpperLeft = var_2_7

	local var_2_8
	local var_2_9 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	}
	local var_2_10 = LUI.UIBorder.new(var_2_9)

	var_2_10.id = "LowerRight"

	var_2_10:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
	var_2_10:SetBorderThicknessLeft(_1080p * 0, 0)
	var_2_10:SetBorderThicknessRight(_1080p * 2, 0)
	var_2_10:SetBorderThicknessTop(_1080p * 0, 0)
	var_2_10:SetBorderThicknessBottom(_1080p * 2, 0)
	var_2_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -14, _1080p * -6, _1080p * -14, _1080p * -6)
	var_2_0:addElement(var_2_10)

	var_2_0.LowerRight = var_2_10

	local var_2_11
	local var_2_12 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 0
	}
	local var_2_13 = LUI.UIBorder.new(var_2_12)

	var_2_13.id = "UpperRight"

	var_2_13:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
	var_2_13:SetBorderThicknessLeft(_1080p * 0, 0)
	var_2_13:SetBorderThicknessRight(_1080p * 2, 0)
	var_2_13:SetBorderThicknessTop(_1080p * 2, 0)
	var_2_13:SetBorderThicknessBottom(_1080p * 0, 0)
	var_2_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -14, _1080p * -6, _1080p * 6, _1080p * 14)
	var_2_0:addElement(var_2_13)

	var_2_0.UpperRight = var_2_13

	local var_2_14
	local var_2_15 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	}
	local var_2_16 = LUI.UIBorder.new(var_2_15)

	var_2_16.id = "LowerLeft"

	var_2_16:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
	var_2_16:SetBorderThicknessLeft(_1080p * 2, 0)
	var_2_16:SetBorderThicknessRight(_1080p * 0, 0)
	var_2_16:SetBorderThicknessTop(_1080p * 0, 0)
	var_2_16:SetBorderThicknessBottom(_1080p * 2, 0)
	var_2_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 6, _1080p * 14, _1080p * -14, _1080p * -6)
	var_2_0:addElement(var_2_16)

	var_2_0.LowerLeft = var_2_16

	local function var_2_17()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_17

	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 14
		},
		{
			value = 12632256,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			value = 16777215,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_7:RegisterAnimationSequence("Focus", var_2_18)

	local var_2_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		},
		{
			value = 12632256,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			value = 16777215,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_10:RegisterAnimationSequence("Focus", var_2_19)

	local var_2_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		},
		{
			value = 12632256,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			value = 16777215,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_13:RegisterAnimationSequence("Focus", var_2_20)

	local var_2_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 14
		},
		{
			value = 12632256,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			value = 16777215,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_16:RegisterAnimationSequence("Focus", var_2_21)

	local function var_2_22()
		var_2_7:AnimateSequence("Focus")
		var_2_10:AnimateSequence("Focus")
		var_2_13:AnimateSequence("Focus")
		var_2_16:AnimateSequence("Focus")
	end

	var_2_0._sequences.Focus = var_2_22

	local var_2_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			value = 12632256,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_7:RegisterAnimationSequence("UnFocus", var_2_23)

	local var_2_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			value = 12632256,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_10:RegisterAnimationSequence("UnFocus", var_2_24)

	local var_2_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			value = 12632256,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_13:RegisterAnimationSequence("UnFocus", var_2_25)

	local var_2_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			value = 12632256,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_16:RegisterAnimationSequence("UnFocus", var_2_26)

	local function var_2_27()
		var_2_7:AnimateSequence("UnFocus")
		var_2_10:AnimateSequence("UnFocus")
		var_2_13:AnimateSequence("UnFocus")
		var_2_16:AnimateSequence("UnFocus")
	end

	var_2_0._sequences.UnFocus = var_2_27

	local var_2_28 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = -0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_2_7:RegisterAnimationSequence("Maximized", var_2_28)

	local var_2_29 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			value = -0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_2_10:RegisterAnimationSequence("Maximized", var_2_29)

	local var_2_30 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			value = -0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_2_13:RegisterAnimationSequence("Maximized", var_2_30)

	local var_2_31 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		},
		{
			value = -0.04,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_2_16:RegisterAnimationSequence("Maximized", var_2_31)

	local function var_2_32()
		var_2_7:AnimateSequence("Maximized")
		var_2_10:AnimateSequence("Maximized")
		var_2_13:AnimateSequence("Maximized")
		var_2_16:AnimateSequence("Maximized")
	end

	var_2_0._sequences.Maximized = var_2_32

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("FullscreenButton", FullscreenButton)
LockTable(_M)
