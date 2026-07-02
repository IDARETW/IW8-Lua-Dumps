module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		ACTIONS.AnimateSequence(arg_1_0, "RightAligned")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function GunsmithDetailsModifier(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 356 * _1080p, 0, 22 * _1080p)

	var_2_0.id = "GunsmithDetailsModifier"
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

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.background, 0)
	var_2_4:SetAlpha(0.25, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Backer = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "ModIcons"

	var_2_6:setText("[{attribute_pro}][{attribute_pro}][{attribute_pro}][{attribute_pro}]", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetTracking(4 * _1080p, 0)
	var_2_6:SetAlignment(LUI.Alignment.Right)
	var_2_6:SetTintFontIcons(true)
	var_2_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 2, _1080p * 74, _1080p * -10, _1080p * 10)
	var_2_0:addElement(var_2_6)

	var_2_0.ModIcons = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "ModText"

	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_8:SetStartupDelay(2000)
	var_2_8:SetLineHoldTime(400)
	var_2_8:SetAnimMoveTime(5000)
	var_2_8:SetAnimMoveSpeed(150)
	var_2_8:SetEndDelay(2000)
	var_2_8:SetCrossfadeTime(250)
	var_2_8:SetFadeInTime(300)
	var_2_8:SetFadeOutTime(300)
	var_2_8:SetMaxVisibleLines(1)
	var_2_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 79, _1080p * 354, _1080p * -10, _1080p * 10)
	var_2_0:addElement(var_2_8)

	var_2_0.ModText = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 286
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 356
		}
	}

	var_2_6:RegisterAnimationSequence("RightAligned", var_2_10)

	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 281
		}
	}

	var_2_8:RegisterAnimationSequence("RightAligned", var_2_11)

	local function var_2_12()
		var_2_6:AnimateSequence("RightAligned")
		var_2_8:AnimateSequence("RightAligned")
	end

	var_2_0._sequences.RightAligned = var_2_12

	local var_2_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_13)

	local var_2_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -19
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_14)

	local function var_2_15()
		var_2_4:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_15

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GunsmithDetailsModifier", GunsmithDetailsModifier)
LockTable(_M)
