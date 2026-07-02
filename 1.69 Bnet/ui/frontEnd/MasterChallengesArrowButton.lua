module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUp")
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function MasterChallengesArrowButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 12 * _1080p, 0, 12 * _1080p)

	var_4_0.id = "MasterChallengesArrowButton"
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

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 12, 0, _1080p * 12)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_7 = LUI.UIBorder.new(var_4_6)

	var_4_7.id = "Border"

	var_4_7:SetAlpha(0, 0)
	var_4_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 12, 0, _1080p * 12)
	var_4_0:addElement(var_4_7)

	var_4_0.Border = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIImage.new()

	var_4_9.id = "Image"

	var_4_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -2, _1080p * 14, _1080p * -2, _1080p * 14)
	var_4_0:addElement(var_4_9)

	var_4_0.Image = var_4_9

	local function var_4_10()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_10

	local var_4_11
	local var_4_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_12)

	local var_4_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("ButtonUp", var_4_13)

	local var_4_14 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonUp", var_4_14)

	local function var_4_15()
		var_4_4:AnimateSequence("ButtonUp")
		var_4_7:AnimateSequence("ButtonUp")
		var_4_9:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_17)

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 16
		}
	}

	var_4_7:RegisterAnimationSequence("ButtonOver", var_4_18)

	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonOver", var_4_19)

	local function var_4_20()
		var_4_4:AnimateSequence("ButtonOver")
		var_4_7:AnimateSequence("ButtonOver")
		var_4_9:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_20

	local var_4_21
	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 6
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonOver", var_4_22)

	local var_4_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 6
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipButtonOver", var_4_23)

	local var_4_24 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipButtonOver", var_4_24)

	local function var_4_25()
		var_4_4:AnimateSequence("WZWipButtonOver")
		var_4_7:AnimateSequence("WZWipButtonOver")
		var_4_9:AnimateSequence("WZWipButtonOver")
	end

	var_4_0._sequences.WZWipButtonOver = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 6
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonUp", var_4_27)

	local var_4_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 6
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipButtonUp", var_4_28)

	local var_4_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipButtonUp", var_4_29)

	local function var_4_30()
		var_4_4:AnimateSequence("WZWipButtonUp")
		var_4_7:AnimateSequence("WZWipButtonUp")
		var_4_9:AnimateSequence("WZWipButtonUp")
	end

	var_4_0._sequences.WZWipButtonUp = var_4_30

	local var_4_31
	local var_4_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipSetup", var_4_32)

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipSetup", var_4_33)

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipSetup", var_4_34)

	local function var_4_35()
		var_4_4:AnimateSequence("WZWipSetup")
		var_4_7:AnimateSequence("WZWipSetup")
		var_4_9:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_35

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MasterChallengesArrowButton", MasterChallengesArrowButton)
LockTable(_M)
