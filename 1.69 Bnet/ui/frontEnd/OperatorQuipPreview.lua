module(..., package.seeall)

function OperatorQuipPreview(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 312 * _1080p, 0, 158 * _1080p)

	var_1_0.id = "OperatorQuipPreview"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "AudioVFX"

	var_1_4:setImage(RegisterMaterial("icon_chyron_fx"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -156, _1080p * 156, _1080p * -158, _1080p * -30)
	var_1_0:addElement(var_1_4)

	var_1_0.AudioVFX = var_1_4

	local var_1_5

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_1_6 = LUI.UIText.new()

		var_1_6.id = "SelectPrompt"

		var_1_6:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
		var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_QUIP_PREVIEW"), 0)
		var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_1_6:SetAlignment(LUI.Alignment.Left)
		var_1_6:SetTintFontIcons(true)
		var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 312, _1080p * 138, _1080p * 158)
		var_1_0:addElement(var_1_6)

		var_1_0.SelectPrompt = var_1_6
	end

	return var_1_0
end

MenuBuilder.registerType("OperatorQuipPreview", OperatorQuipPreview)
LockTable(_M)
