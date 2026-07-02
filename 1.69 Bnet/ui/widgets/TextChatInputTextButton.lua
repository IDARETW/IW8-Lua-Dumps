module(..., package.seeall)

local function var_0_0(arg_1_0)
	return function()
		if arg_1_0._textEditingActive then
			arg_1_0.textEdit:setDisableAfterEdit(true)
			arg_1_0.textEdit:setTextEditActive(false)

			arg_1_0._textEditingActive = false

			arg_1_0.HintText:SetAlpha(0.6)
			arg_1_0.textEdit:SetAlpha(0)

			if arg_1_0.textZoneActiveChangeCallback then
				arg_1_0.textZoneActiveChangeCallback(arg_1_0, false)
			end
		end
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._textEditingActive = false
	arg_3_0._firstInteraction = true
	arg_3_0._chatController = arg_3_1
	arg_3_0.m_requireFocusType = FocusType.MouseOver

	arg_3_0:SetFocusable(true)

	local var_3_0 = 150
	local var_3_1 = false
	local var_3_2 = Engine.CBBHFCGDIC("MENU/CHAT_DEFAULT")
	local var_3_3 = CoD.TextSettings.ChatInputFont
	local var_3_4 = 1

	arg_3_0.TextEditOff = var_0_0(arg_3_0)
	arg_3_0.topMenuStates = {}

	function arg_3_0.ReturnFocusToMenu(arg_4_0)
		if not LUI.IsLastInputKeyboardMouse(arg_4_0._chatController) then
			local var_4_0 = LUI.FlowManager.GetVisibleMenu()

			if var_4_0 and arg_4_0.topMenuStates[var_4_0.id] then
				local var_4_1, var_4_2 = var_4_0:restoreState(arg_4_0.topMenuStates[var_4_0.id], arg_4_0._chatController)

				if not var_4_1 or var_4_2 == 0 then
					var_4_0:processEvent({
						name = "gain_focus",
						controller = arg_4_0._chatController,
						focusType = FocusType.MenuFlow
					})
				end

				arg_4_0.topMenuStates[var_4_0.id] = nil
			end
		end
	end

	function arg_3_0.TryStartEditing(arg_5_0, arg_5_1)
		if not arg_5_0._textEditingActive then
			arg_5_0.textEdit:setDisableAfterEdit(false)
			arg_5_0.textEdit:SetAlpha(1)

			arg_5_0._textEditingActive = true

			if LUI.ScoreboardLayer then
				local var_5_0 = LUI.ScoreboardLayer:GetInstance()

				if var_5_0 then
					var_5_0:processEvent({
						down = false,
						name = "togglescores",
						hold = true
					})
				end
			end

			local var_5_1 = LUI.FlowManager.GetVisibleMenu()

			if var_5_1 then
				if arg_5_0.topMenuStates[var_5_1.id] == nil then
					arg_5_0.topMenuStates[var_5_1.id] = var_5_1:saveState()
				end

				if LUI.IsLastInputGamepad(arg_5_1.controller) then
					var_5_1:processEvent({
						name = "lose_focus"
					})
					var_5_1:processEvent({
						dispatchChildren = true,
						name = "popup_active"
					})
				end
			end

			local var_5_2 = arg_5_0.textEdit:setTextEditActive()

			arg_5_0.HintText:SetAlpha(var_5_2 and 0 or 0.6)

			if arg_5_0.textZoneActiveChangeCallback then
				arg_5_0.textZoneActiveChangeCallback(arg_5_0, true)
			end

			if arg_5_0._firstInteraction then
				arg_5_0.textEdit:setTextEditText("")

				arg_5_0._firstInteraction = false
			end

			if arg_5_0.buttonActionCallbackFunc then
				arg_5_0.buttonActionCallbackFunc()
			end

			return true
		end
	end

	function arg_3_0.openVirtualKeyboard(arg_6_0, arg_6_1)
		OSK.CBJGJDGFC(arg_6_1.controller, "Chat", "", var_3_0, false, false, true, function(arg_7_0, arg_7_1, arg_7_2)
			if arg_6_0.textEditCompleteCallbackFunc then
				arg_7_1 = arg_7_1 or ""

				arg_6_0.textEditCompleteCallbackFunc(false, arg_7_1, true)
			end

			arg_6_0:TextEditOff()
		end, CoD.KeyboardInputTypes.Normal)
		arg_6_0.HintText:SetAlpha(0)

		arg_6_0._textEditingActive = true
	end

	arg_3_0:addEventHandler("text_edit_complete", function(arg_8_0, arg_8_1)
		if arg_8_0._textEditingActive and arg_8_1.active then
			if arg_8_1.switchTextEditField then
				arg_8_0:TextEditOff()
			else
				local var_8_0 = arg_8_1.text or ""

				if arg_8_0.textEditCompleteCallbackFunc then
					arg_8_0.textEditCompleteCallbackFunc(arg_8_1.cancelled, var_8_0, false)
				else
					arg_8_0.textEdit:setTextEditText("")
				end
			end
		end
	end)
	arg_3_0:addEventHandler("text_edit_is_typing", function(arg_9_0, arg_9_1)
		arg_9_0._commandsModeActive = arg_9_1.isKeyForwardSlash

		if arg_9_0._textEditingActive and arg_9_0.isTypingCallbackFunc then
			arg_9_0.isTypingCallbackFunc(arg_9_1.isTyping, arg_9_1.text)
		end

		if arg_9_1.isTyping then
			arg_9_0.HintText:SetAlpha(0)
		else
			arg_9_0.HintText:SetAlpha(0.6)
		end
	end)

	local var_3_5 = {
		alwaysSendTypingEvents = true,
		wantTabButtonEvent = true,
		useAutoAlign = true,
		letGamepadInputsGoThrough = true,
		controllerIndex = arg_3_1,
		maxLength = var_3_0,
		disableAfterEdit = var_3_1
	}
	local var_3_6 = MenuBuilder.BuildRegisteredType("UITextEdit", var_3_5)

	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, var_3_4, var_3_3.Height * _1080p + var_3_4)

	var_3_6.id = "textEdit"

	var_3_6:SetFont(var_3_3.Font)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAlpha(1)
	var_3_6:addEventHandler("menu_create", function(arg_10_0, arg_10_1)
		arg_10_0:setTextEditText(var_3_2)
	end)

	arg_3_0.textEdit = var_3_6

	arg_3_0:addElement(var_3_6)
	arg_3_0:SetAsEditBoxHandler(true)
	arg_3_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_0._textEditingActive then
			ACTIONS.AnimateSequence(arg_11_0, "HintTextFocused")
		end

		return true
	end)
	arg_3_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_0._textEditingActive then
			ACTIONS.AnimateSequence(arg_12_0, "HintTextDefault")
		end

		return true
	end)

	function arg_3_0.UpdateInputHintText(arg_13_0, arg_13_1)
		local var_13_0 = ""

		if Engine.CBCJDCHCCD(arg_13_1.controllerIndex) == LUI.INPUT_TYPE.gamepad then
			if Engine.CGABICJHAI() then
				var_13_0 = Engine.CBBHFCGDIC("MENU/CHAT_ZONE_TIPS_CONTROLLER_ON_PC")
			else
				var_13_0 = Engine.CBBHFCGDIC("MENU/CHAT_ZONE_TIPS_CONTROLLER_SINGLE_CHANNEL")
			end
		elseif LUI.TextChat.GetActiveChannelCount() > 1 then
			var_13_0 = Engine.CBBHFCGDIC("MENU/CHAT_ZONE_TIPS_KBM")
		else
			var_13_0 = Engine.JCBDICCAH("")
		end

		arg_13_0.HintText:setText(var_13_0, 0)
	end

	arg_3_0:registerEventHandler("update_input_type", arg_3_0.UpdateInputHintText)
	arg_3_0:UpdateInputHintText({
		controllerIndex = arg_3_1
	})
