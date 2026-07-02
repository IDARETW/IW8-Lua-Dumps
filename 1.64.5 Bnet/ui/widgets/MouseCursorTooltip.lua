module(..., package.seeall)

local var_0_0 = 15.5
local var_0_1 = 26
local var_0_2 = 5
local var_0_3 = 0
local var_0_4 = 12

local function var_0_5(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = Engine.DBFFAEEFGJ()
	local var_1_1, var_1_2 = ProjectRootCoordinate(var_1_0.name, arg_1_1, arg_1_2)

	if arg_1_3:IsPositionInside(var_1_1, var_1_2) then
		return true
	end

	return false
end

local function var_0_6(arg_2_0)
	local var_2_0 = arg_2_0:getFirstChild()
	local var_2_1 = 0

	while var_2_0 ~= nil do
		if not var_2_0._ignoreLayout then
			local var_2_2, var_2_3, var_2_4, var_2_5 = var_2_0:getLocalRect()

			var_2_1 = var_2_1 + (var_2_5 - var_2_3)
		end

		var_2_0 = var_2_0:getNextSibling()
	end

	return var_2_1
end

local function var_0_7(arg_3_0)
	local var_3_0 = arg_3_0:getFirstChild()
	local var_3_1 = 0

	while var_3_0 do
		if not var_3_0._ignoreLayout then
			local var_3_2, var_3_3, var_3_4, var_3_5 = var_3_0:getLocalRect()
			local var_3_6 = var_3_4 - var_3_2

			if var_3_6 ~= 0 then
				var_3_1 = math.max(var_3_1, var_3_6)
			else
				var_3_1 = arg_3_0._defaultWidth
			end
		end

		var_3_0 = var_3_0:getNextSibling()
	end

	return var_3_1
end

local function var_0_8(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = arg_4_2 + var_0_0
	local var_4_1 = arg_4_3 + var_0_1

	if arg_4_0._initialHorizontalAlignment == "left" then
		var_4_0 = arg_4_2 - (var_0_2 + arg_4_0._tooltipWidth)
	else
		local var_4_2 = var_4_0 + arg_4_0._tooltipWidth

		var_4_0 = var_4_0 - LAYOUT.GetHorizontalOutOfScreenOffset(arg_4_1, var_4_2)
	end

	local var_4_3 = var_4_1 + arg_4_0._tooltipHeight

	if arg_4_0._initialVerticalAlignment == "top" then
		var_4_3 = arg_4_3 - var_0_3
		var_4_1 = var_4_3 - arg_4_0._tooltipHeight
	end

	local var_4_4 = 0.95
	local var_4_5 = var_4_1 - LAYOUT.GetVerticalOutOfScreenOffset(arg_4_1, var_4_3, var_4_4) - var_0_4

	return var_4_0, var_4_5
end

local function var_0_9(arg_5_0, arg_5_1)
	if arg_5_1 and arg_5_1 ~= "" then
		arg_5_0.Title:SetTitleAndScaleBacking(arg_5_1)
		arg_5_0.Title:SetAlpha(1)

		arg_5_0.Title._ignoreLayout = false
		arg_5_0._hasTitle = true
	else
		arg_5_0.Title:SetAlpha(0)

		arg_5_0.Title._ignoreLayout = true
		arg_5_0._hasTitle = false
	end
end

local function var_0_10(arg_6_0, arg_6_1)
	if arg_6_1 and arg_6_1 ~= "" then
		arg_6_0.Description:SetDescriptionAndUpdateHeight(arg_6_1, arg_6_0._hasTitle)
		arg_6_0.Description:SetAlpha(1)

		arg_6_0.Description._ignoreLayout = false
		arg_6_0._hasDescription = true
	else
		arg_6_0.Description:SetAlpha(0)

		arg_6_0.Description._ignoreLayout = true
		arg_6_0._hasDescription = false
	end
end

local function var_0_11(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.ButtonHelper.ButtonHelperTextTooltip:TryRemoveAllButtonPrompts()

	local var_7_0 = false

	if arg_7_1 then
		for iter_7_0, iter_7_1 in pairs(arg_7_1) do
			if iter_7_1.disabledFunction == nil or not iter_7_1.disabledFunction(iter_7_1.disabledFunctionParams) then
				arg_7_0.ButtonHelper.ButtonHelperTextTooltip._controllerIndex = arg_7_2

				arg_7_0.ButtonHelper.ButtonHelperTextTooltip:PushTooltipButtonPrompt(iter_7_1)

				var_7_0 = true
			end
		end

		if var_7_0 then
			arg_7_0.ButtonHelper:SetAlpha(1)

			arg_7_0.ButtonHelper._ignoreLayout = false
			arg_7_0._hasPrompts = true

			local var_7_1 = 0
			local var_7_2 = arg_7_0.ButtonHelper.ButtonHelperTextTooltip:GetTooltipPromptsTotalWidth()

			if not arg_7_0._hasTitle and not arg_7_0._hasDescription or var_7_2 > arg_7_0._defaultWidth then
				var_7_1 = var_7_2
			else
				var_7_1 = arg_7_0._defaultWidth or 0
			end

			arg_7_0.ButtonHelper:SetRight(var_7_1, 0)
		end
	end

	if not var_7_0 then
		arg_7_0.ButtonHelper:SetAlpha(0)

		arg_7_0.ButtonHelper._ignoreLayout = true
		arg_7_0._hasPrompts = false
	end
end

local function var_0_12(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.MouseInsideTooltipFocusedElement = var_0_5
	arg_8_0.SetTitle = var_0_9
	arg_8_0.SetDescription = var_0_10
	arg_8_0.GetInitialAlignment = GetInitialAlignment
	arg_8_0.SetKeyPrompts = var_0_11
	arg_8_0.ComputeTotalWidthToMaxChildrenWidth = var_0_7
	arg_8_0.ComputeTotalHeightToChildrenHeight = var_0_6
	arg_8_0.ComputeTooltipPosition = var_0_8
end

function MouseCursorTooltip(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalStackedLayout.new()

	var_9_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -175 * _1080p, 175 * _1080p, -115 * _1080p, 115 * _1080p)

	var_9_0.id = "MouseCursorTooltip"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("MouseCursorTooltipTitle", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "Title"

	var_9_4:SetAlpha(0, 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 60)
	var_9_0:addElement(var_9_4)

	var_9_0.Title = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("MouseCursorTooltipDescription", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "Description"

	var_9_6:SetAlpha(0, 0)
	var_9_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 60, _1080p * 200)
	var_9_0:addElement(var_9_6)

	var_9_0.Description = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBarTooltip", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "ButtonHelper"

	var_9_8:SetAlpha(0, 0)
	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, _1080p * 200, _1080p * 230)
	var_9_0:addElement(var_9_8)

	var_9_0.ButtonHelper = var_9_8

	var_0_12(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("MouseCursorTooltip", MouseCursorTooltip)
LockTable(_M)
