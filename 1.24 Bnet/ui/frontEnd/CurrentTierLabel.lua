module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = BATTLEPASS.GetTier(arg_1_1)

	arg_1_0.TierLabel:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER", var_1_0))
end

function CurrentTierLabel(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "CurrentTierLabel"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "TierLabel"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_4:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 30)
	var_2_0:addElement(var_2_4)

	var_2_0.TierLabel = var_2_4

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CurrentTierLabel", CurrentTierLabel)
LockTable(_M)
