module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1)

	if var_1_0 then
		arg_1_0:SetAlpha(1)

		local var_1_1 = LOOT.GetRarityColor(var_1_0)
		local var_1_2 = LOOT.GetLootQualityString(var_1_0)

		if var_1_0 > -1 then
			arg_1_0.RarityIcon:SetAlpha(1)
			arg_1_0.RarityIcon:setImage(RegisterMaterial("icon_rarity_" .. var_1_0 + 1))
		end

		arg_1_0.QualityText:setText(var_1_2)
		arg_1_0.QualityText:SetRGBFromTable(var_1_1)
		arg_1_0.RarityIcon:SetRGBFromTable(var_1_1)
	else
		arg_1_0:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0)
	return LAYOUT.GetElementWidth(arg_2_0.RarityIcon) + LAYOUT.GetTextWidth(arg_2_0.QualityText) + 10 * _1080p
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateQualityText = var_0_0
	arg_3_0.CalculateWidth = var_0_1

	arg_3_0.RarityIcon:SetAlpha(0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function QualityWithText(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 160 * _1080p, 0, 32 * _1080p)

	var_4_0.id = "QualityWithText"
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

	var_4_4.id = "MainBacker"

	var_4_4:SetRGBFromInt(4737096, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_4:SetPixelGridEnabled(true)
	var_4_4:SetPixelGridContrast(0.5, 0)
	var_4_4:SetPixelGridBlockWidth(2, 0)
	var_4_4:SetPixelGridBlockHeight(2, 0)
	var_4_4:SetPixelGridGutterWidth(1, 0)
	var_4_4:SetPixelGridGutterHeight(1, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 183, 0, _1080p * 32)
	var_4_0:addElement(var_4_4)

	var_4_0.MainBacker = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "QualityText"

	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 43, _1080p * 418, _1080p * 4, _1080p * 28)
	var_4_0:addElement(var_4_6)

	var_4_0.QualityText = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "RarityIcon"

	var_4_8:setImage(RegisterMaterial("icon_rarity_4"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_4_0:addElement(var_4_8)

	var_4_0.RarityIcon = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_10)

	local function var_4_11()
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_11

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("QualityWithText", QualityWithText)
LockTable(_M)
