module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function StreakKillCategory(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "StreakKillCategory"
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

	var_2_4.id = "Line"

	var_2_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Line = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "CrossV"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -1, 0, _1080p * -5, _1080p * 4)
	var_2_0:addElement(var_2_6)

	var_2_0.CrossV = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "CrossH"

	var_2_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -5, _1080p * 3.5, _1080p * -1, 0)
	var_2_0:addElement(var_2_8)

	var_2_0.CrossH = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "Text"

	var_2_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("INTEL_MP/KILLS_SHORT_DESC"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_10:SetStartupDelay(1250)
	var_2_10:SetLineHoldTime(400)
	var_2_10:SetAnimMoveTime(150)
	var_2_10:SetAnimMoveSpeed(50)
	var_2_10:SetEndDelay(500)
	var_2_10:SetCrossfadeTime(400)
	var_2_10:SetFadeInTime(300)
	var_2_10:SetFadeOutTime(300)
	var_2_10:SetMaxVisibleLines(1)
	var_2_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 6, 0, _1080p * -28, _1080p * -8)
	var_2_0:addElement(var_2_10)

	var_2_0.Text = var_2_10

	local function var_2_11()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_11

	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_2_4:RegisterAnimationSequence("HighlightOff", var_2_12)

	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_2_10:RegisterAnimationSequence("HighlightOff", var_2_13)

	local function var_2_14()
		var_2_4:AnimateSequence("HighlightOff")
		var_2_10:AnimateSequence("HighlightOff")
	end

	var_2_0._sequences.HighlightOff = var_2_14

	local var_2_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 5
		}
	}

	var_2_4:RegisterAnimationSequence("HighlightOn", var_2_15)

	local var_2_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_10:RegisterAnimationSequence("HighlightOn", var_2_16)

	local function var_2_17()
		var_2_4:AnimateSequence("HighlightOn")
		var_2_10:AnimateSequence("HighlightOn")
	end

	var_2_0._sequences.HighlightOn = var_2_17

	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 4
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_18)

	local function var_2_19()
		var_2_10:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_19

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("StreakKillCategory", StreakKillCategory)
LockTable(_M)
