module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0._isFocused
end

local function var_0_1(arg_2_0)
	if arg_2_0._textEditingActive then
		arg_2_0.TextEdit:setTextEditActive(false)

		arg_2_0._textEditingActive = false

		if arg_2_0._textEraseOnEdit then
			arg_2_0.TextEdit:setTextEditText("")
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._defaultInputString = arg_3_1

	if arg_3_0.TextEdit then
		arg_3_0.TextEdit:setTextEditText(arg_3_0._defaultInputString)
	end
end

local function var_0_3(arg_4_0)
	arg_4_0._firstInteraction = false
end

local function var_0_4(arg_5_0)
	return arg_5_0._firstInteraction
end

local function var_0_5(arg_6_0)
	arg_6_0._firstInteraction = true
end

local function var_0_6(arg_7_0, arg_7_1)
	arg_7_0._textEraseOnEdit = arg_7_1
end

local function var_0_7(arg_8_0, arg_8_1)
	local var_8_0 = {
		autoConfirmOnTab = true,
		alwaysSendTypingEvents = true,
		disableAfterEdit = true,
		autoConfirmOnOutsideClick = true,
		useAutoAlign = true,
		controllerIndex = arg_8_0._controllerIndex,
		maxLength = arg_8_1._maxStringLength
	}
	local var_8_1 = MenuBuilder.BuildRegisteredType("UITextEdit", var_8_0)
	local var_8_2 = (IsLanguageArabic() and 30 or 22) / 2

	var_8_1:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 10 * _1080p, -10 * _1080p, -var_8_2 * _1080p, var_8_2 * _1080p)
	var_8_1:SetRGBFromTable(SWATCHES.genericButton.textDefault)

	var_8_1.id = "clanTextInput"

	var_8_1:SetFont(CoD.TextSettings.SmallFont.Font)
	var_8_1:SetAlignment(IsLanguageArabic() and LUI.Alignment.Right or LUI.Alignment.Left)
	var_8_1:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
		if not arg_8_1._skipDefaultInputString then
			arg_9_0:setTextEditText(arg_8_1._defaultInputString)
		end
	end)

	arg_8_0.TextEdit = var_8_1

	arg_8_0:addElement(var_8_1)
	arg_8_0:SetAsEditBoxHandler(true)
end

local function var_0_8(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._isFocused = false
	arg_10_0._textEditingActive = false
	arg_10_0._firstInteraction = true
	arg_10_0._textEraseOnEdit = false
	arg_10_0._defaultInputString = ""

	arg_10_0:SetFocusable(true)

	arg_10_0.SetTextEditOff = var_0_1
	arg_10_0.SetDefaultInputString = var_0_2
	arg_10_0.IsPastFirstInteraction = var_0_4
	arg_10_0.ResetFirstInteraction = var_0_5
	arg_10_0.SetTextEraseOnEdit = var_0_6
	arg_10_0.SetupTextEdit = var_0_7
	arg_10_0.ForceSetFirstInteractionFalse = var_0_3

	arg_10_0:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		if not arg_11_0._textEditingActive then
			arg_11_0.TextEdit:setTextEditActive(true)

			arg_11_0._textEditingActive = true

			if arg_11_0._firstInteraction then
				arg_11_0.TextEdit:setTextEditText("")

				arg_11_0._firstInteraction = false
			end

			if arg_11_0.buttonActionCallbackFunc then
				arg_11_0.buttonActionCallbackFunc()
			end
		end
	end)
	arg_10_0:addEventHandler("text_edit_complete", function(arg_12_0, arg_12_1)
		if arg_12_0._textEditingActive and arg_12_1.active then
			if arg_12_1.switchTextEditField then
				arg_12_0:SetTextEditOff()
			else
				local var_12_0 = arg_12_1.text or ""

				if arg_12_0.textEditCompleteCallbackFunc then
					arg_12_0:textEditCompleteCallbackFunc(arg_12_1.cancelled, var_12_0)
				end

				if not arg_12_1.cancelled then
					arg_12_0:SetTextEditOff()
				end
			end

			arg_12_0._textEditingActive = false
		end
	end)
	arg_10_0:addEventHandler("text_edit_isTyping", function(arg_13_0, arg_13_1)
		if arg_13_0.isTypingCallbackFunc then
			local var_13_0 = arg_13_1.text or ""

			arg_13_0.isTypingCallbackFunc(arg_13_1.isTyping, var_13_0)
		end
	end)
	arg_10_0:addAndCallEventHandler("gain_focus", function(arg_14_0, arg_14_1)
		ACTIONS.AnimateSequence(arg_10_0, "ButtonOver")

		arg_10_0._isFocused = true
	end)
	arg_10_0:addAndCallEventHandler("button_over", function(arg_15_0, arg_15_1)
		ACTIONS.AnimateSequence(arg_10_0, "ButtonOver")

		arg_10_0._isFocused = true
	end)
	arg_10_0:addAndCallEventHandler("lose_focus", function(arg_16_0, arg_16_1)
		ACTIONS.AnimateSequence(arg_10_0, "ButtonUp")

		arg_10_0._isFocused = false
	end)
	arg_10_0:addAndCallEventHandler("button_up", function(arg_17_0, arg_17_1)
		ACTIONS.AnimateSequence(arg_10_0, "ButtonUp")

		arg_10_0._isFocused = true
	end)
