module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1, "You need to provide a weapon ref in order to display the Favorite Weapon.")
	arg_1_0.FavoriteWeaponTitleLabel:setText(WEAPON.GetName(arg_1_1))
	arg_1_0.Icon:setImage(RegisterMaterial(WEAPON.GetImage(arg_1_1)))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetWeaponDataByRef = var_0_0
end

function WZOperatorInfoBioDetailWeapon(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 256 * _1080p)

	var_3_0.id = "WZOperatorInfoBioDetailWeapon"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "FavoriteWeaponLabel"

	var_3_4:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FAVORITE_WEAPON")), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 18)
	var_3_0:addElement(var_3_4)

	var_3_0.FavoriteWeaponLabel = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "FavoriteWeaponTitleLabel"

	var_3_6:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/FAVORITE_WEAPON"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 18, _1080p * 48)
	var_3_0:addElement(var_3_6)

	var_3_0.FavoriteWeaponTitleLabel = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Icon"

	var_3_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_8:setImage(RegisterMaterial("icon_weapon_ar_akilo47"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 256, _1080p * 58, _1080p * 186)
	var_3_0:addElement(var_3_8)

	var_3_0.Icon = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "BonusXPIcon"

	var_3_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_3_10:setImage(RegisterMaterial("icon_xp"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 64, _1080p * 186, _1080p * 245)
	var_3_0:addElement(var_3_10)

	var_3_0.BonusXPIcon = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "BonusXPLabel"

	var_3_12:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_3_12:setText(Engine.CBBHFCGDIC("LUA_MENU/BONUS_WEAPON_XP"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetWordWrap(false)
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 74, 0, _1080p * 203, _1080p * 227)
	var_3_0:addElement(var_3_12)

	var_3_0.BonusXPLabel = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZOperatorInfoBioDetailWeapon", WZOperatorInfoBioDetailWeapon)
LockTable(_M)
