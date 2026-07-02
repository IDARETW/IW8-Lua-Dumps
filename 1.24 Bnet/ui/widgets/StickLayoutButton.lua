module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0:GetDataSource()

		Engine.BEBBDFEICI(var_2_0.ref:GetValue(arg_1_1), arg_1_1)
		ACTIONS.LeaveMenu(arg_2_0)
	end)
end

function StickLayoutButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 40 * _1080p)

	var_3_0.id = "StickLayoutButton"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "GenericButton"

	var_3_4.Text:SetLeft(_1080p * 20, 0)
	var_3_4.Text:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_3_5()
		local var_4_0 = var_3_0:GetDataSource().name:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_4.Text:setText(var_4_0, 0)
		end
	end

	var_3_4:SubscribeToModelThroughElement(var_3_0, "name", var_3_5)
	var_3_0:addElement(var_3_4)

	var_3_0.GenericButton = var_3_4

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("StickLayoutButton", StickLayoutButton)
LockTable(_M)
