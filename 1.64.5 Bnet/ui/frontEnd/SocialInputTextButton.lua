module(..., package.seeall)

local function var_0_0(arg_1_0)
	return function()
		if arg_1_0._textEditingActive then
			arg_1_0.textEdit:setDisableAfterEdit(true)
			arg_1_0.textEdit:setTextEditActive(false)

			arg_1_0._textEditingActive = false

			arg_1_0.HintText:SetAlpha(1)
		end
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._textEditingActive = false
	arg_3_0._firstInteraction = true
	arg_3_0.m_requireFocusType = FocusType.MouseOver

	arg_3_0:SetFocusable(true)

	local var_3_0 = 256
	local var_3_1 = false
	local var_3_2 = Engine.CBBHFCGDIC("MENU/CHAT_DEFAULT")
	local var_3_3 = CoD.TextSettings.SmallFont.Font

	arg_3_0.TextEditOff = var_0_0(arg_3_0)

	arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		if not arg_4_0._textEditingActive then
			arg_4_0.textEdit:setDisableAfterEdit(false)
			arg_4_0.textEdit:setTextEditActive()

			arg_4_0._textEditingActive = true

			arg_4_0.HintText:SetAlpha(0)

			if arg_4_0._firstInteraction then
				arg_4_0.textEdit:setTextEditText("")

				arg_4_0._firstInteraction = false
			end

			if arg_4_0.buttonActionCallbackFunc then
				arg_4_0.buttonActionCallbackFunc()
			end
		end
	end)
	arg_3_0:addEventHandler("text_edit_complete", function(arg_5_0, arg_5_1)
		if arg_5_0._textEditingActive and arg_5_1.active then
			if arg_5_1.switchTextEditField then
				arg_5_0:TextEditOff()
			else
				local var_5_0 = arg_5_1.text or ""

				if arg_5_0.textEditCompleteCallbackFunc then
					arg_5_0.textEditCompleteCallbackFunc(arg_5_1.cancelled, var_5_0)
				end

				if not arg_5_1.cancelled then
					arg_5_0.textEdit:setTextEditText("")
				end
			end
		end
	end)
	arg_3_0:addEventHandler("text_edit_is_typing", function(arg_6_0, arg_6_1)
		arg_6_0._commandsModeActive = arg_6_1.isKeyForwardSlash

		if arg_6_0._textEditingActive and arg_6_0.isTypingCallbackFunc then
			arg_6_0.isTypingCallbackFunc(arg_6_1.isTyping)
		end
	end)

	local var_3_4 = {
		useAutoAlign = true,
		controllerIndex = arg_3_1,
		maxLength = var_3_0,
		disableAfterEdit = var_3_1
	}
	local var_3_5 = MenuBuilder.BuildRegisteredType("UITextEdit", var_3_4)

	var_3_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 21 * _1080p)

	var_3_5.id = "textEdit"

	var_3_5:SetFont(var_3_3)
	var_3_5:SetAlignment(LUI.Alignment.Left)
	var_3_5:addEventHandler("menu_create", function(arg_7_0, arg_7_1)
		arg_7_0:setTextEditText(var_3_2)
	end)

	arg_3_0.textEdit = var_3_5

	arg_3_0:addElement(var_3_5)
	arg_3_0:SetAsEditBoxHandler(true)
end

function SocialInputTextButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 27 * _1080p)

	var_8_0.id = "SocialInputTextButton"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "BGImage"

	var_8_4:SetRGBFromInt(5001800, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.BGImage = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "HintText"

	var_8_6:setText(Engine.CBBHFCGDIC("MENU/PRESS_ENTER_TO_CHAT"), 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -1)
	var_8_0:addElement(var_8_6)

	var_8_0.HintText = var_8_6

	var_8_4:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_8_1
		end

		ACTIONS.SetAlpha(var_8_0, 0.8, 0, 0)
	end)
	var_8_4:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_8_1
		end

		ACTIONS.SetAlpha(var_8_0, 0.6, 0, 0)
	end)
	var_8_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_8_1
		end

		ACTIONS.SetAlpha(var_8_0, 0.6, 0, 0)
	end)
	var_8_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_8_1
		end

		ACTIONS.SetAlpha(var_8_0, 0.4, 0, 0)
	end)
	var_0_1(var_8_0, var_8_1, arg_8_1)
	ACTIONS.SetAlpha(var_8_0, 0.4, 0, 0)

	return var_8_0
end

MenuBuilder.registerType("SocialInputTextButton", SocialInputTextButton)
LockTable(_M)
