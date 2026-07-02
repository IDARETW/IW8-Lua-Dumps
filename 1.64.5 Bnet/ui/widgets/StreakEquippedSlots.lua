module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function StreakEquippedSlots(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 160 * _1080p, 0, 32 * _1080p)

	var_2_0.id = "StreakEquippedSlots"
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

	var_2_4.id = "EquippedTxt"

	var_2_4:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_2_4:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED1"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 151, _1080p * -10, _1080p * 10)
	var_2_0:addElement(var_2_4)

	var_2_0.EquippedTxt = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "EquippedNum"

	var_2_6:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_2_6:setText("#/#", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -155, _1080p * -9, _1080p * -10, _1080p * 10)
	var_2_0:addElement(var_2_6)

	var_2_0.EquippedNum = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 201
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_8)

	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -260
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -114
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_9)

	local function var_2_10()
		var_2_4:AnimateSequence("AR")
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_10

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("StreakEquippedSlots", StreakEquippedSlots)
LockTable(_M)
