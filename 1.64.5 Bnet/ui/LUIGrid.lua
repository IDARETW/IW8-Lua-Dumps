LUI.UIGrid = LUI.Class(LUI.UIElement)
LUI.UIDataSourceGrid = LUI.Class(LUI.UIGrid)
LUI.UIPeekingGrid = LUI.Class(LUI.UIGrid)
LUI.UIGrid.ARROW_FOR = {
	next = 1,
	previous = 0
}

local var_0_0

LUI.UIGrid.GRID_EPSILON = 0.01

local function var_0_1(arg_1_0)
	arg_1_0.DebugBackground = LUI.UIImage.new()
	arg_1_0.DebugBackground.id = "DebugBackground"

	arg_1_0.DebugBackground:SetRGBFromTable({
		g = 0.12,
		b = 0.15,
		r = 0.9
	})
	arg_1_0:addEventHandler("layout_initialized", function(arg_2_0, arg_2_1)
		arg_2_0.DebugBackground:addElementBefore(arg_2_0)
	end)

	arg_1_0.DebugBackground._updateDebugBackgroundTimer = LUI.UITimer.new({
		event = "debug_update_pos_and_size",
		interval = 32,
		eventTarget = arg_1_0
	})

	arg_1_0.DebugBackground:addElement(arg_1_0.DebugBackground._updateDebugBackgroundTimer)
	arg_1_0:registerEventHandler("debug_update_pos_and_size", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0:GetCurrentAnchorsAndPositions()

		if arg_3_0.DebugBackground and arg_3_0.DebugBackground:getParent() then
			arg_3_0.DebugBackground:SetAnchorsAndPosition(var_3_0.leftAnchor, var_3_0.rightAnchor, var_3_0.topAnchor, var_3_0.bottomAnchor, var_3_0.left, var_3_0.right, var_3_0.top, var_3_0.bottom)
			arg_3_0.DebugBackground:SetAlpha(arg_3_0:GetAlpha())
			arg_3_0.DebugBackground:SetScale(arg_3_0:GetScale())
		end
	end)

	local var_1_0 = arg_1_0.closeTree

	function arg_1_0.closeTree(arg_4_0)
		var_1_0(arg_4_0)
		arg_4_0.DebugBackground:closeTree()

		arg_4_0.DebugBackground = nil
	end
end

function LUI.UIGrid.init(arg_5_0, arg_5_1)
	Engine.BHFFIBEFFH("UIGrid", "widget")
	assert(arg_5_1)
	assert(type(arg_5_1.maxVisibleRows) == "number")
	assert(type(arg_5_1.maxVisibleColumns) == "number")
	assert(arg_5_1.buildChild == nil or type(arg_5_1.buildChild) == "function")
	assert(arg_5_1.refreshChild == nil or type(arg_5_1.refreshChild) == "function")
	assert(arg_5_1.measureRow == nil or type(arg_5_1.measureRow) == "function")
	assert(arg_5_1.rowHeight == nil or type(arg_5_1.rowHeight) == "number")
	assert(arg_5_1.rowHeight or arg_5_1.measureRow or not arg_5_1.buildChild)
	assert(arg_5_1.measureColumn == nil or type(arg_5_1.measureColumn) == "function")
	assert(arg_5_1.columnWidth == nil or type(arg_5_1.columnWidth) == "number")
	assert(arg_5_1.columnWidth or arg_5_1.measureColumn or not arg_5_1.buildChild)
	assert(arg_5_1.isPositionFocusable == nil or type(arg_5_1.isPositionFocusable) == "function")
	assert(arg_5_1.wrapX == nil or type(arg_5_1.wrapX) == "boolean")
	assert(arg_5_1.wrapY == nil or type(arg_5_1.wrapY) == "boolean")
	assert(arg_5_1.spacingX == nil or type(arg_5_1.spacingX) == "number")
	assert(arg_5_1.spacingY == nil or type(arg_5_1.spacingY) == "number")
	assert(arg_5_1.horizontalAlignment == nil or type(arg_5_1.horizontalAlignment) == "number")
	assert(arg_5_1.verticalAlignment == nil or type(arg_5_1.verticalAlignment) == "number")
	assert(arg_5_1.defaultFocus == nil or type(arg_5_1.defaultFocus) == "table")
	assert(arg_5_1.numRows == nil or type(arg_5_1.numRows) == "number")
	assert(arg_5_1.numColumns == nil or type(arg_5_1.numColumns) == "number")
	assert(arg_5_1.numChildren == nil or type(arg_5_1.numChildren) == "number")
	assert(arg_5_1.scrollingThresholdX == nil or type(arg_5_1.scrollingThresholdX) == "number")
	assert(arg_5_1.scrollingThresholdY == nil or type(arg_5_1.scrollingThresholdY) == "number")
	assert(arg_5_1.maxVelocity == nil or type(arg_5_1.maxVelocity) == "number")
	assert(arg_5_1.springCoefficient == nil or type(arg_5_1.springCoefficient) == "number")
	assert(arg_5_1.primaryAxis == nil or type(arg_5_1.primaryAxis) == "number")
	assert(arg_5_1.adjustSizeToContent == nil or type(arg_5_1.adjustSizeToContent) == "boolean")
	assert(arg_5_1.alwaysSnap == nil or type(arg_5_1.alwaysSnap) == "boolean")
	assert(arg_5_1.disableMouseWheel == nil or type(arg_5_1.disableMouseWheel) == "boolean")
	assert(arg_5_1.arrowsEnabled == nil or type(arg_5_1.arrowsEnabled) == "boolean")
	assert(arg_5_1.widgetsAlwaysVisible == nil or type(arg_5_1.widgetsAlwaysVisible) == "boolean")
	assert(arg_5_1.directionalInputEnabled == nil or type(arg_5_1.directionalInputEnabled) == "boolean")
	assert(arg_5_1.buildArrowsLabel == nil or type(arg_5_1.buildArrowsLabel) == "boolean")
	assert(arg_5_1.arrowsVerticalOffset == nil or type(arg_5_1.arrowsVerticalOffset) == "number")
	assert(arg_5_1.alwaysTrapMouseWheel == nil or type(arg_5_1.alwaysTrapMouseWheel) == "boolean")
	assert(arg_5_1.countFunction == nil or type(arg_5_1.countFunction) == "function")

	arg_5_1.adjustSizeToContent = arg_5_1.adjustSizeToContent == true
	arg_5_1.spacingX = arg_5_1.spacingX or 0
	arg_5_1.spacingY = arg_5_1.spacingY or 0
	arg_5_1.maxVelocity = arg_5_1.maxVelocity or 5000
	arg_5_1.springCoefficient = arg_5_1.springCoefficient or 400
	arg_5_1.arrowsVerticalOffset = arg_5_1.arrowsVerticalOffset or arg_5_1.spacingY

	if not arg_5_1.primaryAxis then
		if arg_5_1.maxVisibleColumns == 1 and arg_5_1.maxVisibleRows > 1 then
			arg_5_1.primaryAxis = LUI.DIRECTION.vertical
		else
			arg_5_1.primaryAxis = LUI.DIRECTION.horizontal
		end
	end

	assert(arg_5_1.primaryAxis == LUI.DIRECTION.horizontal or arg_5_1.primaryAxis == LUI.DIRECTION.vertical)
	LUI.UIGrid.super.init(arg_5_0)

	arg_5_0.id = "UIGrid"
	arg_5_0._controllerIndex = arg_5_1.controllerIndex
	arg_5_0._isPositionFocusable = arg_5_1.isPositionFocusable
	arg_5_0._rowHeight = arg_5_1.rowHeight
	arg_5_0._columnWidth = arg_5_1.columnWidth
	arg_5_0._spacingX = arg_5_1.spacingX
	arg_5_0._spacingY = arg_5_1.spacingY
	arg_5_0._wrapX = arg_5_1.wrapX or false
	arg_5_0._wrapY = arg_5_1.wrapY or false
	arg_5_0._defaultFocus = arg_5_1.defaultFocus or nil
	arg_5_0._scrollingThresholdX = arg_5_1.scrollingThresholdX or 1
	arg_5_0._scrollingThresholdY = arg_5_1.scrollingThresholdY or 1
	arg_5_0._scrollingThresholdPixelX = arg_5_1.scrollingThresholdPixelX or 0
	arg_5_0._scrollingThresholdPixelY = arg_5_1.scrollingThresholdPixelY or 0
	arg_5_0._permittedQualifiers = arg_5_1.permittedQualifiers or {}
	arg_5_0._horizontalAlignment = arg_5_1.horizontalAlignment
	arg_5_0._verticalAlignment = arg_5_1.verticalAlignment
	arg_5_0._alwaysSnap = arg_5_1.alwaysSnap == true
	arg_5_0._disableMouseWheel = arg_5_1.disableMouseWheel
	arg_5_0._arrowsEnabled = arg_5_1.arrowsEnabled ~= false
	arg_5_0._widgetsAlwaysVisible = arg_5_1.widgetsAlwaysVisible or false
	arg_5_0._directionalInputEnabled = arg_5_1.directionalInputEnabled ~= false
	arg_5_0._alwaysTrapMouseWheel = arg_5_1.alwaysTrapMouseWheel or false
	arg_5_0._buildChild = arg_5_1.buildChild
	arg_5_0._onNewTargetFocusPosition = arg_5_1.onNewTargetFocusPosition or nil
	arg_5_0._arrows = {}
	arg_5_0._itemNumbers = {}
	arg_5_0._scrollbars = {}
	arg_5_0._mouseWheelScrollingVerticalOffsetPx = arg_5_1.mouseWheelScrollingOffsetPx or 16
	arg_5_0._mouseWheelScrollingHorizontalOffsetPx = arg_5_1.mouseWheelScrollingOffsetPx or 56
	arg_5_0._showNumbersAndArrowsKBM = false
	arg_5_0._updateArrowVisibilityOnRefresh = true
	arg_5_0._countFunction = arg_5_1.countFunction or nil

	if Engine.BHICADFIHA() then
		arg_5_0._refreshChild = arg_5_1.refreshChild
		arg_5_0._isGrid = true
	end

	arg_5_0:registerEventHandler("position_visible", function(arg_6_0, arg_6_1)
		assert(arg_6_1.row and arg_6_1.column)
		assert(arg_6_1.child)

		if arg_6_0._targetPosition and arg_6_1.child ~= arg_6_1._childInFocus and arg_6_0._shouldFocus and arg_6_1.row == arg_6_0._targetPosition.y and arg_6_1.column == arg_6_0._targetPosition.x then
			if arg_6_0._isWrapping then
				arg_6_0._isWrapping = false
			end

			arg_6_0:GiveFocusToChild(arg_6_1.child)
		end
	end)
	arg_5_0:registerEventHandler("restore_focus", arg_5_0.restoreFocus)
	arg_5_0:registerEventHandler("gain_focus", function(arg_7_0, arg_7_1)
		return arg_7_0:GainFocus(arg_7_1)
	end)
	arg_5_0:registerEventHandler("lose_focus", function(arg_8_0, arg_8_1)
		return arg_8_0:LoseFocus(arg_8_1)
	end)
	arg_5_0:registerEventHandler("gamepad_button", function(arg_9_0, arg_9_1)
		return arg_9_0:GamepadButton(arg_9_1)
	end)
	arg_5_0:registerEventHandler("update_input_type", LUI.UIGrid.UpdateNumbersArrowsAndScrolling)
	arg_5_0:registerEventHandler("grid_size_updated", function(arg_10_0, arg_10_1)
		arg_10_0:UpdateNumbersArrowsAndScrolling()
	end)
	arg_5_0:registerEventHandler("ensure_line_visible", function(arg_11_0, arg_11_1)
		arg_11_0:EnsureLineVisible(arg_11_1.direction, arg_11_1.line, arg_11_1.force)
	end)

	if Engine.EABCCIBFIG() then
		arg_5_0:addEventHandler("update_current_grid_focus", function(arg_12_0, arg_12_1)
			local var_12_0, var_12_1 = arg_12_0:GetChildPosition(arg_12_1.child)

			if arg_12_1.focusType == FocusType.MouseOver and var_12_0 and var_12_1 then
				local var_12_2, var_12_3 = arg_12_0:GetColumnBoundaries()
				local var_12_4, var_12_5 = arg_12_0:GetRowBoundaries()

				if var_12_2 and var_12_4 then
					var_12_0 = LUI.clamp(var_12_0, var_12_2, var_12_3)
					var_12_1 = LUI.clamp(var_12_1, var_12_4, var_12_5)
				end
			end

			if not (arg_12_0._targetPosition and arg_12_0._targetPosition.x == var_12_0 and arg_12_0._targetPosition.y == var_12_1) and var_12_0 and var_12_1 then
				arg_12_0._targetPosition = {
					x = var_12_0,
					y = var_12_1
				}
				arg_12_0._childInFocus = arg_12_0:GetElementAtPosition(var_12_0, var_12_1)

				arg_12_0:PositionChanged()

				arg_12_0._shouldFocus = true

				arg_12_0:FocusChanged(arg_12_1.focusType)
			end
		end)
	end

	arg_5_0:SetHandleMouse(true)
	arg_5_0:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_NORMAL)
	arg_5_0:registerEventHandler("mousedown", function()
		return true
	end)
	arg_5_0:registerEventHandler("mouseup", function()
		return true
	end)
	arg_5_0:SetupUIGrid(arg_5_1)

	if arg_5_1.buildArrowsLabel then
		arg_5_0:BuildGridCountArrows(nil, arg_5_1.arrowsVerticalOffset)
	end

	if Dvar.IBEGCHEFE("lui_enable_grid_background_debugging") then
		var_0_1(arg_5_0)
	end

	Engine.DCHDDCJCEG("UIGrid", "widget")
