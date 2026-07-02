GRID = GRID or {}

local var_0_0 = 0.3

function GRID.SkipScrollArrowGridColumn(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.controller

	if not (var_1_0 == arg_1_0._controllerIndex) or arg_1_0._isAnimating or arg_1_0.gridConfig.ignoreCondition then
		return
	end

	local var_1_1

	if not arg_1_0._isAnimating and not arg_1_0.gridConfig.ignoreCondition then
		local var_1_2

		if arg_1_1.doNavigateLeft then
			if LUI.IsLastInputMouseNavigation(var_1_0) then
				var_1_2 = (arg_1_0.Grid:GetBuiltChildren()[1]._column or 1) - arg_1_0.gridConfig.scrollStepsBack
			else
				var_1_2 = arg_1_0.Grid:GetFocusPositionIndex() - arg_1_0.gridConfig.numGridItemsShown
			end
		elseif LUI.IsLastInputMouseNavigation(var_1_0) then
			var_1_2 = (arg_1_0.Grid:GetBuiltChildren()[1]._column or 1) + arg_1_0.gridConfig.numGridItemsShown + arg_1_0.gridConfig.scrollStepsForward
		else
			var_1_2 = arg_1_0.Grid:GetFocusPositionIndex() + arg_1_0.gridConfig.numGridItemsShown
		end

		local var_1_3 = {
			y = 0,
			x = var_1_2
		}

		arg_1_0.Grid:SetFocusedPosition(var_1_3, false)

		if arg_1_0.gridConfig.bitsToSetOnScroll then
			assert(type(arg_1_0.gridConfig.bitsToSetOnScroll) == "table", "This a table of booleans to set true when a scroll request is made.")

			for iter_1_0, iter_1_1 in pairs(arg_1_0.gridConfig.bitsToSetOnScroll) do
				iter_1_1 = true
			end
		end
	end
end

function GRID.CheckDisableArrowNavigation(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.Grid:GetNumColumns() - 1
	local var_2_1 = arg_2_0.gridConfig.gamepadUI ~= nil

	if arg_2_0.Grid:ShouldDisplayNumbersAndArrows() and not arg_2_0.Grid.disableArrowNavigation then
		if arg_2_1.x == 0 then
			arg_2_0.gridConfig.kbmUI.leftArrow:SetButtonDisabled(true)

			if var_2_1 then
				arg_2_0.gridConfig.gamepadUI.leftPrompt:SetAlpha(var_0_0)
			end
		elseif arg_2_1.x == var_2_0 then
			arg_2_0.gridConfig.kbmUI.rightArrow:SetButtonDisabled(true)

			if var_2_1 then
				arg_2_0.gridConfig.gamepadUI.rightPrompt:SetAlpha(var_0_0)
			end
		else
			if arg_2_0.gridConfig.kbmUI.leftArrow:IsDisabled() then
				arg_2_0.gridConfig.kbmUI.leftArrow:SetButtonDisabled(false)

				if var_2_1 then
					arg_2_0.gridConfig.gamepadUI.leftPrompt:SetAlpha(1)
				end
			end

			if arg_2_0.gridConfig.kbmUI.rightArrow:IsDisabled() then
				arg_2_0.gridConfig.kbmUI.rightArrow:SetButtonDisabled(false)

				if var_2_1 then
					arg_2_0.gridConfig.gamepadUI.rightPrompt:SetAlpha(1)
				end
			end
		end
	end
end

function GRID.SetUpArrowScrolling(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_2 and type(arg_3_2) == "table", "You must specfiy a table of config options to properly configure the scrolling grid")
	assert(arg_3_2.kbmArrowUI.leftArrow, "Arrow Scrolling grid needs to have a left arrow for PC functionality")
	assert(arg_3_2.kbmArrowUI.rightArrow, "Arrow Scrolling grid needs to have a right arrow for PC functionality")

	local var_3_0 = arg_3_2.scrollStepsForward and arg_3_2.scrollStepsForward or arg_3_0.Grid:GetMaxVisibleColumns() / 2
	local var_3_1 = arg_3_2.numGridItemsShown and arg_3_2.numGridItemsShown or arg_3_0.Grid:GetMaxVisibleColumns()
	local var_3_2 = arg_3_2.scrollStepsBack and arg_3_2.scrollStepsBack or var_3_0
	local var_3_3 = arg_3_2.ignoreCondition
	local var_3_4 = arg_3_2.bitsToSetOnScroll

	arg_3_0.Grid:SetNewTargetOnFocusHandler(arg_3_0, GRID.CheckDisableArrowNavigation)

	if arg_3_2.doProcessItemClick then
		arg_3_0.Grid:SetGridItemClickHandler({
			scope = arg_3_0,
			processDisabledClick = arg_3_2.doProcessDisabledItemClick
		})
	end

	arg_3_0.bindButton = LUI.UIBindButton.new()
	arg_3_0.bindButton.id = "BindButton"

	arg_3_0:addElement(arg_3_0.bindButton)

	arg_3_0._controllerIndex = arg_3_1
	arg_3_0.Grid._showNumbersAndArrowsKBM = true
	arg_3_0.gridConfig = {
		onUpdateInputType = arg_3_2.onUpdateInputType,
		numGridItemsShown = var_3_1,
		scrollStepsForward = var_3_0,
		scrollStepsBack = var_3_2,
		ignoreCondition = var_3_3,
		bitsToSetOnScroll = var_3_4,
		kbmUI = arg_3_2.kbmArrowUI,
		gamepadUI = arg_3_2.gamePadArrowUI
	}

	if arg_3_2.bindButtonInput then
		assert(type(arg_3_2.bindButtonInput) == "table", "bindButtonAltInput needs to be a table of event strings (keys) and handlers (values).")

		for iter_3_0, iter_3_1 in pairs(arg_3_2.bindButtonInput) do
			arg_3_0.bindButton:addEventHandler(iter_3_0, function(arg_4_0, arg_4_1)
				if iter_3_1 then
					iter_3_1(arg_3_0, arg_4_1)
				end
			end)
		end
	end

	if arg_3_0.Grid:ShouldDisplayNumbersAndArrows() then
		arg_3_0.gridConfig.kbmUI.leftArrow:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			arg_5_1.doNavigateLeft = true

			GRID.SkipScrollArrowGridColumn(arg_3_0, arg_5_1)
		end)
		arg_3_0.gridConfig.kbmUI.rightArrow:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			GRID.SkipScrollArrowGridColumn(arg_3_0, arg_6_1)
		end)

		if arg_3_0.gridConfig.gamepadUI then
			arg_3_0.bindButton:addEventHandler("button_left_trigger", function(arg_7_0, arg_7_1)
				arg_7_1.doNavigateLeft = true

				GRID.SkipScrollArrowGridColumn(arg_3_0, arg_7_1)
			end)
			arg_3_0.bindButton:addEventHandler("button_right_trigger", function(arg_8_0, arg_8_1)
				GRID.SkipScrollArrowGridColumn(arg_3_0, arg_8_1)
			end)
		end
	end

	local function var_3_5(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_0.gridConfig.gamepadUI ~= nil
		local var_9_1 = LUI.IsLastInputKeyboardMouse(arg_9_1.controllerIndex) and 1 or 0
		local var_9_2 = var_9_1 == 1 and 0 or 1

		if not arg_9_0._isAnimating then
			if arg_9_0.gridConfig.onUpdateInputType then
				arg_9_0.gridConfig.onUpdateInputType(arg_9_0, true)
			end

			arg_9_0.Grid:GainFocus(arg_9_1)
		end

		if arg_9_0.Grid:ShouldDisplayNumbersAndArrows() then
			for iter_9_0, iter_9_1 in pairs(arg_9_0.gridConfig.kbmUI) do
				if var_9_0 then
					iter_9_1:SetAlpha(var_9_1)
				end
			end

			if var_9_0 then
				for iter_9_2, iter_9_3 in pairs(arg_9_0.gridConfig.gamepadUI) do
					iter_9_3:SetAlpha(var_9_2)
				end
			end
		end
	end

	arg_3_0:registerAndCallEventHandler("update_input_type", var_3_5, {
		controllerIndex = arg_3_1
	})
end
