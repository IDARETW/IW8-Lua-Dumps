module(..., package.seeall)

function MainMenuBladeList(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 466 * _1080p, 0, 182 * _1080p)

	var_1_0.id = "MainMenuBladeList"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "MenuBackerTop"

	var_1_4:SetAlpha(0.25, 0)
	var_1_4:setImage(RegisterMaterial("menu_backer"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 466, 0, _1080p * 140)
	var_1_0:addElement(var_1_4)

	var_1_0.MenuBackerTop = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "MenuBackerBottom"

	var_1_6:SetAlpha(0.25, 0)
	var_1_6:setImage(RegisterMaterial("menu_backer"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 466, _1080p * 42, _1080p * 182)
	var_1_0:addElement(var_1_6)

	var_1_0.MenuBackerBottom = var_1_6

	return var_1_0
end

MenuBuilder.registerType("MainMenuBladeList", MainMenuBladeList)
LockTable(_M)
