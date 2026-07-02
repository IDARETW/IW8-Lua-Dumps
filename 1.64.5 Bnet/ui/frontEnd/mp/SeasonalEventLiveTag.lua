module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	LAYOUT.SizeTextBackingSizeToText(arg_1_0, {
		padding = 10,
		textfield = arg_1_0.Text,
		textfieldBackingImage = arg_1_0.TextBacking
	})
end

function SeasonalEventLiveTag(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 65 * _1080p, 0, 24 * _1080p)

	var_2_0.id = "SeasonalEventLiveTag"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "TextBacking"

	var_2_4:SetRGBFromTable(SWATCHES.CH2.CH2_EventColorRed, 0)
	var_2_4:setImage(RegisterMaterial("menu_backer_redact_white"), 0)
	var_2_4:Setup3SliceHorizontalImage(_1080p * 25, 0.3)
	var_2_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -65, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.TextBacking = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Text"

	var_2_6:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_2_6:SetAlpha(0.8, 0)
	var_2_6:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONS/EVENT_LIVE")), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -72, _1080p * -10, _1080p * -12, _1080p * 12)
	var_2_0:addElement(var_2_6)

	var_2_0.Text = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_9)

	local function var_2_10()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_10

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SeasonalEventLiveTag", SeasonalEventLiveTag)
LockTable(_M)
