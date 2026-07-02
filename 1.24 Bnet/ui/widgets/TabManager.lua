LUI.TabManager = LUI.Class(LUI.UIVerticalList)
LUI.TabManager.TAB_SWITCH_EVENT = "tab_switch"

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._buildSpacer()

	var_1_0.id = "spacer" .. arg_1_1

	table.insert(arg_1_0._spacerElements, var_1_0)
	arg_1_0._tabNavigator:addElement(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._buildSpacer and arg_2_1 > 0 then
		var_0_0(arg_2_0, arg_2_1 - 1)
	end

	local var_2_0 = arg_2_0._buildTab()

	if arg_2_0._tabs and arg_2_0._tabs[arg_2_1 + 1] and arg_2_0._tabs[arg_2_1 + 1].buildSpecificTab then
		var_2_0 = arg_2_0._tabs[arg_2_1 + 1].buildSpecificTab()
	end

	assert(type(var_2_0) == "userdata")

	var_2_0.id = "tab" .. arg_2_1
	var_2_0.index = arg_2_1
	arg_2_0._tabElements[arg_2_1 + 1] = var_2_0

	arg_2_0._tabNavigator:addElement(var_2_0)

	return var_2_0
end

local function var_0_2(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0._tabElements) do
		iter_3_1:closeTree()
	end

	arg_3_0._tabElements = {}

	for iter_3_2, iter_3_3 in ipairs(arg_3_0._spacerElements) do
		iter_3_3:closeTree()
	end

	arg_3_0._spacerElements = {}
end

local function var_0_3(arg_4_0)
	assert(arg_4_0._tabManagerDataSource)

	local var_4_0 = arg_4_0._tabManagerDataSource:GetCountValue(arg_4_0._controllerIndex)

	for iter_4_0 = 0, var_4_0 - 1 do
		local var_4_1 = var_0_1(arg_4_0, iter_4_0)
		local var_4_2 = arg_4_0._tabManagerDataSource:GetDataSourceAtIndex(iter_4_0, arg_4_0._controllerIndex)

		if not var_4_2.disabled then
			var_4_2.disabled = var_4_2.name:GetDataSourceForSubmodel("disabled", false)
		end

		var_4_1:SetDataSource(var_4_2, arg_4_0._controllerIndex)
	end
end

local function var_0_4(arg_5_0)
	assert(arg_5_0._tabs)

	local var_5_0 = #arg_5_0._tabs

	for iter_5_0 = 1, var_5_0 do
		local var_5_1 = var_0_1(arg_5_0, iter_5_0 - 1)

		if var_5_1.Setup then
			var_5_1:Setup(arg_5_0._tabs[iter_5_0])
		end

		if arg_5_0._tabs[iter_5_0].disabled then
			var_5_1:Disable()
		end
	end
end

local function var_0_5(arg_6_0)
	if arg_6_0._tabManagerDataSource then
		return arg_6_0._tabManagerDataSource:GetCountValue(arg_6_0._controllerIndex)
	elseif arg_6_0._tabs then
		return #arg_6_0._tabs
	end
end

local function var_0_6(arg_7_0)
	if arg_7_0._tabManagerDataSource then
		return arg_7_0._tabManagerDataSource:GetDefaultFocusIndex(arg_7_0._controllerIndex) or 0
	elseif arg_7_0._tabs then
		if arg_7_0._defaultFocus then
			if type(arg_7_0._defaultFocus) == "function" then
				local var_7_0 = arg_7_0._defaultFocus(arg_7_0)

				if var_7_0 then
					return var_7_0 - 1
				end
			else
				return arg_7_0._defaultFocus - 1
			end
		end

		for iter_7_0 = 1, #arg_7_0._tabs do
			if arg_7_0._tabs[iter_7_0].hasDefaultFocus then
				return iter_7_0 - 1
			end
		end

		return 0
	end
end

local function var_0_7(arg_8_0, arg_8_1)
	if arg_8_0._tabManagerDataSource then
		local var_8_0 = arg_8_0._tabManagerDataSource:GetDataSourceAtIndex(arg_8_1, arg_8_0._controllerIndex)

		assert(var_8_0.focusFunction, "A data source provided to the tab manager needs to have a focusFunction defined at every index.")

		return var_8_0.focusFunction
	elseif arg_8_0._tabs then
		return arg_8_0._tabs[arg_8_1 + 1].focusFunction or function()
			return
		end
	end
end

local function var_0_8(arg_10_0, arg_10_1)
	if arg_10_0._tabs then
		return arg_10_0._tabs[arg_10_1 + 1].focusCondition or function()
			return true
		end
	else
		return function()
			return true
		end
	end
end

local function var_0_9(arg_13_0, arg_13_1)
	if arg_13_0._tabManagerDataSource then
		local var_13_0 = arg_13_0._tabManagerDataSource:GetDataSourceAtIndex(arg_13_1, arg_13_0._controllerIndex)

		return not var_13_0.disabled or not var_13_0.disabled:GetValue(arg_13_0._controllerIndex)
	else
		return arg_13_0._tabElements[arg_13_1 + 1]:IsEnabled()
	end
end

local function var_0_10(arg_14_0)
	var_0_2(arg_14_0)

	if arg_14_0._tabManagerDataSource then
		var_0_3(arg_14_0)
	else
		var_0_4(arg_14_0)
	end

	local var_14_0 = var_0_6(arg_14_0)

	arg_14_0:FocusTab(arg_14_0._controllerIndex, var_14_0, FocusType.MenuFlow)
end

local function var_0_11(arg_15_0, arg_15_1)
	assert(arg_15_0.leftShoulderButton)
	assert(arg_15_0.rightShoulderButton)

	if arg_15_0._buildArrows then
		assert(arg_15_0.LeftArrow)
		assert(arg_15_0.RightArrow)
	end

	if LUI.IsLastInputGamepad(arg_15_1) then
		arg_15_0.leftShoulderButton:SetAlpha(1, 0)
		arg_15_0.rightShoulderButton:SetAlpha(1, 0)

		if arg_15_0._buildArrows then
			arg_15_0.LeftArrow:SetAlpha(0)
			arg_15_0.RightArrow:SetAlpha(0)
		end
	else
		arg_15_0.leftShoulderButton:SetAlpha(0, 0)
		arg_15_0.rightShoulderButton:SetAlpha(0, 0)

		if arg_15_0._buildArrows then
			arg_15_0.LeftArrow:SetAlpha(1)
			arg_15_0.RightArrow:SetAlpha(1)
		end
	end

	LAYOUT.ResetElementAnchorAndPosition(arg_15_0._tabNavigator)
end

function GetBuildMenuFocusFunction(arg_16_0, arg_16_1)
	return function(arg_17_0, arg_17_1, arg_17_2)
		local var_17_0 = arg_16_0(arg_17_1, arg_17_2)

		var_17_0.id = "menu" .. arg_17_2

		if arg_17_0.currentMenu then
			arg_17_0.currentMenu:closeTree()
		end

		arg_17_0.menuContainer:addElement(var_17_0)

		arg_17_0.currentMenu = var_17_0

		if arg_16_1 then
			arg_16_1(var_17_0)
		end
	end
end

function GetDataSourceFocusFunction(arg_18_0)
	return function(arg_19_0, arg_19_1, arg_19_2)
		if not arg_19_0.currentMenu then
			local var_19_0 = arg_18_0(arg_19_1)

			var_19_0.id = "dataSourceMenu"

			arg_19_0.menuContainer:addElement(var_19_0)

			arg_19_0.currentMenu = var_19_0
		end

		arg_19_0.currentMenu:SetDataSource(arg_19_0._tabManagerDataSource:GetDataSourceAtIndex(arg_19_2), arg_19_1)
	end
end

function LUI.TabManager.init(arg_20_0, arg_20_1)
	assert(arg_20_1)
	assert(type(arg_20_1.buildTab) == "function")
	assert(type(arg_20_1.controllerIndex) == "number")
	assert(arg_20_1.tabHeight == nil or type(arg_20_1.tabHeight) == "number")
	assert(arg_20_1.height == nil or type(arg_20_1.height) == "number")
	assert(arg_20_1.dataSource == nil or type(arg_20_1.dataSource) == "table")
	assert(arg_20_1.tabs == nil or type(arg_20_1.dataSource) == "table")
	assert(arg_20_1.wrap == nil or type(arg_20_1.wrap) == "boolean")

	arg_20_1.tabHeight = arg_20_1.tabHeight or 52
	arg_20_1.height = arg_20_1.height or arg_20_1.tabHeight
	arg_20_1.useTriggers = arg_20_1.useTriggers or false

	LUI.TabManager.super.init(arg_20_0)

	arg_20_0.id = "tabManager"
	arg_20_0._tabElements = {}
	arg_20_0._spacerElements = {}
	arg_20_0._buildTab = arg_20_1.buildTab
	arg_20_0._buildSpacer = arg_20_1.buildSpacer
	arg_20_0._buildArrows = arg_20_1.buildArrows
	arg_20_0._controllerIndex = arg_20_1.controllerIndex
	arg_20_0._sendTabSwitchEvent = arg_20_1.sendTabSwitchEvent or false

	arg_20_0:registerEventHandler("restore_focus", LUI.TabManager.restoreFocus)

	local var_20_0 = LUI.UIElement.new()

	var_20_0.id = "navigatorContainer"
	arg_20_0.navigatorContainer = var_20_0

	arg_20_0:addElement(var_20_0)

	local var_20_1 = LUI.UIHorizontalList.new()

	var_20_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_20_1.height)
	var_20_1:SetAlignment(LUI.Alignment.Left)
	var_20_1:SetSpacing(arg_20_1.spacing or 0)

	var_20_1.id = "tabNavigator"

	var_20_1:SetIgnoreInvisibleChildren(arg_20_1.setIgnoreInvisibleChildren or false)

	arg_20_0._tabNavigator = var_20_1

	var_20_0:addElement(var_20_1)

	local var_20_2 = LUI.UIElement.new()

	var_20_2:SetTop(arg_20_1.height)

	var_20_2.id = "menuContainer"
	arg_20_0.menuContainer = var_20_2

	arg_20_0:addElement(var_20_2)

	local var_20_3 = 36 * _1080p
	local var_20_4 = 36 * _1080p
	local var_20_5 = (arg_20_1.tabHeight - var_20_3) / 2
	local var_20_6 = 32 * _1080p
	local var_20_7 = 32 * _1080p
	local var_20_8 = (arg_20_1.tabHeight - var_20_6) / 2
	local var_20_9 = ButtonMap.button_shoulderl.string
	local var_20_10 = ButtonMap.button_shoulderr.string

	if arg_20_1.useTriggers then
		var_20_9 = ButtonMap.button_left_trigger.string
		var_20_10 = ButtonMap.button_right_trigger.string
	end

	local var_20_11
	local var_20_12 = {
		iconString = var_20_9
	}
	local var_20_13 = MenuBuilder.BuildRegisteredType("IconImage", var_20_12)

	var_20_13:SetAnchorsAndPosition(1, 0, 0, 1, -var_20_4, 0, var_20_5, var_20_5 + var_20_3)
	var_20_13:SetRGBFromTable(SWATCHES.tabManager.tabText)
	var_20_13:setPriority(-2)

	var_20_13.id = "leftShoulderButton"

	var_20_1:addElement(var_20_13)

	arg_20_0.leftShoulderButton = var_20_13

	if arg_20_0._buildArrows then
		local var_20_14
		local var_20_15 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
			controllerIndex = arg_20_0._controllerIndex
		})

		var_20_15.id = "LeftArrow"

		var_20_15.Arrow:SetZRotation(90, 0)
		var_20_15:setPriority(-1)
		var_20_15:SetAnchorsAndPosition(1, 0, 0, 1, -var_20_7, 0, var_20_8, var_20_8 + var_20_6)
		var_20_1:addElement(var_20_15)

		arg_20_0.LeftArrow = var_20_15

		local var_20_16
		local var_20_17 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
			controllerIndex = arg_20_0._controllerIndex
		})

		var_20_17.id = "RightArrow"

		var_20_17.Arrow:SetZRotation(-90, 0)
		var_20_17:setPriority(1)
		var_20_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_20_7, var_20_8, var_20_8 + var_20_6)
		var_20_1:addElement(var_20_17)

		arg_20_0.RightArrow = var_20_17
	end

	local var_20_18
	local var_20_19 = {
		iconString = var_20_10
	}
	local var_20_20 = MenuBuilder.BuildRegisteredType("IconImage", var_20_19)

	var_20_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_20_4, var_20_5, var_20_5 + var_20_3)
	var_20_20:SetRGBFromTable(SWATCHES.tabManager.tabText)
	var_20_20:setPriority(2)

	var_20_20.id = "rightShoulderButton"

	var_20_1:addElement(var_20_20)

	arg_20_0.rightShoulderButton = var_20_20

	if arg_20_1.dataSource then
		arg_20_0:SetTabManagerDataSource(arg_20_1.dataSource)
	elseif arg_20_1.tabs then
		arg_20_0:SetTabs(arg_20_1.tabs)
	end

	local var_20_21 = LUI.UIBindButton.new()

	var_20_21.id = "bindButton"

	local var_20_22 = "button_shoulderl"
	local var_20_23 = "button_shoulderr"

	if arg_20_1.useTriggers then
		var_20_22 = "button_left_trigger"
		var_20_23 = "button_right_trigger"
	end

	local function var_20_24(arg_21_0, arg_21_1)
		if arg_21_0._sendTabSwitchEvent then
			local var_21_0 = arg_21_0:GetCurrentTab()

			if var_21_0 then
				var_21_0:processEvent({
					name = LUI.TabManager.TAB_SWITCH_EVENT,
					controller = arg_21_1,
					index = arg_21_0._currentTab
				})
			end
		end
	end

	var_20_21:registerEventHandler(var_20_22, function(arg_22_0, arg_22_1)
		if not arg_20_0._isAllDisabled then
			local var_22_0 = arg_20_0:GetNextEnabledTab(arg_22_1.controller, -1, arg_20_1.wrap)

			if var_22_0 then
				var_20_24(arg_20_0, arg_22_1.controller)
				arg_20_0:FocusTab(arg_22_1.controller, var_22_0, FocusType.Gamepad)
			else
				arg_20_0:playSound("ui_deny")
			end
		end

		return true
	end)
	var_20_21:registerEventHandler(var_20_23, function(arg_23_0, arg_23_1)
		if not arg_20_0._isAllDisabled then
			local var_23_0 = arg_20_0:GetNextEnabledTab(arg_23_1.controller, 1, arg_20_1.wrap)

			if var_23_0 then
				var_20_24(arg_20_0, arg_23_1.controller)
				arg_20_0:FocusTab(arg_23_1.controller, var_23_0, FocusType.Gamepad)
			else
				arg_20_0:playSound("ui_deny")
			end
		end

		return true
	end)
	var_20_21:registerEventHandler("tab_mouse_select", function(arg_24_0, arg_24_1)
		if not arg_20_0._isAllDisabled and not not var_0_9(arg_20_0, arg_24_1.index) and arg_24_1.index ~= arg_20_0._currentTab then
			local var_24_0 = arg_24_1.controller or arg_20_0._controllerIndex

			var_20_24(arg_20_0, var_24_0)
			arg_20_0:FocusTab(var_24_0, arg_24_1.index, FocusType.MouseOver)
		end
	end)
	arg_20_0:addElement(var_20_21)

	if arg_20_0._buildArrows then
		arg_20_0.LeftArrow:registerEventHandler("button_action", function(arg_25_0, arg_25_1)
			if not arg_20_0._isAllDisabled then
				local var_25_0 = arg_20_0:GetNextEnabledTab(arg_25_1.controller, -1, true)

				if var_25_0 then
					var_20_24(arg_20_0, arg_25_1.controller)
					arg_20_0:FocusTab(arg_25_1.controller, var_25_0, FocusType.MouseOver)
				end
			end

			return true
		end)
		arg_20_0.RightArrow:registerEventHandler("button_action", function(arg_26_0, arg_26_1)
			if not arg_20_0._isAllDisabled then
				local var_26_0 = arg_20_0:GetNextEnabledTab(arg_26_1.controller, 1, true)

				if var_26_0 then
					var_20_24(arg_20_0, arg_26_1.controller)
					arg_20_0:FocusTab(arg_26_1.controller, var_26_0, FocusType.MouseOver)
				end
			end

			return true
		end)
	end

	arg_20_0:registerAndCallEventHandler("update_input_type", function(arg_27_0, arg_27_1)
		var_0_11(arg_27_0, arg_27_1.controllerIndex)
	end, {
		controllerIndex = arg_20_0._controllerIndex
	})
