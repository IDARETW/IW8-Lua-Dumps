module(..., package.seeall)

function LockedWidget(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 136 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "LockedWidget"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Backer"

	var_1_4:SetRGBFromTable(SWATCHES.HUD.disabled, 0)
	var_1_4:SetAlpha(0.55, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 38, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Backer = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Text"

	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/LOCKED"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 41, _1080p * 29, _1080p * -11, _1080p * 11)
	var_1_0:addElement(var_1_6)

	var_1_0.Text = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Cap"

	var_1_8:SetRGBFromTable(SWATCHES.HUD.disabled, 0)
	var_1_8:SetAlpha(0.55, 0)
	var_1_8:setImage(RegisterMaterial("cac_equip_cap"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 8, _1080p * 38, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Cap = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Fill"

	var_1_10:SetRGBFromTable(SWATCHES.HUD.disabled, 0)
	var_1_10:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 30, 0, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.Fill = var_1_10

	return var_1_0
end

MenuBuilder.registerType("LockedWidget", LockedWidget)
LockTable(_M)
