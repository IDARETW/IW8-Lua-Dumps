module(..., package.seeall)

function CDLRestricted(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 353 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "CDLRestricted"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Gradient"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_1_4:SetAlpha(0.3, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 353, 0, _1080p * 30)
	var_1_0:addElement(var_1_4)

	var_1_0.Gradient = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Warning"

	var_1_6:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 32, 0, _1080p * 30)
	var_1_0:addElement(var_1_6)

	var_1_0.Warning = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Label"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_1_8:setText(Engine.CBBHFCGDIC("LUA_MENU/CDL_RESTRICTED"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 35, _1080p * 440, _1080p * 5, _1080p * 25)
	var_1_0:addElement(var_1_8)

	var_1_0.Label = var_1_8

	return var_1_0
end

MenuBuilder.registerType("CDLRestricted", CDLRestricted)
LockTable(_M)
