module(..., package.seeall)

local var_0_0 = 40 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = 0

	if arg_1_1 and #arg_1_1 > 0 then
		arg_1_0.Prompt:setText(arg_1_1)

		var_1_0 = LAYOUT.GetTextWidth(arg_1_0.Prompt) + var_0_0

		for iter_1_0 = 1, #arg_1_0._resizeElements do
			arg_1_0._resizeElements[iter_1_0]:SetRight(var_1_0, 1)
		end

		arg_1_0:SetAlpha(1)
	else
		arg_1_0:SetAlpha(0)
	end

	return var_1_0
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetText = var_0_1
	arg_2_0._resizeElements = {
		arg_2_0.Backer,
		arg_2_0.TextureLayer
	}

	local function var_2_0(arg_3_0, arg_3_1)
		if LUI.IsLastInputKeyboardMouse(arg_3_1.controllerIndex) then
			ACTIONS.AnimateSequence(arg_3_0, "HideBacker")
		else
			ACTIONS.AnimateSequence(arg_3_0, "ShowBacker")
		end
	end

	arg_2_0:registerAndCallEventHandler("update_input_type", var_2_0, {
		controllerIndex = arg_2_1
	})

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function PromptButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 40 * _1080p)

	var_4_0.id = "PromptButton"
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

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.BattlePass.Locked, 0)
	var_4_4:SetAlpha(0.3, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 300, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "TextureLayer"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_6:SetAlpha(0.1, 0)
	var_4_6:SetPixelGridEnabled(true)
	var_4_6:SetPixelGridContrast(0.8, 0)
	var_4_6:SetPixelGridBlockWidth(2, 0)
	var_4_6:SetPixelGridBlockHeight(2, 0)
	var_4_6:SetPixelGridGutterWidth(1, 0)
	var_4_6:SetPixelGridGutterHeight(1, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 300, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.TextureLayer = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "Prompt"

	var_4_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_8:setText("i am prompt", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetTintFontIcons(true)
	var_4_8:SetShadowRGBFromInt(0, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 20, _1080p * 293, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_8)

	var_4_0.Prompt = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
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

	var_4_8:RegisterAnimationSequence("AR", var_4_10)

	local function var_4_11()
		var_4_8:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_11

	local var_4_12 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("HideBacker", var_4_12)

	local var_4_13 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HideBacker", var_4_13)

	local var_4_14 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_4_8:RegisterAnimationSequence("HideBacker", var_4_14)

	local function var_4_15()
		var_4_4:AnimateSequence("HideBacker")
		var_4_6:AnimateSequence("HideBacker")
		var_4_8:AnimateSequence("HideBacker")
	end

	var_4_0._sequences.HideBacker = var_4_15

	local var_4_16 = {
		{
			value = 0.3,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ShowBacker", var_4_16)

	local var_4_17 = {
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ShowBacker", var_4_17)

	local var_4_18 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		}
	}

	var_4_8:RegisterAnimationSequence("ShowBacker", var_4_18)

	local function var_4_19()
		var_4_4:AnimateSequence("ShowBacker")
		var_4_6:AnimateSequence("ShowBacker")
		var_4_8:AnimateSequence("ShowBacker")
	end

	var_4_0._sequences.ShowBacker = var_4_19

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("PromptButton", PromptButton)
LockTable(_M)
