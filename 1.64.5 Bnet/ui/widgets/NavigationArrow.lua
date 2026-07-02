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
	var_0_1(arg_3_0, arg_3_1)
	arg_3_0:setActionSFX(nil)
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.SetupArrow = SetupArrow

	function arg_7_0.AcceptsFocusType(arg_8_0, arg_8_1)
		return arg_8_1 == FocusType.MouseOver
	end

	arg_7_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		WZWIP.AnimateThemeElement(arg_9_0, "ButtonOver")
	end)
	arg_7_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		WZWIP.AnimateThemeElement(arg_10_0, "ButtonUp")
	end)
	arg_7_0:addEventHandler("button_disable", function(arg_11_0, arg_11_1)
		WZWIP.AnimateThemeElement(arg_11_0, "Disabled")
	end)
	arg_7_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		WZWIP.AnimateThemeElement(arg_12_0, "Disabled")
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_7_0, "WZWipSetup")
	end
end

function NavigationArrow(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIButton.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_13_0.id = "NavigationArrow"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Background"

	var_13_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_13_4:SetAlpha(0, 0)
	var_13_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_13_7 = LUI.UIBorder.new(var_13_6)

	var_13_7.id = "Border"

	var_13_7:SetAlpha(0, 0)
	var_13_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_13_0:addElement(var_13_7)

	var_13_0.Border = var_13_7

	local var_13_8
	local var_13_9 = LUI.UIImage.new()

	var_13_9.id = "Arrow"

	var_13_9:SetAlpha(0.7, 0)
	var_13_9:setImage(RegisterMaterial("icon_option_arrow_up_down"), 0)
	var_13_0:addElement(var_13_9)

	var_13_0.Arrow = var_13_9

	local function var_13_10()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_10

	local var_13_11
	local var_13_12 = {
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

	var_13_4:RegisterAnimationSequence("ButtonOver", var_13_12)

	local var_13_13 = {
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

	var_13_7:RegisterAnimationSequence("ButtonOver", var_13_13)

	local var_13_14 = {
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

	var_13_9:RegisterAnimationSequence("ButtonOver", var_13_14)

	local function var_13_15()
		var_13_4:AnimateSequence("ButtonOver")
		var_13_7:AnimateSequence("ButtonOver")
		var_13_9:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_15

	local var_13_16
	local var_13_17 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonUp", var_13_17)

	local var_13_18 = {
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

	var_13_7:RegisterAnimationSequence("ButtonUp", var_13_18)

	local var_13_19 = {
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

	var_13_9:RegisterAnimationSequence("ButtonUp", var_13_19)

	local function var_13_20()
		var_13_4:AnimateSequence("ButtonUp")
		var_13_7:AnimateSequence("ButtonUp")
		var_13_9:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_20

	local var_13_21
	local var_13_22 = {
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

	var_13_9:RegisterAnimationSequence("Disabled", var_13_22)

	local function var_13_23()
		var_13_9:AnimateSequence("Disabled")
	end

	var_13_0._sequences.Disabled = var_13_23

	local var_13_24
	local var_13_25 = {
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

	var_13_9:RegisterAnimationSequence("Enabled", var_13_25)

	local function var_13_26()
		var_13_9:AnimateSequence("Enabled")
	end

	var_13_0._sequences.Enabled = var_13_26

	local var_13_27
	local var_13_28 = {
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

	var_13_9:RegisterAnimationSequence("MovedUp", var_13_28)

	local function var_13_29()
		var_13_9:AnimateSequence("MovedUp")
	end

	var_13_0._sequences.MovedUp = var_13_29

	local var_13_30
	local var_13_31 = {
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

	var_13_9:RegisterAnimationSequence("MovedDown", var_13_31)

	local function var_13_32()
		var_13_9:AnimateSequence("MovedDown")
	end

	var_13_0._sequences.MovedDown = var_13_32

	local var_13_33
	local var_13_34 = {
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

	var_13_9:RegisterAnimationSequence("MovedLeft", var_13_34)

	local function var_13_35()
		var_13_9:AnimateSequence("MovedLeft")
	end

	var_13_0._sequences.MovedLeft = var_13_35

	local var_13_36
	local var_13_37 = {
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

	var_13_9:RegisterAnimationSequence("MovedRight", var_13_37)

	local function var_13_38()
		var_13_9:AnimateSequence("MovedRight")
	end

	var_13_0._sequences.MovedRight = var_13_38

	local var_13_39
	local var_13_40 = {
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

	var_13_4:RegisterAnimationSequence("ButtonOverDisabled", var_13_40)

	local var_13_41 = {
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

	var_13_7:RegisterAnimationSequence("ButtonOverDisabled", var_13_41)

	local function var_13_42()
		var_13_4:AnimateSequence("ButtonOverDisabled")
		var_13_7:AnimateSequence("ButtonOverDisabled")
	end

	var_13_0._sequences.ButtonOverDisabled = var_13_42

	local var_13_43
	local var_13_44 = {
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

	var_13_9:RegisterAnimationSequence("ButtonUpDisabled", var_13_44)

	local function var_13_45()
		var_13_9:AnimateSequence("ButtonUpDisabled")
	end

	var_13_0._sequences.ButtonUpDisabled = var_13_45

	local var_13_46
	local var_13_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_13_4:RegisterAnimationSequence("WZWipSetup", var_13_47)

	local var_13_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_13_7:RegisterAnimationSequence("WZWipSetup", var_13_48)

	local var_13_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_13_9:RegisterAnimationSequence("WZWipSetup", var_13_49)

	local function var_13_50()
		var_13_4:AnimateSequence("WZWipSetup")
		var_13_7:AnimateSequence("WZWipSetup")
		var_13_9:AnimateSequence("WZWipSetup")
	end

	var_13_0._sequences.WZWipSetup = var_13_50

	local var_13_51
	local var_13_52 = {
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

	var_13_4:RegisterAnimationSequence("WZWipButtonOver", var_13_52)

	local var_13_53 = {
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

	var_13_7:RegisterAnimationSequence("WZWipButtonOver", var_13_53)

	local var_13_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_9:RegisterAnimationSequence("WZWipButtonOver", var_13_54)

	local function var_13_55()
		var_13_4:AnimateSequence("WZWipButtonOver")
		var_13_7:AnimateSequence("WZWipButtonOver")
		var_13_9:AnimateSequence("WZWipButtonOver")
	end

	var_13_0._sequences.WZWipButtonOver = var_13_55

	local var_13_56
	local var_13_57 = {
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

	var_13_4:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_57)

	local var_13_58 = {
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
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_7:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_58)

	local var_13_59 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_9:RegisterAnimationSequence("WZWipButtonOverDisabled", var_13_59)

	local function var_13_60()
		var_13_4:AnimateSequence("WZWipButtonOverDisabled")
		var_13_7:AnimateSequence("WZWipButtonOverDisabled")
		var_13_9:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_13_0._sequences.WZWipButtonOverDisabled = var_13_60

	local var_13_61
	local var_13_62 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("WZWipButtonUp", var_13_62)

	local var_13_63 = {
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

	var_13_7:RegisterAnimationSequence("WZWipButtonUp", var_13_63)

	local var_13_64 = {
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

	var_13_9:RegisterAnimationSequence("WZWipButtonUp", var_13_64)

	local function var_13_65()
		var_13_4:AnimateSequence("WZWipButtonUp")
		var_13_7:AnimateSequence("WZWipButtonUp")
		var_13_9:AnimateSequence("WZWipButtonUp")
	end

	var_13_0._sequences.WZWipButtonUp = var_13_65

	local var_13_66
	local var_13_67 = {
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

	var_13_9:RegisterAnimationSequence("WZWipButtonUpDisabled", var_13_67)

	local function var_13_68()
		var_13_9:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_13_0._sequences.WZWipButtonUpDisabled = var_13_68

	local var_13_69
	local var_13_70 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_9:RegisterAnimationSequence("WZWipDisabled", var_13_70)

	local function var_13_71()
		var_13_9:AnimateSequence("WZWipDisabled")
	end

	var_13_0._sequences.WZWipDisabled = var_13_71

	local var_13_72
	local var_13_73 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_9:RegisterAnimationSequence("WZWipEnabled", var_13_73)

	local function var_13_74()
		var_13_9:AnimateSequence("WZWipEnabled")
	end

	var_13_0._sequences.WZWipEnabled = var_13_74

	var_0_2(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("NavigationArrow", NavigationArrow)
LockTable(_M)
