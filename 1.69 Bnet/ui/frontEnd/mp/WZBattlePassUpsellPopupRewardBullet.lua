module(..., package.seeall)

function WZBattlePassUpsellPopupRewardBullet(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 55 * _1080p)

	var_1_0.id = "WZBattlePassUpsellPopupRewardBullet"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "SubTitle"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_4:setText("", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 400, _1080p * 24, _1080p * 44)
	var_1_0:addElement(var_1_4)

	var_1_0.SubTitle = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Bullet"

	var_1_6:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_1_6:SetScale(-0.5, 0)
	var_1_6:setImage(RegisterMaterial("bullet_point_diamond"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 16, _1080p * 4, _1080p * 20)
	var_1_0:addElement(var_1_6)

	var_1_0.Bullet = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Title"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 401, 0, _1080p * 24)
	var_1_0:addElement(var_1_8)

	var_1_0.Title = var_1_8

	return var_1_0
end

MenuBuilder.registerType("WZBattlePassUpsellPopupRewardBullet", WZBattlePassUpsellPopupRewardBullet)
LockTable(_M)
