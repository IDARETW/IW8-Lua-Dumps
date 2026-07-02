module(..., package.seeall)

function ClanTagButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "ClanTagButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericListArrowButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Background"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -50, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Text"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_6:SetAlpha(0.8, 0)
	var_1_6:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetOutlineRGBFromInt(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -65, _1080p * -13, _1080p * 13)
	var_1_0:addElement(var_1_6)

	var_1_0.Text = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -50
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
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_8)

	local var_1_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -45,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_6:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_10

	local var_1_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -50,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_11)

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -65,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_6:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_13

	local var_1_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Locked", var_1_14)

	local function var_1_15()
		var_1_6:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_15

	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.contentFocus
		}
	}

	var_1_6:RegisterAnimationSequence("NewNotification", var_1_16)

	local function var_1_17()
		var_1_6:AnimateSequence("NewNotification")
	end

	var_1_0._sequences.NewNotification = var_1_17

	local var_1_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -50
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
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOverDisabled", var_1_18)

	local var_1_19 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -45,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOverDisabled", var_1_19)

	local function var_1_20()
		var_1_4:AnimateSequence("ButtonOverDisabled")
		var_1_6:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_20

	local var_1_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -50,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUpDisabled", var_1_21)

	local var_1_22 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -65,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUpDisabled", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("ButtonUpDisabled")
		var_1_6:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_23

	var_1_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUpDisabled")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOverDisabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("ClanTagButton", ClanTagButton)
LockTable(_M)
