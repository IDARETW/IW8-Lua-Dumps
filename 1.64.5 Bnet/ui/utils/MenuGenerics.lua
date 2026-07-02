module(..., package.seeall)

if Engine.DDJFBBJAIG() or Engine.CAADCDEEIA() then
	function GenericInputField(arg_1_0, arg_1_1)
		local var_1_0 = LUI.UIButton.new()

		var_1_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 27 * _1080p)

		var_1_0.id = "inputFieldButton"

		var_1_0:SetAlpha(0.4)
		var_1_0:SetFocusable(true)

		var_1_0._isTextEditBox = true
		var_1_0.properties = {
			active = false,
			inputText = arg_1_1.inputText or "Placeholder Input Text",
			passwordField = arg_1_1.passwordField or false,
			fieldEditedFunc = arg_1_1.fieldEditedFunc,
			textAlignment = LUI.Alignment.Left
		}

		var_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
			arg_2_0:SetAlpha(0.6)
		end)
		var_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
			arg_3_0:SetAlpha(0.4)
		end)
		var_1_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			if not arg_4_0.properties.active then
				arg_4_0.textEdit:setTextEditActive()

				arg_4_0.properties.active = true
			end
		end)
		var_1_0:addEventHandler("text_edit_complete", function(arg_5_0, arg_5_1)
			if arg_5_0.properties.active then
				arg_5_0.properties.fieldEditedFunc(arg_5_0, arg_5_1)
			end
		end)

		local var_1_1 = {
			controllerIndex = arg_1_1.controllerIndex,
			maxLength = arg_1_1.maxLength
		}
		local var_1_2 = MenuBuilder.BuildRegisteredType("UITextEdit", var_1_1)

		var_1_2:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 21 * _1080p)

		var_1_2.id = "textEdit"

		var_1_2:SetFont(CoD.TextSettings.SmallFont.Font)
		var_1_2:SetAlignment(var_1_0.properties.textAlignment)
		var_1_2:setDisableAfterEdit(true)
		var_1_2:addEventHandler("menu_create", function(arg_6_0, arg_6_1)
			local var_6_0 = var_1_0.properties.inputText

			arg_6_0:setTextEditText(var_1_0.properties.passwordField and string.rep("*", #var_6_0) or var_6_0)
		end)

		var_1_0.textEdit = var_1_2

		var_1_0:addElement(var_1_2)
		var_1_0:SetAsEditBoxHandler(true)

		local var_1_3 = LUI.UIImage.new()

		var_1_3.id = "BGImage"

		var_1_3:SetRGBFromInt(5001800, 0)

		var_1_0.BGImage = var_1_3

		var_1_0:addElement(var_1_3)

		return var_1_0
	end
end

function generic_back_button()
	local var_7_0 = LUI.UIBindButton.new()

	var_7_0.id = "generic_back_button"

	var_7_0:registerEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		LUI.FlowManager.RequestLeaveMenu(arg_8_0)

		return true
	end)

	return var_7_0
end

function generic_confirmation_popup(arg_9_0, arg_9_1)
	local var_9_0 = {
		title = arg_9_1.popup_title or "",
		message = arg_9_1.message_text or "",
		action = function(arg_10_0, arg_10_1)
			if arg_9_1.confirmation_action then
				arg_9_1.confirmation_action(arg_10_0, {
					controller = arg_10_1
				})
			end
		end,
		label = arg_9_1.button_text,
		countdownEvent = arg_9_1.countdownEvent,
		countdownStartTime = arg_9_1.countdownStartTime,
		noBackButton = arg_9_1.noBackButton
	}

	return (MenuBuilder.BuildRegisteredType("PopupOK", var_9_0))
end

function generic_yesno_popup(arg_11_0, arg_11_1)
	local var_11_0 = {
		title = arg_11_1.popup_title or "",
		message = arg_11_1.message_text or "",
		yesAction = function(arg_12_0, arg_12_1)
			if arg_11_1.yes_action then
				arg_11_1.yes_action(arg_12_0, {
					controller = arg_12_1
				})
			end
		end,
		noAction = function(arg_13_0, arg_13_1)
			if arg_11_1.no_action then
				arg_11_1.no_action(arg_13_0, {
					controller = arg_13_1
				})
			end
		end,
		yesLabel = arg_11_1.yes_text,
		noLabel = arg_11_1.no_text,
		defaultFocusIndex = arg_11_1.defaultFocusIndex,
		blockBackground = arg_11_1.blockBackground
	}

	return (MenuBuilder.BuildRegisteredType("PopupYesNo", var_11_0))
end

if Engine.DDJFBBJAIG() or Engine.CAADCDEEIA() then
	MenuBuilder.registerType("GenericInputField", GenericInputField)
end

MenuBuilder.registerType("generic_back_button", generic_back_button)
MenuBuilder.registerType("generic_confirmation_popup", generic_confirmation_popup)
MenuBuilder.registerType("generic_yesno_popup", generic_yesno_popup)
LockTable(_M)
