module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._controllerIndex = arg_1_1

	local var_1_0 = arg_1_2.invitationData

	assert(var_1_0)
	arg_1_0.ClanInviteHeader:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_1_0.clanTag), Engine.JCBDICCAH(var_1_0.clanName)))
	arg_1_0.ClanIcon:setImage(RegisterMaterial(var_1_0.clanIcon or "icon_currency_codpoints"))
end

function ClanInviteActionPopup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "ClanInviteActionPopup"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "ClanInviteHeader"

	var_2_4:setText("Sample Clan", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_4:SetAlignment(LUI.Alignment.Center)
	var_2_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 235, _1080p * 285)
	var_2_0:addElement(var_2_4)

	var_2_0.ClanInviteHeader = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("SocialPlayerActions", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "PlayerActions"

	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -223.5, _1080p * 348.5, _1080p * -219, _1080p * 481)
	var_2_0:addElement(var_2_6)

	var_2_0.PlayerActions = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "ClanIcon"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 348, _1080p * 476, _1080p * 81, _1080p * 209)
	var_2_0:addElement(var_2_8)

	var_2_0.ClanIcon = var_2_8

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ClanInviteActionPopup", ClanInviteActionPopup)
LockTable(_M)
