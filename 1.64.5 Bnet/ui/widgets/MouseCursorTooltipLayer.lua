LUI.MouseCursorTooltipLayer = LUI.Class(LUI.UIElement)

local var_0_0 = 500
local var_0_1 = 150
local var_0_2 = 150

function LUI.MouseCursorTooltipLayer.init(arg_1_0, arg_1_1)
	LUI.MouseCursorTooltipLayer.super.init(arg_1_0)

	arg_1_0.id = "MouseCursorTooltip"

	assert(arg_1_1.controllerIndex)

	arg_1_0._controllerIndex = arg_1_1.controllerIndex
end

function LUI.MouseCursorTooltipLayer.InitLayer(arg_2_0)
	local var_2_0 = MenuBuilder.BuildRegisteredType("MouseCursorTooltip", {
		controllerIndex = arg_2_0._controllerIndex
	})

	var_2_0.id = "tooltip"
	var_2_0._defaultWidth = 350 * _1080p

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, var_2_0._defaultWidth, _1080p * 0, _1080p * 200)
	arg_2_0:addElement(var_2_0)

	local var_2_1 = MenuBuilder.BuildRegisteredType("MouseCursorTooltipDetails", {
		controllerIndex = arg_2_0._controllerIndex
	})

	var_2_1.id = "foreground"

	arg_2_0:addElement(var_2_1)

	arg_2_0.foreground = var_2_1

	arg_2_0.foreground:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	arg_2_0.tooltip = var_2_0

	arg_2_0.tooltip:SetIgnoreInvisibleChildren(true)

	arg_2_0._toggleTimerRefCount = arg_2_0._toggleTimerRefCount or 0
	arg_2_0._tooltipIsActive = arg_2_0._tooltipIsActive or false
	arg_2_0._tooltipPositionSet = false

	LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_2_0._controllerIndex)
	arg_2_0:registerEventHandler("update_input_type", function(arg_3_0, arg_3_1)
		if not LUI.IsLastInputMouseNavigation(arg_3_1.controllerIndex) then
			LUI.MouseCursorTooltipLayer.ForceCloseTooltip(arg_3_1.controllerIndex, 0)
		end
	end)
	arg_2_0:registerEventHandler("closeallmenus", function(arg_4_0, arg_4_1)
		if arg_4_0.tooltip then
			LUI.MouseCursorTooltipLayer.ForceCloseTooltip(arg_4_1.controller or Engine.IJEBHJIJF())
		end
	end)
end

function LUI.MouseCursorTooltipLayer.ClearLayer(arg_5_0)
	if arg_5_0.tooltip then
		arg_5_0.tooltip:closeTree()

		arg_5_0.tooltip = nil
	end

	if arg_5_0.foreground then
		arg_5_0.foreground:closeTree()

		arg_5_0.foreground = nil
	end

	if arg_5_0.__tooltipToggleTimer then
		arg_5_0.__tooltipToggleTimer:closeTree()

		arg_5_0.__tooltipToggleTimer = nil
	end
end

function LUI.MouseCursorTooltipLayer.GetLayer()
	return Engine.DBFFAEEFGJ().mouseCursorTooltipLayer
end

function LUI.MouseCursorTooltipLayer.ShouldBeVisible(arg_7_0)
	local var_7_0 = Engine.DBFFAEEFGJ().cursor
	local var_7_1 = false

	if var_7_0 then
		if Engine.DDJFBBJAIG() then
			for iter_7_0 = 0, Engine.DCJGJDDEHE() - 1 do
				if Engine.BBHAECABBD(iter_7_0) and Engine.BECCFCBIAA("toggleTooltipEnable", iter_7_0) == 1 then
					var_7_1 = true

					break
				end
			end
		else
			var_7_1 = Engine.BECCFCBIAA("toggleTooltipEnable", arg_7_0._controllerIndex) == 1
		end
	end

	return var_7_0 and var_7_1
end

