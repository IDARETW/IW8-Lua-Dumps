module(..., package.seeall)

local var_0_0 = 5000
local var_0_1 = "_deletionTimerWidget"
local var_0_2 = "_allocatedWidget"

local function var_0_3(arg_1_0)
	LUI.CleanupChildWidget({
		parent = arg_1_0,
		childName = var_0_1
	})
end

local function var_0_4(arg_2_0)
	LUI.CleanupChildWidget({
		parent = arg_2_0,
		childName = var_0_2
	})
end

local function var_0_5(arg_3_0)
	var_0_3(arg_3_0)
	var_0_4(arg_3_0)
end

local function var_0_6(arg_4_0)
	var_0_3(arg_4_0)

	arg_4_0[var_0_1] = LUI.UITimer.new({
		disposable = true,
		interval = arg_4_0._deletionTimerLength,
		event = {
			name = "delete_widget_and_timer"
		}
	})
	arg_4_0[var_0_1].id = var_0_1

	arg_4_0:addElement(arg_4_0[var_0_1])
	arg_4_0:registerEventHandler("delete_widget_and_timer", function(arg_5_0, arg_5_1)
		var_0_5(arg_4_0)
	end)
end

local function var_0_7(arg_6_0, arg_6_1)
	LUI.AssertDescriptive({
		expectedType = "string",
		element = arg_6_1
	})
	assert(arg_6_1 ~= "", "Error: Empty-string 'widgetName' specified")
	var_0_3(arg_6_0)

	if not arg_6_0[var_0_2] or arg_6_0[var_0_2].id ~= arg_6_1 then
		var_0_4(arg_6_0)

		arg_6_0[var_0_2] = MenuBuilder.BuildRegisteredType(arg_6_1, {
			controllerIndex = arg_6_0._controllerIndex
		})
		arg_6_0[var_0_2].id = arg_6_1

		arg_6_0:addElement(arg_6_0[var_0_2])
		LAYOUT.SetElementAnchorAndPositionFromElementToElement({
			fromElement = arg_6_0,
			toElement = arg_6_0[var_0_2]
		})
	end
end

local function var_0_8(arg_7_0)
	if arg_7_0._deletionTimerLength > 0 then
		var_0_6(arg_7_0)
	else
		var_0_5(arg_7_0)
	end
end

local function var_0_9(arg_8_0, arg_8_1)
	LUI.AssertDescriptive({
		expectedType = "number",
		element = arg_8_1,
		customErrorString = "SetDeletionTimerLengthInMS - 'timeLengthInMS' invalid: value is..." .. tostring(arg_8_1)
	})

	arg_8_0._deletionTimerLength = arg_8_1
end

local function var_0_10(arg_9_0)
	return arg_9_0[var_0_2]
end

local function var_0_11(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._controllerIndex = arg_10_1
	arg_10_0.AllocateMemoryManagedWidget = var_0_7
	arg_10_0.DeleteMemoryManagedWidget = var_0_8
	arg_10_0.SetDeletionTimerLengthInMS = var_0_9
	arg_10_0.GetAllocatedWidget = var_0_10

	arg_10_0:SetDeletionTimerLengthInMS(var_0_0)
end

function MemoryManagedWidgetContainer(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "MemoryManagedWidgetContainer"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0

	var_0_11(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("MemoryManagedWidgetContainer", MemoryManagedWidgetContainer)
LockTable(_M)
