module(..., package.seeall)

function PerkUpdateDesc(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 527 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "PerkUpdateDesc"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Divider"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -20, 0, _1080p * 1)
	var_1_0:addElement(var_1_4)

	var_1_0.Divider = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Title"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/PERK_UPDATES_TITLE"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 495, _1080p * 8, _1080p * 44)
	var_1_0:addElement(var_1_6)

	var_1_0.Title = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Desc"

	var_1_8:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 495, _1080p * 50, _1080p * 72)
	var_1_0:addElement(var_1_8)

	var_1_0.Desc = var_1_8

	return var_1_0
end

MenuBuilder.registerType("PerkUpdateDesc", PerkUpdateDesc)
LockTable(_M)
