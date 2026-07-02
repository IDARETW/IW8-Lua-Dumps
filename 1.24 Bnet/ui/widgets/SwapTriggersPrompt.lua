module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = false
	local var_1_1 = LUI.UIBindButton.new()

	var_1_1.id = "selfBindButton"

	arg_1_0:addElement(var_1_1)

	arg_1_0.bindButton = var_1_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function SwapTriggersPrompt(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 34 * _1080p)

	var_2_0.id = "SwapTriggersPrompt"
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

	var_2_4.id = "Background"

	var_2_4:SetRGBFromInt(0, 0)
	var_2_4:SetAlpha(0.15, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "SwapTriggers"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("MENU/FLIP_TRIGGERS_WITH_BUMPERS_PROMPT"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 25, _1080p * -15, _1080p * -10, _1080p * 12)
	var_2_0:addElement(var_2_6)

	var_2_0.SwapTriggers = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "Line"

	var_2_8:SetAlpha(0.25, 0)
	var_2_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 15, _1080p * -15, 0, _1080p * 1)
	var_2_0:addElement(var_2_8)

	var_2_0.Line = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_10)

	local function var_2_11()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_11

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SwapTriggersPrompt", SwapTriggersPrompt)
LockTable(_M)
