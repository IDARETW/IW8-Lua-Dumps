module(..., package.seeall)

local var_0_0 = 12 * _1080p
local var_0_1 = true

local function var_0_2(arg_1_0)
	local var_1_0 = IsLanguageArabic() and 1 or 1.18
	local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.FreeBundleText) * var_1_0
	local var_1_2 = {
		arg_1_0.GradientLeft,
		arg_1_0.TextureLayerLeft
	}
	local var_1_3 = {
		arg_1_0.GradientRight,
		arg_1_0.TextureLayerRight
	}
	local var_1_4 = LAYOUT.GetElementWidth(arg_1_0.Arrow1)
	local var_1_5 = -var_1_1 / 2 - var_0_0

	arg_1_0.Arrow2:SetRight(var_1_5)
	arg_1_0.Arrow2:SetLeft(var_1_5 - var_1_4)

	for iter_1_0 = 1, #var_1_2 do
		var_1_2[iter_1_0]:SetRight(var_1_5 - var_1_4 - var_0_0)
	end

	local var_1_6 = var_1_1 / 2 + var_0_0

	arg_1_0.Arrow1:SetLeft(var_1_6)
	arg_1_0.Arrow1:SetRight(var_1_6 + var_1_4)

	for iter_1_1 = 1, #var_1_3 do
		var_1_3[iter_1_1]:SetLeft(var_1_6 + var_1_4 + var_0_0)
	end
end

local function var_0_3(arg_2_0)
	arg_2_0._isImprovedFree = true

	if var_0_1 then
		ACTIONS.AnimateSequence(arg_2_0, "FreeImproved")
		ACTIONS.AnimateSequence(arg_2_0, "FreeMoving")
		var_0_2(arg_2_0)
	else
		ACTIONS.AnimateSequence(arg_2_0, "Free")
	end
end

local function var_0_4(arg_3_0, arg_3_1)
	if arg_3_0._isImprovedFree or arg_3_1 then
		arg_3_0._isImprovedFree = false

		ACTIONS.AnimateSequence(arg_3_0, "ResetPos")
		ACTIONS.AnimateSequence(arg_3_0, "ArrowMoving")
	end
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetFreeState = var_0_3
	arg_4_0.ClearState = var_0_4

	arg_4_0:ClearState(true)

	if not IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "Kerning")
	end
end

