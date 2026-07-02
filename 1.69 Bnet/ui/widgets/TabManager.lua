LUI.TabManager = LUI.Class(LUI.UIVerticalList)
LUI.TabManager.TAB_SWITCH_EVENT = "tab_switch"

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._buildSpacer()

	var_1_0.id = "spacer" .. arg_1_1

	table.insert(arg_1_0._spacerElements, var_1_0)
	arg_1_0._tabNavigator:addElement(var_1_0)
end

function LUI.TabManager.AddNewTab(arg_2_0, arg_2_1)
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

function LUI.TabManager.RemoveTabAtIndex(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0._tabElements[arg_3_1]

	arg_3_0._tabNavigator:RemoveElement(var_3_0)
	var_3_0:closeTree()
	table.remove(arg_3_0._tabElements, arg_3_1)

	arg_3_0._tabElements[arg_3_1] = nil

	local var_3_1 = #arg_3_0._tabs

	table.remove(arg_3_0._tabs, var_3_1)

	arg_3_0._tabs[var_3_1] = nil
end

local function var_0_1(arg_4_0)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0._tabElements) do
		iter_4_1:closeTree()
	end

	arg_4_0._tabElements = {}

	for iter_4_2, iter_4_3 in ipairs(arg_4_0._spacerElements) do
		iter_4_3:closeTree()
	end

	arg_4_0._spacerElements = {}
end

local function var_0_2(arg_5_0)
	assert(arg_5_0._tabManagerDataSource)

	local var_5_0 = arg_5_0._tabManagerDataSource:GetCountValue(arg_5_0._controllerIndex)

	for iter_5_0 = 0, var_5_0 - 1 do
		local var_5_1 = LUI.TabManager.AddNewTab(arg_5_0, iter_5_0)
		local var_5_2 = arg_5_0._tabManagerDataSource:GetDataSourceAtIndex(iter_5_0, arg_5_0._controllerIndex)

		if not var_5_2.disabled then
			var_5_2.disabled = var_5_2.name:GetDataSourceForSubmodel("disabled", false)
		end

		var_5_1:SetDataSource(var_5_2, arg_5_0._controllerIndex)
	end
end

local function var_0_3(arg_6_0)
	assert(arg_6_0._tabs)

	local var_6_0 = #arg_6_0._tabs

	for iter_6_0 = 1, var_6_0 do
		local var_6_1 = LUI.TabManager.AddNewTab(arg_6_0, iter_6_0 - 1)

		if var_6_1.Setup then
			var_6_1:Setup(arg_6_0._tabs[iter_6_0])
		end

		if arg_6_0._tabs[iter_6_0].disabled then
			var_6_1:Disable()
		end
	end
end

local function var_0_4(arg_7_0)
	if arg_7_0._tabManagerDataSource then
		return arg_7_0._tabManagerDataSource:GetCountValue(arg_7_0._controllerIndex)
	elseif arg_7_0._tabs then
		return #arg_7_0._tabs
	end
end

local function var_0_5(arg_8_0)
	if arg_8_0._tabManagerDataSource then
		return arg_8_0._tabManagerDataSource:GetDefaultFocusIndex(arg_8_0._controllerIndex) or 0
	elseif arg_8_0._tabs then
		if arg_8_0._defaultFocus then
			if type(arg_8_0._defaultFocus) == "function" then
				local var_8_0 = arg_8_0._defaultFocus(arg_8_0)

				if var_8_0 then
					return var_8_0 - 1
				end
			else
				return arg_8_0._defaultFocus - 1
			end
		end

		for iter_8_0 = 1, #arg_8_0._tabs do
			if arg_8_0._tabs[iter_8_0].hasDefaultFocus then
				return iter_8_0 - 1
			end
		end

		return 0
	end
end

local function var_0_6(arg_9_0, arg_9_1)
	if arg_9_0._tabManagerDataSource then
		local var_9_0 = arg_9_0._tabManagerDataSource:GetDataSourceAtIndex(arg_9_1, arg_9_0._controllerIndex)

		assert(var_9_0.focusFunction, "A data source provided to the tab manager needs to have a focusFunction defined at every index.")

		return var_9_0.focusFunction
	elseif arg_9_0._tabs then
		return arg_9_0._tabs[arg_9_1 + 1].focusFunction or function()
			return
		end
	end
