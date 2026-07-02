module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0:SetHandleMouseButton(true)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		if not arg_2_0:IsDisabled() then
			WZWIP.AnimateThemeElement(arg_2_0, "GainFocus")
		end
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "LoseFocus")
	end)
	arg_1_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_over_active", function(arg_5_0, arg_5_1)
		if not arg_5_0:IsDisabled() and not arg_5_0:isInFocus() then
			WZWIP.AnimateThemeElement(arg_5_0, "ButtonOverActive")
		end
	end)
	arg_1_0:addEventHandler("button_active", function(arg_6_0, arg_6_1)
		WZWIP.AnimateThemeElement(arg_6_0, "ButtonUpActive")
	end)
	arg_1_0:addEventHandler("active", function(arg_7_0, arg_7_1)
		WZWIP.AnimateThemeElement(arg_7_0, "Active")
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericSliderBar(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 225 * _1080p, 0, 32 * _1080p)

	var_8_0.id = "GenericSliderBar"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Background"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -7, _1080p * 7)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Fill"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, 0, _1080p * 3, _1080p * 5)
	var_8_0:addElement(var_8_6)

	var_8_0.Fill = var_8_6

	local var_8_7
	local var_8_8 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_8_9 = LUI.UIBorder.new(var_8_8)

	var_8_9.id = "FillBorder"

	var_8_9:SetAlpha(0.2, 0)
	var_8_9:SetBorderThicknessLeft(_1080p * 0, 0)
	var_8_9:SetBorderThicknessRight(_1080p * 0, 0)
	var_8_9:SetBorderThicknessTop(_1080p * 0, 0)
	var_8_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -9, _1080p * 5)
	var_8_0:addElement(var_8_9)

	var_8_0.FillBorder = var_8_9

	local var_8_10
	local var_8_11 = LUI.UIImage.new()

	var_8_11.id = "TickMarker"

	var_8_11:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_11:SetAlpha(0, 0)
	var_8_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 50, _1080p * 52, _1080p * -13, _1080p * 13)
	var_8_0:addElement(var_8_11)

	var_8_0.TickMarker = var_8_11

	local function var_8_12()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_12

	local var_8_13
	local var_8_14 = {
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

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_14)

	local var_8_15 = {
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

	var_8_9:RegisterAnimationSequence("ButtonOver", var_8_15)

	local var_8_16 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOver", var_8_16)

	local function var_8_17()
		var_8_6:AnimateSequence("ButtonOver")
		var_8_9:AnimateSequence("ButtonOver")
		var_8_11:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_17

	local var_8_18
	local var_8_19 = {
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

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_19)

	local var_8_20 = {
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

	var_8_9:RegisterAnimationSequence("ButtonUp", var_8_20)

	local function var_8_21()
		var_8_6:AnimateSequence("ButtonUp")
		var_8_9:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_21

	local function var_8_22()
		return
	end

	var_8_0._sequences.Locked = var_8_22

	local function var_8_23()
		return
	end

	var_8_0._sequences.NewNotification = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOverDisabled", var_8_25)

	local var_8_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_9:RegisterAnimationSequence("ButtonOverDisabled", var_8_26)

	local var_8_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOverDisabled", var_8_27)

	local function var_8_28()
		var_8_6:AnimateSequence("ButtonOverDisabled")
		var_8_9:AnimateSequence("ButtonOverDisabled")
		var_8_11:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_28

	local var_8_29
	local var_8_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpDisabled", var_8_30)

	local var_8_31 = {
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

	var_8_9:RegisterAnimationSequence("ButtonUpDisabled", var_8_31)

	local var_8_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonUpDisabled", var_8_32)

	local function var_8_33()
		var_8_6:AnimateSequence("ButtonUpDisabled")
		var_8_9:AnimateSequence("ButtonUpDisabled")
		var_8_11:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_33

	local var_8_34
	local var_8_35 = {
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

	var_8_4:RegisterAnimationSequence("GainFocus", var_8_35)

	local var_8_36 = {
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

	var_8_6:RegisterAnimationSequence("GainFocus", var_8_36)

	local var_8_37 = {
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

	var_8_9:RegisterAnimationSequence("GainFocus", var_8_37)

	local function var_8_38()
		var_8_4:AnimateSequence("GainFocus")
		var_8_6:AnimateSequence("GainFocus")
		var_8_9:AnimateSequence("GainFocus")
	end

	var_8_0._sequences.GainFocus = var_8_38

	local var_8_39
	local var_8_40 = {
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

	var_8_4:RegisterAnimationSequence("LoseFocus", var_8_40)

	local var_8_41 = {
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

	var_8_6:RegisterAnimationSequence("LoseFocus", var_8_41)

	local var_8_42 = {
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

	var_8_9:RegisterAnimationSequence("LoseFocus", var_8_42)

	local function var_8_43()
		var_8_4:AnimateSequence("LoseFocus")
		var_8_6:AnimateSequence("LoseFocus")
		var_8_9:AnimateSequence("LoseFocus")
	end

	var_8_0._sequences.LoseFocus = var_8_43

	local function var_8_44()
		return
	end

	var_8_0._sequences.Active = var_8_44

	local var_8_45
	local var_8_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOverActive", var_8_46)

	local var_8_47 = {
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

	var_8_6:RegisterAnimationSequence("ButtonOverActive", var_8_47)

	local var_8_48 = {
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

	var_8_9:RegisterAnimationSequence("ButtonOverActive", var_8_48)

	local var_8_49 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOverActive", var_8_49)

	local function var_8_50()
		var_8_4:AnimateSequence("ButtonOverActive")
		var_8_6:AnimateSequence("ButtonOverActive")
		var_8_9:AnimateSequence("ButtonOverActive")
		var_8_11:AnimateSequence("ButtonOverActive")
	end

	var_8_0._sequences.ButtonOverActive = var_8_50

	local var_8_51
	local var_8_52 = {
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

	var_8_6:RegisterAnimationSequence("ButtonUpActive", var_8_52)

	local var_8_53 = {
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

	var_8_9:RegisterAnimationSequence("ButtonUpActive", var_8_53)

	local function var_8_54()
		var_8_6:AnimateSequence("ButtonUpActive")
		var_8_9:AnimateSequence("ButtonUpActive")
	end

	var_8_0._sequences.ButtonUpActive = var_8_54

	local var_8_55
	local var_8_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipSetup", var_8_56)

	local var_8_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_9:RegisterAnimationSequence("WZWipSetup", var_8_57)

	local var_8_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_8_11:RegisterAnimationSequence("WZWipSetup", var_8_58)

	local function var_8_59()
		var_8_6:AnimateSequence("WZWipSetup")
		var_8_9:AnimateSequence("WZWipSetup")
		var_8_11:AnimateSequence("WZWipSetup")
	end

	var_8_0._sequences.WZWipSetup = var_8_59

	local var_8_60
	local var_8_61 = {
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
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonOver", var_8_61)

	local var_8_62 = {
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
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_9:RegisterAnimationSequence("WZWipButtonOver", var_8_62)

	local function var_8_63()
		var_8_6:AnimateSequence("WZWipButtonOver")
		var_8_9:AnimateSequence("WZWipButtonOver")
	end

	var_8_0._sequences.WZWipButtonOver = var_8_63

	local var_8_64
	local var_8_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("WZWipButtonOverActive", var_8_65)

	local var_8_66 = {
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
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonOverActive", var_8_66)

	local var_8_67 = {
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
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_9:RegisterAnimationSequence("WZWipButtonOverActive", var_8_67)

	local var_8_68 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_11:RegisterAnimationSequence("WZWipButtonOverActive", var_8_68)

	local function var_8_69()
		var_8_4:AnimateSequence("WZWipButtonOverActive")
		var_8_6:AnimateSequence("WZWipButtonOverActive")
		var_8_9:AnimateSequence("WZWipButtonOverActive")
		var_8_11:AnimateSequence("WZWipButtonOverActive")
	end

	var_8_0._sequences.WZWipButtonOverActive = var_8_69

	local var_8_70
	local var_8_71 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_71)

	local var_8_72 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_9:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_72)

	local function var_8_73()
		var_8_6:AnimateSequence("WZWipButtonOverDisabled")
		var_8_9:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_8_0._sequences.WZWipButtonOverDisabled = var_8_73

	local var_8_74
	local var_8_75 = {
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
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonUp", var_8_75)

	local var_8_76 = {
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
		}
	}

	var_8_9:RegisterAnimationSequence("WZWipButtonUp", var_8_76)

	local function var_8_77()
		var_8_6:AnimateSequence("WZWipButtonUp")
		var_8_9:AnimateSequence("WZWipButtonUp")
	end

	var_8_0._sequences.WZWipButtonUp = var_8_77

	local var_8_78
	local var_8_79 = {
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
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonUpActive", var_8_79)

	local var_8_80 = {
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
		}
	}

	var_8_9:RegisterAnimationSequence("WZWipButtonUpActive", var_8_80)

	local function var_8_81()
		var_8_6:AnimateSequence("WZWipButtonUpActive")
		var_8_9:AnimateSequence("WZWipButtonUpActive")
	end

	var_8_0._sequences.WZWipButtonUpActive = var_8_81

	local var_8_82
	local var_8_83 = {
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
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_83)

	local var_8_84 = {
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
		}
	}

	var_8_9:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_84)

	local function var_8_85()
		var_8_6:AnimateSequence("WZWipButtonUpDisabled")
		var_8_9:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_8_0._sequences.WZWipButtonUpDisabled = var_8_85

	local var_8_86
	local var_8_87 = {
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

	var_8_4:RegisterAnimationSequence("WZWipGainFocus", var_8_87)

	local var_8_88 = {
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

	var_8_6:RegisterAnimationSequence("WZWipGainFocus", var_8_88)

	local var_8_89 = {
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

	var_8_9:RegisterAnimationSequence("WZWipGainFocus", var_8_89)

	local function var_8_90()
		var_8_4:AnimateSequence("WZWipGainFocus")
		var_8_6:AnimateSequence("WZWipGainFocus")
		var_8_9:AnimateSequence("WZWipGainFocus")
	end

	var_8_0._sequences.WZWipGainFocus = var_8_90

	local function var_8_91()
		return
	end

	var_8_0._sequences.WZWipLocked = var_8_91

	local var_8_92
	local var_8_93 = {
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

	var_8_4:RegisterAnimationSequence("WZWipLoseFocus", var_8_93)

	local var_8_94 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			value = 2,
			duration = 80,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipLoseFocus", var_8_94)

	local var_8_95 = {
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
			value = 0.2,
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

	var_8_9:RegisterAnimationSequence("WZWipLoseFocus", var_8_95)

	local function var_8_96()
		var_8_4:AnimateSequence("WZWipLoseFocus")
		var_8_6:AnimateSequence("WZWipLoseFocus")
		var_8_9:AnimateSequence("WZWipLoseFocus")
	end

	var_8_0._sequences.WZWipLoseFocus = var_8_96

	local function var_8_97()
		return
	end

	var_8_0._sequences.WZWipActive = var_8_97

	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("GenericSliderBar", GenericSliderBar)
LockTable(_M)
