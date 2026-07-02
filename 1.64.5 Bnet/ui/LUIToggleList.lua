LUI.UIToggleList = LUI.Class(LUI.List)
LUI.UIDataSourceToggleList = LUI.Class(LUI.UIToggleList)

function LUI.UIToggleList.init(arg_1_0, arg_1_1)
	LUI.UIToggleList.super.init(arg_1_0, arg_1_1)
	assert(arg_1_1)
	assert(type(arg_1_1.buildChild) == "function")

	arg_1_0._activeIndices = {}
	arg_1_0._buildChildFunc = arg_1_1.buildChild
	arg_1_0._orderedIndices = arg_1_1.orderedIndices or false
	arg_1_0._animateInDuration = arg_1_1.animateInDuration or 500
	arg_1_0._animateOutDuration = arg_1_1.animateOutDuration or 500
	arg_1_0._animationVariance = arg_1_1.animationVariance
end

function LUI.UIToggleList.AddItem(arg_2_0, arg_2_1)
	if arg_2_0._activeIndices[arg_2_1] then
		DebugPrint("ERROR - LUI.UIToggleList.AddItem - Attempting to add an item at an index where an item already exists!")

		return
	end

	local var_2_0 = arg_2_0._buildChildFunc(arg_2_1)
	local var_2_1 = arg_2_0:CreateContainerElement(var_2_0)

	var_2_1.id = var_2_0.id .. "Wrapper" .. arg_2_1

	var_2_1:addElement(var_2_0)

	var_2_1.widget = var_2_0

	var_2_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	var_2_1._toggleListIndex = arg_2_1
	arg_2_0._activeIndices[arg_2_1] = true

	if arg_2_0._orderedIndices then
		arg_2_0:InsertOrderedItem(arg_2_1, var_2_1)
	else
		arg_2_0:addElement(var_2_1)
	end

	var_2_1:AnimateIn(arg_2_0:GetAnimationDuration(arg_2_0._animateInDuration))

	return var_2_1
end

function LUI.UIToggleList.RemoveItem(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:getFirstChild()

	while var_3_0 do
		if var_3_0._toggleListIndex == arg_3_1 then
			var_3_0:AnimateOut(arg_3_0:GetAnimationDuration(arg_3_0._animateOutDuration), function()
				var_3_0:closeTree()

				arg_3_0._activeIndices[arg_3_1] = nil
			end)

			return
		end

		var_3_0 = var_3_0:getNextSibling()
	end
end

function LUI.UIToggleList.GetItem(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0:getFirstChild()

	while var_5_0 do
		if var_5_0._toggleListIndex == arg_5_1 then
			return var_5_0
		end

		var_5_0 = var_5_0:getNextSibling()
	end

	return nil
end

function LUI.UIToggleList.InsertOrderedItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0:getFirstChild()

	while var_6_0 do
		assert(var_6_0._toggleListIndex)

		if arg_6_1 < var_6_0._toggleListIndex then
			arg_6_2:addElementBefore(var_6_0)

			return
		end

		var_6_0 = var_6_0:getNextSibling()
	end

	arg_6_0:addElement(arg_6_2)
end

function LUI.UIToggleList.CreateContainerElement(arg_7_0, arg_7_1)
	local var_7_0, var_7_1, var_7_2, var_7_3 = arg_7_1:getLocalRect()
	local var_7_4, var_7_5, var_7_6, var_7_7 = arg_7_1:GetAnchorData()
	local var_7_8 = LUI.UIElement.new()

	function var_7_8.AnimateIn(arg_8_0, arg_8_1)
		arg_8_0:SetAnchorsAndPosition(var_7_4, var_7_6, var_7_5, var_7_7, 0, 0, 0, 0)
		arg_8_0:SetAnchorsAndPosition(var_7_4, var_7_6, var_7_5, var_7_7, var_7_0, var_7_2, var_7_1, var_7_3, arg_8_1)
	end

	function var_7_8.AnimateOut(arg_9_0, arg_9_1, arg_9_2)
		arg_9_0:SetAnchorsAndPosition(var_7_4, var_7_6, var_7_5, var_7_7, 0, 0, 0, 0, arg_9_1).onComplete = arg_9_2
	end

	return var_7_8
end

function LUI.UIToggleList.GetAnimationDuration(arg_10_0, arg_10_1)
	if arg_10_0._animationVariance then
		return math.random(arg_10_1 - arg_10_0._animationVariance, arg_10_1 + arg_10_0._animationVariance)
	else
		return arg_10_1
	end
end

function LUI.UIDataSourceToggleList.init(arg_11_0, arg_11_1)
	LUI.UIDataSourceToggleList.super.init(arg_11_0, arg_11_1)
	assert(arg_11_1.controlDataSource)
	assert(arg_11_1.listDataSource)
	assert(type(arg_11_1.listDataSource.GetDataSourceAtIndex) == "function")
	assert(arg_11_1.controller)

	arg_11_0._maxBits = arg_11_1.maxBits or 31

	local var_11_0 = arg_11_1.controlDataSource
	local var_11_1 = arg_11_1.listDataSource

	arg_11_0:SubscribeToModel(var_11_0:GetModel(arg_11_1.controller), function(arg_12_0)
		local var_12_0 = DataModel.JJEHAEBDF(arg_12_0)

		for iter_12_0 = 1, arg_11_0._maxBits do
			local var_12_1 = Engine.CHJJIAHHGE(var_12_0, iter_12_0 - 1)

			if var_12_1 and not arg_11_0._activeIndices[iter_12_0] then
				local var_12_2 = var_11_1:GetDataSourceAtIndex(iter_12_0, arg_11_1.controller)

				arg_11_0:AddItem(iter_12_0).widget:SetDataSource(var_12_2, arg_11_1.controller)
			elseif not var_12_1 and arg_11_0._activeIndices[iter_12_0] then
				arg_11_0:RemoveItem(iter_12_0)
			end
		end
	end)

	if arg_11_1.animationDataSource then
		local var_11_2 = arg_11_1.animationDataSource

		arg_11_0:SubscribeToModel(var_11_2:GetModel(arg_11_1.controller), function(arg_13_0)
			local var_13_0 = DataModel.JJEHAEBDF(arg_13_0)

			for iter_13_0 = 1, arg_11_0._maxBits do
				if Engine.CHJJIAHHGE(var_13_0, iter_13_0 - 1) then
					local var_13_1 = arg_11_0:GetItem(iter_13_0)

					if var_13_1 then
						var_13_1:processEvent({
							name = "togglelist_bitfield_animate"
						})
					else
						DebugPrint("ERROR - LUI.UIDataSourceToggleList.init - Attempting to animate an item which doesn't exist!")
					end
				end
			end
		end)
	end
end
