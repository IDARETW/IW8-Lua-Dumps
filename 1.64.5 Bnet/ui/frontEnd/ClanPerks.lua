module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.perkIndex + 1
	local var_1_1 = "LUA_MENU/CLAN_PERK_" .. tostring(var_1_0)

	arg_1_0.LabelHeader:setText(Engine.CBBHFCGDIC(var_1_1))
	arg_1_0.LabelMinorHeader:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PERK_INFO"))
	arg_1_0.LabelDescription:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PERK_LEVEL", tostring(arg_1_1.perkPercentData[var_1_0])))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controlllerIndex = arg_2_1
	arg_2_0.DisplayPerkData = var_0_0
end

function ClanPerks(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 350 * _1080p)

	var_3_0.id = "ClanPerks"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "PerkIcon"

	var_3_4:setImage(RegisterMaterial("fire_rate_2round"), 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 30, _1080p * 158)
	var_3_0:addElement(var_3_4)

	var_3_0.PerkIcon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "LabelHeader"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 170, _1080p * 194)
	var_3_0:addElement(var_3_6)

	var_3_0.LabelHeader = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "LabelMinorHeader"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 205, _1080p * 223)
	var_3_0:addElement(var_3_8)

	var_3_0.LabelMinorHeader = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "LabelDescription"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 252, _1080p * 276)
	var_3_0:addElement(var_3_10)

	var_3_0.LabelDescription = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ClanPerks", ClanPerks)
LockTable(_M)
