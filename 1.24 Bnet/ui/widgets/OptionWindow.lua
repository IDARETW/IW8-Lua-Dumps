module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.buttonList then
		arg_1_0.buttonListVScrollbar:closeTree()

		arg_1_0.buttonListVScrollbar = nil

		arg_1_0.buttonList:closeTree()

		arg_1_0.buttonList = nil
	end

	local var_1_0 = LUI.UIGrid.new({
		maxVisibleColumns = 1,
		maxVisibleRows = 20,
		wrapY = true,
		maxRows = 100,
		mouseWheelScrollingOffsetPx = 32,
		spacingY = 10 * _1080p,
		controllerIndex = arg_1_1
	})

	if CONDITIONS.IsSplitscreen(arg_1_0) then
		var_1_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 255 * _1080p)
	else
		var_1_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 680 * _1080p)
	end

	var_1_0.id = "buttonListId"

	var_1_0:setUseStencil(true)

	function var_1_0.dispatchEventToChildren(arg_2_0, arg_2_1)
		if arg_2_1.name == "HDR_state_change" or arg_2_1.name == "refresh" then
			for iter_2_0 = 0, var_1_0:GetNumRows() - 1 do
				local var_2_0 = var_1_0:GetElementAtPosition(0, iter_2_0)

				if var_2_0.type == "Expander" then
					var_2_0:processEvent(arg_2_1)

					local var_2_1 = var_2_0.ChildrenContainer:getFirstChild()

					while var_2_1 do
						var_2_1:processEvent(arg_2_1)

						var_2_1 = var_2_1:getNextSibling()
					end
				else
					var_2_0:processEvent(arg_2_1)
				end
			end
		else
			local var_2_2 = arg_2_0:getFirstChild()

			while var_2_2 do
				local var_2_3 = var_2_2:getNextSibling()
				local var_2_4 = var_2_2:processEvent(arg_2_1)

				if var_2_4 then
					return var_2_4
				end

				var_2_2 = var_2_3
			end
		end
	end

	arg_1_0:addElement(var_1_0)

	arg_1_0.buttonList = var_1_0

	arg_1_0.buttonList:SetActiveParentBehavior()

	local var_1_1
	local var_1_2 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_1_1
	})

	var_1_2.id = "buttonListVScrollbar"

	local var_1_3, var_1_4, var_1_5, var_1_6 = arg_1_0.buttonList:getLocalRect()

	var_1_2:SetAnchorsAndPosition(0, 1, 0, 1, var_1_5 + 797 * _1080p, var_1_5 + 853 * _1080p, var_1_4, var_1_6)
	arg_1_0:addElement(var_1_2)

	arg_1_0.buttonListVScrollbar = var_1_2

	local var_1_7 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_1_2,
		startCap = var_1_2.startCap,
		endCap = var_1_2.endCap,
		sliderArea = var_1_2.sliderArea,
		slider = var_1_2.sliderArea and var_1_2.sliderArea.slider,
		fixedSizeSlider = var_1_2.sliderArea and var_1_2.sliderArea.fixedSizeSlider,
		mouseWheelTarget = arg_1_0.buttonList
	})

	arg_1_0.buttonList:AddScrollbar(var_1_7)
	var_1_7:UpdateSliderAreaVertical(false)
	var_1_7:SetKBMStyle(true)
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0, var_3_1 = arg_3_0.buttonList:GetChildPosition(arg_3_1)

	return var_3_1
end

local function var_0_2(arg_4_0, arg_4_1)
	if arg_4_0.options and #arg_4_0.options > 0 then
		if type(arg_4_0.options[1]) == "userdata" then
			var_0_0(arg_4_0, arg_4_1)
		end

		arg_4_0.options = {}
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
	assert(arg_5_2)

	if arg_5_0.currCategory == arg_5_4 and arg_5_4 ~= nil then
		return
	end

	local var_5_0 = 0

	arg_5_0:ClearCurrentOptions(arg_5_1)

	arg_5_0.options = arg_5_2(arg_5_0, arg_5_1, arg_5_3)

	local var_5_1
	local var_5_2 = arg_5_5 ~= nil

	if arg_5_0.options and #arg_5_0.options > 0 and type(arg_5_0.options[1]) == "userdata" then
		for iter_5_0 = 1, #arg_5_0.options do
			local var_5_3 = arg_5_0.options[iter_5_0]

			var_5_3.index = iter_5_0

			if not var_5_3.OptionSubcategory then
				if not arg_5_5 or iter_5_0 == arg_5_5 then
					arg_5_5 = iter_5_0
					var_5_1 = var_5_3
				end

				var_5_3:addEventHandler("button_over", function(arg_6_0, arg_6_1)
					arg_5_0:processEvent({
						name = "optionwindow_button_over"
					})
				end)
				var_5_3:addEventHandler("button_over_disable", function(arg_7_0, arg_7_1)
					arg_5_0:processEvent({
						name = "optionwindow_button_over"
					})
				end)
			end

			arg_5_0.buttonList:AddElement(var_5_3)
		end
	end

	if var_5_1 then
		if var_5_1._innerWidget then
			local var_5_4 = var_5_1._innerWidget
		end

		if var_5_2 then
			arg_5_0:Wait(1).onComplete = function()
				arg_5_0.buttonList:SetFocusedPosition({
					x = 0,
					y = arg_5_5 - 1
				}, true, true, true, false)
			end
		end
	end

	arg_5_0.currCategory = arg_5_4
end

local function var_0_4(arg_9_0, arg_9_1)
	if arg_9_0.options and #arg_9_0.options > 0 then
		for iter_9_0 = 1, #arg_9_0.options do
			if arg_9_1 then
				arg_9_0.options[iter_9_0]:SetAlpha(0.6)
			else
				arg_9_0.options[iter_9_0]:SetAlpha(1)
			end
		end

		arg_9_0.isFaded = arg_9_1
	end
end

function PostLoadFunc(arg_10_0, arg_10_1, arg_10_2)
	var_0_0(arg_10_0, arg_10_1)

	arg_10_0.ClearCurrentOptions = var_0_2
	arg_10_0.UpdateOptions = var_0_3
	arg_10_0.FadeOptions = var_0_4
	arg_10_0.GetChildIndexInGrid = var_0_1
	arg_10_0.options = {}
end

function OptionWindow(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 800 * _1080p)

	var_11_0.id = "OptionWindow"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0

	PostLoadFunc(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("OptionWindow", OptionWindow)
LockTable(_M)
