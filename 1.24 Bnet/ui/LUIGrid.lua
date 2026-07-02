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

function LUI.UIGrid.GetSpacingX(arg_15_0)
	return arg_15_0._spacingX
end

function LUI.UIGrid.GetSpacingY(arg_16_0)
	return arg_16_0._spacingY
end

function LUI.UIGrid.GetRowHeight(arg_17_0)
	return arg_17_0._rowHeight
end

function LUI.UIGrid.GetColumnWidth(arg_18_0)
	return arg_18_0._columnWidth
end

function LUI.UIGrid.SetRefreshChild(arg_19_0, arg_19_1)
	if Engine.BHICADFIHA() then
		arg_19_0._refreshChild = arg_19_1
	end

	arg_19_0:SetRefreshChildInC(arg_19_1)
end

function LUI.UIGrid.ColumnRowToPrimarySecondary(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		return arg_20_1, arg_20_2
	else
		return arg_20_2, arg_20_1
	end
end

function LUI.UIGrid.PrimarySecondaryToColumnRow(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		return arg_21_1, arg_21_2
	else
		return arg_21_2, arg_21_1
	end
end

function LUI.UIGrid.SetNumChildren(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.maxAllocatedChildren then
		assert(arg_22_1 <= arg_22_0.maxAllocatedChildren, "LUIGrid: Trying to set more than the max number of allowed children.")
	end

	if arg_22_2 and arg_22_2.shouldRemoveExcessChildren then
		arg_22_0.maxAllocatedChildren = arg_22_1

		local var_22_0 = arg_22_0:GetBuiltChildren()
		local var_22_1 = #var_22_0

		if var_22_1 - arg_22_1 > 0 then
			for iter_22_0 = var_22_1, arg_22_1 + 1, -1 do
				local var_22_2 = var_22_0[iter_22_0]

				arg_22_0:RemoveElement(var_22_2)
				var_22_2:closeTree()

				local var_22_3
			end
		end

		arg_22_0:SetNumChildrenInC(arg_22_1, arg_22_2.shouldRemoveExcessChildren)
	else
		arg_22_0:SetNumChildrenInC(arg_22_1)
	end

	if arg_22_0._targetPosition then
		if arg_22_0._shouldFocus then
			arg_22_0:SetFocusedPosition(arg_22_0._targetPosition, true)
		else
			arg_22_0:SetPosition(arg_22_0._targetPosition, true)
		end
	else
		arg_22_0:SetTargetColumnToDefault()
		arg_22_0:SetTargetRowToDefault()
	end
end

function LUI.UIGrid.SetNumColumns(arg_23_0, arg_23_1)
	arg_23_0:SetNumColumnsInC(arg_23_1)

	if arg_23_0._targetPosition then
		if arg_23_0._shouldFocus then
			arg_23_0:SetFocusedPosition(arg_23_0._targetPosition, true)
		else
			arg_23_0:SetPosition(arg_23_0._targetPosition, true)
		end
	else
		arg_23_0:SetTargetColumnToDefault()
	end
end

function LUI.UIGrid.SetNumRows(arg_24_0, arg_24_1)
	arg_24_0:SetNumRowsInC(arg_24_1)

	if arg_24_0._targetPosition then
		if arg_24_0._shouldFocus then
			arg_24_0:SetFocusedPosition(arg_24_0._targetPosition, true)
		else
			arg_24_0:SetPosition(arg_24_0._targetPosition, true)
		end
	else
		arg_24_0:SetTargetRowToDefault()
	end
end

function LUI.UIGrid.EnsureLineVisible(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	assert(arg_25_1 == LUI.DIRECTION.vertical and (arg_25_0._verticalAlignment == LUI.Alignment.Top or arg_25_0._verticalAlignment == nil) or arg_25_1 == LUI.DIRECTION.horizontal and (arg_25_0._horizontalAlignment == LUI.Alignment.Left or arg_25_0._horizontalAlignment == nil))

	local var_25_0
	local var_25_1
	local var_25_2

	if arg_25_1 == LUI.DIRECTION.horizontal then
		var_25_0 = arg_25_0.SetTargetColumn
		var_25_1 = arg_25_0.GetColumnBoundaries
		var_25_2 = arg_25_0.ComputeColumnLeftFromRight
	else
		var_25_0 = arg_25_0.SetTargetRow
		var_25_1 = arg_25_0.GetRowBoundaries
		var_25_2 = arg_25_0.ComputeRowTopFromBottom
	end

	local var_25_3, var_25_4 = var_25_1(arg_25_0)
	local var_25_5 = false

	if arg_25_2 < var_25_3 then
		var_25_0(arg_25_0, arg_25_2, true, false)

		var_25_5 = true
	elseif var_25_4 < arg_25_2 then
		var_25_0(arg_25_0, var_25_2(arg_25_0, arg_25_2), true, false)

		var_25_5 = true
	end

	if not var_25_5 and arg_25_3 then
		var_25_0(arg_25_0, arg_25_2, true, false)

		var_25_5 = true
	end

	if var_25_5 then
		arg_25_0:UpdateNumbersArrowsAndScrolling()
	end
end

function LUI.UIGrid.HandleScrollbarDrag(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1.scrollbar

	if arg_26_1.dragStart or not arg_26_0._dragTargetRef then
		arg_26_0._dragTargetRef = {
			x = arg_26_1.targetX,
			y = arg_26_1.targetY
		}
	end

	local var_26_1 = arg_26_1.targetX - arg_26_0._dragTargetRef.x
	local var_26_2 = arg_26_1.targetY - arg_26_0._dragTargetRef.y

	if var_26_1 == 0 and var_26_2 == 0 then
		return false
	end

	local var_26_3 = arg_26_0:GetContentSize(var_26_0:GetDirection())

	if var_26_3 and var_26_3 > 0 then
		if var_26_0:GetDirection() == LUI.DIRECTION.vertical then
			local var_26_4 = var_26_2 * var_26_3
			local var_26_5, var_26_6 = arg_26_0:GetRowBoundaries()
			local var_26_7 = arg_26_0:ConvertRowPixelToLine(var_26_4 >= 0 and var_26_6 or var_26_5, var_26_4)
			local var_26_8 = {
				x = arg_26_0:GetTargetColumn(),
				y = var_26_7,
				x = arg_26_0:GetTargetColumn(),
				y = var_26_7
			}

			arg_26_0:SetPositionInternal(var_26_8, true, false, false)
		else
			local var_26_9 = var_26_1 * var_26_3
			local var_26_10, var_26_11 = arg_26_0:GetColumnBoundaries()
			local var_26_12 = arg_26_0:ConvertColumnPixelToLine(var_26_9 >= 0 and var_26_11 or var_26_10, var_26_9)
			local var_26_13 = {
				x = var_26_12,
				y = arg_26_0:GetTargetRow(),
				x = var_26_12,
				y = arg_26_0:GetTargetRow()
			}

			arg_26_0:SetPositionInternal(var_26_13, true, false, false)
		end

		arg_26_0:UpdateScrolling()

		arg_26_0._dragTargetRef = {
			x = arg_26_1.targetX,
			y = arg_26_1.targetY
		}
	end

	return true
end

function LUI.UIGrid.HandleScrollbarSet(arg_27_0, arg_27_1)
	if arg_27_1.scrollbar:GetDirection() == LUI.DIRECTION.vertical then
		local var_27_0 = (arg_27_0:GetContentSize(LUI.DIRECTION.vertical) or 1) * arg_27_1.targetY
		local var_27_1 = arg_27_0:ConvertRowPixelToLine(0, var_27_0)

		arg_27_0:SetPositionInternal({
			x = arg_27_0:GetTargetColumn(),
			y = var_27_1
		}, true)
	else
		local var_27_2 = (arg_27_0:GetContentSize(LUI.DIRECTION.horizontal) or 1) * arg_27_1.targetX
		local var_27_3 = arg_27_0:ConvertColumnPixelToLine(0, var_27_2)

		arg_27_0:SetPositionInternal({
			x = var_27_3,
			y = arg_27_0:GetTargetRow()
		}, true)
	end
end

function LUI.UIGrid.AddScrollbar(arg_28_0, arg_28_1)
	if arg_28_1._slider then
		arg_28_1._slider.mouseWheelTarget = arg_28_0
	elseif arg_28_1._fixedSizeSlider then
		arg_28_1._fixedSizeSlider.mouseWheelTarget = arg_28_0
	end

	arg_28_1:LinkTo(arg_28_0)
	arg_28_0:SetHandleMouseMove(true)
	table.insert(arg_28_0._scrollbars, arg_28_1)
	arg_28_0:SetNotifyOnLayoutInit(true)

	if not arg_28_1._customScrolling then
		arg_28_0:registerEventHandler("scrollbar_previous", function(arg_29_0, arg_29_1)
			if arg_29_1.scrollbar:GetDirection() == LUI.DIRECTION.vertical then
				arg_29_0:Scroll("up")
			else
				arg_29_0:Scroll("left")
			end

			return true
		end)
		arg_28_0:registerEventHandler("scrollbar_next", function(arg_30_0, arg_30_1)
			if arg_30_1.scrollbar:GetDirection() == LUI.DIRECTION.vertical then
				arg_30_0:Scroll("down")
			else
				arg_30_0:Scroll("right")
			end

			return true
		end)
		arg_28_0:registerEventHandler("scrollbar_drag", arg_28_0.HandleScrollbarDrag)
		arg_28_0:registerEventHandler("scrollbar_set", arg_28_0.HandleScrollbarSet)
	end
end

function LUI.UIGrid.SetArrowsEnabled(arg_31_0, arg_31_1)
	arg_31_0._arrowsEnabled = arg_31_1
end

function LUI.UIGrid.SetWidgetsAlwaysVisible(arg_32_0, arg_32_1)
	arg_32_0._widgetsAlwaysVisible = arg_32_1
end

function LUI.UIGrid.SetWraps(arg_33_0, arg_33_1, arg_33_2)
	if arg_33_1 ~= nil then
		arg_33_0._wrapX = arg_33_1
	end

	if arg_33_2 ~= nil then
		arg_33_0._wrapY = arg_33_2
	end
end

function LUI.UIGrid.AddArrow(arg_34_0, arg_34_1, arg_34_2)
	assert(type(arg_34_1) == "userdata")

	local var_34_0 = arg_34_2 or arg_34_1.id

	arg_34_0._arrows[var_34_0] = arg_34_1

	if arg_34_1.id == "ArrowUp" or arg_34_1.id == "ArrowDown" or arg_34_1.id == "ArrowRight" or arg_34_1.id == "ArrowLeft" then
		arg_34_1:registerEventHandler("button_action", function(arg_35_0, arg_35_1)
			if arg_34_0._arrowsEnabled then
				local var_35_0 = "up"

				if arg_34_1.id == "ArrowDown" then
					var_35_0 = "down"
				elseif arg_34_1.id == "ArrowRight" then
					var_35_0 = "right"
				elseif arg_34_1.id == "ArrowLeft" then
					var_35_0 = "left"
				end

				arg_34_0:Scroll(var_35_0)
			end
		end)
	end
end

function LUI.UIGrid.AddItemNumbers(arg_36_0, arg_36_1, arg_36_2)
	assert(type(arg_36_1) == "userdata")
	assert(arg_36_1.setText)

	local var_36_0 = arg_36_2 or arg_36_1.id

	assert(var_36_0 and #var_36_0 > 0)

	arg_36_0._itemNumbers[var_36_0] = arg_36_1
end

function LUI.UIGrid.SetLastFocusIndexDataSource(arg_37_0, arg_37_1)
	assert(type(arg_37_1) == "table")

	arg_37_0._lastFocusIndexDataSource = arg_37_1

	arg_37_0:SetLastFocusIndex(arg_37_0._targetPosition)
end

function LUI.UIGrid.SetLastFocusIndex(arg_38_0, arg_38_1)
	if arg_38_0._lastFocusIndexDataSource then
		arg_38_0._lastFocusIndexDataSource:SetValue(arg_38_0._controllerIndex, arg_38_1)
	end
end

function LUI.UIGrid.FocusFirstItem(arg_39_0)
	local var_39_0 = {
		x = 0,
		y = 0
	}

	arg_39_0:SetFocusedPosition(var_39_0, true)
end

function LUI.UIGrid.GetFocusPositionIndex(arg_40_0, arg_40_1)
	if not arg_40_0._targetPosition then
		return nil
	end

	arg_40_1 = arg_40_1 or {}

	if arg_40_1.relativePosition == nil then
		arg_40_1.relativePosition = true
	end

	local var_40_0
	local var_40_1 = arg_40_0:GetFocusPosition(LUI.DIRECTION.horizontal)
	local var_40_2 = arg_40_0:GetFocusPosition(LUI.DIRECTION.vertical)

	if arg_40_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		if arg_40_1.relativePosition then
			var_40_0 = var_40_1 + var_40_2 * arg_40_0:GetMaxVisibleColumns()
		else
			var_40_0 = var_40_1 + var_40_2 * arg_40_0:GetNumColumns()
		end
	elseif arg_40_1.relativePosition then
		var_40_0 = var_40_2 + var_40_1 * arg_40_0:GetMaxVisibleRows()
	else
		var_40_0 = var_40_2 + var_40_1 * arg_40_0:GetNumRows()
	end

	local var_40_3 = arg_40_0:GetNumChildren()

	if var_40_3 then
		if arg_40_1.clampContentIndexToDatasetLength and var_40_3 <= var_40_0 then
			var_40_0 = var_40_3 - 1
		else
			var_40_0 = var_40_0 % var_40_3
		end
	end

	return var_40_0
end

function LUI.UIGrid.SetSnapOnWrapEnabled(arg_41_0, arg_41_1)
	arg_41_0._snapOnWrap = arg_41_1
end

function LUI.UIGrid.SetMouseWheelScrollingOffsetPx(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0._mouseWheelScrollingVerticalOffsetPx = arg_42_1 and arg_42_1 or arg_42_0._mouseWheelScrollingVerticalOffsetPx
	arg_42_0._mouseWheelScrollingHorizontalOffsetPx = arg_42_2 and arg_42_2 or arg_42_0._mouseWheelScrollingHorizontalOffsetPx
end

function LUI.UIGrid.BuildGridCountArrows(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0.GridCountArrows = MenuBuilder.BuildRegisteredType("GridCountArrows", {
		controllerIndex = arg_43_0._controllerIndex
	})
	arg_43_0.GridCountArrows.id = "GridCountArrows"

	local function var_43_0()
		local var_44_0, var_44_1, var_44_2, var_44_3 = arg_43_0:getCurrentGlobalRect()
		local var_44_4 = var_44_0 + (var_44_2 - var_44_0) / 2
		local var_44_5, var_44_6, var_44_7, var_44_8 = arg_43_0.GridCountArrows:getLocalRect()
		local var_44_9 = var_44_7 - var_44_5
		local var_44_10 = var_44_8 - var_44_6
		local var_44_11 = var_44_4 - var_44_9 / 2
		local var_44_12 = var_44_11 + var_44_9
		local var_44_13 = var_44_3 + arg_43_2
		local var_44_14 = var_44_13 + var_44_10

		arg_43_0.GridCountArrows:SetAnchorsAndPosition(0, 1, 0, 1, var_44_11, var_44_12, var_44_13, var_44_14)
	end

	arg_43_0:SetNotifyOnLayoutInit(true)
	arg_43_0:addEventHandler("layout_initialized", function()
		var_43_0()

		arg_43_1 = arg_43_1 or arg_43_0:getParent()

		arg_43_1:addElement(arg_43_0.GridCountArrows)
	end)
	arg_43_0:addEventHandler("grid_size_updated", function()
		var_43_0()
	end)
	arg_43_0:AddItemNumbers(arg_43_0.GridCountArrows.ListCount)
	arg_43_0:AddArrow(arg_43_0.GridCountArrows.ArrowUp)
	arg_43_0:AddArrow(arg_43_0.GridCountArrows.ArrowDown)
	arg_43_0.GridCountArrows.ArrowUp:SetupArrow(LUI.BEARING.up)
	arg_43_0.GridCountArrows.ArrowDown:SetupArrow(LUI.BEARING.down)
end

function LUI.UIGrid.GetChildPosition(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:GetBuiltChildren()

	for iter_47_0, iter_47_1 in ipairs(var_47_0) do
		if arg_47_1:isDescendentOf(iter_47_1) then
			return iter_47_1._gridContentColumnIndex, iter_47_1._gridContentRowIndex
		end
	end

	return nil, nil
end

function LUI.UIDataSourceGrid.init(arg_48_0, arg_48_1)
	Engine.BHFFIBEFFH("UIDataSourceGrid", "widget")
	assert(arg_48_1)
	assert(arg_48_1.controllerIndex)

	arg_48_1.numChildren = nil
	arg_48_1.numRows = nil
	arg_48_1.numColumns = nil

	function arg_48_1.refreshChild(arg_49_0, arg_49_1, arg_49_2)
		arg_48_0:SetGridChildDataSource(arg_49_0, arg_49_1, arg_49_2)
	end

	LUI.UIDataSourceGrid.super.init(arg_48_0, arg_48_1)

	if arg_48_1.dataSource then
		arg_48_0:SetGridDataSource(arg_48_1.dataSource)
	else
		arg_48_0:SetNumChildren(0)
	end

	Engine.DCHDDCJCEG("UIDataSourceGrid", "widget")
end

function LUI.UIDataSourceGrid.SetGridChildDataSource(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	if arg_50_0._gridDataSource then
		local var_50_0 = arg_50_0:GetContentIndex(arg_50_2, arg_50_3)
		local var_50_1 = arg_50_0._gridDataSource:GetDataSourceAtIndex(var_50_0, arg_50_0._controllerIndex)

		arg_50_1:SetDataSource(var_50_1, arg_50_0._controllerIndex)
	end
end

function LUI.UIDataSourceGrid.SetGridDataSource(arg_51_0, arg_51_1)
	assert(type(arg_51_1) == "table")
	assert(type(arg_51_1.GetDataSourceAtIndex) == "function")

	if arg_51_0._gridDataSource == arg_51_1 then
		return
	end

	local var_51_0 = arg_51_0:GetBuiltChildren()

	for iter_51_0, iter_51_1 in ipairs(var_51_0) do
		iter_51_1:SetDataSource(nil, arg_51_0._controllerIndex)
	end

	arg_51_0._pendingRefresh = true
	arg_51_0._gridDataSource = arg_51_1

	if arg_51_0._countSubscription then
		arg_51_0:UnsubscribeFromModel(arg_51_0._countSubscription)
	end

	local var_51_1 = arg_51_0._gridDataSource:GetCountModel(arg_51_0._controllerIndex)

	if var_51_1 then
		arg_51_0._countSubscription = arg_51_0:SubscribeToModel(var_51_1, function(arg_52_0)
			local var_52_0 = DataModel.JJEHAEBDF(arg_52_0)

			if var_52_0 then
				arg_51_0:SetNumChildren(var_52_0)
				arg_51_0:RefreshContent()
			end
		end)
	else
		local var_51_2 = arg_51_0._gridDataSource:GetCountValue(arg_51_0._controllerIndex)

		assert(var_51_2)
		arg_51_0:SetNumChildren(var_51_2)
		arg_51_0:RefreshContent()
	end

	for iter_51_2, iter_51_3 in ipairs(arg_51_0._scrollbars) do
		iter_51_3:SetLinkedGridDataSource(arg_51_1)
	end

	if arg_51_0._pendingRefresh then
		arg_51_0._pendingRefresh = nil

		arg_51_0:RefreshContent()
	end
end

function LUI.UIDataSourceGrid.SetGridDataSourceThroughElement(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = DataLink.new({
		target = arg_53_0,
		source = arg_53_1,
		relativeDataSourcePath = arg_53_2,
		type = DataLink.TYPES.gridDataSource
	})

	var_53_0:Link()
	var_53_0:Refresh()

	return var_53_0
end

function LUI.UIDataSourceGrid.GetGridDataSource(arg_54_0)
	return arg_54_0._gridDataSource
end

function LUI.UIDataSourceGrid.GetDefaultFocus(arg_55_0)
	if not arg_55_0._gridDataSource then
		return nil
	end

	local var_55_0 = arg_55_0._gridDataSource:GetDefaultFocusIndex(arg_55_0._controllerIndex)

	if var_55_0 then
		if type(var_55_0) == "table" then
			return var_55_0
		else
			return arg_55_0:GetPositionForIndex(var_55_0, {
				relativePosition = false
			})
		end
	else
		return nil
	end
end

function LUI.UIGrid.addElement(arg_56_0, arg_56_1)
	assert(false, "Forbidden")
end

function LUI.UIGrid.closeChildren(arg_57_0)
	local var_57_0 = arg_57_0:GetBuiltChildren()

	for iter_57_0, iter_57_1 in ipairs(var_57_0) do
		iter_57_1:closeTree()
	end
end

function LUI.UIGrid.LoseFocus(arg_58_0, arg_58_1)
	if arg_58_0:ProcessEventToChildInFocus(arg_58_1) then
		arg_58_0._childInFocus = nil
	end

	arg_58_0._targetPosition = nil
	arg_58_0._shouldFocus = nil
end

function LUI.UIGrid.ProcessEventToChildInFocus(arg_59_0, arg_59_1)
	if arg_59_0._childInFocus then
		return arg_59_0._childInFocus:processEvent(arg_59_1)
	end

	return false
end

function LUI.UIGrid.GetVisibleChildInFocus(arg_60_0)
	assert(arg_60_0._childInFocus)

	return arg_60_0._childInFocus
end

function LUI.UIGrid.GainFocus(arg_61_0, arg_61_1)
	assert(arg_61_0:GetNumColumns() and arg_61_0:GetNumRows(), "Either grid columns or rows are not set. Try calling grid:SetNumColumns() or grid:SetNumRows()")

	if arg_61_0._navigateLikeUIList and arg_61_1.direction then
		if arg_61_1.direction == "down" then
			arg_61_0:SetFocusedPosition({
				x = 0,
				y = 0
			}, true, nil, arg_61_1.isWrap)
		elseif arg_61_1.direction == "up" then
			arg_61_0:SetFocusedPosition({
				x = 0,
				y = arg_61_0:GetNumRows()
			}, true, nil, arg_61_1.isWrap)
		elseif arg_61_1.direction == "left" then
			arg_61_0:SetFocusedPosition({
				x = 0,
				y = 0
			}, true, nil, arg_61_1.isWrap)
		elseif arg_61_1.direction == "right" then
			arg_61_0:SetFocusedPosition({
				y = 0,
				x = arg_61_0:GetNumColumns()
			}, true, nil, arg_61_1.isWrap)
		end
	else
		local var_61_0 = arg_61_0:GetDefaultFocus()

		if var_61_0 then
			assert(arg_61_0:IsPositionFocusable(var_61_0), "defaultFocus is invalid, value is { x = " .. tostring(var_61_0.x) .. ", y = " .. tostring(var_61_0.y) .. " }")

			local var_61_1 = true

			if arg_61_1 then
				var_61_1 = arg_61_1.shouldPlayButtonSound
			end

			arg_61_0:SetFocusedPosition(var_61_0, true, nil, nil, var_61_1)
		else
			local var_61_2, var_61_3 = arg_61_0:restoreState()

			if var_61_3 == 0 then
				local var_61_4 = arg_61_0._targetPosition or arg_61_0:GetFirstFocusablePosition()

				if var_61_4 then
					arg_61_0:SetFocusedPosition(var_61_4, true, nil, nil, arg_61_1.shouldPlayButtonSound)
				end
			end
		end
	end

	return arg_61_0._targetPosition ~= nil
end

function LUI.UIGrid.restoreFocus(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_0:GetNumColumns()
	local var_62_1 = arg_62_0:GetNumRows()

	if arg_62_0.id == arg_62_1.id and var_62_0 ~= 0 and var_62_1 ~= 0 then
		assert(arg_62_1.data)
		arg_62_0:SetTargetRow(arg_62_1.data.targetRow, true, true)
		arg_62_0:SetTargetColumn(arg_62_1.data.targetColumn, true, true)
		arg_62_0:SetFocusedPosition(arg_62_1.data.targetPosition, true)

		return true
	end

	return arg_62_0:dispatchEventToChildren(arg_62_1)
end

function LUI.UIGrid.getAllFocusedChildren(arg_63_0, arg_63_1)
	arg_63_1 = arg_63_1 or {}

	if arg_63_0._targetPosition and arg_63_0._shouldFocus then
		arg_63_0.saveData = {
			targetPosition = arg_63_0._targetPosition,
			targetRow = arg_63_0:GetTargetRow(),
			targetColumn = arg_63_0:GetTargetColumn()
		}

		table.insert(arg_63_1, arg_63_0)
	end

	return arg_63_1
end

function LUI.UIGrid.GetHorizontalAlignment(arg_64_0)
	return arg_64_0._horizontalAlignment
end

function LUI.UIGrid.GetVerticalAlignment(arg_65_0)
	return arg_65_0._verticalAlignment
end

function LUI.UIGrid.GetFocusableIndicesFromPosition(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_0:GetNumColumns()
	local var_66_1 = arg_66_0:GetNumRows()

	if var_66_1 == 0 or var_66_0 == 0 then
		return nil
	end

	local var_66_2 = arg_66_1.x
	local var_66_3 = arg_66_1.y
	local var_66_4 = {}
	local var_66_5 = {
		x = var_66_2 - 1,
		y = var_66_3
	}
	local var_66_6 = {
		x = var_66_2 + 1,
		y = var_66_3
	}
	local var_66_7 = {
		x = var_66_2,
		y = var_66_3 - 1
	}
	local var_66_8 = {
		x = var_66_2,
		y = var_66_3 + 1
	}

	if arg_66_0._wrapX then
		if var_66_5.x < 0 then
			var_66_5.x = var_66_0 - 1
		end

		if var_66_6.x > var_66_0 - 1 then
			var_66_6.x = 0
		end
	end

	if arg_66_0._wrapY then
		if var_66_7.y < 0 then
			var_66_7.y = var_66_1 - 1
		end

		if var_66_8.y > var_66_1 - 1 then
			var_66_8.y = 0
		end
	end

	table.insert(var_66_4, {
		x = var_66_2,
		y = var_66_3
	})
	table.insert(var_66_4, var_66_5)
	table.insert(var_66_4, var_66_6)
	table.insert(var_66_4, var_66_7)
	table.insert(var_66_4, var_66_8)

	if Engine.CGABICJHAI() then
		table.insert(var_66_4, {
			x = var_66_2 + 1,
			y = var_66_3 - 1
		})
		table.insert(var_66_4, {
			x = var_66_2 - 1,
			y = var_66_3 + 1
		})
		table.insert(var_66_4, {
			x = var_66_2 - 1,
			y = var_66_3 - 1
		})
		table.insert(var_66_4, {
			x = var_66_2 + 1,
			y = var_66_3 + 1
		})
	end

	local var_66_9 = {}

	for iter_66_0 = 1, #var_66_4 do
		local var_66_10 = {
			x = var_66_4[iter_66_0].x,
			y = var_66_4[iter_66_0].y
		}

		if arg_66_0:IsPositionInDataSet(var_66_10.x, var_66_10.y) then
			local var_66_11 = arg_66_0:GetContentIndex(var_66_10.x, var_66_10.y, {
				relativePosition = false
			}) + 1

			if not LUI.IsItemInArray(var_66_9, var_66_11) then
				table.insert(var_66_9, var_66_11)
			end
		end
	end

	return var_66_9
end

function LUI.UIGrid.IsPositionFocusable(arg_67_0, arg_67_1)
	if not arg_67_0:IsPositionInDataSet(arg_67_1.x, arg_67_1.y) then
		return false
	end

	if arg_67_0._isPositionFocusable then
		return arg_67_0._isPositionFocusable(arg_67_1.x, arg_67_1.y)
	else
		local var_67_0

		if arg_67_0._buildChild then
			var_67_0 = arg_67_0:GetBuiltChildren()[1]
		else
			var_67_0 = arg_67_0:GetElementAtPosition(arg_67_1.x, arg_67_1.y)
		end

		assert(var_67_0)

		return var_67_0:TreeCanFocus(FocusType.ListSelection)
	end
end

function LUI.UIGrid.GetFirstFocusablePosition(arg_68_0)
	local var_68_0 = {
		x = 0,
		y = 0
	}

	if arg_68_0:IsPositionFocusable(var_68_0) then
		return var_68_0
	end

	if arg_68_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		var_68_0 = {
			x = 1,
			y = 0
		}
	else
		var_68_0 = {
			x = 0,
			y = 1
		}
	end

	if arg_68_0:IsPositionFocusable(var_68_0) then
		return var_68_0
	end

	if arg_68_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		var_68_0 = {
			x = 0,
			y = 1
		}
	else
		var_68_0 = {
			x = 1,
			y = 0
		}
	end

	if arg_68_0:IsPositionFocusable(var_68_0) then
		return var_68_0
	end

	local var_68_1 = {
		x = 0,
		y = 0
	}
	local var_68_2 = arg_68_0:GetNumColumns()
	local var_68_3 = arg_68_0:GetNumRows()

	if arg_68_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		while var_68_3 > var_68_1.y do
			while var_68_2 > var_68_1.x do
				if arg_68_0:IsPositionFocusable(var_68_1) then
					return var_68_1
				end

				var_68_1.x = var_68_1.x + 1
			end

			var_68_1.x = 0
			var_68_1.y = var_68_1.y + 1
		end
	else
		while var_68_2 > var_68_1.x do
			while var_68_3 > var_68_1.y do
				if arg_68_0:IsPositionFocusable(var_68_1) then
					return var_68_1
				end

				var_68_1.y = var_68_1.y + 1
			end

			var_68_1.y = 0
			var_68_1.x = var_68_1.x + 1
		end
	end

	return nil
end

function LUI.UIGrid.GetNextFocusablePosition(arg_69_0, arg_69_1, arg_69_2)
	assert(math.abs(arg_69_2) == 1)

	local var_69_0 = arg_69_0:GetNumColumns()
	local var_69_1 = arg_69_0:GetNumRows()

	if var_69_1 == 0 or var_69_0 == 0 then
		return nil
	end

	local var_69_2
	local var_69_3
	local var_69_4
	local var_69_5
	local var_69_6

	if arg_69_1 == LUI.DIRECTION.horizontal then
		var_69_2 = "x"
		var_69_3 = "y"
		var_69_4 = arg_69_0._wrapX
		var_69_5 = var_69_0
		var_69_6 = var_69_1
	else
		var_69_2 = "y"
		var_69_3 = "x"
		var_69_4 = arg_69_0._wrapY
		var_69_5 = var_69_1
		var_69_6 = var_69_0
	end

	local var_69_7 = false
	local var_69_8 = LUI.ShallowCopy(arg_69_0._targetPosition)

	var_69_8.x = math.floor(var_69_8.x)
	var_69_8.y = math.floor(var_69_8.y)

	repeat
		var_69_8[var_69_2] = var_69_8[var_69_2] + arg_69_2

		if not arg_69_0:IsPositionInDataSet(var_69_8.x, var_69_8.y) and var_69_8[var_69_2] == var_69_5 - 1 and arg_69_0:GetPrimaryAxis() ~= arg_69_1 then
			local var_69_9 = arg_69_0:GetNumChildren() % var_69_6

			if var_69_9 > 0 then
				var_69_8[var_69_3] = var_69_9 - 1
			end
		end

		if var_69_4 and var_69_5 then
			local var_69_10 = var_69_5 - 1

			if var_69_8[var_69_2] < 0 then
				var_69_8[var_69_2] = var_69_10
				var_69_7 = true

				if not arg_69_0:IsPositionInDataSet(var_69_8.x, var_69_8.y) and arg_69_0:GetPrimaryAxis() ~= arg_69_1 then
					local var_69_11 = arg_69_0:GetNumChildren() % var_69_6

					if var_69_11 > 0 then
						var_69_8[var_69_3] = var_69_11 - 1
					end
				end
			elseif var_69_10 < var_69_8[var_69_2] then
				var_69_8[var_69_2] = 0
				var_69_7 = true
			end

			if var_69_8.x == arg_69_0._targetPosition.x and var_69_8.y == arg_69_0._targetPosition.y and var_69_7 then
				return nil
			end
		elseif not arg_69_0:IsPositionInDataSet(var_69_8.x, var_69_8.y) then
			return nil
		end
	until arg_69_0:IsPositionInDataSet(var_69_8.x, var_69_8.y) and arg_69_0:IsPositionFocusable(var_69_8)

	return var_69_8, var_69_7
end

function LUI.UIGrid.PositionChanged(arg_70_0)
	if arg_70_0._onNewTargetFocusPosition then
		arg_70_0._onNewTargetFocusPosition()
	end
end

function LUI.UIGrid.SetFocusedPosition(arg_71_0, arg_71_1, arg_71_2, arg_71_3, arg_71_4, arg_71_5)
	arg_71_0:SetPositionInternal(arg_71_1, arg_71_2, true, arg_71_3, arg_71_4, arg_71_5)
	arg_71_0:FocusChanged()
	arg_71_0:PositionChanged()
end

function LUI.UIGrid.SetPosition(arg_72_0, arg_72_1, arg_72_2, arg_72_3)
	arg_72_0:SetPositionInternal(arg_72_1, arg_72_2, false, arg_72_3)
	arg_72_0:PositionChanged()
end

function LUI.UIGrid.SetPositionInternal(arg_73_0, arg_73_1, arg_73_2, arg_73_3, arg_73_4, arg_73_5, arg_73_6)
	arg_73_4 = arg_73_4 ~= false
	arg_73_1 = LUI.ShallowCopy(arg_73_1)

	assert(arg_73_1.x and arg_73_1.y)

	local var_73_0 = arg_73_0._targetPosition and LUI.ShallowCopy(arg_73_0._targetPosition)
	local var_73_1 = arg_73_0:GetNumColumns()
	local var_73_2 = arg_73_0:GetNumRows()

	if var_73_1 == 0 or var_73_2 == 0 then
		arg_73_0:RemoveFocusFromChild(arg_73_2)

		arg_73_0._shouldFocus = false
		arg_73_0._targetPosition = nil

		arg_73_0:SetLastFocusIndex(nil)
		arg_73_0:UpdateNumbersArrowsAndScrolling()

		return
	end

	arg_73_0._shouldFocus = arg_73_3

	if var_73_1 then
		arg_73_1.x = LUI.clamp(arg_73_1.x, 0, arg_73_3 and not arg_73_1.skipTargetColumnAdjustment and var_73_1 - 1 or var_73_1)
	end

	if var_73_2 then
		arg_73_1.y = LUI.clamp(arg_73_1.y, 0, arg_73_3 and not arg_73_1.skipTargetRowAdjustment and var_73_2 - 1 or var_73_2)
	end

	if arg_73_3 and not arg_73_0:IsPositionInDataSet(arg_73_1.x, arg_73_1.y) then
		local var_73_3, var_73_4 = arg_73_0:ColumnRowToPrimarySecondary(math.floor(arg_73_1.x), math.floor(arg_73_1.y))
		local var_73_5, var_73_6 = arg_73_0:PrimarySecondaryToColumnRow(var_73_3, var_73_4)

		while var_73_4 > 0 and not arg_73_0:IsPositionInDataSet(var_73_5, var_73_6) do
			var_73_4 = var_73_4 - 1
			var_73_5, var_73_6 = arg_73_0:PrimarySecondaryToColumnRow(var_73_3, var_73_4)
		end

		while var_73_3 > 0 and not arg_73_0:IsPositionInDataSet(var_73_5, var_73_6) do
			var_73_3 = var_73_3 - 1
			var_73_5, var_73_6 = arg_73_0:PrimarySecondaryToColumnRow(var_73_3, var_73_4)
		end

		arg_73_1.x = var_73_5
		arg_73_1.y = var_73_6
	end

	if var_73_0 and var_73_0.x == arg_73_1.x and var_73_0.y == arg_73_1.y then
		if not arg_73_3 then
			arg_73_0:RemoveFocusFromChild(arg_73_2)

			return
		else
			local var_73_7 = arg_73_0:GetElementAtPosition(var_73_0.x, var_73_0.y)

			if var_73_7 and (var_73_7:isInFocus() or #var_73_7:getAllFocusedChildren() > 0) then
				return
			end
		end
	end

	local var_73_8 = var_73_0 == nil

	arg_73_0:RemoveFocusFromChild(arg_73_2)

	if not arg_73_0._targetPosition then
		arg_73_0._targetPosition = {}
	end

	arg_73_0._targetPosition.x = arg_73_1.x
	arg_73_0._targetPosition.y = arg_73_1.y

	local var_73_9 = not arg_73_1.skipTargetRowAdjustment
	local var_73_10 = arg_73_1.y
	local var_73_11, var_73_12 = arg_73_0:GetRowBoundaries()
	local var_73_13 = LUI.clamp(arg_73_0._scrollingThresholdY, 0, arg_73_0:GetMaxVisibleRows() - 1)
	local var_73_14 = arg_73_0._scrollingThresholdPixelY
	local var_73_15 = var_73_11
	local var_73_16 = var_73_12
	local var_73_17 = var_73_8 or arg_73_1.y < var_73_0.y
	local var_73_18 = var_73_8 or arg_73_1.y > var_73_0.y

	if not arg_73_4 then
		var_73_13 = 0
		var_73_14 = 0
	end

	if arg_73_3 and var_73_9 then
		if var_73_18 then
			var_73_10 = math.floor(var_73_10 + 1)

			if var_73_2 and var_73_10 < var_73_2 - var_73_13 then
				local var_73_19 = arg_73_0:ConvertRowPixelToLine(var_73_10, -arg_73_0:GetRowSpacing())

				if var_73_19 > 0 then
					var_73_10 = var_73_19
				end
			end
		elseif var_73_17 then
			var_73_10 = math.floor(var_73_10)
		end
	end

	if var_73_14 > 0 then
		if var_73_17 then
			local var_73_20 = arg_73_0:ConvertRowPixelToLine(math.max(0, var_73_10), -var_73_14)

			if var_73_20 < var_73_11 then
				var_73_15 = var_73_20
				var_73_16 = arg_73_0:ComputeRowBottomFromTop(var_73_15)
			end
		elseif var_73_18 then
			local var_73_21 = arg_73_0:ConvertRowPixelToLine(math.min(var_73_2, var_73_10), var_73_14)

			if var_73_12 < var_73_21 then
				var_73_16 = var_73_21
				var_73_15 = arg_73_0:ComputeRowTopFromBottom(var_73_16)
			end
		end
	elseif var_73_17 and var_73_10 < var_73_11 + var_73_13 then
		var_73_15 = var_73_10 - var_73_13
		var_73_16 = arg_73_0:ComputeRowBottomFromTop(var_73_15)
	elseif var_73_18 and var_73_10 > var_73_12 - var_73_13 then
		var_73_16 = var_73_10 + var_73_13
		var_73_15 = arg_73_0:ComputeRowTopFromBottom(var_73_16)
	end

	if var_73_15 ~= var_73_11 or var_73_16 ~= var_73_12 then
		if arg_73_0._verticalAlignment == LUI.Alignment.Middle then
			assert(var_73_17 or var_73_18)

			if var_73_17 then
				var_73_10 = var_73_10 + math.floor(arg_73_0:GetMaxVisibleRows() / 2) - var_73_13
			elseif var_73_18 then
				var_73_10 = var_73_10 - math.floor(arg_73_0:GetMaxVisibleRows() / 2) + var_73_13
			end
		else
			var_73_10 = arg_73_0._verticalAlignment == LUI.Alignment.Bottom and var_73_16 or var_73_15
		end

		arg_73_0:SetTargetRow(var_73_10, true, arg_73_2)
	end

	local var_73_22 = not arg_73_1.skipTargetColumnAdjustment
	local var_73_23 = arg_73_1.x
	local var_73_24, var_73_25 = arg_73_0:GetColumnBoundaries()
	local var_73_26 = LUI.clamp(arg_73_0._scrollingThresholdX, 0, arg_73_0:GetMaxVisibleColumns() - 1)
	local var_73_27 = arg_73_0._scrollingThresholdPixelX
	local var_73_28 = var_73_24
	local var_73_29 = var_73_25
	local var_73_30 = var_73_8 or arg_73_1.x < var_73_0.x
	local var_73_31 = var_73_8 or arg_73_1.x > var_73_0.x

	if not arg_73_4 then
		var_73_26 = 0
	end

	if arg_73_3 and var_73_22 then
		if var_73_31 then
			var_73_23 = math.floor(var_73_23 + 1)

			if var_73_1 and var_73_23 < var_73_1 - var_73_26 then
				local var_73_32 = arg_73_0:ConvertColumnPixelToLine(var_73_23, -arg_73_0:GetColumnSpacing())

				if var_73_32 > 0 then
					var_73_23 = var_73_32
				end
			end
		elseif var_73_30 then
			var_73_23 = math.floor(var_73_23)
		end
	end

	if var_73_27 > 0 then
		if var_73_30 then
			local var_73_33 = arg_73_0:ConvertColumnPixelToLine(math.max(0, var_73_23), -var_73_27)

			if var_73_33 < var_73_24 then
				var_73_28 = var_73_33
				var_73_29 = arg_73_0:ComputeColumnRightFromLeft(var_73_28)
			end
		elseif var_73_31 then
			local var_73_34 = arg_73_0:ConvertColumnPixelToLine(math.min(var_73_1, var_73_23), var_73_27)

			if var_73_25 < var_73_34 then
				var_73_29 = var_73_34
				var_73_28 = arg_73_0:ComputeColumnLeftFromRight(var_73_29)
			end
		end
	elseif var_73_30 and var_73_23 < var_73_24 + var_73_26 then
		var_73_28 = var_73_23 - var_73_26
		var_73_29 = arg_73_0:ComputeColumnRightFromLeft(var_73_28)
	elseif var_73_31 and var_73_23 > var_73_25 - var_73_26 then
		var_73_29 = var_73_23 + var_73_26
		var_73_28 = arg_73_0:ComputeColumnLeftFromRight(var_73_29)
	end

	if var_73_28 ~= var_73_24 or var_73_29 ~= var_73_25 then
		if arg_73_0._horizontalAlignment == LUI.Alignment.Center then
			assert(var_73_30 or var_73_31)

			if var_73_30 then
				var_73_23 = var_73_23 + math.floor(arg_73_0:GetMaxVisibleColumns() / 2) - var_73_26
			elseif var_73_31 then
				var_73_23 = var_73_23 - math.floor(arg_73_0:GetMaxVisibleColumns() / 2) + var_73_26
			end
		else
			var_73_23 = arg_73_0._horizontalAlignment == LUI.Alignment.Right and var_73_29 or var_73_28
		end

		arg_73_0:SetTargetColumn(var_73_23, true, arg_73_2)
	end

	if arg_73_0._pendingRefresh then
		arg_73_0._pendingRefresh = nil

		arg_73_0:RefreshContent()
	end

	arg_73_0:UpdateNumbersAndArrows()

	if arg_73_3 then
		local var_73_35 = arg_73_0:GetElementAtPosition(arg_73_0._targetPosition.x, arg_73_0._targetPosition.y)

		if var_73_35 then
			local var_73_36

			if var_73_18 then
				var_73_36 = "down"
			elseif var_73_17 then
				var_73_36 = "up"
			elseif var_73_31 then
				var_73_36 = "right"
			elseif var_73_30 then
				var_73_36 = "left"
			end

			if arg_73_0._isWrapping then
				arg_73_0._isWrapping = false
			end

			arg_73_0:GiveFocusToChild(var_73_35, var_73_36, arg_73_5, arg_73_6)
		else
			arg_73_0:NotifyWhenPositionIsVisible(arg_73_0._targetPosition.x, arg_73_0._targetPosition.y)
		end
	end

	arg_73_0:UpdateScrolling()
end

function LUI.UIGrid.RemoveFocusFromChild(arg_74_0, arg_74_1)
	if arg_74_0._childInFocus then
		arg_74_0._childInFocus:processEvent({
			name = "lose_focus",
			snap = arg_74_1
		})

		arg_74_0._childInFocus = nil
	end
end

function LUI.UIGrid.GiveFocusToChild(arg_75_0, arg_75_1, arg_75_2, arg_75_3, arg_75_4)
	arg_75_1:processEvent({
		name = "gain_focus",
		direction = arg_75_2,
		isWrap = arg_75_3,
		shouldPlayButtonSound = arg_75_4
	})

	arg_75_0._childInFocus = arg_75_1
end

function LUI.UIGrid.AdjustFocusedTargetPosition(arg_76_0, arg_76_1, arg_76_2)
	local var_76_0 = arg_76_0:GetElementAtPosition(arg_76_1.x, arg_76_1.y)

	if var_76_0 and var_76_0.GetFocusTargetPositionOffset then
		local var_76_1 = var_76_0:GetFocusTargetPositionOffset(arg_76_1, arg_76_2)

		if var_76_1 then
			arg_76_1.x = arg_76_1.x + var_76_1.x
			arg_76_1.y = arg_76_1.y + var_76_1.y
			arg_76_1.skipTargetColumnAdjustment = var_76_1.x ~= 0
			arg_76_1.skipTargetRowAdjustment = var_76_1.y ~= 0
		end
	end
end

function LUI.UIGrid.FocusNextElement(arg_77_0, arg_77_1, arg_77_2, arg_77_3, arg_77_4, arg_77_5)
	if not arg_77_0._directionalInputEnabled then
		return false
	end

	local var_77_0
	local var_77_1
	local var_77_2
	local var_77_3

	if arg_77_2 == "up" then
		var_77_2 = LUI.DIRECTION.vertical
		var_77_3 = -1
	elseif arg_77_2 == "down" then
		var_77_2 = LUI.DIRECTION.vertical
		var_77_3 = 1
	elseif arg_77_2 == "left" then
		var_77_2 = LUI.DIRECTION.horizontal
		var_77_3 = -1
	elseif arg_77_2 == "right" then
		var_77_2 = LUI.DIRECTION.horizontal
		var_77_3 = 1
	end

	if var_77_2 and var_77_3 and arg_77_0._targetPosition then
		var_77_0, var_77_1 = arg_77_0:GetNextFocusablePosition(var_77_2, var_77_3)
	end

	if var_77_0 then
		arg_77_0:AdjustFocusedTargetPosition(var_77_0, arg_77_2, var_77_1)

		local var_77_4 = arg_77_0._alwaysSnap or var_77_1 and arg_77_0._snapOnWrap

		if var_77_1 then
			arg_77_0._isWrapping = true
			arg_77_0._pendingRefresh = true
		end

		arg_77_0:SetFocusedPosition(var_77_0, var_77_4 == true, nil, var_77_1)
		arg_77_0:FocusMoved(arg_77_2)
		arg_77_0:saveState()

		return true
	else
		local var_77_5 = arg_77_0:getParent()

		if var_77_5 and var_77_5:FocusNextElement(arg_77_0, arg_77_2, arg_77_3, arg_77_4, arg_77_5) then
			return true
		end
	end

	return false
end

function LUI.UIGrid.ScrollAmount(arg_78_0, arg_78_1, arg_78_2)
	if arg_78_1 == "up" or arg_78_1 == "down" then
		local var_78_0, var_78_1 = arg_78_0:GetRowBoundaries()
		local var_78_2 = arg_78_0:GetNumRows()
		local var_78_3 = var_78_0

		if arg_78_1 == "up" and (not var_78_2 or var_78_0 > 0) then
			var_78_3 = var_78_3 - arg_78_2
		elseif arg_78_1 == "down" and (not var_78_2 or var_78_1 < var_78_2) then
			var_78_3 = var_78_3 + var_78_1 - var_78_0 + arg_78_2
		else
			return false
		end

		if var_78_3 ~= var_78_0 then
			local var_78_4 = arg_78_0._targetPosition and arg_78_0._targetPosition.x or 0

			arg_78_0:SetPositionInternal({
				x = var_78_4,
				y = var_78_3
			}, true, false, false)
		end

		return true
	elseif arg_78_1 == "left" or arg_78_1 == "right" then
		local var_78_5, var_78_6 = arg_78_0:GetColumnBoundaries()
		local var_78_7 = arg_78_0:GetNumColumns()
		local var_78_8 = var_78_5

		if arg_78_1 == "left" and (not var_78_7 or var_78_5 > 0) then
			var_78_8 = var_78_8 - arg_78_2
		elseif arg_78_1 == "right" and (not var_78_7 or var_78_6 < var_78_7) then
			var_78_8 = var_78_8 + var_78_6 - var_78_5 + arg_78_2
		else
			return false
		end

		if var_78_8 ~= var_78_5 then
			local var_78_9 = arg_78_0._targetPosition and arg_78_0._targetPosition.y or 0

			arg_78_0:SetPositionInternal({
				x = var_78_8,
				y = var_78_9
			}, true, false, false)
		end

		return true
	else
		return false
	end
end

function LUI.UIGrid.Scroll(arg_79_0, arg_79_1)
	local var_79_0 = 0

	if arg_79_1 == "up" or arg_79_1 == "down" then
		local var_79_1, var_79_2 = arg_79_0:GetRowBoundaries()

		if not var_79_1 or not var_79_2 then
			return
		end

		if arg_79_1 == "up" then
			var_79_0 = var_79_1 - math.floor(var_79_1)
		else
			var_79_0 = math.ceil(var_79_2) - var_79_2
		end
	else
		local var_79_3, var_79_4 = arg_79_0:GetColumnBoundaries()

		if not var_79_3 or not var_79_4 then
			return
		end

		if arg_79_1 == "left" then
			var_79_0 = var_79_3 - math.floor(var_79_3)
		else
			var_79_0 = math.ceil(var_79_4) - var_79_4
		end
	end

	var_79_0 = var_79_0 < 0.01 and 1 + var_79_0 or var_79_0

	LUI.UIGrid.ScrollAmount(arg_79_0, arg_79_1, var_79_0)
end

function LUI.UIGrid.SetDirectionalInputEnabled(arg_80_0, arg_80_1)
	arg_80_0._directionalInputEnabled = arg_80_1
end

function LUI.UIGrid.HandleMouseScroll(arg_81_0, arg_81_1)
	local var_81_0

	if arg_81_1 == "up" or arg_81_1 == "down" then
		local var_81_1, var_81_2 = arg_81_0:GetRowBoundaries()

		if arg_81_1 == "up" then
			var_81_0 = var_81_1 - arg_81_0:ConvertRowPixelToLine(var_81_1, -arg_81_0._mouseWheelScrollingVerticalOffsetPx)
		else
			var_81_0 = arg_81_0:ConvertRowPixelToLine(var_81_2, arg_81_0._mouseWheelScrollingVerticalOffsetPx) - var_81_2
		end
	else
		local var_81_3, var_81_4 = arg_81_0:GetColumnBoundaries()

		if arg_81_1 == "left" then
			var_81_0 = var_81_3 - arg_81_0:ConvertColumnPixelToLine(var_81_3, -arg_81_0._mouseWheelScrollingHorizontalOffsetPx)
		else
			var_81_0 = arg_81_0:ConvertColumnPixelToLine(var_81_4, arg_81_0._mouseWheelScrollingHorizontalOffsetPx) - var_81_4
		end
	end

	arg_81_0:ScrollAmount(arg_81_1, math.abs(var_81_0))
end

function LUI.UIGrid.GamepadButton(arg_82_0, arg_82_1)
	if arg_82_1.down then
		local var_82_0 = arg_82_1.button == "up" or arg_82_1.button == "down" or arg_82_1.button == "left" or arg_82_1.button == "right"

		if var_82_0 then
			if not arg_82_0._directionalInputEnabled then
				return false
			elseif arg_82_0._isWrapping then
				return true
			end
		end

		if #arg_82_0._permittedQualifiers > 0 and arg_82_1.qualifier and var_82_0 and not LUI.IsItemInArray(arg_82_0._permittedQualifiers, arg_82_1.qualifier) then
			return false
		end

		if arg_82_1.qualifier == "mousewheel" and not arg_82_0._disableMouseWheel then
			local var_82_1 = arg_82_1.button
			local var_82_2 = false

			for iter_82_0, iter_82_1 in ipairs(arg_82_0._scrollbars) do
				if iter_82_1.isVisible and iter_82_1:GetDirection() == LUI.DIRECTION.vertical then
					var_82_2 = false

					break
				elseif iter_82_1.isVisible and iter_82_1:GetDirection() ~= LUI.DIRECTION.vertical then
					var_82_2 = true
				end
			end

			if arg_82_0:GetNumRows() == 0 or arg_82_0:GetNumColumns() == 0 then
				return false
			elseif arg_82_0:GetNumRows() == 1 and arg_82_0:GetNumColumns() > 1 or var_82_2 then
				if var_82_1 == "up" then
					var_82_1 = "left"
				elseif var_82_1 == "down" then
					var_82_1 = "right"
				end
			end

			local var_82_3, var_82_4 = ProjectRootCoordinate(arg_82_1.rootName, arg_82_1.x, arg_82_1.y)

			if var_82_3 == nil or var_82_4 == nil then
				return
			end

			local var_82_5 = arg_82_0:IsPositionInside(var_82_3, var_82_4) or arg_82_0._alwaysTrapMouseWheel

			if not var_82_5 then
				for iter_82_2, iter_82_3 in ipairs(arg_82_0._scrollbars) do
					if iter_82_3.GetWidget then
						local var_82_6 = iter_82_3:GetWidget()

						var_82_5 = not var_82_6._blockMouseMove and var_82_6:IsPositionInside(var_82_3, var_82_4)
					end

					if var_82_5 then
						break
					end
				end
			end

			if var_82_5 or arg_82_1.forceScrollMove then
				arg_82_0:HandleMouseScroll(var_82_1)
			end
		end

		if not LUI.IsLastInputMouseNavigation(arg_82_1.controller) then
			for iter_82_4, iter_82_5 in ipairs(arg_82_0._scrollbars) do
				local var_82_7

				if iter_82_5.id then
					var_82_7 = iter_82_5
				elseif iter_82_5.GetWidget then
					var_82_7 = iter_82_5:GetWidget()
				end

				if var_82_7 then
					var_82_7:processEvent({
						name = "lose_focus"
					})
				end
			end

			for iter_82_6, iter_82_7 in pairs(arg_82_0._arrows) do
				iter_82_7:processEvent({
					name = "lose_focus"
				})
			end
		end

		if arg_82_0._targetPosition then
			if not arg_82_0._childInFocus and arg_82_0._shouldFocus then
				return arg_82_0:FocusNextElement(arg_82_0, arg_82_1.button, FocusType.Gamepad, arg_82_1.qualifier, arg_82_1.controller)
			else
				return arg_82_0:dispatchEventToChildren(arg_82_1)
			end
		end
	end

	return arg_82_0:dispatchEventToChildren(arg_82_1)
end

function LUI.UIGrid.SetDefaultFocus(arg_83_0, arg_83_1)
	arg_83_0._defaultFocus = arg_83_1
end

function LUI.UIGrid.GetDefaultFocus(arg_84_0)
	if type(arg_84_0._defaultFocus) == "function" then
		return arg_84_0._defaultFocus()
	else
		return arg_84_0._defaultFocus
	end
end

function LUI.UIGrid.FocusMoved(arg_85_0, arg_85_1)
	local var_85_0 = "grid_focus_" .. arg_85_1 .. "_moved"

	for iter_85_0, iter_85_1 in pairs(arg_85_0._arrows) do
		iter_85_1:processEvent({
			name = var_85_0
		})
	end
end

function LUI.UIGrid.SetCountFunction(arg_86_0, arg_86_1)
	if arg_86_1 then
		arg_86_0._countFunction = arg_86_1
	end
end

local function var_0_2(arg_87_0)
	if not arg_87_0._showNumbersAndArrowsKBM and not LUI.IsLastInputGamepad(arg_87_0._controllerIndex) then
		return false
	end

	return arg_87_0:GetMaxVisibleRows() * arg_87_0:GetMaxVisibleColumns() < arg_87_0:GetNumChildren() or arg_87_0._widgetsAlwaysVisible
end

local function var_0_3(arg_88_0)
	local var_88_0
	local var_88_1
	local var_88_2 = var_0_2(arg_88_0)

	if arg_88_0._countFunction then
		var_88_0, var_88_1 = arg_88_0._countFunction()
	else
		local var_88_3 = arg_88_0:GetNumRows()
		local var_88_4 = arg_88_0:GetNumColumns()
		local var_88_5 = arg_88_0:GetNumChildren()

		if var_88_5 < 0 then
			var_88_0 = 0
			var_88_1 = 0
		elseif arg_88_0._targetPosition then
			if var_88_4 == 1 then
				var_88_0 = 1 + arg_88_0._targetPosition.y
				var_88_1 = var_88_3
			elseif var_88_3 == 1 then
				var_88_0 = 1 + arg_88_0._targetPosition.x
				var_88_1 = var_88_4 or var_88_5
			else
				var_88_0 = 1 + arg_88_0._targetPosition.x + arg_88_0._targetPosition.y * var_88_4
				var_88_1 = var_88_5
			end
		else
			var_88_0 = 0
			var_88_1 = var_88_5
		end

		var_88_0 = LUI.clamp(math.floor(var_88_0), 0, var_88_1)
	end

	for iter_88_0, iter_88_1 in pairs(arg_88_0._itemNumbers) do
		local var_88_6 = ""

		if var_88_2 then
			var_88_6 = Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_88_0, var_88_1)
		end

		iter_88_1:setText(var_88_6)
	end
end

local function var_0_4(arg_89_0)
	local var_89_0 = {}
	local var_89_1 = arg_89_0:GetNumRows()
	local var_89_2 = arg_89_0:GetNumColumns()
	local var_89_3 = arg_89_0:GetNumChildren()
	local var_89_4 = var_0_2(arg_89_0)

	arg_89_0:SetArrowsEnabled(var_89_4)

	local var_89_5
	local var_89_6
	local var_89_7
	local var_89_8

	if LUI.IsLastInputKeyboardMouse(Engine.IJEBHJIJF()) then
		var_89_5, var_89_6 = arg_89_0:GetRowBoundaries()
		var_89_7, var_89_8 = arg_89_0:GetColumnBoundaries()
	elseif arg_89_0._targetPosition then
		var_89_5 = arg_89_0._targetPosition.y
		var_89_6 = arg_89_0._targetPosition.y + 1
		var_89_7 = arg_89_0._targetPosition.x
		var_89_8 = arg_89_0._targetPosition.x + 1
	end

	if var_89_3 >= 0 and var_89_5 and var_89_6 and var_89_7 and var_89_8 then
		if var_89_5 == 0 and var_89_1 and var_89_1 >= 0 and not arg_89_0._wrapY then
			table.insert(var_89_0, "grid_focus_up_blocked")
		else
			table.insert(var_89_0, "grid_focus_up_not_blocked")
		end

		if var_89_1 and var_89_1 <= var_89_6 and not arg_89_0._wrapY then
			table.insert(var_89_0, "grid_focus_down_blocked")
		else
			table.insert(var_89_0, "grid_focus_down_not_blocked")
		end

		if var_89_7 == 0 and var_89_2 and var_89_2 >= 0 and not arg_89_0._wrapX then
			table.insert(var_89_0, "grid_focus_left_blocked")
		else
			table.insert(var_89_0, "grid_focus_left_not_blocked")
		end

		if var_89_2 and var_89_2 <= var_89_8 and not arg_89_0._wrapX then
			table.insert(var_89_0, "grid_focus_right_blocked")
		else
			table.insert(var_89_0, "grid_focus_right_not_blocked")
		end
	else
		table.insert(var_89_0, "grid_focus_up_blocked")
		table.insert(var_89_0, "grid_focus_down_blocked")
		table.insert(var_89_0, "grid_focus_left_blocked")
		table.insert(var_89_0, "grid_focus_right_blocked")
	end

	for iter_89_0, iter_89_1 in pairs(arg_89_0._arrows) do
		for iter_89_2, iter_89_3 in ipairs(var_89_0) do
			if arg_89_0._updateArrowVisibilityOnRefresh then
				iter_89_1:SetAlpha(var_89_4 and 1 or 0)
			end

			if var_89_4 then
				iter_89_1:processEvent({
					name = iter_89_3
				})
			end
		end
	end
end

function LUI.UIGrid.UpdateScrolling(arg_90_0)
	for iter_90_0, iter_90_1 in ipairs(arg_90_0._scrollbars) do
		iter_90_1:UpdateScrolling()
	end
end

function LUI.UIGrid.SetScrollbarKBMStyle(arg_91_0, arg_91_1)
	for iter_91_0, iter_91_1 in ipairs(arg_91_0._scrollbars) do
		iter_91_1:SetKBMStyle(arg_91_1)
	end
end

function LUI.UIGrid.UpdateNumbersAndArrows(arg_92_0)
	var_0_3(arg_92_0)
	var_0_4(arg_92_0)
end

function LUI.UIGrid.UpdateNumbersArrowsAndScrolling(arg_93_0)
	arg_93_0:UpdateNumbersAndArrows()
	arg_93_0:UpdateScrolling()
end

function LUI.UIGrid.FocusChanged(arg_94_0, arg_94_1)
	if not arg_94_0._targetPosition then
		return
	end

	var_0_4(arg_94_0)
	arg_94_0:SetLastFocusIndex(arg_94_0:GetContentIndex(arg_94_0._targetPosition.x, arg_94_0._targetPosition.y))
end

function LUI.UIGrid.GetPositionForIndex(arg_95_0, arg_95_1, arg_95_2)
	arg_95_2 = arg_95_2 or {}

	if arg_95_2.relativePosition == nil then
		arg_95_2.relativePosition = true
	end

	local var_95_0 = arg_95_0:GetNumChildren()

	if var_95_0 then
		arg_95_1 = LUI.clamp(arg_95_1, 0, var_95_0 - 1)
	end

	local var_95_1
	local var_95_2

	if arg_95_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		if arg_95_2.relativePosition then
			local var_95_3 = arg_95_0:GetMaxVisibleColumns()

			var_95_1 = arg_95_1 % var_95_3
			var_95_2 = math.floor(arg_95_1 / var_95_3)
		else
			local var_95_4 = arg_95_0:GetNumColumns()

			var_95_2 = math.floor(arg_95_1 / var_95_4)
			var_95_1 = arg_95_1 - var_95_2 * var_95_4
		end
	elseif arg_95_2.relativePosition then
		local var_95_5 = arg_95_0:GetMaxVisibleRows()

		var_95_2 = arg_95_1 % var_95_5
		var_95_1 = math.floor(arg_95_1 / var_95_5)
	else
		local var_95_6 = arg_95_0:GetNumRows()

		var_95_1 = math.floor(arg_95_1 / var_95_6)
		var_95_2 = arg_95_1 - var_95_1 * var_95_6
	end

	return {
		x = var_95_1,
		y = var_95_2
	}
end

function LUI.UIGrid.GetContentIndex(arg_96_0, arg_96_1, arg_96_2, arg_96_3)
	arg_96_3 = arg_96_3 or {}

	if arg_96_3.relativePosition == nil then
		arg_96_3.relativePosition = true
	end

	local var_96_0

	if arg_96_0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		if arg_96_3.relativePosition then
			var_96_0 = arg_96_1 + arg_96_2 * arg_96_0:GetMaxVisibleColumns()
		else
			var_96_0 = arg_96_1 + arg_96_2 * arg_96_0:GetNumColumns()
		end
	elseif arg_96_3.relativePosition then
		var_96_0 = arg_96_2 + arg_96_1 * arg_96_0:GetMaxVisibleRows()
	else
		var_96_0 = arg_96_2 + arg_96_1 * arg_96_0:GetNumRows()
	end

	local var_96_1 = arg_96_0:GetNumChildren()

	if var_96_1 then
		var_96_0 = var_96_0 % var_96_1
	end

	return var_96_0
end

function LUI.UIGrid.GetContentSize(arg_97_0, arg_97_1)
	if arg_97_1 == LUI.DIRECTION.horizontal then
		return arg_97_0:GetHorizontalContentSize()
	else
		return arg_97_0:GetVerticalContentSize()
	end
end

function LUI.UIGrid.GetContentCount(arg_98_0, arg_98_1)
	if arg_98_1 == LUI.DIRECTION.horizontal then
		return arg_98_0:GetNumColumns()
	else
		return arg_98_0:GetNumRows()
	end
end

function LUI.UIGrid.GetContentVisibleSize(arg_99_0, arg_99_1)
	if arg_99_1 == LUI.DIRECTION.horizontal then
		return arg_99_0:GetColumnVisibleSize()
	else
		return arg_99_0:GetRowVisibleSize()
	end
end

function LUI.UIGrid.GetContentOffset(arg_100_0, arg_100_1)
	local var_100_0, var_100_1 = arg_100_0:GetRowPixelBoundaries()
	local var_100_2, var_100_3 = arg_100_0:GetColumnPixelBoundaries()

	if arg_100_1 == LUI.DIRECTION.horizontal then
		return var_100_2
	else
		return var_100_0
	end
end

function LUI.UIGrid.GetFocusPosition(arg_101_0, arg_101_1)
	if not arg_101_0._targetPosition then
		return nil
	end

	if arg_101_1 == LUI.DIRECTION.horizontal then
		return LUI.clamp(math.floor(arg_101_0._targetPosition.x), 0, arg_101_0:GetNumColumns() - 1)
	else
		return LUI.clamp(math.floor(arg_101_0._targetPosition.y), 0, arg_101_0:GetNumRows() - 1)
	end
end

function LUI.UIGrid.GetDefaultPosition(arg_102_0, arg_102_1)
	local var_102_0 = arg_102_0:GetDefaultFocus()

	if var_102_0 then
		if arg_102_1 == LUI.DIRECTION.horizontal then
			return var_102_0.x
		else
			return var_102_0.y
		end
	end

	return nil
end

function LUI.UIGrid.SetShouldFocus(arg_103_0, arg_103_1)
	arg_103_0._shouldFocus = arg_103_1
end

function LUI.UIGrid.SetNavigateLikeUIList(arg_104_0, arg_104_1)
	arg_104_0._navigateLikeUIList = arg_104_1
end

function LUI.UIDataSourceGrid.FocusChanged(arg_105_0)
	LUI.UIDataSourceGrid.super.FocusChanged(arg_105_0)

	if arg_105_0._targetPosition then
		local var_105_0 = arg_105_0:GetContentIndex(math.floor(arg_105_0._targetPosition.x), math.floor(arg_105_0._targetPosition.y))
		local var_105_1 = arg_105_0._gridDataSource:GetDataSourceAtIndex(var_105_0, arg_105_0._controllerIndex)

		arg_105_0:SetDataSource(var_105_1, arg_105_0._controllerIndex)
	end
end

function LUI.UIPeekingGrid.init(arg_106_0, arg_106_1)
	arg_106_1.ensureClampedTargetLineOnDimensionsUpdate = false

	LUI.UIGrid.init(arg_106_0, arg_106_1)
	assert(arg_106_1.buildChild, "Peeking Grid only works as an homogenous grid right now.")
	assert(not arg_106_1.verticalAlignment or arg_106_1.verticalAlignment == LUI.Alignment.Top, "Peeking Grid only supports Top vertical alignment right now.")
end

function LUI.UIPeekingGrid.SetPositionInternal(arg_107_0, arg_107_1, arg_107_2, arg_107_3, arg_107_4, arg_107_5, arg_107_6)
	arg_107_1 = LUI.ShallowCopy(arg_107_1)

	assert(arg_107_1.x and arg_107_1.y)

	local var_107_0 = arg_107_0:GetNumColumns()
	local var_107_1 = arg_107_0:GetNumRows()

	if var_107_0 == 0 or var_107_1 == 0 then
		arg_107_0:RemoveFocusFromChild(arg_107_2)

		arg_107_0._shouldFocus = false
		arg_107_0._targetPosition = nil

		arg_107_0:SetLastFocusIndex(nil)
		arg_107_0:UpdateNumbersArrowsAndScrolling()

		return
	end

	arg_107_0._shouldFocus = arg_107_3

	if arg_107_3 and not arg_107_0:IsPositionInDataSet(arg_107_1.x, arg_107_1.y) then
		local var_107_2, var_107_3 = arg_107_0:ColumnRowToPrimarySecondary(math.floor(arg_107_1.x), math.floor(arg_107_1.y))
		local var_107_4, var_107_5 = arg_107_0:PrimarySecondaryToColumnRow(var_107_2, var_107_3)

		while var_107_3 > 0 and not arg_107_0:IsPositionInDataSet(var_107_4, var_107_5) do
			var_107_3 = var_107_3 - 1
			var_107_4, var_107_5 = arg_107_0:PrimarySecondaryToColumnRow(var_107_2, var_107_3)
		end

		while var_107_2 > 0 and not arg_107_0:IsPositionInDataSet(var_107_4, var_107_5) do
			var_107_2 = var_107_2 - 1
			var_107_4, var_107_5 = arg_107_0:PrimarySecondaryToColumnRow(var_107_2, var_107_3)
		end

		arg_107_1.x = var_107_4
		arg_107_1.y = var_107_5
	end

	if arg_107_0._targetPosition and arg_107_0._targetPosition.x == arg_107_1.x and arg_107_0._targetPosition.y == arg_107_1.y then
		if not arg_107_3 then
			arg_107_0:RemoveFocusFromChild(arg_107_2)

			return
		else
			local var_107_6 = arg_107_0:GetElementAtPosition(arg_107_0._targetPosition.x, arg_107_0._targetPosition.y)

			if var_107_6 and (var_107_6:isInFocus() or #var_107_6:getAllFocusedChildren() > 0) then
				return
			end
		end
	end

	local var_107_7

	var_107_7 = arg_107_0._targetPosition == nil

	arg_107_0:RemoveFocusFromChild(arg_107_2)

	arg_107_1.y = LUI.clamp(arg_107_1.y, 0, arg_107_0:GetNumRows() - 1)

	if arg_107_3 then
		arg_107_1.y = math.floor(arg_107_1.y)
	end

	arg_107_0:SetTargetRow(arg_107_1.y, false, arg_107_2)

	if arg_107_0._pendingRefresh then
		arg_107_0._pendingRefresh = nil

		arg_107_0:RefreshContent()
	end

	arg_107_0._targetPosition = arg_107_1
	arg_107_0._targetPosition.skipTargetRowAdjustment = nil
	arg_107_0._targetPosition.skipTargetColumnAdjustment = nil

	arg_107_0:UpdateNumbersAndArrows()

	if arg_107_3 then
		local var_107_8 = arg_107_0:GetElementAtPosition(arg_107_0._targetPosition.x, arg_107_0._targetPosition.y)

		if var_107_8 then
			local var_107_9

			if scrollDown then
				var_107_9 = "down"
			elseif scrollUp then
				var_107_9 = "up"
			elseif scrollRight then
				var_107_9 = "right"
			elseif scrollLeft then
				var_107_9 = "left"
			end

			if arg_107_0._isWrapping then
				arg_107_0._isWrapping = false
			end

			arg_107_0:GiveFocusToChild(var_107_8, var_107_9, arg_107_5, arg_107_6)
		else
			arg_107_0:NotifyWhenPositionIsVisible(arg_107_0._targetPosition.x, arg_107_0._targetPosition.y)
		end
	end

	arg_107_0:UpdateScrolling()
end

function LUI.UIPeekingGrid.ScrollAmount(arg_108_0, arg_108_1, arg_108_2)
	if arg_108_1 == "up" or arg_108_1 == "down" then
		local var_108_0, var_108_1 = arg_108_0:GetRowBoundaries()
		local var_108_2 = var_108_0

		if arg_108_1 == "up" then
			var_108_2 = var_108_2 - arg_108_2
		elseif arg_108_1 == "down" then
			var_108_2 = var_108_2 + arg_108_2

			if arg_108_0._targetPosition.y == var_108_2 then
				arg_108_0._targetPosition.y = var_108_0
			end
		else
			return false
		end

		if var_108_2 ~= var_108_0 then
			local var_108_3 = arg_108_0._targetPosition and arg_108_0._targetPosition.x or 0

			arg_108_0:SetPositionInternal({
				x = var_108_3,
				y = var_108_2
			}, false, false, false)
		end

		return true
	elseif arg_108_1 == "left" or arg_108_1 == "right" then
		local var_108_4, var_108_5 = arg_108_0:GetColumnBoundaries()
		local var_108_6 = arg_108_0:GetNumColumns()
		local var_108_7 = var_108_4

		if arg_108_1 == "left" and (not var_108_6 or var_108_4 > 0) then
			var_108_7 = var_108_7 - arg_108_2
		elseif arg_108_1 == "right" and (not var_108_6 or var_108_5 < var_108_6) then
			var_108_7 = var_108_7 + var_108_5 - var_108_4 + arg_108_2
		else
			return false
		end

		if var_108_7 ~= var_108_4 then
			local var_108_8 = arg_108_0._targetPosition and arg_108_0._targetPosition.y or 0

			arg_108_0:SetPositionInternal({
				x = var_108_7,
				y = var_108_8
			}, false, false, false)
		end

		return true
	else
		return false
	end
end

function LUI.UIPeekingGrid.HandleMouseScroll(arg_109_0, arg_109_1)
	assert(arg_109_1 == "up" or arg_109_1 == "down", "Peeking Grid only supports up and down scrolling right now.")

	local var_109_0
	local var_109_1, var_109_2 = arg_109_0:GetRowBoundaries()

	if arg_109_1 == "up" then
		var_109_0 = math.floor(var_109_1)
	else
		var_109_0 = math.floor(var_109_1 + 1)
	end

	var_109_0 = var_109_0 == var_109_1 and 1 or var_109_0 - var_109_1

	arg_109_0:ScrollAmount(arg_109_1, math.abs(var_109_0))
end

function LUI.UIPeekingGrid.HandleScrollbarDrag(arg_110_0, arg_110_1)
	local var_110_0 = arg_110_1.scrollbar

	if arg_110_1.dragStart or not arg_110_0._dragTargetRef then
		arg_110_0._dragTargetRef = {
			x = arg_110_1.targetX,
			y = arg_110_1.targetY
		}
	end

	local var_110_1 = arg_110_1.targetY - arg_110_0._dragTargetRef.y

	if var_110_1 == 0 then
		return false
	end

	arg_110_0._dragTargetRef = {
		x = arg_110_1.targetX,
		y = arg_110_1.targetY
	}

	local var_110_2 = arg_110_0:GetContentSize(var_110_0:GetDirection())

	if var_110_2 and var_110_2 > 0 and var_110_0:GetDirection() == LUI.DIRECTION.vertical then
		local var_110_3 = var_110_1 * var_110_2
		local var_110_4, var_110_5 = arg_110_0:GetRowBoundaries()
		local var_110_6 = arg_110_0:ConvertRowPixelToLine(var_110_4, var_110_3)
		local var_110_7 = {
			x = arg_110_0:GetTargetColumn(),
			y = var_110_6
		}

		arg_110_0:SetPositionInternal(var_110_7, true, false, false)
	end

	return true
end

function LUI.UIPeekingGrid.HandleScrollbarSet(arg_111_0, arg_111_1)
	if arg_111_1.scrollbar:GetDirection() == LUI.DIRECTION.vertical then
		local var_111_0 = (arg_111_0:GetContentSize(LUI.DIRECTION.vertical) or 1) * arg_111_1.targetY
		local var_111_1 = math.floor(arg_111_0:ConvertRowPixelToLine(0, var_111_0))

		arg_111_0:SetPositionInternal({
			x = arg_111_0:GetTargetColumn(),
			y = var_111_1
		}, false)
	end
end

function LUI.UIPeekingGrid.GetContentSize(arg_112_0, arg_112_1)
	if arg_112_1 == LUI.DIRECTION.horizontal then
		return arg_112_0:GetHorizontalContentSize()
	else
		local var_112_0 = arg_112_0:GetVerticalContentSize()
		local var_112_1 = arg_112_0:GetContentVisibleSize(arg_112_1)
		local var_112_2 = arg_112_0:GetRowHeight()

		if var_112_0 == nil or var_112_1 == nil or var_112_2 == nil then
			return nil
		end

		return var_112_0 + var_112_1 - var_112_2
	end
end

function LUI.UIPeekingGrid.restoreFocus(arg_113_0, arg_113_1)
	local var_113_0 = arg_113_0:GetNumColumns()
	local var_113_1 = arg_113_0:GetNumRows()

	if arg_113_0.id == arg_113_1.id and var_113_0 ~= 0 and var_113_1 ~= 0 then
		assert(arg_113_1.data)
		arg_113_0:SetTargetRow(arg_113_1.data.targetRow, false, true)
		arg_113_0:SetTargetColumn(arg_113_1.data.targetColumn, false, true)
		arg_113_0:SetFocusedPosition(arg_113_1.data.targetPosition, true)

		return true
	end

	return arg_113_0:dispatchEventToChildren(arg_113_1)
end
