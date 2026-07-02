module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_1_0:addEventHandler("gain_focus", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, WZWIP.CheckForApplyPrependWZWipPrefix("GainFocus"))
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, WZWIP.CheckForApplyPrependWZWipPrefix("LoseFocus"))
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function VerticalScrollbarSlider(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 11 * _1080p, 0, 50 * _1080p)

	var_5_0.id = "VerticalScrollbarSlider"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "backer"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.9, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.backer = var_5_4

	local var_5_5

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_5_5 = LUI.UIImage.new()
		var_5_5.id = "slider"

		var_5_5:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
		var_5_5:SetPixelGridEnabled(true)
		var_5_5:SetPixelGridContrast(0.5, 0)
		var_5_5:SetPixelGridBlockWidth(2, 0)
		var_5_5:SetPixelGridBlockHeight(2, 0)
		var_5_5:SetPixelGridGutterWidth(1, 0)
		var_5_5:SetPixelGridGutterHeight(1, 0)
		var_5_0:addElement(var_5_5)

		var_5_0.slider = var_5_5
	end

	local var_5_6

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_5_6 = LUI.UIImage.new()
		var_5_6.id = "WZWipslider"

		var_5_6:SetRGBFromTable(SWATCHES.genericMenu.scrollbarThumb, 0)
		var_5_0:addElement(var_5_6)

		var_5_0.WZWipslider = var_5_6
	end

	local var_5_7

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_5_7 = LUI.UIImage.new()
		var_5_7.id = "Glow"

		var_5_7:SetAlpha(0, 0)
		var_5_7:SetPixelGridEnabled(true)
		var_5_7:SetPixelGridContrast(0.5, 0)
		var_5_7:SetPixelGridBlockWidth(2, 0)
		var_5_7:SetPixelGridBlockHeight(2, 0)
		var_5_7:SetPixelGridGutterWidth(1, 0)
		var_5_7:SetPixelGridGutterHeight(1, 0)
		var_5_7:setImage(RegisterMaterial("scrollbar_gradient"), 0)
		var_5_0:addElement(var_5_7)

		var_5_0.Glow = var_5_7
	end

	local var_5_8

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_5_8 = LUI.UIImage.new()
		var_5_8.id = "WZWipGlow"

		var_5_8:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_5_8:SetAlpha(0, 0)
		var_5_0:addElement(var_5_8)

		var_5_0.WZWipGlow = var_5_8
	end

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "LineTop"

	var_5_10:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, _1080p * 1, 0)
	var_5_0:addElement(var_5_10)

	var_5_0.LineTop = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "LineBottom"

	var_5_12:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_12:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, _1080p * 49, _1080p * 50)
	var_5_0:addElement(var_5_12)

	var_5_0.LineBottom = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "GradientTop"

	var_5_14:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 10)
	var_5_0:addElement(var_5_14)

	var_5_0.GradientTop = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "GradientBottom"

	var_5_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_16:SetAlpha(0, 0)
	var_5_16:setImage(RegisterMaterial("button_gradient_active_top"), 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 11, 0, _1080p * -11)
	var_5_0:addElement(var_5_16)

	var_5_0.GradientBottom = var_5_16

	local function var_5_17()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_17

	local var_5_18

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_19 = {
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

		var_5_5:RegisterAnimationSequence("ButtonOver", var_5_19)
	end

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_20 = {
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

		var_5_7:RegisterAnimationSequence("ButtonOver", var_5_20)
	end

	local var_5_21 = {
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

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_21)

	local var_5_22 = {
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

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_22)

	local var_5_23 = {
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

	var_5_14:RegisterAnimationSequence("ButtonOver", var_5_23)

	local var_5_24 = {
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

	var_5_16:RegisterAnimationSequence("ButtonOver", var_5_24)

	local function var_5_25()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_5_5:AnimateSequence("ButtonOver")
		end

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_5_7:AnimateSequence("ButtonOver")
		end

		var_5_10:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_14:AnimateSequence("ButtonOver")
		var_5_16:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_25

	local var_5_26

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_27 = {
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

		var_5_5:RegisterAnimationSequence("ButtonUp", var_5_27)
	end

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_28 = {
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

		var_5_7:RegisterAnimationSequence("ButtonUp", var_5_28)
	end

	local var_5_29 = {
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

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_29)

	local var_5_30 = {
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

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_30)

	local var_5_31 = {
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

	var_5_14:RegisterAnimationSequence("ButtonUp", var_5_31)

	local var_5_32 = {
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

	var_5_16:RegisterAnimationSequence("ButtonUp", var_5_32)

	local function var_5_33()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_5_5:AnimateSequence("ButtonUp")
		end

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_5_7:AnimateSequence("ButtonUp")
		end

		var_5_10:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
		var_5_14:AnimateSequence("ButtonUp")
		var_5_16:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_33

	local var_5_34

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_35 = {
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

		var_5_5:RegisterAnimationSequence("GainFocus", var_5_35)
	end

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_36 = {
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

		var_5_7:RegisterAnimationSequence("GainFocus", var_5_36)
	end

	local function var_5_37()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_5_5:AnimateSequence("GainFocus")
		end

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_5_7:AnimateSequence("GainFocus")
		end
	end

	var_5_0._sequences.GainFocus = var_5_37

	local var_5_38

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_39 = {
			{
				value = 1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_6:RegisterAnimationSequence("WZWipGainFocus", var_5_39)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_40 = {
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_8:RegisterAnimationSequence("WZWipGainFocus", var_5_40)
	end

	local function var_5_41()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_6:AnimateSequence("WZWipGainFocus")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_8:AnimateSequence("WZWipGainFocus")
		end
	end

	var_5_0._sequences.WZWipGainFocus = var_5_41

	local var_5_42

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_43 = {
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

		var_5_5:RegisterAnimationSequence("LoseFocus", var_5_43)
	end

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_44 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_7:RegisterAnimationSequence("LoseFocus", var_5_44)
	end

	local var_5_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("LoseFocus", var_5_45)

	local var_5_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("LoseFocus", var_5_46)

	local var_5_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("LoseFocus", var_5_47)

	local var_5_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("LoseFocus", var_5_48)

	local function var_5_49()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_5_5:AnimateSequence("LoseFocus")
		end

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_5_7:AnimateSequence("LoseFocus")
		end

		var_5_10:AnimateSequence("LoseFocus")
		var_5_12:AnimateSequence("LoseFocus")
		var_5_14:AnimateSequence("LoseFocus")
		var_5_16:AnimateSequence("LoseFocus")
	end

	var_5_0._sequences.LoseFocus = var_5_49

	local var_5_50

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_51 = {
			{
				value = 0.4,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_6:RegisterAnimationSequence("WZWipSetup", var_5_51)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_8:RegisterAnimationSequence("WZWipSetup", var_5_52)
	end

	local function var_5_53()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_6:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_8:AnimateSequence("WZWipSetup")
		end
	end

	var_5_0._sequences.WZWipSetup = var_5_53

	local var_5_54

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_55 = {
			{
				value = 0.4,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_6:RegisterAnimationSequence("WZWipLoseFocus", var_5_55)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_56 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_8:RegisterAnimationSequence("WZWipLoseFocus", var_5_56)
	end

	local function var_5_57()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_6:AnimateSequence("WZWipLoseFocus")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_8:AnimateSequence("WZWipLoseFocus")
		end
	end

	var_5_0._sequences.WZWipLoseFocus = var_5_57

	local var_5_58

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_59 = {
			{
				value = 0.4,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_6:RegisterAnimationSequence("WZWipButtonUp", var_5_59)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_60 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_8:RegisterAnimationSequence("WZWipButtonUp", var_5_60)
	end

	local function var_5_61()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_6:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_8:AnimateSequence("WZWipButtonUp")
		end
	end

	var_5_0._sequences.WZWipButtonUp = var_5_61

	local var_5_62

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_63 = {
			{
				value = 1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_6:RegisterAnimationSequence("WZWipButtonOver", var_5_63)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_5_64 = {
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_8:RegisterAnimationSequence("WZWipButtonOver", var_5_64)
	end

	local function var_5_65()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_6:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_5_8:AnimateSequence("WZWipButtonOver")
		end
	end

	var_5_0._sequences.WZWipButtonOver = var_5_65

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("VerticalScrollbarSlider", VerticalScrollbarSlider)
LockTable(_M)