function StoreScrollArrow(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p)

	var_5_0.id = "StoreScrollArrow"
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

	var_5_4.id = "GradientLeft"

	var_5_4:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_4:SetPixelGridEnabled(true)
	var_5_4:SetPixelGridContrast(0.2, 0)
	var_5_4:SetPixelGridBlockWidth(2, 0)
	var_5_4:SetPixelGridBlockHeight(2, 0)
	var_5_4:SetPixelGridGutterWidth(1, 0)
	var_5_4:SetPixelGridGutterHeight(1, 0)
	var_5_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -241, _1080p * -25, _1080p * 23, _1080p * 25)
	var_5_0:addElement(var_5_4)

	var_5_0.GradientLeft = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "TextureLayerLeft"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_5_6:SetAlpha(0.1, 0)
	var_5_6:SetPixelGridEnabled(true)
	var_5_6:SetPixelGridContrast(0.8, 0)
	var_5_6:SetPixelGridBlockWidth(2, 0)
	var_5_6:SetPixelGridBlockHeight(2, 0)
	var_5_6:SetPixelGridGutterWidth(1, 0)
	var_5_6:SetPixelGridGutterHeight(1, 0)
	var_5_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -241, _1080p * -25, _1080p * 23, _1080p * 25)
	var_5_0:addElement(var_5_6)

	var_5_0.TextureLayerLeft = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "GradientRight"

	var_5_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_8:SetPixelGridEnabled(true)
	var_5_8:SetPixelGridContrast(0.2, 0)
	var_5_8:SetPixelGridBlockWidth(2, 0)
	var_5_8:SetPixelGridBlockHeight(2, 0)
	var_5_8:SetPixelGridGutterWidth(1, 0)
	var_5_8:SetPixelGridGutterHeight(1, 0)
	var_5_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 25, _1080p * 241, _1080p * 23, _1080p * 25)
	var_5_0:addElement(var_5_8)

	var_5_0.GradientRight = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "TextureLayerRight"

	var_5_10:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_5_10:SetAlpha(0.1, 0)
	var_5_10:SetPixelGridEnabled(true)
	var_5_10:SetPixelGridContrast(0.8, 0)
	var_5_10:SetPixelGridBlockWidth(2, 0)
	var_5_10:SetPixelGridBlockHeight(2, 0)
	var_5_10:SetPixelGridGutterWidth(1, 0)
	var_5_10:SetPixelGridGutterHeight(1, 0)
	var_5_10:setImage(RegisterMaterial("ui_default_white"), 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 25, _1080p * 241, _1080p * 23, _1080p * 25)
	var_5_0:addElement(var_5_10)

	var_5_0.TextureLayerRight = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "ArrowGlow"

	var_5_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_12:SetScale(-0.5, 0)
	var_5_12:setImage(RegisterMaterial("store_arrow_glow"), 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * 11, _1080p * 41)
	var_5_0:addElement(var_5_12)

	var_5_0.ArrowGlow = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "Arrow2"

	var_5_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_14:SetAlpha(0.24, 0)
	var_5_14:SetScale(-0.5, 0)
	var_5_14:setImage(RegisterMaterial("store_arrow"), 0)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -3, _1080p * 27)
	var_5_0:addElement(var_5_14)

	var_5_0.Arrow2 = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "Arrow1"

	var_5_16:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_16:SetScale(-0.5, 0)
	var_5_16:setImage(RegisterMaterial("store_arrow"), 0)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * 11, _1080p * 41)
	var_5_0:addElement(var_5_16)

	var_5_0.Arrow1 = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIStyledText.new()

	var_5_18.id = "FreeBundleText"

	var_5_18:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_5_18:SetAlpha(0, 0)
	var_5_18:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/FREE_BUNDLE")), 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_18:SetWordWrap(false)
	var_5_18:SetAlignment(LUI.Alignment.Center)
	var_5_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -192, _1080p * 192, _1080p * 12, _1080p * 36)
	var_5_0:addElement(var_5_18)

	var_5_0.FreeBundleText = var_5_18

	local var_5_19
	local var_5_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_5_4:RegisterAnimationSequence("DefaultSequence", var_5_20)

	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_5_8:RegisterAnimationSequence("DefaultSequence", var_5_21)

	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("DefaultSequence", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("store_arrow")
		},
		{
			value = 0.24,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("DefaultSequence", var_5_23)

	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("store_arrow")
		}
	}

	var_5_16:RegisterAnimationSequence("DefaultSequence", var_5_24)

	local var_5_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("DefaultSequence", var_5_25)

	local function var_5_26()
		var_5_4:AnimateSequence("DefaultSequence")
		var_5_8:AnimateSequence("DefaultSequence")
		var_5_12:AnimateSequence("DefaultSequence")
		var_5_14:AnimateSequence("DefaultSequence")
		var_5_16:AnimateSequence("DefaultSequence")
		var_5_18:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_26

	local var_5_27
	local var_5_28 = {
		{
			duration = 190,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		},
		{
			duration = 190,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 1040,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 1040,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		},
		{
			duration = 550,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 46,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 550,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 16,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 340,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 340,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_12:RegisterAnimationSequence("ArrowMoving", var_5_28)

	local var_5_29 = {
		{
			duration = 190,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			duration = 190,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			value = 0,
			duration = 190,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 1040,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 1040,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 1040,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 550,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 46,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 550,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 16,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 340,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 340,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 340,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_14:RegisterAnimationSequence("ArrowMoving", var_5_29)

	local var_5_30 = {
		{
			duration = 190,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		},
		{
			duration = 190,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 1040,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		},
		{
			duration = 1040,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 550,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 16,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 550,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 46,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 340,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 340,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_16:RegisterAnimationSequence("ArrowMoving", var_5_30)

	local function var_5_31()
		var_5_12:AnimateLoop("ArrowMoving")
		var_5_14:AnimateLoop("ArrowMoving")
		var_5_16:AnimateLoop("ArrowMoving")
	end

	var_5_0._sequences.ArrowMoving = var_5_31

	local var_5_32
	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText
		}
	}

	var_5_4:RegisterAnimationSequence("New", var_5_33)

	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText
		}
	}

	var_5_8:RegisterAnimationSequence("New", var_5_34)

	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText
		}
	}

	var_5_12:RegisterAnimationSequence("New", var_5_35)

	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText
		}
	}

	var_5_14:RegisterAnimationSequence("New", var_5_36)

	local var_5_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.HotItemText
		}
	}

	var_5_16:RegisterAnimationSequence("New", var_5_37)

	local function var_5_38()
		var_5_4:AnimateSequence("New")
		var_5_8:AnimateSequence("New")
		var_5_12:AnimateSequence("New")
		var_5_14:AnimateSequence("New")
		var_5_16:AnimateSequence("New")
	end

	var_5_0._sequences.New = var_5_38

	local var_5_39
	local var_5_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		}
	}

	var_5_4:RegisterAnimationSequence("Free", var_5_40)

	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		}
	}

	var_5_8:RegisterAnimationSequence("Free", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		}
	}

	var_5_12:RegisterAnimationSequence("Free", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicatorDark
		}
	}

	var_5_14:RegisterAnimationSequence("Free", var_5_43)

	local var_5_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		}
	}

	var_5_16:RegisterAnimationSequence("Free", var_5_44)

	local function var_5_45()
		var_5_4:AnimateSequence("Free")
		var_5_8:AnimateSequence("Free")
		var_5_12:AnimateSequence("Free")
		var_5_14:AnimateSequence("Free")
		var_5_16:AnimateSequence("Free")
	end

	var_5_0._sequences.Free = var_5_45

	local var_5_46
	local var_5_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("FreeMoving", var_5_47)

	local function var_5_48()
		var_5_18:AnimateLoop("FreeMoving")
	end

	var_5_0._sequences.FreeMoving = var_5_48

	local var_5_49
	local var_5_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_5_4:RegisterAnimationSequence("FreeImproved", var_5_50)

	local var_5_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_5_8:RegisterAnimationSequence("FreeImproved", var_5_51)

	local var_5_52 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_12:RegisterAnimationSequence("FreeImproved", var_5_52)

	local var_5_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_arrow_atlas")
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_14:RegisterAnimationSequence("FreeImproved", var_5_53)

	local var_5_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_arrow_atlas")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_16:RegisterAnimationSequence("FreeImproved", var_5_54)

	local var_5_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("FreeImproved", var_5_55)

	local function var_5_56()
		var_5_4:AnimateSequence("FreeImproved")
		var_5_8:AnimateSequence("FreeImproved")
		var_5_12:AnimateSequence("FreeImproved")
		var_5_14:AnimateSequence("FreeImproved")
		var_5_16:AnimateSequence("FreeImproved")
		var_5_18:AnimateSequence("FreeImproved")
	end

	var_5_0._sequences.FreeImproved = var_5_56

	local var_5_57
	local var_5_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -25
		}
	}

	var_5_4:RegisterAnimationSequence("ResetPos", var_5_58)

	local var_5_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -25
		}
	}

	var_5_6:RegisterAnimationSequence("ResetPos", var_5_59)

	local var_5_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 25
		}
	}

	var_5_8:RegisterAnimationSequence("ResetPos", var_5_60)

	local var_5_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 25
		}
	}

	var_5_10:RegisterAnimationSequence("ResetPos", var_5_61)

	local var_5_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("store_arrow_glow")
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_12:RegisterAnimationSequence("ResetPos", var_5_62)

	local var_5_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 27
		},
		{
			value = 0.24,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("store_arrow")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_14:RegisterAnimationSequence("ResetPos", var_5_63)

	local var_5_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("store_arrow")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_16:RegisterAnimationSequence("ResetPos", var_5_64)

	local var_5_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ResetPos", var_5_65)

	local function var_5_66()
		var_5_4:AnimateSequence("ResetPos")
		var_5_6:AnimateSequence("ResetPos")
		var_5_8:AnimateSequence("ResetPos")
		var_5_10:AnimateSequence("ResetPos")
		var_5_12:AnimateSequence("ResetPos")
		var_5_14:AnimateSequence("ResetPos")
		var_5_16:AnimateSequence("ResetPos")
		var_5_18:AnimateSequence("ResetPos")
	end

	var_5_0._sequences.ResetPos = var_5_66

	local var_5_67
	local var_5_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 3 * _1080p
		}
	}

	var_5_18:RegisterAnimationSequence("Kerning", var_5_68)

	local function var_5_69()
		var_5_18:AnimateSequence("Kerning")
	end

	var_5_0._sequences.Kerning = var_5_69

	var_0_5(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	return var_5_0
end

MenuBuilder.registerType("StoreScrollArrow", StoreScrollArrow)
LockTable(_M)
