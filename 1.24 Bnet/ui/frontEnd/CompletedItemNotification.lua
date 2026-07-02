module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function CompletedItemNotification(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 78 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "CompletedItemNotification"
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

	var_2_4.id = "Backer"

	var_2_4:SetRGBFromTable(SWATCHES.CAC.loadoutBtnAccent, 0)
	var_2_4:SetPixelGridEnabled(true)
	var_2_4:SetPixelGridContrast(0.5, 0)
	var_2_4:SetPixelGridBlockWidth(2, 0)
	var_2_4:SetPixelGridBlockHeight(2, 0)
	var_2_4:SetPixelGridGutterWidth(1, 0)
	var_2_4:SetPixelGridGutterHeight(1, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Backer = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Highlight"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_2_0:addElement(var_2_6)

	var_2_0.Highlight = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "NewText"

	var_2_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Right)
	var_2_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -78, _1080p * -5, _1080p * -12, _1080p * 12)
	var_2_0:addElement(var_2_8)

	var_2_0.NewText = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 78
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_10)

	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_11)

	local function var_2_12()
		var_2_6:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_12

	return var_2_0
end

MenuBuilder.registerType("CompletedItemNotification", CompletedItemNotification)
LockTable(_M)
