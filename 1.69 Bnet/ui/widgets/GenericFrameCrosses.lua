module(..., package.seeall)

function GenericFrameCrosses(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_1_0.id = "GenericFrameCrosses"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "TopLeftCross"

	var_1_4:setImage(RegisterMaterial("hud_frame_cross_sm"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4)
	var_1_0:addElement(var_1_4)

	var_1_0.TopLeftCross = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "TopRightCross"

	var_1_6:setImage(RegisterMaterial("hud_frame_cross_sm"), 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4)
	var_1_0:addElement(var_1_6)

	var_1_0.TopRightCross = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "BottomLeftCross"

	var_1_8:setImage(RegisterMaterial("hud_frame_cross_sm"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4)
	var_1_0:addElement(var_1_8)

	var_1_0.BottomLeftCross = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "BottomRightCross"

	var_1_10:setImage(RegisterMaterial("hud_frame_cross_sm"), 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4)
	var_1_0:addElement(var_1_10)

	var_1_0.BottomRightCross = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75.5
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("VisibleIcon", var_1_12)

	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75.5
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 592
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 608
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("VisibleIcon", var_1_13)

	local var_1_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75.5
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_8:RegisterAnimationSequence("VisibleIcon", var_1_14)

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75.5
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 592
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 608
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_10:RegisterAnimationSequence("VisibleIcon", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("VisibleIcon")
		var_1_6:AnimateSequence("VisibleIcon")
		var_1_8:AnimateSequence("VisibleIcon")
		var_1_10:AnimateSequence("VisibleIcon")
	end

	var_1_0._sequences.VisibleIcon = var_1_16

	local var_1_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75.5
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("VisibleNoIcon", var_1_17)

	local var_1_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75.5
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 592
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 608
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("VisibleNoIcon", var_1_18)

	local var_1_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75.5
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_8:RegisterAnimationSequence("VisibleNoIcon", var_1_19)

	local var_1_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75.5
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 592
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 608
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_10:RegisterAnimationSequence("VisibleNoIcon", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("VisibleNoIcon")
		var_1_6:AnimateSequence("VisibleNoIcon")
		var_1_8:AnimateSequence("VisibleNoIcon")
		var_1_10:AnimateSequence("VisibleNoIcon")
	end

	var_1_0._sequences.VisibleNoIcon = var_1_21

	local var_1_22 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Hidden", var_1_22)

	local var_1_23 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Hidden", var_1_23)

	local var_1_24 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Hidden", var_1_24)

	local var_1_25 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 308
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Hidden", var_1_25)

	local function var_1_26()
		var_1_4:AnimateSequence("Hidden")
		var_1_6:AnimateSequence("Hidden")
		var_1_8:AnimateSequence("Hidden")
		var_1_10:AnimateSequence("Hidden")
	end

	var_1_0._sequences.Hidden = var_1_26

	return var_1_0
end

MenuBuilder.registerType("GenericFrameCrosses", GenericFrameCrosses)
LockTable(_M)
