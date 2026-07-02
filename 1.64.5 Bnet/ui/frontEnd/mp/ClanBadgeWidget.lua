module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Engine.JCBDICCAH(arg_1_1.clanTag)
	local var_1_1 = Engine.JCBDICCAH(arg_1_1.clanName)
	local var_1_2 = Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", var_1_0, var_1_1)

	arg_1_0.ClanTagAndName:setText(Engine.CBEAHDFCFC(var_1_2))
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.ClanStatusWidget:SetStatus(arg_2_1.clanStatus)
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1 then
		arg_3_0.ClanEmblemWidget:SetEmblem(arg_3_1.emblemData, false)
		var_0_0(arg_3_0, arg_3_1)
		var_0_1(arg_3_0, arg_3_1)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetClanData = var_0_2
end

function ClanBadgeWidget(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 140 * _1080p)

	var_5_0.id = "ClanBadgeWidget"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "ClanEmblemWidget"

	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 6, _1080p * 134)
	var_5_0:addElement(var_5_4)

	var_5_0.ClanEmblemWidget = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("ClanStatusWidget", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "ClanStatusWidget"

	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 140, _1080p * 560, _1080p * 74, _1080p * 106)
	var_5_0:addElement(var_5_6)

	var_5_0.ClanStatusWidget = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "ClanTagAndName"

	var_5_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 140, _1080p * 560, _1080p * 30, _1080p * 66)
	var_5_0:addElement(var_5_8)

	var_5_0.ClanTagAndName = var_5_8

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ClanBadgeWidget", ClanBadgeWidget)
LockTable(_M)
