LUI.UIMessageQueue = LUI.Class(LUI.UIElement)
LUI.UIMessageQueue.MessageType = {
	StartInfo = {
		priority = 0,
		key = "StartInfo",
		maxWaitTime = 5000,
		displayTime = 2000
	},
	LevelUp = {
		priority = 10,
		key = "LevelUp",
		maxWaitTime = 5000,
		displayTime = 2000
	},
	Accolades = {
		priority = 20,
		key = "Accolades",
		maxWaitTime = 5000,
		displayTime = 2000
	},
	Killstreaks = {
		priority = 30,
		key = "Killstreaks",
		maxWaitTime = 5000,
		displayTime = 2000
	},
	ObjectiveUpdate = {
		priority = 40,
		key = "ObjectiveUpdate",
		maxWaitTime = 5000,
		displayTime = 2000
	},
	LocalPlayerSplash = {
		priority = 10,
		key = "LocalPlayerSplash",
		maxWaitTime = -1,
		displayTime = 1500
	},
	GlobalPlayerSplash = {
		priority = 10,
		key = "GlobalPlayerSplash",
		maxWaitTime = -1,
		displayTime = 2250
	},
	MiscMessages = {
		priority = 20,
		key = "MiscMessages",
		maxWaitTime = -1,
		displayTime = 1250
	}
}

function LUI.UIMessageQueue.init(arg_1_0, arg_1_1)
	LUI.UIMessageQueue.super.init(arg_1_0, arg_1_1)
	assert(type(arg_1_1) == "table")
	assert(arg_1_1.controller)

	arg_1_0.messageQueue = {}
	arg_1_0.widgetMap = {}
	arg_1_0.currentMessage = nil
	arg_1_0.controller = arg_1_1.controller
	arg_1_0.nextMessageDelay = arg_1_1.nextMessageDelay or 500

	arg_1_0:registerEventHandler("level_load", function(arg_2_0)
		arg_2_0.currentMessage = nil
		arg_2_0.messageQueue = {}
	end)
end

function LUI.UIMessageQueue.AddWidget(arg_3_0, arg_3_1, arg_3_2)
	assert(type(arg_3_2) == "table")
	assert(arg_3_2.messageType)
	assert(not LUI.IsItemInArray(arg_3_0.widgetMap, arg_3_2.messageType))

	arg_3_0.widgetMap[arg_3_2.messageType.key] = arg_3_1

	local function var_3_0()
		if arg_3_2.dataSourcesFrom.push:GetValue(arg_3_0.controller) then
			local var_4_0 = {}

			for iter_4_0, iter_4_1 in pairs(arg_3_2.dataSourcesFrom) do
				var_4_0[iter_4_0] = iter_4_1:GetValue(arg_3_0.controller)
			end

			DataModel.DBEBGEAJHJ(arg_3_2.dataSourcesFrom.push:GetModel(arg_3_0.controller), false)
			arg_3_0:AddMessage(arg_3_2.messageType, var_4_0, arg_3_2.dataSourcesTo)
		end
	end

	arg_3_0:SubscribeToModel(arg_3_2.dataSourcesFrom.push:GetModel(arg_3_0.controller), var_3_0, true)

	if arg_3_2.dataSourcesFrom.clear then
		local function var_3_1()
			if arg_3_2.dataSourcesFrom.clear:GetValue(arg_3_0.controller) then
				arg_3_0:RemoveMessagesOfType(arg_3_2.messageType, true, true)
				DataModel.DBEBGEAJHJ(arg_3_2.dataSourcesFrom.clear:GetModel(arg_3_0.controller), false)
			end
		end

		arg_3_0:SubscribeToModel(arg_3_2.dataSourcesFrom.clear:GetModel(arg_3_0.controller), var_3_1, true)
	end
end

