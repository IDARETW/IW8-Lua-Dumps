module(..., package.seeall)

function WeaponPrestigeLabel(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -143 * _1080p, 143 * _1080p, -25 * _1080p, 25 * _1080p)

	var_1_0.id = "WeaponPrestigeLabel"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "PrestigeWeaponLabel"

	var_1_4:setText(Engine.CBBHFCGDIC("CAS/PRESTIGE_WEAPON"), 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 286, _1080p * 11, _1080p * 39)
	var_1_0:addElement(var_1_4)

	var_1_0.PrestigeWeaponLabel = var_1_4

	return var_1_0
end

MenuBuilder.registerType("WeaponPrestigeLabel", WeaponPrestigeLabel)
LockTable(_M)
