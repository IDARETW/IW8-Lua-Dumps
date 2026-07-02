module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._isSprite then
		if arg_1_1 then
			arg_1_0.BackgroundSprite:Play(arg_1_0._spriteOptions)
		else
			arg_1_0.BackgroundSprite:Pause({
				stopFrame = arg_1_0._spriteOptions.stopFrame
			})
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0._isSprite and "Sprite" or ""

	arg_2_1 = arg_2_1 .. var_2_0

	if arg_2_0 and arg_2_0._lastState ~= arg_2_1 then
		arg_2_0._lastState = arg_2_1

		WZWIP.AnimateThemeElement(arg_2_0, arg_2_1)
	end
end

local function var_0_2(arg_3_0)
	var_0_1(arg_3_0, "ButtonUp")
	var_0_0(arg_3_0)
end

local function var_0_3(arg_4_0, arg_4_1)
	assert(arg_4_1, "You must provide a table of sprite options.")

	arg_4_0._isSprite = arg_4_1 ~= nil
	arg_4_0._spriteOptions = arg_4_1

	arg_4_0.BackgroundSprite:InitSpriteSheetOptions(arg_4_0._spriteOptions)
	var_0_2(arg_4_0)
	arg_4_0.BackgroundSprite:StopOnFrame(arg_4_1.stopFrame and arg_4_1.stopFrame or 1)
	ACTIONS.AnimateSequence(arg_4_0, "ShowSpriteDisplay")
end

