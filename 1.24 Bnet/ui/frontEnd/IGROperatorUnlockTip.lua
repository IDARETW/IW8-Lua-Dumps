module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:setPriority(11)
end

function IGROperatorUnlockTip(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 70 * _1080p)

	var_2_0.id = "IGROperatorUnlockTip"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Icon"

	var_2_4:setImage(RegisterMaterial("icon_igr_operator_unlock_all"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 26, _1080p * 62, _1080p * 16, _1080p * 52)
	var_2_0:addElement(var_2_4)

	var_2_0.Icon = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Desc"

	var_2_6:SetRGBFromTable(SWATCHES.MainMenu.IGRBonusText, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_OPERATOR_TIP"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 67, _1080p * 574, _1080p * 22, _1080p * 46)
	var_2_0:addElement(var_2_6)

	var_2_0.Desc = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("IGROperatorUnlockTip", IGROperatorUnlockTip)
LockTable(_M)
