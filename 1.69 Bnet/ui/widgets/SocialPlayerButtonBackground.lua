module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled"))
	end)
	arg_1_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if arg_4_1.snap ~= nil then
			ACTIONS.AnimateSequence(arg_4_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpSnap"))
		else
			ACTIONS.AnimateSequence(arg_4_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
		end
	end)
	arg_1_0:addEventHandler("button_up_disable", function(arg_5_0, arg_5_1)
		if arg_5_1.snap ~= nil then
			ACTIONS.AnimateSequence(arg_5_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabledSnap"))
		else
			ACTIONS.AnimateSequence(arg_5_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled"))
		end
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function SocialPlayerButtonBackground(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 44 * _1080p)

	var_6_0.id = "SocialPlayerButtonBackground"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "TextGlow"

	var_6_4:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
	var_6_4:SetAlpha(0, 0)
	var_6_4:SetPixelGridEnabled(true)
	var_6_4:SetPixelGridContrast(0.5, 0)
	var_6_4:SetPixelGridBlockWidth(2, 0)
	var_6_4:SetPixelGridBlockHeight(2, 0)
	var_6_4:SetPixelGridGutterWidth(1, 0)
	var_6_4:SetPixelGridGutterHeight(1, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 121, _1080p * 22, _1080p * -16, _1080p * 16)
	var_6_0:addElement(var_6_4)

	var_6_0.TextGlow = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Backer"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_6_6:SetAlpha(0.45, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.Backer = var_6_6

	local var_6_7

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_6_7 = LUI.UIImage.new()
		var_6_7.id = "TextureLayer"

		var_6_7:SetAlpha(0.05, 0)
		var_6_7:SetPixelGridEnabled(true)
		var_6_7:SetPixelGridContrast(0.8, 0)
		var_6_7:SetPixelGridBlockWidth(2, 0)
		var_6_7:SetPixelGridBlockHeight(2, 0)
		var_6_7:SetPixelGridGutterWidth(1, 0)
		var_6_7:SetPixelGridGutterHeight(1, 0)
		var_6_7:setImage(RegisterMaterial("ui_default_white"), 0)
		var_6_0:addElement(var_6_7)

		var_6_0.TextureLayer = var_6_7
	end

	local var_6_8

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_6_8 = LUI.UIImage.new()
		var_6_8.id = "Line"

		var_6_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
		var_6_8:SetAlpha(0, 0)
		var_6_8:SetBlendMode(BLEND_MODE.addWithAlpha)
		var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
		var_6_0:addElement(var_6_8)

		var_6_0.Line = var_6_8
	end

	local var_6_9

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_6_9 = LUI.UIImage.new()
		var_6_9.id = "Glow"

		var_6_9:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
		var_6_9:SetAlpha(0, 0)
		var_6_9:SetPixelGridEnabled(true)
		var_6_9:SetPixelGridContrast(0.5, 0)
		var_6_9:SetPixelGridBlockWidth(2, 0)
		var_6_9:SetPixelGridBlockHeight(2, 0)
		var_6_9:SetPixelGridGutterWidth(1, 0)
		var_6_9:SetPixelGridGutterHeight(1, 0)
		var_6_9:setImage(RegisterMaterial("button_glow"), 0)
		var_6_9:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
		var_6_9:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
		var_6_0:addElement(var_6_9)

		var_6_0.Glow = var_6_9
	end

	local function var_6_10()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_10

	local var_6_11
	local var_6_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 3
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_12)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_13 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("widg_gradient_center_out")
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 4
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -4
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			},
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_7:RegisterAnimationSequence("ButtonOver", var_6_13)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_14 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -3
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -4
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_6_8:RegisterAnimationSequence("ButtonOver", var_6_14)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_15 = {
			{
				duration = 100,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -11
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 11
			},
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("ButtonOver", var_6_15)
	end

	local function var_6_16()
		var_6_6:AnimateSequence("ButtonOver")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_7:AnimateSequence("ButtonOver")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_8:AnimateSequence("ButtonOver")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_9:AnimateSequence("ButtonOver")
		end
	end

	var_6_0._sequences.ButtonOver = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.border
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0.45,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_18)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_19 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
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
				value = 0.05,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 1
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -1
			}
		}

		var_6_7:RegisterAnimationSequence("ButtonUp", var_6_19)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_20 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDefault
			},
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Top
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 1
			}
		}

		var_6_8:RegisterAnimationSequence("ButtonUp", var_6_20)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_21 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -7
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 7
			}
		}

		var_6_9:RegisterAnimationSequence("ButtonUp", var_6_21)
	end

	local function var_6_22()
		var_6_6:AnimateSequence("ButtonUp")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_7:AnimateSequence("ButtonUp")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_8:AnimateSequence("ButtonUp")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_9:AnimateSequence("ButtonUp")
		end
	end

	var_6_0._sequences.ButtonUp = var_6_22

	local function var_6_23()
		return
	end

	var_6_0._sequences.Locked = var_6_23

	local var_6_24
	local var_6_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOverDisabled", var_6_25)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_26 = {
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
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_7:RegisterAnimationSequence("ButtonOverDisabled", var_6_26)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_27 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_8:RegisterAnimationSequence("ButtonOverDisabled", var_6_27)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_28 = {
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("ButtonOverDisabled", var_6_28)
	end

	local function var_6_29()
		var_6_6:AnimateSequence("ButtonOverDisabled")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_7:AnimateSequence("ButtonOverDisabled")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_8:AnimateSequence("ButtonOverDisabled")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_9:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_6_0._sequences.ButtonOverDisabled = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpDisabled", var_6_31)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_32 = {
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
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_7:RegisterAnimationSequence("ButtonUpDisabled", var_6_32)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDefault
			}
		}

		var_6_8:RegisterAnimationSequence("ButtonUpDisabled", var_6_33)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_34 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("ButtonUpDisabled", var_6_34)
	end

	local function var_6_35()
		var_6_6:AnimateSequence("ButtonUpDisabled")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_7:AnimateSequence("ButtonUpDisabled")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_8:AnimateSequence("ButtonUpDisabled")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_9:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_6_0._sequences.ButtonUpDisabled = var_6_35

	local var_6_36
	local var_6_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpSnap", var_6_37)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_38 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
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
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			}
		}

		var_6_7:RegisterAnimationSequence("ButtonUpSnap", var_6_38)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDefault
			}
		}

		var_6_8:RegisterAnimationSequence("ButtonUpSnap", var_6_39)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_40 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("ButtonUpSnap", var_6_40)
	end

	local function var_6_41()
		var_6_6:AnimateSequence("ButtonUpSnap")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_7:AnimateSequence("ButtonUpSnap")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_8:AnimateSequence("ButtonUpSnap")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_9:AnimateSequence("ButtonUpSnap")
		end
	end

	var_6_0._sequences.ButtonUpSnap = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabled
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_6_43)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_44 = {
			{
				value = 0.1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
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
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_default_white")
			}
		}

		var_6_7:RegisterAnimationSequence("ButtonUpDisabledSnap", var_6_44)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_6_45)
	end

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_6_46 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_9:RegisterAnimationSequence("ButtonUpDisabledSnap", var_6_46)
	end

	local function var_6_47()
		var_6_6:AnimateSequence("ButtonUpDisabledSnap")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_7:AnimateSequence("ButtonUpDisabledSnap")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_8:AnimateSequence("ButtonUpDisabledSnap")
		end

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_6_9:AnimateSequence("ButtonUpDisabledSnap")
		end
	end

	var_6_0._sequences.ButtonUpDisabledSnap = var_6_47

	local var_6_48
	local var_6_49 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.98,
			duration = 230,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.85,
			duration = 850,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuintic
		},
		{
			value = 0.78,
			duration = 1200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuartic
		},
		{
			value = 0.8,
			duration = 610,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuartic
		}
	}

	var_6_4:RegisterAnimationSequence("GlowAnim", var_6_49)

	local function var_6_50()
		var_6_4:AnimateLoop("GlowAnim")
	end

	var_6_0._sequences.GlowAnim = var_6_50

	local var_6_51
	local var_6_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("GlowStop", var_6_52)

	local function var_6_53()
		var_6_4:AnimateSequence("GlowStop")
	end

	var_6_0._sequences.GlowStop = var_6_53

	local var_6_54
	local var_6_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOver", var_6_55)

	local function var_6_56()
		var_6_6:AnimateSequence("WZWipButtonOver")
	end

	var_6_0._sequences.WZWipButtonOver = var_6_56

	local var_6_57
	local var_6_58 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_6_58)

	local function var_6_59()
		var_6_6:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_6_0._sequences.WZWipButtonOverDisabled = var_6_59

	local var_6_60
	local var_6_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUp", var_6_61)

	local function var_6_62()
		var_6_6:AnimateSequence("WZWipButtonUp")
	end

	var_6_0._sequences.WZWipButtonUp = var_6_62

	local var_6_63
	local var_6_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_6_64)

	local function var_6_65()
		var_6_6:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_6_0._sequences.WZWipButtonUpDisabled = var_6_65

	local var_6_66
	local var_6_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUpSnap", var_6_67)

	local function var_6_68()
		var_6_6:AnimateSequence("WZWipButtonUpSnap")
	end

	var_6_0._sequences.WZWipButtonUpSnap = var_6_68

	local var_6_69
	local var_6_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_6_70)

	local function var_6_71()
		var_6_6:AnimateSequence("WZWipButtonUpDisabledSnap")
	end

	var_6_0._sequences.WZWipButtonUpDisabledSnap = var_6_71

	local var_6_72
	local var_6_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipSetup", var_6_73)

	local function var_6_74()
		var_6_6:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_74

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("SocialPlayerButtonBackground", SocialPlayerButtonBackground)
LockTable(_M)
