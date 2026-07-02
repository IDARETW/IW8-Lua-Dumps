module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.ButtonImage)

	local function var_1_0(arg_2_0, arg_2_1)
		if LUI.IsLastInputKeyboardMouse(arg_2_1.controllerIndex) then
			arg_2_0.ButtonImage:SetAlpha(0)
		else
			arg_2_0.ButtonImage:SetAlpha(1)
		end
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_0, {
		controllerIndex = arg_1_1
	})
end

function OperatorSuperfactionSwitch(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 116 * _1080p)

	var_3_0.id = "OperatorSuperfactionSwitch"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.4, 0)
	var_3_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 100, _1080p * 579, _1080p * -24, _1080p * 25)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Bottom"

	var_3_6:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_3_6:SetAlpha(0.55, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 100, _1080p * 560, _1080p * 25, _1080p * 26)
	var_3_0:addElement(var_3_6)

	var_3_0.Bottom = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "StyledLabel"

	var_3_8:SetAlpha(0.7, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 340, _1080p * 44, _1080p * 72)
	var_3_0:addElement(var_3_8)

	var_3_0.StyledLabel = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "ActiveOperator"

	var_3_10:setImage(RegisterMaterial("hud_icon_death_sm"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 50, _1080p * 100, _1080p * -25, _1080p * 25)
	var_3_0:addElement(var_3_10)

	var_3_0.ActiveOperator = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "ButtonImage"

	var_3_12:SetAlpha(0.7, 0)
	var_3_12:setImage(RegisterMaterial("button_shoulder_right"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 344, _1080p * 396, _1080p * 42, _1080p * 74)
	var_3_0:addElement(var_3_12)

	var_3_0.ButtonImage = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Arrows"

	var_3_14:SetAlpha(0.5, 0)
	var_3_14:SetScale(-0.2, 0)
	var_3_14:setImage(RegisterMaterial("ui_double_arrow"), 0)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 124, _1080p * 169, _1080p * -22, _1080p * 22)
	var_3_0:addElement(var_3_14)

	var_3_0.Arrows = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "Top"

	var_3_16:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_3_16:SetAlpha(0.55, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 100, _1080p * 560, _1080p * -25, _1080p * -24)
	var_3_0:addElement(var_3_16)

	var_3_0.Top = var_3_16

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18 = {
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
			value = _1080p * -579
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_right_to_left")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		}
	}

	var_3_4:RegisterAnimationSequence("East", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
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

	var_3_6:RegisterAnimationSequence("East", var_3_19)

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/WEST_OPERATORS")
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

	var_3_8:RegisterAnimationSequence("East", var_3_20)

	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -50
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

	var_3_10:RegisterAnimationSequence("East", var_3_21)

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -396
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -344
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_shoulder_left")
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

	var_3_12:RegisterAnimationSequence("East", var_3_22)

	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -169
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -124
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_3_14:RegisterAnimationSequence("East", var_3_23)

	local var_3_24 = {
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
			value = _1080p * -560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_3_16:RegisterAnimationSequence("East", var_3_24)

	local function var_3_25()
		var_3_4:AnimateSequence("East")
		var_3_6:AnimateSequence("East")
		var_3_8:AnimateSequence("East")
		var_3_10:AnimateSequence("East")
		var_3_12:AnimateSequence("East")
		var_3_14:AnimateSequence("East")
		var_3_16:AnimateSequence("East")
	end

	var_3_0._sequences.East = var_3_25

	local var_3_26 = {
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
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 579
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_left_to_right")
		}
	}

	var_3_4:RegisterAnimationSequence("West", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 560
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

	var_3_6:RegisterAnimationSequence("West", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 72
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
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/EAST_OPERATORS")
		}
	}

	var_3_8:RegisterAnimationSequence("West", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 100
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

	var_3_10:RegisterAnimationSequence("West", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 344
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 396
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 74
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
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("button_shoulder_right")
		}
	}

	var_3_12:RegisterAnimationSequence("West", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 169
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_3_14:RegisterAnimationSequence("West", var_3_31)

	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 560
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

	var_3_16:RegisterAnimationSequence("West", var_3_32)

	local function var_3_33()
		var_3_4:AnimateSequence("West")
		var_3_6:AnimateSequence("West")
		var_3_8:AnimateSequence("West")
		var_3_10:AnimateSequence("West")
		var_3_12:AnimateSequence("West")
		var_3_14:AnimateSequence("West")
		var_3_16:AnimateSequence("West")
	end

	var_3_0._sequences.West = var_3_33

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("OperatorSuperfactionSwitch", OperatorSuperfactionSwitch)
LockTable(_M)
