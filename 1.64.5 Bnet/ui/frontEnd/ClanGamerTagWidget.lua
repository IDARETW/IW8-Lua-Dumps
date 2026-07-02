module(..., package.seeall)

local var_0_0 = 6
local var_0_1 = 0
local var_0_2 = 0

local function var_0_3(arg_1_0)
	local var_1_0 = LAYOUT.GetElementWidth(arg_1_0.Rank) / _1080p
	local var_1_1 = LAYOUT.GetRawTextWidth(arg_1_0.Rank, var_0_1, arg_1_0._controllerIndex)

	if var_1_0 < var_1_1 then
		var_1_0 = var_1_1
	end

	local var_1_2 = LAYOUT.GetRawTextWidth(arg_1_0.ClanTagAndName, var_0_2, arg_1_0._controllerIndex)

	return var_1_0 + LAYOUT.GetElementWidth(arg_1_0.RankIcon) / _1080p + var_1_2 + 2 * var_0_0
end

local function var_0_4(arg_2_0, arg_2_1)
	arg_2_0.Rank:setText(arg_2_1._rank, 0)
	arg_2_0.RankIcon:setImage(RegisterMaterial(arg_2_1._rankIcon), 0)
	arg_2_0.ClanTagAndName:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(arg_2_1._clanTag), Engine.JCBDICCAH(arg_2_1._gamerTag)))
	arg_2_0.Rank:SetRGBFromTable(arg_2_1._prestigeMasterColor)
end

local function var_0_5(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0.GetRawWidth = var_0_3
	arg_3_0.SetupPlayerData = var_0_4
end

function ClanGamerTagWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 545 * _1080p, 0, 40 * _1080p)

	var_4_0.id = "ClanGamerTagWidget"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "Rank"

	var_4_4:setText("999", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_4:SetAlignment(LUI.Alignment.Right)
	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 22, _1080p * 61, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_4)

	var_4_0.Rank = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "RankIcon"

	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 65, _1080p * 101, _1080p * -18, _1080p * 18)
	var_4_0:addElement(var_4_6)

	var_4_0.RankIcon = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "ClanTagAndName"

	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 106, _1080p * 518, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_8)

	var_4_0.ClanTagAndName = var_4_8

	var_0_5(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ClanGamerTagWidget", ClanGamerTagWidget)
LockTable(_M)