end

function ClanInput(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIButton.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 27 * _1080p)

	var_18_0.id = "ClanInput"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "ButtonGlow"

	var_18_4:SetAlpha(0, 0)
	var_18_4.Glow:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_18_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -10, _1080p * 14)
	var_18_0:addElement(var_18_4)

	var_18_0.ButtonGlow = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "Background"

	var_18_6:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_18_0:addElement(var_18_6)

	var_18_0.Background = var_18_6

	local var_18_7
	local var_18_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_18_9 = LUI.UIBorder.new(var_18_8)

	var_18_9.id = "TextFocus"

	var_18_9:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_18_0:addElement(var_18_9)

	var_18_0.TextFocus = var_18_9

	local var_18_10
	local var_18_11 = LUI.UIImage.new()

	var_18_11.id = "HighlightTop"

	var_18_11:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_18_11:SetAlpha(0, 0)
	var_18_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_18_0:addElement(var_18_11)

	var_18_0.HighlightTop = var_18_11

	local function var_18_12()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_12

	local var_18_13
	local var_18_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_4:RegisterAnimationSequence("ButtonOver", var_18_14)

	local var_18_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_11:RegisterAnimationSequence("ButtonOver", var_18_15)

	local function var_18_16()
		var_18_4:AnimateSequence("ButtonOver")
		var_18_11:AnimateSequence("ButtonOver")
	end

	var_18_0._sequences.ButtonOver = var_18_16

	local var_18_17
	local var_18_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_4:RegisterAnimationSequence("ButtonUp", var_18_18)

	local var_18_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_11:RegisterAnimationSequence("ButtonUp", var_18_19)

	local function var_18_20()
		var_18_4:AnimateSequence("ButtonUp")
		var_18_11:AnimateSequence("ButtonUp")
	end

	var_18_0._sequences.ButtonUp = var_18_20

	local var_18_21
	local var_18_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder,
			child = var_18_0.ButtonGlow.Glow
		}
	}

	var_18_4:RegisterAnimationSequence("Error", var_18_22)

	local var_18_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		}
	}

	var_18_9:RegisterAnimationSequence("Error", var_18_23)

	local var_18_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.disabledBorder
		}
	}

	var_18_11:RegisterAnimationSequence("Error", var_18_24)

	local function var_18_25()
		var_18_4:AnimateSequence("Error")
		var_18_9:AnimateSequence("Error")
		var_18_11:AnimateSequence("Error")
	end

	var_18_0._sequences.Error = var_18_25

	local var_18_26
	local var_18_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_18_0.ButtonGlow.Glow
		}
	}

	var_18_4:RegisterAnimationSequence("Valid", var_18_27)

	local var_18_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_18_9:RegisterAnimationSequence("Valid", var_18_28)

	local var_18_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_18_11:RegisterAnimationSequence("Valid", var_18_29)

	local function var_18_30()
		var_18_4:AnimateSequence("Valid")
		var_18_9:AnimateSequence("Valid")
		var_18_11:AnimateSequence("Valid")
	end

	var_18_0._sequences.Valid = var_18_30

	var_0_8(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("ClanInput", ClanInput)
LockTable(_M)
