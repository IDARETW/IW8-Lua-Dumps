module(..., package.seeall)

local var_0_0 = 9
local var_0_1 = 4
local var_0_2 = 7
local var_0_3 = _1080p * 10

local function var_0_4(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._dropdownState = false
	LUI.FlowManager.GetScopedData(arg_1_0)._dropdownPreviousFocusedPosition = nil

	if arg_1_2.parent.dropdownButtonList and arg_1_2.parent.listBackground and arg_1_2.parent.closingBackground then
		arg_1_2.parent.dropdownButtonList:dispatchEventToParent({
			name = "redirect_button_event_to_target"
		})
		arg_1_2.parent.dropdownButtonList:closeTree()

		arg_1_2.parent.dropdownButtonList = nil

		arg_1_2.parent.listBackground:closeTree()

		arg_1_2.parent.listBackground = nil

		arg_1_2.parent.closingBackground:closeTree()

		arg_1_2.parent.closingBackground = nil

		arg_1_2.parent.buttonListVScrollbar:closeTree()

		arg_1_2.parent.buttonListVScrollbar = nil
	end
end

local function var_0_5(arg_2_0, arg_2_1, arg_2_2)
	arg_2_2.action(arg_2_0, {
		index = arg_2_0.defaultValue
	}, arg_2_1)
end

local function var_0_6(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:dispatchEventToParent({
		name = "dropdown_closed",
		target = arg_3_0
	})

	if not arg_3_2.mouse then
		arg_3_0:getParent():processEvent({
			name = "gain_focus",
			controller = arg_3_1
		})
	end

	if arg_3_0.onRefresh then
		arg_3_0.onRefresh(arg_3_0, arg_3_1, arg_3_0.defaultValue, arg_3_3)
	end
end

local function var_0_7(arg_4_0, arg_4_1)
	local var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_0.dropdownButton:getCurrentGlobalRect()
	local var_4_4, var_4_5, var_4_6, var_4_7 = arg_4_1.parent:getCurrentGlobalRect()
	local var_4_8 = math.min(arg_4_0._maxVisibleRows, #arg_4_0.labels)
	local var_4_9 = arg_4_0.dropdownButton:getHeight() * var_4_8 + var_0_3

	if var_4_7 < var_4_3 + var_4_9 then
		var_4_3 = var_4_1
		var_4_1 = var_4_1 - var_4_9
		arg_4_0._isOpenTop = true
	else
		var_4_1 = var_4_1 + arg_4_0.dropdownButton:getHeight()
		var_4_3 = var_4_3 + var_4_9
		arg_4_0._isOpenTop = false
	end

	local var_4_10 = var_4_2 + var_0_2

	return var_4_0 - var_4_4, var_4_10 - var_4_4, var_4_1 - var_4_5, var_4_3 - var_4_5
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_0.applyable == true then
		arg_5_3.action(arg_5_0, {
			index = arg_5_1.row
		}, arg_5_2)
	end

	arg_5_0.defaultValue = arg_5_1.value

	arg_5_0.dropdownButton.Text:setText(arg_5_1.Text:getText())
	var_0_6(arg_5_0, arg_5_2, arg_5_3, true)
end

local function var_0_9(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
	local var_6_0
	local var_6_1
	local var_6_2
	local var_6_3

	if arg_6_2 == "up" then
		var_6_2 = LUI.DIRECTION.vertical
		var_6_3 = -1
	elseif arg_6_2 == "down" then
		var_6_2 = LUI.DIRECTION.vertical
		var_6_3 = 1
	elseif arg_6_2 == "left" then
		var_6_2 = LUI.DIRECTION.horizontal
		var_6_3 = -1
	elseif arg_6_2 == "right" then
		var_6_2 = LUI.DIRECTION.horizontal
		var_6_3 = 1
	end

	if var_6_2 and var_6_3 then
		var_6_0, var_6_1 = arg_6_0:GetNextFocusablePosition(var_6_2, var_6_3)
	end

	if var_6_0 then
		arg_6_0:AdjustFocusedTargetPosition(var_6_0, arg_6_2, var_6_1)

		local var_6_4 = arg_6_0._alwaysSnap or var_6_1 and arg_6_0._snapOnWrap

		arg_6_0:SetFocusedPosition(var_6_0, var_6_4 == true, nil, var_6_1)
		arg_6_0:FocusMoved(arg_6_2)
		arg_6_0:saveState()

		return true
	end

	return false
end

local function var_0_10(arg_7_0, arg_7_1)
	if arg_7_1.down and arg_7_1.qualifier ~= "mousewheel" and (arg_7_1.button == "up" or arg_7_1.button == "down" or arg_7_1.button == "left" or arg_7_1.button == "right") and not arg_7_0._childInFocus then
		local var_7_0 = LUI.FlowManager.GetScopedData(arg_7_0)

		arg_7_0:SetFocusedPosition(var_7_0._dropdownPreviousFocusedPosition or {
			x = 0,
			y = 0
		}, arg_7_0._alwaysSnap, nil, false)
	end

	return true
end

local function var_0_11(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0
	local var_8_1 = arg_8_1

	return function(arg_9_0, arg_9_1)
		local var_9_0
		local var_9_1
		local var_9_2 = var_8_0(arg_9_0, arg_9_1)
		local var_9_3 = var_8_1(arg_9_0, arg_9_1)

		return var_9_2 or var_9_3
	end
end

local function var_0_12(arg_10_0, arg_10_1, arg_10_2)
	if CONDITIONS.IsSplitscreen() then
		arg_10_0._maxVisibleRows = 4
	else
		arg_10_0._maxVisibleRows = 5
	end

	local var_10_0 = LUI.UIGrid.new({
		adjustSizeToContent = true,
		maxVisibleColumns = 1,
		wrapY = false,
		maxRows = 100,
		maxVisibleRows = arg_10_0._maxVisibleRows,
		controllerIndex = arg_10_1
	})

	var_10_0.FocusNextElement = var_0_9

	local var_10_1 = var_10_0.m_eventHandlers.gamepad_button

	if var_10_1 then
		var_10_0:registerEventHandler("gamepad_button", var_0_11(var_0_10, var_10_1))
	else
		var_10_0:registerEventHandler("gamepad_button", var_0_10)
	end

	local var_10_2, var_10_3, var_10_4, var_10_5 = var_0_7(arg_10_0, arg_10_2)

	if IsLanguageArabic() then
		var_10_2 = var_10_2 - _1080p * 11
		var_10_3 = var_10_3 - _1080p * 11
	end

	for iter_10_0 = 1, #arg_10_0.labels do
		local var_10_6 = MenuBuilder.BuildRegisteredType(arg_10_2.buttonListType, {
			controllerIndex = arg_10_1
		})

		var_10_6.id = "DropdownButton" .. iter_10_0

		var_10_6.Text:setText(arg_10_0.labels[iter_10_0])

		var_10_6.row = iter_10_0
		var_10_6.value = iter_10_0

		var_10_6.Text:SetAlignment(LUI.Alignment.Left)
		var_10_6:SetLeft(var_10_2 + var_0_0)
		var_10_6:SetRight(var_10_3 - var_0_0)
		var_10_6:SetBottom(arg_10_0.dropdownButton:getHeight())

		if iter_10_0 == arg_10_0.defaultValue then
			var_10_0:SetDefaultFocus({
				x = 0,
				y = iter_10_0 - 1
			})

			var_10_6._selected = true

			if not IsLanguageArabic() then
				ACTIONS.AnimateSequence(var_10_6, "Selected")
			else
				ACTIONS.AnimateSequence(var_10_6, "SelectedAR")
			end

			if arg_10_0.alwaysShowDefault then
				ACTIONS.AnimateSequence(var_10_6, "NotificationOff")
			end
		else
			var_10_6._selected = false

			ACTIONS.AnimateSequence(var_10_6, "NotSelected")

			if arg_10_0.alwaysShowDefault and iter_10_0 == arg_10_0.defaultOptionValue then
				if not IsLanguageArabic() then
					ACTIONS.AnimateSequence(var_10_6, "NotificationOn")
				else
					ACTIONS.AnimateSequence(var_10_6, "NotificationOnAR")
				end
			end
		end

		var_10_6:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			var_0_8(arg_10_0, arg_11_0, arg_10_1, arg_10_2)

			return true
		end)
		var_10_6:addEventHandler("button_up", function(arg_12_0, arg_12_1)
			var_10_0:RemoveFocusFromChild(var_10_0._alwaysSnap)

			if arg_12_0._selected then
				ACTIONS.AnimateSequence(arg_12_0, "ButtonUpSelected")
			else
				ACTIONS.AnimateSequence(arg_12_0, "ButtonUp")
			end
		end)
		var_10_6:addEventHandler("button_over", function(arg_13_0, arg_13_1)
			local var_13_0 = LUI.FlowManager.GetScopedData(arg_13_0)
			local var_13_1 = {
				x = 0,
				y = arg_13_0.row - 1
			}

			var_13_0._dropdownPreviousFocusedPosition = var_13_1

			var_10_0:SetFocusedPosition(var_13_1, var_10_0._alwaysSnap, false, false)

			if arg_10_0.onRefresh then
				arg_10_0.onRefresh(arg_10_0, arg_10_1, arg_13_0.row)
			end
		end)
		var_10_0:AddElement(var_10_6)
	end

	local var_10_7 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = arg_10_1
	})

	var_10_7.id = "closingBackground"

	var_10_7:SetAlpha(0)
	var_10_7:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	ACTIONS.ScaleFullscreen(var_10_7)
	arg_10_2.parent:addElement(var_10_7)

	arg_10_2.parent.closingBackground = var_10_7

	arg_10_2.parent.closingBackground:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		var_0_6(arg_10_0, arg_10_1, arg_10_2)

		return true
	end)

	local var_10_8
	local var_10_9 = MenuBuilder.BuildRegisteredType("GenericDropdownBackground", {
		controllerIndex = arg_10_1
	})

	var_10_9.id = "ListBackground"

	var_10_9:SetAnchorsAndPosition(0, 1, 0, 1, var_10_2, var_10_3, var_10_4, var_10_5)
	arg_10_2.parent:addElement(var_10_9)

	arg_10_2.parent.listBackground = var_10_9
	var_10_0.id = "DropdownButtonList"

	var_10_0:setUseStencil(true)
	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, var_10_2 + var_0_0, var_10_3 - var_0_0, var_10_4 + var_0_3 / 2, var_10_5 - var_0_3 / 2)
	arg_10_2.parent:addElement(var_10_0)

	arg_10_2.parent.dropdownButtonList = var_10_0

	arg_10_2.parent.dropdownButtonList:SetActiveParentBehavior()
	var_10_0:SetHandleMouse(true)
	var_10_0:dispatchEventToParent({
		name = "redirect_button_event_to_target",
		target = var_10_0
	})
	var_10_0:registerEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		var_0_6(arg_10_0, arg_10_1, arg_10_2)

		return true
	end)
	var_10_0:addEventHandler("gamepad_button", function(arg_16_0, arg_16_1)
		if arg_16_1.button == "shoulderl" or arg_16_1.button == "shoulderr" then
			var_0_6(arg_10_0, arg_10_1, arg_10_2)
		elseif arg_16_1.button == "secondary" then
			var_0_6(arg_10_0, arg_10_1, arg_10_2)

			return true
		end
	end)

	local var_10_10
	local var_10_11 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_10_1
	})

	var_10_11.id = "buttonListDropdownVScrollbar"

	var_10_11:SetAnchorsAndPosition(0, 1, 0, 1, var_10_3 - var_0_1, var_10_3, var_10_4, var_10_5)
	arg_10_2.parent:addElement(var_10_11)

	arg_10_2.parent.buttonListVScrollbar = var_10_11

	local var_10_12 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_10_11,
		startCap = var_10_11.startCap,
		endCap = var_10_11.endCap,
		sliderArea = var_10_11.sliderArea,
		slider = var_10_11.sliderArea and var_10_11.sliderArea.slider,
		fixedSizeSlider = var_10_11.sliderArea and var_10_11.sliderArea.fixedSizeSlider,
		mouseWheelTarget = arg_10_2.parent.dropdownButtonList
	})

	arg_10_2.parent.dropdownButtonList:AddScrollbar(var_10_12)
