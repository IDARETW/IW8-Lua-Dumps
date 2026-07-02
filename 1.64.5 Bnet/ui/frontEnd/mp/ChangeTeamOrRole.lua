module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Text)
	assert(arg_1_0.LeftButtonIcon)

	local var_1_0 = CoD.TextSettings.ButtonHelperFont

	arg_1_0.Text:SetFont(var_1_0.Font)
	arg_1_0.LeftButtonIcon:SetFont(var_1_0.Font)

	if not Engine.HDGDBCJFG() then
		arg_1_0.LeftButtonIcon:SetRGBFromTable(COLORS.white)
	end

	arg_1_0.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MPUI/CHANGE_TEAM")))
	arg_1_0.LeftButtonIcon:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT1_BUTTON")))
end

function ChangeTeamOrRole(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "ChangeTeamOrRole"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "LeftButtonIcon"

	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 40, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_4)

	var_2_0.LeftButtonIcon = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "Text"

	var_2_6:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 50, 0, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_6)

	var_2_0.Text = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ChangeTeamOrRole", ChangeTeamOrRole)
LockTable(_M)