function LUI.UIMessageQueue.AddMessage(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = {
		messageType = arg_6_1,
		values = arg_6_2,
		dataSourcesTo = arg_6_3,
		insertTime = Engine.BFBIDEGDFB(),
		maxWaitTime = arg_6_1.maxWaitTime,
		displayTime = arg_6_1.displayTime
	}

	if arg_6_2.priorityOverride then
		var_6_0.priorityOverride = arg_6_2.priorityOverride:GetValue(arg_6_0.controller)
	end

	if arg_6_1.displayTime < 0 then
		DebugPrint("Adding new non-expiring message of type " .. arg_6_1.key .. ". Removing any previous ones.")
		arg_6_0:RemoveMessagesOfType(arg_6_1, true, false)
	end

	arg_6_0.messageQueue[#arg_6_0.messageQueue + 1] = var_6_0

	if not arg_6_0.currentMessage then
		arg_6_0:ExecuteNextMessage()
	end
end

function LUI.UIMessageQueue.RemoveMessagesOfType(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	for iter_7_0 = #arg_7_0.messageQueue, 1, -1 do
		if arg_7_0.messageQueue[iter_7_0].messageType == arg_7_1 then
			table.remove(arg_7_0.messageQueue, iter_7_0)
		end
	end

	if arg_7_0.currentMessage and arg_7_0.currentMessage.messageType == arg_7_1 then
		if arg_7_2 and arg_7_0.currentMessage.messageType.displayTime > -1 then
			arg_7_0:OnMessageComplete()
		elseif arg_7_3 then
			arg_7_0:OnMessageDisplayFinished()
		else
			arg_7_0:ExecuteNextMessage()
		end
	elseif arg_7_3 then
		arg_7_0.widgetMap[arg_7_1.key]:processEvent({
			name = "message_queue_hide"
		})
	end
end

function LUI.UIMessageQueue.GetHighestPriorityIndex(arg_8_0)
	assert(#arg_8_0.messageQueue > 0)

	local var_8_0 = 0
	local var_8_1 = -1

	for iter_8_0 = 1, #arg_8_0.messageQueue do
		local var_8_2 = arg_8_0.messageQueue[iter_8_0]
		local var_8_3 = var_8_2.priorityOverride and var_8_2.priorityOverride or var_8_2.messageType.priority

		if var_8_1 < var_8_3 then
			var_8_0 = iter_8_0
			var_8_1 = var_8_3
		end
	end

	return var_8_0
end

function LUI.UIMessageQueue.ExecuteMessage(arg_9_0, arg_9_1)
	local var_9_0 = table.remove(arg_9_0.messageQueue, arg_9_1)
	local var_9_1 = arg_9_0.currentMessage
	local var_9_2 = var_9_1 and var_9_1.messageType.isStackable and var_9_1.messageType == var_9_0.messageType

	arg_9_0.currentMessage = var_9_0

	if var_9_0.dataSourcesTo then
		local var_9_3 = "push"

		for iter_9_0, iter_9_1 in pairs(var_9_0.dataSourcesTo) do
			if iter_9_0 ~= var_9_3 then
				DataModel.DBEBGEAJHJ(iter_9_1:GetModel(arg_9_0.controller), var_9_0.values[iter_9_0])
			end
		end

		if var_9_0.dataSourcesTo[var_9_3] ~= nil then
			DataModel.DBEBGEAJHJ(var_9_0.dataSourcesTo[var_9_3]:GetModel(arg_9_0.controller), var_9_0.values[var_9_3])
		end
	end

	if arg_9_0.widgetMap[var_9_0.messageType.key] then
		if not var_9_2 then
			arg_9_0.widgetMap[var_9_0.messageType.key]:processEvent({
				name = "message_queue_show",
				messageType = var_9_0.messageType
			})
		end
	else
		DebugPrint("WARNING: No widget set to handle message of type " .. var_9_0.messageType.key)
	end

	if var_9_0.displayTime > -1 then
		arg_9_0:Wait(var_9_0.displayTime).onComplete = function()
			if arg_9_0.currentMessage and arg_9_0.currentMessage == var_9_0 then
				arg_9_0:OnMessageDisplayFinished()
			end
		end
	end
end

function LUI.UIMessageQueue.ExecuteNextMessage(arg_11_0)
	if #arg_11_0.messageQueue > 0 then
		arg_11_0:RemoveExpiredMessages()

		if #arg_11_0.messageQueue > 0 then
			local var_11_0 = arg_11_0:GetHighestPriorityIndex()

			assert(var_11_0 > 0)
			arg_11_0:ExecuteMessage(var_11_0)
		end
	end
end

function LUI.UIMessageQueue.OnMessageComplete(arg_12_0)
	if arg_12_0.currentMessage then
		arg_12_0.currentMessage = nil

		arg_12_0:ExecuteNextMessage()
	end
end

function LUI.UIMessageQueue.OnMessageDisplayFinished(arg_13_0)
	local var_13_0 = arg_13_0:IsNextMessageStackable()

	if arg_13_0.currentMessage and arg_13_0.widgetMap[arg_13_0.currentMessage.messageType.key] and not var_13_0 then
		arg_13_0.widgetMap[arg_13_0.currentMessage.messageType.key]:processEvent({
			name = "message_queue_hide"
		})
	end

	if var_13_0 then
		arg_13_0:OnMessageComplete()
	else
		arg_13_0:Wait(arg_13_0.nextMessageDelay).onComplete = function()
			arg_13_0:OnMessageComplete()
		end
	end
end

function LUI.UIMessageQueue.RemoveExpiredMessages(arg_15_0)
	local var_15_0 = Engine.BFBIDEGDFB()

	for iter_15_0 = #arg_15_0.messageQueue, 1, -1 do
		local var_15_1 = arg_15_0.messageQueue[iter_15_0]

		if var_15_1.maxWaitTime > -1 and var_15_0 - var_15_1.insertTime >= var_15_1.maxWaitTime then
			table.remove(arg_15_0.messageQueue, iter_15_0)
		end
	end
end

function LUI.UIMessageQueue.IsNextMessageStackable(arg_16_0)
	if not arg_16_0.currentMessage or not arg_16_0.currentMessage.messageType.isStackable or #arg_16_0.messageQueue < 1 then
		return false
	end

	local var_16_0 = arg_16_0:GetHighestPriorityIndex()

	assert(var_16_0 > 0)

	return arg_16_0.currentMessage.messageType == arg_16_0.messageQueue[var_16_0].messageType
end
