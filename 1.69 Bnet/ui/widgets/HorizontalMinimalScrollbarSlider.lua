module(..., package.seeall)

local var_0_0 = {
	UNFOCUSED = 0,
	FOCUSED = 1
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._currentState = var_0_0.UNFOCUSED

	arg_1_0:addEventHandler("mouseenter", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "GainFocus")

		arg_2_0._currentState = var_0_0.FOCUSED
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_3_0, arg_3_1)
		if arg_3_0._currentState == var_0_0.FOCUSED then
			WZWIP.AnimateThemeElement(arg_3_0, "LoseFocus")

			arg_3_0._currentState = var_0_0.UNFOCUSED
		else
			WZWIP.AnimateThemeElement(arg_3_0, "Unfocused")
		end
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function HorizontalMinimalScrollbarSlider(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 11 * _1080p)

	var_4_0.id = "HorizontalMinimalScrollbarSlider"
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

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_4_5 = LUI.UIImage.new()
		var_4_5.id = "slider"

		var_4_5:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
		var_4_5:SetPixelGridEnabled(true)
		var_4_5:SetPixelGridContrast(0.15, 0)
		var_4_5:SetPixelGridBlockWidth(2, 0)
		var_4_5:SetPixelGridBlockHeight(2, 0)
		var_4_5:SetPixelGridGutterWidth(1, 0)
		var_4_5:SetPixelGridGutterHeight(1, 0)
		var_4_0:addElement(var_4_5)

		var_4_0.slider = var_4_5
	end

	local var_4_6

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_4_6 = LUI.UIImage.new()
		var_4_6.id = "WZWipSlider"

		var_4_6:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
		var_4_0:addElement(var_4_6)

		var_4_0.WZWipSlider = var_4_6
	end

	local var_4_7

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_4_7 = LUI.UIImage.new()
		var_4_7.id = "Glow"

		var_4_7:SetAlpha(0, 0)
		var_4_7:SetPixelGridEnabled(true)
		var_4_7:SetPixelGridContrast(0.5, 0)
		var_4_7:SetPixelGridBlockWidth(2, 0)
		var_4_7:SetPixelGridBlockHeight(2, 0)
		var_4_7:SetPixelGridGutterWidth(1, 0)
		var_4_7:SetPixelGridGutterHeight(1, 0)
		var_4_7:setImage(RegisterMaterial("horizontal_scrollbar_gradient"), 0)
		var_4_0:addElement(var_4_7)

		var_4_0.Glow = var_4_7
	end

	local var_4_8

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_4_8 = LUI.UIImage.new()
		var_4_8.id = "WZWipGlow"

		var_4_8:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_4_8:SetAlpha(0, 0)
		var_4_0:addElement(var_4_8)

		var_4_0.WZWipGlow = var_4_8
	end

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "LineRight"

	var_4_10:SetAlpha(0, 0)
	var_4_10:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -1, 0, 0, 0)
	var_4_0:addElement(var_4_10)

	var_4_0.LineRight = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "LineLeft"

	var_4_12:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_12:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1, 0, 0)
	var_4_0:addElement(var_4_12)

	var_4_0.LineLeft = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "GradientRight"

	var_4_14:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_14:SetAlpha(0, 0)
	var_4_14:SetZRotation(-90, 0)
	var_4_14:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_4_14:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -11, 0, 0, 0)
	var_4_0:addElement(var_4_14)

	var_4_0.GradientRight = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "GradientBottom"

	var_4_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_16:SetAlpha(0, 0)
	var_4_16:SetZRotation(90, 0)
	var_4_16:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 11, 0, 0)
	var_4_0:addElement(var_4_16)

	var_4_0.GradientBottom = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_17

	local var_4_18

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_19 = {
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

		var_4_5:RegisterAnimationSequence("GainFocus", var_4_19)
	end

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_20 = {
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
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_7:RegisterAnimationSequence("GainFocus", var_4_20)
	end

	local var_4_21 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Top
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
		}
	}

	var_4_10:RegisterAnimationSequence("GainFocus", var_4_21)

	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("GainFocus", var_4_22)

	local var_4_23 = {
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

	var_4_14:RegisterAnimationSequence("GainFocus", var_4_23)

	local var_4_24 = {
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

	var_4_16:RegisterAnimationSequence("GainFocus", var_4_24)

	local function var_4_25()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_5:AnimateSequence("GainFocus")
		end

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_7:AnimateSequence("GainFocus")
		end

		var_4_10:AnimateSequence("GainFocus")
		var_4_12:AnimateSequence("GainFocus")
		var_4_14:AnimateSequence("GainFocus")
		var_4_16:AnimateSequence("GainFocus")
	end

	var_4_0._sequences.GainFocus = var_4_25

	local var_4_26

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_27 = {
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

		var_4_5:RegisterAnimationSequence("LoseFocus", var_4_27)
	end

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_28 = {
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
			}
		}

		var_4_7:RegisterAnimationSequence("LoseFocus", var_4_28)
	end

	local var_4_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("LoseFocus", var_4_29)

	local var_4_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("LoseFocus", var_4_30)

	local var_4_31 = {
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

	var_4_14:RegisterAnimationSequence("LoseFocus", var_4_31)

	local var_4_32 = {
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

	var_4_16:RegisterAnimationSequence("LoseFocus", var_4_32)

	local function var_4_33()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_5:AnimateSequence("LoseFocus")
		end

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_7:AnimateSequence("LoseFocus")
		end

		var_4_10:AnimateSequence("LoseFocus")
		var_4_12:AnimateSequence("LoseFocus")
		var_4_14:AnimateSequence("LoseFocus")
		var_4_16:AnimateSequence("LoseFocus")
	end

	var_4_0._sequences.LoseFocus = var_4_33

	local var_4_34

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_35 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textureUnFocused
			}
		}

		var_4_5:RegisterAnimationSequence("Unfocused", var_4_35)
	end

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_4_7:RegisterAnimationSequence("Unfocused", var_4_36)
	end

	local var_4_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Unfocused", var_4_37)

	local var_4_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Unfocused", var_4_38)

	local var_4_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Unfocused", var_4_39)

	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Unfocused", var_4_40)

	local function var_4_41()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_5:AnimateSequence("Unfocused")
		end

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_7:AnimateSequence("Unfocused")
		end

		var_4_10:AnimateSequence("Unfocused")
		var_4_12:AnimateSequence("Unfocused")
		var_4_14:AnimateSequence("Unfocused")
		var_4_16:AnimateSequence("Unfocused")
	end

	var_4_0._sequences.Unfocused = var_4_41

	local var_4_42

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_43 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("WZWipSetup", var_4_43)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_44 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_44)
	end

	local var_4_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipSetup", var_4_45)

	local var_4_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipSetup", var_4_46)

	local var_4_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipSetup", var_4_47)

	local var_4_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_4_16:RegisterAnimationSequence("WZWipSetup", var_4_48)

	local function var_4_49()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_8:AnimateSequence("WZWipSetup")
		end

		var_4_10:AnimateSequence("WZWipSetup")
		var_4_12:AnimateSequence("WZWipSetup")
		var_4_14:AnimateSequence("WZWipSetup")
		var_4_16:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_49

	local var_4_50

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_51 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("WZWipGainFocus", var_4_51)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_52 = {
			{
				value = 1,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_8:RegisterAnimationSequence("WZWipGainFocus", var_4_52)
	end

	local var_4_53 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipGainFocus", var_4_53)

	local var_4_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipGainFocus", var_4_54)

	local var_4_55 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipGainFocus", var_4_55)

	local var_4_56 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WZWipGainFocus", var_4_56)

	local function var_4_57()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("WZWipGainFocus")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_8:AnimateSequence("WZWipGainFocus")
		end

		var_4_10:AnimateSequence("WZWipGainFocus")
		var_4_12:AnimateSequence("WZWipGainFocus")
		var_4_14:AnimateSequence("WZWipGainFocus")
		var_4_16:AnimateSequence("WZWipGainFocus")
	end

	var_4_0._sequences.WZWipGainFocus = var_4_57

	local var_4_58

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_59 = {
			{
				value = 0.8,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("WZWipLoseFocus", var_4_59)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_60 = {
			{
				value = 0,
				duration = 150,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_8:RegisterAnimationSequence("WZWipLoseFocus", var_4_60)
	end

	local var_4_61 = {
		{
			value = 0,
			duration = 150,
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

	local var_4_63 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipLoseFocus", var_4_63)

	local var_4_64 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WZWipLoseFocus", var_4_64)

	local function var_4_65()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("WZWipLoseFocus")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_8:AnimateSequence("WZWipLoseFocus")
		end

		var_4_10:AnimateSequence("WZWipLoseFocus")
		var_4_12:AnimateSequence("WZWipLoseFocus")
		var_4_14:AnimateSequence("WZWipLoseFocus")
		var_4_16:AnimateSequence("WZWipLoseFocus")
	end

	var_4_0._sequences.WZWipLoseFocus = var_4_65

	local var_4_66

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_67 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("WZWipUnfocused", var_4_67)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_68 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_8:RegisterAnimationSequence("WZWipUnfocused", var_4_68)
	end

	local var_4_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipUnfocused", var_4_69)

	local var_4_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("WZWipUnfocused", var_4_70)

	local var_4_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_4_14:RegisterAnimationSequence("WZWipUnfocused", var_4_71)

	local var_4_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WZWipUnfocused", var_4_72)

	local function var_4_73()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("WZWipUnfocused")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_8:AnimateSequence("WZWipUnfocused")
		end

		var_4_10:AnimateSequence("WZWipUnfocused")
		var_4_12:AnimateSequence("WZWipUnfocused")
		var_4_14:AnimateSequence("WZWipUnfocused")
		var_4_16:AnimateSequence("WZWipUnfocused")
	end

	var_4_0._sequences.WZWipUnfocused = var_4_73

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("HorizontalMinimalScrollbarSlider", HorizontalMinimalScrollbarSlider)
LockTable(_M)
