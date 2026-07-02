module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0:SetHandleMouseButton(true)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		if not arg_2_0:IsDisabled() then
			ACTIONS.AnimateSequence(arg_2_0, "GainFocus")
		end
	end)
	arg_1_0:addEventHandler("button_over_active", function(arg_3_0, arg_3_1)
		if not arg_3_0:IsDisabled() and not arg_3_0:isInFocus() then
			ACTIONS.AnimateSequence(arg_3_0, "ButtonOverActive")
		end
	end)
end

function GenericSliderBar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 225 * _1080p, 0, 32 * _1080p)

	var_4_0.id = "GenericSliderBar"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -7, _1080p * 7)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Fill"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, 0, _1080p * 3, _1080p * 5)
	var_4_0:addElement(var_4_6)

	var_4_0.Fill = var_4_6

	local var_4_7
	local var_4_8 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_9 = LUI.UIBorder.new(var_4_8)

	var_4_9.id = "FillBorder"

	var_4_9:SetAlpha(0.2, 0)
	var_4_9:SetBorderThicknessLeft(_1080p * 0, 0)
	var_4_9:SetBorderThicknessRight(_1080p * 0, 0)
	var_4_9:SetBorderThicknessTop(_1080p * 0, 0)
	var_4_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -9, _1080p * 5)
	var_4_0:addElement(var_4_9)

	var_4_0.FillBorder = var_4_9

	local var_4_10
	local var_4_11 = LUI.UIImage.new()

	var_4_11.id = "TickMarker"

	var_4_11:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_11:SetAlpha(0, 0)
	var_4_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 50, _1080p * 52, _1080p * -13, _1080p * 13)
	var_4_0:addElement(var_4_11)

	var_4_0.TickMarker = var_4_11

	local function var_4_12()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_12

	local var_4_13 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_13)

	local var_4_14 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonOver", var_4_14)

	local var_4_15 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_11:RegisterAnimationSequence("ButtonOver", var_4_15)

	local function var_4_16()
		var_4_6:AnimateSequence("ButtonOver")
		var_4_9:AnimateSequence("ButtonOver")
		var_4_11:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_16

	local var_4_17 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_17)

	local var_4_18 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Border_Thickness_Bottom,
			value = _1080p * 1
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonUp", var_4_18)

	local function var_4_19()
		var_4_6:AnimateSequence("ButtonUp")
		var_4_9:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_19

	local function var_4_20()
		return
	end

	var_4_0._sequences.Locked = var_4_20

	local function var_4_21()
		return
	end

	var_4_0._sequences.NewNotification = var_4_21

	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOverDisabled", var_4_22)

	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonOverDisabled", var_4_23)

	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_4_11:RegisterAnimationSequence("ButtonOverDisabled", var_4_24)

	local function var_4_25()
		var_4_6:AnimateSequence("ButtonOverDisabled")
		var_4_9:AnimateSequence("ButtonOverDisabled")
		var_4_11:AnimateSequence("ButtonOverDisabled")
	end

	var_4_0._sequences.ButtonOverDisabled = var_4_25

	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUpDisabled", var_4_26)

	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonUpDisabled", var_4_27)

	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_4_11:RegisterAnimationSequence("ButtonUpDisabled", var_4_28)

	local function var_4_29()
		var_4_6:AnimateSequence("ButtonUpDisabled")
		var_4_9:AnimateSequence("ButtonUpDisabled")
		var_4_11:AnimateSequence("ButtonUpDisabled")
	end

	var_4_0._sequences.ButtonUpDisabled = var_4_29

	local var_4_30 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			value = 0.5,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("GainFocus", var_4_30)

	local var_4_31 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_4_6:RegisterAnimationSequence("GainFocus", var_4_31)

	local var_4_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Left,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Right,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_4_9:RegisterAnimationSequence("GainFocus", var_4_32)

	local function var_4_33()
		var_4_4:AnimateSequence("GainFocus")
		var_4_6:AnimateSequence("GainFocus")
		var_4_9:AnimateSequence("GainFocus")
	end

	var_4_0._sequences.GainFocus = var_4_33

	local var_4_34 = {
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		}
	}

	var_4_4:RegisterAnimationSequence("LoseFocus", var_4_34)

	local var_4_35 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_4_6:RegisterAnimationSequence("LoseFocus", var_4_35)

	local var_4_36 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			value = 0.6,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Border_Thickness_Left,
			value = _1080p * 0
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Border_Thickness_Right,
			value = _1080p * 0
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_4_9:RegisterAnimationSequence("LoseFocus", var_4_36)

	local function var_4_37()
		var_4_4:AnimateSequence("LoseFocus")
		var_4_6:AnimateSequence("LoseFocus")
		var_4_9:AnimateSequence("LoseFocus")
	end

	var_4_0._sequences.LoseFocus = var_4_37

	local function var_4_38()
		return
	end

	var_4_0._sequences.Active = var_4_38

	local var_4_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOverActive", var_4_39)

	local var_4_40 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOverActive", var_4_40)

	local var_4_41 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Left,
			value = _1080p * 0
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Right,
			value = _1080p * 0
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonOverActive", var_4_41)

	local var_4_42 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_11:RegisterAnimationSequence("ButtonOverActive", var_4_42)

	local function var_4_43()
		var_4_4:AnimateSequence("ButtonOverActive")
		var_4_6:AnimateSequence("ButtonOverActive")
		var_4_9:AnimateSequence("ButtonOverActive")
		var_4_11:AnimateSequence("ButtonOverActive")
	end

	var_4_0._sequences.ButtonOverActive = var_4_43

	local var_4_44 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUpActive", var_4_44)

	local var_4_45 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Border_Thickness_Bottom,
			value = _1080p * 1
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_9:RegisterAnimationSequence("ButtonUpActive", var_4_45)

	local function var_4_46()
		var_4_6:AnimateSequence("ButtonUpActive")
		var_4_9:AnimateSequence("ButtonUpActive")
	end

	var_4_0._sequences.ButtonUpActive = var_4_46

	var_4_0:addEventHandler("button_over", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOver")
	end)
	var_4_0:addEventHandler("lose_focus", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "LoseFocus")
	end)
	var_4_0:addEventHandler("active", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Active")
	end)
	var_4_0:addEventHandler("button_active", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUpActive")
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GenericSliderBar", GenericSliderBar)
LockTable(_M)
