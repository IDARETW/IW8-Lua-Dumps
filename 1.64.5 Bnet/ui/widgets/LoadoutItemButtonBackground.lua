module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.HighlightTop then
		arg_1_0.HighlightTop:SetupTheme(arg_1_1)
	end

	if arg_1_0.HighlightBottom then
		arg_1_0.HighlightBottom:SetupTheme(arg_1_1)
	end

	arg_1_0._buttonOver = arg_1_1 and "BundleButtonOver" or "ButtonOver"
	arg_1_0._buttonUp = arg_1_1 and "BundleButtonUp" or "ButtonUp"

	WZWIP.AnimateThemeElement(arg_1_0, arg_1_0:getParent():isInFocus() and arg_1_0._buttonOver or arg_1_0._buttonUp, {
		doSnapToState = true
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupTheme = var_0_0
	arg_2_0._buttonOver = "ButtonOver"
	arg_2_0._buttonUp = "ButtonUp"

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, arg_2_0._buttonOver)
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if not arg_4_0:getParent():isInFocus() then
			WZWIP.AnimateThemeElement(arg_4_0, arg_2_0._buttonUp, {
				doSnapToState = arg_4_1.snap
			})
		end
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "ButtonOverDisabled")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		if not arg_6_0:getParent():isInFocus() then
			WZWIP.AnimateThemeElement(arg_6_0, "ButtonUpDisabled", {
				doSnapToState = arg_6_1.snap
			})
		end
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
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

	if not CONDITIONS.IsMagmaGameMode() then
		var_7_5 = LUI.UIImage.new()
		var_7_5.id = "TextureLayer"

		var_7_5:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
		var_7_5:SetAlpha(0.1, 0)
		var_7_5:SetPixelGridEnabled(true)
		var_7_5:SetPixelGridContrast(0.8, 0)
		var_7_5:SetPixelGridBlockWidth(2, 0)
		var_7_5:SetPixelGridBlockHeight(2, 0)
		var_7_5:SetPixelGridGutterWidth(1, 0)
		var_7_5:SetPixelGridGutterHeight(1, 0)
		var_7_5:setImage(RegisterMaterial("ui_default_white"), 0)
		var_7_0:addElement(var_7_5)

		var_7_0.TextureLayer = var_7_5
	end

	local var_7_6

	if not CONDITIONS.IsMagmaGameMode() then
		var_7_6 = LUI.UIImage.new()
		var_7_6.id = "Gradient"

		var_7_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_7_6:SetAlpha(0, 0)
		var_7_6:SetPixelGridEnabled(true)
		var_7_6:SetPixelGridContrast(0.2, 0)
		var_7_6:SetPixelGridBlockWidth(2, 0)
		var_7_6:SetPixelGridBlockHeight(2, 0)
		var_7_6:SetPixelGridGutterWidth(1, 0)
		var_7_6:SetPixelGridGutterHeight(1, 0)
		var_7_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_7_0:addElement(var_7_6)

		var_7_0.Gradient = var_7_6
	end

	local var_7_7

	if not CONDITIONS.IsMagmaGameMode() then
		var_7_7 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
			controllerIndex = var_7_1
		})
		var_7_7.id = "HighlightTop"

		var_7_7:SetAlpha(0, 0)
		var_7_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
		var_7_0:addElement(var_7_7)

		var_7_0.HighlightTop = var_7_7
	end

	local var_7_8

	if not CONDITIONS.IsMagmaGameMode() then
		var_7_8 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
			controllerIndex = var_7_1
		})
		var_7_8.id = "HighlightBottom"

		var_7_8:SetAlpha(0, 0)
		var_7_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
		var_7_0:addElement(var_7_8)

		var_7_0.HighlightBottom = var_7_8
	end

	local var_7_9

	if CONDITIONS.IsMagmaGameMode() then
		var_7_9 = LUI.UIImage.new()
		var_7_9.id = "BotBorderWZ"

		var_7_9:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_7_9:SetAlpha(0.6, 0)
		var_7_9:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
		var_7_0:addElement(var_7_9)

		var_7_0.BotBorderWZ = var_7_9
	end

	local var_7_10

	if CONDITIONS.IsMagmaGameMode() then
		var_7_10 = LUI.UIImage.new()
		var_7_10.id = "TopBorderWZ"

		var_7_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_7_10:SetAlpha(0.6, 0)
		var_7_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
		var_7_0:addElement(var_7_10)

		var_7_0.TopBorderWZ = var_7_10
	end

	local function var_7_11()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_11

	local var_7_12
	local var_7_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOver", var_7_13)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_14 = {
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

		var_7_5:RegisterAnimationSequence("ButtonOver", var_7_14)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_15 = {
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

		var_7_6:RegisterAnimationSequence("ButtonOver", var_7_15)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_16 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("ButtonOver", var_7_16)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_17 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("ButtonOver", var_7_17)
	end

	local function var_7_18()
		var_7_4:AnimateSequence("ButtonOver")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("ButtonOver")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("ButtonOver")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("ButtonOver")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("ButtonOver")
		end
	end

	var_7_0._sequences.ButtonOver = var_7_18

	local var_7_19
	local var_7_20 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUp", var_7_20)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_21 = {
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

		var_7_5:RegisterAnimationSequence("ButtonUp", var_7_21)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_22 = {
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

		var_7_6:RegisterAnimationSequence("ButtonUp", var_7_22)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_23 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("ButtonUp", var_7_23)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_24 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("ButtonUp", var_7_24)
	end

	local function var_7_25()
		var_7_4:AnimateSequence("ButtonUp")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("ButtonUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("ButtonUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("ButtonUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("ButtonUp")
		end
	end

	var_7_0._sequences.ButtonUp = var_7_25

	local var_7_26
	local var_7_27 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOverDisabled", var_7_27)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_28 = {
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

		var_7_5:RegisterAnimationSequence("ButtonOverDisabled", var_7_28)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_29 = {
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

		var_7_6:RegisterAnimationSequence("ButtonOverDisabled", var_7_29)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_30 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("ButtonOverDisabled", var_7_30)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_31 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("ButtonOverDisabled", var_7_31)
	end

	local function var_7_32()
		var_7_4:AnimateSequence("ButtonOverDisabled")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("ButtonOverDisabled")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("ButtonOverDisabled")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("ButtonOverDisabled")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_32

	local var_7_33
	local var_7_34 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUpDisabled", var_7_34)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_35 = {
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

		var_7_5:RegisterAnimationSequence("ButtonUpDisabled", var_7_35)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_36 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_6:RegisterAnimationSequence("ButtonUpDisabled", var_7_36)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_37 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("ButtonUpDisabled", var_7_37)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_38 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("ButtonUpDisabled", var_7_38)
	end

	local function var_7_39()
		var_7_4:AnimateSequence("ButtonUpDisabled")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("ButtonUpDisabled")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("ButtonUpDisabled")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("ButtonUpDisabled")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_39

	local var_7_40
	local var_7_41 = {
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

	var_7_4:RegisterAnimationSequence("UnavailableUp", var_7_41)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_42 = {
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

		var_7_5:RegisterAnimationSequence("UnavailableUp", var_7_42)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_43 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_6:RegisterAnimationSequence("UnavailableUp", var_7_43)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_44 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("UnavailableUp", var_7_44)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_45 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("UnavailableUp", var_7_45)
	end

	local function var_7_46()
		var_7_4:AnimateSequence("UnavailableUp")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("UnavailableUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("UnavailableUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("UnavailableUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("UnavailableUp")
		end
	end

	var_7_0._sequences.UnavailableUp = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUpSnap", var_7_48)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_49 = {
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

		var_7_5:RegisterAnimationSequence("ButtonUpSnap", var_7_49)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_50 = {
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

		var_7_6:RegisterAnimationSequence("ButtonUpSnap", var_7_50)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_51 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("ButtonUpSnap", var_7_51)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("ButtonUpSnap", var_7_52)
	end

	local function var_7_53()
		var_7_4:AnimateSequence("ButtonUpSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("ButtonUpSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("ButtonUpSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("ButtonUpSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("ButtonUpSnap")
		end
	end

	var_7_0._sequences.ButtonUpSnap = var_7_53

	local var_7_54
	local var_7_55 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_55)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_56 = {
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

		var_7_5:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_56)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_57 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_57)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_58 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_58)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_59 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_7_59)
	end

	local function var_7_60()
		var_7_4:AnimateSequence("ButtonUpDisabledSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("ButtonUpDisabledSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("ButtonUpDisabledSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("ButtonUpDisabledSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("ButtonUpDisabledSnap")
		end
	end

	var_7_0._sequences.ButtonUpDisabledSnap = var_7_60

	local var_7_61
	local var_7_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BundleButtonOver", var_7_62)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_63 = {
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

		var_7_5:RegisterAnimationSequence("BundleButtonOver", var_7_63)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_64 = {
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

		var_7_6:RegisterAnimationSequence("BundleButtonOver", var_7_64)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_65 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("BundleButtonOver", var_7_65)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_66 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("BundleButtonOver", var_7_66)
	end

	local function var_7_67()
		var_7_4:AnimateSequence("BundleButtonOver")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("BundleButtonOver")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("BundleButtonOver")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("BundleButtonOver")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("BundleButtonOver")
		end
	end

	var_7_0._sequences.BundleButtonOver = var_7_67

	local var_7_68
	local var_7_69 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BundleButtonUp", var_7_69)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_70 = {
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

		var_7_5:RegisterAnimationSequence("BundleButtonUp", var_7_70)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_71 = {
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

		var_7_6:RegisterAnimationSequence("BundleButtonUp", var_7_71)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_72 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("BundleButtonUp", var_7_72)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_73 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("BundleButtonUp", var_7_73)
	end

	local function var_7_74()
		var_7_4:AnimateSequence("BundleButtonUp")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("BundleButtonUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("BundleButtonUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("BundleButtonUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("BundleButtonUp")
		end
	end

	var_7_0._sequences.BundleButtonUp = var_7_74

	local var_7_75
	local var_7_76 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BundleButtonUpSnap", var_7_76)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_77 = {
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

		var_7_5:RegisterAnimationSequence("BundleButtonUpSnap", var_7_77)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_78 = {
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

		var_7_6:RegisterAnimationSequence("BundleButtonUpSnap", var_7_78)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_79 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("BundleButtonUpSnap", var_7_79)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_80 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("BundleButtonUpSnap", var_7_80)
	end

	local function var_7_81()
		var_7_4:AnimateSequence("BundleButtonUpSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("BundleButtonUpSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("BundleButtonUpSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("BundleButtonUpSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("BundleButtonUpSnap")
		end
	end

	var_7_0._sequences.BundleButtonUpSnap = var_7_81

	local var_7_82
	local var_7_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("BundleButtonOverSnap", var_7_83)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_84 = {
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

		var_7_5:RegisterAnimationSequence("BundleButtonOverSnap", var_7_84)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_85 = {
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

		var_7_6:RegisterAnimationSequence("BundleButtonOverSnap", var_7_85)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_86 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("BundleButtonOverSnap", var_7_86)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_87 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("BundleButtonOverSnap", var_7_87)
	end

	local function var_7_88()
		var_7_4:AnimateSequence("BundleButtonOverSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("BundleButtonOverSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("BundleButtonOverSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("BundleButtonOverSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("BundleButtonOverSnap")
		end
	end

	var_7_0._sequences.BundleButtonOverSnap = var_7_88

	local var_7_89
	local var_7_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ButtonOverSnap", var_7_90)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_91 = {
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

		var_7_5:RegisterAnimationSequence("ButtonOverSnap", var_7_91)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_92 = {
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

		var_7_6:RegisterAnimationSequence("ButtonOverSnap", var_7_92)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_93 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("ButtonOverSnap", var_7_93)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_94 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("ButtonOverSnap", var_7_94)
	end

	local function var_7_95()
		var_7_4:AnimateSequence("ButtonOverSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_5:AnimateSequence("ButtonOverSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_6:AnimateSequence("ButtonOverSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("ButtonOverSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("ButtonOverSnap")
		end
	end

	var_7_0._sequences.ButtonOverSnap = var_7_95

	local var_7_96
	local var_7_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipSetup", var_7_97)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_98 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipSetup", var_7_98)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_99 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipSetup", var_7_99)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_100 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipSetup", var_7_100)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_101 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipSetup", var_7_101)
	end

	local function var_7_102()
		var_7_4:AnimateSequence("WZWipSetup")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipSetup")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipSetup")
		end
	end

	var_7_0._sequences.WZWipSetup = var_7_102

	local var_7_103
	local var_7_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipButtonOver", var_7_104)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_105 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonOver", var_7_105)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_106 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipButtonOver", var_7_106)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_107 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipButtonOver", var_7_107)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_108 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipButtonOver", var_7_108)
	end

	local function var_7_109()
		var_7_4:AnimateSequence("WZWipButtonOver")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipButtonOver")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipButtonOver")
		end
	end

	var_7_0._sequences.WZWipButtonOver = var_7_109

	local var_7_110
	local var_7_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		},
		{
			value = 0.45,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipButtonUp", var_7_111)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_112 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonUp", var_7_112)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_113 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipButtonUp", var_7_113)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_114 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipButtonUp", var_7_114)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_115 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipButtonUp", var_7_115)
	end

	local function var_7_116()
		var_7_4:AnimateSequence("WZWipButtonUp")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipButtonUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipButtonUp")
		end
	end

	var_7_0._sequences.WZWipButtonUp = var_7_116

	local var_7_117
	local var_7_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_118)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_119 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_119)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_120 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_120)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_121 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.4,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_121)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_122 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.41,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_122)
	end

	local function var_7_123()
		var_7_4:AnimateSequence("WZWipButtonOverDisabled")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipButtonOverDisabled")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipButtonOverDisabled")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipButtonOverDisabled")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_7_0._sequences.WZWipButtonOverDisabled = var_7_123

	local var_7_124
	local var_7_125 = {
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

	var_7_4:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_125)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_126 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_126)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_127 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_127)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_128 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_128)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_129 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_129)
	end

	local function var_7_130()
		var_7_4:AnimateSequence("WZWipButtonUpDisabled")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipButtonUpDisabled")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipButtonUpDisabled")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipButtonUpDisabled")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_7_0._sequences.WZWipButtonUpDisabled = var_7_130

	local var_7_131
	local var_7_132 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipUnavailableUp", var_7_132)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_133 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipUnavailableUp", var_7_133)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_134 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipUnavailableUp", var_7_134)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_135 = {
			{
				value = 0.41,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipUnavailableUp", var_7_135)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_136 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipUnavailableUp", var_7_136)
	end

	local function var_7_137()
		var_7_4:AnimateSequence("WZWipUnavailableUp")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipUnavailableUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipUnavailableUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipUnavailableUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipUnavailableUp")
		end
	end

	var_7_0._sequences.WZWipUnavailableUp = var_7_137

	local var_7_138
	local var_7_139 = {
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

	var_7_4:RegisterAnimationSequence("WZWipButtonUpSnap", var_7_139)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_140 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonUpSnap", var_7_140)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_141 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipButtonUpSnap", var_7_141)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_142 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipButtonUpSnap", var_7_142)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_143 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipButtonUpSnap", var_7_143)
	end

	local function var_7_144()
		var_7_4:AnimateSequence("WZWipButtonUpSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipButtonUpSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipButtonUpSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipButtonUpSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipButtonUpSnap")
		end
	end

	var_7_0._sequences.WZWipButtonUpSnap = var_7_144

	local var_7_145
	local var_7_146 = {
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

	var_7_4:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_7_146)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_147 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_7_147)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_148 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_7_148)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_149 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_7_149)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_150 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipButtonUpDisabledSnap", var_7_150)
	end

	local function var_7_151()
		var_7_4:AnimateSequence("WZWipButtonUpDisabledSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipButtonUpDisabledSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipButtonUpDisabledSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipButtonUpDisabledSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipButtonUpDisabledSnap")
		end
	end

	var_7_0._sequences.WZWipButtonUpDisabledSnap = var_7_151

	local var_7_152
	local var_7_153 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipBundleButtonOver", var_7_153)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_154 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipBundleButtonOver", var_7_154)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_155 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipBundleButtonOver", var_7_155)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_156 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipBundleButtonOver", var_7_156)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_157 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipBundleButtonOver", var_7_157)
	end

	local function var_7_158()
		var_7_4:AnimateSequence("WZWipBundleButtonOver")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipBundleButtonOver")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipBundleButtonOver")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipBundleButtonOver")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipBundleButtonOver")
		end
	end

	var_7_0._sequences.WZWipBundleButtonOver = var_7_158

	local var_7_159
	local var_7_160 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipBundleButtonUp", var_7_160)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_161 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipBundleButtonUp", var_7_161)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_162 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipBundleButtonUp", var_7_162)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_163 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipBundleButtonUp", var_7_163)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_164 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipBundleButtonUp", var_7_164)
	end

	local function var_7_165()
		var_7_4:AnimateSequence("WZWipBundleButtonUp")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipBundleButtonUp")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipBundleButtonUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipBundleButtonUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipBundleButtonUp")
		end
	end

	var_7_0._sequences.WZWipBundleButtonUp = var_7_165

	local var_7_166
	local var_7_167 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipBundleButtonUpSnap", var_7_167)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_168 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipBundleButtonUpSnap", var_7_168)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_169 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipBundleButtonUpSnap", var_7_169)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_170 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipBundleButtonUpSnap", var_7_170)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_171 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipBundleButtonUpSnap", var_7_171)
	end

	local function var_7_172()
		var_7_4:AnimateSequence("WZWipBundleButtonUpSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipBundleButtonUpSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipBundleButtonUpSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipBundleButtonUpSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipBundleButtonUpSnap")
		end
	end

	var_7_0._sequences.WZWipBundleButtonUpSnap = var_7_172

	local var_7_173
	local var_7_174 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipBundleButtonOverSnap", var_7_174)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_175 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipBundleButtonOverSnap", var_7_175)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_176 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipBundleButtonOverSnap", var_7_176)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_177 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipBundleButtonOverSnap", var_7_177)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_178 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipBundleButtonOverSnap", var_7_178)
	end

	local function var_7_179()
		var_7_4:AnimateSequence("WZWipBundleButtonOverSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipBundleButtonOverSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipBundleButtonOverSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipBundleButtonOverSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipBundleButtonOverSnap")
		end
	end

	var_7_0._sequences.WZWipBundleButtonOverSnap = var_7_179

	local var_7_180
	local var_7_181 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipButtonOverSnap", var_7_181)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_182 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonOverSnap", var_7_182)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		local var_7_183 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_8:RegisterAnimationSequence("WZWipButtonOverSnap", var_7_183)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_184 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_7_9:RegisterAnimationSequence("WZWipButtonOverSnap", var_7_184)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_7_185 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_7_10:RegisterAnimationSequence("WZWipButtonOverSnap", var_7_185)
	end

	local function var_7_186()
		var_7_4:AnimateSequence("WZWipButtonOverSnap")

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_7:AnimateSequence("WZWipButtonOverSnap")
		end

		if not CONDITIONS.IsMagmaGameMode() then
			var_7_8:AnimateSequence("WZWipButtonOverSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_9:AnimateSequence("WZWipButtonOverSnap")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_7_10:AnimateSequence("WZWipButtonOverSnap")
		end
	end

	var_7_0._sequences.WZWipButtonOverSnap = var_7_186

	local function var_7_187()
		return
	end

	var_7_0._sequences.BkgGrungeState1 = var_7_187

	local function var_7_188()
		return
	end

	var_7_0._sequences.BkgGrungeState2 = var_7_188

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LoadoutItemButtonBackground", LoadoutItemButtonBackground)
LockTable(_M)
