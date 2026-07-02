module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.CurrencyIcon)
	assert(arg_1_0.CurrencyCount)

	if not arg_1_1 then
		return
	end

	local var_1_0 = 5 * _1080p
	local var_1_1 = 32 * _1080p
	local var_1_2 = arg_1_0.parameterizedCountText and Engine.CBBHFCGDIC(arg_1_0.parameterizedCountText, arg_1_1) or arg_1_1

	arg_1_0.CurrencyCount:setText(var_1_2)

	local var_1_3 = LAYOUT.GetTextWidth(arg_1_0.CurrencyCount)
	local var_1_4 = var_1_3 + var_1_0
	local var_1_5 = var_1_4 + var_1_1

	arg_1_0.CurrencyCount:SetLeft(-var_1_3)
	arg_1_0.CurrencyIcon:SetRight(-var_1_4)
	arg_1_0.CurrencyIcon:SetLeft(-var_1_5)

	return var_1_5
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_1, "SetCurrencyCountAlignment - nil textAlignment specified")
	arg_2_0.CurrencyCount:SetAlignment(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_1, "SetParameterizedCountText - nil parameterizedText specified")
	assert(type(arg_3_1) == "string", "SetParameterizedCountText - parameterizedText expected to be a string")

	arg_3_0.parameterizedCountText = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.UpdateCurrencyCount = var_0_0
	arg_4_0.SetCurrencyCountAlignment = var_0_1
	arg_4_0.SetParameterizedCountText = var_0_2

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_4_0, "WZSetup")
	end
end

function CurrencyWidget(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 85 * _1080p, 0, 40 * _1080p)

	var_5_0.id = "CurrencyWidget"
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

	var_5_4.id = "CurrencyIcon"

	var_5_4:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -85, _1080p * -53, _1080p * -16, _1080p * 16)
	var_5_0:addElement(var_5_4)

	var_5_0.CurrencyIcon = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "CurrencyCount"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_6:setText("0000", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetWordWrap(false)
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -48, 0, _1080p * -10, _1080p * 10)
	var_5_0:addElement(var_5_6)

	var_5_0.CurrencyCount = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Btn"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT2_BUTTON"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetTintFontIcons(true)
	var_5_8:SetShadowRGBFromInt(0, 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -28, _1080p * -5, _1080p * -14, _1080p * 14)
	var_5_0:addElement(var_5_8)

	var_5_0.Btn = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10
	local var_5_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		}
	}

	var_5_6:RegisterAnimationSequence("AR", var_5_11)

	local function var_5_12()
		var_5_6:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_12

	local var_5_13
	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_6:RegisterAnimationSequence("WZSetup", var_5_14)

	local function var_5_15()
		var_5_6:AnimateSequence("WZSetup")
	end

	var_5_0._sequences.WZSetup = var_5_15

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CurrencyWidget", CurrencyWidget)
LockTable(_M)
