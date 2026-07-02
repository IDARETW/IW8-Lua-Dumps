module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function TextChatEntryLine(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 492 * _1080p, 0, 24 * _1080p)

	var_2_0.id = "TextChatEntryLine"
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

	var_2_4.id = "NameHighlight"

	var_2_4:SetAlpha(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 114, 0, _1080p * 24)
	var_2_0:addElement(var_2_4)

	var_2_0.NameHighlight = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Message"

	var_2_6:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 9)
	var_2_0:addElement(var_2_6)

	var_2_0.Message = var_2_6

	local var_2_7 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("DefaultSequence", var_2_7)

	local function var_2_8()
		var_2_4:AnimateSequence("DefaultSequence")
	end

	var_2_0._sequences.DefaultSequence = var_2_8

	local var_2_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("FadeOut", var_2_9)

	local function var_2_10()
		var_2_6:AnimateSequence("FadeOut")
	end

	var_2_0._sequences.FadeOut = var_2_10

	local var_2_11 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.lockColor
		}
	}

	var_2_4:RegisterAnimationSequence("MouseOverName", var_2_11)

	local function var_2_12()
		var_2_4:AnimateSequence("MouseOverName")
	end

	var_2_0._sequences.MouseOverName = var_2_12

	local var_2_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("MouseUpName", var_2_13)

	local function var_2_14()
		var_2_4:AnimateSequence("MouseUpName")
	end

	var_2_0._sequences.MouseUpName = var_2_14

	local var_2_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("FadeIn", var_2_15)

	local function var_2_16()
		var_2_6:AnimateSequence("FadeIn")
	end

	var_2_0._sequences.FadeIn = var_2_16

	local var_2_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_17)

	local function var_2_18()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_18

	local var_2_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("SPInit", var_2_19)

	local function var_2_20()
		var_2_6:AnimateSequence("SPInit")
	end

	var_2_0._sequences.SPInit = var_2_20

	var_0_0(var_2_0, var_2_1, arg_2_1)
	ACTIONS.AnimateSequence(var_2_0, "DefaultSequence")

	return var_2_0
end

MenuBuilder.registerType("TextChatEntryLine", TextChatEntryLine)
LockTable(_M)
