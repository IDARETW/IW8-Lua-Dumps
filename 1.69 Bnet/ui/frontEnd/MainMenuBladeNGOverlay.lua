module(..., package.seeall)

local function var_0_0(arg_1_0)
	if not arg_1_0._expanded then
		arg_1_0._expanded = true

		if not IsLanguageEnglish() then
			ACTIONS.AnimateSequence(arg_1_0, "Expanded")
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._expanded then
		arg_2_0._expanded = false

		if not IsLanguageEnglish() then
			ACTIONS.AnimateSequence(arg_2_0, "Contracted")
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.FlagExpanded = var_0_0
	arg_3_0.FlagContracted = var_0_1

	if IsLanguageJapanese() or IsLanguageRussian() or IsLanguageGerman() then
		ACTIONS.AnimateSequence(arg_3_0, "JP")
	elseif IsLanguageSafeChinese() or IsLanguageSimplifiedChinese() then
		ACTIONS.AnimateSequence(arg_3_0, "CHSF")
	elseif IsLanguageTraditionalChinese() then
		ACTIONS.AnimateSequence(arg_3_0, "CHTR")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function MainMenuBladeNGOverlay(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "MainMenuBladeNGOverlay"
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

	var_4_4.id = "ButtonDescriptionBG"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_4:SetPixelGridEnabled(true)
	var_4_4:SetPixelGridContrast(0.5, 0)
	var_4_4:SetPixelGridBlockWidth(2, 0)
	var_4_4:SetPixelGridBlockHeight(2, 0)
	var_4_4:SetPixelGridGutterWidth(1, 0)
	var_4_4:SetPixelGridGutterHeight(1, 0)
	var_4_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 9, _1080p * -9, _1080p * 353, _1080p * 425)
	var_4_0:addElement(var_4_4)

	var_4_0.ButtonDescriptionBG = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "ButtonDescription"

	var_4_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_6:SetAlpha(0, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/NG_DESC"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetDecodeUpdatesPerLetter(4)
	var_4_6:SetDecodeUseSystemTime(false)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 70, _1080p * -70, _1080p * 361, _1080p * 379)
	var_4_0:addElement(var_4_6)

	var_4_0.ButtonDescription = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8
	local var_4_9 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Expanded", var_4_9)

	local var_4_10 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Expanded", var_4_10)

	local function var_4_11()
		var_4_4:AnimateSequence("Expanded")
		var_4_6:AnimateSequence("Expanded")
	end

	var_4_0._sequences.Expanded = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Contracted", var_4_13)

	local var_4_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Contracted", var_4_14)

	local function var_4_15()
		var_4_4:AnimateSequence("Contracted")
		var_4_6:AnimateSequence("Contracted")
	end

	var_4_0._sequences.Contracted = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 367
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 387
		}
	}

	var_4_6:RegisterAnimationSequence("JP", var_4_17)

	local function var_4_18()
		var_4_6:AnimateSequence("JP")
	end

	var_4_0._sequences.JP = var_4_18

	local var_4_19
	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 352
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 440
		}
	}

	var_4_4:RegisterAnimationSequence("AR", var_4_20)

	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 403
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 367
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_21)

	local function var_4_22()
		var_4_4:AnimateSequence("AR")
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_22

	local var_4_23
	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 367
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 391
		}
	}

	var_4_6:RegisterAnimationSequence("CHSF", var_4_24)

	local function var_4_25()
		var_4_6:AnimateSequence("CHSF")
	end

	var_4_0._sequences.CHSF = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 367
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 394
		}
	}

	var_4_6:RegisterAnimationSequence("CHTR", var_4_27)

	local function var_4_28()
		var_4_6:AnimateSequence("CHTR")
	end

	var_4_0._sequences.CHTR = var_4_28

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MainMenuBladeNGOverlay", MainMenuBladeNGOverlay)
LockTable(_M)
