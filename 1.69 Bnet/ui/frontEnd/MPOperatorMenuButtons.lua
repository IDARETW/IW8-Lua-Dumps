module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetVerticalAlignment(LUI.Alignment.Bottom)
end

function MPOperatorMenuButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalList.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 136 * _1080p)

	var_2_0.id = "MPOperatorMenuButtons"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(8 * _1080p)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "OperatorSelectButton"

	var_2_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECT"), 0)
	var_2_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECT_DESC"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 460, 0, _1080p * 40)
	var_2_0:addElement(var_2_4)

	var_2_0.OperatorSelectButton = var_2_4

	var_2_4:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.controller or var_2_1

		ACTIONS.OpenMenu("OperatorSelect", true, var_3_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("MPOperatorMenuButtons", MPOperatorMenuButtons)
LockTable(_M)
