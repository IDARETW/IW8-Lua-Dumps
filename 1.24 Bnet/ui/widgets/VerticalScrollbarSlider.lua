module(..., package.seeall)

function VerticalScrollbarSlider(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 11 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "VerticalScrollbarSlider"
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

	var_1_4.id = "backer"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.9, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.backer = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "slider"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.8, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.slider = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Glow"

	var_1_8:SetAlpha(0, 0)
	var_1_8:SetPixelGridEnabled(true)
	var_1_8:SetPixelGridContrast(0.5, 0)
	var_1_8:SetPixelGridBlockWidth(2, 0)
	var_1_8:SetPixelGridBlockHeight(2, 0)
	var_1_8:SetPixelGridGutterWidth(1, 0)
	var_1_8:SetPixelGridGutterHeight(1, 0)
	var_1_8:setImage(RegisterMaterial("scrollbar_gradient"), 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Glow = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "LineTop"

	var_1_10:SetAlpha(0, 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, _1080p * 1, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.LineTop = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "LineBottom"

	var_1_12:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_12:SetAlpha(0, 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, _1080p * 49, _1080p * 50)
	var_1_0:addElement(var_1_12)

	var_1_0.LineBottom = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "GradientTop"

	var_1_14:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_14:SetAlpha(0, 0)
	var_1_14:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 10)
	var_1_0:addElement(var_1_14)

	var_1_0.GradientTop = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "GradientBottom"

	var_1_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_16:SetAlpha(0, 0)
	var_1_16:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 11, 0, _1080p * -11)
	var_1_0:addElement(var_1_16)

	var_1_0.GradientBottom = var_1_16

	local function var_1_17()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_17

	local var_1_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.scrollbarThumb
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.3,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_18)

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOver", var_1_20)

	local var_1_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonOver", var_1_21)

	local var_1_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonOver", var_1_22)

	local var_1_23 = {
		{
			value = 0,
			duration = 0,
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
			value = _1080p * -10
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("ButtonOver", var_1_23)

	local function var_1_24()
		var_1_6:AnimateSequence("ButtonOver")
		var_1_8:AnimateSequence("ButtonOver")
		var_1_10:AnimateSequence("ButtonOver")
		var_1_12:AnimateSequence("ButtonOver")
		var_1_14:AnimateSequence("ButtonOver")
		var_1_16:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_24

	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.scrollbarThumb
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_25)

	local var_1_26 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_26)

	local var_1_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUp", var_1_27)

	local var_1_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonUp", var_1_28)

	local var_1_29 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonUp", var_1_29)

	local var_1_30 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("ButtonUp", var_1_30)

	local function var_1_31()
		var_1_6:AnimateSequence("ButtonUp")
		var_1_8:AnimateSequence("ButtonUp")
		var_1_10:AnimateSequence("ButtonUp")
		var_1_12:AnimateSequence("ButtonUp")
		var_1_14:AnimateSequence("ButtonUp")
		var_1_16:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_31

	local var_1_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("GainFocus", var_1_32)

	local var_1_33 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("GainFocus", var_1_33)

	local function var_1_34()
		var_1_6:AnimateSequence("GainFocus")
		var_1_8:AnimateSequence("GainFocus")
	end

	var_1_0._sequences.GainFocus = var_1_34

	local var_1_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.scrollbarThumb
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.scrollbarThumb
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("LoseFocus", var_1_35)

	local var_1_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("LoseFocus", var_1_36)

	local var_1_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("LoseFocus", var_1_37)

	local var_1_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("LoseFocus", var_1_38)

	local var_1_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("LoseFocus", var_1_39)

	local var_1_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("LoseFocus", var_1_40)

	local function var_1_41()
		var_1_6:AnimateSequence("LoseFocus")
		var_1_8:AnimateSequence("LoseFocus")
		var_1_10:AnimateSequence("LoseFocus")
		var_1_12:AnimateSequence("LoseFocus")
		var_1_14:AnimateSequence("LoseFocus")
		var_1_16:AnimateSequence("LoseFocus")
	end

	var_1_0._sequences.LoseFocus = var_1_41

	var_1_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("gain_focus", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "GainFocus")
	end)
	var_1_0:addEventHandler("lose_focus", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "LoseFocus")
	end)

	return var_1_0
end

MenuBuilder.registerType("VerticalScrollbarSlider", VerticalScrollbarSlider)
LockTable(_M)
