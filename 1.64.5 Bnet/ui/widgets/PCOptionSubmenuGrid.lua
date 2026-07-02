module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.optionsGrid:SetNumRowsInC(arg_1_1)
	arg_1_0.optionsGrid:RefreshContent()
	assert(arg_1_0.optionsGridMaxVisibleRows)
	assert(arg_1_0.optionsGridRowHeight)
	assert(arg_1_0.optionsGridSpacing)
	assert(arg_1_0.scrollbarWidth)

	local var_1_0 = math.min(arg_1_1, arg_1_0.optionsGridMaxVisibleRows)
	local var_1_1 = arg_1_0.optionsGridRowHeight + arg_1_0.optionsGridSpacing
	local var_1_2 = math.max(var_1_1 * var_1_0, 0)

	if arg_1_1 <= arg_1_0.optionsGridMaxVisibleRows then
		arg_1_0.optionsGrid:SetLeft(0)
		arg_1_0.scrollbar:processEvent({
			name = "scrollbar_all_visible"
		})
	else
		arg_1_0.optionsGrid:SetLeft(arg_1_0.scrollbarWidth)
		arg_1_0.scrollbar:processEvent({
			name = "scrollbar_not_all_visible"
		})
	end

	arg_1_0.optionsGrid:SetBottom(var_1_2)
	arg_1_0.scrollbar:SetBottom(var_1_2)
	arg_1_0:SetBottom(var_1_2)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.options = arg_2_1 and arg_2_1 or {}

	var_0_0(arg_2_0, #arg_2_0.options)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.optionsGridMaxVisibleRows = 15
	arg_3_0.optionsGridButtonWidth = _1080p * 600
	arg_3_0.optionsGridRowHeight = _1080p * 30
	arg_3_0.optionsGridSpacing = _1080p * 7
	arg_3_0.scrollbarWidth = _1080p * 20

	local var_3_0
	local var_3_1 = {
		scrollingThresholdX = 1,
		numRows = 0,
		wrapX = false,
		maxVelocity = 5000,
		scrollingThresholdY = 1,
		maxVisibleColumns = 1,
		wrapY = true,
		numColumns = 1,
		springCoefficient = 400,
		maxVisibleRows = arg_3_0.optionsGridMaxVisibleRows,
		controllerIndex = arg_3_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = arg_3_1
			})
		end,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
			if arg_3_0.options and arg_5_2 < #arg_3_0.options then
				local var_5_0 = arg_3_0.options[arg_5_2 + 1]

				assert(var_5_0.id)
				assert(var_5_0.text)
				assert(var_5_0.desc)
				assert(var_5_0.actionFunc)

				arg_5_0.id = var_5_0.id

				arg_5_0.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(var_5_0.text)))

				arg_5_0.buttonDescription = Engine.CBBHFCGDIC(var_5_0.desc)

				arg_5_0:registerEventHandler("button_action", var_5_0.actionFunc)
				arg_5_0:SetRight(arg_3_0.optionsGridButtonWidth, 0)
			end
		end,
		spacingX = arg_3_0.optionsGridSpacing,
		spacingY = arg_3_0.optionsGridSpacing,
		columnWidth = _1080p * 800,
		rowHeight = arg_3_0.optionsGridRowHeight,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_3_2 = LUI.UIGrid.new(var_3_1)

	var_3_2.id = "PCOptionSubmenuGridOptionsGrid"

	var_3_2:setUseStencil(true)
	var_3_2:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 0)
	arg_3_0:addElement(var_3_2)

	arg_3_0.optionsGrid = var_3_2

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_3_1
	})

	var_3_4.id = "PCOptionSubmenuGridScrollbar"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, arg_3_0.scrollbarWidth / 2, 0, 0)
	arg_3_0:addElement(var_3_4)

	arg_3_0.scrollbar = var_3_4

	local var_3_5 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_3_4,
		startCap = var_3_4.startCap,
		endCap = var_3_4.endCap,
		sliderArea = var_3_4.sliderArea,
		slider = var_3_4.sliderArea and var_3_4.sliderArea.slider,
		fixedSizeSlider = var_3_4.sliderArea and var_3_4.sliderArea.fixedSizeSlider
	})

	var_3_2:AddScrollbar(var_3_5)

	arg_3_0.UpdateOptions = var_0_1
end

function PCOptionSubmenuGrid(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 738 * _1080p, 0, 204 * _1080p)

	var_6_0.id = "PCOptionSubmenuGrid"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("PCOptionSubmenuGrid", PCOptionSubmenuGrid)
LockTable(_M)
