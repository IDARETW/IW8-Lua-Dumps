module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.HighlightTop)

	arg_1_0.HighlightTop._wzTheme = arg_1_1

	assert(arg_1_0.HighlightBottom)

	arg_1_0.HighlightBottom._wzTheme = arg_1_1
	arg_1_0._wzTheme = arg_1_1
end

local function var_0_1(arg_2_0)
	arg_2_0:SetWZTheme(arg_2_0._wzTheme)
	ACTIONS.AnimateSequence(arg_2_0, arg_2_0._wzTheme and "WZHighlightOnly" or "HighlightOnly")
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.ForceHighlightOnly = var_0_1
	arg_3_0.SetWZTheme = var_0_0

	assert(arg_3_0.BackgroundImage)
	arg_3_0.BackgroundImage:SetMask(arg_3_0.Mask)
	arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, arg_3_0._wzTheme and "WZButtonOver" or "ButtonOver")
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_5_0, "ButtonOverDisabled")
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		if not arg_6_0:getParent():isInFocus() then
			ACTIONS.AnimateSequence(arg_6_0, "ButtonUpDisabled")
		end
	end)
end

function QuickPlayButtonBackground(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 200 * _1080p)

	var_7_0.id = "QuickPlayButtonBackground"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Backer"

	var_7_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_7_4:SetAlpha(0.3, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Backer = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "TextureLayer"

	var_7_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_7_6:SetAlpha(0.1, 0)
	var_7_6:SetPixelGridEnabled(true)
	var_7_6:SetPixelGridContrast(0.8, 0)
	var_7_6:SetPixelGridBlockWidth(2, 0)
	var_7_6:SetPixelGridBlockHeight(2, 0)
	var_7_6:SetPixelGridGutterWidth(1, 0)
	var_7_6:SetPixelGridGutterHeight(1, 0)
	var_7_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_7_0:addElement(var_7_6)

	var_7_0.TextureLayer = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "BackgroundImage"

	var_7_8:SetAlpha(0.25, 0)
	var_7_8:setImage(RegisterMaterial("button_tdm"), 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * 215, _1080p * -108, _1080p * 108)
	var_7_0:addElement(var_7_8)

	var_7_0.BackgroundImage = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Mask"

	var_7_10:setImage(RegisterMaterial("stencil_mask"), 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * 1, 0, 0)
	var_7_0:addElement(var_7_10)

	var_7_0.Mask = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "Gradient"

	var_7_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_7_12:SetAlpha(0, 0)
	var_7_12:SetPixelGridEnabled(true)
	var_7_12:SetPixelGridContrast(0.2, 0)
	var_7_12:SetPixelGridBlockWidth(2, 0)
	var_7_12:SetPixelGridBlockHeight(2, 0)
	var_7_12:SetPixelGridGutterWidth(1, 0)
	var_7_12:SetPixelGridGutterHeight(1, 0)
	var_7_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_0:addElement(var_7_12)

	var_7_0.Gradient = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "HighlightTop"

	var_7_14:SetAlpha(0, 0)
	var_7_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_7_0:addElement(var_7_14)

	var_7_0.HighlightTop = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "HighlightBottom"

	var_7_16:SetAlpha(0, 0)
	var_7_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_7_0:addElement(var_7_16)

	var_7_0.HighlightBottom = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "Darkener"

	var_7_18:SetRGBFromInt(0, 0)
	var_7_18:SetAlpha(0, 0)
	var_7_0:addElement(var_7_18)

	var_7_0.Darkener = var_7_18

	local function var_7_19()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_19

	local var_7_20
	local var_7_21 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUp", var_7_21)

	local var_7_22 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUp", var_7_22)

	local var_7_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0.25,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_23)

	local var_7_24 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUp", var_7_24)

	local var_7_25 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUp", var_7_25)

	local var_7_26 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonUp", var_7_26)

	local var_7_27 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("ButtonUp", var_7_27)

	local function var_7_28()
		var_7_4:AnimateSequence("ButtonUp")
		var_7_6:AnimateSequence("ButtonUp")
		var_7_8:AnimateSequence("ButtonUp")
		var_7_12:AnimateSequence("ButtonUp")
		var_7_14:AnimateSequence("ButtonUp")
		var_7_16:AnimateSequence("ButtonUp")
		var_7_18:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_28

	local var_7_29
	local var_7_30 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOverDisabled", var_7_30)

	local var_7_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOverDisabled", var_7_31)

	local var_7_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverDisabled", var_7_32)

	local var_7_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOverDisabled", var_7_33)

	local var_7_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOverDisabled", var_7_34)

	local var_7_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonOverDisabled", var_7_35)

	local var_7_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("ButtonOverDisabled", var_7_36)

	local function var_7_37()
		var_7_4:AnimateSequence("ButtonOverDisabled")
		var_7_6:AnimateSequence("ButtonOverDisabled")
		var_7_8:AnimateSequence("ButtonOverDisabled")
		var_7_12:AnimateSequence("ButtonOverDisabled")
		var_7_14:AnimateSequence("ButtonOverDisabled")
		var_7_16:AnimateSequence("ButtonOverDisabled")
		var_7_18:AnimateSequence("ButtonOverDisabled")
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_37

	local var_7_38
	local var_7_39 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUpDisabled", var_7_39)

	local var_7_40 = {
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

	var_7_6:RegisterAnimationSequence("ButtonUpDisabled", var_7_40)

	local var_7_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0.25,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpDisabled", var_7_41)

	local var_7_42 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUpDisabled", var_7_42)

	local var_7_43 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUpDisabled", var_7_43)

	local var_7_44 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonUpDisabled", var_7_44)

	local var_7_45 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("ButtonUpDisabled", var_7_45)

	local function var_7_46()
		var_7_4:AnimateSequence("ButtonUpDisabled")
		var_7_6:AnimateSequence("ButtonUpDisabled")
		var_7_8:AnimateSequence("ButtonUpDisabled")
		var_7_12:AnimateSequence("ButtonUpDisabled")
		var_7_14:AnimateSequence("ButtonUpDisabled")
		var_7_16:AnimateSequence("ButtonUpDisabled")
		var_7_18:AnimateSequence("ButtonUpDisabled")
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("UnavailableUp", var_7_48)

	local var_7_49 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("UnavailableUp", var_7_49)

	local var_7_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("UnavailableUp", var_7_50)

	local var_7_51 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_7_12:RegisterAnimationSequence("UnavailableUp", var_7_51)

	local var_7_52 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("UnavailableUp", var_7_52)

	local var_7_53 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("UnavailableUp", var_7_53)

	local var_7_54 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("UnavailableUp", var_7_54)

	local function var_7_55()
		var_7_4:AnimateSequence("UnavailableUp")
		var_7_6:AnimateSequence("UnavailableUp")
		var_7_8:AnimateSequence("UnavailableUp")
		var_7_12:AnimateSequence("UnavailableUp")
		var_7_14:AnimateSequence("UnavailableUp")
		var_7_16:AnimateSequence("UnavailableUp")
		var_7_18:AnimateSequence("UnavailableUp")
	end

	var_7_0._sequences.UnavailableUp = var_7_55

	local var_7_56
	local var_7_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOver", var_7_57)

	local var_7_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOver", var_7_58)

	local var_7_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_59)

	local var_7_60 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOver", var_7_60)

	local var_7_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOver", var_7_61)

	local var_7_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonOver", var_7_62)

	local var_7_63 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("ButtonOver", var_7_63)

	local function var_7_64()
		var_7_4:AnimateSequence("ButtonOver")
		var_7_6:AnimateSequence("ButtonOver")
		var_7_8:AnimateSequence("ButtonOver")
		var_7_12:AnimateSequence("ButtonOver")
		var_7_14:AnimateSequence("ButtonOver")
		var_7_16:AnimateSequence("ButtonOver")
		var_7_18:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_64

	local var_7_65
	local var_7_66 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZButtonUp", var_7_66)

	local var_7_67 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_7_6:RegisterAnimationSequence("WZButtonUp", var_7_67)

	local var_7_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0.25,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZButtonUp", var_7_68)

	local var_7_69 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("WZButtonUp", var_7_69)

	local var_7_70 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZButtonUp", var_7_70)

	local var_7_71 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("WZButtonUp", var_7_71)

	local var_7_72 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("WZButtonUp", var_7_72)

	local function var_7_73()
		var_7_4:AnimateSequence("WZButtonUp")
		var_7_6:AnimateSequence("WZButtonUp")
		var_7_8:AnimateSequence("WZButtonUp")
		var_7_12:AnimateSequence("WZButtonUp")
		var_7_14:AnimateSequence("WZButtonUp")
		var_7_16:AnimateSequence("WZButtonUp")
		var_7_18:AnimateSequence("WZButtonUp")
	end

	var_7_0._sequences.WZButtonUp = var_7_73

	local var_7_74
	local var_7_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZButtonOver", var_7_75)

	local var_7_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneBackground
		}
	}

	var_7_6:RegisterAnimationSequence("WZButtonOver", var_7_76)

	local var_7_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZButtonOver", var_7_77)

	local var_7_78 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneBackground
		}
	}

	var_7_12:RegisterAnimationSequence("WZButtonOver", var_7_78)

	local var_7_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZButtonOver", var_7_79)

	local var_7_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("WZButtonOver", var_7_80)

	local var_7_81 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("WZButtonOver", var_7_81)

	local function var_7_82()
		var_7_4:AnimateSequence("WZButtonOver")
		var_7_6:AnimateSequence("WZButtonOver")
		var_7_8:AnimateSequence("WZButtonOver")
		var_7_12:AnimateSequence("WZButtonOver")
		var_7_14:AnimateSequence("WZButtonOver")
		var_7_16:AnimateSequence("WZButtonOver")
		var_7_18:AnimateSequence("WZButtonOver")
	end

	var_7_0._sequences.WZButtonOver = var_7_82

	local var_7_83
	local var_7_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
		}
	}

	var_7_14:RegisterAnimationSequence("WZPromoted", var_7_84)

	local function var_7_85()
		var_7_14:AnimateSequence("WZPromoted")
	end

	var_7_0._sequences.WZPromoted = var_7_85

	local var_7_86
	local var_7_87 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("HighlightOnly", var_7_87)

	local var_7_88 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_7_6:RegisterAnimationSequence("HighlightOnly", var_7_88)

	local var_7_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0.25,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("HighlightOnly", var_7_89)

	local var_7_90 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_12:RegisterAnimationSequence("HighlightOnly", var_7_90)

	local var_7_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("HighlightOnly", var_7_91)

	local var_7_92 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("HighlightOnly", var_7_92)

	local var_7_93 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("HighlightOnly", var_7_93)

	local function var_7_94()
		var_7_4:AnimateSequence("HighlightOnly")
		var_7_6:AnimateSequence("HighlightOnly")
		var_7_8:AnimateSequence("HighlightOnly")
		var_7_12:AnimateSequence("HighlightOnly")
		var_7_14:AnimateSequence("HighlightOnly")
		var_7_16:AnimateSequence("HighlightOnly")
		var_7_18:AnimateSequence("HighlightOnly")
	end

	var_7_0._sequences.HighlightOnly = var_7_94

	local var_7_95
	local var_7_96 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZHighlightOnly", var_7_96)

	local var_7_97 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_7_6:RegisterAnimationSequence("WZHighlightOnly", var_7_97)

	local var_7_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0.25,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZHighlightOnly", var_7_98)

	local var_7_99 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneBackground
		}
	}

	var_7_12:RegisterAnimationSequence("WZHighlightOnly", var_7_99)

	local var_7_100 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZHighlightOnly", var_7_100)

	local var_7_101 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("WZHighlightOnly", var_7_101)

	local var_7_102 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("WZHighlightOnly", var_7_102)

	local function var_7_103()
		var_7_4:AnimateSequence("WZHighlightOnly")
		var_7_6:AnimateSequence("WZHighlightOnly")
		var_7_8:AnimateSequence("WZHighlightOnly")
		var_7_12:AnimateSequence("WZHighlightOnly")
		var_7_14:AnimateSequence("WZHighlightOnly")
		var_7_16:AnimateSequence("WZHighlightOnly")
		var_7_18:AnimateSequence("WZHighlightOnly")
	end

	var_7_0._sequences.WZHighlightOnly = var_7_103

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("QuickPlayButtonBackground", QuickPlayButtonBackground)
LockTable(_M)
