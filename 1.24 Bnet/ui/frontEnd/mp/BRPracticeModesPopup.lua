module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE_MODES"))
end

function BRPracticeModesPopup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "BRPracticeModesPopup"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:setUseStencil(true)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "MenuTitle"

	var_2_4.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE_MODES"), 0)
	var_2_4.Line:SetLeft(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_2_0:addElement(var_2_4)

	var_2_0.MenuTitle = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("BRPracticeModesPopupButtons", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "Buttons"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 525, _1080p * 157, _1080p * 557)
	var_2_0:addElement(var_2_6)

	var_2_0.Buttons = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BRPracticeModesPopup", BRPracticeModesPopup)
LockTable(_M)
