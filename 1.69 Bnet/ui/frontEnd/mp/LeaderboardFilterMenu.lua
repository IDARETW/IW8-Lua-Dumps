module(..., package.seeall)

function LeaderboardFilterMenu(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0.id = "LeaderboardFilterMenu"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	var_1_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_1_1
	})
	var_1_0.HelperBar.id = "HelperBar"

	var_1_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_1_0.HelperBar:setPriority(10)
	var_1_0:addElement(var_1_0.HelperBar)

	local var_1_2 = var_1_0

	var_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_1_3 = LUI.UIBindButton.new()

	var_1_3.id = "selfBindButton"

	var_1_0:addElement(var_1_3)

	var_1_0.bindButton = var_1_3

	var_1_0.bindButton:addEventHandler("button_secondary", function(arg_2_0, arg_2_1)
		if not arg_2_1.controller then
			local var_2_0 = var_1_1
		end

		ACTIONS.LeaveMenu(var_1_0)
	end)

	return var_1_0
end

MenuBuilder.registerType("LeaderboardFilterMenu", LeaderboardFilterMenu)
LockTable(_M)
