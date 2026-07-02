LUI.UITimer = LUI.Class(LUI.UIElement)

local function var_0_0(arg_1_0)
	assert(arg_1_0)

	if not arg_1_0 then
		return
	end

	local var_1_0 = arg_1_0.eventTarget or arg_1_0:getParent()

	if var_1_0 then
		local var_1_1 = arg_1_0.timerEvent

		profile.beginuserevent(arg_1_0.profileID)
		var_1_0:processEvent(var_1_1)
		profile.enduserevent(arg_1_0.profileID)
	elseif Engine.BHICADFIHA() then
		assert(arg_1_0.timerEvent)
		DebugPrint("'" .. arg_1_0.id .. "' missing eventTarget for event: " .. arg_1_0.timerEvent.name)
	end

	if arg_1_0.disposable or not var_1_0 then
		arg_1_0:closeTree()
	end
end

function LUI.UITimer.build(arg_2_0, arg_2_1)
	assert(arg_2_1.interval, "No property for interval set for timer")
	assert(arg_2_1.event, "No property for event set for timer")

	return LUI.UITimer.new(arg_2_1)
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0.interval = arg_3_1
end

function LUI.UITimer.init(arg_4_0, arg_4_1)
	arg_4_1 = arg_4_1 or {}

	LUI.UITimer.super.init(arg_4_0)

	arg_4_0.id = "LUITimer"
	arg_4_0.interval = arg_4_1.interval
	arg_4_0.SetInterval = var_0_1
	arg_4_0.disposable = arg_4_1.disposable
	arg_4_0.eventTarget = arg_4_1.eventTarget

	if type(arg_4_1.event) == "table" then
		arg_4_0.timerEvent = arg_4_1.event
	else
		arg_4_0.timerEvent = {
			name = tostring(arg_4_1.event)
		}
	end

	arg_4_0.interval = math.max(1, arg_4_0.interval)

	arg_4_0:SetIgnoreTweenLateness(true)

	local var_4_0

	local function var_4_1()
		arg_4_0.wait = arg_4_0:Wait(arg_4_0.interval)

		function arg_4_0.wait.onComplete()
			var_0_0(arg_4_0)
			var_4_1()
		end
	end

	var_4_1()
end