end

function TextChatInputTextButton(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 27 * _1080p)

	var_14_0.id = "TextChatInputTextButton"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIStyledText.new()

	var_14_4.id = "HintText"

	var_14_4:SetColorOp(COLOR_OP.saturation, 0)
	var_14_4:setText(Engine.CBBHFCGDIC("MENU/PRESS_ENTER_TO_CHAT"), 0)
	var_14_4:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_14_4:SetWordWrap(false)
	var_14_4:SetAlignment(LUI.Alignment.Left)
	var_14_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_4:SetStartupDelay(1000)
	var_14_4:SetLineHoldTime(400)
	var_14_4:SetAnimMoveTime(150)
	var_14_4:SetAnimMoveSpeed(50)
	var_14_4:SetEndDelay(1000)
	var_14_4:SetCrossfadeTime(400)
	var_14_4:SetFadeInTime(300)
	var_14_4:SetFadeOutTime(300)
	var_14_4:SetMaxVisibleLines(1)
	var_14_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * 10)
	var_14_0:addElement(var_14_4)

	var_14_0.HintText = var_14_4

	local var_14_5 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("DefaultSequence", var_14_5)

	local function var_14_6()
		var_14_4:AnimateSequence("DefaultSequence")
	end

	var_14_0._sequences.DefaultSequence = var_14_6

	local var_14_7 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.highlight.alienFrontEnd
		}
	}

	var_14_4:RegisterAnimationSequence("HintTextDefault", var_14_7)

	local function var_14_8()
		var_14_4:AnimateSequence("HintTextDefault")
	end

	var_14_0._sequences.HintTextDefault = var_14_8

	local var_14_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("HintTextFocused", var_14_9)

	local function var_14_10()
		var_14_4:AnimateSequence("HintTextFocused")
	end

	var_14_0._sequences.HintTextFocused = var_14_10

	var_0_1(var_14_0, var_14_1, arg_14_1)
	ACTIONS.AnimateSequence(var_14_0, "DefaultSequence")

	return var_14_0
end

MenuBuilder.registerType("TextChatInputTextButton", TextChatInputTextButton)
LockTable(_M)
