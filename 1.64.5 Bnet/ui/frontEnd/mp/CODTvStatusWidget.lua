module(..., package.seeall)

function CODTvStatusWidget(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 701 * _1080p, 0, 188 * _1080p)

	var_1_0.id = "CODTvStatusWidget"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "Text"

	var_1_4:setText(Engine.CBBHFCGDIC("CODTV/ERROR_MSG"), 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Center)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 635, _1080p * 64, _1080p * 106)
	var_1_0:addElement(var_1_4)

	var_1_0.Text = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "ErrorIcon"

	var_1_6:setImage(RegisterMaterial("hud_icon_warning"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 318.5, _1080p * 382.5, 0, _1080p * 64)
	var_1_0:addElement(var_1_6)

	var_1_0.ErrorIcon = var_1_6

	return var_1_0
end

MenuBuilder.registerType("CODTvStatusWidget", CODTvStatusWidget)
LockTable(_M)
