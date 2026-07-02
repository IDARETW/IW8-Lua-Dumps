module(..., package.seeall)

function PreOrderBanner(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 413 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "PreOrderBanner"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(12754252, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 413, 0, _1080p * 30)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "UpgradeLabel"

	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/UPGRADE_ULTIMATE"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -206.5, _1080p * 206.5, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_6)

	var_1_0.UpgradeLabel = var_1_6

	return var_1_0
end

MenuBuilder.registerType("PreOrderBanner", PreOrderBanner)
LockTable(_M)
