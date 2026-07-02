module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Engine.DDAEJCJEA()

	arg_1_0.XPBonus:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_XP_BONUS_TIP", tostring(var_1_0 * 100)))
end

function AARIGRXPBonusTip(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 800 * _1080p, 0, 200 * _1080p)

	var_2_0.id = "AARIGRXPBonusTip"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "XPBonus"

	var_2_4:SetRGBFromTable(SWATCHES.AAR.IGRXPBoost, 0)
	var_2_4:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_XP_BONUS_TIP"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_4:SetAlignment(LUI.Alignment.Center)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -944, _1080p * 944, _1080p * 130, _1080p * 180)
	var_2_0:addElement(var_2_4)

	var_2_0.XPBonus = var_2_4

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("AARIGRXPBonusTip", AARIGRXPBonusTip)
LockTable(_M)