end

function LUI.TabManager.GetCurrentTabIndex(arg_28_0)
	return arg_28_0._currentTab
end

function LUI.TabManager.GetCurrentTab(arg_29_0)
	local var_29_0 = arg_29_0._currentTab + 1

	assert(var_29_0 >= 1 and var_29_0 <= #arg_29_0._tabElements)

	return arg_29_0._tabElements[var_29_0]
end

function LUI.TabManager.GetTabAtIndex(arg_30_0, arg_30_1)
	if arg_30_0._tabElements then
		assert(arg_30_1 >= 1 and arg_30_1 <= #arg_30_0._tabElements)

		return arg_30_0._tabElements[arg_30_1]
	end
end

function LUI.TabManager.IsTabAvailable(arg_31_0)
	return arg_31_0._tabElements and #arg_31_0._tabElements > 0
end

function LUI.TabManager.SetCurrentTabIndex(arg_32_0, arg_32_1)
	arg_32_0._currentTab = arg_32_1
end

function LUI.TabManager.GetTabManagerDataSource(arg_33_0)
	return arg_33_0._tabManagerDataSource
end

function LUI.TabManager.SetTabManagerDataSource(arg_34_0, arg_34_1)
	arg_34_0._tabManagerDataSource = arg_34_1

	var_0_10(arg_34_0)
end

function LUI.TabManager.SetTabs(arg_35_0, arg_35_1)
	arg_35_0._tabs = arg_35_1

	var_0_10(arg_35_0)
end

function LUI.TabManager.SetAlignment(arg_36_0, arg_36_1)
	arg_36_0._tabNavigator:SetAlignment(arg_36_1)
end

function LUI.TabManager.DisableAll(arg_37_0)
	arg_37_0._isAllDisabled = true
end

function LUI.TabManager.EnableAll(arg_38_0)
	arg_38_0._isAllDisabled = false
end

function LUI.TabManager.HideTabs(arg_39_0)
	arg_39_0._tabNavigator:SetAlpha(0)
	arg_39_0:DisableAll()
	arg_39_0:SetMouseFocusBlocker(true)
end

function LUI.TabManager.ShowTabs(arg_40_0)
	arg_40_0._tabNavigator:SetAlpha(1)
	arg_40_0:EnableAll()
	arg_40_0:SetMouseFocusBlocker(false)
end

function LUI.TabManager.JustifyTabs(arg_41_0)
	local var_41_0, var_41_1, var_41_2, var_41_3 = arg_41_0:getLocalRect()
	local var_41_4 = var_41_2 - var_41_0

	if LUI.IsLastInputKeyboardMouse(arg_41_0._controllerIndex) and arg_41_0._buildArrows then
		local var_41_5, var_41_6

		var_41_0, var_41_5, var_41_2, var_41_6 = arg_41_0.LeftArrow:getLocalRect()
	else
		local var_41_7, var_41_8

		var_41_0, var_41_7, var_41_2, var_41_8 = arg_41_0.leftShoulderButton:getLocalRect()
	end

	local var_41_9 = (var_41_2 - var_41_0) * 2
	local var_41_10 = 0
	local var_41_11 = 0

	for iter_41_0, iter_41_1 in ipairs(arg_41_0._tabElements) do
		local var_41_12, var_41_13, var_41_14, var_41_15 = iter_41_1:getLocalRect()
		local var_41_16 = var_41_15
		local var_41_17 = var_41_14
		local var_41_18 = var_41_13

		var_41_10 = var_41_10 + (var_41_17 - var_41_12)
		var_41_11 = var_41_11 + 1
	end

	local var_41_19 = 0
	local var_41_20 = 0

	for iter_41_2, iter_41_3 in ipairs(arg_41_0._spacerElements) do
		local var_41_21, var_41_22, var_41_23, var_41_24 = iter_41_3:getLocalRect()
		local var_41_25 = var_41_24
		local var_41_26 = var_41_23
		local var_41_27 = var_41_22

		var_41_19 = var_41_19 + (var_41_26 - var_41_21)
		var_41_20 = var_41_20 + 1
	end

	local var_41_28 = (var_41_4 - (var_41_9 + var_41_10 + var_41_19)) / (var_41_11 + var_41_20 + 1)

	arg_41_0._tabNavigator:SetSpacing(var_41_28)
end

function LUI.TabManager.SizeTabsToFit(arg_42_0)
	local var_42_0, var_42_1, var_42_2, var_42_3 = arg_42_0:getLocalRect()
	local var_42_4 = var_42_2 - var_42_0

	if LUI.IsLastInputKeyboardMouse(arg_42_0._controllerIndex) and arg_42_0._buildArrows then
		local var_42_5, var_42_6

		var_42_0, var_42_5, var_42_2, var_42_6 = arg_42_0.LeftArrow:getLocalRect()
	else
		local var_42_7, var_42_8

		var_42_0, var_42_7, var_42_2, var_42_8 = arg_42_0.leftShoulderButton:getLocalRect()
	end

	local var_42_9 = (var_42_2 - var_42_0) * 2
	local var_42_10 = 0

	for iter_42_0, iter_42_1 in ipairs(arg_42_0._spacerElements) do
		local var_42_11, var_42_12, var_42_13, var_42_14 = iter_42_1:getLocalRect()
		local var_42_15 = var_42_14
		local var_42_16 = var_42_13
		local var_42_17 = var_42_12

		var_42_10 = var_42_10 + (var_42_16 - var_42_11)
	end

	local var_42_18 = var_42_4 - (var_42_9 + var_42_10)
	local var_42_19 = var_0_5(arg_42_0)
	local var_42_20 = (var_42_18 - 4 * var_42_19) / var_42_19

	for iter_42_2, iter_42_3 in ipairs(arg_42_0._tabElements) do
		iter_42_3:SetRight(var_42_20)
	end
end

function LUI.TabManager.SetTabSpacing(arg_43_0, arg_43_1)
	arg_43_0._tabNavigator:SetSpacing(arg_43_1)
end

function LUI.TabManager.FocusTab(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	if arg_44_0._tabs and arg_44_2 > #arg_44_0._tabs - 1 then
		DebugPrint("WARNING: Attempt to focus tab " .. arg_44_2 .. " but max tab is " .. #arg_44_0._tabs - 1)

		arg_44_2 = #arg_44_0._tabs - 1
	end

	if var_0_8(arg_44_0, arg_44_2)(arg_44_1, arg_44_2, arg_44_3) then
		local var_44_0 = arg_44_3 == FocusType.Gamepad or arg_44_3 == FocusType.MouseOver

		arg_44_0:processEvent({
			name = "focus_tab",
			index = arg_44_2,
			playSound = var_44_0
		})

		local var_44_1 = var_0_7(arg_44_0, arg_44_2)

		arg_44_0._currentTab = arg_44_2

		var_44_1(arg_44_0, arg_44_1, arg_44_2, arg_44_3)

		if arg_44_0._tabIndexDataSource then
			arg_44_0._tabIndexDataSource:SetValue(arg_44_1, arg_44_2)
		end

		if arg_44_0._tabManagerDataSource then
			local var_44_2 = arg_44_0._tabManagerDataSource:GetDataSourceAtIndex(arg_44_2, arg_44_1)

			arg_44_0:SetDataSource(var_44_2, arg_44_1)
		end
	end
end

function LUI.TabManager.getAllFocusedChildren(arg_45_0, arg_45_1)
	arg_45_1 = arg_45_1 or {}

	if arg_45_0._currentTab then
		arg_45_0.saveData = {
			currentTab = arg_45_0._currentTab
		}

		table.insert(arg_45_1, arg_45_0)
	end

	return arg_45_1
end

function LUI.TabManager.restoreFocus(arg_46_0, arg_46_1)
	if arg_46_1.data and arg_46_1.data.currentTab then
		arg_46_0:FocusTab(arg_46_1.controller, arg_46_1.data.currentTab, FocusType.MenuFlow)
	end

	return arg_46_0:dispatchEventToChildren(arg_46_1)
end

function LUI.TabManager.SetTabManagerDataSourceThroughElement(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = DataLink.new({
		target = arg_47_0,
		source = arg_47_1,
		relativeDataSourcePath = arg_47_2,
		type = DataLink.TYPES.tabManagerDataSource
	})

	var_47_0:Link()
	var_47_0:Refresh()

	return var_47_0
end

function LUI.TabManager.AddBacker(arg_48_0, arg_48_1)
	local var_48_0

	if arg_48_1 then
		var_48_0 = arg_48_1
	else
		var_48_0 = MenuBuilder.BuildRegisteredType("TabsBacker", {
			controllerIndex = arg_48_0._controllerIndex
		})
	end

	var_48_0.id = "tabsBacker"

	var_48_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -5, _1080p * 5)
	var_48_0:setPriority(-1)
	arg_48_0.navigatorContainer:addElement(var_48_0)

	arg_48_0._tabsBacker = var_48_0
end

function LUI.TabManager.GetNextEnabledTab(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0 = arg_49_0._currentTab
	local var_49_1
	local var_49_2 = var_0_5(arg_49_0)

	if var_49_2 < 1 then
		return nil
	end

	local var_49_3 = var_49_2 - 1

	while var_49_1 == nil do
		local var_49_4 = var_49_0 + arg_49_2

		if var_49_3 < var_49_4 then
			if arg_49_3 then
				var_49_4 = 0
			else
				return nil
			end
		elseif var_49_4 < 0 then
			if arg_49_3 then
				var_49_4 = var_49_3
			else
				return nil
			end
		end

		if not not var_0_9(arg_49_0, var_49_4) then
			return var_49_4
		elseif var_49_4 == arg_49_0._currentTab then
			return nil
		else
			var_49_0 = var_49_4
		end
	end

	return nil
end

function LUI.TabManager.SetTabIndexDataSource(arg_50_0, arg_50_1)
	arg_50_0._tabIndexDataSource = arg_50_1
end

function LUI.TabManager.GetCurrentTabMenu(arg_51_0)
	assert(arg_51_0.currentMenu)

	return arg_51_0.currentMenu
end

function LUI.TabManager.SetDefaultFocus(arg_52_0, arg_52_1)
	arg_52_0._defaultFocus = arg_52_1
end

function LUI.TabManager.SetSendEventOnTabChange(arg_53_0, arg_53_1)
	arg_53_0._sendTabSwitchEvent = arg_53_1
end
