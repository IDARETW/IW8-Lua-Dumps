module(..., package.seeall)

function WarzonePrivateMatchPlayMenuButtons(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalStackedLayout.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 300 * _1080p)

	var_1_0.id = "WarzonePrivateMatchPlayMenuButtons"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchPlayButton", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "WarzonePrivateMatchPlayButton"

	var_1_4.Description:setText("", 0)
	var_1_4.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 130)
	var_1_0:addElement(var_1_4)

	var_1_0.WarzonePrivateMatchPlayButton = var_1_4

	return var_1_0
end

MenuBuilder.registerType("WarzonePrivateMatchPlayMenuButtons", WarzonePrivateMatchPlayMenuButtons)
LockTable(_M)
