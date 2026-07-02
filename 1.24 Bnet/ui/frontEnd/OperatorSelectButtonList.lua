module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.operatorButtons
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = #arg_2_0.operatorButtons
	local var_2_1 = MenuBuilder.BuildRegisteredType("OperatorSelectButton", {
		controllerIndex = arg_2_1
	})
	local var_2_2 = var_2_0 * arg_2_0.spacing

	var_2_1:SetAnchorsAndPosition(0, 1, 0, 1, var_2_2 + _1080p * var_2_0 * 74, var_2_2 + _1080p * (var_2_0 + 1) * 74, _1080p * 0, _1080p * 146)
	arg_2_0:addElement(var_2_1)
	table.insert(arg_2_0.operatorButtons, var_2_1)

	return var_2_1
end

local function var_0_2(arg_3_0)
	local var_3_0 = #arg_3_0.operatorButtons

	for iter_3_0 = 1, var_3_0 do
		arg_3_0.operatorButtons[iter_3_0]:closeTree()

		arg_3_0.operatorButtons[iter_3_0] = nil
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:SetNoWrap(true)

	arg_4_0.GetOperatorButtons = var_0_0
	arg_4_0.AddButtonToList = var_0_1
	arg_4_0.RemoveAllButtonsFromList = var_0_2
	arg_4_0.spacing = 6 * _1080p

	arg_4_0:SetSpacing(arg_4_0.spacing)

	arg_4_0.operatorButtons = {}
end

function OperatorSelectButtonList(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIHorizontalList.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 234 * _1080p, 0, 140 * _1080p)

	var_5_0.id = "OperatorSelectButtonList"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("OperatorSelectButtonList", OperatorSelectButtonList)
LockTable(_M)
