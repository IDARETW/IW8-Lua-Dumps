module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	elseif IsLanguageKorean() or IsLanguageChinese() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "KORZHJP")
	end
end

function BilletSubTitle(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 20 * _1080p)

	var_2_0.id = "BilletSubTitle"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "DOBTitle"

	var_2_4:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 500, 0, _1080p * 18)
	var_2_0:addElement(var_2_4)

	var_2_0.DOBTitle = var_2_4

	local var_2_5
	local var_2_6 = {
		borderThicknessLeft = _1080p * 8,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_2_7 = LUI.UIBorder.new(var_2_6)

	var_2_7.id = "Square"

	var_2_7:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_2_7:SetScale(-0.25, 0)
	var_2_7:SetBorderThicknessLeft(_1080p * 8, 0)
	var_2_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 16, _1080p * 6, _1080p * 14)
	var_2_0:addElement(var_2_7)

	var_2_0.Square = var_2_7

	local function var_2_8()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_8

	local var_2_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -491
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_9)

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_2_7:RegisterAnimationSequence("AR", var_2_10)

	local function var_2_11()
		var_2_4:AnimateSequence("AR")
		var_2_7:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_11

	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 19
		}
	}

	var_2_4:RegisterAnimationSequence("KORZHJP", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("KORZHJP")
	end

	var_2_0._sequences.KORZHJP = var_2_13

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BilletSubTitle", BilletSubTitle)
LockTable(_M)
