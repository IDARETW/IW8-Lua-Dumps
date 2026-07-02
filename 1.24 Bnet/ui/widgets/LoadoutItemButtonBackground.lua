module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.HighlightTop:SetupTheme(arg_1_1)
	arg_1_0.HighlightBottom:SetupTheme(arg_1_1)

	arg_1_0._buttonOver = arg_1_1 and "BundleButtonOver" or "ButtonOver"
	arg_1_0._buttonUp = arg_1_1 and "BundleButtonUp" or "ButtonUp"
	arg_1_0._buttonUpSnap = arg_1_1 and "BundleButtonUpSnap" or "ButtonUpSnap"
	arg_1_0._buttonOverSnap = arg_1_1 and "BundleButtonOverSnap" or "ButtonOverSnap"

	local var_1_0 = arg_1_0:getParent():isInFocus() and arg_1_0._buttonOverSnap or arg_1_0._buttonUpSnap

	ACTIONS.AnimateSequence(arg_1_0, var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupTheme = var_0_0
	arg_2_0._buttonOver = "ButtonOver"
	arg_2_0._buttonUp = "ButtonUp"
	arg_2_0._buttonUpSnap = "ButtonUpSnap"

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, arg_2_0._buttonOver)
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if not arg_4_0:getParent():isInFocus() then
			if arg_4_1.snap then
				ACTIONS.AnimateSequence(arg_4_0, arg_2_0._buttonUpSnap)
			else
				ACTIONS.AnimateSequence(arg_4_0, arg_2_0._buttonUp)
			end
		end
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_5_0, "ButtonOverDisabled")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		if not arg_6_0:getParent():isInFocus() then
			if arg_6_1.snap then
				ACTIONS.AnimateSequence(arg_6_0, "ButtonUpDisabledSnap")
			else
				ACTIONS.AnimateSequence(arg_6_0, "ButtonUpDisabled")
			end
		end
	end)
end

