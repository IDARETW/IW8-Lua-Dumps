module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.OnlineCountLabel:setText(Engine.CBBHFCGDIC("CLANS/X_OF_Y_MEMBERS", tostring(arg_1_1), tostring(arg_1_2)))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetMembersOnlineCount = var_0_0
end

function ClanMemberListOnlineWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "ClanMemberListOnlineWidget"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Divider"

	var_3_4:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 8, _1080p * -8, _1080p * -2, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Divider = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "OnlineCountLabel"

	var_3_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("CLANS/X_OF_Y_MEMBERS"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Right)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 260, _1080p * 512, _1080p * 11, _1080p * 39)
	var_3_0:addElement(var_3_6)

	var_3_0.OnlineCountLabel = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Label"

	var_3_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("CLANS/WHOS_ONLINE"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 260, _1080p * 11, _1080p * 39)
	var_3_0:addElement(var_3_8)

	var_3_0.Label = var_3_8

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ClanMemberListOnlineWidget", ClanMemberListOnlineWidget)
LockTable(_M)
