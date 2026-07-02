module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = CLANS.CLAN_PRIVACY_LEVEL_STRINGS[arg_1_1]
	local var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_LABEL_AND_VALUE", var_1_0)

	if arg_1_2 and arg_1_2.isUpperCase then
		var_1_1 = Engine.CBEAHDFCFC(var_1_1)
	end

	arg_1_0.ClanPrivacyLabel:setText(var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1 and arg_2_1.clanPrivacyLevel or CLANS.CLAN_PRIVACY_LEVEL.INVALID

	var_0_0(arg_2_0, var_2_0, arg_2_2)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0.SetClanPrivacy = var_0_0
	arg_3_0.SetClanPrivacyFromClanData = var_0_1
end

function ClanPrivacyWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 384 * _1080p, 0, 28 * _1080p)

	var_4_0.id = "ClanPrivacyWidget"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "ClanPrivacyLabel"

	var_4_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_LABEL_AND_VALUE"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 2, _1080p * -2)
	var_4_0:addElement(var_4_6)

	var_4_0.ClanPrivacyLabel = var_4_6

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ClanPrivacyWidget", ClanPrivacyWidget)
LockTable(_M)