function LoadoutItemButtonBackground(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 200 * _1080p)

	var_7_0.id = "LoadoutItemButtonBackground"
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
	var_7_4:SetAlpha(0.5, 0)
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

	var_7_8.id = "Gradient"

	var_7_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_7_8:SetAlpha(0, 0)
	var_7_8:SetPixelGridEnabled(true)
	var_7_8:SetPixelGridContrast(0.2, 0)
	var_7_8:SetPixelGridBlockWidth(2, 0)
	var_7_8:SetPixelGridBlockHeight(2, 0)
	var_7_8:SetPixelGridGutterWidth(1, 0)
	var_7_8:SetPixelGridGutterHeight(1, 0)
	var_7_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_0:addElement(var_7_8)

	var_7_0.Gradient = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "HighlightTop"

	var_7_10:SetAlpha(0, 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_7_0:addElement(var_7_10)

	var_7_0.HighlightTop = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "HighlightBottom"

	var_7_12:SetAlpha(0, 0)
	var_7_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_7_0:addElement(var_7_12)

	var_7_0.HighlightBottom = var_7_12

	local function var_7_13()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_13

	local var_7_14
	local var_7_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOver", var_7_15)

	local var_7_16 = {
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

	var_7_6:RegisterAnimationSequence("ButtonOver", var_7_16)

	local var_7_17 = {
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

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_17)

	local var_7_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOver", var_7_18)

	local var_7_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOver", var_7_19)

	local function var_7_20()
		var_7_4:AnimateSequence("ButtonOver")
		var_7_6:AnimateSequence("ButtonOver")
		var_7_8:AnimateSequence("ButtonOver")
		var_7_10:AnimateSequence("ButtonOver")
		var_7_12:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_20

	local var_7_21
	local var_7_22 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUp", var_7_22)

	local var_7_23 = {
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

	var_7_6:RegisterAnimationSequence("ButtonUp", var_7_23)

	local var_7_24 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_24)

	local var_7_25 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUp", var_7_25)

	local var_7_26 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUp", var_7_26)

	local function var_7_27()
		var_7_4:AnimateSequence("ButtonUp")
		var_7_6:AnimateSequence("ButtonUp")
		var_7_8:AnimateSequence("ButtonUp")
		var_7_10:AnimateSequence("ButtonUp")
		var_7_12:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_27

	local var_7_28
	local var_7_29 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOverDisabled", var_7_29)

	local var_7_30 = {
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

	var_7_6:RegisterAnimationSequence("ButtonOverDisabled", var_7_30)

	local var_7_31 = {
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

	var_7_8:RegisterAnimationSequence("ButtonOverDisabled", var_7_31)

	local var_7_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOverDisabled", var_7_32)

	local var_7_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOverDisabled", var_7_33)

	local function var_7_34()
		var_7_4:AnimateSequence("ButtonOverDisabled")
		var_7_6:AnimateSequence("ButtonOverDisabled")
		var_7_8:AnimateSequence("ButtonOverDisabled")
		var_7_10:AnimateSequence("ButtonOverDisabled")
		var_7_12:AnimateSequence("ButtonOverDisabled")
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_34

	local var_7_35
	local var_7_36 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUpDisabled", var_7_36)

	local var_7_37 = {
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

	var_7_6:RegisterAnimationSequence("ButtonUpDisabled", var_7_37)

	local var_7_38 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpDisabled", var_7_38)

	local var_7_39 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpDisabled", var_7_39)

	local var_7_40 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUpDisabled", var_7_40)

	local function var_7_41()
		var_7_4:AnimateSequence("ButtonUpDisabled")
		var_7_6:AnimateSequence("ButtonUpDisabled")
		var_7_8:AnimateSequence("ButtonUpDisabled")
		var_7_10:AnimateSequence("ButtonUpDisabled")
		var_7_12:AnimateSequence("ButtonUpDisabled")
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_41

	local var_7_42
	local var_7_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredLine
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("UnavailableUp", var_7_43)

	local var_7_44 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_6:RegisterAnimationSequence("UnavailableUp", var_7_44)

	local var_7_45 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("UnavailableUp", var_7_45)

	local var_7_46 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("UnavailableUp", var_7_46)

	local var_7_47 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("UnavailableUp", var_7_47)

	local function var_7_48()
		var_7_4:AnimateSequence("UnavailableUp")
		var_7_6:AnimateSequence("UnavailableUp")
		var_7_8:AnimateSequence("UnavailableUp")
		var_7_10:AnimateSequence("UnavailableUp")
		var_7_12:AnimateSequence("UnavailableUp")
	end

	var_7_0._sequences.UnavailableUp = var_7_48

	local var_7_49
	local var_7_50 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUpSnap", var_7_50)

	local var_7_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUpSnap", var_7_51)

	local var_7_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpSnap", var_7_52)

	local var_7_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpSnap", var_7_53)

	local var_7_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUpSnap", var_7_54)

	local function var_7_55()
		var_7_4:AnimateSequence("ButtonUpSnap")
		var_7_6:AnimateSequence("ButtonUpSnap")
		var_7_8:AnimateSequence("ButtonUpSnap")
		var_7_10:AnimateSequence("ButtonUpSnap")
		var_7_12:AnimateSequence("ButtonUpSnap")
	end

	var_7_0._sequences.ButtonUpSnap = var_7_55

	local var_7_56
	local var_7_57 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_57)

	local var_7_58 = {
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

	var_7_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_58)

	local var_7_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_59)

	local var_7_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_60)

	local var_7_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_61)

	local function var_7_62()
		var_7_4:AnimateSequence("ButtonUpDisabledSnap")
		var_7_6:AnimateSequence("ButtonUpDisabledSnap")
		var_7_8:AnimateSequence("ButtonUpDisabledSnap")
		var_7_10:AnimateSequence("ButtonUpDisabledSnap")
		var_7_12:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_7_0._sequences.ButtonUpDisabledSnap = var_7_62

	local var_7_63
	local var_7_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BundleButtonOver", var_7_64)

	local var_7_65 = {
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
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_7_6:RegisterAnimationSequence("BundleButtonOver", var_7_65)

	local var_7_66 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleGlow1
		}
	}

	var_7_8:RegisterAnimationSequence("BundleButtonOver", var_7_66)

	local var_7_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("BundleButtonOver", var_7_67)

	local var_7_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("BundleButtonOver", var_7_68)

	local function var_7_69()
		var_7_4:AnimateSequence("BundleButtonOver")
		var_7_6:AnimateSequence("BundleButtonOver")
		var_7_8:AnimateSequence("BundleButtonOver")
		var_7_10:AnimateSequence("BundleButtonOver")
		var_7_12:AnimateSequence("BundleButtonOver")
	end

	var_7_0._sequences.BundleButtonOver = var_7_69

	local var_7_70
	local var_7_71 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BundleButtonUp", var_7_71)

	local var_7_72 = {
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

	var_7_6:RegisterAnimationSequence("BundleButtonUp", var_7_72)

	local var_7_73 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 15582806,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_8:RegisterAnimationSequence("BundleButtonUp", var_7_73)

	local var_7_74 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("BundleButtonUp", var_7_74)

	local var_7_75 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("BundleButtonUp", var_7_75)

	local function var_7_76()
		var_7_4:AnimateSequence("BundleButtonUp")
		var_7_6:AnimateSequence("BundleButtonUp")
		var_7_8:AnimateSequence("BundleButtonUp")
		var_7_10:AnimateSequence("BundleButtonUp")
		var_7_12:AnimateSequence("BundleButtonUp")
	end

	var_7_0._sequences.BundleButtonUp = var_7_76

	local var_7_77
	local var_7_78 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BundleButtonUpSnap", var_7_78)

	local var_7_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_7_6:RegisterAnimationSequence("BundleButtonUpSnap", var_7_79)

	local var_7_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 15582806,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_8:RegisterAnimationSequence("BundleButtonUpSnap", var_7_80)

	local var_7_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("BundleButtonUpSnap", var_7_81)

	local var_7_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("BundleButtonUpSnap", var_7_82)

	local function var_7_83()
		var_7_4:AnimateSequence("BundleButtonUpSnap")
		var_7_6:AnimateSequence("BundleButtonUpSnap")
		var_7_8:AnimateSequence("BundleButtonUpSnap")
		var_7_10:AnimateSequence("BundleButtonUpSnap")
		var_7_12:AnimateSequence("BundleButtonUpSnap")
	end

	var_7_0._sequences.BundleButtonUpSnap = var_7_83

	local var_7_84
	local var_7_85 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BundleButtonOverSnap", var_7_85)

	local var_7_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_7_6:RegisterAnimationSequence("BundleButtonOverSnap", var_7_86)

	local var_7_87 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleGlow1
		}
	}

	var_7_8:RegisterAnimationSequence("BundleButtonOverSnap", var_7_87)

	local var_7_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("BundleButtonOverSnap", var_7_88)

	local var_7_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("BundleButtonOverSnap", var_7_89)

	local function var_7_90()
		var_7_4:AnimateSequence("BundleButtonOverSnap")
		var_7_6:AnimateSequence("BundleButtonOverSnap")
		var_7_8:AnimateSequence("BundleButtonOverSnap")
		var_7_10:AnimateSequence("BundleButtonOverSnap")
		var_7_12:AnimateSequence("BundleButtonOverSnap")
	end

	var_7_0._sequences.BundleButtonOverSnap = var_7_90

	local var_7_91
	local var_7_92 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOverSnap", var_7_92)

	local var_7_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOverSnap", var_7_93)

	local var_7_94 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverSnap", var_7_94)

	local var_7_95 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOverSnap", var_7_95)

	local var_7_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOverSnap", var_7_96)

	local function var_7_97()
		var_7_4:AnimateSequence("ButtonOverSnap")
		var_7_6:AnimateSequence("ButtonOverSnap")
		var_7_8:AnimateSequence("ButtonOverSnap")
		var_7_10:AnimateSequence("ButtonOverSnap")
		var_7_12:AnimateSequence("ButtonOverSnap")
	end

	var_7_0._sequences.ButtonOverSnap = var_7_97

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LoadoutItemButtonBackground", LoadoutItemButtonBackground)
LockTable(_M)
