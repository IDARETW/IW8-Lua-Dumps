LUI.UIElement = LUI.Class()
LUI.UIElement.id = "LUIElement"

function LUI.UIElement.addElement(arg_1_0, arg_1_1)
	if arg_1_0:canAddElement(arg_1_1) then
		arg_1_0:addElementToC(arg_1_1)
	end
end

function LUI.UIElement.addElementBefore(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1:getParent()

	if not var_2_0 then
		error("LUI Error: Element has no parent!")

		return
	end

	if var_2_0:canAddElement(arg_2_0) then
		arg_2_0:addElementBeforeInC(arg_2_1)
	end
end

function LUI.UIElement.addElementAfter(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1:getParent()

	if not var_3_0 then
		error("LUI Error: Element has no parent!")

		return
	end

	if var_3_0:canAddElement(arg_3_0) then
		arg_3_0:addElementAfterInC(arg_3_1)
	end
end

function LUI.UIElement.RemoveElement(arg_4_0, arg_4_1)
	arg_4_0:RemoveElementInC(arg_4_1)
end

function LUI.UIElement.canAddElement(arg_5_0, arg_5_1)
	if arg_5_1 == nil then
		error("LUI Error: Tried to add nil element!")

		return false
	end

	if arg_5_1:getParent() == arg_5_0 then
		return false
	end

	return true
end

function LUI.UIElement.RemoveFromParent(arg_6_0)
	local var_6_0 = arg_6_0:getParent()

	if var_6_0 ~= nil then
		var_6_0:RemoveElement(arg_6_0)
	end
end

local function var_0_0(arg_7_0)
	if arg_7_0.m_eventHandlers.on_close then
		arg_7_0.m_eventHandlers.on_close(arg_7_0)
	end

	arg_7_0:UnsubscribeFromAllModels()
	arg_7_0:RemoveDataLinks()
	arg_7_0:RemoveFromParent()
	arg_7_0:ClearLastFocus()
end

function LUI.UIElement.closeChildren(arg_8_0)
	local var_8_0 = arg_8_0:getFirstChild()

	while var_8_0 do
		var_8_0 = var_8_0:getNextSibling(), var_8_0:closeTree()
	end
end

function LUI.UIElement.closeTree(arg_9_0)
	arg_9_0:closeChildren()
	var_0_0(arg_9_0)
end

function LUI.UIElement.getFullID(arg_10_0)
	local var_10_0 = arg_10_0.id
	local var_10_1 = arg_10_0:getParent()

	while var_10_1 do
		var_10_0 = var_10_1.id .. "/" .. var_10_0
		var_10_1 = var_10_1:getParent()
	end

	return var_10_0
end

function LUI.UIElement.getChildById(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:getFirstChild()

	while var_11_0 do
		if var_11_0.id == arg_11_1 then
			return var_11_0
		end

		var_11_0 = var_11_0:getNextSibling()
	end
end

function LUI.UIElement.isDescendentOf(arg_12_0, arg_12_1)
	if not arg_12_0 or not arg_12_1 then
		return false
	end

	local var_12_0 = arg_12_0

	while var_12_0 do
		if var_12_0 == arg_12_1 then
			return true
		end

		var_12_0 = var_12_0:getParent()
	end

	return false
end

function LUI.UIElement.getFirstDescendentById(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:getChildById(arg_13_1)

	if var_13_0 then
		return var_13_0
	end

	local var_13_1 = arg_13_0:getFirstChild()

	while var_13_1 do
		local var_13_2 = var_13_1:getFirstDescendentById(arg_13_1)

		if var_13_2 then
			return var_13_2
		end

		var_13_1 = var_13_1:getNextSibling()
	end
end

function LUI.UIElement.isIDNamed(arg_14_0)
	return type(arg_14_0.id) == "string" and arg_14_0.id ~= ""
end

function LUI.UIElement.isChildOf(arg_15_0, arg_15_1)
	if not arg_15_0 or not arg_15_1 then
		return false
	end

	local var_15_0 = arg_15_1:getFirstChild()

	while var_15_0 do
		if var_15_0 == arg_15_0 then
			return true
		end

		var_15_0 = var_15_0:getNextSibling()
	end

	return false
end

function LUI.UIElement.SetHandleMouse(arg_16_0, arg_16_1)
	arg_16_0.handleMouseMove = arg_16_1
	arg_16_0.handleMouseButton = arg_16_1
end

function LUI.UIElement.SetHandleMouseMove(arg_17_0, arg_17_1)
	arg_17_0.handleMouseMove = arg_17_1
end

function LUI.UIElement.SetHandleMouseButton(arg_18_0, arg_18_1)
	arg_18_0.handleMouseButton = arg_18_1
end

function LUI.UIElement.SetHandleMouseTree(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0:getFirstChild()

	while var_19_0 do
		var_19_0 = var_19_0:getNextSibling(), var_19_0:SetHandleMouseTree(arg_19_1)
	end

	arg_19_0:SetHandleMouse(arg_19_1)
end

function LUI.UIElement.SetMouseFocusBlocker(arg_20_0, arg_20_1)
	arg_20_0._blockMouseMove = arg_20_1
end

function LUI.UIElement.IsPositionInside(arg_21_0, arg_21_1, arg_21_2)
	assert(arg_21_1)
	assert(arg_21_2)

	local var_21_0 = false
	local var_21_1, var_21_2, var_21_3, var_21_4 = arg_21_0:getRect()

	if var_21_1 == nil or var_21_2 == nil or var_21_3 == nil or var_21_4 == nil then
		return var_21_0
	end

	if var_21_2 <= arg_21_2 and arg_21_2 <= var_21_4 and var_21_1 <= arg_21_1 and arg_21_1 <= var_21_3 then
		var_21_0 = true
	end

	return var_21_0
end

function LUI.UIElement.IsMouseHidden(arg_22_0)
	return arg_22_0.x == -1000 and arg_22_0.y == -1000
end

function LUI.UIElement.MouseMoveEvent(arg_23_0, arg_23_1)
	if not Engine.EABCCIBFIG() then
		return
	end

	if not Engine.DDJFBBJAIG() and not LUI.UIRoot.mouseInitialized then
		LUI.UIRoot.mouseInitialized = true

		return true
	end

	local var_23_0 = false

	arg_23_0:applyElementTransform()

	local var_23_1 = false

	if arg_23_0.handleMouseMove then
		local var_23_2
		local var_23_3

		if arg_23_1.focusStack then
			for iter_23_0, iter_23_1 in ipairs(arg_23_1.focusStack) do
				var_23_1 = var_23_1 or iter_23_1 == arg_23_0
			end
		end

		if var_23_1 then
			if arg_23_0:AcceptsFocusType(FocusType.MouseOver) and not arg_23_0:isInFocus() then
				arg_23_0:processEvent({
					name = "gain_focus",
					focusType = FocusType.MouseOver,
					controller = arg_23_1.controller
				})

				local var_23_4 = arg_23_0:getParent()

				if var_23_4:isIDNamed() then
					var_23_4.shouldSaveState = true
				end
			end

			if arg_23_0.m_mouseOver == nil then
				arg_23_0.m_mouseOver = true

				if arg_23_0.m_eventHandlers.mouseenter ~= nil then
					var_23_2, var_23_3 = ProjectRootCoordinate(arg_23_1.rootName, arg_23_1.x, arg_23_1.y)

					arg_23_0.m_eventHandlers.mouseenter(arg_23_0, {
						name = "mouseenter",
						controller = arg_23_1.controller,
						root = arg_23_1.root,
						x = var_23_2,
						y = var_23_3
					})
				end
			end
		elseif not arg_23_1.root.lockedFocusStack then
			if arg_23_0:isInFocus() then
				arg_23_0:processEvent({
					name = "lose_focus"
				})
			end

			if arg_23_0.m_mouseOver ~= nil then
				arg_23_0.m_mouseOver = nil

				if arg_23_0.m_eventHandlers.mouseleave ~= nil then
					var_23_2, var_23_3 = ProjectRootCoordinate(arg_23_1.rootName, arg_23_1.x, arg_23_1.y)

					arg_23_0.m_eventHandlers.mouseleave(arg_23_0, {
						name = "mouseleave",
						controller = arg_23_1.controller,
						root = arg_23_1.root,
						x = var_23_2,
						y = var_23_3
					})
				end
			end
		end

		if arg_23_0.m_leftMouseDown ~= nil and arg_23_0.m_eventHandlers.mousedrag ~= nil then
			if not var_23_2 then
				var_23_2, var_23_3 = ProjectRootCoordinate(arg_23_1.rootName, arg_23_1.x, arg_23_1.y)
			end

			arg_23_0.m_eventHandlers.mousedrag(arg_23_0, {
				name = "mousedrag",
				controller = arg_23_1.controller,
				root = arg_23_1.root,
				x = var_23_2,
				y = var_23_3,
				mouse_outside = not var_23_1
			})
		end
	end

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.BeginFocusChainItem(arg_23_0, arg_23_1, var_23_1, arg_23_0.handleMouseButton, arg_23_0._blockMouseMove)
	end

	arg_23_0:dispatchEventToAllChildrenNoDispatch(arg_23_1)

	if LUI.FocusDebug ~= nil then
		LUI.FocusDebug.EndFocusChainItem()
	end

	if arg_23_0.shouldSaveState then
		arg_23_0:saveState()

		arg_23_0.shouldSaveState = nil
	end

	arg_23_0:undoElementTransform()

	return true
end

function LUI.UIElement.MouseButtonEvent(arg_24_0, arg_24_1)
	local var_24_0 = false

	if arg_24_0.handleMouseButton then
		arg_24_1.root = LUI.UIRoot.GetRootFromName(arg_24_1.rootName)

		local var_24_1 = arg_24_1.button .. arg_24_1.name
		local var_24_2 = arg_24_1.name == "mousedown"

		if var_24_2 ~= (arg_24_1.button == "right" and arg_24_0.m_rightMouseDown or arg_24_1.button == "left" and arg_24_0.m_leftMouseDown or arg_24_0.m_middleMouseDown) then
			if arg_24_1.button == "right" then
				arg_24_0.m_rightMouseDown = var_24_2 or nil
			elseif arg_24_1.button == "left" then
				arg_24_0.m_leftMouseDown = var_24_2 or nil
			else
				arg_24_0.m_middleMouseDown = var_24_2 or nil
			end

			if arg_24_0.m_eventHandlers[var_24_1] then
				var_24_0 = arg_24_0.m_eventHandlers[var_24_1](arg_24_0, {
					name = var_24_1,
					controller = arg_24_1.controller,
					root = arg_24_1.root,
					x = arg_24_1.mouseX,
					y = arg_24_1.mouseY,
					inside = arg_24_1.inside
				})
			end
		end
	end

	return var_24_0
end

function LUI.UIElement.PopupActive(arg_25_0, arg_25_1)
	arg_25_0.m_leftMouseDown = nil
end

function LUI.UIElement.GetNextFocusableElement(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	assert(type(arg_26_0) == "userdata")
	assert(type(arg_26_1) == "userdata")

	if arg_26_0.navigation and arg_26_0.navigation[arg_26_2] then
		return arg_26_0.navigation[arg_26_2]
	end

	return nil
end

function LUI.UIElement.FocusNextElement(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5)
	local var_27_0, var_27_1 = arg_27_0:GetNextFocusableElement(arg_27_1, arg_27_2, arg_27_3, arg_27_4)

	if var_27_0 then
		arg_27_1:processEvent({
			name = "lose_focus",
			controller = arg_27_5
		})
		var_27_0:processEvent({
			name = "gain_focus",
			controller = arg_27_5,
			focusType = arg_27_3,
			direction = arg_27_2,
			isWrap = var_27_1
		})

		local var_27_2 = arg_27_1:getParent()

		if var_27_2 and var_27_0:getParent() == var_27_2 then
			var_27_2:saveState()
		end

		return true
	else
		local var_27_3 = arg_27_0:getParent()

		if var_27_3 then
			return var_27_3:FocusNextElement(arg_27_0, arg_27_2, arg_27_3, arg_27_4, arg_27_5)
		end

		return false
	end
end

function LUI.UIElement.AcceptsFocusType(arg_28_0, arg_28_1)
	return false
end

function LUI.UIElement.TreeCanFocus(arg_29_0, arg_29_1)
	if arg_29_0:AcceptsFocusType(arg_29_1) then
		return true
	end

	local var_29_0 = arg_29_0:getFirstChild()

	while var_29_0 do
		if var_29_0:TreeCanFocus(arg_29_1) then
			return true
		end

		var_29_0 = var_29_0:getNextSibling()
	end

	return false
end

function LUI.UIElement.OverrideMouseCursorType(arg_30_0, arg_30_1)
	arg_30_0._mouseCursorTypeOverride = arg_30_1
end

function LUI.UIElement.isParentInFocus(arg_31_0)
	local var_31_0 = arg_31_0:getParent()

	if var_31_0 and var_31_0:isInFocus() then
		return true
	else
		return false
	end
end

function LUI.UIElement.getFirstInFocus(arg_32_0)
	if arg_32_0:isInFocus() then
		return arg_32_0
	end

	local var_32_0 = arg_32_0:getFirstChild()

	while var_32_0 do
		local var_32_1 = var_32_0:getFirstInFocus()

		if var_32_1 then
			return var_32_1
		end

		var_32_0 = var_32_0:getNextSibling()
	end
end

function LUI.UIElement.getAllFocusedChildren(arg_33_0, arg_33_1)
	arg_33_1 = arg_33_1 or {}

	local var_33_0 = arg_33_0:getFirstChild()

	while var_33_0 do
		local var_33_1 = var_33_0:getNextSibling()

		if var_33_0:isInFocus() then
			arg_33_1[#arg_33_1 + 1] = var_33_0
		else
			arg_33_1 = var_33_0:getAllFocusedChildren(arg_33_1)
		end

		var_33_0 = var_33_1
	end

	return arg_33_1
end

function LUI.UIElement.SetActiveParentBehavior(arg_34_0)
	arg_34_0:registerEventHandler("request_active", function(arg_35_0, arg_35_1)
		local var_35_0 = arg_35_1.target

		if var_35_0 ~= arg_35_0._activeElement then
			if arg_35_0._activeElement then
				arg_35_0._activeElement:processEvent({
					name = "lose_focus"
				})
				arg_35_0._activeElement:RemoveActive(arg_35_1)
			end

			if var_35_0 then
				var_35_0:SetActive()
			end

			arg_35_0._activeElement = var_35_0
		end

		return true
	end)
end

function LUI.UIElement.HasEventHandler(arg_36_0, arg_36_1)
	return arg_36_0.m_eventHandlers[arg_36_1] ~= nil
end

function LUI.UIElement.processEvent(arg_37_0, arg_37_1)
	local var_37_0 = Engine.CICDHFEABA() and arg_37_1.name

	if var_37_0 then
		local var_37_1 = type(arg_37_0.id) == "userdata" and "id userdata" or arg_37_0.id

		Engine.DJAFAHJFED(var_37_1 .. ":" .. arg_37_1.name or "event")
	end

	local var_37_2
	local var_37_3 = arg_37_0.m_eventHandlers[arg_37_1.name]

	if var_37_3 ~= nil then
		local var_37_4 = var_37_3(arg_37_0, arg_37_1)

		var_37_4 = (not var_37_4 or arg_37_1.dispatchChildren) and arg_37_0:dispatchEventToChildren(arg_37_1) or var_37_4
		var_37_2 = var_37_4
	else
		var_37_2 = arg_37_0:dispatchEventToChildren(arg_37_1)
	end

	if var_37_0 then
		Engine.BJCDJGCFJJ()
	end

	return var_37_2
end

function LUI.UIElement.processEventNoDispatch(arg_38_0, arg_38_1)
	local var_38_0 = Engine.CICDHFEABA() and arg_38_1.name

	if var_38_0 then
		local var_38_1 = type(arg_38_0.id) == "userdata" and "id userdata" or arg_38_0.id

		Engine.DJAFAHJFED(var_38_1 .. ":" .. arg_38_1.name or "event")
	end

	local var_38_2
	local var_38_3 = arg_38_0.m_eventHandlers[arg_38_1.name]

	if var_38_3 ~= nil then
		var_38_2 = var_38_3(arg_38_0, arg_38_1)
	end

	if var_38_0 then
		Engine.BJCDJGCFJJ()
	end

	return var_38_2
end

function LUI.UIElement.dispatchEventToParent(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:getParent()

	while var_39_0 do
		local var_39_1 = var_39_0.m_eventHandlers[arg_39_1.name]

		if var_39_1 then
			if arg_39_1.dispatchChildren then
				var_39_0:dispatchEventToChildren(arg_39_1)
			end

			return var_39_1(var_39_0, arg_39_1)
		end

		var_39_0 = var_39_0:getParent()
	end
end

function LUI.UIElement.dispatchEventToCurrentMenu(arg_40_0, arg_40_1)
	return arg_40_0:GetCurrentMenu():processEvent(arg_40_1)
end

function LUI.UIElement.GetCurrentMenu(arg_41_0)
	return LUI.FlowManager.GetCurrentMenu(arg_41_0)
end

function LUI.UIElement.dispatchEventToChildren(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0:getFirstChild()

	while var_42_0 do
		local var_42_1 = var_42_0:getNextSibling()
		local var_42_2 = var_42_0:processEvent(arg_42_1)

		if var_42_2 then
			return var_42_2
		end

		var_42_0 = var_42_1
	end
end

function LUI.UIElement.dispatchEventToAllChildren(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0:getFirstChild()

	while var_43_0 do
		var_43_0 = var_43_0:getNextSibling(), (var_43_0:processEvent(arg_43_1))
	end
end

function LUI.UIElement.dispatchEventToAllChildrenNoDispatch(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0:getFirstChild()

	while var_44_0 do
		var_44_0 = var_44_0:getNextSibling(), (var_44_0:processEventNoDispatch(arg_44_1))
	end
end

function LUI.UIElement.dispatchEventToRoot(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_0:getRootParent()

	LUI.UIRoot.ProcessEvent(var_45_0, arg_45_1)
end

function LUI.UIElement.dispatchEventToAllRoots(arg_46_0, arg_46_1)
	for iter_46_0, iter_46_1 in pairs(LUI.roots) do
		iter_46_1:processEvent(arg_46_1)
	end
end

function LUI.UIElement.dispatchEventToAllOtherRoots(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:getRootParent()

	for iter_47_0, iter_47_1 in pairs(LUI.roots) do
		if var_47_0 ~= iter_47_1 and iter_47_1 ~= LUI.primaryRoot then
			iter_47_1:processEvent(arg_47_1)
		end
	end
end

function LUI.UIElement.registerEventHandler(arg_48_0, arg_48_1, arg_48_2)
	arg_48_0.m_eventHandlers[arg_48_1] = arg_48_2

	if not arg_48_0.isaroot and EventCatcher.isDirectDispatchEventType(arg_48_1) then
		arg_48_0:getRootParent().eventCatcher:registerDirectDispatchHandler(arg_48_0, arg_48_1, arg_48_2)
	end
end

function LUI.UIElement.registerAndCallEventHandler(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	arg_49_0:registerEventHandler(arg_49_1, arg_49_2)

	if arg_49_3 then
		arg_49_3.name = arg_49_1
	else
		arg_49_3 = {
			name = arg_49_1
		}
	end

	arg_49_2(arg_49_0, arg_49_3)
end

function LUI.UIElement.registerOmnvarHandler(arg_50_0, arg_50_1, arg_50_2)
	assert(not arg_50_0.isaroot)
	arg_50_0:getRootParent().eventCatcher:registerOmnvarHandler(arg_50_0, arg_50_1, arg_50_2)
end

function LUI.UIElement.registerEventHandlerIfFree(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_0.m_eventHandlers[arg_51_1] == nil then
		arg_51_0:registerEventHandler(arg_51_1, arg_51_2)
	end
end

local function var_0_1(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0
	local var_52_1 = arg_52_1

	return function(arg_53_0, arg_53_1)
		local var_53_0
		local var_53_1
		local var_53_2 = var_52_0(arg_53_0, arg_53_1)
		local var_53_3 = var_52_1(arg_53_0, arg_53_1)

		return var_53_2 or var_53_3
	end
end

function LUI.UIElement.addEventHandler(arg_54_0, arg_54_1, arg_54_2)
	if arg_54_0.m_eventHandlers[arg_54_1] then
		arg_54_0:registerEventHandler(arg_54_1, var_0_1(arg_54_0.m_eventHandlers[arg_54_1], arg_54_2))
	else
		arg_54_0:registerEventHandler(arg_54_1, arg_54_2)
	end
end

function LUI.UIElement.addAndCallEventHandler(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	arg_55_0:addEventHandler(arg_55_1, arg_55_2)

	if arg_55_3 then
		arg_55_3.name = arg_55_1
	else
		arg_55_3 = {
			name = arg_55_1
		}
	end

	arg_55_2(arg_55_0, arg_55_3)
end

function LUI.UIElement.getRootParent(arg_56_0)
	return Engine.DBFFAEEFGJ()
end

function LUI.UIElement.getRootController(arg_57_0)
	return arg_57_0:getRootParent():GetControllerIndex()
end

function LUI.UIElement.RegisterAnimationSequence(arg_58_0, arg_58_1, arg_58_2)
	arg_58_0.sequences = arg_58_0.sequences or {}
	arg_58_0.sequences[arg_58_1] = arg_58_2
end

function LUI.UIElement.AnimateLoop(arg_59_0, arg_59_1)
	if not arg_59_0.sequences or not arg_59_0.sequences[arg_59_1] then
		DebugPrint("Tried to loop an unregistered sequence " .. arg_59_1 .. ".")
	else
		local var_59_0 = arg_59_0.sequences[arg_59_1]

		if var_59_0 and var_59_0[1] and var_59_0[1][1] and type(var_59_0[1][1]) == "function" then
			for iter_59_0, iter_59_1 in ipairs(var_59_0) do
				arg_59_0:PlaySequenceInternal(iter_59_1, true)
			end
		elseif var_59_0 and var_59_0[1] and type(var_59_0[1]) == "table" then
			arg_59_0:PlaySequenceNative(var_59_0, true)
		end
	end
end

function LUI.UIElement.AnimateSequence(arg_60_0, arg_60_1)
	if not arg_60_0.sequences or not arg_60_0.sequences[arg_60_1] then
		DebugPrint("Tried to animate to unregistered sequence " .. arg_60_1 .. ".")
	else
		local var_60_0 = arg_60_0.sequences[arg_60_1]

		if var_60_0 and var_60_0[1] and var_60_0[1][1] and type(var_60_0[1][1]) == "function" then
			for iter_60_0, iter_60_1 in ipairs(var_60_0) do
				arg_60_0:PlaySequenceInternal(iter_60_1, false)
			end
		elseif var_60_0 and var_60_0[1] and type(var_60_0[1]) == "table" then
			arg_60_0:PlaySequenceNative(var_60_0, false)
		end
	end
end

local var_0_2

local function var_0_3(arg_61_0, arg_61_1, arg_61_2)
	arg_61_1 = arg_61_1 + 1

	if arg_61_1 > #arg_61_0 then
		if arg_61_2 and #arg_61_0 > 1 then
			arg_61_1 = 1
		else
			return
		end
	end

	assert(type(arg_61_0[arg_61_1]) == "function")

	local var_61_0 = arg_61_0[arg_61_1]()

	if var_61_0 then
		assert(type(var_61_0) == "userdata")

		function var_61_0.onComplete()
			var_0_3(arg_61_0, arg_61_1, arg_61_2)
		end
	else
		var_0_3(arg_61_0, arg_61_1, arg_61_2)
	end
end

function LUI.UIElement.PlaySequenceInternal(arg_63_0, arg_63_1, arg_63_2)
	assert(type(arg_63_1) == "table")
	assert(#arg_63_1 > 0)
	assert(type(arg_63_1[1]) == "function")
	var_0_3(arg_63_1, 0, arg_63_2)
end

function LUI.UIElement.saveState(arg_64_0)
	if not arg_64_0:isIDNamed() then
		error("LUI Error: Tried to save menu state, but element has no name: " .. arg_64_0:getFullID())

		return nil
	end

	local var_64_0 = {}
	local var_64_1 = arg_64_0:getAllFocusedChildren()

	for iter_64_0, iter_64_1 in ipairs(var_64_1) do
		if not iter_64_1:isIDNamed() then
			error("LUI Error: Tried to save menu state, but focused element has no name: " .. iter_64_1:getFullID())

			return nil
		end

		table.insert(var_64_0, {
			id = iter_64_1.id,
			data = iter_64_1.saveData
		})
	end

	arg_64_0._savedState = var_64_0

	return var_64_0
end

function LUI.UIElement.clearSavedState(arg_65_0)
	arg_65_0._savedState = nil
end

function LUI.UIElement.restoreState(arg_66_0, arg_66_1, arg_66_2, arg_66_3, arg_66_4)
	if not arg_66_0:isIDNamed() then
		error("LUI Error: Tried to restore menu state, but element has no name: " .. arg_66_0:getFullID())

		return
	end

	local var_66_0 = false
	local var_66_1 = 0
	local var_66_2 = arg_66_1 or arg_66_0._savedState

	if var_66_2 then
		var_66_0 = true

		for iter_66_0, iter_66_1 in ipairs(var_66_2) do
			if iter_66_1.id and arg_66_0:processEvent({
				name = "restore_focus",
				id = iter_66_1.id,
				data = iter_66_1.data,
				isRefresh = arg_66_3,
				controller = arg_66_2,
				direction = arg_66_4
			}) then
				var_66_1 = var_66_1 + 1
			end
		end
	end

	return var_66_0, var_66_1
end

function LUI.UIElement.restoreFocus(arg_67_0, arg_67_1)
	if arg_67_0.id == arg_67_1.id and arg_67_0:TreeCanFocus(FocusType.MenuFlow) then
		if not arg_67_1.isRefresh or arg_67_1.isRefresh and not arg_67_0._isRefresh then
			arg_67_0:processEvent({
				name = "gain_focus",
				focusType = FocusType.MenuFlow,
				controller = arg_67_1.controller,
				direction = arg_67_1.direction
			})
		end

		return true
	end
end

function LUI.UIElement.findSoundAlias(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_0

	while var_68_0 do
		if var_68_0.soundSet and SOUND_SETS[var_68_0.soundSet] and SOUND_SETS[var_68_0.soundSet][arg_68_1] then
			return SOUND_SETS[var_68_0.soundSet][arg_68_1]
		end

		var_68_0 = var_68_0:getParent()
	end

	return SOUND_SETS.default[arg_68_1]
end

function LUI.UIElement.PlaySoundInternal(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = Engine.BJDBIAGIDA(arg_69_1)

	if arg_69_2 then
		if arg_69_0.soundIDs == nil then
			arg_69_0.soundIDs = {}
		end

		arg_69_0.soundIDs[arg_69_1] = var_69_0
	end
end

function LUI.UIElement.playSound(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
	local var_70_0 = arg_70_0:findSoundAlias(arg_70_1)

	if var_70_0 then
		local var_70_1
		local var_70_2

		if arg_70_3 and arg_70_3 > 0 then
			local var_70_3 = arg_70_0:Wait(arg_70_3)

			var_70_2 = arg_70_0:Wait(arg_70_3)

			function var_70_3.onComplete()
				arg_70_0:PlaySoundInternal(var_70_0, arg_70_2)
			end
		else
			arg_70_0:PlaySoundInternal(var_70_0, arg_70_2)
		end

		if arg_70_3 then
			return var_70_2
		else
			return true
		end
	end
end

function LUI.UIElement.stopSound(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_0:findSoundAlias(arg_72_1)

	if arg_72_0.soundIDs and arg_72_0.soundIDs[var_72_0] then
		Engine.EAGBECEBGA(arg_72_0.soundIDs[var_72_0])

		arg_72_0.soundIDs[var_72_0] = nil

		return true
	end
end

function LUI.UIElement.AddButtonHelperTextToElement(arg_73_0, arg_73_1, arg_73_2)
	assert((arg_73_2.button_ref or arg_73_2.button_ref2) and arg_73_2.helper_text, "AddButtonHelperText requires both a button_ref and a helper_text.")

	arg_73_2.name = arg_73_2.name or "add_button_helper_text"

	arg_73_1:processEvent(arg_73_2)

	arg_73_0._helperTextAdditions = arg_73_0._helperTextAdditions or {}

	if arg_73_2.button_ref then
		arg_73_0._helperTextAdditions[arg_73_2.button_ref] = true
	end

	if arg_73_2.button_ref2 then
		arg_73_0._helperTextAdditions[arg_73_2.button_ref2] = true
	end
end

function LUI.UIElement.AddButtonHelperText(arg_74_0, arg_74_1)
	arg_74_0:AddButtonHelperTextToElement(arg_74_0:GetCurrentMenu(), arg_74_1)
end

function LUI.UIElement.SetupContextualMenu(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_1 and arg_75_1.title
	local var_75_1 = arg_75_1 and arg_75_1.battlenetData

	arg_75_0._contextualMenuData = {
		title = var_75_0,
		battlenetData = var_75_1,
		buttonsData = {}
	}
end

function LUI.UIElement.AddContextualMenuAction(arg_76_0, arg_76_1)
	assert(arg_76_0._contextualMenuData, "Called AddContextualMenuAction without calling SetupContextualMenu first")
	assert(arg_76_1.isSeparator or arg_76_1.id, "Called AddContextualMenuAction without an id, every new actions need to have an associated id that should also be added to MetricsUtility.lua and dlog_routes.dlog")

	local var_76_0 = {
		actionName = arg_76_1.actionName,
		actionFunction = arg_76_1.actionFunction,
		actionParams = arg_76_1.actionParams,
		conditionFunction = arg_76_1.conditionFunction,
		conditionParams = arg_76_1.conditionParams,
		id = arg_76_1.id,
		isSeparator = arg_76_1.isSeparator
	}

	table.insert(arg_76_0._contextualMenuData.buttonsData, var_76_0)
end

function LUI.UIElement.RemoveButtonHelperTextFromElement(arg_77_0, arg_77_1, arg_77_2, arg_77_3)
	assert(arg_77_2, "RemoveButtonHelperText requires a valid buttonRef value")

	if arg_77_0._helperTextAdditions and arg_77_0._helperTextAdditions[arg_77_2] then
		arg_77_1:processEvent({
			name = "add_button_helper_text",
			helper_text = "",
			button_ref = arg_77_2,
			side = arg_77_3
		})

		arg_77_0._helperTextAdditions[arg_77_2] = nil
	end
end

function LUI.UIElement.RemoveButtonHelperText(arg_78_0, arg_78_1, arg_78_2)
	arg_78_0:RemoveButtonHelperTextFromElement(arg_78_0:GetCurrentMenu(), arg_78_1, arg_78_2)
end

function LUI.UIElement.AddTooltipData(arg_79_0, arg_79_1, arg_79_2)
	arg_79_0._tooltipData = {
		title = arg_79_2.tooltipTitle,
		description = arg_79_2.tooltipDescription,
		promptsData = arg_79_2.promptsData,
		horizontalAlignment = arg_79_2.horizontalAlignment,
		verticalAlignment = arg_79_2.verticalAlignment
	}

	LUI.MouseCursorTooltipLayer.AddTooltipMouseHandlerToElement(arg_79_0)

	if arg_79_2.focusableChildrenRefresh then
		LUI.MouseCursorTooltipLayer.AddTootlipMouseHandlerToFocusableChildren(arg_79_0)
	end

	arg_79_0:registerEventHandler("on_close", function(arg_80_0)
		if arg_79_0._tooltipData then
			local var_80_0 = Engine.DBFFAEEFGJ().cursor

			if var_80_0 then
				local var_80_1 = var_80_0._controllerIndex

				if var_80_1 then
					LUI.MouseCursorTooltipLayer.TooltipElementClosed(var_80_1, arg_80_0)
				end
			end
		end
	end)
end

function LUI.UIElement.RefreshTooltipData(arg_81_0, arg_81_1, arg_81_2)
	assert(arg_81_0._tooltipData, "Called RefreshTooltipData without calling AddTooltipData first")

	arg_81_0._tooltipData.title = arg_81_2.tooltipTitle or arg_81_0._tooltipData.title or nil
	arg_81_0._tooltipData.description = arg_81_2.tooltipDescription or arg_81_0._tooltipData.description or nil
	arg_81_0._tooltipData.promptsData = arg_81_2.promptsData or arg_81_0._tooltipData.promptsData or nil
	arg_81_0._tooltipData.horizontalAlignment = arg_81_2.horizontalAlignment or arg_81_0._tooltipData.horizontalAlignment or nil
	arg_81_0._tooltipData.verticalAlignment = arg_81_2.verticalAlignment or arg_81_0._tooltipData.verticalAlignment or nil

	LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_81_1)
end

function LUI.UIElement.RemoveToolTipData(arg_82_0)
	arg_82_0._tooltipData = nil
end

function LUI.UIElement.GetDebuggerInfo(arg_83_0, arg_83_1)
	local var_83_0 = "LUIElement = {"
	local var_83_1, var_83_2, var_83_3, var_83_4 = arg_83_0:getLocalRect()

	if var_83_1 and var_83_2 and var_83_3 and var_83_4 then
		var_83_0 = var_83_0 .. "localRect = { left = " .. var_83_1 .. ", right = " .. var_83_3 .. ", top = " .. var_83_2 .. ", bottom = " .. var_83_4 .. " },"
	end

	local var_83_5, var_83_6, var_83_7, var_83_8 = arg_83_0:getCurrentGlobalRect()

	if var_83_5 and var_83_6 and var_83_7 and var_83_8 then
		var_83_0 = var_83_0 .. "globalRect = { left = " .. var_83_5 .. ", right = " .. var_83_7 .. ", top = " .. var_83_6 .. ", bottom = " .. var_83_8 .. " },"
	end

	local var_83_9, var_83_10, var_83_11, var_83_12 = arg_83_0:getRect()

	if var_83_9 and var_83_10 and var_83_11 and var_83_12 then
		var_83_0 = var_83_0 .. "screenSpaceRect = { left = " .. var_83_9 .. ", right = " .. var_83_11 .. ", top = " .. var_83_10 .. ", bottom = " .. var_83_12 .. " },"
	end

	if arg_83_0.GetAnchorData then
		local var_83_13, var_83_14, var_83_15, var_83_16 = arg_83_0:GetAnchorData()

		if var_83_13 and var_83_15 and var_83_14 and var_83_16 then
			var_83_0 = var_83_0 .. "anchors = { left = " .. var_83_13 .. ", right = " .. var_83_14 .. ", top = " .. var_83_15 .. ", bottom = " .. var_83_16 .. " },"
		end
	end

	local var_83_17, var_83_18, var_83_19, var_83_20 = arg_83_0:getCurrentRGBA()
	local var_83_21 = var_83_0 .. "color = { red = " .. var_83_17 .. ", green = " .. var_83_18 .. ",blue = " .. var_83_19 .. ", alpha = " .. var_83_20 .. "},"
	local var_83_22 = arg_83_0:GetScale()
	local var_83_23 = var_83_21 .. "scale = " .. var_83_22 .. ","
	local var_83_24 = arg_83_0:getHeight()
	local var_83_25 = arg_83_0:getWidth()
	local var_83_26 = var_83_23 .. "dimensions = { height = " .. var_83_24 .. ", width = " .. var_83_25 .. "},"
	local var_83_27, var_83_28, var_83_29 = arg_83_0:GetRotation()
	local var_83_30 = var_83_26 .. "rotation = { x = " .. var_83_27 .. ", y = " .. var_83_28 .. ", z = " .. var_83_29 .. "},"
	local var_83_31 = arg_83_0:GetDepth()
	local var_83_32 = var_83_30 .. "depth = " .. var_83_31 .. ","
	local var_83_33 = {
		[0] = "GFX_MATERIAL_BLEND_OVERRIDE_DISABLED",
		"GFX_MATERIAL_BLEND_OVERRIDE_REPLACE",
		"GFX_MATERIAL_BLEND_OVERRIDE_BLEND",
		"GFX_MATERIAL_BLEND_OVERRIDE_ADD",
		"GFX_MATERIAL_BLEND_OVERRIDE_PREMUL",
		"GFX_MATERIAL_BLEND_OVERRIDE_MULTIPLY",
		"GFX_MATERIAL_BLEND_OVERRIDE_ADDWITHALPHA"
	}
	local var_83_34 = arg_83_0:GetBlendMode()
	local var_83_35 = var_83_32 .. "blendMode = '" .. var_83_33[var_83_34] .. "',"

	if arg_83_0:Is3DTransform() or arg_83_0:GetIsQuadCacheDisabled() then
		var_83_35 = var_83_35 .. "usageFlags = {"

		if arg_83_0:Is3DTransform() then
			var_83_35 = var_83_35 .. "TRANSFORM_3D = true,"
		end

		if arg_83_0:GetIsQuadCacheDisabled() then
			var_83_35 = var_83_35 .. "DISABLE_QUADCACHE = true,"
		end

		var_83_35 = var_83_35 .. "}"
	end

	local var_83_36 = var_83_35 .. "}"

	arg_83_1[#arg_83_1 + 1] = var_83_36
end

function LUI.UIElement.SetupImageTableStreamer(arg_84_0, arg_84_1, arg_84_2)
	if arg_84_0.isStreamer == nil then
		arg_84_0.isStreamer = true
	end

	arg_84_0:SetupImageStreamer(arg_84_1, arg_84_2 and true or false)
end

function LUI.UIElement.GetStreamedImageTable(arg_85_0)
	local var_85_0 = {}
	local var_85_1 = arg_85_0:GetStreamedImageNameTable()

	for iter_85_0 = 1, #var_85_1 do
		table.insert(var_85_0, RegisterMaterial(var_85_1[iter_85_0]))
	end

	return var_85_0
end

function LUI.UIElement.GetStreamingImageNameTable(arg_86_0)
	return arg_86_0:GetStreamedImageTable()
end

DataLink = LUI.Class()
DataLink.TYPES = {
	gridDataSource = 2,
	model = 0,
	dataSourceCallback = 4,
	selfDataSource = 1,
	tabManagerDataSource = 3
}

function DataLink.init(arg_87_0, arg_87_1)
	assert(type(arg_87_1.source) == "userdata")
	assert(type(arg_87_1.target) == "userdata")
	assert(arg_87_1.source ~= arg_87_1.target or arg_87_1.type == DataLink.TYPES.model or arg_87_1.type == DataLink.TYPES.dataSourceCallback)

	arg_87_0._source = arg_87_1.source
	arg_87_0._target = arg_87_1.target
	arg_87_0._relativeDataSourcePath = {}
	arg_87_0._callback = arg_87_1.callback
	arg_87_0._type = arg_87_1.type

	if arg_87_1.relativeDataSourcePath then
		arg_87_0._relativeDataSourcePath = LUI.Split(arg_87_1.relativeDataSourcePath, "\\.")
	end

	arg_87_0._source._dataLinksAsSource = arg_87_0._source._dataLinksAsSource or {}
	arg_87_0._target._dataLinksAsTarget = arg_87_0._target._dataLinksAsTarget or {}
end

function DataLink.Refresh(arg_88_0)
	if arg_88_0._subscription then
		arg_88_0._target:UnsubscribeFromModel(arg_88_0._subscription)

		arg_88_0._subscription = nil
	end

	local var_88_0, var_88_1 = arg_88_0._source:GetDataSource()

	if var_88_0 then
		assert(type(var_88_1) == "number")

		local var_88_2 = var_88_0

		if #arg_88_0._relativeDataSourcePath > 0 then
			for iter_88_0, iter_88_1 in ipairs(arg_88_0._relativeDataSourcePath) do
				assert(var_88_2[iter_88_1])

				var_88_2 = var_88_2[iter_88_1]
			end
		end

		if arg_88_0._type == DataLink.TYPES.model then
			local var_88_3 = var_88_2:GetModel(var_88_1)

			if var_88_3 then
				arg_88_0._subscription = arg_88_0._target:SubscribeToModel(var_88_3, arg_88_0._callback)
			end
		elseif arg_88_0._type == DataLink.TYPES.selfDataSource then
			arg_88_0._target:SetDataSource(var_88_2, var_88_1)
		elseif arg_88_0._type == DataLink.TYPES.gridDataSource then
			arg_88_0._target:SetGridDataSource(var_88_2)
		elseif arg_88_0._type == DataLink.TYPES.tabManagerDataSource then
			arg_88_0._target:SetTabManagerDataSource(var_88_2)
		elseif arg_88_0._type == DataLink.TYPES.dataSourceCallback then
			arg_88_0._callback(var_88_2)

			if arg_88_0.unlinkOnCallback then
				arg_88_0:Unlink()
			end
		else
			assert(false)
		end
	end
end

function DataLink.Link(arg_89_0)
	for iter_89_0, iter_89_1 in pairs(arg_89_0._target._dataLinksAsTarget) do
		if iter_89_0._type == arg_89_0._type and arg_89_0._type ~= DataLink.TYPES.model and arg_89_0._type ~= DataLink.TYPES.dataSourceCallback then
			iter_89_0:Unlink()
		end
	end

	arg_89_0._source._dataLinksAsSource[arg_89_0] = true
	arg_89_0._target._dataLinksAsTarget[arg_89_0] = true
end

function DataLink.Unlink(arg_90_0)
	if arg_90_0._subscription then
		arg_90_0._target:UnsubscribeFromModel(arg_90_0._subscription)

		arg_90_0._subscription = nil
	end

	arg_90_0._source._dataLinksAsSource[arg_90_0] = nil
	arg_90_0._target._dataLinksAsTarget[arg_90_0] = nil
end

function LUI.UIElement.GetDataSource(arg_91_0)
	return arg_91_0._dataSource, arg_91_0._dataSourceControllerIndex
end

function LUI.UIElement.SetDataSource(arg_92_0, arg_92_1, arg_92_2)
	assert(type(arg_92_2) == "number" or arg_92_1 == nil)

	arg_92_0._dataSource = arg_92_1
	arg_92_0._dataSourceControllerIndex = arg_92_2

	if arg_92_0._dataLinksAsSource then
		local var_92_0 = LUI.ShallowCopy(arg_92_0._dataLinksAsSource)

		for iter_92_0, iter_92_1 in pairs(var_92_0) do
			iter_92_0:Refresh()
		end
	end
end

function LUI.UIElement.SubscribeToModel(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	arg_93_0._subscriptions = arg_93_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_93_0._subscriptions:SubscribeToModel(arg_93_1, arg_93_2, arg_93_3)
end

function LUI.UIElement.UnsubscribeFromModel(arg_94_0, arg_94_1)
	if arg_94_0._subscriptions then
		return arg_94_0._subscriptions:UnsubscribeFromModel(arg_94_1)
	end
end

function LUI.UIElement.RemoveDataLinks(arg_95_0)
	if arg_95_0._dataLinksAsTarget then
		for iter_95_0, iter_95_1 in pairs(arg_95_0._dataLinksAsTarget) do
			iter_95_0._source._dataLinksAsSource[iter_95_0] = nil
			iter_95_0._target._dataLinksAsTarget[iter_95_0] = nil
		end
	end

	if arg_95_0._dataLinksAsSource then
		for iter_95_2, iter_95_3 in pairs(arg_95_0._dataLinksAsSource) do
			iter_95_2._source._dataLinksAsSource[iter_95_2] = nil
			iter_95_2._target._dataLinksAsTarget[iter_95_2] = nil
		end
	end
end

function LUI.UIElement.UnsubscribeFromAllModels(arg_96_0)
	if arg_96_0._subscriptions then
		arg_96_0._subscriptions:UnsubscribeFromAllModels()
	end

	if arg_96_0._dataLinksAsSource then
		for iter_96_0, iter_96_1 in pairs(arg_96_0._dataLinksAsSource) do
			if iter_96_0._subscription then
				iter_96_0._target:UnsubscribeFromModel(iter_96_0._subscription)
			end
		end
	end
end

function LUI.UIElement.SubscribeToDataSourceThroughElement(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	local var_97_0 = DataLink.new({
		target = arg_97_0,
		source = arg_97_1,
		relativeDataSourcePath = arg_97_2,
		callback = arg_97_3,
		type = DataLink.TYPES.dataSourceCallback
	})

	var_97_0:Link()
	var_97_0:Refresh()

	return var_97_0
end

function LUI.UIElement.SubscribeToModelThroughElement(arg_98_0, arg_98_1, arg_98_2, arg_98_3)
	local var_98_0 = DataLink.new({
		target = arg_98_0,
		source = arg_98_1,
		relativeDataSourcePath = arg_98_2,
		callback = arg_98_3,
		type = DataLink.TYPES.model
	})

	var_98_0:Link()
	var_98_0:Refresh()

	return var_98_0
end

function LUI.UIElement.SetDataSourceThroughElement(arg_99_0, arg_99_1, arg_99_2)
	local var_99_0 = DataLink.new({
		target = arg_99_0,
		source = arg_99_1,
		relativeDataSourcePath = arg_99_2,
		type = DataLink.TYPES.selfDataSource
	})

	var_99_0:Link()
	var_99_0:Refresh()

	return var_99_0
end

function LUI.UIElement.UnsubscribeFromModelThroughElement(arg_100_0, arg_100_1)
	local var_100_0 = arg_100_1

	assert(var_100_0._target == arg_100_0)
	var_100_0:Unlink()
end

function LUI.UIElement.BindAlphaToModel(arg_101_0, arg_101_1)
	arg_101_0._subscriptions = arg_101_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_101_0._subscriptions:BindElementAlphaToModel(arg_101_0, arg_101_1)
end

function LUI.UIElement.BindColorToModel(arg_102_0, arg_102_1)
	arg_102_0._subscriptions = arg_102_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_102_0._subscriptions:BindElementColorToModel(arg_102_0, arg_102_1)
end

function LUI.UIElement.BindScaleToModel(arg_103_0, arg_103_1)
	arg_103_0._subscriptions = arg_103_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_103_0._subscriptions:BindElementScaleToModel(arg_103_0, arg_103_1)
end

function LUI.UIElement.BindZRotationToModel(arg_104_0, arg_104_1)
	arg_104_0._subscriptions = arg_104_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_104_0._subscriptions:BindElementZRotationToModel(arg_104_0, arg_104_1)
end

function LUI.UIElement.BindLeftToModel(arg_105_0, arg_105_1)
	arg_105_0._subscriptions = arg_105_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_105_0._subscriptions:BindElementLeftToModel(arg_105_0, arg_105_1)
end

function LUI.UIElement.BindRightToModel(arg_106_0, arg_106_1)
	arg_106_0._subscriptions = arg_106_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_106_0._subscriptions:BindElementRightToModel(arg_106_0, arg_106_1)
end

function LUI.UIElement.BindTopToModel(arg_107_0, arg_107_1)
	arg_107_0._subscriptions = arg_107_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_107_0._subscriptions:BindElementTopToModel(arg_107_0, arg_107_1)
end

function LUI.UIElement.BindBottomToModel(arg_108_0, arg_108_1)
	arg_108_0._subscriptions = arg_108_0._subscriptions or LUI.SubscriptionsHolder.new()

	return arg_108_0._subscriptions:BindElementBottomToModel(arg_108_0, arg_108_1)
end

function LUI.UIElement.build(arg_109_0, arg_109_1)
	return (LUI.UIElement.new())
end

function LUI.UIElement.allocate()
	return (ConstructLUIElement())
end

function LUI.UIElement.init(arg_111_0)
	arg_111_0._scoped = LUI.ActiveScoped
	arg_111_0.m_eventHandlers = {}
	arg_111_0.m_references = {}

	if Engine.EABCCIBFIG() then
		arg_111_0:registerEventHandler("mousemove", LUI.UIElement.MouseMoveEvent)
		arg_111_0:registerEventHandler("mousedown", LUI.UIElement.MouseButtonEvent)
		arg_111_0:registerEventHandler("mouseup", LUI.UIElement.MouseButtonEvent)
		arg_111_0:registerEventHandler("popup_active", LUI.UIElement.PopupActive)
	end

	arg_111_0:registerEventHandler("restore_focus", LUI.UIElement.restoreFocus)
end
