module(..., package.seeall)

function RestrictionLoadoutWarning(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "RestrictionLoadoutWarning"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "RestrictionWarning"

	var_1_4:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 30, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_4)

	var_1_0.RestrictionWarning = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Label"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CDL_LOADOUT_WARNING"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 360, _1080p * 5, _1080p * 25)
	var_1_0:addElement(var_1_6)

	var_1_0.Label = var_1_6

	return var_1_0
end

MenuBuilder.registerType("RestrictionLoadoutWarning", RestrictionLoadoutWarning)
LockTable(_M)