end

local function var_0_7(arg_11_0, arg_11_1)
	if arg_11_0._tabs then
		return arg_11_0._tabs[arg_11_1 + 1].focusCondition or function()
			return true
		end
	else
		return function()
			return true
		end
	end
end

local function var_0_8(arg_14_0, arg_14_1)
	if arg_14_0._tabManagerDataSource then
		local var_14_0 = arg_14_0._tabManagerDataSource:GetDataSourceAtIndex(arg_14_1, arg_14_0._controllerIndex)

		return not var_14_0.disabled or not var_14_0.disabled:GetValue(arg_14_0._controllerIndex)
	else
		return arg_14_0._tabElements[arg_14_1 + 1]:IsEnabled()
	end
end

local function var_0_9(arg_15_0)
	var_0_1(arg_15_0)

	if arg_15_0._tabManagerDataSource then
		var_0_2(arg_15_0)
	else
		var_0_3(arg_15_0)
	end

	local var_15_0 = var_0_5(arg_15_0)

	arg_15_0:FocusTab(arg_15_0._controllerIndex, var_15_0, FocusType.MenuFlow)
end

function LUI.TabManager.UpdateButtonHelperVisibility(arg_16_0, arg_16_1, arg_16_2)
	assert(arg_16_0.leftShoulderButton)
	assert(arg_16_0.rightShoulderButton)

	if arg_16_0._buildArrows then
		assert(arg_16_0.LeftArrow)
		assert(arg_16_0.RightArrow)
	end

	arg_16_0._isAllDisabled = arg_16_2 and arg_16_2.isSingleTab or false

	if LUI.IsLastInputGamepad(arg_16_1) and not arg_16_0._isAllDisabled then
		arg_16_0.leftShoulderButton:SetAlpha(1, 0)
		arg_16_0.rightShoulderButton:SetAlpha(1, 0)

		if arg_16_0._buildArrows then
			arg_16_0.LeftArrow:SetAlpha(0)
			arg_16_0.RightArrow:SetAlpha(0)
		end
	else
		arg_16_0.leftShoulderButton:SetAlpha(0, 0)
		arg_16_0.rightShoulderButton:SetAlpha(0, 0)

		if arg_16_0._buildArrows then
			arg_16_0.LeftArrow:SetAlpha(1)
			arg_16_0.RightArrow:SetAlpha(1)
		end
	end

	LAYOUT.ResetElementAnchorAndPosition(arg_16_0._tabNavigator)
end

function GetBuildMenuFocusFunction(arg_17_0, arg_17_1)
	return function(arg_18_0, arg_18_1, arg_18_2)
		local var_18_0 = arg_17_0(arg_18_1, arg_18_2)

		var_18_0.id = "menu" .. arg_18_2

		if arg_18_0.currentMenu then
			arg_18_0.currentMenu:closeTree()
		end

		arg_18_0.menuContainer:addElement(var_18_0)

		arg_18_0.currentMenu = var_18_0

		if arg_17_1 then
			arg_17_1(var_18_0)
		end
	end
end

function GetDataSourceFocusFunction(arg_19_0)
	return function(arg_20_0, arg_20_1, arg_20_2)
		if not arg_20_0.currentMenu then
			local var_20_0 = arg_19_0(arg_20_1)

			var_20_0.id = "dataSourceMenu"

			arg_20_0.menuContainer:addElement(var_20_0)

			arg_20_0.currentMenu = var_20_0
		end

		arg_20_0.currentMenu:SetDataSource(arg_20_0._tabManagerDataSource:GetDataSourceAtIndex(arg_20_2), arg_20_1)
	end
end

local function var_0_10(arg_21_0, arg_21_1)
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

