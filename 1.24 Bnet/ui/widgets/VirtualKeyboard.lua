module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.exiting then
		return
	end

	arg_1_0.exiting = true

	arg_1_0.textEdit:setTextEditActive(false)

	arg_1_0.properties.active = false

	if OSK.IFIICDEDG then
		OSK.IFIICDEDG(arg_1_1.controller, arg_1_2, not arg_1_2 and arg_1_0.inputText or "")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.defaultText or ""
	local var_2_1 = arg_2_1.keyboardType or CoD.KeyboardInputTypes.Normal
	local var_2_2 = var_2_1 == CoD.KeyboardInputTypes.Email and 1000 or nil
	local var_2_3 = var_2_1 == CoD.KeyboardInputTypes.Password
	local var_2_4 = arg_2_1.controllerIndex
	local var_2_5 = {
		controllerIndex = var_2_4,
		title = arg_2_1.title,
		width = var_2_2,
		listContent = {}
	}
	local var_2_6 = {
		controllerIndex = var_2_4,
		passwordField = var_2_3,
		inputText = var_2_0,
		maxLength = arg_2_1.maxLength,
		fieldEditedFunc = function(arg_3_0, arg_3_1)
			arg_3_0.inputText = arg_3_1.text or ""

			if arg_3_0.exiting then
				return
			end

			arg_3_1.controller = var_2_4

			var_0_0(arg_3_0, arg_3_1, arg_3_1.cancelled)
			LUI.FlowManager.RequestLeaveMenu(arg_3_0)
		end
	}
	local var_2_7 = MenuBuilder.BuildRegisteredType("GenericInputField", var_2_6)

	var_2_7.id = "GenericInputField"
	var_2_7.m_requireFocusType = FocusType.MouseOver

	var_2_7.textEdit:setTextEditActive()

	var_2_7.properties.active = true

	table.insert(var_2_5.listContent, var_2_7)

	local var_2_8 = MenuBuilder.BuildRegisteredType("PopupButton", {
		controllerIndex = var_2_4
	})

	var_2_8:SetLeftAnchor(0)
	var_2_8:SetRightAnchor(0)
	var_2_8:SetLeft(0)
	var_2_8:SetRight(0)

	var_2_8.id = "okButton"

	assert(var_2_8.SetText)
	var_2_8:SetText(Engine.CBBHFCGDIC("MENU/OK"))
	var_2_8:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		var_0_0(var_2_7, arg_4_1, false)
		LUI.FlowManager.RequestLeaveMenu(arg_4_0)
	end)
	table.insert(var_2_5.listContent, var_2_8)

	local var_2_9 = MenuBuilder.BuildRegisteredType("PopupButton", {
		controllerIndex = var_2_4
	})

	var_2_9:SetLeftAnchor(0)
	var_2_9:SetRightAnchor(0)
	var_2_9:SetLeft(0)
	var_2_9:SetRight(0)

	var_2_9.id = "cancelButton"

	assert(var_2_9.SetText)
	var_2_9:SetText(Engine.CBBHFCGDIC("MENU/CANCEL"))
	var_2_9:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		var_0_0(var_2_7, arg_5_1, true)
		LUI.FlowManager.RequestLeaveMenu(arg_5_0)
	end)

	function var_2_5.cancelAction(arg_6_0, arg_6_1)
		local var_6_0 = {
			controller = arg_6_1
		}

		var_0_0(var_2_7, var_6_0, true)
		LUI.FlowManager.RequestLeaveMenu(var_2_7)
	end

	table.insert(var_2_5.listContent, var_2_9)

	local var_2_10 = MenuBuilder.BuildRegisteredType("PopupList", var_2_5)

	var_2_10:dispatchEventToRoot({
		immediate = true,
		name = "virtual_keyboard_popup_active"
	})
	var_2_10:addEventHandler("menu_close", function(arg_7_0, arg_7_1)
		var_0_0(var_2_7, arg_7_1, true)
	end)
	var_2_10:addEventHandler("menu_close_all", function(arg_8_0, arg_8_1)
		var_0_0(var_2_7, arg_8_1, true)
	end)

	return var_2_10
end

function virtual_keyboard(arg_9_0, arg_9_1)
	return var_0_1(arg_9_0, arg_9_1)
end

MenuBuilder.registerType("virtual_keyboard", virtual_keyboard)
LockTable(_M)
