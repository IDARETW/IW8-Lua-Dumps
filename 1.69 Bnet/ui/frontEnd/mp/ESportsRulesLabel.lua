module(..., package.seeall)

function ShowESportsRules(arg_1_0)
	arg_1_0.ESportsRulesLabel:setText(Engine.CBBHFCGDIC("PATCH_MENU/CDL_RULES_VERSION", MLG.GetRulesVersionNumber()))
end

function TryHideESportsRules(arg_2_0)
	if not MLG.AreMLGRulesEnabled() then
		arg_2_0.ESportsRulesLabel:setText("")
	end
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	if MLG.AreMLGRulesEnabled() then
		arg_3_0.ESportsRulesLabel:setText(Engine.CBBHFCGDIC("PATCH_MENU/CDL_RULES_VERSION", MLG.GetRulesVersionNumber()))
	else
		arg_3_0.ESportsRulesLabel:setText("")
	end

	arg_3_0.ShowESportsRules = ShowESportsRules
	arg_3_0.TryHideESportsRules = TryHideESportsRules
end

function ESportsRulesLabel(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "ESportsRulesLabel"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "ESportsRulesLabel"

	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:setTextStyle(CoD.TextStyle.Shadowed)
	var_4_4:SetAlignment(LUI.Alignment.Right)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 26)
	var_4_0:addElement(var_4_4)

	var_4_0.ESportsRulesLabel = var_4_4

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ESportsRulesLabel", ESportsRulesLabel)
LockTable(_M)