function LUI.TabManager.init(arg_22_0, arg_22_1)
	assert(arg_22_1)
	assert(type(arg_22_1.buildTab) == "function")
	assert(type(arg_22_1.controllerIndex) == "number")
	assert(arg_22_1.tabHeight == nil or type(arg_22_1.tabHeight) == "number")
	assert(arg_22_1.height == nil or type(arg_22_1.height) == "number")
	assert(arg_22_1.dataSource == nil or type(arg_22_1.dataSource) == "table")
	assert(arg_22_1.tabs == nil or type(arg_22_1.dataSource) == "table")
	assert(arg_22_1.wrap == nil or type(arg_22_1.wrap) == "boolean")

	arg_22_1.tabHeight = arg_22_1.tabHeight or 52
	arg_22_1.height = arg_22_1.height or arg_22_1.tabHeight
	arg_22_1.useTriggers = arg_22_1.useTriggers or false

	LUI.TabManager.super.init(arg_22_0)

	arg_22_0.id = "tabManager"
	arg_22_0._tabElements = {}
	arg_22_0._spacerElements = {}
	arg_22_0._buildTab = arg_22_1.buildTab
	arg_22_0._buildSpacer = arg_22_1.buildSpacer
	arg_22_0._buildArrows = arg_22_1.buildArrows
	arg_22_0._controllerIndex = arg_22_1.controllerIndex
	arg_22_0._sendTabSwitchEvent = arg_22_1.sendTabSwitchEvent or false

	arg_22_0:registerEventHandler("restore_focus", LUI.TabManager.restoreFocus)

	local var_22_0 = LUI.UIElement.new()

	var_22_0.id = "navigatorContainer"
	arg_22_0.navigatorContainer = var_22_0

	arg_22_0:addElement(var_22_0)

	local var_22_1 = LUI.UIHorizontalList.new()

	var_22_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_22_1.height)
	var_22_1:SetAlignment(LUI.Alignment.Left)
	var_22_1:SetSpacing(arg_22_1.spacing or 0)

	var_22_1.id = "tabNavigator"

	var_22_1:SetIgnoreInvisibleChildren(arg_22_1.setIgnoreInvisibleChildren or false)

	arg_22_0._tabNavigator = var_22_1

	var_22_0:addElement(var_22_1)

	local var_22_2 = LUI.UIElement.new()

	var_22_2:SetTop(arg_22_1.height)

	var_22_2.id = "menuContainer"
	arg_22_0.menuContainer = var_22_2

	arg_22_0:addElement(var_22_2)

	local var_22_3 = 36 * _1080p
	local var_22_4 = 36 * _1080p
	local var_22_5 = (arg_22_1.tabHeight - var_22_3) / 2
	local var_22_6 = 32 * _1080p
	local var_22_7 = 32 * _1080p
	local var_22_8 = (arg_22_1.tabHeight - var_22_6) / 2
	local var_22_9 = ButtonMap.button_shoulderl.string
	local var_22_10 = ButtonMap.button_shoulderr.string

	if arg_22_1.useTriggers then
		var_22_9 = ButtonMap.button_left_trigger.string
		var_22_10 = ButtonMap.button_right_trigger.string
	end

	local var_22_11
	local var_22_12 = {
		iconString = var_22_9
	}
	local var_22_13 = MenuBuilder.BuildRegisteredType("IconImage", var_22_12)

	var_22_13:SetAnchorsAndPosition(1, 0, 0, 1, -var_22_4, 0, var_22_5, var_22_5 + var_22_3)
	var_22_13:SetRGBFromTable(SWATCHES.tabManager.tabText)
	var_22_13:setPriority(-2)

	var_22_13.id = "leftShoulderButton"

	var_22_1:addElement(var_22_13)

	arg_22_0.leftShoulderButton = var_22_13

	if arg_22_0._buildArrows then
		local var_22_14
		local var_22_15 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
			controllerIndex = arg_22_0._controllerIndex
		})

		var_22_15.id = "LeftArrow"

		var_22_15.Arrow:SetZRotation(90, 0)
		var_22_15:setPriority(-1)
		var_22_15:SetAnchorsAndPosition(1, 0, 0, 1, -var_22_7, 0, var_22_8, var_22_8 + var_22_6)
		var_22_1:addElement(var_22_15)

		arg_22_0.LeftArrow = var_22_15

		local var_22_16
		local var_22_17 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
			controllerIndex = arg_22_0._controllerIndex
		})

		var_22_17.id = "RightArrow"

		var_22_17.Arrow:SetZRotation(-90, 0)
		var_22_17:setPriority(1)
		var_22_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_22_7, var_22_8, var_22_8 + var_22_6)
		var_22_1:addElement(var_22_17)

		arg_22_0.RightArrow = var_22_17
	end

	local var_22_18
	local var_22_19 = {
		iconString = var_22_10
	}
	local var_22_20 = MenuBuilder.BuildRegisteredType("IconImage", var_22_19)

	var_22_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_22_4, var_22_5, var_22_5 + var_22_3)
	var_22_20:SetRGBFromTable(SWATCHES.tabManager.tabText)
	var_22_20:setPriority(2)

	var_22_20.id = "rightShoulderButton"

	var_22_1:addElement(var_22_20)

	arg_22_0.rightShoulderButton = var_22_20

	if arg_22_1.dataSource then
		arg_22_0:SetTabManagerDataSource(arg_22_1.dataSource)
	elseif arg_22_1.tabs then
		arg_22_0:SetTabs(arg_22_1.tabs)
	end

	local var_22_21 = LUI.UIBindButton.new()

	var_22_21.id = "bindButton"

	local var_22_22 = "button_shoulderl"
	local var_22_23 = "button_shoulderr"

	if arg_22_1.useTriggers then
		var_22_22 = "button_left_trigger"
		var_22_23 = "button_right_trigger"
	end

	var_22_21:registerEventHandler(var_22_22, function(arg_23_0, arg_23_1)
		if not arg_22_0._isAllDisabled then
			local var_23_0 = arg_22_0:GetNextEnabledTab(arg_23_1.controller, -1, arg_22_1.wrap)

			if var_23_0 then
				var_0_10(arg_22_0, arg_23_1.controller)
				arg_22_0:FocusTab(arg_23_1.controller, var_23_0, FocusType.Gamepad)
			else
				arg_22_0:playSound("ui_deny")
			end
		end

		return true
	end)
	var_22_21:registerEventHandler(var_22_23, function(arg_24_0, arg_24_1)
		if not arg_22_0._isAllDisabled then
			local var_24_0 = arg_22_0:GetNextEnabledTab(arg_24_1.controller, 1, arg_22_1.wrap)

			if var_24_0 then
				var_0_10(arg_22_0, arg_24_1.controller)
				arg_22_0:FocusTab(arg_24_1.controller, var_24_0, FocusType.Gamepad)
			else
				arg_22_0:playSound("ui_deny")
			end
		end

		return true
	end)
	var_22_21:registerEventHandler("tab_mouse_select", function(arg_25_0, arg_25_1)
		if not arg_22_0._isAllDisabled and not not var_0_8(arg_22_0, arg_25_1.index) and arg_25_1.index ~= arg_22_0._currentTab then
			local var_25_0 = arg_25_1.controller or arg_22_0._controllerIndex

			var_0_10(arg_22_0, var_25_0)
			arg_22_0:FocusTab(var_25_0, arg_25_1.index, FocusType.MouseOver)
		end
	end)
	arg_22_0:addElement(var_22_21)

	if arg_22_0._buildArrows then
		arg_22_0.LeftArrow:registerEventHandler("button_action", function(arg_26_0, arg_26_1)
			if not arg_22_0._isAllDisabled then
				local var_26_0 = arg_22_0:GetNextEnabledTab(arg_26_1.controller, -1, true)

				if var_26_0 then
					var_0_10(arg_22_0, arg_26_1.controller)
					arg_22_0:FocusTab(arg_26_1.controller, var_26_0, FocusType.MouseOver)
				end
			end

			return true
		end)
		arg_22_0.RightArrow:registerEventHandler("button_action", function(arg_27_0, arg_27_1)
			if not arg_22_0._isAllDisabled then
				local var_27_0 = arg_22_0:GetNextEnabledTab(arg_27_1.controller, 1, true)

				if var_27_0 then
					var_0_10(arg_22_0, arg_27_1.controller)
					arg_22_0:FocusTab(arg_27_1.controller, var_27_0, FocusType.MouseOver)
				end
			end

			return true
		end)
	end

	arg_22_0:registerAndCallEventHandler("update_input_type", function(arg_28_0, arg_28_1)
		LUI.TabManager.UpdateButtonHelperVisibility(arg_28_0, arg_28_1.controllerIndex, {
			isSingleTab = arg_28_0._tabs and #arg_28_0._tabs == 1
		})
	end, {
		controllerIndex = arg_22_0._controllerIndex
	})