local function var_0_3(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_2.horizontalAlignment
	local var_8_1 = arg_8_2.verticalAlignment
	local var_8_2 = arg_8_2.disabledCondition
	local var_8_3 = arg_8_0.tooltip

	if var_8_3 then
		local var_8_4, var_8_5 = Engine.DJHEEAFGDJ(arg_8_1)
		local var_8_6 = Engine.DBFFAEEFGJ()
		local var_8_7, var_8_8 = ProjectRootCoordinate(var_8_6.name, var_8_4, var_8_5)
		local var_8_9, var_8_10 = var_8_6:PixelsToUnits(var_8_7, var_8_8)

		var_8_3._tooltipHeight = var_8_3:ComputeTotalHeightToChildrenHeight()
		var_8_3._tooltipWidth = var_8_3:ComputeTotalWidthToMaxChildrenWidth()

		var_8_3:SetBottom(var_8_3._tooltipHeight)
		var_8_3:SetRight(var_8_3._tooltipWidth)

		if var_8_0 then
			var_8_3._initialHorizontalAlignment = var_8_0
		else
			local var_8_11 = var_8_9 + var_8_3._tooltipWidth

			var_8_3._initialHorizontalAlignment = LAYOUT.GetHorizontalOutOfScreenOffset(var_8_6, var_8_11) == 0 and "right" or "left"
		end

		if var_8_1 then
			var_8_3._initialVerticalAlignment = var_8_1
		else
			local var_8_12 = var_8_10 + var_8_3._tooltipHeight
			local var_8_13 = 0.95

			var_8_3._initialVerticalAlignment = LAYOUT.GetVerticalOutOfScreenOffset(var_8_6, var_8_12, var_8_13) == 0 and "bottom" or "top"
		end

		local var_8_14 = var_8_3._initialHorizontalAlignment == "right" and 0 or var_8_3._tooltipWidth
		local var_8_15 = var_8_3._initialVerticalAlignment == "bottom" and 0 or var_8_3._tooltipHeight
		local var_8_16 = 0

		if var_8_3._initialVerticalAlignment == "bottom" then
			if var_8_3._initialHorizontalAlignment == "left" then
				var_8_16 = -90
			end
		else
			var_8_16 = var_8_3._initialHorizontalAlignment == "left" and 180 or 90
		end

		if arg_8_0.foreground.SetCrosshairPosition then
			arg_8_0.foreground:SetCrosshairPosition(var_8_14, var_8_15, var_8_16)
		end

		local var_8_17, var_8_18 = var_8_3:ComputeTooltipPosition(var_8_6, var_8_9, var_8_10)

		arg_8_0._tooltipPosition = {
			x = var_8_17,
			y = var_8_18
		}

		local var_8_19 = arg_8_0._tooltipPosition
		local var_8_20 = var_8_19.x + var_8_3._tooltipWidth
		local var_8_21 = var_8_19.y + var_8_3._tooltipHeight

		arg_8_0:SetAnchorsAndPosition(0, 1, 0, 1, var_8_19.x, var_8_20, var_8_19.y, var_8_21)
	end
end

local function var_0_4(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = arg_9_0.tooltip

	if var_9_0 then
		arg_9_0:UpdateTooltipData(arg_9_1, arg_9_3)

		arg_9_0.focusedElem = arg_9_2

		if var_9_0._hasPrompts or var_9_0._hasTitle or var_9_0._hasDescription then
			arg_9_0:SetAlpha(1, var_0_1)

			arg_9_0._tooltipPositionSet = true
			arg_9_0._tooltipIsActive = true
			arg_9_0._tooltipData = arg_9_3

			if arg_9_0.__tooltipToggleTimer then
				arg_9_0.__tooltipToggleTimer:closeTree()

				arg_9_0.__tooltipToggleTimer = nil
			end
		end
	end
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.tooltip
	local var_10_1 = arg_10_2 or var_0_2

	arg_10_0:SetAlpha(0, var_10_1)

	if arg_10_0.focusedElem then
		arg_10_0.focusedElem._shouldClearTooltipData = nil
		arg_10_0.focusedElem = nil
	end

	arg_10_0._tooltipIsActive = false
	arg_10_0._toggleTimerRefCount = 0
	arg_10_0._tooltipPositionSet = false
	arg_10_0._tooltipData = nil

	if arg_10_0.__tooltipToggleTimer then
		arg_10_0.__tooltipToggleTimer:closeTree()

		arg_10_0.__tooltipToggleTimer = nil
	end
end

local function var_0_6(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_0.tooltip then
		local var_11_0 = var_0_0

		if arg_11_0.__tooltipToggleTimer == nil then
			arg_11_0.__tooltipToggleTimer = LUI.UITimer.new({
				event = "toggle_tooltip_timer",
				interval = var_11_0
			})
			arg_11_0.__tooltipToggleTimer.id = "timer"

			arg_11_0:addElement(arg_11_0.__tooltipToggleTimer)
			arg_11_0.__tooltipToggleTimer:registerEventHandler("toggle_tooltip_timer", function(arg_12_0, arg_12_1)
				var_0_4(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
			end)
		else
			arg_11_0.__tooltipToggleTimer:closeTree()

			arg_11_0.__tooltipToggleTimer = nil
		end
	end
end

local function var_0_7(arg_13_0)
	local var_13_0 = arg_13_0

	while var_13_0 do
		if var_13_0._tooltipData then
			return var_13_0._tooltipData, var_13_0
		end

		var_13_0 = var_13_0:getParent()
	end

	return nil, arg_13_0
end

function LUI.MouseCursorTooltipLayer.AddTooltipMouseHandlerToElement(arg_14_0)
	if not arg_14_0.tooltipMouseHandlersAdded then
		arg_14_0:addEventHandler("mouseenter", function(arg_15_0, arg_15_1)
			if Engine.DBFFAEEFGJ().cursor then
				local var_15_0 = arg_15_1.controller

				if var_15_0 then
					LUI.MouseCursorTooltipLayer.MouseEnterTooltipUpdate(var_15_0, arg_15_0)
				end
			end
		end)
		arg_14_0:addEventHandler("mouseleave", function(arg_16_0)
			local var_16_0 = Engine.DBFFAEEFGJ().cursor

			if var_16_0 then
				local var_16_1 = var_16_0._controllerIndex

				if var_16_1 then
					LUI.MouseCursorTooltipLayer.MouseLeaveTooltipUpdate(var_16_1, arg_16_0)
				end
			end
		end)

		arg_14_0.tooltipMouseHandlersAdded = true
	end
end

function LUI.MouseCursorTooltipLayer.AddTootlipMouseHandlerToFocusableChildren(arg_17_0)
	local var_17_0 = arg_17_0:getFirstChild()

	while var_17_0 do
		local var_17_1 = var_17_0:getNextSibling()

		if var_17_0.handleMouseMove then
			LUI.MouseCursorTooltipLayer.AddTooltipMouseHandlerToElement(var_17_0)
		end

		LUI.MouseCursorTooltipLayer.AddTootlipMouseHandlerToFocusableChildren(var_17_0)

		var_17_0 = var_17_1
	end
end

function LUI.MouseCursorTooltipLayer.MouseEnterTooltipUpdate(arg_18_0, arg_18_1)
	local var_18_0 = LUI.MouseCursorTooltipLayer.GetLayer()

	if var_18_0 and var_18_0.tooltip then
		local var_18_1, var_18_2 = var_0_7(arg_18_1)

		if var_18_2 and var_18_1 then
			local var_18_3 = var_18_0.focusedElem == var_18_2

			if var_18_0.focusedElem == nil or not var_18_3 then
				LUI.MouseCursorTooltipLayer.TryOpenTooltip(var_18_0, arg_18_0, var_18_2, var_18_1)

				arg_18_1._shouldClearTooltipData = true
			elseif var_18_0._tooltipIsActive and var_18_3 then
				LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_18_0)
			end
		end
	end
end

function LUI.MouseCursorTooltipLayer.MouseLeaveTooltipUpdate(arg_19_0, arg_19_1)
	local var_19_0 = LUI.MouseCursorTooltipLayer.GetLayer()

	if var_19_0 and var_19_0.tooltip then
		local var_19_1, var_19_2 = var_0_7(arg_19_1)

		if arg_19_1._shouldClearTooltipData then
			LUI.MouseCursorTooltipLayer.ClearTooltipData(var_19_0, arg_19_0, arg_19_1)

			arg_19_1._shouldClearTooltipData = nil
		elseif var_19_1 then
			LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_19_0)
		end
	end
end

function LUI.MouseCursorTooltipLayer.TooltipElementClosed(arg_20_0, arg_20_1)
	local var_20_0 = LUI.MouseCursorTooltipLayer.GetLayer()

	if var_20_0 and var_20_0.tooltip and var_20_0.focusedElem == arg_20_1 and arg_20_1._shouldClearTooltipData then
		LUI.MouseCursorTooltipLayer.ClearTooltipData(var_20_0, arg_20_0, arg_20_1)

		arg_20_1._shouldClearTooltipData = nil
	end
end

function LUI.MouseCursorTooltipLayer.TryOpenTooltip(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if arg_21_0.tooltip and Engine.BECCFCBIAA("toggleTooltipEnable", arg_21_1) == 1 then
		arg_21_0.focusedElem = arg_21_2
		arg_21_0._tooltipData = arg_21_3
		arg_21_0._toggleTimerRefCount = arg_21_0._toggleTimerRefCount + 1

		var_0_6(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	end
end

function LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_22_0)
	local var_22_0 = LUI.MouseCursorTooltipLayer.GetLayer()

	if var_22_0 then
		local var_22_1 = var_22_0.tooltip
		local var_22_2 = var_22_0._tooltipData

		if var_22_1 and var_22_2 then
			var_22_0:UpdateTooltipData(arg_22_0, var_22_2)

			if not (var_22_1._hasPrompts or var_22_1._hasTitle or var_22_1._hasDescription) then
				var_22_0:SetAlpha(0)

				var_22_0.hiddenFromRefresh = true
			elseif var_22_0.hiddenFromRefresh then
				var_22_0:SetAlpha(1)

				var_22_0.hiddenFromRefresh = nil
			end
		end
	end
end

function LUI.MouseCursorTooltipLayer.UpdateTooltipData(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_2.title
	local var_23_1 = arg_23_2.description
	local var_23_2 = arg_23_2.promptsData
	local var_23_3 = arg_23_0.tooltip

	if var_23_3 then
		var_23_3:SetTitle(var_23_0)
		var_23_3:SetDescription(var_23_1)
		var_23_3:SetKeyPrompts(var_23_2, arg_23_1)
		var_0_3(arg_23_0, arg_23_1, arg_23_2)
	end
end

function LUI.MouseCursorTooltipLayer.ForceCloseTooltip(arg_24_0, arg_24_1)
	local var_24_0 = LUI.MouseCursorTooltipLayer.GetLayer()

	if var_24_0 then
		var_0_5(var_24_0, arg_24_0, arg_24_1)
	end
end

function LUI.MouseCursorTooltipLayer.ClearTooltipData(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_0.tooltip and arg_25_0._toggleTimerRefCount ~= nil then
		arg_25_0._toggleTimerRefCount = arg_25_0._toggleTimerRefCount - 1

		if arg_25_0._toggleTimerRefCount <= 0 or arg_25_2 == nil then
			var_0_5(arg_25_0)
		else
			arg_25_0:SetAlpha(0, var_0_2)

			arg_25_0.tooltip:Wait(var_0_2).onComplete = function()
				if arg_25_0._tooltipData then
					var_0_4(arg_25_0, arg_25_1, arg_25_2, arg_25_0._tooltipData)
				end
			end
		end
	end
end