end

local function var_0_13(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0._dropdownState = true

	arg_17_0:dispatchEventToParent({
		name = "dropdown_opened",
		target = arg_17_0
	})
	var_0_12(arg_17_0, arg_17_1, arg_17_2)

	if not arg_17_2.mouse then
		arg_17_0:getParent():processEvent({
			name = "lose_focus",
			controller = arg_17_1
		})
		arg_17_2.parent.dropdownButtonList:processEvent({
			name = "gain_focus",
			controller = arg_17_1
		})
	end
end

local function var_0_14(arg_18_0, arg_18_1, arg_18_2)
	if not arg_18_0._dropdownState then
		var_0_13(arg_18_0, arg_18_1, arg_18_2)
	else
		var_0_6(arg_18_0, arg_18_1, arg_18_2)
	end
end

local function var_0_15(arg_19_0, arg_19_1)
	arg_19_0.labels = arg_19_1

	local var_19_0 = arg_19_0:GetCurrentMenu()

	for iter_19_0 = 1, #arg_19_0.labels do
		if iter_19_0 == arg_19_0.defaultValue then
			arg_19_0.dropdownButton.Text:setText(arg_19_0.labels[iter_19_0])
		end

		if var_19_0.dropdownButtonList then
			local var_19_1 = var_19_0.dropdownButtonList:GetElementAtPosition(0, iter_19_0 - 1)

			if var_19_1 then
				var_19_1.Text:setText(arg_19_0.labels[iter_19_0])
			end
		end
	end
end

local function var_0_16(arg_20_0, arg_20_1)
	arg_20_0.labels = arg_20_1
end

local function var_0_17(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = MenuBuilder.BuildRegisteredType(arg_21_2.buttonType, {
		controllerIndex = arg_21_1
	})

	var_21_0.id = "DropdownButton"
	arg_21_0.defaultValueGetter = arg_21_2.defaultValueGetter
	arg_21_0.valueGetter = arg_21_2.valueGetter
	arg_21_0.onRefresh = arg_21_2.onRefresh
	arg_21_0.onReset = arg_21_2.onReset
	arg_21_0.labels = arg_21_2.labels
	arg_21_0.defaultValue = arg_21_2.defaultValue
	arg_21_0.onDependencyParentRefresh = arg_21_2.onDependencyParentRefresh
	arg_21_0.alwaysShowDefault = arg_21_2.alwaysShowDefault
	arg_21_0.applyable = arg_21_2.applyable == true

	if arg_21_0.alwaysShowDefault then
		arg_21_0.defaultOptionValue = arg_21_0.defaultValueGetter(arg_21_1)
	end

	local var_21_1 = ""

	for iter_21_0 = 1, #arg_21_0.labels do
		if iter_21_0 == arg_21_0.defaultValue then
			var_21_1 = arg_21_0.labels[iter_21_0]

			break
		end
	end

	var_21_0.Text:setText(var_21_1)

	if IsLanguageArabic() then
		var_21_0.Text:SetLeft(_1080p * 40)
		var_21_0.Text:SetRight(_1080p * -10)
	else
		var_21_0.Text:SetLeft(_1080p * 10)
		var_21_0.Text:SetRight(_1080p * -35)
	end

	var_21_0.Text:SetAlignment(LUI.Alignment.Left)
	var_21_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_21_0:addElement(var_21_0)

	arg_21_0.dropdownButton = var_21_0

	arg_21_0.dropdownButton:addEventHandler("button_action", function(arg_22_0, arg_22_1)
		if arg_22_1.mouse == true then
			arg_21_2.mouse = true
		else
			arg_21_2.mouse = false
		end

		var_0_14(arg_21_0, arg_21_1, arg_21_2)
	end)

	function arg_21_0.SetCurrentValue(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
		for iter_23_0 = 1, #arg_23_0.labels do
			if iter_23_0 == arg_23_2 then
				arg_23_0.dropdownButton.Text:setText(arg_23_0.labels[arg_23_2])

				if arg_23_0.applyable == false then
					arg_21_2.action(arg_23_0, {
						index = iter_23_0
					}, arg_23_1)
				end

				arg_23_0.defaultValue = iter_23_0

				if arg_23_0.onRefresh then
					arg_23_0.onRefresh(arg_23_0, arg_23_1, iter_23_0, arg_23_3)
				end

				break
			end
		end
	end

	arg_21_0:addEventHandler("refresh_values", function(arg_24_0, arg_24_1)
		arg_24_0:SetCurrentValue(arg_24_1.controller, arg_24_0.defaultValue)

		return true
	end)
	arg_21_0:addEventHandler("seek_value", function(arg_25_0, arg_25_1)
		if arg_25_0.valueGetter then
			arg_25_0:SetCurrentValue(arg_25_1.controllerIndex or arg_21_1, arg_25_0.valueGetter(arg_25_1.controllerIndex or arg_21_1))
		end
	end)
	arg_21_0:addEventHandler("reset_value", function(arg_26_0, arg_26_1)
		if arg_26_0.defaultValueGetter and not arg_26_0.dropdownButton.disabled and not arg_26_0.applyable then
			arg_26_0:SetCurrentValue(arg_26_1.controllerIndex or arg_21_1, arg_26_0.defaultValueGetter(arg_26_1.controllerIndex or arg_21_1))
			arg_26_0:onReset(arg_26_1.controllerIndex)
		end
	end)
	arg_21_0:addEventHandler("apply_value", function(arg_27_0, arg_27_1)
		if arg_27_0.applyable then
			var_0_5(arg_21_0, arg_27_1.controllerIndex or arg_21_1, arg_21_2)
		end
	end)
	arg_21_0:addEventHandler("parent_value_changed", function(arg_28_0, arg_28_1)
		if arg_28_0.onDependencyParentRefresh then
			local var_28_0 = arg_28_0.onDependencyParentRefresh(arg_28_0, arg_28_1.controllerIndex or arg_21_1, arg_21_0.defaultValue, arg_28_1.parentId, arg_28_1.parentValue)

			if var_28_0 == true then
				arg_28_0:onRefresh(arg_28_1.controllerIndex, arg_21_0.defaultValue)
			elseif var_28_0 ~= nil then
				arg_28_0:SetCurrentValue(arg_28_1.controllerIndex or arg_21_1, var_28_0)
			end
		end
	end)
	arg_21_0:addEventHandler("refresh_option", function(arg_29_0, arg_29_1)
		arg_29_0:onRefresh(arg_29_1.controllerIndex, arg_21_0.defaultValue)
	end)
	arg_21_0:addEventHandler("remove_overlays", function(arg_30_0, arg_30_1)
		var_0_4(arg_30_0, arg_21_1, arg_21_2)
	end)
	var_21_0.Pip:SetAlpha(0)
	arg_21_0:dispatchEventToParent({
		name = "setup_button_data_completed"
	})
end

local function var_0_18(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.labels = {}
	arg_31_0._dropdownState = false
	arg_31_0.SetupButtonData = var_0_17
	arg_31_0.UpdateCurrentTextDropdown = var_0_15
	arg_31_0.UpdateLabels = var_0_16
end

function GenericDropdown(arg_32_0, arg_32_1)
	local var_32_0 = LUI.UIElement.new()

	var_32_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 201 * _1080p, 0, 150 * _1080p)

	var_32_0.id = "GenericDropdown"

	local var_32_1 = arg_32_1 and arg_32_1.controllerIndex

	if not var_32_1 and not Engine.DDJFBBJAIG() then
		var_32_1 = var_32_0:getRootController()
	end

	assert(var_32_1)

	local var_32_2 = var_32_0

	var_0_18(var_32_0, var_32_1, arg_32_1)

	return var_32_0
end

MenuBuilder.registerType("GenericDropdown", GenericDropdown)
LockTable(_M)
