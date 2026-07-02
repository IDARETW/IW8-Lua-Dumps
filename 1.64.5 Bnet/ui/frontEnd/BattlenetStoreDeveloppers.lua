module(..., package.seeall)

function BattlenetStoreDeveloppers(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalStackedLayout.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 616 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "BattlenetStoreDeveloppers"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(8 * _1080p)

	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "Published"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_4:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PUBLISHED_BY")), 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetWordWrap(false)
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 97, _1080p * -10, _1080p * 11)
	var_1_0:addElement(var_1_4)

	var_1_0.Published = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "ActivisionLogo"

	var_1_6:SetRGBFromInt(9143160, 0)
	var_1_6:setImage(RegisterMaterial("logo_activision"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 105, _1080p * 209, _1080p * -13, _1080p * 13)
	var_1_0:addElement(var_1_6)

	var_1_0.ActivisionLogo = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Developped"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_8:SetAlpha(0.6, 0)
	var_1_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/DEVELOPED_BY")), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 217, _1080p * 336, _1080p * -10, _1080p * 11)
	var_1_0:addElement(var_1_8)

	var_1_0.Developped = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "IWLogo"

	var_1_10:SetRGBFromInt(9143160, 0)
	var_1_10:setImage(RegisterMaterial("logo_infinityward_textonly"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 344, _1080p * 487, _1080p * -16, _1080p * 20)
	var_1_0:addElement(var_1_10)

	var_1_0.IWLogo = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "BeenoxLogo"

	var_1_12:SetRGBFromInt(9143160, 0)
	var_1_12:setImage(RegisterMaterial("logo_beenox"), 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 495, _1080p * 599, _1080p * -11, _1080p * 15)
	var_1_0:addElement(var_1_12)

	var_1_0.BeenoxLogo = var_1_12

	return var_1_0
end

MenuBuilder.registerType("BattlenetStoreDeveloppers", BattlenetStoreDeveloppers)
LockTable(_M)
