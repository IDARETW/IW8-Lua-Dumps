module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/CLAN_MEMBER_COUNT", arg_1_1, arg_1_2)

	if arg_1_3 and arg_1_3.isUpperCase then
		var_1_0 = Engine.CBEAHDFCFC(var_1_0)
	end

	arg_1_0.MemberCountLabel:setText(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1 and arg_2_1.numClanMembers or CLANS.MIN_NUM_CLAN_MEMBERS
	local var_2_1 = arg_2_1 and arg_2_1.numClanMembersMax or CLANS.MAX_NUM_CLAN_MEMBERS

	var_0_0(arg_2_0, var_2_0, var_2_1, arg_2_2)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetMemberCount = var_0_0
	arg_3_0.SetMemberCountFromClanData = var_0_1
end

function ClanMemberCountWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 384 * _1080p, 0, 28 * _1080p)

	var_4_0.id = "ClanMemberCountWidget"

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

	var_4_6.id = "MemberCountLabel"

	var_4_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_MEMBER_COUNT"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 2, _1080p * -2)
	var_4_0:addElement(var_4_6)

	var_4_0.MemberCountLabel = var_4_6

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ClanMemberCountWidget", ClanMemberCountWidget)
LockTable(_M)
