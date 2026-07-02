module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = SWATCHES.HUD.highlight
	local var_1_1 = {
		a = 63.75,
		r = var_1_0.r * 255,
		g = var_1_0.g * 255,
		b = var_1_0.b * 255
	}
	local var_1_2 = LUI.Alignment.Left

	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		var_1_2 = LUI.Alignment.Right
	end

	arg_1_2 = arg_1_2 or {}
	arg_1_2.font = arg_1_2.font and arg_1_2.font or FONTS.GetFont(FONTS.BattleNetRegular.File)
	arg_1_2.alignment = arg_1_2.alignment and arg_1_2.alignment or var_1_2
	arg_1_2.focusType = arg_1_2.focusType and arg_1_2.focusType or FocusType.MouseOver
	arg_1_2.defaultValue = arg_1_2.defaultValue and arg_1_2.defaultValue or arg_1_0.Text:getText()
	arg_1_2.textSelectionColor = arg_1_2.textSelectionColor and arg_1_2.textSelectionColor or var_1_1
	arg_1_2.autoConfirmOnTab = true
	arg_1_2.autoSelectAllOnActive = true
	arg_1_2.autoConfirmOnOutsideClick = true

	LUI.AddEditBoxLogic(arg_1_0.Text, arg_1_1, arg_1_2)
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.Text.textEdit)

	if arg_2_0._lastState ~= arg_2_1 then
		arg_2_0._lastState = arg_2_1

		if IsLanguageRightToLeft(GetCurrentLanguage()) then
			arg_2_0.Text.textEdit:SetAlignment(LUI.Alignment.Right)
		else
			arg_2_0.Text.textEdit:SetAlignment(LUI.Alignment.Left)
		end

		WZWIP.AnimateThemeElement(arg_2_0, arg_2_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.AddEditBoxLogic = var_0_0

	arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		var_0_1(arg_4_0, "ButtonOver")
	end)
	arg_3_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		var_0_1(arg_5_0, "ButtonUp")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end
end

function GenericEditBox(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 630 * _1080p, 0, 34 * _1080p)

	var_6_0.id = "GenericEditBox"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Glow"

	var_6_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_4:SetAlpha(0, 0)
	var_6_4:setImage(RegisterMaterial("button_glow"), 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_6_0:addElement(var_6_4)

	var_6_0.Glow = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "BGImage"

	var_6_6:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_6:SetAlpha(0.3, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.BGImage = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "TextureLayer"

	var_6_8:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_6_8:SetAlpha(0.1, 0)
	var_6_8:SetPixelGridEnabled(true)
	var_6_8:SetPixelGridContrast(0.8, 0)
	var_6_8:SetPixelGridBlockWidth(2, 0)
	var_6_8:SetPixelGridBlockHeight(2, 0)
	var_6_8:SetPixelGridGutterWidth(1, 0)
	var_6_8:SetPixelGridGutterHeight(1, 0)
	var_6_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_6_0:addElement(var_6_8)

	var_6_0.TextureLayer = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "Text"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 20, 0, _1080p * 6, _1080p * -6)
	var_6_0:addElement(var_6_10)

	var_6_0.Text = var_6_10

	local var_6_11
	local var_6_12 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_13 = LUI.UIBorder.new(var_6_12)

	var_6_13.id = "Border"

	var_6_13:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_13:SetAlpha(0, 0)
	var_6_13:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 4)
	var_6_0:addElement(var_6_13)

	var_6_0.Border = var_6_13

	local function var_6_14()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_14

	local var_6_15
	local var_6_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonOver", var_6_16)

	local var_6_17 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_17)

	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOver", var_6_18)

	local var_6_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_6_13:RegisterAnimationSequence("ButtonOver", var_6_19)

	local function var_6_20()
		var_6_4:AnimateSequence("ButtonOver")
		var_6_6:AnimateSequence("ButtonOver")
		var_6_10:AnimateSequence("ButtonOver")
		var_6_13:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_20

	local var_6_21
	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonUp", var_6_22)

	local var_6_23 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_23)

	local var_6_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUp", var_6_24)

	local var_6_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_13:RegisterAnimationSequence("ButtonUp", var_6_25)

	local function var_6_26()
		var_6_4:AnimateSequence("ButtonUp")
		var_6_6:AnimateSequence("ButtonUp")
		var_6_10:AnimateSequence("ButtonUp")
		var_6_13:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_26

	local var_6_27
	local var_6_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -12
		}
	}

	var_6_10:RegisterAnimationSequence("AR", var_6_28)

	local function var_6_29()
		var_6_10:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipSetup", var_6_31)

	local var_6_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipSetup", var_6_32)

	local var_6_33 = {
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

	var_6_10:RegisterAnimationSequence("WZWipSetup", var_6_33)

	local var_6_34 = {
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

	var_6_13:RegisterAnimationSequence("WZWipSetup", var_6_34)

	local function var_6_35()
		var_6_4:AnimateSequence("WZWipSetup")
		var_6_8:AnimateSequence("WZWipSetup")
		var_6_10:AnimateSequence("WZWipSetup")
		var_6_13:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_35

	local var_6_36
	local var_6_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipButtonOver", var_6_37)

	local var_6_38 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipButtonOver", var_6_38)

	local var_6_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipButtonOver", var_6_39)

	local var_6_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_6_13:RegisterAnimationSequence("WZWipButtonOver", var_6_40)

	local function var_6_41()
		var_6_4:AnimateSequence("WZWipButtonOver")
		var_6_6:AnimateSequence("WZWipButtonOver")
		var_6_10:AnimateSequence("WZWipButtonOver")
		var_6_13:AnimateSequence("WZWipButtonOver")
	end

	var_6_0._sequences.WZWipButtonOver = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipButtonUp", var_6_43)

	local var_6_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonUp", var_6_44)

	local var_6_45 = {
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

	var_6_10:RegisterAnimationSequence("WZWipButtonUp", var_6_45)

	local var_6_46 = {
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

	var_6_13:RegisterAnimationSequence("WZWipButtonUp", var_6_46)

	local function var_6_47()
		var_6_4:AnimateSequence("WZWipButtonUp")
		var_6_8:AnimateSequence("WZWipButtonUp")
		var_6_10:AnimateSequence("WZWipButtonUp")
		var_6_13:AnimateSequence("WZWipButtonUp")
	end

	var_6_0._sequences.WZWipButtonUp = var_6_47

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GenericEditBox", GenericEditBox)
LockTable(_M)
