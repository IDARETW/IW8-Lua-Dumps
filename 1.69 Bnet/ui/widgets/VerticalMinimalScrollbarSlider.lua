module(..., package.seeall)

local var_0_0 = {
	UNFOCUSED = 0,
	FOCUSED = 1
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._currentState = var_0_0.UNFOCUSED

	arg_1_0:addEventHandler("mouseenter", function(arg_2_0, arg_2_1)
		if arg_2_0._currentState == var_0_0.UNFOCUSED then
			WZWIP.AnimateThemeElement(arg_2_0, "GainFocus")

			arg_2_0._currentState = var_0_0.FOCUSED
		end
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_3_0, arg_3_1)
		if arg_3_0._currentState == var_0_0.FOCUSED then
			WZWIP.AnimateThemeElement(arg_3_0, "LoseFocus")

			arg_3_0._currentState = var_0_0.UNFOCUSED
		else
			WZWIP.AnimateThemeElement(arg_3_0, "Unfocused")
		end
	end)
end

function VerticalMinimalScrollbarSlider(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 11 * _1080p, 0, 100 * _1080p)

	var_4_0.id = "VerticalMinimalScrollbarSlider"
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

	var_4_4.id = "backer"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.9, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.backer = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "slider"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
	var_4_6:SetPixelGridEnabled(true)
	var_4_6:SetPixelGridContrast(0.15, 0)
	var_4_6:SetPixelGridBlockWidth(2, 0)
	var_4_6:SetPixelGridBlockHeight(2, 0)
	var_4_6:SetPixelGridGutterWidth(1, 0)
	var_4_6:SetPixelGridGutterHeight(1, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.slider = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "WZWipSlider"

	var_4_8:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
	var_4_8:SetAlpha(0.4, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.WZWipSlider = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Glow"

	var_4_10:SetAlpha(0, 0)
	var_4_10:SetPixelGridEnabled(true)
	var_4_10:SetPixelGridContrast(0.5, 0)
	var_4_10:SetPixelGridBlockWidth(2, 0)
	var_4_10:SetPixelGridBlockHeight(2, 0)
	var_4_10:SetPixelGridGutterWidth(1, 0)
	var_4_10:SetPixelGridGutterHeight(1, 0)
	var_4_10:setImage(RegisterMaterial("scrollbar_gradient"), 0)
	var_4_0:addElement(var_4_10)

	var_4_0.Glow = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "WZWipGlow"

	var_4_12:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_4_12:SetAlpha(0, 0)
	var_4_12:setImage(RegisterMaterial("scrollbar_gradient"), 0)
	var_4_0:addElement(var_4_12)

	var_4_0.WZWipGlow = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "LineTop"

	var_4_14:SetAlpha(0, 0)
	var_4_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 1, 0)
	var_4_0:addElement(var_4_14)

	var_4_0.LineTop = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "LineBottom"

	var_4_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_16:SetAlpha(0, 0)
	var_4_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_4_0:addElement(var_4_16)

	var_4_0.LineBottom = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIImage.new()

	var_4_18.id = "GradientTop"

	var_4_18:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_18:SetAlpha(0, 0)
	var_4_18:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_4_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 10)
	var_4_0:addElement(var_4_18)

	var_4_0.GradientTop = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIImage.new()

	var_4_20.id = "GradientBottom"

	var_4_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_20:SetAlpha(0, 0)
	var_4_20:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_4_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * -11)
	var_4_0:addElement(var_4_20)

	var_4_0.GradientBottom = var_4_20

	local function var_4_21()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_21

	local var_4_22
	local var_4_23 = {
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

	var_4_6:RegisterAnimationSequence("GainFocus", var_4_23)

	local var_4_24 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("GainFocus", var_4_24)

	local var_4_25 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_4_10:RegisterAnimationSequence("GainFocus", var_4_25)

	local var_4_26 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("GainFocus", var_4_26)

	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("GainFocus", var_4_27)

	local var_4_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("GainFocus", var_4_28)

	local var_4_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("GainFocus", var_4_29)

	local var_4_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("GainFocus", var_4_30)

	local function var_4_31()
		var_4_6:AnimateSequence("GainFocus")
		var_4_8:AnimateSequence("GainFocus")
		var_4_10:AnimateSequence("GainFocus")
		var_4_12:AnimateSequence("GainFocus")
		var_4_14:AnimateSequence("GainFocus")
		var_4_16:AnimateSequence("GainFocus")
		var_4_18:AnimateSequence("GainFocus")
		var_4_20:AnimateSequence("GainFocus")
	end

	var_4_0._sequences.GainFocus = var_4_31

	local var_4_32
	local var_4_33 = {
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
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.scrollbarThumb
		}
	}

	var_4_6:RegisterAnimationSequence("LoseFocus", var_4_33)

	local var_4_34 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("LoseFocus", var_4_34)

	local var_4_35 = {
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

	var_4_10:RegisterAnimationSequence("LoseFocus", var_4_35)

	local var_4_36 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("LoseFocus", var_4_36)

	local var_4_37 = {
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

	var_4_14:RegisterAnimationSequence("LoseFocus", var_4_37)

	local var_4_38 = {
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

	var_4_16:RegisterAnimationSequence("LoseFocus", var_4_38)

	local var_4_39 = {
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

	var_4_18:RegisterAnimationSequence("LoseFocus", var_4_39)

	local var_4_40 = {
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

	var_4_20:RegisterAnimationSequence("LoseFocus", var_4_40)

	local function var_4_41()
		var_4_6:AnimateSequence("LoseFocus")
		var_4_8:AnimateSequence("LoseFocus")
		var_4_10:AnimateSequence("LoseFocus")
		var_4_12:AnimateSequence("LoseFocus")
		var_4_14:AnimateSequence("LoseFocus")
		var_4_16:AnimateSequence("LoseFocus")
		var_4_18:AnimateSequence("LoseFocus")
		var_4_20:AnimateSequence("LoseFocus")
	end

	var_4_0._sequences.LoseFocus = var_4_41

	local var_4_42
	local var_4_43 = {
		{
			value = 1,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.scrollbarThumb
		}
	}

	var_4_6:RegisterAnimationSequence("Unfocused", var_4_43)

	local var_4_44 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Unfocused", var_4_44)

	local var_4_45 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 10,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_10:RegisterAnimationSequence("Unfocused", var_4_45)

	local var_4_46 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Unfocused", var_4_46)

	local var_4_47 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Unfocused", var_4_47)

	local var_4_48 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Unfocused", var_4_48)

	local var_4_49 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("Unfocused", var_4_49)

	local var_4_50 = {
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("Unfocused", var_4_50)

	local function var_4_51()
		var_4_6:AnimateSequence("Unfocused")
		var_4_8:AnimateSequence("Unfocused")
		var_4_10:AnimateSequence("Unfocused")
		var_4_12:AnimateSequence("Unfocused")
		var_4_14:AnimateSequence("Unfocused")
		var_4_16:AnimateSequence("Unfocused")
		var_4_18:AnimateSequence("Unfocused")
		var_4_20:AnimateSequence("Unfocused")
	end

	var_4_0._sequences.Unfocused = var_4_51

	local var_4_52
	local var_4_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipGainFocus", var_4_53)

	local var_4_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipGainFocus", var_4_54)

	local var_4_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipGainFocus", var_4_55)

	local var_4_56 = {
		{
			value = 0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipGainFocus", var_4_56)

	local function var_4_57()
		var_4_6:AnimateSequence("WZWipGainFocus")
		var_4_8:AnimateSequence("WZWipGainFocus")
		var_4_10:AnimateSequence("WZWipGainFocus")
		var_4_12:AnimateSequence("WZWipGainFocus")
	end

	var_4_0._sequences.WZWipGainFocus = var_4_57

	local var_4_58
	local var_4_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipLoseFocus", var_4_59)

	local var_4_60 = {
		{
			value = 0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipLoseFocus", var_4_60)

	local var_4_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipLoseFocus", var_4_61)

	local var_4_62 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipLoseFocus", var_4_62)

	local function var_4_63()
		var_4_6:AnimateSequence("WZWipLoseFocus")
		var_4_8:AnimateSequence("WZWipLoseFocus")
		var_4_10:AnimateSequence("WZWipLoseFocus")
		var_4_12:AnimateSequence("WZWipLoseFocus")
	end

	var_4_0._sequences.WZWipLoseFocus = var_4_63

	local var_4_64
	local var_4_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipUnfocused", var_4_65)

	local var_4_66 = {
		{
			value = 0.4,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipUnfocused", var_4_66)

	local var_4_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipUnfocused", var_4_67)

	local var_4_68 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipUnfocused", var_4_68)

	local function var_4_69()
		var_4_6:AnimateSequence("WZWipUnfocused")
		var_4_8:AnimateSequence("WZWipUnfocused")
		var_4_10:AnimateSequence("WZWipUnfocused")
		var_4_12:AnimateSequence("WZWipUnfocused")
	end

	var_4_0._sequences.WZWipUnfocused = var_4_69

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("VerticalMinimalScrollbarSlider", VerticalMinimalScrollbarSlider)
LockTable(_M)
