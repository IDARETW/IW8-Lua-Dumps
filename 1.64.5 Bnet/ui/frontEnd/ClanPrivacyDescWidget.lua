module(..., package.seeall)

function ClanPrivacyDescWidget(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 913 * _1080p, 0, 426 * _1080p)

	var_1_0.id = "ClanPrivacyDescWidget"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "ClanPrivacyOpen"

	var_1_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_OPEN")), 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -445.5, _1080p * 358.5, _1080p * -212, _1080p * -182)
	var_1_0:addElement(var_1_4)

	var_1_0.ClanPrivacyOpen = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "ClanPrivacyOpenDesc"

	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_OPEN_DESC"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -445.5, _1080p * 359.5, _1080p * -182, _1080p * -154)
	var_1_0:addElement(var_1_6)

	var_1_0.ClanPrivacyOpenDesc = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "ClanPrivacyRequestToJoin"

	var_1_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_REQUEST_TO_JOIN")), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -445.5, _1080p * 418.5, _1080p * -117, _1080p * -87)
	var_1_0:addElement(var_1_8)

	var_1_0.ClanPrivacyRequestToJoin = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "ClanPrivacyRequestToJoinDesc"

	var_1_10:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_REQUEST_TO_JOIN_DESC"), 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -445.5, _1080p * 418.5, _1080p * -87, _1080p * -59)
	var_1_0:addElement(var_1_10)

	var_1_0.ClanPrivacyRequestToJoinDesc = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIText.new()

	var_1_12.id = "ClanPrivacyOpenCopy1"

	var_1_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_INVITE_ONLY")), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -446.5, _1080p * 418.5, _1080p * 10, _1080p * 40)
	var_1_0:addElement(var_1_12)

	var_1_0.ClanPrivacyOpenCopy1 = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "ClanPrivacyOpenDescCopy1"

	var_1_14:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_INVITE_ONLY_DESC"), 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -446.5, _1080p * 418.5, _1080p * 40, _1080p * 68)
	var_1_0:addElement(var_1_14)

	var_1_0.ClanPrivacyOpenDescCopy1 = var_1_14

	return var_1_0
end

MenuBuilder.registerType("ClanPrivacyDescWidget", ClanPrivacyDescWidget)
LockTable(_M)
