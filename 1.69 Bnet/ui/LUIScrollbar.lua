LUI.UIScrollbar = LUI.Class()

function LUI.UIScrollbar.init(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0

	arg_1_1 = arg_1_1 or {}
	arg_1_0._eventListener = arg_1_1.eventListener
	arg_1_0._sliderArea = arg_1_1.sliderArea
	arg_1_0._slider = arg_1_1.slider
	arg_1_0._fixedSizeSlider = arg_1_1.fixedSizeSlider
	arg_1_0._animationDuration = arg_1_1.animationDuration or 80
	arg_1_0._direction = arg_1_1.direction or LUI.DIRECTION.vertical

	assert(arg_1_0._direction == LUI.DIRECTION.vertical or arg_1_0._direction == LUI.DIRECTION.horizontal)
	arg_1_0._eventListener:SetNotifyOnLayoutInit(true)
	arg_1_0._eventListener:addEventHandler("layout_initialized", function()
		if arg_1_0._source then
			arg_1_0:ResizeScrollbar()
		end
	end)

	if arg_1_0._fixedSizeSlider then
		local var_1_1, var_1_2, var_1_3, var_1_4 = arg_1_0._fixedSizeSlider:getLocalRect()

		if arg_1_0._direction == LUI.DIRECTION.horizontal then
			arg_1_0._initialFixedWidth = var_1_3 - var_1_1
		else
			arg_1_0._initialFixedHeight = var_1_4 - var_1_2
		end

		arg_1_0._fixedSizeSlider.m_requireFocusType = FocusType.MouseOver
	end

	if arg_1_0._sliderArea then
		arg_1_0._sliderArea.m_requireFocusType = FocusType.MouseOver
	end

	if arg_1_0._slider then
		arg_1_0._slider.m_requireFocusType = FocusType.MouseOver
	end

	if arg_1_1.startCap then
		arg_1_1.startCap:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			if var_1_0._source then
				return var_1_0._source:processEvent({
					name = "scrollbar_previous",
					scrollbar = var_1_0
				})
			end
		end)
		arg_1_1.startCap:addEventHandler("leftmousedown", function(arg_4_0, arg_4_1)
			return true
		end)
	end

	if arg_1_1.endCap then
		arg_1_1.endCap:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			if var_1_0._source then
				return var_1_0._source:processEvent({
					name = "scrollbar_next",
					scrollbar = var_1_0
				})
			end
		end)
		arg_1_1.endCap:addEventHandler("leftmousedown", function(arg_6_0, arg_6_1)
			return true
		end)
	end

	if arg_1_1.sliderArea and (arg_1_1.slider or arg_1_1.fixedSizeSlider) then
		local var_1_5 = {
			x = 0,
			y = 0
		}

		local function var_1_6(arg_7_0, arg_7_1)
			if not var_1_0:IsKBMStyle() then
				return
			end

			if not arg_7_0:IsDisabled() then
				local var_7_0 = var_1_0._sliderArea:getWidth()
				local var_7_1 = var_1_0._sliderArea:getHeight()
				local var_7_2, var_7_3, var_7_4, var_7_5 = var_1_0._sliderArea:getRect()
				local var_7_6, var_7_7 = arg_7_1.root:PixelsToUnits(var_7_2, var_7_3)
				local var_7_8, var_7_9 = arg_7_1.root:PixelsToUnits(arg_7_1.x, arg_7_1.y)

				if arg_7_1.name == "leftmousedown" then
					local var_7_10, var_7_11, var_7_12, var_7_13 = arg_7_0:getRect()
					local var_7_14, var_7_15 = arg_7_1.root:PixelsToUnits(var_7_10, var_7_11)

					var_1_5.x = var_7_8 - var_7_14
					var_1_5.y = var_7_9 - var_7_15
				end

				local var_7_16 = var_7_8 - var_1_5.x
				local var_7_17 = var_7_9 - var_1_5.y
				local var_7_18 = (var_7_16 - var_7_6) / var_7_0
				local var_7_19 = LUI.clamp(var_7_18, 0, 1)
				local var_7_20 = (var_7_17 - var_7_7) / var_7_1
				local var_7_21 = LUI.clamp(var_7_20, 0, 1)

				var_1_0._source:processEvent({
					name = "scrollbar_drag",
					targetX = var_7_19,
					targetY = var_7_21,
					dragStart = arg_7_1.name == "leftmousedown",
					scrollbar = var_1_0
				})

				return true
			end
		end

		local function var_1_7(arg_8_0, arg_8_1)
			if not var_1_0:IsKBMStyle() then
				return
			end

			if not arg_8_0:IsDisabled() then
				local var_8_0 = var_1_0._sliderArea:getWidth()
				local var_8_1 = var_1_0._sliderArea:getHeight()
				local var_8_2, var_8_3, var_8_4, var_8_5 = var_1_0._sliderArea:getRect()
				local var_8_6, var_8_7 = arg_8_1.root:PixelsToUnits(var_8_2, var_8_3)
				local var_8_8, var_8_9 = arg_8_1.root:PixelsToUnits(arg_8_1.x, arg_8_1.y)
				local var_8_10 = (var_8_8 - var_8_6) / var_8_0
				local var_8_11 = LUI.clamp(var_8_10, 0, 1)
				local var_8_12 = (var_8_9 - var_8_7) / var_8_1
				local var_8_13 = LUI.clamp(var_8_12, 0, 1)

				var_1_0._source:processEvent({
					name = "scrollbar_set",
					targetX = var_8_11,
					targetY = var_8_13,
					scrollbar = var_1_0
				})

				return true
			end
		end

		local function var_1_8(arg_9_0, arg_9_1)
			Engine.BFAABIIGDC(true)
			var_1_6(arg_9_0, arg_9_1)

			return true
		end

		local function var_1_9(arg_10_0, arg_10_1)
			Engine.BFAABIIGDC(false)

			return true
		end

		local var_1_10 = arg_1_1.slider or arg_1_1.fixedSizeSlider

		var_1_10:registerEventHandler("leftmousedown", var_1_8)
		var_1_10:registerEventHandler("leftmouseup", var_1_9)
		var_1_10:registerEventHandler("mouse_capture_lost", var_1_9)
		var_1_10:registerEventHandler("mousedrag", var_1_6)
		arg_1_1.sliderArea:registerEventHandler("leftmousedown", var_1_7)
		var_1_10:addEventHandler("gamepad_button", function(arg_11_0, arg_11_1)
			if arg_11_1.qualifier == "mousewheel" and arg_11_0.mouseWheelTarget then
				return arg_11_0.mouseWheelTarget:processEvent(arg_11_1)
			end
		end)
	end
