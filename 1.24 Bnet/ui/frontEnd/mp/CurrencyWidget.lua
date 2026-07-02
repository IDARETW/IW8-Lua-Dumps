module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.CurrencyIcon)
	assert(arg_1_0.CurrencyCount)

	if not arg_1_1 then
		return
	end

	local var_1_0 = 5 * _1080p
	local var_1_1 = 32 * _1080p

	arg_1_0.CurrencyCount:setText(arg_1_1)

	local var_1_2 = LAYOUT.GetTextWidth(arg_1_0.CurrencyCount)
	local var_1_3 = var_1_2 + var_1_0
	local var_1_4 = var_1_3 + var_1_1

	arg_1_0.CurrencyCount:SetLeft(-var_1_2)
	arg_1_0.CurrencyIcon:SetRight(-var_1_3)
	arg_1_0.CurrencyIcon:SetLeft(-var_1_4)

	return var_1_4
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateCurrencyCount = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function CurrencyWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 85 * _1080p, 0, 40 * _1080p)

	var_3_0.id = "CurrencyWidget"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "CurrencyIcon"

	var_3_4:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -85, _1080p * -53, _1080p * -16, _1080p * 16)
	var_3_0:addElement(var_3_4)

	var_3_0.CurrencyIcon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "CurrencyCount"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_6:setText("0000", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -48, 0, _1080p * -10, _1080p * 10)
	var_3_0:addElement(var_3_6)

	var_3_0.CurrencyCount = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Btn"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT2_BUTTON"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetTintFontIcons(true)
	var_3_8:SetShadowRGBFromInt(0, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -28, _1080p * -5, _1080p * -14, _1080p * 14)
	var_3_0:addElement(var_3_8)

	var_3_0.Btn = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10 = {
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

	var_3_6:RegisterAnimationSequence("AR", var_3_10)

	local function var_3_11()
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_11

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CurrencyWidget", CurrencyWidget)
LockTable(_M)
