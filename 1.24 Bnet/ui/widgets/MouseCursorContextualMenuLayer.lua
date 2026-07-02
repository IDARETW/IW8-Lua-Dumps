LUI.MouseCursorContextualMenuLayer = LUI.Class(LUI.UIElement)

local var_0_0 = 250
local var_0_1 = 400
local var_0_2 = 1
local var_0_3 = 1
local var_0_4 = 16

function LUI.MouseCursorContextualMenuLayer.IsOpened(arg_1_0)
	return arg_1_0.contextualMenuContainer
end

local function var_0_5(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("MouseCursorContextualMenu", {
		controllerIndex = arg_2_0._controllerIndex
	})

	var_2_0.id = "MouseCursorContextualMenu"

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, var_0_0 * _1080p, _1080p * 0, var_0_1 * _1080p)
	arg_2_0:addElement(var_2_0)

	arg_2_0.contextualMenuContainer = var_2_0

	LUI.MouseCursorTooltipLayer:ForceCloseTooltip(arg_2_1)
	Engine.HJJJIGAC(arg_2_1)
end

local function var_0_6(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.contextualMenuContainer:closeTree()

	arg_3_0.contextualMenuContainer = nil

	Engine.HJJJIGAC(arg_3_1)
	METRICS.ContextualMenuDLogRecording(arg_3_1, arg_3_2)
end

local function var_0_7(arg_4_0, arg_4_1)
	local var_4_0, var_4_1 = ProjectRootCoordinate(arg_4_1.rootName, arg_4_1.x, arg_4_1.y)

	if var_4_0 ~= nil and var_4_1 ~= nil then
		local var_4_2 = arg_4_1.root
		local var_4_3, var_4_4 = var_4_2:PixelsToUnits(var_4_0, var_4_1)
		local var_4_5 = var_4_3 + arg_4_0._finalWidth
		local var_4_6 = var_4_4 + arg_4_0._finalHeight
		local var_4_7 = 0.95
		local var_4_8 = 2
		local var_4_9 = LAYOUT.GetHorizontalOutOfScreenOffset(var_4_2, var_4_5)
		local var_4_10 = LAYOUT.GetVerticalOutOfScreenOffset(var_4_2, var_4_6)

		if var_4_9 > 0 then
			var_4_9 = (var_4_9 + var_4_8) * -1
		else
			var_4_9 = var_0_2
		end

		if var_4_10 > 0 then
			var_4_10 = var_4_10 * -1
		else
			var_4_10 = var_0_3
		end

		local var_4_11 = var_4_3 + var_4_9
		local var_4_12 = var_4_4 + var_4_10

		arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, var_4_11, var_4_11, var_4_12, var_4_12)
	end
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0
	local var_5_1 = arg_5_2.conditionFunction
	local var_5_2 = arg_5_2.conditionParams

	if var_5_1 == nil or var_5_1(var_5_2, arg_5_1) then
		var_5_0 = MenuBuilder.BuildRegisteredType("MouseCursorContextualMenuAction", {
			controllerIndex = arg_5_1
		})

		assert(var_5_0.ActionName)
		assert(arg_5_2.actionName)
		var_5_0.ActionName:setText(arg_5_2.actionName)
		var_5_0.ActionName:SetLeft(var_0_4 * _1080p)
		var_5_0.ActionName:SetAlignment(LUI.Alignment.Left)

		local var_5_3 = arg_5_2.actionFunction
		local var_5_4 = arg_5_2.actionParams

		var_5_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			if var_5_1 == nil or var_5_1(var_5_2, arg_6_1.controller) then
				var_5_3(var_5_4)

				if arg_5_0:IsOpened() then
					var_0_6(arg_5_0, arg_6_1.controller, arg_5_2.id)
				end
			end
		end)

		local var_5_5 = LAYOUT.GetTextWidth(var_5_0.ActionName) + arg_5_0._buttonTotalPadding

		arg_5_0._finalWidth = math.max(var_5_5, arg_5_0._finalWidth)
	end

	return var_5_0
end