end

function LUI.UIScrollbar.ResizeScrollbar(arg_12_0)
	if arg_12_0._direction == LUI.DIRECTION.vertical then
		local var_12_0, var_12_1, var_12_2, var_12_3 = arg_12_0._eventListener:getCurrentGlobalRect()
		local var_12_4, var_12_5, var_12_6, var_12_7 = arg_12_0._source:getCurrentGlobalRect()
		local var_12_8 = arg_12_0._source:GetScale()

		local function var_12_9(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
			local var_13_0 = {
				x = arg_13_0,
				y = arg_13_2
			}
			local var_13_1 = {
				x = arg_13_1,
				y = arg_13_2
			}
			local var_13_2 = math.abs(arg_13_0 - arg_13_1)
			local var_13_3 = math.abs(arg_13_2 - arg_13_3)
			local var_13_4 = {
				x = arg_13_0 + var_13_2 / 2,
				y = arg_13_2 - var_13_3 / 2
			}
			local var_13_5 = math.sqrt(math.pow(var_13_1.x - var_13_4.x, 2) + math.pow(var_13_1.y - var_13_4.y, 2)) * arg_13_4

			return arg_13_0 - var_13_5, arg_13_1 + var_13_5
		end

		if var_12_4 ~= nil and var_12_0 ~= nil and (not arg_12_0._cachedGridWidth or math.abs(arg_12_0._cachedGridWidth - (var_12_6 - var_12_4)) > LUI.UIGrid.GRID_EPSILON) then
			arg_12_0._cachedGridWidth = var_12_6 - var_12_4

			local var_12_10, var_12_11 = var_12_9(var_12_4, var_12_6, var_12_5, var_12_7, var_12_8)
			local var_12_12, var_12_13, var_12_14, var_12_15 = arg_12_0._eventListener:getLocalRect()
			local var_12_16 = var_12_14 - var_12_12
			local var_12_17 = var_12_0 < var_12_10

			if var_12_17 then
				local var_12_18 = var_12_14 + (var_12_10 - var_12_2)

				arg_12_0._eventListener:SetRight(var_12_18)
			else
				local var_12_19 = var_12_12 - (var_12_0 - var_12_11)

				arg_12_0._eventListener:SetLeft(var_12_19)
			end

			arg_12_0:UpdateSliderAreaVertical(var_12_17)
		end
	end

	arg_12_0:UpdateScrolling()
end

function LUI.UIScrollbar.UpdateSliderAreaVertical(arg_14_0, arg_14_1)
	local var_14_0, var_14_1, var_14_2, var_14_3 = arg_14_0._sliderArea:getLocalRect()

	if arg_14_1 then
		arg_14_0._sliderArea:SetAnchorsAndPosition(0, 1, 0, 0, 0, math.abs(var_14_2) + math.abs(var_14_0), 0, 0)
	else
		arg_14_0._sliderArea:SetAnchorsAndPosition(1, 0, 0, 0, -(math.abs(var_14_2) + math.abs(var_14_0)), 0, 0, 0)
	end
end

function LUI.UIScrollbar.UpdateScrolling(arg_15_0)
	assert(arg_15_0._source)
	arg_15_0:UpdateSlider()

	if arg_15_0._eventListener then
		local var_15_0 = arg_15_0._source:GetContentSize(arg_15_0._direction)

		if not var_15_0 then
			return
		end

		local var_15_1 = arg_15_0._source:GetContentVisibleSize(arg_15_0._direction)

		assert(var_15_1)

		if var_15_0 <= var_15_1 then
			arg_15_0._eventListener:processEvent({
				name = "scrollbar_all_visible"
			})
			arg_15_0._eventListener:SetMouseFocusBlocker(true)

			arg_15_0.isVisible = false
		else
			arg_15_0._eventListener:processEvent({
				name = "scrollbar_not_all_visible"
			})
			arg_15_0._eventListener:SetMouseFocusBlocker(false)

			arg_15_0.isVisible = true
		end
	end
end

local function var_0_0(arg_16_0, arg_16_1)
	if arg_16_0._sliderArea then
		arg_16_0._sliderArea:processEvent({
			name = "expand",
			controller = arg_16_1.controller,
			focusType = FocusType.MouseOver
		})
	end
end

local function var_0_1(arg_17_0, arg_17_1)
	if arg_17_0._sliderArea then
		arg_17_0._sliderArea:processEvent({
			name = "shrink",
			controller = arg_17_1.controller,
			focusType = FocusType.MouseOver
		})
	end
end

function LUI.UIScrollbar.LinkTo(arg_18_0, arg_18_1)
	arg_18_0._source = arg_18_1

	arg_18_1:addEventHandler("mouseenter", function(arg_19_0, arg_19_1)
		var_0_0(arg_18_0, arg_19_1)
	end)
	arg_18_1:addEventHandler("gain_focus", function(arg_20_0, arg_20_1)
		var_0_0(arg_18_0, arg_20_1)
	end)
	arg_18_1:addEventHandler("mouseleave", function(arg_21_0, arg_21_1)
		if not arg_18_0._eventListener:IsPositionInside(arg_21_1.x, arg_21_1.y) then
			var_0_1(arg_18_0, arg_21_1)
		end
	end)
	arg_18_1:addEventHandler("lose_focus", function(arg_22_0, arg_22_1)
		var_0_1(arg_18_0, arg_22_1)
	end)
	arg_18_1:addEventHandler("grid_size_updated", function()
		arg_18_0:ResizeScrollbar()
	end)
	arg_18_0._eventListener:addEventHandler("scrollbar_force_show", function(arg_24_0, arg_24_1)
		var_0_0(arg_18_0, arg_24_1)
	end)
	arg_18_0:ResizeScrollbar()
end

function LUI.UIScrollbar.GetDirection(arg_25_0)
	return arg_25_0._direction
end

function LUI.UIScrollbar.GetWidget(arg_26_0)
	return arg_26_0._eventListener
end

function LUI.UIScrollbar.SetLinkedGridDataSource(arg_27_0, arg_27_1)
	return
end

function LUI.UIScrollbar.IsKBMStyle(arg_28_0)
	return arg_28_0._KBMStyle or not arg_28_0._fixedSizeSlider or arg_28_0._source._controllerIndex and LUI.IsLastInputKeyboardMouse(arg_28_0._source._controllerIndex)
end

function LUI.UIScrollbar.SetKBMStyle(arg_29_0, arg_29_1)
	arg_29_0._KBMStyle = arg_29_1
end

function LUI.UIScrollbar.UpdateSlider(arg_30_0)
	local var_30_0 = arg_30_0._slider or arg_30_0._fixedSizeSlider

	if not var_30_0 then
		return
	end

	local var_30_1 = arg_30_0._source:GetContentSize(arg_30_0._direction)

	if not var_30_1 then
		return
	end

	local var_30_2 = arg_30_0._source:GetContentVisibleSize(arg_30_0._direction)

	assert(var_30_2)

	local var_30_3 = math.min(var_30_2, var_30_1)
	local var_30_4
	local var_30_5
	local var_30_6 = arg_30_0._source._controllerIndex

	if arg_30_0:IsKBMStyle() and arg_30_0._KBMStyle == nil or arg_30_0._KBMStyle == true then
		local var_30_7 = arg_30_0._source:GetContentOffset(arg_30_0._direction)

		if not var_30_7 then
			var_30_7 = 0
			var_30_3 = 1
			var_30_1 = 1
		end

		local var_30_8 = var_30_3 / var_30_1

		var_30_4 = var_30_7 / var_30_1
		var_30_5 = var_30_4 + var_30_8
		var_30_4 = LUI.clamp(var_30_4, 0, 1 - var_30_8)
		var_30_5 = LUI.clamp(var_30_5, var_30_8, 1)
	else
		local var_30_9 = arg_30_0._source:GetFocusPosition(arg_30_0._direction)

		if not var_30_9 or var_30_9 < 0 then
			var_30_9 = 0
		end

		var_30_1 = arg_30_0._source:GetContentCount(arg_30_0._direction)

		assert(var_30_9 - var_30_1 < 0.01 or var_30_1 == 0)

		local var_30_10 = arg_30_0._direction == LUI.DIRECTION.horizontal and arg_30_0._initialFixedWidth or arg_30_0._initialFixedHeight
		local var_30_11 = arg_30_0._sliderArea or var_30_0:getParent()
		local var_30_12 = arg_30_0._direction == LUI.DIRECTION.horizontal and var_30_11:getWidth() or var_30_11:getHeight()

		if var_30_1 <= 1 or var_30_12 <= 1 then
			var_30_4 = 0
			var_30_5 = 0
		else
			local var_30_13 = (var_30_12 - var_30_10) / var_30_12

			var_30_4 = var_30_9 / (var_30_1 - 1) * var_30_13
			var_30_5 = var_30_4 + var_30_10 / var_30_12
		end
	end

	local var_30_14 = false

	if not arg_30_0._lastContentSize or not arg_30_0._lastContentVisibleSize or arg_30_0._lastContentSize <= arg_30_0._lastContentVisibleSize then
		var_30_14 = true
	end

	local var_30_15 = var_30_14 and 0 or arg_30_0._animationDuration

	if arg_30_0._direction == LUI.DIRECTION.horizontal then
		var_30_0:SetLeftAnchor(var_30_4, var_30_15, LUI.EASING.outCubic)
		var_30_0:SetRightAnchor(1 - var_30_5, var_30_15, LUI.EASING.outCubic)
		var_30_0:SetLeft(0, var_30_15)
		var_30_0:SetRight(0, var_30_15)
	else
		var_30_0:SetTopAnchor(var_30_4, var_30_15, LUI.EASING.outCubic)
		var_30_0:SetBottomAnchor(1 - var_30_5, var_30_15, LUI.EASING.outCubic)
		var_30_0:SetTop(0, var_30_15)
		var_30_0:SetBottom(0, var_30_15)
	end

	arg_30_0._lastContentSize = var_30_1
	arg_30_0._lastContentVisibleSize = var_30_3
end
