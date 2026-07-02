module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.QuantityText)

	local var_1_0 = _1080p * 34
	local var_1_1 = 0

	if arg_1_1 and #arg_1_1 > 0 then
		arg_1_0.QuantityText:setText(arg_1_1)

		var_1_1 = LAYOUT.GetTextWidth(arg_1_0.QuantityText) + var_1_0

		arg_1_0.QuantityText:SetRight(var_1_1, 1)
	end

	return var_1_0 + var_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetText = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function StoreBillboardDescItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 24 * _1080p)

	var_3_0.id = "StoreBillboardDescItem"
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

	var_3_4.id = "RarityIcon"

	var_3_4:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 24, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_4)

	var_3_0.RarityIcon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "QuantityText"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetStartupDelay(2000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(2000)
	var_3_6:SetAnimMoveSpeed(150)
	var_3_6:SetEndDelay(2000)
	var_3_6:SetCrossfadeTime(250)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(3)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 34, _1080p * 200, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_6)

	var_3_0.QuantityText = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local function var_3_8()
		return
	end

	var_3_0._sequences.ShowPrice = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.HidePrice = var_3_9

	local function var_3_10()
		return
	end

	var_3_0._sequences.Fade = var_3_10

	local var_3_11
	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_13

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("StoreBillboardDescItem", StoreBillboardDescItem)
LockTable(_M)
