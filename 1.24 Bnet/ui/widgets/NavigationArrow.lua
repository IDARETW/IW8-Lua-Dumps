module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = ""
	local var_1_1 = ""

	if arg_1_0 == LUI.BEARING.up then
		var_1_0 = "up"
		var_1_1 = "MovedUp"
	elseif arg_1_0 == LUI.BEARING.down then
		var_1_0 = "down"
		var_1_1 = "MovedDown"
	elseif arg_1_0 == LUI.BEARING.left then
		var_1_0 = "left"
		var_1_1 = "MovedLeft"
	elseif arg_1_0 == LUI.BEARING.right then
		var_1_0 = "right"
		var_1_1 = "MovedRight"
	end

	assert(var_1_0 ~= "")
	assert(var_1_1 ~= "")

	return var_1_0, var_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = 0

	if arg_2_1 == LUI.BEARING.down then
		var_2_0 = 180
	elseif arg_2_1 == LUI.BEARING.left then
		var_2_0 = 90
	elseif arg_2_1 == LUI.BEARING.right then
		var_2_0 = -90
	end

	arg_2_0.Arrow:SetZRotation(var_2_0)
end

function SetupArrow(arg_3_0, arg_3_1)
	assert(arg_3_1)

	local var_3_0, var_3_1 = var_0_0(arg_3_1)
	local var_3_2 = "grid_focus_" .. var_3_0 .. "_blocked"
	local var_3_3 = "grid_focus_" .. var_3_0 .. "_not_blocked"
	local var_3_4 = "grid_focus_" .. var_3_0 .. "_moved"

	arg_3_0:addEventHandler(var_3_2, function(arg_4_0, arg_4_1)
		arg_4_0:SetButtonDisabled(true)
	end)
	arg_3_0:addEventHandler(var_3_3, function(arg_5_0, arg_5_1)
		arg_5_0:SetButtonDisabled(false)
	end)
	arg_3_0:addEventHandler(var_3_4, function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0, var_3_1)
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0, "ButtonUpDisabled")
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_8_0, "ButtonOverDisabled")
	end)
	var_0_1(arg_3_0, arg_3_1)
	arg_3_0:setActionSFX(nil)
end

local function var_0_2(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.SetupArrow = SetupArrow

	function arg_9_0.AcceptsFocusType(arg_10_0, arg_10_1)
		return arg_10_1 == FocusType.MouseOver
	end
end

function NavigationArrow(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_11_0.id = "NavigationArrow"
	var_11_0._animationSets = {}
	var_11_0._sequences = {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Background"

	var_11_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_4:SetAlpha(0, 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_11_0:addElement(var_11_4)

	var_11_0.Background = var_11_4

	local var_11_5
	local var_11_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_11_7 = LUI.UIBorder.new(var_11_6)

	var_11_7.id = "Border"

	var_11_7:SetAlpha(0, 0)
	var_11_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_11_0:addElement(var_11_7)

	var_11_0.Border = var_11_7

	local var_11_8
	local var_11_9 = LUI.UIImage.new()

	var_11_9.id = "Arrow"

	var_11_9:SetAlpha(0.7, 0)
	var_11_9:setImage(RegisterMaterial("icon_option_arrow_up_down"), 0)
	var_11_0:addElement(var_11_9)

	var_11_0.Arrow = var_11_9

	local function var_11_10()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_10

	local var_11_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonOver", var_11_11)

	local var_11_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("ButtonOver", var_11_12)

	local var_11_13 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_9:RegisterAnimationSequence("ButtonOver", var_11_13)

	local function var_11_14()
		var_11_4:AnimateSequence("ButtonOver")
		var_11_7:AnimateSequence("ButtonOver")
		var_11_9:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_14

	local var_11_15 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonUp", var_11_15)

	local var_11_16 = {
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		}
	}

	var_11_7:RegisterAnimationSequence("ButtonUp", var_11_16)

	local var_11_17 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("ButtonUp", var_11_17)

	local function var_11_18()
		var_11_4:AnimateSequence("ButtonUp")
		var_11_7:AnimateSequence("ButtonUp")
		var_11_9:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_18

	local var_11_19 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_9:RegisterAnimationSequence("Disabled", var_11_19)

	local function var_11_20()
		var_11_9:AnimateSequence("Disabled")
	end

	var_11_0._sequences.Disabled = var_11_20

	local var_11_21 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("Enabled", var_11_21)

	local function var_11_22()
		var_11_9:AnimateSequence("Enabled")
	end

	var_11_0._sequences.Enabled = var_11_22

	local var_11_23 = {
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
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
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
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("MovedUp", var_11_23)

	local function var_11_24()
		var_11_9:AnimateSequence("MovedUp")
	end

	var_11_0._sequences.MovedUp = var_11_24

	local var_11_25 = {
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
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 3,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
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
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("MovedDown", var_11_25)

	local function var_11_26()
		var_11_9:AnimateSequence("MovedDown")
	end

	var_11_0._sequences.MovedDown = var_11_26

	local var_11_27 = {
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
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 90,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -3,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_9:RegisterAnimationSequence("MovedLeft", var_11_27)

	local function var_11_28()
		var_11_9:AnimateSequence("MovedLeft")
	end

	var_11_0._sequences.MovedLeft = var_11_28

	local var_11_29 = {
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
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -90,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 3,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_11_9:RegisterAnimationSequence("MovedRight", var_11_29)

	local function var_11_30()
		var_11_9:AnimateSequence("MovedRight")
	end

	var_11_0._sequences.MovedRight = var_11_30

	local var_11_31 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonOverDisabled", var_11_31)

	local var_11_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("ButtonOverDisabled", var_11_32)

	local function var_11_33()
		var_11_4:AnimateSequence("ButtonOverDisabled")
		var_11_7:AnimateSequence("ButtonOverDisabled")
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_33

	local var_11_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("ButtonUpDisabled", var_11_34)

	local function var_11_35()
		var_11_9:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_35

	var_11_0:addEventHandler("button_over", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "ButtonOver")
	end)
	var_11_0:addEventHandler("button_up", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "ButtonUp")
	end)
	var_11_0:addEventHandler("button_disable", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "Disabled")
	end)
	var_11_0:addEventHandler("button_over_disable", function(arg_26_0, arg_26_1)
		if not arg_26_1.controller then
			local var_26_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "Disabled")
	end)
	var_0_2(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("NavigationArrow", NavigationArrow)
LockTable(_M)
