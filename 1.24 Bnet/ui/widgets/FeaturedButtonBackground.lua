module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Mask:SetAlpha(arg_1_1 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._showImageOnFocusLost = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.BackgroundImage)
	arg_3_0.BackgroundImage:SetMask(arg_3_0.Mask)

	arg_3_0._showImageOnFocusLost = false
	arg_3_0.SetShowImageOnFocusLost = var_0_1
	arg_3_0.SetBackgroundVisibility = var_0_0

	arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
	end)
	arg_3_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		if not arg_5_0:getParent():isInFocus() then
			ACTIONS.AnimateSequence(arg_5_0, "ButtonUp")
		end
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonOverDisabled")
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		if not arg_7_0:getParent():isInFocus() then
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpDisabled")
		end
	end)
	arg_3_0:addEventHandler("lose_focus", function(arg_8_0, arg_8_1)
		if arg_3_0._showImageOnFocusLost then
			if arg_3_0:IsDisabled() then
				ACTIONS.AnimateSequence(arg_8_0, "ButtonOverDisabled")
			else
				ACTIONS.AnimateSequence(arg_8_0, "ButtonOverNoGlow")
			end
		end
	end)
end

function FeaturedButtonBackground(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 200 * _1080p)

	var_9_0.id = "FeaturedButtonBackground"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Backer"

	var_9_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_9_4:SetAlpha(0.3, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Backer = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "TextureLayer"

	var_9_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_9_6:SetAlpha(0.1, 0)
	var_9_6:SetPixelGridEnabled(true)
	var_9_6:SetPixelGridContrast(0.8, 0)
	var_9_6:SetPixelGridBlockWidth(2, 0)
	var_9_6:SetPixelGridBlockHeight(2, 0)
	var_9_6:SetPixelGridGutterWidth(1, 0)
	var_9_6:SetPixelGridGutterHeight(1, 0)
	var_9_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_9_0:addElement(var_9_6)

	var_9_0.TextureLayer = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "BackgroundImage"

	var_9_8:SetAlpha(0.25, 0)
	var_9_8:setImage(RegisterMaterial("button_tdm"), 0)
	var_9_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * 215, _1080p * -108, _1080p * 108)
	var_9_0:addElement(var_9_8)

	var_9_0.BackgroundImage = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Mask"

	var_9_10:SetAlpha(0, 0)
	var_9_10:setImage(RegisterMaterial("stencil_mask"), 0)
	var_9_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * 1, 0, 0)
	var_9_0:addElement(var_9_10)

	var_9_0.Mask = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIImage.new()

	var_9_12.id = "Gradient"

	var_9_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_9_12:SetAlpha(0, 0)
	var_9_12:SetPixelGridEnabled(true)
	var_9_12:SetPixelGridContrast(0.2, 0)
	var_9_12:SetPixelGridBlockWidth(2, 0)
	var_9_12:SetPixelGridBlockHeight(2, 0)
	var_9_12:SetPixelGridGutterWidth(1, 0)
	var_9_12:SetPixelGridGutterHeight(1, 0)
	var_9_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_9_0:addElement(var_9_12)

	var_9_0.Gradient = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "HighlightTop"

	var_9_14:SetAlpha(0, 0)
	var_9_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_9_0:addElement(var_9_14)

	var_9_0.HighlightTop = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "HighlightBottom"

	var_9_16:SetAlpha(0, 0)
	var_9_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_9_0:addElement(var_9_16)

	var_9_0.HighlightBottom = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIImage.new()

	var_9_18.id = "Darkener"

	var_9_18:SetRGBFromInt(0, 0)
	var_9_18:SetAlpha(0, 0)
	var_9_0:addElement(var_9_18)

	var_9_0.Darkener = var_9_18

	local var_9_19
	local var_9_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("DefaultSequence", var_9_20)

	local var_9_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("DefaultSequence", var_9_21)

	local function var_9_22()
		var_9_8:AnimateSequence("DefaultSequence")
		var_9_10:AnimateSequence("DefaultSequence")
	end

	var_9_0._sequences.DefaultSequence = var_9_22

	local var_9_23
	local var_9_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ButtonOver", var_9_24)

	local var_9_25 = {
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

	var_9_6:RegisterAnimationSequence("ButtonOver", var_9_25)

	local var_9_26 = {
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

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_26)

	local var_9_27 = {
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

	var_9_12:RegisterAnimationSequence("ButtonOver", var_9_27)

	local var_9_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("ButtonOver", var_9_28)

	local var_9_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ButtonOver", var_9_29)

	local var_9_30 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("ButtonOver", var_9_30)

	local function var_9_31()
		var_9_4:AnimateSequence("ButtonOver")
		var_9_6:AnimateSequence("ButtonOver")
		var_9_8:AnimateSequence("ButtonOver")
		var_9_12:AnimateSequence("ButtonOver")
		var_9_14:AnimateSequence("ButtonOver")
		var_9_16:AnimateSequence("ButtonOver")
		var_9_18:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_31

	local var_9_32
	local var_9_33 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ButtonUp", var_9_33)

	local var_9_34 = {
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

	var_9_6:RegisterAnimationSequence("ButtonUp", var_9_34)

	local var_9_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_35)

	local var_9_36 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ButtonUp", var_9_36)

	local var_9_37 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("ButtonUp", var_9_37)

	local var_9_38 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ButtonUp", var_9_38)

	local var_9_39 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("ButtonUp", var_9_39)

	local function var_9_40()
		var_9_4:AnimateSequence("ButtonUp")
		var_9_6:AnimateSequence("ButtonUp")
		var_9_8:AnimateSequence("ButtonUp")
		var_9_12:AnimateSequence("ButtonUp")
		var_9_14:AnimateSequence("ButtonUp")
		var_9_16:AnimateSequence("ButtonUp")
		var_9_18:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_40

	local var_9_41
	local var_9_42 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ButtonOverDisabled", var_9_42)

	local var_9_43 = {
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

	var_9_6:RegisterAnimationSequence("ButtonOverDisabled", var_9_43)

	local var_9_44 = {
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

	var_9_8:RegisterAnimationSequence("ButtonOverDisabled", var_9_44)

	local var_9_45 = {
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

	var_9_12:RegisterAnimationSequence("ButtonOverDisabled", var_9_45)

	local var_9_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("ButtonOverDisabled", var_9_46)

	local var_9_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ButtonOverDisabled", var_9_47)

	local var_9_48 = {
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

	var_9_18:RegisterAnimationSequence("ButtonOverDisabled", var_9_48)

	local function var_9_49()
		var_9_4:AnimateSequence("ButtonOverDisabled")
		var_9_6:AnimateSequence("ButtonOverDisabled")
		var_9_8:AnimateSequence("ButtonOverDisabled")
		var_9_12:AnimateSequence("ButtonOverDisabled")
		var_9_14:AnimateSequence("ButtonOverDisabled")
		var_9_16:AnimateSequence("ButtonOverDisabled")
		var_9_18:AnimateSequence("ButtonOverDisabled")
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_49

	local var_9_50
	local var_9_51 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ButtonUpDisabled", var_9_51)

	local var_9_52 = {
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

	var_9_6:RegisterAnimationSequence("ButtonUpDisabled", var_9_52)

	local var_9_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUpDisabled", var_9_53)

	local var_9_54 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("ButtonUpDisabled", var_9_54)

	local var_9_55 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("ButtonUpDisabled", var_9_55)

	local var_9_56 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ButtonUpDisabled", var_9_56)

	local var_9_57 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("ButtonUpDisabled", var_9_57)

	local function var_9_58()
		var_9_4:AnimateSequence("ButtonUpDisabled")
		var_9_6:AnimateSequence("ButtonUpDisabled")
		var_9_8:AnimateSequence("ButtonUpDisabled")
		var_9_12:AnimateSequence("ButtonUpDisabled")
		var_9_14:AnimateSequence("ButtonUpDisabled")
		var_9_16:AnimateSequence("ButtonUpDisabled")
		var_9_18:AnimateSequence("ButtonUpDisabled")
	end

	var_9_0._sequences.ButtonUpDisabled = var_9_58

	local var_9_59
	local var_9_60 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("UnavailableUp", var_9_60)

	local var_9_61 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("UnavailableUp", var_9_61)

	local var_9_62 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("UnavailableUp", var_9_62)

	local var_9_63 = {
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

	var_9_12:RegisterAnimationSequence("UnavailableUp", var_9_63)

	local var_9_64 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("UnavailableUp", var_9_64)

	local var_9_65 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("UnavailableUp", var_9_65)

	local var_9_66 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("UnavailableUp", var_9_66)

	local function var_9_67()
		var_9_4:AnimateSequence("UnavailableUp")
		var_9_6:AnimateSequence("UnavailableUp")
		var_9_8:AnimateSequence("UnavailableUp")
		var_9_12:AnimateSequence("UnavailableUp")
		var_9_14:AnimateSequence("UnavailableUp")
		var_9_16:AnimateSequence("UnavailableUp")
		var_9_18:AnimateSequence("UnavailableUp")
	end

	var_9_0._sequences.UnavailableUp = var_9_67

	local var_9_68
	local var_9_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ButtonOverNoGlow", var_9_69)

	local var_9_70 = {
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

	var_9_6:RegisterAnimationSequence("ButtonOverNoGlow", var_9_70)

	local var_9_71 = {
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

	var_9_8:RegisterAnimationSequence("ButtonOverNoGlow", var_9_71)

	local var_9_72 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("ButtonOverNoGlow", var_9_72)

	local function var_9_73()
		var_9_4:AnimateSequence("ButtonOverNoGlow")
		var_9_6:AnimateSequence("ButtonOverNoGlow")
		var_9_8:AnimateSequence("ButtonOverNoGlow")
		var_9_18:AnimateSequence("ButtonOverNoGlow")
	end

	var_9_0._sequences.ButtonOverNoGlow = var_9_73

	var_0_2(var_9_0, var_9_1, arg_9_1)
	ACTIONS.AnimateSequence(var_9_0, "DefaultSequence")

	return var_9_0
end

MenuBuilder.registerType("FeaturedButtonBackground", FeaturedButtonBackground)
LockTable(_M)
