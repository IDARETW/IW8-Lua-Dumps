module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.MenuTitle)
	assert(arg_1_0.HelperBar)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARDS_CAPS"))

	if Engine.ECHCFGDDDF() then
		local var_1_0 = LUI.UIElement.new({
			worldBlur = 5
		})

		var_1_0:setupWorldBlur()

		var_1_0.id = "blur"

		arg_1_0:addElement(var_1_0)
	end
end

function LeaderboardSelectMenu(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "LeaderboardSelectMenu"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	var_2_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})
	var_2_0.HelperBar.id = "HelperBar"

	var_2_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_2_0.HelperBar:setPriority(10)
	var_2_0:addElement(var_2_0.HelperBar)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "MenuTitle"

	var_2_4.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARDS_CAPS"), 0)
	var_2_4.Line:SetLeft(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_2_0:addElement(var_2_4)

	var_2_0.MenuTitle = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("LeaderboardMenuButtonList", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "LeaderboardMenuButtonList"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 185, _1080p * 733)
	var_2_0:addElement(var_2_6)

	var_2_0.LeaderboardMenuButtonList = var_2_6

	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_2_7 = LUI.UIBindButton.new()

	var_2_7.id = "selfBindButton"

	var_2_0:addElement(var_2_7)

	var_2_0.bindButton = var_2_7

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LeaderboardSelectMenu", LeaderboardSelectMenu)
LockTable(_M)
