module(..., package.seeall)

function MainMenuLogo(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1024 * _1080p, 0, 512 * _1080p)

	var_1_0.id = "MainMenuLogo"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Logo"

	var_1_4:setImage(RegisterMaterial("logo_main_menu_cod_mw"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -256, _1080p * 256)
	var_1_0:addElement(var_1_4)

	var_1_0.Logo = var_1_4

	return var_1_0
end

MenuBuilder.registerType("MainMenuLogo", MainMenuLogo)
LockTable(_M)
