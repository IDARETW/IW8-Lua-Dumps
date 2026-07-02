require("ui.LUITimer")

LUI.UIButtonRepeater = LUI.Class(LUI.UIElement)
LUI.UIButtonRepeater.firstDelay = 420
LUI.UIButtonRepeater.delay = 210
LUI.UIButtonRepeater.delayReduction = 25
LUI.UIButtonRepeater.accelInterval = 100
LUI.UIButtonRepeater.minDelay = 33

function LUI.UIButtonRepeater.init(arg_1_0, arg_1_1)
	LUI.UIElement.init(arg_1_0)

	arg_1_0.id = "LUIButtonRepeater"

	arg_1_0:setPriority(-1000)

	arg_1_1 = arg_1_1 or {}
	arg_1_0.buttonName = arg_1_1.buttonName

	if type(arg_1_1.event) == "string" then
		arg_1_0.event = {
			buttonRepeat = true,
			name = arg_1_1.event
		}
	else
		arg_1_1.event.buttonRepeat = true
		arg_1_0.event = arg_1_1.event
	end

	arg_1_0.eventTarget = arg_1_1.eventTarget

	if Engine.EABCCIBFIG() then
		arg_1_0:addEventHandler("leftmousedown", LUI.UIButtonRepeater.LeftMouseDown)
		arg_1_0:addEventHandler("leftmouseup", LUI.UIButtonRepeater.LeftMouseUp)
		arg_1_0:SetHandleMouseButton(true)
	end

	arg_1_0:registerEventHandler("repeat", LUI.UIButtonRepeater.Repeat)
	arg_1_0:registerEventHandler("accelerate", LUI.UIButtonRepeater.Accelerate)
	arg_1_0:registerEventHandler("gamepad_button", LUI.UIButtonRepeater.GamepadButton)
end

function LUI.UIButtonRepeater.enable(arg_2_0)
	arg_2_0.m_disabled = false
end

function LUI.UIButtonRepeater.disable(arg_3_0)
	arg_3_0.m_disabled = true

	arg_3_0:cancelRepetition()
end

function LUI.UIButtonRepeater.setMinDelay(arg_4_0, arg_4_1)
	arg_4_0.minDelay = math.max(1, arg_4_1)
end

function LUI.UIButtonRepeater.LeftMouseDown(arg_5_0, arg_5_1)
	if arg_5_0.buttonName == "leftmouse" and not arg_5_1.buttonRepeat then
		arg_5_0:cancelRepetition()

		if arg_5_0.m_disabled then
			return false
		end

		arg_5_0.controller = arg_5_1.controller

		local var_5_0 = LUI.UITimer.new({
			interval = arg_5_0.firstDelay,
			event = {
				numRepeats = 1,
				name = "repeat"
			}
		})

		arg_5_0:addElement(var_5_0)

		arg_5_0.repeatTimer = var_5_0
	end
end

function LUI.UIButtonRepeater.LeftMouseUp(arg_6_0, arg_6_1)
	if arg_6_0.buttonName == "leftmouse" and not arg_6_1.buttonRepeat then
		arg_6_0:cancelRepetition()
	end
end

function LUI.UIButtonRepeater.GamepadButton(arg_7_0, arg_7_1)
	if arg_7_1.button == arg_7_0.buttonName and not arg_7_1.buttonRepeat then
		arg_7_0:cancelRepetition()

		if arg_7_0.m_disabled then
			return false
		end

		if arg_7_1.down == true then
			arg_7_0.controller = arg_7_1.controller

			local var_7_0 = LUI.UITimer.new({
				interval = arg_7_0.firstDelay,
				event = {
					numRepeats = 1,
					name = "repeat"
				}
			})

			arg_7_0:addElement(var_7_0)

			arg_7_0.repeatTimer = var_7_0
		end
	end
end

function LUI.UIButtonRepeater.cancelRepetition(arg_8_0)
	local var_8_0 = arg_8_0.repeatTimer

	if var_8_0 ~= nil then
		var_8_0:closeTree()

		arg_8_0.repeatTimer = nil
	end

	local var_8_1 = arg_8_0.accelTimer

	if var_8_1 ~= nil then
		var_8_1:closeTree()

		arg_8_0.accelTimer = nil
	end

	arg_8_0.currentDelay = nil
end

function LUI.UIButtonRepeater.sendButtonRepeat(arg_9_0)
	local var_9_0 = arg_9_0.eventTarget

	if var_9_0 == nil then
		var_9_0 = arg_9_0:getParent()
	end

	local var_9_1 = arg_9_0.event

	var_9_1.controller = arg_9_0.controller

	return var_9_0:processEvent(var_9_1)
end

function LUI.UIButtonRepeater.Repeat(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0.repeatTimer
	local var_10_1 = arg_10_1.numRepeats

	if arg_10_0.currentDelay == nil then
		var_10_0.interval = arg_10_0.delay

		if arg_10_0.accelTimer == nil then
			local var_10_2 = LUI.UITimer.new({
				event = "accelerate",
				interval = arg_10_0.accelInterval
			})

			var_10_2.id = "accelTimer"

			arg_10_0:addElement(var_10_2)

			arg_10_0.accelTimer = var_10_2
		end
	else
		var_10_0.interval = arg_10_0.currentDelay
	end

	arg_10_0:sendButtonRepeat()

	arg_10_1.numRepeats = var_10_1 + 1
end

function LUI.UIButtonRepeater.Accelerate(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.currentDelay

	if var_11_0 == nil then
		var_11_0 = arg_11_0.delay
	else
		var_11_0 = var_11_0 - arg_11_0.delayReduction

		if var_11_0 < arg_11_0.minDelay then
			var_11_0 = arg_11_0.minDelay
		end
	end

	arg_11_0.currentDelay = var_11_0
end