end

function LUI.UIGrid.SetScrollingThreshold(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._scrollingThresholdX = arg_15_1 or arg_15_0._scrollingThresholdX
	arg_15_0._scrollingThresholdY = arg_15_2 or arg_15_0._scrollingThresholdY
end

function LUI.UIGrid.GetSpacingX(arg_16_0)
	return arg_16_0._spacingX
end

function LUI.UIGrid.GetSpacingY(arg_17_0)
	return arg_17_0._spacingY
end

function LUI.UIGrid.GetRowHeight(arg_18_0)
	return arg_18_0._rowHeight
end

function LUI.UIGrid.GetColumnWidth(arg_19_0)
	return arg_19_0._columnWidth
end

function LUI.UIGrid.SetRefreshChild(arg_20_0, arg_20_1)
	if Engine.BHICADFIHA() then
		arg_20_0._refreshChild = arg_20_1
	end

	arg_20_0:SetRefreshChildInC(arg_20_1)
end

function LUI.UIGrid.ColumnRowToPrimarySecondary(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		return arg_21_1, arg_21_2
	else
		return arg_21_2, arg_21_1
	end
end

function LUI.UIGrid.PrimarySecondaryToColumnRow(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		return arg_22_1, arg_22_2
	else
		return arg_22_2, arg_22_1
	end
end

function LUI.UIGrid.SetNumChildren(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_0.maxAllocatedChildren then
		assert(arg_23_1 <= arg_23_0.maxAllocatedChildren, "LUIGrid: Trying to set more than the max number of allowed children.")
	end

	if arg_23_2 and arg_23_2.shouldRemoveExcessChildren then
		arg_23_0.maxAllocatedChildren = arg_23_1

		local var_23_0 = arg_23_0:GetBuiltChildren()
		local var_23_1 = #var_23_0

		if var_23_1 - arg_23_1 > 0 then
			for iter_23_0 = var_23_1, arg_23_1 + 1, -1 do
				local var_23_2 = var_23_0[iter_23_0]

				arg_23_0:RemoveElement(var_23_2)
				var_23_2:closeTree()

				local var_23_3
			end
		end

		arg_23_0:SetNumChildrenInC(arg_23_1, arg_23_2.shouldRemoveExcessChildren)
	else
		arg_23_0:SetNumChildrenInC(arg_23_1)
	end

	if arg_23_0._targetPosition then
		if arg_23_0._shouldFocus then
			arg_23_0:SetFocusedPosition(arg_23_0._targetPosition, true)
		else
			arg_23_0:SetPosition(arg_23_0._targetPosition, true)
		end
	else
		arg_23_0:SetTargetColumnToDefault()
		arg_23_0:SetTargetRowToDefault()
	end
end

function LUI.UIGrid.SetNumColumns(arg_24_0, arg_24_1)
	arg_24_0:SetNumColumnsInC(arg_24_1)

	if arg_24_0._targetPosition then
		if arg_24_0._shouldFocus then
			arg_24_0:SetFocusedPosition(arg_24_0._targetPosition, true)
		else
			arg_24_0:SetPosition(arg_24_0._targetPosition, true)
		end
	else
		arg_24_0:SetTargetColumnToDefault()
	end
end

function LUI.UIGrid.SetNumRows(arg_25_0, arg_25_1)
	arg_25_0:SetNumRowsInC(arg_25_1)

	if arg_25_0._targetPosition then
		if arg_25_0._shouldFocus then
			arg_25_0:SetFocusedPosition(arg_25_0._targetPosition, true)
		else
			arg_25_0:SetPosition(arg_25_0._targetPosition, true)
		end
	else
		arg_25_0:SetTargetRowToDefault()
	end
end

function LUI.UIGrid.EnsureLineVisible(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	assert(arg_26_1 == LUI.DIRECTION.vertical and (arg_26_0._verticalAlignment == LUI.Alignment.Top or arg_26_0._verticalAlignment == nil) or arg_26_1 == LUI.DIRECTION.horizontal and (arg_26_0._horizontalAlignment == LUI.Alignment.Left or arg_26_0._horizontalAlignment == nil))

	local var_26_0
	local var_26_1
	local var_26_2

	if arg_26_1 == LUI.DIRECTION.horizontal then
		var_26_0 = arg_26_0.SetTargetColumn
		var_26_1 = arg_26_0.GetColumnBoundaries
		var_26_2 = arg_26_0.ComputeColumnLeftFromRight
	else
		var_26_0 = arg_26_0.SetTargetRow
		var_26_1 = arg_26_0.GetRowBoundaries
		var_26_2 = arg_26_0.ComputeRowTopFromBottom
	end

	local var_26_3, var_26_4 = var_26_1(arg_26_0)
	local var_26_5 = false

	if arg_26_2 < var_26_3 then
		var_26_0(arg_26_0, arg_26_2, true, false)

		var_26_5 = true
	elseif var_26_4 < arg_26_2 then
		var_26_0(arg_26_0, var_26_2(arg_26_0, arg_26_2), true, false)

		var_26_5 = true
	end

	if not var_26_5 and arg_26_3 then
		var_26_0(arg_26_0, arg_26_2, true, false)

		var_26_5 = true
	end

	if var_26_5 then
		arg_26_0:UpdateNumbersArrowsAndScrolling()
	end
end

function LUI.UIGrid.HandleScrollbarDrag(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1.scrollbar

	if arg_27_1.dragStart or not arg_27_0._dragTargetRef then
		arg_27_0._dragTargetRef = {
			x = arg_27_1.targetX,
			y = arg_27_1.targetY
		}
	end

	local var_27_1 = arg_27_1.targetX - arg_27_0._dragTargetRef.x
	local var_27_2 = arg_27_1.targetY - arg_27_0._dragTargetRef.y

	if var_27_1 == 0 and var_27_2 == 0 then
		return false
	end

	local var_27_3 = arg_27_0:GetContentSize(var_27_0:GetDirection())

	if var_27_3 and var_27_3 > 0 then
		if var_27_0:GetDirection() == LUI.DIRECTION.vertical then
			local var_27_4 = var_27_2 * var_27_3
			local var_27_5, var_27_6 = arg_27_0:GetRowBoundaries()
			local var_27_7 = arg_27_0:ConvertRowPixelToLine(var_27_4 >= 0 and var_27_6 or var_27_5, var_27_4)
			local var_27_8 = {
				x = arg_27_0:GetTargetColumn(),
				y = var_27_7,
				x = arg_27_0:GetTargetColumn(),
				y = var_27_7
			}

			arg_27_0:SetPositionInternal(var_27_8, true, false, false)
		else
			local var_27_9 = var_27_1 * var_27_3
			local var_27_10, var_27_11 = arg_27_0:GetColumnBoundaries()
			local var_27_12 = arg_27_0:ConvertColumnPixelToLine(var_27_9 >= 0 and var_27_11 or var_27_10, var_27_9)
			local var_27_13 = {
				x = var_27_12,
				y = arg_27_0:GetTargetRow(),
				x = var_27_12,
				y = arg_27_0:GetTargetRow()
			}

			arg_27_0:SetPositionInternal(var_27_13, true, false, false)
		end

		arg_27_0:UpdateScrolling()

		arg_27_0._dragTargetRef = {
			x = arg_27_1.targetX,
			y = arg_27_1.targetY
		}
	end

	return true
end

function LUI.UIGrid.HandleScrollbarSet(arg_28_0, arg_28_1)
	if arg_28_1.scrollbar:GetDirection() == LUI.DIRECTION.vertical then
		local var_28_0 = (arg_28_0:GetContentSize(LUI.DIRECTION.vertical) or 1) * arg_28_1.targetY
		local var_28_1 = arg_28_0:ConvertRowPixelToLine(0, var_28_0)

		arg_28_0:SetPositionInternal({
			x = arg_28_0:GetTargetColumn(),
			y = var_28_1
		}, true)
	else
		local var_28_2 = (arg_28_0:GetContentSize(LUI.DIRECTION.horizontal) or 1) * arg_28_1.targetX
		local var_28_3 = arg_28_0:ConvertColumnPixelToLine(0, var_28_2)

		arg_28_0:SetPositionInternal({
			x = var_28_3,
			y = arg_28_0:GetTargetRow()
		}, true)
	end
end

function LUI.UIGrid.AddScrollbar(arg_29_0, arg_29_1)
	if arg_29_1._slider then
		arg_29_1._slider.mouseWheelTarget = arg_29_0
	elseif arg_29_1._fixedSizeSlider then
		arg_29_1._fixedSizeSlider.mouseWheelTarget = arg_29_0
	end

	arg_29_1:LinkTo(arg_29_0)
	arg_29_0:SetHandleMouseMove(true)
	table.insert(arg_29_0._scrollbars, arg_29_1)
	arg_29_0:SetNotifyOnLayoutInit(true)

	if not arg_29_1._customScrolling then
		arg_29_0:registerEventHandler("scrollbar_previous", function(arg_30_0, arg_30_1)
			if arg_30_1.scrollbar:GetDirection() == LUI.DIRECTION.vertical then
				arg_30_0:Scroll("up")
			else
				arg_30_0:Scroll("left")
			end

			return true
		end)
		arg_29_0:registerEventHandler("scrollbar_next", function(arg_31_0, arg_31_1)
			if arg_31_1.scrollbar:GetDirection() == LUI.DIRECTION.vertical then
				arg_31_0:Scroll("down")
			else
				arg_31_0:Scroll("right")
			end

			return true
		end)
		arg_29_0:registerEventHandler("scrollbar_drag", arg_29_0.HandleScrollbarDrag)
		arg_29_0:registerEventHandler("scrollbar_set", arg_29_0.HandleScrollbarSet)
	end
end

function LUI.UIGrid.SetArrowsEnabled(arg_32_0, arg_32_1)
	arg_32_0._arrowsEnabled = arg_32_1
end

function LUI.UIGrid.SetWidgetsAlwaysVisible(arg_33_0, arg_33_1)
	arg_33_0._widgetsAlwaysVisible = arg_33_1
end

function LUI.UIGrid.SetWraps(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_1 ~= nil then
		arg_34_0._wrapX = arg_34_1
	end

	if arg_34_2 ~= nil then
		arg_34_0._wrapY = arg_34_2
	end
end

function LUI.UIGrid.SetCustomArrowScrollAmount(arg_35_0, arg_35_1)
	arg_35_0._customArrowScrollAmount = arg_35_1
end

function LUI.UIGrid.SetUpdateArrowVisibilityOnRefresh(arg_36_0, arg_36_1)
	arg_36_0._updateArrowVisibilityOnRefresh = arg_36_1
end

function LUI.UIGrid.AddArrow(arg_37_0, arg_37_1, arg_37_2)
	assert(type(arg_37_1) == "userdata")

	local var_37_0 = arg_37_2 or arg_37_1.id

	arg_37_0._arrows[var_37_0] = arg_37_1

	if arg_37_1.id == "ArrowUp" or arg_37_1.id == "ArrowDown" or arg_37_1.id == "ArrowRight" or arg_37_1.id == "ArrowLeft" then
		arg_37_1:registerEventHandler("button_action", function(arg_38_0, arg_38_1)
			if arg_37_0._arrowsEnabled then
				local var_38_0 = "up"

				if arg_37_1.id == "ArrowDown" then
					var_38_0 = "down"
				elseif arg_37_1.id == "ArrowRight" then
					var_38_0 = "right"
				elseif arg_37_1.id == "ArrowLeft" then
					var_38_0 = "left"
				end

				if arg_37_0._customArrowScrollAmount then
					arg_37_0:ScrollAmount(var_38_0, arg_37_0._customArrowScrollAmount)
				else
					arg_37_0:Scroll(var_38_0)
				end
			end
		end)
	end
end

function LUI.UIGrid.AddItemNumbers(arg_39_0, arg_39_1, arg_39_2)
	assert(type(arg_39_1) == "userdata")
	assert(arg_39_1.setText)

	local var_39_0 = arg_39_2 or arg_39_1.id

	assert(var_39_0 and #var_39_0 > 0)

	arg_39_0._itemNumbers[var_39_0] = arg_39_1
end

function LUI.UIGrid.SetLastFocusIndexDataSource(arg_40_0, arg_40_1)
	assert(type(arg_40_1) == "table")

	arg_40_0._lastFocusIndexDataSource = arg_40_1

	arg_40_0:SetLastFocusIndex(arg_40_0._targetPosition)
end

function LUI.UIGrid.SetLastFocusIndex(arg_41_0, arg_41_1)
	if arg_41_0._lastFocusIndexDataSource then
		arg_41_0._lastFocusIndexDataSource:SetValue(arg_41_0._controllerIndex, arg_41_1)
	end
end

function LUI.UIGrid.FocusFirstItem(arg_42_0)
	local var_42_0 = {
		x = 0,
		y = 0
	}

	arg_42_0:SetFocusedPosition(var_42_0, true)
end

function LUI.UIGrid.GetFocusPositionIndex(arg_43_0, arg_43_1)
	if not arg_43_0._targetPosition then
		return nil
	end

	arg_43_1 = arg_43_1 or {}

	if arg_43_1.relativePosition == nil then
		arg_43_1.relativePosition = true
	end

	local var_43_0
	local var_43_1 = arg_43_0:GetFocusPosition(LUI.DIRECTION.horizontal)
	local var_43_2 = arg_43_0:GetFocusPosition(LUI.DIRECTION.vertical)

	if arg_43_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		if arg_43_1.relativePosition then
			var_43_0 = var_43_1 + var_43_2 * arg_43_0:GetMaxVisibleColumns()
		else
			var_43_0 = var_43_1 + var_43_2 * arg_43_0:GetNumColumns()
		end
	elseif arg_43_1.relativePosition then
		var_43_0 = var_43_2 + var_43_1 * arg_43_0:GetMaxVisibleRows()
	else
		var_43_0 = var_43_2 + var_43_1 * arg_43_0:GetNumRows()
	end

	local var_43_3 = arg_43_0:GetNumChildren()

	if var_43_3 then
		if arg_43_1.clampContentIndexToDatasetLength and var_43_3 <= var_43_0 then
			var_43_0 = var_43_3 - 1
		else
			var_43_0 = var_43_0 % var_43_3
		end
	end

	return var_43_0
end

function LUI.UIGrid.SetSnapOnWrapEnabled(arg_44_0, arg_44_1)
	arg_44_0._snapOnWrap = arg_44_1
end

function LUI.UIGrid.SetMouseWheelScrollingOffsetPx(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0._mouseWheelScrollingVerticalOffsetPx = arg_45_1 and arg_45_1 or arg_45_0._mouseWheelScrollingVerticalOffsetPx
	arg_45_0._mouseWheelScrollingHorizontalOffsetPx = arg_45_2 and arg_45_2 or arg_45_0._mouseWheelScrollingHorizontalOffsetPx
end

function LUI.UIGrid.BuildGridCountArrows(arg_46_0, arg_46_1, arg_46_2)
	arg_46_0.GridCountArrows = MenuBuilder.BuildRegisteredType("GridCountArrows", {
		controllerIndex = arg_46_0._controllerIndex
	})
	arg_46_0.GridCountArrows.id = "GridCountArrows"

	local function var_46_0()
		local var_47_0, var_47_1, var_47_2, var_47_3 = arg_46_0:getLocalRect()
		local var_47_4 = var_47_0 + (var_47_2 - var_47_0) / 2
		local var_47_5, var_47_6, var_47_7, var_47_8 = arg_46_0.GridCountArrows:getLocalRect()
		local var_47_9 = var_47_7 - var_47_5
		local var_47_10 = var_47_8 - var_47_6
		local var_47_11 = var_47_4 - var_47_9 / 2
		local var_47_12 = var_47_11 + var_47_9
		local var_47_13 = var_47_3 + arg_46_2
		local var_47_14 = var_47_13 + var_47_10

		arg_46_0.GridCountArrows:SetAnchorsAndPosition(0, 1, 0, 1, var_47_11, var_47_12, var_47_13, var_47_14)
	end

	arg_46_0:SetNotifyOnLayoutInit(true)
	arg_46_0:addEventHandler("layout_initialized", function()
		var_46_0()

		arg_46_1 = arg_46_1 or arg_46_0:getParent()

		arg_46_1:addElement(arg_46_0.GridCountArrows)
	end)
	arg_46_0:addEventHandler("grid_size_updated", function()
		var_46_0()
	end)
	arg_46_0:AddItemNumbers(arg_46_0.GridCountArrows.ListCount)
	arg_46_0:AddArrow(arg_46_0.GridCountArrows.ArrowUp)
	arg_46_0:AddArrow(arg_46_0.GridCountArrows.ArrowDown)
	arg_46_0.GridCountArrows.ArrowUp:SetupArrow(LUI.BEARING.up)
	arg_46_0.GridCountArrows.ArrowDown:SetupArrow(LUI.BEARING.down)
end

function LUI.UIGrid.GetChildPosition(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0:GetBuiltChildren()

	for iter_50_0, iter_50_1 in ipairs(var_50_0) do
		if arg_50_1:isDescendentOf(iter_50_1) then
			return iter_50_1._gridContentColumnIndex, iter_50_1._gridContentRowIndex
		end
	end

	return nil, nil
end

function LUI.UIDataSourceGrid.init(arg_51_0, arg_51_1)
	Engine.BHFFIBEFFH("UIDataSourceGrid", "widget")
	assert(arg_51_1)
	assert(arg_51_1.controllerIndex)

	arg_51_1.numChildren = nil
	arg_51_1.numRows = nil
	arg_51_1.numColumns = nil

	function arg_51_1.refreshChild(arg_52_0, arg_52_1, arg_52_2)
		arg_51_0:SetGridChildDataSource(arg_52_0, arg_52_1, arg_52_2)
	end

	LUI.UIDataSourceGrid.super.init(arg_51_0, arg_51_1)

	if arg_51_1.dataSource then
		arg_51_0:SetGridDataSource(arg_51_1.dataSource)
	else
		arg_51_0:SetNumChildren(0)
	end

	Engine.DCHDDCJCEG("UIDataSourceGrid", "widget")
end

function LUI.UIDataSourceGrid.SetGridChildDataSource(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
	if arg_53_0._gridDataSource then
		local var_53_0 = arg_53_0:GetContentIndex(arg_53_2, arg_53_3)
		local var_53_1 = arg_53_0._gridDataSource:GetDataSourceAtIndex(var_53_0, arg_53_0._controllerIndex)

		arg_53_1:SetDataSource(var_53_1, arg_53_0._controllerIndex)
	end
end

function LUI.UIDataSourceGrid.SetGridDataSource(arg_54_0, arg_54_1)
	assert(type(arg_54_1) == "table")
	assert(type(arg_54_1.GetDataSourceAtIndex) == "function")

	if arg_54_0._gridDataSource == arg_54_1 then
		return
	end

	local var_54_0 = arg_54_0:GetBuiltChildren()

	for iter_54_0, iter_54_1 in ipairs(var_54_0) do
		iter_54_1:SetDataSource(nil, arg_54_0._controllerIndex)
	end

	arg_54_0._pendingRefresh = true
	arg_54_0._gridDataSource = arg_54_1

	if arg_54_0._countSubscription then
		arg_54_0:UnsubscribeFromModel(arg_54_0._countSubscription)
	end

	local var_54_1 = arg_54_0._gridDataSource:GetCountModel(arg_54_0._controllerIndex)

	if var_54_1 then
		arg_54_0._countSubscription = arg_54_0:SubscribeToModel(var_54_1, function(arg_55_0)
			local var_55_0 = DataModel.JJEHAEBDF(arg_55_0)

			if var_55_0 then
				arg_54_0:SetNumChildren(var_55_0)
				arg_54_0:RefreshContent()
			end
		end)
	else
		local var_54_2 = arg_54_0._gridDataSource:GetCountValue(arg_54_0._controllerIndex)

		assert(var_54_2)
		arg_54_0:SetNumChildren(var_54_2)
		arg_54_0:RefreshContent()
	end

	for iter_54_2, iter_54_3 in ipairs(arg_54_0._scrollbars) do
		iter_54_3:SetLinkedGridDataSource(arg_54_1)
	end

	if arg_54_0._pendingRefresh then
		arg_54_0._pendingRefresh = nil

		arg_54_0:RefreshContent()
	end
end

function LUI.UIDataSourceGrid.SetGridDataSourceThroughElement(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = DataLink.new({
		target = arg_56_0,
		source = arg_56_1,
		relativeDataSourcePath = arg_56_2,
		type = DataLink.TYPES.gridDataSource
	})

	var_56_0:Link()
	var_56_0:Refresh()

	return var_56_0
end

function LUI.UIDataSourceGrid.GetGridDataSource(arg_57_0)
	return arg_57_0._gridDataSource
end

function LUI.UIDataSourceGrid.GetDefaultFocus(arg_58_0)
	if not arg_58_0._gridDataSource then
		return nil
	end

	local var_58_0 = arg_58_0._gridDataSource:GetDefaultFocusIndex(arg_58_0._controllerIndex)

	if var_58_0 then
		if type(var_58_0) == "table" then
			return var_58_0
		else
			return arg_58_0:GetPositionForIndex(var_58_0, {
				relativePosition = false
			})
		end
	else
		return nil
	end
end

function LUI.UIGrid.addElement(arg_59_0, arg_59_1)
	assert(false, "Forbidden")
end

function LUI.UIGrid.closeChildren(arg_60_0)
	local var_60_0 = arg_60_0:GetBuiltChildren()

	for iter_60_0, iter_60_1 in ipairs(var_60_0) do
		iter_60_1:closeTree()
	end
end

function LUI.UIGrid.LoseFocus(arg_61_0, arg_61_1)
	if arg_61_0:ProcessEventToChildInFocus(arg_61_1) then
		arg_61_0._childInFocus = nil
	end

	arg_61_0._targetPosition = nil
	arg_61_0._shouldFocus = nil
end

function LUI.UIGrid.ProcessEventToChildInFocus(arg_62_0, arg_62_1)
	if arg_62_0._childInFocus then
		return arg_62_0._childInFocus:processEvent(arg_62_1)
	end

	return false
end

function LUI.UIGrid.GetVisibleChildInFocus(arg_63_0)
	assert(arg_63_0._childInFocus)

	return arg_63_0._childInFocus
end

function LUI.UIGrid.GainFocus(arg_64_0, arg_64_1)
	assert(arg_64_0:GetNumColumns() and arg_64_0:GetNumRows(), "Either grid columns or rows are not set. Try calling grid:SetNumColumns() or grid:SetNumRows()")

	if arg_64_0._navigateLikeUIList and arg_64_1.direction then
		if arg_64_1.direction == "down" then
			arg_64_0:SetFocusedPosition({
				x = 0,
				y = 0
			}, true, nil, arg_64_1.isWrap)
		elseif arg_64_1.direction == "up" then
			arg_64_0:SetFocusedPosition({
				x = 0,
				y = arg_64_0:GetNumRows()
			}, true, nil, arg_64_1.isWrap)
		elseif arg_64_1.direction == "left" then
			arg_64_0:SetFocusedPosition({
				x = 0,
				y = 0
			}, true, nil, arg_64_1.isWrap)
		elseif arg_64_1.direction == "right" then
			arg_64_0:SetFocusedPosition({
				y = 0,
				x = arg_64_0:GetNumColumns()
			}, true, nil, arg_64_1.isWrap)
		end
	else
		local var_64_0 = arg_64_0:GetDefaultFocus()

		if var_64_0 then
			assert(arg_64_0:IsPositionFocusable(var_64_0), "defaultFocus is invalid, value is { x = " .. tostring(var_64_0.x) .. ", y = " .. tostring(var_64_0.y) .. " }")

			local var_64_1 = true

			if arg_64_1 then
				var_64_1 = arg_64_1.shouldPlayButtonSound
			end

			arg_64_0:SetFocusedPosition(var_64_0, true, nil, nil, var_64_1)
		else
			local var_64_2, var_64_3 = arg_64_0:restoreState()

			if var_64_3 == 0 then
				local var_64_4 = arg_64_0._targetPosition or arg_64_0:GetFirstFocusablePosition()

				if var_64_4 then
					arg_64_0:SetFocusedPosition(var_64_4, true, nil, nil, arg_64_1.shouldPlayButtonSound)
				end
			end
		end
	end

	return arg_64_0._targetPosition ~= nil
end

function LUI.UIGrid.restoreFocus(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0:GetNumColumns()
	local var_65_1 = arg_65_0:GetNumRows()

	if arg_65_0.id == arg_65_1.id and var_65_0 ~= 0 and var_65_1 ~= 0 then
		assert(arg_65_1.data)
		arg_65_0:SetTargetRow(arg_65_1.data.targetRow, true, true)
		arg_65_0:SetTargetColumn(arg_65_1.data.targetColumn, true, true)
		arg_65_0:SetFocusedPosition(arg_65_1.data.targetPosition, true)

		return true
	end

	return arg_65_0:dispatchEventToChildren(arg_65_1)
end

function LUI.UIGrid.getAllFocusedChildren(arg_66_0, arg_66_1)
	arg_66_1 = arg_66_1 or {}

	if arg_66_0._targetPosition and arg_66_0._shouldFocus then
		arg_66_0.saveData = {
			targetPosition = arg_66_0._targetPosition,
			targetRow = arg_66_0:GetTargetRow(),
			targetColumn = arg_66_0:GetTargetColumn()
		}

		table.insert(arg_66_1, arg_66_0)
	end

	return arg_66_1
end

function LUI.UIGrid.GetHorizontalAlignment(arg_67_0)
	return arg_67_0._horizontalAlignment
end

function LUI.UIGrid.GetVerticalAlignment(arg_68_0)
	return arg_68_0._verticalAlignment
end

function LUI.UIGrid.GetFocusableIndicesFromPosition(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_0:GetNumColumns()
	local var_69_1 = arg_69_0:GetNumRows()

	if var_69_1 == 0 or var_69_0 == 0 then
		return nil
	end

	local var_69_2 = arg_69_1.x
	local var_69_3 = arg_69_1.y
	local var_69_4 = {}
	local var_69_5 = {
		x = var_69_2 - 1,
		y = var_69_3
	}
	local var_69_6 = {
		x = var_69_2 + 1,
		y = var_69_3
	}
	local var_69_7 = {
		x = var_69_2,
		y = var_69_3 - 1
	}
	local var_69_8 = {
		x = var_69_2,
		y = var_69_3 + 1
	}

	if arg_69_0._wrapX then
		if var_69_5.x < 0 then
			var_69_5.x = var_69_0 - 1
		end

		if var_69_6.x > var_69_0 - 1 then
			var_69_6.x = 0
		end
	end

	if arg_69_0._wrapY then
		if var_69_7.y < 0 then
			var_69_7.y = var_69_1 - 1
		end

		if var_69_8.y > var_69_1 - 1 then
			var_69_8.y = 0
		end
	end

	table.insert(var_69_4, {
		x = var_69_2,
		y = var_69_3
	})
	table.insert(var_69_4, var_69_5)
	table.insert(var_69_4, var_69_6)
	table.insert(var_69_4, var_69_7)
	table.insert(var_69_4, var_69_8)

	if Engine.CGABICJHAI() then
		table.insert(var_69_4, {
			x = var_69_2 + 1,
			y = var_69_3 - 1
		})
		table.insert(var_69_4, {
			x = var_69_2 - 1,
			y = var_69_3 + 1
		})
		table.insert(var_69_4, {
			x = var_69_2 - 1,
			y = var_69_3 - 1
		})
		table.insert(var_69_4, {
			x = var_69_2 + 1,
			y = var_69_3 + 1
		})
	end

	local var_69_9 = {}

	for iter_69_0 = 1, #var_69_4 do
		local var_69_10 = {
			x = var_69_4[iter_69_0].x,
			y = var_69_4[iter_69_0].y
		}

		if arg_69_0:IsPositionInDataSet(var_69_10.x, var_69_10.y) then
			local var_69_11 = arg_69_0:GetContentIndex(var_69_10.x, var_69_10.y, {
				relativePosition = false
			}) + 1

			if not LUI.IsItemInArray(var_69_9, var_69_11) then
				table.insert(var_69_9, var_69_11)
			end
		end
	end

	return var_69_9
end

function LUI.UIGrid.IsPositionFocusable(arg_70_0, arg_70_1)
	if not arg_70_0:IsPositionInDataSet(arg_70_1.x, arg_70_1.y) then
		return false
	end

	if arg_70_0._isPositionFocusable then
		return arg_70_0._isPositionFocusable(arg_70_1.x, arg_70_1.y)
	else
		local var_70_0

		if arg_70_0._buildChild then
			var_70_0 = arg_70_0:GetBuiltChildren()[1]
		else
			var_70_0 = arg_70_0:GetElementAtPosition(arg_70_1.x, arg_70_1.y)
		end

		assert(var_70_0)

		return var_70_0:TreeCanFocus(FocusType.ListSelection)
	end
end

function LUI.UIGrid.GetFirstFocusablePosition(arg_71_0)
	local var_71_0 = {
		x = 0,
		y = 0
	}

	if arg_71_0:IsPositionFocusable(var_71_0) then
		return var_71_0
	end

	if arg_71_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		var_71_0 = {
			x = 1,
			y = 0
		}
	else
		var_71_0 = {
			x = 0,
			y = 1
		}
	end

	if arg_71_0:IsPositionFocusable(var_71_0) then
		return var_71_0
	end

	if arg_71_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		var_71_0 = {
			x = 0,
			y = 1
		}
	else
		var_71_0 = {
			x = 1,
			y = 0
		}
	end

	if arg_71_0:IsPositionFocusable(var_71_0) then
		return var_71_0
	end

	local var_71_1 = {
		x = 0,
		y = 0
	}
	local var_71_2 = arg_71_0:GetNumColumns()
	local var_71_3 = arg_71_0:GetNumRows()

	if arg_71_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		while var_71_3 > var_71_1.y do
			while var_71_2 > var_71_1.x do
				if arg_71_0:IsPositionFocusable(var_71_1) then
					return var_71_1
				end

				var_71_1.x = var_71_1.x + 1
			end

			var_71_1.x = 0
			var_71_1.y = var_71_1.y + 1
		end
	else
		while var_71_2 > var_71_1.x do
			while var_71_3 > var_71_1.y do
				if arg_71_0:IsPositionFocusable(var_71_1) then
					return var_71_1
				end

				var_71_1.y = var_71_1.y + 1
			end

			var_71_1.y = 0
			var_71_1.x = var_71_1.x + 1
		end
	end

	return nil
end

function LUI.UIGrid.GetNextFocusablePosition(arg_72_0, arg_72_1, arg_72_2)
	assert(math.abs(arg_72_2) == 1)

	local var_72_0 = arg_72_0:GetNumColumns()
	local var_72_1 = arg_72_0:GetNumRows()

	if var_72_1 == 0 or var_72_0 == 0 then
		return nil
	end

	local var_72_2
	local var_72_3
	local var_72_4
	local var_72_5
	local var_72_6

	if arg_72_1 == LUI.DIRECTION.horizontal then
		var_72_2 = "x"
		var_72_3 = "y"
		var_72_4 = arg_72_0._wrapX
		var_72_5 = var_72_0
		var_72_6 = var_72_1
	else
		var_72_2 = "y"
		var_72_3 = "x"
		var_72_4 = arg_72_0._wrapY
		var_72_5 = var_72_1
		var_72_6 = var_72_0
	end

	local var_72_7 = false
	local var_72_8 = LUI.ShallowCopy(arg_72_0._targetPosition)

	var_72_8.x = math.floor(var_72_8.x)
	var_72_8.y = math.floor(var_72_8.y)

	repeat
		var_72_8[var_72_2] = var_72_8[var_72_2] + arg_72_2

		if not arg_72_0:IsPositionInDataSet(var_72_8.x, var_72_8.y) and var_72_8[var_72_2] == var_72_5 - 1 and arg_72_0:GetPrimaryAxis() ~= arg_72_1 then
			local var_72_9 = arg_72_0:GetNumChildren() % var_72_6

			if var_72_9 > 0 then
				var_72_8[var_72_3] = var_72_9 - 1
			end
		end

		if var_72_4 and var_72_5 then
			local var_72_10 = var_72_5 - 1

			if var_72_8[var_72_2] < 0 then
				var_72_8[var_72_2] = var_72_10
				var_72_7 = true

				if not arg_72_0:IsPositionInDataSet(var_72_8.x, var_72_8.y) and arg_72_0:GetPrimaryAxis() ~= arg_72_1 then
					local var_72_11 = arg_72_0:GetNumChildren() % var_72_6

					if var_72_11 > 0 then
						var_72_8[var_72_3] = var_72_11 - 1
					end
				end
			elseif var_72_10 < var_72_8[var_72_2] then
				var_72_8[var_72_2] = 0
				var_72_7 = true
			end

			if var_72_8.x == arg_72_0._targetPosition.x and var_72_8.y == arg_72_0._targetPosition.y and var_72_7 then
				return nil
			end
		elseif not arg_72_0:IsPositionInDataSet(var_72_8.x, var_72_8.y) then
			return nil
		end
	until arg_72_0:IsPositionInDataSet(var_72_8.x, var_72_8.y) and arg_72_0:IsPositionFocusable(var_72_8)

	return var_72_8, var_72_7
end

function LUI.UIGrid.PositionChanged(arg_73_0)
	if arg_73_0._onNewTargetFocusPosition then
		arg_73_0._onNewTargetFocusPosition()
	end
end

function LUI.UIGrid.SetNewTargetOnFocusHandler(arg_74_0, arg_74_1, arg_74_2)
	assert(type(arg_74_2) == "function", "A valid function must be defined here.")

	local var_74_0 = arg_74_0

	function arg_74_0._onNewTargetFocusPosition()
		arg_74_2(arg_74_1, var_74_0._targetPosition)
	end
end

function LUI.UIGrid.SetGridItemClickHandler(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_1.scope

	assert(var_76_0, "The scope of which contains the grid must be specified for processing the event.")

	local var_76_1 = arg_76_0:GetBuiltChildren()

	assert(var_76_1, "a grid must have built children before assigning it a click event")

	for iter_76_0, iter_76_1 in ipairs(var_76_1) do
		local var_76_2 = iter_76_1

		if not iter_76_1.inputEnabled and iter_76_1.Button then
			var_76_2 = iter_76_1.Button
		end

		var_76_2:registerEventHandler("button_action", function(arg_77_0, arg_77_1)
			var_76_0:processEvent({
				name = "grid_item_clicked",
				element = arg_77_0,
				controller = arg_77_1.controller
			})
		end)

		if arg_76_1.processDisabledClick then
			var_76_2:registerEventHandler("button_action_disable", function(arg_78_0, arg_78_1)
				var_76_0:processEvent({
					name = "grid_item_clicked",
					element = arg_78_0,
					controller = arg_78_1.controller
				})
			end)
		end
	end
end

function LUI.UIGrid.SetFocusedPosition(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4, arg_79_5)
	arg_79_0:SetPositionInternal(arg_79_1, arg_79_2, true, arg_79_3, arg_79_4, arg_79_5)
	arg_79_0:FocusChanged()
	arg_79_0:PositionChanged()
end

function LUI.UIGrid.SetPosition(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	arg_80_0:SetPositionInternal(arg_80_1, arg_80_2, false, arg_80_3)
	arg_80_0:PositionChanged()
end

function LUI.UIGrid.SetPositionInternal(arg_81_0, arg_81_1, arg_81_2, arg_81_3, arg_81_4, arg_81_5, arg_81_6)
	arg_81_4 = arg_81_4 ~= false
	arg_81_1 = LUI.ShallowCopy(arg_81_1)

	assert(arg_81_1.x and arg_81_1.y)

	local var_81_0 = arg_81_0._targetPosition and LUI.ShallowCopy(arg_81_0._targetPosition)
	local var_81_1 = arg_81_0:GetNumColumns()
	local var_81_2 = arg_81_0:GetNumRows()

	if var_81_1 == 0 or var_81_2 == 0 then
		arg_81_0:RemoveFocusFromChild(arg_81_2)

		arg_81_0._shouldFocus = false
		arg_81_0._targetPosition = nil

		arg_81_0:SetLastFocusIndex(nil)
		arg_81_0:UpdateNumbersArrowsAndScrolling()

		return
	end

	arg_81_0._shouldFocus = arg_81_3

	if var_81_1 then
		arg_81_1.x = LUI.clamp(arg_81_1.x, 0, arg_81_3 and not arg_81_1.skipTargetColumnAdjustment and var_81_1 - 1 or var_81_1)
	end

	if var_81_2 then
		arg_81_1.y = LUI.clamp(arg_81_1.y, 0, arg_81_3 and not arg_81_1.skipTargetRowAdjustment and var_81_2 - 1 or var_81_2)
	end

	if arg_81_3 and not arg_81_0:IsPositionInDataSet(arg_81_1.x, arg_81_1.y) then
		local var_81_3, var_81_4 = arg_81_0:ColumnRowToPrimarySecondary(math.floor(arg_81_1.x), math.floor(arg_81_1.y))
		local var_81_5, var_81_6 = arg_81_0:PrimarySecondaryToColumnRow(var_81_3, var_81_4)

		while var_81_4 > 0 and not arg_81_0:IsPositionInDataSet(var_81_5, var_81_6) do
			var_81_4 = var_81_4 - 1
			var_81_5, var_81_6 = arg_81_0:PrimarySecondaryToColumnRow(var_81_3, var_81_4)
		end

		while var_81_3 > 0 and not arg_81_0:IsPositionInDataSet(var_81_5, var_81_6) do
			var_81_3 = var_81_3 - 1
			var_81_5, var_81_6 = arg_81_0:PrimarySecondaryToColumnRow(var_81_3, var_81_4)
		end

		arg_81_1.x = var_81_5
		arg_81_1.y = var_81_6
	end

	if var_81_0 and var_81_0.x == arg_81_1.x and var_81_0.y == arg_81_1.y then
		if not arg_81_3 then
			arg_81_0:RemoveFocusFromChild(arg_81_2)

			return
		else
			local var_81_7 = arg_81_0:GetElementAtPosition(var_81_0.x, var_81_0.y)

			if var_81_7 and (var_81_7:isInFocus() or #var_81_7:getAllFocusedChildren() > 0) then
				return
			end
		end
	end

	local var_81_8 = var_81_0 == nil

	arg_81_0:RemoveFocusFromChild(arg_81_2)

	if not arg_81_0._targetPosition then
		arg_81_0._targetPosition = {}
	end

	arg_81_0._targetPosition.x = arg_81_1.x
	arg_81_0._targetPosition.y = arg_81_1.y

	local var_81_9 = not arg_81_1.skipTargetRowAdjustment
	local var_81_10 = arg_81_1.y
	local var_81_11, var_81_12 = arg_81_0:GetRowBoundaries()
	local var_81_13 = LUI.clamp(arg_81_0._scrollingThresholdY, 0, arg_81_0:GetMaxVisibleRows() - 1)
	local var_81_14 = arg_81_0._scrollingThresholdPixelY
	local var_81_15 = var_81_11
	local var_81_16 = var_81_12
	local var_81_17 = var_81_8 or arg_81_1.y < var_81_0.y
	local var_81_18 = var_81_8 or arg_81_1.y > var_81_0.y

	if not arg_81_4 then
		var_81_13 = 0
		var_81_14 = 0
	end

	if arg_81_3 and var_81_9 then
		if var_81_18 then
			var_81_10 = math.floor(var_81_10 + 1)

			if var_81_2 and var_81_10 < var_81_2 - var_81_13 then
				local var_81_19 = arg_81_0:ConvertRowPixelToLine(var_81_10, -arg_81_0:GetRowSpacing())

				if var_81_19 > 0 then
					var_81_10 = var_81_19
				end
			end
		elseif var_81_17 then
			var_81_10 = math.floor(var_81_10)
		end
	end

	if var_81_14 > 0 then
		if var_81_17 then
			local var_81_20 = arg_81_0:ConvertRowPixelToLine(math.max(0, var_81_10), -var_81_14)

			if var_81_20 < var_81_11 then
				var_81_15 = var_81_20
				var_81_16 = arg_81_0:ComputeRowBottomFromTop(var_81_15)
			end
		elseif var_81_18 then
			local var_81_21 = arg_81_0:ConvertRowPixelToLine(math.min(var_81_2, var_81_10), var_81_14)

			if var_81_12 < var_81_21 then
				var_81_16 = var_81_21
				var_81_15 = arg_81_0:ComputeRowTopFromBottom(var_81_16)
			end
		end
	elseif var_81_17 and var_81_10 < var_81_11 + var_81_13 then
		var_81_15 = var_81_10 - var_81_13
		var_81_16 = arg_81_0:ComputeRowBottomFromTop(var_81_15)
	elseif var_81_18 and var_81_10 > var_81_12 - var_81_13 then
		var_81_16 = var_81_10 + var_81_13
		var_81_15 = arg_81_0:ComputeRowTopFromBottom(var_81_16)
	end

	if var_81_15 ~= var_81_11 or var_81_16 ~= var_81_12 then
		if arg_81_0._verticalAlignment == LUI.Alignment.Middle then
			assert(var_81_17 or var_81_18)

			if var_81_17 then
				var_81_10 = var_81_10 + math.floor(arg_81_0:GetMaxVisibleRows() / 2) - var_81_13
			elseif var_81_18 then
				var_81_10 = var_81_10 - math.floor(arg_81_0:GetMaxVisibleRows() / 2) + var_81_13
			end
		else
			var_81_10 = arg_81_0._verticalAlignment == LUI.Alignment.Bottom and var_81_16 or var_81_15
		end

		arg_81_0:SetTargetRow(var_81_10, true, arg_81_2)
	end

	local var_81_22 = not arg_81_1.skipTargetColumnAdjustment
	local var_81_23 = arg_81_1.x
	local var_81_24, var_81_25 = arg_81_0:GetColumnBoundaries()
	local var_81_26 = LUI.clamp(arg_81_0._scrollingThresholdX, 0, arg_81_0:GetMaxVisibleColumns() - 1)
	local var_81_27 = arg_81_0._scrollingThresholdPixelX
	local var_81_28 = var_81_24
	local var_81_29 = var_81_25
	local var_81_30 = var_81_8 or arg_81_1.x < var_81_0.x
	local var_81_31 = var_81_8 or arg_81_1.x > var_81_0.x

	if not arg_81_4 then
		var_81_26 = 0
	end

	if arg_81_3 and var_81_22 then
		if var_81_31 then
			var_81_23 = math.floor(var_81_23 + 1)

			if var_81_1 and var_81_23 < var_81_1 - var_81_26 then
				local var_81_32 = arg_81_0:ConvertColumnPixelToLine(var_81_23, -arg_81_0:GetColumnSpacing())

				if var_81_32 > 0 then
					var_81_23 = var_81_32
				end
			end
		elseif var_81_30 then
			var_81_23 = math.floor(var_81_23)
		end
	end

	if var_81_27 > 0 then
		if var_81_30 then
			local var_81_33 = arg_81_0:ConvertColumnPixelToLine(math.max(0, var_81_23), -var_81_27)

			if var_81_33 < var_81_24 then
				var_81_28 = var_81_33
				var_81_29 = arg_81_0:ComputeColumnRightFromLeft(var_81_28)
			end
		elseif var_81_31 then
			local var_81_34 = arg_81_0:ConvertColumnPixelToLine(math.min(var_81_1, var_81_23), var_81_27)

			if var_81_25 < var_81_34 then
				var_81_29 = var_81_34
				var_81_28 = arg_81_0:ComputeColumnLeftFromRight(var_81_29)
			end
		end
	elseif var_81_30 and var_81_23 < var_81_24 + var_81_26 then
		var_81_28 = var_81_23 - var_81_26
		var_81_29 = arg_81_0:ComputeColumnRightFromLeft(var_81_28)
	elseif var_81_31 and var_81_23 > var_81_25 - var_81_26 then
		var_81_29 = var_81_23 + var_81_26
		var_81_28 = arg_81_0:ComputeColumnLeftFromRight(var_81_29)
	end

	if var_81_28 ~= var_81_24 or var_81_29 ~= var_81_25 then
		if arg_81_0._horizontalAlignment == LUI.Alignment.Center then
			assert(var_81_30 or var_81_31)

			if var_81_30 then
				var_81_23 = var_81_23 + math.floor(arg_81_0:GetMaxVisibleColumns() / 2) - var_81_26
			elseif var_81_31 then
				var_81_23 = var_81_23 - math.floor(arg_81_0:GetMaxVisibleColumns() / 2) + var_81_26
			end
		else
			var_81_23 = arg_81_0._horizontalAlignment == LUI.Alignment.Right and var_81_29 or var_81_28
		end

		arg_81_0:SetTargetColumn(var_81_23, true, arg_81_2)
	end

	if arg_81_0._pendingRefresh then
		arg_81_0._pendingRefresh = nil

		arg_81_0:RefreshContent()
	end

	if arg_81_3 then
		local var_81_35 = arg_81_0:GetElementAtPosition(arg_81_0._targetPosition.x, arg_81_0._targetPosition.y)

		if var_81_35 then
			local var_81_36

			if var_81_18 then
				var_81_36 = "down"
			elseif var_81_17 then
				var_81_36 = "up"
			elseif var_81_31 then
				var_81_36 = "right"
			elseif var_81_30 then
				var_81_36 = "left"
			end

			if arg_81_0._isWrapping then
				arg_81_0._isWrapping = false
			end

			arg_81_0:GiveFocusToChild(var_81_35, var_81_36, arg_81_5, arg_81_6)
		else
			arg_81_0:NotifyWhenPositionIsVisible(arg_81_0._targetPosition.x, arg_81_0._targetPosition.y)
		end
	end

	arg_81_0:UpdateScrolling()
	arg_81_0:UpdateNumbersAndArrows()
end

function LUI.UIGrid.RemoveFocusFromChild(arg_82_0, arg_82_1)
	if arg_82_0._childInFocus then
		arg_82_0._childInFocus:processEvent({
			name = "lose_focus",
			snap = arg_82_1
		})

		arg_82_0._childInFocus = nil
	end
end

function LUI.UIGrid.GiveFocusToChild(arg_83_0, arg_83_1, arg_83_2, arg_83_3, arg_83_4)
	arg_83_1:processEvent({
		name = "gain_focus",
		direction = arg_83_2,
		isWrap = arg_83_3,
		shouldPlayButtonSound = arg_83_4
	})

	arg_83_0._childInFocus = arg_83_1
end

function LUI.UIGrid.AdjustFocusedTargetPosition(arg_84_0, arg_84_1, arg_84_2)
	local var_84_0 = arg_84_0:GetElementAtPosition(arg_84_1.x, arg_84_1.y)

	if var_84_0 and var_84_0.GetFocusTargetPositionOffset then
		local var_84_1 = var_84_0:GetFocusTargetPositionOffset(arg_84_1, arg_84_2)

		if var_84_1 then
			arg_84_1.x = arg_84_1.x + var_84_1.x
			arg_84_1.y = arg_84_1.y + var_84_1.y
			arg_84_1.skipTargetColumnAdjustment = var_84_1.x ~= 0
			arg_84_1.skipTargetRowAdjustment = var_84_1.y ~= 0
		end
	end
end

function LUI.UIGrid.FocusNextElement(arg_85_0, arg_85_1, arg_85_2, arg_85_3, arg_85_4, arg_85_5)
	if not arg_85_0._directionalInputEnabled then
		return false
	end

	local var_85_0
	local var_85_1
	local var_85_2
	local var_85_3

	if arg_85_2 == "up" then
		var_85_2 = LUI.DIRECTION.vertical
		var_85_3 = -1
	elseif arg_85_2 == "down" then
		var_85_2 = LUI.DIRECTION.vertical
		var_85_3 = 1
	elseif arg_85_2 == "left" then
		var_85_2 = LUI.DIRECTION.horizontal
		var_85_3 = -1
	elseif arg_85_2 == "right" then
		var_85_2 = LUI.DIRECTION.horizontal
		var_85_3 = 1
	end

	if var_85_2 and var_85_3 and arg_85_0._targetPosition then
		var_85_0, var_85_1 = arg_85_0:GetNextFocusablePosition(var_85_2, var_85_3)
	end

	if var_85_0 then
		arg_85_0:AdjustFocusedTargetPosition(var_85_0, arg_85_2, var_85_1)

		local var_85_4 = arg_85_0._alwaysSnap or var_85_1 and arg_85_0._snapOnWrap

		if var_85_1 then
			arg_85_0._isWrapping = true
			arg_85_0._pendingRefresh = true
		end

		arg_85_0:SetFocusedPosition(var_85_0, var_85_4 == true, nil, var_85_1)
		arg_85_0:FocusMoved(arg_85_2)
		arg_85_0:saveState()

		return true
	else
		local var_85_5 = arg_85_0:getParent()

		if var_85_5 and var_85_5:FocusNextElement(arg_85_0, arg_85_2, arg_85_3, arg_85_4, arg_85_5) then
			return true
		end
	end

	return false
end

function LUI.UIGrid.ScrollAmount(arg_86_0, arg_86_1, arg_86_2)
	if arg_86_1 == "up" or arg_86_1 == "down" then
		local var_86_0, var_86_1 = arg_86_0:GetRowBoundaries()
		local var_86_2 = arg_86_0:GetNumRows()
		local var_86_3 = var_86_0

		if arg_86_1 == "up" and (not var_86_2 or var_86_0 > 0) then
			var_86_3 = var_86_3 - arg_86_2
		elseif arg_86_1 == "down" and (not var_86_2 or var_86_1 < var_86_2) then
			var_86_3 = var_86_3 + var_86_1 - var_86_0 + arg_86_2
		else
			return false
		end

		if var_86_3 ~= var_86_0 then
			local var_86_4 = arg_86_0._targetPosition and arg_86_0._targetPosition.x or 0

			arg_86_0:SetPositionInternal({
				x = var_86_4,
				y = var_86_3
			}, true, false, false)
		end

		return true
	elseif arg_86_1 == "left" or arg_86_1 == "right" then
		local var_86_5, var_86_6 = arg_86_0:GetColumnBoundaries()
		local var_86_7 = arg_86_0:GetNumColumns()
		local var_86_8 = var_86_5

		if arg_86_1 == "left" and (not var_86_7 or var_86_5 > 0) then
			var_86_8 = var_86_8 - arg_86_2
		elseif arg_86_1 == "right" and (not var_86_7 or var_86_6 < var_86_7) then
			var_86_8 = var_86_8 + var_86_6 - var_86_5 + arg_86_2
		else
			return false
		end

		if var_86_8 ~= var_86_5 then
			local var_86_9 = arg_86_0._targetPosition and arg_86_0._targetPosition.y or 0

			arg_86_0:SetPositionInternal({
				x = var_86_8,
				y = var_86_9
			}, true, false, false)
		end

		return true
	else
		return false
	end
end

function LUI.UIGrid.Scroll(arg_87_0, arg_87_1)
	local var_87_0 = 0

	if arg_87_1 == "up" or arg_87_1 == "down" then
		local var_87_1, var_87_2 = arg_87_0:GetRowBoundaries()

		if not var_87_1 or not var_87_2 then
			return
		end

		if arg_87_1 == "up" then
			var_87_0 = var_87_1 - math.floor(var_87_1)
		else
			var_87_0 = math.ceil(var_87_2) - var_87_2
		end
	else
		local var_87_3, var_87_4 = arg_87_0:GetColumnBoundaries()

		if not var_87_3 or not var_87_4 then
			return
		end

		if arg_87_1 == "left" then
			var_87_0 = var_87_3 - math.floor(var_87_3)
		else
			var_87_0 = math.ceil(var_87_4) - var_87_4
		end
	end

	var_87_0 = var_87_0 < 0.01 and 1 + var_87_0 or var_87_0

	LUI.UIGrid.ScrollAmount(arg_87_0, arg_87_1, var_87_0)
end

function LUI.UIGrid.SetDirectionalInputEnabled(arg_88_0, arg_88_1)
	arg_88_0._directionalInputEnabled = arg_88_1
end

function LUI.UIGrid.HandleMouseScroll(arg_89_0, arg_89_1)
	local var_89_0

	if arg_89_1 == "up" or arg_89_1 == "down" then
		local var_89_1, var_89_2 = arg_89_0:GetRowBoundaries()

		if arg_89_1 == "up" then
			var_89_0 = var_89_1 - arg_89_0:ConvertRowPixelToLine(var_89_1, -arg_89_0._mouseWheelScrollingVerticalOffsetPx)
		else
			var_89_0 = arg_89_0:ConvertRowPixelToLine(var_89_2, arg_89_0._mouseWheelScrollingVerticalOffsetPx) - var_89_2
		end
	else
		local var_89_3, var_89_4 = arg_89_0:GetColumnBoundaries()

		if arg_89_1 == "left" then
			var_89_0 = var_89_3 - arg_89_0:ConvertColumnPixelToLine(var_89_3, -arg_89_0._mouseWheelScrollingHorizontalOffsetPx)
		else
			var_89_0 = arg_89_0:ConvertColumnPixelToLine(var_89_4, arg_89_0._mouseWheelScrollingHorizontalOffsetPx) - var_89_4
		end
	end

	arg_89_0:ScrollAmount(arg_89_1, math.abs(var_89_0))
end

function LUI.UIGrid.GamepadButton(arg_90_0, arg_90_1)
	if arg_90_1.down then
		local var_90_0 = arg_90_1.button == "up" or arg_90_1.button == "down" or arg_90_1.button == "left" or arg_90_1.button == "right"

		if var_90_0 then
			if not arg_90_0._directionalInputEnabled then
				return false
			elseif arg_90_0._isWrapping then
				return true
			end
		end

		if #arg_90_0._permittedQualifiers > 0 and arg_90_1.qualifier and var_90_0 and not LUI.IsItemInArray(arg_90_0._permittedQualifiers, arg_90_1.qualifier) then
			return false
		end

		if arg_90_1.qualifier == "mousewheel" and not arg_90_0._disableMouseWheel then
			local var_90_1 = arg_90_1.button
			local var_90_2 = false

			for iter_90_0, iter_90_1 in ipairs(arg_90_0._scrollbars) do
				if iter_90_1.isVisible and iter_90_1:GetDirection() == LUI.DIRECTION.vertical then
					var_90_2 = false

					break
				elseif iter_90_1.isVisible and iter_90_1:GetDirection() ~= LUI.DIRECTION.vertical then
					var_90_2 = true
				end
			end

			if arg_90_0:GetNumRows() == 0 or arg_90_0:GetNumColumns() == 0 then
				return false
			elseif arg_90_0:GetNumRows() == 1 and arg_90_0:GetNumColumns() > 1 or var_90_2 then
				if var_90_1 == "up" then
					var_90_1 = "left"
				elseif var_90_1 == "down" then
					var_90_1 = "right"
				end
			end

			local var_90_3, var_90_4 = ProjectRootCoordinate(arg_90_1.rootName, arg_90_1.x, arg_90_1.y)

			if var_90_3 == nil or var_90_4 == nil then
				return
			end

			local var_90_5 = arg_90_0:IsPositionInside(var_90_3, var_90_4) or arg_90_0._alwaysTrapMouseWheel

			if not var_90_5 then
				for iter_90_2, iter_90_3 in ipairs(arg_90_0._scrollbars) do
					if iter_90_3.GetWidget then
						local var_90_6 = iter_90_3:GetWidget()

						var_90_5 = not var_90_6._blockMouseMove and var_90_6:IsPositionInside(var_90_3, var_90_4)
					end

					if var_90_5 then
						break
					end
				end
			end

			if var_90_5 or arg_90_1.forceScrollMove then
				arg_90_0:HandleMouseScroll(var_90_1)
			end
		end

		if not LUI.IsLastInputMouseNavigation(arg_90_1.controller) then
			for iter_90_4, iter_90_5 in ipairs(arg_90_0._scrollbars) do
				local var_90_7

				if iter_90_5.id then
					var_90_7 = iter_90_5
				elseif iter_90_5.GetWidget then
					var_90_7 = iter_90_5:GetWidget()
				end

				if var_90_7 then
					var_90_7:processEvent({
						name = "lose_focus"
					})
				end
			end

			for iter_90_6, iter_90_7 in pairs(arg_90_0._arrows) do
				iter_90_7:processEvent({
					name = "lose_focus"
				})
			end
		end

		if arg_90_0._targetPosition then
			if not arg_90_0._childInFocus and arg_90_0._shouldFocus then
				return arg_90_0:FocusNextElement(arg_90_0, arg_90_1.button, FocusType.Gamepad, arg_90_1.qualifier, arg_90_1.controller)
			else
				return arg_90_0:dispatchEventToChildren(arg_90_1)
			end
		end
	end

	return arg_90_0:dispatchEventToChildren(arg_90_1)
end

function LUI.UIGrid.SetDefaultFocus(arg_91_0, arg_91_1)
	arg_91_0._defaultFocus = arg_91_1
end

function LUI.UIGrid.GetDefaultFocus(arg_92_0)
	if type(arg_92_0._defaultFocus) == "function" then
		return arg_92_0._defaultFocus()
	else
		return arg_92_0._defaultFocus
	end
end

function LUI.UIGrid.FocusMoved(arg_93_0, arg_93_1)
	local var_93_0 = "grid_focus_" .. arg_93_1 .. "_moved"

	for iter_93_0, iter_93_1 in pairs(arg_93_0._arrows) do
		iter_93_1:processEvent({
			name = var_93_0
		})
	end
end

function LUI.UIGrid.SetCountFunction(arg_94_0, arg_94_1)
	if arg_94_1 then
		arg_94_0._countFunction = arg_94_1
	end
end

function LUI.UIGrid.ShouldDisplayNumbersAndArrows(arg_95_0)
	if not arg_95_0._showNumbersAndArrowsKBM and not LUI.IsLastInputGamepad(arg_95_0._controllerIndex) then
		return false
	end

	return arg_95_0:GetMaxVisibleRows() * arg_95_0:GetMaxVisibleColumns() < arg_95_0:GetNumChildren() or arg_95_0._widgetsAlwaysVisible
end

local function var_0_2(arg_96_0)
	local var_96_0
	local var_96_1
	local var_96_2 = arg_96_0:ShouldDisplayNumbersAndArrows()

	if arg_96_0._countFunction then
		var_96_0, var_96_1 = arg_96_0._countFunction()
	else
		local var_96_3 = arg_96_0:GetNumRows()
		local var_96_4 = arg_96_0:GetNumColumns()
		local var_96_5 = arg_96_0:GetNumChildren()

		if var_96_5 < 0 then
			var_96_0 = 0
			var_96_1 = 0
		elseif arg_96_0._targetPosition then
			if var_96_4 == 1 then
				var_96_0 = 1 + arg_96_0._targetPosition.y
				var_96_1 = var_96_3
			elseif var_96_3 == 1 then
				var_96_0 = 1 + arg_96_0._targetPosition.x
				var_96_1 = var_96_4 or var_96_5
			else
				var_96_0 = 1 + arg_96_0._targetPosition.x + arg_96_0._targetPosition.y * var_96_4
				var_96_1 = var_96_5
			end
		else
			var_96_0 = 0
			var_96_1 = var_96_5
		end

		var_96_0 = LUI.clamp(math.floor(var_96_0), 0, var_96_1)
	end

	for iter_96_0, iter_96_1 in pairs(arg_96_0._itemNumbers) do
		local var_96_6 = ""

		if var_96_2 then
			var_96_6 = Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_96_0, var_96_1)
		end

		iter_96_1:setText(var_96_6)
	end
end

local function var_0_3(arg_97_0)
	local var_97_0 = {}
	local var_97_1 = arg_97_0:GetNumRows()
	local var_97_2 = arg_97_0:GetNumColumns()
	local var_97_3 = arg_97_0:GetNumChildren()
	local var_97_4 = arg_97_0:ShouldDisplayNumbersAndArrows()

	arg_97_0:SetArrowsEnabled(var_97_4)

	local var_97_5
	local var_97_6
	local var_97_7
	local var_97_8

	if LUI.IsLastInputKeyboardMouse(Engine.IJEBHJIJF()) then
		var_97_5, var_97_6 = arg_97_0:GetRowBoundaries()
		var_97_7, var_97_8 = arg_97_0:GetColumnBoundaries()
	elseif arg_97_0._targetPosition then
		var_97_5 = arg_97_0._targetPosition.y
		var_97_6 = arg_97_0._targetPosition.y + 1
		var_97_7 = arg_97_0._targetPosition.x
		var_97_8 = arg_97_0._targetPosition.x + 1
	end

	if var_97_3 >= 0 and var_97_5 and var_97_6 and var_97_7 and var_97_8 then
		if var_97_5 == 0 and var_97_1 and var_97_1 >= 0 and not arg_97_0._wrapY then
			table.insert(var_97_0, "grid_focus_up_blocked")
		else
			table.insert(var_97_0, "grid_focus_up_not_blocked")
		end

		if var_97_1 and var_97_1 <= var_97_6 and not arg_97_0._wrapY then
			table.insert(var_97_0, "grid_focus_down_blocked")
		else
			table.insert(var_97_0, "grid_focus_down_not_blocked")
		end

		if var_97_7 == 0 and var_97_2 and var_97_2 >= 0 and not arg_97_0._wrapX then
			table.insert(var_97_0, "grid_focus_left_blocked")
		else
			table.insert(var_97_0, "grid_focus_left_not_blocked")
		end

		if var_97_2 and var_97_2 <= var_97_8 and not arg_97_0._wrapX then
			table.insert(var_97_0, "grid_focus_right_blocked")
		else
			table.insert(var_97_0, "grid_focus_right_not_blocked")
		end
	else
		table.insert(var_97_0, "grid_focus_up_blocked")
		table.insert(var_97_0, "grid_focus_down_blocked")
		table.insert(var_97_0, "grid_focus_left_blocked")
		table.insert(var_97_0, "grid_focus_right_blocked")
	end

	for iter_97_0, iter_97_1 in pairs(arg_97_0._arrows) do
		for iter_97_2, iter_97_3 in ipairs(var_97_0) do
			if arg_97_0._updateArrowVisibilityOnRefresh then
				iter_97_1:SetAlpha(var_97_4 and 1 or 0)
			end

			if var_97_4 then
				iter_97_1:processEvent({
					name = iter_97_3
				})
			end
		end
	end
end

function LUI.UIGrid.UpdateScrolling(arg_98_0)
	for iter_98_0, iter_98_1 in ipairs(arg_98_0._scrollbars) do
		iter_98_1:UpdateScrolling()
	end
end

function LUI.UIGrid.SetScrollbarKBMStyle(arg_99_0, arg_99_1)
	for iter_99_0, iter_99_1 in ipairs(arg_99_0._scrollbars) do
		iter_99_1:SetKBMStyle(arg_99_1)
	end
end

function LUI.UIGrid.UpdateNumbersAndArrows(arg_100_0)
	var_0_2(arg_100_0)
	var_0_3(arg_100_0)
end

function LUI.UIGrid.UpdateNumbersArrowsAndScrolling(arg_101_0)
	arg_101_0:UpdateNumbersAndArrows()
	arg_101_0:UpdateScrolling()
end

function LUI.UIGrid.FocusChanged(arg_102_0, arg_102_1)
	if not arg_102_0._targetPosition then
		return
	end

	var_0_3(arg_102_0)
	arg_102_0:SetLastFocusIndex(arg_102_0:GetContentIndex(arg_102_0._targetPosition.x, arg_102_0._targetPosition.y))
end

function LUI.UIGrid.GetPositionForIndex(arg_103_0, arg_103_1, arg_103_2)
	arg_103_2 = arg_103_2 or {}

	if arg_103_2.relativePosition == nil then
		arg_103_2.relativePosition = true
	end

	local var_103_0 = arg_103_0:GetNumChildren()

	if var_103_0 then
		arg_103_1 = LUI.clamp(arg_103_1, 0, var_103_0 - 1)
	end

	local var_103_1
	local var_103_2

	if arg_103_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		if arg_103_2.relativePosition then
			local var_103_3 = arg_103_0:GetMaxVisibleColumns()

			var_103_1 = arg_103_1 % var_103_3
			var_103_2 = math.floor(arg_103_1 / var_103_3)
		else
			local var_103_4 = arg_103_0:GetNumColumns()

			var_103_2 = math.floor(arg_103_1 / var_103_4)
			var_103_1 = arg_103_1 - var_103_2 * var_103_4
		end
	elseif arg_103_2.relativePosition then
		local var_103_5 = arg_103_0:GetMaxVisibleRows()

		var_103_2 = arg_103_1 % var_103_5
		var_103_1 = math.floor(arg_103_1 / var_103_5)
	else
		local var_103_6 = arg_103_0:GetNumRows()

		var_103_1 = math.floor(arg_103_1 / var_103_6)
		var_103_2 = arg_103_1 - var_103_1 * var_103_6
	end

	return {
		x = var_103_1,
		y = var_103_2
	}
end

function LUI.UIGrid.GetContentIndex(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
	arg_104_3 = arg_104_3 or {}

	if arg_104_3.relativePosition == nil then
		arg_104_3.relativePosition = true
	end

	local var_104_0

	if arg_104_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		if arg_104_3.relativePosition then
			var_104_0 = arg_104_1 + arg_104_2 * arg_104_0:GetMaxVisibleColumns()
		else
			var_104_0 = arg_104_1 + arg_104_2 * arg_104_0:GetNumColumns()
		end
	elseif arg_104_3.relativePosition then
		var_104_0 = arg_104_2 + arg_104_1 * arg_104_0:GetMaxVisibleRows()
	else
		var_104_0 = arg_104_2 + arg_104_1 * arg_104_0:GetNumRows()
	end

	local var_104_1 = arg_104_0:GetNumChildren()

	if var_104_1 then
		var_104_0 = var_104_0 % var_104_1
	end

	return var_104_0
end

function LUI.UIGrid.GetContentSize(arg_105_0, arg_105_1)
	if arg_105_1 == LUI.DIRECTION.horizontal then
		return arg_105_0:GetHorizontalContentSize()
	else
		return arg_105_0:GetVerticalContentSize()
	end
end

function LUI.UIGrid.GetContentCount(arg_106_0, arg_106_1)
	if arg_106_1 == LUI.DIRECTION.horizontal then
		return arg_106_0:GetNumColumns()
	else
		return arg_106_0:GetNumRows()
	end
end

function LUI.UIGrid.GetContentVisibleSize(arg_107_0, arg_107_1)
	if arg_107_1 == LUI.DIRECTION.horizontal then
		return arg_107_0:GetColumnVisibleSize()
	else
		return arg_107_0:GetRowVisibleSize()
	end
end

function LUI.UIGrid.GetContentOffset(arg_108_0, arg_108_1)
	local var_108_0, var_108_1 = arg_108_0:GetRowPixelBoundaries()
	local var_108_2, var_108_3 = arg_108_0:GetColumnPixelBoundaries()

	if arg_108_1 == LUI.DIRECTION.horizontal then
		return var_108_2
	else
		return var_108_0
	end
end

function LUI.UIGrid.GetFocusPosition(arg_109_0, arg_109_1)
	if not arg_109_0._targetPosition then
		return nil
	end

	if arg_109_1 == LUI.DIRECTION.horizontal then
		return LUI.clamp(math.floor(arg_109_0._targetPosition.x), 0, arg_109_0:GetNumColumns() - 1)
	else
		return LUI.clamp(math.floor(arg_109_0._targetPosition.y), 0, arg_109_0:GetNumRows() - 1)
	end
end

function LUI.UIGrid.GetDefaultPosition(arg_110_0, arg_110_1)
	local var_110_0 = arg_110_0:GetDefaultFocus()

	if var_110_0 then
		if arg_110_1 == LUI.DIRECTION.horizontal then
			return var_110_0.x
		else
			return var_110_0.y
		end
	end

	return nil
end

function LUI.UIGrid.SetShouldFocus(arg_111_0, arg_111_1)
	arg_111_0._shouldFocus = arg_111_1
end

function LUI.UIGrid.SetNavigateLikeUIList(arg_112_0, arg_112_1)
	arg_112_0._navigateLikeUIList = arg_112_1
end

function LUI.UIDataSourceGrid.FocusChanged(arg_113_0)
	LUI.UIDataSourceGrid.super.FocusChanged(arg_113_0)

	if arg_113_0._targetPosition then
		local var_113_0 = arg_113_0:GetContentIndex(math.floor(arg_113_0._targetPosition.x), math.floor(arg_113_0._targetPosition.y))
		local var_113_1 = arg_113_0._gridDataSource:GetDataSourceAtIndex(var_113_0, arg_113_0._controllerIndex)

		arg_113_0:SetDataSource(var_113_1, arg_113_0._controllerIndex)
	end
end

function LUI.UIPeekingGrid.init(arg_114_0, arg_114_1)
	arg_114_1.ensureClampedTargetLineOnDimensionsUpdate = false

	LUI.UIGrid.init(arg_114_0, arg_114_1)
	assert(arg_114_1.buildChild, "Peeking Grid only works as an homogenous grid right now.")
	assert(not arg_114_1.verticalAlignment or arg_114_1.verticalAlignment == LUI.Alignment.Top, "Peeking Grid only supports Top vertical alignment right now.")
end

function LUI.UIPeekingGrid.SetPositionInternal(arg_115_0, arg_115_1, arg_115_2, arg_115_3, arg_115_4, arg_115_5, arg_115_6)
	arg_115_1 = LUI.ShallowCopy(arg_115_1)

	assert(arg_115_1.x and arg_115_1.y)

	local var_115_0 = arg_115_0:GetNumColumns()
	local var_115_1 = arg_115_0:GetNumRows()

	if var_115_0 == 0 or var_115_1 == 0 then
		arg_115_0:RemoveFocusFromChild(arg_115_2)

		arg_115_0._shouldFocus = false
		arg_115_0._targetPosition = nil

		arg_115_0:SetLastFocusIndex(nil)
		arg_115_0:UpdateNumbersArrowsAndScrolling()

		return
	end

	arg_115_0._shouldFocus = arg_115_3

	if arg_115_3 and not arg_115_0:IsPositionInDataSet(arg_115_1.x, arg_115_1.y) then
		local var_115_2, var_115_3 = arg_115_0:ColumnRowToPrimarySecondary(math.floor(arg_115_1.x), math.floor(arg_115_1.y))
		local var_115_4, var_115_5 = arg_115_0:PrimarySecondaryToColumnRow(var_115_2, var_115_3)

		while var_115_3 > 0 and not arg_115_0:IsPositionInDataSet(var_115_4, var_115_5) do
			var_115_3 = var_115_3 - 1
			var_115_4, var_115_5 = arg_115_0:PrimarySecondaryToColumnRow(var_115_2, var_115_3)
		end

		while var_115_2 > 0 and not arg_115_0:IsPositionInDataSet(var_115_4, var_115_5) do
			var_115_2 = var_115_2 - 1
			var_115_4, var_115_5 = arg_115_0:PrimarySecondaryToColumnRow(var_115_2, var_115_3)
		end

		arg_115_1.x = var_115_4
		arg_115_1.y = var_115_5
	end

	if arg_115_0._targetPosition and arg_115_0._targetPosition.x == arg_115_1.x and arg_115_0._targetPosition.y == arg_115_1.y then
		if not arg_115_3 then
			arg_115_0:RemoveFocusFromChild(arg_115_2)

			return
		else
			local var_115_6 = arg_115_0:GetElementAtPosition(arg_115_0._targetPosition.x, arg_115_0._targetPosition.y)

			if var_115_6 and (var_115_6:isInFocus() or #var_115_6:getAllFocusedChildren() > 0) then
				return
			end
		end
	end

	local var_115_7

	var_115_7 = arg_115_0._targetPosition == nil

	arg_115_0:RemoveFocusFromChild(arg_115_2)

	arg_115_1.y = LUI.clamp(arg_115_1.y, 0, arg_115_0:GetNumRows() - 1)

	if arg_115_3 then
		arg_115_1.y = math.floor(arg_115_1.y)
	end

	arg_115_0:SetTargetRow(arg_115_1.y, false, arg_115_2)

	if arg_115_0._pendingRefresh then
		arg_115_0._pendingRefresh = nil

		arg_115_0:RefreshContent()
	end

	arg_115_0._targetPosition = arg_115_1
	arg_115_0._targetPosition.skipTargetRowAdjustment = nil
	arg_115_0._targetPosition.skipTargetColumnAdjustment = nil

	if arg_115_3 then
		local var_115_8 = arg_115_0:GetElementAtPosition(arg_115_0._targetPosition.x, arg_115_0._targetPosition.y)

		if var_115_8 then
			local var_115_9

			if scrollDown then
				var_115_9 = "down"
			elseif scrollUp then
				var_115_9 = "up"
			elseif scrollRight then
				var_115_9 = "right"
			elseif scrollLeft then
				var_115_9 = "left"
			end

			if arg_115_0._isWrapping then
				arg_115_0._isWrapping = false
			end

			arg_115_0:GiveFocusToChild(var_115_8, var_115_9, arg_115_5, arg_115_6)
		else
			arg_115_0:NotifyWhenPositionIsVisible(arg_115_0._targetPosition.x, arg_115_0._targetPosition.y)
		end
	end

	arg_115_0:UpdateScrolling()
	arg_115_0:UpdateNumbersAndArrows()
end

function LUI.UIPeekingGrid.ScrollAmount(arg_116_0, arg_116_1, arg_116_2)
	if arg_116_1 == "up" or arg_116_1 == "down" then
		local var_116_0, var_116_1 = arg_116_0:GetRowBoundaries()
		local var_116_2 = var_116_0

		if arg_116_1 == "up" then
			var_116_2 = var_116_2 - arg_116_2
		elseif arg_116_1 == "down" then
			var_116_2 = var_116_2 + arg_116_2

			if arg_116_0._targetPosition and arg_116_0._targetPosition.y == var_116_2 then
				arg_116_0._targetPosition.y = var_116_0
			end
		else
			return false
		end

		if var_116_2 ~= var_116_0 then
			local var_116_3 = arg_116_0._targetPosition and arg_116_0._targetPosition.x or 0

			arg_116_0:SetPositionInternal({
				x = var_116_3,
				y = var_116_2
			}, false, false, false)
		end

		return true
	elseif arg_116_1 == "left" or arg_116_1 == "right" then
		local var_116_4, var_116_5 = arg_116_0:GetColumnBoundaries()
		local var_116_6 = arg_116_0:GetNumColumns()
		local var_116_7 = var_116_4

		if arg_116_1 == "left" and (not var_116_6 or var_116_4 > 0) then
			var_116_7 = var_116_7 - arg_116_2
		elseif arg_116_1 == "right" and (not var_116_6 or var_116_5 < var_116_6) then
			var_116_7 = var_116_7 + var_116_5 - var_116_4 + arg_116_2
		else
			return false
		end

		if var_116_7 ~= var_116_4 then
			local var_116_8 = arg_116_0._targetPosition and arg_116_0._targetPosition.y or 0

			arg_116_0:SetPositionInternal({
				x = var_116_7,
				y = var_116_8
			}, false, false, false)
		end

		return true
	else
		return false
	end
end

function LUI.UIPeekingGrid.HandleMouseScroll(arg_117_0, arg_117_1)
	assert(arg_117_1 == "up" or arg_117_1 == "down", "Peeking Grid only supports up and down scrolling right now.")

	local var_117_0
	local var_117_1, var_117_2 = arg_117_0:GetRowBoundaries()

	if arg_117_1 == "up" then
		var_117_0 = math.floor(var_117_1)
	else
		var_117_0 = math.floor(var_117_1 + 1)
	end

	var_117_0 = var_117_0 == var_117_1 and 1 or var_117_0 - var_117_1

	arg_117_0:ScrollAmount(arg_117_1, math.abs(var_117_0))
end

function LUI.UIPeekingGrid.HandleScrollbarDrag(arg_118_0, arg_118_1)
	local var_118_0 = arg_118_1.scrollbar

	if arg_118_1.dragStart or not arg_118_0._dragTargetRef then
		arg_118_0._dragTargetRef = {
			x = arg_118_1.targetX,
			y = arg_118_1.targetY
		}
	end

	local var_118_1 = arg_118_1.targetY - arg_118_0._dragTargetRef.y

	if var_118_1 == 0 then
		return false
	end

	arg_118_0._dragTargetRef = {
		x = arg_118_1.targetX,
		y = arg_118_1.targetY
	}

	local var_118_2 = arg_118_0:GetContentSize(var_118_0:GetDirection())

	if var_118_2 and var_118_2 > 0 and var_118_0:GetDirection() == LUI.DIRECTION.vertical then
		local var_118_3 = var_118_1 * var_118_2
		local var_118_4, var_118_5 = arg_118_0:GetRowBoundaries()
		local var_118_6 = arg_118_0:ConvertRowPixelToLine(var_118_4, var_118_3)
		local var_118_7 = {
			x = arg_118_0:GetTargetColumn(),
			y = var_118_6
		}

		arg_118_0:SetPositionInternal(var_118_7, true, false, false)
	end

	return true
end

function LUI.UIPeekingGrid.HandleScrollbarSet(arg_119_0, arg_119_1)
	if arg_119_1.scrollbar:GetDirection() == LUI.DIRECTION.vertical then
		local var_119_0 = (arg_119_0:GetContentSize(LUI.DIRECTION.vertical) or 1) * arg_119_1.targetY
		local var_119_1 = math.floor(arg_119_0:ConvertRowPixelToLine(0, var_119_0))

		arg_119_0:SetPositionInternal({
			x = arg_119_0:GetTargetColumn(),
			y = var_119_1
		}, false)
	end
end

function LUI.UIPeekingGrid.GetContentSize(arg_120_0, arg_120_1)
	if arg_120_1 == LUI.DIRECTION.horizontal then
		return arg_120_0:GetHorizontalContentSize()
	else
		local var_120_0 = arg_120_0:GetVerticalContentSize()
		local var_120_1 = arg_120_0:GetContentVisibleSize(arg_120_1)
		local var_120_2 = arg_120_0:GetRowHeight()

		if var_120_0 == nil or var_120_1 == nil or var_120_2 == nil then
			return nil
		end

		return var_120_0 + var_120_1 - var_120_2
	end
end

function LUI.UIPeekingGrid.restoreFocus(arg_121_0, arg_121_1)
	local var_121_0 = arg_121_0:GetNumColumns()
	local var_121_1 = arg_121_0:GetNumRows()

	if arg_121_0.id == arg_121_1.id and var_121_0 ~= 0 and var_121_1 ~= 0 then
		assert(arg_121_1.data)
		arg_121_0:SetTargetRow(arg_121_1.data.targetRow, false, true)
		arg_121_0:SetTargetColumn(arg_121_1.data.targetColumn, false, true)
		arg_121_0:SetFocusedPosition(arg_121_1.data.targetPosition, true)

		return true
	end

	return arg_121_0:dispatchEventToChildren(arg_121_1)
end

LUI.UIGrid.id = "LUIGrid"
LUI.UIDataSourceGrid.id = "LUIDataSourceGrid"
LUI.UIPeekingGrid.id = "LUIPeekingGrid"
