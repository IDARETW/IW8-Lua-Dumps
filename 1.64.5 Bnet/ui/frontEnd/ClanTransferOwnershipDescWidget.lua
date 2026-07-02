module(..., package.seeall)

function ClanTransferOwnershipDescWidget(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 903 * _1080p, 0, 424 * _1080p)

	var_1_0.id = "ClanTransferOwnershipDescWidget"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "TransferOwnerDesc1"

	var_1_4:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_OWNER_DESC_1"), 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -444.5, _1080p * 361.5, _1080p * -209, _1080p * -180)
	var_1_0:addElement(var_1_4)

	var_1_0.TransferOwnerDesc1 = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "TransferOwnerDesc2"

	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_OWNER_DESC_2"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -444.5, _1080p * 359.5, _1080p * -73, _1080p * -43)
	var_1_0:addElement(var_1_6)

	var_1_0.TransferOwnerDesc2 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "TransferOwnerDesc3"

	var_1_8:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_OWNER_DESC_3"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -445.5, _1080p * 359.5, _1080p * -28, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.TransferOwnerDesc3 = var_1_8

	return var_1_0
end

MenuBuilder.registerType("ClanTransferOwnershipDescWidget", ClanTransferOwnershipDescWidget)
LockTable(_M)
