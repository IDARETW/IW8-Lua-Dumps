module(..., package.seeall)

function LobbyFocusArrow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_1_0.id = "LobbyFocusArrow"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Glow"

	var_1_4:SetRGBFromTable(SWATCHES.Global.keyColorDark, 0)
	var_1_4:SetAlpha(0.3, 0)
	var_1_4:setImage(RegisterMaterial("triangle_glow"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -22, _1080p * 22)
	var_1_0:addElement(var_1_4)

	var_1_0.Glow = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Arrow"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_6:setImage(RegisterMaterial("ui_arrow"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -6, _1080p * 18)
	var_1_0:addElement(var_1_6)

	var_1_0.Arrow = var_1_6

	return var_1_0
end

MenuBuilder.registerType("LobbyFocusArrow", LobbyFocusArrow)
LockTable(_M)
