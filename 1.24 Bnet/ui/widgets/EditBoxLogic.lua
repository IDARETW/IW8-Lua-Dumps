function LUI.AddEditBoxLogic(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.alignment)
	assert(arg_1_2.font)
	assert(arg_1_2.focusType)
	assert(arg_1_2.defaultValue)
	assert(arg_1_2.textSelectionColor)

	local var_1_0 = arg_1_2.maxInputStringLength or 255
	local var_1_1 = arg_1_2.disableAfterEdit or true
	local var_1_2 = arg_1_2.useAutoAlign or false
	local var_1_3 = arg_1_2.isNumeric or false
	local var_1_4 = arg_1_2.isNumericEmpty or false

	if not arg_1_2.focusable then
		local var_1_5 = true
	end

	local var_1_6 = arg_1_2.isPassword or false
	local var_1_7 = arg_1_2.isEmail or false
	local var_1_8 = arg_1_2.autoConfirmOnTab or false
	local var_1_9 = arg_1_2.autoConfirmOnOutsideClick or false
	local var_1_10 = arg_1_2.autoSelectAllOnActive or false
	local var_1_11 = arg_1_2.name or tostring(arg_1_2.defaultValue)
	local var_1_12 = arg_1_2.min or 0
	local var_1_13 = arg_1_2.max or 1
	local var_1_14 = CoD.KeyboardInputTypes.Normal

	if var_1_6 then
		var_1_14 = CoD.KeyboardInputTypes.Password
	elseif var_1_7 then
		var_1_14 = CoD.KeyboardInputTypes.Email
	elseif var_1_4 then
		var_1_14 = CoD.KeyboardInputTypes.NumberEmpty
	elseif var_1_3 then
		var_1_14 = CoD.KeyboardInputTypes.Number
	end

	arg_1_0:setText("")

	arg_1_0._textEditingActive = false
	arg_1_0._firstInteraction = true
	arg_1_0.isDefault = true
	arg_1_0.TextEditOff = (function(arg_2_0)
		return function()
			if arg_2_0._textEditingActive then
				arg_2_0.textEdit:setTextEditActive(false)

				arg_2_0._textEditingActive = false

				if arg_2_0.textEdit:getText() == "" then
					arg_2_0.isDefault = true
					arg_2_0._firstInteraction = true

					arg_2_0.textEdit:setTextEditText(arg_1_2.defaultValue)

					if var_1_6 then
						arg_2_0.textEdit:setShowPassword(true)
					end
				end
			end
		end
	end)(arg_1_0)
	arg_1_0._requireFocusType = arg_1_2.focusType

	local var_1_15 = {
		controllerIndex = arg_1_1,
		maxLength = var_1_0,
		useAutoAlign = var_1_2,
		disableAfterEdit = var_1_1,
		isNumeric = var_1_3,
		isPassword = var_1_6,
		autoConfirmOnTab = var_1_8,
		autoConfirmOnOutsideClick = var_1_9,
		autoSelectAllOnActive = var_1_10
	}
	local var_1_16 = MenuBuilder.BuildRegisteredType("UITextEdit", var_1_15)

	var_1_16:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	var_1_16.id = "textEdit"
	arg_1_0.textEdit = var_1_16

	arg_1_0:addElement(var_1_16)
	arg_1_0.textEdit:SetFont(arg_1_2.font)
	arg_1_0.textEdit:SetAlignment(arg_1_2.alignment)
	arg_1_0.textEdit:setTextSelectionHighlightColor(arg_1_2.textSelectionColor.r, arg_1_2.textSelectionColor.g, arg_1_2.textSelectionColor.b, arg_1_2.textSelectionColor.a)
	arg_1_0.textEdit:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		arg_4_0:setTextEditText(arg_1_2.defaultValue)
	end)

	function arg_1_0.SetButtonActionCallbackFunc(arg_5_0, arg_5_1)
		arg_5_0._buttonActionCallbackFunc = arg_5_1
	end

	function arg_1_0.SetIsTypingCallbackFunc(arg_6_0, arg_6_1)
		arg_6_0._isTypingCallbackFunc = arg_6_1
	end

	function arg_1_0.SetTextEditCompleteCallbackFunc(arg_7_0, arg_7_1)
		arg_7_0._textEditCompleteCallbackFunc = arg_7_1
	end

	arg_1_0:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		if not arg_8_0._textEditingActive then
			local var_8_0 = arg_8_0.textEdit:getText()

			if var_1_6 then
				var_8_0 = ""
			end

			if arg_1_0._firstInteraction then
				if not var_1_3 then
					var_8_0 = ""
				end

				arg_1_0._firstInteraction = false
			end

			if Engine.HDGDBCJFG() and LUI.IsLastInputGamepad(arg_8_1.controller) then
				local var_8_1 = Engine.DBFFAEEFGJ()

				LUI.UIRoot.BlockButtonInput(var_8_1, true)
				OSK.CBJGJDGFC(arg_8_1.controller, var_1_11, var_8_0, var_1_15.maxLength, false, false, true, function(arg_9_0, arg_9_1, arg_9_2)
					LUI.UIRoot.BlockButtonInput(var_8_1, false)

					arg_8_0.isDefault = arg_9_1 == "" or arg_9_1 == nil and var_8_0 == ""

					if var_1_3 then
						if tonumber(arg_9_1) ~= nil then
							arg_9_1 = tostring(LUI.clamp(tonumber(arg_9_1), var_1_12, var_1_13))
						else
							arg_9_1 = var_8_0
						end
					end

					if arg_8_0.isDefault then
						arg_9_1 = arg_1_2.defaultValue
						arg_1_0._firstInteraction = true
					else
						arg_9_1 = arg_9_1 and arg_9_1 or var_8_0
					end

					if arg_8_0._textEditCompleteCallbackFunc then
						arg_8_1.text = arg_9_1
						arg_8_1.isDefault = arg_8_0.isDefault

						arg_8_0._textEditCompleteCallbackFunc(arg_8_0, arg_8_1)
					end

					arg_8_0.textEdit:setTextEditText(arg_9_1)

					if var_1_6 then
						arg_8_0.textEdit:setShowPassword(arg_8_0.isDefault)
					end

					arg_8_0._textEditingActive = false
				end, var_1_14)
			else
				arg_8_0.textEdit:setTextEditActive()
			end

			arg_8_0._textEditingActive = true

			if arg_8_0._buttonActionCallbackFunc then
				arg_8_0._buttonActionCallbackFunc()
			end

			return true
		end
	end)
	arg_1_0:addEventHandler("text_edit_complete", function(arg_10_0, arg_10_1)
		if arg_10_0._textEditingActive and arg_10_1.active then
			arg_10_0:TextEditOff()

			if arg_10_0._textEditCompleteCallbackFunc then
				arg_10_1.text = arg_10_0.textEdit:getText()
				arg_10_1.isDefault = arg_10_0.isDefault

				arg_10_0._textEditCompleteCallbackFunc(arg_10_0, arg_10_1)
			end
		end
	end)
	arg_1_0:addEventHandler("text_edit_is_typing", function(arg_11_0, arg_11_1)
		if arg_11_0._textEditingActive then
			arg_11_0.isDefault = false

			if arg_11_0._isTypingCallbackFunc then
				arg_11_0._isTypingCallbackFunc(arg_11_1.isTyping)
			end
		end
	end)
end