end

function LUI.TabManager.GetCurrentTabIndex(arg_29_0)
	return arg_29_0._currentTab
end

function LUI.TabManager.GetCurrentTab(arg_30_0)
	if arg_30_0._currentTab then
		local var_30_0 = arg_30_0._currentTab + 1

		assert(var_30_0 >= 1 and var_30_0 <= #arg_30_0._tabElements)

		return arg_30_0._tabElements[var_30_0]
	else
		return nil
	end
end

function LUI.TabManager.GetTabAtIndex(arg_31_0, arg_31_1)
	if arg_31_0._tabElements then
		assert(arg_31_1 >= 1 and arg_31_1 <= #arg_31_0._tabElements)

		return arg_31_0._tabElements[arg_31_1]
	end
end

function LUI.TabManager.IsTabAvailable(arg_32_0)
	return arg_32_0._tabElements and #arg_32_0._tabElements > 0
end

function LUI.TabManager.SetCurrentTabIndex(arg_33_0, arg_33_1)
	arg_33_0._currentTab = arg_33_1
end

function LUI.TabManager.GetTabManagerDataSource(arg_34_0)
	return arg_34_0._tabManagerDataSource
end

function LUI.TabManager.OpenTabByMenuName(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_0._tabIndexMap[arg_35_2] or -1
	local var_35_1 = var_35_0 > 0 and var_35_0 <= #arg_35_0.Tabs._tabs

	if not arg_35_0.Tabs._isAllDisabled and var_35_1 then
		var_0_10(arg_35_0.Tabs, arg_35_1)
		arg_35_0.Tabs:FocusTab(arg_35_1, var_35_0 - 1, FocusType.Gamepad)
	end
end

function LUI.TabManager.SetTabManagerDataSource(arg_36_0, arg_36_1)
	arg_36_0._tabManagerDataSource = arg_36_1

	var_0_9(arg_36_0)
end

function LUI.TabManager.SetTabs(arg_37_0, arg_37_1)
	arg_37_0._tabs = arg_37_1

	var_0_9(arg_37_0)
	LUI.TabManager.UpdateButtonHelperVisibility(arg_37_0, arg_37_0._controllerIndex, {
		isSingleTab = #arg_37_1 == 1
	})
end

function LUI.TabManager.SetAlignment(arg_38_0, arg_38_1)
	arg_38_0._tabNavigator:SetAlignment(arg_38_1)
end

function LUI.TabManager.DisableAll(arg_39_0)
	arg_39_0._isAllDisabled = true
end

function LUI.TabManager.EnableAll(arg_40_0)
	arg_40_0._isAllDisabled = false
end

function LUI.TabManager.HideTabs(arg_41_0)
	arg_41_0._tabNavigator:SetAlpha(0)
	arg_41_0:DisableAll()
	arg_41_0:SetMouseFocusBlocker(true)
end

function LUI.TabManager.ShowTabs(arg_42_0)
	arg_42_0._tabNavigator:SetAlpha(1)
	arg_42_0:EnableAll()
	arg_42_0:SetMouseFocusBlocker(false)
end

function LUI.TabManager.JustifyTabs(arg_43_0)
	local var_43_0, var_43_1, var_43_2, var_43_3 = arg_43_0:getLocalRect()
	local var_43_4 = var_43_2 - var_43_0

	if LUI.IsLastInputKeyboardMouse(arg_43_0._controllerIndex) and arg_43_0._buildArrows then
		local var_43_5, var_43_6

		var_43_0, var_43_5, var_43_2, var_43_6 = arg_43_0.LeftArrow:getLocalRect()
	else
		local var_43_7, var_43_8

		var_43_0, var_43_7, var_43_2, var_43_8 = arg_43_0.leftShoulderButton:getLocalRect()
	end

	local var_43_9 = (var_43_2 - var_43_0) * 2
	local var_43_10 = 0
	local var_43_11 = 0

	for iter_43_0, iter_43_1 in ipairs(arg_43_0._tabElements) do
		local var_43_12, var_43_13, var_43_14, var_43_15 = iter_43_1:getLocalRect()
		local var_43_16 = var_43_15
		local var_43_17 = var_43_14
		local var_43_18 = var_43_13

		var_43_10 = var_43_10 + (var_43_17 - var_43_12)
		var_43_11 = var_43_11 + 1
	end

	local var_43_19 = 0
	local var_43_20 = 0

	for iter_43_2, iter_43_3 in ipairs(arg_43_0._spacerElements) do
		local var_43_21, var_43_22, var_43_23, var_43_24 = iter_43_3:getLocalRect()
		local var_43_25 = var_43_24
		local var_43_26 = var_43_23
		local var_43_27 = var_43_22

		var_43_19 = var_43_19 + (var_43_26 - var_43_21)
		var_43_20 = var_43_20 + 1
	end

	local var_43_28 = (var_43_4 - (var_43_9 + var_43_10 + var_43_19)) / (var_43_11 + var_43_20 + 1)

	arg_43_0._tabNavigator:SetSpacing(var_43_28)
end

function LUI.TabManager.SizeTabsToFit(arg_44_0)
	local var_44_0, var_44_1, var_44_2, var_44_3 = arg_44_0:getLocalRect()
	local var_44_4 = var_44_2 - var_44_0

	if LUI.IsLastInputKeyboardMouse(arg_44_0._controllerIndex) and arg_44_0._buildArrows then
		local var_44_5, var_44_6

		var_44_0, var_44_5, var_44_2, var_44_6 = arg_44_0.LeftArrow:getLocalRect()
	else
		local var_44_7, var_44_8

		var_44_0, var_44_7, var_44_2, var_44_8 = arg_44_0.leftShoulderButton:getLocalRect()
	end

	local var_44_9 = (var_44_2 - var_44_0) * 2
	local var_44_10 = 0

	for iter_44_0, iter_44_1 in ipairs(arg_44_0._spacerElements) do
		local var_44_11, var_44_12, var_44_13, var_44_14 = iter_44_1:getLocalRect()
		local var_44_15 = var_44_14
		local var_44_16 = var_44_13
		local var_44_17 = var_44_12

		var_44_10 = var_44_10 + (var_44_16 - var_44_11)
	end

	local var_44_18 = var_44_4 - (var_44_9 + var_44_10)
	local var_44_19 = var_0_4(arg_44_0)
	local var_44_20 = (var_44_18 - 4 * var_44_19) / var_44_19

	for iter_44_2, iter_44_3 in ipairs(arg_44_0._tabElements) do
		iter_44_3:SetRight(var_44_20)
	end
end

function LUI.TabManager.SetTabSpacing(arg_45_0, arg_45_1)
	arg_45_0._tabNavigator:SetSpacing(arg_45_1)
end

function LUI.TabManager.FocusTab(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	if arg_46_0._tabs and arg_46_2 > #arg_46_0._tabs - 1 then
		DebugPrint("WARNING: Attempt to focus tab " .. arg_46_2 .. " but max tab is " .. #arg_46_0._tabs - 1)

		arg_46_2 = #arg_46_0._tabs - 1
	end

	if var_0_7(arg_46_0, arg_46_2)(arg_46_1, arg_46_2, arg_46_3) then
		local var_46_0 = arg_46_3 == FocusType.Gamepad or arg_46_3 == FocusType.MouseOver

		arg_46_0:processEvent({
			name = "focus_tab",
			index = arg_46_2,
			playSound = var_46_0
		})

		local var_46_1 = var_0_6(arg_46_0, arg_46_2)

		arg_46_0._currentTab = arg_46_2

		if var_46_1 then
			var_46_1(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
		end

		if arg_46_0._tabIndexDataSource then
			arg_46_0._tabIndexDataSource:SetValue(arg_46_1, arg_46_2)
		end

		if arg_46_0._tabManagerDataSource then
			local var_46_2 = arg_46_0._tabManagerDataSource:GetDataSourceAtIndex(arg_46_2, arg_46_1)

			arg_46_0:SetDataSource(var_46_2, arg_46_1)
		end
	end
end

function LUI.TabManager.getAllFocusedChildren(arg_47_0, arg_47_1)
	arg_47_1 = arg_47_1 or {}

	if arg_47_0._currentTab then
		arg_47_0.saveData = {
			currentTab = arg_47_0._currentTab
		}

		table.insert(arg_47_1, arg_47_0)
	end

	return arg_47_1
end

function LUI.TabManager.restoreFocus(arg_48_0, arg_48_1)
	if arg_48_1.data and arg_48_1.data.currentTab then
		arg_48_0:FocusTab(arg_48_1.controller, arg_48_1.data.currentTab, FocusType.MenuFlow)
	end

	return arg_48_0:dispatchEventToChildren(arg_48_1)
end

function LUI.TabManager.SetTabManagerDataSourceThroughElement(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = DataLink.new({
		target = arg_49_0,
		source = arg_49_1,
		relativeDataSourcePath = arg_49_2,
		type = DataLink.TYPES.tabManagerDataSource
	})

	var_49_0:Link()
	var_49_0:Refresh()

	return var_49_0
end

function LUI.TabManager.AddBacker(arg_50_0, arg_50_1)
	local var_50_0

	if arg_50_1 then
		var_50_0 = arg_50_1
	else
		var_50_0 = MenuBuilder.BuildRegisteredType("TabsBacker", {
			controllerIndex = arg_50_0._controllerIndex
		})
	end

	var_50_0.id = "tabsBacker"

	var_50_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -5, _1080p * 5)
	var_50_0:setPriority(-1)
	arg_50_0.navigatorContainer:addElement(var_50_0)

	arg_50_0._tabsBacker = var_50_0
end

function LUI.TabManager.GetNextEnabledTab(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
	local var_51_0 = arg_51_0._currentTab
	local var_51_1
	local var_51_2 = var_0_4(arg_51_0)

	if var_51_2 < 1 then
		return nil
	end

	local var_51_3 = var_51_2 - 1

	while var_51_1 == nil do
		local var_51_4 = var_51_0 + arg_51_2

		if var_51_3 < var_51_4 then
			if arg_51_3 then
				var_51_4 = 0
			else
				return nil
			end
		elseif var_51_4 < 0 then
			if arg_51_3 then
				var_51_4 = var_51_3
			else
				return nil
			end
		end

		if not not var_0_8(arg_51_0, var_51_4) then
			return var_51_4
		elseif var_51_4 == arg_51_0._currentTab then
			return nil
		else
			var_51_0 = var_51_4
		end
	end

	return nil
end

function LUI.TabManager.SetTabIndexDataSource(arg_52_0, arg_52_1)
	arg_52_0._tabIndexDataSource = arg_52_1
end

function LUI.TabManager.GetCurrentTabMenu(arg_53_0)
	assert(arg_53_0.currentMenu)

	return arg_53_0.currentMenu
end

function LUI.TabManager.SetDefaultFocus(arg_54_0, arg_54_1)
	arg_54_0._defaultFocus = arg_54_1
end

function LUI.TabManager.SetSendEventOnTabChange(arg_55_0, arg_55_1)
	arg_55_0._sendTabSwitchEvent = arg_55_1
end
