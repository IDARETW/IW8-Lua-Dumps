module(..., package.seeall)

function GenericFooterButtonBackground(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 46 * _1080p)

	var_1_0.id = "GenericFooterButtonBackground"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "TextGlow"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:SetPixelGridEnabled(true)
	var_1_4:SetPixelGridContrast(0.5, 0)
	var_1_4:SetPixelGridBlockWidth(2, 0)
	var_1_4:SetPixelGridBlockHeight(2, 0)
	var_1_4:SetPixelGridGutterWidth(1, 0)
	var_1_4:SetPixelGridGutterHeight(1, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 121, _1080p * 22, _1080p * -16, _1080p * 16)
	var_1_0:addElement(var_1_4)

	var_1_0.TextGlow = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Backer"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_1_6:SetAlpha(0.45, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Backer = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "TextureLayer"

	var_1_8:SetAlpha(0.05, 0)
	var_1_8:SetPixelGridEnabled(true)
	var_1_8:SetPixelGridContrast(0.8, 0)
	var_1_8:SetPixelGridBlockWidth(2, 0)
	var_1_8:SetPixelGridBlockHeight(2, 0)
	var_1_8:SetPixelGridGutterWidth(1, 0)
	var_1_8:SetPixelGridGutterHeight(1, 0)
	var_1_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
	var_1_0:addElement(var_1_8)

	var_1_0.TextureLayer = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Line"

	var_1_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_1_0:addElement(var_1_10)

	var_1_0.Line = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Glow"

	var_1_12:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_1_12:SetAlpha(0, 0)
	var_1_12:SetPixelGridEnabled(true)
	var_1_12:SetPixelGridContrast(0.5, 0)
	var_1_12:SetPixelGridBlockWidth(2, 0)
	var_1_12:SetPixelGridBlockHeight(2, 0)
	var_1_12:SetPixelGridGutterWidth(1, 0)
	var_1_12:SetPixelGridGutterHeight(1, 0)
	var_1_12:setImage(RegisterMaterial("button_glow"), 0)
	var_1_12:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_1_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_1_0:addElement(var_1_12)

	var_1_0.Glow = var_1_12

	local function var_1_13()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14 = {
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

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_14)

	local var_1_15 = {
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

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_15)

	local var_1_16 = {
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

	var_1_10:RegisterAnimationSequence("ButtonOver", var_1_16)

	local var_1_17 = {
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

	var_1_12:RegisterAnimationSequence("ButtonOver", var_1_17)

	local function var_1_18()
		var_1_6:AnimateSequence("ButtonOver")
		var_1_8:AnimateSequence("ButtonOver")
		var_1_10:AnimateSequence("ButtonOver")
		var_1_12:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_18

	local var_1_19 = {
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

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_19)

	local var_1_20 = {
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

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_20)

	local var_1_21 = {
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

	var_1_10:RegisterAnimationSequence("ButtonUp", var_1_21)

	local var_1_22 = {
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

	var_1_12:RegisterAnimationSequence("ButtonUp", var_1_22)

	local function var_1_23()
		var_1_6:AnimateSequence("ButtonUp")
		var_1_8:AnimateSequence("ButtonUp")
		var_1_10:AnimateSequence("ButtonUp")
		var_1_12:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_23

	local function var_1_24()
		return
	end

	var_1_0._sequences.Locked = var_1_24

	local var_1_25 = {
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

	var_1_6:RegisterAnimationSequence("ButtonOverDisabled", var_1_25)

	local var_1_26 = {
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

	var_1_8:RegisterAnimationSequence("ButtonOverDisabled", var_1_26)

	local var_1_27 = {
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

	var_1_10:RegisterAnimationSequence("ButtonOverDisabled", var_1_27)

	local var_1_28 = {
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonOverDisabled", var_1_28)

	local function var_1_29()
		var_1_6:AnimateSequence("ButtonOverDisabled")
		var_1_8:AnimateSequence("ButtonOverDisabled")
		var_1_10:AnimateSequence("ButtonOverDisabled")
		var_1_12:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_29

	local var_1_30 = {
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

	var_1_6:RegisterAnimationSequence("ButtonUpDisabled", var_1_30)

	local var_1_31 = {
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

	var_1_8:RegisterAnimationSequence("ButtonUpDisabled", var_1_31)

	local var_1_32 = {
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

	var_1_10:RegisterAnimationSequence("ButtonUpDisabled", var_1_32)

	local var_1_33 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonUpDisabled", var_1_33)

	local function var_1_34()
		var_1_6:AnimateSequence("ButtonUpDisabled")
		var_1_8:AnimateSequence("ButtonUpDisabled")
		var_1_10:AnimateSequence("ButtonUpDisabled")
		var_1_12:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_34

	local var_1_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUpSnap", var_1_35)

	local var_1_36 = {
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

	var_1_8:RegisterAnimationSequence("ButtonUpSnap", var_1_36)

	local var_1_37 = {
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

	var_1_10:RegisterAnimationSequence("ButtonUpSnap", var_1_37)

	local var_1_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonUpSnap", var_1_38)

	local function var_1_39()
		var_1_6:AnimateSequence("ButtonUpSnap")
		var_1_8:AnimateSequence("ButtonUpSnap")
		var_1_10:AnimateSequence("ButtonUpSnap")
		var_1_12:AnimateSequence("ButtonUpSnap")
	end

	var_1_0._sequences.ButtonUpSnap = var_1_39

	local var_1_40 = {
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

	var_1_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_1_40)

	local var_1_41 = {
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

	var_1_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_1_41)

	local var_1_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUpDisabledSnap", var_1_42)

	local var_1_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonUpDisabledSnap", var_1_43)

	local function var_1_44()
		var_1_6:AnimateSequence("ButtonUpDisabledSnap")
		var_1_8:AnimateSequence("ButtonUpDisabledSnap")
		var_1_10:AnimateSequence("ButtonUpDisabledSnap")
		var_1_12:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_1_0._sequences.ButtonUpDisabledSnap = var_1_44

	local var_1_45 = {
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

	var_1_4:RegisterAnimationSequence("GlowAnim", var_1_45)

	local function var_1_46()
		var_1_4:AnimateLoop("GlowAnim")
	end

	var_1_0._sequences.GlowAnim = var_1_46

	local var_1_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("GlowStop", var_1_47)

	local function var_1_48()
		var_1_4:AnimateSequence("GlowStop")
	end

	var_1_0._sequences.GlowStop = var_1_48

	var_1_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)

	return var_1_0
end

MenuBuilder.registerType("GenericFooterButtonBackground", GenericFooterButtonBackground)
LockTable(_M)