local function var_0_9(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0

	if not (arg_7_2 == 0 or arg_7_2 == arg_7_3) then
		var_7_0 = MenuBuilder.BuildRegisteredType("MouseCursorContextualMenuSeparator", {
			controllerIndex = arg_7_1
		})
	end

	return var_7_0
end

local function var_0_10(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = LUI.UIVerticalList.new({
		adjustSizeToContent = true,
		verticalAlignment = LUI.Alignment.Top
	})

	var_8_0:SetTop(arg_8_0._titleHeight)
	arg_8_0.contextualMenuContainer:addElement(var_8_0)

	local var_8_1 = 0
	local var_8_2 = 0
	local var_8_3 = arg_8_0:CountValidContextualDataConditions(arg_8_1, arg_8_2)

	for iter_8_0, iter_8_1 in ipairs(arg_8_2) do
		local var_8_4

		if iter_8_1.isSeparator then
			var_8_4 = var_0_9(arg_8_0, arg_8_1, var_8_1, var_8_3)
		else
			var_8_4 = var_0_8(arg_8_0, arg_8_1, iter_8_1)
		end

		if var_8_4 then
			var_8_4.id = "ContextualButton" .. iter_8_0

			var_8_4:SetLeftAnchor(0)
			var_8_4:SetRightAnchor(0)
			var_8_4:SetLeft(0)
			var_8_4:SetRight(0)

			local var_8_5, var_8_6, var_8_7, var_8_8 = var_8_4:getLocalRect()

			var_8_2 = var_8_2 + (var_8_8 - var_8_6)

			var_8_0:addElement(var_8_4)

			if not iter_8_1.isSeparator then
				var_8_1 = var_8_1 + 1
			end
		end
	end

	arg_8_0._buttonListHeight = var_8_2
end

local function var_0_11(arg_9_0, arg_9_1)
	local var_9_0, var_9_1 = ProjectRootCoordinate(arg_9_1.rootName, arg_9_1.x, arg_9_1.y)

	if arg_9_0:IsPositionInside(var_9_0, var_9_1) then
		return true
	end

	return false
end

local function var_0_12(arg_10_0)
	arg_10_0._finalHeight = arg_10_0._titleHeight + arg_10_0._buttonListHeight

	arg_10_0.contextualMenuContainer:SetBottom(arg_10_0._finalHeight, 0)
end

local function var_0_13(arg_11_0)
	arg_11_0.contextualMenuContainer:SetRight(arg_11_0._finalWidth, 0)
end

local function var_0_14(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = MenuBuilder.BuildRegisteredType("MouseCursorContextualMenuTitle", {
		controllerIndex = arg_12_1
	})

	assert(var_12_0.Title)
	assert(var_12_0.Border)
	assert(var_12_0.BnetTitle or not Engine.CGABICJHAI())
	assert(var_12_0.BnetSubtitle or not Engine.CGABICJHAI())

	if arg_12_2 and arg_12_3 then
		ACTIONS.AnimateSequence(var_12_0, "GenericAndBnet")
	elseif arg_12_2 then
		ACTIONS.AnimateSequence(var_12_0, "GenericOnly")
	elseif arg_12_3 then
		ACTIONS.AnimateSequence(var_12_0, "BnetOnly")
	end

	local function var_12_1(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		if arg_13_3 then
			arg_13_2:setText(arg_13_3)

			local var_13_0, var_13_1, var_13_2, var_13_3 = arg_13_1:getLocalRect()
			local var_13_4, var_13_5, var_13_6, var_13_7 = arg_13_2:getLocalRect()
			local var_13_8 = LAYOUT.GetTextWidth(arg_13_2) + (var_13_4 - var_13_0) + (var_13_2 - var_13_6)

			arg_13_0._finalWidth = math.max(var_13_8, arg_13_0._finalWidth)
		else
			arg_13_1:RemoveElement(arg_13_2)
		end
	end

	var_12_1(arg_12_0, var_12_0, var_12_0.Title, arg_12_2)

	if Engine.CGABICJHAI() then
		var_12_1(arg_12_0, var_12_0, var_12_0.BnetTitle, arg_12_3 and arg_12_3.title)
		var_12_1(arg_12_0, var_12_0, var_12_0.BnetSubtitle, arg_12_3 and arg_12_3.subtitle)
	end

	local var_12_2, var_12_3, var_12_4, var_12_5 = var_12_0.Border:getLocalRect()

	arg_12_0._titleHeight = var_12_5 - var_12_3

	var_12_0:SetLeftAnchor(0)
	var_12_0:SetRightAnchor(0)
	var_12_0:SetLeft(0)
	var_12_0:SetRight(0)
	arg_12_0.contextualMenuContainer:addElement(var_12_0)
end

local function var_0_15(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_1.controller or Engine.IJEBHJIJF()
	local var_14_1 = arg_14_2.title
	local var_14_2 = arg_14_2.battlenetData
	local var_14_3 = arg_14_2.buttonsData

	arg_14_0._finalWidth = var_0_0 * _1080p
	arg_14_0._finalHeight = var_0_1 * _1080p

	assert(var_14_3)

	if arg_14_0:IsOpened() then
		var_0_6(arg_14_0, var_14_0)
	end

	var_0_5(arg_14_0, var_14_0)

	if var_14_1 or var_14_2 then
		var_0_14(arg_14_0, var_14_0, var_14_1, var_14_2)
	else
		arg_14_0._titleHeight = 0
	end

	var_0_10(arg_14_0, var_14_0, var_14_3)
	var_0_12(arg_14_0)
	var_0_13(arg_14_0)
	var_0_7(arg_14_0, arg_14_1)
end

local function var_0_16(arg_15_0)
	local var_15_0 = arg_15_0

	while var_15_0 do
		if var_15_0._contextualMenuData then
			return var_15_0._contextualMenuData, var_15_0
		end

		var_15_0 = var_15_0:getParent()
	end

	return nil
end

function LUI.MouseCursorContextualMenuLayer.AnyValidContextualDataConditions(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_3 or var_0_16(arg_16_1)
	local var_16_1 = var_16_0 and var_16_0.buttonsData

	return arg_16_0:CountValidContextualDataConditions(arg_16_2, var_16_1, true) > 0
end

function LUI.MouseCursorContextualMenuLayer.CountValidContextualDataConditions(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = 0

	if arg_17_2 then
		for iter_17_0, iter_17_1 in ipairs(arg_17_2) do
			if not iter_17_1.isSeparator then
				local var_17_1 = iter_17_1.conditionFunction
				local var_17_2 = iter_17_1.conditionParams

				if var_17_1 == nil or var_17_1(var_17_2, arg_17_1) then
					var_17_0 = var_17_0 + 1

					if arg_17_3 then
						return var_17_0
					end
				end
			end
		end
	end

	return var_17_0
end

function LUI.MouseCursorContextualMenuLayer.processEvent(arg_18_0, arg_18_1)
	if IsMouseInputEvent(arg_18_1.name) or arg_18_1.qualifier == ButtonQualifiers.Keyboard then
		return arg_18_0:ProcessKeyboardOrMouseEvent(arg_18_1)
	else
		return LUI.MouseCursorContextualMenuLayer.super.processEvent(arg_18_0, arg_18_1)
	end
end

function LUI.MouseCursorContextualMenuLayer.ProcessKeyboardOrMouseEvent(arg_19_0, arg_19_1)
	local var_19_0 = false

	if not arg_19_0:IsOpened() then
		if arg_19_1.button == "right" and arg_19_1.name == "mouseup" then
			local var_19_1 = arg_19_1.root and arg_19_1.root.focusStack

			if var_19_1 then
				local var_19_2, var_19_3 = var_0_16(var_19_1[#var_19_1])

				if var_19_3 and var_0_11(var_19_3, arg_19_1) and var_19_2 and arg_19_0:AnyValidContextualDataConditions(nil, arg_19_1.controller, var_19_2) then
					var_0_15(arg_19_0, arg_19_1, var_19_2)

					var_19_0 = true
				end
			end
		end
	elseif (arg_19_1.button == "left" or arg_19_1.button == "right") and arg_19_1.name == "mouseup" then
		if arg_19_0.contextualMenuContainer and not var_0_11(arg_19_0.contextualMenuContainer, arg_19_1) then
			var_0_6(arg_19_0, arg_19_1.controller)

			var_19_0 = false
		end
	elseif arg_19_1.button == "secondary" then
		var_0_6(arg_19_0, arg_19_1.controller)

		var_19_0 = true
	elseif arg_19_1.qualifier == ButtonQualifiers.Keyboard then
		LUI.MouseCursorContextualMenuLayer.super.processEvent(arg_19_0, arg_19_1)

		if arg_19_0.contextualMenuContainer then
			arg_19_0.contextualMenuContainer:processEvent({
				name = "gain_focus"
			})
		end

		var_19_0 = true
	end

	return var_19_0
end

function LUI.MouseCursorContextualMenuLayer.init(arg_20_0, arg_20_1)
	LUI.MouseCursorContextualMenuLayer.super.init(arg_20_0)

	arg_20_0.id = "MouseCursorContextualMenuLayer"

	assert(arg_20_1.controllerIndex)

	arg_20_0._controllerIndex = arg_20_1.controllerIndex
end

function LUI.MouseCursorContextualMenuLayer.InitLayer(arg_21_0)
	arg_21_0:registerEventHandler("update_input_type", function(arg_22_0, arg_22_1)
		if not LUI.IsLastInputKeyboardMouse(arg_22_1.controllerIndex) and arg_22_0:IsOpened() then
			var_0_6(arg_22_0, arg_22_1.controllerIndex)
		end
	end)

	arg_21_0._finalWidth = var_0_0 * _1080p
	arg_21_0._finalHeight = var_0_1 * _1080p
	arg_21_0._titleHeight = 0
	arg_21_0._buttonListHeight = 0
	arg_21_0._buttonTotalPadding = _1080p * var_0_4 * 2
end

function LUI.MouseCursorContextualMenuLayer.ClearLayer(arg_23_0)
	if arg_23_0:IsOpened() then
		arg_23_0.contextualMenuContainer:closeTree()

		arg_23_0.contextualMenuContainer = nil
	end
end

function LUI.MouseCursorContextualMenuLayer.GetLayer()
	return Engine.DBFFAEEFGJ().mouseCursorContextualMenuLayer
end

function LUI.MouseCursorContextualMenuLayer.ShouldBeVisible(arg_25_0)
	local var_25_0 = Engine.DBFFAEEFGJ()
	local var_25_1 = var_25_0.flowManager

	return var_25_0.cursor
end

function LUI.MouseCursorContextualMenuLayer.ForceCloseContextualMenu()
	local var_26_0 = LUI.MouseCursorContextualMenuLayer.GetLayer()

	if var_26_0:IsOpened() then
		var_26_0.contextualMenuContainer:closeTree()

		var_26_0.contextualMenuContainer = nil
	end
end
