module(..., package.seeall)

local var_0_0 = 10

local function var_0_1(arg_1_0)
	if arg_1_0._pips then
		for iter_1_0, iter_1_1 in pairs(arg_1_0._pips) do
			iter_1_1:closeTree()
		end
	end

	arg_1_0._pips = nil
end

local function var_0_2(arg_2_0, arg_2_1)
	if arg_2_0._pips and arg_2_1 <= #arg_2_0._pips then
		for iter_2_0 = 1, #arg_2_0._pips do
			if iter_2_0 == arg_2_1 then
				if CONDITIONS.IsMagmaGameMode() then
					ACTIONS.AnimateSequence(arg_2_0._pips[iter_2_0], "WZHighlighted")
				else
					ACTIONS.AnimateSequence(arg_2_0._pips[iter_2_0], "Highlighted")
				end
			else
				ACTIONS.AnimateSequence(arg_2_0._pips[iter_2_0], "NotHighlighted")
			end
		end
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	var_0_1(arg_3_0)

	if not arg_3_3 then
		return
	end

	arg_3_0._pips = {}

	for iter_3_0 = 1, arg_3_2 do
		local var_3_0 = LUI.UIButton.new()

		var_3_0.id = "PipButton" .. iter_3_0

		var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, arg_3_0._pipWidth, 0, arg_3_0._pipHeight)
		var_3_0:registerEventHandler("leftmouseup", function(arg_4_0, arg_4_1)
			arg_3_0:dispatchEventToParent({
				name = "navigate_with_pip",
				index = iter_3_0
			})
		end)

		local var_3_1 = MenuBuilder.BuildRegisteredType("Pip", {
			controllerIndex = arg_3_1
		})

		var_3_1.id = "Pip" .. iter_3_0

		var_3_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, arg_3_0._pipWidth, 0, arg_3_0._pipHeight)
		var_3_1:addElement(var_3_0)
		arg_3_0._pipContainer:addElement(var_3_1)
		table.insert(arg_3_0._pips, var_3_1)
	end

	arg_3_0._pipContainer:SetAlignment(LUI.Alignment.Center)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.Setup = var_0_3
	arg_5_0.SetSelected = SetSelected
	arg_5_0.SetActive = var_0_2
	arg_5_0._isActive = 1

	local var_5_0, var_5_1, var_5_2, var_5_3 = arg_5_0:getLocalRect()

	arg_5_0._pipContainer = LUI.UIHorizontalStackedLayout.new()
	arg_5_0._pipContainer.id = "PipContainer"

	arg_5_0._pipContainer:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_5_0._pipContainer:SetSpacing(var_0_0 * _1080p)
	arg_5_0:addElement(arg_5_0._pipContainer)

	arg_5_0._pipWidth = var_5_2 - var_5_0
	arg_5_0._pipHeight = var_5_3 - var_5_1
	arg_5_0._spacing = arg_5_0:GetSpacing()
	arg_5_0._pips = {}
end

function UnlocksMenuPips(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 21 * _1080p, 0, 7 * _1080p)

	var_6_0.id = "UnlocksMenuPips"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("UnlocksMenuPips", UnlocksMenuPips)
LockTable(_M)
