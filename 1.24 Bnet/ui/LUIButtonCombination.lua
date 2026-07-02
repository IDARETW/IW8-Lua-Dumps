LUI.UIButtonCombination = LUI.Class(LUI.UIElement)

function LUI.UIButtonCombination.init(arg_1_0, arg_1_1)
	LUI.UIElement.init(arg_1_0)

	arg_1_0.id = "ButtonCombination"

	assert(arg_1_1)
	assert(type(arg_1_1.buttonTable == "table"))
	assert(type(arg_1_1.interval == "number"))
	assert(type(arg_1_1.callback == "function"))
	assert(#arg_1_1.buttonTable ~= 1, "Only one button in buttonTable. UIBindButton should be used for handling of a single button press.")
	assert(#arg_1_1.buttonTable > 0, "Not enough buttons in buttonTable.")
	assert(not arg_1_1.closeOnSuccess or type(arg_1_1.closeOnSuccess == "boolean"))

	arg_1_0._buttonTable = arg_1_1.buttonTable
	arg_1_0._interval = arg_1_1.interval
	arg_1_0._callback = arg_1_1.callback
	arg_1_0._closeOnSuccess = arg_1_1.closeOnSuccess or false

	arg_1_0:Reset()
	arg_1_0:addEventHandler("gamepad_button", LUI.UIButtonCombination.HandleButtonPress)
end

function LUI.UIButtonCombination.Reset(arg_2_0)
	arg_2_0._currentButtonIndex = 0
	arg_2_0._lastButtonPressTime = 0
end

function LUI.UIButtonCombination.HandleButtonPress(arg_3_0, arg_3_1)
	if arg_3_1.down then
		return
	end

	arg_3_0._currentButtonIndex = arg_3_0._currentButtonIndex + 1

	if arg_3_0._buttonTable[arg_3_0._currentButtonIndex] == arg_3_1.button then
		local var_3_0 = Engine.BFBIDEGDFB()

		if arg_3_0._currentButtonIndex == 1 then
			arg_3_0._lastButtonPressTime = var_3_0
		elseif var_3_0 - arg_3_0._lastButtonPressTime <= arg_3_0._interval then
			arg_3_0._lastButtonPressTime = var_3_0

			if arg_3_0._currentButtonIndex == #arg_3_0._buttonTable then
				arg_3_0._callback(arg_3_0, arg_3_1.controller)
				arg_3_0:Reset()

				if arg_3_0._closeOnSuccess then
					arg_3_0:closeTree()
				end
			end
		else
			arg_3_0:Reset()
		end
	else
		arg_3_0:Reset()
	end
end
