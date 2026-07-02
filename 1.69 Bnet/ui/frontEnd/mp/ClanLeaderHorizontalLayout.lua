module(..., package.seeall)

local var_0_0 = 8
local var_0_1 = 0

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0:GetCurrentAnchorsAndPositions().right / _1080p
	local var_1_1 = LAYOUT.GetElementWidth(arg_1_0) / _1080p
	local var_1_2 = LAYOUT.GetRawTextWidth(arg_1_0.Label, var_0_1, arg_1_1)
	local var_1_3 = arg_1_0.ClanGamerTagWidget:GetRawWidth() + var_1_2 + var_0_0
	local var_1_4 = math.abs(var_1_1 - var_1_3) / 2 + var_1_2
	local var_1_5 = var_0_0 / 2

	arg_1_0.Label:SetRight(_1080p * (var_1_4 - var_1_5))
	arg_1_0.ClanGamerTagWidget:SetLeft(_1080p * (var_1_4 + var_1_5))
	arg_1_0.ClanGamerTagWidget:SetRight(_1080p * var_1_0)
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = CLANS.GetClanOwnerPlayerData(arg_2_0._controllerIndex, arg_2_1)

	arg_2_0.ClanGamerTagWidget:SetupPlayerData(var_2_0)
	var_0_2(arg_2_0, arg_2_0._controllerIndex)
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0.SetClanData = var_0_3
end

function ClanLeaderHorizontalLayout(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 826 * _1080p, 0, 40 * _1080p)

	var_4_0.id = "ClanLeaderHorizontalLayout"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIStyledText.new()

	var_4_4.id = "Label"

	var_4_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_4:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_LEADER_HEADER"), 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_4:SetAlignment(LUI.Alignment.Right)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 361, _1080p * 5, _1080p * 35)
	var_4_0:addElement(var_4_4)

	var_4_0.Label = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("ClanGamerTagWidget", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "ClanGamerTagWidget"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 369, _1080p * 872, 0, _1080p * 40)
	var_4_0:addElement(var_4_6)

	var_4_0.ClanGamerTagWidget = var_4_6

	var_0_4(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ClanLeaderHorizontalLayout", ClanLeaderHorizontalLayout)
LockTable(_M)
