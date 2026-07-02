LUI.Pips = LUI.Class(LUI.List)

function LUI.Pips.init(arg_1_0, arg_1_1)
	assert(arg_1_1)
	assert(arg_1_1.direction == nil or type(arg_1_1.direction) == "number")
	assert(arg_1_1.alignment == nil or type(arg_1_1.alignment) == "number")
	assert(arg_1_1.controllerIndex)
	assert(type(arg_1_1.buildPip) == "function")

	arg_1_0._buildPip = arg_1_1.buildPip
	arg_1_0._direction = arg_1_1.direction or LUI.DIRECTION.horizontal
	arg_1_0._nextPipID = 0
	arg_1_0._controllerIndex = arg_1_1.controllerIndex
	arg_1_0._pipPool = {}

	local var_1_0 = arg_1_1.alignment

	if not var_1_0 then
		if arg_1_0._direction == LUI.DIRECTION.vertical then
			var_1_0 = LUI.Alignment.Middle
		else
			var_1_0 = LUI.Alignment.Center
		end
	end

	local var_1_1 = arg_1_1.spacing or 0

	LUI.Pips.super.init(arg_1_0, {
		direction = arg_1_0._direction
	})
	arg_1_0:SetAlignment(var_1_0)
	arg_1_0:SetSpacing(var_1_1)

	arg_1_0.id = "Pips"
end

function LUI.Pips.SetupPipEventHandlers(arg_2_0, arg_2_1, arg_2_2)
	arg_2_1:addEventHandler("scrollbar_pip_is_default", function(arg_3_0, arg_3_1)
		arg_3_0.focused = true
	end)
	arg_2_1:addEventHandler("scrollbar_pip_highlighted", function(arg_4_0, arg_4_1)
		if arg_4_0:GetCurrentMenu() then
			arg_2_2:processEvent({
				name = "scrollbar_pip_focused",
				index = arg_4_0.index
			})
		end

		arg_4_0.focused = true
	end)
	arg_2_1:addEventHandler("scrollbar_pip_focused", function(arg_5_0, arg_5_1)
		if arg_5_1.index == arg_5_0.index then
			arg_5_0.focused = true
		elseif arg_5_0.focused then
			arg_5_0.focused = false
		end
	end)

	if not Engine.HDGDBCJFG() then
		arg_2_1:SetHandleMouse(true)
		arg_2_1:registerEventHandler("mouseenter", function(arg_6_0, arg_6_1)
			if not arg_6_0.focused then
				arg_6_0:processEvent({
					name = "scrollbar_pip_mouse_over"
				})
			end
		end)
		arg_2_1:registerEventHandler("mouseleave", function(arg_7_0, arg_7_1)
			if arg_7_0.focused then
				arg_2_2:processEvent({
					name = "scrollbar_pip_focused",
					index = arg_7_0.index
				})
			else
				arg_7_0:processEvent({
					name = "scrollbar_pip_not_highlighted"
				})

				arg_7_0.focused = false
			end
		end)
		arg_2_1:registerEventHandler("leftmousedown", function(arg_8_0, arg_8_1)
			arg_8_0:dispatchEventToCurrentMenu({
				name = "pip_mouse_select",
				index = arg_8_0.index,
				pip = arg_2_1
			})

			arg_8_0.focused = true
		end)
	end
end

