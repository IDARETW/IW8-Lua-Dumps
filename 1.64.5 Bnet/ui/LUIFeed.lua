LUI.BaseUIFeed = LUI.Class(LUI.UIGrid)
LUI.UIFeed = LUI.Class(LUI.BaseUIFeed)
LUI.UIDataSourceFeed = LUI.Class(LUI.BaseUIFeed)

function LUI.BaseUIFeed.init(arg_1_0, arg_1_1)
	assert(arg_1_1)
	assert(arg_1_1.TTL == nil or type(arg_1_1.TTL) == "number")
	assert(arg_1_1.maxVisibleColumns == 1 or arg_1_1.maxVisibleRows == 1)

	arg_1_1.numChildren = 0

	if arg_1_1.maxVisibleColumns == 1 then
		arg_1_1.numColumns = 1
		arg_1_1.numRows = nil
	else
		arg_1_1.numColumns = nil
		arg_1_1.numRows = 1
	end

	arg_1_1.defaultFocus = nil
	arg_1_1.ensureClampedTargetLineOnDimensionsUpdate = false

	LUI.BaseUIFeed.super.init(arg_1_0, arg_1_1)

	arg_1_0._numData = 0
	arg_1_0._TTL = arg_1_1.TTL or 4000
	arg_1_0._numScrolled = 0
	arg_1_0._numVisible = 0
	arg_1_0._numAlive = 0
	arg_1_0._maxActive = math.max(arg_1_1.maxVisibleColumns, arg_1_1.maxVisibleRows)
	arg_1_0._tickOnExpiration = arg_1_1.tickOnExpiration
	arg_1_0._numAliveDataSource = arg_1_1.numAliveDataSource
	arg_1_0._numVisibleDataSource = arg_1_1.numVisibleDataSource
	arg_1_0._resetCounter = 0
	arg_1_0._childVisibilityNotifyFunc = arg_1_1.childVisibilityNotifyFunc or LUI.BaseUIFeed.OnElementNotifyVisible

	if arg_1_0._tickOnExpiration == nil then
		if arg_1_1.maxVisibleColumns == 1 and arg_1_0._verticalAlignment == LUI.Alignment.Bottom then
			arg_1_0._tickOnExpiration = false
		elseif arg_1_1.maxVisibleRows == 1 and arg_1_0._horizontalAlignment == LUI.Alignment.Right then
			arg_1_0._tickOnExpiration = false
		else
			arg_1_0._tickOnExpiration = true
		end
	end

	arg_1_0:addEventHandler("position_visible", arg_1_0._childVisibilityNotifyFunc)
end

function LUI.BaseUIFeed.OnNewData(arg_2_0, arg_2_1)
	arg_2_0._numData = arg_2_0._numData + 1

	local var_2_0 = arg_2_0:GetTargetColumn()
	local var_2_1 = arg_2_0:GetTargetRow()

	arg_2_0:SetNumChildren(arg_2_0._numData)
	arg_2_0:SetTargetColumn(var_2_0, false, true)
	arg_2_0:SetTargetRow(var_2_1, false, true)

	arg_2_0._numVisible = arg_2_0._numVisible + 1
	arg_2_0._numAlive = arg_2_0._numAlive + 1

	local var_2_2 = arg_2_0:GetPrimaryAxis()
	local var_2_3 = arg_2_0._numVisible > arg_2_0._maxActive

	var_2_3 = var_2_3 or var_2_2 == LUI.DIRECTION.vertical and arg_2_0._verticalAlignment == LUI.Alignment.Bottom
	var_2_3 = var_2_3 or var_2_2 == LUI.DIRECTION.horizontal and arg_2_0._horizontalAlignment == LUI.Alignment.Right

	if var_2_3 then
		arg_2_0:Tick()
	end

	arg_2_0:UpdateTrackerDataSources()

	local var_2_4 = arg_2_1 or arg_2_0._TTL

	if var_2_4 then
		local var_2_5 = arg_2_0:Wait(var_2_4)
		local var_2_6 = arg_2_0._numData
		local var_2_7 = arg_2_0._resetCounter

		function var_2_5.onComplete()
			if var_2_7 == arg_2_0._resetCounter then
				local var_3_0, var_3_1 = arg_2_0:GetGridLocation(var_2_6 - 1)
				local var_3_2 = arg_2_0:GetElementAtPosition(var_3_1, var_3_0)

				if var_3_2 ~= nil then
					var_3_2:processEvent({
						name = "feed_expiration"
					})
				else
					arg_2_0:NotifyWhenPositionIsVisible(var_3_1, var_3_0)
				end

				if var_2_6 > arg_2_0._numScrolled and arg_2_0._tickOnExpiration then
					arg_2_0:Tick()
				end

				arg_2_0._numAlive = arg_2_0._numAlive - 1

				arg_2_0:UpdateTrackerDataSources()
			end
		end
	end
