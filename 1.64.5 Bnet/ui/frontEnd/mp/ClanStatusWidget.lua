module(..., package.seeall)

local var_0_0 = {
	[CLANS.CLAN_STATUS.UNKNOWN] = {
		text = "LUA_MENU/CLAN_STATUS_UNKNOWN",
		icon = "icon_bnet_unknown",
		iconColor = SWATCHES.BattleNetChat.onlineStatusUnknown
	},
	[CLANS.CLAN_STATUS.ACTIVE] = {
		text = "LUA_MENU/CLAN_STATUS_ACTIVE",
		icon = "icon_bnet_available",
		iconColor = SWATCHES.BattleNetChat.onlineStatusAvailable
	},
	[CLANS.CLAN_STATUS.INACTIVE] = {
		text = "LUA_MENU/CLAN_STATUS_INACTIVE",
		icon = "icon_bnet_busy",
		iconColor = SWATCHES.BattleNetChat.onlineStatusBusy
	}
}

local function var_0_1(arg_1_0, arg_1_1)
	return var_0_0[arg_1_1] and arg_1_1 or CLANS.CLAN_STATUS.UNKNOWN
end

local function var_0_2(arg_2_0)
	local var_2_0 = var_0_0[arg_2_0._status]

	arg_2_0.StatusIcon:setImage(RegisterMaterial(var_2_0.icon))
	arg_2_0.StatusIcon:SetRGBFromTable(var_2_0.iconColor)
end

local function var_0_3(arg_3_0)
	local var_3_0 = var_0_0[arg_3_0._status].text

	arg_3_0.StatusLabel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_3_0)))
end

local function var_0_4(arg_4_0, arg_4_1)
	arg_4_0._status = var_0_1(arg_4_0, arg_4_1)

	var_0_2(arg_4_0)
	var_0_3(arg_4_0)
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetStatus = var_0_4

	var_0_4(arg_5_0, CLANS.CLAN_STATUS.UNKNOWN)
end

function ClanStatusWidget(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 32 * _1080p)

	var_6_0.id = "ClanStatusWidget"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "StatusIcon"

	var_6_4:SetRGBFromTable(SWATCHES.BattleNetChat.onlineStatusUnknown, 0)
	var_6_4:setImage(RegisterMaterial("icon_bnet_unknown"), 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_6_0:addElement(var_6_4)

	var_6_0.StatusIcon = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "StatusLabel"

	var_6_6:SetRGBFromTable(SWATCHES.BattleNetChat.onlineStatusUnknown, 0)
	var_6_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_STATUS_UNKNOWN"), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 420, _1080p * 4, _1080p * 28)
	var_6_0:addElement(var_6_6)

	var_6_0.StatusLabel = var_6_6

	var_0_5(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ClanStatusWidget", ClanStatusWidget)
LockTable(_M)