local function var_0_4(arg_5_0)
	var_0_1(arg_5_0, "HighlightOnly")
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.ForceHighlightOnly = var_0_4
	arg_6_0.SetBackgroundAsSprite = var_0_3
	arg_6_0.AnimateQuickplayBgButtonUp = var_0_2
	arg_6_0._isSprite = false

	assert(arg_6_0.BackgroundImage)
	arg_6_0.BackgroundImage:SetMask(arg_6_0.Mask)
	arg_6_0.BackgroundSprite:SetMask(arg_6_0.SpriteMask)
	ACTIONS.AnimateSequence(arg_6_0, "HideSpriteDisplay")
	arg_6_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		var_0_1(arg_7_0, "ButtonOver")
		var_0_0(arg_7_0, true)

		if arg_6_0._spriteOptions ~= nil then
			arg_6_0.BackgroundSprite:Play(arg_6_0._spriteOptions)
		end
	end)
	arg_6_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		var_0_1(arg_8_0, "ButtonOverDisabled")
		var_0_0(arg_8_0, true)
	end)
	arg_6_0:addEventHandler("button_disable", function(arg_9_0, arg_9_1)
		if not arg_9_0:getParent():isInFocus() then
			var_0_1(arg_9_0, "ButtonUpDisabled")
			var_0_0(arg_9_0)
		end
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
	end
end

function QuickPlayButtonBackground(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 200 * _1080p)

	var_10_0.id = "QuickPlayButtonBackground"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0

	var_10_0:setUseStencil(true)

	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Backer"

	var_10_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_10_4:SetAlpha(0.3, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Backer = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "TextureLayer"

	var_10_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_10_6:SetAlpha(0.1, 0)
	var_10_6:SetPixelGridEnabled(true)
	var_10_6:SetPixelGridContrast(0.8, 0)
	var_10_6:SetPixelGridBlockWidth(2, 0)
	var_10_6:SetPixelGridBlockHeight(2, 0)
	var_10_6:SetPixelGridGutterWidth(1, 0)
	var_10_6:SetPixelGridGutterHeight(1, 0)
	var_10_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_10_0:addElement(var_10_6)

	var_10_0.TextureLayer = var_10_6

	local var_10_7

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
			controllerIndex = var_10_1
		})

		var_10_8.id = "WZWipBackground"

		var_10_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_10_0:addElement(var_10_8)

		var_10_0.WZWipBackground = var_10_8
	end

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "BackgroundImage"

	var_10_10:SetAlpha(0.25, 0)
	var_10_10:setImage(RegisterMaterial("button_tdm"), 0)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * 215, _1080p * -108, _1080p * 108)
	var_10_0:addElement(var_10_10)

	var_10_0.BackgroundImage = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "Mask"

	var_10_12:setImage(RegisterMaterial("stencil_mask"), 0)
	var_10_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * 1, 0, 0)
	var_10_0:addElement(var_10_12)

	var_10_0.Mask = var_10_12

	local var_10_13
	local var_10_14 = {
		columns = 10,
		playMode = 1,
		playbackRate = 30,
		endingFrame = 0,
		rows = 2,
		material = "spinner",
		startingFrame = 1,
		controllerIndex = var_10_1
	}
	local var_10_15 = MenuBuilder.BuildRegisteredType("Sprite", var_10_14)

	var_10_15.id = "BackgroundSprite"

	var_10_15:SetAlpha(0, 0)
	var_10_15:setImage(RegisterMaterial("spinner"), 0)
	var_10_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * 215, _1080p * -108, _1080p * 108)
	var_10_0:addElement(var_10_15)

	var_10_0.BackgroundSprite = var_10_15

	local var_10_16
	local var_10_17 = LUI.UIImage.new()

	var_10_17.id = "SpriteMask"

	var_10_17:setImage(RegisterMaterial("stencil_mask"), 0)
	var_10_17:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * 1, 0, 0)
	var_10_0:addElement(var_10_17)

	var_10_0.SpriteMask = var_10_17

	local var_10_18
	local var_10_19 = LUI.UIImage.new()

	var_10_19.id = "Gradient"

	var_10_19:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_10_19:SetAlpha(0, 0)
	var_10_19:SetPixelGridEnabled(true)
	var_10_19:SetPixelGridContrast(0.2, 0)
	var_10_19:SetPixelGridBlockWidth(2, 0)
	var_10_19:SetPixelGridBlockHeight(2, 0)
	var_10_19:SetPixelGridGutterWidth(1, 0)
	var_10_19:SetPixelGridGutterHeight(1, 0)
	var_10_19:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_10_0:addElement(var_10_19)

	var_10_0.Gradient = var_10_19

	local var_10_20
	local var_10_21 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_10_1
	})

	var_10_21.id = "HighlightTop"

	var_10_21:SetAlpha(0, 0)
	var_10_21:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_10_0:addElement(var_10_21)

	var_10_0.HighlightTop = var_10_21

	local var_10_22
	local var_10_23 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_10_1
	})

	var_10_23.id = "HighlightBottom"

	var_10_23:SetAlpha(0, 0)
	var_10_23:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_10_0:addElement(var_10_23)

	var_10_0.HighlightBottom = var_10_23

	local var_10_24
	local var_10_25 = LUI.UIImage.new()

	var_10_25.id = "Darkener"

	var_10_25:SetRGBFromInt(0, 0)
	var_10_25:SetAlpha(0, 0)
	var_10_0:addElement(var_10_25)

	var_10_0.Darkener = var_10_25

	local function var_10_26()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_26

	local var_10_27
	local var_10_28 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ButtonUp", var_10_28)

	local var_10_29 = {
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

	var_10_6:RegisterAnimationSequence("ButtonUp", var_10_29)

	local var_10_30 = {
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

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_30)

	local var_10_31 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ButtonUp", var_10_31)

	local var_10_32 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ButtonUp", var_10_32)

	local var_10_33 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ButtonUp", var_10_33)

	local var_10_34 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ButtonUp", var_10_34)

	local function var_10_35()
		var_10_4:AnimateSequence("ButtonUp")
		var_10_6:AnimateSequence("ButtonUp")
		var_10_10:AnimateSequence("ButtonUp")
		var_10_19:AnimateSequence("ButtonUp")
		var_10_21:AnimateSequence("ButtonUp")
		var_10_23:AnimateSequence("ButtonUp")
		var_10_25:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_35

	local var_10_36
	local var_10_37 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ButtonOverDisabled", var_10_37)

	local var_10_38 = {
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

	var_10_6:RegisterAnimationSequence("ButtonOverDisabled", var_10_38)

	local var_10_39 = {
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

	var_10_10:RegisterAnimationSequence("ButtonOverDisabled", var_10_39)

	local var_10_40 = {
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

	var_10_19:RegisterAnimationSequence("ButtonOverDisabled", var_10_40)

	local var_10_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ButtonOverDisabled", var_10_41)

	local var_10_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ButtonOverDisabled", var_10_42)

	local var_10_43 = {
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

	var_10_25:RegisterAnimationSequence("ButtonOverDisabled", var_10_43)

	local function var_10_44()
		var_10_4:AnimateSequence("ButtonOverDisabled")
		var_10_6:AnimateSequence("ButtonOverDisabled")
		var_10_10:AnimateSequence("ButtonOverDisabled")
		var_10_19:AnimateSequence("ButtonOverDisabled")
		var_10_21:AnimateSequence("ButtonOverDisabled")
		var_10_23:AnimateSequence("ButtonOverDisabled")
		var_10_25:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_44

	local var_10_45
	local var_10_46 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ButtonUpDisabled", var_10_46)

	local var_10_47 = {
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

	var_10_6:RegisterAnimationSequence("ButtonUpDisabled", var_10_47)

	local var_10_48 = {
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

	var_10_10:RegisterAnimationSequence("ButtonUpDisabled", var_10_48)

	local var_10_49 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ButtonUpDisabled", var_10_49)

	local var_10_50 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ButtonUpDisabled", var_10_50)

	local var_10_51 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ButtonUpDisabled", var_10_51)

	local var_10_52 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ButtonUpDisabled", var_10_52)

	local function var_10_53()
		var_10_4:AnimateSequence("ButtonUpDisabled")
		var_10_6:AnimateSequence("ButtonUpDisabled")
		var_10_10:AnimateSequence("ButtonUpDisabled")
		var_10_19:AnimateSequence("ButtonUpDisabled")
		var_10_21:AnimateSequence("ButtonUpDisabled")
		var_10_23:AnimateSequence("ButtonUpDisabled")
		var_10_25:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_53

	local var_10_54
	local var_10_55 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("UnavailableUp", var_10_55)

	local var_10_56 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("UnavailableUp", var_10_56)

	local var_10_57 = {
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

	var_10_10:RegisterAnimationSequence("UnavailableUp", var_10_57)

	local var_10_58 = {
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

	var_10_19:RegisterAnimationSequence("UnavailableUp", var_10_58)

	local var_10_59 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("UnavailableUp", var_10_59)

	local var_10_60 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("UnavailableUp", var_10_60)

	local var_10_61 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("UnavailableUp", var_10_61)

	local function var_10_62()
		var_10_4:AnimateSequence("UnavailableUp")
		var_10_6:AnimateSequence("UnavailableUp")
		var_10_10:AnimateSequence("UnavailableUp")
		var_10_19:AnimateSequence("UnavailableUp")
		var_10_21:AnimateSequence("UnavailableUp")
		var_10_23:AnimateSequence("UnavailableUp")
		var_10_25:AnimateSequence("UnavailableUp")
	end

	var_10_0._sequences.UnavailableUp = var_10_62

	local var_10_63
	local var_10_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("ButtonOver", var_10_64)

	local var_10_65 = {
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

	var_10_6:RegisterAnimationSequence("ButtonOver", var_10_65)

	local var_10_66 = {
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

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_66)

	local var_10_67 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorMid
		}
	}

	var_10_19:RegisterAnimationSequence("ButtonOver", var_10_67)

	local var_10_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ButtonOver", var_10_68)

	local var_10_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("ButtonOver", var_10_69)

	local var_10_70 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("ButtonOver", var_10_70)

	local function var_10_71()
		var_10_4:AnimateSequence("ButtonOver")
		var_10_6:AnimateSequence("ButtonOver")
		var_10_10:AnimateSequence("ButtonOver")
		var_10_19:AnimateSequence("ButtonOver")
		var_10_21:AnimateSequence("ButtonOver")
		var_10_23:AnimateSequence("ButtonOver")
		var_10_25:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_71

	local var_10_72
	local var_10_73 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("HighlightOnly", var_10_73)

	local var_10_74 = {
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

	var_10_6:RegisterAnimationSequence("HighlightOnly", var_10_74)

	local var_10_75 = {
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

	var_10_10:RegisterAnimationSequence("HighlightOnly", var_10_75)

	local var_10_76 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorMid
		}
	}

	var_10_19:RegisterAnimationSequence("HighlightOnly", var_10_76)

	local var_10_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("HighlightOnly", var_10_77)

	local var_10_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("HighlightOnly", var_10_78)

	local var_10_79 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("HighlightOnly", var_10_79)

	local function var_10_80()
		var_10_4:AnimateSequence("HighlightOnly")
		var_10_6:AnimateSequence("HighlightOnly")
		var_10_10:AnimateSequence("HighlightOnly")
		var_10_19:AnimateSequence("HighlightOnly")
		var_10_21:AnimateSequence("HighlightOnly")
		var_10_23:AnimateSequence("HighlightOnly")
		var_10_25:AnimateSequence("HighlightOnly")
	end

	var_10_0._sequences.HighlightOnly = var_10_80

	local var_10_81
	local var_10_82 = {
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipSetup", var_10_82)

	local var_10_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("WZWipSetup", var_10_83)

	local var_10_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("WZWipSetup", var_10_84)

	local var_10_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_10_21:RegisterAnimationSequence("WZWipSetup", var_10_85)

	local var_10_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_10_23:RegisterAnimationSequence("WZWipSetup", var_10_86)

	local function var_10_87()
		var_10_4:AnimateSequence("WZWipSetup")
		var_10_6:AnimateSequence("WZWipSetup")
		var_10_19:AnimateSequence("WZWipSetup")
		var_10_21:AnimateSequence("WZWipSetup")
		var_10_23:AnimateSequence("WZWipSetup")
	end

	var_10_0._sequences.WZWipSetup = var_10_87

	local var_10_88
	local var_10_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonOver", var_10_89)

	local var_10_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0.7,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonOver", var_10_90)

	local var_10_91 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipButtonOver", var_10_91)

	local function var_10_92()
		var_10_4:AnimateSequence("WZWipButtonOver")
		var_10_10:AnimateSequence("WZWipButtonOver")
		var_10_25:AnimateSequence("WZWipButtonOver")
	end

	var_10_0._sequences.WZWipButtonOver = var_10_92

	local var_10_93
	local var_10_94 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_94)

	local var_10_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0.7,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_95)

	local var_10_96 = {
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

	var_10_25:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_96)

	local function var_10_97()
		var_10_4:AnimateSequence("WZWipButtonOverDisabled")
		var_10_10:AnimateSequence("WZWipButtonOverDisabled")
		var_10_25:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_10_0._sequences.WZWipButtonOverDisabled = var_10_97

	local var_10_98
	local var_10_99 = {
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonUp", var_10_99)

	local var_10_100 = {
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

	var_10_10:RegisterAnimationSequence("WZWipButtonUp", var_10_100)

	local var_10_101 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipButtonUp", var_10_101)

	local function var_10_102()
		var_10_4:AnimateSequence("WZWipButtonUp")
		var_10_10:AnimateSequence("WZWipButtonUp")
		var_10_25:AnimateSequence("WZWipButtonUp")
	end

	var_10_0._sequences.WZWipButtonUp = var_10_102

	local var_10_103
	local var_10_104 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_104)

	local var_10_105 = {
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

	var_10_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_105)

	local var_10_106 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_106)

	local function var_10_107()
		var_10_4:AnimateSequence("WZWipButtonUpDisabled")
		var_10_10:AnimateSequence("WZWipButtonUpDisabled")
		var_10_25:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_10_0._sequences.WZWipButtonUpDisabled = var_10_107

	local var_10_108
	local var_10_109 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipHighlightOnly", var_10_109)

	local var_10_110 = {
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

	var_10_10:RegisterAnimationSequence("WZWipHighlightOnly", var_10_110)

	local var_10_111 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipHighlightOnly", var_10_111)

	local function var_10_112()
		var_10_4:AnimateSequence("WZWipHighlightOnly")
		var_10_10:AnimateSequence("WZWipHighlightOnly")
		var_10_25:AnimateSequence("WZWipHighlightOnly")
	end

	var_10_0._sequences.WZWipHighlightOnly = var_10_112

	local var_10_113
	local var_10_114 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipUnavailableUpSprite", var_10_114)

	local var_10_115 = {
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipUnavailableUpSprite", var_10_115)

	local var_10_116 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipUnavailableUpSprite", var_10_116)

	local function var_10_117()
		var_10_4:AnimateSequence("WZWipUnavailableUpSprite")
		var_10_15:AnimateSequence("WZWipUnavailableUpSprite")
		var_10_25:AnimateSequence("WZWipUnavailableUpSprite")
	end

	var_10_0._sequences.WZWipUnavailableUpSprite = var_10_117

	local var_10_118
	local var_10_119 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipUnavailableUp", var_10_119)

	local var_10_120 = {
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

	var_10_10:RegisterAnimationSequence("WZWipUnavailableUp", var_10_120)

	local var_10_121 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipUnavailableUp", var_10_121)

	local function var_10_122()
		var_10_4:AnimateSequence("WZWipUnavailableUp")
		var_10_10:AnimateSequence("WZWipUnavailableUp")
		var_10_25:AnimateSequence("WZWipUnavailableUp")
	end

	var_10_0._sequences.WZWipUnavailableUp = var_10_122

	local var_10_123
	local var_10_124 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonOverSprite", var_10_124)

	local var_10_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonOverSprite", var_10_125)

	local var_10_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0.7,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipButtonOverSprite", var_10_126)

	local var_10_127 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipButtonOverSprite", var_10_127)

	local function var_10_128()
		var_10_4:AnimateSequence("WZWipButtonOverSprite")
		var_10_10:AnimateSequence("WZWipButtonOverSprite")
		var_10_15:AnimateSequence("WZWipButtonOverSprite")
		var_10_25:AnimateSequence("WZWipButtonOverSprite")
	end

	var_10_0._sequences.WZWipButtonOverSprite = var_10_128

	local var_10_129
	local var_10_130 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonUpSprite", var_10_130)

	local var_10_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipButtonUpSprite", var_10_131)

	local var_10_132 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipButtonUpSprite", var_10_132)

	local function var_10_133()
		var_10_4:AnimateSequence("WZWipButtonUpSprite")
		var_10_15:AnimateSequence("WZWipButtonUpSprite")
		var_10_25:AnimateSequence("WZWipButtonUpSprite")
	end

	var_10_0._sequences.WZWipButtonUpSprite = var_10_133

	local var_10_134
	local var_10_135 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonOverDisabledSprite", var_10_135)

	local var_10_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0.7,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipButtonOverDisabledSprite", var_10_136)

	local var_10_137 = {
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

	var_10_25:RegisterAnimationSequence("WZWipButtonOverDisabledSprite", var_10_137)

	local function var_10_138()
		var_10_4:AnimateSequence("WZWipButtonOverDisabledSprite")
		var_10_15:AnimateSequence("WZWipButtonOverDisabledSprite")
		var_10_25:AnimateSequence("WZWipButtonOverDisabledSprite")
	end

	var_10_0._sequences.WZWipButtonOverDisabledSprite = var_10_138

	local var_10_139
	local var_10_140 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("WZWipButtonUpDisabledSprite", var_10_140)

	local var_10_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("WZWipButtonUpDisabledSprite", var_10_141)

	local var_10_142 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("WZWipButtonUpDisabledSprite", var_10_142)

	local function var_10_143()
		var_10_4:AnimateSequence("WZWipButtonUpDisabledSprite")
		var_10_15:AnimateSequence("WZWipButtonUpDisabledSprite")
		var_10_25:AnimateSequence("WZWipButtonUpDisabledSprite")
	end

	var_10_0._sequences.WZWipButtonUpDisabledSprite = var_10_143

	local var_10_144
	local var_10_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowSpriteDisplay", var_10_145)

	local var_10_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowSpriteDisplay", var_10_146)

	local var_10_147 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ShowSpriteDisplay", var_10_147)

	local function var_10_148()
		var_10_10:AnimateSequence("ShowSpriteDisplay")
		var_10_12:AnimateSequence("ShowSpriteDisplay")
		var_10_17:AnimateSequence("ShowSpriteDisplay")
	end

	var_10_0._sequences.ShowSpriteDisplay = var_10_148

	local var_10_149
	local var_10_150 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("HideSpriteDisplay", var_10_150)

	local var_10_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_15:RegisterAnimationSequence("HideSpriteDisplay", var_10_151)

	local var_10_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("HideSpriteDisplay", var_10_152)

	local function var_10_153()
		var_10_12:AnimateSequence("HideSpriteDisplay")
		var_10_15:AnimateSequence("HideSpriteDisplay")
		var_10_17:AnimateSequence("HideSpriteDisplay")
	end

	var_10_0._sequences.HideSpriteDisplay = var_10_153

	var_0_5(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("QuickPlayButtonBackground", QuickPlayButtonBackground)
LockTable(_M)
