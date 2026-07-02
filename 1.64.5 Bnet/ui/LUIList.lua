LUI.List = LUI.Class(LUI.UIElement)
LUI.UIHorizontalList = LUI.Class(LUI.List)
LUI.UIHorizontalNavigator = LUI.Class(LUI.List)
LUI.UIHorizontalStackedLayout = LUI.Class(LUI.List)
LUI.UIVerticalNavigator = LUI.Class(LUI.List)
LUI.UIVerticalList = LUI.Class(LUI.List)
LUI.UIVerticalStackedLayout = LUI.Class(LUI.List)

function LUI.List.init(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or {}

	local var_1_0 = arg_1_1.autoLayout ~= false
	local var_1_1 = arg_1_1.handleNavigation ~= false
	local var_1_2 = arg_1_1.direction

	assert(var_1_2 == LUI.DIRECTION.horizontal or var_1_2 == LUI.DIRECTION.vertical)
	LUI.List.super.init(arg_1_0, arg_1_1)

	if Engine.BHICADFIHA() then
		arg_1_0._isList = true
	end

	if var_1_0 then
		arg_1_0:SetupStackedLayout(arg_1_1)

		if arg_1_1.direction == LUI.DIRECTION.horizontal then
			if arg_1_1.horizontalAlignment then
				arg_1_0:SetAlignment(arg_1_1.horizontalAlignment)
			end
		elseif arg_1_1.verticalAlignment then
			arg_1_0:SetVerticalAlignment(arg_1_1.verticalAlignment)
		end
	end

	if var_1_1 then
		arg_1_0._handleNavigation = true
		arg_1_0._permittedQualifiers = arg_1_1.permittedQualifiers or {}

		if var_1_2 == LUI.DIRECTION.vertical then
			arg_1_0._previous = "up"
			arg_1_0._next = "down"
			arg_1_0._orthogonalPrevious = "left"
			arg_1_0._orthogonalNext = "right"
			arg_1_0._firstCoord = "top"
			arg_1_0._secondCoord = "bottom"
		else
			arg_1_0._previous = "left"
			arg_1_0._next = "right"
			arg_1_0._orthogonalPrevious = "up"
			arg_1_0._orthogonalNext = "down"
			arg_1_0._firstCoord = "left"
			arg_1_0._secondCoord = "right"
		end

		arg_1_0:registerEventHandler("gain_focus", function(arg_2_0, arg_2_1)
			return arg_2_0:GainFocus(arg_2_1)
		end)
	end
end

function LUI.List.addElement(arg_3_0, arg_3_1)
	LUI.List.super.addElement(arg_3_0, arg_3_1)
end

function LUI.List.RemoveElement(arg_4_0, arg_4_1)
	LUI.List.super.RemoveElement(arg_4_0, arg_4_1)
end

function LUI.List.addElementBefore(arg_5_0, arg_5_1)
	LUI.List.super.addElementBefore(arg_5_0, arg_5_1)
end

function LUI.List.addElementAfter(arg_6_0, arg_6_1)
	LUI.List.super.addElementAfter(arg_6_0, arg_6_1)
end

function LUI.List.SetNoWrap(arg_7_0, arg_7_1)
	arg_7_0._noWrap = arg_7_1
end

function LUI.List.SetForceDefaultFocus(arg_8_0, arg_8_1)
	arg_8_0._forceDefaultFocus = arg_8_1
end

function LUI.List.SetDefaultFocus(arg_9_0, arg_9_1)
	arg_9_0._defaultFocus = arg_9_1
end

function LUI.List.GetDefaultFocus(arg_10_0)
	if type(arg_10_0._defaultFocus) == "function" then
		return arg_10_0._defaultFocus()
	else
		return arg_10_0._defaultFocus
	end
end

function LUI.List.GainFocus(arg_11_0, arg_11_1)
	if not arg_11_0._forceDefaultFocus then
		local var_11_0, var_11_1 = arg_11_0:restoreState(nil, arg_11_1.controller, false, arg_11_1.direction)

		if var_11_1 > 0 then
			return true
		end
	end

	local var_11_2 = arg_11_0:GetDefaultFocus()

	if var_11_2 then
		local var_11_3 = arg_11_0:GetElementAtIndex(var_11_2)

		if var_11_3 then
			var_11_3:processEvent(arg_11_1)

			return true
		end
	end

	local var_11_4
	local var_11_5 = arg_11_0:getFirstChild()

	while var_11_5 do
		if var_11_5.listDefaultFocus then
			var_11_4 = var_11_5

			break
		end

		var_11_5 = var_11_5:getNextSibling()
	end

	if var_11_4 then
		var_11_4:processEvent(arg_11_1)

		return true
	end

	return arg_11_0:dispatchEventToChildren(arg_11_1)
end

function LUI.List.GetNextFocusableElement(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	if not arg_12_0._handleNavigation then
		return LUI.List.super.GetNextFocusableElement(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	end

	local var_12_0 = arg_12_1
	local var_12_1

	if #arg_12_0._permittedQualifiers > 0 and not LUI.IsItemInArray(arg_12_0._permittedQualifiers, arg_12_4) then
		return nil
	end

	local var_12_2

	while var_12_0 do
		if arg_12_2 == arg_12_0._next then
			if var_12_0 == arg_12_0:getLastChild() and not arg_12_0._noWrap then
				var_12_0 = arg_12_0:getFirstChild()
				var_12_2 = true
			else
				var_12_0 = var_12_0:getNextSibling()
			end
		elseif arg_12_2 == arg_12_0._previous then
			if var_12_0 == arg_12_0:getFirstChild() and not arg_12_0._noWrap then
				var_12_0 = arg_12_0:getLastChild()
				var_12_2 = true
			else
				var_12_0 = var_12_0:getPreviousSibling()
			end
		else
			break
		end

		if var_12_0 == arg_12_1 then
			break
		end

		if var_12_0 and var_12_0:TreeCanFocus(arg_12_3) then
			return var_12_0, var_12_2
		end
	end

	return LUI.List.super.GetNextFocusableElement(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
end

function LUI.List.GetElementAtIndex(arg_13_0, arg_13_1)
	local var_13_0 = 1
	local var_13_1 = arg_13_0:getFirstChild()

	while var_13_1 do
		if arg_13_1 == var_13_0 then
			return var_13_1
		end

		var_13_0 = var_13_0 + 1
		var_13_1 = var_13_1:getNextSibling()
	end
end

function LUI.List.GetLastElement(arg_14_0)
	local var_14_0 = arg_14_0:getFirstChild()
	local var_14_1 = var_14_0

	while var_14_0 do
		var_14_1 = var_14_0
		var_14_0 = var_14_0:getNextSibling()
	end

	return var_14_1
end

function LUI.List.GetIndexForElement(arg_15_0, arg_15_1)
	local var_15_0 = 1
	local var_15_1 = arg_15_0:getFirstChild()

	while var_15_1 do
		if var_15_1 == arg_15_1 then
			return var_15_0
		end

		var_15_0 = var_15_0 + 1
		var_15_1 = var_15_1:getNextSibling()
	end

	return nil
end

function LUI.List.GetFocusedElementIndex(arg_16_0)
	local var_16_0 = 1
	local var_16_1 = arg_16_0:getFirstChild()

	while var_16_1 do
		if var_16_1:isInFocus() then
			return var_16_0
		end

		var_16_0 = var_16_0 + 1
		var_16_1 = var_16_1:getNextSibling()
	end

	return nil
end

function LUI.UIHorizontalList.init(arg_17_0, arg_17_1)
	arg_17_1 = arg_17_1 or {}
	arg_17_1.direction = LUI.DIRECTION.horizontal
	arg_17_1.handleNavigation = true
	arg_17_1.autoLayout = true

	LUI.UIHorizontalList.super.init(arg_17_0, arg_17_1)
end

function LUI.UIHorizontalNavigator.init(arg_18_0, arg_18_1)
	arg_18_1 = arg_18_1 or {}
	arg_18_1.direction = LUI.DIRECTION.horizontal
	arg_18_1.handleNavigation = true
	arg_18_1.autoLayout = false

	LUI.UIHorizontalNavigator.super.init(arg_18_0, arg_18_1)
end

function LUI.UIHorizontalStackedLayout.init(arg_19_0, arg_19_1)
	arg_19_1 = arg_19_1 or {}
	arg_19_1.direction = LUI.DIRECTION.horizontal
	arg_19_1.handleNavigation = false
	arg_19_1.autoLayout = true

	LUI.UIHorizontalStackedLayout.super.init(arg_19_0, arg_19_1)
end

function LUI.UIVerticalList.init(arg_20_0, arg_20_1)
	arg_20_1 = arg_20_1 or {}
	arg_20_1.direction = LUI.DIRECTION.vertical
	arg_20_1.handleNavigation = true
	arg_20_1.autoLayout = true

	LUI.UIVerticalList.super.init(arg_20_0, arg_20_1)
end

function LUI.UIVerticalNavigator.init(arg_21_0, arg_21_1)
	arg_21_1 = arg_21_1 or {}
	arg_21_1.direction = LUI.DIRECTION.vertical
	arg_21_1.handleNavigation = true
	arg_21_1.autoLayout = false

	LUI.UIVerticalNavigator.super.init(arg_21_0, arg_21_1)
end

function LUI.UIVerticalStackedLayout.init(arg_22_0, arg_22_1)
	arg_22_1 = arg_22_1 or {}
	arg_22_1.direction = LUI.DIRECTION.vertical
	arg_22_1.handleNavigation = false
	arg_22_1.autoLayout = true

	LUI.UIVerticalStackedLayout.super.init(arg_22_0, arg_22_1)
end

function LUI.UIHorizontalList.build(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIHorizontalList.new({})

	var_23_0:SetNoWrap(arg_23_1.noWrap)

	return var_23_0
end

function LUI.UIVerticalList.build(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIVerticalList.new(arg_24_1)

	var_24_0:SetNoWrap(arg_24_1.noWrap)

	return var_24_0
end
