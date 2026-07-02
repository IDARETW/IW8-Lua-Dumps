module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(type(arg_1_2) == "table")
	assert(arg_1_1 > 0 and arg_1_1 <= #arg_1_0._nodes)
	arg_1_0._nodes[arg_1_1]:SetData(arg_1_2)
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(type(arg_2_1) == "table")
	assert(#arg_2_0._nodes == #arg_2_1)

	for iter_2_0 = 1, #arg_2_0._nodes do
		local var_2_0 = arg_2_1[iter_2_0]

		assert(type(var_2_0) == "table")
		arg_2_0._nodes[iter_2_0]:SetData(var_2_0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = #arg_3_0._nodes

	assert(var_3_0 > 0)

	local var_3_1 = math.floor(var_3_0 * arg_3_1)
	local var_3_2 = (var_3_1 + 1) * arg_3_0._spacingProgressDist + var_3_1 * arg_3_0._nodeProgressDist
	local var_3_3 = var_3_2 + arg_3_0._nodeProgressDist
	local var_3_4 = arg_3_0._spacingProgressDist + arg_3_0._nodeProgressDist
	local var_3_5 = var_3_2 - var_3_4
	local var_3_6 = var_3_3 - var_3_4
	local var_3_7 = LUI.Round(var_3_5, 4)
	local var_3_8 = LUI.Round(var_3_6, 4)

	if var_3_7 <= arg_3_1 and arg_3_1 <= var_3_8 then
		arg_3_1 = var_3_8
	else
		local var_3_9 = 1 - (var_3_3 - arg_3_1) / var_3_4

		arg_3_1 = var_3_8 + arg_3_0._spacingProgressDist * var_3_9
	end

	return arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = #arg_4_0._nodes
	local var_4_1 = math.floor(var_4_0 * arg_4_1)

	for iter_4_0 = 1, #arg_4_0._nodes do
		arg_4_0._nodes[iter_4_0]:OnProgressUpdate(iter_4_0, var_4_1)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_1 = var_0_2(arg_5_0, arg_5_1)
	arg_5_1 = LUI.clamp(arg_5_1, 0, 1)

	var_0_3(arg_5_0, arg_5_1)

	if arg_5_0._direction == LUI.DIRECTION.horizontal then
		arg_5_0._progressBar.Fill:SetRightAnchor(1 - arg_5_1, 0)
	else
		arg_5_0._progressBar.Fill:SetBottomAnchor(1 - arg_5_1, 0)
	end
end

local function var_0_5(arg_6_0)
	return #arg_6_0._nodes
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0._progressBar.Fill:SetRGBFromTable(arg_7_1)
	arg_7_0._progressBar.Overlay:SetRGBFromTable(arg_7_2)
	arg_7_0._progressBar.Overlay:SetAlpha(arg_7_3 and arg_7_3 or 1)
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = MenuBuilder.BuildRegisteredType(arg_8_2.buildChild, {
		controllerIndex = arg_8_1
	})

	assert(var_8_0.OnProgressUpdate)
	assert(var_8_0.SetData)
	arg_8_0._nodeList:addElement(var_8_0)
	table.insert(arg_8_0._nodes, var_8_0)
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0 = 1, arg_9_2.numNodes do
		var_0_7(arg_9_0, arg_9_1, arg_9_2)
	end
end

local function var_0_9(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._progressBar = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = arg_10_1
	})

	arg_10_0._progressBar.Fill:SetRGBFromTable(SWATCHES.highlight.frontEnd)

	local var_10_0 = #arg_10_0._nodes

	assert(var_10_0 > 0)

	local var_10_1, var_10_2, var_10_3, var_10_4 = arg_10_0._nodes[#arg_10_0._nodes]:getLocalRect()
	local var_10_5 = var_10_3 - var_10_1
	local var_10_6 = var_10_4 - var_10_2
	local var_10_7 = arg_10_2.progressBarThickness * _1080p * 0.5
	local var_10_8 = arg_10_0._spacing * _1080p

	if arg_10_2.direction == LUI.DIRECTION.horizontal then
		local var_10_9 = var_10_6 * 0.5
		local var_10_10 = var_10_0 * var_10_5 + var_10_8 * (var_10_0 - 1)

		arg_10_0._progressBar:SetAnchorsAndPosition(0, 1, 0, 1, -var_10_8, var_10_10, var_10_9 - var_10_7, var_10_9 + var_10_7)
	else
		local var_10_11 = var_10_6 * 0.5
		local var_10_12 = var_10_0 * var_10_6 + var_10_8 * (var_10_0 - 1)

		arg_10_0._progressBar:SetAnchorsAndPosition(0, 1, 0, 1, var_10_11 - var_10_7, var_10_11 + var_10_7, -var_10_8, var_10_12)
	end

	local var_10_13, var_10_14, var_10_15, var_10_16 = arg_10_0._progressBar:getLocalRect()
	local var_10_17

	if arg_10_2.direction == LUI.DIRECTION.horizontal then
		var_10_17 = var_10_15 - var_10_13
		arg_10_0._nodeProgressDist = var_10_5 / var_10_17
	else
		var_10_17 = var_10_16 - var_10_14
		arg_10_0._nodeProgressDist = var_10_6 / var_10_17
	end

	arg_10_0._spacingProgressDist = var_10_8 / var_10_17
	arg_10_0._nodeProgressDist = LUI.Round(arg_10_0._nodeProgressDist, 4)
	arg_10_0._spacingProgressDist = LUI.Round(arg_10_0._spacingProgressDist, 4)

	arg_10_0:addElement(arg_10_0._progressBar)
end

function ImageProgressBar(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)

	var_11_0.id = "ImageProgressBar"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.SetAllNodeData = var_0_1
	var_11_0.SetNodeDataAtIndex = var_0_0
	var_11_0.SetProgress = var_0_4
	var_11_0.GetNodeCount = var_0_5
	var_11_0.SetProgressColor = var_0_6

	assert(arg_11_1.buildChild)

	arg_11_1.direction = arg_11_1.direction or LUI.DIRECTION.horizontal
	arg_11_1.numNodes = arg_11_1.numNodes or 3
	arg_11_1.spacing = arg_11_1.spacing or 5
	arg_11_1.progressBarThickness = arg_11_1.progressBarThickness or 10

	if arg_11_1.direction == LUI.DIRECTION.horizontal then
		var_11_0._nodeList = LUI.UIHorizontalStackedLayout.new()
	else
		var_11_0._nodeList = LUI.UIVerticalStackedLayout.new()
	end

	var_11_0._direction = arg_11_1.direction
	var_11_0._spacing = arg_11_1.spacing

	var_11_0._nodeList:SetSpacing(var_11_0._spacing * _1080p)
	var_11_0._nodeList:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)

	var_11_0._nodes = {}

	var_0_8(var_11_0, var_11_1, arg_11_1)
	var_0_9(var_11_0, var_11_1, arg_11_1)
	var_0_4(var_11_0, 0)
	var_11_0:addElement(var_11_0._nodeList)

	return var_11_0
end

MenuBuilder.registerType("ImageProgressBar", ImageProgressBar)
LockTable(_M)
