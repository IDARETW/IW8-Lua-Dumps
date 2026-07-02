module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Engine.JCBDICCAH(arg_1_1.clanTag)
	local var_1_1 = Engine.JCBDICCAH(arg_1_1.clanName)
	local var_1_2 = Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", var_1_0, var_1_1)

	arg_1_0.ClanNameLabel:setText(Engine.CBEAHDFCFC(var_1_2))
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.ClanLeaderHorizontalLayout:SetClanData(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1)
	if CLANS.IsClanDescriptionEnabled() then
		local var_3_0 = arg_3_1 and Engine.JCBDICCAH(arg_3_1.clanDescription)

		arg_3_0.ClanDescription:setText(var_3_0)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 and arg_4_1.labels or nil

	arg_4_0.ClanLabelsWidget:SetLabels(var_4_0)
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0.ClanEmblemWidget:SetEmblem(arg_5_1.emblemData, true)
	var_0_0(arg_5_0, arg_5_1)
	var_0_1(arg_5_0, arg_5_1)
	arg_5_0.ClanMemberCountAndPrivacyLayout:SetClanData(arg_5_1)
	var_0_2(arg_5_0, arg_5_1)
	var_0_3(arg_5_0, arg_5_1)
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetClanData = var_0_4

	var_0_3(arg_6_0, nil)
end

function ClanInfoDetailsLayout(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalStackedLayout.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 826 * _1080p, 0, 610 * _1080p)

	var_7_0.id = "ClanInfoDetailsLayout"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(12 * _1080p)

	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "ClanEmblemWidget"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 285, _1080p * 541, 0, _1080p * 256)
	var_7_0:addElement(var_7_4)

	var_7_0.ClanEmblemWidget = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIStyledText.new()

	var_7_6.id = "ClanNameLabel"

	var_7_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_7_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL"), 0)
	var_7_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_6:SetAlignment(LUI.Alignment.Center)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 826, _1080p * 268, _1080p * 318)
	var_7_0:addElement(var_7_6)

	var_7_0.ClanNameLabel = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("ClanLeaderHorizontalLayout", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "ClanLeaderHorizontalLayout"

	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 826, _1080p * 330, _1080p * 370)
	var_7_0:addElement(var_7_8)

	var_7_0.ClanLeaderHorizontalLayout = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("ClanMemberCountAndPrivacyLayout", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "ClanMemberCountAndPrivacyLayout"

	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 826, _1080p * 382, _1080p * 410)
	var_7_0:addElement(var_7_10)

	var_7_0.ClanMemberCountAndPrivacyLayout = var_7_10

	local var_7_11

	if not CONDITIONS.AreClanDescriptionsDisabled() then
		local var_7_12 = LUI.UIStyledText.new()

		var_7_12.id = "ClanDescription"

		var_7_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
		var_7_12:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_DESCRIPTION_DEBUG"), 0)
		var_7_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_7_12:SetAlignment(LUI.Alignment.Center)
		var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 713, _1080p * 422, _1080p * 446)
		var_7_0:addElement(var_7_12)

		var_7_0.ClanDescription = var_7_12
	end

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("ClanLabelsWidget", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "ClanLabelsWidget"

	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 826, _1080p * 506, _1080p * 581)
	var_7_0:addElement(var_7_14)

	var_7_0.ClanLabelsWidget = var_7_14

	var_0_5(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("ClanInfoDetailsLayout", ClanInfoDetailsLayout)
LockTable(_M)
