local function var_0_0(arg_1_0)
	return arg_1_0._collapsedHeight + arg_1_0.ChildrenContainer:getHeight() + 10 * _1080p
end

local function var_0_1(arg_2_0)
	return arg_2_0._collapsedHeight
end

local function var_0_2(arg_3_0)
	if arg_3_0:IsExpanded() then
		arg_3_0.ChildrenContainer:SetAlpha(1)
		arg_3_0.ChildrenContainer:SetMouseFocusBlocker(false)
	end

	local var_3_0 = arg_3_0:GetCurrentAnchorsAndPositions()
	local var_3_1 = arg_3_0:IsExpanded() and arg_3_0:GetExpandedHeight() or arg_3_0:GetCollapsedHeight()
	local var_3_2 = var_3_1 < var_3_0.bottom - var_3_0.top and arg_3_0._collapseDuration or arg_3_0._expandDuration
	local var_3_3, var_3_4, var_3_5, var_3_6, var_3_7, var_3_8, var_3_9, var_3_10 = arg_3_0:SetAnchorsAndPosition(var_3_0.leftAnchor, var_3_0.rightAnchor, var_3_0.topAnchor, var_3_0.bottomAnchor, var_3_0.left, var_3_0.right, var_3_0.top, var_3_0.top + var_3_1, var_3_2)

	if not arg_3_0:IsExpanded() then
		function var_3_6.onComplete(arg_4_0)
			arg_4_0.ChildrenContainer:SetAlpha(0)
			arg_4_0.ChildrenContainer:SetMouseFocusBlocker(true)
		end
	end
end

local function var_0_3(arg_5_0)
	return arg_5_0._expanded
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0._expanded == arg_6_1 and not arg_6_2 then
		return
	end

	arg_6_0._expanded = arg_6_1

	if arg_6_0._expanded then
		arg_6_0.ChildrenContainer:SetMouseFocusBlocker(false)
		ACTIONS.AnimateSequenceIfItExists(arg_6_0._expandButton, "Expanded")
		ACTIONS.AnimateSequenceIfItExists(arg_6_0, "ExpandedGlow")
	else
		arg_6_0.ChildrenContainer:SetMouseFocusBlocker(true)

		local var_6_0 = arg_6_0.ChildrenContainer:getFirstInFocus()

		if var_6_0 then
			var_6_0:processEvent({
				name = "lose_focus"
			})
			;(arg_6_0._innerWidget or arg_6_0._expandButton):processEvent({
				name = "gain_focus"
			})
			arg_6_0:dispatchEventToParent({
				name = "ensure_line_visible",
				direction = LUI.DIRECTION.vertical,
				line = arg_6_0._gridContentRowIndex
			})
		end

		ACTIONS.AnimateSequenceIfItExists(arg_6_0._expandButton, "Collapsed")
		ACTIONS.AnimateSequenceIfItExists(arg_6_0, "ExpandedIdle")
	end

	arg_6_0:AdjustExpanderToContent()
end

local function var_0_5(arg_7_0, arg_7_1)
	var_0_4(arg_7_0, arg_7_1.name == "expander_expand")

	return true
end

local function var_0_6(arg_8_0, arg_8_1)
	if arg_8_0:IsExpanded() then
		var_0_4(arg_8_0, false)
	else
		var_0_4(arg_8_0, true)
	end

	return true
end

local function var_0_7(arg_9_0, arg_9_1)
	if arg_9_1.down and arg_9_1.button == "alt1" and not arg_9_0._isExpandButtonBelow and arg_9_0:getFirstInFocus() then
		if arg_9_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end

		arg_9_0:ExpandOrCollapse(not arg_9_0:IsExpanded())

		return true
	end

	return false
end