end

function LUI.BaseUIFeed.Tick(arg_4_0)
	arg_4_0._numScrolled = arg_4_0._numScrolled + 1
	arg_4_0._numVisible = arg_4_0._numVisible - 1

	if arg_4_0:GetPrimaryAxis() == LUI.DIRECTION.vertical then
		local var_4_0 = arg_4_0._verticalAlignment == LUI.Alignment.Bottom and arg_4_0._numScrolled + arg_4_0._numVisible - 1 or arg_4_0._numScrolled

		arg_4_0:SetTargetRow(var_4_0 - 1, false, true)
		arg_4_0:SetTargetRow(var_4_0, false, false)
	else
		local var_4_1 = arg_4_0._horizontalAlignment == LUI.Alignment.Right and arg_4_0._numScrolled + arg_4_0._numVisible - 1 or arg_4_0._numScrolled

		arg_4_0:SetTargetColumn(var_4_1 - 1, false, true)
		arg_4_0:SetTargetColumn(var_4_1, false, false)
	end
end

function LUI.BaseUIFeed.GetDataIndex(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		return arg_5_1 + arg_5_2 * arg_5_0:GetMaxVisibleColumns()
	else
		return arg_5_2 + arg_5_1 * arg_5_0:GetMaxVisibleRows()
	end
end

function LUI.BaseUIFeed.GetGridLocation(arg_6_0, arg_6_1)
	local var_6_0
	local var_6_1

	if arg_6_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		var_6_0 = math.floor(arg_6_1 / arg_6_0:GetMaxVisibleColumns())
		var_6_1 = arg_6_1 % arg_6_0:GetMaxVisibleColumns()
	else
		var_6_1 = math.floor(arg_6_1 / arg_6_0:GetMaxVisibleRows())
		var_6_0 = arg_6_1 % arg_6_0:GetMaxVisibleRows()
	end

	return var_6_0, var_6_1
end

function LUI.BaseUIFeed.GainFocus(arg_7_0, arg_7_1)
	return false
end

function LUI.BaseUIFeed.UpdateTrackerDataSources(arg_8_0)
	if arg_8_0._numAliveDataSource then
		DataModel.DBEBGEAJHJ(arg_8_0._numAliveDataSource:GetModel(arg_8_0._controllerIndex), arg_8_0._numAlive)
	end

	if arg_8_0._numVisibleDataSource then
		DataModel.DBEBGEAJHJ(arg_8_0._numVisibleDataSource:GetModel(arg_8_0._controllerIndex), arg_8_0._numVisible)
	end
end

function LUI.BaseUIFeed.OnElementNotifyVisible(arg_9_0, arg_9_1)
	assert(arg_9_1)
	assert(arg_9_1.child)
	arg_9_1.child:processEvent({
		name = "feed_expiration"
	})
end

function LUI.UIFeed.init(arg_10_0, arg_10_1)
	assert(arg_10_1)
	assert(arg_10_1.bufferPadding == nil or type(arg_10_1.bufferPadding) == "number")

	local var_10_0 = LUI.ShallowCopy(arg_10_1)
	local var_10_1 = var_10_0.refreshChild

	function var_10_0.refreshChild(arg_11_0, arg_11_1, arg_11_2)
		local var_11_0 = arg_10_0:GetDataIndex(arg_11_1, arg_11_2)
		local var_11_1 = arg_10_0:GetDataAtIndex(var_11_0)

		assert(type(var_11_1) == "table")
		var_10_1(arg_11_0, var_11_1)
	end

	LUI.UIFeed.super.init(arg_10_0, var_10_0)

	arg_10_0._dataBufferLength = math.max(2, var_10_0.bufferPadding or 2) + math.max(var_10_0.maxVisibleColumns, var_10_0.maxVisibleRows)
	arg_10_0._dataBuffer = {}
	arg_10_0._nextBufferWriteIndex = 1
end

function LUI.UIFeed.PushData(arg_12_0, arg_12_1)
	assert(type(arg_12_1) == "table")

	arg_12_0._dataBuffer[arg_12_0._nextBufferWriteIndex] = arg_12_1
	arg_12_0._nextBufferWriteIndex = 1 + arg_12_0._nextBufferWriteIndex % arg_12_0._dataBufferLength

	arg_12_0:OnNewData()
end

function LUI.UIFeed.Reset(arg_13_0)
	arg_13_0._resetCounter = arg_13_0._resetCounter + 1
	arg_13_0._numData = 0
	arg_13_0._numScrolled = 0
	arg_13_0._numVisible = 0
	arg_13_0._numAlive = 0

	arg_13_0:SetNumChildren(0)

	arg_13_0._dataBuffer = {}
	arg_13_0._nextBufferWriteIndex = 1

	arg_13_0:RefreshContent()
end

function LUI.UIFeed.GetDataAtIndex(arg_14_0, arg_14_1)
	local var_14_0 = 1 + arg_14_1 % arg_14_0._dataBufferLength

	return arg_14_0._dataBuffer[var_14_0]
end

function LUI.UIDataSourceFeed.init(arg_15_0, arg_15_1)
	assert(arg_15_1)
	assert(type(arg_15_1.dataSource) == "table")
	assert(arg_15_1.controllerIndex)

	function arg_15_1.refreshChild(arg_16_0, arg_16_1, arg_16_2)
		local var_16_0 = arg_15_0:GetDataIndex(arg_16_1, arg_16_2)
		local var_16_1 = arg_15_0._feedDataSource:GetDataSourceAtIndex(var_16_0, arg_15_0._controllerIndex)

		arg_16_0:SetDataSource(var_16_1, arg_15_0._controllerIndex)
	end

	arg_15_0._controllerIndex = arg_15_1.controllerIndex

	LUI.UIDataSourceFeed.super.init(arg_15_0, arg_15_1)
	arg_15_0:SetFeedDataSource(arg_15_1.dataSource)
end

function LUI.UIDataSourceFeed.SetFeedDataSource(arg_17_0, arg_17_1)
	assert(type(arg_17_1) == "table")
	assert(type(arg_17_1.GetPushModel) == "function")
	assert(type(arg_17_1.GetTTLModel) == "function")
	assert(type(arg_17_1.GetDataSourceAtIndex) == "function")

	if arg_17_0._feedDataSource == arg_17_1 then
		return
	end

	arg_17_0._feedDataSource = arg_17_1

	if arg_17_0._pushSubscription then
		arg_17_0:UnsubscribeFromModel(arg_17_0._pushSubscription)

		arg_17_0._pushSubscription = nil
	end

	local var_17_0 = arg_17_0._feedDataSource:GetPushModel(arg_17_0._controllerIndex)

	arg_17_0._pushSubscription = arg_17_0:SubscribeToModel(var_17_0, function(arg_18_0)
		if DataModel.JJEHAEBDF(arg_18_0) == true then
			local var_18_0 = arg_17_0._feedDataSource:GetTTLModel(arg_17_0._controllerIndex)
			local var_18_1 = var_18_0 and DataModel.JJEHAEBDF(var_18_0) or nil

			arg_17_0:OnNewData(var_18_1)
		end
	end)
end