function LUI.Pips.Resize(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_2 or false
	local var_9_1 = arg_9_0:getNumChildren()

	while arg_9_1 < arg_9_0:getNumChildren() do
		local var_9_2 = arg_9_0:getLastChild()

		if var_9_2.link then
			var_9_2.link:Unlink()

			var_9_2.link = nil
		end

		table.insert(arg_9_0._pipPool, var_9_2)
		arg_9_0:RemoveElement(var_9_2)
		var_9_2:processEvent({
			name = "removed_from_pips"
		})
	end

	while arg_9_1 > arg_9_0:getNumChildren() do
		local var_9_3

		if #arg_9_0._pipPool > 0 then
			var_9_3 = arg_9_0._pipPool[1]

			table.remove(arg_9_0._pipPool, 1)
		else
			var_9_3 = arg_9_0._buildPip()
			var_9_3.id = "pip_" .. arg_9_0._nextPipID
			var_9_3.index = arg_9_0._nextPipID
			arg_9_0._nextPipID = arg_9_0._nextPipID + 1

			arg_9_0:SetupPipEventHandlers(var_9_3, arg_9_0)
		end

		assert(not var_9_3.link)
		assert(type(var_9_3) == "userdata")

		local var_9_4 = arg_9_0:getNumChildren()

		if arg_9_0:GetDataSource() then
			var_9_3.link = var_9_3:SetDataSource(arg_9_0:GetDataSource():GetDataSourceAtIndex(var_9_4, arg_9_0._controllerIndex), arg_9_0._controllerIndex)
		end

		arg_9_0:addElement(var_9_3)
		var_9_3:processEvent({
			name = "added_to_pips"
		})
	end

	if var_9_1 ~= arg_9_0:getNumChildren() and arg_9_0:GetCurrentMenu() then
		arg_9_0:dispatchEventToCurrentMenu({
			name = "resized_pips"
		})
	end

	if var_9_0 then
		arg_9_0:ResizeChildrensToFill(arg_9_1)
	end
end

function LUI.Pips.AutoResize(arg_10_0)
	assert(arg_10_0._source)

	local var_10_0 = arg_10_0._source:GetContentCount(arg_10_0._direction)

	if var_10_0 == nil or var_10_0 <= 0 then
		return
	end

	arg_10_0:Resize(var_10_0)
end

function LUI.Pips.UpdateChildren(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0:getFirstChild()
	local var_11_1 = 0

	while var_11_0 do
		if var_11_1 == arg_11_2 then
			var_11_0:processEvent({
				name = "scrollbar_pip_is_default",
				index = arg_11_2
			})
		else
			var_11_0:processEvent({
				name = "scrollbar_pip_is_not_default"
			})
		end

		if var_11_1 == arg_11_1 then
			var_11_0:processEvent({
				name = "scrollbar_pip_highlighted",
				index = arg_11_1
			})
		else
			var_11_0:processEvent({
				name = "scrollbar_pip_not_highlighted"
			})
		end

		var_11_0 = var_11_0:getNextSibling()
		var_11_1 = var_11_1 + 1
	end
end

function LUI.Pips.UpdateScrolling(arg_12_0)
	assert(arg_12_0._source)
	arg_12_0:AutoResize()

	local var_12_0 = arg_12_0._source:GetContentCount(arg_12_0._direction)

	if var_12_0 == nil or var_12_0 <= 0 then
		return
	end

	local var_12_1 = arg_12_0._source:GetFocusPosition(arg_12_0._direction)

	if var_12_1 then
		assert(var_12_1 >= 0)
		assert(var_12_1 < var_12_0)
	end

	local var_12_2 = arg_12_0._source:GetDefaultPosition(arg_12_0._direction)

	if var_12_2 then
		assert(var_12_2 >= 0)
		assert(var_12_2 < var_12_0)
	end

	arg_12_0:UpdateChildren(var_12_1, var_12_2)
end

function LUI.Pips.LinkTo(arg_13_0, arg_13_1)
	arg_13_0._source = arg_13_1

	if arg_13_1.GetGridDataSource then
		local var_13_0 = arg_13_1:GetGridDataSource()

		arg_13_0:SetLinkedGridDataSource(var_13_0)
	end

	arg_13_0:UpdateScrolling()
end

function LUI.Pips.GetDirection(arg_14_0)
	return arg_14_0._direction
end

function LUI.Pips.SetLinkedGridDataSource(arg_15_0, arg_15_1)
	arg_15_0:Resize(0)
	arg_15_0:SetDataSource(arg_15_1, arg_15_0._controllerIndex)
	arg_15_0:AutoResize()
end

local function var_0_0(arg_16_0, arg_16_1)
	return (arg_16_0 - 1) / arg_16_1, 1 - arg_16_0 / arg_16_1
end

function LUI.Pips.ResizeChildrensToFill(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:getNumChildren()
	local var_17_1 = arg_17_0:getFirstChild()

	if arg_17_0._direction == LUI.DIRECTION.horizontal then
		for iter_17_0 = 1, var_17_0 do
			local var_17_2, var_17_3 = var_0_0(iter_17_0, var_17_0)

			var_17_1:SetAnchorsAndPosition(var_17_2, var_17_3, 0, 0, 0, 0, 0, 0)

			var_17_1 = var_17_1:getNextSibling()
		end
	else
		for iter_17_1 = 1, var_17_0 do
			local var_17_4, var_17_5 = var_0_0(iter_17_1, var_17_0)

			var_17_1:SetAnchorsAndPosition(0, 0, var_17_4, var_17_5, 0, 0, 0, 0)

			var_17_1 = var_17_1:getNextSibling()
		end
	end
end
