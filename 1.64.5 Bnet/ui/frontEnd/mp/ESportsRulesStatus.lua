module(..., package.seeall)

function UpdateVisibility(arg_1_0)
	if MLG.AreMLGRulesEnabled() then
		arg_1_0:SetAlpha(1)
	else
		arg_1_0:SetAlpha(0)
	end
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	UpdateVisibility(arg_2_0)

	arg_2_0.UpdateVisibility = UpdateVisibility

	arg_2_0.CWLRulesText:setText(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CDL_RULES", "LUA_MENU_MP/ENABLED")))
end

function ESportsRulesStatus(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 25 * _1080p)

	var_3_0.id = "ESportsRulesStatus"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "CWLRulesText"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -9.5, _1080p * 9.5)
	var_3_0:addElement(var_3_6)

	var_3_0.CWLRulesText = var_3_6

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ESportsRulesStatus", ESportsRulesStatus)
LockTable(_M)