local function var_0_8(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	local var_10_0 = arg_10_0:getParent()

	if arg_10_2 ~= "up" and arg_10_2 ~= "down" then
		return var_10_0:FocusNextElement(arg_10_0, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	end

	local var_10_1 = arg_10_2 == "up" and -1 or 1

	if arg_10_1 == arg_10_0.ChildrenContainer then
		local var_10_2 = arg_10_0.ChildrenContainer:getFirstInFocus()

		if not var_10_2 then
			return var_10_0:FocusNextElement(arg_10_0, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
		end

		local var_10_3

		if var_10_1 < 0 then
			var_10_3 = var_10_2:getPreviousSibling()
		else
			var_10_3 = var_10_2:getNextSibling()
		end

		if not var_10_3 then
			if var_10_1 < 0 then
				arg_10_1:processEvent({
					name = "lose_focus",
					controller = arg_10_5
				})

				if arg_10_0._innerWidget then
					arg_10_0._innerWidget:processEvent({
						name = "gain_focus",
						controller = arg_10_5,
						direction = arg_10_2
					})
				else
					arg_10_0._expandButton:processEvent({
						name = "gain_focus",
						controller = arg_10_5,
						direction = arg_10_2
					})
				end
			else
				return var_10_0:FocusNextElement(arg_10_0, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
			end
		else
			arg_10_1:processEvent({
				name = "lose_focus",
				controller = arg_10_5
			})
			var_10_3:processEvent({
				name = "gain_focus",
				controller = arg_10_5,
				direction = arg_10_2
			})
		end
	elseif arg_10_1 == arg_10_0._expandButton then
		if arg_10_0._innerWidget then
			if var_10_1 < 0 and arg_10_0:IsExpanded() and arg_10_0.ChildrenContainer:getFirstChild() then
				arg_10_1:processEvent({
					name = "lose_focus",
					controller = arg_10_5
				})
				arg_10_0.ChildrenContainer:getLastChild():processEvent({
					name = "gain_focus",
					controller = arg_10_5,
					direction = arg_10_2
				})
			else
				arg_10_1:processEvent({
					name = "lose_focus",
					controller = arg_10_5
				})
				arg_10_0._innerWidget:processEvent({
					name = "gain_focus",
					controller = arg_10_5,
					direction = arg_10_2
				})
			end
		elseif var_10_1 > 0 and arg_10_0:IsExpanded() and arg_10_0.ChildrenContainer:getFirstChild() then
			arg_10_1:processEvent({
				name = "lose_focus",
				controller = arg_10_5
			})
			arg_10_0.ChildrenContainer:getFirstChild():processEvent({
				name = "gain_focus",
				controller = arg_10_5,
				direction = arg_10_2
			})
		else
			return var_10_0:FocusNextElement(arg_10_0, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
		end
	elseif arg_10_1 == arg_10_0._innerWidget then
		if var_10_1 > 0 and arg_10_0:IsExpanded() and arg_10_0.ChildrenContainer:getFirstChild() then
			arg_10_1:processEvent({
				name = "lose_focus",
				controller = arg_10_5
			})
			arg_10_0.ChildrenContainer:getFirstChild():processEvent({
				name = "gain_focus",
				controller = arg_10_5,
				direction = arg_10_2
			})
		else
			return var_10_0:FocusNextElement(arg_10_0, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
		end
	end

	arg_10_0:dispatchEventToParent({
		name = "ensure_line_visible",
		direction = LUI.DIRECTION.vertical,
		line = arg_10_2 == "up" and arg_10_0._gridContentRowIndex or arg_10_0._gridContentRowIndex + 1
	})

	return true
end

local function var_0_9(arg_11_0, arg_11_1)
	if arg_11_0._expanded then
		ACTIONS.AnimateSequenceIfItExists(arg_11_0, "ExpandedGlow")
	end

	local var_11_0 = arg_11_1.direction

	if var_11_0 and (var_11_0 == "up" or var_11_0 == "down") then
		if arg_11_1.isWrap then
			var_11_0 = var_11_0 == "up" and "down" or "up"
		end

		if var_11_0 == "up" and arg_11_0:IsExpanded() then
			arg_11_0.ChildrenContainer:getLastChild():processEvent(arg_11_1)
		elseif arg_11_0._innerWidget then
			arg_11_0._innerWidget:processEvent(arg_11_1)
		else
			arg_11_0._expandButton:processEvent(arg_11_1)
		end

		return true
	end

	return false
end

local function var_0_10(arg_12_0, arg_12_1)
	if arg_12_0._expanded then
		ACTIONS.AnimateSequenceIfItExists(arg_12_0, "ExpandedIdle")
	end

	if arg_12_0._innerWidget and arg_12_0._innerWidget:isInFocus() then
		arg_12_0._innerWidget:processEvent(arg_12_1)

		return true
	elseif arg_12_0._expandButton:isInFocus() then
		arg_12_0._expandButton:processEvent(arg_12_1)

		return true
	else
		local var_12_0 = arg_12_0.ChildrenContainer:getFirstChild()

		while var_12_0 do
			if var_12_0:isInFocus() then
				var_12_0:processEvent(arg_12_1)

				return true
			end

			var_12_0 = var_12_0:getNextSibling()
		end
	end
end

local function var_0_11(arg_13_0, arg_13_1)
	if arg_13_0._expanded then
		ACTIONS.AnimateSequenceIfItExists(arg_13_0, "ExpandedGlow")
	end

	return true
end

local function var_0_12(arg_14_0, arg_14_1)
	if arg_14_0._expanded then
		ACTIONS.AnimateSequenceIfItExists(arg_14_0, "ExpandedIdle")
	end

	return true
end

function LUI.AddUIExpanderLogic(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_2.expandButton)
	assert(arg_15_2.childrenList)

	arg_15_2.childrenLeftOffset = arg_15_2.childrenLeftOffset or 38 * _1080p
	arg_15_2.initiallyExpanded = arg_15_2.initiallyExpanded or false
	arg_15_2.expandDuration = arg_15_2.expandDuration or 200
	arg_15_2.collapseDuration = arg_15_2.collapseDuration or 100
	arg_15_0._expandButton = arg_15_2.expandButton
	arg_15_0._expandDuration = arg_15_2.expandDuration
	arg_15_0._collapseDuration = arg_15_2.collapseDuration
	arg_15_0._expanded = false
	arg_15_0.IsExpanded = var_0_3
	arg_15_0.AdjustExpanderToContent = var_0_2
	arg_15_0.GetExpandedHeight = var_0_0
	arg_15_0.GetCollapsedHeight = var_0_1
	arg_15_0.FocusNextElement = var_0_8
	arg_15_0.ExpandOrCollapse = var_0_4

	local var_15_0 = arg_15_0:GetCurrentAnchorsAndPositions()

	arg_15_0._collapsedHeight = var_15_0.bottom - var_15_0.top

	arg_15_0:SetHandleMouseMove(true)
	arg_15_0:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_NORMAL)
	arg_15_0:registerEventHandler("gamepad_button", var_0_7)
	arg_15_0:registerEventHandler("expander_expand", var_0_5)
	arg_15_0:registerEventHandler("expander_collapse", var_0_5)
	arg_15_0:addEventHandler("gain_focus", var_0_9)
	arg_15_0:addEventHandler("lose_focus", var_0_10)
	arg_15_0:addEventHandler("mouseenter", var_0_11)
	arg_15_0:addEventHandler("mouseleave", var_0_12)
	arg_15_0:registerEventHandler("toggle_expander", var_0_6)
	arg_15_0:setUseStencil(true)
	arg_15_0:SetGridChildDynamicSize(true, LUI.DIRECTION.vertical)

	local var_15_1 = arg_15_2.replaceDummyInnerWidget ~= nil and #arg_15_2.childrenList > 0

	if var_15_1 then
		local var_15_2 = arg_15_2.childrenList[1]

		assert(var_15_2.element or var_15_2.buildFunction, "Inner widget data needs to contain either an element or a buildFunction")

		arg_15_0.InnerWidget = var_15_2.element or var_15_2.buildFunction(arg_15_0, arg_15_1, var_15_2.options)

		local var_15_3 = arg_15_2.replaceDummyInnerWidget:GetCurrentAnchorsAndPositions()

		arg_15_0.InnerWidget:SetAnchorsAndPosition(var_15_3.leftAnchor, var_15_3.rightAnchor, var_15_3.topAnchor, var_15_3.bottomAnchor, var_15_3.left, var_15_3.right, var_15_3.top, var_15_3.bottom)

		if not arg_15_0.InnerWidget.id then
			arg_15_0.InnerWidget.id = "InnerWidget"
		end

		arg_15_0.InnerWidget.navigation = {}

		arg_15_0.InnerWidget:addElementAfter(arg_15_2.replaceDummyInnerWidget)

		arg_15_0[arg_15_2.replaceDummyInnerWidget.id] = nil

		arg_15_2.replaceDummyInnerWidget:closeTree()

		arg_15_2.replaceDummyInnerWidget = nil
		arg_15_0._innerWidget = arg_15_0.InnerWidget
	end

	arg_15_0._expandButton:registerEventHandler("button_action", function(arg_16_0, arg_16_1)
		arg_16_0:dispatchEventToParent({
			name = "toggle_expander"
		})
	end)

	arg_15_0._expandButton.navigation = {}

	local var_15_4 = 0
	local var_15_5 = 0
	local var_15_6 = 38 * _1080p
	local var_15_7 = 0
	local var_15_8 = arg_15_0._collapsedHeight + 10 * _1080p

	if arg_15_2.replaceDummyChildrenContainer then
		local var_15_9 = arg_15_2.replaceDummyChildrenContainer:GetCurrentAnchorsAndPositions()

		var_15_4 = var_15_9.leftAnchor
		var_15_5 = var_15_9.rightAnchor
		var_15_6 = var_15_9.left
		var_15_7 = var_15_9.right
		var_15_8 = var_15_9.top
		arg_15_0[arg_15_2.replaceDummyChildrenContainer.id] = nil

		arg_15_2.replaceDummyChildrenContainer:closeTree()

		arg_15_2.replaceDummyChildrenContainer = nil
	end

	arg_15_0.ChildrenContainer = LUI.UIVerticalStackedLayout.new()

	arg_15_0.ChildrenContainer:SetNoWrap(true)
	arg_15_0.ChildrenContainer:SetAnchorsAndPosition(var_15_4, var_15_5, 0, 1, var_15_6, var_15_7, var_15_8, var_15_8)

	arg_15_0.ChildrenContainer.id = "ChildrenContainer"

	arg_15_0.ChildrenContainer:SetAdjustSizeToContent(true)
	arg_15_0.ChildrenContainer:SetSpacing(10 * _1080p)
	arg_15_0.ChildrenContainer:addElementAfter(arg_15_0._innerWidget or arg_15_0._expandButton)
	arg_15_0.ChildrenContainer:SetNotifyOnLayoutInit(true)
	arg_15_0.ChildrenContainer:registerEventHandler("layout_initialized", function(arg_17_0)
		local var_17_0 = arg_17_0:getParent()

		if not var_17_0:IsExpanded() then
			var_17_0.ChildrenContainer:SetAlpha(0)
			var_17_0.ChildrenContainer:SetMouseFocusBlocker(true)
		end
	end)

	local var_15_10 = var_15_1 and 2 or 1
	local var_15_11 = #arg_15_2.childrenList

	while var_15_10 <= var_15_11 do
		local var_15_12 = arg_15_2.childrenList[var_15_10]

		assert(var_15_12.element or var_15_12.buildFunction, "Child data #" .. var_15_10 .. " needs to contain either an element or a buildFunction")

		local var_15_13 = var_15_12.element or var_15_12.buildFunction(arg_15_0, arg_15_1, var_15_12.options)

		if var_15_13 then
			if not var_15_13.id then
				var_15_13.id = "ExpanderChild" .. var_15_10
			end

			var_15_13.navigation = {}

			arg_15_0.ChildrenContainer:addElement(var_15_13)
		end

		var_15_10 = var_15_10 + 1
	end

	var_0_4(arg_15_0, arg_15_2.initiallyExpanded, true)

	function arg_15_0.closeTree(arg_18_0)
		local function var_18_0(arg_19_0)
			if arg_19_0 then
				arg_19_0.navigation = nil
			end
		end

		var_18_0(arg_18_0._innerWidget)
		var_18_0(arg_18_0._expandButton)
		var_18_0(arg_18_0.ChildrenContainer:getFirstChild())
		var_18_0(arg_18_0.ChildrenContainer:getLastChild())
		LUI.UIElement.closeTree(arg_18_0)
	end

	arg_15_0._isExpander = true
end

local function var_0_13(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0._allocatedRows[arg_20_1]

	if not var_20_0 then
		var_20_0 = arg_20_0._buildFunction(arg_20_1)

		local var_20_1 = arg_20_1 * (arg_20_0._rowHeight + arg_20_0._rowSpacing)
		local var_20_2 = var_20_1 + arg_20_0._rowHeight

		var_20_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, var_20_1, var_20_2)

		var_20_0._expanderRow = arg_20_1

		arg_20_0.ChildrenContainer:addElement(var_20_0)

		arg_20_0._allocatedRows[arg_20_1] = var_20_0
	end

	return var_20_0
end

local function var_0_14(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0._allocatedRows[arg_21_1]

	if var_21_0 then
		var_21_0:closeTree()

		arg_21_0._allocatedRows[arg_21_1] = nil
	end
end

local function var_0_15(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	if arg_22_3 == nil then
		arg_22_3 = true
	end

	local var_22_0 = {}

	var_22_0.name = "ensure_line_visible"
	var_22_0.direction = LUI.DIRECTION.vertical

	local var_22_1 = arg_22_0:getParent()

	assert(var_22_1._targetPosition, "This is designed to work with LUIGrid, self is not parented to a grid.")

	local var_22_2 = arg_22_0._gridContentRowIndex
	local var_22_3 = 0
	local var_22_4 = var_22_1._scrollingThresholdY
	local var_22_5 = var_22_1._scrollingThresholdPixelY

	if arg_22_1 == -1 then
		local var_22_6 = arg_22_0._expandButton:getHeight()
		local var_22_7 = arg_22_0:getHeight()

		if arg_22_2 == "up" then
			var_22_3 = var_22_2
		else
			var_22_3 = var_22_6 / var_22_7 + var_22_2
		end

		local var_22_8 = arg_22_2 == "up" and -1 or 1

		if var_22_5 > 0 then
			var_22_3 = var_22_1:ConvertRowPixelToLine(var_22_3, var_22_8 * var_22_5)
		else
			var_22_3 = var_22_1:ConvertRowPixelToLine(var_22_3, var_22_8 * var_22_6 * var_22_4)
		end
	elseif arg_22_1 < arg_22_0:GetNumRows() then
		local var_22_9 = arg_22_0.ChildrenContainer:GetCurrentAnchorsAndPositions()
		local var_22_10 = arg_22_0._rowHeight
		local var_22_11 = arg_22_0:getHeight()

		var_22_3 = var_22_9.top + arg_22_1 * var_22_10 + math.max(0, (arg_22_1 - 1) * arg_22_0._rowSpacing)

		if arg_22_2 == "down" then
			var_22_3 = var_22_3 + var_22_10
		end

		var_22_3 = LUI.clamp(var_22_3 / var_22_11 + var_22_2, 0, var_22_1:GetNumRows())

		local var_22_12 = arg_22_2 == "up" and -1 or 1

		if var_22_5 > 0 then
			var_22_3 = var_22_1:ConvertRowPixelToLine(var_22_3, var_22_12 * var_22_5)
		else
			var_22_3 = var_22_1:ConvertRowPixelToLine(var_22_3, var_22_12 * (var_22_10 + arg_22_0._rowSpacing) * scrollingThreshold)
		end
	end

	var_22_0.line = var_22_3
	var_22_0.force = arg_22_4 or false

	if arg_22_3 then
		var_22_1:processEvent(var_22_0)
	end

	return var_22_0
end

local function var_0_16(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	if not arg_23_0:IsExpanded() or arg_23_0:GetNumRows() == 0 then
		return nil
	end

	local var_23_0 = arg_23_2

	if arg_23_3 and arg_23_2 == "up" then
		var_23_0 = "down"
	elseif arg_23_3 and arg_23_2 == "down" then
		var_23_0 = "up"
	end

	if var_23_0 == "down" then
		local var_23_1 = arg_23_0._expandButton:getHeight()
		local var_23_2 = arg_23_0:getHeight()

		return {
			x = 0,
			y = var_23_1 / var_23_2
		}
	elseif var_23_0 == "up" then
		local var_23_3 = arg_23_0.ChildrenContainer:GetCurrentAnchorsAndPositions()
		local var_23_4 = arg_23_0._rowHeight
		local var_23_5 = arg_23_0:getHeight()
		local var_23_6 = var_23_3.top
		local var_23_7 = arg_23_0:GetNumRows() - 1
		local var_23_8 = var_23_6 + var_23_7 * var_23_4 + math.max(0, (var_23_7 - 1) * arg_23_0._rowSpacing)

		return {
			x = 0,
			y = var_23_8 / var_23_5
		}
	end
end

local function var_0_17(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4, arg_24_5)
	local var_24_0 = arg_24_0:getParent()

	if arg_24_2 ~= "up" and arg_24_2 ~= "down" then
		return var_24_0:FocusNextElement(arg_24_0, arg_24_2, arg_24_3, arg_24_4, arg_24_5)
	end

	local var_24_1 = arg_24_2 == "up" and -1 or 1
	local var_24_2

	if arg_24_1 == arg_24_0.ChildrenContainer then
		local var_24_3

		for iter_24_0, iter_24_1 in pairs(arg_24_0._allocatedRows) do
			if iter_24_1:getFirstInFocus() then
				var_24_3 = iter_24_1

				break
			end
		end

		if not var_24_3 then
			DebugPrint("GridOptimized_FocusNextElement: previousFocus is nil, it's not supposed to happen...")

			return var_24_0:FocusNextElement(arg_24_0, arg_24_2, arg_24_3, arg_24_4, arg_24_5)
		end

		local var_24_4 = var_24_3._expanderRow + var_24_1

		if var_24_4 < 0 then
			arg_24_1:processEvent({
				name = "lose_focus",
				controller = arg_24_5
			})
			arg_24_0._expandButton:processEvent({
				name = "gain_focus",
				controller = arg_24_5,
				direction = arg_24_2
			})

			var_24_2 = -1
		elseif var_24_4 > arg_24_0:GetNumRows() - 1 then
			return var_24_0:FocusNextElement(arg_24_0, arg_24_2, arg_24_3, arg_24_4, arg_24_5)
		else
			arg_24_1:processEvent({
				name = "lose_focus",
				controller = arg_24_5
			})
			arg_24_0:FocusChild(var_24_4)

			var_24_2 = var_24_4
		end
	elseif arg_24_1 == arg_24_0._expandButton then
		if var_24_1 > 0 and arg_24_0:IsExpanded() and arg_24_0:GetNumRows() > 0 then
			arg_24_1:processEvent({
				name = "lose_focus",
				controller = arg_24_5
			})
			arg_24_0:FocusChild(0)

			var_24_2 = 0
		else
			return var_24_0:FocusNextElement(arg_24_0, arg_24_2, arg_24_3, arg_24_4, arg_24_5)
		end
	end

	if var_24_2 ~= nil then
		var_0_15(arg_24_0, var_24_2, arg_24_2)
	end

	return true
end

local function var_0_18(arg_25_0, arg_25_1)
	if arg_25_0.Header and arg_25_0.Header.ShowButtonPrompt then
		arg_25_0.Header:ShowButtonPrompt(true)
	end

	local var_25_0 = arg_25_1.direction

	if var_25_0 and (var_25_0 == "up" or var_25_0 == "down") then
		if arg_25_1.isWrap then
			var_25_0 = var_25_0 == "up" and "down" or "up"
		end

		if var_25_0 == "up" and arg_25_0:IsExpanded() and arg_25_0:GetNumRows() > 0 then
			local var_25_1 = arg_25_0:GetNumRows() - 1

			arg_25_0:FocusChild(var_25_1)

			if arg_25_1.focusType ~= FocusType.MouseOver then
				arg_25_0:dispatchEventToParent({
					force = false,
					name = "ensure_line_visible",
					direction = LUI.DIRECTION.vertical,
					line = arg_25_0._gridContentRowIndex + 1
				})
			end
		else
			arg_25_0._expandButton:processEvent(arg_25_1)

			if arg_25_1.focusType ~= FocusType.MouseOver then
				arg_25_0:dispatchEventToParent({
					force = false,
					name = "ensure_line_visible",
					direction = LUI.DIRECTION.vertical,
					line = arg_25_0._gridContentRowIndex
				})
			end
		end

		return true
	end

	return false
end

local function var_0_19(arg_26_0, arg_26_1)
	if arg_26_0.Header and arg_26_0.Header.ShowButtonPrompt then
		arg_26_0.Header:ShowButtonPrompt(false)
	end
end

local function var_0_20(arg_27_0)
	local var_27_0 = arg_27_0:getParent()

	if not var_27_0 then
		return
	end

	assert(var_27_0.SetPosition)

	local var_27_1, var_27_2 = var_27_0:GetRowBoundaries()
	local var_27_3 = arg_27_0:getHeight()
	local var_27_4 = arg_27_0:GetExpandedHeight()
	local var_27_5 = arg_27_0._gridContentRowIndex or 0
	local var_27_6 = LUI.clamp(var_27_1 - var_27_5, 0, 1)
	local var_27_7 = LUI.clamp(var_27_2 - var_27_5, 0, 1)
	local var_27_8 = var_27_0:GetNumRows()
	local var_27_9 = var_27_5 + 1

	if var_27_8 == nil or var_27_9 < var_27_8 then
		local var_27_10 = var_27_0:ConvertRowPixelToLine(var_27_9, -var_27_0:GetRowSpacing())

		if var_27_10 > 0 then
			var_27_9 = var_27_10
		end
	end

	local var_27_11 = var_27_3 / (var_27_9 - var_27_5)
	local var_27_12 = var_27_11 * var_27_6
	local var_27_13 = var_27_11 * var_27_7 - var_27_12
	local var_27_14 = arg_27_0.ChildrenContainer:GetCurrentAnchorsAndPositions()
	local var_27_15 = arg_27_0.ChildrenContainer:getHeight()
	local var_27_16 = math.max(var_27_12 - var_27_14.top, 0)
	local var_27_17 = math.min(var_27_16 + var_27_15, var_27_16 + var_27_13)
	local var_27_18 = 1 / (arg_27_0._rowHeight + arg_27_0._rowSpacing)

	if var_27_17 - var_27_16 < LUI.UIGrid.GRID_EPSILON or arg_27_0._numRows == 0 then
		local var_27_19 = arg_27_0.ChildrenContainer:getFirstChild()
		local var_27_20 = {}

		while var_27_19 do
			table.insert(var_27_20, var_27_19._expanderRow)

			var_27_19 = var_27_19:getNextSibling()
		end

		for iter_27_0, iter_27_1 in ipairs(var_27_20) do
			arg_27_0:FreeRow(iter_27_1)
		end

		local var_27_21 = -1

		if arg_27_0._firstVisibleLine ~= var_27_21 or arg_27_0._lastVisibleLine ~= var_27_21 then
			arg_27_0._firstVisibleLine = var_27_21
			arg_27_0._lastVisibleLine = var_27_21

			if arg_27_0._updateVisibleRange then
				arg_27_0:_updateVisibleRange(arg_27_0._firstVisibleLine, arg_27_0._lastVisibleLine)
			end
		end
	else
		local var_27_22 = LUI.clamp(math.floor(var_27_16 * var_27_18), 0, arg_27_0._numRows - 1)
		local var_27_23 = LUI.clamp(math.floor(var_27_17 * var_27_18), 0, arg_27_0._numRows - 1)
		local var_27_24 = {}

		for iter_27_2 = var_27_22, var_27_23 do
			var_27_24[iter_27_2] = true
		end

		local var_27_25 = arg_27_0.ChildrenContainer:getFirstChild()
		local var_27_26 = {}

		while var_27_25 do
			local var_27_27 = var_27_25:getNextSibling()

			if var_27_22 > var_27_25._expanderRow or var_27_23 < var_27_25._expanderRow or var_27_25._expanderRow >= arg_27_0._numRows then
				table.insert(var_27_26, var_27_25._expanderRow)
			else
				var_27_24[var_27_25._expanderRow] = false
			end

			var_27_25 = var_27_27
		end

		for iter_27_3, iter_27_4 in ipairs(var_27_26) do
			arg_27_0:FreeRow(iter_27_4)
		end

		for iter_27_5, iter_27_6 in pairs(var_27_24) do
			if iter_27_6 then
				local var_27_28 = arg_27_0:AllocateRow(iter_27_5)

				if arg_27_0._notify and arg_27_0._notify.row == iter_27_5 then
					arg_27_0._notify.callback(arg_27_0, var_27_28)

					arg_27_0._notify = nil
				end
			end
		end

		if arg_27_0._firstVisibleLine ~= var_27_22 or arg_27_0._lastVisibleLine ~= var_27_23 then
			arg_27_0._firstVisibleLine = var_27_22
			arg_27_0._lastVisibleLine = var_27_23

			if arg_27_0._updateVisibleRange then
				arg_27_0:_updateVisibleRange(var_27_22, var_27_23)
			end
		end
	end
end

local function var_0_21(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0._allocatedRows) do
		arg_28_0._refreshFunction(iter_28_1, iter_28_0)
	end
end

local function var_0_22(arg_29_0, arg_29_1)
	arg_29_0._numRows = arg_29_1

	arg_29_0:AdjustExpanderToContent()
	arg_29_0:UpdateChildren(arg_29_0)
end

local function var_0_23(arg_30_0)
	return arg_30_0._numRows
end

local function var_0_24(arg_31_0)
	local var_31_0 = arg_31_0.ChildrenContainer:GetCurrentAnchorsAndPositions()

	if arg_31_0:GetNumRows() == 0 then
		return arg_31_0:GetCollapsedHeight()
	else
		local var_31_1 = arg_31_0._numRows * (arg_31_0._rowHeight + arg_31_0._rowSpacing) - arg_31_0._rowSpacing + var_31_0.top

		if arg_31_0._isExpandButtonBelow then
			local var_31_2 = arg_31_0._expandButton:GetCurrentAnchorsAndPositions()

			var_31_1 = var_31_1 + (var_31_2.bottom - var_31_2.top) + arg_31_0._rowSpacing
		end

		return var_31_1
	end
end

local function var_0_25(arg_32_0)
	local var_32_0 = arg_32_0.ChildrenContainer:GetCurrentAnchorsAndPositions()

	return var_32_0.top - var_32_0.bottom
end

local function var_0_26(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0:GetCurrentAnchorsAndPositions()
	local var_33_1 = arg_33_0:IsExpanded() and arg_33_0:GetExpandedHeight() or arg_33_0:GetCollapsedHeight()
	local var_33_2 = var_33_1 < var_33_0.bottom - var_33_0.top and arg_33_0._collapseDuration or arg_33_0._expandDuration

	if arg_33_1 then
		var_33_2 = 0
	end

	arg_33_0:SetAnchorsAndPosition(var_33_0.leftAnchor, var_33_0.rightAnchor, var_33_0.topAnchor, var_33_0.bottomAnchor, var_33_0.left, var_33_0.right, var_33_0.top, var_33_0.top + var_33_1, var_33_2)

	if arg_33_0._isExpandButtonBelow then
		local var_33_3 = arg_33_0._expandButton:GetCurrentAnchorsAndPositions()
		local var_33_4 = var_33_3.bottom - var_33_3.top
		local var_33_5 = var_33_1 - var_33_4

		arg_33_0._expandButton:SetAnchorsAndPosition(var_33_3.leftAnchor, var_33_3.rightAnchor, var_33_3.topAnchor, var_33_3.bottomAnchor, var_33_3.left, var_33_3.right, var_33_5, var_33_5 + var_33_4, var_33_2)
	end
end

local function var_0_27(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_0._expanded == arg_34_1 and not arg_34_2 then
		return
	end

	arg_34_0._expanded = arg_34_1

	if arg_34_0._expandButton then
		if arg_34_0:IsExpanded() then
			ACTIONS.AnimateSequence(arg_34_0._expandButton, "Expanded")
		else
			ACTIONS.AnimateSequence(arg_34_0._expandButton, "Collapsed")
		end
	end

	local var_34_0 = arg_34_0.ChildrenContainer:getFirstInFocus()

	if var_34_0 then
		var_34_0:processEvent({
			name = "lose_focus"
		})
		;(arg_34_0._innerWidget or arg_34_0._expandButton):processEvent({
			name = "gain_focus"
		})
		arg_34_0:dispatchEventToParent({
			name = "ensure_line_visible",
			direction = LUI.DIRECTION.vertical,
			line = arg_34_0._gridContentRowIndex
		})
	end

	arg_34_0:AdjustExpanderToContent(arg_34_2)
end

local function var_0_28(arg_35_0, arg_35_1)
	var_0_27(arg_35_0, arg_35_1.name == "expander_expand", arg_35_1.force)
end

local function var_0_29(arg_36_0)
	local var_36_0 = arg_36_0.ChildrenContainer:getFirstChild()

	while var_36_0 do
		var_36_0 = var_36_0:getNextSibling(), arg_36_0:FreeRow(var_36_0._expanderRow)
	end

	assert(not next(arg_36_0._allocatedRows), "There's still some elements in the expander _allocatedRows but they should all have been freed.")
	LUI.UIElement.closeTree(arg_36_0)
end

local function var_0_30(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0._notify = {
		row = arg_37_1,
		callback = arg_37_2
	}
end

local function var_0_31(arg_38_0, arg_38_1)
	arg_38_0._updateVisibleRange = arg_38_1
end

local function var_0_32(arg_39_0, arg_39_1)
	arg_39_0:UpdateChildren()
end

local function var_0_33(arg_40_0, arg_40_1)
	if not arg_40_0:IsExpanded() then
		return
	end

	if arg_40_0._allocatedRows[arg_40_1] then
		arg_40_0._allocatedRows[arg_40_1]:processEvent({
			name = "gain_focus"
		})
	else
		arg_40_0:SetRowVisibleCallback(arg_40_1, function(arg_41_0, arg_41_1)
			arg_41_1:processEvent({
				name = "gain_focus"
			})
		end)
	end
end

local function var_0_34(arg_42_0, arg_42_1)
	local var_42_0 = {
		GetExpandedHeight = var_0_24,
		GetCollapsedHeight = var_0_25,
		ExpandOrCollapse = var_0_27,
		AdjustExpanderToContent = var_0_26,
		IsExpanded = var_0_3,
		UpdateChildren = var_0_20,
		RefreshContent = var_0_21,
		SetNumRows = var_0_22,
		GetNumRows = var_0_23,
		SetRowVisibleCallback = var_0_30,
		SetUpdateVisibleRangeCallback = var_0_31,
		FocusChild = var_0_33,
		GetFocusTargetPositionOffset = var_0_16,
		AllocateRow = var_0_13,
		FreeRow = var_0_14,
		closeTree = var_0_29,
		FocusNextElement = var_0_17,
		_rowHeight = arg_42_1.rowHeight,
		_rowSpacing = arg_42_1.rowSpacing,
		_numRows = arg_42_1.numRows,
		_expandButton = arg_42_1.expandButton,
		_footerHeight = arg_42_1.footerHeight,
		_buildFunction = arg_42_1.buildFunction,
		_refreshFunction = arg_42_1.refreshFunction,
		_updateVisibleRange = arg_42_1.updateVisibleRange,
		_allocatedRows = {},
		_collapseDuration = arg_42_1.collapseDuration or 125,
		_expandDuration = arg_42_1.expandDuration or 250,
		_isExpandButtonBelow = arg_42_1.isExpandButtonBelow
	}

	for iter_42_0, iter_42_1 in pairs(var_42_0) do
		arg_42_0[iter_42_0] = iter_42_1
	end
end

function LUI.AddGridOptimizedExpanderLogic(arg_43_0, arg_43_1, arg_43_2)
	assert(arg_43_2.rowHeight)
	assert(arg_43_2.rowSpacing)
	assert(arg_43_2.buildFunction)
	assert(arg_43_2.numRows)
	var_0_34(arg_43_0, arg_43_2)

	arg_43_0.PrepAndSendEnsureVisibleEvent = var_0_15

	arg_43_0:SetupLayoutUpdateEvent()
	arg_43_0:registerEventHandler("self_layout_updated", var_0_32)
	arg_43_0:registerEventHandler("expander_expand", var_0_28)
	arg_43_0:registerEventHandler("expander_collapse", var_0_28)
	arg_43_0:registerEventHandler("gain_focus", var_0_18)
	arg_43_0:registerEventHandler("lose_focus", var_0_19)
	arg_43_0:registerEventHandler("gamepad_button", var_0_7)
	arg_43_0:SetGridChildDynamicSize(true, LUI.DIRECTION.vertical)
	arg_43_0._expandButton:registerEventHandler("button_action", function(arg_44_0, arg_44_1)
		if arg_43_0:IsExpanded() then
			arg_43_0:processEvent({
				name = "expander_collapse"
			})
		else
			arg_43_0:processEvent({
				name = "expander_expand",
				focusFirstChild = not arg_44_1.mouse
			})
		end
	end)

	if arg_43_2.replaceDummyInnerWidget ~= nil then
		arg_43_0.InnerWidget = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = arg_43_1
		})

		local var_43_0 = arg_43_2.replaceDummyInnerWidget:GetCurrentAnchorsAndPositions()

		arg_43_0.InnerWidget:SetAnchorsAndPosition(var_43_0.leftAnchor, var_43_0.rightAnchor, var_43_0.topAnchor, var_43_0.bottomAnchor, var_43_0.left, var_43_0.right, var_43_0.top, var_43_0.bottom)

		if not arg_43_0.InnerWidget.id then
			arg_43_0.InnerWidget.id = "InnerWidget"
		end

		arg_43_0.InnerWidget.navigation = {}

		arg_43_0.InnerWidget:addElementAfter(arg_43_2.replaceDummyInnerWidget)
		arg_43_2.replaceDummyInnerWidget:closeTree()

		arg_43_2.replaceDummyInnerWidget = nil
		arg_43_0._innerWidget = arg_43_0.InnerWidget
	end

	arg_43_0.ChildrenContainer = LUI.UIElement.new()
	arg_43_0.ChildrenContainer.id = "ChildrenContainer"

	if arg_43_2.replaceDummyChildrenContainer then
		local var_43_1 = arg_43_0:GetCurrentAnchorsAndPositions()
		local var_43_2 = arg_43_2.replaceDummyChildrenContainer:GetCurrentAnchorsAndPositions()
		local var_43_3 = var_43_1.bottom - var_43_1.top

		var_43_2.bottom = var_43_2.bottom - var_43_3

		arg_43_0.ChildrenContainer:SetAnchorsAndPosition(var_43_2.leftAnchor, var_43_2.rightAnchor, 0, 0, var_43_2.left, var_43_2.right, var_43_2.top, var_43_2.bottom)
		arg_43_2.replaceDummyChildrenContainer:closeTree()

		arg_43_0[arg_43_2.replaceDummyChildrenContainer.id] = nil
		arg_43_2.replaceDummyChildrenContainer = nil
	else
		arg_43_0.ChildrenContainer:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, arg_43_0._rowSpacing + arg_43_0._expandButton:getHeight(), 0)
	end

	arg_43_0.ChildrenContainer:setUseStencil(true)
	arg_43_0:addElement(arg_43_0.ChildrenContainer)

	if arg_43_2.initiallyExpanded then
		arg_43_0:processEvent({
			force = true,
			name = "expander_expand",
			focusFirstChild = false
		})
	end
end

LUI.ExpanderUtils = {}

function LUI.ExpanderUtils.GetExpanderRowData(arg_45_0, arg_45_1)
	if not arg_45_0._savedRowData then
		arg_45_0._savedRowData = {}
	end

	if not arg_45_0._savedRowData[arg_45_1] then
		arg_45_0._savedRowData[arg_45_1] = {}
	end

	return arg_45_0._savedRowData[arg_45_1]
end

function LUI.ExpanderUtils.GetExpanderColumnData(arg_46_0, arg_46_1)
	if not arg_46_0._savedColumnData then
		arg_46_0._savedColumnData = {}
	end

	if not arg_46_0._savedColumnData[arg_46_1] then
		arg_46_0._savedColumnData[arg_46_1] = {}
	end

	return arg_46_0._savedColumnData[arg_46_1]
end

function LUI.ExpanderUtils.GenerateGridRefreshFunction()
	return function(arg_48_0, arg_48_1, arg_48_2)
		local var_48_0 = arg_48_0:getParent()

		if not var_48_0 then
			return
		end

		local var_48_1 = LUI.ExpanderUtils.GetExpanderRowData(var_48_0, arg_48_2).expanded and "expander_expand" or "expander_collapse"

		arg_48_0:processEvent({
			force = true,
			name = var_48_1
		})
	end
end

function LUI.ExpanderUtils.GenerateGridBuildFunction(arg_49_0, arg_49_1, arg_49_2)
	return function()
		local var_50_0 = MenuBuilder.BuildRegisteredType(arg_49_1, {
			controllerIndex = arg_49_0
		})
		local var_50_1 = arg_49_2

		if type(arg_49_2) == "function" then
			var_50_1 = arg_49_2(var_50_0)
		end

		LUI.AddGridOptimizedExpanderLogic(var_50_0, arg_49_0, var_50_1)

		local function var_50_2(arg_51_0, arg_51_1)
			local var_51_0 = arg_51_0:getParent()

			if not var_51_0 or not arg_51_0._gridContentRowIndex then
				return
			end

			LUI.ExpanderUtils.GetExpanderRowData(var_51_0, arg_51_0._gridContentRowIndex).expanded = arg_51_1.name == "expander_expand"
		end

		var_50_0:addEventHandler("expander_expand", var_50_2)
		var_50_0:addEventHandler("expander_collapse", var_50_2)

		return var_50_0
	end
end

function LUI.ExpanderUtils.GenerateMeasureRowFunction(arg_52_0)
	return function(arg_53_0, arg_53_1)
		local var_53_0 = arg_53_1:GetElementAtPosition(0, arg_53_0)

		if var_53_0 then
			local var_53_1 = var_53_0:getHeight()

			LUI.ExpanderUtils.GetExpanderRowData(arg_53_1, arg_53_0).height = var_53_1

			return var_53_1
		else
			local var_53_2 = LUI.ExpanderUtils.GetExpanderRowData(arg_53_1, arg_53_0)
			local var_53_3 = var_53_2 and var_53_2.height

			return var_53_3 ~= nil and var_53_3 or arg_52_0
		end
	end
end

function LUI.ExpanderUtils.GenerateMeasureColumnFunction(arg_54_0)
	return function(arg_55_0, arg_55_1)
		local var_55_0 = arg_55_1:GetElementAtPosition(arg_55_0, 0)

		if var_55_0 then
			local var_55_1 = var_55_0:getWidth()

			LUI.ExpanderUtils.GetExpanderColumnData(arg_55_1, arg_55_0).width = var_55_1

			return var_55_1
		else
			local var_55_2 = LUI.ExpanderUtils.GetExpanderColumnData(arg_55_1, arg_55_0)
			local var_55_3 = var_55_2 and var_55_2.width

			return var_55_3 ~= nil and var_55_3 or arg_54_0
		end
	end
end
