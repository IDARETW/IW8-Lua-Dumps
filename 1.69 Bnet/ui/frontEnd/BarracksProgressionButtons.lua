module(..., package.seeall)

function BarracksProgressionButtons(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalList.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 319 * _1080p)

	var_1_0.id = "BarracksProgressionButtons"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(10 * _1080p)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "PrestigeButton"

	var_1_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_TITLE"), 0)
	var_1_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MENU_DESC"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
	var_1_0:addElement(var_1_4)

	var_1_0.PrestigeButton = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "PlayerUnlocksButton"

	var_1_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/UNLOCKS_TITLE"), 0)
	var_1_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/UNLOCKS_MENU_DESC"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 50, _1080p * 90)
	var_1_0:addElement(var_1_6)

	var_1_0.PlayerUnlocksButton = var_1_6

	var_1_4:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.controller or var_1_1

		ACTIONS.OpenMenu("PrestigeMenu", true, var_2_0)
	end)
	var_1_6:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.controller or var_1_1

		ACTIONS.OpenMenu("UnlocksMenu", true, var_3_0)
	end)

	return var_1_0
end

MenuBuilder.registerType("BarracksProgressionButtons", BarracksProgressionButtons)
LockTable(_M)
