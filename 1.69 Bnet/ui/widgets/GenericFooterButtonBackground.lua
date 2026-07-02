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

function GenericFooterButtonBackground(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 46 * _1080p)

	var_4_0.id = "GenericFooterButtonBackground"
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

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZContainerBackground, 0)
	var_4_4:SetAlpha(0.45, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_4_5 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
			controllerIndex = var_4_1
		})
		var_4_5.id = "TextGlow"

		var_4_5:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
		var_4_5:SetAlpha(0, 0)
		var_4_5:SetPixelGridEnabled(true)
		var_4_5:SetPixelGridContrast(0.5, 0)
		var_4_5:SetPixelGridBlockWidth(2, 0)
		var_4_5:SetPixelGridBlockHeight(2, 0)
		var_4_5:SetPixelGridGutterWidth(1, 0)
		var_4_5:SetPixelGridGutterHeight(1, 0)
		var_4_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 121, _1080p * 22, _1080p * -16, _1080p * 16)
		var_4_0:addElement(var_4_5)

		var_4_0.TextGlow = var_4_5
	end

	local var_4_6

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_4_6 = LUI.UIImage.new()
		var_4_6.id = "TextureLayer"

		var_4_6:SetAlpha(0.05, 0)
		var_4_6:SetPixelGridEnabled(true)
		var_4_6:SetPixelGridContrast(0.8, 0)
		var_4_6:SetPixelGridBlockWidth(2, 0)
		var_4_6:SetPixelGridBlockHeight(2, 0)
		var_4_6:SetPixelGridGutterWidth(1, 0)
		var_4_6:SetPixelGridGutterHeight(1, 0)
		var_4_6:setImage(RegisterMaterial("ui_default_white"), 0)
		var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
		var_4_0:addElement(var_4_6)

		var_4_0.TextureLayer = var_4_6
	end

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Line"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_4_0:addElement(var_4_8)

	var_4_0.Line = var_4_8

	local var_4_9

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_4_9 = LUI.UIImage.new()
		var_4_9.id = "Glow"

		var_4_9:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
		var_4_9:SetAlpha(0, 0)
		var_4_9:SetPixelGridEnabled(true)
		var_4_9:SetPixelGridContrast(0.5, 0)
		var_4_9:SetPixelGridBlockWidth(2, 0)
		var_4_9:SetPixelGridBlockHeight(2, 0)
		var_4_9:SetPixelGridGutterWidth(1, 0)
		var_4_9:SetPixelGridGutterHeight(1, 0)
		var_4_9:setImage(RegisterMaterial("button_glow"), 0)
		var_4_9:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
		var_4_9:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
		var_4_0:addElement(var_4_9)

		var_4_0.Glow = var_4_9
	end

	local var_4_10

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		var_4_10 = LUI.UIImage.new()
		var_4_10.id = "BotBorderWZ"

		var_4_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_4_10:SetAlpha(0.6, 0)
		var_4_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
		var_4_0:addElement(var_4_10)

		var_4_0.BotBorderWZ = var_4_10
	end

	local var_4_11

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		var_4_11 = LUI.UIImage.new()
		var_4_11.id = "TopBorderWZ"

		var_4_11:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_4_11:SetAlpha(0.6, 0)
		var_4_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
		var_4_0:addElement(var_4_11)

		var_4_0.TopBorderWZ = var_4_11
	end

	local function var_4_12()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_12

	local var_4_13
	local var_4_14 = {
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
			value = _1080p * 4
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_14)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_15 = {
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

		var_4_6:RegisterAnimationSequence("ButtonOver", var_4_15)
	end

	local var_4_16 = {
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

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_16)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_17 = {
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

		var_4_9:RegisterAnimationSequence("ButtonOver", var_4_17)
	end

	local function var_4_18()
		var_4_4:AnimateSequence("ButtonOver")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("ButtonOver")
		end

		var_4_8:AnimateSequence("ButtonOver")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_9:AnimateSequence("ButtonOver")
		end
	end

	var_4_0._sequences.ButtonOver = var_4_18

	local var_4_19
	local var_4_20 = {
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

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_20)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_21 = {
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

		var_4_6:RegisterAnimationSequence("ButtonUp", var_4_21)
	end

	local var_4_22 = {
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

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_22)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_23 = {
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

		var_4_9:RegisterAnimationSequence("ButtonUp", var_4_23)
	end

	local function var_4_24()
		var_4_4:AnimateSequence("ButtonUp")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("ButtonUp")
		end

		var_4_8:AnimateSequence("ButtonUp")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_9:AnimateSequence("ButtonUp")
		end
	end

	var_4_0._sequences.ButtonUp = var_4_24

	local function var_4_25()
		return
	end

	var_4_0._sequences.Locked = var_4_25

	local var_4_26
	local var_4_27 = {
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

	var_4_4:RegisterAnimationSequence("ButtonOverDisabled", var_4_27)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_28 = {
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

		var_4_6:RegisterAnimationSequence("ButtonOverDisabled", var_4_28)
	end

	local var_4_29 = {
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

	var_4_8:RegisterAnimationSequence("ButtonOverDisabled", var_4_29)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_30 = {
			{
				value = 0.6,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_9:RegisterAnimationSequence("ButtonOverDisabled", var_4_30)
	end

	local function var_4_31()
		var_4_4:AnimateSequence("ButtonOverDisabled")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("ButtonOverDisabled")
		end

		var_4_8:AnimateSequence("ButtonOverDisabled")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_9:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_4_0._sequences.ButtonOverDisabled = var_4_31

	local var_4_32
	local var_4_33 = {
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

	var_4_4:RegisterAnimationSequence("ButtonUpDisabled", var_4_33)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_34 = {
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

		var_4_6:RegisterAnimationSequence("ButtonUpDisabled", var_4_34)
	end

	local var_4_35 = {
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

	var_4_8:RegisterAnimationSequence("ButtonUpDisabled", var_4_35)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_36 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_9:RegisterAnimationSequence("ButtonUpDisabled", var_4_36)
	end

	local function var_4_37()
		var_4_4:AnimateSequence("ButtonUpDisabled")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("ButtonUpDisabled")
		end

		var_4_8:AnimateSequence("ButtonUpDisabled")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_9:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_4_0._sequences.ButtonUpDisabled = var_4_37

	local var_4_38
	local var_4_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonUpSnap", var_4_39)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_40 = {
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

		var_4_6:RegisterAnimationSequence("ButtonUpSnap", var_4_40)
	end

	local var_4_41 = {
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

	var_4_8:RegisterAnimationSequence("ButtonUpSnap", var_4_41)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_42 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_9:RegisterAnimationSequence("ButtonUpSnap", var_4_42)
	end

	local function var_4_43()
		var_4_4:AnimateSequence("ButtonUpSnap")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("ButtonUpSnap")
		end

		var_4_8:AnimateSequence("ButtonUpSnap")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_9:AnimateSequence("ButtonUpSnap")
		end
	end

	var_4_0._sequences.ButtonUpSnap = var_4_43

	local var_4_44
	local var_4_45 = {
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

	var_4_4:RegisterAnimationSequence("ButtonUpDisabledSnap", var_4_45)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_46 = {
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

		var_4_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_4_46)
	end

	local var_4_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_4_47)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_48 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_9:RegisterAnimationSequence("ButtonUpDisabledSnap", var_4_48)
	end

	local function var_4_49()
		var_4_4:AnimateSequence("ButtonUpDisabledSnap")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_6:AnimateSequence("ButtonUpDisabledSnap")
		end

		var_4_8:AnimateSequence("ButtonUpDisabledSnap")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_9:AnimateSequence("ButtonUpDisabledSnap")
		end
	end

	var_4_0._sequences.ButtonUpDisabledSnap = var_4_49

	local var_4_50

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_51 = {
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

		var_4_5:RegisterAnimationSequence("GlowAnim", var_4_51)
	end

	local function var_4_52()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_5:AnimateLoop("GlowAnim")
		end
	end

	var_4_0._sequences.GlowAnim = var_4_52

	local var_4_53

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("GlowStop", var_4_54)
	end

	local function var_4_55()
		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_5:AnimateSequence("GlowStop")
		end
	end

	var_4_0._sequences.GlowStop = var_4_55

	local var_4_56
	local var_4_57 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipSetup", var_4_57)

	local var_4_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_58)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_59 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_9:RegisterAnimationSequence("WZWipSetup", var_4_59)
	end

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_60 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipSetup", var_4_60)
	end

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_61 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipSetup", var_4_61)
	end

	local function var_4_62()
		var_4_4:AnimateSequence("WZWipSetup")
		var_4_8:AnimateSequence("WZWipSetup")

		if not CONDITIONS.IsWZWipDvarEnabled() then
			var_4_9:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_10:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_11:AnimateSequence("WZWipSetup")
		end
	end

	var_4_0._sequences.WZWipSetup = var_4_62

	local var_4_63
	local var_4_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonOver", var_4_64)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_65 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipButtonOver", var_4_65)
	end

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_66 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipButtonOver", var_4_66)
	end

	local function var_4_67()
		var_4_4:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_10:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_11:AnimateSequence("WZWipButtonOver")
		end
	end

	var_4_0._sequences.WZWipButtonOver = var_4_67

	local var_4_68
	local var_4_69 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonOverDisabled", var_4_69)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_70 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_4_70)
	end

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_71 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipButtonOverDisabled", var_4_71)
	end

	local function var_4_72()
		var_4_4:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_10:AnimateSequence("WZWipButtonOverDisabled")
		end

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_11:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_4_0._sequences.WZWipButtonOverDisabled = var_4_72

	local var_4_73
	local var_4_74 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonUp", var_4_74)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_75 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipButtonUp", var_4_75)
	end

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_76 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipButtonUp", var_4_76)
	end

	local function var_4_77()
		var_4_4:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_10:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_11:AnimateSequence("WZWipButtonUp")
		end
	end

	var_4_0._sequences.WZWipButtonUp = var_4_77

	local var_4_78
	local var_4_79 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonUpDisabled", var_4_79)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_80 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_4_80)
	end

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_81 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipButtonUpDisabled", var_4_81)
	end

	local function var_4_82()
		var_4_4:AnimateSequence("WZWipButtonUpDisabled")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_10:AnimateSequence("WZWipButtonUpDisabled")
		end

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_11:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_4_0._sequences.WZWipButtonUpDisabled = var_4_82

	local var_4_83
	local var_4_84 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_4_84)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_85 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_4_85)
	end

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_86 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_4_86)
	end

	local function var_4_87()
		var_4_4:AnimateSequence("WZWipButtonUpDisabledSnap")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_10:AnimateSequence("WZWipButtonUpDisabledSnap")
		end

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_11:AnimateSequence("WZWipButtonUpDisabledSnap")
		end
	end

	var_4_0._sequences.WZWipButtonUpDisabledSnap = var_4_87

	local var_4_88
	local var_4_89 = {
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
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_4_4:RegisterAnimationSequence("WZWipButtonUpSnap", var_4_89)

	local var_4_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipButtonUpSnap", var_4_90)

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_91 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipButtonUpSnap", var_4_91)
	end

	if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
		local var_4_92 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipButtonUpSnap", var_4_92)
	end

	local function var_4_93()
		var_4_4:AnimateSequence("WZWipButtonUpSnap")
		var_4_8:AnimateSequence("WZWipButtonUpSnap")

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_10:AnimateSequence("WZWipButtonUpSnap")
		end

		if CONDITIONS.IsWZWipDvarAndNotUsingWZSimpleUI() then
			var_4_11:AnimateSequence("WZWipButtonUpSnap")
		end
	end

	var_4_0._sequences.WZWipButtonUpSnap = var_4_93

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GenericFooterButtonBackground", GenericFooterButtonBackground)
LockTable(_M)
